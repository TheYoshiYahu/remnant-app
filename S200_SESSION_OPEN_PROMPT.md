# Next session — fix the native app (only 66 books + no TSK)

Mount `~/Desktop`. Load **yoshi-voice**. Read `S199_CHECKPOINT.md` first (deploy +
git-lock lessons; don't refight them). Xref sweep stays paused.

## The bug (reported by Yoshi)
On the **native app**: book picker shows only the **66-book canon** and **TSK is
gone**. On the **web** (bible.remnantofpromise.org, signed in): **all 153 books +
TSK work fine**. Signed in on both. Persists across uninstall/reinstall.

## Root cause — ESTABLISHED, do not re-litigate
1. Tier is **DB-resolved** from the `subscriptions` table (S114, DB-wins). Yoshi's
   subscription is fine — the web proves it (153 + TSK). `/v1/books` filters by
   `tier_satisfies`: anonymous/free → 66 canon; `extras`+ → 153. Same gate on the
   chapter endpoint. So the native app's API calls are going out **unauthenticated**
   → server treats them as anonymous/free → 66 + no TSK.
2. Why unauthenticated: the native app **bundles its web build**
   (`app/capacitor.config.ts`: `webDir: "dist"`, **no `server` block**). It does
   NOT load the live URL. So **Render web deploys never reach the installed app** —
   it runs frozen, baked-in web code with old/broken auth. Reinstalling the same
   build = same stale bundle. (This is why my S199/S200 web fixes did nothing on
   the phone.)
3. Native auth path (`app/src/lib/native-auth.ts`): JWT lives in Capacitor
   Preferences + an in-memory cache; `loadStoredNativeToken()` hydrates it on mount;
   `api.ts` reads `getCachedNativeToken()` synchronously and attaches `Bearer`.
   `/me` awaits the token (S178). S200 added the same await to `listBooks()` in
   `App.tsx` (committed to web/main) — **but it only reaches the app on a rebuild.**

## NOT the cause / separate concern
- **Offline download is a separate, UNBUILT feature.** Bundling ≠ offline content —
  verses/extras/lexicon all come from the API at read time. Yoshi wants a "download
  everything for offline" option; that's future roadmap work, independent of this
  bug. Do not conflate the two.

## The job
1. **First: audit the native sign-in/token path end-to-end** so a rebuild is
   GUARANTEED to fix the 66/TSK bug (don't burn Yoshi a build cycle on a guess).
   Trace: `lib/native-auth.ts` (store/load/cache), `lib/deep-link.ts`, `api.ts`
   `readAccessToken`/header attach, the SignIn route, and every mount-time fetch
   that must await the token (`/me` S178, `listBooks` S200 — check for OTHERS that
   race: tools/TSK availability, words, commentary, bookmarks, position). Fix any
   call that fires before the token hydrates.
2. **Then: settle how the shell gets its web code going forward** (Yoshi decides):
   - **A — keep bundled:** `npm run build` → `npx cap sync` → rebuild + reinstall
     per release. Offline-capable direction; recurring rebuild cost.
   - **B — load live URL:** set `server.url = "https://bible.remnantofpromise.org"`
     in `capacitor.config.ts` so every deploy reaches the app. Matches Yoshi's
     stated vision (shell tracks live + offline later). CAVEAT: changes the webview
     origin → affects cookie/sign-in behavior and app-store review; needs DEVICE
     testing (Claude can't build/run native — see below).
3. Make the chosen config change + write **exact rebuild steps** (see
   `CAPACITOR_SETUP.md`).

## Hard constraints
- **Claude cannot build/sign/submit iOS/Android** (no Xcode/device here). The app
  rebuild + reinstall is Yoshi's, or his toolchain. Claude's job = get the
  code/config correct + give precise steps.
- Verify frontend with **`tsc -b` / `npm run build`**, NOT `tsc --noEmit` (Render's
  build is stricter — S199 lesson).
- **Commit + push from the Mac only.** Sandbox can't write `.git`; do NOT run
  index-touching git from the sandbox (it leaves an undeletable `.git/index.lock`
  that blocks the Mac). `rm -f ~/Desktop/App/.git/index.lock` if stale.

## Confirm at open
- Whether the S200 `listBooks`-await fix + the pending doc commits
  (`S199_CHECKPOINT.md` deploy note, this prompt) actually got pushed to `main`.

## Backlog (after the app is fixed)
- **Offline download** feature (Yoshi's "download everything for offline" — its own
  build).
- **Session C — notes/bookmarks** (deferred through Sessions B; `APP_BUILDOUT_ROADMAP.md`).
- Maps V1.1 tie-to-reader + region polygons; Nikkudot V1.1.
- Out of scope: chronological (Session D), xref sweep.
