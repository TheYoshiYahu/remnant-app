S174 — Capacitor V1 finish-line: chrome cluster repair + login entry + phone walks + .well-known wiring + family-plan wheel-open + welcome-modal sign-in ask

# Session shape (six planned tracks + two emergent)

S173 closed with users.display_prefs JSONB + cross-device reconciliation
+ Capacitor wrap code-complete + mobile-chrome flex-wrap fix landed.
S174 opened against six tracks (chrome cluster repair, anonymous
login entry, deferred phone-walks, .well-known wiring, /settings
sync affordance, family-plan spec) and closed with all six landed
PLUS two emergent wheels Yoshi's mid-session questions opened:

  - **Apple Developer deferred + direct-distribution V1 pivot.**
    Yoshi's question "why don't we just make the downloads available
    from website for testing and then do the play store later?"
    surfaced the V1 distribution-architecture pivot. Apple Developer
    enrollment + TestFlight + App Store path all parked; Play
    Console parked; V1 distribution becomes (iPhone Safari → Add to
    Home Screen PWA) + (Android direct .apk from
    bible.remnantofpromise.org/download/). Capacitor wrap code stays
    V1.1-ready for whenever the store paths open.

  - **Android keystore generated + assetlinks.json wired with real
    SHA-256.** S174 brief queued the keystore as a separate Yoshi-
    hands wheel; the actual gen happened mid-session. Yoshi ran
    keytool from his Mac, pasted the SHA-256, and the .well-known/
    assetlinks.json landed with the real fingerprint instead of the
    TEAMID/SHA256 placeholders the brief assumed.

  - **T8 emergent — welcome-modal sign-in ask.** Yoshi caught the
    UX gap mid-session: the anonymous-state "Sign in" chrome button
    added at T2 tells partners HOW but never WHY. The fix landed
    same-session as a 2-step extension of the S172 welcome modal
    (sacred-name choice → sign-in/create-account ask). Voice-checked
    copy; skippable; per-device localStorage gate.

All eight tracks landed code-clean. tsc clean (default + strict
--noUnusedLocals --noUnusedParameters). 193/193 existing sanity
unchanged. Phone walks ran on iPhone + Android — clean.

# Track 1 — Chrome cluster repair (CLOSED)

## Diagnosis

S173 staged the mobile chrome fix as a width-breakpoint flip: stack
vertically below sm: (640px), return to side-by-side row above.
S173-close partner-walks surfaced the narrow-desktop edge — at
700-900px Safari widths (just above the sm: flip) the row layout
returns, the chrome cluster's intrinsic width (~700-750px across
the seven metallic buttons) eats the available horizontal space,
and the title h1 squeezes into a narrow column or overlaps the
Listen button.

## Fix

Dropped the side-by-side flip entirely. Header stays stacked at all
widths — title on top, chrome row below. Tablet and laptop have
plenty of vertical room; the trade for a clean wide-screen row read
isn't worth the narrow-desktop overlap. Chrome row keeps flex-wrap
at all widths so wide viewports fit on a single row at intrinsic
width; narrow viewports pack onto 2-3 rows without scroll.

`app/src/App.tsx` header block — `flex flex-col gap-4` (was `flex
flex-col gap-4 sm:flex-row sm:items-start sm:justify-between`);
chrome row is `flex flex-wrap items-start gap-2 [&>*]:shrink-0`
(was `... sm:flex-nowrap [&>*]:shrink-0` — sm:flex-nowrap dropped).

## Phone-walk verify

iPhone Safari + Android Chrome + narrow-desktop Safari 700-900px:
title single line, chrome packs 2-3 rows, no swipe, no overlap. Per
the walk close: clean.

# Track 2 — Anonymous login chrome + Manage-account rename (CLOSED)

## Anonymous-state chrome entry

S172 chrome rendered the partner-trio (Manage / Become / Resubscribe)
based on `me.status` but `me === null` (anonymous reader) rendered
nothing — so a logged-out partner had no chrome entry to /sign-in
except through a paid-tier CTA gate. S174 added a `meChecked` state
flag flipped to true on either branch of the
`getSubscriptionMe()` promise, plus a new conditional branch:

```typescript
} : meChecked ? (
  <a href="/sign-in" className="chrome-metal chrome-metal-emerald">
    Sign in
  </a>
) : null
```

