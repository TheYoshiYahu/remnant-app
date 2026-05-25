# The Remnant of Promise Official Study Bible — Color Palette

Single source of truth for every color used or named in the project. Update this file whenever a color is added, retired, or repurposed. Cross-reference it before introducing any new color elsewhere. Drift across surfaces is the failure mode this file exists to prevent.

Each entry names the color, gives the hex (or gradient), names the register / theological role, and lists the surfaces that use it. Surfaces that ship a color WITHOUT a register entry below are out of compliance and need to be either retired or added to this file.

---

## §1. Sacred-Color Register (DESIGN_LANGUAGE §3)

The three locked theological registers that thread through body text and chrome. Each tied to a specific class of meaning the framework reads in scripture.

### Techelet — divine-name register

- **Hex:** `#1A6FE5`
- **Brand-mark deep variant:** `~#0A2D84` (post-25% saturation lift, sampled from v4 mark title text)
- **Theological role:** the priestly cord (Numbers 15:38–40) — the divine-name register. Used where the divine is named or addressed.
- **Surfaces:**
  - Sacred-name 4-direction outline on body text (`Yahuah`, `Yahusha`, `Elohim`, etc.)
  - Brand-mark title text *The Remnant of Promise* / *Official Study Bible*
  - Brand-mark blue olive-branch motif
  - Hide-study-aids button (S130)
  - "Cross-References in Matthew N" section header (S130)

### Argaman — covenant-body register

- **Hex:** `#8E4FB3`
- **Brand-mark deep variant:** `~#670FAF` to `~#6A0FB2` (post-saturation lift, JUDAH / EPHRAIM labels)
- **Theological role:** royal purple (Exodus 26:1) — the covenant-body register. Used where the covenant people are named, addressed, or counted.
- **Surfaces:**
  - Body-text sacred-name outline for *Yashar'el (Israel)*, *Yahudah (Judah)*, *Yahudim (Jews)*, *Yahudi* (Jew/Jewish)
  - Brand-mark JUDAH + EPHRAIM tribe labels (v4)
  - Extra-canonical cross-reference labels (S130) — 1 Enoch, Jubilees, Jasher, Apocrypha, Adam & Eve Conflict, etc.

### Gold — priestly-witness / divine-presence register

- **Brand-mark sampled palette (from v4 menorahs):**
  - Shadow: `#645028` (warm bronze-brown)
  - True midtone: `#A1885E` (antique gold)
  - Bright midtone: `#B4A078` (clean readable bronze-gold)
  - Highlight specular: `#FCECAF` (pale champagne)
- **Pre-S115 §5 spec (retired):** `#D4AF37` — original DESIGN_LANGUAGE §5 spec, swapped to spectral blue at S115. Preserved here for historical reference; do not use in new chrome.
- **Theological role:** the priestly witness (the menorahs of Zechariah 4, the lampstands of Revelation 1) — the divine-presence motif at the joining of the branches.
- **Surfaces:**
  - Brand-mark menorahs flanking the central trunk + the central light/trunk itself (v3, v4)
  - New Testament cross-reference labels (S130) — use bright midtone `#B4A078` at body-text scale

---

## §2. Reader Chrome Accent (DESIGN_LANGUAGE §5)

### Spectral blue

- **Hex:** `#0084FF` (470nm spectral blue)
- **CSS variable:** `--reader-accent` (both light and dark themes)
- **Theological role:** none — pure UI accent. Elected by Yoshi at S115 in place of the §5 gold spec because the blue holds visible-accent presence against the pure-black reader pane more cleanly than gold did at small typographic sizes.
- **Surfaces:**
  - Chapter dividers
  - Verse numbers (superscript before each verse)
  - Range-selection anchor verse left-border + 8%-alpha tint
  - Search match `<mark>` background at 25% alpha
  - Per-verse cross-reference book-chapter-verse target rendering (until the S130 source-type coloring lands per §3 of this file)
  - Share-card verse numbers (sampled by canvas at render time)
- **Saturation note (carry-forward, deferred):** Yoshi observed at S115 that the 470nm blue reads pastel rather than vivid in deployed conditions. A saturation-tuned candidate is on the table as a possible follow-up wheel if confirmed; the current `#0084FF` is what ships until then.

---

## §3. Divine-Speech / Expansion Register (DESIGN_LANGUAGE §6 + S130 lock)

