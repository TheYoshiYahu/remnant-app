"""Regenerate apocrypha-sweep-report.md from fix_cards.json / fix_members.json / fix_summaries.json (+ the read-back dump and the
read findings). Run in source-texts/apocrypha-kjv-ebible/s463c-sweep/ (reads ../apocrypha-cards-live.json)."""
import json, collections, glob
from pathlib import Path
HERE = Path(__file__).resolve().parent
cards = {int(k): v for k, v in json.load(open(HERE / 'fix_cards.json')).items()}
members = json.load(open(HERE / 'fix_members.json')); summaries = json.load(open(HERE / 'fix_summaries.json'))
live = json.load(open(HERE.parent / 'apocrypha-cards-live.json')); C = {c['id']: c for c in live['cards']}
EN = json.load(open(HERE / 'book_names.json'))['apocrypha']
def cite(a): b, cv = a.split('|'); return f"{EN[b]} {cv}"
def other(c, side): return f"{c['s_book']} {c['s_ch']}:{c['s_vn']}" if side == 'T' else f"{c['t_book']} {c['t_ch']}:{c['t_vn']}"
K = collections.Counter(v['kind'] for v in cards.values())
moves = [v for v in cards.values() if v['old'] != v['new']]
voice = []
for f in sorted(glob.glob(str(HERE / 'voice_*_findings.json'))):
    d = json.load(open(f)); voice += d if isinstance(d, list) else d.get('summaries', []) + d.get('members', [])
out = []
out.append("# Apocrypha + 3 Maccabees sweep — S463c (2026-10-23) — verification table, read by content\n")
out.append(f"One migration (`data-schema/migrations/session463c_apocrypha_sweep.sql`), scratch-tested twice against a Postgres seeded from the Oct 23 "
           f"read-back (`apocrypha-cards-live.json`: 5,720 live Apocrypha verses + 228 of 3 Maccabees, 4,969 live cards touching them, 4,943 member notes, 1,990 threads). "
           f"Run 1 = {len(cards)-len(moves)} notes rewritten in place, {len(moves)} moved, {len(members)} member notes, {len(summaries)} summaries, 0 skipped, 0 absent; "
           f"run 2 = 0 changed, {len(cards)} already landed. Post-run read-back by content: every card, member note and summary as written; 4,907 Apocrypha/3 Maccabees "
           f"quotations in every anchored card / member note / summary verbatim at their cited verse; 0 degraded markers, 0 hyphen-chains, 0 slug citations, 0 duplicate pairs. "
           f"Both guards tested on scratch (live text changed → RAISE + ROLLBACK; card moved since the read-back → skipped with NOTICE). Deploy is Yoshi's paste:\n\n"
           f"    bash ~/Desktop/App/_session463c_apocrypha_sweep_deploy.sh\n")
out.append("Verification before it was written: the 13 glosses on the verses S454 changed were read by content (all stay); every re-pointing, range and re-quote "
           "was read cold by two agents that never saw the build (19/19 agree; both asked for 4507's citation to widen to 35:14–15 — done); every rebuilt note, "
           f"rewritten member note and summary was read cold against the voice skill by six readers ({len(voice)} findings — modalism at the boat on 4393, Christ-as-Sophia on 4473/4474, "
           "Matthew 15 read as food-law abolished on 4581–4583, the woman of Canaan left at 'the limit of his sending' on 4587, the Formless at the bush on 4572, "
           "misattributed speakers, a closing jab at the reader — all applied). Two inline canon callbacks were corrected to canon.json wording (4318, 4829, 44869).\n")
out.append("## What the map found\n")
out.append("- 4,969 cards dumped; 4,597 anchored in the Apocrypha or 3 Maccabees (Sirach 1,703, Wisdom 709, 2 Esdras 457, Tobit 332, 1 Macc 296, 2 Macc 292, Judith 229, Baruch 166, 1 Esdras 145, Rest of Esther 100, 3 Macc 77, the four short books 91); 372 only mention one of these books and are anchored elsewhere — not this session's.\n"
           "- Quotes: 1,784 stood verbatim; 58 were off (21 register only — the live Apocrypha is half-modernized — 37 wording); 2 quoted a neighbor verse, 1 the verse before, 6 not found (lead italic was the canon verse). 2,746 cards quote only the canon side and describe the Apocrypha verse in prose (glosses; the text was never renumbered — S454: 5,710/5,720 1:1).\n"
           f"- Degraded prose: 411 marker notes + 139 hyphen-chain-only = 550; 485 anchored here (63 belong to the canon/pseudepigrapha sweeps). 4556, 4614, 4618 from the S463a read-back are in the set. All 485 rebuilt Come-and-See.\n"
           "- Slug citations (the database slug printed as the citation — \"the-wisdom-of-solomon 11:4\"): 66 cards, 13 summaries. All fixed.\n"
           "- Glosses on S454-changed verses: 13 (Rest of Esther 10:5–13, 13:7) — read by content, all stay.\n"
           "- Member notes: 1,775 quotes stood, 70 reworded, 10 off; 426 anchored carried degraded prose/chains.\n"
           "- Threads: 935 anchored in scope; 42 summary quotations off in 38 threads; 39 anchored summaries with degraded markers; 13 with slug citations.\n"
           "- The scratch read-back found 8 more second-quotations in standing notes off the live text (the regrade grades the first quotation only) — re-quoted by hand (11561, 14230, 15208, 15943, 58818, 58822, 135977; member 58828).\n")
