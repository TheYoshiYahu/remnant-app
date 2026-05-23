#!/usr/bin/env bash
# S121 W3 — Wheel 3 of the locked pre-launch sweep: Strong's
# tap-on-word UI + contextual VerseActionMenu architecture.
#
# Two-surface deploy (NOT PWA-only like W2 was):
#   - API: new batched chapter-words endpoint (Render API rebuild ~3-5min)
#   - PWA: verse-align + StrongsLookup + VerseActionMenu + App.tsx wiring
#          (Render Static Site rebuild ~2min)
#
# Deploy order: API first so the PWA isn't loading against a 404 for
# longer than the brief window between Render rebuild completion and
# the PWA bundle catching up. PWA degrades gracefully (all-plain
# verses) if the API endpoint isn't live yet, so the window isn't
# functionally broken — just no tap-ability until both surfaces land.
#
# Run from anywhere: `bash ~/Desktop/App/_session121_w3_strongs_tap_deploy.sh`

set -euo pipefail

APP_DIR="$HOME/Desktop/App"
cd "$APP_DIR"

echo
echo "==> S121 W3 deploy — Strong's tap-on-word UI + VerseActionMenu"
echo "    Working dir: $APP_DIR"
echo

echo "==> git status before staging:"
git status --short
echo

echo "==> staging the W3 files:"
git add \
    api/main.py \
    api/models.py \
    app/src/lib/api.ts \
    app/src/lib/verse-align.ts \
    app/src/components/StrongsLookup.tsx \
    app/src/components/VerseActionMenu.tsx \
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

git commit -m "S121 W3 Strongs tap-on-word UI plus VerseActionMenu architecture" \
           -m "Free-tier tap-on-word feature per DESIGN_LANGUAGE.md section 9 built on the S120 data foundation (8674 Hebrew + 5523 Greek lexicon entries; 348884 USFX-aligned tokens). Quick-tap on a tappable word opens StrongsLookup modal directly; long-press / right-click opens VerseActionMenu with word-scoped Strongs at the top plus verse-scoped Highlight below. Replaces the S113 direct-to-HighlightPicker long-press path with a routed-via-menu architecture that scales as Wheels 5-13 add more per-verse tools (Notes, Bookmarks, Share-with-watermark, Interlinear, Recommendations)." \
           -m "New API endpoint GET /v1/books/{slug}/chapters/{n}/words batches per-verse Strong-tagged-token alignment into one round trip (replaces N parallel /v1/verses/{id}/words calls; browsers cap ~6 concurrent connections per host so long chapters like Psalm 119 with 176 verses would serialize badly). Public endpoint, no auth, no tier gate. New ChapterVerseWords and ChapterWordsResponse models." \
           -m "New app/src/lib/verse-align.ts pure helper turning (restoredText, verseWords[]) into Segment[] of plain or tappable runs. Handles single sacred-name clusters (Elohim God) and compound clusters (Yahuah Elohim the LORD God) plus sequential plain matching. The non-obvious correctness move: count parenthetical-internal words matching upcoming USFX surfaces, walk BACKWARDS that many tokens from the paren to find the cluster start (original cursor-to-paren version pulled prose into clusters and mis-paired). 5/5 node sanity tests pass." \
           -m "New components StrongsLookup.tsx (modal with badge plus lemma plus transliteration plus pronunciation plus gloss plus full definition plus derivation; Hebrew rtl plus SBL font stack) and VerseActionMenu.tsx (item-driven contextual menu; word scope or verse scope; future wheels append items without changing the component). App.tsx wires both into the existing verse-render with stopPropagation on word-level pointer handlers so the verse-level S113 long-press machinery still works for plain-text taps." \
           -m "DESIGN_LANGUAGE.md new section 20 Tap-on-Word locks the two-input-path-three-modal-surface architecture, the VerseActionMenu item-extensibility roadmap for Wheels 5 through 12, the StrongsLookup modal layout, the verse-render alignment with sacred-name cluster handling, the invisible-at-rest visual register decision per section 1 clean reading-surface principle, the interaction-conflict resolution with S113 and S121 W2, accessibility, and the deliberate V1 exclusions." \
           -m "Verification: tsc -b clean exit 0; py_compile clean on api/main.py and api/models.py; 5/5 verse-align sanity tests passing (Gen 1:1 simple, Gen 2:4 compound-with-interlude, Gen 2:7 compound-at-sentence-start, plain prose with no cluster, empty words list)."

echo
echo "==> commit landed locally. pushing to origin..."
git push origin main

echo
echo "==> push complete. Two-surface deploy:"
echo "    - API service (remnant-api) will rebuild on Render ~3-5min"
echo "    - PWA static site (remnant-app-pwa) will rebuild ~2min"
echo "    - PWA may briefly load against the old API and 404 the"
echo "      chapter-words endpoint — tap-ability will be unavailable"
echo "      for those reloads but verse text still renders cleanly"
echo "      (graceful degradation to all-plain). Tap-ability lights"
echo "      up on next chapter load once both surfaces are live."
echo
echo "==> S121 W3 deploy done."
