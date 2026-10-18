#!/usr/bin/env bash
# S455 deploy — retire the apocrypha-charles-vol1 edition; 3 Maccabees moves into pseudepigrapha.
# Run from Terminal on the Mac:  bash ~/Desktop/App/_session455_deploy.sh
#
# The FILE side already landed in the session (python3 _s455_stage_files.py, re-runnable):
#   parsed/pseudepigrapha-charles-vol2.json now carries 3 Maccabees before 4 Maccabees (.pre-s455 backup);
#   parsed/apocrypha-charles-vol1.json moved beside its OCR source as ...parsed-retired-s455.json;
#   api/seed.py no longer knows the edition; chronological-reading.json / paragraph_starts.json /
#   tts/chapters_all.json re-keyed to pseudepigrapha/3-maccabees; Michael's 3 Maccabees mp3+json moved to
#   audio/am_michael/pseudepigrapha/3-maccabees; the other 14 books' audio archived to audio/_archive/.
# This script does the two things that need YOUR machine's logins:
#  1. Applies session455_retire_charles_vol1.sql to the live DB (ids unchanged; 14 OCR books deleted
#     only if nothing references them; the edition row goes when empty).
#  2. Uploads the 14 re-keyed 3 Maccabees audio files to R2 under the new key (wrangler login).
# Logs: _session455_deploy.log
set -euo pipefail
cd "$(dirname "$0")"
{
  echo "=== S455 deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session455_retire_charles_vol1.sql
  echo "--- audio: uploading pseudepigrapha/3-maccabees (14 files) to R2"
  node _s444_upload_audio.mjs
  echo "=== done $(date)"
} 2>&1 | tee -a _session455_deploy.log
echo
echo "Read the NOTICE lines: BEFORE should say 15 books / 3318 rows; 'moved 3 Maccabees'; 'books deleted: 14, kept: 0'; 'edition apocrypha-charles-vol1 deleted'."
echo "Any 'KEPT ... referenced by' line names a book a partner has a bookmark/note on — it stays in the DB, hidden by the reader filter. Tell Claude next session."
echo "Then read back:  python3 ~/Desktop/App/_s455_check.py"
echo
echo "The site/app changes (data JSONs, seed.py) go live with the next build + push. This commits them; the push is yours:"
echo "  cd ~/Desktop/App && git add -A && git commit -m 'S455: retire apocrypha-charles-vol1 (OCR); 3 Maccabees into pseudepigrapha, verified vs Brenton 1851' && git push"
