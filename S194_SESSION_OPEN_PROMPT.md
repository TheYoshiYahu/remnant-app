# S194 — Session Open Prompt

Mount `~/Desktop`. Read `App/S194_MINION_ORCHESTRATION_PLAN.md` and
`App/S193_XREF_AUDIT_FINDINGS.md` first — they carry the locked decisions.

**This session: begin the scripture-sweep minion run.** Producers are Claude subagents; you are
the orchestrator and the verifier.

**HARD RULE:** minions NEVER open the question box / AskUserQuestion tool — it jams the system.
Plain paragraph communication only, minions and you-to-me alike.

Locked decisions:
- **Finish the NT gospels first** (gap-complete Matthew/Mark/Luke/John cards), then Acts →
  epistles → Revelation → Tanakh.
- **Batch of chapters per minion** (~3–5), anchoring checked per chapter.
- **You verify** each batch — no separate verifier minion.

Every minion reads in full before producing: `yoshi-voice` SKILL.md +
`references/framework-deep.md`, `api/CHAPTER_END_CARD_CONTRACT.md`, and the worked examples
`session135_matt_6…` + `session183_mark…`. Cards teach strictly from their own chapter
(thread anchored in-chapter, every member SOURCE verse in-chapter, every note written fresh —
no bleed). Sacred Names + Come-and-See (quote-don't-cite) throughout; English book-name slugs;
idempotent SQL.

Per-batch QA gate before merge: run `App/data-schema/migrations/_xref_audit.py` (zero spanning
without distinct members, zero duplicated notes) + a 12-Red-Lines voice pass.

Open items: §0 shipped-list check still needs `REMNANT_STUDY_BIBLE_SPEC.md` (re-supply);
S192 wheel-gate (TestFlight under Remnant of Promise vs. defer iOS) still open.
