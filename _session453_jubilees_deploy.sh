#!/usr/bin/env bash
# S453 deploy — Jubilees split-verse fix (files + live database; no app rebuild needed).
# Run from Terminal on the Mac:  bash ~/Desktop/App/_session453_jubilees_deploy.sh
#
# What it does, in order (each step is safe to re-run):
#  1. Backs up the two originals as .pre-s453 (only if no backup exists yet).
#  2. Moves the fixed text and the fixed JSON OVER the originals:
#       source-texts/existing-restored-editions/Jubilees-Restored-Names-Edition.txt
#       source-texts/parsed/jubilees.json
#     (staged copies in source-texts/jubilees-charles-1917/ are removed — no v2 copies left behind)
#  3. Applies session453_jubilees_fix.sql to the live DB (276 verses get their own row,
#     242 rows trimmed to their first verse, 24 stray footnote digits gone; ids kept).
#  4. Applies session453b_jubilees_xref_sort.sql (102 cards moved to the verse they quote).
# Logs: _session453_jubilees_deploy.log
set -euo pipefail
cd "$(dirname "$0")"
ST=source-texts/jubilees-charles-1917
TXT=source-texts/existing-restored-editions/Jubilees-Restored-Names-Edition.txt
JSON=source-texts/parsed/jubilees.json
{
  echo "=== S453 Jubilees deploy $(date)"
  if [ -f "$ST/Jubilees-Restored-Names-Edition.fixed.txt" ]; then
    [ -f "$TXT.pre-s453" ] || cp "$TXT" "$TXT.pre-s453"
    mv "$ST/Jubilees-Restored-Names-Edition.fixed.txt" "$TXT"
    echo "landed fixed text over $TXT (backup .pre-s453)"
  else echo "text already landed"; fi
  if [ -f "$ST/jubilees.fixed.json" ]; then
    [ -f "$JSON.pre-s453" ] || cp "$JSON" "$JSON.pre-s453"
    mv "$ST/jubilees.fixed.json" "$JSON"
    echo "landed fixed JSON over $JSON (backup .pre-s453)"
  else echo "JSON already landed"; fi
  python3 -c "import json;d=json.load(open('$JSON'));c=d['books'][0]['chapters'];print('parsed/jubilees.json:',len(c),'chapters',sum(len(x['verses']) for x in c),'verses (expect 50 / 1307)')"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session453_jubilees_fix.sql
  python3 api/apply_migration.py data-schema/migrations/session453b_jubilees_xref_sort.sql
  echo "=== done $(date)"
} 2>&1 | tee -a _session453_jubilees_deploy.log
echo
echo "Read the NOTICE lines: BEFORE should say 1031, AFTER 1307; 'cards moved: 102'."
echo "Audio (voices come last — run only when you get to that lane):  node ~/Desktop/App/_s453_jubilees_audio_redo.mjs"
