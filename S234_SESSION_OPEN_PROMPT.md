# S234 — Session Open Prompt

**Read first:** `NEXT_SESSION_HUB_DEVOTIONALS_YEARPLAN_ROADMAP.md` (full plan + decisions).

## This session = Session 1 (the two small, foundational pieces)

### Task 1 — Devotional "Themes" button (Part A.3 step 1)
- File: `src/routes/Today.tsx`, `DevotionalCard`.
- Replace the bare `<select>` with a proper "Themes" button that opens a small sheet/list:
  each theme shows title + one-line subtitle + entry count; selecting one calls the existing
  `setActiveTheme` and bumps `themeTick`.
- Show it whenever `listThemes().length > 1` (still hidden while only one theme exists).
- No content authoring this session — UI only.

### Task 2 — Shared reckoning store (Part C.3 step 1)
- New app-wide localStorage key (e.g. `cal.reckoning`) = the single source of truth for the
  chosen biblical-calendar reckoning.
- **Default to HebCal (rabbinic) when unset.**
- Write it from BOTH the Today hub dials (`src/routes/Today.tsx`) and the Calendar route
  (`src/routes/Calendar.tsx`); have both read from it on load.
- Small helper module (e.g. `src/lib/calendar/reckoning-pref.ts`) with get/set + default.

## Guardrails
- Don't touch the Part 0 fixes already shipped (MyStudy token-await; Today door order).
- Run `npx tsc -b` before wrapping; keep it green.
- Aesthetic per `DESIGN_LANGUAGE.md` (chrome-metal, gold/emerald, no grey).
- Native build + on-device check is a separate step (`S175_GRADLE_BUILD_RUNBOOK.md`).

## Next after this
Sessions 2–3 fan out (4 devotional themes via the `yoshi-voice` skill, in parallel with the
year-plan pacing foundation B-1). See roadmap "Suggested sequencing."
