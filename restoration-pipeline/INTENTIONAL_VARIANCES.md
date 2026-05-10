# Intentional Variances Registry

A running log of legitimate divergences between the deterministic restoration
pipeline (`restore.py`) and Yoshi's published Restored Names Editions. Each
entry describes a kind of variance the pipeline produces that we have decided
is *intentional and correct,* not a bug. The variance is either:

- **Pipeline correct, published-edition gap** — the published edition has a
  miss the pipeline now catches. Flag for Yoshi to fix in the .docx when
  he's ready. Pipeline output is what should ship in the app.
- **Published-edition correct, pipeline acknowledges by design** — the
  pipeline's mode system or preserved-phrase list intentionally produces
  the published-edition reading. Documented here so future contributors
  understand the intentional choice.
- **Stylistic latitude — both readings acceptable** — a place where the
  pipeline's choice and Yoshi's published choice are both inside the
  voice-skill standard. Document the decision so it doesn't keep coming
  up as a "bug."

Surfaced and maintained by `validate_verse_diff.py` runs against each
published edition.

---

## Apocrypha — Pipeline Correct, Published-Edition Gaps (flag for Yoshi)

Surfaced 2026-05-10 session 5 by `validate_verse_diff.py apocrypha` (mode
= apocrypha, jesus_alone rule excluded). After the apocrypha-mode fix, 2
of 5,711 verses still differ from the published edition — both are *son
of man* → *son of Adam* misses in the published Apocrypha .docx that the
pipeline correctly catches per the voice skill's absolute son-of-Adam
restoration rule.

### Judith 8:16

- **Published reading:** *Do not bind the counsels of Yahuah (God), our
  Elohim (God): for Yahuah (God) is not as man, that he may be threatened;
  neither is he as **the son of man**, that he should be wavering.*
- **Pipeline reading:** *…neither is he as **the son of Adam**, that he
  should be wavering.*
