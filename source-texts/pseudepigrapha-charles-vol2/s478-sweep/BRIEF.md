# S478 — Adam and Eve (Charles, Apocalypse of Moses / Vita) + 4 Maccabees card work — brief for every agent

You are helping fix cross-reference cards in a study Bible. Every card ties one verse of an extra-canonical book
(here: Charles's *Books of Adam and Eve* — the Apocalypse of Moses and the Vita Adae — cited as **Adam and Eve c:v**;
and **4 Maccabees c:v**) to one verse of another
book (the canon mostly; sometimes Jubilees, 1 Enoch, Jasher, Wisdom of Solomon, Ecclesiasticus) with a short note.
Work by content: read the texts given to you, decide, and write. Never decide by counts, ratios, or guesses.

**Before writing anything, read `/mnt/skills/plugins/yoshi-voice/SKILL.md` in full.** It is the author's voice
and theological standard; the Red Lines in it are non-negotiable and the author catches violations. The notes
below are the compressed working rules for this job; the skill governs where they are silent.

## Voice rules (non-negotiable)
- **Come and See.** Quote, don't cite. The verse stands on the page in italics, cited in parentheses right after
  it. The note shows the connection in front of the reader; the reader goes nowhere.
- **No internal references the reader can't see.** Never write: "the framework", "the framework reads",
  "wisdom-stream", "Red Line", "apparatus", "substance" as a doctrine-noun ("verbatim in substance", "the
  Tanakh-substance", "finds its substance in"), "-register", "FRAMEWORK-MAJOR", "locked", "S1xx"/"S4xx", "Yoshi",
  "voice skill", "the teaching corpus", "as the framework names", "verbal-anchor", "architecture" as jargon,
  "motif"/"prototype"/"marker" as jargon. Unfold the point in plain prose instead.
- **No hyphen-chains.** Never "the sceptre-of-the-kingdom-shining-forth substance", "the love-as-thine-own-soul of
  the fourth", "the king-walks-into". Write sentences. (Ordinary English compounds like "a hundred-and-ten-year
  life" or "seventy-five-year-old" are fine.)
- **Flowing sentences, not robotic point-structure.** Direct, scripture-anchored, warm toward the reader,
  patient toward the deceived. Dismantle systems, never people. No "Jew and Gentile" binary.
- **Sacred names with parentheticals, every mention in YOUR prose:** Yahuah (God) / Yahuah (the Lord) echoing
  what the source line says; Yahusha (Jesus); Elohim (God); Yashar'el (Israel); Yahudah (Judah); Yahudim (Jews);
  Ruach HaKodesh (Holy Spirit); Messiah (Christ). "son of man" is always "son of Adam" (Son of Adam as the
  Messianic title). Patriarch names: either Hebrew-with-parenthetical or English, consistent within one note.
- **Quote texts verbatim from the live text you are given.** The live extra-book texts restore Yahuah / Elohim
  but keep "Israel", "Jacob", "Joseph" in plain English where they do, keep Charles's brackets and parentheses,
  and sometimes carry an odd spelling. Quote exactly as it stands: do not add *Yashar'el (Israel)* inside a
  quotation, do not retype from memory, do not "fix" spelling. The extra-book quote comes from `extra.text` (or
  `extra.prev` / `extra.next` when the point genuinely spans the neighbor). The canon quote comes from
  `other.text_canon` (restored-names KJV, with the author's own renderings on a few verses — quote what is there)
  — NEVER from `other.text_db`. When the other end is an extra (Jubilees, 1 Enoch, Jasher, Wisdom…)
  `text_canon` is null and you quote `other.text_db`.
- **Book names always English, exactly these forms in citations:** 2 Enoch; Testaments of the Twelve Patriarchs;
  2 Baruch; 3 Baruch; 1 Adam and Eve; 2 Adam and Eve; Apocalypse of Abraham; Ascension of Isaiah; Jubilees;
  1 Enoch; Jasher; Wisdom of Solomon; Ecclesiasticus; Genesis, Psalm, Matthew… Never a database slug
  ("1-adam-eve 5:11", "apocalypse-of-abraham 9:6"), never Hebrew book names (Bereshit, Yeshayahu, Mattityahu).
- **Testaments of the Twelve Patriarchs numbering.** The live book numbers its chapters 1–142 straight through the
  twelve testaments (Reuben 1–7, Simeon 8–16, Levi 17–35, Judah 36–61, Issachar 62–68, Zebulun 69–78, Dan 79–85,
  Naphtali 86–94, Gad 95–102, Asher 103–110, Joseph 111–130, Benjamin 131–142). Cite by the live numbering —
  *(Testaments of the Twelve Patriarchs 100:2)* — and name the patriarch in the prose ("Gad tells his sons…"); the
  packet gives you `extra.testament` ("Gad 6") for that. Old notes that say "Testament of Gad 2:2" or "Gad 62:3"
  were written against an older numbering and are STALE — the card already sits on the right verse; fix the
  citation to the live numbering.
- **Torah stands.** Nothing abolished. Grace is the way home to the commandments, never freedom from them.
  The scattered seed of Yashar'el (Israel) is a bloodline people being gathered; the "Gentiles" in Paul are
  usually that scattered seed; keep "Gentiles" where scripture uses it. Justification by faith is a different
  question from covenant life by Torah — never pit them.
- **The seed of promise is paternal blood.** Election precedes response: the sheep hear because they are sheep.
  The outsiders the gospels show helped (woman of Canaan, centurion, Naaman, widow of Zarephath) are seed of
  promise revealed by hearing — never "mercy at the edge of the line". The nations are not grafted in; both
  olive branches are Yashar'el (Israel). The twelve tribes gathered in the Testaments and 2 Baruch 78 are the
  paternal blood remnant — never "the church".
- **Nature of God:** the Father is the formless one; Yahusha (Jesus) is the Formed — the one who spoke, walked,
  appeared and wrestled in the Tanakh and came in flesh. Not Trinity, not modalism. Don't assert either doctrine.
  Do not call Yahusha "the Father"; do not make the one at the bush or on Sinai the Father. The Ascension of
  Isaiah's "Beloved" descending through the heavens is the Formed one sent by the Father — keep the Son's
  submission to the Father (Philippians 2:11 is *to the glory of Elohim (God) the Father*).
- **Daniel and Revelation are separate books;** don't read an absolute into one from the other.

## Card note shape (for rebuilt notes)
`*<full live extra-book verse>* (<extra.cite>). *<full other verse>* (<other.cite>). <2–5 sentences of plain
prose that show why these two belong together.>`
Where the card's extra-book end is the SOURCE (`side` = "S"), lead with the extra-book verse; where it is the
TARGET (`side` = "T" — the card sits on a canon verse pointing to the extra), lead with the other verse and give
the extra second. Quote one extra verse unless the note's point genuinely spans two adjacent verses; then quote
both, verbatim, in order, and cite as (Name c:v–v). Keep whatever true connection the old note was making; drop
its jargon; do not invent theology the old note did not carry and the skill does not hold. If the old note's
point is wrong by the skill, write the right point and say so in `flag`.

## Member note shape (short, for thread lists)
`<extra.cite> — *<a verbatim phrase from the live extra verse, 6–20 words>.* <one sentence.>`

## Output
One JSON list, one object per input card, in input order:
`{"id": <id>, "new_note": "...", "member_note": "...", "move": null | "<ed>|<book>|c:v", "flag": ""}`
`move` is almost always null: set it only when the OLD note plainly describes `extra.prev` or `extra.next`
rather than `extra.text` (then quote the verse you moved to, and say why in `flag`). `flag` is for anything the
author should see: a theology correction you made, an old note you could not harmonize, a live-text misprint.
Write valid JSON only — escape quotes inside strings, keep the italics asterisks, no trailing commas.

## S478 specifics
- The live text of both books was merged on Oct 26 (print lines joined into whole clauses; verses renumbered 1..n per
  chapter). Any `c:v` in an OLD note or summary may be the old numbering — never copy a citation from the old note;
  cite the address given in the packet (`extra.cite`, or `move_to` / `extra_new.cite` where the packet says the card
  moves). Old prose like "edition chapter 8, verses 4-5; standard 4 Macc 9:4-5" is gone: just cite the live address.
- Book names in citations: **Adam and Eve** (never "Adam & Eve", "Vita", "Apocalypse of Moses"), **4 Maccabees**.
- `kind: PATCH` items: rewrite ONLY the flagged words (`flagged`) into a plain sentence; keep every quotation,
  citation and the rest of the prose exactly as it stands. Output `{"id", "new_note", "flag"}` — `new_note` is the
  whole note with that one change. "substance … shadow" (Colossians 2:17 / Hebrews 10:1 echo) is to be said in plain
  words: e.g. "the blood that truly purifies, which Eleazar's *make my blood their purification* pointed toward".
- Summary PATCH items (`thread_id`): same rule on `old`; output `{"thread_id", "new", "flag"}`.
- 4 Maccabees' seven brothers and the mother are the paternal seed of Yahudah (Judah) under Antiochus keeping the Law
  unto death; their endurance is a witness that Torah stands, not a doctrine of a vicarious atonement that replaces the
  Messiah's. "ransom for our nation's sin" (17:19) is the book's own voice; the note may say it foreshadows the
  Messiah's laying down of his life, never that the martyrs' blood atoned. "they without us should not be made
  perfect" (Hebrews 11:40) — the faithful asleep await the first resurrection with us.
