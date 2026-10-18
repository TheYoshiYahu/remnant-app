#!/bin/bash
# S448 — downloads R.H. Charles's 1917 Book of Enoch, chapter pages, from
# sacred-texts.com (public domain) as the clean base for rebuilding the
# Enoch Restored Names Edition. Run on the Mac:
#   bash ~/Desktop/App/source-texts/enoch-charles-1917/fetch.sh
cd "$(dirname "$0")/html"
ok=0
for n in $(seq 1 120); do
  f="boe$(printf %03d $n).htm"
  [ -s "$f" ] && { ok=$((ok+1)); continue; }
  code=$(curl -s -L -A "Mozilla/5.0" -o "$f" -w "%{http_code}" "https://sacred-texts.com/bib/boe/$f")
  if [ "$code" = "200" ] && [ -s "$f" ]; then ok=$((ok+1)); printf "."; else rm -f "$f"; fi
done
echo
echo "Saved $ok pages. Chapters found:"
grep -h -o -i -E "<h[1-4][^>]*>[^<]*chapter[^<]*" boe*.htm | sed -E 's/<[^>]*>//' | wc -l
echo "Done. Tell Claude the pages are in source-texts/enoch-charles-1917/html."
