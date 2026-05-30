S171 — §30 V1 close-out + §17 V1.1 cross-ref share + apocrypha paragraph breaks + V1.1 /strongs/{N} route + Capacitor-blocker decisions

# Post-handoff Yoshi decisions (Capacitor sequencing)

Yoshi asked at S171 close: *what else is left before we can build the
Capacitor?* Three Capacitor-sequencing decisions locked in answer:

  1. **Settings → Reader preferences page blocks Capacitor.** S172
     opens against Settings as the wheel. The leading preference is
     the new sacred-name display mask (see Yoshi's V1-blocker call
     below); other Settings preferences (theme, font-size, interlinear
     default, TTS voice) are lifted from existing in-reader toggles
     into the canonical control surface.

  2. **Locked-thread Share flipped to viral.** Original S171
     implementation excluded Share from paywall-teaser threads
     (declined as spammy). Yoshi flipped to *Yes — let the paywall be
     viral.* Implementation now ships locked-thread Share with the
     export carrying the teaser + the "Unlock in [Name] tier" CTA;
     the paywall doubles as a discovery vector when a friend opens
     the share. Anchor permalink in the watermark URL line stays
     consistent across locked + unlocked.

  3. **`bible.remnantofpromise.org/strongs/*` routing — 302 redirect
     confirmed.** The Render Static Site 302-redirects to the API
     subdomain where the server-rendered HTML lives. Link-preview
     crawlers all follow 302s. URL bar swaps from bare-domain to
     `api.bible.remnantofpromise.org` after a click — Yoshi accepted
     the cosmetic loss as acceptable for V1.1.

# Sacred-name display mask — V1 Capacitor-blocker (S172 wheel)

Yoshi at S171 close moved the Sacred-Names display toggle from back-
burner (BIBLE_APP_ROADMAP.md line 350 Q15, surfaced S35) to **V1
Capacitor-blocker.** Original framing: *"if you believe in another
pronounciation of the sacred name than Yahuah, would you like to
see the places where the sacred name resides as YHWH instead."*

Full spec lives in `S172_SACRED_NAME_MASK_SPEC.md` (NEW). Four
load-bearing decisions locked at S171 close:

  - **Orthogonality**: the YHWH mask is INDEPENDENT of the
    parentheticals-hide toggle. Two binary preferences, four valid
    combinations (Yahuah+paren, Yahuah-only, YHWH+paren, YHWH-only).
    An earlier draft of this spec coupled them into a single
    three-state preference; Yoshi corrected: *"the question isnt
    weather lord gets replaced....the question is does the reader
    want to see Yahuah /lord or yhwh lord."* The first-launch modal
    asks ONLY about the sacred-name presentation; "(LORD)" stays
    in both options because the paren is a different setting.
  - **Render-time mask, NOT source mutation** per Yoshi's
    architectural instinct: *"is there not a way to just mask over
    the yahuah so you arent rewwriting source text...creating like
    a mask to replace yahuah with YHWH?"* — same pattern as the
    existing `applyParentheticalsToggle`. Database stays
    "Yahuah (LORD)" forever; mask runs on the way to the screen.
  - **Compounds**: the mask swaps inside compound names too.
    "Yahuah Tseva'ot" → "YHWH Tseva'ot", "Adonai Yahuah" →
    "Adonai YHWH".
  - **Yahusha**: NOT in scope this session. Yahuah/YHWH only.
    Parallel Yahusha toggle deferred to a future wheel gated on
    partner feedback.

First-launch modal: two equal-weight buttons ("Yahuah (LORD)" /
"YHWH (LORD)"), no pre-highlighted default — every partner sees
both options, nobody defaults through. Forces the conscious choice
that honors the YHWH-tradition partner.

First-launch flow + Settings surface layout + render-surface
inventory + verification steps + open S172-open questions all live
in the spec doc.

# What shipped this session

Three tracks landed clean. tsc -b clean across the project. New
S171 sanity suite at 29/29. S170 suite refactored for the new
discriminated-union `StudyShareMeta` and now at 54/54. Every prior
sanity suite still green (S123 18, S125 35, S127 21, S129 11, S140 6,
S157 55, S163 48, S166 34, S167 79, S168 53).

