# S209 — App Store: account enrollment + iOS shell (operator: Yoshi)

Two tracks. Track A (account) is yours alone — Claude cannot create
accounts, enter passwords, or handle payment. Track B (build prep)
needs no account and can run in parallel.

## TRACK A — Apple Developer account (Yoshi, by hand)

### A0. Confirm the right tool is installed
For iOS you need **Xcode** (Mac App Store, free, ~12 GB). If "the
studio" you downloaded is Android Studio, that's the Android one —
grab Xcode too. After install, open it once and let it add the iOS
components. Check: `xcodebuild -version` in Terminal.

### A1. Apple ID for the org
Use info@remnantofpromise.org (keeps the imprint architecture clean —
Remnant of Promise owns the store accounts). Enable two-factor
authentication — enrollment requires it. appleid.apple.com.

### A2. D-U-N-S number — FOUND (S209): 145570661
The nonprofit already has a D-U-N-S, registered with Dun & Bradstreet
and verified through the Play Console org setup (visible at Play
Console → Developer account → Account details → Organization details):
- **D-U-N-S: 145570661**
- Organization name: **Remnant of Promise**
- Address: **393 County Road 3987, Winnsboro, TX 75494-5862, US**
Use the name + address EXACTLY as above in Apple enrollment — that is
what D&B has on file. No D-U-N-S wait applies; enrollment can proceed
immediately.

### A3. Enroll as ORGANIZATION — DECISION MADE (S208): pay the 99 USD now
Yoshi confirmed: state-incorporated nonprofit + EIN, but NO IRS
determination letter (never filed Form 1023 — common for ministries;
automatically exempt but unrecognized on paper). Therefore:
- Enroll and pay the 99 USD/yr now; do NOT request the waiver this
  round (waiver review wants IRS recognition; no refunds if denied).
- LATER: if/when a Form 1023 determination letter exists, request the
  fee waiver before a renewal date via
  https://developer.apple.com/contact/membership-fee-waiver/ —
  renewals then become free. (Churches/ministries must file the full
  1023, $600 + months; the $275 1023-EZ excludes churches.)
- D-U-N-S registration must match the STATE-registered legal name and
  registered address exactly — use the articles of incorporation as
  the source of truth.

ORIGINAL WAIVER NOTES (kept for the later request):
https://developer.apple.com/programs/enroll/ — sign in with the org
Apple ID, choose **Organization** (not Individual).
- You enroll as Account Holder; founder/executive = legal authority ✓
- **Select the fee-waiver request during enrollment.** Eligibility
  (verified June 2026, developer.apple.com/help/account/membership/fee-waivers/):
  - legal nonprofit recognized by the IRS ✓ (501(c)(3))
  - not an individual/sole proprietor ✓
  - must NOT sign the Paid Applications Agreement (we never will —
    consumption-only store posture, no Apple IAP) ✓
  - must not "sell digital goods or services through any of your
    apps" — the shell sells nothing in-app; partner tiers are managed
    on the web. Same Kindle posture as the Play build. If Apple reads
    web-sold tiers as disqualifying, worst case: waiver denied, pay
    the 99 USD/yr. No refunds either way, so request the waiver
    BEFORE paying anything.
- Have the IRS determination letter handy; Apple may ask for docs and
  may phone to verify.
- Timeline: D-U-N-S (0–12 days) + enrollment verification (1–7 days).

### A4. After approval
- App Store Connect opens up (appstoreconnect.apple.com).
- Do NOT sign the Paid Applications Agreement (Schedules 2/3) — it
  would void the fee waiver and we don't use IAP.

## TRACK B — iOS shell prep (no account needed; Mac paste-blocks)

CAPACITOR_SETUP.md §§1–4 already maps this; condensed:

### B1. Scaffold the iOS project
```
cd ~/Desktop/App/app
npx cap add ios
npx cap sync ios
```

### B2. Icons + splash (sources already in brand-assets/)
```
cd ~/Desktop/App/app
mkdir -p assets
cp ../brand-assets/app-icon-ios-1024x1024.png assets/icon.png
cp ../brand-assets/splash-2732x2732.png       assets/splash.png   # per CAPACITOR_SETUP.md §2
npx capacitor-assets generate --ios
```

### B3. Universal Links
- Deploy `/.well-known/apple-app-site-association` per
  CAPACITOR_SETUP.md §3 (appID = TEAMID.com.remnantofpromise.bible —
  TEAMID exists only after Track A completes).
- Xcode → Signing & Capabilities → Associated Domains →
  `applinks:bible.remnantofpromise.org`.

### B4. Verify the consumption-only gate in the shell
The Pricing gate (S206) detects the Capacitor bridge — same code path
covers iOS. On-device check after first TestFlight install: Become a
partner page shows tiers, no prices/Subscribe.

