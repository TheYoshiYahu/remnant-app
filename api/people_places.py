"""
people_places.py — S472: People & places pages + family-line trees (Study Notes).

Data: pp_entities / pp_links / pp_refs (migration session472_people_places.sql),
built by _s472_people_places_build.py from STEPBible TIPNR (CC BY 4.0) structure
and OpenBible pins (CC BY 4.0). Every verse and family link was confirmed against
the live app text before it was loaded. No outside descriptions are served; the
`blurb` column holds only text Yoshi has approved (NULL until then).

    GET /v1/people/verse/{book_slug}/{chapter}/{verse}   who and where is named in this verse
    GET /v1/people/search?q=                             name search
    GET /v1/people/{slug}                                one page: names, verses, family, line, pin

Tier: Study Notes and up (trial included). 403 carries the {tier_required, feature}
shape the app's tier-locked cards already read.
"""
from __future__ import annotations

from typing import List, Optional

from fastapi import APIRouter, Depends, HTTPException, Query, Response
from pydantic import BaseModel

from auth import User, get_current_user_optional, user_tier
from db import get_pool

router = APIRouter(tags=["people"])

PEOPLE_REQUIRED_TIER = "study_notes"
MAX_LINE = 120  # generations walked up the father line


class PPEntry(BaseModel):
    slug: str
    kind: str              # person / group / place
    type: Optional[str] = None
    name: str
    uncertain: bool = False


class PPLink(BaseModel):
    rel: str               # parent / child / spouse / sibling
    flags: str = ""        # a = ancestor, d = descended people, ? = ambiguous, f = founder
    proof: Optional[str] = None
    other: PPEntry


class PPRef(BaseModel):
    book_slug: str
    chapter: int
    verse: int


class PPPin(BaseModel):
    maps_place_id: Optional[str] = None
    lat: float
    lon: float


class PPNearby(BaseModel):
    slug: str
    name: str
    lat: float
    lon: float


class PPPage(BaseModel):
    entry: PPEntry
    names: List[str] = []
    original: Optional[str] = None
    blurb: Optional[str] = None
    refs: List[PPRef] = []
    links: List[PPLink] = []
    line: List[PPEntry] = []   # father line, this person first, back as far as the text confirms
    pin: Optional[PPPin] = None
    nearby: List[PPNearby] = []  # other confirmed pins within ~60 km, for the small map


class PPList(BaseModel):
    entries: List[PPEntry]


async def _require_people_tier(conn, current_user: Optional[User]) -> None:
    ok = await conn.fetchval(
        "SELECT tier_satisfies($1::content_tier, $2::content_tier)",
        user_tier(current_user),
        PEOPLE_REQUIRED_TIER,
    )
    if not ok:
        raise HTTPException(
            status_code=403,
            detail={"tier_required": PEOPLE_REQUIRED_TIER, "feature": "people_places"},
        )


def _entry(r) -> PPEntry:
    return PPEntry(slug=r["slug"], kind=r["kind"], type=r["type"], name=r["name"],
                   uncertain=bool(r["uncertain"]))


@router.get("/v1/people/verse/{book_slug}/{chapter}/{verse}", response_model=PPList)
async def people_in_verse(
    book_slug: str, chapter: int, verse: int, response: Response,
    current_user: Optional[User] = Depends(get_current_user_optional),
) -> PPList:
    pool = get_pool()
    async with pool.acquire(timeout=10) as conn:
        await _require_people_tier(conn, current_user)
        rows = await conn.fetch(
            "SELECT e.slug, e.kind, e.type, e.name, e.uncertain "
            "  FROM pp_refs r JOIN pp_entities e ON e.slug = r.slug "
            " WHERE r.book_slug = $1 AND r.chapter = $2 AND r.verse = $3 "
            " ORDER BY (e.kind = 'place'), e.ref_count DESC, e.name",
            book_slug, chapter, verse,
        )
    response.headers["Cache-Control"] = "private, max-age=3600"
    return PPList(entries=[_entry(r) for r in rows])


