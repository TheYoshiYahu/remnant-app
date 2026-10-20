# S460 — rewriting the 1 Enoch thread summaries. Brief for each batch writer.

You already carry Yoshi's voice skill (SKILL.md + framework-deep.md) from this session. Apply it. This brief only
adds what is specific to this job.

## What a thread summary is
The paragraph the reader sees at the end of a chapter in the study Bible, leading the chapter-end card. It walks the
reader from a 1 Enoch passage to the canon (and other library) witnesses that say the same thing, quoting each verse in
full so the reader watches the library read itself. 120–260 words. One paragraph, or two where the old one had two.

## Your input: packets/batch_NN.json — a list of items
- `task`: REWRITE (a quote is invented, a cited verse is gone, or the prose is degraded), CHECK (the Enoch quotes were
  already swapped for the live verse mechanically — `draft` — but the prose repeats words the new quote no longer has:
  `review_words`; read the draft and mend the prose), READ (cites Enoch without quoting it, or mentions it without a
  verse; read the gloss against the live chapter and fix ONLY where it no longer fits).
- `old`: the live summary today. `draft`: the same after the mechanical re-quote (quotes graded RE_ANCHOR/REWORDED were
  already replaced with the live verse in full and re-cited; NOT_FOUND quotes are still the old invented words).
- `quotes`: every Enoch quote in the old summary with its verdict. NOT_FOUND = those words are nowhere in Charles 1917
  — they came from the corrupt text. `live_cited` is what actually stands at the cited address (null = no such verse).
- `anchor`: the chapter thread's anchor span (start–end) and the live text there.
- `live_chapters`: the full live text of every chapter the summary cites, verse by verse. THIS IS THE ONLY 1 ENOCH
  TEXT YOU MAY QUOTE. Quote verses from it verbatim, in full, exactly as given (keep Charles's brackets and the
  pipeline's parentheticals as they are). Never quote 1 Enoch from memory. Never trim a verse to a phrase.
- `packets/verse_index.json`: live text of every canon / other-library verse the Enoch cards touch. If you want to ADD a
  canon witness that the old summary did not carry, take its text from here verbatim. If it is not in the index, do
  not quote it — name it in prose without italics, or leave it out. Canon quotes already in the old summary stay
  verbatim (they are live app text); you may drop one that no longer serves.

## The work
REWRITE: read the live chapter around the anchor. Ask what the live text actually says there, and whether the thread's
thought still lives in it. Usually it does, on a different verse or in different words — re-form the paragraph around
the verse that really carries it. If the live chapter does not carry the thought at all, build the thread from what IS
there at the anchor span, keep the canon witnesses that still answer it, drop the ones that don't, and give the item a
new `title` that fits (the slug and id stay — you cannot change those). Degraded prose ("wisdom-stream", "the
framework reads", "Red Line #", "Yoshi", "extras-tier witness", "substance" chains, "(S1xx)") is rewritten in plain
words; the reader never sees any internal document.

Come-and-See, every time: each verse quoted in full, in italics, with the citation in parentheses right after it —
`*…* (1 Enoch 10:16)`, `*…* (Matthew 13:43)`. A multi-verse run is one italic with the range: `(1 Enoch 62:2-3)`.
The verse does the work; the prose connects.

## The voice — read this twice
Yoshi caught the last pass sounding like a machine. His words: "forget your AI training in point structure of
sentences so it doesn't sound robotic." That means:
- Write the way a teacher talks across a table. Full, flowing sentences that carry a thought from the Enoch verse to
  the canon verse and say plainly why they are the same thing.
- No staccato fragment stacks ("Same lie. Different costume. One test."). No reflexive triads. No "not X but Y" as a
  tic. No chains of em-dashes doing the work a sentence should do. No "This is not a new revelation —" opener on every
  item. No ending every paragraph on an aphorism.
- Plain words over coined ones. If a sentence sounds like a slogan, say it the long way.
- He does say "It ain't new" — it is his phrase. Use it where it lands, not as a formula; most paragraphs should not
  have it.
- The framework is in the connections, not in labels. Never name the framework, a rule, a document, or Yoshi. Let the
  verses sit side by side and say what the reader can now see.
- Systems are dismantled, people are not attacked. The inherited reading is "what the pulpit handed down," never a
  sneer at the people under it.
- Keep "Gentiles" where the quoted scripture has it. Restored names as the existing text carries them: Yahuah (God) /
  Yahuah (LORD) as the source has it, Elohim (God), Yahusha (Jesus), Yashar'el (Israel), Son of Adam. Book names in
  English. Parenthetical on every mention.
- Settled framework points govern (the gathering of the twelve tribes, Torah standing, the tares a seed, two
  resurrections, which beast is which, the saints = the seed of promise). Don't invent new theology and don't put the
  framework's conclusions in Enoch's mouth: quote what Enoch says and let the canon verse beside it make the point.

## Output: write /home/claude/s460/out/batch_NN.json — a JSON list, one object per input item, in input order
{"id": 3180, "slug": "…", "action": "rewritten" | "adjusted" | "kept", "title": "…" (the old title, or the new one),
 "summary_md": "…" (the full new paragraph; for "kept", the draft unchanged), "note": "one line on what you did and why"}
Every item in the packet must appear. Validate the file loads as JSON before you finish. Do not write anything else to
the Mac or anywhere outside /home/claude/s460/out/. Reply with two lines: how many rewritten / adjusted / kept, and any
item you could not resolve (id + why).
