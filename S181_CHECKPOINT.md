# S181 Checkpoint — Verification edits landed + SQL migrations built

**Date:** 2026-05-31
**Mode:** Yoshi delegated full editorial authority on the four S180 verification reports ("you got my voice skill, make decisions, make good choices"). I read all four verifications, ruled on each finding per the framework, edited the four proposals, and converted the result to four SQL migrations.

---

## 1. What shipped this session

### Four edited proposals (in `_scratch/`)
The S180 proposals were edited in place with the verification findings applied. Every accepted finding was implemented per the framework standard; meta-commentary footers were rewritten as proposal-state notes.

- **John** — 14 threads → **16 threads** (two new threads added: `born-not-of-blood-flesh-credentialing-refused` anchored at John 1:11-13, and `son-of-adam-as-judge-and-ladder` anchored at John 1:51).
  - Thread 7 (`lifted-up-substance`): added the *whosoever* + drawing-as-gathering correction so Red Line #1 and Red Line #10 do not slip through the John 3:14-15 quote block.
  - Thread 5 (`born-from-above`): added the hearing-reveals-not-creates closing paragraph + the grace-as-return-to-the-Way completion.
  - Thread 11 (`gather-together-in-one`): added the *we do not know them by sight* closing per Red Line #7.
  - Thread 9 (`bread-from-heaven`): added members for John 6:53 → Daniel 7:13 and John 6:62 → John 3:13 (Son of Adam coverage).
  - Thread 13 (`kosmos`): added the grace-completion paragraph.
- **Romans** — 16 threads, all retained, multiple substantive edits applied.
  - Thread 11 (Romans 9): rewrote the *wheat sifted from the wheat* phrase to lock the two-stage harvest-then-sifting architecture; rewrote the *two-houses grief* frame so Paul's kinsmen include both houses.
  - Thread 13 (Romans 11): added three explicit additions — wild-olive-as-descendants-of-the-broken-off, cause-and-effect reversal, names-only-blotted-out — so the Red Line #11 architecture is on the page, not implicit.
  - Threads 1, 2, 3, 5: row-level clarifiers on the *Goyim* / *Greek* / *Jew first* member rows so the binary doesn't smuggle in through standalone verse-pair reads.
  - Thread 5: added the immediate-after-verse *erga nomou* clarifier on Romans 3:27-28.
  - Thread 6: added the Avraham's-fatherhood / cause-and-effect-reversal sentence after Romans 4:11 + marriage-covenant-absorption lock.
  - Thread 7 row 8: expanded the Romans 5:20 / Deuteronomy 28 row to explicitly hold *the Torah surfaces the offence; the Torah itself is not the curse.*
  - Thread 8: added the post-harvest-sifting completion to the summary.
  - Stripped two internal `S74 thread` references so the prose stands on its own.
- **Galatians** — 12 threads, all retained.
  - **~20 Hebrew book-name violations** find-and-replaced: *Devarim → Deuteronomy, Vayikra → Leviticus, Yeshayahu → Isaiah, Yirmeyahu → Jeremiah, Yechezk'el → Ezekiel, Sh'mot → Exodus, Iyov → Job, Habaqquq → Habakkuk* across all member notes. The skill's book-name rule is non-negotiable; this is now compliant.
  - Thread 5 (Galatians 6:7): fixed `Yahuah (Elohim) is not mocked` → `Elohim (God) is not mocked` per the pipeline sacred-names rule.
  - Thread 3 Member 6: softened the Benjamin-tribal-mission-assignment claim that went beyond framework backing.
  - Thread 8: softened the *synagogue-keeping Yahudi* nuance so the Red Line #11 *both modern Yahudah and modern scattered seed are wild olive descendants* reading is preserved.
- **Revelation** — 16 threads → 17 threads (header was wrong; the proposal already had 17, the header now matches).
  - Thread 1 (CRITICAL): rewrote the kaph-comparative attribution. The Greek of Revelation 1:7 does NOT carry the *homoion* particle; the kaph lives at v.13 only. The summary and Member 1 now frame v.7 as the Daniel-7-cadence cloud-coming announcement and v.13 as the kaph-bearing carve-out.
  - Thread 1 Member 5: rewrote the white-wool-hair / Father-Son distinction so the Daniel 7:9 *Ancient of Days* reference does not slide toward a Father/Son collapse.
  - Thread 5 (144,000): tightened the *symbolic* language so it cannot slide to *spiritualized*; added the cause-and-effect-reversal sentence at the bridge to the great multitude.
  - Thread 6 (great multitude): time-stamped the priestly office to the millennial reign — *the relationship begins then, not now*; named the Hebrew-Roots false-inclusion costume explicitly.
  - Thread 11 (Revelation 14:14): stripped the `per Red Line #12` internal reference from reader-facing prose; pulled Mark 13:32 out of nested italic into a stand-alone italic quotation block per come-and-see discipline.
  - Thread 13 (harlot Babylon): added the 1 John 2:3-4 *contrary-to-Torah* diagnostic as a stand-alone italic block in the body; made the four-costume reading load-bearing in the body summary; added the *preterist localization to first-century Yerushalayim is too narrow as well* sentence.
  - Thread 15 (appointed reign): softened the forefathers' grafting-in-again from automatic to the framework's careful *able to graff them in again at the first resurrection* language; made the Philippians 3:11 lock explicit in prose.
  - Thread 3 Member 9: stripped the *per the appointed-reign framework* internal reference.

