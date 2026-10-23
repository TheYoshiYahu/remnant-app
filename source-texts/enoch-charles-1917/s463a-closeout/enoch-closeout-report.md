# 1 Enoch close-out — S463a (2026-10-22) — verification table, read by content

Two jobs, one migration (`data-schema/migrations/session463a_enoch_closeout.sql`), scratch-tested twice against a Postgres seeded
from the Oct 19 read-back (`enoch-cards-live.json`, post-S459): run 1 = 141 notes rewritten in place,
349 moved + rewritten, 410 member notes, 61 retired (62 member rows), 0 skipped, 0 absent; run 2 = 0 changed,
490 already landed. Post-run read-back by content: every card (490) and member note (410) as written, 0 duplicate pairs,
0 Enoch cards left with degraded markers, 2253 Enoch cards after. Nothing deployed — the deploy is Yoshi's paste:

    bash ~/Desktop/App/_session463a_enoch_closeout_deploy.sh

Two independent cold reads of the fix were run before it was written to the Desktop (see "Verification" at the end): the first
found 41 cards pointed at the wrong verse and ~25 prose/address mismatches, the second found 5 more; all corrected and
re-tested. The counts above are from the final run.

## Job 1 — the 63 STAND cards whose prose was degraded (markers: wisdom-stream, the framework reads, Red Line #, apparatus, substance, FRAMEWORK-MAJOR, locked)

Each card kept its verse. The note was rebuilt: the full live 1 Enoch verse (or the two verses the old note spanned) in
stand-alone italics with the citation in parentheses, then hand-written prose — the verse carries, the prose points. Every
canon italic in the prose was checked verbatim against `parsed/canon.json`; every Enoch italic against the live text, and the
migration RAISES if a live verse is not inside its note verbatim. 65 member notes on these cards were rewritten the same way
(`prose463.py` holds every one).

| card | source → 1 Enoch | verses quoted |
|---|---|---|
| 4255 | matthew 1:21 → 48:2 | 48:2 |
| 4257 | matthew 1:23 → 48:6 | 48:6 |
| 4390 | matthew 8:20 → 46:1 | 46:1 |
| 4392 | matthew 8:20 → 46:3 | 46:3 |
| 4409 | matthew 9:6 → 48:2 | 48:2 |
| 4455 | matthew 10:35 → 99:5 | 99:5 |
| 4456 | matthew 10:36 → 100:1 | 100:1–2 |
| 4481 | matthew 11:27 → 46:1 | 46:1 |
| 4482 | matthew 11:27 → 46:3 | 46:3 |
| 4483 | matthew 11:27 → 48:6 | 48:6 |
| 4484 | matthew 11:25 → 48:7 | 48:7 |
| 4502 | matthew 12:18 → 49:1 | 49:1–2 |
| 4503 | matthew 12:18 → 49:3 | 49:3 |
| 4508 | matthew 12:29 → 10:4 | 10:4–5 |
| 4509 | matthew 12:29 → 54:5 | 54:5 |
| 4518 | matthew 12:40 → 51:1 | 51:1 |
| 4535 | matthew 13:25 → 6:1 | 6:1–2 |
| 4537 | matthew 13:38 → 15:8 | 15:8–9 |
| 4542 | matthew 13:43 → 104:2 | 104:2 |
| 4544 | matthew 13:35 → 48:6 | 48:6 |
| 4554 | matthew 13:49 → 100:5 | 100:5 |
| 4599 | matthew 16:16 → 48:2 | 48:2 |
| 4600 | matthew 16:17 → 48:3 | 48:3 |
| 4613 | matthew 16:18 → 51:1 | 51:1 |
| 4678 | matthew 18:7 → 10:8 | 10:8 |
| 4679 | matthew 18:7 → 19:1 | 19:1 |
| 4681 | matthew 18:9 → 27:2 | 27:2 |
| 4684 | matthew 18:14 → 90:6 | 90:6 |
| 4714 | matthew 19:25 → 98:10 | 98:10 |
| 4727 | matthew 20:16 → 48:1 | 48:1 |
| 4734 | matthew 20:28 → 46:3 | 46:3 |
| 4735 | matthew 20:28 → 48:2 | 48:2 |
| 4780 | matthew 22:42 → 46:3 | 46:3 |
| 4781 | matthew 22:43 → 48:2 | 48:2 |
| 4791 | matthew 23:15 → 99:2 | 99:2 |
| 4806 | matthew 24:37 → 10:2 | 10:2 |
| 4811 | matthew 24:27 → 57:1 | 57:1 |
| 4812 | matthew 24:31 → 57:2 | 57:2 |
| 4813 | matthew 24:31 → 61:5 | 61:5 |
| 4851 | matthew 26:64 → 46:4 | 46:4 |
| 4852 | matthew 26:64 → 48:3 | 48:3 |
| 4898 | matthew 28:18 → 51:1 | 51:1 |
| 4899 | matthew 28:18 → 51:2 | 51:2 |
| 7878 | mark 14:62 → 46:3 | 46:3 |
| 7917 | luke 11:22 → 10:4 | 10:4 |
| 7943 | luke 17:27 → 10:3 | 10:3 |
| 7944 | luke 17:26 → 10:2 | 10:2 |
| 7993 | john 8:58 → 48:3 | 48:3 |
| 15033 | revelation 9:1 → 18:12 | 18:12 |
| 25558 | 1-enoch 108:3 → 48:3 | 48:3 |
| 25627 | jubilees 4:15 → 6:6 | 6:6 |
| 25629 | jubilees 4:23 → 13:8 | 13:8 |
| 25648 | jubilees 5:2 → 7:3 | 7:3–4 |
| 25653 | jubilees 5:5 → 10:3 | 10:3 |
| 25656 | jubilees 5:9 → 10:9 | 10:9 |
| 25900 | jubilees 9:15 → 10:6 | 10:6 |
| 25928 | jubilees 10:1 → 15:8 | 15:8 |
| 25953 | jubilees 12:17 → 19:1 | 19:1 |
| 26002 | jubilees 15:31 → 99:7 | 99:7 |
| 26034 | jubilees 16:9 → 10:13 | 10:13 |
| 29171 | jasher 5:25 → 10:2 | 10:2 |
| 60445 | 2-peter 2:4 → 10:4 | 10:4 |
| 141653 | job 4:18 → 15:3 | 15:3 |

## Job 2 — the glosses on verses the S449 rebuild changed (492 cards read; the handoff's "641")

Method, general to specific. First the map: for every card whose Enoch verse the rebuild changed (`different` / `reworded` /
`new` in `enoch-verse-status.json`), the OLD text at the card's address (`parsed/enoch.json.pre-s449`) was located in the live
Charles 1917 text. In most cases the old text was a real Charles verse sitting under the wrong number — so the gloss, written
against that text, still fits, and the card is re-pointed to the verse the words actually live on. But not always: some glosses
had been written against the *right* verse already sitting at that number (the authoring text, not the corrupt text), and those
stay where they are — this is what the cold reads caught. Where the old text was invented (no live match), or the gloss cited
words the live verse no longer carries, the gloss was read by hand against the live verse and re-worded, moved to the verse that
carries its thought, or put to Yoshi. Every 1 Enoch address cited inside a note was checked to exist in the live book.

Counts: 349 re-pointed (ids kept — the card's 1 Enoch end moves whether it is source or target; 1 more lands on the
same number after the old text was traced), 55 re-worded in place, 22 left standing with a stale verse number or quote patched
(any gloss untouched by this fix still describes its live verse), 61 retired (once re-pointed, a card already carried the
same pairing on the true verse — see the list), 4 questions for Yoshi. 345 member notes ride along (same text as their card).

### Retired — duplicates after re-pointing (strike any you want kept; the migration lists them by id)

Every retirement has a surviving twin on the identical pairing: 56 twins already stand on the true verse in the live
read-back and are not moved by this fix; 5 twins are cards this fix moves there (marked *twin moves*) — those
retirements stand only because the twin's move lands, which the migration does first (the DELETE runs before the loop, and
the twin's move is guarded by the same dup check, so a twin that failed to land would leave the pairing empty: read the
summary line for "skipped 0").

