#!/usr/bin/env bash
# Build the v1.0.4 / versionCode 5 release APK for the bible app.
# S178: ships the in-app email+password sign-in form posting to
# /wp-json/jwt-auth/v1/token. The S176 Custom Tab + App Link round
# trip is dead code; AuthCallback.tsx + the /auth-callback
# intent-filter remain only as URL-paste fallback. rop-sso-bridge
# v1.1.1 is already live on the WP side.
#
# S178 hardening (vs S177): JAVA_HOME falls back to the Android Studio
# JBR path if unset; ANDROID_HOME falls back to ~/Library/Android/sdk
# if unset; app/android/local.properties is written if missing. The
# three env-var failures that killed S177 builds in fresh terminals
# (RELEASE_KEYSTORE_PATH, ANDROID_HOME, JAVA_HOME) are now: required
# (keystore — still must be exported), defaulted, defaulted.
#
# Run this from Yoshi's Mac where Android SDK + Gradle + the signing
# keystore live.
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

# Credentials sourcing (S178): the credentials file is the canonical
# source of signing creds. When it exists, it ALWAYS wins — including
# overriding stale env vars left in the shell from previous runs
# (which was the bug in the first sourcing pass: a literal '...'
# placeholder export in zsh poisoned the build because the original
# condition only sourced when the env var was empty). The _signing/
# folder is gitignored (.gitignore line 42), so the credentials file
# never reaches the repo.
CREDS_FILE="$REPO_ROOT/_signing/.credentials"
if [ -f "$CREDS_FILE" ]; then
  echo "--- sourcing credentials from _signing/.credentials ---"
  # shellcheck disable=SC1090
  source "$CREDS_FILE"
  echo
fi

echo "--- hardening environment (S178) ---"

# JAVA_HOME fallback: Gradle wants Java 21; Android Studio ships its
# own JBR with the right version. Fall back to that if the shell has
# no JAVA_HOME set (the S177-close failure mode in fresh terminals).
ANDROID_STUDIO_JBR="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
if [ -z "${JAVA_HOME:-}" ]; then
  if [ -x "$ANDROID_STUDIO_JBR/bin/java" ]; then
    export JAVA_HOME="$ANDROID_STUDIO_JBR"
    echo "JAVA_HOME unset; falling back to Android Studio JBR: $JAVA_HOME"
  else
    echo "ERROR: JAVA_HOME is unset and Android Studio JBR not found at:" >&2
    echo "  $ANDROID_STUDIO_JBR" >&2
    echo "Install Android Studio or export JAVA_HOME to a Java 21 JDK." >&2
    exit 1
  fi
else
  echo "JAVA_HOME: $JAVA_HOME"
fi

# ANDROID_HOME fallback: defaults to the standard macOS Android SDK
# location. Gradle reads it (and local.properties below) to find the
# SDK.
DEFAULT_ANDROID_SDK="$HOME/Library/Android/sdk"
if [ -z "${ANDROID_HOME:-}" ]; then
  if [ -d "$DEFAULT_ANDROID_SDK" ]; then
    export ANDROID_HOME="$DEFAULT_ANDROID_SDK"
    echo "ANDROID_HOME unset; falling back to: $ANDROID_HOME"
  else
    echo "WARN: ANDROID_HOME unset and default SDK not at $DEFAULT_ANDROID_SDK" >&2
    echo "      Continuing — Gradle will use local.properties if present." >&2
  fi
else
  echo "ANDROID_HOME: $ANDROID_HOME"
fi

# local.properties writeback: Gradle reads sdk.dir from this file even
# when ANDROID_HOME is set. Write it if missing so the build is
# reproducible from a fresh checkout.
LOCAL_PROPS="$ANDROID_DIR/local.properties"
if [ ! -f "$LOCAL_PROPS" ]; then
  SDK_DIR_FOR_PROPS="${ANDROID_HOME:-$DEFAULT_ANDROID_SDK}"
  echo "local.properties missing; writing sdk.dir=$SDK_DIR_FOR_PROPS"
  printf 'sdk.dir=%s\n' "$SDK_DIR_FOR_PROPS" > "$LOCAL_PROPS"
else
  echo "local.properties present: $(grep '^sdk.dir=' "$LOCAL_PROPS" || echo '(no sdk.dir line)')"
fi
echo

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
