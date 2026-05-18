#!/usr/bin/env python3
"""
Session 69 — Audit refinement.

Refines the raw counts from _s69_audit.py against documented carve-outs:
  - PRESERVED_PHRASES from restore.py (`Jew and Gentile binary`)
  - The S65 "bare-God follow-ons" deferred family (apocrypha + extras)
  - The S63/S57(b) Enoch MENTION cases for Son of Man
  - The S68 jasher ch16 chapter title Melchizedek carve-out
  - Chapter titles policy across editions (English forms convention)
  - The S65 MENTION carve-out (`The personal name X does not naturally take a possessive`)
  - The "Did God really say?" Genesis 3 echo carve-out
  - The "Lord of lords / Lord of the sheep" enoch literary-device carve-out

Also: focused triage on the JASHER COMMENTARY COVENANT-PEOPLE-NAMES class —
the new candidate gap surfaced by _s69_audit.py. Distinguish: (i) bare
singles that should restore per the pipeline rule (real gaps); (ii) MENTION
cases discussing the convention (carve-outs); (iii) the `Jew and Gentile
binary` preserved phrase.
"""

from __future__ import annotations

import json
import re
from pathlib import Path
from typing import Iterable

APP = Path("/sessions/brave-keen-dijkstra/mnt/App")
PARSED = APP / "source-texts" / "parsed"

LB = r"(?<![A-Za-z'’])"
RB = r"(?![A-Za-z'’])"
PAREN_RE = re.compile(r"\([^()]*\)")


def mask_parens(text: str) -> str:
    def _sub(m):
        return "_" * len(m.group(0))
    return PAREN_RE.sub(_sub, text)


def get_commentary_surfaces(j: dict) -> Iterable[tuple[str, str]]:
    if j.get("front_matter"):
        yield ("front_matter", j["front_matter"])
    if j.get("back_matter"):
        yield ("back_matter", j["back_matter"])
    if "books" in j:
        for bk_i, bk in enumerate(j["books"]):
            bk_name = bk.get("name") or f"book_{bk_i}"
            for ch in bk.get("chapters", []):
                ch_no = ch.get("number", "?")
                if ch.get("commentary"):
                    yield (f"{bk_name} ch{ch_no} commentary", ch["commentary"])
                if ch.get("title"):
                    yield (f"{bk_name} ch{ch_no} title", ch["title"])
    elif "chapters" in j:
        for ch in j["chapters"]:
            ch_no = ch.get("number", "?")
            if ch.get("commentary"):
                yield (f"ch{ch_no} commentary", ch["commentary"])
            if ch.get("title"):
                yield (f"ch{ch_no} title", ch["title"])


def context_around(text: str, start: int, end: int, span: int = 80) -> str:
    lo = max(0, start - span)
    hi = min(len(text), end + span)
    snippet = text[lo:hi].replace("\n", " ")
    return f"…{snippet}…"


# Documented carve-outs that should EXCLUDE a hit from the fire-count.
# Each is a regex matched against the immediate context window (~120 chars
# centered on the hit). If matched, the hit is a carve-out, not a gap.
JEW_GENTILE_BINARY_RE = re.compile(r"Jew[- ]?and[- ]?Gentile[- ]?binary", re.IGNORECASE)
# Smart-quote MENTION pattern — when the bare name is inside smart-quotes,
# it's likely a MENTION discussing the term itself, not a USE.
SMART_QUOTE_MENTION_RE = re.compile(r"[“”\"'][^\"”]*\b{}\b[^\"”]*[“”\"']")

# Headings-context detector — `chapter X title` surface is the title field.
def is_chapter_title_surface(surface: str) -> bool:
    return surface.endswith(" title")


