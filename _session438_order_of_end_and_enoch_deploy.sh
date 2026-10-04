#!/usr/bin/env bash
# S435-S438 deploy — order-of-the-end cross-reference fixes + Enoch 91-93 rebuild.
# DATABASE ONLY. No app rebuild needed. Each migration is its own transaction;
# the script stops at the first failure (nothing half-applied inside a file).
#
# Run from Terminal on the Mac:  bash ~/Desktop/App/_session438_order_of_end_and_enoch_deploy.sh
#
#   435a  Tanakh cards brought into the settled order (21 notes, 11 threads, 14 members)
#   435b  NT + extra-canonical cards (incl. 1 Cor 15:52; 17 notes, 10 threads, 14 members)
#   436   9 new witness cards + thread (Isaiah 26, 2 Esdras 13, Isaiah 24, Testaments, Jeremiah 4)
#   437   removes the 1 Thess 4:17 -> Matthew 24:31 pairing
#   438   rebuilds 1 Enoch 91, 92, 93 to the true Charles text
set -euo pipefail
cd "$(dirname "$0")"
python3 -c "import asyncpg" 2>/dev/null || pip3 install asyncpg --break-system-packages -q || pip3 install asyncpg -q
for f in \
  session435a_tanakh_order_of_end_xref_corrections.sql \
  session435b_nt_extras_order_of_end_xref_corrections.sql \
  session436_order_of_end_new_witness_xrefs.sql \
  session437_remove_1thess4_17_matthew24_31_pairing.sql \
  session438_enoch_91_93_rebuild.sql ; do
  echo "=== applying $f"
  python3 api/apply_migration.py "data-schema/migrations/$f"
done
echo "=== all five applied."
