# S132 — Continue chapter-by-chapter (Matt 3): content cut + extras cross-refs together

S130 landed Matt 1 (content cut + S110 commentary already loaded). S131 landed Matt 2 (content cut) AND went back to add **extras-tier cross-references** for Matt 1 + Matt 2 — the metallic argaman pill is now lit for those two chapters on live cards. Going forward the workflow is **chapter-by-chapter, combining both pieces in one pass.** Start fresh at Matt 3.

## The revised plan (Yoshi's correction at S131 close)

The S131 open assumed batch fan-out of content cuts across chapters 2-28, with the corpus overhaul as a separate parallel wheel. That doesn't fit the session-length discipline at the depth this work calls for. The revised plan:

- **One chapter per session (or per work-block within a session).** Per chapter, the full pass is: aggressive content cut (short.md drops what free.md walks; .md drops what new short.md walks) **AND** extras-tier cross-reference threads added to the migration corpus (every framework-bearing pair across the full scripture-level extras library — 1 Enoch, Jubilees, Jasher, Apocrypha KJV 1611, Apocrypha Charles vol 1, Pseudepigrapha Charles vol 2, Adam-Eve Conflict, Apocalypse of Abraham, Ascension of Isaiah, Sonnini's Acts 29 where relevant).
- **Each chapter ships its own migration SQL** in `data-schema/migrations/session{N}_matt_{chap}_extras_cross_references.sql` per the S131 pattern. The migration runs through the API-Shell loader against live Render Postgres. Idempotent.
- **Cross-reference scope is the full library, not a narrow subset.** Per Yoshi's S131 correction: *all scripture in our bible that's not the canon* gets surfaced wherever framework-bearing. Historical-witness editions (Josephus, M.R. James, Lightfoot) remain deferred V1 per the voice-skill's one-way rule — they can cite scripture, scripture never cites into them.

Three sources of work still queue alongside the chapter-by-chapter walk: cross-reference corpus overhaul (now integrated into the per-chapter pass starting S132 forward), BuddyPress button audit (deferred until Yoshi specifies missing buttons), Matt content fan-out (now also integrated into the per-chapter pass).

## What landed S131

- Voice skill loaded; ~/Desktop/App mounted; S130 close docs read.
- Wheel pick: Matt content fan-out, then corrected mid-session to chapter-by-chapter combined work.
- **Matt 2 content cut applied per the S130 prototype rule:**
  - `matthew-2-short.md` (1914w → 454w): drops the 5-point chapter-overview walk; keeps the two-Yosephs parallel (Genesis 46:1-3 quoted) and the Exodus 4:19 → Matt 2:20 angelic-instruction verbal echo.
  - `matthew-2.md` (6477w → 6006w; apparatus-cut body 3550w): drops the Yoseph-Yoseph + Mosheh-verbal-parallel content (now in short.md), trims overview-restating frames. Keeps the deep Daniel-tradition Magi walk, Numbers 24 Star + Exodus 13 shekinah analog, Esau-Edomite-Herod with Obadiah/Numbers 20/Malachi/Psalm 137/Ezekiel 35, Hosea 11 identification + Exodus 4:22-23 firstborn-son, Jeremiah 31 chapter context + Matt 26:28 26-chapter bracket + Pharaoh-Mosheh slaughter-of-infants pattern, full Branch architecture + Galilean Isaiah 9 prep for Matt 4.
- **Matt 1 + Matt 2 extras-tier cross-references shipped** as `data-schema/migrations/session131_matt_1_2_extras_cross_references.sql`. 11 PROPOSED threads, 32 `cross_references` rows, 32 `cross_reference_thread_members` rows, all at `tier_required='extras'`. Covers every scripture-level extras edition in V1. All 46 unique (edition, book, chapter, verse) references verified against the parsed JSONs.

The 11 new extras-tier threads — all activate the metallic argaman pill on Matt 1 + Matt 2 chapter cards once loaded:

| Slug | Anchor | Hits |
|---|---|---|
| `son-of-adam-named-before-creation` | Matt 1:21 + 1:23 | 1 Enoch 48:2, 48:3, 48:6, 62:1, 69:26 |
| `genealogy-as-adamic-toledot` | Matt 1:1 | Eccl 44:1, Jub 4:28, 4:29, 1 Adam-Eve 1:1, Apo. Abr. 20:6 |
| `tamar-in-yahudahs-own-voice` | Matt 1:3 | Jasher 45:23, 45:32, Test. Yahudah 26:2 |
| `matthean-yoseph-and-the-patriarch-yoseph` | Matt 1:18 + 2:14 | Test. Yoseph 72:1, Jub 46:1, 46:5 |
| `levi-yahudah-benjamin-messianic-prophecies` | Matt 1:1 + 1:23 | Test. Simeon 11:2, Test. Levi 20:3, Test. Benjamin 96:2 |
| `magi-astronomical-tradition` | Matt 2:1-2 | 1 Enoch 72:1, 90:20, 90:21 |
| `incarnation-of-the-beloved` | Matt 1:23 | Asc. Isa. 11:2, 10:8, 9:12 |
| `firstborn-son-out-of-egypt-extras` | Matt 2:15 | Jub 2:20 |
| `pharaoh-mosheh-herod-yahusha-infant-slaughter` | Matt 2:13-16 | Jasher 67:1, 67:3, 67:4 |
| `rachel-buried-at-bethlehem` | Matt 2:18 | Jub 32:33, 32:34 |
| `plant-of-righteousness-and-the-branch` | Matt 2:23 | 1 Enoch 10:16 |

## First moves (in order)

1. Invoke the Skill tool with `anthropic-skills:yoshi-voice` before any other action.
2. Verify `~/Desktop/App` mounted; request if not.
3. Read `COLOR_PALETTE.md`, the Matt 1 + Matt 2 prototypes (`commentaries/matthew-1-short.md`, `matthew-1.md`, `matthew-2-short.md`, `matthew-2.md`), and `data-schema/migrations/session131_matt_1_2_extras_cross_references.sql` for the cross-reference pattern. Then read `commentaries/matthew-3-free.md`, `matthew-3-short.md`, `matthew-3.md` to scope chapter 3.
4. Work Matt 3 end-to-end:
   - Aggressive content cut on `matthew-3-short.md` (drop what free walks; surface one or two focused framework angles free does not surface).
   - Aggressive content cut on `matthew-3.md` (drop what new short.md walks; keep the deep case-by-case + theological development).
   - Author `data-schema/migrations/session132_matt_3_extras_cross_references.sql` with every framework-bearing extras-tier cross-reference for Matt 3. Matt 3 is the Yochanan (John the Witness) + baptism + dove descending + Father-voice chapter — strong candidates include: 1 Enoch on the Elect One, Wisdom of Solomon on the Spirit, Ascension of Isaiah on the dove + voice from heaven, Jasher on the priestly office continuity, Testament of Levi on the heavens opening at the priesthood register.
   - Voice-gate everything (12 Red Lines + 12-point checklist).
5. Provide Yoshi a paste-block: `cd ~/Desktop/App` + `rm -f .git/index.lock` + commit + push + (if green) run the new migration through the API-Shell loader.

## Paste-block to commit + push S131 + run the Matt 1+2 extras migration

```bash
cd ~/Desktop/App
rm -f .git/index.lock

git add commentaries/matthew-2-short.md commentaries/matthew-2.md \
        data-schema/migrations/session131_matt_1_2_extras_cross_references.sql \
        S132_SESSION_OPEN_PROMPT.md

git commit -m "S131 — Matt 2 content cut + Matt 1+2 extras-tier cross-references

Matt 2 aggressive content cut (second prototype after S130's Matt 1).
matthew-2-short.md (1914w -> 454w): drops 5-point chapter-overview walk;
keeps two-Yosephs parallel (Genesis 46:1-3) and Exodus 4:19 -> Matt 2:20
angelic-instruction verbal echo.
matthew-2.md (6477w -> 6006w; apparatus-cut body 3550w): drops the
Yoseph-Yoseph + Mosheh-verbal-parallel content (now in short.md), trims
overview-restating frames.

Matt 1+2 extras-tier cross-references in session131_matt_1_2_extras_*.sql.
11 PROPOSED threads, 32 cross_references rows, 32 thread members, all
tier_required='extras'. Activates the metallic argaman pill on Matt 1+2
chapter-end cards per COLOR_PALETTE.md section 9. Covers every
scripture-level extras edition seeded V1: 1 Enoch, Jubilees, Jasher,
Apocrypha KJV 1611 (Ecclesiasticus), Pseudepigrapha (Testaments XII
Patriarchs), 1 Adam-Eve, Apocalypse of Abraham, Ascension of Isaiah.
All 46 unique (edition, book, chapter, verse) references verified
against parsed JSONs.

S132 prompt added for chapter-by-chapter going forward (content cut +
extras cross-refs combined per chapter, starting Matt 3)."

git push origin main
```

After Render rebuilds (S112 loader is ALREADY part of the per-chapter content path — it ran for Matt 1+2 commentary already; the migration is a separate one-shot apply). Apply the migration via the established applier (`api/apply_migration.py`) and the file-based URL fallback (`_scratch/_db_url.txt` — set up at S38 to route around zsh quoting traps):

```bash
cd ~/Desktop/App
DATABASE_URL="$(cat _scratch/_db_url.txt)" \
  python3 api/apply_migration.py \
  data-schema/migrations/session131_matt_1_2_extras_cross_references.sql
```

The applier strips `\echo` and other psql-only directives, forces SSL for Render's external endpoint, executes the BEGIN/COMMIT block, and prints the row-count assertions at the end. Verify: `extras_xref_rows = 32`, `extras_threads = 11`, `extras_members = 32`. Open Matt 1 or Matt 2 in the live reader after the apply — the metallic argaman pill should light up against the extras-tier targets (rendered at 40% opacity for free-tier readers, full opacity for Library-tier subscribers, routing to /pricing on locked-click).

## Out of scope (still)

- Further reader-surface color tuning (locked in COLOR_PALETTE.md §9).
- Modal/drawer color sweep (deferred per §9 trailing note).
- The §4 icy-silver-blue olive-leaf register (reserved).
- BuddyPress button audit (waiting on Yoshi's spec for which buttons are missing).
