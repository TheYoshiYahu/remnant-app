# MINION BRIEF — The Shepherd of Hermas (extra-canonical cross-references)

You author ONE chapter of a "Come-and-See / It Ain't New" cross-reference apparatus on
**The Shepherd of Hermas** (edition `lightfoot-apostolic-fathers`, book `hermas`). Hermas is a
second-century Jewish-Christian apocalypse of **repentance** (the angel/shepherd of repentance),
Visions + Mandates + Similitudes. It is NOT supersessionist — it upholds the commandments, the
two ways, the true fast, the pilgrim people. Weave it OUT to the Tanakh + NT (and parallel
extra-canon where genuine).

## ⚑ DIRECTIONAL RULE (post-apostolic witness)
Hermas is a post-apostolic historical witness. Threads anchor ON Hermas; members point OUT to
canon. Scripture does NOT point into Hermas. (threads = anchored on the hermas verse; each member's
src = the hermas verse, tgt = the canon/extra-canon verse.)

## ⚑ THEOLOGY / VOICE
- READ the yoshi-voice skill first (load it fresh) and write every summary + note in that voice:
  warm, reverent, "come and see," "it ain't new," the unity of the whole counsel. Restored sacred
  names as the source already carries them (Yahuah, Yahusha, Elohim, Ruach HaKodesh, HaMashiach).
- son-of-man -> "Son of Adam"; preserve the kaph ("like the Son of Adam") only where a target verse
  actually has it (Dan 7:13 / Rev 1:13 / 14:14). Hermas' "Son of God" = Yahusha the Formed Son.
- NEVER build a thread that endorses a contrary-to-Torah gloss. Hermas rarely strays, but if a line
  leans antinomian, weave the Torah-upholding canon (Matt 5:17-19, Mal 4:4, Isa 66:23) instead.
- Genuine self-links to the now-LIVE extra-canon are welcome where the SAME idea appears: e.g.
  the two ways -> didache/1-enoch; the pilgrim city -> nothing forced.

## SCHEMA (exact — render_fragment.py parses this)
Write `/private/tmp/extracanon-xref-wt/scratch_xref_extracanon/json_hermas_<N>.json`:
```json
{
  "edition": "lightfoot-apostolic-fathers", "book": "hermas", "chapter": <N>,
  "session": "session253", "tag": "herm<N>", "base_band": <BAND>,
  "threads": [
    {
      "slug": "hermas-<N>-<short-kebab>",
      "title": "<concise title, restored names ok>",
      "summary_md": "<come-and-see prose; quote the Hermas source line in full *italics*, then show the canon underneath with *italic* quotes>",
      "anchor_start_v": <v>, "anchor_end_v": <v>,
      "tier": "extras",
      "members": [
        {"src_ch": <N>, "src_v": <v>,
         "tgt_edition": "canon", "tgt_book": "<book-slug>", "tgt_ch": <c>, "tgt_v": <v>,
         "tier": "free",
         "note": "<Book c:v> — *<EXACT verbatim target verse text>* <short come-and-see tie-in>"}
      ]
    }
  ]
}
```
- thread tier = `"extras"`; member tier = `"free"` (this is the established Hermas convention).
- 3–4 threads per chapter is typical (fewer for 1-verse blob chapters; more for ch23).

## ⚑⚑ NON-NEGOTIABLE GATES — your JSON must pass all of these
1. **anchor_start_v / anchor_end_v / every member src_v MUST be a verse number that ACTUALLY EXISTS
   in the dump.** This parse BLOBS content: many chapters are a single verse holding several
   sections; some verse numbers are skipped/merged. Run `dump_canon.py hermas <N> lightfoot-apostolic-fathers`
   and use ONLY verse numbers that appear as their own line. If the content you want is inside a blob
   verse, anchor on THAT blob verse number. DO NOT invent verse numbers.
2. **Every target quote in `note` MUST be the EXACT verbatim text of that target verse** as it stands
   in the canon parse. Get it by running `dump_canon.py <book_id> <ch>` (canon, no 3rd arg). Copy the
   text verbatim into the italic quote. (verify_fidelity compares your quote to the parse and FLAGS
   paraphrase.) Pick real, resolvable targets (KJV-style canon).
