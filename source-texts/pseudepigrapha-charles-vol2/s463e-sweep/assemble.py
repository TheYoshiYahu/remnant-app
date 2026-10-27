"""S463e — assemble fix/fix_cards.json, fix/fix_members.json, fix/fix_summaries.json from the agents' outputs + manual_overrides.json,
validating every row by content:
 - a rebuilt note carries the live extra verse (at its address) verbatim and the other verse verbatim (canon from canon.json);
 - no jargon / hyphen-chain / slug citation / Hebrew book name outside the italic scripture spans;
 - every member note's italic phrase is a verbatim substring of the live extra verse (or its next verse);
 - every extra-book quotation in every touched note / member note / summary is verbatim at the verse it cites;
 - every canon lead quotation is verbatim in canon.json;
 - a move lands on an existing verse that is not the card's other end and holds no other card on the same pair.
Slug citations on untouched cards / members / summaries are fixed mechanically here.
Prints what fails; writes nothing to the Desktop."""
import json, re, collections, sys
from pathlib import Path
sys.argv = ['x']; exec(open('regrade.py').read().split("# ---- CARDS ----")[0])   # BOOK_OF, LABEL, TRAIL, norm, NL, L, CL, CANON_NAMES, contains_from, EDS, HELD, T_RANGES …
P = Path('packets'); O = Path('out'); F = Path('fix'); F.mkdir(exist_ok=True)
C = {c['id']: c for c in live['cards']}
members_by_card = collections.defaultdict(list)
for m in live['members']: members_by_card[m['xref_id']].append(m)
T = {t['id']: t for t in live['threads']}
R = {o['id']: o for o in json.load(open('regrade.json'))}
RM = json.load(open('regrade_members.json')); RT = json.load(open('regrade_threads.json'))
MO = json.load(open('manual_overrides.json'))
JARGON = re.compile(r'wisdom-stream|the framework|Red Line|\bapparatus\b|FRAMEWORK-MAJOR|\blocked\b|\bS\d{2,3}\b|Yoshi|verbal-anchor|\bmotif\b|\bprototype\b|in substance|its substance|-substance\b|-register\b|\bsubstance\b', re.I)
CHAIN = re.compile(r"\b[A-Za-z']+(?:-[A-Za-z']+){3,}\b")
SLUG = re.compile(r"\b[a-z0-9]+(?:-[a-z0-9]+)+ \d+:\d+")
HEB = re.compile(r"\b(Bereshit|Shemot|Vayikra|Bamidbar|Devarim|Tehillim|Mishlei|Yeshayahu|Yirmeyahu|Yechezk'?el|Hoshea|Yo'el|Mattityahu|Yochanan|Hitgalut|Ivrim|Galatim|Romim) \d+")
SLUG_EN = {'1-adam-eve': '1 Adam and Eve', '2-adam-eve': '2 Adam and Eve', 'apocalypse-of-abraham': 'Apocalypse of Abraham', 'ascension-isaiah': 'Ascension of Isaiah',
           '2-enoch': '2 Enoch', 'testaments-xii': 'Testaments of the Twelve Patriarchs', '2-baruch': '2 Baruch', '3-baruch': '3 Baruch'}
def outside_italics(s): return re.sub(r"\*[^*]+\*", " ", s or '')
def book_of_addr(a): return a.rsplit('|', 1)[0]
def span_live(a, to=None):
    b, cv = a.rsplit('|', 1); ch, vn = map(int, cv.split(':')); to = to or vn
    return ' '.join(L[f"{b}|{ch}:{v}"] for v in range(vn, to+1) if f"{b}|{ch}:{v}" in L)
def quote_ok(q, a, to=None):
    ps = [norm(p) for p in re.split(r"\.\.\.|…", q) if norm(p)]
    t = norm(span_live(a, to)); pos = 0
    for p in ps:
        i = t.find(p, pos)
        if i < 0: return False
        pos = i + len(p)
    return True
