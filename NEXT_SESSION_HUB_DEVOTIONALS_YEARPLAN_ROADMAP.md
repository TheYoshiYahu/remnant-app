# Roadmap — Hub fixes, Devotional Themes, Read-the-Scriptures-in-a-Year, Torah Portions

_Authored from a working session, 2026-06-20. Covers four items Yoshi raised. Two were
small enough to ship in-session (Part 0). The other three are multi-session builds with
a minion (subagent) breakdown below._

---

## Part 0 — Shipped this session (already in the tree)

### 0.1 — My Notes / My Study false paywall (FIXED)
**Symptom:** Opening "My Study" from the Today hub showed a "purchase this feature"
paywall, but the same notes worked when opened from inside the reader.

**Root cause:** `src/components/MyStudy.tsx` fired `getStudyIndex()` on mount **without
first awaiting `loadStoredNativeToken()`**. Opening via the hub deep-link (`/read?study=1`)
mounts MyStudy before the JWT cache is warm on the native shell, so the request went out
unauthenticated → server returned free-tier (`note_cap !== null`) → `isPaid` resolved
`false` → paywall. (Same class of bug fixed for `/me` and notes in S178/S200/S201.)

**Fix:** awaited `loadStoredNativeToken()` before `getStudyIndex()`, mirroring the
existing `/me` and notes fetch pattern in `App.tsx`. `src/components/MyStudy.tsx`,
new import + effect wrapper. Verified `tsc -b` clean.

### 0.2 — Today hub: doors moved to the top (DONE)
**Change:** In `src/routes/Today.tsx` the `<DoorRow/>` (Read / The Appointed Times /
My Study) now renders directly under the title, **above** the date + onboarding panel, so
the partner meets the doors without scrolling. Verified `tsc -b` clean.

> Both changes still need a native build + on-device check before release (see
> `S175_GRADLE_BUILD_RUNBOOK.md`). They are source-correct and type-clean.

---

## Part A — Devotional Themes

### A.1 — What already exists
- The theme picker UI **is already in `Today.tsx`** (`DevotionalCard`, a `<select>`),
  but it only renders when `listThemes().length > 1`. Today there is **one** theme, so it
  never shows.
- Theme/entry model: `src/lib/devotional/types.ts`. Content: `src/lib/devotional/content.ts`
  (one theme, `appointed-times`, 7 entries). Selection/rotation: `src/lib/devotional/index.ts`
  (active theme persisted at localStorage `rop_devotional_theme_v1`; day→entry is
  `entries[ordinal mod N]`, so N entries = N-day cycle).

### A.2 — Decisions (locked with Yoshi)
- **Build all four felt-need themes below.** These are the topics people actually tap in
  Bible apps' "search by emotion" / topical plans — written through the ministry voice
  (restored names, covenant-rooted, the "come home" posture).
- **~30 entries each** → a roughly monthly rotation; daily readers won't see a repeat soon.
- Keep the existing **Appointed Times** theme as the fifth.

**Themes to build (Phase A1):**
1. **Peace for the Anxious** — anxiety/worry; casting care, the peace that guards the heart.
2. **When You're Afraid** — fear; "fear not," courage, the Father's presence in trouble.
3. **Hope & Endurance** — perseverance, strength in trial and suffering, waiting on deliverance.
4. **Grief & Comfort** — loss, mourning, "near to the brokenhearted."

**Future catalog (Phase A2+, not yet committed):** Forgiveness · Identity (who you are in
the covenant) · Prayer · Gratitude · Marriage & Household · Coming Home (Return / teshuvah)
· The Remnant. Each follows the same model; add when the first four are proven.

### A.3 — Work breakdown
1. **UI upgrade (small, 1 session):** in `Today.tsx`, replace the bare `<select>` with a
   proper "Themes" affordance (a button opening a small sheet/list showing each theme's
   title + one-line subtitle + entry count). Keep `setActiveTheme` / `themeTick` plumbing.
   Show it whenever `themes.length > 1`.
2. **Content authoring (the bulk — parallelizable):** author ~30 `DevotionalEntry` objects
   per theme into `content.ts`, append each `DevotionalTheme` to the `THEMES` array.
   **Each entry MUST be written using the `yoshi-voice` skill** (read it first — restored
   names, parenthetical conventional English, the come-home invitation, the closing line).
   Entry shape (verbatim from the existing set):
   ```ts
   { id, title, subtitle, passageRef, passageText, reflection, invitation, closing }
   ```
