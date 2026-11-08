"""S463f — assemble fix/fix_cards.json, fix/fix_members.json, fix/fix_summaries.json, fix/fix_verses.json from:
  out/mechanical.json          (scripted: canon re-quotes, citation names, Hermas numbering, the 'Cod' verse fix)
  out/cards_A.final.json / cards_B.final.json      (Sonnet drafts after the Fable voice read)
  out/threads_A.final.json / _B / _C               (same, for summaries)
Content checks run on every assembled note before it is written: every italic that cites a witness verse or a canon verse is
verbatim in that verse (canon from in/canon.json); no degraded markers / hyphen-chains / slug cites / Hebrew book names; rebuilt
notes carry both whole verses; quotation-marked phrases verbatim in the witness verse (± neighbours).
Model: scripted."""
import json, re, collections, unicodedata, sys
from pathlib import Path
HERE = Path(__file__).resolve().parent; OUT = HERE / 'out'; FIX = HERE / 'fix'; FIX.mkdir(exist_ok=True)
live = json.load(open(HERE / 'af-cards-live.json')); L = dict(live['live'])
C = {c['id']: c for c in live['cards']}; T = {t['id']: t for t in live['threads']}
MEMB = {(m['thread_id'], m['xref_id']): m for m in live['members']}
mech = json.load(open(OUT / 'mechanical.json'))
for a, v in mech['verses'].items(): L[a] = v['new']
CANON_PATH = HERE / 'in' / 'canon.json'
if not CANON_PATH.exists(): CANON_PATH = HERE.parent.parent / 'parsed' / 'canon.json'
canon = json.load(open(CANON_PATH)); CL = {}; CT = {}
for b in canon['books']:
    CT[b['book_title'].lower()] = b['book_id']
    for ch in b['chapters']:
        for v in ch['verses']: CL[f"{b['book_id']}|{ch['number']}:{v['number']}"] = v['text']
CT['psalm'] = 'psalms'
EDS = {'lightfoot-apostolic-fathers', 'sonnini-acts-29'}
ENGLISH = {'1-clement': '1 Clement', '2-clement': '2 Clement', 'ignatius-ephesians': 'Ignatius to the Ephesians', 'ignatius-magnesians': 'Ignatius to the Magnesians',
           'ignatius-trallians': 'Ignatius to the Trallians', 'ignatius-romans': 'Ignatius to the Romans', 'ignatius-philadelphians': 'Ignatius to the Philadelphians',
           'ignatius-smyrnaeans': 'Ignatius to the Smyrnaeans', 'ignatius-polycarp': 'Ignatius to Polycarp', 'martyrdom-polycarp': 'Martyrdom of Polycarp',
           'didache': 'Didache', 'barnabas': 'Epistle of Barnabas', 'hermas': 'Hermas', 'sonnini-acts-29': 'Acts 29'}
SLUG = {v: k for k, v in ENGLISH.items()}
def norm(s):
    s = unicodedata.normalize('NFKD', s or ''); s = ''.join(ch for ch in s if not unicodedata.combining(ch))
    s = re.sub(r"\((?:[^()]{1,40})\)", " ", s); s = re.sub(r"[\[\]{}‘’'“”\"]", "", s).lower(); s = re.sub(r"[^a-z0-9 ]+", " ", s)
    return re.sub(r"\s+", " ", s).strip()
def pieces(q): return [norm(p) for p in re.split(r"\.\.\.|…", q) if norm(p)]
def contains(text, q):
    t = norm(text); pos = 0
    for p in pieces(q):
        i = t.find(p, pos)
        if i < 0: return False
        pos = i + len(p)
    return True
def addr_of(c):
    if c['s_ed'] in EDS: return 'S', f"{c['s_ed']}|{c['s_book']}|{c['s_ch']}:{c['s_vn']}"
    return 'T', f"{c['t_ed']}|{c['t_book']}|{c['t_ch']}:{c['t_vn']}"
def wit_addr(name, cv):
    sl = SLUG[name]; ed = 'sonnini-acts-29' if sl == 'sonnini-acts-29' else 'lightfoot-apostolic-fathers'
    return f"{ed}|{sl}|{cv}"
