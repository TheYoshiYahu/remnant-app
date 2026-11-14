# S496 — the Mark and Luke card rebuild (S502: Mark 1–15 and Luke 1–21, one batch each) — brief for every drafting agent

You are REWRITING existing cross-reference cards in a study Bible. Each card already ties one verse of Mark or Luke (the
SOURCE) to one verse elsewhere in the canon (the TARGET). The pairs stay exactly as they are — you do not add, drop
or re-point a card. What you write is the short prose the reader sees beside the two verses, the one-line member note
for the thread list, and which thread the card belongs in. These cards were written early, in shorthand full of
house jargon, and they sit in no thread. Your job is to make each one something a reader can simply read.

**Before writing anything, read `/home/claude/s496/ref/yoshi-voice/SKILL.md` in full, then
`/home/claude/s496/ref/yoshi-voice/references/framework-deep.md` in full.** They are the author's voice and theological
standard. The twelve Red Lines are non-negotiable; the author catches violations. Your training's default reading of
these passages is the reading this work exists to take apart — do not let it surface in a quiet phrase.

## Your packet — `/home/claude/s496/packets/<book>_<N>.json` (`mark_7.json`, `luke_15.json`)
- `book`, `chapter`; `chapter_text_kjv` — the whole chapter of that book (restored-names KJV).
- `cards[]` — every card to rewrite: `id`, `src` / `src_vn`, `src_text_kjv`, `tgt`, `tgt_text_kjv`, `tgt_context_kjv`
  (the verses around the target, so you read it in its place), `old_note` (the shorthand the card carries now — it
  tells you what connection the author had in mind; KEEP that connection, restate it plainly), `author_thread_hint`
  (the old note opened `thread:some-slug |` — that slug was the author's own grouping of these cards; it is NOT a
  live thread and you may not use it as `thread`, but it tells you what the author thought the card was about),
  `threads_on_the_target_verse` (when the target is a verse of another gospel: the live threads anchored on that
  verse or holding a card from it — these are the Matthew threads rebuilt this week, and for a parallel-verse card
  one of them is usually the right home), `map_grade` (`DOCREF` = the old note names a house document; drop that),
  `reversed_pair` (information only; see the batch notes).
- `threads[]` — every existing thread these cards could join: `slug`, `title`, `anchor`, `anchored_in_this_book`,
  `summary_md`, and `members_in_this_chapter` (so you can see what each thread is actually about). Threads anchored
  in this book come first, then threads anchored in other books, then the wide theme threads with no anchor.

The assembler builds the card for you: it sets the whole target verse and the whole Mark or Luke verse on the page in
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
  members against the card. Most scenes of Mark and Luke already have a thread anchored in this book, so nearly
  every card joins one. A thread that exists gets FILLED, never duplicated. Prefer the thread anchored on the card's
  own verse whose subject matches; for a card whose target is the parallel verse in another gospel, the thread
  anchored on that target verse (`threads_on_the_target_verse`) is usually right; use a wide theme thread with no
  anchor only when the card is plainly about that theme and not about its own scene — prefer an anchored thread
  whenever one fits.
- **`flag`** — empty, or one or two sentences: anything you could not settle, a pair that does not seem to belong
  together, an old note whose point you had to change.

## New threads — rare
Only when three or more cards of the chapter share a subject that no thread in `threads[]` covers. Then add an
entry to `new_threads[]`: `slug` (lowercase, hyphens, begins `<book>-<chapter>-` — `mark-7-…`, `luke-15-…`, English book-name fragments
only, not already in `threads[]`), `title` (a plain phrase, not Title Case Of Every Word, sacred names with their
parentheticals), `anchor_start_vn` / `anchor_end_vn` (verses of this chapter), and `summary_md`: 150–400 words in
flowing sentences that quote, each on its own line in stand-alone italics with its citation in parentheses, the
Mark or Luke verse(s) and the target verse(s) that carry the point — copied exactly from the packet's KJV texts — and
walk the reader through the connection. Where the summary shows the older scripture already held what the gospel
says, the author's own opener is *It ain't new* — those words, never "This is not new". Give the cards that slug.

