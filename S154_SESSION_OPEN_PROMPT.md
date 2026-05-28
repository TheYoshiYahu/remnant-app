S154 — seed.py architectural fix (the never-again wheel), plus carry-over from S153 (PWA verification, modernization stragglers, concept groups, cleanups)

# S153 close summary — emergency restore, then wrap

**S153 opened on the v2.1 polish wheel; pivoted within the first turn to an emergency.** Yoshi reported all Matthew commentary + cross-references missing from live PWA. Diagnosed: `seed.py --seed-only` cascade-deletes canon (not just extras, despite what render.yaml:33 claims), and `commentary_entries.chapter_id` + `cross_references.{source,target}_verse_id` are `ON DELETE CASCADE`. So one canon re-seed wipes all the post-seed loaders' output (S110 free-tier intro, S112 tiered commentary, S110+S131..S146 + S111 + S140b + S147 + S147b xref migrations). Compounded by `source-texts/parsed/canon.json` regenerated 2026-05-27 01:11 with `commentary=None` for all 28 Matthew chapters — the re-seed then set `chapters.chapter_intro` to NULL too. Yoshi said he only runs seed.py when Claude instructs him to, so the trigger came from a prior session (S149 modernization is the leading suspect — see Task #9 below).

**Restored via `_scratch/_s153_restore_matthew.py`** in one pass against prod: 28/28 chapter intros, 56 commentary_entries (28 inline + 28 deep_dive), 2069 source-side xrefs (well above the 1100 floor — S110 alone seeds 1123), 693 Matt-source thread member rows. Yoshi confirmed: PWA fully back. canon.json patched same session via `_session110_load_matthew_free_tier_commentary.py --canon-only` so future seed.py bootstraps reproduce correct state.

**Verified live in prod (S153 close):**

| Check | Method | Result |
|---|---|---|
| chapters.chapter_intro non-NULL for Matt 1..28 | harness POST snapshot | ✅ 28/28 |
| commentary_entries (inline + deep_dive) | harness POST snapshot | ✅ 56 |
| Matt source-side cross_references | harness POST snapshot | ✅ 2069 (≥1100) |
| Matt-source thread members | harness POST snapshot | ✅ 693 |
| Matt 1 spot check: intro + inline + deep_dive present | harness POST | ✅ |
| Live PWA reload on Matt 1 | Yoshi visual confirm | ✅ all four surfaces present |
| `source-texts/parsed/canon.json` Matt commentary populated | local file check | ✅ 28/28 |

# Open at S154 open — three follow-ups + carry-over

## Wheel #A (NEW — PRIORITY) — seed.py architectural fix so this can't recur

The S153 emergency was structurally caused. The actual remedy:

1. **Add `--reseed-canon` flag to seed.py.** Default `--seed-only` should skip canon entirely (touch only the four extras editions, matching what render.yaml:33 already claims it does). Operators who actually want to reload canon pass `--reseed-canon` explicitly and accept the cascade.
2. **Flip the FKs from `ON DELETE CASCADE` to `ON DELETE RESTRICT`** on `commentary_entries.chapter_id`, `commentary_entries.verse_id`, `cross_references.source_verse_id`, `cross_references.target_verse_id`, and `cross_reference_thread_members.cross_reference_id`. Belt + suspenders: even if a future operator forces a canon reload, the FK constraints make the cascade impossible at the schema level. Failing-loud is the right behavior when the framework data exists. (Migration file `data-schema/migrations/session154_restrict_fks_against_canon_reload.sql`.)
3. **Fix the lying render.yaml comment** at line 33 — describe what `--seed-only` *actually* does after the flag change.
4. **Add a sanity guard** in seed.py: if it would cascade-delete >0 commentary_entries or cross_references rows, abort and log unless `--reseed-canon` is passed.

Scope: ~30-60 minutes of design + execution. Standard apply-harness pattern (`_s154_apply_and_verify.py`) for the migration. Verify post-apply by trying `seed.py --seed-only` against a local DB clone and confirming canon survives.

## Wheel #B — post-mortem (cheap; pair with #A or run first)

Read S148, S149, S150, S151, S152 session prompts + checkpoint files + scratch audit files. Find which session instructed `python seed.py --seed-only` (or similar) against prod. Strong prior: **S149 canon modernization** (S149 regenerated canon.json with the modernized verses, and the natural pattern would have been to instruct a seed reload to push them to prod). If confirmed, that's the instruction-pattern to guard against — and #A's sanity-guard fixes it regardless. Write findings into a one-paragraph `_scratch/_s154_postmortem.md`.

## Wheel #C — cosmetic NULL-anchor cleanup (deferred unless visible)

