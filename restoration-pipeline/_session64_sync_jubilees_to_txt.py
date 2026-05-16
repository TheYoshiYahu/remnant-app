#!/usr/bin/env python3
"""
_session64_sync_jubilees_to_txt.py
----------------------------------
S64 durability wheel: sync the Jubilees-Restored-Names-Edition.txt mirror
at source-texts/existing-restored-editions/ to match the wheel-state of
source-texts/parsed/jubilees.json.

Scope (from the S64 byte-equal probe):
  * Single divergence chapter: ch50 commentary only.
  * Single substitution rule: 15 instances of ALL-CAPS "YAHUAH (God)"
    in the .txt commentary zone where the live JSON has title-case
    "Yahuah (God)". All 15 fall inside ch50's commentary zone (after
    the bare `Commentary` marker at offset 599509). Zero occurrences
    of YAHUAH appear in any verse zone or in any other chapter.

Why the .txt drifted: the wheel work that normalized the Hebrew name
casing landed on the live JSON only; the upstream .txt mirror was not
back-fixed at the time. A Phase-D re-parse would silently regress the
API. This script back-fixes the .txt so re-parse is durably byte-equal
to the live JSON.

Strategy (clone of S63's Enoch sync pattern — DO NOT FORK the
architecture; only the rule set, parser-shape sentinels, and chapter
count differ):

  * Read the .txt, parse it in-memory via parse_published_editions to
    confirm structural integrity (50 chapters).
  * For each chapter body, split into verse-zone and commentary-zone
    at the bare `Commentary` marker line. Apply substitutions to the
    commentary zone only (verse zones are clean per the probe).
  * Write the updated .txt over the original (after .pre-s64 backup).
  * Caller follows up with the byte-equal proof against the live JSON.

Jubilees parser-shape gotchas vs. Enoch (parse_published_editions.py
:475-509):
  * Heading: `^Chapter N — Title$` (em-dash separator, NOT colon)
  * Commentary marker: `^Commentary$` (bare, NOT `Commentary on Chapter N`)
  * allow_implicit_verse_1=True (verse 1 is implicit, no explicit marker)
  * allow_verse_gaps=True (verse markers occasionally drop at paragraph
    breaks: 5 → 7, 16 → 18, etc.)

S63 lesson carried forward (no MENTION stash needed for this wheel,
but recorded here so future cloners see it): in Python 3.10,
`re.escape("Son of Man")` escapes spaces to `\\ `, breaking
`re.sub(r"\\s+", r"\\\\s+", ...)` line-wrap-tolerance — produces
literal-backslash patterns that silently match nothing. For
alphanumeric+space phrases, skip `re.escape`. This wheel does no
phrase-stash work (the substitution is a single word with `\\b`
boundaries) so the gotcha does not bite here.

Idempotent: running twice produces the same result. The substitution
is case-sensitive (`\\bYAHUAH\\b`); already-lowercased `Yahuah` does
not match.
"""

from __future__ import annotations

import json
import os
import re
import shutil
import sys
from dataclasses import asdict

# ---------------------------------------------------------------------------
# Paths
# ---------------------------------------------------------------------------

def _resolve_app() -> str:
    if os.environ.get("APP_ROOT"):
        return os.environ["APP_ROOT"]
    sandbox = "/sessions/practical-intelligent-wright/mnt/App"
    if os.path.isdir(sandbox):
        return sandbox
    host = os.path.expanduser("~/Desktop/App")
    if os.path.isdir(host):
        return host
    raise RuntimeError("cannot resolve App root")


APP = _resolve_app()
sys.path.insert(0, os.path.join(APP, "restoration-pipeline"))
os.environ.setdefault("APP_ROOT", APP)

from parse_published_editions import parse_jubilees  # noqa: E402

TXT = os.path.join(
    APP,
    "source-texts/existing-restored-editions/Jubilees-Restored-Names-Edition.txt",
)
LIVE = os.path.join(APP, "source-texts/parsed/jubilees.json")
BACKUP = TXT + ".pre-s64"


# ---------------------------------------------------------------------------
# Anchored content deletions (none for S64)
# ---------------------------------------------------------------------------
#
# The S57(b)-style hand-edits that required anchored deletions in the
# Enoch wheel (ch6 scaffolding scrub, ch46 duplicate Formless/Formed
# block) have no Jubilees equivalent at this wheel-state. The S64 probe
# found a single divergence pattern that is fully expressible as a
# regex substitution. Architecture preserved (empty list) so future
# wheel work that needs an anchored deletion has a slot to fill.
# ---------------------------------------------------------------------------

ANCHORED_DELETIONS: list[tuple[int, str]] = []


