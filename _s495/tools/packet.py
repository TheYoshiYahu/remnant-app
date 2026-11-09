"""S495 — build the gap-fill drafter packet for one book from the live read-back. Model: Claude Fable 5.1."""
import json, sys
from pathlib import Path
W = Path('/home/claude/s495')
GAPS = {('enoch','1-enoch'): [11,28,68,86,91,101,105,106,107],
        ('pseudepigrapha','testaments-xii'): [2,7,8,16,17,23,27,28,31,33,37,38,39,40,41,42,43,44,62,63,81,85,92,94,110,115,117,122,123,124,126],
        ('pseudepigrapha','adam-eve'): [2,6,11,15,16,27,30,34,35,38,44,45,46,48,50,53,54,55,57,60,63,65,70,71,74,75,77,78,81,83,84,86,87,90],
        ('pseudepigrapha','2-enoch'): [57], ('pseudepigrapha','2-baruch'): [33],
        ('lightfoot-apostolic-fathers','hermas'): [23,24]}
TITLES = {}
for (ed, bk), chs in GAPS.items():
    d = json.load(open(W/'live'/f'{ed}__{bk}.json'))
    live = d['live']
    gap = []
    for ch in chs:
        vs = {int(k.split(':')[1]): t for k, t in live.items() if k.startswith(f'{ed}|{bk}|{ch}:')}
        assert vs, (ed, bk, ch)
        # chapter titles are not in the live map; drafters have the gap-map titles below
        gap.append({'ch': ch, 'verses': dict(sorted(vs.items()))})
    # sanity: no card sources in these chapters
    for c in d['cards']:
        if c['s_ed']==ed and c['s_book']==bk: assert c['s_ch'] not in chs, (ed,bk,c['s_ch'],c['id'])
    exist = [{'slug': t['slug'], 'title': t['title'], 'anchor': f"{t['a_ch']}:{t['a_vn']}" if t['a_ch'] else None, 'member_count': t['member_count']}
             for t in d['threads'] if t['a_ed']==ed and t['a_book']==bk]
    samples = [c for c in d['cards'] if c['s_ed']==ed and c['s_book']==bk and c['note'].startswith(('Genesis','Isaiah','Psalm','Matthew','Daniel','Deuteronomy','Jeremiah','Ezekiel','Revelation')) and len(c['note'])>300][:3]
    sample_cards = [{'src': f"{c['s_ch']}:{c['s_vn']}", 'tgt': f"{c['t_book']} {c['t_ch']}:{c['t_vn']}", 'note': c['note']} for c in samples]
    st = next((t for t in d['threads'] if t['a_ed']==ed and t['a_book']==bk and t['summary_md'] and 'ain' in t['summary_md'][:40]), None) or next((t for t in d['threads'] if t['a_ed']==ed and t['a_book']==bk and len(t['summary_md'] or '')>600), None)
    sample_thread = {'slug': st['slug'], 'title': st['title'], 'summary_md': st['summary_md']} if st else None
    pk = {'edition': ed, 'book': bk, 'one_way': ed=='lightfoot-apostolic-fathers', 'gap_chapters': gap, 'existing_threads': exist,
          'sample_cards': sample_cards, 'sample_thread': sample_thread}
    (W/'packets'/f'{bk}.json').write_text(json.dumps(pk, ensure_ascii=False, indent=1))
    print(bk, 'gap chapters', len(gap), 'verses', sum(len(g['verses']) for g in gap), 'existing threads', len(exist), 'samples', len(sample_cards), 'thread sample', bool(st))
