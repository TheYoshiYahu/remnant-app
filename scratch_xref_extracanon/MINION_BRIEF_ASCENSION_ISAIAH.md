# MINION BRIEF — THE ASCENSION OF ISAIAH full-library cross-references ("It Ain't New")

You are building the **Come-and-See cross-reference apparatus** for ONE chapter of **the Ascension of
Isaiah** (the `ascension-isaiah` edition) in Yoshi's Remnant Bible. Output is a single JSON file (schema
below). Author from THIS brief. This book has TWO movements: (1) the **Martyrdom of Isaiah** (ch1-5 — the
apostasy under Manasseh, Beliar/Belkira, Isaiah *sawn asunder* with a wood saw) and (2) the **Vision of
Isaiah** (ch6-11 — Isaiah carried up through the seven heavens, beholding the descent and ascent of **the
Beloved**). It is the richest Christological text among the restored books — handle the Christology with
Yoshi's exact frame below.

## THE POSTURE — Come and See (non-negotiable)
- Anchor **FROM** the Ascension verse, weaving OUT to the Tanakh + NT (canon) + the now-live extra-canon
  (`enoch`/`jubilees`/`jasher`/`apocrypha` + `adam-eve-conflict`). "It ain't new": the descent of the
  Beloved, the martyr-prophet, the seven heavens, the seed-war — all already in Moses and the Prophets.
- **Quote, don't cite.** Every target verse in full italics (`*...*`) with (Book ch:v) at the END.
- **Quote VERBATIM** from the dumped verse text — run `python3 dump_canon.py ascension-isaiah <CH> ascension-isaiah`
  to copy source AND `python3 dump_canon.py <book> <ch>` (canon) or `... <ch> <edition>` for targets.
  The fidelity gate FAILS paraphrases. Keep parentheses balanced inside quotes.

## SACRED NAMES — already restored in the source; copy quoted text EXACTLY
The source carries restored names. **In THIS book "the Beloved" / "the Lord" / "the Lord Christ" of the
Vision IS the Messiah — Yahusha the Formed Son.** Unlike the Apocrypha (where "Jesus"=Joshua), the
Ascension's Vision is genuinely Messianic — weave it to Yahusha honestly. Thread slugs use English only.

## THE FRAMEWORK — Yoshi's lens (apply to every weave)
1. **THE FORMED SON, ORDERED UNDER THE FATHER (the load-bearing guard).** The Beloved descends from "the
   seventh heaven" at the Father's command, is *sent*, transforms his likeness through each heaven, is born,
   crucified, rises, ascends and re-takes his place. Frame this as the **Formed Son** — begotten/sent, who
   HAS a Father and is subordinate-in-order to Him — NOT trinitarian co-equal persons, NOT modalism (the
   Father and the Beloved are distinct), NOT a created angel and NOT a mere man. Weave: John 1:1-14 (the
   Word made flesh), Philippians 2:6-11 (made himself of no reputation, took the form of a servant, wherefore
   Elohim hath highly exalted him), Hebrews 1:1-6, Hebrews 2:9-14, Ephesians 4:9-10 (he descended... ascended
   far above all heavens), 1 Timothy 3:16 (manifest in the flesh... received up into glory), John 17:5 (the
   glory I had with thee before the world was), Proverbs 30:4. The "transformation" through the heavens so the
   angels did not know him → 1 Cor 2:8 (had they known, they would not have crucified the Lord of glory),
   2 Cor 8:9, Isaiah 53:2-3 (no form nor comeliness... despised).
2. **THE VIRGIN BIRTH + THE CHILD.** Ch11's nativity (Mary, the child appearing, Bethlehem) → Isaiah 7:14
   (a virgin shall conceive), Isaiah 9:6, Micah 5:2, Matthew 1:18-25, Luke 2 — "it ain't new."
3. **THE MARTYR-PROPHET / THE SUFFERING RIGHTEOUS.** Isaiah sawn asunder (ch5) → Hebrews 11:37 (*they were
   sawn asunder*), Matthew 23:31-37 (you slay the prophets), Acts 7:52, Revelation 6:9-11, 11:7. The
   apostate king + the false prophet Belkira/Beliar → the seed-war (Gen 3:15), the man of sin (2 Thess 2),
   the beast (Rev 13). Beliar/Sammael = ha-satan; tie to 1 Enoch's Watchers and the adam-eve seed-war where genuine.
