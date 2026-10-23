"""S463b — read-back after the Jubilees sweep. Re-dumps every live card / member note / thread summary touching Jubilees
(same dump the sweep was built from), re-grades every Jubilees quote, and checks every S463b row landed as written.
Run:  python3 ~/Desktop/App/_s463b_check.py            (live: re-dumps first)
      python3 _s463b_check.py <dump.json>               (check a given dump, e.g. the scratch post-run dump)
"""
import subprocess, sys, json, re, collections, unicodedata
from pathlib import Path
HERE = Path(__file__).resolve().parent
JUB = HERE / "source-texts" / "jubilees-charles-1917"
F = JUB / "s463b-sweep"
if len(sys.argv) > 1:
    dump = Path(sys.argv[1])
else:
    subprocess.run([sys.executable, str(HERE / "_s463b_jub_dump.py")], check=True)
    dump = JUB / "jubilees-cards-live.json"
live = json.load(open(dump)); L = live["jubilees_live"]
C = {c["id"]: c for c in live["cards"]}
M = {(m["thread_id"], m["xref_id"]): m for m in live["members"]}
T = {t["id"]: t for t in live["threads"]}
cards = {int(k): v for k, v in json.load(open(F / "fix_cards.json")).items()}
members = json.load(open(F / "fix_members.json")); summaries = json.load(open(F / "fix_summaries.json"))

def norm(s):
    s = unicodedata.normalize('NFKD', s or ''); s = ''.join(ch for ch in s if not unicodedata.combining(ch))
    s = re.sub(r"\([^)]*\)", " ", s); s = re.sub(r"[\[\]‘’'“”\"]", "", s).lower(); s = re.sub(r"[^a-z0-9 ]+", " ", s); return re.sub(r"\s+", " ", s).strip()
NL = {a: norm(t) for a, t in L.items()}; keys = list(NL)
def jaddr(c): return f"{c['t_ch']}:{c['t_vn']}" if c['t_ed'] == 'jubilees' else (f"{c['s_ch']}:{c['s_vn']}" if c['s_ed'] == 'jubilees' else None)

landed = 0; bad = []
for i, x in cards.items():
    c = C.get(i)
    if c and c["note"] == x["new_note"] and jaddr(c) == x["new"]: landed += 1
    else: bad.append((i, 'absent' if not c else f"at {jaddr(c)} / note {'same' if c['note']==x['new_note'] else 'differs'}"))
print(f"cards landed as written: {landed}/{len(cards)}", bad[:10])
ml = 0; mb = []
for m in members:
    r = M.get((m["thread_id"], m["xref_id"]))
    if r and r["member_note"] == m["new"]: ml += 1
    else: mb.append((m["thread_id"], m["xref_id"]))
print(f"member notes as written: {ml}/{len(members)}", mb[:10])
sl = sum(1 for s in summaries if T.get(s["thread_id"], {}).get("summary_md") == s["new"])
print(f"summaries as written: {sl}/{len(summaries)}")

# every Jubilees quotation in every card note / member note / summary must be verbatim at its cited verse (3-verse span allowed)
LAB = re.compile(r"Jubilees (\d+):(\d+)\s*[—–-]\s*\*([^*]+)\*"); CIT = re.compile(r"\*([^*]+)\*\s*\((?:Jubilees )(\d+):(\d+)(?:[–-](\d+))?\)")
def ok_at(q, a, n=3):
    if a not in keys: return False
    i = keys.index(a); span = ' '.join(NL[k] for k in keys[i:i+n])
    return all(p in span for p in [norm(p) for p in re.split(r"\.\.\.|…", q) if norm(p)])
qbad = collections.Counter(); qn = 0
for c in live["cards"]:
    for m in list(LAB.finditer(c["note"] or '')) + [(None, None, None)]:
        pass
    for g in LAB.finditer(c["note"] or ''):
        qn += 1
        if not ok_at(g.group(3), f"{g.group(1)}:{g.group(2)}"): qbad['card labelled'] += 1
    for g in CIT.finditer((c["note"] or '').replace('**', '')):
        qn += 1
        if not ok_at(g.group(1), f"{g.group(2)}:{g.group(3)}", 1 + (int(g.group(4)) - int(g.group(3)) if g.group(4) else 0)): qbad['card cited'] += 1
for m in live["members"]:
    for g in LAB.finditer(m["member_note"] or ''):
        qn += 1
        if not ok_at(g.group(3), f"{g.group(1)}:{g.group(2)}"): qbad['member'] += 1
for t in live["threads"]:
    if t.get("a_ed") != 'jubilees': continue
    for g in CIT.finditer((t["summary_md"] or '').replace('**', '')):
        qn += 1
        if not ok_at(g.group(1), f"{g.group(2)}:{g.group(3)}", 6): qbad['summary'] += 1
print(f"Jubilees quotations checked: {qn}; not verbatim at cited verse: {dict(qbad) or 0}")

DEG = re.compile(r"wisdom-stream|the framework reads|Red Line #|\bapparatus\b|FRAMEWORK-MAJOR|\blocked\b|\bS\d{3}\b|Yoshi", re.I)
deg = [c["id"] for c in live["cards"] if jaddr(c) and DEG.search(re.sub(r"\*[^*]+\*", "", c["note"] or ''))]
print(f"degraded markers left on Jubilees-anchored cards: {len(deg)}", deg[:20])
# duplicate same-direction pairs
pairs = collections.Counter((c['s_ed'], c['s_book'], c['s_ch'], c['s_vn'], c['t_ed'], c['t_book'], c['t_ch'], c['t_vn'], c['source']) for c in live["cards"])
print("duplicate same-direction pairs:", sum(1 for v in pairs.values() if v > 1))
print(f"live cards touching Jubilees: {len(live['cards'])}; anchored in Jubilees: {sum(1 for c in live['cards'] if jaddr(c))}")