WIT_RE = '|'.join(sorted((re.escape(n) for n in ENGLISH.values()), key=len, reverse=True))
CAN_RE = '|'.join(sorted((re.escape(n) for n in CT), key=len, reverse=True))
CAN_RE = '(?!Acts 29:)(?:' + CAN_RE + ')'
DEGRADED = re.compile(r'wisdom-stream|the framework reads|the framework|Red Line #|apparatus|\bsubstance\b|FRAMEWORK-MAJOR|\blocked\b|\bS\d{2,3}\b|Yoshi|voice skill|teaching corpus|verbal-anchor|-register\b', re.I)
HYPHEN_CHAIN = re.compile(r"\b[A-Za-z']+(?:-[A-Za-z']+){3,}\b")
NUMERIC_CHAIN = re.compile(r"^(?:(?:one|two|three|four|five|six|seven|eight|nine|ten|eleven|twelve|thirteen|fifteen|twenty|thirty|forty|fifty|sixty|seventy|eighty|ninety|hundred|thousand|threescore|fourscore|and|by|year|years|old|day|days|cubit|cubits|fold)-?)+$", re.I)
SLUG_CITE = re.compile(r"\b(hermas|didache|barnabas|[12]-clement|ignatius-[a-z]+|martyrdom-polycarp|sonnini-acts-29|[a-z]+(?:-[a-z]+)+) \d+:\d+")
HEBREW = re.compile(r"\b(Bereshit|Shemot|Vayikra|Bamidbar|Devarim|Tehillim|Mishlei|Yeshayahu|Yirmeyahu|Yechezk'?el|Hoshea|Yo'el|Mattityahu|Hitgalut|Ivrim|Galatim)\b")

def check(text, own_addr=None, kind='note'):
    """returns a list of problems"""
    probs = []
    prose = re.sub(r"\*[^*]+\*", " ", text)
    if DEGRADED.search(prose): probs.append('degraded: ' + DEGRADED.search(prose).group(0))
    ch = [h for h in HYPHEN_CHAIN.findall(prose) if not NUMERIC_CHAIN.match(h)]
    if ch: probs.append('hyphen-chain: ' + ch[0])
    if SLUG_CITE.search(text): probs.append('slug cite: ' + SLUG_CITE.search(text).group(0))
    if HEBREW.search(text): probs.append('Hebrew book name: ' + HEBREW.search(text).group(0))
    # labelled italics — witness
    for m in re.finditer(rf"\b({WIT_RE}) (\d+:\d+)(?:\s*[–-]\s*(\d+))?\s*[—–-]+\s*\*([^*]+)\*", text):
        a = wit_addr(m.group(1), m.group(2)); span = L.get(a, '') + (' ' + L.get(a.rsplit(':', 1)[0] + ':' + str(int(m.group(2).split(':')[1]) + 1), '') if m.group(3) else '')
        if a not in L: probs.append(f"no such witness verse {m.group(1)} {m.group(2)}")
        elif not contains(span, m.group(4)): probs.append(f"witness italic off at {m.group(1)} {m.group(2)}: {m.group(4)[:50]}")
    for m in re.finditer(rf"\*([^*]+)\*\s*\(({WIT_RE}) (\d+:\d+)(?:\s*[–-]\s*(\d+))?\)", text):
        a = wit_addr(m.group(2), m.group(3)); span = L.get(a, '') + (' ' + L.get(a.rsplit(':', 1)[0] + ':' + str(int(m.group(3).split(':')[1]) + 1), '') if m.group(4) else '')
        if a not in L: probs.append(f"no such witness verse {m.group(2)} {m.group(3)}")
        elif not contains(span, m.group(1)): probs.append(f"witness italic off at {m.group(2)} {m.group(3)}: {m.group(1)[:50]}")
    # labelled italics — canon
    def cspan(name, cv, rng):
        slug = CT[name.lower()]; c, v = cv.split(':'); s = CL.get(f"{slug}|{cv}")
        if s is None: return None
        if rng: s = ' '.join(CL.get(f"{slug}|{c}:{k}", '') for k in range(int(v), int(rng) + 1))
        return s
    for m in re.finditer(rf"(?<![A-Za-z])({CAN_RE})\.? (\d+:\d+)(?:\s*[–-]\s*(\d+))?\s*[—–-]+\s*\*([^*]+)\*", text, re.I):
        s = cspan(m.group(1), m.group(2), m.group(3))
        if s is None: probs.append(f"no such canon verse {m.group(1)} {m.group(2)}")
        elif not contains(s, m.group(4)): probs.append(f"canon italic off at {m.group(1)} {m.group(2)}: {m.group(4)[:50]}")
    for m in re.finditer(rf"\*([^*]+)\*\s*\(({CAN_RE})\.? (\d+:\d+)(?:\s*[–-]\s*(\d+))?\)", text, re.I):
        s = cspan(m.group(2), m.group(3), m.group(4))
        if s is None: probs.append(f"no such canon verse {m.group(2)} {m.group(3)}")
        elif not contains(s, m.group(1)): probs.append(f"canon italic off at {m.group(2)} {m.group(3)}: {m.group(1)[:50]}")
    # quotation-marked phrases in prose vs the own witness verse ± neighbours
    if own_addr:
        ed, bk, cv = own_addr.split('|'); c, v = cv.split(':')
        span = ' '.join(L.get(f"{ed}|{bk}|{c}:{int(v)+k}", '') for k in (-1, 0, 1))
        for m in re.finditer(r"(?<![\w])[\"“](\S[^\"”]{4,}?)[\"”]", prose):
            if len(norm(m.group(1)).split()) >= 3 and not contains(span, m.group(1)):
                # a quoted phrase may be a canon phrase instead — accept if it sits in any canon italic of the note
                if not any(contains(it, m.group(1)) for it in re.findall(r"\*([^*]+)\*", text)):
                    probs.append(f"quoted phrase not in the witness verse: {m.group(1)[:50]}")
    if re.search(r"\b(The|the) (Lord|LORD)\b(?! Yahusha)(?!['’]?s?\))", prose): probs.append("bare 'the Lord' in prose")
    return probs

