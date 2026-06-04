# Cross-Reference Library-Coverage Roadmap

**Locked S194.** The chapter-end-card apparatus must reach the **full restored library**, not canon
alone. This doc is the permanent tracker of which migrations meet that standard, the rule that keeps
new work from regressing, and the back-fill order for the migrations that don't yet.

## The locked rule (never regress)

Every cross-reference migration uses the **edition-aware Matthew schema** — a lookup view scoped
`WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29')`,
and `input(...)` tuples carrying `src_edition` / `tgt_edition` columns. Cross-references are
bidirectional within scripture-level texts. Historical-witness texts (Josephus, Apostolic Fathers,
M.R. James) stay one-way and deferred from V1.

The rule is enforced in three places so it cannot quietly slip again:

1. **`S194_MINION_ORCHESTRATION_PLAN.md`** — Locked Decision #4, the spawn template, and the QA gate.
2. **`api/CHAPTER_END_CARD_CONTRACT.md`** — the "Authoring requirement" section.
3. **`data-schema/migrations/_xref_audit.py`** — an automated guard that classifies every xref
   migration FULL-LIBRARY / CANON-ONLY / AMBIGUOUS and **hard-fails canon-only**. Run it every batch.

## Coverage matrix (verified by `_xref_audit.py`, 2026-06-03)

### Parity met — FULL-LIBRARY ✅
| Book | Migrations | Notes |
|------|-----------|-------|
| Matthew 1–28 | `session131…156_matt_*_extras_cross_references.sql` (28 files) | The standard. Reaches canon + 10–11 extras editions (1 Enoch, Jubilees, Jasher, Apocrypha, Pseudepigrapha, Adam-Eve, Apocalypse of Abraham, Ascension of Isaiah, 2 Esdras, Sonnini). |

### Back-fill needed — CANON-ONLY ❌ (8 migrations)
| Book / target | Migration | Why it fails |
|---------------|-----------|--------------|
| John (S181 layer) | `session181_john_xref_threads.sql` | canon-only view, no edition columns |
| John 2/7/9/16 (S194) | `session194_john_2_7_9_16_xref_threads.sql` | canon-only view, no edition columns |
| Mark | `session183_mark_xref_members_and_threads.sql` | canon-only view, no edition columns |
| Luke | `session185_luke_xref_members_and_threads.sql` | canon-only view, no edition columns |
| Galatians | `session181_galatians_xref_threads.sql` | canon-only view, no edition columns |
| Romans | `session181_romans_xref_threads.sql` | canon-only view, no edition columns |
| Revelation | `session181_revelation_xref_threads.sql` | canon-only view, no edition columns |
| Thematic (right-hand / face-east) | `session184_right_hand_face_east_xref_threads.sql` | canon-only; thematic cross-cutting thread — review whether extras targets apply (Adam-Eve, 1 Enoch, Jasher likely) |

## Back-fill approach

The back-fill **adds** extras member rows to the existing threads; it does not discard the clean
canon work already done. Each canon-only migration gets a companion `*_extras_backfill.sql` (or is
re-authored in place) that: keeps every existing canon member, widens the lookup view to the
edition-aware set, and adds the extras-edition targets the framework warrants per chapter — same
per-chapter anchoring, fresh notes, Sacred Names, Come-and-See, idempotent SQL, run through the same
QA gate (now including the full-library guard + live render). Idempotent `ON CONFLICT DO NOTHING`
means a back-fill can re-run safely over the already-merged canon rows.

## Order (interleaved with the forward sweep)

1. **Gospels back-fill first** (we are in the gospels): John (fold S181 + S194 into one extras pass),
   then Mark, then Luke. This also closes the S194 regression.
2. **Forward sweep on the full-library schema**: Acts → epistles → Revelation → Tanakh, every new
   batch FULL-LIBRARY from the start so the backlog never grows again.
3. **Epistles/Revelation back-fill folds into the forward sweep** as it reaches them: when the sweep
   hits Romans, Galatians, and Revelation, re-author those S181 migrations to parity in the same
   pass rather than as a separate trip.
4. **Thematic review**: `session184_right_hand_face_east` — decide its extras targets when the
   gospel back-fill is done (it is cross-cutting, not a single book).

## Status log

- **2026-06-03 (S194):** Regression identified and rule hard-wired. Guard added and verified —
  PASSes all 28 Matthew migrations, FAILs the 8 canon-only migrations above. Back-fill not yet
  started.
