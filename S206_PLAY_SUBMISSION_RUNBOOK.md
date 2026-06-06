# S206 — Play internal testing runbook (operator: Yoshi)

One job: the app on the Play INTERNAL TESTING track, installed on your
phone. Work through the steps in order. Terminal blocks are commands
only — paste whole blocks.

## State found at session open (verified)

- Keystore EXISTS: `~/Desktop/App/_signing/remnant-bible.keystore`
  (S174; alias `remnant-bible`; password in Apple Passwords).
- Android shell EXISTS and has been built before: signing config
  wired to env vars, icons/splash generated, App Links intent-filters
  in the manifest, feature graphic + 512px icon in brand-assets.
- targetSdk 36 — already satisfies the current Play requirement
  (API 35 now; API 36 required from 2026-08-31). No change needed.
- versionCode bumped this session 10 → 11 (versionName 1.1.0) so the
  Play install updates over the direct-APK build already on your phone.
- Shell gating LANDED this session in `app/src/routes/Pricing.tsx`
  (see S206 section in the spec). `tsc -b` exit 0.
- Privacy policy page CREATED this session:
  `~/Desktop/Website/static-site/privacy.html` — must be published
  before the Play data-safety form is submitted (Step 2).

## Step 1 — Back up the keystore (FIRST, before anything else)

```
cd ~/Desktop/App
cp _signing/remnant-bible.keystore ~/Documents/remnant-bible-keystore-backup.keystore
shasum -a 256 _signing/remnant-bible.keystore ~/Documents/remnant-bible-keystore-backup.keystore
```

The two checksums must match. Then copy
`remnant-bible-keystore-backup.keystore` to at least one place that
is not this Mac — iCloud Drive or a USB stick — and confirm the
keystore password is still in Apple Passwords. Losing this file +
password after the Play listing exists means no app updates ever
again.

## Step 2 — ✅ DONE LIVE IN-SESSION (S206, via Claude in Chrome with
## Yoshi's sign-in + approval). Record below; nothing left to do.

What landed on the live WP site:
- Terms of Service (post 237) — replaced with the updated terms
  (verified live: June 6 date, 13+ eligibility, price-lock, no
  community provisions).
- Privacy Policy (post 238) — replaced (verified live: deletion
  section, covers the app, no-ads declaration).
- Community Guidelines (239) + Acceptable Use Policy (240) — moved
  to trash.
- Footer Links menu — the two retired items removed.
- functions.php — 'activity' => 'Community' nav entry removed +
  the wp_footer community-subnav hook removed (orphaned
  rop_render_community_subnav function left in place, harmless;
  delete at leisure).
- footer.php — hardcoded Community Guidelines + Acceptable Use
  Policy links removed.
- Live verification: homepage alive, nav has no Community, footer
  legal shows only Terms + Privacy.

ORIGINAL INSTRUCTIONS (kept for reference):

The live remnantofpromise.org is WordPress; the legal pages are WP
Pages. Paste-ready replacement content is in
`~/Desktop/Remnant of Promise (community site)/`:

- `UPDATED_2026-06-06_Terms_of_Service.md`
- `UPDATED_2026-06-06_Privacy_Policy.md`

In WP Admin → Pages:

1. Edit **Terms of Service** (/terms-of-service/) — replace the body
   with the updated terms. Community provisions, 18+ rule, and the
   Guidelines/AUP references are gone; subscriptions + price-lock +
   tiers-managed-on-web are in; account eligibility is now 13+.
2. Edit **Privacy Policy** (/privacy-policy/) — replace the body with
   the updated policy. It now covers the study Bible app and carries
   the account-deletion procedure Play requires.
3. **Unpublish** (draft or trash) **Community Guidelines**
   (/community-guidelines/) and **Acceptable Use Policy**
   (/acceptable-use-policy/) — they governed the removed community.
4. Appearance → Menus: remove the footer links to Community
   Guidelines and Acceptable Use Policy, and remove the **Community**
   nav item (/activity/) if it is still showing.

Verify in a browser:

    https://remnantofpromise.org/privacy-policy/
    https://remnantofpromise.org/terms-of-service/

THE PLAY PRIVACY URL IS: https://remnantofpromise.org/privacy-policy/
Use it in Step 6 (App content → Privacy policy) and as the
account-deletion resource in the data-safety form.

