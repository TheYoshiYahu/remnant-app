"""Re-grade every live card touching 1 Enoch by the Enoch words its note quotes.
Stricter than the S457 sweep: an italic span counts as an Enoch quote only if
 (a) it is labelled '1 Enoch c:v — *…*' in the note, or
 (b) it is the LEAD italic of the note, the note carries no other-book label before it,
     and the card's Enoch end is the one the lead quote is about (target side 'T' or source 'S').
Output: regrade.json (per card: lead quote, verdict, current addr, proposed addr, live text both).
"""
import json, re, unicodedata, difflib, collections
from pathlib import Path
HERE = Path(__file__).resolve().parent   # …/enoch-charles-1917/s459-card-fix
UP = HERE.parent                         # …/enoch-charles-1917 (the S457 read-back lives here)
live = json.load(open(UP / 'enoch-cards-live.json')); L = live['enoch_live']
sweep = json.load(open(UP / 'enoch-card-fidelity-sweep.json'))
cls_old = {c['id']: c for c in sweep['cards']}

def norm(s):
    s = unicodedata.normalize('NFKD', s or '')
    s = ''.join(ch for ch in s if not unicodedata.combining(ch))
    s = re.sub(r"\([^)]*\)", " ", s)          # parentheticals (God), (Lord), (its)
    s = re.sub(r"[\[\]‘’'“”\"]", "", s)        # brackets, quotes
    s = s.lower()
    s = re.sub(r"[^a-z0-9 ]+", " ", s)
    return re.sub(r"\s+", " ", s).strip()

NL = {a: norm(t) for a, t in L.items()}

LABEL = re.compile(r"1 Enoch (\d+):(\d+)\s*[—–-]\s*\*([^*]+)\*")
LEAD = re.compile(r"^\s*\*([^*]+)\*")
OTHER_LABEL = re.compile(r"^\s*(?!1 Enoch)[A-Z0-9][\w' .\-]{1,40}\s\d+:\d+\s*[—–-]\s*\*")


ADDRS = list(NL.keys())
IDX = {a:i for i,a in enumerate(ADDRS)}
def span_text(a, n=4):
    i = IDX[a]; parts=[]
    for j in range(i, min(i+n, len(ADDRS))):
        b = ADDRS[j]
        if b.split(':')[0] != a.split(':')[0] and j>i: break
        parts.append(NL[b])
    return ' '.join(parts)
def win_ratio(qw, tw):
    """best token-level ratio of qw against a window of tw"""
    if not tw: return 0.0
    n=len(qw); best=0.0
    step=max(1,n//4)
    for i in range(0, max(1,len(tw)-n+1), step):
        w=tw[i:i+n+2]
        r=difflib.SequenceMatcher(None, qw, w, autojunk=False).ratio()
        if r>best: best=r
    return best

def pieces(q):
    return [norm(p) for p in re.split(r"\.\.\.|…", q) if norm(p)]
def contains_from(a, q, n=6):
    """True if every piece of q appears, in order, in the span of n verses starting at a."""
    t = span_text(a, n); pos = 0
    for p in pieces(q):
        i = t.find(p, pos)
        if i < 0: return False
        pos = i + len(p)
    return True
def covered(a, q, n=6):
    """number of verses from a that the quote's last piece reaches into"""
    ps = pieces(q); i = IDX[a]; acc=''; k=0
    for j in range(i, min(i+n, len(ADDRS))):
        acc = (acc+' '+NL[ADDRS[j]]).strip(); k+=1
        if all(acc.find(p)>=0 for p in ps): return k
    return k
def start_addr(q):
    """latest address whose span contains the quote (= where the quote begins), or None"""
    hits=[a for a in ADDRS if contains_from(a,q)]
    return hits[-1] if hits else None

def grade_at(q, a):
    qn=norm(q); qw=qn.split()
    if a not in NL or not qw: return 0.0
    if qn in span_text(a): return 1.0
    return win_ratio(qw, span_text(a).split())
def best_match(q):
    qn=norm(q); qw=qn.split()
    if len(qw) < 4: return None, 0.0
    best=(None,0.0); qs=set(qw)
    for a in ADDRS:
        tw=span_text(a,2).split()
        if len(qs & set(tw))/len(qs) < 0.5: continue
        r=win_ratio(qw, tw)
        if r>best[1]: best=(a,r)
    return best

out = []
for c in live['cards']:
    note = c['note'] or ''
    enoch_end = 'T' if c['t_ed'] == 'enoch' else ('S' if c['s_ed'] == 'enoch' else None)
    addr = f"{c['t_ch']}:{c['t_vn']}" if enoch_end == 'T' else (f"{c['s_ch']}:{c['s_vn']}" if enoch_end == 'S' else None)
    quotes = []  # (quote, labelled_addr or None)
    other_text = norm(c['s_text'] if enoch_end == 'T' else c['t_text']) if enoch_end else ''
    def is_other(q):
        qn = norm(q)
        if not qn or not other_text: return False
        if qn in other_text: return True
        return difflib.SequenceMatcher(None, qn.split(), other_text.split(), autojunk=False).ratio() >= 0.8
    for m in LABEL.finditer(note):
        quotes.append((m.group(3), f"{m.group(1)}:{m.group(2)}"))
    short_unmatched = []
    if not quotes and enoch_end and not OTHER_LABEL.match(note):
        for m in re.finditer(r"\*([^*]+)\*", note):
            q = m.group(1)
            if is_other(q): continue
            if len(norm(q).split()) < 6:
                short_unmatched.append(q); continue
            quotes.append((q, None)); break
    if not quotes:
        out.append(dict(id=c['id'], side=enoch_end, addr=addr, verdict='NO_ENOCH_QUOTE', short_unmatched=short_unmatched, old_cls=cls_old[c['id']]['cls'] if c['id'] in cls_old else None)); continue
    q, labelled = quotes[0]
    at = labelled or addr
    sa = start_addr(q) if norm(q) else None
    if sa is not None:
        k = covered(sa, q)
        if at in IDX and IDX[sa] <= IDX[at] < IDX[sa]+k:
            v, prop, ratio = 'STAND', at, 1.0
        else:
            v, prop, ratio = 'RE_ANCHOR', sa, 1.0
    else:
        r_here = grade_at(q, at) if at in NL else 0.0
        ma, mr = best_match(q)
        if ma and mr >= 0.6 and mr > r_here + 0.1: v, prop, ratio = 'RE_ANCHOR_REWORDED', ma, mr
        elif r_here >= 0.6: v, prop, ratio = 'REWORDED', at, r_here
        else: v, prop, ratio = 'NOT_FOUND', (ma if ma else None), (mr if ma else 0)
    out.append(dict(id=c['id'], side=enoch_end, addr=addr, labelled=labelled, quote=q, verdict=v, proposed=prop, ratio=round(ratio, 2),
                    live_here=L.get(at), live_proposed=L.get(prop) if prop else None, note=note,
                    src=f"{c['s_book']} {c['s_ch']}:{c['s_vn']}", tgt=f"{c['t_book']} {c['t_ch']}:{c['t_vn']}",
                    extra_quotes=quotes[1:], short_unmatched=short_unmatched, old_cls=cls_old[c['id']]['cls'] if c['id'] in cls_old else None))
json.dump(out, open(HERE / 'regrade.json', 'w'), ensure_ascii=False, indent=1)
print(collections.Counter(o['verdict'] for o in out))
print('old vs new:', collections.Counter((o['old_cls'], o['verdict']) for o in out if o['verdict'] != 'NO_ENOCH_QUOTE' and o['old_cls'] != o['verdict']).most_common(20))
