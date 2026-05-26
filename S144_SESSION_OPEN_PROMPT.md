S144 — Matt 14 + parentheticals-toggle reader-surface feature (parallel wheel)

S143 closed with corrections after two early stumbles. Matt 13 commentary + cross-references landed clean. matthew-13-short.md (~35 lines, two framework angles: Father-Son-buyer treasure/pearl per Red Line #11 + leaven-as-consistent-Tanakh-corruption-substance with Pesach/Leviticus 2:11/Matt 16:6,12/1 Cor 5:6-7 anchor cluster). matthew-13.md trimmed to 192 lines (opener restored to S84 verbatim minus stale `_COMMENTARY_SUMMATION.md` and `§12` refs; §5 leaven and §8 treasure-and-pearl deleted entirely per matt-12 pattern; §9/§10/§11 renumbered to §8/§9/§10). session143_matt_13_extras_cross_references.sql: 10 threads at sort 282-291, 36 cross_references rows at tier_required='extras', 36 thread members at tier_required='complete_study'. Cumulative Matt 1-13 extras: 103 threads, 312 rows, 313 members. Apply command confirmed:

```
cd /Users/mtm/Desktop/App && DATABASE_URL="$(cat _scratch/_db_url.txt)" python3 api/apply_migration.py data-schema/migrations/session143_matt_13_extras_cross_references.sql
```

S143 mistakes captured + rolled into the standing efficiency rules below: gave wrong apply command twice (generic `psql "$DATABASE_URL"` and then `python3 api/apply_migration.py` without the `DATABASE_URL="$(cat _scratch/_db_url.txt)"` prefix — file-based input pattern was established at S35-38 to route around zsh's open-quote trap and lives documented in S142_SESSION_OPEN_PROMPT.md); rewrote §5 leaven and §8 treasure-and-pearl with summary-pointer paragraphs ("Short.md walks the...") instead of surgical deletes (corrected mid-session by matching matt-12's drop-the-whole-section-and-renumber convention strictly; verified zero pointer-paragraphs in matt 1-12).

Pre-S143 working-tree drift to investigate before committing S144: `matthew-10-short.md`, `matthew-10.md`, `session138_matt_9_extras_cross_references.sql`, and `S132_SESSION_OPEN_PROMPT.md` all show as modified at S143 close but were not S143 work (mtimes from earlier today). Diff each before commit; decide whether they ride along with S144 or get reverted/committed separately.

# Standing efficiency rules (apply every session)

Captured from S143's debrief. Adopt as standing discipline. Consider promoting to voice skill `Operating Disciplines` section in a future session.

1. **Check S(N-1)_SESSION_OPEN_PROMPT.md at session open** for the apply command pattern, the prior session's calibration, and any standing convention notes. Catches command-pattern mistakes BEFORE the wheel begins.
2. **Grep before Read for any file over ~100 lines.** Targeted grep to find section boundaries, then read only the needed range. Don't read full files when only a section is needed.
3. **Batch reads aggressively at session open.** All independent file reads + skill load + directory request + AskUserQuestion go in a single parallel-tool-call block.
4. **Combine voice-gate checks into single bash commands.** Don't do Hebrew-apostrophe grep / English-possessive grep / structural-count check as three separate calls. One bash command with multiple checks.
5. **Surgical delete, not rewrite-with-summary-pointer.** When a section is superseded by short.md, follow the matt-12 pattern: DELETE the section entirely (heading + body), renumber subsequent sections. Do NOT leave a "Short.md walks this" pointer-paragraph. Verified zero pointer-paragraphs in matt 1-12 — this is the locked convention.
6. **Batch TaskUpdates** into single tool-call blocks where possible rather than serial calls.
7. **Don't re-read files just edited.** Edit/Write would error if changes failed; the harness tracks state. Don't verify with a re-Read.

# First moves

1. Invoke `anthropic-skills:yoshi-voice`.
2. Request `~/Desktop` (broad scope).
3. Read `commentaries/matthew-13-short.md` + `data-schema/migrations/session143_matt_13_extras_cross_references.sql` for the most recent calibrated short-form rule and SQL pattern (sort_order continues at 292+; tier split locked — cross_references at 'extras', threads at 'complete_study').
4. Read `commentaries/matthew-14-free.md`, `matthew-14-short.md`, `matthew-14.md`.

# The wheel

## Part A — Matt 14 commentary + cross-references

* `matthew-14-short.md`: 1-2 framework angles the free.md doesn't walk; scripture in stand-alone italics; ~15-25 lines.
* `matthew-14.md`: drop what short.md now walks (matt-12 pattern — full section deletion + renumber); trim overview-restating frame; keep deep development. No §X Cross-Reference Apparatus in the .md file.
* `data-schema/migrations/session144_matt_14_extras_cross_references.sql`: every framework-bearing extras-library cross-reference for the chapter, anchor verse by anchor verse. Sweep 1 Enoch / Jubilees / Apocrypha / Pseudepigrapha / Apocalypse of Abraham / Ascension of Isaiah / Sonnini Acts 29. Hebrew-apostrophe grep gate before delivery (Yashar''el, Ya''aqov, Yechezk''el, Sha''ul, Mosheh''s — doubled inside SQL string literals or Postgres rolls back). Sort_order starts at 292.
* Voice-gate every deliverable against the 12 Red Lines + 12-point checklist.

Matt 14 = the death-of-Yochanan-the-Witness at Herod's hand (vv.1-12 — the rejection-disposition the gospel has been tracing in the religious-system now mirrored at the political-system level), the withdraw-across-the-lake (v.13), the feeding-of-the-5000 (vv.13-21 — the only miracle outside the resurrection appearing in all four gospels, the kingdom-citizens'-table-fellowship inauguration substance), the walking-on-the-water (vv.22-33 with Kefa's (Peter's) sinking + the *of a truth thou art the Son of Elohim* confession at v.33), and the healings at Gennesaret (vv.34-36). Single chapter, NOT paired.

