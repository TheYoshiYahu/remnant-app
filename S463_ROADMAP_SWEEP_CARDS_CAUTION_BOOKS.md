# S463 Roadmap — sweep → rebuild cards → Caution layer → republish the books (written Oct 22, 2026)

Yoshi's order, Oct 22: (1) sweep every extra-canonical book's cards, (2) rebuild the cross-references and
chapter-end cards, (3) build the Caution layer (toggleable), (4) remake the cross-reference books for KDP.
The three Restored Names editions (Enoch, Jasher, Jubilees — S458 Track A) ride on phases 1–2 and go out
before or alongside phase 4. Voices stay LAST, after every text change.

Every session opens the same way: "Load my voice skill and mount my Desktop. Read
~/Desktop/App/S463_ROADMAP_SWEEP_CARDS_CAUTION_BOOKS.md, phase __, and the status tables it points to."
Every session closes by updating the status table in XREF_LIBRARY_COVERAGE_ROADMAP.md and adding a dated
line to S446_SESSION_HANDOFF.md. Verbal decisions get written into this file before the session ends.

Standing rules (from the handoffs; do not re-derive):
- Verify by content, verse-by-verse and card-by-card, numbers shown. Never by counts or lengths.
- Rule 10 migrations: upsert in place, ids/slugs kept, verify-or-EXCEPTION, scratch Postgres twice, one deploy
  script, live read-back. Claude's shell has no route to Postgres — every dump and every deploy is Yoshi's paste.
- Come-and-See in every card: quote in full, stand-alone italics, citation in parentheses, English book names,
  Sacred Names with parentheticals, no internal references (no "Red Line #", "the framework", "S1xx", "Yoshi").
- Canon quotes come from source-texts/parsed/canon.json (restored-names KJV), never from the card dump's
  modernized register.
- One file, saved over the original. No v2 copies. Delete what's replaced.
- git push and any Render click are Yoshi's. Say so before he steps away.

---

## Phase 1 — Card-fidelity SWEEP, book by book (where S459/S460 left off)

Chain per book (unchanged from S459): dump live cards touching the book (`_s457_enoch_dump.py` pattern) →
regrade by the words quoted (`s459-card-fix/regrade.py`, with the S460 citation forms taught in) → general map
first (how many STAND / REWORDED / RE_ANCHOR / NOT_FOUND / no-quote-on-changed-verse) → Yoshi decides from the
map → build → scratch twice → one deploy script → read-back → status table.

Order and status (Oct 22):
| book | sweep | cards fixed | summaries | glosses | notes |
|---|---|---|---|---|---|
| 1 Enoch | ✓ S459 | ✓ deployed | ✓ S460 deployed | ✓ BUILT S463a (Oct 22): 63 STAND cards rewritten, 631 glosses read — 349 re-pointed, 55 re-worded, 22 patched, 61 duplicates retired, 4 questions; scratch ×2 clean; deploy pending Yoshi | deploy `_session463a_enoch_closeout_deploy.sh` → read-back → Enoch is Track-A ready |
| Jubilees | ✓ S463b | ✓ deployed Oct 23 | ✓ deployed Oct 23 (5) | ✓ deployed Oct 23 (312 read) | read-back 0 flagged — Jubilees is Track-A ready |
| Apocrypha + 3 Macc | ✓ S463c | ✓ BUILT S463c (Oct 23): 485 notes rebuilt, 22 re-quoted, 3 re-cited, 63 slug cites fixed; ✓ deployed Oct 23 14:55 CDT | ✓ deployed Oct 23 (55) | ✓ deployed Oct 23 (13 S454-changed read: all stay) | read-back 573/573, 0 flagged — Apocrypha + 3 Macc CLOSED; 2,746 canon-first glosses remain (not broken; later pass if wanted) |
| Jasher | ✓ S463d | ✓ BUILT S463d (Oct 23): 53 notes rebuilt, 3 re-quoted, 2 patched, 1 re-pointed (31322 → 34:55); ✓ deployed Oct 23 18:59 CDT | ✓ deployed Oct 23 (65) | ✓ deployed Oct 23 (36 S450-changed read: all stay; 13 off-address read: 1 moved) | read-back 59/59, 1,628 quotations verbatim, 0 flagged — Jasher CLOSED, Track-A ready; 1,624 canon-first glosses remain (not broken; later pass if wanted) |
| 2 Enoch / Test. XII / 2–3 Baruch / 1–2 Adam-Eve / Apoc. Abraham / Asc. Isaiah | ✓ S463e (S476, Oct 26) | ✓ BUILT S463e: 74 notes rebuilt, 84 canon re-quotes, 76 phrase patches, 7 address fixes, 14 re-pointed, 227 slug cites; scratch ×2 clean; ✓ DEPLOYED Oct 26 19:05 CDT, read-back 468/468, 0 flagged — the 8 clean books CLOSED | ✓ deployed Oct 26 (154: 32 rewritten, 78 canon re-quotes, 48 slug) | ✓ BUILT S463e (97 phrase reads: 68 patched, 8 moved, 20 stay; 4 S440-changed Asc. Isaiah cards read: 3 stay, 1 rewritten) | live Test. XII = Track B repair (S410–S415), clean — no re-parse. S477 TEXT LANE DEPLOYED Oct 26 20:45 CDT (141 + 247 verses, 533/533 cards, 112/112 anchors); ✓ S478 SWEEP BUILT Oct 27: 73 cards (12 rebuilt, 12 moved, 15 patches, 35 cite fixes, 3 canon re-quotes), 71 member rows, 58 summaries; ✓ DEPLOYED Oct 27 17:30 CDT, read-back 73/73, 71/71, 58/58, 0 flagged — the two books CLOSED |
| Cepher additions / Sonnini | — | — | — | — | |

