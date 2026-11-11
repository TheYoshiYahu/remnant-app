"""S496 — assemble496.py <batch>  →  fix/matthew_<batch>.json (+ _report.md)        (batch b1 = Matthew 1–7)
Reads out/matthew_<N>_fixed.json (else _draft.json) for each chapter of the batch and builds the REBUILD fix file: for every orphan
card of those chapters (same id, same verse pair) a new note composed BY SCRIPT — target verse whole from parsed/canon.json, Matthew
verse whole from the live read-back, then the drafter's prose — a member note, and the thread it joins (existing, or a new one).
Hard rules: every orphan card of the chapter covered exactly once and still an orphan in the read-back; prose 12–90 words with no
forbidden phrase, no bare sacred name, neither verse repeated; every italic+citation verbatim against parsed canon; member phrase a
verbatim run (≥6 words) of the target; thread exists live or is a well-formed new thread (slug shape/uniqueness, summary ≥120 words,
anchor in the chapter, ≥1 card); `--chapter N` checks one chapter only and writes nothing (the drafter's precheck).
Unanchored live threads the cards join get the anchor in ref/anchors496.json. Nothing is auto-fixed. Model: Claude Fable 5.1 (claude-fable-5-1)."""
import json, sys, collections
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common496 import *

def pick(ch):
    for suf in ('_fixed.json', '_draft.json'):
        p = W6 / 'out' / f'matthew_{ch}{suf}'
        if p.exists(): return p
    return None

