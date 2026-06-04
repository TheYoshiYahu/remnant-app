# Next Session — Public-Domain Tooling Inventory

Mount `~/Desktop`. Read `App/APP_BUILDOUT_ROADMAP.md` first. **Cross-reference sweep is paused.**

**Job: make sure we *have* every public-domain tool we'll ship. Gather + verify only — no app wiring.**

1. **Audit each "coming soon" stub** (App.tsx §20 catalog) → have / missing / not-a-download.
   - Have ✅: BDB, Strong's Hebrew+Greek, STEPBible tagged data.
   - Missing ❌ (source, public-domain only): **maps** (highest value), **LSJ**, **Vine's**, **Nave's**, **TSK** (Torrey).
   - Not downloads: **interlinear** (STEPBible + Strong's), **Nikkudot** (does our Hebrew carry pointing?).
2. **For each tool, log two things:** its license / public-domain status, and its known framework-conflict
   points (where it carries the inherited reading) — that's the punch list for the annotation layer.
3. **TSK** is now in-scope as a *standalone, late, opt-in* tool (NOT the chapter-end surface) under the
   "annotated foil, never the default surface" policy. Source the data; flag late-integration + needs a
   pre-launch distortion sweep; move its UI stub out of the chapter-end cross-ref list.
4. **Manifest:** extend `source-texts/DOWNLOAD_MANIFEST.md` / `SOURCE_TEXT_INVENTORY.md` — asset, source URL,
   license, on-disk path, conflict points, integration notes. This is the build list for the integration session.

**Downloads:** check `source-texts/` locally first. When a source needs the browser or a blocked domain,
name the exact domain + asset and Yoshi will open Chrome or grant the permission on the spot.

**Out of scope:** wiring/rendering tools, the notes/bookmarks apparatus, the chronological option, the xref sweep.
