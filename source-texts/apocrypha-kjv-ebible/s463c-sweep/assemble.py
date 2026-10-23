"""S463c — assemble fix_cards.json / fix_members.json / fix_summaries.json from the agents' outputs, validating every row by content:
 - a rebuilt note carries the live Apocrypha verse (at its new address) verbatim and the other verse verbatim (canon from canon.json);
 - no jargon / hyphen-chain / slug citation outside the italic scripture spans; no Hebrew book names in citations;
 - every member note's italic phrase is a verbatim substring of the live Apocrypha verse;
 - slug-citation-only cards fixed mechanically (slug → English name) and listed.
Prints what fails; writes nothing to the Desktop."""
import json, re, collections, sys
from pathlib import Path
IN = Path('in'); P = Path('packets'); O = Path('out'); F = Path('fix'); F.mkdir(exist_ok=True)
live = json.load(open(IN/'apocrypha-cards-live.json')); L = live['live']
C = {c['id']: c for c in live['cards']}
members_by_card = collections.defaultdict(list)
for m in live['members']: members_by_card[m['xref_id']].append(m)
T = {t['id']: t for t in live['threads']}
names = json.load(open(P/'book_names.json')); EN = names['apocrypha']; CEN = names['canon']; XEN = names['extras']
canon = {}
for b in json.load(open(IN/'canon.json'))['books']:
    for ch in b['chapters']:
        for v in ch['verses']: canon[(b['book_id'], ch['number'], v['number'])] = v['text']
EN2SLUG = {v: k for k, v in EN.items()}
JARGON = re.compile(r'wisdom-stream|the framework|Red Line|apparatus|\bsubstance\b|FRAMEWORK-MAJOR|\blocked\b|\bS\d{2,3}\b|Yoshi|verbal-anchor|\b\w+(?:-\w+){3,}\b', re.I)
SLUG = re.compile(r"\b(1-esdras|2-esdras|the-rest-of-esther|the-wisdom-of-solomon|baruch-with-the-letter-of-jeremiah|the-song-of-the-three-holy-children|the-history-of-susanna|bel-and-the-dragon|the-prayer-of-manasseh|[123]-maccabees|ecclesiasticus|tobit|judith) (\d+):(\d+)")
HEBREW_BOOK = re.compile(r"\b(Bereshit|Shemot|Vayikra|Bamidbar|Devarim|Tehillim|Mishlei|Mishle|Yeshayahu|Yirmeyahu|Yechezk'?el|Hoshea|Yo'el|Mattityahu|Yochanan|Hitgalut|Ivrim|Galatim|Romim) \d+")
def outside_italics(s): return re.sub(r"\*[^*]+\*", " ", s or '')
def problems(note, apoc_addr, other):
    p = []
    if L[apoc_addr] not in note: p.append('apoc verse not verbatim')
    ot = canon.get((other['book'], other['ch'], other['vn'])) if other['ed'] == 'canon' else other['text_db']
    if ot and ot not in note: p.append('other verse not verbatim')
    j = JARGON.findall(outside_italics(note))
    if j: p.append('jargon outside italics: ' + ','.join(j[:3]))
    if SLUG.search(note): p.append('slug citation')
    if HEBREW_BOOK.search(note): p.append('hebrew book name')
    return p
def span(addr, n=2):
    b, cv = addr.split('|'); ch, vn = map(int, cv.split(':'))
    return ' '.join(L[f"{b}|{ch}:{vn+k}"] for k in range(n) if f"{b}|{ch}:{vn+k}" in L)
def member_problems(mn, apoc_addr):
    p = []
    phs = [q.strip().rstrip('.').strip() for q in re.findall(r"\*([^*]+)\*", mn or '')]
    if not phs: return ['no italic phrase']
    if not any(ph in span(apoc_addr) for ph in phs): p.append('member phrase not verbatim')
    if JARGON.findall(outside_italics(mn)): p.append('member jargon')
    if SLUG.search(mn): p.append('member slug citation')
    return p
def cite_of(addr):
    b, cv = addr.split('|'); return f"{EN[b]} {cv}"

cards = {}; members = []; bad = []
# 1. rebuilt cards
reb_out = []
for f in sorted(O.glob('rebuild_*.json')): reb_out += json.load(open(f))
pk = {}
for f in sorted(P.glob('rebuild_*.json')):
    for x in json.load(open(f)): pk[x['id']] = x
