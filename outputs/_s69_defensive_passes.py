#!/usr/bin/env python3
"""S69 defensive zero-fire passes on apocrypha/enoch/jubilees.

For each of the other 3 published extras editions:
  1. Run the same scripture-quote classifier the jasher wheel uses.
  2. Confirm zero IN_SCRIPTURE_QUOTE + zero IN_QUOTE_NO_CITE bare-covenant-
     people-names hits (per the S69 audit's earlier verdict that these
     editions are clean).
  3. Write a .pre-s69 defensive backup of the .txt for symmetry with the
     S65–S68 precedent (committed for the per-edition sidecar trail).

The .json files for these 3 editions DON'T change in S69, so no .json
backup is needed — only the .txt sidecar.

If any edition surfaces a non-zero fire count, raise — the audit's verdict
needs revision before declaring closure.
"""

from __future__ import annotations
import sys
from pathlib import Path

sys.path.insert(0, "/sessions/brave-keen-dijkstra/mnt/App/restoration-pipeline")
from _session69_jasher_covenant_singles import collect_fires
import json

APP = Path("/sessions/brave-keen-dijkstra/mnt/App")
TXT_DIR = APP / "source-texts" / "existing-restored-editions"
PARSED_DIR = APP / "source-texts" / "parsed"

EDITIONS = [
    ("apocrypha", "Apocrypha-Restored-Names-Edition.txt"),
    ("enoch",     "Enoch-Restored-Names-Edition.txt"),
    ("jubilees",  "Jubilees-Restored-Names-Edition.txt"),
]


def main() -> int:
    print("=" * 78)
    print("S69 defensive zero-fire passes — apocrypha + enoch + jubilees")
    print("=" * 78)

    grand_total = 0
    for ed_name, txt_filename in EDITIONS:
        json_path = PARSED_DIR / f"{ed_name}.json"
        txt_path = TXT_DIR / txt_filename
        pre_path = txt_path.with_suffix(".txt.pre-s69")

        print(f"\n### {ed_name.upper()}")

        if not json_path.exists():
            print(f"  WARN: {json_path} not found — skipping")
            continue

        j = json.loads(json_path.read_text())
        fires = collect_fires(j)
        per = {}
        for f in fires:
            per[f.label] = per.get(f.label, 0) + 1
        if not fires:
            print(f"  Zero fires — clean. (audit verdict confirmed)")
        else:
            print(f"  {len(fires)} fires found:")
            for name, n in per.items():
                print(f"    {name}: {n}")
            for f in fires:
                print(f"    [{f.label}, {f.surface}, {f.classification}]\n"
                      f"      anchor: {f.anchor!r}")
            print(f"\n  AUDIT REVISION NEEDED — these are real gaps that "
                  f"need wheel treatment.")
            return 1
        grand_total += len(fires)

        # Defensive backup.
        if pre_path.exists():
            existing = pre_path.read_text()
            current = txt_path.read_text()
            if existing == current:
                print(f"  {pre_path.name} already exists and matches current "
                      f"state — accepting existing backup.")
            else:
                print(f"  WARN: {pre_path.name} exists with different content "
                      f"({len(existing):,} vs {len(current):,} bytes). "
                      f"Investigate.")
                return 1
        else:
            pre_path.write_text(txt_path.read_text())
            print(f"  Wrote defensive backup: {pre_path.name} "
                  f"({pre_path.stat().st_size:,} bytes)")

    print()
    print("=" * 78)
    print(f"ALL DEFENSIVE PASSES PASS. Grand total fires: {grand_total} (expected 0)")
    print("=" * 78)
    return 0


if __name__ == "__main__":
    sys.exit(main())
