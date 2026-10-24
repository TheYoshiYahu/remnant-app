"""S463d — assemble fix/fix_cards.json, fix/fix_members.json, fix/fix_summaries.json from the agents' outputs, validating every row by content:
 - a rebuilt note carries the live Jasher verse (at its address) verbatim and the other verse verbatim (canon from canon.json);
 - no jargon / hyphen-chain / slug citation / Hebrew book name outside the italic scripture spans;
 - every member note's italic phrase is a verbatim substring of the live Jasher verse (or its next verse);
 - every Jasher quotation in every touched note / member note / summary is verbatim at the verse it cites.
Prints what fails; writes nothing to the Desktop."""
import json, re, collections, unicodedata
from pathlib import Path
IN = Path('in'); P = Path('packets'); O = Path('out'); F = Path('fix'); F.mkdir(exist_ok=True)
live = json.load(open(IN/'jasher-cards-live.json')); L = live['live']
C = {c['id']: c for c in live['cards']}
members_by_card = collections.defaultdict(list)
for m in live['members']: members_by_card[m['xref_id']].append(m)
T = {t['id']: t for t in live['threads']}
canon = {}
for b in json.load(open(IN/'canon.json'))['books']:
    for ch in b['chapters']:
        for v in ch['verses']: canon[(b['book_id'], ch['number'], v['number'])] = v['text']
JARGON = re.compile(r'wisdom-stream|the framework|Red Line|apparatus|FRAMEWORK-MAJOR|\blocked\b|\bS\d{2,3}\b|Yoshi|verbal-anchor|\bmotif\b|\bprototype\b|in substance|its substance', re.I)
CHAIN = re.compile(r"\b[A-Za-z']+(?:-[A-Za-z']+){3,}\b")
NUMERIC = re.compile(r"^(?:(?:one|two|three|four|five|six|seven|eight|nine|ten|eleven|twelve|thirteen|fifteen|twenty|thirty|forty|fifty|sixty|seventy|eighty|ninety|hundred|thousand|threescore|fourscore|and|by|year|years|old|day|days|cubit|cubits|fold)-?)+$", re.I)
SLUG = re.compile(r"\b[a-z0-9]+(?:-[a-z0-9]+)+ \d+:\d+")
HEB = re.compile(r"\b(Bereshit|Shemot|Vayikra|Bamidbar|Devarim|Tehillim|Mishlei|Yeshayahu|Yirmeyahu|Yechezk'?el|Hoshea|Yo'el|Mattityahu|Yochanan|Hitgalut|Ivrim|Galatim|Romim) \d+")
LABEL = re.compile(r"\bJasher (\d+):(\d+)(?:\s*[–-]\s*(\d+))?\s*[—–-]\s*\*([^*]+)\*")
TRAIL = re.compile(r"\*([^*]+)\*\s*\(Jasher (\d+):(\d+)(?:\s*[–-]\s*(\d+))?\)")
def outside_italics(s): return re.sub(r"\*[^*]+\*", " ", s or '')
def span(ch, vn, to=None):
    to = to or vn
    return ' '.join(L[f"jasher|{ch}:{v}"] for v in range(vn, to+1) if f"jasher|{ch}:{v}" in L)
def norm(s):
    s = unicodedata.normalize('NFKD', s or ''); s = ''.join(ch for ch in s if not unicodedata.combining(ch))
    s = re.sub(r"\([^)]*\)", " ", s); s = re.sub(r"[\[\]‘’'“”\"]", "", s).lower(); s = re.sub(r"[^a-z0-9 ]+", " ", s); return re.sub(r"\s+", " ", s).strip()
def quote_ok(q, ch, vn, to=None):
    """same standard as the read-back checks (S459→S463c): normalized — parentheticals, quote marks, punctuation and case ignored"""
    pieces = [norm(p) for p in re.split(r"\.\.\.|…", q) if norm(p)]
    t = norm(span(ch, vn, to)); pos = 0
    for p in pieces:
        i = t.find(p, pos)
        if i < 0: return False
        pos = i + len(p)
    return True
def jasher_quotes_ok(text):
    bad = []
    for m in LABEL.finditer(text):
        if not quote_ok(m.group(4), int(m.group(1)), int(m.group(2)), int(m.group(3)) if m.group(3) else None): bad.append(f"Jasher {m.group(1)}:{m.group(2)} — {m.group(4)[:50]}")
    for m in TRAIL.finditer(text):
        if not quote_ok(m.group(1), int(m.group(2)), int(m.group(3)), int(m.group(4)) if m.group(4) else None): bad.append(f"({m.group(2)}:{m.group(3)}) {m.group(1)[:50]}")
    return bad
