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
