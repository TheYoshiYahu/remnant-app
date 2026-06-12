# MINION BRIEF — THE APOCRYPHA full-library cross-references ("It Ain't New")

You are building the **Come-and-See cross-reference apparatus** for one chapter of a book of **the
Apocrypha** (the KJV 1611 deuterocanon) in Yoshi's Remnant Bible. Output is a single JSON file
(schema below). Author from THIS brief.

## THE POSTURE — Come and See (non-negotiable)
- The Apocrypha books are **already heavily cited AS TARGETS** throughout the live apparatus (the NT
  packs lean on Wisdom of Solomon for Romans 1's idolatry and the suffering-righteous; 2 Maccabees 7
  and 2 Esdras for resurrection; Tobit 13 for the New Jerusalem; Sirach for James/the Sermon). Now you
  anchor **FROM** these books — the source is the apocryphal verse, weaving out to the Tanakh + NT +
  the other restored extra-canon (1 Enoch, Jubilees, Jasher — all now LIVE). "It ain't new": the
  deuterocanon carries the same covenant witness.
- **Quote, don't cite.** Every target verse quoted in full italics (`*...*`) with (Book ch:v) at the END.
- **Quote VERBATIM** from the dumped verse text. The fidelity gate FAILS paraphrases.
- No appendix posture; unfold it in prose.

## SACRED NAMES — already restored in the source, WITH ONE CRITICAL EXCEPTION
The parsed editions carry restored names (`Yahuah`, `Elohim`, `Yashar'el`, etc.) — copy quoted text
EXACTLY as given. **⚠️ "JESUS" IN THE APOCRYPHA IS NOT THE MESSIAH.** Every "Jesus" in the Apocrypha is
**Yeshua / Yehoshua (Joshua)** — e.g. Yeshua ben Sira (the author of Sirach/Ecclesiasticus), or Joshua
son of Nun/Josedech. The apocrypha parse does NOT restore "Jesus"→"Yahusha", and you must NOT either.
Treat any "Jesus" here as Joshua/Yeshua-ben-Sira; do NOT cross-link it to Yahusha the Messiah. **Book
names stay conventional English** in citations. Thread slugs use English book fragments only.

## THE FRAMEWORK (apply to every weave)
1. **THE BOOKS ARE LIBRARY-LEVEL** (bidirectional with the canon). The deuterocanon illuminates and is
   illuminated by Tanakh + NT. Weave the strongest genuine parallels.
2. **THE SUFFERING RIGHTEOUS → THE PASSION.** Wisdom of Solomon 2:12-20 (the ungodly lie in wait for the
   just man, who *calleth himself the child of Yahuah*, *if the just man be the son of Elohim he will
   help him*, condemn him to a shameful death) is a stunning Passion parallel → Matthew 27:41-43, Psalm
   22:7-8, Isaiah 53. Susanna (the righteous falsely accused, delivered) is a sibling. Bind heavily.
3. **WISDOM = THE LOGOS.** Wisdom of Solomon 7:22-8:1 (wisdom the *breath of the power of Elohim*, the
   *brightness of the everlasting light*, *the unspotted mirror*, ordering all things) and Sirach 24
   (wisdom *came out of the mouth of the Most High*, *in Jacob be thine inheritance*) and Baruch 3:9-4:4
   (wisdom = the *book of the commandments*, the law that endureth) → John 1:1-14, Hebrews 1:1-3,
   Colossians 1:15-17, Proverbs 8. The Formed Wisdom by whom all was made.
4. **RESURRECTION + THE WORLD TO COME.** 2 Maccabees 7 (the seven brothers + the mother, *the King of
   the world shall raise us up... unto everlasting life*) → Hebrews 11:35, Daniel 12:2, Revelation 20.
   Wisdom of Solomon 3:1-9 (*the souls of the righteous are in the hand of Elohim*) → Rev 6:9/14:13.
   2 Esdras (4 Ezra) — the eagle vision, the man from the sea, the New Jerusalem → Daniel 7, Revelation
   (already cross-linked in the live Revelation pack — self-link where genuine).
