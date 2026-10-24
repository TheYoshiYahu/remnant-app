# S463d — Book of Jasher card sweep (Oct 23, 2026)

Chain: dump (Yoshi's paste) → regrade every quotation by content → map → build one Rule 10 migration → three reads → scratch ×2 → read-back → deploy.

## Dump
3,910 live Jasher verses in 91 chapters (7:51, 9:39, 20:30 — the S450 split is live). 5,887 cards came back; **1,943 are anchored in Jasher** (1,689 Jasher→other, 254 other→Jasher). The other 3,944 were the dump's `yashar` filter matching *Yashar'el* — only one really names Jasher (158845, Joshua 10:13, canon↔canon) and it is out of scope. Other ends: {'canon': 1650, 'enoch': 15, 'jubilees': 246, 'apocrypha': 14, 'jasher': 2, 'adam-eve-conflict': 11, 'apocalypse-of-abraham': 3, 'pseudepigrapha': 2}.

## Map (plain numbers)
- Jasher quotations, every quotation in every note graded: 321 — 315 STAND, 6 REWORDED, 0 RE_ANCHOR, 0 NOT_FOUND. 1,624 cards quote only the other end (canon-first glosses; left as they are, as S463c left its 2,746). Their canon lead quotes: 1,428/1,429 verbatim canon.json; 30027 (Matthew 4:10) carried the old compound rendering.
- Degraded prose, judged in the prose only: 9 marker notes + 44 hyphen-chain-only = **53 cards rebuilt**. Slug citations 0. Hebrew book names 0.
- Glosses on S450-changed verses: 36 read by content — 36 stay, 0 move, 2 quotation patches (49945, 54994). The 20 S450 moves all sit on the verse their note names.
- Notes naming a Jasher verse off the card's address: 13 read — 12 stay (the prose names a range the card sits inside), 1 moved (31322 → 34:55).
- Member notes on Jasher cards: 1,944 — quotations 251 STAND / 6 REWORDED / 0 OFF; 49 flagged for markers/chains.
- Thread summaries anchored in Jasher: 475 — 22 quotations off in 20 (four still quoting the old 7:18 blob, one at 9:7, two "the El Shaddai", "from from there", "THE END"…); 45 with markers/chains (34 "the Jubilees apparatus", "the framework demands", "word for word in substance", hyphen-chains); 6295 and 8940 say *substance* meaning goods and were left.

## Build — `data-schema/migrations/session463d_jasher_sweep.sql`
- 53 notes rebuilt Come-and-See (full live Jasher verse in italics, cited; the other verse from canon.json or the live extra; prose), 0 re-pointed.
- 3 re-quoted with prose kept: 4265 (whole of 45:32), 30027 (canon.json "Yahuah Elohayka"), 20237 (cited 13:22–23 — the quotation begins in 13:22; caught by the scratch read-back).
- 2 quotation patches on S450-changed verses: 49945 "take from there", 54994 "El Shaddai (the Almighty God)".
- 1 move: 31322 Jasher 34:60 → 34:55 (Deuteronomy 11:25 — the verse that names the Canaanite kings).
- 58 member notes (53 on rebuilt cards, 5 re-quoted on their own); 65 summaries (jargon out; 21 with quotations re-cited to the verse the words now sit in, incl. 6797 12:25→12:24 and 8958's em-dash aside clarified).
- Guards: skip with NOTICE if a card is not at its read-back address or a card already sits on the destination; RAISE if the live verse differs from the read-back or a rebuilt note does not quote it verbatim. Idempotent.

## Reads
- Every gloss on a changed verse read by content (one reader, 36 + 13); every address decision read cold by two agents that never saw the build: 54 AGREE / 0 DISAGREE / 0 UNSURE across 23 decisions (1 card move, 26 summary re-citations).
- Every rebuilt note, member note and summary read cold against the voice skill by three readers: 8 findings, all applied — 29239 (Misstates where the event falls in Jasher: "by the next chapter Nimrod…); 29504 (Invents a claim the two verses do not carry: "Stephen is not inventing…); 29191 (Last sentence misstates what Genesis 8:21 says: "The household that se…); 28104 (The prose puts Esau into the Jasher verse: "In both books it is Yahuda…); 4281 (The closing sentence misstates the timing on the Jasher side: "in both…); 7376 (Awkward sentence after the misprint workaround: "and they ask *where i…); 6199 (The jargon swap left behind an internal-state remark the reader cannot…); 8969 (Not introduced by this edit (the editor flagged it), but it is a false…).

## Scratch (seeded from the Oct 23 read-back with full live text and ids)
Run 1 = 58 in place, 1 moved, 58 member notes, 65 summaries, 0 skipped, 0 absent. Run 2 = 0 changed, 59 landed. Post-run read-back: cards 59/59, member notes 58/58, summaries 65/65, **1,628 Jasher quotations verbatim at their cited verse (every quotation in every note), 0 degraded markers, 0 hyphen-chains, 0 slug citations, 0 duplicate pairs; 53/53 rebuilt notes carry the whole live verse.** Guards tested: live text changed → RAISE + ROLLBACK; card moved since read-back → skipped with NOTICE.

## For Yoshi (not blocking)
- Live Jasher misprints (text lane, not this sweep): 51:50 "Abraham, Isaac, **end** Jacob"; 90:23 "Elazer" for Eleazar; Jubilees 6:5 live text opens with a stray `"`.
- Agent flags worth your eye: 29191 (thread `jasher-6-altar-covenant-bow` — Jasher 6:41 has no altar; the note now says what the verse says); 38883 (Exodus 12:38 is the closer canon line to Jasher 81:2 than 12:36 — card kept on 12:36); 28104 (Jubilees and Jasher date the war with Esau differently — the note no longer says one "stands behind" the other); 31317 (34:69 ↔ Genesis 48:22 could live on 34:60 — a thread choice); 30591 and 39005 (a tighter verse exists inside the range the note names: 29:14, 87:1 — neither is wrong where it sits).
- Many older summaries use bare sacred names in their own prose ("Yahuah meets Abram") — outside this sweep's scope (changed as little as possible); a separate pass if wanted.
- 1,624 Jasher glosses remain canon-first (not Come-and-See) — not broken; later pass if wanted, same as the Apocrypha's 2,746.
