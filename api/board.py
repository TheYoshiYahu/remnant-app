"""
board.py — S465: the public Suggestion Board.

Built on the S464 `suggestions` table, kept general so a larger community
surface can grow on the same rows later: every row is a POST on a BOARD
(board='suggestions' today), with an author ROLE (reader | creator), the
author's own VISIBILITY choice (show_on_board), a moderation APPROVAL state
(pending | approved | hidden), anonymous VOTES (post_votes) and REPORTS
(post_reports).

Decisions (Yoshi, 2026-10-24):
  - No names. A reader's post shows as "User suggestion"; Yoshi's as "App creator".
  - The poster chooses show / hide on the board and can change it anytime.
  - Approve-before-public: a reader's post goes up only after Yoshi approves it
    (one-tap links in the email he already gets). Apple 1.2 / Play UGC policy:
    moderation + a Report button + a published contact.
  - Thumbs up / thumbs down, anonymous. The public sees ONLY the up count; the
    down count is hidden from everyone but the creator.
  - When the creator thumbs-up a post it carries "Liked by the app creator".
  - Status per post: planned | built | considering ("Taking into
    consideration"); a built post can link to its New Features entry.
  - Creator's note under a reader's post — never edits the reader's words.
  - Paid tiers + trial vote and suggest. Free readers SEE the board only.

    GET   /v1/board/suggestions                 (optional auth)
    POST  /v1/board/suggestions/{id}/vote       (partner)  {value: 1|-1|0}
    PATCH /v1/board/suggestions/{id}/visibility (owner)    {show}
    POST  /v1/board/suggestions/{id}/report     (signed in){reason?}
    POST  /v1/board/suggestions/{id}/moderate   (creator)  {approval?, status?, creator_note?, feature_id?}
    GET   /v1/board/moderate?id=&action=&sig=   (signed link from the email)
"""
from __future__ import annotations

import hashlib
import hmac
import html
import logging
import os
from datetime import datetime
from typing import List, Literal, Optional

from fastapi import APIRouter, Depends, HTTPException, Query
from fastapi.responses import HTMLResponse
from pydantic import BaseModel, Field

from auth import User, get_current_user_optional, get_current_user_required, user_tier
from db import get_pool, upsert_user
from lib.email import send_email

logger = logging.getLogger("board")
router = APIRouter(tags=["board"])

SUGGESTIONS_TO = os.environ.get("SUGGESTIONS_TO", "info@remnantofpromise.org")
API_PUBLIC_BASE = os.environ.get(
    "API_PUBLIC_BASE", "https://api.bible.remnantofpromise.org"
).rstrip("/")
_CREATOR_LOGINS = {
    s.strip().lower()
    for s in os.environ.get("CREATOR_LOGINS", "yoshi").split(",")
    if s.strip()
}
_CREATOR_EMAILS = {
    s.strip().lower()
    for s in os.environ.get("CREATOR_EMAILS", "info@remnantofpromise.org").split(",")
    if s.strip()
}

