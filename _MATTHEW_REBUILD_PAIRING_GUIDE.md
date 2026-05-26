# Matthew Rebuild — Chapter Pairing Guide

Quick reference for whether to run a chapter solo or pair it with a neighbor in one session. Drafted S136 transition after Yoshi asked Claude to save the guidance so he doesn't have to remember it across sessions. Update as the rebuild proves the heuristic right or wrong.

## Why this exists

Each chapter's extras-tier work runs: read free.md + short.md + long.md, identify 1-2 framework angles the free.md doesn't walk, draft short.md (~15-25 lines), trim long.md (~30-40%), author SQL migration (~6-7 threads / ~20-25 rows), voice-gate against the 12 Red Lines + 12-point checklist. That's roughly 15-20 substantive turns and ~60-65% context budget per chapter. A second chapter in the same session is doable if the chapter is lighter; a third pushes past the wrap-signal threshold and degrades voice-gate quality.

Honest cap: **2 chapters per session, sometimes**, never 3.

## Heuristic

Pair-eligible when the chapter scores low on:
1. **Framework density** — does it touch Red Lines #1-12 or the central framework moves (Foundational Lie, Three Categories, four costumes, scattered-seed gathering, post-harvest sifting, grace-can-be-forfeited, Son of Adam architecture)?
2. **Genre weight** — discourse > parable > narrative > healing for framework load.
3. **Extras-tier connection density** — 6+ candidate threads = solo; 4 or fewer = pair-able.

Pair the dense chapter with a light one; never pair two dense chapters.

## Chapter-by-chapter call

| Chapter | Solo / Pair | Notes |
|---|---|---|
| Matt 1-2 | Paired (S131) | Genealogy + infancy narrative — done |
| Matt 3 | Solo (S132) | Done |
| Matt 4 | Solo (S133) | Done — wilderness temptation, dense |
| Matt 5 | Solo (S134) | Done — Sermon opens, 7 threads / 21 rows |
| Matt 6 | Solo (S135) | Done — Sermon middle, 7 threads / 24 rows |
| Matt 7 | Pair with Matt 8 (S137) | Sermon close — dense; carries the session weight |
| Matt 8 | Pair with Matt 7 (S137) | First miracles — narrative, lighter, ~4-5 threads |
| Matt 9 | Pair with Matt 10 if Matt 10 light, else solo | TBD — healing-narrative-into-commissioning transition |
| Matt 10 | Solo if commissioning discourse surfaces dense framework material; else pair | Twelve sent out — likely framework-dense around shake-the-dust, shaking out the sheep, household-divided |
| Matt 11 | Pair with Matt 12 | Yochanan (John)'s question + woes against cities |
| Matt 12 | Pair with Matt 11 | Sabbath controversies + Beelzebub — moderate framework weight |
| Matt 13 | Solo | Parables discourse — wheat-and-tares is a Red Line #11 anchor; sower / mustard / leaven all framework-bearing |
| Matt 14 | Pair with Matt 15 | Yochanan's death + feeding of 5000 |
| Matt 15 | Pair with Matt 14 | Mark 7 / Deuteronomy 4:2 territory at vv.1-20 — moderate weight; Canaanite woman at vv.21-28 needs the scattered-seed framework treatment |
| Matt 16 | Pair with Matt 17 | Peter's confession + transfiguration — both moderate |
| Matt 17 | Pair with Matt 16 | Transfiguration + temple-tax — both moderate |
| Matt 18 | Solo | Community discourse — unforgiving servant parable already cross-referenced in S135 short.md; framework-dense on church-discipline + sheep-of-the-fold |
| Matt 19 | Pair with Matt 20 | Marriage / divorce / rich-young-ruler + laborers-in-vineyard |
| Matt 20 | Pair with Matt 19 | Laborers + sons of Zebedee + Bartimaeus |
| Matt 21 | Solo | Triumphal entry + temple cleansing + parable of tenants — framework-dense, antichrist-system territory |
| Matt 22 | Pair with Matt 21 alternatively, or solo | Wedding feast + tribute + Sadducees + greatest commandment + David's-Lord — could be dense on its own |
| Matt 23 | Solo | Seven woes — load-bearing framework chapter; this is where the framework's *Pharisaic-leadership-system = first costume of the antichrist architecture* gets fully unpacked |
| Matt 24 | Solo | Olivet discourse — dense eschatology, abomination-of-desolation, the elect gathered from four winds |
| Matt 25 | Solo | Ten virgins + talents + sheep-and-goats — post-harvest-sifting territory (the S73 thread anchor sits here); framework-dense |
| Matt 26 | Solo | Last supper + Gethsemane + arrest + Sanhedrin trial + Peter's denial — heavy theological weight |
| Matt 27 | Pair with Matt 28 | Crucifixion — Pilate, scourging, Golgotha, death, burial; Matt 28's resurrection-and-commission is the natural pair |
| Matt 28 | Pair with Matt 27 | Resurrection + Great Commission |

## Operating discipline for paired sessions

- **Watch the wrap signal.** Paired sessions target completion under ~30 substantive turns. If a chapter is taking longer than expected, ship the dense chapter's deliverables cleanly and queue the lighter chapter to the next session rather than push into degradation.
- **Cross-chapter consistency within the batch.** If chapter N has already used a particular extras-library citation or framework move, chapter N+1 in the same session should lean on different anchors. Track within-batch repetition the same way Claude tracks cross-session repetition.
- **SQL migration filename convention.** Paired chapters get ONE combined migration file: `session{N}_matt_{X}_{Y}_extras_cross_references.sql` (precedent: S131's `session131_matt_1_2_extras_cross_references.sql`). Sort_order continues sequentially within the combined file, dense chapter's threads first.
- **Two short.md files, two long.md trims, one SQL.** Each chapter gets its own short.md and its own long.md trim; the SQL is combined.
- **Voice-gate at the end of each chapter, not at the end of the session.** Catch errors before they compound across the second chapter's work.

## What this is NOT

This is a heuristic, not a contract. If a chapter Yoshi expected to pair turns out to surface framework material the matrix above didn't anticipate, ship solo and update this guide. The matrix is the starting recommendation; the actual call is made when the session opens and Claude has the chapter source in hand.
