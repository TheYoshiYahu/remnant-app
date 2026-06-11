-- ----- fragment: minion_genesis_10.sql (Genesis 10) -----
-- Chapter: Genesis 10 (The Table of Nations — the seventy nations from Shem, Ham, and Japheth divided after the flood)
-- Tag: ge10   Temp view: _s301_ge10_lookup
-- Sort band: base 20225, step 3 -> threads at 20225, 20228, 20231 (3 threads)
-- Source of EVERY row: 'canon','genesis',10,v
--
-- This is a genealogical/table chapter — CURATED to 3 framework-bearing threads, NOT name-by-name.
--
-- Genesis 10 coverage:
--   v.1   (the generations of the sons of Noah — Shem, Ham, Japheth — sons born after the flood)
--        NT:     none warranted (the heading; the seed-line forward is carried elsewhere)
--        Extras: Jasher 7:1 / Jubilees 8 retell the same roster (recorded; their distinct witness is the DIVISION, THREAD 3)
--        Tanakh: 1 Chronicles 1:4 (Noah, Shem, Ham, and Japheth) — folded into THREAD 1's 1 Chron mirror
--   ★ v.2-5  (sons of Japheth; the isles of the Gentiles divided in their lands, every one after his tongue, after their families, in their nations)
--        NT:     Acts 17:26 (made of one blood all nations... determined the times... and the bounds of their habitation) — THREAD 1
--        Extras: Jubilees 9 (Japheth's portion divided by lot) — held at THREAD 3 (the division)
--        Tanakh: Deuteronomy 32:8 (divided to the nations their inheritance... set the bounds... by the number of Israel); 1 Chronicles 1:5-7 — THREAD 1
--   v.6-7  (sons of Ham; Cush, Mizraim, Phut, Canaan)
--        NT:     none warranted distinct
--        Extras: none warranted as MEMBER (rosters; THREAD 3 carries the division)
--        Tanakh: 1 Chronicles 1:8-9 (the same Ham line) — folded into THREAD 1's 1 Chron mirror
--   ★ v.8-12 (Cush begat Nimrod, a mighty one / mighty hunter before Yahuah; the beginning of his kingdom was Babel... in the land of Shinar; Nineveh built)
--        NT:     none warranted (the rebel-kingdom archetype runs through the Tanakh prophets)
--        Extras: none warranted as MEMBER (kept text-bound, no over-speculation)
--        Tanakh: Genesis 11:4 (let us build us a city and a tower... and a name); Micah 5:6 (the land of Nimrod) — THREAD 2
--   v.13-20 (Mizraim's and Canaan's lines; the border of the Canaanites; sons of Ham after their tongues, in their nations)
--        NT:     none warranted
--        Extras: none warranted distinct
--        Tanakh: 1 Chronicles 1:11-16 — folded into THREAD 1's 1 Chron mirror (v.20 refrain anchored in THREAD 1)
--   v.21-24 (Shem, father of all the children of Eber; Shem's line to Eber)
--        NT:     none warranted distinct
--        Extras: none warranted as MEMBER
--        Tanakh: 1 Chronicles 1:17-18 — folded into THREAD 1's 1 Chron mirror
--   ★ v.25   (unto Eber two sons: Peleg, for in his days was the earth divided; and Joktan)
--        NT:     none warranted
--        Extras: Jubilees 8:8 (Peleg, for in his days the children of Noah began to divide the earth); Jubilees 8:10 (divided the earth into three parts for Shem, Ham, Japheth) — THREAD 3
--        Tanakh: 1 Chronicles 1:19 (Peleg; because in his days the earth was divided) — THREAD 3
--   v.26-30 (the sons of Joktan; their dwelling)
--        NT:     none warranted
--        Extras: none warranted distinct (Jubilees 9 division held at THREAD 3 via the Peleg anchor)
--        Tanakh: 1 Chronicles 1:20-23 (the same Joktan line) — folded into THREAD 1's 1 Chron mirror
--   v.31-32 (these are the sons of Shem after their tongues, in their nations; the families of the sons of Noah... and by these were the nations divided in the earth after the flood)
--        NT:     Acts 17:26 — THREAD 1 (the summary refrain; the nations divided)
--        Extras: none warranted distinct
--        Tanakh: Deuteronomy 32:8 — THREAD 1; 1 Chronicles 1 (the whole mirror) — THREAD 1
--
-- Threads (slug — target libraries):
--   1. genesis-10-the-table-of-nations-divided-after-their-tongues-in-their-nations — NT (Acts) + Tanakh (Deuteronomy, 1 Chronicles) [free]
--   2. genesis-10-nimrod-the-mighty-hunter-and-the-beginning-of-his-kingdom-was-babel — Tanakh (Genesis, Micah) [free]
--   3. genesis-10-in-the-days-of-peleg-was-the-earth-divided — Tanakh (1 Chronicles) + Extras (Jubilees) [extras]
--
-- Framing note (nations vs seed; Deuteronomy 32:8): Genesis 10 is THE NATIONS — the Genesis-1 peoples
-- (Category 3), the world enumerated and divided "after their tongues... in their nations" (10:5,20,31,32).
-- Israel is NOT yet called; the seed of promise is not separated out until Genesis 12. So the lateral weight
-- is Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he
-- separated the sons of Adam, he set the bounds of the people according to the number of the children of
-- Yashar''el (Israel)* — the dividing of THESE nations is Yahuah''s own ordering, with Israel-yet-to-come as the
-- MEASURE of the bounds. Forward, Acts 17:26 names the same: one blood, the times appointed, the bounds of
-- their habitation. Nimrod is framed as the rebel-kingdom archetype (Babel begun -> Genesis 11 -> the "land of
-- Nimrod" of Micah), kept text-bound, no over-speculation. Peleg''s "earth divided" is the dispersion the
-- restored Jubilees expands as the division of the three portions by lot. Jubilees double-written
-- 'jubilees','jubilees'. 1 Chronicles 1 is the lateral Tanakh mirror of the whole table.

CREATE TEMP VIEW _s301_ge10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the Table of Nations divided after their tongues, in their nations
    ('canon','genesis',10,5,'canon','deuteronomy',32,8,'free',
      E'*When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8). The first dividing of the nations is recorded here: *By these were the isles of the Gentiles divided in their lands; every one after his tongue, after their families, in their nations* (Genesis 10:5). The scattering after their tongues is no accident of history — it is the El Elyon apportioning the inheritance of the nations, and the measure he sets the bounds by is the children of Yashar''el (Israel), the people not yet even called. Israel is the ruler laid across the whole Table of Nations before Israel is born.'),
    ('canon','genesis',10,32,'canon','deuteronomy',32,8,'free',
      E'*When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8). The chapter''s closing word is exactly this dividing: *These are the families of the sons of Noah, after their generations, in their nations: and by these were the nations divided in the earth after the flood* (Genesis 10:32). Mosheh''s (Moses'') song reaches back and names the hand behind it — the El Elyon separating the sons of Adam, setting the bounds by the number of Israel — so the whole Table is read as Yahuah''s deliberate ordering, not mere genealogy.'),
    ('canon','genesis',10,32,'canon','acts',17,26,'free',
      E'*And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation* (Acts 17:26). Sha''ul (Paul) at Athens preaches the Table of Nations: *by these were the nations divided in the earth after the flood* (Genesis 10:32). All the nations enumerated from Shem, Ham, and Japheth are *of one blood* — one stock from Noah, from Adam — and their dividing into their lands was Yahuah determining *the times before appointed, and the bounds of their habitation*. The dispersion of Genesis 10 is the appointed ordering Acts 17 declares.'),
    ('canon','genesis',10,5,'canon','acts',17,26,'free',
      E'*And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation* (Acts 17:26). The isles of the nations *divided in their lands; every one after his tongue, after their families, in their nations* (Genesis 10:5) are the very *bounds of their habitation* Sha''ul (Paul) names — one blood scattered to appointed places, each in its land and tongue, by the determining of Yahuah.'),
    ('canon','genesis',10,5,'canon','1-chronicles',1,5,'free',
      E'*The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras* (1 Chronicles 1:5). The chronicler opens the whole genealogy of the covenant people by reciting the Table of Nations exactly as it stands here: *The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras* (Genesis 10:2). The nations *divided in their lands... after their families, in their nations* (Genesis 10:5) are carried forward as the trunk on which the line of Yashar''el (Israel) will be numbered.'),
    ('canon','genesis',10,32,'canon','1-chronicles',1,4,'free',
      E'*Noah, Shem, Ham, and Japheth* (1 Chronicles 1:4). The chronicler sets the three fathers of all the nations at the head of his record, just as this chapter does: *These are the families of the sons of Noah... and by these were the nations divided in the earth after the flood* (Genesis 10:32). The whole Table of Nations stands behind the genealogy of the covenant people — the nations of the earth named first, before the seed of promise is drawn out from among them.'),

    -- THREAD 2: Nimrod the mighty hunter and the beginning of his kingdom was Babel
    ('canon','genesis',10,10,'canon','genesis',11,4,'free',
      E'*And they said, Go to, let us build us a city and a tower, whose top may reach unto heaven; and let us make us a name, lest we be scattered abroad upon the face of the whole earth* (Genesis 11:4). The first kingdom of the earth begins here: *And the beginning of his kingdom was Babel, and Erech, and Accad, and Calneh, in the land of Shinar* (Genesis 10:10). Babel, named as the head of Nimrod''s kingdom, is the city of the next chapter — the tower built to make a name and resist the scattering Yahuah had ordained. The mighty-hunter''s empire and the tower of Shinar are one rebellion told twice.'),
    ('canon','genesis',10,9,'canon','micah',5,6,'free',
      E'*And they shall waste the land of Assyria with the sword, and the land of Nimrod in the entrances thereof: thus shall he deliver us from the Assyrian, when he cometh into our land, and when he treadeth within our borders* (Micah 5:6). Nimrod *began to be a mighty one in the earth. He was a mighty hunter before Yahuah (LORD)* (Genesis 10:8-9), and his kingdom went out from Babel into Asshur and Nineveh (Genesis 10:11). Generations later the prophet still calls the empire of the Assyrian *the land of Nimrod* — the rebel-kingdom archetype begun here endures as the name for the oppressor Yahuah will waste, and the Deliverer is the peace against it.'),

    -- THREAD 3: in the days of Peleg was the earth divided
    ('canon','genesis',10,25,'canon','1-chronicles',1,19,'free',
      E'*And unto Eber were born two sons: the name of the one was Peleg; because in his days the earth was divided: and his brother''s name was Joktan* (1 Chronicles 1:19). The chronicler preserves the very note this chapter records: *And unto Eber were born two sons: the name of one was Peleg; for in his days was the earth divided* (Genesis 10:25). The name Peleg — division — is set as a marker in the seed-line of Shem at the moment the nations were parted into their lands, the dividing of the whole Table dated by a single birth.'),
    ('canon','genesis',10,25,'jubilees','jubilees',8,8,'extras',
      E'*And in the sixth year thereof, she bare him a son, and he called his name Peleg; for in the days when he was born the children of Noah began to divide the earth amongst themselves: for this reason he called his name Peleg* (Jubilees 8:8). The restored witness unfolds *in his days was the earth divided* (Genesis 10:25): the dividing was the sons of Noah parcelling the earth among themselves, and the child born in that hour was named for it. The terse Torah note is given its event.'),
    ('canon','genesis',10,25,'jubilees','jubilees',8,10,'extras',
      E'*And it came to pass in the beginning of the thirty-third jubilee that they divided the earth into three parts, for Shem and Ham and Japheth, according to the inheritance of each, in the first year in the first week* (Jubilees 8:10). The earth divided in Peleg''s days — *in his days was the earth divided* (Genesis 10:25) — is the parting of the whole world into three inheritances for the three sons of Noah, the three branches the Table of Nations has just enumerated. The division is by appointed lot, each father to his portion.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s301_ge10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s301_ge10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-10-the-table-of-nations-divided-after-their-tongues-in-their-nations',
       E'The Table of Nations — divided after their tongues, in their nations',
       E'Genesis 10 enumerates the whole world after the flood — the seventy nations born from Shem, Ham, and Japheth — and three times marks them as parted into their lands: *By these were the isles of the Gentiles divided in their lands; every one after his tongue, after their families, in their nations* (Genesis 10:5); and at the close, *These are the families of the sons of Noah, after their generations, in their nations: and by these were the nations divided in the earth after the flood* (Genesis 10:32). These are THE NATIONS — the peoples of the earth — and Israel is not yet called; the seed of promise will not be drawn out from among them until Genesis 12. Yet the dividing is no accident of history. Mosheh''s (Moses'') song names the hand behind it: *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8) — the El Elyon apportioned the nations, and the measure he set their bounds by is the children of Yashar''el (Israel), the people not yet even born. Israel is the ruler laid across the whole Table before Israel exists. Sha''ul (Paul) preaches the same ordering at Athens: *And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation* (Acts 17:26) — one blood, from Noah, from Adam, scattered to appointed places and times. And the chronicler of the covenant people opens his whole genealogy by reciting this very table — *Noah, Shem, Ham, and Japheth* (1 Chronicles 1:4); *The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras* (1 Chronicles 1:5) — the nations of the earth named first, the trunk from which the seed of promise will be drawn.',
       sv.verse_id, ev.verse_id, 'free', 20225
  FROM _s301_ge10_lookup sv, _s301_ge10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=10 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=10 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-10-nimrod-the-mighty-hunter-and-the-beginning-of-his-kingdom-was-babel',
       E'Nimrod the mighty hunter — and the beginning of his kingdom was Babel',
       E'Out of the line of Ham comes the first empire-builder: *And Cush begat Nimrod: he began to be a mighty one in the earth. He was a mighty hunter before Yahuah (LORD)* (Genesis 10:8-9). His was the first kingdom of the earth, and its head was Babel: *And the beginning of his kingdom was Babel, and Erech, and Accad, and Calneh, in the land of Shinar* (Genesis 10:10), and from that land it spread to build Nineveh (Genesis 10:11). Babel here is the city of the very next chapter, where the rebellion is told in full: *let us build us a city and a tower, whose top may reach unto heaven; and let us make us a name, lest we be scattered abroad upon the face of the whole earth* (Genesis 11:4) — a name raised in defiance of the scattering Yahuah had ordained over the nations. The kingdom begun here becomes the type of every rebel-empire after it; generations on, the prophet still calls the land of the Assyrian oppressor by its founder''s name: *And they shall waste the land of Assyria with the sword, and the land of Nimrod in the entrances thereof: thus shall he deliver us from the Assyrian, when he cometh into our land* (Micah 5:6). The mighty hunter''s kingdom of Babel and Shinar is the archetype Yahuah will one day waste — and the Deliverer is the peace against it.',
       sv.verse_id, ev.verse_id, 'free', 20228
  FROM _s301_ge10_lookup sv, _s301_ge10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=10 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=10 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-10-in-the-days-of-peleg-was-the-earth-divided',
       E'In the days of Peleg was the earth divided',
       E'In the line of Shem a child is named for a turning of the whole world: *And unto Eber were born two sons: the name of one was Peleg; for in his days was the earth divided; and his brother''s name was Joktan* (Genesis 10:25). Peleg means division, and his birth dates the parting of the nations into their lands. The chronicler keeps the same note: *And unto Eber were born two sons: the name of the one was Peleg; because in his days the earth was divided* (1 Chronicles 1:19). The restored witness of Jubilees unfolds what the terse Torah line means: *he called his name Peleg; for in the days when he was born the children of Noah began to divide the earth amongst themselves: for this reason he called his name Peleg* (Jubilees 8:8) — the dividing was the sons of Noah parcelling the world among themselves. And it tells the manner of it: *they divided the earth into three parts, for Shem and Ham and Japheth, according to the inheritance of each* (Jubilees 8:10) — the whole earth parted by appointed lot into three inheritances for the three sons the Table of Nations has just enumerated. The dispersion of Genesis 10 is dated by a single name and shown to be a deliberate apportioning, each father to his portion.',
       sv.verse_id, ev.verse_id, 'extras', 20231
  FROM _s301_ge10_lookup sv, _s301_ge10_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=10 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=10 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*When the El Elyon (most High) divided to the nations their inheritance... he set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8) — the dividing of 10:5 is Yahuah''s apportioning, measured by Israel-yet-to-come.'
  FROM cross_reference_threads t
  JOIN _s301_ge10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=10 AND sv.verse_number=5
  JOIN _s301_ge10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-10-the-table-of-nations-divided-after-their-tongues-in-their-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*he set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8) — the closing *by these were the nations divided* (10:32) named as the El Elyon''s deliberate ordering.'
  FROM cross_reference_threads t
  JOIN _s301_ge10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=10 AND sv.verse_number=32
  JOIN _s301_ge10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-10-the-table-of-nations-divided-after-their-tongues-in-their-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*hath made of one blood all nations of men... and hath determined the times before appointed, and the bounds of their habitation* (Acts 17:26) — Sha''ul (Paul) preaches the dividing of the nations (10:32) as Yahuah''s appointed ordering.'
  FROM cross_reference_threads t
  JOIN _s301_ge10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=10 AND sv.verse_number=32
  JOIN _s301_ge10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=17 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-10-the-table-of-nations-divided-after-their-tongues-in-their-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*and hath determined the times before appointed, and the bounds of their habitation* (Acts 17:26) — the isles divided after their tongues (10:5) are the very bounds of habitation Sha''ul names.'
  FROM cross_reference_threads t
  JOIN _s301_ge10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=10 AND sv.verse_number=5
  JOIN _s301_ge10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=17 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-10-the-table-of-nations-divided-after-their-tongues-in-their-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras* (1 Chronicles 1:5) — the chronicler opens the covenant genealogy with this Table of Nations (10:2,5).'
  FROM cross_reference_threads t
  JOIN _s301_ge10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=10 AND sv.verse_number=5
  JOIN _s301_ge10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-10-the-table-of-nations-divided-after-their-tongues-in-their-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Noah, Shem, Ham, and Japheth* (1 Chronicles 1:4) — the three fathers of all the nations (10:32) set at the head of the covenant record.'
  FROM cross_reference_threads t
  JOIN _s301_ge10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=10 AND sv.verse_number=32
  JOIN _s301_ge10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=1 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-10-the-table-of-nations-divided-after-their-tongues-in-their-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*let us build us a city and a tower... and let us make us a name, lest we be scattered* (Genesis 11:4) — Babel, the head of Nimrod''s kingdom (10:10), is the tower-city of the next chapter.'
  FROM cross_reference_threads t
  JOIN _s301_ge10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=10 AND sv.verse_number=10
  JOIN _s301_ge10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-10-nimrod-the-mighty-hunter-and-the-beginning-of-his-kingdom-was-babel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*they shall waste... the land of Nimrod in the entrances thereof* (Micah 5:6) — the rebel-kingdom of the mighty hunter (10:8-9) endures as the prophet''s name for the oppressor Yahuah will waste.'
  FROM cross_reference_threads t
  JOIN _s301_ge10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=10 AND sv.verse_number=9
  JOIN _s301_ge10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=5 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-10-nimrod-the-mighty-hunter-and-the-beginning-of-his-kingdom-was-babel'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the name of the one was Peleg; because in his days the earth was divided* (1 Chronicles 1:19) — the chronicler keeps the division-marker of 10:25 in the line of Shem.'
  FROM cross_reference_threads t
  JOIN _s301_ge10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=10 AND sv.verse_number=25
  JOIN _s301_ge10_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-chronicles' AND tv.chapter_number=1 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-10-in-the-days-of-peleg-was-the-earth-divided'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the children of Noah began to divide the earth amongst themselves: for this reason he called his name Peleg* (Jubilees 8:8) — the restored witness names the event behind *in his days was the earth divided* (10:25).'
  FROM cross_reference_threads t
  JOIN _s301_ge10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=10 AND sv.verse_number=25
  JOIN _s301_ge10_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=8 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-10-in-the-days-of-peleg-was-the-earth-divided'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*they divided the earth into three parts, for Shem and Ham and Japheth, according to the inheritance of each* (Jubilees 8:10) — the earth divided in Peleg''s days (10:25) parted by lot into three inheritances for the three sons.'
  FROM cross_reference_threads t
  JOIN _s301_ge10_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=10 AND sv.verse_number=25
  JOIN _s301_ge10_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=8 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-10-in-the-days-of-peleg-was-the-earth-divided'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