# Columns added to the S464 table + the two general tables. Idempotent.
SCHEMA_SQL = [
    """CREATE TABLE IF NOT EXISTS suggestions (
        id BIGSERIAL PRIMARY KEY, user_id UUID, kind TEXT NOT NULL,
        body TEXT NOT NULL, tier TEXT, display_name TEXT, email TEXT,
        status TEXT NOT NULL DEFAULT 'new',
        created_at TIMESTAMPTZ NOT NULL DEFAULT now())""",
    "ALTER TABLE suggestions ADD COLUMN IF NOT EXISTS board TEXT NOT NULL DEFAULT 'suggestions'",
    "ALTER TABLE suggestions ADD COLUMN IF NOT EXISTS author_role TEXT NOT NULL DEFAULT 'reader'",
    "ALTER TABLE suggestions ADD COLUMN IF NOT EXISTS show_on_board BOOLEAN NOT NULL DEFAULT TRUE",
    "ALTER TABLE suggestions ADD COLUMN IF NOT EXISTS approval TEXT NOT NULL DEFAULT 'pending'",
    "ALTER TABLE suggestions ADD COLUMN IF NOT EXISTS board_status TEXT",
    "ALTER TABLE suggestions ADD COLUMN IF NOT EXISTS creator_liked BOOLEAN NOT NULL DEFAULT FALSE",
    "ALTER TABLE suggestions ADD COLUMN IF NOT EXISTS creator_note TEXT",
    "ALTER TABLE suggestions ADD COLUMN IF NOT EXISTS feature_id TEXT",
    "ALTER TABLE suggestions ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ NOT NULL DEFAULT now()",
    # S465 — comments / tweaks are posts with a parent (same moderation path).
    "ALTER TABLE suggestions ADD COLUMN IF NOT EXISTS parent_id BIGINT REFERENCES suggestions(id) ON DELETE CASCADE",
    """CREATE TABLE IF NOT EXISTS post_votes (
        post_id BIGINT NOT NULL REFERENCES suggestions(id) ON DELETE CASCADE,
        user_id UUID NOT NULL,
        value SMALLINT NOT NULL CHECK (value IN (-1, 1)),
        created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
        PRIMARY KEY (post_id, user_id))""",
    """CREATE TABLE IF NOT EXISTS post_reports (
        id BIGSERIAL PRIMARY KEY,
        post_id BIGINT NOT NULL REFERENCES suggestions(id) ON DELETE CASCADE,
        user_id UUID, reason TEXT,
        created_at TIMESTAMPTZ NOT NULL DEFAULT now())""",
]
_schema_ready = False

# The creator's opening posts (Yoshi, 2026-10-24). Inserted once each, matched
# by body, so the board is never empty at launch. Edit or hide them later from
# the creator tools — a post already on the board is never re-inserted.
CREATOR_SEED = [
    {
        "kind": "feature",
        "body": "Add more voices to the Listen feature.",
        "liked": True,
        "status": "planned",
        "note": "In the plans. This one is very time consuming.",
    },
    {
        "kind": "feature",
        "body": (
            "Orange Caution Guardrails: a feature you can turn on and off like the "
            "others, that highlights in orange the verses most often used in the wrong "
            "context or out of context, with an end card explaining how the verse is "
            "usually used, beside its true context."
        ),
        "liked": False,
        "status": None,
        "note": None,
    },
    {
        "kind": "feature",
        "body": (
            "Don't re-enroll any of my books in KDP Select, so the e-book "
            "versions can be read inside the app by top-tier partners, with the Listen "
            "feature on those books too, and possibly one day my own voice reading them "
            "as an audiobook, as a thank-you to the partners."
        ),
        "liked": False,
        "status": None,
        "note": None,
    },
]


async def _seed_creator_posts(conn) -> None:
    for i, p in enumerate(CREATOR_SEED):
        exists = await conn.fetchval(
            "SELECT 1 FROM suggestions WHERE author_role='creator' AND body=$1", p["body"]
        )
        if exists:
            continue
        await conn.execute(
            "INSERT INTO suggestions (kind, body, tier, author_role, show_on_board, approval, "
            "creator_liked, board_status, creator_note, created_at) "
            "VALUES ($1,$2,'creator','creator',TRUE,'approved',$3,$4,$5, now() - make_interval(secs => $6))",
            p["kind"], p["body"], p["liked"], p["status"], p["note"], float(i),
        )


async def ensure_schema(conn) -> None:
    global _schema_ready
    if _schema_ready:
        return
    for stmt in SCHEMA_SQL:
        await conn.execute(stmt)
    await _seed_creator_posts(conn)
    _schema_ready = True


def is_creator(user: Optional[User]) -> bool:
    if user is None:
        return False
    if (user.login or "").lower() in _CREATOR_LOGINS:
        return True
    return bool(user.email and user.email.lower() in _CREATOR_EMAILS)


