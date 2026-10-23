"""Regenerate jubilees-sweep-report.md from fix_cards.json / fix_members.json / fix_summaries.json (+ the read-back dump).
Run in source-texts/jubilees-charles-1917/s463b-sweep/ (reads ../jubilees-cards-live.json)."""
import json, collections
from pathlib import Path
HERE = Path(__file__).resolve().parent
cards = {int(k): v for k, v in json.load(open(HERE / 'fix_cards.json')).items()}
members = json.load(open(HERE / 'fix_members.json')); summaries = json.load(open(HERE / 'fix_summaries.json'))
live = json.load(open(HERE.parent / 'jubilees-cards-live.json')); C = {c['id']: c for c in live['cards']}
def other(c, side): return f"{c['s_book']} {c['s_ch']}:{c['s_vn']}" if side == 'T' else f"{c['t_book']} {c['t_ch']}:{c['t_vn']}"
K = collections.Counter(v['kind'] for v in cards.values())
moves = [v for v in cards.values() if v['old'] != v['new']]
out = []
out.append("# Jubilees sweep — S463b (2026-10-23) — verification table, read by content\n")
out.append(f"One migration (`data-schema/migrations/session463b_jubilees_sweep.sql`), scratch-tested twice against a Postgres seeded from the Oct 23 "
           f"read-back (`jubilees-cards-live.json`, 1,754 live cards touching Jubilees, 1,746 member notes, 922 threads). "
           f"Run 1 = {K['PROSE']+K['CITE_RANGE']} notes rewritten/re-cited in place, {len(moves)} moved, {len(members)} member notes, {len(summaries)} summaries, 0 skipped, 0 absent; "
           f"run 2 = 0 changed, {len(cards)} already landed. Post-run read-back by content: every card and member note as written, every Jubilees quotation "
           f"in every card/member note/summary verbatim at its cited verse, 0 degraded markers, 0 duplicate pairs. Deploy is Yoshi's paste:\n\n"
           f"    bash ~/Desktop/App/_session463b_jubilees_sweep_deploy.sh\n")
out.append("Verification before it was written: every gloss on a split verse was read by content (four readers, 312 glosses); every re-pointing was then "
           "read cold by two agents that never saw the build (both caught the same wrong move, 26777 → 23:22, and two stale addresses in prose; all fixed); "
           "the 126 rebuilt notes were read cold against the voice skill by a third (caught the woman of Canaan written as a mercy case on 4590–4593 — "
           "corrected to seed revealed).\n")
out.append("## What the map found\n")
out.append("- Quotes: 844 cards stood; 32 did not (21 reworded, 7 found at another verse, 2 both, 2 not found) — all rebuilt below.\n"
           "- Degraded prose (wisdom-stream, the framework reads, substance, apparatus, hyphen-chains): 107 cards, plus 19 with hyphen-chain prose the markers missed — all 126 rebuilt Come-and-See.\n"
           "- Glosses (no Jubilees quote) on a verse S453 split: 312 read — 179 stay, 131 move to the neighbor verse their words sit in, 2 questions.\n"
           "- Pre-existing quotations running across a split boundary cited as one verse: 91 — citation widened to the verses spanned, card address unchanged.\n"
           "- Member notes: 53 labelled quotes off the live text (14 real, 39 were gapped quotes that pass) + every member note of a rebuilt/moved card.\n"
           "- Thread summaries: 264 anchored in Jubilees, 549 quotes; 5 fixed.\n")
out.append(f"## Job 1 — {K['PROSE']+K['PROSE_MOVE']} notes rebuilt (live Jubilees verse in italics, cited; the other verse the same; then prose)\n")
out.append("| card | other end | Jubilees | moved from | note |\n|---|---|---|---|---|")
for i, v in sorted(cards.items()):
    if not v['kind'].startswith('PROSE'): continue
    out.append(f"| {i} | {other(C[i], v['side'])} | {v['new']} | {v['old'] if v['old']!=v['new'] else ''} | {(v.get('reason') or '').replace('|','/')[:140]} |")
out.append(f"\n## Job 2 — {K['GLOSS_MOVE']} glosses re-pointed (ids kept; addresses in the prose patched)\n")
out.append("| card | other end | from | to | why |\n|---|---|---|---|---|")
for i, v in sorted(cards.items()):
    if v['kind'] != 'GLOSS_MOVE': continue
    out.append(f"| {i} | {other(C[i], v['side'])} | {v['old']} | {v['new']} | {(v.get('reason') or '').replace('|','/')[:160]} |")
out.append(f"\n## Job 3 — {K['CITE_RANGE']} citations widened to the verses the quotation spans (address unchanged)\n")
out.append("| card | other end | Jubilees | note |\n|---|---|---|---|")
for i, v in sorted(cards.items()):
    if v['kind'] != 'CITE_RANGE': continue
    out.append(f"| {i} | {other(C[i], v['side'])} | {v['new']} | {(v.get('reason') or '')[:120]} |")
out.append(f"\n## Member notes — {len(members)}\n")
out.append("| thread | card | kind |\n|---|---|---|")
for m in members: out.append(f"| {m['thread_id']} | {m['xref_id']} | {m['kind']} |")
out.append(f"\n## Thread summaries — {len(summaries)}\n")
for s in summaries: out.append(f"- thread {s['thread_id']}: Jubilees quotation re-cited/re-quoted from the live text.")
out.append("\n## Questions for Yoshi (left unchanged)\n")
out.append("- 28948 and 28949 (Genesis 47:28 / 47:29 → Jubilees 45:13): both glosses speak of the multiplying seed Jubilees 45 tracks; neither 45:13 (Israel's seventeen years and death) nor 45:14 (deathbed blessing) says it. Earlier in the chapter, or retire?\n"
           "- Live Jubilees 32:19 opens with the misprint \"Ana I shall give\" and 32:21 carries \"through- out\" (line-break artefact): fix the text, then re-quote 52853 and thread 5683.\n"
           "- Many extras-side cards (S251 batch) open their prose with \"The restored witness carries…\" — not on the marker list, but it is the same posture. Call it and the next pass can sweep it.\n")
(HERE / 'jubilees-sweep-report.md').write_text('\n'.join(out))
print('report:', len(out), 'lines;', dict(K), 'moves', len(moves))
