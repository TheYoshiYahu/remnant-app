#!/usr/bin/env python3
"""
validate_diff.py
----------------
Phase 3 validation harness — line-level diff between Yoshi's published
Restored Names editions and the pipeline's output when run on those same
editions.

Expected baseline: zero diffs. The published editions are already restored,
the pipeline is idempotent, so running the pipeline on a published edition
should be a no-op. Any diff is one of three things:

  1. A pipeline rule that catches a name the published edition missed
     (= the published edition has an inconsistency the pipeline now
     surfaces; Yoshi can decide whether to push the fix back to the .docx).
  2. A pipeline rule that's too aggressive — fires inside meta-text or
     preserved quotations or front-matter where the unrestored form was
     intentional (= an INTENTIONAL_VARIANCES entry is needed).
  3. A pipeline bug we need to fix.

Walks line-by-line so the harness scales to multi-megabyte books in
seconds, not the O(n²) of running difflib on the whole document.

Usage:
    python3 validate_diff.py apocrypha       # diff one edition
    python3 validate_diff.py                 # diff all four
    python3 validate_diff.py --report-dir reports/
"""

from __future__ import annotations
import argparse
import re
import sys
from pathlib import Path

THIS_DIR = Path(__file__).parent
EDITIONS_DIR = THIS_DIR.parent / "source-texts" / "existing-restored-editions"
DEFAULT_REPORT_DIR = THIS_DIR / "validation-reports"

EDITIONS = {
    "apocrypha": "Apocrypha-Restored-Names-Edition.txt",
    "enoch": "Enoch-Restored-Names-Edition.txt",
    "jasher": "Jasher-Restored-Names-Edition.txt",
    "jubilees": "Jubilees-Restored-Names-Edition.txt",
}


def load_restorer():
    sys.path.insert(0, str(THIS_DIR))
    from restore import Restorer  # type: ignore
    return Restorer()


# Rough categorizer for what kind of substitution fired on a changed line.
def categorize(old: str, new: str) -> str:
    pairs = [
        ("son_of_man_to_adam",      "Son of Adam",            "son of Man"),
        ("son_of_man_to_adam",      "son of Adam",            "son of man"),
        ("sons_of_men_to_adam",     "sons of Adam",           "sons of men"),
        ("melchizedek_to_melek",    "Melek Tsadiq",           "Melchizedek"),
        ("lord_god_compound",       "Yahuah Elohim",          "LORD God"),
        ("lord_god_compound",       "Yahuah Elohim",          "Lord God"),
        ("jesus_christ_compound",   "Yahusha HaMashiach",     "Jesus Christ"),
        ("christ_jesus_compound",   "HaMashiach Yahusha",     "Christ Jesus"),
        ("holy_spirit_to_ruach",    "Ruach HaKodesh",         "Holy Spirit"),
        ("holy_ghost_to_ruach",     "Ruach HaKodesh",         "Holy Ghost"),
        ("lord_to_yahuah",          "Yahuah (God)",           "LORD"),
        ("lord_to_yahuah",          "Yahuah (Lord)",          "Lord"),
        ("jesus_to_yahusha",        "Yahusha (Jesus)",        "Jesus"),
        ("christ_to_messiah",       "Messiah (Christ)",       "Christ"),
        ("god_to_elohim",           "Elohim (God)",           "God"),
        ("israel_to_yasharel",      "Yashar'el (Israel)",     "Israel"),
        ("judah_to_yahudah",        "Yahudah (Judah)",        "Judah"),
        ("jews_to_yahudim",         "Yahudim (Jews)",         "Jews"),
        ("jewish_to_yahudi",        "Yahudi (Jewish)",        "Jewish"),
        ("jew_to_yahudi",           "Yahudi (Jew)",           "Jew"),
        ("article_drop",            "Yahuah",                 "the Yahuah"),
    ]
    for label, marker_in_new, marker_in_old in pairs:
        if marker_in_new in new and marker_in_new not in old:
            # Confirm the old also had the trigger (helps avoid false labels)
            if marker_in_old in old:
                return label
            return label  # marker_in_new appearing fresh is enough
    return "other"


