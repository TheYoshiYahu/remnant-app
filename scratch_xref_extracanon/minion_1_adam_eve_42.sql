-- ----- fragment: minion_1adameve_42.sql (session253 1-adam-eve 42) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch42. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae42 (view _session253_1ae42_lookup). Sort band base 65025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae42_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-42-word-promises-messiah
  ('adam-eve-conflict', '1-adam-eve', 42, 1, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word who comes down and speaks to Adam in 1 Adam & Eve 42:1 is this same eternal Logos, not a created messenger.'),
  ('adam-eve-conflict', '1-adam-eve', 42, 4, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word who promises in 1 Adam & Eve 42:4 to bring Adam up into the kingdom will Himself take flesh to do it.'),
  ('adam-eve-conflict', '1-adam-eve', 42, 2, 'canon', 'hebrews', 4, 9, 'free', E'Hebrews 4:9 — *There remaineth therefore a rest to the people of Elohim (God).* The true rest the Word names in 1 Adam & Eve 42:2 is the Sabbath-rest of the kingdom, still kept in store for the faithful.'),
  -- thread: 1-adam-eve-42-water-of-life-golgotha-blood
  ('adam-eve-conflict', '1-adam-eve', 42, 7, 'canon', 'john', 7, 37, 'free', E'John 7:37 — *In the last day, that great day of the feast, Yahusha (Jesus) stood and cried, saying, If any man thirst, let him come unto me, and drink.* The Water of Life withheld from Adam in 1 Adam & Eve 42:7 is the very drink the Messiah later cries out to give.'),
  ('adam-eve-conflict', '1-adam-eve', 42, 8, 'canon', 'john', 7, 38, 'free', E'John 7:38 — *He that believeth on me, as the scripture hath said, out of his belly shall flow rivers of living water.* The blood-as-living-water given to all Adam''s seed who believe in 1 Adam & Eve 42:8 is exactly the rivers promised to the believer.'),
  ('adam-eve-conflict', '1-adam-eve', 42, 7, 'canon', 'john', 6, 54, 'free', E'John 6:54 — *Whoso eateth my flesh, and drinketh my blood, hath eternal life; and I will raise him up at the last day.* The blood the Word promises to shed in 1 Adam & Eve 42:7 is the drink that gives the eternal life and resurrection Adam was barred from.'),
  ('adam-eve-conflict', '1-adam-eve', 42, 8, 'canon', 'revelation', 22, 17, 'free', E'Revelation 22:17 — *And the Spirit and the bride say, Come. And let him that heareth say, Come. And let him that is athirst come. And whosoever will, let him take the water of life freely.* The Water of Life promised to all believing descendants in 1 Adam & Eve 42:8 is offered freely to the end of the world.'),
  -- thread: 1-adam-eve-42-descent-breaks-gates-of-brass
  ('adam-eve-conflict', '1-adam-eve', 42, 5, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The breaking of brass gates and bruising of iron kingdoms in 1 Adam & Eve 42:5 is the head-bruising of the serpent sworn over Adam at the start.'),
  ('adam-eve-conflict', '1-adam-eve', 42, 5, 'canon', '1-peter', 3, 19, 'free', E'1 Peter 3:19 — *By which also he went and preached unto the spirits in prison.* The descent into hell the Word foretells in 1 Adam & Eve 42:5 is the Messiah''s preaching to the imprisoned spirits after the cross.'),
  ('adam-eve-conflict', '1-adam-eve', 42, 5, 'canon', 'hebrews', 2, 14, 'free', E'Hebrews 2:14 — *Forasmuch then as the children are partakers of flesh and blood, he also himself likewise took part of the same; that through death he might destroy him that had the power of death, that is, the devil.* The shattering of hell''s gates in 1 Adam & Eve 42:5 is the destroying of the devil through the Word''s own death.'),
  ('adam-eve-conflict', '1-adam-eve', 42, 6, 'canon', 'revelation', 1, 18, 'free', E'Revelation 1:18 — *I am he that liveth, and was dead; and, behold, I am alive for evermore, Amen; and have the keys of hell and of death.* The mercy that saves the souls of the righteous in 1 Adam & Eve 42:6 belongs to the One who took the very keys of hell and death.'),
  -- thread: 1-adam-eve-42-eden-lost-rest-at-end
  ('adam-eve-conflict', '1-adam-eve', 42, 10, 'canon', 'genesis', 3, 19, 'free', E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The sufferings the Word traces to the transgression in 1 Adam & Eve 42:10 are the labour and death decreed at the expulsion.'),
  ('adam-eve-conflict', '1-adam-eve', 42, 6, 'canon', '1-corinthians', 15, 22, 'free', E'1 Corinthians 15:22 — *For as in Adam all die, even so in Messiah (Christ) shall all be made alive.* The rest promised when the end of the world is come in 1 Adam & Eve 42:6 is the making-alive of all Adam''s race in the last Adam.'),
  ('adam-eve-conflict', '1-adam-eve', 42, 4, 'canon', 'revelation', 2, 7, 'free', E'Revelation 2:7 — *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* The kingdom-rest the Word pledges to Adam and his righteous seed in 1 Adam & Eve 42:4 is the restored paradise and tree of life.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae42_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae42_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-42-word-promises-messiah',
       E'The Word who comes to Adam foretells His own coming',
       E'It is the **Word of Elohim** Himself who comes down to the grieving Adam and speaks the first gospel outside the garden: *"Then came the Word of Elohim (God) to Adam, and said to him"* (1 Adam & Eve 42:1) — and the rest Adam longs for is not another patch of ground but *"the kingdom of heaven where alone there is rest"* (1 Adam & Eve 42:2), opened *"after your judgment is past and fulfilled"* (42:3). This is the Logos, the same Word who was *In the beginning... with Elohim (God), and the Word was Elohim (God)* (John 1:1) and who *was made flesh, and dwelt among us* (John 1:14). From the very first day east of Eden the One who walked with Adam is already promising to descend and save — *it ain''t new*.',
       sv.verse_id, ev.verse_id, 'extras', 65025
  FROM _session253_1ae42_lookup sv, _session253_1ae42_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=42 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=42 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-42-water-of-life-golgotha-blood',
       E'The Water of Life is His blood shed at Golgotha',
       E'Adam begged for the Water of Life, and the Word answers that it will be given — but as His own blood poured out on the cross: *"on the day that I shall shed My blood on your head in the land of Golgotha. For My blood shall be the Water of Life to you at that time, and not to just you alone, but to all your descendants who shall believe in Me"* (1 Adam & Eve 42:7-8). This is the very water the Messiah offered at the feast — *If any man thirst, let him come unto me, and drink* (John 7:37), promising *out of his belly shall flow rivers of living water* (John 7:38) — and the *pure river of water of life, clear as crystal, proceeding out of the throne of Elohim (God) and of the Lamb* (Revelation 22:1). The believing-in-Me of Adam''s seed is the same drink offered freely to whosoever will: *let him take the water of life freely* (Revelation 22:17).',
       sv.verse_id, ev.verse_id, 'extras', 65028
  FROM _session253_1ae42_lookup sv, _session253_1ae42_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=42 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=42 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-42-descent-breaks-gates-of-brass',
       E'He descends into hell and breaks the gates of brass',
       E'The Word foretells the harrowing of hell to ransom Adam: *"on the day that I shall descend into hell, and break the gates of brass, and bruise in pieces the kingdoms of iron. Then will I in mercy save your soul and the souls of the righteous"* (1 Adam & Eve 42:5-6). This is the bruising of the serpent''s head sworn from the first — *it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15) — accomplished when the Messiah *suffered for sins, the just for the unjust... being put to death in the flesh, but quickened by the Spirit* (1 Peter 3:18) and *went and preached unto the spirits in prison* (1 Peter 3:19). Through death He destroyed *him that had the power of death, that is, the devil* (Hebrews 2:14), spoiling *principalities and powers... triumphing over them in it* (Colossians 2:15), and now holds *the keys of hell and of death* (Revelation 1:18). The first-day promise to Adam is the cross-day victory; *it ain''t new*.',
       sv.verse_id, ev.verse_id, 'extras', 65031
  FROM _session253_1ae42_lookup sv, _session253_1ae42_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=42 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=42 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-42-eden-lost-rest-at-end',
       E'Eden''s trials, and the rest restored when the world is ended',
       E'The Word names plainly why Adam now sweats and thirsts: *"O Adam, when you were in the garden, these trials did not come to you. But since you transgressed My commandment, all these sufferings have come over you"* (1 Adam & Eve 42:9-10) — the very curse of toil spoken in Eden: *In the sweat of thy face shalt thou eat bread, till thou return unto the ground* (Genesis 3:19). Yet the saving is set *when the end of the world is come* (1 Adam & Eve 42:6), when the last Adam undoes the first: *as in Adam all die, even so in Messiah (Christ) shall all be made alive* (1 Corinthians 15:22). Then the tree and garden barred to Adam are restored — *To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God)* (Revelation 2:7).',
       sv.verse_id, ev.verse_id, 'extras', 65034
  FROM _session253_1ae42_lookup sv, _session253_1ae42_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=42 AND sv.verse_number=9
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=42 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-42-word-promises-messiah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word who comes down and speaks to Adam in 1 Adam & Eve 42:1 is this same eternal Logos, not a created messenger.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae42_lookup sv, _session253_1ae42_lookup tv
 WHERE t.slug='1-adam-eve-42-word-promises-messiah'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=42 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word who promises in 1 Adam & Eve 42:4 to bring Adam up into the kingdom will Himself take flesh to do it.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae42_lookup sv, _session253_1ae42_lookup tv
 WHERE t.slug='1-adam-eve-42-word-promises-messiah'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=42 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 4:9 — *There remaineth therefore a rest to the people of Elohim (God).* The true rest the Word names in 1 Adam & Eve 42:2 is the Sabbath-rest of the kingdom, still kept in store for the faithful.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae42_lookup sv, _session253_1ae42_lookup tv
 WHERE t.slug='1-adam-eve-42-word-promises-messiah'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=42 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-42-water-of-life-golgotha-blood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 7:37 — *In the last day, that great day of the feast, Yahusha (Jesus) stood and cried, saying, If any man thirst, let him come unto me, and drink.* The Water of Life withheld from Adam in 1 Adam & Eve 42:7 is the very drink the Messiah later cries out to give.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae42_lookup sv, _session253_1ae42_lookup tv
 WHERE t.slug='1-adam-eve-42-water-of-life-golgotha-blood'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=42 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=7 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 7:38 — *He that believeth on me, as the scripture hath said, out of his belly shall flow rivers of living water.* The blood-as-living-water given to all Adam''s seed who believe in 1 Adam & Eve 42:8 is exactly the rivers promised to the believer.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae42_lookup sv, _session253_1ae42_lookup tv
 WHERE t.slug='1-adam-eve-42-water-of-life-golgotha-blood'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=42 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=7 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 6:54 — *Whoso eateth my flesh, and drinketh my blood, hath eternal life; and I will raise him up at the last day.* The blood the Word promises to shed in 1 Adam & Eve 42:7 is the drink that gives the eternal life and resurrection Adam was barred from.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae42_lookup sv, _session253_1ae42_lookup tv
 WHERE t.slug='1-adam-eve-42-water-of-life-golgotha-blood'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=42 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=54
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 22:17 — *And the Spirit and the bride say, Come. And let him that heareth say, Come. And let him that is athirst come. And whosoever will, let him take the water of life freely.* The Water of Life promised to all believing descendants in 1 Adam & Eve 42:8 is offered freely to the end of the world.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae42_lookup sv, _session253_1ae42_lookup tv
 WHERE t.slug='1-adam-eve-42-water-of-life-golgotha-blood'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=42 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-42-descent-breaks-gates-of-brass
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The breaking of brass gates and bruising of iron kingdoms in 1 Adam & Eve 42:5 is the head-bruising of the serpent sworn over Adam at the start.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae42_lookup sv, _session253_1ae42_lookup tv
 WHERE t.slug='1-adam-eve-42-descent-breaks-gates-of-brass'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=42 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 3:19 — *By which also he went and preached unto the spirits in prison.* The descent into hell the Word foretells in 1 Adam & Eve 42:5 is the Messiah''s preaching to the imprisoned spirits after the cross.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae42_lookup sv, _session253_1ae42_lookup tv
 WHERE t.slug='1-adam-eve-42-descent-breaks-gates-of-brass'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=42 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 2:14 — *Forasmuch then as the children are partakers of flesh and blood, he also himself likewise took part of the same; that through death he might destroy him that had the power of death, that is, the devil.* The shattering of hell''s gates in 1 Adam & Eve 42:5 is the destroying of the devil through the Word''s own death.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae42_lookup sv, _session253_1ae42_lookup tv
 WHERE t.slug='1-adam-eve-42-descent-breaks-gates-of-brass'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=42 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 1:18 — *I am he that liveth, and was dead; and, behold, I am alive for evermore, Amen; and have the keys of hell and of death.* The mercy that saves the souls of the righteous in 1 Adam & Eve 42:6 belongs to the One who took the very keys of hell and death.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae42_lookup sv, _session253_1ae42_lookup tv
 WHERE t.slug='1-adam-eve-42-descent-breaks-gates-of-brass'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=42 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-42-eden-lost-rest-at-end
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* The sufferings the Word traces to the transgression in 1 Adam & Eve 42:10 are the labour and death decreed at the expulsion.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae42_lookup sv, _session253_1ae42_lookup tv
 WHERE t.slug='1-adam-eve-42-eden-lost-rest-at-end'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=42 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 15:22 — *For as in Adam all die, even so in Messiah (Christ) shall all be made alive.* The rest promised when the end of the world is come in 1 Adam & Eve 42:6 is the making-alive of all Adam''s race in the last Adam.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae42_lookup sv, _session253_1ae42_lookup tv
 WHERE t.slug='1-adam-eve-42-eden-lost-rest-at-end'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=42 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 2:7 — *He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God).* The kingdom-rest the Word pledges to Adam and his righteous seed in 1 Adam & Eve 42:4 is the restored paradise and tree of life.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae42_lookup sv, _session253_1ae42_lookup tv
 WHERE t.slug='1-adam-eve-42-eden-lost-rest-at-end'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=42 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

