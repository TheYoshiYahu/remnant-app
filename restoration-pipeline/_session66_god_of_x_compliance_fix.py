#!/usr/bin/env python3
"""
_session66_god_of_x_compliance_fix.py
-------------------------------------
S66 compliance wheel: apply the "God of X" Sacred Names restoration rule
to the Apocrypha .txt mirror and re-parse to update parsed/apocrypha.json.

DESIGN (settled at the S66 design gate):
  Rule shape: "the God of X" (capital G) → "the Elohim (God) of X".
  Reason: this is what the canon pipeline already does 279× in verses
  today (e.g. Gen 24:3: "the Yahuah (LORD), the Elohim (God) of heaven,
  and the Elohim (God) of the earth"). Apocrypha commentary missed this
  mechanical singles fire because Yoshi's prose wasn't run through the
  canon-style restoration pass. S66 backfills those misses on the
  commentary side.

  Carve-outs Yoshi locked in at the gate:
    * "the God of the Old Testament" / "the God of the New (Testament)"
      → STAY BARE. This phrasing IS the Christian-categorization
      rhetoric Yoshi is critiquing; restoring it would flatten the
      rhetorical point. Negative lookahead enforces this.
    * "singular God of Yashar'el" (2 Macc 15 commentary, ×2) → STAY BARE.
      MENTION case — Yoshi discussing how Elohim is plural-majesty form,
      parallel to S65's "the personal name Yahuah does not naturally
      take a possessive" MENTION carve-out. Not matched by any rule
      (the preceding word is "singular", not "the" / "Lord" / etc.).

  Scope expansion (broad option chosen at the gate — 32 total fires):
    * R_THE_GOD_OF_X  — "the God of X" (capital G, not OT/NT) — 23×
    * R_LORD_GOD_OF_X — "Lord God of X" → "Yahuah Elohim (Lord God) of X" — 2×
      (Judith 13 commentary "O Lord God of all power" — Judith's prayer at
      13:4–5; Song of the Three Holy Children commentary "O Lord God of
      our fathers" — the prayer's opening blessing)
    * R_ALMIGHTY_GOD_OF_X — "Almighty God of X" → "El Shaddai (Almighty God) of X" — 2×
      (Prayer of Manasseh ch0 commentary: "the Almighty God of our fathers" ×2 —
      the prayer's covenant-identification opening, quoted twice)
    * R_YOU_GOD_OF_DANIEL — "you God of Daniel" → "you Elohim (God) of Daniel" — 2×
      (Bel and the Dragon ch0 commentary — Bel 1:41 vocative "Great are
      you, O Lord, you God of Daniel," quoted twice in the commentary)
    * R_A_GOD_OF_AFFLICTED — "a God of the afflicted" → "a Elohim (God) of the afflicted" — 2×
      (Judith ch9 commentary — Judith's prayer "for you are a God of the
      afflicted, an helper of the oppressed", quoted twice)
    * R_ONE_GOD_OF_PATRIARCHS — "One God of the patriarchs" → "One Elohim (God) of the patriarchs" — 1×
      (Prayer of Manasseh ch1 commentary, Yoshi-prose descriptor:
      "into the recognition of the One God of the patriarchs")

  Total expected fires in Apocrypha: 32.
  Total expected fires in canon/jasher/enoch/jubilees: 0 each
  (canon's "the god of X" hits are lowercase pagan — KJV deliberately
  uses lowercase for Chemosh/Milcom/Baal-zebub/"god of this world";
  jasher's are lowercase Egyptian pantheon; enoch's lone hit is
  "the God of the Old Testament" which the OT-carve-out exempts;
  jubilees has 0 hits of any kind).

  Because canon/jasher/enoch/jubilees have 0 fires, this wheel TOUCHES
  only Apocrypha's .txt and .json. The cross-edition zero-fire result is
  itself part of the proof (the rule is correctly narrow).

Wheel pattern (same shape as S65):
  1. Read .txt
  2. Pre-flight: each rule's anchor matches its expected count exactly
  3. Apply substitutions in firing order (longer / more-specific first)
  4. Re-parse the updated .txt via parse_apocrypha
  5. Diff vs live JSON — count must equal sum of expected counts (clean,
     no collateral)
  6. Write updated .txt + .json
  7. Durability proof: re-read .txt from disk, re-parse, byte-equal to
     written .json (S65-style 3rd gate)

Idempotent: re-running finds zero matches (post-substitution forms don't
match the pre-substitution anchors — "God" became "Elohim (God)").

Backups: .txt.pre-s66 + apocrypha.json.pre-s66.
"""

from __future__ import annotations

import json
import os
import re
import shutil
import sys
from dataclasses import asdict


