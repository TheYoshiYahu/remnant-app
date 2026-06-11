# EXTRA-CANONICAL CROSS-REFERENCE FAN-OUT — plan, allocation, receipts

"It Ain't New" layer: Come-and-See cross-references weaving the extra-canonical books to the
Tanakh + NT + each other. Worktree `/tmp/extracanon-xref-wt`, branch `feat/extracanon-xref`.
Greenfield confirmed (0 threads anchored on any non-canon edition; live max band 9546 @ setup).

## BAND ZONE — 50000+ (clear of NT 5xxx–9xxx AND the concurrent Tanakh fan-out at 10000+)
Per book a contiguous zone; per chapter a 25-wide sub-band, threads step 3 from the base.

| Book / edition                       | session migration                                  | band base → per-chapter            |
|--------------------------------------|----------------------------------------------------|------------------------------------|
| 1 Enoch (`enoch`/`1-enoch`, 108 ch)  | session250_1enoch_extracanon_cross_references.sql  | ch N = 50000 + (N-1)*25 (→52675)   |
| Jubilees (`jubilees`, 50 ch)         | session251_jubilees_extracanon_cross_references.sql| ch N = 53000 + (N-1)*25 (→54225)   |
| Jasher (`jasher`, 91 ch)             | session252_jasher_extracanon_cross_references.sql  | ch N = 55000 + (N-1)*25 (→57250)   |
| Apocrypha (KJV, 14 books)            | session253+ (per-book or per-edition)              | 58000+                             |
| adam-eve-conflict (2 bks)            | session26x                                         | 62000+                             |
| apocalypse-of-abraham (32 ch)        | session26x                                         | 63000+                             |
| ascension-isaiah (11 ch)             | session26x                                         | 64000+                             |
| sonnini-acts-29 (1 ch)               | session26x                                         | 65000                              |
| apostolic_fathers (lightfoot, 13)    | session27x                                         | 70000+                             |
| mrjames-apocryphal-nt (5)            | session27x                                         | 75000+                             |
| josephus (41) — LOW PRIORITY/defer   | session28x                                         | 80000+                             |

Session numbers: verify free on origin/main before each book (228 was max at setup; epistles
march 229+, so 250+ block reserved for extra-canon). ON CONFLICT makes prod idempotent regardless.

## SKIP — corrupted text (pseudepigrapha-charles-vol2 edition), pending Track B repair
`2-enoch`, `2-baruch`, `3-baruch`, `testaments-xii`, `4-maccabees`, `adam-eve` (the tiny 16ch/20v
one). Do NOT cross-reference garbled text. Build everything else; revisit after repair lands.
(NOTE: `adam-eve-conflict` edition — the *Conflict of Adam & Eve* — is CLEAN and separate; build it.)

## METHOD (proven, this session)
Per-chapter minion authors structured JSON (schema in MINION_BRIEF) → `render_fragment.py` renders
the proven `WITH input(...) VALUES ... INSERT` SQL → gates → fold → commit → push → apply → reconcile.
- Minions write JSON to `scratch_xref_extracanon/json_<book>_<NN>.json`; never paraphrase quotes.
- GATES: `render_fragment.py` → pglast parse → `verify_fidelity.py <glob>` (target quotes faithful)
  → `resolve_check.py <ed> <book> <frags>` (0 unresolved vs live DB) → `_xref_audit.py` FULL-LIBRARY
  [PASS] for the migration. Then `fold_fragment.py` → apply (`api/apply_migration.py`, asyncpg,
  sslmode=require, idempotent) → reconcile `slug LIKE '<book>-%'` count + per-chapter group-by.
- Source text already carries restored names (incl. "Son of Adam") — verbatim quotes pass fidelity.

