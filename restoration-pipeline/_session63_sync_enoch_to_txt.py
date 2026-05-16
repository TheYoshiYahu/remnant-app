#!/usr/bin/env python3
"""
_session63_sync_enoch_to_txt.py
-------------------------------
S63 durability wheel: sync the Enoch-Restored-Names-Edition.txt mirror
at source-texts/existing-restored-editions/ to match the wheel-state of
source-texts/parsed/enoch.json (which holds the S57(b) Option C apply:
ch6 scaffolding scrub, ch46 duplicate Formless/Formed block removal,
Son-of-Adam commentary sweep, Head-of-Days reconciliation, name-
restoration mechanics in prose).

After S57(b), all wheel work landed as direct edits to parsed/enoch.json
only — the upstream .txt mirror is at the pre-S57(b) state. A Phase-D
re-parse would silently regress the API. This script back-fixes the .txt
so re-parse is durably byte-equal to the live JSON.

Strategy (clone of S61's Jasher sync pattern — DO NOT FORK the
architecture; only the rule set and the anchored deletions differ):
  * Read the .txt, parse it in-memory via parse_published_editions to
    confirm structural integrity (108 chapters).
  * For each chapter body (between `Chapter N:` heading and the next
    heading), split into verse-zone and commentary-zone at the
    `Commentary on Chapter N` marker line. Apply substitutions to the
    commentary zone only (the S57(b) closure confirmed verses are clean).
  * Two content-anchored deletions are applied first (ch6 scaffolding,
    ch46 duplicate block) — these were direct hand-edits in S57(b) and
    cannot be expressed as regex transforms.
  * Daniel-7-context kaph-comparative carve-out (Red Line #12) runs
    BEFORE the generic Son-of-Man rule so the comparative context is
    intact when the substitution fires.
  * Ancient of Days → Head of Days runs as a stateful per-chapter
    pass (first mention gets the source-echo paren, subsequent are bare),
    matching the S52/S57(b) edition convention.
  * Write the updated .txt over the original (after .pre-s63 backup).
  * Caller follows up with the byte-equal proof against the live JSON.

Idempotent: running twice produces the same result. All substitutions
have negative lookbehinds or content-anchored guards that prevent
double-application.
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
    sandbox = "/sessions/cool-adoring-edison/mnt/App"
    if os.path.isdir(sandbox):
        return sandbox
    host = os.path.expanduser("~/Desktop/App")
    if os.path.isdir(host):
        return host
    raise RuntimeError("cannot resolve App root")


APP = _resolve_app()
sys.path.insert(0, os.path.join(APP, "restoration-pipeline"))
os.environ.setdefault("APP_ROOT", APP)

from parse_published_editions import parse_enoch  # noqa: E402

TXT = os.path.join(
    APP,
    "source-texts/existing-restored-editions/Enoch-Restored-Names-Edition.txt",
)
LIVE = os.path.join(APP, "source-texts/parsed/enoch.json")
BACKUP = TXT + ".pre-s63"


# ---------------------------------------------------------------------------
# Anchored content deletions (S57(b) hand-edits)
# ---------------------------------------------------------------------------
#
# Each anchored deletion is a (chapter, anchor_text) tuple. anchor_text is
# the parsed-form (normalized-whitespace) span to remove. The deleter
# rebuilds a regex from anchor_text with `\s+` between words so it
# matches the .txt's line-wrapped form. Idempotent: if the anchor is
# already gone (wheel already ran), the deletion is a no-op.
#
# DEL_CH6: the scaffolding-text leak. S48 finding §2 "ch6 — leftover
# scaffolding text in the commentary body."  S57(b) closure: "Ch6
# scaffolding line deleted (one-line 'Now I have everything…
# Supplemental Commentary Sections' authoring artifact)."
# ---------------------------------------------------------------------------

DEL_CH6 = (
    6,
    "Now I have everything. Here are the four supplemental commentary "
    "sections, written in MTM’s existing style but upgraded with "
    "your theological framework: Supplemental Commentary Sections",
)

# DEL_CH46: the duplicate Formless/Formed exposition (the LATER copy).
# S48 finding §2 "ch46 — duplicated exposition block. The Formless/Formed
# exposition appears twice, near-verbatim — once headed 'The Elect One,
# the Ancient of Days, and the Formless/Formed Structure' and again
# headed 'The Head of Days and the Elect One — The Formless and the
# Formed.' One copy should be removed."  S57(b) closure: "Ch46 duplicate
# Formless/Formed exposition removed — the later block headed 'The Head
# of Days and the Elect One — The Formless and the Formed' (the
# restated copy); the earlier 'The Elect One, the Head of Days, and the
# Formless/Formed Structure' block kept."
#
# Anchor: opens at the heading 'The Head of Days and the Elect One —
# The Formless and the Formed' and closes at the trailing cross-ref
# 'Colossians 1:15–17 (image of the invisible God, before all things,
# by Him all consist).' The whole block is the LATER duplicate.
# ---------------------------------------------------------------------------

DEL_CH46 = (
    46,
    "The Head of Days and the Elect One — The Formless and the Formed "
    "The Parables do not present a theological puzzle here. They present "
    "what Enoch was shown. Two figures. One seated — the Head of Days, "
    "enthroned, white-haired, the source of all authority. One standing "
    "beside Him — the Son of Man, the Elect One, chosen, pre-eminent, "
    "about to receive the authority of judgment over all kings and mighty. "
    "This is not two gods. It is not three separate personalities "
    "assembled in a council. It is the Formless and the Formed — the "
    "eternal structure Scripture reveals from Genesis to Revelation, now "
    "made visible in the heavenly court. The seated one is the Father "
    "— the infinite source from which all things proceed. He has no "
    "form creation can contain. He does not appear to the patriarchs. He "
    "does not wrestle with Jacob or walk in the garden or speak from the "
    "fire on Sinai. He is the throne. He is the source. The one Yahusha "
    "(Jesus) called “the only true God” (John 17:3) and to whose "
    "will Yahusha (Jesus) submitted from eternity. The one standing "
    "beside Him — the Elect One, the Son of Man of the Parables "
    "— is the Formed: the Word drawn from within the Formless, the "
    "expressed and active God, the one who has always had a face in "
    "creation. This is the God of the Old Testament interactions. The "
    "one who appeared to Abraham at Mamre (Genesis 18). Who wrestled "
    "with Jacob at the Jabbok (Genesis 32). Who spoke from the burning "
    "bush (Exodus 3). Who led Israel in the pillar of fire (Exodus 13). "
    "The Formed one entered creation fully in Yahusha (Jesus) — "
    "not for the first time appearing, but for the first time as flesh. "
    "When Chapter 48 says the Son of Man was named before the Head of "
    "Days before the sun and stars were created, it is saying what John "
    "would later write: “In the beginning was the Word, and the "
    "Word was with God, and the Word was God” (John 1:1). Named "
    "before creation. Chosen before creation. Pre-eminent before "
    "creation. This is why Yahusha (Jesus) could say “the Father "
    "is greater than I” (John 14:28) and “I and the Father "
    "are one” (John 10:30) without contradiction. The Formed "
    "proceeds from the Formless, remains of the Formless, submits to "
    "the will of the Formless — and is simultaneously fully God. "
    "Not a lesser god. Not a second god. The expressed God, the Formed "
    "one, come in the flesh. The Trinity imports Greek philosophical "
    "architecture into a Hebrew revelation that carries no such "
    "structure. Enoch did not see a council of equals. He saw the "
    "Father enthroned and the Son of Man standing beside Him — not "
    "as one equal among equals but as the one who proceeds from the "
    "Head of Days and carries His full authority into creation and "
    "judgment. Cross-refs: John 1:1–3 (Word with God, Word was "
    "God, all things through Him); John 14:28 (Father greater than I "
    "— the Formed submits to the Formless); John 10:30 (I and the "
    "Father are one — unity of source and expression); John 17:3 "
    "(the only true God — the Father as formless source); John "
    "17:5 (glory with You before the world was — pre-existence of "
    "the Formed); Genesis 18:1–2 (Yahuah (God) appeared to Abraham "
    "— the Formed in theophany); Exodus 3:2–4 (Angel of "
    "Yahuah (God) in flame, Yahuah (God) speaks — the Formed one); "
    "Colossians 1:15–17 (image of the invisible God, before all "
    "things, by Him all consist).",
)

ANCHORED_DELETIONS = [DEL_CH6, DEL_CH46]


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
    # Optional leading whitespace consumed too — keeps the join clean.
    return re.compile(r"\s*" + "".join(pat))


# ---------------------------------------------------------------------------
# Regex substitution rules (commentary-zone only unless noted)
# ---------------------------------------------------------------------------
#
# Each rule is (name, pattern, replacement). All commentary-zone. Order
# matters in two places:
#   1. Compound substitutions (R_JESUS_CHRIST_COMPOUND) fire before
#      single-name substitutions so "Jesus Christ" wraps as the compound
#      rather than two separate substitutions.
#   2. The kaph-comparative carve-out (R_KAPH_DANIEL_*) fires BEFORE the
#      generic Son-of-Man rule so the Daniel-7 context is intact when
#      the comparative substitution fires.
#
# Idempotency is by negative lookbehinds on the substituted forms, so
# re-running the rule on already-substituted text does nothing.
# ---------------------------------------------------------------------------

# Rule A: Compound "Jesus Christ" → "Yahusha HaMashiach (Jesus Christ)"
# Negative lookbehind prevents double-wrapping if already substituted.
R_JESUS_CHRIST_COMPOUND = (
    "jesus_christ_compound",
    re.compile(
        r"(?<!Yahusha\sHaMashiach\s\()"
        r"\bJesus\s+Christ\b"
    ),
    "Yahusha HaMashiach (Jesus Christ)",
)

# Rule B1: Kaph-comparative carve-out for Daniel 7:13–14 cross-refs (.txt
# still has "Son of Man" here — both halves substitute together).
# "Daniel 7:13–14 (Son of Man" → "Daniel 7:13–14 (like a son of Adam"
R_KAPH_DANIEL = (
    "kaph_daniel_7_13",
    re.compile(r"Daniel\s+7:13–14\s*\(Son\s+of\s+Man"),
    "Daniel 7:13–14 (like a son of Adam",
)

# Rule B2: Kaph-comparative carve-out for Revelation 1:13–14 cross-refs.
# .txt was pre-substituted by the publisher to "Son of Adam" already;
# the wheel adds the "a " and lowercases the "S".
# "Revelation 1:13–14 (one like Son of Adam" → "Revelation 1:13–14 (one like a son of Adam"
# Idempotency: negative lookbehind on the substituted form ("like a son of Adam"
# would not match the pattern requiring "like Son of Adam").
R_KAPH_REVELATION = (
    "kaph_revelation_1_13",
    re.compile(r"Revelation\s+1:13–14\s*\(one\s+like\s+Son\s+of\s+Adam"),
    "Revelation 1:13–14 (one like a son of Adam",
)

# Rule C: "Son of Man" (capitalized title) → "Son of Adam"
# MENTION cases preserved via pre-stash/post-unstash mechanism below
# (the 9 specific ch37 / ch46 / ch71 anchors are stashed to a placeholder
# before this rule fires and restored after). Hyphenated form
# ("son-of-man") preserved because the regex requires \s+.
R_SON_OF_MAN_UC = (
    "son_of_man_uc",
    re.compile(r"\bSon\s+of\s+Man\b"),
    "Son of Adam",
)

# Rule D: "son of man" lower-case → "son of Adam"
# Same MENTION carve-out via stash/unstash.
R_SON_OF_MAN_LC = (
    "son_of_man_lc",
    re.compile(r"\bson\s+of\s+man\b"),
    "son of Adam",
)

# Rule E: "Sons of men" capitalized → "Sons of Adam"
R_SONS_OF_MEN_UC = (
    "sons_of_men_uc",
    re.compile(r"\bSons\s+of\s+men\b"),
    "Sons of Adam",
)

# Rule F: "sons of men" lower-case → "sons of Adam"
R_SONS_OF_MEN_LC = (
    "sons_of_men_lc",
    re.compile(r"\bsons\s+of\s+men\b"),
    "sons of Adam",
)

# Rule G: Bare "Israel" → "Yashar'el (Israel)"
# Idempotency + label-paren guards:
#   - Not preceded by "Yashar'el " (already substituted)
#   - Not preceded by "Yashar'el (" (idempotency inner-Israel)
#   - Not immediately followed by ")" — the label-paren case "(Israel)"
#     stays bare per S57(b) (ch89 "righteous sheep (Israel) amid beasts").
#     Used as a closing-paren guard rather than an opening-paren guard
#     because parenthetical text with internal content "(Israel in Egypt)"
#     DOES substitute (live JSON: "(Yashar'el (Israel) in Egypt)").
# \s in lookbehind matches space or newline (line-wrap safe).
# ['’] handles both straight and smart apostrophes.
R_ISRAEL = (
    "israel_bare",
    re.compile(
        r"(?<!Yashar['’]el\s)"
        r"(?<!Yashar['’]el\s\()"
        r"\bIsrael\b"
        r"(?!\))"
    ),
    "Yashar'el (Israel)",
)

# Rule H: Bare "Lord of Spirits" → "Yahuah (God) of Spirits"
# Per S57(b): one instance in ch39 was substituted; rest of .txt already
# has the publisher-substituted "Yahuah (God) of Spirits" form.
R_LORD_OF_SPIRITS = (
    "lord_of_spirits",
    re.compile(
        r"(?<!Yahuah\s\(God\)\s)"
        r"\bLord\s+of\s+Spirits\b"
    ),
    "Yahuah (God) of Spirits",
)

# Rule J: Publisher-typo fix — "Spirits[a-z]" (no trailing space)
# → "Spirits [a-z]". The .txt has two cases: ch48 "Spiritsand" and
# ch54 "Spiritscommanded" — typos in the published Restored Names
# edition that the wheel inserted spaces into during S57(b) cleanup.
# Idempotent: already-spaced "Spirits and" / "Spirits commanded" do
# not match (the regex requires a letter immediately after, no space).
R_SPIRITS_TYPO = (
    "spirits_typo_space",
    re.compile(r"\bSpirits([a-z])"),
    r"Spirits \1",
)


# ---------------------------------------------------------------------------
# MENTION carve-outs — the 9 specific Son-of-Man / son-of-man instances
# the S57(b) wheel preserved (commentary meta-discussing the phrase as a
# phrase). Identified by exact anchor strings in the .txt. Pre-stash to
# placeholders before the substitution rules fire, then un-stash after.
# ---------------------------------------------------------------------------

_PLACEHOLDER_UC = "\x00SOM_MENTION_UC\x00"
_PLACEHOLDER_LC = "\x00som_mention_lc\x00"

# Each entry: (left_anchor, phrase, right_anchor) — surrounding context
# that uniquely identifies the MENTION case. Whitespace in any anchor
# part is matched as \s+ (line-wrap tolerant). Smart-quote characters
# are the actual Unicode left/right double-quote chars (“, ”).
MENTION_ANCHORS = [
    # ch37 — smart-quoted MENTION discussing the title
    ("forward to the “", "Son of Man", "” revelations"),
    # ch46 — smart-quoted MENTION discussing the title
    ("understanding the “", "Son of Man", "” title"),
    # ch71 — italicized phrase-as-phrase (two cases, both "treating
    # son of man as exclusively"). One anchor matches both via regex.
    ("treating ", "son of man", " as exclusively"),
    # ch71 — Charles's theological-assumption discussions
    ("assumption that “", "Son of Man", "” was"),
    ("receiving the “", "Son of Man", "” identification"),
    # ch71 — quoted Charles-rewrite ("This is the Son of Man who is born...")
    ("“This is the ", "Son of Man", " who is born"),
    # ch71 — capitalization discussion
    ("capitalized “", "Son of Man", "” throughout"),
    # ch71 — quoted Enoch direct-address restoration ("You are that son of man.")
    ("“You are that ", "son of man", ".”"),
]


def _stash_mentions(text: str, stats: dict) -> str:
    """
    Replace specific MENTION-case 'Son of Man' / 'son of man' instances
    with placeholders so substitution rules skip them. Restored later by
    _unstash_mentions.
    """
    for L, phrase, R in MENTION_ANCHORS:
        placeholder = _PLACEHOLDER_UC if phrase[0].isupper() else _PLACEHOLDER_LC
        # Build a whitespace-tolerant regex for the full anchor.
        # Anchor parts already carry any internal boundary whitespace.
        full = L + phrase + R
        full_pat = _anchor_to_regex(full)
        # For each match of the full anchor, replace the phrase substring
        # inside the match with the placeholder. The phrase itself may be
        # line-wrapped, so use a whitespace-tolerant inner pattern.
        # Note: do NOT re.escape(phrase) — the phrase contains only
        # alphanumerics and spaces. re.escape would escape the spaces to
        # `\ ` which then can't be cleanly converted to `\s+` for line-wrap
        # tolerance. Plain whitespace substitution is correct here.
        phrase_pat = re.compile(
            r"\b" + re.sub(r"\s+", r"\\s+", phrase) + r"\b"
        )
        def _replacer(m):
            inner = m.group(0)
            return phrase_pat.sub(placeholder, inner, count=1)
        new_text, count = full_pat.subn(_replacer, text)
        if count:
            stats.setdefault("mention_stashed", 0)
            stats["mention_stashed"] += count
            text = new_text
    return text


def _unstash_mentions(text: str) -> str:
    """Restore stashed MENTION placeholders to their original phrases."""
    text = text.replace(_PLACEHOLDER_UC, "Son of Man")
    text = text.replace(_PLACEHOLDER_LC, "son of man")
    return text


# ---------------------------------------------------------------------------
# Stateful Head-of-Days pass (refactored S63)
# ---------------------------------------------------------------------------
#
# Preservation rules (live-JSON-confirmed):
#   * AoD immediately following an open paren (i.e. AoD is the first
#     substantive content of a paren) → preserved. Captures cross-ref
#     forms like "Daniel 7:9 (Ancient of Days…)" and idempotency for
#     the already-substituted "Head of Days (Ancient of Days)" form
#     where AoD sits right after the inner "(".
#   * AoD preceded by "before the " → preserved (ch71 third case,
#     "before the Ancient of Days)").
# Otherwise: substitute. First substituted instance per chapter gets
# "Head of Days (Ancient of Days)"; subsequent get bare "Head of Days".
# ---------------------------------------------------------------------------

def _apply_head_of_days(text: str, ch_num: int, stats: dict) -> str:
    matches = list(re.finditer(r"\bAncient\s+of\s+Days\b", text))
    if not matches:
        return text
    out_parts: list[str] = []
    cursor = 0
    seen_first_sub = False
    _before_the_pat = re.compile(r"before\s+the\s+$")
    for m in matches:
        out_parts.append(text[cursor:m.start()])
        # Preservation check 1: "before the Ancient of Days" — whitespace-
        # tolerant so a line-wrapped "before the\nAncient" still matches
        # (ch71 third preserved case is line-wrapped in the .txt).
        preceded_window = text[max(0, m.start() - 20):m.start()]
        if _before_the_pat.search(preceded_window):
            out_parts.append(text[m.start():m.end()])
            cursor = m.end()
            continue
        # Preservation check 2: AoD starts the content of a paren
        open_paren = text.rfind("(", max(0, m.start() - 300), m.start())
        if open_paren >= 0:
            between = text[open_paren + 1:m.start()].strip()
            if between == "":
                out_parts.append(text[m.start():m.end()])
                cursor = m.end()
                continue
        # Substitute
        if not seen_first_sub:
            out_parts.append("Head of Days (Ancient of Days)")
            seen_first_sub = True
        else:
            out_parts.append("Head of Days")
        cursor = m.end()
        stats.setdefault("ancient_of_days", 0)
        stats["ancient_of_days"] += 1
        stats.setdefault(f"ancient_of_days_ch{ch_num}", 0)
        stats[f"ancient_of_days_ch{ch_num}"] += 1
    out_parts.append(text[cursor:])
    return "".join(out_parts)


# Rule order matters: stash MENTIONs → anchored deletions → compounds →
# kaph carve-outs → generic title rules → bare-name rules → typo fixes
# → stateful AoD pass → unstash MENTIONs.
COMMENTARY_RULES = [
    R_JESUS_CHRIST_COMPOUND,
    R_KAPH_DANIEL,
    R_KAPH_REVELATION,
    R_SON_OF_MAN_UC,
    R_SON_OF_MAN_LC,
    R_SONS_OF_MEN_UC,
    R_SONS_OF_MEN_LC,
    R_ISRAEL,
    R_LORD_OF_SPIRITS,
    R_SPIRITS_TYPO,
]


# ---------------------------------------------------------------------------
# Chapter region extraction
# ---------------------------------------------------------------------------

HEADING_RE = re.compile(r"^Chapter\s+(\d+):\s*(.+)$", re.MULTILINE)
COMMENTARY_MARKER_RE = re.compile(r"^Commentary on Chapter\s+\d+\s*$", re.MULTILINE)


def find_chapter_regions(txt: str) -> list[tuple[int, int, int, int, int]]:
    """
    Return list of (ch_num, heading_start, body_start, com_start, body_end)
    tuples for each chapter, in order.
      - heading_start: offset of the 'Chapter N:' line
      - body_start:    offset right after the heading line
      - com_start:     offset of the 'Commentary on Chapter N' line
                       (or body_end if no commentary marker found)
      - body_end:      offset of the next chapter's heading_start
                       (or len(txt) for the final chapter)
    """
    all_heads = list(HEADING_RE.finditer(txt))
    # Filter out lines that aren't real chapter starts: a real heading is
    # followed within ~400 chars by a verse-1 marker (line-start "1 ...").
    # This filters out TOC entries and references-in-prose.
    real_heads: list[re.Match] = []
    for m in all_heads:
        # Look in the next ~600 chars for a "1 " line-start (Enoch verse 1).
        window = txt[m.end(): m.end() + 600]
        if re.search(r"(?:^|\n)1\s", window):
            real_heads.append(m)
    # Dedupe by chapter number (TOC entries and back-of-book references
    # share the same heading form). Keep first occurrence.
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
        # Find the Commentary marker within this chapter's body.
        com_match = COMMENTARY_MARKER_RE.search(txt, body_start, body_end)
        com_start = com_match.start() if com_match else body_end
        regions.append((ch_num, heading_start, body_start, com_start, body_end))
    return regions


# ---------------------------------------------------------------------------
# Rule application
# ---------------------------------------------------------------------------

def apply_anchored_deletions(commentary: str, ch_num: int, stats: dict) -> str:
    """
    Run anchored deletions for this chapter. Idempotent: if the anchor is
    not present, no-op (the wheel already ran or the text is clean).
    """
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
    """Apply all commentary-zone rules + stateful AoD pass."""
    out = commentary
    # 1. Anchored deletions first
    out = apply_anchored_deletions(out, ch_num, stats)
    # 2. Stash MENTION cases (the 9 preserved Son-of-Man / son-of-man
    #    instances S57(b) left as-is) so the substitution rules skip them
    out = _stash_mentions(out, stats)
    # 3. Regex rules (compounds → kaph → title → bare-name → typo)
    for name, pat, repl in COMMENTARY_RULES:
        new_out, count = pat.subn(repl, out)
        if count:
            stats.setdefault(name, 0)
            stats[name] += count
            stats.setdefault(f"{name}_ch{ch_num}", 0)
            stats[f"{name}_ch{ch_num}"] += count
            out = new_out
    # 4. Stateful Head-of-Days pass
    out = _apply_head_of_days(out, ch_num, stats)
    # 5. Unstash MENTION placeholders back to their original phrases
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
    pre = parse_enoch(original)
    pre_chs = pre.books[0].chapters
    if len(pre_chs) != 108:
        raise RuntimeError(f"expected 108 chapters in pre-parse, got {len(pre_chs)}")

    with open(LIVE, encoding="utf-8") as f:
        live = json.load(f)
    live_chs = live["books"][0]["chapters"]
    if len(live_chs) != 108:
        raise RuntimeError(f"expected 108 chapters in live JSON, got {len(live_chs)}")

    # Locate chapter regions in raw .txt
    regions = find_chapter_regions(original)
    print(f"found {len(regions)} chapter regions", file=sys.stderr)
    if len(regions) != 108:
        raise RuntimeError(f"expected 108 chapter regions, got {len(regions)}")

    # Apply rules per chapter's commentary zone
    stats: dict = {}
    out_parts = []
    cursor = 0
    for ch_num, h_start, b_start, c_start, b_end in regions:
        # Copy [cursor, c_start) unchanged (front matter or verse zone)
        out_parts.append(original[cursor:c_start])
        # Commentary zone: from c_start to b_end
        # c_start points at the "Commentary on Chapter N" line itself;
        # we want to leave that marker line intact and operate on the
        # prose AFTER it. Skip past the marker line:
        marker_match = COMMENTARY_MARKER_RE.match(original, c_start)
        if marker_match:
            marker_end = marker_match.end()
            # Include the marker line and a single trailing newline
            # untouched, then apply rules to the prose region after.
            out_parts.append(original[c_start:marker_end])
            prose = original[marker_end:b_end]
            new_prose = apply_rules_to_commentary(prose, ch_num, stats)
            out_parts.append(new_prose)
        else:
            # No commentary marker (shouldn't happen for Enoch) — leave intact
            out_parts.append(original[c_start:b_end])
        cursor = b_end
    out_parts.append(original[cursor:])
    updated = "".join(out_parts)

    # Stats summary
    print("\n=== substitution summary (totals across all chapters) ===", file=sys.stderr)
    summary_rules = [
        "anchored_deletions",
        "mention_stashed",
        "jesus_christ_compound",
        "kaph_daniel_7_13",
        "kaph_revelation_1_13",
        "son_of_man_uc",
        "son_of_man_lc",
        "sons_of_men_uc",
        "sons_of_men_lc",
        "israel_bare",
        "lord_of_spirits",
        "spirits_typo_space",
        "ancient_of_days",
    ]
    for name in summary_rules:
        print(f"  {name:>24s}: {stats.get(name, 0)}", file=sys.stderr)

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