- **Why pipeline is correct:** The voice skill's *Son of Adam, everywhere*
  rule is absolute — every "son of man" → "son of Adam" in body text and
  in scripture quotations. This usage is the poetic generic ("a son of
  Adam" = a human being), exactly the kind of case the rule was written to
  catch. The published Apocrypha was set before the son-of-Adam rule was
  fully enforced; this is one of the residual misses.
- **Action:** Flag for Yoshi's next pass on the published .docx. Pipeline
  output is what ships in the app.

### Ecclesiasticus (Sirach) 17:30

- **Published reading:** *For all things cannot be in men, because **the
  son of man** is not immortal.*
- **Pipeline reading:** *…because **the son of Adam** is not immortal.*
- **Why pipeline is correct:** Same as Judith 8:16 — poetic generic,
  voice skill's absolute rule applies, published edition missed it.
- **Action:** Flag for Yoshi's next pass on the published .docx.

---

## Apocrypha — Published-Edition Correct, Pipeline Acknowledges by Design

The Apocrypha is pre-Messiah scripture. Every "Jesus" in the fourteen
Apocrypha books is Yeshua/Yehoshua (Joshua) — the LXX/KJV used the Greek
*Iēsous* for that Hebrew name, and the English carried the rendering
forward without distinguishing it from the Messiah's name. Yoshi's
published Apocrypha correctly preserves these mentions as "Jesus."

The pipeline used to mis-restore them to *Yahusha (Jesus)*. As of session
5 (2026-05-10), the pipeline has an `apocrypha` mode that excludes the
`jesus_alone` rule. When `validate_verse_diff.py` runs against
apocrypha.json, it loads the Restorer with `mode="apocrypha"`, and these
verses pass cleanly:

- 1 Esdras 5:8, 5:24, 5:58, 5:68, 5:70, 9:48 — all references to Joshua
  the high priest in the temple-rebuilding sequence.
- 2 Esdras 7:37 — Joshua son of Nun ("after Mosheh in the time of Achan").
- Ecclesiasticus 46:1 — "Jesus the son a Nave" (KJV typo: should read "of
  Nave"; either way, this is Joshua son of Nun).
- 1 Maccabees 2:55 — Joshua, "made a judge in Israel."

When new Apocrypha books are processed by the pipeline, the calling code
must pass `mode="apocrypha"`. For the four Apocrypha books that pull from
public-domain bases (rather than from Yoshi's published edition), the same
mode applies — these books are pre-Messiah and "Jesus alone" is always
Joshua/Yeshua.

### Apocrypha-set books that need apocrypha mode:

The 14 books of the KJV Apocrypha:
- 1 Esdras, 2 Esdras
- Tobit, Judith
- Additions to Esther
- Wisdom of Solomon, Ecclesiasticus (Sirach)
- Baruch (with the Letter of Jeremiah)
- Prayer of Azariah / Song of the Three Children, Susanna, Bel and the
  Dragon
- Prayer of Manasseh
- 1 Maccabees, 2 Maccabees

Plus any extras-tier book whose canonical context is pre-Messiah (most
of the Charles 1913 pseudepigrapha — Jubilees, Enoch, the Testaments,
Adam and Eve, etc. — also fall in this period; the pipeline already
handles them with default mode because "Jesus" doesn't appear as a name
in those books, but the rule remains: apply apocrypha mode to any book
whose textual world predates the first coming).

---

## Jasher — Pipeline Correct, Published-Edition Gaps (flag for Yoshi)

Surfaced 2026-05-10 session 6 by `validate_verse_diff.py jasher` (default
mode) after the secular-Lord preservation patch landed. **665 of 3,903
verses (17.04%)** still differ from the published Jasher .docx. None of
the 665 are pipeline bugs — they all reflect that Yoshi's published
*Jasher — Restored Names Edition* (one of the earlier publications in the
Restored Names series) predates the full enforcement of the current
voice-skill standards in the body text and the inline commentary.

The published Jasher kept conventional English in body verses and in
commentary blocks where the current voice-skill standard now requires
restoration. The pipeline correctly applies the current standard. Same
posture as the Apocrypha findings above: pipeline output is what ships
in the app; the published .docx fixes are at Yoshi's discretion.

### Breakdown of the 665 Jasher diffs (all pipeline-correct gaps):

- **`israel_to_yasharel` (427)** — *Israel* in published; *Yashar'el (Israel)*
  per voice skill. Examples: Jasher 36:8 (*"called his name Yashar'el (Israel)"*),
  Jasher 47:33 (*"an inheritance to the children of Yashar'el (Israel)"*),
  Jasher 56:7 (*"the law of Yahuah (God) appertaining to Yashar'el (Israel)"*),
  Jasher 59:1, 59:24, 59:28 (recurring across the Egypt-sojourn chapters).
  Also recurs throughout the inline commentary blocks Yoshi included in
  the published .docx.

- **`judah_to_yahudah` (134)** — *Judah* in published; *Yahudah (Judah)*
  per voice skill. Same pattern as Israel — recurring across body verses
  (Jasher 53:31, 54:2, 54:3, etc., where Judah is the speaker / actor)
  and inline commentary.

- **`sons_of_men_to_adam` (73)** — *sons of men* in published; *sons of
  Adam* per the voice skill's absolute *Son of Adam, everywhere* rule
  (which applies to plurals as it does to the singular). Jasher 2:2–7,
  2:11–21, 2:36, 3:2–18, etc. — recurring through the Enosh / Cainan /
  Enoch / Noah generations narrative where the phrase *bnei adam* is
  thematically central.

- **`melchizedek` (7)** — *Melchizedek* in published; *Melek Tsadiq
  (Melchizedek)* per the rule landed 2026-05-09. Published Jasher
  predates the Melek Tsadiq rule.

- **`god_to_elohim` (6), `son_of_man_to_adam` (4), `jewish_to_yahudi` (3),
  `jews_to_yahudim` (2), `christ_to_messiah` (2), `holy_spirit` (1)** —
  scattered cases, almost all inside inline commentary blocks where the
  published kept conventional names. Pipeline correctly restores them per
  the voice skill.

- **`other` (6)** — multi-category lines (commentary text where multiple
  restorations stack in the same diff); each one decomposes into the
  per-rule cases above.

### Action

No action required from Yoshi this session. When Yoshi next opens the
*Jasher — Restored Names Edition* .docx for a revision pass, these are the
patterns to sweep:
- *Israel* → *Yashar'el (Israel)*
- *Judah* → *Yahudah (Judah)*
- *sons of men* → *sons of Adam* (and the few *son of man* singulars)
- *Melchizedek* → *Melek Tsadiq (Melchizedek)*
- the scattered *God / Christ / Holy Spirit / Jew(ish/s)* misses

The pipeline output for the app is already correct.

---

## Jasher — Published-Edition Correct, Pipeline Acknowledges by Design

### Secular *Lord* vocative addressing human kings (62 cases pre-fix)

Surfaced 2026-05-10 session 6 by the first Jasher run — 62 of 723 diffs
were the `Lord_mixed` rule firing on secular vocative ("my Lord and
king", "my Lord", "our Lord", "his Lord", "your Lord", "their Lord")
addressing human kings (Nimrod, Pharaoh, Esau, Joseph, Jacob, Abraham,
Terah). In OT-narrative texts (Jasher, Apocrypha, Genesis-style narrative)
"Lord" capitalized in dialog with possessive pronouns is overwhelmingly
secular vocative — the speaker addressing or referring to a human
superior. Restoring those to the divine name is wrong.

The pipeline now stashes these via two new entries in `PRESERVED_PHRASES`:

1. `\bLord\s+(?:and|the)\s+king\b` — universal preservation. *"Lord and
   king"* / *"Lord the king"* paired with the noun *king* makes the
   secular meaning explicit (divine kingship doesn't pair with the noun
   *king* this way in scripture).
2. `\b(?:[Mm]y|[Oo]ur|[Yy]our|[Hh]is|[Hh]er|[Tt]heir)\s+Lord\b(?!\s+(?:Jesus|Christ|God|Yahusha|Yahuah|GOD|LORD))`
   — *"[possessive] Lord"* preserved as plain English UNLESS followed by
   a divine-name word. The negative lookahead protects NT cases like
   *"our Lord Jesus Christ"* and *"our Lord God"* so the divine
   Lord-title still restores in those contexts.

Self-tests added (8 new cases in `SELF_TESTS`):
- *"our Lord and king"* preserved
- *"my Lord the king"* preserved
- *"my Lord Abram"* preserved (followed by name, not divine word)
- *"My Lord, shew them"* preserved (standalone vocative)
- *"his Lord / their Lord / your Lord"* all preserved
- *"our Lord Jesus Christ"* still restores (negative lookahead exception)
- *"my Lord God"* restores via the compound `lord_god_naked` rule (which
  fires before the secular preservation, producing
  *"my Yahuah Elohim (LORD God)"*)
- bare *"the Lord their Elohim"* still restores (no possessive prefix)

After the patch: Jasher diff count dropped from **723 → 665** (the 58-diff
delta = 62 lord_to_yahuah fixes minus 4 verses whose *Israel/Judah* now
re-categorize to those kinds because the Lord-bug no longer wins the
categorizer's first match). Apocrypha re-validated: still **2 of 5,711
diffs (99.96% pass)** — no regression. Idempotency holds byte-clean on
the published Enoch (674,455 chars) and the published Jasher (1,761,725
chars).

---

## Jubilees — Pipeline Correct, Published-Edition Gaps (flag for Yoshi)

The published *Jubilees — Restored Names Edition* uses Charles 1902 as its
public-domain base and is one of the earlier publications in the series.
Like Jasher, the body text and inline commentary blocks predate the full
enforcement of the current voice-skill standards (Melek Tsadiq parenthetical,
sons-of-men → sons-of-Adam absolute rule, scattered standalone "God" → Elohim
(God) restorations in commentary). The pipeline correctly applies the current
standard. The .docx fixes are at Yoshi's discretion.

The Jubilees punch-list (10 verses, 11 instances after session-7 fixes):

### sons of men → sons of Adam (5 instances across 4 verses)

- **Jubilees 4:17** — *"and he testified to the sons of men among the
  generations of the earth"* (commentary on Enoch's prophetic role) — published
  has "sons of men", pipeline restores to "sons of Adam".
- **Jubilees 10:8** — two instances — *"the power of my will on the sons of men"*
  and *"great is the wickedness of the sons of men"* (Mastema's bargain over
  the demonic remnant). Both are quoted scripture inside the verse; both miss
  the absolute son-of-Adam rule.
- **Jubilees 10:36** — *"the power of my will on the sons of men"* (commentary
  echo of 10:8). Same miss.
- **Jubilees 32:18** — *"wherever the foot of the sons of men has trodden"*
  (Levi's blessing). Same miss.

### Son of man → Son of Adam (1 instance)

- **Jubilees 27:26** — *"ascending and descending upon the Son of man (John
  1:51)"* (commentary citing the Jacob's-ladder typology). Published has
  "Son of man"; pipeline restores to "Son of Adam" per the absolute rule.

### Melchizedek → Melek Tsadiq (Melchizedek) — commentary mentions (3 verses)

- **Jubilees 7:39** — single instance in commentary on Noah's blessing pattern.
- **Jubilees 13:29** — multiple instances in the chapter's commentary on the
  El Elyon priest-king typology (Hebrews 7 anchor passage). Pipeline correctly
  restores all of them.
- **Jubilees 30:26** — single instance in commentary listing the priestly
  through-line (*"Enoch in chapter 4, Noah at the altar in chapter 6,
  Melchizedek in chapter 13"*).

### "God" in commentary serpent-question (2 verses)

- **Jubilees 2:33** — *"Did God really say?"* (commentary on the serpent's
  Genesis 3 question, naming the antichrist voice). Published has bare "God";
  pipeline restores to "Elohim (God)" per the standalone-God rule.
- **Jubilees 3:35** — same pattern, commentary on the serpent's voice across
  the whole series.

The sweep, when Yoshi opens the Jubilees .docx for revision: *son of man /
sons of men* → *son of Adam / sons of Adam* (6 instances), *Melchizedek* →
*Melek Tsadiq (Melchizedek)* (3+ instances in commentary), *God* → *Elohim
(God)* in the two serpent-question slots. Pipeline output for the app is
already correct.

---

## Jubilees — Published-Edition Correct, Pipeline Acknowledges by Design

### Possessive-form idempotency miss (the apostrophe-s bug)

Surfaced 2026-05-10 session 7 by the first Jubilees run — 11 verses had
already-restored possessive forms like *"Yahudah's (Judah's)"*,
*"Yashar'el's (Israel's)"*, *"Yahuah's (God's)"*, and *"Messiah's (Christ's)"*
where the pipeline was firing INSIDE the existing parenthetical because the
`_ALREADY_RESTORED_PAT` required `\s*\(` after the Hebrew head — and the
typographic-apostrophe possessive (`'s`) broke that match, leaving the
inner English (e.g., *Judah's*) exposed to the standard substitution rules.
Result: *"Yahudah's (Yahudah (Judah)'s)"* double-wrapping.

A second axis of the same bug: the Hebrew head literal in `_HEBREW_HEADS`
uses ASCII apostrophe (`Yashar'el`), but Yoshi's published prose mixes ASCII
(U+0027) and typographic (U+2019) apostrophes — sometimes in the same
paragraph. The literal-apostrophe match in `re.escape` was missing the
typographic form entirely.

The fix landed two pieces:

1. **Apostrophe-tolerant Hebrew-head matching** — a new `_apostrophe_tolerant`
   helper rewrites every apostrophe inside the escaped Hebrew-head pattern to
   the character class `['’]`, so both ASCII and typographic forms match.
   Single-pass via `re.sub` (an earlier two-pass `.replace` produced nested
   `[['’]'’]` garbage).
2. **Optional possessive marker** — `_ALREADY_RESTORED_PAT` now permits
   `(?:['’]s)?` between the Hebrew head and the parenthetical, so
   *"Yahudah's (Judah's)"* and *"Yahudah's (Judah's)"* both stash cleanly
   before any rule can fire on the inner English.

### Compound Hebrew heads that aren't pipeline-enforced still get protected

Surfaced in the same Jubilees run — *"El Shaddai (God Almighty)"* (3 verses)
and *"El Elyon (Most High)"* (used in commentary, doesn't fire as a diff but
shares the same architecture). Per the voice skill, these compound names
remain **translator's call** — not pipeline-enforced restorations like Melek
Tsadiq. But when Yoshi DOES use them in his prose with the parenthetical
already in place, the pipeline must not interfere with the inner English
(e.g., the *God* inside *(God Almighty)* must not be wrapped to
*Elohim (God) Almighty*).

The fix added `El Shaddai` and `El Elyon` to `_HEBREW_HEADS` so the stash
mechanism recognizes them as already-restored. They are still **not**
pipeline-enforced — bare *"God Almighty"* still has its *God* restored, as
self-test confirms.

### Christian institutional rite names preserved verbatim

Surfaced at Jubilees 49:23 — commentary names *"what later Christianity
called the Lord's Supper"*. The phrase quotes the named Christian rite; the
pipeline-restoring it produces *"the Yahuah (Lord)'s Supper"*, which is
theologically wrong (Christianity didn't call it the Yahuah's Supper, it
called it the Lord's Supper). Two cases of the same architecture exist as
named Christian terms: *"the Lord's Prayer"* and *"the Lord's Day"*.

The fix added a new `PRESERVED_PHRASES` entry:
`\bthe\s+Lord['’]s\s+(?:Supper|Prayer|Day)\b` — preserving the named
Christian rites verbatim. ASCII and typographic apostrophe both accepted.

### "Jew and Gentile binary" preserved as framework-named phrase

Surfaced at Jubilees 31:32 — commentary names *"the Jew and Gentile binary"*.
The voice skill's whole point about that phrase is to name it as the LIE
that all four costume systems share, NOT to restore *Jew* as a covenant
people-name in this slot. The pipeline-restoring produces
*"the Yahudi (Jew) and Gentile binary"*, which corrupts the framework
quotation by treating the named-lie as a covenant identity slot.

The fix added a new `PRESERVED_PHRASES` entry:
`\bJew\s+and\s+Gentile\s+binary\b` — preserves the framework-quoted phrase
verbatim. Bare *"the Jew"* outside the binary phrase still restores, as
self-test confirms.

### Self-tests grew 36 → 50

14 new cases in `SELF_TESTS` covering both sides of every new rule:
- 5 possessive-idempotency cases (Yahudah's / Yashar'el's / Yahuah's /
  Messiah's, plus the typographic-apostrophe variant)
- 3 compound-Hebrew-head cases (El Shaddai (God Almighty) protected,
  El Elyon (Most High) protected, bare "God Almighty" still restores
  showing El Shaddai is NOT pipeline-enforced)
- 4 Christian-institutional-term cases (Lord's Supper, Lord's Prayer,
  Lord's Day, typographic apostrophe variant)
- 2 framework-phrase cases (Jew and Gentile binary preserved, bare "the
  Jew" still restores)

After the patches: Jubilees diff count dropped from **26 → 10** (97.50% →
99.04%). All 10 remaining diffs are clean Bucket B published-edition gaps
documented above. Apocrypha re-validated: still **2 of 5,711 (99.96%)** —
no regression. Jasher re-validated: still **665 of 3,903 (82.96%)** — no
regression. Idempotency holds byte-clean on the three published editions
already validated: Enoch (674,455 chars), Jasher (1,761,725 chars), and now
Jubilees (615,255 chars).

---

## Enoch — Pipeline Correct, Published-Edition Gaps (flag for Yoshi)

The published *Book of Enoch — Restored Names Edition* uses Charles 1912 as
its public-domain base. Like Jasher and Jubilees, it is one of the earlier
publications in the series and predates full enforcement of the current
voice-skill standards on apocalyptic compound divine titles, the absolute
son-of-Adam rule in apocalyptic-vision contexts, and the Yashar'el (Israel)
restoration in chapter subheadings. The pipeline correctly applies the
current standard. The .docx fixes are at Yoshi's discretion.

The Enoch run produced **64 of 1,367 verses divergent (95.32% pass)**, all
in Bucket A (pipeline-correct, published-edition gap). Zero pipeline bugs
were found. Zero new pipeline-by-design protections were needed (no named
Christian rites, no framework-quoted phrases, no possessive idempotency
misses, no compound-Hebrew-head bleed). This was the cleanest of the four
wheels: the pipeline is doing exactly what the voice skill asks; the
published .docx has a sweep-list to land at Yoshi's discretion.

The diffs by architectural class:

### Apocalyptic compound divine "Lord" titles — 45 verses

The dominant pattern. Charles 1912's English carries the apocalyptic divine
title in literal compound form — *Lord of Spirits* throughout the Parables
of Enoch (chs. 37–69), *Lord of the sheep* throughout the Animal Apocalypse
(chs. 85–90), *Lord of lords* (9:4), and the bare *Lord* of 81:3 (Yahuah
addressing Enoch directly). The published *Restored Names Edition* preserves
Charles's literal forms verbatim. The pipeline applies the standard divine
*Lord* → *Yahuah (Lord)* restoration, which is the correct voice-skill
reading: these are unambiguously divine titles for Yahuah, not human
vocatives.

Verses (counts include the three labeled `other` by the categorizer because
of multi-change verses; architecturally identical):
- **Lord of Spirits** (the divine title throughout the Parables): 38:7,
  38:10, 38:11, 39:7, 42:8, 45:8, 62:1, 62:6, 62:7, 63:4, 63:9 — 11 verses.
- **Lord of the sheep** (the divine title throughout the Animal Apocalypse):
  89:16, 89:17, 89:19, 89:21, 89:24, 89:25, 89:26, 89:27, 89:30, 89:33,
  89:35, 89:36, 89:40, 89:41, 89:42, 89:43, 89:46, 89:47, 89:48, 89:51,
  89:54, 90:1, 90:4, 90:6, 90:7, 90:11, 90:12, 90:13, 90:14, 90:17, 90:18,
  90:19, 90:22 — 33 verses.
- **Lord of lords** (compound divine title): 9:4 — 1 verse (also has *Lord
  of Spirits* shifting elsewhere in the verse).
- **Lord** (bare, divine — Yahuah addressing Enoch): 81:3 — *"And in those
  days the Lord called me, And said to me: 'Enoch, thou scribe of
  righteousness…'"*

The session-7 open question — *whether the secular-Lord patch from Jasher
session 6 already handles the lord_to_yahuah cases* — answers itself: the
secular-Lord preservation patterns (`Lord (and|the) king`, `[possessive]
Lord` with negative-lookahead exception) are designed for human-king
vocatives in narrative-dialog contexts (Jasher addressing Nimrod, Pharaoh,
Esau, Joseph, Jacob, Abraham, Terah). 1 Enoch is apocalyptic vision, not
narrative-dialog, and none of its 45 *Lord* cases match a human-king
vocative pattern. The two patches operate on disjoint architectural
territory; there is no cross-talk and no need to extend the secular-Lord
patterns into Enoch's apocalyptic compound titles.

### son of man / sons of men → son of Adam / sons of Adam — 18 verses

The absolute son-of-Adam rule (voice skill Red Line #12) applied where
Charles 1912's English carried the title flat. All clearly Messianic title
or prophetic vocative or poetic generic; no ambiguity.

- **Son of Adam (Messianic title, Parables and the Book of Parables echo)**:
  46:2, 46:3, 46:4, 48:2, 62:7, 62:8, 62:9, 63:3, 63:6, 63:8, 69:30, 69:31,
  69:33 — 13 verses.
- **son of Adam (vocative, Enoch addressed)**: 60:10 — *"And he said to me:
  'Thou son of man, herein thou dost seek to know what is hidden.'"*
- **sons of Adam (poetic generic plural)**: 69:10, 79:9, 82:13, 92:13 —
  4 verses.

The session-7 open question — *how much of the son_of_man load is
published-edition gap vs. a Charles-translation-specific pipeline blind
spot* — answers itself: 100% published-edition gap. Every one of the 18
cases is a clean instance of the absolute rule firing on text the published
.docx left flat. No Charles-specific blind spot; the pipeline catches every
instance correctly.

### Yashar'el (Israel) in chapter subheading — 1 verse

- **1 Enoch 56:4** — the chapter subheading *"LVI. 5–8. Last Struggle of the
  Heathen Powers against Israel."* runs as the tail of verse 56:4 in the
  Charles 1912 verse-numbered text. The published .docx preserves Charles's
  English subheading verbatim with *Israel*; the pipeline applies the
  standard Yashar'el (Israel) restoration.

### Action

When Yoshi next opens the published *Book of Enoch — Restored Names Edition*
.docx for revision, the sweep is the same shape as Jasher and Jubilees:
*Lord of Spirits / Lord of the sheep / Lord of lords / [bare] Lord* (45
divine instances) → *Yahuah (Lord) of Spirits / Yahuah (Lord) of the
sheep / Yahuah (Lord) of lords / Yahuah (Lord)*; *Son of Man / son of
man / sons of men* → *Son of Adam / son of Adam / sons of Adam* (18
instances); *Israel* in the 56:4 subheading → *Yashar'el (Israel)* (1
instance). Pipeline output for the app is already correct; the .docx fixes
are at Yoshi's discretion.

---

## Enoch — Published-Edition Correct, Pipeline Acknowledges by Design

**No new pipeline-by-design protections were needed for Enoch.** The four
defensive self-tests added this session lock in the architectural conclusion
that apocalyptic compound divine titles get standard *Lord* → *Yahuah
(Lord)* restoration (they are NOT in the secular-Lord preserve list, which
is for human-king vocatives only):

- *"Lord of Spirits"* (Parables divine title) restores to *"Yahuah (Lord)
  of Spirits"*.
- *"Lord of the sheep"* (Animal Apocalypse divine title) restores to
  *"Yahuah (Lord) of the sheep"*.
- *"Lord of lords"* (compound divine title) restores to *"Yahuah (Lord)
  of lords"*.
- *"Yahuah (Lord) of Spirits"* (already-restored idempotency) stays put.

These tests grew the self-test suite from 50 to 54. They guard against any
future regression that might accidentally extend secular-Lord preservation
into divine apocalyptic territory. They are defensive, not corrective —
the pipeline was already producing the correct output on all 45 cases
before the tests were added.

### Why Enoch was the cleanest wheel of the four

Apocrypha had two architectural classes (apocrypha-mode for *Iēsous /
Joshua* preservation; *son of Adam* gaps); Jasher had one architectural
class (secular-Lord vocative preservation); Jubilees had four (apostrophe
tolerance, possessive marker, compound-Hebrew-head protection, two
preserved phrases). Enoch surfaced **zero** new architectural classes —
the existing rule set already covered every Enoch pattern correctly,
including:

- The standard divine *Lord* → *Yahuah (Lord)* rule, firing correctly on
  all apocalyptic compound titles.
- The secular-Lord preservation patterns from Jasher session 6, which do
  NOT fire on any Enoch case (no narrative-dialog with human-king
  vocatives).
- The absolute son-of-Adam rule, firing correctly on all Messianic /
  vocative / poetic-generic cases.
- The Yashar'el (Israel) restoration, firing correctly on the chapter
  subheading.
- The idempotency stash mechanism, holding the already-restored *Yahuah
  (God) of the ages* (9:4) and *Yahuah (God) of Spirits* (the published
  edition's existing *God* → Yahuah restorations across the Parables)
  untouched while the new *Lord of X* restorations flowed through.

The pipeline architecture proved general-purpose enough to handle Enoch's
apocalyptic-vision text without modification. This is the architecture
working as designed.

After the four defensive self-tests: Enoch diff count holds at **64 of
1,367 (95.32%)** — the count does not drop because there were no rule
changes. Apocrypha re-validated: still **2 of 5,711 (99.96%)** — no
regression. Jasher re-validated: still **665 of 3,903 (82.96%)** — no
regression. Jubilees re-validated: still **10 of 1,038 (99.04%)** — no
regression. Idempotency holds byte-clean on all three published editions
that round-trip cleanly: Enoch (674,455 chars), Jasher (1,761,725 chars),
Jubilees (615,255 chars).

**Phase 3 closes with this wheel.** All four validation editions have been
end-to-end scrubbed. The restoration pipeline is ready for the data-schema
work in Phase 4.

---

## Pipeline Architecture Notes Surfaced This Session

### The article-fixup rule was disabled (was: dropped "the" before "Yahuah")

Yoshi's published Apocrypha keeps "the" in genitive constructions:
*"Nevertheless the Yahuah (God) of their fathers sent…"* The previous
article-fixup rule dropped "the" universally before "Yahuah (God)" /
"Yahuah (Lord)", which:

1. Contradicted the published-edition convention.
2. Used `\s+` in the regex, which matched across newlines and collapsed
   two source lines into one — producing a 13-line shift cascade that
   surfaced as ~26,000 alignment-artifact diffs in the first whole-text
   diff run.

The two article-drop rules are commented out in `restore.py` for now.
Self-tests updated to match the article-keeping behavior. A future
iteration could restore article-drop with sentence-level context awareness
(e.g., drop "the" only at sentence start, keep in genitive position) — but
that needs more cases from the Jasher and Jubilees diffs before it can be
written cleanly.

### Whole-text diff was abandoned in favor of per-verse diff

`validate_diff.py` (whole-text line-by-line) is retained as a tool but is
no longer the primary validator. The newer `validate_verse_diff.py` runs
the pipeline on each verse from the parsed JSON independently, producing a
clean per-verse pass/fail list with no front-matter contamination, no
alignment cascades, no false signal. Whole-text diff was producing 28,718
"diffs" on the Apocrypha; per-verse diff produces **11** in default mode,
**2** in apocrypha mode (the two son-of-Adam published-edition gaps above).
Per-verse is the validator going forward.

---

## How to Add a New Variance Entry

When `validate_verse_diff.py` surfaces a diff that is *not* a pipeline bug:

1. Run the validator with `--max-samples 200` to capture the full pattern.
2. Categorize: pipeline-correct-published-gap, published-correct-pipeline-by-design,
   or stylistic-latitude.
3. Add an entry to the appropriate section above with:
   - The reference (book, chapter, verse).
   - The published reading vs the pipeline reading.
   - Why one is correct.
   - The action (flag for Yoshi, or no action because it's already handled
     by mode/preserved-phrases).
4. If a new pipeline mode or preserved phrase is needed, land it in
   `restore.py` with a self-test, then re-run the validator and confirm
   the diff drops to the expected new baseline.
