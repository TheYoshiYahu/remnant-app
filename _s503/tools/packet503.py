"""S503 — packet503.py → _s503/out/packet503.json + packet503.md: every orphan card of the straggler books (both ends' text, the old note,
the threads anchored on the source chapter / holding a member sourced there, with summaries and members in the chapter). Read from the
live read-backs in _s495/live/. Model: Claude Fable 5.1 (claude-fable-5-1)."""
import json, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common503 import *
P = []; md = []
for ed, book in BOOKS503:
    D = load503(ed, book); T = {t['slug']: t for t in D['threads']}
    orph = orphans(D, ed, book)
    md.append(f"\n\n# {title_of(ed, book)} ({ed}) — {len(orph)} orphan card(s) · read-back: {D['schema_note']}")
    for ch in sorted({c['s_ch'] for c in orph}):
        slugs = {t['slug'] for t in D['threads'] if t['a_ed'] == ed and t['a_book'] == book and t['a_ch'] == ch}
        slugs |= {m['slug'] for m in D['members'] if m['s_ed'] == ed and m['s_book'] == book and m['s_ch'] == ch}
        md.append(f"\n## chapter {ch} — threads here")
        for s in sorted(slugs, key=lambda s: (T[s]['a_vn'] or 0, s)):
            t = T[s]; mem = [m for m in D['members'] if m['slug'] == s and m['s_book'] == book and m['s_ch'] == ch]
            anchor = f"{title_of(t['a_ed'], t['a_book'])} {t['a_ch']}:{t['a_vn']}-{t['z_vn']}" if t['a_book'] else '(no anchor)'
            md.append(f"\n### `{s}` — {t['title']}  [anchor {anchor}; members {t['member_count']}]\n{t['summary_md']}\n")
            for m in mem: md.append(f"- member {m['s_ch']}:{m['s_vn']} → {m['t_ed']}/{m['t_book']} {m['t_ch']}:{m['t_vn']} — {m['member_note']}")
        md.append(f"\n## chapter {ch} — orphan cards")
        for c in sorted(orph, key=lambda c: (c['s_ch'], c['s_vn'], c['id'])):
            if c['s_ch'] != ch: continue
            st = verse_text(D, ed, book, ch, c['s_vn']); tt = verse_text(D, c['t_ed'], c['t_book'], c['t_ch'], c['t_vn'])
            ctx = {v: verse_text(D, c['t_ed'], c['t_book'], c['t_ch'], v) for v in range(max(1, c['t_vn'] - 2), c['t_vn'] + 3)}
            ctx = {k: v for k, v in ctx.items() if v}
            P.append(dict(id=c['id'], s_ed=ed, s_book=book, s_ch=ch, s_vn=c['s_vn'], s_text_live=c['s_text'], s_text=st, t_ed=c['t_ed'], t_book=c['t_book'], t_ch=c['t_ch'], t_vn=c['t_vn'],
                          t_text_live=c['t_text'], t_text=tt, tier=c['tier'], source=c['source'], old_note=c['note'], threads_here=sorted(slugs)))
            md.append(f"\n**card {c['id']}** — {title_of(ed, book)} {ch}:{c['s_vn']} → {title_of(c['t_ed'], c['t_book'])} {c['t_ch']}:{c['t_vn']}  (tier {c['tier']})")
            md.append(f"- SOURCE ({'parsed' if ed=='canon' else 'live'}): {st}" + ('' if st == c['s_text'] else f"\n- SOURCE live differs: {c['s_text']}"))
            md.append(f"- TARGET ({'parsed' if c['t_ed']=='canon' else 'live'}): {tt}" + ('' if tt == c['t_text'] else f"\n- TARGET live differs: {c['t_text']}"))
            md.append("- context: " + ' | '.join(f"{k}: {v}" for k, v in ctx.items()))
            md.append(f"- OLD NOTE: {c['note']}")
json.dump(P, open(W3 / 'out' / 'packet503.json', 'w'), ensure_ascii=False, indent=1)
(W3 / 'out' / 'packet503.md').write_text('\n'.join(md))
print(f"packet503: {len(P)} orphan cards across {len(BOOKS503)} books -> {W3/'out'/'packet503.json'} / .md")