def can_participate(user: Optional[User]) -> bool:
    """Paid tiers + trial (user_tier resolves the trial to its tier)."""
    return user is not None and (is_creator(user) or user_tier(user) != "free")


# ---------- one-tap moderation links ---------------------------------------
def _mod_secret() -> bytes:
    s = os.environ.get("BOARD_MOD_SECRET") or os.environ.get("WP_COMPANION_SECRET") or ""
    return s.encode()


def mod_sig(post_id: int, action: str) -> str:
    key = _mod_secret()
    if not key:
        return ""
    return hmac.new(key, f"{post_id}:{action}".encode(), hashlib.sha256).hexdigest()[:32]


def mod_link(post_id: int, action: str) -> Optional[str]:
    sig = mod_sig(post_id, action)
    if not sig:
        return None
    return f"{API_PUBLIC_BASE}/v1/board/moderate?id={post_id}&action={action}&sig={sig}"


# ---------- models ----------------------------------------------------------
Status = Literal["planned", "built", "considering"]


class BoardComment(BaseModel):
    id: int
    body: str
    created_at: datetime
    author: str
    is_creator_post: bool
    mine: bool
    show_on_board: Optional[bool] = None
    approval: Optional[str] = None


class BoardPost(BaseModel):
    id: int
    kind: str
    body: str
    created_at: datetime
    author: str  # "App creator" | "User suggestion"
    is_creator_post: bool
    mine: bool
    show_on_board: Optional[bool] = None  # owner / creator only
    approval: Optional[str] = None        # owner / creator only
    ups: int
    downs: Optional[int] = None           # creator only — never public
    my_vote: int = 0
    creator_liked: bool
    creator_note: Optional[str] = None
    status: Optional[str] = None
    feature_id: Optional[str] = None
    comments: List[BoardComment] = []


class BoardResponse(BaseModel):
    signed_in: bool
    can_vote: bool
    can_post: bool
    is_creator: bool
    posts: List[BoardPost]


class CommentIn(BaseModel):
    body: str = Field(min_length=2, max_length=2000)


class VoteIn(BaseModel):
    value: Literal[-1, 0, 1]


class VisibilityIn(BaseModel):
    show: bool


class ReportIn(BaseModel):
    reason: Optional[str] = Field(default=None, max_length=1000)


class ModerateIn(BaseModel):
    approval: Optional[Literal["approved", "hidden", "pending"]] = None
    status: Optional[Literal["planned", "built", "considering", "none"]] = None
    creator_note: Optional[str] = Field(default=None, max_length=4000)
    feature_id: Optional[str] = Field(default=None, max_length=120)


