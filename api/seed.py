"""
Seed the parsed editions (Protestant 66 canon + four Restored Names extras)
into the schema.

Reads:
  ~/Desktop/App/source-texts/parsed/canon.json       (free tier — 66/1189/31102)
  ~/Desktop/App/source-texts/parsed/apocrypha.json   (extras — 14/187/5711)
  ~/Desktop/App/source-texts/parsed/enoch.json       (extras — 1/108/1367)
  ~/Desktop/App/source-texts/parsed/jasher.json      (extras — 1/91/3903)
  ~/Desktop/App/source-texts/parsed/jubilees.json    (extras — 1/50/1038)

JSON shape (per the parser, validated 2026-05-10):
    edition := { edition_id, title, source_file, front_matter, books[] }
    book    := { book_id, book_title, chapters[] }
    chapter := { number, title, verses[], commentary }
    verse   := { number, text }

Default behavior is idempotent on the editions/books/chapters/verses
plane: an edition with the same slug gets its books cascade-deleted and
re-loaded fresh. Subscriptions, users, and study-notes are NEVER
touched by this script — those are user data.

Session 154 — canon is excluded by default.
================================================
The S153 emergency was caused by a `--seed-only` run reaching canon and
cascade-wiping every commentary_entries + cross_references row attached
to canon verses (via the old ON DELETE CASCADE FKs). That class of
disaster is now structurally prevented by three layers:

  1. **This script's default**: `--seed-only` (and the implicit no-flag
     default) seeds ONLY the extras editions. Canon is skipped. To
     reload canon, the operator must pass `--reseed-canon` AS AN
     EXPLICIT FLAG.
  2. **Sanity guard below**: even if `--reseed-canon` is passed, if the
     reload would cascade-impact >0 commentary_entries or
     cross_references rows, the script aborts with a clear error and
     instructions to use an in-place UPDATE migration instead (see
     Rule 10 in the standing-rules list — session149_modernize_canon.sql
     is the template). The guard can be overridden with
     `--allow-framework-loss` but the operator must consciously type
     that flag.
  3. **Schema-level FK RESTRICT** (Session 154 migration
     session154_restrict_fks_against_canon_reload.sql): even if seed.py
     defenses are bypassed, the DB-side FKs on
     commentary_entries.{chapter_id, verse_id} +
     cross_references.{source,target}_verse_id +
     cross_reference_thread_members.cross_reference_id are
     ON DELETE RESTRICT, so the cascade physically cannot proceed.

For verse-text content changes (modernization, restoration, typo fixes),
USE AN IN-PLACE UPDATE MIGRATION — never seed.py. Rule 10 (S149) lays
out the pattern; session149_modernize_canon.sql is the template.

Modes:

  --bootstrap     Apply schema.sql to a fresh DB before seeding. Drops
                  and recreates the public schema. NEVER run against
                  prod. Seeds canon + all extras (the fresh-DB case is
                  the only context where canon must seed).
  --seed-only     Skip --bootstrap. (Re)seed the EXTRAS editions only;
                  canon is skipped. This is the safe default for any
                  routine extras republish against an existing DB.
  --reseed-canon  Include canon in the seed pass. Required to reload
                  canon against a populated DB. Triggers the sanity
                  guard — aborts if commentary/cross-reference rows
                  exist on canon verses unless --allow-framework-loss
                  is also passed.
  --allow-framework-loss
                  Suppress the sanity guard. Documents intent that the
                  operator knows --reseed-canon will wipe (via the
                  FK RESTRICT, in practice this will still fail) the
                  framework-bearing apparatus. Use only on a true
                  rebuild-from-zero against a populated DB, and only
                  after consciously deciding that the post-seed
                  loaders will be re-run from scratch.
  --dry-run       Parse the JSON and print the counts that *would* be
                  written; touches no DB.

Run:
  # First-time bring-up against a local Postgres (drops + recreates
  # schema, then seeds canon + all extras):
  createdb remnant_app
  python seed.py --bootstrap

  # Routine extras republish against a populated DB (canon untouched):
  python seed.py --seed-only

  # Canon reload against a populated DB (rare; usually you want a
  # Rule-10 in-place UPDATE migration instead):
  python seed.py --reseed-canon
"""

from __future__ import annotations

import argparse
import asyncio
import json
import re
import sys
from pathlib import Path
from typing import Any

import asyncpg

from config import settings