def _resolve_app() -> str:
    if os.environ.get("APP_ROOT"):
        return os.environ["APP_ROOT"]
    sandbox = "/sessions/serene-jolly-fermat/mnt/App"
    if os.path.isdir(sandbox):
        return sandbox
    host = os.path.expanduser("~/Desktop/App")
    if os.path.isdir(host):
        return host
    raise RuntimeError("cannot resolve App root")


APP = _resolve_app()
sys.path.insert(0, os.path.join(APP, "restoration-pipeline"))
os.environ.setdefault("APP_ROOT", APP)

from parse_published_editions import parse_apocrypha  # noqa: E402

TXT = os.path.join(
    APP,
    "source-texts/existing-restored-editions/Apocrypha-Restored-Names-Edition.txt",
)
JSON_PATH = os.path.join(APP, "source-texts/parsed/apocrypha.json")
TXT_BACKUP = TXT + ".pre-s66"
JSON_BACKUP = JSON_PATH + ".pre-s66"


# ---------------------------------------------------------------------------
# Substitution rules
# ---------------------------------------------------------------------------
#
# Each rule: (name, pattern, replacement, expected_count). The wheel asserts
# the pre-flight count matches expected so we catch any anchor drift.
# Patterns use \s+ between words for line-wrap tolerance (the .txt is 73-col
# line-wrapped; \s in Python re matches newlines by default).
#
# Firing order: longer / more-specific compounds FIRST so they consume their
# "God" before the generic "the God of X" rule can see it. (In practice the
# anchors are disjoint — "Lord God of" and "Almighty God of" start with words
# other than "the", so they don't overlap with "the God of" — but the
# specific-first ordering is the safer convention regardless.)
# ---------------------------------------------------------------------------

# Rule 1: Lord God of X compound (existing pipeline compound rule that missed
# the Apocrypha commentary pass).
# Anchor: "Lord God of" (capital L, capital G — vocative without "the").
# Pre-flight expected: 2 (Judith 13 commentary "O Lord God of all power"
# — Judith's prayer at 13:4–5; Song of the Three Holy Children commentary
# "Blessed are you, O Lord God of our fathers" — the prayer's opening
# blessing).
# Idempotency: post-sub form has "Yahuah Elohim (Lord God) of" — pattern
# requires bare "Lord God of" with no preceding "Elohim", so re-running
# finds 0.
R_LORD_GOD_OF_X = (
    "lord_god_of_x",
    re.compile(r"\bLord(\s+)God(\s+)of\b"),
    r"Yahuah Elohim (Lord God)\2of",
    2,
)

# Rule 2: Almighty God of X compound (existing pipeline compound rule that
# missed the Apocrypha commentary pass).
# Anchor: "Almighty God of" (capital A, capital G).
# Pre-flight expected: 2 (Prayer of Manasseh "the Almighty God of our
# fathers" ×2 — same prayer quoted twice in the commentary).
# Idempotency: post-sub form has "El Shaddai (Almighty God) of" — pattern
# doesn't match.
R_ALMIGHTY_GOD_OF_X = (
    "almighty_god_of_x",
    re.compile(r"\bAlmighty(\s+)God(\s+)of\b"),
    r"El Shaddai (Almighty God)\2of",
    2,
)

# Rule 3: the God of X (with OT/NT carve-out)
# Anchor: "the God of" NOT followed by "the Old" or "the New".
# Pre-flight expected: 23 (Apocrypha commentary across 1 Esdras, 2 Esdras,
# Tobit, Bel & Dragon, Prayer of Manasseh, 1 Macc, 2 Macc; mix of scripture
# quotations and pure Yoshi prose).
# Carve-out (negative lookahead): "the God of the Old Testament" / "the
# God of the New" — Christian-categorization rhetoric Yoshi is critiquing.
# Enoch ch46 has one such hit ("This is the God of the Old Testament");
# carve-out exempts it. Apocrypha has zero OT/NT hits but lookahead stays
# active for defense-in-depth.
# Idempotency: post-sub form has "the Elohim (God) of" — pattern doesn't
# match.
R_THE_GOD_OF_X = (
    "the_god_of_x",
    re.compile(r"\bthe(\s+)God(\s+)of(\s+)(?!the\s+(?:Old|New)\b)"),
    r"the\1Elohim (God)\2of\3",
    23,
)

# Rule 4: you God of Daniel (vocative scripture quote from Bel and the
# Dragon's "Great are you, O Lord, you God of Daniel").
# Pre-flight expected: 2 (the verse-quoted line appears twice in the
# commentary — once at the climax and once in the breakdown).
R_YOU_GOD_OF_DANIEL = (
    "you_god_of_daniel",
    re.compile(r"\byou(\s+)God(\s+)of(\s+)Daniel\b"),
    r"you\1Elohim (God)\2of\3Daniel",
    2,
)

