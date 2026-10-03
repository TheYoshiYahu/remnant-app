# Hidden Words — Feature Spec (S431, 2026-10-02)

Status: **SPECCED; mockup v2 (`HIDDEN_WORDS_MOCKUP.html`) APPROVED by Yoshi S431 — the three alternating violet tones stay as they are. Build starts next session.** Roadmap entry: `BIBLE_APP_ROADMAP.md` Phase 5 ("Flagship feature, added S431: Hidden Words") and Section IX Q49.

## What it is (Yoshi's words, S431)

Wherever one English word in the King James stands for more than one Hebrew or Greek word, show it in royal purple with a small superscript number: the count of different original words behind that English word across the canon. Tapping the number opens a table: each original word, its Strong's number, its plain meaning, and the verses where it is used.

Toggle: a row in the Menu, like every other reader feature. **Defaults ON; the partner can switch it off; the choice persists** (S431 Yoshi: "it should come as on with the ability to switch it off").

## Source data — no new download needed for V1

The word-tagging already lives in our database. `verse_words` (S120 loader, `restoration-pipeline/_session120_load_verse_words.py`) carries every Strong's-tagged KJV word in all 66 books, built from `source-texts/kjv/eng-kjv_usfx.xml` (eBible.org / CrossWire KJV with Strong's — **public domain**). Every `<w s="H####">` tag ties one English word to its Hebrew or Greek word. That is exactly the join this feature needs: English surface → Strong's number.

Second witness, used for checking only: STEPBible TAHOT (Hebrew) + TAGNT (Greek), already on disk at `source-texts/stepbible-data/` — **CC BY 4.0** (attribution required: "Data created by www.STEPBible.org based on work at Tyndale House Cambridge"). TAGNT records which Greek manuscripts read which word, so it settles cases where the KJV's Greek (the Textus Receptus) differs from other manuscripts. Example found while building: Revelation 16:14 "spirits of devils" — the KJV's Greek reads *daimonōn* (daimōn, G1142); most other manuscripts read *daimoniōn* (daimonion, G1140). Our tagging follows the KJV's own Greek, which is correct for a King James surface.

Plain meanings: drafted from Strong's own definitions (1890, public domain; already loaded in `strong_entries`), shortened to a few plain words, voice-gated, stored in our table so Yoshi can redline any of them.

