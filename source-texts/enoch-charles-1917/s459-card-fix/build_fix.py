"""Build the S459 1 Enoch card fix from regrade.json + decisions.py.
Output: fix.json  — per card: id, side, old addr, new addr, old note, new note, member handling
        review.md — cards still needing a hand-written prose (degraded markers or stale italics)
"""
import json, re, unicodedata, difflib, importlib, collections
from pathlib import Path
HERE = Path(__file__).resolve().parent
UP = HERE.parent
import decisions as D
live = json.load(open(UP / 'enoch-cards-live.json')); L = live['enoch_live']
ADDRS = list(L.keys()); IDX = {a: i for i, a in enumerate(ADDRS)}
regr = {x['id']: x for x in json.load(open(HERE / 'regrade.json'))}
cards = {c['id']: c for c in live['cards']}

def norm(s):
    s = unicodedata.normalize('NFKD', s or ''); s = ''.join(ch for ch in s if not unicodedata.combining(ch))
    s = re.sub(r"\([^)]*\)", " ", s); s = re.sub(r"[\[\]‘’'“”\"]", "", s).lower()
    s = re.sub(r"[^a-z0-9 ]+", " ", s); return re.sub(r"\s+", " ", s).strip()

def span(a, n):
    i = IDX[a]; out = []
    for j in range(i, min(i + n, len(ADDRS))):
        if j > i and ADDRS[j].split(':')[0] != a.split(':')[0]: break
        out.append(ADDRS[j])
    return out

def covered(a, q, n=6):
    """how many verses from a the (possibly abridged) quote reaches into; 1 if not found"""
    ps = [norm(p) for p in re.split(r"\.\.\.|…", q) if norm(p)]
    acc = ''; k = 0
    for b in span(a, n):
        acc = (acc + ' ' + norm(L[b])).strip(); k += 1
        if all(acc.find(p) >= 0 for p in ps): return k
    return 1

def clean_verse(t):
    """live verse text for quoting: drop Charles's editorial '(i.e. the angel)' / '(lit. …)' glosses, keep brackets"""
    return t.strip()   # exact live text, Charles glosses included (verify-by-content against the live verse)

DEGRADED = re.compile(r"substance|wisdom-stream|The framework|Yoshi|Red Line #|canon-tier|\bS1\d\d\b|\(S\d+\)|short\.md|framework", re.I)

fix = []; review = []
for cid, r in regr.items():
    if r['verdict'] in ('STAND', 'NO_ENOCH_QUOTE'): continue
    c = cards[cid]
    if cid in D.RETIRE:
        fix.append(dict(id=cid, action='retire', reason=D.RETIRE[cid], old_addr=r['addr'])); continue
    old_addr = r['addr']
    new_addr = D.MOVE.get(cid, r['proposed'] if r['verdict'] in ('RE_ANCHOR', 'RE_ANCHOR_REWORDED') else old_addr)
    if new_addr is None: new_addr = old_addr
    if cid in D.KEEP: new_addr = old_addr
    assert new_addr in L, (cid, new_addr)
    # how many verses to quote: cover what the old quote covered, min 1
    nverses = D.NVERSES.get(cid, covered(new_addr, r['quote']) if new_addr == r.get('proposed') or new_addr == old_addr else 1)
    vs = span(new_addr, nverses)
    quote = ' '.join(clean_verse(L[v]) for v in vs)
    cite = f"1 Enoch {new_addr}" + (f"–{vs[-1].split(':')[1]}" if len(vs) > 1 else "")
    note = c['note'] or ''
    labelled = r['labelled'] is not None
    # prose = note minus the lead quote construct
    if labelled:
        prose = re.sub(r"1 Enoch \d+:\d+\s*[—–-]\s*\*[^*]+\*\s*", "", note, count=1).strip()
    else:
        prose = note.replace('*' + r['quote'] + '*', '', 1).strip()
        prose = re.sub(r"^\(1 Enoch [\d:–\-]+\)\.?\s*", "", prose).strip()
    prose = prose.replace('set-apart ones', 'holy ones')
    if cid in D.PROSE:
        prose = D.PROSE[cid].strip()
    else:
        # patch the address in the prose
        if new_addr != old_addr:
            prose = re.sub(r"1 Enoch " + re.escape(old_addr) + r"(?!\d)", "1 Enoch " + new_addr, prose)
            prose = re.sub(r"\bch" + re.escape(old_addr) + r"(?!\d)", "ch" + new_addr, prose)
    # stale italics check: any italic fragment in prose attributed to Enoch that is not in the live span?
    stale = []
    livespan = ' '.join(norm(L[v]) for v in span(new_addr, 8))
    for m in re.finditer(r"\*([^*]+)\*", prose):
        f = norm(m.group(1))
        if len(f.split()) >= 4 and f not in livespan and f in norm(r['quote']):
            stale.append(m.group(1))
    flags = []
    if DEGRADED.search(prose): flags.append('DEGRADED')
    if stale: flags.append('STALE_ITALIC')
    if re.search(r"1 Enoch " + re.escape(old_addr) + r"(?!\d)", prose) and new_addr != old_addr: flags.append('OLD_ADDR')
    if labelled:
        new_note = f"{cite} — *{quote}* {prose}".strip()
    else:
        new_note = f"*{quote}* ({cite}). {prose}".strip()
    fix.append(dict(id=cid, action='update', side=r['side'], src=r['src'], tgt=r['tgt'], old_addr=old_addr, new_addr=new_addr,
                    verses=vs, old_note=note, new_note=new_note, flags=flags, verdict=r['verdict']))
    if flags: review.append((cid, flags, r['src'], old_addr, new_addr, prose))


