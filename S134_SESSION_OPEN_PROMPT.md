S134 — Matt 5, chapter-by-chapter

S133 shipped Matt 4: short.md cut to 27 lines on the kingdoms-as-real-administered-offer (Dan 10:13/20 + Eph 6:12 + 1 John 5:19 + Dan 7:13-14 kaph-preserved transfer) and Galilee-of-goyim as tribal-territory (2 Kings 17:24 + Isaiah 9 tribal-naming), long.md trimmed from 278 → 167 lines (§2 third-temptation overlap + §4 Galilee-of-goyim overlap dropped, **§8 Cross-Reference Apparatus deleted per the S88 no-appendix rule**), and `session133_matt_4_extras_cross_references.sql` applied — 5 threads (Mastema-architecture, Azazel-bound-in-the-wilderness, Beliar-as-king-of-this-world, Wisdom-of-Solomon ungodly-plot, Animal-Apocalypse gathering), 17 cross_references rows, 17 thread-members. All `tier_required='extras'`. Pushed at `1114990`. Cumulative extras corpus across Matt 1-4: 21 threads, 68 rows, 69+ members. Pill live for Matt 1-4.

First moves

1. Invoke `anthropic-skills:yoshi-voice`.
2. Mount `~/Desktop/App` AND `~/Desktop`.
3. Read `matthew-4-short.md` + `session133_matt_4_extras_cross_references.sql` for the calibrated rule and SQL pattern.
4. Read `matthew-5-free.md`, `matthew-5-short.md`, `matthew-5.md`.

The rule

* `matthew-N-short.md`: 1-2 framework angles the free.md doesn't walk; scripture in stand-alone italics; ~15-25 lines (S133 landed at 27 — substance-driven, but stay tight).
* `matthew-N.md`: drop what short.md now walks; trim overview-restating frame sentences; keep the deep development. **No §8 Cross-Reference Apparatus** — that data lives in the SQL migration, never appended to the commentary file.
* Author `data-schema/migrations/session134_matt_5_extras_cross_references.sql` across the full scripture-level library. Historical-witness editions deferred. Sort_order continues at 210+.
* Voice-gate against the 12 Red Lines + 12-point checklist.

Matt 5 candidates
Beatitudes (Matt 5:3-12): 1 Enoch 5:7 (*to the elect there shall be light and grace and peace*), 1 Enoch 58:2-3 (*Blessed are ye, ye righteous and elect*), Wisdom of Solomon 3:1-9 (*the souls of the righteous are in the hand of Elohim*), Sirach wisdom-blessing register. Light-of-the-world / city-on-a-hill (5:14-16): 1 Enoch 38:4 (*the light of righteousness shines forth*), 1 Enoch 1:8. **Jot-and-tittle / not-one-jot-shall-pass (5:17-20) — load-bearing anti-antinomian anchor**: Jubilees 6:35-37 (heavenly tablets standing forever), Sirach on Torah-permanence, possibly 1 Enoch 99:2 / 104:9 on those who alter the words of truth. Heart-Torah antitheses (5:21-48) — Testaments XII territory: Testament of Gad on hatred-to-love (anger 5:21-26 + enemies 5:43-48), Testament of Reuben on the spirit of fornication (5:27-30), Testament of Joseph 18:2 on do-good-to-enemies. Oaths (5:33-37): Sirach 23:9-11 (swear-not register). Love-enemies (5:43-48): Wisdom of Solomon 12:19 on Yahuah's (the LORD's) own mercy-toward-enemies pattern. Expect 6-8 threads if all map cleanly; trim to what carries framework weight.

Apply path

```bash
cd ~/Desktop/App
DATABASE_URL="$(cat _scratch/_db_url.txt)" \
  python3 api/apply_migration.py \
  data-schema/migrations/session134_matt_5_extras_cross_references.sql
```

Sandbox is DNS-isolated from Render Postgres — apply runs from Yoshi's terminal. Then commit + push (`S134 — Matt 5 content cut + Matt 5 extras-tier cross-references`) to fire the auto-deploy.

Out of scope
Reader-surface color tuning, modal/drawer sweep, §4 icy-silver-blue olive-leaf register, BuddyPress audit. REBUILD_STATE.md catches up at chapter-sweep close.
