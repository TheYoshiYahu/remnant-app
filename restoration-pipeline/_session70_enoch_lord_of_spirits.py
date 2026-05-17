#!/usr/bin/env python3
"""
_session70_enoch_lord_of_spirits.py
------------------------------------
S70 compliance wheel: restore the 13 bare `(the )?Lord of Spirits` instances
in enoch verses to match the established edition-wide convention
`Yahuah (God) of Spirits` (270 already-restored instances at scale).

DESIGN (settled at the S70 design gate after audit on top of the
chapter-title convention closure):

  Scope: ENOCH ONLY for substitution. The audit (TXT-side + JSON-side
  cross-check) showed the real scope is:

    enoch     : 13 fires (verse-only — chs 38, 39, 42, 45, 62, 63)
    jasher    :  0 fires (defensive zero-fire pass for carve-out
                          preservation verification)
    jubilees  :  0 fires (defensive zero-fire pass)
    apocrypha :  0 fires (defensive zero-fire pass — every "Lord of"
                          phrase here is already in compound form)

  Convention (derived from the existing 270 paren-wrapped cases in
  enoch.txt — and the 269 already present in the oldest backup,
  .pre-s63, meaning this convention predates the pipeline):

    Form: `Yahuah (God) of Spirits`
          - Parenthetical is `(God)`, NOT source-echo `(Lord)`
          - NO leading article — `the` is dropped when present in source
          - Demonstrative `that` is preserved unchanged (3 existing
            `that Yahuah (God) of Spirits` instances confirm)

  Distribution of the 13 bare:
    - 12 with leading `the` (article dropped on restoration)
    -  1 with leading `that` (demonstrative preserved)

  Single rule:
    R_ENOCH_LORD_OF_SPIRITS:
      pattern:     \\b(?:the\\s+)?Lord of Spirits\\b
      replacement: Yahuah (God) of Spirits
      expected:    13 fires
      idempotent:  post-sub form has no `Lord` token; re-run finds 0

  Why this isn't a Red Line #12 / source-echo-violation:
    The existing 270-strong convention IN THIS EDITION predates the
    pipeline and reflects Yoshi's original editorial choice in the
    published Restored Names edition. Per the operating discipline
    "When a working form exists in production at scale, extend the
    existing one consistently rather than introducing a new convention,"
    the 13 bare cases match the dominant form — they do not introduce
    new typography. The source-echo `(Lord)` rule in restore.py
    governs first-time restorations of the divine name "Lord" at scale;
    this is a defect-fix completing a partially-applied edition-wide
    convention.

Wheel pattern (S67/S68 lineage):
  1. Read each .txt
  2. Pre-flight: each rule's anchor matches expected count (GATE 1)
  3. Apply substitutions
  4. Re-parse the updated .txt via the matching parser
  5. Compare against live JSON (GATE 2 — structural diffs vs live JSON)
  6. Write updated .txt + .json
  7. Durability proof: re-parse written .txt, byte-equal to written .json
     (GATE 3)
  8. Residual gate: bare (the )?Lord of Spirits count post-sub == 0

Defensive backups (.pre-s70 sidecars):
  All 4 editions get .txt sidecars (1 modified + 3 defensive symmetry
  backups for the zero-fire editions). Per S69 lesson, idempotent
  acceptance: if .pre-s70 already exists with content matching current
  pre-state, accept as existing backup; only refuse on content mismatch.
  .json sidecars are local-only / gitignored per the standing
  source-texts/parsed/*.pre-* rule.

Idempotent: re-running the wheel finds 0 fires (post-sub form
`Yahuah (God) of Spirits` doesn't match the bare pattern).
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
        "/sessions/beautiful-optimistic-hawking/mnt/Desktop/App",
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
    "enoch": {
        "txt":   "source-texts/existing-restored-editions/Enoch-Restored-Names-Edition.txt",
        "json":  "source-texts/parsed/enoch.json",
        "parser": parse_enoch,
        "expected_book_count": 1,
    },
    "jasher": {
        "txt":   "source-texts/existing-restored-editions/Jasher-Restored-Names-Edition.txt",
        "json":  "source-texts/parsed/jasher.json",
        "parser": parse_jasher,
        "expected_book_count": 1,
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
}


# ---------------------------------------------------------------------------
# Substitution rules per edition
# ---------------------------------------------------------------------------

# Single rule for enoch — restore the 13 bare cases.
#   Pattern uses \s+ tolerance to handle any wrap whitespace.
#   Replacement drops the optional "the" article (matches the 270-strong
#   convention with no leading article).
#   Idempotency: post-sub form has no "Lord" token, so re-run finds 0.
R_ENOCH_LORD_OF_SPIRITS = (
    "enoch.Lord_of_Spirits_convention_completion",
    re.compile(r"\b(?:the\s+)?Lord\s+of\s+Spirits\b"),
    r"Yahuah (God) of Spirits",
    13,
)

ENOCH_RULES = [R_ENOCH_LORD_OF_SPIRITS]

# Defensive zero-fire on the other 3 editions.
JASHER_RULES = []
JUBILEES_RULES = []
APOCRYPHA_RULES = []

# Expected post-wheel BARE counts (residual gate)
EXPECTED_FINAL_BARE = {
    "enoch":     0,   # all 13 swept
    "jasher":    0,   # no Lord-of-Spirits there
    "jubilees":  0,
    "apocrypha": 0,
}

RULES_BY_EDITION = {
    "enoch":     ENOCH_RULES,
    "jasher":    JASHER_RULES,
    "jubilees":  JUBILEES_RULES,
    "apocrypha": APOCRYPHA_RULES,
}


# BARE-detector regex — same as the audit
TRUE_BARE = re.compile(r"\b(?:the\s+)?Lord\s+of\s+Spirits\b")


# ---------------------------------------------------------------------------
# Idempotent backup handling (S69 lesson: accept existing-and-matching
# backups; refuse only on content mismatch).
# ---------------------------------------------------------------------------

def safe_backup(src_path: str, backup_path: str) -> str:
    """Write backup; if backup already exists and matches current source,
    accept silently. Refuse only on content mismatch."""
    if os.path.exists(backup_path):
        with open(src_path, "rb") as f:
            src_bytes = f.read()
        with open(backup_path, "rb") as f:
            bkp_bytes = f.read()
        if src_bytes == bkp_bytes:
            return f"backup already exists and matches current pre-state — accepted"
        else:
            raise RuntimeError(
                f"REFUSE: existing backup {backup_path} content "
                f"({len(bkp_bytes)} bytes) differs from current source "
                f"({len(src_bytes)} bytes). Wheel cannot overwrite a "
                f"different backup."
            )
    shutil.copy2(src_path, backup_path)
    return f"wrote new backup to {backup_path}"


# ---------------------------------------------------------------------------
# Per-edition wheel
# ---------------------------------------------------------------------------

def run_edition(name: str, dry_run: bool = False) -> dict:
    spec = EDITIONS[name]
    txt_path = os.path.join(APP, spec["txt"])
    json_path = os.path.join(APP, spec["json"])
    txt_backup = txt_path + ".pre-s70"
    json_backup = json_path + ".pre-s70"
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
    print(f"bare (the )?Lord of Spirits BEFORE: {bare_before}", file=sys.stderr)

    # ---- GATE 1: pre-flight anchor counts ----
    print(f"\n--- GATE 1: pre-flight anchor counts ({name}) ---", file=sys.stderr)
    if not rules:
        print(f"  (no rules for {name}, defensive zero-fire pass)", file=sys.stderr)
    else:
        all_ok = True
        for rname, pat, repl, expected in rules:
            actual = len(pat.findall(original))
            ok = (actual == expected)
            marker = "OK" if ok else "MISMATCH"
            print(
                f"  {rname:>50s}: {actual} matches (expected {expected}) [{marker}]",
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
            print(f"  {rname:>50s}: {n}", file=sys.stderr)

    bare_after = len(TRUE_BARE.findall(updated))
    print(f"\nbare (the )?Lord of Spirits AFTER:  {bare_after}", file=sys.stderr)
    expected_final = EXPECTED_FINAL_BARE[name]
    if bare_after != expected_final:
        raise RuntimeError(
            f"{name}: post-wheel bare count {bare_after} != "
            f"expected {expected_final} (residual gate failed)"
        )
    print(f"residual gate: bare count {bare_after} matches expected ({expected_final})",
          file=sys.stderr)

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

    # Backups — idempotent (S69 lesson)
    print(f"\n--- Backups ({name}) ---", file=sys.stderr)
    print(f"  .txt: {safe_backup(txt_path, txt_backup)}", file=sys.stderr)
    print(f"  .json: {safe_backup(json_path, json_backup)}", file=sys.stderr)

    # Skip writes if no changes
    if sub_total == 0 and diffs == 0:
        print(f"no changes for {name} — skipping write (defensive pass complete)",
              file=sys.stderr)
        return {
            "edition": name,
            "bare_before": bare_before,
            "bare_after": bare_after,
            "sub_total": 0,
            "counts": counts,
            "diffs": 0,
            "size_before": orig_size,
            "size_after": orig_size,
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
    # Default order: enoch first (the modifying pass), then 3 defensive
    # zero-fires for symmetry.
    targets = editions or ["enoch", "jasher", "jubilees", "apocrypha"]
    results = []
    for name in targets:
        try:
            r = run_edition(name, dry_run=dry_run)
            results.append(r)
        except Exception as e:
            print(f"\n!!! ERROR processing {name}: {e}", file=sys.stderr)
            raise

    print(f"\n\n{'='*70}\nS70 SUMMARY (dry_run={dry_run})\n{'='*70}", file=sys.stderr)
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
