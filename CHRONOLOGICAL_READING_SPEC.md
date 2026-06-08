# Arranged Reading — Chronological Mode (Spec)

**Session:** S211 · **Status:** foundation built; ordering pending Yoshi redline; UI not yet wired.

## What this is

A **separate "Arranged Reading" menu** that lets the reader move through the
whole library in chronological order — chapter by chapter — without changing
the canonical order of any book anywhere else in the app. It is an *overlay*,
not a reordering: a saved sequence the reader can follow, with its own
next/previous and its own progress marker. Canonical browsing stays exactly as
it is.

This was Yoshi's framing (S211): *"a separate reading menu that keeps track of
reading instead of changing the actual current order of the books."*

## Update (S211, later in session) — plans are a sellable product

Yoshi's direction: the weave should be **chapter-by-chapter, in order of
event**, and the groupings should be **sellable study plans**. This promotes a
"grouping" from a visual header to a product object. Model:

- **Age** — a big time-period (Creation & the Watchers, The Patriarchs, …,
  The Messiah, The Revelation). Plain-language rename of the earlier "era."
- **Themed plan** — a small, coherent grouping of chapters inside an age
  (e.g., *The Watchers*, *The Rise of David*, *The Passion Week*). **This is the
  sellable unit.** Carries `plan_id`, `title`, `blurb`, an ordered chapter set
  (canon + extras), and a `tier`/price hook. A whole age can also sell as a
  bundle.
- **Order by event.** Every chapter sits where its events occur — prophets fall
  inside the reigns they spoke under; the Gospels read as one life. The canon
  order is built on a recognized event-chronology spine so placements are
  defensible, then framework groupings + extras layer on top.

Build sequence: (1) redline `STUDY_PLAN_CATALOG_DRAFT.md` — the product list of
ages → themed plans; (2) author the exact chapter-by-chapter event order inside
each approved plan; (3) regenerate the JSON (now carrying `plan_id` per entry +
a `plans` catalog); (4) wire reader + store. Steps below predate this update;
the overlay/extras-toggle architecture is unchanged.

## Update 2 (S211) — the verse-level weave (Yoshi's direction)

Yoshi wants the weave to go as fine as **verse by verse**, not just chapter by
chapter. Example he gave: 1 Enoch 69:10 (*Gâdreêl … led astray Eve* — confirmed
present in `enoch.json`) read inline at Genesis 3, where the serpent deceives
the woman.

Key realization: the verse-level connective tissue is the app's **existing
cross-reference thread system** (the xref / Witness / Kingdom verse-pairing
apparatus). It already links a verse to verses across the whole library. The
verse weave = surfacing those linked verses **inline in the reading**, quoted in
full (come-and-see posture), at their anchor verse — with the extras toggle
governing whether they show.

Gaps to close (extensions, not new inventions): (1) extras like Enoch are
currently quoted inside thread `summary_md`, not carried as first-class
navigable verse members — the weave needs them as anchorable verses; (2) the
specific connections (e.g., Genesis 3 ↔ 1 Enoch 69:10) get authored as threads.

Three-layer architecture: (1) chapter backbone / sellable plans → (2) verse
weave that inlines linked verses at anchor points → (3) the authored thread
connections that feed it. **Decision pending:** weave powered by Yoshi's
authored threads (recommended — framework stays the source) vs. a fully-merged
new verse-by-verse text (maximal, risks Claude inventing connections).

Each woven connection carries a **placement**: `lead-in` (the extra sits BEFORE
the canon passage, introducing the actor/backdrop) or `witness` (sits AFTER, as
illumination of what was just read). Set per connection, not globally. Gadreel
↔ Genesis 3 is a `lead-in` (1 Enoch 69 names the deceiver, so it introduces him
before the serpent scene) — Yoshi's call, S211.

First concrete demo proposed: author the Genesis 3 ↔ 1 Enoch 69:10 (+ Jubilees /
Jasher parallels) thread, placement = lead-in, and surface it inline as the seed
of the verse weave.

## Design decisions (locked S211)

- **Overlay, not reorder.** The DB `canonical_order` and the normal book picker
  are untouched. Chronological mode is a sequence laid *on top*.
