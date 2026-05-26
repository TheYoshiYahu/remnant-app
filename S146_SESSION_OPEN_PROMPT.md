S146 — Matt 16 commentary + cross-references; parentheticals-toggle follow-ups carried forward from S145

# S145 close summary

**Matt 15 wheel landed clean.** matthew-15-short.md (single framework angle: the seven-baskets-of-the-feeding-of-the-four-thousand at vv.32-39 paired with the twelve-baskets-of-the-feeding-of-the-five-thousand at Matt 14:20 read as the King's-pedagogical-double-encoding of the framework's eschatological-arc — twelve-tribes-gathered out of all countries per Yechezk'el (Ezekiel) 37:21 into Yovel-restoration-completion per Vayikra (Leviticus) 25:8-10 and Yeshayahu (Isaiah) 61:1-2's *acceptable year of Yahuah (the LORD)* — dismantling the inherited-Christian-categorical-Gentile-feeding misreading of the Decapolis-second-feeding). matthew-15.md trimmed to 155 lines (opener cleaned of stale `_COMMENTARY_SUMMATION.md` and `§7 Cross-reference apparatus` refs; §5 Feeding-of-the-four-thousand deleted entirely per matt-12 surgical-delete pattern since short.md now walks it; §6 Notes-on-the-chapter's-major-substance deleted; §7 Cross-Reference Apparatus deleted entirely per no-appendix rule; Standing chapter-level position deleted; final state: opener + §1 Pharisaic-traditions-controversy + §2 Heart-defilement-teaching + §3 Canaanite-woman-pericope + §4 Galilee-shore-healings). session145_matt_15_extras_cross_references.sql: 5 threads at sort 297-301, 20 cross_references rows at tier_required='extras', 21 thread members at tier_required='complete_study'. Edition set: apocrypha (Sirach, Wisdom of Solomon, 2 Esdras, Tobit) + jubilees. 1 Enoch does not surface framework-bearing Matt 15 connections at S145 (the Apocalypse-of-Weeks at 1 Enoch 91-93 was not parsed into verse-granularity in the local corpus; the watchers-substance does not bear on Matt 15's Pharisaic-controversy or mission-scope-lock). Cumulative Matt 1-15 extras: 113 threads, 349 rows, 351 members.

Apply command verified — file-based DATABASE_URL pattern per S35-38, with stale-lock guard restored at S145 (the lock guard was dropped from the S145 paste-block and the commit failed on `.git/index.lock`; restoring it as standing convention):

```
cd /Users/mtm/Desktop/App \
  && rm -f .git/index.lock \
  && DATABASE_URL="$(cat _scratch/_db_url.txt)" python3 api/apply_migration.py data-schema/migrations/session145_matt_15_extras_cross_references.sql \
  && git add -A ':!.~lock*' \
  && git commit -m "S145 — Matt 15 commentary + cross-references; carry-along drift" \
  && git push
```

The `rm -f .git/index.lock` clears any stale lock from a crashed prior commit (the recurring failure mode the older S132 paste-block guarded against). The `:!.~lock*` pathspec keeps LibreOffice/Excel transient lock files out of the commit. Note for S146: when authoring the apply paste-block, KEEP the `rm -f .git/index.lock` line — do not drop it.

