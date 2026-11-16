"""S503b — build503b.py [matthew-read-back.json] → fix/repoint503.json (+ _report.md). The RE-POINT pass: Matthew cards whose old note meant 1 John
but whose target is the gospel of John get their target moved to the 1 John verse (a target_verse_id UPDATE) and their note and member note rewritten
Come-and-See to the new pair; two shorthand Matthew twins (3013, 120012) get note + member note rewritten with the target unchanged. Reads
out/draft503b.json; only the ids listed in S503B_IDS (comma-separated env, default: all drafted) are built. Checks: assemble496's text rules; the card
sits on its (Matthew verse → old target) pair and in exactly one thread; no live card already holds the (source, new target, source) pair.
Default read-back: the latest Matthew dump (_s495/live/canon__matthew.json). Model: Claude Fable 5.1 (claude-fable-5-1)."""
import json, sys, os, collections
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common503 import *
def main(rb=None):
    rb = Path(rb) if rb else live503('canon', 'matthew'); D = json.load(open(rb)); L = D['live']; C = {c['id']: c for c in D['cards']}; T = {t['id']: t for t in D['threads']}
    mem = collections.defaultdict(list)
    for m in D['members']: mem[m['xref_id']].append(m)
    pairs = {(c['s_ed'], c['s_book'], c['s_ch'], c['s_vn'], c['t_ed'], c['t_book'], c['t_ch'], c['t_vn'], c['source']): c['id'] for c in D['cards']}
    dr = json.load(open(W3 / 'out' / 'draft503b.json')); ids = [int(x) for x in os.environ['S503B_IDS'].split(',')] if os.environ.get('S503B_IDS') else [c['id'] for c in dr['cards']]
    report = []; fail = lambda w, m: report.append(('FAIL', w, m)); warn = lambda w, m: report.append(('WARN', w, m)); out = []
    for cd in dr['cards']:
        cid = cd['id']
        if cid not in ids: continue
        c = C.get(cid); w = f"card {cid}"
        if not c or c['s_book'] != 'matthew' or c['s_ed'] != 'canon': fail(w, 'not a Matthew card in the read-back'); continue
        nt = cd.get('new_target'); t_ed, t_book, t_ch, t_vn = ('canon', *nt) if nt else (c['t_ed'], c['t_book'], c['t_ch'], c['t_vn'])
        w = f"card {cid} (Matthew {c['s_ch']}:{c['s_vn']} → {title_of(c['t_ed'], c['t_book'])} {c['t_ch']}:{c['t_vn']}" + (f" RE-POINTED → {title_of(t_ed, t_book)} {t_ch}:{t_vn})" if nt else ')')
        tgt = parsed_text(t_ed, t_book, t_ch, t_vn); src = L.get(f"canon|matthew|{c['s_ch']}:{c['s_vn']}")
        if tgt is None: fail(w, 'new target verse not in the parsed library'); continue
        if src is None or src != c['s_text']: fail(w, 'live map and card disagree on the source text'); continue
        if nt and (c['s_ed'], c['s_book'], c['s_ch'], c['s_vn'], t_ed, t_book, t_ch, t_vn, c['source']) in pairs: fail(w, f"a live card ({pairs[(c['s_ed'], c['s_book'], c['s_ch'], c['s_vn'], t_ed, t_book, t_ch, t_vn, c['source'])]}) already holds the new pair"); continue
        ms = mem.get(cid, [])
        if len(ms) != 1: fail(w, f"card sits in {len(ms)} thread(s); expected exactly one"); continue
        m = ms[0]
        prose = (cd.get('prose') or '').strip(); tname = title_of(t_ed, t_book)
        if not 12 <= words(prose) <= 90: fail(w, f"prose has {words(prose)} words (want 12–90)")
        for x in prose_scan(prose): fail(w + ' prose', x)
        if has_phrase_of(strip_italics(prose), tgt, 9) or has_phrase_of(strip_italics(prose), src, 9): fail(w, 'prose repeats a 9-word run of one of the verses outside italics')
        for q in re.findall(r"\*([^*]+)\*", prose):
            if len(norm(q).split()) >= 12 and (norm(q) in norm(tgt) or norm(q) in norm(src)): fail(w, 'prose re-quotes most of a verse already on the card')
        pool = norm(tgt) + ' | ' + norm(src) + ' | ' + norm(parsed_text('canon', 'matthew', c['s_ch'], c['s_vn']) or '')
        cited = {mm.group(1) for mm in TRAIL_RE.finditer(prose)} | {mm.group(5) for mm in LEAD_RE.finditer(prose)}
        for q in re.findall(r"\*([^*]+)\*", prose):
            if q in cited: continue
            if not all(pc in pool for pc in pieces(q)): fail(w, f"italic words not from either verse and carrying no citation: '{q[:70]}'")
        quote_checks(prose, w + ' prose', fail, warn)
        ph = (cd.get('member_phrase') or '').strip(); sent = (cd.get('member_sentence') or '').strip()
        if ph != 'WHOLE':
            if len(norm(ph).split()) < min(6, len(norm(tgt).split())) or norm(ph) not in norm(tgt): fail(w, 'member_phrase is not a verbatim run (≥6 words) of the target verse')
            elif ph.strip().rstrip(',;:—– .?!') not in tgt: fail(w, 'member_phrase must be copied exactly from the target verse')
        if not 6 <= words(sent) <= 40: fail(w, f"member_sentence has {words(sent)} words (want 6–40)")
        for x in prose_scan(sent): fail(w + ' member sentence', x)
        quote_checks(sent, w + ' member sentence', fail, warn)
        note = compose_note(tname, t_ch, t_vn, tgt, src, c['s_ch'], c['s_vn'], prose, 'Matthew'); mnote = compose_member(tname, t_ch, t_vn, tgt, ph, sent)
        out.append(dict(id=cid, src_ch=c['s_ch'], src_vn=c['s_vn'], src_text=src, old_t_ed=c['t_ed'], old_tgt_book=c['t_book'], old_tgt_ch=c['t_ch'], old_tgt_vn=c['t_vn'], repointed=bool(nt),
                        t_ed=t_ed, tgt_book=t_book, tgt_ch=t_ch, tgt_vn=t_vn, tgt_text=tgt, tier=c['tier'], source=c['source'], old_note=c['note'], note=note, prose=prose,
                        thread_id=m['thread_id'], thread=m['slug'], old_member_note=m['member_note'], member_note=mnote))
        if cd.get('flag'): warn(w, 'drafter flag: ' + str(cd['flag']))
    fails = [r for r in report if r[0] == 'FAIL']
    lines = [f"# S503b build report — the re-point pass (Matthew read-back: {rb.name}, {D['schema_note']})", '', f"cards {len(out)} (re-pointed {sum(o['repointed'] for o in out)}, rewritten in place {sum(not o['repointed'] for o in out)})",
             f"result: {'PASS' if not fails else 'FAIL'} — {len(fails)} failures, {len(report) - len(fails)} warnings", ''] + [f"- **{l}** {w}: {m}" for l, w, m in report]
    print('\n'.join(lines)); FIX = W3 / 'fix'; FIX.mkdir(exist_ok=True); (FIX / 'repoint503_report.md').write_text('\n'.join(lines) + '\n'); o = FIX / 'repoint503.json'
    if fails:
        if o.exists(): o.unlink()
        print('build503b FAIL'); return 1
    json.dump(dict(batch='repoint503', read_back=str(rb), read_back_note=D['schema_note'], models=[dr.get('model')], cards=out), open(o, 'w'), ensure_ascii=False, indent=1); print('build503b PASS — wrote', o); return 0
if __name__ == '__main__': sys.exit(main(sys.argv[1] if len(sys.argv) > 1 else None))
