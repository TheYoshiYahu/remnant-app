#!/usr/bin/env bash
# S125 deploy — Search V1 UI (Wheel 6 of the locked 14-wheel pre-launch sweep).
#
# Two-surface deploy. The API gets one additive field on VerseSearchHit
# (tier_required) so the PWA can render the §23 gate-(c) tier-aware
# snippet card client-side without a second round trip. The PWA gets
# the SearchModal + chrome Search button + Cmd-K/Ctrl-K keyboard
# shortcut + lib/search-helpers.ts + node sanity tests.
#
# Run from anywhere: bash ~/Desktop/App/_session125_search_v1_deploy.sh
#
# What this ships:
#   - DESIGN_LANGUAGE.md §23 (NEW) — Search V1 UI spec: pop-up entry +
#     grouped-by-book collapsible results + tier-aware snippet card.
#     Plus §20 line-412 drift fix (S121-era summary table: Share row
#     wheel attribution W6 -> W7; obsolete 'verse-range selection'
#     pointer removed since range-selection shipped at W4/S123).
#     Seventh drift-caught-while-editing-the-doc instance.
#   - api/models.py — VerseSearchHit gains a tier_required: str field.
#   - api/main.py — search_verses SELECT adds b.tier_required, hit
#     constructor passes it through, docstring updated to record the
#     S125 addition + reference to §23.
#   - app/src/lib/api.ts — VerseSearchHit + VerseSearchResponse types;
#     searchVerses() client function with optional AbortSignal; get<T>
#     helper extended with optional { signal } options (backward-
#     compatible).
#   - app/src/lib/search-helpers.ts (NEW) — pure helpers per §23:
#     groupResultsByBook, highlightQueryMatches, isResultLocked,
#     tierBadgeLabel, formatHitCount, formatTotalSummary. No React
#     imports, no async, no globals. Type-only imports from ./api.
#   - app/src/components/SearchModal.tsx (NEW) — bordered-chrome modal
#     matching NotesPanel register; auto-focused query input with
#     250ms debounce + AbortController per-keystroke cancellation;
#     grouped-by-book collapsible results; tier-aware snippet card
#     swap; ARIA per §13 (role=dialog, aria-modal, aria-expanded on
#     group headers, aria-label on result rows, aria-keyshortcuts).
#   - app/src/App.tsx — search state, openSearchModal +
#     closeSearchModal + jumpToSearchResult + upgradeFromLockedSearchRow
#     handlers, Cmd-K/Ctrl-K window keydown listener (focus-aware
#     skip, exclusive-modifier check), chrome Search button inserted
#     left of Notes button (cluster becomes
#     [Search][Notes][Theme][Subscription CTA] per §23), SearchModal
#     render branch.
#   - REBUILD_STATE.md — S125 Done block at top of Done list +
#     strikethrough W6 in the sweep list.
#   - _s125_search_sanity.mjs (NEW) — 35/35 boundary-case sanity tests
#     covering groupResultsByBook (5) + highlightQueryMatches (8) +
#     isResultLocked across all partner-tier x row-tier_required cells
#     (7) + tierBadgeLabel (5) + formatHitCount (4) + formatTotalSummary
#     (5) + 1 end-to-end integration.
#   - This script (_session125_search_v1_deploy.sh).
#
# Verification before commit (already run by hand):
#   - tsc -b clean exit 0 across the entire PWA project.
#   - python3 -m py_compile clean on api/main.py + api/models.py.
#   - 35/35 node sanity tests passing (node _s125_search_sanity.mjs).
#   - Vite build skipped (rolldown native binding architecture mismatch
#     between Yoshi's macOS install and sandbox Linux x64 per the
#     established S116/S117/S121/S122/S123/S124 pattern). Render's
#     fresh Linux runtime builds the bundle cleanly.
#
# Deploy ordering (S125-specific):
#   - The API change is purely additive (a new optional column already
#     in the JOIN path; new field on the response model). Old clients
#     ignore the extra field. New PWA without the API change degrades
#     gracefully — VerseSearchHit.tier_required arrives undefined at
#     runtime, isResultLocked() reads undefined as 'free' rank (rank 0)
#     so every hit renders as Live regardless of partner tier. The
#     locked-snippet card only fires once the API ships. No-deploy-
#     order-dependency.

