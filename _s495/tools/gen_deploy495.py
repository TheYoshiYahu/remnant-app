"""S495 — gen_deploy495.py <book>  →  deploy/_session495_<book>_deploy.sh
The script Yoshi pastes into Terminal on the Mac (his shell reaches the Render Postgres; ours does not). Modeled on
ref/_session463f_sweep_deploy.sh: runs from ~/Desktop/App, applies data-schema/migrations/session495_<book>_gap_fill.sql through
api/apply_migration.py, then dumps the book from the live DB (tools/dump495.py) and runs tools/check495.py on that dump as its own
proof, logging everything to _session495_<book>_deploy.log. Expects these files copied into ~/Desktop/App first (listed in the header).
Model: Claude Fable 5.1 (claude-fable-5-1)."""
import json, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent))
from common495 import *

def main(book):
    fx = load_book_fix(book); ed = fx['edition']; stem = stem_of(book)
    joined = sorted({j['join_slug'] for j in fx['joins']})
    chs = ', '.join(str(c) for c in fx['gap_chapters'])
    sh = f"""#!/usr/bin/env bash
# S495 deploy — edition `{ed}` / book `{book}` — Phase 2 gap fill for chapters {chs}:
# {len(fx['cards'])} new cards (tier '{fx.get('card_tier', 'extras')}'), {len(fx['threads'])} new threads, {len(joined)} existing thread(s) joined, {len(fx['members'])} thread members.
# Live database only; no app rebuild, no Render push. Safe to re-run (second run: 0 inserted, everything already landed).
# Files this expects under ~/Desktop/App (copy them there first):
#   data-schema/migrations/session495_{stem}_gap_fill.sql
#   _s495/tools/common495.py  _s495/tools/check495.py  _s495/tools/dump495.py   (the tools folder of the S495 chain, copied whole)
#   _s495/fix/{stem}.json                                                        (what check495 compares the live rows against)
#   _s495/parsed/canon.json (+ the other parsed editions — check495 only needs them for the English-name table; canon.json is enough)
# Run from Terminal on the Mac:  bash ~/Desktop/App/_session495_{stem}_deploy.sh      Log: _session495_{stem}_deploy.log (gitignored)
set -euo pipefail
cd "$(dirname "$0")"
export S495_HOME="$PWD/_s495"
{{
  echo "=== S495 {book} gap-fill deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session495_{stem}_gap_fill.sql
  echo "--- read-back from the live database"
  python3 _s495/tools/dump495.py {book} _s495/scratch/{stem}_live_after.json
  python3 _s495/tools/check495.py {book} _s495/scratch/{stem}_live_after.json
  echo "=== done $(date)"
}} 2>&1 | tee -a _session495_{stem}_deploy.log
echo
echo "apply_migration.py does not show the migration's NOTICE lines; the read-back above is the proof. Expected:"
echo "  'cards landed as written: {len(fx['cards'])}/{len(fx['cards'])}', 'threads landed as written: {len(fx['threads'])}/{len(fx['threads'])}', 'members landed as written: {len(fx['members'])}/{len(fx['members'])}',"
echo "  'duplicate (src,tgt,source) pairs in {book}: 0', every gap chapter row ({chs}) with cards >= 1, and 'check495 {book}: PASS (0 problem(s))'."
echo "If the migration RAISED 'differs from the read-back', the live text moved since the Nov 8 dump: nothing landed — re-dump and rebuild, do not force it."
"""
    DEP = W / 'deploy'; DEP.mkdir(exist_ok=True)
    out = DEP / f'_session495_{stem}_deploy.sh'; out.write_text(sh); out.chmod(0o755)
    print(f"{book}: wrote {out}")

if __name__ == '__main__':
    if len(sys.argv) < 2: sys.exit(__doc__)
    main(sys.argv[1])