| card | pairing | was at | would have landed on | survives as |
|---|---|---|---|---|
| 16351 | jubilees 7:21 | 16:2 | 15:4 | card 16335 at 1 Enoch 15:4 |
| 17246 | job 38:22 | 34:1 | 34:2 | card 17259 at 1 Enoch 34:2 |
| 17248 | jeremiah 10:13 | 34:1 | 34:2 | card 17260 at 1 Enoch 34:2 |
| 17249 | psalms 135:7 | 34:1 | 34:2 | card 17261 at 1 Enoch 34:2 |
| 17954 | matthew 25:31 | 39:5 | 55:4 | card 19888 at 1 Enoch 55:4 |
| 17955 | daniel 7:13 | 39:5 | 55:4 | card 19887 at 1 Enoch 55:4 |
| 17947 | psalms 114:4 | 39:8 | 51:4 | card 18002 at 1 Enoch 51:4 |
| 17948 | matthew 13:43 | 39:9 | 58:3 | card 19934 at 1 Enoch 58:3 |
| 17949 | daniel 12:3 | 39:9 | 58:3 | card 19935 at 1 Enoch 58:3 |
| 18026 | jeremiah 33:25 | 43:3 | 41:5 | card 18046 at 1 Enoch 41:5 |
| 18027 | jeremiah 31:35 | 43:3 | 41:5 | card 17989 at 1 Enoch 41:5 |
| 21339 | 2-peter 2:4 | 67:1 | 10:13 | card 16250 at 1 Enoch 10:13 |
| 22538 | genesis 3:7 | 77:7 | 32:6 | card 17219 at 1 Enoch 32:6 |
| 22560 | deuteronomy 4:19 | 79:4 | 74:12 | card 22501 at 1 Enoch 74:12 *twin moves* |
| 25340 | the-wisdom-of-solomon 5:8 | 94:5 | 100:6 | card 25444 at 1 Enoch 100:6 |
| 16062 | deuteronomy 18:10 | 8:2 | 8:3 | card 21346 at 1 Enoch 8:3 |
| 16319 | jude 1:13 | 14:19 | 18:14 | card 16667 at 1 Enoch 18:14 |
| 16321 | isaiah 24:21 | 14:19 | 18:14 | card 16665 at 1 Enoch 18:14 |
| 17267 | job 38:4 | 36:4 | 18:2 | card 16694 at 1 Enoch 18:2 |
| 21330 | revelation 20:12 | 67:4 | 47:3 | card 18972 at 1 Enoch 47:3 |
| 21331 | daniel 7:10 | 67:4 | 47:3 | card 18973 at 1 Enoch 47:3 |
| 21332 | daniel 7:9 | 67:4 | 47:3 | card 18974 at 1 Enoch 47:3 |
| 21349 | 2-peter 2:4 | 68:1 | 6:6 | card 16033 at 1 Enoch 6:6 |
| 21350 | jude 1:6 | 68:1 | 6:6 | card 16034 at 1 Enoch 6:6 |
| 21351 | genesis 6:4 | 68:1 | 6:6 | card 16030 at 1 Enoch 6:6 |
| 25333 | amos 6:6 | 94:6 | 96:5 | card 25467 at 1 Enoch 96:5 |
| 25398 | isaiah 5:22 | 97:6 | 96:5 | card 25334 at 1 Enoch 96:5 |
| 16015 | jude 1:14 | 5:8 | 1:9 | card 15970 at 1 Enoch 1:9 |
| 16014 | jude 1:15 | 5:8 | 1:9 | card 15969 at 1 Enoch 1:9 |
| 16019 | isaiah 60:1 | 5:7 | 1:8 | card 17912 at 1 Enoch 1:8 |
| 16277 | jude 1:6 | 11:2 | 10:12 | card 16249 at 1 Enoch 10:12 |
| 16315 | genesis 1:14 | 14:20 | 18:15 | card 22535 at 1 Enoch 18:15 |
| 16317 | 2-peter 2:4 | 14:21 | 18:16 | card 16666 at 1 Enoch 18:16 |
| 16328 | ezekiel 1:26 | 14:15 | 18:8 | card 16670 at 1 Enoch 18:8 |
| 16684 | jude 1:6 | 18:14 | 18:16 | card 16318 at 1 Enoch 18:16 *twin moves* |
| 16685 | 2-peter 2:4 | 18:14 | 18:16 | card 16666 at 1 Enoch 18:16 |
| 16688 | jude 1:13 | 18:13 | 18:15 | card 22532 at 1 Enoch 18:15 |
| 16735 | jude 1:13 | 21:6 | 18:15 | card 22532 at 1 Enoch 18:15 |
| 16738 | isaiah 24:21 | 21:5 | 18:14 | card 16665 at 1 Enoch 18:14 |
| 16749 | jude 1:6 | 22:7 | 21:10 | card 16733 at 1 Enoch 21:10 |
| 16750 | 2-peter 2:4 | 22:7 | 21:10 | card 16732 at 1 Enoch 21:10 |
| 17137 | matthew 12:43 | 15:11 | 16:1 | card 16347 at 1 Enoch 16:1 |
| 17139 | genesis 6:4 | 25:3 | 15:3 | card 16337 at 1 Enoch 15:3 |
| 17140 | genesis 6:2 | 25:3 | 15:3 | card 16338 at 1 Enoch 15:3 |
| 17141 | 2-peter 2:4 | 25:2 | 15:2 | card 16340 at 1 Enoch 15:2 |
| 17142 | jude 1:6 | 25:2 | 15:2 | card 16341 at 1 Enoch 15:2 |
| 17919 | micah 1:3 | 37:5 | 1:3 | card 15976 at 1 Enoch 1:3 |
| 19949 | psalms 135:7 | 60:13 | 41:3 | card 17993 at 1 Enoch 41:3 |
| 19951 | job 38:22 | 60:14 | 41:4 | card 17994 at 1 Enoch 41:4 |
| 19984 | revelation 6:15 | 62:12 | 46:6 | card 18950 at 1 Enoch 46:6 |
| 21334 | revelation 20:13 | 67:3 | 51:1 | card 19043 at 1 Enoch 51:1 |
| 21335 | john 5:28 | 67:3 | 51:1 | card 18943 at 1 Enoch 51:1 |
| 21336 | daniel 12:2 | 67:3 | 51:1 | card 19041 at 1 Enoch 51:1 |
| 21338 | matthew 13:42 | 67:2 | 54:6 | card 17930 at 1 Enoch 54:6 *twin moves* |
| 21387 | daniel 7:9 | 70:2 | 71:2 | card 21406 at 1 Enoch 71:2 |
| 23827 | hebrews 4:13 | 84:3 | 9:5 | card 16232 at 1 Enoch 9:5 |
| 23831 | genesis 6:2 | 84:6 | 9:8 | card 16226 at 1 Enoch 9:8 |
| 23836 | jubilees 5:1 | 84:6 | 9:8 | card 16225 at 1 Enoch 9:8 |
| 25380 | luke 12:20 | 96:5 | 97:8 | card 25342 at 1 Enoch 97:8 *twin moves* |
| 25503 | james 5:1 | 96:5 | 97:8 | card 25485 at 1 Enoch 97:8 *twin moves* |
| 25557 | deuteronomy 32:10 | 108:9 | 100:5 | card 25452 at 1 Enoch 100:5 |

### Questions for Yoshi (left unchanged in the migration)

- **25364** (1-enoch 95:6 → amos 6:6, at 95:6): duplicate: Amos 6:6 already lands on 96:5 (card 25333); the old verse at 95:6 was 96:5's text under the wrong number. Retire, or point it somewhere else?
  - note: Amos 6:6 — *That drink wine in bowls, and anoint themselves with the chief ointments: but they are not grieved for the affliction of Joseph.* — Amos's woe on those who drink wine in bowls is verbatim Enoch's woe on those who drink wine in large bowls and tread upon the poor in 95:6.

- **25399** (1-enoch 97:6 → amos 6:6, at 97:6): duplicate: Amos 6:6 already lands on 96:5 (card 25333); the old verse at 97:6 was 96:5's text. Retire, or point it somewhere else?
  - note: Amos 6:6 — *That drink wine in bowls, and anoint themselves with the chief ointments: but they are not grieved for the affliction of Joseph.* Amos names the same wine-in-bowls feasting that Enoch 97:6 condemns, indifferent to the poor it treads down.

- **25466** (1-enoch 97:8 → james 5:4, at 97:8): duplicate: James 5:4 already sits on 97:9 (card 25362); the old verse at 97:8 was 97:9's text. Retire?
  - note: James 5:4 — *Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth.* The many husbandmen and labourers in the rich man's houses (Enoch 102:14-16) cr…

- **25486** (1-enoch 103:14 → isaiah 5:8, at 103:14): duplicate: Isaiah 5:8 already lands on 96:5 (card 25469) and 94:7 (card 25335); the old verse at 103:14 was 96:5's text. Retire?
  - note: Isaiah 5:8 — *Woe unto them that join house to house, that lay field to field, till there be no place, that they may be placed alone in the midst of the earth!* Isaiah's woe on land-grabbing greed matches Enoch's woe on those who acquire gold and silver in unrighteousness (103:14-15).

### Every moved / re-worded / patched card