def diff_one(name: str, path: Path, report_dir: Path) -> dict:
    r = load_restorer()
    text = path.read_text(encoding="utf-8")
    restored = r.restore_text(text)

    if text == restored:
        report_dir.mkdir(parents=True, exist_ok=True)
        report_path = report_dir / f"{name}-diff.md"
        report_path.write_text(
            f"# Validation diff — {name}\n\n"
            f"- source: `{path.name}` ({len(text):,} chars)\n"
            f"- identical: **True** (pipeline is a no-op on this edition)\n"
            f"- total diff lines: 0\n",
            encoding="utf-8",
        )
        return {
            "edition": name,
            "source_chars": len(text),
            "identical": True,
            "total_diff_lines": 0,
            "by_kind": {},
            "samples": [],
        }

    old_lines = text.splitlines()
    new_lines = restored.splitlines()

    # If the line counts match, we can do a simple zip walk.
    # If they don't, fall back to a line-aligned scan.
    samples: list[dict] = []
    by_kind: dict[str, int] = {}
    total = 0

    if len(old_lines) == len(new_lines):
        for ln_no, (a, b) in enumerate(zip(old_lines, new_lines), 1):
            if a == b:
                continue
            total += 1
            kind = categorize(a, b)
            by_kind[kind] = by_kind.get(kind, 0) + 1
            if len(samples) < 50:
                samples.append({
                    "line": ln_no,
                    "kind": kind,
                    "old": a,
                    "new": b,
                })
    else:
        # Line counts differ — usually a sign the pipeline injected text
        # that wasn't in the original (newlines in a substitution, etc.)
        # Still produce a useful report by aligning what we can.
        for ln_no, (a, b) in enumerate(zip(old_lines, new_lines), 1):
            if a == b:
                continue
            total += 1
            kind = categorize(a, b)
            by_kind[kind] = by_kind.get(kind, 0) + 1
            if len(samples) < 50:
                samples.append({
                    "line": ln_no,
                    "kind": kind,
                    "old": a,
                    "new": b,
                })

    report_dir.mkdir(parents=True, exist_ok=True)
    report_path = report_dir / f"{name}-diff.md"
    with report_path.open("w", encoding="utf-8") as f:
        f.write(f"# Validation diff — {name}\n\n")
        f.write(f"- source: `{path.name}`\n")
        f.write(f"- source chars: {len(text):,}\n")
        f.write(f"- restored chars: {len(restored):,}\n")
        f.write(f"- source lines: {len(old_lines):,}\n")
        f.write(f"- restored lines: {len(new_lines):,}\n")
        f.write(f"- identical: **False**\n")
        f.write(f"- total diff lines: **{total}**\n\n")
        if by_kind:
            f.write("## Counts by kind\n\n")
            for kind, count in sorted(by_kind.items(), key=lambda kv: -kv[1]):
                f.write(f"- **{kind}**: {count}\n")
            f.write("\n")
        if samples:
            f.write(f"## First {len(samples)} sample diffs\n\n")
            for s in samples:
                f.write(f"### line {s['line']} [{s['kind']}]\n\n")
                f.write(f"```\nOLD: {s['old']}\nNEW: {s['new']}\n```\n\n")
    return {
        "edition": name,
        "source_chars": len(text),
        "restored_chars": len(restored),
        "identical": False,
        "total_diff_lines": total,
        "by_kind": by_kind,
        "samples": samples,
    }


def main():
    p = argparse.ArgumentParser()
    p.add_argument("editions", nargs="*", help="which editions to diff (default: all)")
    p.add_argument("--report-dir", default=str(DEFAULT_REPORT_DIR))
    args = p.parse_args()

    targets = args.editions or list(EDITIONS.keys())
    report_dir = Path(args.report_dir)

    print(f"Validation diffs -> {report_dir}\n")
    overall = {}
    for name in targets:
        if name not in EDITIONS:
            print(f"  skip: unknown edition {name}")
            continue
        path = EDITIONS_DIR / EDITIONS[name]
        if not path.exists():
            print(f"  skip: {path} not found")
            continue
        print(f"  diffing {name} ({path.name})...")
        s = diff_one(name, path, report_dir)
        marker = "OK  " if s["identical"] else "DIFF"
        print(f"    {marker}  {s['total_diff_lines']:5d} diff lines  ({s['source_chars']:,} chars)")
        overall[name] = s

    print("\n" + "=" * 60)
    print("Summary:")
    for name, s in overall.items():
        marker = "OK  " if s["identical"] else "DIFF"
        kinds = ", ".join(f"{k}={v}" for k, v in sorted(s["by_kind"].items(), key=lambda kv: -kv[1])[:4])
        print(f"  {marker}  {name:12s}  {s['total_diff_lines']:5d} diffs  [{kinds}]")


if __name__ == "__main__":
    main()
