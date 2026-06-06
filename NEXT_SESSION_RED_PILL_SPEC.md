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

## Open questions — ANSWERED (Yoshi, S204 open — transcribed)
1. **One mark** for all four classes — the class lives on the card,
   not the mark.
2. **Mark color: same as Notes (scarlet register), unless a better
   dedicated treatment is proposed** — Yoshi's words: "same color as
   notes, unless you think you can come up with a better one." The
   proof render shows the scarlet treatment AND a proposed dedicated
   blood-red treatment side by side; Yoshi picks at proof sign-off.
3. **Free — the proclamation surface.** The awakening door; it
   converts something bigger than subscriptions.
4. **V1 scope: FULL-CANON sweep from the start** (not the
   gospels-first slice).
5. **Extras (1 Enoch 46-71 etc.): wave 2.** Canon-only V1.
6. **Reader-facing name: "The Witness."** Red Pill stays the working
   title between us (sessions, file names, internal docs); the
   toggle and cards say "The Witness" to the partner.

## Session shape (earned discipline — proof first)
1. Open sweep: on-device My Study check + spectral pill, alephbet
   cleanup commit if not done, Matthew 1 citations if wanted.
2. Yoshi answers the six questions above.
3. Proof render of the marked reader + one tap-card (e.g., John 8:58
   ↔ Exodus 3:14) — sign-off BEFORE schema or wiring.
4. Schema + toggle + card surface; seed with a hand-curated starter
   set (~20-30 strongest members) loaded idempotently.
5. Minion sweep + checker for the V1 scope; loader from the Mac.

## NEXT AFTER THIS — THE BLUE PILL: THE KINGDOM (Yoshi, S204 — transcribed)
Yoshi, S204: "we need a special blue pill for what we will do next —
the kingdom." The companion overlay: where the Red Pill / Witness
marks every verse where the Formed claims the Tanakh's "I," the Blue
Pill marks the kingdom — the gathering of the twelve tribes, the
proclamation, the regathering promises and their NT landings (the
same fabric Ezekiel 34 already showed inside the Good Shepherd card).
Design notes locked now so S204's build carries it for free:
- S204 builds the surface PILL-GENERIC: mark component, tap-card
  surface, and overlay pattern take a register/pill parameter, so the
  Kingdom rides the same rails with a color swap + its own curated set.
- Register (Yoshi, S204 close — supersedes the earlier blue lean):
  NOT blue at all. **The Kingdom register is TWO-TONE: the EXISTING
  metallic emerald + metallic gold registers joined in one pill — the
  two sticks of Ezekiel 37:15-22** (the stick of Yahudah (Judah) and
  the stick of Yoseph in the hand of Ephrayim made ONE in his hand).
  Build from the exact chrome-metal gradients already shipped:
  emerald #04321E→#15A86A→#04321E (border #2EFFA1) for the left
  stick, gold #645028→#B4A078→#645028 (border #FCECAF) for the right
  stick, hard seam at center; border = blend #2EFFA1→#FCECAF (or
  Yoshi picks single-color border at proof). Emerald and gold are
  already the source-class registers (tanakh → emerald, nt → gold),
  so the joined pill reads as the two witnesses united — Yoshi:
  "uniting the old and new testament."
- **The Kingdom mark does NOT go into the scripture text** (Yoshi,
  S204 — no in-verse capsule/glyph like the Witness's). The joined
  register lives in the chrome toggle + the card surfaces; the
  reader-surface treatment (if any) is an open question for the
  Kingdom session.
- Scope, classes/taxonomy, tier, and name for the Kingdom surface:
  open questions for its own session spec. Note the Witness surface
  is already pill-generic (register prop + --pill-*-vars + the four
  partner styles) — the Kingdom needs only its --pill-kingdom-*
  variables, its curated set, and its own end-card explainer.

## Backlog unchanged behind this
Blue Pill — the Kingdom (next) · Maps rebuild
(NEXT_SESSION_MAPS_REBUILD_SPEC.md) · Timeline · Mark commentary
consolidation · cross-reference sweep (paused).
