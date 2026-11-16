"""S503c — build503c.py <slug> [read-back.json] → fix/sweep/<slug>.json (+ _report.md). The SUMMARIES SWEEP, one thread at a time (the S499c chain made
general): the thread's title and summary rewritten, and any of its member cards named in out/sweep/<slug>.json rewritten Come-and-See with new member
notes (ids and verse pairs untouched; thread membership untouched). Checks (the rebuild chain's): prose_scan on title / summary / prose / sentences;
every italic+citation verbatim against the parsed library; summary ≥ 120 words; prose 12–90 words, neither verse repeated, uncited italics from the
two verses; member phrase a verbatim run (≥6 words) of the target; every rewritten card a member of this thread. Read-back: the dump of the book the
thread is anchored in (default _s495/live/canon__<anchor book>.json). Model: Claude Fable 5.1 (claude-fable-5-1)."""
import json, sys, collections
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common503 import *
def main(slug, rb=None):
    dr = json.load(open(W3 / 'out' / 'sweep' / f'{slug}.json'))
    rb = Path(rb) if rb else live503('canon', dr['anchor_book']); D = json.load(open(rb)); C = {c['id']: c for c in D['cards']}
    T = {t['slug']: t for t in D['threads']}; t = T.get(slug)
    report = []; fail = lambda w, m: report.append(('FAIL', w, m)); warn = lambda w, m: report.append(('WARN', w, m))
    if t is None: print(f"thread {slug} not in the read-back"); return 1
    M = {m['xref_id']: m for m in D['members'] if m['slug'] == slug}
    TITLE = dr['title'].strip(); SUMMARY = dr['summary'].strip()
    for x in prose_scan(TITLE): fail('title', x)
    for x in prose_scan(SUMMARY): fail('summary', x)
    quote_checks(SUMMARY, 'summary', fail, warn)
    if words(SUMMARY) < 120: fail('summary', f'{words(SUMMARY)} words (< 120)')
    if re.search(r"\bThis is not new\b", SUMMARY): fail('summary', '"This is not new" — the opener is "It ain\'t new"')
    out = []
    for cid_s, d in dr.get('cards', {}).items():
        cid = int(cid_s); c = C.get(cid); w = f"card {cid}"
        if c is None: fail(w, 'not in the read-back'); continue
        m = M.get(cid)
        if m is None: fail(w, f'not a member of {slug}'); continue
        w = f"card {cid} ({title_of(c['s_ed'], c['s_book'])} {c['s_ch']}:{c['s_vn']} → {title_of(c['t_ed'], c['t_book'])} {c['t_ch']}:{c['t_vn']})"
        tgt = parsed_text('canon', c['t_book'], c['t_ch'], c['t_vn']) if c['t_ed'] == 'canon' else c['t_text']; src = c['s_text']; tname = title_of(c['t_ed'], c['t_book']); sname = title_of(c['s_ed'], c['s_book'])
        if tgt is None: fail(w, 'target text missing'); continue
        pr = (d.get('prose') or '').strip(); ph = (d.get('phrase') or '').strip(); sent = (d.get('sentence') or '').strip()
        if not 12 <= words(pr) <= 90: fail(w, f"prose {words(pr)} words (want 12–90)")
        for x in prose_scan(pr): fail(w + ' prose', x)
        if has_phrase_of(strip_italics(pr), tgt, 9) or has_phrase_of(strip_italics(pr), src, 9): fail(w, 'prose repeats a 9-word run of one of the verses outside italics')
        for qq in re.findall(r"\*([^*]+)\*", pr):
            if len(norm(qq).split()) >= 12 and (norm(qq) in norm(tgt) or norm(qq) in norm(src)): fail(w, 'prose re-quotes most of a verse already on the card')
        pool = norm(tgt) + ' | ' + norm(src) + ' | ' + norm(parsed_text(c['s_ed'], c['s_book'], c['s_ch'], c['s_vn']) or '')
        cited = {mm.group(1) for mm in TRAIL_RE.finditer(pr)} | {mm.group(5) for mm in LEAD_RE.finditer(pr)}
        for qq in re.findall(r"\*([^*]+)\*", pr):
            if qq in cited: continue
            if not all(pc in pool for pc in pieces(qq)): fail(w, f"italic words not from either verse and carrying no citation: '{qq[:70]}'")
        quote_checks(pr, w + ' prose', fail, warn)
        if ph != 'WHOLE':
            if len(norm(ph).split()) < min(6, len(norm(tgt).split())) or norm(ph) not in norm(tgt): fail(w, 'member phrase is not a verbatim run (≥6 words) of the target verse')
            elif ph.strip().rstrip(',;:—– .?!') not in tgt: fail(w, 'member phrase must be copied exactly from the target verse')
        if not 6 <= words(sent) <= 40: fail(w, f"member sentence {words(sent)} words (want 6–40)")
        for x in prose_scan(sent): fail(w + ' sentence', x)
        quote_checks(sent, w + ' sentence', fail, warn)
        note = compose_note(tname, c['t_ch'], c['t_vn'], tgt, src, c['s_ch'], c['s_vn'], pr, sname); mnote = compose_member(tname, c['t_ch'], c['t_vn'], tgt, ph, sent)
        out.append(dict(id=cid, s_ed=c['s_ed'], s_book=c['s_book'], src_ch=c['s_ch'], src_vn=c['s_vn'], src_text=src, t_ed=c['t_ed'], tgt_book=c['t_book'], tgt_ch=c['t_ch'], tgt_vn=c['t_vn'], tgt_text=tgt,
                        old_note=c['note'], note=note, prose=pr, thread_id=t['id'], thread_slug=slug, old_member_note=m['member_note'], member_note=mnote))
        if d.get('flag'): warn(w, 'drafter flag: ' + str(d['flag']))
    fails = [r for r in report if r[0] == 'FAIL']
    lines = [f"# S503c build report — thread `{slug}` (id {t['id']}; read-back {rb.name}: {D['schema_note']})", '', f"title + summary rewritten; cards rewritten {len(out)} of {t['member_count']} members",
             f"result: {'PASS' if not fails else 'FAIL'} — {len(fails)} failures, {len(report) - len(fails)} warnings", ''] + [f"- **{l}** {w}: {m}" for l, w, m in report]
    print('\n'.join(lines)); FIX = W3 / 'fix' / 'sweep'; FIX.mkdir(parents=True, exist_ok=True); (FIX / f'{slug}_report.md').write_text('\n'.join(lines) + '\n'); o = FIX / f'{slug}.json'
    if fails:
        if o.exists(): o.unlink()
        print('build503c FAIL'); return 1
    json.dump(dict(thread=dict(id=t['id'], slug=slug, old_title=t['title'], title=TITLE, old_summary=t['summary_md'], summary=SUMMARY), read_back=str(rb), read_back_note=D['schema_note'], cards=out), open(o, 'w'), ensure_ascii=False, indent=1)
    print('build503c PASS — wrote', o); return 0
if __name__ == '__main__': sys.exit(main(sys.argv[1], sys.argv[2] if len(sys.argv) > 2 else None))
