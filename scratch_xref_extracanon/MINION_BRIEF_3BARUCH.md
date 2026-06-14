# Minion brief — 3 Baruch (The Greek Apocalypse of Baruch) cross-references

You author the "It Ain't New" / Come-and-See cross-reference apparatus for **3 Baruch**
(edition `pseudepigrapha`, book `3-baruch`, freshly repaired text). The apparatus weaves
this book's verses (as the SOURCE/anchor) out to the Tanakh, the NT (canon), and the
already-live extra-canon books (enoch / jubilees / jasher / apocrypha) where there is a
GENUINE textual/thematic kinship. The thesis is *it ain't new*: what the apostles and the
prophets say is already foreshadowed here, and this book is itself echoing Moses and the
Prophets.

## VOICE (Yoshi)
- Sober, reverent, plain. The apparatus shows the framework by *what scripture references
  what* — not by preaching on top of it. summary_md is a short come-and-see paragraph;
  member notes quote the TARGET verse and state the kinship in one or two clauses.
- This is an apocalypse, not canon. Treat it as a witness that *confirms* Moses/Prophets/
  Messiah — never as adding doctrine. Where it diverges from canon (e.g. its peculiar
  cosmology of named heavens, the phoenix, the vine = the tree), weave the GENUINE canonical
  root it is reaching for; do not endorse the embellishment as fact.
- NEVER build a thread that endorses anything contrary to Torah. Skip a verse rather than
  force a weave.

## 3 BARUCH — the spine (so your weaves are real, not decorative)
- **ch1**: Baruch weeping over the captivity/destruction of Jerusalem; an angel sent to
  comfort and tell him to "cease to provoke God." → Lamentations, Jer 39/52, 2 Kgs 25,
  2 Bar (self-link if live), Ps 137, Jer 7 ("where is their God"). Baruch the scribe = Jer 36/45.
- **ch2-3**: ascent; the FIRST/SECOND heavens hold the builders of the **tower of Babel** /
  those who forced others to make bricks → **Gen 11:1-9**, the brick-toil → Exod 1:14, pride
  cast down → Isa 14 / Zeph; men with ox/dog faces = those who lost the image.
- **ch4**: the THIRD heaven; the dragon/Hades that devours; the **VINE that the serpent used
  to deceive Adam** (3 Baruch identifies the forbidden tree as the vine) → **Gen 3** (serpent,
  the tree, the curse); Noah replants the vine after the flood, warned of its danger →
  **Gen 9:20-21**; warning against drunkenness → Prov 23:31-32, Isa 5:11, Eph 5:18; the
  serpent's belly = the place of the wicked. The water that watered Eden / the flood → Gen 2:10-14, Gen 7.
- **ch5-9**: the sun and the **phoenix** bird that shields the world from the sun's heat and
  collects its rays; the sun crowned and renewed each day → creation of the lights **Gen
  1:14-18**, **Ps 19:4-6** (the sun as a bridegroom/strong man), Ps 104:19-23, Mal 4:2 (sun
  of righteousness); the **moon** waxing/waning, defiled because it shone on the sin of the
  Watchers/the transgression → 1 Enoch (Watchers self-link), Gen 6:1-4, Ps 104:19, Jer 31:35.
- **ch10**: the FOURTH heaven; a plain with a pool/lake where the birds praise God; the souls/
  birds of the righteous → Ps 148, Rev 5:13 (every creature praising), Isa 43:20.
- **ch11-16**: the FIFTH heaven; **MICHAEL the great commander/archangel** descends with a
  great **bowl/dish** to receive the **merits and prayers of the righteous** and carry them
  before God → **Rev 8:3-4** (the angel with the golden censer offering the prayers of all
  saints), **Rev 5:8** (golden bowls full of odours = the prayers of saints), Ps 141:2
  (prayer as incense), Tobit 12:12,15 (the angel presenting the prayers — apocrypha self-link),
  Dan 10:13,21/12:1 (Michael the prince), Jude 9, Heb 1:14 (ministering spirits). The angels
  come bringing **baskets full of flowers = the virtues/good works** of the righteous, and
  some come with **empty or half-full baskets**, and some with none → the reward of works
  Matt 16:27, Rev 22:12, 2 Cor 5:10, Gal 6:7-9 (a man reaps what he sows), Matt 25:14-30
  (the talents), Rev 14:13 (their works follow them). The rain/blessing sent on the worthy and
  withheld from the unworthy → Deut 11:13-17, Lev 26:3-4, Jer 5:24, Matt 5:45. Final doxology
  ch17 → Rom 16:27, Jude 25.

## HOW TO BUILD (per chapter)
1. Dump your source chapter VERBATIM:
   `python3 scratch_xref_extracanon/dump_canon.py 3-baruch <CH> pseudepigrapha-charles-vol2`
2. For every TARGET verse you cite, dump it verbatim so your note quotes it exactly:
   `python3 scratch_xref_extracanon/dump_canon.py <book-slug> <ch> canon`  (or enoch/jubilees/
   jasher/apocrypha edition file for self-links). The note MUST quote the target verse text
   faithfully (italicize the quote with *...*), then a short kinship clause.
3. Author 2-5 threads per chapter (fewer for 2-4 verse chapters; a 2-verse chapter may have 1).
   Each thread: a slug `3-baruch-<CH>-<short-kebab>`, a title, a 1-3 sentence summary_md
   (come-and-see), anchor_start_v/anchor_end_v (verses that MUST exist in the chapter), tier
   "extras", and members. Each member: src_v (in this chapter), tgt_edition, tgt_book (slug),
   tgt_ch, tgt_v, tier "extras", note (verbatim target quote + kinship).
4. Cite ONLY verse numbers that exist (source ch verses are contiguous 1..N per the dump;
   targets must be real canon refs you dumped). Do not invent.
5. Write the file: `scratch_xref_extracanon/out3b/json_3baruch_<NN>.json` (NN = zero-padded ch),
   with keys: edition="pseudepigrapha", book="3-baruch", chapter=<CH>, session="session410",
   tag="3b<NN>", base_band=<81000 + (CH-1)*25>, threads=[...]. Return a one-line manifest
   (chapter, #threads, #members) as your final message.

Self-links: tgt_edition for canon = "canon"; for live extra-canon use "enoch"/"jubilees"/
"jasher"/"apocrypha" with the right book slug + chapter/verse you verified via dump.
