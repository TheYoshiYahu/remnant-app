#!/usr/bin/env bash
# S463f deploy — editions `lightfoot-apostolic-fathers` (1–2 Clement, Ignatius ×7, Martyrdom of Polycarp, Didache, Hermas) + `sonnini-acts-29`:
# 180 cards (3 rebuilt Come-and-See, 56 re-pointed to the verse their words sit in, 43 prose fixes, 89 script fixes), 146 member notes,
# 65 thread summaries (+1 title), 8 thread anchors, 2 verse-text typo fixes (Hermas 15:3 / 25:3 'Cod' → 'Elohim (God)').
# Live database only; no app rebuild, no Render push. Safe to re-run (second run: 0 changed, everything already landed).
# Run from Terminal on the Mac:  bash ~/Desktop/App/_session463f_sweep_deploy.sh      Log: _session463f_sweep_deploy.log (gitignored)
set -euo pipefail
cd "$(dirname "$0")"
{
  echo "=== S463f Apostolic Fathers + Sonnini sweep deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session463f_apostolic_fathers_sweep.sql
  python3 api/apply_migration.py data-schema/migrations/session463f_sonnini_sweep.sql
  python3 _s463f_check.py
  echo "=== done $(date)"
} 2>&1 | tee -a _session463f_sweep_deploy.log
echo
echo "apply_migration.py does not show the migration's NOTICE lines; the read-back above is the proof. Expected:"
echo "  'cards landed as written: 180/180 []', 'moved ... 56/56', 'member notes as written: 146/146', 'summaries (+titles) as written: 65/65',"
echo "  'thread anchors moved: 8/8', 'verse texts fixed: 2/2', 'prose phrase quotes ... {STAND: 111, ELSEWHERE: 1}' (the 1 is 51854 citing its neighbour 1:8 on purpose),"
echo "  'canon lead ... {STAND: 514, none: 2}' (the 2 point at Tobit / 2 Maccabees, not the canon), 'rebuilt notes ... 3/3',"
echo "  'degraded markers left: 0 | hyphen-chain prose left: 0 | slug citations left: 0 | Hebrew book names left: 0',"
echo "  'witness italics off at their cited verse: 0 | Hermas 23/24 old-numbering cites left: 0', 'duplicate same-direction pairs: 0'."
