S173 — Capacitor wrap + cross-device display-prefs + mobile chrome layout

# Session shape (three tracks + one emergent)

Briefing locked three tracks at open:

  1. **Capacitor wrap** — `capacitor.config.ts` + iOS/Android shells,
     `@capacitor/share` swap, deep-link URL scheme for
     `bible.remnantofpromise.org/strongs/{N}`, app icons + splash from
     v4 brand-mark, TestFlight + Play Console submission.

  2. **S172 phone-walk redline triage** — Gen 2:4 interlinear mask
     verification, §17 xref two-phone share walk, /strongs/G3056 link
     preview test.

  3. **Settings server-side persistence** — JSONB extension vs
     `partner_preferences` table decision per the S172 spec open
     question; signed-in cross-device sync for the sacred-name mask.

Track 3 + Track 1 landed code-clean this session. Track 2 (phone-walks)
gated on Yoshi having phones in hand AND the PWA bundle live on Render
(deploy stalls described below resolved late in the session).

**Emergent work:** wife-the-partner reported the chrome cluster
overflows the mobile viewport (title squeezed into a 1-word-per-line
column, "Manage partnership" cut off past the right edge). Surfaced
mid-session as a Capacitor V1 launch-blocker (same UI ships into
TestFlight / Play). Two iterations landed — first a horizontal-scroll
rail (functional but partner had to swipe), then flex-wrap multi-row
(all seven metallic buttons visible without scroll). The wrap version
is the current bet pending live verification.

# Track 3 — Settings cross-device sync (CLOSED)

## Decision pivots at open

**Original spec ambiguity resolved.** S172_SACRED_NAME_MASK_SPEC line
460 left open "JSONB `subscriptions.display_prefs` extension OR
separate `partner_preferences` table." Yoshi-vote at session open was
the JSONB option. Mid-session catch: **`subscriptions` is multi-row
per partner** (tier upgrade creates a new subscription row per the
schema.sql:508 comment), so `subscriptions.display_prefs` would be
ambiguous on read AND require copy-forward on tier upgrade to avoid
data loss. Surfaced + re-asked; Yoshi chose `users.display_prefs JSONB`
— the canonical one-row-per-partner table that `reading_positions`,
`highlights`, etc. already FK into.

## Schema + migration

`data-schema/schema.sql` — added `display_prefs JSONB` column on
`users` table (line 458 region) with COMMENT block documenting the
sparse-shape contract. `schema_version` bumped to
`1.0.0-phase4-session173`.

`_scratch/_session173_apply_display_prefs.py` — NEW. Idempotent
migration script following the `_session38_apply_psycopg.py` pattern
(psycopg3 binary build, `_db_url.txt` sourcing, `column_exists` +
`ALTER TABLE` + COMMENT + version bump + verify). Two ops:

  1. `ALTER TABLE users ADD COLUMN display_prefs JSONB` (if missing)
  2. `UPDATE schema_version SET version = 1.0.0-phase4-session173`

**Runs from Yoshi's terminal against prod Postgres before the new API
endpoints will resolve cleanly** — the GET/PUT return 500 against the
existing schema until the column lands.

## API endpoints

`api/models.py` — `DisplayPrefs` Pydantic v2 model. Sparse-shape
contract: every field `Optional`. Recognized keys at S173:
`sacred_name_mask` (Literal `"yahuah" | "yhwh"`), `hide_parentheticals`
(bool), `theme` (Literal `"light" | "dark"`), `font_size` (Literal
`"small" | "medium" | "large"`), `interlinear_default` (bool),
`tts_voice` (string voice id). Two render-affecting fields wired
client-side this session (the mask + parens-hide); the other four are
forward-compatible for whenever their Settings controls land.

