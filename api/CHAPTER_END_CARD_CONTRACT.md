# Chapter-End Cross-Reference Card — API + Render Contract

Session 73 wheel deliverable, 2026-05-17. Free-tier feature; every paid tier inherits via the strict chain locked Session 72.

This document is the **contract** between the FastAPI service and the PWA reader. The schema sits behind it (data-schema/schema.sql, Section 4 + Section 4b); this file describes what the API returns and how the reader renders it.

---

## The user story

A reader finishes Matthew 25 in the reader UI. Below the last verse, before the next-chapter affordance, a card appears titled *Tanakh Sources for Matthew 25*. The card has two layers.

**Layer 1 — comprehensive baseline.** For every verse in Matthew 25 that has a cross-reference back to the Tanakh, the card lists the source verse, the target verse(s), and a short prose preview of each target. This is the comprehensive cross-reference apparatus — the public-domain Treasury of Scripture Knowledge corpus (queued for v1.1 ingestion).

**Layer 2 — framework threads.** Underneath the baseline list, any *cross-reference thread* whose members include verses from this chapter surfaces as a callout. The callout opens with the thread's title and summary (markdown), then lists the thread's members with per-member notes. Threads are the curated framework-diagnostic overlay — they make Yoshi's reading of the passage visible without imposing commentary on top of the text.

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
- If both `baseline` and `threads` are empty, the card does not render at all.
- If `baseline` is empty but `threads` is non-empty (current state at S73 — no TSK ingestion yet), the baseline section is omitted and the threads section renders directly under the card title.

**Tier-locked rows.** Any row with `tier_required` above the user's tier renders as a greyed-out item with a small lock affordance and an "Unlock with [Tier name]" tooltip. At S73 nothing is gated above `free`, so this path is dormant until v1.1+ rows arrive.

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

1. **Threads 2–5** — grace-from-name's-sake (Ezekiel 36:22, Deuteronomy 9:5–6 → grace passages), new-heart (Ezekiel 36:26–27, 11:19, Jeremiah 31:31–34 → Hebrews 8, 2 Cor 3, Romans 2:29), scattered-seed-gathering (Hosea 1:9–10, Jeremiah 31:10 → Romans 9:25–26), false-inclusion-rebuttal (the Romans 11 olive tree thread → Red Line #7).
2. **Endpoint implementation** — wire `GET /api/chapters/{book_slug}/{chapter_number}/cross-references` in api/main.py against the schema described above.
3. **PWA component** — implement `<ChapterEndCard />` against this contract.
4. **TSK ingestion (v1.1)** — public-domain corpus into `cross_references` with `source='TSK'`, `tier_required='free'`.
5. **Apocrypha-aware rendering** — when the reader is in an extras edition, cross-references that point into the apocrypha should resolve cleanly. Schema already supports this through `editions.slug`.
6. **Migration-into-API-startup wiring** — currently the migration is applied manually via psql paste-block; future schema changes should apply on push. Standing item per the S72 deferral log.
