# 1 Corinthians cross-reference build — framing decision record (S228)

Per-passage record of every contested / load-bearing / framework-sensitive decision, so that if Yoshi
later flags an error in the app we can trace every sibling passage that shares the same framing and
fix them as a batch. Migration `session228_1corinthians_cross_references.sql`, band 6600–6975,
book slug `1-corinthians` (id 716). Worktree `/tmp/epistles-wt`, branch `feat/corinthians-xref`.

Framework anchors applied throughout (from MINION_BRIEF_1CORINTHIANS.md):
- Torah not abolished — it is the letter's air; grace and Torah not opposed.
- "Works of the law" / Galatians-Lie reading where justification language surfaces: the excluded
  boast is the FLESH-CREDENTIAL boast (wisdom/status/party-loyalty), never Torah-keeping.
- No replacement theology; the grafted-in are made one with Israel (the gathered seed), not a church
  that replaced Israel.
- NT-Lord governing rule: OT YHWH citations render *Yahuah (LORD)*; Yahusha-titular *Lord* stays
  *Lord* — preserve exactly what the pull gives.
- Christology = the Formed: one Elohim the Father, one Lord Yahusha through whom are all things
  (8:6); the spiritual Rock that followed Israel is the Messiah (10:4).
- Bodily (not platonic) resurrection in ch15.

---

## PACK 1 (ch1–4) — LIVE in prod, applied 2026-06-11, exact reconciliation (commit c3da8bb)
14 threads / 44 cross_refs / 44 members, per-ch 3/3/4/4, band 6600–6684. Five gates green
(verify_fidelity 44/44, offline_resolve 0/116, full-library audit [PASS], LIVE resolve_check 0
unresolved, pglast 68 stmts on the assembled migration).

### Load-bearing / framework-sensitive decisions:
- **1:31 *let him glory in Yahuah (LORD)* (slug `...let-him-glory-in-yahuah-no-flesh-shall-boast-jeremiah-9`)**
  — built on Jeremiah 9:23–24 (the actual cited verse). DECISION: the boast excluded at *no flesh
  should glory in his presence* (1:29) is the **flesh-credential boast** — wisdom, might, riches,
  AND party-loyalty (*I am of Paul... of Apollos*, 1:12) — NOT Torah-keeping. NT-Lord rule: 1:31
  renders *Yahuah (LORD)* because Paul quotes the YHWH text of Jer 9:24. **This is the canonical
  flesh-credential/Galatians-Lie framing for 1 Cor; sibling passages: 3:21 (glory not in men), 4:7
  (what hast thou that thou didst not receive), 6:11.**
- **1:12 divisions** — deliberately NOT given its own thin thread; party-loyalty-as-flesh-credential
  folded into the Jeremiah-9 no-flesh-glory thread (kept the weave in one mind). If Yoshi wants a
  standalone divisions thread, note the decision was curation, not omission.
- **3:16 *ye are the temple of Elohim* (slug `...ye-are-the-temple-of-god-and-his-spirit-dwelleth-in-you-leviticus-26`)**
  — built on Leviticus 26:11–12 + Exodus 25:8 / 29:45 (the tabernacle-dwelling promise) + 1 Peter
  2:5 / Ephesians 2:21. DECISION: the indwelling is the covenant tabernacle promise consummated, not
  a new disembodied spirituality. **Sibling: 6:19 (body = temple of the Holy Spirit) — same Lev-26
  root; build ch6 on the same thread family.**
- **4:7 *what hast thou that thou didst not receive*** — bound back to Jeremiah 9:23–24 (the same
  flesh-credential root as 1:31), explicitly. Sibling of the 1:31 framing.
- **4:9–13 the apostles a spectacle / *the filth of the world*** — built on Isaiah 53:3 + Psalm 22:6
  + Lamentations 3:45 + Wisdom of Solomon 2:12–20 (the righteous one set up for a shameful death).
  DECISION: the suffering-apostle pattern read as the suffering-servant pattern, not stoic heroism.