def extra_quotes_ok(text):
    bad = []
    for m in LABEL.finditer(text):
        a = f"{BOOK_OF[m.group(1).lower()]}|{m.group(2)}:{m.group(3)}"
        if a not in L or not quote_ok(m.group(5), a, int(m.group(4)) if m.group(4) else None): bad.append(f"{m.group(1)} {m.group(2)}:{m.group(3)} — {m.group(5)[:50]}")
    for m in TRAIL.finditer(text):
        a = f"{BOOK_OF[m.group(2).lower()]}|{m.group(3)}:{m.group(4)}"
        if a not in L or not quote_ok(m.group(1), a, int(m.group(5)) if m.group(5) else None): bad.append(f"({m.group(2)} {m.group(3)}:{m.group(4)}) {m.group(1)[:50]}")
    return bad
def canon_quotes_ok(text):
    bad = []
    for m in re.finditer(rf"(?<!of )\b({CANON_RE})\.?\s+(\d+):(\d+)(?:\s*[–-]\s*(\d+))?\s*[—–-]\s*\*([^*]+)\*", text, re.I):
        slug = CANON_NAMES[m.group(1).lower()]; a = f"{slug}|{m.group(2)}:{m.group(3)}"
        if a not in CL: bad.append(f"no such verse {m.group(1)} {m.group(2)}:{m.group(3)}"); continue
        to = int(m.group(4)) if m.group(4) else int(m.group(3))
        t = norm(' '.join(CL.get(f"{slug}|{m.group(2)}:{v}", '') for v in range(int(m.group(3)), to + 2))); pos = 0; ok = True
        for p in [norm(x) for x in re.split(r"\.\.\.|…", m.group(5)) if norm(x)]:
            i = t.find(p, pos)
            if i < 0: ok = False; break
            pos = i + len(p)
        if not ok: bad.append(f"canon off: {m.group(1)} {m.group(2)}:{m.group(3)} — {m.group(5)[:50]}")
    for m in re.finditer(rf"\*([^*]+)\*\s*\((?!Ascension of )({CANON_RE})\.?\s+(\d+):(\d+)(?:\s*[–-]\s*(\d+))?\)", text, re.I):
        slug = CANON_NAMES[m.group(2).lower()]; a = f"{slug}|{m.group(3)}:{m.group(4)}"
        if a not in CL: bad.append(f"no such verse {m.group(2)} {m.group(3)}:{m.group(4)}"); continue
        to = int(m.group(5)) if m.group(5) else int(m.group(4))
        t = norm(' '.join(CL.get(f"{slug}|{m.group(3)}:{v}", '') for v in range(int(m.group(4)), to + 2))); pos = 0; ok = True
        for p in [norm(x) for x in re.split(r"\.\.\.|…", m.group(1)) if norm(x)]:
            i = t.find(p, pos)
            if i < 0: ok = False; break
            pos = i + len(p)
        if not ok: bad.append(f"canon off: ({m.group(2)} {m.group(3)}:{m.group(4)}) {m.group(1)[:50]}")
    return bad
def prose_problems(text):
    p = []
    j = JARGON.findall(outside_italics(text))
    if j: p.append('jargon outside italics: ' + ','.join(j[:3]))
    ch = [c for c in CHAIN.findall(outside_italics(text)) if not NUMERIC_CHAIN.match(c)]
    if ch: p.append('hyphen-chain: ' + ','.join(ch[:3]))
    if SLUG.search(text): p.append('slug citation')
    if HEB.search(text): p.append('hebrew book name')
    p += ['quote off: ' + b for b in extra_quotes_ok(text)]
    p += canon_quotes_ok(text)
    bad_t = t_range_check(text)
    if bad_t: p.append('stale Testaments cite: ' + bad_t[0]['cite'])
    return p
def other_text(c, side):
    ed, book, ch, vn, txt = (c['t_ed'], c['t_book'], c['t_ch'], c['t_vn'], c['t_text']) if side == 'S' else (c['s_ed'], c['s_book'], c['s_ch'], c['s_vn'], c['s_text'])
    return CL.get(f"{book}|{ch}:{vn}") if ed == 'canon' else txt
