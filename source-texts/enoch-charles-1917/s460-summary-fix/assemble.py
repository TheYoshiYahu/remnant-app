"""Assemble the S460 summary fix: fork output + mechanical re-quotes → fix_summaries.json; verify every italic."""
import json, re, glob, unicodedata, collections, difflib
from pathlib import Path as _P
HERE = str(_P(__file__).resolve().parent); HERE_UP = str(_P(HERE).parent)
from pathlib import Path
SRC = Path(HERE_UP + '')
live = json.load(open(SRC / 'enoch-cards-live.json')); L = live['enoch_live']
RG = {s['id']: s for s in json.load(open(SRC / 's460-summary-fix/summary-regrade.json'))}
RQ = json.load(open(HERE + '/requote.json'))
threads = {t['id']: t for t in live['threads']}

def norm(s):
    s = unicodedata.normalize('NFKD', s or '')
    s = ''.join(ch for ch in s if not unicodedata.combining(ch))
    s = re.sub(r"\([^)]*\)", " ", s); s = re.sub(r"[\[\]‘’'“”\"]", "", s).lower()
    s = re.sub(r"[^a-z0-9 ]+", " ", s); return re.sub(r"\s+", " ", s).strip()
NL = {a: norm(t) for a, t in L.items()}; ADDRS = list(L); IDX = {a: i for i, a in enumerate(ADDRS)}
ENOCH_RUNS = {}
for i, a in enumerate(ADDRS):
    acc = ''
    for j in range(i, min(i + 8, len(ADDRS))):
        if ADDRS[j].split(':')[0] != a.split(':')[0] and j > i: break
        acc = (acc + ' ' + NL[ADDRS[j]]).strip(); ENOCH_RUNS[acc] = (a, ADDRS[j])
def enoch_run(qn):
    return ENOCH_RUNS.get(qn)

# pool of app-register quotes: every italic with a citation in every live thread summary and card/member note
POOL = {}  # norm(quote) -> (book, addr)
CITE = re.compile(r"\*([^*]+)\*[\s.,;:—–-]*\(([^()]*?\d+:\d+(?:[-–]\d+)?)\)")
for t in live['threads']:
    for m in CITE.finditer(t['summary_md'] or ''): POOL.setdefault(norm(m.group(1)), m.group(2))
for c in live['cards']:
    for m in CITE.finditer(c['note'] or ''): POOL.setdefault(norm(m.group(1)), m.group(2))
for mm in live['members']:
    for m in CITE.finditer(mm['member_note'] or ''): POOL.setdefault(norm(m.group(1)), m.group(2))
IDXV = {norm(v): k for k, v in json.load(open(HERE + '/packets/verse_index.json')).items()}
_C = json.load(open(HERE + '/canon_index.json')); CANONN = set()
_keys = list(_C)
for j, k in enumerate(_keys):
    acc = ''
    for m in range(3):
        if j + m >= len(_keys): break
        k2 = _keys[j + m]
        if k2.rsplit(':', 1)[0] != k.rsplit(':', 1)[0]: break
        acc = (acc + ' ' + norm(_C[k2])).strip(); CANONN.add(acc)
from patches import PATCHES
MANUAL = {663: [("*and in those days shall the earth also give back that which has been entrusted to it, And Sheol also shall give back that which it has received ... For in those days the Elect One shall arise* (1 Enoch 51:1)",
                 "*" + ' '.join(L[a] for a in ('51:1', '51:2', '51:3')) + "* (1 Enoch 51:1-3)")]}

DEGRADED = re.compile(r"wisdom-stream|The framework|Yoshi|Red Line #|canon-tier|\bS1\d\d\b|\(S\d+\)|short\.md|framework|substantial|extras-tier|apparatus|CHRISTOLOGY|the library's witness|commentary", re.I)
CIT_ANY = re.compile(r"(?<![23] )(?:1 )?Enoch (\d+):(\d+)(?:[-–](\d+))?")

fix = {}   # id -> dict(title, summary_md, action, note, source)
for f in sorted(glob.glob(HERE + '/out/batch_[0-9][0-9].json')):
    for it in json.load(open(f)):
        fix[it['id']] = dict(title=it['title'], summary_md=it['summary_md'], action=it['action'], note=it.get('note', ''), source=Path(f).stem)
for k, v in RQ.items():
    i = int(k)
    if i in fix or v['verdict'] != 'RE_QUOTE': continue
    fix[i] = dict(title=threads[i]['title'], summary_md=v['new'], action='requoted', note='mechanical re-quote', source='requote')

