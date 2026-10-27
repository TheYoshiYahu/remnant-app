"""S478 — read-back after the Charles adam-eve + 4 Maccabees sweep. Re-dumps the four pseudepigrapha editions (same dump the sweep was
built from), checks every S478 row landed as written, re-grades EVERY own-book quotation, prose phrase and canon lead quotation in
every note against the live text, re-checks the old-numbering citations (stale_cites.py), and counts what the sweep was meant to
remove on the anchored cards of the two books.
Run:  python3 ~/Desktop/App/_s478_check.py            (live: re-dumps first)
      python3 _s478_check.py <dump.json>               (check a given dump, e.g. the scratch post-run dump)"""
import subprocess, sys, json, re, collections, os, tempfile
from pathlib import Path
HERE = Path(__file__).resolve().parent
PS = HERE / "source-texts" / "pseudepigrapha-charles-vol2"; F = PS / "s478-sweep"
if len(sys.argv) > 1: dump = Path(sys.argv[1]).resolve()
else:
    subprocess.run([sys.executable, str(HERE / "_s463e_pseud_dump.py")], check=True); dump = PS / "pseud-cards-live.json"
live = json.load(open(dump)); L = live["live"]
C = {c["id"]: c for c in live["cards"]}; M = {(m["thread_id"], m["xref_id"]): m for m in live["members"]}; T = {t["id"]: t for t in live["threads"]}
cards = {int(k): v for k, v in json.load(open(F / "fix" / "fix_cards.json")).items()}
members = json.load(open(F / "fix" / "fix_members.json")); summaries = json.load(open(F / "fix" / "fix_summaries.json"))
BOOKS = ('adam-eve', '4-maccabees')
def aaddr(c):
    if c['s_ed'] == 'pseudepigrapha' and c['s_book'] in BOOKS: return f"pseudepigrapha|{c['s_book']}|{c['s_ch']}:{c['s_vn']}"
    if c['t_ed'] == 'pseudepigrapha' and c['t_book'] in BOOKS: return f"pseudepigrapha|{c['t_book']}|{c['t_ch']}:{c['t_vn']}"
landed = 0; bad = []
for i, x in cards.items():
    c = C.get(i)
    if c and c["note"] == x["new_note"] and aaddr(c) == x["new"]: landed += 1
    else: bad.append((i, 'absent' if not c else f"at {aaddr(c)} / note {'same' if c['note']==x['new_note'] else 'differs'}"))
print(f"cards landed as written: {landed}/{len(cards)}", bad[:10])
ml = sum(1 for m in members if M.get((m["thread_id"], m["xref_id"]), {}).get("member_note") == m["new"])
print(f"member notes as written: {ml}/{len(members)}")
sl = sum(1 for s in summaries if T.get(s["thread_id"], {}).get("summary_md") == s["new"]); print(f"summaries as written: {sl}/{len(summaries)}")
tmp = Path(tempfile.mkdtemp()); cwd = os.getcwd(); os.chdir(F)
subprocess.run([sys.executable, str(F / "regrade.py"), str(dump), str(tmp / "regrade.json")], check=True, stdout=subprocess.DEVNULL)
src = open(F / "stale_cites.py").read().replace("HERE/'in'/'pseud-cards-live.json'", repr(str(dump))).replace("HERE/'stale_cites.json'", repr(str(tmp / "stale.json")))
import io, contextlib
with contextlib.redirect_stdout(io.StringIO()): exec(compile(src, "stale_cites", "exec"), {"__file__": str(F / "stale_cites.py")})
os.chdir(cwd)
R = [o for o in json.load(open(tmp / "regrade.json")) if o["verdict"] != "MENTION_ONLY" and o["book"].split("|")[1] in BOOKS]
qv = collections.Counter(g["verdict"] for o in R for g in o.get("quotes", []))
print(f"anchored cards in the 2 swept books: {len(R)} | own-book italic quotations: {dict(qv)}  (63499 'the swine *is unclean…*' is Deuteronomy, a known false positive)")
ph = collections.Counter(p["verdict"] for o in R for p in o["phrases"]); print(f"  prose phrase quotes vs live verse: {dict(ph)}")
cl = collections.Counter((o["canon_lead"] or {}).get("verdict", "none") for o in R); print(f"  canon lead quotations vs canon.json: {dict(cl)}  (OFF/REWORDED should be 0)")
reb = [i for i, x in cards.items() if x["kind"].startswith("PROSE")]
print(f"rebuilt notes carrying the whole live verse verbatim: {sum(1 for i in reb if C.get(i) and L.get(aaddr(C[i]), '') in C[i]['note'])}/{len(reb)}")
print(f"degraded markers left: {sum(1 for o in R if o['degraded'])} | hyphen-chain prose left: {sum(1 for o in R if o['hyphen_chain'])} | slug citations left: {sum(1 for o in R if o['slug_cite'])} | Hebrew book names left: {sum(1 for o in R if o['hebrew_book'])}")
ST = json.load(open(tmp / "stale.json"))
stale = [x for x in ST if x["verdict"] in ("IMPOSSIBLE", "OWN_OLD", "CONTENT_OFF")]
print(f"old-numbering citations left in prose (cards/members/summaries): {len(stale)}", [(x['kind'], x['id'], x['cite']) for x in stale[:8]])
pairs = collections.Counter(((c['s_ed'], c['s_book'], c['s_ch'], c['s_vn']), (c['t_ed'], c['t_book'], c['t_ch'], c['t_vn']), c['source']) for c in live["cards"])
print(f"duplicate same-direction pairs: {sum(1 for v in pairs.values() if v > 1)}")
print("anchored per swept book:", dict(collections.Counter(o["book"].split("|")[1] for o in R)))
print("live verses:", len(L), "| cards touching these editions:", len(live["cards"]), "| member notes:", len(live["members"]), "| threads:", len(live["threads"]))