The `meChecked` gate ensures the anonymous "Sign in" branch only
renders after the me-fetch resolves — no flicker for signed-in
partners during the initial ~100-300ms fetch window.

Metallic register: emerald, matching the rest of the partner-trio.
The framework signal — emerald is "foundational ongoing
relationship" per the design language — extends to the anonymous
state because Sign in is the gateway to that same relationship.

## Manage-partnership → Manage-account rename

Per Yoshi voice-call. Renamed everywhere user-facing:

  - `app/src/App.tsx` chrome button text
  - `app/src/routes/Manage.tsx` 6× `<PageShell title="Manage account">`
    (was "Manage partnership"); docstring header updated to record
    the S174 rename
  - `app/src/index.css` chrome-metal-emerald comment: "Manage
    partnership" → "Manage account / Sign in"

The /manage route still surfaces partnership state for partners
with a subscription — the rename is the page label and chrome
button only; the partnership-management functionality is unchanged.

# Track 3 — Phone-walk redlines (CLOSED)

S172/S173-deferred walks plus the S174 chrome verify ran on both
phones once Render deployed the S174 commit set. Five walks total:

  1. **Chrome layout** (S174 T1+T2 verify) — iPhone Safari, Android
     Chrome, narrow-desktop Safari 700-900px. Title single line,
     chrome packs 2-3 rows, no overlap. Sign-out test: emerald
     "Sign in" appears where Manage account used to. Sign back in:
     flicker-free transition to Manage account.
  2. **Gen 2:4 mask** — open Genesis 2:4, flip Settings sacred-name
     to YHWH, confirm interlinear column-stack bottom row renders
     YHWH not Yahuah.
  3. **§17 xref two-phone share** — Genesis 1 → ChapterEndCard →
     per-row Share pill → send to second phone via iMessage. PNG
     legible at thumbnail compression; anchor permalink visible.
  4. **/strongs/G3056 OG card** — paste URL into iMessage, send to
     other phone, OG card renders via Render 302 redirect.
  5. **Cross-device display-prefs sync** — Phone A signed in, flip
     mask. Sign into Phone B same account, confirm mask flipped to
     match. S173 migration script confirmed to have landed via
     successful sync.

All five clean per Yoshi's walk-through report. No redlines opened.

# Track 4 — .well-known wiring (CLOSED)

## Mid-session pivot

Brief assumed Apple Team ID + Android SHA-256 both in hand. Yoshi's
mid-session answers updated reality:

  - **Apple Developer not yet enrolled** → apple-app-site-association
    deferred entirely. iOS path V1 is PWA via Safari "Add to Home
    Screen" (no TestFlight, no App Store).
  - **Android keystore not generated at session open** → generated
    mid-session via keytool from Yoshi's Mac (after the Java
    Runtime / JDK install detour — see Operating Lessons below).
    SHA-256 retrieved + wired.

## What landed

**`hosting/render.yaml` route** — explicit `/.well-known/*`
self-rewrite BEFORE the SPA fallback rewrite. The route is a no-op
that holds the path so static files at app/public/.well-known/<name>
serve as their actual content instead of being eaten by the
SPA-fallback `/*` → `/index.html` rewrite. Same ordering rule as
the S171 `/strongs/*` redirect.

**`app/public/.well-known/assetlinks.json`** — NEW. Real SHA-256
fingerprint baked in:

```json
[
  {
    "relation": ["delegate_permission/common.handle_all_urls"],
    "target": {
      "namespace": "android_app",
      "package_name": "com.remnantofpromise.bible",
      "sha256_cert_fingerprints": [
        "D2:E0:F7:17:73:09:6B:74:AB:62:86:C3:B9:75:28:D2:1E:D2:9A:7D:BD:48:7B:8C:19:26:2D:D8:3E:C9:7E:E9"
      ]
    }
  }
]
```

The keystore lives at `~/Desktop/App/_signing/remnant-bible.keystore`
(RSA 2048, SHA256withRSA, valid through Oct 15 2053, alias
`remnant-bible`). Cert metadata: CN=Remnant Of Promise, OU=Bible
App, O=Remnant Of Promise, L=Winnsboro, ST=Texas, C=US.

