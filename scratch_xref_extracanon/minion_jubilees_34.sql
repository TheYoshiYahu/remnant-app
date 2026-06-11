-- ----- fragment: minion_jubilees_34.sql (session251 jubilees 34) -----
-- Source anchor: jubilees/jubilees ch34. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju34 (view _session251_ju34_lookup). Sort band base 53825, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju34_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-34-amorite-kings-sword-and-bow
  ('jubilees', 'jubilees', 34, 2, 'canon', 'genesis', 48, 22, 'free', E'Genesis 48:22 — *Moreover I have given to thee one portion above thy brethren, which I took out of the hand of the Amorite with my sword and with my bow.* Jacob''s dying word names the Amorite war by sword and bow that Jubilees 34:2-6 narrates in full.'),
  ('jubilees', 'jubilees', 34, 6, 'canon', 'genesis', 48, 21, 'free', E'Genesis 48:21 — *And Yashar''el (Israel) said unto Joseph, Behold, I die: but Elohim (God) shall be with you, and bring you again unto the land of your fathers.* The same Jacob who slew the Amorites in the pastures of Shechem (Jubilees 34:6) blesses Joseph with the portion he won there.'),
  -- thread: jubilees-34-joseph-sold-into-egypt
  ('jubilees', 'jubilees', 34, 11, 'canon', 'genesis', 37, 28, 'free', E'Genesis 37:28 — *Then there passed by Midianites merchantmen; and they drew and lifted up Joseph out of the pit, and sold Joseph to the Ishmeelites for twenty pieces of silver: and they brought Joseph into Egypt.* The sale to the Ishmaelite merchants of Jubilees 34:11 is the very act Genesis records, twenty pieces of silver and all.'),
  ('jubilees', 'jubilees', 34, 11, 'canon', 'genesis', 37, 27, 'free', E'Genesis 37:27 — *Come, and let us sell him to the Ishmeelites, and let not our hand be upon him; for he is our brother and our flesh. And his brethren were content.* This is the change of mind from murder to sale that Jubilees 34:11 compresses into ''changing their minds, they sold him to Ishmaelite merchants.'''),
  ('jubilees', 'jubilees', 34, 11, 'canon', 'acts', 7, 9, 'free', E'Acts 7:9 — *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him.* Stephen names the envy beneath the treachery of Jubilees 34:11 and answers it with the refrain that Elohim was with the one cast down.'),
  ('jubilees', 'jubilees', 34, 10, 'canon', 'psalms', 105, 17, 'free', E'Psalm 105:17 — *He sent a man before them, even Joseph, who was sold for a servant.* The errand to his brothers in Jubilees 34:10 is, in the Psalmist''s reading, Yahuah sending a man ahead to save the house — the righteous one raised from the pit, a Messiah type.'),
  -- thread: jubilees-34-bloodied-coat-jacob-mourns
  ('jubilees', 'jubilees', 34, 11, 'canon', 'genesis', 37, 31, 'free', E'Genesis 37:31 — *And they took Joseph''s coat, and killed a kid of the goats, and dipped the coat in the blood.* The slaughtered kid and the dipped coat of Jubilees 34:11 match Genesis stitch for stitch.'),
  ('jubilees', 'jubilees', 34, 13, 'canon', 'genesis', 37, 33, 'free', E'Genesis 37:33 — *And he knew it, and said, It is my son''s coat; an evil beast hath devoured him; Joseph is without doubt rent in pieces.* Jacob''s word ''An evil beast has devoured Joseph'' in Jubilees 34:13 is the same cry Genesis puts in his mouth over the bloodied coat.'),
  ('jubilees', 'jubilees', 34, 14, 'canon', 'genesis', 37, 35, 'free', E'Genesis 37:35 — *And all his sons and all his daughters rose up to comfort him; but he refused to be comforted; and he said, For I will go down into the grave unto my son mourning. Thus his father wept for him.* The sons and daughter who rise to comfort him and the father who refuses in Jubilees 34:14 are drawn straight from this verse.'),
  ('jubilees', 'jubilees', 34, 16, 'canon', 'genesis', 37, 35, 'free', E'Genesis 37:35 — *And all his sons and all his daughters rose up to comfort him; but he refused to be comforted; and he said, For I will go down into the grave unto my son mourning. Thus his father wept for him.* Jacob''s vow in Jubilees 34:16, ''Let me go down to the grave mourning for my son,'' echoes Genesis word for word.'),
  -- thread: jubilees-34-yom-kippur-grounded-in-jacobs-mourning
  ('jubilees', 'jubilees', 34, 18, 'canon', 'leviticus', 16, 29, 'free', E'Leviticus 16:29 — *And this shall be a statute for ever unto you: that in the seventh month, on the tenth day of the month, ye shall afflict your souls, and do no work at all, whether it be one of your own country, or a stranger that sojourneth among you.* The very date and the affliction Jubilees 34:18 ordains is the eternal Yom Kippur statute of the Torah.'),
  ('jubilees', 'jubilees', 34, 18, 'canon', 'leviticus', 16, 30, 'free', E'Leviticus 16:30 — *For on that day shall the priest make an atonement for you, to cleanse you, that ye may be clean from all your sins before Yahuah (LORD).* The ''atonement... for their sins'' of Jubilees 34:18 is this cleansing-from-all-sins of the Day of Atonement.'),
  ('jubilees', 'jubilees', 34, 18, 'canon', 'leviticus', 23, 27, 'free', E'Leviticus 23:27 — *Also on the tenth day of this seventh month there shall be a day of atonement: it shall be an holy convocation unto you; and ye shall afflict your souls, and offer an offering made by fire unto Yahuah (LORD).* Leviticus names the tenth of the seventh month a day of atonement — the appointed time Jubilees 34:18 grounds in the patriarchs, not a late invention.'),
  ('jubilees', 'jubilees', 34, 19, 'canon', 'leviticus', 23, 29, 'free', E'Leviticus 23:29 — *For whatsoever soul it be that shall not be afflicted in that same day, he shall be cut off from among his people.* The grief and cleansing ''once a year'' that Jubilees 34:19 ordains carries the same weight the Torah gives the affliction of this day.'),
  -- thread: jubilees-34-the-wives-seed-kept-holy
  ('jubilees', 'jubilees', 34, 19, 'canon', 'genesis', 24, 3, 'free', E'Genesis 24:3 — *And I will make thee swear by Yahuah (LORD), the Elohim (God) of heaven, and the Elohim (God) of the earth, that thou shalt not take a wife unto my son of the daughters of the Canaanites, among whom I dwell.* Abraham''s oath frames Jubilees 34:19''s careful naming of which wives were Canaanite and which were of the line of Terah.'),
  ('jubilees', 'jubilees', 34, 19, 'canon', 'genesis', 28, 1, 'free', E'Genesis 28:1 — *And Isaac called Jacob, and blessed him, and charged him, and said unto him, Thou shalt not take a wife of the daughters of Canaan.* Isaac''s charge to Jacob is the seed-kept concern that the wife-roster of Jubilees 34:19 quietly measures.'),
  ('jubilees', 'jubilees', 34, 21, 'jubilees', 'jubilees', 30, 11, 'extras', E'Jubilees 30:11 — *And do you, Moses, command the children of Yashar''el (Israel) and exhort them not to give their daughters to the nations, and not to take for their sons any of the daughters of the nations, for this is abominable before Yahuah (God)...* Simeon''s repentance and second wife from Mesopotamia in Jubilees 34:21 turns back toward this law of the kept seed, written on the heavenly tablets.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju34_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju34_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-34-amorite-kings-sword-and-bow',
       E'The seven Amorite kings — the portion taken by sword and bow',
       E'Jubilees opens this chapter with a war Genesis names only in passing: *And the seven kings of the Amorites assembled themselves together against them, to slay them, hiding themselves under the trees, and to take their cattle as a prey* (Jubilees 34:2). Jacob arms his house — *he and his three sons and all the servants of his father, and his own servants, and he went against them with six thousand men, who carried swords. And he slew them in the pastures of Shechem* (Jubilees 34:6). This is the hidden backstory behind Jacob''s deathbed word to Joseph, *Moreover I have given to thee one portion above thy brethren, which I took out of the hand of the Amorite with my sword and with my bow* (Genesis 48:22). It ain''t new — Jubilees fills in the very battle Genesis presumes its readers already know.',
       sv.verse_id, ev.verse_id, 'extras', 53825
  FROM _session251_ju34_lookup sv, _session251_ju34_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=34 AND sv.verse_number=2
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=34 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-34-joseph-sold-into-egypt',
       E'Joseph sold into Egypt — the patriarchs moved with envy',
       E'Jubilees compresses the whole of Genesis 37 into a single verse: *And they dealt treacherously with him, and formed a plot against him to slay him, but changing their minds, they sold him to Ishmaelite merchants, and they brought him down into Egypt, and they sold him to Potiphar* (Jubilees 34:11). Genesis tells it slowly — *Come, and let us sell him to the Ishmeelites, and let not our hand be upon him; for he is our brother and our flesh. And his brethren were content* (Genesis 37:27), and *they drew and lifted up Joseph out of the pit, and sold Joseph to the Ishmeelites for twenty pieces of silver: and they brought Joseph into Egypt* (Genesis 37:28). Stephen reads the meaning aloud before the council — *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him* (Acts 7:9) — and the Psalmist sings it as the hand of Yahuah turning evil to deliverance: *He sent a man before them, even Joseph, who was sold for a servant* (Psalm 105:17). The righteous one cast down into the pit and raised to save many is a Messiah type, and it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53828
  FROM _session251_ju34_lookup sv, _session251_ju34_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=34 AND sv.verse_number=10
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=34 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-34-bloodied-coat-jacob-mourns',
       E'The bloodied coat and Jacob''s refusal to be comforted',
       E'The brothers stage the lie exactly as Genesis tells it: *And the sons of Jacob slaughtered a kid, and dipped the coat of Joseph in the blood, and sent (it) to Jacob their father* (Jubilees 34:11) — *And they took Joseph''s coat, and killed a kid of the goats, and dipped the coat in the blood* (Genesis 37:31). Jacob''s grief in Jubilees, *An evil beast has devoured Joseph* (Jubilees 34:13), is the very cry Genesis records: *It is my son''s coat; an evil beast hath devoured him; Joseph is without doubt rent in pieces* (Genesis 37:33). And the father who *refused to be comforted for his son* (Jubilees 34:14) is the same broken Jacob of *but he refused to be comforted; and he said, For I will go down into the grave unto my son mourning* (Genesis 37:35). It ain''t new — the retelling sits exactly atop its source.',
       sv.verse_id, ev.verse_id, 'extras', 53831
  FROM _session251_ju34_lookup sv, _session251_ju34_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=34 AND sv.verse_number=11
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=34 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-34-yom-kippur-grounded-in-jacobs-mourning',
       E'The Day of Atonement grounded in Jacob''s mourning — it ain''t new',
       E'Here is Jubilees'' signature move: the tenth of the seventh month, the day the bloodied coat reached Jacob, becomes the eternal Day of Atonement. *For this reason it is ordained for the children of Yashar''el (Israel) that they should afflict themselves on the tenth of the seventh month... that they should make atonement for themselves thereon with a young goat on the tenth of the seventh month, once a year, for their sins* (Jubilees 34:18). The feast is not a later Jewish invention — Jubilees roots it in the patriarchs and the heavenly tablets, the same statute Leviticus engraves: *And this shall be a statute for ever unto you: that in the seventh month, on the tenth day of the month, ye shall afflict your souls* (Leviticus 16:29), *For on that day shall the priest make an atonement for you, to cleanse you, that ye may be clean from all your sins before Yahuah (LORD)* (Leviticus 16:30), and *Also on the tenth day of this seventh month there shall be a day of atonement: it shall be an holy convocation unto you; and ye shall afflict your souls* (Leviticus 23:27). The young goat, the affliction, the once-a-year cleansing — Jubilees 34:19 says they cleanse themselves ''on that day once a year'' — all of it is Yom Kippur, kept from the fathers forward. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53834
  FROM _session251_ju34_lookup sv, _session251_ju34_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=34 AND sv.verse_number=18
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=34 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-34-the-wives-seed-kept-holy',
       E'The wives of the twelve — the seed kept, the nations warned off',
       E'Jubilees closes by naming the wives of Jacob''s sons: *the name of Levi''s wife is Mêlkâ, of the daughters of Aram, of the seed of the sons of Terah... and the name of Joseph''s wife, Asenath, the Egyptian* (Jubilees 34:19), and *And Simeon repented, and took a second wife from Mesopotamia as his brothers* (Jubilees 34:21). The roster is not idle genealogy — it marks who married within the line of Terah and who took Canaanite wives, the very concern the patriarchs guarded: *that thou shalt not take a wife unto my son of the daughters of the Canaanites, among whom I dwell* (Genesis 24:3), and *Thou shalt not take a wife of the daughters of Canaan* (Genesis 28:1). Jubilees itself makes the law explicit and writes it on the heavenly tablets — *And do you, Moses, command the children of Yashar''el (Israel)... not to give their daughters to the nations, and not to take for their sons any of the daughters of the nations, for this is abominable before Yahuah (God)* (Jubilees 30:11). This is the framework''s paternal-seed separation — election keeping the seed holy, not racism, not a church replacing Israel. Simeon''s repentance and second wife from Mesopotamia is the line turning back toward the kept seed.',
       sv.verse_id, ev.verse_id, 'extras', 53837
  FROM _session251_ju34_lookup sv, _session251_ju34_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=34 AND sv.verse_number=19
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=34 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-34-amorite-kings-sword-and-bow
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 48:22 — *Moreover I have given to thee one portion above thy brethren, which I took out of the hand of the Amorite with my sword and with my bow.* Jacob''s dying word names the Amorite war by sword and bow that Jubilees 34:2-6 narrates in full.'
  FROM cross_reference_threads t, cross_references x, _session251_ju34_lookup sv, _session251_ju34_lookup tv
 WHERE t.slug='jubilees-34-amorite-kings-sword-and-bow'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=34 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=48 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 48:21 — *And Yashar''el (Israel) said unto Joseph, Behold, I die: but Elohim (God) shall be with you, and bring you again unto the land of your fathers.* The same Jacob who slew the Amorites in the pastures of Shechem (Jubilees 34:6) blesses Joseph with the portion he won there.'
  FROM cross_reference_threads t, cross_references x, _session251_ju34_lookup sv, _session251_ju34_lookup tv
 WHERE t.slug='jubilees-34-amorite-kings-sword-and-bow'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=34 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=48 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-34-joseph-sold-into-egypt
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 37:28 — *Then there passed by Midianites merchantmen; and they drew and lifted up Joseph out of the pit, and sold Joseph to the Ishmeelites for twenty pieces of silver: and they brought Joseph into Egypt.* The sale to the Ishmaelite merchants of Jubilees 34:11 is the very act Genesis records, twenty pieces of silver and all.'
  FROM cross_reference_threads t, cross_references x, _session251_ju34_lookup sv, _session251_ju34_lookup tv
 WHERE t.slug='jubilees-34-joseph-sold-into-egypt'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=34 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 37:27 — *Come, and let us sell him to the Ishmeelites, and let not our hand be upon him; for he is our brother and our flesh. And his brethren were content.* This is the change of mind from murder to sale that Jubilees 34:11 compresses into ''changing their minds, they sold him to Ishmaelite merchants.'''
  FROM cross_reference_threads t, cross_references x, _session251_ju34_lookup sv, _session251_ju34_lookup tv
 WHERE t.slug='jubilees-34-joseph-sold-into-egypt'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=34 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:9 — *And the patriarchs, moved with envy, sold Joseph into Egypt: but Elohim (God) was with him.* Stephen names the envy beneath the treachery of Jubilees 34:11 and answers it with the refrain that Elohim was with the one cast down.'
  FROM cross_reference_threads t, cross_references x, _session251_ju34_lookup sv, _session251_ju34_lookup tv
 WHERE t.slug='jubilees-34-joseph-sold-into-egypt'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=34 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 105:17 — *He sent a man before them, even Joseph, who was sold for a servant.* The errand to his brothers in Jubilees 34:10 is, in the Psalmist''s reading, Yahuah sending a man ahead to save the house — the righteous one raised from the pit, a Messiah type.'
  FROM cross_reference_threads t, cross_references x, _session251_ju34_lookup sv, _session251_ju34_lookup tv
 WHERE t.slug='jubilees-34-joseph-sold-into-egypt'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=34 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-34-bloodied-coat-jacob-mourns
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 37:31 — *And they took Joseph''s coat, and killed a kid of the goats, and dipped the coat in the blood.* The slaughtered kid and the dipped coat of Jubilees 34:11 match Genesis stitch for stitch.'
  FROM cross_reference_threads t, cross_references x, _session251_ju34_lookup sv, _session251_ju34_lookup tv
 WHERE t.slug='jubilees-34-bloodied-coat-jacob-mourns'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=34 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 37:33 — *And he knew it, and said, It is my son''s coat; an evil beast hath devoured him; Joseph is without doubt rent in pieces.* Jacob''s word ''An evil beast has devoured Joseph'' in Jubilees 34:13 is the same cry Genesis puts in his mouth over the bloodied coat.'
  FROM cross_reference_threads t, cross_references x, _session251_ju34_lookup sv, _session251_ju34_lookup tv
 WHERE t.slug='jubilees-34-bloodied-coat-jacob-mourns'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=34 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 37:35 — *And all his sons and all his daughters rose up to comfort him; but he refused to be comforted; and he said, For I will go down into the grave unto my son mourning. Thus his father wept for him.* The sons and daughter who rise to comfort him and the father who refuses in Jubilees 34:14 are drawn straight from this verse.'
  FROM cross_reference_threads t, cross_references x, _session251_ju34_lookup sv, _session251_ju34_lookup tv
 WHERE t.slug='jubilees-34-bloodied-coat-jacob-mourns'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=34 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 37:35 — *And all his sons and all his daughters rose up to comfort him; but he refused to be comforted; and he said, For I will go down into the grave unto my son mourning. Thus his father wept for him.* Jacob''s vow in Jubilees 34:16, ''Let me go down to the grave mourning for my son,'' echoes Genesis word for word.'
  FROM cross_reference_threads t, cross_references x, _session251_ju34_lookup sv, _session251_ju34_lookup tv
 WHERE t.slug='jubilees-34-bloodied-coat-jacob-mourns'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=34 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=37 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-34-yom-kippur-grounded-in-jacobs-mourning
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 16:29 — *And this shall be a statute for ever unto you: that in the seventh month, on the tenth day of the month, ye shall afflict your souls, and do no work at all, whether it be one of your own country, or a stranger that sojourneth among you.* The very date and the affliction Jubilees 34:18 ordains is the eternal Yom Kippur statute of the Torah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju34_lookup sv, _session251_ju34_lookup tv
 WHERE t.slug='jubilees-34-yom-kippur-grounded-in-jacobs-mourning'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=34 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 16:30 — *For on that day shall the priest make an atonement for you, to cleanse you, that ye may be clean from all your sins before Yahuah (LORD).* The ''atonement... for their sins'' of Jubilees 34:18 is this cleansing-from-all-sins of the Day of Atonement.'
  FROM cross_reference_threads t, cross_references x, _session251_ju34_lookup sv, _session251_ju34_lookup tv
 WHERE t.slug='jubilees-34-yom-kippur-grounded-in-jacobs-mourning'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=34 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 23:27 — *Also on the tenth day of this seventh month there shall be a day of atonement: it shall be an holy convocation unto you; and ye shall afflict your souls, and offer an offering made by fire unto Yahuah (LORD).* Leviticus names the tenth of the seventh month a day of atonement — the appointed time Jubilees 34:18 grounds in the patriarchs, not a late invention.'
  FROM cross_reference_threads t, cross_references x, _session251_ju34_lookup sv, _session251_ju34_lookup tv
 WHERE t.slug='jubilees-34-yom-kippur-grounded-in-jacobs-mourning'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=34 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 23:29 — *For whatsoever soul it be that shall not be afflicted in that same day, he shall be cut off from among his people.* The grief and cleansing ''once a year'' that Jubilees 34:19 ordains carries the same weight the Torah gives the affliction of this day.'
  FROM cross_reference_threads t, cross_references x, _session251_ju34_lookup sv, _session251_ju34_lookup tv
 WHERE t.slug='jubilees-34-yom-kippur-grounded-in-jacobs-mourning'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=34 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-34-the-wives-seed-kept-holy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 24:3 — *And I will make thee swear by Yahuah (LORD), the Elohim (God) of heaven, and the Elohim (God) of the earth, that thou shalt not take a wife unto my son of the daughters of the Canaanites, among whom I dwell.* Abraham''s oath frames Jubilees 34:19''s careful naming of which wives were Canaanite and which were of the line of Terah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju34_lookup sv, _session251_ju34_lookup tv
 WHERE t.slug='jubilees-34-the-wives-seed-kept-holy'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=34 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 28:1 — *And Isaac called Jacob, and blessed him, and charged him, and said unto him, Thou shalt not take a wife of the daughters of Canaan.* Isaac''s charge to Jacob is the seed-kept concern that the wife-roster of Jubilees 34:19 quietly measures.'
  FROM cross_reference_threads t, cross_references x, _session251_ju34_lookup sv, _session251_ju34_lookup tv
 WHERE t.slug='jubilees-34-the-wives-seed-kept-holy'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=34 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 30:11 — *And do you, Moses, command the children of Yashar''el (Israel) and exhort them not to give their daughters to the nations, and not to take for their sons any of the daughters of the nations, for this is abominable before Yahuah (God)...* Simeon''s repentance and second wife from Mesopotamia in Jubilees 34:21 turns back toward this law of the kept seed, written on the heavenly tablets.'
  FROM cross_reference_threads t, cross_references x, _session251_ju34_lookup sv, _session251_ju34_lookup tv
 WHERE t.slug='jubilees-34-the-wives-seed-kept-holy'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=34 AND sv.verse_number=21
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=30 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

