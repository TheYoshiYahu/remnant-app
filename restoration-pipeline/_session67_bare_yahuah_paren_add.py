#!/usr/bin/env python3
"""
_session67_bare_yahuah_paren_add.py
------------------------------------
S67 compliance wheel: add the missing source-echo parenthetical to bare
`Yahuah` instances across the four published extras editions.

DESIGN (settled at the S67 design gate after audit-reshaped scope):

  Scope: ALL FOUR published extras + per-case rules for the small-edition
  cases. The audit (with the smart-quote-apostrophe fix and the compound /
  possessive false-positive exclusions) showed the real scope is:

    jasher    : 1051 fires (verse 649 + commentary 402)
    jubilees  :    1 fire  (one missed compound: `Yahuah of hosts`)
    apocrypha :    0 fires (1 bare residual is the S65 MENTION carve-out
                            itself: "The personal name Yahuah does not
                            naturally take a possessive in covenant
                            grammar" — STAYS BARE by definition)
    enoch     :    0 fires (2 bare residuals are inside cross-reference
                            parens: "Genesis 2:8 (Yahuah planted a garden
                            eastward in Eden)" — STAYS BARE; nested parens
                            would read badly and the bare form is the
                            convention for cross-ref summaries inside
                            parens)

  Convention per edition (derived from existing paren-wrapped cases):
    jasher    : Yahuah (the Lord) / Yahuah (O Lord) vocative
                (matches existing 80× `(the Lord)` + 9× `(O Lord)` paren
                cases already in jasher.json)
    jubilees  : compound `Yahuah Tseva'ot (LORD of hosts)` for the one
                missed-compound case (Mal 2:7 echo in Jub 31 commentary)

  Rules (5 total across 4 editions):
    R_JASHER_O_YAHUAH         : "O Yahuah" → "O Yahuah (O Lord)"    (vocative)
    R_JASHER_THE_YAHUAH       : "the Yahuah" → "Yahuah (the Lord)"  (stranded
                                article — consumes the "the" because the
                                jasher convention puts "the" INSIDE the paren)
    R_JASHER_BARE_YAHUAH      : bare Yahuah → "Yahuah (the Lord)"
                                  Carve-out: "Yahwe or Yahuah" etymology
                                  line at jasher book intro (MENTION case)
    R_JUBILEES_YAHUAH_OF_HOSTS: "Yahuah of hosts" → "Yahuah Tseva'ot
                                  (LORD of hosts)" (compound rule that
                                  was missed in commentary)
    (apocrypha and enoch: no rules — bare residuals are intentional carve-outs)

  Carve-outs encoded by negative lookahead / lookbehind:
    * Yahuah followed by ' or ’ + s         → possessive, stays bare
    * Yahuah followed by ( opening paren    → already paren-wrapped
    * Yahuah followed by Elohim/Tseva/etc.  → compound construction
    * Yahuah followed by (our|your|my|his|their|her) + Eloh → possessive
      compound (e.g. "Yahuah our Elohim (the LORD our God)")
    * Yahuah preceded by "Yahwe or "        → etymology MENTION
      (Jasher book-intro pronunciation discussion)
    * Yahuah preceded by "( "               → cross-reference paren
      (enoch ch60 cross-refs)
    * Yahuah preceded by "personal name "   → S65 meta-discussion of the
      name (apocrypha 2 Macc 15 commentary)

Wheel pattern (same shape as S65, S66):
  1. Read each .txt
  2. Pre-flight: each rule's anchor matches expected count (GATE 1)
  3. Apply substitutions in firing order (specific first, then bare)
  4. Re-parse the updated .txt via the matching parser
  5. Compare against live JSON (GATE 2)
  6. Write updated .txt + .json
  7. Durability proof: re-read .txt, re-parse, byte-equal to written .json
     (GATE 3)

Idempotent: re-running finds zero matches.
Backups: .txt.pre-s67 + <edition>.json.pre-s67 per edition touched.
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
    for candidate in (
        "/sessions/tender-peaceful-cannon/mnt/App",
        "/sessions/serene-jolly-fermat/mnt/App",
    ):
        if os.path.isdir(candidate):
            return candidate
    host = os.path.expanduser("~/Desktop/App")
    if os.path.isdir(host):
        return host
    raise RuntimeError("cannot resolve App root")


APP = _resolve_app()
sys.path.insert(0, os.path.join(APP, "restoration-pipeline"))
os.environ.setdefault("APP_ROOT", APP)

from parse_published_editions import (  # noqa: E402
    parse_apocrypha, parse_enoch, parse_jasher, parse_jubilees
)


# ---------------------------------------------------------------------------
# Edition specs
# ---------------------------------------------------------------------------

EDITIONS = {
    "jasher": {
        "txt":   "source-texts/existing-restored-editions/Jasher-Restored-Names-Edition.txt",
        "json":  "source-texts/parsed/jasher.json",
        "parser": parse_jasher,
        "expected_book_count": 1,    # Jasher = 1 book with 91 chapters
    },
    "jubilees": {
        "txt":   "source-texts/existing-restored-editions/Jubilees-Restored-Names-Edition.txt",
        "json":  "source-texts/parsed/jubilees.json",
        "parser": parse_jubilees,
        "expected_book_count": 1,
    },
    "apocrypha": {
        "txt":   "source-texts/existing-restored-editions/Apocrypha-Restored-Names-Edition.txt",
        "json":  "source-texts/parsed/apocrypha.json",
        "parser": parse_apocrypha,
        "expected_book_count": 14,
    },
    "enoch": {
        "txt":   "source-texts/existing-restored-editions/Enoch-Restored-Names-Edition.txt",
        "json":  "source-texts/parsed/enoch.json",
        "parser": parse_enoch,
        "expected_book_count": 1,
    },
}


# ---------------------------------------------------------------------------
# Substitution rules per edition
# ---------------------------------------------------------------------------
#
# Each rule: (name, pattern, replacement, expected_count). Rules apply in
# the order listed; specific patterns first so they consume their Yahuah
# before the generic bare rule can see it.
#
# COMMON LOOKAHEAD GUARD (used in bare-Yahuah patterns) — exclude:
#   - Yahuah followed by ' (paren-wrapped)
#   - Yahuah followed by Elohim/Tseva/Yireh/Nissi/Shalom/Tsidkenu/
#     Shammah/Rapha/Ra'ah/Eloh (single-name compound)
#   - Yahuah followed by (our|your|my|his|their|her) + Eloh (possessive
#     compound — already paren-wrapped at the Elohim level)
#   - Yahuah followed by [’']s (possessive — convention is bare per S65)
#
# JASHER RULES
# ============

# R1: O Yahuah — vocative. Becomes "O Yahuah (O Lord)".
#   Pattern: \bO\s+Yahuah\b with the common lookahead guard.
#   Idempotency: post-sub "O Yahuah (O Lord)" — Yahuah is followed by "(",
#   so the lookahead rejects.
R_JASHER_O_YAHUAH = (
    "jasher.O_Yahuah_vocative",
    re.compile(
        r"\bO(\s+)Yahuah\b"
        r"(?!\s*\()"
        r"(?!\s+(?:Elohim|Tseva|Yireh|Nissi|Shalom|Tsidkenu|Shammah|Rapha|Ra'ah|Eloh))"
        r"(?!\s+(?:our|your|my|his|their|her)\s+Eloh)"
        r"(?![’']s)"
    ),
    r"O\1Yahuah (O Lord)",
    8,
)

# R2: "the Yahuah" — stranded article. The initial Jasher restoration
# replaced "Lord" with "Yahuah" but kept the preceding "the", leaving
# "the Yahuah" — which doesn't match the jasher convention (which puts
# "the" INSIDE the paren). Fix: consume the stranded "the" and add the
# `(the Lord)` paren.
#   Pattern: \bthe\s+Yahuah\b with the common lookahead guard.
#   Note: case-insensitive on "the" so it catches both "the" and "The".
#   Replacement: "Yahuah (the Lord)" — original "the" gets dropped (its
#   article role is now performed by the paren).
#   Idempotency: post-sub form has Yahuah followed by "(", so the guard
#   rejects on re-run.
R_JASHER_THE_YAHUAH = (
    "jasher.the_Yahuah_stranded_article",
    re.compile(
        r"\b(the|The)\s+Yahuah\b"
        r"(?!\s*\()"
        r"(?!\s+(?:Elohim|Tseva|Yireh|Nissi|Shalom|Tsidkenu|Shammah|Rapha|Ra'ah|Eloh))"
        r"(?!\s+(?:our|your|my|his|their|her)\s+Eloh)"
        r"(?![’']s)"
    ),
    r"Yahuah (the Lord)",
    # We use the canonical "(the Lord)" lowercase regardless of source casing
    # ("the Yahuah" vs "The Yahuah"), matching the 80× existing `(the Lord)`
    # convention. If a sentence started with "The Yahuah said", losing the
    # capital "The" leaves "Yahuah (the Lord) said" — still capitalized at
    # "Y", reads cleanly.
    20,
)

# R3: bare Yahuah → "Yahuah (the Lord)" — default.
#   Pattern: \bYahuah\b with the common lookahead guard PLUS:
#     * negative lookbehind for "Yahwe or " (the Jasher book-intro
#       etymology MENTION carve-out — "tradition pronounces the name in a
#       form close to / Yahwe or Yahuah, with the four-vowel shape" — STAYS
#       BARE)
#   Idempotency: post-sub form has Yahuah followed by " (", so the guard
#   rejects on re-run.
R_JASHER_BARE_YAHUAH = (
    "jasher.bare_Yahuah_default",
    re.compile(
        r"(?<!Yahwe or )"
        r"\bYahuah\b"
        r"(?!\s*\()"
        r"(?!\s+(?:Elohim|Tseva|Yireh|Nissi|Shalom|Tsidkenu|Shammah|Rapha|Ra'ah|Eloh))"
        r"(?!\s+(?:our|your|my|his|their|her)\s+Eloh)"
        r"(?![’']s)"
    ),
    r"Yahuah (the Lord)",
    # Pre-flight count: 1051 (= all 1052 bare cases minus the 1 "Yahwe or"
    # etymology carve-out). At actual-fire time R1 (8) and R2 (20) have
    # already consumed their cases, so R3 fires 1051 - 28 = 1023 times.
    # Total wheel substitutions: 8 + 20 + 1023 = 1051. Residual bare = 1
    # (the etymology line).
    1051,
)

JASHER_RULES = [
    R_JASHER_O_YAHUAH,
    R_JASHER_THE_YAHUAH,
    R_JASHER_BARE_YAHUAH,
]


# JUBILEES RULES
# ==============

# R_JUB1: "Yahuah of hosts" → "Yahuah Tseva'ot (LORD of hosts)" — missed
# compound. This appears in Jubilees ch31 commentary as a Malachi 2:7 echo:
# "for he is the messenger of Yahuah of hosts" → source: "messenger of the
# LORD of hosts" → restored compound: "messenger of Yahuah Tseva'ot (LORD
# of hosts)".
# Pre-flight expected: 1.
R_JUBILEES_YAHUAH_OF_HOSTS = (
    "jubilees.Yahuah_of_hosts_missed_compound",
    re.compile(r"\bYahuah\s+of\s+hosts\b(?!\s*\()"),
    r"Yahuah Tseva'ot (LORD of hosts)",
    1,
)

JUBILEES_RULES = [R_JUBILEES_YAHUAH_OF_HOSTS]


# APOCRYPHA and ENOCH: no rules — bare residuals are intentional carve-outs.
# We still run the wheel on them to verify the bare-Yahuah count is stable
# (no new bare cases crept in) and the durability gate still passes.
APOCRYPHA_RULES = []
ENOCH_RULES = []

# Expected post-wheel BARE counts (for the verify pass — these should NOT
# decrease, because their existing bare cases are intentional)
EXPECTED_FINAL_BARE = {
    "jasher":    1,   # only the "Yahwe or Yahuah" etymology line stays bare
    "jubilees":  1,   # book-intro convention discussion ("Yahuah and Yahusha
                      # carry the third-commandment weight") stays bare —
                      # MENTION carve-out, same shape as apocrypha's
    "apocrypha": 1,   # the S65 meta-discussion stays bare
    "enoch":     2,   # the 2 cross-reference parens stay bare
}

RULES_BY_EDITION = {
    "jasher":    JASHER_RULES,
    "jubilees":  JUBILEES_RULES,
    "apocrypha": APOCRYPHA_RULES,
    "enoch":     ENOCH_RULES,
}


# BARE-detector regex (same as the audit's TRUE_BARE)
TRUE_BARE = re.compile(
    r"\bYahuah\b"
    r"(?!\s*\()"
    r"(?!\s+(?:Elohim|Tseva|Yireh|Nissi|Shalom|Tsidkenu|Shammah|Rapha|Ra'ah|Eloh))"
    r"(?!\s+(?:our|your|my|his|their|her)\s+Eloh)"
    r"(?![’']s)"
)


# ---------------------------------------------------------------------------
# Per-edition wheel
# ---------------------------------------------------------------------------

def run_edition(name: str, dry_run: bool = False) -> dict:
    spec = EDITIONS[name]
    txt_path = os.path.join(APP, spec["txt"])
    json_path = os.path.join(APP, spec["json"])
    txt_backup = txt_path + ".pre-s67"
    json_backup = json_path + ".pre-s67"
    rules = RULES_BY_EDITION[name]

    print(f"\n{'='*70}\nEDITION: {name}\n{'='*70}", file=sys.stderr)
    print(f"txt:  {txt_path}", file=sys.stderr)
    print(f"json: {json_path}", file=sys.stderr)

    with open(txt_path, encoding="utf-8") as f:
        original = f.read()
    orig_size = len(original.encode("utf-8"))
    print(f"original size: {orig_size:>9d} bytes", file=sys.stderr)

    # Pre-flight structural check
    pre = spec["parser"](original)
    if len(pre.books) != spec["expected_book_count"]:
        raise RuntimeError(
            f"{name}: expected {spec['expected_book_count']} books, "
            f"got {len(pre.books)}"
        )

    bare_before = len(TRUE_BARE.findall(original))
    print(f"bare-Yahuah BEFORE: {bare_before}", file=sys.stderr)

    # ---- GATE 1: pre-flight anchor counts ----
    print(f"\n--- GATE 1: pre-flight anchor counts ({name}) ---", file=sys.stderr)
    if not rules:
        print(f"  (no rules for {name}, skipping anchor count)", file=sys.stderr)
    else:
        all_ok = True
        for rname, pat, repl, expected in rules:
            actual = len(pat.findall(original))
            ok = (actual == expected)
            marker = "OK" if ok else "MISMATCH"
            print(
                f"  {rname:>45s}: {actual} matches (expected {expected}) [{marker}]",
                file=sys.stderr,
            )
            if not ok:
                all_ok = False
        if not all_ok:
            raise RuntimeError(f"{name}: pre-flight count mismatch — anchors drifted")

    # Apply substitutions
    updated = original
    counts = {}
    for rname, pat, repl, _ in rules:
        new_text, count = pat.subn(repl, updated)
        counts[rname] = count
        updated = new_text

    if counts:
        print(f"\nsubstitution counts ({name}):", file=sys.stderr)
        for rname, n in counts.items():
            print(f"  {rname:>45s}: {n}", file=sys.stderr)

    bare_after = len(TRUE_BARE.findall(updated))
    print(f"\nbare-Yahuah AFTER:  {bare_after}", file=sys.stderr)
    expected_final = EXPECTED_FINAL_BARE[name]
    if bare_after != expected_final:
        raise RuntimeError(
            f"{name}: post-wheel bare-Yahuah count {bare_after} != "
            f"expected {expected_final} (carve-outs incomplete or rules drifted)"
        )
    print(f"bare-Yahuah residual matches expected ({expected_final}) — carve-outs working", file=sys.stderr)

    # Re-parse the updated .txt
    new_parsed = spec["parser"](updated)
    new_parsed_dict = asdict(new_parsed)

    if len(new_parsed_dict["books"]) != spec["expected_book_count"]:
        raise RuntimeError(
            f"{name}: post-substitution re-parse produced "
            f"{len(new_parsed_dict['books'])} books, expected "
            f"{spec['expected_book_count']} — structural regression"
        )

    # ---- GATE 2: diffs vs live JSON ----
    with open(json_path, encoding="utf-8") as f:
        live = json.load(f)

    diffs = 0
    for pb, lb in zip(new_parsed_dict["books"], live["books"]):
        for pc, lc in zip(pb.get("chapters", []), lb.get("chapters", [])):
            for pv, lv in zip(pc.get("verses", []), lc.get("verses", [])):
                if pv.get("text") != lv.get("text"):
                    diffs += 1
            if pc.get("commentary") != lc.get("commentary"):
                diffs += 1

    sub_total = sum(counts.values())
    print(f"\n--- GATE 2: structural diffs vs live JSON: {diffs} ---", file=sys.stderr)
    print(f"  (substitution total: {sub_total})", file=sys.stderr)

    if dry_run:
        print(f"\n=== DRY RUN — not writing {name} ===", file=sys.stderr)
        return {
            "edition": name,
            "bare_before": bare_before,
            "bare_after": bare_after,
            "sub_total": sub_total,
            "counts": counts,
            "diffs": diffs,
        }

    # Backups
    if not os.path.exists(txt_backup):
        shutil.copy2(txt_path, txt_backup)
        print(f"backed up .txt to {txt_backup}", file=sys.stderr)
    if not os.path.exists(json_backup):
        shutil.copy2(json_path, json_backup)
        print(f"backed up .json to {json_backup}", file=sys.stderr)

    # Skip writes if no changes
    if sub_total == 0 and diffs == 0:
        print(f"no changes for {name} — skipping write", file=sys.stderr)
        return {
            "edition": name,
            "bare_before": bare_before,
            "bare_after": bare_after,
            "sub_total": 0,
            "counts": counts,
            "diffs": 0,
        }

    # Write updated .txt
    with open(txt_path, "w", encoding="utf-8") as f:
        f.write(updated)
    new_size = len(updated.encode("utf-8"))
    print(f"wrote updated .txt to {txt_path} ({orig_size} → {new_size} bytes, +{new_size-orig_size})",
          file=sys.stderr)

    # Write new .json (canonical form: ensure_ascii=False, indent=2)
    with open(json_path, "w", encoding="utf-8") as f:
        json.dump(new_parsed_dict, f, ensure_ascii=False, indent=2)
        f.write("\n")
    print(f"wrote updated .json to {json_path}", file=sys.stderr)

    # ---- GATE 3: Durability proof ----
    with open(txt_path, encoding="utf-8") as f:
        written_txt = f.read()
    reparse = asdict(spec["parser"](written_txt))
    with open(json_path, encoding="utf-8") as f:
        written_json = json.load(f)
    reparse_str = json.dumps(reparse, ensure_ascii=False, indent=2)
    written_str = json.dumps(written_json, ensure_ascii=False, indent=2)
    if reparse_str == written_str:
        print(f"\n--- GATE 3: DURABILITY PROOF ({name}): PASS ---", file=sys.stderr)
        print(f"  reparse({len(reparse_str)}) == written_json({len(written_str)})",
              file=sys.stderr)
    else:
        raise RuntimeError(
            f"{name}: DURABILITY PROOF FAIL — re-parse of written .txt "
            f"doesn't equal written .json"
        )

    return {
        "edition": name,
        "bare_before": bare_before,
        "bare_after": bare_after,
        "sub_total": sub_total,
        "counts": counts,
        "diffs": diffs,
        "size_before": orig_size,
        "size_after": new_size,
    }


def main(dry_run: bool = False, editions=None):
    print(f"APP = {APP}", file=sys.stderr)
    targets = editions or list(EDITIONS.keys())
    results = []
    for name in targets:
        try:
            r = run_edition(name, dry_run=dry_run)
            results.append(r)
        except Exception as e:
            print(f"\n!!! ERROR processing {name}: {e}", file=sys.stderr)
            raise

    print(f"\n\n{'='*70}\nS67 SUMMARY (dry_run={dry_run})\n{'='*70}", file=sys.stderr)
    print(f"{'edition':>10s}  {'bare_before':>11s}  {'bare_after':>10s}  "
          f"{'subs':>5s}  {'diffs':>5s}", file=sys.stderr)
    for r in results:
        print(f"{r['edition']:>10s}  {r['bare_before']:>11d}  "
              f"{r['bare_after']:>10d}  {r['sub_total']:>5d}  {r['diffs']:>5d}",
              file=sys.stderr)
    total_subs = sum(r["sub_total"] for r in results)
    print(f"\ntotal substitutions: {total_subs}", file=sys.stderr)
    return results


if __name__ == "__main__":
    import argparse
    ap = argparse.ArgumentParser()
    ap.add_argument("--dry-run", action="store_true")
    ap.add_argument("--editions", nargs="*", default=None,
                    help="subset of editions to run (default: all)")
    args = ap.parse_args()
    main(dry_run=args.dry_run, editions=args.editions)