def load_final(stem):
    for suf in ('.final.json', '.json'):
        p = OUT / (stem + suf)
        if p.exists():
            d = json.load(open(p)); return d.get('model', '?'), d['items'] if isinstance(d, dict) else d
    return None, []

cards = {}; members = []; summaries = []; problems = []
# mechanical first
for k, v in mech['cards'].items():
    c = C[int(k)]; side, a = addr_of(c)
    cards[int(k)] = dict(old=a, new=a, side=side, new_note=v['new'], kind='MECH:' + ','.join(v['why']))
for k, v in mech['members'].items():
    tid, xid = map(int, k.split('|')); members.append(dict(thread_id=tid, xref_id=xid, new=v['new'], kind='MECH'))
for k, v in mech['threads'].items():
    summaries.append(dict(thread_id=int(k), old=v['old'], new=v['new'], old_title=v['old_title'], new_title=v['new_title'], kind='MECH'))
# readers' work overrides
models = {}
for stem in ('cards_A', 'cards_B'):
    model, items = load_final(stem); models[stem] = model
    for it in items:
        i = int(it['id']); c = C[i]; side, a = addr_of(c)
        kind = 'REBUILD' if side == 'T' else 'PROSE'
        cards[i] = dict(old=a, new=a, side=side, new_note=it['new_note'], kind=kind, flag=it.get('flag', ''))
        if it.get('new_member_note'):
            mk = [(t, x) for (t, x) in MEMB if x == i]
            members = [m for m in members if m['xref_id'] != i] + [dict(thread_id=t, xref_id=x, new=it['new_member_note'], kind='PROSE') for (t, x) in mk]
for stem in ('threads_A', 'threads_B', 'threads_C'):
    model, items = load_final(stem); models[stem] = model
    for it in items:
        tid = int(it['id']); th = T[tid]
        prev = next((s for s in summaries if s['thread_id'] == tid), None)
        summaries = [s for s in summaries if s['thread_id'] != tid]
        summaries.append(dict(thread_id=tid, old=th['summary_md'], new=it['new_summary'], old_title=th['title'],
                              new_title=it.get('new_title') or (prev['new_title'] if prev else th['title']), kind='PROSE', flag=it.get('flag', '')))