set -euo pipefail

APP_DIR="$HOME/Desktop/App"
cd "$APP_DIR"

echo
echo "==> S125 deploy — Search V1 UI (Wheel 6)"
echo

# Clean any stale git locks left from prior session (sandbox-mount
# permission limitation surfaces as "Operation not permitted" inside
# the workspace; terminal-side rm clears them).
if [ -f "$APP_DIR/.git/index.lock" ] || [ -f "$APP_DIR/.git/HEAD.lock" ]; then
    echo "==> clearing stale git locks (index.lock + HEAD.lock)"
    rm -f "$APP_DIR/.git/index.lock" "$APP_DIR/.git/HEAD.lock"
fi

echo "==> running node sanity tests (35 cases)"
node _s125_search_sanity.mjs

echo
echo "==> running py_compile on api/main.py + api/models.py"
python3 -m py_compile api/main.py api/models.py

echo
echo "==> running tsc -b on the PWA project"
(cd app && npx tsc -b)

echo
echo "==> staging changes:"
git add \
    DESIGN_LANGUAGE.md \
    REBUILD_STATE.md \
    api/main.py \
    api/models.py \
    app/src/App.tsx \
    app/src/components/SearchModal.tsx \
    app/src/lib/api.ts \
    app/src/lib/search-helpers.ts \
    _s125_search_sanity.mjs \
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

# Commit message — escape \$ on any tier-price references per the S124
# forward standard (set -u shell scripts abort on unescaped \$<digit>).
# Body uses tier names (Notes / Library), not prices, throughout — so
# nothing to escape this wheel, but the discipline stays in the template.
git commit -m "S125 W6 Search V1 UI — pop-up entry, grouped-by-book results, tier-aware snippet" \
           -m "Spec-then-build discipline (fifth consecutive wheel after S121 / S122 / S123 / S124). DESIGN_LANGUAGE.md section 23 written FIRST at wheel-open with three AskUserQuestion gates settled: (a) pop-up modal entry (reader stays mounted); (b) results grouped by book, collapsible, similarity-first within each group; (c) tier-aware snippet card swap for locked-book hits routing to /pricing. Code built to spec." \
           -m "Closes the section 9 Free-tier 'Search across canon + extras' line with a partner-facing surface. Server-side /v1/verses/search shipped at Phase-4 wheel #6 (Session 36); this wheel adds the PWA-side entry surface plus the small additive API change (tier_required on VerseSearchHit) so the PWA renders the tier-aware snippet card client-side." \
           -m "Search is chrome-scope, not verse-scope — opens from the new chrome Search button + Cmd-K/Ctrl-K keyboard shortcut, NOT from the section 20 VerseActionMenu. The section 20 stub catalog is deliberately untouched by W6; the line-412 S121-era summary table gets a drift fix in the same edit (Share row: Wheel 6 -> Wheel 7, obsolete verse-range pointer removed since range-selection shipped at W4/S123). Seventh drift-caught-while-editing-the-doc instance after S88 / S120 / S121 / S122 / S123 / S124." \
           -m "API: api/models.py adds VerseSearchHit.tier_required (content_tier enum value). api/main.py search_verses SELECT adds b.tier_required, the row dict mapping passes it through to the response, docstring updated to record the S125 addition + reference section 23. Endpoint stays public (no auth, no server-side tier filter) — the inline justification per the S124 forward standard: server-side filtering would hide the existence of tier-locked content from the partner, killing the search-as-acquisition-surface intent of gate (c). Client-side rendering with the upgrade-card swap preserves discovery while preventing snippet leak. Backward-compatible field addition — old clients ignore it." \
           -m "PWA: new lib/search-helpers.ts (5 pure helpers + 1 tier-badge label helper, no React imports / no async / no globals). New components/SearchModal.tsx (bordered-chrome modal matching NotesPanel register; auto-focused input with 250ms debounce + AbortController per-keystroke cancellation; grouped-by-book collapsible results; tier-aware snippet card swap; ARIA per section 13). App.tsx wiring: searchOpen state, four new handlers (openSearchModal / closeSearchModal / jumpToSearchResult / upgradeFromLockedSearchRow), Cmd-K/Ctrl-K window keydown listener (focus-aware skip, exclusive-modifier check, no-op when modal already open), chrome Search button inserted left of Notes button (cluster becomes [Search][Notes][Theme][Subscription CTA] per section 23), SearchModal render branch added before NotesPanel render. lib/api.ts: VerseSearchHit + VerseSearchResponse types, searchVerses() client function, get<T> extended with optional { signal } (backward-compatible)." \
           -m "At V1 ship the tier-aware snippet card is dormant — verses.text rows are all tier_required='free' from the Session 73 schema flip; the card lights up when the W10 reference library wheel ships BDB / Thayer's / Vine's lemma headwords at tier_required='extras'. Inline divergence justification per the S124 forward standard documented in section 23 so future wheels don't reread the gate as dead code." \
           -m "Verification: tsc -b exit 0 clean across the entire PWA project; python3 -m py_compile clean on api/main.py + api/models.py; 35/35 node sanity tests passing (groupResultsByBook 5 cases + highlightQueryMatches 8 cases + isResultLocked across 6 partner-tier x 5 row-tier_required combinations + tierBadgeLabel 5 cases + formatHitCount 4 cases + formatTotalSummary 5 cases + 1 end-to-end integration). Vite build skipped per the established rolldown architecture mismatch; Render's fresh Linux runtime builds cleanly. tsc-clean + py_compile-clean + sanity-tests-clean is the load-bearing verification."

