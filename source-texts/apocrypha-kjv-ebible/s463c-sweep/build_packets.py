"""S463c — build the work packets from the Oct 23 read-back + regrade.
Packets (JSON lists) under packets/:
  rebuild_NN.json   — cards whose note carries degraded prose / hyphen-chains: full rebuild, Come-and-See (agents write new_note + member_note)
  requote.json      — cards whose Apocrypha quotation is off the live text (not degraded): re-quote verbatim / re-point / cite range
  gloss454.json     — glosses on the verses S454 changed (Rest of Esther 10:5–13, 13:7): read by content, stay or move
  members_requote.json — member notes (not on a rebuilt card) whose quote is off the live text
  summaries.json    — thread summaries anchored in scope that carry degraded markers / off quotes / slug citations
  slug_cites.json   — cards (not otherwise touched) whose citation prints the database slug: mechanical fix, listed for the record
Every packet item carries the FULL live text of both verses (canon from canon.json)."""
import json, re, collections
from pathlib import Path
IN = Path('in'); P = Path('packets'); P.mkdir(exist_ok=True)
live = json.load(open(IN/'apocrypha-cards-live.json')); L = live['live']
R = json.load(open(IN/'regrade.json')); RM = json.load(open(IN/'regrade_members.json')); RT = json.load(open(IN/'regrade_threads.json'))
C = {c['id']: c for c in live['cards']}
members_by_card = collections.defaultdict(list)
for m in live['members']: members_by_card[m['xref_id']].append(m)
T = {t['id']: t for t in live['threads']}

# English book names for citations (the voice skill: conventional English, every time)
EN = {'1-esdras': '1 Esdras', '2-esdras': '2 Esdras', 'tobit': 'Tobit', 'judith': 'Judith', 'the-rest-of-esther': 'The Rest of Esther',
      'the-wisdom-of-solomon': 'Wisdom of Solomon', 'ecclesiasticus': 'Ecclesiasticus', 'baruch-with-the-letter-of-jeremiah': 'Baruch',
      'the-song-of-the-three-holy-children': 'Song of the Three Holy Children', 'the-history-of-susanna': 'Susanna',
      'bel-and-the-dragon': 'Bel and the Dragon', 'the-prayer-of-manasseh': 'Prayer of Manasseh', '1-maccabees': '1 Maccabees',
      '2-maccabees': '2 Maccabees', '3-maccabees': '3 Maccabees'}
CANON_EN = {'genesis': 'Genesis', 'exodus': 'Exodus', 'leviticus': 'Leviticus', 'numbers': 'Numbers', 'deuteronomy': 'Deuteronomy', 'joshua': 'Joshua',
            'judges': 'Judges', 'ruth': 'Ruth', '1-samuel': '1 Samuel', '2-samuel': '2 Samuel', '1-kings': '1 Kings', '2-kings': '2 Kings',
            '1-chronicles': '1 Chronicles', '2-chronicles': '2 Chronicles', 'ezra': 'Ezra', 'nehemiah': 'Nehemiah', 'esther': 'Esther', 'job': 'Job',
            'psalms': 'Psalm', 'proverbs': 'Proverbs', 'ecclesiastes': 'Ecclesiastes', 'song-of-solomon': 'Song of Solomon', 'isaiah': 'Isaiah',
            'jeremiah': 'Jeremiah', 'lamentations': 'Lamentations', 'ezekiel': 'Ezekiel', 'daniel': 'Daniel', 'hosea': 'Hosea', 'joel': 'Joel',
            'amos': 'Amos', 'obadiah': 'Obadiah', 'jonah': 'Jonah', 'micah': 'Micah', 'nahum': 'Nahum', 'habakkuk': 'Habakkuk', 'zephaniah': 'Zephaniah',
            'haggai': 'Haggai', 'zechariah': 'Zechariah', 'malachi': 'Malachi', 'matthew': 'Matthew', 'mark': 'Mark', 'luke': 'Luke', 'john': 'John',
            'acts': 'Acts', 'romans': 'Romans', '1-corinthians': '1 Corinthians', '2-corinthians': '2 Corinthians', 'galatians': 'Galatians',
            'ephesians': 'Ephesians', 'philippians': 'Philippians', 'colossians': 'Colossians', '1-thessalonians': '1 Thessalonians',
            '2-thessalonians': '2 Thessalonians', '1-timothy': '1 Timothy', '2-timothy': '2 Timothy', 'titus': 'Titus', 'philemon': 'Philemon',
            'hebrews': 'Hebrews', 'james': 'James', '1-peter': '1 Peter', '2-peter': '2 Peter', '1-john': '1 John', '2-john': '2 John', '3-john': '3 John',
            'jude': 'Jude', 'revelation': 'Revelation'}