# 'It ain't new' is the author's own opener (118 of the 158 summaries, 57 times in the S478 migration) — a drafter that smoothed it out gets it back
def keep_aint(old, new):
    if "ain't new" in (old or '') and "ain't new" not in (new or ''):
        new = re.sub(r"\bThis is not new\b", "It ain't new", new); new = re.sub(r"\bIt is not new\b", "It ain't new", new); new = re.sub(r"\bNothing here is new\b", "It ain't new", new)
    return new
for i, x in cards.items(): x['new_note'] = keep_aint(C[i]['note'], x['new_note'])
for m in members: m['new'] = keep_aint(MEMB[(m['thread_id'], m['xref_id'])]['member_note'], m['new'])
for s_ in summaries: s_['new'] = keep_aint(s_['old'], s_['new'])
lost = [('card', i) for i, x in cards.items() if "ain't new" in (C[i]['note'] or '') and "ain't new" not in x['new_note']] + \
       [('summary', s_['thread_id']) for s_ in summaries if "ain't new" in (s_['old'] or '') and "ain't new" not in s_['new']]
print("'ain't new' lost by a drafter (must be 0):", lost)
# ---- Fable voice-read fixes (read against the voice skill after the Sonnet drafts; model: claude-fable-5-1) ----
FABLE_CARDS = {51897: [(r"Ignatius to the Magnesians 1:8 says that if we .*$", "Ignatius to the Magnesians 1:9 speaks of some \"no longer observing sabbaths but fashioning their lives after Yahuah's (Lord's) day\"; beside that line stands the word of Yahusha (Jesus) himself, who did not come to destroy the law or the prophets.")], 4439: [(r"\*\s*\(Acts 29:2\)", "*"), ], 4440: [(r"\*\s*\(Acts 29:3\)", "*")], 4441: [(r"\*\s*\(Acts 29:13\)", "*"), ("It is a disputed witness, but it shows", "The manuscript's standing is disputed, but what it shows is")]}
FABLE_SUM = {12589: [(r" -- ", " — ")], 11875: [("The Lord had marked Paul out", "Yahusha (Jesus) had marked Paul out")],
             12547: [(r"the LORD's word over the house of (?:Yashar'el \(Israel\)|Israel)", "Yahuah's (the LORD's) word over the house of Yashar'el (Israel)")],
             12553: [("the LORD's promise of an ingathering", "Yahuah's (the LORD's) promise of an ingathering")]}
for i, reps in FABLE_CARDS.items():
    if i in cards:
        for a, b in reps: cards[i]['new_note'] = re.sub(a, b, cards[i]['new_note'])
for tid, reps in FABLE_SUM.items():
    s_ = next((x for x in summaries if x['thread_id'] == tid), None)
    if s_ is None:
        th = T[tid]; s_ = dict(thread_id=tid, old=th['summary_md'], new=th['summary_md'], old_title=th['title'], new_title=th['title'], kind='PROSE'); summaries.append(s_)
    for a, b in reps: s_['new'] = re.sub(a, b, s_['new'])
FABLE_TITLES = {12160: [("the Lord Cometh", "Yahusha (the Lord) Cometh")]}
for tid, reps in FABLE_TITLES.items():
    s_ = next((x for x in summaries if x['thread_id'] == tid), None)
    if s_ is None:
        th = T[tid]; s_ = dict(thread_id=tid, old=th['summary_md'], new=th['summary_md'], old_title=th['title'], new_title=th['title'], kind='PROSE'); summaries.append(s_)
    for a, b in reps: s_['new_title'] = s_['new_title'].replace(a, b)
