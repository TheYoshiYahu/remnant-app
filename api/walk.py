"""
walk.py — the member half of walk.remnantofpromise.org ("Living in His Ways").

WALK 1 (Nov 2026). The walk site is a static build (walk/build.mjs) served by
Render beside the PWA. Free entries are written whole into its HTML. For the
member entries the page carries the name, where it grows, the season, and
EVERY look-alike warning — the warning is never behind the join line — and
greys the part eaten and the preparation. The page's script asks
/v1/subscriptions/me who the reader is (the rop_jwt cookie set by the
WordPress login is shared across .remnantofpromise.org) and, for Study Notes
and above, asks this router for the greyed fields.

GET /v1/walk/plants/{state}
    403 { tier_required: 'study_notes', feature: 'walk' } below Study Notes.
    200 { state, entries: [ { slug, part, prepare } ] } at Study Notes+.
    404 for a state that has no data file.

The data is the same JSON the static build reads — walk/data/plants/<st>.json
— copied into the image at /walk/data by api/Dockerfile. Nothing is stored in
the database; the tier check is the only DB touch, through the schema's
tier_satisfies() lattice like every other gated route.
"""

from __future__ import annotations

import json
import os
import re
from functools import lru_cache
from typing import List, Optional

from fastapi import APIRouter, Depends, HTTPException, Response
from pydantic import BaseModel

from auth import User, get_current_user_optional, user_tier
from db import get_pool

router = APIRouter()

WALK_REQUIRED_TIER = "study_notes"
WALK_DATA_DIR = os.environ.get("WALK_DATA_DIR", "/walk/data")


class WalkPlantMember(BaseModel):
    slug: str
    part: str
    prepare: str


class WalkPlantsMemberResponse(BaseModel):
    state: str
    entries: List[WalkPlantMember]


@lru_cache(maxsize=64)
def _load_state(state: str) -> Optional[dict]:
    if not re.fullmatch(r"[a-z]{2}", state):
        return None
    path = os.path.join(WALK_DATA_DIR, "plants", f"{state}.json")
    if not os.path.exists(path):
        return None
    with open(path, encoding="utf-8") as f:
        return json.load(f)


@router.get("/v1/walk/plants/{state}", response_model=WalkPlantsMemberResponse)
async def get_walk_plants_member(
    state: str,
    response: Response,
    current_user: Optional[User] = Depends(get_current_user_optional),
) -> WalkPlantsMemberResponse:
    data = _load_state(state.lower())
    if data is None:
        raise HTTPException(status_code=404, detail="no such state")

    tier = user_tier(current_user)
    pool = get_pool()
    async with pool.acquire() as conn:
        ok = await conn.fetchval(
            "SELECT tier_satisfies($1::content_tier, $2::content_tier)",
            tier,
            WALK_REQUIRED_TIER,
        )
    if not ok:
        raise HTTPException(
            status_code=403,
            detail={"tier_required": WALK_REQUIRED_TIER, "feature": "walk"},
        )

    # Per-reader response; never let a shared cache hand it to the next visitor.
    response.headers["Cache-Control"] = "private, no-store"
    entries = [
        WalkPlantMember(slug=e["slug"], part=e["part"], prepare=e["prepare"])
        for e in data["entries"]
        if not e.get("free")
    ]
    return WalkPlantsMemberResponse(state=data["state"], entries=entries)
