-- ----- fragment: minion_jasher_06.sql (session252 jasher 6) -----
-- Source anchor: jasher/jasher ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja06 (view _session252_ja06_lookup). Sort band base 55125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-6-gathering-of-the-beasts
  ('jasher', 'jasher', 6, 9, 'canon', 'genesis', 7, 2, 'free', E'Genesis 7:2 — *Of every clean beast thou shalt take to thee by sevens, the male and his female: and of beasts that are not clean by two, the male and his female.* The clean-by-sevens command Jasher 6:9 retells, the Torah distinction kept before Sinai.'),
  ('jasher', 'jasher', 6, 9, 'canon', 'genesis', 7, 9, 'free', E'Genesis 7:9 — *There went in two and two unto Noah into the ark, the male and the female, as Elohim (God) had commanded Noah.* The two-and-two ingathering of Jasher 6:9, the same scene quoted beside its source.'),
  ('jasher', 'jasher', 6, 8, 'jubilees', 'jubilees', 5, 23, 'extras', E'Jubilees 5:23 — *he entered, and all that we brought to him, into the ark, and Yahuah (God) closed it from without on the seventeenth evening.* Jubilees keeps the same record of the creatures brought in that Jasher 6:8 narrates, both witnesses now live.'),
  -- thread: jasher-6-fountains-of-the-deep-broken-up
  ('jasher', 'jasher', 6, 14, 'canon', 'genesis', 7, 11, 'free', E'Genesis 7:11 — *In the six hundredth year of Noah''s life, in the second month, the seventeenth day of the month, the same day were all the fountains of the great deep broken up, and the windows of heaven were opened.* The fountains and windows of Jasher 6:14, the Genesis source dated to the day.'),
  ('jasher', 'jasher', 6, 14, 'canon', 'genesis', 7, 12, 'free', E'Genesis 7:12 — *And the rain was upon the earth forty days and forty nights.* The forty days and nights Jasher 6:14 carries verbatim from its source.'),
  ('jasher', 'jasher', 6, 14, 'enoch', '1-enoch', 89, 3, 'extras', E'1 Enoch 89:3 — *And I saw again and behold fountains were opened on the earth, in that great enclosure, and that water began to swell and rise upon the earth, and I saw that enclosure till all its surface was covered with water.* Enoch''s Animal Apocalypse sees the same fountains opened that Jasher 6:14 names, the flood-vision live beside it.'),
  ('jasher', 'jasher', 6, 14, 'jubilees', 'jubilees', 5, 23, 'extras', E'Jubilees 5:23 — *And Yahuah (God) opened seven flood-gates of heaven, And the mouths of the fountains of the great deep, seven mouths in number.* Jubilees keeps the same fountains-of-the-deep that Jasher 6:14 reports, the patriarchal record self-linked.'),
  -- thread: jasher-6-yahuah-shut-him-in
  ('jasher', 'jasher', 6, 15, 'canon', 'genesis', 7, 16, 'free', E'Genesis 7:16 — *And they that went in, went in male and female of all flesh, as Elohim (God) had commanded him: and Yahuah (LORD) shut him in.* The very shutting-in of Jasher 6:15, quoted beside its source.'),
  ('jasher', 'jasher', 6, 26, 'canon', 'genesis', 7, 23, 'free', E'Genesis 7:23 — *And every living substance was destroyed which was upon the face of the ground, both man, and cattle, and the creeping things, and the fowl of the heaven; and they were destroyed from the earth: and Noah only remained alive, and they that were with him in the ark.* The death of all flesh and the remnant of Jasher 6:26, the Genesis verdict beside it.'),
  ('jasher', 'jasher', 6, 26, 'enoch', '1-enoch', 89, 6, 'extras', E'1 Enoch 89:6 — *But that vessel floated on the water, while all the oxen and elephants and camels and asses sank to the bottom with all the animals, so that I could no longer see them, and they were not able to escape, (but) perished and sank into the depths.* Enoch''s vision of all the beasts drowned while the vessel floats matches the all-flesh-died of Jasher 6:26.'),
  ('jasher', 'jasher', 6, 15, 'jubilees', 'jubilees', 5, 19, 'extras', E'Jubilees 5:19 — *no man''s person was accepted save that of Noah alone; for his person was accepted in behalf of his sons, whom Elohim (God) saved from the waters of the flood on his account; for his heart was righteous in all his ways.* Jubilees names the same righteous remnant shut into the ark of Jasher 6:15, the election of the seed-line kept.'),
  -- thread: jasher-6-ark-borne-up-and-rested
  ('jasher', 'jasher', 6, 27, 'canon', 'genesis', 7, 17, 'free', E'Genesis 7:17 — *And the flood was forty days upon the earth; and the waters increased, and bare up the ark, and it was lift up above the earth.* The ark borne up of Jasher 6:27, the Genesis source quoted beside it.'),
  ('jasher', 'jasher', 6, 33, 'canon', 'genesis', 8, 1, 'free', E'Genesis 8:1 — *And Elohim (God) remembered Noah, and every living thing, and all the cattle that was with him in the ark: and Elohim (God) made a wind to pass over the earth, and the waters asswaged.* The wind passing and the waters stilling of Jasher 6:33, the canon''s I-remembered-him beside it.'),
  ('jasher', 'jasher', 6, 35, 'canon', 'genesis', 8, 4, 'free', E'Genesis 8:4 — *And the ark rested in the seventh month, on the seventeenth day of the month, upon the mountains of Ararat.* The resting on Ararat of Jasher 6:35, dated to the day in its Genesis source.'),
  ('jasher', 'jasher', 6, 27, 'enoch', '1-enoch', 89, 8, 'extras', E'1 Enoch 89:8 — *Then the water began to run down into these, till the earth became visible; but that vessel settled on the earth, and the darkness retired and light appeared.* Enoch''s vessel settling as the waters run down matches the ark borne up and resting of Jasher 6:27, 6:35.'),
  -- thread: jasher-6-go-forth-blessed-fruitful
  ('jasher', 'jasher', 6, 40, 'canon', 'genesis', 8, 16, 'free', E'Genesis 8:16 — *Go forth of the ark, thou, and thy wife, and thy sons, and thy sons'' wives with thee.* The command to go out that Jasher 6:40 obeys, the Genesis source beside it.'),
  ('jasher', 'jasher', 6, 42, 'canon', 'genesis', 9, 1, 'free', E'Genesis 9:1 — *And Elohim (God) blessed Noah and his sons, and said unto them, Be fruitful, and multiply, and replenish the earth.* The be-fruitful blessing of Jasher 6:42, the Genesis charge to the renewed seed-line.'),
  ('jasher', 'jasher', 6, 42, 'jubilees', 'jubilees', 6, 5, 'extras', E'Jubilees 6:5 — *And you, increase you and multiply upon the earth, and become many upon it, and be a blessing upon it.* Jubilees keeps the same multiply-and-be-a-blessing word that Jasher 6:42 carries, the patriarchal record self-linked.'),
  -- thread: jasher-6-altar-covenant-bow
  ('jasher', 'jasher', 6, 41, 'canon', 'genesis', 8, 20, 'free', E'Genesis 8:20 — *And Noah builded an altar unto Yahuah (LORD); and took of every clean beast, and of every clean fowl, and offered burnt offerings on the altar.* The service of Yahuah that Jasher 6:41 records is the clean-beast altar of Genesis, Torah-worship before Sinai.'),
  ('jasher', 'jasher', 6, 41, 'canon', 'genesis', 8, 21, 'free', E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake; for the imagination of man''s heart is evil from his youth; neither will I again smite any more every thing living, as I have done.* The mercy that follows Noah''s altar in Jasher 6:41, the I-will-not-again of the covenant.'),
  ('jasher', 'jasher', 6, 41, 'canon', 'genesis', 9, 13, 'free', E'Genesis 9:13 — *I do set my bow in the cloud, and it shall be for a token of a covenant between me and the earth.* The bow sealing the covenant that crowns Noah''s service in Jasher 6:41.'),
  ('jasher', 'jasher', 6, 41, 'jubilees', 'jubilees', 6, 4, 'extras', E'Jubilees 6:4 — *And Yahuah (God) smelt the goodly savour, and He made a covenant with him that there should not be any more a flood to destroy the earth.* Jubilees keeps the same altar-savour and no-more-flood covenant that follows the service of Jasher 6:41.'),
  ('jasher', 'jasher', 6, 41, 'jubilees', 'jubilees', 6, 16, 'extras', E'Jubilees 6:16 — *He set His bow in the cloud for a sign of the eternal covenant that there should not again be a flood on the earth to destroy it all the days of the earth.* Jubilees keeps the bow of the eternal covenant that crowns Noah''s going-forth in Jasher 6:41, self-linked.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-6-gathering-of-the-beasts',
       E'Two and two, and the clean by sevens — the beasts gather to the ark',
       E'Jasher tells how the creatures came to Noah of their own accord: *And Noah brought into the ark from all living creatures that were upon earth, so that there was none left but which Noah brought into the ark* (Jasher 6:8), and *Two and two came to Noah into the ark, but from the clean animals, and clean fowls, he brought seven couples, as Elohim (God) had commanded him* (Jasher 6:9). This is the retelling of the Genesis command itself — *Of every clean beast thou shalt take to thee by sevens, the male and his female: and of beasts that are not clean by two, the male and his female* (Genesis 7:2) — and its doing: *There went in two and two unto Noah into the ark, the male and the female, as Elohim (God) had commanded Noah* (Genesis 7:9). Jubilees keeps the same record of the gathering: *he entered, and all that we brought to him, into the ark* (Jubilees 5:23). It ain''t new — the clean-and-unclean distinction stands before Sinai, the Torah carried in the fathers.',
       sv.verse_id, ev.verse_id, 'extras', 55125
  FROM _session252_ja06_lookup sv, _session252_ja06_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=8
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=6 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-6-fountains-of-the-deep-broken-up',
       E'The fountains of the deep broken up — the waters of the flood come',
       E'Jasher dates the storm to the very year Genesis does: *And at the end of seven days, in the six hundredth year of the life of Noah, the waters of the flood were upon the earth* (Jasher 6:13), and *And all the fountains of the deep were broken up, and the windows of heaven were opened, and the rain was upon the earth forty days and forty nights* (Jasher 6:14). This is Genesis word for word — *In the six hundredth year of Noah''s life, in the second month, the seventeenth day of the month, the same day were all the fountains of the great deep broken up, and the windows of heaven were opened* (Genesis 7:11) — and *the rain was upon the earth forty days and forty nights* (Genesis 7:12). The Animal Apocalypse of Enoch saw the same flood as a vision: *And I saw again and behold fountains were opened on the earth, in that great enclosure, and that water began to swell and rise upon the earth* (1 Enoch 89:3). Jubilees agrees the very fountains were opened: *And the mouths of the fountains of the great deep, seven mouths in number* (Jubilees 5:23). It ain''t new — three witnesses, one flood.',
       sv.verse_id, ev.verse_id, 'extras', 55128
  FROM _session252_ja06_lookup sv, _session252_ja06_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=13
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=6 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-6-yahuah-shut-him-in',
       E'Yahuah shut him in — the men shut out, all flesh died',
       E'Jasher records the shutting of the door and the perishing of all flesh: *And Noah and his household, and all the living creatures that were with him, came into the ark on account of the waters of the flood, and Yahuah (the Lord) shut him in* (Jasher 6:15), and *all flesh that was upon the earth or in the waters died, whether men, animals, beasts, creeping things or birds of the air, and there only remained Noah and those that were with him in the ark* (Jasher 6:26). Genesis is the same shutting and the same death: *and Yahuah (LORD) shut him in* (Genesis 7:16), and *And every living substance was destroyed which was upon the face of the ground… and Noah only remained alive, and they that were with him in the ark* (Genesis 7:23). Jasher adds the seven hundred thousand who begged at the door (Jasher 6:17) — the rebellion that said *that he does not exist* (Jasher 6:19) — but the verdict is the canon''s: the door of mercy was shut after a hundred and twenty years of warning. The flood is judgment on the corrupted earth that the Watchers (Jasher 4, 1 Enoch, Jubilees 5) defiled.',
       sv.verse_id, ev.verse_id, 'extras', 55131
  FROM _session252_ja06_lookup sv, _session252_ja06_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=15
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=6 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-6-ark-borne-up-and-rested',
       E'The ark borne up and the wind passes — the waters abate on Ararat',
       E'Jasher tells how the waters lifted the ark and then stilled: *And the waters prevailed and they greatly increased upon the earth, and they lifted up the ark and it was raised from the earth* (Jasher 6:27), and after Noah''s prayer *a wind passed over the earth, and the waters were still and the ark rested* (Jasher 6:33), till *the ark rested upon the mountains of Ararat* (Jasher 6:35). Genesis bears the same lifting, the same wind, the same resting place: *and the waters increased, and bare up the ark, and it was lift up above the earth* (Genesis 7:17); *And Elohim (God) made a wind to pass over the earth, and the waters asswaged* (Genesis 8:1); *And the ark rested in the seventh month, on the seventeenth day of the month, upon the mountains of Ararat* (Genesis 8:4). Enoch''s Animal Apocalypse saw the vessel float and then settle: *But that vessel floated on the water* (1 Enoch 89:6) and *that vessel settled on the earth, and the darkness retired and light appeared* (1 Enoch 89:8). It ain''t new — Yahuah remembered Noah, and the same wind that hovered over the deep at creation passes over it again.',
       sv.verse_id, ev.verse_id, 'extras', 55134
  FROM _session252_ja06_lookup sv, _session252_ja06_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=27
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=6 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-6-go-forth-blessed-fruitful',
       E'Go forth and be fruitful — Noah leaves the ark blessed',
       E'Jasher closes the flood with the going-forth and the blessing: *the earth was dry, but Noah and his sons, and those that were with him, did not go out from the ark until Yahuah (the Lord) told them* (Jasher 6:39); *they all went out from the ark* (Jasher 6:40); *Yahuah (the Lord) blessed Noah and his sons on their going out from the ark* (Jasher 6:41); *And he said to them, Be fruitful and fill all the earth; become strong and increase abundantly in the earth and multiply in it* (Jasher 6:42). Genesis carries the same command to go forth and the same blessing: *Go forth of the ark, thou, and thy wife, and thy sons, and thy sons'' wives with thee* (Genesis 8:16), and *And Elohim (God) blessed Noah and his sons, and said unto them, Be fruitful, and multiply, and replenish the earth* (Genesis 9:1). Jubilees keeps the blessing in the very words: *And you, increase you and multiply upon the earth, and become many upon it, and be a blessing upon it* (Jubilees 6:5). The seed-line goes on — Adam to Seth to Noah to Shem — the chosen line through whom the earth is overspread.',
       sv.verse_id, ev.verse_id, 'extras', 55137
  FROM _session252_ja06_lookup sv, _session252_ja06_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=39
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=6 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-6-altar-covenant-bow',
       E'The altar, the I-will-not-again, and the bow — the covenant after the flood',
       E'Though Jasher 6 ends at the going-forth and the be-fruitful blessing, its scene of Noah preserved and sent out to fill the earth opens directly upon the altar, the sweet savour, and the bow of the covenant in the canon and in Jubilees. Where Jasher records Noah *served Yahuah (the Lord) all their days* (Jasher 6:41) on leaving the ark, Genesis shows what that service was: *And Noah builded an altar unto Yahuah (LORD); and took of every clean beast… and offered burnt offerings on the altar* (Genesis 8:20), and Yahuah''s pledge *I will not again curse the ground any more for man''s sake* (Genesis 8:21), sealed with *I do set my bow in the cloud, and it shall be for a token of a covenant between me and the earth* (Genesis 9:13). Jubilees keeps the altar and the same goodly savour and bow: *And Yahuah (God) smelt the goodly savour, and He made a covenant with him that there should not be any more a flood to destroy the earth* (Jubilees 6:4), and *He set His bow in the cloud for a sign of the eternal covenant* (Jubilees 6:16). The clean-beast altar before Sinai — Torah stands; the fathers kept the way.',
       sv.verse_id, ev.verse_id, 'extras', 55140
  FROM _session252_ja06_lookup sv, _session252_ja06_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=41
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=6 AND ev.verse_number=41
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-6-gathering-of-the-beasts
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 7:2 — *Of every clean beast thou shalt take to thee by sevens, the male and his female: and of beasts that are not clean by two, the male and his female.* The clean-by-sevens command Jasher 6:9 retells, the Torah distinction kept before Sinai.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-gathering-of-the-beasts'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 7:9 — *There went in two and two unto Noah into the ark, the male and the female, as Elohim (God) had commanded Noah.* The two-and-two ingathering of Jasher 6:9, the same scene quoted beside its source.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-gathering-of-the-beasts'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 5:23 — *he entered, and all that we brought to him, into the ark, and Yahuah (God) closed it from without on the seventeenth evening.* Jubilees keeps the same record of the creatures brought in that Jasher 6:8 narrates, both witnesses now live.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-gathering-of-the-beasts'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-6-fountains-of-the-deep-broken-up
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 7:11 — *In the six hundredth year of Noah''s life, in the second month, the seventeenth day of the month, the same day were all the fountains of the great deep broken up, and the windows of heaven were opened.* The fountains and windows of Jasher 6:14, the Genesis source dated to the day.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-fountains-of-the-deep-broken-up'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 7:12 — *And the rain was upon the earth forty days and forty nights.* The forty days and nights Jasher 6:14 carries verbatim from its source.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-fountains-of-the-deep-broken-up'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 89:3 — *And I saw again and behold fountains were opened on the earth, in that great enclosure, and that water began to swell and rise upon the earth, and I saw that enclosure till all its surface was covered with water.* Enoch''s Animal Apocalypse sees the same fountains opened that Jasher 6:14 names, the flood-vision live beside it.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-fountains-of-the-deep-broken-up'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=89 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 5:23 — *And Yahuah (God) opened seven flood-gates of heaven, And the mouths of the fountains of the great deep, seven mouths in number.* Jubilees keeps the same fountains-of-the-deep that Jasher 6:14 reports, the patriarchal record self-linked.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-fountains-of-the-deep-broken-up'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-6-yahuah-shut-him-in
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 7:16 — *And they that went in, went in male and female of all flesh, as Elohim (God) had commanded him: and Yahuah (LORD) shut him in.* The very shutting-in of Jasher 6:15, quoted beside its source.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-yahuah-shut-him-in'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 7:23 — *And every living substance was destroyed which was upon the face of the ground, both man, and cattle, and the creeping things, and the fowl of the heaven; and they were destroyed from the earth: and Noah only remained alive, and they that were with him in the ark.* The death of all flesh and the remnant of Jasher 6:26, the Genesis verdict beside it.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-yahuah-shut-him-in'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 89:6 — *But that vessel floated on the water, while all the oxen and elephants and camels and asses sank to the bottom with all the animals, so that I could no longer see them, and they were not able to escape, (but) perished and sank into the depths.* Enoch''s vision of all the beasts drowned while the vessel floats matches the all-flesh-died of Jasher 6:26.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-yahuah-shut-him-in'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=26
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=89 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 5:19 — *no man''s person was accepted save that of Noah alone; for his person was accepted in behalf of his sons, whom Elohim (God) saved from the waters of the flood on his account; for his heart was righteous in all his ways.* Jubilees names the same righteous remnant shut into the ark of Jasher 6:15, the election of the seed-line kept.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-yahuah-shut-him-in'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-6-ark-borne-up-and-rested
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 7:17 — *And the flood was forty days upon the earth; and the waters increased, and bare up the ark, and it was lift up above the earth.* The ark borne up of Jasher 6:27, the Genesis source quoted beside it.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-ark-borne-up-and-rested'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 8:1 — *And Elohim (God) remembered Noah, and every living thing, and all the cattle that was with him in the ark: and Elohim (God) made a wind to pass over the earth, and the waters asswaged.* The wind passing and the waters stilling of Jasher 6:33, the canon''s I-remembered-him beside it.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-ark-borne-up-and-rested'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 8:4 — *And the ark rested in the seventh month, on the seventeenth day of the month, upon the mountains of Ararat.* The resting on Ararat of Jasher 6:35, dated to the day in its Genesis source.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-ark-borne-up-and-rested'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 89:8 — *Then the water began to run down into these, till the earth became visible; but that vessel settled on the earth, and the darkness retired and light appeared.* Enoch''s vessel settling as the waters run down matches the ark borne up and resting of Jasher 6:27, 6:35.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-ark-borne-up-and-rested'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=27
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=89 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-6-go-forth-blessed-fruitful
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 8:16 — *Go forth of the ark, thou, and thy wife, and thy sons, and thy sons'' wives with thee.* The command to go out that Jasher 6:40 obeys, the Genesis source beside it.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-go-forth-blessed-fruitful'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 9:1 — *And Elohim (God) blessed Noah and his sons, and said unto them, Be fruitful, and multiply, and replenish the earth.* The be-fruitful blessing of Jasher 6:42, the Genesis charge to the renewed seed-line.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-go-forth-blessed-fruitful'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 6:5 — *And you, increase you and multiply upon the earth, and become many upon it, and be a blessing upon it.* Jubilees keeps the same multiply-and-be-a-blessing word that Jasher 6:42 carries, the patriarchal record self-linked.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-go-forth-blessed-fruitful'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=42
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-6-altar-covenant-bow
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 8:20 — *And Noah builded an altar unto Yahuah (LORD); and took of every clean beast, and of every clean fowl, and offered burnt offerings on the altar.* The service of Yahuah that Jasher 6:41 records is the clean-beast altar of Genesis, Torah-worship before Sinai.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-altar-covenant-bow'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake; for the imagination of man''s heart is evil from his youth; neither will I again smite any more every thing living, as I have done.* The mercy that follows Noah''s altar in Jasher 6:41, the I-will-not-again of the covenant.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-altar-covenant-bow'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 9:13 — *I do set my bow in the cloud, and it shall be for a token of a covenant between me and the earth.* The bow sealing the covenant that crowns Noah''s service in Jasher 6:41.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-altar-covenant-bow'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 6:4 — *And Yahuah (God) smelt the goodly savour, and He made a covenant with him that there should not be any more a flood to destroy the earth.* Jubilees keeps the same altar-savour and no-more-flood covenant that follows the service of Jasher 6:41.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-altar-covenant-bow'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=41
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 6:16 — *He set His bow in the cloud for a sign of the eternal covenant that there should not again be a flood on the earth to destroy it all the days of the earth.* Jubilees keeps the bow of the eternal covenant that crowns Noah''s going-forth in Jasher 6:41, self-linked.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-altar-covenant-bow'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=41
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