# Edition slug → profile (witness_category, base, tier, sort_offset, pipeline_version).
# canonical_order is sort_offset + book_index so editions sort predictably:
# canon (0) → apocrypha (200) → enoch (300) → jubilees (310) → jasher (320).
#
# pipeline_version reflects the restoration pipeline that produced the verse
# text in the JSON. The four extras were already restored when published, so
# their JSONs are parses of Yoshi's published Restored Names Editions and
# carry the phase3-v1 stamp (the parser's version, by convention). The
# canon goes through restore.py at ingest time, so it carries the pipeline
# version that ran against it (phase4-v1 in session 13: phase3-v1 + the
# Melchisedec NT-spelling variant added when canon ingest surfaced 9 misses
# in Hebrews 5-7).
EDITION_PROFILES: dict[str, dict[str, Any]] = {
    "canon": {
        "title": "The Holy Bible — King James Version (Restored Names)",
        "public_domain_base": "KJV 1769 Blayney (eBible USFX)",
        "witness_category": "canon",
        "tier_required": "free",
        "sort_offset": 0,
        "pipeline_version": "phase4-v1",
    },
    "apocrypha": {
        "title": "The Apocrypha — Restored Names Edition",
        "public_domain_base": "KJV 1611 Apocrypha",
        "witness_category": "apocrypha",
        # Locked Session 72, 2026-05-17 — the KJV 1611 Apocrypha (14
        # books) sits at the Notes tier ($1.99) per the Section III
        # ship-tier lock. Every paid tier inherits it via the strict-
        # chain lattice in schema.sql Section 9. The Charles 1913 vol 1
        # apocrypha edition (slug 'apocrypha-charles-vol1') is a
        # scholarly parallel of largely the same books and stays at
        # 'extras' per its own profile below.
        "tier_required": "study_notes",
        "sort_offset": 200,
        "pipeline_version": "phase3-v1",
    },
    "enoch": {
        "title": "The Book of Enoch — Restored Names Edition",
        "public_domain_base": "Charles 1912",
        "witness_category": "pseudepigrapha",
        "tier_required": "extras",
        "sort_offset": 300,
        "pipeline_version": "phase3-v1",
    },
    "jubilees": {
        "title": "The Book of Jubilees — Restored Names Edition",
        "public_domain_base": "Charles 1902",
        "witness_category": "pseudepigrapha",
        "tier_required": "extras",
        "sort_offset": 310,
        "pipeline_version": "phase3-v1",
    },
    "jasher": {
        "title": "The Book of Jasher — Restored Names Edition",
        "public_domain_base": "Noah 1840",
        "witness_category": "pseudepigrapha",
        "tier_required": "extras",
        "sort_offset": 320,
        "pipeline_version": "phase3-v1",
    },
    # Josephus — W-3 wire-up landed session 19, 2026-05-11. The historical_
    # witness witness_category is NEW with this entry (extends the enum at
    # schema-bump time; the dry-run path doesn't validate against the live
    # enum since it doesn't talk to the DB). The phase4-v2 pipeline_version
    # captures the possessive-handling patch added to restore.py session 19
    # (the patch stamps onto every text the pipeline touches, but Josephus
    # is the first edition seeded under v2 because the others were last
    # seeded under v1 in session 13 and aren't re-seeded until W-7 anyway).
    # Slug, witness_category, and book-count all locked in
    # _WHISTON_BOUNDARIES.md session 18.
    "josephus": {
        "title": "The Works of Flavius Josephus (Whiston 1737) — Restored Names Edition",
        "public_domain_base": "Whiston 1737",
        "witness_category": "historical_witness",
        "tier_required": "extras",
        "sort_offset": 400,
        "pipeline_version": "phase4-v2",
    },
    # Pseudepigrapha (Charles 1913 vol 2) — W-3 wire-up landed session 23,
    # 2026-05-11. Original W-3 plan: 15 labeled books. S32 scope-lock pared
    # the list to **6 books** (current actual scope, verified S154 Wheel #6
    # audit — _scratch/_s154_pseudepigrapha_audit.md):
    #
    #   1. adam-eve         (The Books of Adam and Eve)
    #   2. testaments-xii   (The Testaments of the XII Patriarchs)
    #   3. 2-enoch          (2 Enoch, The Book of the Secrets of Enoch)
    #   4. 2-baruch         (2 Baruch, The Syriac Apocalypse)
    #   5. 3-baruch         (3 Baruch, The Greek Apocalypse)
    #   6. 4-maccabees      (4 Maccabees)
    #
    # Removed from the original W-3 set by Yoshi decisions S32 / S32-second
    # (authoritative book list: parse_pseudepigrapha_edition.py:BOOKS_IN_ORDER):
    #   * aristeas, sibylline, assumption-moses, psalms-solomon, pirke-aboth
    #     — Bucket C HOLD entries (Yoshi's SOURCE_TEXT_INVENTORY.md decision).
    #   * ahikar, zadokite-fragments — off-manifest (not in Yoshi's source
    #     inventory).
    #   * 4-ezra — duplicate of the apocrypha edition's 2 Esdras (Bensly
    #     fragment in vol 1's Box translation, S23).
    #   * martyrdom-isaiah — migrated to its own edition `ascension-isaiah`
    #     (Charles 1900 composite includes Martyrdom as ch 1-5, locked S32
    #     second pass).
    #
    # Jubilees and 1 Enoch ALSO explicitly HELD per _CHARLES_VOL2_BOUNDARIES.md
    # Decisions §1–§2 (the existing `enoch` and `jubilees` single-book editions
    # stay as-is).
    # `pseudepigrapha` witness_category already in the schema.sql enum
    # (line 106) — enoch/jubilees/jasher already use it; no enum extension
    # needed for this edition. Slug, granularity, edition title, and 15-book
    # boundary all locked in _CHARLES_VOL2_BOUNDARIES.md Decisions §4–§5.
    # sort_offset=360 (was 500 from W-3 wire-up) — re-sequenced S152
    # Wheel #2b so this pseudepigrapha edition sits inside the
    # pseudepigrapha block (enoch sort_offset 300 — first book at 301,
    # jubilees 310/311, jasher 320/321, ascension-isaiah 330/331,
    # adam-eve-conflict 340/341+342, apocalypse-of-abraham 350/351)
    # instead of after josephus (sort_offset 400, books at 401..430).
    # With the new sort_offset and seed.py's start=1 enumeration
    # (insert call at line 557), Charles vol 2's books now land at
    # 361, 362, 363, ... — adjacent to apocalypse-of-abraham at 351.
    # The pre-S152 placement produced the dropdown-vs-search ordering
    # disagreement S151's regression walk caught — the PWA's /read
    # picker (app/src/App.tsx:933 booksByCategory) grouped Charles
    # vol 2's books with the pseudepigrapha block, but search SQL's
    # flat ORDER BY canonical_order ASC put them after Josephus.
    # Live-DB re-sequencing migration:
    # session152_resequence_extras_canonical_order.sql. Clean-DB
    # rebuilds via seed.py now produce the in-block layout directly.
    # pipeline_version=phase4-v2 unchanged from the original wire-up.
    "pseudepigrapha": {
        "title": "The Pseudepigrapha (Charles 1913) — Restored Names Edition",
        "public_domain_base": "Charles 1913 vol 2",
        "witness_category": "pseudepigrapha",
        "tier_required": "extras",
        "sort_offset": 360,
        "pipeline_version": "phase4-v2",
    },
    # Apocrypha (Charles 1913 vol 1) — W-2 wire-up landed session 27,
    # 2026-05-11. NEW edition `apocrypha-charles-vol1` per the session-25
    # Yoshi Decision §1 (clean parallel to vol 2's pattern). 15 labeled
    # books — 1 Esdras, 1/2/3 Maccabees, Tobit, Judith, Sirach, Wisdom of
    # Solomon, 1 Baruch, Epistle of Jeremy, Prayer of Manasses, Song of
    # Three (kept combined per session-26 Yoshi decision), Susanna, Bel
    # and the Dragon, Additions to Esther. All 15 books overlap with the
    # existing wired `apocrypha` edition (Brenton 1851 + KJV-1611 base)
    # EXCEPT 3 Maccabees which is net-new to the pipeline. 4 Ezra is NOT
    # in vol 1 (Charles transferred it to vol 2 per the preface; the
    # existing apocrypha edition's 2 Esdras already carries the Bensly
    # inline-restoration from vol 2's Box translation, session 23).
    # `apocrypha` witness_category already in schema.sql; no enum
    # extension needed. sort_offset=220 (was 550 from W-2 wire-up) —
    # re-sequenced S152 Wheel #2b so this edition lands inside the
    # apocrypha block, immediately after the KJV-1611 apocrypha
    # (sort_offset 200, books at 201..214). With the new sort_offset
    # and seed.py's start=1 enumeration (insert call at line 557),
    # Charles vol 1's books now land at 221, 222, 223, ... — adjacent
    # to the KJV-1611 apocrypha. Pre-S152, the 550 placement put
    # Charles vol 1's books AFTER josephus (sort_offset 400, books
    # at 401..430), so searches surfaced Sirach from this edition
    # after Antiquities even though the PWA picker grouped both
    # apocrypha editions together. The re-sequencing closes the
    # dropdown-vs-search disagreement S151 caught on
    # `righteous man fall seven times`. Live-DB re-sequencing
    # migration: session152_resequence_extras_canonical_order.sql.
    # Clean-DB rebuilds via seed.py now produce the in-block layout
    # directly. pipeline_version=phase4-v2 unchanged from the
    # original wire-up. Slug, granularity, edition title, and 15-book
    # boundary all locked in _CHARLES_VOL1_BOUNDARIES.md Decisions
    # §1–§7 (sessions 25–27); only the sort_offset moved in S152.
    "apocrypha-charles-vol1": {
        "title": "The Apocrypha (Charles 1913) — Restored Names Edition",
        "public_domain_base": "Charles 1913 vol 1",
        "witness_category": "apocrypha",
        "tier_required": "extras",
        "sort_offset": 220,
        "pipeline_version": "phase4-v2",
    },
    # 2026-05-12. NEW edition `mrjames-apocryphal-nt` — session 29 pilot
    # extraction of Montague Rhodes James, *The Apocryphal New Testament*
    # (Oxford, Clarendon Press, 1924). Pilot scope: 11 books (Gospels /
    # Infancy / Passion / Acts / Epistles / Apocalypses sections). Full
    # 50-80 book extraction queued for session 30 once pilot validates.
    # witness_category=apocryphal_gospels — aligned Session 35 to the
    # schema.sql underscore convention; previously declared as
    # `apocryphal-nt`, which is not an enum value. The closest existing
    # schema value (`apocryphal_gospels`, line 108 of schema.sql) covers
    # exactly this material (Mary, James / Protoevangelium, Nicodemus,
    # Peter), so no enum extension is needed. sort_offset=600 places this
    # edition after the apocrypha-charles-vol1 (550). pipeline_version=
    # phase4-v2 matches the other restore.py-3-driven editions.
    "mrjames-apocryphal-nt": {
        "title": "M.R. James, The Apocryphal New Testament (1924) — Restored Names Edition (Pilot)",
        "public_domain_base": "M.R. James 1924",
        "witness_category": "apocryphal_gospels",
        "tier_required": "extras",
        "sort_offset": 600,
        "pipeline_version": "phase4-v2",
    },
    # 2026-05-12. NEW edition `lightfoot-apostolic-fathers` — session 30
    # extraction of J.B. Lightfoot & J.R. Harmer, *The Apostolic Fathers*
    # (London: Macmillan, 1891 single-volume revision). Source: archive.org
    # apostolicfathers00ligh full-text HTML (1.46 MB, OCR clean enough for
    # body-text anchoring). 17 books — 15 traditional Apostolic Fathers
    # entries + Fragments of Papias + Reliques of the Elders in Irenaeus.
    # witness_category=apostolic_fathers — aligned Session 35 to the
    # schema.sql underscore convention; previously declared as
    # `apostolic-fathers`, which is not an enum value. The schema's
    # `apostolic_fathers` (line 107) was added at schema-creation time
    # exactly for this material (Didache, Ignatius, Clement, Polycarp,
    # Hermas, Barnabas) — no enum extension needed. sort_offset=650
    # places this edition after mrjames-apocryphal-nt (600).
    # pipeline_version=phase4-v2 matches the other restore.py-3-driven
    # editions.
    "lightfoot-apostolic-fathers": {
        "title": "J.B. Lightfoot & J.R. Harmer, The Apostolic Fathers (1891) — Restored Names Edition",
        "public_domain_base": "Lightfoot+Harmer 1891",
        "witness_category": "apostolic_fathers",
        "tier_required": "extras",
        "sort_offset": 650,
        "pipeline_version": "phase4-v2",
    },
    # Ascension of Isaiah (Charles 1900) — W-2 wire-up landed session 34,
    # 2026-05-12. NEW edition `ascension-isaiah` per session-32 sourcing:
    # the Vision of Isaiah's seventh-heaven hierarchy in ch 9–10 (Great
    # Glory / Lord / submission / right hand) is a real external structural
    # witness to the Formless/Formed teaching from the voice skill —
    # pre-Nicene, late-1st / early-2nd CE, before the Constantine-era
    # Trinity construct hardened. Yoshi's words at session 32 sourcing:
    # *"your quote of isaih is the first witness ive heard of that aligns
    # with what the spirit revealed to me about the formless father and the
    # formed of the formless... im going to read it next."* Charles 1900
    # full English fetched from earlychristianwritings.com; restore.py
    # applied; parsed as 1 book / 11 chapters / 296 verses. Retired the
    # martyrdom-isaiah fragment that had been in pseudepigrapha-charles-vol2
    # (chapters 1–5 only) — the unified Charles 1900 source now carries the
    # full composite. `pseudepigrapha` witness_category already in
    # schema.sql; no enum extension needed. sort_offset=330 places this
    # edition with the individual-pseudepigrapha cluster (enoch=300,
    # jubilees=310, jasher=320), before the Charles-vol-2 compendium (500).
    # pipeline_version=phase4-v2 matches the other restore.py-driven
    # editions seeded under v2.
    "ascension-isaiah": {
        "title": "The Ascension of Isaiah (Charles 1900) — Restored Names Edition",
        "public_domain_base": "Charles 1900",
        "witness_category": "pseudepigrapha",
        "tier_required": "extras",
        "sort_offset": 330,
        "pipeline_version": "phase4-v2",
    },
    # The First and Second Books of Adam and Eve (The Conflict of Adam
    # and Eve with Satan) — W-2 wire-up landed Session 49, 2026-05-15.
    # NEW edition `adam-eve-conflict`. Ethiopic Christian pseudepigraphon
    # (underlying composition commonly dated 6th c. CE; preserves older
    # Adam-and-Eve traditions). English lineage carried here:
    # Malan & Trumpp 1882 (from the Arabic and Ethiopic) -> Platt 1926
    # (The Forgotten Books of Eden) -> 1995 modernization. Source-base
    # decision (Yoshi, Session 49): the corpus restores language and
    # sacred names regardless, so the modernized Platt register is the
    # accepted base — Book I from Project Gutenberg #398, Book II from
    # the reluctant-messenger.com single-page mirror of the same text,
    # both Chrome-sourced Session 49. The Malan 1882 scan is on disk as a
    # reference scan only (unusable OCR text layer). The Dennis Hawkins
    # 1995 editorial "Prologue" is NOT republished — same standing
    # practice the Sonnini parser applies to the Covenant Publishing
    # introduction. restore.py applied Session 49; parsed by
    # parse_adam_eve_edition.py as 2 books / 101 chapters / 1,242 verses
    # (Book I: 79 ch / 920 vv; Book II: 22 ch / 322 vv).
    # witness_category=pseudepigrapha — already in schema.sql; no enum
    # extension needed. sort_offset=340 places this edition with the
    # individual-pseudepigrapha cluster (enoch=300, jubilees=310,
    # jasher=320, ascension-isaiah=330), before the Charles-vol-2
    # compendium (500). pipeline_version=phase4-v2 matches the other
    # restore.py-driven editions.
    "adam-eve-conflict": {
        "title": ("The First and Second Books of Adam and Eve "
                  "(The Conflict of Adam and Eve with Satan) — "
                  "Restored Names Edition"),
        "public_domain_base": "Malan & Trumpp 1882 / Platt 1926 (modernized)",
        "witness_category": "pseudepigrapha",
        "tier_required": "extras",
        "sort_offset": 340,
        "pipeline_version": "phase4-v2",
    },
    # The Apocalypse of Abraham (Chizayon Avraham) — W-2 wire-up landed
    # Session 50, 2026-05-15. NEW edition `apocalypse-of-abraham`. Jewish
    # pseudepigraphon surviving only in Old Church Slavonic (underlying
    # composition commonly dated late 1st / early 2nd c. CE). English
    # carried here: G. H. Box's 1918 translation (SPCK "Translations of
    # Early Documents"), made with J. I. Landsman from Codex S. Box 1918
    # is public domain; Chrome-sourced to ~/Downloads/box-1918-apoc-
    # abraham.pdf, extracted Session 50. The body/footnote split was
    # hand-verified against the `pdftotext -layout` output for all 51
    # pages of the translation (Box's footnote apparatus is discursive
    # scholarly prose that content-heuristics could not separate cleanly).
    # Box's running headers, page folios, full footnote apparatus,
    # editorial section sub-headings, square-bracket MS-variant markers,
    # and the post-text editorial sections (Additional Notes, Appendices,
    # the long Introduction) are NOT republished — the same standing
    # practice the Sonnini and Adam-Eve parsers apply to their editorial
    # front/back matter. Versification decision (Session 50, Yoshi-
    # delegated): Box 1918 has 32 chapters and NO verse numbers, and no
    # standard public-domain AoA versification exists (the standard line
    # belongs to the copyrighted Cepher / OTP editions, which
    # DOWNLOAD_MANIFEST.md bars republishing) — so sentence-split was
    # adopted (each sentence = one verse; mechanical and reproducible).
    # The incipit/genealogy superscription (Box's "Title" section) is
    # carried as front_matter, preserving Box's 32-chapter structure.
    # restore.py applied Session 50; parsed by
    # parse_apocalypse_abraham_edition.py as 1 book / 32 chapters /
    # 293 verses. witness_category=pseudepigrapha — already in schema.sql;
    # no enum extension needed. sort_offset=350 places this edition with
    # the individual-pseudepigrapha cluster (enoch=300, jubilees=310,
    # jasher=320, ascension-isaiah=330, adam-eve-conflict=340), before
    # the Charles-vol-2 compendium (500). pipeline_version=phase4-v2
    # matches the other restore.py-driven editions.
    "apocalypse-of-abraham": {
        "title": "The Apocalypse of Abraham — Restored Names Edition",
        "public_domain_base": "Box 1918",
        "witness_category": "pseudepigrapha",
        "tier_required": "extras",
        "sort_offset": 350,
        "pipeline_version": "phase4-v2",
    },
    # Acts 29 — The Sonnini Manuscript — W-2 wire-up landed session 48,
    # 2026-05-14. NEW edition `sonnini-acts-29`. The "Long Lost Chapter of
    # Acts" — published 1801, interleaved in a copy of Sonnini's *Travels
    # in Turkey and Greece* (London: Longman & Rees). Public-domain 1801
    # English; the 2011 Covenant Publishing editorial introduction is NOT
    # republished. Source text landed session 16 at
    # source-texts/sonnini-acts-29/sonnini-manuscript-1801.md (26 verses,
    # single chapter); restore.py applied session 48 ->
    # sonnini-acts-29-restored.txt; parsed by
    # parse_sonnini_acts29_edition.py as 1 book / 1 chapter (Chapter 29) /
    # 26 verses. witness_category=disputed_witness — already in the
    # schema.sql enum (line 111), added at schema-creation time
    # specifically for this text per Yoshi's 2026-05-09 inventory note; no
    # enum extension needed. The UI labels it "Acts 29 (Sonnini
    # Manuscript) — disputed authenticity, included for study and
    # discernment." sort_offset=700 places this edition last in canonical
    # order, after lightfoot-apostolic-fathers (650). pipeline_version=
    # phase4-v2 matches the other restore.py-driven editions (restore.py
    # unchanged since session 19's possessive-handling patch).
    "sonnini-acts-29": {
        "title": "Acts 29 — The Sonnini Manuscript (Restored Names Edition)",
        "public_domain_base": "Sonnini 1801",
        "witness_category": "disputed_witness",
        "tier_required": "extras",
        "sort_offset": 700,
        "pipeline_version": "phase4-v2",
    },
}