`api/main.py` — two endpoints, both behind `get_current_user_required`,
no tier gate (display prefs are §9 free-tier same as reading position):

  - `GET /v1/me/display-prefs` → `DisplayPrefs`. Returns all-None when
    no row OR the JSONB column is NULL (treats "no prefs" as "empty
    prefs" rather than 404 for cleaner client logic).
  - `PUT /v1/me/display-prefs` → `DisplayPrefs`. Whole-object replace
    of the JSONB column (NOT partial merge). Rationale captured in
    the inline docstring: the client always carries its full intended
    state in localStorage and re-sends the snapshot on every change,
    so server-canonical replacement avoids stale-merge bugs across
    multi-device usage. `model_dump(exclude_none=True)` keeps the
    JSONB sparse — only keys the partner has explicitly set hit the
    column.

SQL pattern: `UPDATE users SET display_prefs = $2::jsonb` with the
body JSON-stringified and `to_jsonb($2::text)` semantics, sidestepping
any asyncpg JSONB codec surprises. Body size is ≤6 keys so the text
round-trip is fine.

## Client reconciliation

`app/src/lib/api.ts` — `DisplayPrefs` interface + `getDisplayPrefs()`
+ `putDisplayPrefs()` typed client helpers mirror the FastAPI shape.

`app/src/lib/display-prefs-sync.ts` — NEW. Bridges the
localStorage-backed S172 preference hooks (`useSacredNameMask`,
`useParentheticalsToggle`) with the server canonical state:

  - `readLocalSnapshot()` — reads every known localStorage pref key
    into a `DisplayPrefs` shape; defensive parsing returns null for
    garbage values (e.g., `mask = "garbage"` → null).
  - `writeLocalSnapshot(prefs)` — writes server-canonical values into
    localStorage per the S172 spec rule ("server wins on divergence
    at sign-in"). Skips null keys (server has no opinion → localStorage
    stays). Dispatches the in-tab `rop:display-prefs-changed`
    CustomEvent so the React hooks re-read after a reconcile. Returns
    a `changed` flag the caller uses to skip the event dispatch on
    no-op reconciles.
  - `pullAndReconcile()` — GET + writeLocalSnapshot composition.
    No-ops when no JWT cookie present (anonymous → nowhere to read
    from). Swallows network/HTTP errors so a flaky API never blocks
    the reader from mounting.
  - `pushSnapshot()` — read local + PUT. No-ops anonymous; swallows
    errors so a transient API failure doesn't surface to the partner.
  - `hasJwtCookie()` — best-effort gate; checks for `rop_jwt=token`
    in document.cookie with empty-cookie exclusion.

`app/src/lib/useSacredNameMask.ts` + `app/src/lib/useParentheticalsToggle.ts`
— added cross-tab `storage` event listener AND in-tab
`rop:display-prefs-changed` CustomEvent listener so the React tree
updates when reconcile writes a server-canonical value. `set()` now
calls `pushSnapshot()` after the local persist — fire-and-forget;
helper no-ops if not signed in.

`app/src/App.tsx` — `pullAndReconcile()` fires once on mount inside
the `App` component (not `Reader` — the modal can fire on Landing /
Pricing too, the preference frames every text-render surface app-wide).

## Sanity

`_s173_display_prefs_sanity.mjs` — NEW, **42/42 passed**. Covers:

  - `readLocalSnapshot` parsing (absent keys → null; `yahuah` /
    `yhwh` clean parse; garbage → null; `"true"` / `"false"` parens;
    wrong-case `"TRUE"` → null)
  - `writeLocalSnapshot` reconciliation matrix (server null + local
    set → no write no event; server set + local absent → write +
    event; server set + local same → no-op; server set + local
    differs → server wins; both-null → no-op; both-keys-diverge →
    both swap with ONE batched event)
  - `hasJwtCookie` cases (no cookie / token / empty token / multi-
    cookie with rop_jwt / multi-cookie without / prefix-collision
    `rop_jwt_other`)
  - PUT payload shape (`exclude_none` drops nulls; mask-only set →
    `{sacred_name_mask}`; both set → both keys; `hide_parentheticals
    = false` preserved not stripped as falsy)
  - End-to-end multi-device scenario (Phone A flips mask, PUT carries
    sparse payload, Phone B reconciles from server on first sign-in)

# Track 1 — Capacitor wrap (CODE-COMPLETE; YOSHI-HANDS GATED ON STORE SUBMISSION)

## Sub-tracks 1a-1c — code

`app/package.json` — `@capacitor/{core,cli,ios,android,share,app,
filesystem,assets}` added with version ranges:

  - core, cli, ios, android: `^8.3.1`
  - share, filesystem, app: `^8.0.0`
  - assets: `^3.0.5` (mid-session repin — see Render-deploy story
    below; `^4.0.0` was a speculative pin and broke npm install)

Four new scripts: `cap:sync`, `cap:ios`, `cap:android`, `cap:assets`
(the last invokes `@capacitor/assets generate` with the locked
dark-onyx background color `#0a0e1a` for icon + splash backgrounds).

`app/capacitor.config.ts` — NEW. `appId
com.remnantofpromise.bible` (matches BIBLE_APP_ROADMAP.md Phase 10.2
spec), `appName "Remnant of Promise"` (short form to avoid
homescreen truncation; long form was 8 words and would clip on every
device), `webDir dist`. SplashScreen plugin pinned at 1500ms launch
duration with the dark-onyx background matching the locked reader
surface. iOS posture: `contentInset always`; Android posture: HTTPS-
only (`allowMixedContent: false`). Server block stays commented for
release builds; uncomment + set `url` to the LAN IP for the
Vite-dev-server live-reload pattern when wanted.

`app/src/lib/capacitor-share.ts` — NEW. Two helpers:

  - `tryNativeShare({canvas, filename, text, url, dialogTitle?})` —
    on native (Capacitor.isNativePlatform()) writes the canvas PNG to
    the platform CACHE dir via `@capacitor/filesystem` (base64 string,
    NO encoding argument — Filesystem treats raw base64 when no
    `encoding` is passed; passing `Encoding.UTF8` would corrupt the
    PNG payload), then `@capacitor/share.share({title, text, url,
    files: [uri], dialogTitle})`. Returns `{handled, ok, aborted,
    error}` discriminated shape. On web returns `{handled: false}` so
    the caller falls through to the existing PWA chain.
  - `tryNativeShareText({text, url, dialogTitle?})` — text-and-URL
    share variant for the no-canvas case (e.g., locked-thread
    watermark-URL-only share). Same `handled` discriminator.

All Capacitor packages dynamically imported (`await import(...)`) so
the PWA bundle's critical path stays slim — Vite emits a separate
chunk that's only fetched when `isNativePlatform() === true`.

`app/src/lib/share-card-render.ts` — Path 0 added to BOTH `executeShare`
and `executeCopy` before the existing navigator.share chain. On native
the path runs first; if `aborted` → return clean aborted; if `ok` →
return success; if `handled` but `!ok` → fall through to the web
chain. On web Path 0 no-ops → existing chain unchanged. URL slot
passes the brand domain (no anchor permalink because the verse-share
PNG carries the verse reference in the watermark itself).

`app/src/lib/study-share-render.ts` — Path 0 added to
`executeStudyShare`. URL slot is per-meta-kind: xref shares pass the
anchor permalink (`https://bible.remnantofpromise.org/{book}/{chap}.{verse}`),
strongs shares pass `https://bible.remnantofpromise.org/strongs/{N}`,
default falls back to the bare brand URL.

`app/src/lib/deep-link.ts` — NEW. Capacitor deep-link router for the
S171 watermark URL pattern (`bible.remnantofpromise.org/strongs/{N}`):

  - `parseStrongsDeepLink(rawUrl)` — URL parser. Accepts apex and api
    subdomain hosts. Tolerates query strings, fragments, trailing
    slashes, uppercase hosts. Returns canonical `H####` / `G####`
    normalized form via the mirror-of-`_normalize_strong_number`
    helper (lowercase prefix → upper; digits zero-padded to 4).
    Returns null on bare-number (no H/G prefix → ambiguous), wrong
    domain, wrong path, malformed URL.
  - `dispatchOpenStrongs(strongNumber)` — dispatches the
    `rop:open-strongs` CustomEvent with `{strongNumber}` in detail.
  - `installDeepLinkRouter()` — subscribes to `@capacitor/app`'s
    `appUrlOpen` event when running native. Routes
    `bible.remnantofpromise.org/strongs/{N}` URLs through the parser
    + dispatcher. Returns a teardown function for React useEffect
    cleanup. No-op on web (the same URL handled there via the Render
    302 redirect to the API subdomain).

`app/src/App.tsx` — `installDeepLinkRouter` fires once on mount. A
new listener on `rop:open-strongs` sets `strongsState` to
`{strong, surface: ""}` so the existing StrongsLookup modal opens
with the deep-linked entry. (Surface is empty because the deep-link
URL doesn't carry the surface word — StrongsLookup tolerates this
by falling back to the lexicon entry's lemma display.)

## Sub-track 1d-1e — handoff doc

`CAPACITOR_SETUP.md` — NEW. Operator runbook covering:

  - `npm install` + `npx cap add ios` + `npx cap add android`
  - `@capacitor/assets` icon + splash generation from the locked v4
    brand-mark (`brand-assets/app-icon-ios-1024x1024.png` +
    `brand-assets/app-icon-android-play-store-512x512.png` are the
    source files; `cap:assets` script generates the per-density set
    into `app/ios/.../Assets.xcassets/` + `app/android/.../res/mipmap-*/`)
  - Universal Links wiring (apple-app-site-association JSON shape,
    `applinks:bible.remnantofpromise.org` entitlement, Render route
    for `/.well-known/apple-app-site-association`)
  - Android App Links wiring (assetlinks.json with SHA-256
    fingerprint pulled from the signing keystore + matching
    intent-filter in AndroidManifest.xml with `autoVerify=true`)
  - Apple Developer + App Store Connect + TestFlight workflow
  - Google Play Console + signing keystore generation + AAB upload
  - Live-walk checklist on a real device (first-launch modal, deep
    link, native share verse / xref / strongs, sacred-name mask
    flip-cross-device, cold launch)

**Open hand-off blocker:** the apple-app-site-association needs your
Apple Team ID (10-char string from App Store Connect → Membership)
before the file can be wired into `hosting/render.yaml` as a real
route. Marked as a TEAMID placeholder in CAPACITOR_SETUP.md § 3.

## Sub-track 1f — sanity

`_s173_deep_link_sanity.mjs` — NEW, **36/36 passed**. Covers:

  - `normalizeStrongNumber` (uppercase/lowercase prefix, zero-pad
    H1 → H0001, idempotent on canonical form, null on bare/empty/
    non-numeric/whitespace, whitespace-trimmed)
  - `parseStrongsDeepLink` happy paths (apex + api hosts, https +
    http, query strings, trailing slash, lowercase prefix,
    zero-padded form, fragments, uppercase host)
  - `parseStrongsDeepLink` null paths (non-strongs path, wrong
    domain, bare number no prefix, non-numeric, empty id, malformed
    URL, relative URL, nested path)

# Mobile chrome layout emergent work

## Diagnosis

Mid-session screenshot: title "The Remnant of Promise Official
Study Bible" rendered one word per line in a narrow left column;
chrome cluster (Listen / Search / Bookmarks / Notes / MODE Light-Dark
/ Settings / Manage partnership) on the right, "Manage partnership"
cut off past the viewport edge.

Root cause: header was `<div className="flex items-start
justify-between gap-4">` with the chrome `div` carrying 8 buttons at
text+icon width each. Total chrome intrinsic width ≈ 700-750px, well
beyond a 360-400px phone viewport. flex-justify-between pushed
chrome to the right; chrome's intrinsic-width demand squeezed the
title `h1` into the smallest column it could wrap to.

## V1 — horizontal-scroll rail (rejected after live verify)

First fix swapped the layout to `flex flex-col gap-4 sm:flex-row
sm:items-start sm:justify-between` (stack vertically below sm: 640px)
with a full-bleed horizontal-scroll strip for the chrome row on
mobile (`-mx-6 ... overflow-x-auto px-6 pb-1` + `[&>*]:shrink-0` on
each button). Preserved the seven-metallic chrome work but partner
had to swipe to reach buttons past the right viewport edge.

Wife-the-partner reaction: "still ugly and still have to scroll
right to see all of menu." Floated whether to switch to a side
menu.

## V2 — flex-wrap multi-row (current bet, pending live verify)

Second fix: chrome row becomes `flex flex-wrap items-start gap-2
sm:flex-nowrap [&>*]:shrink-0`. All seven buttons pack onto 2-3
rows at their intrinsic widths; no horizontal scroll. Preserves the
metallic-chrome visibility AND removes the swipe gesture.

Tradeoff: adds 60-90px to the header's vertical footprint on mobile;
first verse moves down the page accordingly. Wrap shape (3-2-2 vs
4-3 vs 2-2-2-1 etc.) depends on each button's intrinsic width and
will be confirmed on live walk.

# The Render deploy story (lessons learned, carry forward)

Three failed PWA deploys stalled the Capacitor + mobile chrome work
mid-session. Two root causes, both my error:

  1. **Speculative `@capacitor/assets@^4.0.0` pin.** Wrote the
     dependency range without WebSearch-verifying actual published
     versions; latest is **3.0.5**, no 4.x exists. `npm install`
     failed → build failed. Fix: repin to `^3.0.5`.
  2. **Unused `Encoding` destructure in `capacitor-share.ts`.**
     Render's tsc runs with `noUnusedLocals: true` (the project
     tsconfig has it on) and rejected the unused import. My local
     `npx tsc --noEmit -p .` had silently passed — Capacitor
     packages aren't locally installed yet, so the destructured
     `Encoding` resolved to implicit `any` and the unused-locals
     check behaved differently than against the real type. Fix:
     drop the `Encoding` declaration and the destructuring slot
     (documented in comment instead).

**S173 forward rule (adding to standing):** when CI-style work
introduces new dependencies that aren't locally installed AND
strict-mode lints are on, run `npx tsc --noEmit -p .
--noUnusedLocals --noUnusedParameters` explicitly to catch what
the default invocation misses. Also: WebSearch-verify every new
third-party package version range before pinning; don't extrapolate
from a sibling package's version line.

**S173 secondary lesson:** when a monorepo has multiple Render
services + `autoDeploy: true`, every push fires deploys for ALL
services — the API service rebuild on a frontend-only commit is a
no-op image rebuild but still surfaces a "deploy live" event. Don't
mistake the wrong service's "live" event for the deploy you cared
about; verify the service name + most-recent SHA on the Events tab
before declaring the deploy done.

# Verification

## tsc -b

Exit 0 across the project after both Render-deploy fixes landed.
Explicit re-run with `--noUnusedLocals --noUnusedParameters` clean.

## Sanity suites — all green

  - `_s123_range_selection_sanity.mjs`   → 18 passed
  - `_s125_search_sanity.mjs`            → 35 passed
  - `_s127_share_card_sanity.mjs`        → 21 passed (unchanged)
  - `_s129_additive_body_sanity.mjs`     → 11 passed
  - `_s140_search_teaser_sanity.mjs`     →  6 passed
  - `_s157_tts_sanity.mjs`               → 55 passed
  - `_s163_lexicon_sanity.mjs`           → 48 passed
  - `_s166_bookmarks_index_sanity.mjs`   → 34 passed
  - `_s167_interlinear_sanity.mjs`       → 79 passed
  - `_s168_interlinear_layer_sanity.mjs` → 53 passed
  - `_s170_study_share_sanity.mjs`       → 54 passed
  - `_s171_xref_share_sanity.mjs`        → 29 passed
  - `_s172_sacred_name_mask_sanity.mjs`  → 32 passed
  - **`_s173_display_prefs_sanity.mjs`** → **42 passed (NEW)**
  - **`_s173_deep_link_sanity.mjs`**     → **36 passed (NEW)**

## Live walk

**Track 2 deferred to S174-open.** Three walks queued:

  1. **Gen 2:4 interlinear column-stack mask verification** — confirm
     the English bottom row renders YHWH (not Yahuah) after the
     df95de0 fix landed, in YHWH-mask mode.
  2. **§17 xref two-phone share walk** — per-row Share pills export
     legibility under iMessage thumbnail compression, anchor-
     permalink URL render on the receiving phone.
  3. **/strongs/G3056 link-preview test** — paste URL into iMessage,
     confirm OG card renders on the receiving phone via Render 302
     redirect.

Gated on (a) Render bundle for `80cef80` + the flex-wrap commit
live; (b) Yoshi holding both phones; (c) the
`_session173_apply_display_prefs.py` migration script having run
against prod Postgres (otherwise the sign-in cross-device sync 500s
on the missing column).

## Live walk - mobile chrome wrap (gated on Render deploy)

Confirm:
  - Title renders on a single readable line OR a natural 2-line
    wrap (not 1-word-per-line column)
  - Chrome cluster packs onto 2-3 rows below the title; all seven
    buttons visible without swipe
  - Wrap shape is partner-acceptable (no awkward orphaned button on
    its own row)
  - At ≥640px (desktop, tablet landscape) layout reverts to the
    original side-by-side row with title on left and chrome on right
  - Per-button `shrink-0` keeps each metallic button at its natural
    width (no intra-row squish)

If wrap shape is awkward, two iteration paths queued: (a) reorder
buttons so widths balance, (b) shrink one or two to icon-only on
mobile.

# Push verification (S166 standard)

## pushed (Yoshi's terminal during the session)

Eleven commits pushed on `main`:

  - `bff182f S173 — users.display_prefs JSONB for cross-device sync`
  - `e2add90 S173 — GET/PUT /v1/me/display-prefs endpoints (whole-object replace, sparse JSONB)`
  - `59b05bb S173 — client display-prefs reconciliation (server-wins on sign-in)`
  - `b952d82 S173 — Capacitor wrap config (com.remnantofpromise.bible) + deps`
  - `bfe785b S173 — @capacitor/share path for §24 + §30 + §17 exports on native shells`
  - `e44d1c3 S173 — Capacitor deep-link router (/strongs/{N} → in-app StrongsLookup)`
  - `14077a4 S173 — Capacitor setup handoff + deep-link sanity (36/36)`
  - `80cef80 S173 — mobile chrome overflow fix (stack header vertically + scroll rail below sm:)`
  - `61d8f7d S173 — repin @capacitor/assets ^3.0.5 (4.x doesn't exist; was breaking Render PWA build)`
  - `[hash] S173 — drop unused Encoding import in capacitor-share.ts (tripped noUnusedLocals on Render tsc)`
  - `[hash] S173 — mobile chrome wraps to multiple rows instead of horizontal scroll`

The last two commit hashes are whatever your terminal stamped on
push; capture them at S174 open and stamp here.

## committed-not-pushed

None at session close.

## edited-not-committed

`S173_CHECKPOINT.md` — NEW (this file).

Recommended close commit:

```bash
cd ~/Desktop/App
git add S173_CHECKPOINT.md
git commit -m "S173 checkpoint"
git push
```

# Open Yoshi-questions carried forward to S174

  1. **Mobile chrome wrap verification.** Once the flex-wrap commit
     lands live on Render, does the multi-row layout read clean on
     your wife's Android Chrome AND your iPhone Safari? If a button
     orphans on its own row in an awkward way (e.g., "Manage
     partnership" hanging alone past three short buttons), the
     iteration path is either reorder for width balance or
     icon-only on mobile for the worst-offending labels.
  2. **Apple Team ID** for apple-app-site-association at
     `bible.remnantofpromise.org/.well-known/`. Pull from App Store
     Connect → Membership after the Developer account activates.
     S174 wires it into `hosting/render.yaml` as a Render route +
     drops the file at `app/public/.well-known/apple-app-site-
     association` for the static-site server to expose.
  3. **Android signing keystore SHA-256.** Same routing —
     `.well-known/assetlinks.json` needs the fingerprint after you
     generate the keystore per CAPACITOR_SETUP.md § 5.1.
  4. **/settings page "Synced across devices when signed in"
     affordance.** Small partner-visibility addition on the
     Sacred-name display preference card — no surface signal today
     that the toggle is doing cross-device work. Voice-gated copy;
     queue for next session.
  5. **S172.9 chapter-pill revision (wife-the-partner feedback).**
     Five-register tabernacle-veil rendering reads visually busy
     at body-text scale; doctrinal density (Exodus 26:31 +
     Matthew 27:51) outpaces small-pill canvas. Future wheel:
     sketch 3-4 revision variants holding different amounts of the
     original five-register intent against the source material;
     walk Yoshi-eye + wife-eye for the call.
  6. **`@capacitor/assets` icon + splash generation** (Track 1d
     handoff). Source files exist (brand-assets/app-icon-*); the
     `cap:assets` script generates the per-density set into the
     native shells. Runs locally after `cap add ios` + `cap add
     android` succeed.
  7. **TestFlight + Play Console submission** (Track 1e handoff).
     Apple Developer account application + Play Console organization
     listing + first signed AAB upload + first TestFlight beta build
     — all Yoshi-hands work; CAPACITOR_SETUP.md § 4 + § 5 has the
     step-by-step.
  8. **Render `.well-known/` route** — Render Static Sites by
     default fall back to /index.html via the SPA rewrite, so the
     `apple-app-site-association` + `assetlinks.json` files would
     get the SPA HTML instead of the JSON content. `hosting/render.
     yaml` needs an explicit route for `/.well-known/*` BEFORE the
     SPA fallback rewrite (same ordering rule as the S171 `/strongs/*`
     redirect). Queue for S174 alongside item 2.

# Standing residuals (carried from S171/S172)

  - 9 long-tail S161 Group B singletons (malachi 4:4, matthew 5:33,
    mark 10:15, philippians 2:2, john 21:7, romans 1:13, ephesians
    2:5, hebrews 11:37, revelation 1:10) — restoration-pipeline.
  - Yahuah → Adonai vocatives addressing Yahusha — restoration-
    pipeline.
  - NT morph residual fuzzy-join — defer recommendation stands per
    S170_NT_MORPH_RESIDUAL_SPEC.md; reopen at first ≥1/week morph-
    data-missing partner complaint.
  - Apocrypha paragraph-heuristic Yoshi-eye revision — defer per
    S171 close; reopen at first ≥1/week non-canon paragraph-
    rendering complaint.
  - V1.2+ per-entry server-side OG image generator for
    `/strongs/{N}/og-image.png`.
  - §28 InterlinearLayer column-stack share — V1.1 stretch.
  - V1.1+ candidates: apocrypha book-slug map, Gesenius source
    investigation, Thayer's 1889 clean dump, system-wide Library →
    Companion lockedTier Literal rename.
  - `@capacitor-community/text-to-speech` plugin for native TTS
    pipeline (BIBLE_APP_ROADMAP.md Phase 9.4) — separate wheel post-
    Capacitor V1.

# Standing efficiency rules (carried + S173 additions)

  - Voice-gate batch pattern for authored content
  - Local files first before web-fetch
  - Self-sufficient application of skill + source
  - Sandbox-git limitation — commits + Render dashboard changes run
    from Yoshi's terminal
  - Spec-then-build
  - Verbal-answers-transcribe to the file before close
  - Render artifacts persist
  - Publish-then-edit
  - **S166** — Service-worker hard-refresh verification at every PWA
    deploy (noted: this codebase doesn't actually register a SW, the
    "PWA" is installable-via-manifest only; cache concerns are
    browser HTTP cache + Render CDN cache only)
  - **S166** — Push verification at every session close (named:
    pushed / committed-not-pushed / edited-not-committed)
  - **S169** — Chrome MCP for live-walk verification
  - **S170** — Shared painter discipline
  - **S171** — Discriminated-union meta discipline
  - **S173 NEW — Strict tsc CI parity.** When introducing new
    dependencies that aren't locally installed AND the project
    tsconfig has `noUnusedLocals: true` / `noUnusedParameters:
    true`, run `npx tsc --noEmit -p . --noUnusedLocals
    --noUnusedParameters` explicitly. Local tsc against unresolved
    dynamic imports behaves differently than CI tsc against the
    installed package types; the explicit flag set catches the
    delta.
  - **S173 NEW — WebSearch-verify package versions before pinning.**
    Never extrapolate a third-party package's version range from a
    sibling package's published version. The Capacitor plugin
    ecosystem in particular has plugins at v3.x while core is v8.x;
    npm install fails fast on an unsatisfiable range and the failure
    surfaces only at CI build time.
  - **S173 NEW — Multi-service deploy disambiguation.** When the
    workspace has multiple Render services with `autoDeploy: true`,
    every push fires deploys for all services. The wrong service's
    "deploy live" event is misleading; verify the service name +
    most-recent SHA before declaring a deploy done.

# What S174 opens against

S174 is the **post-Capacitor-code phone-walk + store-submission
wheel**. Open against:

  1. **Mobile chrome wrap live-verify on both phones** — confirm
     2-3 row pack shape on iPhone Safari + Android Chrome; iterate
     if wrap orphans an awkward button.
  2. **S172 phone-walk redline triage** (Track 2 deferred) —
     Gen 2:4 mask, §17 xref share two-phone, /strongs/G3056 OG
     card.
  3. **Apple Team ID + apple-app-site-association wiring** at
     `bible.remnantofpromise.org/.well-known/` + Render route
     before the SPA fallback rewrite.
  4. **/settings sync affordance copy + paint** — partner-visibility
     for the cross-device sync.
  5. **Cross-device sync live verify** — Phone A flips mask, sign in
     on Phone B, confirm reconcile carries the flipped state.
     Gated on you having run the S173 migration script against prod
     Postgres.

After S174 closes, Capacitor V1 native-shell work (Track 1d-1e
handoff) runs from your Mac: `cap add ios` + `cap add android` +
`cap:assets` + TestFlight + Play Console.
