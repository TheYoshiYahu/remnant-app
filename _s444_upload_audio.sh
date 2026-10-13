#!/bin/sh
# S444 — uploads the recorded Bible audio in ~/Desktop/App/audio to the
# Cloudflare R2 bucket "rop-audio" (served at https://audio.remnantofpromise.org).
# Safe to run again any time: it only sends files that are new or changed.
# One-time setup: brew install rclone, then `rclone config` (see AUDIO_SETUP.md).
rclone copy "$HOME/Desktop/App/audio" r2:rop-audio \
  --transfers 16 --checkers 32 --progress \
  --header-upload "Cache-Control: public, max-age=31536000, immutable"
