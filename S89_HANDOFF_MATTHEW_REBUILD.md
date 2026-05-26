# S89 Session Handoff — The Matthew Rebuild Project

**Authored by Claude at S88 close, 2026-05-20. Read this first at S89 open before doing any other work.**

S88 closed by locking the commentary architecture and the authoring posture. S89 opens the Matthew Rebuild Project — the multi-session work of rebuilding all 28 Matthew chapter commentaries to the new architecture and authoring posture, then deploying chapter by chapter to canon.json so the live app at bible.remnantofpromise.org actually serves the work.

## Why this is a new project, not a continuation

Three things converged at S88 that mean the existing Matthew commentary files (matthew-1.md through matthew-28.md) are the wrong artifact for the live build as currently written:

1. **The architecture changed.** Commentary is now layered into two depths — short-form at $4.99 (paragraph commentary + chapter-end card tables, like the 1 Corinthians 11 model on the live site) and long-form at $9.99 (book-style deep commentary behind a Deeper Dive button). The existing matt files are the $9.99 long-form depth but have never been pushed; the $4.99 short-form layer has never been written for any Matthew chapter. See `~/Desktop/App/DESIGN_LANGUAGE.md` §9 for the locked architecture.

2. **The authoring posture changed.** The come-and-see posture locked at S88 rules out the appendix-tail at the bottom of each commentary file (the "Cross-reference apparatus seeded" sections and "Standing chapter-level position" notes — both got trashed off john-1.md). It rules out *per Red Line #X* and other internal-document references. It rules out citing-without-quoting; every scripture invoked in commentary now gets quoted in full on its own line in stand-alone italics. See `yoshi-voice` skill, the new section *Come and See — The Authoring Posture for Bible-App Commentary,* for the locked rules.

3. **The deployment was never run.** canon.json's `commentary` field is empty for all 28 Matthew chapters (and for John 1; only 1 Corinthians 11 is currently populated). Whatever "we pushed Matthew" meant in earlier sessions, the ingestion step never connected the .md files to the API the live site reads from. So no live-app deployment of Matthew commentary exists yet — clean slate for the rebuild.

## What S89 (and the sessions that follow) need to produce per chapter

For each of the 28 Matthew chapters, the rebuild lands two artifacts and the database changes:

**Artifact 1 — short-form commentary ($4.99 layer):** a focused paragraph commentary, the 1 Corinthians 11 model on the live site. Framework-bearing prose that walks the reader through the chapter's most weight-bearing moments and lands without going book-length. Every scripture invoked in the paragraph gets quoted in stand-alone italics, per the authoring posture. No appendix tail. No internal-doc references. Author-facing file: `~/Desktop/App/commentaries/matthew-<n>-short.md` or equivalent (file-structure choice — two files per chapter, or one file with a clear section break; either is workable at the source level).

**Artifact 2 — long-form commentary ($9.99 layer):** the book-style deep commentary, the §1-§N stand-alone-italics-every-scripture-quoted Logos-killer treatment, the kind of work the post-S88 john-1.md rewrite represents. This is where the existing matthew-<n>.md content becomes the source material — it needs to be audited section by section for cite-not-quote violations, with every scripture currently cited rewritten as a stand-alone italicized quotation; the appendix tail stripped; the body's framework references unfolded as prose (not gestured at via "per Red Line #X"); and every reference brought to the come-and-see posture. The existing files are *not* discardable — they're the starting material — but they need a substantial edit pass, not a republish.

