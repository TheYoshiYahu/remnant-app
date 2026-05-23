#!/usr/bin/env bash
# S121 — Wheel 2 of the locked pre-launch sweep: chapter swipe + arrow
# navigation. PWA-only ship (no schema, no API, no Render rebuild —
# the Static Site for the PWA will rebuild on push automatically per
# the hosting/render.yaml remnant-app-pwa service).
#
# Run from anywhere: `bash ~/Desktop/App/_session121_w2_chapter_nav_deploy.sh`
#
# What ships:
#   - app/src/lib/chapter-nav.ts  (NEW — pure nav helpers)
#   - app/src/App.tsx             (wiring: handlers + keyboard + swipe + 2 button surfaces)
#   - app/src/index.css           (nav-bounce-shake @keyframes + .nav-bounce class)
#   - DESIGN_LANGUAGE.md          (§1 amended, §5 gold→blue drift fixed + nav arrows added,
#                                  new §19 Chapter Navigation locked)
#   - REBUILD_STATE.md            (S121 Done block + S121 Recent observations entry +
#                                  S119 trimmed to short-paragraph summary)

set -euo pipefail

APP_DIR="$HOME/Desktop/App"
cd "$APP_DIR"

echo
echo "==> S121 W2 deploy — chapter swipe + arrow navigation"
echo "    Working dir: $APP_DIR"
echo

echo "==> git status before staging:"
git status --short
echo

echo "==> staging the W2 files:"
git add \
    app/src/lib/chapter-nav.ts \
    app/src/App.tsx \
    app/src/index.css \
    DESIGN_LANGUAGE.md \
    REBUILD_STATE.md \
    "$0"

echo
echo "==> git status after staging:"
git status --short
echo

echo "==> diff summary (line counts only):"
git diff --cached --stat
echo

read -rp "Commit + push? [y/N] " ans
if [[ "${ans:-N}" != "y" && "${ans:-N}" != "Y" ]]; then
    echo "Aborted — staged changes left in place."
    exit 1
fi

git commit -m "S121 W2 chapter swipe and arrow navigation across all surfaces" \
           -m "Touch swipe (mobile/tablet/Capacitor), left/right arrow keys (desktop/web), and visible bordered-chrome arrow buttons in both the picker row and a new bottom-of-chapter continuation row. All tiers, all surfaces. PWA-only deploy. Integrates transparently with S116 reading-position save." \
           -m "New module app/src/lib/chapter-nav.ts with pure helpers (nextChapterTarget, prevChapterTarget, lastChapterNumber, booksInSameCategory, targetLabel). Witness-category boundary honored (canon stays in canon; apocrypha stays in apocrypha; cross-edition is a deliberate picker action). Bounce at category edges with 300ms shake animation; prefers-reduced-motion respected." \
           -m "DESIGN_LANGUAGE.md updates: §1 locks the bordered-chrome button family for navigation chrome; §5 swapped from gold to spectral blue (S115 drift caught and fixed) and adds the chapter-nav arrow glyph register; new §19 Chapter Navigation locks the full spec including gesture thresholds (60px horizontal, |dx| > |dy| * 1.5 angle), keyboard contract (input-focus + modifier-key passthrough), book-boundary behavior (within witness_category, Genesis 1 prev = bounce, Revelation 22 next = bounce), accessibility (44pt iOS / 48dp Android hit targets per §13, aria-labels, tab order), and the deliberate V1 exclusions." \
           -m "Verification: tsc -b clean exit 0; 12-case node sanity test on the nav helpers passing (within-book prev/next, end-of-book forward boundary, start-of-book backward boundary, canon edges bounce, apocrypha edges bounce without bleeding into canon)."

echo
echo "==> commit landed locally. pushing to origin..."
git push origin main

echo
echo "==> push complete. Render Static Site (remnant-app-pwa) will rebuild"
echo "    automatically from the new commit; PWA at bible.remnantofpromise.org"
echo "    should pick up the new bundle within ~2 minutes."
echo
echo "==> S121 W2 deploy done."
