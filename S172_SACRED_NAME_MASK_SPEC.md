S172 — Sacred-Name Display Mask + Settings → Reader Preferences (V1 Capacitor-blocker spec)

# What this spec covers

S171 close-out surfaced two Capacitor-blocker items:

  1. **Settings → Reader preferences page** — confirmed at S171 close as
     a V1-blocker for the Capacitor wrap (per Yoshi's *Block Capacitor —
     land Settings first* answer). The Settings surface is the wheel
     S172 opens against.

  2. **Sacred-name display mask (Yahuah / YHWH) — V1 first-launch
     question + Settings toggle.** Originally tagged in BIBLE_APP_ROADMAP.md
     line 350 as Q15 *Manna-style sacred-names display toggle — back-
     burner*; Yoshi at S171 close moved it from back-burner to V1-
     blocker for the Capacitor wrap. *"if you believe in another
     pronounciation of the sacred name than Yahuah, would you like to
     see the places where the sacred name resides as YHWH instead."*

The mask sits inside Settings as the leading preference. This doc
specs the mask architecture, the first-launch flow, the Settings
surface layout, and the render-surface coverage list. The other
Settings preferences (font-size, theme, parentheticals already-exists,
interlinear-default, TTS voice) get a thinner spec further down — the
mask is the new wheel.

# Sacred-name display mask — architecture

## The framing (Yoshi's S171 close decision)

The voice skill is firm: **Yahuah is the correct pronunciation per
Josephus *Wars* 5.5.7's four-vowel shape.** Every restored-names
ingest pipeline writes "Yahuah (LORD)" to the database; the voice
skill governs every authored surface. Nothing about this changes.

The mask is a **display-layer concession** to brothers and sisters
from other pronunciation traditions (Yahweh, Jehovah, YHVH, etc.)
who would otherwise bounce off the app's apparent pronunciation
stance. Instead of per-name toggles (the Manna competitor's approach
— which would also surface "Yahweh" and "Jehovah" as legitimate
options), the toggle is a single binary:

  - **OFF (default)** — render the restored "Yahuah" with its
    English-form parenthetical "(LORD)" / "(Lord)" intact. This is
    the framework-distinctive read; first-time Christian readers
    arrive here and learn the restored name with the retention
    parenthetical.

  - **ON** — render the Tetragrammaton "YHWH" (Hebrew consonants
    only) with the parenthetical dropped. This is neutral on
    pronunciation tradition — the partner who reads "YHWH" can
    silently apply Yahuah, Yahweh, Jehovah, or any tradition they
    hold. The framework doesn't take their tradition away from them
    while keeping its conviction intact in the source data.

## Two independent preferences (S171 close-out correction)

**The YHWH mask and the parens-hide toggle are ORTHOGONAL.** An
earlier draft of this spec coupled them into a single three-state
preference; Yoshi corrected at S171 close: *"the question isnt
weather lord gets replaced....the question is does the reader want
to see Yahuah /lord or yhwh lord."*

Resolution: the existing S144 parentheticals-hide toggle stays
exactly as it is — independent control over "(LORD)" /
"(LORD God)" / "(the LORD of hosts)" etc. The NEW sacred-name
mask is a separate binary preference governing ONLY how the
sacred name itself renders.

Four valid render combinations across the two preferences:

| Mask     | Parens hidden? | Renders                  |
| -------- | -------------- | ------------------------ |
| Yahuah   | off (default)  | `Yahuah (LORD)`          |
| Yahuah   | on             | `Yahuah`                 |
| YHWH     | off            | `YHWH (LORD)`            |
| YHWH     | on             | `YHWH`                   |

The paren preservation in YHWH+paren-on mode is deliberate per
Yoshi's correction: the YHWH-tradition partner who hasn't also
opted out of the parens still gets the source-echo "(LORD)" because
that's a different preference governing a different thing. Two
toggles, four combinations, no coupling.

Internal storage:

```ts
type SacredNameMask = "yahuah" | "yhwh";
```

New storage key: `rop_sacred_name_mask_v1`, value `"yahuah"` or
`"yhwh"`. Default: `"yahuah"`.

**No migration of `rop_hide_parentheticals_v1`** — that key stays
where it is, doing what it does, untouched. The new mask key is
purely additive.

