# S90 Session Handoff — The Matthew Rebuild, Chapters 1–5 Landed

**Authored by Claude at S90 close, 2026-05-20. Read this first at S91 open before doing any other work, alongside `S89_HANDOFF_MATTHEW_REBUILD.md` which carries the project frame and the locked decisions.**

S90 opened from the S89 handoff with all four open decisions already answered. The session executed the per-chapter rebuild loop on **matthew-1, matthew-2, matthew-3, matthew-4, and matthew-5** to the come-and-see strict-read posture locked at S89 close. Two artifacts per chapter — the net-new short-form and the audited long-form — both at the standard. Twenty-three Matthew chapters remain.

## What landed at S90

For each of matthew-1 through matthew-5:

**Short-form ($4.99 layer) — net-new, authored from scratch.** `commentaries/matthew-<n>-short.md`. Focused paragraph commentary, framework-bearing prose, walks the reader through the chapter's most weight-bearing moments. Every load-bearing verse quoted in full in stand-alone italics on first appearance per the strict-read lock. No section headers (running prose, the 1 Corinthians 11 structural model). No appendix tail. No internal-doc references. These are the strings that go into `canon.json`'s `commentary` field at ingestion.

**Long-form ($9.99 layer) — audited body, apparatus-tail clean.** `commentaries/matthew-<n>.md`. Top-of-file authoring-metadata block stripped (the *Framework apologetic for the Yoshi rendering. LANDED [date] (session 81/82)* lines and the internal-document-reference paragraphs below them). Body-level cite-to-quote audit applied — every parenthetical citation and every load-bearing inline-italic quote promoted to stand-alone italicized verse on its own line with the citation in parentheses at the end. *Per Red Line #X* and other internal-document references unfolded into prose the reader can follow without those documents (Red Line #11 unfolded in matt-1 §3, matt-3 §4; Red Line #12 unfolded in matt-1 §8, matt-4 §2 / §3 / §7, matt-5 §1; voice-skill *Victims-Not-Enemies* and *1234 of Truth* unfolded in matt-5 §4; the various `_COMMENTARY_SUMMATION.md` cross-refs unfolded in matt-5 §7 / §8). The *Standing chapter-level position (for the summation appendix)* block trashed per Yoshi's S89 lock. The cross-reference apparatus block (§10 in matt-1, §6/§7/§8/§9 in matt-2/3/4/5) preserved in place with a staging-note added at the top of the section — it does not surface in the reader UI once the data lives in the database, but it stays in the .md as the source-of-truth for the engineering migration pass.

## Pacing note — wrap-signal calibration

S90 first wrap was called conservatively at the matthew-2 boundary; Yoshi pushed back ("just making sure we work as efficiently as possible not arguing"). The voice skill's wrap-signal-sharpening rule explicitly names conservative early wraps as a failure mode — *they push work that should land *this* session to the next session, where it can be lost in the verbal-to-file transcription gap.* The push was correct. Three more chapters (matthew-3, 4, 5) landed after the override.

**Calibration for S91 forward.** The wrap-signal triggers are specific: substantive-turn count at or beyond the 25-30 range AND context budget at or beyond ~70% AND/OR observable error-rate threshold. A *feeling* of fatigue is not a wrap signal. The big context costs already paid at S90 (the voice skill load, the S89 handoff, john-1.md, the contract spec, the canon.json probing) do not repeat per chapter — those are one-time loads. Each Matthew chapter is roughly: Read existing file (~200-500 lines), one short-form Write (~50-150 lines net-new prose), one long-form Write (~500-900 lines restored prose). Pace accordingly. Do not call wrap on the first turn-count threshold without checking actual context budget. If wrap is called, name it as *I'm choosing to wrap early because [reason]* and let Yoshi decide whether to override.

## The per-chapter authoring loop, as executed at S90 and to be repeated

Use this as the standing operating procedure for S91 forward.

