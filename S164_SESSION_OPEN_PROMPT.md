S164 — Phase 9.3 close run: schema apply + lexicon load + callout apply + LexiconSheet menu wires + walk

# S163 close summary — what shipped

S163 opened against the S163 prompt: loader + apply + endpoint + PWA sheet. The
session landed the full loader-and-surface stack on disk. Schema + data
migrations are gated on Yoshi's `psql` apply; the API endpoint and PWA surface
land behind `LEXICON_ENABLED=false` until the data is loaded and Yoshi
greenlights the live walk.

## S163 deliverables — landed and pushed (where pushable from sandbox)

| Deliverable | Location | Status |
|---|---|---|
| Loader gating decisions (Q1 graceful + Q2 store-full + Q3 combined endpoint + Q4 server-side tier gate) | This file (S163 carry-forward) + comments in source | LANDED — verbal answers transcribed |
| Full-corpus lexicon loader | `restoration-pipeline/_session163_load_lexicon_entries.py` | LANDED — ran clean to 19,519 records |
| Lexicon entries bulk-load migration | `data-schema/migrations/session163_lexicon_entries_load.sql` | LANDED on disk; APPLY GATED on Yoshi |
| Coverage + link-integrity report | `_scratch/lexicon_load_report_s163.md` | LANDED |
| Combined API endpoint | `api/main.py` `GET /v1/lexicon/{strong_number}` | LANDED — env-gated by `LEXICON_ENABLED` (default False) |
| API tier gate (server-side) | `api/main.py` — `tier_satisfies()` against `complete_study` | LANDED — 403 + `tier_required` payload |
| Pydantic models | `api/models.py` — `LexiconEntry` / `LexiconCallout` / `LexiconResponse` | LANDED |
| Config kill-switch | `api/config.py` — `lexicon_enabled: bool = False` | LANDED — flip from Render dashboard at S164 close |
| PWA helpers (5 pure helpers) | `app/src/lib/lexicon-helpers.ts` | LANDED — `buildBreadcrumb`, `formatDisclaimer`, `parseLexiconBodyLinks`, `selectDefaultSource`, `formatCalloutHeader` |
| Helper sanity tests | `_s163_lexicon_sanity.mjs` | LANDED — **48 passing** (target ≥30) |
| PWA fetcher (typed 403/404 result) | `app/src/lib/api.ts` — `fetchLexiconEntry()` | LANDED |
| PWA LexiconSheet component | `app/src/components/LexiconSheet.tsx` | LANDED — z-60 modal stack with disclaimer + callout band + body |
| StrongsLookup integration | `app/src/components/StrongsLookup.tsx` — "→ Read full lexicon entry (BDB / LSJ)" link | LANDED — opens LexiconSheet on tap; LexiconSheet's API call enforces the tier gate |
| tsc clean across the project | `app/` — `tsc --noEmit -p .` | PASS |

## Coverage + link-integrity gate (final loader run)

| Source | Records | Avg body | Max body |
|---|---:|---:|---:|
| BDB Hebrew/Aramaic | **8,673** | 798 chars | 55,324 chars |
| LSJ Greek + Abbott-Smith NT fallback | **10,846** | 2,740 chars | 74,160 chars |
| **Total** | **19,519** | — | — |

Plan target was ~17K (parse plan §V estimated ~8,600 BDB + ~5,624 LSJ); loader
exceeds plan because TFLSJ-extra carries the extended-Strong's range past the
original 0-5624 scope (~+5,200 extra Greek entries).

Citations resolved → `<a data-verse>`: **11,868**.
Citations downgraded → `<span class="lexicon-unresolved-cite">`: **1,004**.
**Resolution rate: 92.2%** (lifted from 72.5% on the first pass after the
biblical-cite detector was tightened — title's first ref-token must start with
NT./LXX./OT. rather than the looser anywhere-in-title match). Remaining
unresolved are dominated by apocrypha abbreviations (Sir, Wis, Tob, Bar,
1Mac–4Mac, Jdt, EpJer, Sus, 2Esd) that canon.json's 66-book scope doesn't
carry. v1.1+ wheel can extend the slug map to apocrypha + restored texts as
those land in the verses table.

Unresolved BDB cross-lemma targets: **1 distinct**. The loader preserves the
single unresolved as `<a data-bdb="…">` for future BDB-id navigation wireup.

Sample entries spot-checked in the emitted SQL — all 13 anchor-Strong's
verified present (H8451 torah, H2617 chesed, H6918 qadosh, H7307 ruach, H0530
emunah, H8451 torah, G5485 charis, G4102 pistis, G3551 nomos, G3807 paidagogos,
G1484 ethne, G0040 hagios, G0065 agrielaios). All 6 framework-deep callouts
verified present in `session162_lexicon_callouts_v1.sql` (1 row each).

## Voice-gate / authoring discipline (carry-forward from S162)