5. **THE FEASTS / THE GATHERING / THE NEW JERUSALEM.** Tobit 13 + Baruch 5 (the jeweled, regathered
   Jerusalem, *thy gates of sapphire and emerald*, the children gathered from east and west) → Revelation
   21, Isaiah 54/60, the two-house gathering (Ezek 37) — NOT a church replacing Israel. The Maccabean
   rededication/keeping the feast (1 Macc 4, 2 Macc 10) → John 10:22; the desolation/abomination (1 Macc
   1, 2 Macc 6) → Daniel 9/11, Matthew 24:15.
6. **TORAH STANDS; election; the seed kept.** The martyrs die rather than eat swine / break the covenant
   (2 Macc 6-7, 1 Macc) — Torah-faithfulness unto death; never law-as-curse. Angels: Tobit 12 (Raphael,
   *one of the seven holy angels*, presents the prayers, refuses worship) → Luke 1:19, Revelation 8:2-4.
   Almsgiving/wisdom-ethics (Tobit 4, Sirach) → the Sermon on the Mount, James.

## TARGET LIBRARIES — weave all three
Weigh **Tanakh**, **NT**, and **parallel extra-canon** (the now-live `apocrypha`/`enoch`/`jubilees`/
`jasher` editions for self-links — e.g. Sirach↔Wisdom, Tobit 13↔Rev↔1 Enoch's New-Jerusalem, 2 Esdras↔
Revelation). Do NOT force a weave with no real parallel. Edition & DB book slugs (this `apocrypha` edition):
`the-wisdom-of-solomon`, `ecclesiasticus`, `1-esdras`, `2-esdras`, `tobit`, `judith`,
`the-rest-of-esther`, `baruch-with-the-letter-of-jeremiah`, `the-song-of-the-three-holy-children`,
`the-history-of-susanna`, `bel-and-the-dragon`, `the-prayer-of-manasseh`, `1-maccabees`, `2-maccabees`.
(Do NOT target the `pseudepigrapha`-charles-vol2 edition — corrupted, under repair.)

## JSON SCHEMA — write exactly this shape to the output file
```json
{
  "edition": "apocrypha", "book": "<book-slug>", "chapter": <N>,
  "session": "session253", "tag": "<tag><NN>", "base_band": <BAND>,
  "threads": [
    {
      "slug": "<book-english>-<N>-<short-weave>",
      "title": "<concise title>",
      "summary_md": "<Come-and-See prose: open with the apocryphal passage quoted in full italics, then weave the Tanakh/NT/extra-canon parallels each quoted in full italics with (Book ch:v). Carry the framework.>",
      "anchor_start_v": <int>, "anchor_end_v": <int>,
      "tier": "extras",
      "members": [
        {"src_ch": <N>, "src_v": <int>,
         "tgt_edition": "canon", "tgt_book": "matthew", "tgt_ch": 27, "tgt_v": 43,
         "tier": "free",
         "note": "Matthew 27:43 — *<verbatim target verse>* <one sentence tying it to <book> <N>:<v>>."}
      ]
    }
  ]
}
```

### Authoring rules
- **src is ALWAYS your assigned book + chapter** (`src_ch` = N, `src_v` = a real verse — VERIFY it exists
  in the dump; the parse may merge/skip/blob verse numbers like the others did. List the present
  separate-record verse numbers and use ONLY those; never invent. Keep parentheses balanced in quotes.)
- **tier:** member `"free"` if `tgt_edition` is `canon`, else `"extras"`. Thread tier always `"extras"`.
- **member note:** `Book ch:v — ` + the target verse in full italics + one sentence connecting it. Quote VERBATIM.
- **3–7 threads** per chapter (fewer for thin/genealogical chapters; no padding). **2–5 members per thread.**
- If a chapter is garbled/duplicated, write `"threads": []` + `"_blocked": true` + `"_blocked_reason"`, return 0.

When done, WRITE your JSON to the path you are given, then return the manifest.