## Render-time text mask — pure helper, no source mutation

Yoshi's S171 architectural instinct (verbatim): *"is there not a
way to just mask over the yahuah so you arent rewwriting source
text or changin parenthetical code, but creating like a mask to
replace yahuah with YHWH?"*

Answer: yes — same render-time-substitution pattern the existing
`applyParentheticalsToggle` uses. The database source text stays
"Yahuah (LORD)" forever; the visible text gets the mask on its way
to the screen. **No source mutation, no migration, no DB write.**

New helper: `app/src/lib/applySacredNameMask.ts`:

```ts
export type SacredNameMask = "yahuah" | "yhwh";

export function applySacredNameMask(
  text: string,
  mask: SacredNameMask
): string {
  if (mask === "yahuah") return text; // no transform
  return maskYahuahAsYHWH(text);
}
```

The mask runs as a SEPARATE pass from the existing
`applyParentheticalsToggle`. Render sites call both:

```ts
// inside a render site
const masked = applySacredNameMask(verse.text, mask);
const final  = applyParentheticalsToggle(masked, hideParens);
```

Order matters only in one degenerate case: a future paren-strip
entry that fires on the word "Yahuah" inside a parenthetical would
need the strip-list to also include "YHWH" if it's expected to fire
in YHWH mode. The current S144 STRIP_LIST entries are all English-
form (LORD, God, Lord, etc.) — none contain "Yahuah" — so the order
doesn't affect outcome today. Documenting for forward maintenance.

Compound names get the swap inside per Yoshi's S171 decision:
"Yahuah Tseva'ot" → "YHWH Tseva'ot", "Adonai Yahuah" → "Adonai
YHWH". `maskYahuahAsYHWH` is a regex substitution:

```ts
function maskYahuahAsYHWH(text: string): string {
  // Word-boundary anchor on both sides so "Yahuah" inside a longer
  // token (vanishingly rare, but defensive) doesn't get partially
  // matched. The mask catches the standalone restored name AND every
  // occurrence inside compound forms (Yahuah Tseva'ot, Adonai Yahuah,
  // Yahuah Yireh, Yahuah Shalom, Yahuah Tsidkenu, Yahuah Rapha,
  // Yahuah Nissi, Yahuah Shammah, Yahuah Mekaddishkem, etc.)
  // because each compound carries "Yahuah" as a word-bounded token.
  return text.replace(/\bYahuah\b/g, "YHWH");
}
```

**Scope intentionally EXCLUDES** (per S171 Yoshi-decision *No —
Yahuah/YHWH only this session*):

  - **Yahusha (the Son)** — voice-skill-locked spelling everywhere,
    no parallel YHShWH toggle this session. A future S172+
    follow-up can add Yahusha parallel if partner feedback flags
    demand.
  - **Restored titles** (Elohim, Adonai, Ruach HaKodesh) — these are
    titles, not the sacred name. Not in scope.
  - **Other restored proper nouns** (Yashar'el, Yahudah, Mosheh,
    etc.) — voice-skill-locked, no display swap.

## Surfaces touched by the mask

The mask runs at every text-render surface. Inventory (S172 wheel):

  - **Verse body text** (App.tsx reader render) — primary surface,
    where the mask is most visible.
  - **Chapter-end cross-reference card** — both Layer 1 target
    previews (italic snippets) and Layer 2 thread summary_md
    paragraphs + member-row previews + member_notes.
  - **Commentary surfaces** (short-form + long-form Deeper Dive) —
    every authored paragraph runs through the mask before render.
  - **Search results** — verse previews + teasers in the search hit
    list.
  - **Lexicon entries** (BDB / LSJ) — the framework-callout sections
    that reference the restored names (the lexicon body itself is
    primary-source public-domain text and doesn't carry restored
    names; the callouts do).
  - **StrongsLookup modal** — the "Other verses using this word"
    rail's verse text rows.
  - **Bookmark / note entries** — partner-private content. The mask
    applies to the BIBLE TEXT preview attached to a bookmark/note;
    the partner's own typed note text is NEVER masked (their text
    is their text).
  - **Highlight popovers + verse-action menus** — verse references
    show as "Genesis 1:1" (no restored-name content); no mask
    needed in chrome.
  - **Share-card render** (`share-card-render.ts` §24 + §30 +
    §17) — the mask runs on the verse text + lexicon entry text +
    cross-reference content BEFORE the canvas paint, so the
    exported PNG honors the partner's preference. Without this, a
    YHWH-mode partner would share a Yahuah-display card to their
    friend, which would be confusing and would erode the share
    chain's coherence.
  - **TTS audio (§25)** — out of scope this wheel. The §25
    substitution table is the audio pronunciation pipeline; the
    text-display mask doesn't drive audio. When a YHWH-mode
    partner taps Play, the audio still pronounces "Yahuah" per §25
    (the framework's audio is Yoshi-voice/substitution-table
    territory; the YHWH mask is text-display territory). Document
    the divergence in the §25 spec at S172 close.

