# S133 — Matt 4, chapter-by-chapter

S132 shipped Matt 3: short.md cut to 19 lines on the Eliyahu garment-detail + Yarden-as-mantle-river, long.md trimmed of those two paragraphs, and `session132_matt_3_extras_cross_references.sql` applied — 5 threads, 21 cross_references rows, 21 thread-members, plus one supplement to S131's `plant-of-righteousness-and-the-branch` at Matt 3:10. All `tier_required='extras'`. Pushed at `31bf64d`. Cumulative extras corpus across Matt 1-3: **16 threads, 51 rows, 52+ members.** Pill live for all three chapters.

## First moves

1. Invoke `anthropic-skills:yoshi-voice`.
2. Mount `~/Desktop/App` AND `~/Desktop`.
3. Read `matthew-3-short.md` + `session132_matt_3_extras_cross_references.sql` for the calibrated rule and SQL pattern.
4. Read `matthew-4-free.md`, `matthew-4-short.md`, `matthew-4.md`.

## The rule

- `matthew-N-short.md`: 1-2 framework angles the free.md doesn't walk; scripture in stand-alone italics; ~15-25 lines.
- `matthew-N.md`: drop what short.md now walks; trim overview-restating frame sentences; keep the deep development.
- Author `data-schema/migrations/session133_matt_4_extras_cross_references.sql` across the full scripture-level library. Historical-witness editions deferred.
- Voice-gate against the 12 Red Lines + 12-point checklist.

## Matt 4 candidates

Temptation pericope: **Jubilees on Mastema-as-tempter** (Jub 10:8, 11:5, 17:16); **1 Enoch on Azazel** (1 Enoch 8-10, the Watcher chief bound in the desert — Yom Kippur scapegoat register); **Ascension of Isaiah on Beliar's descent** (Asc.Is 4:2); **Wisdom of Solomon 2:10-20** (the ungodly's plot against the righteous one). Forty-day fast: Mosheh / Eliyahu canon parallels — extras thinner here. Galilee-of-the-Gentiles (Matt 4:13-16 / Isaiah 9): canon-anchored, extras only if a tribal-territory parallel maps. Fishers-of-men call (Matt 4:18-22): **1 Enoch 90 Animal Apocalypse** wheat-gathering register if it reads; Jeremiah 16:16 stays canon. Healings throughout Galilee: probably thin on extras.

## Apply path

```bash
cd ~/Desktop/App
DATABASE_URL="$(cat _scratch/_db_url.txt)" \
  python3 api/apply_migration.py \
  data-schema/migrations/session133_matt_4_extras_cross_references.sql
```

Sandbox is DNS-isolated from Render Postgres — apply runs from Yoshi's terminal. Then commit + push (`S133 — Matt 4 content cut + Matt 4 extras-tier cross-references`) to fire the auto-deploy.

## Out of scope

Reader-surface color tuning, modal/drawer sweep, §4 icy-silver-blue olive-leaf register, BuddyPress audit. REBUILD_STATE.md catches up at chapter-sweep close.
