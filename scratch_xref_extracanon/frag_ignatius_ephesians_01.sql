-- ----- fragment: minion_ignatiusephesians_01.sql (session253 ignatius-ephesians 1) -----
-- Source anchor: lightfoot-apostolic-fathers/ignatius-ephesians ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: igeph1 (view _session253_igeph1_lookup). Sort band base 70200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_igeph1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ignatius-ephesians-1-seed-of-david
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 18, 'canon', 'romans', 1, 3, 'free', E'Romans 1:3 — *Concerning his Son Yahusha HaMashiach (Jesus Christ) our Lord, which was made of the seed of David according to the flesh;* Paul names the very thing Ignatius defends in 1:18 — the Messiah truly of David''s seed in the flesh.'),
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 20, 'canon', '2-timothy', 2, 8, 'free', E'2 Timothy 2:8 — *Remember that Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead according to my gospel:* matches Ignatius 1:20, who calls him the one who after the flesh was of David''s race and points to his passion and resurrection.'),
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 18, 'canon', 'isaiah', 7, 14, 'free', E'Isaiah 7:14 — *Therefore Yahuah (Lord) himself shall give you a sign; Behold, a virgin shall conceive, and bear a son, and shall call his name Immanuel.* The virgin-conception Ignatius affirms in 1:18 was promised by the prophet centuries before.'),
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 18, 'canon', 'matthew', 1, 23, 'free', E'Matthew 1:23 — *Behold, a virgin shall be with child, and shall bring forth a son, and they shall call his name Emmanuel, which being interpreted is, Elohim (God) with us.* Matthew records the fulfilment of the virgin-birth Ignatius confesses in 1:18.'),
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 18, 'canon', '1-john', 4, 2, 'free', E'1 John 4:2 — *Hereby know ye the Spirit of Elohim (God): Every spirit that confesseth that Yahusha HaMashiach (Jesus Christ) is come in the flesh is of Elohim (God):* John gives the very test of true confession that Ignatius wields in 1:18 against those who deny the Messiah''s flesh.'),
  -- thread: ignatius-ephesians-1-star-at-his-birth
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 19, 'canon', 'matthew', 2, 2, 'free', E'Matthew 2:2 — *Saying, Where is he that is born King of the Yahudim (Jews)? for we have seen his star in the east, and are come to worship him.* The star Ignatius describes in 1:19 is the very star the magi followed to the newborn King.'),
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 19, 'canon', 'matthew', 2, 9, 'free', E'Matthew 2:9 — *When they had heard the king, they departed; and, lo, the star, which they saw in the east, went before them, till it came and stood over where the young child was.* Matthew confirms the heavenly sign at the nativity that Ignatius exalts in 1:19.'),
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 19, 'canon', 'numbers', 24, 17, 'free', E'Numbers 24:17 — *I shall see him, but not now: I shall behold him, but not nigh: there shall come a Star out of Jacob, and a Sceptre shall rise out of Yashar''el (Israel), and shall smite the corners of Moab, and destroy all the children of Sheth.* Balaam''s Star out of Jacob is the ancient prophecy behind the outshining star of Ignatius 1:19.'),
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 19, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* the lights were ordained for signs from creation, and one such sign heralded the King in Ignatius 1:19.'),
  -- thread: ignatius-ephesians-1-temple-of-elohim
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 9, 'canon', 'ephesians', 2, 21, 'free', E'Ephesians 2:21 — *In whom all the building fitly framed together groweth unto an holy temple in Yahuah (Lord):* Paul''s holy temple of living stones is the image Ignatius takes up in 1:9 for the Ephesians built into Elohim''s house.'),
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 9, 'canon', 'ephesians', 2, 22, 'free', E'Ephesians 2:22 — *In whom ye also are builded together for an habitation of Elohim (God) through the Spirit.* The Ephesians being built into a habitation of Elohim is exactly Ignatius''s stones-of-a-temple in 1:9.'),
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 15, 'canon', 'matthew', 18, 20, 'free', E'Matthew 18:20 — *For where two or three are gathered together in my name, there am I in the midst of them.* The indwelling Ignatius desires in 1:15, that we be His temples, is the Messiah''s own promise to the gathered.'),
  -- thread: ignatius-ephesians-1-one-faith-one-body
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 4, 'canon', 'ephesians', 4, 3, 'free', E'Ephesians 4:3 — *Endeavouring to keep the unity of the Spirit in the bond of peace.* Paul''s charge to keep the Spirit''s unity is the very concord Ignatius urges on the Ephesians in 1:4.'),
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 5, 'canon', 'ephesians', 4, 4, 'free', E'Ephesians 4:4 — *There is one body, and one Spirit, even as ye are called in one hope of your calling;* the one body and one hope is the harmonious unity Ignatius seeks in 1:5.'),
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 20, 'canon', 'ephesians', 4, 5, 'free', E'Ephesians 4:5 — *One Yahuah (Lord), one faith, one baptism,* echoes Ignatius''s call in 1:20 to assemble in one faith and one Messiah.'),
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 4, 'canon', 'ephesians', 4, 6, 'free', E'Ephesians 4:6 — *One Elohim (God) and Father of all, who is above all, and through all, and in you all.* The one Father unto whom Ignatius would have them sing with one voice in 1:4.'),
  -- thread: ignatius-ephesians-1-elohim-resisteth-the-proud
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 5, 'canon', 'james', 4, 6, 'free', E'James 4:6 — *But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble.* The exact saying Ignatius quotes as Scripture in 1:5 stands written in James.'),
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 5, 'canon', '1-peter', 5, 5, 'free', E'1 Peter 5:5 — *Likewise, ye younger, submit yourselves unto the elder. Yea, all of you be subject one to another, and be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble.* Peter joins submission to elders with the same word Ignatius cites in 1:5 against the proud who separate.'),
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 5, 'canon', 'proverbs', 3, 34, 'free', E'Proverbs 3:34 — *Surely he scorneth the scorners: but he giveth grace unto the lowly.* The Tanakh root of the proverb Ignatius quotes in 1:5, carried forward by James and Peter.'),
  -- thread: ignatius-ephesians-1-one-physician
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 7, 'canon', 'matthew', 9, 12, 'free', E'Matthew 9:12 — *But when Yahusha (Jesus) heard that, he said unto them, They that be whole need not a physician, but they that are sick.* The Messiah calls himself the physician of the sick, the one only physician Ignatius confesses in 1:7.'),
  ('lightfoot-apostolic-fathers', 'ignatius-ephesians', 1, 7, 'canon', 'exodus', 15, 26, 'free', E'Exodus 15:26 — *And said, If thou wilt diligently hearken to the voice of Yahuah Elohayka (the LORD thy God), and wilt do that which is right in his sight, and wilt give ear to his commandments, and keep all his statutes, I will put none of these diseases upon thee, which I have brought upon the Egyptians: for I am Yahuah Rapha (the LORD that healeth thee).* The LORD who heals, bound to His commandments, is the one physician of flesh and spirit named in Ignatius 1:7.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_igeph1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_igeph1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-ephesians-1-seed-of-david',
       E'Of the seed of David, born of the virgin — the real incarnation',
       E'Ignatius writes against those who would empty the Messiah of his flesh: *For our Elohim (God), Yahusha (Jesus) the Messiah (Christ), was conceived in the womb by Mary according to a dispensation, of the seed of David but also of the Ruach HaKodesh (Holy Spirit); and He was born and was baptized that by His passion He might cleanse water* (Ignatius to the Ephesians 1:18). It ain''t new — Paul preached the same gospel *Concerning his Son Yahusha HaMashiach (Jesus Christ) our Lord, which was made of the seed of David according to the flesh* (Romans 1:3), and bade Timothy *Remember that Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead according to my gospel* (2 Timothy 2:8). The virgin-birth was sworn long before through Isaiah, *Behold, a virgin shall conceive, and bear a son, and shall call his name Immanuel* (Isaiah 7:14), fulfilled in Matthew, *they shall call his name Emmanuel, which being interpreted is, Elohim (God) with us* (Matthew 1:23). And the test Ignatius applies is John''s own: *Every spirit that confesseth that Yahusha HaMashiach (Jesus Christ) is come in the flesh is of Elohim (God)* (1 John 4:2). The Messiah truly came in the flesh, of David''s seed.',
       sv.verse_id, ev.verse_id, 'extras', 70200
  FROM _session253_igeph1_lookup sv, _session253_igeph1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=18
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-ephesians' AND ev.chapter_number=1 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-ephesians-1-star-at-his-birth',
       E'A star far outshining them all — the star out of Jacob',
       E'Ignatius tells of the sign in the heavens at the nativity: *A star shone forth in the heaven above all the stars; and its light was unutterable... and all the rest of the constellations with the sun and moon formed themselves into a chorus about the star; but the star itself far outshone them all* (Ignatius to the Ephesians 1:19). It ain''t new — the wise men followed it: *Where is he that is born King of the Yahudim (Jews)? for we have seen his star in the east, and are come to worship him* (Matthew 2:2), and *lo, the star, which they saw in the east, went before them, till it came and stood over where the young child was* (Matthew 2:9). Balaam foresaw that very star in the wilderness: *there shall come a Star out of Jacob, and a Sceptre shall rise out of Yashar''el (Israel)* (Numbers 24:17). The lights were appointed for signs from the fourth day: *let them be for signs, and for seasons, and for days, and years* (Genesis 1:14). The whole host bowed to the King.',
       sv.verse_id, ev.verse_id, 'extras', 70203
  FROM _session253_igeph1_lookup sv, _session253_igeph1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=19
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-ephesians' AND ev.chapter_number=1 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-ephesians-1-temple-of-elohim',
       E'Stones of a temple, fitly framed — His temples',
       E'Ignatius calls the saints living stones: *ye are stones of a temple, which were prepared beforehand for a building of Elohim (God) the Father, being hoisted up to the heights through the engine of Yahusha HaMashiach (Jesus Christ), which is the Cross* (Ignatius to the Ephesians 1:9), and bids them be *His temples and He Himself may be in us as our Elohim (God)* (Ignatius to the Ephesians 1:15). It ain''t new — Paul wrote to these same Ephesians of the building *In whom all the building fitly framed together groweth unto an holy temple in Yahuah (Lord)* (Ephesians 2:21), *In whom ye also are builded together for an habitation of Elohim (God) through the Spirit* (Ephesians 2:22). And the gathered stones are never alone, for *where two or three are gathered together in my name, there am I in the midst of them* (Matthew 18:20). The dwelling-place of Elohim is His assembled people.',
       sv.verse_id, ev.verse_id, 'extras', 70206
  FROM _session253_igeph1_lookup sv, _session253_igeph1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-ephesians' AND ev.chapter_number=1 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-ephesians-1-one-faith-one-body',
       E'Harmonious in one — one body, one faith',
       E'Ignatius longs for the saints to sing as one: *being harmonious in concord and taking the key note of Elohim (God) ye may in unison sing with one voice through Yahusha HaMashiach (Jesus Christ) unto the Father* (Ignatius to the Ephesians 1:4), and again to be *closely joined with him... that all things may be harmonious in unity* (Ignatius to the Ephesians 1:5), gathered at last *in one faith and one Yahusha HaMashiach (Jesus Christ)* (Ignatius to the Ephesians 1:20). It ain''t new — Paul charged these very Ephesians, *Endeavouring to keep the unity of the Spirit in the bond of peace* (Ephesians 4:3), *There is one body, and one Spirit, even as ye are called in one hope of your calling* (Ephesians 4:4), *One Yahuah (Lord), one faith, one baptism* (Ephesians 4:5), *One Elohim (God) and Father of all, who is above all, and through all, and in you all* (Ephesians 4:6). The one body keeps the one faith.',
       sv.verse_id, ev.verse_id, 'extras', 70209
  FROM _session253_igeph1_lookup sv, _session253_igeph1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=4
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-ephesians' AND ev.chapter_number=1 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-ephesians-1-elohim-resisteth-the-proud',
       E'It is written, Elohim resisteth the proud',
       E'Ignatius quotes the Scripture outright: *Whosoever therefore cometh not to the congregation, he doth thereby show his pride and hath separated himself; for it is written, Elohim (God) resisteth the proud* (Ignatius to the Ephesians 1:5). It ain''t new — he is citing the apostles word for word. James wrote, *But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble* (James 4:6), and Peter, *be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble* (1 Peter 5:5). Both draw it from the proverb, *Surely he scorneth the scorners: but he giveth grace unto the lowly* (Proverbs 3:34). Ignatius shows his "it is written" reaches back through the apostles into the Tanakh — the same canon, unbroken.',
       sv.verse_id, ev.verse_id, 'extras', 70212
  FROM _session253_igeph1_lookup sv, _session253_igeph1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=5
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-ephesians' AND ev.chapter_number=1 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ignatius-ephesians-1-one-physician',
       E'One only physician, of flesh and of spirit',
       E'Ignatius confesses the Healer: *There is one only physician, of flesh and of spirit, generate and ingenerate, Elohim (God)... Son of Mary and Son of Elohim (God), first passible and then impassible, Yahusha HaMashiach (Jesus Christ) our Lord* (Ignatius to the Ephesians 1:7). It ain''t new — the Messiah named himself the physician of the sick: *They that be whole need not a physician, but they that are sick* (Matthew 9:12). And the office is the LORD''s from of old, declared at the waters of Marah: *I am Yahuah Rapha (the LORD that healeth thee)* (Exodus 15:26) — bound there to keeping His commandments and statutes. The one physician of flesh and spirit is none other than Yahuah Rapha come in the flesh.',
       sv.verse_id, ev.verse_id, 'extras', 70215
  FROM _session253_igeph1_lookup sv, _session253_igeph1_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=7
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='ignatius-ephesians' AND ev.chapter_number=1 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ignatius-ephesians-1-seed-of-david
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 1:3 — *Concerning his Son Yahusha HaMashiach (Jesus Christ) our Lord, which was made of the seed of David according to the flesh;* Paul names the very thing Ignatius defends in 1:18 — the Messiah truly of David''s seed in the flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-seed-of-david'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Timothy 2:8 — *Remember that Yahusha HaMashiach (Jesus Christ) of the seed of David was raised from the dead according to my gospel:* matches Ignatius 1:20, who calls him the one who after the flesh was of David''s race and points to his passion and resurrection.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-seed-of-david'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 7:14 — *Therefore Yahuah (Lord) himself shall give you a sign; Behold, a virgin shall conceive, and bear a son, and shall call his name Immanuel.* The virgin-conception Ignatius affirms in 1:18 was promised by the prophet centuries before.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-seed-of-david'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 1:23 — *Behold, a virgin shall be with child, and shall bring forth a son, and they shall call his name Emmanuel, which being interpreted is, Elohim (God) with us.* Matthew records the fulfilment of the virgin-birth Ignatius confesses in 1:18.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-seed-of-david'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 John 4:2 — *Hereby know ye the Spirit of Elohim (God): Every spirit that confesseth that Yahusha HaMashiach (Jesus Christ) is come in the flesh is of Elohim (God):* John gives the very test of true confession that Ignatius wields in 1:18 against those who deny the Messiah''s flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-seed-of-david'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-ephesians-1-star-at-his-birth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 2:2 — *Saying, Where is he that is born King of the Yahudim (Jews)? for we have seen his star in the east, and are come to worship him.* The star Ignatius describes in 1:19 is the very star the magi followed to the newborn King.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-star-at-his-birth'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 2:9 — *When they had heard the king, they departed; and, lo, the star, which they saw in the east, went before them, till it came and stood over where the young child was.* Matthew confirms the heavenly sign at the nativity that Ignatius exalts in 1:19.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-star-at-his-birth'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 24:17 — *I shall see him, but not now: I shall behold him, but not nigh: there shall come a Star out of Jacob, and a Sceptre shall rise out of Yashar''el (Israel), and shall smite the corners of Moab, and destroy all the children of Sheth.* Balaam''s Star out of Jacob is the ancient prophecy behind the outshining star of Ignatius 1:19.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-star-at-his-birth'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=24 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* the lights were ordained for signs from creation, and one such sign heralded the King in Ignatius 1:19.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-star-at-his-birth'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-ephesians-1-temple-of-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 2:21 — *In whom all the building fitly framed together groweth unto an holy temple in Yahuah (Lord):* Paul''s holy temple of living stones is the image Ignatius takes up in 1:9 for the Ephesians built into Elohim''s house.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-temple-of-elohim'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 2:22 — *In whom ye also are builded together for an habitation of Elohim (God) through the Spirit.* The Ephesians being built into a habitation of Elohim is exactly Ignatius''s stones-of-a-temple in 1:9.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-temple-of-elohim'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=2 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 18:20 — *For where two or three are gathered together in my name, there am I in the midst of them.* The indwelling Ignatius desires in 1:15, that we be His temples, is the Messiah''s own promise to the gathered.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-temple-of-elohim'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=18 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-ephesians-1-one-faith-one-body
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 4:3 — *Endeavouring to keep the unity of the Spirit in the bond of peace.* Paul''s charge to keep the Spirit''s unity is the very concord Ignatius urges on the Ephesians in 1:4.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-one-faith-one-body'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 4:4 — *There is one body, and one Spirit, even as ye are called in one hope of your calling;* the one body and one hope is the harmonious unity Ignatius seeks in 1:5.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-one-faith-one-body'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 4:5 — *One Yahuah (Lord), one faith, one baptism,* echoes Ignatius''s call in 1:20 to assemble in one faith and one Messiah.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-one-faith-one-body'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ephesians 4:6 — *One Elohim (God) and Father of all, who is above all, and through all, and in you all.* The one Father unto whom Ignatius would have them sing with one voice in 1:4.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-one-faith-one-body'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-ephesians-1-elohim-resisteth-the-proud
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 4:6 — *But he giveth more grace. Wherefore he saith, Elohim (God) resisteth the proud, but giveth grace unto the humble.* The exact saying Ignatius quotes as Scripture in 1:5 stands written in James.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-elohim-resisteth-the-proud'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 5:5 — *Likewise, ye younger, submit yourselves unto the elder. Yea, all of you be subject one to another, and be clothed with humility: for Elohim (God) resisteth the proud, and giveth grace to the humble.* Peter joins submission to elders with the same word Ignatius cites in 1:5 against the proud who separate.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-elohim-resisteth-the-proud'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 3:34 — *Surely he scorneth the scorners: but he giveth grace unto the lowly.* The Tanakh root of the proverb Ignatius quotes in 1:5, carried forward by James and Peter.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-elohim-resisteth-the-proud'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ignatius-ephesians-1-one-physician
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 9:12 — *But when Yahusha (Jesus) heard that, he said unto them, They that be whole need not a physician, but they that are sick.* The Messiah calls himself the physician of the sick, the one only physician Ignatius confesses in 1:7.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-one-physician'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=9 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 15:26 — *And said, If thou wilt diligently hearken to the voice of Yahuah Elohayka (the LORD thy God), and wilt do that which is right in his sight, and wilt give ear to his commandments, and keep all his statutes, I will put none of these diseases upon thee, which I have brought upon the Egyptians: for I am Yahuah Rapha (the LORD that healeth thee).* The LORD who heals, bound to His commandments, is the one physician of flesh and spirit named in Ignatius 1:7.'
  FROM cross_reference_threads t, cross_references x, _session253_igeph1_lookup sv, _session253_igeph1_lookup tv
 WHERE t.slug='ignatius-ephesians-1-one-physician'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='ignatius-ephesians' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

