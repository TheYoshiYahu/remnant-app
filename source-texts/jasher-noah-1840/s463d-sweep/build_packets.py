"""S463d — build the work packets from the Oct 23 Jasher read-back + regrade.
Packets (JSON lists) under packets/:
  rebuild_NN.json      — cards whose note carries degraded prose / hyphen-chains: full rebuild, Come-and-See
  requote.json         — cards whose Jasher quotation (or canon lead quote) is off the live text: re-quote verbatim, prose kept
  gloss450.json        — glosses on the verses S450 changed or split out (the 20 moved cards + 17 on corrected verses): read by content, stay or move
  stale.json           — notes whose prose names a Jasher verse 2+ away from the card's address: read which is right
  members_requote.json — member notes (not on a rebuilt card) whose quote is off the live text
  members_flagged.json — member notes (not on a rebuilt card) carrying markers / chains
  summaries.json       — thread summaries anchored in Jasher with markers / chains / off quotations
Every packet item carries the FULL live text of both verses (canon from canon.json)."""
import json, re, collections
from pathlib import Path
IN = Path('in'); P = Path('packets'); P.mkdir(exist_ok=True)
live = json.load(open(IN/'jasher-cards-live.json')); L = live['live']
R = json.load(open(IN/'regrade.json')); RM = json.load(open(IN/'regrade_members.json')); RT = json.load(open(IN/'regrade_threads.json'))
C = {c['id']: c for c in live['cards']}
members_by_card = collections.defaultdict(list)
for m in live['members']: members_by_card[m['xref_id']].append(m)
T = {t['id']: t for t in live['threads']}
names = json.load(open(IN/'book_names.json')); CANON_EN = names['canon']; APOC_EN = names['apocrypha']; XEN = names['extras']
XEN.update({'jasher': 'Jasher', 'adam-eve': 'Conflict of Adam and Eve', '1-adam-eve': 'First Book of Adam and Eve',
            '2-adam-eve': 'Second Book of Adam and Eve', '2-enoch': '2 Enoch', '1-enoch': '1 Enoch'})
def en(ed, book):
    if ed == 'canon': return CANON_EN.get(book, book)
    if book in APOC_EN: return APOC_EN[book]
    return XEN.get(book, book.replace('-', ' ').title())
json.dump({'canon': CANON_EN, 'apocrypha': APOC_EN, 'extras': XEN}, open(P/'book_names.json', 'w'), indent=1)
canon = {}
for b in json.load(open(IN/'canon.json'))['books']:
    for ch in b['chapters']:
        for v in ch['verses']: canon[(b['book_id'], ch['number'], v['number'])] = v['text']
print('canon verses', len(canon), '| other-end books in scope:', collections.Counter((c['t_ed'], c['t_book']) if c['s_ed']=='jasher' else (c['s_ed'], c['s_book']) for c in live['cards'] if c['s_ed']=='jasher' or c['t_ed']=='jasher' if (c['t_ed'] if c['s_ed']=='jasher' else c['s_ed'])!='canon'))

def other_end(c, side):
    ed, book, ch, vn, txt = (c['s_ed'], c['s_book'], c['s_ch'], c['s_vn'], c['s_text']) if side == 'T' else (c['t_ed'], c['t_book'], c['t_ch'], c['t_vn'], c['t_text'])
    return dict(ed=ed, book=book, ch=ch, vn=vn, cite=f"{en(ed, book)} {ch}:{vn}", text_db=txt, text_canon=canon.get((book, ch, vn)) if ed == 'canon' else None)
def jasher_end(addr):
    book, cv = addr.split('|'); ch, vn = map(int, cv.split(':'))
    return dict(book=book, ch=ch, vn=vn, cite=f"Jasher {ch}:{vn}", text=L[addr], prev=L.get(f"{book}|{ch}:{vn-1}"), next=L.get(f"{book}|{ch}:{vn+1}"))
def member_rows(i):
    return [dict(thread_id=m['thread_id'], slug=m['slug'], old=m['member_note']) for m in members_by_card.get(i, [])]
def item(o, kind, **extra):
    c = C[o['id']]
    return dict(id=o['id'], kind=kind, side=o['side'], jasher=jasher_end(o['addr']), other=other_end(c, o['side']), old_note=o['note'],
                regrade=dict(verdict=o['verdict'], quotes=o.get('quotes', []), degraded=o['degraded'], hyphen_chain=o['hyphen_chain'], chains=o['chains']),
                members=member_rows(o['id']), **extra)

anch = [o for o in R if o['verdict'] != 'MENTION_ONLY']
rebuild = [o for o in anch if o['degraded'] or o['hyphen_chain']]
rebuild_ids = {o['id'] for o in rebuild}
requote = [o for o in anch if o['id'] not in rebuild_ids and o['verdict'] in ('REWORDED', 'RE_ANCHOR', 'RE_ANCHOR_REWORDED', 'NOT_FOUND')]
requote_ids = {o['id'] for o in requote}
# the one canon lead quote off canon.json (30027 Matthew 4:10) rides as a requote too
CANON_OFF = [30027]
for i in CANON_OFF:
    o = next(x for x in anch if x['id'] == i)
    if i not in rebuild_ids and i not in requote_ids: requote.append(o); requote_ids.add(i)
