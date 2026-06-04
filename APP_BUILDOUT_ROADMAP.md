# App Buildout Roadmap — near-term re-sequence (S195+)

Set by Yoshi this session: **before continuing the cross-reference sweep**, finish the app's
public-domain tooling and turn the personal apparatus (notes / bookmarks / saves) into a headline
feature. Fold these into `BIBLE_APP_ROADMAP.md` Section V (Phase Plan) next session; this file is the
working capture so the sequence isn't lost. The cross-reference sweep (`S194_MINION_ORCHESTRATION_PLAN.md`
+ `XREF_LIBRARY_COVERAGE_ROADMAP.md` + `S195_SESSION_OPEN_PROMPT.md`) is **paused, not cancelled** —
it resumes after this arc.

## The sequence

1. **Session A — Public-domain tooling inventory (the next session).** Make sure we *have* every
   public-domain asset we intend to ship. Audit every "coming soon" stub against what's on disk,
   source what's missing, run a licensing check on each, and produce a manifest the integration
   session can build straight from. **Gather only — no app wiring this session.** Full prompt:
   `NEXT_SESSION_PUBLIC_DOMAIN_TOOLING_PROMPT.md`.
2. **Session B — Integrate the tooling.** Wire the gathered assets into the reader: BDB + LSJ word
   study, Vine's, Nave's (if kept), interlinear, Nikkudot, and **maps**. Each comes off "coming
   soon" only when its data is loaded and its surface renders.
3. **Session C — Make the personal apparatus a selling point.** Notes, bookmarks, highlights, and
   saves built into something genuinely better than the competition: organized, searchable,
   taggable, exportable, synced across devices, survivable. This is a conversion lever — treat it
   like a flagship feature, not a utility.
4. **Session D (and beyond) — Chronological library option.** The whole restored library flowing in
   one chronological stream. Feasibility + design below. This is a multi-session arc of its own, but
   the standout is real.
5. **Resume the cross-reference sweep** — gospel back-fill (John → Mark → Luke to full-library
   parity) then the forward Acts → epistles → Revelation → Tanakh pass, per the coverage roadmap.

## Grounded inventory (verified on disk, S194 close)

### Coming-soon stubs (App.tsx §20 stub catalog)
- **Word study (tap-a-word):** BDB · LSJ · Vine's expository · Nikkudot siblings · interlinear.
  (Strong's is already live and free.)
- **Cross-refs:** Treasury (TSK) · Nave's topical · Related passages. (Chapter-end card is live.)
- **Marking:** Bookmark · Add note / Open notes (the apparatus Session C elevates).
- **Maps:** not even a stub — entirely absent.

### Already on disk ✅
- **BDB** — `source-texts/openscriptures-hebrewlexicon/BrownDriverBriggs.xml` + full HebrewLexicon set.
- **Strong's Hebrew + Greek** — `strongs-hebrew/`, `strongs-greek/` (Strong's already shipping).
- **STEPBible tagged data** — `source-texts/stepbible-data/` (can drive interlinear + word alignment).
- The full restored library (canon + Apocrypha + Pseudepigrapha + Enoch/Jubilees/Jasher/Adam-Eve/etc.).

### Missing — needs sourcing + licensing check ❌
- **Maps** — nothing on disk. Highest-value gap (pairs beautifully with chronological). Caution:
  most polished "Bible maps" are modern-copyrighted; source genuinely public-domain atlas plates or
  open-licensed geodata (e.g., openbible.info place coordinates, CC-BY) and render our own.
- **LSJ (Liddell-Scott-Jones Greek lexicon)** — the Greek counterpart to BDB. Public-domain editions
  exist (Perseus). Source the data.
