"""S463a — live read-back after the 1 Enoch close-out. Re-dumps every live card touching 1 Enoch (same file the S457/S459/S460
passes used), re-grades every Enoch quote (S459 regrade), and checks every S463a card and member note landed as written.
Run:  python3 ~/Desktop/App/_s463a_check.py
"""
import subprocess, sys, json, re, collections
from pathlib import Path
HERE = Path(__file__).resolve().parent
subprocess.run([sys.executable, str(HERE / "_s457_enoch_dump.py")], check=True)
EN = HERE / "source-texts" / "enoch-charles-1917"
subprocess.run([sys.executable, "regrade.py"], cwd=EN / "s459-card-fix", check=True)
o = json.load(open(EN / "s459-card-fix" / "regrade.json"))
print("S463a read-back — cards touching 1 Enoch by quote verdict:", dict(collections.Counter(x["verdict"] for x in o)))
flagged = [x for x in o if x["verdict"] not in ("STAND", "NO_ENOCH_QUOTE")]
print("flagged (should be 0):", len(flagged))
for x in flagged[:20]: print("  ", x["id"], x["verdict"], x["src"], "->", x["tgt"], "quote:", x["quote"][:80])
live = json.load(open(EN / "enoch-cards-live.json"))
C = {c["id"]: c for c in live["cards"]}
F = EN / "s463a-closeout"
A = json.load(open(F / "fix463a.json")); G = json.load(open(F / "fix463a_gloss.json"))
landed = total = 0; bad = []
for x in A["cards"]:
    total += 1; c = C.get(x["id"])
    if c and c["note"] == x["new_note"] and f"{c['t_ch']}:{c['t_vn']}" == x["addr"]: landed += 1
    else: bad.append(x["id"])
for x in G["cards"]:
    if x["kind"] == "retire": continue
    total += 1; c = C.get(x["id"])
    addr = (f"{c['s_ch']}:{c['s_vn']}" if x["side"] == "S" else f"{c['t_ch']}:{c['t_vn']}") if c else None
    if c and c["note"] == x["new_note"] and addr == x["new_addr"]: landed += 1
    else: bad.append(x["id"])
print(f"landed as written: {landed}/{total}", ("NOT landed: " + str(bad[:30])) if bad else "")
ret = [x["id"] for x in G["cards"] if x["kind"] == "retire"]
print("retired cards still present:", [i for i in ret if i in C])
mem = {(m["thread_id"], m["xref_id"]): m["member_note"] for m in live["members"]}
mb = [(m["thread_id"], m["xref"]) for m in A["members"] + G["members"] if mem.get((m["thread_id"], m["xref"])) != m["new"]]
print("member notes not as written:", len(mb), mb[:10])
DEG = re.compile(r"wisdom-stream|the framework reads|the framework's|Red Line|apparatus|FRAMEWORK|\bS1\d\d\b|voice skill|Yoshi", re.I)
deg = [c["id"] for c in live["cards"] if DEG.search(c["note"] or "")]
print("degraded markers left on Enoch cards:", len(deg), deg[:20])
