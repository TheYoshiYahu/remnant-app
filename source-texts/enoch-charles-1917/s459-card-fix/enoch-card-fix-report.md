# 1 Enoch card fix — S459 (2026-10-19) — verification table, read by content

Every card below was read old-quote-against-live-verse (regrade.py), decided by hand (decisions.py, prose.py), rebuilt (build_fix.py → fix.json,
which holds every old and new note), written as data-schema/migrations/session459_enoch_card_fix.sql, run twice against a scratch Postgres seeded
from the S457 read-back with the live cross_references_check (source ≠ target) in place (seed_scratch.py / run_scratch.py: 362 updated, 199 moved,
329 member notes, 2 retired, 0 skipped; second run 0 changed), and re-graded after the run (verify_scratch.py + regrade on the post-fix dump):
all 362 STAND, 0 stale member notes. The first live run (Oct 19, 14:21) hit cross_references_check on card 16669 (an Enoch→Enoch card whose note
quoted its own source verse) and rolled back whole — nothing landed; 16669/21407/22534 re-decided, guard added, scratch re-run.

Verdicts: REWORDED = right verse, Charles wording differs; RE_ANCHOR = the words are verbatim at another verse; RE_ANCHOR_REWORDED = reworded
and at another verse; NOT_FOUND = the words are not Charles 1917.

Totals: 364 cards — {'REWORDED': 123, 'RE_ANCHOR_REWORDED': 76, 'RE_ANCHOR': 87, 'NOT_FOUND': 76}; prose rewritten on 188.