**Findings rejected (with reasoning):**
- John Thread 2 Member 4 *Wisdom personified* phrasing — verification flagged as Trinitarian-adjacent; reading the actual line, the framework's literary tradition of personified wisdom in Proverbs 8 is the source, not Trinitarian doctrine. Kept as-is.
- John Thread 10 Ruach phrasing — verification flagged as *thinner zone*; the framework documents do allow Ruach as the moving presence of Yahuah within the Father and the Son and the creation. Kept as-is.
- Romans Thread 7 *second Adam* phrasing — verification noted the framework prefers *Son of Adam* / *Formed one in flesh*. Kept as-is; *second Adam* is acceptable bridge-to-the-Christian-reader phrasing here and the Pauline source uses *the last Adam* at 1 Corinthians 15:45.

### Four SQL migrations (in `data-schema/migrations/`)
Generated by a parser script (`outputs/build_sql_migrations.py`) that reads the proposal markdown and emits the WITH-input(...) VALUES pattern from session74. Every migration:
- Wraps in `BEGIN; / COMMIT;`
- Creates a transaction-scoped temp view `_s181_{book}_lookup` against the `canon` edition
- Inserts the thread row with sort_order in the 1001-1100 range so all S181 work is easy to query as a cohort
- Inserts cross_references via WITH input(...) + JOIN on the verse lookup
- Links thread members with `ROW_NUMBER() OVER (...)` ordering by source then target canonical order
- Every INSERT carries `ON CONFLICT DO NOTHING` for idempotency

| Migration | Threads | Members | Bytes |
|---|---|---|---|
| `session181_john_xref_threads.sql` | 16 | 171 | 137,564 |
| `session181_romans_xref_threads.sql` | 16 | 157 | 113,005 |
| `session181_galatians_xref_threads.sql` | 12 | 108 | 84,083 |
| `session181_revelation_xref_threads.sql` | 17 | 204 | 149,648 |
| **Total** | **61** | **640** | **484,300** |

**Non-canon members skipped (2):**
- `lifted-up-substance-brazen-serpent-to-crucifixion` John 3:14 → Wisdom of Solomon 16:7
- `son-of-adam-as-judge-and-ladder` John 1:51 → 1 Enoch 71:14

Both are extras-edition rows. They are deferred to a follow-up migration that uses the apocrypha/enoch edition slug. Not blocking the canon-anchored landings.

All four migrations were SQL-parsed clean via `sqlglot` postgres dialect (51 + 51 + 39 + 54 statements — counts match expected per-thread structure).

### Smoke test
- `session181_smoke_test.sql` — ten checks for Yoshi to run after applying: total thread count, per-book counts, total members, per-thread member counts, summary integrity, new-thread existence, Romans 11 closing-scripture lock, Revelation harlot diagnostic, Galatians book-name-rule compliance, end-to-end API path for John chapter 10.

---

## 2. What did NOT happen this session

- **Migrations were NOT applied to the database.** The sandbox has no network egress to the Render Postgres host (`dpg-d80hpgfaqgkc73a4po3g-a.oregon-postgres.render.com`). All four migration files are on disk and ready for Yoshi to apply via `psql "$DATABASE_URL" -f data-schema/migrations/session181_{book}_xref_threads.sql`. Procedure:

  ```bash
  cd /Users/mtm/Desktop/App
  source api/.env
  psql "$DATABASE_URL" -f data-schema/migrations/session181_john_xref_threads.sql
  psql "$DATABASE_URL" -f data-schema/migrations/session181_romans_xref_threads.sql
  psql "$DATABASE_URL" -f data-schema/migrations/session181_galatians_xref_threads.sql
  psql "$DATABASE_URL" -f data-schema/migrations/session181_revelation_xref_threads.sql
  # then the smoke test:
  psql "$DATABASE_URL" -f data-schema/migrations/session181_smoke_test.sql
  ```

  Each migration is idempotent — re-running produces zero side effects.

