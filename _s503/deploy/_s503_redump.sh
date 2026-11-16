#!/usr/bin/env bash
# S503 — re-dump the eight straggler books from the LIVE database (read-only; nothing written to the database).
# Overwrites the chain's read-back files _s495/live/<edition>__<book>.json (one copy per book). Log: _s503_redump.log (never git-added).
# Run from Terminal on the Mac:  bash ~/Desktop/App/_s503/deploy/_s503_redump.sh
set -euo pipefail
cd "$(dirname "$0")/../.."
{
  echo "=== S503 re-dump $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  for eb in canon/joshua canon/revelation canon/romans canon/1-thessalonians canon/genesis canon/ezekiel apocrypha/2-esdras pseudepigrapha/2-baruch; do
    python3 _s503/tools/dump503.py "${eb%/*}" "${eb#*/}"
  done
  echo "--- orphan count across the eight"
  python3 _s503/tools/packet503.py
  echo "=== done $(date)"
} 2>&1 | tee -a _s503_redump.log
