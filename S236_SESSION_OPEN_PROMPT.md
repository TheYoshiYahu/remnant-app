# S236 — Session Open Prompt

Read first: `NEXT_SESSION_HUB_DEVOTIONALS_YEARPLAN_ROADMAP.md` (Part C) and the `yoshi-voice`
skill. App lives in `App/app/`.

This session = **Session 5: Torah Portions** — wire the parsha helper into a reader panel
(C-2 + C-3). C-1 (the shared reckoning store) is already built; B-1/B-2/B-3 (the year plan +
reader header + calendar cross-link) shipped in S234/S235 and are type-clean.

## Build on (do not modify)

- `src/lib/calendar/reckoning-pref.ts` — the single source of truth for the elected reckoning.
  `getReckoningPref()` / `setReckoningPref(kind)`, localStorage key `cal.reckoning`,
  `MonthKind = "conjunction" | "crescent" | "rabbinic" | "enoch"`, **default `"rabbinic"`
  (HebCal) when unset.** This is C.5's fallback already implemented.
- `src/lib/calendar/` engine (`compute`, `buildLayerGrid`, `engine.ts`) — the source of truth
  for *which day is the Sabbath* under any reckoning. `LayerCell` carries `weekday`,
  `morningSabbath`, `eveningSabbath`. Read it; don't reorder or alter it.
- `@hebcal/core` is already installed (`package.json`). It provides the parsha **name + order +
  opening reference** (the annual cycle is natively rabbinic in HebCal).
- `src/components/YearPlanHeader.tsx` — the reader header from S235. It already has a **disabled
  `TorahPortionsButton` stub**; this session replaces it with the real button that opens the
  panel. The header already receives `onNavigate(slug, chapter)` and drives the reader — reuse
  that exact prop for tap-through.
- The reader honors a `?book=<slug>&chapter=<n>` deep link (added S235 in `App.tsx`,
  `readReaderDeepLink`) — available if you surface tap-through from the calendar too.

## Task 1 — C-2: parsha helper over `@hebcal/core` (+ test)

New pure module, e.g. `src/lib/torah/parsha.ts`. Given a date **and** the elected reckoning,
return the current Torah portion: name, the Torah reading ref, Haftarah, and the **opening
chapter as `{ book_id, chapter }`** so the reader can jump to it.

**C.5 reckoning rule (RESOLVED with Yoshi — implement exactly):**
- **No reckoning chosen → align to HebCal** (rabbinic/calculated). This is the default path and
  the simple case: call HebCal's date-keyed parsha directly.
- **A reckoning IS chosen (dark moon / crescent / Enoch) → keep HebCal's portion *list/order*,
  but drive *which Sabbath* from the elected reckoning.** Anchor the cycle to the reader's
  Sabbath as computed by the existing calendar engine and walk the portion list from there —
  do **not** force the rabbinic date-keyed parsha back on a non-rabbinic reader.

**Watch out:** HebCal's book names (e.g. "Genesis") must be mapped to the reader's `book_id`
slugs (the same slugs `chronological-reading.json` / the book picker use) for tap-through to
work — build and unit-test that mapping. Mirror the `_s234_yearplan_sanity.mjs` standalone-test
style (`node _s236_parsha_sanity.mjs`); `@hebcal/core` imports fine under bare node, so the
test can call the real package. Assert: known dates → known parshiot for rabbinic; the
non-rabbinic anchor lands on the elected Sabbath; every parsha's opening ref maps to a real
`book_id`.

## Task 2 — C-3: "Torah portions" panel + reader button + tap-through

Replace the `TorahPortionsButton` stub in `YearPlanHeader.tsx` with a live button that opens a
panel showing **this week's portion** (Torah + Haftarah; add a Brit Chadashah pairing only if
trivial). Each reference taps through into the reader at the portion's opening chapter via the
existing `onNavigate(slug, chapter)`. The panel reads the elected reckoning from
`reckoning-pref` so it stays consistent with the calendar and the year plan.

Optional (only if time): surface the portion name in the calendar `DayView`
(`src/routes/Calendar.tsx`) next to the existing "Today's reading" cross-link.

## Guardrails

Don't touch Part 0 fixes, the S234 themes/reckoning work, the B-1 pacing/`plan-store`, or
`ArrangedReading.tsx`'s internals beyond wiring. Aesthetic per `DESIGN_LANGUAGE.md`
(chrome-metal, gold/emerald, no grey). Run `npx tsc -b --force` before wrapping; keep it green.
Native/Vite build + on-device check is a separate step on the Mac.

## Next after this

- **Session 6:** integration + native build + on-device pass; flip `DEVOTIONAL_IS_SEED`.
- Still open: the **120 devotional entries await Yoshi's voice review** before release; the four
  felt-need themes (Part A) still need authoring/integration.
