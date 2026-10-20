"""S460 — re-grade every live thread SUMMARY touching 1 Enoch by the Enoch words it quotes.
Reuses the S459 card regrade's norm/span logic (s459-card-fix/regrade.py), applied to summary_md.

A span counts as an Enoch quote when a 1 Enoch citation sits right beside it:
  (a) *…* (1 Enoch c:v[-v2])            — italic, then the citation in parentheses
  (b) 1 Enoch c:v[-v2] — *…*  /  : *…*   — the citation, then the italic
Bare citations with no italic beside them are CITATION_ONLY (checked against enoch-verse-status.json).

Per quote:  STAND | RE_ANCHOR (words live at another address) | REWORDED (same verse, Charles wording differs)
            | NOT_FOUND (nowhere in the live text).
Per summary: STAND (every quote stands, no cited verse removed, no degraded prose)
             RE_QUOTE (only RE_ANCHOR/REWORDED quotes — re-cite / re-quote from the live verse, thought unchanged)
             REWRITE  (any NOT_FOUND quote, or a cited/anchor verse that is gone, or degraded prose)
Usage: python3 regrade_summaries.py <enoch-charles-1917 dir> <out dir>
"""
import json, re, sys, unicodedata, difflib, collections
from pathlib import Path

UP = Path(sys.argv[1]); OUT = Path(sys.argv[2]); OUT.mkdir(parents=True, exist_ok=True)
live = json.load(open(UP / 'enoch-cards-live.json')); L = live['enoch_live']
VS = json.load(open(UP / 'enoch-verse-status.json'))   # addr -> same|different|reworded|new|removed

def norm(s):
    s = unicodedata.normalize('NFKD', s or '')
    s = ''.join(ch for ch in s if not unicodedata.combining(ch))
    s = re.sub(r"\([^)]*\)", " ", s)
    s = re.sub(r"[\[\]‘’'“”\"]", "", s)
    s = s.lower()
    s = re.sub(r"[^a-z0-9 ]+", " ", s)
    return re.sub(r"\s+", " ", s).strip()

NL = {a: norm(t) for a, t in L.items()}
ADDRS = list(NL.keys()); IDX = {a: i for i, a in enumerate(ADDRS)}

def span_text(a, n=4):
    i = IDX[a]; parts = []
    for j in range(i, min(i + n, len(ADDRS))):
        b = ADDRS[j]
        if b.split(':')[0] != a.split(':')[0] and j > i: break
        parts.append(NL[b])
    return ' '.join(parts)