1. **Read the existing `matthew-<n>.md`** in full. Catalogue the body-level cite-without-quote violations, the inline-italic quotes that need promotion to stand-alone lines, the internal-document references (*per Red Line #X*, *per the voice skill,* *per `_COMMENTARY_SUMMATION.md` §X,* etc.) that need unfolding, and the apparatus-tail blocks to strip.

2. **Author `commentaries/matthew-<n>-short.md` from scratch.** Running prose, no section headers, framework-bearing walk through the chapter's most weight-bearing moments. Every load-bearing verse quoted in full in stand-alone italics on first appearance. Length will run somewhere in the 1500-3000 word range — longer than the 500-word live 1 Cor 11 shipped commentary because the strict-read quoting requirement lengthens the prose, which is the design cost Yoshi accepted at S89 close.

3. **Rewrite `commentaries/matthew-<n>.md` as a complete file** preserving every argument Yoshi has made, but with: top-of-file metadata block stripped, every inline-italic quote promoted to stand-alone, every cite-without-quote replaced with the verse quoted in full, every internal-document reference unfolded, the *Standing chapter-level position* block trashed, and a staging-note added at the top of the cross-reference apparatus section identifying it as engineering-migration staging.

4. **Engineering migration of the apparatus data** is queued, not part of the per-chapter authoring loop. Each chapter's apparatus block stays in its `matthew-<n>.md` file until the migration script lands.

5. **Pace against the wrap-signal triggers per the calibration note above.** Five full chapters per session was the rate landed at S90 once the calibration was right. Stop cleanly at a chapter boundary, not mid-chapter. Honor what the rule says, not what reflex says.

## Calibration notes from S90

A few practical observations from the chapter-1-through-5 rebuild that inform the next session:

**Length runs longer than the existing files but not by as much as expected.** matthew-1.md grew from 275 to ~660 lines; matthew-2.md from 205 to ~440 lines; matthew-3.md from 205 to ~480 lines; matthew-4.md from 230 to ~510 lines; matthew-5.md from 326 to ~600 lines. The growth is the strict-read quoting cost — every verse that was cited parenthetically or quoted as a short inline italic is now a full stand-alone italicized verse on its own line. The growth is expected and matches the come-and-see-discipline-as-differentiator framing locked at S89.

**The 1 Corinthians 11 shipped short-form (~500 words / 2878 characters) is the calibration baseline for the SHORT-form structural pattern but NOT for the strict-read prose execution.** The S90 matthew-<n>-short.md files run longer than the live 1 Cor 11 short-form because every verse cited inline in the 1 Cor 11 string is quoted in full in stand-alone italics in the Matthew short-forms. The 1 Cor 11 commentary itself is on the audit list and will run longer once rebuilt to the same standard.

**Matthew 5 specifically introduced a heavier internal-doc-reference burden than 1-4.** The existing matthew-5.md carried multiple `_COMMENTARY_SUMMATION.md` cross-refs (§III, §IV, §V, §VII) and several voice-skill cross-refs that needed careful unfolding. Subsequent chapters likely carry similar density; budget the unfolding time per chapter accordingly.

**The §-apparatus blocks in the existing matt files are well-structured and ready for the engineering migration to ingest directly.** The Layer 1 / Layer 2 / proposed-thread structure already maps cleanly onto the `cross_references` and `cross_reference_threads` tables per `api/CHAPTER_END_CARD_CONTRACT.md`. The ingestion script just needs to parse the markdown tables and write the rows. No restructuring needed during authoring.

**The Cross-Reference Apparatus staging note added at S90:** *This section seeds the chapter-end card per `api/CHAPTER_END_CARD_CONTRACT.md`. ... This section is staging data for the engineering migration pass; it does not surface in the reader UI once the data lives in the database.* — added at the top of each chapter's apparatus block. Apply the same note pattern to every chapter's apparatus block during the rebuild.

**The Red Line / voice-skill-section unfolding pattern.** When the existing body cites *per Red Line #X,* the rewrite unfolds the Red Line's content into the prose at that point. When the body cites *voice skill, [section name],* the rewrite unfolds the framework principle into the prose. When the body cites `_COMMENTARY_SUMMATION.md` §X, the rewrite unfolds the relevant doctrinal lock into the prose. The result is reader-prose that does not depend on the reader having access to those internal documents — the come-and-see standard. Examples landed at matt-1 §3 / §8, matt-3 §3 / §4, matt-4 §2 / §3 / §7, matt-5 throughout.

## What S91 opens with

1. Read this handoff. Read `S89_HANDOFF_MATTHEW_REBUILD.md` for the project frame and the locked decisions. Open the voice skill in full.

2. Look at `commentaries/matthew-1.md` + `matthew-1-short.md` through `commentaries/matthew-5.md` + `matthew-5-short.md` as the reference for what the rebuild lands at. matthew-1.md is the model for the long-form body-audit posture; matthew-1-short.md is the model for the short-form prose execution. Apply the same standard to matthew-6 onward.

3. Confirm with Yoshi whether to continue the chapter-by-chapter run from matthew-6 or whether to take on the outside-Matthew audit items first (`1-corinthians-11.md` body rewrite, `john-1.md` final-pass posture audit). Yoshi's S89 instruction was to run Matthew through; honor that unless he revises. Yoshi's S90 instruction was *lets run through mathew as many chapters at a time as we can;* same posture forward.

4. Then start matthew-6 (or whichever item Yoshi names) and proceed through the loop. Honor the wrap-signal calibration from the pacing note above — do not wrap conservatively on the first turn-count threshold.

## What's outstanding at S90 close

**Matthew chapters remaining (23 chapters):** matthew-6 through matthew-28. Each carries the apparatus tail to strip (the *Cross-reference apparatus seeded* line + the *Standing chapter-level position* block per S89's loop) PLUS the body-level cite-to-quote audit and the net-new short-form composition.

**Outside-Matthew audit list (per S89):**
- `commentaries/1-corinthians-11.md` — the chapter shipped live; the visible live commentary in S89's screenshot 1 cites *(2 Samuel 15:30, Esther 6:12, Jeremiah 14:4)*, *(Exodus 28, Leviticus 8, Ezekiel 44)*, and *(Acts 18:18)* without quoting any of them. The .md file uses blockquote `>` rendering rather than the come-and-see strict-read italic stand-alone format. Both the .md body and the canon.json shipped string need the rewrite before 1 Cor 11 can serve as the prose-execution model alongside the post-S88 john-1.md.
- `commentaries/john-1.md` — the S88 long-form rewrite is at the right posture; a final-pass posture audit is still warranted to confirm no parenthetical-cite remnants slipped through. The short-form layer for John 1 is the work that waits until Matthew is finished per S89's decision #4.
- `commentaries/_COMMENTARY_SUMMATION.md` — already at the right posture per S88; no further work needed.

**Engineering tasks queued (not part of per-chapter authoring loop):**
- `chapter_long_form_commentary` table migration + ingestion script that reads `matthew-<n>.md` files and populates the table.
- `GET /api/chapters/{book_slug}/{chapter_number}/long-form-commentary` endpoint.
- Wire the Deeper Dive button on the PWA to call the new endpoint and render the long-form markdown.
- Ingestion script for the apparatus data in each chapter's `§-Cross-Reference-Apparatus` block — populates `cross_references`, `cross_reference_threads`, and `cross_reference_thread_members` per the existing contract.
- Ingestion script for the `commentary` field in `canon.json` — reads `matthew-<n>-short.md` files and writes the short-form Markdown into the existing `commentary` field for each chapter.
- Live-UI fixes per S89's locked list: snippet truncation retires (verse snippets render in full, no mid-sentence `…`); MEMBERS sub-header retires entirely (drop it; thread card becomes title → anchor → summary → list of verse-pair rows); TANAKH SOURCES panel header naming deferred until Romans is in scope; paragraph-style lead-in option where the thread carries a summary.

**Editorial decisions deferred (not blocking the authoring loop):**
- Key-chapter funnel set for the free tier. Final editorial call deferred until more of the Matthew rebuild has landed and Yoshi can see which rebuilt chapters carry the heaviest framework-diagnostic weight. The S88 candidate set (John 1, Romans 11, Hosea 1, Galatians 3, Matthew 5, Matthew 23, Acts 2, Hebrews 8, Revelation 7) remains the working candidate set but is not locked. Matthew 5 is now rebuilt to the standard and is available as a candidate.

## Provenance

Session 90, 2026-05-20. Yoshi's instruction at session open: *lets run through mathew as many chapters at a time as we can.* First wrap was called conservatively at the matthew-2 boundary; Yoshi pushed back. Override added matthew-3, matthew-4, matthew-5. Five chapters total landed to the come-and-see strict-read standard locked at S89 close. Twenty-three chapters remain on the Matthew arc; multi-session work continues. The wrap-signal-sharpening rule of the voice skill governs going forward — do not wrap conservatively on a feeling.
