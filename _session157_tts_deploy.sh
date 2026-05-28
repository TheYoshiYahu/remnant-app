#!/usr/bin/env bash
#
# S157 — Phase 9.4 native-OS TTS audio narration deploy.
# PWA-only (no schema migration, no API change). Single Static Site
# rebuild on Render (~2min). DESIGN_LANGUAGE.md §25.
#
# Run from ~/Desktop/App/ on Yoshi's laptop:
#   bash _session157_tts_deploy.sh
#
# Pre-flight: tsc -b clean across the project. 55/55 node sanity tests
# passing in _s157_tts_sanity.mjs.
#
# Verification after deploy (live walk on bible.remnantofpromise.org):
#   1. Chrome ▶ Listen button appears in the [Listen][Search][Notes]
#      [Theme][Subscription CTA] cluster.
#   2. Long-press a verse → VerseActionMenu opens with a new "Listen"
#      section at the top → "Play from here" Live item.
#   3. Tap ▶ Listen → AudioPlayer slides up from the bottom; first
#      verse of the chapter begins narrating with the substitution-
#      table pronunciations (Yahuah → "yah-OO-ah", Yashar'el →
#      "yih-shrah-EL", Mosheh → "MOH-sheh", etc.).
#   4. Currently-spoken verse shows the left-border + 8% tint accent
#      per §25 visual treatment (matches the §21 range-anchor register).
#   5. Verse auto-scrolls into view if outside the viewport (honor
#      prefers-reduced-motion via OS settings).
#   6. Speed picker (0.75× / 1.0× / 1.25× / 1.5×) — change mid-playback,
#      audio re-queues at the new rate.
#   7. Voice gear → modal opens with curated top 3-5 English voices +
#      "More voices…" expander. Per-row Preview button speaks the
#      preview phrase ("In the beginning Elohim created the heavens
#      and the earth") with that candidate voice.
#   8. End of chapter → AudioPlayer auto-advances to next chapter
#      within the witness-category (Gen 1 → Gen 2 → ... → Rev 22 →
#      bounce; same for apocrypha/pseudepigrapha).
#   9. Skip-back / skip-forward verse buttons advance one verse at a
#      time inside the current chapter.
#  10. Close ✕ stops audio cleanly + hides the player.

set -euo pipefail

cd ~/Desktop/App

echo ">> S157 deploy — Phase 9.4 native-OS TTS"
echo ">> tsc -b verify..."
(cd app && node_modules/.bin/tsc -b)
echo "   tsc clean."

echo ">> node sanity tests..."
node _s157_tts_sanity.mjs
echo "   sanity tests pass."

echo ">> git status"
git status --short

echo ""
echo "Files this wheel touched:"
echo "  DESIGN_LANGUAGE.md                       (new section25)"
echo "  REBUILD_STATE.md                          (S157 close-summary)"
echo "  app/src/lib/tts-helpers.ts                (NEW pure helpers + table)"
echo "  app/src/lib/tts.ts                        (NEW platform wrapper)"
echo "  app/src/components/AudioPlayer.tsx        (NEW player + voice picker)"
echo "  app/src/App.tsx                            (wiring)"
echo "  app/src/index.css                          (.tts-spoken)"
echo "  _s157_tts_sanity.mjs                       (NEW sanity tests)"
echo ""
read -p "Commit + push? [y/N] " yn
case "$yn" in
  [yY]*) ;;
  *) echo "Aborted."; exit 0 ;;
esac

git add -A
git commit -m "S157 — Phase 9.4 native-OS TTS audio narration (Free tier)

DESIGN_LANGUAGE.md section25 locked: sacred-name substitution table for
framework-true smooth audio, auto-advance through witness-category per
section19, curated voice picker with top 3-5 + More voices expander.

New: lib/tts-helpers.ts (substitution table + voice ranking + prefs
persistence, 55 node sanity tests passing), lib/tts.ts (web
SpeechSynthesis impl + Capacitor TODO for Phase 10),
AudioPlayer.tsx (bottom-pinned bar matching section22 NotesPanel register).

App.tsx: chrome Listen button left of Search; Listen section at top
of VerseActionMenu with Play-from-here Live; auto-scroll honoring
prefers-reduced-motion; .tts-spoken visual treatment matches section21
range-anchor register.

PWA-only deploy. No schema, no API change. Free at all tiers per
section9 + S141 launch-scope revision."

git push origin main
echo ""
echo ">> Pushed. Render Static Site rebuild ~2min."
echo ">> When green, live-walk the verification checklist above."
