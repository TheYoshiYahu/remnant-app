"""S478 — assemble fix/fix_cards.json, fix/fix_members.json, fix/fix_summaries.json from:
  out/rebuild_00.final.json (12 rebuilt notes, Sonnet drafts + Fable voice fixes; 4 moves)
  out/patches.final.json   (15 patched notes)        out/summaries.final.json (3 patched summaries)
  out/cold1/cold2.sonnet.json (two cold reads of the 9 neighbour-verse cards: moves only where both agree)
  stale_cites.json         (old-numbering citations in prose → mapped)   regrade.json (canon lead re-quotes)
Every note/summary gets the citation fixes applied; member rows mirror their card; rebuilt cards' member rows take the drafted member note."""
import json, re, collections, unicodedata
from pathlib import Path
HERE = Path(__file__).resolve().parent; OUT = HERE/'out'; FIX = HERE/'fix'; FIX.mkdir(exist_ok=True)
live = json.load(open(HERE/'in'/'pseud-cards-live.json')); L = live['live']
C = {c['id']: c for c in live['cards']}; T = {t['id']: t for t in live['threads']}
MEM = collections.defaultdict(list)
for m in live['members']: MEM[m['xref_id']].append(m)
m477 = json.load(open(HERE.parent/'s477-text-lane'/'s477_map.json'))
CANON_PATH = HERE/'in'/'canon.json'
if not CANON_PATH.exists(): CANON_PATH = HERE.parent.parent/'parsed'/'canon.json'
canon = {}
for b in json.load(open(CANON_PATH))['books']:
    for ch in b['chapters']:
        for v in ch['verses']: canon[(b['book_id'], ch['number'], v['number'])] = v['text']
ED = 'pseudepigrapha'; BOOKS = ('adam-eve', '4-maccabees')
def side_of(c):
    if c['s_ed'] == ED and c['s_book'] in BOOKS: return 'S'
    if c['t_ed'] == ED and c['t_book'] in BOOKS: return 'T'
def addr_of(c):
    s = side_of(c)
    return f"{ED}|{c['s_book']}|{c['s_ch']}:{c['s_vn']}" if s == 'S' else f"{ED}|{c['t_book']}|{c['t_ch']}:{c['t_vn']}"
maxv = collections.defaultdict(int)
for a in L:
    e, b, cv = a.split('|'); ch, vn = map(int, cv.split(':'))
    if b in BOOKS: maxv[(b, ch)] = max(maxv[(b, ch)], vn)
EN = {'adam-eve': 'Adam and Eve', '4-maccabees': '4 Maccabees'}

# ---------- citation fixes (from stale_cites.json) ----------
ST = json.load(open(HERE/'stale_cites.json'))
def new_cite(x):
    """the replacement text for one stale citation, or None if it stands"""
    bk = x['book']; c = x['c']; start = x['proposed']
    if x['verdict'] in ('CONTENT_OK',): return None
    if x['verdict'] == 'QUOTE_NOT_FOUND':
        if x['kind'] == 'thread' and x['id'] == 15734: start = '8:10'; end = '8:11'   # quote runs across the live 8:10/8:11 split
        else: return None   # 17332 "found Abel murdered by the hand" — live 3:1 has an OCR stray "I"; cite stands at 3:1 (text lane)
    else:
        end = None
        if x['v_end']:
            e = m477[bk]['old_to_new'].get(f"{c}:{x['v_end']}")
            # a range end that still exists in the live numbering and is ≥ start may be live already; only remap when impossible
            if int(x['v_end']) > maxv[(bk, c)] or x['verdict'] in ('IMPOSSIBLE', 'OWN_OLD'): end = e
            else: end = f"{c}:{x['v_end']}"
    if start is None: return None
    sc, sv = start.split(':')
    if end and end != start:
        ec, ev = end.split(':')
        if int(ev) < int(sv) and ec == sc: end = None
    if end and end != start:
        ec, ev = end.split(':')
        rng = f"{sc}:{sv}–{ev}" if ec == sc else f"{sc}:{sv}–{ec}:{ev}"
    else: rng = f"{sc}:{sv}"
    old = x['cite']
    name = EN[bk]
    new = f"{name} {rng}"
    if old == new: return None
    return (old, new)
cite_fix = collections.defaultdict(list)   # (kind, id) -> [(old, new)]
for x in ST:
    r = new_cite(x)
    if r: cite_fix[(x['kind'], str(x['id']))].append(r)
def apply_cites(kind, ident, text):
    for old, new in cite_fix.get((kind, str(ident)), []):
        if old in text: text = text.replace(old, new)
    # also the plain book-name normalisation "Adam & Eve c:v" → "Adam and Eve c:v" on untouched cites
    text = re.sub(r"\bAdam & Eve (\d+:\d+)", r"Adam and Eve \1", text)
    return text

# ---------- cards ----------
cards = {}
R = json.load(open(OUT/'rebuild_00.final.json'))
for r in R:
    c = C[r['id']]; old = addr_of(c); new = r['move'] or old
    note = apply_cites('card', r['id'], r['new_note'])
    cards[r['id']] = dict(id=r['id'], side=side_of(c), old=old, new=new, kind='PROSE_MOVE' if new != old else 'PROSE', new_note=note, member_note=r['member_note'], flag=r.get('flag', ''))
P = json.load(open(OUT/'patches.final.json'))
for p in P:
    c = C[p['id']]; old = addr_of(c)
    cards[p['id']] = dict(id=p['id'], side=side_of(c), old=old, new=old, kind='PHRASE_PATCH', new_note=apply_cites('card', p['id'], p['new_note']), flag=p.get('flag', ''))
