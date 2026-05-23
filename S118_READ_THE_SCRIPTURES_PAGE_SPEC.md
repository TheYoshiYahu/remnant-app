# S118 — Read the Remnant of Promise Official Study Bible — WP Landing Page Spec

The spec for the new WordPress page Yoshi builds in WP admin. Hand to WP admin → Pages → Add New, paste the structure below, configure menu integration, ship.

---

## Page metadata

| Field | Value |
|---|---|
| URL slug | `/read-the-scriptures` |
| Page title (browser tab + SEO) | `Read the Remnant of Promise Official Study Bible` |
| Menu item label (Appearance → Menus) | `Read the Remnant of Promise Official Study Bible` |
| Menu placement | Primary nav — left-most or right-most position, partner's call |
| Featured image | None for V1 (skip; clean text-driven hero) |

**Menu label is long for a nav.** If it visually overflows on mobile or crowds other menu items, the first fallback shortening is `Remnant of Promise Official Study Bible` (drops the "Read the" prefix); if that's still too long for the nav, the second fallback is `Official Study Bible` (drops the org name — the org sits in the WP footer and the publisher field anyway). The full phrasing stays on the page itself. Updated at S120 to use the spelled-out product name throughout per BIBLE_APP_ROADMAP.md line 420's name lock; the earlier S118 R.O.P.-initialism form was drift off the lock and is corrected here.

---

## Page structure (top to bottom)

### Section 1 — Hero

**H1:** `The Remnant of Promise Official Study Bible`

**Subtitle (H2 or large paragraph):** `Restored sacred names. Apocrypha and pseudepigrapha. Commentary that reads the canon plainly.`

Center-aligned. Generous vertical breathing room. Subtitle font size ~60% of H1.

### Section 2 — Primary CTA: Read in your browser

