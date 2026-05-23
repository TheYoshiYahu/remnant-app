#!/usr/bin/env bash
# S123 deploy — shared range-selection mechanic + multi-verse highlight
# (Wheel 4 of the locked 14-wheel pre-launch sweep).
#
# PWA-only deploy. No API change. No schema migration. Single Render
# Static Site rebuild.
#
# Run from anywhere: `bash ~/Desktop/App/_session123_range_selection_deploy.sh`
#
# What this ships:
#   - DESIGN_LANGUAGE.md §21 (NEW) — range-selection mechanic spec
#     + §20 patches (S122 "Multi-verse range" Coming-soon stub removed;
#     stub catalog + count summary updated; §20 paragraph repointed
#     at §21).
#   - app/src/lib/range-selection.ts (NEW) — pure state machine + helpers.
#   - app/src/components/RangeActionPicker.tsx (NEW) — post-capture modal.
#   - app/src/components/HighlightPicker.tsx — optional `targetVerseIds`
#     prop flips into multi-target mode (parallel POSTs with per-verse
#     failure tolerance). Single-verse mode unchanged.
#   - app/src/App.tsx — range state + handlers + range-mode banner +
#     verse-render range awareness + new "Range" section in
#     buildMenuSections + multi-target HighlightPicker invocation.
#   - app/src/index.css — `.verse-interactive.range-anchor` (border +
#     accent tint) + `.verse-interactive.range-captured` (accent tint).
#   - REBUILD_STATE.md — S123 Done entry + sweep-list strikethrough W4 +
#     Notes/Bookmarks next-wheel update + Recent observations S123 entry
#     + S121 trim per keep-last-1-2 convention.
#   - _s123_range_selection_sanity.mjs — 18/18 boundary-case sanity tests
#     covering state-machine + same-chapter + cross-chapter + cross-book
#     + range-of-one + range-reversed + out-of-order input + lexicographic-
#     vs-canonical bookSlug ordering (documented gap for W7 wrap).
#   - This script (_session123_range_selection_deploy.sh).
#
# Verification before commit (run by hand or as part of this script):
#   - tsc -b clean exit 0 — type-checks the new helper + multi-target
#     HighlightPicker prop + range-mode wiring.
#   - 18/18 node sanity tests — `node _s123_range_selection_sanity.mjs`.
#   - Vite build skipped (rolldown native binding architecture mismatch
#     between Yoshi's macOS install and sandbox Linux x64 per the
#     established S116/S117/S121/S122 pattern). Render's fresh Linux
#     runtime builds the bundle cleanly.

set -euo pipefail

APP_DIR="$HOME/Desktop/App"
cd "$APP_DIR"

echo
echo "==> S123 deploy — range-selection architecture + multi-verse highlight"
echo

# Clean any stale git locks left from prior session (sandbox-mount
# permission limitation surfaces as "Operation not permitted" inside
# the workspace; terminal-side rm clears them).
if [ -f "$APP_DIR/.git/index.lock" ] || [ -f "$APP_DIR/.git/HEAD.lock" ]; then
    echo "==> clearing stale git locks (index.lock + HEAD.lock)"
    rm -f "$APP_DIR/.git/index.lock" "$APP_DIR/.git/HEAD.lock"
fi

echo "==> running node sanity tests (18 boundary cases)"
node _s123_range_selection_sanity.mjs

echo
echo "==> running tsc -b on the PWA project"
(cd app && npx tsc -b)

echo
echo "==> staging changes:"
git add \
    DESIGN_LANGUAGE.md \
    REBUILD_STATE.md \
    app/src/App.tsx \
    app/src/components/HighlightPicker.tsx \
    app/src/components/RangeActionPicker.tsx \
    app/src/index.css \
    app/src/lib/range-selection.ts \
    _s123_range_selection_sanity.mjs \
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