Parallel: the per-book sweeps are independent once their dumps are in hand. One session can run two or three
books through dump → regrade → map with agents, then Yoshi decides each map, then builds run in parallel, each
with its own migration and deploy script. Keep one deploy per book so a read-back failure is isolated.

Session prompts:
- S463a — Enoch close-out: the 59 STAND cards (rewrite in Yoshi's voice, Come-and-See) and the 641 glosses
  (map first: fit / don't fit / on a removed verse; rewrite only where the gloss no longer fits).
- S463b — Jubilees sweep (dump → regrade → map → decide → build → deploy → read-back).
- S463c — Apocrypha + 3 Maccabees sweep. S463d — Jasher sweep. S463e — the pseudepigrapha editions.
  S463f — Cepher additions and Sonnini.

## Phase 2 — Rebuild the cross-references and chapter-end cards (what the sweep can't patch)

The sweep fixes quotes, anchors and degraded prose on existing cards. Phase 2 is the rebuild: every chapter-end
card and its thread summary read as a whole against api/CHAPTER_END_CARD_CONTRACT.md and the voice skill —
coverage gaps filled (the June "thematic extras targets" and the Matt 17 extras card from S457), the four
never-applied S181 baselines retired on Yoshi's word, the 273 duplicate-slug housekeeping, and any card that
still names the reader to a document he can't see. Output of phase 2 is the card set the books are generated
from, so the books wait on it.

Then S458 Track A, per book, in this order: Enoch → Jasher → Jubilees. Generated from parsed/<book>.json plus
the fixed cards; only Yoshi's own front/back matter kept from the old .docx; "How to Read This Book" removed;
verified by content; saved over the original file name; Yoshi uploads to KDP. Jasher and Jubilees can be built
in parallel by two agents once both sweeps have landed, with a third agent that saw neither build doing the
verification.

## Phase 3 — The CAUTION layer (new feature; spec to be written before any build)

Yoshi's idea (Oct 22, his words): a caution menu where all the verses that are misconstrued often are bright
fire-orange — like a caution — with a number beside it, linked to an end card where we answer the caution: the
false teaching and the correction, with cross-references. It must be something that can be turned on and off.

What has to be decided before a line of code (short questions, one at a time, in the spec session):
1. The verse list — where it comes from. Candidates already in the library: the Red Lines' named passages
   (Galatians 3:13/3:24–25/3:28/4; Romans 11; Romans 6:14–15; Matthew 5:17; Acts 10/15; Colossians 2; Hebrews
   8; 1 Thessalonians 4:16–17; John 3:16; Ephesians 2:8; Mark 7:19; etc.), the Misconceptions & Objections
   Library in the Teaching Corpus, and the "Called God a Liar" cards on the Desktop. Start from those, Yoshi
   adds and prunes.
2. Card shape — one card per caution: the verse (quoted in full), the false teaching as the pulpit says it
   (named as what the reader was handed, victims-not-enemies), the correction (Come-and-See, cross-references
   quoted in full), and the thread back to the chapter-end card. Numbered; the number is the orange badge.
3. Toggle — a display preference beside hide-commentary / sacred-name mask (S172/S173 prefs pattern), default
   OFF for anonymous readers so a first-time Christian isn't met with a page of orange; ON for signed-in readers
   who opt in. Decide whether it's a free-tier feature or a paid one (it is the strongest "why this app" hook).
4. Rendering — the verse number or the verse text in fire-orange, badge with the caution number, tap → the
   caution card (a new card type, or a chapter-end card with a `caution` flag — the contract decides). Print
   edition: orange can't ship in the B&W xref book; use a ⚠ glyph + number there.
5. Data — a `cautions` table (id, number, verse ref, title, false_teaching_md, correction_md, thread id) or a
   flag on existing cards. Migration per Rule 10. Seeded from a JSON Yoshi can edit by hand.

Sessions: S463g — spec (write it as CAUTION_LAYER_SPEC.md in App/, with the verse list v1 for Yoshi to
redline). S463h — build behind the toggle, scratch, deploy, read-back. S463i — author the caution cards in
batches (Galatians first, then Romans, then the rest), each batch through the voice gate.

## Phase 4 — Remake the cross-reference books for KDP

The companion books (6x9; B&W at $25, premium color at $38 styled like the app — black pages, whiter text,
gold/green/purple pill boxes) are generated from the phase-2 card set, the same way Track A generates the
scripture editions: the app forms the book. Build only after phases 1–2 land for the books in scope, so the
printed cards match the app. If the Caution layer exists by then, the print edition carries the ⚠ + number
and a Caution appendix-free answer section at each chapter end (no appendix posture — the answer sits in the
chapter-end material, numbered).

Sessions: S463j — regenerate the companion interior(s) from the live cards (one read-back per book group),
verify card-by-card against the read-back, package per bookcraft-mechanics.md, save over the originals.
Color edition second, from the same source with the color styling applied.

## Voices — LAST
Re-record only chapters whose text changed (none in phases 1–4 unless a sweep changes a verse; cards aren't
read aloud). S462 (Michael/Olivia completeness check) is independent and can run any time.

---

## Decision log (append here as things get settled in conversation)
- 2026-10-22 S463a: two independent cold reads of every automatic re-pointing before anything was committed (pass 1 caught 41 wrong moves, pass 2 caught 5). Rule for every later sweep: a gloss may have been authored against the RIGHT verse already sitting at the old number — trace the old text, then read the gloss against both verses before moving it.
- 2026-10-22: order confirmed — sweep → rebuild cards → Caution layer → remake the xref books. Caution layer
  must be toggleable. Enoch/Jasher/Jubilees scripture editions (Track A) go out after their sweeps; Jasher and
  Jubilees may be built in parallel by agents once both sweeps have landed.
- 2026-10-23 S463a/S463b: `api/apply_migration.py` does not print Postgres NOTICEs, so a migration's summary line never shows on screen — every deploy script must run its own read-back and print the proof. Done for S463a2 and S463b.
- 2026-10-23 S463b: the Jubilees damage was split rows, not renumbering — a gloss lands on the first verse of the old row while its words sit in a later one; pre-existing quotations that run across the split get a citation range, not a move. The voice cold read of rebuilt prose caught an inherited reading (woman of Canaan as mercy case) that no marker regex would — keep the voice read in the chain for every later book.
- 2026-10-23 S463c: one migration for all 485 degraded Apocrypha cards (Yoshi: "what would be best for the app?" → one build, no marker/hyphen-chain split; checkpoint by book if the hard stop lands). Two new sweep checks for every later book: (a) the database slug printed as a citation ("the-wisdom-of-solomon 11:4" — 66 cards, 13 summaries here) and (b) SECOND quotations in standing notes — the regrade grades the first quotation only; the scratch read-back caught 8 more off the live text. Keep the post-run read-back grading every quotation in every note.
- 2026-10-23 S463c: the live Apocrypha text is a half-modernized register ("brings", "you hatest", "yours hand") — S454's 0.85-ratio diff called it faithful. Cards quote it as it stands; a word-level diff like S455b's canon pass is the way to see how far it sits from the KJV 1611 (text lane, not the card sweep).
- 2026-10-23 S463c (Yoshi): the hidden treasure and the pearl of great price (Matthew 13:44–46) are the seed of promise — the few, called treasure, gold of the dust of the earth — and the buyer of the field is Yahuah. Any card on those parables carries that reading.
- 2026-10-23 S463d: the degraded-marker regex must be run on the PROSE only (outside italic spans) — "every living substance" (Genesis 7:23) and "great substance" (Genesis 15:14) inside quotations are scripture, not jargon, and "substance" meaning goods in a summary's own prose (6295, 8940) is plain English; only the doctrine-noun ("verbatim in substance") is a marker. Ordinary English number compounds ("hundred-and-ten-year", "seventy-five-year-old") are not hyphen-chains. Both exclusions are in `s463d-sweep/regrade.py` for every later book.
- 2026-10-23 S463d: a dump's name filter must not use a stem that matches a sacred name — `yashar` matched every *Yashar'el* and inflated the "named only" set to 3,944; filter on the English book name (and check the count against the anchored set before reporting).
- 2026-10-23 S463d: the live Jasher text keeps "Israel", "Judah", "Jacob" in plain English inside the verses (Yahuah / Elohim restored); cards quote it as it stands — five S1xx-era cards had added *Yashar'el (Israel)* / *Yahudah (Judah)* inside a Jasher quotation and were re-quoted. The parenthetical rule governs the note's own prose, never the inside of a quotation.
- 2026-10-23 S463d: an em-dash aside naming a Jasher range before another book's italic quotation ("So the oath falls — Jasher 83:41-42 — *Numbers 14:30 text*") reads as a Jasher quotation to the reader and to the read-back; write "as Jasher 83:41–42 also records:" instead. Applied to 8958.
- 2026-10-23 S463d (Yoshi, 19:40): MODEL RULE for every later sweep session — drafting agents, gloss/stale reads and the two cold address reads run on Sonnet; the voice reads run on Fable; the model is named in each agent's output file name. The mechanical steps are scripts and model-independent. Reason: Fable usage; the chain's safety sits in the content checks and guards, not in the model. Written into S463E_SESSION_OPEN_PROMPT.md.
- 2026-10-26 S476 (Yoshi, 15:40): Testaments XII — FIX THE TEXT FIRST, THEN SWEEP. The S214 clean re-parse (pdfplumber, footnotes dropped) was never swapped in; the live parse is the June pypdf one. Order inside S463e: 2 Enoch / Apoc. Abraham / Adam-Eve ×3 / Asc. Isaiah sweep by the chain; Testaments XII text lane (re-parse → gate → swap → re-point S413/S212 cards by content) → then its sweep. 2 Baruch has the same OCR damage (~40%) — same rule when its turn comes.
- 2026-10-26 S476, 15:50 — SUPERSEDES the 15:40 line. The dump proved the live text = Desktop parsed JSON verse-for-verse (4,962/4,962, all four editions), and the live Testaments XII is NOT the June pypdf parse S214 measured (515 vv): it is the Track B repair (S410–S415, June 15; NEXT_SESSION_EXTRACANON_TRACK_B_REPAIR.md) — 142 ch / 997 vv, chapter counts match Charles's testaments exactly (7/9/19/26/7/10/7/9/8/8/20/12), 0 mid-sentence verse starts, 0 apparatus sigla. S413 authored its cards against this text. The S214 re-parse is moot. Remaining text-quality finding (text lane, not blocking): Charles adam-eve (book 784) 52% and 4 Maccabees 47% of verses break mid-sentence at line ends (Track B kept line breaks as verse breaks); 2 Baruch 4%; everything else ≤1%.
- 2026-10-26 S476 (Yoshi, 15:48): SCOPE for this sweep = the eight clean books in one map: 2 Enoch, Testaments XII, 2 Baruch, 3 Baruch (edition pseudepigrapha), 1 & 2 Adam-Eve (adam-eve-conflict), Apocalypse of Abraham, Ascension of Isaiah. HELD for the text lane first (line-end verse breaks, ~50% of verses): Charles adam-eve (book 784) and 4 Maccabees (789) — fix text, then sweep in one pass. One migration per edition.
- 2026-10-26 S477 (merge rule, decided and applied): a verse boundary stands where Charles's line ends with . ! ? : or ; (closing quotes/brackets may follow) or where the OCR dropped a question mark before a capitalised next line; everything else was a print line, joined with a space (or directly after a hyphenated word). ':' and ';' count as boundaries because Charles's own verse divisions sit on them (4 Macc 5:14/15, 6:31/32 …). Sentences that run across a chapter break move to the chapter whose standard division carries them (Vita 46:1 "(Then) was the sun darkened…"; 4 Macc 14:1 "nay more…"). Verses renumbered 1..n per chapter; chapters kept; no word changed.
- 2026-10-26 S477 (Rule 10 for a text merge): each merged verse keeps the id of its first old line; every table that points at verses is re-pointed from the swallowed lines to the kept row before the swallowed rows are deleted (a missed FK fails loud on RESTRICT); cards collide on (source, target, source) → merge the loser into the survivor (0 here); verse_highlights word offsets shift by the words now ahead of the old line; renumber via negative numbers so no (chapter, number) collision. Guards: every old verse must match the read-back text and nothing else may exist in the book.
- 2026-10-26 S477 (cold reads): the narrative text of 4 Maccabees (the martyrdom chapters) cannot be passed through the chat — the reply is blocked. The two cold reads of that book ran on an addresses-only packet (parts, cards, anchors); join quality was checked by script instead (0 doubled words at 220 seams, 6 hyphen joins all real words, every letter of the old text present in order). A full textual cold read of 4 Macc is possible in a fresh session only if Yoshi attaches `s477-text-lane/cold_packet_4macc_seams.txt` himself (an attachment reaches the readers without passing through the reply).
- 2026-10-26 S477 (scratch): Claude's shells have no route to Postgres and the container cannot see the Desktop; PGlite (Postgres 18 in WASM, `npm install @electric-sql/pglite` in $HOME/pglite, no pg_trgm) runs the scratch next to the data on the Mac — `s477-text-lane/seed477.mjs` seeds from the read-back, runs the migration twice, reads back, and tests both guards (S477_TAMPER=text|extra).
- 2026-10-27 S478 (Yoshi, 13:55): "the substance of which X is the shadow" wording (Colossians 2:17 / Hebrews 10:1 echo) in card prose is patched to plain words, not kept as scripture English — 63464/63469/63470/63619/63622/63625 + threads 15727/15755. Rule for later sweeps: every "substance" in the prose gets rewritten; only inside a quotation is it scripture.
- 2026-10-27 S478: the S477 merge left the OLD verse numbering inside card/summary prose (cards were re-pointed, prose was not) — every text-lane merge must be followed by a stale-citation pass (`s478-sweep/stale_cites.py`: impossible verse numbers → the map; otherwise trace the quoted words into the live text; a citation that merely matches its own new address is not stale). Hyphen-chains in otherwise clean S4xx cards ("the standing-before-kings-as-a-testimony") are patched sentence-only, not rebuilt. Thread summaries anchored in ANOTHER book that cite the swept book (thread 413, Matthew) must be included in the summary fixes — gen_sql's edition filter would drop them.
- 2026-10-27 S478: PGlite re-runs the same migration in ONE connection, so a `CREATE TEMP VIEW` collides on run 2 — migrations now use `CREATE OR REPLACE TEMP VIEW`. `$HOME/pglite` is per-session on the Cowork VM: `npm install @electric-sql/pglite` again when it is missing.
- 2026-10-27 S478 (Yoshi, 17:28): a deploy that dies at `asyncpg.connect` with "connection was closed in the middle of operation" (before the migration starts; nothing applied) is the Render Postgres IP allowlist — his Mac's IP had changed. Fix: update the IP in the Render database's access control (his click), then re-run the same paste. Check that first, before suspecting the database.
- 2026-10-28 S478 (Yoshi, 12:07): VOICES — Ivan (am_onyx, the deep voice) STAYS and the Liam+Echo blend liam50_echo50 is ADDED as a separate voice, not a replacement. Three voices still to record in full: Ivan (am_onyx), the blend (liam50_echo50 — needs a display name and an app slot), George (bm_george, the British voice). Each needs its names tuned by ear first (names rolls → his picks → IPA_BY_VOICE), the way Echo and Sky were done in S470. Compare clips: audio/_ivan_compare/{am_onyx,liam50_echo50}.mp3 (delete when done). Olivia and Sky are complete.
- 2026-10-28 S478 (Yoshi, 12:09) — PRIORITIES, his words (not necessarily in this order): (1) make sure we have ALL the scriptures, ALL the cross-references and ALL the end cards ready to go — a completeness audit across the whole library (every edition/book live, every chapter with its chapter-end card and thread summaries, no gaps) = finish phase 1 (S463f Cepher additions + Sonnini) and phase 2 (rebuild cards; coverage gaps; S181 baselines; duplicate slugs); (2) the two cross-reference books (phase 4, from the finished card set); (3) fix the Enoch, Jasher and Jubilees scripture editions (S458 Track A, from the swept cards); (4) then other ways to bring in income. The voices work (Ivan / liam50_echo50 / George — names tuning + recording) is QUEUED behind these, not next. Next session opens on (1): a library-wide inventory first — what is live, what has cards, what has end cards, what is missing — before any build.
- 2026-10-28 S478 (Yoshi, 13:19) — NEW FEATURE, queued (after priorities 1–3): ALEPH-BET in the Bible app. His words: "we should have every form
  of aleph bet from modern to paleo to pictograph hebrew, everything that exists, and in the remove the nikkudot area it should list / spell out
  what the consonants are, and when you point the arrow over one of the letters in that chart it pulls up a window showing that letter, tells
  you what it is and shows every form of it." Spec sketch (to be written as ALEPH_BET_SPEC.md before any build):
  (a) one letters table — 22 letters (+5 finals): name, sound, number value, pictograph meaning (ox, house, camel…), forms: pictograph /
      proto-Sinaitic, paleo-Hebrew (Phoenician script), Samaritan, square "Ashuri" (SBL Hebrew, already in the app), Rashi script, modern
      cursive; (b) a full aleph-bet chart page (reference, free tier?); (c) in the "Remove the vowel additions?" panel the consonants of the
      word listed letter by letter — letter, name, pictograph meaning — each a hover/tap target that opens the letter card with every form;
      (d) in the letter card, the forms side by side with the letter's name and meaning. FREE sources only: Unicode Phoenician block U+10900
      (paleo) + Samaritan block with Noto Sans Phoenician / Noto Sans Samaritan (SIL OFL fonts); square = SBL Hebrew; Rashi + cursive need an
      OFL font (check Culmus / Noto). Pictographs have NO Unicode: draw the 22 proto-Sinaitic signs ourselves as SVG from the standard
      scholarly chart — NOT AI-generated glyphs (S202/S204 lesson: the Grok "paleo" divider was invented and was pulled). The API already has
      /v1/skeleton/{lemma} for the consonants; the letter table is static JSON in the app, no migration needed for (a)–(d) unless the chart
      page becomes a tiered feature.
- 2026-10-28 S478 (13:21): ALEPH_BET_SPEC.md written (data table, free sources, where it shows, build order, 3 questions for Yoshi). Build still queued behind priorities 1–3.
- 2026-10-28 S478 (Yoshi, 13:26): ALEPH-BET MOVED TO NOW — it is the current work, ahead of the completeness audit. Decisions: meanings = the standard chart's readings in plain English, both readings shown where two are accepted, his own wording replaces a line whenever he teaches it; forms = the full timeline per letter incl. OLDER VARIANTS (proto-Sinaitic pictograph → early paleo Gezer/Moabite → late paleo Siloam/Lachish → Aramaic/Elephantine → Samaritan → square scroll (crowns) → square print → Rashi → cursive); the pictograph set is drawn first, the dated inscriptional stages as a second pass. Build starts S478: data table + fonts + letter card; chart page, vowel-panel consonant list and the drawings continue in S479 (open prompt rewritten).
