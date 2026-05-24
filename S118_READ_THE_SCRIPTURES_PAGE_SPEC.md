# S118 — Read the Remnant of Promise Official Study Bible — WP Landing Page Spec (revised S126)

The spec for the new WordPress page Yoshi builds in WP admin. Hand to WP admin → Pages → Add New, paste the structure below, configure menu integration, ship.

**Revision history.** Initial S118 spec shipped with *Featured image: None for V1 (clean text-driven hero)* deferred + five sections (Hero text-only / Read CTA / Tier compare / Download / Account). **S126 revision** drops the locked brand-mark candidate **v4 argaman-tribes** (locked S126 per DESIGN_LANGUAGE.md §24) into the hero as a left-rail-menu + dominant-brand-mark-right composition, adds a new Section 3 *Walkthrough & Tools Guide* between Read CTA and Tier compare, and notes the App Store / Play Store listing image lock that back-references §24. Sections 4-6 are the unchanged S118-original sections previously numbered 3-5.

---

## Page metadata

| Field | Value |
|---|---|
| URL slug | `/read-the-scriptures` |
| Page title (browser tab + SEO) | `Read the Remnant of Promise Official Study Bible` |
| Menu item label (Appearance → Menus) | `Read the Remnant of Promise Official Study Bible` |
| Menu placement | Primary nav — left-most or right-most position, partner's call |
| Featured image | **v4 brand-mark (locked S126 per DESIGN_LANGUAGE.md §24):** upload `brand-mark-blue-on-black-v4-argaman-tribes-832x1248.png` from `~/Desktop/App/brand-assets/`. Used as the WP Featured Image (for SEO / share previews / theme conventions) AND as the hero composition's right-column image per Section 1 below. |

**Menu label is long for a nav.** If it visually overflows on mobile or crowds other menu items, the first fallback shortening is `Remnant of Promise Official Study Bible` (drops the "Read the" prefix); if that's still too long for the nav, the second fallback is `Official Study Bible` (drops the org name — the org sits in the WP footer and the publisher field anyway). The full phrasing stays on the page itself.

---

## Page structure (top to bottom)

### Section 1 — Hero (locked S126 — brand-mark + left-rail menu composition)

**Composition.** Two-column hero on desktop (≥ 880px viewport), stacked on mobile (< 880px). On desktop: left column ~38% width carries the action menu, right column ~62% width carries the v4 brand-mark dominant + centered. On mobile: brand-mark renders first (top), menu stacks below.

**Right column — brand-mark.** Drop in `brand-mark-blue-on-black-v4-argaman-tribes-832x1248.png` as a centered hero image, max-width 100%, max-height 82vh on desktop / 70vh on mobile, `width: auto; height: auto;` so the natural aspect is preserved. Add a subtle blue drop-shadow glow for separation against the page background (`filter: drop-shadow(0 0 36px rgba(26, 111, 229, 0.18)) drop-shadow(0 12px 40px rgba(0, 0, 0, 0.6));`). The brand-mark IS the visual hero — the partner sees the official study Bible's locked artwork the same moment they land on the page.

**Left column — supporting text + menu.**

- **Small brand tag** (uppercase, letter-spaced, muted, sans-serif): `Remnant of Promise`
- **Visible H2 (serif, modest size):** `The Official Study Bible` — note: the SEO-canonical H1 `The Remnant of Promise Official Study Bible` is in the DOM as `<h1 class="sr-only">` (visually hidden), so search engines see the canonical title while the visible H2 reads cleanly without doubling the brand-mark's own embedded title text. WP page builders usually expose a "Custom CSS" or "Additional Classes" slot for the visually-hidden treatment — apply `position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip: rect(0,0,0,0); white-space: nowrap; border: 0;`.
- **Subtitle (small paragraph, muted):** `Restored sacred names. Apocrypha and pseudepigrapha. Commentary that reads the canon plainly.`

**Menu CTAs (vertical stack, action buttons).** Five buttons, primary action first, all anchor-linked to the section the partner lands at when they click (except the first which routes external):

| # | Label | Sub-label | Route | Style |
|---|---|---|---|---|
| 1 | `Start reading` | `Open the Bible in your browser` | `https://bible.remnantofpromise.org` (new tab) | Primary fill — spectral-blue `#0084FF` background, white text, strongest visual weight |
| 2 | `Walkthrough & tools guide` | `See what each tool does in 3 minutes` | In-page anchor → `#walkthrough` (Section 3) | Chrome register — dark bordered, muted sub-label |
| 3 | `Compare tiers` | `Free, Notes $1.99, Library $4.99` | In-page anchor → `#tiers` (Section 4) | Chrome register |
| 4 | `Download the app` | `Mac, Windows, Linux, iOS, Android` | In-page anchor → `#download` (Section 5) | Chrome register |
| 5 | `Log in / Create account` | `Save your notes and bookmarks across devices` | `/account` (WP create-account combined surface — see separate spec) | Chrome register |