# Map the JSON's edition_id → seed profile key. Canon listed first so it
# loads first; the order matches the sort_offset progression above.
JSON_FILE_FOR_EDITION = {
    "canon": "canon.json",
    "apocrypha": "apocrypha.json",
    "enoch": "enoch.json",
    "jubilees": "jubilees.json",
    "jasher": "jasher.json",
    "josephus": "josephus.json",
    "pseudepigrapha": "pseudepigrapha-charles-vol2.json",
    "apocrypha-charles-vol1": "apocrypha-charles-vol1.json",
    "mrjames-apocryphal-nt": "mrjames-apocryphal-nt.json",
    "lightfoot-apostolic-fathers": "lightfoot-apostolic-fathers.json",
    "ascension-isaiah": "ascension-isaiah.json",
    "adam-eve-conflict": "adam-eve-conflict.json",
    "apocalypse-of-abraham": "apocalypse-of-abraham.json",
    "sonnini-acts-29": "sonnini-acts-29.json",
}


def slugify(value: str) -> str:
    """Lowercased, dash-separated. Used when a book_id slug isn't already clean."""
    s = value.strip().lower()
    s = re.sub(r"[^a-z0-9]+", "-", s)
    s = re.sub(r"-+", "-", s).strip("-")
    return s or "book"


