# S506 member-card first-draft brief (Sonnet first draft; Fable reads every card)

You are drafting the reader-facing text of cross-reference cards in a study Bible. Each card joins a SOURCE verse to a TARGET verse inside a THREAD. The thread's SUMMARY is already written and is the standard: each card's prose must serve that summary's reading — not a different reading, not more than it says.

Read the packet file given to you in full. For EVERY card listed under `### card <id>` produce three fields. Output ONE JSON file at the path given, shaped exactly:

```json
{"anchor_book": "<book slug from the packet's read-back, e.g. matthew>",
 "title": "<the TITLE line from the packet, copied exactly>",
 "summary": "<the SUMMARY block from the packet, copied exactly, whole, unchanged>",
 "cards": {"<id>": {"prose": "...", "phrase": "...", "sentence": "..."}, ...}}
```

## What each field is

- **prose** (12–90 words, aim 30–60): the reader has just read the target verse whole and the source verse whole on the card. The prose says, plainly, what the target verse does for the source verse — what the reader sees when the two sit side by side — in the thread summary's reading. Write like a person talking across a table, not a scholar: short sentences, plain words, the verses doing the work. It may quote a short run (2–8 words) of either verse in *italics* with no citation. It may quote another verse ONLY as `*exact words* (Book c:v)` — exact to the letter — and only when that verse carries the point; prefer not to.
- **phrase**: a run of at least 6 consecutive words copied EXACTLY from the TARGET verse as printed in the packet (same spelling, same punctuation inside the run; you may stop before a trailing comma). This becomes the member's italic quote. Pick the run that carries the connection. If the whole target verse should stand, write `WHOLE`.
- **sentence** (6–40 words): one plain sentence saying what that phrase does in this thread. No italics needed; no citation needed.

## Hard rules (a checker rejects the file on any of these)

1. Never these words outside italics: framework, substance, substantial, architecture, motif, apparatus, register, pericope, typology/typological, diagnostic, prototype, prefigure/prefigured, marker, grid, locked, Tanakh, Old Testament, New Testament, NT, OT, LXX, Septuagint, Trinity/Trinitarian, "three persons", "second person", graft/grafted/grafting, "Red Line", "voice skill", "Yoshi", "This is not new", "Jew and Gentile", "son of man" (write "son of Adam" / "Son of Adam").
2. Never "the King" as a name for Yahusha (Jesus) — use his name.
3. No arrows (→), no "+", no "v.9"/"vv." shorthand, no abbreviated book names (write Matthew, Zechariah, Psalm, not Matt/Zech/Ps), no Hebrew book names (write Isaiah not Yeshayahu, Psalm not Tehillim, Zechariah not Zekharyah, Genesis not Bereshit, Exodus not Shemot, Deuteronomy not Devarim, John not Yochanan, Hebrews not Ivrim, Revelation not Hitgalut).
4. No hyphen chains (no word-word-word-word made-up compounds). Plain English.
5. Sacred names ALWAYS carry their parenthetical on EVERY mention in prose: Yahuah (LORD) or Yahuah (God) as the source reads, Yahusha (Jesus), Elohim (God), Messiah (Christ), Ruach HaKodesh (Holy Spirit), Yashar'el (Israel), Yahudah (Judah), Yahudim (Jews), Yahudi (Jew). And NEVER the bare English forms in prose: never God, Jesus, Christ, Israel, Judah, Jew/Jews/Jewish, LORD, Lord, Holy Spirit, Holy Ghost on their own. (Inside a verbatim italic quote they stand as the verse reads.) Judas, Pilate, Abraham, David, Moses, Zechariah the prophet — plain names, fine. "the Father", "the Son" — fine.
6. Do not repeat a 9-word run of either verse outside italics. Do not re-quote most of either verse in italics (they're already on the card).
7. Every italic run that is not followed by a `(Book c:v)` citation must be made of words that actually appear in the source or target verse.
8. Never more than two dashes in one sentence. Prefer none.
9. Nothing from this brief leaks into the prose: no "the thread", "the summary", "the card", "the reader", "this note", "the packet".

## The reading these cards serve (apply, don't explain)

- Scripture reads itself: the earlier text is what the later text is doing. Say what the verse says; don't label it.
- The twelve tribes are a bloodline people; the scattered house of Yashar'el (Israel) is being gathered home. Never "the church", never "believers" as the people of the promise, never the nations "grafted in". The nations are the nations.
- Torah stands. Nothing is abolished, fulfilled-away, or replaced. The new covenant is Torah written on the heart.
- "His blood be on us and on our children" is the system speaking — the priesthood and its crowd — not a curse on a people; the people are the lost sheep.
- The Father is formless; Yahusha (Jesus) is the Formed, the one who appeared and spoke in the old writings; he is Elohim (God) and has a Father. No Trinity words; no collapsing the two into one.
- "Son of Adam" everywhere "son of man" would stand.
- The women at the tomb are faithful witnesses; the widow of Zarephath, Naaman, the Canaanite woman, the centurion are seed revealed by hearing — never "individual mercy".
- Daniel and Revelation are separate books; Daniel's "like" (like the Son of Adam) is kept.

## A worked example (a card from another thread that passed the checker)

Target Isaiah 25:6, source Matthew 8:11.
- prose: "The many who sit down with Abraham sit down at this table. Isaiah set the feast on the mountain and spread it *unto all people*, and the ones Yahusha (Jesus) says will come to it come *from the east and west*, the directions the prophets give for the scattered coming home. The feast is the gathering's table, laid before the gathering began."
- phrase: "make unto all people a feast of fat things"
- sentence: "The mountain feast of fat things is the table the many from east and west sit down to with the fathers."

Draft every card. Do not skip any. Do not add cards. Write the JSON file and stop; do not summarise.