### Bracket-emerald gradient

- **Gradient:** `#04321E → #15A86A → #2EFFA1 → #80FFC9 → #2EFFA1 → #15A86A → #04321E`
- **Outer glow:** `rgba(46,255,161,0.6)` near + `rgba(46,255,161,0.25)` far
- **Theological role (original):** divine-speech bracket marker — Yahuah's direct speech in the OT and Yahusha's direct speech in the NT both carry the emerald S-curve bracket. They are the same Voice per the framework's nature-of-God reading. Replaces the Christian "Jesus's words in red" treatment.
- **Functional role (S130 lock):** uniform **expansion affordance** color across the entire app. Every collapsible / expand control uses this palette on the trigger element so the reader learns "metallic green = more is hidden here, click to expand."
- **Surfaces:**
  - Divine-speech S-curve brackets (original §6 use)
  - "Read the basic walk →" expander button (S130)
  - "Read the deeper dive →" expander button (S130)
  - All future expand/collapse triggers across the PWA must use this gradient on the button face.

### Bracket-emerald midtone solid

- **Hex:** `#15A86A` (mid-tier of the gradient above)
- **Theological role:** same as the gradient — the divine-speech / expansion register, in small-text or body-label form where a gradient text would be too busy.
- **Surfaces:**
  - Old Testament / Tanakh cross-reference book-chapter-verse labels (S130) — e.g., the *Genesis 5:1* label color when rendering a Tanakh cross-reference target

---

## §4. Olive-Leaf / Icy Silver-Blue Register (new at S130)

The brand-mark olive branches carry techelet-family leaves with a measurable green hint — read by Yoshi as "silver blue with a hint of green." Sampled directly from `brand-assets/brand-mark-blue-on-black-v4-argaman-tribes-832x1248.png` (5,495 matching pixels, B-dominant with consistently elevated G channel).

- **Deep:** `#334969` (deep slate-blue, leaf-shadow tone)
- **Midtone:** `#455A7A` (steel-blue with green hint, dominant leaf body)
- **Highlight / icy:** `#8298B6` (pale silver-blue, leaf-specular highlight)
- **Theological role:** the olive tree of Romans 11 — the covenant root the framework restores. Cool, weather-aged, not glowing.
- **Functional role:** undeclared at S130 — color reserved in the palette for future use per Yoshi's instruction *"we just need a cool icy blue green to be utilized like whats in the logo."* The chapter-number role was assigned here briefly and then re-assigned to the §3 bracket-emerald bright highlight `#2EFFA1` per Yoshi's correction (he meant the metallic green from the expander buttons all along; the leaf register is a different green). Candidate future uses: secondary chrome rule lines, the inactive state of toggles, peripheral metadata labels, "you are here" indicators in the table of contents.
- **Surfaces:** none active as of S130; reserved.

---

## §5. Reader Theme Variables

CSS custom properties on `:root` (dark default) and `[data-theme="light"]` overrides. Defined in `app/src/index.css`.

### Dark theme (default, S115 + S118 lock — what ships in screenshots and store images)

| Variable | Hex | Role |
|---|---|---|
| `--reader-bg` | `#000000` | Pure black background |
| `--reader-text` | `#FFFFFF` | Body text |
| `--reader-muted` | `#A3A3A3` | Mid-gray secondary text (AA contrast on black) |
| `--reader-rule` | `#2A2A2A` | Borders / dividers (subtle on black) |
| `--reader-surface` | `#0A0A0A` | Cards / dropdowns / light-button surface (a hair above pure black for depth) |
| `--reader-accent` | `#0084FF` | §2 spectral blue |

### Light theme (parchment alternative)

| Variable | Hex | Role |
|---|---|---|
| `--reader-bg` | `#FAFAF7` | Warm off-white background |
| `--reader-text` | `#1A1A1A` | Near-black body text |
| `--reader-muted` | `#6B6B6B` | Mid-gray secondary |
| `--reader-rule` | `#E5E5E5` | Borders |
| `--reader-surface` | `#FFFFFF` | Cards |
| `--reader-accent` | `#0084FF` | §2 spectral blue (unchanged across themes) |

---

## §6. Highlight Palette (12-color user highlights)

Unlocked at the $1.99 Notes tier. Each color sits in its own hue family — no two close enough to be confused. All visibly distinct from techelet and argaman so user marks never read as sacred-name treatment.