## Part B — Parentheticals-toggle reader-surface feature

Per S143 discussion: a reader-side toggle to strip restored-name parentheticals at render time. Yoshi's design (simpler than initial proposal): maintain a strip-list of the English-form parentheticals to hide directly — `(LORD)`, `(Lord)`, `(God)`, `(Jesus)`, `(Christ)`, `(Israel)`, `(Judah)`, `(Jews)`, `(Jew)`, `(Jewish)`, `(Holy Spirit)`, `(Holy Ghost)` + compound divine forms (`(the LORD God)`, `(LORD of hosts)`, `(the LORD thy God)`, `(the Lord GOD)`, `(God Almighty)`, `(most High)`, `(the everlasting God)`, `(mighty God)`, `(everlasting Father)`, `(Prince of Peace)`, `(Jehovah-jireh)`, `(Jehovah-nissi)`, `(Jehovah-shalom)`, `(THE LORD OUR RIGHTEOUSNESS)`, `(The LORD is there)`, `(the LORD that healeth thee)`, `(The LORD is my shepherd)`, `(I AM THAT I AM)`, `(Jesus Christ)`, `(Christ Jesus)`) + patriarch/figure forms (`(Abraham)`, `(Isaac)`, `(Jacob)`, `(Moses)`, `(Jerusalem)`, `(John)`, `(James)`, `(Timothy)`, `(Saul)`, `(Cain)`, `(Abel)`, `(Noah)`, `(Jonah)`, `(Solomon)`, `(David)`, `(Michael)`, `(Gabriel)`, `(Melchizedek)`, `(Mary)`, `(Joseph)`, `(Peter)`, etc.) — ~50-70 entries total, finite and stable.

Implementation scope:

* `app/src/utils/stripParentheticals.ts` (new): the strip-list constant + the utility function. Regex pattern: `\s?\((LORD|Lord|God|Jesus|Christ|...etc...)\)` — literal string matches, no name-anchoring logic, zero false-positive risk (verse refs like `(vv.13-15)`, technical asides like `(per Red Line #11)`, KJV-style `(Behold)` all pass through untouched because they're not in the strip list).
* `app/src/hooks/useParentheticalsToggle.ts` (new): React hook backing localStorage-persisted user preference. Default OFF (parentheticals visible — preserves retention-mechanism for first-time Christian readers per voice skill convention); user opts IN to hide them.
* Toggle UI placement: in Reader settings menu alongside font-size / theme controls. Label: "Hide name translations" or "Restored Names only" — Yoshi's design call on the copy.
* Apply at 4 render sites: (1) Reader verse rendering; (2) cross-reference notes in chapter-end card Layer 1; (3) thread summary_md expand in chapter-end card Layer 2; (4) commentary surfaces (free / short / deep) if/when exposed.
* No database changes, no restoration-pipeline changes, no canon re-parse. Pure client-side. Reversible per-user.
* Testing: snapshot test on a verse with multiple parentheticals (e.g., Matt 1:1 with `Yahusha (Jesus)`, `Mashiach (Christ)`, `David`, `Avraham (Abraham)`) confirming the toggle correctly hides only the strip-list entries and leaves the rest intact.

Estimated half-session of focused work for end-to-end wire-up + testing. Sequence within S144: land Matt 14 wheel first; then parentheticals-toggle if time remains, or carry to S145 if Matt 14 wheel runs long.

## Governance note for the strip-list

The strip-list lives in one file. When the Sacred Names convention adds a new compound form (e.g., once the canon re-parse exposes `<nd>` and the `Adonai Yahuah (the Lord GOD)` construction starts emitting), TWO places update: (a) the voice skill's Sacred Names section, and (b) the strip-list constant in `app/src/utils/stripParentheticals.ts`. Worth a comment header in the file pointing at the voice skill section it mirrors so the sync stays visible.

# Resolve at S144 open BEFORE wheel begins

* Apple Developer Program enrollment — surfaced S141 + S142 + S143 as "start the clock" item. Phase 10 iOS wrap continues to wait. Has Yoshi enrolled at developer.apple.com yet?
* Promo-code path Path A (manual `rop_partner_tier` user-meta) vs Path B (Stripe trial with `trial_period_days: 30`) — Yoshi indicated Path B at S141; deferred at S143; check whether to settle this session or carry forward again.
* Google for Nonprofits 0% commission claim — needs written verification from Google before Play Billing wire-up. Phase 3 wheel, not blocking S144.
* Pre-S143 working-tree drift (4 files) — diff `matthew-10-short.md`, `matthew-10.md`, `session138_matt_9_extras_cross_references.sql`, `S132_SESSION_OPEN_PROMPT.md` and decide commit-disposition.

# Out of scope

Matt 15 (S145). Interlinear / lexicons / native TTS wheels (Phase 9.2-9.4, separate sessions). Capacitor wrap (Phase 10). Reader-surface color tuning, modal/drawer sweep, BuddyPress audit. REBUILD_STATE.md catches up at chapter-sweep close.
