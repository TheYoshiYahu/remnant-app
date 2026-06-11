-- =====================================================================
-- S227 enrichment — REVELATION 3 (roots: prophetic adds; letters are light on apocalyptic)
-- ADD-ONLY. References shared view _s227_rev_lookup (defined by assembled migration).
-- Member sort_order starts at 21 to avoid colliding with existing 1..n members.
-- =====================================================================

-- ---------------------------------------------------------------------
-- thread: revelation-3-philadelphia-the-key-of-david-he-that-openeth-and-no-man-shutteth-isaiah-22
-- existing: Isaiah 22:22 (the primary key-of-David root). ADD Isaiah 45:1 (the gates none can shut).
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  ('canon','revelation',3,8,'canon','isaiah',45,1,'free', E'*Thus saith Yahuah (LORD) to his anointed... I will loose the loins of kings, to open before him the two leaved gates; and the gates shall not be shut* (Isaiah 45:1). The open door set before Philadelphia — *behold, I have set before thee an open door, and no man can shut it* (Revelation 3:8) — speaks the same opening Isaiah proclaims: Yahuah (LORD) opens *the two leaved gates* before his anointed, and *the gates shall not be shut.* The One who holds the key of the house of David opens the way home, and the gates he throws open no power of man can close against the faithful.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 45:1 — *to open before him the two leaved gates; and the gates shall not be shut* the gates Yahuah (LORD) opens that none can close; *an open door, and no man can shut it* (Revelation 3:8).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-3-philadelphia-the-key-of-david-he-that-openeth-and-no-man-shutteth-isaiah-22'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- thread: revelation-3-the-synagogue-of-satan-which-say-they-are-jews-and-are-not-the-false-claim-isaiah-65
-- existing: Isaiah 65:15, 65:16, Romans 9:25. ADD Isaiah 60:14 + 49:23 (the bowing-before-thy-feet root of 3:9).
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  ('canon','revelation',3,9,'canon','isaiah',60,14,'free', E'*The sons also of them that afflicted thee shall come bending unto thee; and all they that despised thee shall bow themselves down at the soles of thy feet; and they shall call thee, The city of Yahuah (LORD), The Zion of the Holy One of Yashar''el (Israel).* (Isaiah 60:14). The promise to Philadelphia — *I will make them to come and worship before thy feet, and to know that I have loved thee* (Revelation 3:9) — is Isaiah''s restoration-word turned to the faithful: those who afflicted Zion *shall bow themselves down at the soles of thy feet* and own her as the city of Yahuah (LORD). The vindication of the kept assembly is the vindication the prophet promised the forsaken city — the despisers bowing, the Holy One''s love acknowledged.'),
  ('canon','revelation',3,9,'canon','isaiah',49,23,'free', E'*And kings shall be thy nursing fathers, and their queens thy nursing mothers: they shall bow down to thee with their face toward the earth, and lick up the dust of thy feet; and thou shalt know that I am Yahuah (LORD): for they shall not be ashamed that wait for me.* (Isaiah 49:23). Isaiah promises the waiting remnant that her oppressors *shall bow down to thee with their face toward the earth,* and she *shall not be ashamed that wait for me.* The same is sealed to Philadelphia, which *hast kept my word, and hast not denied my name* (Revelation 3:8): *I will make them to come and worship before thy feet* (Revelation 3:9). The bowing of the false claimants before the faithful is the prophet''s own promise to those who wait on Yahuah (LORD) — the patient keepers vindicated, never ashamed.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 60:14 — *they that despised thee shall bow themselves down at the soles of thy feet* the despisers bowing before restored Zion; *I will make them to come and worship before thy feet* (Revelation 3:9).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-3-the-synagogue-of-satan-which-say-they-are-jews-and-are-not-the-false-claim-isaiah-65'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Isaiah 49:23 — *they shall bow down to thee... and thou shalt know that I am Yahuah (LORD): for they shall not be ashamed that wait for me* the waiting remnant vindicated; *I will make them to come and worship before thy feet* (Revelation 3:9).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-3-the-synagogue-of-satan-which-say-they-are-jews-and-are-not-the-false-claim-isaiah-65'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- thread: revelation-3-the-amen-the-faithful-witness-the-beginning-of-the-creation-isaiah-44-proverbs-8
-- existing: Isaiah 65:16, Isaiah 44:6, Proverbs 8:22, Colossians 1:15, 1:18.
-- ADD Proverbs 8:30 (Wisdom brought up with him, the beginning) + Isaiah 43:10 (no Elohim formed — faithful witness).
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  ('canon','revelation',3,14,'canon','proverbs',8,30,'free', E'*Then I was by him, as one brought up with him: and I was daily his delight, rejoicing always before him;* (Proverbs 8:30). Wisdom, who *possessed* the beginning of Yahuah''s (LORD''s) way, was *by him, as one brought up with him,* his daily delight as the world was framed. The Messiah names himself to Laodicea *the beginning of the creation of Elohim (God)* (Revelation 3:14) in that very register — the Formed who was with the Father before the works of old, brought up beside him, by whom the creation begins. He is not the first thing made but the One who was the Father''s delight before there was anything made.'),
  ('canon','revelation',3,14,'canon','isaiah',43,10,'free', E'*Ye are my witnesses, saith Yahuah (LORD), and my servant whom I have chosen: that ye may know and believe me, and understand that I am he: before me there was no Elohim (God) formed, neither shall there be after me.* (Isaiah 43:10). The title *the faithful and true witness* (Revelation 3:14) stands in Isaiah''s witness-court, where Yahuah (LORD) names his servant *whom I have chosen* to testify *that I am he.* The Amen who speaks to Laodicea is that faithful witness — the chosen Servant testifying the truth that does not fail, before whom *there was no Elohim (God) formed,* the one true witness against the lukewarm assembly''s false self-reckoning.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Proverbs 8:30 — *I was by him, as one brought up with him: and I was daily his delight* Wisdom beside the Father before the works of old; *the beginning of the creation of Elohim (God)* (Revelation 3:14).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-3-the-amen-the-faithful-witness-the-beginning-of-the-creation-isaiah-44-proverbs-8'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Isaiah 43:10 — *Ye are my witnesses... and my servant whom I have chosen... that I am he* the witness-court of the chosen Servant; *the faithful and true witness* who speaks to Laodicea (Revelation 3:14).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-3-the-amen-the-faithful-witness-the-beginning-of-the-creation-isaiah-44-proverbs-8'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- thread: revelation-3-buy-of-me-gold-tried-in-the-fire-and-i-stand-at-the-door-and-knock-isaiah-55
-- existing: Isaiah 55:1, Proverbs 8:34. ADD Zechariah 3:4 (filthy garments off, white raiment on)
--           + Isaiah 61:10 (garments of salvation / robe of righteousness) for the white-raiment counsel.
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  ('canon','revelation',3,18,'canon','zechariah',3,4,'free', E'*And he answered and spake unto those that stood before him, saying, Take away the filthy garments from him. And unto him he said, Behold, I have caused thine iniquity to pass from thee, and I will clothe thee with change of raiment.* (Zechariah 3:4). The white raiment counselled to naked Laodicea — *white raiment, that thou mayest be clothed, and that the shame of thy nakedness do not appear* (Revelation 3:18) — is Zechariah''s clothing of the high priest: the *filthy garments* taken away, the iniquity caused to pass, and the *change of raiment* put on. The buying of white raiment is the cleansing exchange the prophet saw — shame and defilement stripped off, the clean garment given by the One who removes iniquity.'),
  ('canon','revelation',3,18,'canon','isaiah',61,10,'free', E'*I will greatly rejoice in Yahuah (LORD), my soul shall be joyful in my Elohim (God); for he hath clothed me with the garments of salvation, he hath covered me with the robe of righteousness, as a bridegroom decketh himself with ornaments, and as a bride adorneth herself with her jewels.* (Isaiah 61:10). The white raiment Laodicea is counselled to buy is Isaiah''s *garments of salvation* and *robe of righteousness* — the clothing Yahuah (LORD) himself puts on his people. So *buy of me... white raiment, that thou mayest be clothed* (Revelation 3:18) is the offer of the very garments the prophet rejoiced in, the bridal robe of righteousness given to cover the shame the lukewarm assembly does not know she wears.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Zechariah 3:4 — *Take away the filthy garments from him... I will clothe thee with change of raiment* the cleansing exchange of garments; *white raiment, that thou mayest be clothed* (Revelation 3:18).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-3-buy-of-me-gold-tried-in-the-fire-and-i-stand-at-the-door-and-knock-isaiah-55'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Isaiah 61:10 — *he hath clothed me with the garments of salvation, he hath covered me with the robe of righteousness* the clothing Yahuah (LORD) puts on his people; the white raiment bought of him (Revelation 3:18).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-3-buy-of-me-gold-tried-in-the-fire-and-i-stand-at-the-door-and-knock-isaiah-55'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- thread: revelation-3-sit-with-me-in-my-throne-even-as-i-overcame-daniel-7
-- existing: Daniel 7:9, 7:14. ADD Daniel 7:18 + 7:27 (the saints take and possess the kingdom).
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  ('canon','revelation',3,21,'canon','daniel',7,18,'free', E'*But the saints of the El Elyon (most High) shall take the kingdom, and possess the kingdom for ever, even for ever and ever.* (Daniel 7:18). Daniel does not stop at the kingdom given to the Son of Adam — he sees it shared with his people: *the saints of the El Elyon (most High) shall take the kingdom, and possess the kingdom for ever.* That is exactly the grant the Messiah makes at Laodicea: *To him that overcometh will I grant to sit with me in my throne* (Revelation 3:21). The dominion received from the Ancient of days is given to the Son and through him to the saints, who possess the everlasting kingdom with the One who overcame.'),
  ('canon','revelation',3,21,'canon','daniel',7,27,'free', E'*And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him.* (Daniel 7:27). The vision closes by handing *the kingdom and dominion... under the whole heaven* to *the people of the saints of the El Elyon (most High)* — an everlasting kingdom the nations serve. The throne-promise to the overcomer is that same handing: *will I grant to sit with me in my throne, even as I also overcame, and am set down with my Father in his throne* (Revelation 3:21). The everlasting dominion given to the saints in Daniel is the throne the faithful are called to share with the Son who reigns with his Father.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Daniel 7:18 — *the saints of the El Elyon (most High) shall take the kingdom, and possess the kingdom for ever* the dominion shared with the Son''s people; *grant to sit with me in my throne* (Revelation 3:21).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-3-sit-with-me-in-my-throne-even-as-i-overcame-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Daniel 7:27 — *the kingdom and dominion... shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom* the everlasting dominion handed to the saints; the throne the faithful share (Revelation 3:21).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-3-sit-with-me-in-my-throne-even-as-i-overcame-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=3 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