## 1 ENOCH PACK PLAN (by the five books of Enoch)
- Pack 1: ch1–16   (Watchers: oracle+Jude quote, the fall on Hermon, intercession, commission)
- Pack 2: ch17–36  (cosmic journeys, prison of stars, Sheol, tree of life ch24–25)
- Pack 3: ch37–51  (Parables I: Son of Adam ch46/48, throne of glory, books opened, resurrection)
- Pack 4: ch52–71  (Parables II: Elect One judges, kings too late, oath, Enoch's translation)
- Pack 5: ch72–82  (Astronomical: the luminaries, 364-day order, the moedim by the lights)
- Pack 6: ch83–90  (Dream Visions: the Flood, the Animal Apocalypse, 70 shepherds, white bull)
- Pack 7: ch91–108 (Epistle: Apocalypse of Weeks, two ways, woes, resurrection, birth of Noah)

## RECEIPTS (append per pack)
- (setup) harness built + smoke-tested green: render OK, pglast 5 stmts, fidelity 2/2, resolve 0
  unresolved, greenfield 0 threads. Audit glob `session2*_*_extracanon_cross_references.sql` added.

## RECEIPT — Pack 1 (1 Enoch ch1–8) ✅ LIVE IN PROD
- Applied 2026-06-11. EXACT reconciliation: **27 `1-enoch-*` threads / 104 members**, band
  50000–50184, per-chapter 4/3/3/2/4/3/4/4, 0 orphan members. Migration
  `session250_1enoch_extracanon_cross_references.sql` (149 stmts, idempotent ON CONFLICT).
- Five gates green: fidelity 104/104, pglast 149 stmts, resolve_check 0 unresolved,
  FULL-LIBRARY [PASS], 27 unique slugs / 0 dups.
- Keystone thread: 1 Enoch 1:9 = the prophecy **Jude 1:14–15 quotes by name** ("It Ain't New").
- Local commits: harness `85b660c`, Pack 1 `73a87e3`.
- ⚠️ GIT PUSH BLOCKED: osxkeychain went non-interactive ("Device not configured" /
  "terminal prompts disabled") — same condition as the S228 1-Corinthians session end.
  origin/main still at 47a9e48. Commits are LOCAL-ONLY in /tmp/extracanon-xref-wt but PROD
  HAS THE DATA. TO FINISH PUSH: from the worktree with the GUI keychain unlocked, run
  `git push origin HEAD:main` and verify origin/main == local HEAD. Prod is authoritative meanwhile.

## RECEIPT — Pack 2 (1 Enoch ch9–16) ✅ LIVE IN PROD
- Applied 2026-06-11. EXACT: cumulative **63 `1-enoch-*` threads / 240 members**, band 50000–50384,
  per-ch (9-16) 5/6/4/4/5/4/4/4, 0 orphans. +36 threads/136 members this pack. Commit `87b3039`.
- Five gates green (fidelity 240/240, pglast 337 stmts, resolve 0 unresolved, FULL-LIBRARY PASS,
  63 unique slugs/0 dups). Watchers=Gen 6 woven heavily; Azazel→Lev 16 scapegoat (ch10);
  origin-of-evil-spirits→Matt 12 (ch10,15-16); ch11 edition-numbering anomaly handled (=std 10:11-22);
  Isaiah-2/Torah-stands guard on "all nations worship" (ch11).
- ⚠️ Push still blocked (keychain). origin/main 47a9e48; local HEAD `87b3039`. Prod authoritative.
- EDITION ANOMALY for later packs (per S232): this parse's ch24 holds the real throne-mountain +
  tree of life; **ch25 text is a DUPLICATE of ch15 (watchers-intercession), mislabeled** — cross-ref
  what the text literally says, do NOT build a tree-of-life thread on ch25; ch26 v7-10 another dup.

## RECEIPT — Pack 3 (1 Enoch ch17–24) ✅ LIVE IN PROD
- Applied 2026-06-11. EXACT: cumulative **94 threads / 355 members**, band 50000–50584,
  per-ch (17-24) 5/5/3/4/3/4/3/4, 0 orphans. +31/115 this pack. Commit `67b8f7b`. Five gates green
  (fidelity 355/355, pglast 499 stmts, resolve 0 unresolved, FULL-LIBRARY PASS, 94 slugs/0 dups).
- Prison-of-stars bound-till-judgement (18-21); demon-sacrifice Deut32/Lev17/1Cor10 (19); seven
  archangels Tobit12/Dan10/Rev8 (20); Sheol's hollows Luke16/Gen4:10 (22); tree of life Gen2/Ezek47/Rev22 (24).
- DATA ARTIFACT (pre-existing Enoch parse): ch17/18 verses overlap/duplicate in the source edition
  (En17:8-21 ≈ En18:1-14). Xrefs anchor to the verses that EXIST in the live DB (resolve 0 unresolved),
  so the apparatus is valid; the chapter-split misalignment is a separate parse-fix flag for Yoshi.
- Push still keychain-blocked. origin/main 47a9e48; local HEAD `67b8f7b`. Prod authoritative.

## RECEIPT — Pack 4 (1 Enoch ch25–36) ✅ LIVE — BOOK OF THE WATCHERS (ch1-36) COMPLETE
- Applied 2026-06-11. EXACT: cumulative **131 threads / 493 members**, band 50000–50881, 0 orphans.
  per-ch(25-36) all 3 except ch33=4. +37/138 this pack. Commit `ff77ab3`. Five gates green
  (fidelity 493/493, FULL-LIBRARY PASS, 131 slugs/0 dups, resolve 0 unresolved).
- ⚑ PARSE-AUDIT FLAG for Yoshi (enoch.json, ch24-28 block): the throne-mountain + TREE-OF-LIFE
  content is DUPLICATED/SHIFTED across parsed ch24, ch26:7-10, ch27, ch28; parsed **ch25 = a
  verbatim duplicate of ch15** (Watchers-intercession), mislabeled with a throne/tree title. The
  xref minions authored honestly on each chapter's LITERAL dumped text and self-linked the
  duplicates (fidelity-safe, resolve 0 unresolved) — but a data-layer re-chaptering of the 24-28
  block against standard Charles numbering is warranted (extends the S232 ch25-mislabel finding).
- Push still keychain-blocked. origin/main 47a9e48; local HEAD `ff77ab3`. Prod authoritative.

## ▶️ NEXT = the SIMILITUDES / Book of Parables (ch37-71) — HIGH VALUE (Son of Adam / Elect One).
Pack 5 ch37-44, Pack 6 ch45-51 (46=Son of Adam beside Head of Days→Dan7 kaph; 48=named before
creation; 51=resurrection), Pack 7 ch52-62, Pack 8 ch63-71. KAPH discipline now IN PLAY.

## RECEIPT — Pack 5 (1 Enoch ch37–44, Similitudes opens) ✅ LIVE IN PROD
- Applied 2026-06-11. EXACT: cumulative **171 threads / 634 members**, band 50000–51087, 0 orphans.
  per-ch(37-44) 4/5/5/6/4/6/5/5. +40/141. Commit `3c4c785`. Five gates green (fidelity 634/634,
  FULL-LIBRARY PASS, resolve 0 unresolved). Elect One/Righteous One enthroned (Isa 42:1/53:11/11:2,
  Matt 25:31); four presences (Isa 6/Dan 7:10/Rev 5); Wisdom-found-no-place→Logos (42, Prov 1/John
  1:10-11/Sirach 24/Baruch 3). Son-of-Adam NAMED-title kept distinct from Dan 7:13 kaph "like" —
  minions correctly reserved the cloud-coming kaph for ch46/62; Head-of-Days=Father, Elect-One=Formed
  Son; four presences framed as created servants (not-a-created-angel boundary guarded).
- Push still keychain-blocked. origin/main 47a9e48; local HEAD `3c4c785`. Prod authoritative.

## RECEIPT — Pack 6 (1 Enoch ch45–51, Son-of-Adam CENTERPIECE) ✅ LIVE IN PROD
- Applied 2026-06-11. EXACT: cumulative **206 threads / 781 members**, band 50000–51265, 0 orphans.
  per-ch(45-51) 6/4/5/5/4/5/6. +35/147. Commit `bb525ab`. Five gates green (fidelity 781/781,
  FULL-LIBRARY PASS, resolve 0 unresolved).
- ch46 Son of Adam beside the Head of Days — Dan 7:9-14 kaph "one LIKE the Son of Adam" kept VERBATIM
  and explicitly distinguished from Enoch's NAMING (both land on Yahusha); Matt 26:64/Rev 1:13-14.
  ch48 named before creation→John 1/Rev 13:8/Prov 8/Isa 49/Mic 5:2. ch47 books of the living→Dan
  7:10/Rev 6:9-11/20:12. ch51 resurrection→Dan 12:2/John 5:28-29/Isa 26:19/Ezek 37/Hos 13:14.
  Head-of-Days=formless Father, Elect-One=Formed Son ordered under Him; modalism/created-angel/
  mere-man all guarded; election-before-creation. ⚑ ch45:1 reads "third parable" (Charles="second")
  — source-edition text variant flagged.
- Push still keychain-blocked. origin/main 47a9e48; local HEAD `bb525ab`. Prod authoritative.

## ▶️ RESUME POINT (session wrap @ Pack 6): 1 Enoch ch1-51 LIVE (206 threads/781 members).
NEXT = Pack 7 ch52-62, Pack 8 ch63-71 (finish Similitudes: 52 metals melt, 54-56 valley of
judgement/Azazel's host, 60-62 Noah+the Son of Adam judges the kings, 62-63 kings too late→Isa 53/
Rev 6:15-17, 69 the oath/hidden name, 70-71 Enoch translated→Gen 5:24/Heb 11:5). Then Astronomical
72-82 (moedim by the lights→Gen 1:14/Jub 6), Dream Visions 83-90 (Animal Apocalypse, 70 shepherds,
white bull→Ezek 34/37/Dan 7), Epistle 91-108 (Apocalypse of Weeks→Dan 2:44/9, two ways→Deut 30,
woes→Isa 5/James 5, resurrection→Dan 12, birth of Noah 106-107→Gen 5:28-29/6:8). Relaunch a Workflow
pack using the pack6 script pattern (per-chapter CONTEXT map + the Son-of-Adam/kaph framework block;
KEEP authoring from the literal dumped text — this edition's chapter numbering can shift vs Charles).
Then Jubilees (session251 @53000), Jasher (session252 @55000), Apocrypha (@58000+), etc.

## RECEIPT — Pack 7 (1 Enoch ch52–62) ✅ LIVE IN PROD
- Applied 2026-06-11. EXACT: cumulative **248 threads / 930 members**, band 50000–51531, 0 orphans.
  per-ch(52-62) 4/3/3/4/5/3/4/3/4/5/4. +42/149. Commit `b6c55aa`. Five gates green (fidelity 930/930,
  FULL-LIBRARY PASS, resolve 0 unresolved).
- Metals melt→Dan 2:35/44 stone-kingdom (52); valley of judgement/Azazel's host→Rev 20:10/Jude 6
  (53-54, Noachic fragments noted); no-second-flood oath→Gen 8:21/9:11 (55); the dispersion regathered
  →Isa 11:11-12/27:13/43:5-6/Ezek 37 TWO-HOUSE (57); eternal light→Isa 60:19/Dan 12:3 (58);
  Leviathan & Behemoth→Job 40-41/Isa 27:1/2Esd 6 (60); measuring cords→Zech 2/Rev 11 (61); kings see
  the Son of Adam too late, righteous eat with him→Isa 53/Rev 1:7/6:15-17/19:9, Dan 7:13 kaph kept (62).
- Push still keychain-blocked. origin/main 47a9e48; local HEAD `b6c55aa` (8 commits ahead). Prod authoritative.

## RECEIPT — Pack 8 (1 Enoch ch63–71) ✅ LIVE — BOOK OF PARABLES (ch37-71) COMPLETE
- Applied 2026-06-11. EXACT: cumulative **284 threads / 1072 members**, band 50000–51762, 0 orphans.
  per-ch(63-71) 4/3/5/3/4/3/5/4/5. +36/142. Commit `340c8c7`. Five gates green (fidelity 1072/1072,
  FULL-LIBRARY PASS, resolve 0 unresolved).
- Kings too late (63→Prov1:28/Luke13:25/Wis5); Watchers judged (64,68→Jude6/2Pet2:4); Noah/Flood
  (65-67→Gen6-8/2Pet2:5/1Pet3:20); hidden oath/creative Word + Son-of-Adam's name (69→Ps33:6/Job38:8/
  Prov8:27/John1:3/Heb1:3/Phil2:9); Enoch's translation (70→Gen5:24/Heb11:5/2Kgs2); ascent to Head of
  Days (71→Dan7:9/Isa6/Ezek1).
- ⚑ ch71 CRUX handled by ABSENCE: this edition OMITS the "thou art the Son of Adam" address (Charles
  71:14-17). Minion framed Enoch strictly as the translated righteous seer ("carried up to behold the
  Son of Adam; he is not made into Him"), Son of Adam = the Formed Messiah; kaph kept. If 71:14+ is
  spliced in later, it needs a dedicated guarded thread.
- NOTE: concurrent Tanakh fan-out (S301) uses band 20000-49999 / sessions 301+ → NO collision with
  extra-canon (50000+/session250). Keychain push blocked session-wide (Tanakh worktree too).
- Push blocked. origin/main 47a9e48; local HEAD `340c8c7` (9 commits ahead). Prod authoritative.

## RECEIPT — Pack 9 (1 Enoch ch72–82) ✅ LIVE — ASTRONOMICAL BOOK COMPLETE
- Applied 2026-06-11. EXACT: cumulative **323 threads / 1196 members**, band 50000–52037, 0 orphans.
  per-ch(72-82) 3/3/4/3/3/3/4/4/4/4/4. +39/124. Commit `670a8d9`. Five gates green (fidelity 1196/1196,
  FULL-LIBRARY PASS, resolve 0 unresolved).
- The moedim written into creation by the lights (72-74→Gen 1:14-16/Ps 104:19/Jub 6); 364-day solar
  reckoning + intercalary days (74-75→Jub 6:32); winds/quarters (76-77→Job 38/Gen 2:10); moon phases/
  new moon (78→Ps 81:3/Isa 66:23); CORRUPTED reckoning→Dan 7:25 change-the-times + Deut 4:19 host-of-
  heaven idolatry (80); heavenly tablets + teach-thy-children (81→Exod 32:32/Mal 3:16/Deut 6:6);
  keep-the-reckoning blessing (82→Lev 23/Ps 1/Jub 6:17). Ties to Yoshi's Appointed Times framework.
- ⚑ GATE CAUGHT A REAL ERROR: ch79 self-link mis-cited 1 Enoch 74:12 while quoting v11's text
  ("deficient in the intercalated months by thirty days"); fidelity flagged it, fixed tgt_v 12→11
  before apply. (Validates the gate; this edition's ch74 lunar figures are tangled — see ch74 notes.)
- Push blocked. origin/main 47a9e48; local HEAD `670a8d9` (10 commits ahead). Prod authoritative.

## RECEIPT — Pack 10 (1 Enoch ch83–90, ANIMAL APOCALYPSE) ✅ LIVE IN PROD
- Applied 2026-06-11. EXACT: cumulative **356 threads / 1343 members**, band 50000–52262, 0 orphans.
  per-ch(83-90) 4/4/4/[86 SKIP]/3/4/7/7. +33/147. Commit `5960e6c`. Five gates green (fidelity
  1343/1343, FULL-LIBRARY PASS, resolve 0 unresolved).
- Flood from heaven + Enoch intercessor (83-84→Gen6-8/Amos7/Dan4); white bull Adam/seed-war
  (85→Gen2/Matt13:25-38/1Jn3:12); Watchers as fallen stars + giants (87-88→Gen6/Jude6/Rev9:1);
  the long vision (89 sheep=Israel, the house/temple, sheep blinded+scattered, 70 shepherds=false
  shepherds→2Kgs17/Ezek34/Jer23/Zech11; 90 opened eyes, great horn, books opened→Dan7:10, NEW
  HOUSE=New Jerusalem→Rev21, the great WHITE BULL=Messiah + all made white→Ezek34:23/37:21-28/
  Isa11:6/65:25 — two-house restoration, highest-value).
- ⚑ ch86 SKIPPED (corrupted in this parse): the genuine Watchers-descent content (star falls,
  fallen stars become bulls, giants as elephants/camels/asses) is MISSING — replaced by misplaced
  ch90 ravens/lambs filler with v3-v10 byte-for-byte duplicates of v1. Minion returned a structured
  `_blocked` analysis (in json_1enoch_86.json) rather than build false apparatus. Flagged for Track B
  repair; re-run the ch86 minion after the source is fixed from a clean Charles edition.
- Push blocked. origin/main 47a9e48; local HEAD `5960e6c` (11 commits ahead). Prod authoritative.

## ✅✅ RECEIPT — Pack 11 (1 Enoch ch91–108, EPISTLE) — 1 ENOCH COMPLETE-LIVE IN PROD
- Applied 2026-06-11. FINAL 1 ENOCH: **423 `1-enoch-*` threads / 1613 members**, band 50000–52675,
  0 orphans, 0 unresolved. 104 chapters with apparatus. Commit `e2cbf8b`. Five gates green
  (fidelity 1613/1613, FULL-LIBRARY PASS, resolve 0).
- Epistle: calendar/books + alter-not-the-times (92→Dan7:25/Jub6:36); two ways (93-94→Deut30/Ps1/
  Matt7:13); woes on oppressors/rich/idolaters/word-perverters (95-99→Isa5/Amos/James5/Jer8:8);
  day of slaughter (100→Rev14:20/Joel3); dead-righteous-vs-sinners + resurrection (102-104→Mal3-4/
  Dan12:2-3/Wisdom3/Matt13:43, names-written-never-added election); Noah's remnant (107→Gen6:8-9/
  2Pet2:5); book of the righteous (108→Mal3:16/Dan12:1/Ps69:28/Rev3:5).
- ⚑ 4 CHAPTERS SKIPPED (corrupt in this enoch.json parse — all flagged for Track B repair):
  ch86 (genuine Watchers-descent missing, replaced by misplaced ch90 ravens/lambs + byte-dup filler);
  ch101 (vv4-100 cyclic byte-for-byte duplicates; only vv1-3 coherent); ch106 (birth-of-Noah missing,
  replaced by misplaced Watchers cosmic-journey material); ch91 (the WHOLE chapter collapsed into one
  run-on verse 1 — the minion HALLUCINATED vv11-19; the resolve_check gate caught all 13 fabricated
  source anchors before apply). The Epistle's chapter NUMBERING is also shifted vs Charles throughout
  (minions authored honestly from the literal dumped text of each chapter).
- ⚑ GATE VALUE PROVEN: resolve_check (src+tgt must exist in live DB) is the catch for minion
  hallucination of source anchors; verify_fidelity (target quote must match parsed text) is the catch
  for paraphrase/wrong-verse. Both are essential — fidelity alone passed the hallucinated ch91.
- Push blocked. origin/main 47a9e48; local HEAD `e2cbf8b` (12 commits ahead). Prod authoritative.

## ▶️ NEXT BOOK = JUBILEES (session251 @ band 53000; edition 'jubilees' book 'jubilees', 50 ch).

## RECEIPT — Jubilees Pack J1 (ch1–8) ✅ LIVE IN PROD  [NEW BOOK, session251]
- Applied 2026-06-11. EXACT: **46 `jubilees-*` threads / 168 members**, band 53000–53187, per-ch
  5/5/7/5/6/6/7/5, 0 orphans. Migration `session251_jubilees_extracanon_cross_references.sql` (232
  stmts). Commit `f94f71e`. Five gates green (fidelity 168/168, FULL-LIBRARY PASS, resolve 0).
- Sinai prologue + two-house RESTORATION (1→Deut30/Jer31/Ezek36/Rom2:29); creation+Sabbath eternal
  sign (2→Gen1-2/Exod20:11/31:13-17); Eden-as-sanctuary (3→Gen2-3/Lev12); Adam's line+Enoch scribe
  (4→Gen4-5/Jude14); Watchers+Flood (5→Gen6/1En6-10); NOAH'S FEAST OF WEEKS + 364-day year + no-blood
  (6→Gen9/Lev23:15/Exod19/Dan7:25); Noah's vineyard (7→Gen9:18-27); Shem the centre/Zion (8→Gen10/
  Ezek5:5/1En26). Genuine live-1-Enoch self-links throughout (the "It Ain't New" cross-weave).
- ⚑ GATE CAUGHT 2 edition-verse-gap anchors (jub6:7→6:6 no-blood, jub8:19→8:18 Shem-centre — those
  verse numbers are GAPS in this parsed Jubilees edition; many chapters skip numbers where clauses are
  merged). Minions must cite ONLY verse numbers present in the dump; resolve_check is the backstop.
- Push blocked (keychain). origin/main 47a9e48; local HEAD `f94f71e` (13 commits ahead). Prod authoritative.

## ▶️ RESUME (session wrap): 1 ENOCH COMPLETE (423/1613) + JUBILEES ch1-8 (46/168) all LIVE.
NEXT = Jubilees Pack J2 ch9-16 (Babel/Mastema 10→Gen11/1En10; Abraham birth/idolatry/call 11-12→
Gen11-12; Canaan/Egypt/covenant-of-pieces 13-14→Gen12-15; CIRCUMCISION eternal sign 15→Gen17; Isaac
promised/Sodom/Tabernacles-instituted-by-Abraham 16→Gen18-21/Lev23:34). Then J3 ch17-24, J4 25-32
(ch30 seed-kept-separate/no-intermarriage→Gen34; ch31 Levi+Judah blessed), J5 33-40, J6 41-50 (ch49
PASSOVER→Exod12, ch50 Sabbath/Jubilee laws). Then Jasher (session252 @55000, 91 ch, edition jasher
book jasher — narratives retold from Genesis/Exodus), then Apocrypha (@58000), adam-eve-conflict,
apocalypse-of-abraham, ascension-isaiah, sonnini, apostolic-fathers (@70000), mrjames, josephus(defer).
SKIP the 6 corrupt pseudepigrapha books. METHOD: pack-J1 workflow script pattern + per-chapter CONTEXT
map + MINION_BRIEF_JUBILEES.md; gate render→pglast→verify_fidelity→resolve_check jubilees jubilees→fold→
audit→recon.py jubilees jubilees jubilees. ⚠️ FIRST: retry `git push origin HEAD:main` from the worktree
with keychain unlocked — 13 commits (85b660c..f94f71e) need to land on origin/main (still at 47a9e48).

## RECEIPT — Jubilees Pack J2 (ch9–16) ✅ LIVE IN PROD
- Applied 2026-06-11. EXACT: cumulative **85 `jubilees-*` threads / 311 members**, band 53000–53387,
  per-ch(9-16) 4/5/5/5/5/5/5/5, 0 orphans. +39/143. Commits `238d0ca` + anchor-fix `f450132`.
  Five gates green (fidelity 311/311, FULL-LIBRARY PASS, resolve 0).
- Division/bounds (9→Gen10/Deut32:8/Acts17:26); Babel + Mastema/demons-from-giants (10→Gen11/1En10+15
  seed-war self-links); Abraham's election out of idolatry (11-12→Josh24:2/Acts7:2/Gen12:1); Bethel/
  Egypt/Lot + Melchizedek tithe-for-ever (13→Gen12-14/Heb7:2); COVENANT OF THE PIECES faith→righteousness
  (14→Gen15/Rom4/Gal3); CIRCUMCISION eternal sign (15→Gen17/Lev12:3/Rom4:11); Isaac born + Abraham keeps
  SUKKOT (16→Gen18-21/Lev23:33-43).
- ⚑ GATE LESSON (new): resolve_check validates member src/tgt but NOT thread anchor verses. The ch15
  circumcision thread anchored on jub15:14 (a verse-number GAP) → its INSERT...SELECT matched no row and
  the thread silently dropped (DB 84 vs migration 85 caught it at reconcile). FIX = re-anchor 14→13 +
  rebuild. NEW GATE: `anchor_check.py <edfile> <book> <jsons>` verifies all thread anchors exist in the
  parse — RUN IT EVERY PACK before folding (esp. for editions with merged/gapped verse numbers like this
  Jubilees parse). Also fixed jub13:25→13:26 (member src gap, caught by resolve_check) this pack.
- Push blocked. origin/main 47a9e48; local HEAD `f450132` (15 commits ahead). Prod authoritative.
