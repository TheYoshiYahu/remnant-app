# MINION BRIEF — S217 Acts cross-references (FULL LIBRARY, per chapter-range)

You are authoring the **full cross-reference apparatus** for a range of chapters in the **Acts
of the Apostles** in Yoshi's study Bible. Acts is greenfield: there is no prior Acts xref
migration. You are building the weave from scratch for your chapters.

**You author all three library layers for your chapters — Tanakh + extra-canonical + New
Testament — NOT one library in a silo.** The framework's value is the *side-by-side weave*: a
single Acts passage (Pentecost, Stephen's speech, the Jerusalem council) wants the Tanakh
prophecy, the Hebrew-library witness, and the NT fulfillment quoted **together in one thread**.
One mind holds the whole passage and binds those into a single coherent thread. Do not split by
library.

This is a **curated, framework-bearing apparatus — NOT a TSK-style dump.** A chapter might
warrant 3–8 threads. Quote quality and framework weight over quantity.

## THE PAIRING PRINCIPLE

For each Acts verse, ask: *which verse — anywhere in the restored library — does this passage
actually illuminate or get illuminated by?* and follow the text. The whole library is in scope,
**bidirectional within scripture-level texts**:

- **Tanakh** (canon OT): the prophets Acts quotes and echoes — Joel, the Psalms, Amos, Isaiah,
  Ezekiel, Deuteronomy, Exodus, Numbers, Zechariah, Daniel, Hosea, Habakkuk.
- **Extra-canonical** (the restored library): Apocrypha (Tobit, 2 Esdras, Ecclesiasticus/Sirach,
  Wisdom, 1–2 Maccabees, Baruch), 1 Enoch, Jubilees, Jasher, the Pseudepigrapha (Testaments XII,
  2 Baruch), Adam-Eve, Apocalypse of Abraham, Ascension of Isaiah, Sonnini's *Acts of Paul*.
- **New Testament**: the Gospels, the Pauline letters, the general epistles, Revelation — and
  Acts↔Acts where a later chapter (e.g. Acts 13/15) re-walks an earlier one.

Let the resonance decide, not a template or a per-family quota. The connection must be
load-bearing — the twelve-tribe gathering of the scattered seed, the Formed-one Christology
(Yahusha is the Formed Yahuah who took on flesh), the Spirit-and-Torah inseparability, the
feast/firstfruits architecture, the resurrection and enthronement, the come-and-see invitation.
Drop merely verbal coincidences with no framework weight.

## STEP 0 — Load the lens (REQUIRED, do this first)

1. Invoke the `yoshi-voice` skill and read it **in full** — every Red Line, the Come-and-See
   posture, the Sacred Names convention, the English-book-name rule for slugs, son-of-man →
   Son of Adam (with the kaph-comparative carve-out at Daniel 7:13 / Revelation 1:13 / 14:14),
   the Romans 11 reading, the NT-Lord governing rule, the false-inclusion-gospel diagnostic and
   the three categories. **Your default trained reading of Paul / grace / "Gentiles" is the
   antichrist reading the skill exists to override. Do not let it surface.**
2. Read `scratch_xref_acts/EXISTING_SLUGS.txt` — every thread slug already in use across all
   prior migrations. Your new slugs must NOT appear there.
3. The SQL format template you MUST follow exactly is the edition-aware FULL-LIBRARY schema:
   `data-schema/migrations/session212_john_extras_cross_references.sql` (the J1 fragment — temp
   view over the full edition set → cross_references VALUES → threads → thread_members).

## STEP 1 — Read your chapters and your candidate targets (quote ONLY what you pull)

Run from `scratch_xref_acts/`:
```
python3 dump_canon.py acts <chapter>                 # your Acts source chapters
python3 dump_canon.py <book_id> <chapter>            # canon target (Tanakh or NT)
python3 dump_canon.py <book_id> <chapter> <edition>  # extras target
```
Extras `<edition>` files: `enoch`, `jubilees`, `jasher`, `apocrypha`,
`apocrypha-charles-vol1`, `pseudepigrapha-charles-vol2`, `adam-eve-conflict`,
`apocalypse-of-abraham`, `ascension-isaiah`, `sonnini-acts-29`. Apocrypha book slugs include
`tobit`, `2-esdras`, `ecclesiasticus`, `the-wisdom-of-solomon`, `baruch-with-the-letter-of-jeremiah`,
`1-maccabees`. 1 Enoch book slug is `1-enoch`; Jubilees is `jubilees`.

The canon parse **already carries the restored sacred names and the Son-of-Adam restoration**
(Daniel 7:13 already reads *one like the Son of Adam came with the clouds* — the kaph
preserved). Quote the text **exactly as `dump_canon.py` returns it** — that guarantees the
fidelity gate passes and the names are already correct. Do NOT paraphrase from memory. Do NOT
hand-edit quoted verse text. If an extras pull carries editorial/apparatus noise inside the
verse (e.g. a parenthetical "(Note: …)" or a Charles critical-apparatus fragment), **do not
quote that verse** — pick a clean witness instead.

## STEP 1.5 — PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (mandatory, recorded in your file)

For **every chapter** in your range, record in your file's header comment — for each meaningful
verse or verse-block — which libraries you weighed:

```
-- Acts <ch> coverage:
--   v.N  Tanakh: <candidate(s) or 'none warranted'>
--        Extras: <candidate(s) or 'none warranted'>
--        NT:     <candidate(s) or 'none warranted'>
```

**"None warranted" is a valid, recorded answer** — curated, not a dump. The point is that the
final coverage audit can confirm no library was silently skipped: you weighed all three for
every verse and chose deliberately.

## STEP 2 — Author the SQL fragment (follow the S212 John template exactly)

**A. Temp view** — uniquely named with YOUR tag, scoped to the full edition set (this is what
makes the migration pass the FULL-LIBRARY guard):
```sql
CREATE TEMP VIEW _s217_<TAG>_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');
```

**B. cross_references INSERT** from `WITH input(src_edition,src_slug,src_ch,src_v,
tgt_edition,tgt_slug,tgt_ch,tgt_v,note) AS (VALUES ...)`.
- SOURCE is ALWAYS the canon Acts verse: `'canon','acts',ch,v`.
- TARGET is any library verse (canon Tanakh/NT, or an extras edition).
- **Tiers (per-row, cast `::content_tier`):** canon targets (Tanakh + NT) = **`'free'`**;
  extra-canonical targets = **`'extras'`**. A single fragment mixes both — each row carries its
  own tier. (Compute the tier from the target edition: `'canon'` → `'free'`, else `'extras'`.)
- Join the view twice (sv on src_*, tv on tgt_*), `WHERE sv.verse_id <> tv.verse_id`,
  `ON CONFLICT (source_verse_id,target_verse_id,source) DO NOTHING`. `source='manual'`.
- The `note` is the per-row come-and-see note: the TARGET verse quoted IN FULL in italics with
  its citation in parentheses, then 1–3 sentences naming the framework connection to the Acts
  source verse (often quoting the Acts phrase inline in italics too).

**C. threads INSERT** — one per theme. `tier_required` = `'free'` if every member is canon,
`'extras'` if the thread carries any extras member (the lock pill renders off the thread tier).
`sort_order` from YOUR assigned band. Anchor start/end = the canon Acts verses that bound the
thread. `ON CONFLICT (slug) DO NOTHING`. The `summary_md` walks the whole thread in Come-and-See
prose, quoting the load-bearing verses in full in italics.

**D. thread_members INSERT** — link each cross_reference to its thread with `sort_order` +
`member_note` (a short come-and-see line naming the target + the connection).
`ON CONFLICT (thread_id,cross_reference_id) DO NOTHING`.

Use `E'...'` literals; escape every apostrophe as `''`.

## SORT BANDS
Fresh **5000+** band for Acts (no overlap with John's 3000/4000 bands). Sub-bands assigned per
range at spawn. **Acts 1–2 pilot: 5000–5099.** Later ranges step up (3–7: 5100+, 8–12: 5200+,
13–16: 5300+, 17–20: 5400+, 21–24: 5500+, 25–28: 5600+) — confirm at spawn.

## VOICE / CONTENT RULES (non-negotiable — audited against the Red Lines)

- **Come-and-see:** every verse quoted IN FULL in italics (`*...*`) with citation in
  parentheses, in `note`, `summary_md`, and `member_note`. No "cf.", no cite-without-quote, no
  appendix, no internal-document references ("per Red Line", "per the skill"), no "Yoshi's
  teaching on" — unfold the connection in the prose, let the verses do the work.
- **Sacred names** with parentheticals on every mention (the pull already carries them; preserve
  exactly). In your connective prose use the same convention.
- **Son of man → Son of Adam** everywhere (the pull already does this). Preserve the
  kaph-comparative *like the Son of Adam* ONLY at Daniel 7:13 / Revelation 1:13 / 14:14 — read
  as incarnation-honoring (Yahusha himself, the Formed cloud-rider who took on flesh), never as
  a standing counterfeit identification.
- **Christology:** Yahusha is the Formed drawn from the Formless — the God of the OT
  interactions, who came in flesh; he is Yahuah and has a Father. Acts 2:34–36's *Yahuah (LORD)
  said unto my Lord … both Lord and Messiah* is the right-hand enthronement of the Formed. No
  Trinitarian co-equal-persons grammar; no modalist collapse.
- **NT-Lord governing rule:** where Acts quotes/echoes an OT YHWH passage, the pull renders it
  *Yahuah (Lord)* (e.g. Acts 2:21 / Joel 2:32 / Romans 10:13). Where *Lord* is Yahusha titular
  or vocative, it stays *Lord*. Preserve what the pull gives.

### ACTS-SPECIFIC WATCHPOINTS (high risk — these get scrutinized at the voice gate)

- **The "Gentiles" of Acts 10–11 and 15 are the scattered seed / the lost sheep being gathered,
  NOT the false-inclusion of the nations into Yashar'el by faith-confession (Red Lines #7/#11).**
  The council's verdict (Acts 15:16–17) quotes Amos 9:11 — *I will build again the tabernacle of
  David* — the twelve-tribe restoration, not a new-people graft. Read "afar off" (Acts 2:39) as
  the dispersed house of Israel made nigh (the Lo-Ammi of Hosea 1), the hearing revealing what
  was already true — never names added after the foundation of the world.
- **Stephen's speech (Acts 7)** seed-war / sons-of-Belial language is conduct-within-the-covenant,
  not ethnic condemnation (Checklist 9). Never let it read as Jew-hatred.
- **Acts 2 Pentecost / Joel:** the outpouring is the latter-rain firstfruits of the gathering, not
  the abolition of Torah. Pentecost is Shavuot — the feast that *renews* the covenant; the Spirit
  poured writes the Torah on the heart (Jeremiah 31:33; Ezekiel 36:27), inseparable from it
  (Red Line #6). The "nation born in a day" is still future — Pentecost is the down-payment, not
  the consummated gathering.
- **No sola-fide truncation (Red Line #10):** Acts 15:11 / Ephesians-grace targets — never let
  *saved by grace* stand as a standalone freedom-from-Torah formula; complete the sentence —
  grace as the means of return to him and his ways.

- **Thread slugs use ENGLISH book-name fragments**, never Hebrew, prefixed with `acts-<chapter>-`,
  naming the weave, e.g. `acts-1-restore-the-kingdom-to-yasharel-the-twelve-tribe-gathering`,
  `acts-2-pentecost-shavuot-the-fire-of-sinai-and-the-torah-on-the-heart`. Check every slug
  against EXISTING_SLUGS.txt.
- **Source verse is ALWAYS the Acts verse** (the card renders per Acts chapter source verse).

## OUTPUT
Write your complete SQL fragment to your assigned path. Do NOT include `BEGIN;`/`COMMIT;` or
`\echo` (the orchestrator wraps one transaction). Start the file with a `--` comment block naming
your range, your tag, your sort band, the per-chapter coverage checklist, and each thread (slug +
target libraries). Return a concise summary: tag, output path, chapters covered, new thread slugs
with target libraries, total cross_reference rows, total member rows, and any chapter/verse with
no add + why.
