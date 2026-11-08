"""S463f — read-back after the Apostolic Fathers (Lightfoot) + Acts 29 (Sonnini) sweep. Re-dumps the two editions (same dump the sweep
was built from, _s463f_dump.py), checks every S463f row landed as written (cards: note + address; member notes; summaries + titles;
thread anchors; the two verse-text fixes), re-grades EVERY witness quotation, prose phrase and canon lead quotation in every note
against the live text, and counts what the sweep was meant to remove on the anchored cards of the two editions.
Run:  python3 ~/Desktop/App/_s463f_check.py            (live: re-dumps first)
      python3 _s463f_check.py <dump.json>               (check a given dump, e.g. the scratch post-run dump)"""
import subprocess, sys, json, re, collections, os, tempfile
from pathlib import Path
HERE = Path(__file__).resolve().parent
F = HERE / "source-texts" / "lightfoot-apostolic-fathers" / "s463f-sweep"
if not (F / "regrade.py").exists(): F = HERE          # running inside the sweep folder itself (scratch)
if len(sys.argv) > 1: dump = Path(sys.argv[1]).resolve()
else:
    subprocess.run([sys.executable, str(HERE / "_s463f_dump.py")], check=True); dump = HERE / "source-texts" / "lightfoot-apostolic-fathers" / "s463f-sweep" / "af-cards-live.json"
live = json.load(open(dump)); L = live["live"]
C = {c["id"]: c for c in live["cards"]}; M = {(m["thread_id"], m["xref_id"]): m for m in live["members"]}; T = {t["id"]: t for t in live["threads"]}
cards = {int(k): v for k, v in json.load(open(F / "fix" / "fix_cards.json")).items()}
members = json.load(open(F / "fix" / "fix_members.json")); summaries = json.load(open(F / "fix" / "fix_summaries.json"))
anchors = json.load(open(F / "fix" / "fix_anchors.json")); verses = json.load(open(F / "fix" / "fix_verses.json"))
EDS = {'lightfoot-apostolic-fathers', 'sonnini-acts-29'}
def aaddr(c):
    if c['s_ed'] in EDS: return f"{c['s_ed']}|{c['s_book']}|{c['s_ch']}:{c['s_vn']}"
    if c['t_ed'] in EDS: return f"{c['t_ed']}|{c['t_book']}|{c['t_ch']}:{c['t_vn']}"
landed = 0; bad = []
for i, x in cards.items():
    c = C.get(i)
    if c and c["note"] == x["new_note"] and aaddr(c) == x["new"]: landed += 1
    else: bad.append((i, 'absent' if not c else f"at {aaddr(c)} / note {'same' if c['note']==x['new_note'] else 'differs'}"))
print(f"cards landed as written: {landed}/{len(cards)}", bad[:10])
print(f"  of which moved to the verse their words sit in: {sum(1 for i, x in cards.items() if x['old'] != x['new'] and C.get(i) and aaddr(C[i]) == x['new'])}/{sum(1 for x in cards.values() if x['old'] != x['new'])}")
ml = sum(1 for m in members if M.get((m["thread_id"], m["xref_id"]), {}).get("member_note") == m["new"])
print(f"member notes as written: {ml}/{len(members)}")
sl = sum(1 for s in summaries if T.get(s["thread_id"], {}).get("summary_md") == s["new"] and (T[s["thread_id"]].get("title") or '') == (s["new_title"] or ''))
print(f"summaries (+titles) as written: {sl}/{len(summaries)}")
al = sum(1 for tid, a in anchors.items() if T.get(int(tid)) and f"{T[int(tid)]['a_ed']}|{T[int(tid)]['a_book']}|{T[int(tid)]['a_ch']}:{T[int(tid)]['a_vn']}" == a['new'])
print(f"thread anchors moved: {al}/{len(anchors)}")
vl = sum(1 for a, v in verses.items() if L.get(a) == v['new']); print(f"verse texts fixed: {vl}/{len(verses)}")
tmp = Path(tempfile.mkdtemp()); cwd = os.getcwd(); os.chdir(F)
subprocess.run([sys.executable, str(F / "regrade.py"), str(dump), str(tmp / "regrade.json")], check=True, stdout=subprocess.DEVNULL)
os.chdir(cwd)
R = [o for o in json.load(open(tmp / "regrade.json")) if o["verdict"] != "MENTION_ONLY"]
qv = collections.Counter(g["verdict"] for o in R for g in o.get("quotes", []))
print(f"anchored cards in the 2 editions: {len(R)} | witness italic quotations: {dict(qv)}")
ph = collections.Counter(p["verdict"] for o in R for p in o["phrases"]); print(f"  prose phrase quotes vs live witness verse: {dict(ph)}  (NOT_FOUND/REWORDED should be 0)")
cl = collections.Counter((o["canon_lead"] or {}).get("verdict", "none") for o in R); print(f"  canon lead quotations vs canon.json: {dict(cl)}  (OFF/REWORDED should be 0)")
reb = [i for i, x in cards.items() if x["kind"] == "REBUILD"]
print(f"rebuilt notes carrying the whole live verse verbatim: {sum(1 for i in reb if C.get(i) and L.get(aaddr(C[i]), '') in C[i]['note'])}/{len(reb)}")
print(f"degraded markers left: {sum(1 for o in R if o['degraded'])} | hyphen-chain prose left: {sum(1 for o in R if o['hyphen_chain'])} | slug citations left: {sum(1 for o in R if o['slug_cite'])} | Hebrew book names left: {sum(1 for o in R if o['hebrew_book'])}")
# thread summaries: every witness italic verbatim at its cited verse; Hermas 23/24 old numbering gone
th_bad = 0; oldnum = 0
G = {'__file__': str(F / 'regrade.py'), '__name__': 'regrade_top'}
exec(open(F / 'regrade.py').read().split("# ---- CARDS ----")[0].replace("sys.argv[1]", repr(str(dump))).replace("len(sys.argv) > 1", "True"), G)
for t in live['threads']:
    if t['a_ed'] not in EDS: continue
    s = t['summary_md'] or ''
    for q, a, _, _ in G['extra_quotes'](s):
        if not (a in G['NL'] and G['contains_from'](a, q)): th_bad += 1
    if re.search(r"\bHermas 2[34]:\d+", s): oldnum += 1
print(f"thread summaries anchored here: {sum(1 for t in live['threads'] if t['a_ed'] in EDS)} | witness italics off at their cited verse: {th_bad} | Hermas 23/24 old-numbering cites left: {oldnum}")
pairs = collections.Counter(((c['s_ed'], c['s_book'], c['s_ch'], c['s_vn']), (c['t_ed'], c['t_book'], c['t_ch'], c['t_vn']), c['source']) for c in live["cards"])
print(f"duplicate same-direction pairs: {sum(1 for v in pairs.values() if v > 1)}")
print("anchored per book:", dict(collections.Counter(o["book"].split("|")[1] for o in R)))
print("live verses:", len(L), "| cards touching these editions:", len(live["cards"]), "| member notes:", len(live["members"]), "| threads:", len(live["threads"]))
