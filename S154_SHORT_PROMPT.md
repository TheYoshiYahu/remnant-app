S154 open. Read `S154_SESSION_OPEN_PROMPT.md` for full context — short version below.

**What happened S153.** Emergency: all Matthew commentary + xrefs vanished from live PWA. Root cause: `seed.py --seed-only` cascade-deletes canon (not just extras as render.yaml:33 claims), and `commentary_entries` + `cross_references` FKs are `ON DELETE CASCADE`. Restored via `_scratch/_s153_restore_matthew.py`. canon.json patched. PWA confirmed back.

**S154 priority — Wheel #A: fix seed.py so this can't recur.** Add `--reseed-canon` flag (default `--seed-only` skips canon). Flip FKs to `ON DELETE RESTRICT` on `commentary_entries.{chapter_id, verse_id}` + `cross_references.{source, target}_verse_id` + `cross_reference_thread_members.cross_reference_id`. Fix render.yaml:33 comment. Add seed.py sanity guard. Migration `session154_restrict_fks_against_canon_reload.sql`, apply harness `_s154_apply_and_verify.py`.

**Pair with Wheel #B (15 min):** read S149 to confirm/deny that S149's canon modernization is what instructed the seed reload. Write findings to `_scratch/_s154_postmortem.md`.

**After A+B, pick from S153 carry-over by Yoshi's energy:**
- PWA verification of S152 (needs `bible.remnantofpromise.org` allowlist add — see S153 open) — 60s.
- Wheel #5 cleanups (15-30 min, autonomous).
- Wheel #3 concept groups (30-60 min, Yoshi-led framework calls).
- Wheel #1 modernization stragglers (90+ min, the big lift).
- Wheel #6 pseudepigrapha vol 2 book-count audit (low priority).

**Read on session-open:** invoke `anthropic-skills:yoshi-voice`; read `S154_SESSION_OPEN_PROMPT.md`, `_scratch/_s153_restore_matthew.py` docstring, `api/seed.py` + `data-schema/schema.sql:277-385`. Then start with B → A → carry-over.
