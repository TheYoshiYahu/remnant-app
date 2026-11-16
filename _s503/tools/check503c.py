"""S503c — check503c.py <slug> [read-back.json]: after the sweep migration, on a fresh dump of the anchor book — the thread's title/summary, each
rewritten card's note and member note equal fix/sweep/<slug>.json; no card moved. Exit 1 on FAIL. Model: Claude Fable 5.1 (claude-fable-5-1)."""
import json, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common503 import *
slug = sys.argv[1]; fx = json.load(open(W3 / 'fix' / 'sweep' / f'{slug}.json')); book = json.load(open(W3 / 'out' / 'sweep' / f'{slug}.json'))['anchor_book']
D = json.load(open(sys.argv[2])) if len(sys.argv) > 2 else load503('canon', book)
C = {c['id']: c for c in D['cards']}; T = {t['id']: t for t in D['threads']}; M = {(m['thread_id'], m['xref_id']): m for m in D['members']}
p = []; n = m = 0
for c in fx['cards']:
    lc = C.get(c['id'])
    if not lc: p.append(f"card {c['id']} not in dump"); continue
    if (lc['s_ch'], lc['s_vn'], lc['t_book'], lc['t_ch'], lc['t_vn']) != (c['src_ch'], c['src_vn'], c['tgt_book'], c['tgt_ch'], c['tgt_vn']): p.append(f"card {c['id']} moved")
    if lc['note'] == c['note']: n += 1
    else: p.append(f"card {c['id']} note differs")
    mm = M.get((c['thread_id'], c['id']))
    if mm and mm['member_note'] == c['member_note']: m += 1
    else: p.append(f"card {c['id']} member note differs or missing")
t = T.get(fx['thread']['id']); tok = bool(t) and t['title'] == fx['thread']['title'] and t['summary_md'] == fx['thread']['summary']
if not tok: p.append(f"thread {fx['thread']['id']} title/summary differ")
print(f"notes as written: {n}/{len(fx['cards'])} | member notes as written: {m}/{len(fx['cards'])} | thread {fx['thread']['id']} title+summary as written: {'yes' if tok else 'NO'}")
for x in p: print('PROBLEM:', x)
print(f"check503c {slug}: {'PASS' if not p else 'FAIL'} ({len(p)} problem(s))"); sys.exit(1 if p else 0)
