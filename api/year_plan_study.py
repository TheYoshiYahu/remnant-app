"""
year_plan_study.py — S442 Year Plan study features (YEAR_PLAN_STUDY_SPEC.md).

Partner (any paid tier, or the no-card trial) endpoints:
    GET    /v1/me/year-plan              — the reader's synced plan state
    PUT    /v1/me/year-plan              — save it (last-writer-wins on updated_at_ms)
    GET    /v1/plan-notes                — notes on plan days / chapters
    POST   /v1/plan-notes
    PATCH  /v1/plan-notes/{id}
    DELETE /v1/plan-notes/{id}
    GET    /v1/my-teachings              — the reader's own teachings (list)
    POST   /v1/my-teachings
    GET    /v1/my-teachings/{id}
    PUT    /v1/my-teachings/{id}
    DELETE /v1/my-teachings/{id}

Top tier ("everything") endpoints — For Teachers:
    GET    /v1/teacher/assignments
    POST   /v1/teacher/assignments
    GET    /v1/teacher/assignments/{id}
    PUT    /v1/teacher/assignments/{id}
    DELETE /v1/teacher/assignments/{id}

The lock is enforced HERE, never trusted from the client: every endpoint
re-checks the caller's effective tier (auth.user_tier — DB subscription, the
in-window trial as TRIAL_TIER, or the WP membership floor).

Teachings and assignments are stored as one row each with an ordered JSONB
`blocks` array (headings, text, passages, notes, questions, memory verses).
The client owns the block shapes; the server stores them opaquely with size
limits, so a whole document saves atomically in one PUT.

Tables: data-schema/migrations/session442_year_plan_study.sql
"""

from __future__ import annotations

import json
from datetime import date, datetime
from typing import Any, List, Optional

from fastapi import APIRouter, Depends, HTTPException, Response
from pydantic import BaseModel, Field

from auth import User, get_current_user_required, user_tier
from db import get_pool, upsert_user

router = APIRouter(tags=["year-plan-study"])

MAX_BLOCKS = 500
MAX_DOC_BYTES = 400_000
MAX_STATE_BYTES = 50_000


# ----- gates ---------------------------------------------------------------


def _require_partner(user: User) -> None:
    if user_tier(user) == "free":
        raise HTTPException(
            status_code=403,
            detail={"tier_required": "study_notes", "feature": "year_plan_study"},
        )


def _require_teacher(user: User) -> None:
    if user_tier(user) != "everything":
        raise HTTPException(
            status_code=403,
            detail={"tier_required": "everything", "feature": "for_teachers"},
        )


def _json(v: Any) -> Any:
    """asyncpg returns JSONB as text (no codec registered on the pool)."""
    return json.loads(v) if isinstance(v, str) else v


def _check_blocks(blocks: List[dict]) -> str:
    if len(blocks) > MAX_BLOCKS:
        raise HTTPException(status_code=413, detail=f"At most {MAX_BLOCKS} blocks.")
    raw = json.dumps(blocks)
    if len(raw.encode("utf-8")) > MAX_DOC_BYTES:
        raise HTTPException(status_code=413, detail="This document is too large to save.")
    return raw


# ----- year-plan sync ----------------------------------------------------------


class YearPlanSync(BaseModel):
    state: Optional[dict] = None
    updated_at_ms: Optional[int] = None


class PutYearPlanRequest(BaseModel):
    state: dict
    updated_at_ms: int = Field(..., ge=0)


@router.get("/v1/me/year-plan", response_model=YearPlanSync)
async def get_year_plan(current_user: User = Depends(get_current_user_required)) -> YearPlanSync:
    _require_partner(current_user)
    pool = get_pool()
    async with pool.acquire(timeout=10) as conn:
        user_uuid = await upsert_user(conn, current_user)
        row = await conn.fetchrow(
            "SELECT state, updated_at_ms FROM user_year_plans WHERE user_id = $1::uuid",
            user_uuid,
        )
    if row is None:
        return YearPlanSync()
    return YearPlanSync(state=_json(row["state"]), updated_at_ms=row["updated_at_ms"])