# ---------- Bootstrap (apply schema.sql) ----------------------------------


async def bootstrap_schema(conn: asyncpg.Connection, schema_sql_path: Path) -> None:
    """Drop and recreate the public schema, then apply schema.sql."""
    print(f"[bootstrap] dropping & recreating schema 'public' on {conn._addr}")
    await conn.execute("DROP SCHEMA IF EXISTS public CASCADE; CREATE SCHEMA public;")
    sql = schema_sql_path.read_text(encoding="utf-8")
    print(f"[bootstrap] applying {schema_sql_path} ({len(sql):,} chars)")
    await conn.execute(sql)
    print("[bootstrap] schema applied")


# ---------- Seed (insert one parsed edition) ------------------------------


async def upsert_edition(
    conn: asyncpg.Connection,
    edition_slug: str,
    edition_doc: dict[str, Any],
    profile: dict[str, Any],
) -> int:
    """
    Insert (or replace) the editions row for this Restored Names edition,
    cascade-deleting any prior books that referenced it.

    Returns the editions.id.
    """
    # If an edition with this slug already exists, drop its books (which
    # cascades to chapters and verses) and update the row in place. The
    # editions row itself is preserved so any subscriptions, etc., that
    # might one day reference editions stay intact.
    existing = await conn.fetchrow(
        "SELECT id FROM editions WHERE slug = $1", edition_slug
    )
    if existing is not None:
        edition_id = existing["id"]
        await conn.execute(
            "DELETE FROM books WHERE edition_id = $1", edition_id
        )
        await conn.execute(
            "UPDATE editions SET title = $1, public_domain_base = $2, "
            "                    front_matter = $3, "
            "                    restoration_pipeline_version = $4::restoration_pipeline_version "
            " WHERE id = $5",
            profile["title"],
            profile["public_domain_base"],
            edition_doc.get("front_matter") or None,
            profile["pipeline_version"],
            edition_id,
        )
        print(f"  [edition] replaced existing '{edition_slug}' (id={edition_id})")
        return edition_id

    edition_id = await conn.fetchval(
        "INSERT INTO editions "
        "  (slug, title, public_domain_base, restoration_pipeline_version, front_matter) "
        "VALUES ($1, $2, $3, $4::restoration_pipeline_version, $5) "
        "RETURNING id",
        edition_slug,
        profile["title"],
        profile["public_domain_base"],
        profile["pipeline_version"],
        edition_doc.get("front_matter") or None,
    )
    print(f"  [edition] inserted '{edition_slug}' (id={edition_id})")
    return edition_id