git commit -m "S123 W4 range-selection architecture + multi-verse highlight" \
           -m "Shared range-selection mechanic in lib/range-selection.ts as a pure state machine + helpers; multi-verse highlight ships as the first consumer (verification surface for the shared mechanic). Three known consumers across the locked 14-wheel pre-launch sweep route through one capture flow: W4 multi-verse highlight (this wheel), W7 multi-verse Copy with watermark (Coming-soon stub in RangeActionPicker), W7 range Share-with-watermark (Coming-soon stub in same picker). Architecture-now-beats-retrofit-later forward standard re-confirmed (third instance after S121 W3 menu and S122 partner-tier resolution)." \
           -m "Yoshi gate locked the entry shape as one shared 'Start range here' menu item (in a new Range section of VerseActionMenu) routing through one capture flow to one branching action picker. Future Copy/Share at W7 flip from Coming-soon to Live in the same picker without changing the entry path. Cross-chapter scope: same-chapter only for W4 UX, helper fully general for W7 inheritance via the state-shape + comparator." \
           -m "DESIGN_LANGUAGE.md section 21 written FIRST with the full mechanic spec; code built to spec. Mid-build spec amendment: action-picker Cancel changed from sticky-captured to close-equals-cancel (simpler V1 mental model, no re-engage affordance complexity). Spec doc and code stay in sync. Section 20 patches: obsolete 'Multi-verse range' Coming-soon stub removed from Share section; stub catalog table updated to add new Range section with 'Start range here' Live item; count summary corrected; section 20 paragraph repointed at section 21." \
           -m "HighlightPicker gets optional targetVerseIds prop. When length > 1, picker renders multi-target mode (title 'Mark N verses'; chips row hidden; cap-reached banner skipped; save button 'Mark N verses'; fires Promise.allSettled over N verses with createOrReplaceHighlight per id; per-verse failures tolerated via per-call onSaved). Single-verse mode unchanged. No schema migration: existing verse_highlights table carries N rows for the range." \
           -m "App.tsx wiring: new rangeState + rangePickerOpen + pickerRangeVerseIds state; new startRangeFromVerse + commitEndVerse + cancelRange handlers; new useEffects for chapter-navigation-cancels-range + Escape-cancels-selecting; verse render adds range-anchor/range-captured classes + click handlers that commit end verse when in selecting mode; word-tappable Strong's tap reinterpreted as end-verse commit inside range mode per section 21 interaction-conflict resolution. New Range section in buildMenuSections with 'Start range here' Live item; Share section 'Multi-verse range' stub removed. New range-mode banner inside article. New CSS for range-anchor (2px spectral-blue left-border + 8% alpha tint) + range-captured (8% alpha tint) using color-mix for future-wheel accent re-pick adaptability." \
           -m "Verification: tsc -b clean exit 0 across the entire project. 18/18 node sanity tests passing (state-machine transitions + same-chapter forward range + range-of-one + reversed range auto-normalize + cancel from any state + commitEnd on idle/already-captured no-op + same-chapter resolver ordered ids + full-chapter range + cross-chapter helper-captures-resolver-empty + cross-book helper-captures-resolver-empty + cross-book reversed lexicographic-not-canonical + out-of-order chapterVerses + partial chapterVerses + isReversed flag + null-endpoint predicates + compareRefs ordering + orderRefs symmetry). Vite build skipped per the established rolldown architecture mismatch; Render's fresh Linux runtime builds cleanly."

echo
echo "==> commit landed locally. pushing to origin..."
git push origin main

echo
echo "==> S123 deploy done."
echo
echo "Render will rebuild the PWA Static Site automatically (~2min)."
echo "When the rebuild lands, run the live walk:"
echo
echo "  1. Open bible.remnantofpromise.org in a fresh tab."
echo "  2. Navigate to Genesis 1 (or any chapter)."
echo "  3. Long-press any verse → menu opens. Scroll to bottom — verify new 'Range' section with 'Start range here' Live item."
echo "  4. Tap 'Start range here' → range-mode banner appears at top, anchor verse gets the spectral-blue left-border + tint."
echo "  5. Tap any other verse in the same chapter → all verses in the range get the tint; action picker opens with 'Range captured — N verses' + range reference; Highlight Live + Copy/Share Coming-soon."
echo "  6. Tap 'Highlight range' → HighlightPicker opens in multi-target mode (title 'Mark N verses'). Pick a color + style + tap 'Mark N verses' → all verses get the mark, picker closes, range mode exits."
echo "  7. Re-test boundary cases: range-of-one (long-press → 'Start range' → tap same verse); reversed range (long-press verse 5 → 'Start range' → tap verse 1, helper normalizes silently); chapter navigation while in range mode (cancel silently); Escape key while selecting (cancel)."
echo "  8. Verify existing single-verse highlight still works: long-press → menu → 'Highlight verse' → single-verse picker with chips + cap UX intact."