- **Extras discipline:** ch1/2 lean on Wisdom of Solomon (1–2 world-wisdom, 3:1–9 hope-of-immortality,
  9 wisdom-from-above) + Sirach 1 (fear of Yahuah = wisdom; 1:26 keep-the-commandments woven as the
  true-wisdom counter). ch3 correctly carries ZERO extras (world-wisdom material belongs in ch1–2);
  ch4 one clean extras add (Wisdom 2). No forced parallels.
- **2:14–15 natural vs spiritual man** — deliberately "none warranted" on an extras two-spirits/soul
  parallel: forcing one would invite the platonic body/soul-dualism misreading the frame forbids.
  Carried in prose only.

---

## PACK 2 (ch5–7) — LIVE in prod, applied 2026-06-11. Two blessing-list watchpoints landed.
11 threads / 39 cross_refs / 39 members, per-ch 4/4/3, band 6700–6756.

### Load-bearing / framework-sensitive decisions:
- **★ BLESSING — 5:7–8 *Messiah our passover... keep the feast* (slug `1-corinthians-5-christ-our-passover-keep-the-feast-exodus-12`)**
  — built on Exodus 12:5/13/15/8, Exodus 13:7, Leviticus 23:5–6, Deuteronomy 16:3 + NT lamb echoes
  (John 1:29, 1 Peter 1:19). DECISION: *let us keep the feast* = the feast **affirmed and filled,
  NOT abolished**; Messiah is the Passover Lamb, the unleavened bread = *sincerity and truth.* The
  literal leaven swept from the house → malice/wickedness swept from the assembly. tier=free (all
  canon). **This is the canonical feast-keeping framing for the letter; sibling: 11:23–25 the supper
  = the Passover/new-covenant memorial (ch11).** Full summary_md surfaced to Yoshi in the S228 receipt.
- **5:13 *put away that wicked person* (slug `...put-away-the-wicked-person-from-among-you-deuteronomy-13`)**
  — built on the recurring Torah formula Deuteronomy 13:5/17:7/19:19/21:21/22:21/24:7. DECISION:
  Paul settles the discipline case BY the law — no law-vs-grace antithesis, no church-replacing-Israel.
- **★ BLESSING — 7:19 *circumcision is nothing... but the keeping of the commandments of Elohim*
  (slug `1-corinthians-7-circumcision-is-nothing-but-the-keeping-of-the-commandments-deuteronomy-30`)**
  — built on Deuteronomy 30:11/14/16 (the commandment near, to be DONE) + Ecclesiastes 12:13 (keep
  his commandments, the whole duty of man) + Ecclesiasticus 15:15 (extras: keep the commandments,
  perform acceptable faithfulness). tier=extras. DECISION: **the thesis of the whole framework — the
  flesh-credential is nothing, the keeping of the commandments is everything; NO Torah-abolition, NO
  law-vs-grace.** This is the load-bearing keeping-the-commandments framing for 1 Cor; **sibling of
  the Galatians erga-nomou / Romans 3:31 establish-the-law readings.** Full summary_md surfaced to
  Yoshi in the S228 receipt.
