"""S495 — assemble495.py <book>  →  fix/<book>.json (+ fix/<book>_report.md)
Reads out/<book>_draft.json (or out/<book>_fixed.json when it exists; testaments-xii is merged from its _A/_B files), checks every
card / thread / member BY CONTENT against the live read-back (live/<edition>__<book>.json) and the parsed target editions, and
writes the fix file only when every hard rule passes. Exit code 1 on any FAIL; the per-item report is printed and written either way.
Hard rules: source verse live, target verse parsed, source ≠ target, no duplicate pair (within the draft or against live cards),
note carries BOTH whole verses verbatim (target inside *…*), member note carries the target citation + ≥6 verbatim words of the target,
thread slug shape / uniqueness / join target exists, summary ≥120 words, anchors in the chapter, every italic-with-citation verbatim,
forbidden-phrase scan on notes, member notes, summaries and titles. Nothing is auto-fixed — prose problems are reported, not edited.
Model: Claude Fable 5.1 (claude-fable-5-1)."""
import json, re, sys, os, collections
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common495 import *

def load_draft(book):
    """returns (merged draft dict, list of files used). S495_DRAFT=<path> forces one file (the self-test)."""
    out = W / 'out'
    if os.environ.get('S495_DRAFT'):
        p = Path(os.environ['S495_DRAFT']); return json.load(open(p)), [p]
    def pick(stem):
        for suf in ('_fixed.json', '_draft.json'):
            p = out / (stem + suf)
            if p.exists(): return p
        return None
    if book == 'testaments-xii' and not (out / 'testaments-xii_fixed.json').exists() and not (out / 'testaments-xii_draft.json').exists():
        parts = [pick('testaments-xii_A'), pick('testaments-xii_B')]
        parts = [p for p in parts if p]
        if not parts: sys.exit(f"no draft for {book} in {out}")
        ds = [json.load(open(p)) for p in parts]
        merged = dict(ds[0]); merged['chapters'] = [c for d in ds for c in d['chapters']]
        merged['model'] = ' + '.join(sorted({d.get('model', '?') for d in ds}))
        return merged, parts
    p = pick(book)
    if p is None: sys.exit(f"no draft for {book} in {out}")
    return json.load(open(p)), [p]

