#!/bin/bash
# S445 — build the signed Android App Bundle (1.1.2 / versionCode 13)
cd ~/Desktop/App/app/android || exit 1
if ! /usr/libexec/java_home >/dev/null 2>&1 && [ -d "/Applications/Android Studio.app/Contents/jbr/Contents/Home" ]; then
  export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
fi
[ -z "$ANDROID_HOME" ] && export ANDROID_HOME="$HOME/Library/Android/sdk"
echo "Type the Android signing-key password (nothing shows while you type), then press Return:"
read -s RELEASE_KEYSTORE_PASSWORD
export RELEASE_KEYSTORE_PASSWORD
echo "Building... this takes a few minutes."
./gradlew bundleRelease && mv app/build/outputs/bundle/release/app-release.aab ~/Desktop/App/Remnant-of-Promise-1.1.2.aab && echo "" && echo "DONE — the build is ready. Tell Claude." || echo "BUILD FAILED — tell Claude."
