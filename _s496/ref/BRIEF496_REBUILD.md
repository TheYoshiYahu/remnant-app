# S496 — the Matthew card rebuild, batch 5 (Matthew 25–28, the last) — brief for every drafting agent

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
  members against the card. Most passages of Matthew 25–28 already have a thread, so nearly every card joins one.
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

## Batch 5 notes (Matthew 25–28) — read these before the packet
- **Names read in their Old Testament spellings** in the live text and in the packet: Elijah (not Elias), Isaiah (not Esaias), Jonah (not
  Jonas), Noah (not Noe), Zion (not Sion). Use those spellings in your prose; never the Greek-form ones.
- **Never call Yahusha (Jesus) "the King" in your own prose.** The old notes and some old thread titles do it ("the King's look", "the King
  resurrected") — that is house shorthand. Use his name, Yahusha (Jesus), every time. Where a quoted verse says *King* (Matthew 27:11, 27:37,
  25:34, 25:40, Zechariah 14:16) the verse says it; you do not. The precheck now flags "the King" in prose.
- **Peter, Judas, Caiaphas, Pilate, Joseph of Arimathea, Mary Magdalene** in plain English. The old notes write "Kefa" and "Yahudah" for Judas
  — Yahudah (Judah) is the house and the tribe; Judas is Judas.
- **Threads.** Same order as before: (1) the thread anchored on this card's own Matthew verses when its subject matches; (2) a new
  `matthew-<ch>-…` thread when three or more cards of the chapter sit in a scene no Matthew thread covers; (3) a thread anchored in another
  book only when the card's target IS that book's parallel verse or the card is plainly about exactly that subject; (4) a wide theme thread
  with no anchor only when the card is about that theme and not its own scene. The map proposes several sub-slugs for one scene
  (`matthew-25-the-sheep-and-the-goats-other-witnesses / -revelation / -prophets-and-histories`; `matthew-26-the-plot-against-yahusha-
  torah-witnesses / -gospel-parallels / -other-witnesses / -revelation`): **one scene is ONE thread** — and where a live thread is already
  anchored on that scene (the sheep-and-goats thread at 25:31–46, the thirty-pieces thread, the blood-of-the-new-covenant thread, the
  veil thread) it gets FILLED, not given a second thread. A thread that exists gets FILLED, never duplicated.
- **Chapter 25 — the post-harvest sifting; carries weight.** The three parables and the throne are one scene of judging the household's
  works. The ten virgins are all virgins of the house with lamps; the five shut out are told *I know you not* (25:12) — that is said to
  the unfruitful of the household, not to outsiders or to tares, the same word as Matthew 7:23. The talents: the servants are all *his
  own servants*; the unprofitable one is cast out for bearing nothing — works are judged. The sheep and the goats (25:31–46): the ones
  gathered *before him* are the gathered of all nations — the elect gathered from the four winds (24:31), brought out of the nations
  (Ezekiel 37:21) — and the sheep are sorted from the goats by what they did to *the least of these my brethren*. Never "the nations
  judged by how they treated the Jews", never "the Gentiles judged apart from Israel", never "everyone is saved by good works". The
  *brethren* of 25:40 are his brethren by the fathers' blood — the targets say so (Hebrews 2:11, 2:16 *the seed of Abraham*, Psalm 22:22,
  Romans 8:29, Deuteronomy 17:15 *from among thy brethren*, Matthew 12:46–50 *whosoever shall do the will of my Father*, Matthew 28:10 and
  John 20:17 *my brethren* said by the risen one); Acts 9:4 *why persecutest thou me* — he counts what is done to them as done to him.
  *Inherit the kingdom prepared for you from the foundation of the world* (25:34): the inheritance was theirs before they did a thing; the
  works reveal who kept it. Deuteronomy 33:2, Zechariah 14:5, 2 Thessalonians 1:7, Revelation 19:11 beside 25:31: the one who came at
  Sinai with his holy ones is the one who comes with his angels. Isaiah 2:2, Micah 4:1, Isaiah 60:1, 66:18, Zechariah 14:16, Joel 3:1,
  Revelation 21:24 beside 25:34 and 25:46: the nations left alive after the day come up to Zion and are taught — that is the reign, when
  the gathered seed is a kingdom of priests to them; say what each verse shows and no more. Revelation 20:4, 20:10, 20:14, 21:1, 22:1 and
  Daniel 12:2, Isaiah 66:24: write what each verse itself says beside Matthew's *everlasting punishment* and *life eternal*; Daniel and
  Revelation never through each other. *Prepared for the devil and his angels* (25:41) beside 2 Peter 2:4 and Jude 6: the fire was made for
  the angels that sinned — the ones who left their estate before the flood — and men go there only by choosing their side. 25:41 → John
  3:16: the old note meant 1 John 3:16–18 (*not in word, but in deed*); write honestly to John 3:16 on the page — the Father's giving of
  the Son against the *depart from me* — and flag that the note meant 1 John. Isaiah 58:6, 61:1, Job 31:16, Proverbs 19:17, 21:13,
  James 4:17, Deuteronomy 10:18: the works named at the throne are the Torah's own works of mercy — the commandment kept, not a new
  standard replacing it. Cards 2990 and 2991 are a reversed pair; both are orphans, so both are written and both kept.