for x in reb_out:
    it = pk[x['id']]; old = it['apoc']['book'] + f"|{it['apoc']['ch']}:{it['apoc']['vn']}"; new = x.get('move') or old
    pr = problems(x['new_note'], new, it['other']) + member_problems(x['member_note'], new)
    if pr: bad.append((x['id'], 'REBUILD', pr))
    cards[x['id']] = dict(id=x['id'], side=it['side'], old=old, new=new, kind='PROSE_MOVE' if new != old else 'PROSE', new_note=x['new_note'],
                          member_note=x['member_note'], reason=x.get('flag') or '', old_note=it['old_note'])
    for m in it['members']:
        members.append(dict(thread_id=m['thread_id'], xref_id=x['id'], old=m['old'], new=x['member_note'], kind='PROSE'))
# 2. requotes
rq = {x['id']: x for x in json.load(open(P/'requote.json'))}
for x in json.load(open(O/'requote.json')):
    it = rq[x['id']]; old = it['apoc']['book'] + f"|{it['apoc']['ch']}:{it['apoc']['vn']}"; new = x.get('move') or old
    # a requote keeps the prose; the Apocrypha quotation must now be verbatim at the new address (full verse or phrase)
    qs = re.findall(r"\*([^*]+)\*", x['new_note'])
    ok = any(q.strip().rstrip('.') in span(new) for q in qs)
    pr = [] if ok else ['no italic span verbatim at ' + new]
    j = JARGON.findall(outside_italics(x['new_note']))
    if j: pr.append('jargon: ' + ','.join(j[:3]))
    if SLUG.search(x['new_note']): pr.append('slug citation')
    if pr: bad.append((x['id'], 'REQUOTE', pr))
    kind = 'REQUOTE_MOVE' if new != old else ('CITE_RANGE' if re.search(r"\d+:\d+[–-]\d+\)", x['new_note']) else 'REQUOTE')
    cards[x['id']] = dict(id=x['id'], side=it['side'], old=old, new=new, kind=kind, new_note=x['new_note'], member_note=x.get('member_note'), reason=x.get('reason') or '', old_note=it['old_note'])
    if x.get('member_note'):
        for m in it['members']:
            mp = member_problems(x['member_note'], new)
            if mp: bad.append((x['id'], 'REQUOTE-member', mp))
            members.append(dict(thread_id=m['thread_id'], xref_id=x['id'], old=m['old'], new=x['member_note'], kind='REQUOTE'))
# 3. gloss454 — all STAY; any new_note (patched address) rides along
g454 = {x['id']: x for x in json.load(open(P/'gloss454.json'))}
for x in json.load(open(O/'gloss454.json')):
    if x['verdict'] == 'MOVE' or x.get('new_note'):
        it = g454[x['id']]; old = it['apoc']['book'] + f"|{it['apoc']['ch']}:{it['apoc']['vn']}"; new = x.get('move') or old
        cards[x['id']] = dict(id=x['id'], side=it['side'], old=old, new=new, kind='GLOSS_MOVE' if new != old else 'GLOSS_PATCH', new_note=x['new_note'] or it['old_note'], member_note=None, reason=x['reason'], old_note=it['old_note'])
# 4. members on cards not rebuilt
mreq = {(m['thread_id'], m['xref_id']): m for m in json.load(open(P/'members_requote.json'))}
mflag = {(m['thread_id'], m['xref_id']): m for m in json.load(open(P/'members_flagged.json'))}
for x in json.load(open(O/'members.json')):
    key = (x['thread_id'], x['xref_id']); src = mreq.get(key) or mflag.get(key)
    if not src: bad.append((key, 'MEMBER', ['not in packets'])); continue
    if x['xref_id'] in cards and cards[x['xref_id']]['member_note']: continue   # the card's own member note wins
    addr = src['apoc']['book'] + f"|{src['apoc']['ch']}:{src['apoc']['vn']}" if src.get('apoc') else None
    pr = member_problems(x['new'], addr) if addr else ['no apoc addr']
    if pr: bad.append((key, 'MEMBER', pr))
    members.append(dict(thread_id=x['thread_id'], xref_id=x['xref_id'], old=src['old'], new=x['new'], kind='MEMBER_REQUOTE' if key in mreq else 'MEMBER_REWRITE'))
