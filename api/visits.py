"""
visits.py — the S504 visit counter's beacon. POST /v1/visit, always 204.

Design: S504_VISIT_COUNTER_DESIGN.md. Called once per page load by the PWA
(app/src/lib/visit.ts) and by the walk site's page script (walk/build.mjs).
Writes ONE visit_events row per visit: a second call from the same reader on
the same surface inside 30 quiet minutes writes nothing (the S467 rule).

Who the row names. If the request carries a valid ``rop_jwt`` the row gets the
local ``users.id`` and the anon_id is DROPPED. Otherwise it gets
``sha256(ANON_SALT + anon_id)`` — the browser's random UUID (localStorage, not
a cookie) salted with a Render env var the database never sees, so nothing
stored here walks back to a browser, even for us. No IP, no user agent, no
query string (search terms never land); only the pathname and, when the path
carries them, edition / book / chapter of the reader page.

Never raises to the client: every failure is swallowed and the response is
still 204 — the counter must never slow or break a page.
"""

from __future__ import annotations

import hashlib
import logging
import os
import re
from typing import Literal, Optional
from urllib.parse import parse_qs, urlsplit

from fastapi import APIRouter, Depends, Request, Response
from pydantic import BaseModel, Field

from auth import User, get_current_user_optional
from db import get_pool, upsert_user

logger = logging.getLogger("visits")
router = APIRouter()

_SALT_WARNED = False
_UUID_RE = re.compile(r"^[0-9a-fA-F-]{8,64}$")
_SLUG_RE = re.compile(r"^[a-z0-9-]{1,64}$")


class VisitIn(BaseModel):
    anon_id: Optional[str] = Field(default=None, max_length=64)
    surface: Literal["app", "walk"]
    path: Optional[str] = Field(default=None, max_length=1024)


# One row per reader per surface per 30 minutes. $1 user uuid (or NULL), $2 anon hash (or NULL).
INSERT_VISIT_SQL = (
    "INSERT INTO visit_events (user_id, anon_id, surface, path, edition, book, chapter) "
    "SELECT $1::uuid, $2::text, $3::text, $4::text, $5::text, $6::text, $7::int "
    " WHERE NOT EXISTS ("
    "   SELECT 1 FROM visit_events v "
    "    WHERE v.surface = $3::text AND v.ts > now() - interval '30 minutes' "
    "      AND ((  $1::uuid IS NOT NULL AND v.user_id = $1::uuid) "
    "        OR ( $1::uuid IS NULL     AND v.anon_id = $2::text)))"
)


def hash_anon(anon_id: str) -> Optional[str]:
    """sha256(ANON_SALT + anon_id), hex. None when the salt is not set (then
    nothing anonymous is stored — we never store an unsalted id)."""
    global _SALT_WARNED
    salt = os.environ.get("ANON_SALT", "")
    if not salt:
        if not _SALT_WARNED:
            logger.warning("ANON_SALT is not set — anonymous visits are not being counted.")
            _SALT_WARNED = True
        return None
    return hashlib.sha256((salt + anon_id).encode("utf-8")).hexdigest()


def split_path(raw: Optional[str]):
    """(pathname, edition, book, chapter) — the query string itself is never kept;
    only ?edition= ?book= ?chapter= are read, as the reader deep link writes them."""
    if not raw:
        return None, None, None, None
    parts = urlsplit(raw if raw.startswith("/") else "/" + raw)
    pathname = parts.path[:300]
    q = parse_qs(parts.query)
    edition = (q.get("edition") or [None])[0]
    book = (q.get("book") or [None])[0]
    chap = (q.get("chapter") or [None])[0]
    edition = edition if edition and _SLUG_RE.match(edition) else None
    book = book if book and _SLUG_RE.match(book) else None
    chapter = int(chap) if chap and chap.isdigit() and 0 < int(chap) < 1000 else None
    return pathname, edition, book, chapter


async def record_visit(
    user: Optional[User], anon_id: Optional[str], surface: str, path: Optional[str]
) -> None:
    pathname, edition, book, chapter = split_path(path)
    pool = get_pool()
    async with pool.acquire() as conn:
        user_uuid: Optional[str] = None
        if user is not None:
            user_uuid = await conn.fetchval(
                "SELECT id::text FROM users WHERE wordpress_user_id = $1", int(user.id)
            )
            if user_uuid is None:  # first time this account reaches the API
                user_uuid = await upsert_user(conn, user)
        anon_hash = None
        if user_uuid is None:
            if not anon_id or not _UUID_RE.match(anon_id):
                return
            anon_hash = hash_anon(anon_id)
            if anon_hash is None:
                return
        await conn.execute(
            INSERT_VISIT_SQL, user_uuid, anon_hash, surface, pathname, edition, book, chapter
        )


@router.post("/v1/visit", status_code=204)
async def post_visit(
    request: Request,
    current_user: Optional[User] = Depends(get_current_user_optional),
) -> Response:
    try:  # the body is validated in here, so a bad one is a 204 too, not a 422
        body = VisitIn.model_validate(await request.json())
        await record_visit(current_user, body.anon_id, body.surface, body.path)
    except Exception as exc:  # the counter never breaks a page
        logger.warning("visit not recorded: %r", exc)
    return Response(status_code=204)