- **Granularity: chapter-level.** Books are interleaved (Job in the patriarchal
  era; the prophets dropped into the Kings narrative; the Gospels grouped at the
  life of Messiah; Paul's letters ordered after Acts).
- **Extras = the framework's scripture-level library only.** Enoch, Jubilees,
  Jasher, the Adam & Eve books, Apocalypse of Abraham, Ascension of Isaiah,
  Testaments of the XII, 2 Enoch, 2/3 Baruch, the Apocrypha (incl. 3 & 4
  Maccabees), and Sonnini's Acts 29. **Josephus, the Apostolic Fathers, and
  M.R. James are excluded** — they are one-way historical witnesses per the
  voice skill, outside the scripture-level pool. They remain readable in the
  library; they're just not part of the chronological plan.
- **Extras toggle.** Every entry is tagged `source: "canon" | "extra"`. The
  reader's *"include extra-canonical books"* switch filters the extras out for a
  clean canon-only chronological read (1,189 chapters) or leaves them in
  (1,963 chapters).

## Data model

`app/src/data/chronological-reading.json` — generated by
`_s211_build_chronological_order.py`. Shape:

```
{
  "schema": "arranged-reading/chronological/v1-draft",
  "status": "DRAFT — pending Yoshi redline",
  "extras_toggle_default": false,
  "counts": { "total": 1963, "canon": 1189, "extra": 774 },
  "entries": [
    { "seq": 1, "era": "I. Creation & the Watchers",
      "edition_id": "canon", "book_id": "genesis", "book_title": "Genesis",
      "chapter": 1, "source": "canon" },
    ...
  ]
}
```

`entries` is the playlist in order. `seq` is the canon+extras position;
filtering to `source == "canon"` yields the canon-only sequence (re-number on
the client). `edition_id` + `book_id` + `chapter` is what the reader navigates
to — the same trio the rest of the app already uses to load a chapter.

The ordering lives entirely in the `SEGMENTS` list at the top of the generator.
Edit `SEGMENTS`, re-run the script, and both the JSON and the redline markdown
rebuild. **The JSON is the single source the UI reads — redlines to the
ordering never require UI changes.**

## Redline artifact

`CHRONOLOGICAL_READING_PLAN_DRAFT.md` — the same sequence in human-readable
form, eras as headings, extras marked ⟡, with rationale notes. This is the file
to mark up. Open items flagged for Yoshi:

- **Job's placement** (currently opening the Patriarchs era).
- **Psalms** kept whole in the United Kingdom era — a by-occasion scatter
  (Davidic psalms across 1–2 Samuel, etc.) is the deeper version.
- **Chronicles/Kings parallels** kept as blocks rather than verse-interleaved.
- **The pre-exilic prophets** placed in 8th-/7th-century groupings; Obadiah and
  Joel dating is genuinely disputed.
- **Ezra / Nehemiah / Haggai / Zechariah** kept as whole blocks; the fine
  interleave (Ezra 1–6 → Haggai/Zechariah → Ezra 7–10) is deferred.
- **The Gospels** kept as four blocks; a true harmony is a separate effort.
- **Acts + the letters** — Acts whole, then letters in rough date order; a true
  interleave of each letter into the Acts timeline is deferred.
- **Extras ordering within each era** is a first pass — reorder freely.

## UI plan (next step, after the ordering is approved)

In `app/src/App.tsx`, add an **Arranged Reading** entry to the reader menu:

1. A mode the reader enters from the menu (alongside the normal picker).
2. Loads `chronological-reading.json`; builds the active sequence by filtering
   on the extras toggle.
3. Chronological **next/previous** that walks the sequence and loads each
   `edition_id`/`book_id`/`chapter` via the existing chapter fetch.
4. **Progress tracking** — remember the reader's position in the sequence
   (the app already persists reading state; reuse that path), so "continue
   chronological reading" resumes where they left off.
5. The **"include extra-canonical books"** toggle, defaulting off (canon-only),
   re-deriving the sequence live.

No schema or API change is required for v1 — the sequence is a static client
data file and navigation reuses the existing per-chapter loader. (A later
version could persist the plan and per-user progress server-side.)