**Part B parentheticals-toggle follow-ups deferred at S145 (no room after Matt 15 wheel).** Three carry-forward items: (a) wire `npm test` script into `app/package.json` + add `vitest` + `@vitest/coverage-v8` devDependency so the runner-agnostic `stripParentheticals.test.ts` (13 assertion cases) runs via standard CI command; (b) audit walk matt 1-14 commentaries with `applyParentheticalsToggle(text, true)` and spot-check for any restored Sacred Name parenthetical NOT in the strip list (governance rule: add to STRIP_LIST + update voice-skill's Sacred Names section in parallel); (c) consider a tooltip-popover on first toggle interaction explaining what the toggle does — Yoshi's design call on the copy. Schedule these inside S146 Part B if room after Matt 16 wheel, or carry to a later session if Matt 16 substance fills the session.

# S145 verbal answers transcribed (per Verbal-Answers-Transcribe operating discipline)

- **Apple Developer Program enrollment** — *still not yet at S145 open*. Standing watch item; Phase 10 iOS wrap blocked until enrolled. Surfaced at S141, S142, S143, S144, S145; carry to S146.
- **Promo-code path Path A vs Path B** — *deferred at S145 open*. Yoshi's S145 response: *we are finishing Matthew*. The promo-code decision is OUT-OF-SCOPE until Matthew proof-of-concept book completes at end of S154. Do not re-surface the question at S146-S154 opens; revisit at the post-Matthew launch-readiness session.
- **Pre-S143 working-tree drift (4 files: matthew-10-short.md, matthew-10.md, session138 SQL, S132 prompt)** — *disposed at S145 commit as ALL RIDE-ALONG per per-file judgment* (S144 Yoshi-correction honored). Disposition reasoning: session138 SQL is a Hebrew-apostrophe-escape bug fix (`Yashar'el` → `Yashar''el`, `Yechezk'el` → `Yechezk''el`) that must ride or the apply would have rolled back; matthew-10-short.md (-194 lines) and matthew-10.md (-223 lines) are surgical-condense / surgical-delete continuations of the pattern locked in matt-12+; S132 prompt is an in-place trim of an old verbose prompt to current condensed style (historical record only, no live-work impact).

# Standing efficiency rules (calibration from S143 + S144 + S145; eight rules locked)

The eight rules from S145 hold. S145 surfaced no new calibration corrections — the calibrated rule set is stable.

1. Check S(N-1)_SESSION_OPEN_PROMPT.md at session open for the apply command pattern + standing convention notes.
2. Grep before Read for any file over ~100 lines.
3. Batch reads + skill load + directory request + AskUserQuestion in a single parallel-tool-call block. When Yoshi has set the agenda in the S(N-1) close prompt, S(N) open's AskUserQuestion should be LIGHT and CONFIRMATORY — a small batch of necessary settle-or-defer decisions. Do NOT re-litigate items Yoshi has explicitly told Claude to dispose silently. Do NOT re-ask scope ("Part A or Part B?") when the prompt already defined the parts. Yoshi's S144 correction: *don't ask questions before looking at the scope of where we are*.
4. Combine voice-gate checks into single bash commands.
5. Surgical delete, not rewrite-with-summary-pointer (matt-12 pattern; verified zero pointer-paragraphs in matt 1-15; matt-15 now matches).
6. Batch TaskUpdates into single tool-call blocks where possible.
7. Don't re-read files just edited.
8. Verify extras-library verses exist via local-mirror JSON read (`/Users/mtm/Desktop/App/source-texts/parsed/{apocrypha,jubilees,enoch}.json`) before authoring SQL cross_references rows. Surfaced at S145 — the sandbox cannot reach the Render DB but the parsed-JSON local mirrors carry the verse-existence + text-content the SQL needs to anchor against. Saves silent-skip surprises at apply time.

Consider promoting these to the voice skill's Operating Disciplines section in a future session (they're tactical-not-strategic so might stay project-local; Yoshi's call).

# First moves

1. Invoke `anthropic-skills:yoshi-voice`.
2. Request `~/Desktop` (broad scope) if not already mounted.
3. Read `commentaries/matthew-15-short.md` + `data-schema/migrations/session145_matt_15_extras_cross_references.sql` for the most recent calibrated short-form rule and SQL pattern (sort_order continues at 302+; tier split locked — cross_references at 'extras', threads at 'complete_study').
4. Read `commentaries/matthew-16-free.md`, `matthew-16-short.md`, `matthew-16.md`.

Batch (1) through (4) in a single parallel-tool-call block per Rule 3.

# The wheel

## Part A — Matt 16 commentary + cross-references

- `matthew-16-short.md`: 1-2 framework angles the free.md doesn't walk; scripture in stand-alone italics; ~15-25 lines.
- `matthew-16.md`: drop what short.md now walks (matt-12 pattern — full section deletion + renumber); trim overview-restating frame; keep deep development. No §X Cross-Reference Apparatus, no Standing-chapter-level-position section, no Notes-on-bridging-substance section in the .md file (per the matt-12/13/14/15 pattern now locked).
- `data-schema/migrations/session146_matt_16_extras_cross_references.sql`: every framework-bearing extras-library cross-reference for the chapter, anchor verse by anchor verse. Sweep 1 Enoch / Jubilees / Apocrypha / Pseudepigrapha / Apocalypse of Abraham / Ascension of Isaiah / Sonnini Acts 29. Hebrew-apostrophe grep gate before delivery (Yashar''el, Ya''aqov, Yechezk''el, Sha''ul, Mikha''el, Mosheh''s — doubled inside SQL string literals or Postgres rolls back). Sort_order starts at 302. Verify extras verses against local-mirror JSON per Rule 8 before writing.
- Voice-gate every deliverable against the 12 Red Lines + 12-point checklist.

Matt 16 = the Pharisees-and-Sadducees-demand-a-sign opening (vv.1-4 — *a wicked and adulterous generation seeketh after a sign; and there shall no sign be given unto it, but the sign of the prophet Yonah (Jonah)*); the *beware of the leaven of the Pharisees and of the Sadducees* warning to the disciples and the bread-confusion-and-King's-naming-of-the-two-feedings (vv.5-12 — direct pedagogical-pivot from the Matt 14 + Matt 15 double-feeding-substance — the King names the twelve-and-the-seven-baskets explicitly at v.9-10); the Caesarea Philippi confession (vv.13-20 — FRAMEWORK-MAJOR for the Kefa (Peter) *thou art the Messiah, the Son of the living Elohim (God)* confession + the King's-response *upon this rock I will build my assembly* + the keys-of-the-kingdom substance, with careful reading against the inherited-Christian-petrine-supremacy collapse and the inherited-Christian-replacement-theology-of-the-church); the first explicit passion prediction (vv.21-23 — FRAMEWORK-MAJOR for the King's-direct-naming of the cross-and-resurrection substance, and the *get thee behind me, Satan* rebuke of Kefa's (Peter's) cross-evasion disposition); the take-up-your-cross teaching (vv.24-28 — the discipleship-cost substance and the *shall not taste of death, till they see the Son of Adam coming in his kingdom* statement at v.28). Single chapter, NOT paired.

## Part B — Parentheticals-toggle follow-ups carried forward from S145 (only if Part A finishes with room)

- Add a `test` script to `app/package.json` and a `vitest` + `@vitest/coverage-v8` devDependency to wire `npm test` into the `stripParentheticals.test.ts` suite. The tests are already runner-agnostic and pass via `npx tsx`; this is the wire-up, not new tests.
- Audit: walk matt 1-15 commentaries with `applyParentheticalsToggle(text, true)` and spot-check for any restored Sacred Name parenthetical NOT in the strip list. Add to STRIP_LIST as discovered; remember the governance rule to update voice-skill's Sacred Names section in parallel.
- Consider adding a tooltip-popover on first toggle interaction explaining what the toggle does — Yoshi's design call on the copy.

# Resolve at S146 open BEFORE wheel begins

- Apple Developer Program enrollment — still not enrolled as of S145 close. Has Yoshi enrolled in the week between sessions?
- Google for Nonprofits 0% commission claim — needs written verification from Google before Play Billing wire-up. Phase 3 wheel, not blocking S146.

Note: Promo-code path Path A vs Path B is NOT a question for S146 — Yoshi's S145 disposition (*we are finishing Matthew*) takes the question out-of-scope until post-S154 launch-readiness session.

Note: pre-S143 working-tree drift was disposed at S145 commit (all four files ride-along — session138 SQL apostrophe-fix, matthew-10 surgical-condense + surgical-delete, S132 prompt trim).

# Matt 15-28 session schedule (locked at S144 close; updated at S145 close — 9 sessions remaining)

The remaining 13 chapters of Matthew complete in 9 sessions via four strategic pairings (continuous-narrative or one-discourse-spanning-two-chapters pairings; standalone chapters are framework-major or controversy-dense enough that pairing would compress substance). S145 landed Matt 15 alone.

- ~~S145 — Matt 15 alone~~: LANDED. Pharisaic-traditions challenge + Canaanite-woman + lost-sheep-mission-scope at v.24 + feeding-of-the-4000 (Yovel-completion short.md angle).
- **S146 — Matt 16 alone**: Caesarea Philippi confession + first passion prediction + *get thee behind me, Satan* + take-up-your-cross.
- **S147 — Matt 17-18 paired**: transfiguration + child-among-them + parable-of-the-lost-sheep + church-discipline / forgiveness instruction. One continuous post-Caesarea community-formation arc.
- **S148 — Matt 19-20 paired**: marriage/divorce + rich young ruler + workers-in-the-vineyard + third passion prediction + Sons of Zebedee + blind men at Jericho. One journey-toward-Yerushalayim narrative arc.
- **S149 — Matt 21 alone**: triumphal entry + cleansing the temple + cursing the fig tree + parable of the two sons + parable of the wicked husbandmen.
- **S150 — Matt 22 alone**: parable of the wedding feast + tribute to Caesar + Sadducees-and-resurrection + greatest commandment + son-of-David question.
- **S151 — Matt 23 alone**: FRAMEWORK-MAJOR — the seven woes on the Pharisees + the Yerushalayim lament.
- **S152 — Matt 24-25 paired**: the Olivet discourse. REQUIRED pairing — one continuous eschatological discourse.
- **S153 — Matt 26-27 paired**: passion narrative. Last supper + Gethsemane + arrest + trials + Peter's denial in 26; trial before Pilate + crucifixion + burial in 27.
- **S154 — Matt 28 alone**: resurrection + Great Commission. Framework reading of the Commission as kingdom-citizens-discipling-the-nations-into-Torah (not Replacement-Theology).

Matthew proof-of-concept book complete at end of S154. Launch readiness then depends on whatever app-build items (interlinear, remaining UI work, promo-code decision, Apple Dev enrollment) are still outstanding.

# Out of scope

Mark / Luke / John (post-Matthew launch decision per S144 strategic call). Interlinear / lexicons / native TTS wheels (Phase 9.2-9.4, separate sessions). Capacitor wrap (Phase 10). Reader-surface color tuning, modal/drawer sweep, BuddyPress audit. Promo-code Path A vs Path B (deferred to post-Matthew per Yoshi's S145 disposition). REBUILD_STATE.md catches up at Matthew-complete close.