async def insert_book(
    conn: asyncpg.Connection,
    edition_id: int,
    book: dict[str, Any],
    profile: dict[str, Any],
    book_index: int,
) -> int:
    """Insert one book row and return its id."""
    book_slug = (book.get("book_id") or slugify(book["book_title"])).strip().lower()
    canonical_order = profile["sort_offset"] + book_index
    book_id = await conn.fetchval(
        "INSERT INTO books "
        "  (edition_id, slug, title, short_title, canonical_order, "
        "   witness_category, tier_required, abstract) "
        "VALUES ($1, $2, $3, $4, $5, $6::witness_category, $7::content_tier, $8) "
        "RETURNING id",
        edition_id,
        book_slug,
        book["book_title"],
        None,
        canonical_order,
        profile["witness_category"],
        profile["tier_required"],
        None,
    )
    return book_id


async def insert_chapter(
    conn: asyncpg.Connection,
    book_db_id: int,
    chapter: dict[str, Any],
) -> int:
    """Insert one chapter row, returning its id."""
    chapter_id = await conn.fetchval(
        "INSERT INTO chapters (book_id, chapter_number, chapter_title, chapter_intro) "
        "VALUES ($1, $2, $3, $4) "
        "RETURNING id",
        book_db_id,
        int(chapter["number"]),
        chapter.get("title") or None,
        chapter.get("commentary") or None,
    )
    return chapter_id