def audit_jasher_covenant_singles() -> dict:
    """Focused audit of jasher covenant-people-names singles in commentary.

    Returns:
      {
        "Israel": {"real_gaps": [...], "carve_outs": [...]},
        "Judah":  {...},
        "Jews":   {...},
        "Jew":    {...},
        "Jewish": {...},
      }
    """
    j = json.loads((PARSED / "jasher.json").read_text())

    NAMES = [
        ("Israel", rf"{LB}Israel{RB}"),
        ("Judah",  rf"{LB}Judah{RB}"),
        ("Jews",   rf"{LB}Jews{RB}"),
        ("Jewish", rf"{LB}Jewish{RB}"),
        ("Jew",    rf"{LB}Jew{RB}"),
    ]

    out = {}
    for label, pat in NAMES:
        rx = re.compile(pat)
        real_gaps: list[tuple[str, str]] = []
        carve_outs: list[tuple[str, str, str]] = []  # (surface, ctx, reason)

        for surface_label, text in get_commentary_surfaces(j):
            masked = mask_parens(text)
            for m in rx.finditer(masked):
                ctx_full = context_around(text, m.start(), m.end(), span=100)

                # Carve-out check #1: Jew-and-Gentile binary preserved phrase.
                # Only applies to Jew/Jews patterns.
                if label in ("Jew", "Jews", "Jewish"):
                    # Match the preserved-phrase context anywhere in the
                    # window. The actual restore.py rule is bound to the
                    # phrase "Jew and Gentile binary".
                    if JEW_GENTILE_BINARY_RE.search(ctx_full):
                        carve_outs.append((surface_label, ctx_full, "Jew-and-Gentile binary preserved phrase"))
                        continue

                # Carve-out check #2: cross-reference summary line in
                # back_matter listing scriptural cross-refs as a topic index
                # (smart-em-dash separators, terse list form). These are
                # cross-reference summaries Yoshi uses to navigate the topics
                # of each Jasher chapter; preserving them as cross-ref
                # summary entries is consistent with the citation-paren
                # carve-out family (S67 enoch ch60 precedent).
                #
                # Pattern: short context, em-dash separators, scripture refs
                # like "Hebrews X:Y — phrase". Conservative test: 2+ em-dashes
                # within the immediate 80-char window AND a scripture-ref
                # token (book name + chapter:verse) AND the bare name appears
                # in an obvious title or descriptor position.
                window = text[max(0, m.start() - 40): min(len(text), m.end() + 40)]
                em_dash_count = window.count("—")
                has_scripture_ref = bool(re.search(r"\b[A-Z][a-z]+(?:\s+[A-Z][a-z]+)?\s+\d+(?::\d+)?", window))
                if surface_label.endswith("back_matter") and em_dash_count >= 2 and has_scripture_ref:
                    # Heuristic carve-out — surface to triage rather than auto-classify.
                    carve_outs.append((surface_label, ctx_full, "back_matter cross-ref-summary line (heuristic)"))
                    continue

                # Otherwise: real gap candidate.
                real_gaps.append((surface_label, ctx_full))

        out[label] = {"real_gaps": real_gaps, "carve_outs": carve_outs}
    return out


def main():
    print("=" * 78)
    print("S69 audit refinement — focused on jasher commentary covenant-people-names")
    print("=" * 78)

    findings = audit_jasher_covenant_singles()
    grand_real = 0
    grand_carve = 0
    for label, buckets in findings.items():
        real = buckets["real_gaps"]
        carves = buckets["carve_outs"]
        grand_real += len(real)
        grand_carve += len(carves)
        print(f"\n### {label}")
        print(f"  Real gaps: {len(real)}  /  Carve-outs: {len(carves)}")
        if real[:5]:
            print("  Real gap samples:")
            for s, c in real[:5]:
                print(f"    [{s}] {c}")
        if carves[:5]:
            print("  Carve-out samples:")
            for s, c, r in carves[:5]:
                print(f"    [{s}] [{r}] {c}")

    print("\n" + "=" * 78)
    print(f"JASHER TOTALS: {grand_real} real-gap candidates, {grand_carve} carve-outs")
    print("=" * 78)


if __name__ == "__main__":
    main()
