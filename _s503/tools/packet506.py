"""S506 — packet506.py <slug> → out/packet506/<slug>.json + .md + <slug>_readback.json — PHASE 3 member-card packet for ONE thread.
A book dump carries only the members whose card touches that book, so the thread's members are MERGED from every live read-back on disk
(_s495/live/*__*.json; one card per id, the card's text from whichever dump carries it) into <slug>_readback.json — the read-back shape
(live / cards / members / threads) that build503c, gen_sql503c and check503c take as their read-back argument (their guards are per card against
the live database, so a merged read-back is safe). The packet: the thread's title and CURRENT (S503-rewritten) summary, then every member card whose
live note is still S1xx shorthand (shorthand_census.classify: `thread:` prefix, forbidden/EXTRA scan hit, or stub < 60 chars) — both verses (canon
from parsed/canon.json, extras from the dumps), the target's neighbours, the old note and old member note. The draft written from it is
out/sweep/<slug>.json (title + summary copied unchanged; cards {id: {prose, phrase, sentence}}). Read-only. Model: Claude Fable 5.1."""
import json, sys, collections, re
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common503 import *
from shorthand_census import classify
def merged_readback(slug, live_dir=None):
    live = {}; cards = {}; members = {}; thread = None; thread_mtime = 0; notes = []; books = {}; eds = {}
    for f in sorted(Path(live_dir or (W / 'live')).glob('*__*.json')):
        D = json.load(open(f)); t = next((t for t in D['threads'] if t['slug'] == slug), None)
        if t is None: continue
        if thread is None or f.stat().st_mtime > thread_mtime: thread, thread_mtime = t, f.stat().st_mtime   # the thread record from the FRESHEST dump
        C = {c['id']: c for c in D['cards']}; hit = 0
        for m in D['members']:
            if m['slug'] != slug or m['xref_id'] in members or m['xref_id'] not in C: continue
            members[m['xref_id']] = m; cards[m['xref_id']] = C[m['xref_id']]; hit += 1
        live.update(D['live'])                                                        # S507: every dump that carries the thread feeds the verse map, even when its member cards were already merged from another dump (a verse that is a parsed-text target in one card and a live-text source in another must be present as it reads live)
        notes.append(f"{f.stem} ({hit})")                                           # S507: zero-hit dumps listed too, so gen_deploy506 / check506 re-dump every book that carries the thread (a stale dump otherwise keeps showing the old notes)
        if hit:
            books.update({(b['ed'], b['slug']): b for b in D['books']}); eds.update({(e['slug'] if isinstance(e, dict) else e): e for e in D.get('editions', [])})
    if thread is None: sys.exit(f'{slug}: no such thread in the read-backs')
    return dict(schema_note=f"merged read-back S506 for `{slug}` from {', '.join(notes)}", editions=list(eds.values()), books=list(books.values()), parse_match={}, live=live, cards=list(cards.values()), members=list(members.values()), threads=[thread])
def main(slug):
    D = merged_readback(slug); t = D['threads'][0]; C = {c['id']: c for c in D['cards']}
    mem = sorted(D['members'], key=lambda m: m['sort_order'] or 0)
    O = W3 / 'out' / 'packet506'; O.mkdir(parents=True, exist_ok=True); rb = O / f'{slug}_readback.json'; json.dump(D, open(rb, 'w'), ensure_ascii=False, default=str)
    miss = t['member_count'] - len(mem)
    P = []; md = [f"# packet506 — thread `{slug}` (id {t['id']}; members {len(mem)} of {t['member_count']}{' — ' + str(miss) + ' NOT on any dump on disk' if miss else ''}; {D['schema_note']})", '',
                  f"## TITLE (live, keep): {t['title']}", '', '## SUMMARY (live, S503-rewritten, keep — the member notes are written TO this):', '', t['summary_md'], '']
    n_ok = 0
    for m in mem:
        c = C[m['xref_id']]; prefix, hits, stub, names_only = classify(c['note']); mp, mh, ms, _ = classify(m['member_note'])
        note_bad = prefix or hits or stub; mem_bad = mp or mh or ms
        if not (note_bad or mem_bad): n_ok += 1; continue
        live_prose = None
        if not note_bad:                                                             # note already rewritten (by another thread's pass): keep it, write only this member line
            mm = re.search(r"\) (.*)$", c['note'] or '', re.S); live_prose = mm.group(1).strip() if mm else None
        st = verse_text(D, c['s_ed'], c['s_book'], c['s_ch'], c['s_vn']); tt = verse_text(D, c['t_ed'], c['t_book'], c['t_ch'], c['t_vn'])
        ctx = {v: verse_text(D, c['t_ed'], c['t_book'], c['t_ch'], v) for v in range(max(1, c['t_vn'] - 2), c['t_vn'] + 3)}; ctx = {k: v for k, v in ctx.items() if v}
        why = ('prefix ' if prefix else '') + ('stub ' if stub else '') + ' '.join(h.split(':')[0] for h in hits) + ('' if note_bad else ' NOTE CLEAN (member line only)') + ('' if not mem_bad else ' member-note')
        P.append(dict(id=c['id'], s_ed=c['s_ed'], s_book=c['s_book'], s_name=title_of(c['s_ed'], c['s_book']), s_ch=c['s_ch'], s_vn=c['s_vn'], s_text=st, t_ed=c['t_ed'], t_book=c['t_book'], t_name=title_of(c['t_ed'], c['t_book']),
                      t_ch=c['t_ch'], t_vn=c['t_vn'], t_text=tt, t_context=ctx, old_note=c['note'], old_member_note=m['member_note'], why=why.strip(), note_clean=not note_bad, live_prose=live_prose))
        md.append(f"\n### card {c['id']} — {title_of(c['s_ed'], c['s_book'])} {c['s_ch']}:{c['s_vn']} → {title_of(c['t_ed'], c['t_book'])} {c['t_ch']}:{c['t_vn']}   [{why.strip()}]")
        md.append(f"- SOURCE: {st}"); md.append(f"- TARGET: {tt}"); md.append("- target neighbours: " + ' | '.join(f"{k}: {v}" for k, v in ctx.items()))
        md.append(f"- OLD NOTE: {c['note']}"); md.append(f"- OLD MEMBER NOTE: {m['member_note']}")
        if not note_bad: md.append("- NOTE IS ALREADY CLEAN: write only phrase + sentence for this thread; the prose will be pinned to the live note")
    md.insert(8, f"**{len(P)} of {len(mem)} member cards need a rewrite** ({n_ok} already clean).")
    json.dump(dict(thread=dict(id=t['id'], slug=slug, title=t['title'], summary=t['summary_md']), read_back=str(rb), cards=P), open(O / f'{slug}.json', 'w'), ensure_ascii=False, indent=1)
    (O / f'{slug}.md').write_text('\n'.join(md) + '\n')
    print(f"packet506 {slug}: {len(P)} of {len(mem)} members need a rewrite ({n_ok} clean; thread member_count {t['member_count']}{', MISSING ' + str(miss) if miss else ''})")
if __name__ == '__main__': main(sys.argv[1])
