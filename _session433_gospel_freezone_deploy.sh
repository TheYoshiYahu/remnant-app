#!/usr/bin/env bash
# S433 deploy — the only free study zone is the Gospels.
#
# PWA-ONLY. No API change, no schema migration. One Render Static Site rebuild.
# Builds on S432 (054f3b5, already live).
#
# Run from anywhere:  bash ~/Desktop/App/_session433_gospel_freezone_deploy.sh
#
# WHY: after S432, locked end cards blurred — but cards/refs whose own
# tier_required was low still rendered FREE (e.g. "The Seed After His Kind" in
# Genesis read in full). Yoshi: "the only thing free should be in the gospels."
#
# NEW RULE (ChapterEndCard.tsx — cross-reference previews AND end-card threads):
#   entitled (free week / paying, status active|trialing) -> reads everything.
#   NOT entitled -> the only free zone is the Gospels (matthew/mark/luke/john);
#     there, per-tier gating still applies (an extra-canon ref inside a Gospel
#     chapter still locks). Every other book's cross-refs + end cards are
#     locked (blurred) for a non-entitled reader.
#   Implemented via a new isGospelSlug() + an `entitled` flag threaded from
#   App.tsx (entitled = me.status active|trialing) down through ChapterEndCard
#   -> BaselineList/BaselineEntryBlock/TargetRow and ThreadCallout.
#
# WHAT SHIPS (2 files):
#   app/src/components/ChapterEndCard.tsx
#   app/src/App.tsx            (passes entitled={hwEntitled} to ChapterEndCard)
#   this script.
#
# NOTE: the chapter Commentary block is already gated server-side (renders off
# the API's per-row `locked` flag, body omitted when locked), so it is not part
# of this change. The Witness / Kingdom proclamation cards are deliberately
# left free (they are the evangelism surfaces, "no tier gate, ever") — if you
# want those locked outside the Gospels too, that's a follow-up.
#
# Verification in-session: tsc --noEmit -p app/tsconfig.app.json = 0 real
# errors; vite build exit 0.

set -euo pipefail
APP_DIR="$HOME/Desktop/App"
cd "$APP_DIR"

echo; echo "==> S433 deploy — Gospels are the only free study zone"; echo

BR="$(git rev-parse --abbrev-ref HEAD)"
if [ "$BR" != "main" ]; then
    echo "REFUSING: current branch is '$BR', not 'main'."; exit 1
fi
if [ -f "$APP_DIR/.git/index.lock" ] || [ -f "$APP_DIR/.git/HEAD.lock" ]; then
    echo "==> clearing stale git locks"
    rm -f "$APP_DIR/.git/index.lock" "$APP_DIR/.git/HEAD.lock"
fi

echo "==> typechecking the PWA (resilient to untracked ' 2' duplicate files)"
TC_OUT="$(mktemp)"; set +e
(cd app && npx tsc --noEmit -p tsconfig.app.json) >"$TC_OUT" 2>&1
set -e
REAL_ERRS="$(grep 'error TS' "$TC_OUT" | grep -v TS6053 | grep -vE " 2\.(tsx|ts)'" || true)"
if [ -n "$REAL_ERRS" ]; then echo "TYPECHECK FAILED:"; echo "$REAL_ERRS"; rm -f "$TC_OUT"; exit 1; fi
rm -f "$TC_OUT"; echo "   typecheck clean (0 real errors)"

echo; echo "==> staging S433 files"
git add app/src/components/ChapterEndCard.tsx app/src/App.tsx "$0"
echo; echo "==> diff summary:"; git diff --cached --stat; echo

read -rp "Commit + push to origin/main? [y/N] " ans
if [[ "${ans:-N}" != "y" && "${ans:-N}" != "Y" ]]; then
    echo "Aborted — staged changes left in place."; exit 1
fi

git commit -m "S433 Gospels are the only free study zone" \
  -m "After S432, locked end cards blurred, but cards and cross-refs whose own tier_required was low still rendered in full for free (e.g. 'The Seed After His Kind' in Genesis). Yoshi: the only thing free should be in the Gospels." \
  -m "New rule in ChapterEndCard.tsx for both cross-reference previews and end-card threads: an entitled reader (free week or paying — status active|trialing) sees everything; a non-entitled reader gets content only in the Gospels (matthew/mark/luke/john), where per-tier gating still applies so an extra-canon ref inside a Gospel chapter still locks. Every other book's cross-refs and end cards are locked (blurred) for a non-entitled reader. Implemented with a new isGospelSlug() and an `entitled` flag threaded from App.tsx (me.status active|trialing) through ChapterEndCard into BaselineList/BaselineEntryBlock/TargetRow and ThreadCallout." \
  -m "Scope: the chapter Commentary is already server-gated (per-row locked flag), unchanged here. The Witness/Kingdom proclamation cards stay free by design. Verification: tsc --noEmit -p app/tsconfig.app.json = 0 real errors; vite build exit 0."

echo; echo "==> pushing to origin/main..."; git push origin main
echo; echo "==> S433 done. Render rebuilds (~2 min). Then check (signed out):"
echo "  - Genesis: every cross-ref + end card is blurred/locked."
echo "  - Matthew/Mark/Luke/John: cross-refs + cards read free (extra-canon"
echo "    refs inside a Gospel chapter still lock)."
echo "  - Signed in on a trial/active account: everything unlocks everywhere."
