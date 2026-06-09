# S216 — Session close (cross-references: John NT-to-NT)

## What landed this session
**`data-schema/migrations/session216_john_nt_to_nt_xref_threads.sql`** — the new FULL-LIBRARY
John New-Testament-to-New-Testament cross-reference migration. Closes the authoring gap S214
named (NT-to-NT was 27 of ~265 John targets).

- **42 threads / 140 cross_reference rows / 140 thread_member rows.** All `tier_required='free'`
  (canonical scripture xrefs, visible at every tier). Sort band **4000–4318**, no overlap with
  the S181/S194/S212 John bands.
- Source is **always a canon John verse**; targets are other NT books across **all 21 chapters**.
- Authored on the **edition-aware FULL-LIBRARY schema from the start** (lookup view lists every
  restored edition; `input(...)` carries `src_edition`/`tgt_edition`) so it passes the guard
  rather than re-incurring the canon-only regression.
- Built by **six per-chapter-range minions** (J1 / J2–4 / J5–8 / J9–12 / J13–17 / J18–21), each
  loading the voice skill and quoting from the local canon parse. Provenance: `scratch_xref_ntnt/`
  (minion fragments + `MINION_BRIEF_NTNT.md` + the dump/verify harness).

## Decisions transcribed (Yoshi, S216)
- **Scope:** NT-to-NT only this session. The rest of the xref queue (charles-vol2 re-parse,
  S212 Testaments XII re-verify, the roadmap forward sweep) carries forward untouched.
- **Pairing rule:** pair by **genuine textual fit wherever it falls** — no per-family quota.
  Synoptic parallels, John↔1 John, John↔Revelation, John↔Pauline are all drawn on only where
  the text actually warrants. (Recorded in the roadmap status log + the migration header.)

## Verification (all green)
- **FULL-LIBRARY guard** (`_xref_audit.py` classifier): **PASS** (FULL-LIBRARY).
- **Quote fidelity** (`verify_fidelity.py`): 139 faithful + **1 confirmed-verbatim false
  positive** — 1 John 1:2 is wholly wrapped in parentheses in the KJV, and the normalizer strips
  parenthetical content before shingling, so it has nothing to match. Quote confirmed verbatim by
  direct comparison. Effectively 140/140.
- **Real-PostgreSQL-grammar parse** (pglast / libpg_query): **OK**, 164 statements (2 transaction,
  6 temp views, 156 inserts). Single BEGIN/COMMIT, every INSERT idempotent (`ON CONFLICT DO
  NOTHING`).
- **S216 voice-gate review:** clean. Zero `son of man` (all Son of Adam; kaph-comparative
  preserved at Rev 1:13). No Jew/Gentile binary, no sola-fide grammar. High-risk threads verified
  against the Red Lines: Romans 11 olive (#11), Romans 13 love-as-the-doing-of-Torah (#5/#6),
  John 8:44 seed-war / sons-of-Belial (Checklist 9, conduct not ethnic), John 10:16 other-sheep =
  scattered house of Yashar'el not Gentile-inclusion (#7), Thomas 20:28 Formed-one confession
  (Checklist 10, neither co-equal-persons nor modalist).

## To apply (Yoshi's Mac Terminal)
Apply the canon John baselines first (still the open item from S214 — the reader needs these),
then this NT-to-NT layer:
```
python3 api/apply_migration.py data-schema/migrations/session181_john_xref_threads.sql
python3 api/apply_migration.py data-schema/migrations/session194_john_2_7_9_16_xref_threads.sql
python3 api/apply_migration.py data-schema/migrations/session216_john_nt_to_nt_xref_threads.sql
```
All idempotent — safe to re-run. After apply, eyeball a John chapter: canon Tanakh + NT-to-NT +
extras cross-refs should all surface; chapter-end order pills Kingdom → Witness → Commentary →
Cross-references.

> Note: the live DB cannot be reached from the session environment (Render egress blocked), so
> the "confirm at open" DB eyeball and the apply itself are Mac steps, not session steps.

## Carried forward (xref queue, untouched this session)
- **charles-vol2 re-parse** — layout-aware pdfplumber approach proven; held behind the CCEL
  verification gate before swapping production JSON + re-pointing xref verse ids.
  → `S214_CHARLES_VOL2_DEGRADATION_REPORT.md`
- **S212 John 13–17 Testaments XII re-verify** — re-verified clean in S214; the production-JSON
  swap is the remaining piece. → `S214_S212_JOHN_TESTAMENTS_XII_REVERIFY.md`
- **Library-wide forward sweep** — Acts → epistles → Revelation → Tanakh, FULL-LIBRARY from the
  start. → `XREF_LIBRARY_COVERAGE_ROADMAP.md`
- **App next-build-only** (not xref): Associated Domains entitlement, iPad screenshot reorder,
  Android edge-to-edge inset — fold into the next app build.
