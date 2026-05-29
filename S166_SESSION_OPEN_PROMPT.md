S166 — Phase 9.3 post-close monitoring + Phase 9.2 (Hebrew-Greek interlinear) opens

# S165 close summary — Phase 9.3 LIVE on production

Phase 9.3 (Hebrew & Greek depth lexicons + framework-callout band) is **closed**.
The trajectory from S158 (spec) → S159–S160 (parse + sample renders) → S161
(callout drafting) → S162 (voice-gate + REDRAFTs + schema/callout migrations)
→ S163 (loader + API endpoint + PWA LexiconSheet + helpers + sanity tests)
→ S164 (menu-direct path) → S165 (apply sequence + FK fix + walk + modal
sizing) lands here.

## S165 deliverables — what shipped beyond S164 close

| Deliverable | Location | Status |
|---|---|---|
| Production sample-render for pre-walk visual check | `restoration-pipeline/_session165_production_sample_render.py` + `outputs/Phase_9.3_Production_Sample_Render_S165.html` | LANDED — 15 entries, 12/12 framework callouts |
| Schema migration applied to prod | `data-schema/migrations/session162_lexicon_tables.sql` | APPLIED |
| Lexicon entries bulk load applied to prod | `data-schema/migrations/session163_lexicon_entries_load.sql` | APPLIED — 14,196 rows (8,673 BDB + 5,523 LSJ) |
| Framework callouts applied to prod | `data-schema/migrations/session162_lexicon_callouts_v1.sql` | APPLIED — 34 rows (16 H + 18 G) |
| FK-target filter patch (caught at apply) | `restoration-pipeline/_session163_load_lexicon_entries.py` | LANDED — `load_strong_entries_set()` + filter step drops 5,323 extended-Tyndale entries that have no FK home in strong_entries |
| `LEXICON_ENABLED=true` in Render dashboard | API service env vars | FLIPPED |
| PWA push to Static Site | git → Render auto-deploy | DEPLOYED |
| Live walk verification | bible.remnantofpromise.org | PASSED — G2424 *Iēsous* renders with disclaimer + Abbott-Smith body; G3551 *nomos* renders with framework callout band exactly as redrafted at S162 |
| Modal family width bump | 9 components: LexiconSheet, StrongsLookup, VerseActionMenu, HighlightPicker, BookmarkSheet, RangeActionPicker, AudioPlayer, NotesPanel, SearchModal | LANDED — `max-w-md` → `max-w-2xl` → `max-w-4xl` (896px) per Yoshi's "push it further" call |

## Phase 9.3 final coverage numbers

- **lexicon_entries**: 14,196 rows
  - BDB Hebrew/Aramaic: 8,673 (every Hebrew Strong's number with a BDB
    treatment + Aramaic block)
  - LSJ Greek + Abbott-Smith NT fallback: 5,523 (full G0001–G5624 range
    that strong_entries carries)
  - Filtered: 5,323 extended-Tyndale entries (G5625–G9996) deferred to v1.1+
    if the strong_entries set ever extends
- **lexicon_callouts**: 34 rows (16 Hebrew + 18 Greek, 0 Red Line violations,
  voice-gate clean at S162)