3. **Flip the seed flag** (`DEVOTIONAL_IS_SEED`) once the library is substantial, so the
   "seed set" footnote on the hub goes away.

### A.4 — Minion plan (Phase A1)
- **Minion A-1:** UI upgrade in `Today.tsx` (the themes button + sheet). Independent.
- **Minions A-2 … A-5:** one per theme — draft ~30 entries in Yoshi's voice, each verified
  against the `yoshi-voice` skill, returned as a ready-to-paste `DevotionalTheme` block.
  These run in parallel; they touch only their own content block.
- **Integration pass:** one session pastes the four blocks into `content.ts`, wires them
  into `THEMES`, runs `tsc -b` + a quick rotation sanity check.

### A.5 — Acceptance
Five themes selectable on the hub; picking one persists and rotates daily; no repeats inside
a month; every entry passes a `yoshi-voice` review.

---

## Part B — Read the Scriptures in a Year

### B.1 — What already exists
- `src/data/chronological-reading.json` — full Creation→Revelation sequence, **1,963
  chapters** (1,189 canon + 774 extra-canonical). Schema per row:
  `{ seq, era, edition_id, book_id, book_title, chapter, source: "canon" | "extra" }`.
- `src/components/ArrangedReading.tsx` — a working reading-plan UI: canon/extras toggle
  (`rop_arranged_extras_v1`), position persistence (`rop_arranged_pos_v1`), era jump, resume,
  progress %. **Built but not fully wired into the reader's entry points.**
- Specs: `CHRONOLOGICAL_READING_SPEC.md`, `CHRONOLOGICAL_READING_PLAN_DRAFT.md`,
  `STUDY_PLAN_CATALOG_DRAFT.md`.

### B.2 — Decisions (locked with Yoshi)
- **Chronological order** (reuse the existing sequence; do not reorder books elsewhere).
- Reader chooses **just the canon** _or_ **all of scripture** (canon + apocrypha/
  pseudepigrapha) — already the canon/extras toggle in `ArrangedReading`.
- Pace into **~365 daily portions.** Math: canon ≈ 3–4 chapters/day; all-scripture ≈ 5–6/day.
- **Cross-link to the calendar:** the day's assigned chapters appear in the calendar day
  windows (`/calendar`) and on the Today hub's date.

### B.3 — The gap to close
1. **Daily pacing layer (new):** the JSON is an _order_, not a _schedule_. Add a small
   builder that chunks the active sequence (canon-only or all) into 365 day-buckets and
   stores the plan's start date + chosen scope. Day N = today − startDate. Persist the plan
   state (scope, start date, position) in localStorage (and, for signed-in partners,
   alongside reading-position if we want cross-device).
2. **Reader date header + buttons (new):** at the top of the study Bible, show **today's
   date localized to the reader's location** (`Intl.DateTimeFormat`, device tz), and beneath
   it two buttons:
   - **"Start to read the scriptures in a year"** → scope picker (canon / all) → starts the
     plan and drops the reader at day 1, resuming on day N thereafter (drive `ArrangedReading`).
   - **"Torah portions"** (Part C).
3. **Calendar cross-link (new):** inject the day's assigned chapter(s) into the calendar
   day cell + day-view modal. Extension point: `LayerCell` in
   `src/lib/calendar/day-view-model.ts` (add an optional `readingAssignment`), rendered in
   `Calendar.tsx`'s day cell + `DayView`. Tapping the assignment opens the reader at that
   chapter via the existing `onNavigate(slug, chapter)`.

### B.4 — Minion plan
- **Minion B-1:** pacing builder (sequence → 365 buckets, scope-aware) + plan-state store +
  unit test (mirror the existing `_s*_sanity.mjs` style). Pure logic, no UI. Foundational —
  others depend on it.
- **Minion B-2:** reader date header + the two buttons + scope picker; wire "start/resume"
  into `ArrangedReading`. Depends on B-1.
- **Minion B-3:** calendar cross-link — `LayerCell.readingAssignment` + render in `Calendar.tsx`
  cell & `DayView`, tap-through to reader. Depends on B-1.

### B.5 — Acceptance
A reader can start the year plan, pick canon or all-scripture, and each day the reader header,
the calendar windows, and the Today date all show that day's portion; tapping it opens the
text; position resumes across sessions.