# 5. slug-only cards: mechanical
def unslug(s): return SLUG.sub(lambda m: f"{EN[m.group(1)]} {m.group(2)}:{m.group(3)}", s)
for it in json.load(open(P/'slug_cites.json')):
    if it['id'] in cards: continue
    old = it['apoc']['book'] + f"|{it['apoc']['ch']}:{it['apoc']['vn']}"
    nn = unslug(it['old_note']); assert nn != it['old_note'] and not SLUG.search(nn)
    cards[it['id']] = dict(id=it['id'], side=it['side'], old=old, new=old, kind='SLUG', new_note=nn, member_note=None, reason='database slug printed as the citation → English book name', old_note=it['old_note'])
    for m in it['members']:
        if SLUG.search(m['old'] or '') and not any(mm['thread_id'] == m['thread_id'] and mm['xref_id'] == it['id'] for mm in members):
            members.append(dict(thread_id=m['thread_id'], xref_id=it['id'], old=m['old'], new=unslug(m['old']), kind='SLUG'))
# any remaining member rows with slug citations on cards we don't touch at all
done_members = {(m['thread_id'], m['xref_id']) for m in members}
for m in live['members']:
    if (m['thread_id'], m['xref_id']) in done_members or m['xref_id'] in cards: continue
    if SLUG.search(m['member_note'] or '') and m['xref_id'] in C:
        members.append(dict(thread_id=m['thread_id'], xref_id=m['xref_id'], old=m['member_note'], new=unslug(m['member_note']), kind='SLUG'))
# 5b. manual re-quotes found by the scratch read-back (second quotations in standing notes)
MR = json.load(open('manual_requotes.json'))
for i, subs in MR['cards'].items():
    i = int(i); c = C[i]; assert i not in cards, i
    nn = c['note']
    for a, b in subs: assert a in nn, (i, a[:40]); nn = nn.replace(a, b)
    side = 'T' if (c['t_ed'] == 'apocrypha' or c['t_book'] == '3-maccabees') else 'S'
    bk, ch, vn = (c['t_book'], c['t_ch'], c['t_vn']) if side == 'T' else (c['s_book'], c['s_ch'], c['s_vn'])
    old = f"{bk}|{ch}:{vn}"
    cards[i] = dict(id=i, side=side, old=old, new=old, kind='REQUOTE', new_note=nn, member_note=None, reason=MR['reason'], old_note=c['note'])
    for m in members_by_card[i]:
        if (m['member_note'] or '') == c['note']:
            members.append(dict(thread_id=m['thread_id'], xref_id=i, old=m['member_note'], new=nn, kind='REQUOTE'))
for mm in MR['members']:
    m = next(x for x in live['members'] if x['thread_id'] == mm['thread_id'] and x['xref_id'] == mm['xref_id'])
    assert mm['old_sub'] in m['member_note']
    members.append(dict(thread_id=mm['thread_id'], xref_id=mm['xref_id'], old=m['member_note'], new=m['member_note'].replace(mm['old_sub'], mm['new_sub']), kind='MEMBER_REQUOTE'))
# 6. summaries
summaries = []
for x in json.load(open(O/'summaries.json')):
    if not x['changed']: continue
    old = T[x['thread_id']]['summary_md']
    if SLUG.search(x['new']): bad.append((x['thread_id'], 'SUMMARY', ['slug citation']))
    j = JARGON.findall(outside_italics(x['new']))
    if j: bad.append((x['thread_id'], 'SUMMARY', ['jargon: ' + ','.join(j[:3])]))
    summaries.append(dict(thread_id=x['thread_id'], old=old, new=x['new'], flag=x.get('flag') or ''))
# dedupe members (one row per (thread, xref))
seen = {};
for m in members: seen[(m['thread_id'], m['xref_id'])] = m
members = list(seen.values())
# every member row of a rebuilt card must be covered
for i, v in cards.items():
    if v['kind'].startswith('PROSE'):
        for m in members_by_card[i]:
            assert (m['thread_id'], i) in seen, (i, 'member row missing')
json.dump({str(k): v for k, v in sorted(cards.items())}, open(F/'fix_cards.json', 'w'), ensure_ascii=False, indent=1)
json.dump(members, open(F/'fix_members.json', 'w'), ensure_ascii=False, indent=1)
json.dump(summaries, open(F/'fix_summaries.json', 'w'), ensure_ascii=False, indent=1)
print('cards', len(cards), collections.Counter(v['kind'] for v in cards.values()))
print('members', len(members), collections.Counter(m['kind'] for m in members))
print('summaries', len(summaries))
print('moves', [(i, v['old'], v['new']) for i, v in cards.items() if v['old'] != v['new']])
print('PROBLEMS', len(bad))
for b in bad: print(' ', b)
