#!/usr/bin/env bash
# S124 deploy — Bookmarks + Notes V1 (Wheel 5 of the locked 14-wheel
# pre-launch sweep).
#
# TWO-SURFACE deploy. Both the API (Render Web Service) and the PWA
# (Render Static Site) need to ship. Migration runs from Render Shell
# AFTER the API rebuild lands per the S117 / S120 pattern.
#
# Run from anywhere: `bash ~/Desktop/App/_session124_bookmarks_and_notes_v1_deploy.sh`
#
# What this ships:
#   - DESIGN_LANGUAGE.md §22 (NEW) — Bookmarks + Notes V1 UX lock.
#     Three Yoshi gates settled: bookmark-commit = richer card with
#     metadata; notes-panel = bottom slide-up; verse-anchor = header
#     per entry. + §20 catalog drift fix: "Open notes for this verse"
#     wheel attribution W5 → W8 (per-verse hub ships W8 not W5).
#     Fifth drift-caught-while-editing-the-doc instance after S88 /
#     S120 / S121 / S122 / S123.
#   - data-schema/migrations/session124_bookmarks_and_notes_v1.sql
#     (NEW) — CREATE TABLE bookmarks + drop the legacy study_notes
#     CHECK that blocked the Free-tier free-form-notes path. Idempotent
#     throughout.
#   - data-schema/schema.sql — source-of-truth synced (bookmarks block
#     added; study_notes CHECK removed; new idx_notes_user_created
#     index for the chronological notepad GET). Per S117 forward
#     standard: every migration session updates schema.sql to match.
#   - restoration-pipeline/_session124_apply_bookmarks_and_notes_v1.py
#     (NEW) — asyncpg loader, --dry-run + verify, idempotent. Same
#     shape as the S117 loader; clone for future migrations.
#   - api/Dockerfile — COPY line for the new loader so it ships in
#     the image (per S117 three-artifacts-in-lockstep standard).
#   - api/models.py — Bookmark + ChapterBookmarksResponse +
#     CreateOrReplaceBookmarkRequest + NoteEntry + NotesResponse +
#     CreateNoteRequest pydantic models.
#   - api/main.py — 5 new endpoints:
#       GET    /v1/bookmarks?book_slug=&chapter_number=
#       POST   /v1/bookmarks
#       DELETE /v1/bookmarks/{bookmark_id}
#       GET    /v1/notes
#       POST   /v1/notes
#     All auth-required, all Free-tier (no tier gate per §9).
#     Server-side verse_ref resolution on GET / POST notes via LEFT
#     JOIN against verses / chapters / books / editions (canon edition).
#   - app/src/lib/api.ts — type interfaces + client functions for
#     all 5 new endpoints.
#   - app/src/components/BookmarkSheet.tsx (NEW) — richer card modal
#     with header / verse preview / short_description textarea /
#     tag chips input with suggestions / 13-color tint picker +
#     "no tint" default / Save + Remove buttons + Saved-date footer.
#   - app/src/components/NotesPanel.tsx (NEW) — bottom slide-up
#     panel with saved-entries scroll (auto-scrolls to bottom) +
#     pending-anchor strip (when opened via Add-note path) + pinned
#     input region with auto-expanding textarea + Cmd/Ctrl+Enter save.
#   - app/src/App.tsx — wiring:
#       * imports + 5 new state hooks (bookmarksByVerse,
#         bookmarkSheetVerseId, notes, notesOpen, pendingNoteAnchor)
#       * 2 new fetch effects (chapter-load bookmarks; mount-load notes)
#       * 5 new handlers (openBookmarkSheet, openNotesPanelWithAnchor,
#         openNotesPanel, handleBookmark{Saved,Deleted}, handleNoteSaved)
#       * buildMenuSections handlers extension + 2 stub promotions
#         (Marking → Bookmark: Coming-soon → Live; Notes → Add note:
#         Coming-soon → Live)
#       * chrome Notes button left of ThemeToggle (cluster becomes
#         [Notes][Theme][Subscription CTA] per §22)
#       * verse render bookmark glyph after verse number (color in
#         spectral-blue or bookmark's color_tint when set)
#       * BookmarkSheet + NotesPanel render branches in modal stack
#   - app/src/index.css — .verse-bookmark-glyph rule (visibility-
#     only marker; pointer-events: none).
#   - REBUILD_STATE.md — S124 Done entry + sweep-list strikethrough
#     W5 + Recent observations S124 entry (to be added at session-close).
#   - This script.
#
# Verification done before commit:
#   - tsc -b clean exit 0 across the entire PWA project.
#   - python3 -m py_compile clean on api/main.py + api/models.py +
#     restoration-pipeline/_session124_apply_bookmarks_and_notes_v1.py.
#   - Vite build skipped (rolldown native binding architecture mismatch
#     per the established S116/S117/S121/S122/S123 pattern); Render's
#     fresh Linux runtime builds the bundle cleanly.
#
# No node sanity tests this wheel — unlike S121 W2 (chapter-nav, 12
# cases), S121 W3 (verse-align, 5 cases), S122 (partner-tier, 22 cases),
# S123 (range-selection, 18 cases), S124 has no pure-helper extraction
# worth testing. The wheel's logic is mostly stateful React + SQL CRUD;
# tsc + py_compile + the live walk + the migration verify step in the
# loader are the load-bearing verification.

