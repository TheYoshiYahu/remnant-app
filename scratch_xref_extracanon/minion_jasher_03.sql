-- ----- fragment: minion_jasher_03.sql (session252 jasher 3) -----
-- Source anchor: jasher/jasher ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja03 (view _session252_ja03_lookup). Sort band base 55050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-3-enoch-walked-with-elohim
  ('jasher', 'jasher', 3, 1, 'canon', 'genesis', 5, 21, 'free', E'Genesis 5:21 — *And Enoch lived sixty and five years, and begat Methuselah:* the exact age and birth Jasher 3:1 opens with, retelling the Genesis seed-line.'),
  ('jasher', 'jasher', 3, 1, 'canon', 'genesis', 5, 22, 'free', E'Genesis 5:22 — *And Enoch walked with Elohim (God) after he begat Methuselah three hundred years, and begat sons and daughters:* the walk Jasher 3:1 echoes, Enoch serving Yahuah and despising the evil ways of men.'),
  ('jasher', 'jasher', 3, 1, 'canon', 'genesis', 5, 18, 'free', E'Genesis 5:18 — *And Jared lived an hundred sixty and two years, and he begat Enoch:* the father whose son Jasher 3 expands, tracing Adam→Seth→Enoch through the chosen line.'),
  ('jasher', 'jasher', 3, 1, 'jubilees', 'jubilees', 4, 16, 'extras', E'Jubilees 4:16 — *And in the eleventh jubilee Jared took to himself a wife... and she bare him a son in the fifth week, in the fourth year of the jubilee, and he called his name Enoch.* the same patriarchal birth Jasher 3:1 records, both tracing the seed-line generation by generation.'),
  -- thread: jasher-3-enoch-the-teacher-scribe
  ('jasher', 'jasher', 3, 2, 'enoch', '1-enoch', 12, 1, 'extras', E'1 Enoch 12:1 — *Before these things Enoch was hidden, and no one of the children of men knew where he was hidden, and where he abode, and what had become of him.* the same withdrawal Jasher 3:2 describes when Enoch secreted himself from men for many days.'),
  ('jasher', 'jasher', 3, 5, 'enoch', '1-enoch', 12, 3, 'extras', E'1 Enoch 12:3 — *And I Enoch was blessing Yahuah (God) of majesty and the King of the ages, and lo! the Watchers called me—Enoch the scribe—and said to me:* the teaching, righteous-scribe Enoch Jasher 3:5 sends out to instruct the sons of men.'),
  ('jasher', 'jasher', 3, 8, 'jubilees', 'jubilees', 4, 17, 'extras', E'Jubilees 4:17 — *And he was the first among men that are born on earth who learnt writing and knowledge and wisdom... And he was the first to write a testimony, and he testified to the sons of men among the generations of the earth* the wisdom Jasher 3:8 says the spirit of Elohim gave Enoch to teach all his men.'),
  ('jasher', 'jasher', 3, 8, 'apocrypha', 'ecclesiasticus', 44, 16, 'extras', E'Ecclesiasticus 44:16 — *Enoch pleased Yahuah (God), and was translated, being an example of repentance to all generations.* the teacher of righteousness Jasher 3:8 portrays, set down as an example for every generation.'),
  -- thread: jasher-3-enoch-reigned-righteous-king
  ('jasher', 'jasher', 3, 9, 'apocrypha', 'ecclesiasticus', 44, 3, 'extras', E'Ecclesiasticus 44:3 — *Such as did bear rule in their kingdoms, men renowned for their power, giving counsel by their understanding, and declaring prophecies:* the wise fathers the kings sought, as Jasher 3:9 has the kings come to Enoch''s wisdom and ask him to reign.'),
  ('jasher', 'jasher', 3, 12, 'apocrypha', 'ecclesiasticus', 44, 10, 'extras', E'Ecclesiasticus 44:10 — *But these were merciful men, whose righteousness has not been forgotten.* the justice and righteousness Jasher 3:12 says Enoch did with all his people through his reign.'),
  ('jasher', 'jasher', 3, 12, 'apocrypha', 'ecclesiasticus', 44, 11, 'extras', E'Ecclesiasticus 44:11 — *With their seed shall continually remain a good inheritance, and their children are within the covenant.* the covenant seed-line whose righteous reign Jasher 3:12 carries forward in the ways of Yahuah.'),
  -- thread: jasher-3-adam-died-tree-of-knowledge
  ('jasher', 'jasher', 3, 14, 'canon', 'genesis', 5, 5, 'free', E'Genesis 5:5 — *And all the days that Adam lived were nine hundred and thirty years: and he died.* the exact age Jasher 3:14 gives for Adam''s death during Enoch''s reign.'),
  ('jasher', 'jasher', 3, 16, 'jubilees', 'jubilees', 4, 30, 'extras', E'Jubilees 4:30 — *And he lacked seventy years of one thousand years; for one thousand years are as one day in the testimony of the heavens and therefore was it written concerning the tree of knowledge: "On the day that you eat thereof you will die."* the very tree-of-knowledge death Jasher 3:16 names as the cause of Adam''s dying.'),
  ('jasher', 'jasher', 3, 14, 'jubilees', 'jubilees', 4, 29, 'extras', E'Jubilees 4:29 — *And at the close of the nineteenth jubilee... Adam died, and all his sons buried him in the land of his creation, and he was the first to be buried in the earth.* the burial Jasher 3:14 records with Enoch and Methuselah laying Adam in the cave with great pomp.'),
  -- thread: jasher-3-enoch-translated-taken-up
  ('jasher', 'jasher', 3, 36, 'canon', 'genesis', 5, 24, 'free', E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* the five-word canon source Jasher 3:36 unfolds into Enoch''s ascent in a whirlwind with chariots of fire.'),
  ('jasher', 'jasher', 3, 36, 'canon', 'hebrews', 11, 5, 'free', E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* the translation Jasher 3:36 narrates, read as faith in the Renewed Covenant.'),
  ('jasher', 'jasher', 3, 36, 'enoch', '1-enoch', 14, 3, 'extras', E'1 Enoch 14:3 — *And I Enoch was carried off in a whirlwind, with a chariot of fire, and the wind lifted me up and bore me into the ends of heaven.* the very whirlwind and chariot of fire Jasher 3:36 gives for Enoch''s ascent, told by Enoch himself.'),
  ('jasher', 'jasher', 3, 23, 'jubilees', 'jubilees', 4, 23, 'extras', E'Jubilees 4:23 — *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour, and behold there he writes down the condemnation and judgment of the world* the taking-up Jasher 3:23 sets in motion when the angel calls Enoch to reign in heaven.'),
  ('jasher', 'jasher', 3, 36, 'enoch', '1-enoch', 70, 1, 'extras', E'1 Enoch 70:1 — *And it came to pass after this that my spirit was translated And it ascended into the heavens: And I saw the holy sons of Elohim (God). They were stepping on flames of fire... And their faces shone like snow.* the heavenly translation Jasher 3:36 records, even the snow Jasher 3:38 finds at the place of his ascent.'),
  -- thread: jasher-3-enoch-prophesied-judgment
  ('jasher', 'jasher', 3, 26, 'canon', 'jude', 1, 14, 'free', E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints,* the prophetic Enoch whose final statutes and judgments Jasher 3:26 has him place before the sons of men.'),
  ('jasher', 'jasher', 3, 26, 'canon', 'jude', 1, 15, 'free', E'Jude 1:15 — *To execute judgment upon all, and to convince all that are ungodly among them of all their ungodly deeds which they have ungodly committed* the coming judgment behind the instruction Jasher 3:26 says Enoch gave for how to live upon earth.'),
  ('jasher', 'jasher', 3, 25, 'jubilees', 'jubilees', 4, 19, 'extras', E'Jubilees 4:19 — *And what was and what will be he saw in a vision of his sleep... he saw and understood everything, and wrote his testimony, and placed the testimony on earth for all the children of men and for their generations.* the parting wisdom Jasher 3:25 has Enoch leave so the sons of men may live.'),
  ('jasher', 'jasher', 3, 31, 'jubilees', 'jubilees', 4, 24, 'extras', E'Jubilees 4:24 — *he was set as a sign and that he should testify against all the children of men, that he should recount all the deeds of the generations until the day of condemnation.* the witness-to-the-generations role behind Jasher 3:31, where Enoch''s last day teaching bids all men serve Yahuah and walk in his ways.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-3-enoch-walked-with-elohim',
       E'Enoch walked with Elohim — Jasher fills in Genesis 5',
       E'Jasher opens the same line Genesis closes in a single verse: *And Enoch lived sixty-five years and he begat Methuselah; and Enoch walked with Elohim (God) after having begot Methuselah, and he served Yahuah (the Lord), and despised the evil ways of men.* (Jasher 3:1). That is Genesis spoken back almost word for word — *And Enoch lived sixty and five years, and begat Methuselah* (Genesis 5:21) and *And Enoch walked with Elohim (God) after he begat Methuselah three hundred years, and begat sons and daughters* (Genesis 5:22). Jasher is not a new tale; it is the seed-line of Genesis 5 unfolded — Jared the father named in *And Jared lived an hundred sixty and two years, and he begat Enoch* (Genesis 5:18). Jubilees keeps the very same register of the chosen line: *and she bare him a son in the fifth week, in the fourth year of the jubilee, and he called his name Enoch.* (Jubilees 4:16). It ain''t new — the walk with Elohim before the Flood, Torah lived before Sinai, is carried in three witnesses at once.',
       sv.verse_id, ev.verse_id, 'extras', 55050
  FROM _session252_ja03_lookup sv, _session252_ja03_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=3 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-3-enoch-the-teacher-scribe',
       E'Enoch the teacher and scribe — called to instruct the sons of men',
       E'Jasher gives Enoch a ministry the canon only hints at: *And the soul of Enoch was wrapped up in the instruction of Yahuah (the Lord), in knowledge and in understanding; and he wisely retired from the sons of men, and secreted himself from them for many days.* (Jasher 3:2), until an angel calls him out — *Rise, go forth from your house... and appear to the sons of men, in order that you may teach them the way in which they should go* (Jasher 3:4) — and *he went to the sons of men and taught them the ways of Yahuah (the Lord)* (Jasher 3:5). This is the Enoch the live extra-canon already knows: *And his activities had to do with the Watchers, and his days were with the holy ones.* (1 Enoch 12:2) and *the Watchers called me—Enoch the scribe* (1 Enoch 12:3). Jubilees names him the first teacher of wisdom: *And he was the first among men that are born on earth who learnt writing and knowledge and wisdom and who wrote down the signs of heaven... And he was the first to write a testimony, and he testified to the sons of men* (Jubilees 4:17). Ecclesiasticus crowns it: *Enoch pleased Yahuah (God), and was translated, being an example of repentance to all generations.* (Ecclesiasticus 44:16). Four witnesses, one Enoch — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55053
  FROM _session252_ja03_lookup sv, _session252_ja03_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=2
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=3 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-3-enoch-reigned-righteous-king',
       E'Enoch reigned in righteousness — peace throughout the earth',
       E'Jasher alone gives Enoch a kingdom: *And all the kings of the sons of men, both first and last, together with their princes and judges, came to Enoch when they heard of his wisdom... and they also required of Enoch to reign over them, to which he consented.* (Jasher 3:9), *and they made Enoch king over them* (Jasher 3:10), *and he made peace amongst them, and peace was throughout the earth during the life of Enoch.* (Jasher 3:11), *And Enoch reigned over the sons of Adam two hundred and forty-three years, and he did justice and righteousness with all his people, and he led them in the ways of Yahuah (the Lord).* (Jasher 3:12). This is the seed-line''s righteous king set against the kingdom-of-man that Nimrod will build in Jasher 8 — justice and the ways of Yahuah, not the tyrant''s tower. Ecclesiasticus names the same line of fathers who *did bear rule in their kingdoms, men renowned for their power, giving counsel by their understanding, and declaring prophecies:* (Ecclesiasticus 44:3), and binds their seed in covenant — *and their children are within the covenant.* (Ecclesiasticus 44:11). The election runs through the righteous reign, not the rebel one.',
       sv.verse_id, ev.verse_id, 'extras', 55056
  FROM _session252_ja03_lookup sv, _session252_ja03_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=9
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=3 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-3-adam-died-tree-of-knowledge',
       E'Adam died — the death foretold in the Garden',
       E'In the middle of Enoch''s reign Jasher buries the first father: *And it was in the fifty-sixth year of the life of Lamech when Adam died; nine hundred and thirty years old was he at his death* (Jasher 3:14), *And Adam died because he ate of the tree of knowledge; he and his children after him, as Yahuah Elohim (the Lord God) had spoken.* (Jasher 3:16). Genesis records the same span — *And all the days that Adam lived were nine hundred and thirty years: and he died.* (Genesis 5:5) — and names the death sentence the eating brought. Jubilees reckons it as the unkept thousand-year day: *And he lacked seventy years of one thousand years; for one thousand years are as one day... and therefore was it written concerning the tree of knowledge: "On the day that you eat thereof you will die."* (Jubilees 4:30), buried by all his sons — *And at the close of the nineteenth jubilee... Adam died, and all his sons buried him in the land of his creation, and he was the first to be buried in the earth.* (Jubilees 4:29). One death, three witnesses, the Genesis word standing exactly.',
       sv.verse_id, ev.verse_id, 'extras', 55059
  FROM _session252_ja03_lookup sv, _session252_ja03_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=14
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=3 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-3-enoch-translated-taken-up',
       E'Enoch was not, for Elohim took him — translated that he should not see death',
       E'Jasher''s whole chapter drives to the moment Genesis states in five words. An angel calls again — *behold an angel of Yahuah (the Lord) then called to Enoch from heaven, and wished to bring him up to heaven to make him reign there over the sons of Elohim* (Jasher 3:23) — and *it was upon the seventh day that Enoch ascended into heaven in a whirlwind, with horses and chariots of fire.* (Jasher 3:36). That is Genesis told long: *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* (Genesis 5:24). The Renewed Covenant reads it as faith: *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* (Hebrews 11:5). And the live 1 Enoch supplies the chariot Jasher names: *And I Enoch was carried off in a whirlwind, with a chariot of fire, and the wind lifted me up and bore me into the ends of heaven.* (1 Enoch 14:3). Jubilees seals the taking: *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour* (Jubilees 4:23). It ain''t new — the translation of Enoch is one event held by five witnesses.',
       sv.verse_id, ev.verse_id, 'extras', 55062
  FROM _session252_ja03_lookup sv, _session252_ja03_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=23
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=3 AND ev.verse_number=38
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-3-enoch-prophesied-judgment',
       E'Enoch prophesied — the seventh from Adam and the day of judgment',
       E'Before he is taken, Jasher''s Enoch gives a last charge: *And now therefore I will teach you wisdom and knowledge and will give you instruction before I leave you, how to act upon earth by which you may live* (Jasher 3:25), and *he placed before them statutes and judgments to do upon earth, and he made peace amongst them, and he taught them everlasting life* (Jasher 3:26). The Renewed Covenant remembers this Enoch as a prophet of the judgment to come: *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints,* (Jude 1:14), *To execute judgment upon all, and to convince all that are ungodly among them of all their ungodly deeds* (Jude 1:15). The live 1 Enoch is the very testimony Jude quotes — Enoch the witness who *placed the testimony on earth for all the children of men and for their generations* (Jubilees 4:19) and *should recount all the deeds of the generations until the day of condemnation.* (Jubilees 4:24). The statutes and the warning are one apparatus — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55065
  FROM _session252_ja03_lookup sv, _session252_ja03_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=24
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=3 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-3-enoch-walked-with-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:21 — *And Enoch lived sixty and five years, and begat Methuselah:* the exact age and birth Jasher 3:1 opens with, retelling the Genesis seed-line.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-walked-with-elohim'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 5:22 — *And Enoch walked with Elohim (God) after he begat Methuselah three hundred years, and begat sons and daughters:* the walk Jasher 3:1 echoes, Enoch serving Yahuah and despising the evil ways of men.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-walked-with-elohim'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 5:18 — *And Jared lived an hundred sixty and two years, and he begat Enoch:* the father whose son Jasher 3 expands, tracing Adam→Seth→Enoch through the chosen line.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-walked-with-elohim'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 4:16 — *And in the eleventh jubilee Jared took to himself a wife... and she bare him a son in the fifth week, in the fourth year of the jubilee, and he called his name Enoch.* the same patriarchal birth Jasher 3:1 records, both tracing the seed-line generation by generation.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-walked-with-elohim'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-3-enoch-the-teacher-scribe
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 12:1 — *Before these things Enoch was hidden, and no one of the children of men knew where he was hidden, and where he abode, and what had become of him.* the same withdrawal Jasher 3:2 describes when Enoch secreted himself from men for many days.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-the-teacher-scribe'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 12:3 — *And I Enoch was blessing Yahuah (God) of majesty and the King of the ages, and lo! the Watchers called me—Enoch the scribe—and said to me:* the teaching, righteous-scribe Enoch Jasher 3:5 sends out to instruct the sons of men.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-the-teacher-scribe'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:17 — *And he was the first among men that are born on earth who learnt writing and knowledge and wisdom... And he was the first to write a testimony, and he testified to the sons of men among the generations of the earth* the wisdom Jasher 3:8 says the spirit of Elohim gave Enoch to teach all his men.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-the-teacher-scribe'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 44:16 — *Enoch pleased Yahuah (God), and was translated, being an example of repentance to all generations.* the teacher of righteousness Jasher 3:8 portrays, set down as an example for every generation.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-the-teacher-scribe'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=44 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-3-enoch-reigned-righteous-king
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiasticus 44:3 — *Such as did bear rule in their kingdoms, men renowned for their power, giving counsel by their understanding, and declaring prophecies:* the wise fathers the kings sought, as Jasher 3:9 has the kings come to Enoch''s wisdom and ask him to reign.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-reigned-righteous-king'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=44 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiasticus 44:10 — *But these were merciful men, whose righteousness has not been forgotten.* the justice and righteousness Jasher 3:12 says Enoch did with all his people through his reign.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-reigned-righteous-king'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=44 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 44:11 — *With their seed shall continually remain a good inheritance, and their children are within the covenant.* the covenant seed-line whose righteous reign Jasher 3:12 carries forward in the ways of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-reigned-righteous-king'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=44 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-3-adam-died-tree-of-knowledge
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:5 — *And all the days that Adam lived were nine hundred and thirty years: and he died.* the exact age Jasher 3:14 gives for Adam''s death during Enoch''s reign.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-adam-died-tree-of-knowledge'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 4:30 — *And he lacked seventy years of one thousand years; for one thousand years are as one day in the testimony of the heavens and therefore was it written concerning the tree of knowledge: "On the day that you eat thereof you will die."* the very tree-of-knowledge death Jasher 3:16 names as the cause of Adam''s dying.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-adam-died-tree-of-knowledge'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:29 — *And at the close of the nineteenth jubilee... Adam died, and all his sons buried him in the land of his creation, and he was the first to be buried in the earth.* the burial Jasher 3:14 records with Enoch and Methuselah laying Adam in the cave with great pomp.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-adam-died-tree-of-knowledge'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=14
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-3-enoch-translated-taken-up
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* the five-word canon source Jasher 3:36 unfolds into Enoch''s ascent in a whirlwind with chariots of fire.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-translated-taken-up'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* the translation Jasher 3:36 narrates, read as faith in the Renewed Covenant.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-translated-taken-up'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 14:3 — *And I Enoch was carried off in a whirlwind, with a chariot of fire, and the wind lifted me up and bore me into the ends of heaven.* the very whirlwind and chariot of fire Jasher 3:36 gives for Enoch''s ascent, told by Enoch himself.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-translated-taken-up'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=36
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=14 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 4:23 — *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour, and behold there he writes down the condemnation and judgment of the world* the taking-up Jasher 3:23 sets in motion when the angel calls Enoch to reign in heaven.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-translated-taken-up'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=23
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 70:1 — *And it came to pass after this that my spirit was translated And it ascended into the heavens: And I saw the holy sons of Elohim (God). They were stepping on flames of fire... And their faces shone like snow.* the heavenly translation Jasher 3:36 records, even the snow Jasher 3:38 finds at the place of his ascent.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-translated-taken-up'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=36
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=70 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-3-enoch-prophesied-judgment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints,* the prophetic Enoch whose final statutes and judgments Jasher 3:26 has him place before the sons of men.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-prophesied-judgment'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jude 1:15 — *To execute judgment upon all, and to convince all that are ungodly among them of all their ungodly deeds which they have ungodly committed* the coming judgment behind the instruction Jasher 3:26 says Enoch gave for how to live upon earth.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-prophesied-judgment'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:19 — *And what was and what will be he saw in a vision of his sleep... he saw and understood everything, and wrote his testimony, and placed the testimony on earth for all the children of men and for their generations.* the parting wisdom Jasher 3:25 has Enoch leave so the sons of men may live.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-prophesied-judgment'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=25
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 4:24 — *he was set as a sign and that he should testify against all the children of men, that he should recount all the deeds of the generations until the day of condemnation.* the witness-to-the-generations role behind Jasher 3:31, where Enoch''s last day teaching bids all men serve Yahuah and walk in his ways.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-prophesied-judgment'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=31
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

