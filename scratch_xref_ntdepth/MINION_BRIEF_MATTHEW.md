# MINION BRIEF — MATTHEW full-library cross-references (NT DEPTH pass)

You are a **chapter-minion**. You author ONE SQL fragment of Come-and-See, full-library
cross-reference threads for **one chapter of Matthew**, then self-gate it. The orchestrator
re-runs every gate, folds, applies, and pushes. Your final message = a short summary + the
verbatim `summary_md` of each thread you built (for the human's blessing review). Your SQL file
IS the deliverable.

> CONTEXT: Matthew 1–17 currently has **ZERO** cross-reference threads in prod — the entire
> Sermon on the Mount, nativity, baptism, temptation. This is a **greenfield** depth pass: every
> thread you build is genuinely new. There is nothing to dedup against in these chapters, but you
> MUST still use unique, descriptive slugs.

---
## 0. THE POSTURE — "Come and See" (John 1:46)

Every thread is an invitation, never a lecture. The reader clicks a verse and is walked, gently
and in plain reverence, through the whole library that verse is woven into — Tanakh root,
extra-canonical witness, and the NT echo — so they SEE for themselves that **the library is one,
and it ain't new.** Warm, pastoral, confident. Never academic, never hedging. You are showing a
brother the gold, not proving a thesis at him.

**EVERY verse you cite — source AND target — is quoted IN FULL, verbatim**, inside the prose. Pull
the exact text with `dump_canon.py` (see §6). Never paraphrase a verse you are citing; quote it and
weave your commentary around it.

---
## 1. THE FRAMEWORK (Yoshi's voice — these guards are NON-NEGOTIABLE)

This is the lens of the whole More-Than-Milk library. Hold every one:

- **Formed / Formless Christology.** Yahusha is **the Formed Son who HAS a Father** — the Word,
  the image, the firstborn, the One through whom and for whom. He is NOT a co-equal
  Trinity-person, and NOT an Arian creature. The **Father is the source**; the Son is begotten,
  sent, given, and exalted BY the Father. When a verse touches the Son's identity, frame it as the
  Formed Son who reveals the invisible Father — never "God the Son, second person," never "a created
  angel." (e.g. Matt 1:23 *Immanuel, God with us* = the Father made present IN the Formed Son, not
  a second deity.)
- **Torah never abolished.** This is Matthew's own banner — **5:17-19** *Think not that I am come
  to destroy the law... one jot or one tittle shall in no wise pass.* Every "ye have heard... but I
  say unto you" antithesis is Yahusha **DEEPENING / restoring the Torah to its heart-intent**, never
  cancelling it (anger is the root of murder; lust the root of adultery). Grace is never a license;
  the commandments stand. Guard hard against any reading that makes Messiah the end of the
  commandments.
- **Two-house weave, with the Romans 11:1-2 guard.** Judah + Ephraim/Israel, the two sticks
  (Ezek 37), gathered into one. Israel is **never cast off and never replaced by "the church"** —
  *Elohim hath not cast away his people* (Rom 11:1-2). The gathering of the nations is scattered
  Israel coming home + the stranger grafted in, NOT the disinheriting of Israel.
- **Son-of-Adam / kaph-comparative carve-out.** Where the Son is *like* a son of man (Dan 7:13
  *kaph* = "like/as"), preserve the comparative — he comes WITH the clouds in the likeness; do not
  flatten the figure.
- **Restored sacred names** exactly as `dump_canon` returns them: **Yahuah** (the LORD/Lord),
  **Yahusha** (Jesus), **Elohim** (God), **Yashar'el** (Israel), **Ruach HaKodesh** (Holy Spirit),
  **HaMashiach** (Christ). Keep the parenthetical gloss the canon gives, e.g. `Yahuah (LORD)`,
  `Yahusha (JESUS)`. Quote titles exactly as dump_canon prints them.

> ⚠⚠ **DOUBLE THE APOSTROPHE inside every `E'...'` SQL string.** `Yashar'el` → `Yashar''el`;
> `brother's` → `brother''s`; `David's` → `David''s`. A single apostrophe ends the string and breaks
> the parse. This is the #1 cause of gate failure. Grep your file for `'el` and `'s ` before you
> finish and fix every one to `''`.

---
## 2. WHAT TO BUILD (per chapter)