| Color | Hex | Hue family |
|---|---|---|
| Neon yellow | (free-tier color, separate spec) | Free-tier glow |
| Crimson | `#D14555` | True red |
| Tangerine | `#F0A050` | Orange |
| Honey | `#E8C04A` | Yellow |
| Sage | `#97C459` | Yellow-green |
| Emerald | `#4DAE7F` | Green |
| Teal | `#5FB8B0` | Blue-green |
| Sky Blue | (spec in DESIGN_LANGUAGE §17 table) | Blue |
| Periwinkle | `#9F9FE0` | Blue-violet |
| Lilac | `#D4B0E0` | Light violet |
| Magenta | `#E060A5` | Pink-violet |
| Rose | `#D17BA4` | Soft pink |
| Parchment | `#C5B795` | Warm neutral |

**Note:** the Highlight Palette `Emerald #4DAE7F` is a USER-MARK color and is NOT the same as the §3 divine-speech / expansion register green. Do not conflate. The §3 register green is the bracket gradient (`#04321E → #15A86A → #2EFFA1`); the highlight Emerald is a single solid hue for verse marking. Different purposes, different families.

---

## §7. Brand-Mark Variants (sampled palettes)

Each brand-mark asset under `~/Desktop/App/brand-assets/` is a complete render; the registers above are the palette the renders are built from. This section catalogs which register each variant uses so future asset work knows which palette to honor.

| Variant filename | Registers used | Notes |
|---|---|---|
| `brand-mark-blue-on-black-v4-argaman-tribes-*.png` | techelet (title + leaves), argaman (JUDAH + EPHRAIM labels), gold (menorahs + central trunk) | **Locked share-card watermark + App Store hero (S126).** Full §3 sacred-color register completeness. |
| `brand-mark-blue-on-black-v3-gold-accents-*.png` | techelet (title + branches), gold (menorahs + accents) | Pre-v4. Two of three §3 registers. Preserved in `_pre-v4/` as the rollback option. |
| `brand-mark-blue-on-black-v2-silver-*.png` | techelet, silver (no gold or argaman) | Alternate / silver register. |
| `brand-mark-blue-on-black-*.png` (no suffix) | techelet only | v1 — earliest variant. |
| `brand-mark-gold-on-brown-*.png` | gold + warm brown background | Warm-surface variant for book covers, print, Assembly back matter where the warm field matches the surface. NOT the share-card watermark. |

---

## §8. Discipline Rules (drift prevention)

1. **Never introduce a new color without adding it to this file first.** If a surface needs a color not listed above, the color is either an existing register the surface should reuse, or it's a new register that needs an entry here before the code lands.
2. **Functional roles are locked once declared.** The §3 expansion register is metallic emerald everywhere — every expand/collapse trigger uses the same palette. Don't introduce a second "expand" color.
3. **Sacred registers carry theological weight; do not use them decoratively.** Techelet is for the divine name. Argaman is for the covenant body. Gold is for the priestly witness. Apply them where the framework reads those meanings; do not paint a button techelet because "it looks nice."
4. **Highlight palette colors are user-mark only.** Do not borrow `#4DAE7F` (Highlight Emerald) for chrome or the cross-ref register green role — the user's marks must remain visually distinct from app chrome.
5. **The §5 spectral blue is the chrome / UI accent.** The §3 techelet is the sacred-name register. They are different blues with different jobs even though they're close in hue. The 4-direction outline technique on body text uses techelet; chapter dividers and verse numbers use spectral blue.
6. **The pre-S115 §5 gold (`#D4AF37`) is retired chrome.** Do not reintroduce it on chrome surfaces. The gold register lives on brand-mark menorahs (palette sampled in §1) and on NT cross-reference labels per S130 — both surfaces where the priestly-witness theology applies. Chrome gold was tried at S115 and rejected on legibility grounds.

---

## §9. Cross-Reference Source-Type Coloring (locked S130)

Cross-reference labels in the chapter-end card render with color tied to source type — the reader learns the framework's source-architecture by scanning the palette. Locked at S130 as the canonical scheme for every cross-reference surface across the app.

