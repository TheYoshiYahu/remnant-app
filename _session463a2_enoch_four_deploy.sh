#!/usr/bin/env bash
# S463a2 deploy — retire the 4 S463a question cards (25364, 25399, 25466, 25486): each stands on a 1 Enoch verse
# that no longer says what its note says, and the verse it describes already carries the pairing on another card.
# Live database only; no app rebuild, no Render push. Safe to re-run (second run: 0 retired, 4 already absent).
# Run from Terminal on the Mac:  bash ~/Desktop/App/_session463a2_enoch_four_deploy.sh
# Log: _session463a2_enoch_four_deploy.log
set -euo pipefail
cd "$(dirname "$0")"
{
  echo "=== S463a2 retire-four deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session463a2_enoch_four.sql
  python3 _s463a2_check.py
  echo "=== done $(date)"
} 2>&1 | tee -a _session463a2_enoch_four_deploy.log
echo
echo "Read the last line: expect 'S463a2 read-back: retired 4/4, twins live 4/4'."
