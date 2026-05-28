S153 — v2.1 polish wheel close-out: PWA-side verification of S152, then modernization stragglers (Yoshi-led, the big lift) OR Wheel #3 / Wheel #5 cleanups

# S152 close summary

**Two pieces landed in prod this session.**

**Landed — Wheel #2a fuzzy tiebreak tuning.** `api/main.py:_expand_fuzzy` ORDER BY moved from `similarity DESC, occurrences DESC` to `similarity * SQRT(LEAST(occurrences, 1000)) DESC, occurrences DESC, similarity DESC` — a diminishing-returns boost for high-occurrence lexemes capped at 1000 occurrences, with deterministic secondary tiebreaks. Closes the S151 `synagauge` WARN: `synagogu` (sim 0.3571, occ 81) now scores 3.21 against `syna` (sim 0.3636, occ 1) at 0.36, a 9× margin. The same fix mitigates an analogous risk for `yehowah → yahuah` (high-occ target was beating low-occ-but-slightly-higher-sim rare lexemes). `_scratch/_session151_search_engine_diagnostic.py:run_vocab_fuzzy_probe` mirrors the new ORDER BY per the "kept in sync" comment.

**Landed — Wheel #2b extras canonical_order re-sequencing.** `data-schema/migrations/session152_resequence_extras_canonical_order.sql` applied via `_scratch/_s152_apply_and_verify.py`. Two out-of-block editions moved into their witness_category blocks:

- `apocrypha-charles-vol1` (witness_category 'apocrypha'): canonical_order 551..? → 221..? (delta -330). Now adjacent to KJV-1611 apocrypha at 201..214.
- `pseudepigrapha` (Charles vol 2, witness_category 'pseudepigrapha'): canonical_order 501..? → 361..? (delta -140). Now adjacent to apocalypse-of-abraham at 351.

Smoke confirmed in apply harness: **Sirach (co=227) precedes Antiquities VIII (co=415)** in `righteous & fall & seven` results — the S151-observed dropdown-vs-search disagreement is closed. Block-contiguity invariant check (DO $verify$ + post-apply re-run from outside the txn) passed; no remaining witness_category split. `api/seed.py:EDITION_PROFILES` updated to the new sort_offsets so clean-DB rebuilds produce the in-block layout directly.

