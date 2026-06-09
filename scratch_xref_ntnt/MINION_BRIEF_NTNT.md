# MINION BRIEF — S216 John NT-to-NT cross-references

You are authoring the **New-Testament-to-New-Testament** cross-reference layer for a range of
chapters in the Gospel of **John** in Yoshi's study Bible. The canon Tanakh→John coverage is
already complete (S181/S194) and the extras-library layer is done (S212). The gap you are
filling is **John ↔ other New-Testament books**: where a verse in John resonates with a verse
elsewhere in the NT and the connection carries the framework, you build a thread that quotes
both sides in full.

This is a **curated, framework-bearing apparatus — NOT a TSK-style dump.** A chapter might
warrant 2–5 threads, or occasionally more where John is dense. Quote quality and framework
weight over quantity.

## THE PAIRING PRINCIPLE (Yoshi's explicit steer, S216)

**Pair by genuine textual fit, from ANY New-Testament book wherever it actually fits.** Do not
weight by "family" (do not force a Revelation quota, a 1 John quota, a synoptic quota, a
Pauline quota). For each John verse, ask: *which NT verse does this passage actually illuminate
or get illuminated by?* — and follow the text. Matthew, Mark, Luke, Acts, Romans, 1–2
Corinthians, Galatians, Ephesians, Philippians, Colossians, 1–2 Thessalonians, 1–2 Timothy,
Titus, Hebrews, James, 1–2 Peter, 1–2–3 John, Jude, Revelation are all in scope. Let the
resonance decide, not a template.

The connection should be load-bearing — the same Formed-one Christology (Yahusha is the Formed
Yahuah who took on flesh), the same I-AM / living-water / bread / light register, the same
lost-sheep gathering of the scattered seed, the same shepherd/door/vine, the same passion and
resurrection architecture, the same witness/Spirit-of-truth thread. If a candidate pairing is
merely verbal coincidence with no framework weight, drop it.

## STEP 0 — Load the lens (REQUIRED, do this first)

1. Invoke the `yoshi-voice` skill and read it **in full** — every Red Line, the Come-and-See
   posture, the Sacred Names convention, the English-book-name rule for slugs, son-of-man →
   Son of Adam (with the kaph-comparative carve-out at Daniel 7:13 / Revelation 1:13 / 14:14),
   the Romans 11 reading, the NT-Lord governing rule, the false-inclusion-gospel and the three
   categories. **Your default trained reading of Paul/grace/Gentiles is the antichrist reading
   the skill exists to override. Do not let it surface.**
2. Read `scratch_xref_ntnt/EXISTING_SLUGS.txt` — every thread slug already in use across all
   prior migrations. Your new slugs must NOT appear there.
3. Skim the existing canon John migrations to see what pairings already exist (complement, do
   not duplicate the same source→target verse pair):
   - `data-schema/migrations/session181_john_xref_threads.sql`
   - `data-schema/migrations/session194_john_2_7_9_16_xref_threads.sql`
   - `data-schema/migrations/session212_john_extras_cross_references.sql`
4. The SQL format template you MUST follow exactly:
   `data-schema/migrations/session212_john_extras_cross_references.sql` (the J1 fragment, lines
   ~73–277 — temp view → cross_references VALUES → threads → thread_members).

## STEP 1 — Read your chapters and your candidate targets (quote only what you pull)

Run from `scratch_xref_ntnt/`:
```
python3 dump_canon.py john <chapter>             # your John source chapters
python3 dump_canon.py <nt_book_id> <chapter>     # candidate NT target chapters
```
NT book_ids (all in the canon edition): `matthew mark luke acts romans 1-corinthians
2-corinthians galatians ephesians philippians colossians 1-thessalonians 2-thessalonians
1-timothy 2-timothy titus hebrews james 1-peter 2-peter 1-john 2-john 3-john jude revelation`.