| card | side | source ↔ target | old addr → new addr | action |
|---|---|---|---|---|
| 21342 | Enoch is source | 1-enoch 8:4 ↔ isaiah 24:22 | 8:4 → 10:12 | moved |
| 16297 | Enoch is source | 1-enoch 13:10 ↔ jubilees 5:10 | 13:10 → 13:7 | moved |
| 16326 | Enoch is source | 1-enoch 14:16 ↔ daniel 7:10 | 14:16 → 14:19 | moved |
| 16327 | Enoch is source | 1-enoch 14:16 ↔ daniel 7:9 | 14:16 → 14:18 | moved |
| 16352 | Enoch is source | 1-enoch 16:2 ↔ jude 1:6 | 16:2 → 15:4 | moved |
| 16353 | Enoch is source | 1-enoch 16:2 ↔ genesis 6:4 | 16:2 → 15:4 | moved |
| 16354 | Enoch is source | 1-enoch 16:2 ↔ genesis 6:2 | 16:2 → 15:4 | moved |
| 16675 | Enoch is source | 1-enoch 17:8 ↔ psalms 104:2 | 17:8 → 18:1 | moved |
| 16743 | Enoch is source | 1-enoch 22:12 ↔ revelation 6:10 | 22:12 → 22:5 | moved |
| 16744 | Enoch is source | 1-enoch 22:12 ↔ hebrews 12:24 | 22:12 → 22:7 | moved |
| 17149 | Enoch is source | 1-enoch 26:4 ↔ ezekiel 47:12 | 26:4 → 30:3 | moved |
| 17200 | Enoch is source | 1-enoch 30:1 ↔ exodus 30:23 | 30:1 → 30:3 | moved |
| 17201 | Enoch is source | 1-enoch 30:2 ↔ song-of-solomon 4:14 | 30:2 → 31:2 | moved |
| 17208 | Enoch is source | 1-enoch 31:1 ↔ song-of-solomon 3:6 | 31:1 → 29:2 | moved |
| 17209 | Enoch is source | 1-enoch 31:1 ↔ exodus 30:34 | 31:1 → 31:1 | same number after trace, note patched |
| 17247 | Enoch is source | 1-enoch 34:1 ↔ job 37:9 | 34:1 → 34:2 | moved |
| 17259 | Enoch is source | 1-enoch 34:2 ↔ job 38:22 | 34:2 → 34:2 | re-worded in place |
| 17261 | Enoch is source | 1-enoch 34:2 ↔ psalms 135:7 | 34:2 → 34:2 | re-worded in place |
| 17272 | Enoch is source | 1-enoch 36:3 ↔ revelation 7:1 | 36:3 → 76:1 | moved |
| 17922 | Enoch is source | 1-enoch 37:4 ↔ 1-corinthians 2:7 | 37:4 → 1:2 | moved |
| 17924 | Enoch is source | 1-enoch 37:4 ↔ deuteronomy 29:29 | 37:4 → 1:2 | moved |
| 17925 | Enoch is source | 1-enoch 37:4 ↔ matthew 13:35 | 37:4 → 1:2 | moved |
| 17940 | Enoch is source | 1-enoch 38:1 ↔ the-wisdom-of-solomon 3:7 | 38:1 → 38:1 | re-worded in place |
| 17934 | Enoch is source | 1-enoch 38:2 ↔ isaiah 26:2 | 38:2 → 50:2 | moved |
| 17927 | Enoch is source | 1-enoch 38:3 ↔ revelation 20:12 | 38:3 → 38:3 | re-worded in place |
| 17928 | Enoch is source | 1-enoch 38:3 ↔ revelation 20:11 | 38:3 → 38:3 | re-worded in place |
| 17935 | Enoch is source | 1-enoch 38:3 ↔ isaiah 53:11 | 38:3 → 38:2 | moved |
| 17981 | Enoch is source | 1-enoch 38:3 ↔ matthew 10:26 | 38:3 → 38:3 | re-worded in place |
| 17930 | Enoch is source | 1-enoch 38:6 ↔ matthew 13:42 | 38:6 → 54:6 | moved |
| 17931 | Enoch is source | 1-enoch 38:6 ↔ revelation 6:17 | 38:6 → 62:10 | moved |
| 17932 | Enoch is source | 1-enoch 38:6 ↔ revelation 6:15 | 38:6 → 48:8 | moved |
| 17959 | Enoch is source | 1-enoch 39:3 ↔ john 14:2 | 39:3 → 39:8 | moved |
| 17956 | Enoch is source | 1-enoch 39:5 ↔ isaiah 42:1 | 39:5 → 45:3 | moved |
| 17957 | Enoch is source | 1-enoch 39:6 ↔ revelation 21:3 | 39:6 → 39:6 | re-worded in place |
| 17946 | Enoch is source | 1-enoch 39:11 ↔ revelation 4:8 | 39:11 → 40:2 | moved |
| 17986 | Enoch is source | 1-enoch 41:8 ↔ hebrews 7:25 | 41:8 → 41:8 | re-worded in place |
| 17987 | Enoch is source | 1-enoch 41:8 ↔ 1-timothy 2:5 | 41:8 → 41:8 | re-worded in place |
| 18041 | Enoch is source | 1-enoch 41:8 ↔ genesis 1:18 | 41:8 → 41:8 | re-worded in place |
| 18042 | Enoch is source | 1-enoch 41:8 ↔ genesis 1:4 | 41:8 → 41:8 | re-worded in place |
| 17985 | Enoch is source | 1-enoch 41:9 ↔ revelation 20:12 | 41:9 → 41:9 | re-worded in place |
| 18935 | Enoch is source | 1-enoch 45:5 ↔ malachi 4:1 | 45:5 → 48:9 | moved |
| 18936 | Enoch is source | 1-enoch 45:5 ↔ the-wisdom-of-solomon 3:7 | 45:5 → 48:9 | moved |
| 18933 | Enoch is source | 1-enoch 45:6 ↔ matthew 13:42 | 45:6 → 98:3 | moved |
| 18934 | Enoch is source | 1-enoch 45:6 ↔ matthew 13:43 | 45:6 → 45:6 | re-worded in place |
| 19849 | Enoch is source | 1-enoch 52:3 ↔ daniel 7:14 | 52:3 → 52:6 | moved |
| 19850 | Enoch is source | 1-enoch 52:3 ↔ daniel 7:13 | 52:3 → 52:6 | moved |
| 19851 | Enoch is source | 1-enoch 52:3 ↔ daniel 2:45 | 52:3 → 52:6 | moved |
| 19852 | Enoch is source | 1-enoch 52:3 ↔ daniel 2:34 | 52:3 → 52:6 | moved |
| 19853 | Enoch is source | 1-enoch 52:3 ↔ isaiah 11:4 | 52:3 → 52:6 | moved |
| 19854 | Enoch is source | 1-enoch 52:3 ↔ zechariah 4:7 | 52:3 → 52:6 | moved |
| 19855 | Enoch is source | 1-enoch 52:3 ↔ zechariah 4:6 | 52:3 → 52:6 | moved |
| 19856 | Enoch is source | 1-enoch 52:3 ↔ psalms 97:5 | 52:3 → 52:6 | moved |
| 19857 | Enoch is source | 1-enoch 52:3 ↔ micah 1:4 | 52:3 → 52:6 | moved |
| 19858 | Enoch is source | 1-enoch 52:3 ↔ daniel 2:44 | 52:3 → 52:6 | moved |
| 19870 | Enoch is source | 1-enoch 53:2 ↔ isaiah 66:24 | 53:2 → 53:1 | moved |
| 19981 | Enoch is source | 1-enoch 62:11 ↔ isaiah 52:15 | 62:11 → 46:6 | moved |
| 19985 | Enoch is source | 1-enoch 62:11 ↔ philippians 2:10 | 62:11 → 46:6 | moved |
| 19986 | Enoch is source | 1-enoch 62:11 ↔ isaiah 45:23 | 62:11 → 46:6 | moved |
| 21318 | Enoch is source | 1-enoch 62:13 ↔ 2-peter 2:9 | 62:13 → 62:13 | re-worded in place |
| 18003 | Enoch is source | 1-enoch 62:14 ↔ revelation 21:3 | 62:14 → 62:14 | re-worded in place |
| 18004 | Enoch is source | 1-enoch 62:14 ↔ ecclesiasticus 24:8 | 62:14 → 62:14 | re-worded in place |
| 21278 | Enoch is source | 1-enoch 63:5 ↔ matthew 25:31 | 63:5 → 62:2 | moved |
| 21270 | Enoch is source | 1-enoch 63:6 ↔ the-wisdom-of-solomon 5:6 | 63:6 → 69:27 | moved |
| 21281 | Enoch is source | 1-enoch 63:6 ↔ daniel 7:14 | 63:6 → 69:27 | moved |
| 21273 | Enoch is source | 1-enoch 63:7 ↔ the-wisdom-of-solomon 5:8 | 63:7 → 63:7 | re-worded in place |
| 21275 | Enoch is source | 1-enoch 63:7 ↔ revelation 6:17 | 63:7 → 62:4 | moved |
| 21269 | Enoch is source | 1-enoch 63:9 ↔ psalms 2:12 | 63:9 → 63:9 | re-worded in place |
| 21311 | Enoch is source | 1-enoch 65:6 ↔ 2-peter 2:3 | 65:6 → 65:6 | re-worded in place |
| 21307 | Enoch is source | 1-enoch 65:9 ↔ jude 1:6 | 65:9 → 64:2 | moved |
| 21308 | Enoch is source | 1-enoch 65:9 ↔ genesis 6:12 | 65:9 → 64:2 | moved |
| 21305 | Enoch is source | 1-enoch 65:10 ↔ jubilees 5:1 | 65:10 → 15:12 | moved |
| 21306 | Enoch is source | 1-enoch 65:11 ↔ 2-peter 2:4 | 65:11 → 65:11 | re-worded in place |
| 21301 | Enoch is source | 1-enoch 65:12 ↔ genesis 8:21 | 65:12 → 10:20 | moved |
| 21302 | Enoch is source | 1-enoch 65:12 ↔ jubilees 5:11 | 65:12 → 10:20 | moved |
| 21325 | Enoch is source | 1-enoch 67:7 ↔ revelation 21:1 | 67:7 → 10:20 | moved |
| 21326 | Enoch is source | 1-enoch 67:7 ↔ 2-peter 3:13 | 67:7 → 10:20 | moved |
| 21327 | Enoch is source | 1-enoch 67:7 ↔ isaiah 65:17 | 67:7 → 10:20 | moved |
| 21340 | Enoch is source | 1-enoch 67:1 ↔ jude 1:6 | 67:1 → 10:13 | moved |
| 21394 | Enoch is source | 1-enoch 71:8 ↔ psalms 104:19 | 71:8 → 60:12 | moved |
| 21395 | Enoch is source | 1-enoch 71:8 ↔ jeremiah 10:13 | 71:8 → 60:12 | moved |
| 21396 | Enoch is source | 1-enoch 71:8 ↔ job 38:22 | 71:8 → 60:12 | moved |
| 22496 | Enoch is source | 1-enoch 73:3 ↔ psalms 89:37 | 73:3 → 78:8 | moved |
| 22495 | Enoch is source | 1-enoch 73:4 ↔ ecclesiasticus 43:6 | 73:4 → 78:8 | moved |
| 22497 | Enoch is source | 1-enoch 73:4 ↔ psalms 104:19 | 73:4 → 78:7 | moved |
| 22509 | Enoch is source | 1-enoch 74:1 ↔ psalms 19:1 | 74:1 → 74:2 | moved |
| 22511 | Enoch is source | 1-enoch 74:1 ↔ genesis 1:14 | 74:1 → 74:2 | moved |
| 22510 | Enoch is source | 1-enoch 74:3 ↔ psalms 104:19 | 74:3 → 74:3 | re-worded in place |
| 22507 | Enoch is source | 1-enoch 74:11 ↔ jubilees 6:36 | 74:11 → 74:11 | re-worded in place |
| 22501 | Enoch is source | 1-enoch 74:13 ↔ deuteronomy 4:19 | 74:13 → 74:12 | moved |
| 22502 | Enoch is source | 1-enoch 74:13 ↔ daniel 7:25 | 74:13 → 74:12 | moved |
| 22504 | Enoch is source | 1-enoch 74:13 ↔ jubilees 6:35 | 74:13 → 74:12 | moved |
| 22505 | Enoch is source | 1-enoch 74:13 ↔ leviticus 23:4 | 74:13 → 74:12 | moved |
| 22520 | Enoch is source | 1-enoch 75:4 ↔ 1-chronicles 27:1 | 75:4 → 75:1 | moved |
| 22521 | Enoch is source | 1-enoch 75:6 ↔ psalms 104:19 | 75:6 → 75:1 | moved |
| 22525 | Enoch is source | 1-enoch 76:9 ↔ job 37:9 | 76:9 → 76:5 | moved |
| 22539 | Enoch is source | 1-enoch 77:7 ↔ genesis 2:9 | 77:7 → 32:3 | moved |
| 22536 | Enoch is source | 1-enoch 77:8 ↔ ezekiel 47:12 | 77:8 → 32:4 | moved |
| 22537 | Enoch is source | 1-enoch 77:8 ↔ revelation 22:2 | 77:8 → 32:4 | moved |
| 22551 | Enoch is source | 1-enoch 78:3 ↔ psalms 148:5 | 78:3 → 78:1 | moved |
| 22548 | Enoch is source | 1-enoch 78:4 ↔ jubilees 6:32 | 78:4 → 74:12 | moved |
| 22543 | Enoch is source | 1-enoch 78:9 ↔ psalms 19:1 | 78:9 → 69:20 | moved |
| 22542 | Enoch is source | 1-enoch 78:11 ↔ daniel 7:25 | 78:11 → 69:20 | moved |
| 22544 | Enoch is source | 1-enoch 78:12 ↔ psalms 104:19 | 78:12 → 78:12 | re-worded in place |
| 22545 | Enoch is source | 1-enoch 78:12 ↔ genesis 1:14 | 78:12 → 78:12 | re-worded in place |
| 22565 | Enoch is source | 1-enoch 79:3 ↔ jeremiah 31:35 | 79:3 → 79:1 | moved |
| 22567 | Enoch is source | 1-enoch 79:3 ↔ genesis 1:14 | 79:3 → 79:1 | moved |
| 22562 | Enoch is source | 1-enoch 79:4 ↔ psalms 19:1 | 79:4 → 74:12 | moved |
| 22563 | Enoch is source | 1-enoch 79:4 ↔ psalms 148:3 | 79:4 → 74:12 | moved |
| 22564 | Enoch is source | 1-enoch 79:4 ↔ psalms 148:6 | 79:4 → 74:12 | moved |
| 22557 | Enoch is source | 1-enoch 79:5 ↔ jubilees 6:36 | 79:5 → 79:5 | re-worded in place |
| 22558 | Enoch is source | 1-enoch 79:5 ↔ jubilees 6:32 | 79:5 → 74:10 | moved |
| 22575 | Enoch is source | 1-enoch 80:1 ↔ romans 1:25 | 80:1 → 80:7 | moved |
| 22576 | Enoch is source | 1-enoch 80:1 ↔ jeremiah 8:2 | 80:1 → 80:7 | moved |
| 22577 | Enoch is source | 1-enoch 80:1 ↔ deuteronomy 4:19 | 80:1 → 80:6 | moved |
| 22588 | Enoch is source | 1-enoch 81:3 ↔ deuteronomy 6:7 | 81:3 → 81:6 | moved |
| 22586 | Enoch is source | 1-enoch 81:5 ↔ proverbs 3:3 | 81:5 → 82:1 | moved |
| 22587 | Enoch is source | 1-enoch 81:5 ↔ deuteronomy 6:6 | 81:5 → 82:1 | moved |
| 22582 | Enoch is source | 1-enoch 81:7 ↔ jubilees 6:37 | 81:7 → 80:6 | moved |
| 22583 | Enoch is source | 1-enoch 81:7 ↔ jubilees 6:34 | 81:7 → 82:5 | moved |
| 22584 | Enoch is source | 1-enoch 81:7 ↔ daniel 7:25 | 81:7 → 80:6 | moved |
| 22585 | Enoch is source | 1-enoch 81:7 ↔ genesis 1:14 | 81:7 → 80:2 | moved |
| 22578 | Enoch is source | 1-enoch 81:9 ↔ psalms 1:1 | 81:9 → 81:9 | re-worded in place |
| 22581 | Enoch is source | 1-enoch 81:10 ↔ leviticus 23:2 | 81:10 → 82:4 | moved |
| 22602 | Enoch is source | 1-enoch 82:3 ↔ jubilees 6:38 | 82:3 → 82:5 | moved |
| 22603 | Enoch is source | 1-enoch 82:3 ↔ deuteronomy 4:19 | 82:3 → 80:7 | moved |
| 22604 | Enoch is source | 1-enoch 82:3 ↔ psalms 104:19 | 82:3 → 82:5 | moved |
| 22605 | Enoch is source | 1-enoch 82:3 ↔ genesis 1:14 | 82:3 → 82:6 | moved |
| 22606 | Enoch is source | 1-enoch 82:3 ↔ daniel 7:25 | 82:3 → 80:7 | moved |
| 22599 | Enoch is source | 1-enoch 82:5 ↔ leviticus 23:4 | 82:5 → 82:4 | moved |
| 22600 | Enoch is source | 1-enoch 82:5 ↔ psalms 1:2 | 82:5 → 82:4 | moved |
| 22601 | Enoch is source | 1-enoch 82:5 ↔ psalms 1:1 | 82:5 → 82:4 | moved |
| 22596 | Enoch is source | 1-enoch 82:6 ↔ jubilees 6:32 | 82:6 → 82:6 | re-worded in place |
| 22597 | Enoch is source | 1-enoch 82:7 ↔ psalms 104:19 | 82:7 → 82:7 | re-worded in place |
| 22598 | Enoch is source | 1-enoch 82:7 ↔ genesis 1:14 | 82:7 → 82:7 | re-worded in place |
| 22593 | Enoch is source | 1-enoch 82:8 ↔ jubilees 6:17 | 82:8 → 82:11 | moved |
| 22595 | Enoch is source | 1-enoch 82:8 ↔ leviticus 23:2 | 82:8 → 82:11 | moved |
| 22594 | Enoch is source | 1-enoch 82:11 ↔ genesis 1:14 | 82:11 → 82:11 | re-worded in place |
| 23818 | Enoch is source | 1-enoch 83:5 ↔ genesis 7:11 | 83:5 → 83:4 | moved |
| 23820 | Enoch is source | 1-enoch 83:5 ↔ genesis 6:11 | 83:5 → 83:4 | moved |
| 23803 | Enoch is source | 1-enoch 83:6 ↔ 2-peter 3:11 | 83:6 → 83:7 | moved |
| 23806 | Enoch is source | 1-enoch 83:6 ↔ matthew 24:37 | 83:6 → 83:7 | moved |
| 23805 | Enoch is source | 1-enoch 83:7 ↔ matthew 24:39 | 83:7 → 83:7 | re-worded in place |
| 23817 | Enoch is source | 1-enoch 83:7 ↔ genesis 7:23 | 83:7 → 83:7 | re-worded in place |
| 23819 | Enoch is source | 1-enoch 83:7 ↔ genesis 6:13 | 83:7 → 83:7 | re-worded in place |
| 23804 | Enoch is source | 1-enoch 83:9 ↔ genesis 8:1 | 83:9 → 83:8 | moved |
| 23807 | Enoch is source | 1-enoch 83:9 ↔ amos 7:6 | 83:9 → 83:8 | moved |
| 23808 | Enoch is source | 1-enoch 83:9 ↔ amos 7:5 | 83:9 → 83:8 | moved |
| 23814 | Enoch is source | 1-enoch 83:10 ↔ revelation 6:14 | 83:10 → 83:4 | moved |
| 23815 | Enoch is source | 1-enoch 83:10 ↔ isaiah 34:4 | 83:10 → 83:4 | moved |
| 23900 | Enoch is source | 1-enoch 89:16 ↔ exodus 3:8 | 89:16 → 89:16 | re-worded in place |
| 23904 | Enoch is source | 1-enoch 89:16 ↔ exodus 19:4 | 89:16 → 89:16 | re-worded in place |
| 23901 | Enoch is source | 1-enoch 89:18 ↔ exodus 14:21 | 89:18 → 89:23 | moved |
| 23902 | Enoch is source | 1-enoch 89:19 ↔ exodus 14:28 | 89:19 → 89:26 | moved |
| 23903 | Enoch is source | 1-enoch 89:19 ↔ exodus 14:30 | 89:19 → 89:27 | moved |
| 23905 | Enoch is source | 1-enoch 89:23 ↔ exodus 19:18 | 89:23 → 89:30 | moved |
| 23907 | Enoch is source | 1-enoch 89:23 ↔ exodus 24:8 | 89:23 → 89:28 | moved |
| 23911 | Enoch is source | 1-enoch 89:34 ↔ ezekiel 34:5 | 89:34 → 89:55 | moved |
| 23909 | Enoch is source | 1-enoch 89:35 ↔ 2-kings 17:6 | 89:35 → 89:56 | moved |
| 23910 | Enoch is source | 1-enoch 89:35 ↔ 2-kings 17:23 | 89:35 → 89:58 | moved |
| 23912 | Enoch is source | 1-enoch 89:35 ↔ psalms 80:1 | 89:35 → 89:57 | moved |
| 23917 | Enoch is source | 1-enoch 89:41 ↔ daniel 7:10 | 89:41 → 90:20 | moved |
| 23918 | Enoch is source | 1-enoch 89:41 ↔ revelation 20:12 | 89:41 → 90:20 | moved |
| 23913 | Enoch is source | 1-enoch 89:45 ↔ ezekiel 34:2 | 89:45 → 90:25 | moved |
| 23914 | Enoch is source | 1-enoch 89:45 ↔ ezekiel 34:10 | 89:45 → 90:25 | moved |
| 23915 | Enoch is source | 1-enoch 89:45 ↔ jeremiah 23:1 | 89:45 → 90:25 | moved |
| 23916 | Enoch is source | 1-enoch 89:45 ↔ zechariah 11:17 | 89:45 → 90:25 | moved |
| 23933 | Enoch is source | 1-enoch 90:16 ↔ jeremiah 23:1 | 90:16 → 89:74 | moved |
| 23934 | Enoch is source | 1-enoch 90:16 ↔ jeremiah 23:2 | 90:16 → 89:74 | moved |
| 23935 | Enoch is source | 1-enoch 90:16 ↔ zechariah 11:17 | 90:16 → 89:74 | moved |
| 23919 | Enoch is source | 1-enoch 89:46 ↔ ezekiel 37:22 | 89:46 → 90:29 | moved |
| 23920 | Enoch is source | 1-enoch 89:46 ↔ isaiah 11:12 | 89:46 → 90:29 | moved |
| 23921 | Enoch is source | 1-enoch 89:46 ↔ revelation 21:2 | 89:46 → 90:29 | moved |
| 23939 | Enoch is source | 1-enoch 90:17 ↔ ezekiel 37:26 | 90:17 → 90:29 | moved |
| 23940 | Enoch is source | 1-enoch 90:17 ↔ micah 4:1 | 90:17 → 90:29 | moved |
| 23937 | Enoch is source | 1-enoch 90:17 ↔ revelation 21:2 | 90:17 → 90:36 | moved |
| 23925 | Enoch is source | 1-enoch 90:1 ↔ 1-maccabees 2:66 | 90:1 → 90:9 | moved |
| 23924 | Enoch is source | 1-enoch 90:3 ↔ 1-maccabees 2:1 | 90:3 → 90:10 | moved |
| 23926 | Enoch is source | 1-enoch 90:4 ↔ jeremiah 23:5 | 90:4 → 90:38 | moved |
| 23927 | Enoch is source | 1-enoch 90:7 ↔ ezekiel 34:23 | 90:7 → 90:9 | moved |
| 23929 | Enoch is source | 1-enoch 90:11 ↔ john 10:11 | 90:11 → 90:38 | moved |
| 23930 | Enoch is source | 1-enoch 90:12 ↔ daniel 7:9 | 90:12 → 90:20 | moved |
| 23931 | Enoch is source | 1-enoch 90:12 ↔ daniel 7:10 | 90:12 → 90:24 | moved |
| 23932 | Enoch is source | 1-enoch 90:12 ↔ revelation 20:12 | 90:12 → 90:26 | moved |
| 23936 | Enoch is source | 1-enoch 90:15 ↔ revelation 20:10 | 90:15 → 90:24 | moved |
| 23943 | Enoch is source | 1-enoch 90:18 ↔ ezekiel 37:21 | 90:18 → 90:33 | moved |
| 23938 | Enoch is source | 1-enoch 90:19 ↔ revelation 21:3 | 90:19 → 90:33 | moved |
| 25342 | Enoch is source | 1-enoch 94:4 ↔ luke 12:20 | 94:4 → 97:8 | moved |
| 25344 | Enoch is source | 1-enoch 94:5 ↔ psalms 49:7 | 94:5 → 100:6 | moved |
| 25365 | Enoch is source | 1-enoch 95:1 ↔ luke 6:24 | 95:1 → 99:1 | moved |
| 25366 | Enoch is source | 1-enoch 95:1 ↔ isaiah 5:21 | 95:1 → 99:1 | moved |
| 25367 | Enoch is source | 1-enoch 95:2 ↔ isaiah 5:20 | 95:2 → 99:2 | moved |
| 25368 | Enoch is source | 1-enoch 96:1 ↔ amos 5:11 | 96:1 → 96:5 | moved |
| 25370 | Enoch is source | 1-enoch 96:1 ↔ isaiah 3:14 | 96:1 → 96:5 | moved |
| 25373 | Enoch is source | 1-enoch 96:2 ↔ luke 6:24 | 96:2 → 96:8 | moved |
| 25375 | Enoch is source | 1-enoch 96:2 ↔ james 5:1 | 96:2 → 96:8 | moved |
| 25376 | Enoch is source | 1-enoch 96:2 ↔ james 5:3 | 96:2 → 96:8 | moved |
| 25374 | Enoch is source | 1-enoch 96:3 ↔ luke 6:25 | 96:3 → 96:5 | moved |
| 25377 | Enoch is source | 1-enoch 96:3 ↔ the-wisdom-of-solomon 5:8 | 96:3 → 96:5 | moved |
| 25378 | Enoch is source | 1-enoch 96:7 ↔ luke 12:18 | 96:7 → 97:9 | moved |
| 25382 | Enoch is source | 1-enoch 96:7 ↔ amos 8:6 | 96:7 → 97:9 | moved |
| 25383 | Enoch is source | 1-enoch 96:8 ↔ james 5:4 | 96:8 → 96:8 | re-worded in place |
| 25385 | Enoch is source | 1-enoch 96:8 ↔ ecclesiasticus 34:22 | 96:8 → 96:8 | re-worded in place |
| 25475 | Enoch is source | 1-enoch 102:1 ↔ daniel 12:1 | 102:1 → 102:1 | re-worded in place |
| 25477 | Enoch is source | 1-enoch 102:1 ↔ the-wisdom-of-solomon 3:2 | 102:1 → 102:6 | moved |
| 25473 | Enoch is source | 1-enoch 102:2 ↔ daniel 12:2 | 102:2 → 22:9 | moved |
| 25476 | Enoch is source | 1-enoch 102:3 ↔ the-wisdom-of-solomon 3:4 | 102:3 → 102:4 | moved |
| 25478 | Enoch is source | 1-enoch 102:3 ↔ the-wisdom-of-solomon 3:1 | 102:3 → 102:4 | moved |
| 25471 | Enoch is source | 1-enoch 102:6 ↔ the-wisdom-of-solomon 5:3 | 102:6 → 102:6 | re-worded in place |
| 25463 | Enoch is source | 1-enoch 102:7 ↔ malachi 4:2 | 102:7 → 58:3 | moved |
| 25470 | Enoch is source | 1-enoch 102:7 ↔ the-wisdom-of-solomon 5:5 | 102:7 → 104:2 | moved |
| 25472 | Enoch is source | 1-enoch 102:7 ↔ matthew 13:43 | 102:7 → 108:14 | moved |
| 25474 | Enoch is source | 1-enoch 102:7 ↔ daniel 12:3 | 102:7 → 104:2 | moved |
| 25491 | Enoch is source | 1-enoch 103:3 ↔ revelation 14:13 | 103:3 → 103:3 | re-worded in place |
| 25493 | Enoch is source | 1-enoch 103:3 ↔ malachi 3:16 | 103:3 → 103:3 | re-worded in place |
| 25496 | Enoch is source | 1-enoch 103:4 ↔ matthew 13:43 | 103:4 → 103:4 | re-worded in place |
| 25497 | Enoch is source | 1-enoch 103:4 ↔ daniel 12:3 | 103:4 → 103:4 | re-worded in place |
| 25498 | Enoch is source | 1-enoch 103:4 ↔ daniel 12:2 | 103:4 → 103:4 | re-worded in place |
| 25494 | Enoch is source | 1-enoch 103:7 ↔ the-wisdom-of-solomon 3:4 | 103:7 → 103:4 | moved |
| 25495 | Enoch is source | 1-enoch 103:7 ↔ the-wisdom-of-solomon 3:1 | 103:7 → 103:4 | moved |
| 25487 | Enoch is source | 1-enoch 103:9 ↔ revelation 20:15 | 103:9 → 108:3 | moved |
| 25492 | Enoch is source | 1-enoch 103:9 ↔ revelation 20:12 | 103:9 → 104:7 | moved |
| 25488 | Enoch is source | 1-enoch 103:10 ↔ luke 16:24 | 103:10 → 103:8 | moved |
| 25489 | Enoch is source | 1-enoch 103:10 ↔ luke 16:23 | 103:10 → 103:8 | moved |
| 25510 | Enoch is source | 1-enoch 104:3 ↔ daniel 12:1 | 104:3 → 104:1 | moved |
| 25511 | Enoch is source | 1-enoch 104:3 ↔ malachi 3:16 | 104:3 → 104:1 | moved |
| 25513 | Enoch is source | 1-enoch 104:4 ↔ matthew 13:43 | 104:4 → 104:4 | re-worded in place |
| 25514 | Enoch is source | 1-enoch 104:4 ↔ daniel 12:3 | 104:4 → 104:4 | re-worded in place |
| 25515 | Enoch is source | 1-enoch 104:4 ↔ daniel 12:2 | 104:4 → 104:4 | re-worded in place |
| 25512 | Enoch is source | 1-enoch 104:5 ↔ the-wisdom-of-solomon 3:7 | 104:5 → 104:5 | re-worded in place |
| 25508 | Enoch is source | 1-enoch 104:8 ↔ revelation 3:5 | 104:8 → 103:4 | moved |
| 25509 | Enoch is source | 1-enoch 104:8 ↔ psalms 69:28 | 104:8 → 103:4 | moved |
| 25506 | Enoch is source | 1-enoch 104:9 ↔ revelation 20:12 | 104:9 → 98:8 | moved |
| 25505 | Enoch is source | 1-enoch 104:12 ↔ revelation 20:15 | 104:12 → 103:8 | moved |
| 25529 | Enoch is source | 1-enoch 105:1 ↔ matthew 13:42 | 105:1 → 103:8 | moved |
| 25530 | Enoch is source | 1-enoch 105:2 ↔ daniel 12:1 | 105:2 → 103:4 | moved |
| 25531 | Enoch is source | 1-enoch 105:2 ↔ malachi 3:16 | 105:2 → 103:4 | moved |
| 16053 | Enoch is source | 1-enoch 8:2 ↔ exodus 2:23 | 8:2 → 8:4 | moved |
| 16054 | Enoch is source | 1-enoch 8:2 ↔ genesis 4:10 | 8:2 → 8:4 | moved |
| 16060 | Enoch is source | 1-enoch 8:2 ↔ jubilees 8:3 | 8:2 → 8:3 | moved |
| 16061 | Enoch is source | 1-enoch 8:2 ↔ jeremiah 10:2 | 8:2 → 8:3 | moved |
| 16686 | Enoch is source | 1-enoch 18:12 ↔ isaiah 24:22 | 18:12 → 18:14 | moved |
| 16687 | Enoch is source | 1-enoch 18:12 ↔ isaiah 24:21 | 18:12 → 18:15 | moved |
| 16768 | Enoch is source | 1-enoch 25:5 ↔ isaiah 65:22 | 25:5 → 25:5 | stands; address/quote patched |
| 16769 | Enoch is source | 1-enoch 25:5 ↔ revelation 22:14 | 25:5 → 25:5 | stands; address/quote patched |
| 16770 | Enoch is source | 1-enoch 25:5 ↔ 2-esdras 8:52 | 25:5 → 25:5 | stands; address/quote patched |
| 17164 | Enoch is source | 1-enoch 27:2 ↔ zechariah 14:4 | 27:2 → 25:3 | moved |
| 17165 | Enoch is source | 1-enoch 27:2 ↔ ezekiel 47:1 | 27:2 → 26:2 | moved |
| 17234 | Enoch is source | 1-enoch 33:3 ↔ jubilees 2:9 | 33:3 → 72:3 | moved |
| 17237 | Enoch is source | 1-enoch 33:3 ↔ psalms 19:5 | 33:3 → 72:3 | moved |
| 17238 | Enoch is source | 1-enoch 33:3 ↔ genesis 1:14 | 33:3 → 72:3 | moved |
| 17951 | Enoch is source | 1-enoch 39:4 ↔ revelation 22:1 | 39:4 → 39:5 | moved |
| 17952 | Enoch is source | 1-enoch 39:4 ↔ amos 5:24 | 39:4 → 39:5 | moved |
| 17958 | Enoch is source | 1-enoch 39:4 ↔ revelation 7:15 | 39:4 → 39:5 | moved |
| 18002 | Enoch is source | 1-enoch 51:4 ↔ psalms 114:4 | 51:4 → 51:4 | stands; address/quote patched |
| 19864 | Enoch is source | 1-enoch 53:6 ↔ revelation 19:20 | 53:6 → 53:5 | moved |
| 19865 | Enoch is source | 1-enoch 53:6 ↔ the-wisdom-of-solomon 6:6 | 53:6 → 53:5 | moved |
| 19867 | Enoch is source | 1-enoch 53:6 ↔ matthew 13:42 | 53:6 → 53:5 | moved |
| 19869 | Enoch is source | 1-enoch 53:6 ↔ isaiah 30:33 | 53:6 → 53:5 | moved |
| 19993 | Enoch is source | 1-enoch 62:1 ↔ matthew 25:31 | 62:1 → 62:5 | moved |
| 19994 | Enoch is source | 1-enoch 62:1 ↔ daniel 7:13 | 62:1 → 62:5 | moved |
| 19995 | Enoch is source | 1-enoch 62:1 ↔ daniel 7:9 | 62:1 → 61:8 | moved |
| 21279 | Enoch is source | 1-enoch 63:2 ↔ psalms 2:9 | 63:2 → 62:2 | moved |
| 21280 | Enoch is source | 1-enoch 63:2 ↔ isaiah 11:4 | 63:2 → 62:2 | moved |
| 21282 | Enoch is source | 1-enoch 63:2 ↔ daniel 7:13 | 63:2 → 62:2 | moved |
| 19991 | Enoch is source | 1-enoch 62:7 ↔ matthew 26:64 | 62:7 → 71:14 | moved |
| 21348 | Enoch is source | 1-enoch 68:1 ↔ jubilees 5:1 | 68:1 → 6:6 | moved |
| 21352 | Enoch is source | 1-enoch 68:1 ↔ genesis 6:2 | 68:1 → 6:6 | moved |
| 23845 | Enoch is source | 1-enoch 85:8 ↔ hebrews 11:5 | 85:8 → 85:9 | moved |
| 23906 | Enoch is source | 1-enoch 89:21 ↔ exodus 19:6 | 89:21 → 89:36 | moved |
| 23908 | Enoch is source | 1-enoch 89:21 ↔ 1-kings 6:1 | 89:21 → 89:36 | moved |
| 25341 | Enoch is source | 1-enoch 94:3 ↔ james 5:1 | 94:3 → 94:8 | moved |
| 25343 | Enoch is source | 1-enoch 94:3 ↔ psalms 49:17 | 94:3 → 94:8 | moved |
| 25345 | Enoch is source | 1-enoch 94:3 ↔ psalms 49:6 | 94:3 → 94:8 | moved |
| 25335 | Enoch is source | 1-enoch 94:6 ↔ isaiah 5:8 | 94:6 → 94:7 | moved |
| 25339 | Enoch is source | 1-enoch 94:8 ↔ ecclesiasticus 11:19 | 94:8 → 97:9 | moved |
| 25369 | Enoch is source | 1-enoch 96:4 ↔ amos 5:12 | 96:4 → 96:5 | moved |
| 25371 | Enoch is source | 1-enoch 96:4 ↔ isaiah 3:15 | 96:4 → 96:5 | moved |
| 25372 | Enoch is source | 1-enoch 96:4 ↔ proverbs 22:23 | 96:4 → 96:5 | moved |
| 25397 | Enoch is source | 1-enoch 97:6 ↔ james 5:4 | 97:6 → 96:5 | moved |
| 25402 | Enoch is source | 1-enoch 97:8 ↔ habakkuk 2:6 | 97:8 → 97:9 | moved |
| 25504 | Enoch is source | 1-enoch 97:8 ↔ isaiah 5:8 | 97:8 → 97:8 | stands; address/quote patched |
| 25484 | Enoch is source | 1-enoch 103:14 ↔ james 5:4 | 103:14 → 103:14 | re-worded in place |
| 16759 | Enoch is source | 1-enoch 23:4 ↔ psalms 104:19 | 23:4 → 23:4 | re-worded in place |
| 16760 | Enoch is source | 1-enoch 23:4 ↔ psalms 104:4 | 23:4 → 23:4 | re-worded in place |
| 16763 | Enoch is source | 1-enoch 23:4 ↔ psalms 19:4 | 23:4 → 23:4 | re-worded in place |
| 22553 | Enoch is source | 1-enoch 78:1 ↔ genesis 1:16 | 78:1 → 78:1 | re-worded in place |
| 25347 | Enoch is source | 1-enoch 94:2 ↔ matthew 7:13 | 94:2 → 94:2 | re-worded in place |
| 16776 | Enoch is source | 1-enoch 25:3 ↔ jubilees 4:25 | 25:3 → 25:3 | stands; address/quote patched |
| 16778 | Enoch is source | 1-enoch 25:3 ↔ ezekiel 28:14 | 25:3 → 25:3 | stands; address/quote patched |
| 16779 | Enoch is source | 1-enoch 25:3 ↔ daniel 7:9 | 25:3 → 25:3 | stands; address/quote patched |
| 16767 | Enoch is source | 1-enoch 25:4 ↔ 2-esdras 2:12 | 25:4 → 25:4 | stands; address/quote patched |
| 16764 | Enoch is source | 1-enoch 25:6 ↔ revelation 22:3 | 25:6 → 25:6 | stands; address/quote patched |
| 16765 | Enoch is source | 1-enoch 25:6 ↔ revelation 21:4 | 25:6 → 25:6 | stands; address/quote patched |
| 16766 | Enoch is source | 1-enoch 25:6 ↔ isaiah 25:8 | 25:6 → 25:6 | stands; address/quote patched |
| 17192 | Enoch is source | 1-enoch 25:6 ↔ ezekiel 47:12 | 25:6 → 25:6 | stands; address/quote patched |
| 16682 | Enoch is source | 1-enoch 21:10 ↔ revelation 20:3 | 21:10 → 21:10 | stands; address/quote patched |
| 25331 | Enoch is source | 1-enoch 96:5 ↔ james 5:5 | 96:5 → 96:5 | stands; address/quote patched |
| 25334 | Enoch is source | 1-enoch 96:5 ↔ isaiah 5:22 | 96:5 → 96:5 | stands; address/quote patched |
| 25467 | Enoch is source | 1-enoch 96:5 ↔ amos 6:6 | 96:5 → 96:5 | stands; address/quote patched |
| 18043 | Enoch is source | 1-enoch 41:7 ↔ jubilees 2:9 | 41:7 → 41:7 | stands; address/quote patched |
| 18044 | Enoch is source | 1-enoch 41:7 ↔ psalms 19:1 | 41:7 → 41:7 | stands; address/quote patched |
| 17926 | Enoch is source | 1-enoch 69:28 ↔ daniel 12:2 | 69:28 → 69:28 | stands; address/quote patched |
| 23899 | Enoch is source | 1-enoch 89:15 ↔ exodus 3:7 | 89:15 → 89:15 | stands; address/quote patched |
| 16278 | Enoch is source | 1-enoch 11:1 ↔ genesis 6:3 | 11:1 → 10:9 | moved |
| 25553 | Enoch is source | 1-enoch 108:10 ↔ matthew 13:43 | 108:10 → 100:6 | moved |
| 19848 | Enoch is source | 1-enoch 52:6 ↔ zechariah 4:7 | 52:6 → 56:4 | moved |
| 19863 | Enoch is source | 1-enoch 53:3 ↔ revelation 6:15 | 53:3 → 53:2 | moved |
| 25363 | Enoch is source | 1-enoch 95:7 ↔ amos 6:7 | 95:7 → 95:7 | stands; address/quote patched |
| 25485 | Enoch is source | 1-enoch 103:15 ↔ james 5:1 | 103:15 → 97:8 | moved |
| 23897 | Enoch is source | 1-enoch 89:14 ↔ exodus 1:13 | 89:14 → 89:13 | moved |
| 21285 | Enoch is source | 1-enoch 63:3 ↔ matthew 25:11 | 63:3 → 62:9 | moved |
| 21286 | Enoch is source | 1-enoch 63:4 ↔ luke 13:25 | 63:4 → 62:10 | moved |
| 19988 | Enoch is source | 1-enoch 62:9 ↔ daniel 7:14 | 62:9 → 46:4 | moved |
| 23923 | Enoch is source | 1-enoch 89:49 ↔ john 10:16 | 89:49 → 90:37 | moved |
| 16043 | Enoch is source | 1-enoch 7:4 ↔ jubilees 7:24 | 7:4 → 7:5 | moved |
| 21408 | Enoch is source | 1-enoch 71:1 ↔ psalms 104:4 | 71:1 → 71:1 | re-worded in place |
| 16013 | Enoch is source | 1-enoch 5:8 ↔ deuteronomy 33:2 | 5:8 → 1:9 | moved |
| 16016 | Enoch is source | 1-enoch 5:7 ↔ the-wisdom-of-solomon 5:6 | 5:7 → 1:8 | moved |
| 16018 | Enoch is source | 1-enoch 5:7 ↔ malachi 4:2 | 5:7 → 1:8 | moved |
| 16040 | Enoch is source | 1-enoch 7:5 ↔ jubilees 7:25 | 7:5 → 7:6 | moved |
| 16042 | Enoch is source | 1-enoch 7:5 ↔ genesis 6:11 | 7:5 → 7:6 | moved |
| 16044 | Enoch is source | 1-enoch 7:4 ↔ leviticus 17:14 | 7:4 → 7:5 | moved |
| 16045 | Enoch is source | 1-enoch 7:4 ↔ genesis 9:4 | 7:4 → 7:5 | moved |
| 16274 | Enoch is source | 1-enoch 11:2 ↔ isaiah 24:21 | 11:2 → 10:12 | moved |
| 16275 | Enoch is source | 1-enoch 11:2 ↔ jubilees 5:6 | 11:2 → 10:12 | moved |
| 16276 | Enoch is source | 1-enoch 11:2 ↔ 2-peter 2:4 | 11:2 → 10:12 | moved |
| 16279 | Enoch is source | 1-enoch 11:1 ↔ genesis 6:2 | 11:1 → 10:11 | moved |
| 16314 | Enoch is source | 1-enoch 14:20 ↔ genesis 1:16 | 14:20 → 18:15 | moved |
| 16318 | Enoch is source | 1-enoch 14:21 ↔ jude 1:6 | 14:21 → 18:16 | moved |
| 16320 | Enoch is source | 1-enoch 14:21 ↔ isaiah 24:22 | 14:21 → 18:16 | moved |
| 16322 | Enoch is source | 1-enoch 14:18 ↔ jeremiah 4:25 | 14:18 → 18:12 | moved |
| 16323 | Enoch is source | 1-enoch 14:18 ↔ jeremiah 4:23 | 14:18 → 18:12 | moved |
| 16324 | Enoch is source | 1-enoch 14:18 ↔ genesis 1:2 | 14:18 → 18:12 | moved |
| 16325 | Enoch is source | 1-enoch 14:15 ↔ revelation 4:2 | 14:15 → 18:8 | moved |
| 16330 | Enoch is source | 1-enoch 15:11 ↔ jude 1:6 | 15:11 → 16:1 | moved |
| 16331 | Enoch is source | 1-enoch 15:11 ↔ genesis 6:3 | 15:11 → 16:1 | moved |
| 16332 | Enoch is source | 1-enoch 15:6 ↔ the-wisdom-of-solomon 14:6 | 15:6 → 15:8 | moved |
| 16333 | Enoch is source | 1-enoch 15:7 ↔ jubilees 10:1 | 15:7 → 15:9 | moved |
| 16334 | Enoch is source | 1-enoch 15:6 ↔ matthew 12:43 | 15:6 → 15:8 | moved |
| 16676 | Enoch is source | 1-enoch 17:6 ↔ job 38:22 | 17:6 → 17:7 | moved |
| 16677 | Enoch is source | 1-enoch 17:5 ↔ job 38:16 | 17:5 → 17:6 | moved |
| 16679 | Enoch is source | 1-enoch 17:4 ↔ deuteronomy 32:22 | 17:4 → 17:5 | moved |
| 16689 | Enoch is source | 1-enoch 18:13 ↔ job 38:33 | 18:13 → 18:15 | moved |
| 16690 | Enoch is source | 1-enoch 18:13 ↔ job 38:31 | 18:13 → 18:15 | moved |
| 16745 | Enoch is source | 1-enoch 22:14 ↔ genesis 4:10 | 22:14 → 22:7 | moved |
| 16746 | Enoch is source | 1-enoch 22:9 ↔ luke 16:26 | 22:9 → 22:2 | moved |
| 16747 | Enoch is source | 1-enoch 22:10 ↔ luke 16:22 | 22:10 → 22:3 | moved |
| 16748 | Enoch is source | 1-enoch 22:4 ↔ jude 1:13 | 22:4 → 21:3 | moved |
| 17135 | Enoch is source | 1-enoch 25:6 ↔ jubilees 10:1 | 25:6 → 15:8 | moved |
| 17138 | Enoch is source | 1-enoch 25:4 ↔ genesis 6:3 | 25:4 → 15:4 | moved |
| 17923 | Enoch is source | 1-enoch 37:5 ↔ matthew 11:25 | 37:5 → 1:3 | moved |
| 17988 | Enoch is source | 1-enoch 41:7 ↔ jubilees 2:8 | 41:7 → 41:8 | moved |
| 17990 | Enoch is source | 1-enoch 41:6 ↔ psalms 104:19 | 41:6 → 41:7 | moved |
| 17991 | Enoch is source | 1-enoch 41:7 ↔ genesis 1:14 | 41:7 → 41:8 | moved |
| 18049 | Enoch is source | 1-enoch 44:1 ↔ job 38:35 | 44:1 → 41:3 | moved |
| 19860 | Enoch is source | 1-enoch 53:3 ↔ isaiah 24:22 | 53:3 → 53:2 | moved |
| 19861 | Enoch is source | 1-enoch 53:3 ↔ isaiah 24:21 | 53:3 → 53:2 | moved |
| 19862 | Enoch is source | 1-enoch 53:3 ↔ revelation 6:16 | 53:3 → 53:2 | moved |
| 19868 | Enoch is source | 1-enoch 53:5 ↔ matthew 13:41 | 53:5 → 53:4 | moved |
| 19942 | Enoch is source | 1-enoch 59:2 ↔ jubilees 2:2 | 59:2 → 41:3 | moved |
| 19943 | Enoch is source | 1-enoch 59:2 ↔ psalms 29:3 | 59:2 → 41:3 | moved |
| 19948 | Enoch is source | 1-enoch 60:14 ↔ jeremiah 10:13 | 60:14 → 41:4 | moved |
| 19950 | Enoch is source | 1-enoch 60:13 ↔ job 38:25 | 60:13 → 41:3 | moved |
| 19980 | Enoch is source | 1-enoch 62:12 ↔ the-wisdom-of-solomon 5:3 | 62:12 → 46:6 | moved |
| 19982 | Enoch is source | 1-enoch 62:10 ↔ revelation 1:7 | 62:10 → 46:5 | moved |
| 19983 | Enoch is source | 1-enoch 62:12 ↔ revelation 6:16 | 62:12 → 46:6 | moved |
| 19987 | Enoch is source | 1-enoch 62:10 ↔ psalms 2:9 | 62:10 → 46:5 | moved |
| 19992 | Enoch is source | 1-enoch 62:2 ↔ isaiah 11:4 | 62:2 → 61:9 | moved |
| 21274 | Enoch is source | 1-enoch 63:8 ↔ the-wisdom-of-solomon 5:3 | 63:8 → 62:5 | moved |
| 21276 | Enoch is source | 1-enoch 63:8 ↔ revelation 6:16 | 63:8 → 62:5 | moved |
| 21277 | Enoch is source | 1-enoch 63:8 ↔ revelation 6:15 | 63:8 → 62:5 | moved |
| 21283 | Enoch is source | 1-enoch 63:4 ↔ isaiah 26:10 | 63:4 → 62:10 | moved |
| 21284 | Enoch is source | 1-enoch 63:3 ↔ matthew 25:12 | 63:3 → 62:9 | moved |
| 21287 | Enoch is source | 1-enoch 63:3 ↔ proverbs 1:28 | 63:3 → 62:9 | moved |
| 21329 | Enoch is source | 1-enoch 67:5 ↔ revelation 6:10 | 67:5 → 47:4 | moved |
| 21354 | Enoch is source | 1-enoch 69:5 ↔ genesis 6:4 | 69:5 → 8:1 | moved |
| 21355 | Enoch is source | 1-enoch 69:6 ↔ jude 1:6 | 69:6 → 8:2 | moved |
| 21356 | Enoch is source | 1-enoch 69:6 ↔ 2-peter 2:4 | 69:6 → 8:2 | moved |
| 21357 | Enoch is source | 1-enoch 69:7 ↔ jubilees 7:21 | 69:7 → 8:3 | moved |
| 21358 | Enoch is source | 1-enoch 69:10 ↔ genesis 6:1 | 69:10 → 69:6 | moved |
| 21359 | Enoch is source | 1-enoch 69:15 ↔ genesis 6:4 | 69:15 → 69:11 | moved |
| 21360 | Enoch is source | 1-enoch 69:20 ↔ psalms 33:6 | 69:20 → 69:16 | moved |
| 21361 | Enoch is source | 1-enoch 69:21 ↔ psalms 33:9 | 69:21 → 69:17 | moved |
| 21362 | Enoch is source | 1-enoch 69:22 ↔ job 38:11 | 69:22 → 69:18 | moved |
| 21363 | Enoch is source | 1-enoch 69:22 ↔ jeremiah 5:22 | 69:22 → 69:18 | moved |
| 21364 | Enoch is source | 1-enoch 69:23 ↔ proverbs 8:29 | 69:23 → 69:19 | moved |
| 21365 | Enoch is source | 1-enoch 69:20 ↔ john 1:1 | 69:20 → 69:16 | moved |
| 21366 | Enoch is source | 1-enoch 69:21 ↔ john 1:3 | 69:21 → 69:17 | moved |
| 21367 | Enoch is source | 1-enoch 69:24 ↔ colossians 1:16 | 69:24 → 69:20 | moved |
| 21368 | Enoch is source | 1-enoch 69:25 ↔ hebrews 1:3 | 69:25 → 69:21 | moved |
| 21383 | Enoch is source | 1-enoch 70:4 ↔ daniel 10:6 | 70:4 → 71:4 | moved |
| 21384 | Enoch is source | 1-enoch 70:3 ↔ daniel 12:1 | 70:3 → 71:3 | moved |
| 21385 | Enoch is source | 1-enoch 70:1 ↔ revelation 1:14 | 70:1 → 71:1 | moved |
| 21386 | Enoch is source | 1-enoch 70:2 ↔ daniel 7:10 | 70:2 → 71:2 | moved |
| 21388 | Enoch is source | 1-enoch 70:1 ↔ jubilees 4:23 | 70:1 → 71:1 | moved |
| 21389 | Enoch is source | 1-enoch 70:2 ↔ 2-kings 2:11 | 70:2 → 71:2 | moved |
| 21390 | Enoch is source | 1-enoch 70:1 ↔ ecclesiasticus 49:14 | 70:1 → 71:1 | moved |
| 21391 | Enoch is source | 1-enoch 70:1 ↔ ecclesiasticus 44:16 | 70:1 → 71:1 | moved |
| 21392 | Enoch is source | 1-enoch 70:1 ↔ hebrews 11:5 | 70:1 → 71:1 | moved |
| 21393 | Enoch is source | 1-enoch 70:1 ↔ genesis 5:24 | 70:1 → 71:1 | moved |
| 21398 | Enoch is source | 1-enoch 71:7 ↔ hebrews 12:23 | 71:7 → 70:4 | moved |
| 22568 | Enoch is source | 1-enoch 80:4 ↔ isaiah 24:4 | 80:4 → 80:3 | moved |
| 23822 | Enoch is source | 1-enoch 84:3 ↔ daniel 4:35 | 84:3 → 9:5 | moved |
| 23846 | Enoch is source | 1-enoch 85:7 ↔ jubilees 4:7 | 85:7 → 85:8 | moved |
| 23847 | Enoch is source | 1-enoch 85:7 ↔ genesis 4:26 | 85:7 → 85:8 | moved |
| 23848 | Enoch is source | 1-enoch 85:7 ↔ genesis 4:25 | 85:7 → 85:8 | moved |
| 23849 | Enoch is source | 1-enoch 85:5 ↔ hebrews 12:24 | 85:5 → 85:6 | moved |
| 23850 | Enoch is source | 1-enoch 85:5 ↔ matthew 23:35 | 85:5 → 85:6 | moved |
| 23851 | Enoch is source | 1-enoch 85:5 ↔ hebrews 11:4 | 85:5 → 85:6 | moved |
| 23852 | Enoch is source | 1-enoch 85:5 ↔ genesis 4:10 | 85:5 → 85:6 | moved |
| 23922 | Enoch is source | 1-enoch 89:49 ↔ ezekiel 34:23 | 89:49 → 90:37 | moved |
| 23945 | Enoch is source | 1-enoch 90:20 ↔ daniel 7:13 | 90:20 → 90:37 | moved |
| 23946 | Enoch is source | 1-enoch 90:20 ↔ daniel 7:14 | 90:20 → 90:37 | moved |
| 23947 | Enoch is source | 1-enoch 90:21 ↔ isaiah 11:6 | 90:21 → 90:38 | moved |
| 23948 | Enoch is source | 1-enoch 90:21 ↔ isaiah 65:25 | 90:21 → 90:38 | moved |
| 23949 | Enoch is source | 1-enoch 90:20 ↔ genesis 1:26 | 90:20 → 90:37 | moved |
| 25361 | Enoch is source | 1-enoch 95:7 ↔ jeremiah 17:11 | 95:7 → 97:8 | moved |
| 25379 | Enoch is source | 1-enoch 96:5 ↔ luke 12:19 | 96:5 → 97:8 | moved |
| 25381 | Enoch is source | 1-enoch 96:5 ↔ amos 8:5 | 96:5 → 97:8 | moved |
| 25403 | Enoch is source | 1-enoch 97:7 ↔ james 5:3 | 97:7 → 97:8 | moved |
| 25545 | Enoch is source | 1-enoch 108:10 ↔ isaiah 5:8 | 108:10 → 100:6 | moved |
| 25550 | Enoch is source | 1-enoch 108:13 ↔ matthew 13:42 | 108:13 → 100:9 | moved |
| 25551 | Enoch is source | 1-enoch 108:13 ↔ isaiah 66:24 | 108:13 → 100:9 | moved |
| 25552 | Enoch is source | 1-enoch 108:9 ↔ the-wisdom-of-solomon 3:7 | 108:9 → 100:5 | moved |
| 25554 | Enoch is source | 1-enoch 108:10 ↔ daniel 12:3 | 108:10 → 100:6 | moved |
| 25555 | Enoch is source | 1-enoch 108:9 ↔ daniel 12:2 | 108:9 → 100:5 | moved |
| 25556 | Enoch is source | 1-enoch 108:9 ↔ psalms 17:8 | 108:9 → 100:5 | moved |