def problems(note, addr, other):
    p = []
    if L[addr] not in note: p.append('Jasher verse not verbatim')
    ot = canon.get((other['book'], other['ch'], other['vn'])) if other['ed'] == 'canon' else other['text_db']
    if ot and ot not in note: p.append('other verse not verbatim')
    j = JARGON.findall(outside_italics(note))
    if j: p.append('jargon outside italics: ' + ','.join(j[:3]))
    ch = [c for c in CHAIN.findall(outside_italics(note)) if not NUMERIC.match(c)]
    if ch: p.append('hyphen-chain: ' + ','.join(ch[:3]))
    if SLUG.search(note): p.append('slug citation')
    if HEB.search(note): p.append('hebrew book name')
    p += ['quote off: ' + b for b in jasher_quotes_ok(note)]
    return p
def member_problems(mn, addr):
    p = []
    ch, vn = map(int, addr.split('|')[1].split(':'))
    phs = [q.strip().rstrip('.').strip() for q in re.findall(r"\*([^*]+)\*", mn or '')]
    if not phs: return ['no italic phrase']
    if not any(quote_ok(ph, ch, vn, vn+1) for ph in phs): p.append('member phrase not verbatim')
    if JARGON.findall(outside_italics(mn)) or [c for c in CHAIN.findall(outside_italics(mn)) if not NUMERIC.match(c)]: p.append('member jargon/chain')
    if SLUG.search(mn): p.append('member slug citation')
    p += ['member quote off: ' + b for b in jasher_quotes_ok(mn)]
    return p

cards = {}; members = []; bad = []
# 1. rebuilt cards
reb_out = []
for f in sorted(O.glob('rebuild_*.json')): reb_out += json.load(open(f))
pk = {}
for f in sorted(P.glob('rebuild_*.json')):
    for x in json.load(open(f)): pk[x['id']] = x
for x in reb_out:
    it = pk[x['id']]; old = f"jasher|{it['jasher']['ch']}:{it['jasher']['vn']}"; new = x.get('move') or old
    pr = problems(x['new_note'], new, it['other']) + member_problems(x['member_note'], new)
    if pr: bad.append((x['id'], 'REBUILD', pr))
    cards[x['id']] = dict(id=x['id'], side=it['side'], old=old, new=new, kind='PROSE_MOVE' if new != old else 'PROSE', new_note=x['new_note'],
                          member_note=x['member_note'], reason=x.get('flag') or '', old_note=it['old_note'])
    for m in it['members']:
        members.append(dict(thread_id=m['thread_id'], xref_id=x['id'], old=m['old'], new=x['member_note'], kind='PROSE'))
# 2. manual requotes (4265, 30027) and member requotes
MR = json.load(open('manual_requotes.json'))
for i, subs in MR['cards'].items():
    i = int(i); c = C[i]; assert i not in cards, i
    nn = c['note']
    for a, b in subs: assert nn.count(a) == 1, (i, a[:40]); nn = nn.replace(a, b)
    side = 'S' if c['s_ed'] == 'jasher' else 'T'
    ch, vn = (c['s_ch'], c['s_vn']) if side == 'S' else (c['t_ch'], c['t_vn'])
    old = f"jasher|{ch}:{vn}"
    pr = ['quote off: ' + b for b in jasher_quotes_ok(nn)]
    if i == 30027 and canon[('matthew', 4, 10)] not in nn: pr.append('canon verse not verbatim')
    if pr: bad.append((i, 'REQUOTE', pr))
    cards[i] = dict(id=i, side=side, old=old, new=old, kind='REQUOTE', new_note=nn, member_note=None, reason=MR['reason'], old_note=c['note'])
    for m in members_by_card[i]:
        if (m['member_note'] or '') == c['note']:
            members.append(dict(thread_id=m['thread_id'], xref_id=i, old=m['member_note'], new=nn, kind='REQUOTE'))
for mm in MR['members']:
    m = next(x for x in live['members'] if x['thread_id'] == mm['thread_id'] and x['xref_id'] == mm['xref_id'])
    assert m['member_note'].count(mm['old_sub']) == 1, mm
    nn = m['member_note'].replace(mm['old_sub'], mm['new_sub'])
    ch, vn = (m['s_ch'], m['s_vn']) if m['s_ed'] == 'jasher' else (m['t_ch'], m['t_vn'])
    pr = member_problems(nn, f"jasher|{ch}:{vn}")
    if pr: bad.append(((mm['thread_id'], mm['xref_id']), 'MEMBER_REQUOTE', pr))
    members.append(dict(thread_id=mm['thread_id'], xref_id=mm['xref_id'], old=m['member_note'], new=nn, kind='MEMBER_REQUOTE'))