CANON = json.load(open(HERE + '/canon_index.json'))
IDXFULL = json.load(open(HERE + '/packets/verse_index.json'))
ANYCIT = re.compile(r"[\s.,;:—–-]*\(([^()]*?)\s(\d+):(\d+)(?:[-–](\d+))?\)")
BOOKMAP = {'psalm': 'psalms', 'song of songs': 'song-of-solomon'}
def canon_text(book, ch, v1, v2):
    slug = BOOKMAP.get(book.lower(), book.lower().replace(' ', '-'))
    vs = [CANON.get(f"{slug} {ch}:{v}") for v in range(int(v1), int(v2 or v1) + 1)]
    return ' '.join(vs) if all(vs) else None
fixups = collections.Counter()
for i, x in fix.items():
    old = threads[i]['summary_md'] or ''; new = x['summary_md']
    old_it = {norm(m) for m in re.findall(r"\*([^*]+)\*", old)}
    def repl(m):
        q = m.group(1); qn = norm(q)
        if len(qn.split()) < 4 or qn in old_it or qn in POOL: return m.group(0)
        tail = new[m.end():m.end() + 60]
        c = ANYCIT.match(tail)
        if not c or CIT_ANY.match(c.group(1) + ' ' + c.group(2) + ':' + c.group(3)) or 'Enoch' in c.group(1): return m.group(0)
        ct = canon_text(c.group(1), c.group(2), c.group(3), c.group(4))
        if ct is None: return m.group(0)
        pieces = [norm(p) for p in re.split(r"\.\.\.|…", q) if norm(p)]
        if norm(ct) == qn: return m.group(0)
        fixups['replaced_from_canon'] += 1
        return '*' + ct + '*'
    new2 = re.sub(r"\*([^*]+)\*", repl, new)
    for a, b in MANUAL.get(i, []) + PATCHES.get(i, []):
        assert a in new2, (i, a[:40]); new2 = new2.replace(a, b); fixups['manual'] += 1
    x['summary_md'] = new2
print('canon fix-ups:', dict(fixups))
problems = collections.defaultdict(list); stats = collections.Counter()
for i, x in fix.items():
    old = threads[i]['summary_md'] or ''; new = x['summary_md']
    old_it = {norm(m) for m in re.findall(r"\*([^*]+)\*", old)}
    if DEGRADED.search(new) or DEGRADED.search(x['title']): problems['degraded'].append((i, DEGRADED.search(new + x['title']).group(0)))
    if new == old and x['action'] != 'kept': problems['unchanged'].append(i)
    n = len(new.split())
    if n < 70 or n > 420: problems['length'].append((i, n))
    # every Enoch citation must have a live verse
    for m in CIT_ANY.finditer(new):
        a = f"{m.group(1)}:{m.group(2)}"
        if a not in L: problems['dead_citation'].append((i, a))
        if m.group(3) and f"{m.group(1)}:{m.group(3)}" not in L: problems['dead_citation'].append((i, f"{m.group(1)}:{m.group(3)}"))
    # every italic: Enoch run verbatim, or kept from old, or from pool, or from verse_index (wrong register → flag)
    for m in re.finditer(r"\*([^*]+)\*", new):
        q = m.group(1); qn = norm(q)
        if len(qn.split()) < 4: continue
        tail = new[m.end():m.end() + 40]; head = new[max(0, m.start() - 40):m.start()]
        ecit = re.match(r"[\s.,;:—–-]*\(" + CIT_ANY.pattern + r"\)", tail) or re.search(CIT_ANY.pattern + r"[\s:—–-]*$", head)
        if ecit:
            run = enoch_run(qn)
            if run is None:
                # tolerate an abridged "…" quote only if every piece is in the cited verse's 4-verse span
                a = f"{ecit.group(1)}:{ecit.group(2)}"
                ok = a in L and all(p in ' '.join(NL[b] for b in ADDRS[IDX[a]:IDX[a] + 4]) for p in [norm(p) for p in re.split(r"\.\.\.|…", q) if norm(p)])
                if not ok: problems['enoch_quote_not_live'].append((i, a, q[:80]))
                else: stats['enoch_abridged_ok'] += 1
            else:
                a = f"{ecit.group(1)}:{ecit.group(2)}"
                if not (IDX[run[0]] <= IDX.get(a, -1) <= IDX[run[1]]): problems['enoch_cited_wrong'].append((i, a, run, q[:60]))
                else: stats['enoch_ok'] += 1
        elif qn in old_it: stats['kept_italic'] += 1
        elif qn in CANONN: stats['canon_italic'] += 1
        elif qn in POOL: stats['pool_italic'] += 1
        elif qn in IDXV: problems['verse_index_register'].append((i, IDXV[qn], q[:80]))
        else: problems['unknown_italic'].append((i, q[:100]))
json.dump(fix, open(HERE + '/fix_summaries.json', 'w'), ensure_ascii=False, indent=1)
print('fix entries:', len(fix), collections.Counter(x['action'] for x in fix.values()))
print('stats:', dict(stats))
for k, v in problems.items(): print(f'PROBLEM {k}: {len(v)}', v[:8])
json.dump(problems, open(HERE + '/problems.json', 'w'), ensure_ascii=False, indent=1)