@router.put("/v1/me/year-plan", response_model=YearPlanSync)
async def put_year_plan(
    body: PutYearPlanRequest,
    current_user: User = Depends(get_current_user_required),
) -> YearPlanSync:
    _require_partner(current_user)
    raw = json.dumps(body.state)
    if len(raw) > MAX_STATE_BYTES:
        raise HTTPException(status_code=413, detail="Plan state too large.")
    pool = get_pool()
    async with pool.acquire(timeout=10) as conn:
        user_uuid = await upsert_user(conn, current_user)
        # Last writer wins, but never let an OLDER copy overwrite a newer one
        # (a phone that was offline all week syncing stale progress).
        row = await conn.fetchrow(
            "INSERT INTO user_year_plans (user_id, state, updated_at_ms) "
            "VALUES ($1::uuid, $2::jsonb, $3) "
            "ON CONFLICT (user_id) DO UPDATE "
            "   SET state = EXCLUDED.state, updated_at_ms = EXCLUDED.updated_at_ms, "
            "       updated_at = now() "
            " WHERE user_year_plans.updated_at_ms <= EXCLUDED.updated_at_ms "
            "RETURNING state, updated_at_ms",
            user_uuid, raw, body.updated_at_ms,
        )
        if row is None:  # ours was older — hand back the newer copy
            row = await conn.fetchrow(
                "SELECT state, updated_at_ms FROM user_year_plans WHERE user_id = $1::uuid",
                user_uuid,
            )
    return YearPlanSync(state=_json(row["state"]), updated_at_ms=row["updated_at_ms"])


# ----- plan notes ------------------------------------------------------------


class PlanNote(BaseModel):
    id: str
    plan_day: Optional[int] = None
    day_date: Optional[date] = None
    book_slug: Optional[str] = None
    book_title: Optional[str] = None
    chapter: Optional[int] = None
    verse_start: Optional[int] = None
    verse_end: Optional[int] = None
    body: str
    created_at: datetime
    updated_at: datetime


class PlanNotesResponse(BaseModel):
    notes: List[PlanNote]


class CreatePlanNoteRequest(BaseModel):
    body: str = Field(..., min_length=1, max_length=20_000)
    plan_day: Optional[int] = Field(default=None, ge=1, le=5000)
    day_date: Optional[date] = None
    book_slug: Optional[str] = Field(default=None, max_length=120)
    book_title: Optional[str] = Field(default=None, max_length=200)
    chapter: Optional[int] = Field(default=None, ge=1, le=500)
    verse_start: Optional[int] = Field(default=None, ge=1, le=500)
    verse_end: Optional[int] = Field(default=None, ge=1, le=500)


class UpdatePlanNoteRequest(BaseModel):
    body: Optional[str] = Field(default=None, min_length=1, max_length=20_000)
    verse_start: Optional[int] = Field(default=None, ge=1, le=500)
    verse_end: Optional[int] = Field(default=None, ge=1, le=500)
    clear_verses: bool = False


_NOTE_COLS = (
    "id::text AS id, plan_day, day_date, book_slug, book_title, chapter, "
    "verse_start, verse_end, body, created_at, updated_at"
)


@router.get("/v1/plan-notes", response_model=PlanNotesResponse)
async def list_plan_notes(current_user: User = Depends(get_current_user_required)) -> PlanNotesResponse:
    _require_partner(current_user)
    pool = get_pool()
    async with pool.acquire(timeout=10) as conn:
        user_uuid = await upsert_user(conn, current_user)
        rows = await conn.fetch(
            f"SELECT {_NOTE_COLS} FROM plan_notes "
            " WHERE user_id = $1::uuid AND is_archived = FALSE "
            " ORDER BY created_at ASC, id ASC",
            user_uuid,
        )
    return PlanNotesResponse(notes=[PlanNote(**dict(r)) for r in rows])


