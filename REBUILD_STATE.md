# Matthew Rebuild — Rolling State

This is the single rolling state file for the Matthew rebuild. Update it in place at session-close; don't write per-session handoffs. The voice skill carries the framework spine; this file carries the rebuild-specific drift.

## Where we are

- **Done**: matt-1 through matt-28 (short.md + free.md for each). **THE MATTHEW SWEEP IS CLOSED — 28 OF 28.**
- **Round 1 ship — DONE (S110-S111):** Matthew commentary + full cross-reference apparatus live on `bible.remnantofpromise.org`. Specifically:
  - `chapter_intro` populated from matt-N-free.md for all 28 chapters (loader at `restoration-pipeline/_session110_load_matthew_free_tier_commentary.py`).
  - PWA italics fix (shared markdown helper at `app/src/lib/markdown.tsx`), full cross-reference verse text (no truncation), pericope-style paragraph breaks (KJV USFX-extracted paragraph_starts.json bundled in PWA, 4,635 markers across 65 books), "Members in this chapter" → "Cross-references in this chapter" label rename.
  - 1,695 curated cross_references rows + 67 threads + 1,123 Layer 1 rows materialized into prod via `data-schema/migrations/session110_matthew_cross_references.sql`.
  - matt-5 fulfill treatment + `fulfill-as-prophecy-bringing-to-pass` thread (anchor Matt 5:17-19; 35 NT plēroō prophecy-fulfillment members) shipped via `data-schema/migrations/session111_fulfill_thread.sql`.