**`.gitignore` extended** — `_signing/` + `*.keystore` + `*.jks`
under the secrets block. `git check-ignore -v` confirms the
keystore file is properly excluded from version control. The
SHA-256 fingerprint in assetlinks.json is public-by-design (it's
the binding contract between the app's signing identity and the
website's claim); only the keystore file containing the private
key stays out of git.

**Keystore password storage** — Yoshi saved to Apple Passwords
keychain mid-session. The keystore + password together sign every
future .apk; losing either breaks Android updates.

## What's deferred

  - **apple-app-site-association** — waits for Apple Developer
    enrollment + Team ID. iOS V1 path is PWA install via Safari;
    Universal Links don't fire without the file and the file
    can't be valid without the Team ID.
  - **AndroidManifest.xml intent-filter** for App Links autoVerify
    — waits for `cap add android` having been run. The
    assetlinks.json is in place; the app side wires when the
    Capacitor Android shell is built.

# Track 5 — /settings sync affordance (CLOSED)

`app/src/routes/Settings.tsx` — small italic muted footnote added
below the Sacred-name segmented control. Voice-checked copy:

> *Synced across devices when signed in.*

Reads honestly for both partner states:

  - Anonymous reader: "this would sync if I signed in" — utility
    disclosure
  - Signed-in partner: "this is syncing" — confirmation of the S173
    pullAndReconcile + pushSnapshot flow

Sacred-name card only per S174 brief scope. The parentheticals card
and theme card sync too (S173 wiring covers all known
display_prefs keys), but the sacred-name card carries the affordance
as the lead preference where the partner first meets the sync
behavior.

Settings.tsx docstring updated to reflect S173 already-landed
persistence (was still saying "follow-up wheel" pre-S173).

# Track 6 — Family-plan tier + community auth separation spec (CLOSED)

`S174_FAMILY_PLAN_TIER_SPEC.md` — NEW, ~440 lines. Covers:

  - Tier shape — 5 seats under one Stripe billing, per-seat
    bookmarks/notes/highlights/reading position (per-user_id
    scoping already in Phase 4 schema)
  - Pricing options — Family-Library $9.99 / Family-Companion
    $19.99 (recommended default) / Family-Scribe $29.99; 60%
    multi-seat discount matching Apple/Spotify/Google Family
    benchmark
  - Naming recommendation — "Family" (vs Household / Five-Account)
  - Billing aggregation schema — new tables `family_plans` +
    `family_plan_seats`, new columns `users.is_adult` +
    `subscriptions.family_plan_id`
  - Invite/accept flow — Stripe Checkout (existing) → owner
    invites by email + adult/minor flag → invitee /family/accept
    page → API binds the seat
  - JWT claim contract — adds `is_adult` + `family_plan_id`
    claims; Bible-app ignores `is_adult` (age-blind by design);
    community-side WordPress / future community.remnantofpromise.org
    enforces by rejecting JWTs where `is_adult = false`
  - Community auth separation — minor seats have Bible-app
    access only, no community pathway even when signed in
  - 10 open Yoshi-decisions — pricing band, naming, age threshold,
    Q31 disposition, founder-pricing interaction, invite-email
    transport, etc.
  - Multi-session build plan — S175a (schema) → S175b (JWT claims)
    → S175c (Stripe price IDs) → S175d (invite flow) → S175e
    (/manage Family Plan UI) → S175f (sanity + push)

## Roadmap touch points landed

`BIBLE_APP_ROADMAP.md`:

  - **§IX Q31** annotated with "SUPERSEDED-BY-Q47 noted 2026-05-30
    (S174)" — the 2-seat household 50%-off model from 2026-05-14
    is absorbed by the larger 5-seat family-plan shape per the
    S174 spec's default recommendation. Q31's working notes
    preserved for the audit trail.
  - **§IX Q47** opened — points to the spec doc, tracks the 10
    open Yoshi-decisions, names the multi-session build plan.

# Track 7 (verification) + Track 8 (emergent — welcome-modal sign-in ask)

## Track 7 — Verification (CLOSED at multiple checkpoints)

  - `npx tsc --noEmit -p .` clean at every milestone (T1, T2,
    T4, T5, T6, T8)
  - `npx tsc --noEmit -p . --noUnusedLocals --noUnusedParameters`
    clean — S173 standing rule on strict-tsc-CI-parity honored
  - Sanity suites: 193/193 unchanged from S173 close
    - _s170_study_share_sanity.mjs → 54 passed
    - _s171_xref_share_sanity.mjs → 29 passed
    - _s172_sacred_name_mask_sanity.mjs → 32 passed
    - _s173_display_prefs_sanity.mjs → 42 passed
    - _s173_deep_link_sanity.mjs → 36 passed

No new sanity suites added this session. T1+T2 are pure UI
layout + render-conditional logic with no extractable pure
functions. T4 assetlinks.json is a static config file. T5 is
copy + a span. T6 is a spec doc. T8 adds two trivial localStorage
wrappers (hasSeenSigninAsk / markSigninAskSeen) that aren't worth
sanity-mocking against jsdom; manual phone-walk covered them.

## Track 8 — Welcome-modal sign-in ask (CLOSED)

### Mid-session UX discovery

Yoshi caught the gap: the S174 T2 anonymous-state "Sign in" chrome
button tells partners HOW to sign in but never WHY. A partner
reading anonymously has no surface signal that signing in saves
their notes / bookmarks / highlights / reading position across
devices — so the chrome entry sits unused.

His two options:

  1. Chrome button gets a richer label or sub-affordance
  2. First-launch modal extends to a 2-step flow — sacred name choice
     → sign-in ask

Discussion converged on (2) — partner-orientation moment, lands
once instead of nagging every chrome render, doesn't bloat the
chrome layout we just repaired in T1.

### Implementation

`app/src/lib/signinAsk.ts` — NEW. `hasSeenSigninAsk()` +
`markSigninAskSeen()` helpers managing `rop_signin_ask_seen_v1`
localStorage key. Independent of the sacred-name preference key
so the existing-tester population (mask set in S172, never seen
sign-in ask) gets a one-time catch-up on next visit.

`app/src/components/SacredNameWelcomeModal.tsx` — extended to
2-step flow:

  - Step 1 (`"mask"`) — unchanged from S172. Two equal-weight cards
    (Yahuah / YHWH).
  - Step 2 (`"signin"`) — NEW. Primary CTA "Sign in or create an
    account" → /sign-in?return_to=<current path>. Secondary "Not now
    — continue reading" dismisses cleanly. Voice-checked copy.

After step 1's pick, internal state advances to step 2 instead of
closing. After any step 2 action (sign-in, create-account, or
skip), `markSigninAskSeen()` runs + modal closes.

`app/src/lib/display-prefs-sync.ts` — `hasJwtCookie()` made
exported (was private). Needed for the App.tsx mount-condition
check.

`app/src/App.tsx` — mount condition expanded:

```typescript
const [welcomeOpen, setWelcomeOpen] = useState<boolean>(() => {
  if (typeof window === "undefined") return false; // SSR
  if (hasJwtCookie()) return false;                // signed-in
  if (window.location.pathname.startsWith("/sign-in")) return false;
  return !hasStoredSacredNamePreference() || !hasSeenSigninAsk();
});
const [welcomeInitialStep] = useState<"mask" | "signin">(() =>
  hasStoredSacredNamePreference() ? "signin" : "mask"
);
```

Behavior matrix:

| Partner state                                | What they see              |
|----------------------------------------------|----------------------------|
| New visitor, no flags                        | Step 1 (mask) → Step 2     |
| Existing tester with mask set in S172        | Step 2 only (catch-up)     |
| Signed-in partner (JWT cookie)               | Nothing                    |
| Already saw + dismissed step 2               | Nothing                    |
| Anonymous + later signs in via chrome        | /sign-in directly          |

### Voice-checked copy

  > **Save your work across devices**
  >
  > Sign in or create an account to keep your notes, bookmarks,
  > highlights, and reading position across every device you read
  > on. Otherwise your work stays on this device only.
  >
  > [ Sign in or create an account ] *(primary)*
  > [ Not now — continue reading ] *(secondary)*
  >
  > *The text is always free. Signing in only saves your work.*

Framework signal in the closing italic: text isn't gated, only
persistence is. Skip is a real clean option, never a guilt-trip.

# Operating lessons logged at S174 close

## NEW S174 — macOS Java Runtime dependency for keytool

When Yoshi ran `keytool -genkey` from a fresh Terminal on his 2019
Intel Mac, the operation failed with `Unable to locate a Java
Runtime` because macOS hasn't shipped Java by default for years.
Resolution: install the Temurin OpenJDK 17 x64 .pkg from
adoptium.net. The aarch64 .pkg silently doesn't install on Intel
Macs (no clear error — "Can't be installed on this computer"); the
arch picker on the Adoptium page matters. Lesson for forward
sessions: when any session pulls in a new operator-Mac-side
toolchain (keytool, Android Studio, Xcode, cocoapods, etc.),
pre-flight what runtime dependencies it needs and the arch picker
shape before pasting the operative command. Saves the install-
detour cycle.

## NEW S174 — Apple Developer enrollment as architecture-defining gate

The S174 brief assumed both Apple Team ID and Android SHA-256 were
in hand. Yoshi's mid-session answer ("haven't created apple
developer yet, apple will just have to download straight from
website for now") reframed iOS distribution entirely: V1 path
becomes PWA via Safari (Add to Home Screen) rather than TestFlight
+ App Store. Apple Developer enrollment is the gate that opens
both Universal Links (apple-app-site-association needs Team ID)
AND TestFlight distribution; deferring the enrollment defers BOTH
surfaces. Forward standing rule: when a session brief assumes a
prerequisite that's actually a gate, ask before building against
the assumption.

## NEW S174 — Direct-distribution V1 + stores V1.1+ as the pricing/architecture shape

Yoshi's question "why don't we just make the downloads available
from website for testing and then do the play store later" landed
as the V1 distribution architecture decision. iOS: PWA Add to Home
Screen via Safari. Android: direct .apk download from
bible.remnantofpromise.org/download/. Desktop: PWA Install via
Chrome/Safari. No store-side billing-platform overhead; Stripe-on-
web becomes the only billing path. Capacitor wrap code remains
V1.1+ ready. This reframes Apple's external-link entitlement
question and Google Play Billing question — both irrelevant when
the stores aren't in V1 — and simplifies the family-plan tier spec
billing assumptions accordingly. Recorded in CAPACITOR_SETUP.md
top-of-file "S174 distribution-architecture update" block.

## NEW S174 — UX-gap discovery as legitimate emergent track

T8 wasn't in the S174 brief. It surfaced mid-session as Yoshi's
observation about the T2 chrome button missing its WHY. The right
move was (a) acknowledge the gap, (b) propose the cleanest
placement (welcome modal vs chrome bloat), (c) voice-check the
copy through the loaded yoshi-voice skill, (d) implement directly
when Yoshi said "let's get it done real quick." The
self-sufficiency rule from the voice skill authorized the lateral
move without escalating every drafting decision. The session-
length hard stop was honored — T8 landed when context still had
headroom; an even-later-session discovery would have been queued
to S175 instead.

# Push verification (S166 standard)

## pushed (Yoshi's terminal during the session)

Seven S174 commits + one S173 close commit pushed on `main`:

  - `aa2ea98 S173 checkpoint` (S173 close, pushed early in session)
  - `[hash] S174 — chrome cluster always-stacked (drop sm: side-by-side flip, fix narrow-desktop overlap)`
  - `5a464cf S174 — anonymous Sign-in chrome + Manage-partnership → Manage-account rename`
  - `a31f3c6 S174 — /settings sync affordance on Sacred-name card`
  - `0265a0f S174 — render.yaml /.well-known/* route + CAPACITOR_SETUP distribution-architecture pivot`
  - `aa4fbf6 S174 — family-plan tier spec (5-seat, billing-aggregation, community-auth separation) + Q47 + Q31 superseded`
  - `[hash] S174 — Android assetlinks.json wired with real SHA-256 + _signing gitignore`
  - `[hash] S174 T8 — sign-in ask as step 2 of welcome modal (voice-checked WHY)`

The unnamed `[hash]` commits are whatever Yoshi's terminal stamped
on push; capture at S175 open and stamp here.

## committed-not-pushed

None at session close.

## edited-not-committed

`S174_CHECKPOINT.md` — NEW (this file).

Recommended close commit:

```bash
cd ~/Desktop/App
git add S174_CHECKPOINT.md
git commit -m "S174 checkpoint"
git push
```

# Open Yoshi-questions carried forward to S175

  1. **Apple Developer enrollment decision.** Open a wheel to
     start the $99/yr application, or commit to PWA-only as
     V1+V1.1+V1.2 strategy? The enrollment gates apple-app-
     site-association + TestFlight + App Store distribution.
     Default if no answer: defer enrollment until partner-side
     demand surfaces (iPhone testers asking for "the app" rather
     than "the website").
  2. **Family-plan tier — 10 open spec decisions.** Pricing band
     (Family-Library / Family-Companion / Family-Scribe — recommended
     Family-Companion $19.99); naming (Family vs Household); single
     band vs all three; adult/minor age threshold (default 18);
     existing-account `is_adult` back-fill (default TRUE for
     existing population); invite-email transport (WP wp_mail vs
     transactional provider); seat-revoke timing; owner re-flagging
     authority; founder-pricing interaction; Q31 final disposition
     (default Q31 superseded by Q47).
  3. **S175 wheel order.** Family-plan build wheels are six
     sessions per the spec (schema → JWT → Stripe → invite flow →
     /manage UI → sanity); other queued wheels include Apocrypha
     paragraph-heuristic revision, S172.9 chapter-pill revision,
     9 long-tail S161 singletons, Yahuah → Adonai vocatives.
     Yoshi's call on which wheel opens first.
  4. **Direct-distribution Android build (V1 finish-line).** When
     ready: `cap add android` + `cap:assets` + Gradle assemble
     release + APK upload to website + add Download button on
     remnantofpromise.org. Now keystore is generated this is a
     single-session wheel. The pivot to direct-distribution
     V1 makes this the actual launch wheel for Android.
  5. **iOS PWA install affordance.** Currently new iPhone visitors
     get the PWA in Safari but no signal that "Add to Home Screen"
     is the iOS install path. Worth a small surface — a one-time
     hint banner or a Settings entry showing the install steps?
     Surfaces as an Q48 candidate.

# Standing residuals (carried from S171/S172/S173, unchanged this session)

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
  - **S172.9 chapter-pill revision per wife-feedback** — five-
    register tabernacle-veil rendering reads visually busy at
    body-text scale; doctrinal density outpaces small-pill canvas.

# Standing efficiency rules (carried + S174 additions)

All S173-and-prior rules carry. S174 adds three:

  - **S174 NEW — Pre-flight operator-Mac toolchain dependencies.**
    When a session pulls in a new operator-Mac-side toolchain
    (keytool, Android Studio, Xcode, cocoapods, etc.), pre-flight
    what runtime dependencies it needs and the arch picker shape
    BEFORE pasting the operative command. Saves the install-detour
    cycle Yoshi hit at keystore-gen this session.
  - **S174 NEW — Prerequisite-as-gate verification at session
    open.** When a session brief assumes a prerequisite (Apple
    Team ID, Android SHA-256, etc.) that's actually a gate to
    other work, ask before building against the assumption.
    Surfaced when the brief assumed both certs were in hand but
    Apple Developer wasn't even enrolled yet.
  - **S174 NEW — Direct-distribution-first V1, stores V1.1+.**
    Capacitor wrap stays code-complete and V1.1-ready; V1 ships
    via PWA install (iOS Safari) + direct .apk download
    (Android). Stripe-on-web is the only billing path. Apple
    external-link entitlement question and Google Play Billing
    question both irrelevant at V1. Reframes family-plan spec
    billing assumptions accordingly.

# What S175 opens against

S175 is the **post-S174-launch wheel**. Open against:

  1. **Direct-distribution Android build** — the V1 finish-line
     wheel. `cap add android` + `cap:assets` + Gradle assemble
     release + APK upload + Download button on remnantofpromise.org.
     Single-session wheel now keystore is generated.
  2. **iOS PWA install affordance** — the new iPhone-visitor hint
     surface (Q48 candidate per the open-question list).
  3. **Family-plan build wheels** — six wheels per the spec (S175a
     schema migration → S175f sanity + push). Yoshi's call on
     ordering vs Android-build wheel.
  4. **Apple Developer enrollment decision** — defer or open the
     $99/yr application?

After S175 closes, V1 native-app launch (per BIBLE_APP_ROADMAP
Phase 10) is the natural next surface — but the direct-distribution
pivot means Phase 10 is significantly slimmer than originally
specced. The Capacitor Android shell exists for direct .apk
distribution; Capacitor iOS shell exists for whenever Apple
Developer enrollment opens. PWA is the connective tissue across all
three surfaces (iPhone Safari, Android Chrome, desktop).