Carried from S170: §30 V1 closed at S170 close (Yoshi-confirmed at
session open — 7 walk-redlines resolved, two-phone X-share verified
live, 54/54 sanity, tsc clean). S171 opens the V1.1 growth layer
and the §17 cross-ref share extension.

## Track 1 — §17 cross-reference share extension

ChapterEndCard (`app/src/components/ChapterEndCard.tsx`) now carries
per-row Share buttons across both layers:

- **Layer 1 (baseline)** — each per-source-verse block gets a Share
  pill right of the "Verse N" heading. Tap exports the block (anchor
  verse + all curated targets) as a 1080×1920 PNG via the same §30
  shared painter.
- **Layer 2 (thread callouts)** — each thread `<article>` gets a
  Share pill in the header right slot, **including locked threads**
  per Yoshi's post-handoff decision. Unlocked threads export the
  full callout (title + anchor + summary_md prose + member rows);
  locked threads export the teaser + fade + "Unlock in [Name] tier"
  CTA. The paywall doubles as a discovery vector — a friend
  receiving the share sees the framework's reading + the upgrade
  path in one image.

### StudyShareMeta — discriminated union refactor

`app/src/lib/study-share-render.ts` refactored `StudyShareMeta` from a
flat strongs-only shape to a discriminated union:

```ts
type StudyShareMeta =
  | { kind: "strongs"; strongNumber; transliteration; source? }
  | { kind: "xref"; xrefKind: "baseline" | "thread";
      bookSlug; chapterNumber; verseNumber; subject }
```

`executeStudyShare`, `renderStudyShareCard`, `buildStudyShareFilename`,
and `prepareModalClone` all branch on `meta.kind`. The strongs path is
unchanged (still applies the lexicon-deeplink DOM swap); the xref path
skips the deeplink swap (no "Read full lexicon entry" button to
replace) and instead overrides the watermark's URL line per the
StudyShareMeta variant decision below.

### Filename pattern

- Strongs (unchanged): `{strong}-{slug}-rop-study.png`
- Xref baseline: `xref-{book-slug}-{chap}.{verse}-rop-study.png`
  (e.g., `xref-genesis-1.1-rop-study.png`)
- Xref thread: `thread-{thread-slug}-rop-study.png`
  (e.g., `thread-kingdom-gospel-rop-study.png`)

### StudyShareMeta variant decision — anchor-verse permalink as URL line

Per the session-open decision point. The decision lands on **anchor-
verse permalink as the watermark URL line override**, NOT skip the URL.
Reasoning: §30's growth-channel argument — "every share is a billboard
for the framework, a doorway back to the app for the receiving partner"
— applies equally to xref shares. Skipping the URL line weakens the
share's growth function; a doorway-less share is just a screenshot
with branding. The anchor-verse permalink doubles as discovery vector:
when a partner pastes the share into a messaging app, the recipient
sees a clickable URL that points back at the exact verse the cross-
reference cites.

URL pattern: `bible.remnantofpromise.org/{book-slug}/{chapter}.{verse}`
(e.g., `bible.remnantofpromise.org/genesis/1.1`). Reads like
"Genesis 1:1" when scanned by eye. Fits the 22pt Lora line at 1080px
with the 6% inset (longest book slug `1-thessalonians` + 3-digit
chapter/verse → ~32 chars, well inside the safe span). The route
itself is V1.1 territory alongside `/strongs/{N}` (Track 3); in V1
the URL is text-only on the share card and serves as paste-and-go
discovery — same pattern as §30 V1's text-only-deeplink stance for
`/strongs/{N}`.

### Shared painter — `urlOverride` knob

`paintWatermarkFooter` got a single new option:
`urlOverride?: string` — when present, substitutes the watermark's
default `bible.remnantofpromise.org` line 3 with the override string.
Word-study shares (§30) and verse-shares (§24) pass nothing and get
the default; xref shares (§17) pass the anchor-verse permalink.

The injection point is the watermark painter itself (single source
of truth, S170 shared-painter discipline). No new DOM placeholders,
no new transformation rules in `prepareModalClone`. The xref share's
discovery URL lives in the watermark slot exactly the way the strongs
share's does — they just point at different destinations.

## Track 2 — Apocrypha + pseudepigrapha paragraph-break extraction

