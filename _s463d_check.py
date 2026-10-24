"""S463d — read-back after the Book of Jasher sweep. Re-dumps every live card / member note / thread summary touching Jasher (same dump
the sweep was built from), checks every S463d row landed as written, re-grades EVERY Jasher quotation in every note against the live
text (not the first only), and counts what the sweep was meant to remove (degraded markers, hyphen-chains, slug citations) on anchored cards.
Run:  python3 ~/Desktop/App/_s463d_check.py            (live: re-dumps first)
      python3 _s463d_check.py <dump.json>               (check a given dump, e.g. the scratch post-run dump)
"""
import subprocess, sys, json, re, collections, unicodedata
from pathlib import Path
HERE = Path(__file__).resolve().parent
JA = HERE / "source-texts" / "jasher-noah-1840"
F = JA / "s463d-sweep"
if len(sys.argv) > 1:
    dump = Path(sys.argv[1])
else:
    subprocess.run([sys.executable, str(HERE / "_s463d_jasher_dump.py")], check=True)
    dump = JA / "jasher-cards-live.json"
live = json.load(open(dump)); L = live["live"]
C = {c["id"]: c for c in live["cards"]}
M = {(m["thread_id"], m["xref_id"]): m for m in live["members"]}
T = {t["id"]: t for t in live["threads"]}
cards = {int(k): v for k, v in json.load(open(F / "fix" / "fix_cards.json")).items()}
members = json.load(open(F / "fix" / "fix_members.json")); summaries = json.load(open(F / "fix" / "fix_summaries.json"))
LAB = re.compile(r"\bJasher (\d+):(\d+)(?:\s*[–-]\s*(\d+))?\s*[—–-]\s*\*([^*]+)\*")
CIT = re.compile(r"\*([^*]+)\*\s*\(Jasher (\d+):(\d+)(?:\s*[–-]\s*(\d+))?\)")
SLUG = re.compile(r"\b[a-z0-9]+(?:-[a-z0-9]+)+ \d+:\d+")
DEG = re.compile(r"wisdom-stream|the framework reads|the framework|Red Line #|\bapparatus\b|in substance|its substance|FRAMEWORK-MAJOR|\blocked\b|\bS\d{3}\b|Yoshi", re.I)
CHAIN = re.compile(r"\b[A-Za-z']+(?:-[A-Za-z']+){3,}\b")
NUMERIC = re.compile(r"^(?:(?:one|two|three|four|five|six|seven|eight|nine|ten|eleven|twelve|thirteen|fifteen|twenty|thirty|forty|fifty|sixty|seventy|eighty|ninety|hundred|thousand|threescore|fourscore|and|by|year|years|old|day|days|cubit|cubits|fold)-?)+$", re.I)
def norm(s):
    s = unicodedata.normalize('NFKD', s or ''); s = ''.join(ch for ch in s if not unicodedata.combining(ch))
    s = re.sub(r"\([^)]*\)", " ", s); s = re.sub(r"[\[\]‘’'“”\"]", "", s).lower(); s = re.sub(r"[^a-z0-9 ]+", " ", s); return re.sub(r"\s+", " ", s).strip()
NL = {a: norm(t) for a, t in L.items()}
def aaddr(c):
    if c['s_ed'] == 'jasher': return f"jasher|{c['s_ch']}:{c['s_vn']}"
    if c['t_ed'] == 'jasher': return f"jasher|{c['t_ch']}:{c['t_vn']}"
    return None
def ok_at(q, ch, vn, to=None):
    to = to or vn
    span = ' '.join(NL.get(f"jasher|{ch}:{v}", '') for v in range(vn, to + 2))   # cited verse(s) plus one neighbour of slack, as the earlier read-backs allowed
    if not span.strip(): return False
    pieces = [norm(p) for p in re.split(r"\.\.\.|…", q) if norm(p)]; pos = 0
    for p in pieces:
        i = span.find(p, pos)
        if i < 0: return False
        pos = i + len(p)
    return True

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

qbad = collections.Counter(); qn = 0; qlist = []
def grade(text, tag, where):
    global qn
    for g in LAB.finditer(text or ''):
        qn += 1
        if not ok_at(g.group(4), int(g.group(1)), int(g.group(2)), int(g.group(3)) if g.group(3) else None): qbad[tag] += 1; qlist.append((tag, where, f"{g.group(1)}:{g.group(2)}", g.group(4)[:60]))
    for g in CIT.finditer((text or '').replace('**', '')):
        qn += 1
        if not ok_at(g.group(1), int(g.group(2)), int(g.group(3)), int(g.group(4)) if g.group(4) else None): qbad[tag] += 1; qlist.append((tag, where, f"{g.group(2)}:{g.group(3)}", g.group(1)[:60]))
# the Come-and-See lead quote on a rebuilt card is checked as a whole verse too (no label — the whole live verse must sit in the note)
for c in live["cards"]:
    if aaddr(c): grade(c["note"], 'card', c['id'])
for m in live["members"]:
    if m['t_ed'] == 'jasher' or m['s_ed'] == 'jasher': grade(m["member_note"], 'member', (m['thread_id'], m['xref_id']))
for t in live["threads"]:
    if t.get("a_ed") == 'jasher': grade(t["summary_md"], 'summary', t['id'])
print(f"Jasher quotations checked (every labelled or cited quotation in every note): {qn}; not verbatim at cited verse: {dict(qbad) or 0}")
for x in qlist[:12]: print('   ', x)
whole = sum(1 for i, x in cards.items() if x['kind'].startswith('PROSE') and C.get(i) and L.get(x['new'], '\0') in C[i]['note'])
print(f"rebuilt notes carrying the whole live Jasher verse verbatim: {whole}/{sum(1 for x in cards.values() if x['kind'].startswith('PROSE'))}")

anch = [c for c in live["cards"] if aaddr(c)]
def prose(s): return re.sub(r"\*[^*]+\*", "", s or '')
deg = [c["id"] for c in anch if DEG.search(prose(c["note"]))]
chain = [c["id"] for c in anch if [h for h in CHAIN.findall(prose(c["note"])) if not NUMERIC.match(h)]]
slug = [c["id"] for c in anch if SLUG.search(c["note"] or '')]
print(f"degraded markers left on anchored cards: {len(deg)}", deg[:20])
print(f"hyphen-chain prose left on anchored cards: {len(chain)}", chain[:20])
print(f"slug citations left on anchored cards: {len(slug)}", slug[:20])
sdeg = [t['id'] for t in live['threads'] if t.get('a_ed') == 'jasher' and DEG.search(prose(t['summary_md'])) and t['id'] not in (6295, 8940)]
print(f"degraded markers left in anchored summaries: {len(sdeg)}", sdeg[:20], "(6295/8940 'substance' = goods, excluded)")
pairs = collections.Counter((c['s_ed'], c['s_book'], c['s_ch'], c['s_vn'], c['t_ed'], c['t_book'], c['t_ch'], c['t_vn'], c['source']) for c in live["cards"])
print("duplicate same-direction pairs:", sum(1 for v in pairs.values() if v > 1))
chs = collections.Counter(int(a.split('|')[1].split(':')[0]) for a in L)
print(f"live Jasher verses: {len(L)} (7:{chs.get(7)} 9:{chs.get(9)} 20:{chs.get(20)}); live cards touching Jasher: {len(live['cards'])}; anchored: {len(anch)}")
