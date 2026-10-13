# S445 handoff (Oct 13, 2026) — App Store + Play launch of 1.1.2

## Done
- White emblem icon (emblem on pure white, wordmark cropped) in both builds. Generator: _scratch/s445_icon/make_icons.py.
- `npx cap sync` run: @capacitor-community/text-to-speech is now wired into BOTH native projects (it was installed but never synced before).
- iOS: version 1.1.2, build 13. Archived + uploaded (Yoshi accepted the updated Apple agreement first). App Store Connect version 1.1.2: subtitle, promo, description, keywords, What's New from the listing doc; 10 new screenshots in the 6.5/6.7/6.9" slot in order 01-10; old June Face ID set removed (still in Asset Library). SUBMITTED for review by Yoshi. Set to auto-release on approval.
- Android: 1.1.2 / versionCode 13 built with ~/Desktop/App/build_android.sh (asks for keystore password; it's in Apple Passwords as "Android Keystore - remnant-bible"). Output: ~/Desktop/App/Remnant-of-Promise-1.1.2.aab (17.8 MB). Production release 13 (1.1.2) saved with release notes; Yoshi to click "Submit 1 change for review" in Publishing overview.

## Gotchas found
- dist/download holds old APKs (228 MB) — cap sync copies them into the Android bundle. Delete app/android/app/src/main/assets/public/download after every cap sync (or move the APKs out of dist).
- iCloud " 2" duplicate files break Gradle ("already exists, cannot be overwritten"). Fix: delete android build dirs + node_modules/@capacitor*/**/android/build.

## Still open (from S444)
- Play feature graphic 1024x500 (emblem on white).
- Voice picker checkmark bug; Teachings raw *asterisks*; highlight 12 vs 13 dots; rename Heart/Onyx; 149 LORD/GOD spots; rop-site-polish.php upload.
