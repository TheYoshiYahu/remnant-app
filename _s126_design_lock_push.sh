#!/usr/bin/env bash
# S126 design-lock push — DESIGN_LANGUAGE.md §24 (Share-and-Copy-with-Watermark,
# Wheel 7 of the pre-launch sweep), S118 landing-page spec revision for the
# left-rail menu + v4 brand-mark hero composition, and the v4 brand-mark
# asset family (share-card watermark + landing-page hero + App Store / Play
# Store icon + Play feature graphic).
#
# This is the SPEC-AND-ASSETS half of W7 per the project's spec-then-build
# discipline. The S127 code build (lib/share-card-render.ts + sanity tests +
# §20/§21 stub promotions from Coming-soon to Live) is a separate session.
#
# Run from anywhere: `bash ~/Desktop/App/_s126_design_lock_push.sh`

set -euo pipefail

APP_DIR="$HOME/Desktop/App"
cd "$APP_DIR"

echo
echo "==> S126 design-lock push — W7 spec + v4 brand-mark + App Store deliverables"
echo

# Stale git index lock from prior interrupted op — clean up if present.
if [ -f "$APP_DIR/.git/index.lock" ]; then
    rm -f "$APP_DIR/.git/index.lock"
    echo "==> cleared stale .git/index.lock"
fi

# Add outputs/ to .gitignore — dev-time mockup HTML files are not source-of-truth.
# (The actual brand-mark assets live in brand-assets/ and are tracked separately.)
if ! grep -qE "^outputs/$|^outputs$" "$APP_DIR/.gitignore" 2>/dev/null; then
    echo "outputs/" >> "$APP_DIR/.gitignore"
    echo "==> added outputs/ to .gitignore"
fi

echo
echo "==> staging changes:"
git add DESIGN_LANGUAGE.md
git add S118_READ_THE_SCRIPTURES_PAGE_SPEC.md
git add brand-assets/
git add .gitignore
git add "$0"

echo
echo "==> diff summary:"
git diff --cached --stat
echo

read -rp "Commit + push? [y/N] " ans
if [[ "${ans:-N}" != "y" && "${ans:-N}" != "Y" ]]; then
    echo "Aborted — staged changes left in place."
    exit 1
fi

git commit \
  -m "S126 W7 design lock — DESIGN_LANGUAGE.md section 24 share-watermark plus S118 landing-page revision plus v4 brand-mark assets plus App Store deliverables" \
  -m "Spec-then-build half of Wheel 7 (the S127 code build is a separate session). DESIGN_LANGUAGE.md section 24 locks the share-and-copy-with-watermark spec: canvas-PNG render at 1080x1350 IG portrait, three-zone layout with reserved 18 percent footer band so verse text never collides with the watermark, locked v4 brand-mark asset path, range-header format table covering single-verse plus same-chapter plus cross-chapter plus cross-book ranges, three-transport export path (navigator.share then clipboard.write then a-download fallback) with text-only fallback for browsers that cannot put PNG on the clipboard, no-cap range handling with single-card-only-with-warning V1 scope, section 20 plus section 21 stub catalog promotions that fire when W7 ships at S127, full accessibility surface, pure-helper API and sanity-test boundary list. S118 landing-page spec rewritten for the brand-mark plus left-rail menu hero composition plus new Walkthrough and Tools Guide section (8-card grid covering Strong's plus restored sacred names plus bookmarks-notes-highlights plus library plus cross-refs plus commentary plus share-watermark plus offline downloads) plus App Store image lock cross-ref." \
  -m "Brand-mark v4 (argaman-tribes upgrade) locked at S126: deep blue Lombardic title in techelet register from section 3, blue olive-branch motif, gold menorahs and central trunk and light, JUDAH and EPHRAIM in argaman per the section 3 sacred-color lock for the word Judah plus the Ezekiel 37 two-sticks restoration extension for Ephraim. Three sacred-color registers (techelet plus argaman plus gold) summarized in one mark. 25 percent saturation lift baked into the PNG via PIL.ImageEnhance.Color from the Grok-delivered source. v3 gold-accents-with-blue-tribes preserved in brand-assets and brand-assets _pre-v4 for rollback. App Store deliverables generated downstream from v4: app-icon-ios-1024x1024.png plus app-icon-android-play-store-512x512.png plus play-store-feature-graphic-1024x500.png. iPhone and iPad screenshots deferred until Capacitor wraps reach App Store submission scope." \
  -m "PWA-only ship at S127 build time — no schema migration, no API change. brand-assets PNGs ship into the deployed app via Vite static-asset pipeline when the W7 code build lands. Outputs folder (dev-time mockup HTMLs) added to gitignore — they are not source-of-truth for the app, only the local visual review artifacts that locked the design."

echo
echo "==> pushing to origin/main:"
git push

echo
echo "==> done."