OpenScriptures data (the Strong's/BDB XML already in `source-texts/openscriptures-hebrewlexicon/`) is CC BY 4.0 for the markup — attribution line goes on the app's credits page alongside STEPBible when either ships in a surface.

## How the counts are generated (deterministic script, zero AI)

New script `restoration-pipeline/_session431_build_hidden_words.py`:

1. Read every (English word, Strong's number, verse) from `verse_words`.
2. Fold the English: lowercase; fold plural and possessive onto the singular (serpent / serpents / serpent's → *serpent*). Other derived forms stay separate (devil ≠ devilish). Multi-word tags are split to their content word: the KJV tagging sometimes wraps a phrase in one tag (Revelation 2:10 `<w s="G1228">the devil</w>`), and the S431 prototype missed those verses until this was caught — the build must handle them.
3. Keep a pair only when Strong's own KJV-usage line lists that English word for that Strong's number. This drops tagging slips (e.g., the Greek article "the" tagged onto "Lord" in a few verses, "and" tagged onto "God"). Nothing hand-picked.
4. Count the distinct Strong's numbers left per English word, across the whole canon. That count is the superscript.
5. Second-witness pass: where step 3 drops a pair because the tag slipped onto a neighboring word, check STEPBible TAGNT/TAHOT for that verse and restore the verse to the right original. Known case: Revelation 17:8 "The beast that thou sawest" — the KJV tagging puts the Strong's number on "which" (G3739) instead of "beast", so without this pass the verse would fall out of thērion's list.
6. Write the results to the tables below. Re-runnable; same input gives byte-identical output.

Prototype run (S431, from the USFX on disk) confirmed the examples and found more than Yoshi listed — the canon carries these:

- **serpent⁶** — nachash H5175 (Genesis 3:1; Moses' rod Exodus 4:3), tannin H8577 (Aaron's rod Exodus 7:9–12), saraph H8314 (the "fiery serpent" Numbers 21:8; Isaiah 14:29; 30:6 — the same word as the seraphim of Isaiah 6), zachal H2119 (Deuteronomy 32:24, "crawling things"), ophis G3789 (Revelation 12:9), herpeton G2062 (James 3:7, "creeping thing").
- **devil⁶** — diabolos G1228, accuser (Revelation 12:9); daimonion G1140, demon; daimōn G1142, demon (Revelation 16:14 in the KJV's Greek); daimonizomai G1139 ("possessed with a devil," a verb); sa'iyr H8163, hairy goat (Leviticus 17:7; 2 Chronicles 11:15); shed H7700 (Deuteronomy 32:17; Psalm 106:37).
- **beast** — 17 across the canon (behemah, chay, chevah — Daniel's beasts, thērion, zōon, and others). In Revelation three stand behind it: thērion (the beasts on the dragon's side), zōon (the four living creatures around the throne, Revelation 4–5), and ktēnos (beasts as merchandise, Revelation 18:13).
- **dragon³** — tannin H8577 (the same word as Aaron's serpent), drakōn G1404, tannah H8568.

### Table design decision: the current book's words come first
Because the count runs across the whole canon, *beast* reads 17 even in Revelation. The table therefore lists the original words used **in the book being read** first, with their verses in that book, and folds the rest under "Elsewhere in the canon." In Revelation the reader sees thērion, zōon and ktēnos on top — Yoshi's distinction — with the other fourteen one tap below.

### Density — DECIDED S431: exhaustive, with alternating colors

First draft proposed a curated list. Yoshi (S431): "we can alternate colors so the whole page isnt purple, but i feel like it should be a slightly exhaustive feature." So **every qualifying word is marked**, and the marked words **alternate through three tones of the violet family** in reading order so the page never reads as one purple block:

- argaman `#8E4FB3` (dark theme `#B98AD6`) — royal purple, COLOR_PALETTE argaman register
- indigo-periwinkle `#5753C9` (dark `#9F9FE0`) — COLOR_PALETTE periwinkle
- plum-magenta `#B0357F` (dark `#E060A5`) — COLOR_PALETTE magenta

What "qualifying" means (the "slightly" in slightly exhaustive):
- Every content word whose English form stands for 2 or more Hebrew/Greek words, confirmed by Strong's own KJV-usage line.
- Not marked: small connecting words (the, and, of, unto, which, he, shall…); restored names (Q49); proper names (Moses, Aaron, Pharaoh, Satan — the same name in Hebrew and Greek is not a hidden word).
- Verb forms fold together (deceive / deceived / deceiveth / deceiving) as nouns fold singular/plural.

Measured on the canon: about 2,900 English words qualify; roughly one word in four on a page is colored (the connecting words, which make up much of each verse, stay plain). Mockup v2 (`HIDDEN_WORDS_MOCKUP.html`) shows Genesis 3:1, Exodus 7:10 and Revelation 12:9 built from real data.

## Where it lives in the database (additive migration `session431_hidden_words.sql`)

```sql
CREATE TABLE hidden_words (
    english_key     TEXT PRIMARY KEY,          -- folded English form: 'serpent'
    original_count  INT  NOT NULL,             -- the superscript number (distinct Strong's across canon)
    marked          BOOLEAN NOT NULL DEFAULT TRUE,   -- FALSE = held back by an operator override (rare)
    surfaces        TEXT[] NOT NULL            -- surface forms folded in: {serpent,serpents,serpent's}
);
CREATE TABLE hidden_word_originals (
    english_key     TEXT REFERENCES hidden_words(english_key) ON DELETE CASCADE,
    strong_number   TEXT REFERENCES strong_entries(strong_number),
    occurrences     INT  NOT NULL,             -- how many times this original stands behind the English word
    plain_meaning   TEXT NOT NULL,             -- voice-gated short gloss, Yoshi-redlinable
    PRIMARY KEY (english_key, strong_number)
);
```

Verse lists are not duplicated: they come from `verse_words` (indexed on `strong_number`) joined to the folded surface forms. The build script also writes a static JSON bundle (`hidden-words.json`, a few MB for the whole canon; split per book for the offline download) so the feature works offline like the rest of the reader.

API: `GET /v1/hidden-words` (marked keys + counts, cached with the content version) and `GET /v1/hidden-words/{key}?book=REV` (the table, current book first).

Tier: **free for everyone.** It defaults on for every reader, it rides on the Strong's data that is already free, and it is a proclamation surface (same standing as the Witness and Kingdom overlays).

## Reader behavior

- Marked words render in the three alternating violet tones above, each with a small superscript count in the same tone.
- Tap the number → bottom sheet with the table: original word (Hebrew/Greek script + transliteration), Strong's number, plain meaning, verses (tappable, jump to verse). Tapping the *word* itself keeps doing what it does today (Strong's / verse actions).
- Composes with the existing Strong's-superscripts toggle (S160): when both are on, the purple count comes first, then the H/G number in its usual style.
- Menu row "Hidden words," default ON, localStorage `rop_hidden_words_v1` (same pattern as `rop_witness_v1` / `rop_kingdom_v1`), synced across devices as `display_prefs.hidden_words`.

## Scope

- **V1: the 66-book canon only.** The extras (Enoch, Jubilees, Jasher, Apocrypha and the rest of the restored library) carry no Strong's tagging, so they have nothing to count. They come later, once a tagging source exists for them.

## Restored names — DECIDED S431: no purple

Yoshi (S431, Section IX Q49): restored names do not get the purple treatment. Every word the restoration pipeline replaces — God, LORD, Lord where restored, Jesus, Christ, Holy Spirit/Ghost, JAH, the compound names, Israel, Judah, Jews, Jew/Jewish, Melchizedek — stays plain, with no count, even where several Hebrew or Greek words stand behind it. The build script carries this exclusion list from `restoration-pipeline/restore.py` so the two never drift apart.

Finding surfaced while building, separate from this feature: the parsed canon (`source-texts/parsed/canon.json`) renders "God forbid" as **"Elohim (God) forbid"** in 24 verses, where the Hebrew (*chalilah*, "far be it") and the Greek (*mē genoito*, "may it not be") carry no word for God at all. Needs a check against the live database and a pipeline fix — queued, not part of this feature.

## Build order (after Yoshi approves the mockup)

1. Build script + migration + JSON bundle; dry-run report of counts for review.
2. API endpoints.
3. Reader rendering + bottom-sheet table + Menu toggle.
4. Plain meanings: hand-written for the headline words (serpent, beast, devil, dragon), Strong's short definition for the rest; voice-gated, Yoshi-redlinable over time.
5. Sanity script `_s431_hidden_words_sanity.mjs` testing serpent / beast / devil against Genesis 3:1, Exodus 4:3, Exodus 7:9–12, Revelation 4–5, Revelation 12:9, Revelation 16:14.