# ---- member notes riding on the fixed cards ----
upd = {x['id']: x for x in fix if x['action'] == 'update'}
members = []
for m in live['members']:
    x = upd.get(m['xref_id'])
    if not x: continue
    old = m['member_note'] or ''
    r = regr[x['id']]
    if old.strip() == (x['old_note'] or '').strip():
        new = x['new_note']; how = 'same-as-card'
    else:
        new = old
        if x['new_addr'] != x['old_addr']:
            new = re.sub(r"1 Enoch " + re.escape(x['old_addr']) + r"(?!\d)", "1 Enoch " + x['new_addr'], new)
        new = new.replace('set-apart ones', 'holy ones')
        livespan = ' '.join(norm(L[v]) for v in span(x['new_addr'], 8))
        stale = [f.group(1) for f in re.finditer(r"\*([^*]+)\*", new) if len(norm(f.group(1)).split()) >= 4 and norm(f.group(1)) not in livespan and (norm(f.group(1)) in norm(r['quote']) or norm(f.group(1)) in norm(x['old_note']))]
        # a fragment that is a canon-side quote is fine; only Enoch-attributed stale fragments trigger
        stale = [f for f in stale if norm(f) not in norm(cards[x['id']]['s_text'] if r['side']=='T' else cards[x['id']]['t_text'])]
        if stale or DEGRADED.search(new): new = x['new_note']; how = 'replaced (stale quote or degraded prose)'
        elif new != old: how = 'address patched'
        else: how = 'unchanged'
    members.append(dict(thread=m['slug'], thread_id=m['thread_id'], xref=m['xref_id'], old=old, new=new, how=how))
retired = {x['id'] for x in fix if x['action'] == 'retire'}
members_retired = [dict(thread=m['slug'], xref=m['xref_id']) for m in live['members'] if m['xref_id'] in retired]
print('members:', len(members), collections.Counter(m['how'] for m in members), 'on retired cards:', len(members_retired))
json.dump(dict(cards=fix, members=members, members_on_retired=members_retired), open(HERE / 'fix.json', 'w'), ensure_ascii=False, indent=1)
with open(HERE / 'review.md', 'w') as f:
    for cid, flags, src, oa, na, prose in review:
        f.write(f"## {cid} {flags} {src} {oa}->{na}\n{prose[:600]}\n\n")
print('cards:', len(fix), collections.Counter(x['action'] for x in fix))
print('moves:', sum(1 for x in fix if x['action'] == 'update' and x['old_addr'] != x['new_addr']))
print('needing prose:', len(review), collections.Counter(tuple(f) for _, f, *_ in review))
