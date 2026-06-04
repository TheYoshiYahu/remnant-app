# S182 Checkpoint — NT Lord-to-Yahuah over-extension fix

**Date:** 2026-05-31
**Mode:** Yoshi delegated full editorial authority on the S181 §7 NT *Lord*-to-Yahuah audit findings. The mandate (mechanical-then-verify, not theological): close the gap the voice skill itself documented — the standalone-mixed-case `Lord` → `Yahuah (Lord)` default was firing across the NT and calling Yahusha "Yahuah" wherever the disciples address him, where he names himself, and in every `Lord Jesus` / `Lord of lords` title compound.

The audit cases this session is grounded in (§7 of the S181 checkpoint):

> **Vocatives addressed to Yahusha** — John 6:68 (Peter), 9:38 (man born blind, worshipping Yahusha), 11:27 (Martha), 14:5 (Thomas).
> **Yahusha naming Himself** — John 13:13 (*Ye call me Master and Yahuah (Lord)*).
> **Title compounds for Yahusha** — Acts 2:36, Romans 10:9, Romans 14:14, 1 Corinthians 8:6, 1 Corinthians 16:22, Philippians 2:11, Revelation 22:20, Revelation 19:16 (*KING OF KINGS, AND Yahuah (LORD) OF LORDS* — the King-of-kings title for Yahusha at the return).
> **Cases that survived correctly** — Romans 1:3 (*our Lord*), John 20:28 (*My Lord*).
> **Framework-defensible cases to keep** — 1 Corinthians 12:3 (Spirit-revealed equation), Romans 10:13 (Joel 2:32 quotation; underlying Hebrew is YHWH).

---

## 1. What shipped this session

### Widened audit

Wrote `outputs/s182/widen_nt_lord_audit.py` and walked every NT chapter of `source-texts/parsed/canon.json`. The widened audit confirmed the over-extension at scale:

| Metric | Count |
|---|---|
| NT verses scanned | 7,957 |
| NT verses with `Yahuah (Lord)` (pre-S182) | 565 |
| Total `Yahuah (Lord)` occurrences (pre-S182) | 607 |

By book (top — descending):

| Book | Count |
|---|---|
| Acts | 105 |
| Luke | 83 |
| Matthew | 52 |
| 1 Corinthians | 52 |
| John | 40 |
| Romans | 37 |
| 2 Corinthians | 30 |
| 1 Thessalonians | 25 |
| Ephesians | 24 |

By pattern bucket:

| Bucket | Count |
|---|---|
| vocative_standalone (`Yahuah (Lord),` at clause start) | 186 |
| title_compound_lord_yahusha (`Yahuah (Lord) Yahusha ...`) | 117 |
| yahusha_is_lord (Phil 2:11 / 1 Cor 12:3 pattern) | 4 |
| lord_of_lords (Rev 17:14, 1 Tim 6:15, Rev 19:16) | 3 |
| master_and_lord_selfnaming (John 13:13) | 1 |
| lord_and_messiah (Acts 2:36) | 1 |

Full report: `_scratch/_session182_nt_lord_audit.json`.

### Pipeline patch (`restoration-pipeline/restore.py`)

Three transformation rules added to `RULES`, between `holy_spirit` and `jesus_christ`:

1. `lord_jesus_christ_compound`: `Lord Jesus Christ` → `Lord Yahusha HaMashiach (Lord Jesus Christ)`
2. `lord_jesus_compound`: `Lord Jesus` → `Lord Yahusha (Lord Jesus)`
3. `lord_and_christ_acts_2_36`: `Lord and Christ` → `Lord and Messiah (Lord and Christ)`

Three new heads added to `_HEBREW_HEADS` (longest-first ordering) so the `_ALREADY_RESTORED_PAT` stash protects the leading `Lord` from `Lord_mixed`:

- `Lord Yahusha HaMashiach`
- `Lord Yahusha`
- `Lord and Messiah`

Three preserved-phrase regexes added to `PRESERVED_PHRASES` for pure verbatim stashes:

- `Master and Lord` — John 13:13 Yahusha self-naming
- `Lord of lords` — mixed-case (1 Tim 6:15, Rev 17:14)
- `LORD OF LORDS` — all-caps (Rev 19:16)