## Batch notes (Mark 1–15 and Luke 1–21) — read these before the packet
- **Two books, one brief.** You draft for the chapters of ONE book named in your task. Mark's orphans sit in chapters 1–15 (none in 16);
  Luke's in 1–19 and 21. Every card's `old_note` once opened `thread:some-slug |`; that prefix is already stripped and sits in
  `author_thread_hint`. None of those slugs is live — do not put one in `thread`. Read it for what the author grouped the card under
  (`lost-sheep-mission-scope`, `shabbat-controversy-heart-shabbat-vs-pharisaic-fence`, `eliyahu-pattern-prophet-martyrdom`,
  `nature-of-god-formed-in-flesh` …) and then find the live thread that holds that subject in `threads[]`.
- **The old notes are the thinnest of the whole block.** Many are one line ("The Lukan parallel.", "The Matthean parallel of the same
  rebuke."). Where the old note is only a label, the point is the pair itself: read both verses in their places and say what the other
  gospel's telling adds to this one — who was listening, what word is different, what the scene is set among. A parallel-verse card is
  never "the same thing again"; it is what this gospel saw that the other did not write.
- **Names read in their Old Testament spellings** in the live text and the packet: Elijah, Isaiah, Jonah, Noah, Zion. The old notes
  write Yochanan, Kefa, Eliyahu, Mosheh, Yechezk'el, Yirmeyahu, Miriam, Natsareth, Zakkay, Yericho, ha-satan — in your prose those are
  **John, Peter, Elijah, Moses, Ezekiel, Jeremiah, Mary, Nazareth, Zacchaeus, Jericho, Satan**. Judas is Judas (Yahudah (Judah) is the
  house and the tribe). Jairus, Bartimaeus, Lazarus, Herod, Herodias, Pilate, Barabbas, Joseph of Arimathea in plain English.
- **Never call Yahusha (Jesus) "the King" in your own prose.** The old notes do it on nearly every card ("the King calls him", "the
  King's feet", "the King names her") — house shorthand. His name, Yahusha (Jesus), every time. The precheck flags "the King".
- **Threads.** Same order as before: (1) the thread anchored on this card's own Mark or Luke verses when its subject matches — most
  scenes have one (`mark-7-the-corban-tradition-voids-the-fifth…`, `mark-2-the-sabbath-was-made-for-man…`, `mark-9-elias-must-first-come…`,
  `mark-15-darkness-at-noon-the-veil-rent-and-the-centurions-confession…`, `luke-9-take-up-thy-cross…`, `luke-13-they-shall-come-from-
  east-and-west…`, `nazareth-scroll-the-acceptable-year…`); (2) for a card whose target is the parallel verse of Matthew, Luke, Mark or
  John, the thread listed in `threads_on_the_target_verse` — the Matthew threads were rebuilt this week and are sound; (3) a new
  `<book>-<ch>-…` thread only when three or more cards of the chapter sit in a scene no live thread covers; (4) a wide theme thread with
  no anchor only when the card is about that theme and not its own scene, and never when an anchored thread fits. One scene is ONE
  thread. A thread that exists gets FILLED, never duplicated.
- **Reversed pairs** (`reversed_pair` non-empty: Mark 6:11, 8:34, 11:25, 14:62; Luke 7:1, 9:5, 12:10, 14:27). The Matthew card that
  points back at this verse is already rewritten and threaded. Write this card anyway, from THIS gospel's side (what Mark or Luke adds to
  Matthew's telling), and join it to the thread the Matthew twin sits in — the slug is in `threads_on_the_target_verse`.
- **DOCREF cards** (5 in Mark, 12 in Luke): the old note names "the framework", "Red Line #7", "FRAMEWORK-MAJOR", "Q14/Q15 … queued
  for S184", "individual-mercy contrast case". Drop every such word; the reader has none of it. Keep the connection, say it plainly.

### Mark
- **Mark 1–3 — the sheep, the Sabbath, the twelve.** *For therefore came I forth* (1:38) and *I came not to call the righteous, but
  sinners* (2:17) beside Matthew 15:24 and Ezekiel 34:11, 34:16, 34:4: the errand is the lost sheep of the house of Yashar'el (Israel);
  Ezekiel's shepherd goes out himself to seek them. The leper sent to the priest (1:40 → Leviticus 14:2): he keeps Moses' commandment
  and tells the man to keep it. **The Sabbath (2:23–3:6).** Deuteronomy 23:25 permits what the disciples did; Exodus 20:8 and
  Deuteronomy 5:12 are the commandment he kept; David at Nob (1 Samuel 21): the hungry man fed. What he clears away is the fence laid
  over the day, never the day — *the sabbath was made for man* (2:27) is not "the sabbath is ended". Never write that he loosened or
  replaced the Sabbath. The twelve (3:14 → Ezekiel 37:15, Revelation 21:12): twelve for twelve tribes; say what Ezekiel's two sticks say
  and what Revelation's twelve gates and foundations say, each in its own words. *Whosoever shall do the will of Elohim (God), the same
  is my brother* (3:35 → Hosea 1:10, Matthew 7:21): doing the Father's will is how the family is KNOWN, not how it is made — the sons of
  the living Elohim (God) of Hosea 1:10 are the ones who were *not my people* and are called sons again; the b2 lesson holds: "known by",
  never "made by" or "not by blood". Blasphemy against the Spirit (3:28 → 1 John 5:16): say what John's *sin unto death* says, nothing
  more.
- **Mark 4 — the sower and hearing.** The seed is one word; the grounds differ. *My sheep hear my voice* (John 10:26–27): hearing reveals
  who was a sheep already; it does not make one. 4:25 → Revelation 13:8: the names written from the foundation — names are blotted out,
  never added (Exodus 32:33); say what Revelation's own verse says. 4:14 → Ezekiel 20:37: the rod and the purging of rebels is the sifting
  of the gathered house — the wheat's own testing after the harvest, not the tares'. 4:17 → Hebrews 6:4, 4:19 → 1 Timothy 6:9: the one
  who received with gladness and did not endure is warned — a real loss, never "he was never saved"; write the warning as the texts give it.
- **Mark 5 — the daughter, the fringe.** Jairus is a ruler of the synagogue, and he fell at his feet. The woman with the issue (5:25 →
  Leviticus 15:25, Numbers 15:38, Jeremiah 23:6): Leviticus made her unclean; she reached for the fringe Numbers commanded him to wear —
  he wore the Torah's own border; *Daughter* (5:34) is his word for her — a daughter of the house. Habakkuk 2:4, Psalm 27:13, Isaiah 7:9
  beside *thy faith hath made thee whole*: faith here is trust walked out, never faith set against the commandments. The demon's *Son of
  the El Elyon (most high God)* (5:7 → James 2:19, Genesis 14:18): the devils say it and tremble; Melek Tsadiq's (Melchizedek's) El Elyon
  (most High) is the same Most High.
- **Mark 6 — John and Elijah, the shepherdless sheep, the sea.** John reproved Herod as Elijah reproved Ahab (6:18 → 1 Kings 21:17); the
  prophet killed for speaking the Torah to power (2 Chronicles 24:20; Matthew 23:35 — Zechariah son of Jehoiada in Chronicles, Berechiah
  in Matthew: hold both open as the b4 cards did). *Sheep not having a shepherd* (6:34 → Numbers 27:17, Ezekiel 34:5, 1 Kings 22:17): Moses
  asked for a shepherd so the people would not be as sheep without one; Ezekiel's shepherds fed themselves; Micaiah saw all Yashar'el
  (Israel) scattered on the hills. The loaves (6:37 → 2 Kings 4:42, Ezekiel 34:14, 34:23): Elisha's twenty loaves; *I will feed them*; *one
  shepherd … my servant David* — say what each verse says. *He would have passed by them* (6:48 → Exodus 33:19, 1 Kings 19:11): the one who
  passed by Moses and by Elijah passes by on the water — he is the one who was seen by the fathers; no "Trinity", no collapse. The dust
  (6:11 → Matthew 10:14, Acts 13:51, John 10:27, Matthew 7:6): the pursuit ends where the refusal lands; the sheep hear; nobody is chased.
  Herod's *John … is risen from the dead* (6:14): a guilty king's fear, said plainly.
- **Mark 7 — the traditions of men and the Syrophenician; carries weight.** 7:3 → Leviticus 22:1: hand-washing before bread is nowhere in
  the Torah — the elders' fence. 7:6 → Isaiah 29:13 he quotes it against them. **7:8 → Deuteronomy 4:2 and 12:32: *thou shalt not add
  thereto, nor diminish from it* — the Torah's own rule against the thing they did**; 7:9 → Exodus 20:12, Deuteronomy 5:16: Corban let a
  son keep from his parents what honour owed them — the tradition voided the fifth commandment; 7:9 → 1 John 2:3–4: whoever says he knows
  him and keeps not his commandments is a liar — that is the test the tradition fails (Yoshi calls it the 1234 of truth; you do not). What
  he is clearing away is what was laid ON the Torah, never the Torah — write nothing that reads as "he set the ceremonial law aside".
  **7:19 *purging all meats*** → Leviticus 11:1 and Acts 10:14: the sentence is about the belly and the draught — what goes in comes out;
  it is not a verdict that unclean animals are clean. Peter, years later, had *never eaten any thing that is common or unclean*; Leviticus
  11 stood for the apostles. Never write "he declared all foods clean". 7:14–23 → Jeremiah 17:9, Deuteronomy 30:6, Ezekiel 36:26, Exodus
  20:13: defilement is from the heart; the list of 7:21–22 runs down the second tablet; the answer the Torah itself gives is the circumcised
  heart and the new heart — Torah written inward, not Torah removed. **7:24–30, the woman of Mark 7:26, *a Greek, a Syrophenician by
  nation*.** Read her as the Canaanite-woman thread (rewritten this week; slug `matthew-15-the-canaanite-woman-the-lost-sheep-first…`) now
  reads Matthew 15:21–28 — join that thread for 5115, 5116, 5117 and write to its reading: she is one of the lost sheep he was sent to
  (Matthew 15:24, said to the disciples), a woman of the scattered house living as a Greek by nation — Lo-Ammi, *not my people* (Hosea
  1:9–10), the dogs are what the divorced house became; *let the children first be filled* (7:27) is the undivorced house of Yahudah (Judah)
  first, while he lived (the divorced wife cannot be taken back while the husband lives, Deuteronomy 24:4, Romans 7:2–4), and the bread
  comes to the dogs after his death, when the scattered are redeemed (Hosea 2:23). Mark 7 does not state the death as the reason — this is
  a reading line on line; write it as one, not as a stated fulfilment. She is seed REVEALED by her hearing, not a stranger let in by faith
  and not the marriage door (Ruth, Rahab). Never "a Gentile woman", never "mercy to an outsider", never "grafted". The thread's old title
  still says "the stranger grafted" — you do not.
- **Mark 8 — the sign, the leaven, the confession, the cross.** The sign of Jonah (8:11 → Matthew 12:38, 16:1, Jonah 1:17): the only sign
  for sign-seekers is three days in the fish. Leaven (8:15 → Exodus 12:15): leaven put out of the house at Passover; the leaven of the
  Pharisees and of Herod is their teaching that spreads — the b2 lesson: leaven here is corruption, do not hedge it. Hardened hearts (8:17
  → Isaiah 6:9, Jeremiah 5:21, Ezekiel 12:2) said of the disciples themselves. Caesarea Philippi (8:27 → Matthew 16:13, Luke 9:18, John 6:69):
  Mark has the confession without the rock and keys; say so. *Get thee behind me, Satan* (8:33 → Mark 7:8, Matthew 16:23): savouring the
  things of men is the same fault as holding the tradition of men. The cross (8:34 → Matthew 10:38, 16:24, Luke 9:23, 14:27): Mark called
  *the people* to hear it with the disciples. 8:34 → Matthew 10:38's old note says "the door home through the curse-system (Galatians
  3:13)": the curse is the exile judgment of Deuteronomy 28, never the Torah — if you keep the thought, keep it that way, and do not cite
  Galatians by number.
