-- ----- fragment: minion_jasher_34.sql (session252 jasher 34) -----
-- Source anchor: jasher/jasher ch34. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja34 (view _session252_ja34_lookup). Sort band base 55825, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja34_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-34-zeal-of-levi-avenged
  ('jasher', 'jasher', 34, 28, 'canon', 'genesis', 34, 25, 'free', E'Genesis 34:25 — *And it came to pass on the third day, when they were sore, that two of the sons of Jacob, Simeon and Levi, Dinah’s brethren, took each man his sword, and came upon the city boldly, and slew all the males.* Moses'' verse is the bare event Jasher 34:23-28 expands into the oath, the hidden young men, and the house-to-house sweep.'),
  ('jasher', 'jasher', 34, 28, 'canon', 'genesis', 34, 26, 'free', E'Genesis 34:26 — *And they slew Hamor and Shechem his son with the edge of the sword, and took Dinah out of Shechem’s house, and went out.* The same two deaths and the same rescue of Dinah stand word-for-word behind Jasher 34:28.'),
  ('jasher', 'jasher', 34, 34, 'canon', 'genesis', 34, 31, 'free', E'Genesis 34:31 — *And they said, Should he deal with our sister as with an harlot?* The brothers'' closing retort in Jasher 34:34 quotes this canon line almost exactly — the defilement of the covenant seed is the grievance.'),
  ('jasher', 'jasher', 34, 23, 'canon', 'genesis', 49, 5, 'free', E'Genesis 49:5 — *Simeon and Levi are brethren; instruments of cruelty are in their habitations.* Jacob''s later blessing-oracle names the very zeal Jasher 34:23 records as an oath.'),
  ('jasher', 'jasher', 34, 25, 'jubilees', 'jubilees', 30, 4, 'extras', E'Jubilees 30:4 — *And Simeon and Levi came unexpectedly to Shechem and executed judgment on all the men of Shechem, and slew all the men whom they found in it, and left not a single one remaining in it: they slew all in torments because they had dishonoured their sister Dinah.* The same scene Jasher 34:25 tells, read in Jubilees as judgment for the defiled seed.'),
  -- thread: jasher-34-spoil-captives-jacob-feared
  ('jasher', 'jasher', 34, 31, 'canon', 'genesis', 34, 28, 'free', E'Genesis 34:28 — *They took their sheep, and their oxen, and their asses, and that which was in the city, and that which was in the field.* The catalogue of spoil Jasher 34:31 leads out of the gate is Moses'' own list.'),
  ('jasher', 'jasher', 34, 33, 'canon', 'genesis', 34, 30, 'free', E'Genesis 34:30 — *And Jacob said to Simeon and Levi, Ye have troubled me to make me to stink among the inhabitants of the land, among the Canaanites and the Perizzites: and I being few in number, they shall gather themselves together against me, and slay me; and I shall be destroyed, I and my house.* Jacob''s fear in Jasher 34:33 — few in number, the land assembling — is this canon verse retold.'),
  ('jasher', 'jasher', 34, 31, 'jubilees', 'jubilees', 30, 24, 'extras', E'Jubilees 30:24 — *And they brought Dinah, their sister, out of the house of Shechem, and they took captive everything that was in Shechem, their sheep and their oxen and their asses, and all their wealth, and all their flocks, and brought them all to Jacob their father.* The same flocks and captives Jasher 34:31 leads home to Jacob.'),
  ('jasher', 'jasher', 34, 33, 'jubilees', 'jubilees', 30, 25, 'extras', E'Jubilees 30:25 — *And he reproached them because they had put the city to the sword; for he feared those who dwelt in the land, the Canaanites and the Perizzites.* Jacob''s reproach and fear of the Canaanites and Perizzites in Jasher 34:33 stands word-for-word in Jubilees.'),
  -- thread: jasher-34-seven-kings-gather
  ('jasher', 'jasher', 34, 50, 'canon', 'genesis', 35, 5, 'free', E'Genesis 35:5 — *And they journeyed: and the terror of Elohim (God) was upon the cities that were round about them, and they did not pursue after the sons of Jacob.* The canon''s reason the gathered Amorite kings of Jasher 34:50 never overrun Jacob''s household — the dread of Elohim guards the seed.'),
  ('jasher', 'jasher', 34, 50, 'jubilees', 'jubilees', 30, 26, 'extras', E'Jubilees 30:26 — *And the dread of Yahuah (God) was upon all the cities which are around about Shechem, and they did not rise to pursue after the sons of Jacob; for terror had fallen upon them.* Jubilees turns the surrounding cities'' terror into the same shield over the sons of Jacob that blunts the seven kings of Jasher 34:50.'),
  -- thread: jasher-34-yahuah-delivers-the-uncircumcised
  ('jasher', 'jasher', 34, 60, 'canon', 'exodus', 23, 27, 'free', E'Exodus 23:27 — *I will send my fear before thee, and will destroy all the people to whom thou shalt come, and I will make all thine enemies turn their backs unto thee.* The terror Judah counts on in Jasher 34:55-60 is the conquest-promise Yahuah will keep before Israel.'),
  ('jasher', 'jasher', 34, 60, 'canon', 'deuteronomy', 20, 1, 'free', E'Deuteronomy 20:1 — *When thou goest out to battle against thine enemies, and seest horses, and chariots, and a people more than thou, be not afraid of them: for Yahuah Elohayka (the LORD thy God) is with thee, which brought thee up out of the land of Egypt.* Judah''s ''do not fear them'' in Jasher 34:59-60 is the Torah''s own war-law before the battle.'),
  ('jasher', 'jasher', 34, 60, 'canon', 'deuteronomy', 11, 25, 'free', E'Deuteronomy 11:25 — *There shall no man be able to stand before you: for Yahuah Elohaychem (the LORD your God) shall lay the fear of you and the dread of you upon all the land that ye shall tread upon, as he hath said unto you.* The dread Judah expects to fall on the Canaanite kings (Jasher 34:55) is the laid-on fear Moses promises the land.'),
  ('jasher', 'jasher', 34, 55, 'canon', 'joshua', 2, 9, 'free', E'Joshua 2:9 — *And she said unto the men, I know that Yahuah (LORD) hath given you the land, and that your terror is fallen upon us, and that all the inhabitants of the land faint because of you.* Rahab voices from the other side the very terror Judah trusts will fall on the kings in Jasher 34:55.'),
  ('jasher', 'jasher', 34, 56, 'canon', '2-chronicles', 20, 15, 'free', E'2 Chronicles 20:15 — *And he said, Hearken ye, all Yahudah (Judah), and ye inhabitants of Jerusalem, and thou king Jehoshaphat, Thus saith Yahuah (LORD) unto you, Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God’s).* Judah''s call to cast away fear and trust Yahuah in Jasher 34:56 is the same word later spoken to all Judah.'),
  -- thread: jasher-34-isaac-jacob-prayer-seed-as-stars
  ('jasher', 'jasher', 34, 65, 'canon', 'genesis', 15, 5, 'free', E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* The ''seed as the stars of heaven'' Isaac pleads in Jasher 34:65 is this word first spoken to Abraham.'),
  ('jasher', 'jasher', 34, 65, 'canon', 'genesis', 22, 17, 'free', E'Genesis 22:17 — *That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies.* The sworn promise Isaac leans on in Jasher 34:65 even names the seed possessing the gate of its enemies — exactly the war at hand.'),
  ('jasher', 'jasher', 34, 69, 'canon', 'genesis', 48, 22, 'free', E'Genesis 48:22 — *Moreover I have given to thee one portion above thy brethren, which I took out of the hand of the Amorite with my sword and with my bow.* Jacob''s deathbed word recalls the very Amorite war of Jasher 34, the portion taken by the sword and bow Judah bids each man gird on (34:60).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja34_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja34_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-34-zeal-of-levi-avenged',
       E'The zeal of Simeon and Levi — Dinah avenged at the sword',
       E'Jasher draws the brothers'' oath and the slaughter of Shechem out long: *And Simeon and Levi swore and said, As Yahuah (the Lord) lives, the Elohim (God) of the whole earth, by this time tomorrow, there shall not be a remnant left in the whole city* (Jasher 34:23), and *And they slew Hamor and Shechem his son at the edge of the sword, and they brought away Dinah from the house of Shechem and they went from there* (Jasher 34:28). When their father rebukes them they answer with the chapter''s hot word: *and shall he deal with our sister as with a harlot in the streets?* (Jasher 34:34). It is the canon scene amplified, not a new one — *And it came to pass on the third day, when they were sore, that two of the sons of Jacob, Simeon and Levi, Dinah’s brethren, took each man his sword, and came upon the city boldly, and slew all the males* (Genesis 34:25), and Jacob''s daughters'' brothers say the same in Moses'' text: *And they said, Should he deal with our sister as with an harlot?* (Genesis 34:31). Jacob''s deathbed verdict names the zeal a cruelty — *Simeon and Levi are brethren; instruments of cruelty are in their habitations* (Genesis 49:5) — yet Jubilees reads the very same act as righteousness kept for the seed: *And Simeon and Levi came unexpectedly to Shechem and executed judgment on all the men of Shechem, and slew all the men whom they found in it, and left not a single one remaining in it: they slew all in torments because they had dishonoured their sister Dinah* (Jubilees 30:4). It ain''t new — the seed defiled by the nations, and the line guarded.',
       sv.verse_id, ev.verse_id, 'extras', 55825
  FROM _session252_ja34_lookup sv, _session252_ja34_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=34 AND sv.verse_number=23
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=34 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-34-spoil-captives-jacob-feared',
       E'The spoil, the captives, and Jacob''s fear of the land',
       E'Jasher follows the brothers back out of the gate laden: *And they took away their sheep and their oxen and their cattle, and also the remainder of the women and little ones, and they led all these away, and they opened a gate and went out and came to their father Jacob with vigor* (Jasher 34:31), and then the father''s dread — *and I am but of a small number, and they will all assemble against me and slay me when they hear of your work with their brethren, and I and my household will be destroyed* (Jasher 34:33). This is the canon line by line: *They took their sheep, and their oxen, and their asses, and that which was in the city, and that which was in the field* (Genesis 34:28), and Jacob''s identical fear — *And Jacob said to Simeon and Levi, Ye have troubled me to make me to stink among the inhabitants of the land, among the Canaanites and the Perizzites: and I being few in number, they shall gather themselves together against me, and slay me; and I shall be destroyed, I and my house* (Genesis 34:30). Jubilees gathers the same spoil — *And they brought Dinah, their sister, out of the house of Shechem, and they took captive everything that was in Shechem, their sheep and their oxen and their asses, and all their wealth, and all their flocks, and brought them all to Jacob their father* (Jubilees 30:24) — and the same rebuke: *And he reproached them because they had put the city to the sword; for he feared those who dwelt in the land, the Canaanites and the Perizzites* (Jubilees 30:25). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55828
  FROM _session252_ja34_lookup sv, _session252_ja34_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=34 AND sv.verse_number=29
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=34 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-34-seven-kings-gather',
       E'The nations gather — the seven Amorite kings come against Jacob''s sons',
       E'Here Jasher swells past the canon into the legendary wars: two survivors carry the news, *And the seven kings of the Amorites assembled with all their armies, about ten thousand men with drawn swords, and they came to fight against the sons of Jacob; and Jacob heard that the kings of the Amorites had assembled to fight against his sons, and Jacob was greatly afraid, and it distressed him* (Jasher 34:50), so awed by Simeon and Levi that the king of Tapnach marvels, *For the like has not been from the days of Nimrod, and not even from the remotest time, has the like taken place* (Jasher 34:43). The chapter even measures the seed against Nimrod''s kingdom-of-man — the rebel king-builder is the yardstick of dread the nations reach for. Yet the canon already declares why the gathering nations cannot prevail: when Jacob''s house journeyed, *the terror of Elohim (God) was upon the cities that were round about them, and they did not pursue after the sons of Jacob* (Genesis 35:5). Jubilees frames the wars'' aftermath the same way: *And the dread of Yahuah (God) was upon all the cities which are around about Shechem, and they did not rise to pursue after the sons of Jacob; for terror had fallen upon them* (Jubilees 30:26). The kings assemble; the elect seed is kept.',
       sv.verse_id, ev.verse_id, 'extras', 55831
  FROM _session252_ja34_lookup sv, _session252_ja34_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=34 AND sv.verse_number=43
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=34 AND ev.verse_number=50
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-34-yahuah-delivers-the-uncircumcised',
       E'Judah''s charge — Yahuah delivers the uncircumcised into their hand',
       E'Against the gathered kings Judah preaches faith, not flight: *Surely our Elohim who delivered into their hand the city of Shechem and its people, he will also deliver into our hands all the Canaanitish kings who are coming against us* (Jasher 34:55), and *Stand forth each man, girt with his weapons of war, his bow and his sword, and we will go and fight against these uncircumcised men; Yahuah (the Lord) is our Elohim, He will save us* (Jasher 34:60). The Torah''s war-law speaks in the same voice — *When thou goest out to battle against thine enemies, and seest horses, and chariots, and a people more than thou, be not afraid of them: for Yahuah Elohayka (the LORD thy God) is with thee* (Deuteronomy 20:1) — and the conquest runs on the very promise Judah trusts: *I will send my fear before thee, and will destroy all the people to whom thou shalt come, and I will make all thine enemies turn their backs unto thee* (Exodus 23:27), *There shall no man be able to stand before you: for Yahuah Elohaychem (the LORD your God) shall lay the fear of you and the dread of you upon all the land that ye shall tread upon, as he hath said unto you* (Deuteronomy 11:25). Rahab confesses the same terror long after — *I know that Yahuah (LORD) hath given you the land, and that your terror is fallen upon us, and that all the inhabitants of the land faint because of you* (Joshua 2:9) — and Jehoshaphat hears it again: *Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God’s)* (2 Chronicles 20:15). It ain''t new — Yahuah fights for the kept seed.',
       sv.verse_id, ev.verse_id, 'extras', 55834
  FROM _session252_ja34_lookup sv, _session252_ja34_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=34 AND sv.verse_number=55
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=34 AND ev.verse_number=60
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-34-isaac-jacob-prayer-seed-as-stars',
       E'Isaac and Jacob pray — the seed as the stars, the portion of the Amorite',
       E'Before the battle Jasher has both Isaac and Jacob plead the covenant: *O Yahuah (O Lord) Elohim, you did promise my father, saying, I will multiply your seed as the stars of heaven, and you did also promise me, and establish you your word* (Jasher 34:65), and Jacob — *O Yahuah Elohim, powerful and exalted Elohim, who has reigned from days of old... You are He who stirs up wars and causes them to cease, in your hand are power and might to exalt and to bring down* (Jasher 34:69-70). The promise they hold is the canon''s own oath to Abraham: *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be* (Genesis 15:5), *That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies* (Genesis 22:17). And the wars Jasher narrates are the very ground Jacob will later will to Joseph: *Moreover I have given to thee one portion above thy brethren, which I took out of the hand of the Amorite with my sword and with my bow* (Genesis 48:22) — the Amorite of this chapter, taken by the sword and the bow Judah bids each man gird on. Election precedes the battle; the seed is kept.',
       sv.verse_id, ev.verse_id, 'extras', 55837
  FROM _session252_ja34_lookup sv, _session252_ja34_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=34 AND sv.verse_number=65
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=34 AND ev.verse_number=70
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-34-zeal-of-levi-avenged
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 34:25 — *And it came to pass on the third day, when they were sore, that two of the sons of Jacob, Simeon and Levi, Dinah’s brethren, took each man his sword, and came upon the city boldly, and slew all the males.* Moses'' verse is the bare event Jasher 34:23-28 expands into the oath, the hidden young men, and the house-to-house sweep.'
  FROM cross_reference_threads t, cross_references x, _session252_ja34_lookup sv, _session252_ja34_lookup tv
 WHERE t.slug='jasher-34-zeal-of-levi-avenged'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=34 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=34 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 34:26 — *And they slew Hamor and Shechem his son with the edge of the sword, and took Dinah out of Shechem’s house, and went out.* The same two deaths and the same rescue of Dinah stand word-for-word behind Jasher 34:28.'
  FROM cross_reference_threads t, cross_references x, _session252_ja34_lookup sv, _session252_ja34_lookup tv
 WHERE t.slug='jasher-34-zeal-of-levi-avenged'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=34 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=34 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 34:31 — *And they said, Should he deal with our sister as with an harlot?* The brothers'' closing retort in Jasher 34:34 quotes this canon line almost exactly — the defilement of the covenant seed is the grievance.'
  FROM cross_reference_threads t, cross_references x, _session252_ja34_lookup sv, _session252_ja34_lookup tv
 WHERE t.slug='jasher-34-zeal-of-levi-avenged'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=34 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=34 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 49:5 — *Simeon and Levi are brethren; instruments of cruelty are in their habitations.* Jacob''s later blessing-oracle names the very zeal Jasher 34:23 records as an oath.'
  FROM cross_reference_threads t, cross_references x, _session252_ja34_lookup sv, _session252_ja34_lookup tv
 WHERE t.slug='jasher-34-zeal-of-levi-avenged'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=34 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 30:4 — *And Simeon and Levi came unexpectedly to Shechem and executed judgment on all the men of Shechem, and slew all the men whom they found in it, and left not a single one remaining in it: they slew all in torments because they had dishonoured their sister Dinah.* The same scene Jasher 34:25 tells, read in Jubilees as judgment for the defiled seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja34_lookup sv, _session252_ja34_lookup tv
 WHERE t.slug='jasher-34-zeal-of-levi-avenged'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=34 AND sv.verse_number=25
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=30 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-34-spoil-captives-jacob-feared
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 34:28 — *They took their sheep, and their oxen, and their asses, and that which was in the city, and that which was in the field.* The catalogue of spoil Jasher 34:31 leads out of the gate is Moses'' own list.'
  FROM cross_reference_threads t, cross_references x, _session252_ja34_lookup sv, _session252_ja34_lookup tv
 WHERE t.slug='jasher-34-spoil-captives-jacob-feared'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=34 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=34 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 34:30 — *And Jacob said to Simeon and Levi, Ye have troubled me to make me to stink among the inhabitants of the land, among the Canaanites and the Perizzites: and I being few in number, they shall gather themselves together against me, and slay me; and I shall be destroyed, I and my house.* Jacob''s fear in Jasher 34:33 — few in number, the land assembling — is this canon verse retold.'
  FROM cross_reference_threads t, cross_references x, _session252_ja34_lookup sv, _session252_ja34_lookup tv
 WHERE t.slug='jasher-34-spoil-captives-jacob-feared'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=34 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=34 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 30:24 — *And they brought Dinah, their sister, out of the house of Shechem, and they took captive everything that was in Shechem, their sheep and their oxen and their asses, and all their wealth, and all their flocks, and brought them all to Jacob their father.* The same flocks and captives Jasher 34:31 leads home to Jacob.'
  FROM cross_reference_threads t, cross_references x, _session252_ja34_lookup sv, _session252_ja34_lookup tv
 WHERE t.slug='jasher-34-spoil-captives-jacob-feared'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=34 AND sv.verse_number=31
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=30 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 30:25 — *And he reproached them because they had put the city to the sword; for he feared those who dwelt in the land, the Canaanites and the Perizzites.* Jacob''s reproach and fear of the Canaanites and Perizzites in Jasher 34:33 stands word-for-word in Jubilees.'
  FROM cross_reference_threads t, cross_references x, _session252_ja34_lookup sv, _session252_ja34_lookup tv
 WHERE t.slug='jasher-34-spoil-captives-jacob-feared'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=34 AND sv.verse_number=33
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=30 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-34-seven-kings-gather
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 35:5 — *And they journeyed: and the terror of Elohim (God) was upon the cities that were round about them, and they did not pursue after the sons of Jacob.* The canon''s reason the gathered Amorite kings of Jasher 34:50 never overrun Jacob''s household — the dread of Elohim guards the seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja34_lookup sv, _session252_ja34_lookup tv
 WHERE t.slug='jasher-34-seven-kings-gather'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=34 AND sv.verse_number=50
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 30:26 — *And the dread of Yahuah (God) was upon all the cities which are around about Shechem, and they did not rise to pursue after the sons of Jacob; for terror had fallen upon them.* Jubilees turns the surrounding cities'' terror into the same shield over the sons of Jacob that blunts the seven kings of Jasher 34:50.'
  FROM cross_reference_threads t, cross_references x, _session252_ja34_lookup sv, _session252_ja34_lookup tv
 WHERE t.slug='jasher-34-seven-kings-gather'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=34 AND sv.verse_number=50
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=30 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-34-yahuah-delivers-the-uncircumcised
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 23:27 — *I will send my fear before thee, and will destroy all the people to whom thou shalt come, and I will make all thine enemies turn their backs unto thee.* The terror Judah counts on in Jasher 34:55-60 is the conquest-promise Yahuah will keep before Israel.'
  FROM cross_reference_threads t, cross_references x, _session252_ja34_lookup sv, _session252_ja34_lookup tv
 WHERE t.slug='jasher-34-yahuah-delivers-the-uncircumcised'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=34 AND sv.verse_number=60
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 20:1 — *When thou goest out to battle against thine enemies, and seest horses, and chariots, and a people more than thou, be not afraid of them: for Yahuah Elohayka (the LORD thy God) is with thee, which brought thee up out of the land of Egypt.* Judah''s ''do not fear them'' in Jasher 34:59-60 is the Torah''s own war-law before the battle.'
  FROM cross_reference_threads t, cross_references x, _session252_ja34_lookup sv, _session252_ja34_lookup tv
 WHERE t.slug='jasher-34-yahuah-delivers-the-uncircumcised'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=34 AND sv.verse_number=60
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=20 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 11:25 — *There shall no man be able to stand before you: for Yahuah Elohaychem (the LORD your God) shall lay the fear of you and the dread of you upon all the land that ye shall tread upon, as he hath said unto you.* The dread Judah expects to fall on the Canaanite kings (Jasher 34:55) is the laid-on fear Moses promises the land.'
  FROM cross_reference_threads t, cross_references x, _session252_ja34_lookup sv, _session252_ja34_lookup tv
 WHERE t.slug='jasher-34-yahuah-delivers-the-uncircumcised'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=34 AND sv.verse_number=60
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=11 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Joshua 2:9 — *And she said unto the men, I know that Yahuah (LORD) hath given you the land, and that your terror is fallen upon us, and that all the inhabitants of the land faint because of you.* Rahab voices from the other side the very terror Judah trusts will fall on the kings in Jasher 34:55.'
  FROM cross_reference_threads t, cross_references x, _session252_ja34_lookup sv, _session252_ja34_lookup tv
 WHERE t.slug='jasher-34-yahuah-delivers-the-uncircumcised'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=34 AND sv.verse_number=55
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Chronicles 20:15 — *And he said, Hearken ye, all Yahudah (Judah), and ye inhabitants of Jerusalem, and thou king Jehoshaphat, Thus saith Yahuah (LORD) unto you, Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God’s).* Judah''s call to cast away fear and trust Yahuah in Jasher 34:56 is the same word later spoken to all Judah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja34_lookup sv, _session252_ja34_lookup tv
 WHERE t.slug='jasher-34-yahuah-delivers-the-uncircumcised'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=34 AND sv.verse_number=56
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-34-isaac-jacob-prayer-seed-as-stars
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* The ''seed as the stars of heaven'' Isaac pleads in Jasher 34:65 is this word first spoken to Abraham.'
  FROM cross_reference_threads t, cross_references x, _session252_ja34_lookup sv, _session252_ja34_lookup tv
 WHERE t.slug='jasher-34-isaac-jacob-prayer-seed-as-stars'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=34 AND sv.verse_number=65
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 22:17 — *That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies.* The sworn promise Isaac leans on in Jasher 34:65 even names the seed possessing the gate of its enemies — exactly the war at hand.'
  FROM cross_reference_threads t, cross_references x, _session252_ja34_lookup sv, _session252_ja34_lookup tv
 WHERE t.slug='jasher-34-isaac-jacob-prayer-seed-as-stars'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=34 AND sv.verse_number=65
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 48:22 — *Moreover I have given to thee one portion above thy brethren, which I took out of the hand of the Amorite with my sword and with my bow.* Jacob''s deathbed word recalls the very Amorite war of Jasher 34, the portion taken by the sword and bow Judah bids each man gird on (34:60).'
  FROM cross_reference_threads t, cross_references x, _session252_ja34_lookup sv, _session252_ja34_lookup tv
 WHERE t.slug='jasher-34-isaac-jacob-prayer-seed-as-stars'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=34 AND sv.verse_number=69
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=48 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