**Beneficial side-effect of the head extension:** `jesus_christ_possessive` produces `Yahusha HaMashiach's (Jesus Christ's)` from any `Jesus Christ's` source — and because `Lord Yahusha HaMashiach` is now a Hebrew head, when the source is `the Lord Jesus Christ's` (Romans 15:30), the stash pattern catches the leading `Lord` as part of `Lord Yahusha HaMashiach's (Jesus Christ's)` and protects it from `Lord_mixed`. No separate possessive rule needed.

**12 new self-tests added; 1 existing test updated.** All 120 self-tests pass.

### Per-verse overrides (`restoration-pipeline/YOSHI_RENDERED_PASSAGES.md`)

14 per-verse `LANDED 2026-05-31 (S182)` entries added under a shared S182 NT Lord-to-Yahusha Vocative Preserves section. Each entry has the verse rendering and a short chapter-level footnote explaining the rationale:

| Verse | Category |
|---|---|
| John 6:68 | Peter vocative |
| John 9:38 | Blind man, worshipping |
| John 11:27 | Martha's confession |
| John 14:5 | Thomas vocative |
| Matthew 8:25 | Disciples in storm |
| Matthew 14:28 | Peter on the water |
| Matthew 14:30 | Peter sinking |
| Matthew 17:4 | Peter at transfiguration |
| Luke 9:54 | James + John |
| Luke 10:40 | Martha (Lucan) |
| Luke 11:1 | Disciple requesting prayer |
| Luke 17:5 | Apostles' faith request |
| Luke 22:49 | Disciples at arrest |
| Philippians 2:11 | Reverse construction: *Jesus Christ is Lord* |

The `yoshi_overrides.py` loader confirms 49 total verse overrides across 15 chapter footnotes (35 pre-S182 + 14 S182 + 1 already-existing chapter footnote sharing a chapter slot).

### Re-parse and re-load

`parse_canon.py` re-run from the USFX source produced a clean canon: 66 books, 1189 chapters, 31102 verses — matches the canonical Protestant 66 KJV totals.

Pre-patch canon backed up at `source-texts/parsed/canon.json.pre-s182` for diff comparison.

### Validation diff (`outputs/s182/validate_canon_diff.py`)

Total verse changes: **135**.

| Kind | Count |
|---|---|
| lord_jesus_christ_compound | 81 |
| lord_jesus_compound | 32 |
| yoshi_override | 14 |
| lord_of_lords_preserve | 5 |
| master_and_lord_preserve | 1 |
| lord_and_christ_compound | 1 |
| lord_jesus_christ_possessive_via_head_stash | 1 (Romans 15:30) |

By book (top): Acts (20), Romans (11), 1 Cor (11), 1 Thess (11), 2 Thess (11), 2 Cor (8), Ephesians (8), Luke (6), John (5), Philippians (5), 1 Tim (5), Matthew (4), Galatians (4), Revelation (4).

**OT changes: 2 (expected and accepted).** Deuteronomy 10:17 (*Yahuah Elohaychem ... is Elohim of gods, and Lord of lords*) and Psalm 136:3 (*O give thanks to the Lord of lords*). Both already name Yahuah elsewhere in the verse; the title-pair *Lord of lords / King of kings* is preserved consistently with the NT cases. Not regressions — the same framework reading applied in both registers.

Zero unclassified diffs after the head-stash-possessive classifier was added.

### Post-fix 16-verse audit

Wrote `outputs/s182/audit_16_verses.py` replaying the original §7 sample (16 verses + Revelation 19:16 split out = 17 cases). Result: **17 PASS, 0 FAIL.**