## Verification — two cold reads before anything left the scratchpad

Pass 1 (independent agent, no sight of the build): walked every auto re-pointing and found 41 cards whose gloss described the
live verse *at the old number* (the gloss had been authored against the correct verse, not the corrupt text) — those now stay
put; ~25 prose wordings that no longer matched the live verse; stale addresses inside notes (24:9–12, 44:4, 94:18, 102:12,
38:12, 18:18, 97:24, 96:13, 30:9); and over-restored canon italics in four lead quotes (21285, 21286, 25491, 22542 — restored to
the canon's own rendering: "Adonai (Lord), Adonai (Lord)", "die in Yahusha (Lord)", "El Elyon (most High)"). All corrected.

Pass 2 (second independent agent, on the corrected set): content-word overlap of every moved gloss against the live verse at
the old and the new address, then a hand read of every card where the old verse scored as high. Found and corrected:
- 23897 (Exodus 1:13): "given over to the wolves" is live 89:13, not 89:12 → re-pointed to 89:13.
- 23829 (Psalm 11:4): "the enthroned One ... the God Enoch blesses" is only true of live 84:3 (Enoch's own prayer) → stays at 84:3.
- 19988 (Daniel 7:14): cited range ran past the end of ch. 46 → "46:4-6". 23923 (John 10:16): ran past ch. 90 → "90:37-38".
- 25372 (Proverbs 22:23): "every woe ... in 96:1-4" — the live woes run 96:4-8 → patched. 16043 (Jubilees 7:24): "7:3-4" → "7:4-5".
Pass 2 also confirmed every retirement's twin, every FITS patch, and that the SQL carries exactly the JSON rows and nothing else.
Then the migration was rebuilt and re-run twice on a fresh scratch seed (counts at the top).

## Pre-existing, not touched
- Lead quotes on the Jubilees side of a few glosses span two verses or sit in the modernized register the dump's verse text does
  not match: 21302, 22582, 22602, 21357, 22530, and 16776 (a Jubilees 4:25 card quoting 4:26). Not changed by this pass and not
  verified by the migration; a later canon-quote sweep (roadmap S463b–) can read them.
- The thread summaries (S460) were not touched.
- 23817 carries the word "substance" — that is KJV Genesis 7:23 text, not a degraded marker; left as written.
