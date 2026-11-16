# S504 — open prompt — the app VISIT COUNTER first; then three re-points, the S502 sweep list, and the Phase 3 census

CHECK THE MODEL PICKER FIRST: Claude Fable 5.1 (judgment work; Sonnet only for first drafts and scripted steps, model named in every output file).

Load my voice skill and mount my Desktop. Read, in this order:
1. ~/Desktop/App/XREF_LIBRARY_COVERAGE_ROADMAP.md — the S503 entry at the end (0 orphans library-wide; the re-point pass; the 14 summaries; the Phase 3
   finding with its counts; the pipeline flags; the users baseline).
2. ~/Desktop/App/_s503/tools/ — the edition-aware chain: common503, dump503 <edition> <book> (re-dump paste), build503c / gen_sql503c / check503c / seed503x
   (the sweep: one thread at a time, title + summary + named member cards), build503b / gen_sql503b / check503b (re-point), gen_deploy503bc (one paste for
   several Matthew migrations), users_baseline503.py. Sandbox bundle: _s503 + _s496/tools + _s496/ref + _s495/tools + parsed/ + the live read-backs you touch.
3. ~/Desktop/App/api/db.py (users.last_seen_at is written in the upsert there), api/auth.py, data-schema/schema.sql §6 users / §7 subscriptions,
   hosting/render.yaml, api/walk.py — for the counter.

STATE: Phase 2's orphan block is CLOSED (0 orphan cards in the whole library). S503 committed and pushed Nov 15 23:40 CST. Older uncommitted edits
remain in api/main.py, api/Dockerfile, hosting/render.yaml, .gitignore — ask before touching them.

THIS SESSION, in order:
(a) THE VISIT COUNTER — Yoshi asked for it Nov 15: "how many different people log in daily, and how many times each." Today the database holds one
    users.last_seen_at per user, overwritten each visit, so the question cannot be answered for the past; the counter answers it from the day it lands.
    Design before code, one page, Yoshi reads it: a `visit_events` table (ts, user_id nullable, anon_id (a hashed cookie/device id, never an IP), surface
    'app' | 'walk', path, edition/book/chapter if a reader page); written server-side on every JWT-authenticated request's first hit of the day AND by a
    tiny beacon on page load for anonymous readers (app PWA and walk site); a daily rollup view (distinct users, distinct anons, visits per user) and a
    read-only report paste like users_baseline503.py; retention simple (keep raw 400 days). Migration through apply_migration.py; API change on Render
    (Yoshi's `git push` + Render deploy); PWA beacon in app/src. Free, no third party. Privacy page line for the WordPress site's policy if the beacon
    sets a cookie. Baseline to compare against: 78 accounts / 22 seen in 30 days / 8 in 7 days / 7 paying (Nov 15). Housekeeping in the same migration
    or a sibling: duplicate active subscription rows (assemblyofrop ×2 everything, Jeni ×2 complete_study) and the duplicate Goshen24 account — Yoshi
    decides which row stays; nothing deleted without his word.
(b) THREE RE-POINTS on the S503b chain: 3206 Matthew 28:20 → John 2:3 (meant 1 John 2:3), 3207 28:20 → John 5:2 (1 John 5:2), 3634 18:19 → John 5:14
    (1 John 5:14). Yoshi's standing answer on this pattern is "move them". Re-dump Matthew first; add them to out/draft503b.json; build503b; one migration.
(c) THE S502 SWEEP LIST on build503c (Yoshi reads each before deploy): matthew-3 stones thread (reads the stones as nations grafted in — they are the
    scattered house, Hosea 1:10, Ezekiel 37); matthew-13 mustard-seed/leaven (leaven = corruption, not growth); both Luke 4 Nazareth threads ("individual
    mercy" — the widow and Naaman are seed revealed); mark-7 corban ("the King", "diagnostic"); gathering-of-the-scattered-twelve-tribes-in-sirach-and-
    2-esdras-and-tobit (old shorthand); rich-man-and-lazaros-the-framework-honest-sheol… (slug kept, summary rewritten; Luke's own words only — bosom,
    torment, gulf). Luke and Mark read-backs: re-dump both first (dump503 canon luke / canon mark).
(d) PHASE 3 CENSUS: write `_s503/tools/shorthand_census.py` (the one-off from S503: for every live read-back, threaded cards whose note starts
    `thread:`, trips forbidden_scan/EXTRA, or is a stub < 60 chars; per book and per thread) and run it on fresh dumps; propose the first batch — Luke's
    340 `thread:` prefixes are the ugliest reader-facing thing and the most mechanical fix (strip the prefix is NOT enough; the note behind it is S1xx
    shorthand too — it is a rewrite, same shape as the orphan rebuild with the guard on membership + member note instead of orphanhood).
(e) Close: XREF_LIBRARY_COVERAGE_ROADMAP.md, S463_ROADMAP_SWEEP_CARDS_CAUTION_BOOKS.md, a dated line in S446_SESSION_HANDOFF.md, S505 open prompt.

Rules that bit in S495–S503, keep them: canon quotations come from parsed/canon.json, never the live modernised text (extras targets: the live text);
a thread with a summary but 0 members gets FILLED, not duplicated; one scene is ONE thread; "It ain't new" is Yoshi's opener, never smoothed; the
brief's instructions to the drafter must not leak into the reader's prose; never "the King"; names in OT spellings; no Trinity words and no collapse —
**the one name is Yah (HalleluYah), Yoshi's correction S503**; Daniel and Revelation separate, Daniel's *like* kept; the scratch proof lives in the
sandbox and dies with it — re-run scratch in the session that deploys (Postgres in the sandbox stops between turns: `service postgresql start`);
deploy logs never in a git add line; the git push is Yoshi's; Yoshi reads every thread summary before it deploys; batch summaries three or four at a
time, not one at a time and not all at once. Pipeline flags still open: John 20:25 parsed vs live, Psalm 68:4 JAH, Isaiah 12:2 / 26:4 JEHOVAH,
Luke 22:61 / 1 Cor 11:23, Isaiah 2:2 LORD'S.