- **Mark 9 — the mountain, Elijah come, the passion foretold.** Moses and Elijah on the mountain (9:4 → 2 Kings 2:11, Deuteronomy 34:5): say
  how each left the earth as his verse says. *Elijah is indeed come* (9:13 → 1 Kings 19:2, Malachi 4:5): John is the one Malachi sent before
  the dreadful day, and he was done to as they listed. 9:1 → Daniel 7:14: Daniel's verse gives him the dominion and the kingdom; say that
  and nothing from Revelation. The second foretelling (9:31 → Isaiah 53:8, Zechariah 13:7). *Whosoever shall do the will of my Father*
  (9:37 → Matthew 12:50, John 13:20): receiving a child in his name is receiving him — known by the doing.
- **Mark 10 — one flesh, the children, the hundredfold, Bartimaeus.** 10:6 → Genesis 2:24: *they twain shall be one flesh* — the marriage
  covenant makes two one; that is why a wife is reckoned in her husband's house (Ruth, Rahab); say the verse, not "the framework". The
  children (10:14 → Matthew 18:3, Psalm 131:1): the kingdom received as a gift. The hundredfold (10:28 → Matthew 12:50, Mark 3:35): the
  household gathered around the Father's will. *Many that are first shall be last* (10:31 → Matthew 22:14, 19:30, Luke 13:30): *few are
  chosen* and *they shall come from the east and the west* — the gathered of both houses sit down, not "the Gentiles replace Israel".
  Bartimaeus (10:46 → Jeremiah 23:5, 2 Samuel 7:12, Isaiah 11:1): *thou Son of David* from a blind beggar is the covenant named — the
  righteous Branch, David's seed, the rod of Jesse; 10:52 → John 10:27, Revelation 13:8: he heard because he was a sheep; say Revelation's
  own words about the names and no more.
