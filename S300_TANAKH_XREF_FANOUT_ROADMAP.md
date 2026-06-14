# S300 — TANAKH cross-reference fan-out roadmap

The standing plan for building the full-library cross-reference apparatus across the **39 books
of the Tanakh** (the Hebrew Scriptures) in Yoshi's Remnant Bible. **This is the FOUNDATION layer
of the whole framework** — the NT apparatus (Acts/Romans/Hebrews/Galatians/Revelation done;
1 Corinthians done; the rest of the epistles in progress) all roots HERE: the seed/covenant
promises, the two houses / two sticks (Ezekiel 37), the appointed times (Leviticus 23), the
restored names, the prophetic restoration-of-all-Israel, the Messianic foreshadows.

Built on the proven per-chapter full-library minion model (Acts → Revelation → 1 Corinthians).
Same five gates + a prod-DB resolution check. See `S217_NT_XREF_FANOUT_ROADMAP.md` for the NT
half and the standing minion protocol; this file governs the Tanakh half.

---

## ISOLATION + COLLISION-FREE ALLOCATION (mandatory)

- **Git:** own worktree `/tmp/tanakh-xref-wt`, branch `feat/tanakh-xref` (tracks origin/main).
  TWO other xref fan-outs + an extra-canonical fan-out run concurrently. Every push:
  `git fetch origin` → rebase → `git push origin HEAD:main` → **VERIFY origin/main == local HEAD**
  (S219 git-hazard lesson). Prod applies independent of git.
- **Band zone: Tanakh = 20000–49999.** Clear of ALL NT bands (Acts 5xxx, Romans 6xxx, epistles
  6600–8450, Revelation 9xxx) and the Phase-3 NT-to-NT backfills (12000–13000). Each book gets a
  base; each chapter its own 25-wide sub-band, step 3 (≤8 threads/chapter). Per-book bases below.
- **Session-migration numbers: session301–339**, one per book (Genesis=301 … Malachi=339). The
  entire 300s range is free. One migration file per book:
  `data-schema/migrations/session3NN_<book>_cross_references.sql`.

## HARNESS — `scratch_xref_tanakh/` (generalized; reused for all 39 books)
- `MINION_BRIEF_TANAKH.md` — full Yoshi frame embedded (minions author from the brief, not the
  Skill tool). The Tanakh-as-SOURCE pairing principle: weave FORWARD to NT, OUT to extras,
  LATERALLY to the rest of the Tanakh.
- `dump_canon.py` (book+chapter+edition), `verify_fidelity.py` (glob), `gate_check.py`
  (migration + frag glob), `fold_fragment.py`, `resolve_check.py` (parameterized via
  `BOOK_SLUG` env). `EXISTING_SLUGS.txt` regenerated from all live migrations.
- DB env: `export DATABASE_URL="$(grep -E '^DATABASE_URL=' api/.env | head -1 | cut -d= -f2-)"`;
  asyncpg `ssl='require'`. Apply via `python3 api/apply_migration.py <mig>` (idempotent ON
  CONFLICT); large applies via `psql "$DATABASE_URL?sslmode=require" -f <mig>`. RETRY on
  transient DB contention (three fan-outs share the DB). Reconcile with a
  `slug LIKE '<book>-%'` count + per-chapter group-by (the only definitive proof).
- Add each book's glob `session3*_<book>_cross_references.sql` to `_xref_audit.py`
  COVERAGE_GLOBS before gating that book.
- venv: `/Users/mtm/Desktop/App/.venv/bin/python` (pglast v7.14, asyncpg) — gitignored, lives
  in the main checkout, used from the worktree.

---

## THE 39 BOOKS — bases, chapters, status (canonical order: Torah → Prophets → Writings)

