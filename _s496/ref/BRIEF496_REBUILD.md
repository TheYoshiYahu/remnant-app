# S496 — the Matthew card rebuild, batch 4 (Matthew 20–24) — brief for every drafting agent

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

## Batch 4 notes (Matthew 20–24) — read these before the packet
- **Names read in their Old Testament spellings** in the live text and in the packet: Elijah (not Elias), Isaiah (not Esaias), Jonah (not
  Jonas), Noah (not Noe), Zion (not Sion). Use those spellings in your prose; never the Greek-form ones.
- **Never call Yahusha (Jesus) "the King" in your own prose.** The old notes do it constantly ("the King's cup", "the King walked the
  Tsitsit") — that is house shorthand, not how the cards speak. Use his name, Yahusha (Jesus), every time. Where a quoted verse says
  *King* (Zechariah 9:9, Zephaniah 3:15) the verse says it; you do not.
- **Threads.** `threads[]` now also offers a few threads anchored in another book (`anchored_in_another_book: true`, with a sample of
  their members) — Mark's and Luke's telling of the same scene, the Psalm or prophet the scene quotes. Order of preference: (1) the
  thread anchored on this card's own Matthew verses when its subject matches; (2) a new `matthew-<ch>-…` thread when three or more
  cards of the chapter sit in a scene no Matthew thread covers — this batch has several such scenes, named below; (3) a thread
  anchored in another book only when the card's target IS that book's parallel verse (Matthew 24:36 → Mark 13:32 joins the Mark 13:32
  thread) or the card is plainly about exactly that thread's subject; (4) a wide theme thread with no anchor only when the card is
  about that theme and not about its own scene. A thread that exists gets FILLED, never duplicated.
- **Cards whose old note plainly meant 1 John** but whose target is the gospel of John (Matthew 21:28 → John 2:3 "the 1234 of
  Truth"; 22:40 → John 4:7 and John 5:2 "love of Elohim and the brother", "keep his commandments"; 24:9 → John 2:18 "many
  antichrists"): the pair is what it is. Write the card honestly to the John verse that is actually on the page (Cana, the woman at
  the well, Bethesda, the temple sign) in a way that still belongs beside the Matthew verse, and say in `flag` that the note meant
  1 John. Do not re-point.
- **Chapter 20.** The labourers in the vineyard: the vineyard is the house of Yashar'el (Israel) (Isaiah 5), the hire is the
  master's to give, *the last shall be first* — do not turn the late-hired into "the Gentiles" or "the church"; both houses are his
  own hired. *Many be called, but few chosen* (20:16) with Isaiah 6:9: hearing reveals who the sheep already were; it does not make
  them sheep — never "whoever responds becomes chosen". The third passion foretelling (20:17–19, 7 cards): no Matthew thread covers
  it — a new thread `matthew-20-…` is right. The cup (20:22–23) is the Father's cup of wrath (Psalm 75:8, Isaiah 51:17, Jeremiah
  25:15) that he drinks; the sons of Zebedee ask for thrones and are offered the cup. *Not mine to give, but… of my Father* — he is
  Elohim (God) and he has a Father; say both, collapse neither. The ransom for many (20:28): the many are the seed of promise, both
  houses (Isaiah 53:10–11); *the princes of this world* beside Daniel 10 — the princes over Persia and Greece are the rulers he
  contrasts with, say that plainly without a lecture. The blind men's *Son of David* is the covenant confession (2 Samuel 7,
  Isaiah 11, Jeremiah 23, Ezekiel 34, 37): the shepherd king over the restored twelve tribes.
