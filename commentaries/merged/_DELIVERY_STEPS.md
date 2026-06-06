# S202 — Matthew merged-commentary delivery steps (run from the Mac)

All 28 Matthew chapters are consolidated into one comprehensive Commentary
each (in `commentaries/merged/matthew-N.md`), the reader renderer now handles
`##` headings + `**bold**`, and the loader is ready. Two halves reach the live
app by two different paths, so ORDER MATTERS:

- Frontend (the new renderer + deeper-dive removal) reaches the app via a
  Render deploy when you push to `main`.
- The commentary text lives in `chapters.chapter_intro` in prod Postgres; the
  loader updates it directly, and the live API serves it immediately.

If the DB gets the `##` content before the new renderer is deployed, readers
briefly see literal `##`. So deploy the renderer FIRST, then load the DB.

## Order of operations

1. Verify the build (correct dir — package.json is in `app/`):
   ```
   cd ~/Desktop/App/app && npm run build
   ```

2. Commit + push the frontend + the staged content + the loader. This triggers
   the Render deploy of the new renderer and the deeper-dive removal:
   ```
   cd ~/Desktop/App
   # rm -f .git/index.lock   # only if a stale lock blocks it
   git add app/src/App.tsx app/src/lib/markdown.tsx \
           restoration-pipeline/_session202_load_matthew_merged_commentary.py \
           commentaries/_CONSOLIDATION_RULES.md \
           commentaries/merged/
   git commit -m "S202: consolidated Matthew commentary + renderer headings/bold; drop deeper-dive stack"
   git push origin main
   ```

3. Wait for the Render deploy to go live (watch the Render dashboard, ~1–3 min).

4. Preview the DB change against prod (no writes), then apply:
   ```
   cd ~/Desktop/App/restoration-pipeline
   # dry-run first — see the plan, touch nothing:
   DATABASE_URL=<render-postgres-external-url> \
     python3 _session202_load_matthew_merged_commentary.py --dry-run
   # apply (updates prod chapter_intro for all 28 + writes canon.json locally):
   DATABASE_URL=<render-postgres-external-url> \
     python3 _session202_load_matthew_merged_commentary.py
   ```
   (Use the same external Render Postgres URL you used for the S110/S112 loads.)

5. Open Matthew 1–28 on your phone / the web reader: the single Commentary now
   carries every point, sectioned, no greyed text, no Basic/Deeper-Dive stack.

6. Commit the canon.json the loader wrote (keeps `seed.py --bootstrap` in sync):
   ```
   cd ~/Desktop/App
   git add source-texts/parsed/canon.json
   git commit -m "S202: sync canon.json Matthew commentary to merged bodies"
   git push origin main
   ```

## Notes
- The loader is idempotent — safe to re-run; it only writes rows that differ.
- The old Basic/Deeper-Dive rows (`commentary_entries`) are left in the DB,
  just no longer rendered (reversible). They can be cleaned up later.
- The original `matthew-N-free.md` / `-short.md` / `.md` source files are left
  in place untouched; `commentaries/merged/` is now the source of truth for the
  chapter Commentary.
- `commentaries/merged/_CHECK_REPORT.md` is the checker's per-chapter review
  (all 27 of 2–28 came back clean; Matthew 1 is the Yoshi-approved template).
