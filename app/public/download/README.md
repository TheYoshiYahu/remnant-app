S175 — direct-distribution APK lives here

# Purpose

This folder ships verbatim to bible.remnantofpromise.org/download/
via Vite's public/ copy. The Android .apk signed by
~/Desktop/App/_signing/remnant-bible.keystore lands here as

    remnant-bible-v1.0.0.apk

and serves at

    https://bible.remnantofpromise.org/download/remnant-bible-v1.0.0.apk

# How to place it

After running ./gradlew assembleRelease per S175_GRADLE_BUILD_RUNBOOK.md,
the signed binary lands at
~/Desktop/App/app/android/app/build/outputs/apk/release/app-release.apk

Copy + rename:

    cp ~/Desktop/App/app/android/app/build/outputs/apk/release/app-release.apk \
       ~/Desktop/App/app/public/download/remnant-bible-v1.0.0.apk

Then npm run build && deploy — Vite includes public/download/ in dist/.

# What links to it

  - bible.remnantofpromise.org → /settings → "Android app" card
    (visible only on Android browsers; hidden in iOS, desktop, and the
    native Capacitor shell itself)
  - remnantofpromise.org → hero "Now on Android" affordance
