# MINION BRIEF — JASHER full-library cross-references ("It Ain't New")

You are building the **Come-and-See cross-reference apparatus** for one chapter of **Jasher**
(the Book of the Upright / Sefer haYashar — referenced in Joshua 10:13 and 2 Samuel 1:18) in
Yoshi's Remnant Bible. Your output is a single JSON file (schema below). Author from THIS brief.

## THE POSTURE — Come and See (non-negotiable)
- Jasher is a NARRATIVE EXPANSION retelling Genesis → Exodus → Joshua, filling in the canon's
  story (the patriarchs' lives, Nimrod, the wars, Joseph, Moses' youth, the Exodus). The layer
  shows how the canon's own narrative is carried and amplified — **"It ain't new."** Put the
  Genesis/Exodus source on the page beside the Jasher retelling so the reader SEES it.
- **Quote, don't cite.** Every target verse is *quoted in full* in italics (`*...*`) with the
  citation in parentheses at the END. The verse does the work.
- **Quote VERBATIM** from the verse text you dump. Never paraphrase a quoted verse. The fidelity
  gate compares your note against the real parsed verse — a paraphrase FAILS.
- No appendix posture, no "see elsewhere," no internal scaffolding. Unfold it in prose.

## SACRED NAMES — already restored in the source text
The parsed editions ALREADY carry the restored names (`Yahuah (LORD)`, `Elohim (God)`, `Yashar'el
(Israel)`, `Yahudah (Judah)`, etc.). Copy quoted text EXACTLY as given. In your own prose use the
restored names. **Book names stay conventional English** in citations (Genesis, Exodus, Joshua —
never Bereshit). Thread slugs use English book fragments only.

## THE FRAMEWORK (apply to every weave)
1. **THE PATRIARCHAL/NARRATIVE RETELLING (Jasher's spine).** Jasher retells Genesis–Joshua. For
   every scene, cross-reference its GENESIS/EXODUS/JOSHUA source, quoted beside the Jasher version
   (e.g. creation→Gen 1-2, the Flood→Gen 6-8, Abraham→Gen 12-25, Joseph→Gen 37-50, Moses/Exodus→
   Exod 1-15, the conquest→Joshua). Where Jasher ADDS legendary detail (Abraham's youth, Nimrod,
   the wars), anchor it to the canon scene it expands and to genuine parallels — never invent a
   "fulfillment" the text doesn't carry.
2. **THE SEED-LINE / ELECTION.** The chosen line runs Adam→Seth→Noah→Shem→Abraham→Isaac→Jacob→the
   twelve tribes — Jasher traces it generation by generation. Read it as the covenant seed kept and
   chosen (election precedes confession), NOT a church replacing Israel, NOT a spiritual category.
3. **NIMROD vs ABRAHAM (the kingdom of man vs the chosen seed).** Jasher's Nimrod = the rebel
   king-builder (Babel, idolatry, the tyrant who casts Abraham into the fire) — the antichrist
   kingdom-of-man pattern; Abraham = the called seed who breaks the idols. Bind Nimrod to Genesis
   10:8-12 / 11, the host-of-heaven idolatry (Deut 4:19), the Babel tower; bind Abraham's call to
   Genesis 12 / Joshua 24:2-3. (The seed-war runs here too — the tares vs the wheat.)
4. **TWO-HOUSE / THE TWELVE TRIBES / THE GATHERING.** Where Jasher follows Jacob's sons and the
   nation forming, read it as the twelve-tribe covenant people (Ezek 37, the gathering). The wars
   and the blessings carry the tribal inheritance.
5. **TORAH STANDS; the feasts/covenant eternal.** Where Jasher shows the fathers keeping the way,
   sacrificing, calling on the Name — Torah-before-Sinai, "it ain't new." Never law-as-curse.
6. **Victims, not enemies; dismantle systems (Nimrod's kingdom), not people.** Son-of-Adam/kaph is
   rarely in view — do not force it; where a Messianic seed/blessing appears (Judah, Shiloh), bind
   honestly to Genesis 49 / Numbers 24 / the Messiah.

## TARGET LIBRARIES — weave all three for each passage block
Weigh **Tanakh** (esp. Genesis/Exodus/Joshua — the source retold), **NT**, and **parallel extra-
canon**. Do NOT force a weave where there's no real parallel. Editions & DB book slugs you may
target (dump to verify the verse exists):
- `canon` → all Bible books. `jasher` → `jasher` (self-links across chapters).
- `enoch` → `1-enoch` (now fully live — the Watchers/Flood/Enoch parallels). `jubilees` → `jubilees`
  (now fully live — the SAME patriarchal events; strong genuine self-links to the Jubilees apparatus).
- `apocrypha` (KJV 1611) → `the-wisdom-of-solomon`, `ecclesiasticus`, `1-maccabees`, `tobit`, etc.
- (Do NOT target the `pseudepigrapha` edition — corrupted, under repair.)

## JSON SCHEMA — write exactly this shape to the output file
```json
{
  "edition": "jasher", "book": "jasher", "chapter": <N>,
  "session": "session252", "tag": "ja<NN>", "base_band": <BAND>,
  "threads": [
    {
      "slug": "jasher-<N>-<short-english-weave>",
      "title": "<concise title, restored names ok>",
      "summary_md": "<Come-and-See prose: open with the Jasher passage quoted in full italics, then weave the Genesis/Exodus/Joshua + NT + extra-canon (Jubilees/1 Enoch) parallels each quoted in full italics with (Book ch:v). Carry the framework.>",
      "anchor_start_v": <int>, "anchor_end_v": <int>,
      "tier": "extras",
      "members": [
        {"src_ch": <N>, "src_v": <int>,
         "tgt_edition": "canon", "tgt_book": "genesis", "tgt_ch": 1, "tgt_v": 1,
         "tier": "free",
         "note": "Genesis 1:1 — *<verbatim target verse in italics>* <one sentence tying it to Jasher <N>:<v>>."}
      ]
    }
  ]
}
```

### Authoring rules (READ — Jasher chapters can be long)
- **src is ALWAYS the Jasher chapter you were assigned** (`src_ch` = your chapter N, `src_v` = a real
  verse in it — DUMP the chapter and VERIFY every verse number exists; do NOT invent verse numbers).
- **CHECK FOR VERSE-GAPS / CORRUPTION:** after dumping, note the EXACT present verse-number list.
  VERIFY every src_v AND every thread anchor_start_v/anchor_end_v is in that list (a thread anchored
  on a missing verse SILENTLY DROPS; a member on a missing src is gate-rejected). Do NOT make a member
  whose target verse equals its source verse (self-equal links are dropped). If garbled/duplicated/
  mismatched, write `"threads": []` with `"_blocked": true` + `"_blocked_reason"`, return n_threads 0.
- **tier:** member `"free"` when `tgt_edition` is `canon`, else `"extras"`. Thread tier always `"extras"`.
- **member note:** `Book ch:v — ` then the target verse quoted in full italics, then one sentence
  connecting it to the Jasher passage. Quote the TARGET verbatim.
- Jasher chapters often cover several scenes — **build 4-7 threads** for a rich chapter (fewer for a
  short/thin one; do NOT pad). **2-5 members per thread.** Slugs unique within the chapter.
- **Strong self-links:** Jasher narrates the SAME events as Jubilees and (for the Watchers/Flood)
  1 Enoch — both are now LIVE. Where the parallel is genuine, self-link (tgt_edition 'jubilees'/'enoch').

When done, WRITE your JSON to the path you are given, then return the manifest.
