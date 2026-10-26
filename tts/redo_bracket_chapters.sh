#!/bin/bash
# S475 — after record_splice.sh af_heart says "All done": the 270 chapters whose spoken text changed
# (English brackets like "(the Lord)" were being read aloud) get taken off the done-list and spliced again.
#   bash ~/Desktop/App/tts/redo_bracket_chapters.sh af_heart
# Then upload as always:  node ~/Desktop/App/_s444_upload_audio.mjs
set -e
cd "$(dirname "$0")"
VOICE=${1:-af_heart}
DONE="../audio/$VOICE/.spliced-s473.txt"
grep -v -x -F -f s475_bracket_fix_chapters.txt "$DONE" > "$DONE.tmp" && mv "$DONE.tmp" "$DONE"
echo "Removed the bracket-fix chapters from $VOICE's done-list; splicing them again."
bash record_splice.sh "$VOICE"
