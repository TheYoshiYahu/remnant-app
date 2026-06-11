-- ----- fragment: minion_1enoch_43.sql (session250 1-enoch 43) -----
-- Source anchor: enoch/1-enoch ch43. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en43 (view _session250_en43_lookup). Sort band base 51050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en43_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-43-stars-called-by-name
  ('enoch', '1-enoch', 43, 1, 'canon', 'psalms', 147, 4, 'free', E'Psalm 147:4 — *He telleth the number of the stars; he calleth them all by their names.* The Psalmist gives in one verse exactly what Enoch saw in vision: every star numbered and personally named by its Maker.'),
  ('enoch', '1-enoch', 43, 1, 'canon', 'isaiah', 40, 26, 'free', E'Isaiah 40:26 — *Lift up your eyes on high, and behold who hath created these things, that bringeth out their host by number: he calleth them all by names by the greatness of his might, for that he is strong in power; not one faileth.* Isaiah''s calling-by-name of the host that never fails is the same obedient hearkening Enoch watched the stars give Him.'),
  ('enoch', '1-enoch', 43, 1, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 3, 34, 'extras', E'Baruch 3:34 — *The stars shined in their watches, and rejoiced: when he calls them, they say, Here we be; and so with cheerfulness they shewed light to him that made them.* Baruch supplies the stars'' answer to Enoch''s roll-call — they hearken and report present to the One who named them.'),
  -- thread: 1-enoch-43-weighed-in-the-balance
  ('enoch', '1-enoch', 43, 2, 'apocrypha', 'the-wisdom-of-solomon', 11, 20, 'extras', E'Wisdom of Solomon 11:20 — *Yea, and without these might they have fallen down with one blast, being persecuted of vengeance, and scattered abroad through the breath of your power: but you have ordered all things in measure and number and weight.* The same triad of measure, number, and weight that Enoch sees in the weighed stars is named as the Creator''s ordering of all things.'),
  ('enoch', '1-enoch', 43, 2, 'canon', 'job', 38, 31, 'free', E'Job 38:31 — *Canst thou bind the sweet influences of Pleiades, or loose the bands of Orion?* The God who can bind and loose the constellations is the One Enoch sees weighing each star in the balance according to its light.'),
  ('enoch', '1-enoch', 43, 2, 'canon', 'job', 38, 33, 'free', E'Job 38:33 — *Knowest thou the ordinances of heaven? canst thou set the dominion thereof in the earth?* The unknowable ordinances of heaven Job is rebuked for not knowing are precisely the measured revolutions Enoch was shown.'),
  -- thread: 1-enoch-43-they-transgress-not-their-law
  ('enoch', '1-enoch', 43, 3, 'canon', 'jeremiah', 31, 35, 'free', E'Jeremiah 31:35 — *Thus saith Yahuah (LORD), which giveth the sun for a light by day, and the ordinances of the moon and of the stars for a light by night, which divideth the sea when the waves thereof roar; Yahuah Tseva''ot (LORD of hosts) is his name:* The unbreakable ordinances Jeremiah names are the prescribed law Enoch sees the lights never transgress.'),
  ('enoch', '1-enoch', 43, 3, 'canon', 'jeremiah', 33, 25, 'free', E'Jeremiah 33:25 — *Thus saith Yahuah (LORD); If my covenant be not with day and night, and if I have not appointed the ordinances of heaven and earth;* The covenant fixedness of day, night, and the heavenly ordinances is the same unswerving order in which Enoch''s lights return to their place.'),
  ('enoch', '1-enoch', 43, 3, 'enoch', '1-enoch', 2, 1, 'extras', E'1 Enoch 2:1 — *Observe ye everything that takes place in the heaven, how they do not change their orbits, and the luminaries which are in the heaven, how they all rise and set in order each in its season, and transgress not against their appointed order.* Enoch''s own opening summons echoes 43:3 — the luminaries keep their appointed order and never transgress it.'),
  -- thread: 1-enoch-43-pillars-and-winds-of-heaven
  ('enoch', '1-enoch', 43, 7, 'canon', 'job', 38, 4, 'free', E'Job 38:4 — *Where wast thou when I laid the foundations of the earth? declare, if thou hast understanding.* The foundations laid before man existed are the pillars and supports Enoch is shown holding up heaven and earth.'),
  ('enoch', '1-enoch', 43, 7, 'canon', 'job', 38, 6, 'free', E'Job 38:6 — *Whereupon are the foundations thereof fastened? or who laid the corner stone thereof;* Job''s question about what the foundations are fastened upon answers to Enoch''s vision of the winds that are the pillars of heaven.'),
  ('enoch', '1-enoch', 43, 9, 'canon', 'jeremiah', 10, 13, 'free', E'Jeremiah 10:13 — *When he uttereth his voice, there is a multitude of waters in the heavens, and he causeth the vapours to ascend from the ends of the earth; he maketh lightnings with rain, and bringeth forth the wind out of his treasures.* The wind brought out of treasures, the lightnings and the clouds are the very things Enoch watches the winds carry across the earth.'),
  -- thread: 1-enoch-43-founded-the-world-by-wisdom
  ('enoch', '1-enoch', 43, 13, 'canon', 'proverbs', 3, 19, 'free', E'Proverbs 3:19 — *Yahuah (LORD) by wisdom hath founded the earth; by understanding hath he established the heavens.* This is Enoch''s confession exactly: the world founded and ordered by the Creator''s wisdom.'),
  ('enoch', '1-enoch', 43, 13, 'canon', 'jeremiah', 10, 12, 'free', E'Jeremiah 10:12 — *He hath made the earth by his power, he hath established the world by his wisdom, and hath stretched out the heavens by his discretion.* The world established by wisdom and the heavens stretched out are precisely what Enoch saw the winds and treasuries serve.'),
  ('enoch', '1-enoch', 43, 12, 'canon', 'proverbs', 8, 28, 'free', E'Proverbs 8:28 — *When he established the clouds above: when he strengthened the fountains of the deep:* Wisdom present at the establishing of the clouds answers to Enoch''s treasuries of the clouds and the rain ordered by His wisdom.'),
  ('enoch', '1-enoch', 43, 12, 'jubilees', 'jubilees', 2, 2, 'extras', E'Jubilees 2:2 — *For on the first day He created the heavens which are above and the earth and the waters and all the spirits which serve before Him–the angels of the presence, and the angels of sanctification, and the angels of the spirit of fire and the angels of the spirit of the winds, and the angels of the spirit of the clouds, and of darkness, and of snow and of hail and of hoar frost, and the angels of the voices and of the thunder and of the lightning, and the angels of the spirits of cold and of heat, and of winter and of spring and of autumn and of summer, and of all the spirits of His creatures which are in the heavens and on the earth, (He created) the abysses and the darkness, eventide (and night), and the light, dawn and day, which He has prepared in the knowledge of His heart.* Jubilees catalogues the very treasuries Enoch lists — snow, hail, clouds, winds, lightning — as ordered creatures set under God from the first day.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en43_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en43_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-43-stars-called-by-name',
       E'He calls the stars by their names',
       E'Enoch sees the host of heaven answer to the Creator personally, by name: *And I saw other lightnings and the stars of heaven, and I saw how He called them all by their names and they hearkened unto Him.* (1 Enoch 43:1). This is no abstract cosmology — it is the same Yahuah whom the Psalmist praises, *He telleth the number of the stars; he calleth them all by their names.* (Psalm 147:4), and whom Isaiah summons the proud to consider, *Lift up your eyes on high, and behold who hath created these things, that bringeth out their host by number: he calleth them all by names by the greatness of his might, for that he is strong in power; not one faileth.* (Isaiah 40:26). The extra-canon witness keeps the same key: in Baruch the stars themselves answer the roll-call, *The stars shined in their watches, and rejoiced: when he calls them, they say, Here we be; and so with cheerfulness they shewed light to him that made them.* (Baruch 3:34). Enoch''s heaven is the canon''s heaven — a creation that knows its Maker''s voice and obeys it by name. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 51050
  FROM _session250_en43_lookup sv, _session250_en43_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=43 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=43 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-43-weighed-in-the-balance',
       E'Weighed in measure, number, and order',
       E'Enoch sees not only that the stars are named but that they are measured: *And I saw how they are weighed in the balance according to their light, and according to the measure of their days, and how their revolution produces lightning, and in accordance with the number of the change of the months they change their revolution.* (1 Enoch 43:2). The God who orders the lights by weight and number is the God who challenges Job out of the whirlwind, *Knowest thou the ordinances of heaven? canst thou set the dominion thereof in the earth?* (Job 38:33), and who binds the constellations, *Canst thou bind the sweet influences of Pleiades, or loose the bands of Orion?* (Job 38:31). The Wisdom of Solomon names the principle outright: the Creator *have ordered all things in measure and number and weight.* (Wisdom of Solomon 11:20) — Enoch''s balance is that very ordering seen in the heavens. The lights run by exact decree, and the change of the months follows their measured revolution; this is the canon''s own cosmos of fixed weight, not a pagan astrology.',
       sv.verse_id, ev.verse_id, 'extras', 51053
  FROM _session250_en43_lookup sv, _session250_en43_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=43 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=43 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-43-they-transgress-not-their-law',
       E'They do not transgress their prescribed law',
       E'The lights of heaven keep covenant: *And when the year of their revolution is accomplished, they all return to their place in their own order, and they do not transgress their prescribed law.* (1 Enoch 43:3), and the chariots of sun and moon *do not turn aside from their path* (1 Enoch 43:4). This obedient order is the canon''s witness to the fixedness of God''s appointment. Yahuah sets the heavens as a covenant-sign: *Thus saith Yahuah (LORD), which giveth the sun for a light by day, and the ordinances of the moon and of the stars for a light by night, which divideth the sea when the waves thereof roar; Yahuah Tseva''ot (LORD of hosts) is his name:* (Jeremiah 31:35), and binds the survival of His people to that very order: *Thus saith Yahuah (LORD); If my covenant be not with day and night, and if I have not appointed the ordinances of heaven and earth; Then will I cast away the seed of Jacob* (Jeremiah 33:25). Enoch''s own astronomy book sounds the same note — the luminaries *transgress not against their appointed order* (1 Enoch 2:1). The lights keep their law as the righteous are called to keep Torah: a faithful, unbroken obedience to the Creator''s decree. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 51056
  FROM _session250_en43_lookup sv, _session250_en43_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=43 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=43 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-43-pillars-and-winds-of-heaven',
       E'The winds that uphold and stretch out the heavens',
       E'Enoch sees the machinery that holds creation steady: *And I saw the four winds which support the earth and the firmament of the heaven.* (1 Enoch 43:6), and *And I saw how the winds stretch out the vaults of heaven, and have their station between heaven and earth: these are the pillars of the heaven.* (1 Enoch 43:7). The Tanakh sets the same foundations and pillars by the Maker''s hand: *Where wast thou when I laid the foundations of the earth? declare, if thou hast understanding.* (Job 38:4), and *Whereupon are the foundations thereof fastened? or who laid the corner stone thereof;* (Job 38:6). The same God *hath stretched out the heavens by his discretion* and stirs the very winds Enoch watches: *When he uttereth his voice, there is a multitude of waters in the heavens, and he causeth the vapours to ascend from the ends of the earth; he maketh lightnings with rain, and bringeth forth the wind out of his treasures.* (Jeremiah 10:13). Enoch''s stretched-out vaults and wind-pillars are the canon''s stretched-out heavens and founded pillars — the cosmos a built house with the Creator as its architect.',
       sv.verse_id, ev.verse_id, 'extras', 51059
  FROM _session250_en43_lookup sv, _session250_en43_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=43 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=43 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-43-founded-the-world-by-wisdom',
       E'He ordered all creation by His wisdom',
       E'Enoch''s tour of the treasuries ends in a confession: *And I saw the treasuries of all the winds: I saw how He has ordered all creation by His wisdom, and how He has founded the world upon them.* (1 Enoch 43:13), having seen *the treasuries of the snow and the treasuries of the hail, and the treasuries of the clouds, and the treasuries of the dew and the rain.* (1 Enoch 43:12). This is the canon''s wisdom-cosmology word for word: *Yahuah (LORD) by wisdom hath founded the earth; by understanding hath he established the heavens.* (Proverbs 3:19), and *He hath made the earth by his power, he hath established the world by his wisdom, and hath stretched out the heavens by his discretion.* (Jeremiah 10:12). The very treasuries Enoch catalogues God asks Job about: *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail* — and Wisdom herself was present when *he established the clouds above: when he strengthened the fountains of the deep:* (Proverbs 8:28). Jubilees keeps the same inventory of ordered spirits — *the angels of the spirit of the clouds, and of darkness, and of snow and of hail* (Jubilees 2:2). Enoch''s founded-by-wisdom world is the canon''s founded-by-wisdom world; Torah''s order in the heavens is the same order God appoints among His people. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 51062
  FROM _session250_en43_lookup sv, _session250_en43_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=43 AND sv.verse_number=12
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=43 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-43-stars-called-by-name
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 147:4 — *He telleth the number of the stars; he calleth them all by their names.* The Psalmist gives in one verse exactly what Enoch saw in vision: every star numbered and personally named by its Maker.'
  FROM cross_reference_threads t, cross_references x, _session250_en43_lookup sv, _session250_en43_lookup tv
 WHERE t.slug='1-enoch-43-stars-called-by-name'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=43 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=147 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 40:26 — *Lift up your eyes on high, and behold who hath created these things, that bringeth out their host by number: he calleth them all by names by the greatness of his might, for that he is strong in power; not one faileth.* Isaiah''s calling-by-name of the host that never fails is the same obedient hearkening Enoch watched the stars give Him.'
  FROM cross_reference_threads t, cross_references x, _session250_en43_lookup sv, _session250_en43_lookup tv
 WHERE t.slug='1-enoch-43-stars-called-by-name'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=43 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Baruch 3:34 — *The stars shined in their watches, and rejoiced: when he calls them, they say, Here we be; and so with cheerfulness they shewed light to him that made them.* Baruch supplies the stars'' answer to Enoch''s roll-call — they hearken and report present to the One who named them.'
  FROM cross_reference_threads t, cross_references x, _session250_en43_lookup sv, _session250_en43_lookup tv
 WHERE t.slug='1-enoch-43-stars-called-by-name'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=43 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=3 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-43-weighed-in-the-balance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Wisdom of Solomon 11:20 — *Yea, and without these might they have fallen down with one blast, being persecuted of vengeance, and scattered abroad through the breath of your power: but you have ordered all things in measure and number and weight.* The same triad of measure, number, and weight that Enoch sees in the weighed stars is named as the Creator''s ordering of all things.'
  FROM cross_reference_threads t, cross_references x, _session250_en43_lookup sv, _session250_en43_lookup tv
 WHERE t.slug='1-enoch-43-weighed-in-the-balance'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=43 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=11 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 38:31 — *Canst thou bind the sweet influences of Pleiades, or loose the bands of Orion?* The God who can bind and loose the constellations is the One Enoch sees weighing each star in the balance according to its light.'
  FROM cross_reference_threads t, cross_references x, _session250_en43_lookup sv, _session250_en43_lookup tv
 WHERE t.slug='1-enoch-43-weighed-in-the-balance'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=43 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 38:33 — *Knowest thou the ordinances of heaven? canst thou set the dominion thereof in the earth?* The unknowable ordinances of heaven Job is rebuked for not knowing are precisely the measured revolutions Enoch was shown.'
  FROM cross_reference_threads t, cross_references x, _session250_en43_lookup sv, _session250_en43_lookup tv
 WHERE t.slug='1-enoch-43-weighed-in-the-balance'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=43 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-43-they-transgress-not-their-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 31:35 — *Thus saith Yahuah (LORD), which giveth the sun for a light by day, and the ordinances of the moon and of the stars for a light by night, which divideth the sea when the waves thereof roar; Yahuah Tseva''ot (LORD of hosts) is his name:* The unbreakable ordinances Jeremiah names are the prescribed law Enoch sees the lights never transgress.'
  FROM cross_reference_threads t, cross_references x, _session250_en43_lookup sv, _session250_en43_lookup tv
 WHERE t.slug='1-enoch-43-they-transgress-not-their-law'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=43 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 33:25 — *Thus saith Yahuah (LORD); If my covenant be not with day and night, and if I have not appointed the ordinances of heaven and earth;* The covenant fixedness of day, night, and the heavenly ordinances is the same unswerving order in which Enoch''s lights return to their place.'
  FROM cross_reference_threads t, cross_references x, _session250_en43_lookup sv, _session250_en43_lookup tv
 WHERE t.slug='1-enoch-43-they-transgress-not-their-law'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=43 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=33 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 2:1 — *Observe ye everything that takes place in the heaven, how they do not change their orbits, and the luminaries which are in the heaven, how they all rise and set in order each in its season, and transgress not against their appointed order.* Enoch''s own opening summons echoes 43:3 — the luminaries keep their appointed order and never transgress it.'
  FROM cross_reference_threads t, cross_references x, _session250_en43_lookup sv, _session250_en43_lookup tv
 WHERE t.slug='1-enoch-43-they-transgress-not-their-law'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=43 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-43-pillars-and-winds-of-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 38:4 — *Where wast thou when I laid the foundations of the earth? declare, if thou hast understanding.* The foundations laid before man existed are the pillars and supports Enoch is shown holding up heaven and earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en43_lookup sv, _session250_en43_lookup tv
 WHERE t.slug='1-enoch-43-pillars-and-winds-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=43 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 38:6 — *Whereupon are the foundations thereof fastened? or who laid the corner stone thereof;* Job''s question about what the foundations are fastened upon answers to Enoch''s vision of the winds that are the pillars of heaven.'
  FROM cross_reference_threads t, cross_references x, _session250_en43_lookup sv, _session250_en43_lookup tv
 WHERE t.slug='1-enoch-43-pillars-and-winds-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=43 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 10:13 — *When he uttereth his voice, there is a multitude of waters in the heavens, and he causeth the vapours to ascend from the ends of the earth; he maketh lightnings with rain, and bringeth forth the wind out of his treasures.* The wind brought out of treasures, the lightnings and the clouds are the very things Enoch watches the winds carry across the earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en43_lookup sv, _session250_en43_lookup tv
 WHERE t.slug='1-enoch-43-pillars-and-winds-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=43 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-43-founded-the-world-by-wisdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 3:19 — *Yahuah (LORD) by wisdom hath founded the earth; by understanding hath he established the heavens.* This is Enoch''s confession exactly: the world founded and ordered by the Creator''s wisdom.'
  FROM cross_reference_threads t, cross_references x, _session250_en43_lookup sv, _session250_en43_lookup tv
 WHERE t.slug='1-enoch-43-founded-the-world-by-wisdom'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=43 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 10:12 — *He hath made the earth by his power, he hath established the world by his wisdom, and hath stretched out the heavens by his discretion.* The world established by wisdom and the heavens stretched out are precisely what Enoch saw the winds and treasuries serve.'
  FROM cross_reference_threads t, cross_references x, _session250_en43_lookup sv, _session250_en43_lookup tv
 WHERE t.slug='1-enoch-43-founded-the-world-by-wisdom'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=43 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 8:28 — *When he established the clouds above: when he strengthened the fountains of the deep:* Wisdom present at the establishing of the clouds answers to Enoch''s treasuries of the clouds and the rain ordered by His wisdom.'
  FROM cross_reference_threads t, cross_references x, _session250_en43_lookup sv, _session250_en43_lookup tv
 WHERE t.slug='1-enoch-43-founded-the-world-by-wisdom'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=43 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 2:2 — *For on the first day He created the heavens which are above and the earth and the waters and all the spirits which serve before Him–the angels of the presence, and the angels of sanctification, and the angels of the spirit of fire and the angels of the spirit of the winds, and the angels of the spirit of the clouds, and of darkness, and of snow and of hail and of hoar frost, and the angels of the voices and of the thunder and of the lightning, and the angels of the spirits of cold and of heat, and of winter and of spring and of autumn and of summer, and of all the spirits of His creatures which are in the heavens and on the earth, (He created) the abysses and the darkness, eventide (and night), and the light, dawn and day, which He has prepared in the knowledge of His heart.* Jubilees catalogues the very treasuries Enoch lists — snow, hail, clouds, winds, lightning — as ordered creatures set under God from the first day.'
  FROM cross_reference_threads t, cross_references x, _session250_en43_lookup sv, _session250_en43_lookup tv
 WHERE t.slug='1-enoch-43-founded-the-world-by-wisdom'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=43 AND sv.verse_number=12
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

