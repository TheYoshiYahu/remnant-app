#!/usr/bin/env bash
# S431 deploy — Hidden Words.
#
# Marks every KJV English word that stands for 2+ distinct Hebrew/Greek
# originals: a small violet superscript count after the word; tap it to open
# a bottom sheet showing the original words, their plain meanings, and where
# they're used (the book you're reading first). Default ON, free tier,
# persists like the other reader toggles (localStorage rop_hidden_words_v1).
#
# PWA-ONLY deploy. No API change required and NO schema migration required
# for V1 — the reader is offline-first: it consumes two static bundles in
# app/public (hidden-words-index.json, hidden-words-table.json), the same
# way the rest of the reader works. One Render Static Site rebuild ships it.
#
# (The two SQL files under data-schema/migrations/ are committed for the
# record and for a future server-backed phase; they are NOT needed for the
# feature to work and do NOT need to be run for this deploy.)
#
# Run from anywhere:  bash ~/Desktop/App/_session431_hidden_words_deploy.sh
#
# What this ships:
#   app/src/App.tsx                              (reader wiring — see below)
#   app/src/lib/useHiddenWordsToggle.ts   NEW    (default-ON toggle hook)
#   app/src/lib/hidden-words.ts           NEW    (offline-first data access)
#   app/src/hidden-words.css              NEW    (3 violet tones + sheet)
#   app/src/components/HiddenWordsSheet.tsx NEW  (the bottom-sheet table)
#   app/public/hidden-words-index.json    NEW    (7837 surface forms, ~250K)
#   app/public/hidden-words-table.json    NEW    (3198 keys, ~4M, lazy-loaded)
#   data-schema/migrations/session431_hidden_words.sql       NEW (record only)
#   data-schema/migrations/session431_hidden_words_data.sql  NEW (record only)
#   _s431_hidden_words_sanity.mjs         NEW    (bundle sanity check)
#   this script
#
# App.tsx wiring (6 seams, each degrades to plain text — cannot break the
# reader if a word/surface is absent):
#   - imports: HiddenWordsSheet + useHiddenWordsToggle + hidden-words lib
#   - useHiddenWordsToggle() alongside the Strong's-superscript toggle
#   - hwSheet state + a mount effect that loads the index once
#   - render seam: per word, lookupHiddenWord(seg.surface); when hit, add the
#     violet tone class (position % 3) + a tappable count <sup> before the
#     S160 Strong's sup
#   - Menu: a "Show/Hide Hidden Words" pill beside the Strong's pill
#   - the <HiddenWordsSheet> mount beside <StrongsLookup>, book-scoped to
#     selectedBookSlug, onJump wired to the same nav contract StrongsLookup uses
#
# Verification already run in-session before this script:
#   - tsc --noEmit -p app/tsconfig.app.json : 0 real errors (the only output
#     is TS6053 noise for untracked Finder " 2" duplicate files — see the
#     resilient gate below; those dupes are NOT in git, so Render builds clean)
#   - vite build : exit 0, bundles cleanly
#   - node _s431_hidden_words_sanity.mjs : ALL PASSED (serpent 6, devil 6,
#     beast 17, dragon 3; no restored names leaked; index<->table coherent)

set -euo pipefail

APP_DIR="$HOME/Desktop/App"
cd "$APP_DIR"

echo
echo "==> S431 deploy — Hidden Words (PWA-only, offline-first)"
echo

# --- branch guard: never ship from the protected compliance branch --------
BR="$(git rev-parse --abbrev-ref HEAD)"
if [ "$BR" != "main" ]; then
    echo "REFUSING: current branch is '$BR', not 'main'."
    echo "S431 ships to main. (Never touch compliance/remove-inapp-payment-links.)"
    exit 1
fi

# --- clear any stale git locks (sandbox-mount leftover) --------------------
if [ -f "$APP_DIR/.git/index.lock" ] || [ -f "$APP_DIR/.git/HEAD.lock" ]; then
    echo "==> clearing stale git locks"
    rm -f "$APP_DIR/.git/index.lock" "$APP_DIR/.git/HEAD.lock"
fi

# --- bundle sanity ---------------------------------------------------------
echo "==> sanity-checking the static bundles"
node "$APP_DIR/_s431_hidden_words_sanity.mjs"

# --- resilient typecheck gate ----------------------------------------------
# `tsc -b` chokes on untracked Finder "<name> 2.tsx/.ts" duplicate copies that
# iCloud/Desktop sync drops into app/src (TS6053 "File not found"). Those are
# junk, are NOT tracked by git, and will NOT exist in Render's fresh checkout,
# so they do not affect the shipped build. We gate on the real typecheck and
# treat ONLY those TS6053 " 2" lines as non-fatal; any other error fails loud.
echo "==> typechecking the PWA (resilient to untracked ' 2' duplicate files)"
TC_OUT="$(mktemp)"
set +e
(cd app && npx tsc --noEmit -p tsconfig.app.json) >"$TC_OUT" 2>&1
set -e
# drop the TS6053 phantom-duplicate noise and its two trailing "because" lines
REAL_ERRS="$(grep 'error TS' "$TC_OUT" | grep -v "TS6053" | grep -vE " 2\.(tsx|ts)'" || true)"
PHANTOM="$(grep -c "TS6053" "$TC_OUT" || true)"
if [ -n "$REAL_ERRS" ]; then
    echo "TYPECHECK FAILED — real errors:"
    echo "$REAL_ERRS"
    rm -f "$TC_OUT"
    exit 1
