"""S477 — live read-back after the adam-eve (784) / 4-maccabees (789) text lane. Re-dumps every live verse, card, member note and
thread touching the pseudepigrapha editions (the S463e dump), then checks: every merged verse landed with the merged text (verse by
verse, text compared, numbers shown on failure); every one of the 533 cards sits at the new address in s477_cards_map.json; every one
of the 112 thread anchors sits at its new range; no duplicate same-direction pairs; the cards' own-book italic quotations still sit
inside their verse; counts. Prints the proof (apply_migration.py hides the migration's NOTICEs).
Run:  python3 ~/Desktop/App/_s477_check.py            (live: re-dumps first)
      python3 _s477_check.py <dump.json>               (check a given dump)
"""
import subprocess, sys, json, re, collections
from pathlib import Path
HERE = Path(__file__).resolve().parent
PS = HERE / "source-texts" / "pseudepigrapha-charles-vol2"; F = PS / "s477-text-lane"
if len(sys.argv) > 1: dump = Path(sys.argv[1]).resolve()
else:
    subprocess.run([sys.executable, str(HERE / "_s463e_pseud_dump.py")], check=True); dump = PS / "pseud-cards-live.json"
live = json.load(open(dump)); L = live["live"]
M = json.load(open(F / "s477_map.json")); CM = json.load(open(F / "s477_cards_map.json"))
C = {c["id"]: c for c in live["cards"]}; T = {t["id"]: t for t in live["threads"]}
ok_total = 0
for bk in ("adam-eve", "4-maccabees"):
    want = M[bk]["new_verses"]; have = {k.split("|")[2]: v for k, v in L.items() if k.startswith(f"pseudepigrapha|{bk}|")}
    ok = [w for w in want if have.get(f"{w['ch']}:{w['vn']}") == w["text"]]
    bad = [w for w in want if have.get(f"{w['ch']}:{w['vn']}") != w["text"]]
    extra = [k for k in have if k not in {f"{w['ch']}:{w['vn']}" for w in want}]
    print(f"{bk}: live verses {len(have)} (expected {len(want)}); verses landed with the merged text {len(ok)}/{len(want)}; extra live verses {len(extra)} {extra[:5]}")
    for w in bad[:10]:
        key = f"{w['ch']}:{w['vn']}"; print(f"   NOT LANDED {bk} {key}: live={str(have.get(key))[:80]!r}")
    ok_total += len(ok)
def addr(c, side):
    return (c["s_ed"], c["s_book"], f"{c['s_ch']}:{c['s_vn']}") if side == "S" else (c["t_ed"], c["t_book"], f"{c['t_ch']}:{c['t_vn']}")
landed = 0; off = []
for r in CM["cards"]:
    c = C.get(r["xid"])
    if c and addr(c, r["side"]) == ("pseudepigrapha", r["book"], r["new"]): landed += 1
    else: off.append((r["xid"], None if not c else addr(c, r["side"]), r["book"], r["new"]))
print(f"cards at their new address: {landed}/{len(CM['cards'])}", off[:10])
al = 0; aoff = []
for a in CM["anchors"]:
    t = T.get(a["thread_id"])
    if t and t["a_ed"] == "pseudepigrapha" and t["a_book"] == a["book"] and f"{t['a_ch']}:{t['a_vn']}" == a["new_start"] and (a["new_end"] is None or f"{t['z_ch']}:{t['z_vn']}" == a["new_end"]): al += 1
    else: aoff.append(a["thread_id"])
print(f"thread anchors at their new range: {al}/{len(CM['anchors'])}", aoff[:10])
def norm(s): return re.sub(r"\s+", " ", s.replace("-", "").replace("’", "'").replace("‘", "'")).strip().lower()
qin = 0; qout = []
for r in CM["cards"]:
    c = C.get(r["xid"]); 
    if not c: continue
    v = L.get(f"pseudepigrapha|{r['book']}|{r['new']}", "")
    for q in re.findall(r"\*([^*]+)\*", c["note"]):
        nq = norm(q)
        if len(nq) < 12: continue
        if any(nq in norm(x) for k, x in L.items() if k.startswith(f"pseudepigrapha|{r['book']}|")):
            if nq in norm(v): qin += 1
            else: qout.append((r["xid"], q[:50]))
print(f"own-book italic quotations sitting in the card's verse: {qin}; sitting in another verse of the book (pre-existing, for the sweep): {len(qout)} {qout[:6]}")
pairs = collections.Counter(((c['s_ed'], c['s_book'], c['s_ch'], c['s_vn']), (c['t_ed'], c['t_book'], c['t_ch'], c['t_vn'])) for c in live["cards"])
print(f"duplicate same-direction pairs: {sum(1 for v in pairs.values() if v > 1)}")
mem = sum(1 for m in live["members"] if m["xref_id"] in {r["xid"] for r in CM["cards"]})
print(f"member notes on the 533 cards: {mem}/533")
print("live verses:", len(L), "| cards touching these editions:", len(live["cards"]), "| member notes:", len(live["members"]), "| threads:", len(live["threads"]))