Note: `privacy.html` + `terms.html` were also written into
`~/Desktop/Website/static-site/` to keep the local mirror in step —
nothing to do with them for the live site.

## Step 3 — Build web + commit + push (deploys the checkout gate)

The shell loads the live site (server.url posture), so the Pricing
gate reaches the installed app through the Render web deploy — no
app-store update needed for future pricing-surface changes.

```
cd ~/Desktop/App/app
npm run build
cd ~/Desktop/App
git add app/src/routes/Pricing.tsx app/android/app/build.gradle NEXT_SESSION_PLAY_STORE_SPEC.md S206_PLAY_SUBMISSION_RUNBOOK.md S206_BUILD_NOTES.md
git commit -m "S206: consumption-only store posture - native shell hides checkout, versionCode 11, Play submission runbook"
git push origin main
```

If a stale lock blocks the commit:

```
rm -f .git/index.lock
```

After Render finishes deploying, sanity-check on the web: open
bible.remnantofpromise.org/pricing in a normal browser — prices and
Subscribe buttons must still be there, untouched.

## Step 4 — Build the signed AAB

```
cd ~/Desktop/App/app
npx cap sync android
cd ~/Desktop/App/app/android
read -s RELEASE_KEYSTORE_PASSWORD
export RELEASE_KEYSTORE_PASSWORD
./gradlew bundleRelease
```

The `read -s` line waits silently — type the keystore password and
press return. Artifact lands at:

    app/android/app/build/outputs/bundle/release/app-release.aab

## Step 5 — Play Console: create the app

play.google.com/console → All apps → Create app:

- App name: **Remnant of Promise**
  (Alternative if you want the search term in the title:
  "Remnant of Promise Study Bible" — exactly 30 chars, fits the
  limit. Your call; the homescreen label stays "Remnant of Promise"
  either way.)
- Default language: en-US · App (not game) · **Free**
- Accept the declarations.

## Step 6 — App content tasks (Dashboard → App content)

**Privacy policy:** `https://remnantofpromise.org/privacy-policy/`

**App access:** "All or some functionality is restricted." Create a
demo partner account for Google's reviewers (use a promo code on a
throwaway email; Scribe tier so every surface opens) and enter those
credentials in the console. Internal testing isn't reviewed, but
production review later will need this — set it up once now.

**Ads:** No, the app contains no ads.

**Content rating:** start questionnaire → email
info@remnantofpromise.org → category: Reference/Educational. All
content questions: No (no violence, sexuality, profanity, drugs,
gambling, user-to-user communication — highlights/notes are private
to the account). Expected rating: Everyone.

**Target audience:** 13 and over (do NOT tick under-13 — keeps the
app out of the Families policy track).

**News app:** No. · **COVID-19 app:** No. · **Government app:** No.
**Financial features:** None of the above.