def member_problems(mn, addr):
    p = []
    phs = [q.strip().rstrip('.').strip() for q in re.findall(r"\*([^*]+)\*", mn or '')]
    if not phs: return ['no italic phrase']
    b, cv = addr.rsplit('|', 1); ch, vn = map(int, cv.split(':'))
    if not any(quote_ok(ph, addr, vn+1) for ph in phs): p.append('member phrase not verbatim')
    p += ['member ' + x for x in prose_problems(mn)]
    return p
def deslug(s):
    return re.sub(r"\b(1-adam-eve|2-adam-eve|apocalypse-of-abraham|ascension-isaiah|2-enoch|testaments-xii|2-baruch|3-baruch) (\d+:\d+)", lambda m: f"{SLUG_EN[m.group(1)]} {m.group(2)}", s)
def side_of(c): return 'S' if c['s_ed'] in EDS else 'T'
def addr_of(c):
    s = side_of(c)
    return f"{c['s_ed']}|{c['s_book']}|{c['s_ch']}:{c['s_vn']}" if s == 'S' else f"{c['t_ed']}|{c['t_book']}|{c['t_ch']}:{c['t_vn']}"
def other_id_key(c, side): return (c['t_ed'], c['t_book'], c['t_ch'], c['t_vn']) if side == 'S' else (c['s_ed'], c['s_book'], c['s_ch'], c['s_vn'])
PAIRS = collections.defaultdict(set)
for c in live['cards']:
    PAIRS[(c['s_ed'], c['s_book'], c['s_ch'], c['s_vn'], c['t_ed'], c['t_book'], c['t_ch'], c['t_vn'])].add(c['id'])
def move_problems(i, new):
    c = C[i]; side = side_of(c); p = []
    if new not in L: return ['move target missing']
    ed, book, cv = new.split('|'); ch, vn = map(int, cv.split(':'))
    ok = other_id_key(c, side)
    if (ed, book, ch, vn) == ok: p.append('move target is the other end')
    key = (ed, book, ch, vn) + ok if side == 'S' else ok + (ed, book, ch, vn)
    if PAIRS.get(key, set()) - {i}: p.append(f'duplicate pair with {PAIRS[key] - {i}}')
    return p

cards = {}; members = []; summaries = []; bad = []
def put_card(i, kind, new_note, new_addr=None, member_note=None, reason='', extra_checks=True):
    new_note = deslug(new_note); member_note = deslug(member_note) if member_note else member_note
    c = C[i]; old = addr_of(c); new = new_addr or old
    pr = move_problems(i, new) if new != old else []
    pr += prose_problems(new_note)
    if kind.startswith('PROSE'):
        if L[new] not in new_note: pr.append('extra verse not verbatim')
        ot = other_text(c, side_of(c))
        if ot and ot not in new_note: pr.append('other verse not verbatim')
        if member_note: pr += member_problems(member_note, new)
        else: pr.append('rebuilt card without member note')
    if pr: bad.append((i, kind, pr))
    cards[i] = dict(id=i, side=side_of(c), old=old, new=new, kind=kind + ('_MOVE' if new != old and not kind.endswith('MOVE') else ''), new_note=new_note,
                    member_note=member_note, reason=reason, old_note=c['note'])
    for m in members_by_card[i]:
        if member_note: mn = member_note
        elif (m['member_note'] or '') == (c['note'] or ''): mn = new_note
        else: continue
        members.append(dict(thread_id=m['thread_id'], xref_id=i, old=m['member_note'], new=mn, kind=kind))

# 1. rebuilt cards (+ manual overrides on rebuild cards)
pk = {}
for f in sorted(P.glob('rebuild_*.json')):
    for x in json.load(open(f)): pk[x['id']] = x