def _anchor_to_regex(anchor: str) -> re.Pattern:
    """
    Build a regex from a parsed-form anchor string. Any whitespace in the
    anchor becomes `\\s+` so it matches the .txt's line-wrapped form.
    Non-whitespace chars are escaped. A leading whitespace match is
    appended so an adjacent space/newline before the anchor is also
    consumed (so we don't leave a double-space in the gap).
    """
    parts = re.split(r"(\s+)", anchor)
    pat = []
    for p in parts:
        if re.fullmatch(r"\s+", p):
            pat.append(r"\s+")
        else:
            pat.append(re.escape(p))
    return re.compile(r"\s*" + "".join(pat))


# ---------------------------------------------------------------------------
# Regex substitution rules (commentary-zone only)
# ---------------------------------------------------------------------------
#
# Single rule for S64. Architecture preserved (list) so future Jubilees
# wheel work can add rules in the same shape the Enoch wheel uses.
# ---------------------------------------------------------------------------

# Rule A: All-caps "YAHUAH" → "Yahuah"
# Case-sensitive `\bYAHUAH\b` — does not match already-lowercased
# `Yahuah` (idempotent). Parenthetical `(God)` is preserved as-is
# (both .txt and live JSON carry the same parenthetical on every
# instance; only the Hebrew name casing differs).
R_YAHUAH_CAPS = (
    "yahuah_caps",
    re.compile(r"\bYAHUAH\b"),
    "Yahuah",
)


# ---------------------------------------------------------------------------
# MENTION carve-outs — none for S64
# ---------------------------------------------------------------------------
#
# The Enoch wheel preserved 9 specific Son-of-Man / son-of-man MENTION
# instances (commentary meta-discussing the phrase as a phrase) via a
# pre-stash / post-unstash mechanism. The S64 probe found no Jubilees
# MENTION cases that need to escape the substitution rule (case-
# sensitive `\bYAHUAH\b` does not collide with meta-discussion of
# the Hebrew name in any form the live JSON preserves). Architecture
# preserved (empty list) so future wheel work has a slot.
# ---------------------------------------------------------------------------

_PLACEHOLDER_PREFIX = "\x00MENTION_S64\x00"
MENTION_ANCHORS: list[tuple[str, str, str]] = []


def _stash_mentions(text: str, stats: dict) -> str:
    """No-op for S64 (no MENTION carve-outs)."""
    return text


def _unstash_mentions(text: str) -> str:
    """No-op for S64."""
    return text


COMMENTARY_RULES = [
    R_YAHUAH_CAPS,
]


# ---------------------------------------------------------------------------
# Chapter region extraction (Jubilees sentinels)
# ---------------------------------------------------------------------------

# Em-dash heading (NOT colon — that's Jasher/Enoch)
HEADING_RE = re.compile(r"^Chapter\s+(\d+)\s+—\s+(.+)$", re.MULTILINE)

# Bare `Commentary` marker (NOT `Commentary on Chapter N` — that's Enoch)
COMMENTARY_MARKER_RE = re.compile(r"^Commentary\s*$", re.MULTILINE)


def find_chapter_regions(txt: str) -> list[tuple[int, int, int, int, int]]:
    """
    Return list of (ch_num, heading_start, body_start, com_start, body_end)
    tuples for each chapter, in order.

      - heading_start: offset of the 'Chapter N — Title' line
      - body_start:    offset right after the heading line
      - com_start:     offset of the bare 'Commentary' line
                       (or body_end if no commentary marker found)
      - body_end:      offset of the next chapter's heading_start
                       (or len(txt) for the final chapter)

    Jubilees note: verse 1 is implicit (no explicit `1` marker), so the
    Enoch-style heading filter (look for line-start `1 ` in the next
    ~600 chars) would silently drop every Jubilees heading. The filter
    is removed here. Jubilees chapter headings are unambiguous via the
    em-dash sentinel; no TOC or in-prose references collide.
    """
    real_heads = list(HEADING_RE.finditer(txt))

    # Dedupe by chapter number (defensive — should be no-op for Jubilees,
    # which has no TOC entries matching the em-dash heading form). Keep
    # first occurrence.
    seen = set()
    unique = []
    for m in real_heads:
        n = int(m.group(1))
        if n in seen:
            continue
        seen.add(n)
        unique.append(m)
    real_heads = unique

    regions = []
    for i, m in enumerate(real_heads):
        ch_num = int(m.group(1))
        heading_start = m.start()
        body_start = m.end()
        if i + 1 < len(real_heads):
            body_end = real_heads[i + 1].start()
        else:
            body_end = len(txt)
        com_match = COMMENTARY_MARKER_RE.search(txt, body_start, body_end)
        com_start = com_match.start() if com_match else body_end
        regions.append((ch_num, heading_start, body_start, com_start, body_end))
    return regions


