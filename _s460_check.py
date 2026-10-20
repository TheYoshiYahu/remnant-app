"""S460 — live read-back after the 1 Enoch thread-summary fix. Re-dumps every live card/thread touching 1 Enoch
(_s457_enoch_dump.py → enoch-cards-live.json) and re-grades every Enoch quote in every thread summary by the words.
Expect: "REWRITE 0, RE_QUOTE 0, bad quotes 0".   Run:  python3 ~/Desktop/App/_s460_check.py
"""
import subprocess, sys, json, collections
from pathlib import Path
HERE = Path(__file__).resolve().parent
subprocess.run([sys.executable, str(HERE / "_s457_enoch_dump.py")], check=True)
E = HERE / "source-texts" / "enoch-charles-1917"; FIX = E / "s460-summary-fix"
subprocess.run([sys.executable, str(FIX / "regrade_summaries.py"), str(E), str(FIX / "readback")], check=True)
o = json.load(open(FIX / "readback" / "summary-regrade.json"))
c = collections.Counter(x["verdict"] for x in o)
bad = sum(1 for x in o for v in x["quote_verdicts"] if v not in ("STAND", "SHORT"))
print("S460 read-back — thread summaries citing 1 Enoch:", dict(c))
print(f"REWRITE {c.get('REWRITE',0)}, RE_QUOTE {c.get('RE_QUOTE',0)}, bad quotes {bad}  (all three should be 0)")
for x in [x for x in o if x["verdict"] in ("REWRITE", "RE_QUOTE")][:20]: print("  ", x["id"], x["slug"], x["verdict"], x["reasons"])
fix = json.load(open(FIX / "fix_summaries.json")); live = {x["id"]: x for x in o}
landed = sum(1 for i, x in fix.items() if live.get(int(i), {}).get("summary_md") == x["summary_md"])
print(f"fixed summaries now live as written: {landed}/{len(fix)}")
