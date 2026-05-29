S165 — Phase 9.3 close: run the apply sequence + walk

# S164 close summary — what shipped

S164 opened against the S164 prompt and landed the optional VerseActionMenu
menu-direct path per Yoshi's "Land at S164" decision. All Phase 9.3 code-side
work is now on disk; the remaining trajectory is the apply sequence + Yoshi's
live walk.

## S164 deliverables — landed

| Deliverable | Location | Status |
|---|---|---|
| Menu-direct LexiconSheet path (§26 §20 BDB / LSJ items) | `app/src/App.tsx` — `buildMenuSections` + new `lexiconState` + new `onLexicon` handler + top-level LexiconSheet mount | LANDED |
| Thayer's → LSJ rename in the menu (§26 S159 swap reflected in the UI label) | `app/src/App.tsx` | LANDED — menu item now reads "LSJ" not "Thayer's" |
| Companion-tier gate match (complete_study+) on the menu-direct path | `app/src/App.tsx` | LANDED — extras-tier and below see the tier-locked stub routing to /pricing |
| tsc clean across the project | `app/` — `tsc --noEmit -p .` | PASS |
| Sanity tests still passing (regression check) | `_s163_lexicon_sanity.mjs` | 48/48 PASS |

## Two on-ramps to LexiconSheet now wired

1. **Quick-tap path** — partner taps a word, StrongsLookup opens, partner taps
   "→ Read full lexicon entry (BDB / LSJ)" link below the Strong's body. This
   path works for all partners; LexiconSheet's API call enforces the gate
   server-side and renders the tier-locked card for below-Companion partners.
