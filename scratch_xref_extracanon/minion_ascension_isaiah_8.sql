-- ----- fragment: minion_ascensionisaiah_08.sql (session403 ascension-isaiah 8) -----
-- Source anchor: ascension-isaiah/ascension-isaiah ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: asci8 (view _session403_asci8_lookup). Sort band base 67675, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session403_asci8_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ascension-isaiah-8-sixth-heaven-ascent
  ('ascension-isaiah', 'ascension-isaiah', 8, 1, 'canon', '2-corinthians', 12, 2, 'free', E'2 Corinthians 12:2 — *I knew a man in Messiah (Christ) above fourteen years ago, (whether in the body, I cannot tell; or whether out of the body, I cannot tell: Elohim (God) knoweth;) such an one caught up to the third heaven.* Paul is caught up through the heavens just as Isaiah is raised into the air of the sixth heaven (8:1).'),
  ('ascension-isaiah', 'ascension-isaiah', 8, 1, 'canon', '2-corinthians', 12, 4, 'free', E'2 Corinthians 12:4 — *How that he was caught up into paradise, and heard unspeakable words, which it is not lawful for a man to utter.* The unspeakable glory Paul cannot utter is the same glory Isaiah says surpasses all the lower heavens (8:1).'),
  ('ascension-isaiah', 'ascension-isaiah', 8, 1, 'canon', 'revelation', 4, 1, 'free', E'Revelation 4:1 — *After this I looked, and, behold, a door was opened in heaven: and the first voice which I heard was as it were of a trumpet talking with me; which said, Come up hither, and I will shew thee things which must be hereafter.* John is called up into heaven to be shown things to come, as Isaiah is raised to see what no returning man has seen (8:1).'),
  -- thread: ascension-isaiah-8-fellow-servant
  ('ascension-isaiah', 'ascension-isaiah', 8, 5, 'canon', 'revelation', 19, 10, 'free', E'Revelation 19:10 — *And I fell at his feet to worship him. And he said unto me, See thou do it not: I am thy fellowservant, and of thy brethren that have the testimony of Yahusha (Jesus): worship Elohim (God): for the testimony of Yahusha (Jesus) is the spirit of prophecy.* The angel forbids worship and calls himself a fellowservant, exactly as Isaiah''s guide says ''I am not thy lord, but thy fellow servant'' (8:5).'),
  ('ascension-isaiah', 'ascension-isaiah', 8, 5, 'canon', 'luke', 1, 19, 'free', E'Luke 1:19 — *And the angel answering said unto him, I am Gabriel, that stand in the presence of Elohim (God); and am sent to speak unto thee, and to shew thee these glad tidings.* Gabriel is a sent servant standing before Elohim, as Isaiah''s guide is empowered and sent to raise him (8:5, 8:8).'),
  -- thread: ascension-isaiah-8-hidden-name-throne
  ('ascension-isaiah', 'ascension-isaiah', 8, 7, 'canon', 'isaiah', 6, 1, 'free', E'Isaiah 6:1 — *In the year that king Uzziah died I saw also Yahuah (Lord) sitting upon a throne, high and lifted up, and his train filled the temple.* The prophet''s earlier throne-vision shows the Enthroned One whose seat in the seventh heaven Isaiah now ascends toward (8:7).'),
  ('ascension-isaiah', 'ascension-isaiah', 8, 7, 'canon', 'isaiah', 6, 3, 'free', E'Isaiah 6:3 — *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory.* The seraphim hallow the unnamed Holy One whose name none of the heavens can learn (8:7).'),
  ('ascension-isaiah', 'ascension-isaiah', 8, 8, 'canon', 'revelation', 5, 12, 'free', E'Revelation 5:12 — *Saying with a loud voice, Worthy is the Lamb that was slain to receive power, and riches, and wisdom, and strength, and honour, and glory, and blessing.* The whole heavenly host answer with one voice, as in Isaiah''s vision He alone is the One to whose voice all the heavens and thrones give answer (8:8).'),
  -- thread: ascension-isaiah-8-beloved-descends-in-your-form
  ('ascension-isaiah', 'ascension-isaiah', 8, 10, 'canon', 'philippians', 2, 7, 'free', E'Philippians 2:7 — *But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men.* The Beloved undergoes transformation until He resembles your form and likeness (8:10), exactly the self-emptying into man''s likeness Paul names.'),
  ('ascension-isaiah', 'ascension-isaiah', 8, 26, 'canon', 'philippians', 2, 6, 'free', E'Philippians 2:6 — *Who, being in the form of Elohim (God), thought it not robbery to be equal with Elohim (God).* The One in the form of Elohim is the Yahuah who will descend in your form (8:26).'),
  ('ascension-isaiah', 'ascension-isaiah', 8, 10, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Beloved''s transformation into your form and likeness (8:10) is the Word made flesh.'),
  ('ascension-isaiah', 'ascension-isaiah', 8, 26, 'canon', 'john', 3, 13, 'free', E'John 3:13 — *And no man hath ascended up to heaven, but he that came down from heaven, even the Son of Adam which is in heaven.* The One who came down from heaven is the Yahuah Isaiah is told will descend in your form (8:26).'),
  ('ascension-isaiah', 'ascension-isaiah', 8, 26, 'canon', '1-timothy', 3, 16, 'free', E'1 Timothy 3:16 — *And without controversy great is the mystery of godliness: Elohim (God) was manifest in the flesh, justified in the Spirit, seen of angels, preached unto the Gentiles, believed on in the world, received up into glory.* The mystery of Elohim manifest in the flesh is the descent in your form Isaiah is shown beforehand (8:26).'),
  -- thread: ascension-isaiah-8-father-beloved-spirit
  ('ascension-isaiah', 'ascension-isaiah', 8, 18, 'canon', 'philippians', 2, 10, 'free', E'Philippians 2:10 — *That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth.* The Beloved named and worshipped with one voice in the sixth heaven (8:18) is the One before whose name every knee bows.'),
  ('ascension-isaiah', 'ascension-isaiah', 8, 18, 'canon', 'philippians', 2, 11, 'free', E'Philippians 2:11 — *And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father.* Every tongue confessing the Messiah to the glory of the Father matches the angels naming the Father and His Beloved with one voice (8:18).'),
  ('ascension-isaiah', 'ascension-isaiah', 8, 18, 'canon', 'hebrews', 1, 3, 'free', E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high.* The Beloved hymned beside the primal Father (8:18) is the brightness of His glory who sits at His right hand.'),
  -- thread: ascension-isaiah-8-garments-laid-up-righteous
  ('ascension-isaiah', 'ascension-isaiah', 8, 26, 'canon', 'revelation', 19, 8, 'free', E'Revelation 19:8 — *And to her was granted that she should be arrayed in fine linen, clean and white: for the fine linen is the righteousness of saints.* The garments laid up for the righteous (8:26) are the white raiment of the saints'' righteousness.'),
  ('ascension-isaiah', 'ascension-isaiah', 8, 14, 'canon', '2-timothy', 4, 8, 'free', E'2 Timothy 4:8 — *Henceforth there is laid up for me a crown of righteousness, which Yahuah (Lord), the righteous judge, shall give me at that day: and not to me only, but unto all them also that love his appearing.* The numbered garments and crowns laid up for the faithful (8:14, 8:26) are Paul''s same laid-up crown of righteousness.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session403_asci8_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session403_asci8_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-8-sixth-heaven-ascent',
       E'Raised into the sixth heaven',
       E'Isaiah is carried higher still: *AND again he raised me into the air of the sixth heaven, and I saw such glory as I had not seen in the five heavens* (Ascension of Isaiah 8:1), so that *when I was in the sixth heaven I thought the light which I had seen in the five heavens to be but darkness* (Ascension of Isaiah 8:21). It ain''t new — Paul testifies to the same caught-up ascent through the heavens: *I knew a man in Messiah (Christ) above fourteen years ago, (whether in the body, I cannot tell; or whether out of the body, I cannot tell: Elohim (God) knoweth;) such an one caught up to the third heaven* (2 Corinthians 12:2), *How that he was caught up into paradise, and heard unspeakable words, which it is not lawful for a man to utter* (2 Corinthians 12:4). John too is summoned upward to the throne: *After this I looked, and, behold, a door was opened in heaven: and the first voice which I heard was as it were of a trumpet talking with me; which said, Come up hither, and I will shew thee things which must be hereafter* (Revelation 4:1).',
       sv.verse_id, ev.verse_id, 'extras', 67675
  FROM _session403_asci8_lookup sv, _session403_asci8_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=8 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-8-fellow-servant',
       E'I am not thy lord, but thy fellow servant',
       E'When Isaiah addresses his guide as ''my Lord,'' the angel refuses the honour: *And he said: ''I am not thy lord, but thy fellow servant''* (Ascension of Isaiah 8:5). It ain''t new — the angels of the Revelation refuse worship in the very same words: *And I fell at his feet to worship him. And he said unto me, See thou do it not: I am thy fellowservant, and of thy brethren that have the testimony of Yahusha (Jesus): worship Elohim (God)* (Revelation 19:10). So Gabriel names himself a servant who stands and is sent: *And the angel answering said unto him, I am Gabriel, that stand in the presence of Elohim (God); and am sent to speak unto thee, and to shew thee these glad tidings* (Luke 1:19).',
       sv.verse_id, ev.verse_id, 'extras', 67678
  FROM _session403_asci8_lookup sv, _session403_asci8_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=5
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=8 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-8-hidden-name-throne',
       E'He that is not named and the Elect One',
       E'Above the sixth heaven dwells the One whose name is unsearchable: *they are directed by the power of the seventh heaven, where dwelleth He that is not named and the Elect One, whose name has not been made known, and none of the heavens can learn His name* (Ascension of Isaiah 8:7), *For it is He alone to whose voice all the heavens and thrones give answer* (Ascension of Isaiah 8:8). It ain''t new — Isaiah''s own throne-vision shows the Holy One enthroned and worshipped: *In the year that king Uzziah died I saw also Yahuah (Lord) sitting upon a throne, high and lifted up, and his train filled the temple* (Isaiah 6:1), *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory* (Isaiah 6:3). And the heavenly host answer His voice as the elders and angels cry: *Saying with a loud voice, Worthy is the Lamb that was slain to receive power, and riches, and wisdom, and strength, and honour, and glory, and blessing* (Revelation 5:12).',
       sv.verse_id, ev.verse_id, 'extras', 67681
  FROM _session403_asci8_lookup sv, _session403_asci8_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=7
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=8 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-8-beloved-descends-in-your-form',
       E'Yahuah who will descend in your form',
       E'Here is the stunning pre-Christian witness to the incarnation. Isaiah is told he shall see *Yahuah (Lord) of all those heavens and these thrones* (Ascension of Isaiah 8:9), the Beloved *Undergoing successive transformation until He resembles your form and likeness* (Ascension of Isaiah 8:10), *who will descend in your form* (Ascension of Isaiah 8:26). It ain''t new — this is the mind of Messiah Paul preached: *Who, being in the form of Elohim (God), thought it not robbery to be equal with Elohim (God)* (Philippians 2:6), *But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men* (Philippians 2:7). The Word descends and is made flesh: *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth* (John 1:14), *And no man hath ascended up to heaven, but he that came down from heaven, even the Son of Adam which is in heaven* (John 3:13). This is the great mystery foretold: *And without controversy great is the mystery of godliness: Elohim (God) was manifest in the flesh, justified in the Spirit, seen of angels, preached unto the Gentiles, believed on in the world, received up into glory* (1 Timothy 3:16).',
       sv.verse_id, ev.verse_id, 'extras', 67684
  FROM _session403_asci8_lookup sv, _session403_asci8_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=9
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=8 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-8-father-beloved-spirit',
       E'The primal Father, His Beloved, and the Ruach HaKodesh',
       E'In the sixth heaven the worship rises to the threefold Name with one voice: *And there they all named the primal Father and His Beloved, the Messiah (Christ), and the Ruach HaKodesh (Holy Spirit), all with one voice* (Ascension of Isaiah 8:18). It ain''t new — the Beloved is exalted that every tongue confess Him: *That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth* (Philippians 2:10), *And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father* (Philippians 2:11). And the Beloved is the brightness of the Father''s glory set above the angels: *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high* (Hebrews 1:3), *Being made so much better than the angels, as he hath by inheritance obtained a more excellent name than they* (Hebrews 1:4).',
       sv.verse_id, ev.verse_id, 'extras', 67687
  FROM _session403_asci8_lookup sv, _session403_asci8_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=18
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=8 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-8-garments-laid-up-righteous',
       E'The garments and crowns laid up for the righteous',
       E'Isaiah is promised the reward kept above for the faithful: *then thou wilt receive the garment which thou seest, and likewise other numbered garments laid up there thou wilt see* (Ascension of Isaiah 8:14), *the garments, and the thrones, and the crowns which are laid up for the righteous, for those who trust in that Yahuah (Lord) who will descend in your form* (Ascension of Isaiah 8:26). It ain''t new — the overcomers are clothed in white and crowned: *And to her was granted that she should be arrayed in fine linen, clean and white: for the fine linen is the righteousness of saints* (Revelation 19:8), and the laid-up reward is the believer''s hope: *Henceforth there is laid up for me a crown of righteousness, which Yahuah (Lord), the righteous judge, shall give me at that day: and not to me only, but unto all them also that love his appearing* (2 Timothy 4:8).',
       sv.verse_id, ev.verse_id, 'extras', 67690
  FROM _session403_asci8_lookup sv, _session403_asci8_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=14
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=8 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ascension-isaiah-8-sixth-heaven-ascent
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 12:2 — *I knew a man in Messiah (Christ) above fourteen years ago, (whether in the body, I cannot tell; or whether out of the body, I cannot tell: Elohim (God) knoweth;) such an one caught up to the third heaven.* Paul is caught up through the heavens just as Isaiah is raised into the air of the sixth heaven (8:1).'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-sixth-heaven-ascent'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 12:4 — *How that he was caught up into paradise, and heard unspeakable words, which it is not lawful for a man to utter.* The unspeakable glory Paul cannot utter is the same glory Isaiah says surpasses all the lower heavens (8:1).'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-sixth-heaven-ascent'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=12 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 4:1 — *After this I looked, and, behold, a door was opened in heaven: and the first voice which I heard was as it were of a trumpet talking with me; which said, Come up hither, and I will shew thee things which must be hereafter.* John is called up into heaven to be shown things to come, as Isaiah is raised to see what no returning man has seen (8:1).'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-sixth-heaven-ascent'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-8-fellow-servant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 19:10 — *And I fell at his feet to worship him. And he said unto me, See thou do it not: I am thy fellowservant, and of thy brethren that have the testimony of Yahusha (Jesus): worship Elohim (God): for the testimony of Yahusha (Jesus) is the spirit of prophecy.* The angel forbids worship and calls himself a fellowservant, exactly as Isaiah''s guide says ''I am not thy lord, but thy fellow servant'' (8:5).'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-fellow-servant'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 1:19 — *And the angel answering said unto him, I am Gabriel, that stand in the presence of Elohim (God); and am sent to speak unto thee, and to shew thee these glad tidings.* Gabriel is a sent servant standing before Elohim, as Isaiah''s guide is empowered and sent to raise him (8:5, 8:8).'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-fellow-servant'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-8-hidden-name-throne
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 6:1 — *In the year that king Uzziah died I saw also Yahuah (Lord) sitting upon a throne, high and lifted up, and his train filled the temple.* The prophet''s earlier throne-vision shows the Enthroned One whose seat in the seventh heaven Isaiah now ascends toward (8:7).'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-hidden-name-throne'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 6:3 — *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory.* The seraphim hallow the unnamed Holy One whose name none of the heavens can learn (8:7).'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-hidden-name-throne'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 5:12 — *Saying with a loud voice, Worthy is the Lamb that was slain to receive power, and riches, and wisdom, and strength, and honour, and glory, and blessing.* The whole heavenly host answer with one voice, as in Isaiah''s vision He alone is the One to whose voice all the heavens and thrones give answer (8:8).'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-hidden-name-throne'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-8-beloved-descends-in-your-form
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Philippians 2:7 — *But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men.* The Beloved undergoes transformation until He resembles your form and likeness (8:10), exactly the self-emptying into man''s likeness Paul names.'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-beloved-descends-in-your-form'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Philippians 2:6 — *Who, being in the form of Elohim (God), thought it not robbery to be equal with Elohim (God).* The One in the form of Elohim is the Yahuah who will descend in your form (8:26).'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-beloved-descends-in-your-form'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Beloved''s transformation into your form and likeness (8:10) is the Word made flesh.'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-beloved-descends-in-your-form'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 3:13 — *And no man hath ascended up to heaven, but he that came down from heaven, even the Son of Adam which is in heaven.* The One who came down from heaven is the Yahuah Isaiah is told will descend in your form (8:26).'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-beloved-descends-in-your-form'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Timothy 3:16 — *And without controversy great is the mystery of godliness: Elohim (God) was manifest in the flesh, justified in the Spirit, seen of angels, preached unto the Gentiles, believed on in the world, received up into glory.* The mystery of Elohim manifest in the flesh is the descent in your form Isaiah is shown beforehand (8:26).'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-beloved-descends-in-your-form'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-8-father-beloved-spirit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Philippians 2:10 — *That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth.* The Beloved named and worshipped with one voice in the sixth heaven (8:18) is the One before whose name every knee bows.'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-father-beloved-spirit'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Philippians 2:11 — *And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father.* Every tongue confessing the Messiah to the glory of the Father matches the angels naming the Father and His Beloved with one voice (8:18).'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-father-beloved-spirit'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high.* The Beloved hymned beside the primal Father (8:18) is the brightness of His glory who sits at His right hand.'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-father-beloved-spirit'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-8-garments-laid-up-righteous
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 19:8 — *And to her was granted that she should be arrayed in fine linen, clean and white: for the fine linen is the righteousness of saints.* The garments laid up for the righteous (8:26) are the white raiment of the saints'' righteousness.'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-garments-laid-up-righteous'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Timothy 4:8 — *Henceforth there is laid up for me a crown of righteousness, which Yahuah (Lord), the righteous judge, shall give me at that day: and not to me only, but unto all them also that love his appearing.* The numbered garments and crowns laid up for the faithful (8:14, 8:26) are Paul''s same laid-up crown of righteousness.'
  FROM cross_reference_threads t, cross_references x, _session403_asci8_lookup sv, _session403_asci8_lookup tv
 WHERE t.slug='ascension-isaiah-8-garments-laid-up-righteous'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=8 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