4. **THE SEVEN HEAVENS / THE THRONE / THE ASCENT.** Isaiah carried up, the angel guide, the thrones and
   crowns laid up, the Great Glory whom none can behold → 2 Corinthians 12:2-4 (caught up to the third
   heaven), Revelation 4-5 (the throne, the worship), Ezekiel 1, Daniel 7:9-10, 1 Enoch 14/71 (Enoch before
   the throne — self-link), Exodus 33:20 (no man see me and live). The robes/crowns/thrones of the righteous
   → Revelation 3:5, 4:4, 6:11, 2 Timothy 4:8, Colossians 1:5.
5. **WORSHIP OF THE ONE, AND OF THE BELOVED + SPIRIT AT THE FATHER'S COMMAND.** Where the heavens worship,
   keep the order: glory ascends to the Great Glory/Most High (the Father); the Beloved and the angel of the
   Spirit worship Him and are then worshipped at His command (Phil 2:9-11; Rev 5:13-14). Do NOT flatten this
   into co-equality and do NOT deny the Beloved's exaltation — hold Yoshi's Formed-Son order exactly.
6. **TORAH STANDS; election; the remnant.** The faithful remnant flees to the wilderness/mountains (ch2)
   while the city apostatizes → 1 Kings 19:18, Revelation 12:6, Hebrews 11:38. Never law-as-curse.

## TARGET LIBRARIES — weave all three; do NOT force a weave with no real parallel.
Tanakh, NT, and parallel extra-canon (live editions + slugs): `enoch`/`1-enoch`, `jubilees`/`jubilees`,
`jasher`/`jasher`, `adam-eve-conflict`/`1-adam-eve`+`2-adam-eve`, and the `apocrypha` books. `canon` for Tanakh+NT.

## JSON SCHEMA — write exactly this shape to the output file
```json
{
  "edition": "ascension-isaiah", "book": "ascension-isaiah", "chapter": <N>,
  "session": "session403", "tag": "asci<N>", "base_band": <BAND>,
  "threads": [
    {
      "slug": "ascension-isaiah-<N>-<short-weave>",
      "title": "<concise title>",
      "summary_md": "<Come-and-See prose: open with the Ascension passage in full italics (Ascension of Isaiah <N>:<v>), then weave Tanakh/NT/extra-canon parallels each in full italics with (Book ch:v). Carry the Formed-Son frame.>",
      "anchor_start_v": <int>, "anchor_end_v": <int>,
      "tier": "extras",
      "members": [
        {"src_ch": <N>, "src_v": <int>,
         "tgt_edition": "canon", "tgt_book": "philippians", "tgt_ch": 2, "tgt_v": 7,
         "tier": "free",
         "note": "Philippians 2:7 — *<verbatim target verse>* <one sentence tying it to Ascension <N>:<v>>."}
      ]
    }
  ]
}
```

### Authoring rules
- **src is ALWAYS ascension-isaiah + your chapter** (`src_ch` = N, `src_v` = a real verse — VERIFY it exists
  in the dump; use ONLY verse numbers that appear as separate records; never invent).
- **tier:** member `"free"` if `tgt_edition` is `canon`, else `"extras"`. Thread tier always `"extras"`.
- **member note:** `Book ch:v — ` + the target verse in full italics + one sentence connecting it. Quote VERBATIM.
- **3–6 threads** per chapter (fewer for thin chapters; no padding). **2–5 members per thread.**
- The Vision chapters (6-11) are the Christological heart — weave them richest. The Martyrdom (1-5) leans
  prophet-martyr + seed-war + remnant.
- If a chapter is garbled/duplicated, write `"threads": []` + `"_blocked": true` + `"_blocked_reason"`, return 0.

When done, WRITE your JSON to the path you are given, then return a one-line manifest (threads/members/notes_for_yoshi).