# ---------- routes ----------------------------------------------------------
@router.get("/v1/board/suggestions", response_model=BoardResponse)
async def list_board(
    current_user: Optional[User] = Depends(get_current_user_optional),
) -> BoardResponse:
    creator = is_creator(current_user)
    participate = can_participate(current_user)
    pool = get_pool()
    async with pool.acquire() as conn:
        await ensure_schema(conn)
        me = await upsert_user(conn, current_user) if current_user else None
        rows = await conn.fetch(
            """
            SELECT s.*,
              COALESCE((SELECT count(*) FROM post_votes v WHERE v.post_id=s.id AND v.value=1),0) AS ups,
              COALESCE((SELECT count(*) FROM post_votes v WHERE v.post_id=s.id AND v.value=-1),0) AS downs,
              COALESCE((SELECT v.value FROM post_votes v WHERE v.post_id=s.id AND v.user_id=$1::uuid),0) AS my_vote
            FROM suggestions s
            WHERE s.board='suggestions' AND s.parent_id IS NULL
              AND ( $2::bool
                    OR (s.user_id IS NOT DISTINCT FROM $1::uuid AND $1::uuid IS NOT NULL)
                    OR (s.approval='approved' AND s.show_on_board) )
            ORDER BY (s.author_role='creator') DESC, ups DESC, s.created_at DESC
            LIMIT 500
            """,
            me,
            creator,
        )
        crow = await conn.fetch(
            """
            SELECT c.* FROM suggestions c
            WHERE c.parent_id = ANY($3::bigint[])
              AND ( $2::bool
                    OR (c.user_id IS NOT DISTINCT FROM $1::uuid AND $1::uuid IS NOT NULL)
                    OR (c.approval='approved' AND c.show_on_board) )
            ORDER BY c.created_at ASC
            """,
            me,
            creator,
            [r["id"] for r in rows],
        )
    by_parent: dict = {}
    for c in crow:
        cmine = me is not None and c["user_id"] is not None and str(c["user_id"]) == str(me)
        by_parent.setdefault(c["parent_id"], []).append(
            BoardComment(
                id=c["id"],
                body=c["body"],
                created_at=c["created_at"],
                author="App creator" if c["author_role"] == "creator" else "User comment",
                is_creator_post=c["author_role"] == "creator",
                mine=cmine,
                show_on_board=c["show_on_board"] if (cmine or creator) else None,
                approval=c["approval"] if (cmine or creator) else None,
            )
        )
    posts: List[BoardPost] = []
    for r in rows:
        mine = me is not None and r["user_id"] is not None and str(r["user_id"]) == str(me)
        owner_view = mine or creator
        posts.append(
            BoardPost(
                id=r["id"],
                kind=r["kind"],
                body=r["body"],
                created_at=r["created_at"],
                author="App creator" if r["author_role"] == "creator" else "User suggestion",
                is_creator_post=r["author_role"] == "creator",
                mine=mine,
                show_on_board=r["show_on_board"] if owner_view else None,
                approval=r["approval"] if owner_view else None,
                ups=int(r["ups"]),
                downs=int(r["downs"]) if creator else None,
                my_vote=int(r["my_vote"] or 0),
                creator_liked=bool(r["creator_liked"]),
                creator_note=r["creator_note"],
                status=r["board_status"],
                feature_id=r["feature_id"],
                comments=by_parent.get(r["id"], []),
            )
        )
    return BoardResponse(
        signed_in=current_user is not None,
        can_vote=participate,
        can_post=participate,
        is_creator=creator,
        posts=posts,
    )


async def _post_or_404(conn, post_id: int):
    row = await conn.fetchrow("SELECT * FROM suggestions WHERE id=$1", post_id)
    if row is None:
        raise HTTPException(status_code=404, detail="Not found")
    return row


@router.post("/v1/board/suggestions/{post_id}/vote")
async def vote(
    post_id: int, body: VoteIn, current_user: User = Depends(get_current_user_required)
) -> dict:
    if not can_participate(current_user):
        raise HTTPException(status_code=403, detail={"tier_required": "study_notes", "feature": "board_vote"})
    creator = is_creator(current_user)
    pool = get_pool()
    async with pool.acquire() as conn:
        await ensure_schema(conn)
        me = await upsert_user(conn, current_user)
        row = await _post_or_404(conn, post_id)
        if row["parent_id"] is not None:
            raise HTTPException(status_code=400, detail="Comments aren't voted on.")
        visible = row["approval"] == "approved" and row["show_on_board"]
        if not (visible or creator):
            raise HTTPException(status_code=404, detail="Not found")
        if body.value == 0:
            await conn.execute("DELETE FROM post_votes WHERE post_id=$1 AND user_id=$2::uuid", post_id, me)
        else:
            await conn.execute(
                "INSERT INTO post_votes (post_id,user_id,value) VALUES ($1,$2::uuid,$3) "
                "ON CONFLICT (post_id,user_id) DO UPDATE SET value=EXCLUDED.value, created_at=now()",
                post_id, me, body.value,
            )
        if creator:
            await conn.execute(
                "UPDATE suggestions SET creator_liked=$2, updated_at=now() WHERE id=$1",
                post_id, body.value == 1,
            )
        ups = await conn.fetchval("SELECT count(*) FROM post_votes WHERE post_id=$1 AND value=1", post_id)
    return {"ok": True, "ups": int(ups), "my_vote": body.value}


