-- ----- fragment: minion_1adameve_08.sql (session253 1-adam-eve 8) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae8 (view _session253_1ae8_lookup). Sort band base 64175, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae8_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-8-lost-sight-of-angels
  ('adam-eve-conflict', '1-adam-eve', 8, 1, 'enoch', '1-enoch', 14, 11, 'extras', E'1 Enoch 14:11 — *And I saw the paths of the angels.* The sight of the angelic host that Adam lost outside the garden is exactly what Enoch, walking with Elohim, was caught up to behold.'),
  ('adam-eve-conflict', '1-adam-eve', 8, 1, 'enoch', '1-enoch', 14, 15, 'extras', E'1 Enoch 14:15 — *But the middle one reached to heaven, like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire.* Adam''s lost vision of the praising angels was a vision of this same throne-room that Enoch is shown.'),
  ('adam-eve-conflict', '1-adam-eve', 8, 1, 'canon', 'isaiah', 59, 2, 'free', E'Isaiah 59:2 — *But your iniquities have separated between you and your Elohim (God), and your sins have hid his face from you, that he will not hear.* Adam''s hidden creation is the prophet''s hidden face: transgression is what veils heaven from the eye of man.'),
  -- thread: 1-adam-eve-8-bright-nature-withdrawn
  ('adam-eve-conflict', '1-adam-eve', 8, 2, 'canon', 'genesis', 3, 7, 'free', E'Genesis 3:7 — *And the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons.* The same transgression that opened their eyes to shame is the one that withdrew the bright nature and closed their sight to heaven.'),
  ('adam-eve-conflict', '1-adam-eve', 8, 2, 'canon', 'romans', 8, 6, 'free', E'Romans 8:6 — *For to be carnally minded is death; but to be spiritually minded is life and peace.* Yahuah''s verdict that Adam now sees only "after the ability of the flesh; for it is brutish" is Paul''s carnal mind set against the spiritual.'),
  ('adam-eve-conflict', '1-adam-eve', 8, 2, 'canon', '2-corinthians', 4, 4, 'free', E'2 Corinthians 4:4 — *In whom the god of this world hath blinded the minds of them which believe not, lest the light of the glorious gospel of Messiah (Christ), who is the image of Elohim (God), should shine unto them.* The bright nature withdrawn from Adam is the blinded mind the deceiver keeps over all his fallen seed.'),
  ('adam-eve-conflict', '1-adam-eve', 8, 2, 'canon', '1-corinthians', 13, 12, 'free', E'1 Corinthians 13:12 — *For now we see through a glass, darkly; but then face to face: now I know in part; but then shall I know even as also I am known.* Adam who once "could see things far away" now sees "only near at hand" — the darkened glass of a fallen race awaiting restored sight.'),
  -- thread: 1-adam-eve-8-elohim-ceased-to-commune
  ('adam-eve-conflict', '1-adam-eve', 8, 4, 'canon', 'genesis', 3, 8, 'free', E'Genesis 3:8 — *And they heard the voice of Yahuah Elohim (the LORD God) walking in the garden in the cool of the day: and Adam and his wife hid themselves from the presence of Yahuah Elohim (the LORD God) amongst the trees of the garden.* The communing voice that once walked with them in the cool of the day is the very communion that now ceases.'),
  ('adam-eve-conflict', '1-adam-eve', 8, 4, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word whose communing with Adam ceases is the same Logos who will dwell among men to restore it.'),
  ('adam-eve-conflict', '1-adam-eve', 8, 3, 'canon', '1-john', 3, 2, 'free', E'1 John 3:2 — *Beloved, now are we the sons of Elohim (God), and it doth not yet appear what we shall be: but we know that, when he shall appear, we shall be like him; for we shall see him as he is.* Adam''s lost sight of his Maker is the very sight pledged to the redeemed seed at his appearing.'),
  ('adam-eve-conflict', '1-adam-eve', 8, 4, 'canon', 'revelation', 21, 3, 'free', E'Revelation 21:3 — *And I heard a great voice out of heaven saying, Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God).* The communion that ceased outside the cave is the communion restored forever in the city to come.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae8_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae8_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-8-lost-sight-of-angels',
       E'When we saw the angels that sang praises — the lost sight of heaven',
       E'Adam mourns the vision the garden once gave him: *"O Elohim (God), when we lived in the garden, and our hearts were lifted up, we saw the angels that sang praises in heaven, but now we can''t see like we used to; no, when we entered the cave, all creation became hidden from us."* (1-adam-eve 8:1) The sight he laments is the very sight Enoch was later caught up to behold — *"And I saw the paths of the angels."* (1 Enoch 14:11) and the throne of the Most High, *"the middle one reached to heaven, like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire."* (1 Enoch 14:15) What Adam forfeited by transgression, the seed kept holy may yet be lifted to see. And the loss is plainly named where the prophet tells it: *"But your iniquities have separated between you and your Elohim (God), and your sins have hid his face from you, that he will not hear."* (Isaiah 59:2) It ain''t new — sin is what hides the face of heaven from man.',
       sv.verse_id, ev.verse_id, 'extras', 64175
  FROM _session253_1ae8_lookup sv, _session253_1ae8_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=8 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-8-bright-nature-withdrawn',
       E'The bright nature withdrawn — fallen sight after the flesh',
       E'Yahuah answers Adam with the anatomy of the fall: *"When you were under subjection to Me, you had a bright nature within you, and for that reason could you see things far away. But after your transgression your bright nature was withdrawn from you; and it was not left to you to see things far away, but only near at hand; after the ability of the flesh; for it is brutish."* (1-adam-eve 8:2) This is Eden''s reckoning carried out — *"And the eyes of them both were opened, and they knew that they were naked"* (Genesis 3:7) — eyes opened to shame are eyes shut to glory. Paul names the same brutish, near-sighted mind: *"For to be carnally minded is death; but to be spiritually minded is life and peace."* (Romans 8:6), *"Because the carnal mind is enmity against Elohim (God): for it is not subject to the law of Elohim (God), neither indeed can be."* (Romans 8:7) And the god of this world keeps that veil over fallen sight: *"In whom the god of this world hath blinded the minds of them which believe not, lest the light of the glorious gospel of Messiah (Christ), who is the image of Elohim (God), should shine unto them."* (2 Corinthians 4:4) The withdrawn bright nature is the dimmed glass of a fallen race — *"For now we see through a glass, darkly; but then face to face."* (1 Corinthians 13:12)',
       sv.verse_id, ev.verse_id, 'extras', 64178
  FROM _session253_1ae8_lookup sv, _session253_1ae8_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=2
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=8 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-8-elohim-ceased-to-commune',
       E'And Elohim ceased to commune with them — separation, and the hope of restored sight',
       E'The chapter closes in grief and in distance: *"When Adam and Eve had heard these words from Elohim (God), they went their way; praising and worshipping Him with a sorrowful heart. And Elohim (God) ceased to commune with them."* (1-adam-eve 8:3-4) The walking voice of Eden is now withdrawn — *"And they heard the voice of Yahuah Elohim (the LORD God) walking in the garden in the cool of the day: and Adam and his wife hid themselves from the presence of Yahuah Elohim (the LORD God) amongst the trees of the garden."* (Genesis 3:8) Yet the same Word who walked and spoke is the Logos who will not leave the seed forever — *"In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)"* (John 1:1), and *"the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth."* (John 1:14). What Adam lost — the sight of his Maker — is the very promise restored to the redeemed: *"Beloved, now are we the sons of Elohim (God), and it doth not yet appear what we shall be: but we know that, when he shall appear, we shall be like him; for we shall see him as he is."* (1 John 3:2), when *"Elohim (God) himself shall be with them, and be their Elohim (God)."* (Revelation 21:3). The communion that ceased in chapter 8 is the communion the Saviour comes to restore — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 64181
  FROM _session253_1ae8_lookup sv, _session253_1ae8_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=3
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=8 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-8-lost-sight-of-angels
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 14:11 — *And I saw the paths of the angels.* The sight of the angelic host that Adam lost outside the garden is exactly what Enoch, walking with Elohim, was caught up to behold.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae8_lookup sv, _session253_1ae8_lookup tv
 WHERE t.slug='1-adam-eve-8-lost-sight-of-angels'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=14 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 14:15 — *But the middle one reached to heaven, like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire.* Adam''s lost vision of the praising angels was a vision of this same throne-room that Enoch is shown.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae8_lookup sv, _session253_1ae8_lookup tv
 WHERE t.slug='1-adam-eve-8-lost-sight-of-angels'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=14 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 59:2 — *But your iniquities have separated between you and your Elohim (God), and your sins have hid his face from you, that he will not hear.* Adam''s hidden creation is the prophet''s hidden face: transgression is what veils heaven from the eye of man.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae8_lookup sv, _session253_1ae8_lookup tv
 WHERE t.slug='1-adam-eve-8-lost-sight-of-angels'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=59 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-8-bright-nature-withdrawn
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:7 — *And the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons.* The same transgression that opened their eyes to shame is the one that withdrew the bright nature and closed their sight to heaven.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae8_lookup sv, _session253_1ae8_lookup tv
 WHERE t.slug='1-adam-eve-8-bright-nature-withdrawn'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 8:6 — *For to be carnally minded is death; but to be spiritually minded is life and peace.* Yahuah''s verdict that Adam now sees only "after the ability of the flesh; for it is brutish" is Paul''s carnal mind set against the spiritual.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae8_lookup sv, _session253_1ae8_lookup tv
 WHERE t.slug='1-adam-eve-8-bright-nature-withdrawn'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Corinthians 4:4 — *In whom the god of this world hath blinded the minds of them which believe not, lest the light of the glorious gospel of Messiah (Christ), who is the image of Elohim (God), should shine unto them.* The bright nature withdrawn from Adam is the blinded mind the deceiver keeps over all his fallen seed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae8_lookup sv, _session253_1ae8_lookup tv
 WHERE t.slug='1-adam-eve-8-bright-nature-withdrawn'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 13:12 — *For now we see through a glass, darkly; but then face to face: now I know in part; but then shall I know even as also I am known.* Adam who once "could see things far away" now sees "only near at hand" — the darkened glass of a fallen race awaiting restored sight.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae8_lookup sv, _session253_1ae8_lookup tv
 WHERE t.slug='1-adam-eve-8-bright-nature-withdrawn'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=13 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-8-elohim-ceased-to-commune
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:8 — *And they heard the voice of Yahuah Elohim (the LORD God) walking in the garden in the cool of the day: and Adam and his wife hid themselves from the presence of Yahuah Elohim (the LORD God) amongst the trees of the garden.* The communing voice that once walked with them in the cool of the day is the very communion that now ceases.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae8_lookup sv, _session253_1ae8_lookup tv
 WHERE t.slug='1-adam-eve-8-elohim-ceased-to-commune'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word whose communing with Adam ceases is the same Logos who will dwell among men to restore it.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae8_lookup sv, _session253_1ae8_lookup tv
 WHERE t.slug='1-adam-eve-8-elohim-ceased-to-commune'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:2 — *Beloved, now are we the sons of Elohim (God), and it doth not yet appear what we shall be: but we know that, when he shall appear, we shall be like him; for we shall see him as he is.* Adam''s lost sight of his Maker is the very sight pledged to the redeemed seed at his appearing.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae8_lookup sv, _session253_1ae8_lookup tv
 WHERE t.slug='1-adam-eve-8-elohim-ceased-to-commune'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 21:3 — *And I heard a great voice out of heaven saying, Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God).* The communion that ceased outside the cave is the communion restored forever in the city to come.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae8_lookup sv, _session253_1ae8_lookup tv
 WHERE t.slug='1-adam-eve-8-elohim-ceased-to-commune'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