# ---------------------------------------------------------------------------
# Rule application
# ---------------------------------------------------------------------------

def apply_anchored_deletions(commentary: str, ch_num: int, stats: dict) -> str:
    """No-op for S64 (ANCHORED_DELETIONS empty). Architecture preserved."""
    out = commentary
    for ch, anchor in ANCHORED_DELETIONS:
        if ch != ch_num:
            continue
        pat = _anchor_to_regex(anchor)
        new_out, count = pat.subn("", out)
        if count:
            stats.setdefault(f"anchored_del_ch{ch_num}", 0)
            stats[f"anchored_del_ch{ch_num}"] += count
            stats.setdefault("anchored_deletions", 0)
            stats["anchored_deletions"] += count
            out = new_out
    return out


def apply_rules_to_commentary(commentary: str, ch_num: int, stats: dict) -> str:
    """Apply all commentary-zone rules."""
    out = commentary
    # 1. Anchored deletions (no-op for S64)
    out = apply_anchored_deletions(out, ch_num, stats)
    # 2. MENTION stash (no-op for S64)
    out = _stash_mentions(out, stats)
    # 3. Regex rules
    for name, pat, repl in COMMENTARY_RULES:
        new_out, count = pat.subn(repl, out)
        if count:
            stats.setdefault(name, 0)
            stats[name] += count
            stats.setdefault(f"{name}_ch{ch_num}", 0)
            stats[f"{name}_ch{ch_num}"] += count
            out = new_out
    # 4. MENTION unstash (no-op for S64)
    out = _unstash_mentions(out)
    return out


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

def main(dry_run: bool = False):
    print(f"APP  = {APP}", file=sys.stderr)
    print(f"TXT  = {TXT}", file=sys.stderr)
    print(f"LIVE = {LIVE}", file=sys.stderr)

    with open(TXT, encoding="utf-8") as f:
        original = f.read()

    # Pre-flight structural check via the production parser
    pre = parse_jubilees(original)
    pre_chs = pre.books[0].chapters
    if len(pre_chs) != 50:
        raise RuntimeError(f"expected 50 chapters in pre-parse, got {len(pre_chs)}")

    with open(LIVE, encoding="utf-8") as f:
        live = json.load(f)
    live_chs = live["books"][0]["chapters"]
    if len(live_chs) != 50:
        raise RuntimeError(f"expected 50 chapters in live JSON, got {len(live_chs)}")

    # Locate chapter regions in raw .txt
    regions = find_chapter_regions(original)
    print(f"found {len(regions)} chapter regions", file=sys.stderr)
    if len(regions) != 50:
        raise RuntimeError(f"expected 50 chapter regions, got {len(regions)}")

    # Apply rules per chapter's commentary zone
    stats: dict = {}
    out_parts = []
    cursor = 0
    for ch_num, h_start, b_start, c_start, b_end in regions:
        # Copy [cursor, c_start) unchanged (front matter or verse zone)
        out_parts.append(original[cursor:c_start])
        # c_start points at the 'Commentary' marker line itself;
        # leave that marker line intact and operate on the prose AFTER it.
        marker_match = COMMENTARY_MARKER_RE.match(original, c_start)
        if marker_match:
            marker_end = marker_match.end()
            out_parts.append(original[c_start:marker_end])
            prose = original[marker_end:b_end]
            new_prose = apply_rules_to_commentary(prose, ch_num, stats)
            out_parts.append(new_prose)
        else:
            # No commentary marker — leave intact
            out_parts.append(original[c_start:b_end])
        cursor = b_end
    out_parts.append(original[cursor:])
    updated = "".join(out_parts)

    # Stats summary
    print("\n=== substitution summary (totals across all chapters) ===", file=sys.stderr)
    summary_rules = [
        "anchored_deletions",
        "mention_stashed",
        "yahuah_caps",
    ]
    for name in summary_rules:
        print(f"  {name:>24s}: {stats.get(name, 0)}", file=sys.stderr)

    # Per-chapter for the firing rule
    print("\n=== per-chapter rule fires ===", file=sys.stderr)
    for k, v in sorted(stats.items()):
        if "_ch" in k:
            print(f"  {k:>24s}: {v}", file=sys.stderr)

    if dry_run:
        print("\n=== DRY RUN — not writing ===", file=sys.stderr)
        return updated, stats

    # Backup
    if not os.path.exists(BACKUP):
        shutil.copy2(TXT, BACKUP)
        print(f"backed up to {BACKUP}", file=sys.stderr)

    with open(TXT, "w", encoding="utf-8") as f:
        f.write(updated)
    print(f"wrote updated .txt to {TXT}", file=sys.stderr)

    return updated, stats


if __name__ == "__main__":
    import argparse
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()
    main(dry_run=args.dry_run)
