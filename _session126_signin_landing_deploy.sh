#!/usr/bin/env bash
# S126 deploy — /sign-in intermediate landing page (closes the anonymous-
# checkout → dead-end-at-WP-login bleed).
#
# PWA-only deploy. No API change. No schema migration. Single Render
# Static Site rebuild.
#
# Run from anywhere: bash ~/Desktop/App/_session126_signin_landing_deploy.sh
#
# What this ships:
#   - app/src/routes/SignIn.tsx (NEW) — landing page at /sign-in with
#     two cards (Log in / Create an account), each linking to the
#     correct WordPress destination with the redirect_to= contract
#     populated from the ?return_to= query value. Defensive parsing
#     on return_to (allowlist of hosts; reject javascript: / data:)
#     so this can't be weaponized as an open-redirect surface.
#   - app/src/App.tsx — new pathname branch for /sign-in inserted
#     between /manage and /pricing in the route resolver.
#   - app/src/routes/Pricing.tsx — anonymous-checkout redirect target
#     swapped from
#       https://remnantofpromise.org/goshen/?redirect_to=...
#     to
#       /sign-in?return_to=...
#     so first-time visitors hit the two-button landing page before
#     the WordPress flow. Surrounding comment block updated to record
#     the S126 swap + reference SignIn.tsx + reiterate the S118
#     /account future-wheel queue status.
#   - REBUILD_STATE.md — S126 Done block at top of Done list; the
#     "Missing create-account path for new partners" queued item gets
#     a partial-close note pointing at the new /sign-in landing
#     page. The full S118 /account combined surface stays queued
#     pending the WP email-deliverability fix.
#   - This script (_session126_signin_landing_deploy.sh).
#
# Verification before commit (already run by hand):
#   - tsc -b clean exit 0 across the entire PWA project.
#   - No node sanity tests this wheel — pure UI route + redirect swap;
#     no non-trivial pure logic surfaces. The S121 W2 / W3 / S122 /
#     S123 / S125 pure-helper-and-sanity-tests forward standard only
#     applies when a wheel surfaces non-trivial pure logic.
#   - Vite build skipped per the established rolldown architecture
#     mismatch (sandbox Linux x64 vs Yoshi's macOS install). Render's
#     fresh Linux runtime builds the bundle cleanly.
#
# Known downstream gap (NOT closed by this wheel):
#   - WordPress email deliverability still delivers verification email
#     ~1 hour after signup per the S118 spec note. Partners who click
#     Create Account will register successfully but their verification
#     email may take ~1hr to arrive. Fix path is documented in
#     S118_LOGIN_REGISTER_SURFACE_SPEC.md Part 4 (WP Mail SMTP + Google
#     Workspace OR SendGrid free tier). That's its own wheel; this
#     ship closes the dead-end-at-login bleed regardless.

set -euo pipefail

APP_DIR="$HOME/Desktop/App"
cd "$APP_DIR"

echo
echo "==> S126 deploy — /sign-in intermediate landing page"
echo

# Clean any stale git locks left from prior session (sandbox-mount
# permission limitation surfaces as "Operation not permitted" inside
# the workspace; terminal-side rm clears them).
if [ -f "$APP_DIR/.git/index.lock" ] || [ -f "$APP_DIR/.git/HEAD.lock" ]; then
    echo "==> clearing stale git locks (index.lock + HEAD.lock)"
    rm -f "$APP_DIR/.git/index.lock" "$APP_DIR/.git/HEAD.lock"
fi

echo "==> running tsc -b on the PWA project"
(cd app && npx tsc -b)

echo
echo "==> staging changes:"
git add \
    REBUILD_STATE.md \
    app/src/App.tsx \
    app/src/routes/Pricing.tsx \
    app/src/routes/SignIn.tsx \
    "$0"

echo
echo "==> diff summary:"
git diff --cached --stat
echo

read -rp "Commit + push? [y/N] " ans
if [[ "${ans:-N}" != "y" && "${ans:-N}" != "Y" ]]; then
    echo "Aborted — staged changes left in place."
    exit 1
fi