async def insert_verses(
    conn: asyncpg.Connection,
    chapter_db_id: int,
    verses: list[dict[str, Any]],
) -> int:
    """Bulk-insert verses for one chapter; returns the row count."""
    if not verses:
        return 0
    rows = [
        (chapter_db_id, int(v["number"]), v["text"])
        for v in verses
        if v.get("text") is not None
    ]
    await conn.executemany(
        "INSERT INTO verses (chapter_id, verse_number, text) VALUES ($1, $2, $3)",
        rows,
    )
    return len(rows)


async def seed_edition(
    conn: asyncpg.Connection,
    parsed_dir: Path,
    edition_slug: str,
) -> dict[str, int]:
    """Load one parsed JSON file end-to-end into the schema."""
    profile = EDITION_PROFILES[edition_slug]
    json_path = parsed_dir / JSON_FILE_FOR_EDITION[edition_slug]
    print(f"[seed] {edition_slug}  <-  {json_path}")
    with json_path.open("r", encoding="utf-8") as fh:
        edition_doc = json.load(fh)

    counts = {"books": 0, "chapters": 0, "verses": 0}
    async with conn.transaction():
        edition_id = await upsert_edition(conn, edition_slug, edition_doc, profile)
        for book_index, book in enumerate(edition_doc.get("books", []), start=1):
            book_db_id = await insert_book(
                conn, edition_id, book, profile, book_index
            )
            counts["books"] += 1
            for chapter in book.get("chapters", []):
                chapter_db_id = await insert_chapter(conn, book_db_id, chapter)
                counts["chapters"] += 1
                counts["verses"] += await insert_verses(
                    conn, chapter_db_id, chapter.get("verses", [])
                )
    print(
        f"  [seed] {edition_slug}: "
        f"{counts['books']} books, {counts['chapters']} chapters, {counts['verses']} verses"
    )
    return counts


