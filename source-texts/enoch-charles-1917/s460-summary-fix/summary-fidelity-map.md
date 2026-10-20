# 1 Enoch thread-summary fidelity map — general map (S460, 2026-10-19)

Every live thread summary that cites 1 Enoch by chapter:verse, re-graded by the WORDS it quotes against the live Charles
1917 text (`regrade_summaries.py`, same norm/span logic as the S459 card regrade; per-summary verdicts and every quote in
`summary-regrade.json`). Read from `enoch-cards-live.json` as re-dumped after the S459 deploy (Oct 20, 00:01).

## What a summary quote is
An italic span with a 1 Enoch citation right beside it — `*…* (1 Enoch c:v)` or `1 Enoch c:v — *…*`. Bare citations with
no italic are CITATION_ONLY. (The S457 thread sweep graded every italic in a thread as an Enoch quote, which is why it
counted 512 summaries / 988 bad quotes; it flagged Matthew and Jubilees quotes as "not in Enoch". This map grades only
the Enoch-attributed quotes.)

## Summaries — 719 cite 1 Enoch c:v (1,168 Enoch quotes)
| verdict | all | S250 `1-enoch-N-…` chapter threads (422) | other threads (297) |
|---|---|---|---|
| STAND — every quote on the live verse, no bad prose | 183 | 86 | 97 |
| RE_QUOTE — quotes found, but at another address or in other words; re-cite / re-quote, thought unchanged | 207 | 122 | 85 |
| REWRITE — a quote that is nowhere in Charles 1917, or a cited verse that no longer exists, or degraded prose | 300 | 213 | 87 |
| CITATION_ONLY — cites Enoch, quotes nothing; read the gloss where the verse changed | 29 | 1 | 28 |

Quotes: STAND 422 · RE_ANCHOR 180 · RE_ANCHOR_REWORDED 162 · REWORDED 131 · NOT_FOUND 267 · SHORT (under 4 words) 6.
**740 bad quotes** across 455 summaries (1 bad: 252 · 2: 137 · 3: 51 · 4: 14 · 5: 1).

REWRITE breakdown: 98 summaries where EVERY Enoch quote is NOT_FOUND (written on the corrupt text, verse by verse —
the thought has to be re-formed from the live chapter); 96 mixed (some quotes stand, some are invented); 106 with no
NOT_FOUND quote at all — flagged for a cited verse that is gone (121 summaries cite an address the live text does not
have, e.g. 22:16, 24:11, 11:6–9, 3:2) or for degraded S1xx prose (66 summaries: "wisdom-stream", "the framework reads",
"Red Line #", "Yoshi", "extras-tier witness"; 10 of these are chapter threads, 56 are canon-anchored threads).

Tier: extras 663 (REWRITE 256 · RE_QUOTE 207 · STAND 183 · CITATION_ONLY 17) · complete_study 54 (REWRITE 43 ·
CITATION_ONLY 11) · free 2.

Anchors: no chapter thread anchors on a verse that is gone (0). 184 chapter threads anchor on a span whose text is
"different" at both ends, 160 on "same/same"; the quotes decide whether the thought still fits.

CITATION_ONLY addresses (across all summaries): 119 on same verses · 92 different · 6 reworded · 6 removed · 3 new —
the 92 + 6 + 6 + 3 get the gloss read.

Ten summaries mention 1 Enoch without a c:v citation (magi-astronomical-tradition, the-resurrection-of-the-righteous…,
unclean-spirits-recognize…, luke-16-the-rich-man-and-lazaros…, 1-enoch-52-stone-kingdom-without-hands,
jasher-3/6/7…, wisdom-of-solomon-4…, testaments-xii-88…) — read by hand.

## Chapter threads by chapter (STAND / RE_QUOTE / REWRITE)
Chapters 1–10, 47–51, 54–57, 99–100 are mostly sound. Chapters 17–45 (the journeys and the first Parable), 64–84
(Noah fragments, the luminaries), 89–97 and 102–107 are almost entirely REWRITE — these were written on the corrupt
text and cite verse numbers Charles does not have. Four chapters have no chapter thread: 86, 91, 101, 106.
1:3/1/0 2:3/0/0 3:2/0/1 4:2/0/0 5:2/2/0 6:2/1/0 7:3/1/0 8:2/2/0 9:2/2/1 10:6/0/0 11:0/1/3 12:2/2/0 13:2/1/2 14:0/2/2
15:1/2/1 16:1/1/1 17:0/1/4 18:0/2/3 19:0/3/0 20:2/2/0 21:0/3/0 22:0/2/2 23:0/0/3 24:1/1/2 25:0/2/1 26:0/0/3 27:0/0/3
28:0/0/3 29:0/0/3 30:0/0/3 31:0/0/3 32:0/1/2 33:0/1/3 34:0/1/2 35:0/0/3 36:0/0/3 37:0/1/3 38:0/0/5 39:0/1/4 40:0/3/3
41:1/1/2 42:0/2/4 43:1/1/3 44:0/0/5 45:0/1/5 46:1/2/1 47:5/0/0 48:3/2/0 49:3/1/0 50:2/3/0 51:4/2/0 52:0/2/1 53:0/2/1
54:3/0/0 55:3/1/0 56:4/1/0 57:3/0/0 58:1/2/1 59:0/2/1 60:0/4/0 61:2/3/0 62:0/4/0 63:0/2/2 64:0/0/3 65:0/0/5 66:0/0/3
67:0/3/1 68:0/1/2 69:0/3/2 70:0/3/1 71:0/3/2 72:0/2/1 73:2/0/1 74:0/0/4 75:0/2/1 76:0/1/2 77:0/1/2 78:0/0/4 79:0/0/4
80:0/0/4 81:0/1/3 82:0/0/4 83:0/0/4 84:0/1/3 85:1/3/0 87:1/1/1 88:2/0/2 89:0/3/4 90:0/1/6 92:0/0/5 93:0/0/4 94:0/0/4
95:0/0/4 96:0/1/4 97:0/0/4 98:1/3/1 99:3/2/0 100:4/1/0 102:0/1/3 103:0/1/4 104:0/1/4 105:0/0/4 107:0/0/4 108:0/3/1

## Order of work (general → specific)
1. RE_QUOTE (207) — mechanical: re-cite to the address the words live on, re-quote the live verse in full (stand-alone
   italics, cited). Thought unchanged. Build + scratch + deploy as one migration with (2).
2. REWRITE (300) — by hand, in Yoshi's voice, Come-and-See: the 98 all-NOT_FOUND chapter threads first (re-form the
   thought from the live chapter), then the 96 mixed, then the 106 degraded/verse-gone. Ids and slugs kept.
3. CITATION_ONLY on changed verses (29 summaries) and the 10 un-cited mentions — read the gloss, fix only where it no
   longer fits.
4. STAND (183) — untouched.
Track A (the Enoch book) forms its chapter-end text from the chapter threads once (1)–(2) land.

## Status 2026-10-19 (S460, later the same evening)
Fix built on this map: 532 summaries replaced (306 rewritten, 59 adjusted, 166 re-quoted, 1 kept), 168 titles, ids/slugs kept.
Verification and the title list: `summary-fix-report.md`. Migration `data-schema/migrations/session460_enoch_summary_fix.sql`,
scratch-tested twice (531 updated / 0 skipped; re-run 0), post-run regrade 0 bad quotes. Deploy waits on Yoshi's paste.
