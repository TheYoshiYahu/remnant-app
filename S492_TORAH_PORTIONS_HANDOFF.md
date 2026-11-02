# S492 — Torah portions page + reader's own week (board #9); trial-reminder cron fix

## Built (Nov 2, 2026 — NOT yet pushed; the push is Yoshi's)
- Board suggestion #9 (2026-10-30, "search any Torah portion week … starting the readings
  a couple weeks later than the calendar anchor"):
  - `app/src/lib/torah/portion-offset.ts` — NEW. The reader's own place in the cycle, one
    number (weeks behind + / ahead −), localStorage `torah.portionOffsetWeeks`, change event
    `rop:portion-offset-changed`.
  - `app/src/lib/torah/parsha.ts` — `getParshaForDate` now honours the offset (resolves for
    the earlier date, reports the Shabbat actually read on); `listTorahCycle()` lays out the
    whole cycle with dates under the elected reckoning (rabbinic: HebCal walk Bereshit→next
    Bereshit, combined weeks one row, V'Zot HaBerachah listed on the Shmini Atzeret week;
    non-rabbinic: the 54-name order from the reader's own anchor). `ParshaDeps.offsetWeeks`
    overrides the stored offset. Smoke-tested on rabbinic / crescent / enoch for 2026-11-02.
  - `app/src/routes/TorahPortions.tsx` — NEW page at `/torah-portions` (free): this week's
    portion, "Started on a different week?" stepper + reset, search box, every portion grouped
    by book with Shabbat date, Torah + Haftarah readings (tap → reader), "This is my week" on
    each row (sets offset = calendar's row − chosen row).
  - `App.tsx` route; Today page door ("Torah portions"); reader header's panel re-resolves on
    the offset and links to the page; `newFeatures.ts` entry id `torah-portions`.
  - The Calendar day view's portion follows the offset too (same helper).
- `api/auth.py` — `has_active_paid_subscription`: `s.status::text <> ALL($2::text[])`. The
  column is the Postgres enum `subscription_status`; without the cast every trial user
  threw `operator does not exist` and was SKIPPED, so no trial-reminder email had ever gone
  out. Render log Nov 2 10:00 CST showed it (failed=1 total=1).
- `app/src/components/LetterCard.tsx` — one-line fix to another session's uncommitted
  S478 work: `svg` prop was declared but not destructured (tsc error). `tsc -p
  tsconfig.app.json` now clean across the whole tree.

## After the push
- Mark board post #9 Built with feature id `torah-portions` (creator moderate on the board).
- Trigger a run of `remnant-app-trial-reminders` once `remnant-app-api` redeploys.

## Word highlight (board #6, 2026-10-24) — NOT fixed; checked S492
- Highlight → Word / Phrase (S424) only lets the reader tap Strong's-tagged words: marks are
  anchored to `verse_words.position`, and plain segments (untagged words, "and", "the", the
  parentheticals) have no position, so they are inert — that is the "preselected words" the
  reader describes. S468 step 5 added long-press → Share → "Copy words" (copy any run), but
  highlighting still can't take an untagged word. A real fix means anchoring word/phrase
  marks to the plain-text word index (reader + API `word_start`/`word_end` semantics +
  existing saved marks), i.e. its own session.