echo
echo "==> commit landed locally. pushing to origin..."
git push origin main

echo
echo "==> S125 deploy done."
echo
echo "Render will rebuild BOTH services automatically:"
echo "  - API service (~3-5min) — adds tier_required to VerseSearchHit."
echo "  - PWA Static Site (~2min) — ships the SearchModal + chrome button."
echo
echo "Deploy-order-independent. New PWA without API change degrades to"
echo "all-Live rendering (no locked-snippet card fires); old PWA with"
echo "new API ignores the extra field. Either lands first cleanly."
echo
echo "Live walk after both rebuilds land:"
echo
echo "  1. Open bible.remnantofpromise.org in a fresh tab."
echo "  2. Confirm new chrome cluster: [⌕ Search][✎ Notes][Theme toggle][Subscription CTA]."
echo "  3. Click the Search button → pop-up modal opens, input auto-focused."
echo "  4. Try Cmd-K (macOS) / Ctrl-K (Windows/Linux) — modal opens too."
echo "  5. Type 'a' (single char) → idle hint 'Type to search the canon and extras.' stays."
echo "  6. Type 'shepherd' → spinner during debounce window, then grouped results render. Verify:"
echo "       - Book groups in similarity-first order (Psalms / John / Ezekiel typical)."
echo "       - ▼ glyph in spectral-blue accent on each group header."
echo "       - 'N hits' per-book count in muted register on right of header."
echo "       - Inside each group, rows in server's similarity order."
echo "       - Verse refs render in spectral-blue accent."
echo "       - Snippet text in italic muted register."
echo "       - 'shepherd' inside each snippet highlighted with spectral-blue 25% alpha background."
echo "       - Footer hint at bottom: 'N hits across M books'."
echo "  7. Tap a result row → modal closes, reader scrolls to the destination verse, S116 reading-position effect persists the new position."
echo "  8. Re-open Search, type 'xyznever' → 'No verses match \"xyznever\".' empty state."
echo "  9. Toggle group collapse: tap a group header → caret flips to ▶, hits hide. Tap again → expands."
echo " 10. Re-open Search and type a new query → all groups expanded again (per §23: collapse state does NOT persist across new queries)."
echo " 11. Escape closes the modal."
echo " 12. Tap-outside (on the backdrop) closes the modal."
echo " 13. With the modal open, type into the search input — verify Cmd-K from inside an input is a no-op (the global listener skips when focus is in an INPUT)."
echo
echo "Tier-aware snippet card: dormant at V1 (verses.text rows are all"
echo "tier_required='free'). Card will fire when W10 lands BDB / Thayer's"
echo "/ Vine's at tier_required='extras'. Section 23 documents the"
echo "divergence inline."
