"""S503b — check503b.py [matthew-read-back.json]: after the re-point migration — each card of fix/repoint503.json sits on its NEW target with the new
note, its member note in its thread is the new one, and it sits in exactly that thread. Exit 1 on FAIL. Model: Claude Fable 5.1 (claude-fable-5-1)."""
import json, sys, collections
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common503 import *
fx = json.load(open(W3 / 'fix' / 'repoint503.json')); D = json.load(open(sys.argv[1])) if len(sys.argv) > 1 else load503('canon', 'matthew')
C = {c['id']: c for c in D['cards']}; mem = collections.defaultdict(dict)
for m in D['members']: mem[m['xref_id']][m['slug']] = m
p = []; n = 0
for c in fx['cards']:
    lc = C.get(c['id']); w = f"card {c['id']}"
    if not lc: p.append(f"{w} not in dump"); continue
    if (lc['s_ch'], lc['s_vn'], lc['t_ed'], lc['t_book'], lc['t_ch'], lc['t_vn']) != (c['src_ch'], c['src_vn'], c['t_ed'], c['tgt_book'], c['tgt_ch'], c['tgt_vn']): p.append(f"{w} not on its new pair"); continue
    if lc['note'] != c['note']: p.append(f"{w} note differs"); continue
    m = mem[c['id']].get(c['thread'])
    if not m or m['member_note'] != c['member_note']: p.append(f"{w} member note differs or missing"); continue
    if set(mem[c['id']]) != {c['thread']}: p.append(f"{w} in other threads too"); continue
    n += 1
print(f"re-point pass: cards as written {n}/{len(fx['cards'])} (re-pointed {sum(c['repointed'] for c in fx['cards'])})")
for x in p: print('PROBLEM:', x)
print(f"check503b: {'PASS' if not p else 'FAIL'} ({len(p)} problem(s))"); sys.exit(1 if p else 0)
