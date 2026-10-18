#!/usr/bin/env bash
# S450 deploy — Jasher text fix (files + live database; no app rebuild needed).
# Run from Terminal on the Mac:  bash ~/Desktop/App/_session450_jasher_deploy.sh
#
# What it does, in order (each step is safe to re-run):
#  1. Backs up the two originals as .pre-s450 (only if no backup exists yet).
#  2. Moves the fixed text and the re-parsed JSON OVER the originals:
#       source-texts/existing-restored-editions/Jasher-Restored-Names-Edition.txt
#       source-texts/parsed/jasher.json
#     (staged copies in source-texts/jasher-noah-1840/ are removed — no v2 copies left behind)
#  3. Applies session450_jasher_fix.sql to the live DB (85 verses restored, 13 verse
#     texts corrected, 34 chapter titles completed; ids kept).
#  4. Applies session450b_jasher_xref_sort.sql (20 cards + 7 thread anchors moved off
#     the three former blob verses to the verses they describe).
# Logs: _session450_jasher_deploy.log
set -euo pipefail
cd "$(dirname "$0")"
ST=source-texts/jasher-noah-1840
TXT=source-texts/existing-restored-editions/Jasher-Restored-Names-Edition.txt
JSON=source-texts/parsed/jasher.json
{
  echo "=== S450 Jasher deploy $(date)"
  if [ -f "$ST/Jasher-Restored-Names-Edition.fixed.txt" ]; then
    [ -f "$TXT.pre-s450" ] || cp "$TXT" "$TXT.pre-s450"
    mv "$ST/Jasher-Restored-Names-Edition.fixed.txt" "$TXT"
    echo "landed fixed text over $TXT (backup .pre-s450)"
  else echo "text already landed"; fi
  if [ -f "$ST/jasher.fixed.json" ]; then
    [ -f "$JSON.pre-s450" ] || cp "$JSON" "$JSON.pre-s450"
    mv "$ST/jasher.fixed.json" "$JSON"
    echo "landed re-parsed JSON over $JSON (backup .pre-s450)"
  else echo "JSON already landed"; fi
  python3 -c "import json;d=json.load(open('$JSON'));c=d['books'][0]['chapters'];print('parsed/jasher.json:',len(c),'chapters',sum(len(x['verses']) for x in c),'verses (expect 91 / 3910)')"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session450_jasher_fix.sql
  python3 api/apply_migration.py data-schema/migrations/session450b_jasher_xref_sort.sql
  echo "=== done $(date)"
} 2>&1 | tee -a _session450_jasher_deploy.log
echo
echo "Next (when the recorder is idle):  node ~/Desktop/App/_s450_jasher_audio_redo.mjs"