# witness italics still cited at a verse that does not carry them → re-cite to the verse of the same book that does (unique hit only)
def recite_witness(text):
    def find(name, q):
        sl = SLUG[name]; ed = 'sonnini-acts-29' if sl == 'sonnini-acts-29' else 'lightfoot-apostolic-fathers'
        hits = [k.split('|')[2] for k, v in L.items() if k.startswith(f"{ed}|{sl}|") and contains(v, q)]
        return hits[0] if len(hits) == 1 else None
    def rep_lead(m):
        a = wit_addr(m.group(1), m.group(2))
        if a in L and contains(L[a], m.group(3)): return m.group(0)
        h = find(m.group(1), m.group(3)); return f"{m.group(1)} {h} — *{m.group(3)}*" if h else m.group(0)
    def rep_trail(m):
        a = wit_addr(m.group(2), m.group(3))
        if a in L and contains(L[a], m.group(1)): return m.group(0)
        h = find(m.group(2), m.group(1)); return f"*{m.group(1)}* ({m.group(2)} {h})" if h else m.group(0)
    text = re.sub(rf"\b({WIT_RE}) (\d+:\d+)\s*[—–-]+\s*\*([^*]+)\*", rep_lead, text)
    text = re.sub(rf"\*([^*]+)\*\s*\(({WIT_RE}) (\d+:\d+)\)", rep_trail, text)
    return text
for s_ in summaries: s_['new'] = recite_witness(s_['new'])
for t in T.values():
    if t['a_ed'] in EDS and not any(x['thread_id'] == t['id'] for x in summaries):
        n = recite_witness(t['summary_md'] or '')
        if n != t['summary_md']: summaries.append(dict(thread_id=t['id'], old=t['summary_md'], new=n, old_title=t['title'], new_title=t['title'], kind='MECH'))
# member notes mirror the card note where they were identical before (513 of 517 in this edition)
for i, x in cards.items():
    for (tid, xid), mm in MEMB.items():
        if xid == i and (mm['member_note'] or '') == (C[i]['note'] or '') and not any(m['xref_id'] == i and m['kind'] == 'PROSE' for m in members):
            members = [m for m in members if m['xref_id'] != i] + [dict(thread_id=tid, xref_id=xid, new=x['new_note'], kind=x['kind'])]
# ---- address moves: first reader (5 Sonnet batches) + second cold read agree → the card moves; its own citation follows
MOVES = json.load(open(OUT / 'moves.json')) if (OUT / 'moves.json').exists() else {}
anchor_moves = {}
for i_s, dest in MOVES.items():
    i = int(i_s); c = C[i]; side, a = addr_of(c)
    ed = a.split('|')[0]; sl, cv = dest.split(' '); new_a = f"{ed}|{sl}|{cv}"
    assert new_a in L and sl == a.split('|')[1], (i, dest)
    x = cards.get(i) or dict(old=a, new=a, side=side, new_note=C[i]['note'], kind='MOVE')
    x['new'] = new_a; x['kind'] = (x['kind'] + '+MOVE') if x['kind'] != 'MOVE' else 'MOVE'
    eng = ENGLISH[sl]; oc = a.split('|')[2]
    x['new_note'] = re.sub(rf"\b{re.escape(eng)} {re.escape(oc)}\b", f"{eng} {cv}", x['new_note'])
    cards[i] = x
    for (tid, xid), mm in MEMB.items():
        if xid == i:
            m = next((m for m in members if m['xref_id'] == i), None)
            if m is None: m = dict(thread_id=tid, xref_id=xid, new=mm['member_note'] or '', kind='MOVE'); members.append(m)
            m['new'] = re.sub(rf"\b{re.escape(eng)} {re.escape(oc)}\b", f"{eng} {cv}", m['new'])
# thread anchors follow when every member card of the thread anchored in this edition moved to one verse
by_thread = collections.defaultdict(list)
for (tid, xid), mm in MEMB.items():
    c = C.get(xid)
    if c and addr_of(c)[1].split('|')[0] in EDS: by_thread[tid].append(xid)
for tid, xids in by_thread.items():
    th = T.get(tid)
    if not th or th['a_ed'] not in EDS: continue
    dests = {cards[x]['new'] if x in cards else addr_of(C[x])[1] for x in xids}
    cur = f"{th['a_ed']}|{th['a_book']}|{th['a_ch']}:{th['a_vn']}"
    if len(dests) == 1 and next(iter(dests)) != cur and any(x in MOVES or str(x) in MOVES for x in xids):
        anchor_moves[tid] = dict(old=cur, new=next(iter(dests)))
