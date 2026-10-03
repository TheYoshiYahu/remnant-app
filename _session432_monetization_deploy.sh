#!/usr/bin/env bash
# S432 deploy — pull the plug: real paywall gates + two reader fixes.
#
# PWA-ONLY. No API change, no schema migration. One Render Static Site rebuild.
# Builds on S431 (Hidden Words), which is already live on main (commit 7baafad).
#
# Run from anywhere:  bash ~/Desktop/App/_session432_monetization_deploy.sh
#
# WHY: the study content was leaking. A free / not-signed-in visitor could read
# the full cross-reference verse text and the end-card summaries — the only
# "lock" was on navigation and on the tap, so there was no reason to subscribe.
# New model (Yoshi): every new account gets the full study library free for a
# week; after the trial the plug is pulled — the reader still SEES that real
# substance is there (blurred behind glass / colored marks), but can't read it
# without starting the trial or subscribing.
#
# WHAT SHIPS (6 files):
#   app/src/components/ChapterEndCard.tsx
#     - Locked cross-reference previews now render BLURRED behind glass with an
#       "Unlock in [tier] tier" CTA (web) / manage-on-web line (native),
#       instead of fully-readable text. New <BlurredLock> helper.
#     - Locked end-card thread summaries: the teaser paragraph is blurred too,
#       over the existing count line + Unlock CTA. The old S201 "stays fully
#       readable" rule is replaced (comment updated in-file).
#       Canon / free-tier cross-refs are unaffected — they stay readable.
#   app/src/App.tsx
#     - Hidden Words is now a conversion hook: the colored marks + counts show
#       for everyone (they SEE the feature), but tapping a count when NOT in a
#       free week / not paying opens a sign-in-or-upgrade wall instead of the
#       table. Entitled = account with status active|trialing.
#   app/src/components/HiddenWordsSheet.tsx
#     - New `locked` / `signedIn` props: when locked, the sheet shows the
#       feature wall (web CTA = "Start your free week" if signed out, "Unlock
#       Hidden Words" if signed in; native = manage-on-web line) and does NOT
#       fetch the 4M table.
#   app/src/lib/useStudyBarCollapsed.ts
#     - Display Options now defaults to EXPANDED (visible on arrival). Only an
#       explicit stored "true" keeps it collapsed for returning readers.
#   app/src/index.css
#     - The Display Options control reads as a word ("HIDE" / "SHOW"),
#       underlined, instead of a chevron glyph.
#   app/src/routes/SignIn.tsx
#     - A "Show password" checkbox on the login form (requested: an older
#       partner wants to read her password as she types it).
#   this script.
#
# Verification already run in-session:
#   tsc --noEmit -p app/tsconfig.app.json : 0 real errors (TS6053 noise = the
#     untracked Finder " 2" duplicate files, not in git — Render builds clean).
#   vite build : exit 0.
#
# NOTE (honest, not fixed here): the blur is a VISUAL gate — the preview text
# still arrives in the page payload, so a determined user could read it via
# dev tools. The hard fix is to stop the API from sending locked previews/
# summaries at all; that's a backend wheel. For the funnel this ship is what
# matters. Also: "plug pulled when the trial runs out" depends on the backend
# dropping tier/flipping status at trial end (the known member-recognition /
# Stripe-source-of-truth gap) — the display gate here fires correctly off
# whatever tier/status the server reports.

set -euo pipefail

APP_DIR="$HOME/Desktop/App"
cd "$APP_DIR"

echo
echo "==> S432 deploy — paywall gates + reader fixes (PWA-only)"
echo

BR="$(git rev-parse --abbrev-ref HEAD)"
if [ "$BR" != "main" ]; then
    echo "REFUSING: current branch is '$BR', not 'main'."
    echo "(Never touch compliance/remove-inapp-payment-links.)"
    exit 1
fi

if [ -f "$APP_DIR/.git/index.lock" ] || [ -f "$APP_DIR/.git/HEAD.lock" ]; then
    echo "==> clearing stale git locks"
    rm -f "$APP_DIR/.git/index.lock" "$APP_DIR/.git/HEAD.lock"
fi

