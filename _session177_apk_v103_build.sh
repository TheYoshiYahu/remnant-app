#!/usr/bin/env bash
# Build the v1.0.3 / versionCode 4 release APK for the bible app.
# S177: ships the native auth callback path (rop-sso-bridge v1.1.1
# on the WP side is already live in production). Run this from
# Yoshi's Mac where Android SDK + Gradle + the signing keystore live.
#
# Usage:
#   1. Set the keystore env vars in this shell (or in ~/.zshrc):
#        export RELEASE_KEYSTORE_PATH=~/Desktop/App/_signing/remnant-bible.keystore
#        export RELEASE_KEYSTORE_PASSWORD='...'
#        export RELEASE_KEY_ALIAS=remnant-bible
#        export RELEASE_KEY_PASSWORD='...'   # only if different from store password
#   2. Run: bash _session177_apk_v103_build.sh
#   3. APK lands at: app/android/app/build/outputs/apk/release/app-release.apk
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="$REPO_ROOT/app"
ANDROID_DIR="$APP_DIR/android"
APK_OUT="$ANDROID_DIR/app/build/outputs/apk/release/app-release.apk"

echo "--- verifying versionCode/versionName in build.gradle ---"
grep -E '^\s*versionCode|^\s*versionName' "$ANDROID_DIR/app/build.gradle" | sed 's/^[[:space:]]*//'
echo

echo "--- verifying signing env ---"
: "${RELEASE_KEYSTORE_PATH:?RELEASE_KEYSTORE_PATH not set — keystore path is required to sign release builds}"
: "${RELEASE_KEYSTORE_PASSWORD:?RELEASE_KEYSTORE_PASSWORD not set}"
: "${RELEASE_KEY_ALIAS:?RELEASE_KEY_ALIAS not set}"
if [ ! -f "$RELEASE_KEYSTORE_PATH" ]; then
  echo "ERROR: keystore file not found at $RELEASE_KEYSTORE_PATH" >&2
  exit 1
fi
echo "keystore: $RELEASE_KEYSTORE_PATH"
echo "alias:    $RELEASE_KEY_ALIAS"
echo

echo "--- 1/4 vite build ---"
cd "$APP_DIR"
npm run build

echo
echo "--- 2/4 capacitor sync android ---"
npx cap sync android

echo
echo "--- 3/4 gradle clean + assembleRelease ---"
cd "$ANDROID_DIR"
./gradlew clean assembleRelease --no-daemon

echo
echo "--- 4/4 verify APK ---"
if [ ! -f "$APK_OUT" ]; then
  echo "ERROR: expected APK not at $APK_OUT" >&2
  exit 1
fi
echo "APK built: $APK_OUT"
ls -lh "$APK_OUT"

# Best-effort apk version dump if aapt or aapt2 is on PATH.
AAPT_BIN="$(command -v aapt2 || command -v aapt || true)"
if [ -n "$AAPT_BIN" ]; then
  echo
  echo "--- apk version info (via $(basename "$AAPT_BIN")) ---"
  if [ "$(basename "$AAPT_BIN")" = "aapt2" ]; then
    "$AAPT_BIN" dump badging "$APK_OUT" 2>/dev/null | grep -E "^package|versionCode|versionName" | head -3
  else
    "$AAPT_BIN" dump badging "$APK_OUT" 2>/dev/null | head -3
  fi
fi

echo
echo "Done. Sideload via:"
echo "  adb install -r \"$APK_OUT\""
echo "or copy to phone and tap to install."