The mask helper is called the same way `applyParentheticalsToggle`
is called today — one line per render site. The existing 8+ call
sites of `applyParentheticalsToggle` get replaced with
`applySacredNameDisplay(text, mode)` in a mechanical sweep.

# First-launch flow

## The question UI

First app open (no `rop_sacred_name_mask_v1` key in localStorage):

A welcome modal fires before the reader mounts. Two options — a
binary choice between how the sacred name renders. The
parenthetical "(LORD)" stays in BOTH preview labels because that's
controlled by the separate parens-hide toggle in Settings, not by
this question:

```
┌────────────────────────────────────────────────────────────┐
│           The Remnant of Promise Official Study Bible      │
│                                                            │
│     Before you begin reading, choose how you'd like the    │
│     sacred name to appear in scripture:                    │
│                                                            │
│  ┌──────────────────────────────────────────────────────┐  │
│  │  Yahuah (LORD)                                        │  │
│  │  The restored Hebrew name as Yoshi reads it,          │  │
│  │  pronounced per Josephus *Wars* 5.5.7.                │  │
│  └──────────────────────────────────────────────────────┘  │
│  ┌──────────────────────────────────────────────────────┐  │
│  │  YHWH (LORD)                                          │  │
│  │  The Hebrew consonants — no pronunciation taken.      │  │
│  │  Choose this if you hold a different pronunciation    │  │
│  │  tradition (Yahweh, Jehovah, or another).             │  │
│  └──────────────────────────────────────────────────────┘  │
│                                                            │
│  You can change this anytime in Settings.                  │
└────────────────────────────────────────────────────────────┘
```

Modal-card visual register: same `bg-[var(--reader-surface)]`
border-radius bordered-chrome family as HighlightPicker /
StrongsLookup per §20. Each option is a tap-target card with the
heading + descriptive sentence. **No skip button** — the partner
MUST pick before the reader opens (the choice frames every render
they see next). The "you can change this in Settings" line at the
bottom is the soft-reassurance that the choice isn't irreversible.

**Both buttons equal-weight, no default pre-highlighted** per
Yoshi's voice-skill posture — every partner sees both options,
nobody defaults through. Forces the conscious choice that honors
the YHWH-tradition partner who'd otherwise miss the option.

Per the voice-skill: **no apology** for the framework's reading
("we know some people prefer X..."), **no judgment** of the
YHWH-tradition partner ("if you don't believe..."). Two clean
options framed as reader choice, the framework's voice steps
aside, the partner picks.

## First-launch timing — Capacitor vs PWA

  - **Capacitor (iOS / Android wrap)** — the modal fires on first
    app open after install, before the reader mounts. localStorage
    persists across native app lifecycles, so subsequent opens read
    the stored preference and skip the modal.
  - **PWA (web)** — same flow, except "first launch" maps to "first
    visit where no localStorage key is present." A partner who
    clears site data sees the modal again (acceptable — same
    pattern as any first-time prompt). A partner switching browsers
    sees it once per browser (acceptable for V1; cross-device sync
    is V1.1+).
  - **Cross-device sync** — when a partner has signed in, the
    server-side preference (added at S172 backend pass — see
    *Persistence* below) overrides localStorage so the choice
    follows them across devices.