- **Chapter 26 — the Passover, the cup, the trial; carries weight.** *Ye know that after two days is the feast of the passover* and 26:17–19:
  he kept the feast as Moses gave it; Exodus 12 stands and he is the lamb of it (1 Corinthians 5:7, John 1:29, 1 Peter 1:18–19, Isaiah
  53:7, Genesis 22:8, Revelation 5:6, 7:14, 12:11, 19:7) — the feast is not done away by his death; it is filled. **The cup, *this is my
  blood of the new testament, which is shed for many*** (26:28) with Exodus 24:8 and Jeremiah 31:31: the new covenant is the covenant made
  *with the house of Yashar'el (Israel), and with the house of Yahudah (Judah)* — both houses, the Torah written on the heart (Jeremiah
  31:33) — never "the church", never a covenant that replaces the commandments; the *many* are the seed of promise (Isaiah 53:10–11). The
  anointing at Bethany: 1 Samuel 10:1 and 16:13 are the anointing of a king; he says she did it *for my burial* — say both as the texts
  stand. Deuteronomy 15:11 *the poor shall never cease out of the land* — the commandment to the poor stands; he quotes it. Judas: Zechariah
  11:12–13 and the thirty pieces, John 13:2, 13:27 Satan entering — Judas chose; name no "Yahudah". **Gethsemane, *O my Father, if it be
  possible, let this cup pass from me: nevertheless not as I will, but as thou wilt*** (26:39): the cup is the Father's cup of wrath
  (Psalm 75:8, Isaiah 51:17) and he drinks it; the Son submits to the Father — he is Elohim (God) and he has a Father; say both, collapse
  neither, do not explain it away ("in his humanity"). The arrest: Zechariah 13:7 *smite the shepherd*, Psalm 55:12 the familiar friend,
  Proverbs 27:6 the kiss, Genesis 9:6 beside the sword — he refuses it; John 10:17 he lays his life down himself, no man takes it.
  **The trial before the high priest (26:57–68).** Deuteronomy 19:15: the Torah requires two agreeing witnesses — the court could not find
  them (26:60) and condemned him anyway; the Torah stood, their court did not keep it. Isaiah 50:6, 53:7: he held his peace. **26:64,
  *Hereafter shall ye see the Son of Adam sitting on the right hand of power, and coming in the clouds of heaven*:** Psalm 110:1 — the one
  David calls *my Lord* sits at Yahuah's (the LORD's) right hand, the seen one beside the unseen Father; Daniel 7:13 — *one like the Son of
  Adam* comes with the clouds; **keep Daniel's *like*** and say what Daniel's own verse gives him (Daniel 7:14), nothing from Revelation.
  The high priest heard blasphemy because he understood the claim: the one before him was saying he is the one at the right hand. Peter's
  denial (26:69–75) with 26:33, Psalm 51:17, Joel 2:12, John 21:15: Peter fell, wept, and was restored — a sheep that stumbled, never
  condemned; write him kindly. The Mark, Luke and John parallels (26:47, 26:57, 26:69): say what the other gospel adds to Matthew's telling.
