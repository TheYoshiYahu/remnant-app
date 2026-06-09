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
| **Acts** | 28 | 🟦 1–13 | 🟦 1–13 | 🟦 1–13 | **in progress** — 1–13 done, 14–28 to build |
| Romans | 16 | ✅ (canon-only) | ⬜ | ⬜ | full-library build (complements existing canon) |
| Galatians | 6 | ✅ (canon-only) | ⬜ | ⬜ | full-library build — HIGH voice-risk |
| Revelation | 22 | ✅ (canon-only) | ⬜ | ⬜ | full-library build — kaph carve-outs |
| 1 Corinthians | 16 | ⬜ | ⬜ | ⬜ | greenfield |
| 2 Corinthians | 13 | ⬜ | ⬜ | ⬜ | greenfield |
| Ephesians | 6 | ⬜ | ⬜ | ⬜ | greenfield — ch2 voice-risk |
| Philippians | 4 | ⬜ | ⬜ | ⬜ | greenfield |
| Colossians | 4 | ⬜ | ⬜ | ⬜ | greenfield |
| 1 Thessalonians | 5 | ⬜ | ⬜ | ⬜ | greenfield |
| 2 Thessalonians | 3 | ⬜ | ⬜ | ⬜ | greenfield |
| 1 Timothy | 6 | ⬜ | ⬜ | ⬜ | greenfield |
| 2 Timothy | 4 | ⬜ | ⬜ | ⬜ | greenfield |
| Titus | 3 | ⬜ | ⬜ | ⬜ | greenfield |
| Philemon | 1 | ⬜ | ⬜ | ⬜ | greenfield |
| Hebrews | 13 | ⬜ | ⬜ | ⬜ | greenfield — Tanakh-dense, Melek Tsadiq |
| James | 5 | ⬜ | ⬜ | ⬜ | greenfield |
| 1 Peter | 5 | ⬜ | ⬜ | ⬜ | greenfield — ch3 descent-to-the-dead |
| 2 Peter | 3 | ⬜ | ⬜ | ⬜ | greenfield |
| 1 John | 5 | ⬜ | ⬜ | ⬜ | greenfield |
| 2 John | 1 | ⬜ | ⬜ | ⬜ | greenfield |
| 3 John | 1 | ⬜ | ⬜ | ⬜ | greenfield |
| Jude | 1 | ⬜ | ⬜ | ⬜ | greenfield — quotes 1 Enoch (extras-critical) |

NT total: **260 chapters.**

---

## PHASE 1 — Finish Acts (band 5000–5999) · 6 minions remaining

Done: **1–2** (5000–5099, 9 threads), **3–5** (5100–5199, 11 threads — fragment
`scratch_xref_acts/minion_acts_03_05.sql`), **6–7** (5200–5270, 8 threads — fragment
`scratch_xref_acts/minion_acts_06_07.sql`; Stephen's speech, Checklist-9 watchpoint held —
the stiffnecked/persecute-the-prophets charge framed as covenant-internal conduct rebuke,
not ethnic), **8–9** (5300–5360, 7 threads — fragment `scratch_xref_acts/minion_acts_08_09.sql`;
Samaria/the Ethiopian/Saul's call), **10–12** (5400–5470 — fragment
`scratch_xref_acts/minion_acts_10_12.sql`; Cornelius held as scattered-seed gathering, FOR
YOSHI'S BLESSING), **13** (5500–5570 — fragment `scratch_xref_acts/minion_acts_13.sql`;
Antioch sermon). All passed five gates (incl. prod-DB resolution check: 0 dropped rows).
Remaining:

Sort sub-bands widened to 100 each (a dense range can need 11+ threads — 3–5 used
5100–5180; the old 50-wide spacing was too tight). Each range gets its own 100-band:

| Minion | Chapters | Sort | Density / voice notes |
|--------|----------|-----:|-----------------------|
| acts-14-15 | 14–15 | 5600 | **HIGH voice-risk** — council + Amos 9 = twelve-tribe restoration, not new-people graft |
| acts-16-18 | 16–18 | 5700 | Philippi, Athens (Areopagus — the nations, not covenant inclusion) |
| acts-19-20 | 19–20 | 5800 | Ephesus, the Miletus farewell |
| acts-21-23 | 21–23 | 5900 | Paul Torah-observant in the temple (Acts 21 — the dropped-Paul correction) |
| acts-24-26 | 24–26 | 5950 | the defenses before Felix/Festus/Agrippa |
| acts-27-28 | 27–28 | 5975 | the voyage, Rome, Isaiah 6 closing |

---

## PHASE 2 — Greenfield epistles + Revelation

Built book-by-book on the same model. Bands allocated to avoid collision (John used 3000/4000,
Acts 5000s).

| Book | Band | Suggested minion ranges | # |
|------|-----:|-------------------------|--:|
| Romans (16) | 6000 | 1–3 · 4–5 · 6–8 · **9–11 (olive tree, RL #11 critical)** · 12–13 · 14–16 | 6 |
| 1 Corinthians (16) | 6600 | 1–4 · 5–7 · 8–10 · 11–12 · 13–14 · 15–16 (resurrection) | 6 |
| 2 Corinthians (13) | 7000 | 1–4 · 5–7 · 8–9 · 10–13 | 4 |
| Galatians (6) | 7200 | **1–2 · 3–4 · 5–6** (HIGH risk — *The Galatians Lie* terrain; works-of-law, curse=Deut 28) | 3 |
| Ephesians (6) | 7400 | 1–3 · 4–6 (ch2 afar-off/middle-wall = two houses, RL #7) | 2 |
| Philippians (4) | 7500 | 1–4 | 1 |
| Colossians (4) | 7550 | 1–4 | 1 |
| 1 Thessalonians (5) | 7600 | 1–3 · 4–5 (the gathering/resurrection) | 2 |
| 2 Thessalonians (3) | 7660 | 1–3 (the man of lawlessness) | 1 |
| 1 Timothy (6) | 7700 | 1–3 · 4–6 | 2 |
| 2 Timothy (4) | 7760 | 1–4 | 1 |
| Titus (3) | 7800 | 1–3 (grace→good-works, RL #10) | 1 |
| Philemon (1) | 7820 | 1 | 1 |
| Hebrews (13) | 7900 | 1–2 · 3–4 · **5–7 (Melek Tsadiq)** · 8–10 (new covenant/Jer 31) · 11–13 | 5 |
| James (5) | 8000 | 1–3 · 4–5 (faith-and-works, do NOT read in Reformation grammar) | 2 |
| 1 Peter (5) | 8100 | 1–2 · 3–5 (ch3 descent-to-the-dead, RL #11) | 2 |
| 2 Peter (3) | 8200 | 1–3 (Watcher-judgment → 1 Enoch/Jude) | 1 |
| 1 John (5) | 8300 | 1–3 · 4–5 (the 1234 filter, 1 John 2:3–4) | 2 |
| 2 John (1) + 3 John (1) | 8400 | both short letters in one minion | 1 |
| Jude (1) | 8450 | **solo** — quotes 1 Enoch 1:9 + Assumption of Moses (extras-critical) | 1 |
| Revelation (22) | 9000 | 1–3 (letters) · 4–5 (throne) · 6–8 · 9–11 · **12–14 (kaph at 14:14)** · 15–18 · 19–22 | 7 |

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

Suggested order: finish Acts → Romans → Hebrews → Galatians → Revelation (the doctrinally
load-bearing, high-voice-risk books while attention is fresh) → the shorter epistles → Phase 3
backfills last.

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
