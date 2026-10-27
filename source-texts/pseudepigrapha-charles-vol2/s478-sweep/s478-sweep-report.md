# S478 — sweep of Charles adam-eve (784) + 4 Maccabees (789) on the merged live text — BUILT Oct 27, 2026, scratch ×2 clean, deploy pending

Map: `s478-sweep-map.md`. Chain: post-deploy dump (Oct 26 20:47 CDT) → `regrade.py` / `regrade_members.py` (S463e, every quotation)
+ `stale_cites.py` (old-numbering citations in prose, mapped by `s477_map.json` or by tracing the quoted words) → map → Yoshi's one
decision ("substance … shadow" → plain words) → `build_packets478.py` → Sonnet drafters (`out/*.sonnet.json`) + two Sonnet cold address
reads (`out/cold1/cold2.sonnet.json`, 9/9 agree) → two Fable voice reads (`out/voice_*.fable.json`, 17 FIX applied → `out/*.final.json`)
→ `assemble478.py` → `fix/` → `gen_sql478.py` → `data-schema/migrations/session478_adam_eve_4macc_sweep.sql` → `seed478.mjs` (PGlite
on the Mac: run 1 = 73/73, 71/71, 58/58; run 2 = 0 changed; guards: tampered live text → RAISE, nothing landed; card moved since the
read-back → skipped) → `_session478_sweep_deploy.sh` runs `_s478_check.py` and prints the proof.

## What the migration does (73 cards, 71 member rows, 58 summaries)
- 12 S154-era framework cards rebuilt Come-and-See (4448–4452, 4858–4860, 4873–4876); 4 of them moved to the verse their quotation
  sits in: 4450, 4875 → 17:12; 4859 → 17:15; 4860 → 17:19 (4876 stays 17:17, quotes 17:19 second).
- 8 cards moved by the two cold reads (both agree): 69439, 69440, 69441 58:1 → 59:1 (the devil's banishment); 69452 64:1 → 62:1
  (Eve's pains); 69453 66:2 → 67:2 (the eight hundred years); 69454 66:1 → 67:1 (Seth in place of Abel); 69319, 69320 12:1 → 10:1
  (the beast fighting the image). 69317 stays at 12:1.
- 15 phrase patches (7 hyphen-chains, 6 "substance … shadow", 2 off quoted phrases) — only the flagged sentence changed.
- 35 cards whose prose cited the pre-merge numbering, re-cited by the map (and "Adam & Eve c:v" normalised to "Adam and Eve c:v").
- 3 canon re-quotes from parsed/canon.json: 69342 1 Thessalonians 4:16 (*Yahusha (Lord) himself shall descend*), 63607 2 Timothy 4:8,
  69526 Revelation 14:13 (whole verse).
- 58 summaries: 3 patched (15727, 15755 "substance"/"TYPE"/"the Formed Son"; 15752 chain) + 55 re-cited to the merged numbering
  (quotations traced into the live text; thread 15734 8:21 → 8:10–11 because the quotation runs across the live split).

## For Yoshi (not blocking)
- 4858 (Matthew 26:39 ↔ 4 Macc 9:1): the old note's cup-of-wrath cluster (Psalm 75:8, Isaiah 51, Jeremiah 25, Ezekiel 23, Isaiah
  53:10) was dropped — no live text in hand to quote; say if you want those verses given in full on the card.
- 4859: the old note's long rule-out of Trinitarian / modalist / Arian readings was cut to the Son's submission to the Father.
- 4860 / 4876 (the ransom sentence, 17:19): written as the book's own witness that foreshadows the Messiah's laying down of his
  life — never that the martyrs' blood atoned. Your eye on that wording.
- 4451: the book says the brothers already stand beside the throne; the note adds that the faithful asleep await the first
  resurrection with us (as the old note did).
- 4452: old note said "the third son"; the live text makes the tongue-cut brother the fourth — corrected.
- 4873: a bare "(John 10:17-18)" paraphrase was dropped (nothing to quote from); the statement stands in plain words.
- Thread titles of 15727 / 15755 still say "a type" / "the type the Messiah fulfils" — outside the summary; your call.
- Old prose untouched by the patch rule still has bare "Elohim" / "the Messiah" / "Israel" without parentheticals on 63517, 63655,
  63397, 63619 ("wounded blood") — a later parenthetical pass if wanted.
- Text lane: 4 Maccabees 4:1 still missing its opening clause; adam-eve 3:1 "murdered. I by the hand" (OCR stray "I" — thread 17332's
  quotation *found Abel murdered by the hand of Cain* no longer matches the live line because of it); 92:1 lost period; dropped
  question marks across adam-eve.
- 63499 quotes Deuteronomy as "the swine *is unclean unto you…*" — the regrade reads it as an own-book quote (false positive); fine.

## Model rule honoured
Drafters and both cold address reads on Sonnet (`*.sonnet.json`); the two voice reads on Fable (`*.fable.json`); the mechanical steps
(stale cites, assemble, SQL, scratch, check) are scripts.
