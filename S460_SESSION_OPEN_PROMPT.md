Load my voice skill and mount my Desktop. Read ~/Desktop/App/S446_SESSION_HANDOFF.md (the S457 and S459 sections at the
bottom), XREF_LIBRARY_COVERAGE_ROADMAP.md (the 2026-10-19 S459 entries and the per-book status table at the end), and
source-texts/enoch-charles-1917/enoch-card-fidelity-map.md (the S459 status at the bottom). The S458 ORDER note stands: app
cards first, then the books.

Bible app order: bugs ✓ → content audit ✓ → cross-references ← NOW → features → store/billing → offline → voices LAST.
Scope (Yoshi, Oct 19): EVERY extra-canonical book gets the card-fidelity sweep before the app is sale-ready — Enoch →
Jubilees → Apocrypha (+3 Macc) → Jasher → 2 Enoch / Testaments XII / Apoc. Abraham / Adam-Eve / Asc. Isaiah → Cepher
additions → Sonnini. Keep the status table in the roadmap current as each lands.

Check first: git log should show "S459b: Enoch card fix deployed…" on origin; if not, print the commit + push line again.
Live state after S459: the 1 Enoch CARDS are fixed (729 quote-bearing cards STAND, 0 flagged, 199 moved, 2 retired —
_session459_enoch_card_fix_deploy.log; the S457 numbering slips in chs 15/18/22/61–63 are recorded in the handoff).

This session — Enoch, still general to specific, in this order:
1. The 512 THREAD SUMMARIES that quote 1 Enoch wrongly (988 bad quotes; 342 are the S250 `1-enoch-N-…` chapter threads written
   on the corrupt text) — these are the paragraph the end card leads with, and the text Track A (the Enoch book) will be
   formed from. Method: dump is already in source-texts/enoch-charles-1917/enoch-cards-live.json (threads + summary_md) →
   regrade every Enoch quote in each summary by the words (reuse s459-card-fix/regrade.py's norm/span logic) → general map
   first (how many summaries stand / need re-quoting / need rewriting / anchor on a verse that moved) BEFORE any rewrite →
   rewrites in my voice, Come-and-See (every verse quoted in full, stand-alone italics, cited), no internal references
   (no "wisdom-stream", "the framework reads", "Red Line #", "Yoshi"), ids kept, scratch Postgres with the live
   cross_references_check (source ≠ target) in the schema, one deploy script, live read-back.
2. The 59 STAND cards whose prose is degraded (same markers; list them from enoch-cards-live.json) — rewrite, same chain or
   folded into (1)'s migration.
3. The 641 NO_ENOCH_QUOTE cards on verses the S449 rebuild changed — read each gloss against the live verse; fix only where
   the gloss no longer fits.
4. If time allows: Jubilees by the same chain (dump → regrade → decide → build → scratch twice → deploy → read-back);
   jub-card-sort-report.md is the S453 starting point.

Lessons locked at S459: the scratch schema must carry every live CHECK constraint (the first live run rolled back on
cross_references_check); apply_migration.py does not print the migration's RAISE NOTICE summary — add a log listener or
rely on the read-back; Enoch→Enoch cards can quote their own source verse — grade the TARGET's words, never re-point a
card at its own source; files Claude creates from its own shell on the Mac are owned by Claude's user and invisible to
Yoshi's git — create new files through the file-commit path, append to existing ones only.

Housekeeping, on my word only (ask one question each): the Finder " 2.sql"/" 2.json" duplicates (list in the S457 roadmap
entry); canon.modernized.json (June, stale); _to_delete/ and _scratch/_s460_prompt_copy.md (S459 scratch); .git/objects/7a/
tmp_obj_* litter; tts/chapters_all.json shows modified since S456 — ask before touching; the never-applied S181 canon-only
baselines (retire vs keep); session154_matt_17 file.

Rules: terminal blocks for me to paste, never type into my apps; never Cmd+A or Backspace; one question at a time;
explain git plainly; save over originals, no v2 copies; verify by content, never by counts; wrap at ~25–30 turns.