- **Vine's Expository Dictionary** — 1940; public-domain status needs verification before use.
- **Nave's Topical Bible** — 1897, public domain. Source the data — but gut-check against the
  framework first (it's an inherited topical index; curated threads are our preferred apparatus).

### Not downloads — integration/data checks
- **Interlinear** — build from STEPBible tagged data + Strong's; assets likely already in hand.
- **Nikkudot** — depends whether our Hebrew carries vowel-pointing; a data-availability check.

### Treasury (TSK) — re-scoped (S194), not retired
The S75 rollback killed TSK **as the chapter-end baseline** (its volume inverted the framework on
that surface — Red Line #2). It is **not** banned everywhere. Under the unifying policy below, TSK
ships as a **standalone, opt-in, click-to-open reference tool** — the same annotated-foil treatment
as BDB/LSJ/Vine's/Nave's — sequenced **late**, kept visibly subordinate to the curated threads, and
run through a framework distortion-class sweep before launch. The chapter-end card stays
curated-threads-only. TSK (Torrey, public domain) gets sourced during the inventory session and
flagged late-integration; **move the UI stub off the chapter-end cross-ref surface into the
standalone-tools list** rather than removing it.

---

## Why we include the flawed tools — the framework annotation layer (locked S194)

Every public-domain reference tool carries the inherited reading — BDB flattening the Adamic lineage,
the lexicons missing the scattered-seed sense, Vine's reading Paul through the antinomian lens, a map
labeling territory the inherited way. **That is the reason to include them, not to omit them.** Left
alone they teach the lie; annotated, they become the foil. The reader taps the trusted scholarly
tool, sees what it says, and sees the restored reading correct it right at the point of use. This is
the voice skill's own discipline applied to the reference apparatus: *external sources are data read
through the framework; the job is to find their errors with the lens* (Operating Disciplines — "Voice
Skill Is the Standard"). No other Bible app does this; it turns every lookup into a teaching moment.

**Design requirement (Session B builds tools with this hook, not bolted on later):** a **framework
annotation layer** — each public-domain tool stays an *untouched base*, and our corrections live in a
separate keyed overlay beside it. A table like `tool_annotations(tool, entry_key, annotation_md,
tier_required)` overlays a framework note on a given BDB/LSJ/Vine's/Nave's/map entry. Same
curated-overlay-on-fixed-source pattern as the cross-reference threads and the chronological
placement notes — one more layer, same shape. Clean separation keeps the PD base auditable and makes
the correction unmistakably *our* layer.

**Inventory-session implication:** for each tool, record the known framework-conflict points (where
it will need correction) alongside the asset, so the annotation work starts with a punch list.

**The unifying policy (locked S194) — what may carry the inherited reading, and where.**
*Inherited reference tools are allowed as opt-in, clearly-secondary, annotated foils; never as the
default or load-bearing reading surface.* This one rule governs BDB, LSJ, Vine's, Nave's, **and TSK**
identically, and it explains the whole TSK history: TSK **failed** as the chapter-end baseline (its
volume inverted the framework on the surface where the framework must speak — Red Line #2), but
**passes** as a standalone, opt-in, click-to-open tool the reader chooses to enter. The distinction
that matters is surface and default-weight, not discrete-vs-mass. Guardrails for any mass inherited
apparatus (TSK, Nave's): (a) keep it visibly subordinate to the curated threads so its bulk never
reads as "the complete/authoritative set"; (b) label it honestly as the inherited/historical
reference set; (c) run a framework distortion-class sweep (grace/law, Jew/Gentile, church-as-Israel,
Torah-as-curse pairings) before launch, with corrections accruing over time — most pairs are harmless
word/event echoes; the distortion is concentrated and knowable.

**Voice framing (Yoshi's call):** per the "proclaimer steps aside / the teacher is invisible by
design" discipline, the apparatus is framed as *the restored Word correcting the inherited tool*
rather than a Yoshi-vs-scholars scoreboard — the same vindication (the inherited authority visibly
bested), kept on the Word and the framework rather than the personality. Overridable by the author.

---

## Chronological library option — feasibility

**Bottom line:** the engineering is easy; the curation is the real work but it's stageable and
minion-producible exactly like the cross-references; and the standout is specifically the
*integrated extras*, not chronology-of-canon (which already exists). Locking one editorial principle
makes the whole thing tractable.

### Engineering — low difficulty
It's a **second ordering layer** over the same verse data we already have (books carry
`canonical_order`; verses are addressable). Add a `chronological_segments` table: each row is an
ordered unit — `(edition_slug, book_slug, chapter, verse_start, verse_end, sequence_position, era,
date_sort_key, placement_note)`. The reader gets a **Chronological toggle**; the API streams segments
in `sequence_position` order, stitching across books and editions. Use sparse/float positions (gap
1000, or numeric float) so a newly-placed segment inserts between two others with no renumber.
Additive and idempotent — it never disturbs the canonical reading. Same architecture as the
chapter-end card apparatus: a curated interpretive layer over fixed text. **~1 session** to land the
schema + toggle + a seeded sample.

### Curation — moderate-to-high, but stageable
The engine is trivial; deciding the sequence is the project. The hard calls:

- **Canon chronology is already interleaved and contested** — Job in the patriarchal era, Psalms
  scattered across and beyond David's life, the prophets folded into Kings/Chronicles, the
  post-exilic ordering. Good news: chronological *canon* Bibles and reading plans already exist, so a
  published chronological scaffold can seed the canon ordering rather than deriving it from scratch.
- **Parallel passages** — Kings//Chronicles cover the same reigns; the four gospels run parallel.
  One editorial decision: interleave both accounts at the same point, harmonize into a single thread
  (the gospel-harmony / Diatessaron tradition is precedent), or show one and cross-link the other.
- **The novel, framework-aligned part: slotting the extras into the canon timeline.** 1 Enoch's
  Watcher account at Genesis 6; Jubilees (which *is* a dated chronology of Genesis–Exodus) retelling
  alongside it; Jasher filling the patriarchal gaps; the Adam-Eve Conflict right after Eden;
  Apocalypse of Abraham in Abraham's life; Ascension of Isaiah's martyrdom in Manasseh's reign;
  2 Baruch / 4 Ezra after Jerusalem falls; Testaments of the Twelve at the patriarchs' deathbeds.
  Interleaving these inline is what makes the restored library read as **one continuous covenant
  story** — which is the framework's whole thesis (the truncated canon hides the continuous story).
  The chronological mode isn't just a feature; it's an *argument* for the framework.

### The principle that makes it tractable (recommend locking)
**Order by narrative setting, not authorship date.** A chronological *story* flow places 1 Enoch 6–11
at Genesis 6 (the events it narrates), not in the 2nd c. BCE (when scholars date its composition).
This sidesteps the composition-date debates entirely and is on-framework (the texts are treated as
witnesses to the events they recount). Undated wisdom/poetry (much of Psalms, Proverbs, Job's
discourses, Ecclesiastes, Song) anchors to its attribution (Davidic psalms in David's life, Solomonic
books in Solomon's reign) with a "wisdom interlude" convention for the genuinely un-anchorable — the
fuzziest zone, and the one place that needs Yoshi's judgment calls most.

### Honesty on "never been done"
Chronological Bibles, chronological reading plans, and gospel harmonies all exist — chronology of the
*canon* is not new. What does not exist, as far as is known, is a chronological mode that **interleaves
the full restored extra-canonical library inline with the canon as one continuous flow**, in an app,
with framework notes on the seams. That precise thing is the defensible standout — and it pairs with
maps (a journey + a timeline + a map is a Logos-class combination). Frame the marketing claim that
precisely so it survives a competitor check.

### Risk + the mitigation that doubles as teaching
Placements (especially extras and poetry) will draw scholarly disagreement. The framework posture
handles it: present a *defensible covenant-narrative ordering*, not a claim of academic precision,
and give every segment a short `placement_note` explaining why it sits there. That note field doubles
as a teaching surface — e.g., "1 Enoch 6–11 placed at Genesis 6 — the Watcher account the canon
compresses to three verses." The seams become the product.

### Effort estimate
- Schema + reader toggle + seeded sample: **~1 session.**
- Canon chronological ordering (chapter/pericope granularity, leaning on a published scaffold):
  **~1–2 sessions** of curation + verification.
- Extras interleaving: **~1 session per few books** → call it **2–3 sessions** for the full library.
- A compelling **demo** — Genesis through the Flood with Enoch + Jubilees + Jasher + Adam-Eve
  interleaved — is **~2 sessions** and already shows the standout.
- Full-library v1: a **~5–7 session arc**, minion-producible + orchestrator-verified against a
  chronological-placement contract (the analog of the chapter-end card contract).

### Dependency note
Chronological is largely independent of the public-domain tooling, but **maps are its natural
companion** — build maps in Session A/B and the chronological arc can light them up (place names per
segment → map pins per era). The extras are already seeded, so no data prerequisite blocks it.
