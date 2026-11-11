"""S496 — packet496.py <batch>: one drafter packet per Matthew chapter of the batch (b1 = 1–7, b2 = 8–13) for the orphan-card REBUILD, from the Nov 9 live read-back,
the S495 orphan map and parsed/canon.json. Model: Claude Fable 5.1 (claude-fable-5-1)."""
import json, sys, os
from pathlib import Path
os.environ.setdefault('S495_HOME', str(Path(__file__).resolve().parent.parent))
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common495 import *
from common496 import BATCHES
BATCH = sys.argv[1] if len(sys.argv) > 1 else 'b1'; CHAPTERS = BATCHES[BATCH][1]
D = json.load(open(W / 'live' / 'canon__matthew.json')); M = json.load(open(W / 'map' / 'matthew_orphan_map.json'))
MC = {c['id']: c for c in M['cards']}; T = {t['slug']: t for t in D['threads']}
TITLES = canon_titles(); TITLES['psalms'] = 'Psalm'
for ch in CHAPTERS:
    orph = [c for c in D['cards'] if c['orphan'] and c['s_book'] == 'matthew' and c['s_ch'] == ch]
    slugs = {t['slug'] for t in D['threads'] if t['a_book'] == 'matthew' and t['a_ch'] == ch}
    slugs |= {m['slug'] for m in D['members'] if m['s_book'] == 'matthew' and m['s_ch'] == ch}
    for c in orph:
        mc = MC[c['id']]
        if mc['group_existing']: slugs.add(mc['group_slug'])
        slugs |= {k['slug'] for k in mc.get('candidates') or [] if k['slug'] in T}
    threads = []
    for s in sorted(slugs, key=lambda s: (T[s]['a_ch'] is None, T[s]['a_ch'] or 0, T[s]['a_vn'] or 0, s)):
        t = T[s]
        mem = [dict(src=f"{m['s_ch']}:{m['s_vn']}", tgt=f"{m['t_ed']}/{m['t_book']} {m['t_ch']}:{m['t_vn']}", member_note=m['member_note']) for m in D['members'] if m['slug'] == s and m['s_book'] == 'matthew' and m['s_ch'] == ch]
        threads.append(dict(slug=s, title=t['title'], anchor=(f"Matthew {t['a_ch']}:{t['a_vn']}-{t['z_vn']}" if t['a_book'] == 'matthew' else (f"{t['a_book']} {t['a_ch']}:{t['a_vn']}" if t['a_book'] else None)),
                            member_count=t['member_count'], summary_md=t['summary_md'], members_in_this_chapter=mem))
    cards = []
    for c in orph:
        mc = MC[c['id']]
        cards.append(dict(id=c['id'], src=f"Matthew {ch}:{c['s_vn']}", src_vn=c['s_vn'], src_text_live=c['s_text'], src_text_kjv=parsed_text('canon', 'matthew', ch, c['s_vn']),
                          tgt=f"{TITLES[c['t_book']]} {c['t_ch']}:{c['t_vn']}", tgt_text_kjv=parsed_text('canon', c['t_book'], c['t_ch'], c['t_vn']),
                          tgt_context_kjv={str(v): parsed_text('canon', c['t_book'], c['t_ch'], v) for v in range(max(1, c['t_vn'] - 2), c['t_vn'] + 4) if parsed_text('canon', c['t_book'], c['t_ch'], v)},
                          old_note=c['note'], map_grade=mc['grade'], map_thread=mc['group_slug'], map_thread_exists=mc['group_existing'], map_confidence=mc.get('join_confidence'),
                          map_candidates=[k['slug'] for k in mc.get('candidates') or []], reversed_pair=mc['dup_with']))
    pk = dict(chapter=ch, chapter_text_kjv={str(v): parsed_text('canon', 'matthew', ch, v) for v in range(1, 200) if parsed_text('canon', 'matthew', ch, v)}, cards=cards, threads=threads)
    (W / 'packets' / f'matthew_{ch}.json').write_text(json.dumps(pk, ensure_ascii=False, indent=1))
    print(ch, 'cards', len(cards), 'threads offered', len(threads), 'bytes', (W / 'packets' / f'matthew_{ch}.json').stat().st_size)
