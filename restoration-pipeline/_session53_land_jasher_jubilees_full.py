#!/usr/bin/env python3
"""
_session53_land_jasher_jubilees_full.py
---------------------------------------
Session 53 follow-on — lands the HELD commentary-embedded restorations into
parsed/jasher.json and parsed/jubilees.json.

Earlier this session the pure scripture-verse restorations (562 Jasher + 3
Jubilees) were landed; the commentary-embedded restorations (106 Jasher + 7
Jubilees) were held. Yoshi's decision: land all of it now with the current
(flat) construct. This is fully reversible — restore.py is deterministic and
every original is in git at HEAD — so the Lord/God cases (e.g. Jasher 91:18's
Psalm 110:1 "David's Lord") will be re-run when the fuller Sacred Names
construct is built and restore.py is reworked.

Mechanism: run restore.py (default mode) over EVERY verses[].text string in
each file. The 562/3 verses already restored are idempotent under restore.py,
so this pass only changes the previously-held 106/7. chapter.commentary stays
empty (Jasher/Jubilees keep their commentary inside the verse-text field —
the commentary parser pass, item d, is still needed to separate it; restoring
in place does not block that).

Run modes:
    python3 _session53_land_jasher_jubilees_full.py            # dry-run
    python3 _session53_land_jasher_jubilees_full.py --write    # apply
"""
from __future__ import annotations
import json, sys
from pathlib import Path

APP = Path("/sessions/epic-dazzling-noether/mnt/Desktop/App")
sys.path.insert(0, str(APP / "restoration-pipeline"))
from restore import Restorer  # noqa: E402

WRITE = "--write" in sys.argv
r = Restorer(mode="default")

for ed in ("jasher", "jubilees"):
    path = APP / "source-texts" / "parsed" / f"{ed}.json"
    raw = path.read_text(encoding="utf-8")
    data = json.loads(raw)

    control = json.dumps(data, ensure_ascii=False, indent=2)
    ok = (control + "\n" == raw) if raw.endswith("\n") else (control == raw)
    print(f"[{ed}] serialization round-trips byte-identical: {ok}")
    if not ok:
        print(f"[{ed}] ABORT — serialization mismatch."); continue

    changed = 0
    for bk in data["books"]:
        for ch in bk["chapters"]:
            for v in ch["verses"]:
                old = v.get("text", "")
                if not old:
                    continue
                new = r.restore_text(old)
                if new != old:
                    changed += 1
                    v["text"] = new
    print(f"[{ed}] verses changed this pass (the previously-held set): {changed}")

    if WRITE:
        out = json.dumps(data, ensure_ascii=False, indent=2)
        if raw.endswith("\n"):
            out += "\n"
        path.write_text(out, encoding="utf-8")
        print(f"[{ed}] WROTE {path}")
    else:
        print(f"[{ed}] (dry-run)")
    print()

if not WRITE:
    print("pass --write to apply")
