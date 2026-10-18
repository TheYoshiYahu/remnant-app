Load my voice skill and mount my Desktop. Read ~/Desktop/App/S446_SESSION_HANDOFF.md — the S449 section at the bottom is where we are: 1 Enoch is rebuilt to Charles 1917 and live. Its base had been built by AI in chunks and padded with invented verses where the source ran out; count checks passed, content checks caught it. So now EVERY text in the app gets the same audit: verify by CONTENT, verse-by-verse against a clean public-domain source, per-chapter numbers shown to me — never by length or count; never call a chapter correct without having read both texts.

JOB: audit all of scripture, one edition per session, in this order, same method as S449:
 1. Jasher (Noah 1840) — this session.
 2. Jubilees (Charles 1902).
 3. Apocrypha (KJV 1611 / Brenton; and apocrypha-charles-vol1).
 4. Canon (KJV) — never content-checked; prove it.
 5. The other extras: pseudepigrapha (Charles vol 2), adam-eve-conflict, apocalypse-of-abraham, ascension-isaiah, sonnini-acts-29, lightfoot, mrjames, josephus.
Per edition: A) clean source (local files first; if a site blocks curl, pull it through the browser pane like S449); parse by chapter heading, one verse per line, show per-chapter verse counts. B) Diff by content against the edition in source-texts/existing-restored-editions (or parsed/*.json) — one damage table (matched / changed / missing / extra per chapter), then one question: proceed? C) If damaged: rebuild through restore.py keeping my titles and commentary, flag commentaries, re-parse ONLY that edition (never parse_published_editions.main() — it overwrites every edition), Rule-10 migration like session449*.sql, card sort, audio redo. If clean: say so with the numbers and go to the next edition. Keep a running scorecard of all editions in S446_SESSION_HANDOFF.md.
After all texts: cross-references, then voices (re-record only chapters whose text changed), then my books.

Rules: terminal blocks for me to paste, never type into my apps; never Cmd+A or Backspace; one question at a time; explain git plainly; save over originals, no v2 copies.
