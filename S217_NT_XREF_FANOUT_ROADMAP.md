# S217 — New Testament cross-reference fan-out roadmap

The standing plan for building the full-library cross-reference apparatus across the rest of the
New Testament, using the per-chapter-range full-library minion model proved on the Acts 1–2 pilot.
This file is the source of truth: a minion (or a Dispatch wave) is told *"do range N from the NT
roadmap"* and everything it needs — chapter bounds, sort band, the load-the-voice-skill-first
protocol, the gates — is fixed here. You should never have to re-type the protocol from your phone;
you point at a range (or say *"continue the roadmap"*) and the standing protocol below applies.

---

## STANDING MINION PROTOCOL (applies to EVERY range, no exceptions)

Every range-minion, before authoring a single row, does this — it is baked into
`scratch_xref_acts/MINION_BRIEF_ACTS.md` Step 0 and restated here so it can never be skipped:

1. **Load the `yoshi-voice` skill IN FULL first** — every Red Line, the Come-and-See posture, the
   Sacred Names convention, the English-book-name slug rule, son-of-man → Son of Adam (kaph
   carve-out at Daniel 7:13 / Revelation 1:13 / 14:14), the Romans 11 reading, the NT-Lord rule,
   the false-inclusion diagnostic. The default trained reading of Paul/grace/"Gentiles" is the
   antichrist reading the skill exists to override.
2. **Read the assigned chapters + candidate targets** with `dump_canon.py`; quote ONLY what is
   pulled (guarantees the fidelity gate).
3. **Author all three library layers** for its chapters — Tanakh + extra-canonical + NT — woven
   per passage, NOT siloed. Source is always the canon verse of the book being built.
4. **Per-chapter library-coverage checklist** in the fragment header: for every verse-block record
   Tanakh / Extras / NT weighed ("none warranted" is a valid recorded answer).
5. **Tiers per row:** canon target (Tanakh + NT) = `free`; extra-canonical = `extras`. Thread tier
   = `extras` if any member is extras.
6. **Write the fragment to disk** as `scratch_xref_<book>/minion_<book>_<range>.sql` — this is the
   checkpoint. A finished fragment is durable; an interrupted wave loses at most the in-flight range.

