# S201 — Fix the 66-book / TSK-gone bug on the phone (rebuild steps)

## What was wrong (one sentence)
The installed app ran **frozen, baked-in web code** because the Capacitor
shell shipped with no `server` block (`webDir: "dist"` only), so every
Render web deploy — including the auth fixes — never reached the phone.
On the stale bundle, the native API calls went out unauthenticated →
the server treated them as anonymous/free → 66-book canon, no TSK.

## What changed this session (code, on `main` after you push)
1. **`app/capacitor.config.ts`** — added `server.url =
   "https://bible.remnantofpromise.org"`. The shell now loads the LIVE
   web app (the by-URL posture set in the early sessions), so future web
   deploys reach the installed app with no app rebuild. `webDir: "dist"`
   stays (used by `cap sync` and as the future offline fallback bundle).
2. **`app/src/App.tsx`** — two more mount-time fetches now await the
   native JWT before firing (same proven fix as `/me` S178 and
   `listBooks` S200): `loadInitialPosition` (server reading position) and
   `listNotes` (notes). Both are mount-once and never self-heal, so on the
   native shell they raced the async Preferences token read and silently
   came back anonymous/empty for the whole session.

The reported bug (66 books + TSK gone) was **already** covered on `main`
by the S178 `me`-await and the S200 `listBooks`-await. A rebuild was
always going to fix it; the S201 work guarantees the *config* actually
delivers web code to the phone, and closes the two remaining auth races.

## Verification done in-session
- `cd app && npx tsc -b` → exit 0 (the strict build Render uses;
  `tsc --noEmit` is NOT enough — S199 lesson).
- `npx vite build` → exit 0 (bundles clean).

---

## Steps to run on the Mac

> Commit + push from the Mac only. Do NOT run index-touching git from the
> sandbox (it leaves an undeletable `.git/index.lock`). If one is stale:
> `rm -f ~/Desktop/App/.git/index.lock`.

### 1. Commit + push the fixes (delivers them to the live web)
```bash
cd ~/Desktop/App
git add app/src/App.tsx app/capacitor.config.ts S201_REBUILD_STEPS.md
git commit -m "S201: load live URL in shell + await native JWT before reading-position/notes (66/TSK fix delivery)"
git push origin main
```
Render auto-deploys the web. **Wait for the deploy to go green** before
testing the phone — the live URL is what the app will load.

### 2. One-time shell rebuild (flips server.url into the installed app)
This is the ONLY rebuild you need for the URL switch. After this, web
fixes arrive via Render deploys with no further rebuilds.
```bash
cd ~/Desktop/App/app
npm install            # safe to run; no new deps this session
npm run build          # produces dist/ (used by cap sync)
npx cap sync           # copies the new config + dist into the native shells
```

### 3. Build + install on the device

**Android (the .apk path):**
```bash
npx cap open android   # or: npm run cap:android  (build + sync + open)
```
In Android Studio, build a signed APK with the existing keystore
(`~/Desktop/App/_signing/remnant-bible.keystore`, alias `remnant-bible`,
password in Apple Passwords), then install it on the phone (uninstall the
old one first to be safe). Or push the new APK to the
`bible.remnantofpromise.org/download/` path as usual.

**iOS (if building the Capacitor shell):**
```bash
npx cap open ios       # or: npm run cap:ios
```
Build + install via Xcode. (Per S174, the V1 iOS path is the PWA via
Safari "Add to Home Screen," which already loads live — this shell step
is only if you're distributing the native iOS wrap.)

### 4. Device test (REQUIRED — I can't build/run native here)
On the freshly installed app:
1. Sign in with the in-app email/password form.
2. Open the book picker → confirm **all 153 books** show (not 66).
3. Open a verse menu → confirm **Treasury (TSK)** appears live (not a
   locked stub), and Maps / Nave's / Vincent's / Nikkudot too.
4. Confirm your saved reading position and your notes load on launch.

The origin changes from `https://localhost` to
`https://bible.remnantofpromise.org` with this switch. Sign-in should be
unaffected (the Preferences + Bearer path is origin-independent), but
**verify it on the device** — this is the one thing that needs a real
device to confirm.

---

## After this: how releases work going forward
- **Web/content fix** (new chapters, commentary, bug fixes in the PWA):
  push to `main` → Render deploys → the app picks it up on next launch.
  **No rebuild.**
- **Native change** (a Capacitor plugin, a `capacitor.config.ts` change,
  app icon/splash, a new OS permission): rebuild + reinstall the shell.
- **Offline download** ("download everything for offline") is a separate,
  future feature — its own build. Not part of this fix.