- **Mark 11–12 — forgiveness, authority, the remnant, the fathers asleep.** 11:25 → Leviticus 19:18, Matthew 6:14: forgiving as you pray is
  the commandment to love the neighbour kept. 11:27 → Matthew 16:13, 21:23: the authority question. **12:1 → Romans 11:5, Isaiah 10:21: the
  remnant is the remnant of Ya'aqov (Jacob) — the election out of Yashar'el (Israel) obtained what the whole did not; never the nations in
  Yashar'el's (Israel's) place.** **12:26 → Exodus 3:6, Daniel 12:2, Hebrews 11:13: *the Elohim (God) of Abraham, and … of Isaac, and … of
  Jacob* — he is not the Elohim (God) of the dead; the fathers died in faith not having received the promises, they sleep in the dust and
  shall awake — the fathers asleep awaiting the first resurrection; Daniel's verse in its own words.** 12:32 → Hosea 6:6, 1 Samuel 15:22,
  Micah 6:6: the scribe who answered discreetly; mercy and obedience above offerings is what the Torah's own prophets said — never "love
  replaced the commandments".
- **Mark 13 — the Olivet discourse; carries weight.** *Many shall come in my name* (13:6 → Matthew 24:5, Luke 21:8, 2 Corinthians 11:4,
  Galatians 1:6): another gospel wears his name; the test of it is whether it keeps his commandments. 13:22 → Deuteronomy 13:1, Revelation
  13:13, 2 Thessalonians 2:9: signs and wonders vouch for nothing — Deuteronomy says the prophet with the sign who leads from the
  commandments is the test; Revelation and Thessalonians each in their own words. 13:24 → Joel 2:10, Isaiah 13:10, 34:4: the day of Yahuah
  (the LORD) darkens the lights. **13:26 → Daniel 7:13, Matthew 24:30, Revelation 1:7, Zechariah 12:10: Mark names him outright — *the Son
  of Adam coming in the clouds*; Daniel's own verse says *one like the Son of Adam* — KEEP Daniel's *like* when you call back to Daniel
  (the old note's "no kaph" is about Mark, not Daniel; do not repeat it in the reader's prose); the one Daniel saw and the one Mark names
  are one; Revelation 1:7 and Zechariah 12:10 each say what they say — *every eye shall see him* and *they shall look upon me whom they
  have pierced* — never Daniel read through Revelation or Revelation through Daniel.** **13:27 → Matthew 13:41, Ezekiel 37:21, Deuteronomy
  30:4: the angels *gather together his elect from the four winds* — this is the gathering of the scattered tribes out of all nations, the
  promise of Deuteronomy 30:4 and Ezekiel 37:21, never a rapture; Matthew 13:41's angels gather out *all things that offend* first — the
  tares out, then the wheat gathered.** 13:32, *neither the Son, but the Father*, sits in this scene: the Son submits to the Father and
  remains Elohim (God) — say both, explain neither away.
- **Mark 14–15 — the cup, the trial, the veil; carries weight.** Bethany (14:3 → 1 Samuel 16:13, Matthew 26:6, John 12:1): the anointing of a
  king's head; he says it was for his burial; John has Mary and his feet — say what each tells. The Passover (14:12 → Exodus 12:1): he
  kept the feast as Moses gave it and is its lamb — the feast filled, not ended. **The cup (14:24, *this is my blood of the new testament,
  which is shed for many*; 14:25 → Revelation 19:9, Isaiah 25:6): the new covenant is the one made with both houses, Torah on the heart
  (Jeremiah 31:31–33); the day he drinks it new is the feast on the mountain — Isaiah's fat things and Revelation's supper of the Lamb each
  in their own words.** Gethsemane (14:36): *Abba, Father … not what I will, but what thou wilt* — the Son submits to the Father; he is
  Elohim (God) and has a Father; say both. **The trial (14:61–62 → John 10:36, Hebrews 1:1, Daniel 7:13, Matthew 26:64, Revelation 1:7):
  *Art thou the Messiah (Christ), the Son of the Blessed?* — *I am*; Hebrews' *express image of his person* and John's *I said, I am the Son
  of Elohim (God)*: the seen one beside the unseen Father; Psalm 110:1's right hand; Daniel 7:13 with Daniel's *like* kept and only Daniel
  7:14 given him; Matthew's twin card is in the Sanhedrin-trial thread — join it.** The high priest heard blasphemy because he understood
  the claim. The veil (15:38) torn, the Sabbath still kept: do not write that the temple or its service was abolished. The centurion
  (15:39 → Matthew 27:54, Luke 23:47, John 19:35) — already drafted; the three cards sit in the Mark 15 darkness-and-veil thread.

### Luke
- **Luke 1–2 — the horn of salvation and the covenant remembered; carries weight.** *He shall go before him in the spirit and power of
  Elijah* (1:17 → Malachi 4:5): John is Malachi's Elijah before the dreadful day. *The throne of his father David … he shall reign over the
  house of Jacob for ever; and of his kingdom there shall be no end* (1:31–33 → 2 Samuel 7:12, Daniel 7:14): the seed promised to David
  whose throne is established for ever; Daniel's everlasting dominion in Daniel's words — the reign is over the house of Jacob, both
  houses gathered, never "a spiritual kingdom in place of Israel". *As he spake to our fathers, to Abraham, and to his seed for ever* (1:55
  → Genesis 17:7): Mary names the everlasting covenant with Abraham's seed — a seed by the fathers' blood; the oath to Abraham is what is
  being kept (1:72–73). **1:67–69 → Isaiah 11:1: *he hath visited and redeemed his people, and hath raised up an horn of salvation for us in
  the house of his servant David* — *his people* are the seed of promise, the rod of Jesse for the twelve tribes (Isaiah 11:11–12 gathers
  the remnant from the four corners); redeemed is redeemed from the exile, not from the Torah.** 2:13 → Revelation 19:1: the heavenly host
  praising Elohim (God) at his birth and the great voice in heaven — Revelation in its own words. (Luke 2:32, *a light to lighten the
  Gentiles, and the glory of thy people Yashar'el (Israel)*, is not an orphan card but it is the chapter's reading: Isaiah 42:6 and 49:6's
  light to the Gentiles is the light to the scattered tribes among the nations — keep the word *Gentiles* where the text has it and read
  it as Isaiah does.)
- **Luke 3 — stones raised up to Abraham.** 3:2 → Isaiah 40:3 Luke quotes it. **3:8 → Matthew 3:9: *begin not to say … We have Abraham to our
  father: for … Elohim (God) is able of these stones to raise up children unto Abraham* — the fruit, not the pedigree, is asked for; the
  children raised from the stones are the scattered house lying dead among the nations and brought back (Ezekiel 37, Hosea 1:10) — never
  "Gentiles made children of Abraham by faith"; join the Matthew 3 thread and write as it reads.**
- **Luke 4 — Nazareth; carries weight.** The devil's offer (4:5 → Matthew 4:8): the kingdoms of this world are his to offer now; the thread
  on the target verse holds it. **4:25–27 → Matthew 15:24: *many widows were in Yashar'el (Israel) … but unto none of them was Elijah sent,
  save unto Sarepta … none of them was cleansed, saving Naaman the Syrian.* The widow of Zarephath and Naaman are seed REVEALED in the lands
  of the scattering — sheep who heard the prophet's word, the Father's choosing shown, not outsiders shown mercy "instead of Israel" and
  not "Gentiles included"; he says it in Nazareth and they rise to kill him because he said the choosing is the Father's. Never
  "individual-mercy case", never "contrast with the seed of promise".** 4:43 → Matthew 15:24: *therefore am I sent* — the lost sheep of the
  house.
- **Luke 5–6 — the leper, the bridegroom, the Sabbath, the twelve.** 5:14 → Matthew 8:4 *as Moses commanded* — he sends the leper to keep the
  Torah. 5:34–36 → Matthew 9:15, 9:17: the bridegroom (Hosea 2:19 is the marriage of Yahuah (the LORD) to the scattered house); the new wine
  and old bottles — never "the new covenant replaces the old law"; say what the figure says: a new thing not forced into a worn vessel; the
  Matthew 9 thread on the target verse reads it; 5:36's old note grouped it with leaven — that was the author's grouping, the verse is
  about wine and bottles; write the verse. 6:1–11 → Mark 2:23, 3:1: the same Sabbath scenes — the fence cleared, the day kept. 6:12 → Matthew
  10:1: twelve chosen after a night in prayer.
- **Luke 7 — the centurion, John and Elijah.** **7:1–9 → Matthew 8:5, 8:10: *I have not found so great faith, no, not in Yashar'el
  (Israel)*: the centurion is seed revealed in a Roman uniform — a man who knew the word's authority and called himself unworthy; the
  thread on the target verse (`matthew-8-many-from-east-and-west…`) still says "Gentile soldier" in its old summary — you do not; never
  "a Gentile's faith shames Israel", never "the believing stranger".** Luke adds the elders of the Yahudim (Jews) sent first and the
  centurion's love for the nation. 7:27–33 → Malachi 3:1, Matthew 11:11, John 10:27, 1 Kings 19:8, 19:10: *my messenger before thy face*;
  John the greatest born of women and least in the kingdom greater; the publicans justified Elohim (God) and the Pharisees rejected the
  counsel — the hearing reveals the sheep; John's fasting and the wilderness as Elijah's.
- **Luke 8–9 — hearing, the twelve baskets, the mountain, the fire.** 8:4–10 → Matthew 13:3, 13:11: the sower and *unto you it is given* —
  hearing reveals. 8:21 → Matthew 12:50 *which hear the word of Elohim (God), and do it* — the family known by the doing. 9:5 → Matthew
  10:14 (twin threaded) the dust on the way out. 9:10 → Matthew 14:13 twelve baskets. 9:18–23 → Matthew 16:13, 16:21, 16:24: Luke's
  *daily*. 9:28–32 → Matthew 17:1, 17:2: *This is my beloved Son: hear him* — the Father's voice over the seen Son; the glory on the mountain
  in Luke's words; 1 Enoch is not in your packet — do not cite it. **9:54 → Matthew 10:14: *wilt thou that we command fire … as Elijah did?* —
  he rebuked them; the answer to a village that will not receive is dust shaken off, not fire called down.**
- **Luke 10–14 — Satan fallen, the sign, leaven, the servant beaten, the Sabbath, the cross.** 10:18 → Daniel 7:25: Daniel's horn wears out
  the saints and changes times and laws — say Daniel's verse; Luke's *Satan as lightning fall* beside it; nothing from Revelation. 11:29 →
  Matthew 12:39 Jonah. 11:27 → Matthew 12:50. 12:1 → Matthew 16:6 *which is hypocrisy* — Luke names the leaven. 12:10 → Matthew 12:31 (twin
  threaded). **12:47 → Matthew 25:14: the servant who knew his lord's will and did not do it is beaten with many stripes — the household's
  servants judged by their works, the post-harvest sifting of the house, never "the lost punished by degree".** 13:20 → Matthew 13:33 leaven
  hid in meal — corruption through the whole (the b2 lesson), the woman hides it. 14:1 → Mark 2:27 the dropsy healed on the Sabbath — *is it
  lawful?* and they held their peace. 14:26–27 → Mark 3:33, Matthew 16:24 (twin threaded): hating father and mother is loving him more; the
  household of Mark 3:35.
- **Luke 15 — the prodigal; carries weight.** **15:18 → Ezekiel 18:21: *I will arise and go to my father* — Ezekiel's wicked man who turns
  from his sins *shall surely live*. The son who went into a far country and came to himself and came home to his father's house is the
  divorced house of Yashar'el (Israel) coming home from the nations — *this my son was dead, and is alive again; he was lost, and is
  found* (15:24) is Hosea's *not my people* called sons again; the elder brother at home is the house that never left. This is the
  author's reading line on line; Luke does not name the houses — write it as a reading, not as a stated fulfilment, and keep Ezekiel's
  verse doing its own work: the turning man lives.**
- **Luke 16–19 — Lazarus, Moses and the prophets, the night, the blind man, Zacchaeus.** 16:14 → Mark 7:13 the covetous Pharisees who
  justify themselves. **16:19 → Matthew 13:24: two men, two deaths, two places — Lazarus carried to Abraham's bosom, the rich man in
  torment, a gulf fixed; Matthew's field has two seeds growing together till the harvest. Say what each text says of the two; do not build
  the compartments of Sheol into the card beyond what Luke's own words give (the bosom, the torment, the gulf).** 16:29 → 2 Peter 3:15:
  *they have Moses and the prophets; let them hear them* — the scriptures the unlearned wrest; Moses and the prophets are the standard,
  never set aside. **17:34 → Matthew 13:24: *the one shall be taken, and the other shall be left* — read with 17:27–29 (the flood took them
  all away; fire and brimstone) and Matthew 13:30 (gather first the tares): the taken are taken by judgment, tares first; never a
  rapture.** 18:9 → Ezekiel 18:21 the publican who smote his breast; 18:31 → Matthew 16:21; 18:35 → Matthew 9:27 *Son of David* from the
  blind man at Jericho; 18:42 → Acts 3:6 *thy faith hath saved thee* and the lame man at the gate — trust walked out. **19:10 → Matthew 10:6:
  *the Son of Adam is come to seek and to save that which was lost* — said at Zacchaeus's table; the lost are the lost sheep of the house of
  Yashar'el (Israel); Zacchaeus is a son of Abraham (19:9) — a publican of the house, not an outsider.**
- **Luke 21 — Jerusalem trodden down; carries weight.** **21:24 → Ezekiel 9:6, Zechariah 13:8, 14:9, Ezekiel 33:6, 33:28: *Jerusalem shall
  be trodden down of the Gentiles, until the times of the Gentiles be fulfilled* — keep the word *Gentiles* as the verse has it; do not
  rename it "nations" and do not settle in the card who they are. What the targets add: Ezekiel 9:6 the slaying begins at the sanctuary and
  spares the marked; Zechariah 13:8 two parts cut off and the third left — a sifting, not an erasure; Zechariah 14:9 Yahuah (the LORD) king
  over all the earth when it is done; Ezekiel 33:6 the watchman who did not warn; Ezekiel 33:28 the land desolate because of the
  abominations. The desolation falls for the abominations and ends at the day — say that and no more; nothing here fixes a date.**

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

## Output — one file, `/home/claude/s496/out/<book>_<N>_draft.json` (`mark_7_draft.json`), written with Python
```
{"model": "<your model name, exactly>", "book": "<mark|luke>", "chapter": <N>,
 "cards": [{"id": 2525, "prose": "...", "member_phrase": "WHOLE", "member_sentence": "...", "thread": "<slug>", "flag": ""}],
 "new_threads": [{"slug": "...", "title": "...", "summary_md": "...", "anchor_start_vn": 11, "anchor_end_vn": 17}]}
```
`json.dump(..., ensure_ascii=False, indent=1)`. Every card id of the packet appears exactly once. Before you
finish, run `python3 /home/claude/s496/tools/precheck496.py <N> <book>` (e.g. `precheck496.py 7 mark`) and fix everything it reports, then re-run until
it prints PASS. Write nothing else to disk outside `/home/claude/s496/out/`. Report: cards done, threads used
(count per slug), new threads, flags.
