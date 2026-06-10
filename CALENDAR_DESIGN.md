# Biblical Calendar Engine — Design

The configurable computation core for every calendar feature in the Remnant
of Promise app. This document is the spec; the engine in
`app/src/lib/calendar/` is built to it. Where the sources disagree and a
judgment call was required, the choice is recorded here under **Decision**.

---

## 0. Core principle — compute, don't scrape

Everything deterministic is **calculated locally**: offline, for any year,
at any location, with no network. The astronomy comes from
[`astronomy-engine`](https://github.com/cosinekitty/astronomy) (a pure-JS,
high-accuracy ephemeris — VSOP87/ELP-class) — we do **not** hand-roll
ephemeris math. The rabbinic arithmetic and the Enoch 364-day count are pure
integer math.

The **only** things that come from outside are genuinely empirical and cannot
be derived from physics:

- **Actual crescent sightings** (was the moon physically seen?).
- **Aviv / barley reports** (was the barley in Israel ripe enough?).

These arrive through a **feed interface** (stubbed for now) or **manual
entry**. The engine never fabricates them; when an empirical input is required
but absent, the engine reports the state honestly as **pending** rather than
committing to a date it cannot know.

---

## 1. Two independent dials

A calendar configuration is the product of two **independent** choices. The
month dial decides where a *month* begins; the year dial decides where the
*year* begins (which lunation is month 1). They compose freely for the lunar
families. Enoch and rabbinic are self-contained systems that supply their own
year-start, so the year dial is ignored for them (noted at runtime).

```
CalendarConfig = {
  month:    MonthReckoning      // dial A
  year:     YearReckoning       // dial B (lunar families only)
  location: GeoLocation         // lat/lon/elevation — for sunset & visibility
  override?: ManualOverride     // universal escape hatch (§4)
  qumranFestivals?: boolean     // Enoch extras behind a flag (§6)
}
```

### Dial A — MONTH-START reckoning

| Mode | How the month begins | Source |
|------|---------------------|--------|
| `conjunction` | True astronomical new moon (sun–moon conjunction). | computed |
| `crescent` | Predicted first visibility of the young crescent at the configured location, by an established criterion. | computed (+ optional empirical confirm) |
| `rabbinic` | Calculated fixed Hebrew calendar: the molad (mean conjunction) plus the four dechiyot. | computed |
| `enoch` | 364-day solar calendar. **Its own engine — not a lunar sub-option.** | computed |

**`conjunction`.** We compute the conjunction instant
(`SearchMoonPhase(0)`). A biblical day runs sunset→sunset at the location.

> **Decision (conjunction day-rule).** The month's day 1 is the
> sunset-to-sunset day *in which the conjunction instant falls*, evaluated at
> the configured location. (Alternative rules — "first sunset strictly after
> conjunction" — differ by at most one day; we expose the chosen rule and
> document it rather than silently picking.)

