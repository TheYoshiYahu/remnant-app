# S131 — Cross-reference corpus overhaul (activates the argaman extras pill) + WP BuddyPress audit + Matt content fan-out

Three queued pieces. Read `COLOR_PALETTE.md` and `S130_SESSION_OPEN_PROMPT.md` before any work begins — S130 locked the color discipline and the aggressive-content-cut rule, and every cross-reference surface this session produces inherits both.

**1. Cross-reference corpus overhaul — all 28 Matthew chapters.** Top priority. Every Matt verse the framework reads as load-bearing gets curated framework-bearing cross-references including extra-canonical targets (1 Enoch, Jubilees, Jasher, Apocrypha, Adam-Eve Conflict, Apocalypse of Abraham, Sonnini Acts 29). **This is what makes the metallic argaman pill light up on live cards** — the styling is built and waiting in `app/src/components/ChapterEndCard.tsx::classNameForSourceClass('extras')` per COLOR_PALETTE.md §9, but no extras-tier cross-reference targets exist in the corpus yet, so the pill never renders today. Adding them is the work that makes that whole color register start firing across the reader — and the upgrade-driver the four-bucket scheme was built for. Audit current thread coverage (`session111_fulfill_thread.sql` + S73/S74 threads); identify per-chapter gaps; design new threads on the Red Lines the v1 set hasn't surfaced (sabbath restoration, sacred-names lineage, three-categories, four costumes, Daniel 7 kaph-comparative, seed war from Genesis 6, lo-ammi → sons-of-the-living-Elohim). Each new thread ships as its own migration SQL per the S73/S111 pattern, runs against live Render Postgres via the API-Shell loader. Every cross-reference passes the 12 Red Lines + 12-point checklist.

**2. WordPress BuddyPress button audit.** Yoshi to specify which buttons are missing. Locally-mirrored WP source at `~/Desktop/Website/wordpress-deploy/`; live install at `https://remnantofpromise.org/`.

**3. Fan the S130 aggressive Matt 1 content cut across chapters 2-28.** Same rule, every chapter triple: short.md drops content the free.md overview already walks, .md drops content the new short.md walks. After the cut: push → Render rebuilds → S112 loader runs against live DB.

**Out of scope:** further reader-surface color tuning (locked in COLOR_PALETTE.md §9), modal/drawer color sweep (deferred per the §9 trailing note), the §4 icy-silver-blue olive-leaf register (reserved).

**First moves (in order):**

1. Invoke the Skill tool with `anthropic-skills:yoshi-voice` before any other action.
2. Verify `~/Desktop/App` mounted; request if not.
3. Read `COLOR_PALETTE.md`, `S130_SESSION_OPEN_PROMPT.md`, `_session112_load_matthew_tiered_commentary.py`, and the latest S130 close commits.
4. Wheel pick via AskUserQuestion: cross-reference corpus, BuddyPress audit, or Matt content fan-out — Yoshi's call.
5. Run ONE wheel end-to-end. All git ops via Yoshi's terminal; every paste-block leads with `cd ~/Desktop/App` + `rm -f .git/index.lock`.