# ---------- Dry-run (parse only, no DB) -----------------------------------


def dry_run(parsed_dir: Path) -> int:
    """Parse the JSON and print expected counts. Returns 0 / nonzero."""
    grand = {"editions": 0, "books": 0, "chapters": 0, "verses": 0}
    for edition_slug, json_name in JSON_FILE_FOR_EDITION.items():
        path = parsed_dir / json_name
        if not path.exists():
            print(f"[dry-run] MISSING: {path}", file=sys.stderr)
            return 2
        with path.open("r", encoding="utf-8") as fh:
            doc = json.load(fh)
        n_books = len(doc.get("books", []))
        n_ch = sum(len(b.get("chapters", [])) for b in doc.get("books", []))
        n_v = sum(
            len(c.get("verses", []))
            for b in doc.get("books", [])
            for c in b.get("chapters", [])
        )
        grand["editions"] += 1
        grand["books"] += n_books
        grand["chapters"] += n_ch
        grand["verses"] += n_v
        print(
            f"[dry-run] {edition_slug:12s}  books={n_books:3d}  chapters={n_ch:5d}  verses={n_v:6d}"
        )
    print(
        "[dry-run] TOTAL: "
        f"{grand['editions']} editions, "
        f"{grand['books']} books, "
        f"{grand['chapters']} chapters, "
        f"{grand['verses']} verses"
    )
    return 0


# ---------- Entrypoint ----------------------------------------------------


async def framework_row_counts(conn: asyncpg.Connection) -> dict[str, int]:
    """Count framework-bearing rows that would be lost if canon cascade-deletes.

    Used by the Session 154 sanity guard. Returns row counts for the three
    surfaces the S153 emergency wiped: commentary_entries attached to canon
    chapters or verses, cross_references whose source or target lives in
    canon, and cross_reference_thread_members joined through those xrefs.
    Returns zero counts cleanly if any of the tables don't exist yet (the
    --bootstrap path runs before tables exist, so the guard tolerates
    fresh-DB state).
    """
    counts = {
        "commentary_entries_canon": 0,
        "cross_references_canon": 0,
        "thread_members_canon": 0,
    }
    has_tables = await conn.fetchval(
        "SELECT count(*) FROM information_schema.tables "
        " WHERE table_schema = 'public' "
        "   AND table_name IN ('commentary_entries','cross_references','cross_reference_thread_members')"
    )
    if (has_tables or 0) < 3:
        return counts
    canon_id = await conn.fetchval("SELECT id FROM editions WHERE slug = 'canon'")
    if canon_id is None:
        return counts
    counts["commentary_entries_canon"] = await conn.fetchval(
        """
        SELECT count(*) FROM commentary_entries ce
         WHERE EXISTS (
                 SELECT 1 FROM chapters c JOIN books b ON b.id = c.book_id
                  WHERE b.edition_id = $1 AND c.id = ce.chapter_id
               )
            OR EXISTS (
                 SELECT 1 FROM verses v JOIN chapters c ON c.id = v.chapter_id
                                       JOIN books b ON b.id = c.book_id
                  WHERE b.edition_id = $1 AND v.id = ce.verse_id
               )
        """,
        canon_id,
    )
    counts["cross_references_canon"] = await conn.fetchval(
        """
        SELECT count(*) FROM cross_references x
         WHERE EXISTS (
                 SELECT 1 FROM verses v JOIN chapters c ON c.id = v.chapter_id
                                       JOIN books b ON b.id = c.book_id
                  WHERE b.edition_id = $1
                    AND (v.id = x.source_verse_id OR v.id = x.target_verse_id)
               )
        """,
        canon_id,
    )
    counts["thread_members_canon"] = await conn.fetchval(
        """
        SELECT count(*) FROM cross_reference_thread_members m
          JOIN cross_references x ON x.id = m.cross_reference_id
         WHERE EXISTS (
                 SELECT 1 FROM verses v JOIN chapters c ON c.id = v.chapter_id
                                       JOIN books b ON b.id = c.book_id
                  WHERE b.edition_id = $1
                    AND (v.id = x.source_verse_id OR v.id = x.target_verse_id)
               )
        """,
        canon_id,
    )
    return counts


def editions_to_seed(reseed_canon: bool) -> list[str]:
    """Return the ordered list of edition slugs to seed this run.

    Session 154 — `--seed-only` (and the bareword default) excludes canon
    by default. The operator passes `--reseed-canon` explicitly to bring
    canon back into the seed pass. `--bootstrap` ALWAYS seeds canon
    because a fresh DB needs it.
    """
    return [
        slug for slug in JSON_FILE_FOR_EDITION
        if slug != "canon" or reseed_canon
    ]


