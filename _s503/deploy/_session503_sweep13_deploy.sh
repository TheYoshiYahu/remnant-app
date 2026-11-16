#!/usr/bin/env bash
# S503 deploy — sweep13: 13 Matthew migration(s): session503c_eli-eli-lama-sabachthani.sql, session503c_great-commission-all-nations.sql, session503c_his-blood-be-on.sql, session503c_last-supper-this-is.sql, session503c_parable-of-the-ten.sql, session503c_sanhedrin-trial-tehillim-110.sql, session503c_substantial-crucifixion-tanakh-substances.sql, session503c_teaching-them-to-observe.sql, session503c_the-resurrection-substance-tehillim.sql, session503c_thirty-pieces-of-silver.sql, session503c_trinitarian-baptism-formula-and.sql, session503c_veil-of-the-temple.sql, session503c_women-as-the-first.sql.
# Live database only; no app rebuild, no Render push, nothing deleted. Safe to re-run (second run: 0 everywhere).
# Run from Terminal on the Mac:  bash ~/Desktop/App/_s503/deploy/_session503_sweep13_deploy.sh        Log: _session503_sweep13_deploy.log (never git-added)
set -euo pipefail
cd "$(dirname "$0")/../.."
{
  echo "=== S503 sweep13 deploy $(date)"
  python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
  python3 api/apply_migration.py data-schema/migrations/session503c_eli-eli-lama-sabachthani.sql
  python3 api/apply_migration.py data-schema/migrations/session503c_great-commission-all-nations.sql
  python3 api/apply_migration.py data-schema/migrations/session503c_his-blood-be-on.sql
  python3 api/apply_migration.py data-schema/migrations/session503c_last-supper-this-is.sql
  python3 api/apply_migration.py data-schema/migrations/session503c_parable-of-the-ten.sql
  python3 api/apply_migration.py data-schema/migrations/session503c_sanhedrin-trial-tehillim-110.sql
  python3 api/apply_migration.py data-schema/migrations/session503c_substantial-crucifixion-tanakh-substances.sql
  python3 api/apply_migration.py data-schema/migrations/session503c_teaching-them-to-observe.sql
  python3 api/apply_migration.py data-schema/migrations/session503c_the-resurrection-substance-tehillim.sql
  python3 api/apply_migration.py data-schema/migrations/session503c_thirty-pieces-of-silver.sql
  python3 api/apply_migration.py data-schema/migrations/session503c_trinitarian-baptism-formula-and.sql
  python3 api/apply_migration.py data-schema/migrations/session503c_veil-of-the-temple.sql
  python3 api/apply_migration.py data-schema/migrations/session503c_women-as-the-first.sql
  echo "--- Matthew read-back from the live database"
  python3 _s503/tools/dump503.py canon matthew
  python3 _s503/tools/check503c.py eli-eli-lama-sabachthani-the-tehillim-22-citation-and-the-tehillim-22-as-a-whole-substance
  python3 _s503/tools/check503c.py great-commission-all-nations-as-territories-of-the-scattered-seed-not-categorical-three-categories-substance
  python3 _s503/tools/check503c.py his-blood-be-on-us-and-on-our-children-system-not-people-and-the-yom-kippur-blood-substance
  python3 _s503/tools/check503c.py last-supper-this-is-my-body-this-is-my-blood-of-the-new-testament
  python3 _s503/tools/check503c.py parable-of-the-ten-virgins-oil-substance-as-heart-torah-walking-life
  python3 _s503/tools/check503c.py sanhedrin-trial-tehillim-110-and-daniel-7-self-identification-at-the-kings-own-mouth
  python3 _s503/tools/check503c.py substantial-crucifixion-tanakh-substances-tehillim-22-and-yeshayahu-53-and-zekharyah-12-10
  python3 _s503/tools/check503c.py teaching-them-to-observe-all-things-i-have-commanded-you-heart-torah-closing-the-anti-antinomian-bookend
  python3 _s503/tools/check503c.py the-resurrection-substance-tehillim-16-and-tehillim-22-vindication-substance
  python3 _s503/tools/check503c.py thirty-pieces-of-silver-zekharyah-11-12-13-tanakh-prophetic-fulfillment
  python3 _s503/tools/check503c.py trinitarian-baptism-formula-and-the-name-of-yahusha-in-the-formless-formed-grid
  python3 _s503/tools/check503c.py veil-of-the-temple-rent-and-the-substantial-access-to-the-father-through-the-cross
  python3 _s503/tools/check503c.py women-as-the-first-witnesses-of-the-resurrection-and-the-faithful-witness-substance
  echo "=== done $(date)"
} 2>&1 | tee -a _session503_sweep13_deploy.log
echo
echo "The read-back above is the proof: every check line must end PASS (0 problem(s)). If a migration RAISED, nothing of it landed — tell Claude; re-dump and rebuild, do not force it."
echo
echo "=== Bible app users — baseline (read-only)"
python3 _s503/tools/users_baseline503.py