`restoration-pipeline/_session171_extract_noncanon_paragraph_starts.py`
(NEW, ~240 lines) walks every parsed non-canon edition JSON and emits
paragraph-start markers using a conservative English-language
heuristic. Merged output lands in
`app/src/data/paragraph_starts.json` (top-level book-slug union with
the existing S110 canon entries).

### Heuristic (passage-marker rules)

Verse N starts a new paragraph if ANY of:

- **R1** N == 1 (chapter open — always).
- **R2** Verse text begins with a Hebraic narrative transition
  phrase: *And it came to pass*, *And it happened*, *Now in*,
  *Now after*, *Now when*, *In those days*, *In the [Nth] year*,
  *After these things*, *Thus saith*, *Thus says*, *And after*,
  *Wherefore*, *Howbeit*, *Behold, I*, *Behold, the*, *Concerning*,
  *Touching*, *But when*, plus a few others (full list in the
  script).
- **R3** Verse text begins with `"`, `'`, or typographic quote
  (new quoted speech turn).
- **R4** Verse text begins with a speaker turn (*Then [Name] said*,
  *Then [Name] spoke*, *Then answered [Name]*, etc.). Restricted to
  verse-start to avoid mid-text noise.
- **R5** Verse text begins with a vocative `O <Capitalized>`.

No upper cap on density; no lower floor. The heuristic is
intentionally conservative — when in doubt, no break. Worst-case
error mode is fewer-or-misplaced paragraph breaks, not wrong text.
Yoshi-eye revision per book is a future restoration-pipeline pass;
for V1 the heuristic is the right floor.

### Results

- **43 non-canon books**, **720 chapters**, **1,838 paragraph
  markers**.
- Density **2.55 paragraphs / chapter** vs the canon's 4.46. Lower
  but expected — non-canon corpus skews to wisdom literature and
  dense theology with fewer narrative transitions than the canon's
  narrative-heavy mix.
- Spot check 1 Enoch 1 → `[1, 3]` (verse 3 starts with "Concerning"
  — a real topic shift from Enoch's blessing to "Concerning the
  elect"). Sirach 1 → `[1]` (Sirach is a continuous wisdom acrostic;
  the heuristic correctly fires no inner breaks).
- Jubilees 1 → `[1, 5, 15, 23]`; Jasher 1 → `[1, 19, 21, 22, 26]`;
  1 Esdras 1 → `[1, 22, 25, 28, 40, 48]` — narrative chapters get
  appropriate density.

### No SQL apply — paragraph_starts is bundled client data

Per the S110 architectural choice, paragraph_starts lives as a
bundled JSON in `app/src/data/paragraph_starts.json` (not a DB
table). The renderer in App.tsx reads it directly. The S171 patch
merges new non-canon entries into the JSON; the next bundle picks
them up at deploy time. **No SQL migration needed.** Flagging the
naming convention drift here — the S171 session-open prompt said
"emit SQL apply" but the surface is JSON; the deliverable is the
merged JSON + the extractor script (audit trail for re-runs when the
parsed-JSON sources update).

## Track 3 — GET /strongs/{N} deep-link route + Open Graph metadata

`api/main.py` got a new HTML route + helpers:

- `GET /strongs/{N}` — server-rendered HTML page returning the
  Strong's entry content + full Open Graph metadata (og:type,
  og:url, og:title, og:description, og:image, og:image dimensions
  + twitter:card variants). Built so messaging-app link-preview
  crawlers (iMessage / WhatsApp / Slack / Telegram / Discord) render
  the preview card without executing JavaScript.
- `_strongs_html_page(entry)` — pure helper (Python-side; sanity
  covers the JS-port mirror). Builds the canonical URL, the OG
  title (`{lemma} ({transliteration}) — Strong's {N}` style), the
  OG description (gloss fallback to first 200 chars of definition),
  and the page body. All content fields HTML-escaped against `< >`
  injection; the route's only user-controlled input is the
  strong_number path param, which is validated upstream by
  `_normalize_strong_number`.
- `_normalize_strong_number(raw)` — extracted from the existing JSON
  route's inline normalization so both the JSON and HTML routes share
  the same canonical-form pipeline (`H#` / `G#` prefix + 4-digit
  zero-pad, e.g., `h1` → `H0001`).