def win_ratio(qw, tw):
    if not tw: return 0.0
    n = len(qw); best = 0.0; step = max(1, n // 4)
    for i in range(0, max(1, len(tw) - n + 1), step):
        r = difflib.SequenceMatcher(None, qw, tw[i:i + n + 2], autojunk=False).ratio()
        if r > best: best = r
    return best
def pieces(q): return [norm(p) for p in re.split(r"\.\.\.|…", q) if norm(p)]
def contains_from(a, q, n=6):
    t = span_text(a, n); pos = 0
    for p in pieces(q):
        i = t.find(p, pos)
        if i < 0: return False
        pos = i + len(p)
    return True
def covered(a, q, n=6):
    ps = pieces(q); i = IDX[a]; acc = ''; k = 0
    for j in range(i, min(i + n, len(ADDRS))):
        acc = (acc + ' ' + NL[ADDRS[j]]).strip(); k += 1
        if all(acc.find(p) >= 0 for p in ps): return k
    return k
def start_addr(q):
    hits = [a for a in ADDRS if contains_from(a, q)]
    return hits[-1] if hits else None
def grade_at(q, a):
    qn = norm(q); qw = qn.split()
    if a not in NL or not qw: return 0.0
    if qn in span_text(a): return 1.0
    return win_ratio(qw, span_text(a).split())
def best_match(q):
    qn = norm(q); qw = qn.split()
    if len(qw) < 4: return None, 0.0
    best = (None, 0.0); qs = set(qw)
    for a in ADDRS:
        tw = span_text(a, 2).split()
        if len(qs & set(tw)) / len(qs) < 0.5: continue
        r = win_ratio(qw, tw)
        if r > best[1]: best = (a, r)
    return best

def grade(q, at):
    """-> (verdict, proposed_addr, ratio)"""
    if len(norm(q).split()) < 4: return 'SHORT', at, 0.0
    sa = start_addr(q)
    if sa is not None:
        k = covered(sa, q)
        if at in IDX and IDX[sa] <= IDX[at] < IDX[sa] + k: return 'STAND', at, 1.0
        # allow the citation to name the END verse of a span (e.g. quote runs 10:4-10:6 cited as 10:6)
        if at in IDX and 0 <= IDX[at] - IDX[sa] < k: return 'STAND', at, 1.0
        return 'RE_ANCHOR', sa, 1.0
    r_here = grade_at(q, at) if at in NL else 0.0
    ma, mr = best_match(q)
    if ma and mr >= 0.6 and mr > r_here + 0.1: return 'RE_ANCHOR_REWORDED', ma, round(mr, 2)
    if r_here >= 0.6: return 'REWORDED', at, round(r_here, 2)
    return 'NOT_FOUND', ma, round(mr, 2)

CIT = r"(?<![23] )(?:1 )?Enoch (\d+):(\d+)(?:[-–](\d+))?"
A = re.compile(r"\*([^*]+)\*[\s.,;:—–-]*\(" + CIT + r"\)")
B = re.compile(CIT + r"[\s:—–-]*\*([^*]+)\*")
ANY = re.compile(CIT)
DEGRADED = re.compile(r"wisdom-stream|The framework|Yoshi|Red Line #|canon-tier|\bS1\d\d\b|\(S\d+\)|short\.md|framework reads|substantial-substance|extras-tier witness", re.I)

out = []
for t in live['threads']:
    s = t['summary_md'] or ''
    if not ANY.search(s): continue
    quotes = []; seen = set()
    for m in A.finditer(s):
        quotes.append((m.group(1), f"{m.group(2)}:{m.group(3)}", m.group(4))); seen.add(m.span(1))
    for m in B.finditer(s):
        if m.span(4) in seen: continue
        quotes.append((m.group(4), f"{m.group(1)}:{m.group(2)}", m.group(3))); seen.add(m.span(4))
    cited = sorted({f"{m.group(1)}:{m.group(2)}" for m in ANY.finditer(s)}, key=lambda a: IDX.get(a, 10**6))
    quoted_addrs = {q[1] for q in quotes}
    citation_only = [a for a in cited if a not in quoted_addrs]
    det = []
    for q, at, v2 in quotes:
        v, prop, r = grade(q, at)
        det.append(dict(quote=q, cited=at, cited_end=v2, verdict=v, proposed=prop, ratio=r,
                        live_cited=L.get(at), live_proposed=L.get(prop) if prop else None))
    verse_state = {a: VS.get(a, 'unknown') for a in cited}
    anchor = None
    if t['a_book'] == '1-enoch' and t['a_ch'] is not None:
        a0 = f"{t['a_ch']}:{t['a_vn']}"; a1 = f"{t['z_ch']}:{t['z_vn']}" if t['z_ch'] is not None else a0
        anchor = dict(start=a0, end=a1, start_state=VS.get(a0, 'unknown'), end_state=VS.get(a1, 'unknown'),
                      start_live=L.get(a0), end_live=L.get(a1))
    verdicts = [d['verdict'] for d in det]
    degraded = bool(DEGRADED.search(s))
    removed = [a for a in cited if a not in L]
    anchor_gone = bool(anchor and (anchor['start_live'] is None or anchor['end_live'] is None))
    if 'NOT_FOUND' in verdicts or degraded or removed or anchor_gone: sv = 'REWRITE'
    elif any(v in ('RE_ANCHOR', 'REWORDED', 'RE_ANCHOR_REWORDED') for v in verdicts): sv = 'RE_QUOTE'
    elif not quotes: sv = 'CITATION_ONLY'
    else: sv = 'STAND'
    reasons = []
    if 'NOT_FOUND' in verdicts: reasons.append('not_found_quote')
    if degraded: reasons.append('degraded_prose')
    if removed: reasons.append('cited_verse_gone')
    if anchor_gone: reasons.append('anchor_verse_gone')
    out.append(dict(id=t['id'], slug=t['slug'], title=t['title'], tier=t['tier'], chapter_thread=t['slug'].startswith('1-enoch-'),
                    verdict=sv, reasons=reasons, n_quotes=len(quotes), quote_verdicts=verdicts, citation_only=citation_only,
                    verse_state=verse_state, anchor=anchor, degraded=degraded, det=det, summary_md=s))

json.dump(out, open(OUT / 'summary-regrade.json', 'w'), ensure_ascii=False, indent=1)
C = collections.Counter
print('summaries touching 1 Enoch:', len(out))
print('summary verdicts:', C(o['verdict'] for o in out))
print('  of which S250 chapter threads:', C(o['verdict'] for o in out if o['chapter_thread']))
print('  other threads:', C(o['verdict'] for o in out if not o['chapter_thread']))
print('reasons:', C(r for o in out for r in o['reasons']))
print('quote verdicts:', C(v for o in out for v in o['quote_verdicts']))
print('quotes total:', sum(o['n_quotes'] for o in out))
print('citation-only addrs on non-same verses:', C(o['verse_state'][a] for o in out for a in o['citation_only']))
print('anchor states (chapter threads):', C((o['anchor']['start_state'], o['anchor']['end_state']) for o in out if o['anchor']).most_common(12))
print('degraded prose:', sum(o['degraded'] for o in out))