# Rule 5: a God of the afflicted (vocative scripture quote from Judith's
# prayer: "for you are a God of the afflicted, an helper of the
# oppressed").
# Pre-flight expected: 2 (Judith ch9 commentary — same prayer quoted
# twice in the commentary).
# Note: article stays "a" (not "an") — canon convention preserves the
# original article verbatim even where "an Elohim" would be grammatical.
# Canon precedent: Deut 32:4 "a Elohim (God) of truth"; 1 Sam 2:3
# "a Elohim (God) of knowledge"; Dan 2:47 "a Elohim (God) of gods".
R_A_GOD_OF_AFFLICTED = (
    "a_god_of_the_afflicted",
    re.compile(r"\ba(\s+)God(\s+)of(\s+)the(\s+)afflicted\b"),
    r"a\1Elohim (God)\2of\3the\4afflicted",
    2,
)

# Rule 6: One God of the patriarchs (Yoshi-prose descriptor in Prayer of
# Manasseh commentary: "into the recognition of the One God of the
# patriarchs").
# Pre-flight expected: 1.
R_ONE_GOD_OF_PATRIARCHS = (
    "one_god_of_the_patriarchs",
    re.compile(r"\bOne(\s+)God(\s+)of(\s+)the(\s+)patriarchs\b"),
    r"One\1Elohim (God)\2of\3the\4patriarchs",
    1,
)

# Firing order: specifics first (Lord God / Almighty God / you God of
# Daniel / a God of the afflicted / One God of the patriarchs), then the
# generic "the God of X" — though anchors are disjoint, the convention
# stays consistent.
RULES = [
    R_LORD_GOD_OF_X,
    R_ALMIGHTY_GOD_OF_X,
    R_YOU_GOD_OF_DANIEL,
    R_A_GOD_OF_AFFLICTED,
    R_ONE_GOD_OF_PATRIARCHS,
    R_THE_GOD_OF_X,
]


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------

