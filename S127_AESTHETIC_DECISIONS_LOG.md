# S127 — Aesthetic decisions log

Locked at S127's post-Wheel-7-ship aesthetic discussion. Captures every design call made during the conversation so the next session reads the locks without re-asking. Cross-product scope (PWA reader + marketing website). Source-of-truth for any token / register / asset decision that doesn't yet live in DESIGN_LANGUAGE.md.

---

## Scripture page (PWA reader) — argaman + spectral assignments (locked S127)

The §3 sacred-color register gets extended structurally inside the reader:

- **Argaman (`#8E4FB3`, covenant-body register)** carries the structural skeleton of scripture: book + chapter heading underlines, and the end-of-scripture rule that separates the canon body from the apparatus that interprets it. Argaman is theologically the covenant-body color (Yahudah, Yashar'el, Yahudim, Yahudi per §3); putting it on the scripture skeleton reads as "the body of the canon wears the covenant color."
- **Spectral blue (`#0084FF`, §5 accent register)** carries every post-scripture-line apparatus separator + every non-divine-name UI accent the reader already uses (verse numbers, chapter dividers, dotted underlines on tappable words, chapter-end card headers). This is essentially the existing state, now named as the locked convention.
- **Techelet (`#1A6FE5`, §3 divine-name register)** stays reserved for divine names only per the §3 lock. NOT used structurally; NOT used on chrome. The reservation is load-bearing.

The brand-mark's three registers (techelet + argaman + gold) thus map cleanly to the three jobs inside the reader: divinity (techelet on divine names), covenant body (argaman on scripture-structural elements), priestly witness (gold — reserved for future surfaces tied to atonement / priestly context).

## App theme switcher rename — "Urim & Thummim" (shipped S127)

`ThemeToggle` component label + aria + title renamed to match the website's `Toggle light and dark mode (Urim and Thummim)` switcher. Cross-product naming unity — the priestly oracle stones used for divine guidance become the theological frame for the partner's surface-choice affordance, instead of the generic "Theme" label. Visible button text now reads `☼ Urim & Thummim` (dark mode) / `☾ Urim & Thummim` (light mode).

## App commentary chrome — `#a3a3a3` → `#b8b8b8` (pending Yoshi accept, accepted S127)

Lighter secondary register. Still serves the "scripture is white / commentary chrome is one notch below" separation function but reads as present-secondary rather than muted-dim. Applies to `--reader-muted` in `app/src/index.css` dark-mode block. Light-mode `--reader-muted: #6b6b6b` can stay as-is (parchment-mode visual balance is different) or get a parallel adjustment if it reads similarly dim.

## Website gray-to-white (locked S127)

Both warm-tan muted tokens in the static-site CSS get flipped to pure white:

- `--text-muted: #a89880` → `#ffffff`
- `--text-dim: #8a7860` → `#ffffff`

Applies to BOTH deploys: `Website/static-site/css/main.css` AND the WP theme stylesheet. The warm-tan tones were reading as "off" rather than "subtle" — fighting against the pure-white body text. Pure white propagates through every secondary text register via CSS variable composition. (In the WP theme, the equivalent stylesheet rule may live in a sub-file under `/css/`; confirm at edit-time.)

## Website v4 reskin — priest-\* → techelet/argaman/gold (locked S127, queued for S128)

Token-layer color migration across both deploys. Static-site button vocabulary (`.btn`, `.btn-primary`, `.btn-ghost`, `.btn-disabled`, `.tithely-give-button`) retokens automatically because the buttons pull from CSS variables — no per-button rewrites required.

| From (priest-\*) | To (v4 §3) | Notes |
|---|---|---|
| `--priest-blue` | techelet `#1A6FE5` | divine-name register |
| `--priest-purple` | argaman `#8E4FB3` | covenant-body register |
| `--priest-scarlet` | **fold into gold** | priestly-witness register absorbs atonement-adjacent meaning |
| (emerald, if any) | **dropped** | not a v4 register |

The fold-scarlet-into-gold call: the high priest's role IS the Day-of-Atonement office, so the priestly-witness register already carries atonement-adjacent semantics theologically. Visually, gold reads as "set apart / sacred" without competing with the techelet/argaman pair. Three registers stay locked; no fourth introduced.

## Light mode in v4 (locked S127)

Same dual-mode structure as the current theme: every v4 token defined twice — once in `:root` for dark mode, once in `[data-theme="light"]` for parchment mode. Calibration pass needed on light variants (techelet deepens slightly on parchment to maintain readability; argaman similar; gold reads differently on warm vs cool fields). Estimated ~30 minutes of calibration; Urim & Thummim switcher keeps working without modification.

## BuddyPress button overrides (queued S128)

BuddyPress (Activity, Forums, Groups, Members, profile features) injects its own button styles by default — Send Message, Add Friend, Reply, Join Group, etc. Those buttons do NOT automatically pick up the theme's CSS variables. Post-reskin, ~30 lines of CSS overrides needed in the WP theme stylesheet to make BuddyPress buttons inherit techelet/argaman/gold. One-evening cleanup, not a rebuild. No data is lost — BuddyPress data lives in the WP database, untouched by theme changes.

## Website surface gaps (named for future content work, NOT reskin blockers)

The live WP site has surfaces NOT in the static-site mockups: Outreach, Media, BuddyPress community pages (Activity / Forums / Groups / Members / profile features), Join an Assembly footer link. These exist on the live site but have no static-site reference design. They'll retoken automatically with the v4 reskin (they use the same theme components and CSS variables), but content / layout iteration on those surfaces is its own ongoing work after the reskin lands.

## Reskin order-of-ops + safety

1. **Backup first.** Copy current static-site CSS + WP theme to `_pre-v4-website-skin/` mirrors (same convention as `brand-assets/_pre-v4/` rollback at S126). Reverting is one command if the new skin doesn't land with partners.
2. **Token flips.** Edit the CSS variable values in `:root` blocks. Components retoken on next render.
3. **BuddyPress overrides.** Add ~30 lines of CSS to the WP theme to override BuddyPress button defaults.
4. **Light-mode calibration.** Adjust the parchment-variant hex values for techelet/argaman/gold so contrast holds.
5. **Visual review.** Walk every top-level page + every BuddyPress surface in both light and dark mode, looking for any token that didn't retoken cleanly.

## Logo bottom text decision (locked S127)

Yoshi went with **"And Two Sticks Shall Become One"** (Ezekiel 37) for the new website logo. The motto turns ambient tagline into signature — same phrase already appears in the site's hero subtitle but on the LOGO it becomes the anchor the whole composition rests on.

## Logo file management (shipped S127)

- New website logo (the v4 Grok render with the Ezekiel 37 motto): copied to `Desktop/book covers/Website Logo - Assembly of the Remnant of Promise v4 (Ezekiel 37).png`
- App logo (v4 brand-mark hero 832×1248): copied to `Desktop/book covers/App Logo - Brand Mark Blue on Black v4 (Argaman Tribes).png`. Source-of-truth STAYS at `App/brand-assets/brand-mark-blue-on-black-v4-argaman-tribes-832x1248.png` because the Vite build imports from that locked path per §24 — do NOT move it.
- The original Grok download in `~/Downloads/grok-image-6c4400f6-fff3-4eab-b31a-dd8c88f79bbc.png` is still there (sandbox couldn't remove it); Yoshi can manually trash it.

## Open items deferred past S128

- **App hide-apparatus master toggle.** Yoshi noted at S127 that the existing "Hide commentary" toggle only hides ChapterCommentary, not ChapterEndCard (Tanakh sources / cross-references). Wants a master "scripture only" toggle that hides both, on all tiers, with an obvious on/off affordance. Out of scope for the website reskin; deserves its own small wheel.
- **Argaman underlines in the scripture page reader.** The scripture-page aesthetic moves locked above (argaman on book/chapter headings + end-of-scripture rule) are reader-side CSS work, distinct from the website reskin. Can land parallel or after S128.

---

## S201 — Chapter-end apparatus aesthetic pass (decisions settled; not yet built)

Reviewed the chapter-end commentary + cross-references + end cards with Yoshi.
Settled calls (a visual before/after mock was shown and approved in direction):

1. **Chapter→apparatus separator ornament** — APPROVED: the **gold diamond
   between two hairlines** (the mock version — "yes, that is beautiful").
   The menorah/brand-mark glyph in gold remains an easy future swap if a
   stronger brand tie is wanted; diamond is the V1 pick.
2. **Serif for substance, sans for chrome** — thread titles, chapter-intro
   headings, and quoted scripture render in a serif display face; labels,
   pills, anchor lines, buttons stay sans. (Make the page read like a book,
   not a dashboard.)
3. **Quoted scripture as styled blockquotes** — indented block, colored
   left-rule, more line-height, so quoted verses stand apart from
   commentary prose. Reinforces come-and-see (quote-don't-cite).
   ⚠ LOCK-CHECK: the rule color must NOT be techelet (#1A6FE5) — techelet
   is reserved for divine names only (S127 §3 lock). Use SPECTRAL BLUE
   (#0084FF) or argaman for the blockquote rule + apparatus separators.
   (The mock used techelet as a placeholder; correct on build. NOTE: the
   current ChapterEndCard.tsx header is also coded techelet #1A6FE5 —
   that's drift vs the S127 spectral-blue-for-apparatus lock; fix in the
   same pass.)
4. **Cross-reference density — Yoshi's version (REPLACES Claude's dots
   idea):** keep the full metallic source-class pills. Show at least 3
   targets per verse as-is; when a verse has MORE than 3, append a
   **metallic-blue pill labeled "more for this verse"** that expands the
   rest. New register: metallic blue (border #9FD0FF, gradient
   #0E2C50→#2E7BD6→#0E2C50, text #EAF4FF) — the progressive-disclosure
   expander color.

   **4b. Balanced default-3 selection (Yoshi, S201 — framework-bearing).**
   The three pills shown before "more for this verse" must include at
   least ONE Tanakh (emerald), ONE extra-canonical (argaman), and ONE New
   Testament (gold) target — WHEN the verse has at least one target in
   that source class. Not just the first 3 by sort order. Rationale: every
   reader sees the cross-canon witness at a glance — Law/Prophets +
   restored library + apostolic writings testifying together (the
   full-library, bidirectional cross-reference architecture from the voice
   skill). Fallback when a class is absent: fill remaining visible slots
   from the present classes by existing sort order. If >3 and all classes
   represented, the balanced 3 show and the rest go behind the expander.
5. **Thread cards = the jewel of the page** — register-colored top border
   (source-class), subtly lifted surface, larger radius, quiet hover lift.
6. **Spacing/rhythm pass** — consistent vertical rhythm + a left-edge or
   top-border anchor per block (pills / scripture / thread). Shown in mock.

**NEW HARD RULE (Yoshi, S201) — no greyed-out white text anywhere.**
Tier-locked / secondary content must stay FULLY READABLE. Separate it by
box, border, font change, or color shift — never by lowering opacity on
the text. This RETIRES the S140 Option-C 40%-opacity locked-baseline-row
treatment AND the fade-to-surface gradient over locked-thread teasers.
Replacement (shown in mock): a bordered card in the tier's register color,
full-opacity text, a tier chip + Unlock pill doing the "locked" signaling.
Easier to read, never harder. Applies across ChapterEndCard,
ChapterCommentary, ToolAnnotationBand, and every tier-locked surface.