- **Citation link-integrity**: 92.2% resolved → tap-navigate; 7.8% downgraded
  to `<span class="lexicon-unresolved-cite">` (dominated by apocrypha
  abbreviations the canon.json scope doesn't carry)

## Live-walk verifications recorded

- ✅ Strong's modal → "Read full lexicon entry (LSJ)" link → LexiconSheet
  stacks with disclaimer + Abbott-Smith body for G2424 *Iēsous*
- ✅ Strong's modal → LexiconSheet for G3551 *nomos* renders the framework
  callout band with the redrafted body: lexicons gloss / LXX translates
  *torah* / Reformation *grace-not-law* sentence dismantled / new-heart
  *torah* of Jeremiah 31:33 in stand-alone italics
- ✅ Modal sizing: `max-w-4xl` (896px) gives the callout prose room to
  breathe on desktop; mobile unaffected (w-full caps to viewport)

## Open residuals at S166 open

### Yoshi-side push (the modal-width bump)

The `max-w-4xl` bump is on disk and tsc-clean but not yet pushed. Stage to
commit + push from your terminal:

```bash
cd ~/Desktop/App
git add app/src/components/LexiconSheet.tsx \
        app/src/components/StrongsLookup.tsx \
        app/src/components/VerseActionMenu.tsx \
        app/src/components/HighlightPicker.tsx \
        app/src/components/BookmarkSheet.tsx \
        app/src/components/RangeActionPicker.tsx \
        app/src/components/AudioPlayer.tsx \
        app/src/components/NotesPanel.tsx \
        app/src/components/SearchModal.tsx \
        S166_SESSION_OPEN_PROMPT.md
git commit -m "Bump modal family from max-w-2xl to max-w-4xl (896px desktop)"
git push
```

Render Static Site auto-rebuilds. Re-tap any word post-deploy and the modal
should feel substantially less cramped.

### Optional spot-checks (do during continued use, not gating)

- **Long-press menu-direct path** (S164 wire): long-press a Hebrew word →
  menu shows BDB in Word study → tap opens LexiconSheet directly (skipping
  Strong's). Same for Greek (LSJ).
- **Below-Companion tier surface**: incognito or free-tier login → tap a
  word → Strong's opens (free-tier) → "Read full lexicon entry" link
  routes to the tier-locked card with "Unlock with Companion" CTA inside
  LexiconSheet. Long-press menu shows BDB/LSJ with Library badge routing
  to /pricing.
- **Remaining framework callouts** (10 not yet verified individually on
  prod): chesed H2617, qadosh H6918, ruach H7307, emunah H0530, shabat
  H7676, kohen H3548, tsedek H6664, charis G5485, pistis G4102, hagios
  G0040. Already verified at S162 voice-gate; the production sample
  render at `outputs/Phase_9.3_Production_Sample_Render_S165.html` shows
  all 12 rendered. Spot-check any one of them during normal reading.

### Known residuals carried from S163/S164 (no change)

- 9 long-tail singleton verses from S161 Group B (malachi 4:4, matthew
  5:33, mark 10:15, philippians 2:2, john 21:7, romans 1:13, ephesians
  2:5, hebrews 11:37, revelation 1:10).
- Yahuah → Adonai for vocatives addressing Yahusha (restoration pipeline
  pass; not lexicon work).
- v1.1+ wheel candidates: apocrypha book-slug map extension (Sir, Wis,
  Tob, Bar, 1Mac–4Mac, Jdt, EpJer, Sus, 2Esd) once those land in verses;
  Gesenius source investigation; Thayer's 1889 alternate Greek lexicon
  if a clean Strong's-aligned dump surfaces; system-wide `Library` →
  `Companion` tier-label rename in `MenuItem.lockedTier` Literal (S164
  scoped this to BDB/LSJ items only via inline check).

# Phase 9.2 — Hebrew/Greek interlinear (opens at S166)

The Phase 9.2 trajectory was deferred at S158 to land Phase 9.3 first; with
Phase 9.3 closed, 9.2 becomes the next major spec-then-build wheel.

## What Phase 9.2 names

The interlinear surface — every word of every verse showing the
original-script lemma + transliteration + parsing + gloss in a vertically
aligned column above (or below) the English translation. The partner
toggles into interlinear mode and reads the verse word-by-word with the
underlying Hebrew or Greek visible. Sits alongside the §20 Strong's tap
surface and the §26 LexiconSheet drill-deeper layer.

## What's already in the data layer (V1 advantage over a from-scratch build)

- **`verse_words` table** — already loaded at S120 with every word of every
  verse aligned to its Strong's number. Drives the §20 tap-on-word surface
  currently.
- **`strong_entries`** — lemma + transliteration + short_definition + pos
  for every Strong's number (the §20 Strong's modal renders from this).
- **`lexicon_entries`** (now loaded at S163) — full depth-lexicon body per
  Strong's number. The interlinear's "deeper read" hook lands here.

The data side is largely in place. Phase 9.2 is primarily a **rendering
+ UX wheel** — vertical alignment column above the verse, toggleable, with
font-stack management (SBL Hebrew RTL above LTR English; SBL Greek above
English), and a tier-gate decision (likely Companion+ to match the
DESIGN_LANGUAGE.md §III Launch Scope Lock).

## What S166 should land if Phase 9.2 opens at S166

1. **DESIGN_LANGUAGE.md §28 spec** — interlinear display surface, locked
   gates + defaults + chrome + tier + helper-API + sanity-test surface.
   Same spec-then-build pattern as §26. Pair with a parse plan if data
   restructuring is needed (likely minimal since `verse_words` is loaded).
2. **Yoshi voice-gate** — the interlinear is partner-facing and load-bearing;
   what RTL/LTR layout does to the reader's perceived register matters.
   The voice skill governs.
3. **Scope decision** — free tier vs Companion vs Everything? §III gives
   guidance but the call is yours per the locked-S-#### pattern.

## Open Yoshi-questions at S166 open

1. **Phase 9.2 priority** — open the interlinear spec at S166, or pivot to
   something else (book authoring, statement-of-faith work, restoration-
   pipeline refinements, etc.)?
2. **Modal-width sufficiency** — once you've seen `max-w-4xl` deployed and
   used the surface a bit, does it land right or does it want another
   bump to `max-w-5xl` (1024px) / `max-w-6xl` (1152px) / `max-w-7xl`
   (1280px)? Easy 1-line follow-up sweep.
3. **Apocrypha slug-map extension** — defer to v1.1+ as planned, or pull
   forward as an S166 cleanup (would lift the 92.2% cite-resolution to
   ~98%+ across the LSJ body)?

# Standing efficiency rules (carried — no change)

- **Voice-gate batch pattern** for any authored-content batch
- **Parallel-subagent pattern** for fresh-context drafting with framework-
  deep references mounted
- **Local files first** before web-fetch
- **Self-sufficient application of skill + source** — implementation choices
  that don't materially affect partner-perceived surface land without
  per-line approval (S163 case: biblical-cite detector tightening 72.5%→
  92.2%; S165 case: FK-target filter caught on the first apply)
- **Sandbox-git limitation** — code lands in the sandbox; commits + applies
  + Render dashboard changes run from Yoshi's terminal
- **Spec-then-build** — architecture refinements land in the spec docs
  before the corresponding code
- **Verbal-answers-transcribe** — settled decisions get written into the
  next session's open prompt before close
- **Render artifacts persist** — outputs/ and data-schema/migrations/ files
  commit via the .gitignore exception
- **Render Postgres IP allowlist** — add IP when network changes
- **Publish-then-edit** — ship V1 when the foundation is right, find errors
  in subsequent passes, fix and republish. Phase 9.3 lived this rule at S165
  with the FK filter caught + patched mid-apply.

# S165 status

**Phase 9.3 LIVE on production.** The full lexicon stack — BDB Hebrew/Aramaic
body, LSJ Greek + Abbott-Smith NT fallback body, framework-callout band for
the 34 V1 terms — renders against bible.remnantofpromise.org behind the
Companion-tier gate. Both on-ramps work (quick-tap via StrongsLookup link
verified; long-press menu-direct path landed at S164 and ready to verify
during continued use). Modal sizing addressed per Yoshi's partner-perceptible
feedback. Code-side work is **done**; remaining is the modal-bump git push +
optional spot-checks during continued use.

S166 opens against this state. Realistic estimate: S166 spec-and-builds
Phase 9.2 (interlinear) if that's the priority, or pivots to whatever's next
on the trajectory.