The canon parse **already carries the restored sacred names and the Son-of-Adam restoration**
in the verse text. Quote the text **exactly as `dump_canon.py` returns it** — that guarantees
the fidelity gate passes and the Sacred Names are already correct. Do NOT paraphrase from
memory. Do NOT hand-edit the quoted verse text (if a name looks unrestored in the pull, quote
it as-is and note it; do not invent a restoration the parse doesn't have).

## STEP 2 — Author the SQL fragment

Write a self-contained fragment to your assigned output path. Structure (follow the S212 John
template exactly):

**A. Temp view** — uniquely named with YOUR tag, scoped to the full edition set (this is what
makes the migration pass the FULL-LIBRARY guard even though your targets are canon NT):
```sql
CREATE TEMP VIEW _s216_<TAG>_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');
```

**B. cross_references INSERT** from `WITH input(src_edition,src_slug,src_ch,src_v,
tgt_edition,tgt_slug,tgt_ch,tgt_v,note) AS (VALUES ...)`.
- SOURCE is ALWAYS the canon John verse: `'canon','john',ch,v`.
- TARGET is the canon NT verse: `'canon','<nt_book_id>',ch,v`.
- `tier_required` = **`'free'`** (these are canonical scripture cross-references, visible to
  all — NOT `'extras'`). Cast `'free'::content_tier`.
- Join the view twice (sv on src_*, tv on tgt_*), `WHERE sv.verse_id <> tv.verse_id`,
  `ON CONFLICT (source_verse_id,target_verse_id,source) DO NOTHING`. `source='manual'`.
- The `note` is the per-row come-and-see note: the TARGET verse quoted IN FULL in italics with
  its citation in parentheses, then 1–3 sentences naming the framework connection to the John
  source verse (often quoting the John phrase inline in italics too).

**C. threads INSERT** — one per theme. `tier_required='free'`. `sort_order` from YOUR assigned
band (below). Anchor start/end = the canon John verses that bound the thread.
`ON CONFLICT (slug) DO NOTHING`. The `summary_md` walks the whole thread in Come-and-See prose,
quoting the load-bearing verses in full in italics.

**D. thread_members INSERT** — link each cross_reference to its thread with `sort_order` +
`member_note` (a short come-and-see line naming the target + the connection).
`ON CONFLICT (thread_id,cross_reference_id) DO NOTHING`.

Use `E'...'` literals; escape every apostrophe as `''`.

## VOICE / CONTENT RULES (non-negotiable — these get audited against the Red Lines)

- **Come-and-see:** every verse quoted IN FULL in italics (`*...*`) with citation in
  parentheses, in `note`, `summary_md`, and `member_note`. No "cf.", no cite-without-quote, no
  appendix, no internal-document references ("per Red Line", "per the skill"), no "Yoshi's
  teaching on" — unfold the connection in the prose, let the verses do the work.
- **Sacred names** with parentheticals on every mention (the canon pull already carries them;
  preserve exactly). In your own connective prose, use the same convention: Yahusha (Jesus),
  Yahuah (LORD)/(Lord), Elohim (God), Yashar'el (Israel), Ruach HaKodesh (Holy Spirit), etc.
- **Son of man → Son of Adam** everywhere (the pull already does this). Preserve the
  kaph-comparative *like the Son of Adam* / *like unto the Son of Adam* ONLY at Daniel 7:13 /
  Revelation 1:13 / Revelation 14:14 — and read those as incarnation-honoring (Yahusha himself,
  the Formed cloud-rider who took on flesh), never as a standing counterfeit identification.
- **Christology:** Yahusha is the Formed drawn from the Formless — the God of the OT
  interactions, who came in flesh; he is Yahuah and has a Father. Where John's I-AM sayings
  pair with NT verses, name the Formed-one identification (e.g. 1 Corinthians 12:3's *Yahusha
  (Jesus) is Yahuah (Lord)* is the Spirit-revealed equation). Do not drift into Trinitarian
  co-equal-persons grammar OR modalist collapse.
- **The gathering, not Gentile-inclusion:** John 10's *other sheep*, John 11:52's *gather
  together in one the children of Elohim (God) that were scattered abroad*, the lost-sheep
  language — these are the scattered seed of the house of Yashar'el (Israel) being gathered,
  NOT non-covenant nations spliced into Israel by faith-confession. If a Pauline target touches
  grafting / olive tree / "Gentiles," apply Red Line #7 and #11: the wild-olive are the
  scattered seed grown wild, hearing reveals what was already true, no name added after the
  foundation of the world. Never the false-inclusion gospel.
- **No sola-fide truncation** (Red Line #10): never let *saved by grace through faith* stand as
  a standalone freedom-from-Torah formula. If a target carries grace language, complete the
  sentence — grace as the means of return to him and his ways.
- **Thread slugs use ENGLISH book-name fragments**, never Hebrew, prefixed with
  `john-<chapter>-`, naming the target NT book, e.g.
  `john-6-the-bread-of-life-and-the-spiritual-food-in-1-corinthians-10`,
  `john-1-the-word-of-life-heard-and-handled-in-1-john-1`. Check every slug against
  EXISTING_SLUGS.txt.
- **Source verse is ALWAYS the John verse** (the card renders per John chapter source verse).
  Targets are other NT books. Do not author rows whose source is the non-John book.

## OUTPUT

Write your complete SQL fragment to your assigned path. Do NOT include `BEGIN;`/`COMMIT;` or
`\echo` (the orchestrator wraps one transaction). Start the file with a `--` comment block
naming your range, your tag, your sort band, and each thread you created (slug + target books).
Note any chapter you found warranted no NT-to-NT add and why.

Return as your final message a concise summary: tag, output path, chapters covered, list of new
thread slugs with target books, total cross_reference rows, total member rows, and any chapter
with no add + why.