# cold reads: move only where both agree
c1 = {x['id']: x for x in json.load(open(OUT/'cold1.sonnet.json'))}; c2 = {x['id']: x for x in json.load(open(OUT/'cold2.sonnet.json'))}
moves = {}
for i in c1:
    a, b = c1[i], c2[i]
    if a['decision'] == b['decision'] == 'MOVE' and a['to'] == b['to']: moves[i] = a['to']
    elif a['decision'] == b['decision'] == 'STAY': pass
    else: print('COLD READS DISAGREE', i, a['decision'], a['to'], b['decision'], b['to'])
for i, to in moves.items():
    c = C[i]; old = addr_of(c); bk = old.split('|')[1]
    cards[i] = dict(id=i, side=side_of(c), old=old, new=f"{ED}|{bk}|{to}", kind='ADDR_MOVE', new_note=apply_cites('card', i, c['note']), flag='moved by two cold reads')
# citation-only fixes on cards not yet touched
for (kind, ident), fixes in cite_fix.items():
    if kind != 'card': continue
    i = int(ident)
    if i in cards: continue
    c = C[i]; old = addr_of(c); nn = apply_cites('card', i, c['note'])
    if nn != c['note']: cards[i] = dict(id=i, side=side_of(c), old=old, new=old, kind='ADDR_CITE_FIX', new_note=nn, flag='')
# canon lead re-quotes
RG = {o['id']: o for o in json.load(open(HERE/'regrade.json'))}
CANON_LEAD = re.compile(r"^(\s*)([A-Za-z0-9 ]+?)\s+(\d+):(\d+)(\s*[—–-]\s*)\*([^*]+)\*")
for i in (69342, 63607, 69526):
    c = C[i]; note = cards[i]['new_note'] if i in cards else c['note']
    oc = c['t_book'] if side_of(c) == 'S' else c['s_book']; och = c['t_ch'] if side_of(c) == 'S' else c['s_ch']; ovn = c['t_vn'] if side_of(c) == 'S' else c['s_vn']
    m = CANON_LEAD.match(note); assert m, i
    full = canon[(oc, och, ovn)]
    nn = note[:m.start(6)] + full + note[m.end(6):]
    if nn != note:
        if i in cards: cards[i]['new_note'] = nn; cards[i]['kind'] = cards[i]['kind'] if cards[i]['kind'] != 'ADDR_CITE_FIX' else 'CANON_REQUOTE'
        else: cards[i] = dict(id=i, side=side_of(c), old=addr_of(c), new=addr_of(c), kind='CANON_REQUOTE', new_note=nn, flag='canon lead re-quoted from parsed/canon.json')
# ---------- members ----------
members = []
for i, x in cards.items():
    for m in MEM[i]:
        old_m = m['member_note'] or ''
        if x['kind'].startswith('PROSE'): new_m = x['member_note']
        elif old_m == (C[i]['note'] or ''): new_m = x['new_note']
        else:
            new_m = apply_cites('member', f"{m['thread_id']}/{i}", old_m)
            # patched cards: carry the same patch into a differing member note when the flagged words are there
        if new_m != old_m: members.append(dict(thread_id=m['thread_id'], xref_id=i, old=old_m, new=new_m))
# members with stale cites on cards we did not otherwise touch
for (kind, ident), fixes in cite_fix.items():
    if kind != 'member': continue
    tid, xid = map(int, ident.split('/'))
    if any(mm['thread_id'] == tid and mm['xref_id'] == xid for mm in members): continue
    m = next(mm for mm in MEM[xid] if mm['thread_id'] == tid); old_m = m['member_note'] or ''
    nn = apply_cites('member', ident, old_m)
    if nn != old_m: members.append(dict(thread_id=tid, xref_id=xid, old=old_m, new=nn))
# ---------- summaries ----------
summaries = {}
for s in json.load(open(OUT/'summaries.final.json')):
    summaries[s['thread_id']] = dict(thread_id=s['thread_id'], old=T[s['thread_id']]['summary_md'], new=apply_cites('thread', s['thread_id'], s['new']), flag=s.get('flag', ''))
for (kind, ident), fixes in cite_fix.items():
    if kind != 'thread': continue
    tid = int(ident)
    if tid in summaries: continue
    old = T[tid]['summary_md'] or ''; nn = apply_cites('thread', tid, old)
    if nn != old: summaries[tid] = dict(thread_id=tid, old=old, new=nn, flag='citations re-cited to the merged numbering')
json.dump({str(k): v for k, v in sorted(cards.items())}, open(FIX/'fix_cards.json', 'w'), ensure_ascii=False, indent=1)
json.dump(members, open(FIX/'fix_members.json', 'w'), ensure_ascii=False, indent=1)
json.dump(list(summaries.values()), open(FIX/'fix_summaries.json', 'w'), ensure_ascii=False, indent=1)
print('cards', len(cards), dict(collections.Counter(x['kind'] for x in cards.values())), '| moves', sum(1 for x in cards.values() if x['old'] != x['new']))
print('members', len(members), '| summaries', len(summaries))
print('cite fixes applied: cards', sum(1 for k in cite_fix if k[0]=='card'), 'members', sum(1 for k in cite_fix if k[0]=='member'), 'threads', sum(1 for k in cite_fix if k[0]=='thread'))
# leftovers: a stale citation we meant to fix but whose text is not in the note (would mean the regex matched something else)
for (kind, ident), fixes in cite_fix.items():
    src = {'card': lambda: C[int(ident)]['note'], 'member': lambda: next(m for m in MEM[int(ident.split('/')[1])] if m['thread_id']==int(ident.split('/')[0]))['member_note'], 'thread': lambda: T[int(ident)]['summary_md']}[kind]()
    for old, new in fixes:
        if old not in (src or ''): print('CITE NOT FOUND IN TEXT', kind, ident, old)