out.append(f"## Job 1 — {K['PROSE']+K['PROSE_MOVE']} notes rebuilt (live Apocrypha verse in italics, cited; the other verse the same; then prose)\n")
out.append("| card | other end | Apocrypha | moved from | writer's flag |\n|---|---|---|---|---|")
for i, v in sorted(cards.items()):
    if not v['kind'].startswith('PROSE'): continue
    out.append(f"| {i} | {other(C[i], v['side'])} | {cite(v['new'])} | {cite(v['old']) if v['old']!=v['new'] else ''} | {(v.get('reason') or '').replace('|','/')[:160]} |")
out.append(f"\n## Job 2 — {K['REQUOTE']} quotations re-quoted from the live text and {K['CITE_RANGE']} citations widened to the verses spanned (address unchanged)\n")
out.append("| card | other end | Apocrypha | kind | why |\n|---|---|---|---|---|")
for i, v in sorted(cards.items()):
    if v['kind'] not in ('REQUOTE', 'CITE_RANGE'): continue
    out.append(f"| {i} | {other(C[i], v['side'])} | {cite(v['new'])} | {v['kind']} | {(v.get('reason') or '').replace('|','/')[:160]} |")
out.append(f"\n## Job 3 — {K['SLUG']} cards whose citation printed the database slug: English book name\n")
out.append(", ".join(str(i) for i, v in sorted(cards.items()) if v['kind'] == 'SLUG'))
out.append(f"\n## Member notes — {len(members)}\n")
out.append("| thread | card | kind |\n|---|---|---|")
for m in members: out.append(f"| {m['thread_id']} | {m['xref_id']} | {m['kind']} |")
out.append(f"\n## Thread summaries — {len(summaries)}\n")
for s in summaries: out.append(f"- thread {s['thread_id']}: {(s.get('flag') or 'jargon / slug citation / off quotation fixed from the live text')[:200]}")
out.append("\n## Voice cold-read findings (all applied)\n")
for f in voice: out.append(f"- {f.get('id') or f.get('thread_id')}: {f['problem'][:220]}")
out.append("\n## For Yoshi (nothing blocked on these)\n")
out.append("- Pearl / treasure cards 4549, 4550, 4551 (Ecclesiasticus 6:14, Wisdom 7:8, 7:14 → Matthew 13:44–45): the old notes named the buyer as the Father/Son paying all for the elect, citing an internal file; the rebuilt notes leave the buyer unnamed. 4548 keeps it. Say which and the next pass aligns them.\n"
           "- 4705 (Tobit 4:3 / Matthew 19:15) is a thin pairing — a father's blessing and children brought for blessing; consider retiring.\n"
           "- 4547 (2 Esdras 6:26 / Matthew 13:35): the old note leaned on 6:28 (\"the truth, which hath been so long without fruit, shall be declared\"); rebuilt on 6:26 with 6:28 in prose — the card may belong at 6:28.\n"
           "- 12188 (Tobit 14:6 / Romans 15:27): rewritten so Paul's Gentiles are the scattered seed and Tobit's turning of the nations stays what Tobit saw; needs your eye.\n"
           "- 10761 (2 Esdras 2:10 thread): a guard sentence against the replacement reading was added, with Romans 11:1 quoted beside it. Confirm.\n"
           "- Live Apocrypha text misprints (quoted as they stand): a thee/thine→you/yours pass left \"yours hand\" (Ecclesiasticus 7:32, 38:10), \"yours heart\" (5:8), \"yours holy angels\" (Tobit 11:14), \"faithfull friend\" (Ecclesiasticus 6:14), \"acceptable. and the memorial\" (35:7). The live Apocrypha is a half-modernized register throughout (\"brings\", \"you hatest\") — S454's 0.85-ratio diff called it faithful; a word-level pass like S455b's canon diff would show how far it sits from the KJV 1611.\n"
           "- canon.json Matthew 28:6 reads \"where Yahusha (Lord) lay\" — the S182 NT-Lord rule would keep \"the Lord\" there; for the canon lane.\n"
           "- 2,746 Apocrypha cards (and the 13 Rest of Esther glosses) still carry the canon-first gloss shape — the canon verse quoted, the Apocrypha verse only described. Not broken, but not Come-and-See; a later pass if wanted.\n"
           "- Nine anchored summaries never quote their anchor verse (9096, 9149, 9160, 10327, 10329, 10490, 10838, 43184, 43186) — left as they stood.\n"
           "- Still open from S463b: Jubilees 28948/28949 on 45:13; Jubilees 32:19 \"Ana I shall give\" / 32:21 \"through- out\"; the S251 \"The restored witness carries…\" openers.\n")
(HERE / 'apocrypha-sweep-report.md').write_text('\n'.join(out))
print('report:', len(out), 'lines;', dict(K), 'moves', len(moves), 'voice findings', len(voice))