set -euo pipefail

APP_DIR="$HOME/Desktop/App"
cd "$APP_DIR"

echo
echo "==> S124 deploy — Bookmarks + Notes V1 (Wheel 5)"
echo

# Clean any stale git locks left from prior session.
if [ -f "$APP_DIR/.git/index.lock" ] || [ -f "$APP_DIR/.git/HEAD.lock" ]; then
    echo "==> clearing stale git locks (index.lock + HEAD.lock)"
    rm -f "$APP_DIR/.git/index.lock" "$APP_DIR/.git/HEAD.lock"
fi

echo "==> running py_compile on API + loader"
python3 -m py_compile \
    api/main.py \
    api/models.py \
    restoration-pipeline/_session124_apply_bookmarks_and_notes_v1.py

echo
echo "==> running tsc -b on the PWA project"
(cd app && npx tsc -b)

echo
echo "==> staging changes:"
git add \
    DESIGN_LANGUAGE.md \
    REBUILD_STATE.md \
    data-schema/schema.sql \
    data-schema/migrations/session124_bookmarks_and_notes_v1.sql \
    restoration-pipeline/_session124_apply_bookmarks_and_notes_v1.py \
    api/Dockerfile \
    api/main.py \
    api/models.py \
    app/src/App.tsx \
    app/src/components/BookmarkSheet.tsx \
    app/src/components/NotesPanel.tsx \
    app/src/lib/api.ts \
    app/src/index.css \
    "$0"

echo
echo "==> diff summary:"
git diff --cached --stat
echo

read -rp "Commit + push? [y/N] " ans
if [[ "${ans:-N}" != "y" && "${ans:-N}" != "Y" ]]; then
    echo "Aborted — staged changes left in place."
    exit 1
fi

git commit -m "S124 W5 Bookmarks + Notes V1 — two §9 Free-tier surfaces" \
           -m "Two distinct surfaces sharing the session per DESIGN_LANGUAGE.md §22 (locked S124). Bookmarks = single-verse flag with richer metadata (Yoshi's gate chose 'richer card' over a simple short_description-only sheet); Notes V1 = single global notepad with verse-anchor injection (bottom slide-up panel per Yoshi's gate; header-per-entry verse-anchor placement per Yoshi's gate, amending the §9 'auto-inserted at cursor' line). A verse can carry BOTH a bookmark and notes plus up to 3 highlights simultaneously — three independent surfaces." \
           -m "NEW bookmarks table (id UUID PK; user_id UUID FK users; verse_id BIGINT FK verses; short_description TEXT nullable; tags TEXT[] nullable; color_tint TEXT nullable with CHECK matching the §6 13-color HighlightColor enum; created_at + updated_at; UNIQUE (user_id, verse_id)). Idempotent migration with CREATE TABLE IF NOT EXISTS + DO-block guard on the unique constraint + GIN index on tags for the future W8 cross-bookmark hub. study_notes table CHECK on (chapter_id OR verse_id) NOT NULL relaxed — Free V1 single-global-notepad needs to allow rows with both NULL (the chrome-button free-form path). Dynamic-lookup drop on the auto-named CHECK so name-drift across Postgres versions is handled. schema.sql source-of-truth synced per S117 forward standard." \
           -m "Three lockstep artifacts per S117 standard: SQL migration + Python loader (asyncpg + argparse + --dry-run + pre/post-verify) + Dockerfile COPY line for the loader. Migration runs from Render Shell on the API service after deploy: python3 /restoration-pipeline/_session124_apply_bookmarks_and_notes_v1.py. Idempotent throughout; safe to re-run." \
           -m "API: 5 new endpoints (GET/POST/DELETE /v1/bookmarks + GET/POST /v1/notes). All auth-required, all Free-tier (no tier gate per §9). All 13 color_tint values valid for every tier (bookmark color is personal organization, NOT marking vocabulary that creates the upgrade gate per §7 — inversion-of-§7 explicitly documented in §22). Server-side verse_ref resolution on GET/POST notes via LEFT JOIN against verses/chapters/books/editions (canon edition) so PWA renders entry headers consistently across all chapters without N+1 client round trips." \
           -m "PWA: NEW BookmarkSheet component (bordered-chrome modal matching HighlightPicker register; verse-ref header in §5 spectral-blue; italic muted verse preview line-clamp-3; multi-line auto-expanding short_description textarea; chip-style tag input with autocomplete suggestions from prior bookmarks; 13-color tint picker reusing §6 palette + leftmost 'no tint' default with slash-through swatch; Save/Remove with Saved-date footer in edit mode; Escape/tap-outside discards). NEW NotesPanel component (bottom slide-up modal max-h-70vh mobile / max-w-2xl centered desktop; chronological saved-entries scroll auto-scrolling to bottom; pending-anchor strip when opened via Add-note path; pinned multi-line input with Cmd/Ctrl+Enter save). App.tsx wiring: chrome Notes button left of ThemeToggle (cluster becomes [Notes][Theme][Subscription CTA] per §22); verse-render bookmark glyph after verse number (spectral-blue accent OR color_tint when set); 2 menu stub promotions in buildMenuSections (Marking → Bookmark and Notes → Add note both Coming-soon → Live). Open notes for this verse stays Tier-locked at Notes (\$1.99) since per-verse hub is W8; §20 catalog drift fixed in same edit (W5 → W8). Fifth drift-caught-while-editing-the-doc instance after S88/S120/S121/S122/S123." \
           -m "Verification: tsc -b clean exit 0 across the entire project + python3 -m py_compile clean on api/main.py + api/models.py + the new loader. Vite build skipped per the established rolldown architecture mismatch; Render's fresh Linux runtime builds cleanly. No node sanity tests this wheel — S124's logic is mostly stateful React + SQL CRUD, no pure-helper extraction worth a separate test surface; tsc + py_compile + live walk + the loader's pre/post-verify step are the load-bearing verification."

