-- ----- fragment: minion_ecclesiasticus_50.sql (session253 ecclesiasticus 50) -----
-- Source anchor: apocrypha/ecclesiasticus ch50. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir50 (view _session253_sir50_lookup). Sort band base 59525, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir50_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: sirach-50-simon-repaired-the-house
  ('apocrypha', 'ecclesiasticus', 50, 1, 'canon', 'exodus', 28, 2, 'free', E'Exodus 28:2 — *And thou shalt make holy garments for Aaron thy brother for glory and for beauty.* Simon repairing the house and serving in priestly office (Sirach 50:1) stands in the line of Aaron, the first robed for glory and beauty.'),
  ('apocrypha', 'ecclesiasticus', 50, 1, 'canon', 'hebrews', 8, 1, 'free', E'Hebrews 8:1 — *Now of the things which we have spoken this is the sum: We have such an high priest, who is set on the right hand of the throne of the Majesty in the heavens;* the earthly high priest who repaired the temple (Sirach 50:1) is the shadow of the better High Priest enthroned in the true heavens.'),
  ('apocrypha', 'ecclesiasticus', 50, 2, 'canon', 'hebrews', 8, 2, 'free', E'Hebrews 8:2 — *A minister of the sanctuary, and of the true tabernacle, which Yahuah (Lord) pitched, and not man.* Simon building the high fortress of the wall about the temple (Sirach 50:2) is the made-with-hands figure of the true tabernacle pitched by Yahuah Himself.'),
  -- thread: sirach-50-morning-star-rainbow-sun
  ('apocrypha', 'ecclesiasticus', 50, 7, 'canon', 'malachi', 4, 2, 'free', E'Malachi 4:2 — *But unto you that fear my name shall the Sun of righteousness arise with healing in his wings; and ye shall go forth, and grow up as calves of the stall.* Simon as the sun shining upon the temple (Sirach 50:7) is the priestly shadow of the Sun of righteousness the prophet promised to rise over those who fear the Name.'),
  ('apocrypha', 'ecclesiasticus', 50, 7, 'canon', 'genesis', 9, 13, 'free', E'Genesis 9:13 — *I do set my bow in the cloud, and it shall be for a token of a covenant between me and the earth.* The high priest as the rainbow giving light in the bright clouds (Sirach 50:7) wears the very covenant-sign Yahuah set in the cloud.'),
  ('apocrypha', 'ecclesiasticus', 50, 7, 'canon', 'revelation', 4, 3, 'free', E'Revelation 4:3 — *And he that sat was to look upon like a jasper and a sardine stone: and there was a rainbow round about the throne, in sight like unto an emerald.* The rainbow about the glory of Simon at the altar (Sirach 50:7) is a glimpse of the rainbow John saw encircling the throne itself.'),
  ('apocrypha', 'ecclesiasticus', 50, 6, 'canon', '2-peter', 1, 19, 'free', E'2 Peter 1:19 — *We have also a more sure word of prophecy; whereunto ye do well that ye take heed, as unto a light that shineth in a dark place, until the day dawn, and the day star arise in your hearts:* the priest as the morning star in the midst of a cloud (Sirach 50:6) foreshadows the day star Peter says will arise in the hearts of the faithful.'),
  -- thread: sirach-50-cedar-palm-olive-trees
  ('apocrypha', 'ecclesiasticus', 50, 12, 'apocrypha', 'ecclesiasticus', 24, 13, 'extras', E'Ecclesiasticus 24:13 — *I was exalted like a cedar in Libanus, and as a cypress tree upon the mountains of Hermon.* Simon compassed about as a young cedar in Libanus (Sirach 50:12) is robed in the very tree-imagery Wisdom used of herself in this same book.'),
  ('apocrypha', 'ecclesiasticus', 50, 10, 'apocrypha', 'ecclesiasticus', 24, 14, 'extras', E'Ecclesiasticus 24:14 — *I was exalted like a palm tree in En-gaddi, and as a rose plant in Jericho, as a fair olive tree in a pleasant field, and grew up as a plane tree by the water.* Simon as a fair olive tree budding forth fruit (Sirach 50:10) echoes Wisdom''s self-portrait as the fair olive tree and palm planted by the waters.'),
  -- thread: sirach-50-blood-of-the-grape-poured-out
  ('apocrypha', 'ecclesiasticus', 50, 14, 'canon', 'leviticus', 16, 16, 'free', E'Leviticus 16:16 — *And he shall make an atonement for the holy place, because of the uncleanness of the children of Yashar''el (Israel), and because of their transgressions in all their sins: and so shall he do for the tabernacle of the congregation, that remaineth among them in the midst of their uncleanness.* Simon finishing the service at the altar (Sirach 50:14) is the high priest performing the atonement Aaron was commanded to make for the holy place.'),
  ('apocrypha', 'ecclesiasticus', 50, 15, 'canon', 'hebrews', 9, 7, 'free', E'Hebrews 9:7 — *But into the second went the high priest alone once every year, not without blood, which he offered for himself, and for the errors of the people:* Simon pouring out the blood of the grape at the foot of the altar (Sirach 50:15) enacts the once-a-year, not-without-blood service Hebrews names as the figure of the true.'),
  ('apocrypha', 'ecclesiasticus', 50, 15, 'canon', 'hebrews', 9, 12, 'free', E'Hebrews 9:12 — *Neither by the blood of goats and calves, but by his own blood he entered in once into the holy place, having obtained eternal redemption for us.* The poured-out cup of Simon''s offering (Sirach 50:15) is the shadow whose substance is the Messiah entering once with His own blood — the type, not the fulfilment.'),
  -- thread: sirach-50-sons-of-aaron-oblations-better-priesthood
  ('apocrypha', 'ecclesiasticus', 50, 13, 'canon', 'hebrews', 7, 11, 'free', E'Hebrews 7:11 — *If therefore perfection were by the Levitical priesthood, (for under it the people received the law,) what further need was there that another priest should rise after the order of Melek Tsadiq (Melchizedek), and not be called after the order of Aaron?* The sons of Aaron in their glory (Sirach 50:13) are the Levitical priesthood whose very glory Hebrews shows pointed beyond itself to another priest.'),
  ('apocrypha', 'ecclesiasticus', 50, 13, 'canon', 'hebrews', 7, 24, 'free', E'Hebrews 7:24 — *But this man, because he continueth ever, hath an unchangeable priesthood.* The sons of Aaron with the oblations in their hands (Sirach 50:13) were many priests who passed by death, the shadow of the one Priest whose priesthood does not pass.'),
  -- thread: sirach-50-aaronic-blessing-lifted-over-the-people
  ('apocrypha', 'ecclesiasticus', 50, 20, 'canon', 'numbers', 6, 23, 'free', E'Numbers 6:23 — *Speak unto Aaron and unto his sons, saying, On this wise ye shall bless the children of Yashar''el (Israel), saying unto them,* Simon lifting his hands to give the blessing of Yahuah (Sirach 50:20) is performing the very Aaronic blessing Yahuah commanded the priests to speak over the people.'),
  ('apocrypha', 'ecclesiasticus', 50, 20, 'canon', 'numbers', 6, 25, 'free', E'Numbers 6:25 — *Yahuah (LORD) make his face shine upon thee, and be gracious unto thee:* the blessing of Yahuah Simon spoke with his lips over the congregation (Sirach 50:20) is the word of the shining face the priests were given to pronounce.'),
  ('apocrypha', 'ecclesiasticus', 50, 20, 'canon', 'numbers', 6, 27, 'free', E'Numbers 6:27 — *And they shall put my name upon the children of Yashar''el (Israel); and I will bless them.* Simon rejoicing in the Name as he blesses the people (Sirach 50:20) places that very Name upon Israel, as the blessing was ordained to do.'),
  ('apocrypha', 'ecclesiasticus', 50, 21, 'canon', 'matthew', 11, 28, 'free', E'Matthew 11:28 — *Come unto me, all ye that labour and are heavy laden, and I will give you rest.* The congregation bowing to receive a blessing from the Most High (Sirach 50:21) finds its fulfilment in the wisdom-call of the Messiah, who opens His arms to give rest to all who come.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir50_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir50_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-50-simon-repaired-the-house',
       E'Simon repaired the house and fortified the temple',
       E'*Simon the high priest, the son of Onias, who in his life repaired the house again, and in his days fortified the temple: And by him was built from the foundation the double height, the high fortress of the wall about the temple* (Ecclesiasticus 50:1-2). The praise of Simon ben Onias opens the great hymn that closes Sirach: the high priest who restored the house of Yahuah, who *took care of the temple that it should not fall, and fortified the city against besieging* (Ecclesiasticus 50:4). This is the office Aaron was first set into — *And thou shalt make holy garments for Aaron thy brother for glory and for beauty* (Exodus 28:2) — and it stands in the long line of those who repaired the breach of the sanctuary. It ain''t new: the better priesthood the writer of Hebrews unfolds is the very office Simon held in shadow, *We have such an high priest, who is set on the right hand of the throne of the Majesty in the heavens* (Hebrews 8:1), the true tabernacle which Yahuah pitched and not man.',
       sv.verse_id, ev.verse_id, 'extras', 59525
  FROM _session253_sir50_lookup sv, _session253_sir50_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=50 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=50 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-50-morning-star-rainbow-sun',
       E'As the morning star, the rainbow, the sun upon the temple',
       E'*He was as the morning star in the midst of a cloud, and as the moon at the full: As the sun shining upon the temple of the Most High, and as the rainbow giving light in the bright clouds* (Ecclesiasticus 50:6-7). The high priest in his glory at the altar is sung in the light-imagery of heaven — morning star, full moon, sun, rainbow. The rainbow round about glory is the throne-sign of the covenant: *I do set my bow in the cloud, and it shall be for a token of a covenant between me and the earth* (Genesis 9:13), and John saw it about the very throne — *there was a rainbow round about the throne, in sight like unto an emerald* (Revelation 4:3). The Sun that shines upon the house of Yahuah points beyond Simon to the One the prophet named, *unto you that fear my name shall the Sun of righteousness arise with healing in his wings* (Malachi 4:2), and the day star Peter says shall *arise in your hearts* (2 Peter 1:19). Do not collapse Simon into the Messiah; the radiance of the priest at the altar is the shadow, and the Sun of righteousness is the substance.',
       sv.verse_id, ev.verse_id, 'extras', 59528
  FROM _session253_sir50_lookup sv, _session253_sir50_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=50 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=50 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-50-cedar-palm-olive-trees',
       E'Compassed as a cedar of Libanus, the trees of the sanctuary',
       E'*And as a fair olive tree budding forth fruit, and as a cypress tree which grows up to the clouds* (Ecclesiasticus 50:10), and at the altar Simon stood *compassed about, as a young cedar in Libanus; and as palm trees compassed they him round about* (Ecclesiasticus 50:12). The tree-imagery here is drawn straight from Wisdom''s own self-praise earlier in this same book, where she says *I was exalted like a cedar in Libanus, and as a cypress tree upon the mountains of Hermon* and *as a fair olive tree in a pleasant field* (Ecclesiasticus 24:13-14). The glory of the priest at the altar is sung in the very words by which Wisdom — that *came out of the mouth of the Most High* — described herself rooted among the people. It ain''t new: the cedar, the palm, the olive that adorn the sanctuary are the standing trees of the house of Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 59531
  FROM _session253_sir50_lookup sv, _session253_sir50_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=50 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=50 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-50-blood-of-the-grape-poured-out',
       E'The blood of the grape poured at the foot of the altar',
       E'*And finishing the service at the altar, that he might adorn the offering of the most high Almighty, He stretched out his hand to the cup, and poured of the blood of the grape, he poured out at the foot of the altar a sweetsmelling savour to the most high King of all* (Ecclesiasticus 50:14-15). This is the high priest completing the once-a-year service — the Day of Atonement office of Aaron, *And he shall make an atonement for the holy place, because of the uncleanness of the children of Yashar''el (Israel)* (Leviticus 16:16). The writer of Hebrews names the limit of this very service honestly: *into the second went the high priest alone once every year, not without blood, which he offered for himself, and for the errors of the people* (Hebrews 9:7), a figure that *could not make him that did the service perfect, as pertaining to the conscience* (Hebrews 9:9). Simon''s poured-out cup of the grape''s blood is the shadow that points to the once-for-all blood — but Simon is not the Messiah; the type ascends to Him who *by his own blood he entered in once into the holy place, having obtained eternal redemption for us* (Hebrews 9:12).',
       sv.verse_id, ev.verse_id, 'extras', 59534
  FROM _session253_sir50_lookup sv, _session253_sir50_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=50 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=50 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-50-sons-of-aaron-oblations-better-priesthood',
       E'The sons of Aaron in their glory, and the better priesthood',
       E'*So were all the sons of Aaron in their glory, and the oblations of Yahuah (God) in their hands, before all the congregation of Yashar''el (Israel)* (Ecclesiasticus 50:13). The sons of Aaron stand in their glory with the offerings in their hands before the whole assembly — the Levitical priesthood at its height. Yet the writer of Hebrews shows the limit honestly: *If therefore perfection were by the Levitical priesthood, (for under it the people received the law,) what further need was there that another priest should rise after the order of Melek Tsadiq (Melchizedek), and not be called after the order of Aaron?* (Hebrews 7:11). The Aaronic priests *truly were many priests, because they were not suffered to continue by reason of death* (Hebrews 7:23) — Simon and his sons in their glory are the shadow, and the One who *continueth ever, hath an unchangeable priesthood* (Hebrews 7:24) is the substance toward which it all points. It ain''t new: the glory of Aaron''s sons is real, and it is a shadow.',
       sv.verse_id, ev.verse_id, 'extras', 59537
  FROM _session253_sir50_lookup sv, _session253_sir50_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=50 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=50 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'sirach-50-aaronic-blessing-lifted-over-the-people',
       E'He lifted up his hands to give the blessing of Yahuah',
       E'*Then he went down, and lifted up his hands over the whole congregation of the children of Yashar''el (Israel), to give the blessing of Yahuah (God) with his lips, and to rejoice in his name. And they bowed themselves down to worship the second time, that they might receive a blessing from the Most High* (Ecclesiasticus 50:20-21). This is the priestly blessing of Aaron lifted over the people — the very rite Yahuah gave: *On this wise ye shall bless the children of Yashar''el (Israel)... Yahuah (LORD) bless thee, and keep thee: Yahuah (LORD) make his face shine upon thee, and be gracious unto thee* (Numbers 6:23-25), for *they shall put my name upon the children of Yashar''el (Israel); and I will bless them* (Numbers 6:27). Simon rejoicing in the Name as he blesses is the Aaronic blessing kept alive in the second-temple sanctuary. And the wisdom-call this book closes with — the invitation to take up instruction and find rest — points to the One who would say, *Come unto me, all ye that labour and are heavy laden, and I will give you rest* (Matthew 11:28). It ain''t new: the lifted hands of the priest and the open arms of the wisdom-call are the same blessing, sealed in the Name.',
       sv.verse_id, ev.verse_id, 'extras', 59540
  FROM _session253_sir50_lookup sv, _session253_sir50_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=50 AND sv.verse_number=20
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=50 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: sirach-50-simon-repaired-the-house
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 28:2 — *And thou shalt make holy garments for Aaron thy brother for glory and for beauty.* Simon repairing the house and serving in priestly office (Sirach 50:1) stands in the line of Aaron, the first robed for glory and beauty.'
  FROM cross_reference_threads t, cross_references x, _session253_sir50_lookup sv, _session253_sir50_lookup tv
 WHERE t.slug='sirach-50-simon-repaired-the-house'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=50 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=28 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 8:1 — *Now of the things which we have spoken this is the sum: We have such an high priest, who is set on the right hand of the throne of the Majesty in the heavens;* the earthly high priest who repaired the temple (Sirach 50:1) is the shadow of the better High Priest enthroned in the true heavens.'
  FROM cross_reference_threads t, cross_references x, _session253_sir50_lookup sv, _session253_sir50_lookup tv
 WHERE t.slug='sirach-50-simon-repaired-the-house'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=50 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=8 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 8:2 — *A minister of the sanctuary, and of the true tabernacle, which Yahuah (Lord) pitched, and not man.* Simon building the high fortress of the wall about the temple (Sirach 50:2) is the made-with-hands figure of the true tabernacle pitched by Yahuah Himself.'
  FROM cross_reference_threads t, cross_references x, _session253_sir50_lookup sv, _session253_sir50_lookup tv
 WHERE t.slug='sirach-50-simon-repaired-the-house'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=50 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-50-morning-star-rainbow-sun
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 4:2 — *But unto you that fear my name shall the Sun of righteousness arise with healing in his wings; and ye shall go forth, and grow up as calves of the stall.* Simon as the sun shining upon the temple (Sirach 50:7) is the priestly shadow of the Sun of righteousness the prophet promised to rise over those who fear the Name.'
  FROM cross_reference_threads t, cross_references x, _session253_sir50_lookup sv, _session253_sir50_lookup tv
 WHERE t.slug='sirach-50-morning-star-rainbow-sun'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=50 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 9:13 — *I do set my bow in the cloud, and it shall be for a token of a covenant between me and the earth.* The high priest as the rainbow giving light in the bright clouds (Sirach 50:7) wears the very covenant-sign Yahuah set in the cloud.'
  FROM cross_reference_threads t, cross_references x, _session253_sir50_lookup sv, _session253_sir50_lookup tv
 WHERE t.slug='sirach-50-morning-star-rainbow-sun'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=50 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 4:3 — *And he that sat was to look upon like a jasper and a sardine stone: and there was a rainbow round about the throne, in sight like unto an emerald.* The rainbow about the glory of Simon at the altar (Sirach 50:7) is a glimpse of the rainbow John saw encircling the throne itself.'
  FROM cross_reference_threads t, cross_references x, _session253_sir50_lookup sv, _session253_sir50_lookup tv
 WHERE t.slug='sirach-50-morning-star-rainbow-sun'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=50 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Peter 1:19 — *We have also a more sure word of prophecy; whereunto ye do well that ye take heed, as unto a light that shineth in a dark place, until the day dawn, and the day star arise in your hearts:* the priest as the morning star in the midst of a cloud (Sirach 50:6) foreshadows the day star Peter says will arise in the hearts of the faithful.'
  FROM cross_reference_threads t, cross_references x, _session253_sir50_lookup sv, _session253_sir50_lookup tv
 WHERE t.slug='sirach-50-morning-star-rainbow-sun'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=50 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=1 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-50-cedar-palm-olive-trees
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiasticus 24:13 — *I was exalted like a cedar in Libanus, and as a cypress tree upon the mountains of Hermon.* Simon compassed about as a young cedar in Libanus (Sirach 50:12) is robed in the very tree-imagery Wisdom used of herself in this same book.'
  FROM cross_reference_threads t, cross_references x, _session253_sir50_lookup sv, _session253_sir50_lookup tv
 WHERE t.slug='sirach-50-cedar-palm-olive-trees'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=50 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiasticus 24:14 — *I was exalted like a palm tree in En-gaddi, and as a rose plant in Jericho, as a fair olive tree in a pleasant field, and grew up as a plane tree by the water.* Simon as a fair olive tree budding forth fruit (Sirach 50:10) echoes Wisdom''s self-portrait as the fair olive tree and palm planted by the waters.'
  FROM cross_reference_threads t, cross_references x, _session253_sir50_lookup sv, _session253_sir50_lookup tv
 WHERE t.slug='sirach-50-cedar-palm-olive-trees'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=50 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-50-blood-of-the-grape-poured-out
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 16:16 — *And he shall make an atonement for the holy place, because of the uncleanness of the children of Yashar''el (Israel), and because of their transgressions in all their sins: and so shall he do for the tabernacle of the congregation, that remaineth among them in the midst of their uncleanness.* Simon finishing the service at the altar (Sirach 50:14) is the high priest performing the atonement Aaron was commanded to make for the holy place.'
  FROM cross_reference_threads t, cross_references x, _session253_sir50_lookup sv, _session253_sir50_lookup tv
 WHERE t.slug='sirach-50-blood-of-the-grape-poured-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=50 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 9:7 — *But into the second went the high priest alone once every year, not without blood, which he offered for himself, and for the errors of the people:* Simon pouring out the blood of the grape at the foot of the altar (Sirach 50:15) enacts the once-a-year, not-without-blood service Hebrews names as the figure of the true.'
  FROM cross_reference_threads t, cross_references x, _session253_sir50_lookup sv, _session253_sir50_lookup tv
 WHERE t.slug='sirach-50-blood-of-the-grape-poured-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=50 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 9:12 — *Neither by the blood of goats and calves, but by his own blood he entered in once into the holy place, having obtained eternal redemption for us.* The poured-out cup of Simon''s offering (Sirach 50:15) is the shadow whose substance is the Messiah entering once with His own blood — the type, not the fulfilment.'
  FROM cross_reference_threads t, cross_references x, _session253_sir50_lookup sv, _session253_sir50_lookup tv
 WHERE t.slug='sirach-50-blood-of-the-grape-poured-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=50 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-50-sons-of-aaron-oblations-better-priesthood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 7:11 — *If therefore perfection were by the Levitical priesthood, (for under it the people received the law,) what further need was there that another priest should rise after the order of Melek Tsadiq (Melchizedek), and not be called after the order of Aaron?* The sons of Aaron in their glory (Sirach 50:13) are the Levitical priesthood whose very glory Hebrews shows pointed beyond itself to another priest.'
  FROM cross_reference_threads t, cross_references x, _session253_sir50_lookup sv, _session253_sir50_lookup tv
 WHERE t.slug='sirach-50-sons-of-aaron-oblations-better-priesthood'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=50 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 7:24 — *But this man, because he continueth ever, hath an unchangeable priesthood.* The sons of Aaron with the oblations in their hands (Sirach 50:13) were many priests who passed by death, the shadow of the one Priest whose priesthood does not pass.'
  FROM cross_reference_threads t, cross_references x, _session253_sir50_lookup sv, _session253_sir50_lookup tv
 WHERE t.slug='sirach-50-sons-of-aaron-oblations-better-priesthood'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=50 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: sirach-50-aaronic-blessing-lifted-over-the-people
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 6:23 — *Speak unto Aaron and unto his sons, saying, On this wise ye shall bless the children of Yashar''el (Israel), saying unto them,* Simon lifting his hands to give the blessing of Yahuah (Sirach 50:20) is performing the very Aaronic blessing Yahuah commanded the priests to speak over the people.'
  FROM cross_reference_threads t, cross_references x, _session253_sir50_lookup sv, _session253_sir50_lookup tv
 WHERE t.slug='sirach-50-aaronic-blessing-lifted-over-the-people'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=50 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=6 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 6:25 — *Yahuah (LORD) make his face shine upon thee, and be gracious unto thee:* the blessing of Yahuah Simon spoke with his lips over the congregation (Sirach 50:20) is the word of the shining face the priests were given to pronounce.'
  FROM cross_reference_threads t, cross_references x, _session253_sir50_lookup sv, _session253_sir50_lookup tv
 WHERE t.slug='sirach-50-aaronic-blessing-lifted-over-the-people'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=50 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=6 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 6:27 — *And they shall put my name upon the children of Yashar''el (Israel); and I will bless them.* Simon rejoicing in the Name as he blesses the people (Sirach 50:20) places that very Name upon Israel, as the blessing was ordained to do.'
  FROM cross_reference_threads t, cross_references x, _session253_sir50_lookup sv, _session253_sir50_lookup tv
 WHERE t.slug='sirach-50-aaronic-blessing-lifted-over-the-people'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=50 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=6 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 11:28 — *Come unto me, all ye that labour and are heavy laden, and I will give you rest.* The congregation bowing to receive a blessing from the Most High (Sirach 50:21) finds its fulfilment in the wisdom-call of the Messiah, who opens His arms to give rest to all who come.'
  FROM cross_reference_threads t, cross_references x, _session253_sir50_lookup sv, _session253_sir50_lookup tv
 WHERE t.slug='sirach-50-aaronic-blessing-lifted-over-the-people'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=50 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=11 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

