"""
suggestions.py — S464: the partner suggestion box.

Partners (any paid tier, or the 7-day trial) send ideas for improving the app
or features they find missing. Free readers SEE the box in Settings but it is
locked — the eligibility route tells the client which to show.

    GET  /v1/suggestions/eligibility   (optional auth) → {signed_in, allowed}
    POST /v1/suggestions               (partner)       → stores + emails Yoshi

Each suggestion is stored in the `suggestions` table (created on first use,
CREATE TABLE IF NOT EXISTS — no separate migration step) and emailed to
SUGGESTIONS_TO (default info@remnantofpromise.org) through lib/email.py.
A failed email never loses the suggestion; the row is already saved.
"""
from __future__ import annotations

import html
import logging
import os
from typing import Literal, Optional

from fastapi import APIRouter, Depends, HTTPException
from pydantic import BaseModel, Field

from auth import User, get_current_user_optional, get_current_user_required, user_tier
from db import get_pool, upsert_user
from lib.email import send_email

logger = logging.getLogger("suggestions")
router = APIRouter(tags=["suggestions"])

SUGGESTIONS_TO = os.environ.get("SUGGESTIONS_TO", "info@remnantofpromise.org")

_TABLE_SQL = """
CREATE TABLE IF NOT EXISTS suggestions (
    id          BIGSERIAL PRIMARY KEY,
    user_id     UUID,
    kind        TEXT NOT NULL,
    body        TEXT NOT NULL,
    tier        TEXT,
    display_name TEXT,
    email       TEXT,
    status      TEXT NOT NULL DEFAULT 'new',
    created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
)
"""
_table_ready = False

KIND_LABELS = {
    "feature": "Missing feature",
    "improvement": "Make it better",
    "problem": "Something's not working",
}


class SuggestionEligibility(BaseModel):
    signed_in: bool
    allowed: bool


class SuggestionCreate(BaseModel):
    kind: Literal["feature", "improvement", "problem"] = "feature"
    body: str = Field(min_length=3, max_length=4000)


class SuggestionCreated(BaseModel):
    id: int
    ok: bool = True


@router.get("/v1/suggestions/eligibility", response_model=SuggestionEligibility)
async def suggestion_eligibility(
    current_user: Optional[User] = Depends(get_current_user_optional),
) -> SuggestionEligibility:
    if current_user is None:
        return SuggestionEligibility(signed_in=False, allowed=False)
    return SuggestionEligibility(signed_in=True, allowed=user_tier(current_user) != "free")


@router.post("/v1/suggestions", response_model=SuggestionCreated, status_code=201)
async def create_suggestion(
    body: SuggestionCreate,
    current_user: User = Depends(get_current_user_required),
) -> SuggestionCreated:
    global _table_ready
    tier = user_tier(current_user)
    if tier == "free":
        raise HTTPException(
            status_code=403,
            detail={"tier_required": "study_notes", "feature": "suggestions"},
        )
    text_body = body.body.strip()
    if len(text_body) < 3:
        raise HTTPException(status_code=422, detail="Please write a few words.")

    pool = get_pool()
    async with pool.acquire() as conn:
        if not _table_ready:
            await conn.execute(_TABLE_SQL)
            _table_ready = True
        user_uuid = await upsert_user(conn, current_user)
        row = await conn.fetchrow(
            "INSERT INTO suggestions (user_id, kind, body, tier, display_name, email) "
            "VALUES ($1::uuid, $2, $3, $4, $5, $6) RETURNING id",
            user_uuid,
            body.kind,
            text_body,
            tier,
            current_user.display_name,
            current_user.email,
        )
    sid = int(row["id"])

    who = current_user.display_name or "A partner"
    label = KIND_LABELS.get(body.kind, body.kind)
    subject = f"App suggestion #{sid} — {label} (from {who})"
    plain = (
        f"{label}\nFrom: {who} ({current_user.email or 'no email on file'}) · tier: {tier}\n\n"
        f"{text_body}\n"
    )
    rich = (
        f"<p><strong>{html.escape(label)}</strong><br>"
        f"From: {html.escape(who)} ({html.escape(current_user.email or 'no email on file')}) · tier: {html.escape(tier)}</p>"
        f"<p style=\"white-space:pre-wrap\">{html.escape(text_body)}</p>"
    )
    try:
        sent = await send_email(to=SUGGESTIONS_TO, subject=subject, html=rich, text=plain)
        if not sent:
            logger.warning("suggestion %s saved but email not sent", sid)
    except Exception:  # never lose the suggestion over mail
        logger.exception("suggestion %s email failed", sid)

    return SuggestionCreated(id=sid)
