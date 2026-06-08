# S212 — Close note: Gospel extras-library cross-references

## What landed (data-only; no UI change)
Filled the gap Yoshi named: Mark, Luke, and John had **zero outside-canon
cross-references** (their S181/S183/S185 baselines quoted extras inside
`summary_md` but never inserted them as member rows — "a future-migration
concern" per the S183 header). Matthew already had full extras coverage; it was
left as-is. This session authored the missing edition-aware connections.

Three new migrations in `data-schema/migrations/`:

| File | Threads | Cross-ref rows | Member rows |
|---|---|---|---|
| `session212_john_extras_cross_references.sql` | 22 | 77 | 74 |
| `session212_mark_extras_cross_references.sql` | 13 | 51 | 51 |
| `session212_luke_extras_cross_references.sql` | 24 | 77 | 77 |
| **Total** | **59** (57 new + 2 no-op stubs of existing Matt threads) | **205** | **202** |

All rows `tier_required = 'extras'` (Layer 1) / threads `'extras'` (Layer 2),
edition-aware (full restored library), Come-and-See posture (verses quoted in
full, stand-alone italics, sacred names restored, son-of-man → Son of Adam,
English book-name slug fragments). Built per Gospel chapter-range by parallel
minions, then assembled/deduped.

Target editions used: Apocrypha (Tobit, Wisdom of Solomon, Sirach, Baruch,
1 & 2 Maccabees, 2 Esdras, Judith), 1 Enoch, Jubilees, Jasher, Testaments XII
(Pseudepigrapha).

## Verification (before close)
- `verify_fidelity.py` — every Layer-1 note's quote matches its actual target
  verse: **202/202 faithful**.
- `verify_offset.py` — versification check: 2 remaining hits are legitimate
  span-labeled refs (target = first verse of an explicitly labeled span,
  e.g. "1 Enoch 10:11-12"; leading italic quote matches the target verse).
- Fixes applied during verification:
  - Mark 1-4: re-pointed 1 Enoch `15:8 → 15:6` (the parsed edition versifies the
    "giants called evil spirits" line at 15:6, not the Charles 15:8 the minion
    used from memory); labels corrected.
  - John 13-17: replaced one fabricated Testament of Gad 62:2 quote with the
    actual parsed text.
- `_xref_audit.py` full-library guard: all three S212 files **PASS FULL-LIBRARY**
  (glob added to the harness so future runs scan them).
- SQL parses clean (sqlglot, postgres dialect): 111 + 117 + 74 statements.
- No duplicate thread-keys (checked against all 333 existing slugs); no
  sort_order collisions; BEGIN/COMMIT balanced; idempotent ON CONFLICT.

## To apply (DB egress is blocked from the sandbox — run from Yoshi's Mac Terminal)
```
python3 api/apply_migration.py data-schema/migrations/session212_mark_extras_cross_references.sql
python3 api/apply_migration.py data-schema/migrations/session212_luke_extras_cross_references.sql
python3 api/apply_migration.py data-schema/migrations/session212_john_extras_cross_references.sql
```
(Order doesn't matter between them. Two Luke threads add members to existing
Matthew-anchored threads by slug — those must already be in the DB, which they
are. Re-add the current IP to the Render allowlist if "connection closed
mid-operation".) Then eyeball a few Gospel chapters in the reader to confirm the
new cross-references render in the chapter-end card.

## >>> NEXT SESSION — DECIDED (Yoshi, S212): re-parse the degraded edition <<<
**`pseudepigrapha-charles-vol2` (Testaments XII / 2 Baruch) is OCR-degraded** —
verse boundaries split mid-sentence; scanning artifacts interleaved into verse
text (e.g. Test. Gad 62:2 starts mid-sentence "your hearts, love one another...";
Test. Benjamin 89:5 has a next-verse fragment wedged into the middle). Only
Testaments XII was used in S212 (John 13-17); every row was verified line-by-line
against the parse and one fabricated quote was corrected. Multiple minions
independently declined to use 2 Baruch for this reason.

**Yoshi's call: FIX IT NEXT SESSION.** Re-parse `pseudepigrapha-charles-vol2`
from a cleaner source so its verse text + verse boundaries are intact (bring it
to the quality of the clean editions — Apocrypha KJV, 1 Enoch, Jubilees, Jasher).
Then: (1) re-verify the S212 John 13-17 Testaments XII rows against the re-parsed
text and adjust any that shift; (2) once clean, the 2 Baruch material the minions
routed around becomes usable for the deferred xref adds (true-vine vision, the
temple-veil, resurrection chambers). Quantify degradation extent as step 1 so the
re-parse scope is known.

## >>> NEXT SESSION — DECIDED (Yoshi, S212): John canon (Tanakh + NT) cross-refs <<<
After the re-parse fix above, **go back over the book of John and add the
canonical Tanakh + New Testament cross-references.** Symptom Yoshi observed in the
reader: John now surfaces **only the extra-canonical (library) cross-references**
(the S212 adds) — the Tanakh + NT canonical pairings are not showing. The canon
John threads exist as migrations (`session181_john_xref_threads.sql`,
`session194_john_2_7_9_16_xref_threads.sql`) but are NOT rendering — so step 1 is
to diagnose why (were they applied to the DB? tier-gated out? slug/anchor
mismatch with the chapter-end card query?), then ensure full canon coverage:
Tanakh sources AND New-Testament-to-New-Testament pairings across all 21 John
chapters, per the same Come-and-See + Red Lines standard. Sequence: re-parse fix
first, then John canon pass.

## Not touched (pre-existing, still tracked)
The original canon-only baselines (S181/S183/S184/S185/S194 for
Mark/Luke/John/Galatians/Romans/Revelation) still hard-FAIL the S194 guard —
they are the canon-only files tracked for extras-parity back-fill in
`XREF_LIBRARY_COVERAGE_ROADMAP.md`. S212 adds the extras parity for Mark/Luke/John
as *new* migrations rather than rewriting those baselines.

Working artifacts (minion fragments, helpers, inventories) are in `scratch_xref/`.
