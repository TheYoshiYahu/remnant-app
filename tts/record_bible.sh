#!/bin/bash
# S444 — records the natural-voice Bible audio on this Mac.
#   bash ~/Desktop/App/tts/record_bible.sh
# Leaves finished chapters in ~/Desktop/App/audio. Safe to stop (Ctrl+C) and
# start again: it skips every chapter already recorded. Keeps the Mac awake
# while it runs. Upload new chapters any time with:
#   node ~/Desktop/App/_s444_upload_audio.mjs
set -e
cd "$(dirname "$0")"
if ! command -v uv >/dev/null 2>&1 && [ ! -x "$HOME/.local/bin/uv" ]; then
  echo "Installing uv (one time)..."
  curl -LsSf https://astral.sh/uv/install.sh | sh
fi
UV="$(command -v uv 2>/dev/null || echo "$HOME/.local/bin/uv")"
REL=https://github.com/thewh1teagle/kokoro-onnx/releases/download/model-files-v1.0
[ -s kokoro-v1.0.onnx ] || { echo "Downloading the voice model (one time, ~330 MB)..."; curl -L -o kokoro-v1.0.onnx "$REL/kokoro-v1.0.onnx"; }
[ -s voices-v1.0.bin ] || curl -L -o voices-v1.0.bin "$REL/voices-v1.0.bin"
for VOICE in ${@:-af_heart bm_george am_onyx}; do
  echo "=== Recording voice: $VOICE ==="
  caffeinate -i "$UV" run --quiet --python 3.12 --with kokoro-onnx --with soundfile --with imageio-ffmpeg \
    python gen_bible.py "$VOICE" priority 2>&1 | grep -v -i warn
done
echo "All done. Now run: node ~/Desktop/App/_s444_upload_audio.mjs"
