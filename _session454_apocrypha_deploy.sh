#!/usr/bin/env bash
# S454 deploy — Apocrypha (KJV 1611 edition) audit fix (files + live database; no app rebuild needed).
# Run from Terminal on the Mac:  bash ~/Desktop/App/_session454_apocrypha_deploy.sh
#
# What it does, in order (each step is safe to re-run):
#  1. Backs up the two originals as .pre-s454 (only if no backup exists yet).
#  2. Moves the fixed text and the fixed JSON OVER the originals:
#       source-texts/existing-restored-editions/Apocrypha-Restored-Names-Edition.txt
#       source-texts/parsed/apocrypha.json
#     (staged copies in source-texts/apocrypha-kjv-ebible/ are removed — no v2 copies left behind)
#  3. Applies session454_apocrypha_fix.sql to the live DB (Rest of Esther 10 split to vv.4-13, id kept;
#     two 1611 marginal notes, one stray glyph, one doubled word removed; 5,711 -> 5,720 rows).
#  4. Applies session454b_apocrypha_xref_sort.sql (12 cards + 4 thread anchors moved to the verse they cite).
# Logs: _session454_apocrypha_deploy.log
set -euo pipefail
cd "$(dirname "$0")"
ST=source-texts/apocrypha-kjv-ebible
TXT=source-texts/existing-restored-editions/Apocrypha-Restored-Names-Edition.txt
JSON=source-texts/parsed/apocrypha.json
{
  echo "=== S454 Apocrypha deploy $(date)"
  if [ -f "$ST/Apocrypha-Restored-Names-Edition.fixed.txt" ]; then
    [ -f "$TXT.pre-s454" ] || cp "$TXT" "$TXT.pre-s454"
    mv "$ST/Apocrypha-Restored-Names-Edition.fixed.txt" "$TXT"
    echo "landed fixed text over $TXT (backup .pre-s454)"
  else echo "text already landed"; fi
  if [ -f "$ST/apocrypha.fixed.json" ]; then
    [ -f "$JSON.pre-s454" ] || cp "$JSON" "$JSON.pre-s454"
    mv "$ST/apocrypha.fixed.json" "$JSON"
    echo "landed fixed JSON over $JSON (backup .pre-s454)"
  else echo "JSON already landed"; fi
  python3 -c "import json;d=json.load(open('$JSON'));n=sum(len(c['verses']) for b in d['books'] for c in b['chapters']);print('parsed/apocrypha.json:',len(d['books']),'books',n,'verses (expect 14 / 5720)')"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session454_apocrypha_fix.sql
  python3 api/apply_migration.py data-schema/migrations/session454b_apocrypha_xref_sort.sql
  echo "=== done $(date)"
} 2>&1 | tee -a _session454_apocrypha_deploy.log
echo
echo "Read the NOTICE lines: BEFORE should say 5711, AFTER 5720; 'cards moved: 12'; 'cards still on Rest of Esther 10:4: 0'."
echo "Then read back:  python3 ~/Desktop/App/_s454_apocrypha_check.py"
echo "Audio (voices come last — run only when you get to that lane):  node ~/Desktop/App/_s454_apocrypha_audio_redo.mjs"
