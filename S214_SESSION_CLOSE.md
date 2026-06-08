# S214 — Close note: charles-vol2 re-parse + John canon xref diagnosis

Picks up the two items `SESSION212_CLOSE.md` queued for "next session." Both were
**diagnosed first** (as instructed); the heavy builds behind each are scoped with
a verification gate rather than blind-swapped.

## Task 1 — re-parse `pseudepigrapha-charles-vol2` (Testaments XII / 2 Baruch)

**Step 1 (quantify) — DONE.** `S214_CHARLES_VOL2_DEGRADATION_REPORT.md`.
Degradation is in the *source text*, not the parser: Charles's footnote apparatus
(MS sigla, Greek fragments, `Cf.`/`MSS` notes) was OCR'd inline into the verses
because the original extraction (`parse_charles_pseudepigrapha.py`) used
coordinate-blind **pypdf**. Testaments XII: ~24% of verses missing/fused, 60%
split mid-sentence. 2 Baruch: ~40% missing, 52% mid-sentence.

**Re-parse approach — PROVEN.** Re-extracting from `~/Downloads/charles-1913-vol2.pdf`
with a **layout-aware pdfplumber** pass that drops the footnote block by
font-size + bottom-of-page position yields clean, apparatus-free body text with
intact sentences. Same Charles translation + versification — the faithful fix.

**Step 2 (re-verify S212 John 13–17 rows) — DONE.**
`S214_S212_JOHN_TESTAMENTS_XII_REVERIFY.md`. All 7 Testaments XII quotes cited by
the shipped S212 John rows (Gad 61–63, Benjamin 89, Judah 35) are **verbatim
present** in the clean Charles text — no fabrications; the S212 fix of the
fabricated Gad 62:2 quote held. One verse-boundary nuance flagged: clean text
places *written down before the Lord* at the head of Judah **35:5**, not the tail
of 35:4 — reconcile the 35:4 target verse id when the clean re-parse renumbers.

**Remaining before a production swap of the parsed JSON (NOT yet done):**
1. De-interleave Charles's **parallel-recension columns** in the Testaments XII
   poetic sections (OCR merges the two columns left-to-right).
2. Reconstruct **verse/chapter numbering** off the running-header chapter ranges
   (`THE TESTAMENT OF LEVI 9. …–13. 9`, `II BARUCH 6. 7—9. 1`).
3. Apply the `restoration-pipeline` sacred-names pass.
4. **Verification gate:** cross-check re-parsed verse boundaries against CCEL's
   clean Charles text (connected browser; CCEL is JS-rendered) before swapping
   `source-texts/parsed/pseudepigrapha-charles-vol2.json` and before re-pointing
   any xref verse ids. Fidelity stakes (xref rows resolve by verse id) make the
   gate worth it.
5. Then the deferred 2 Baruch xref adds (true-vine vision, temple-veil,
   resurrection chambers) become usable.

## Task 2 — John canon (Tanakh + NT) cross-references not rendering

**Step 1 (diagnose) — DONE.** `S214_JOHN_CANON_XREF_DIAGNOSIS.md`. Root cause is
**(a) the canon migrations aren't in the live DB** — not tier-gating, not
slug/anchor mismatch. The live chapter-end-card query keys only on `chapter_id`
with no edition/tier filter (S136 removed the per-row tier strip), so applied
rows render at any tier; that's why the S212 extras show and the structurally
identical S181/S194 canon rows don't. S181+S194 cover **all 21 John chapters**
(~265 rows) and are correctly authored — they just need to be applied.

**Authoring gap identified:** canon targets are 238 Tanakh vs only **27 NT** — the
**NT-to-NT** pairings the task asks for are thin and missing from several
chapters; thinnest chapters overall are 5, 13, 15, 20. A new FULL-LIBRARY-schema
`john_nt_to_nt` migration should add them per chapter-range (John↔synoptics,
John↔1 John, John↔Revelation, John↔Pauline Formed-one Christology) to the
Come-and-See + Red Lines standard. Authoring batch — minions per chapter-range —
not yet started.

## >>> ACTIONS THAT MUST RUN FROM YOSHI'S MAC (git push + DB only) <<<

1. **Apply the canon John migrations** (this alone makes the canon Tanakh/NT pairs
   render — the fix for the reader symptom):
   ```
   python3 api/apply_migration.py data-schema/migrations/session181_john_xref_threads.sql
   python3 api/apply_migration.py data-schema/migrations/session194_john_2_7_9_16_xref_threads.sql
   ```
2. **Confirm S212 extras are applied** (mark/luke/john) — the user noted these may
   still be pending; if the reader already shows John's extras, they are applied.
3. **Verify in DB** (expects ~265 if S181+S194 applied, else 0):
   ```sql
   SELECT count(*) FROM cross_references x
     JOIN verses sv ON sv.id=x.source_verse_id
     JOIN chapters sc ON sc.id=sv.chapter_id
     JOIN books sb ON sb.id=sc.book_id JOIN editions se ON se.id=sb.edition_id
    WHERE se.slug='canon' AND sb.slug='john' AND x.note LIKE 'thread:%';
   ```

## Artifacts this session
- `S214_CHARLES_VOL2_DEGRADATION_REPORT.md`
- `S214_S212_JOHN_TESTAMENTS_XII_REVERIFY.md`
- `S214_JOHN_CANON_XREF_DIAGNOSIS.md`
- `S214_SESSION_CLOSE.md` (this file)

No DB writes, no git push (Mac-only, per standing rule). No production JSON
swapped (held behind the verification gate above).
