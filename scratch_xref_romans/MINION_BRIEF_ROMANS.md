# MINION BRIEF — S219 Romans cross-references (FULL LIBRARY, per chapter)

You are authoring the **full cross-reference apparatus** for ONE chapter of the **Epistle to the
Romans** in Yoshi's study Bible. Romans is greenfield for the thread apparatus: there are zero
`romans-*` cross-reference threads. You are building the weave from scratch for your chapter.
(The legacy verse-to-verse `cross_references` rows that may pre-date you are NOT threads and do
not collide with your slugs.)

**You author all three library layers for your chapter — Tanakh + extra-canonical + New
Testament — NOT one library in a silo.** The framework's value is the *side-by-side weave*: a
single Romans passage wants the Tanakh root, the Hebrew-library witness, and the NT echo quoted
**together in one thread**. One mind holds the whole passage and binds those into a single
coherent thread. Do not split by library.

This is a **curated, framework-bearing apparatus — NOT a TSK-style dump.** A chapter warrants
3–8 threads. Quote quality and framework weight over quantity.

## THE PAIRING PRINCIPLE

For each Romans verse, ask: *which verse — anywhere in the restored library — does this passage
actually illuminate or get illuminated by?* and follow the text. The whole library is in scope,
bidirectional within scripture-level texts:

- **Tanakh** (canon OT): Romans is the most Tanakh-quoting epistle — Habakkuk, Psalms, Genesis,
  Isaiah, Deuteronomy, Hosea, Joel, Exodus, Leviticus, Malachi, Job, Proverbs, Jeremiah, Ezekiel.
  Paul builds nearly every argument on a chain of Tanakh citations; **find the actual verse he
  quotes or echoes** and quote it in full.