@router.post("/v1/board/suggestions/{post_id}/comments", status_code=201)
async def add_comment(
    post_id: int, body: CommentIn, current_user: User = Depends(get_current_user_required)
) -> dict:
    if not can_participate(current_user):
        raise HTTPException(status_code=403, detail={"tier_required": "study_notes", "feature": "board_comment"})
    text_body = body.body.strip()
    if len(text_body) < 2:
        raise HTTPException(status_code=422, detail="Please write a few words.")
    creator = is_creator(current_user)
    pool = get_pool()
    async with pool.acquire() as conn:
        await ensure_schema(conn)
        me = await upsert_user(conn, current_user)
        parent = await _post_or_404(conn, post_id)
        if parent["parent_id"] is not None:
            raise HTTPException(status_code=400, detail="Reply to the suggestion itself.")
        if not creator and not (parent["approval"] == "approved" and parent["show_on_board"]):
            raise HTTPException(status_code=404, detail="Not found")
        cid = await conn.fetchval(
            "INSERT INTO suggestions (user_id, kind, body, tier, display_name, email, author_role, "
            "show_on_board, approval, parent_id) VALUES ($1::uuid,'comment',$2,$3,$4,$5,$6,TRUE,$7,$8) "
            "RETURNING id",
            me, text_body, user_tier(current_user), current_user.display_name, current_user.email,
            "creator" if creator else "reader", "approved" if creator else "pending", post_id,
        )
    if not creator:
        who = current_user.display_name or "A partner"
        approve, hide = mod_link(cid, "approve"), mod_link(cid, "hide")
        plain = (
            f"Comment #{cid} on suggestion #{post_id} from {who} ({current_user.email or 'no email'}):\n\n"
            f"{text_body}\n\nOn: {parent['body']}\n"
        )
        rich = (
            f"<p>Comment #{cid} on suggestion #{post_id} from {html.escape(who)} "
            f"({html.escape(current_user.email or 'no email')})</p>"
            f"<p style=\"white-space:pre-wrap\">{html.escape(text_body)}</p>"
            f"<p style=\"color:#777\">On: {html.escape(parent['body'])}</p>"
        )
        if approve and hide:
            plain += f"Approve: {approve}\nHide: {hide}\n"
            rich += f'<p><a href="{approve}">Approve for the board</a> &nbsp;·&nbsp; <a href="{hide}">Hide</a></p>'
        try:
            await send_email(to=SUGGESTIONS_TO, subject=f"Board comment #{cid} on suggestion #{post_id}", html=rich, text=plain)
        except Exception:
            logger.exception("comment %s email failed", cid)
    return {"ok": True, "id": cid, "approval": "approved" if creator else "pending"}


@router.patch("/v1/board/suggestions/{post_id}/visibility")
async def set_visibility(
    post_id: int, body: VisibilityIn, current_user: User = Depends(get_current_user_required)
) -> dict:
    pool = get_pool()
    async with pool.acquire() as conn:
        await ensure_schema(conn)
        me = await upsert_user(conn, current_user)
        row = await _post_or_404(conn, post_id)
        if str(row["user_id"]) != str(me) and not is_creator(current_user):
            raise HTTPException(status_code=403, detail="Only the person who sent it can change this.")
        await conn.execute(
            "UPDATE suggestions SET show_on_board=$2, updated_at=now() WHERE id=$1", post_id, body.show
        )
    return {"ok": True, "show_on_board": body.show}


