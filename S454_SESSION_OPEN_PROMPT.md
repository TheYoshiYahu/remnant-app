# S454 — Session open prompt

Load my voice skill and mount my Desktop. Read ~/Desktop/App/S446_SESSION_HANDOFF.md
(the S453 section at the bottom) and S451_APP_FEATURE_ROADMAP.md.

We are getting the Bible app perfect, in this order: open bugs (done S453) → content
audit of every text (Jasher ✓, Jubilees ✓) → cross-references → features → store/billing →
offline → voices LAST. Google/library pages are parked.

First: confirm the S453 Jubilees deploy landed (`tail -20 ~/Desktop/App/_session453_jubilees_deploy.log`
should show BEFORE 1031, AFTER 1307, cards moved 102). If not run yet, hand me the paste.

Then the next audit: **Apocrypha** — editions `apocrypha` (KJV 1611 / Brenton) and
`apocrypha-charles-vol1`. Same method as S453: A) clean public-domain base, local files
first (source-texts/apocrypha-charles-vol1/, kjv/), browser pane if a site blocks curl;
parse by chapter, one verse per line, per-chapter counts. B) Diff by CONTENT against
parsed/apocrypha.json and parsed/apocrypha-charles-vol1.json — one damage table
(matched / merged / changed / missing / extra per chapter), then one question: proceed?
C) Fix in place (Rule 10, ids kept), card sort by reading, audio queued (not run).
Template: source-texts/jubilees-charles-1917/ (diff_jub.py, split_jub.py, card_sort.py, gen_sql.py).

Rules: terminal blocks for me to paste, never type into my apps; never Cmd+A or Backspace;
one question at a time; explain git plainly; save over originals, no v2 copies; verify by
content, never by counts; wrap at ~25–30 turns.
