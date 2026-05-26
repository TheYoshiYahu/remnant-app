S145 — Matt 15 commentary + cross-references; parentheticals-toggle follow-ups if any

# S144 close summary

**Matt 14 wheel landed clean.** matthew-14-short.md (21 lines, single framework angle: the hem-of-the-garment healing at vv.34-36 as the King-walks-in-the-Torah-prescribed-tsitsit substance enacting the Tanakh-Messianic-prophecy of Malachi 4:2's *Sun of righteousness arise with healing in his wings (kanaph)* — Hebrew *kanaph* anchored to Numbers 15:38's *tsitsit*-on-the-corners commandment). matthew-14.md trimmed to 105 lines (opener cleaned of stale `_COMMENTARY_SUMMATION.md` and `§6 Cross-reference apparatus` refs; §4 Gennesaret-hem-of-the-garment deleted entirely per matt-12 surgical-delete pattern since short.md now walks it; §5 Notes-on-bridging-substance deleted; §6 Cross-Reference Apparatus deleted entirely per no-appendix rule; Standing chapter-level position deleted; final state: opener + §1 Herod-beheading + §2 feeding-of-the-5000 + §3 walking-on-water). session144_matt_14_extras_cross_references.sql: 5 threads at sort 292-296, 17 cross_references rows at tier_required='extras', 17 thread members at tier_required='complete_study'. Edition set: apocrypha (Sirach, Wisdom of Solomon, 2 Esdras) — 1 Enoch and Jubilees do not surface framework-bearing Matt 14 connections (the chapter's substance is narrative-enactment of Tanakh-Yahuah-pattern rather than wisdom-stream-mythos territory). Cumulative Matt 1-14 extras: 108 threads, 329 rows, 330 members.

Apply command verified — file-based DATABASE_URL pattern per S35-38:

```
cd /Users/mtm/Desktop/App && DATABASE_URL="$(cat _scratch/_db_url.txt)" python3 api/apply_migration.py data-schema/migrations/session144_matt_14_extras_cross_references.sql
```

**Parentheticals-toggle landed clean (Part B of S144 wheel).** Three new files in `app/src/lib/`: `stripParentheticals.ts` (94-entry strip list — divine + covenant + patriarch/prophet + KJV-Greek-form parentheticals, compounds-first-longest-wins regex, pure utility), `useParentheticalsToggle.ts` (React hook, localStorage at `rop_hide_parentheticals_v1`, default OFF), `stripParentheticals.test.ts` (13 assertion cases passing via tsx; runner-agnostic so vitest/jest pick it up when wired). Toggle wired into four render sites: App.tsx (Reader verses at the plain-segment level so Strong's tagging boundaries are preserved + chapter_intro free-tier commentary), ChapterCommentary.tsx (entry bodies for Basic/Deeper-Dive/Featured), ChapterEndCard.tsx (baseline target previews + thread summary_md before paragraph-split + thread member previews + member notes). New chrome button next to "Hide study aids" with copy "Hide name translations" / "Show name translations". TSC PASS across the whole app; lint clean except one pre-existing-pattern setState-in-effect warning that mirrors the exact same warning in `lib/theme.ts` (consistent with codebase convention; not a new issue).

Governance note locked in `stripParentheticals.ts` header: when the Sacred Names section of the voice skill adds a new compound form (e.g., once the canon re-parse exposes `<nd>` and the `Adonai Yahuah (the Lord GOD)` construction starts emitting in scripture quotations), TWO places update — (a) the voice skill's Sacred Names section, and (b) the `STRIP_LIST` constant.

# S144 verbal answers transcribed (per Verbal-Answers-Transcribe operating discipline)

- **Apple Developer Program enrollment** — *not yet*. Standing watch item; Phase 10 iOS wrap blocked until enrolled. Surfaced at S141, S142, S143, S144; carry to S145.
- **Promo-code path Path A vs Path B** — *carry to S145*. Yoshi indicated Path B (Stripe trial with `trial_period_days: 30`) at S141 but deferred at S143 + S144. Settle at S145 open or accept carry-forward.
- **Pre-S143 working-tree drift (4 files: matthew-10-short.md, matthew-10.md, session138 SQL, S132 prompt)** — *do not re-surface as a question*. Yoshi's S144 instruction: don't ask about scope of where we are before doing the work. Claude to dispose silently at commit time — diff each, decide ride-along-with-S144 vs revert-vs-commit-separately, and execute without asking. The four-file drift remains uncommitted as of S144 close; carry-forward disposition decision belongs to commit time, not to the open-prompt question batch.

# Standing efficiency rules (calibration from S143 + S144)

The seven rules from S143 hold. One adjustment from S144:

- **Rule 3 (Batch reads aggressively at session open)** stays as written, with this addition on the AskUserQuestion side: when Yoshi has set the agenda in the S(N-1) close prompt, S(N) open's AskUserQuestion should be LIGHT and CONFIRMATORY (a small batch of necessary settle-or-defer decisions). Do NOT re-litigate items Yoshi has explicitly told Claude to dispose silently. Do NOT re-ask scope ("Part A or Part B?") when the prompt already defined the parts. Yoshi's S144 correction: *don't ask questions before looking at the scope of where we are*.

Original seven, unchanged:
1. Check S(N-1)_SESSION_OPEN_PROMPT.md at session open for the apply command pattern + standing convention notes.
2. Grep before Read for any file over ~100 lines.
3. Batch reads + skill load + directory request + AskUserQuestion in a single parallel-tool-call block. (See clarification above.)
4. Combine voice-gate checks into single bash commands.
5. Surgical delete, not rewrite-with-summary-pointer (matt-12 pattern; verified zero pointer-paragraphs in matt 1-13; matt-14 now matches).
6. Batch TaskUpdates into single tool-call blocks where possible.
7. Don't re-read files just edited.

Consider promoting these to the voice skill's Operating Disciplines section in a future session (they're tactical-not-strategic so might stay project-local; Yoshi's call).

# First moves

1. Invoke `anthropic-skills:yoshi-voice`.
2. Request `~/Desktop` (broad scope) if not already mounted.
3. Read `commentaries/matthew-14-short.md` + `data-schema/migrations/session144_matt_14_extras_cross_references.sql` for the most recent calibrated short-form rule and SQL pattern (sort_order continues at 297+; tier split locked — cross_references at 'extras', threads at 'complete_study').
4. Read `commentaries/matthew-15-free.md`, `matthew-15-short.md`, `matthew-15.md`.

Batch (1) through (4) in a single parallel-tool-call block per Rule 3.

# The wheel

## Part A — Matt 15 commentary + cross-references

- `matthew-15-short.md`: 1-2 framework angles the free.md doesn't walk; scripture in stand-alone italics; ~15-25 lines.
- `matthew-15.md`: drop what short.md now walks (matt-12 pattern — full section deletion + renumber); trim overview-restating frame; keep deep development. No §X Cross-Reference Apparatus, no Standing-chapter-level-position section, no Notes-on-bridging-substance section in the .md file (per the matt-12/13/14 pattern now locked).
- `data-schema/migrations/session145_matt_15_extras_cross_references.sql`: every framework-bearing extras-library cross-reference for the chapter, anchor verse by anchor verse. Sweep 1 Enoch / Jubilees / Apocrypha / Pseudepigrapha / Apocalypse of Abraham / Ascension of Isaiah / Sonnini Acts 29. Hebrew-apostrophe grep gate before delivery (Yashar''el, Ya''aqov, Yechezk''el, Sha''ul, Mikha''el, Mosheh''s — doubled inside SQL string literals or Postgres rolls back). Sort_order starts at 297.
- Voice-gate every deliverable against the 12 Red Lines + 12-point checklist.

Matt 15 = the Pharisaic-Yerushalayim-delegation challenge over hand-washing (vv.1-2 — the *takkanot* tradition the disciples allegedly violated); the King's-counter-challenge over the Corban-evasion of the fifth-commandment (vv.3-9 — the framework-major *making the commandment of Elohim of none effect by your tradition* Isaiah-29:13 citation, the deepest dismantling of the Pharisaic-fence-architecture in the gospel); the disciples-and-the-multitude-instruction *not that which goeth into the mouth defileth a man; but that which cometh out of the mouth* (vv.10-20 — read carefully against the inherited-Christian-collapse into food-laws-abolished; the framework reads as Pharisaic-purity-rituals (not Torah-kashrut) being the target); the Kena'anite (Canaanite) woman pericope (vv.21-28 — FRAMEWORK-MAJOR for the *lost-sheep-of-the-house-of-Yashar'el* mission-scope at v.24 + the woman's-faith-honored without overruling the mission-scope); the Galilee-mountain-healings (vv.29-31); the feeding-of-the-four-thousand (vv.32-39 — the second-wilderness-feeding, with the seven-baskets-substance distinct from the twelve-baskets of Matt 14:20). Single chapter, NOT paired.

## Part B — Parentheticals-toggle follow-ups (light; only if Part A finishes with room)

- Add a `test` script to `app/package.json` and a `vitest` + `@vitest/coverage-v8` devDependency to wire `npm test` into the `stripParentheticals.test.ts` suite. The tests are already runner-agnostic and pass via `npx tsx`; this is the wire-up, not new tests.
- Audit: walk matt 1-14 commentaries with `applyParentheticalsToggle(text, true)` and spot-check for any restored Sacred Name parenthetical NOT in the strip list. Add to STRIP_LIST as discovered; remember the governance rule to update voice-skill's Sacred Names section in parallel.
- Consider adding a tooltip-popover on first toggle interaction explaining what the toggle does — Yoshi's design call on the copy.

# Resolve at S145 open BEFORE wheel begins

- Apple Developer Program enrollment — still not enrolled as of S144 close. Has Yoshi enrolled in the week between sessions?
- Promo-code path Path A vs Path B — settle this session or accept carry-forward. Yoshi indicated Path B at S141.
- Google for Nonprofits 0% commission claim — needs written verification from Google before Play Billing wire-up. Phase 3 wheel, not blocking S145.

Note: pre-S143 working-tree drift (matthew-10-short.md, matthew-10.md, session138 SQL, S132 prompt) is NOT a question for Yoshi — Claude disposes silently at commit per S144 Yoshi-correction. Diff each before committing S145; ride along or revert per per-file judgment.

# Matt 15-28 session schedule (locked at S144 close per Yoshi's pairing-list question)

The remaining 14 chapters of Matthew complete in 10 sessions via four strategic pairings (continuous-narrative or one-discourse-spanning-two-chapters pairings; standalone chapters are framework-major or controversy-dense enough that pairing would compress substance).

- **S145 — Matt 15 alone**: Pharisaic-traditions challenge + Canaanite-woman + lost-sheep-mission-scope at v.24 + feeding-of-the-4000.
- **S146 — Matt 16 alone**: Caesarea Philippi confession + first passion prediction + *get thee behind me, Satan* + take-up-your-cross.
- **S147 — Matt 17-18 paired**: transfiguration + child-among-them + parable-of-the-lost-sheep + church-discipline / forgiveness instruction. One continuous post-Caesarea community-formation arc.
- **S148 — Matt 19-20 paired**: marriage/divorce + rich young ruler + workers-in-the-vineyard + third passion prediction + Sons of Zebedee + blind men at Jericho. One journey-toward-Yerushalayim narrative arc.
- **S149 — Matt 21 alone**: triumphal entry + cleansing the temple + cursing the fig tree + parable of the two sons + parable of the wicked husbandmen.
- **S150 — Matt 22 alone**: parable of the wedding feast + tribute to Caesar + Sadducees-and-resurrection + greatest commandment + son-of-David question.
- **S151 — Matt 23 alone**: FRAMEWORK-MAJOR — the seven woes on the Pharisees + the Yerushalayim lament.
- **S152 — Matt 24-25 paired**: the Olivet discourse. REQUIRED pairing — one continuous eschatological discourse.
- **S153 — Matt 26-27 paired**: passion narrative. Last supper + Gethsemane + arrest + trials + Peter's denial in 26; trial before Pilate + crucifixion + burial in 27.
- **S154 — Matt 28 alone**: resurrection + Great Commission. Framework reading of the Commission as kingdom-citizens-discipling-the-nations-into-Torah (not Replacement-Theology).

Matthew proof-of-concept book complete at end of S154. Launch readiness then depends on whatever app-build items (interlinear, remaining UI work) are still outstanding.

# Out of scope

Mark / Luke / John (post-Matthew launch decision per S144 strategic call). Interlinear / lexicons / native TTS wheels (Phase 9.2-9.4, separate sessions). Capacitor wrap (Phase 10). Reader-surface color tuning, modal/drawer sweep, BuddyPress audit. REBUILD_STATE.md catches up at Matthew-complete close.
