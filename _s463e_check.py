"""S463e — read-back after the pseudepigrapha sweep. Re-dumps every live card / member note / thread summary touching the four editions
(same dump the sweep was built from), checks every S463e row landed as written, re-grades EVERY extra-book quotation and every canon
quotation in every note against the live text, and counts what the sweep was meant to remove (degraded markers, hyphen-chains, slug
citations, stale Testaments numbering) on the anchored cards of the eight swept books.
Run:  python3 ~/Desktop/App/_s463e_check.py            (live: re-dumps first)
      python3 _s463e_check.py <dump.json>               (check a given dump, e.g. the scratch post-run dump)
"""
import subprocess, sys, json, re, collections
from pathlib import Path
HERE = Path(__file__).resolve().parent
PS = HERE / "source-texts" / "pseudepigrapha-charles-vol2"
F = PS / "s463e-sweep"
if len(sys.argv) > 1:
    dump = Path(sys.argv[1]).resolve()
else:
    subprocess.run([sys.executable, str(HERE / "_s463e_pseud_dump.py")], check=True)
    dump = PS / "pseud-cards-live.json"
live = json.load(open(dump)); L = live["live"]
C = {c["id"]: c for c in live["cards"]}
M = {(m["thread_id"], m["xref_id"]): m for m in live["members"]}
T = {t["id"]: t for t in live["threads"]}
cards = {int(k): v for k, v in json.load(open(F / "fix" / "fix_cards.json")).items()}
members = json.load(open(F / "fix" / "fix_members.json")); summaries = json.load(open(F / "fix" / "fix_summaries.json"))
EDS = {'pseudepigrapha', 'adam-eve-conflict', 'apocalypse-of-abraham', 'ascension-isaiah'}
def aaddr(c):
    if c['s_ed'] in EDS: return f"{c['s_ed']}|{c['s_book']}|{c['s_ch']}:{c['s_vn']}"
    if c['t_ed'] in EDS: return f"{c['t_ed']}|{c['t_book']}|{c['t_ch']}:{c['t_vn']}"
    return None
landed = 0; bad = []
for i, x in cards.items():
    c = C.get(i)
    if c and c["note"] == x["new_note"] and aaddr(c) == x["new"]: landed += 1
    else: bad.append((i, 'absent' if not c else f"at {aaddr(c)} / note {'same' if c['note']==x['new_note'] else 'differs'}"))
print(f"cards landed as written: {landed}/{len(cards)}", bad[:10])
ml = 0; mb = []
for m in members:
    r = M.get((m["thread_id"], m["xref_id"]))
    if r and r["member_note"] == m["new"]: ml += 1
    else: mb.append((m["thread_id"], m["xref_id"]))
print(f"member notes as written: {ml}/{len(members)}", mb[:10])
sl = sum(1 for s in summaries if T.get(s["thread_id"], {}).get("summary_md") == s["new"])
print(f"summaries as written: {sl}/{len(summaries)}")
# re-grade everything with the sweep's own grader against THIS dump
import tempfile, os
tmp = Path(tempfile.mkdtemp())
cwd = os.getcwd(); os.chdir(F)
subprocess.run([sys.executable, str(F / "regrade.py"), str(dump), str(tmp / "regrade.json")], check=True, stdout=subprocess.DEVNULL)
os.chdir(cwd)
R = [o for o in json.load(open(tmp / "regrade.json")) if o["verdict"] != "MENTION_ONLY" and not o["held"]]
qv = collections.Counter(g["verdict"] for o in R for g in o.get("quotes", []))
print(f"anchored cards in the 8 swept books: {len(R)} | extra-book italic quotations: {dict(qv)}")
print(f"  not verbatim at cited verse: {sum(v for k, v in qv.items() if k != 'STAND')}")
ph = collections.Counter(p["verdict"] for o in R for p in o["phrases"])
print(f"  prose phrase quotes vs live verse: {dict(ph)}")
cl = collections.Counter((o["canon_lead"] or {}).get("verdict", "none") for o in R)
print(f"  canon lead quotations vs canon.json: {dict(cl)}  (OFF/REWORDED should be 0)")
reb = [i for i, x in cards.items() if x["kind"].startswith("PROSE")]
print(f"rebuilt notes carrying the whole live verse verbatim: {sum(1 for i in reb if C.get(i) and L.get(aaddr(C[i]), '') in C[i]['note'])}/{len(reb)}")
print(f"degraded markers left on anchored cards: {sum(1 for o in R if o['degraded'])} | hyphen-chain prose left: {sum(1 for o in R if o['hyphen_chain'])} | slug citations left: {sum(1 for o in R if o['slug_cite'])} | Hebrew book names left: {sum(1 for o in R if o['hebrew_book'])} | stale Testaments cites left: {sum(1 for o in R if o['t_range_bad'])}")
pairs = collections.Counter((c["source_verse_id"] if "source_verse_id" in c else (c['s_ed'], c['s_book'], c['s_ch'], c['s_vn']), (c['t_ed'], c['t_book'], c['t_ch'], c['t_vn'])) for c in live["cards"])
print(f"duplicate same-direction pairs: {sum(1 for v in pairs.values() if v > 1)}")
per = collections.Counter(o["book"].split("|")[1] for o in R)
print("anchored per swept book:", dict(per))
print("live verses:", len(live["live"]), "| cards touching these editions:", len(live["cards"]), "| member notes:", len(live["members"]), "| threads:", len(live["threads"]))