chg = json.load(open('/mnt/user-data/uploads/Desktop/App/source-texts/jasher-noah-1840/jasher-changed-verses.json'))
CHANGED = {f"jasher|{a}:{b}": k for a, b, k in chg}
gloss450 = [o for o in anch if o['id'] not in rebuild_ids and o['addr'] in CHANGED]
stale = []
for o in anch:
    if o['id'] in rebuild_ids or o['id'] in requote_ids: continue
    cited = set(re.findall(r"Jasher (\d+:\d+)", o['note'])); mine = o['addr'].split('|')[1]
    if cited and mine not in cited and not any(c.split(':')[0] == mine.split(':')[0] and abs(int(c.split(':')[1]) - int(mine.split(':')[1])) <= 1 for c in cited):
        stale.append((o, sorted(cited)))

rebuild.sort(key=lambda o: (int(o['addr'].split('|')[1].split(':')[0]), int(o['addr'].split(':')[1])))
items = [item(o, 'REBUILD') for o in rebuild]; n = 0
for k in range(0, len(items), 27):
    json.dump(items[k:k+27], open(P/f'rebuild_{n:02d}.json', 'w'), ensure_ascii=False, indent=1); n += 1
json.dump([item(o, 'REQUOTE', canon_off=(o['id'] in CANON_OFF)) for o in requote], open(P/'requote.json', 'w'), ensure_ascii=False, indent=1)
json.dump([item(o, 'GLOSS450', s450=CHANGED[o['addr']]) for o in gloss450], open(P/'gloss450.json', 'w'), ensure_ascii=False, indent=1)
json.dump([dict(item(o, 'STALE'), cited=cv, cited_text={c: L.get(f"jasher|{c}") for c in cv}) for o, cv in stale], open(P/'stale.json', 'w'), ensure_ascii=False, indent=1)

mreq = []; mflag = []
for m in RM:
    if m.get('verdict') in (None, 'MENTION_ONLY') or m['xref'] in rebuild_ids: continue
    c = C.get(m['xref'])
    if not c: continue
    row = dict(thread_id=m['thread'], slug=m['slug'], xref_id=m['xref'], side=m['side'], jasher=jasher_end(m['addr']), old=m['note'],
               other=other_end(c, m['side']), card_note=c['note'], quotes=m.get('quotes', []), degraded=m['degraded'] or m['hyphen_chain'], chains=m['chains'])
    if m['verdict'] in ('REWORDED', 'OFF'): mreq.append(row)
    elif m['degraded'] or m['hyphen_chain'] or m['slug_cite']: mflag.append(row)
json.dump(mreq, open(P/'members_requote.json', 'w'), ensure_ascii=False, indent=1)
json.dump(mflag, open(P/'members_flagged.json', 'w'), ensure_ascii=False, indent=1)

FALSE_SUBSTANCE = {6295, 8940}   # "substance" = goods (Genesis 13:6 / 15:14 sense), not jargon
summ = []
for t in RT:
    if not t['anchored']: continue
    flagged = (t['degraded'] and t['id'] not in FALSE_SUBSTANCE) or t['hyphen_chain'] or t['slug_cite'] or t['off']
    if not flagged: continue
    tt = T[t['id']]
    cited = set(re.findall(r"Jasher (\d+):(\d+)(?:\s*[–-]\s*(\d+))?", tt['summary_md'] or ''))
    addrs = {f"jasher|{tt['a_ch']}:{tt['a_vn']}"} | {x['addr'] for x in t['off']}
    if tt['z_vn'] and tt['z_ch'] == tt['a_ch']:                       # the whole anchor range (so off quotes can be re-cited to the verse the words now sit in)
        for v in range(tt['a_vn'], min(tt['z_vn'], tt['a_vn'] + 40) + 1): addrs.add(f"jasher|{tt['a_ch']}:{v}")
    for a, b, z in cited:
        addrs.add(f"jasher|{a}:{b}")
        if z:
            for v in range(int(b), int(z)+1): addrs.add(f"jasher|{a}:{v}")
    summ.append(dict(thread_id=t['id'], slug=t['slug'], title=tt['title'], anchor=t['anchor'], old=tt['summary_md'], off_quotes=t['off'],
                     degraded=t['degraded'] and t['id'] not in FALSE_SUBSTANCE, hyphen_chain=t['hyphen_chain'], chains=t['chains'],
                     live_text={f"Jasher {a.split('|')[1]}": L[a] for a in sorted(addrs, key=lambda a: tuple(map(int, a.split('|')[1].split(':')))) if a in L}))
json.dump(summ, open(P/'summaries.json', 'w'), ensure_ascii=False, indent=1)
print('rebuild', len(rebuild), 'packets', n, '| requote', len(requote), '| gloss450', len(gloss450), '| stale', len(stale),
      '| member requotes', len(mreq), '| member flagged (card not rebuilt)', len(mflag), '| summaries', len(summ), '(off-quote', sum(1 for s in summ if s['off_quotes']), 'marker/chain', sum(1 for s in summ if s['degraded'] or s['hyphen_chain']), ')')
print('rebuild member rows', sum(len(i['members']) for i in items), '| rebuild other ends not canon:', sum(1 for i in items if i['other']['ed'] != 'canon'))