- **Chapter 21.** The entry: Zechariah 9:9's king comes lowly to the daughter of Zion; Psalm 118:25–26 is what the crowd sings.
  The temple: *My house shall be called an house of prayer for all people* (Isaiah 56:7) — Isaiah 56:8 says who: *the outcasts of
  Yashar'el (Israel)… others… beside those that are gathered*; the house is for the gathered of both houses, never a prooftext for
  the nations being added. *Den of thieves* is Jeremiah 7:11 against the house that trusted the building while breaking the
  commandments. The blind and lame healed in the temple (21:14) against 2 Samuel 5:8's exclusion: the ones the rulers kept out, he
  heals inside. Psalm 8:2 and 8:4: *the son of Adam* (never son of man). The fig tree (21:18–22): the tree with leaves and no fruit is
  the house as it stood (Jeremiah 8:13, Hosea 9:10, Micah 7:1) — the judgment is on fruitlessness, not on the people's existence.
  *By what authority* (21:23–27, 4 cards): no thread covers it — new thread `matthew-21-…`; John's baptism and the Father's voice are
  the credential (Deuteronomy 18:15). The two sons: doing, not saying (Matthew 7:21, Ezekiel 33:31, James 1:22). The wicked
  husbandmen (21:33–46): the vineyard is Yashar'el (Israel) (Isaiah 5:1–7, Psalm 80), the husbandmen are the rulers, the prophets
  slain are named in the targets. **21:43, *the kingdom… given to a nation bringing forth the fruits thereof*:** the nation is the
  gathered twelve tribes under the new covenant — Lo-Ammi made Ammi (Hosea 1:9–10, 2:23), the two sticks one (Ezekiel 37), the new
  heart (Ezekiel 36:26), *an holy nation* (1 Peter 2:9), the 144,000 of the tribes (Revelation 7:4) — the targets already say so.
  Never "the kingdom passed from Israel to the church" or "to the Gentiles". The stone (Psalm 118:22, Isaiah 28:16, 8:14): Daniel
  2:34/44 cards say what Daniel's stone does in Daniel — a kingdom that breaks the kingdoms — and stop there; no Revelation reading
  of Daniel. Isaiah 60:12 (21:44): the nation that will not serve perishes — say it plainly.
