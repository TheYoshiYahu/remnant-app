URL=$(python3 -c "from pathlib import Path; print([l for l in Path('/tmp/repair-wt/api/.env').read_text().splitlines() if l.startswith('DATABASE_URL=')][0].split('=',1)[1].strip().strip('\"').strip(\"'\"))")
case "$URL" in *sslmode*) ;; *\?*) URL="$URL&sslmode=require";; *) URL="$URL?sslmode=require";; esac
for i in $(seq 1 60); do
  R=$(psql "$URL" -tAc "select 1;" 2>&1)
  if [ "$R" = "1" ]; then echo "ONLINE at attempt $i ($(date))" > /tmp/repair-wt/scratch_repair/DB_STATUS.txt; exit 0; fi
  sleep 30
done
echo "STILL_BLOCKED after 30min ($(date))" > /tmp/repair-wt/scratch_repair/DB_STATUS.txt
