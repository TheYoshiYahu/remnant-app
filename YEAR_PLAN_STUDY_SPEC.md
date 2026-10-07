# Year Plan: Full View, Your Own Pace, Notes & Teachings — Spec

Requested 2026-10-07 by Yoshi. The app's one paying member asked to see the
whole reading plan ahead of time. Yoshi wants that, plus pacing the reader
controls, plus notes that grow into the reader's own teachings. All three are
a partner (paid) feature.

## Who gets it

- Paid feature. Entitled = the same check the app already uses for Hidden
  Words tables: `me.status === "active" || "trialing"` (App.tsx ~1019).
  Trial users get it, so it also sells the trial.
- Free readers SEE the entry points with a lock. Tapping opens the existing
  `LockedPartnerPrompt` — informational only, no checkout or pricing link on
  native (the consumption-only compliance posture; see Teachings.tsx header
  and S441 unlock-CTA rules).
- The daily "today's reading" on YearPlanHeader stays free, unchanged.

## 1. See the whole plan

- Entry point: a "See the whole plan" button on `YearPlanHeader.tsx`
  (lock glyph when not entitled).
- New route `/plan` (top-level, same pathname-switch pattern as /teachings,
  /calendar). Plain `<a href>` navigation like the rest of the app.
- Shows every day of the plan from `buildYearPlan(scope)` (pacing.ts), grouped
  by week, collapsible by month. Each day: day number, calendar date, and its
  chapters (book + chapter, extras marked the same way the reader marks them).
- Chapters already read (seq <= position) are checked. Today is highlighted
  and scrolled into view on open.
- Tapping a chapter opens it in the reader.
- Scope toggle (canon / all) mirrors the existing one; changing it re-flows
  the list.

## 2. Read at your own pace

The chronological ORDER never changes; only how it is spread over time.
`position` (the seq of the last chapter read) stays the single source of
truth for where the reader is.

- Read ahead freely: reading past today's chapters just advances position.
  The remaining days re-spread what's left so nobody is "behind" or "ahead"
  in a way that nags.
- Pace settings on the /plan page (one control, three modes):
  1. **Finish by a date** (default: start + 365 days). Remaining chapters are
     spread evenly from today to that date.
  2. **Chapters per day** (e.g. 3, 5, 10). The end date is computed and shown.
  3. **Week by week.** The reader sets a chapter goal for any upcoming week
     (e.g. 10 this week, 1 next week). Weeks without a goal share the rest
     evenly toward the finish date. Shown on each week header, editable there.
- Always show the consequence in plain words: "At this pace you'll finish
  on March 14" / "Finishing by Dec 31 means about 4 chapters a day."
- Guard rails: minimum 1 chapter per day/week goal; if goals would overshoot
  the end of the plan, the last week just takes what's left.

Implementation notes:
- Add a pure function in pacing.ts, e.g.
  `buildPacedPlan(scope, position, todayISO, pace)` → day buckets from today
  forward. Keep `buildYearPlan` for the free daily header so nothing free
  changes.
- Extend plan state: new key `rop_yearplan_v2` = v1 fields +
  `pace: { mode: "byDate" | "perDay" | "weekly", endDateISO?, perDay?,
  weeklyGoals?: Record<weekStartISO, number> }`. Migrate v1 → v2 on read.
- Sync pace + position to the account (same pattern as display-prefs-sync)
  so a phone and a tablet agree. If that's more than one session's work,
  ship local first and note it.
- Unit test: same chapters in same order for every pace; no chapter lost or
  duplicated; weekly goals honored; read-ahead re-spreads.

## 3. Notes that grow into teachings

- On /plan and in the reader during a plan day: "Add a note" on any day or
  chapter. Notes are per account (server-stored like Journal entries), tied
  to day number + book/chapter (+ optional verse range from range-selection).
- Check the existing S124 bookmarks-and-notes code first and reuse its store
  if it fits rather than making a second notes system.
- **My Teachings** (new, partner): gather notes into a teaching.
  - Create a teaching with a title.
  - Pull in notes (pick from a list filtered by book, day, or search), drag
    or up/down to order them, write between them, add section headings.
  - Scripture references in a teaching link back to the passage.
  - Export/share using the existing study-export.ts (Markdown download and
    print view) — no new export machinery.
  - These are the reader's own private teachings, separate from Yoshi's
    published /teachings tab. Label clearly: "My Teachings".
- Storage: new tables (e.g. `plan_notes`, `user_teachings`,
  `user_teaching_items`) via a migration in data-schema/migrations, API
  endpoints in api/main.py behind auth + entitlement check server-side
  (never trust the client for the lock).

## 5. For Teachers (top tier)

