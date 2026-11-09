#!/usr/bin/env bash
# S495 deploy — edition `enoch` / book `1-enoch` — Phase 2 gap fill for chapters 11, 28, 68, 86, 91, 101, 105, 106, 107:
# 36 new cards (tier 'free'), 7 new threads, 8 existing thread(s) joined, 36 thread members.
# Live database only; no app rebuild, no Render push. Safe to re-run (second run: 0 inserted, everything already landed).
# Files this expects under ~/Desktop/App (copy them there first):
#   data-schema/migrations/session495_1-enoch_gap_fill.sql
#   _s495/tools/common495.py  _s495/tools/check495.py  _s495/tools/dump495.py   (the tools folder of the S495 chain, copied whole)
#   _s495/fix/1-enoch.json                                                        (what check495 compares the live rows against)
#   _s495/parsed/canon.json (+ the other parsed editions — check495 only needs them for the English-name table; canon.json is enough)
# Run from Terminal on the Mac:  bash ~/Desktop/App/_session495_1-enoch_deploy.sh      Log: _session495_1-enoch_deploy.log (gitignored)
set -euo pipefail
cd "$(dirname "$0")"
export S495_HOME="$PWD/_s495"
{
  echo "=== S495 1-enoch gap-fill deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session495_1-enoch_gap_fill.sql
  echo "--- read-back from the live database"
  python3 _s495/tools/dump495.py 1-enoch _s495/scratch/1-enoch_live_after.json
  python3 _s495/tools/check495.py 1-enoch _s495/scratch/1-enoch_live_after.json
  echo "=== done $(date)"
} 2>&1 | tee -a _session495_1-enoch_deploy.log
echo
echo "apply_migration.py does not show the migration's NOTICE lines; the read-back above is the proof. Expected:"
echo "  'cards landed as written: 36/36', 'threads landed as written: 7/7', 'members landed as written: 36/36',"
echo "  'duplicate (src,tgt,source) pairs in 1-enoch: 0', every gap chapter row (11, 28, 68, 86, 91, 101, 105, 106, 107) with cards >= 1, and 'check495 1-enoch: PASS (0 problem(s))'."
echo "If the migration RAISED 'differs from the read-back', the live text moved since the Nov 8 dump: nothing landed — re-dump and rebuild, do not force it."
