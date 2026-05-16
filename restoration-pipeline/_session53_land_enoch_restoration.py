#!/usr/bin/env python3
"""
_session53_land_enoch_restoration.py
------------------------------------
Session 53 restoration-pass wheel — lands the validated restore.py sweep into
parsed/enoch.json verse text.

Background: parse_published_editions.py parsed Enoch-Restored-Names-Edition.txt
straight into parsed/enoch.json without ever invoking restore.py. The Phase-3
validation run (INTENTIONAL_VARIANCES.md / validation-reports/enoch-verse-diff.md)
diffed what restore.py would produce against that raw parse and found 64/1367
verses divergent — all "pipeline-correct, published-edition gap" — but the
pipeline output was validated, not landed.

This script runs restore.py (default mode, the same mode validate_verse_diff.py
uses for enoch) over every verse-text string in books[].chapters[].verses[].text
and writes the result back. The commentary field and front_matter are NOT
touched — those are out of scope for this wheel (commentary belongs to the Q39
wheel, sequenced after this one).

The (Lord) -> (God) parenthetical reconciliation (Yoshi's Session 52 decision 2)
is already baked into restore.py's Lord_mixed rule as of this session, so the
output here carries Yahuah (God), not Yahuah (Lord).

Run modes:
    python3 _session53_land_enoch_restoration.py            # dry-run, report only
    python3 _session53_land_enoch_restoration.py --write    # apply + write
"""
from __future__ import annotations
import json, sys
from pathlib import Path

APP = Path("/sessions/epic-dazzling-noether/mnt/Desktop/App")
PIPELINE = APP / "restoration-pipeline"
ENOCH = APP / "source-texts" / "parsed" / "enoch.json"

sys.path.insert(0, str(PIPELINE))
from restore import Restorer  # noqa: E402

WRITE = "--write" in sys.argv

raw_original = ENOCH.read_text(encoding="utf-8")
data = json.loads(raw_original)

# --- control: confirm our serialization round-trips byte-identical -----------
control = json.dumps(data, ensure_ascii=False, indent=2)
if not raw_original.endswith("\n"):
    control_match = (control == raw_original)
else:
    control_match = (control + "\n" == raw_original)
print(f"serialization control round-trips byte-identical: {control_match}")
if not control_match:
    # show first divergence
    a, b = raw_original, (control + "\n" if raw_original.endswith("\n") else control)
    for i, (ca, cb) in enumerate(zip(a, b)):
        if ca != cb:
            print(f"  first diff at char {i}: orig={ca!r} vs ours={cb!r}")
            print(f"  context orig: ...{a[max(0,i-40):i+40]!r}...")
            print(f"  context ours: ...{b[max(0,i-40):i+40]!r}...")
            break
    print("  ABORT: would not write — serialization settings do not match.")
    sys.exit(1)

# --- run restore.py over every verse-text -----------------------------------
r = Restorer(mode="default")
changes = []
for bk in data["books"]:
    for ch in bk["chapters"]:
        for v in ch["verses"]:
            old = v.get("text", "")
            if not old:
                continue
            new = r.restore_text(old)
            if new != old:
                changes.append((bk["book_title"], ch["number"], v["number"], old, new))
                v["text"] = new

print(f"verses changed: {len(changes)}")
kinds = {}
for _, _, _, old, new in changes:
    if "Son of Adam" in new and "Son of Adam" not in old: k = "Son of Adam"
    elif "son of Adam" in new and "son of Adam" not in old: k = "son of Adam"
    elif "sons of Adam" in new and "sons of Adam" not in old: k = "sons of Adam"
    elif "Yashar'el (Israel)" in new and "Yashar'el (Israel)" not in old: k = "Israel"
    elif "Yahuah (God)" in new: k = "Lord -> Yahuah (God)"
    else: k = "other"
    kinds[k] = kinds.get(k, 0) + 1
for k, c in sorted(kinds.items(), key=lambda kv: -kv[1]):
    print(f"  {k}: {c}")

print("\n--- per-verse changes ---")
for book, chn, vn, old, new in changes:
    print(f"\n{book} {chn}:{vn}")
    print(f"  OLD: {old}")
    print(f"  NEW: {new}")

if WRITE:
    out = json.dumps(data, ensure_ascii=False, indent=2)
    if raw_original.endswith("\n"):
        out += "\n"
    ENOCH.write_text(out, encoding="utf-8")
    print(f"\nWROTE {ENOCH}")
else:
    print("\n(dry-run — pass --write to apply)")
