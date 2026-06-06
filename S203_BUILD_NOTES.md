# S203 — Session C built: My Study (the personal apparatus as flagship)

Proof was shown and signed off BEFORE wiring (S203_my_study_proof.html,
session outputs): the unified home, the highlight-color search filter,
and the Highlights-tab color sections with fill/underline/outline
sub-groups were all approved by Yoshi before a line of app code moved.
`tsc -b --force` clean.

## Decisions settled this session (transcribed per the skill rule)
- **Collections, not folders-vs-tags.** Yoshi leaned folders; the build
  is flat tags presented folder-style ("Collections") — one note can
  live under several headings, same field powers search + export
  filters. Folder feel, tag plumbing.
- **Export: Markdown + PDF, both in Session C** (Yoshi). PDF rides the
  print-view → system print dialog path (no new deps). Share-card of a
  single note NOT chosen — later if raised.
- **Tier line: free = basic marks, paid = the apparatus** (Yoshi).
  Free keeps yellow-fill highlights + bookmarks (nothing existing
  free partners have is taken away). Notes capped at 10 on free
  (Yoshi: "tight caps"); Study Notes $1.99 = unlimited notes,
  collections, search, color filter, export, edit/delete.
- **Search by highlight color** (Yoshi ask): swatch row under search
  narrows everything to one color; typing a color name or the
  partner's own color label matches too.
- **Highlights tab sub-categories** (Yoshi ask): colors as sections
  (swatch + partner's label), fill/underline/outline as sub-groups
  inside each color.
- **Infra check (screenshots reviewed):** remnant-app-db is the PAID
  Basic-256mb instance (15 GB storage, 2.72% used) — daily backups +
  Recovery tab included; nothing to buy. Compute is the eventual
  ceiling (low-thousands DAU comfortable); upgrade is the in-place
  Update button. Optional someday: Storage Autoscaling toggle, HA at
  Pro when downtime costs partners.

## What shipped
**Schema** — `data-schema/migrations/session203_my_study_collections.sql`:
`study_notes.tags TEXT[]` + GIN index (bookmarks.tags existed since
S124). Idempotent.

**API** (`api/main.py`, `api/models.py`):
- `GET /v1/study/index` — the whole apparatus in one payload: notes +
  bookmarks + highlights joined with verse/book metadata, color-label
  dictionary, `note_count` + `note_cap` (10 on free, null on paid —
  the client's tier signal). Search/grouping/export run client-side.
- `PATCH /v1/notes/{id}` (body and/or tags) + `DELETE /v1/notes/{id}`
  (soft-archive) — Study Notes tier; free gets 403 upgrade triggers.
- `POST /v1/notes` — free-tier 10-note cap (403 at cap with upgrade
  copy); `tags` accepted for paid, 403 for free.
- New models: StudyNoteEntry, StudyHighlightEntry, StudyIndexResponse,
  UpdateNoteRequest; CreateNoteRequest gains tags.

**PWA** (`app/src/`):
- `components/MyStudy.tsx` (NEW) — full-screen overlay per the proof:
  serif/sans split, spectral-blue chrome, NO greyed text (locked
  controls = full opacity + metallic Study Notes chip → /pricing).
  Tabs All/Notes/Bookmarks/Highlights; search across note text,
  bookmark descriptions, highlighted-verse text, refs, tags, color
  names + labels; 13-swatch color filter row; collections chips +
  per-note ✎ Collections editor + Delete (paid); group by
  Book (canonical order) / Date / Collection; Highlights tab renders
  color sections → style sub-groups with the actual mark drawn on the
  quoted verse; free lever card with the N-of-10 meter.
- `lib/study-export.ts` (NEW) — come-and-see export: every anchored
  verse quoted in full, sacred names intact (no partner-pref
  stripping, same as the S171 share-card). Markdown download +
  print-view PDF. Collection-scoped when a collection filter is
  active.
- `lib/api.ts` — patch() helper; getStudyIndex / updateNote /
  deleteNote; My Study types.
- `App.tsx` — chrome "My Study" button (gold register, ❖, left of
  Notes) + overlay render branch riding jumpToVerseRef.

## Build status
- `tsc -b --force` → exit 0 (the Render-strictness gate).
- `vite build` can't run in the sandbox (macOS-native rolldown
  binding); run `npm run build` on the Mac before pushing.

## Deploy order — MIGRATION FIRST (matters)
The study-index query selects `study_notes.tags`; deploying the API
before the column exists 500s the new endpoint. From the Mac:
```
cd ~/Desktop/App
# 1. Apply the migration to prod (Render external URL in api/.env or env):
python3 api/apply_migration.py data-schema/migrations/session203_my_study_collections.sql
# 2. Bundle check (package.json lives in app/):
cd app && npm run build && cd ..
# 3. Commit + push (Render deploys API + PWA):
# rm -f .git/index.lock   # only if a stale lock blocks it
git add api/main.py api/models.py app/src/lib/api.ts \
        app/src/lib/study-export.ts app/src/components/MyStudy.tsx \
        app/src/App.tsx \
        data-schema/migrations/session203_my_study_collections.sql \
        S203_BUILD_NOTES.md
git commit -m "S203: My Study home — unified apparatus, collections, color search, export, free note cap (Session C)"
git push origin main
```

## Also still pending from the S203 open sweep
- **canon.json sync commit** — `source-texts/parsed/canon.json` holds
  29 uncommitted merged-Matthew entries. Commit from the Mac:
  `git add source-texts/parsed/canon.json && git commit -m "S202: sync canon.json with merged Matthew commentary"`.
  Fold into the S203 push or do separately — either is fine.
- **Cleanup (Mac only — sandbox can't delete):**
  `git rm app/public/dividers/divider-alephbet*.png app/public/dividers/source/divider-alephbet-grok-original.jpg`
  + strip the unused `alephbet` variant from ReaderDivider.tsx.
- **Matthew 1 citation restore** (Acts 4:12 + 1 Corinthians 11:3) —
  parked, optional; edit `commentaries/merged/matthew-1.md` + re-run
  the idempotent loader.

## On-device checks after deploy
1. Chrome header shows ❖ My Study; opens full-screen, both themes.
2. Free account: 10-note cap meter + Study Notes chips on Search /
   Collections / Export, all full-opacity; 11th note 403s with the
   upgrade message; nothing previously free is locked.
3. Paid account: collections editable on notes, color filter narrows
   all tabs, Highlights tab shows color sections + style sub-groups,
   Markdown downloads, PDF opens the print dialog, sacred names
   intact in both exports.
4. Divider both themes + sectioned Matthew commentary (held over from
   S202 — hard-refresh first).
