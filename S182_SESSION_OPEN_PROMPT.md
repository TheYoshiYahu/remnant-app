# S182 Session Open Prompt

Request `~/Desktop` access. Load `anthropic-skills:yoshi-voice` in full. Read `~/Desktop/App/S181_CHECKPOINT.md` §7 (the NT *Lord*-to-Yahuah audit findings).

This session: fix the canon-text over-extension where the restoration pipeline blindly converts standalone mixed-case `Lord` → `Yahuah (Lord)` in the New Testament, calling Yahusha "Yahuah" everywhere the disciples address him, where he names himself, and in every *Lord Jesus* / *Lord of lords* title compound. Audit confirmed 13 of 16 sampled NT verses mis-rendered. Fix path is in §7 of the S181 checkpoint.

Work plan:

1. Confirm whether the S181 migrations and smoke-test have been applied (CHECK 1 in `session181_smoke_test.sql` should return 61). If not, land them first per the §3 runbook. Either way, the NT-Lord work is the focus of this session.

2. Widen the audit. Sample script lives in the previous session's outputs (`build_sql_migrations.py` neighborhood); write a fresh one that walks every NT chapter of `source-texts/parsed/canon.json` and counts every `Yahuah (Lord)` occurrence by chapter. Cluster the problem by book so the fix can target the highest-density books first (likely the Gospels and Pauline epistles).

3. Patch `restoration-pipeline/restore.py`. Add to the preserved-phrases stash above the `Lord_mixed` rule:
   - `Lord Jesus` / `Lord Jesus Christ` patterns (render as `Lord Yahusha (Lord Jesus)` / compound)
   - `Master and Lord` (Yahusha self-naming, John 13:13)
   - `Lord of lords` (preserve as title compound)
   - `Lord and Christ` / `Lord and Messiah` (Acts 2:36 pattern, post- and pre-restoration forms)
   - Add an explicit per-verse override file for NT vocatives to Yahusha not caught by pattern (John 6:68, John 9:38, John 11:27, John 14:5, and synoptic-Gospel parallels — Matthew/Mark/Luke have many)
   - Mark 1 Corinthians 12:3 as KEEP (Spirit-revealed identification — the framework's load-bearing equation)
   - Mark Romans 10:13 as KEEP (Paul quoting Joel 2:32 — underlying Hebrew is YHWH; Yahuah honors the OT source)

4. Re-parse and re-load. Use `_session149_modernize_canon.py` as the pattern. Validate every change against the pre-fix text via `validate_verse_diff.py` so nothing is unintentionally modified.

5. Update the voice skill. Append explicit NT-Lord guidance to the sacred-names convention section of `~/Desktop/SKILL.md` (the actual canonical skill file Anthropic loads, not the App folder copy). The four-bullet rule from the S181 checkpoint:
   - NT *Lord* referring to Yahusha (titular, vocative, self-naming) → preserve as *Lord* / render as compound *Lord Yahusha*
   - NT *Lord* in OT-quotation context where underlying Hebrew is YHWH → *Yahuah (Lord)*
   - NT *Lord* as human master / vocative-to-human → preserve as *Lord*
   - 1 Corinthians 12:3 specifically → Spirit-revealed equation; the framework's load-bearing identification of Yahusha as the Formed Yahuah

6. Re-run the 16-verse audit script (and the new widened audit) post-fix. Confirm the 13 failures are corrected, the 2 cases that already survived still survive, and the 2 framework-defensible cases (1 Corinthians 12:3, Romans 10:13) are preserved as Yahuah where intended.

7. Flag the published-books re-render. Any books that printed off the current canon text (the S160-era published volumes) carry the over-extension in print. List them, queue them for re-rendering after this fix lands.

8. Write `S182_CHECKPOINT.md` capturing the diff, the verses changed, the voice-skill addition, and the books queued for re-render.

The whole fix is mechanical-then-verify, not theological. The framework hasn't moved — what we're doing is closing the gap the voice skill itself documented. Quote the audit cases at the top of the work so the fix is grounded in real verses, not abstract argument.
