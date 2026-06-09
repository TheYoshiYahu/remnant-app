# S216 — Session open (focus: cross-references)

Load `yoshi-voice` first. Mount `~/Desktop/App`.

## Closed last session (S215) — no action needed
- **iOS App Store: SUBMITTED, status "1.0 Waiting for Review."** Auto-
  releases to all 175 regions on approval. Build 1.0 (1) signed via a
  manual App Store profile ("RoP Bible App Store" + Apple Distribution
  cert). Reviewer login texas / Loan2019. See S209 runbook "S215" log.
- Git: pushed to `main` (eed95b8). Working tree clean.
- Next-build-only follow-ups (NOT now): Associated Domains entitlement
  for deep links; reorder iPad screenshots; Android edge-to-edge inset
  fix. All fold into the next app build, whenever that is.

## This session — cross-reference work
Primary: **John NT-to-NT cross-references.** Canon Tanakh coverage is
complete across all 21 John chapters; the NT-to-NT pairings are thin
(27 of 265 targets). Build the new FULL-LIBRARY `john_nt_to_nt`
migration, minions per chapter-range. → `S214_JOHN_CANON_XREF_DIAGNOSIS.md`

Also in the xref queue (pick up as fits):
- **charles-vol2 re-parse** — approach proven (layout-aware pdfplumber);
  held behind a CCEL verification gate before swapping the production
  JSON + re-pointing xref verse ids. → `S214_CHARLES_VOL2_DEGRADATION_REPORT.md`
- **S212 John 13–17 Testaments XII xref re-verify.**
  → `S214_S212_JOHN_TESTAMENTS_XII_REVERIFY.md`
- Library-wide coverage roadmap → `XREF_LIBRARY_COVERAGE_ROADMAP.md`

## Confirm at open
- DB migrations applied (S181 + S194 canon John render fix; S212
  mark/luke/john extras). Eyeball a Gospel chapter: canon Tanakh+NT
  cross-refs showing; chapter-end order pills → Kingdom → Witness →
  Commentary → Cross-references.
- Verify against the voice skill, not external editions (skill is the
  gold standard). Quote-don't-cite; full library bidirectional.