json.dump(anchor_moves, open(FIX / 'fix_anchors.json', 'w'), indent=1)
# Fable fixes that depend on the moved address (model: claude-fable-5-1)
POST = {50115: [('the Didache\'s "way of life" and "way of death" simply re-utter the choice Moses set before Yashar\'el.', 'the Didache\'s two ways, "one of life and one of death," simply re-utter the choice Moses set before Yashar\'el (Israel) (Didache 1:1).')],
        51854: [('Clement speaks of those who have "kept the flesh pure" in 2 Clement 1:9 and, in the next verse, "guard the flesh as a temple of Elohim (God)" (2 Clement 1:9), because it rises again;', 'Clement speaks of those who have "kept the flesh pure" (2 Clement 1:8) and then bids them "guard the flesh as a temple of Elohim (God)" (2 Clement 1:9), because it rises again;')]}
for i, reps in POST.items():
    for a, b in reps:
        assert a in cards[i]['new_note'], (i, 'POST edit did not match')
        cards[i]['new_note'] = cards[i]['new_note'].replace(a, b)
        for m in members:
            if m['xref_id'] == i: m['new'] = m['new'].replace(a, b)
print('card moves:', len(MOVES), '| thread anchor moves:', len(anchor_moves), anchor_moves)
# drop no-ops
cards = {i: x for i, x in cards.items() if x['new_note'] != C[i]['note'] or x['new'] != x['old']}
members = [m for m in members if m['new'] != (MEMB[(m['thread_id'], m['xref_id'])]['member_note'] or '')]
summaries = [s for s in summaries if s['new'] != s['old'] or s['new_title'] != s['old_title']]
# content checks
for i, x in cards.items():
    p = check(x['new_note'], own_addr=x['new'] if x['side'] == 'S' else None)
    if x['kind'] == 'REBUILD':
        c = C[i]
        if L[x['new']] not in x['new_note']: p.append('rebuilt note does not carry the whole witness verse')
        if CL.get(f"{c['s_book']}|{c['s_ch']}:{c['s_vn']}", '§') not in x['new_note']: p.append('rebuilt note does not carry the whole canon verse')
    if p: problems.append(('card', i, p))
for m in members:
    p = check(m['new'], own_addr=(cards[m['xref_id']]['new'] if m['xref_id'] in cards else addr_of(C[m['xref_id']])[1]) if addr_of(C[m['xref_id']])[0] == 'S' else None)
    if p: problems.append(('member', f"{m['thread_id']}|{m['xref_id']}", p))
for s in summaries:
    p = check(s['new']) + check(s['new_title'] or '')
    if p: problems.append(('summary', s['thread_id'], p))
json.dump({str(k): v for k, v in sorted(cards.items())}, open(FIX / 'fix_cards.json', 'w'), ensure_ascii=False, indent=1)
json.dump(sorted(members, key=lambda m: (m['thread_id'], m['xref_id'])), open(FIX / 'fix_members.json', 'w'), ensure_ascii=False, indent=1)
json.dump(sorted(summaries, key=lambda s: s['thread_id']), open(FIX / 'fix_summaries.json', 'w'), ensure_ascii=False, indent=1)
json.dump(mech['verses'], open(FIX / 'fix_verses.json', 'w'), ensure_ascii=False, indent=1)
K = collections.Counter(x['kind'].split(':')[0] for x in cards.values())
print('models:', models)
print(f"cards {len(cards)} {dict(K)} | member notes {len(members)} | summaries {len(summaries)} (titles changed {sum(1 for s in summaries if s['new_title'] != s['old_title'])}) | verses {len(mech['verses'])}")
print(f"content-check problems: {len(problems)}")
for p in problems[:60]: print('  ', p)
flags = [(i, x['flag']) for i, x in cards.items() if x.get('flag')] + [(s['thread_id'], s['flag']) for s in summaries if s.get('flag')]
print(f"flags from readers: {len(flags)}")
for f in flags: print('  ', f)