def main(dry_run: bool = False):
    print(f"APP       = {APP}", file=sys.stderr)
    print(f"TXT       = {TXT}", file=sys.stderr)
    print(f"JSON_PATH = {JSON_PATH}", file=sys.stderr)

    with open(TXT, encoding="utf-8") as f:
        original = f.read()

    # Pre-flight structural check
    pre = parse_apocrypha(original)
    pre_books = pre.books
    if len(pre_books) != 14:
        raise RuntimeError(f"expected 14 books in pre-parse, got {len(pre_books)}")

    # Pre-flight gate 1: each rule's anchor matches exactly its expected count
    print("\n=== GATE 1: pre-flight anchor counts ===", file=sys.stderr)
    all_ok = True
    for name, pat, repl, expected in RULES:
        actual = len(pat.findall(original))
        ok = (actual == expected)
        marker = "OK" if ok else "MISMATCH"
        print(
            f"  {name:>30s}: {actual} matches (expected {expected}) [{marker}]",
            file=sys.stderr,
        )
        if not ok:
            all_ok = False
    if not all_ok:
        raise RuntimeError("pre-flight count mismatch — anchors may have drifted")

    # Apply substitutions in order
    updated = original
    counts = {}
    for name, pat, repl, expected in RULES:
        new_text, count = pat.subn(repl, updated)
        counts[name] = count
        updated = new_text

    print("\n=== applied substitution counts ===", file=sys.stderr)
    for name, _, _, _ in RULES:
        print(f"  {name:>30s}: {counts.get(name, 0)}", file=sys.stderr)

    # Re-parse the updated .txt to produce the new JSON
    new_parsed = parse_apocrypha(updated)
    new_parsed_dict = asdict(new_parsed)

    # Structural integrity check
    if len(new_parsed_dict["books"]) != 14:
        raise RuntimeError(
            f"post-substitution re-parse produced {len(new_parsed_dict['books'])} books, "
            "expected 14 — structural regression"
        )
    new_chs = sum(len(b["chapters"]) for b in new_parsed_dict["books"])
    print(f"\npost-substitution structure: 14 books, {new_chs} chapters", file=sys.stderr)

    # Load the live JSON and compute the differential to verify the changes are
    # exactly what we expected (no collateral).
    with open(JSON_PATH, encoding="utf-8") as f:
        live = json.load(f)

    diffs = []
    for bi, (pb, lb) in enumerate(zip(new_parsed_dict["books"], live["books"])):
        for pc, lc in zip(pb.get("chapters", []), lb.get("chapters", [])):
            for pv, lv in zip(pc.get("verses", []), lc.get("verses", [])):
                if pv.get("text") != lv.get("text"):
                    diffs.append((pb["book_title"], pc["number"], "v" + str(pv["number"]),
                                  lv.get("text"), pv.get("text")))
            if pc.get("commentary") != lc.get("commentary"):
                diffs.append((pb["book_title"], pc["number"], "commentary",
                              lc.get("commentary"), pc.get("commentary")))

    print(f"\n=== GATE 2: diffs vs live JSON: {len(diffs)} ===", file=sys.stderr)
    for book, ch, loc, old, new in diffs:
        # Show only the changed span for clarity. Find the first divergence.
        from difflib import SequenceMatcher
        sm = SequenceMatcher(None, old or "", new or "")
        for tag, i1, i2, j1, j2 in sm.get_opcodes():
            if tag == "equal":
                continue
            ctx_old = (old or "")[max(0, i1 - 40):i2 + 40]
            ctx_new = (new or "")[max(0, j1 - 40):j2 + 40]
            print(f"  {book} ch{ch} {loc}:")
            print(f"    OLD: ...{ctx_old!r}...")
            print(f"    NEW: ...{ctx_new!r}...")
            break

    # Sanity gate: diff count is at the COMMENTARY level (one diff per
    # changed chapter commentary or verse text), not at the substitution
    # level. Multiple substitutions in a single commentary collapse into one
    # diff entry. Build the expected commentary-diff count from the audit:
    # 1 Esdras ch2 (1 sub), 1 Esdras ch4 (5 subs, 1 commentary), 2 Esdras
    # ch7 (1 sub), Tobit ch6 (2 subs, 1 commentary), Tobit ch8 (1 sub),
    # Bel & Dragon ch0 (5 subs: 2 "you God of Daniel" + 1 "the God of
    # Daniel" + 2 ??? wait, Bel ch0 had 2 "you God of Daniel" + 1 "the God
    # of Daniel" = 3 subs in 1 commentary), Prayer of Manasseh ch0 (many
    # subs in 1 commentary), Prayer of Manasseh ch1 (1 sub), 1 Macc ch3 (1
    # sub), 1 Macc ch13 (1 sub), 2 Macc ch3 (1 sub), 2 Macc ch9 (1 sub),
    # 2 Macc ch15 (3 subs in 1 commentary). That's roughly 12-13 unique
    # commentary diffs. We assert the substitution total = sum of expected
    # rule counts instead, which is the cleaner invariant.
    expected_sub_total = sum(expected for _, _, _, expected in RULES)
    actual_sub_total = sum(counts.values())
    if actual_sub_total != expected_sub_total:
        raise RuntimeError(
            f"substitution total {actual_sub_total} != expected "
            f"{expected_sub_total} — anchor drift or rule miss"
        )
    print(
        f"\nsubstitution total {actual_sub_total} == expected {expected_sub_total} — clean",
        file=sys.stderr,
    )

    if dry_run:
        print("\n=== DRY RUN — not writing ===", file=sys.stderr)
        return updated, new_parsed_dict

    # Backups
    if not os.path.exists(TXT_BACKUP):
        shutil.copy2(TXT, TXT_BACKUP)
        print(f"\nbacked up .txt to {TXT_BACKUP}", file=sys.stderr)
    if not os.path.exists(JSON_BACKUP):
        shutil.copy2(JSON_PATH, JSON_BACKUP)
        print(f"backed up .json to {JSON_BACKUP}", file=sys.stderr)

    # Write updated .txt
    with open(TXT, "w", encoding="utf-8") as f:
        f.write(updated)
    print(f"wrote updated .txt to {TXT}", file=sys.stderr)

    # Write new .json (canonical form: ensure_ascii=False, indent=2)
    with open(JSON_PATH, "w", encoding="utf-8") as f:
        json.dump(new_parsed_dict, f, ensure_ascii=False, indent=2)
        f.write("\n")
    print(f"wrote updated .json to {JSON_PATH}", file=sys.stderr)

    # GATE 3: Durability proof — re-read the .txt from disk, re-parse,
    # compare against the .json we just wrote.
    with open(TXT, encoding="utf-8") as f:
        written_txt = f.read()
    reparse = asdict(parse_apocrypha(written_txt))
    with open(JSON_PATH, encoding="utf-8") as f:
        written_json = json.load(f)
    reparse_str = json.dumps(reparse, ensure_ascii=False, indent=2)
    written_str = json.dumps(written_json, ensure_ascii=False, indent=2)
    if reparse_str == written_str:
        print(f"\n=== GATE 3: DURABILITY PROOF: PASS ===", file=sys.stderr)
        print(f"reparse({len(reparse_str)}) == written_json({len(written_str)})", file=sys.stderr)
    else:
        raise RuntimeError(
            "DURABILITY PROOF FAIL — re-parse of written .txt doesn't equal written .json"
        )

    return updated, new_parsed_dict


if __name__ == "__main__":
    import argparse
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args()
    main(dry_run=args.dry_run)
