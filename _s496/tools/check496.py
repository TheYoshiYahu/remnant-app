"""S496 — check496.py <batch> <dump.json>  — read-back check after the rebuild migration (scratch dump or the live dump from dump496.py).
Per card of the fix: still on its verse pair, the live note equal to the fix note and carrying the whole target verse (parsed canon
wording) in italics and the whole Matthew verse as it reads live; a member row in its thread with the member note, ordered after the
thread's earlier members; every new thread live with summary + anchor; every anchored thread carrying its anchor; no forbidden phrase
in any rewritten note; 0 duplicate pairs in the book; and the chapters of the batch left with NO orphan card. Status table per chapter
and a final PASS/FAIL line; exit 1 on FAIL. Model: Claude Fable 5.1 (claude-fable-5-1)."""
import json, sys, collections
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common496 import *

def main(batch, dump_path):
    book, chapters = BATCHES[batch]; fx = json.load(open(W6 / 'fix' / f'{book}_{batch}.json'))
    D = json.load(open(dump_path)); L = D['live']
    C = {c['id']: c for c in D['cards']}; T = {t['slug']: t for t in D['threads']}
    mem = collections.defaultdict(dict)
    for m in D['members']: mem[m['xref_id']][m['slug']] = m
    probs = []; ok_n = ok_m = 0
    old_max = collections.defaultdict(int)
    fixed_ids = {c['id'] for c in fx['cards']}
    for m in D['members']:
        if m['xref_id'] not in fixed_ids: old_max[m['slug']] = max(old_max[m['slug']], m['sort_order'] or 0)
    for c in fx['cards']:
        w = f"card {c['id']} ({c['src_ch']}:{c['src_vn']} -> {c['tgt_book']} {c['tgt_ch']}:{c['tgt_vn']})"; lc = C.get(c['id'])
        if not lc: probs.append(f"{w}: not in the dump"); continue
        if (lc['s_book'], lc['s_ch'], lc['s_vn'], lc['t_book'], lc['t_ch'], lc['t_vn']) != (book, c['src_ch'], c['src_vn'], c['tgt_book'], c['tgt_ch'], c['tgt_vn']): probs.append(f"{w}: verse pair changed"); continue
        good = True
        if lc['note'] != c['note']: probs.append(f"{w}: live note differs from the fix"); good = False
        if f"*{parsed_text('canon', c['tgt_book'], c['tgt_ch'], c['tgt_vn'])}*" not in (lc['note'] or ''): probs.append(f"{w}: note lacks the whole target verse in italics (parsed canon wording)"); good = False
        if f"*{lc['s_text']}* (Matthew {c['src_ch']}:{c['src_vn']})" not in (lc['note'] or ''): probs.append(f"{w}: note lacks the whole Matthew verse as it reads live"); good = False
        if lc['tier'] != c['tier']: probs.append(f"{w}: tier changed {c['tier']} -> {lc['tier']}"); good = False
        for p in prose_scan(c['prose']) if lc['note'] == c['note'] else []: probs.append(f"{w}: forbidden {p}"); good = False
        ok_n += good
        lm = mem[c['id']].get(c['thread'])
        if not lm: probs.append(f"{w}: no member row in {c['thread']}"); continue
        if (lm['member_note'] or '') != c['member_note']: probs.append(f"{w}: member note differs"); continue
        if (lm['sort_order'] or 0) <= old_max[c['thread']]: probs.append(f"{w}: member sort_order {lm['sort_order']} not after the thread's earlier members ({old_max[c['thread']]})"); continue
        if set(mem[c['id']]) != {c['thread']}: probs.append(f"{w}: sits in other threads too: {sorted(set(mem[c['id']]) - {c['thread']})}"); continue
        ok_m += 1
    print(f"notes rewritten as written: {ok_n}/{len(fx['cards'])}")
    print(f"members landed as written: {ok_m}/{len(fx['members'])}")
    tn = 0
    for t in fx['threads']:
        lt = T.get(t['slug']); w = f"new thread {t['slug']}"
        if not lt: probs.append(f"{w}: not live"); continue
        if lt['summary_md'] != t['summary_md'] or lt['title'] != t['title']: probs.append(f"{w}: title/summary differs"); continue
        if (lt['a_book'], lt['a_ch'], lt['a_vn'], lt['z_vn']) != (book, t['ch'], t['anchor_start_vn'], t['anchor_end_vn']): probs.append(f"{w}: anchor differs"); continue
        tn += 1
    print(f"new threads landed as written: {tn}/{len(fx['threads'])}")
    an = 0
    for a in fx['anchors']:
        lt = T.get(a['slug'])
        if not lt: probs.append(f"anchor {a['slug']}: thread not live"); continue
        if (lt['a_book'], lt['a_ch'], lt['a_vn'], lt['z_vn']) != (a['book'], a['ch'], a['a_vn'], a['z_vn']): probs.append(f"anchor {a['slug']}: live anchor {lt['a_book']} {lt['a_ch']}:{lt['a_vn']}-{lt['z_vn']} ≠ {a['book']} {a['ch']}:{a['a_vn']}-{a['z_vn']}"); continue
        an += 1
    print(f"anchors set as written: {an}/{len(fx['anchors'])}")
    src = [c for c in D['cards'] if c['s_ed'] == 'canon' and c['s_book'] == book]
    pairs = collections.Counter((c['s_ch'], c['s_vn'], c['t_ed'], c['t_book'], c['t_ch'], c['t_vn'], c['source']) for c in src)
    dups = sum(1 for v in pairs.values() if v > 1); print(f"duplicate (src,tgt,source) pairs in {book}: {dups}")
    if dups: probs.append(f"{dups} duplicate pair(s)")
    print(f"\n{'ch':>3} | {'cards':>5} | {'rewritten':>9} | {'orphans left':>12}")
    for ch in chapters:
        cs = [c for c in src if c['s_ch'] == ch]; left = [c['id'] for c in cs if not mem[c['id']]]
        if left: probs.append(f"chapter {ch}: {len(left)} card(s) still in no thread: {left[:8]}")
        print(f"{ch:>3} | {len(cs):>5} | {sum(1 for c in fx['cards'] if c['src_ch'] == ch):>9} | {len(left):>12}")
    print(f"orphan cards left in the whole book: {sum(1 for c in src if not mem[c['id']])}")
    for p in probs: print('  PROBLEM:', p)
    print(f"check496 {book} {batch}: {'PASS' if not probs else 'FAIL'} ({len(probs)} problem(s))")
    return 0 if not probs else 1

if __name__ == '__main__':
    if len(sys.argv) < 3: sys.exit(__doc__)
    sys.exit(main(sys.argv[1], sys.argv[2]))