EXTRA_EN = {'jubilees': 'Jubilees', 'enoch': '1 Enoch', '1-enoch': '1 Enoch', 'jasher': 'Jasher', '2-enoch': '2 Enoch', 'testaments-xii': 'Testaments of the Twelve Patriarchs',
            '2-baruch': '2 Baruch', '3-baruch': '3 Baruch', 'adam-eve': 'Conflict of Adam and Eve', '4-maccabees': '4 Maccabees', 'apocalypse-of-abraham': 'Apocalypse of Abraham',
            'ascension-isaiah': 'Ascension of Isaiah', 'sonnini-acts-29': 'Acts 29 (Sonnini)'}
def en(ed, book):
    if ed == 'canon': return CANON_EN.get(book, book)
    if book in EN: return EN[book]
    return EXTRA_EN.get(book, book.replace('-', ' ').title())
json.dump({'apocrypha': EN, 'canon': CANON_EN, 'extras': EXTRA_EN}, open(P/'book_names.json', 'w'), indent=1)

canon = {}
for b in json.load(open(IN/'canon.json'))['books']:
    for ch in b['chapters']:
        for v in ch['verses']: canon[(b['book_id'], ch['number'], v['number'])] = v['text']
print('canon verses', len(canon))

def other_end(c, side):
    ed, book, ch, vn, txt = (c['s_ed'], c['s_book'], c['s_ch'], c['s_vn'], c['s_text']) if side == 'T' else (c['t_ed'], c['t_book'], c['t_ch'], c['t_vn'], c['t_text'])
    return dict(ed=ed, book=book, ch=ch, vn=vn, cite=f"{en(ed, book)} {ch}:{vn}", text_db=txt, text_canon=canon.get((book, ch, vn)) if ed == 'canon' else None)
def apoc_end(o):
    book, cv = o['addr'].split('|'); ch, vn = map(int, cv.split(':'))
    return dict(book=book, ch=ch, vn=vn, cite=f"{EN[book]} {ch}:{vn}", text=L[o['addr']],
                prev=L.get(f"{book}|{ch}:{vn-1}"), next=L.get(f"{book}|{ch}:{vn+1}"))
def member_rows(i):
    return [dict(thread_id=m['thread_id'], slug=m['slug'], old=m['member_note']) for m in members_by_card.get(i, [])]

def item(o, kind):
    c = C[o['id']]
    return dict(id=o['id'], kind=kind, side=o['side'], apoc=apoc_end(o), other=other_end(c, o['side']), old_note=o['note'],
                regrade=dict(verdict=o['verdict'], quote=o.get('quote'), labelled=o.get('labelled'), proposed=o.get('proposed'), ratio=o.get('ratio'),
                             live_proposed=o.get('live_proposed'), degraded=o['degraded'], hyphen_chain=o['hyphen_chain'], slug_cite=o['slug_cite']),
                members=member_rows(o['id']))

anch = [o for o in R if o['verdict'] != 'MENTION_ONLY']
rebuild = [o for o in anch if o['degraded'] or o['hyphen_chain']]
rebuild_ids = {o['id'] for o in rebuild}
requote = [o for o in anch if o['id'] not in rebuild_ids and o['verdict'] in ('REWORDED', 'RE_ANCHOR', 'RE_ANCHOR_REWORDED', 'NOT_FOUND')]
CHANGED = {('the-rest-of-esther', 10, v) for v in range(4, 14)} | {('the-rest-of-esther', 11, 1), ('the-rest-of-esther', 13, 7), ('2-esdras', 14, 48), ('1-maccabees', 5, 35)}
gloss454 = [o for o in anch if o['id'] not in rebuild_ids and (C[o['id']]['t_book'], C[o['id']]['t_ch'], C[o['id']]['t_vn']) in CHANGED or (C[o['id']]['s_book'], C[o['id']]['s_ch'], C[o['id']]['s_vn']) in CHANGED]
touched = rebuild_ids | {o['id'] for o in requote} | {o['id'] for o in gloss454}
slug_only = [o for o in anch if o['slug_cite'] and o['id'] not in touched]

