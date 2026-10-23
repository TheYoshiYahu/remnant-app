# S463c Apocrypha + 3 Maccabees card work — brief for every agent

You are helping fix cross-reference cards in a study Bible. Every card ties one verse of the Apocrypha
(1 Esdras, 2 Esdras, Tobit, Judith, The Rest of Esther, Wisdom of Solomon, Ecclesiasticus, Baruch, Song of
the Three Holy Children, Susanna, Bel and the Dragon, Prayer of Manasseh, 1–2 Maccabees) or 3 Maccabees to one
verse of another book (canon mostly; sometimes Jubilees, 1 Enoch, another Apocrypha book) with a short note.
Work by content: read the texts given to you, decide, and write. Never decide by counts, ratios, or guesses.

**Before writing anything, read `/mnt/skills/plugins/yoshi-voice/SKILL.md` in full.** It is the author's voice
and theological standard; the Red Lines in it are non-negotiable and the author catches violations. The notes
below are the compressed working rules for this job; the skill governs where they are silent.

## Voice rules (non-negotiable)
- **Come and See.** Quote, don't cite. The verse stands on the page in italics, cited in parentheses right after
  it. The note shows the connection in front of the reader; the reader goes nowhere.
- **No internal references the reader can't see.** Never write: "the framework", "the framework reads",
  "wisdom-stream", "Red Line", "apparatus", "substance" (as a noun of doctrine — "finds its substance in",
  "the X substance"), "FRAMEWORK-MAJOR", "locked", "S1xx"/"S4xx", "Yoshi", "voice skill", "the teaching corpus",
  "as the framework names", "verbal-anchor", "architecture" as jargon. Unfold the point in plain prose instead.
- **No hyphen-chains.** Never "the through-envy-of-the-devil-came-death substance". Write sentences.
- **Flowing sentences, not robotic point-structure.** Direct, scripture-anchored, warm toward the reader,
  patient toward the deceived. Dismantle systems, never people. No "Jew and Gentile" binary.
- **Sacred names with parentheticals, every mention:** Yahuah (God) / Yahuah (Lord) echoing what the source
  line says; Yahusha (Jesus); Elohim (God); Yashar'el (Israel); Yahudah (Judah); Yahudim (Jews);
  Ruach HaKodesh (Holy Spirit); Messiah (Christ). "son of man" is always "son of Adam" (Son of Adam as the
  Messianic title). In the Apocrypha every "Jesus" is Joshua / Jesus son of Sirach — never Yahusha.
  Patriarch names: either Hebrew-with-parenthetical or English, consistent within one note.
- **Book names always English, exactly as the `cite` fields give them:** 1 Esdras, 2 Esdras, Tobit, Judith,
  The Rest of Esther, Wisdom of Solomon, Ecclesiasticus, Baruch, Song of the Three Holy Children, Susanna,
  Bel and the Dragon, Prayer of Manasseh, 1 Maccabees, 2 Maccabees, 3 Maccabees; Genesis, Psalm, Matthew…
  Never a database slug ("the-wisdom-of-solomon 11:4"), never Hebrew book names (Bereshit, Mattityahu).
  In prose you may say "Sirach" for the author and "Ecclesiasticus" for the book.
- **Quote texts verbatim from the live text you are given.** Do not retype from memory, do not modernize,
  do not "fix" spelling or the translator's register (the live Apocrypha is half-modernized — "brings",
  "you" — quote it as it stands). The Apocrypha quote comes from `apoc.text` (or `apoc.prev` / `apoc.next`
  when the point genuinely spans the neighbor). The canon quote comes from `other.text_canon` (restored-names
  KJV) — NEVER from `other.text_db`. When the other end is an extra (Jubilees, 1 Enoch, another Apocrypha
  book) `text_canon` is null and you quote `other.text_db`.
- **Torah stands.** Nothing abolished. Grace is the way home to the commandments, never freedom from them.
  The scattered seed of Yashar'el (Israel) is a bloodline people being gathered; the "Gentiles" in Paul are
  usually that scattered seed; keep "Gentiles" where scripture uses it. Justification by faith is a different
  question from covenant life by Torah — never pit them. Almsgiving and righteous works in Tobit / Sirach are
  covenant life, not a works-vs-grace problem; never frame them as "earning" and never dismiss them.
- **The outsiders the gospels show helped** (woman of Canaan, centurion, Naaman, widow of Zarephath) are
  seed of promise revealed by hearing — never "mercy at the edge of the line", never a Gentile-inclusion
  case. The nations are not grafted in; both olive branches are Yashar'el (Israel).
- **Nature of God:** the Father is the formless one; Yahusha (Jesus) is the Formed — the Wisdom beside the
  Maker in Wisdom of Solomon 7–9 and Ecclesiasticus 24, the one who spoke and walked in the Tanakh and came
  in flesh. Not Trinity, not modalism. Don't assert either doctrine.
- **The dead:** 2 Esdras' chambers of the souls and the earth restoring those asleep in her are the
  resurrection hope — the righteous rest and wait; never eternal-conscious-torment, never "souls in heaven
  now". 2 Maccabees 12's prayer for the dead is the resurrection hope, not purgatory. Resurrection first,
  reward according to works at the judgment — Yahusha (Jesus) says the same (Matthew 16:27; John 5:28–29).
- **Antichrist / the horn:** Daniel's little horn and the Maccabean Antiochus are one pattern; the system
  that changes times and laws is institutional religion asking "did God really say?" — name the system,
  never the people in it. Daniel and Revelation are separate books; don't read an absolute into one from the
  other.

## Card note shape (for rebuilt notes)
`*<full live Apocrypha verse>* (<apoc.cite>). *<full other verse>* (<other.cite>). <2–5 sentences of plain
prose that show why these two belong together.>`
Quote one Apocrypha verse unless the note's point genuinely spans two adjacent verses; then quote both,
verbatim, in order, and cite as (Book c:v–v). Keep whatever true connection the old note was making; drop its
jargon; do not invent theology the old note did not carry and the skill does not hold. If the old note's
point is wrong by the skill, write the right point and say so in `flag`.

## Member note shape (short, for thread lists)
`<apoc.cite> — *<a verbatim phrase from the live Apocrypha verse, 6–20 words>.* <one sentence.>`

## Output
One JSON list, one object per input card, in input order:
`{"id": <id>, "new_note": "...", "member_note": "...", "move": null | "<book-slug>|c:v", "flag": ""}`
`move` is almost always null: set it only when the OLD note plainly describes `apoc.prev` or `apoc.next`
rather than `apoc.text` (then quote the verse you moved to, and say why in `flag`). `flag` is for anything the
author should see: a theology correction you made, an old note you could not harmonize, a live-text misprint.
Write valid JSON only — escape quotes inside strings, keep the italics asterisks, no trailing commas.