## TRACK C — after the account exists (next session)
1. Register App ID `com.remnantofpromise.bible` (match
   capacitor.config.ts appId).
2. App Store Connect → New App → "Remnant of Promise Study Bible",
   iOS, en-US.
3. Xcode: set Team, auto-signing → Product → Archive → Distribute →
   TestFlight internal testing.
4. App Review prep: reuse Play listing copy (voice-gated, in
   S206_PLAY_SUBMISSION_RUNBOOK.md); reviewer sign-in = the comped
   texas account; declare account-based restricted functionality.
5. Screenshots: Apple requires different sizes (6.9" = 1320×2868 or
   1290×2796; 6.5" = 1284×2778/1242×2688). The S208 collage script
   (outputs/build_collages.py pattern) can be re-run at Apple sizes —
   ask Claude.
6. Privacy nutrition labels: mirror the Play data-safety answers
   (email, user IDs, purchase history, UGC; none shared; deletion
   URL https://remnantofpromise.org/privacy-policy/).
7. External-link / billing posture: consumption-only, identical to
   Play. No reader entitlement needed if nothing is sold in-app.

## S209 session log (running)
- DECISION (Yoshi, S209): enrolling with his PERSONAL Apple ID as the
  Account Holder, not a new info@remnantofpromise.org Apple Account
  (org-email account creation kept failing at the identity step; "I'm
  taking my chances"). Enrollment type is still ORGANIZATION — that's
  the unbendable line; seller name comes from the D-U-N-S/legal
  entity, and Apple support can transfer the Account Holder role on
  org memberships later if it ever needs to move to the org email.
- Mac web enrollment ID-verification (driver's license camera) failed
  ~10 attempts; no upload option exists. Path switched to the Apple
  Developer app on iPhone (native camera ID capture; same Apple ID;
  complete the entire enrollment on the same device).
- D-U-N-S found: 145570661 (see A2) — pulled from Play Console org
  details, so the D-U-N-S long-pole is gone.
- ENROLLMENT STATE AT S209 CLOSE — BLOCKED on the personal Apple ID:
  - iPhone app enrollment got through ID verification (DL scan
    passed) and the full org form, then a form glitch ("Complete the
    following fields: legalContact,lgEmail" with every visible field
    green-checked) → retype attempt → email re-verification tripped a
    LOCKOUT on the personal Apple ID. Support message sent (response
    quoted as a few days).
  - Mac web enrollment ID capture eventually PASSED (trick: flashlight
    on the license to balance glare) but the account-level block still
    stops the flow past verification.
  - Enrollment form answers (all entered, for fast re-entry):
    org enrollment, D-U-N-S 145570661, Remnant of Promise,
    393 County Road 3987 Winnsboro TX 75494-5862, website
    remnantofpromise.org, org phone +1 430 260 9988, Tax ID/EIN
    421878892, work email info@remnantofpromise.org (verified),
    Signing Authority = yes (Account Holder), verification contact =
    Edith Pack, Secretary, christywpack2019@gmail.com,
    +1 864 494 2319. Fee waiver OFF. Cost shown $98.99/yr.
  - ESCALATION (late S209): option (c) was attempted same-night — a
    fresh Apple Account WAS created on info@remnantofpromise.org
    (confirmed beforehand it was not attached to the personal Apple
    ID) and it got LOCKED immediately too. Apple's fraud system
    evidently linked the accounts (same device + same 2FA phone
    number + multiple verification runs in one evening). BOTH
    accounts locked at S209 close. DO NOT retry the same night ever
    again — each attempt deepens the auto-lock.
  - NEXT-SESSION UNLOCK PATH (in order): (a) iforgot.apple.com for
    each account — with the verified phone the unlock can clear fast
    after the cooldown; (b) Apple Developer Support phone, Mon-Fri,
    1-800-633-2152 — one call can clear the locks AND walk the org
    enrollment; reference the support case already filed from the
    iPhone app. (c) Only after an account is unlocked: enroll on the
    iPhone app (camera passed DL first try; flashlight trick for
    glare), complete entire enrollment on that one device.
  - Verification-contact guidance (locked): a real second person at
    the org (TX nonprofits have ≥3 directors on the articles); wife
    serving in the ministry qualifies; never list an email that
    resolves back to the enrolling person.
- Track B remaining at close: Xcode simulator build (⌘B on an iPhone
  Simulator destination) not yet confirmed. Shell scaffolded, icons +
  splash generated (87 android / 10 ios / 7 pwa assets), project
  opens in Xcode, iOS 26.5 SDK installed.
- S209 push landed (ed2b609..475ff35): assetlinks 2nd fingerprint,
  AASA + render.yaml MIME rule, Kingdom-above-Witness, Apple
  screenshots, this runbook. Render auto-deploy fired.
- Play: notification "App update published" — OPEN TESTING live to
  anyone via opt-in link.
- PRODUCTION SUBMITTED (late S209, Yoshi's explicit call — skipped
  the S206 §10 walk-first plan): production release created from
  bundle 12 (1.1.1) via Add-from-library, release notes "First
  public release. The complete 66-book canon with the sacred names
  restored — free, no ads, no tracking.", countries = all 177,
  SENT FOR REVIEW (3 changes: production release + full rollout +
  countries). Managed publishing OFF → publishes automatically on
  approval → app becomes publicly searchable on Play. Only release
  warning was the benign missing-deobfuscation-file one.
- NOTE for next session: the OPEN TESTING track showed "This track
  is paused / Inactive" at S209 close — investigate after the
  production verdict (likely irrelevant once production is live).
- S206 §10 on-device walk: still worth doing immediately after
  production publishes (or now from the open-testing install) —
  pricing surface in shell, deep link, native share, cold launch.
- PLAY REVIEW: **APPROVED + PUBLISHED** (Console notification Jun 7:
  "App update published"). All 11 S208 changes live; open testing
  release 12 (1.1.1) published; Publishing overview queue empty.
- Play App Signing key SHA-256 (from Console → App signing, pulled
  from the DOM — the visible box truncates the last byte):
  `23:66:B7:3B:32:E4:45:4A:DB:4B:9B:8B:9B:EC:26:23:A4:6E:63:89:AF:FC:EF:6A:55:A5:3A:80:55:B3:61:CE`
  Added as second entry in `app/public/.well-known/assetlinks.json`
  (upload-key D2:E0:F7:... kept). Validated JSON + 32-byte count.
  Goes live on next push (Render auto-deploy).
- Remaining Play follow-up: S206 §10 on-device walk on a
  Play-installed build, after the push lands.
- Xcode first-run: `xcodebuild -version` failed with the
  CommandLineTools active-developer-directory error. Fix applied by
  Yoshi: `sudo xcode-select -s /Applications/Xcode.app/Contents/Developer`
  + `sudo xcodebuild -license accept` + `xcodebuild -runFirstLaunch`.
- B3 partially landed: `app/public/.well-known/apple-app-site-association`
  written (TEAMID placeholder — swap in the real Team ID from App
  Store Connect → Membership after enrollment clears, then redeploy).
  `hosting/render.yaml` got a Content-Type: application/json header
  rule for the extension-less AASA path (the S174 .well-known route
  only held the path; it couldn't fix the MIME type).
- UI detour (Yoshi, in-session): the Kingdom toggle moved ABOVE the
  Witness toggle in the reader chrome stack (App.tsx) so the Witness
  style row sits directly under its own pill. tsc clean. Ships with
  the next web push.
- Apple screenshot rebuild: S208's build_collages.py was not on disk
  (lived in the S208 session scratchpad — lesson: commit build
  scripts to the repo). Rebuilt by reverse-engineering the 8 final
  1080×1920 assets: collages = serif two-line banner + center phone
  at ~0.52 scale (front, framed) + two dimmed side panels behind;
  singles = banner + one large framed phone. Panel→source mapping
  recovered by interior-band template matching (cv2, TM_CCOEFF_NORMED
  on a 700px interior strip — full-frame matching fails on the
  rounded corners/dimming; band matching scores >0.95 on true pairs).
  New builder committed at `appstore-screenshots/build_appstore_collages.py`;
  outputs at `appstore-screenshots/final/69/` (1290×2796, 6.9") and
  `appstore-screenshots/final/65/` (1242×2688, 6.5") — 8 assets each,
  same names/banners as the Play set. All 16 sources used exactly
  once; every panel/source pair verified by band match. Android
  status bar (72px) + gesture bar (132px) cropped from every panel so
  no Android chrome appears in App Store assets. Verified mapping
  (L/C/R): 01 = 015985/015996/015998 · 02 = 016000/016002/016006 ·
  03 = 015976/015980/015978 · 04 = 015982/016004/016008 · singles:
  05 = 016012, 06 = 016010, 07 = 015974, 08 = light-mode Screenshot.

## State at S208 close (context)
- Play: all 11 changes SENT FOR REVIEW (open testing release 12
  (1.1.1), full store listing w/ 8 screenshot assets, all content
  declarations incl. advertising-ID = No). Typical review ≤ 7 days.
- Queued post-approval: assetlinks second fingerprint (Play App
  Signing SHA-256), on-device walk.
