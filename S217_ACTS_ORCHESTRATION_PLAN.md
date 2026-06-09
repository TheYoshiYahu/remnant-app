# S217 — Acts cross-reference + commentary build: orchestration plan

**Decided S216.** Acts is greenfield: no commentary yet (`commentaries/` has John, Matthew,
1 Corinthians — not Acts), no Acts xref migrations, present in the canon parse as `acts`. This
plan is how we build the full Acts apparatus — correctly and without fragmenting the weave.

## The architecture decision (and why)

**Cross-references are authored by per-chapter-range minions, each working the FULL library
(Tanakh + extra-canonical + New Testament) for its own chapters — NOT by per-library silos.**

The per-library split (one OT minion, one extras minion, one NT minion across all 28 chapters)
was considered and rejected for accuracy reasons. The framework's value is the *side-by-side
weave*: Acts 2 (Pentecost) wants Joel + the Testaments + the NT fulfillment quoted together in
one thread; Acts 7 (Stephen) braids Genesis, Exodus, Amos, the Pseudepigrapha, and NT
fulfillment off the same verses. One mind holding a whole passage binds those into a single
coherent thread. Three library-siloed minions would each independently attach to the same
anchor verse and produce disconnected threads — slug proliferation, sort-order merge conflicts,
and cards that read shredded instead of woven. Per-range is also more token-efficient: Acts is
read once (split across ranges) instead of 3× (each library-minion re-reading all 28 chapters).

**The completeness concern that motivated the per-library idea is real and is solved a different
way:** every range-minion carries a per-chapter **library-coverage checklist** (for each verse,
weigh Tanakh? extras? NT?), and a final per-chapter coverage audit confirms no library was
skipped. Same guarantee, none of the fragmentation.

**Commentary and end-cards are separate deliverables but DOWNSTREAM, not parallel.** End-cards
are the *render* of the finished threads (`api/CHAPTER_END_CARD_CONTRACT.md`); commentary is
written with the woven threads already in view. So they are sequential phases after the xref
pass, each fanned per chapter-range as needed.

## Phases

### Phase 1 — Cross-references (per-range, full-library minions)
- Reuse the proven harness: copy `scratch_xref_ntnt/` → `scratch_xref_acts/` (the `dump_canon.py`
  + `verify_fidelity.py` + regenerated `EXISTING_SLUGS.txt`). Author a fresh
  `MINION_BRIEF_ACTS.md` from `MINION_BRIEF_NTNT.md`, generalized to the full library.
- Each minion owns a chapter range and authors **all three library layers** for its chapters on
  the **edition-aware FULL-LIBRARY schema** (lookup view lists every restored edition;
  `input(...)` carries `src_edition`/`tgt_edition`). Source is always the canon Acts verse.
- **Tiers:** canon targets (Tanakh + NT) = `'free'`; extra-canonical targets = `'extras'`. A
  single range-minion mixes both tiers in its fragment (each thread/row carries its own tier).
- **Per-chapter library-coverage checklist** in the brief — for every Acts verse the minion must
  record: Tanakh candidates weighed, extras candidates weighed, NT candidates weighed (and
  "none warranted" is a valid, recorded answer — curated, not a TSK dump).
- Sort band: fresh **5000+** for Acts, sub-bands assigned per range at spawn (no overlap with
  the John 3000/4000 bands).
- Assemble into `data-schema/migrations/session2NN_acts_cross_references.sql` (BEGIN/COMMIT +
  \echo, idempotent ON CONFLICT, single transaction).

### Phase 2 — Commentary (per-range, threads in view)
- Come-and-See posture (locked S88): quote verses in full in stand-alone italics, no appendix,
  no internal-document references, no Pharisee-scholar cite-don't-quote. Output to
  `commentaries/acts-<ch>.md` per the existing commentary file convention.
- Authored with the Phase 1 threads loaded so the commentary references the woven connections.

### Phase 3 — End-cards (derive + verify from the threads)
- The chapter-end card is the render of the threads/members per `api/CHAPTER_END_CARD_CONTRACT.md`
  — order pills Kingdom → Witness → Commentary → Cross-references. This phase verifies the card
  renders correctly from the Phase 1 threads (anchors resolve, slugs/sort-order clean, tiers
  pass through for the lock pill) rather than authoring new prose.

## QA gates (every batch — same standard that passed John S216)
1. `_xref_audit.py` classifier = **FULL-LIBRARY PASS** (add the Acts glob to the audit's
   `COVERAGE_GLOBS`).
2. `verify_fidelity.py` = every tuple verbatim against the parsed editions.
3. Real-PostgreSQL-grammar parse (`pglast`) = OK.
4. **Voice-gate review** against the 12 Red Lines + 12-point checklist — Acts is high-risk for:
   the "Gentiles" of Acts 10–11 / 15 (read as the scattered seed / the lost sheep, NOT
   false-inclusion of the nations into Yashar'el by faith-confession — Red Lines #7/#11);
   Stephen's speech (Acts 7) seed-war / sons-of-Belial language (Checklist 9, conduct not
   ethnic); the council of Acts 15 and Amos 9 (the gathering of the tabernacle of David =
   twelve-tribe restoration); Paul's sermons quoting the Tanakh (the Formed-one Christology).
5. **Per-chapter library-coverage audit** — confirm each chapter weighed all three libraries.

## Pilot, then scale
Run Phase 1 on **Acts 1–2 first** as the proving range, review the weave (do OT + extras + NT
sit together in coherent threads? does the coverage checklist hold?), then scale the same model
across the rest in ranges sized by density (Acts 7 Stephen, Acts 2 Pentecost, Acts 13/15 are
dense — smaller ranges there). Suggested later ranges: 3–7, 8–12, 13–16, 17–20, 21–24, 25–28.

## Confirm at open (S216 carry-over — verify before starting Acts)
S216 work was authored but, at S216 close, **uncommitted and unpushed** — blocked by stale git
locks (`.git/index.lock`, `.git/HEAD.lock`) the sandbox couldn't remove. Before starting Acts,
confirm on the Mac that these ran:
```
cd ~/Desktop/App
rm -f .git/index.lock .git/HEAD.lock
git add -A && git commit -m "S216: John NT-to-NT cross-references + roadmap + close" && git push origin main
# then the DB applies (xrefs only render once applied — Render egress is blocked):
python3 api/apply_migration.py data-schema/migrations/session181_john_xref_threads.sql
python3 api/apply_migration.py data-schema/migrations/session194_john_2_7_9_16_xref_threads.sql
python3 api/apply_migration.py data-schema/migrations/session216_john_nt_to_nt_xref_threads.sql
```

## Also in the queue (unchanged)
charles-vol2 re-parse (CCEL gate) → `S214_CHARLES_VOL2_DEGRADATION_REPORT.md`; S212 Testaments
XII production-JSON swap → `S214_S212_JOHN_TESTAMENTS_XII_REVERIFY.md`; library-wide forward
sweep → `XREF_LIBRARY_COVERAGE_ROADMAP.md`.
