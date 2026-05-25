# Chapter-End Cross-Reference Card — API + Render Contract

Session 73 wheel deliverable, 2026-05-17. Free-tier feature; every paid tier inherits via the strict chain locked Session 72. Architecture revised at Session 75 close — the comprehensive-baseline-as-future-TSK-ingestion direction is rolled back; cross-references are interpretive artifacts, every pair is a curated framework-bearing call, the threads ARE the apparatus.

This document is the **contract** between the FastAPI service and the PWA reader. The schema sits behind it (data-schema/schema.sql, Section 4 + Section 4b); this file describes what the API returns and how the reader renders it.

---

## The user story

A reader finishes Matthew 25 in the reader UI. Below the last verse, before the next-chapter affordance, a card appears titled *Tanakh Sources for Matthew 25*. The card has two layers, both populated from the same curated `cross_references` table.

**Layer 1 — per-verse cross-references.** For every verse in Matthew 25 that has at least one curated cross-reference back to the Tanakh, the card lists the source verse, the target verse(s), and a short prose preview of each target. Every row in the table is a framework-bearing call that passed the 12 Red Lines and the 12-point editorial checklist before it landed — there is no neutral baseline underneath. The Reformation's idea of a "comprehensive" cross-reference corpus assumes neutrality the framework refuses (Red Line #2); the apparatus grows by curated threads, not by mass ingestion.

**Layer 2 — framework threads.** Above (or beside) the per-verse list, any *cross-reference thread* whose members include verses from this chapter surfaces as a callout. The callout opens with the thread's title and summary (markdown), then lists the thread's members with per-member notes. Every member is also a Layer 1 row — threads are the named-and-anchored grouping of the same curated pairs around a framework-diagnostic theme. They make Yoshi's reading of the passage visible without imposing commentary on top of the text.

The reader meets the Tanakh source-grounding through the verses themselves, not through prose telling them what to think. The framework speaks through what scripture references what.

---

## API endpoint

```
GET /api/chapters/{book_slug}/{chapter_number}/cross-references
```

**Path parameters.**
- `book_slug` — the books.slug value (e.g., `matthew`, `genesis`, `revelation`).
- `chapter_number` — the chapters.chapter_number value (1-based).

**Edition resolution.** The endpoint resolves against the `canon` edition by default. The PWA may pass `?edition=<slug>` for non-canon books (apocrypha, enoch, etc.) once those land in the apparatus.

**Auth.** The endpoint accepts the standard JWT bearer token. Tier-gating is applied per the `tier_required` field on each row through `tier_satisfies(user_tier, required_tier)`. Free-tier rows (the S73 default) return to every authenticated reader; anonymous readers receive the free-tier rows only.

### Response shape

```jsonc
{
  "book": {
    "slug": "matthew",
    "title": "Matthew",
    "edition_slug": "canon"
  },
  "chapter": {
    "number": 25,
    "title": null
  },
  "baseline": [
    {
      "source_verse": {
        "verse_number": 32,
        "preview": "And before him shall be gathered all nations..."
      },
      "targets": [
        {
          "verse_id": 28394,
          "book_slug": "ezekiel",
          "chapter_number": 34,
          "verse_number": 17,
          "preview": "And as for you, O my flock, thus saith Adonai Yahuah (the Lord GOD)...",
          "source": "manual",
          "tier_required": "free"
        }
      ]
    }
    // ... one entry per chapter verse that has at least one target ...
  ],
  "threads": [
    {
      "slug": "post-harvest-sifting",
      "title": "Post-harvest sifting",
      "summary_md": "The wilderness of the peoples — Ezekiel 20:33–44 — is the Tanakh source for the sheep-and-goats separation, 'depart from me, I never knew you,' and the weeping-and-gnashing-of-teeth passages...",
      "anchor": {
        "book_slug": "ezekiel",
        "chapter_number": 20,
        "verse_start": 33,
        "verse_end": 44
      },
      "tier_required": "free",
      "members_in_chapter": [
        {
          "sort_order": 3,
          "source_verse_number": 32,
          "target": {
            "book_slug": "ezekiel",
            "chapter_number": 20,
            "verse_number": 38,
            "preview": "And I will purge out from among you the rebels..."
          },
          "member_note": "Separation of sheep and goats = the wilderness purge"
        },
        {
          "sort_order": 4,
          "source_verse_number": 33,
          "target": {
            "book_slug": "ezekiel",
            "chapter_number": 34,
            "verse_number": 17,
            "preview": "And as for you, O my flock..."
          },
          "member_note": "Sheep / goats / shepherd language drawn from Ezekiel 34:17"
        }
        // ... only members whose source_verse falls in this chapter ...
      ]
    }
  ]
}
```