## Persistence

  - **localStorage** — primary. Key `rop_sacred_name_mask_v1`, value
    `"yahuah"` or `"yhwh"`. SSR-safe + private-window-safe per the
    existing `useParentheticalsToggle` failure-mode (falls back to
    in-memory if localStorage unavailable).
  - **Server-side** — secondary. Adds a `partner_preferences` row
    or extends `subscriptions` with a JSONB `display_prefs` column
    carrying `sacred_name_mask` + any future display preferences
    (theme, font-size, etc.). Synced on sign-in: server preference
    wins over localStorage if the two diverge.
  - **No migration of S144 `rop_hide_parentheticals_v1`** — the two
    preferences are orthogonal, no coupling, no mapping. Existing
    partners' parens-hide preference carries forward unchanged; the
    first-launch modal asks the NEW question about the sacred-name
    mask. Partners who have parens-hide ON will see the modal
    framed against their already-hidden state — the modal text
    shows "Yahuah (LORD)" and "YHWH (LORD)" with the paren because
    that frames the choice clearly, but after the partner picks
    their reader still renders parens-off if that's what they
    previously chose.

# Settings → Reader preferences page

## Surface architecture

New route: `/settings` (parallels `/pricing`, `/manage`,
`/sign-in`). Same pathname-based view switch in App.tsx that
handles the other top-level routes.

**Chrome entry — locked at S171 close (Yoshi-decision):** new
`⚙ Settings` bordered-chrome button slots into the existing top-
right chrome cluster between the Theme toggle and the account CTA.
Final cluster order:

  `[Listen][Search][Bookmarks][Notes][Theme][⚙ Settings][Account]`

Pattern rationale: partner-content tools (Listen / Search /
Bookmarks / Notes) sit left; display chrome (Theme / Settings)
grouped together in the middle; account state (Become a partner /
Manage / Resubscribe) anchors the right. Same `border border-
[var(--reader-rule)] bg-[var(--reader-surface)] px-2.5 py-1.5
text-sm font-medium` button family as the other chrome cluster
buttons per §1; ⚙ gear glyph + "Settings" label.

The in-reader Theme toggle STAYS in the chrome cluster (quick-
access affordance) even though Theme is also lifted into Settings
as a preference. Two-tap-vs-one-tap was the tradeoff and the in-
reader toggle is high-frequency enough that the duplication is
worth keeping. Settings is the canonical control; the chrome
toggle is the shortcut.

Layout: single-column reader-surface page, mirrors `/manage`
visual register. Each preference is a card with the heading + the
control + a short description of what the preference does. No tabs,
no sub-pages — every Settings preference fits on one scrollable
page at V1.

## Preferences list (S172 wheel scope)

**1. Sacred-name display** *(new this wheel; the leading
preference; the first-launch modal's question lives here as the
canonical control)* — binary segmented control:

  - Yahuah  *(default)*
  - YHWH

**2. English helper parentheticals** *(existing S144 toggle,
relocated from the in-reader chrome into Settings)* — Show / Hide
segmented control. Independent of the sacred-name mask above; the
two compose freely (four valid combinations per the architecture
section).

**3. Reader theme** *(existing, lifted from the in-reader toggle
into Settings)* — Dark / Light segmented control. The in-reader
theme toggle stays as a quick-access affordance; Settings is the
canonical control.

**4. Font size** *(existing, lifted from the in-reader toggle)* —
Small / Medium / Large segmented control. In-reader pinch-zoom
continues to work but localStorage persists the discrete tier.

**5. Interlinear default** *(new this wheel — currently off-by-
default per §27/§28 architecture)* — Off / On toggle. Sets the
default state of the §28 InterlinearLayer toggle on every new
chapter open.

**6. TTS voice** *(existing, lifted from the in-reader §25 voice
picker into Settings as the canonical control)* — Browser default
+ curated top 3-5 list with preview button (per §25).

The preferences live on ONE page. No deep navigation. A partner
who wants to change their sacred-name display does it in three
taps from anywhere in the app (chrome menu → Settings → segmented
control).

## What Settings is NOT this wheel

  - **Account management** (cancel, change email, change card) —
    stays in `/manage` per S39's existing surface; Settings doesn't
    duplicate.
  - **Notification preferences** — no notifications surface exists;
    out of scope.
  - **Data export / import** — V2 territory; out of scope.
  - **Per-name toggles** (Yahuah/Yahweh/Jehovah, Yahusha/Yeshua) —
    voice-skill-locked spellings stay unless flipped to YHWH mode.