@router.post("/v1/plan-notes", response_model=PlanNote, status_code=201)
async def create_plan_note(
    body: CreatePlanNoteRequest,
    current_user: User = Depends(get_current_user_required),
) -> PlanNote:
    _require_partner(current_user)
    vs, ve = body.verse_start, body.verse_end
    if vs is not None and ve is not None and ve < vs:
        vs, ve = ve, vs
    pool = get_pool()
    async with pool.acquire(timeout=10) as conn:
        user_uuid = await upsert_user(conn, current_user)
        row = await conn.fetchrow(
            "INSERT INTO plan_notes (user_id, plan_day, day_date, book_slug, book_title, "
            "                        chapter, verse_start, verse_end, body) "
            "VALUES ($1::uuid, $2, $3, $4, $5, $6, $7, $8, $9) "
            f"RETURNING {_NOTE_COLS}",
            user_uuid, body.plan_day, body.day_date, body.book_slug, body.book_title,
            body.chapter, vs, ve, body.body,
        )
    return PlanNote(**dict(row))


@router.patch("/v1/plan-notes/{note_id}", response_model=PlanNote)
async def update_plan_note(
    note_id: str,
    body: UpdatePlanNoteRequest,
    current_user: User = Depends(get_current_user_required),
) -> PlanNote:
    _require_partner(current_user)
    pool = get_pool()
    async with pool.acquire(timeout=10) as conn:
        user_uuid = await upsert_user(conn, current_user)
        row = await conn.fetchrow(
            "UPDATE plan_notes SET "
            "  body = COALESCE($3, body), "
            "  verse_start = CASE WHEN $6 THEN NULL ELSE COALESCE($4, verse_start) END, "
            "  verse_end   = CASE WHEN $6 THEN NULL ELSE COALESCE($5, verse_end) END, "
            "  updated_at = now() "
            " WHERE id = $1::uuid AND user_id = $2::uuid AND is_archived = FALSE "
            f"RETURNING {_NOTE_COLS}",
            note_id, user_uuid, body.body, body.verse_start, body.verse_end, body.clear_verses,
        )
    if row is None:
        raise HTTPException(status_code=404, detail="Note not found.")
    return PlanNote(**dict(row))


@router.delete("/v1/plan-notes/{note_id}", status_code=204)
async def delete_plan_note(
    note_id: str,
    current_user: User = Depends(get_current_user_required),
) -> Response:
    _require_partner(current_user)
    pool = get_pool()
    async with pool.acquire(timeout=10) as conn:
        user_uuid = await upsert_user(conn, current_user)
        result = await conn.execute(
            "UPDATE plan_notes SET is_archived = TRUE, updated_at = now() "
            " WHERE id = $1::uuid AND user_id = $2::uuid AND is_archived = FALSE",
            note_id, user_uuid,
        )
    if result.endswith(" 0"):
        raise HTTPException(status_code=404, detail="Note not found.")
    return Response(status_code=204)


# ----- My Teachings ------------------------------------------------------------


class DocSummary(BaseModel):
    id: str
    title: str
    created_at: datetime
    updated_at: datetime


class MyTeaching(DocSummary):
    blocks: List[dict]


class MyTeachingsResponse(BaseModel):
    teachings: List[DocSummary]


class SaveTeachingRequest(BaseModel):
    title: str = Field(..., min_length=1, max_length=300)
    blocks: List[dict] = Field(default_factory=list)


def _teaching(row) -> MyTeaching:
    return MyTeaching(
        id=row["id"], title=row["title"], blocks=_json(row["blocks"]) or [],
        created_at=row["created_at"], updated_at=row["updated_at"],
    )


@router.get("/v1/my-teachings", response_model=MyTeachingsResponse)
async def list_my_teachings(current_user: User = Depends(get_current_user_required)) -> MyTeachingsResponse:
    _require_partner(current_user)
    pool = get_pool()
    async with pool.acquire(timeout=10) as conn:
        user_uuid = await upsert_user(conn, current_user)
        rows = await conn.fetch(
            "SELECT id::text AS id, title, created_at, updated_at FROM user_teachings "
            " WHERE user_id = $1::uuid AND is_archived = FALSE ORDER BY updated_at DESC",
            user_uuid,
        )
    return MyTeachingsResponse(teachings=[DocSummary(**dict(r)) for r in rows])


