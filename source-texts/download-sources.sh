#!/bin/bash
# Bulk download of 7 public-domain source-text PDFs from archive.org.
# Total size: ~263 MB. Should complete in 1-3 minutes on a reasonable connection.
# Usage: bash ~/Desktop/App/source-texts/download-sources.sh

set -e
cd ~/Downloads

echo "==> Downloading 7 public-domain source-text PDFs to ~/Downloads ..."
echo ""

declare -a ITEMS=(
  "charles-1913-vol1.pdf|https://archive.org/download/apocryphapseudep01char/apocryphapseudep01char.pdf"
  "charles-1913-vol2.pdf|https://archive.org/download/apocryphapseudep02charuoft/apocryphapseudep02charuoft.pdf"
  "whiston-josephus.pdf|https://archive.org/download/CompleteWorksOfJosephusTranslatedByWilliamWhiston1737/Complete%20Works%20of%20Josephus%20translated%20by%20William%20Whiston%201737.pdf"
  "mr-james-apoc-nt-1924.pdf|https://archive.org/download/JAMESApocryphalNewTestament1924/JAMES_Apocryphal_New_Testament_1924.pdf"
  "lightfoot-apostolic-fathers.pdf|https://archive.org/download/apostolicfathers0101clem/apostolicfathers0101clem.pdf"
  "malan-1882-adam-and-eve.pdf|https://archive.org/download/bookofadameveals00malaiala/bookofadameveals00malaiala.pdf"
  "box-1918-apoc-abraham.pdf|https://archive.org/download/AbrahamBOX1918/Abraham_BOX%201918.pdf"
)

for entry in "${ITEMS[@]}"; do
  name="${entry%|*}"
  url="${entry#*|}"
  if [ -f "$name" ] && [ -s "$name" ]; then
    echo "    [skip] $name already exists ($(du -h "$name" | cut -f1))"
    continue
  fi
  echo "    [pull] $name"
  curl --location --fail --silent --show-error --progress-bar -o "$name" "$url" || {
    echo "    [FAIL] $name"
    continue
  }
done

echo ""
echo "==> Done. Files in ~/Downloads:"
ls -lh charles-1913-vol1.pdf charles-1913-vol2.pdf whiston-josephus.pdf mr-james-apoc-nt-1924.pdf lightfoot-apostolic-fathers.pdf malan-1882-adam-and-eve.pdf box-1918-apoc-abraham.pdf 2>/dev/null