@router.post("/v1/board/suggestions/{post_id}/report")
async def report(
    post_id: int, body: ReportIn, current_user: User = Depends(get_current_user_required)
) -> dict:
    pool = get_pool()
    async with pool.acquire() as conn:
        await ensure_schema(conn)
        me = await upsert_user(conn, current_user)
        row = await _post_or_404(conn, post_id)
        await conn.execute(
            "INSERT INTO post_reports (post_id,user_id,reason) VALUES ($1,$2::uuid,$3)",
            post_id, me, (body.reason or "").strip() or None,
        )
    hide = mod_link(post_id, "hide")
    plain = (
        f"A reader reported board post #{post_id}.\nReason: {body.reason or '(none given)'}\n\n"
        f"{row['body']}\n\n" + (f"Hide it: {hide}\n" if hide else "")
    )
    rich = (
        f"<p>A reader reported board post #{post_id}.<br>Reason: {html.escape(body.reason or '(none given)')}</p>"
        f"<p style=\"white-space:pre-wrap\">{html.escape(row['body'])}</p>"
        + (f"<p><a href=\"{hide}\">Hide it from the board</a></p>" if hide else "")
    )
    try:
        await send_email(to=SUGGESTIONS_TO, subject=f"Board post #{post_id} reported", html=rich, text=plain)
    except Exception:
        logger.exception("report email failed for %s", post_id)
    return {"ok": True}


@router.post("/v1/board/suggestions/{post_id}/moderate")
async def moderate(
    post_id: int, body: ModerateIn, current_user: User = Depends(get_current_user_required)
) -> dict:
    if not is_creator(current_user):
        raise HTTPException(status_code=403, detail="Creator only.")
    pool = get_pool()
    async with pool.acquire() as conn:
        await ensure_schema(conn)
        await _post_or_404(conn, post_id)
        if body.approval is not None:
            await conn.execute("UPDATE suggestions SET approval=$2, updated_at=now() WHERE id=$1", post_id, body.approval)
        if body.status is not None:
            await conn.execute(
                "UPDATE suggestions SET board_status=$2, updated_at=now() WHERE id=$1",
                post_id, None if body.status == "none" else body.status,
            )
        if body.creator_note is not None:
            await conn.execute(
                "UPDATE suggestions SET creator_note=$2, updated_at=now() WHERE id=$1",
                post_id, body.creator_note.strip() or None,
            )
        if body.feature_id is not None:
            await conn.execute(
                "UPDATE suggestions SET feature_id=$2, updated_at=now() WHERE id=$1",
                post_id, body.feature_id.strip() or None,
            )
    return {"ok": True}


_PAGE = """<!doctype html><html><head><meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1"><title>Suggestion board</title>
<style>body{{font-family:Georgia,serif;background:#14100c;color:#f3ead8;max-width:32rem;margin:3rem auto;padding:0 1rem}}
a{{color:#e7c873}}</style></head><body><h1>{title}</h1><p>{msg}</p>
<p><a href="https://bible.remnantofpromise.org/settings#board">Open the board</a></p></body></html>"""


@router.get("/v1/board/moderate", response_class=HTMLResponse)
async def moderate_link(
    id: int = Query(...), action: Literal["approve", "hide"] = Query(...), sig: str = Query(...)
) -> HTMLResponse:
    expected = mod_sig(id, action)
    if not expected or not hmac.compare_digest(expected, sig):
        return HTMLResponse(_PAGE.format(title="Link not valid", msg="This moderation link is not valid."), status_code=403)
    pool = get_pool()
    async with pool.acquire() as conn:
        await ensure_schema(conn)
        await _post_or_404(conn, id)
        await conn.execute(
            "UPDATE suggestions SET approval=$2, updated_at=now() WHERE id=$1",
            id, "approved" if action == "approve" else "hidden",
        )
    msg = (
        f"Suggestion #{id} is approved. It shows on the board unless the reader chose to keep it hidden."
        if action == "approve"
        else f"Suggestion #{id} is hidden from the board."
    )
    return HTMLResponse(_PAGE.format(title="Done", msg=html.escape(msg)))
