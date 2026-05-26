# S132 — Matt 3, chapter-by-chapter

S131 landed Matt 2's content cut plus extras-tier cross-references for both Matt 1 and Matt 2 (11 threads, 32 rows, all `tier_required='extras'`). The metallic argaman pill is live for those two chapters. Workflow going forward is **one chapter per session: content cut AND extras cross-refs in the same pass.** Start fresh at Matt 3.

## First moves (in order)

1. Invoke the Skill tool: `anthropic-skills:yoshi-voice`.
2. Mount `~/Desktop/App` AND `~/Desktop` (both — Desktop is needed for screenshots, screenshot folder management, and any cross-folder work).
3. Read the Matt 1 and Matt 2 prototypes (`commentaries/matthew-1-short.md`, `matthew-1.md`, `matthew-2-short.md`, `matthew-2.md`) and the S131 cross-ref migration (`data-schema/migrations/session131_matt_1_2_extras_cross_references.sql`) so the rule and the SQL pattern are loaded.
4. Read `commentaries/matthew-3-free.md`, `matthew-3-short.md`, `matthew-3.md` to scope chapter 3.

## The rule (calibrated across Matt 1 + 2)

- `matthew-N-short.md` keeps ONLY material the free.md overview doesn't walk — one or two focused new framework angles, scripture quoted in stand-alone italics per the *come and see* posture.
- `matthew-N.md` drops content the new short.md walks; trims overview-restating frame sentences; keeps the deep case-by-case + theological development.
- Author `data-schema/migrations/session132_matt_3_extras_cross_references.sql` with every framework-bearing extras-tier cross-reference across the full scripture-level library (1 Enoch, Jubilees, Jasher, Apocrypha KJV 1611, Apocrypha Charles vol 1, Pseudepigrapha, Adam-Eve Conflict, Apocalypse of Abraham, Ascension of Isaiah, Sonnini Acts 29). Historical-witness editions stay deferred V1.
- Matt 3 candidates: 1 Enoch on the Elect One / the heavens opening, Wisdom of Solomon 7 on the Spirit, Ascension of Isaiah on the dove + Father-voice descent, Testament of Levi on the heavens opening at the priesthood register, Jubilees on Yochanan / John the Witness if anything maps.
- Voice-gate everything (12 Red Lines + 12-point editorial checklist).

## Apply path (won't fight you this time)

The applier `api/apply_migration.py` was patched at S131 with the robust SSL/connect pattern. `_scratch/_db_url.txt` carries the fresh credentials. Render Postgres IP allowlist now includes your current public IP. After authoring the Matt 3 migration:

```bash
cd ~/Desktop/App
DATABASE_URL="$(cat _scratch/_db_url.txt)" \
  python3 api/apply_migration.py \
  data-schema/migrations/session132_matt_3_extras_cross_references.sql
```

If you connect from a new location, add the new IP to Render → `remnant-app-db` → Info → PostgreSQL Inbound IP Rules.

## Out of scope

Reader-surface color tuning, modal/drawer color sweep, the §4 icy-silver-blue olive-leaf register, BuddyPress audit (waiting on Yoshi's spec).