git commit -m "S126 /sign-in intermediate landing page — closes the anonymous-checkout dead-end-at-WP-login bleed" \
           -m "Anonymous partners clicking Subscribe on /pricing were bouncing straight to remnantofpromise.org/goshen/, which is the WordPress login page only — no visible create-account path. First-time visitors hit a dead end. This wheel adds a small PWA-side /sign-in landing page that surfaces both Log In and Create Account up front, with each button wired to the correct WordPress destination via the redirect_to= contract." \
           -m "Yoshi's S119 lesson re-applied: when the partner names a simple direct path that closes the bleed, take it. Yoshi described what he wanted as 'a landing page that says login or create an account to purchase' — a small two-button intermediate page in the PWA, not the full S118 /account combined surface in WordPress. The S118 build (combined Log-In / Create-Account form in WP at /account + WP email deliverability fix prereq) stays queued for when email deliverability is fixed; this PWA-side intermediate page closes the immediate bleed today." \
           -m "Files: new app/src/routes/SignIn.tsx (renders the two cards with WP-destination buttons; honors ?return_to= query param with defensive host-allowlist parsing to block open-redirect abuse). App.tsx route resolver gains a /sign-in pathname branch inserted between /manage and /pricing. Pricing.tsx anonymous-checkout redirect target swapped from /goshen/?redirect_to= to /sign-in?return_to= with the surrounding comment block updated to record the swap + reiterate that the S118 /account combined surface stays on the future-wheels queue." \
           -m "Known downstream gap NOT closed by this wheel: WP verification email still arrives ~1hr after signup per S118_LOGIN_REGISTER_SURFACE_SPEC.md Part 4. Fix path documented there (WP Mail SMTP + Google Workspace OR SendGrid free tier); that's its own wheel and is the hard prereq before the full S118 /account combined surface can ship. This wheel closes the dead-end-at-login bleed regardless of the email-delivery downstream issue." \
           -m "Verification: tsc -b exit 0 clean across the entire PWA project. No node sanity tests — pure UI route + redirect swap, no non-trivial pure logic surfaces (the pure-helper-and-sanity-tests forward standard from S121 W2 / W3 / S122 / S123 / S125 applies when a wheel surfaces non-trivial pure logic; route + redirect doesn't). Vite build skipped per the established rolldown architecture mismatch; Render's fresh Linux runtime builds cleanly."

echo
echo "==> commit landed locally. pushing to origin..."
git push origin main

echo
echo "==> S126 deploy done."
echo
echo "Render will rebuild the PWA Static Site automatically (~2min)."
echo "When the rebuild lands, run the live walk:"
echo
echo "  1. Open bible.remnantofpromise.org in a fresh incognito tab (anonymous)."
echo "  2. Navigate to /pricing."
echo "  3. Click any Subscribe button on any tier card."
echo "  4. Verify the URL bounces to /sign-in?return_to=<encoded-pricing-URL>."
echo "  5. Verify the landing page renders:"
echo "       - Title 'Sign in to continue'."
echo "       - Two cards side-by-side on desktop (stacked on mobile):"
echo "           Log in  → primary-fill button → bounces to /goshen/?redirect_to=<pricing>"
echo "           Create an account  → primary-fill button → bounces to /goshen/?action=register&redirect_to=<pricing>"
echo "       - '← back to pricing' nav link at top."
echo "  6. Click Log in → /goshen/ renders the WP login form. Sign in. Bounces back to /pricing signed in (rop_jwt cookie set at .remnantofpromise.org parent domain per S114 auth path)."
echo "  7. CRITICAL: re-open the incognito tab fresh. Click Create an account on /sign-in."
echo "     IF /goshen/?action=register shows a WordPress registration form: the standard pattern works, deploy is complete."
echo "     IF /goshen/?action=register 404s or redirects to login-only: WP isn't honoring the action=register query through the slug-mover. Fix is a one-line URL change in SignIn.tsx (WP_REGISTER_URL constant near the top); we then re-ship."
echo "  8. (Known downstream gap) If you complete a fresh registration, the WP verification email may take ~1hr to arrive per S118 Part 4. Email deliverability fix is a future wheel."
