"""S463e — build the work packets from the Oct 26 pseudepigrapha read-back + regrade (eight clean books; held books excluded).
Packets (JSON lists) under packets/:
  rebuild_NN.json       — cards whose note carries degraded prose / hyphen-chains / Hebrew book names: full rebuild, Come-and-See
  canon_requote.json    — cards whose CANON lead quotation is off canon.json (NT-Lord rule, Yoshi renderings): re-quote verbatim, prose kept
  address.json          — cards whose extra-book italic quotation is off the cited verse, or whose prose cites a Testaments XII chapter
                          under the old numbering, or member notes (not identical to the card note, not on a rebuilt card) with an off quote:
                          read by content → CITE_FIX / REQUOTE / MOVE / STAY
  phrases.json          — cards whose short quoted phrases in the prose were not found at the card's verse (+ the 4 cards on the three
                          Ascension of Isaiah verses S440 changed): read by content → STAY / PATCH
  members_flagged.json  — member notes (not on a rebuilt card, not identical to the card note) carrying markers / chains
  summaries.json        — thread summaries anchored in these books with markers / chains / off quotations
Slug citations ("1-adam-eve 5:11", "apocalypse-of-abraham 9:6") are mechanical (assemble.py) and are not packeted.
Every packet item carries the FULL live text of both verses (canon from canon.json)."""
import json, re, collections
from pathlib import Path
IN = Path('in'); P = Path('packets'); P.mkdir(exist_ok=True)
live = json.load(open(IN/'pseud-cards-live.json')); L = live['live']
R = json.load(open('regrade.json')); RM = json.load(open('regrade_members.json')); RT = json.load(open('regrade_threads.json'))
C = {c['id']: c for c in live['cards']}
members_by_card = collections.defaultdict(list)
for m in live['members']: members_by_card[m['xref_id']].append(m)
T = {t['id']: t for t in live['threads']}
EDS = {'pseudepigrapha', 'adam-eve-conflict', 'apocalypse-of-abraham', 'ascension-isaiah'}
HELD = {'adam-eve', '4-maccabees', '3-maccabees'}
canon = {}; CANON_EN = {}
for b in json.load(open(IN/'canon.json'))['books']:
    CANON_EN[b['book_id']] = b['book_title']
    for ch in b['chapters']:
        for v in ch['verses']: canon[(b['book_id'], ch['number'], v['number'])] = v['text']
XEN = {'2-enoch': '2 Enoch', 'testaments-xii': 'Testaments of the Twelve Patriarchs', '2-baruch': '2 Baruch', '3-baruch': '3 Baruch',
       '4-maccabees': '4 Maccabees', '3-maccabees': '3 Maccabees', 'adam-eve': 'Books of Adam and Eve', '1-adam-eve': '1 Adam and Eve',
       '2-adam-eve': '2 Adam and Eve', 'apocalypse-of-abraham': 'Apocalypse of Abraham', 'ascension-isaiah': 'Ascension of Isaiah',
       'jubilees': 'Jubilees', '1-enoch': '1 Enoch', 'jasher': 'Jasher', 'the-wisdom-of-solomon': 'Wisdom of Solomon', 'ecclesiasticus': 'Ecclesiasticus',
       '2-maccabees': '2 Maccabees', '1-maccabees': '1 Maccabees', 'tobit': 'Tobit', 'judith': 'Judith', 'the-prayer-of-manasseh': 'Prayer of Manasseh',
       '1-esdras': '1 Esdras', '2-esdras': '2 Esdras', 'baruch-with-the-letter-of-jeremiah': 'Baruch', 'the-rest-of-esther': 'The Rest of Esther'}
T_RANGES = {}; _s = 1
for t, n in zip(['Reuben', 'Simeon', 'Levi', 'Judah', 'Issachar', 'Zebulun', 'Dan', 'Naphtali', 'Gad', 'Asher', 'Joseph', 'Benjamin'], [7, 9, 19, 26, 7, 10, 7, 9, 8, 8, 20, 12]):
    T_RANGES[t] = (_s, _s + n - 1); _s += n
def testament_of(ch):
    for t, (lo, hi) in T_RANGES.items():
        if lo <= ch <= hi: return f"{t} {ch - lo + 1}"
def en(ed, book): return CANON_EN.get(book, book) if ed == 'canon' else XEN.get(book, book.replace('-', ' ').title())
json.dump({'canon': CANON_EN, 'extras': XEN, 'testaments_xii_ranges': T_RANGES}, open(P/'book_names.json', 'w'), indent=1)

