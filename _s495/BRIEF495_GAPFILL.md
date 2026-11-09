# S495 — Phase 2 gap fill — brief for every drafting agent

You are writing NEW cross-reference cards and thread summaries for chapters of a study Bible's library that have
no card at all. Each card ties one verse of the chapter you are given (the SOURCE) to one verse elsewhere in the
restored library (the TARGET — the canon, or a scripture-level extra: 1 Enoch, Jubilees, Jasher, the Apocrypha,
the pseudepigrapha of Charles vol. 2, Adam and Eve Conflict, Apocalypse of Abraham, Ascension of Isaiah), with a
note the reader sees at the end of the chapter. Work by content: read the texts given to you, decide, and write.
Never decide by counts or guesses. Never quote from memory.

**Before writing anything, read `/mnt/skills/plugins/yoshi-voice/SKILL.md` in full** — it is the author's voice
and theological standard; the Red Lines are non-negotiable and the author catches violations. Then read
`/home/claude/s495/ref/BRIEF463f.md` — its "Voice rules (non-negotiable)" section applies here word for word
(Come and See; no internal references; no hyphen-chains; flowing sentences; sacred names with parentheticals at
every mention in your prose; son of Adam; English book names in citations; Torah stands; the seed of promise is
paternal blood; the Father formless, Yahusha (Jesus) the Formed; Daniel and Revelation separate).

## Where the texts are (quote ONLY from these files, by script)
- Your packet: `/home/claude/s495/packets/<book>.json` — `gap_chapters[]`, each with `ch`, `title`, `verses`
  {vn: live text}; `existing_threads[]` (slug, title, anchor, member_count) already anchored in this book;
  `sample_cards[]` and `sample_thread` from this book's existing cards, for shape; `edition`, `book`, `one_way`.
- Live text of the whole book (all chapters): `/home/claude/s495/live/<edition>__<book>.json` → `live` map keyed
  `edition|book|ch:vn`.
- Target texts: `/home/claude/s495/parsed/canon.json` (`books[].book_id` = slug, `chapters[].number`,
  `verses[].number/.text`) and the other parsed editions in `/home/claude/s495/parsed/` (enoch.json → edition
  `enoch` book `1-enoch`; jubilees.json → `jubilees`/`jubilees`; jasher.json → `jasher`/`jasher`; apocrypha.json →
  `apocrypha`/<book_id>; pseudepigrapha-charles-vol2.json → `pseudepigrapha`/<book_id>; adam-eve-conflict.json →
  `adam-eve-conflict`/`1-adam-eve`,`2-adam-eve`; apocalypse-of-abraham.json → `apocalypse-of-abraham`;
  ascension-isaiah.json → `ascension-isaiah`). The parsed canon is the restored-names KJV the live text was
  loaded from; quote target verses exactly as they stand there — do not retype, do not "fix", keep every
  parenthetical as it is.
- Pull every verse you quote with a small Python helper and paste the returned string; a quotation that does not
  match the file verbatim will be rejected by the assembly check and the card thrown out.

## What to write, per gap chapter
- **2 to 4 cards** for the chapter (a 1-verse chapter may need only 1 or 2). Pick the verse of the chapter that
  actually carries the connection (the source), and the one verse elsewhere that answers it best (the target).
  Prefer the canon for targets; use an extra when it is the plain witness (1 Enoch for the Watchers, Jubilees for
  chronology, Jasher for patriarch narrative). No two cards on the same source→target pair. Source ≠ target.
- **Card note — Come and See, both whole verses:**
  `<Target book c:v> — *<the whole target verse verbatim>* *<the whole source verse verbatim>* (<Source book c:v>)
  <one to three plain sentences showing the reader why the two belong together.>`
  The target verse leads because that is the scripture the reader is being handed; the source verse follows in
  full so the reader sees both without leaving the page. Italics are `*…*`. Citations in parentheses use the
  English book name and c:v. Prose: plain, warm, no jargon, no "the framework", no "substance", no "architecture",
  no "motif", no "Red Line", no session numbers, no author's name.
- **Member note (short, for the thread list):** `<Target book c:v> — *<the target verse, or a verbatim phrase of
  it>.* <one sentence.>`
- **One thread per gap chapter** (or join an existing thread from `existing_threads` when the chapter's cards
  plainly belong to it — then give `join_slug` and no new summary). New thread: `slug` all lowercase, hyphens,
  English book-name fragments only (`1-enoch-91-apocalypse-of-weeks-…`, `testaments-levi-11-…`,
  `hermas-23-…`) and not already in `existing_threads`; `title` a plain phrase, not Title Case Of Every Word;
  `summary_md` 150–400 words that quotes, in stand-alone italics with citations, the source verse(s) and the
  target verse(s) that carry the point, and walks the reader through the connection in flowing sentences. The
  author's own opener for a summary that shows the canon already held the point is *It ain't new* — use it where
  it is true, in those words, not "This is not new". Anchor the thread on the chapter's verses (`anchor_start_vn`,
  `anchor_end_vn` within the gap chapter).
- **Historical witness (Hermas — `one_way: true`):** cards run FROM Hermas OUT to scripture only; targets are
  canon (or a scripture-level extra), never another witness; the note quotes the canon verse then the Hermas verse
  and lets the scripture stand beside the line without endorsing a drift or attacking the writer. Everything else
  in the library is scripture-level and bidirectional in principle — but here you only write the row whose
  source is the gap chapter.
- **Voice gate before you write a line:** the twelve Red Lines. No "Jew and Gentile" binary; the Galatians /
  Romans / Hebrews lines read as the author reads them (Torah not abolished; the curse is the exile judgment, not
  the Torah; grace is the way home to the commandments); the scattered seed is a bloodline people being gathered;
  both olive branches are Yashar'el (Israel); the nations are not grafted in; the Son of Adam; the Father formless,
  the Son the Formed; Daniel and Revelation never collapsed into one book. Where a text in the gap chapter is
  itself strange (Vita Adae legend, Testaments' Hellenized lines), the note does not build doctrine on it — it
  sets the scripture beside it and lets the reader see.
- Tier: cards `extras`, threads `extras` (the library tier), unless the packet says otherwise.

## Output — one file, `/home/claude/s495/out/<book>_draft.json`
```
{"model": "<your model name, exactly>", "edition": "...", "book": "...",
 "chapters": [
   {"ch": 91, "cards": [
       {"src_vn": 12, "tgt_edition": "canon", "tgt_book": "daniel", "tgt_ch": 12, "tgt_vn": 1,
        "note": "...", "member_note": "...", "tier": "extras"}],
    "thread": {"slug": "...", "title": "...", "summary_md": "...", "anchor_start_vn": 12, "anchor_end_vn": 17, "tier": "extras"}
       | {"join_slug": "existing-thread-slug"},
    "flag": ""}]}
```
`flag`: anything you could not settle from the texts, or a place the chapter itself cuts against the voice.
Write the file with Python (`json.dump(..., ensure_ascii=False, indent=1)`). Do not write anything else to disk
outside `/home/claude/s495/out/`. When done, report: chapters done, cards written, threads new / joined, flags.