# rebuild packets: by book, ~40 cards each
rebuild.sort(key=lambda o: (o['book'], int(o['addr'].split('|')[1].split(':')[0]), int(o['addr'].split(':')[1])))
n = 0; items = [item(o, 'REBUILD') for o in rebuild]
for k in range(0, len(items), 40):
    json.dump(items[k:k+40], open(P/f'rebuild_{n:02d}.json', 'w'), ensure_ascii=False, indent=1); n += 1
json.dump([item(o, 'REQUOTE') for o in requote], open(P/'requote.json', 'w'), ensure_ascii=False, indent=1)
json.dump([item(o, 'GLOSS454') for o in gloss454], open(P/'gloss454.json', 'w'), ensure_ascii=False, indent=1)
json.dump([item(o, 'SLUG') for o in slug_only], open(P/'slug_cites.json', 'w'), ensure_ascii=False, indent=1)

# member notes off the live text, on cards NOT being rebuilt (rebuilt cards get a fresh member note with the card)
mreq = []
for m in RM:
    if m['verdict'] in ('REWORDED', 'OFF') and m['xref'] not in rebuild_ids:
        c = C.get(m['xref'])
        if not c: continue
        mreq.append(dict(thread_id=m['thread'], slug=m['slug'], xref_id=m['xref'], side=m['side'], apoc=apoc_end(dict(addr=m['addr'])) if m['addr'] in L else None,
                         labelled=m['labelled'], quote=m['quote'], ratio=m['ratio'], old=m['note'], other=other_end(c, m['side']), degraded=m['degraded'] or m['hyphen_chain']))
json.dump(mreq, open(P/'members_requote.json', 'w'), ensure_ascii=False, indent=1)
# flagged member notes on cards NOT being rebuilt and not off-quote — rebuild the short note alone
mflag = []
for m in RM:
    if (m['degraded'] or m['hyphen_chain'] or m['slug_cite']) and m['verdict'] != 'MENTION_ONLY' and m['xref'] not in rebuild_ids and m['verdict'] not in ('REWORDED', 'OFF'):
        c = C.get(m['xref'])
        if not c: continue
        mflag.append(dict(thread_id=m['thread'], slug=m['slug'], xref_id=m['xref'], side=m['side'], apoc=apoc_end(dict(addr=m['addr'])) if m['addr'] in L else None,
                          old=m['note'], other=other_end(c, m['side']), card_note=c['note']))
json.dump(mflag, open(P/'members_flagged.json', 'w'), ensure_ascii=False, indent=1)

# summaries
summ = []
for t in RT:
    if not t['anchored']: continue
    if t['degraded'] or t['hyphen_chain'] or t['slug_cite'] or t['off']:
        tt = T[t['id']]
        cites = re.findall(r"\(([A-Za-z0-9 .'()\-]+?) (\d+):(\d+)(?:\s*[–-]\s*\d+)?\)", tt['summary_md'] or '')
        summ.append(dict(thread_id=t['id'], slug=t['slug'], title=tt['title'], anchor=t['anchor'], old=tt['summary_md'], off_quotes=t['off'],
                         degraded=t['degraded'], hyphen_chain=t['hyphen_chain'], slug_cite=t['slug_cite'],
                         live_text={f"{EN[a.split('|')[0]]} {a.split('|')[1]}": L[a] for a in sorted({f"{tt['a_book']}|{tt['a_ch']}:{tt['a_vn']}"} | {x['addr'] for x in t['off']}) if a in L}))
json.dump(summ, open(P/'summaries.json', 'w'), ensure_ascii=False, indent=1)

print('rebuild', len(rebuild), 'packets', n, '| requote', len(requote), '| gloss454', len(gloss454), '| slug-only', len(slug_only),
      '| member requotes', len(mreq), '| member flagged (card not rebuilt)', len(mflag), '| summaries', len(summ))
print('rebuild member rows', sum(len(i['members']) for i in items))
print('other ends of rebuild set without canon text (extras):', sum(1 for i in items if i['other']['ed'] != 'canon'))
