# S129 — Reader commentary fix + Study Bible landing page + button relabel

Three items queued at S128's wrap. Read `S128_SESSION_OPEN_PROMPT.md` for the v4 reskin context that's now live on remnantofpromise.org.

1. **Reader bug — expanded commentary re-renders the prior layer.** When the reader expands commentary, the first paragraphs appear twice (prior layer re-rendered, then extension appended). Fix it to be additive only — match the website's SoF `.sof-deeper` / `.sof-long` pattern where expand reveals the next paragraphs below what's already on screen. Investigate the commentary component in `app/src/`.

2. **Build the Study Bible landing page at bible.remnantofpromise.org.** The WP nav + home hero CTA already point there; the destination needs to actually be a landing page (v4 brand-mark, sacred-color register, brief frame of what the reader is, then entry CTA into the app proper).

3. **Relabel the Bible button: "Read our official study bible here"** — both hero and nav, both deploys. Touch the live WP home page hero `<a>`, `functions.php` fallback nav, `home.html`, `content-import.xml`, and the static-site `index.html`. Bump theme version + purge WPE cache.

**Out of scope:** further v4 color tuning, scripture-page argaman underlines, app hide-apparatus toggle, BuddyPress structural changes.

**Safety:** WP database untouched. Reader fix is render-side only. Landing page lives at the bible subdomain, not on WP.
