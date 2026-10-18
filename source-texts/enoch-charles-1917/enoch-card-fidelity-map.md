# 1 Enoch card-fidelity map — S457 (2026-10-18), read against the LIVE text

Source: `enoch-cards-live.json` (read-back of the live DB, S457). Lists: `enoch-card-fidelity-sweep.json`
(every card / member note / thread with its verdict and the offending quote). The S449 `enoch-citation-sweep.md`
graded by verse-status; this map grades by the words each note actually quotes. Nothing has been changed.

## Cards (cross_references rows) touching 1 Enoch — 1965
| verdict | cards | meaning |
|---|---|---|
| STAND | 394 | quoted Enoch words are verbatim at the card's address |
| REWORDED | 100 | right verse, Charles wording differs → re-quote in the note |
| RE_ANCHOR | 112 | the quoted words live at another address → re-point (ids kept) + fix the note |
| NOT_FOUND | 106 | the quoted words are nowhere in Charles 1917 (old/invented verse) → rewrite from the live verse, or retire |
| NO_ENOCH_QUOTE | 1249 | note glosses the Enoch verse without quoting it (588 on a *same* verse — stand; 641 on a different/reworded/new verse — the gloss needs a read) |
| NO_QUOTE | 4 | bare note |

Flagged cards by side: {'T': 281, 'ST': 34, 'S': 3} — almost all are canon→Enoch cards that quote the Enoch target (S131–S156 Matthew, S212, S216-era, S2xx epistles); the S250 Enoch-as-source cards mostly quote the canon end, so their risk sits in the un-quoted gloss (NO_ENOCH_QUOTE on a *different* verse).

## Thread member notes touching 1 Enoch — 1958
STAND 425 · REWORDED 10 · RE_ANCHOR 103 · NOT_FOUND 75 · NO_ENOCH_QUOTE 1319 · NO_QUOTE 26.
188 flagged, 187 of them on a card that is itself flagged — one fix covers both.

## Threads (summaries) touching 1 Enoch — 729
STAND 157 · REWORDED 69 · RE_ANCHOR 106 · NOT_FOUND 337 · no Enoch quote 60.
512 summaries carry at least one bad Enoch quote (988 bad quotes in all); 342 of them are the S250 `1-enoch-N-…` chapter threads, whose summaries were written on the corrupt text and never rewritten at S449. **This is the largest body of work** — thread summaries quote 3–6 Enoch verses each.

## Live-text facts
- Live 1 Enoch: 1,068 verse rows; 1,063 real (= Charles txt), 5 placeholder rows (11:7, 17:9, 17:21, 24:9, 25:9: "Not in 1 Enoch…"). No card is anchored on a placeholder.
- The seed.py comment "1/108/1367" is pre-S449 and stale.

## Order of work (general → specific), all in Yoshi's voice, Come-and-See, Rule 10, scratch-tested, one deploy script
1. RE_ANCHOR cards (112) — mechanical where the words were found at one address; re-point + re-quote.
2. REWORDED cards (100) — re-quote from the live verse; anchor stays.
3. NOT_FOUND cards (106) — read each: does the live verse at the address carry the thought (rewrite) or not (find the true verse, or retire).
4. NO_ENOCH_QUOTE cards on different/reworded/new verses (641) — read the gloss against the live verse.
5. Thread summaries (512) — rewrite every bad quote from the live verse; the S250 chapter threads first.
6. Members (188) ride along with their cards.
Also folds in: `session154_matt_17_extras_cross_references.sql` (never applied; 21 Enoch-era rows) — re-verify its quotes against the live text before it is ever applied.
