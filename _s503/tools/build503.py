"""S503 — build503.py → fix/stragglers503.json (+ _report.md). Reads out/draft503.json (the drafter's prose per card) against the live read-backs of
the eight straggler books and builds the REBUILD fix: for every orphan card (same id, same verse pair) a note composed BY SCRIPT — target verse
whole (canon: parsed/canon.json; extras: the live text), source verse whole as it reads live, then the prose — a member note, and the live thread
it joins. Hard rules (assemble496's, edition-aware): every orphan of the eight books covered exactly once and still an orphan; prose 12–90 words,
no forbidden phrase, no bare sacred name, neither verse repeated; every italic+citation verbatim against the parsed library; member phrase a verbatim
run (≥6 words) of the target; thread live in the source book's read-back. No new threads, no anchors (every thread joined is anchored).
Nothing is auto-fixed. Model: Claude Fable 5.1 (claude-fable-5-1)."""
import json, sys, collections
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common503 import *

def main():
    dr = json.load(open(W3 / 'out' / 'draft503.json')); by_id = {c['id']: c for c in dr['cards']}
    report = []; fail = lambda w, m: report.append(('FAIL', w, m)); warn = lambda w, m: report.append(('WARN', w, m))
    cards, members, seen = [], [], set()
    for ed, book in BOOKS503:
        D = load503(ed, book); T = {t['slug']: t for t in D['threads']}; L = D['live']
        for c in sorted(orphans(D, ed, book), key=lambda c: (c['s_ch'], c['s_vn'], c['id'])):
            cid = c['id']; w = f"card {cid} ({title_of(ed, book)} {c['s_ch']}:{c['s_vn']} → {title_of(c['t_ed'], c['t_book'])} {c['t_ch']}:{c['t_vn']})"
            cd = by_id.get(cid)
            if cd is None: fail(w, 'orphan card missing from the draft'); continue
            if cid in seen: fail(w, 'card appears twice'); continue
            seen.add(cid)
            tgt = verse_text(D, c['t_ed'], c['t_book'], c['t_ch'], c['t_vn']); src = L.get(f"{ed}|{book}|{c['s_ch']}:{c['s_vn']}")
            if tgt is None: fail(w, 'target verse text not found'); continue
            if src is None or src != c['s_text']: fail(w, 'live map and card disagree on the source text'); continue
            if c['t_ed'] != 'canon' and tgt != c['t_text']: fail(w, 'live map and card disagree on the extras target text'); continue
            if '*' in tgt or '*' in src: fail(w, 'a verse carries an asterisk'); continue
            prose = (cd.get('prose') or '').strip(); tname = title_of(c['t_ed'], c['t_book']); sname = title_of(ed, book)
            if not 12 <= words(prose) <= 90: fail(w, f"prose has {words(prose)} words (want 12–90)")
            for x in prose_scan(prose): fail(w + ' prose', x)
            if has_phrase_of(strip_italics(prose), tgt, 9) or has_phrase_of(strip_italics(prose), src, 9): fail(w, 'prose repeats a 9-word run of one of the verses outside italics')
            for q in re.findall(r"\*([^*]+)\*", prose):
                if len(norm(q).split()) >= 12 and (norm(q) in norm(tgt) or norm(q) in norm(src)): fail(w, 'prose re-quotes most of a verse already on the card')
            pool = norm(tgt) + ' | ' + norm(src) + ' | ' + norm(parsed_text(ed, book, c['s_ch'], c['s_vn']) or '') + ' | ' + norm(c['t_text'])
            cited = {m.group(1) for m in TRAIL_RE.finditer(prose)} | {m.group(5) for m in LEAD_RE.finditer(prose)}
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
            slug = cd.get('thread') or ''; t = T.get(slug)
            if t is None: fail(w, f"thread '{slug}' is not live in the {book} read-back"); continue
            if t['a_book'] is None: fail(w, f"thread '{slug}' is unanchored — this chain sets no anchors")
            note = compose_note(tname, c['t_ch'], c['t_vn'], tgt, src, c['s_ch'], c['s_vn'], prose, sname)
            mnote = compose_member(tname, c['t_ch'], c['t_vn'], tgt, ph, sent)
            if note == c['note']: warn(w, 'new note equals the live note')
            cards.append(dict(id=cid, s_ed=ed, s_book=book, src_ch=c['s_ch'], src_vn=c['s_vn'], src_text=src, t_ed=c['t_ed'], tgt_book=c['t_book'], tgt_ch=c['t_ch'], tgt_vn=c['t_vn'],
                              tgt_text=tgt, tier=c['tier'], old_note=c['note'], note=note, prose=prose, thread=slug, thread_id=t['id'], member_note=mnote))
            members.append(dict(thread_slug=slug, thread_id=t['id'], id=cid, s_ed=ed, s_book=book, src_ch=c['s_ch'], src_vn=c['s_vn'], member_note=mnote))
            if cd.get('flag'): warn(w, 'drafter flag: ' + str(cd['flag']))
    for cid in sorted(set(by_id) - seen): fail(f'card {cid}', 'in the draft but not an orphan of the eight books in the read-back')
    fails = [r for r in report if r[0] == 'FAIL']; warns = [r for r in report if r[0] == 'WARN']
    per = collections.Counter(m['thread_slug'] for m in members)
    lines = [f"# S503 build report — the stragglers (eight books)", '', f"draft: out/draft503.json (drafter model: {dr.get('model')})",
             f"cards rewritten {len(cards)} | threads joined {len(per)} | members {len(members)}", f"result: {'PASS' if not fails else 'FAIL'} — {len(fails)} failures, {len(warns)} warnings", '']
    lines += [f"- **{l}** {w}: {m}" for l, w, m in report] + ['', '## threads'] + [f"- {s}: {n}" for s, n in sorted(per.items())]
    print('\n'.join(lines))
    FIX = W3 / 'fix'; FIX.mkdir(exist_ok=True); (FIX / 'stragglers503_report.md').write_text('\n'.join(lines) + '\n'); out = FIX / 'stragglers503.json'
    if fails:
        if out.exists(): out.unlink()
        print(f"\nbuild503 FAIL — {len(fails)} failure(s); fix file not written"); return 1
    json.dump(dict(batch='stragglers503', books=BOOKS503, models=[dr.get('model')], read_backs={f'{e}/{b}': load503(e, b)['schema_note'] for e, b in BOOKS503}, cards=cards, members=members),
              open(out, 'w'), ensure_ascii=False, indent=1)
    print(f"\nbuild503 PASS — wrote {out}"); return 0
if __name__ == '__main__': sys.exit(main())