**Notes on the shape.**
- `baseline` aggregates per source verse so the PWA can render one block per verse with all its targets inside.
- `threads.members_in_chapter` is filtered to only the members whose source verse is in the rendered chapter — but the `summary_md` and `anchor` describe the full thread so the reader gets the framework context even if only one or two members appear in this chapter.
- `tier_required` is returned on every row so the PWA can show a tier-locked treatment for rows the current user can't access (rare at v1, since defaults are free; meaningful once teaching_corpus rows land at higher tiers).

### SQL underneath (sketch)

```sql
-- Baseline: every cross_references row with source in the chapter.
SELECT x.id, x.source_verse_id, x.target_verse_id, x.source, x.tier_required,
       sv.verse_number AS source_verse_number,
       tb.slug AS target_book_slug, tc.chapter_number AS target_chapter,
       tv.verse_number AS target_verse, tv.text AS target_text
  FROM cross_references x
  JOIN verses sv     ON sv.id = x.source_verse_id
  JOIN chapters sc   ON sc.id = sv.chapter_id
  JOIN books sb      ON sb.id = sc.book_id
  JOIN editions se   ON se.id = sb.edition_id
  JOIN verses tv     ON tv.id = x.target_verse_id
  JOIN chapters tc   ON tc.id = tv.chapter_id
  JOIN books tb      ON tb.id = tc.book_id
 WHERE se.slug = :edition_slug
   AND sb.slug = :book_slug
   AND sc.chapter_number = :chapter_number
   AND tier_satisfies(:user_tier, x.tier_required)
 ORDER BY sv.verse_number, tb.canonical_order, tc.chapter_number, tv.verse_number;

-- Threads with at least one member in the chapter.
SELECT t.id, t.slug, t.title, t.summary_md, t.tier_required,
       ab.slug AS anchor_book, ac.chapter_number AS anchor_chap,
       av.verse_number AS anchor_v_start, ev.verse_number AS anchor_v_end
  FROM cross_reference_threads t
  LEFT JOIN verses av ON av.id = t.anchor_verse_id_start
  LEFT JOIN chapters ac ON ac.id = av.chapter_id
  LEFT JOIN books ab    ON ab.id = ac.book_id
  LEFT JOIN verses ev ON ev.id = t.anchor_verse_id_end
 WHERE tier_satisfies(:user_tier, t.tier_required)
   AND EXISTS (
       SELECT 1
         FROM cross_reference_thread_members m
         JOIN cross_references x  ON x.id = m.cross_reference_id
         JOIN verses sv           ON sv.id = x.source_verse_id
         JOIN chapters sc         ON sc.id = sv.chapter_id
         JOIN books sb            ON sb.id = sc.book_id
         JOIN editions se         ON se.id = sb.edition_id
        WHERE m.thread_id = t.id
          AND se.slug = :edition_slug
          AND sb.slug = :book_slug
          AND sc.chapter_number = :chapter_number
   )
 ORDER BY t.sort_order, t.title;
```

A separate query fetches each thread's `members_in_chapter` filtered to the rendered chapter, ordered by `m.sort_order`.

---

## Render contract (PWA)

The card lives at `<ChapterEndCard chapterId={chapter.id} />`, rendered after the last verse component in the reader and before the next-chapter navigation.

**Visual structure.**

