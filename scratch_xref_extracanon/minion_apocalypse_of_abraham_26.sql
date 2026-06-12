-- ----- fragment: minion_apocalypseofabraham_26.sql (session253 apocalypse-of-abraham 26) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch26. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa26 (view _session253_aoa26_lookup). Sort band base 67625, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa26_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-26-terah-perished-idols
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 26, 4, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Joshua names the very Terah whose unceasing idolatry the Eternal lays before Abraham in 26:4.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 26, 4, 'canon', 'isaiah', 44, 9, 'free', E'Isaiah 44:9 — *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* The graven vanity Terah served and perished by is the same blindness the prophet unmasks, the idol that cannot save the one who makes it.'),
  -- thread: apocalypse-of-abraham-26-two-counsels-choose
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 26, 6, 'canon', 'deuteronomy', 30, 15, 'free', E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* Terah''s not choosing to listen is exactly the death-and-evil that 26:6 says he chose, while Abraham chose the life set before him.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 26, 6, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* the very ''choose to listen'' of 26:6 — Terah refused the choosing of life that Moses lays on every hearer.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 26, 6, 'canon', 'matthew', 7, 13, 'free', E'Matthew 7:13 — *Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat:* the broad way of Terah''s idols against Abraham''s refusal to follow his works in 26:6 — the same two-ways the Messiah preaches.'),
  -- thread: apocalypse-of-abraham-26-counsel-of-my-will-foreknown
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 26, 8, 'canon', 'isaiah', 46, 9, 'free', E'Isaiah 46:9 — *Remember the former things of old: for I am Elohim (God), and there is none else; I am Elohim (God), and there is none like me,* the One whose counsel of will in 26:8 is set against the dead idols of Terah, for there is none else.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 26, 8, 'canon', 'isaiah', 46, 10, 'free', E'Isaiah 46:10 — *Declaring the end from the beginning, and from ancient times the things that are not yet done, saying, My counsel shall stand, and I will do all my pleasure:* the very counsel of the Eternal''s will, ready for the coming days before Abraham can see it, in 26:8.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 26, 8, 'canon', 'romans', 8, 29, 'free', E'Romans 8:29 — *For whom he did foreknow, he also did predestinate to be conformed to the image of his Son, that he might be the firstborn among many brethren.* The counsel ready in Him before Abraham''s knowledge (26:8) is the same foreknowing purpose that goes before the elect.'),
  -- thread: apocalypse-of-abraham-26-seed-in-the-picture
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 26, 9, 'canon', 'genesis', 15, 5, 'free', E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* The ''look in the picture'' of the seed in 26:9 is the same showing of Abraham''s innumerable seed, here pictured rather than told in stars.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 26, 9, 'canon', 'genesis', 25, 23, 'free', E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* The two peoples Abraham beholds in the picture (26:9) are foretold from the womb — election dividing the seed before any work is done.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 26, 9, 'canon', 'romans', 9, 11, 'free', E'Romans 9:11 — *(For the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth;)* the seed shown in the picture (26:9) is chosen by the standing purpose of election, not of works, the elect of Abraham kept.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa26_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa26_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-26-terah-perished-idols',
       E'Terah''s devilish idolatry, and his perishing',
       E'The Eternal answers Abraham concerning his father: *"Why did thy father Terah not listen to thy voice, and why did he not cease from the devilish idolatry until he perished, and his whole household with him?"* (Apocalypse of Abraham 26:4). It ain''t new — this is the very testimony Joshua set before the tribes at Shechem: *"Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods"* (Joshua 24:2). The idols Abraham fled were the same vanity the prophet exposed: *"They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed"* (Isaiah 44:9). Terah''s household perishes with the gods that cannot save — the system, not the man''s seed, is what is dismantled.',
       sv.verse_id, ev.verse_id, 'extras', 67625
  FROM _session253_aoa26_lookup sv, _session253_aoa26_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=26 AND sv.verse_number=4
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=26 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-26-two-counsels-choose',
       E'He did not choose to listen — the two counsels set before a man',
       E'Abraham answers that Terah''s ruin was no decree but a refusal: *"It was entirely because he did not choose to listen to me; but I, too, did not follow his works"* (Apocalypse of Abraham 26:6). This is the Torah''s own setting of life and death before every man: *"See, I have set before thee this day life and good, and death and evil"* (Deuteronomy 30:15), *"I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live"* (Deuteronomy 30:19). The Messiah set the same fork in the road: *"Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat"* (Matthew 7:13). Terah took the broad way of his idols; Abraham did not follow his father''s works — two ways, two ends, the choice honest and the Torah standing.',
       sv.verse_id, ev.verse_id, 'extras', 67628
  FROM _session253_aoa26_lookup sv, _session253_aoa26_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=26 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=26 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-26-counsel-of-my-will-foreknown',
       E'The counsel of My will, ready before thou hast knowledge',
       E'The Eternal lifts Abraham past the riddle of Terah to the surer ground of His own purpose: *"As the counsel of thy father is in him, and as thy counsel is in thee, so also is the counsel of my will in me ready for the coming days, before thou hast knowledge of these, or canst see with thine eyes what is future in them"* (Apocalypse of Abraham 26:8). It ain''t new — this is the prophet''s God who alone declares the end from the beginning: *"Remember the former things of old: for I am Elohim (God), and there is none else; I am Elohim (God), and there is none like me"* (Isaiah 46:9), *"Declaring the end from the beginning, and from ancient times the things that are not yet done, saying, My counsel shall stand, and I will do all my pleasure"* (Isaiah 46:10). Paul carries the same standing counsel of election: *"For whom he did foreknow, he also did predestinate to be conformed to the image of his Son, that he might be the firstborn among many brethren"* (Romans 8:29). The counsel of His will is ready before Abraham knows it — the purpose stands of Him that calleth.',
       sv.verse_id, ev.verse_id, 'extras', 67631
  FROM _session253_aoa26_lookup sv, _session253_aoa26_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=26 AND sv.verse_number=8
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=26 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-26-seed-in-the-picture',
       E'Look in the picture — those of thy seed',
       E'The chapter closes with the showing of the seed: *"How those of thy seed will be, look in the picture"* (Apocalypse of Abraham 26:9). This is the night the Eternal first brought Abraham out to number the seed: *"And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be"* (Genesis 15:5) — there he was bidden look up, here bidden look in the picture. And the seed shown is the two peoples already promised in the womb: *"And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger"* (Genesis 25:23). The election precedes the doing: *"(For the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth;)"* (Romans 9:11). What Abraham beholds in the picture is the chosen seed — Israel kept, not a people replacing it.',
       sv.verse_id, ev.verse_id, 'extras', 67634
  FROM _session253_aoa26_lookup sv, _session253_aoa26_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=26 AND sv.verse_number=9
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=26 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-26-terah-perished-idols
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Joshua names the very Terah whose unceasing idolatry the Eternal lays before Abraham in 26:4.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa26_lookup sv, _session253_aoa26_lookup tv
 WHERE t.slug='apocalypse-of-abraham-26-terah-perished-idols'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=26 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 44:9 — *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* The graven vanity Terah served and perished by is the same blindness the prophet unmasks, the idol that cannot save the one who makes it.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa26_lookup sv, _session253_aoa26_lookup tv
 WHERE t.slug='apocalypse-of-abraham-26-terah-perished-idols'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=26 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-26-two-counsels-choose
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* Terah''s not choosing to listen is exactly the death-and-evil that 26:6 says he chose, while Abraham chose the life set before him.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa26_lookup sv, _session253_aoa26_lookup tv
 WHERE t.slug='apocalypse-of-abraham-26-two-counsels-choose'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=26 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* the very ''choose to listen'' of 26:6 — Terah refused the choosing of life that Moses lays on every hearer.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa26_lookup sv, _session253_aoa26_lookup tv
 WHERE t.slug='apocalypse-of-abraham-26-two-counsels-choose'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=26 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 7:13 — *Enter ye in at the strait gate: for wide is the gate, and broad is the way, that leadeth to destruction, and many there be which go in thereat:* the broad way of Terah''s idols against Abraham''s refusal to follow his works in 26:6 — the same two-ways the Messiah preaches.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa26_lookup sv, _session253_aoa26_lookup tv
 WHERE t.slug='apocalypse-of-abraham-26-two-counsels-choose'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=26 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-26-counsel-of-my-will-foreknown
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 46:9 — *Remember the former things of old: for I am Elohim (God), and there is none else; I am Elohim (God), and there is none like me,* the One whose counsel of will in 26:8 is set against the dead idols of Terah, for there is none else.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa26_lookup sv, _session253_aoa26_lookup tv
 WHERE t.slug='apocalypse-of-abraham-26-counsel-of-my-will-foreknown'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=26 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=46 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 46:10 — *Declaring the end from the beginning, and from ancient times the things that are not yet done, saying, My counsel shall stand, and I will do all my pleasure:* the very counsel of the Eternal''s will, ready for the coming days before Abraham can see it, in 26:8.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa26_lookup sv, _session253_aoa26_lookup tv
 WHERE t.slug='apocalypse-of-abraham-26-counsel-of-my-will-foreknown'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=26 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=46 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 8:29 — *For whom he did foreknow, he also did predestinate to be conformed to the image of his Son, that he might be the firstborn among many brethren.* The counsel ready in Him before Abraham''s knowledge (26:8) is the same foreknowing purpose that goes before the elect.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa26_lookup sv, _session253_aoa26_lookup tv
 WHERE t.slug='apocalypse-of-abraham-26-counsel-of-my-will-foreknown'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=26 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-26-seed-in-the-picture
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* The ''look in the picture'' of the seed in 26:9 is the same showing of Abraham''s innumerable seed, here pictured rather than told in stars.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa26_lookup sv, _session253_aoa26_lookup tv
 WHERE t.slug='apocalypse-of-abraham-26-seed-in-the-picture'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=26 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 25:23 — *And Yahuah (LORD) said unto her, Two nations are in thy womb, and two manner of people shall be separated from thy bowels; and the one people shall be stronger than the other people; and the elder shall serve the younger.* The two peoples Abraham beholds in the picture (26:9) are foretold from the womb — election dividing the seed before any work is done.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa26_lookup sv, _session253_aoa26_lookup tv
 WHERE t.slug='apocalypse-of-abraham-26-seed-in-the-picture'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=26 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=25 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 9:11 — *(For the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth;)* the seed shown in the picture (26:9) is chosen by the standing purpose of election, not of works, the elect of Abraham kept.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa26_lookup sv, _session253_aoa26_lookup tv
 WHERE t.slug='apocalypse-of-abraham-26-seed-in-the-picture'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=26 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

