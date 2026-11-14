"""S496 — gen_deploy496.py <batch>  →  deploy/_session496_<book>_<batch>_deploy.sh
The script Yoshi pastes into Terminal on the Mac (his shell reaches the Render Postgres; ours does not): applies
data-schema/migrations/session496_matthew_<batch>_rebuild.sql through api/apply_migration.py, then reads the book back from the live
database (tools/dump496.py) and runs tools/check496.py on that read-back as its own proof, logging to _session496_matthew_<batch>_deploy.log.
Model: Claude Fable 5.1 (claude-fable-5-1)."""
import json, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common496 import *

def main(batch):
    book, chapters = BATCHES[batch]; stem = f'{book}_{batch}'; fx = json.load(open(W6 / 'fix' / f'{stem}.json')); BK = TITLES[book]
    nc, nt, na, nm = len(fx['cards']), len(fx['threads']), len(fx['anchors']), len(fx['members']); chs = f"{min(fx['chapters'])}–{max(fx['chapters'])}"
    sh = f"""#!/usr/bin/env bash
# S496 deploy — canon / {BK} {chs} — Phase 2 REBUILD batch {batch}:
# {nc} orphan cards rewritten in place (Come-and-See, both verses; ids kept), {nt} new threads, {na} unanchored threads anchored, {nm} thread members added.
# Live database only; no app rebuild, no Render push, nothing deleted. Safe to re-run (second run: 0 rewritten / 0 inserted / 0 anchored).
# Needs, under ~/Desktop/App:  data-schema/migrations/session496_{stem}_rebuild.sql · _s496/tools/ · _s496/fix/{stem}.json · _s495/tools/ (common495, dump495)
# Run from Terminal on the Mac:  bash ~/Desktop/App/_session496_{stem}_deploy.sh        Log: _session496_{stem}_deploy.log (never git-added)
set -euo pipefail
cd "$(dirname "$0")"
{{
  echo "=== S496 {BK} {chs} rebuild deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session496_{stem}_rebuild.sql
  echo "--- read-back from the live database"
  mkdir -p _s496/scratch
  python3 _s496/tools/dump496.py {book} _s496/scratch/{stem}_live_after.json
  python3 _s496/tools/check496.py {batch} _s496/scratch/{stem}_live_after.json
  echo "=== done $(date)"
}} 2>&1 | tee -a _session496_{stem}_deploy.log
echo
echo "The read-back above is the proof. Expected:"
echo "  'notes rewritten as written: {nc}/{nc}', 'members landed as written: {nm}/{nm}', 'new threads landed as written: {nt}/{nt}', 'anchors set as written: {na}/{na}',"
echo "  'duplicate (src,tgt,source) pairs in {book}: 0', chapters {chs} each with 'orphans left' 0, and 'check496 {book} {batch}: PASS (0 problem(s))'."
echo "If the migration RAISED ('differs from the read-back' / 'already sits in a thread' / 'different anchor'), the live data moved since the dump: nothing landed — re-dump and rebuild, do not force it."
"""
    DEP = W6 / 'deploy'; DEP.mkdir(exist_ok=True); out = DEP / f'_session496_{stem}_deploy.sh'; out.write_text(sh); out.chmod(0o755); print('wrote', out)
if __name__ == '__main__': main(sys.argv[1])
