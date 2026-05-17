#!/usr/bin/env python3
"""
_session65_apocrypha_compliance_fix.py
--------------------------------------
S65 compliance wheel: apply 3 highly-anchored Sacred Names restoration
fixes to the Apocrypha .txt mirror and re-parse to update parsed/apocrypha.json.

Scope (from the S65 Apocrypha durability probe — durability itself is
already CLOSED, .txt ↔ live JSON byte-equal at 2,664,713 bytes):
  * Judith 8:16 verse: "neither is he as the son of man, that he should
    be wavering" — poetic-generic Red Line #12, restore to "son of Adam"
  * Ecclesiasticus 17:30 verse: "the son of man is not immortal" — same
  * 2 Maccabees 3 commentary: a quoted 2 Chronicles 20:22 fragment
    ("the LORD set ambushments against the children of Ammon") — real
    KJV-quotation restoration miss, restore to "Yahuah (LORD)"

PRESERVED (NOT touched by any rule in this wheel):
  * 2 Esdras 11 commentary "KING OF KINGS, AND LORD OF LORDS" — Messianic
    sovereignty title, not Tetragrammaton; the kuvrios kurion compound
    has no Sacred Names rule (intentionally — it's stylistic capital).
  * 2 Maccabees 15 commentary (×2) "LORD (small caps in the original
    1769)" and similar meta-commentary discussing the convention itself —
    MENTION cases of the name-as-source-form.
  * 2 Maccabees 15 commentary bare "Yahuah" in "The personal name
    Yahuah does not naturally take a possessive in covenant grammar" —
    MENTION case discussing the name itself.
  * ~60 bare "God" follow-on uses (e.g. "Yahuah (God) the God of
    Yashar'el (Israel)") — DEFERRED to a future wheel that designs the
    Elohei-X / "the God of X" compound-construction rule properly. The
    current Sacred Names spec doesn't carry that compound; mechanical
    substitution would over-touch.

Architectural notes — Apocrypha is the multi-book family:
  * 14 books, 187 chapters, parses via `parse_published_editions.parse_apocrypha`
  * Heading regex: `^<Book Name> — (Chapter N|Introduction)$` (em-dash
    separator, book-name alternation, kind=chapter-or-intro)
  * Commentary marker: bare `^Commentary$` (same as Jubilees)
  * Three-zone per chapter: scripture / Commentary marker / commentary

Because the substitutions are SO anchored (specific phrases that appear
only in their target locations across the corpus), the wheel doesn't
need the multi-book chapter walker the durability wheels used. Each
substitution is a global regex with a unique anchor — preverified by
counting matches across the whole .txt. The wheel then:
  1. Reads .txt
  2. Confirms each anchor matches exactly 1 location (no surprises)
  3. Applies the 3 substitutions in-place
  4. Re-parses the updated .txt via parse_apocrypha
  5. Writes the new parsed/apocrypha.json
  6. Backups: .txt.pre-s65 + apocrypha.json.pre-s65

Idempotent: re-running finds zero matches (the post-substitution forms
don't match the pre-substitution anchors).
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

from parse_published_editions import parse_apocrypha  # noqa: E402

TXT = os.path.join(
    APP,
    "source-texts/existing-restored-editions/Apocrypha-Restored-Names-Edition.txt",
)
JSON_PATH = os.path.join(APP, "source-texts/parsed/apocrypha.json")
TXT_BACKUP = TXT + ".pre-s65"
JSON_BACKUP = JSON_PATH + ".pre-s65"


# ---------------------------------------------------------------------------
# Substitution rules — each one a uniquely-anchored regex
# ---------------------------------------------------------------------------
#
# Each rule: (name, pattern, replacement, expected_count). The wheel asserts
# the pre-flight count matches expected so we catch any anchor drift.
# Patterns use \s+ between words for line-wrap tolerance (.txt is 73-col
# line-wrapped).
# ---------------------------------------------------------------------------

# Rule 1: Judith 8:16 verse — restore poetic-generic son of man
# Anchor: "as the son of man, that he should be wavering"
# Idempotency: post-substitution form is "as the son of Adam, that he should"
# which doesn't match the pattern's "son\s+of\s+man" portion.
R_JUDITH_8_16 = (
    "judith_8_16_son_of_man",
    re.compile(r"as\s+the\s+son\s+of\s+man,\s+that\s+he\s+should\s+be\s+wavering"),
    "as the son of Adam, that he should be wavering",
    1,
)

# Rule 2: Ecclesiasticus 17:30 verse — restore poetic-generic son of man
# Anchor: "the son of man is not immortal"
# Idempotency: post-substitution form is "the son of Adam is not immortal."
R_ECCL_17_30 = (
    "eccl_17_30_son_of_man",
    re.compile(r"the\s+son\s+of\s+man\s+is\s+not\s+immortal"),
    "the son of Adam is not immortal",
    1,
)

# Rule 3: 2 Maccabees 3 commentary — restore bare LORD in 2 Chr 20:22 quotation
# Anchor: "the LORD set ambushments against the children of Ammon"
# Idempotency: post-substitution form is "Yahuah (LORD) set ambushments
# against the children of Ammon" which drops "the" and doesn't match.
# Note: the article "the" is dropped per the Sacred Names convention —
# `the LORD` → `Yahuah (LORD)` is a phrase substitution, not just a noun.
R_2_MACC_3_LORD = (
    "2_macc_3_lord_2chr_quotation",
    re.compile(r"\bthe\s+LORD\s+set\s+ambushments\s+against\s+the\s+children\s+of\s+Ammon"),
    "Yahuah (LORD) set ambushments against the children of Ammon",
    1,
)

RULES = [R_JUDITH_8_16, R_ECCL_17_30, R_2_MACC_3_LORD]


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

    # Pre-flight: each rule's anchor matches exactly its expected count
    print("\n=== pre-flight rule counts ===", file=sys.stderr)
    all_ok = True
    for name, pat, repl, expected in RULES:
        actual = len(pat.findall(original))
        ok = (actual == expected)
        marker = "OK" if ok else "MISMATCH"
        print(f"  {name:>30s}: {actual} matches (expected {expected}) [{marker}]", file=sys.stderr)
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
    # exactly what we expected (no collateral)
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

    print(f"\n=== diffs vs live JSON: {len(diffs)} ===", file=sys.stderr)
    for book, ch, loc, old, new in diffs:
        # Show only the changed span for clarity
        # Find the first divergence
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
        print()

    # Sanity gate: diff count must equal sum of expected counts
    expected_diff_count = sum(expected for _, _, _, expected in RULES)
    if len(diffs) != expected_diff_count:
        raise RuntimeError(
            f"diff count {len(diffs)} != expected {expected_diff_count} — collateral!"
        )
    print(f"diff count {len(diffs)} == expected {expected_diff_count} — clean", file=sys.stderr)

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

    # Durability proof: re-read the .txt from disk, re-parse, compare against
    # the .json we just wrote.
    with open(TXT, encoding="utf-8") as f:
        written_txt = f.read()
    reparse = asdict(parse_apocrypha(written_txt))
    with open(JSON_PATH, encoding="utf-8") as f:
        written_json = json.load(f)
    reparse_str = json.dumps(reparse, ensure_ascii=False, indent=2)
    written_str = json.dumps(written_json, ensure_ascii=False, indent=2)
    if reparse_str == written_str:
        print(f"\n=== DURABILITY PROOF: PASS ===", file=sys.stderr)
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
