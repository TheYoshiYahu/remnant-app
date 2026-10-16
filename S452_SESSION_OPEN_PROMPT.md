# S452 — Session open prompt

Load my voice skill and mount my Desktop. Read ~/Desktop/App/S451_APP_FEATURE_ROADMAP.md
and ~/Desktop/App/S451_SESSION_HANDOFF.md first.

This session: **Extras on Google** (the pinned growth item). Goal: every chapter of
the extra-canonical books (1 Enoch, Jasher, Jubilees, then the rest of the
extras) is a public web page on bible.remnantofpromise.org that Google can
find and index, ending with the natural-voice taste → the 7-day trial.

Steps, general to specific:
1. Find out what a signed-out visitor can reach today — which chapter URLs
   open without sign-in, which are gated, and whether anything (robots,
   meta noindex, client-only rendering, the API) stops Google from seeing
   the text. Report before changing anything.
2. Make each extras chapter a crawlable page: real title ("Enoch 7 — Restored
   Names Edition | Remnant of Promise Study Bible"), description, the chapter
   text in the HTML, prev/next links, and a sitemap of every chapter. Keep
   the sacred-name convention and the Hidden Words marks as they are in the app.
3. Every page ends with the "hear this chapter" play (the taste) and the
   trial link, web only.
4. Submit the sitemap to Google Search Console (give me the terminal/browser
   steps; don't type into my apps).
5. Deploy script as usual: one bash block to paste, commit + push, Render builds.

Rules: don't make v2 copies of files — change the originals. Verify by content,
not by counts. Keep questions short, one point each. Wrap at ~25–30 turns.

If time remains, next on the roadmap: YouTube read-along videos from the
existing Michael recordings (check ~/Desktop/App/audio and tts/ for what is on disk).