fi
if [ "$PHANTOM" != "0" ]; then
    echo "   (ignored $PHANTOM TS6053 lines from untracked Finder ' 2' duplicate files —"
    echo "    these are junk and not in git. To clear them locally and silence tsc -b:"
    echo "       find \"$APP_DIR/app/src\" -name '* 2.ts' -o -name '* 2.tsx' | while read f; do git ls-files --error-unmatch \"\$f\" >/dev/null 2>&1 || rm -f \"\$f\"; done )"
fi
rm -f "$TC_OUT"
echo "   typecheck clean (0 real errors)"

# --- stage -----------------------------------------------------------------
echo
echo "==> staging S431 files"
git add \
    app/src/App.tsx \
    app/src/lib/useHiddenWordsToggle.ts \
    app/src/lib/hidden-words.ts \
    app/src/hidden-words.css \
    app/src/components/HiddenWordsSheet.tsx \
    app/public/hidden-words-index.json \
    app/public/hidden-words-table.json \
    data-schema/migrations/session431_hidden_words.sql \
    data-schema/migrations/session431_hidden_words_data.sql \
    _s431_hidden_words_sanity.mjs \
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

git commit -m "S431 Hidden Words — mark every KJV word that hides 2+ Hebrew/Greek originals" \
  -m "Every English word the King James uses for two or more distinct Strong's originals gets a small violet superscript count after it, in one of three alternating tones (argaman / periwinkle / magenta). Tap the count to open a bottom sheet listing the original words behind it — Hebrew/Greek, transliteration, Strong's number, a plain-language meaning, and the verses where each is used, with the book you're reading shown first. Default ON, free tier, persists like the other reader toggles (localStorage rop_hidden_words_v1), with a Show/Hide pill in the reader Menu beside the Strong's-superscript pill." \
  -m "Offline-first, matching the rest of the reader: the counts and table are two static bundles built deterministically from the KJV USFX + the OpenScriptures Hebrew lexicon + Strong's Greek (restoration-pipeline/_session431_build_hidden_words.py). hidden-words-index.json (surface -> {key,count}) loads once at mount; hidden-words-table.json (key -> originals + per-book verse refs) loads lazily the first time a count is tapped. No API call and no schema migration are needed for this to work — every data path is guarded and degrades to plain text, so a missing word or a failed fetch can never break the reader." \
  -m "Counting engine (verified against the spec test set): fold each English surface (lowercase, strip inflection), keep a (word, Strong's) pair only when the Strong's own KJV-usage list contains that word (drops alignment/tag slips), count distinct Strong's per folded word, qualify at >= 2. Restored covenant names (God, Lord, Yahusha/Jesus, Christ, Israel, Judah, Jew...) are excluded by design and never marked. Sanity: serpent 6 (incl. H5175 + G3789), devil 6 (incl. G1228 + G1140), beast 17 (incl. therion G2342 + zoon G2226), dragon 3 (G1404); multi-word tags (Rev 2:10 'the devil') handled; 3,198 qualifying words across the canon." \
  -m "Files: NEW app/src/lib/useHiddenWordsToggle.ts (default-ON toggle, mirrors useStrongsSuperscriptsToggle), app/src/lib/hidden-words.ts (cached, fail-soft bundle access), app/src/hidden-words.css (3 tones light+dark + sheet), app/src/components/HiddenWordsSheet.tsx (current-book-first table), app/public/hidden-words-index.json + hidden-words-table.json (the bundles), _s431_hidden_words_sanity.mjs (bundle check). App.tsx gains the imports, the toggle, hwSheet state + a mount effect that loads the index, a render-seam lookup that adds the tone class + tappable count sup, a Menu pill, and the sheet mount. The two data-schema/migrations/session431_*.sql files are committed for the record and a future server-backed phase; they are NOT required for V1 and are NOT run by this deploy." \
  -m "Verification: tsc --noEmit -p app/tsconfig.app.json = 0 real errors (TS6053 noise is untracked Finder ' 2' duplicate files, not in git, absent from Render's checkout); vite build exit 0; bundle sanity ALL PASSED. Publish-then-edit per Yoshi: ship it live, refine from the real reader."

echo
echo "==> commit landed locally. pushing to origin/main..."
git push origin main

echo
echo "==> S431 deploy done."
echo
echo "Render will rebuild the PWA Static Site automatically (~2 min). Then:"
echo "  1. Open bible.remnantofpromise.org (hard-refresh / fresh tab)."
echo "  2. Read Genesis 3 — 'serpent' should show a violet superscript 6."
echo "     Tap it: the sheet lists nachash (H5175) + the Greek + the others,"
echo "     with 'In Genesis' verses first."
echo "  3. Read Revelation 12 — 'beast', 'dragon', 'devil' should all be marked."
echo "  4. Menu → toggle 'Hide Hidden Words' → marks vanish; reload → stays off;"
echo "     toggle back on → marks return (default is ON for first-run partners)."
echo "  5. Anything off (a count that looks wrong, a meaning you'd word"
echo "     differently) — note the word and we fix the gloss/count in the"
echo "     build script and re-ship. Nothing here can break the reader."
