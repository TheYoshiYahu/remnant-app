-- ----- fragment: minion_tobit_13.sql (session253 tobit 13) -----
-- Source anchor: apocrypha/tobit ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: tob13 (view _session253_tob13_lookup). Sort band base 59900, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_tob13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: tobit-13-scourge-and-mercy
  ('apocrypha', 'tobit', 13, 2, 'canon', 'isaiah', 54, 7, 'free', E'Isaiah 54:7 — *For a small moment have I forsaken thee; but with great mercies will I gather thee.* The same brief scourging and the overwhelming mercy of the gathering that Tobit 13:2 sings over the captivity.'),
  ('apocrypha', 'tobit', 13, 2, 'canon', 'ezekiel', 37, 12, 'free', E'Ezekiel 37:12 — *Therefore prophesy and say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, O my people, I will open your graves, and cause you to come up out of your graves, and bring you into the land of Yashar''el (Israel).* Tobit''s "leadeth down to hell, and brings up again" is the very promise of Yahuah who brings His people up out of the grave.'),
  ('apocrypha', 'tobit', 13, 1, 'canon', 'revelation', 19, 6, 'free', E'Revelation 19:6 — *And I heard as it were the voice of a great multitude, and as the voice of many waters, and as the voice of mighty thunderings, saying, Alleluia: for Yahuah Elohim (the Lord God) omnipotent reigneth.* The blessing of the everlasting kingdom Tobit opens with becomes the great Alleluia of the reigning King.'),
  -- thread: tobit-13-scattered-and-gathered
  ('apocrypha', 'tobit', 13, 5, 'canon', 'deuteronomy', 30, 3, 'free', E'Deuteronomy 30:3 — *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* Tobit 13:5 sings Moses'' own scatter-then-gather covenant back from the land of captivity.'),
  ('apocrypha', 'tobit', 13, 6, 'canon', 'deuteronomy', 30, 2, 'free', E'Deuteronomy 30:2 — *And shalt return unto Yahuah Elohayka (the LORD thy God), and shalt obey his voice according to all that I command thee this day, thou and thy children, with all thine heart, and with all thy soul.* The condition Tobit names — turning to Him "with your whole heart, and with your whole mind" — is Deuteronomy''s whole-heart return that opens the gathering.'),
  ('apocrypha', 'tobit', 13, 5, 'canon', 'ezekiel', 37, 21, 'free', E'Ezekiel 37:21 — *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land.* The gathering out of all nations Tobit 13:5 hopes for is the two-stick regathering of the whole house of Israel.'),
  -- thread: tobit-13-king-of-heaven-all-praise
  ('apocrypha', 'tobit', 13, 8, 'canon', 'psalms', 96, 3, 'free', E'Psalm 96:3 — *Declare his glory among the heathen, his wonders among all people.* Tobit''s "let all men speak, and let all praise him" is the Psalmist''s call to declare Yahuah''s glory among every nation.'),
  ('apocrypha', 'tobit', 13, 7, 'canon', 'psalms', 22, 27, 'free', E'Psalm 22:27 — *All the ends of the world shall remember and turn unto Yahuah (LORD): and all the kindreds of the nations shall worship before thee.* The King of heaven Tobit''s soul praises is the One before whom all the ends of the earth will turn and bow.'),
  ('apocrypha', 'tobit', 13, 7, 'canon', 'psalms', 22, 28, 'free', E'Psalm 22:28 — *For the kingdom is the LORD''S: and he is the governor among the nations.* Tobit''s "King of heaven" reigning over all his greatness is the kingdom that belongs to Yahuah and governs every nation.'),
  -- thread: tobit-13-jerusalem-scourged-then-tabernacle
  ('apocrypha', 'tobit', 13, 9, 'canon', 'isaiah', 54, 11, 'free', E'Isaiah 54:11 — *O thou afflicted, tossed with tempest, and not comforted, behold, I will lay thy stones with fair colours, and lay thy foundations with sapphires.* The Jerusalem Tobit 13:9 says is scourged then shown mercy is Isaiah''s afflicted city whose very foundations Yahuah re-lays with sapphire.'),
  ('apocrypha', 'tobit', 13, 10, 'canon', 'revelation', 21, 3, 'free', E'Revelation 21:3 — *And I heard a great voice out of heaven saying, Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God).* Tobit''s prayer that the tabernacle be built in Jerusalem again finds its end in Yahuah''s tabernacle dwelling forever with His people.'),
  -- thread: tobit-13-nations-bring-gifts-children-gathered
  ('apocrypha', 'tobit', 13, 11, 'canon', 'isaiah', 60, 3, 'free', E'Isaiah 60:3 — *And the Gentiles shall come to thy light, and kings to the brightness of thy rising.* The many nations Tobit 13:11 sees coming from far with gifts are Isaiah''s Gentiles and kings streaming to Jerusalem''s risen light.'),
  ('apocrypha', 'tobit', 13, 13, 'canon', 'isaiah', 60, 4, 'free', E'Isaiah 60:4 — *Lift up thine eyes round about, and see: all they gather themselves together, they come to thee: thy sons shall come from far, and thy daughters shall be nursed at thy side.* The "children of the just" gathered together in Tobit 13:13 are Zion''s sons and daughters brought home from afar.'),
  ('apocrypha', 'tobit', 13, 13, 'apocrypha', 'baruch-with-the-letter-of-jeremiah', 5, 5, 'extras', E'Baruch 5:5 — *Arise, O Jerusalem, and stand on high, and look about toward the east, and behold your children gathered from the west to the east by the word of the Holy One, rejoicing in the remembrance of Yahuah (God).* Baruch''s exile-vision of the children gathered home is the very gathering Tobit 13:13 bids the city rejoice over.'),
  -- thread: tobit-13-jewelled-new-jerusalem-alleluia
  ('apocrypha', 'tobit', 13, 16, 'canon', 'revelation', 21, 18, 'free', E'Revelation 21:18 — *And the building of the wall of it was of jasper: and the city was pure gold, like unto clear glass.* Tobit''s walls and battlements of pure gold are John''s New Jerusalem, her very wall jewelled and her city pure gold.'),
  ('apocrypha', 'tobit', 13, 16, 'canon', 'isaiah', 54, 12, 'free', E'Isaiah 54:12 — *And I will make thy windows of agates, and thy gates of carbuncles, and all thy borders of pleasant stones.* The sapphires, emeralds, and carbuncle of Tobit 13:16-17 are Isaiah''s promised gemstone city, gate and border laid in precious stone.'),
  ('apocrypha', 'tobit', 13, 18, 'canon', 'isaiah', 60, 19, 'free', E'Isaiah 60:19 — *The sun shall be no more thy light by day; neither for brightness shall the moon give light unto thee: but Yahuah (LORD) shall be unto thee an everlasting light, and thy Elohim (God) thy glory.* The streets of Tobit 13:18 that bless Yahuah "which has extolled it for ever" shine in Isaiah''s city where Yahuah Himself is the everlasting light.'),
  ('apocrypha', 'tobit', 13, 18, 'canon', 'revelation', 19, 1, 'free', E'Revelation 19:1 — *And after these things I heard a great voice of much people in heaven, saying, Alleluia; Salvation, and glory, and honour, and power, unto Yahuah Eloheinu (the Lord our God).* The "Alleluia" Tobit 13:18 puts on the streets of the rebuilt city is the very Alleluia of the heavenly multitude before the throne.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_tob13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_tob13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-13-scourge-and-mercy',
       E'He Scourges and Has Mercy; He Brings Down and Brings Up',
       E'Tobit''s song opens with the rhythm of the covenant itself — *For he does scourge, and has mercy: he leadeth down to hell, and brings up again: neither is there any that can avoid his hand* (Tobit 13:2). This is no foreign theology; it is Hannah''s song and the valley of dry bones. Yahuah forsakes for a moment to gather with everlasting kindness — *For a small moment have I forsaken thee; but with great mercies will I gather thee* (Isaiah 54:7) — and the One who leads down to the grave is the One who opens the graves: *Behold, O my people, I will open your graves, and cause you to come up out of your graves, and bring you into the land of Yashar''el (Israel)* (Ezekiel 37:12). The captive exile already confesses the resurrection hope.',
       sv.verse_id, ev.verse_id, 'extras', 59900
  FROM _session253_tob13_lookup sv, _session253_tob13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=13 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-13-scattered-and-gathered',
       E'He Scattered Us Among the Nations and Will Gather Us Again',
       E'The heart of the song is the two-house promise spoken from exile — *Confess him before the Gentiles, you children of Yashar''el (Israel): for he has scattered us among them* (Tobit 13:3), *and he will scourge us for our iniquities, and will have mercy again, and will gather us out of all nations, among whom he has scattered us* (Tobit 13:5). This is Moses'' own word at the threshold of the land: *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee* (Deuteronomy 30:3). And it is the regathering of the whole house — Judah and Joseph made one stick: *Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land* (Ezekiel 37:21). Not a church replacing Israel — the scattered house itself, brought home.',
       sv.verse_id, ev.verse_id, 'extras', 59903
  FROM _session253_tob13_lookup sv, _session253_tob13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=13 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-13-king-of-heaven-all-praise',
       E'My Soul Shall Praise the King of Heaven; Let All Men Praise Him',
       E'Tobit lifts the praise beyond Israel to all flesh — *I will extol my Elohim (God), and my soul shall praise the King of heaven, and shall rejoice in his greatness. Let all men speak, and let all praise him for his righteousness* (Tobit 13:7-8). The Psalter swells with the same universal summons: *Declare his glory among the heathen, his wonders among all people* (Psalm 96:3), and the suffering-and-vindicated king''s song ends in the very ingathering of the nations — *All the ends of the world shall remember and turn unto Yahuah (LORD): and all the kindreds of the nations shall worship before thee. For the kingdom is the LORD''S: and he is the governor among the nations* (Psalm 22:27-28). The exile''s praise is the world''s destiny.',
       sv.verse_id, ev.verse_id, 'extras', 59906
  FROM _session253_tob13_lookup sv, _session253_tob13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=13 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-13-jerusalem-scourged-then-tabernacle',
       E'O Jerusalem, Scourged for Her Children, the Tabernacle Built Again',
       E'The song turns to the holy city herself — *O Jerusalem, the holy city, he will scourge you for your children''s works, and will have mercy again on the sons of the righteous* (Tobit 13:9), *that his tabernacle may be builded in you again with joy* (Tobit 13:10). The afflicted, tempest-tossed city is comforted: *O thou afflicted, tossed with tempest, and not comforted, behold, I will lay thy stones with fair colours, and lay thy foundations with sapphires* (Isaiah 54:11). And the rebuilt tabernacle is the everlasting dwelling — *And I heard a great voice out of heaven saying, Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God)* (Revelation 21:3). The scourged city becomes Yahuah''s own tent.',
       sv.verse_id, ev.verse_id, 'extras', 59909
  FROM _session253_tob13_lookup sv, _session253_tob13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=13 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-13-nations-bring-gifts-children-gathered',
       E'Nations from Far with Gifts; the Children of the Just Gathered',
       E'The regathered city draws the nations and her own scattered children — *Many nations shall come from far to the name of Yahuah (God) with gifts in their hands, even gifts to the King of heaven* (Tobit 13:11), and *Rejoice and be glad for the children of the just: for they shall be gathered together, and shall bless Yahuah (God) of the just* (Tobit 13:13). Isaiah saw the same pilgrimage of light: *And the Gentiles shall come to thy light, and kings to the brightness of thy rising* (Isaiah 60:3), with sons borne from far: *thy sons shall come from far, and thy daughters shall be nursed at thy side* (Isaiah 60:4). Baruch, Tobit''s exile-sibling, watches the very same homecoming: *Arise, O Jerusalem, and stand on high, and look about toward the east, and behold your children gathered from the west to the east by the word of the Holy One, rejoicing in the remembrance of Yahuah (God)* (Baruch 5:5). It ain''t new — the deuterocanon sings one gathering.',
       sv.verse_id, ev.verse_id, 'extras', 59912
  FROM _session253_tob13_lookup sv, _session253_tob13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=13 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-13-jewelled-new-jerusalem-alleluia',
       E'Built with Sapphires and Gold; Her Streets Shall Say Alleluia',
       E'The song crests in the jewelled, rebuilt city — *For Jerusalem shall be built up with sapphires and emeralds, and precious stone: your walls and towers and battlements with pure gold* (Tobit 13:16), *And the streets of Jerusalem shall be paved with beryl and carbuncle and stones of Ophir. And all her streets shall say, Alleluia* (Tobit 13:17-18). John sees this very city: *And the building of the wall of it was of jasper: and the city was pure gold, like unto clear glass* (Revelation 21:18), her streets of gold and gates of pearl. Isaiah laid her gem foundations long before: *And I will make thy windows of agates, and thy gates of carbuncles, and all thy borders of pleasant stones* (Isaiah 54:12), and named Yahuah Himself her light: *but Yahuah (LORD) shall be unto thee an everlasting light, and thy Elohim (God) thy glory* (Isaiah 60:19). And the Alleluia on her streets is heaven''s own song: *And after these things I heard a great voice of much people in heaven, saying, Alleluia; Salvation, and glory, and honour, and power, unto Yahuah Eloheinu (the Lord our God)* (Revelation 19:1).',
       sv.verse_id, ev.verse_id, 'extras', 59915
  FROM _session253_tob13_lookup sv, _session253_tob13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=13 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: tobit-13-scourge-and-mercy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 54:7 — *For a small moment have I forsaken thee; but with great mercies will I gather thee.* The same brief scourging and the overwhelming mercy of the gathering that Tobit 13:2 sings over the captivity.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-scourge-and-mercy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 37:12 — *Therefore prophesy and say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, O my people, I will open your graves, and cause you to come up out of your graves, and bring you into the land of Yashar''el (Israel).* Tobit''s "leadeth down to hell, and brings up again" is the very promise of Yahuah who brings His people up out of the grave.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-scourge-and-mercy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 19:6 — *And I heard as it were the voice of a great multitude, and as the voice of many waters, and as the voice of mighty thunderings, saying, Alleluia: for Yahuah Elohim (the Lord God) omnipotent reigneth.* The blessing of the everlasting kingdom Tobit opens with becomes the great Alleluia of the reigning King.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-scourge-and-mercy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-13-scattered-and-gathered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:3 — *That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee.* Tobit 13:5 sings Moses'' own scatter-then-gather covenant back from the land of captivity.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-scattered-and-gathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:2 — *And shalt return unto Yahuah Elohayka (the LORD thy God), and shalt obey his voice according to all that I command thee this day, thou and thy children, with all thine heart, and with all thy soul.* The condition Tobit names — turning to Him "with your whole heart, and with your whole mind" — is Deuteronomy''s whole-heart return that opens the gathering.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-scattered-and-gathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 37:21 — *And say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land.* The gathering out of all nations Tobit 13:5 hopes for is the two-stick regathering of the whole house of Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-scattered-and-gathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-13-king-of-heaven-all-praise
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 96:3 — *Declare his glory among the heathen, his wonders among all people.* Tobit''s "let all men speak, and let all praise him" is the Psalmist''s call to declare Yahuah''s glory among every nation.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-king-of-heaven-all-praise'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=96 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 22:27 — *All the ends of the world shall remember and turn unto Yahuah (LORD): and all the kindreds of the nations shall worship before thee.* The King of heaven Tobit''s soul praises is the One before whom all the ends of the earth will turn and bow.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-king-of-heaven-all-praise'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 22:28 — *For the kingdom is the LORD''S: and he is the governor among the nations.* Tobit''s "King of heaven" reigning over all his greatness is the kingdom that belongs to Yahuah and governs every nation.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-king-of-heaven-all-praise'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-13-jerusalem-scourged-then-tabernacle
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 54:11 — *O thou afflicted, tossed with tempest, and not comforted, behold, I will lay thy stones with fair colours, and lay thy foundations with sapphires.* The Jerusalem Tobit 13:9 says is scourged then shown mercy is Isaiah''s afflicted city whose very foundations Yahuah re-lays with sapphire.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-jerusalem-scourged-then-tabernacle'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 21:3 — *And I heard a great voice out of heaven saying, Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God).* Tobit''s prayer that the tabernacle be built in Jerusalem again finds its end in Yahuah''s tabernacle dwelling forever with His people.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-jerusalem-scourged-then-tabernacle'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-13-nations-bring-gifts-children-gathered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 60:3 — *And the Gentiles shall come to thy light, and kings to the brightness of thy rising.* The many nations Tobit 13:11 sees coming from far with gifts are Isaiah''s Gentiles and kings streaming to Jerusalem''s risen light.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-nations-bring-gifts-children-gathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 60:4 — *Lift up thine eyes round about, and see: all they gather themselves together, they come to thee: thy sons shall come from far, and thy daughters shall be nursed at thy side.* The "children of the just" gathered together in Tobit 13:13 are Zion''s sons and daughters brought home from afar.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-nations-bring-gifts-children-gathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Baruch 5:5 — *Arise, O Jerusalem, and stand on high, and look about toward the east, and behold your children gathered from the west to the east by the word of the Holy One, rejoicing in the remembrance of Yahuah (God).* Baruch''s exile-vision of the children gathered home is the very gathering Tobit 13:13 bids the city rejoice over.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-nations-bring-gifts-children-gathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=13
   AND tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-13-jewelled-new-jerusalem-alleluia
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 21:18 — *And the building of the wall of it was of jasper: and the city was pure gold, like unto clear glass.* Tobit''s walls and battlements of pure gold are John''s New Jerusalem, her very wall jewelled and her city pure gold.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-jewelled-new-jerusalem-alleluia'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 54:12 — *And I will make thy windows of agates, and thy gates of carbuncles, and all thy borders of pleasant stones.* The sapphires, emeralds, and carbuncle of Tobit 13:16-17 are Isaiah''s promised gemstone city, gate and border laid in precious stone.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-jewelled-new-jerusalem-alleluia'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 60:19 — *The sun shall be no more thy light by day; neither for brightness shall the moon give light unto thee: but Yahuah (LORD) shall be unto thee an everlasting light, and thy Elohim (God) thy glory.* The streets of Tobit 13:18 that bless Yahuah "which has extolled it for ever" shine in Isaiah''s city where Yahuah Himself is the everlasting light.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-jewelled-new-jerusalem-alleluia'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 19:1 — *And after these things I heard a great voice of much people in heaven, saying, Alleluia; Salvation, and glory, and honour, and power, unto Yahuah Eloheinu (the Lord our God).* The "Alleluia" Tobit 13:18 puts on the streets of the rebuilt city is the very Alleluia of the heavenly multitude before the throne.'
  FROM cross_reference_threads t, cross_references x, _session253_tob13_lookup sv, _session253_tob13_lookup tv
 WHERE t.slug='tobit-13-jewelled-new-jerusalem-alleluia'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=13 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