| Status | Cases |
|---|---|
| 13 prior FAIL cases now PASS | John 6:68, 9:38, 11:27, 14:5, 13:13; Acts 2:36; Rom 10:9, 14:14; 1 Cor 8:6, 16:22; Phil 2:11; Rev 22:20, 19:16 |
| 2 prior PASS cases still PASS | Rom 1:3, John 20:28 (possessive *our*/*my* stash holds) |
| 2 framework-defensible KEEPs preserved | 1 Cor 12:3 (Spirit-revealed equation: *Yahusha (Jesus) is Yahuah (Lord)*); Rom 10:13 (Joel 2:32 quotation: *name of Yahuah (Lord) shall be saved*) |

### Voice skill update (`_scratch/yoshi-voice/SKILL.md`)

Appended a *NT Lord governing rule (locked S182, 2026-05-31)* block to the Sacred Names Convention's *Adonai (Lord)* entry. The four-bullet rule per Yoshi's mandate:

1. NT *Lord* referring to Yahusha (titular, vocative, self-naming) → preserve as *Lord*; render compound as *Lord Yahusha* / *Lord Yahusha HaMashiach* where Lord binds to Yahusha by name.
2. NT *Lord* in OT-quotation context where underlying Hebrew is YHWH → render as *Yahuah (Lord)*.
3. NT *Lord* as human master / vocative-to-human → preserve as *Lord*.
4. 1 Corinthians 12:3 specifically → the Spirit-revealed equation, the framework's load-bearing identification of Yahusha as the Formed Yahuah.

The S182 implementation surface (which patterns land in `restore.py`, which verses live in `YOSHI_RENDERED_PASSAGES.md`, what's queued as follow-on) is documented at the end of the block.

---

## 2. What did NOT happen this session

- **Migrations not re-applied to the database.** Same sandbox-egress wall as S181: no DNS to the Render Postgres host. Yoshi confirmed at the close of S181 that CHECK 1 returned 61 from his terminal (migrations are landed); the S182 canon.json regeneration is a data-layer change that propagates to the DB via the canon-update pipeline Yoshi runs locally. Run sequence after pulling S182 changes:

  ```bash
  cd ~/Desktop/App
  source api/.env
  # Regenerate canon (already done in S182 sandbox; re-run locally if you want a fresh build)
  python3 restoration-pipeline/parse_canon.py
  # Push canon to DB via the existing verse-update path (whatever Yoshi's standard is —
  # session 149 used a dedicated migration; the verse-table update mechanism is the
  # same one used for S149 modernization and S161/161b/161c sacred-name remaps).
  ```

  The 135 changed verses will surface in the PWA reader on the next push.

- **Broader synoptic vocative density not addressed.** The §7 fix-path named "John 6:68, John 9:38, John 11:27, John 14:5, and synoptic Gospel parallels" — and the S182 patch lands the four John verses plus a representative tight set of synoptic parallels (Matthew 8:25, 14:28, 14:30, 17:4; Luke 9:54, 10:40, 11:1, 17:5, 22:49). The broader sweep (Matthew 16:22, 18:21, 26:22; Luke 5:8, 9:57, 9:59, 9:61, 10:17, 12:41, 13:23, 19:8, 22:33; and others) is queued as open work. The remainder requires per-case approval since the same surface form *Lord,* addresses both Yahusha and Yahuah-the-Father across the NT (prayers, OT-quotations) and the disambiguation is contextual, not mechanical.

  Post-S182 NT residual `Yahuah (Lord)` count: **471 occurrences across 433 verses** (down from 607 / 565 pre-S182). The residual includes:
  - Vocatives to Yahuah-the-Father in prayers (correctly Yahuah-restored).
  - OT-quotation contexts in NT where the underlying Hebrew is YHWH (correctly Yahuah-restored).
  - Synoptic vocatives-to-Yahusha not yet enumerated (the queued follow-on work).
  - Standalone titular references to Yahusha not bound by a title-compound pattern (also queued).

  The mechanical-then-verify discipline holds: this session landed the bulk-correctable cases (608→471, 136 occurrences and ~14 named verses); the per-case sweep is a separate wheel.

- **Published-book re-render queue is empty.** Scanned 15 published .docx books on Desktop (My Book / Print, `_book_backups_2026-05-05_0119/{edit,finished}`, Claude Jubilees, Claude the Apocrypha). **None carry the NT-Lord over-extension signatures.** The four published Restored Names extras editions (Enoch, Jasher, Jubilees, Apocrypha) are OT-era pseudepigrapha — NT title compounds don't appear. The published authored books (Ephraim Rising, Decoding Salvation, Did God Really Say, Galatian Deception, The Sides of the North, NOT MY PEOPLE, THE FAITH IN JESUS THAT SAVES, MY YOKE IS EASY..., Rapture Deception Exposed, WHAT IS ZIONISM, YOU SHOULD HAVE KNOWN BETTER, EXPOSING THE WOLVES...) carry Yoshi-edited prose; the audit found 0 over-extension signatures across all of them.

  **Bug is contained to the canon edition (DB + PWA reading surface).** No re-render queue. The fix lands once canon.json updates propagate to the DB.

- **The two voice-skill SKILL.md copies were not synced.** The S182 update landed in `_scratch/yoshi-voice/SKILL.md` (the active development copy, 1459 lines). The bundled-skill copy at `~/Library/Application Support/Claude/.../skills/yoshi-voice/SKILL.md` and the alternate at `docx claude finished/SKILL.md` (1297 lines) carry the older version. Skill bundle update queued per the *Updating This Skill* procedure in `references/bookcraft-mechanics.md`.

---

## 3. Apply runbook — for Yoshi

```bash
cd ~/Desktop/App
# Verify the self-tests pass
python3 restoration-pipeline/restore.py --self-test
# Expected: Self-test: 120 passed, 0 failed (of 120)

# Re-parse the canon (this regenerates canon.json from USFX + restore.py + overrides)
python3 restoration-pipeline/parse_canon.py
# Expected: canon books=66 chapters=1189 verses=31102 OK

# Re-run the validation diff
python3 ~/Library/Application\ Support/Claude/.../outputs/s182/validate_canon_diff.py
# Expected: 135 NT+OT changes, all classified, 14 yoshi_override landings, 0 unclassified

# Re-run the 16-verse §7 audit replay
python3 ~/Library/Application\ Support/Claude/.../outputs/s182/audit_16_verses.py
# Expected: Summary: 17 PASS, 0 FAIL (of 17)

# Push canon to the DB via your standard mechanism (verse-table update path —
# see _session149_modernize_canon.py for the migration-build pattern)
```

The validation harness scripts live in the session outputs at
`~/Library/Application Support/Claude/local-agent-mode-sessions/.../outputs/s182/`.
Copies should move to `restoration-pipeline/tools/` when convenient.

---

## 4. Verses changed (full list, classified by fix kind)

### `lord_jesus_christ_compound` (81 verses)
Title-compound rule fires on `Lord Jesus Christ` → `Lord Yahusha HaMashiach (Lord Jesus Christ)`. Distributed across Acts, Pauline epistles, Hebrews, James, Peter, Jude.

### `lord_jesus_compound` (32 verses)
Title-compound rule fires on `Lord Jesus` → `Lord Yahusha (Lord Jesus)`. Distributed across the gospels and Pauline epistles.

### `lord_jesus_christ_possessive_via_head_stash` (1 verse)
Romans 15:30 — the possessive form of *the Lord Jesus Christ's sake* picked up by the head-stash extension.

### `yoshi_override` (14 verses)
The per-verse overrides registered in YOSHI_RENDERED_PASSAGES.md (the table in §1 above).

### `lord_of_lords_preserve` (5 verses)
- 1 Timothy 6:15 (*King of kings, and Lord of lords*)
- Revelation 17:14 (*he is Lord of lords, and King of kings*)
- Revelation 19:16 (*KING OF KINGS, AND LORD OF LORDS* — all-caps)
- Deuteronomy 10:17 (OT — same title-pair framework consistency)
- Psalm 136:3 (OT — *O give thanks to the Lord of lords*)

### `master_and_lord_preserve` (1 verse)
John 13:13 (*Ye call me Master and Lord*).

### `lord_and_christ_compound` (1 verse)
Acts 2:36 (*both Lord and Messiah (Lord and Christ)*).

---

## 5. Open questions carried forward

All S181 open questions (1–13) remain. New from S182:

14. **Broader synoptic vocative sweep.** Open verses include Matthew 16:22, 18:21, 26:22; Luke 5:8, 9:57, 9:59, 9:61, 10:17, 12:41, 13:23, 19:8, 22:33. Each requires a per-case framework call: is this vocative addressed to Yahusha (preserve *Lord*), to Yahuah-the-Father (keep *Yahuah (Lord)*), or to a human master (preserve *Lord*)? Yoshi: which mechanism — extend YOSHI_RENDERED_PASSAGES.md case by case, or add a per-verse "lord vocative" lookup table the pipeline consumes? The whole-verse override pattern in YOSHI_RENDERED_PASSAGES.md is heavy for what's essentially a one-token swap; a lighter-touch verse-level *Lord-preserve* mechanic would scale better.

15. **NT-Lord in OT-quotation contexts beyond Romans 10:13.** Hebrews 1:10 (Psalm 102:25), Acts 2:21 (Joel 2:32), Acts 2:25 (Psalm 16:8), Hebrews 8:8–11 (Jeremiah 31:31–34), 1 Peter 1:25 (Isaiah 40:8), 1 Peter 3:12 (Psalm 34:15–16), and others quote OT passages where the underlying Hebrew is YHWH. Pipeline default (`Lord_mixed` → `Yahuah (Lord)`) is correct for these — but worth a deliberate audit pass to confirm and lock framework-defensible *Yahuah* renderings explicitly (mirroring the explicit KEEP markers for 1 Cor 12:3 and Rom 10:13). Queued as a follow-on wheel.

16. **Voice-skill bundle sync.** S182 SKILL.md update landed in `_scratch/yoshi-voice/SKILL.md`. The bundled skill copy and the `docx claude finished/SKILL.md` mirror need to be brought current. Mechanical work per the *Updating This Skill* procedure in `references/bookcraft-mechanics.md`.

17. **DB propagation pathway.** Confirm with Yoshi which mechanism pushes canon.json updates to the DB now that S149 / S161 / S161b / S161c established the verse-table modernize-then-update pattern. The S182 changes are 135 verses across 66 books; the migration-build pattern from `_session149_modernize_canon.py` and `_session161_modernize_verse_words.py` is the obvious template. A dedicated S182 migration that updates the 135 verses in `verses.text` is the cleanest landing path — same shape as the S149 / S161 migrations.

---

## 6. Files changed this session

- `restoration-pipeline/restore.py` — title-compound rules, _HEBREW_HEADS extension, preserved-phrase additions, 12 new self-tests, 1 updated test
- `restoration-pipeline/YOSHI_RENDERED_PASSAGES.md` — 14 per-verse override entries plus shared rationale section
- `source-texts/parsed/canon.json` — regenerated (135 verses changed)
- `source-texts/parsed/canon.json.pre-s182` — backup of the pre-patch canon for diff comparison
- `_scratch/yoshi-voice/SKILL.md` — Sacred Names Convention NT Lord governing rule appended
- `_scratch/_session182_nt_lord_audit.json` — full widened audit report

Session output scripts (in the agent-mode outputs folder; canonical copies should move to `restoration-pipeline/tools/`):

- `outputs/s182/widen_nt_lord_audit.py`
- `outputs/s182/validate_canon_diff.py`
- `outputs/s182/audit_16_verses.py`

---

## 7. Session discipline notes

- Yoshi delegated authority on the mechanical-then-verify mandate. The fix was bounded to the §7 audit findings — title-compound rules, preserved-phrase stashes, per-verse overrides for the named John verses and synoptic parallels, framework-defensible KEEPs for 1 Cor 12:3 and Rom 10:13. No theological overreach; no new framework introduced; the voice skill's existing gap-disclosure was the load-bearing standard.
- Sandbox-egress wall hit on DB verification (same as S181). The *Ask Directly When Permission Walls Block the Work* discipline was applied: Yoshi confirmed that Render had been greenlit from his terminal at S181 close and the migrations are landed. CHECK 1 = 61 trusted; S182 work continued.
- Beneficial side-effect discovered during validation: the `_HEBREW_HEADS` extension transparently catches the possessive form `the Lord Jesus Christ's` via the existing already-restored stash mechanism, removing the need for a separate `lord_jesus_christ_possessive` rule (Romans 15:30 was the surfacing case).
- Two OT changes (Deut 10:17, Ps 136:3) surfaced through the *Lord of lords* preserved-phrase rule. Both are framework-consistent applications of the same title-pair reading; neither is a regression. The validation harness was updated to expect them.
- Self-tests grew from 108 to 120 (12 new tests covering the S182 patterns; 1 existing test updated to expect the post-S182 *our Lord Jesus Christ* → *our Lord Yahusha HaMashiach (Lord Jesus Christ)* rendering, replacing the old expectation that codified the bug).
