"""S504 — shorthand_census.py [live-dir] → out/shorthand_census_<date>.md (+ .json). PHASE 3 census: for every live read-back on disk
(_s495/live/<edition>__<book>.json), the THREADED cards (a member of at least one thread) whose live note is still S1xx shorthand — (1) starts with a
reader-visible `thread:slug |` prefix, (2) trips forbidden_scan / the rebuild's EXTRA rules (prose_scan, outside italics), or (3) is a stub under 60
characters; plus (4) the softer count of notes that only miss a sacred-name parenthetical. Per book, per thread (member counts), and the worst-first
thread list that becomes the batch plan. Read-only; nothing in the database is touched; the dumps are whatever dump503 last wrote (their schema_note
and mtime are printed so a stale dump is seen). Model: Claude Fable 5.1 (claude-fable-5-1)."""
import json, sys, re, datetime, collections
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common503 import *
from common496 import EXTRA, BARE_SACRED, BARE_ENGLISH
PREFIX = re.compile(r"^\s*thread:[a-z0-9-]+\s*\|")
def classify(note):
    """return (prefix, scan_hits, stub, names_only) for one live note"""
    n = note or ''
    prefix = bool(PREFIX.match(n)); body = PREFIX.sub('', n).strip()
    hits = list(forbidden_scan(body)); prose = strip_italics(body)
    for rx, label in EXTRA:
        m = rx.search(prose)
        if m: hits.append(f"{label}: '{m.group(0)}'")
    stub = len(body) < 60
    names_only = not hits and not prefix and not stub and bool(BARE_SACRED.search(prose) or BARE_ENGLISH.search(re.sub(r"\([^)]*\)", ' ', prose)))
    return prefix, hits, stub, names_only
def main(live_dir=None):
    live_dir = Path(live_dir) if live_dir else W / 'live'; today = datetime.date.today()
    books = []; per_thread = collections.defaultdict(lambda: dict(members=0, bad=0, prefix=0, scan=0, stub=0, title='', books=set()))
    for f in sorted(live_dir.glob('*__*.json')):
        ed, book = f.stem.split('__', 1); D = json.load(open(f)); T = {t['id']: t for t in D['threads']}
        threaded = collections.defaultdict(list)
        for m in D['members']: threaded[m['xref_id']].append(m)
        src = [c for c in D['cards'] if c['s_ed'] == ed and c['s_book'] == book]
        row = dict(edition=ed, book=book, title=title_of(ed, book), dumped=datetime.datetime.fromtimestamp(f.stat().st_mtime).strftime('%Y-%m-%d %H:%M'), note=D.get('schema_note', ''),
                   cards=len(src), threaded=0, orphan=0, bad=0, prefix=0, scan=0, stub=0, names_only=0, labels=collections.Counter(), examples=[])
        for c in src:
            ms = threaded.get(c['id'])
            if not ms: row['orphan'] += 1; continue
            row['threaded'] += 1; prefix, hits, stub, names_only = classify(c['note'])
            for m in ms:
                pt = per_thread[m['thread_id']]; pt['members'] += 1; pt['title'] = T.get(m['thread_id'], {}).get('title', m.get('slug', '')); pt['slug'] = m['slug']; pt['books'].add(book)
            if prefix or hits or stub:
                row['bad'] += 1; row['prefix'] += prefix; row['scan'] += bool(hits); row['stub'] += stub
                for h in hits: row['labels'][h.split(':')[0]] += 1
                if len(row['examples']) < 3: row['examples'].append((c['id'], f"{c['s_ch']}:{c['s_vn']}", (c['note'] or '')[:110].replace('\n', ' ')))
                for m in ms:
                    pt = per_thread[m['thread_id']]; pt['bad'] += 1; pt['prefix'] += prefix; pt['scan'] += bool(hits); pt['stub'] += stub
            elif names_only: row['names_only'] += 1
        books.append(row)
    tot = {k: sum(r[k] for r in books) for k in ('cards', 'threaded', 'orphan', 'bad', 'prefix', 'scan', 'stub', 'names_only')}
    worst = sorted((dict(id=k, **{kk: (sorted(v) if isinstance(v, set) else v) for kk, v in pt.items()}) for k, pt in per_thread.items() if pt['bad']), key=lambda t: -t['bad'])
    L = [f"# Phase 3 census — threaded cards still in S1xx shorthand ({today}; {len(books)} read-backs on disk)", '',
         f"**{tot['bad']} threaded cards need a rewrite** out of {tot['threaded']} threaded ({tot['orphan']} orphans left): `thread:` prefix {tot['prefix']} · forbidden/EXTRA scan {tot['scan']} · stub < 60 chars {tot['stub']} (a card can be more than one). A further {tot['names_only']} only miss a sacred-name parenthetical.", '',
         '| book | dumped | cards | threaded | orphan | NEED REWRITE | prefix | scan | stub | names only | top scan labels |', '|---|---|---|---|---|---|---|---|---|---|---|']
    for r in sorted(books, key=lambda r: -r['bad']):
        L.append(f"| {r['title']} | {r['dumped']} | {r['cards']} | {r['threaded']} | {r['orphan']} | **{r['bad']}** | {r['prefix']} | {r['scan']} | {r['stub']} | {r['names_only']} | {', '.join(f'{k} {v}' for k, v in r['labels'].most_common(4))} |")
    L += ['', f"## Threads, worst first ({len(worst)} threads carry shorthand members; top 40)", '', '| thread | members | need rewrite | prefix | scan | stub | books |', '|---|---|---|---|---|---|---|']
    for t in worst[:40]: L.append(f"| `{t['slug']}` (id {t['id']}) | {t['members']} | **{t['bad']}** | {t['prefix']} | {t['scan']} | {t['stub']} | {', '.join(t['books'])} |")
    L += ['', '## Three examples per book (id · verse · the live note as the reader sees it)', '']
    for r in books:
        if r['examples']: L += [f"**{r['title']}**"] + [f"- {i} · {v} · `{n}`" for i, v, n in r['examples']] + ['']
    out = W3 / 'out' / f'shorthand_census_{today}.md'; out.write_text('\n'.join(L) + '\n')
    json.dump(dict(date=str(today), totals=tot, books=[{k: (dict(v) if isinstance(v, collections.Counter) else v) for k, v in r.items()} for r in books], threads=worst), open(out.with_suffix('.json'), 'w'), ensure_ascii=False, indent=1, default=str)
    print('\n'.join(L[:4 + len(books) + 2])); print('->', out)
if __name__ == '__main__': main(sys.argv[1] if len(sys.argv) > 1 else None)
