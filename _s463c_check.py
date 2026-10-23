"""S463c — read-back after the Apocrypha + 3 Maccabees sweep. Re-dumps every live card / member note / thread summary touching
the Apocrypha or 3 Maccabees (same dump the sweep was built from), checks every S463c row landed as written, re-grades every
Apocrypha quotation against the live text, and counts what the sweep was meant to remove (degraded markers, hyphen-chains, slug
citations) on anchored cards.
Run:  python3 ~/Desktop/App/_s463c_check.py            (live: re-dumps first)
      python3 _s463c_check.py <dump.json>               (check a given dump, e.g. the scratch post-run dump)
"""
import subprocess, sys, json, re, collections, unicodedata
from pathlib import Path
HERE = Path(__file__).resolve().parent
AP = HERE / "source-texts" / "apocrypha-kjv-ebible"
F = AP / "s463c-sweep"
if len(sys.argv) > 1:
    dump = Path(sys.argv[1])
else:
    subprocess.run([sys.executable, str(HERE / "_s463c_apoc_dump.py")], check=True)
    dump = AP / "apocrypha-cards-live.json"
live = json.load(open(dump)); L = live["live"]
C = {c["id"]: c for c in live["cards"]}
M = {(m["thread_id"], m["xref_id"]): m for m in live["members"]}
T = {t["id"]: t for t in live["threads"]}
cards = {int(k): v for k, v in json.load(open(F / "fix_cards.json")).items()}
members = json.load(open(F / "fix_members.json")); summaries = json.load(open(F / "fix_summaries.json"))
EN = {'1-esdras': '1 Esdras', '2-esdras': '2 Esdras', 'tobit': 'Tobit', 'judith': 'Judith', 'the-rest-of-esther': 'The Rest of Esther',
      'the-wisdom-of-solomon': 'Wisdom of Solomon', 'ecclesiasticus': 'Ecclesiasticus', 'baruch-with-the-letter-of-jeremiah': 'Baruch',
      'the-song-of-the-three-holy-children': 'Song of the Three Holy Children', 'the-history-of-susanna': 'Susanna',
      'bel-and-the-dragon': 'Bel and the Dragon', 'the-prayer-of-manasseh': 'Prayer of Manasseh', '1-maccabees': '1 Maccabees',
      '2-maccabees': '2 Maccabees', '3-maccabees': '3 Maccabees'}
ALIAS = {v.lower(): k for k, v in EN.items()}
ALIAS.update({'the wisdom of solomon': 'the-wisdom-of-solomon', 'wisdom': 'the-wisdom-of-solomon', 'sirach': 'ecclesiasticus', '2 esdras (4 ezra)': '2-esdras',
              '1 esdras (3 ezra)': '1-esdras', '4 ezra': '2-esdras', 'rest of esther': 'the-rest-of-esther', 'the history of susanna': 'the-history-of-susanna',
              'the prayer of manasseh': 'the-prayer-of-manasseh', 'prayer of manasses': 'the-prayer-of-manasseh', 'the song of the three holy children': 'the-song-of-the-three-holy-children',
              'song of the three': 'the-song-of-the-three-holy-children', 'epistle of jeremy': 'baruch-with-the-letter-of-jeremiah'})
NAME = '|'.join(sorted(map(re.escape, ALIAS), key=len, reverse=True))
LAB = re.compile(rf"(?<!\d )(?<!\d)\b({NAME}) (\d+):(\d+)(?:\s*[–-]\s*(\d+))?\s*[—–-]\s*\*([^*]+)\*", re.I)
CIT = re.compile(rf"\*([^*]+)\*\s*\((?!\d )({NAME}) (\d+):(\d+)(?:\s*[–-]\s*(\d+))?\)", re.I)
SLUG = re.compile(r"\b(1-esdras|2-esdras|the-rest-of-esther|the-wisdom-of-solomon|baruch-with-the-letter-of-jeremiah|the-song-of-the-three-holy-children|the-history-of-susanna|bel-and-the-dragon|the-prayer-of-manasseh|[123]-maccabees|ecclesiasticus|tobit|judith) \d+:\d+")
DEG = re.compile(r"wisdom-stream|the framework reads|Red Line #|\bapparatus\b|FRAMEWORK-MAJOR|\blocked\b|\bS\d{3}\b|Yoshi", re.I)
CHAIN = re.compile(r"\b[A-Za-z']+(?:-[A-Za-z']+){3,}\b")

