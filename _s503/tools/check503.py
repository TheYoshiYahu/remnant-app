"""S503 — check503.py [live-dir] — read-back check after the stragglers migration, over fresh dumps of the eight books (default: the chain's
_s495/live/ files, re-dumped by the deploy script). Per card of the fix: still on its verse pair, live note equal to the fix note, carrying the whole
target verse and the whole source verse in italics; a member row in its thread with the member note, ordered after the thread's earlier members;
no forbidden phrase; 0 duplicate pairs; and EVERY book of the eight left with NO orphan card. Exit 1 on FAIL. Model: Claude Fable 5.1 (claude-fable-5-1)."""
import json, sys, collections
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common503 import *
def main(live_dir=None):
    fx = json.load(open(W3 / 'fix' / 'stragglers503.json')); probs = []; ok_n = ok_m = 0
    FX = {c['id']: c for c in fx['cards']}
    print(f"{'book':<22} | {'cards':>5} | {'rewritten':>9} | {'orphans left':>12}")
    for ed, book in BOOKS503:
        p = (Path(live_dir) / f'{ed}__{book}.json') if live_dir else live503(ed, book)
        D = json.load(open(p)); C = {c['id']: c for c in D['cards']}; mem = collections.defaultdict(dict)
        for m in D['members']: mem[m['xref_id']][m['slug']] = m
        old_max = collections.defaultdict(int)
        for m in D['members']:
            if m['xref_id'] not in FX: old_max[m['slug']] = max(old_max[m['slug']], m['sort_order'] or 0)
        mine = [c for c in fx['cards'] if (c['s_ed'], c['s_book']) == (ed, book)]
        for c in mine:
            w = f"card {c['id']} ({title_of(ed, book)} {c['src_ch']}:{c['src_vn']} -> {title_of(c['t_ed'], c['tgt_book'])} {c['tgt_ch']}:{c['tgt_vn']})"; lc = C.get(c['id'])
            if not lc: probs.append(f"{w}: not in the dump"); continue
            if (lc['s_ed'], lc['s_book'], lc['s_ch'], lc['s_vn'], lc['t_ed'], lc['t_book'], lc['t_ch'], lc['t_vn']) != (ed, book, c['src_ch'], c['src_vn'], c['t_ed'], c['tgt_book'], c['tgt_ch'], c['tgt_vn']): probs.append(f"{w}: verse pair changed"); continue
            good = True
            if lc['note'] != c['note']: probs.append(f"{w}: live note differs from the fix"); good = False
            if f"*{c['tgt_text']}*" not in (lc['note'] or ''): probs.append(f"{w}: note lacks the whole target verse in italics"); good = False
            if f"*{lc['s_text']}* ({title_of(ed, book)} {c['src_ch']}:{c['src_vn']})" not in (lc['note'] or ''): probs.append(f"{w}: note lacks the whole source verse as it reads live"); good = False
            if lc['tier'] != c['tier']: probs.append(f"{w}: tier changed {c['tier']} -> {lc['tier']}"); good = False
            for x in (prose_scan(c['prose']) if lc['note'] == c['note'] else []): probs.append(f"{w}: forbidden {x}"); good = False
            ok_n += good
            lm = mem[c['id']].get(c['thread'])
            if not lm: probs.append(f"{w}: no member row in {c['thread']}"); continue
            if (lm['member_note'] or '') != c['member_note']: probs.append(f"{w}: member note differs"); continue
            if (lm['sort_order'] or 0) <= old_max[c['thread']]: probs.append(f"{w}: member sort_order {lm['sort_order']} not after the thread's earlier members ({old_max[c['thread']]})"); continue
            if set(mem[c['id']]) != {c['thread']}: probs.append(f"{w}: sits in other threads too: {sorted(set(mem[c['id']]) - {c['thread']})}"); continue
            ok_m += 1
        src = [c for c in D['cards'] if c['s_ed'] == ed and c['s_book'] == book]
        pairs = collections.Counter((c['s_ch'], c['s_vn'], c['t_ed'], c['t_book'], c['t_ch'], c['t_vn'], c['source']) for c in src)
        dups = sum(1 for v in pairs.values() if v > 1)
        if dups: probs.append(f"{book}: {dups} duplicate (src,tgt,source) pair(s)")
        left = [c['id'] for c in src if not mem[c['id']]]
        if left: probs.append(f"{book}: {len(left)} card(s) still in no thread: {left[:8]}")
        print(f"{title_of(ed, book):<22} | {len(src):>5} | {len(mine):>9} | {len(left):>12}")
    print(f"notes rewritten as written: {ok_n}/{len(fx['cards'])}")
    print(f"members landed as written: {ok_m}/{len(fx['members'])}")
    for p in probs: print('  PROBLEM:', p)
    print(f"check503 stragglers: {'PASS' if not probs else 'FAIL'} ({len(probs)} problem(s))")
    return 0 if not probs else 1
if __name__ == '__main__': sys.exit(main(sys.argv[1] if len(sys.argv) > 1 else None))