Each button has a small right-arrow glyph (`→`) on the right edge as the action affordance. Hover state: border brightens, background lightens by ~5% — same chrome-register interaction the rest of the site already uses.

**Why this composition.** The brand-mark IS the official artwork for the study Bible per DESIGN_LANGUAGE.md §1 and §24 — partners landing on `/read-the-scriptures` should see what they're getting before they read a single word of marketing copy. The mark also doubles as the App Store / Play Store listing image (§24 cross-reference), so the same visual anchors the page, the app icon, and every external surface. The left-rail menu surfaces the most-common partner intents up front so a partner who already knows what they want doesn't have to scroll: *Start reading* lives at the top, *Walkthrough* sits next for partners who want to see the tools before committing, and the tier / download / account links anchor down the page for the deeper-pitch material.

**Hero region height.** Full viewport height on desktop (`min-height: calc(100vh - {wp-header-height}px)`) so the hero is the entire above-the-fold surface; the partner scrolls past it to reach Section 2 onwards. On mobile, hero height collapses to natural content height (brand-mark + menu stack).

---

### Section 2 — Primary CTA: Read in your browser

Single large button, primary fill color (whatever the site's primary CTA fill is — match existing site buttons).

**Button label:** `Read in your browser`

**Click action:** Opens `https://bible.remnantofpromise.org` in a new tab (`target="_blank"` + `rel="noopener"`).

**Helper text below button (small, muted):** `Works on any device with a modern browser. Mac, Windows, Linux, iOS, Android.`

This duplicates Menu CTA #1 from the hero deliberately — partners who scroll past the hero without clicking the menu still get the primary action surfaced as a full-width band. The hero menu serves the "I'm decisive, I want to act now" partner; this section serves the "I'm browsing, I want context before I commit" partner who scrolls.

---

### Section 3 — Walkthrough & Tools Guide (NEW S126)

**Section anchor:** `#walkthrough`

**Section header (H2):** `What's in the study Bible`

**Section sub-header (paragraph):** `A short tour of the tools every partner gets. Tap a card for the detail.`

**Format for V1: feature-card grid.** A WP-buildable card grid (no custom code) showing one card per tool, each with an icon + name + short description. Cards link nowhere at V1 — they're descriptive surfaces, not action surfaces. Future V1.1 expansion lets each card open a short modal with screenshots + a 15-second loop showing the tool in action.

**Card grid contents (V1 — 8 cards covering the Free + paid surfaces):**

| Card icon | Card name | Card body |
|---|---|---|
| `🔍` (or theme equivalent) | **Tap any word for Strong's** | Tap any word in the canon and a Strong's lexicon entry opens — Hebrew or Greek root, definition, and every other place that word appears in the canon. Works on Free. |
| `📖` | **Restored sacred names** | The divine name reads in its original Hebrew throughout the canon — Yahuah, Yahusha, Elohim, El. Not a substitution layer; the original-language voice is what you read. Works on Free. |
| `🔖` | **Bookmarks, notes, highlights** | Tap a verse to bookmark, note, or highlight in one of twelve tribe-colors. Your work saves across every device you sign in on. Free includes one color, basic bookmarks, single notepad; Notes tier unlocks all twelve colors, three mark styles, per-verse notes, and the color-grouped study view. |
| `📚` | **Full Apocrypha + Pseudepigrapha library** | 1 Enoch, Jubilees, Jasher, Charles vols 1-2, Josephus, Sonnini's Acts of Paul — the extra-canonical witnesses the framework reads alongside the canon. Free for everyone. |
| `🧵` | **Cross-references everywhere** | Every chapter ends with the framework's cross-reference card tables — Kingdom Gospel and Grace-That-Can-Be-Lost threads visible on every page. Free includes the curated thread surface; Library tier opens the full per-verse cross-reference apparatus. |
| `✏️` | **Commentary that reads the canon plainly** | Framework-bearing prose commentary that quotes every scripture it invokes in full, on its own line — the "come and see" posture. Free includes author-curated key chapters; Library tier opens commentary on every chapter. |
| `🔁` | **Share verses with watermark** | Tap any verse or range to share as an image, copy as an image, or copy as text — all watermarked with the official study Bible mark so every share is a brand impression. Works on Free; no cap on range size. |
| `📥` | **Offline downloads** | First launch ships with the canon + restored names ready to read offline (~50-100 MB). Settings → Downloads exposes granular per-content toggles for the full library, reference works, commentary. Works across every tier. |

**Card visual register.** All eight cards equal width, equal height (use WP column block or CSS grid `grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));`). Card background slightly lighter than the page background (e.g. `#0f0f0f` on `#000`), 1px subtle border, 6px corner radius. Icon at the top of each card (32-40px), card name in bold sans-serif below, card body in muted serif or sans below that. No CTA buttons on the cards — they're descriptive.

**On mobile,** cards stack to single column. Scroll length is acceptable — partners who've reached this section are exploring, not skimming.

---

### Section 4 — Tier comparison (the sales pitch)

**Section anchor:** `#tiers`

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

---

### Section 5 — "For a better experience, download the app"

**Section anchor:** `#download`

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

---

### Section 6 — Account note

Below the download section, a small card or callout block.

**Card title (H3):** `Save your bookmarks, notes, and highlights across devices`

**Card body:**

> *Your study work travels with your account. Log in or create an account so every bookmark, note, and highlight saves across every device you read on.*

**Card CTA button:** `Log In / Create Account` → routes to `/account` (the combined login + create-account surface — see separate spec).

Use the site's primary CTA fill color or an accent color that distinguishes this card from the "Read in your browser" button above. The Read-in-browser is the primary path; the account note is the secondary "do this to make your reading stick" prompt.

---

## App Store / Play Store listing image — SAME ASSET (NEW S126)

Per DESIGN_LANGUAGE.md §24's *App Store / Play Store listing image — same asset* sub-section, the v4 brand-mark is the locked App Store / Play Store hero image — NOT a separate design pass. The Capacitor-wrap wheel ships the following standard-resolution deliverables, all generated downstream from the same source PNG (`brand-assets/brand-mark-blue-on-black-v4-argaman-tribes-832x1248.png`):

- `brand-assets/app-icon-ios-1024x1024.png` — iOS App Store listing icon. Brand-mark cropped to center region (title text band dropped per §24 spec), centered on pure black, square aspect.
- `brand-assets/app-icon-android-play-store-512x512.png` — Play Store listing icon. Same crop, smaller resolution.
- `brand-assets/play-store-feature-graphic-1024x500.png` — Play Store feature graphic. Brand-mark on the left of the wide black field.
- **iPhone 6.7" screenshots** — 1290×2796. Generated from the actual live app once the Capacitor wraps reach App Store submission scope. Hero screenshot uses the same brand-mark composition + the landing surface; additional screenshots walk the reader → menu → Strong's lookup → highlights / notes / search flows.
- **iPad 12.9" screenshots** — 2048×2732. Same composition adapted to tablet aspect.

These three icon / feature deliverables already exist in `brand-assets/` as of S126. The screenshots are generated at the Capacitor-wrap wheel when the app is ready to be photographed.

---

## Visual + style notes

- **Inherit the WP theme.** Don't introduce custom fonts or color tokens beyond what's needed for the hero composition. The page uses the same heading style, body font, button styles, and color palette as every other WP page on remnantofpromise.org. Cross-surface visual unity matters here.
- **Hero is the exception.** The Section 1 hero introduces the brand-mark composition + the menu CTA register. Those CSS overrides (drop-shadow on the brand-mark image, primary-fill CTA button, chrome-register menu items) are the only place this page deviates from the theme defaults. Everything below Section 1 inherits the theme.
- **Responsive.** App-store and desktop button rows should stack vertically on narrow viewports (< 640px) and lay out as a grid on wider viewports. Hero composition switches from 38/62 two-column at ≥ 880px to stacked (mark on top, menu below) at < 880px. WP themes typically handle this via column blocks — use the column block layout primitives the theme provides.
- **No dark-mode toggle.** The website is dark-by-default with no off-ramp (confirmed at S115 from reading `~/Desktop/Website/static-site/css/main.css`). The page inherits the website's dark register automatically.
- **Brand-mark accessibility alt text:** `alt="The Remnant of Promise Official Study Bible — olive branches with menorahs of Judah and Ephraim flanking the central light"`. Descriptive but compact; screen readers announce the brand identity + the symbolic content cleanly.

---

## Coordination + dependencies

**Depends on `/account` settling for the menu CTA #5 + Section 6 CTA destinations:** the `/account` URL referenced by both the hero menu and the Section 6 account-note card is the combined login + create-account surface in WordPress (separate spec). The page can be built and the CTAs wired to `/account` as a target; the actual page at `/account` lands as part of the create-account-for-new-partners wheel.

**Depends on App Store + Play Store wraps for Section 5 Row A to flip from disabled → enabled:** Capacitor wrap work is in the Next wheels queue and not yet shipped. When the wraps land and the apps go through review, the badge buttons flip from `Coming soon` to actual App Store / Play Store links. Same for the desktop downloads — when the Capacitor/Tauri desktop wrap (or PWABuilder packaged installer) ships, those buttons enable.

**Walkthrough cards (Section 3) are descriptive only at V1.** No tap-action, no modal, no embedded video. The V1.1 expansion adds an on-tap modal per card showing 2-3 screenshots + a 15-second silent loop demonstrating the tool. That's a future-wheel — the V1 ship is the static card grid.

**Hero menu CTA #1 (Start reading) duplicates Section 2 (Read in your browser).** Intentional — partners who land on the page and want to act fast click the hero menu; partners who scroll for context hit the Section 2 band. Both route to the same `https://bible.remnantofpromise.org` destination.

---

## Pre-flight checklist before publishing

- [ ] Page renders at `/read-the-scriptures` (preview-published, not yet live).
- [ ] Menu item appears in the primary nav with label `Read the Remnant of Promise Official Study Bible` (or shortened fallback).
- [ ] **Featured image** set to v4 brand-mark PNG; appears in social-share preview cards and theme-defined hero slots correctly.
- [ ] **Section 1 hero:** brand-mark v4 renders on right column (desktop) / top (mobile); left rail carries the five menu CTAs in the locked order (Start reading / Walkthrough / Compare tiers / Download / Account); primary CTA (#1) has spectral-blue fill, others in chrome register; H1 `The Remnant of Promise Official Study Bible` is in the DOM as visually-hidden text; visible H2 reads `The Official Study Bible`; subtitle reads as locked.
- [ ] **Hero menu anchor links work:** Walkthrough → `#walkthrough` (Section 3), Compare tiers → `#tiers` (Section 4), Download → `#download` (Section 5), Account → `/account`. Start reading opens `bible.remnantofpromise.org` in new tab.
- [ ] **Section 2:** `Read in your browser` button opens `https://bible.remnantofpromise.org` in a new tab.
- [ ] **Section 3 (NEW):** Walkthrough card grid renders 8 cards equal-width-equal-height on desktop, stacks on mobile; each card has icon + name + body copy per the locked card list above; no tap-action at V1.
- [ ] **Section 4:** Three tier cards render side-by-side on desktop, stacked on mobile. Free card visually lighter; Notes card mid-weight; Library card with strongest visual emphasis. All bullets render legibly.
- [ ] **Section 4 CTAs:** Free → `https://bible.remnantofpromise.org`. Notes → `https://bible.remnantofpromise.org/pricing`. Library → `https://bible.remnantofpromise.org/pricing`. All open in new tab.
- [ ] **Section 5:** App Store + Play Store badges render with 60% opacity and `Coming soon` sub-label; clicks do nothing (no broken navigation).
- [ ] **Section 5:** Mac/Windows/Linux desktop buttons render with platform icons and `Coming soon` sub-label; clicks do nothing.
- [ ] **Section 6:** Account-note card's `Log In / Create Account` button points to `/account` (placeholder until the create-account wheel ships the actual surface — set as `href="/account"` so it lights up automatically when the page is built).
- [ ] **Mobile viewport** (Chrome devtools at iPhone width) — hero stacks (mark top, menu below), tier cards stack, download button rows stack, walkthrough cards stack to single column, no horizontal scroll anywhere.
- [ ] **Dark register** visually consistent with the rest of the site.
- [ ] **No mentions of restored sacred names directly on the page** (Yahuah, Yahusha, Yashar'el, etc.) — restored names render INSIDE the app; landing page uses conventional English (God, Jesus, Israel) per the voice skill's marketing-surface rule. "Restored sacred names" appears as a *feature description* in the Free card and the Walkthrough card, not as names used on the page. The brand-mark in the hero carries the restored-name register visually (techelet + argaman + gold) without using the names in text — that's the line.
- [ ] **Brand-mark accessibility alt text** set per *Visual + style notes* above.

Once the `/account` surface is live, re-verify the hero menu CTA #5 + the Section 6 account-note button both route correctly end-to-end.