Single large button, primary fill color (whatever the site's primary CTA fill is — match existing site buttons).

**Button label:** `Read in your browser`

**Click action:** Opens `https://bible.remnantofpromise.org` in a new tab (`target="_blank"` + `rel="noopener"`).

**Helper text below button (small, muted):** `Works on any device with a modern browser. Mac, Windows, Linux, iOS, Android.`

Lead with this. It works today; it's the immediate path to value for the partner.

### Section 3 — Tier comparison (the sales pitch)

This is the heart of the page — three side-by-side cards showing what's free for everyone vs what each paid tier unlocks. Only V1 tiers shown: $9.99 and $14.99 stay hidden until their scope is defined. Cards stack vertically on mobile.

**Section header (H2):** `What you get`

**Section sub-header (small paragraph, optional):** `Restored sacred names and the full library are free for everyone. Paid tiers add color-organized study, full commentary, and a reference library that displaces the heavy desktop-only tools.`

---

**Card 1 — Free (everyone gets this)**

| Element | Value |
|---|---|
| Card header | `Free` |
| Price line | `Free forever` (no asterisk; no trial; no credit card) |
| Tagline | `The canon as God names Himself, with the full library.` |

**Bullet features (6-7):**

- Restored sacred names — read the canon with the divine name restored to its original Hebrew
- Full Apocrypha and Pseudepigrapha library — 1 Enoch, Jubilees, Jasher, Charles vols 1 + 2, Josephus, Sonnini's *Acts of Paul*
- Strong's word lookup — tap any word for its Hebrew or Greek root
- Cross-references on every chapter — the Kingdom Gospel and Grace-That-Can-Be-Lost threads visible everywhere
- Framework-bearing commentary on author-curated key chapters
- One highlight color, basic bookmarks, single notepad, reading position saves across devices
- Offline downloads, share verses with watermark

**CTA button:** `Start reading free` → `https://bible.remnantofpromise.org` (opens in new tab)

---

**Card 2 — Notes ($1.99/month)**

| Element | Value |
|---|---|
| Card header | `Notes` |
| Price line | `$1.99 / month` |
| Tagline | `Color-organized study with separate notes per book, chapter, and verse.` |

**Bullet features (5-6) — "Everything in Free, plus":**

- All 12 highlight colors and 3 mark styles (fill, underline, outline)
- Separate notes per book, chapter, and verse — distinct, named, scoped
- Note central hub — every note searchable and color-filterable in one screen
- Free-form color labels — assign your own meaning to each color
- Color-grouped study view — every verse marked in a chosen color, gathered as a topical collection

**CTA button:** `Get Notes — $1.99/mo` → `https://bible.remnantofpromise.org/pricing` (opens in new tab)

---

**Card 3 — Library ($4.99/month)**

| Element | Value |
|---|---|
| Card header | `Library` |
| Price line | `$4.99 / month` |
| Tagline | `Full commentary on every chapter plus the complete reference library.` |

**Bullet features (6-7) — "Everything in Notes, plus":**

- Full short-form commentary on every chapter — framework-bearing prose with every cited scripture quoted in full
- Full cross-reference apparatus — every curated thread, every per-verse cross-reference, drawn from the full restored library
- Verse-highlight recommendations — highlight a verse, see related passages from curated thematic threads
- Hebrew/Greek interlinear with inline lexicon (Westcott-Hort Greek + BDB Hebrew alignments)
- Public-domain reference library — Brown-Driver-Briggs, Thayer's, Vine's, Easton's, Smith's, Nave's Topical Bible, Treasury of Scripture Knowledge
- Nikkudot-strip feature — see alternate Hebrew word readings sharing the same consonantal form
- Notes export to PDF

**CTA button:** `Get Library — $4.99/mo` → `https://bible.remnantofpromise.org/pricing` (opens in new tab)

---

**Visual rendering of the three cards.** Equal width, equal vertical height (use CSS `align-items: stretch` or the WP theme's column-block equivalent). Card 1 (Free) carries a slightly lighter visual register than the paid cards — no border accent, plain background. Cards 2 and 3 carry a subtle border accent or fill tint that visually marks them as the upgrade path. Card 3 (Library) gets the strongest visual weight as the recommended-tier signal (small "Most Popular" or "Recommended" badge optional, partner's call).

**No "compare all features" expander for V1.** The card bullets carry enough. If a feature matrix is wanted later, it's a V1.1 addition.

### Section 4 — "For a better experience, download the app"

Section header (H3 or H2): `For a better experience, download the app`

**Sub-paragraph (the locked S112 marketing copy, verbatim):**

> *For a better experience download the app — whatever your tier is, the app is a better experience whether desktop, tablet, or mobile, and all your bookmarks, notes, and tools save across devices and platforms with your account.*

Below the copy, two button rows:

**Row A — Mobile apps:**

| Button | State | Label | Sub-label |
|---|---|---|---|
| App Store | Disabled | `Download on the App Store` | `Coming soon` |
| Google Play | Disabled | `Get it on Google Play` | `Coming soon` |

Use the official App Store and Google Play badge artwork (Apple and Google both provide official SVG badges; respect their brand guidelines). Apply 60% opacity + `pointer-events: none` to render the disabled state. Add a small `Coming soon` chip/badge overlay in the top-right corner of each button or as a sub-label beneath.

**Row B — Desktop apps:**

| Button | State | Label | Sub-label |
|---|---|---|---|
| macOS | Disabled | `Download for Mac` | `Coming soon` |
| Windows | Disabled | `Download for Windows` | `Coming soon` |
| Linux | Disabled | `Download for Linux` | `Coming soon` |

Same disabled treatment as Row A. Use platform icons (Apple logo, Windows logo, Tux/penguin or generic Linux glyph) at the left of each button, label centered.

### Section 5 — Account note

Below the download section, a small card or callout block.

**Card title (H3):** `Save your bookmarks, notes, and highlights across devices`

**Card body:**

> *Your study work travels with your account. Log in or create an account so every bookmark, note, and highlight saves across every device you read on.*

**Card CTA button:** `Log In / Create Account` → routes to `/account` (the combined login + create-account surface — see separate spec).

Use the site's primary CTA fill color or an accent color that distinguishes this card from the "Read in your browser" button above. The Read-in-browser is the primary path; the account note is the secondary "do this to make your reading stick" prompt.

---

## Visual + style notes

- **Inherit the WP theme.** Don't introduce custom fonts or color tokens. The page uses the same heading style, body font, button styles, and color palette as every other WP page on remnantofpromise.org. Cross-surface visual unity matters here.
- **Responsive.** App-store and desktop button rows should stack vertically on narrow viewports (< 640px) and lay out as a grid on wider viewports. WP themes typically handle this via column blocks — use the column block layout primitives the theme provides.
- **No dark-mode toggle.** The website is dark-by-default with no off-ramp (confirmed at S115 from reading `~/Desktop/Website/static-site/css/main.css`). The page inherits the website's dark register automatically.

---

## Coordination + dependencies

**Depends on Task #3 settling first:** the `/account` URL referenced by the account-note CTA button is the combined login + create-account surface that doesn't exist yet (the `/login` 404 is what this whole wheel is about). The page can be built and the CTA button wired to `/account` as a target; the actual page at `/account` lands as part of Task #3.

**Depends on App Store + Play Store wraps for Row A to flip from disabled → enabled:** Capacitor wrap work is in the Next wheels queue and not yet shipped. When the wraps land and the apps go through review, the badge buttons flip from `Coming soon` to actual App Store / Play Store links. Same for the desktop downloads — when the Capacitor/Tauri desktop wrap (or PWABuilder packaged installer) ships, those buttons enable.

**Pricing.tsx redirect (Task #4) routes anonymous-checkout clicks to `/account?redirect=...`:** the combined surface is the destination both this landing page's account-note button AND the Pricing.tsx anonymous-checkout flow route to. One surface, two entry points. Per S114's auth.py contract, `/account` must (a) accept the `?redirect=` query param, (b) bounce the partner back to that URL after sign-in or registration completes, (c) set the `rop_jwt` cookie at `Domain=.remnantofpromise.org` so the PWA picks up the session.

---

## Pre-flight checklist before publishing

- [ ] Page renders at `/read-the-scriptures` (preview-published, not yet live).
- [ ] Menu item appears in the primary nav with label `Read the Remnant of Promise Official Study Bible` (or shortened fallback).
- [ ] **Section 2:** `Read in your browser` button opens `https://bible.remnantofpromise.org` in a new tab.
- [ ] **Section 3:** Three tier cards render side-by-side on desktop, stacked on mobile. Free card visually lighter; Notes card mid-weight; Library card with strongest visual emphasis. All bullets render legibly.
- [ ] **Section 3 CTAs:** Free → `https://bible.remnantofpromise.org`. Notes → `https://bible.remnantofpromise.org/pricing`. Library → `https://bible.remnantofpromise.org/pricing`. All open in new tab.
- [ ] **Section 4:** App Store + Play Store badges render with 60% opacity and `Coming soon` sub-label; clicks do nothing (no broken navigation).
- [ ] **Section 4:** Mac/Windows/Linux desktop buttons render with platform icons and `Coming soon` sub-label; clicks do nothing.
- [ ] **Section 5:** Account-note card's `Log In / Create Account` button points to `/account` (placeholder until Task #3 ships the actual surface — set as `href="/account"` so it lights up automatically when the page is built).
- [ ] Mobile viewport (Chrome devtools at iPhone width) — tier cards stack, download button rows stack, hero fits, no horizontal scroll.
- [ ] Dark register visually consistent with the rest of the site.
- [ ] No mentions of restored sacred names directly on the page (Yahuah, Yahusha, Yashar'el, etc.) — restored names render INSIDE the app; landing page uses conventional English (God, Jesus, Israel) per the voice skill's marketing-surface rule. "Restored sacred names" appears as a *feature description* in the Free card, not as names used on the page.

Once the `/account` surface is live (Task #3), re-verify the account-note button routes correctly end-to-end.
