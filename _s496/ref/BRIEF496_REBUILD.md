# S496 — the Matthew card rebuild, batch 3 (Matthew 14–19) — brief for every drafting agent

You are REWRITING existing cross-reference cards in a study Bible. Each card already ties one verse of Matthew (the
SOURCE) to one verse elsewhere in the canon (the TARGET). The pairs stay exactly as they are — you do not add, drop
or re-point a card. What you write is the short prose the reader sees beside the two verses, the one-line member note
for the thread list, and which thread the card belongs in. These cards were written early, in shorthand full of
house jargon, and they sit in no thread. Your job is to make each one something a reader can simply read.

**Before writing anything, read `/home/claude/s496/ref/yoshi-voice/SKILL.md` in full, then
`/home/claude/s496/ref/yoshi-voice/references/framework-deep.md` in full.** They are the author's voice and theological
standard. The twelve Red Lines are non-negotiable; the author catches violations. Your training's default reading of
these passages is the reading this work exists to take apart — do not let it surface in a quiet phrase.

## Your packet — `/home/claude/s496/packets/matthew_<N>.json`
- `chapter_text_kjv` — the whole Matthew chapter (restored-names KJV).
- `cards[]` — every card to rewrite: `id`, `src` / `src_vn`, `src_text_kjv`, `tgt`, `tgt_text_kjv`, `tgt_context_kjv`
  (the verses around the target, so you read it in its place), `old_note` (the shorthand the card carries now — it
  tells you what connection the author had in mind; KEEP that connection, restate it plainly), `map_thread` /
  `map_confidence` / `map_candidates` (a script's guess at the thread — "high" is usually right, "medium" is only a
  guess: decide by reading), `reversed_pair` (information only).
- `threads[]` — every existing thread these cards could join: `slug`, `title`, `anchor`, `summary_md`, and
  `members_in_this_chapter` (so you can see what each thread is actually about).

The assembler builds the card for you: it sets the whole target verse and the whole Matthew verse on the page in
italics, by script, and puts your prose after them. **So do not repeat either verse in your prose** and do not
retype scripture from memory anywhere.

## What you write, per card
- **`prose`** — one to three plain sentences (about 25–70 words) that show the reader why these two verses belong
  together. Write as a man talking to someone across a table with both verses open in front of them. The reader has
  just read both verses; point at what is in them. Flowing sentences. No list structure, no "X — Y — Z" chains of
  dashes, no semicolon stacks.
  - If you call back to a few words of either verse, put them in italics exactly as they stand in the packet text
    (`*his people*`). If you bring in a THIRD verse, do not cite it by number in passing — either leave it out, or
    quote a verbatim run of it in italics followed by its citation in parentheses, `*…* (Isaiah 11:12)`, copied
    from a text you were given. If you were not given the text, leave it out.
  - Keep the author's point from `old_note`. If the old note's point is itself off against the voice skill (it
    happens), write the card the way the skill reads the passage and say what you changed in `flag`.
- **`member_phrase`** — either the string `WHOLE`, or a verbatim run of at least six consecutive words copied from
  `tgt_text_kjv` (the part of the target verse that carries the point). Verses of about 25 words or fewer: `WHOLE`.
- **`member_sentence`** — one plain sentence (10–30 words) for the thread list, saying what this target verse adds.
- **`thread`** — the `slug` of the existing thread the card belongs in, chosen by reading the thread's summary and
  members against the card. Nearly every passage of Matthew 14–19 already has a thread, so nearly every card joins one.
  A thread that exists gets FILLED, never duplicated. Prefer the thread anchored on the card's own Matthew verse
  whose subject matches; use one of the wide theme threads (no Matthew anchor) only when the card is plainly about
  that theme and not about its own pericope's thread.
- **`flag`** — empty, or one or two sentences: anything you could not settle, a pair that does not seem to belong
  together, an old note whose point you had to change.