- **No end-to-end smoke test executed.** Same network constraint. The smoke-test SQL is on disk; Yoshi runs it after applying. If any of CHECK 4's per-thread member counts come back lower than the proposal asserts, the failure cause is almost always a verse reference in the proposal that does not exist in the canon edition (the JOIN silently drops). Re-investigate the specific thread.

- **Tier policy not finalized.** All S181 migrations default `tier_required = 'free'` (matching the John proposal's original default). The S140 split policy gates Layer 2 callouts at Companion via the thread tier, so `free` here means *render visible to all readers when Yoshi flips the global Layer-2 default,* not *render visible to free readers now.* If Yoshi wants any of the 61 threads in the actual free funnel (currently only the two S74-era threads), those need a follow-up UPDATE. Candidates flagged in the proposal footers: Romans Thread 12 (whosoever-calls-on-Yahuah), Romans Thread 13 (natural-branches-asleep), Romans Thread 16 (weak-and-strong), Galatians Thread 1 (galatians-as-scattered-seed), Galatians Thread 5 (curse-of-the-law), Galatians Thread 10 (liberty-in-messiah), John Thread 8 (yahusha-as-passover-lamb), John Thread 3 (other-sheep).

- **Two extras-edition members deferred** (see above).

---

## 3. Apply runbook — for Yoshi

Run from the App folder:

```bash
cd ~/Desktop/App
source api/.env   # exports DATABASE_URL
```

Apply each migration (any order is fine — they are independent):

```bash
psql "$DATABASE_URL" -f data-schema/migrations/session181_john_xref_threads.sql
psql "$DATABASE_URL" -f data-schema/migrations/session181_romans_xref_threads.sql
psql "$DATABASE_URL" -f data-schema/migrations/session181_galatians_xref_threads.sql
psql "$DATABASE_URL" -f data-schema/migrations/session181_revelation_xref_threads.sql
```

Then the smoke test:

```bash
psql "$DATABASE_URL" -f data-schema/migrations/session181_smoke_test.sql
```

Expected smoke-test outputs are inline-commented in the SQL. The critical ones:
- **CHECK 1:** `s181_thread_count = 61`
- **CHECK 2:** john=16, romans=16, galatians=12, revelation=17
- **CHECK 3:** s181_member_count ≈ 638 (640 minus the 2 extras skipped, minus any further verse-resolution drops)
- **CHECK 9:** `hebrew_book_name_violations = 0`

If anything diverges from expected, the most likely cause is a verse reference in a member row that doesn't resolve against the `canon` edition. CHECK 4 will surface the affected thread(s).

To roll back a single migration (if needed):

```sql
-- Threads landed by S181 are sort_order 1001-1100. Member rows cascade.
BEGIN;
DELETE FROM cross_reference_thread_members
 WHERE thread_id IN (SELECT id FROM cross_reference_threads
                      WHERE sort_order BETWEEN 1001 AND 1100);
DELETE FROM cross_references
 WHERE note LIKE 'thread:%-' AND note SIMILAR TO 'thread:(<list-of-s181-slugs>)%';
-- ...or just DROP and re-INSERT specific threads.
COMMIT;
```

---

## 4. PWA / API verification (post-apply)

Once the migrations are landed, visit the PWA reader at any of the anchor chapters and confirm the chapter-end card surfaces the new threads. Expected first-pass surfaces:

- **John 10** — `other-sheep-and-the-lost-house-of-yashar-el`, `my-sheep-hear-my-voice-hearing-reveals-not-creates`, `i-am-statements` (multiple I-am members fall here), `i-and-my-father-are-one-formless-and-formed`
- **John 1** — `word-made-flesh-formed-of-the-formless`, `born-not-of-blood-flesh-credentialing-refused` (NEW), `son-of-adam-as-judge-and-ladder` (NEW)
- **Romans 11** — `natural-branches-asleep-grafted-again` + the existing S74 `false-inclusion-rebuttal`
- **Galatians 3** — `paidagogos-as-pre-messianic-guardian`, `neither-jew-nor-greek-removes-hierarchy-not-identity`, `the-seed-of-promise-is-singular-paternal`, `erga-nomou-as-flesh-credential-system`, `curse-of-the-law-as-deuteronomy-28-exile`
- **Revelation 1** — `like-the-son-of-adam-coming-with-the-clouds`
- **Revelation 7** — `144000-sealed-of-the-twelve-tribes`, `great-multitude-no-man-could-number`
- **Revelation 17-18** — `harlot-babylon-and-come-out-of-her`

At the free tier today these will render as the Companion-gate teaser+fade (per S140 Option C), not the full body. To preview full bodies, sign in at a Companion+ test account or temporarily flip the threads' `tier_required` to `'free'` via SQL on a staging copy.

---

## 5. Open questions carried forward

All S180 open questions (1–8) remain. New from S181:

9. **Tier promotion calls.** Eight thread-promotion candidates flagged in the proposal footers (above). Yoshi to call which (if any) land in the free funnel vs stay at the Companion-gate-default. Trivial UPDATE statements once decided.

10. **Extras-edition follow-up migration.** Two members deferred (Wisdom of Solomon 16:7 for John 3:14, 1 Enoch 71:14 for John 1:51) plus any later cross-references into Jasher, Jubilees, Apocrypha that the framework wants on the page. Mechanical work; the `session134_matt_5_extras_cross_references.sql` is the existing pattern.

11. **Romans 15 and 16.** Drafted in planning but cut for the 12-16 cap. Two threads queued: `yahusha-minister-of-the-circumcision` on Romans 15:8-12 (Tanakh-citation chain: Psalm 18:49, Deuteronomy 32:43, Psalm 117:1, Isaiah 11:10), and `mystery-kept-secret-since-the-world-began` on Romans 16:25-27.

12. **Track D — additional book fan-out.** S180's checkpoint already named Genesis, Exodus, Leviticus, Deuteronomy, Isaiah, Jeremiah, Ezekiel, Daniel, Hosea, Acts, Hebrews, James, 1 Peter, 2 Peter, 1 John as the next-wave priority. Same drafter-+-verifier subagent pattern that worked at S180 is the right shape.

13. **HIGH PRIORITY — NT *Lord*-to-Yahuah over-extension in the canon text.** Surfaced at the end of S181 by Yoshi. The restoration pipeline's `Lord_mixed` rule in `restoration-pipeline/restore.py` blindly converts standalone mixed-case `Lord` → `Yahuah (Lord)` across the entire canon, with only one protection: a possessive-pronoun stash (my/our/thy + Lord) catching some vocatives. Everywhere else in the NT — vocatives addressed to Yahusha, Yahusha naming Himself, title compounds like *Lord Jesus* / *Lord of lords* — the swap fires inappropriately, calling Yahusha "Yahuah" by accident. Sampled 16 high-leverage NT verses; 13 mis-rendered. Audit findings in §7 below. Fix is its own substantial piece of pipeline work — separate session.

---

## 7. NT Lord-to-Yahuah audit findings (S181 close)

Yoshi raised the concern that the *the LORD → Yahuah* rule may have over-extended across the New Testament where most "Lord" instances refer to Yahusha (or are vocatives, titles, or human-master forms). The voice skill already documents the gap honestly: *"Standalone mixed-case `Lord` defaults to `Yahuah (Lord)` because the canon's small-caps-LORD-vs-mixed-case-Lord distinction is unrecoverable from the flattened canon parse."* The audit confirms the over-extension is real and widespread in the canon text now in the database.

### Confirmed failures (13 of 16 sampled NT verses)

**Vocatives addressed to Yahusha — rendered as Yahuah, should preserve "Lord":**
- **John 6:68** — *Yahuah (Lord), to whom shall we go?* (Peter to Yahusha)
- **John 9:38** — *Yahuah (Lord), I believe. And he worshipped him.* (man born blind, worshipping Yahusha)
- **John 11:27** — *Yea, Yahuah (Lord)* (Martha to Yahusha)
- **John 14:5** — *Yahuah (Lord), we know not whither thou goest* (Thomas to Yahusha)

**Yahusha naming Himself — rendered as Yahuah, should preserve "Lord":**
- **John 13:13** — *Ye call me Master and Yahuah (Lord): and ye say well; for so I am.*

**Title compounds for Yahusha — rendered as Yahuah, should render as compound or preserve:**
- **Acts 2:36** — *both Yahuah (Lord) and Messiah (Christ)*
- **Romans 10:9** — *confess with thy mouth Yahuah (Lord) Yahusha (Jesus)*
- **Romans 14:14** — *persuaded by Yahuah (Lord) Yahusha (Jesus)*
- **1 Corinthians 8:6** — *one Yahuah (Lord) Yahusha HaMashiach*
- **1 Corinthians 16:22** — *love not Yahuah (Lord) Yahusha HaMashiach*
- **Philippians 2:11** — *Yahusha HaMashiach is Yahuah (Lord)*
- **Revelation 22:20** — *come, Yahuah (Lord) Yahusha (Jesus)*
- **Revelation 19:16** — *KING OF KINGS, AND Yahuah (LORD) OF LORDS* (this is the King-of-kings title for Yahusha at the return — the swap actively breaks the title compound)

### Cases that survived correctly

- **Romans 1:3** — *Yahusha HaMashiach (Jesus Christ) our Lord* (possessive *our* triggered the secular-vocative stash)
- **John 20:28** — *My Lord and my Elohim (God)* (possessive *My* triggered the stash)

### Cases that are theologically defensible to keep

- **1 Corinthians 12:3** — *no man can say that Yahusha (Jesus) is Yahuah (Lord), but by the Ruach HaKodesh (Holy Spirit)* — this is the single Spirit-revealed NT verse where the Yahusha-IS-Yahuah identification is explicit, and the rendering carries the framework's load-bearing identification of Yahusha as the Formed Yahuah. KEEP.
- **Romans 10:13** — *call upon the name of Yahuah (Lord) shall be saved* — Paul is quoting Joel 2:32 where the underlying Hebrew is YHWH; the Yahuah substitution honors the OT source. Either reading works; KEEP.

### Pattern

The pipeline's `Lord_mixed` rule catches "Lord" preceded by a possessive pronoun (my/our/thy/his) via the secular-vocative stash. Standalone "Lord" in any other NT context — vocative without possessive, title compound like *Lord Jesus*, Yahusha self-naming, *Lord of lords* — gets the Yahuah swap unconditionally. The fix needs additional preserved-phrases stash entries plus per-verse override capability. The voice skill's noted next-wheel work (re-parsing the canon with `<nd>` preservation) addresses the OT Adonai/YHWH split but does NOT solve the NT problem, because the underlying Greek is κύριος (kyrios) referring to Yahusha in most NT occurrences, not the Hebrew YHWH.

### Recommended fix path

1. Augment `restore.py` preserved-phrases stash with:
   - `Lord Jesus` / `Lord Jesus Christ` → render as `Lord Yahusha (Lord Jesus)` / `Lord Yahusha HaMashiach (Lord Jesus Christ)` (or compound restoration)
   - `Master and Lord` → preserve (Yahusha self-naming pattern from John 13:13)
   - `Lord of lords` → preserve as title
   - `Lord and Christ` → preserve (Acts 2:36 pattern)
   - `Lord and Messiah` (post-restoration) → preserve
2. Add a per-verse override file for the NT vocatives to Yahusha not caught by the above patterns (John 6:68 *Lord, to whom*, John 9:38 *Lord, I believe*, John 11:27, John 14:5, and synoptic parallels — Matthew/Mark/Luke have many similar).
3. Apply explicit KEEP markers on the framework-defensible cases (1 Corinthians 12:3, Romans 10:13) so they don't get unrolled.
4. Re-parse the NT canon via the `_session149_modernize_canon.py` pattern.
5. Re-load into the database via the standard verses-table update.
6. Update the voice skill `references/framework-deep.md` (or sacred-names section of SKILL.md) to add explicit NT-Lord guidance: NT *Lord* referring to Yahusha → preserve as *Lord* (or compound *Lord Yahusha* where construction supports); NT *Lord* in OT-quotation context where underlying Hebrew is YHWH → *Yahuah*; NT *Lord* as human master / vocative-to-human → preserve; 1 Corinthians 12:3 → the Spirit-revealed identification, framework's load-bearing equation.
7. Re-render any published books (S160-era) that printed off the current canon text.
8. Re-run the smoke audit (the 16-verse sample script in `outputs/build_sql_migrations.py` neighborhood) post-fix to verify.

---

## 8. Session discipline notes

- Yoshi delegated full editorial authority mid-session ("you got my voice skill, make decisions, make good choices"). I honored the *Self-Sufficient Application of Skill + Source* discipline — drafted, edited, gated, and produced deliverables without asking for per-line confirmation. The framework was the standard; the source was the proposals; the deliverables landed.
- One sandbox-egress constraint hit: no DNS to the Render Postgres host. The voice skill's *Ask Directly When Permission Walls Block the Work* rule applies — but in this case the work can be completed by Yoshi running the migrations locally, which is the standard pattern (`Run via: psql "$DATABASE_URL" -f ...`) the project has used since S73. Migrations on disk, runbook above.
- The Python migration-builder script (`build_sql_migrations.py`) is reusable for Track D — any future markdown proposal in the same shape parses and converts identically. Saved at `~/Library/Application Support/Claude/local-agent-mode-sessions/.../outputs/build_sql_migrations.py` in the session, the canonical copy should move to `data-schema/tools/` when Track D begins.
