"""S506 — gen_deploy506.py <name> <slug>... → deploy/_session506_<name>_deploy.sh: Yoshi's paste for a Phase-3 member-card group. For each thread:
applies data-schema/migrations/session506_<short>.sql; then re-dumps every book that contributed members to the thread's merged read-back, rebuilds
the merged read-backs (packet506.py, read-only) and runs check503c against them (S503_FIX=sweep506). Log: _session506_<name>_deploy.log (never git-added).
Model: Claude Fable 5.1 (claude-fable-5-1)."""
import sys, json, re
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common503 import *
name = sys.argv[1]; slugs = sys.argv[2:]; books = set(); migs = []
def short(slug): return '-'.join(slug.split('-')[:4])
for slug in slugs:
    fx = json.load(open(W3 / 'fix' / 'sweep506' / f'{slug}.json'))                       # must exist: build503c PASS
    migs.append(f'session506_{short(slug)}.sql'); assert (W3.parent / 'data-schema' / 'migrations' / migs[-1]).exists(), migs[-1] + ' not in data-schema/migrations'
    rb = json.load(open(W3 / 'out' / 'packet506' / f'{slug}_readback.json'))
    books |= {m.group(1) for m in re.finditer(r"(\w+__[\w-]+) \(\d+\)", rb['schema_note'])}
applies = '\n'.join(f'  python3 api/apply_migration.py data-schema/migrations/{m}' for m in migs)
dumps = '\n'.join(f'  python3 _s503/tools/dump503.py {b.split("__")[0]} {b.split("__")[1]}' for b in sorted(books))
checks = '\n'.join(f'  python3 _s503/tools/check506.py {s} _s495/live' for s in slugs)
sh = f"""#!/usr/bin/env bash
# S506 deploy — {name}: {len(migs)} migration(s): {', '.join(migs)}.
# Live database only; no app rebuild, no Render push, nothing deleted. Safe to re-run (second run: 0 everywhere).
# Run from Terminal on the Mac:  bash ~/Desktop/App/_s503/deploy/_session506_{name}_deploy.sh        Log: _session506_{name}_deploy.log (never git-added)
set -euo pipefail
cd "$(dirname "$0")/../.."
{{
  echo "=== S506 {name} deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
{applies}
  echo "--- read-backs from the live database"
{dumps}
{checks}
  echo "=== done $(date)"
}} 2>&1 | tee -a _session506_{name}_deploy.log
echo
echo "The read-back above is the proof: every check line must end PASS (0 problem(s)). If a migration RAISED, nothing of it landed — tell Claude; re-dump and rebuild, do not force it."
"""
out = W3 / 'deploy' / f'_session506_{name}_deploy.sh'; out.write_text(sh); out.chmod(0o755); print('wrote', out, '| books re-dumped:', sorted(books))
