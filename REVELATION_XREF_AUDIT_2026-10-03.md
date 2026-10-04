# Revelation cross-reference audit against the settled order of the end and Revelation re-map (2026-10-02)

Audited: session224_revelation_cross_references.sql (Rev 1–22, 633 rows, ~149 threads), session181_revelation_xref_threads.sql (older layer, 204 rows, 17 threads), session233 1 Thessalonians 4–5. No Revelation xref migration has been edited since S224, so all of it predates the re-map.

## Clusters (fix as groups)

1. **1 Thess 4:16–17 fused into one event (S233).** The rows on 4:16 and 4:17 point to Ezek 37:12/14, Matt 24:31, 1 Cor 15:52, 2 Esd 7:32, 1 En 51:1, Isa 27:13 and Dan 12:2. Notes say "one trumpet, one resurrection, one ingathering", "caught up together… placed in the land", and "the same event as Matt 24:31". The thread `1-thessalonians-4-the-dead-in-messiah-rise-the-trump-of-gathering-isaiah-27-daniel-12` and the thread `…the-earth-gives-back-her-dead…-2-esdras-7-1-enoch-51` carry the same reading. The header frame comment (lines 13–22) says it too.
   - Fix: v16 is the coming in the wrath and the first resurrection of the righteous seed. The reign follows. v17 is Rev 11:12 "Come up hither". Drop the 4:17→Matt 24:31 pairing. The last trump of 1 Cor 15:52 is the 7th trumpet at the end.

2. **Two witnesses read as Moses and Elijah, individual prophets, before the Day.**
   - Where it appears:
     - S224 Rev 11:4–12 rows: Zech 4:11, 1 Kgs 17:1, Exod 7:17, Sir 48:1/3/9/10, 2 Kgs 2:11, Dan 7:21.
     - S224 threads: "fire out of their mouth… Moses and Elijah", "the two olive trees" ("dark season of the treading-down"), "beast from the pit slays them… Daniel 7", "spirit of life entered them… Ezekiel 37".
     - S181 thread `two-witnesses-and-the-two-olive-trees` and the rows 11:3→Mal 4:5 and Deut 18:15.
   - Fix: the witnesses are the two houses, prophesying 1,260 days in the reign and killed in the little season. Moses and Elijah are the pattern of their gifts. 11:11 is the righteous rising at the great resurrection, not a sign of it, and 11:12 is the 4:17 catching-up.

3. **Beasts collapsed together, with Daniel deciding Revelation.**
   - Where it appears:
     - Rev 11:7→Dan 7:21: the pit beast made into Daniel's horn.
     - Rev 13:1→Dan 7:3, 7:7 and 2 Esd 12:11, with the thread "the beast from the sea — Daniel's four beasts gathered into one".
     - Rev 13:5→Dan 7:25: "forty and two months = time, times and dividing of time".
     - Rev 17:3→Dan 7:3/7:7 and 17:12→Dan 7:24, with the thread "the woman on the scarlet beast… Daniel's fourth beast": the pit beast folded into the sea beast.
     - Rev 19:20→Dan 7:11 and its thread: "the beast of Revelation", "the burning flame is the lake of fire".
     - Rev 20:4/20:12→Dan 7:9/10/22: "the same court".
     - Rev 10:1/10:5→Dan 10:6/12:7 and 5:4/5:11→Dan 12:4/7:10.
     - S181 beast-from-the-sea thread and rows 13:2/13:3/13:5/13:7.
   - Fix: name the beast every time (sea, earth/false prophet, or pit). Daniel stands as a witness, never as the decider. The 42 months stay in their own unit.
   - Gap: 17:7–11 (was/is not/yet is, the eighth, Nimrod) has no rows or thread at all.

4. **Kings of the east read as hostile armies.** This affects Rev 16:12→Isa 11:16 and Jer 51:36, the thread "the Euphrates dried for the kings of the east", S181 `seven-bowls…` and row 16:12→Isa 11:15. Fix: the kings of the east are the gathered seed coming home through the dried river (2 Esd 13:47).

5. **Abaddon/Apollyon read as Azazel or the fallen star.** This affects Rev 9:11→1 En 10:4 and the thread "Abaddon, Apollyon, the angel of the bottomless pit". 9:1→Isa 14:12/13/15 and the "fallen star" thread are possible cases. Fix: Apollyon is Nimrod, the one the dragon resurrects, who rules from the underworld.

6. **Placement slips.**
   - 7:4→Ezek 37:21 and its thread: the sealed made the gathered. Fix: the seal comes before the sifting.
   - 22:4→Rev 7:3: "seal through the tribulation".
   - 19:7→Hos 2:19 and the marriage thread: "gathered home, are wed". Fix: betrothed again in the wilderness.
   - 20:5→2 Esd 7:32 and the thrones thread: the first resurrection merged with the judgment of the dead.
   - 21:24→Isa 60:3 and the "no temple" thread: "nations left alive". Fix: the tribes, the company of nations.
   - 16:16 "the last battle".
   - Ch 16 thread "it is done… ground cleared for the new Jerusalem" (skips the reign).
   - 17:16 thread hands off to ch 21.
   - 14:16→2 Esd 4:32 "all the long age sowed". Fix: the harvest falls on the wicked.
   - 12:1/12:2 the woman as the whole house or Zion. Fix: the northern company.
   - 12:7→Dan 12:1 "one event".
   - S181 threads: four horsemen as the Day (6:1–11 is the long tribulation), the 7:9 multitude placed in the reign (it is the destination), the 7th trumpet tied to chs 14 and 19 (it is the end), the 14:14 harvest as a gathering of the righteous, 18:4 placed at the close of the age.

7. **Minor slips.** Ch 8 thread says "three trumpets are spent" (it is four at 8:13). S181 row 20:4 → 1 Thess 4:15 quotes the words of 4:16, so its target verse is probably wrong.

## Clean
"Like unto the Son of Adam" is kept at 1:13 and 14:14. Neither 4:1 nor 4:2 is tied to 4:17. The tares-first order holds at 14:14–20 (winepress on the wicked). 11:18 and 20:11–15 are treated as one judgment. The 1,000 years are treated as symbolic. No people of the scattering is called heathen. Rev 1–5, 15 and 18 are essentially clean.

## Size
- Firm findings: about 45 rows and about 25 threads. Possible findings add about 40 more.
- 1 Thessalonians 4 and Revelation 11, 13, 16, 17, 19 and 20 carry most of them.