echo
echo "==> commit landed locally. pushing to origin..."
git push origin main

echo
echo "==> S124 deploy push done."
echo
echo "Render rebuilds in parallel:"
echo "  - API (Web Service) rebuild ~3-5min — needs the new loader + Dockerfile COPY."
echo "  - PWA (Static Site) rebuild ~2min — needs the new components + wiring."
echo
echo "AFTER the API rebuild lands, run the migration from Render Shell on the API service:"
echo
echo "  python3 /restoration-pipeline/_session124_apply_bookmarks_and_notes_v1.py"
echo
echo "Expected output ends with:"
echo "  AFTER: bookmarks table=True, unique constraint=True, user-verse index=True, tags GIN index=True, study_notes CHECK=none"
echo "  OK: bookmarks table + bookmarks_user_verse_unique + indices present; study_notes CHECK dropped."
echo
echo "If the API code lands before the migration runs, POST /v1/bookmarks + GET /v1/notes will 500 for a brief window (the new code references the new table + relaxed CHECK). Acceptable for low-traffic Free-tier endpoints; the PWA degrades gracefully (catch + ignore on the chapter-load bookmarks fetch; notes panel empty-state on the mount fetch)."
echo
echo "Once migration is run, do the live walk in incognito at bible.remnantofpromise.org:"
echo
echo "  Bookmarks:"
echo "  1. Sign in via /goshen/. Navigate to Genesis 1."
echo "  2. Long-press a verse → menu opens. Marking section → tap 'Bookmark' (now Live, not Coming-soon)."
echo "  3. BookmarkSheet opens with verse-ref header + verse preview + empty form."
echo "  4. Type a description, add a tag (Enter to commit chip), pick a color tint → Save."
echo "  5. Sheet closes; verse glyph (⚑) appears next to the verse number in the picked color."
echo "  6. Long-press the same verse → menu → Bookmark again. Sheet opens in edit mode with all fields pre-filled + Remove button visible + 'Saved {date}' footer."
echo "  7. Tap Remove. Sheet closes; glyph disappears."
echo "  8. Navigate to a different chapter — bookmarks fetch refreshes per-chapter; verify any prior bookmarks on the new chapter render their glyphs correctly."
echo
echo "  Notes V1:"
echo "  1. Long-press a verse → menu → Notes section → tap 'Add note' (now Live)."
echo "  2. NotesPanel opens at bottom. Pending-anchor strip shows 'Adding to: Genesis 1:1' in spectral-blue."
echo "  3. Type something in the input → Save (or Cmd/Ctrl+Enter)."
echo "  4. Entry appears at the bottom of the saved-entries scroll with the bold verse-ref header + your body."
echo "  5. Close (✕ or tap-outside or Escape). Re-open via chrome 'Notes' button (left of Theme toggle). Panel opens scrolled to bottom; no pending-anchor strip; you can type free-form."
echo "  6. Save free-form → entry appears without a verse-ref header."
echo "  7. Navigate to a different chapter; verify notes from this chapter still surface in the panel with their headers (server-side verse_ref resolution)."
echo
echo "  Cross-surface coexistence:"
echo "  - Verify a single verse can carry highlights AND a bookmark AND notes simultaneously (S113/S117 marks visible on verse text; bookmark glyph next to verse number; notes panel has an entry with that verse's header)."
echo "  - Verify Bookmark item in menu coexists cleanly with Highlight item in same section; Add note coexists with Open-notes-for-verse Tier-locked stub (still routes to /pricing for free-tier partners)."