2. **Long-press path (new at S164)** — partner long-presses a word, menu opens
   with BDB (Hebrew word) or LSJ (Greek word) in the Word-study section.
   Companion+ partners see a live menu item that opens LexiconSheet directly
   (one tap from the menu, skipping Strong's). Below-Companion partners see
   the existing tier-locked stub with "Library" badge routing to /pricing.

The two paths share the same LexiconSheet component + the same API endpoint.
Below-Companion partners on the menu-direct path get the cleaner /pricing
routing UX (no API roundtrip); on the quick-tap path they see the tier-locked
card inside LexiconSheet (one extra modal level). Both functional.

## Yoshi-side apply checklist — Phase 9.3 close

All steps run from your terminal or Render Shell. The migrations are
re-runnable so a failed mid-sequence apply can be retried after fix.

### Step 1 — Render Postgres allowlist check

If your current terminal IP isn't already permitted, add it in the Render
dashboard under the Postgres service → Access Control. (Carried from S161;
no broad-CIDR change recommended — per-network add stays the discipline.)

### Step 2 — Apply schema migration (additive, fully reversible)

```bash
psql "$DATABASE_URL" -f data-schema/migrations/session162_lexicon_tables.sql
```

Creates `lexicon_entries` + `lexicon_callouts` tables + 2 indexes + 2 FKs.
DO $verify$ block fires at COMMIT to confirm; raises EXCEPTION on any
deviation. Schema version stamp bumps to `1.0.0-phase9.3-session162`.

### Step 3 — Apply lexicon entries bulk load (19,519 rows, ~42 MB SQL)

```bash
psql "$DATABASE_URL" -f data-schema/migrations/session163_lexicon_entries_load.sql
```

40 INSERT statements (batched at 500 rows per INSERT). Each uses ON CONFLICT
(source, strong_number) DO UPDATE so a re-run is safe. Schema version stamp
bumps to `1.0.0-phase9.3-session163`.

### Step 4 — Apply framework callouts (34 rows, author-reviewed at S162)

```bash
psql "$DATABASE_URL" -f data-schema/migrations/session162_lexicon_callouts_v1.sql
```

34 INSERTs with ON CONFLICT (strong_number) DO UPDATE — re-runnable.

### Step 5 — (Optional) Smoke-test the API endpoint with LEXICON_ENABLED on

If you want to verify the API works before the PWA push:

1. In Render dashboard, set `LEXICON_ENABLED=true` on the API service.
   Wait for the auto-deploy (~2 min).
2. Hit the endpoint with a Companion JWT:
   ```bash
   curl -H "Cookie: rop_jwt=$YOUR_COMPANION_JWT" \
        https://api.bible.remnantofpromise.org/v1/lexicon/H8451 | jq
   ```
3. Expected: 200 with `entries: [{source: "bdb", lemma: "תּוֹרָה", ...}]` and
   `callout: {term_display: "torah", ...}`.
4. Hit with a free-tier JWT (or no JWT):
   ```bash
   curl https://api.bible.remnantofpromise.org/v1/lexicon/H8451 | jq
   ```
   Expected: 403 with `{detail: {tier_required: "complete_study", feature:
   "lexicon"}}`.
5. If both work as expected, leave `LEXICON_ENABLED=true`. If issues, flip
   back to `false` and the route returns 404 cleanly.

### Step 6 — Push PWA changes

From the workspace folder:

```bash
cd ~/Desktop/App
git add app/src/lib/lexicon-helpers.ts \
        app/src/lib/api.ts \
        app/src/components/LexiconSheet.tsx \
        app/src/components/StrongsLookup.tsx \
        app/src/App.tsx \
        api/main.py \
        api/models.py \
        api/config.py \
        restoration-pipeline/_session163_load_lexicon_entries.py \
        data-schema/migrations/session163_lexicon_entries_load.sql \
        _scratch/lexicon_load_report_s163.md \
        _s163_lexicon_sanity.mjs \
        S163_SESSION_OPEN_PROMPT.md \
        S164_SESSION_OPEN_PROMPT.md \
        S165_SESSION_OPEN_PROMPT.md
git commit -m "Phase 9.3 — full lexicon loader, API endpoint, PWA LexiconSheet, menu wiring (S163/S164)"
git push
```

Render Static Site auto-rebuilds (~2 min). LexiconSheet + StrongsLookup edits
+ App.tsx menu wire + lexicon-helpers all land on the rebuild.

### Step 7 — Flip LEXICON_ENABLED=true (if not already from Step 5)

In Render dashboard, API service env vars → `LEXICON_ENABLED=true`. Auto-deploy
~2 min.

### Step 8 — Live walk on bible.remnantofpromise.org

With a Companion-tier login:

- **Tap a Hebrew word in any verse** (Gen 1:1 *Elohim*, e.g.). Strong's modal
  opens. Tap "→ Read full lexicon entry (BDB)" — LexiconSheet opens with the
  BDB body + (if on the framework list) the callout band above it.
- **Tap a Greek word in any verse** (e.g. John 1:1 *Word* = logos / G3056).
  Same flow with LSJ.
- **Long-press a Hebrew word**. Menu opens; tap "BDB" in the Word-study
  section. LexiconSheet opens directly (skipping Strong's).
- **Long-press a Greek word**. Menu opens; tap "LSJ" in the Word-study
  section. LexiconSheet opens directly.
- **Spot-check the framework callouts** by navigating to:
  - Hebrew: H8451 *torah*, H2617 *chesed*, H6918 *qadosh*, H7307 *ruach*,
    H0530 *emunah*, H7676 *shabat*, H6664 *tsedek*, H3548 *kohen*, H0120
    *adam*
  - Greek: G5485 *charis*, G4102 *pistis*, G3551 *nomos*, G3807 *paidagogos*,
    G1484 *ethne*, G0040 *hagios*, G0065 *agrielaios*, G4561 *sarx*, G4151
    *pneuma*
- **Verify with a free-tier login** that the menu shows "Library"-badged
  BDB/LSJ items routing to /pricing on tap; the "Read lexicon entry" link
  inside StrongsLookup opens LexiconSheet which renders the tier-locked card
  with the "Unlock with Companion" CTA.

### Step 9 — Phase 9.3 closes (or rolls back)

- **If clean** → leave `LEXICON_ENABLED=true`, Phase 9.3 closes. Phase 9.2
  (Hebrew-Greek interlinear) becomes the next major work.
- **If issues** → flip `LEXICON_ENABLED=false`, iterate at S165.

## Carried residuals (no change from S163)

- 9 long-tail singleton verses from S161 Group B (trace + fix individually).
- Yahuah → Adonai for vocatives addressing Yahusha (separate pipeline pass).
- Optional BDB sample-render re-render (cosmetic; production loader is the
  source of truth so the live surface is correct).
- v1.1+ wheel candidates: extending the slug map to apocrypha books (Sir,
  Wis, Tob, Bar, 1Mac–4Mac, Jdt, EpJer, Sus, 2Esd) as those land in the
  verses table; Gesenius source investigation; Thayer's 1889 alternate
  Greek lexicon if a clean Strong's-aligned dump surfaces; v1.1 PWA-side
  collapse-toggle for outlier bodies (λόγος, χάρις, φέρω) if reads feel
  heavy on the walk.

## Open questions for S165 (post-walk)

- **Disclaimer copy refinement** — based on how the disclaimer reads on real
  entries during the walk, you may want to tighten it. Single constant per
  source in `api/main.py` `LEXICON_DISCLAIMERS` and
  `app/src/lib/lexicon-helpers.ts` `DISCLAIMERS`.
- **System-wide Library → Companion rename** — the lockedTier Literal in
  VerseActionMenu currently still uses "library" / "notes". A future
  sweep can rename to "companion" / "notes" and update partnerAtOrAboveTier
  to enforce the Companion gate uniformly across all menu items. S164
  scoped the change to the BDB/LSJ items only via an inline check.
- **Phase 9.2 trajectory** — once Phase 9.3 closes, the Hebrew-Greek
  interlinear surface opens. Spec-then-build at S165 or later.

## Standing efficiency rules (carried)

Same as S163 — voice-gate batch, parallel subagents, local files first,
self-sufficient application, sandbox-git limitation, spec-then-build,
verbal-answers-transcribe, Render artifacts persist, Render Postgres
allowlist discipline.

## S164 status

Code-side Phase 9.3 work is fully landed. Two on-ramps to LexiconSheet
wired (quick-tap via StrongsLookup, long-press via VerseActionMenu).
48 sanity tests passing. tsc clean. 19,519 records ready for prod apply
behind the `LEXICON_ENABLED=false` gate. All one-way doors documented
above with the exact `psql` commands.

S165 opens against the post-apply state. Realistic estimate: S165 closes
Phase 9.3 if the apply + walk runs clean. If issues, S165 iterates the
fix and re-walks.
