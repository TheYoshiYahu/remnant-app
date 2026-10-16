# S452 handoff — 2026-10-16

Deploy: bash ~/Desktop/App/_session452_library_pages_deploy.sh (run it if not yet pushed; `git log -1` shows "S452:" when it has).

Decided (Yoshi, in conversation):
- The extras are NEVER shown in full to a free reader — web or app. Every
  extras chapter shows its FIRST PARAGRAPH, then the invite. Canon is free
  and complete. (Implemented: reader's paragraph breaks from
  app/src/data/paragraph_starts.json, capped at 8 verses, floor 2 —
  api/main.py teaser_verse_limit(). Change TEASER_MAX_VERSES there to retune.)
- Barnabas dropped from tts/chapters_all.json (excluded book). Recording
  resumes with `bash ~/Desktop/App/tts/record_bible.sh am_michael`.

Shipped:
- API: /v1/books/{slug}, /chapters, /chapters/{n} resolve locked books for a
  free reader; the chapter comes back as the first paragraph with
  `teaser: true` (verse_count is still the full count). Cross-refs / witness /
  kingdom / commentary stay gated (404) — the reader hides them silently.
  New anonymous export: GET /v1/public/library/{edition_slug}/{book_slug}
  (canon whole, locked books teased by the same rule). Dockerfile copies
  paragraph_starts.json into the image.
- Site: app/scripts/prerender-library.mjs runs at the end of `npm run build`
  and writes dist/library/index.html, dist/library/<book>/index.html,
  dist/library/<book>/<n>/index.html, dist/sitemap.xml. Pages: title
  "Enoch 7 — Restored Names Edition | Remnant of Promise Study Bible",
  description, canonical, og tags, prev/next across books, verse text as
  stored (sacred-name parentheticals intact), teaser card on extras, the
  5-verse Michael taste (same R2 mp3 + timings as the app), trial link
  (/pricing), "Open in the app" (/read?book=&chapter=). robots.txt now
  names the sitemap. render.yaml holds /library/* and /sitemap.xml against
  the SPA fallback. Suppressed books (Charles-vol1 duplicates, Barnabas)
  are not published. A failed fetch fails the build → old site stays.
- App: locked books are selectable in the picker (lock glyph kept); a
  teaser chapter renders its verses then a LockedPartnerPrompt card
  ("That is the first paragraph of … — the other N verses … open with the
  trial") and, web only, a /pricing link. tsc clean.
- Hidden Words marks: not on the web pages (they need the Strong's-tagged
  token layer, canon-only, loaded at runtime) — the app is unchanged.

Not done / verify after deploy (by content, signed out, private window):
- https://bible.remnantofpromise.org/library/genesis/1/ — full chapter, verses match the app.
- https://bible.remnantofpromise.org/library/1-enoch/7/ — first paragraph only (should be verses 1–2 per paragraph_starts), teaser card, taste plays 5 verses then stops.
- https://bible.remnantofpromise.org/sitemap.xml — ~2,400 URLs.
- If Render served the SPA index.html for /library/… instead of the page, the
  self-rewrite didn't hold: change the rewrite to a `/library/*` → same, or
  move the pages to `/library/<book>/<n>.html` (edit writePage + links).
- In the app, signed out: pick 🔒 Book of Enoch → chapter 7 shows two verses + the card.
- Lock-screen controls on a phone (carried over from S451).

Google Search Console — submit the sitemap (Yoshi does this; nothing typed for him):
1. Browser: https://search.google.com/search-console → Add property →
   "URL prefix" → https://bible.remnantofpromise.org/ → Continue.
2. Verify with the HTML-tag method: copy the `<meta name="google-site-verification" content="…">`
   line it shows, then in a terminal (replace the token):
     cd ~/Desktop/App && sed -i '' 's|<link rel="canonical" href="https://bible.remnantofpromise.org/" />|<meta name="google-site-verification" content="PASTE_TOKEN" />\n    <link rel="canonical" href="https://bible.remnantofpromise.org/" />|' app/index.html && git add app/index.html && git commit -m "GSC verification tag" && git push origin main
   Wait for Render to finish, then press Verify in Search Console.
   (Alternative that needs no deploy: DNS TXT record on remnantofpromise.org at the registrar — choose "Domain" property instead of URL prefix.)
3. Search Console → Sitemaps → enter `sitemap.xml` → Submit.
4. URL Inspection → paste https://bible.remnantofpromise.org/library/1-enoch/7/ → Request indexing (do a handful: Enoch 1, Jasher 1, Jubilees 1, Genesis 1).

Untouched, still uncommitted from Yoshi's earlier audit work (leave alone):
S446_SESSION_HANDOFF.md, _s448_add_extras_text.mjs, restoration-pipeline/,
source-texts/ Enoch + Jasher files.

Known: app/src/App.tsx pre-existing eslint react-hooks/refs errors (~4750–4820). tsc clean.
Feature roadmap: S451_APP_FEATURE_ROADMAP.md. Next: S453_SESSION_OPEN_PROMPT.md.