## New threads — rare
Only when three or more cards of the chapter share a subject that no thread in `threads[]` covers. Then add an
entry to `new_threads[]`: `slug` (lowercase, hyphens, begins `matthew-<chapter>-`, English book-name fragments
only, not already in `threads[]`), `title` (a plain phrase, not Title Case Of Every Word, sacred names with their
parentheticals), `anchor_start_vn` / `anchor_end_vn` (verses of this chapter), and `summary_md`: 150–400 words in
flowing sentences that quote, each on its own line in stand-alone italics with its citation in parentheses, the
Matthew verse(s) and the target verse(s) that carry the point — copied exactly from the packet's KJV texts — and
walk the reader through the connection. Where the summary shows the older scripture already held what Matthew
says, the author's own opener is *It ain't new* — those words, never "This is not new". Give the cards that slug.

## Batch 3 notes (Matthew 14–19) — read these before the packet
- **Names now read in their Old Testament spellings** in the live text and in the packet: Elijah (not Elias), Isaiah (not
  Esaias), Jonah (not Jonas), Noah (not Noe), Zion (not Sion). Use those spellings in your prose; never the Greek-form ones.
- **Chapter 15, the woman of Canaan (15:21–28).** She, the centurion (Matthew 8), Naaman (2 Kings 5) and the widow of
  Zarephath (1 Kings 17) are not "the nations coming in" and not pictures of outsiders added by faith. They are sheep of the
  scattered house who heard the Shepherd's voice where they were — seed of promise revealed in four places of the scattering.
  Read Matthew 15:24 as the plain boundary it is (*I am not sent but unto the lost sheep of the house of Yashar'el (Israel)*)
  and let her answer and his *great is thy faith* show that she was one of those sheep. Ruth (Ruth 1) is a different thing:
  she came into the line by marriage to Boaz, the two made one — never mix the two.
- **Chapter 15, the traditions of men (15:1–20).** What Yahusha (Jesus) strikes is the tradition laid on top of the
  commandment (corban voiding *honour thy father and thy mother*), never the commandment, and never the food laws. *Not that
  which goeth into the mouth defileth a man* is about eating bread with unwashed hands (15:20 says so) — it does not open
  Leviticus 11. Where a card pairs 15:11 with Acts 10, say what Peter himself says the vision meant (*Elohim (God) hath shewed me that
  I should not call any man common or unclean*, Acts 10:28 — only if that text is in your packet; else leave Acts 10 at what
  its own verse in the packet says). No Acts-10-abolishes-the-food-laws reading, ever.
- **Chapter 16.** The leaven of the Pharisees and Sadducees is their doctrine (16:12) — teaching that works through the
  whole lump. The rock is what Peter confessed (*Thou art the Messiah (Christ), the Son of the living Elohim (God)*), not
  Peter. The keys and binding/loosing are stewardship given, not a church's power over heaven. *The Son of Adam shall come
  in the glory of his Father* (16:27) and *reward every man according to his works* — works are rewarded; do not soften it.
- **Chapter 17.** The transfiguration: Moses and Elijah stand with him; *hear ye him* (17:5) sends the hearer to the one who
  spoke the Torah, not away from it. *Elijah truly shall first come, and restore all things* — John came in that pattern, and
  the restoring is still ahead; do not collapse it to "John was Elijah, done". The tribute money: the children are free.
- **Chapter 18.** The lost sheep (18:12) is the same shepherd of Ezekiel 34 seeking his own scattered sheep. Binding and
  loosing with two or three witnesses is Deuteronomy's own procedure. *Where two or three are gathered* — do not turn it
  into a church-meeting slogan; keep it on the witnesses of 18:16–19.
- **Chapter 19.** *What therefore Elohim (God) hath joined together* — the two made one is the creation word; Moses' bill
  of divorce was *because of the hardness of your hearts*, a concession, not a commandment overturned. *If thou wilt enter
  into life, keep the commandments* (19:17) — say it plainly; the commandments he lists are the Torah's. The twelve thrones
  judging the twelve tribes (19:28): the tribes are real tribes, both houses, gathered — never a figure for "the church".
- **Chapter 14.** John's death in Herod's house follows Elijah and Jezebel (1 Kings 19, 21); Leviticus 18:16 / 20:21 is the
  commandment Herod broke. The feeding in the wilderness: the shepherd feeds his flock as Elisha and the manna did; twelve
  baskets. Walking on the sea: *It is I* is the one who treads on the waves of the sea (Job 9:8) — he is the one who was seen
  by the fathers, come in flesh.

## Voice rules (non-negotiable)
- **Come and See.** The verses are on the page; the prose points at them. Never tell the reader to go look
  something up. No scholar's posture.
- **No internal references.** Never: "the framework", "Red Line", "the voice skill", session numbers, the author's
  name, any document name, any thread slug. The reader has none of these.
- **No jargon.** Never: substance, architecture, motif, register, apparatus, prototype, pre-figure, marker, grid,
  pericope, typology, diagnostic. Say the plain thing.
- **No hyphen-chains.** Never string three or more words with hyphens ("curse-of-the-law", "mission-scope-lock").
  Ordinary compounds (first-born, well-pleased) are fine.
- **Sacred names with the parenthetical at EVERY mention in your own prose**, each time, not only the first:
  Yahuah (the LORD), Yahusha (Jesus), Elohim (God), Messiah (Christ), Ruach HaKodesh (Holy Spirit), Yashar'el
  (Israel), Yahudah (Judah), Yahudim (Jews), Yahudi (Jew). Possessives: "Yahusha's (Jesus's)". Never the bare
  English "God", "Jesus", "the Lord", "Israel", "Judah", "Christ" in your prose. Other names (John, Joseph, Moses,
  Abraham, Jerusalem, Egypt) in plain English.
- **Son of Adam**, never "son of man".
- **English book names** in every citation (Genesis, Psalm, Isaiah, Matthew) — never Hebrew book names.
- **Torah stands.** Yahusha (Jesus) does not replace, relax, deepen-past or supersede the commandments; where the
  Sermon answers "ye have heard that it was said", he is clearing away what was laid on top of the Torah and
  setting the commandment back in the heart where Moses put it. Never pit faith or grace against the commandments.
- **Who "his people" are.** The people he came to save are the seed of promise — both houses, the scattered house
  of Yashar'el (Israel) and Yahudah (Judah) — a people by the fathers' blood, being gathered home. Never "Jew and
  Gentile" as the two kinds of people. The nations are not made Yashar'el (Israel) by believing, and nobody is
  "grafted in" from outside: Rahab and Ruth came into the line as wives of sons of Yashar'el (Israel) — by the
  marriage covenant, the two made one — not as a picture of the nations being added. The wise men are not "the
  nations coming in". Do not write "the stranger grafted in" or anything like it, even though an existing thread's
  title uses the phrase.
- **The Father and the Son.** The Father is unseen, without form; Yahusha (Jesus) is the one who is seen — the
  Word who walked with the fathers and came in the flesh. He is Elohim (God) and he has a Father. Do not use
  "Trinity", "three persons", "second person"; do not collapse Father and Son into one either.
- **Victims, not enemies.** Systems get named plainly; people never get mocked. Pharisees who turn are welcome.
- **Daniel and Revelation are separate books** — never read one as if it were the other.
- Do not prescribe practice ("you should…"). Do not preach past the two verses. Do not end with a flourish.

## Output — one file, `/home/claude/s496/out/matthew_<N>_draft.json`, written with Python
```
{"model": "<your model name, exactly>", "chapter": <N>,
 "cards": [{"id": 2525, "prose": "...", "member_phrase": "WHOLE", "member_sentence": "...", "thread": "<slug>", "flag": ""}],
 "new_threads": [{"slug": "...", "title": "...", "summary_md": "...", "anchor_start_vn": 11, "anchor_end_vn": 17}]}
```
`json.dump(..., ensure_ascii=False, indent=1)`. Every card id of the packet appears exactly once. Before you
finish, run `python3 /home/claude/s496/tools/precheck496.py <N>` and fix everything it reports, then re-run until
it prints PASS. Write nothing else to disk outside `/home/claude/s496/out/`. Report: cards done, threads used
(count per slug), new threads, flags.
