Load my voice skill and mount my Desktop. Read ~/Desktop/App/S446_SESSION_HANDOFF.md
(the S455, S455b and "Canon fix (step C)" sections at the bottom) and S451_APP_FEATURE_ROADMAP.md.

Bible app order: bugs ✓ → content audit (Jasher ✓, Jubilees ✓, Apocrypha KJV ✓, charles-vol1 retired ✓,
canon KJV audited ✓ — fix pending) → cross-references → features → store/billing → offline → voices LAST.
Google/library parked.

This session, in order:
1. S456 — canon (KJV) fix, step C. The audit is done (source-texts/kjv-canon-audit/canon-damage-table.md:
   faithful, 31,102/31,102). Build the fix for items 1, 2, 3, 5; item 4 is DECIDED — Amos 3:7, 1 John 3:4–8
   and Psalm 81:3 are MY renderings: keep them, flag source_type yoshi-rendering in parsed/canon.json and
   register them in restoration-pipeline/YOSHI_RENDERED_PASSAGES.md.
   - Item 1: the 116 Psalm superscriptions → chapters.chapter_title (NOT chapter_intro — the app shows
     chapter_intro as the free commentary and hides it with the commentary toggle). Names restored.
   - Item 2: Psalm 119 — strip the 21 stanza letters from the END of vv.8,16,…,168; acrostic note in the
     chapter_title.
   - Item 3: the 14 Pauline subscriptions out of the last verse. First find where the yoshi-fn-NNNN footnote
     ids resolve; if they don't resolve anywhere, keep the subscription as free text in the JSON footnote only.
   - Item 5: Romans 15:30 echo → (Lord Jesus Christ's).
   Rule 10 (in place, ids kept) → session455b_canon_fix.sql, scratch Postgres test, idempotent; parsed/canon.json
   updated in place (.pre-s455b); audio for Psalm 119 + the 14 epistle-ending chapters QUEUED not run
   (_s454_apocrypha_audio_redo.mjs is the template); one deploy script for me to paste; handoff + scorecard updated.
2. Then cross-references: start with the plan — read XREF_LIBRARY_COVERAGE_ROADMAP.md and give me the
   general map first (what is covered, what is not), before any detail.

Check first whether I pushed S455 (git log should show the 'S455: retire apocrypha-charles-vol1' commit);
if not, print the commit + push line again and keep going.

Rules: terminal blocks for me to paste, never type into my apps; never Cmd+A or Backspace; one question at
a time; explain git plainly; save over originals, no v2 copies; verify by content, never by counts; wrap at
~25–30 turns.
