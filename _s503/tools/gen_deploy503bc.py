"""S503 — gen_deploy503bc.py <name> <migration.sql>... → deploy/_session503_<name>_deploy.sh: Yoshi's paste for one or more Matthew migrations
(the re-point pass and sweep threads): applies each through api/apply_migration.py, re-dumps Matthew (overwriting _s495/live/canon__matthew.json), runs
check503b and check503c for the fixes present, logs to _session503_<name>_deploy.log. Model: Claude Fable 5.1 (claude-fable-5-1)."""
import sys, json
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common503 import *
name = sys.argv[1]; migs = sys.argv[2:]
checks = []; books = set()
import json
if any('503b' in m for m in migs): checks.append('  python3 _s503/tools/check503b.py')
for m in migs:
    if '503c_' in m:
        sh = Path(m).stem.replace('session503c_', '')
        slug = next(s.stem for s in (W3 / 'fix' / 'sweep').glob('*.json') if s.stem.startswith(sh) and not s.stem.endswith('_report'))
        checks.append(f'  python3 _s503/tools/check503c.py {slug}')
        books.add(json.load(open(W3 / 'out' / 'sweep' / f'{slug}.json'))['anchor_book'])   # S505: re-dump every anchor book, not Matthew only
applies = '\n'.join(f'  python3 api/apply_migration.py data-schema/migrations/{Path(m).name}' for m in migs)
sh = f"""#!/usr/bin/env bash
# S503 deploy — {name}: {len(migs)} migration(s): {', '.join(Path(m).name for m in migs)}.
# Live database only; no app rebuild, no Render push, nothing deleted. Safe to re-run (second run: 0 everywhere).
# Run from Terminal on the Mac:  bash ~/Desktop/App/_s503/deploy/_session503_{name}_deploy.sh        Log: _session503_{name}_deploy.log (never git-added)
set -euo pipefail
cd "$(dirname "$0")/../.."
{{
  echo "=== S503 {name} deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
{applies}
{chr(10).join(f'  echo "--- {b} read-back from the live database"{chr(10)}  python3 _s503/tools/dump503.py canon {b}' for b in sorted(books or {'matthew'}))}
{chr(10).join(checks)}
  echo "=== done $(date)"
}} 2>&1 | tee -a _session503_{name}_deploy.log
echo
echo "The read-back above is the proof: every check line must end PASS (0 problem(s)). If a migration RAISED, nothing of it landed — tell Claude; re-dump and rebuild, do not force it."
"""
out = W3 / 'deploy' / f'_session503_{name}_deploy.sh'; out.write_text(sh); out.chmod(0o755); print('wrote', out)
