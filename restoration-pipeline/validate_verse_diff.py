#!/usr/bin/env python3
"""
validate_verse_diff.py
----------------------
Per-verse validation diff. Loads the parsed JSON of a published edition
(produced by parse_published_editions.py), runs each verse independently
through the restore pipeline, and reports any verse where the pipeline's
output differs from the published verse text.

This skips front-matter and About-This-Edition meta-text entirely — the
pipeline is designed to run on body verses, not commentary about the
edition's conventions. Per-verse diffing also avoids any line-alignment
artifacts; each verse is its own atom.

Usage:
    python3 validate_verse_diff.py apocrypha
    python3 validate_verse_diff.py jasher --max-samples 50
"""

from __future__ import annotations
import argparse
import json
import sys
from pathlib import Path

THIS_DIR = Path(__file__).parent
PARSED_DIR = THIS_DIR.parent / "source-texts" / "parsed"
DEFAULT_REPORT_DIR = THIS_DIR / "validation-reports"

EDITIONS = {
    "apocrypha": "apocrypha.json",
    "enoch": "enoch.json",
    "jasher": "jasher.json",
    "jubilees": "jubilees.json",
}

# Per-edition pipeline mode. Apocrypha excludes the jesus_alone rule
# because every "Jesus" in the Apocrypha is Joshua/Yeshua, not the Messiah.
EDITION_MODES = {
    "apocrypha": "apocrypha",
    "enoch": "default",
    "jasher": "default",
    "jubilees": "default",
}


def load_restorer(mode: str = "default"):
    sys.path.insert(0, str(THIS_DIR))
    from restore import Restorer  # type: ignore
    return Restorer(mode=mode)


def categorize(old: str, new: str) -> str:
    """Best-effort label for what changed."""
    pairs = [
        ("son_of_man_to_adam",   "Son of Adam"),
        ("son_of_man_to_adam",   "son of Adam"),
        ("sons_of_men_to_adam",  "sons of Adam"),
        ("melchizedek",          "Melek Tsadiq"),
        ("lord_god_compound",    "Yahuah Elohim"),
        ("jesus_christ",         "Yahusha HaMashiach"),
        ("holy_spirit",          "Ruach HaKodesh"),
        ("lord_to_yahuah",       "Yahuah ("),
        ("jesus_to_yahusha",     "Yahusha (Jesus)"),
        ("christ_to_messiah",    "Messiah (Christ)"),
        ("god_to_elohim",        "Elohim (God)"),
        ("israel_to_yasharel",   "Yashar'el (Israel)"),
        ("judah_to_yahudah",     "Yahudah (Judah)"),
        ("jews_to_yahudim",      "Yahudim (Jews)"),
        ("jewish_to_yahudi",     "Yahudi (Jewish)"),
        ("jew_to_yahudi",        "Yahudi (Jew)"),
    ]
    for label, marker in pairs:
        if marker in new and marker not in old:
            return label
    return "other"


def iter_verses(data: dict):
    """Yield (book_title, chapter_num, verse_num, verse_text) for every verse."""
    for book in data.get("books", []):
        title = book.get("book_title", "?")
        for ch in book.get("chapters", []):
            ch_num = ch.get("number")
            for v in ch.get("verses", []):
                # parse_published_editions stores verses as either dicts
                # ({number, text}) or as list-of-tuples. Handle both.
                if isinstance(v, dict):
                    yield title, ch_num, v.get("number"), v.get("text", "")
                elif isinstance(v, (list, tuple)) and len(v) >= 2:
                    yield title, ch_num, v[0], v[1]


def run(name: str, max_samples: int, report_dir: Path) -> dict:
    mode = EDITION_MODES.get(name, "default")
    r = load_restorer(mode=mode)
    parsed_path = PARSED_DIR / EDITIONS[name]
    data = json.loads(parsed_path.read_text(encoding="utf-8"))

    total_verses = 0
    diffs: list[dict] = []
    by_kind: dict[str, int] = {}

    for book, ch_num, v_num, text in iter_verses(data):
        if not text:
            continue
        total_verses += 1
        restored = r.restore_text(text)
        if restored == text:
            continue
        kind = categorize(text, restored)
        by_kind[kind] = by_kind.get(kind, 0) + 1
        if len(diffs) < max_samples:
            diffs.append({
                "book": book,
                "chapter": ch_num,
                "verse": v_num,
                "kind": kind,
                "old": text,
                "new": restored,
            })

    report_dir.mkdir(parents=True, exist_ok=True)
    report_path = report_dir / f"{name}-verse-diff.md"
    with report_path.open("w", encoding="utf-8") as f:
        f.write(f"# Per-verse validation diff — {name}\n\n")
        f.write(f"- source: `parsed/{EDITIONS[name]}`\n")
        f.write(f"- pipeline mode: `{mode}`\n")
        f.write(f"- total verses scanned: **{total_verses:,}**\n")
        f.write(f"- verses with diffs: **{sum(by_kind.values())}**\n")
        f.write(f"- pass rate: **{(total_verses - sum(by_kind.values())) / total_verses * 100:.2f}%**\n\n")
        if by_kind:
            f.write("## Counts by kind\n\n")
            for kind, count in sorted(by_kind.items(), key=lambda kv: -kv[1]):
                f.write(f"- **{kind}**: {count}\n")
            f.write("\n")
        if diffs:
            f.write(f"## First {len(diffs)} sample diffs\n\n")
            for d in diffs:
                ref = f"{d['book']} {d['chapter']}:{d['verse']}"
                f.write(f"### {ref} [{d['kind']}]\n\n")
                f.write(f"```\nOLD: {d['old']}\nNEW: {d['new']}\n```\n\n")

    print(f"\nReport: {report_path}")
    return {
        "edition": name,
        "total_verses": total_verses,
        "diff_count": sum(by_kind.values()),
        "by_kind": by_kind,
    }


def main():
    p = argparse.ArgumentParser()
    p.add_argument("editions", nargs="*", help="which editions to diff (default: all)")
    p.add_argument("--max-samples", type=int, default=80)
    p.add_argument("--report-dir", default=str(DEFAULT_REPORT_DIR))
    args = p.parse_args()

    targets = args.editions or list(EDITIONS.keys())
    report_dir = Path(args.report_dir)

    print(f"Per-verse validation diffs -> {report_dir}\n")
    for name in targets:
        if name not in EDITIONS:
            print(f"  skip: unknown edition {name}")
            continue
        if not (PARSED_DIR / EDITIONS[name]).exists():
            print(f"  skip: parsed/{EDITIONS[name]} not found")
            continue
        print(f"  diffing {name}...")
        s = run(name, args.max_samples, report_dir)
        marker = "OK  " if s["diff_count"] == 0 else "DIFF"
        rate = (s["total_verses"] - s["diff_count"]) / s["total_verses"] * 100 if s["total_verses"] else 0
        kinds = ", ".join(f"{k}={v}" for k, v in sorted(s["by_kind"].items(), key=lambda kv: -kv[1])[:4])
        print(f"  {marker}  {name:12s}  {s['diff_count']:5d}/{s['total_verses']:5d} verses  ({rate:.2f}%)  [{kinds}]")


if __name__ == "__main__":
    main()
