#!/usr/bin/env python3
"""
_session53_land_jasher_jubilees.py
----------------------------------
Session 53 restoration-pass wheel — lands ONLY the pure scripture-verse
restorations into parsed/jasher.json and parsed/jubilees.json.

Corpus-structural finding (Session 53): unlike Enoch (whose commentary lives in
a separate chapter.commentary field), Jasher and Jubilees have their commentary
embedded INSIDE the verses[].text field — chapter.commentary is empty for both.
This is open handoff item (d), the commentary parser pass. The pattern: each
chapter's verses[] array holds genuine short scripture verses PLUS a few entries
carrying a large appended commentary blob (and, in Jasher ch.91, cross-reference
apparatus). There is a clean length gap — real scripture verses run ~50-450
chars; commentary-carrying entries run 2,000-180,000 chars.

Yoshi's decision (Session 53): land the pure scripture-verse restorations now;
hold the commentary-embedded ones for the commentary parser pass + a voice gate.
Yoshi's caution, transcribed: "not every time Lord is mentioned is Yahuah" — the
Lord->Yahuah restoration needs case-by-case voice judgment, especially in
commentary (e.g. Jasher 91:18 restores Psalm 110:1's "David's Lord"). The held
set is exactly where those judgment calls live; the landed set below was verified
to contain ZERO Lord-restorations (only Israel/Judah/sons-of-men/Melchizedek).

A verse is treated as "pure scripture text" (and restored) iff:
    len(text) <= 600  AND  "« • • •" not in text
Everything else is left untouched for the commentary wheel.

Run modes:
    python3 _session53_land_jasher_jubilees.py            # dry-run, report only
    python3 _session53_land_jasher_jubilees.py --write    # apply + write
"""
from __future__ import annotations
import json, sys
from pathlib import Path

APP = Path("/sessions/epic-dazzling-noether/mnt/Desktop/App")
PIPELINE = APP / "restoration-pipeline"
sys.path.insert(0, str(PIPELINE))
from restore import Restorer  # noqa: E402

WRITE = "--write" in sys.argv
COMMENTARY_MARKER = "« • • •"  # « • • •
LEN_THRESHOLD = 600

def is_pure_scripture(text: str) -> bool:
    return len(text) <= LEN_THRESHOLD and COMMENTARY_MARKER not in text

def land(edition_id: str, mode: str = "default"):
    path = APP / "source-texts" / "parsed" / f"{edition_id}.json"
    raw = path.read_text(encoding="utf-8")
    data = json.loads(raw)

    # serialization control
    control = json.dumps(data, ensure_ascii=False, indent=2)
    ok = (control + "\n" == raw) if raw.endswith("\n") else (control == raw)
    print(f"[{edition_id}] serialization round-trips byte-identical: {ok}")
    if not ok:
        print(f"[{edition_id}] ABORT — serialization mismatch."); return None

    r = Restorer(mode=mode)
    changed = 0
    held_would_change = 0
    lord_in_landed = []
    for bk in data["books"]:
        for ch in bk["chapters"]:
            for v in ch["verses"]:
                old = v.get("text", "")
                if not old:
                    continue
                if is_pure_scripture(old):
                    new = r.restore_text(old)
                    if new != old:
                        changed += 1
                        # safety: flag any Lord-derived restoration in the landed set
                        if "Yahuah (God)" in new and "Yahuah (God)" not in old:
                            import re
                            if re.search(r"\bLord\b", old) or re.search(r"\bLORD\b", old):
                                lord_in_landed.append(f"{ch['number']}:{v['number']}")
                        v["text"] = new
                else:
                    # held back — count whether it WOULD have changed
                    if r.restore_text(old) != old:
                        held_would_change += 1

    print(f"[{edition_id}] pure scripture verses restored (LANDED): {changed}")
    print(f"[{edition_id}] commentary-embedded verses that would change (HELD): {held_would_change}")
    print(f"[{edition_id}] Lord-derived restorations inside the landed set: "
          f"{len(lord_in_landed)} {lord_in_landed if lord_in_landed else ''}")

    if WRITE:
        out = json.dumps(data, ensure_ascii=False, indent=2)
        if raw.endswith("\n"):
            out += "\n"
        path.write_text(out, encoding="utf-8")
        print(f"[{edition_id}] WROTE {path}")
    else:
        print(f"[{edition_id}] (dry-run)")
    return changed, held_would_change

for ed in ("jasher", "jubilees"):
    land(ed)
    print()
if not WRITE:
    print("pass --write to apply")