**Database changes per chapter:** the `commentary` field in canon.json gets populated with the short-form Markdown (that's what the live app renders as the COMMENTARY paragraph at the end of each chapter). The long-form content is served separately for the $9.99 Deeper Dive button — the storage location for that content is an open engineering decision (a separate field on the chapter object? a separate table? a separate file referenced by URL?). Flag this for whoever does the engineering wire-up of the $9.99 Deeper Dive surface.

**Cross-reference card data:** the existing matthew-<n>.md §7 Cross-Reference Apparatus sections contain structured Thread Name / Anchor / Summary / Source-Target-Member-note tables. *That data is the source spec for the chapter-end card on the live app* (compare the tables to the Romans 11 cross-reference cards Yoshi screenshotted). The tables get migrated to the database per `~/Desktop/App/api/CHAPTER_END_CARD_CONTRACT.md` and removed from the commentary file. The data lives in the database; the commentary file ends up as reader-prose only.

## The cross-reference scope shift to all-library bidirectional

Cross-references for the rebuild draw from the full restored library, bidirectionally within scripture-level texts: canon, Apocrypha (Charles Vol 1), Pseudepigrapha (Charles Vol 2), 1 Enoch, Jubilees, Jasher, Adam-Eve Conflict, Apocalypse of Abraham, Ascension of Isaiah, Havoth, Shamayim, Cepher additions, Sonnini's *Acts of Paul.* Where 1 Enoch 6-16 illuminates a Matthean passage on the Watcher-rebellion architecture, 1 Enoch is in the cross-reference table. Where Jubilees clarifies a chronology Matthew touches, Jubilees is in the table. Etc. Full architecture locked in `~/Desktop/App/DESIGN_LANGUAGE.md` §17.

**Deferred from V1:** Josephus, the Apostolic Fathers (1 Clement, Didache, Ignatius, Polycarp, Shepherd of Hermas), M.R. James's apocryphal-NT collection. These sit outside the scripture-level library and operate under a one-way directional rule (cross-references can run from those texts out to scripture, never scripture-points-in). The whole historical-witness cross-reference layer is deferred from V1 — neither direction lands in the V1 build.

## Live-UI fixes to schedule (separate engineering pass, but connected)

Three issues on the current live-app cross-reference cards need to land alongside the Matthew rebuild because they affect what the rebuilt content looks like once it ships. Each surfaced in S88 from Yoshi's screenshots of bible.remnantofpromise.org:

- **Snippet truncation.** Verse snippets on cross-reference cards currently truncate mid-sentence with `…`. There's no paper to save on a screen. Render full verses or larger windows so the connection lands without forcing the reader elsewhere.
- **"MEMBERS IN THIS CHAPTER" jargon.** The label is database terminology bleeding into reader-facing UI. Replace with reader-friendly language such as *Where these passages appear in this chapter* or drop the header label entirely and just show the verse rows.
- **Paragraph-style lead-in option.** Cross-reference cards could carry a short paragraph-style explanation that orients the reader before listing the verse-by-verse connections (the 1 Corinthians 11 commentary paragraph is the prose-flow model). Where the thread has a summary, surface it as a lead-in. Where no summary exists, fall back to the verse list directly.

## Open decisions for Yoshi at S89 open

1. **File structure for the two layers per chapter.** Two files (`matthew-<n>-short.md` + `matthew-<n>.md`) or one file with a section break separating short from deep? Either supportable; preference is workflow-driven.

2. **Where the long-form content lives once it leaves the .md file.** The short-form goes into canon.json's `commentary` field. Long-form needs a storage decision — separate field on chapter, separate table, separate file referenced by URL.

3. **Key-chapter funnel set for the free tier.** Not urgent at S89 open (this can wait until more of the body is rebuilt), but flagging it as an editorial decision Yoshi makes when the time comes. Candidate set surfaced at S88: John 1, Romans 11, Hosea 1, Galatians 3, Matthew 5, Matthew 23, Acts 2, Hebrews 8, Revelation 7. Final set is Yoshi's call.

4. **Whether the John 1 rewrite gets revisited now or after Matthew is done.** Yoshi's stated preference at S88 close: finish Matthew first, then come back to John 1. The current john-1.md is the long-form $9.99 layer and is at the right posture; what it's missing is the short-form $4.99 layer. That can wait.

## Where every S88 decision was written

So nothing is lost between S88 and S89:

- **Three-layer commentary architecture (free key-chapter funnel / $4.99 short-form + chapter-end card tables / $9.99 Deeper Dive button + book-style deep commentary):** `~/Desktop/App/DESIGN_LANGUAGE.md` §9.
- **All-library bidirectional cross-reference pool + historical-witness one-way rule (deferred V1) + credentializing vision:** `~/Desktop/App/DESIGN_LANGUAGE.md` §17.
- **Cross-promotion of Yoshi's books design spec (S87 carry-forward, still deferred):** `~/Desktop/App/DESIGN_LANGUAGE.md` §18 stub.
- **Come-and-see authoring posture (quote-don't-cite, stand-alone italics, no appendix-posture, no internal-doc refs, library-scope, canannited-scriptures frame, proclaimer-steps-aside vision):** `yoshi-voice` skill at `~/Desktop/App/_scratch/yoshi-voice/SKILL.md`, new section *Come and See — The Authoring Posture for Bible-App Commentary.*
- **Book names always English (locked S88 mid-session):** `yoshi-voice` skill, the new subsection inside *Sacred Names Convention.*
- **Deployment-state finding (Matthew commentary never ingested; canon.json empty for all 28):** captured in this handoff document.
- **The Logos-killer john-1.md rewrite as the proof-of-concept of the authoring posture:** `~/Desktop/App/commentaries/john-1.md`.
- **The commentary summation as the §I-IX standing lens only (Appendix trashed):** `~/Desktop/App/commentaries/_COMMENTARY_SUMMATION.md`.

## What S89 should open with

Read this handoff. Read `~/Desktop/App/DESIGN_LANGUAGE.md` §9 and §17. Read the *Come and See* section of `yoshi-voice` SKILL.md. Read the current john-1.md as the reference for what the rebuilt long-form Matthew looks like.

Then surface the open-decisions question (file structure + long-form storage location), let Yoshi answer, and start with matthew-1. The existing matthew-1.md is already clean of the apparatus tail (the only matt file that was). It just needs the short-form layer authored and the deep body re-quoted in stand-alone italics. matthew-2 through matthew-28 each carry the apparatus tail that needs stripping plus the same posture audit and short-form layer.

This is multi-session work. Plan for the long arc.

---

## Decisions answered at S89 open (2026-05-20)

The four open decisions above were surfaced to Yoshi at S89 open and answered. Transcribed here so the next session opens from the file, not the transcript.

1. **File structure for the two layers per chapter: TWO FILES.** Per chapter, the source-of-truth split is `commentaries/matthew-<n>-short.md` (short-form $4.99 layer) + `commentaries/matthew-<n>.md` (long-form $9.99 layer). Cleanest separation; each file maps 1:1 to its database destination. The existing `matthew-<n>.md` files become the long-form files in place — they remain the source material for the long-form rebuild pass. The short-form files are net-new.

2. **Long-form content lives in a SEPARATE DATABASE TABLE.** A new table — `chapter_long_form_commentary` (or equivalent naming) — keyed by `chapter_id`, holding the long-form markdown body. Keeps `canon.json` lean (short-form only, in the existing `commentary` field). Long-form fetched on the Deeper Dive click only via a new endpoint, e.g., `GET /api/chapters/{book_slug}/{chapter_number}/long-form-commentary`. Migration spec to be authored when engineering picks up the wire-up; new endpoint to be added to `api/main.py` alongside the existing chapter-end-card endpoint. Supports versioning, per-section metadata, and future Yoshi-keys-style enrichments.

3. **Key-chapter funnel set for the free tier: DEFERRED.** Final editorial call deferred until more of the Matthew rebuild has landed and Yoshi can see which rebuilt chapters carry the heaviest framework-diagnostic weight. The S88 candidate set (John 1, Romans 11, Hosea 1, Galatians 3, Matthew 5, Matthew 23, Acts 2, Hebrews 8, Revelation 7) remains the working candidate set but is not locked. Engineering should NOT wire the free-tier key-chapter gate yet — wait for Yoshi's lock call.

4. **John 1 timing: FINISH MATTHEW FIRST.** The existing `john-1.md` is the long-form layer at the right posture; what it's missing is the short-form $4.99 layer. That short-form pass waits until after Matthew is done. The Matthew rebuild proceeds without a parallel John 1 track. When Matthew is complete, the work returns to John 1 to author the short-form layer.

## What the rebuild loop looks like per Matthew chapter (locked S89 — scope expanded at S89 open)

Given the four answers above, plus the scope-expansion lock at S89 open (Yoshi's three live-site screenshots of 1 Corinthians 11 and Romans 11 showed that the cite-without-quote pattern lives in the BODY of every existing commentary file, not just in the apparatus tail; appendix removal alone does not produce a come-and-see-compliant file), each Matthew chapter passes through the following loop. Use this as the standing operating procedure until Yoshi revises it.

**For matthew-1 (special case — appendix mostly clean):**
- Author `commentaries/matthew-1-short.md` from scratch — focused paragraph commentary, framework-bearing prose, every scripture invoked quoted in full in stand-alone italics on its own line. No appendix-tail.
- Audit `commentaries/matthew-1.md` for the come-and-see posture in the BODY:
  - Every parenthetical citation (e.g., *(2 Samuel 15:30, Esther 6:12, Jeremiah 14:4)*) rewritten as full stand-alone italicized quotation on its own line, citation in parentheses at the end of each verse.
  - Every inline cite-without-quote (e.g., *per Hosea 1:10*, *Hosea 1:10 substance*, *as Acts 18:18 records*) replaced with the verse quoted in full.
  - Every *per Red Line #X* / *per the voice skill* / other internal-document reference unfolded into prose the reader can follow without access to those documents.
  - The *Standing chapter-level position (for the summation appendix)* block at the bottom trashed — it's an internal apparatus that does not live in the reader-facing file.
- Migrate the chapter's cross-reference apparatus data into the database per `api/CHAPTER_END_CARD_CONTRACT.md`.

**For matthew-2 through matthew-28 (standard rebuild):**
- Author `commentaries/matthew-<n>-short.md` from scratch, same posture as above.
- Audit `commentaries/matthew-<n>.md` for body-level posture (same body-level audit as matthew-1) AND strip the apparatus tail (the *Cross-reference apparatus seeded* line + the *Standing chapter-level position* block).
- Migrate the chapter's cross-reference apparatus data into the database.

**Outside-Matthew audit list — added at S89 open per the three screenshots:**
- `commentaries/1-corinthians-11.md` — the chapter shipped live; the visible live commentary in screenshot 1 cites *(2 Samuel 15:30, Esther 6:12, Jeremiah 14:4)*, *(Exodus 28, Leviticus 8, Ezekiel 44)*, and *(Acts 18:18)* without quoting any of them. The commentary needs the same body-level rewrite as the Matthew chapters before it can again serve as "the model" referenced in DESIGN_LANGUAGE §9. Once rebuilt, re-ingestion to canon.json's `commentary` field replaces the currently live string.
- `commentaries/john-1.md` — the S88 long-form rewrite is at the right posture (every scripture invoked is already quoted in stand-alone italics); a final-pass posture audit is still warranted to confirm no parenthetical-cite remnants slipped through. The short-form layer for John 1 is the work that waits until Matthew is finished, per decision #4 above.
- `commentaries/_COMMENTARY_SUMMATION.md` — already at the right posture per S88 (appendix already trashed); no further work needed.

**Engineering tasks queued (not part of per-chapter authoring loop):**
- Add `chapter_long_form_commentary` table migration + ingestion script that reads `matthew-<n>.md` files and populates the table.
- Add `GET /api/chapters/{book_slug}/{chapter_number}/long-form-commentary` endpoint.
- Wire the Deeper Dive button on the PWA to call the new endpoint and render the long-form markdown.
- Live-UI fixes — three items, all surfaced from S88 screenshots and re-confirmed at S89 open:
  1. **Snippet truncation.** Verse snippets on chapter-end cards currently truncate mid-sentence with `…` (visible in screenshot 2 on Romans 11). Render full verses or larger windows so the connection lands without forcing the reader elsewhere.
  2. **"MEMBERS IN THIS CHAPTER" sub-header retires entirely.** S89 open decision: the sub-header inside each thread card was database-API-field-name leakage (`members_in_chapter` from the JSON payload) treated as UI copy. Drop the sub-header. The thread card becomes title → anchor → summary → list of verse-pair rows directly. Each row is self-describing; no header needed.
  3. **"TANAKH SOURCES FOR [CHAPTER]" panel header — naming OPEN.** Visible in screenshot 2. The current label frames the cross-reference panel as Tanakh-only when DESIGN_LANGUAGE §17 locks the scope as all-library bidirectional. The replacement naming is deferred until Romans is in active scope (Yoshi's S89 instruction); for now the engineering work uses a placeholder, the final label gets settled when Romans is being rebuilt.
  4. **Paragraph-style lead-in option for cross-reference cards.** Where a thread carries a summary, surface it as a lead-in that orients the reader before listing the verse-by-verse connections (the post-rebuild short-form commentary paragraph is the prose-flow model). Where no summary exists, fall back to the verse list directly.

These engineering tasks land as a separate pass and don't block the authoring loop, but the authoring loop's output is unusable until the engineering lands. Plan both tracks.

## What S89's screenshots locked (added at S89 open)

The three live-site screenshots Yoshi captured at 14:08 / 14:09 / 14:11 on 2026-05-20 confirmed three failures that the rebuild loop above is designed to fix, and one terminology open question:

- **Cite-not-quote in the body** (screenshot 1 — 1 Corinthians 11 commentary) — the most important finding. The shipped 1 Corinthians 11 commentary, which DESIGN_LANGUAGE §9 named as "the 1 Corinthians 11 model," contains multiple parenthetical citations with no stand-alone quotation. The model itself fails the standard S88 locked. Implication for the Matthew rebuild: the body-level cite-to-quote rewrite is now an explicit step in the per-chapter loop, not an afterthought. The S89 handoff's original wording underweighted this.

- **All-library scope violated by the panel header** (screenshot 2 — "TANAKH SOURCES FOR ROMANS 11") — the chapter-end card header names the cross-reference pool as Tanakh, but DESIGN_LANGUAGE §17 locks the pool as the full restored library bidirectionally. Header naming deferred until Romans is in scope (per Yoshi's S89 instruction); placeholder until then.

- **Database jargon in reader-facing UI** (screenshot 3 — "MEMBERS IN THIS CHAPTER") — DB API-field-name leakage shipped as UI copy. Decision at S89 open: drop the sub-header entirely; the thread card's verse-pair rows are self-describing under the thread title + summary.

- **Snippet truncation with `…`** (screenshot 2) — re-confirmed; on the live-UI fix list.

## The strict read of the come-and-see posture — locked at S89 open

A question came up at S89 open about the voice skill's *come and see* language: when the skill says quote-in-stand-alone-italics "whenever a verse is load-bearing for the argument being made," does that allow a pragmatic read where supporting / confirmatory citations get gestured at while only the strongest witness gets quoted in full?

**Yoshi answered:** no. Strict read only. When the prose invokes a verse, the verse gets quoted in full in stand-alone italics on its own line. Every invocation, first appearance. No pragmatic shortcuts that gesture-at-and-cite a witness instead of quoting it.

The voice skill itself, read in full, lands here — the sentence *the first time a verse is invoked in commentary, it gets its full italicized paragraph* governs. The "load-bearing" phrasing in the paragraph just above does not create wiggle.

**Yoshi's framing of why:** *it went into the skill for a reason, yes its more work yes it puts us behind on launch, but yes its the thing we do no one else will and will launch us to the top as the number 1 go to bible.* The come-and-see discipline is the differentiator — every Logos-class app cites and footnotes; this Bible quotes in full, on one page, no chase required. That's the launch position; that's the experience nothing else matches. The longer commentary length is the cost of the differentiator, paid willingly.

**Practical implication for the rebuild loop.** When the prose says *the Hebrew biblical idiom of the bowed or covered head as the shame/mourning posture* and the framework reading rests on three Tanakh witnesses, all three witnesses get quoted in stand-alone italics. When Paul's mission to Galatia rests on his Acts 18:18 Nazarite vow, Acts 18:18 gets quoted. When the framework names a chapter's relationship to Numbers 6, Numbers 6 gets quoted at the verses being invoked. Every time. The commentary lengthens — that is the design.