#!/usr/bin/env bash
# S506 — run506_group.sh <group> <slug>... : for each thread, build503c on the merged read-back (drafts in out/sweep506, fix to fix/sweep506),
# gen_sql503c (session506_<short>.sql → data-schema/migrations), then the read file out/s506_<group>_read.md and the deploy paste
# deploy/_session506_<group>_deploy.sh. Stops at the first build FAIL. Model: Claude Fable 5.1.
set -euo pipefail
cd "$(dirname "$0")/../.."
G="$1"; shift
for s in "$@"; do
  echo "=== build $s"
  python3 _s503/tools/prep506.py "$s"
  S503_OUT=sweep506 S503_FIX=sweep506 python3 _s503/tools/build503c.py "$s" "_s503/out/packet506/${s}_readback.json" | grep -E "FAIL|WARN|^result" || true
  test -f "_s503/fix/sweep506/$s.json" || { echo "build503c FAIL for $s — stop"; exit 1; }
  S503_FIX=sweep506 S503_TAG=506 python3 _s503/tools/gen_sql503c.py "$s" | sed 's#->.*##'
done
cp _s503/sql/session506_*.sql data-schema/migrations/
python3 - "$G" "$@" <<'PY'
import json, sys
G, S = sys.argv[1], sys.argv[2:]
L = [f'# S506 group {G} — member cards rewritten (read before the paste `_s503/deploy/_session506_{G}_deploy.sh`)', '', 'Summaries unchanged (S503). Each card: the NOTE the reader sees on the verse, then the MEMBER line on the thread page.', '']
for s in S:
    fx = json.load(open(f'_s503/fix/sweep506/{s}.json')); L.append(f"\n## `{s}` — {len(fx['cards'])} cards\n")
    for c in fx['cards']:
        L += [f"**card {c['id']}** — {c['s_book']} {c['src_ch']}:{c['src_vn']} → {c['tgt_book']} {c['tgt_ch']}:{c['tgt_vn']}", f"- NOTE: {c['note']}", f"- MEMBER: {c['member_note']}", f"- (was: {c['old_note']})", '']
open(f'_s503/out/s506_{G}_read.md', 'w').write('\n'.join(L)); print('read file:', f'_s503/out/s506_{G}_read.md')
PY
python3 _s503/tools/gen_deploy506.py "$G" "$@"
md5sum data-schema/migrations/session506_*.sql | awk '{print $1, substr($2, 24)}'
