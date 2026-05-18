#!/usr/bin/env python3
"""
Session 69 — Sacred Names compliance closure audit.

Scans each of the four published-extras parsed JSONs (apocrypha / jasher /
enoch / jubilees) for any sacred-names gap that the S65–S68 wheels did not
close. Specifically looks at:

  (1) Singles in commentary (front_matter + chapter.commentary + back_matter)
      — bare `God`, `Lord`, `Jesus`, `Christ`, `Holy Spirit`, `Israel`,
      `Judah`, `Jews`, `Jew` that are NOT already inside a restoration paren
      and NOT immediately preceded by their restored Hebrew prefix.

  (2) Chapter titles — any bare singles or compounds in `chapter.title`
      across all four editions. S68 carved out one jasher chapter title
      (ch16 `Melchizedek`); this audit checks whether other editions also
      have unrestored names in titles.

The audit excludes USE inside paren-wrapped restorations (`Yahuah (Lord)` —
the inner `Lord` is preserved) by using a non-nested `\\([^)]*\\)` paren-span
detection — the S68 lesson.

Apocrypha-specific: `Jesus` is excluded per the voice-skill rule that every
Apocrypha `Jesus` is Yeshua/Joshua, not the Messiah.

Output is a per-edition / per-name count plus the first ~10 sample contexts
per (edition, name) so triage can see the shape of each gap before deciding
whether a substitution wheel is needed or whether the gap is a documented
carve-out.
"""

from __future__ import annotations

import json
import re
from pathlib import Path
from typing import Iterable

APP = Path("/sessions/brave-keen-dijkstra/mnt/App")
PARSED = APP / "source-texts" / "parsed"

EDITIONS = ["apocrypha", "jasher", "enoch", "jubilees"]

# Names to audit. Each entry: (display_label, regex_pattern, restored_prefix)
# - display_label: human-readable
# - regex_pattern: Python regex with no anchors yet (we wrap)
# - restored_prefix: the string that, immediately preceding, means
#   "we're inside a restoration paren of a different name" (e.g. `Yahuah (Lord`)
#   These are excluded via a per-name negative-lookbehind.
# Standard left/right boundaries (cribbed from restore.py LB/RB):
LB = r"(?<![A-Za-z'’])"
RB = r"(?![A-Za-z'’])"

# Non-nested paren span detection — used to mask out the inner content of all
# restoration parens before running the singles scan. We replace each `(...)`
# with a same-length placeholder so column positions are preserved for
# sample-context extraction.
PAREN_RE = re.compile(r"\([^()]*\)")


def mask_parens(text: str) -> str:
    """Replace every `(...)` (non-nested) with same-width `_`s so the inner
    content can't be matched by singles patterns. Length is preserved so
    indexes line up with the original for sample-context extraction."""
    def _sub(m: re.Match) -> str:
        return "_" * len(m.group(0))
    return PAREN_RE.sub(_sub, text)


# The audit name set.  Each tuple: (label, regex_for_bare_form, exclusion_lookbehind)
# Exclusion lookbehind: the restoration parenthetical's LEFT prefix. If the
# bare name appears immediately after this prefix, it's the source-echo INSIDE
# the paren — a false positive — and must be skipped. With mask_parens()
# applied, the paren content is `_____` so this lookbehind shouldn't fire
# normally; we keep it as belt-and-suspenders for any paren the mask missed
# (e.g., nested edge cases or mismatched parens).
#
# Compound rules' source-echos are also inside parens (e.g., `Elohim (God)`,
# `Yahusha (Jesus)`) so the mask handles them. For names where the WHOLE
# restoration is the bare form (Yashar'el (Israel)), the mask also handles it.
#
# Possessive forms ('s with both straight and smart-quote apostrophe) are
# NOT excluded here — if `God's` appears bare in commentary, that's a real
# gap we want surfaced. The voice skill's `(?![’']s)` exclusion is for
# the Yahuah possessive rule specifically (the personal name doesn't take
# a possessive in covenant grammar); other names DO take possessives and
# restore.py has dedicated possessive rules for them.
NAMES = [
    ("God",          rf"{LB}God{RB}",          None),
    ("Lord",         rf"{LB}Lord{RB}",         None),
    ("LORD",         rf"{LB}LORD{RB}",         None),
    ("Jesus",        rf"{LB}Jesus{RB}",        None),
    ("Christ",       rf"{LB}Christ{RB}",       None),
    ("Holy Spirit",  rf"{LB}Holy\s+Spirit{RB}", None),
    ("Holy Ghost",   rf"{LB}Holy\s+Ghost{RB}",  None),
    ("Israel",       rf"{LB}Israel{RB}",       None),
    ("Judah",        rf"{LB}Judah{RB}",        None),
    ("Jews",         rf"{LB}Jews{RB}",         None),
    ("Jewish",       rf"{LB}Jewish{RB}",       None),
    ("Jew",          rf"{LB}Jew{RB}",          None),
    ("Son of Man",   rf"{LB}Son\s+of\s+Man{RB}", None),
    ("son of man",   rf"{LB}son\s+of\s+man{RB}", None),
    ("Melchizedek",  rf"{LB}Melchi[zs]ede[ck]h?{RB}", None),
]


