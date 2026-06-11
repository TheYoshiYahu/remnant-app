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