echo "==> typechecking the PWA (resilient to untracked ' 2' duplicate files)"
TC_OUT="$(mktemp)"
set +e
(cd app && npx tsc --noEmit -p tsconfig.app.json) >"$TC_OUT" 2>&1
set -e
REAL_ERRS="$(grep 'error TS' "$TC_OUT" | grep -v "TS6053" | grep -vE " 2\.(tsx|ts)'" || true)"
PHANTOM="$(grep -c "TS6053" "$TC_OUT" || true)"
if [ -n "$REAL_ERRS" ]; then
    echo "TYPECHECK FAILED — real errors:"
    echo "$REAL_ERRS"
    rm -f "$TC_OUT"
    exit 1
fi
[ "$PHANTOM" != "0" ] && echo "   (ignored $PHANTOM TS6053 lines from untracked Finder ' 2' duplicate files)"
rm -f "$TC_OUT"
echo "   typecheck clean (0 real errors)"

echo
echo "==> staging S432 files"
git add \
    app/src/App.tsx \
    app/src/components/ChapterEndCard.tsx \
    app/src/components/HiddenWordsSheet.tsx \
    app/src/lib/useStudyBarCollapsed.ts \
    app/src/index.css \
    app/src/routes/SignIn.tsx \
    "$0"

echo
echo "==> diff summary:"
git diff --cached --stat
echo

read -rp "Commit + push to origin/main? [y/N] " ans
if [[ "${ans:-N}" != "y" && "${ans:-N}" != "Y" ]]; then
    echo "Aborted — staged changes left in place (nothing pushed)."
    exit 1
fi

git commit -m "S432 pull the plug — blurred paywall on locked study content + reader fixes" \
  -m "The study library was being given away. A free / not-signed-in visitor could read the full cross-reference verse text and the end-card summaries; the only lock was on navigation and on the tap. No reason to subscribe. New model: every new account reads everything free for a week, then the plug is pulled — the reader still sees that real substance is there, but can't read it without the trial or a subscription." \
  -m "Cross-references + end cards (ChapterEndCard.tsx): locked previews and locked thread summaries now render BLURRED behind glass with an Unlock CTA (web) or the manage-on-web line (native, consumption-only), via a new <BlurredLock> helper. This replaces the S201 'locked content stays fully readable' rule (comment updated in-file). Canon / free-tier cross-refs are untouched and stay readable." \
  -m "Hidden Words (App.tsx + HiddenWordsSheet.tsx): the colored marks + counts show for everyone so the feature is visible, but tapping a count when not in a free week / not paying opens a sign-in-or-upgrade wall instead of the originals table (and skips fetching the 4M table). Entitled = account with status active|trialing. Web CTA = 'Start your free week' (signed out) / 'Unlock Hidden Words' (signed in); native = manage-on-web line." \
  -m "Reader fixes: Display Options now defaults to EXPANDED (visible on arrival; useStudyBarCollapsed), and its control reads as a word — HIDE / SHOW, underlined — instead of a chevron glyph (index.css). SignIn.tsx gains a 'Show password' checkbox on the login form (requested: an older partner wants to read her password as she types it)." \
  -m "Verification: tsc --noEmit -p app/tsconfig.app.json = 0 real errors (TS6053 noise = untracked Finder ' 2' duplicate files, not in git); vite build exit 0. Known: the blur is a visual gate (preview text still ships in the payload — hard fix is to stop the API sending locked previews, a backend wheel); and 'plug pulled at trial end' relies on the backend dropping tier/status at trial expiry (the known member-recognition gap). The display gate fires correctly off whatever tier/status the server reports."

echo
echo "==> commit landed locally. pushing to origin/main..."
git push origin main

echo
echo "==> S432 deploy done. Render rebuilds the PWA (~2 min). Then check:"
echo "  1. Fresh / incognito (signed out) on bible.remnantofpromise.org:"
echo "     - Genesis 1 cross-refs: the '2 Esdras' (Library) preview is BLURRED"
echo "       with an Unlock CTA; the canon refs (Psalms/John) stay readable."
echo "     - End-of-chapter cards: the summary teaser is blurred behind glass."
echo "     - Tap a colored Hidden Words count: the sign-in / free-week wall"
echo "       opens instead of the table (the marks themselves still show)."
echo "  2. Display Options is open on arrival; the control says HIDE (tap →"
echo "     collapses, says SHOW)."
echo "  3. /sign-in: the 'Show password' checkbox reveals the password field."
echo "  4. Signed in on an active/trial account: everything unlocks (full"
echo "     previews, full summaries, Hidden Words table)."