3. Source + every target must resolve in the live DB (resolve_check). Use real canon book slugs
   (e.g. `matthew`,`1-corinthians`,`isaiah`,`psalms`,`hebrews`,`james`,`1-peter`,`deuteronomy`).

## CHAPTER MAP (author from the LITERAL dump — these are guides, verify against the text)
- ch13 (Mand. 8): the creatures of God are twofold; temperance twofold — refrain from evil, do good
  (two ways). -> Ps 34:14, Isa 1:16-17, Amos 5:15, Rom 12:9, 1 Thess 5:21-22.
- ch14 (Mand. 9): doubt not in prayer; ask of God nothing wavering. -> James 1:6-8, Matt 21:22,
  Mark 11:24, Heb 11:6.
- ch15 (Mand. 10): put away sorrow/grief; it crusheth out the Ruach HaKodesh; clothe in cheerfulness.
  -> Eph 4:30 (grieve not the Holy Spirit), 2 Cor 7:10 (godly sorrow vs worldly), Prov 17:22, Neh 8:10.
- ch16 (Mand. 11): the true vs the false prophet (the empty vs the Spirit-filled). -> Matt 7:15-20,
  1 John 4:1, Jer 23:16, Deut 18:21-22.
- ch17 (Mand. 12): cast out evil desire, put on the good desire; the angel of repentance; fear not the
  devil, resist him. -> Gal 5:16-17, James 4:7, 1 Pet 5:8-9, Eph 6:11, Rom 13:14. (v4-6 the angel of
  repentance / fear not the devil.)
- ch18 (Sim. 1): ye dwell in a foreign land, your city is far; buy not estates here but do good. ->
  Heb 11:13-16, Phil 3:20, 1 Pet 2:11, Matt 6:19-20, 1 Tim 6:18-19. (Pilgrim-city = "it ain't new.")
- ch19 (Sim. 2): the elm and the vine — rich & poor bear fruit together (the poor's prayer, the rich's
  alms). -> 1 Cor 12:21-22, 2 Cor 8:13-14, Prov 19:17, Luke 16:9, James 2:5.
- ch20 (Sim. 3): trees in winter all alike withered — righteous & sinners indistinguishable in this
  world. -> Matt 13:24-30 (wheat & tares), Eccl 9:2, Mal 3:18.
- ch21 (Sim. 4): trees in summer — some sprouting, some withered; the age to come reveals the righteous.
  -> Matt 13:43, Mal 3:18, Ps 1:3-4, Matt 13:30.
- ch22 (Sim. 5): true fasting (keep the commandments, the vineyard parable); the Son of God in power;
  keep the flesh pure that the Spirit bear witness. -> Isa 58:6-7 (the true fast), Matt 21:33 (vineyard),
  1 Cor 3:16-17 / 6:19 (flesh = temple), Rom 8:9-11. v6-7 = Son of God + Spirit; handle Christology as
  the Formed Son (subordinate-in-order, not co-equal/modalism).
- ch23 (Sim. — the long one, 31 v): dump it and follow the text closely (likely the great similitude /
  tower / the willow & the commandments). Build the most threads here (the chapter is large). Weave the
  tower/building = the assembly/people -> 1 Pet 2:5, Eph 2:20-22, Matt 16:18; the law given to the people
  -> Exod 19-20; the Son's name borne -> Acts 4:12 / Phil 2:9-10 — but ONLY where the dumped text supports it.
- ch24 (epilogue): ⚠ ONLY verses 1,2,3,4 are clean — v6 and v9 are CORRUPT raw Greek (OCR bleed from
  another work); DO NOT anchor on or quote v5/v6/v7/v8/v9. Author only on v1-4: declare the mighty works
  of the Lord, quit you like a man, the virgins as helpers, walk in the commandments and live. ->
  1 Cor 16:13 (quit you like men), Ps 145:4-6 (declare His mighty acts), Deut 30:19-20 (choose life), Rev 22:14.

## OUTPUT
After writing the file, run these and paste results in your final message:
```
cd /private/tmp/extracanon-xref-wt/scratch_xref_extracanon
python3 anchor_check.py lightfoot-apostolic-fathers hermas json_hermas_<N>.json
python3 render_fragment.py json_hermas_<N>.json > frag_hermas_<NN>.sql && echo RENDER_OK
```
Then return a one-line manifest: chapter, threads, members, and any notes_for_yoshi.
Your final message IS the return value — keep it terse.
