"""S496 — packet496.py <batch>: one drafter packet per chapter of the batch (b1–b5 Matthew; S502: m1 = Mark 1–16, l1 = Luke 1–24) for the
orphan-card REBUILD, from the live read-back of the book (live/canon__<book>.json), the S495 orphan map (map/<book>_orphan_map.json) and
parsed/canon.json. The book comes from BATCHES. Threads offered per chapter: those anchored in the chapter, those with a member sourced in
the chapter, the map's candidates (Matthew's map has them; Mark's and Luke's do not), and — for a card whose target is a verse of another
gospel — the live thread whose anchor covers that target verse, plus any thread that other book's own latest read-back (live/<other>_members.json
if present, else live/canon__<other>.json) shows a member sourced on that verse. The old `thread:slug |` prefix (every Mark note, 56 Luke notes;
no slug is live) is stripped off `old_note` and passed as `author_thread_hint`. Model: Claude Fable 5.1 (claude-fable-5-1)."""
import json, sys, os, collections
from pathlib import Path
os.environ.setdefault('S495_HOME', str(Path(__file__).resolve().parent.parent))
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common495 import *
from common496 import BATCHES, split_prefix
BATCH = sys.argv[1] if len(sys.argv) > 1 else 'b1'; BOOK, CHAPTERS = BATCHES[BATCH]
D = json.load(open(W / 'live' / f'canon__{BOOK}.json')); M = json.load(open(W / 'map' / f'{BOOK}_orphan_map.json'))
MC = {c['id']: c for c in M['cards']}; T = {t['slug']: t for t in D['threads']}
TITLES = canon_titles(); TITLES['psalms'] = 'Psalm'
GOSPELS = ('matthew', 'mark', 'luke', 'john')
# members of the OTHER gospels' latest read-backs, keyed by (book, ch, vn) of the member's source verse → set of slugs
other_members = collections.defaultdict(set)
for ob in GOSPELS:
    if ob == BOOK: continue
    for cand in (W / 'live' / f'{ob}_members.json', W / 'live' / f'canon__{ob}.json'):
        if cand.exists():
            for m in json.load(open(cand))['members']:
                if m['s_ed'] == 'canon' and m['s_book'] == ob and m['slug'] in T: other_members[(ob, m['s_ch'], m['s_vn'])].add(m['slug'])
            break
def anchor_covers(t, book, ch, vn):
    return t['a_ed'] == 'canon' and t['a_book'] == book and t['a_ch'] == ch and t['a_vn'] is not None and t['a_vn'] <= vn <= (t['z_vn'] if t['z_vn'] is not None else t['a_vn'])
tot_cards = 0
for ch in CHAPTERS:
    orph = [c for c in D['cards'] if c['orphan'] and c['s_ed'] == 'canon' and c['s_book'] == BOOK and c['s_ch'] == ch]
    if not orph: print(ch, 'no orphan cards — no packet'); continue
    slugs = {t['slug'] for t in D['threads'] if t['a_book'] == BOOK and t['a_ch'] == ch}
    slugs |= {m['slug'] for m in D['members'] if m['s_book'] == BOOK and m['s_ch'] == ch}
    per_card_offers = {}
    for c in orph:
        mc = MC.get(c['id'], {})
        if mc.get('group_existing'): slugs.add(mc['group_slug'])
        slugs |= {k['slug'] for k in mc.get('candidates') or [] if k['slug'] in T}
        offers = set()
        if c['t_book'] in GOSPELS:
            offers |= {t['slug'] for t in D['threads'] if anchor_covers(t, c['t_book'], c['t_ch'], c['t_vn'])}
            offers |= other_members.get((c['t_book'], c['t_ch'], c['t_vn']), set())
        per_card_offers[c['id']] = sorted(offers); slugs |= offers
    threads = []
    for s in sorted(slugs, key=lambda s: (T[s]['a_book'] != BOOK, T[s]['a_ch'] is None, T[s]['a_book'] or '', T[s]['a_ch'] or 0, T[s]['a_vn'] or 0, s)):
        t = T[s]
        mem = [dict(src=f"{m['s_ch']}:{m['s_vn']}", tgt=f"{m['t_ed']}/{m['t_book']} {m['t_ch']}:{m['t_vn']}", member_note=m['member_note']) for m in D['members'] if m['slug'] == s and m['s_book'] == BOOK and m['s_ch'] == ch]
        anchor = None
        if t['a_book']: anchor = f"{TITLES.get(t['a_book'], t['a_book'])} {t['a_ch']}:{t['a_vn']}" + (f"-{t['z_vn']}" if t['z_vn'] is not None and t['z_vn'] != t['a_vn'] else '')
        threads.append(dict(slug=s, title=t['title'], anchor=anchor, anchored_in_this_book=(t['a_book'] == BOOK), member_count=t['member_count'], summary_md=t['summary_md'], members_in_this_chapter=mem))
    cards = []
    for c in orph:
        mc = MC.get(c['id'], {}); hint, body = split_prefix(c['note'])
        cards.append(dict(id=c['id'], src=f"{TITLES[BOOK]} {ch}:{c['s_vn']}", src_vn=c['s_vn'], src_text_live=c['s_text'], src_text_kjv=parsed_text('canon', BOOK, ch, c['s_vn']),
                          tgt=f"{TITLES[c['t_book']]} {c['t_ch']}:{c['t_vn']}", tgt_text_kjv=parsed_text('canon', c['t_book'], c['t_ch'], c['t_vn']),
                          tgt_context_kjv={str(v): parsed_text('canon', c['t_book'], c['t_ch'], v) for v in range(max(1, c['t_vn'] - 2), c['t_vn'] + 4) if parsed_text('canon', c['t_book'], c['t_ch'], v)},
                          old_note=body, author_thread_hint=hint, map_grade=mc.get('grade'), map_thread=mc.get('group_slug'), map_thread_exists=mc.get('group_existing'), map_confidence=mc.get('join_confidence'),
                          map_candidates=[k['slug'] for k in mc.get('candidates') or []], threads_on_the_target_verse=per_card_offers[c['id']], reversed_pair=mc.get('dup_with') or []))
    pk = dict(book=BOOK, chapter=ch, chapter_text_kjv={str(v): parsed_text('canon', BOOK, ch, v) for v in range(1, 200) if parsed_text('canon', BOOK, ch, v)}, cards=cards, threads=threads)
    out = W / 'packets' / f'{BOOK}_{ch}.json'; out.parent.mkdir(exist_ok=True); out.write_text(json.dumps(pk, ensure_ascii=False, indent=1)); tot_cards += len(cards)
    print(ch, 'cards', len(cards), 'threads offered', len(threads), 'of which on a target verse', len({s for v in per_card_offers.values() for s in v}), 'bytes', out.stat().st_size)
print(f'{BOOK} {BATCH}: {tot_cards} cards packeted')
