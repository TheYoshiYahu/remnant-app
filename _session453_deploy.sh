#!/bin/bash
# S453 — Stripe email lock + background audio in the phone shells.
# Step 1 of 3: web build, commit, push (Render redeploys the API + site).
set -e
cd ~/Desktop/App/app
echo "== building the web app =="
npm run build
npx cap sync
cd ~/Desktop/App
git add api/subscriptions.py app/src/App.tsx app/src/routes/SignIn.tsx \
  app/package.json app/package-lock.json \
  app/android/app/build.gradle app/android/app/src/main/AndroidManifest.xml \
  app/ios/App/App.xcodeproj/project.pbxproj build_android.sh \
  S451_APP_FEATURE_ROADMAP.md S446_SESSION_HANDOFF.md S453_SESSION_OPEN_PROMPT.md _session453_deploy.sh
git add -A app/android app/ios 2>/dev/null || true
git commit -m "S453: checkout email locked to the account; background audio + lock-screen controls in the phone shells (1.1.4)" \
  -m "Co-Authored-By: Claude Fable 5.1 <noreply@anthropic.com>" \
  -m "Claude-Session: https://claude.ai/code/session_01AruUnyyuE2ef3dVQvQi8w8"
echo ""
echo "== Committed. Now YOUR push (Claude cannot do this): =="
echo "    git push origin main"
echo "Then step 2:  bash ~/Desktop/App/build_android.sh"
echo "Then step 3:  open ~/Desktop/App/app/ios/App/App.xcworkspace   (Xcode: Product > Archive > Distribute)"