| Source class | Color | Hex | Register |
|---|---|---|---|
| Section header ("Cross-References in *Book Chapter*") | Techelet | `#1A6FE5` | §1 divine-name |
| Chapter number in the chapter heading ("Matthew **2**") | Bracket-emerald bright highlight | `#2EFFA1` | §3 expansion register (bright stop of the bracket gradient) — chapter-scope navigation pointer at font-medium weight. Argaman was tried first and didn't read on the thin font weight; the olive-leaf icy silver-blue `#8298B6` was tried second and was the wrong green (cool blue with green hint, not the metallic emerald the expander pills use). The bright bracket-emerald is the same green register the expander pills and Tanakh ref pills use, locked S130 follow-up. Paired with spectral blue at verse scope below. |
| Source-verse group labels ("Verse 1", "Verse 3", etc.) | Spectral blue | `#0084FF` | §2 reader chrome accent (matches in-body verse numbers — consistent "verse-number pointer" register) |
| Thread anchor label ("Anchor: Matthew X:Y") | Spectral blue | `#0084FF` | §2 — same verse-pointer register as source-verse group labels |
| Thread inner sub-header ("Cross-references in this chapter") | Techelet | `#1A6FE5` | §1 divine-name — chrome sub-header at thread scope, mirroring §9 main header |
| Thread summary toggle ("Show more" / "Show less") | Bracket-emerald midtone | `#15A86A` | §3 expansion register — same family as expander buttons |
| Old Testament / Tanakh refs (Genesis, Joshua, Isaiah, etc.) | Metallic emerald mini-pill (same treatment as the expander buttons, scaled down) | bg `linear-gradient #04321E → #15A86A → #2EFFA1` + border `#2EFFA1` + text `#E6FFF2` | §3 expansion register — Tanakh refs render as inline mini-buttons using the exact same metallic-emerald pill treatment as the `<details>` expander buttons (per Yoshi's S130 call: "use this green," pointing at the expander buttons). NT and Extras stay as solid inline colored text until pill versions in their own registers ship. |
| New Testament refs (Matthew, John, Romans, etc.) | Brand-mark gold midtone | `#B4A078` | §1 priestly-witness |
| Extra-canonical refs (1 Enoch, Jubilees, Jasher, Apocrypha, Adam & Eve Conflict, Sonnini's Acts of Paul, etc.) | Argaman | `#8E4FB3` | §1 covenant-body |

The expander **buttons** keep the full metallic emerald gradient treatment per §3 above. The cross-reference per-target labels use the matching solid midtones at small text sizes so they don't compete visually with the body italic verse-preview text.

### Companion rule — commentary surface labels (locked S130)

The same logic carries to the `<ChapterCommentary>` stack that sits ABOVE the cross-reference card:

| Label | Color | Hex | Register |
|---|---|---|---|
| Section header ("More on *Book Chapter*") | Techelet | `#1A6FE5` | §1 divine-name — chrome-section header consistent with cross-ref section header |
| Sub-section headings inside Deeper Dive body ("§1. THE FOUR WOMEN…", etc.) | Techelet | `#1A6FE5` | §1 — smaller `<h5>` scale for hierarchy beneath the section `<h3>` |
| Expander close-state labels ("Close the basic walk", "Close the deeper dive") | Bracket-emerald midtone | `#15A86A` | §3 expansion register — the open-state of the green expand buttons |

**What stays muted (intentional):** tier badges ("Notes", "Library") — these signal price/tier and read as quiet metadata, not chrome labels. Ornamental arrows (`→`) in cross-ref rows. Member-note body prose inside threads (that's commentary content, not chrome). Verse-preview italic text. Locked-row opacity-reduced labels (kept in their source-type color at 40% opacity so the source register stays readable; opacity carries the locked signal).

**What lives in other surfaces (deferred):** muted-grey labels inside modal/drawer chrome — `BookmarkSheet`, `NotesPanel`, `HighlightPicker`, `SearchModal`, `Pricing`, `StrongsLookup`, `VerseActionMenu`, `RangeActionPicker`. Those surfaces use muted-grey for chrome that shouldn't compete with the active content; their color treatment is a separate sweep deferred to a future wheel.

**Tier-locked targets** (when the corpus overhaul adds extras-tier cross-reference targets) render at 40% opacity and route to `/pricing` on click. The argaman color is preserved at reduced opacity so the reader sees "this is the extras register, locked" without any color register being lost.

---

*Last updated: S130 (2026-05-24). Edit in place; do not create dated duplicates per the two-file roadmap convention.*
