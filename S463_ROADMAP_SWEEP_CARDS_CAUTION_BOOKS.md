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
| Jasher | — | — | — | — | S450 moved 20 off blob rows; text was faithful |
| 2 Enoch / Test. XII / Apoc. Abraham / Adam-Eve / Asc. Isaiah | — | — | — | — | confirm which Testaments XII parse is live (S214 vs S413) first |
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
