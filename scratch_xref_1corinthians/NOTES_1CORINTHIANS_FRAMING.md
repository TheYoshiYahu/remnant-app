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