reb_out = []
for f in sorted(O.glob('rebuild_*.sonnet.json')): reb_out += json.load(open(f))
assert {x['id'] for x in reb_out} == set(pk), 'rebuild output ids differ from packets'
for x in reb_out:
    ov = MO['cards'].get(str(x['id']))
    if ov: x = dict(x, **{k: v for k, v in ov.items() if v is not None}); x['flag'] = ov['flag']
    put_card(x['id'], 'PROSE', x['new_note'], x.get('move'), x['member_note'], x.get('flag') or '')
# 2. canon re-quotes
for x in json.load(open(O/'canon_requote.sonnet.json')):
    if x['id'] in cards: continue
    put_card(x['id'], 'CANON_REQUOTE', x['new_note'], None, None, x.get('flag') or '')
# 3. address reads
for x in json.load(open(O/'address.sonnet.json')):
    if x['verdict'] == 'STAY': continue
    if x.get('thread_id'):
        m = next(mm for mm in live['members'] if mm['thread_id'] == x['thread_id'] and mm['xref_id'] == x['id'])
        c = C[x['id']]; addr = x.get('move') or addr_of(c)
        nn = deslug(x['new_note'])
        for mo_ in MO.get('members', []):
            if (mo_['thread_id'], mo_['xref_id']) == (x['thread_id'], x['id']):
                assert nn.count(mo_['old_sub']) == 1, ('member override sub', mo_); nn = nn.replace(mo_['old_sub'], mo_['new_sub'])
        pr = ['member ' + p for p in prose_problems(nn)]
        if pr: bad.append(((x['thread_id'], x['id']), 'MEMBER_ADDRESS', pr))
        members.append(dict(thread_id=x['thread_id'], xref_id=x['id'], old=m['member_note'], new=nn, kind='MEMBER_ADDRESS'))
        continue
    if x['id'] in cards: continue
    put_card(x['id'], 'ADDR_' + x['verdict'], x.get('new_note') or C[x['id']]['note'], x.get('move'), None, x['reason'])
# 4. phrase reads (+ manual overrides for the two FLAGs)
for x in json.load(open(O/'phrases.sonnet.json')):
    ov = MO['cards'].get(str(x['id']))
    if ov:
        put_card(x['id'], 'PHRASE_PATCH', ov['new_note'], ov.get('move'), None, ov['flag']); continue
    if x['verdict'] in ('STAY', 'FLAG') or x['id'] in cards: continue
    put_card(x['id'], 'PHRASE_' + x['verdict'], x.get('new_note') or C[x['id']]['note'], x.get('move'), None, x['reason'])
# 5. member notes with their own text, flagged
for x in json.load(open(O/'members_flagged.sonnet.json')):
    m = next(mm for mm in live['members'] if mm['thread_id'] == x['thread_id'] and mm['xref_id'] == x['xref_id'])
    pr = member_problems(x['new'], addr_of(C[x['xref_id']]))
    if pr: bad.append(((x['thread_id'], x['xref_id']), 'MEMBER_FLAGGED', pr))
    members.append(dict(thread_id=x['thread_id'], xref_id=x['xref_id'], old=m['member_note'], new=deslug(x['new']), kind='MEMBER_FLAGGED'))
# 6. summaries (+ override)
SC = {x['thread_id']: x for x in json.load(open(O/'summary_canon.sonnet.json'))} if (O/'summary_canon.sonnet.json').exists() else {}
sum_rows = [dict(thread_id=x['thread_id'], changed=x['changed'], new=x['new'], flag=x.get('flag') or '') for x in json.load(open(O/'summaries.sonnet.json'))]
for tid, x in SC.items():
    if tid in {s['thread_id'] for s in sum_rows}:
        s = next(s for s in sum_rows if s['thread_id'] == tid); s['new'] = x['new']; s['changed'] = True; s['flag'] = (s['flag'] + ' | ' + (x.get('flag') or '')).strip(' |')
    else: sum_rows.append(dict(thread_id=tid, changed=True, new=x['new'], flag=x.get('flag') or ''))