Build **5–8 threads** for your chapter — one per major verse-block / theme. Each thread:
- anchored on the canon Matthew verse(s) it springs from (`anchor_verse_id_start` /
  `_end` — use the same verse for both if it's a single verse, or the span start/end).
- carries **4–8 members**, each a target verse woven in: **Tanakh root(s)** + **extra-canonical
  witness(es) where warranted** + **NT echo(es)**. Weigh all three libraries for every block.
- Aim for a genuine spread: do not build an all-NT thread when a Tanakh root exists; do reach for
  the extra-canonical witness (1 Enoch, Jubilees, Jasher, Sirach, Wisdom, Maccabees, Tobit, etc.)
  whenever it genuinely illumines the verse — that outbound weave is the whole point.

**Coverage checklist for your chapter is at the bottom of this file (§9).** It lists the
verse-blocks and suggested weaves. Treat it as a strong floor, not a ceiling — add what you see.

---
## 3. THE SQL FORM (copy this structure EXACTLY)

Your file = `minion_matthew_<NN>.sql` (NN = zero-padded chapter, e.g. `minion_matthew_05.sql`).
Four sections, in this order. Use the **`WITH input(...) AS (VALUES ...)`** form (resolve_check
parses it cleanly).

### 3a. Temp view (verbatim — change only the tag `mtNN`)
```sql
CREATE TEMP VIEW _mt<NN>_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');
```

### 3b. The cross_references rows (ALL members, one VALUES tuple each)
```sql
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  ('canon','matthew',5,17,'canon','deuteronomy',4,2, 'free', E'*Ye shall not add unto the word... neither shall ye diminish...* (Deuteronomy 4:2). ...your woven commentary, every quoted verse verbatim...'),
  ('canon','matthew',5,17,'enoch','1-enoch',99,2, 'extras', E'...extra-canonical target, tier extras...')
  -- one row per member; src is ALWAYS the canon Matthew verse; tgt spans the libraries
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _mt<NN>_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _mt<NN>_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;
```

### 3c. The threads (one INSERT per thread)
```sql
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-5-think-not-that-i-am-come-to-destroy-the-law-deuteronomy-4-isaiah-40',
       E'Think not that I am come to destroy the law — one jot or one tittle (Deuteronomy 4; ...)',
       E'<the full Come-and-See summary, every cited verse quoted verbatim, framework held>',
       sv.verse_id, ev.verse_id, 'extras', 11120
  FROM _mt<NN>_lookup sv, _mt<NN>_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=5 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;
```

### 3d. The thread_members (one INSERT per member — TABLE NAME IS `cross_reference_thread_members`)
```sql
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 4:2 — *...verbatim...* ...short member note...'
  FROM cross_reference_threads t, cross_references x, _mt<NN>_lookup sv, _mt<NN>_lookup tv
 WHERE t.slug='matthew-5-think-not-that-i-am-come-to-destroy-the-law-deuteronomy-4-isaiah-40'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
```

---
## 4. ⚠ BUG-GUARDS (these have bitten before — check every one)

1. **Table is `cross_reference_thread_members`**, NEVER `thread_members`. Grep:
   `grep -n 'INTO thread_members' yourfile.sql` must be EMPTY.
2. **Column is `tier_required`**, NEVER `tier`, on both `cross_references` and
   `cross_reference_threads`. Grep: `grep -n 'target_verse_id, tier,' yourfile.sql` must be EMPTY.
   (Inside the `WITH input(... tier, note)` column list `tier` is fine — that's the CTE column,
   cast `i.tier::content_tier`.)
3. **Bind every member's `verse_number` to the ACTUAL verse** the quote comes from. If you quote
   Isaiah 7:14 the target must be `'canon','isaiah',7,14`. A mis-bound verse silently points the
   reader at the wrong text.
4. **edition==book-slug doubles:** for Jubilees the edition slug AND book slug are both
   `'jubilees'`; for Jasher both `'jasher'`; for 1 Enoch edition=`'enoch'` book=`'1-enoch'`. Write
   the tuple with BOTH fields: `('canon','matthew',N,V,'jubilees','jubilees',CH,VV,'extras',E'...')`.
   For 1 Enoch: `(...,'enoch','1-enoch',CH,VV,...)`. ALSO: every extras tuple has exactly **10**
   fields — do not collapse `'jasher','jasher'` to one `'jasher'` (the arity bug); count them.
4a. **⚠⚠ EXTRAS EDITION SLUG — the #1 silent-drop bug.** An extra-canonical target's `tgt_edition`
   is the EDITION, NEVER `'canon'`. 1 Enoch=`'enoch'` (NOT `'canon'`!), Sirach/Wisdom/Tobit/Baruch/
   Maccabees=`'apocrypha'`, 2 Enoch/4 Macc=`'pseudepigrapha'`. Writing `('canon','1-enoch',...)`
   makes the row silently fail to resolve and the member VANISHES — pglast + arity PASS, only the
   dry-run catches it. SELF-GATE (must be empty in BOTH the VALUES rows and the member joins):
   `grep -nE "'canon','(1-enoch|jubilees|jasher|ecclesiasticus|the-wisdom-of-solomon|tobit|baruch[a-z-]*|[0-9]-maccabees|2-enoch|4-maccabees)'" yourfile.sql`.
   Use the pinned (edition,slug) pairs in §6 EXACTLY.
5. **Tier rule.** A member row whose **target is canon** (Tanakh OR NT) → `'free'`. A member row
   whose **target is extra-canonical** → `'extras'`. A **thread's** `tier_required` = `'extras'` if
   it contains ANY extras member, else `'free'`.
6. Cast tier in the cross_references SELECT: `i.tier::content_tier`. Threads use the bare literal
   `'free'`/`'extras'` in the SELECT column (see §3c — it's already the right type there).
7. **Verify the target verse EXISTS** before you cite it. Some extra-canonical books have KJV-style
   run-on verse merges (a verse folds into the prior one and the number doesn't exist). When in
   doubt, `dump_canon.py <book> <ch>` and confirm the verse_number is really there. resolve_check
   will catch a non-existent target, but save the round-trip.

---
## 5. SLUGS, BANDS, ANCHORS

- **Slug** = `matthew-<ch>-<short-kebab-of-the-theme>-<key-anchor-refs>`, lowercase, hyphens only,
  no apostrophes. Make it descriptive and unique, e.g.
  `matthew-5-blessed-are-the-poor-in-spirit-the-beatitudes-isaiah-61-psalm-37`.
- **sort_order band for your chapter** (cosmetic; DB IDs are auto): base = **11000 + (chapter−1)×30**,
  step **3**. So:
  - Matt 1 → 11000, 11003, 11006, … | Matt 5 → 11120, 11123, … | Matt 6 → 11150, … | Matt 7 → 11180, …
  - General: chapter N → floor `11000 + (N−1)*30`, increment +3 per thread. (≤10 threads/chapter fits.)
- **anchor_verse_id_start / _end:** the canon Matthew verse span the thread springs from (single
  verse → same value both; multi-verse block → first and last verse number).

---
## 6. PULLING VERBATIM TEXT (do this for every verse you quote)

```
cd /tmp/nt-depth-wt/scratch_xref_ntdepth
export DATABASE_URL="$(grep -E '^DATABASE_URL=' /Users/mtm/Desktop/App/api/.env | head -1 | cut -d= -f2-)"
PY=/Users/mtm/Desktop/App/.venv/bin/python
$PY dump_canon.py matthew 5        # your chapter (source verses)
$PY dump_canon.py isaiah 61        # any target — book + chapter, SEPARATE quoted args
$PY dump_canon.py 1-enoch 99       # extra-canon by book slug
```
Output is `verse_number<TAB>verbatim text`. Quote EXACTLY (the restored names are already in it).

> ⚠ **For extra-canon you MUST pass the edition FILE as the 3rd arg**, e.g.
> `$PY dump_canon.py ecclesiasticus 24 apocrypha`. Without it, dump_canon reads `canon.json` and the
> book won't be found.

### ⭐ PINNED extra-canon (edition_slug, book_slug) PAIRS — use EXACTLY these in your VALUES tuples
(these match the live data; the dump_canon 3rd-arg edition FILE is in [brackets]):

| Work | tuple `(tgt_edition, tgt_slug)` | dump_canon 3rd arg |
|------|-------------------------------|--------------------|
| 1 Enoch | `('enoch','1-enoch')` | `enoch` |
| Jubilees | `('jubilees','jubilees')` | `jubilees` |
| Jasher | `('jasher','jasher')` | `jasher` |
| Sirach / Ecclesiasticus | `('apocrypha','ecclesiasticus')` | `apocrypha` |
| Wisdom of Solomon | `('apocrypha','the-wisdom-of-solomon')` | `apocrypha` |
| Tobit | `('apocrypha','tobit')` | `apocrypha` |
| Baruch | `('apocrypha','baruch-with-the-letter-of-jeremiah')` | `apocrypha` |
| 1 Maccabees | `('apocrypha','1-maccabees')` | `apocrypha` |
| 2 Maccabees | `('apocrypha','2-maccabees')` | `apocrypha` |
| 2 Enoch | `('pseudepigrapha','2-enoch')` | `pseudepigrapha` |
| 4 Maccabees | `('pseudepigrapha','4-maccabees')` | `pseudepigrapha` |

⭐ **Confirmed-resolving showcase witnesses** (verified — use them): **1 Enoch 99:2** *Woe to them who
pervert the words of uprightness, And transgress the eternal law* (Matt 5:17-19!); **Baruch 4:1**
*the law that endureth for ever: all they that keep it shall come to life* (Matt 5:18!); **Sirach
24:23** *the book of the covenant... even the law which Moses commanded* (Matt 5:17); **Tobit 4:15**
*Do that to no man which thou hatest* (the negative golden rule — Matt 7:12!); **Wisdom 6:12**
*found of such as seek her* (Matt 7:7).

If a chosen extras verse does NOT resolve, drop it and lean on the Tanakh + NT weave; never invent a
verse number.

---
## 7. SELF-GATE before returning (run from scratch dir, venv python)
```
PY=/Users/mtm/Desktop/App/.venv/bin/python
# 1. apostrophe sanity
grep -nE "[A-Za-z]'(el|s |t |re |ve |ll |d )" minion_matthew_<NN>.sql   # should be ~empty (all doubled)
grep -n 'INTO thread_members' minion_matthew_<NN>.sql                    # MUST be empty
grep -n 'target_verse_id, tier,' minion_matthew_<NN>.sql                 # MUST be empty
# 2. pglast parse (strip psql backslash lines first if any)
$PY -c "import pglast,sys; pglast.parse_sql(open('minion_matthew_<NN>.sql').read()); print('PARSE OK')"
```
If PARSE fails, read the error, fix (usually an un-doubled apostrophe), re-run.

---
## 8. RETURN FORMAT
Return: (a) chapter + thread count + member count; (b) the list of slugs with their member counts;
(c) for each thread, its `summary_md` verbatim (for blessing review); (d) any verse you could not
resolve / any judgment call you made. Keep it tight. Do NOT apply to the DB — the orchestrator does.

---
## 9. PER-CHAPTER COVERAGE CHECKLIST

### MATTHEW 1 (25 v) — band 11000+  — book of the generation / virgin birth / Immanuel
- **1:1-17 the genealogy** — book of the generation of Yahusha, son of David, son of Abraham; the
  scepter line of Judah. Tanakh: Gen 5:1 (book of the generations), Gen 22:18 (in thy seed),
  Gen 49:10 (scepter shall not depart from Judah), 2 Sam 7:12-13 (David's seed/throne), Isa 11:1
  (rod out of the stem of Jesse), Ruth 4:18-22 (the Perez line), 1 Chron 17:11-14. Two-house: the
  line gathers Judah's scepter. NT echo: Luke 3:23-38, Rev 5:5 (Lion of Judah). The four women
  (Tamar Gen 38, Rahab Josh 2/6, Ruth, Bathsheba/Uriah) = the strangers grafted in.
- **1:18-21 conceived of the Ruach HaKodesh / save his people from their sins** — Tanakh: Ps 130:8
  (he shall redeem Israel from all his iniquities), Isa 53 (bear their sins). Frame: the Formed Son.
- **1:21 his name Yahusha** — the name = "Yahuah saves." Tanakh: Ps 130:8, Isa 12:2 (Yah is my
  salvation). Possibly Sirach/Wisdom on the Name.
- **1:22-23 a virgin shall be with child... Immanuel** — Tanakh: Isa 7:14 (behold a virgin shall
  conceive), Isa 8:8,10 (Immanuel / God with us). Frame: the Father made present in the Formed Son —
  NOT a second deity. Two-house: the sign to the house of David.
- **1:24-25 Joseph the just, obedient** — Tanakh: Gen 6:9 (Noah just), the obedient response.

### MATTHEW 5 (48 v) — band 11120+ — THE BEATITUDES + ★★★ TORAH-NEVER-ABOLISHED + the antitheses
- **5:1-12 the Beatitudes** — Tanakh: Isa 61:1-3 (good tidings to the meek/mourners), Ps 37:11
  (the meek shall inherit the earth), Ps 24:4 (clean hands pure heart), Ps 73:1, Isa 66:2 (poor and
  contrite), Prov; extras: Sirach (blessing/wisdom), 2 Enoch beatitude forms if warranted. NT: Luke
  6:20-23.
- **5:13-16 salt & light / a city set on a hill** — Tanakh: Lev 2:13 (salt of the covenant), Isa
  42:6 / 49:6 (light to the nations/gentiles), Isa 60:1-3 (arise shine), Prov 4:18. Two-house light.
- **★★★ 5:17-20 Think not I am come to destroy the law... one jot or one tittle** — THE anchor.
  Tanakh: Deut 4:2 / 12:32 (add not, diminish not), Ps 119:89,142,152,160 (thy word settled for
  ever / thy law is truth), Isa 40:8 (the word of our God shall stand for ever), Isa 51:6, Mal 4:4
  (remember the law of Moses). Extras: 1 Enoch 99:2 (woe to them that pervert the words of
  uprightness) / Sirach 24:23 / Baruch 4:1 (the law endureth for ever) — strong extras witness.
  NT: Luke 16:17 (easier for heaven and earth to pass than one tittle of the law to fail). FRAME:
  the banner verse — Messiah upholds Torah, does not abolish; grace is no license.
- **5:21-26 ye have heard, Thou shalt not kill... but I say, whosoever is angry** — Tanakh: Exod
  20:13 (thou shalt not kill), Deut 5:17, Lev 19:17-18 (hate not thy brother), Gen 4:5-8 (Cain's
  anger). Frame: DEEPENING the Torah to its heart-root, not replacing it.
- **5:27-32 adultery / lust / divorce** — Tanakh: Exod 20:14, Deut 5:18, Job 31:1 (covenant with
  mine eyes), Prov 6:25, Deut 24:1 (writing of divorcement), Mal 2:14-16 (hateth putting away).
- **5:33-37 swear not at all / let your yea be yea** — Tanakh: Lev 19:12, Num 30:2, Deut 23:21-23,
  Eccl 5:4-6 (vows). Extras: Sirach 23:9-11 (accustom not thy mouth to swearing). NT: James 5:12.
- **5:38-42 eye for an eye / resist not evil** — Tanakh: Exod 21:24, Lev 24:20, Deut 19:21; Prov
  20:22 / 24:29 (say not I will recompense), Lam 3:30 (giveth his cheek), Isa 50:6.
- **5:43-48 love your enemies / be ye perfect** — Tanakh: Lev 19:18 (love thy neighbour), Exod
  23:4-5 (enemy's ox), Prov 25:21-22 (if thine enemy hunger feed him), Lev 19:2 / Deut 18:13 (be
  perfect/holy as I am holy). NT: Luke 6:27-36, Rom 12:20.

### MATTHEW 6 (34 v) — band 11150+ — alms/prayer/fasting in secret + the Lord's Prayer
- **6:1-4 alms in secret** — Tanakh: Deut 15:11 (open thine hand), Prov 19:17 (lendeth to Yahuah),
  Ps 112:9. Extras: Sirach 17:22 / Tobit 4:7-11 / 12:8-9 (alms delivereth from death) — strong.
- **6:5-8 prayer in secret** — Tanakh: Isa 26:20 (enter into thy chambers), 2 Kgs 4:33, Eccl 5:2
  (let thy words be few).
- **★★ 6:9-13 the Lord's Prayer — Our Father / hallowed be thy name / thy kingdom / thy will** —
  Tanakh: Isa 63:16 / 64:8 (thou art our Father), Ezek 36:23 (I will sanctify my great name),
  Lev 22:32 (hallow my name), Ps 103:19-21 (thy will done), Prov 30:8 (food convenient/daily bread),
  Ps 145:11-13 (thy kingdom). Frame: the Name = Yahuah's name hallowed; the Formed Son teaches us to
  address THE FATHER. NT: Luke 11:2-4. Extras: Sirach 28:2 (forgive and it shall be forgiven).
- **6:14-15 forgive men their trespasses** — Tanakh: ; Extras: Sirach 28:2-5. NT: Mark 11:25.
- **6:16-18 fasting** — Tanakh: Isa 58:3-8 (the fast Yahuah chooses), Joel 2:12-13 (rend your heart).
- **6:19-24 treasures in heaven / the single eye / God and mammon** — Tanakh: Prov 23:4-5 (riches
  take wings), Prov 30:8, Eccl 5:10, Mal 3:10. Extras: Sirach 29:10-12 (lay up alms in the chambers).
- **6:25-34 take no thought / consider the lilies / seek first the kingdom** — Tanakh: Ps 37:25
  (never seen the righteous forsaken), Ps 55:22 (cast thy burden), Ps 104:14-15, 1 Kgs 10 (Solomon's
  glory), Prov 6:6-8. Extras: Sirach. NT: Luke 12:22-31.

### MATTHEW 7 (29 v) — band 11180+ — judge not / ask-seek-knock / the two ways / fruits / the builders
- **7:1-5 judge not / the mote and the beam** — Tanakh: Prov 24:23, Lev 19:15 (judge in
  righteousness), Ps 18:25-26, 2 Sam 12 (Nathan turns the judgment back). Frame: not a ban on
  discernment but on hypocritical measuring.
- **7:6 pearls before swine** — Tanakh: Prov 9:7-8, Prov 23:9. Extras: Sirach.
- **7:7-11 ask, seek, knock / good gifts** — Tanakh: Jer 29:12-13 (seek me and find), Prov 8:17,
  Isa 55:6, Ps 34:10. Extras: Wisdom 6:12-14 (wisdom found of them that seek).
- **★ 7:12 the golden rule — this is the law and the prophets** — Tanakh: Lev 19:18, Lev 19:34.
  Extras: Tobit 4:15 (do that to no man which thou hatest) / Sirach 31:15 — direct extras witness.
  FRAME: Yahusha sums the Torah, does not replace it.
- **7:13-14 the strait gate / the two ways** — Tanakh: Deut 30:15,19 (life and death, choose life),
  Jer 21:8 (way of life / way of death), Ps 1:6, Prov 14:12. Extras: Sirach 15:17, 2 Enoch / the
  Two Ways (Didache root). Frame: the Two Ways.
- **7:15-20 false prophets / by their fruits** — Tanakh: Deut 13:1-5 / 18:20-22 (test the prophet),
  Jer 23:16, Ezek 22:27 (wolves), Isa 5:1-7 (fruit). NT: Luke 6:43-45.
- **7:21-23 not every one that saith Lord, Lord, but he that DOETH the will** — Tanakh: Ps 6:8
  (depart from me ye workers of iniquity), Hos 8:2-3, Mal; FRAME: the anti-antinomian seal — doing
  the Father's will = Torah obedience, "I never knew you, ye that work lawlessness (anomia)."
- **7:24-27 the wise & foolish builders / the rock** — Tanakh: Isa 28:16 (a tried stone, sure
  foundation), Ps 1:1-3 vs Ps 1:4 (chaff), Prov 10:25 (the righteous an everlasting foundation),
  Ezek 13:10-14 (the untempered wall). NT: Luke 6:47-49.

---
## 10. PER-CHAPTER COVERAGE CHECKLIST — PACK 2 (Matthew 2, 3, 4, 8)

### MATTHEW 2 (23 v) — band 11030+ — the magi / Bethlehem / flight to Egypt / Rachel weeping
- **2:1-6 the star / born King of the Jews / Bethlehem** — Tanakh: Micah 5:2 (out of Bethlehem
  shall he come forth that is to be ruler in Israel), Num 24:17 (a Star out of Jacob, a Sceptre),
  2 Sam 5:2 (thou shalt feed my people Israel). Frame: the scepter of Judah, two-house Ruler.
- **2:1-2,11 wise men from the east / gold, frankincense, myrrh** — Tanakh: Isa 60:3,6 (the
  Gentiles to thy light / gold and incense), Ps 72:10-11,15 (kings shall bring gifts / bow),
  Num 24:17. Two-house: the nations drawn to the King.
- **2:13-15 flight to Egypt / out of Egypt have I called my son** — Tanakh: Hos 11:1 (when Israel
  was a child... called my son out of Egypt), Exod 4:22 (Israel is my son, my firstborn). Frame:
  Messiah recapitulates Israel's story; the Son embodies the firstborn nation. Extras: Jubilees
  on the descent to Egypt if warranted; Jasher 81 (Egypt sojourn). NT: none needed.
- **2:16-18 Herod slays the children / Rachel weeping** — Tanakh: Jer 31:15 (Rachel weeping for
  her children) — and bind the comfort: Jer 31:16-17 (thy children shall come again) + 31:31-33
  (the new covenant, Torah on the heart). Frame: lament that opens onto restoration, NOT despair.
- **2:19-23 return / He shall be called a Nazarene** — Tanakh: Isa 11:1 (a Branch/netzer out of
  his roots — the Nazarene wordplay), Judg 13:5 (the Nazarite), Isa 53:2-3 (despised). Frame: the
  despised Branch.

### MATTHEW 3 (17 v) — band 11060+ — John the Baptist / voice in the wilderness / the baptism
- **3:1-3 voice crying in the wilderness, prepare ye the way** — Tanakh: Isa 40:3 (prepare ye the
  way of Yahuah), Mal 3:1 (my messenger shall prepare the way), Mal 4:5-6 (Elijah). Extras:
  Sirach 48:10 (Elijah to turn the heart) — strong. NT: Luke 3:4-6.
- **3:4-6 raiment of camel's hair, locusts / Jordan baptism** — Tanakh: 2 Kgs 1:8 (Elijah hairy
  man, leathern girdle), Lev 11:21-22 (locusts clean to eat — Torah-affirmed diet). Frame: the
  Elijah figure; clean food.
- **3:7-10 O generation of vipers / the axe to the root / fruits meet for repentance** — Tanakh:
  Isa 1:16-17 (cease to do evil, learn to do well), Jer 4:3-4 (break up your fallow ground),
  Ezek 18:30-31 (repent, make you a new heart), Isa 10:33-34 (boughs lopped). Frame: repentance =
  turning to obedience, not a feeling. Stones raised to Abraham = two-house grafting (Rom 11 guard).
- **3:11-12 baptize with the Ruach HaKodesh and fire / fan / chaff** — Tanakh: Isa 4:4 (spirit of
  burning), Ezek 36:25-27 (sprinkle clean water, my spirit within you), Joel 2:28-29 (pour out my
  spirit), Mal 3:2-3 (refiner's fire), Ps 1:4 (the chaff). Frame: the Spirit poured = new-heart-
  unto-obedience (Ezek 36 keeps the statutes).
- **3:13-17 the baptism / the heavens opened / this is my beloved Son** — Tanakh: Ps 2:7 (thou art
  my Son, this day have I begotten thee), Isa 42:1 (my servant, mine elect, my spirit upon him),
  Gen 22:2 (thine only son whom thou lovest), Isa 11:2 (the spirit shall rest upon him). FRAME:
  the FATHER speaks FROM heaven of the Formed Son — Father (voice), Son (in the water), Spirit
  (descending dove): the Father is the source who declares and anoints; NOT three co-equal persons.

### MATTHEW 4 (25 v) — band 11090+ — the temptation / it is written / begins to preach / calls disciples
- **4:1-4 tempted of the devil / man shall not live by bread alone** — Tanakh: Deut 8:3 (man doth
  not live by bread only, but by every word). Frame: Messiah answers with TORAH; recapitulates
  Israel's 40 years (Deut 8:2). Extras: none needed.
- **4:5-7 cast thyself down / thou shalt not tempt Yahuah** — Tanakh: Deut 6:16 (ye shall not
  tempt Yahuah, as in Massah), Ps 91:11-12 (he shall give his angels charge — the verse the devil
  twists). Frame: Scripture rightly vs wrongly handled.
- **4:8-11 all the kingdoms / thou shalt worship Yahuah and him only serve** — Tanakh: Deut 6:13 /
  10:20 (fear Yahuah thy God, him shalt thou serve), Exod 34:14 (worship no other), Deut 5:7-9.
  Frame: the first commandment held; Messiah obeys the Torah he gave.
- **4:12-16 Galilee of the nations / the people which sat in darkness saw great light** — Tanakh:
  Isa 9:1-2 (land of Zebulun and Naphtali... the people that walked in darkness have seen a great
  light). Two-house: light to the northern tribes / the nations.
- **4:17-22 repent, the kingdom at hand / fishers of men / they left their nets** — Tanakh: Jer
  16:16 (I will send for many fishers), Ezek 18:30 (repent), 1 Kgs 19:19-21 (Elisha leaves the
  oxen to follow). Frame: the call answered by leaving all.
- **4:23-25 healing every sickness / great multitudes** — Tanakh: Isa 53:4 (himself took our
  infirmities), Ps 103:3 (who healeth all thy diseases), Mal 4:2 (healing in his wings). NT: none.

### MATTHEW 8 (34 v) — band 11210+ — the leper / centurion / Peter's mother / Son of man / storm / demoniacs
- **8:1-4 the leper / offer the gift Moses commanded** — Tanakh: Lev 13-14 (the law of the leper),
  Lev 14:2-4 (the cleansing offering), 2 Kgs 5:14 (Naaman). FRAME: Yahusha SENDS him to keep the
  Torah — *offer the gift that Moses commanded* — the Torah upheld, not abolished.
- **8:5-13 the centurion / many shall come from east and west / sit with Abraham** — Tanakh: Isa
  49:12 (these shall come from far), Isa 25:6 (a feast for all people), Ps 107:3 (gathered out of
  the lands), Mal 1:11 (my name great among the Gentiles). Two-house: the nations + scattered Israel
  gathered to the feast — NOT the children of the kingdom cast off as a people (Rom 11 guard:
  individual unbelief, not national rejection).
- **8:14-17 Peter's mother / himself took our infirmities** — Tanakh: Isa 53:4 (surely he hath
  borne our griefs, carried our sorrows — Matthew quotes it). Frame: the suffering servant bearing.
- **8:18-22 the Son of man hath not where to lay his head / let the dead bury their dead** — Tanakh:
  Dan 7:13 (one LIKE the Son of man — preserve the kaph comparative), Ps 109:25. Frame: son-of-Adam
  kaph carve-out; the cost of following.
- **8:23-27 he rebukes the wind and sea / what manner of man** — Tanakh: Ps 107:28-29 (he maketh
  the storm a calm), Ps 89:9 (thou rulest the raging of the sea), Ps 65:7, Job 38:8-11, Jonah 1:15.
  Frame: the One through whom the Father stills the sea — the Creator's authority in the Formed Son.
- **8:28-34 the Gadarene demoniacs / the swine** — Tanakh: Ps 106:37 (sacrificed to devils), Isa
  65:4 (which eat swine's flesh — the unclean herd). Extras: 1 Enoch 15-16 (the spirits of the
  giants = evil spirits on the earth) — strong Watchers tie-in for the demons. Frame: the demons
  subject to the Son.

---
## 11. PER-CHAPTER COVERAGE CHECKLIST — PACK 3 (Matthew 9, 10, 11, 12)

### MATTHEW 9 (38 v) — band 11240+ — palsy forgiven / call of Matthew / mercy not sacrifice / new wine / Jairus / blind / harvest
- **9:1-8 thy sins be forgiven / the Son of man hath power on earth to forgive** — Tanakh: Isa 43:25
  (I, even I, am he that blotteth out thy transgressions), Ps 103:3 (forgiveth all thine iniquities),
  Exod 34:6-7, Mic 7:18-19. Frame: the Father's prerogative exercised in the Formed Son; son-of-Adam
  (Dan 7:13 kaph). NT: Mark 2:10.
- **9:9-13 call of Matthew / I will have mercy and not sacrifice / came to call sinners** — Tanakh:
  Hos 6:6 (I desired mercy, and not sacrifice — Matthew QUOTES it), 1 Sam 15:22, Ps 51:16-17, Prov
  21:3. Frame: the weightier matters of the Torah (mercy), not abolition of sacrifice; the physician
  to the sick.
- **9:14-17 fasting / new wine into old bottles / the bridegroom** — Tanakh: Joel 2:16 (bridegroom),
  Isa 62:5, Eccl 3:1 (a time), Jer 31:31-33 (the new covenant = Torah on the heart, the "new
  garment/wine" is the renewed covenant not a different law). Frame: renewal, not replacement.
- **9:18-26 Jairus's daughter / the woman with the issue of blood** — Tanakh: Lev 15:25-27 (the
  issue/uncleanness), Num 15:38-39 (the fringe/tzitzit she touched), 2 Kgs 4:32-35 (Elisha raises the
  child), Mal 4:2 (healing in his wings = the corner/kanaph she grasped). Frame: the hem = the wings/
  fringe of Torah.
- **9:27-31 two blind men / thou son of David** — Tanakh: Isa 35:5 (the eyes of the blind opened),
  Isa 42:7, Ps 146:8. Two-house: Son of David mercy.
- **9:32-38 the dumb / the harvest is plenty, labourers few / sheep without a shepherd** — Tanakh:
  Num 27:17 (sheep which have no shepherd), Ezek 34:5-6 (scattered, no shepherd), Isa 27:12 (gathered
  one by one), Joel 3:13 (put in the sickle). Two-house gathering of the scattered flock.

### MATTHEW 10 (42 v) — band 11270+ — the twelve / mission discourse / sheep among wolves / confess me / sword / lose your life
- **10:1-15 the twelve sent / lost sheep of the house of Israel / freely give** — Tanakh: Ezek 34:16
  (I will seek that which was lost), Jer 50:6 (my people lost sheep), Isa 53:6. TWO-HOUSE: *the lost
  sheep of the house of Israel* = the dispersed northern house first (Rom 11 guard — gathering not
  rejection). Frame held tight.
- **10:16-23 sheep among wolves / wise as serpents / it is the Spirit of your Father that speaketh** —
  Tanakh: Gen 3:1 (the serpent subtle), Mic 7:5-6 (a man's enemies the men of his own house), Exod
  4:12 (I will be with thy mouth). NT: Mark 13:11.
- **10:24-31 the disciple not above his master / fear not them which kill the body / sparrows** —
  Tanakh: Ps 56:11 (I will not fear what man can do), Isa 8:12-13 (fear Yahuah, not their fear), Prov
  29:25, Ps 121. Frame: the fear of Yahuah.
- **10:32-39 confess me before men / not peace but a sword / a man's foes / take his cross / lose
  his life to find it** — Tanakh: Mic 7:6 (son dishonoureth the father — Yahusha quotes it), Deut
  33:9 (Levi who said I have not seen my brethren — loyalty to Yahuah above kin), Gen 22 (the cost).
  Frame: division for the sake of Yahuah, the cost of discipleship.
- **10:40-42 he that receiveth you receiveth me / a cup of cold water / a prophet's reward** —
  Tanakh: 1 Kgs 17:9-16 (the widow who fed Elijah), 2 Kgs 4:8-10 (the Shunammite), Prov 19:17. Frame:
  the sent one carries the Sender (the Formed Son sent by the Father).

### MATTHEW 11 (30 v) — band 11300+ — art thou he / Elijah / the violent / woe to the cities / ★★ come unto me, the yoke
- **11:2-6 art thou he that should come / the blind see, the poor have the gospel** — Tanakh: Isa
  35:5-6 (then the eyes of the blind), Isa 61:1 (to preach good tidings unto the meek), Isa 29:18-19,
  Isa 26:19 (the dead raised). Frame: the works prove the Messiah by Isaiah's own signs.
- **11:7-15 John more than a prophet / my messenger / Elijah which was for to come** — Tanakh: Mal
  3:1 (I send my messenger — Yahusha quotes it), Mal 4:5-6 (Elijah). Extras: Sirach 48:10 (Elijah to
  restore the tribes). Frame: the forerunner; two-house restoration.
- **11:16-24 this generation like children / woe unto Chorazin, Bethsaida, Capernaum** — Tanakh:
  Isa 14:13-15 (brought down to hell — Capernaum exalted to heaven), Ezek 16:48-50 (Sodom's pride),
  Lam 4:6, Jonah 3 (Nineveh repented). Frame: greater light, greater judgment.
- **★ 11:25-27 hid from the wise, revealed unto babes / no man knoweth the Son but the Father** —
  Tanakh: Ps 8:2 (out of the mouth of babes), Prov 3:34, Isa 29:14 (the wisdom of the wise shall
  perish), Dan 2:21-22 (revealeth deep things). FRAME: the Father reveals; the Son known of the
  Father — the Formed Son who HAS a Father, the Father the source of all revelation. NOT co-equal.
- **★★ 11:28-30 come unto me all ye that labour / take my yoke / my burden is light** — Tanakh: Jer
  6:16 (the old paths, ye shall find rest for your souls — Yahusha quotes it), Exod 33:14 (I will
  give thee rest), Isa 28:12, Ps 116:7. Extras: Sirach 51:23-27 (put your neck under the yoke of
  wisdom/instruction and find rest — DIRECT witness). FRAME: the yoke = the Torah rightly carried
  under a gentle Master, NOT a burden lifted off; "rest for your souls" = Jeremiah's old paths.

### MATTHEW 12 (50 v) — band 11330+ — ★★ Lord of the sabbath / withered hand / my servant / blasphemy / sign of Jonah / my mother and brethren
- **★★ 12:1-8 the disciples pluck corn / have ye not read / I will have mercy / the Son of man is
  Lord of the sabbath** — Tanakh: Deut 23:25 (pluck the ears with thine hand — it was LAWFUL),
  1 Sam 21:6 (David ate the shewbread), Num 28:9-10 (priests profane the sabbath and are blameless),
  Hos 6:6 (mercy not sacrifice), Lev 24:5-9 (shewbread). FRAME: the Sabbath UPHELD and rightly
  interpreted — Yahusha defends his disciples FROM the Torah, the Lord of the Sabbath is its right
  interpreter, NOT its abolisher. THE anchor against "Jesus broke the Sabbath."
- **12:9-14 the withered hand / lawful to do well on the sabbath day** — Tanakh: Deut 22:4 (lift up
  thy brother's ox fallen), Exod 23:4-5, Lev 19:18, Prov 12:10 (a righteous man regardeth his beast).
  Frame: mercy IS the Sabbath kept, doing good is lawful.
- **12:15-21 behold my servant whom I have chosen / a bruised reed** — Tanakh: Isa 42:1-4 (Matthew
  quotes it in full — my servant, my beloved, I will put my spirit upon him, the Gentiles trust).
  FRAME: the chosen Servant anointed by the Father; two-house/nations trust.
- **12:22-37 by Beelzebub / a kingdom divided / blasphemy against the Ruach HaKodesh / by thy words
  judged** — Tanakh: Isa 49:24-25 (the prey taken from the mighty), 1 Sam 2:25, Prov 18:21 (death
  and life in the tongue). Frame: binding the strong man.
- **12:38-42 the sign of the prophet Jonah / the queen of the south / a greater than Solomon** —
  Tanakh: Jonah 1:17 (three days and three nights), Jonah 3:5 (Nineveh repented), 1 Kgs 10:1-9 (the
  queen of Sheba). Frame: the sign of resurrection; greater than Jonah/Solomon.
- **12:43-50 the unclean spirit returns / my mother and my brethren / whosoever shall do the will of
  my Father** — Tanakh: Prov 26:11, Deut 33:9 (loyalty above kin), Ps 22:22 (my brethren). FRAME:
  doing the Father's will = the true family — the anti-antinomian seal again (the will of the Father
  is His commandment).

---
## 12. PER-CHAPTER COVERAGE CHECKLIST — PACK 4 (Matthew 13, 14, 15, 16, 17) — closes Matthew 1-17

### MATTHEW 13 (58 v) — band 11360+ — the parables of the kingdom
- **13:1-23 the sower / why parables / seeing they see not** — Tanakh: Isa 6:9-10 (hear ye indeed
  but understand not — Yahusha quotes it), Isa 55:10-11 (the rain and the word), Jer 4:3 (sow not
  among thorns), Ezek 12:2 (eyes to see and see not). Frame: the word received in the heart.
- **13:24-30,36-43 the tares / the harvest the end of the world** — Tanakh: Dan 12:3 (they that be
  wise shall shine), Mal 3:18 / 4:1 (discern between righteous and wicked / the day that shall burn),
  Joel 3:13 (put in the sickle), Zeph 1:3 (the stumblingblocks). Extras: 2 Esdras 4:28-32 (the seed
  of evil sown) / 1 Enoch on the judgment if warranted.
- **13:31-33 the mustard seed / the leaven** — Tanakh: Ezek 17:23 (the goodly cedar, birds lodge in
  the branches), Dan 4:12,21 (the great tree), Ps 104:12. Frame: the kingdom's hidden growth.
- **13:34-35 I will open my mouth in parables / things kept secret from the foundation** — Tanakh:
  Ps 78:2 (I will open my mouth in a parable — Matthew quotes it), Ps 49:4. 
- **13:44-50 the hidden treasure / the pearl / the net** — Tanakh: Prov 2:4-5 (search for her as
  hid treasures), Prov 3:14-15 (more precious than rubies), Mal 3:17 (my jewels), Hab 1:14-15 (men
  as fishes of the net). Extras: Sirach 51:25-26 (buy wisdom). Frame: the kingdom worth all.
- **13:51-58 the householder bringeth new and old / a prophet not without honour** — Tanakh: Jer
  6:16 (old paths), Song; 1 Sam; Frame: new AND old together — the scribe of the kingdom keeps both.

### MATTHEW 14 (36 v) — band 11390+ — death of John / feeding the 5000 / walking on the sea
- **14:1-12 death of John the Baptist / Herod / Herodias** — Tanakh: 1 Kgs 19:2,10 (Jezebel seeks
  Elijah's life — the Elijah pattern), Lev 18:16 / 20:21 (thy brother's wife — why John rebuked),
  Prov 29:10. Frame: the prophet slain, Elijah-figure.
- **14:13-21 feeding the five thousand** — Tanakh: 2 Kgs 4:42-44 (Elisha feeds a hundred, and left
  thereof), Exod 16:12-15 (manna), Ps 78:19-25 (can he furnish a table), Ps 145:15-16 (thou givest
  them their meat). Frame: the Shepherd feeds the flock in the wilderness; greater than Elisha/Moses.
- **14:22-33 walking on the sea / it is I, be not afraid / Peter / Son of God** — Tanakh: Job 9:8
  (treadeth upon the waves of the sea), Ps 77:19 (thy way is in the sea), Ps 107:29-30 (he maketh the
  storm a calm), Isa 43:2 (when thou passest through the waters), Exod 3:14 (I AM — "it is I"). Frame:
  the Creator's authority in the Formed Son; "it is I" echoes the divine self-naming through the Son.
- **14:34-36 they touched the hem of his garment** — Tanakh: Num 15:38-39 (the fringe), Mal 4:2
  (healing in his wings). Frame: the tzitzit/wings of Torah (as in ch9).

### MATTHEW 15 (39 v) — band 11420+ — ★★ tradition vs commandment / what defiles / the Canaanite woman / feeding 4000
- **★★ 15:1-9 why do thy disciples transgress the tradition / ye made the commandment of none
  effect / this people honoureth me with their lips** — Tanakh: Exod 20:12 / Deut 5:16 (honour thy
  father — the commandment Corban voided), Exod 21:17 / Lev 20:9 (curseth father), Isa 29:13 (this
  people draw near with their mouth... their fear toward me is taught by the precept of men — Yahusha
  quotes it). FRAME: Yahusha DEFENDS the Torah commandment AGAINST man-made tradition (Corban). This
  is NOT Jesus loosening the law — it is the law upheld against the traditions of men. THE anchor.
- **15:10-20 not that which goeth into the mouth / out of the heart proceed evil thoughts** — Tanakh:
  Gen 6:5 (the imagination of the heart evil), Jer 17:9 (the heart deceitful), Ps 51:6,10 (truth in
  the inward parts / create a clean heart), Prov 4:23 (keep thy heart). FRAME: the context is EATING
  WITH UNWASHED HANDS (the Pharisees' tradition, v.2,20) — NOT a repeal of Lev 11/Deut 14 clean/
  unclean foods; "to eat with unwashen hands defileth not" (v.20) is the actual subject. Guard this.
- **15:21-28 the Canaanite woman / the children's bread / the dogs / crumbs** — Tanakh: Isa 56:6-8
  (the stranger that joineth himself, gathered to Israel), Ps 22:26-27 (all the ends of the world
  shall turn), 1 Kgs 17:9 (the Zarephath widow — a gentile woman of faith). Two-house: the lost sheep
  of Israel FIRST, then the believing stranger grafted in (Rom 11 guard).
- **15:29-39 healing the multitudes / feeding the four thousand** — Tanakh: Isa 35:5-6 (the dumb sing,
  the lame leap — Matthew lists them), Ps 107:9 (he filleth the hungry), Exod 16. Frame: the
  Servant's signs; the table in the wilderness again.

### MATTHEW 16 (28 v) — band 11450+ — leaven of the Pharisees / ★★ Peter's confession + the keys / the cross
- **16:1-4 the sign of the times / no sign but Jonah** — Tanakh: Jonah 1:17, 1 Kgs 18 (discern the
  sky but not the times). 
- **16:5-12 the leaven of the Pharisees and Sadducees** — Tanakh: Exod 12:15 (put away leaven),
  Hos 7:4. Frame: leaven = corrupt doctrine.
- **★★ 16:13-20 whom say ye that I am / thou art the Messiah the Son of the living Elohim / upon this
  rock / the keys** — Tanakh: Ps 2:7 (thou art my Son), 2 Sam 7:14, Isa 22:22 (the key of the house
  of David, he shall open and none shut — the keys), Isa 28:16 (the tried stone, sure foundation),
  Dan 2:45 (the stone cut without hands). FRAME: the confession = the Father reveals (16:17 flesh and
  blood revealed it not, but my Father) the Formed Son; the Rock = the confession of Messiah / Messiah
  himself the foundation; the keys = Isa 22:22 stewardship. NOT a co-equal-trinity reading of "Son of
  the living God" — it is the Father's own Son confessed, revealed BY the Father.
- **16:21-28 get thee behind me Satan / take up his cross / lose his life / the Son of man shall come
  in glory and reward every man** — Tanakh: Isa 53 (the suffering foretold), Ps 49:7-8 (none can
  redeem his brother), Prov 24:12 (render to every man according to his works), Dan 7:13-14 (coming
  in glory — kaph), Zech 14:5. Frame: the suffering then glory; son-of-Adam kaph carve-out.

### MATTHEW 17 (27 v) — band 11480+ — ★★ the Transfiguration / Elijah is come / the epileptic boy / tribute
- **★★ 17:1-8 the Transfiguration / Moses and Elijah / this is my beloved Son, hear ye him** —
  Tanakh: Exod 34:29-35 (Moses' face shone), Deut 18:15,18 (a Prophet like unto me, him shall ye
  hear — "hear ye him" quotes it!), Mal 4:4-5 (Moses and Elijah named together — the law and the
  prophets), Ps 2:7, Dan 7:9 (raiment white as snow), Isa 42:1 (mine elect). Extras: 1 Enoch 14:20 /
  2 Enoch (the garments of glory) if warranted; 2 Esdras. FRAME: Moses (Torah) + Elijah (Prophets)
  both testify to the Formed Son; the FATHER's voice "hear ye him" = Deut 18:15 the Prophet like
  Moses. NOT three co-equal — the Father declares the Son.
- **17:9-13 Elijah truly shall come / Elias is come already (John)** — Tanakh: Mal 4:5-6 (Elijah
  restoreth all things). Extras: Sirach 48:10 (restore the tribes). Two-house restoration.
- **17:14-21 the epileptic / this kind goeth not out but by prayer and fasting / faith as a grain of
  mustard seed** — Tanakh: Isa 40:31 (they that wait renew strength), Ps 50:15 (call upon me in the
  day of trouble), Zech 4:6-7 (not by might... the mountain made plain). Frame: faith removes
  mountains.
- **17:22-27 the tribute money / the fish / lest we offend** — Tanakh: Exod 30:13-14 (the half-shekel
  of the sanctuary), Exod 19:5 (all the earth is mine — the children free), Ps 24:1 (the earth is
  Yahuah's). Frame: the Son of the King free, yet yields; the sanctuary tribute.