- **Chapter 22.** The wedding feast: the bidden who would not come and killed the servants are the rulers who killed the prophets
  (22:6–7 with 23:37, Jeremiah 7); *their city* burned is Jerusalem's judgment; those gathered from the highways, *bad and good*,
  are the scattered and the poor of the land brought in — not "the Gentiles replacing Israel". The garment is the righteousness
  the guest must wear (Isaiah 61:10, Zechariah 3:3–4, Revelation 19:8 *the righteousness of saints*) — works are tested at the
  feast; *many are called, but few are chosen* with Isaiah 6:9 as in chapter 20. Caesar's coin: the image on man is Elohim's
  (God's) (Genesis 1:26) — render that. The Sadducees: *Elohim (God) is not the Elohim (God) of the dead, but of the living* — he
  draws the resurrection out of Exodus 3:6 (the method is inference, line upon line; say he reasons it from the text). The angels
  of 22:30 beside Genesis 6:1 and Jude 6: the resurrected do not marry; the angels who took wives sinned — hold that contrast, do
  not say angels cannot marry. The great commandment: Deuteronomy 6:4–5 and Leviticus 19:18 — *on these two commandments hang all
  the law and the prophets* means the Torah hangs on them, not that love replaces the Torah (Romans 13:8–10, Galatians 5:14,
  James 2:8 say the same). *David's Lord* (Psalm 110:1): the one David calls *my Lord* sits at Yahuah's (the LORD's) right hand —
  the Formed beside the Formless; he is Elohim (God) and has a Father. Daniel 7:13: *like the Son of Adam* — keep the *like*.
- **Chapter 23 — carries weight; write every card with care.** *The scribes and the Pharisees sit in Moses' seat: all therefore
  whatsoever they bid you observe, that observe and do; but do not ye after their works* — what is read from the seat is Moses;
  the Torah they read stands; their works and the burdens laid on top of it are the fault. Phylacteries and borders (23:5 with
  Exodus 13:9,16, Numbers 15:38, Deuteronomy 22:12): the commandment stands — he wore the border himself (Matthew 9:20, 14:36);
  what he strikes is the enlarging to be seen. *Call no man your father… one is your Father* (Isaiah 63:16, 64:8, Deuteronomy
  32:6) — not an anti-clergy slogan; the Father alone is Father. The proselyte made *twofold more the child of hell* (23:15) beside
  Galatians 1:6, 3:1, Acts 15:1–10: the same gospel of flesh credentials — be circumcised, be made one of us, and you are in — that
  the agitators carried to Galatia; the yoke *neither our fathers nor we were able to bear* is that system, never the Torah. Say
  it as the texts show it; do not write "Judaizer". Swearing (23:16–22): Leviticus 19:12, Numbers 30:2, Deuteronomy 23:21 stand;
  the oath by gold and gift is the dodge. Tithe of mint (23:23): *these ought ye to have done, and not to leave the other undone*
  — the tithe stands AND judgment, mercy, faith (Micah 6:8, Hosea 6:6); never "mercy instead of the commandment". Whited
  sepulchres: Numbers 19:11 is the real uncleanness they hid under paint; Ezekiel 13:10's untempered mortar. *Generation of vipers*,
  *your father the devil* (23:33 with Genesis 3:15, John 8:44): the seed of the serpent surfacing among the rulers — sons of
  Belial inside the covenant people — never "the Jews" as a people; the people are the sheep these men devoured. The blood from
  Abel to Zechariah (Genesis 4:8, 2 Chronicles 24:20): the measure filling (Genesis 15:16, Deuteronomy 32:34, 1 Thessalonians
  2:14–16). *O Jerusalem… as a hen gathereth her chickens* (Deuteronomy 32:11, Ruth 2:12, Isaiah 31:5): he is the one who spread
  his wings over them of old. *Your house is left unto you desolate* (Jeremiah 12:7, 22:5): the house — temple and rule — not the
  people's existence. *Ye shall not see me henceforth, till ye shall say, Blessed is he that cometh in the name of Yahuah (the
  LORD)* (Psalm 118:26): Yahudah (Judah) sees him again when they say it — Zechariah 12:10 *they shall look upon me whom they have
  pierced*, the third brought through the fire (Zechariah 13:8–9), *and so all Yashar'el (Israel) shall be saved* (Romans 11:26).
  The hen thread (anchored 23:29–39) exists: fill it for 23:29–39. The map's `seat-of-moses-*` slugs are one scene (23:1–12): the
  `the-pride-and-religious-status…` thread is anchored there and thin — fill it, or make ONE new thread for 23:1–12 if you judge
  the Torah-source cards (tefillin, tsitsit, our Father) need their own; not four.
- **Chapter 24 — carries the most weight; Fable reads every card.** Rules first: **Daniel and Revelation are separate books.**
  Matthew 24:15 itself says *spoken of by Daniel the prophet*, so the Daniel 9:27 and 12:1 cards stand on Matthew's own citation —
  write what Daniel's verse says. The Revelation cards (6:12, 8:12, 1:7, 14:14, 19:11, 7:1, 14:1, 11:1, 13:5, 3:3, 16:15, 19:17):
  write what the Revelation verse itself says beside the Matthew verse. Never read Daniel's figures through Revelation's or
  Revelation's through Daniel's; never "Daniel's beast is Revelation's beast"; never place one book's timeline inside the other.
  **24:31, *gather together his elect from the four winds*:** this is the gathering of the scattered twelve tribes home — the
  targets say it (Deuteronomy 30:4, Isaiah 11:11–12, 27:13, 43:5, 56:8, Jeremiah 31:8, Ezekiel 37:21), the great trumpet of the
  feast (Leviticus 23:23–24, Numbers 29:1). It is NOT a rapture, not being taken to heaven. The 1 Thessalonians 4:13 card: write it on
  the hope for them that sleep and the dead in Messiah (Christ) rising at his coming — do not equate 24:31 with being *caught
  up*; the 1 Corinthians 15:51 card: *changed* at the last trump — the resurrection at his coming; say that and no more. Revelation
  7:1 and 14:1: the sealed of the tribes of Yashar'el (Israel), by name. **24:40–41, *one shall be taken, and the other left*:**
  read it with 24:39 — in Noah's day the flood *took them all away*; the ones taken were taken by judgment. Beside Matthew 13:30
  and 13:41 the order is the text's: the tares are gathered out and burned FIRST, then the wheat is gathered. Never write it as
  the righteous taken up and the wicked left. **24:36, *of that day and hour knoweth no man… but my Father only*:** the Son
  submits to the Father; he is Elohim (God) and has a Father — do not explain it away ("in his humanity"), do not collapse the
  two. Psalm 110:1 beside it: the one at the right hand waits on the Father. **24:29–30:** the sun darkened, the moon not giving
  light — Isaiah 13:10, 34:4, Joel 2:10, 2:31, 3:15, Ezekiel 32:7, Amos 8:9, Zephaniah 1:14 all name the day of Yahuah (the LORD);
  *the Son of Adam coming in the clouds* — Daniel 7:13 *like the Son of Adam* (keep the *like*); Psalm 104:3, Isaiah 19:1, Nahum
  1:3: the cloud rider is Yahuah (the LORD) himself, and the one coming is he. Zechariah 12:10: they look on him whom they
  pierced. The signs-of-the-end and the four-winds threads are anchored on 24:10–31 and 24:27–31 — fill them for 24:29–31. **The
  temple (24:1–2, Jeremiah 7, 26, Micah 3:12, Matthew 23:38, Luke 19:41)** and **the beginning of sorrows (24:4–14)** and **the
  abomination (24:15–22)** and **false christs, the lightning, the eagles (24:23–28)** and **heaven and earth pass, my words
  shall not (24:32–35, Isaiah 40:8, 51:6, Psalm 102:25–26, Matthew 5:18)** and **the day and hour, the thief, watch (24:36–44)**
  have no Matthew thread: new threads `matthew-24-…` are right for these — the map's three `day-and-hour` sub-slugs are ONE
  thread. 24:9 → Matthew 7:23 *ye that work iniquity*: iniquity there is lawlessness, Torah set aside — the
  `lord-lord-and-torahlessness` thread exists for exactly that; 24:12 *iniquity shall abound* is the same word. 24:9 → Isaiah
  60:1–3, 66:18–19: *the Gentiles shall come to thy light* and *those that escape… unto the nations* are the scattered coming home
  to Zion and the proclamation going out to where they are — keep "Gentiles" where the verse has it; never "the nations converted".
  24:14 *this gospel of the kingdom shall be preached in all the world*: the kingdom proclaimed broadly, the sheep hear where they
  are. 24:5, 24:23–26 the false christs: the counterfeit comes in his name; name no modern figure. 24:28 *wheresoever the carcase
  is, there will the eagles be* with Job 39:30, Hosea 8:1, Isaiah 56:9, Revelation 19:17: judgment gathers the birds to the
  slain — say what the verses show. Deuteronomy 13:1–3 (24:23–24): the false prophet with signs is tested by whether he draws
  away from Yahuah's (the LORD's) commandments. 24:32–34 the fig tree: leaves, then summer near — do not date it, do not make it
  a modern state; *this generation* stays the text's words. 24:37–39 Noah with Genesis 6:1, 7:1, 2 Peter 2:5, 3:3–10: the world
  that then was, the sons of Elohim (God) who took wives — the Noah thread is anchored 24:37–39; fill it. 24:42–44 the thief:
  1 Thessalonians 5:1–4, 2 Peter 3:10, Revelation 3:3, 16:15 — watch; the day comes as a thief on those not watching. 24:45–51
  the faithful and wise servant: the thread exists at 24:45–51; fill it; Matthew 25:14 (the talents) is the next scene's same
  stewardship.
- **Chapter 24 is 92 cards.** Take it in two passes if you must (24:1–31, then 24:32–51), but one draft file. Run precheck after
  each pass.

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