def main(book):
    if book not in BOOKS: sys.exit(f"unknown book {book}; one of {sorted(BOOKS)}")
    ed = BOOKS[book]
    draft, files = load_draft(book)
    live = load_live(book); L = live['live']
    if draft.get('edition') not in (None, ed) or draft.get('book') not in (None, book):
        print(f"WARN draft says {draft.get('edition')}/{draft.get('book')} — expected {ed}/{book}")
    live_cards = [c for c in live['cards'] if c['s_ed'] == ed and c['s_book'] == book]
    live_pairs = {(c['s_ch'], c['s_vn'], c['t_ed'], c['t_book'], c['t_ch'], c['t_vn']) for c in live_cards}
    book_threads = {t['slug']: t for t in live['threads'] if t['a_ed'] == ed and t['a_book'] == book}
    all_thread_slugs = {t['slug'] for t in live['threads']}
    thread_members_max = collections.defaultdict(int)
    for m in live['members']: thread_members_max[m['slug']] = max(thread_members_max[m['slug']], m['sort_order'] or 0)
    chapter_vns = collections.defaultdict(set)
    for k in L:
        _, _, cv = k.split('|'); c, v = map(int, cv.split(':')); chapter_vns[c].add(v)
    # other live files: used to warn when a parsed target differs from the live text (the SQL guard would RAISE)
    other_live = live_authority(book)
    def text_for(e, slug, ch, vn):
        """text a quotation is checked against: canon → parsed/canon.json by convention; this book → live map; else live read-back, else parsed"""
        if e == 'canon': return parsed_text(e, slug, ch, vn)
        k = f"{e}|{slug}|{ch}:{vn}"
        if k in L: return L[k]
        if k in other_live: return other_live[k]
        return parsed_text(e, slug, ch, vn)

    report = []   # (level, where, msg)
    def fail(where, msg): report.append(('FAIL', where, msg))
    def warn(where, msg): report.append(('WARN', where, msg))

    def check_quotes(text, where):
        """every italic followed (or led) by a citation naming a verse — verbatim against the live/parsed text"""
        seen = set()
        for rx, qi in ((TRAIL_RE, 1), (LEAD_RE, 5)):
            for m in rx.finditer(text):
                q = m.group(qi); e, slug = NAMES[m.group('name')]; c = int(m.group('c')); v = int(m.group('v')); v2 = int(m.group('v2')) if m.group('v2') else v
                key = (q, e, slug, c, v, v2)
                if key in seen: continue
                seen.add(key)
                span = [text_for(e, slug, c, k) for k in range(v, v2 + 1)]
                if any(s is None for s in span):
                    fail(where, f"citation {m.group('name')} {c}:{v}{'–' + str(v2) if v2 != v else ''}: no such verse in the library texts"); continue
                ok, detail = quote_in(' '.join(span), q)
                if not ok: fail(where, f"italic quotation off at {m.group('name')} {c}:{v}{'–' + str(v2) if v2 != v else ''} — {detail}; quote: '{q[:80]}'")
                elif detail: warn(where, f"{m.group('name')} {c}:{v}: {detail}")
        # a bare citation of this book / canon that names no verse
        for m in re.finditer(rf"\((?P<name>{NAME_RE})\.? (?P<c>\d+):(?P<v>\d+)\)", text):
            e, slug = NAMES[m.group('name')]
            if text_for(e, slug, int(m.group('c')), int(m.group('v'))) is None: fail(where, f"citation ({m.group(0)[1:-1]}) names a verse that does not exist")

    def scan(text, where):
        for p in forbidden_scan(text): fail(where, 'forbidden: ' + p)

    card_tier = majority_tier(live, ed, book)
    print(f"card tier for {book}: '{card_tier}' (majority of the book's live cards; drafter tier field ignored) | thread tier 'extras'")
    # ---- sort band for new threads: next 1000 above the book's max, bumped past any band another live book already uses ----
    book_max = max([t['sort_order'] or 0 for t in book_threads.values()] or [0])
    band = (book_max // 1000 + 1) * 1000
    all_sorts = set()
    for f in (W / 'live').glob('*__*.json'):
        try: all_sorts |= {t['sort_order'] or 0 for t in json.load(open(f))['threads'] if t['a_ed']}
        except Exception: pass
    while any(band <= s < band + 1000 for s in all_sorts): band += 1000

    cards, threads, members, joins = [], [], [], []
    parsed_stale = 0
    seen_pairs = set(); new_slugs = set(); next_sort = band
    gap_chapters = []
    for chap in draft['chapters']:
        ch = int(chap['ch']); gap_chapters.append(ch)
        if ch not in chapter_vns: fail(f"ch {ch}", f"chapter {ch} has no verses in the live map"); continue
        if any(c['s_ed'] == ed and c['s_book'] == book and c['s_ch'] == ch for c in live['cards']):
            warn(f"ch {ch}", "chapter already has live cards — not a gap chapter?")
        th = chap.get('thread') or {}
        join = th.get('join_slug'); tslug = None
        ch_cards = []
        for i, cd in enumerate(chap.get('cards') or []):
            where = f"ch {ch} card {i + 1} ({cd.get('src_vn')} → {cd.get('tgt_edition')}/{cd.get('tgt_book')} {cd.get('tgt_ch')}:{cd.get('tgt_vn')})"
            try: sv = int(cd['src_vn']); te, tb, tc, tv = cd['tgt_edition'], cd['tgt_book'], int(cd['tgt_ch']), int(cd['tgt_vn'])
            except Exception as e: fail(where, f"malformed card: {e}"); continue
            skey = f"{ed}|{book}|{ch}:{sv}"; src_text = L.get(skey)
            if src_text is None: fail(where, f"source verse {skey} not in the live map"); continue
            ptext = parsed_text(te, tb, tc, tv)
            if ptext is None: fail(where, f"target verse {te}|{tb}|{tc}:{tv} not in the parsed edition file"); continue
            if (te, tb, tc, tv) == (ed, book, ch, sv): fail(where, "source = target"); continue
            # convention: canon targets are quoted from parsed/canon.json (restored-names KJV), never the modernised live text;
            # non-canon targets: live text when a read-back carries the verse, else the parsed file
            lt = None if te == 'canon' else (L.get(f"{te}|{tb}|{tc}:{tv}") or other_live.get(f"{te}|{tb}|{tc}:{tv}"))
            tgt_text = lt if lt is not None else ptext
            if lt is not None and lt != ptext: parsed_stale += 1
            pair = (ch, sv, te, tb, tc, tv)
            if pair in seen_pairs: fail(where, "duplicate (src,tgt) pair within the draft"); continue
            seen_pairs.add(pair)
            if pair in live_pairs: fail(where, "this (src,tgt) pair already exists among the live cards of the book"); continue
            note = cd.get('note') or ''; mnote = cd.get('member_note') or ''
            if f"*{tgt_text}*" not in note:
                why = " (verse text present but not italicised as a whole)" if tgt_text in note else (" — the note quotes the parsed text but the live verse reads: " + tgt_text[:160]) if (lt is not None and f"*{ptext}*" in note) else ''
                fail(where, "note does not carry the whole target verse verbatim inside *…*" + why)
            if ed == 'lightfoot-apostolic-fathers':
                if not has_phrase_of(note, src_text, 8): fail(where, "note carries no contiguous verbatim run (≥8 words) of the source verse")
            elif src_text not in note: fail(where, "note does not carry the whole source verse verbatim")
            cites = english_names(te, tb)
            if not cites: warn(where, f"no English name in the table for {te}/{tb} — member citation not checked")
            elif not any(re.search(rf"(?<![A-Za-z0-9]){re.escape(n)}\.? {tc}:{tv}\b", mnote) for n in cites): fail(where, f"member note lacks the target citation ({cites[0]} {tc}:{tv})")
            need = min(6, len(norm(tgt_text).split()))   # a verse shorter than six words must be quoted whole
            if not has_phrase_of(mnote, tgt_text, need): fail(where, f"member note carries no verbatim phrase (≥{need} words) of the target verse")
            check_quotes(note, where + ' note'); check_quotes(mnote, where + ' member note')
            scan(note, where + ' note'); scan(mnote, where + ' member note')
            cj = cd.get('join_slug')
            if cj is not None and cj not in book_threads: fail(where, f"card join_slug '{cj}' is not among the book's live threads"); cj = None
            ch_cards.append(dict(src_ch=ch, src_vn=sv, tgt_edition=te, tgt_book=tb, tgt_ch=tc, tgt_vn=tv, note=note, member_note=mnote, tier=card_tier, src_text=src_text, tgt_text=tgt_text, join_slug=cj))
        if not ch_cards: fail(f"ch {ch}", "no usable cards")
        cards += ch_cards
        # ---- card-level joins: the card goes to that live thread instead of the chapter's ----
        for c in ch_cards:
            if c['join_slug']:
                thread_members_max[c['join_slug']] += 1
                members.append(dict(thread_slug=c['join_slug'], src_vn=c['src_vn'], src_ch=ch, tgt_edition=c['tgt_edition'], tgt_book=c['tgt_book'], tgt_ch=c['tgt_ch'], tgt_vn=c['tgt_vn'], member_note=c['member_note'], sort_order=thread_members_max[c['join_slug']]))
                joins.append(dict(join_slug=c['join_slug'], ch=ch, cards=1, card=f"{ch}:{c['src_vn']}"))
        rest = [c for c in ch_cards if not c['join_slug']]
        # ---- thread ----
        if 'join_slug' in th and th['join_slug'] is None:
            if rest: fail(f"ch {ch} thread", f"thread is {{join_slug: null}} but {len(rest)} card(s) carry no join_slug of their own")
        elif join:
            if join not in book_threads: fail(f"ch {ch} thread", f"join_slug '{join}' is not among the book's live threads" + (" (it exists, anchored elsewhere)" if join in all_thread_slugs else ''))
            else:
                tslug = join; joins.append(dict(join_slug=join, ch=ch, cards=len(rest)))
                for c in rest:
                    thread_members_max[join] += 1
                    members.append(dict(thread_slug=join, src_vn=c['src_vn'], src_ch=ch, tgt_edition=c['tgt_edition'], tgt_book=c['tgt_book'], tgt_ch=c['tgt_ch'], tgt_vn=c['tgt_vn'], member_note=c['member_note'], sort_order=thread_members_max[join]))
        elif th:
            where = f"ch {ch} thread '{th.get('slug')}'"
            slug = th.get('slug') or ''
            if not re.fullmatch(r"[a-z0-9]+(?:-[a-z0-9]+)*", slug): fail(where, "slug must be lowercase [a-z0-9-]")
            if slug in all_thread_slugs: fail(where, "slug already exists live")
            if slug in new_slugs: fail(where, "slug duplicated within the draft")
            new_slugs.add(slug)
            title = th.get('title') or ''; summ = th.get('summary_md') or ''
            if not title: fail(where, "no title")
            if words(summ) < 120: fail(where, f"summary has {words(summ)} words (< 120)")
            try: a, z = int(th['anchor_start_vn']), int(th['anchor_end_vn'])
            except Exception: fail(where, "anchor_start_vn / anchor_end_vn missing"); a = z = None
            if a is not None:
                if a not in chapter_vns[ch] or z not in chapter_vns[ch]: fail(where, f"anchor {a}–{z} not within the verses of chapter {ch}")
                if a > z: fail(where, "anchor_start_vn > anchor_end_vn")
            check_quotes(summ, where + ' summary'); scan(summ, where + ' summary'); scan(title, where + ' title')
            ttier = th.get('tier') or 'extras'
            threads.append(dict(slug=slug, title=title, summary_md=summ, anchor_start_vn=a, anchor_end_vn=z, tier=ttier, sort_order=next_sort, ch=ch))
            next_sort += 5; tslug = slug
            if not rest: warn(where, "new thread with no member cards (every card of the chapter joined another thread)")
            for j, c in enumerate(rest):
                members.append(dict(thread_slug=slug, src_vn=c['src_vn'], src_ch=ch, tgt_edition=c['tgt_edition'], tgt_book=c['tgt_book'], tgt_ch=c['tgt_ch'], tgt_vn=c['tgt_vn'], member_note=c['member_note'], sort_order=j + 1))
        else: fail(f"ch {ch}", "no thread (neither a new thread nor a join_slug)")
        if chap.get('flag'): warn(f"ch {ch}", 'drafter flag: ' + str(chap['flag']))

    if parsed_stale: warn('targets', f"{parsed_stale} non-canon target verse(s) read differently live than in the parsed file — the live text was used")
    fails = [r for r in report if r[0] == 'FAIL']; warns = [r for r in report if r[0] == 'WARN']
    FIX = W / 'fix'; FIX.mkdir(exist_ok=True)
    lines = [f"# S495 assemble report — {ed}/{book}", '', f"draft file(s): {', '.join(str(f) for f in files)}  (drafter model: {draft.get('model', '?')})",
             f"gap chapters: {gap_chapters}", f"cards {len(cards)} (tier '{card_tier}') | threads new {len(threads)} | joins {len(joins)} ({len({j['join_slug'] for j in joins})} live threads) | members {len(members)} | sort band {band} step 5",
             f"result: {'PASS' if not fails else 'FAIL'} — {len(fails)} failures, {len(warns)} warnings", '']
    for lvl, where, msg in report: lines.append(f"- **{lvl}** {where}: {msg}")
    (FIX / f'{stem_of(book)}_report.md').write_text('\n'.join(lines) + '\n')
    print('\n'.join(lines))
    out = FIX / f'{stem_of(book)}.json'
    if fails:
        if out.exists(): out.unlink()
        print(f"\nassemble495 FAIL — {len(fails)} failure(s); fix file not written ({out} removed if it existed)"); return 1
    json.dump(dict(book=book, edition=ed, model=draft.get('model', '?'), card_tier=card_tier, draft_files=[str(f) for f in files], gap_chapters=gap_chapters, sort_band=band,
                   cards=cards, threads=threads, members=members, joins=joins), open(out, 'w'), ensure_ascii=False, indent=1)
    print(f"\nassemble495 PASS — wrote {out}"); return 0

if __name__ == '__main__':
    if len(sys.argv) < 2: sys.exit(__doc__)
    sys.exit(main(sys.argv[1]))
