"""S460 step A — mechanical re-quote of the RE_QUOTE summaries (and the found quotes inside REWRITE ones).
For every quote graded RE_ANCHOR / REWORDED / RE_ANCHOR_REWORDED, replace the italic with the live verse(s) in full
and correct the citation. Output requote.json: {thread_id: {old, new, changes:[...], review_words:[...]}}.
"""
import json, re, sys, unicodedata, collections
from pathlib import Path as _P
HERE = str(_P(__file__).resolve().parent); HERE_UP = str(_P(HERE).parent)
sys.path.insert(0, HERE + '')
from pathlib import Path
SRC = Path(HERE_UP + '')
live = json.load(open(SRC / 'enoch-cards-live.json')); L = live['enoch_live']
RG = json.load(open(SRC / 's460-summary-fix/summary-regrade.json'))
ADDRS = list(L.keys()); IDX = {a: i for i, a in enumerate(ADDRS)}

def norm(s):
    s = unicodedata.normalize('NFKD', s or '')
    s = ''.join(ch for ch in s if not unicodedata.combining(ch))
    s = re.sub(r"\([^)]*\)", " ", s); s = re.sub(r"[\[\]‘’'“”\"]", "", s).lower()
    s = re.sub(r"[^a-z0-9 ]+", " ", s); return re.sub(r"\s+", " ", s).strip()
NL = {a: norm(t) for a, t in L.items()}
def pieces(q): return [norm(p) for p in re.split(r"\.\.\.|…", q) if norm(p)]
def covered(a, q, n=6):
    ps = pieces(q); i = IDX[a]; acc = ''; k = 0
    for j in range(i, min(i + n, len(ADDRS))):
        if ADDRS[j].split(':')[0] != a.split(':')[0] and j > i: break
        acc = (acc + ' ' + NL[ADDRS[j]]).strip(); k += 1
        if all(acc.find(p) >= 0 for p in ps): return k
    return 1

import difflib
def best_window(a, q):
    """for a reworded quote: the verse window (start, k) near a that best matches the quote's words"""
    qw = norm(q).split(); i = IDX[a]; ch = a.split(':')[0]; best = (a, 1, 0.0)
    for j in range(max(0, i - 1), min(i + 4, len(ADDRS))):
        if ADDRS[j].split(':')[0] != ch: continue
        for m in (1, 2, 3):
            ads = ADDRS[j:j + m]
            if any(x.split(':')[0] != ch for x in ads): break
            tw = ' '.join(NL[x] for x in ads).split()
            r = difflib.SequenceMatcher(None, qw, tw, autojunk=False).ratio()
            if r > best[2] + 0.02: best = (ADDRS[j], m, r)
    return best
def span(a, k):
    i = IDX[a]; ads = ADDRS[i:i + k]
    txt = ' '.join(L[x].strip() for x in ads)
    c = a.split(':')[0]; v1 = a.split(':')[1]; v2 = ads[-1].split(':')[1]
    cit = f"1 Enoch {c}:{v1}" + (f"-{v2}" if k > 1 else '')
    return txt, cit, ads

CIT = r"(?<![23] )(?:1 )?Enoch (\d+):(\d+)(?:[-–](\d+))?"
out = {}
for s in RG:
    if s['verdict'] not in ('RE_QUOTE', 'REWRITE'): continue
    text = s['summary_md']; changes = []; new = text
    for d in s['det']:
        if d['verdict'] not in ('RE_ANCHOR', 'REWORDED', 'RE_ANCHOR_REWORDED'): continue
        a = d['proposed']
        if d['verdict'] == 'RE_ANCHOR': k = covered(a, d['quote'])
        else: a, k, _r = best_window(a, d['quote'])
        txt, cit, ads = span(a, k)
        q = re.escape(d['quote'])
        pa = re.compile(r"\*" + q + r"\*([\s.,;:—–-]*)\(" + CIT + r"\)")
        pb = re.compile(CIT + r"([\s:—–-]*)\*" + q + r"\*")
        if pa.search(new):
            new = pa.sub(lambda m: f"*{txt}* ({cit})", new, count=1)
        elif pb.search(new):
            new = pb.sub(lambda m: f"{cit}{m.group(4)}*{txt}*", new, count=1)
        else:
            changes.append(dict(quote=d['quote'][:60], note='PATTERN NOT MATCHED')); continue
        changes.append(dict(old_cited=d['cited'], new_cited=cit, verdict=d['verdict'], old_quote=d['quote'], new_quote=txt))
    if not changes: continue
    # words from the old quotes that the surrounding prose repeats and the new quote no longer carries
    prose = norm(re.sub(r"\*[^*]+\*", " ", new))
    review = set()
    for c in changes:
        if 'old_quote' not in c: continue
        oldw = {w for w in norm(c['old_quote']).split() if len(w) >= 5}
        neww = set(norm(c['new_quote']).split())
        for w in oldw - neww:
            if re.search(r"\b" + w + r"\b", prose): review.add(w)
    out[s['id']] = dict(slug=s['slug'], verdict=s['verdict'], old=text, new=new, changes=changes, review_words=sorted(review))
json.dump(out, open(HERE + '/requote.json', 'w'), ensure_ascii=False, indent=1)
C = collections.Counter
print('summaries re-quoted:', len(out), C(v['verdict'] for v in out.values()))
print('unmatched patterns:', sum(1 for v in out.values() for c in v['changes'] if c.get('note')))
print('RE_QUOTE needing a look (prose repeats dropped words):', sum(1 for v in out.values() if v['verdict']=='RE_QUOTE' and v['review_words']))
print('multi-verse spans:', sum(1 for v in out.values() for c in v['changes'] if '-' in c.get('new_cited','')))