- **Chapter 27 — carries weight at 27:25.** Judas and the field: Zechariah 11:12–13 the thirty pieces cast to the potter; Jeremiah 19:1–2
  and 32:6–9 (Matthew names *Jeremy the prophet*, 27:9 — the potter's vessel at the valley and the bought field; write what each Jeremiah
  verse says); Psalm 109:8 his office to another; Acts 1:16–20; Deuteronomy 23:18 — the price of blood may not come into the house, so they
  bought a field with it. Pilate: Isaiah 53:7 he answered nothing; Deuteronomy 21:1–9 the hands washed over innocent blood — Pilate borrowed
  the gesture and not the innocence; Acts 3:13, 4:25–27 (Psalm 2) the rulers gathered against the anointed. **27:25, *His blood be on us,
  and on our children*:** said by the crowd the chief priests and elders stirred (27:20) — the verdict belongs to the rulers and the system
  that owned the court, never to "the Jews" as a people under a curse; the people are the sheep those shepherds devoured (Ezekiel 34), and
  the same house will *look upon me whom they have pierced, and they shall mourn* (Zechariah 12:10). Never write a curse on a people. The
  mocking (27:27–31): Isaiah 50:6, 53:3, 53:7; Psalm 22:7, 22:16 (write to the verse on the page, not to 22:18's lots); Genesis 3:18 beside
  the crown of thorns — the thorns of the curse on the ground set on his head — and Genesis 3:15 the seed who bruises the serpent's head:
  say it as the two texts stand, as a reading line on line, not as a stated fulfilment. The crucifixion (27:39–50): Psalm 22:1 his own
  cry, Psalm 69:21 the vinegar, Amos 8:9 the darkness at noon is the day of Yahuah's (the LORD's) darkness, John 10:17–18 he gives up his
  own life, Hebrews 5:7. The veil (27:51 → John 19:31, the veil thread exists — fill it): say what the two verses say; do not write that the
  temple or its service was abolished by the tearing. The burial: Isaiah 53:9 *with the rich in his death*; Joseph of Arimathea; 28:11 the
  watch set.
- **Chapter 28 — *teach them to observe all things*; carries weight.** The empty tomb: Matthew 12:38–40 the sign of Jonah, 26:32 *after I am
  risen again, I will go before you into Galilee*; Leviticus 23:15 the sheaf waved *on the morrow after the sabbath* — he rose as the
  firstfruits in the feast's own count (1 Corinthians 15:20); say the count the verse gives and do not build a calendar on it. *Go tell my
  brethren* (28:10) with John 20:17, Hebrews 2:11, Matthew 25:40: the risen one calls them brethren — the same brethren of 25:40. 28:11–15:
  the guards paid to lie, Acts 4:1–3 and 5:17 the same rulers suppressing the witness — the system, not the people. 28:16 the mountain in
  Galilee: Matthew 17:1 and 5:1 are other mountains; do not make them one mountain unless the text does (it does not). Luke 24:36, John
  20:24–29 the doubting; Acts 1:15–26 the twelve made whole again. **28:18–20.** *All power is given unto me* — Psalm 110:1 and Psalm 8:6
  *thou hast put all things under his feet* (the son of Adam of Psalm 8:4): given by the Father to the Son; he is Elohim (God) and has a
  Father. Matthew 1:21 and 1:23 beside 28:18–20: Yahusha (Jesus) — Yahuah (the LORD) saves — and *El (God) with us* open the book, *I am
  with you alway* closes it. **28:19, *baptizing them in the name of the Father, and of the Son, and of the Ruach HaKodesh (Holy Ghost)*:**
  one name; the Father unseen, the Son who is seen, the Spirit — no "Trinity", no "three persons", and no collapsing them into one either;
  the live thread for it exists — fill it. **28:20, *Teaching them to observe all things whatsoever I have commanded you*** beside Matthew
  5:17–19 and 7:21: what he commanded is the Father's commandments kept — the Torah taught to the gathered, not a new law in its place;
  never "the law ended at the cross", never "the great commission to the Gentiles replacing Israel". *Teach all nations*: the proclamation
  goes out to where the scattered sheep are (Deuteronomy 30:1–4); the sheep hear where they are. Mark 16:14–15, Luke 24:44–47, John 20:21
  beside 28:18: the other gospels' sending — Luke's *beginning at Jerusalem*, John's *as my Father hath sent me*.

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