for x in sum_rows:
    if not x['changed']: continue
    old = T[x['thread_id']]['summary_md']; new = deslug(x['new'])
    ov = MO['summaries'].get(str(x['thread_id']))
    if ov:
        assert new.count(ov['old_sub']) == 1, ('override sub not found once', x['thread_id']); new = new.replace(ov['old_sub'], ov['new_sub'])
    pr = prose_problems(new)
    if new == old: pr.append('marked changed but identical')
    if pr: bad.append((x['thread_id'], 'SUMMARY', pr))
    summaries.append(dict(thread_id=x['thread_id'], old=old, new=new, flag=(x.get('flag') or '') + (' | ' + ov['flag'] if ov else '')))
# 7. mechanical slug citations on everything not yet touched
def _unused(s):
    return re.sub(r"\b(1-adam-eve|2-adam-eve|apocalypse-of-abraham|ascension-isaiah|2-enoch|testaments-xii|2-baruch|3-baruch) (\d+:\d+)", lambda m: f"{SLUG_EN[m.group(1)]} {m.group(2)}", s)
n_slug_cards = 0
for i, o in R.items():
    if o['verdict'] == 'MENTION_ONLY' or o.get('held') or i in cards or not o['slug_cite']: continue
    nn = deslug(o['note'])
    if nn == o['note']: bad.append((i, 'SLUG', ['slug not replaced: ' + SLUG.search(o['note']).group(0)])); continue
    put_card(i, 'SLUG', nn, None, None, 'database slug printed as a citation → English book name'); n_slug_cards += 1
touched_members = {(m['thread_id'], m['xref_id']) for m in members}
n_slug_members = 0
for m in RM:
    if m.get('verdict') in (None, 'MENTION_ONLY') or m.get('held') or not m['slug_cite'] or (m['thread'], m['xref']) in touched_members: continue
    nn = deslug(m['note'])
    for mo_ in MO.get('members', []):
        if (mo_['thread_id'], mo_['xref_id']) == (m['thread'], m['xref']):
            assert nn.count(mo_['old_sub']) == 1, ('member override sub', mo_); nn = nn.replace(mo_['old_sub'], mo_['new_sub'])
    if nn == m['note']: bad.append(((m['thread'], m['xref']), 'MEMBER_SLUG', ['slug not replaced'])); continue
    members.append(dict(thread_id=m['thread'], xref_id=m['xref'], old=m['note'], new=nn, kind='MEMBER_SLUG')); n_slug_members += 1
touched_threads = {s['thread_id'] for s in summaries}
n_slug_threads = 0
for t in RT:
    if not t['anchored'] or t.get('held') or not t['slug_cite'] or t['id'] in touched_threads: continue
    old = T[t['id']]['summary_md']; nn = deslug(old)
    if nn == old: bad.append((t['id'], 'THREAD_SLUG', ['slug not replaced'])); continue
    pr = prose_problems(nn)
    if pr: bad.append((t['id'], 'THREAD_SLUG', pr))
    summaries.append(dict(thread_id=t['id'], old=old, new=nn, flag='slug citation → English book name')); n_slug_threads += 1
# 7b. manual member rows (full new text)
for mo_ in MO.get('member_new', []):
    m = next(mm for mm in live['members'] if (mm['thread_id'], mm['xref_id']) == (mo_['thread_id'], mo_['xref_id']))
    pr = ['member ' + p for p in prose_problems(mo_['new'])]
    if pr: bad.append(((mo_['thread_id'], mo_['xref_id']), 'MEMBER_MANUAL', pr))
    members = [x for x in members if (x['thread_id'], x['xref_id']) != (mo_['thread_id'], mo_['xref_id'])]
    members.append(dict(thread_id=mo_['thread_id'], xref_id=mo_['xref_id'], old=m['member_note'], new=mo_['new'], kind='MEMBER_MANUAL'))