**Data safety form:**
- Collects data? Yes. Encrypted in transit? Yes.
- Deletion mechanism? Yes — point to
  `https://remnantofpromise.org/privacy-policy/` (the "Deleting Your
  Account and Your Data" section).
- Personal info → Email address: collected, NOT shared, optional,
  purposes: account management + app functionality.
- Personal info → User IDs: collected, NOT shared, optional,
  account management.
- Financial info → Purchase history: collected (subscription tier +
  status read from Stripe), NOT shared, optional, app functionality
  + account management.
- App activity → Other user-generated content: collected
  (highlights + study notes synced to the account), NOT shared,
  optional, app functionality.
- Nothing else is collected. No ads SDKs, no analytics, no location,
  no device IDs beyond what sign-in requires.
- "Shared" stays No throughout — Stripe/hosting are service
  providers, which Play's definition excludes from sharing.

## Step 7 — Store listing (Grow → Store presence → Main store listing)

- App name: Remnant of Promise
- Short description (78 chars):

      A study Bible with the sacred names restored. The whole canon — free, no ads.

- Full description: see LISTING COPY below.
- App icon: `~/Desktop/App/brand-assets/app-icon-android-play-store-512x512.png`
- Feature graphic: `~/Desktop/App/brand-assets/play-store-feature-graphic-1024x500.png`
- Category: Books & Reference. Contact email: info@remnantofpromise.org.
- Screenshots: minimum 2 phone screenshots; take 4-6 on your phone
  from the current direct-APK install (or after the internal-testing
  install — listing can be finished after):
  1. Dark reader, Genesis 1 open.
  2. John 10 with the Witness red text + the Kingdom quote marks
     visible on v.16.
  3. The Kingdom card unfolded — John 10:16 ↔ Ezekiel 37 side by side.
  4. A chapter-end cross-reference card.
  5. Strong's lookup open on a tagged word.
  6. Light theme reader (optional).

## Step 8 — Internal testing release

1. Test and release → Testing → Internal testing → Create new release.
2. First upload: accept **Play App Signing** (Google holds the app
   signing key; your keystore becomes the upload key — this is the
   correct posture and removes the lost-keystore catastrophe for
   everything after this upload).
3. Upload `app-release.aab`. Release name auto-fills from 11 (1.1.0).
   Release notes: "First internal build."
4. Testers tab → create an email list with your Google account
   address → save.
5. Start rollout to Internal testing. Available within minutes — no
   review gate.
6. Testers tab → copy the opt-in link → open it on your phone signed
   in to that Google account → Join → install from the Play page it
   offers.

## Step 9 — After the first upload: second fingerprint into assetlinks

Play App Signing re-signs the app with Google's key, so Play-installed
builds carry a different SHA-256 than your direct-APK builds. App
Links (the /strongs/{N} deep links) only keep auto-verifying if BOTH
fingerprints are published.

Play Console → Test and release → Setup → App integrity → App signing
key certificate → copy the SHA-256 fingerprint. Then tell Claude next
session (or edit yourself): add it as a second entry in the
`sha256_cert_fingerprints` array of
`app/public/.well-known/assetlinks.json` (keep the existing
D2:E0:F7:... upload-key fingerprint), rebuild web, push.

## Step 10 — On-device walk (after install from Play)

1. App updates over the existing install (versionCode 11 > 10); sign-in
   and preferences survive.
2. **Pricing surface in the shell**: chrome → Become a partner → the
   page shows tier names + what each carries + the account-on-web
   note. NO prices, NO Subscribe buttons, NO founder box, NO promo-code
   footer line. (Needs Step 3's Render deploy live first.)
3. **Same page in a phone browser**: prices + Subscribe buttons all
   present — web checkout untouched.
4. Sign-in inside the shell works (in-app credential form); after
   sign-in, an active subscription shows the green active-partner
   banner on the Pricing page with the right tier — that's the
   tier-read verification.
5. Deep link: tap bible.remnantofpromise.org/strongs/G3056 from
   iMessage/Signal → opens the app, StrongsLookup shows logos.
6. Native share from a verse → Action sheet with PNG + watermark URL.
7. Cold launch → splash → reader resumes position.

Report results; anything broken gets fixed and re-rolled in minutes
on the internal track.

---

# LISTING COPY (full description — voice-gated, paste as-is)

Come and see.

The Remnant of Promise study Bible opens the complete 66-book canon to every reader, free — no account needed, no ads, no tracking. What sets it apart is on the page itself: the sacred names restored throughout, with the familiar English alongside at every mention — Yahuah (LORD), Yahusha (Jesus), Elohim (God) — so a reader meeting the names for the first time is never lost. You choose how the Name displays, and the reader keeps your choice.

READ FREE
• The complete 66-book canon, sacred names restored
• A reader built for long reading — dark and light themes, your place always kept
• The Witness — red-letter editions mark where the Messiah speaks; the Witness marks where the text says who he is, and unfolds each claim with both passages quoted in full so you can weigh it for yourself
• The Kingdom — the announcement the apostles carried, traced verse by verse to the prophets it was taught from; both sides quoted side by side
• Verse share cards — send any verse as a clean image
• Search across the canon

STUDY DEEPER
A partnership opens the deeper layers: chapter-by-chapter study commentary, curated cross-reference threads that quote both sides in full, Strong's lookup on tagged words, and the restored library beyond the canon — the Apocrypha, 1 Enoch, Jubilees, Jasher, the Apostolic Fathers, Josephus, and more, all carrying the same restored names. Highlights, study notes, and preferences sync across your devices when you're signed in.

THE POSTURE
Nothing here asks you to take anyone's word for it. The work is laid out on the page — passages quoted in full, side by side — so you can watch the text speak for itself. Come and see.

Remnant of Promise is a 501(c)(3) nonprofit religious organization. No ads, ever. Your data is never sold.