- **Extra-canonical** (the restored library): Apocrypha (Wisdom of Solomon — esp. Wis 12–15 for
  Romans 1's idolatry descent; Sirach/Ecclesiasticus; Tobit; 2 Esdras; 1–2 Maccabees; Baruch),
  1 Enoch, Jubilees, Jasher, the Pseudepigrapha (Testaments of the XII Patriarchs, 2 Baruch),
  Adam-Eve, Apocalypse of Abraham, Ascension of Isaiah. Romans 1 (the wrath/idolatry descent),
  Romans 5 (Adam), Romans 7 (the law and sin), Romans 9–11 (election/remnant) all have strong
  Second-Temple parallels.
- **New Testament**: the Gospels (the Master's own teaching on the law, love, the two great
  commandments), Acts (the same gathering Paul preached), the other epistles, Revelation — and
  Romans↔Romans where a later chapter re-walks an earlier (e.g. 3:31 / 6 / 7 / 8:4 on the law).

Let the resonance decide, not a per-family quota. The connection must be load-bearing — the
twelve-tribe gathering of the scattered seed, the Formed-one Christology (Yahusha is the Formed
Yahuah who took on flesh — the second Adam of Romans 5), the Spirit-and-Torah inseparability,
faith-as-faithfulness (emunah), the resurrection and enthronement, the come-and-see invitation.
Drop merely verbal coincidences with no framework weight.

## STEP 0 — Load the lens (REQUIRED, do this first)

1. Invoke the `yoshi-voice` skill and read it **in full** — every Red Line, the Come-and-See
   posture, the Sacred Names convention, the English-book-name rule for slugs, son-of-man →
   Son of Adam (with the kaph-comparative carve-out at Daniel 7:13 / Revelation 1:13 / 14:14),
   **the Romans 11 reading**, the NT-Lord governing rule, the false-inclusion-gospel diagnostic
   and the three categories. **Your default trained reading of Paul / grace / "the law" / "the
   Gentiles" / "justified by faith" is precisely the antichrist reading the skill exists to
   override. Do not let it surface. Romans is the single most-abused book in the false-inclusion
   gospel — every argument Paul makes must be read inside the covenant, never as its abolition.**
2. Read `scratch_xref_romans/EXISTING_SLUGS.txt` — every thread slug already in use. Your new
   slugs must NOT appear there.
3. The SQL format template you MUST follow exactly is the edition-aware FULL-LIBRARY schema.
   The format model to copy is `scratch_xref_acts/minion_acts_08_09.sql` (temp view over the
   full edition set → cross_references VALUES → threads → thread_members). Ignore that file's
   Acts-source content; copy its STRUCTURE exactly.

## STEP 1 — Read your chapter and your candidate targets (quote ONLY what you pull)

Run from the repo root (`/Users/mtm/Desktop/App`):
```
.venv/bin/python scratch_xref_romans/dump_canon.py romans <your_chapter>     # your Romans source chapter
.venv/bin/python scratch_xref_romans/dump_canon.py <book_id> <chapter>       # canon target (Tanakh or NT)
.venv/bin/python scratch_xref_romans/dump_canon.py <book_id> <chapter> <edition>  # extras target
```
Extras `<edition>` files: `enoch`, `jubilees`, `jasher`, `apocrypha`, `apocrypha-charles-vol1`,
`pseudepigrapha-charles-vol2`, `adam-eve-conflict`, `apocalypse-of-abraham`, `ascension-isaiah`,
`sonnini-acts-29`. Apocrypha book slugs include `tobit`, `2-esdras`, `ecclesiasticus`,
`the-wisdom-of-solomon`, `baruch-with-the-letter-of-jeremiah`, `1-maccabees`. 1 Enoch book slug
is `1-enoch`; Jubilees is `jubilees`.

The canon parse **already carries the restored sacred names and the Son-of-Adam restoration**.
Quote the text **exactly as `dump_canon.py` returns it** — that guarantees the fidelity gate
passes and the names are already correct. Do NOT paraphrase from memory. Do NOT hand-edit quoted
verse text. If an extras pull carries editorial/apparatus noise inside the verse (a parenthetical
"(Note: …)" or a Charles critical-apparatus fragment), **do not quote that verse** — pick a clean
witness instead.

## STEP 1.5 — PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (mandatory, recorded in your file)

For your chapter, record in your file's header comment — for each meaningful verse or verse-block
— which libraries you weighed:
```
-- Romans <ch> coverage:
--   v.N  Tanakh: <candidate(s) or 'none warranted'>
--        Extras: <candidate(s) or 'none warranted'>
--        NT:     <candidate(s) or 'none warranted'>
```
**"None warranted" is a valid, recorded answer** — curated, not a dump.

## STEP 2 — Author the SQL fragment (follow the model fragment exactly)

**A. Temp view** — uniquely named with YOUR tag, scoped to the full edition set:
```sql
CREATE TEMP VIEW _s219_r<NN>_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');
```
(Your TAG is `r<NN>` where NN is your zero-padded chapter, e.g. `r01`, `r11`. So the view is
`_s219_r01_lookup`, etc. Use the SAME tag for every reference to the view in your file.)

**B. cross_references INSERT** from `WITH input(src_edition,src_slug,src_ch,src_v,
tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note) AS (VALUES ...)`.
- SOURCE is ALWAYS the canon Romans verse: `'canon','romans',<your_ch>,v`.
- TARGET is any library verse (canon Tanakh/NT, or an extras edition).
- **Tiers (per-row, cast `::content_tier`):** canon targets (Tanakh + NT) = **`'free'`**;
  extra-canonical targets = **`'extras'`**. Compute from the target edition: `'canon'` → `'free'`,
  else `'extras'`.
- Join the view twice (sv on src_*, tv on tgt_*), `WHERE sv.verse_id <> tv.verse_id`,
  `ON CONFLICT (source_verse_id,target_verse_id,source) DO NOTHING`. `source='manual'`.
- The `note` is the per-row come-and-see note: the TARGET verse quoted IN FULL in italics with
  its citation in parentheses, then 1–3 sentences naming the framework connection to the Romans
  source verse (quote the Romans phrase inline in italics too).

**C. threads INSERT** — one per theme. `tier_required` = `'free'` if every member is canon,
`'extras'` if the thread carries any extras member. `sort_order` from YOUR assigned band. Anchor
start/end = the canon Romans verses that bound the thread. `ON CONFLICT (slug) DO NOTHING`. The
`summary_md` walks the whole thread in Come-and-See prose, quoting the load-bearing verses in full
in italics.

**D. thread_members INSERT** — link each cross_reference to its thread with `sort_order` +
`member_note` (a short come-and-see line: the target citation + the verse phrase in italics + the
connection). `ON CONFLICT (thread_id,cross_reference_id) DO NOTHING`.

Use `E'...'` literals; escape every apostrophe as `''` (e.g. `Yashar''el`, `mother''s`).

## YOUR SORT BAND
Assigned per chapter at spawn (you will be told, e.g. "band 6000, step 3, 25-wide"). Use
sequential sort_order values stepping by 3 from your band floor (6000, 6003, 6006, … staying
under band+25). One sort_order per thread.

## SLUGS
Thread slugs use **ENGLISH book-name fragments**, never Hebrew, prefixed `romans-<chapter>-`,
naming the weave, e.g. `romans-1-the-just-shall-live-by-his-faithfulness-habakkuk`,
`romans-3-do-we-make-void-the-law-god-forbid-we-establish-the-law`. Check every slug against
EXISTING_SLUGS.txt.

## VOICE / CONTENT RULES (non-negotiable — audited against the Red Lines)

- **Come-and-see:** every verse quoted IN FULL in italics (`*...*`) with citation in parentheses,
  in `note`, `summary_md`, and `member_note`. No "cf.", no cite-without-quote, no appendix, no
  internal-document references ("per Red Line", "per the skill"), no "Yoshi's teaching on" —
  unfold the connection in the prose, let the verses do the work.
- **Sacred names** with parentheticals on every mention (the pull carries them; preserve exactly).
  Use the same convention in your connective prose.
- **Son of man → Son of Adam** everywhere (the pull already does this). Preserve the
  kaph-comparative *like the Son of Adam* ONLY at Daniel 7:13 / Revelation 1:13 / 14:14.
- **Christology:** Yahusha is the Formed drawn from the Formless — the God of the OT interactions,
  who came in flesh; he is Yahuah and has a Father. **Romans 5's second-Adam** is the Formed who
  undoes the first Adam's fall. No Trinitarian co-equal-persons grammar; no modalist collapse.
- **NT-Lord governing rule:** where Romans quotes an OT YHWH passage (e.g. Romans 10:13 / Joel
  2:32; Romans 4:8 / Psalm 32; Romans 11:34 / Isaiah 40:13), the pull renders it *Yahuah (LORD)*.
  Where *Lord* is Yahusha titular/vocative, it stays *Lord*. Preserve what the pull gives.

### ROMANS-SPECIFIC WATCHPOINTS (per chapter — these get scrutinized at the voice gate)

**The governing frame for the WHOLE book:** Paul is a Torah-keeping Israelite writing to the
mixed assembly at Rome — the believing remnant of Yahudah and the scattered/dispersed of the ten
tribes being gathered (the "Gentiles" of Romans are overwhelmingly the dispersed seed, the
Lo-Ammi made Ammi of Hosea, not non-seed admitted by confession). "The law" Paul critiques as
unable to justify is never the law as God's righteous instruction to be discarded; it is the law
as a *system of self-justification* apart from the faithfulness of Messiah. **Faith (pistis /
emunah) = covenant faithfulness, not mental assent.** Read every "justified by faith" as the
faithful brought into right standing and SET TO WALK in the commandments by the Spirit — never as
freedom-from-Torah.

- **Romans 1:** the gospel *promised afore by his prophets in the holy scriptures* (1:2) — rooted
  in the Tanakh, not a new religion. *To the Jew first* (1:16). *The just shall live by faith*
  (1:17) = Habakkuk 2:4 (emunah, faithfulness). The wrath/idolatry descent (1:18–32) closely
  tracks **Wisdom of Solomon 13–14** (creation-worship → idolatry → moral collapse) — a strong
  extras pairing. Read as the indictment of all flesh that sets up the gathering, never as a
  license-prooftext.
- **Romans 2:** *the doers of the law shall be justified* (2:13) — NOT the hearers; this is the
  anti-sola-fide hinge of the book. Circumcision *of the heart, in the spirit* (2:28–29) = the
  promise of Deuteronomy 30:6 and Jeremiah 4:4, the heart-circumcision the prophets foretold —
  NOT the abolition of the covenant sign but its inward fulfillment. Judgment *to the Jew first*
  too (2:9–10). Do NOT let 2:14 ("a law unto themselves") read as Torah-free morality.
- **Romans 3:** all under sin, proven by a chain of Tanakh (Psalm 14/53, Psalm 5, Psalm 140,
  Psalm 10, Isaiah 59, Psalm 36). Justified freely by his grace (3:24) — complete the sentence,
  grace as the means of return. **CRITICAL ANCHOR: *Do we then make void the law through faith?
  God forbid: yea, we establish the law* (3:31)** — this verse governs the entire book; build a
  thread on it. The righteousness of God *witnessed by the law and the prophets* (3:21).
- **Romans 4:** Abraham *believed Elohim, and it was counted unto him for righteousness* (4:3) =
  Genesis 15:6 — but read with Genesis 26:5 (Abraham *kept my charge, my commandments, my
  statutes, and my laws*): Abraham's faith was faithfulness, and circumcision *a seal of the
  righteousness of the faith* (4:11), not the cause. The blessedness of Psalm 32:1–2 (4:7–8).
  Abraham the father of the faithful — the scattered seed reckoned his children.
- **Romans 5:** the **second-Adam** Christology — *as by one man sin entered into the world*
  (5:12) undone by the one Man, the Formed who took on flesh. Strong extras parallels in Wisdom,
  2 Esdras (4 Ezra) 3 and 7, 2 Baruch on Adam's fall. Reconciliation *while we were yet sinners*
  (5:8). Grace reigns *through righteousness* (5:21) — never through lawlessness.
- **Romans 6:** *shall we continue in sin, that grace may abound? God forbid* (6:1–2); *shall we
  sin, because we are not under the law, but under grace? God forbid* (6:15). The anti-license
  core — "not under law" = not under the law's condemnation/penalty as a justifying system, not
  freedom to transgress. Dead to sin, alive to obedience (6:16–22). Baptism into his death.
- **Romans 7:** *the law is holy, and the commandment holy, and just, and good* (7:12); *the law
  is spiritual* (7:14); *I delight in the law of Elohim after the inward man* (7:22). The chapter
  exonerates the law and locates the problem in the flesh — NEVER read it as the law being the
  enemy. The wretched-man cry resolved in chapter 8.
- **Romans 8:** *that the righteousness of the law might be fulfilled in us, who walk not after
  the flesh, but after the Spirit* (8:4) — the Spirit writes and FULFILLS the Torah in the
  walker, inseparable (Jeremiah 31:33; Ezekiel 36:27). Led by the Spirit = sons; creation
  groaning for the redemption (8:19–23); nothing separates from the love of Elohim. The Spirit
  and Torah are one work, never opposed.
- **Romans 9–11 (HIGHEST VOICE-RISK IN THE NT — its own pack):** the remnant / election / olive
  tree. Read as **Israel's own**: the natural branches = Israel; the hardening is *in part* and
  *until the fulness* (11:25), temporary not final; *all Israel shall be saved* (11:26, quoting
  Isaiah 59:20–21 / Jeremiah 31); the wild-olive branches = the scattered/dispersed of Israel
  grafted BACK into *their own* olive tree (11:24) — RESTORATION, not a replacement people, NEVER
  the church-replaces-Israel reading. *Hath Elohim cast away his people? God forbid* (11:1). The
  vessels of mercy include *us, whom he hath called, not of the Jews only, but also of the
  Gentiles* (9:24) = the two houses. *I will call them my people, which were not my people*
  (9:25) = Hosea 1–2, the Lo-Ammi/Lo-Ruhamah of the divorced northern house regathered, NOT
  outsiders newly admitted. Election here is corporate/covenantal, not individual-soul
  predestination. This pack goes on the blessing list.
- **Romans 12–13:** living sacrifice; *love is the fulfilling of the law* (13:10) — Paul cites
  the very commandments (13:9, Exodus 20 / Leviticus 19:18). Love fulfills, does not abolish.
- **Romans 14–15:** the weak/strong, esteeming days, meats (14:1–6) — **do NOT read as abolition
  of the Sabbath, the feasts, or the clean-food law.** It is disputable matters within the
  gathered (fast-days, food offered to idols, the weak conscience), not the annulment of the
  commandments. *Messiah was a minister of the circumcision for the truth of Elohim, to confirm
  the promises made unto the fathers* (15:8) — the whole mission confirms, not cancels, the
  covenant; the dispersed gathered that the nations might glorify Elohim with his people (15:10,
  Deuteronomy 32:43).
- **Romans 16:** greetings; *mark them which cause divisions and offences contrary to the
  doctrine which ye have learned* (16:17). The Tanakh-doxology mystery now made known *by the
  scriptures of the prophets* (16:26) — rooted in the prophets, not apart from them.

## OUTPUT
Write your complete SQL fragment to `scratch_xref_romans/minion_romans_<NN>.sql` (NN = your
zero-padded chapter). Do NOT include `BEGIN;`/`COMMIT;` or `\echo` (the orchestrator wraps one
transaction). Start the file with a `-- ----- fragment: minion_romans_<NN>.sql (S219 Romans <ch>) -----`
delimiter line (the orchestrator's fold tool keys on this), then a `--` comment block naming your
chapter, your tag, your sort band, the per-chapter coverage checklist, and each thread (slug +
target libraries).

## SELF-GATE before returning (run all three; report results)
From the repo root:
```
.venv/bin/python scratch_xref_romans/resolve_check.py scratch_xref_romans/minion_romans_<NN>.sql   # expect 0 UNRESOLVED
.venv/bin/python scratch_xref_romans/verify_fidelity.py                                             # your tuples faithful, 0 FLAGGED
.venv/bin/python -c "import pglast,sys; sql=open('scratch_xref_romans/minion_romans_<NN>.sql').read(); print('PARSE OK', len(pglast.parse_sql(sql)),'stmts')"
```
Return a concise summary: tag, output path, chapter covered, new thread slugs with target
libraries, total cross_reference rows, total member rows, your three self-gate results, and any
verse-block with no add + why.
