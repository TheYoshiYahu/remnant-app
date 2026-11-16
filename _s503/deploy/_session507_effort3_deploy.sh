#!/usr/bin/env bash
# S507 deploy — effort3: session507_effort-over-accomplishment.sql — the three effort-over-accomplishment cards (2519, 2520, 2521) whose SOURCE
# book name went into the deployed note as a slug ("(the-prayer-of-manasseh 1:11)", "(baruch-with-the-letter-of-jeremiah 1:15)"); prose unchanged,
# note re-composed with the book name. Then re-dumps the four books those cards touch AND the six stale dumps g6 skipped (zero-hit dumps:
# job, leviticus, revelation, romans, zechariah, 1-enoch), then check503c on the merged read-back (S503_FIX=sweep507).
# Live database only; no app rebuild, no Render push, nothing deleted. Safe to re-run. Model: Claude Fable 5.1.
# Run from Terminal on the Mac:  bash ~/Desktop/App/_s503/deploy/_session507_effort3_deploy.sh      Log: _session507_effort3_deploy.log (never git-added)
set -euo pipefail
cd "$(dirname "$0")/../.."
{
  echo "=== S507 effort3 deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session507_effort-over-accomplishment.sql
  echo "--- read-backs from the live database"
  for b in "apocrypha baruch-with-the-letter-of-jeremiah" "apocrypha the-prayer-of-manasseh" "canon daniel" "canon ezekiel" "canon job" "canon leviticus" "canon revelation" "canon romans" "canon zechariah" "enoch 1-enoch"; do python3 _s503/tools/dump503.py $b; done
  S503_FIX=sweep507 python3 _s503/tools/check506.py effort-over-accomplishment _s495/live
  python3 _s503/tools/shorthand_census.py | sed -n 3,3p
  echo "=== done $(date)"
} 2>&1 | tee -a _session507_effort3_deploy.log
echo
echo "The check line must end PASS (0 problem(s)). If the migration RAISED, nothing landed — tell Claude."
