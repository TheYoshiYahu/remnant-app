"""S478 — work packets for the adam-eve (784) + 4 Maccabees (789) sweep on the merged live text.
  packets/rebuild_00.json   — the 12 S154-era framework cards: full rebuild Come-and-See (5 move to the verse their words sit in)
  packets/patches.json      — 15 cards: hyphen-chain / "substance … shadow" / reworded phrase — rewrite the flagged sentence only
  packets/summaries.json    — 3 thread summaries: "substance" (15727, 15755), hyphen-chain (15752) — same patch rule
  packets/address.json      — 9 cards whose note names a NEIGHBOUR verse: two cold reads decide MOVE / STAY
Citation fixes (stale_cites.json) and canon re-quotes are scripted in assemble478.py, not packeted.
Every item carries the full live text of both verses (canon from parsed/canon.json)."""
import json, re, collections
from pathlib import Path
HERE = Path(__file__).resolve().parent; IN = HERE/'in'; P = HERE/'packets'
live = json.load(open(IN/'pseud-cards-live.json')); L = live['live']
R = {o['id']: o for o in json.load(open(HERE/'regrade.json'))}
C = {c['id']: c for c in live['cards']}; T = {t['id']: t for t in live['threads']}
members_by_card = collections.defaultdict(list)
for m in live['members']: members_by_card[m['xref_id']].append(m)
CANON_PATH = IN/'canon.json'
if not CANON_PATH.exists(): CANON_PATH = HERE.parent.parent/'parsed'/'canon.json'
canon = {}; CANON_EN = {}
for b in json.load(open(CANON_PATH))['books']:
    CANON_EN[b['book_id']] = b['book_title']
    for ch in b['chapters']:
        for v in ch['verses']: canon[(b['book_id'], ch['number'], v['number'])] = v['text']
XEN = {'4-maccabees': '4 Maccabees', 'adam-eve': 'Adam and Eve', 'jubilees': 'Jubilees', '1-enoch': '1 Enoch', 'jasher': 'Jasher',
       'the-wisdom-of-solomon': 'Wisdom of Solomon', 'ecclesiasticus': 'Ecclesiasticus', '2-maccabees': '2 Maccabees', '1-maccabees': '1 Maccabees',
       '1-adam-eve': '1 Adam and Eve', '2-adam-eve': '2 Adam and Eve'}
def en(ed, book): return CANON_EN.get(book, book) if ed == 'canon' else XEN.get(book, book.replace('-', ' ').title())
def other_end(c, side):
    ed, book, ch, vn, txt = (c['s_ed'], c['s_book'], c['s_ch'], c['s_vn'], c['s_text']) if side == 'T' else (c['t_ed'], c['t_book'], c['t_ch'], c['t_vn'], c['t_text'])
    return dict(ed=ed, book=book, ch=ch, vn=vn, cite=f"{en(ed, book)} {ch}:{vn}", text_db=txt, text_canon=canon.get((book, ch, vn)) if ed == 'canon' else None)
def extra_end(addr):
    ed, book, cv = addr.split('|'); ch, vn = map(int, cv.split(':'))
    return dict(ed=ed, book=book, name=en(ed, book), ch=ch, vn=vn, cite=f"{en(ed, book)} {ch}:{vn}", text=L[addr],
                prev=L.get(f"{ed}|{book}|{ch}:{vn-1}"), next=L.get(f"{ed}|{book}|{ch}:{vn+1}"))
def member_rows(i): return [dict(thread_id=m['thread_id'], slug=m['slug'], old=m['member_note'], same_as_card=(m['member_note'] or '') == (C[i]['note'] or '')) for m in members_by_card.get(i, [])]
def item(i, kind, **extra):
    o = R[i]; c = C[i]
    return dict(id=i, kind=kind, side=o['side'], extra=extra_end(o['addr']), other=other_end(c, o['side']), old_note=o['note'],
                regrade=dict(verdict=o['verdict'], quotes=o.get('quotes', []), phrases=o.get('phrases', []), canon_lead=o.get('canon_lead'),
                             degraded=o['degraded'], hyphen_chain=o['hyphen_chain'], chains=o['chains']), members=member_rows(i), **extra)
