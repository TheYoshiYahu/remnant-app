**EXECUTE. This is a work order, not a discussion. Start with First Moves immediately. Do not summarize the document back to me. Do not propose options. Do not ask clarifying questions before First Moves are complete. Do not pressure-test the directive. The work below is what you do, in the order shown, until the deliverables are saved and the SQL migration is voice-gated. Only stop to ask once you hit something the document does not cover.**

---

S139 — Matt 10, chapter-by-chapter

S138 shipped (Yoshi's session): Matt 9 single-chapter. matthew-9-short.md (19 lines, two angles — faith-reveals-not-creates at v.22 + v.29 with Red Line #11 cause-and-effect, death-as-sleep at v.24 with Dan 12:2 + Isa 26:19 + the natural-branches-grafted-in-again first-resurrection note); matthew-9.md (475→261, §1 rebuilt with the Son-of-Adam named-title vs Dan 7:13 kaph-comparative distinction per Red Line #12, §2 Hosea-6:6 prophetic stream verses restored, §8 Apparatus deleted per S88 lock; all Hebrew-form book-citations corrected to conventional English per S88 lock); session138_matt_9_extras_cross_references.sql — 13 threads (sort 236-248), 34 rows, 34 members covering every Matt 9 anchor verse (Sirach 35 mercy-as-sacrifice, Tobit 4+12 alms-as-laid-up-treasure, Sirach 12 publicans-and-sinners-INVERSE the King reverses, 1 Enoch 48+62 named-Son-of-Adam extending S137 Thread 10, Tobit 12 + Sirach 34:26 fasting-with-mercy, Sirach 9:10 new-wine inverse, Sirach 38 physician-prayer-bypassed, Wisdom 16 power-over-life-and-death, 4 Ezra Davidic-Messiah, 1 Enoch 90 Animal Apocalypse shepherds-judged-and-new-house, 2 Baruch 35 harvest-of-the-age, 4 Ezra 4 harvest-when-the-number-is-fulfilled, 2 Baruch 38 gathering-with-much-mercy); 2 Esdras 7:28 Christian-interpolation corrected in both the SQL UPDATE and source-texts/parsed/apocrypha.json (was *my son Yahusha (Jesus) shall be revealed*, now *my son the Messiah shall be revealed* per the underlying Syriac). Cumulative Matt 1-9 extras: 60 threads, 178 rows, 179 members. Pills live for Matt 1-9 on deploy.

First moves

1. Invoke `anthropic-skills:yoshi-voice`.
2. Mount `~/Desktop/App`.
3. Read `matthew-9-short.md` + `session138_matt_9_extras_cross_references.sql` for the calibrated rule and the SQL pattern (sort_order continues at 249+).
4. Read `matthew-10-free.md`, `matthew-10-short.md`, `matthew-10.md`.

The rule (locked at S88, broken at S138, restored here)

* `matthew-10-short.md`: 1-2 framework angles the free.md doesn't walk; scripture in stand-alone italics; ~15-25 lines.
* `matthew-10.md`: drop what short.md now walks; trim overview-restating frame; keep deep development. **No §X Cross-Reference Apparatus in the .md file — that data lives in the SQL migration, never appended to the commentary file. The apparatus structure goes; the cross-reference DATA must migrate to the SQL.**
* SQL migration: `data-schema/migrations/session139_matt_10_extras_cross_references.sql`. Sort_order continues at 249+. Historical-witness deferred. **The migration covers EVERY framework-bearing extras-library cross-reference for the chapter — anchor verse by anchor verse. The candidates listed below are seeds, not scope. Sweep: for each Matt 10 anchor verse, what 1 Enoch / Jubilees / Apocrypha (Tobit / Sirach / Wisdom of Solomon / 1+2 Maccabees / 2 Esdras / Baruch) / Pseudepigrapha (2 Baruch / Testaments of XII / 2 Enoch / 4 Maccabees / Adam-Eve) / Apocalypse of Abraham / Ascension of Isaiah / Sonnini Acts 29 witnesses bear at framework-load? Thread them all.**
* Voice-gate each deliverable against 12 Red Lines + 12-point checklist. **Plus: grep the SQL before delivery for unescaped apostrophes in Hebrew names inside string literals — `Yashar'el`, `Yechezk'el`, `Ya'aqov`, `Yo'el`, `Ya'ir`, `Sha'ul`, `Mosheh's`, any other Hebrew name carrying an apostrophe in the body of the word. Inside `'...'` single-quoted SQL string literals, every internal apostrophe MUST be doubled (`Yashar''el`). Postgres rolls back the whole transaction on the syntax error.**

Single-chapter, NOT paired

Matt 10 is the missionary discourse — the commissioning of the twelve (vv.1-4), the load-bearing mission-scope at vv.5-6 (*go not into the way of the Gentiles, and into any city of the Samaritans enter ye not: but go rather to the lost sheep of the house of Yashar'el (Israel)*), the practice-of-the-mission instructions (vv.7-15) with shake-off-the-dust at v.14, the persecution-and-protection teaching (vv.16-23) with the Ruach HaKodesh (Holy Spirit) speaking through the persecuted at v.20, the master-and-servant warning with the Beelzebul-attribution extended from the King to his disciples (vv.24-25), the fear-not-them-which-kill-the-body teaching (vv.26-31), the load-bearing confess-or-deny dichotomy (vv.32-33), and the household-division architecture at vv.34-39 with the take-up-your-cross-and-follow-me commission. Closes on the receive-the-prophet / receive-the-righteous reward economy (vv.40-42). Too dense to pair with Matt 11 (Yochanan-from-prison + the woes against the cities + the *come unto me, all ye that labour and are heavy laden* close — its own session).

Matt 10 candidates

vv.5-6 lost-sheep-of-the-house-of-Yashar'el (Israel) — the framework's load-bearing mission-scope anchor; already-existing canon-tier thread `lost-sheep-mission-scope` (S110) gets new members anchored at 10:5-6; extras candidates for the gathering-of-the-scattered register: 2 Baruch 38:4 (twelve-tribes-bound-by-one-bond) + Sirach 36:11-12 (gather-all-the-tribes), though latter already in S137 Thread 8; verify before re-threading. vv.7-15 mission-practice — possibly Tobit 12 (angel-as-messenger-instructed) parallels, possibly Sirach on the messenger-discipline; verify candidacy. v.14 shake-off-the-dust — direct canon-Tanakh anchor (Neh 5:13, Acts 13:51 NT parallel); extras may be thin. vv.16-23 persecution-of-the-righteous — load-bearing extras territory: Wisdom of Solomon 2:12-20 (the righteous-sufferer rebuking the lawless — already used in S137 Thread 9 for Matt 8:17 Suffering-Servant; can re-anchor here at the persecution-architecture register); 4 Maccabees 5-18 (the mother-and-seven-sons martyrdom-with-fidelity-to-Torah — STRONG candidate for the *fear not them which kill the body, but are not able to kill the soul* register at v.28); 2 Maccabees 7 (same martyrdom narrative in the canon-Apocrypha edition); 1 Enoch 95-100 woes against the lawless and the comfort to the persecuted; 2 Baruch 51 on the transformation of the righteous. v.20 *the Spirit of your Father which speaketh in you* — the Ruach-speaking-through-the-persecuted; possibly 1 Enoch 91 (the Apocalypse of Weeks naming the eighth-week sword-given-to-the-righteous). vv.32-33 confess-or-deny — 1 Enoch's pre-existent-naming-before-the-Head-of-Days architecture (1 Enoch 48 already in S138 Thread 4; cross-references-to-existing-threads possible). vv.34-39 household-division + take-up-your-cross — Sirach on family-fidelity vs covenant-fidelity tension; possibly 4 Maccabees on the priority of Torah-fidelity over family-bonds. vv.40-42 receive-the-prophet reward economy — Tobit 12 on the angel-as-messenger-bearing-the-Father's-reward architecture; possibly Sirach on the receive-the-righteous register. Sweep generously; thread everything that carries framework weight; do not cap thread count at the seed list.

Apply path

```bash
cd ~/Desktop/App
DATABASE_URL="$(cat _scratch/_db_url.txt)" \
  python3 api/apply_migration.py \
  data-schema/migrations/session139_matt_10_extras_cross_references.sql
```

Sandbox is DNS-isolated from Render Postgres — apply runs from Yoshi's terminal (Terminal.app or VS Code integrated terminal on the Mac, NOT Render's Web Shell). Then commit + push (`S139 — Matt 10 content cuts + Matt 10 extras-tier cross-references`) to fire the auto-deploy. Pills live for Matt 1-10 on deploy.

Out of scope

Matt 11 (next session — single-chapter; Yochanan-from-prison + woes against the cities + *come unto me, all ye that labour*). Reader-surface color tuning, modal/drawer sweep, BuddyPress audit. REBUILD_STATE.md catches up at chapter-sweep close.
