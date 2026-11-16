"""S503 — gen_deploy503.py → deploy/_session503_stragglers_deploy.sh — the script Yoshi pastes into Terminal on the Mac (his shell reaches the Render
Postgres; ours does not): applies data-schema/migrations/session503_stragglers_rebuild.sql through api/apply_migration.py, re-dumps the eight books
from the live database (tools/dump503.py, overwriting _s495/live/) and runs tools/check503.py on them as its own proof, logging to
_session503_stragglers_deploy.log. Model: Claude Fable 5.1 (claude-fable-5-1)."""
import json, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common503 import *
fx = json.load(open(W3 / 'fix' / 'stragglers503.json')); nc, nm = len(fx['cards']), len(fx['members'])
books = ' '.join(f"{e}/{b}" for e, b in fx['books'])
sh = f"""#!/usr/bin/env bash
# S503 deploy — the STRAGGLERS: the last {nc} orphan cross-reference cards outside the gospels (Joshua, Revelation, Romans, 1 Thessalonians, Genesis,
# Ezekiel, 2 Esdras, 2 Baruch) rewritten in place (Come-and-See, both verses; ids kept) and threaded ({nm} members). 0 new threads, 0 anchors.
# Live database only; no app rebuild, no Render push, nothing deleted. Safe to re-run (second run: 0 rewritten / 0 inserted).
# Needs, under ~/Desktop/App:  data-schema/migrations/session503_stragglers_rebuild.sql · _s503/tools/ · _s503/fix/stragglers503.json · _s496/tools/ · _s495/tools/
# Run from Terminal on the Mac:  bash ~/Desktop/App/_s503/deploy/_session503_stragglers_deploy.sh        Log: _session503_stragglers_deploy.log (never git-added)
set -euo pipefail
cd "$(dirname "$0")/../.."
{{
  echo "=== S503 stragglers deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session503_stragglers_rebuild.sql
  echo "--- read-back from the live database (eight books)"
  for eb in {books}; do python3 _s503/tools/dump503.py "${{eb%/*}}" "${{eb#*/}}"; done
  python3 _s503/tools/check503.py
  echo "--- Matthew re-dumped too (the re-point pass and the summaries sweep build on it)"
  python3 _s503/tools/dump503.py canon matthew
  echo "=== done $(date)"
}} 2>&1 | tee -a _session503_stragglers_deploy.log
echo
echo "The read-back above is the proof. Expected: 'notes rewritten as written: {nc}/{nc}', 'members landed as written: {nm}/{nm}', every book 'orphans left' 0,"
echo "and 'check503 stragglers: PASS (0 problem(s))'. If the migration RAISED ('differs from the read-back' / 'already sits in a thread'), the live data moved"
echo "since the dump: nothing landed — re-dump and rebuild, do not force it."
"""
out = W3 / 'deploy' / '_session503_stragglers_deploy.sh'; out.write_text(sh); out.chmod(0o755); print('wrote', out)