- 404 case returns a minimal HTML page with OG title/description so
  crawlers still get clean previews (no raw JSON / stack trace
  surfacing in a partner's messaging app).
- `Cache-Control: public, max-age=3600` — Strong's entries are
  effectively immutable; one-hour edge TTL is cheap insurance
  against a hot-cached crawler hammering the DB.

### Hosting routing — bare-domain → API subdomain via 302 redirect

Spec'd public URL is `bible.remnantofpromise.org/strongs/{N}` (the
watermark CTA) but the server-rendered HTML + OG meta lives on the
FastAPI service at `api.bible.remnantofpromise.org/strongs/{N}`.
Render Static Sites can't rewrite cross-origin, so `hosting/render.yaml`
got a 302 redirect rule:

```yaml
routes:
  - type: redirect
    source: /strongs/*
    destination: https://api.bible.remnantofpromise.org/strongs/:splat
  - type: rewrite
    source: /*
    destination: /index.html
```

Order matters — the `/strongs/*` redirect MUST come before the SPA-
fallback rewrite so it wins the route-match. Link-preview crawlers
all follow 302 redirects when resolving og:* meta, so the partner-
visible behavior is "URL pasted → link preview renders the OG card."

### OG image — brand-mark fallback for V1.1; per-entry generator V1.2+

The og:image currently points at the v4 brand-mark asset on the PWA
static path (`/brand-mark-share.png`). A future V1.2+ server-side
share-card generator would expose `/strongs/{N}/og-image.png`
rendering the canonical 1080×1920 card for that specific entry. The
swap is a single string in `_strongs_html_page` when that endpoint
lands; the OG dimensions (1080×1920) are already declared, so the
crawler treats the asset as a portrait card regardless.

## Shared discipline carries (S170 → S171)

- **Shared painter discipline (S170 lock)** — the new `urlOverride`
  knob lives in `paintWatermarkFooter`, the single source of truth
  for §24 + §30 + §17 watermark composition. No per-surface
  divergence; xref shares get their discovery URL the same way
  strongs shares get the brand URL.
- **Spec-then-build** — Track 1 (xref share) landed against the §30
  spec's explicit V1.1 stretch goal (*§17 Chapter-end cross-reference
  card export — share a single cross-reference as an export*).
  Track 3 landed against the §30 spec's explicit V1.1 web-side add
  (*GET /strongs/{strong_number} — standalone page rendering the
  StrongsLookup content + Open Graph metadata*). No drift between
  spec and code at session close.

# Verification

## tsc -b
Exit 0 across the project. No type errors introduced by the
discriminated-union refactor, the xref share button wiring, the
`urlOverride` knob, or the FastAPI HTML route.

## Sanity suites — all green

- `_s123_range_selection_sanity.mjs` → 18 passed
- `_s125_search_sanity.mjs`           → 35 passed
- `_s127_share_card_sanity.mjs`       → 21 passed (unchanged — the
                                        S171 watermark `urlOverride`
                                        knob is additive)
- `_s129_additive_body_sanity.mjs`    → 11 passed
- `_s140_search_teaser_sanity.mjs`    →  6 passed
- `_s157_tts_sanity.mjs`              → 55 passed
- `_s163_lexicon_sanity.mjs`          → 48 passed
- `_s166_bookmarks_index_sanity.mjs`  → 34 passed
- `_s167_interlinear_sanity.mjs`      → 79 passed
- `_s168_interlinear_layer_sanity.mjs`→ 53 passed
- `_s170_study_share_sanity.mjs`      → **54 passed** (updated for the
                                        discriminated-union meta —
                                        `buildStudyShareFilename`
                                        now takes a meta object; old
                                        cases ported to
                                        `{kind:"strongs", ...}`)
- **`_s171_xref_share_sanity.mjs`**   → **29 passed (NEW)**

S171 suite covers: `buildStudyShareFilename` xref variants (4 cases
across baseline + thread + diacritic-strip), `buildAnchorPermalink`
(3 cases — genesis/1-thessalonians/revelation), paragraph-start
heuristic (15 cases — verse-1, every transition phrase, quote/
vocative/speaker turn openers, and 3 negative cases), Strong's HTML
page OG meta (7 cases — canonical URL on PWA host not API host, OG
title/description assembly, HTML escape against `<script>` injection).

