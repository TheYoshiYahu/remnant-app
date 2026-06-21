# S235 — Session Open Prompt

Read first: `NEXT_SESSION_HUB_DEVOTIONALS_YEARPLAN_ROADMAP.md` (Part B) and the `yoshi-voice` skill. App lives in `App/app/`.

This session = **Session 4**: wire the year-plan into the reader and calendar (B-2 + B-3). The B-1 foundation is already built and tested.

## Build on (do not modify the internals of)
- `src/lib/reading-plan/pacing.ts` + `src/lib/reading-plan/plan-store.ts`
  - localStorage key `rop_yearplan_v1` = `{ scope: "canon" | "all", startDateISO, position }`.
  - Day N is **1-indexed**, clamped to [1, 365], compared by civil day.
  - `position` shares the `seq` unit with `ArrangedReading` (key `rop_arranged_pos_v1`) so the two can resume together.
  - Useful exports: `buildYearPlan(scope)`, `readingForDay(plan, dayNumber)`, `startYearPlan(scope, startDateISO?)`, `getYearPlanState()`, `updateYearPlanState(patch)`, `todayISO()`.
- Reckoning source of truth: `src/lib/calendar/reckoning-pref.ts` (`cal.reckoning`, default rabbinic/HebCal).

## Task 1 — B-2: reader date header + buttons
- At the top of the study Bible reader, show **today's date localized to the device** (`Intl.DateTimeFormat`, device tz).
- Beneath it, two buttons:
  - **"Start reading the scriptures in a year"** → scope picker (canon / all-scripture) → starts the plan via `plan-store` and drops the reader at day 1, resuming at day N thereafter. Drive `ArrangedReading` for start/resume.
  - **"Torah portions"** → stub/placeholder for Session 5 (C-2/C-3).

## Task 2 — B-3: calendar cross-link
- Add an optional `readingAssignment` field to `LayerCell` in `src/lib/calendar/day-view-model.ts`.
- Render the day's assigned chapter(s) in `Calendar.tsx`'s day cell + `DayView`.
- Tapping the assignment opens the reader at that chapter via the existing `onNavigate(slug, chapter)`.

## Guardrails
- Don't touch the Part 0 fixes (MyStudy token-await; Today door order) or the S234 work (devotional themes, shared reckoning store, support button). Don't modify `ArrangedReading.tsx`'s internals beyond wiring start/resume.
- Aesthetic per `DESIGN_LANGUAGE.md` (chrome-metal, gold/emerald, no grey).
- Run `npx tsc -b` before wrapping; keep it green. Native + on-device check is a separate step (`S175_GRADLE_BUILD_RUNBOOK.md`); the Linux sandbox only type-checks (no `vite build`).

## Next after this
- **Session 5:** C-2 + C-3 — parsha helper over `@hebcal/core` + Torah-portions panel (reckoning behavior per roadmap C.5).
- The 120 S234 devotional entries (Peace for the Anxious · When You're Afraid · Hope & Endurance · Grief & Comfort) still await Yoshi's own voice review before release.
- `DEVOTIONAL_IS_SEED` stays `true` until the integration session (Session 6).
