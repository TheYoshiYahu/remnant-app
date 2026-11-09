#!/usr/bin/env bash
# S495 deploy — edition `pseudepigrapha` / book `adam-eve` — Phase 2 gap fill for chapters 2, 6, 11, 15, 16, 27, 30, 34, 35, 38, 44, 45, 46, 48, 50, 53, 54, 55, 57, 60, 63, 65, 70, 71, 74, 75, 77, 78, 81, 83, 84, 86, 87, 90:
# 69 new cards (tier 'free'), 23 new threads, 11 existing thread(s) joined, 69 thread members.
# Live database only; no app rebuild, no Render push. Safe to re-run (second run: 0 inserted, everything already landed).
# Files this expects under ~/Desktop/App (copy them there first):
#   data-schema/migrations/session495_adam-eve_gap_fill.sql
#   _s495/tools/common495.py  _s495/tools/check495.py  _s495/tools/dump495.py   (the tools folder of the S495 chain, copied whole)
#   _s495/fix/adam-eve.json                                                        (what check495 compares the live rows against)
#   _s495/parsed/canon.json (+ the other parsed editions — check495 only needs them for the English-name table; canon.json is enough)
# Run from Terminal on the Mac:  bash ~/Desktop/App/_session495_adam-eve_deploy.sh      Log: _session495_adam-eve_deploy.log (gitignored)
set -euo pipefail
cd "$(dirname "$0")"
export S495_HOME="$PWD/_s495"
{
  echo "=== S495 adam-eve gap-fill deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session495_adam-eve_gap_fill.sql
  echo "--- read-back from the live database"
  python3 _s495/tools/dump495.py adam-eve _s495/scratch/adam-eve_live_after.json
  python3 _s495/tools/check495.py adam-eve _s495/scratch/adam-eve_live_after.json
  echo "=== done $(date)"
} 2>&1 | tee -a _session495_adam-eve_deploy.log
echo
echo "apply_migration.py does not show the migration's NOTICE lines; the read-back above is the proof. Expected:"
echo "  'cards landed as written: 69/69', 'threads landed as written: 23/23', 'members landed as written: 69/69',"
echo "  'duplicate (src,tgt,source) pairs in adam-eve: 0', every gap chapter row (2, 6, 11, 15, 16, 27, 30, 34, 35, 38, 44, 45, 46, 48, 50, 53, 54, 55, 57, 60, 63, 65, 70, 71, 74, 75, 77, 78, 81, 83, 84, 86, 87, 90) with cards >= 1, and 'check495 adam-eve: PASS (0 problem(s))'."
echo "If the migration RAISED 'differs from the read-back', the live text moved since the Nov 8 dump: nothing landed — re-dump and rebuild, do not force it."
