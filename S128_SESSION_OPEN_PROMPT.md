# S128 — Website v4 reskin (priest-* → techelet/argaman/gold)

The Yoshi-side WP build + the static-site mockup get their color tokens migrated to the locked v4 §3 sacred-color register. Buttons retoken automatically through CSS variables; BuddyPress surfaces need theme overrides; both deploys ship the same palette.

**Read first:**
- `DESIGN_LANGUAGE.md` §3 — sacred-color register lock (techelet / argaman / gold)
- `S127_AESTHETIC_DECISIONS_LOG.md` — every aesthetic call locked at S127's post-W7 discussion; the source-of-truth for this wheel's scope
- `Website/static-site/css/main.css` — the current static-site palette + button vocabulary
- `Website/wordpress-deploy/remnant-of-promise/style.css` + `/css/` subfolder — the WP theme stylesheet

**Locked v4 assets:**
- `~/Desktop/book covers/Website Logo - Assembly of the Remnant of Promise v4 (Ezekiel 37).png` (new website logo, Yoshi-locked S127 with Ezekiel 37 motto)
- `~/Desktop/App/brand-assets/brand-mark-blue-on-black-v4-argaman-tribes-832x1248.png` (app + landing hero, locked at §1 + §24)
- `~/Desktop/App/brand-assets/brand-mark-blue-on-black-v4-argaman-tribes-share-card-watermark-240x360.png` (share-card watermark, locked at §24)

**Build scope (website-only — no app code, no schema, no API):**

1. **Backup current skin** to `Website/_pre-v4-website-skin/` mirrors (static-site CSS + WP theme stylesheets). Same convention as `brand-assets/_pre-v4/`. Rollback in one command if partners don't take to it.
2. **Flip priest-\* tokens** in both deploys: `--priest-blue` → techelet `#1A6FE5`; `--priest-purple` → argaman `#8E4FB3`; `--priest-scarlet` → folds into gold (priestly-witness register absorbs atonement-adjacent meaning). Emerald drops entirely if any references exist.
3. **Flip `--text-muted` + `--text-dim` → `#ffffff`** in both deploys (the gray-to-white fix from S127). Warm-tan tones replaced with pure white across every secondary text register.
4. **BuddyPress button overrides** — ~30 lines of CSS in the WP theme to override BuddyPress button defaults (Send Message / Add Friend / Reply / Join Group / etc.) so they inherit the new v4 tokens. Without overrides, BuddyPress surfaces will retain the default BuddyPress button styling and look visually disconnected from the rest of the reskinned site.
5. **Light-mode calibration** — define every v4 token twice (`:root` for dark, `[data-theme="light"]` for parchment). Techelet deepens slightly on parchment for readability; argaman similar; gold reads differently on warm vs cool fields. Estimated ~30 minutes.
6. **Update the website's logo file references** — replace any references to the pre-v4 logo asset with the new v4 (Ezekiel 37) logo from `book covers/`. Header logo, footer logo, Open Graph preview, favicon.
7. **Install logo into the WP theme** — drop the v4 logo into `wordpress-deploy/remnant-of-promise/assets/` (or wherever the WP theme references brand assets), and update header.php / footer.php / functions.php as needed.

**Verification:** visual walkthrough of every top-level page (Home, Statement of Faith, What We Teach, Mission, Books, Blog, FAQ, Tithes-Alms-Offerings, Outreach, Media, Contact) plus every BuddyPress surface (Activity, Forums, Groups, Members, profile features) in BOTH light and dark mode. Look for any token that didn't retoken cleanly, any button still in default BuddyPress styling, any text rendering as the old warm-tan muted instead of pure white.

**Drift-catch at ship:**
- Any `priest-` reference outside the CSS color-token definitions (templates, inline styles, content) — replace with the v4 equivalent.
- Any pre-v4 brand-mark URL references in templates → swap to v4.
- The static-site `--priest-scarlet-bright` / `--priest-purple-bright` etc. accent variants — fold into the corresponding v4 -bright variant or retire if unused post-flip.

**Out of scope at this wheel:**
- App-side changes (argaman scripture-page underlines, hide-apparatus master toggle, commentary chrome gray bump). All deferred per the S127 decisions log; each is its own small wheel.
- New page creation / content rewrites / nav restructuring.
- BuddyPress structural changes (forum / group / member-profile feature changes).
- Marketing-copy editing.

**Safety:** WordPress database (members, posts, groups, BuddyPress activity, comments, etc.) is NOT touched by this wheel. Reskinning is purely CSS / theme stylesheet work. Every piece of community data persists exactly as it is.