| card | source → 1 Enoch | S459 verdict | old → new address | action |
|---|---|---|---|---|
| 4396 | matthew 8:29 → 1-enoch 16:1 | NOT_FOUND | 16:1 → — | retired: duplicate — card 121872 (Matt 8:29 -> 1 Enoch 16:1) carries the same thought on the true verse |
| 4853 | matthew 26:64 → 1-enoch 62:9 | RE_ANCHOR | 62:9 → — | retired: duplicate — card 4851 (Matt 26:64 -> 1 Enoch 46:4) already quotes this verse |
| 45562 | 1-adam-eve 16:3 → 1-enoch | REWORDED | 41:5 → 41:5 | re-quoted in place |
| 45738 | 1-adam-eve 31:5 → 1-enoch | REWORDED | 40:9 → 40:9 | re-quoted in place |
| 45942 | 1-adam-eve 47:7 → 1-enoch | RE_ANCHOR | 69:10 → 69:6 | moved + re-quoted |
| 46048 | 1-adam-eve 54:4 → 1-enoch | NOT_FOUND | 32:4 → 24:4 | moved + re-quoted, prose rewritten |
| 46116 | 1-adam-eve 59:6 → 1-enoch | RE_ANCHOR | 69:6 → 8:2 | moved + re-quoted |
| 45458 | 1-adam-eve 8:1 → 1-enoch | RE_ANCHOR_REWORDED | 14:15 → 14:18 | moved + re-quoted |
| 45459 | 1-adam-eve 8:1 → 1-enoch | RE_ANCHOR_REWORDED | 14:11 → 18:4 | moved + re-quoted |
| 25490 | 1-enoch 103:8 → 1-enoch | REWORDED | 108:3 → 108:3 | re-quoted in place |
| 25507 | 1-enoch 104:8 → 1-enoch | REWORDED | 108:3 → 108:3 | re-quoted in place |
| 25549 | 1-enoch 108:11 → 1-enoch | NOT_FOUND | 104:6 → 103:5 | moved + re-quoted, prose rewritten |
| 16298 | 1-enoch 13:6 → 1-enoch | NOT_FOUND | 14:1 → 14:1 | re-quoted in place, prose rewritten |
| 22534 | 1-enoch 18:15 → 1-enoch | RE_ANCHOR | 21:6 → 21:6 | re-quoted in place, prose rewritten |
| 16669 | 1-enoch 18:16 → 1-enoch | RE_ANCHOR | 21:7 → 21:6 | moved + re-quoted, prose rewritten |
| 16705 | 1-enoch 19:1 → 1-enoch | RE_ANCHOR | 15:10 → 15:12 | moved + re-quoted |
| 16706 | 1-enoch 19:1 → 1-enoch | RE_ANCHOR | 15:8 → 15:10 | moved + re-quoted |
| 16701 | 1-enoch 19:2 → 1-enoch | REWORDED | 16:3 → 16:3 | re-quoted in place |
| 17913 | 1-enoch 1:7 → 1-enoch | REWORDED | 1:9 → 1:9 | re-quoted in place |
| 16715 | 1-enoch 20:4 → 1-enoch | RE_ANCHOR | 21:6 → 18:15 | moved + re-quoted |
| 16716 | 1-enoch 20:4 → 1-enoch | RE_ANCHOR | 21:5 → 18:14 | moved + re-quoted |
| 16721 | 1-enoch 20:5 → 1-enoch | REWORDED | 40:9 → 40:9 | re-quoted in place |
| 16731 | 1-enoch 21:10 → 1-enoch | REWORDED | 19:1 → 19:1 | re-quoted in place |
| 16739 | 1-enoch 21:4 → 1-enoch | RE_ANCHOR | 18:12 → 18:13 | moved + re-quoted |
| 16751 | 1-enoch 22:7 → 1-enoch | RE_ANCHOR | 21:5 → 18:14 | moved + re-quoted |
| 16775 | 1-enoch 24:3 → 1-enoch | REWORDED | 18:8 → 18:8 | re-quoted in place |
| 17136 | 1-enoch 25:7 → 1-enoch | REWORDED | 15:7 → 15:7 | re-quoted in place |
| 17235 | 1-enoch 33:3 → 1-enoch | REWORDED | 72:3 → 72:3 | re-quoted in place |
| 17245 | 1-enoch 34:1 → 1-enoch | NOT_FOUND | 76:1 → 76:1 | re-quoted in place, prose rewritten |
| 17258 | 1-enoch 35:1 → 1-enoch | RE_ANCHOR_REWORDED | 34:2 → 34:2 | re-quoted in place |
| 17270 | 1-enoch 36:3 → 1-enoch | REWORDED | 77:1 → 77:1 | re-quoted in place |
| 17929 | 1-enoch 38:6 → 1-enoch | RE_ANCHOR | 62:9 → 46:4 | moved + re-quoted |
| 17953 | 1-enoch 39:5 → 1-enoch | REWORDED | 45:3 → 45:3 | re-quoted in place |
| 17995 | 1-enoch 41:1 → 1-enoch | REWORDED | 60:11 → 60:11 | re-quoted in place |
| 19941 | 1-enoch 41:5 → 1-enoch | REWORDED | 60:11 → 60:11 | re-quoted in place |
| 18047 | 1-enoch 44:1 → 1-enoch | REWORDED | 72:1 → 72:1 | re-quoted in place |
| 18922 | 1-enoch 45:3 → 1-enoch | RE_ANCHOR_REWORDED | 62:1 → 61:8 | moved + re-quoted, prose rewritten |
| 18955 | 1-enoch 46:3 → 1-enoch | RE_ANCHOR_REWORDED | 62:7 → 71:14 | moved + re-quoted |
| 18995 | 1-enoch 48:2 → 1-enoch | RE_ANCHOR_REWORDED | 62:1 → 61:8 | moved + re-quoted, prose rewritten |
| 19003 | 1-enoch 49:3 → 1-enoch | REWORDED | 51:1 → 51:1 | re-quoted in place |
| 17936 | 1-enoch 49:4 → 1-enoch | REWORDED | 45:3 → 45:3 | re-quoted in place |
| 19007 | 1-enoch 49:4 → 1-enoch | RE_ANCHOR_REWORDED | 62:1 → 61:8 | moved + re-quoted, prose rewritten |
| 19019 | 1-enoch 50:4 → 1-enoch | REWORDED | 51:1 → 51:1 | re-quoted in place |
| 19023 | 1-enoch 50:4 → 1-enoch | REWORDED | 108:3 → 108:3 | re-quoted in place |
| 19054 | 1-enoch 51:3 → 1-enoch | REWORDED | 61:8 → 61:8 | re-quoted in place |
| 19847 | 1-enoch 52:4 → 1-enoch | REWORDED | 53:1 → 53:1 | re-quoted in place |
| 19866 | 1-enoch 53:6 → 1-enoch | RE_ANCHOR | 62:9 → 46:4 | moved + re-quoted |
| 19885 | 1-enoch 55:4 → 1-enoch | REWORDED | 61:8 → 61:8 | re-quoted in place |
| 19917 | 1-enoch 56:1 → 1-enoch | RE_ANCHOR_REWORDED | 53:4 → 53:3 | moved + re-quoted |
| 16012 | 1-enoch 5:8 → 1-enoch | REWORDED | 1:9 → 1:9 | re-quoted in place |
| 19972 | 1-enoch 61:8 → 1-enoch | RE_ANCHOR_REWORDED | 62:1 → 62:2 | moved + re-quoted, prose rewritten |
| 21272 | 1-enoch 63:6 → 1-enoch | RE_ANCHOR | 62:9 → 46:4 | moved + re-quoted |
| 21271 | 1-enoch 63:9 → 1-enoch | RE_ANCHOR | 62:10 → 46:5 | moved + re-quoted |
| 21304 | 1-enoch 65:12 → 1-enoch | REWORDED | 10:20 → 10:20 | re-quoted in place |
| 21407 | 1-enoch 71:1 → 1-enoch | RE_ANCHOR | 70:1 → 70:1 | re-quoted in place, prose rewritten |
| 21397 | 1-enoch 71:7 → 1-enoch | RE_ANCHOR_REWORDED | 39:6 → 61:4 | moved + re-quoted |
| 22500 | 1-enoch 74:13 → 1-enoch | NOT_FOUND | 82:5 → 82:4 | moved + re-quoted, prose rewritten |
| 22503 | 1-enoch 74:13 → 1-enoch | NOT_FOUND | 82:3 → 82:5 | moved + re-quoted, prose rewritten |
| 22550 | 1-enoch 78:4 → 1-enoch | RE_ANCHOR_REWORDED | 74:10 → 82:5 | moved + re-quoted |
| 22549 | 1-enoch 78:5 → 1-enoch | NOT_FOUND | 74:11 → 74:11 | re-quoted in place, prose rewritten |
| 22559 | 1-enoch 79:5 → 1-enoch | NOT_FOUND | 74:11 → 74:11 | re-quoted in place, prose rewritten |
| 22579 | 1-enoch 81:10 → 1-enoch | NOT_FOUND | 82:5 → 82:4 | moved + re-quoted, prose rewritten |
| 22580 | 1-enoch 81:10 → 1-enoch | NOT_FOUND | 82:7 → 82:7 | re-quoted in place, prose rewritten |
| 23826 | 1-enoch 84:2 → 1-enoch | REWORDED | 9:4 → 9:4 | re-quoted in place |
| 25314 | 1-enoch 93:6 → 1-enoch | RE_ANCHOR_REWORDED | 94:6 → 96:5 | moved + re-quoted |
| 25419 | 1-enoch 98:2 → 1-enoch | RE_ANCHOR_REWORDED | 94:7 → 97:8 | moved + re-quoted |
| 25412 | 1-enoch 98:7 → 1-enoch | NOT_FOUND | 104:9 → 104:7 | moved + re-quoted, prose rewritten |
| 157298 | 1-kings 22:19 → 1-enoch | RE_ANCHOR_REWORDED | 14:15 → 14:18 | moved + re-quoted, prose rewritten |
| 59357 | 1-peter 3:19 → 1-enoch | RE_ANCHOR | 18:14 → 18:16 | moved + re-quoted |
| 59358 | 1-peter 3:19 → 1-enoch | RE_ANCHOR | 21:5 → 18:14 | moved + re-quoted |
| 56509 | 1-thessalonians 1:10 → 1-enoch | RE_ANCHOR_REWORDED | 5:7 → 5:4 | moved + re-quoted, prose rewritten |
| 56538 | 1-thessalonians 3:13 → 1-enoch | REWORDED | 1:9 → 1:9 | re-quoted in place, prose rewritten |
| 56544 | 1-thessalonians 4:16 → 1-enoch | REWORDED | 51:1 → 51:1 | re-quoted in place |
| 56570 | 1-thessalonians 5:5 → 1-enoch | REWORDED | 58:3 → 58:3 | re-quoted in place |
| 56571 | 1-thessalonians 5:5 → 1-enoch | NOT_FOUND | 58:6 → 58:6 | re-quoted in place, prose rewritten |
| 56797 | 1-timothy 4:1 → 1-enoch | REWORDED | 19:1 → 19:1 | re-quoted in place |
| 46715 | 2-adam-eve 22:10 → 1-enoch | REWORDED | 6:6 → 6:6 | re-quoted in place |
| 46438 | 2-adam-eve 3:15 → 1-enoch | REWORDED | 19:1 → 19:1 | re-quoted in place |
| 55165 | 2-enoch 13:2 → 1-enoch | REWORDED | 72:3 → 72:3 | re-quoted in place |
| 55168 | 2-enoch 14:2 → 1-enoch | RE_ANCHOR_REWORDED | 72:5 → 72:6 | moved + re-quoted, prose rewritten |
| 55179 | 2-enoch 16:2 → 1-enoch | NOT_FOUND | 74:2 → 74:2 | re-quoted in place, prose rewritten |
| 55177 | 2-enoch 16:3 → 1-enoch | NOT_FOUND | 74:11 → 74:11 | re-quoted in place, prose rewritten |
| 55189 | 2-enoch 18:3 → 1-enoch | REWORDED | 6:6 → 6:6 | re-quoted in place |
| 55120 | 2-enoch 1:1 → 1-enoch | RE_ANCHOR | 70:1 → 71:1 | moved + re-quoted |
| 55196 | 2-enoch 20:1 → 1-enoch | REWORDED | 61:10 → 61:10 | re-quoted in place |
| 55244 | 2-enoch 29:2 → 1-enoch | RE_ANCHOR | 69:20 → 69:16 | moved + re-quoted |
| 55238 | 2-enoch 29:4 → 1-enoch | RE_ANCHOR | 18:13 → 18:15 | moved + re-quoted |
| 55283 | 2-enoch 35:2 → 1-enoch | NOT_FOUND | 81:3 → 81:6 | moved + re-quoted, prose rewritten |
| 55302 | 2-enoch 40:11 → 1-enoch | REWORDED | 81:2 → 81:2 | re-quoted in place |
| 55362 | 2-enoch 50:1 → 1-enoch | REWORDED | 98:7 → 98:7 | re-quoted in place |
| 55443 | 2-enoch 67:1 → 1-enoch | RE_ANCHOR_REWORDED | 70:3 → 71:2 | moved + re-quoted |
| 60447 | 2-peter 2:4 → 1-enoch | RE_ANCHOR_REWORDED | 21:10 → 21:10 | re-quoted in place, prose rewritten |
| 56589 | 2-thessalonians 1:8 → 1-enoch | REWORDED | 1:9 → 1:9 | re-quoted in place |
| 10661 | acts 16:16 → 1-enoch | REWORDED | 8:2 → 8:2 | re-quoted in place |
| 9875 | acts 1:11 → 1-enoch | REWORDED | 1:9 → 1:9 | re-quoted in place, prose rewritten |
| 9899 | acts 2:34 → 1-enoch | RE_ANCHOR_REWORDED | 62:1 → 61:8 | moved + re-quoted, prose rewritten |
| 9900 | acts 2:36 → 1-enoch | RE_ANCHOR_REWORDED | 62:7 → 71:14 | moved + re-quoted, prose rewritten |
| 69401 | adam-eve 40:1 → 1-enoch | REWORDED | 20:5 → 20:5 | re-quoted in place |
| 48751 | apocalypse-of-abraham 12:1 → 1-enoch | NOT_FOUND | 14:2 → 19:3 | moved + re-quoted, prose rewritten |
| 48743 | apocalypse-of-abraham 12:9 → 1-enoch | NOT_FOUND | 14:3 → 14:8 | moved + re-quoted, prose rewritten |
| 48775 | apocalypse-of-abraham 14:4 → 1-enoch | REWORDED | 8:2 → 8:2 | re-quoted in place |
| 48786 | apocalypse-of-abraham 15:4 → 1-enoch | NOT_FOUND | 14:3 → 14:8 | moved + re-quoted, prose rewritten |
| 48830 | apocalypse-of-abraham 18:4 → 1-enoch | NOT_FOUND | 39:11 → 40:2 | moved + re-quoted |
| 48821 | apocalypse-of-abraham 18:8 → 1-enoch | RE_ANCHOR | 39:12 → 40:3 | moved + re-quoted |
| 48824 | apocalypse-of-abraham 18:9 → 1-enoch | NOT_FOUND | 14:3 → 14:8 | moved + re-quoted, prose rewritten |
| 48839 | apocalypse-of-abraham 19:9 → 1-enoch | RE_ANCHOR | 18:13 → 18:15 | moved + re-quoted |
| 48867 | apocalypse-of-abraham 21:3 → 1-enoch | REWORDED | 60:7 → 60:7 | re-quoted in place |
| 48977 | apocalypse-of-abraham 30:3 → 1-enoch | REWORDED | 1:9 → 1:9 | re-quoted in place |
| 49384 | ascension-isaiah 11:32 → 1-enoch | RE_ANCHOR_REWORDED | 14:15 → 14:18 | moved + re-quoted, prose rewritten |
| 49285 | ascension-isaiah 6:13 → 1-enoch | RE_ANCHOR_REWORDED | 14:15 → 14:18 | moved + re-quoted, prose rewritten |
| 120469 | daniel 12:3 → 1-enoch | NOT_FOUND | 104:2 → 104:2 | re-quoted in place, prose rewritten |
| 120191 | daniel 7:9 → 1-enoch | RE_ANCHOR_REWORDED | 14:15 → 14:18 | moved + re-quoted |
| 165944 | deuteronomy 32:17 → 1-enoch | REWORDED | 99:7 → 99:7 | re-quoted in place |
| 165963 | deuteronomy 33:2 → 1-enoch | REWORDED | 1:9 → 1:9 | re-quoted in place, prose rewritten |
| 43693 | ecclesiasticus 49:14 → 1-enoch | REWORDED | 71:5 → 71:5 | re-quoted in place |
| 50233 | ephesians 6:12 → 1-enoch | RE_ANCHOR | 15:10 → 15:12 | moved + re-quoted |
| 17356 | genesis 4:10 → 1-enoch | RE_ANCHOR | 22:14 → 22:7 | moved + re-quoted |
| 17390 | genesis 6:4 → 1-enoch | RE_ANCHOR | 15:8 → 15:10 | moved + re-quoted |
| 17391 | genesis 6:4 → 1-enoch | RE_ANCHOR | 15:9 → 15:11 | moved + re-quoted |
| 12616 | hebrews 11:5 → 1-enoch | REWORDED | 71:1 → 71:1 | re-quoted in place, prose rewritten |
| 12617 | hebrews 11:5 → 1-enoch | REWORDED | 71:5 → 71:5 | re-quoted in place |
| 86006 | isaiah 24:21 → 1-enoch | RE_ANCHOR | 18:14 → 18:16 | moved + re-quoted |
| 86012 | isaiah 24:21 → 1-enoch | RE_ANCHOR | 21:6 → 18:15 | moved + re-quoted |
| 86011 | isaiah 24:22 → 1-enoch | RE_ANCHOR | 21:7 → 18:16 | moved + re-quoted |
| 67773 | isaiah 53:11 → 1-enoch | RE_ANCHOR_REWORDED | 62:7 → 71:14 | moved + re-quoted |
| 67774 | isaiah 53:12 → 1-enoch | RE_ANCHOR | 62:9 → 46:4 | moved + re-quoted |
| 69749 | isaiah 65:17 → 1-enoch | NOT_FOUND | 45:4 → 45:4 | re-quoted in place, prose rewritten |
| 69782 | isaiah 66:15 → 1-enoch | REWORDED | 1:9 → 1:9 | re-quoted in place |
| 69783 | isaiah 66:16 → 1-enoch | NOT_FOUND | 45:5 → 48:9 | moved + re-quoted, prose rewritten |
| 69795 | isaiah 66:22 → 1-enoch | NOT_FOUND | 45:4 → 45:4 | re-quoted in place, prose rewritten |
| 66488 | isaiah 6:1 → 1-enoch | NOT_FOUND | 14:16 → 14:20 | moved + re-quoted, prose rewritten |
| 66489 | isaiah 6:1 → 1-enoch | RE_ANCHOR_REWORDED | 14:15 → 14:18 | moved + re-quoted, prose rewritten |
| 66492 | isaiah 6:3 → 1-enoch | RE_ANCHOR_REWORDED | 39:13 → 40:4 | moved + re-quoted, prose rewritten |
| 66493 | isaiah 6:3 → 1-enoch | RE_ANCHOR | 39:12 → 40:3 | moved + re-quoted |
| 29120 | jasher 3:36 → 1-enoch | NOT_FOUND | 14:3 → 39:3 | moved + re-quoted, prose rewritten |
| 29122 | jasher 3:36 → 1-enoch | RE_ANCHOR | 70:1 → 71:1 | moved + re-quoted |
| 29177 | jasher 6:14 → 1-enoch | REWORDED | 89:3 → 89:3 | re-quoted in place |
| 145066 | job 24:22 → 1-enoch | RE_ANCHOR_REWORDED | 96:1 → 96:5 | moved + re-quoted |
| 145067 | job 24:24 → 1-enoch | NOT_FOUND | 96:2 → 96:8 | moved + re-quoted, prose rewritten |
| 150635 | job 38:33 → 1-enoch | RE_ANCHOR | 18:13 → 18:15 | moved + re-quoted |
| 150619 | job 38:6 → 1-enoch | NOT_FOUND | 18:1 → 18:1 | re-quoted in place |
| 150625 | job 38:8 → 1-enoch | RE_ANCHOR_REWORDED | 69:22 → 69:17 | moved + re-quoted |
| 151942 | job 41:1 → 1-enoch | REWORDED | 60:7 → 60:7 | re-quoted in place |
| 8008 | john 11:25 → 1-enoch | REWORDED | 51:1 → 51:1 | re-quoted in place, prose rewritten |
| 8001 | john 12:23 → 1-enoch | RE_ANCHOR_REWORDED | 62:2 → 61:9 | moved + re-quoted, prose rewritten |
| 8002 | john 12:23 → 1-enoch | RE_ANCHOR_REWORDED | 62:7 → 71:14 | moved + re-quoted, prose rewritten |
| 7969 | john 1:11 → 1-enoch | REWORDED | 42:2 → 42:2 | re-quoted in place, prose rewritten |
| 7997 | john 5:27 → 1-enoch | RE_ANCHOR_REWORDED | 62:2 → 61:9 | moved + re-quoted, prose rewritten |
| 7998 | john 5:27 → 1-enoch | REWORDED | 61:8 → 61:8 | re-quoted in place, prose rewritten |
| 135969 | john 5:27 → 1-enoch | NOT_FOUND | 62:6 → 69:27 | moved + re-quoted, prose rewritten |
| 25927 | jubilees 10:2 → 1-enoch | RE_ANCHOR | 15:10 → 15:12 | moved + re-quoted |
| 25953 | jubilees 12:17 → 1-enoch | REWORDED | 19:1 → 19:1 | re-quoted in place |
| 25985 | jubilees 14:13 → 1-enoch | REWORDED | 81:1 → 81:1 | re-quoted in place |
| 25566 | jubilees 1:29 → 1-enoch | REWORDED | 81:1 → 81:1 | re-quoted in place |
| 25597 | jubilees 2:2 → 1-enoch | RE_ANCHOR_REWORDED | 60:14 → 41:4 | moved + re-quoted |
| 25598 | jubilees 2:2 → 1-enoch | RE_ANCHOR_REWORDED | 60:13 → 41:3 | moved + re-quoted |
| 25593 | jubilees 2:9 → 1-enoch | REWORDED | 72:1 → 72:1 | re-quoted in place |
| 25627 | jubilees 4:15 → 1-enoch | REWORDED | 6:6 → 6:6 | re-quoted in place |
| 25629 | jubilees 4:23 → 1-enoch | REWORDED | 13:8 → 13:8 | re-quoted in place |
| 25690 | jubilees 6:32 → 1-enoch | RE_ANCHOR_REWORDED | 74:10 → 82:5 | moved + re-quoted |
| 25691 | jubilees 6:32 → 1-enoch | NOT_FOUND | 74:13 → 74:12 | moved + re-quoted, prose rewritten |
| 25692 | jubilees 6:37 → 1-enoch | NOT_FOUND | 82:3 → 82:5 | moved + re-quoted, prose rewritten |
| 25718 | jubilees 7:39 → 1-enoch | RE_ANCHOR | 7:5 → 7:6 | moved + re-quoted |
| 25721 | jubilees 8:18 → 1-enoch | REWORDED | 26:1 → 26:1 | re-quoted in place |
| 25726 | jubilees 8:3 → 1-enoch | REWORDED | 8:2 → 8:2 | re-quoted in place |
| 62589 | jude 1:13 → 1-enoch | RE_ANCHOR | 21:6 → 18:15 | moved + re-quoted |
| 62554 | jude 1:14 → 1-enoch | REWORDED | 1:9 → 1:9 | re-quoted in place |
| 7924 | luke 10:18 → 1-enoch | REWORDED | 6:6 → 6:6 | re-quoted in place, prose rewritten |
| 140747 | luke 11:21 → 1-enoch | RE_ANCHOR | 15:9 → 15:11 | moved + re-quoted |
| 7948 | luke 16:22 → 1-enoch | RE_ANCHOR | 22:9 → 22:9 | re-quoted in place |
| 7947 | luke 16:23 → 1-enoch | RE_ANCHOR | 22:10 → 22:10 | re-quoted in place |
| 7946 | luke 16:26 → 1-enoch | RE_ANCHOR_REWORDED | 22:11 → 22:4 | moved + re-quoted, prose rewritten |
| 7938 | luke 19:10 → 1-enoch | NOT_FOUND | 90:3 → 90:10 | moved + re-quoted, prose rewritten |
| 7886 | luke 1:19 → 1-enoch | REWORDED | 40:2 → 40:2 | re-quoted in place |
| 7887 | luke 1:19 → 1-enoch | REWORDED | 40:9 → 40:9 | re-quoted in place |
| 7957 | luke 20:36 → 1-enoch | RE_ANCHOR_REWORDED | 104:4 → 104:4 | re-quoted in place, prose rewritten |
| 7958 | luke 20:36 → 1-enoch | NOT_FOUND | 39:5 → 39:5 | re-quoted in place, prose rewritten |
| 7959 | luke 20:36 → 1-enoch | REWORDED | 39:4 → 39:4 | re-quoted in place |
| 135426 | luke 22:30 → 1-enoch | RE_ANCHOR_REWORDED | 62:1 → 61:8 | moved + re-quoted, prose rewritten |
| 135440 | luke 22:69 → 1-enoch | NOT_FOUND | 62:5 → 62:5 | re-quoted in place, prose rewritten |
| 7955 | luke 23:43 → 1-enoch | RE_ANCHOR_REWORDED | 22:11 → 22:4 | moved + re-quoted, prose rewritten |
| 7956 | luke 23:43 → 1-enoch | RE_ANCHOR | 22:9 → 22:9 | re-quoted in place, prose rewritten |
| 7892 | luke 2:13 → 1-enoch | NOT_FOUND | 40:1 → 40:1 | re-quoted in place, prose rewritten |
| 7893 | luke 2:14 → 1-enoch | RE_ANCHOR | 39:12 → 40:3 | moved + re-quoted |
| 7894 | luke 2:14 → 1-enoch | RE_ANCHOR_REWORDED | 39:13 → 40:4 | moved + re-quoted |
| 7901 | luke 3:37 → 1-enoch | REWORDED | 60:8 → 60:8 | re-quoted in place |
| 7899 | luke 3:38 → 1-enoch | REWORDED | 85:3 → 85:3 | re-quoted in place |
| 7900 | luke 3:38 → 1-enoch | RE_ANCHOR | 85:8 → 85:9 | moved + re-quoted |
| 140723 | luke 4:34 → 1-enoch | RE_ANCHOR | 15:8 → 15:10 | moved + re-quoted |
| 140722 | luke 4:35 → 1-enoch | RE_ANCHOR | 15:9 → 15:11 | moved + re-quoted |
| 7906 | luke 8:28 → 1-enoch | NOT_FOUND | 16:1 → 16:1 | re-quoted in place, prose rewritten |
| 7908 | luke 8:29 → 1-enoch | RE_ANCHOR | 15:8 → 15:10 | moved + re-quoted |
| 7907 | luke 8:31 → 1-enoch | RE_ANCHOR | 15:11 → 16:1 | moved + re-quoted |
| 135392 | luke 9:39 → 1-enoch | RE_ANCHOR | 15:9 → 15:11 | moved + re-quoted |
| 135393 | luke 9:42 → 1-enoch | RE_ANCHOR | 15:11 → 16:1 | moved + re-quoted |
| 122007 | malachi 3:17 → 1-enoch | REWORDED | 108:3 → 108:3 | re-quoted in place |
| 7874 | mark 14:62 → 1-enoch | RE_ANCHOR | 62:9 → 62:9 | re-quoted in place, prose rewritten |
| 7875 | mark 14:62 → 1-enoch | RE_ANCHOR_REWORDED | 62:7 → 71:14 | moved + re-quoted |
| 7876 | mark 14:62 → 1-enoch | RE_ANCHOR_REWORDED | 62:1 → 61:8 | moved + re-quoted, prose rewritten |
| 7877 | mark 14:62 → 1-enoch | REWORDED | 46:4 → 46:4 | re-quoted in place, prose rewritten |
| 7844 | mark 1:24 → 1-enoch | NOT_FOUND | 16:1 → 16:4 | moved + re-quoted, prose rewritten |
| 7845 | mark 1:24 → 1-enoch | RE_ANCHOR | 15:11 → 16:1 | moved + re-quoted |
| 7846 | mark 1:24 → 1-enoch | RE_ANCHOR | 15:6 → 15:8 | moved + re-quoted |
| 7843 | mark 3:11 → 1-enoch | REWORDED | 19:1 → 19:1 | re-quoted in place |
| 7856 | mark 5:13 → 1-enoch | RE_ANCHOR | 15:11 → 16:1 | moved + re-quoted, prose rewritten |
| 7852 | mark 5:15 → 1-enoch | REWORDED | 19:1 → 19:1 | re-quoted in place, prose rewritten |
| 7855 | mark 5:8 → 1-enoch | NOT_FOUND | 16:1 → 16:1 | re-quoted in place |
| 7857 | mark 5:9 → 1-enoch | RE_ANCHOR | 15:9 → 15:11 | moved + re-quoted, prose rewritten |
| 7858 | mark 5:9 → 1-enoch | RE_ANCHOR | 15:8 → 15:10 | moved + re-quoted, prose rewritten |
| 134196 | mark 6:7 → 1-enoch | RE_ANCHOR | 15:9 → 15:11 | moved + re-quoted |
| 134197 | mark 6:7 → 1-enoch | RE_ANCHOR | 15:11 → 16:1 | moved + re-quoted |
| 134233 | mark 9:25 → 1-enoch | RE_ANCHOR | 15:9 → 15:11 | moved + re-quoted |
| 134234 | mark 9:25 → 1-enoch | RE_ANCHOR | 15:11 → 16:1 | moved + re-quoted |
| 7868 | mark 9:43 → 1-enoch | RE_ANCHOR_REWORDED | 27:2 → 26:2 | moved + re-quoted |
| 7869 | mark 9:48 → 1-enoch | RE_ANCHOR_REWORDED | 22:11 → 22:11 | re-quoted in place, prose rewritten |
| 4453 | matthew 10:32 → 1-enoch | NOT_FOUND | 103:3 → 104:1 | moved + re-quoted, prose rewritten |
| 4454 | matthew 10:33 → 1-enoch | NOT_FOUND | 103:8 → 103:4 | moved + re-quoted, prose rewritten |
| 4461 | matthew 11:5 → 1-enoch | RE_ANCHOR_REWORDED | 5:7 → 1:8 | moved + re-quoted, prose rewritten |
| 4462 | matthew 11:5 → 1-enoch | REWORDED | 10:17 → 10:17 | re-quoted in place, prose rewritten |
| 4501 | matthew 12:14 → 1-enoch | REWORDED | 95:7 → 95:7 | re-quoted in place, prose rewritten |
| 4504 | matthew 12:18 → 1-enoch | REWORDED | 62:2 → 62:2 | re-quoted in place, prose rewritten |
| 122747 | matthew 12:24 → 1-enoch | RE_ANCHOR | 15:11 → 16:1 | moved + re-quoted |
| 4512 | matthew 12:32 → 1-enoch | NOT_FOUND | 65:11 → 65:11 | re-quoted in place, prose rewritten |
| 4526 | matthew 13:11 → 1-enoch | REWORDED | 48:7 → 48:7 | re-quoted in place, prose rewritten |
| 4531 | matthew 13:19 → 1-enoch | REWORDED | 19:1 → 19:1 | re-quoted in place, prose rewritten |
| 4545 | matthew 13:34 → 1-enoch | REWORDED | 46:3 → 46:3 | re-quoted in place, prose rewritten |
| 4536 | matthew 13:38 → 1-enoch | REWORDED | 10:9 → 10:9 | re-quoted in place, prose rewritten |
| 4557 | matthew 13:38 → 1-enoch | NOT_FOUND | 22:7 → 22:7 | re-quoted in place, prose rewritten |
| 4540 | matthew 13:42 → 1-enoch | REWORDED | 10:13 → 10:13 | re-quoted in place, prose rewritten |
| 4541 | matthew 13:42 → 1-enoch | REWORDED | 54:6 → 54:6 | re-quoted in place, prose rewritten |
| 4597 | matthew 16:13 → 1-enoch | REWORDED | 46:2 → 46:2 | re-quoted in place, prose rewritten |
| 4598 | matthew 16:16 → 1-enoch | REWORDED | 46:3 → 46:3 | re-quoted in place, prose rewritten |
| 4602 | matthew 16:19 → 1-enoch | REWORDED | 49:2 → 49:2 | re-quoted in place, prose rewritten |
| 4603 | matthew 16:19 → 1-enoch | REWORDED | 51:3 → 51:3 | re-quoted in place, prose rewritten |
| 4604 | matthew 16:19 → 1-enoch | RE_ANCHOR_REWORDED | 62:7 → 71:14 | moved + re-quoted, prose rewritten |
| 4605 | matthew 16:19 → 1-enoch | REWORDED | 69:27 → 69:27 | re-quoted in place, prose rewritten |
| 124246 | matthew 16:27 → 1-enoch | RE_ANCHOR_REWORDED | 62:7 → 71:14 | moved + re-quoted |
| 4686 | matthew 18:10 → 1-enoch | REWORDED | 40:9 → 40:9 | re-quoted in place, prose rewritten |
| 4682 | matthew 18:11 → 1-enoch | RE_ANCHOR_REWORDED | 89:42 → 90:18 | moved + re-quoted, prose rewritten |
| 4683 | matthew 18:12 → 1-enoch | NOT_FOUND | 89:54 → 89:54 | re-quoted in place, prose rewritten |
| 4685 | matthew 18:13 → 1-enoch | NOT_FOUND | 90:18 → 90:33 | moved + re-quoted, prose rewritten |
| 4677 | matthew 18:6 → 1-enoch | REWORDED | 8:1 → 8:1 | re-quoted in place, prose rewritten |
| 4680 | matthew 18:6 → 1-enoch | NOT_FOUND | 22:11 → 22:11 | re-quoted in place, prose rewritten |
| 4711 | matthew 19:23 → 1-enoch | RE_ANCHOR_REWORDED | 94:3 → 94:8 | moved + re-quoted, prose rewritten |
| 4712 | matthew 19:23 → 1-enoch | REWORDED | 97:7 → 97:7 | re-quoted in place, prose rewritten |
| 4713 | matthew 19:24 → 1-enoch | RE_ANCHOR | 94:8 → 97:9 | moved + re-quoted, prose rewritten |
| 4715 | matthew 19:26 → 1-enoch | REWORDED | 100:6 → 100:6 | re-quoted in place, prose rewritten |
| 4259 | matthew 1:21 → 1-enoch | REWORDED | 69:26 → 69:26 | re-quoted in place, prose rewritten |
| 4258 | matthew 1:23 → 1-enoch | REWORDED | 62:1 → 61:8 | moved + re-quoted, prose rewritten |
| 4726 | matthew 20:16 → 1-enoch | NOT_FOUND | 39:1 → 62:8 | moved + re-quoted, prose rewritten |
| 4736 | matthew 20:28 → 1-enoch | RE_ANCHOR | 62:9 → 46:4 | moved + re-quoted, prose rewritten |
| 4753 | matthew 21:19 → 1-enoch | NOT_FOUND | 89:35 → 89:58 | moved + re-quoted, prose rewritten |
| 4761 | matthew 21:41 → 1-enoch | NOT_FOUND | 89:45 → 90:25 | moved + re-quoted, prose rewritten |
| 4782 | matthew 22:44 → 1-enoch | REWORDED | 51:3 → 51:3 | re-quoted in place, prose rewritten |
| 4783 | matthew 22:44 → 1-enoch | REWORDED | 61:8 → 61:8 | re-quoted in place, prose rewritten |
| 4784 | matthew 22:45 → 1-enoch | RE_ANCHOR_REWORDED | 62:7 → 71:14 | moved + re-quoted, prose rewritten |
| 4801 | matthew 23:33 → 1-enoch | RE_ANCHOR | 22:7 → 21:10 | moved + re-quoted, prose rewritten |
| 4802 | matthew 23:35 → 1-enoch | RE_ANCHOR | 22:14 → 22:7 | moved + re-quoted, prose rewritten |
| 4814 | matthew 24:31 → 1-enoch | NOT_FOUND | 90:10 → 90:10 | re-quoted in place, prose rewritten |
| 4807 | matthew 24:38 → 1-enoch | NOT_FOUND | 65:11 → 65:10 | moved + re-quoted, prose rewritten |
| 4808 | matthew 24:39 → 1-enoch | NOT_FOUND | 67:1 → 10:13 | moved + re-quoted, prose rewritten |
| 4845 | matthew 25:31 → 1-enoch | NOT_FOUND | 62:5 → 62:5 | re-quoted in place, prose rewritten |
| 4846 | matthew 25:31 → 1-enoch | RE_ANCHOR_REWORDED | 62:3 → 61:10 | moved + re-quoted, prose rewritten |
| 4847 | matthew 25:32 → 1-enoch | RE_ANCHOR | 62:9 → 46:4 | moved + re-quoted, prose rewritten |
| 4848 | matthew 25:41 → 1-enoch | NOT_FOUND | 62:11 → 46:6 | moved + re-quoted, prose rewritten |
| 4849 | matthew 25:41 → 1-enoch | NOT_FOUND | 63:7 → 63:8 | moved + re-quoted, prose rewritten |
| 4850 | matthew 26:64 → 1-enoch | REWORDED | 46:2 → 46:2 | re-quoted in place, prose rewritten |
| 4854 | matthew 26:64 → 1-enoch | RE_ANCHOR_REWORDED | 63:3 → 62:9 | moved + re-quoted, prose rewritten |
| 4877 | matthew 27:1 → 1-enoch | NOT_FOUND | 63:1 → 62:3 | moved + re-quoted, prose rewritten |
| 4878 | matthew 27:42 → 1-enoch | RE_ANCHOR_REWORDED | 62:3 → 61:10 | moved + re-quoted, prose rewritten |
| 4880 | matthew 27:42 → 1-enoch | RE_ANCHOR_REWORDED | 63:3 → 62:9 | moved + re-quoted, prose rewritten |
| 4879 | matthew 27:43 → 1-enoch | RE_ANCHOR_REWORDED | 62:7 → 71:14 | moved + re-quoted, prose rewritten |
| 4900 | matthew 28:18 → 1-enoch | NOT_FOUND | 62:6 → 62:2 | moved + re-quoted, prose rewritten |
| 4901 | matthew 28:18 → 1-enoch | RE_ANCHOR | 62:9 → 46:4 | moved + re-quoted, prose rewritten |
| 4902 | matthew 28:18 → 1-enoch | REWORDED | 61:8 → 61:8 | re-quoted in place, prose rewritten |
| 4274 | matthew 2:2 → 1-enoch | RE_ANCHOR_REWORDED | 90:20 → 90:37 | moved + re-quoted, prose rewritten |
| 4275 | matthew 2:2 → 1-enoch | RE_ANCHOR | 90:21 → 90:38 | moved + re-quoted, prose rewritten |
| 4292 | matthew 3:16 → 1-enoch | RE_ANCHOR_REWORDED | 14:15 → 14:18 | moved + re-quoted, prose rewritten |
| 4293 | matthew 3:16 → 1-enoch | REWORDED | 71:1 → 71:1 | re-quoted in place, prose rewritten |
| 4298 | matthew 3:17 → 1-enoch | NOT_FOUND | 39:5 → 40:5 | moved + re-quoted, prose rewritten |
| 4299 | matthew 3:17 → 1-enoch | RE_ANCHOR_REWORDED | 62:7 → 71:14 | moved + re-quoted, prose rewritten |
| 4328 | matthew 5:14 → 1-enoch | REWORDED | 58:3 → 58:3 | re-quoted in place, prose rewritten |
| 4329 | matthew 5:14 → 1-enoch | NOT_FOUND | 38:4 → 38:4 | re-quoted in place, prose rewritten |
| 4330 | matthew 5:16 → 1-enoch | RE_ANCHOR_REWORDED | 38:2 → 38:2 | re-quoted in place, prose rewritten |
| 4334 | matthew 5:19 → 1-enoch | NOT_FOUND | 82:13 → 104:9 | moved + re-quoted, prose rewritten |
| 4335 | matthew 5:19 → 1-enoch | NOT_FOUND | 95:2 → 104:10 | moved + re-quoted, prose rewritten |
| 4323 | matthew 5:3 → 1-enoch | RE_ANCHOR_REWORDED | 5:7 → 1:8 | moved + re-quoted, prose rewritten |
| 4367 | matthew 6:10 → 1-enoch | RE_ANCHOR_REWORDED | 84:3 → 9:5 | moved + re-quoted, prose rewritten |
| 4365 | matthew 6:9 → 1-enoch | REWORDED | 9:4 → 9:4 | re-quoted in place, prose rewritten |
| 4366 | matthew 6:9 → 1-enoch | NOT_FOUND | 84:2 → 84:2 | re-quoted in place, prose rewritten |
| 4377 | matthew 7:13 → 1-enoch | REWORDED | 94:1 → 94:1 | re-quoted in place, prose rewritten |
| 4378 | matthew 7:14 → 1-enoch | REWORDED | 94:2 → 94:2 | re-quoted in place, prose rewritten |
| 4386 | matthew 8:11 → 1-enoch | NOT_FOUND | 90:18 → 90:33 | moved + re-quoted, prose rewritten |
| 4391 | matthew 8:20 → 1-enoch | REWORDED | 46:2 → 46:2 | re-quoted in place, prose rewritten |
| 4395 | matthew 8:28 → 1-enoch | RE_ANCHOR | 15:9 → 15:11 | moved + re-quoted, prose rewritten |
| 121870 | matthew 8:29 → 1-enoch | RE_ANCHOR | 15:8 → 15:10 | moved + re-quoted |
| 121871 | matthew 8:29 → 1-enoch | RE_ANCHOR | 15:9 → 15:11 | moved + re-quoted |
| 121872 | matthew 8:29 → 1-enoch | RE_ANCHOR | 15:11 → 16:1 | moved + re-quoted |
| 4424 | matthew 9:36 → 1-enoch | NOT_FOUND | 90:16 → 90:25 | moved + re-quoted, prose rewritten |
| 4425 | matthew 9:36 → 1-enoch | NOT_FOUND | 90:17 → 90:29 | moved + re-quoted, prose rewritten |
| 4426 | matthew 9:36 → 1-enoch | NOT_FOUND | 90:18 → 90:33 | moved + re-quoted, prose rewritten |
| 4411 | matthew 9:6 → 1-enoch | RE_ANCHOR_REWORDED | 62:7 → 71:14 | moved + re-quoted, prose rewritten |
| 139484 | micah 1:3 → 1-enoch | REWORDED | 1:4 → 1:4 | re-quoted in place |
| 52064 | philippians 4:3 → 1-enoch | REWORDED | 108:3 → 108:3 | re-quoted in place |
| 52065 | philippians 4:3 → 1-enoch | NOT_FOUND | 104:2 → 104:1 | moved + re-quoted, prose rewritten |
| 57163 | psalms 110:1 → 1-enoch | REWORDED | 61:8 → 61:8 | re-quoted in place |
| 57164 | psalms 110:1 → 1-enoch | RE_ANCHOR_REWORDED | 62:7 → 71:14 | moved + re-quoted |
| 103259 | psalms 121:6 → 1-enoch | REWORDED | 41:5 → 41:5 | re-quoted in place |
| 114987 | psalms 150:6 → 1-enoch | REWORDED | 61:11 → 61:11 | re-quoted in place |
| 114988 | psalms 150:6 → 1-enoch | RE_ANCHOR | 39:12 → 40:3 | moved + re-quoted |
| 56652 | psalms 2:1 → 1-enoch | RE_ANCHOR_REWORDED | 48:8 → 63:1 | moved + re-quoted, prose rewritten |
| 56650 | psalms 2:8 → 1-enoch | RE_ANCHOR_REWORDED | 62:1 → 61:8 | moved + re-quoted, prose rewritten |
| 56651 | psalms 2:8 → 1-enoch | RE_ANCHOR | 62:9 → 46:4 | moved + re-quoted |
| 77220 | psalms 68:17 → 1-enoch | REWORDED | 1:9 → 1:9 | re-quoted in place, prose rewritten |
| 57408 | psalms 72:11 → 1-enoch | RE_ANCHOR | 62:10 → 46:5 | moved + re-quoted |
| 57409 | psalms 72:11 → 1-enoch | RE_ANCHOR | 62:9 → 46:4 | moved + re-quoted |
| 57410 | psalms 72:11 → 1-enoch | RE_ANCHOR_REWORDED | 62:6 → 61:8 | moved + re-quoted, prose rewritten |
| 80341 | psalms 76:8 → 1-enoch | REWORDED | 1:9 → 1:9 | re-quoted in place |
| 90046 | psalms 93:1 → 1-enoch | RE_ANCHOR_REWORDED | 62:1 → 61:8 | moved + re-quoted, prose rewritten |
| 13414 | revelation 10:7 → 1-enoch | REWORDED | 81:1 → 81:1 | re-quoted in place, prose rewritten |
| 13415 | revelation 10:7 → 1-enoch | REWORDED | 81:2 → 81:2 | re-quoted in place, prose rewritten |
| 13433 | revelation 11:1 → 1-enoch | NOT_FOUND | 90:17 → 90:29 | moved + re-quoted |
| 13770 | revelation 12:7 → 1-enoch | REWORDED | 20:5 → 20:5 | re-quoted in place |
| 13805 | revelation 13:15 → 1-enoch | NOT_FOUND | 90:14 → 90:18 | moved + re-quoted, prose rewritten |
| 13799 | revelation 13:8 → 1-enoch | NOT_FOUND | 90:12 → 90:20 | moved + re-quoted, prose rewritten |
| 15091 | revelation 13:8 → 1-enoch | REWORDED | 108:3 → 108:3 | re-quoted in place, prose rewritten |
| 13836 | revelation 14:14 → 1-enoch | RE_ANCHOR_REWORDED | 62:7 → 71:14 | moved + re-quoted, prose rewritten |
| 12820 | revelation 1:13 → 1-enoch | RE_ANCHOR_REWORDED | 14:15 → 14:18 | moved + re-quoted, prose rewritten |
| 12822 | revelation 1:18 → 1-enoch | RE_ANCHOR_REWORDED | 62:7 → 71:14 | moved + re-quoted, prose rewritten |
| 14898 | revelation 20:12 → 1-enoch | NOT_FOUND | 90:12 → 90:20 | moved + re-quoted, prose rewritten |
| 15167 | revelation 20:3 → 1-enoch | RE_ANCHOR | 18:14 → 18:16 | moved + re-quoted, prose rewritten |
| 14941 | revelation 22:2 → 1-enoch | REWORDED | 25:5 → 25:5 | re-quoted in place, prose rewritten |
| 12826 | revelation 2:7 → 1-enoch | REWORDED | 25:5 → 25:5 | re-quoted in place, prose rewritten |
| 12850 | revelation 3:5 → 1-enoch | NOT_FOUND | 104:1 → 104:1 | re-quoted in place, prose rewritten |
| 12851 | revelation 3:5 → 1-enoch | REWORDED | 108:3 → 108:3 | re-quoted in place |
| 12956 | revelation 4:10 → 1-enoch | NOT_FOUND | 40:1 → 40:1 | re-quoted in place, prose rewritten |
| 15001 | revelation 4:10 → 1-enoch | REWORDED | 60:1 → 60:1 | re-quoted in place |
| 15006 | revelation 4:2 → 1-enoch | RE_ANCHOR | 14:18 → 18:12 | moved + re-quoted |
| 12942 | revelation 4:3 → 1-enoch | RE_ANCHOR_REWORDED | 14:15 → 14:18 | moved + re-quoted, prose rewritten |
| 15004 | revelation 4:6 → 1-enoch | REWORDED | 71:5 → 71:5 | re-quoted in place |
| 12952 | revelation 4:8 → 1-enoch | RE_ANCHOR | 39:12 → 40:3 | moved + re-quoted |
| 12953 | revelation 4:8 → 1-enoch | RE_ANCHOR_REWORDED | 39:13 → 40:4 | moved + re-quoted, prose rewritten |
| 15003 | revelation 4:8 → 1-enoch | NOT_FOUND | 39:11 → 40:2 | moved + re-quoted, prose rewritten |
| 15005 | revelation 4:9 → 1-enoch | NOT_FOUND | 71:8 → 71:8 | re-quoted in place, prose rewritten |
| 12979 | revelation 5:11 → 1-enoch | NOT_FOUND | 40:1 → 40:1 | re-quoted in place, prose rewritten |
| 12980 | revelation 5:11 → 1-enoch | RE_ANCHOR | 14:21 → 18:16 | moved + re-quoted |
| 15015 | revelation 5:12 → 1-enoch | RE_ANCHOR_REWORDED | 62:6 → 61:8 | moved + re-quoted, prose rewritten |
| 15014 | revelation 5:13 → 1-enoch | RE_ANCHOR | 62:9 → 46:4 | moved + re-quoted |
| 13160 | revelation 8:4 → 1-enoch | REWORDED | 99:3 → 99:3 | re-quoted in place |
| 13370 | revelation 9:1 → 1-enoch | RE_ANCHOR | 18:12 → 18:14 | moved + re-quoted, prose rewritten |
| 13371 | revelation 9:1 → 1-enoch | RE_ANCHOR | 18:14 → 18:16 | moved + re-quoted |
| 15033 | revelation 9:1 → 1-enoch | RE_ANCHOR | 18:11 → 18:12 | moved + re-quoted |
| 15034 | revelation 9:1 → 1-enoch | RE_ANCHOR | 18:13 → 18:15 | moved + re-quoted |
| 15036 | revelation 9:1 → 1-enoch | RE_ANCHOR | 21:5 → 21:6 | moved + re-quoted, prose rewritten |
| 13372 | revelation 9:2 → 1-enoch | RE_ANCHOR_REWORDED | 21:8 → 21:7 | moved + re-quoted, prose rewritten |
| 15035 | revelation 9:2 → 1-enoch | RE_ANCHOR | 18:15 → 18:11 | moved + re-quoted, prose rewritten |
| 15057 | revelation 9:20 → 1-enoch | REWORDED | 99:7 → 99:7 | re-quoted in place |
| 59997 | testaments-xii 26:5 → 1-enoch | NOT_FOUND | 90:17 → 90:29 | moved + re-quoted |
| 60223 | testaments-xii 89:1 → 1-enoch | RE_ANCHOR_REWORDED | 91:1 → 93:8 | moved + re-quoted |
| 39145 | the-wisdom-of-solomon 3:1 → 1-enoch | RE_ANCHOR_REWORDED | 103:4 → 103:4 | re-quoted in place |
| 39175 | the-wisdom-of-solomon 5:3 → 1-enoch | RE_ANCHOR | 62:9 → 46:4 | moved + re-quoted |
| 39174 | the-wisdom-of-solomon 5:4 → 1-enoch | RE_ANCHOR_REWORDED | 63:8 → 62:5 | moved + re-quoted |
| 120843 | zechariah 12:10 → 1-enoch | RE_ANCHOR | 62:9 → 46:4 | moved + re-quoted |
| 120873 | zechariah 14:5 → 1-enoch | REWORDED | 1:9 → 1:9 | re-quoted in place |