@router.post("/v1/my-teachings", response_model=MyTeaching, status_code=201)
async def create_my_teaching(
    body: SaveTeachingRequest,
    current_user: User = Depends(get_current_user_required),
) -> MyTeaching:
    _require_partner(current_user)
    raw = _check_blocks(body.blocks)
    pool = get_pool()
    async with pool.acquire(timeout=10) as conn:
        user_uuid = await upsert_user(conn, current_user)
        row = await conn.fetchrow(
            "INSERT INTO user_teachings (user_id, title, blocks) VALUES ($1::uuid, $2, $3::jsonb) "
            "RETURNING id::text AS id, title, blocks, created_at, updated_at",
            user_uuid, body.title, raw,
        )
    return _teaching(row)


@router.get("/v1/my-teachings/{teaching_id}", response_model=MyTeaching)
async def get_my_teaching(
    teaching_id: str,
    current_user: User = Depends(get_current_user_required),
) -> MyTeaching:
    _require_partner(current_user)
    pool = get_pool()
    async with pool.acquire(timeout=10) as conn:
        user_uuid = await upsert_user(conn, current_user)
        row = await conn.fetchrow(
            "SELECT id::text AS id, title, blocks, created_at, updated_at FROM user_teachings "
            " WHERE id = $1::uuid AND user_id = $2::uuid AND is_archived = FALSE",
            teaching_id, user_uuid,
        )
    if row is None:
        raise HTTPException(status_code=404, detail="Teaching not found.")
    return _teaching(row)


@router.put("/v1/my-teachings/{teaching_id}", response_model=MyTeaching)
async def save_my_teaching(
    teaching_id: str,
    body: SaveTeachingRequest,
    current_user: User = Depends(get_current_user_required),
) -> MyTeaching:
    _require_partner(current_user)
    raw = _check_blocks(body.blocks)
    pool = get_pool()
    async with pool.acquire(timeout=10) as conn:
        user_uuid = await upsert_user(conn, current_user)
        row = await conn.fetchrow(
            "UPDATE user_teachings SET title = $3, blocks = $4::jsonb, updated_at = now() "
            " WHERE id = $1::uuid AND user_id = $2::uuid AND is_archived = FALSE "
            "RETURNING id::text AS id, title, blocks, created_at, updated_at",
            teaching_id, user_uuid, body.title, raw,
        )
    if row is None:
        raise HTTPException(status_code=404, detail="Teaching not found.")
    return _teaching(row)


@router.delete("/v1/my-teachings/{teaching_id}", status_code=204)
async def delete_my_teaching(
    teaching_id: str,
    current_user: User = Depends(get_current_user_required),
) -> Response:
    _require_partner(current_user)
    pool = get_pool()
    async with pool.acquire(timeout=10) as conn:
        user_uuid = await upsert_user(conn, current_user)
        result = await conn.execute(
            "UPDATE user_teachings SET is_archived = TRUE, updated_at = now() "
            " WHERE id = $1::uuid AND user_id = $2::uuid AND is_archived = FALSE",
            teaching_id, user_uuid,
        )
    if result.endswith(" 0"):
        raise HTTPException(status_code=404, detail="Teaching not found.")
    return Response(status_code=204)


# ----- For Teachers (top tier) -------------------------------------------------


class AssignmentSummary(DocSummary):
    due_date: Optional[date] = None


class Assignment(AssignmentSummary):
    instructions: str = ""
    include_text: bool = False
    blocks: List[dict]


class AssignmentsResponse(BaseModel):
    assignments: List[AssignmentSummary]


class SaveAssignmentRequest(BaseModel):
    title: str = Field(..., min_length=1, max_length=300)
    instructions: str = Field(default="", max_length=20_000)
    due_date: Optional[date] = None
    include_text: bool = False
    blocks: List[dict] = Field(default_factory=list)


_ASSIGN_COLS = (
    "id::text AS id, title, instructions, due_date, include_text, blocks, created_at, updated_at"
)


def _assignment(row) -> Assignment:
    return Assignment(
        id=row["id"], title=row["title"], instructions=row["instructions"] or "",
        due_date=row["due_date"], include_text=row["include_text"],
        blocks=_json(row["blocks"]) or [],
        created_at=row["created_at"], updated_at=row["updated_at"],
    )