**`crescent`.** Compute the conjunction, then evaluate predicted naked-eye
visibility on successive evenings using a visibility criterion at the
**best time** (Yallop's lag fraction, `sunset + 4/9·(moonset − sunset)`):

- **Criterion** (selectable): **Yallop (1997)** *q*-value, or **Odeh
  (2004)** *V*-value. Both take the topocentric arc of vision (ARCV) and the
  crescent width *W*; both return a zone from "easily visible" to "not
  visible."
- **Sub-modes:**
  - `predicted` — trust the computed first-visible evening.
  - `local-confirm` — the user taps **"I sighted it"** to set the month
    here; until they do, the engine holds the month in **pending**.
  - `jerusalem-verified` — defer to a verified-sighting **feed** (stubbed;
    `VerifiedSightingFeed` interface). Until the feed reports, **pending**.
- **PENDING vs CONFIRMED — the honesty rule.** On a borderline evening the
  truth is "the month begins **tonight if the crescent is sighted, else
  tomorrow**." For the sighting sub-modes the engine returns
  `status: 'pending'` carrying both candidate start-days
  (`tonightIfSighted`, `elseTomorrow`) until a real sighting (manual or feed)
  resolves it. `predicted` self-resolves (it treats the prediction as
  authoritative) and returns `confirmed`. We never falsely commit.

**`rabbinic`.** The standard fixed Hebrew calendar, implemented from the
molad and the four postponement rules (dechiyot):

1. **Lo ADU Rosh** — Rosh Hashanah may not fall on Sun (1 / *Aleph*),
   Wed (4 / *Daled*), or Fri (6 / *Vav*).
2. **Molad Zaken** — if the molad is at or after 18h00m0p (noon, in the
   evening-anchored day), RH is postponed a day.
3. **GaTaRaD** — in a **common** year, a molad on **Tuesday** at/after
   **9h204p** postpones (to Thursday).
4. **BeTU(net)TaKPaT** — in a year **following a leap** year, a molad on
   **Monday** at/after **15h589p** postpones a day.

> **Decision (rabbinic verification).** We compute the molad in the
> traditional BaHaRaD frame and apply the four rules transparently to derive
> the Rosh Hashanah weekday and postponement. We independently place RH on the
> civil calendar with the well-trusted Dershowitz–Reingold elapsed-days
> formula. Tests assert the two agree on weekday for every year in a wide
> range **and** that civil RH dates, year-length classification, and month
> lengths match `@hebcal/core` over many years. `@hebcal/core` is a
> cross-check, **not** a runtime dependency of the reckoning.

**`enoch` — the 364-day solar calendar.** A separate engine that **rejects
the moon entirely**:

- **364 days = 4 quarters × 91 days**; within each quarter the months run
  **30, 30, 31** (the 31st day caps quarters at months 3, 6, 9, 12).
- **52 weeks exactly** (364 = 52×7) ⇒ **every calendar date falls on a fixed
  weekday, every year.** Year starts traditionally on **Wednesday** (day 4 —
  the day the luminaries were created, Gen 1:14–19).
- **Equinox-anchored:** the year begins at/after the spring equinox.
- **Intercalation sub-dial:**
  - `equinox-reanchor` — each year's New Year is recomputed as the first
    Wednesday on/after the spring equinox; drift self-corrects (a short gap of
    days appears between one 364-day year and the next anchor).
  - `leap-week` — keep counting fixed 364-day years but insert a 7-day leap
    week on a fixed period to track the ~1.2422 d/yr drift, preserving the
    fixed weekday grid (a leap *week*, never a leap *day*, is the only
    intercalation that keeps weekdays fixed). Period is configurable.
  - `none` — pure 364, no correction; weekdays fixed forever, seasons drift.

> **Decision (Enoch open questions).** The Enoch/Jubilees/Qumran corpus does
> not settle intercalation; the three sub-modes above make the choice explicit
> rather than hiding one. Default leap-week period is 7 years (≈ the best small
> integer fit to 1.2422 d/yr → ~5.6 d/yr accumulates, the closest practical
> week-cadence debated in the literature); it is a config knob, not a claim.
> `equinox-reanchor` is the default Enoch mode — it needs no fudge constant.

### Dial B — YEAR-START reckoning (lunar families only)

Decides which new moon is **month 1** (Aviv / the first month).

| Mode | How the year begins | Source |
|------|--------------------|--------|
| `aviv` | The new moon on/before which the barley in Israel is *aviv* (ripening). **Cannot be computed** — agricultural observation. | feed / manual (stubbed) |
| `equinox` | The new moon rule tied to the spring equinox. | computed |

> **Decision (equinox year-rule).** Month 1 is the lunar month whose **start
> (per the active month dial) is the first such start that is on or after the
> spring equinox** — equivalently, the new moon nearest to / first after the
> equinox. This is the common computable "equinox" rule; the precise variant
> (equinox before 1/1 vs. before the *full* moon of month 1) is documented and
> selectable later if needed. For `aviv`, with no feed/manual datum the engine
> falls back to the equinox rule and flags the result `assumedYearStart: true`
> so the UI can show the barley caveat honestly.

---

## 2. Time, days, and locations

- **Day boundary.** Biblical days begin at **sunset** at the configured
  location (`SearchRiseSet('Sun', -1)`), except `rabbinic` (fixed calendar,
  civil-date granular) and `enoch` (whole-day grid; its day boundary is also
  sunset, but month math is integer day counts off the anchor).
- **Location.** `GeoLocation = { latitudeDeg, longitudeDeg, elevationM }`.
  Default = **Jerusalem** (31.7683°N, 35.2137°E, 754 m). Visibility and sunset
  are genuinely location-dependent; conjunction and equinox instants are not,
  but the *day* they land on is.
- **Instants** are JS `Date` (UTC under the hood). All public outputs carry
  ISO instants; the engine does no timezone localization itself (a UI concern).

---

## 3. Outputs (pure functions)

`computeBiblicalDate(date: Date, config: CalendarConfig): EngineResult`

```
EngineResult = {
  config, queryInstant,
  biblicalDate: { year, month, day, monthName? },   // current Y/M/D
  monthStart:   {
     startInstant,                 // sunset that began the current month
     status: 'confirmed'|'pending',
     pending?: { tonightIfSighted, elseTomorrow, reason }
  },
  yearStart?:   { startInstant, assumed?: boolean },
  moedim:       Moed[],            // upcoming appointed times (§5)
  notes:        string[]          // honest caveats (assumed aviv, ignored dial, etc.)
}
```

Every function is pure and typed; no globals, no I/O (feeds are injected).

---

## 4. The universal override (escape hatch)

`ManualOverride` lets a user **set their own start day / enter their own
dates** and is honored above every computed reckoning, so no one is ever
locked out by a disagreement in method:

```
ManualOverride =
  | { kind: 'monthStart', startInstant: Date }      // "my month started here"
  | { kind: 'fullDate', year, month, day, anchorInstant }  // "today is Y/M/D"
```

When present the engine anchors to the override and counts forward/back from
it, tagging `notes` so the UI can show "manual" honestly.

---

## 5. Moedim — Leviticus 23 appointed times

Computed as month/day offsets, then resolved to civil instants via the active
month/year dials:

| Moed | Date | Notes |
|------|------|-------|
| Passover (Pesach) | 1/14 (evening) | |
| Unleavened Bread | 1/15–1/21 | 1/15 & 1/21 are holy convocations |
| Firstfruits / Wave Sheaf | **contested** | rabbinic 1/16; "morrow after the Sabbath" (Sunday) for Qumran/Karaite — selectable |
| Weeks (Shavuot) | Firstfruits + 50 days | counted (the Omer) |
| Trumpets (Yom Teruah) | 7/1 | |
| Atonement (Yom Kippur) | 7/10 | |
| Tabernacles (Sukkot) | 7/15–7/21 | + 8th day 7/22 (Shemini Atzeret) |

For **Enoch** configs the moedim land on their **fixed Enoch dates / fixed
weekdays** (e.g. Passover 1/14, Wave Sheaf the day after the weekly Sabbath in
UB week → 1/26 Sunday, Weeks 3/15 Sunday). Behind `qumranFestivals` the engine
also emits the Qumran **extra** festivals from the Temple Scroll / 4QMMT:

- **New Wine** — 5/3 (Sunday)
- **New Oil** — 6/22 (Sunday)
- **Wood Offering** — 6/23 for six days (6/23–6/28; the reconstruction varies)

New Wine, New Oil and the firstfruits feasts sit at 50-day intervals (Weeks →
New Wine → New Oil), all on fixed weekdays in the 364-day grid. The Enoch
Wave-Sheaf / Firstfruits is fixed at **1/26** — the morrow after the weekly
Sabbath that *follows* Unleavened Bread — not the Sunday within it.

---

## 6. Module map (`app/src/lib/calendar/`)

```
types.ts      all config / result / enum types
astro.ts      thin typed wrapper over astronomy-engine
              (conjunction, springEquinox, sunset, moonset, topo sun/moon, elongation)
crescent.ts   Yallop & Odeh visibility criteria → zone + pending logic
molad.ts      rabbinic molad + four dechiyot; Dershowitz–Reingold civil placement
enoch.ts      364-day engine (3 intercalation sub-modes), fixed-weekday grid
year.ts       year-start: equinox rule + aviv feed/manual fallback
feeds.ts      VerifiedSightingFeed + AvivReportFeed interfaces (stubs + manual)
moedim.ts     Leviticus 23 + Qumran extras
engine.ts     computeBiblicalDate orchestrator (applies override, picks dial)
demo.ts       tiny console harness to eyeball output
index.ts      barrel exports (public API)
*.test.ts     runner-agnostic tests (project convention: tsx/node strip-types)
```

**Test convention.** The repo wires no test runner; `.test.ts` files use the
established self-running harness (a `typeof describe === 'function'` guard,
else a plain-assert fallback that `process.exit(1)`s on failure) and run via
Node 24 type-stripping. We follow it.

---

## 7. What this pass delivers / defers

**Delivers:** the engine, the design doc, unit tests against known
astronomical new moons & equinoxes, multi-year rabbinic cross-check vs
`@hebcal/core`, Enoch fixed-weekday invariants, crescent-criterion invariants,
moedim, and a console demo.

**Defers (follow-up):** the full UI; a live verified-sighting feed and a live
aviv feed (only the interfaces + manual entry are built now); per-tradition
fine-tuning of the Firstfruits/equinox variants beyond the selectable ones.
