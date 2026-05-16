# Q39 Voice Re-Check Gate — Session 48 (2026-05-14)

**Gate:** Q39 requires the already-existing extra-canonical framework commentary
(named in the roadmap as Enoch / Jasher / Jubilees — "the thickest part of the
extra-canonical books") to pass a second-pass re-check against the *current*
voice skill before it ships in the $4.99 Library tier.

**Method this session:** (1) full Red-Line pattern scan across all 108 chapters
of the Enoch commentary embedded in `parsed/enoch.json` (~64,400 words);
(2) deep close-read of the four theologically heaviest chapters — ch46
(Formless/Formed, the Son-of-Man vision), ch37 (the Elect One superscription),
ch6 (Watchers / seed-war / tares), ch71 (Enoch's exaltation, the Charles
redirect, the two registers of *son of Adam*).

**Scope finding — read this first.** Of the three books Q39 names, **only Enoch
carries chapter commentary in the *piped* corpus.** `parsed/jasher.json` and
`parsed/jubilees.json` have **zero** chapters with a populated `commentary`
field. But the commentary is not missing — **Yoshi confirmed (Session 48) that
he has written the full book and commentary for both Jasher and Jubilees.** It
lives in the published Restored Names editions on his Mac
(`source-texts/existing-restored-editions/Jasher-Restored-Names-Edition.txt`,
1.77 MB; `Jubilees-Restored-Names-Edition.txt`, 620 KB — both show ~85
"commentary" occurrences on a keyword grep). The gap is a **parser gap**: the
Jasher and Jubilees edition parsers never carried the commentary into the
parsed JSON `commentary` field the way the Enoch parser did. **Before the Q39
gate can run on Jasher and Jubilees, those two editions need a parser pass to
extract their commentary into the JSON.** As things stand *this session*, the
gate had a single runnable subject — the Enoch commentary — but the full Q39
scope is genuinely Enoch + Jasher + Jubilees, all three with existing
commentary.

---

## What aligns — the framework spine is sound

The Enoch commentary's theological foundation is **on-framework** and needs no
structural rework:

- **No Jew/Gentile binary** anywhere in 108 chapters (Red Line #1 — clean).
- **No sola-fide / Reformation grammar** — no "saved by grace through faith"
  standing alone, no "faith alone," no "not under law" (Red Line #10 — clean).
- **No "law abolished" / "freed from the law" language** (Red Lines #2, #4 — clean).
- **No grafting errors** — no non-Israelite-grafted-in language (Red Lines #7,
  #11 — clean).
- **No replacement theology** — no "church is the new Israel" (clean).
- **The Trinity is correctly *critiqued*, not assumed** — ch46: "not a vision of
  three separate personalities arranged in a Trinitarian council… The Trinity
  doctrine imports Greek philosophical categories into a Hebrew revelation."
  Matches Checklist 10.
- **The Nature of God is correct** — ch46's Formless/Formed exposition presents
  the Father as the formless infinite source, the Son as the Formed/expressed
  God of the Old-Testament theophanies, with eternal submission maintained.
  Matches Checklist 10 point-for-point.
- **The seed-war is correct** — ch6's Genesis 1 vs. Genesis 2 distinction,
  Adamic seed vs. tares, chaff-vs-tares ("chaff comes off under threshing; tares
  were never wheat"), Esau and Nimrod as serpent-seed, Jeremiah 16:19 as chaff
  language. Matches Checklist 9 and the framework's Adam material.
- **ch71 already does the Red Line #12 work in its exposition** — it explains
  the two registers of *son of Adam* (creaturely vs. prophetic), preserves the
  kaph-comparative for Daniel 7:13 ("one like a son of man with clouds"), and
  documents the Charles redirect. ch71 is the model the rest should match.

The foundation is right. Per the publish-then-edit discipline, everything below
is correctable iteration, not a red flag on the work's integrity.

---

## What contradicts / what's missing — the fixes the gate surfaces

### 1. Red Line #12 is applied to the verse text but NOT to the commentary prose — 83 instances

ch71's own commentary states: *"We have decapitalized the phrase throughout this
edition to restore the plain reading."* That was done to the **verse text**. It
was **not** carried into the **commentary prose**. The scan finds **83
un-restored "son of man" / "Son of Man"** instances across the Enoch
commentary — almost entirely in ch46 and in cross-reference citations
(Matthew 25:31, Daniel 7:13, etc.).

Per Red Line #12 and the Sacred Names convention, *son of man* must become
*son of Adam* **everywhere, every time, in body text and in scripture
quotations** — which includes commentary prose and the cross-ref shorthand:

- **Title/named cases** (Matthew's *the Son of Man*, 1 Enoch's *Elect One / Son
  of Man*, Yahusha's self-designation) → **Son of Adam**.
- **Daniel 7:13 / Revelation 1:13 / Revelation 14:14** (kaph- and
  *homoion*-comparative) → **like a son of Adam** — preserve the comparative.
  The ch46 cross-refs currently read "Son of Man with clouds" for Daniel 7:13,
  which both drops the comparative *and* leaves the lineage flattened.

This is the single largest finding and is exactly what a "second-pass re-check
against the *updated* voice skill" is built to catch — the commentary predates
the current layered Red Line #12.

### 2. Two content bugs baked into the committed commentary

- **ch6 — leftover scaffolding text in the commentary body.** The committed
  commentary contains the line: *"Now I have everything. Here are the four
  supplemental commentary sections, written in MTM's existing style but upgraded
  with your theological framework: Supplemental Commentary Sections."* This is
  authoring-process scaffolding that got committed as content. It must be
  deleted.
- **ch46 — duplicated exposition block.** The Formless/Formed exposition appears
  **twice**, near-verbatim — once headed "The Elect One, the Ancient of Days,
  and the Formless/Formed Structure" and again headed "The Head of Days and the
  Elect One — The Formless and the Formed." One copy should be removed.

### 3. "Ancient of Days" vs. "Head of Days" — consistency

Session 41 established **Head of Days** as the preferred term in the Enoch
edition (the 1 Enoch 46 edit, with the carve-out refusing to collapse the two
titles). The scan finds **21 instances of bare "Ancient of Days"** still in the
commentary outside the reconciled ch46 first-mention. Not a strict voice-skill
Red Line — the loaded skill does not name this — but a consistency item left
half-done by the Session 41 pass. Recommend reconciling to "Head of Days
(Ancient of Days)" on first mention per chapter, then "Head of Days," matching
the ch46 pattern. **Confirm with Yoshi** — this is his edition-level convention,
not a voice-skill rule, so it is his call, not Claude's to settle.

### 4. Name-restoration misses in commentary prose — minor, mechanical

A small number of un-restored names in commentary prose and cross-ref
shorthand (not in the verse text — the verse text is clean):

- **"Israel"** un-restored ~a dozen times in prose (e.g. ch46 "who led Israel
  through the wilderness") → **Yashar'el (Israel)**.
- **"Jesus Christ"** un-restored in a handful of cross-ref paraphrases (ch48,
  57, 61, 63 — "confess Jesus Christ is Lord") → **Yahusha (Jesus) Messiah
  (Christ)**.
- **"Holy Spirit"** un-restored in ch106 cross-ref paraphrase ("filled with
  Holy Spirit") → **Ruach HaKodesh (Holy Spirit)**.
- **"Lord of Spirits"** (ch39 and throughout) — a 1 Enoch divine title; flag
  for Yoshi as a deliberate-or-restore call, not auto-changed.

---

## Suggested fixes — for Yoshi's pick before any edit lands

Per the voice-skill workflow, no edits are made to the commentary until Yoshi
chooses. The options, smallest-blast-radius first:

- **A. Ship-blockers only (recommended for the 2026-05-15 ship).** Delete the
  ch6 scaffolding line; de-duplicate the ch46 block. Two surgical edits, both
  unambiguous bugs, no judgment calls. Everything else rolls into a v1.1 pass
  under the price-lock.
- **B. A + the Red Line #12 commentary sweep.** Add the 83 *son of man →
  son of Adam* / *like a son of Adam* restorations across the commentary prose.
  Deterministic but needs care on the comparative-vs-title split; a scripted
  pass with a hand-review of the Daniel/Revelation cases.
- **C. A + B + name-restoration mechanics + the Head-of-Days reconciliation.**
  The full gate. Larger; better suited to a dedicated wheel than to ship eve.

**Claude's read:** the framework spine passing clean means even Option A ships
honestly — the foundation carries it. Option B is the one that actually closes
the Red Line #12 exposure and is worth its own wheel right after the ship.

---

## Open items handed to Yoshi

1. **Jasher / Jubilees commentary** — confirmed to exist (Yoshi wrote full book +
   commentary for both). It needs a **parser pass** to extract it from the
   published editions into the parsed JSON `commentary` field, after which the
   Q39 gate runs on it the same way it ran on Enoch this session. Worth its own
   bounded wheel.
2. **"Ancient of Days" vs. "Head of Days"** — confirm the edition-level
   convention so the consistency pass has a target.
3. **Which fix option (A / B / C)** lands before the ship.

---

## Closure — Session 57 (b) (2026-05-16)

**Option C — Yoshi's pick at Session 52 — landed.** Phase D sequencing held: the
S52→S53 restoration-pass wheel landed first on the restored Enoch corpus, then
S57 (b) resumed Q39 against `parsed/enoch.json` (Phase D re-parse). Voice skill
loaded fresh at session open (16 marker hits across 2 `Yahuah Elohayka` +
14 `source-echo`). All six Q39 findings applied:

- **Ch6 scaffolding line deleted** (one-line "Now I have everything…
  Supplemental Commentary Sections" authoring artifact).
- **Ch46 duplicate Formless/Formed exposition removed** — the later block headed
  "The Head of Days and the Elect One — The Formless and the Formed" (the
  restated copy); the earlier "The Elect One, the Head of Days, and the
  Formless/Formed Structure" block kept (carries the chapter's flow + the
  Lord-of-Spirits context).
- **Son of Adam commentary sweep** — 74 USE-case restorations across 21 chapters
  (Son of Man → Son of Adam; son of man → son of Adam; sons of men → sons of
  Adam). **MENTION cases preserved (9 instances)** — the inherited English
  phrase is kept where the commentary is *meta-discussing the phrase* (ch71's
  etymology "Son of man — ben adam — means son of Adam", ch71's Charles-redirect
  history, ch46/ch37/ch62's scare-quoted "Son of Man" references discussing the
  title as a title). Carve-out is consistent with the Q39 report's own
  identification of ch71 as "the model the rest should match" — running an
  auto-pass on ch71 would break its pedagogy. Kaph-comparative cases (Daniel
  7:13, Rev 1:13, Rev 14:14) require separate hand-review for "like a" preservation
  in cross-refs — flagged for follow-up if any remain non-comparative.
- **Head of Days reconciliation** — 5 chapters touched. First bare "Ancient of
  Days" in each chapter → "Head of Days (Ancient of Days)" (S52 convention,
  reader orientation per chapter), subsequent → "Head of Days". Bare AoD inside
  scripture cross-ref parentheticals (e.g. "Daniel 7:9 (Ancient of Days…)")
  preserved — the canonical English in cross-refs is intentional.
- **Name-restoration mechanics in prose** — 17 chapters touched. Israel →
  Yashar'el (Israel); Jesus Christ → Yahusha HaMashiach (Jesus Christ); Holy
  Spirit → Ruach HaKodesh (Holy Spirit). Avoids re-restoring already-restored
  instances.
- **Lord of Spirits straggler** (ch39) → Yahuah (God) of Spirits, matching the
  220 existing instances in commentary and the 145 in verse text (S52 decision —
  name restoration, not retranslation; not the elevated Yahuah Tseva'oth).
- **Typo fixes** — `Spiritsand` (ch48 commentary), `Spiritscommanded` (ch54
  commentary) reverted via Phase D re-parse, fixed again here. `sheepbrought`
  (ch89 verse 16) is on the verse-text side; not in scope for the commentary
  fix and confirmed absent from current commentary state.

**Numbers.** 47 total changes. Verse-text drift: **0** (commentary-only fix —
verses entirely untouched). Commentary delta: −3,035 chars (net of scaffold +
duplicate deletions minus name-restoration expansions). Self-test 108/108
passing. Validation reports (`enoch-diff.md`, `enoch-verse-diff.md`)
byte-identical to S56 close — the fix doesn't touch what `restore.py` is
producing against the published edition.

**Open carry to next session.**

- **Jasher / Jubilees Q39 gate** — Phase D landed the commentary into the
  parsed JSON. Jasher and Jubilees have not yet had the Q39 gate run on them.
  Own bounded wheel.
- **Kaph-comparative scan** — Daniel 7:13 / Rev 1:13 / Rev 14:14 cross-references
  in Enoch commentary that may currently read "Son of Adam coming with the
  clouds" need a pass to restore the comparative ("like a son of Adam") per
  Red Line #12's carve-out. Small focused review.
- **Convention answers carried** — Head of Days (S52); name restoration over
  Yahuah Tseva'oth (S52); 15 verse-text son-of-man restorations (S53 — already
  landed in `verses[].text`).