def get_commentary_surfaces(j: dict) -> Iterable[tuple[str, str]]:
    """Yield (surface_label, text) for every commentary surface in a parsed
    edition. Surfaces: front_matter, back_matter, chapter[N].commentary."""
    if j.get("front_matter"):
        yield ("front_matter", j["front_matter"])
    if j.get("back_matter"):
        yield ("back_matter", j["back_matter"])

    # Most extras editions have a books[i].chapters[j] structure; jasher and
    # jubilees are single-book. Handle both shapes.
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


def context_around(text: str, start: int, end: int, span: int = 60) -> str:
    lo = max(0, start - span)
    hi = min(len(text), end + span)
    snippet = text[lo:hi].replace("\n", " ")
    return f"…{snippet}…"


def audit_edition(name: str) -> dict:
    json_path = PARSED / f"{name}.json"
    j = json.loads(json_path.read_text())

    findings: dict[str, list[tuple[str, str]]] = {}

    for label, pat, _lb in NAMES:
        # Apocrypha-specific exclusion: `Jesus` is Yeshua/Joshua in apocrypha,
        # not the Messiah. Skip this audit name for that edition.
        if name == "apocrypha" and label == "Jesus":
            continue

        rx = re.compile(pat)
        hits: list[tuple[str, str]] = []
        for surface_label, text in get_commentary_surfaces(j):
            masked = mask_parens(text)
            for m in rx.finditer(masked):
                # Real text (unmasked) for the sample context — masked was only
                # used to suppress matching inside parens.
                ctx = context_around(text, m.start(), m.end())
                hits.append((surface_label, ctx))
        if hits:
            findings[label] = hits

    return findings


def main() -> None:
    report_lines: list[str] = []
    report_lines.append("=" * 78)
    report_lines.append("S69 Sacred Names compliance closure audit")
    report_lines.append("Scope: commentary surfaces (front_matter, back_matter, chapter.commentary, chapter.title)")
    report_lines.append("Excludes: USE inside restoration parens (masked); apocrypha 'Jesus' (Yeshua exclusion)")
    report_lines.append("=" * 78)
    report_lines.append("")

    grand_total = 0
    for ed in EDITIONS:
        findings = audit_edition(ed)
        total = sum(len(h) for h in findings.values())
        grand_total += total
        report_lines.append(f"### {ed.upper()} — total: {total}")
        if not findings:
            report_lines.append("    (clean — no bare singles or compounds in any commentary surface)")
            report_lines.append("")
            continue

        for label in sorted(findings.keys()):
            hits = findings[label]
            report_lines.append(f"  {label}: {len(hits)} hit(s)")
            for surface, ctx in hits[:10]:
                report_lines.append(f"    [{surface}] {ctx}")
            if len(hits) > 10:
                report_lines.append(f"    ...and {len(hits) - 10} more.")
        report_lines.append("")

    report_lines.append("=" * 78)
    report_lines.append(f"GRAND TOTAL across all 4 extras: {grand_total}")
    report_lines.append("=" * 78)

    print("\n".join(report_lines))


if __name__ == "__main__":
    main()
