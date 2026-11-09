#!/usr/bin/env bash
# S495 deploy — edition `pseudepigrapha` / book `testaments-xii` — Phase 2 gap fill for chapters 2, 7, 8, 16, 17, 23, 27, 28, 31, 33, 37, 38, 39, 40, 41, 42, 43, 44, 62, 63, 81, 85, 92, 94, 110, 115, 117, 122, 123, 124, 126:
# 101 new cards (tier 'free'), 29 new threads, 1 existing thread(s) joined, 101 thread members.
# Live database only; no app rebuild, no Render push. Safe to re-run (second run: 0 inserted, everything already landed).
# Files this expects under ~/Desktop/App (copy them there first):
#   data-schema/migrations/session495_testaments-xii_gap_fill.sql
#   _s495/tools/common495.py  _s495/tools/check495.py  _s495/tools/dump495.py   (the tools folder of the S495 chain, copied whole)
#   _s495/fix/testaments-xii.json                                                        (what check495 compares the live rows against)
#   _s495/parsed/canon.json (+ the other parsed editions — check495 only needs them for the English-name table; canon.json is enough)
# Run from Terminal on the Mac:  bash ~/Desktop/App/_session495_testaments-xii_deploy.sh      Log: _session495_testaments-xii_deploy.log (gitignored)
set -euo pipefail
cd "$(dirname "$0")"
export S495_HOME="$PWD/_s495"
{
  echo "=== S495 testaments-xii gap-fill deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session495_testaments-xii_gap_fill.sql
  echo "--- read-back from the live database"
  python3 _s495/tools/dump495.py testaments-xii _s495/scratch/testaments-xii_live_after.json
  python3 _s495/tools/check495.py testaments-xii _s495/scratch/testaments-xii_live_after.json
  echo "=== done $(date)"
} 2>&1 | tee -a _session495_testaments-xii_deploy.log
echo
echo "apply_migration.py does not show the migration's NOTICE lines; the read-back above is the proof. Expected:"
echo "  'cards landed as written: 101/101', 'threads landed as written: 29/29', 'members landed as written: 101/101',"
echo "  'duplicate (src,tgt,source) pairs in testaments-xii: 0', every gap chapter row (2, 7, 8, 16, 17, 23, 27, 28, 31, 33, 37, 38, 39, 40, 41, 42, 43, 44, 62, 63, 81, 85, 92, 94, 110, 115, 117, 122, 123, 124, 126) with cards >= 1, and 'check495 testaments-xii: PASS (0 problem(s))'."
echo "If the migration RAISED 'differs from the read-back', the live text moved since the Nov 8 dump: nothing landed — re-dump and rebuild, do not force it."