Voice-gate batch pattern remains the standard for any future authored-content
batch. Subagent batches with `framework-deep.md` + `H8451_torah.md` exemplar +
S160 draft mounted in each fresh-context subagent — reusable as needed.

The §26 disclaimer copy is API-canonical (`api/main.py` `LEXICON_DISCLAIMERS`
constant) and mirrored in `app/src/lib/lexicon-helpers.ts` as a defensive
offline-cache fallback. Refinement post-launch happens by editing one constant
in each location; no schema change, no migration.

## Decisions locked at S163 (per verbal-answers-transcribe rule)

Per the four S163-open Yoshi-questions:

- **Q1 — Citation normalization aggressiveness → graceful (locked).** Unresolved
  cites wrap in `<span class="lexicon-unresolved-cite">` per Edge Case #9.
  Loader logs the count + samples but emits the migration. PWA renders them
  as styled but non-tappable text. Matches publish-then-edit. v1.1+ sweep can
  fix outliers in subsequent passes without schema change.
- **Q2 — Body size cap → store full body, gate at Companion tier (locked).**
  Outlier entries (λόγος ~74KB, χάρις ~32KB, φέρω ~70KB) stored as-is.
  Companion-tier API gate keeps them off the free surface. Collapse-toggle is
  a v1.1+ PWA-side refinement if reads feel heavy on Yoshi's walk; no schema
  or loader change needed.
- **Q3 — API endpoint shape → single combined endpoint (locked).**
  `GET /v1/lexicon/{strong_number}` returns `{ entries: [...], callout: {...}|null,
  available_sources: [...] }`. Single round-trip per word-tap. Supersedes the
  two-endpoint pattern in the S158 skeleton — that spec is updated by this
  decision; future spec edits in DESIGN_LANGUAGE §26 should reflect the
  combined shape.
- **Q4 — Tier gate location → at the API endpoint (locked).** Server-side
  `tier_satisfies()` check returns 403 + `{ tier_required: "complete_study",
  feature: "lexicon" }` for non-Companion JWTs. PWA's `fetchLexiconEntry()`
  surfaces this as the tier-locked card with "Unlock with Companion" CTA.
  Defense in depth — direct API calls can't bypass the gate.

## Known residuals carried from S162

Same as S162 carry-forward — no changes at S163:

- **9 long-tail singleton verses** from S161 Group B (malachi 4:4 / matthew
  5:33 / mark 10:15 / philippians 2:2 / john 21:7 / romans 1:13 / ephesians
  2:5 / hebrews 11:37 / revelation 1:10). Trace-and-fix individually.
- **Yahuah → Adonai for vocatives addressing Yahusha** — vocative-to-the-Son
  detection layer for the restoration pipeline. Separate pass, not lexicon
  work.
- **Optional BDB sample-render re-render** — `outputs/Phase_9.3_BDB_Sample_Render_S160.html`
  shows the S160 versions of chesed/shabat/qadosh/kohen callouts. Production
  loader pulls current source drafts via `session162_lexicon_callouts_v1.sql`
  so the live surface is correct; the sample render is stale for those four
  callout bodies only. Re-render is cosmetic; production loader is the
  source of truth.

## One-way doors — do NOT execute without explicit go-ahead (carried + extended)

Same as S162 plus the loader output. Apply in this order from Yoshi's
terminal (or Render Shell with `psql "$DATABASE_URL"`):

1. **Schema migration** (additive, fully reversible via DROP TABLE on both):
   ```
   psql "$DATABASE_URL" -f data-schema/migrations/session162_lexicon_tables.sql
   ```
2. **Lexicon entries bulk load** (19,519 rows; re-runnable via ON CONFLICT
   DO UPDATE on (source, strong_number)):
   ```
   psql "$DATABASE_URL" -f data-schema/migrations/session163_lexicon_entries_load.sql
   ```
3. **Framework callouts** (34 rows; re-runnable via ON CONFLICT DO UPDATE on
   strong_number):
   ```
   psql "$DATABASE_URL" -f data-schema/migrations/session162_lexicon_callouts_v1.sql
   ```
4. **API env-var flip** — `LEXICON_ENABLED=true` in Render dashboard for the
   API service. Triggers an automatic re-deploy (~2 min).
5. **PWA Static Site rebuild** — push to git → Render Static Site auto-rebuild
   (~2 min). LexiconSheet + StrongsLookup edits + lexicon-helpers land at this
   step.
6. **Yoshi's live walk** on `bible.remnantofpromise.org` — tap a Hebrew word,
   see BDB body + framework callout; tap a Greek word, see LSJ body + framework
   callout. Spot-check 5-10 entries across both languages including a couple
   of the framework-deep callouts (chesed, pistis, qadosh, torah, charis,
   ruach, emunah) to verify the redrafts render correctly.
7. **If clean** → leave gate on, Phase 9.3 closes. **If issues** → flip
   `LEXICON_ENABLED=false`, iterate, re-walk.

