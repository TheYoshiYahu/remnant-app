#!/usr/bin/env python3
"""
_session61_sync_jasher_to_txt.py
--------------------------------
S61 durability wheel: sync the Jasher-Restored-Names-Edition.txt mirror
at source-texts/existing-restored-editions/ to match the wheel-state of
source-texts/parsed/jasher.json (which holds S58 Q39 commentary fixes,
S59 + S60 Sacred Names full-scope apply).

After S57, all wheel work has gone to parsed/jasher.json only — the
upstream .txt mirror is at the pre-S58 state. A Phase-D re-parse would
silently regress the API. This script back-fixes the .txt so re-parse
is durably byte-equal to the live JSON.

Strategy:
  * Read the .txt, parse it in-memory via parse_published_editions to
    confirm structural integrity (91 chapters, expected verse counts).
  * Apply regex-based Sacred Names substitutions to the .txt body
    region only (chapter bodies — never front matter or back matter).
  * Carve-outs are encoded as negative lookbehinds / chapter-scoped
    skips matching what the S58/S60 wheels preserved.
  * Write the updated .txt over the original (after .pre-s61 backup).
  * Caller is expected to follow up with a re-parse + byte-equal proof
    against the live JSON.

Idempotent: running twice produces the same result as running once
(substitution targets like "Yahuah" / "Yashar'el (Israel)" / "Elohim
(God)" have negative lookbehinds preventing double-wrapping).
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
    sandbox = "/sessions/modest-nice-darwin/mnt/Desktop/App"
    if os.path.isdir(sandbox):
        return sandbox
    host = os.path.expanduser("~/Desktop/App")
    if os.path.isdir(host):
        return host
    raise RuntimeError("cannot resolve App root")


APP = _resolve_app()
sys.path.insert(0, os.path.join(APP, "restoration-pipeline"))

# Force APP_ROOT so the parser resolves paths inside the sandbox
os.environ.setdefault("APP_ROOT", APP)

from parse_published_editions import parse_jasher  # noqa: E402

TXT = os.path.join(
    APP,
    "source-texts/existing-restored-editions/Jasher-Restored-Names-Edition.txt",
)
LIVE = os.path.join(APP, "source-texts/parsed/jasher.json")
BACKUP = TXT + ".pre-s61"

BACK_MATTER_MARKER = "The commentary for the Book of Jasher is now complete."

# ---------------------------------------------------------------------------
# Substitution rules
# ---------------------------------------------------------------------------
#
# Each rule is (name, pattern, replacement, scope, flags).
# scope is one of: "body" (applies to all chapter bodies), "commentary"
# (applies only to commentary regions of chapter bodies), or
# {"only_ch": [..]} / {"except_ch": [..]} for chapter-scoped exceptions.
#
# All replacements are designed to be idempotent: re-running the rule
# on already-substituted text does not double-wrap.
# ---------------------------------------------------------------------------

# Rule 1: YAHUAH (all caps) -> Yahuah (typography)
# Applies everywhere in chapter bodies (verses + commentary).
# Word boundary on both sides. Negative lookahead ensures we don't
# touch "YAHUAH'S" or similar in awkward ways — but caps possessive
# "YAHUAH'S" would be `\bYAHUAH'S\b` and is rare; the brief specifies
# bare YAHUAH only.
R_YAHUAH = (
    "yahuah_caps",
    re.compile(r"\bYAHUAH\b"),
    "Yahuah",
    "body",
)

# Rule 2: "sons of men" (plural, lower-case) -> "sons of Adam"
# Tolerates wrapped whitespace (\s+) between ANY adjacent words —
# the .txt wraps verses at ~73 cols and "sons of men" can break as
# "sons\n    of men" or "sons of\n    men".
# Word boundary on both sides. The replacement text differs, so
# re-running on already-substituted text is idempotent.
R_SONS_LC = (
    "sons_of_men_lc",
    re.compile(r"\bsons\s+of\s+men\b"),
    "sons of Adam",
    "body",
)

# Rule 3: "Sons of men" (plural, capitalized) -> "Sons of Adam"
R_SONS_UC = (
    "sons_of_men_uc",
    re.compile(r"\bSons\s+of\s+men\b"),
    "Sons of Adam",
    "body",
)

# Rule 4: Bare "Israel" -> "Yashar'el (Israel)" — COMMENTARY ONLY
# The "bare" carve-out skips:
#  - already followed by "(...)" (some other paren form already present)
#  - immediately preceded by "Yashar'el " (already substituted, idempotent)
#  - immediately preceded by "Yashar'el (" (the inner Israel inside an
#    already-wrapped source-echo paren — must not double-wrap)
R_ISRAEL = (
    "israel_bare",
    # \s in the lookbehinds matches either a literal space or a newline —
    # the .txt wraps at ~73 cols and "Yashar'el (Israel)" frequently breaks
    # as "Yashar'el\n(Israel)" with a newline between the name and the paren.
    # ['’] handles both straight and smart apostrophes in "Yashar'el"
    # (the .txt has both variants in different places).
    # NOTE: no negative lookahead for "(...)" — the wheel substitutes
    # "Israel (Exodus 12:38)" → "Yashar'el (Israel) (Exodus 12:38)" by
    # adding the source-echo paren before any existing citation paren.
    re.compile(r"(?<!Yashar['’]el\s)(?<!Yashar['’]el\s\()\bIsrael\b"),
    "Yashar'el (Israel)",
    "commentary",
)

# Rule 5: Bare "Judah" -> "Yahudah (Judah)" — COMMENTARY ONLY
R_JUDAH = (
    "judah_bare",
    re.compile(r"(?<!Yahudah\s)(?<!Yahudah\s\()\bJudah\b"),
    "Yahudah (Judah)",
    "commentary",
)

# Rule 6: Bare "God" -> "Elohim (God)" — COMMENTARY ONLY
# Negative lookbehinds prevent double-wrapping and source-echo paren
# overlap:
#   (?<![\w\-])           : not preceded by a word char or hyphen
#                           (skips "God-of-..." compounds)
#   (?<!Elohim \()        : not the inner God of "Elohim (God)"
#   (?<!Yahuah \()        : not the inner God of "Yahuah (God)" source-echo
#   (?<!Yahuah's \()      : not the possessive form's inner God
#   (?<!the LORD )        : not the inner God of "the LORD God" (handled
#                           by R_LORD_GOD in restore.py; sync should not
#                           re-fire on what's already substituted there)
#   (?<!the Lord )        : same, lower-case
#   (?<!the LORD God\) )  : not the trailing-prose God after a closed paren
#   (?<!death of )        : ch9 scare-quote carve-out
# Negative lookahead: not followed by "(...)" (already paren'd) and not
# followed by hyphen / word char.
R_GOD = (
    "god_bare",
    re.compile(
        r"(?<![\w\-])"
        r"(?<!Elohim\s\()"
        r"(?<!Yahuah\s\()"
        r"(?<!Yahuah's\s\()"
        r"(?<!the LORD\s)"
        r"(?<!the Lord\s)"
        r"(?<!death of\s)"
        r"God\b(?!\s*\()(?![\w\-])"
    ),
    "Elohim (God)",
    "commentary",
)

# Rule 7: Article fixup: "a Elohim" -> "an Elohim"
# This is a post-fixup that runs AFTER R_GOD, catching "a God" that
# became "a Elohim (God)" — the article needs to update for the new
# noun phrase. `\s+` tolerates line-wrapped "a\n    Elohim".
R_ARTICLE = (
    "article_a_elohim",
    re.compile(r"\ba\s+Elohim\b"),
    "an Elohim",
    "commentary",
)

# Rule 8: "Son of Man" / "Son of man" (capitalized first word) -> "Son of Adam"
# Singular Messianic title or capitalized sentence-start vocative.
R_SON_OF_MAN_UC = (
    "son_of_man_uc",
    re.compile(r"\bSon\s+of\s+[Mm]an\b"),
    "Son of Adam",
    "body",
)

# Rule 9: "son of man" all-lower-case -> "son of Adam"
# Generic / vocative ("O son of man"). The ch3 MENTION carve-outs are
# encoded as negative lookbehinds on the immediately-preceding word —
# "the phrase son of man" and "making son of man" mention the phrase as
# a phrase rather than using it, so the wheel preserved them. Hyphenated
# forms ("son-of-man") are auto-preserved because the regex requires \s+
# between words rather than hyphens.
R_SON_OF_MAN_LC = (
    "son_of_man_lc",
    re.compile(r"(?<!phrase\s)(?<!making\s)\bson\s+of\s+man\b"),
    "son of Adam",
    "body",
)

# Rule 10: "Ancient of Days" — first-mention paren carve-out.
# Wheel substitution: the canonical English "Ancient of Days" (from
# Daniel 7) is restored to its Hebrew form "Head of Days". The
# source-echo paren is only added at the FIRST mention per chapter;
# subsequent mentions are bare "Head of Days" (per the brief's S58
# ch3/ch9 "Head of Days first-mention paren" carve-out, which the
# wheel applied universally across all chapters with multiple mentions).
# Implemented as a stateful function rather than a regex rule because
# regex cannot express "first match only".
_ANCIENT_OF_DAYS_PAT = re.compile(r"\bAncient\s+of\s+Days\b(?!\s*\))")


def _apply_ancient_of_days(text: str, ch_num: int, stats: dict) -> str:
    matches = list(_ANCIENT_OF_DAYS_PAT.finditer(text))
    if not matches:
        return text
    out_parts = []
    last = 0
    for i, m in enumerate(matches):
        out_parts.append(text[last:m.start()])
        if i == 0:
            out_parts.append("Head of Days (Ancient of Days)")
        else:
            out_parts.append("Head of Days")
        last = m.end()
    out_parts.append(text[last:])
    stats.setdefault("ancient_of_days", 0)
    stats["ancient_of_days"] += len(matches)
    stats.setdefault(f"ancient_of_days_ch{ch_num}", 0)
    stats[f"ancient_of_days_ch{ch_num}"] += len(matches)
    return "".join(out_parts)


# All rules applied in order. The rule list order is significant for the
# few cases where one rule's output feeds the next rule's input (R_GOD
# producing "a Elohim" then R_ARTICLE fixing to "an Elohim"). Source-echo
# paren protection is handled by negative lookbehinds inside each rule,
# not by a paren-walking pass — this lets the rules correctly substitute
# inside non-source-echo parens (e.g., citation parens that contain
# Israel / Judah and which the wheel substituted into).
ALL_RULES = [
    R_YAHUAH,
    R_SONS_LC,
    R_SONS_UC,
    R_SON_OF_MAN_UC,
    R_SON_OF_MAN_LC,
    R_ISRAEL,
    R_JUDAH,
    R_GOD,
    R_ARTICLE,
]
# Ancient-of-Days is handled separately because it's stateful (first-
# mention gets the paren, subsequent are bare).


# ---------------------------------------------------------------------------
# Chapter-body extraction
# ---------------------------------------------------------------------------

HEADING_RE = re.compile(r"^Chapter\s+(\d+):\s*(.+)$", re.MULTILINE)


def _is_real_jasher_heading(txt: str, m: re.Match) -> bool:
    """Real chapter heading: followed soon by a verse-1 marker."""
    body = txt[m.end(): m.end() + 400]
    return bool(re.search(r"(?:^|[\s\n])1[\.\s]", body))


def find_chapter_regions(txt: str) -> list[tuple[int, int, int, int]]:
    """
    Return list of (ch_num, heading_start, body_start, body_end) tuples
    for each chapter, in order. body_start is the offset of the char
    immediately after the heading line; body_end is the offset of the
    next chapter's heading_start (or BACK_MATTER_MARKER for ch91).
    """
    raw = list(HEADING_RE.finditer(txt))
    real = [m for m in raw if _is_real_jasher_heading(txt, m)]
    # Dedupe by chapter number (TOC entries near the back have same form)
    seen = set()
    unique = []
    for m in real:
        n = int(m.group(1))
        if n in seen:
            continue
        seen.add(n)
        unique.append(m)
    real = unique

    back_start = txt.index(BACK_MATTER_MARKER)
    regions = []
    for i, m in enumerate(real):
        ch_num = int(m.group(1))
        heading_start = m.start()
        body_start = m.end()
        if i + 1 < len(real):
            body_end = real[i + 1].start()
        else:
            body_end = back_start
        regions.append((ch_num, heading_start, body_start, body_end))
    return regions


def _split_verse_list_and_commentary(body: str) -> tuple[int, int]:
    """
    Given a chapter body (the text after the heading and before the next
    chapter heading), return (verse_list_end_offset, commentary_start_offset)
    within `body`. The two are the same value — the split point. We return
    a pair for symmetry; callers can pass either.

    Verse list ends at the end of the last numbered-paragraph in a strict
    monotonic 1..N chain. Commentary starts at the next blank-line.
    """
    paragraphs = re.split(r"(\n\s*\n)", body)  # capture separators
    # paragraphs alternates: [para0, sep01, para1, sep12, para2, ...]
    # The even indices are paragraphs; odd indices are separators.
    verse_num_re = re.compile(r"^\s*(\d+)\.\s")
    last_verse_para_idx = -1
    expected = 1
    for i in range(0, len(paragraphs), 2):
        p = paragraphs[i]
        m = verse_num_re.match(p)
        if m and int(m.group(1)) == expected:
            last_verse_para_idx = i
            expected += 1
    if last_verse_para_idx < 0:
        return 0, 0
    # Compute the offset within `body` of the end of paragraphs[last_verse_para_idx]
    offset = 0
    for j in range(last_verse_para_idx + 1):
        offset += len(paragraphs[j])
    # Commentary starts after the next separator (paragraphs[last_verse_para_idx+1])
    sep_after = paragraphs[last_verse_para_idx + 1] if last_verse_para_idx + 1 < len(paragraphs) else ""
    return offset, offset + len(sep_after)


# ---------------------------------------------------------------------------
# Rule application
# ---------------------------------------------------------------------------

def _rule_applies_to_chapter(rule, ch_num: int) -> bool:
    scope = rule[3]
    if isinstance(scope, dict):
        if "except_ch" in scope and ch_num in scope["except_ch"]:
            return False
        if "only_ch" in scope and ch_num not in scope["only_ch"]:
            return False
    return True


def _rule_zone(rule):
    """Return 'body' or 'commentary' indicating the zone the rule targets."""
    scope = rule[3]
    if isinstance(scope, str):
        return scope
    # dict-scope: assume body unless explicitly marked
    return scope.get("zone", "body")


def apply_rules_to_body(body: str, ch_num: int, stats: dict) -> str:
    """Apply substitution rules to a single chapter body."""
    # Split into verse-list and commentary regions
    split_end, com_start = _split_verse_list_and_commentary(body)
    verse_zone = body[:split_end]
    sep_zone = body[split_end:com_start]
    com_zone = body[com_start:]

    def apply_zone(zone_text: str, zone_name: str) -> str:
        out = zone_text
        for rule in ALL_RULES:
            if not _rule_applies_to_chapter(rule, ch_num):
                continue
            rule_zone = _rule_zone(rule)
            if rule_zone == "commentary" and zone_name != "commentary":
                continue
            name, pat, repl = rule[0], rule[1], rule[2]
            new_out, count = pat.subn(repl, out)
            if count:
                stats.setdefault(name, 0)
                stats[name] += count
                stats.setdefault(f"{name}_ch{ch_num}", 0)
                stats[f"{name}_ch{ch_num}"] += count
            out = new_out
        return out

    new_verse = apply_zone(verse_zone, "verse")
    new_com = apply_zone(com_zone, "commentary")
    # Stateful Ancient-of-Days pass applies AFTER zone-based rules,
    # at the chapter level (first mention in the chapter — not per-zone).
    # The .txt has these terms only in commentary in practice, but
    # applying it to the joined body ensures the first-mention count is
    # correct regardless of zone.
    joined = new_verse + sep_zone + new_com
    joined = _apply_ancient_of_days(joined, ch_num, stats)
    return joined


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

def main(dry_run: bool = False):
    print(f"APP = {APP}", file=sys.stderr)
    print(f"TXT = {TXT}", file=sys.stderr)
    print(f"LIVE = {LIVE}", file=sys.stderr)

    with open(TXT, encoding="utf-8") as f:
        original = f.read()

    # Pre-flight: parse current .txt, validate structural integrity
    pre = parse_jasher(original)
    pre_chs = pre.books[0].chapters
    if len(pre_chs) != 91:
        raise RuntimeError(f"expected 91 chapters in pre-parse, got {len(pre_chs)}")

    with open(LIVE, encoding="utf-8") as f:
        live = json.load(f)
    live_chs = live["books"][0]["chapters"]
    if len(live_chs) != 91:
        raise RuntimeError(f"expected 91 chapters in live JSON, got {len(live_chs)}")

    # Locate chapter regions in the raw .txt
    regions = find_chapter_regions(original)
    print(f"found {len(regions)} chapter regions", file=sys.stderr)
    if len(regions) != 91:
        raise RuntimeError(f"expected 91 chapter regions, got {len(regions)}")

    # Apply substitutions per chapter body
    stats: dict = {}
    out_parts = []
    cursor = 0
    for ch_num, h_start, b_start, b_end in regions:
        # Copy [cursor, h_start) unchanged (front matter or inter-chapter)
        out_parts.append(original[cursor:b_start])
        body = original[b_start:b_end]
        new_body = apply_rules_to_body(body, ch_num, stats)
        out_parts.append(new_body)
        cursor = b_end
    # Copy back matter unchanged
    out_parts.append(original[cursor:])
    updated = "".join(out_parts)

    # Stats summary
    print("\n=== substitution summary (totals across all chapters) ===", file=sys.stderr)
    summary_rules = [
        "yahuah_caps", "sons_of_men_lc", "sons_of_men_uc",
        "son_of_man_uc", "son_of_man_lc", "ancient_of_days",
        "israel_bare", "judah_bare", "god_bare", "article_a_elohim",
    ]
    for name in summary_rules:
        print(f"  {name:>22s}: {stats.get(name, 0)}", file=sys.stderr)

    if dry_run:
        print("\n=== DRY RUN — not writing ===", file=sys.stderr)
        return updated, stats

    # Backup original (.pre-s61 sidecar)
    if not os.path.exists(BACKUP):
        shutil.copy2(TXT, BACKUP)
        print(f"backed up to {BACKUP}", file=sys.stderr)

    # Write updated .txt
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