# Verification

S172 sanity additions:

  - `applySacredNameMask` across both modes:
    - `"yahuah"` → identity (no transform)
    - `"yhwh"` → masks every word-bounded "Yahuah" → "YHWH"
  - `maskYahuahAsYHWH` boundary cases:
    - standalone `"Yahuah"` → `"YHWH"`
    - inside compound `"Yahuah Tseva'ot"` → `"YHWH Tseva'ot"`
    - inside compound `"Adonai Yahuah"` → `"Adonai YHWH"`
    - parenthetical preserved: `"Yahuah (LORD)"` → `"YHWH (LORD)"`
      (parens-hide is a separate toggle; mask alone leaves them)
    - not affected: `"Yahudah"`, `"Yahudim"`, `"Yahusha"` (word
      boundary anchor — the H is followed by another letter, not
      end-of-word)
    - case-sensitive: `"yahuah"` (lowercase) → not masked (the
      restoration pipeline always emits the title-case form;
      lowercase would be an authoring error)
  - Composition with `applyParentheticalsToggle` (the two pure
    helpers commute on the current STRIP_LIST):
    - mask off + parens off → `"Yahuah (LORD)"` → `"Yahuah"`
    - mask on + parens off  → `"Yahuah (LORD)"` → `"YHWH (LORD)"`
    - mask off + parens on  → `"Yahuah (LORD)"` → `"Yahuah"`
    - mask on + parens on   → `"Yahuah (LORD)"` → `"YHWH"`

S172 live-walk steps (two-phone):

  1. Fresh install on phone A — confirm first-launch modal fires
     before reader mounts with two equal-weight buttons.
  2. Pick "YHWH (LORD)" — confirm reader opens with verse body
     showing "YHWH (LORD)" instead of "Yahuah (LORD)" everywhere;
     confirm Settings reflects the choice.
  3. Open Settings → flip sacred-name mask to "Yahuah" → return to
     reader → confirm verse body now shows "Yahuah (LORD)"
     everywhere.
  4. Open Settings → flip parens-hide to "Hide" (independent of
     mask) → return to reader → confirm verse body shows just
     "Yahuah" (no paren). Flip mask back to YHWH → reader shows
     just "YHWH" (parens stay hidden — preferences orthogonal).
  5. Share any verse with the YHWH mode on → confirm exported PNG
     shows "YHWH (LORD)" or "YHWH" depending on the partner's parens
     toggle, NOT "Yahuah" (mask applied at canvas paint).
  6. Sign in → confirm preference persists across browser/device
     (server-side wins).
  7. Test orthogonality with existing parens-hide user: install
     fresh, set `rop_hide_parentheticals_v1` to `"true"` in
     DevTools, reload, confirm first-launch modal still fires for
     the NEW preference (the parens-hide preference is unrelated
     and carries forward as-is).

# Scope NOT in this spec

  - **§25 TTS substitution table changes** — out of scope; the
    text-display mask doesn't drive audio. Document the divergence
    in §25 at S172 close.
  - **Yahusha parallel toggle** — out of scope (S171 Yoshi-decision
    *No — Yahuah/YHWH only this session*). Could be added as a
    follow-up wheel if partner feedback flags demand.
  - **Capacitor wrap itself** — that's the wheel S172 unblocks. S172
    ships Settings + the mask; S173 (or a Capacitor-specific wheel)
    initializes `capacitor.config.ts`, the iOS/Android shells, native
    share plugin, deep-link URL scheme, TestFlight/Play Console
    setup, and app icons/splash screens.

# Open questions to answer at S172 open

  1. **Backend persistence** — confirm the JSONB
     `subscriptions.display_prefs` extension at S172 open vs a
     separate `partner_preferences` table. The JSONB approach is
     simpler (one column, schema-flexible); the separate table is
     cleaner if more preferences accumulate.
  2. **First-launch modal copy** — the spec text ("The restored
     Hebrew name as Yoshi reads it, pronounced per Josephus *Wars*
     5.5.7" / "The Hebrew consonants — no pronunciation taken")
     needs Yoshi-voice authoring pass before S172 ship. Current
     copy is descriptive draft; final copy lands under voice-gate.
