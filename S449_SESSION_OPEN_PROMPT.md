Load my voice skill and mount my Desktop. Read ~/Desktop/App/S446_SESSION_HANDOFF.md — the S448b section at the bottom is this session's job.

JOB: rebuild 1 Enoch. A partner found chapters 14 and 17 duplicated. S448 confirmed the published Enoch Restored Names Edition (~/Desktop/App/source-texts/existing-restored-editions/Enoch-Restored-Names-Edition.txt — the same text in parsed/enoch.json, the app, and Michael's audio) is built on a corrupt base: chapter 14 is missing the throne vision (14:8–25) and carries chapter 18's text instead; 28=29, 95=97, 103=104 are identical; 89/90, 94–97, 102–104, 70/71, 30–32, 39/42, 41/44 overlap heavily; verse counts match Charles nowhere.

RULES FOR THIS SESSION — read these before touching anything:
1. Verify by CONTENT, never by length. Earlier sessions "checked" Enoch by comparing verse counts and chapter lengths and reported it fine. That is exactly how this was missed. Every check you report must be a verse-by-verse text comparison against a clean R.H. Charles 1917 text, and you show me the diff numbers per chapter (verses matched / changed / missing / extra), not "looks good."
2. Do not tell me a chapter is correct unless you have read both texts for that chapter. If you cannot get a clean Charles text, say so and stop — do not patch from memory.
3. Use the local files first. restoration-pipeline/restore.py is the name-restoration standard; the voice skill is the lens.
4. Terminal blocks for me to paste, never type into my apps; never Cmd+A or Backspace; one question at a time; explain git plainly.
5. Save over originals, no v2 copies; delete a file once replaced (ask me for delete permission when you need it).

STEPS, in order:
A. First give me this to paste — it downloads the clean Charles 1917 chapter pages from sacred-texts.com into source-texts/enoch-charles-1917/html/ (the script is already written): `bash ~/Desktop/App/source-texts/enoch-charles-1917/fetch.sh`. Confirm it saved about 110 pages. Parse the pages by their 'Chapter N' headings — the page numbers do not map to chapters one-for-one — into one clean text file in that folder, one verse per line. Show me its chapter count (108) and the per-chapter verse counts, and compare them to the known Charles counts for a sample I can check (14=25, 17=8, 18=16, 28=3, 29=2, 95=7, 97=10, 103=15, 104=13).
B. Diff it against Enoch-Restored-Names-Edition.txt chapter by chapter, by text. Give me the full damage table: for each of the 108 chapters, matched / changed / missing / extra verses. One table, then one question: proceed?
C. Build the new edition: Charles text → restore.py (restored names, source-echo parentheticals, son of Adam per Red Line #12) → write Enoch-Restored-Names-Edition.txt over the original, keeping my existing chapter titles and the "Commentary on Chapter N" sections where the chapter content is unchanged; flag every commentary that now talks about text that moved or was missing (chapter 14's especially) for me to redo.
D. Re-parse to source-texts/parsed/enoch.json the same way the other editions are parsed; reseed the app; verify live chapter 14 shows the throne vision and 28≠29, 95≠97, 103≠104.
E. Audio: move audio/am_michael/enoch to audio/_redo, update tts/chapters_all.json's enoch entries from the new parse, give me the record command (bash ~/Desktop/App/tts/record_bible.sh am_michael) and the upload command (node ~/Desktop/App/_s444_upload_audio.mjs). Note: the extras recording started Oct 14 may still be running in a terminal — do not stop it; the redo can run after it.
F. Sweep commentaries/, cross-references, the Called God a Liar cards (~/Desktop/Called God a Liar Cards cites 1 Enoch 95:2 and 97:2 — both duplicated chapters), and the books for Enoch chapter:verse citations that shift under the corrected numbering, and list them.
G. Tell me what the KDP Enoch edition needs (new interior from the corrected file) — don't build it until I say.
H. Write everything settled into S446_SESSION_HANDOFF.md before wrapping.

Start with step A and show me the numbers.