def named(ed, book, note):
    """live text of every verse of the book the note names (c:v or c:v-v)"""
    out = {}
    for m in re.finditer(r"(\d+):(\d+)(?:\s*[–-]\s*(\d+))?", note or ''):
        for v in range(int(m.group(2)), int(m.group(3) or m.group(2)) + 1):
            a = f"{ed}|{book}|{m.group(1)}:{v}"
            if a in L: out[f"{m.group(1)}:{v}"] = L[a]
    return out

# --- rebuild: the 12 S154-era cards; new address = the verse the own-book quotation sits in (computed in the map)
NEW = {4450: '17:12', 4875: '17:12', 4859: '17:15', 4860: '17:19'}
REBUILD = [4448, 4449, 4450, 4451, 4452, 4858, 4859, 4860, 4873, 4874, 4875, 4876]
items = []
for i in REBUILD:
    it = item(i, 'REBUILD')
    ed, book = it['extra']['ed'], it['extra']['book']
    if i in NEW:
        it['move_to'] = NEW[i]; it['extra_new'] = extra_end(f"{ed}|{book}|{NEW[i]}")
    if i == 4876: it['second_quotation_verse'] = dict(cite='4 Maccabees 17:19', text=L['pseudepigrapha|4-maccabees|17:19'])
    it['live_named'] = named(ed, book, it['old_note'])
    items.append(it)
json.dump(items, open(P/'rebuild_00.json', 'w'), ensure_ascii=False, indent=1)

# --- patches: chains, "substance", reworded phrases — flagged sentence only
PATCH = {63517: 'hyphen-chain', 63524: 'hyphen-chain', 63552: 'hyphen-chain', 63655: 'hyphen-chain', 69383: 'hyphen-chain', 69405: 'hyphen-chain', 69411: 'hyphen-chain',
         63464: 'substance', 63469: 'substance', 63470: 'substance', 63619: 'substance', 63622: 'substance', 63625: 'substance',
         63407: 'phrase', 63397: 'phrase'}
pitems = []
for i, why in PATCH.items():
    it = item(i, 'PATCH', why=why)
    it['flagged'] = it['regrade']['chains'] if why == 'hyphen-chain' else ([p for p in it['regrade']['phrases'] if p['verdict'] != 'STAND'] if why == 'phrase' else ['substance'])
    pitems.append(it)
json.dump(pitems, open(P/'patches.json', 'w'), ensure_ascii=False, indent=1)

# --- summaries: 3 threads, flagged sentence only
sitems = []
for tid, why in {15727: 'substance', 15755: 'substance', 15752: 'hyphen-chain'}.items():
    t = T[tid]; ed, book = t['a_ed'], t['a_book']
    sitems.append(dict(thread_id=tid, slug=t['slug'], title=t['title'], book=en(ed, book), anchor=f"{t['a_ch']}:{t['a_vn']}–{t['z_ch']}:{t['z_vn']}", why=why,
                       old=t['summary_md'], live_text={f"{en(ed, book)} {k}": v for k, v in named(ed, book, t['summary_md']).items()}))
json.dump(sitems, open(P/'summaries.json', 'w'), ensure_ascii=False, indent=1)

# --- address: 9 cards whose note names a neighbour verse (pre-existing) — cold reads decide
ADDR = {69439: '59:1', 69440: '59:1', 69441: '59:1', 69452: '62:1', 69453: '67:2', 69454: '67:1', 69317: '11:1', 69319: '10:1', 69320: '10:1'}
aitems = []
for i, cand in ADDR.items():
    it = item(i, 'ADDRESS', candidate=cand)
    ed, book = it['extra']['ed'], it['extra']['book']
    it['candidate_text'] = L[f"{ed}|{book}|{cand}"]
    it['live_named'] = named(ed, book, it['old_note'])
    aitems.append(it)
json.dump(aitems, open(P/'address.json', 'w'), ensure_ascii=False, indent=1)
print('rebuild', len(items), '| patches', len(pitems), '| summaries', len(sitems), '| address', len(aitems))
print('rebuild member rows', sum(len(i['members']) for i in items), 'same-as-card', sum(1 for i in items for m in i['members'] if m['same_as_card']))