## Open Yoshi-questions at S164 open

- **Render Postgres allowlist + auto-deploy** — carried from S161/S162. Still
  pending the broad-CIDR vs documented-per-network decision. Verify the Static
  Site auto-deploy is correctly configured before the LexiconSheet PWA push.
- **VerseActionMenu BDB/LSJ stubs** — should the §20 menu Word-study items
  rename from `library`-locked to `complete_study`-locked AND have their
  `onSelect` wired to open LexiconSheet directly (skipping StrongsLookup)?
  S163 landed the StrongsLookup entry path (the "Read full lexicon entry" link
  inside StrongsLookup), which is the primary on-ramp. The menu-direct path
  is a small App.tsx edit and a nice-to-have for partners who long-press to
  reach BDB/LSJ without going through Strong's first.
- **Disclaimer copy refinement opportunity** — the S163 disclaimer text is the
  one drafted in §26 Gate #1. Yoshi may want to tighten it post-walk based on
  how it reads on real entries. Single constant per source in both
  `api/main.py` `LEXICON_DISCLAIMERS` and `app/src/lib/lexicon-helpers.ts`
  `DISCLAIMERS`.

## Order of operations at S164

1. **Render Postgres IP allowlist check** — add Yoshi's terminal IP if not
   already permitted.
2. **Apply schema migration** from Render Shell (one-way door #1).
3. **Apply lexicon entries bulk load** from Render Shell (one-way door #2).
4. **Apply framework callouts** from Render Shell (one-way door #3).
5. **(Optional) Smoke-test the API endpoint** — `LEXICON_ENABLED=true`
   temporarily, hit `https://api.bible.remnantofpromise.org/v1/lexicon/H8451`
   with a Companion JWT, verify the response shape. Flip back to false if
   not ready for staging.
6. **Decide on the VerseActionMenu wiring** — land at S164 or defer to S165.
   ~30 lines of App.tsx changes if landed.
7. **Push PWA changes** — LexiconSheet + StrongsLookup edit + lexicon-helpers
   land on the Static Site rebuild.
8. **Flip `LEXICON_ENABLED=true`** in Render dashboard.
9. **Yoshi's live walk** — spot-check across both languages + framework
   callouts. If clean, Phase 9.3 closes.

## Standing efficiency rules (carried from S158/S159/S160/S161/S162/S163)

- **Voice-gate batch pattern** — Claude reads every draft, applies the gate
  analytically, surfaces only FLAGs for review, batch-applies fixes on
  greenlight. Supersedes per-draft walk for any future authored-content
  batch.
- **Parallel-subagent pattern** reusable for any future content batch needing
  fresh-context drafting with framework-deep references mounted.
- **Local files first** — all lexicon source data on disk at `~/Desktop/App/
  source-texts/`; no web-fetch needed.
- **Self-sufficient application of skill + source** — implementation choices
  that don't materially affect partner-perceived surface get landed without
  per-line approval. S163 case-in-point: the loader's biblical-cite detector
  tightening (lifting resolution from 72.5% → 92.2%) was a quality
  improvement Claude made under the rule, not gated on Yoshi.
- **Sandbox-git limitation** — commits + migration applies + DB writes run
  from Yoshi's terminal or Render Shell. Sandbox emits the SQL and reads the
  source files; Yoshi applies.
- **Spec-then-build** — any architecture refinement caught during
  implementation lands in the spec docs BEFORE the code lands. S163 case:
  the §26 two-endpoint spec is superseded by the combined endpoint per Q3
  decision; spec doc edit goes here, in this S163 close summary, for the
  next maintainer.
- **Verbal-answers-transcribe** — honored at S163 — all four Q decisions
  transcribed into this S164 open prompt before session close.
- **Render artifacts persist** — `.gitignore` patched at S160 so
  `outputs/Phase_*.html` files commit. Same rule applies to the migration
  SQL files in `data-schema/migrations/`.
- **Render Postgres IP allowlist** — when network changes, add IP to Render
  dashboard before scripting against prod DB.

## S163 status

Full Phase 9.3 stack landed on disk: loader, API endpoint with env-gate +
server-side tier gate, Pydantic models, config kill-switch, PWA helpers with
48 passing sanity tests, LexiconSheet React component, StrongsLookup
integration. Coverage gate passed (19,519 records, exceeds 17K plan target).
Link-integrity gate passed (92.2% resolution rate, only 1 unresolved cross-
lemma). tsc clean across the project.

S163 trajectory split: the data + code lands here; the prod apply + live
walk runs at S164 under the one-way-doors discipline. Realistic estimate:
S164 closes Phase 9.3 if the schema + load + callout migrations apply clean
and the live walk passes. If issues surface, S165 catches the iteration.
Phase 9.2 (Hebrew-Greek interlinear) opens after Phase 9.3 closes.