@router.get("/v1/teacher/assignments", response_model=AssignmentsResponse)
async def list_assignments(current_user: User = Depends(get_current_user_required)) -> AssignmentsResponse:
    _require_teacher(current_user)
    pool = get_pool()
    async with pool.acquire(timeout=10) as conn:
        user_uuid = await upsert_user(conn, current_user)
        rows = await conn.fetch(
            "SELECT id::text AS id, title, due_date, created_at, updated_at FROM teacher_assignments "
            " WHERE user_id = $1::uuid AND is_archived = FALSE ORDER BY updated_at DESC",
            user_uuid,
        )
    return AssignmentsResponse(assignments=[AssignmentSummary(**dict(r)) for r in rows])


@router.post("/v1/teacher/assignments", response_model=Assignment, status_code=201)
async def create_assignment(
    body: SaveAssignmentRequest,
    current_user: User = Depends(get_current_user_required),
) -> Assignment:
    _require_teacher(current_user)
    raw = _check_blocks(body.blocks)
    pool = get_pool()
    async with pool.acquire(timeout=10) as conn:
        user_uuid = await upsert_user(conn, current_user)
        row = await conn.fetchrow(
            "INSERT INTO teacher_assignments (user_id, title, instructions, due_date, include_text, blocks) "
            "VALUES ($1::uuid, $2, $3, $4, $5, $6::jsonb) "
            f"RETURNING {_ASSIGN_COLS}",
            user_uuid, body.title, body.instructions, body.due_date, body.include_text, raw,
        )
    return _assignment(row)


@router.get("/v1/teacher/assignments/{assignment_id}", response_model=Assignment)
async def get_assignment(
    assignment_id: str,
    current_user: User = Depends(get_current_user_required),
) -> Assignment:
    _require_teacher(current_user)
    pool = get_pool()
    async with pool.acquire(timeout=10) as conn:
        user_uuid = await upsert_user(conn, current_user)
        row = await conn.fetchrow(
            f"SELECT {_ASSIGN_COLS} FROM teacher_assignments "
            " WHERE id = $1::uuid AND user_id = $2::uuid AND is_archived = FALSE",
            assignment_id, user_uuid,
        )
    if row is None:
        raise HTTPException(status_code=404, detail="Assignment not found.")
    return _assignment(row)


@router.put("/v1/teacher/assignments/{assignment_id}", response_model=Assignment)
async def save_assignment(
    assignment_id: str,
    body: SaveAssignmentRequest,
    current_user: User = Depends(get_current_user_required),
) -> Assignment:
    _require_teacher(current_user)
    raw = _check_blocks(body.blocks)
    pool = get_pool()
    async with pool.acquire(timeout=10) as conn:
        user_uuid = await upsert_user(conn, current_user)
        row = await conn.fetchrow(
            "UPDATE teacher_assignments SET title = $3, instructions = $4, due_date = $5, "
            "       include_text = $6, blocks = $7::jsonb, updated_at = now() "
            " WHERE id = $1::uuid AND user_id = $2::uuid AND is_archived = FALSE "
            f"RETURNING {_ASSIGN_COLS}",
            assignment_id, user_uuid, body.title, body.instructions, body.due_date,
            body.include_text, raw,
        )
    if row is None:
        raise HTTPException(status_code=404, detail="Assignment not found.")
    return _assignment(row)


@router.delete("/v1/teacher/assignments/{assignment_id}", status_code=204)
async def delete_assignment(
    assignment_id: str,
    current_user: User = Depends(get_current_user_required),
) -> Response:
    _require_teacher(current_user)
    pool = get_pool()
    async with pool.acquire(timeout=10) as conn:
        user_uuid = await upsert_user(conn, current_user)
        result = await conn.execute(
            "UPDATE teacher_assignments SET is_archived = TRUE, updated_at = now() "
            " WHERE id = $1::uuid AND user_id = $2::uuid AND is_archived = FALSE",
            assignment_id, user_uuid,
        )
    if result.endswith(" 0"):
        raise HTTPException(status_code=404, detail="Assignment not found.")
    return Response(status_code=204)
