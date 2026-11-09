"""S495 — check495.py <book> <dump.json>  — read-back check after the gap-fill migration (scratch dump or the live dump from dump495.py).
Depends only on the read-back shape (live / cards / members / threads) and fix/<book>.json. Per gap chapter: ≥1 card whose source is in
the chapter; every new card live with the whole target verse in italics (canon: parsed/canon.json wording by convention; other editions: live text) and the source verse (whole, or ≥8 verbatim words for the
one-way witness book) verbatim in the note; every new thread live with its summary + anchor; every member row live with its note;
0 duplicate (src,tgt,source) pairs in the book; 0 forbidden phrases in the new rows. Prints status tables and a final PASS/FAIL line;
exit code 1 on FAIL. Model: Claude Fable 5.1 (claude-fable-5-1)."""
import json, sys, collections
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common495 import *

def main(book, dump_path):
    fx = load_book_fix(book); ed = fx['edition']
    D = json.load(open(dump_path)); L = D['live']
    cards = [c for c in D['cards'] if c['s_ed'] == ed and c['s_book'] == book]
    by_pair = {(c['s_ch'], c['s_vn'], c['t_ed'], c['t_book'], c['t_ch'], c['t_vn']): c for c in cards}
    threads = {t['slug']: t for t in D['threads']}
    members = {(m['slug'], m['s_ch'], m['s_vn'], m['t_ed'], m['t_book'], m['t_ch'], m['t_vn']): m for m in D['members']}
    probs = []
    # ---- cards ----
    landed = 0
    for c in fx['cards']:
        k = (c['src_ch'], c['src_vn'], c['tgt_edition'], c['tgt_book'], c['tgt_ch'], c['tgt_vn']); lc = by_pair.get(k)
        where = f"card {c['src_ch']}:{c['src_vn']} -> {c['tgt_book']} {c['tgt_ch']}:{c['tgt_vn']}"
        if not lc: probs.append(f"{where}: not live"); continue
        if lc['note'] != c['note']: probs.append(f"{where}: live note differs from the fix")
        # canon targets are quoted from parsed/canon.json by convention; non-canon from the live text
        want = parsed_text('canon', c['tgt_book'], c['tgt_ch'], c['tgt_vn']) if c['tgt_edition'] == 'canon' else lc['t_text']
        if f"*{want}*" not in lc['note']: probs.append(f"{where}: live note lacks the whole target verse in italics ({'parsed canon' if c['tgt_edition'] == 'canon' else 'live'} text)")
        src_live = L.get(f"{ed}|{book}|{c['src_ch']}:{c['src_vn']}", lc['s_text'])
        if ed == 'lightfoot-apostolic-fathers':
            if not has_phrase_of(lc['note'], src_live, 8): probs.append(f"{where}: live note lacks a ≥8-word verbatim run of the source verse")
        elif src_live not in lc['note']: probs.append(f"{where}: live note lacks the whole source verse")
        if lc['tier'] != c['tier']: probs.append(f"{where}: tier {lc['tier']} ≠ {c['tier']}")
        if lc['source'] != 'manual': probs.append(f"{where}: source {lc['source']}")
        for p in forbidden_scan(lc['note']): probs.append(f"{where}: forbidden {p}")
        landed += 1
    print(f"cards landed as written: {landed}/{len(fx['cards'])}")
    # ---- threads ----
    tl = 0
    for t in fx['threads']:
        lt = threads.get(t['slug']); where = f"thread {t['slug']}"
        if not lt: probs.append(f"{where}: not live"); continue
        ok = True
        if lt['summary_md'] != t['summary_md']: probs.append(f"{where}: summary differs"); ok = False
        if (lt['title'] or '') != t['title']: probs.append(f"{where}: title differs"); ok = False
        if (lt['a_ed'], lt['a_book'], lt['a_ch'], lt['a_vn']) != (ed, book, t['ch'], t['anchor_start_vn']) or (lt['z_ch'], lt['z_vn']) != (t['ch'], t['anchor_end_vn']):
            probs.append(f"{where}: anchor {lt['a_ed']}/{lt['a_book']} {lt['a_ch']}:{lt['a_vn']}–{lt['z_ch']}:{lt['z_vn']} ≠ {t['ch']}:{t['anchor_start_vn']}–{t['anchor_end_vn']}"); ok = False
        if lt['tier'] != t['tier']: probs.append(f"{where}: tier {lt['tier']} ≠ {t['tier']}"); ok = False
        if lt['sort_order'] != t['sort_order']: probs.append(f"{where}: sort_order {lt['sort_order']} ≠ {t['sort_order']}"); ok = False
        for p in forbidden_scan(lt['summary_md'] or '') + forbidden_scan(lt['title'] or ''): probs.append(f"{where}: forbidden {p}"); ok = False
        tl += ok
    print(f"threads landed as written: {tl}/{len(fx['threads'])}")
    for j in fx['joins']:
        if j['join_slug'] not in threads: probs.append(f"joined thread {j['join_slug']} not live")
    # ---- members ----
    ml = 0
    for m in fx['members']:
        k = (m['thread_slug'], m['src_ch'], m['src_vn'], m['tgt_edition'], m['tgt_book'], m['tgt_ch'], m['tgt_vn']); lm = members.get(k)
        where = f"member {m['thread_slug']} <- {m['src_ch']}:{m['src_vn']} -> {m['tgt_book']} {m['tgt_ch']}:{m['tgt_vn']}"
        if not lm: probs.append(f"{where}: not live"); continue
        if (lm['member_note'] or '') != m['member_note']: probs.append(f"{where}: member note differs"); continue
        if lm['sort_order'] != m['sort_order']: probs.append(f"{where}: sort_order {lm['sort_order']} ≠ {m['sort_order']}"); continue
        for p in forbidden_scan(lm['member_note'] or ''): probs.append(f"{where}: forbidden {p}")
        ml += 1
    print(f"members landed as written: {ml}/{len(fx['members'])}")
    # ---- book-wide ----
    pairs = collections.Counter((c['s_ch'], c['s_vn'], c['t_ed'], c['t_book'], c['t_ch'], c['t_vn'], c['source']) for c in cards)
    dups = sum(1 for v in pairs.values() if v > 1)
    print(f"duplicate (src,tgt,source) pairs in {book}: {dups}")
    if dups: probs.append(f"{dups} duplicate pair(s) in the book")
    # ---- per gap chapter table ----
    print(f"\n{'ch':>4} | {'cards':>5} | {'members':>7} | thread(s)")
    for ch in fx['gap_chapters']:
        n = sum(1 for c in cards if c['s_ch'] == ch)
        slugs = sorted({m['thread_slug'] for m in fx['members'] if m['src_ch'] == ch})
        nm = sum(1 for m in D['members'] if m['s_ed'] == ed and m['s_book'] == book and m['s_ch'] == ch and m['slug'] in slugs)
        status = '' if n >= 1 else '  <-- NO CARD'
        if n < 1: probs.append(f"gap chapter {ch} still has no card")
        print(f"{ch:>4} | {n:>5} | {nm:>7} | {', '.join(s + ('' if s in threads else ' (MISSING)') for s in slugs)}{status}")
    print(f"\nlive verses in dump: {len(L)} | cards with source in {book}: {len(cards)} | members: {len(D['members'])} | threads: {len(D['threads'])}")
    for p in probs: print('  PROBLEM:', p)
    ok = not probs
    print(f"check495 {book}: {'PASS' if ok else 'FAIL'} ({len(probs)} problem(s))")
    return 0 if ok else 1

if __name__ == '__main__':
    if len(sys.argv) < 3: sys.exit(__doc__)
    sys.exit(main(sys.argv[1], sys.argv[2]))
