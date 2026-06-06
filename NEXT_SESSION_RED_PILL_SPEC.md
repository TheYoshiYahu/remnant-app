# Next session — THE RED PILL (Yoshi's call, S203 close)

## The idea (Yoshi, verbatim intent)
The Red Pill marks every verse where the Messiah — or anyone speaking
of him — claims deity, PLUS every verse that is only possible if he is
the one who spoke to Moses and the prophets.

## What it is
The inverted red-letter Bible. Red-letter editions mark where he
speaks; the Red Pill marks where he claims to be Yahuah. A reader
toggle that marks the member verses across the WHOLE canon (and the
extras where they carry the witness), with a tap-card that unfolds
each claim come-and-see: both sides quoted in full, side by side —
the deity claim and the Tanakh anchor it lands on.

The framework's Christology as a product surface: the Father is the
Formless; Yahusha (Jesus) is the Formed — the one who appeared, spoke,
wrestled, and led Yashar'el (Israel) through the Tanakh, who came in
the flesh. The toggle lets the canon testify to that verse by verse.
Approached as what the inherited view MISSES, in good faith — never
argued down (voice-skill Nature-of-God posture, editorial checklist
10: no Trinity assumption, no modalism, the Formed/Formless framework
carries it).

## The engine — THE TRANSFER TEST (Yoshi, S203 close, deepened)
Every member verse passes one test: the NT gives Yahusha (Jesus) a
title, an act, or an argument that the Tanakh says belongs to Yahuah
ALONE — or that Yahuah said HE HIMSELF would do. Each card pairs the
claim with its Tanakh anchor, both quoted in full, and the reader
watches the transfer happen. There is no third reading: either he is
claiming the Tanakh's "I," or the claim is blasphemy — the card lets
the canon force the fork.

### Class 1 — Direct deity claims (his own mouth, or those speaking of him)
- John 8:58 → Exodus 3:14 (before Abraham was, I AM).
- John 10:30; John 14:9; John 20:28 (Thomas: my Lord and my Elohim).
- Mark 2:5-12 (who can forgive sins but Elohim alone?).
- Mark 14:62 → Daniel 7:13 (the kaph preserved on the card).
- Revelation 1:8, 1:17-18 → Isaiah 44:6 (First and Last).
- 1 Corinthians 12:3 — the Spirit-revealed equation.
- Philippians 2:9-11 → Isaiah 45:23 (every knee, every tongue).
- Receiving worship; Lord of the Sabbath; the rest of the sweep.