def main(batch, only=None):
    book, chapters = BATCHES[batch]; chapters = [only] if only else list(chapters)
    D = load_live_book(book); L = D['live']
    T = {t['slug']: t for t in D['threads']}
    member_of = collections.defaultdict(set)
    for m in D['members']: member_of[m['xref_id']].add(m['slug'])
    report = []
    def fail(w, m): report.append(('FAIL', w, m))
    def warn(w, m): report.append(('WARN', w, m))
    anchors_cfg = json.load(open(W6 / 'ref' / 'anchors496.json')) if (W6 / 'ref' / 'anchors496.json').exists() else {}
    cards, members, threads, models, files = [], [], [], set(), []
    new_slugs = {}
    for ch in chapters:
        p = pick(ch)
        if p is None: fail(f'ch {ch}', 'no draft file in out/'); continue
        dr = json.load(open(p)); files.append(str(p)); models.add(dr.get('model', '?'))
        orph = {c['id']: c for c in D['cards'] if c['s_book'] == book and c['s_ch'] == ch and c['s_ed'] == ED and not member_of[c['id']]}
        seen = set()
        ch_vns = {int(k.split(':')[1]) for k in L if k.startswith(f'{ED}|{book}|{ch}:')}
        for nt in dr.get('new_threads') or []:
            w = f"ch {ch} new thread '{nt.get('slug')}'"; slug = nt.get('slug') or ''
            if not re.fullmatch(rf"{book}-{ch}-[a-z0-9]+(?:-[a-z0-9]+)*", slug): fail(w, f"slug must be lowercase and begin '{book}-{ch}-'")
            if slug in T: fail(w, 'slug already exists live'); continue
            if slug in new_slugs: fail(w, 'slug duplicated in the batch'); continue
            summ = nt.get('summary_md') or ''; title = nt.get('title') or ''
            if not title: fail(w, 'no title')
            if words(summ) < 120: fail(w, f"summary has {words(summ)} words (< 120)")
            try: a, z = int(nt['anchor_start_vn']), int(nt['anchor_end_vn'])
            except Exception: fail(w, 'anchor missing'); continue
            if a not in ch_vns or z not in ch_vns or a > z: fail(w, f'anchor {a}–{z} not within chapter {ch}')
            quote_checks(summ, w + ' summary', fail, warn)
            for x in prose_scan(summ): fail(w + ' summary', x)
            for x in prose_scan(title): fail(w + ' title', x)
            new_slugs[slug] = dict(slug=slug, title=title, summary_md=summ, ch=ch, anchor_start_vn=a, anchor_end_vn=z, tier='free', n=0)
        for cd in dr.get('cards') or []:
            cid = cd.get('id'); w = f"ch {ch} card {cid}"
            c = orph.get(cid)
            if c is None: fail(w, 'not an orphan card of this chapter in the read-back'); continue
            if cid in seen: fail(w, 'card appears twice'); continue
            seen.add(cid)
            w = f"ch {ch} card {cid} ({ch}:{c['s_vn']} → {c['t_book']} {c['t_ch']}:{c['t_vn']})"
            if c['t_ed'] != ED: fail(w, f"target edition {c['t_ed']} — this chain handles canon targets only"); continue
            tgt = parsed_text(ED, c['t_book'], c['t_ch'], c['t_vn']); src = L[f"{ED}|{book}|{ch}:{c['s_vn']}"]
            if tgt is None: fail(w, 'target verse not in parsed/canon.json'); continue
            if src != c['s_text']: fail(w, 'live map and card disagree on the source text'); continue
            if '*' in tgt or '*' in src: fail(w, 'a verse carries an asterisk'); continue
            prose = (cd.get('prose') or '').strip(); name = TITLES[c['t_book']]
            if not 12 <= words(prose) <= 90: fail(w, f"prose has {words(prose)} words (want 12–90)")
            for x in prose_scan(prose): fail(w + ' prose', x)
            if has_phrase_of(strip_italics(prose), tgt, 9) or has_phrase_of(strip_italics(prose), src, 9): fail(w, 'prose repeats a 9-word run of one of the verses outside italics')
            for q in re.findall(r"\*([^*]+)\*", prose):
                if len(norm(q).split()) >= 12 and (norm(q) in norm(tgt) or norm(q) in norm(src)): fail(w, 'prose re-quotes most of a verse already on the card')
            # short inline italics with no citation: must be words of one of the two verses (KJV or live wording)
            pool = norm(tgt) + ' | ' + norm(src) + ' | ' + norm(parsed_text(ED, book, ch, c['s_vn']) or '')
            cited = {m.group(1) for m in TRAIL_RE.finditer(prose)} | {m.group(5) for m in LEAD_RE.finditer(prose)}
            for q in re.findall(r"\*([^*]+)\*", prose):
                if q in cited: continue
                if not all(pc in pool for pc in pieces(q)): fail(w, f"italic words not from either verse and carrying no citation: '{q[:70]}'")
            quote_checks(prose, w + ' prose', fail, warn)
            ph = (cd.get('member_phrase') or '').strip(); sent = (cd.get('member_sentence') or '').strip()
            if ph != 'WHOLE':
                if len(norm(ph).split()) < min(6, len(norm(tgt).split())) or norm(ph) not in norm(tgt): fail(w, 'member_phrase is not a verbatim run (≥6 words) of the target verse')
                elif ph.strip().rstrip(',;:—– .?!') not in tgt: fail(w, 'member_phrase must be copied exactly (case and punctuation inside the run) from the target verse')
            if not 6 <= words(sent) <= 40: fail(w, f"member_sentence has {words(sent)} words (want 6–40)")
            for x in prose_scan(sent): fail(w + ' member sentence', x)
            quote_checks(sent, w + ' member sentence', fail, warn)
            slug = cd.get('thread') or ''
            if slug in new_slugs: new_slugs[slug]['n'] += 1
            elif slug not in T: fail(w, f"thread '{slug}' is neither live nor a new thread of the draft"); continue
            note = compose_note(name, c['t_ch'], c['t_vn'], tgt, src, ch, c['s_vn'], prose)
            mnote = compose_member(name, c['t_ch'], c['t_vn'], tgt, ph, sent) if ph else ''
            if note == c['note']: warn(w, 'new note equals the live note')
            cards.append(dict(id=cid, src_ch=ch, src_vn=c['s_vn'], src_text=src, tgt_book=c['t_book'], tgt_ch=c['t_ch'], tgt_vn=c['t_vn'], tgt_text=tgt, tier=c['tier'],
                              old_note=c['note'], note=note, prose=prose, thread=slug, member_note=mnote))
            members.append(dict(thread_slug=slug, id=cid, src_ch=ch, src_vn=c['s_vn'], tgt_book=c['t_book'], tgt_ch=c['t_ch'], tgt_vn=c['t_vn'], member_note=mnote))
            if cd.get('flag'): warn(w, 'drafter flag: ' + str(cd['flag']))
        for cid in sorted(set(orph) - seen): fail(f'ch {ch} card {cid}', 'orphan card of the chapter missing from the draft')
    for s, nt in new_slugs.items():
        if nt['n'] == 0: fail(f"new thread '{s}'", 'no card joins it')
        elif nt['n'] < 3: warn(f"new thread '{s}'", f"only {nt['n']} card(s)")
    # new threads take the slot right after the live thread anchored at/just before them (live Matthew threads step by 3)
    used = {t['sort_order'] for t in D['threads']}
    for s, nt in sorted(new_slugs.items(), key=lambda kv: (kv[1]['ch'], kv[1]['anchor_start_vn'])):
        prev = [t for t in D['threads'] if t['a_book'] == book and t['a_ch'] is not None and (t['a_ch'], t['a_vn']) <= (nt['ch'], nt['anchor_start_vn'])]
        so = (max(prev, key=lambda t: (t['a_ch'], t['a_vn'], t['sort_order']))['sort_order'] if prev else 11000) + 1
        while so in used: so += 1
        used.add(so); threads.append(dict(slug=s, title=nt['title'], summary_md=nt['summary_md'], ch=nt['ch'], anchor_start_vn=nt['anchor_start_vn'], anchor_end_vn=nt['anchor_end_vn'], tier='free', sort_order=so))
    # anchors for the unanchored live threads these cards join
    anchors = []
    for s in sorted({m['thread_slug'] for m in members if m['thread_slug'] in T and T[m['thread_slug']]['a_book'] is None}):
        a = anchors_cfg.get(s)
        if not a:
            (fail if not only else warn)(f"thread '{s}'", 'unanchored live thread joined — no anchor for it in ref/anchors496.json'); continue
        for vn in (a['a_vn'], a['z_vn']):
            if f"{ED}|{a['book']}|{a['ch']}:{vn}" not in L and parsed_text(ED, a['book'], a['ch'], vn) is None: fail(f"thread '{s}'", f"anchor verse {a['book']} {a['ch']}:{vn} does not exist")
        anchors.append(dict(slug=s, book=a['book'], ch=a['ch'], a_vn=a['a_vn'], z_vn=a['z_vn'], basis=a.get('basis', '')))
    fails = [r for r in report if r[0] == 'FAIL']; warns = [r for r in report if r[0] == 'WARN']
    per = collections.Counter(m['thread_slug'] for m in members)
    lines = [f"# S496 assemble report — Matthew rebuild {batch}" + (f" (chapter {only} only)" if only else ''), '', f"draft files: {', '.join(files)}  (drafter model(s): {', '.join(sorted(models))})",
             f"cards rewritten {len(cards)} | threads joined {len([s for s in per if s in T])} | new threads {len(threads)} | anchors to set {len(anchors)} | members {len(members)}",
             f"result: {'PASS' if not fails else 'FAIL'} — {len(fails)} failures, {len(warns)} warnings", ''] + [f"- **{l}** {w}: {m}" for l, w, m in report]
    print('\n'.join(lines))
    if only: return 1 if fails else 0
    FIX = W6 / 'fix'; FIX.mkdir(exist_ok=True); stem = f'{book}_{batch}'
    (FIX / f'{stem}_report.md').write_text('\n'.join(lines) + '\n')
    out = FIX / f'{stem}.json'
    if fails:
        if out.exists(): out.unlink()
        print(f"\nassemble496 FAIL — {len(fails)} failure(s); fix file not written"); return 1
    json.dump(dict(batch=batch, book=book, edition=ED, chapters=chapters, models=sorted(models), draft_files=files, cards=cards, threads=threads, anchors=anchors, members=members),
              open(out, 'w'), ensure_ascii=False, indent=1)
    print(f"\nassemble496 PASS — wrote {out}"); return 0

if __name__ == '__main__':
    if len(sys.argv) < 2: sys.exit(__doc__)
    only = int(sys.argv[sys.argv.index('--chapter') + 1]) if '--chapter' in sys.argv else None
    sys.exit(main(sys.argv[1], only))
