# MINION BRIEF — S212 Gospel extras-library cross-references

You are authoring the **missing outside-canon (extras-library) cross-references** for a
range of Gospel chapters in Yoshi's study Bible. Matthew already has full extras coverage;
**Mark, Luke, and John have ZERO outside-canon cross-references** — their existing migrations
quote extras inside `summary_md` but never inserted them as member rows. Your job is to fix
that for your assigned chapter range: promote those quoted-but-unlinked extras into real
edition-aware member rows, AND add new framework-bearing extras connections the chapter
warrants.

## STEP 0 — Load the lens (REQUIRED, do this first)
1. Invoke the `yoshi-voice` skill and read it in full (the Red Lines, Come-and-See posture,
   Sacred Names convention, English book-name rule for slugs, son-of-man→son-of-Adam).
2. Read `scratch_xref/EXTRAS_INVENTORY.md` — the ONLY valid (edition_slug, book_id, chapter,
   verse) target tuples. Never cite a verse outside these ranges.
3. Read `scratch_xref/EXISTING_SLUGS.txt` — every thread slug already in use. Your new slugs
   must NOT appear there.
4. Skim the existing canon migration for your gospel to see what canon threads + quoted
   extras already exist (so you complement, not duplicate):
   - Mark: `data-schema/migrations/session183_mark_xref_members_and_threads.sql`
   - Luke: `data-schema/migrations/session185_luke_xref_members_and_threads.sql`
   - John: `data-schema/migrations/session181_john_xref_threads.sql` and
     `session194_john_2_7_9_16_xref_threads.sql`
5. The SQL format template you MUST follow:
   `data-schema/migrations/session135_matt_6_extras_cross_references.sql` (edition-aware).

## STEP 1 — Read your chapters
For each canon chapter in your range:
  `python3 scratch_xref/dump_canon.py <gospel> <chapter>`   (gospel = mark|luke|john)
For candidate extras targets, read them in full before quoting:
  `python3 scratch_xref/dump_canon.py <book_id> <chapter> <edition_file>`
  e.g. `python3 scratch_xref/dump_canon.py 1-enoch 15 enoch`
       `python3 scratch_xref/dump_canon.py ecclesiasticus 28 apocrypha`
       `python3 scratch_xref/dump_canon.py jubilees 2 jubilees`
       `python3 scratch_xref/dump_canon.py testaments-xii 41 pseudepigrapha-charles-vol2`
       `python3 scratch_xref/dump_canon.py jasher 80 jasher`
       `python3 scratch_xref/dump_canon.py sonnini-acts-29 1 sonnini-acts-29`
Quote ONLY text you actually pulled. Do not paraphrase from memory.

## STEP 2 — Author the SQL
Write a self-contained fragment to your assigned output path. Structure (follow S135 exactly):

A. **Temp view** (uniquely named — use YOUR tag):
```sql
CREATE TEMP VIEW _s212_<TAG>_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');
```
B. **cross_references INSERT** from a `WITH input(src_edition,src_slug,src_ch,src_v,
   tgt_edition,tgt_slug,tgt_ch,tgt_v,note) AS (VALUES ...)`. The SOURCE is always the canon
   Gospel verse (`'canon','<gospel>',ch,v`); the TARGET is the extras verse. `tier_required`
   = `'extras'`. Join the view twice (sv on src_*, tv on tgt_*). `ON CONFLICT
   (source_verse_id,target_verse_id,source) DO NOTHING`.
C. **threads INSERT** — one per theme. `tier_required='extras'`. `sort_order` drawn from
   YOUR assigned band (below). Anchor start/end = canon Gospel verses. `ON CONFLICT (slug)
   DO NOTHING`.
D. **thread_members INSERT** — link each cross_reference to its thread with sort_order +
   member_note. `ON CONFLICT (thread_id,cross_reference_id) DO NOTHING`.

Use `E'...'` for any literal containing an apostrophe escape as `''` (match S135 style;
S135 uses plain `'...'` with `''` escapes — either is fine, be consistent and valid).

## Voice / content rules (non-negotiable — these get audited)
- **Come-and-see:** every verse quoted IN FULL in `summary_md` and in `member_note`, in
  italics (`*...*`), citation in parentheses. No "cf.", no cite-without-quote, no appendix.
- **Sacred names** with parentheticals on every mention in quoted text, per the skill
  (Yahuah (LORD), Yahusha (Jesus), Elohim (God), Yashar'el (Israel), etc.). Restore them in
  the quoted text you pull (the canon parse already carries many; add where missing).
- **Son of man → Son of Adam** everywhere (preserve kaph-comparative "like the Son of Adam"
  only at Dan 7:13 / Rev 1:13 / Rev 14:14).
- **Thread slugs use ENGLISH book-name fragments**, never Hebrew. Prefix with the gospel +
  chapter for uniqueness, e.g. `john-1-the-word-and-wisdom-in-wisdom-of-solomon`,
  `mark-4-the-sower-and-the-seed-in-2-esdras`. Check against EXISTING_SLUGS.txt.
- **Curated + framework-bearing only.** Each row must pass the 12 Red Lines + 12-point
  checklist. NOT a comprehensive/TSK-style dump. Quality over quantity: a chapter might
  warrant 1–4 extras threads, or occasionally none if no framework-bearing extras connection
  exists (say so).
- Bidirectional within scripture-level texts is allowed conceptually, but the **source verse
  must be the Gospel verse** (the card renders per chapter source verse). Historical-witness
  texts (Josephus, Apostolic Fathers, M.R. James) are EXCLUDED — never targets.

## Output
Write your complete SQL fragment to the assigned path. Do NOT include `BEGIN;`/`COMMIT;` or
`\echo` (the orchestrator wraps one transaction per gospel). Start the file with a `--`
comment block naming your range, your tag, your sort band, the threads you created (slug +
target editions), and any chapter you found warranted no extras add.

Return (as your final message) a concise summary: tag, output path, chapters covered, list of
new thread slugs with their target editions, total cross_reference rows, total member rows,
and any chapters with no add + why.