def other_end(c, side):
    ed, book, ch, vn, txt = (c['s_ed'], c['s_book'], c['s_ch'], c['s_vn'], c['s_text']) if side == 'T' else (c['t_ed'], c['t_book'], c['t_ch'], c['t_vn'], c['t_text'])
    return dict(ed=ed, book=book, ch=ch, vn=vn, cite=f"{en(ed, book)} {ch}:{vn}", text_db=txt, text_canon=canon.get((book, ch, vn)) if ed == 'canon' else None)
def extra_end(addr):
    ed, book, cv = addr.split('|'); ch, vn = map(int, cv.split(':'))
    d = dict(ed=ed, book=book, name=en(ed, book), ch=ch, vn=vn, cite=f"{en(ed, book)} {ch}:{vn}", text=L[addr],
             prev=L.get(f"{ed}|{book}|{ch}:{vn-1}"), next=L.get(f"{ed}|{book}|{ch}:{vn+1}"))
    if book == 'testaments-xii': d['testament'] = testament_of(ch)
    return d
def member_rows(i): return [dict(thread_id=m['thread_id'], slug=m['slug'], old=m['member_note'], same_as_card=(m['member_note'] or '') == (C[i]['note'] or '')) for m in members_by_card.get(i, [])]
def item(o, kind, **extra):
    c = C[o['id']]
    return dict(id=o['id'], kind=kind, side=o['side'], extra=extra_end(o['addr']), other=other_end(c, o['side']), old_note=o['note'],
                regrade=dict(verdict=o['verdict'], quotes=o.get('quotes', []), phrases=o.get('phrases', []), canon_lead=o.get('canon_lead'),
                             degraded=o['degraded'], hyphen_chain=o['hyphen_chain'], chains=o['chains'], t_range_bad=o['t_range_bad']),
                members=member_rows(o['id']), **extra)

anch = [o for o in R if o['verdict'] != 'MENTION_ONLY' and not o['held']]
rebuild = [o for o in anch if o['degraded'] or o['hyphen_chain'] or o['hebrew_book']]
rebuild_ids = {o['id'] for o in rebuild}
canon_req = [o for o in anch if o['id'] not in rebuild_ids and (o['canon_lead'] or {}).get('verdict') in ('OFF', 'REWORDED', 'NO_SUCH_VERSE')]
canon_ids = {o['id'] for o in canon_req}
address = [o for o in anch if o['id'] not in rebuild_ids and (o['verdict'] in ('REWORDED', 'RE_ANCHOR', 'RE_ANCHOR_REWORDED', 'NOT_FOUND') or o['t_range_bad'])]
address_ids = {o['id'] for o in address}
S440 = {'ascension-isaiah|ascension-isaiah|3:15', 'ascension-isaiah|ascension-isaiah|4:14', 'ascension-isaiah|ascension-isaiah|4:15'}
phrases = [o for o in anch if o['id'] not in rebuild_ids and o['id'] not in address_ids and (any(p['verdict'] != 'STAND' for p in o['phrases']) or o['addr'] in S440)]

rebuild.sort(key=lambda o: (o['book'], int(o['addr'].rsplit('|', 1)[1].split(':')[0]), int(o['addr'].split(':')[1])))
items = [item(o, 'REBUILD') for o in rebuild]; n = 0
for k in range(0, len(items), 19):
    json.dump(items[k:k+19], open(P/f'rebuild_{n:02d}.json', 'w'), ensure_ascii=False, indent=1); n += 1
json.dump([item(o, 'CANON_REQUOTE') for o in canon_req], open(P/'canon_requote.json', 'w'), ensure_ascii=False, indent=1)

# address packet: cards + member notes with an off quote (member note differs from card note, card not rebuilt)
addr_items = [item(o, 'ADDRESS') for o in address]
for m in RM:
    if m.get('verdict') in (None, 'MENTION_ONLY') or m.get('held'): continue
    if m['verdict'] not in ('OFF', 'REWORDED') or m['xref'] in rebuild_ids: continue
    c = C.get(m['xref'])
    if not c or (m['note'] or '') == (c['note'] or ''): continue   # identical member notes ride with the card
    if m['xref'] in address_ids: continue
    addr_items.append(dict(id=m['xref'], kind='MEMBER_ADDRESS', thread_id=m['thread'], slug=m['slug'], side=m['side'], extra=extra_end(m['addr']),
                           other=other_end(c, m['side']), old_note=m['note'], card_note=c['note'],
                           regrade=dict(verdict=m['verdict'], quotes=m['quotes'], t_range_bad=m['t_range_bad']), members=[]))
