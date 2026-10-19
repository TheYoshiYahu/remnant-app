"""S459 — live read-back after the 1 Enoch card fix. Dumps every live card touching 1 Enoch (same as _s457_enoch_dump.py,
same output file) and re-grades the words each note quotes against the live text. Expect: 0 flagged.
Run:  python3 ~/Desktop/App/_s459_check.py
"""
import subprocess, sys, json, collections
from pathlib import Path
HERE = Path(__file__).resolve().parent
subprocess.run([sys.executable, str(HERE / "_s457_enoch_dump.py")], check=True)
FIX = HERE / "source-texts" / "enoch-charles-1917" / "s459-card-fix"
subprocess.run([sys.executable, "regrade.py"], cwd=FIX, check=True)
o = json.load(open(FIX / "regrade.json"))
c = collections.Counter(x["verdict"] for x in o)
print("S459 read-back — cards touching 1 Enoch by quote verdict:", dict(c))
flagged = [x for x in o if x["verdict"] not in ("STAND", "NO_ENOCH_QUOTE")]
print("flagged (should be 0):", len(flagged))
for x in flagged[:20]: print("  ", x["id"], x["verdict"], x["src"], "->", x["tgt"], "quote:", x["quote"][:80])
fix = json.load(open(FIX / "fix.json"))
live = {x["id"]: x for x in o}
moved = [x for x in fix["cards"] if x["action"] == "update" and x["old_addr"] != x["new_addr"]]
landed = sum(1 for x in moved if live.get(x["id"], {}).get("addr") == x["new_addr"])
print(f"moved cards now at their new address: {landed}/{len(moved)}")
print("retired cards still present:", [i for i in (4396, 4853) if i in live])
