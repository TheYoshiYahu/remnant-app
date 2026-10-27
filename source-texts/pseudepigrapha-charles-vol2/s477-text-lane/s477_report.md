# S477 text lane — merge report

## The Books of Adam and Eve (adam-eve)
- chapters 94 (unchanged)
- verses 312 -> 141; joins 171; de-hyphenations 2
- verse ends still not clause ends: 1
- new verses starting lowercase: 3 [(47, 2), (52, 2), (72, 3)]
- every letter of the old text present in the new text, in order: yes

## 4 Maccabees (4-maccabees)
- chapters 18 (unchanged)
- verses 467 -> 247; joins 220; de-hyphenations 6
- verse ends still not clause ends: 0
- new verses starting lowercase: 21 [(3, 4), (4, 1), (4, 4), (4, 10), (4, 13), (5, 2), (5, 12), (5, 17), (5, 20), (6, 9), (6, 12), (9, 9), (14, 1), (15, 4), (16, 13), (16, 19), (16, 23), (17, 21), (18, 2), (18, 8), (18, 13)]
- every letter of the old text present in the new text, in order: yes

## Rule (decided S477, Oct 26)
A verse boundary stands where the old line ends with . ! ? : or ; (closing quotes/brackets may follow), or where the OCR dropped a question
mark before a capitalised next line. ':' and ';' count because Charles's own verse divisions sit on them (4 Macc 5:14/15, 6:31/32, 16:12/13…).
Everything else was a print line and is joined with a space, or directly after a hyphenated word. Vita 49:2/3 (ch 92) keeps its boundary
though its period is lost. Two sentences that ran across a chapter break move to the chapter whose standard division carries them:
"(Then) was the sun darkened and the moon" (88:3 → 89:1, Vita 46:1) and "brethren, who were on the rack, being tortured to death;"
(14:1 → end of 13:13; standard 14:1 begins "nay more"). No word of the text changed.

## Join quality (script)
adam-eve: 171 joins, 2 de-hyphenations (appeared, foretold). 4 Maccabees: 220 joins, 0 doubled words at any seam, 6 de-hyphenations
(temperance, Accursed, Therefore, sacrifice, fraternal, succour), 0 joins across a line that already ended a clause.

## Cards and anchors (s477_cards_map.json)
533 card ends (adam-eve 241 source ends; 4 Maccabees 280 source + 12 target), 112 thread anchors (61 + 51). Old line traced into the new verse
533/533. 0 pair collisions after the merge. Only 34 cards quote the book's own text in italics; 5 of them (4450, 4859, 4860, 4875, 4876)
already quoted a verse other than their anchor before this — for the sweep. Override: 69502 (Joel 2:10) follows its sentence to 89:1.

## Cold reads (out/cold*.sonnet.json)
adam-eve: two Sonnet readers, full merged text + every card and anchor — 141 verses, 241 cards, 61 anchors each; both AGREE with every move
and find no join damage. 4 Maccabees: the martyrdom text cannot be passed through the chat (the reply is blocked), so both readers worked
from the addresses packet (parts, cards, anchors) — 247 verses, 292 cards, 51 anchors each; both AGREE, 13:13/14:1 move agreed.
`cold_packet_4macc_seams.txt` (7 words either side of every seam) is on disk for a textual read in a fresh session if Yoshi attaches it.

## Scratch (seed477.mjs, PGlite on the Mac)
run 1: adam-eve 141/141 and 4 Maccabees 247/247 verses as written; cards 533/533 at the new address; anchors 112/112; 0 dup pairs; member rows
533; user rows on swallowed lines re-pointed (bookmark colliding with the kept row dropped; highlight offsets +20). run 2: 0 changed.
Guards: tampered live text → RAISE + rollback; extra live row → RAISE + rollback.

## Misprints noted (text lane, not blocking)
4 Maccabees 4:1 missing its opening clause (the OCR shares the gap); adam-eve 92:1 lost period; OCR-dropped question marks throughout adam-eve.