# 3. gloss450 + stale reads — STAY unless MOVE; patched notes ride along
for pkt, outf, kind in (('gloss450.json', 'gloss450.json', 'GLOSS'), ('stale.json', 'stale.json', 'STALE')):
    pkx = {x['id']: x for x in json.load(open(P/pkt))}
    for x in json.load(open(O/outf)):
        if x['verdict'] == 'MOVE' or x.get('new_note'):
            it = pkx[x['id']]; old = f"jasher|{it['jasher']['ch']}:{it['jasher']['vn']}"; new = x.get('move') or old
            if x['id'] in cards: continue
            nn = x.get('new_note') or it['old_note']
            pr = ['quote off: ' + b for b in jasher_quotes_ok(nn)]
            if x['verdict'] == 'MOVE' and new not in L: pr.append('move target missing')
            if pr: bad.append((x['id'], kind, pr))
            cards[x['id']] = dict(id=x['id'], side=it['side'], old=old, new=new, kind=f'{kind}_MOVE' if new != old else f'{kind}_PATCH', new_note=nn, member_note=None, reason=x['reason'], old_note=it['old_note'])
            # member rows that carried the same quotation get the same patch
            if x.get('new_note'):
                for m in members_by_card[x['id']]:
                    if m['member_note'] and m['member_note'] != x['new_note']:
                        mn = m['member_note']
                        for a, b in zip(re.findall(r"\*([^*]+)\*", it['old_note']), re.findall(r"\*([^*]+)\*", x['new_note'])):
                            if a != b and a in mn: mn = mn.replace(a, b)
                        if mn != m['member_note']:
                            members.append(dict(thread_id=m['thread_id'], xref_id=x['id'], old=m['member_note'], new=mn, kind=f'{kind}_PATCH'))
# 4. summaries
summaries = []
for ms in MR.get('summaries', []):
    t = T[ms['thread_id']]; assert t['summary_md'].count(ms['old_sub']) == 1, ms
    summaries.append(dict(thread_id=ms['thread_id'], old=t['summary_md'], new=t['summary_md'].replace(ms['old_sub'], ms['new_sub']), flag=ms['reason']))
for x in json.load(open(O/'summaries.json')):
    if not x['changed']: continue
    old = T[x['thread_id']]['summary_md']
    pr = []
    if SLUG.search(x['new']): pr.append('slug citation')
    j = JARGON.findall(outside_italics(x['new']))
    if j: pr.append('jargon: ' + ','.join(j[:3]))
    ch = [c for c in CHAIN.findall(outside_italics(x['new'])) if not NUMERIC.match(c)]
    if ch: pr.append('hyphen-chain: ' + ','.join(ch[:3]))
    pr += ['quote off: ' + b for b in jasher_quotes_ok(x['new'])]
    if x['new'] == old: pr.append('marked changed but identical')
    if pr: bad.append((x['thread_id'], 'SUMMARY', pr))
    summaries.append(dict(thread_id=x['thread_id'], old=old, new=x['new'], flag=x.get('flag') or ''))
# dedupe members (one row per (thread, xref)); the card's own member note wins
seen = {}
for m in members: seen[(m['thread_id'], m['xref_id'])] = m
members = [m for m in seen.values() if m['old'] != m['new']]
for i, v in cards.items():
    if v['kind'].startswith('PROSE'):
        for m in members_by_card[i]: assert (m['thread_id'], i) in seen, (i, 'member row missing')
json.dump({str(k): v for k, v in sorted(cards.items())}, open(F/'fix_cards.json', 'w'), ensure_ascii=False, indent=1)
json.dump(members, open(F/'fix_members.json', 'w'), ensure_ascii=False, indent=1)
json.dump(summaries, open(F/'fix_summaries.json', 'w'), ensure_ascii=False, indent=1)
print('cards', len(cards), collections.Counter(v['kind'] for v in cards.values()), '| moves', sum(1 for v in cards.values() if v['old'] != v['new']))
print('member rows', len(members), collections.Counter(m['kind'] for m in members), '| summaries', len(summaries))
print('PROBLEMS:', len(bad))
for b in bad: print(' ', b)