# 8. voice reads (Fable) — apply every FIX, re-validate by content
n_voice = 0
for f in ('voice_a.fable.json', 'voice_b.fable.json'):
    for x in json.load(open(O/f)):
        if x['verdict'] != 'FIX': continue
        i = x['id']; v = cards[i]
        if x.get('fix'):
            nn = deslug(x['fix']); pr = prose_problems(nn)
            if v['kind'].startswith('PROSE'):
                if L[v['new']] not in nn: pr.append('extra verse not verbatim (voice fix)')
                ot = other_text(C[i], v['side'])
                if ot and ot not in nn: pr.append('other verse not verbatim (voice fix)')
            if pr: bad.append((i, 'VOICE_FIX', pr))
            v['new_note'] = nn; v['reason'] = (v['reason'] + ' | voice: ' + x['finding']).strip(' |'); n_voice += 1
            for m in members:
                if m['xref_id'] == i and m['kind'] == v['kind'] and (C[i]['note'] or '') == (m['old'] or '') and not v['member_note']: m['new'] = nn
        if x.get('member_fix'):
            mn = deslug(x['member_fix']); pr = member_problems(mn, v['new'])
            if pr: bad.append((i, 'VOICE_MEMBER_FIX', pr))
            v['member_note'] = mn
            for m in members:
                if m['xref_id'] == i and m['kind'] == 'PROSE': m['new'] = mn
vc = json.load(open(O/'voice_c.fable.json'))
for x in vc['summaries']:
    if x['verdict'] != 'FIX' or not x.get('fix'): continue
    s = next(s for s in summaries if s['thread_id'] == x['thread_id'])
    nn = deslug(x['fix']); pr = prose_problems(nn)
    if pr: bad.append((x['thread_id'], 'VOICE_SUMMARY_FIX', pr))
    s['new'] = nn; s['flag'] = (s['flag'] + ' | voice: ' + x['finding']).strip(' |'); n_voice += 1
for x in vc['member_notes']:
    if x['verdict'] != 'FIX' or not x.get('fix'): continue
    m = next(m for m in members if (m['thread_id'], m['xref_id']) == (x['thread_id'], x['xref_id']))
    nn = deslug(x['fix']); pr = ['member ' + p for p in prose_problems(nn)]
    if pr: bad.append(((x['thread_id'], x['xref_id']), 'VOICE_MEMBER_FIX', pr))
    m['new'] = nn; n_voice += 1
print('voice fixes applied', n_voice)
# dedupe members (one row per (thread, xref)); the card's own member note wins (first written)
seen = {}
for m in members:
    if (m['thread_id'], m['xref_id']) not in seen: seen[(m['thread_id'], m['xref_id'])] = m
members = [m for m in seen.values() if (m['old'] or '') != (m['new'] or '')]
for i, v in cards.items():
    if v['kind'].startswith('PROSE'):
        for m in members_by_card[i]: assert (m['thread_id'], i) in seen, (i, 'member row missing')
# final: every touched member note verbatim-checked for extra quotes (identical ride-alongs carry the card's checked note)
for m in members:
    if m['kind'] in ('PROSE', 'MEMBER_ADDRESS', 'MEMBER_FLAGGED'): continue
    pr = ['member ' + p for p in prose_problems(m['new'])]
    if pr: bad.append(((m['thread_id'], m['xref_id']), 'MEMBER_' + m['kind'], pr))
json.dump({str(k): v for k, v in sorted(cards.items())}, open(F/'fix_cards.json', 'w'), ensure_ascii=False, indent=1)
json.dump(members, open(F/'fix_members.json', 'w'), ensure_ascii=False, indent=1)
json.dump(summaries, open(F/'fix_summaries.json', 'w'), ensure_ascii=False, indent=1)
by_ed = collections.Counter(v['old'].split('|')[0] for v in cards.values())
print('cards', len(cards), dict(collections.Counter(v['kind'] for v in cards.values())), '| moves', sum(1 for v in cards.values() if v['old'] != v['new']), '| by edition', dict(by_ed))
print('member rows', len(members), dict(collections.Counter(m['kind'] for m in members)), '| summaries', len(summaries), '(slug-only', n_slug_threads, ')')
print('PROBLEMS:', len(bad))
for b in bad: print(' ', b)