### The five QA gates (every range, same standard that passed Acts 1–2)
1. `_xref_audit.py` classifier = **FULL-LIBRARY PASS** (add each book's glob to `COVERAGE_GLOBS`).
2. `verify_fidelity.py` = every target tuple verbatim against the parsed editions.
3. `pglast` real-grammar parse = OK.
4. **Voice-gate review** against the 12 Red Lines + 12-point checklist (per-book risk notes below).
5. **Per-chapter coverage audit** = all three libraries weighed for every chapter.

### Harness per book
Copy `scratch_xref_acts/` → `scratch_xref_<book>/` (dump + verify + regenerated `EXISTING_SLUGS.txt`),
generalize the brief's book name, assemble into `data-schema/migrations/session2NN_<book>_cross_references.sql`
(BEGIN/COMMIT + `\echo`, idempotent ON CONFLICT). DB applies run on the Mac (Render egress blocked
in the sandbox).

---

## CURRENT STATE OF THE NT APPARATUS (what's done, what's left)

| Book | Chs | Canon (Tanakh→) | Extras | NT-to-NT | Status |
|------|----:|:---:|:---:|:---:|--------|
| Matthew | 28 | ✅ | ✅ (full library) | ⬜ | extras complete; NT-NT optional later |
| Mark | 16 | ✅ | ✅ | ⬜ | NT-to-NT parity pending |
| Luke | 24 | ✅ | ✅ | ⬜ | NT-to-NT parity pending |
| John | 21 | ✅ | ✅ | ✅ | **complete** (the model) |
| **Acts** | 28 | ✅ | ✅ | ✅ | **complete** — 1–28 full library, 130 threads/428 members live |
| **Romans** | 16 | ✅ | ✅ | ✅ | **complete** — 1–16 full library, 91 threads/285 members live (S219, band 6000–6381). 9–11 ON BLESSING LIST. |
| **Galatians** | 6 | ✅ | ✅ | ✅ | **complete (S223)** — 1–6 full library, **31 threads/119 members LIVE** in prod (band 7200–7337, applied 2026-06-10, exact reconciliation). WHOLE BOOK ON BLESSING LIST. |
| **Revelation** | 22 | ✅ | ✅ | ✅ | **complete (S224)** — 1–22 full library, **149 threads/637 members LIVE** in prod (band 9000–9546, migration session224 + session225 two-house frame fix, applied 2026-06-10). KAPH 1:13/14:14 + 144k two-house + keep-commandments 12:17/14:12/22:14 + New Jerusalem ON BLESSING LIST. **S225 (Yoshi's frame):** the TWO WITNESSES (Rev 11) = House of Judah + House of Israel (Ezekiel 37 two sticks / Zech 4 two olive trees), NOT two returned prophets; white-throne judgment AFTER the millennium (11:18→Rev 20). Whole eschatology block on blessing list. |
| **1 Corinthians** | 16 | ✅ | ✅ | ✅ | **complete (S228)** — 56 threads/202 members live (band 6600–6981). |
| **2 Corinthians** | 13 | ✅ | ✅ | ✅ | **complete (S229)** — 1–13 full library, **40 threads/141 members LIVE** in prod (band 7000–7303, migration session229, applied 2026-06-11, exact reconciliation 0 orphans). BLESSING LIST: ★ch3 letter-vs-spirit = the new covenant writing the SAME Torah on the heart (Jer 31/Ezek 36), NOT Torah-abolished; ★ch6:14-18 come-out-and-be-separate = the gathering/separation (Lev 26 + Isa 52 + 2 Sam 7), NOT replacement; ★ch8 collection/manna-equality (Exod 16:18) + ★ch9 cheerful-giver (Deut 15:10, ⚠ canon Prov 22:8 ≠ LXX). |
| **Ephesians** | 6 | ✅ | ✅ | ✅ | **complete (S230)** — 1–6 full library, **21 threads/94 members LIVE** in prod (band 7400–7531, migration session230, applied 2026-06-14, exact reconciliation 0 orphans). ★ ch2 two-houses/middle-wall + grace-through-faith-unto-works, ch5 bridegroom-&-bride=Israel-restored, ch6 honour-father-mother=Torah-affirmed + whole-armour-of-Yahuah ON BLESSING LIST. |
| **Philippians** | 4 | ✅ | ✅ | ✅ | **complete (S231)** — 1–4 full library, **17 threads/57 members LIVE** in prod (band 7560–7644, migration session231, applied 2026-06-14, exact reconciliation 0 orphans, 0 unresolved). ★ ch2 kenosis hymn = the Formed Son emptied/obedient, exalted BY the Father, bears the Name, every knee bows TO THE FATHER'S GLORY (Isa 45:23 / Rom 14:11 / 1 Cor 15:27 — NOT co-equal-persons), ★ ch3 righteousness-of-faith = flesh-credential boast excluded NOT Torah abolished (Gen 15:6 / Hab 2:4 / Jer 23:6 / Rom 10:3) ON BLESSING LIST. |
| **Colossians** | 4 | ✅ | ✅ | ✅ | **complete (S232)** — 1–4 full library, **20 threads/67 members LIVE** in prod (band 7660–7744, migration session232, applied + reconciled 2026-06-14, 0 orphans, 0 unresolved). ★★ ch1:15–20 the Formed-Son hymn = the image of the invisible Father, the firstborn-Heir (rank, NOT first creature made — 1:16 makes him the AGENT of creation), in whom the Father set all fulness (Gen 1 / Prov 8 / Ps 89 / Wisdom 7 — NOT co-equal-persons, NOT Arian); ★★ ch2:14 handwriting-of-ordinances = the cancelled CERTIFICATE OF DEBT / dividing decree (Isa 43:25 / 44:22 / Eph 2:15), NOT the Torah; ★★ ch2:16–17 let-no-man-judge = the feasts/new-moons/sabbaths are a shadow STILL kept, the body is Messiah's (Lev 23 / Isa 66:23 / Ezek 46 / Heb 10:1 — NOT abolished) ON BLESSING LIST. |
| **1 Thessalonians** | 5 | ✅ | ✅ | ✅ | **complete (S233)** — 1–5 full library, **17 threads/72 members LIVE** in prod (band 8050–8159, migration session233, applied + reconciled 2026-06-14, 0 orphans, 0 unresolved). ★★ ch4:13–18 the resurrection + caught-up = the ONE great ingathering at the last trump (Isa 27:13 / Dan 12:2 / Ezek 37 / 1 Cor 15:52 / Matt 24:31 — NOT a secret pre-trib rapture severed from Israel); ★ ch5:2 the day of Yahuah as a thief / sons of light (Joel 2 / Amos 5:18-20 / Isa 59:17 armour); ⚠ ch2:14–16 the persecutors = the SPECIFIC prophets-killers, NOT a curse on Israel (Neh 9:26 / Rom 11:1-2 guard) ON BLESSING LIST. |
| **2 Thessalonians** | 3 | ✅ | ✅ | ✅ | **complete (S234)** — 1–3 full library, **14 threads/42 members LIVE** in prod (band 8200–8259, migration session234, applied + reconciled 2026-06-14, 0 orphans, 0 unresolved). ★ ch1:7–8 revealed in flaming fire (Isa 66:15-16 / Dan 7); ★★ ch2:3–4 the man of sin who exalts himself above all = the antichrist already drawn in the Tanakh = Daniel's little horn (Dan 11:36 / 7:25 / 8:25 + Isa 14:13-14 + Ezek 28:2; consumed by the breath of his mouth Isa 11:4) — the falling away / the temple are NOT Israel cast off, the deceiver is the counterfeit ON BLESSING LIST. |
| 1 Timothy | 6 | ⬜ | ⬜ | ⬜ | greenfield |
| 2 Timothy | 4 | ⬜ | ⬜ | ⬜ | greenfield |
| Titus | 3 | ⬜ | ⬜ | ⬜ | greenfield |
| Philemon | 1 | ⬜ | ⬜ | ⬜ | greenfield |
| **Hebrews** | 13 | ✅ | ✅ | ✅ | **complete** — 1–13 full library, 66 threads/203 members live (S222, band 7900–7993). 7 (Melek Tsadiq) · 8 & 10 (new covenant) ON BLESSING LIST. |
| James | 5 | ⬜ | ⬜ | ⬜ | greenfield |
| 1 Peter | 5 | ⬜ | ⬜ | ⬜ | greenfield — ch3 descent-to-the-dead |
| 2 Peter | 3 | ⬜ | ⬜ | ⬜ | greenfield |
| 1 John | 5 | ⬜ | ⬜ | ⬜ | greenfield |
| 2 John | 1 | ⬜ | ⬜ | ⬜ | greenfield |
| 3 John | 1 | ⬜ | ⬜ | ⬜ | greenfield |
| Jude | 1 | ⬜ | ⬜ | ⬜ | greenfield — quotes 1 Enoch (extras-critical) |

NT total: **260 chapters.**

---

## PHASE 1 — Finish Acts (band 5000–5999) · ✅ COMPLETE

**Acts is fully covered, chapters 1–28** — 130 cross-reference threads / 428 members live in
prod (band 5000–5965). Built per-chapter (1–13 in ranges, 14–28 one chapter per minion, in
sequential packs of 5). Every range passed five gates plus a prod-DB resolution check
(`scratch_xref_acts/resolve_check.py` — 0 silently-dropped rows). Fragments
`scratch_xref_acts/minion_acts_*.sql`; assembled migration
`data-schema/migrations/session217_acts_cross_references.sql` (applied to prod 2026-06-09).

**FOR YOSHI'S BLESSING** (landed, flagged for review — high-voice-risk passages):
- **Acts 10–12** — Cornelius / "the Gentiles" held as the scattered seed gathered (RL #7/#11).
- **Acts 15** — Jerusalem council: Amos 9 tabernacle-of-David = twelve-tribe restoration; the
  four prohibitions = Lev 17–18 ger terms; no sola-fide truncation of 15:11.
- **Acts 28** — Isaiah 6:9-10 blindness read as Romans 11 *in part, for a season* (not
  permanent rejection); 28:28 salvation-to-the-Gentiles = the dispersed gathered, not Israel
  replaced.

Per-chapter minion model (load yoshi-voice fresh, five gates + resolve_check, packs of ~5
applied sequentially) is **proven for the rest of the NT** — reuse it book by book.

---

## PHASE 2 — Greenfield epistles + Revelation

Built book-by-book on the same model. Bands allocated to avoid collision (John used 3000/4000,
Acts 5000s).

| Book | Band | Suggested minion ranges | # |
|------|-----:|-------------------------|--:|
| ~~Romans (16)~~ | 6000 | ✅ COMPLETE (S219) — 4 packs: 1–5 · 6–8 · **9–11 (olive tree, blessing list)** · 12–16. 91 threads/285 members live (band 6000–6381). | ✅ |
| 1 Corinthians (16) | 6600 | 1–4 · 5–7 · 8–10 · 11–12 · 13–14 · 15–16 (resurrection) | 6 |
| ~~2 Corinthians (13)~~ | 7000 | ✅ COMPLETE (S229) — 4 packs: 1–4 · 5–7 · **8–9 (collection, blessing)** · 10–13. 40 threads/141 members live (band 7000–7303). ★ch3 letter-vs-spirit + ★ch6 come-out-be-separate on blessing list. | ✅ |
| Galatians (6) | 7200 | **1–2 · 3–4 · 5–6** (HIGH risk — *The Galatians Lie* terrain; works-of-law, curse=Deut 28) | 3 |
| ~~Ephesians (6)~~ | 7400 | ✅ COMPLETE (S230) — per-chapter minions; 21 threads/94 members live (band 7400–7531). ch2 two-houses/middle-wall + grace-unto-works, ch5 bride=Israel-restored, ch6 Torah-affirmed + whole-armour ON BLESSING LIST. | ✅ |
| Philippians (4) | 7500 | 1–4 | 1 |
| Colossians (4) | 7550 | 1–4 | 1 |
| 1 Thessalonians (5) | 7600 | 1–3 · 4–5 (the gathering/resurrection) | 2 |
| 2 Thessalonians (3) | 7660 | 1–3 (the man of lawlessness) | 1 |
| 1 Timothy (6) | 7700 | 1–3 · 4–6 | 2 |
| 2 Timothy (4) | 7760 | 1–4 | 1 |
| Titus (3) | 7800 | 1–3 (grace→good-works, RL #10) | 1 |
| Philemon (1) | 7820 | 1 | 1 |
| ~~Hebrews (13)~~ | 7900 | ✅ COMPLETE (S222) — 5 packs: 1–2 · 3–4 · **5–7 (Melek Tsadiq)** · **8–10 (new covenant/Jer 31)** · 11–13. 66 threads/203 members live (band 7900–7993, step 1 ~7-wide/ch since slot is only 7900–7999). 7/8/10 on blessing list. NOTE: per-chapter step-1 banding (not the Acts/Romans 25-wide) because James=8000. | ✅ |
| James (5) | 8000 | 1–3 · 4–5 (faith-and-works, do NOT read in Reformation grammar) | 2 |
| 1 Peter (5) | 8100 | 1–2 · 3–5 (ch3 descent-to-the-dead, RL #11) | 2 |
| 2 Peter (3) | 8200 | 1–3 (Watcher-judgment → 1 Enoch/Jude) | 1 |
| 1 John (5) | 8300 | 1–3 · 4–5 (the 1234 filter, 1 John 2:3–4) | 2 |
| 2 John (1) + 3 John (1) | 8400 | both short letters in one minion | 1 |
| Jude (1) | 8450 | **solo** — quotes 1 Enoch 1:9 + Assumption of Moses (extras-critical) | 1 |
| ~~Revelation (22)~~ | 9000 | ✅ COMPLETE (S224) — 7 packs: 1–3 · 4–5 · 6–8 · 9–11 · **12–14 (kaph 14:14, keep-commandments)** · 15–18 · 19–22. 149 threads/633 members live (band 9000–9546). KAPH + 144k + commandments + New Jerusalem ON BLESSING LIST. | ✅ |

Phase-2 subtotal: **~52 minions.**

---

## PHASE 3 — Parity backfills (existing canon-only → full library)

Lower priority; the canon layer already renders for these. NT-to-NT + extras parity to match John.

| Book | Band | Work | # |
|------|-----:|------|--:|
| Mark (16) | 12000 | NT-to-NT layer (canon + extras already done) | ~4 |
| Luke (24) | 12500 | NT-to-NT layer (canon + extras already done) | ~6 |
| Matthew (28) | 13000 | NT-to-NT layer (optional — extras already full) | ~7 |

---

## TOTALS & SEQUENCING

- **Phase 1 (finish Acts):** 11 minions
- **Phase 2 (greenfield epistles + Revelation):** ~52 minions
- **Phase 3 (parity backfills):** ~17 minions
- **Grand total remaining: ~80 range-minions.**

Suggested order: ~~finish Acts~~ → ~~Romans~~ → ~~Hebrews~~ → **Galatians (NEXT, band 7200, HIGH voice-risk)** →
Revelation (kaph carve-outs Rev 1:13/14:14, band 9000) → the shorter epistles → Phase 3 backfills last.

**FOR YOSHI'S BLESSING (Hebrews, S222)** — landed, flag for review (verbatim summary_md in the S222
minion-return transcripts):
- **Hebrews 7** (Melek Tsadiq priesthood) — the priesthood-change of 7:12 read as the change of the
  law *regulating who serves at the altar* (the carnal-descent ordinance; priest now from Judah after
  Melek Tsadiq), NOT the moral Torah/Sabbath/feasts; centerpiece Gen 14 + Ps 110:4, with Zech 6:12–13
  (the BRANCH priest-king joining king + priest).
- **Hebrews 8** (new covenant) — Jer 31:31–34 quoted in full = the SAME Torah moved from tablets of
  stone to mind/heart (+ Ezek 36:26–27, Deut 30:6); 8:13 "vanisheth away" = the old priestly/sacrificial
  administration, sealed with Jer 31:35–36 (the ordinances of sun/moon/stars do not depart).
- **Hebrews 10** ("taketh away the first") — 10:9 = the animal-sacrifice system replaced by the once-for-all
  offering (Ps 40:8 *thy law is within my heart*; John 19:30), Jer 31 re-quoted (10:16–17), NOT Torah abolished.

### How to run it (from your phone, via Dispatch)
- **One range:** *"Do the next range from the NT roadmap."* — I pick up the next unfinished row,
  load the voice skill, author, run all five gates, checkpoint the fragment, report.
- **A wave:** *"Run the next 3 ranges from the NT roadmap."* — runs them in sequence on the home
  machine; each finished fragment is saved before the next starts.
- **Hands-off:** *"Work the NT roadmap until you need me or hit a stopping point."* — marches down
  the list; stops to surface any HIGH-voice-risk range for your review before it lands, and at the
  context ceiling, where you resume with one line (nothing finished is redone).

You do **not** re-supply the protocol or the prompts each time — they live here. You point at the
roadmap; the standing protocol (load voice skill first, full library, coverage checklist, five
gates) is automatic.