async def amain(args: argparse.Namespace) -> int:
    parsed_dir: Path = args.parsed_dir
    if args.dry_run:
        return dry_run(parsed_dir)

    conn = await asyncpg.connect(dsn=settings.database_url)
    try:
        if args.bootstrap:
            await bootstrap_schema(conn, args.schema_sql_path)
            # --bootstrap implies fresh DB; canon must seed.
            reseed_canon = True
        else:
            reseed_canon = args.reseed_canon

        if args.seed_only or args.bootstrap:
            # Sanity guard (Session 154). Triggers when canon is in the
            # seed pass and an existing DB has framework-bearing rows
            # attached to canon verses. The schema-level FK RESTRICT
            # would already block the cascade-delete inside seed_edition,
            # but failing here with a readable message is better than
            # failing on a foreign-key violation deep inside the
            # transaction.
            if reseed_canon and not args.bootstrap:
                counts = await framework_row_counts(conn)
                framework_total = (
                    counts["commentary_entries_canon"]
                    + counts["cross_references_canon"]
                    + counts["thread_members_canon"]
                )
                if framework_total > 0 and not args.allow_framework_loss:
                    print(
                        "\n[seed] ABORT — --reseed-canon would impact "
                        "framework-bearing rows on canon:",
                        file=sys.stderr,
                    )
                    print(
                        f"         commentary_entries (canon-attached): "
                        f"{counts['commentary_entries_canon']}",
                        file=sys.stderr,
                    )
                    print(
                        f"         cross_references (canon source or target): "
                        f"{counts['cross_references_canon']}",
                        file=sys.stderr,
                    )
                    print(
                        f"         cross_reference_thread_members (joined): "
                        f"{counts['thread_members_canon']}",
                        file=sys.stderr,
                    )
                    print(
                        "\n         Session 154 schema FKs are ON DELETE RESTRICT — the "
                        "cascade-delete inside seed_edition() WILL fail with a foreign-key "
                        "violation regardless. This guard reports it earlier with prose.\n"
                        "\n         For verse-text content changes, USE AN IN-PLACE UPDATE "
                        "MIGRATION (Rule 10, S149). Template:\n"
                        "           data-schema/migrations/session149_modernize_canon.sql\n"
                        "\n         If you genuinely need to reload canon from scratch (rare; "
                        "expect to re-run every post-seed loader afterward — S110, S112, "
                        "S110+S131..S146 + S111 + S140b + S147 + S147b), pass "
                        "--allow-framework-loss AFTER first dropping the FKs by hand:\n"
                        "           ALTER TABLE commentary_entries DROP CONSTRAINT "
                        "commentary_entries_chapter_id_fkey, "
                        "DROP CONSTRAINT commentary_entries_verse_id_fkey;\n"
                        "           ALTER TABLE cross_references DROP CONSTRAINT "
                        "cross_references_source_verse_id_fkey, "
                        "DROP CONSTRAINT cross_references_target_verse_id_fkey;\n"
                        "           ALTER TABLE cross_reference_thread_members DROP CONSTRAINT "
                        "cross_reference_thread_members_cross_reference_id_fkey;\n"
                        "         (and re-create them per data-schema/schema.sql afterward).",
                        file=sys.stderr,
                    )
                    return 9

            for edition_slug in editions_to_seed(reseed_canon):
                await seed_edition(conn, parsed_dir, edition_slug)

            if not reseed_canon and not args.bootstrap:
                print(
                    "[seed] canon NOT touched this run "
                    "(--seed-only default skips canon since Session 154). "
                    "Pass --reseed-canon explicitly to include it."
                )
        # Always print the schema_version stamp so operators can see they
        # connected to the right DB.
        version = await conn.fetchval(
            "SELECT version FROM schema_version WHERE id = 1"
        )
        print(f"[done] schema_version = {version}")
    finally:
        await conn.close()
    return 0


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--bootstrap",
        action="store_true",
        help="Drop & recreate public schema, apply schema.sql, then seed.",
    )
    parser.add_argument(
        "--seed-only",
        action="store_true",
        help=(
            "Skip --bootstrap; (re)seed the EXTRAS editions only. Session 154: "
            "canon is excluded by default; pass --reseed-canon explicitly to "
            "include it. Subscriptions, users, and study-notes are never touched."
        ),
    )
    parser.add_argument(
        "--reseed-canon",
        action="store_true",
        help=(
            "Include canon in the seed pass. Required against a populated DB "
            "to reload canon (rare — prefer a Rule-10 in-place UPDATE migration "
            "for verse-text edits). Triggers the sanity guard; pass "
            "--allow-framework-loss to override (and expect the schema-level "
            "FK RESTRICT to block the cascade regardless)."
        ),
    )
    parser.add_argument(
        "--allow-framework-loss",
        action="store_true",
        help=(
            "Suppress the Session 154 sanity guard that aborts when "
            "--reseed-canon would cascade through framework-bearing rows. "
            "Only use after consciously deciding to re-run every post-seed "
            "loader from scratch — and first dropping the FK RESTRICT "
            "constraints by hand. See seed.py docstring."
        ),
    )
    parser.add_argument(
        "--dry-run",
        action="store_true",
        help="Parse JSON only; print counts. Touches no DB.",
    )
    parser.add_argument(
        "--parsed-dir",
        type=Path,
        default=settings.parsed_json_dir,
        help=f"Directory containing the four parsed JSONs (default: {settings.parsed_json_dir})",
    )
    parser.add_argument(
        "--schema-sql-path",
        type=Path,
        default=settings.schema_sql_path,
        help=f"Path to schema.sql for --bootstrap (default: {settings.schema_sql_path})",
    )
    args = parser.parse_args()

    if not (args.bootstrap or args.seed_only or args.dry_run):
        # Default behavior: seed-only.
        args.seed_only = True

    return asyncio.run(amain(args))


if __name__ == "__main__":
    sys.exit(main())
