-- ----- fragment: minion_therestofesther_15.sql (session253 the-rest-of-esther 15) -----
-- Source anchor: apocrypha/the-rest-of-esther ch15. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: roe15 (view _session253_roe15_lookup). Sort band base 60525, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_roe15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: rest-of-esther-15-third-day-glorious-apparel
  ('apocrypha', 'the-rest-of-esther', 15, 1, 'canon', 'esther', 5, 1, 'free', E'Esther 5:1 — *Now it came to pass on the third day, that Esther put on her royal apparel, and stood in the inner court of the king’s house, over against the king’s house: and the king sat upon his royal throne in the royal house, over against the gate of the house.* The canonical Esther records the same third-day approach in royal apparel that Rest of Esther 15:1 unfolds in prayer.'),
  ('apocrypha', 'the-rest-of-esther', 15, 1, 'canon', 'esther', 4, 16, 'free', E'Esther 4:16 — *Go, gather together all the Yahudim (Jews) that are present in Shushan, and fast ye for me, and neither eat nor drink three days, night or day: I also and my maidens will fast likewise; and so will I go in unto the king, which is not according to the law: and if I perish, I perish.* The three-day fast Esther commands is the hidden labor whose end Rest of Esther 15:1 marks when she lays away her mourning garments.'),
  ('apocrypha', 'the-rest-of-esther', 15, 1, 'canon', 'psalms', 30, 5, 'free', E'Psalm 30:5 — *For his anger endureth but a moment; in his favour is life: weeping may endure for a night, but joy cometh in the morning.* The psalm names the very turn enacted in Rest of Esther 15:1, where night-long mourning gives way to glorious apparel.'),
  ('apocrypha', 'the-rest-of-esther', 15, 1, 'canon', 'isaiah', 61, 3, 'free', E'Isaiah 61:3 — *To appoint unto them that mourn in Zion, to give unto them beauty for ashes, the oil of joy for mourning, the garment of praise for the spirit of heaviness; that they might be called trees of righteousness, the planting of Yahuah (LORD), that he might be glorified.* Isaiah''s exchange of the garment of praise for heaviness is the prophetic pattern of Esther trading mourning garments for glory in Rest of Esther 15:1.'),
  -- thread: rest-of-esther-15-dreadful-throne-fainting
  ('apocrypha', 'the-rest-of-esther', 15, 6, 'canon', 'esther', 5, 2, 'free', E'Esther 5:2 — *And it was so, when the king saw Esther the queen standing in the court, that she obtained favour in his sight: and the king held out to Esther the golden sceptre that was in his hand. So Esther drew near, and touched the top of the sceptre.* The canonical account renders as favour the dreadful throne-room moment Rest of Esther 15:6 paints in its terror.'),
  ('apocrypha', 'the-rest-of-esther', 15, 7, 'canon', 'psalms', 30, 7, 'free', E'Psalm 30:7 — *Yahuah (LORD), by thy favour thou hast made my mountain to stand strong: thou didst hide thy face, and I was troubled.* The trouble that overcomes the queen at the fierce countenance in Rest of Esther 15:7 is the same dread the psalmist feels when the face is hidden.'),
  -- thread: rest-of-esther-15-king-heart-turned
  ('apocrypha', 'the-rest-of-esther', 15, 8, 'canon', 'proverbs', 21, 1, 'free', E'Proverbs 21:1 — *The king’s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will.* The proverb names the exact sovereignty by which Yahuah changes the spirit of the king into mildness in Rest of Esther 15:8.'),
  ('apocrypha', 'the-rest-of-esther', 15, 8, 'canon', 'daniel', 2, 21, 'free', E'Daniel 2:21 — *And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise, and knowledge to them that know understanding:* Daniel confesses the same hand over kings that turns the heart of the king in Rest of Esther 15:8.'),
  ('apocrypha', 'the-rest-of-esther', 15, 8, 'canon', 'ezra', 7, 27, 'free', E'Ezra 7:27 — *Blessed be Yahuah Elohim (the LORD God) of our fathers, which hath put such a thing as this in the king’s heart, to beautify the house of Yahuah (LORD) which is in Jerusalem:* Ezra blesses Yahuah for putting a purpose in a Persian king''s heart, the very work done to the king''s spirit in Rest of Esther 15:8.'),
  ('apocrypha', 'the-rest-of-esther', 15, 8, 'canon', 'psalms', 37, 5, 'free', E'Psalm 37:5 — *Commit thy way unto Yahuah (LORD); trust also in him; and he shall bring it to pass.* The psalm''s counsel to commit the way and let Yahuah bring it to pass is fulfilled when He changes the king''s spirit in Rest of Esther 15:8.'),
  -- thread: rest-of-esther-15-golden-sceptre-favour
  ('apocrypha', 'the-rest-of-esther', 15, 11, 'canon', 'esther', 5, 2, 'free', E'Esther 5:2 — *And it was so, when the king saw Esther the queen standing in the court, that she obtained favour in his sight: and the king held out to Esther the golden sceptre that was in his hand. So Esther drew near, and touched the top of the sceptre.* The golden sceptre laid upon the queen''s neck in Rest of Esther 15:11 is the canonical sceptre of favour held out and touched.'),
  ('apocrypha', 'the-rest-of-esther', 15, 12, 'canon', 'nehemiah', 2, 4, 'free', E'Nehemiah 2:4 — *Then the king said unto me, For what dost thou make request? So I prayed to the Elohim (God) of heaven.* Nehemiah''s prayer at the king''s invitation to speak mirrors the king''s word ‘Speak to me’ in Rest of Esther 15:12, where the request is borne on intercession.'),
  ('apocrypha', 'the-rest-of-esther', 15, 10, 'canon', 'nehemiah', 2, 8, 'free', E'Nehemiah 2:8 — *And a letter unto Asaph the keeper of the king’s forest, that he may give me timber to make beams for the gates of the palace which appertained to the house, and for the wall of the city, and for the house that I shall enter into. And the king granted me, according to the good hand of my Elohim (God) upon me.* The king''s granting of Nehemiah''s request by the good hand of Elohim is the same hand that spares the queen and bids her come near in Rest of Esther 15:10.'),
  -- thread: rest-of-esther-15-as-an-angel-of-god
  ('apocrypha', 'the-rest-of-esther', 15, 13, 'canon', 'judges', 13, 6, 'free', E'Judges 13:6 — *Then the woman came and told her husband, saying, A man of Elohim (God) came unto me, and his countenance was like the countenance of an angel of Elohim (God), very terrible: but I asked him not whence he was, neither told he me his name:* Manoah''s wife describes the same fearful angel-like countenance the queen sees in the king in Rest of Esther 15:13.'),
  ('apocrypha', 'the-rest-of-esther', 15, 14, 'canon', 'exodus', 34, 29, 'free', E'Exodus 34:29 — *And it came to pass, when Moses came down from mount Sinai with the two tables of testimony in Moses’ hand, when he came down from the mount, that Moses wist not that the skin of his face shone while he talked with him.* The shining, grace-filled countenance the queen marvels at in Rest of Esther 15:14 echoes the radiant face that the divine presence gives in the Tanakh.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_roe15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_roe15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-15-third-day-glorious-apparel',
       E'The Third Day: Mourning Laid Aside for Glory',
       E'*And upon the third day, when she had ended her prayers, she laid away her mourning garments, and put on her glorious apparel. And being gloriously adorned, after she had called upon Yahuah (God), who is the beholder and saviour of all things, she took two maids with her* (Rest of Esther 15:1-2). The queen rises on the third day, prayer ended, sackcloth exchanged for splendour — the very motion the canonical text records plainly: *Now it came to pass on the third day, that Esther put on her royal apparel, and stood in the inner court of the king''s house* (Esther 5:1). The three-day fast that precedes it is the hidden engine: *fast ye for me, and neither eat nor drink three days, night or day... and so will I go in unto the king, which is not according to the law: and if I perish, I perish* (Esther 4:16). This is the Tanakh''s own pattern of mourning turned to joy — *For his anger endureth but a moment; in his favour is life: weeping may endure for a night, but joy cometh in the morning* (Psalm 30:5) — and the prophets seal it as covenant promise: *to give unto them beauty for ashes, the oil of joy for mourning, the garment of praise for the spirit of heaviness* (Isaiah 61:3). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 60525
  FROM _session253_roe15_lookup sv, _session253_roe15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=15 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-15-dreadful-throne-fainting',
       E'Before the Dreadful Throne: The Queen Faints',
       E'*Then having passed through all the doors, she stood before the king, who sat upon his royal throne, and was clothed with all his robes of majesty, all glittering with gold and precious stones; and he was very dreadful. Then lifting up his countenance that shone with majesty, he looked very fiercely upon her: and the queen fell down, and was pale, and fainted, and bowed herself upon the head of the maid that went before her* (Rest of Esther 15:6-7). The throne is terrible, the look fierce; the queen, who has prepared with prayer and fasting, faints at the threshold of intercession. The canonical scene is the same court, the same throne: *And it was so, when the king saw Esther the queen standing in the court, that she obtained favour in his sight* (Esther 5:2). And the psalmist knows this dread of the hidden face that makes the strong man tremble: *Yahuah (LORD), by thy favour thou hast made my mountain to stand strong: thou didst hide thy face, and I was troubled* (Psalm 30:7). The peril is real; the deliverance will not be cheap.',
       sv.verse_id, ev.verse_id, 'extras', 60528
  FROM _session253_roe15_lookup sv, _session253_roe15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=15 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-15-king-heart-turned',
       E'Yahuah Changed the Spirit of the King',
       E'*Then Yahuah (God) changed the spirit of the king into mildness, who in a fear leaped from his throne, and took her in his arms, till she came to herself again, and comforted her with loving words* (Rest of Esther 15:8). This is the heart of the chapter and the open confession of who truly rules: the deliverance is not Esther''s beauty nor the king''s whim but the sovereign hand that bends the throne. The proverb states the law of it outright: *The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will* (Proverbs 21:1). Daniel saw the same hand over empires: *And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise* (Daniel 2:21). Ezra blessed Him for the same turning of a Persian heart toward His house: *Blessed be Yahuah Elohim (the LORD God) of our fathers, which hath put such a thing as this in the king''s heart* (Ezra 7:27). And the wise are told to commit the matter and let Him bring it to pass: *Commit thy way unto Yahuah (LORD); trust also in him; and he shall bring it to pass* (Psalm 37:5). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 60531
  FROM _session253_roe15_lookup sv, _session253_roe15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=15 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-15-golden-sceptre-favour',
       E'The Golden Sceptre and the Word of Favour',
       E'*You shall not die, though our commandment be general: come near. And so he held up his golden sceptre, and laid it upon her neck, And embraced her, and said, Speak to me* (Rest of Esther 15:10-12). The death-sentence of the general law is suspended; the sceptre is extended; the queen is bidden to speak her request. The canonical Esther shows the sceptre held out and touched: *and the king held out to Esther the golden sceptre that was in his hand. So Esther drew near, and touched the top of the sceptre* (Esther 5:2). Nehemiah, another exile before a Persian throne, prays in the breath before he asks and finds the same heart opened: *Then the king said unto me, For what dost thou make request? So I prayed to the Elohim (God) of heaven* (Nehemiah 2:4), and the petition for the city is granted *according to the good hand of my Elohim (God) upon me* (Nehemiah 2:8). The favoured request before the king is the prayer answered through the king.',
       sv.verse_id, ev.verse_id, 'extras', 60534
  FROM _session253_roe15_lookup sv, _session253_roe15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=15 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'rest-of-esther-15-as-an-angel-of-god',
       E'As an Angel of Yahuah: The Countenance Full of Grace',
       E'*Then said she to him, I saw you, my lord, as an angel of Yahuah (God), and my heart was troubled for fear of your majesty. For wonderful art you, lord, and your countenance is full of grace* (Rest of Esther 15:13-14). Recovered, the queen names the dread she felt: the king''s face shone upon her like the face of a messenger of Elohim. The Tanakh knows that troubling brightness in a heavenly visitor: *A man of Elohim (God) came unto me, and his countenance was like the countenance of an angel of Elohim (God), very terrible: but I asked him not whence he was* (Judges 13:6). And it knows the face that shines from standing in the divine presence: *that Moses wist not that the skin of his face shone while he talked with him* (Exodus 34:29). The fearful, grace-filled countenance is the Tanakh''s own sign of a glory drawn from above.',
       sv.verse_id, ev.verse_id, 'extras', 60537
  FROM _session253_roe15_lookup sv, _session253_roe15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-rest-of-esther' AND ev.chapter_number=15 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: rest-of-esther-15-third-day-glorious-apparel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Esther 5:1 — *Now it came to pass on the third day, that Esther put on her royal apparel, and stood in the inner court of the king’s house, over against the king’s house: and the king sat upon his royal throne in the royal house, over against the gate of the house.* The canonical Esther records the same third-day approach in royal apparel that Rest of Esther 15:1 unfolds in prayer.'
  FROM cross_reference_threads t, cross_references x, _session253_roe15_lookup sv, _session253_roe15_lookup tv
 WHERE t.slug='rest-of-esther-15-third-day-glorious-apparel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Esther 4:16 — *Go, gather together all the Yahudim (Jews) that are present in Shushan, and fast ye for me, and neither eat nor drink three days, night or day: I also and my maidens will fast likewise; and so will I go in unto the king, which is not according to the law: and if I perish, I perish.* The three-day fast Esther commands is the hidden labor whose end Rest of Esther 15:1 marks when she lays away her mourning garments.'
  FROM cross_reference_threads t, cross_references x, _session253_roe15_lookup sv, _session253_roe15_lookup tv
 WHERE t.slug='rest-of-esther-15-third-day-glorious-apparel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 30:5 — *For his anger endureth but a moment; in his favour is life: weeping may endure for a night, but joy cometh in the morning.* The psalm names the very turn enacted in Rest of Esther 15:1, where night-long mourning gives way to glorious apparel.'
  FROM cross_reference_threads t, cross_references x, _session253_roe15_lookup sv, _session253_roe15_lookup tv
 WHERE t.slug='rest-of-esther-15-third-day-glorious-apparel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=30 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 61:3 — *To appoint unto them that mourn in Zion, to give unto them beauty for ashes, the oil of joy for mourning, the garment of praise for the spirit of heaviness; that they might be called trees of righteousness, the planting of Yahuah (LORD), that he might be glorified.* Isaiah''s exchange of the garment of praise for heaviness is the prophetic pattern of Esther trading mourning garments for glory in Rest of Esther 15:1.'
  FROM cross_reference_threads t, cross_references x, _session253_roe15_lookup sv, _session253_roe15_lookup tv
 WHERE t.slug='rest-of-esther-15-third-day-glorious-apparel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-15-dreadful-throne-fainting
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Esther 5:2 — *And it was so, when the king saw Esther the queen standing in the court, that she obtained favour in his sight: and the king held out to Esther the golden sceptre that was in his hand. So Esther drew near, and touched the top of the sceptre.* The canonical account renders as favour the dreadful throne-room moment Rest of Esther 15:6 paints in its terror.'
  FROM cross_reference_threads t, cross_references x, _session253_roe15_lookup sv, _session253_roe15_lookup tv
 WHERE t.slug='rest-of-esther-15-dreadful-throne-fainting'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 30:7 — *Yahuah (LORD), by thy favour thou hast made my mountain to stand strong: thou didst hide thy face, and I was troubled.* The trouble that overcomes the queen at the fierce countenance in Rest of Esther 15:7 is the same dread the psalmist feels when the face is hidden.'
  FROM cross_reference_threads t, cross_references x, _session253_roe15_lookup sv, _session253_roe15_lookup tv
 WHERE t.slug='rest-of-esther-15-dreadful-throne-fainting'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=30 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-15-king-heart-turned
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 21:1 — *The king’s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will.* The proverb names the exact sovereignty by which Yahuah changes the spirit of the king into mildness in Rest of Esther 15:8.'
  FROM cross_reference_threads t, cross_references x, _session253_roe15_lookup sv, _session253_roe15_lookup tv
 WHERE t.slug='rest-of-esther-15-king-heart-turned'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 2:21 — *And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise, and knowledge to them that know understanding:* Daniel confesses the same hand over kings that turns the heart of the king in Rest of Esther 15:8.'
  FROM cross_reference_threads t, cross_references x, _session253_roe15_lookup sv, _session253_roe15_lookup tv
 WHERE t.slug='rest-of-esther-15-king-heart-turned'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezra 7:27 — *Blessed be Yahuah Elohim (the LORD God) of our fathers, which hath put such a thing as this in the king’s heart, to beautify the house of Yahuah (LORD) which is in Jerusalem:* Ezra blesses Yahuah for putting a purpose in a Persian king''s heart, the very work done to the king''s spirit in Rest of Esther 15:8.'
  FROM cross_reference_threads t, cross_references x, _session253_roe15_lookup sv, _session253_roe15_lookup tv
 WHERE t.slug='rest-of-esther-15-king-heart-turned'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=7 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 37:5 — *Commit thy way unto Yahuah (LORD); trust also in him; and he shall bring it to pass.* The psalm''s counsel to commit the way and let Yahuah bring it to pass is fulfilled when He changes the king''s spirit in Rest of Esther 15:8.'
  FROM cross_reference_threads t, cross_references x, _session253_roe15_lookup sv, _session253_roe15_lookup tv
 WHERE t.slug='rest-of-esther-15-king-heart-turned'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-15-golden-sceptre-favour
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Esther 5:2 — *And it was so, when the king saw Esther the queen standing in the court, that she obtained favour in his sight: and the king held out to Esther the golden sceptre that was in his hand. So Esther drew near, and touched the top of the sceptre.* The golden sceptre laid upon the queen''s neck in Rest of Esther 15:11 is the canonical sceptre of favour held out and touched.'
  FROM cross_reference_threads t, cross_references x, _session253_roe15_lookup sv, _session253_roe15_lookup tv
 WHERE t.slug='rest-of-esther-15-golden-sceptre-favour'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='esther' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Nehemiah 2:4 — *Then the king said unto me, For what dost thou make request? So I prayed to the Elohim (God) of heaven.* Nehemiah''s prayer at the king''s invitation to speak mirrors the king''s word ‘Speak to me’ in Rest of Esther 15:12, where the request is borne on intercession.'
  FROM cross_reference_threads t, cross_references x, _session253_roe15_lookup sv, _session253_roe15_lookup tv
 WHERE t.slug='rest-of-esther-15-golden-sceptre-favour'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Nehemiah 2:8 — *And a letter unto Asaph the keeper of the king’s forest, that he may give me timber to make beams for the gates of the palace which appertained to the house, and for the wall of the city, and for the house that I shall enter into. And the king granted me, according to the good hand of my Elohim (God) upon me.* The king''s granting of Nehemiah''s request by the good hand of Elohim is the same hand that spares the queen and bids her come near in Rest of Esther 15:10.'
  FROM cross_reference_threads t, cross_references x, _session253_roe15_lookup sv, _session253_roe15_lookup tv
 WHERE t.slug='rest-of-esther-15-golden-sceptre-favour'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: rest-of-esther-15-as-an-angel-of-god
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Judges 13:6 — *Then the woman came and told her husband, saying, A man of Elohim (God) came unto me, and his countenance was like the countenance of an angel of Elohim (God), very terrible: but I asked him not whence he was, neither told he me his name:* Manoah''s wife describes the same fearful angel-like countenance the queen sees in the king in Rest of Esther 15:13.'
  FROM cross_reference_threads t, cross_references x, _session253_roe15_lookup sv, _session253_roe15_lookup tv
 WHERE t.slug='rest-of-esther-15-as-an-angel-of-god'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=13 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 34:29 — *And it came to pass, when Moses came down from mount Sinai with the two tables of testimony in Moses’ hand, when he came down from the mount, that Moses wist not that the skin of his face shone while he talked with him.* The shining, grace-filled countenance the queen marvels at in Rest of Esther 15:14 echoes the radiant face that the divine presence gives in the Tanakh.'
  FROM cross_reference_threads t, cross_references x, _session253_roe15_lookup sv, _session253_roe15_lookup tv
 WHERE t.slug='rest-of-esther-15-as-an-angel-of-god'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-rest-of-esther' AND sv.chapter_number=15 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