### Class 2 — Title transfer: Yahuah's own titles claimed
- **The Good Shepherd (the type specimen):** John 10:11, 14 →
  Ezekiel 34:11-16 (*I, even I, will search for my sheep... I will
  feed my flock, I will cause them to lie down*) + Psalm 23:1
  (Yahuah Ra'ah — Yahuah IS my shepherd). Yahuah said I MYSELF will
  shepherd; the Formed says I AM the shepherd. Bonus: the sheep
  being gathered in Ezekiel 34 are the scattered flock — the Red
  Pill and the gathering are one fabric.
- Bridegroom/Husband (Mark 2:19-20 → Hosea 2:16-20; Isaiah 54:5 —
  thy Maker is thine husband).
- Light, Rock, King of Yashar'el (Israel), the Holy One, and the
  full title sweep.

### Class 3 — Act transfer: acts the Tanakh ascribes to Yahuah alone
- **Coming to war with the nations:** Luke 21:25-27 → Zechariah
  14:3-4 (Yahuah goes forth and fights against those nations; his
  feet stand on the Mount of Olives) + Acts 1:11-12 (he ascends FROM
  the Mount of Olives and will so come in like manner — to the same
  mountain Zechariah gives to Yahuah's feet).
- Treading the sea: Mark 6:48 → Job 9:8 (which treadeth upon the
  waves of the sea).
- Cutting the new covenant: Luke 22:20 → Jeremiah 31:31 (Yahuah is
  the covenant-maker; Yahusha cuts it in his own blood).
- Gathering the scattered sheep: John 10:16; Matthew 15:24 →
  Ezekiel 34; Ezekiel 37:21.
- Judging the nations; stilling the sea; the rest of the sweep.

### Class 4 — Structural arguments: only possible if he is the Yahuah of Sinai
- **Romans 7:1-4 — THE FIRST HUSBAND DIED (the red pill of red
  pills):** the wife is bound by law while the husband lives; Yahuah
  divorced the northern house (Jeremiah 3:8); Deuteronomy 24:1-4
  bars her return to the first husband — an unsolvable dilemma
  UNLESS THE HUSBAND DIES. *Ye also are become dead to the law by
  the body of Messiah; that ye should be married to another, even
  to him who is raised from the dead.* Paul's mechanism for the
  regathering of the divorced house only functions if the one who
  died on the tree IS the husband who covenanted at Sinai. The
  Formed died; the freed wife is married to him raised — the
  remarriage Hosea promised, legally clean. One card, whole gospel.
- **John 14:15 → Exodus 20:6 / Deuteronomy 5:10:** *If ye love me,
  keep my commandments* is the second commandment's own self-
  description quoted in first person (*them that love ME, and keep
  MY commandments*). He claims the "me" of Sinai and the
  commandments as HIS commandments. (Also the standing answer to
  the grace-against-commandments lie — the Red Pill and the
  1 John 2:3-4 filter meet here.)
- John 12:41 → Isaiah 6 (Isaiah saw HIS glory); 1 Corinthians 10:4
  + 10:9 (the Rock was Messiah; they tempted Messiah in the
  wilderness); Jude 5 (the one who saved the people out of Egypt);
  John 1:18 + Exodus 33:20 (no man hath seen the Father — so who
  was seen?); Genesis 18-19; the Messenger-of-Yahuah appearances;
  Zechariah 12:10 (Yahuah: look upon ME whom they have pierced);
  Psalm 110; Isaiah 48:16.

Open design question: one mark for all four classes or differentiated?
(Lean: ONE Red Pill mark — the class lives on the card, not the mark;
the reader-facing signal stays simple. Yoshi decides.)

## Sourcing note (Yoshi's call, S203 close — transcribed)
Trinitarian "deity of Christ" verse lists online are extensive, and
this is about the ONLY topic where such lists are usable even as raw
input — but their placemarkers are Trinity-wrong, so: verse-numbers
only IF ever consulted as a coverage cross-check, ALL framing
discarded, every member re-derived through the transfer test and
gated by the checker. Yoshi's lean: we don't need them — the
framework generates the set natively. Treat external lists as an
optional completeness audit at the END of the sweep, never as the
seed.

## Architecture (proven pattern — same shape as xref threads / tool_annotations)
- Table: `red_pill_verses(id, verse_id, claim_class, card_md,
  anchor_refs, tier_required, ...)` — curated overlay on fixed text,
  loader idempotent, checker-gated. Exact columns at build time.
- Reader: toggle in the study-aids family; member verses carry the
  mark; tap → card unfolds the claim with both passages quoted in
  full (come-and-see, stand-alone italics, sacred names intact).
- Production: minion sweep book by book (gospels + the named Tanakh
  anchors first), checker minion gates EVERY entry against Red Line
  #12 (son of Adam restoration + kaph-comparative preserved at Daniel
  7:13 / Revelation 1:13 / 14:14 — those cards teach the kaph, never
  flatten it), checklist 10 (Nature of God), and the no-Trinity-
  assumption / no-modalism rails.

## Voice guardrails (non-negotiable, from the skill)
- The Formed/Formless framework carries every card. Never "second
  person of the Trinity"; never collapsing Father into Son.
- The Trinity treated as what the inherited view misses, in good
  faith — never argued down.
- Every quoted verse in full, on its own line, italics, citation at
  the end. No cite-without-quote. No appendix posture.
- Son of Adam restoration absolute; kaph-comparative preserved.
- The proclaimer steps aside: the cards put verses side by side and
  let the reader watch the canon read itself.

## Open questions for Yoshi at session open
1. One mark or two for the two claim classes?
2. The mark itself: red is the obvious register (it's the RED pill) —
   crimson from the 13-palette? A new register? (Scarlet chrome =
   Notes; techelet locked divine-names-only; the highlight palette's
   crimson is partner-marking vocabulary — probably want a dedicated
   Red Pill treatment so it never collides with partner marks.)
3. Tier: free as the missionary/proclamation surface (the awakening
   door), or part of a paid tier? (Lean: free — this is the
   proclamation, and it converts something bigger than subscriptions.)
4. Scope V1: gospels + John + Revelation + the named Tanakh anchors
   first (a compelling, complete-feeling slice), or full-canon sweep
   from the start?
5. Extras: do 1 Enoch 46-71 (the named Son of Adam / Elect One beside
   the Head of Days) and the other extras-witness passages join V1 or
   wave 2?
6. Name on the surface: "Red Pill" reader-facing, or an in-text name
   (e.g., "The Witness") with red-pill as the working title? (Matrix
   echo is the hook, but confirm Yoshi wants it reader-facing.)

## Session shape (earned discipline — proof first)
1. Open sweep: on-device My Study check + spectral pill, alephbet
   cleanup commit if not done, Matthew 1 citations if wanted.
2. Yoshi answers the six questions above.
3. Proof render of the marked reader + one tap-card (e.g., John 8:58
   ↔ Exodus 3:14) — sign-off BEFORE schema or wiring.
4. Schema + toggle + card surface; seed with a hand-curated starter
   set (~20-30 strongest members) loaded idempotently.
5. Minion sweep + checker for the V1 scope; loader from the Mac.

## Backlog unchanged behind this
Maps rebuild (NEXT_SESSION_MAPS_REBUILD_SPEC.md) · Timeline ·
Mark commentary consolidation · cross-reference sweep (paused).
