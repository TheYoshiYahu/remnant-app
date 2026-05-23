#!/usr/bin/env bash
# S122 — VerseActionMenu disabled-state stubs + layout refinement.
#
# PWA-only deploy (no API changes; no schema migration). The menu now
# carries the full S122 stub catalog per DESIGN_LANGUAGE.md §20:
#   - Live: Strong's lookup, Highlight verse, Copy verse
#   - Tier-locked (route to /pricing for below-tier partners; render
#     as Coming soon for at-or-above-tier partners): BDB, Thayer's,
#     Vine's, Hebrew/Greek interlinear, Nikkudot, Open notes for this
#     verse, Treasury (TSK), Nave's topical, Related passages
#   - Coming soon (no-op tap, just close): Bookmark, Add note, Share
#     with watermark, Multi-verse range
#
# Single-surface deploy:
#   - PWA static site (Render Static Site rebuild ~2min)
#
# Run from anywhere: `bash ~/Desktop/App/_session122_menu_stubs_deploy.sh`

set -euo pipefail

APP_DIR="$HOME/Desktop/App"
cd "$APP_DIR"

echo
echo "==> S122 deploy — VerseActionMenu disabled-state stubs + layout refinement"
echo "    Working dir: $APP_DIR"
echo

echo "==> git status before staging:"
git status --short
echo

echo "==> staging the S122 files:"
git add \
    app/src/components/VerseActionMenu.tsx \
    app/src/App.tsx \
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

git commit -m "S122 VerseActionMenu disabled-state stubs plus layout refinement" \
           -m "Iteration on the S121 W3 contextual menu. Menu now surfaces every future-wheel item as a dimmed stub today so partners see the full tool catalog up front. Three render states locked at S122 per DESIGN_LANGUAGE.md section 20: Live (full opacity, normal tap), Tier-locked (40 percent opacity, tier-name chip badge Notes or Library, tap routes to /pricing), Coming soon (40 percent opacity, italic Coming soon hint, no-op tap)." \
           -m "Partner-tier-aware rendering. A tier-locked stub renders as Coming soon (not locked) when the partner is already at or above the required tier. A free partner sees BDB as Library-badged plus tap-to-pricing; a Library-tier partner sees BDB as Coming soon because they do not need to upgrade — they are just waiting for it to ship. The /pricing route is reserved for partners who genuinely need to upgrade." \
           -m "MenuItem interface extended with two optional fields: lockedTier (notes or library) and comingSoon (boolean). The existing disabled flag stays as the catchall no-op. The component is dumb rendering — App.tsx buildMenuSections is the single source of truth for the stub catalog plus the partner-tier resolution; future wheels promote items across states by mutating the helper only." \
           -m "Layout refinement: modal max-width grows from max-w-sm to max-w-md to accommodate the fuller menu; max-h 85vh plus overflow-y-auto so the bottom-sheet scrolls cleanly when the menu runs tall (word-scope on a Hebrew word now carries 15 items). Tier badge chip in the bordered-chrome family per section 1 amendment; Coming soon italic in muted register." \
           -m "DESIGN_LANGUAGE.md section 20 updated with the locked stub catalog table (16 items across 5 sections) plus the three-render-state spec plus the partner-tier-aware rendering rule plus the modal sizing notes." \
           -m "Verification: tsc -b clean exit 0; 22/22 node sanity tests passing (12 tier-ladder cases plus 6 stub-state resolutions plus 4 language-conditional catalog cases including Hebrew=5 items, Greek=4 items no BDB no Nikkudot, verse-scope=0 Word-study items)."

echo
echo "==> commit landed locally. pushing to origin..."
git push origin main

echo
echo "==> push complete. Single-surface deploy:"
echo "    - PWA static site (remnant-app-pwa) will rebuild ~2min"
echo "    - No API changes; no schema migration; no Render API rebuild needed"
echo
echo "==> S122 deploy done."