## Live walk
**Deferred pending Yoshi's call** (see Yoshi-questions 1 + 3 below).
Two-phone X-share live verification across §17 baseline + thread
shares would close Track 1's ship gate. Track 3's deep-link route
needs a deploy + Render route activation before a real link-preview
crawler test fires (paste a `bible.remnantofpromise.org/strongs/G3056`
URL into iMessage from one phone, confirm the link-preview card
renders OG meta on the receiving phone).

## Optional Chrome MCP smoke test
Available pre-deploy if you want to validate the React-side wiring:
- Tap any verse → scroll to ChapterEndCard
- Confirm Share button visible right of "Verse N" heading on
  baseline blocks
- Confirm Share button visible right of unlocked thread titles
- Click Share on a baseline block → confirm executeStudyShare runs
  without throwing, inspect downloaded PNG dimensions + filename
  pattern (`xref-{book}-{chap}.{verse}-rop-study.png`)
- Click Share on a thread → same flow with `thread-{slug}-rop-study.png`
- Inspect any downloaded PNG's footer band — watermark URL line 3
  should read the anchor-verse permalink instead of the brand domain.

# Push verification (S166 standard)

**edited-not-committed:**
- `app/src/lib/study-share-render.ts` — discriminated-union refactor;
  new `XrefShareMeta` + `StrongsShareMeta` exports; `buildStudyShareFilename`
  takes a meta object; `buildAnchorPermalink` helper; `prepareModalClone`
  branches on `meta.kind`; `renderStudyShareCard` passes `urlOverride`
  to the watermark painter for xref shares; `executeStudyShare`
  filename build simplified to a single-arg meta call.
- `app/src/lib/watermark-footer-render.ts` — `PaintWatermarkOpts.urlOverride`
  added; line 3 paint reads `opts.urlOverride ?? WORDMARK_URL_DEFAULT`.
  `WORDMARK_URL_DEFAULT` exported.
- `app/src/components/StrongsLookup.tsx` — `executeStudyShare` call
  updated to pass `kind: "strongs"`.
- `app/src/components/LexiconSheet.tsx` — same.
- `app/src/components/ChapterEndCard.tsx` — `XrefShareButton` shared
  chrome component; per-source-verse `BaselineEntryBlock` extracted
  with own ref + share state; `ThreadCallout` got article ref + share
  handler + Share pill in header; `LockedThreadCallout` got the same
  treatment (post-handoff: paywall-as-viral-surface).
- `S172_SACRED_NAME_MASK_SPEC.md` — NEW (full spec for the S172
  Settings wheel + sacred-name display mask).
- `app/src/data/paragraph_starts.json` — non-canon delta merged in
  (43 new book slugs).
- `api/main.py` — `HTMLResponse` import; `_normalize_strong_number`
  helper extracted; `_strongs_html_page` builder; new
  `GET /strongs/{strong_number}` HTML route with OG metadata.
- `hosting/render.yaml` — `/strongs/*` 302 redirect rule before the
  SPA fallback.
- `restoration-pipeline/_session171_extract_noncanon_paragraph_starts.py` — NEW
- `source-texts/parsed/paragraph_starts_noncanon.json` — NEW (audit
  trail; the merged client JSON is the canonical bundle).
- `_s170_study_share_sanity.mjs` — `buildStudyShareFilename` cases
  ported to the meta-object signature (still 54 passed).
- `_s171_xref_share_sanity.mjs` — NEW (29 cases, all pass).
- `S171_CHECKPOINT.md` — NEW (this file).

**committed-not-pushed:** none.