# give every address item the live text of any verse its prose or labels name in the extra book (so the reader can check without a lookup)
for it in addr_items:
    ed, book = it['extra']['ed'], it['extra']['book']
    cited = {}
    for q in it['regrade']['quotes']:
        for a in (q.get('at'), q.get('proposed')):
            if a and a in L: cited[a.rsplit('|', 1)[1]] = L[a]
    for m in re.finditer(r"(\d+):(\d+)", it['old_note']):
        a = f"{ed}|{book}|{m.group(1)}:{m.group(2)}"
        if a in L: cited[f"{m.group(1)}:{m.group(2)}"] = L[a]
    it['live_named'] = cited
json.dump(addr_items, open(P/'address.json', 'w'), ensure_ascii=False, indent=1)
json.dump([item(o, 'PHRASES', s440=(o['addr'] in S440)) for o in phrases], open(P/'phrases.json', 'w'), ensure_ascii=False, indent=1)

mflag = []
for m in RM:
    if m.get('verdict') in (None, 'MENTION_ONLY') or m.get('held') or m['xref'] in rebuild_ids: continue
    c = C.get(m['xref'])
    if not c or (m['note'] or '') == (c['note'] or ''): continue
    if m['degraded'] or m['hyphen_chain']:
        mflag.append(dict(thread_id=m['thread'], slug=m['slug'], xref_id=m['xref'], side=m['side'], extra=extra_end(m['addr']), old=m['note'],
                          other=other_end(c, m['side']), card_note=c['note'], chains=m['chains']))
json.dump(mflag, open(P/'members_flagged.json', 'w'), ensure_ascii=False, indent=1)

summ = []
for t in RT:
    if not t['anchored'] or t['held']: continue
    if not (t['degraded'] or t['hyphen_chain'] or t['off'] or t['hebrew_book']): continue
    tt = T[t['id']]; ed, book = t['book'].split('|')
    addrs = {f"{ed}|{book}|{tt['a_ch']}:{tt['a_vn']}"} | {x['addr'] for x in t['off']}
    if tt['z_vn'] and tt['z_ch'] == tt['a_ch']:
        for v in range(tt['a_vn'], min(tt['z_vn'], tt['a_vn'] + 40) + 1): addrs.add(f"{ed}|{book}|{tt['a_ch']}:{v}")
    for m in re.finditer(r"(\d+):(\d+)(?:\s*[–-]\s*(\d+))?", tt['summary_md'] or ''):
        addrs.add(f"{ed}|{book}|{m.group(1)}:{m.group(2)}")
        if m.group(3):
            for v in range(int(m.group(2)), int(m.group(3)) + 1): addrs.add(f"{ed}|{book}|{m.group(1)}:{v}")
    summ.append(dict(thread_id=t['id'], slug=t['slug'], title=tt['title'], book=en(ed, book), anchor=t['anchor'], old=tt['summary_md'], off_quotes=t['off'],
                     degraded=t['degraded'], hyphen_chain=t['hyphen_chain'], chains=t['chains'],
                     live_text={f"{en(ed, book)} {a.rsplit('|', 1)[1]}": L[a] for a in sorted(addrs, key=lambda a: tuple(map(int, a.rsplit('|', 1)[1].split(':')))) if a in L}))
json.dump(summ, open(P/'summaries.json', 'w'), ensure_ascii=False, indent=1)
print('rebuild', len(rebuild), 'packets', n, '| canon requote', len(canon_req), '| address', len(address), 'cards +', len(addr_items) - len(address), 'member notes',
      '| phrases', len(phrases), '| member flagged (own text)', len(mflag), '| summaries', len(summ), '(off-quote', sum(1 for s in summ if s['off_quotes']), 'marker/chain', sum(1 for s in summ if s['degraded'] or s['hyphen_chain']), ')')
print('rebuild member rows', sum(len(i['members']) for i in items), '| rebuild other ends not canon:', sum(1 for i in items if i['other']['ed'] != 'canon'))
print('rebuild by book:', dict(collections.Counter(o['book'] for o in rebuild)))
