#!/usr/bin/env python3
"""
One-off triage: dump every Jasher diff grouped by kind, with the full
OLD/NEW per verse, so we can categorize them as
pipeline-correct-published-gap / published-correct-pipeline-by-design / pipeline-bug.
"""
from __future__ import annotations
import json
import sys
from pathlib import Path
from collections import defaultdict

THIS_DIR = Path(__file__).parent
sys.path.insert(0, str(THIS_DIR))

from restore import Restorer  # type: ignore
from validate_verse_diff import categorize, iter_verses, EDITIONS, PARSED_DIR, EDITION_MODES


def main():
    name = "jasher"
    mode = EDITION_MODES.get(name, "default")
    r = Restorer(mode=mode)
    data = json.loads((PARSED_DIR / EDITIONS[name]).read_text(encoding="utf-8"))

    by_kind: dict[str, list[dict]] = defaultdict(list)
    for book, ch, v, text in iter_verses(data):
        if not text:
            continue
        restored = r.restore_text(text)
        if restored == text:
            continue
        kind = categorize(text, restored)
        by_kind[kind].append({"book": book, "ch": ch, "v": v, "old": text, "new": restored})

    out = THIS_DIR / "validation-reports" / "jasher-triage-by-kind.md"
    with out.open("w", encoding="utf-8") as f:
        for kind in sorted(by_kind, key=lambda k: -len(by_kind[k])):
            entries = by_kind[kind]
            f.write(f"# {kind} — {len(entries)} entries\n\n")
            for e in entries:
                # For brevity in the dump, show only the immediate +/- 80 char window
                # around the first differing run, not the full verse text.
                old, new = e["old"], e["new"]
                # find first divergence
                i = 0
                while i < min(len(old), len(new)) and old[i] == new[i]:
                    i += 1
                lo = max(0, i - 60)
                hi_old = min(len(old), i + 100)
                hi_new = min(len(new), i + 120)
                f.write(f"### {e['book']} {e['ch']}:{e['v']}\n")
                f.write(f"OLD …{old[lo:hi_old]}…\n")
                f.write(f"NEW …{new[lo:hi_new]}…\n\n")
    print(f"Wrote {out}")
    print("Counts:")
    for kind in sorted(by_kind, key=lambda k: -len(by_kind[k])):
        print(f"  {kind:30s} {len(by_kind[kind])}")


if __name__ == "__main__":
    main()