@router.get("/v1/people/search", response_model=PPList)
async def people_search(
    response: Response,
    q: str = Query(..., min_length=2, max_length=60),
    current_user: Optional[User] = Depends(get_current_user_optional),
) -> PPList:
    pool = get_pool()
    async with pool.acquire(timeout=10) as conn:
        await _require_people_tier(conn, current_user)
        rows = await conn.fetch(
            "SELECT slug, kind, type, name, uncertain FROM pp_entities "
            " WHERE lower(name) LIKE '%' || lower($1) || '%' "
            "    OR EXISTS (SELECT 1 FROM unnest(names) n WHERE lower(n) LIKE lower($1) || '%') "
            " ORDER BY (lower(name) = lower($1)) DESC, ref_count DESC, name LIMIT 60",
            q,
        )
    response.headers["Cache-Control"] = "private, max-age=3600"
    return PPList(entries=[_entry(r) for r in rows])


@router.get("/v1/people/{slug}", response_model=PPPage)
async def people_page(
    slug: str, response: Response,
    current_user: Optional[User] = Depends(get_current_user_optional),
) -> PPPage:
    pool = get_pool()
    async with pool.acquire(timeout=10) as conn:
        await _require_people_tier(conn, current_user)
        e = await conn.fetchrow(
            "SELECT slug, kind, type, name, names, original, uncertain, blurb, "
            "       maps_place_id, lat, lon FROM pp_entities WHERE slug = $1", slug)
        if e is None:
            raise HTTPException(status_code=404, detail="Not found.")
        refs = await conn.fetch(
            "SELECT book_slug, chapter, verse FROM pp_refs "
            " WHERE slug = $1 ORDER BY ord", slug)
        links = await conn.fetch(
            "SELECT l.rel, l.flags, l.proof, o.slug, o.kind, o.type, o.name, o.uncertain "
            "  FROM pp_links l JOIN pp_entities o ON o.slug = l.other "
            " WHERE l.slug = $1 ORDER BY CASE l.rel WHEN 'parent' THEN 0 WHEN 'spouse' THEN 1 "
            "       WHEN 'sibling' THEN 2 ELSE 3 END, o.name", slug)
        # father line: follow the male parent (not a far ancestor) as far as confirmed
        line = [_entry(e)]
        seen = {slug}
        cur = slug
        for _ in range(MAX_LINE):
            p = await conn.fetchrow(
                "SELECT o.slug, o.kind, o.type, o.name, o.uncertain "
                "  FROM pp_links l JOIN pp_entities o ON o.slug = l.other "
                " WHERE l.slug = $1 AND l.rel = 'parent' AND position('a' in l.flags) = 0 "
                "   AND o.type = 'Male' LIMIT 1", cur)
            if p is None or p["slug"] in seen:
                break
            seen.add(p["slug"])
            line.append(_entry(p))
            cur = p["slug"]
        nearby = []
        if e["lat"] is not None and e["lon"] is not None:
            nearby = await conn.fetch(
                "SELECT slug, name, lat, lon FROM pp_entities "
                " WHERE lat IS NOT NULL AND slug <> $1 "
                "   AND abs(lat - $2) < 0.55 AND abs(lon - $3) < 0.65 "
                " ORDER BY ref_count DESC LIMIT 14", slug, e["lat"], e["lon"])
    pin = None
    if e["lat"] is not None and e["lon"] is not None:
        pin = PPPin(maps_place_id=e["maps_place_id"], lat=e["lat"], lon=e["lon"])
    response.headers["Cache-Control"] = "private, max-age=3600"
    return PPPage(
        entry=_entry(e),
        names=list(e["names"] or []),
        original=e["original"],
        blurb=e["blurb"],
        refs=[PPRef(book_slug=r["book_slug"], chapter=r["chapter"], verse=r["verse"]) for r in refs],
        links=[PPLink(rel=l["rel"], flags=l["flags"], proof=l["proof"], other=_entry(l)) for l in links],
        line=line if e["kind"] != "place" else [],
        pin=pin,
        nearby=[PPNearby(slug=n["slug"], name=n["name"], lat=n["lat"], lon=n["lon"]) for n in nearby],
    )
