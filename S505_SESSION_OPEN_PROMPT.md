# S505 — open prompt — the VISIT COUNTER code (after Yoshi's read of the design); then the S502 sweep list; then Phase 3 batch 1

CHECK THE MODEL PICKER FIRST: Claude Fable 5.1 (judgment work; Sonnet only for first drafts and scripted steps, model named in every output file).

Load my voice skill and mount my Desktop. Read, in this order:
1. ~/Desktop/App/XREF_LIBRARY_COVERAGE_ROADMAP.md — the S504 entry at the end (the counter finding: S467's user_activity_days already counts
   signed-in days; the three re-points built; the census numbers and the proposed first batch).
2. ~/Desktop/App/S504_VISIT_COUNTER_DESIGN.md — the design Yoshi read. His answers to its three housekeeping questions (assemblyofrop, Jeni, Goshen24)
   decide the sibling migration; if he has not answered, ask them first, one line each.
3. ~/Desktop/App/_s503/tools/ — the chain (common503, dump503 <edition> <book>, build503c / gen_sql503c / check503c / seed503x for the sweep,
   build503b / gen_sql503b / check503b for re-points, gen_deploy503bc, users_baseline503.py, shorthand_census.py) and _s503/out/shorthand_census_2026-11-16.md.
4. api/db.py (upsert_user + ACTIVITY_SCHEMA_SQL), api/email_prefs.py (ensure at startup), api/auth.py, api/walk.py, walk/build.mjs (the page script),
   app/src/main.tsx + app/src/lib/api.ts, hosting/render.yaml, api/apply_migration.py — for the counter code.

STATE: S503 pushed Nov 15 23:40 CST. S504 built but NOT deployed: `session503b2_matthew_repoint3.sql` (3 re-points) — if Yoshi has not run
`bash ~/Desktop/App/_s503/deploy/_session503_repoint3_deploy.sh`, ask for it first (check503b must end PASS). Older uncommitted edits remain in
api/main.py, api/Dockerfile, hosting/render.yaml, .gitignore and the untracked walk/ + api/walk.py (WALK 1) — ask before touching them.
FIRST CHECK the Mac-side shell: `df -h $HOME` — in S504 the volume was full and asyncpg would not install, so no dump and no DB query ran; if it is
still full, every DB step is a paste for Yoshi (the deploy scripts already re-dump). Run `python3 -m jobs.activity_report --days 30` (api/) as a paste
to see what S467 has counted — it is the baseline the counter extends.

THIS SESSION, in order:
(a) THE VISIT COUNTER CODE, exactly as the design says and nothing more: `data-schema/migrations/session504_visit_events.sql` (table + indexes + view
    visit_days, idempotent), `api/visits.py` (POST /v1/visit, 204, sha256(ANON_SALT + anon_id), 30-minute dedupe, never raises), ~8 lines in
    upsert_user (one visit_events row when the S467 upsert opened a new visit — detect with RETURNING on an xmax/insert test or by reading last_at first),
    `app/src/lib/visit.ts` + one call in main.tsx (random UUID in localStorage, no cookie), six lines in walk/build.mjs's page script, ANON_SALT in
    render.yaml (sync: false — Yoshi sets it in the dashboard BEFORE the push), the prune line in jobs/trial_reminders.py (400 days),
    `_s503/tools/visits_report504.py` (read-only; prints the Nov 15 baseline on top). Sibling `session504_housekeeping.sql` only with Yoshi's answers;
    nothing deleted. Privacy sentence for the WordPress policy page, one line, handed to Yoshi to paste. Order: migration (paste) → his push → Render
    deploys → the report paste shows the first rows.
(b) THE S502 SWEEP LIST on build503c (Yoshi reads each before deploy, three or four at a time): re-dump Luke and Mark first (dump503 canon luke /
    canon mark — the dumps on disk are Nov 14). matthew-3 stones (the stones are the scattered house — Hosea 1:10, Ezekiel 37 — not nations grafted in);
    matthew-13 mustard-seed/leaven (leaven = corruption, not growth); both Luke 4 Nazareth threads (the widow and Naaman are seed revealed, not
    "individual mercy"); mark-7 corban ("the King", "diagnostic"); gathering-of-the-scattered-twelve-tribes-in-sirach-and-2-esdras-and-tobit;
    rich-man-and-lazaros-the-framework-honest-sheol… (slug kept, summary rewritten in Luke's own words only — bosom, torment, gulf).
(c) PHASE 3 BATCH 1 — the member cards of the 13 S1xx threads whose summaries S503 rewrote (~230 cards, list and counts in the census .json): add a
    packet step to build503c (packet503 shape: card + both verses + the thread's new summary → Sonnet first draft → Fable reads every one), guard on
    "member of thread X with member note Y", UPDATE in place, one migration per thread, Yoshi reads samples. Then Luke's 340 `thread:` prefixes thread
    by thread (effort-over-accomplishment 40 first — it spans 8 books). 2 Baruch's 162 and Testaments XII's 105 abbreviated book names are a mechanical
    expansion in one migration, no redraft — do that one early, it is cheap.
(d) Close: XREF_LIBRARY_COVERAGE_ROADMAP.md, S463_ROADMAP_SWEEP_CARDS_CAUTION_BOOKS.md, a dated line in S446_SESSION_HANDOFF.md, S506 open prompt.

Rules that bit in S495–S504, keep them: canon quotations come from parsed/canon.json, never the live modernised text (extras targets: the live text);
a thread with a summary but 0 members gets FILLED, not duplicated; one scene is ONE thread; "It ain't new" is Yoshi's opener, never smoothed; the
brief's instructions to the drafter must not leak into the reader's prose; never "the King"; names in OT spellings; no Trinity words and no collapse —
the one name is Yah (HalleluYah); Daniel and Revelation separate, Daniel's *like* kept; the scratch proof lives in the sandbox and dies with it — re-run
scratch in the session that deploys (`service postgresql start`); deploy logs never in a git add line; the git push is Yoshi's, and so is every Render
dashboard click; Yoshi reads every thread summary before it deploys; batch summaries three or four at a time; no reading content is ever logged by the
counter (S467's rule), no cookie, no IP. Pipeline flags still open: John 20:25 parsed vs live, Psalm 68:4 JAH, Isaiah 12:2 / 26:4 JEHOVAH,
Luke 22:61 / 1 Cor 11:23, Isaiah 2:2 LORD'S.