- **Tiered commentary surface — DONE (S112):** `matt-N-short.md` (Basic) + `matt-N.md` (Deeper Dive) now render below the free chapter_intro and above the cross-reference apparatus on every Matthew chapter. Specifically:
  - 56 `commentary_entries` rows live in prod: 28 Basic (`surface_kind='inline'`, `tier_required='study_notes'` per S112 fix) + 28 Deeper Dive (`surface_kind='deep_dive'`, `tier_required='extras'`). Loader at `restoration-pipeline/_session112_load_matthew_tiered_commentary.py`. Total: ~374k words of framework reading on Matthew.
  - **Tier-mapping correction** (S112): graduated reveal across the v1 ladder. **Free** = `chapter_intro` (S110). **Notes ($1.99)** = `chapter_intro` + Basic. **Library ($4.99)** = chapter_intro + Basic + Deeper Dive + full extras book library + BDB/Thayer's/Gesenius/Easton's/Smith's/ISBE/maps/atlases/concordances + Josephus. Earlier voice from S46/S47 placed BDB+apparatus at free; S112 moved them to Library per Yoshi's call so the $4.99 tier earns its keep on tools.
  - New API endpoint `GET /v1/books/{slug}/chapters/{n}/commentary` returns commentary_entries with tier-gating per row — locked rows come back with body=null + locked=true so the PWA renders an upgrade affordance with "Unlock with [Tier] ($X.XX/mo)" CTA (Yoshi's "catch the eye" pattern A).
  - New PWA component at `app/src/components/ChapterCommentary.tsx` renders the stacked Basic / Deeper Dive blocks with collapsible expanders ("Read the basic walk →" / "Read the deeper dive →"). Hide-commentary toggle persists per-user via localStorage. matt-N.md `## §N` sub-sections render as h5 sub-headings inside the Deeper Dive body.
  - "← Back to Remnant of Promise" link added to the PWA footer.
  - **Future-loader pattern established (S112):** post-seed loaders ship inside the API Docker image (Dockerfile COPY + .dockerignore negate-pattern) so they run from Render Shell — sidesteps the external-Postgres SSL/IP rejection that blocked the laptop path. Use this for all future loaders.
- **Outside-Matthew audit list (still queued):** `1-corinthians-11.md` body rewrite + canon.json string rewrite; `john-1.md` final-pass + short-form layer.

## Next wheels — surfaced in S112 conversation, not yet built

These are the wheels Yoshi named or implied during S112 that did NOT land in this session. Each is its own session-sized piece of work.

- **App Store + Google Play wraps (Capacitor).** Wrap the PWA in a thin native iOS/Android shell so the app gets storefront listings. $99/year Apple Developer + $25 one-time Google Play (Yoshi pawned to cover both). Single codebase, no rewrite. Schema + PWA already support everything; this is packaging + submission work.
- **Install buttons on the marketing surface.** Two buttons: "Get the app" (mobile/tablet → fans out to App Store + Play Store badges by device) and "Download for desktop" (triggers the PWA install prompt for Mac/Windows/Linux). No ambiguity about path.
- **Offline-first service worker + "Download everything" tap.** PWAs do offline natively via service workers. Standard pattern: app shell cached on first visit, verses + commentary + cross-references cached lazily as the partner reads, one-tap "Download everything for offline use" pre-caches the full canon + whatever extras tier they've unlocked. User data (highlights, notes, bookmarks, reading position) writes locally first, syncs when network returns. **Yoshi's commitment to all tiers including free per S47 lock — do not gate offline behind paid.**
- **Highlight / underline / notes / bookmarks / memorization / export UI.** Schema tables already exist (`verse_highlights`, `study_notes`, `reading_positions`). UI not built. **Tier split per Yoshi's S112 correction:** free = 1 highlight color, no notes. Notes ($1.99) = multiple highlight colors + basic notes + memorization + export. Library ($4.99) = smart-notes system + bookmark organize/label + dismantling units.
- **Strong's tap-on-word lookup** (Phase 5 deliverable). All tiers per S112. Schema tables (`strong_entries`, `verse_words`) exist but empty. Loader + UI not built. Also queued: the **nikkudot-strip + grouped-column view** flagship feature (S17 lock).
- **BDB / Thayer's / Gesenius / Easton's / Smith's / ISBE dictionaries + maps + atlases + concordances** as $4.99 Library tier reference apparatus. Public-domain data + UI surfaces not yet built.
- **Statement of Faith doorway (I-VII)** surface in PWA. Schema table (`sof_sections`) exists; surface not built.
- **Daily reading plan** (free tier). Schema implied; surface not built.
- **Sacred-names display-preference toggle** (Q15 back-burner from S35).
- **ROP → Bible app menu link in WordPress.** Yoshi to add via WP admin → Appearance → Menus → custom link to `https://bible.remnantofpromise.org` with label "Study Bible." (Bible app → ROP link landed in PWA footer at S112.)
- **Screenshots for site advertising + Play Store + App Store listings.** Capture after the highlight/notes UI lands so the screenshots show the real reading surface, not the bare reader.

### Marketing-surface copy (locked S112 from Yoshi's voice)

> *"For a better experience download the app — whatever your tier is, the app is a better experience whether desktop, tablet, or mobile, and all your bookmarks, notes, and tools save across devices and platforms with your account."*

Use this verbatim on the install-buttons surface when that wheel lands.

## Per-chapter operational pattern

Existing `matthew-N.md` (database-source, already in place) is read at session-open for substance-architecture; per-chapter session work is `matthew-N-short.md` + `matthew-N-free.md` only. One chapter per session typical at NEW-band density.

## Pre-checks at-draft-time (priority-ordered)

1. **Hyphenated-compound parenthetical-on-every-mention** across ALL sub-patterns — personal-name, geographic-sacred-name, deity-name (single + compound), covenant-people-name. **Any Tanakh-substantive containing a deity-name renders with spaces; deity-name standalone with parenthetical; no compound-extension before or after parenthetical.** (Day of Yahuah, fear of Yahuah, Lamb of Elohim, Son of Elohim, goat for Yahuah, living Elohim, yielding of the Ruach HaKodesh, etc.)
2. **NO internal-document references** — unfold substance descriptively.
3. **NO framework reflexives** — use *the substance reads X / the canon walks X / the King-of-Yashar'el (Israel) walks X / the prophet-X walks X / the apostle-X walks X*.
4. **English book-names at ALL citation AND naming positions** including in hyphenated-substance-pointer-modifier-constructions. Personal-name *Yochanan (John)* OK in prose; book-citation is *John X:Y*.
5. **Son-of-Adam absolute with kaph-comparative narrow-carve-out at Daniel 7:13 / Revelation 1:13 / Revelation 14:14 ONLY.**

Short.md sweep-corrections do NOT automatically internalize for free.md drafting — re-trigger discipline-attention explicitly at-draft-time on free.md.

## Word-count calibration

| Chapter | Short.md | Free.md | Band |
|---|---|---|---|
| matt-13 | 7,517 | — | framework-density-peak |
| matt-14 | 4,335 | — | narrative |
| matt-15 | 4,062 | — | narrative |
| matt-16 | 8,731 | — | multi-major |
| matt-17 | 8,482 | — | multi-major |
| matt-18 | 10,299 | — | multi-major-PLUS |
| matt-19 | 9,794 | — | multi-major |
| matt-20 | 10,614 | — | multi-major-PLUS |
| matt-21 | 10,724 | — | multi-major-PLUS |
| matt-22 | 12,377 | 3,676 (3.37) | NEW |
| matt-23 | 10,803 | — | multi-major-PLUS |
| matt-24 | 16,331 | 3,247 (5.03) | SECOND-NEW |
| matt-25 | 14,237 | 2,872 (4.96) | BETWEEN |
| matt-26 | 12,932 | 2,868 (4.51) | NEW |
| matt-27 | 13,896 | 2,009 (6.92) | BETWEEN |
| matt-28 | 12,151 | 3,326 (3.65) | NEW |

**Bands**:
- Narrative: 4,000-4,500
- Framework-density-peak: 6,000-7,500
- Multi-framework-major: 8,000-9,800
- Multi-framework-major-PLUS: 10,000-11,500
- NEW (one FRAMEWORK-MAJOR + Tanakh-cluster): 12,000-13,500
- BETWEEN-NEW-and-SECOND-NEW: 13,500-15,000
- SECOND-NEW-BAND-ABOVE: 15,000-17,000+

Free.md compression-ratio historical range: 3.37-6.92. Honest-compression preferred over ratio-alignment.

## Wrap-signal triggers (S93 calibration)

1. Substantive-turn count ≥25-30
2. Context budget ≥~70%
3. Observable-error-rate clustering (multiple sweep-catches in close succession on similar work)

Fatigue-feeling is NOT a wrap signal. When wrapping, transcribe verbal answers into source-of-truth files BEFORE closing — answers that live only in conversation get lost at session boundary.

## Recent observations (keep last 1-2 sessions only; trim older)

- **S112 (tiered commentary surface — DONE)**: Loader + API endpoint + PWA renderer + Dockerfile/dockerignore pattern shipped end-to-end. Key disciplines that surfaced or got reinforced:
  - **Never paste production credentials into chat.** Yoshi's External DATABASE_URL hit the conversation log via a failed `read -rs` paste sequence; required password rotation mid-session. The fix: use file-based hand-off (`pbpaste > file`, `cat file`) where clipboard never round-trips through chat-visible commands, and `read` prompts with `?prompt` (zsh) not `-p prompt` (bash). Even better — for future loaders, go straight to Render Shell (loader bundled in API Docker image) so DATABASE_URL is auto-set inside Render's network and never leaves it.
  - **External Postgres path is fragile from a laptop.** Render's external connection rejected asyncpg even with explicit SSLContext (verify-none) and URL-component-parse-around. Don't burn cycles on the laptop path for future loaders. Bundle the loader into the API Docker image (see S112 Dockerfile + .dockerignore changes) and run from Render Shell. This is the pattern going forward.
  - **`.dockerignore` exclusion is binding on COPY.** First S112 deploy failed because `restoration-pipeline/` was blanket-excluded. Negate pattern: `restoration-pipeline/*` + `!restoration-pipeline/<specific-file>`. Pattern documented in the .dockerignore comments.
  - **Tier mapping is graduated reveal, not flat.** Initial S112 plan put both Basic and Deeper Dive at extras ($4.99). Yoshi corrected mid-session to Basic = study_notes ($1.99), Deeper Dive = extras ($4.99) so the Notes tier earns its keep on the chapter-reading surface. **Each paid tier must deliver a chapter-reading payoff over the tier below it, not just unlock different content categories.**
  - **Yoshi's "for a better experience download the app" copy** is locked verbatim for the future marketing/install-buttons wheel (see above).
  - **Per-row tier-gating returns locked rows, not filters them out.** Locked rows ship with body=null + locked=true so the PWA can render the upgrade affordance. Filtering locked rows would hide the offer from free partners — defeats the tier ladder's marketing function.
  - **"Stop at major steps" discipline held.** Loader done → stop. Loader applied → stop. API done → ask before continuing. PWA done → push for deploy. Each stop produced a real Yoshi-side decision (tier mapping correction was the most consequential — would have shipped wrong without the pause).

## Historical handoffs

S97-S109 handoffs exist on disk for historical record (if any) but are NOT read at session-open going forward. Read this file + voice skill + the matthew-N.md database-source for the chapter being worked. Older handoffs only consulted if a specific question arises. **Matthew sweep closed at S109; next sessions move to outside-Matthew audit list.**