Pre-existing threads (S73/S74-created) had `anchor_verse_id_start` SET NULL when seed.py cascaded the verses (FK is `ON DELETE SET NULL` for that column). S110 re-apply skipped them via `ON CONFLICT (slug) DO NOTHING`, so anchors stayed NULL. API tolerates NULL anchor (api/main.py:602 uses LEFT JOIN), so threads still surface. Only blocking if the PWA renders the "anchored at " annotation with a visible empty cell. Yoshi saw nothing wrong at S153 close. **Defer unless someone notices.** If we do this: `_scratch/_s154_fix_null_anchors.py` re-resolves the NULL anchors by re-running just the thread INSERTs from session110 / session131..146 with `ON CONFLICT (slug) DO UPDATE SET anchor_verse_id_start = EXCLUDED.anchor_verse_id_start`.

## Carrying from S153 (unchanged) — the v2.1 polish wheel

The work the S153 prompt named, now carrying to S154:

- **PWA-side verification of S152** — two queries against `https://bible.remnantofpromise.org` to close S152 cleanly: (1) `righteous man fall seven times` → Sirach (Charles vol 1, co=227) ahead of Antiquities VIII (co=415); (2) `synagauge` → top fuzzy expansion is `synagogu` not `syna`. Requires the `bible.remnantofpromise.org` allowlist add I asked for at S153 open (or wildcard `*.remnantofpromise.org`); Yoshi did not add it during S153 because the emergency took the session.
- **Wheel #1 (S153 carry) — Modernization stragglers curation (the big lift)**. 41 distinct archaic forms, ~530 canon verse matches. Full inventory in `S151_CHECKPOINT.md` under "Modernization-straggler audit inventory." 80-90 minutes of Yoshi conversation + 30 minutes of Claude draft + apply.
- **Wheel #3 (S153 carry) — More concept groups**. Four remaining S150 framework calls: lost sheep / scattered seed of the house of Yashar'el; ingathering of the twelve tribes; Deuteronomy 28 curse / exile judgment; four costumes / antichrist systems (tricky — none in canon as exact substrings); effort over accomplishment (already partly seeded — confirm scope).
- **Wheel #5 (S153 carry) — Cleanups**. (5a) `git rm --cached '.~lock.PRICING_TIER_MODEL.xlsx#' '.~lock.ROP_Study_Bible_Projection_Model.xlsx#'` + commit + push. (5b) Patch the carried-over diagnostic-SQL bug in `_scratch/_session150_search_engine_diagnostic.py`.
- **Wheel #6 (S153 carry — low priority) — Pseudepigrapha vol 2 book-count audit.** `pseudepigrapha-charles-vol2.json` parses to 6 books, api/seed.py edition comment claims 15. Investigative.

# Standing efficiency rules — fifteen rules at S153 close

No new standing rules at S153 (the session was clean execution of patterns under emergency). The S151 observation about apply harness as canonical record continued to hold; not yet promoted to Rule 16.

# Order of operations

**Open with Wheel #A (the architectural fix).** This is the priority — until it lands, every future canon-touching session has the same regression-risk that bit S153. Wheel #B (post-mortem) pairs naturally — read S149 first to confirm the instruction-pattern, then design #A's sanity-guard against the actual pattern found. Then if energy allows, pick from carry-over by Yoshi's signal (Wheel #5 for quick wins, #3 for framework calls, #1 for the big lift, #6 if all else is exhausted).

If Yoshi opens S154 with a specific item in mind, follow that. Otherwise default: Wheel #B (15 min read) → Wheel #A (30-60 min build + apply + verify) → ask Yoshi for energy + pick carry-over wheel.

# Read on session-open (in parallel-tool-call batch per Rule 3)

1. Invoke `anthropic-skills:yoshi-voice`.
2. Request `~/Desktop` mount if not already attached.
3. Read this file in full (you're reading it now if you're S154-Claude).
4. Read `S149_CHECKPOINT.md` (or the closest S149 close-summary file) — for the post-mortem, to confirm/deny the canon modernization seed-reload hypothesis.
5. Read `_scratch/_s153_restore_matthew.py` — the harness this session built; the FK / cascade logic is documented in its docstring.
6. Read `api/seed.py:EDITION_PROFILES` + `seed_edition` + `bootstrap_or_seed` entry points — the cascade behavior to change.
7. Read `data-schema/schema.sql` lines 277-385 (cross_references + threads + commentary_entries with their FKs).

S154-Claude: the v2.1 polish wheel is exactly where S153 found it (essentially complete after S152, polish items left). The interruption was the seed.py cascade regression — diagnosed, restored, but the architectural cause is still present. Close that loop first. Then pick the polish wheel that matches Yoshi's energy.