**pushed (Yoshi's terminal during the session):** none.

**Suggested Yoshi commit + push to unblock the next walk:**

Track 1 (§17 xref share) + Track 2 (apocrypha paragraph breaks) are
additive and ship cleanly without backend changes. Track 3
(`/strongs/{N}` route) requires both the API deploy AND the
`hosting/render.yaml` route activation. Recommend two commits — the
first ships the PWA-side work for immediate verification, the second
ships the deep-link route as a paired API + render.yaml change.

```bash
cd ~/Desktop/App

# Commit 1 — Track 1 + Track 2 (PWA + restoration-pipeline)
git add app/src/lib/study-share-render.ts \
        app/src/lib/watermark-footer-render.ts \
        app/src/components/StrongsLookup.tsx \
        app/src/components/LexiconSheet.tsx \
        app/src/components/ChapterEndCard.tsx \
        app/src/data/paragraph_starts.json \
        restoration-pipeline/_session171_extract_noncanon_paragraph_starts.py \
        source-texts/parsed/paragraph_starts_noncanon.json \
        _s170_study_share_sanity.mjs \
        _s171_xref_share_sanity.mjs
git commit -m "S171 — §17 xref share + apocrypha/pseudepigrapha paragraph starts"

# Commit 2 — Track 3 (API + hosting)
git add api/main.py hosting/render.yaml
git commit -m "S171 — §30 V1.1 /strongs/{N} server-rendered route + Render redirect"

# Then the checkpoint itself
git add S171_CHECKPOINT.md
git commit -m "S171 checkpoint"

git push
```

Then: Render auto-deploy → hard-refresh + SW cache clear on both
phones (per S166 standing rule) → live walk per the §17 xref share
phone-walk steps. The Track 3 deploy needs an additional verification
step — paste a `bible.remnantofpromise.org/strongs/G3056` URL into
iMessage from one phone and confirm the link-preview card renders
on the receiving phone's iMessage thread.

# Open Yoshi-questions carried forward to S172

1. **§17 cross-reference share live-walk outcome.** Did the per-row
   Share buttons in the ChapterEndCard ship clean? Specifically:
   (a) is the Share pill placement right of the "Verse N" heading
   correct visual register, or do you want it elsewhere (e.g., a
   single Share at the section level instead of per-row); (b) does
   the xref-share PNG render the anchor-verse permalink legibly in
   the watermark line 3 at messaging-app thumbnail compression;
   (c) is the per-row click target the right granularity, or do you
   want broader (one Share per Layer 1) or narrower (one Share per
   individual target ref) granularity?

2. **Locked-thread Share policy.** Current behavior: locked
   threads (paywall-teaser state) get NO Share button — share-the-
   paywall would be the wrong product behavior. Alternative: locked
   threads COULD get a Share button that exports the teaser + the
   "Unlock in [Name] tier" CTA, turning the paywall itself into a
   viral surface. Decline-recommended (sharing the paywall reads as
   spammy) but flagging for your call.

3. **`bible.remnantofpromise.org/strongs/*` hosting routing.**
   Current implementation: Render Static Site 302-redirects to
   `api.bible.remnantofpromise.org/strongs/{N}` where the
   server-rendered HTML lives. 302 follows are universal among
   link-preview crawlers, so this should work — but the URL in
   the partner's browser bar after a click changes from the bare
   domain to the api subdomain. Alternative: deploy a thin Cloudflare
   Worker / Render Web Service that proxies `/strongs/*` to keep
   the bare domain in the URL bar. Decline-recommended for V1.1
   (redirect is simpler, partner-visible URL change is a minor
   cosmetic loss); flag for your call if the URL bar swap matters.

4. **OG image — per-entry vs brand-mark fallback.** Current `og:image`
   on every `/strongs/{N}` page is the v4 brand-mark static asset.
   Future V1.2+ work: server-side share-card generator at
   `/strongs/{N}/og-image.png` rendering the canonical 1080×1920
   card for that specific entry. Gated on V1.1 partner feedback —
   if the link-preview brand-mark image reads adequately as the
   doorway, no need to build the per-entry generator. Reopen if
   partner feedback flags "I want to see the actual content in the
   preview, not just the brand."

5. **Apocrypha paragraph-start heuristic Yoshi-eye revision.** The
   S171 heuristic is conservative-correct (when in doubt, no
   break). Some chapters will read with fewer-or-misplaced paragraph
   breaks than ideal. A future restoration-pipeline pass would walk
   each non-canon book by hand to revise the paragraph_starts entries
   against Yoshi's reading sense. Defer until partner feedback
   flags the heuristic noise as a usability complaint (gate: ≥1/
   week non-canon paragraph-rendering reports). Until then, the
   heuristic is the right floor — better than one-long-paragraph-
   per-chapter, honest about its conservatism.

6. **Settings → Reader preferences page** (Q1 carry from S168) —
   still deferred. Modest scope; can land as a parallel S172 track
   if no other §17 / §30 V1.1 redlines surface.

7. **NT morph residual fuzzy-join** — defer recommendation stands
   per S170_NT_MORPH_RESIDUAL_SPEC.md. Reopen at first ≥1/week
   morph-data-missing partner complaint.

8. **§28 InterlinearLayer column-stack as standalone card share** —
   V1.1 stretch goal per §30 surfaces-NOT-getting-Share. Reopen if
   partner feedback flags demand.

9. **9 long-tail S161 Group B singletons** — standing residual
   carried.

10. **Yahuah → Adonai vocatives addressing Yahusha** —
    restoration-pipeline pass, standing.

# Standing residuals (carried)

- 9 long-tail S161 Group B singletons (malachi 4:4, matthew 5:33,
  mark 10:15, philippians 2:2, john 21:7, romans 1:13, ephesians
  2:5, hebrews 11:37, revelation 1:10) — restoration-pipeline work.
- Yahuah → Adonai vocatives addressing Yahusha — restoration-pipeline.
- v1.1+ candidates: apocrypha book-slug map, Gesenius source
  investigation, Thayer's 1889 clean dump, system-wide Library →
  Companion lockedTier Literal rename.
- §28 InterlinearLayer column-stack share — V1.1 stretch.
- V1.2+: per-entry server-side OG image generator for
  `/strongs/{N}/og-image.png`.

# Standing efficiency rules (carried)

- Voice-gate batch pattern for authored content
- Local files first before web-fetch
- Self-sufficient application of skill + source
- Sandbox-git limitation — commits + Render dashboard changes run
  from Yoshi's terminal
- Spec-then-build
- Verbal-answers-transcribe to the file before close
- Render artifacts persist
- Publish-then-edit
- S166 — Service-worker hard-refresh verification at every PWA deploy
- S166 — Push verification at every session close (named: pushed /
  committed-not-pushed / edited-not-committed)
- S169 — Chrome MCP for live-walk verification
- S170 — Shared painter discipline (extended at S171 by the
  `urlOverride` knob — the URL line lives in the single watermark
  painter, branched per-share-kind from the caller, never duplicated
  per-surface)
- **S171 — Discriminated-union meta discipline.** When a shared render
  pipeline grows a second consumer with different metadata needs
  (here: strongs vs xref), refactor the shared meta type to a
  discriminated union with `kind` discriminator. The pipeline branches
  on `kind` at each transformation point; each variant carries only
  its own fields; type system enforces the contract. Apply forward
  to any cross-surface share that adds a third consumer (e.g., §28
  column-stack share when that wheel opens — would add a third
  variant `{ kind: "interlinear-column"; ... }`).

# What S172 opens against

S172 is the **Settings + sacred-name mask wheel** — the V1 Capacitor-
blocker. Open against:

1. **Sacred-name display mask** — full implementation per
   `S172_SACRED_NAME_MASK_SPEC.md`. New `applySacredNameDisplay`
   pure helper, migration from `rop_hide_parentheticals_v1`,
   render-surface sweep across the inventory list in the spec.
2. **Settings → Reader preferences page** at `/settings` — new
   route; sacred-name display + theme + font-size + interlinear-
   default + TTS voice as the V1 preferences set.
3. **First-launch modal** — fires before reader mount on a fresh
   install OR when the migrated `rop_hide_parentheticals_v1` key
   is absent. Three-state pick; no skip; "you can change this in
   Settings" soft-reassurance.
4. **Server-side persistence** of the display preference (JSONB
   `subscriptions.display_prefs` extension OR new
   `partner_preferences` table — decision at S172 open).
5. **Phone-walk redlines from Yoshi + wife on §17 xref share** (S171
   Track 1 live verification).
6. **Track 3 deep-link route deploy verification** — paste a
   `bible.remnantofpromise.org/strongs/G3056` URL into iMessage
   from one phone, confirm link-preview card renders on the
   receiving phone.

Capacitor wrap opens AFTER S172 closes (settings + mask live, V1
surface complete). Tentatively S173 — `capacitor.config.ts`,
iOS/Android shells, native share plugin, deep-link URL scheme,
TestFlight/Play Console, app icons + splash screens.
