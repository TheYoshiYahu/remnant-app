#!/bin/bash
# Download OpenScriptures Strong's Hebrew + Greek lexicon XML for Wheel 1 ingestion
# into strong_entries table. Public domain (Strong's 1890). Pulls into the existing
# strongs-hebrew/ + strongs-greek/ directories.
#
# Usage: bash ~/Desktop/App/source-texts/download-strongs.sh

set -e
cd "$(dirname "$0")"

# OpenScriptures strongs repo (master branch — confirmed at S120 via
# Yoshi's browser screenshot):
#   hebrew/StrongHebrewG.xml          (single ~4MB XML)
#   greek/StrongsGreekDictionaryXML_1.4.zip (zip of per-entry XML files)
# The Greek dictionary is distributed as one entry per XML file, bundled
# into a zip. We download the zip, extract into strongs-greek/, and the
# loader walks every .xml file in that directory.

BASE="https://raw.githubusercontent.com/openscriptures/strongs/master"

echo "==> Downloading OpenScriptures Strong's lexicons ..."
echo ""

# Hebrew — single XML
HEBREW_DEST="strongs-hebrew/StrongHebrewG.xml"
if [ -s "$HEBREW_DEST" ]; then
  echo "    [skip] $HEBREW_DEST already exists ($(du -h "$HEBREW_DEST" | cut -f1))"
else
  echo "    [pull] $HEBREW_DEST"
  curl --location --fail --silent --show-error \
    -o "$HEBREW_DEST" "${BASE}/hebrew/StrongHebrewG.xml"
  echo "    [ok]   $(du -h "$HEBREW_DEST" | cut -f1)"
fi

# Greek — zip of per-entry XML files. Download zip, extract into the
# greek folder, leave the zip in place for re-runs. The zip's internal
# structure puts the XML files at the root (no parent folder), so we
# extract straight into strongs-greek/ and the loader walks every
# G*.xml file in that directory (excluding the StrongHebrewG.xml file
# the Hebrew loader uses — that lives under strongs-hebrew/).
GREEK_ZIP="strongs-greek/StrongsGreekDictionaryXML_1.4.zip"
GREEK_XML_COUNT=$(ls strongs-greek/*.xml 2>/dev/null | wc -l | tr -d ' ')
if [ "$GREEK_XML_COUNT" -gt 100 ]; then
  echo "    [skip] strongs-greek/ already has $GREEK_XML_COUNT XML files"
else
  if [ ! -s "$GREEK_ZIP" ]; then
    echo "    [pull] $GREEK_ZIP"
    curl --location --fail --silent --show-error \
      -o "$GREEK_ZIP" "${BASE}/greek/StrongsGreekDictionaryXML_1.4.zip"
    echo "    [ok]   $(du -h "$GREEK_ZIP" | cut -f1)"
  fi
  echo "    [unzip] $GREEK_ZIP -> strongs-greek/"
  unzip -q -o "$GREEK_ZIP" -d "strongs-greek/"
  NEW_COUNT=$(ls strongs-greek/*.xml 2>/dev/null | wc -l | tr -d ' ')
  echo "    [ok]   $NEW_COUNT XML files now in strongs-greek/"
  if [ "$NEW_COUNT" -eq 0 ]; then
    echo "    [warn] zero XML files at root after extract — check zip structure:"
    unzip -l "$GREEK_ZIP" | head -20
  fi
fi

echo ""
echo "==> Done. State:"
echo "Hebrew: $(ls -lh strongs-hebrew/StrongHebrewG.xml 2>/dev/null | awk '{print $5, $9}' || echo 'MISSING')"
echo "Greek:  $(ls strongs-greek/*.xml 2>/dev/null | wc -l | tr -d ' ') XML files in strongs-greek/"
echo ""
echo "==> Sanity check (Hebrew first ~400 chars):"
head -c 400 strongs-hebrew/StrongHebrewG.xml 2>/dev/null || echo "MISSING"
echo ""
echo ""
echo "==> Sanity check (a sample Greek XML, full content):"
SAMPLE_GREEK=$(ls strongs-greek/G*.xml 2>/dev/null | head -1)
if [ -n "$SAMPLE_GREEK" ]; then
  echo "$SAMPLE_GREEK :"
  cat "$SAMPLE_GREEK"
else
  echo "no G*.xml sample found"
fi