---

## Part C — Torah Portions

### C.1 — What already exists
- `@hebcal/core` **is installed** (`package.json`) and provides parsha (Torah-portion)
  lookups by date. **No parsha code exists yet** (grep for `parsha|torah.?portion` = 0 hits).
- Reckoning model: `ReckoningState` / `MonthKind` / `DEFAULT_RECKONING` in
  `src/lib/calendar/view-model.ts` (`conjunction | crescent | rabbinic | enoch`).
- **Gap:** the chosen reckoning is read from the URL (`?reck=…`) and **not persisted** to
  localStorage. Today.tsx persists its own simplified `rop_today_reckoning_v1`, but there's
  no single app-wide reckoning preference.

### C.2 — Decisions (locked with Yoshi)
- A **"Torah portions"** button beside "Start to read the scriptures in a year" in the reader.
- Portion is tied to the date **and the user's biblical-calendar reckoning**.
- **If no reckoning has been chosen, default to HebCal (rabbinic/calculated).**

### C.3 — Work breakdown
1. **Persist a single reckoning preference (new):** add an app-wide localStorage key (e.g.
   `cal.reckoning`) written by both the Today hub dials and the Calendar route, defaulting to
   **HebCal/rabbinic** when unset. This is the shared source of truth for portions + plan.
2. **Parsha lookup (new):** a small helper over `@hebcal/core` that returns the current
   Torah portion for a given date under the chosen reckoning (the standard annual cycle keys
   off the rabbinic calendar; for non-rabbinic reckonings, decide whether to map to the
   nearest rabbinic Shabbat or compute against the chosen month-start — **flag for Yoshi**).
3. **"Torah portions" UI (new):** the button opens a panel showing this week's portion
   (Torah + Haftarah + any Brit Chadashah pairing you want), with tap-through into the reader
   at the portion's opening chapter via `onNavigate`. Optionally surface the portion name in
   the calendar day-view too.

### C.4 — Minion plan
- **Minion C-1:** the shared reckoning store + HebCal default. Small, foundational; A/B can
  adopt it too.
- **Minion C-2:** parsha helper over `@hebcal/core` + test. Depends on C-1.
- **Minion C-3:** Torah-portions panel + reader button + tap-through. Depends on C-1/C-2.

### C.5 — Reckoning behavior (RESOLVED with Yoshi)
- **No reckoning chosen → align to HebCal** (rabbinic/calculated). This is the default.
- **A reckoning IS chosen → follow the reader's elected reckoning** (dark moon / crescent /
  Enoch): the portion is computed against their chosen calendar's Sabbath, not forced back to
  the rabbinic cycle. HebCal is only the unset fallback.

> Implementation note for C-2: the annual parsha cycle is natively rabbinic in `@hebcal/core`.
> For a non-rabbinic reckoning, anchor the cycle to the reader's Sabbath as computed by the
> existing calendar engine (`src/lib/calendar/`) and walk the portion list from there, rather
> than calling HebCal's date-keyed parsha directly. Keep HebCal's portion *list/order*; drive
> the *which-Sabbath* from the elected reckoning.

---

## Suggested sequencing

1. **Session 1 (small, high value):** ship Part 0 to a build; do A.3 step 1 (themes button UI)
   and C.3 step 1 (shared reckoning store) — both small, both unblock later work.
2. **Sessions 2–3 (parallel):** fan out the four devotional themes (Minions A-2…A-5) **and**
   the year-plan foundation (B-1) at the same time — they don't touch the same files.
3. **Session 4:** B-2 + B-3 (reader header/buttons + calendar cross-link).
4. **Session 5:** C-2 + C-3 (parsha helper + Torah-portions panel), after Yoshi answers C.5.
5. **Session 6:** integration + native build + on-device pass; flip `DEVOTIONAL_IS_SEED`.

## Decisions captured
- Devotional themes: **build all four** felt-need themes (Peace for the Anxious, When You're
  Afraid, Hope & Endurance, Grief & Comfort) in Yoshi's voice; keep Appointed Times.
- Devotional depth: **~30 entries/theme** (monthly rotation).
- Year plan order: **chronological**, canon / all-scripture selectable.
- Torah portions: **HebCal when no reckoning chosen**; otherwise **follow the reader's
  elected reckoning** (keep HebCal's portion list/order, drive the which-Sabbath from the
  chosen calendar). See C.5.
