# Track B repair — execution notes (this session)

## Source substitution (IMPORTANT)
Runbook's clean source (Wesley Center) is DOWN (NXDOMAIN). Wayback has no snapshots;
CCEL is "Images Only" (no text); sacred-texts is Cloudflare-403; earlyjewishwritings
is a link directory. The reachable full-text source for ALL 6 books in the SAME edition
is the **Internet Archive scan of Charles 1913 APOT vol.2** (`apocryphapseudep02charuoft`):
  - flat OCR: scratch_repair/src/charles-vol2-IA.txt (4.5MB, gitignored)
  - per-word coordinates available: _djvu.xml (61MB) for column-split if needed
Method (user-approved "Proceed with IA OCR, fidelity-gated"): per book, extract its page
range, strip footnote apparatus + page headers, OCR-correct conservatively, fidelity-gate
every body word against the raw OCR (fidelity_check.py — 0 unverified tokens required),
validate verse counts vs Charles structure, restore sacred names (restoration-pipeline),
backup current prod text, apply transactionally (apply_repair.py / generated SQL), verify.

## DB ACCESS BLOCKED (apply pending)
Direct Render Postgres access is blocked by the IP allow-list — my IP changed (now
98.97.86.216) when the date rolled. Live app unaffected (prod /books serves 200); only my
external psql/asyncpg is dropped at SSL handshake. ALL apply/verify/greenfield/xref-remap
need DB. ACTION: add 98.97.86.216 to Render `remnant-app-db` ipAllowList, then run applies.

## Book status
- 3-baruch (book_id 788, xref-free): TEXT REPAIRED + VALIDATED + STAGED.
    17 ch / 126 verses (was corrupt 13 ch / 69 v). fidelity 0 unverified tokens. pglast OK.
    Artifacts: out/3baruch.json (raw transcription), out/3baruch.restored.json (sacred names),
    migration data-schema/migrations/session401_3baruch_track_b_repair.sql.
    APPLY when DB up: `python3 scratch_repair/apply_repair.py scratch_repair/out/3baruch.restored.json 788`
    (does inbound-xref safety abort + backup + tx apply + count-verify). Then paragraph + xref + end cards.
- 2-enoch (786): NOT done. DUAL-RECENSION TWO-COLUMN layout (OCR '|' interleave at the
    body) — needs djvu.xml x-coordinate column split (pick recension A consistently). Higher risk.
- 2-baruch (787, 6 inbound xrefs), 4-maccabees (789, 12), testaments-xii (785, 44):
    single-column, transcribable like 3-baruch. xref-coupled -> after text apply, REMAP the
    inbound cross_references.target_verse_id by (chapter_number,verse_number) old->new. Needs DB.
- adam-eve (784, 20 v): DEFERRED pending DB coupling check. Confirm the live 1-adam-eve/
    2-adam-eve threads (bands 64000-66534) are on edition `adam-eve-conflict` (DIFFERENT book_ids),
    NOT on pseudepigrapha book_id 784, before any destructive change. Dual structure (Apoc Moses + Vita Adae).

## Reusable tooling (scratch_repair/)
fidelity_check.py <restored.json> <raw.txt>  | restore_book.py <in> <out>
gen_sql.py <restored.json> <book_id> <out.sql> | apply_repair.py <restored.json> <book_id> [--allow-inbound]
db_watch.sh (background reachability watcher -> DB_STATUS.txt)