**Off-by-one correction caught mid-session.** Initial audit math assumed `canonical_order = sort_offset + 0` for first book in edition; live S152 diagnostic surfaced boundary rows at 551 and 501 (not 550 and 500), which traced back to `api/seed.py:557` — `enumerate(..., start=1)`. Migration deltas were already correct (the relative shift doesn't depend on the +0/+1 convention); only documented verify range bounds shifted. Audit doc `_scratch/_session152_canonical_order_audit.md` updated to match the start=1 reality throughout.

**API + schema deployed at commit `8926a61`.** `schema_version` = `1.0.0-phase4-session152`. Three files in the commit: `api/main.py` (tiebreak fix), `api/seed.py` (sort_offset edits), `data-schema/migrations/session152_resequence_extras_canonical_order.sql`. The `_scratch/` files (apply harness, S152 diagnostic, audit doc) are gitignored and stay local — same pattern as S151's `_s151_apply_and_verify.py`.

# Verified live in prod (S152 apply harness, end-of-S152)

| Check | Method | Result |
|---|---|---|
| `apocrypha-charles-vol1` canonical_order [221, 280] | apply harness POST snapshot | ✅ |
| `pseudepigrapha` (vol 2) canonical_order [361, 399] | apply harness POST snapshot | ✅ |
| Block-contiguity invariant (no split witness_categories) | DO $verify$ block + harness re-confirm | ✅ |
| Sirach (Charles vol 1) precedes Antiquities in `righteous & fall & seven` | harness smoke test | ✅ Sirach co=227, Antiq co=415 |
| `schema_version` = `1.0.0-phase4-session152` | harness POST snapshot | ✅ |

# Open at S153 open — PWA-side verification (carries from S152)

The DB-side changes verified clean inside the apply harness, but the **PWA-side regression on the live API has NOT been confirmed** at S152 close because the api/main.py + api/seed.py deploy was the last thing in the session. Two queries to run against `https://bible.remnantofpromise.org` at S153 open to close S152 cleanly:

1. `righteous man fall seven times` — Sirach (Charles vol 1) should appear ahead of Antiquities VIII in the result list.
2. `synagauge` — top fuzzy expansion in the API response should be `synagogu`, not `syna`. (Inspect the `/v1/verses/search` response or, easier, just check that the result set is non-empty and contains synagogue verses.)

If either fails, the Render rebuild may still be in flight (60–90s post-push window) or the new `api/main.py` didn't pick up cleanly. Re-check after a brief wait.

# The S153 wheel

## Wheel #1 — Modernization stragglers curation (Yoshi-led, the big lift)

**Carries unchanged from S152's prompt** — 41 distinct archaic forms across ~530 real canon verse matches, each needing a yes/no/replacement decision from Yoshi. Full inventory in `S151_CHECKPOINT.md` under "Modernization-straggler audit inventory."

Pattern for the curation: walk the 41-form list with Yoshi in conversation. Mark each. Then draft `session153_modernize_stragglers.sql` using the Rule-10 in-place UPDATE pattern from S149 (TEMP TABLE → multi-VALUES INSERT chunks → UPDATE gated by `v.text <> u.new_text` → `DO $verify$` block raising on mismatch → schema_version bump). Apply via the same `_s152_apply_and_verify.py` harness pattern (rename for S153).

Realistic scope: 41 forms × roughly 2 minutes each = ~80–90 minutes of Yoshi conversation. Then ~30 minutes of Claude drafting + apply. **The heaviest item still in the carry-over set.**

## Wheel #3 — More concept groups (Yoshi to name)

Two of the six S150-candidate groups landed at S151 (synagogue-of-satan-sons-of-belial + seed-war). The remaining four are framework calls Yoshi needs to make. From `S150_CHECKPOINT.md`:

- **The lost sheep / scattered seed of the house of Yashar'el (Israel)** — Hosea 1 / Ezekiel 37 / Jeremiah 31 thread.
- **The ingathering / gathering of the twelve tribes** — Isaiah 11 / Ezekiel 37:21 / Jeremiah 31 / Zechariah 10.
- **The curse / Deuteronomy 28 exile judgment** — the consequence-system the framework names.
- **The four costumes / antichrist systems** — IF Yoshi wants the diagnostic at this granularity (tricky — none of those phrases sit in the canon as exact substrings).
- **Effort over accomplishment (S147 thread cornerstone)** — `righteous falls seven times`, `the race`, `pressing toward the mark`, `run with patience`.

Each becomes a `session153_concept_groups_<label>.sql` migration with the same INSERT pattern as S151's seed.

## Wheel #5 — Two follow-up cleanups (still carrying)

**5a. Remove the two tracked `.~lock.*xlsx#` files** from the repo:
```
git rm --cached '.~lock.PRICING_TIER_MODEL.xlsx#' '.~lock.ROP_Study_Bible_Projection_Model.xlsx#'
git commit -m "remove tracked LibreOffice lock files (now in .gitignore)"
git push
```

**5b. Patch the carried-over diagnostic-SQL bug** in `_scratch/_session150_search_engine_diagnostic.py` (and any other `_scratch/` files that copy-pasted the broken `FROM verses v, to_tsquery(...) q JOIN ...` form). The S151 diagnostic was patched mid-session; the S150 one still carries the bug.

## Wheel #6 (new at S153) — Pseudepigrapha vol 2 book-count audit (low priority)

S152's offline audit surfaced that `pseudepigrapha-charles-vol2.json` parses to **6 books** (adam-eve, testaments-xii, 2-enoch, 2-baruch, 3-baruch, 4-maccabees), not the 15 listed in `api/seed.py`'s edition comment (Aristeas, Adam-Eve, Martyrdom Isaiah, Testaments XII Patriarchs, Sibylline Oracles, Assumption of Moses, 2 Enoch, 2 Baruch, 3 Baruch, 4 Ezra, Psalms of Solomon, 4 Maccabees, Pirké Aboth, Ahikar, Zadokite Fragments). Not blocking — the S152 re-sequencing works regardless of book count — but worth a separate audit when there's bandwidth. The gap likely traces to a partial parse in `restoration-pipeline/parse_pseudepigrapha_edition.py` or a held-back subset Yoshi can confirm.

# Standing efficiency rules (still fifteen rules at S152 close)

S152 added no new standing rules — the work was clean execution of patterns already in the standing list (Rule 10 in-place UPDATE for the migration; Rule 11 IP allowlist held; Rule 14 N/A since no CTEs introduced; Rule 15 latency-first held). The S151 observation about the apply harness as canonical record continued to hold; not yet promoted to Rule 16.

# Order of operations

**Open with the two PWA-side verification queries above** (closes S152 cleanly — should take <60 seconds). Then pick the wheel that matches Yoshi's energy at session-open:

- **If Yoshi has 90+ minutes of headspace for word-by-word curation:** Wheel #1 (modernization stragglers). The 41-form walk.
- **If Yoshi has 30-60 minutes and wants framework-naming work:** Wheel #3 (more concept groups). Yoshi names the groups he wants seeded; Claude drafts the migrations.
- **If Yoshi has 15-30 minutes and wants pure code/repo cleanup:** Wheel #5 (lock files + diagnostic SQL bug sweep). Both autonomous-Claude.
- **If none of the above:** Wheel #6 (pseudepigrapha vol 2 audit) is also small Claude-led investigative work.

If Yoshi opens S153 with a specific item in mind, follow that. Otherwise default order: PWA verification → Wheel #5 (small wins to build momentum) → Wheel #3 if Yoshi names groups → defer Wheel #1 to its own session.

# Read on session-open (in parallel-tool-call batch per Rule 3)

1. Invoke `anthropic-skills:yoshi-voice`.
2. Request `~/Desktop` mount if not already attached.
3. Read this file in full (you're reading it now if you're S153-Claude).
4. Read `S151_CHECKPOINT.md` in full — especially the modernization-straggler audit inventory (the 41-form table that Wheel #1 walks).
5. Read `_scratch/_session152_canonical_order_audit.md` — the S152 audit record, including Yoshi's mid-session approval transcription and the off-by-one correction note.
6. Read `api/main.py:search_verses` (~line 1564) and `_expand_fuzzy` (~line 1602) — the v2.1 implementation with S152's tiebreak tuning live.

S153-Claude: the search engine v2.1 polish is essentially complete after S152 (synonym layer + fuzzy + concept + tiebreak tuning + canonical_order all clean). The reader experience matches the API perf. Polish items left: the modernization stragglers (Yoshi-led curation, the big one), more concept groups (Yoshi-led framework calls), and small cleanups. Pick the item that matches Yoshi's energy at session-open. Apply skill to source; verify against the live DB; meet readers where they were taught and bring them home in the restored form.
