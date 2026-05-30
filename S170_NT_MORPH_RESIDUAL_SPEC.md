S170 — NT morph residual: lexeme-based fuzzy-join strategy

# Carry-over from S169

S167 morph apply (regex-patched at S169) lifted Greek+Hebrew morphology
coverage to `94.2%` of canon verse_words (`morph_populated 328,523 /
total 348,884`). The remaining `5.8%` residual (`strong_no_morph
20,361`) is now NT-only — all 25 top-null books after S169 are NT
canonicals. Hebrew side is effectively complete.

Root cause diagnosis (S169 close): the KJV USFX XML over-tags English
particles relative to STEPBible TAGNT's source-language token count.
A KJV verse renders three English "the"s for one Greek article ὁ; the
S120 loader assigns each English "the" a Strong's number `G3588` with
its own occurrence_index. The TAGNT source file lists ONE `G3588`
occurrence for that verse. The strict-occurrence join
`(verse_id, strong_number, occurrence_index)` matches the first
English "the" to the source article and leaves the second + third
English "the"s with `morphology = NULL`.

This is structural, not data-quality — the divergence is between two
correct datasets that use different token boundaries. No regex patch
fixes it; the join key itself needs to change.

# Lexeme-based fuzzy-join strategy

## Core idea

When the strict join `(verse_id, S, occ_idx)` finds NO source token
for a verse_words row, attempt a second-pass FUZZY join using lexeme +
Strong's base number (ignoring homonym suffix and ignoring
occurrence_index).

## Match key

For each unmatched verse_words row in a verse, find the source token
with the same `(verse_id, strong_base)` and lowest "fuzzy distance"
on transliteration / lemma string. Multiple unmatched English rows
hitting the same source token all receive the same morph
(intentional — the morph data degrades to "this English word maps to
this source-language token" without claiming a 1:1 relationship).

```
strict_join (existing):
  verse_words.(verse_id, strong_number, occ_idx)
    ↔ source.(verse_id, strong_number, occ_idx)

fuzzy_join (NEW second pass):
  unmatched_vw.(verse_id, strong_base)
    ↔ best_source_in_verse.(verse_id, strong_base)
  where strong_base strips the optional A/B/C/etc. homonym suffix
  STEPBible appends and we don't carry, and "best" picks the source
  token with the lowest transliteration edit-distance to the
  unmatched English surface (English-to-translit comparison is
  noisy but adequate as a tie-breaker).
```

## Recovery estimate

Of the 20,361 NT residual rows:

  - ~12,500 estimated as "filler English" (the, of, in, that, to)
    — would match the same source token N times. Morph data is
    technically correct but adds no analytic value.
  - ~6,500 estimated as "real English content" (verbs, nouns, names)
    that aligned in lemma but mis-counted occurrence due to KJV
    word-order divergence. Fuzzy join recovers these.
  - ~1,400 estimated as genuinely unmatched (KJV reads a word the
    TAGNT lemma trace doesn't carry — e.g., italicized supplied
    words in the KJV that have no source counterpart). Fuzzy join
    leaves these NULL (correct behavior).

Projected post-fuzzy-join coverage: ~98.0% (recovers ~80% of
residual). The structural 2% floor is unrecoverable without
re-tagging the KJV USFX XML against a different alignment source,
which is V2+ scope.

## Homonym risk (load-bearing)

The S169-deferred Strong's-homonym disambiguation pass is a
prerequisite for fuzzy-join safety. STEPBible's `H1697A` /
`H1697B` / `H1697C` collapse to our 4-digit `H1697`. The strict-
occurrence join hid this because the position-based match was tight;
a fuzzy join on `strong_base` AT-FACE-VALUE risks attaching the
H1697A morph to an H1697C English row in the same verse.

**Hard requirement for fuzzy-join V1**: emit a same-pass homonym-
aware match. If the verse carries two distinct STEPBible homonyms
sharing our `strong_base`, only attempt fuzzy-join when transliteration
distance unambiguously favors one. Otherwise leave NULL — a real
NULL is better than a wrong morph.

Estimated impact: ~600 ambiguous-homonym verses NT-wide. Conservative
defer-on-ambiguity policy keeps the data clean.

# Ship-at-V1.1 vs defer

## Case for shipping at V1.1

- Lifts §28 column-stack quality from "94.2% populated" to "~98%".
  Partners studying NT verses see fewer "[no morph]" gaps.
- Most of the recoverable content is the analytically interesting
  middle (real verbs / nouns / names) — partners care about these
  more than the filler-English cases that stay NULL.
- The homonym-safety constraint is solvable; no new infrastructure
  required.

## Case for defer

- The 5.8% residual is structurally weighted toward "filler English"
  cases where the partner gains nothing from morph data (an English
  "the" mapped to a Greek article ὁ is true but uninformative).
- Fuzzy join introduces a NEW failure mode (incorrect morph on
  ambiguous-homonym verses) that strict join never had. Even with
  defer-on-ambiguity discipline, a regression here erodes partner
  trust harder than the existing NULL gap does.
- Partner feedback on the live §28 surface (now Companion+) will
  reveal whether the 5.8% gap is actually felt. If yes, ship V1.1
  with confidence. If no, the engineering cost was avoided.
- The Hebrew side is 100% covered after S169; the NT gap is a
  one-side-only quality issue, not a cross-canon problem.

## Recommendation

**Defer to V1.1.** Open the fuzzy-join wheel only after the §28
surface has been exposed to real partners and the residual is
explicitly flagged as a usability complaint. Until then, the
strict-occurrence join + the §28 "[no morph]" cell are the right
trade-off: honest about the gap, no risk of incorrect data,
zero engineering burn before partner signal.

Gate: if partner feedback at first §28 release surfaces "morph data
missing on X verse" complaints with frequency ≥ 1/week, open V1.1
fuzzy-join wheel. Until then, this spec lives here as the locked
strategy waiting for the gate.

# Open questions to revisit at V1.1 open

1. **Homonym disambiguation source.** Do we carry STEPBible's
   `A/B/C` suffix into a new column on `strong_entries` (small
   migration), or build a lookup-table in the loader that resolves
   STEPBible homonyms to our base on the fly? The loader-resolved
   path keeps the schema clean but loses the homonym data when
   the loader retires.

2. **Transliteration edit-distance threshold.** What cutoff prevents
   bad fuzzy matches? Levenshtein normalized-distance ≤ 0.3 is a
   reasonable first cut but needs canon-pass calibration.

3. **Per-verse pre-pass aggregate.** The fuzzy join is O(N²) per
   verse if done naively. Pre-aggregate source tokens by
   `(verse_id, strong_base)` into a verse-scoped dict, then resolve
   each unmatched verse_words row in O(1). Trivial to implement;
   noted here so the V1.1 loader gets it right first time.

4. **Source-of-truth split.** Should the fuzzy-matched morphology
   be flagged in the schema (e.g., `morphology_match_kind` column:
   `strict` | `fuzzy` | `null`) so the §28 surface can render
   fuzzy-matched cells with a softer visual register? Partner
   transparency vs schema overhead.

# References

- S167 strict-occurrence loader: `restoration-pipeline/_session167_load_verse_words_morph.py`
- S169 regex patch + apply stats: `S169_CHECKPOINT.md` §"Five carried Yoshi-questions"
- Homonym deferred-pass note: `S169_CHECKPOINT.md` §"Open Yoshi-questions … 6"