- **7:18,20,24 abide-in-calling** — DECISION: the circumcised not becoming uncircumcised = the
  distinction of Israel and the nations NOT erased; each abides. (Guards against a "neither-Jew-nor-
  Greek erases the tribes" misread — consistent with the Galatians 3:28 access-not-erasure framing.)
- **6:11 *but ye are washed... sanctified... justified*** — justification language: DECISION the
  redeemed are *washed* in the name of the Lord Yahusha and by the Spirit, **not a flesh-credential
  earned**; weight carried in prose + bound to the temple-holiness thread, not forced onto a verbal
  coincidence. Sibling of the 1:31 / 4:7 flesh-credential framing.
- **6:19–20 body = temple of the Holy Spirit (slug `...your-body-is-the-temple-of-the-holy-spirit-leviticus-26`)**
  — SAME Leviticus 26:11–12 + Exodus 25:8 tabernacle-indwelling root as the **3:16** corporate-temple
  thread; framing kept consistent and the prose explicitly cross-names 3:16. If Yoshi edits one, edit
  both (3:16 corporate / 6:19 individual, one covenant indwelling).
- **6:2 *the saints shall judge the world*** — built on Daniel 7:22,27 (judgment given to the saints,
  the kingdom possessed). DECISION: Matthew 19:28 (twelve thrones over Israel's tribes) deliberately
  NOT used — distinct frame; Daniel 7 carries it directly.
- **Extras discipline:** ch5/ch6 correctly carry ZERO extras (discipline + body-temple are wholly
  canon-rooted); ch7 one clean extras add (Sirach 15:15). No forced parallels.

---

## PACK 3 (ch8–10) — LIVE in prod, applied 2026-06-11. HIGH-watchpoint pack (idol-food, wilderness types).
12 threads / 43 cross_refs / 43 members, per-ch 3/4/5, band 6775–6837.

### Load-bearing / framework-sensitive decisions:
- **★ Christology — 8:4–6 one Elohim the Father / one Lord Yahusha (slug `1-corinthians-8-but-to-us-one-elohim-the-father-and-one-lord-the-shema-deuteronomy-6`)**
  — built on the Shema (Deut 6:4) + Deut 4:35,39 + Mark 12:29,32. DECISION: the Father is the One
  *of whom are all things*; Yahusha is the Formed Son *by whom are all things* — explicitly **NOT a
  second separate God, NOT the Father in a mask (modalism), NOT a mere man exalted.** "The oneness is
  not broken; it is unfolded." This is the canonical Formed-Christology framing for the letter (cf.
  10:4 Rock=Messiah, 15:24–28 the Son delivers the kingdom to the Father). Summary surfaced to Yoshi.
- **★ 8:1–13 idol-food NOT dietary-law abolition (slug `...the-weak-brother-for-whom-messiah-died-the-stumblingblock-romans-14`)**
  — DECISION the chapter is about meat sacrificed to idols + the weak conscience; the thread prose
  **explicitly states "no abolishing of any food-law, no setting aside of clean and unclean."**
  Guards the Leviticus-11 clean/unclean law. **Sibling: ch10 cup/table-of-devils, Romans 14, Acts
  15 — the idol-food cluster; if Yoshi reviews one, this is the controlling framing.**
- **★ 9:20–21 *not without law to Elohim, but under the law to Messiah* (slug `1-corinthians-9-not-without-law-to-elohim-but-under-the-law-to-messiah-psalm-40`)**
  — built on Psalm 40:8 (thy law within my heart) + Jeremiah 31:33 (law written on the heart).
  DECISION: **missionary accommodation, NEVER Torah-abandonment** — the governing parenthesis is
  *being not without law to Elohim,* *ennomos Christou* (Torah-bound to the Messiah). This is the
  single most abuse-prone verse in the chapter; the framing pins it. Summary surfaced to Yoshi.
- **9:8–14 apostolic support from the law** — Deut 25:4 (unmuzzled ox) + Numbers 18:8 / Deut 18:1
  (Levitical portion) + Luke 10:7. DECISION: Paul grounds gospel-support IN the law of Moses — Torah
  as living authority, not abrogated.
- **★ BLESSING — 10:1–4 *our fathers... the Rock was Messiah* (slug `1-corinthians-10-our-fathers-under-the-cloud-and-the-rock-that-was-messiah-exodus-17`)**
  — built on Exodus 13:21, 14:22, 16:15, 17:6, Numbers 20:11. DECISION: *our fathers* to a
  nations-background assembly = **the grafted-in made ONE with Israel, the commonwealth enlarged, NOT
  a church that replaced Israel** (two-house/grafting frame); the Rock = the Formed Messiah already
  with Israel in the wilderness. Summary surfaced to Yoshi.
- **10:7–11 the wilderness types *written for our admonition*** — Exodus 32:6 (calf), Numbers 25
  (Peor), Numbers 21:5–6 (serpents), Numbers 14/16 (murmuring) + Wisdom 14:12 (idolatry-with-
  fornication). DECISION: **the Torah narratives are BINDING instruction for the assembly, not
  abrogated history** (10:11 *ensamples... written for our admonition*).
- **10:21 cup/table of the Lord vs of devils** — Deut 32:17 (sacrificed unto devils not Elohim) +
  Wisdom 14:27 (idolatry the beginning/cause/end of all evil). 10:26 *the earth is Yahuah's* on
  Psalm 24:1. NT-Lord rule preserved: 10:21–22,26,28 titular/citation *Yahuah (Lord)* kept verbatim.
- **Extras discipline:** ch8 Wisdom 13–14 (idols nothing), ch9 Sirach 18:30 (the temperate athlete),
  ch10 Wisdom 14:12/27 (idolatry+fornication). All clean apocrypha pulls, load-bearing.

---

## PACK 4 (ch11–12) — LIVE in prod, applied 2026-06-11.
5 threads / 24 cross_refs / 24 members, per-ch 2/3, band 6850–6881.

### Load-bearing / framework-sensitive decisions:
- **★ 11:23–25 *this cup is the new covenant in my blood* (slug `1-corinthians-11-this-cup-is-the-new-covenant-in-my-blood-exodus-24-jeremiah-31`)**
  — built on Exodus 24:8 (blood of the covenant at Sinai) + Jeremiah 31:31,33 (new covenant WITH the
  house of Israel AND the house of Judah, law written on the heart) + Exodus 12:14 (Passover memorial
  for ever) + Luke 22:19–20 / Matthew 26:26–28. DECISION: **the supper is the covenant-Passover
  memorial of Israel's Elohim renewed in the Messiah's blood — NOT a new rite that left Israel
  behind; the new covenant of Jer 31 is made WITH the two houses, not replacing them; it writes the
  law on the heart (a law-written people, not a people released from the commandments).** Sibling of
  the ch5 keep-the-feast Passover framing. Summary surfaced to Yoshi.
- **11:3,7–9 head-covering / creation order (slug `...the-head-of-the-woman-and-the-glory-of-creation-order-genesis-1-2`)**
  — built on Genesis 1:26–27, 2:18,21,23. DECISION: order of glory, NOT ranking of worth; held in
  balance by the 11:11–12 counterweight (*neither is the man without the woman... in the Lord... all
  things of Elohim*). 11:3 *the head of Messiah is Elohim* = the Formed Son ordered under the Father
  (no co-equal-persons grammar). NT-Lord rule: supper *Lord* = Yahusha titular throughout; 11:32
  chastening *Yahuah (the Lord)* — both preserved verbatim.
- **★ 12:13 *by one Spirit baptized into one body, whether Jews or Gentiles* (slug `1-corinthians-12-by-one-spirit-baptized-into-one-body-jews-and-gentiles-made-one-ezekiel-37`)**
  — built on **Ezekiel 37:19,22 (the two sticks made one nation)** + Romans 12:5 + Ephesians 4:4.
  DECISION: **the one body = Israel-and-the-grafted made ONE, the two-house regathering, NOT a
  replacement people.** This is the canonical two-house framing for the "one body" figure across the
  letters (sibling: Ephesians 2 middle-wall, the next book's ch2 watchpoint). Honest Tanakh anchoring
  on the one genuine root rather than forcing OT verses onto the NT-internal gift-lists.
- **12:3 Spirit-given confession** — Matthew 16:16–17 + Romans 10:9. **12:4–11 gift-triad
  deliberately carries NO forced Shema/OT root** (the chapter is not mounting a one-Elohim argument);
  honest "none warranted" rather than a weak verbal coincidence.
- **Extras:** ch11 and ch12 both correctly carry ZERO extras (creation-order, supper, and one-body
  are Tanakh+NT weaves; no load-bearing extra-canonical witness). Recorded honestly.