| # | Book | Ch | Verses | Band base | Session | Status |
|--:|------|---:|-------:|----------:|--------:|--------|
| 1 | Genesis | 50 | 1533 | 20000 | 301 | 🔄 Packs 1-8 LIVE (ch1-33, 162 source threads/746 members; pushed to origin/main); RESUME Pack 9 (ch34-37, Dinah/Shechem, Bethel revisited + put-away-strange-gods, Joseph cycle begins ★37 sold-into-Egypt) |
| 2 | Exodus | 40 | 1213 | 21500 | 302 | ⬜ |
| 3 | Leviticus | 27 | 859 | 22700 | 303 | ⬜ (Lev 23 appointed times — load-bearing) |
| 4 | Numbers | 36 | 1288 | 23500 | 304 | ⬜ |
| 5 | Deuteronomy | 34 | 959 | 24500 | 305 | ⬜ (Deut 28 curse=exile, NOT Torah; Deut 30 return) |
| 6 | Joshua | 24 | 658 | 25500 | 306 | ⬜ |
| 7 | Judges | 21 | 618 | 26200 | 307 | ⬜ |
| 8 | Ruth | 4 | 85 | 26800 | 308 | ⬜ (marriage-absorption: Ruth→seed) |
| 9 | 1 Samuel | 31 | 810 | 27000 | 309 | ⬜ |
| 10 | 2 Samuel | 24 | 695 | 27900 | 310 | ⬜ (Davidic covenant 2 Sam 7) |
| 11 | 1 Kings | 22 | 816 | 28600 | 311 | ⬜ (the kingdom split = two houses born) |
| 12 | 2 Kings | 25 | 719 | 29200 | 312 | ⬜ (Assyrian exile of the north — Lo-Ammi) |
| 13 | 1 Chronicles | 29 | 942 | 30000 | 313 | ⬜ |
| 14 | 2 Chronicles | 36 | 822 | 30800 | 314 | ⬜ |
| 15 | Ezra | 10 | 280 | 31800 | 315 | ⬜ |
| 16 | Nehemiah | 13 | 406 | 32100 | 316 | ⬜ |
| 17 | Esther | 10 | 167 | 32500 | 317 | ⬜ |
| 18 | Job | 42 | 1070 | 32800 | 318 | ⬜ |
| 19 | Psalms | 150 | 2461 | 34000 | 319 | ⬜ (Messianic: 2,16,22,110; pilgrim/festival) |
| 20 | Proverbs | 31 | 915 | 38000 | 320 | ⬜ (Wisdom personified → Formed) |
| 21 | Ecclesiastes | 12 | 222 | 38900 | 321 | ⬜ |
| 22 | Song of Solomon | 8 | 117 | 39300 | 322 | ⬜ |
| 23 | Isaiah | 66 | 1292 | 39600 | 323 | ⬜ (servant songs, two-house gathering, Lev-23 consummation) |
| 24 | Jeremiah | 52 | 1364 | 41400 | 324 | ⬜ (Jer 31 new covenant WITH both houses) |
| 25 | Lamentations | 5 | 154 | 42800 | 325 | ⬜ |
| 26 | Ezekiel | 48 | 1273 | 43000 | 326 | ⬜ (Ezek 37 two sticks; 36 new heart; 40-48 temple) |
| 27 | Daniel | 12 | 357 | 44300 | 327 | ⬜ (Dan 7:13 KAPH Son of Adam — carve-out) |
| 28 | Hosea | 14 | 197 | 44700 | 328 | ⬜ (Lo-Ammi / Lo-Ruhamah → gathered; Hos 1:10) |
| 29 | Joel | 3 | 73 | 45100 | 329 | ⬜ (Joel 2 Spirit poured → Shavuot/Acts 2) |
| 30 | Amos | 9 | 146 | 45200 | 330 | ⬜ (Amos 9 tabernacle of David → Acts 15) |
| 31 | Obadiah | 1 | 21 | 45300 | 331 | ⬜ |
| 32 | Jonah | 4 | 48 | 45350 | 332 | ⬜ (sign of Jonah → resurrection) |
| 33 | Micah | 7 | 105 | 45400 | 333 | ⬜ (Micah 5 Bethlehem) |
| 34 | Nahum | 3 | 47 | 45500 | 334 | ⬜ |
| 35 | Habakkuk | 3 | 56 | 45550 | 335 | ⬜ (the just shall live by faith — covenant context) |
| 36 | Zephaniah | 3 | 53 | 45600 | 336 | ⬜ |
| 37 | Haggai | 2 | 38 | 45650 | 337 | ⬜ |
| 38 | Zechariah | 14 | 211 | 45700 | 338 | ⬜ (the pierced one; the King on the colt; two olive trees) |
| 39 | Malachi | 4 | 55 | 46100 | 339 | ⬜ (Elijah before the day; the messenger) |

**Tanakh total: 929 chapters.** Per-chapter band = base + (ch−1)×25.

---

## METHOD (per book): the proven loop
1. Per-chapter minions in packs (~3–5 chapters/pack, thematically grouped). Each minion loads
   the framework FROM `MINION_BRIEF_TANAKH.md`, reads its chapter + candidate targets with
   `dump_canon.py`, authors all three library layers woven per passage, writes its fragment.
2. Orchestrator folds (`fold_fragment.py`) → `gate_check.py` (fidelity + pglast + full-library
   audit + dup-slug) → `BOOK_SLUG=<book> resolve_check.py` against prod (0 unresolved).
3. Commit → fetch+rebase → push origin/main → VERIFY remote advanced → apply to prod
   NON-INTERACTIVE (asyncpg / psql for large) with RETRY on transient contention → reconcile
   rows (`slug LIKE '<book>-%'` count + per-chapter group-by) → one-line receipt per pack.
4. DO NOT BLOCK on Yoshi's review (he reviews live in the app). Keep a per-book NOTES record of
   framework-load-bearing / contested passages + how each was framed (memory + `NOTES_<BOOK>_
   FRAMING.md`) so errors trace and batch-fix later. If a gate fails: stop that chapter, flag,
   don't push.
5. Wrap cleanly at a BOOK boundary when context gets heavy; update this roadmap + memory; report
   exact resume point.

## GENESIS pack plan (12 packs, base 20000)
1. Gen 1–3 (creation, Eden, the fall, 3:15 protoevangelium) · 2. Gen 4–6 (Cain/Abel seed-war,
Sethite line, 6:1-4 Watchers — 1 Enoch critical) · 3. Gen 7–11 (flood, Noahic covenant, Babel,
table of nations) · 4. Gen 12–15 (Abram call, the cutting covenant, seed promise) · 5. Gen 16–19
(Hagar/Ishmael, circumcision covenant, Sodom) · 6. Gen 20–24 (Isaac, the Akedah ch22, Rebekah) ·
7. Gen 25–28 (Jacob/Esau, birthright, Bethel ladder) · 8. Gen 29–33 (the twelve sons born,
Peniel, the name Yashar'el) · 9. Gen 34–37 (Dinah, Bethel, Joseph's dreams) · 10. Gen 38–41
(Judah/Tamar messianic line, Joseph in Egypt) · 11. Gen 42–46 (brothers, reunion, Israel to
Egypt) · 12. Gen 47–50 (ch48 Ephraim/Manasseh = two houses; ch49 Judah's scepter/Shiloh; ch49
twelve-tribe blessings; Joseph's bones).

(Per-book pack plans for the remaining 38 books are set at each book's start.)