Added 2026-10-07 by Yoshi. A "For teachers" button on /plan for someone
leading a class, a congregation, or a family through the readings.

- Who: top paid tier only — `me.tier === "everything"` with status active or
  trialing (the 7-day trial is all access, so trial users see it too). Lower
  partner tiers see the button with a lock and the partner prompt naming the
  Everything tier (no purchase link on native, same rules as above).
  Enforce the tier server-side on every endpoint.
- Pick any stretch: next week's plan readings, a day, a month, a date range of
  the plan, or any passages the teacher chooses (book/chapter/verse ranges),
  not only plan days.
- Build an assignment on it, as deep as the teacher wants:
  - title, instructions, due date
  - questions per chapter or per day (open answer, with optional answer key)
  - key verses to memorize
  - the teacher's own notes and teachings (pull from step 3 notes and
    step 4 My Teachings)
  - section headings and free text anywhere; reorder like My Teachings
- Print / save anything — the teacher picks per printout:
  - with or without the full chapter text (option on every printout)
  - student copy (questions + blank space to write) or teacher copy
    (answer key + teacher notes)
  - a quick "print next week's readings" handout straight from the plan with
    no assignment built
- Assignments are saved to the teacher's account, can be copied to reuse next
  year, and use the existing study-export.ts (print view + Markdown download).
- Storage: `teacher_assignments`, `teacher_assignment_items` (migration in
  data-schema/migrations), endpoints in api/main.py behind auth + top-tier
  check.

## Build order

1. /plan full view (read-only) + lock + entry point. Ship-able alone.
2. Paced plan function + tests, then the pace controls on /plan.
3. Notes on days/chapters.
4. My Teachings builder + export.
5. For Teachers: assignments + printouts (top tier).

Each step deploys on its own so the member gets the full view first.

## Done when

- Free reader: sees the button with a lock; prompt has no purchase link on
  native.
- Partner: sees all 365 days, sets a pace, reads ten chapters one week and
  one the next without the plan breaking, adds notes, and turns them into a
  teaching they can download or print.
- Top-tier teacher: picks next week's readings (or any passages), builds an
  assignment with questions and an answer key, and prints a student copy and
  a teacher copy, with or without the chapter text.
- Yoshi has seen it live before it's called done.

## As built (S442, 2026-10-07) — all five steps shipped in one deploy

Yoshi chose one paste for the whole build instead of a deploy per step.

- **Who gets what.** Partner (active or trialing) gets /plan, pacing, notes and
  My Teachings. Top tier ("everything", which the trial also is) gets For
  Teachers. The server re-checks the tier on every endpoint
  (api/year_plan_study.py).
- **Position.** `position` is the last chapter read. It moves when the reader
  marks a day read on /plan, when they tap "Resume today's reading" (everything
  before today's first chapter), and when they read in order in the reader
  (opening the chapter after the next unread one, or up to 3 past it). Browsing
  elsewhere never moves it. Partners only; free readers are unchanged.
- **Today is anchored.** A day's list is fixed from the position at the start
  of that day, so reading ahead never reshuffles today. Tomorrow re-spreads.
  The weekly goal for the current week counts from the position when the week
  was first opened on that device.
- **State.** `rop_yearplan_v2` (v1 is migrated on read and left in place),
  synced to the account (`user_year_plans`, last-writer-wins; an older copy can
  never overwrite a newer one). Day and week anchors stay on each device.
- **Notes.** A separate `plan_notes` table, not study_notes. study_notes is the
  canon-verse-anchored free notepad (append-only, 10-note cap). Plan notes
  anchor to a plan day and/or any chapter in the woven order, extras included,
  with an optional verse range. Range-selection in the reader isn't wired to
  plan notes. Notes are added from /plan (any day) and from the reader's
  year-plan strip (today).
- **My Teachings / For Teachers.** One row per document with an ordered JSONB
  `blocks` array (lib/study-blocks.ts holds the block shapes): heading,
  writing, passage, plan readings, note (a copy of the note), question (with
  answer key and writing lines), memory verse. Up/down reordering. Print and
  Markdown use study-export.ts (wrapPrintDocument, openPrintHtml,
  downloadMarkdown). Printed scripture is the server text as restored; display
  prefs are not applied, same as the S203 export.
- **Teacher printouts.** Student copy (name line, writing lines, no answers,
  no teacher notes), teacher copy (answers and notes), or plain, each with or
  without the chapter text. A one-tap "Print next week's readings" is on /plan
  and /teach. "Make a copy to reuse" duplicates an assignment.
- **Plan readings for assignments** follow the reader's pace from today
  forward. Past days aren't offered; any passage can be added by hand.
- Tests: app/_s442_paced_sanity.mjs
  (`node --experimental-strip-types _s442_paced_sanity.mjs`).