def norm(s):
    s = unicodedata.normalize('NFKD', s or ''); s = ''.join(ch for ch in s if not unicodedata.combining(ch))
    s = re.sub(r"\([^)]*\)", " ", s); s = re.sub(r"[\[\]‘’'“”\"]", "", s).lower(); s = re.sub(r"[^a-z0-9 ]+", " ", s); return re.sub(r"\s+", " ", s).strip()
NL = {a: norm(t) for a, t in L.items()}
def in_scope(ed, bk): return ed == 'apocrypha' or (ed == 'pseudepigrapha' and bk == '3-maccabees')
def aaddr(c):
    if in_scope(c['t_ed'], c['t_book']): return f"{c['t_book']}|{c['t_ch']}:{c['t_vn']}"
    if in_scope(c['s_ed'], c['s_book']): return f"{c['s_book']}|{c['s_ch']}:{c['s_vn']}"
    return None
def ok_at(q, a, n=1):
    b, cv = a.split('|'); ch, vn = map(int, cv.split(':'))
    span = ' '.join(NL.get(f"{b}|{ch}:{vn+k}", '') for k in range(max(n, 1) + 1))
    if not span.strip(): return False
    return all(p in span for p in [norm(p) for p in re.split(r"\.\.\.|…", q) if norm(p)])

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
        qn += 1; a = f"{ALIAS[g.group(1).lower()]}|{g.group(2)}:{g.group(3)}"; n = (int(g.group(4)) - int(g.group(3)) + 1) if g.group(4) else 1
        if not ok_at(g.group(5), a, n): qbad[tag] += 1; qlist.append((tag, where, a, g.group(5)[:60]))
    for g in CIT.finditer((text or '').replace('**', '')):
        qn += 1; a = f"{ALIAS[g.group(2).lower()]}|{g.group(3)}:{g.group(4)}"; n = (int(g.group(5)) - int(g.group(4)) + 1) if g.group(5) else 1
        if not ok_at(g.group(1), a, n): qbad[tag] += 1; qlist.append((tag, where, a, g.group(1)[:60]))
for c in live["cards"]:
    if aaddr(c): grade(c["note"], 'card', c['id'])
for m in live["members"]:
    if in_scope(m['t_ed'], m['t_book']) or in_scope(m['s_ed'], m['s_book']): grade(m["member_note"], 'member', (m['thread_id'], m['xref_id']))
for t in live["threads"]:
    if t.get("a_ed") and in_scope(t['a_ed'], t['a_book']): grade(t["summary_md"], 'summary', t['id'])
print(f"Apocrypha/3 Macc quotations checked: {qn}; not verbatim at cited verse: {dict(qbad) or 0}")
for x in qlist[:12]: print('   ', x)

anch = [c for c in live["cards"] if aaddr(c)]
deg = [c["id"] for c in anch if DEG.search(re.sub(r"\*[^*]+\*", "", c["note"] or ''))]
chain = [c["id"] for c in anch if CHAIN.search(re.sub(r"\*[^*]+\*", "", c["note"] or ''))]
slug = [c["id"] for c in anch if SLUG.search(c["note"] or '')]
print(f"degraded markers left on anchored cards: {len(deg)}", deg[:20])
print(f"hyphen-chain prose left on anchored cards: {len(chain)}", chain[:20])
print(f"slug citations left on anchored cards: {len(slug)}", slug[:20])
sslug = [t['id'] for t in live['threads'] if t.get('a_ed') and in_scope(t['a_ed'], t['a_book']) and SLUG.search(t['summary_md'] or '')]
print(f"slug citations left in anchored summaries: {len(sslug)}", sslug[:20])
pairs = collections.Counter((c['s_ed'], c['s_book'], c['s_ch'], c['s_vn'], c['t_ed'], c['t_book'], c['t_ch'], c['t_vn'], c['source']) for c in live["cards"])
print("duplicate same-direction pairs:", sum(1 for v in pairs.values() if v > 1))
print(f"live cards touching the Apocrypha/3 Macc: {len(live['cards'])}; anchored: {len(anch)}; 3 Maccabees at either end: {sum(1 for c in live['cards'] if '3-maccabees' in (c['s_book'], c['t_book']))}")
