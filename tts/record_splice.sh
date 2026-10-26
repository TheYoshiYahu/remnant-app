#!/bin/bash
# S473 — re-speak only the verses with names, spliced into the chapters already recorded.
#   bash ~/Desktop/App/tts/record_splice.sh af_heart
# Safe to stop (Ctrl+C) and start again: finished chapters are skipped. Keeps the Mac awake.
# Then upload as always:  node ~/Desktop/App/_s444_upload_audio.mjs
set -e
cd "$(dirname "$0")"
UV="$(command -v uv 2>/dev/null || echo "$HOME/.local/bin/uv")"
for VOICE in ${@:-af_heart}; do
  echo "=== Splicing names: $VOICE ==="
  caffeinate -i "$UV" run --quiet --python 3.12 --with kokoro-onnx --with soundfile --with imageio-ffmpeg \
    python splice_names.py "$VOICE" 2>&1 | grep -v -i warn
done
echo "All done. Now run: node ~/Desktop/App/_s444_upload_audio.mjs"
