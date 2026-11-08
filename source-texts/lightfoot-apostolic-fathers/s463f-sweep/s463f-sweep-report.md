# S463f — Apostolic Fathers (Lightfoot 1891) + Acts 29 (Sonnini) card sweep — report (Nov 8 2026)

The last Phase-1 card-fidelity sweep: the two editions that were still unswept, `lightfoot-apostolic-fathers` (1 Clement, 2 Clement,
the seven letters of Ignatius, the Martyrdom of Polycarp, the Didache, Hermas; Barnabas carries no cards) and `sonnini-acts-29`.
Chain: dump (Yoshi's paste, `_s463f_dump.py`) → regrade by content (`regrade.py`, `regrade_members.py`) → map (`map463f.py`,
`s463f-sweep-map.md`) → Sonnet drafters on the 46 cards + 34 summaries that needed a reader (`packets/`, `out/cards_*.json`,
`out/threads_*.json`, model named in each file) → an ADDRESS READ of every one of the 516 anchored cards by content (five Sonnet
batches, `out/addr_*.json`) → a second, independent cold read of every proposed move (`out/cold2.json`; 56 of 60 agreed, 4 stay) →
Fable voice read of every drafted note and summary (fixes in `assemble463f.py`, FABLE_* / POST) → assembly with content checks
(`fix/`) → two migrations (`gen_sql463f.py`) → scratch on a real Postgres 16 seeded from the read-back, run twice through
`api/apply_migration.py` (`seed463f.py`), both guards tested → `_session463f_sweep_deploy.sh` + `_s463f_check.py`.

## Live state found (dump Nov 8 ~14:18 CDT)
373 live verses, every one identical to the Desktop parse (`source-texts/parsed/lightfoot-apostolic-fathers.json`, `sonnini-acts-29.json`).
520 cards touch the two editions (516 anchored, 4 name a book only), 517 member notes, 158 threads (156 anchored here).
Every card is a canon-first gloss: the canon verse quoted in full, then one or two sentences tying it to the witness the card sits on.
Three Matthew 10 → Acts 29 cards on the canon side were S1xx-era framework prose.

## What the map found
- Canon lead quotations off `parsed/canon.json`: 13 cards + 13 member notes + 26 summary italics — all the NT-Lord rule
  (canon now reads *Adonai (Lord)* / *Yahusha (Lord)* where the old quote said *Yahuah (Lord)*), plus a few ellipsis-truncated quotes
  spanning two verses (re-quoted whole, cited c:v–v).
- Citations: 94 cards cited the witness ambiguously or by slug — "Ignatius 1:7" (which letter?), "(1:20)", "hermas 5:1",
  "Ignatius-Polycarp" — and 5 cards + 9 summaries used Hebrew book names (Yeshayahu, Yirmeyahu, Mishlei…). All named in English.
- **Hermas Similitudes 8–10:** 14 thread summaries cited chapters 23/24 — an older chapter numbering; the live book has them at 25/26/27
  (Sim 6 = 23, Sim 7 = 24). The cards themselves sat on the right verses. Re-cited by content.
- **Addresses:** the S253 cards were written against a different chapter division of the one-chapter letters. The address read of all
  516 cards found 60 candidates; two cold reads agree on **56 moves** (Hermas 12, Magnesians 10, 1 Clement 7, Didache 7,
  Philadelphians 7, 2 Clement 5, Trallians 4, Martyrdom 3, Acts 29 1) — e.g. the "as ye mete" cards from 1 Clement 1:12 → 1:13, the
  Aaron's-rod cards 1:38 → 1:43, the one-eucharist cards Philadelphians 1:3 → 1:4, the two-ways cards Didache 1:4 → 1:1, the
  "no longer observing sabbaths" cards Magnesians 1:8 → 1:9. Ids kept; each card's own citation follows. 8 thread anchors follow
  their member cards (11877, 12148, 12151, 12153, 12563, 12575, 12577, 13085).
- Prose: 20 cards with degraded markers / hyphen-chains ("wisdom-stream", "verbal-anchor", "substance", "seed-that-must-die"…),
  24 quoted phrases in prose that paraphrased the witness inside quotation marks (now the real words, cited), 5 bare "the Lord" for
  Yahusha; 6 summaries with the same ("the framework's own filter", "apparatus", "we do not build a thread").
- Witness quotations in summaries off the live text: 40 in 35 threads (typographic quotes, OCR hyphenation "mani-fested",
  "com- mandments", a few invented joins) — every one re-quoted verbatim at the verse the words sit in.
- Live text: Hermas 15:3 and 25:3 carry the OCR typo "Cod" for "God" → fixed to *Elohim (God)* under a guard on the exact old text.

## Built
| | cards | member notes | summaries | anchors | verses |
|---|---|---|---|---|---|
| Apostolic Fathers | 174 (55 moved; 41 prose; 89 script) | 141 | 64 | 7 | 2 |
| Acts 29 | 6 (3 rebuilt Come-and-See, 1 moved, 2 prose) | 5 | 1 (+ title 12160 "Yahusha (the Lord) Cometh") | 1 | — |

Scratch (Postgres 16, `seed463f.py`): run 1 = 180/180 cards landed as written (56/56 moved), 146/146 member notes, 65/65 summaries,
8/8 anchors, 2/2 verse texts; post-run regrade: witness italics all STAND, prose phrases 111 STAND + 1 ELSEWHERE (51854 cites its
neighbour 1:8 on purpose), canon leads 514 STAND + 2 none (Tobit / 2 Maccabees ends), 0 degraded / chains / slugs / Hebrew names,
0 summary italics off, 0 Hermas 23/24 cites, 0 duplicate pairs. Run 2 = changed nothing. Guards: a tampered live verse → RAISE,
nothing landed; a card moved since the read-back → skipped, the rest lands.

## Readers' flags, decided
- 51897 (Matthew 5:17 ↔ Magnesians): both cold reads move it to 1:9 (the sabbath line); the note was rewritten on Fable to that line.
- 12560: Ignatius's "live after the manner of Judaism, we have not received grace" is no longer quoted as "the apostolic confession";
  only the prophets-lived-after-the-Messiah words stand, with Hebrews 1:1 / 1 Peter 1:10–11 / Luke 24:27 beside them.
- 12564 (Magnesians, the law not abolished): internal-scaffolding sentences removed; the summary still sets Matthew 5:17–19,
  Mark 2:27–28, Isaiah 66:23 beside the sabbath line and does not endorse it.
- 12159: the Didache's Malachi echo is "the word of Malachi", not "word for word".
- "It ain't new" is Yoshi's own opener (118 of 158 summaries); a drafter smoothed it out of 21 summaries — restored in all.
- 4439–4441 (Matthew 10 → Acts 29): rebuilt Come-and-See, both whole verses quoted; Isaiah 49:1 / Jeremiah 31:10 are named in plain
  prose, not quoted (the old note only alluded to them).
- Stays: 51848, 52007 (Martyrdom 1:8 — the prayer), 53798, 53799 (Hermas 1:3).

## Text-lane notes (not blocking, Lightfoot OCR): "presbtery" (Philadelphians 1:4), "cheifest" (Hermas 26:29), "The Holy Pre-existent
Spirit. Which created" (Hermas 22:6), "Yahuah Elohim (the LORD God) ;" (Barnabas 1:6) — quoted as they stand.

## Coverage gaps seen (phase 2): Hermas 23 (Sim 6, 5 verses) and 24 (Sim 7, 1 verse) carry no card; Barnabas carries none.
The whole-library inventory from the same dump is in `_s463f_library_inventory.md`.