```
─── Tanakh Sources for [Book] [Chapter] ───

(Baseline list — only renders if non-empty)
  Verse [N]:
    → [Target book chapter:verse] — [target preview, truncated to ~80 chars]
    → [Target book chapter:verse] — [target preview, truncated]
  Verse [N]:
    → ...

(Threads — one callout per thread surfacing in this chapter)
  [Thread title]
    [Summary_md rendered to prose, truncated at first paragraph break with
     a "show more" affordance]
    Members in this chapter:
      → Verse [N] → [Target ref] — [member_note]
      → Verse [N] → [Target ref] — [member_note]
    Companion threads: [if any] [thread title] [thread title]
─────────────────────────────────────
```

**Empty states.**
- If both `baseline` and `threads` are empty (current state for any chapter the curated apparatus hasn't reached yet), the card does not render at all.
- If `baseline` is empty but `threads` is non-empty, the baseline section is omitted and the threads section renders directly under the card title. (Architecturally: every Layer 1 row in the v1 ship is also a Layer 2 thread member, so a non-empty threads list implies a non-empty baseline. The split-rendering exists for future cases where a curated cross-reference is added without yet being grouped into a thread.)

**Layer-split tier policy (S140).** The two layers of the chapter-end card gate **independently** with two different `tier_required` values:

- **Layer 1 (per-verse cross-references) → `extras` (Library tier, $4.99).** A reader who has unlocked the Library tier sees the verse-to-verse pairings: source verse → target verse → target text preview. The cross-references point into the restored library editions Library opens, so this layer's tier matches.
- **Layer 2 (framework thread callouts) → `complete_study` (Companion tier, $9.99).** The thread callout with its title + anchor + multi-paragraph `summary_md` + per-member `member_note` is Yoshi's framework reading of how canon and library answer each other — the *hidden detail expand* that synthesizes the cross-references. That synthesis is the Companion-tier upgrade. A Library reader sees Layer 1; a Companion reader sees both layers.

Inside the API response, this means each row's tier resolves separately: the baseline query filters cross_references by `x.tier_required`; the threads query filters by `t.tier_required`. A reader at Library tier gets a populated `baseline[]` for extras-tier rows AND an empty (or partial) `threads[]` where the only threads returned are ones at their tier or below (the two free funnel threads — Kingdom Gospel + Grace That Can Be Lost — stay visible). Companion readers get both arrays fully populated. The two free threads remain `tier_required = 'free'` and visible everywhere, including for free readers.

**Tier-locked rendering (S140 — Option C policy).** The S73 "greyed-out item with a small lock affordance" render policy is retired. Two surfaces, two treatments:

- **Baseline (per-verse cross-reference target).** A locked target verse renders at reduced opacity (≈40%) with an "Unlock in [Name] tier" tooltip. Click routes the partner to `/pricing` instead of the target verse. The reader can see the source-verse group and the target-verse pill exists, but can't follow the link or read the preview at full visual weight. At today's tier setup this is dormant for Library+ readers (baseline rows are at Library); free + Study Notes readers see this treatment on any baseline rows above their tier.
- **Threads (Layer 2 callout).** A locked thread renders title + anchor + a ~70-word teaser pulled from the first paragraph of `summary_md`, followed by a `linear-gradient(transparent → surface)` fade over the bottom ~56px of the teaser block. Below the fade: a single line "Full summary + N verse pairings in this chapter" (where N is the count of `members_in_chapter`), then a primary CTA reading "Unlock in [Name] tier." Members do NOT render. No per-row lock icons, no expand button, no greyed-out body. The reader is pulled into the start of a framework-bearing reading and stopped at the gate where the prose gets substantive. At today's tier setup this gate fires for everyone below Companion (free / Study Notes / Library), with the CTA reading "Unlock in Companion tier."

**Tier-name CTA convention.** Every "Unlock" affordance across the Bible app uses the pattern *"Unlock in [Name] tier"* — never "$X.XX" and never just the tier name without the trailing word "tier" (the trailing word disambiguates that the user is crossing a subscription threshold rather than unlocking a feature with that proper name). Tier names per S140 overhaul: Study Notes (`study_notes` slug, $1.99) / Library (`extras` slug, $4.99) / Companion (`complete_study` slug, $9.99) / Scribe (`everything` slug, $14.99). The pricing surface (`app/src/routes/Pricing.tsx`) is the one exception that still lists prices — every other reader-facing surface uses tier names exclusively.

**Architectural note.** The contract previously dormant tier-locked path went live at S131 when the first `extras`-tier rows entered the corpus. S140's Option C policy is the cure for the volume effect — eleven multi-paragraph thread summaries per chapter rendered fully readable for the free reader because the greyed-out treatment was too transparent. The teaser-with-fade preserves the tease (the free reader sees the framework reach) without giving away the body of work the paywall exists to gate.

**Markdown rendering.** `summary_md` is rendered through the standard PWA markdown component (the same one that renders commentary entries). Sacred names already carry parentheticals in the seed data — the renderer treats `Yahuah (the LORD)` as plain inline text, never linkified.

---

## Data-model summary

```
cross_references                 (existing, schema.sql §4)
  - default tier_required flipped to 'free' (S73)
  - UNIQUE (source_verse_id, target_verse_id, source) (S73)

cross_reference_threads          (new at S73)
  - slug, title, summary_md
  - anchor_verse_id_start / _end (FK to verses, nullable)
  - tier_required (default 'free')

cross_reference_thread_members   (new at S73)
  - thread_id × cross_reference_id (PK)
  - sort_order, member_note
```

---

## Seeded threads (S73)

| Slug | Title | Anchor | Members |
|---|---|---|---|
| `post-harvest-sifting` | Post-harvest sifting | Ezekiel 20:33–44 | 12 pairs across Matthew 7, 8, 13, 22, 24, 25 and Luke 13 |

---

## Next-session work (queued)

1. **Threads 2–5 — LANDED at Session 74.** grace-from-name's-sake (Ezekiel 36:22, Deuteronomy 9:5–6 → grace passages), new-heart (Ezekiel 36:26–27, 11:19, Jeremiah 31:31–34 → Hebrews 8, 2 Cor 3, Romans 2:29), scattered-seed-gathering (Hosea 1:9–10, Jeremiah 31:10 → Romans 9:25–26), false-inclusion-rebuttal (the Romans 11 olive tree thread → Red Line #11). Migration: `data-schema/migrations/session74_cross_reference_threads_2_to_5.sql`.
2. **Endpoint implementation — LANDED at Session 74.** `GET /v1/books/{slug}/chapters/{n}/cross-references` in `api/main.py`, models in `api/models.py`.
3. **PWA component — LANDED at Session 74.** `<ChapterEndCard />` at `app/src/components/ChapterEndCard.tsx`.
4. **Additional curated threads.** Threads anchored on Red Lines the v1 set hasn't surfaced yet — sabbath restoration, sacred-names lineage, three-categories, false inclusion rebuttal expansion, Adam and the tares, the four costumes, the Daniel 7 kaph-comparative carve-out, the seed war from Genesis 6, the lo-ammi → sons-of-the-living-Elohim arc. Each a thread anchored on Tanakh with curated members through the 12 Red Lines + the 12-point editorial checklist. The apparatus grows one curated thread at a time, on Yoshi's design call.
5. **Apocrypha-aware rendering** — when the reader is in an extras edition, cross-references that point into the apocrypha should resolve cleanly. Schema already supports this through `editions.slug`; endpoint `?edition=` parameter wires when apocrypha-anchored curated threads land.
6. **Migration-into-API-startup wiring** — currently the migration is applied manually via psql paste-block; future schema changes should apply on push. Standing item per the S72 deferral log.

**ROLLED BACK at Session 75.** *TSK comprehensive baseline ingestion as v1.1.* The direction was opened in the original S73 contract draft as "Layer 1 = TSK public-domain corpus." Yoshi rolled it back mid-S75 on Red Line #2 / #10 grounds — cross-references are interpretive artifacts, not neutral data; Torrey's TSK is the codified cross-reference grammar of the inherited Reformation reading (the grammar that can't see grace as the means of return to the commandments because the Tanakh sources for it — Ezekiel 36:22, Deuteronomy 9:5–6, Psalm 25:11, Psalm 79:9 — sit outside the Reformation's reading). The volume-ratio inversion of ~340k TSK pairs underneath ~50 curated framework pairs makes the inherited grammar the page and the framework the footnote — Red Line #2 forbids that. Direction is closed; do not propose TSK or any Christian-corpus import as future work on this surface.
