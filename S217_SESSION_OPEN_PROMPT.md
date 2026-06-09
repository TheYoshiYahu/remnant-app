# S217 — Session open (focus: Acts cross-references + commentary)

Mount `~/Desktop` (gives App **and** the teaching corpus). Load the `yoshi-voice` skill in full.
Read the YouTube teaching corpus at `~/Desktop/Teaching Corpus/youtube-transcripts/` for Acts
context. Voice skill is the gold standard; quote-don't-cite; full library, bidirectional.

## This session — start Acts
Primary: build the Acts apparatus per **`S217_ACTS_ORCHESTRATION_PLAN.md`**. The model (decided
S216): **per-chapter-range minions, each authoring the FULL library — Tanakh + extra-canonical +
NT — for its chapters**, with a per-chapter library-coverage checklist. NOT per-library silos
(that fragments the weave). Commentary and end-cards are downstream phases, not parallel.

**Start with the Acts 1–2 pilot.** Run the Phase-1 xref minions on Acts 1–2, review the weave +
coverage, then scale across 28 chapters in density-sized ranges. Reuse the harness:
`scratch_xref_ntnt/` → `scratch_xref_acts/` (`dump_canon.py`, `verify_fidelity.py`,
regenerated `EXISTING_SLUGS.txt`); author `MINION_BRIEF_ACTS.md`. FULL-LIBRARY schema, tiers
free (canon OT+NT) / extras (library), sort band 5000+.

## Gates (same standard that passed John S216)
`_xref_audit.py` FULL-LIBRARY PASS · `verify_fidelity.py` verbatim · pglast parse OK · voice-gate
review (watch Acts 10–11/15 "Gentiles" = scattered seed not false-inclusion; Acts 7 seed-war;
Acts 15/Amos 9 = twelve-tribe restoration) · per-chapter library-coverage audit.

## Confirm at open
S216 (John NT-to-NT) was authored but left **uncommitted/unpushed** — stale `.git/index.lock` +
`.git/HEAD.lock` blocked git. On the Mac: clear the locks, commit + push (triggers Render), then
apply S181 + S194 + S216 migrations to the DB (xrefs render only on apply; Render egress blocked).
Full commands in `S217_ACTS_ORCHESTRATION_PLAN.md`.

## Queue (unchanged)
charles-vol2 re-parse (CCEL gate) · S212 Testaments XII JSON swap · library-wide forward sweep
(`XREF_LIBRARY_COVERAGE_ROADMAP.md`).
