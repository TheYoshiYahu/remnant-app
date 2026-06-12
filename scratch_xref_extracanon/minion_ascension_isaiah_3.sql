-- ----- fragment: minion_ascensionisaiah_03.sql (session403 ascension-isaiah 3) -----
-- Source anchor: ascension-isaiah/ascension-isaiah ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: asci3 (view _session403_asci3_lookup). Sort band base 67550, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session403_asci3_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ascension-isaiah-3-false-prophet-accuses
  ('ascension-isaiah', 'ascension-isaiah', 3, 6, 'canon', 'matthew', 23, 37, 'free', E'Matthew 23:37 — *O Jerusalem, Jerusalem, thou that killest the prophets, and stonest them which are sent unto thee, how often would I have gathered thy children together, even as a hen gathereth her chickens under her wings, and ye would not!* The Beloved names the city by the very crime Belchira here sets in motion against Isaiah in Ascension of Isaiah 3:6.'),
  ('ascension-isaiah', 'ascension-isaiah', 3, 10, 'canon', 'matthew', 23, 35, 'free', E'Matthew 23:35 — *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar.* The slain Isaiah of Ascension of Isaiah 3:10, falsely charged with calling Jerusalem Sodom, belongs to this same righteous blood the city must answer for.'),
  ('ascension-isaiah', 'ascension-isaiah', 3, 10, 'canon', '2-kings', 21, 16, 'free', E'2 Kings 21:16 — *Moreover Manasseh shed innocent blood very much, till he had filled Jerusalem from one end to another; beside his sin wherewith he made Yahudah (Judah) to sin, in doing that which was evil in the sight of Yahuah (LORD).* The canon''s brief notice of Manasseh''s bloodshed is the very deed Ascension of Isaiah 3:10 enlarges, as Belchira brings his accusations before Manasseh.'),
  -- thread: ascension-isaiah-3-beliar-in-manasseh
  ('ascension-isaiah', 'ascension-isaiah', 3, 11, 'canon', '2-corinthians', 6, 15, 'free', E'2 Corinthians 6:15 — *And what concord hath Messiah (Christ) with Belial? or what part hath he that believeth with an infidel?* The Beliar who dwells in Manasseh''s heart in Ascension of Isaiah 3:11 is the same Belial Paul sets in flat opposition to the Messiah.'),
  ('ascension-isaiah', 'ascension-isaiah', 3, 11, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The murderer-and-liar the Beloved names is the very Beliar driving the false accusation and the king''s wrath in Ascension of Isaiah 3:11.'),
  ('ascension-isaiah', 'ascension-isaiah', 3, 13, 'canon', '2-thessalonians', 2, 9, 'free', E'2 Thessalonians 2:9 — *Even him, whose coming is after the working of Satan with all power and signs and lying wonders,* The lying prophecy and great wrath of Beliar in Ascension of Isaiah 3:13 is the same deceiving power Paul says works through Satan.'),
  -- thread: ascension-isaiah-3-beloved-descends
  ('ascension-isaiah', 'ascension-isaiah', 3, 13, 'canon', 'philippians', 2, 7, 'free', E'Philippians 2:7 — *But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men:* The very transformation into *the likeness of man* foreseen in Ascension of Isaiah 3:13 is Paul''s confession of the Beloved emptying Himself into the form of a servant.'),
  ('ascension-isaiah', 'ascension-isaiah', 3, 13, 'canon', 'philippians', 2, 8, 'free', E'Philippians 2:8 — *And being found in fashion as a man, he humbled himself, and became obedient unto death, even the death of the cross.* The descent that ends with the Beloved *crucified upon the tree* in Ascension of Isaiah 3:13 is here the obedience unto the death of the cross.'),
  ('ascension-isaiah', 'ascension-isaiah', 3, 13, 'canon', '1-timothy', 3, 16, 'free', E'1 Timothy 3:16 — *And without controversy great is the mystery of godliness: Elohim (God) was manifest in the flesh, justified in the Spirit, seen of angels, preached unto the Gentiles, believed on in the world, received up into glory.* The whole arc of Ascension of Isaiah 3:13 — God in the likeness of man, persecuted, then ascended — is Paul''s six-fold mystery of godliness.'),
  ('ascension-isaiah', 'ascension-isaiah', 3, 13, 'canon', 'isaiah', 53, 9, 'free', E'Isaiah 53:9 — *And he made his grave with the wicked, and with the rich in his death; because he had done no violence, neither was any deceit in his mouth.* The Beloved *crucified together with wicked men* and *buried in the sepulchre* in Ascension of Isaiah 3:13 is the same Servant who makes His grave with the wicked.'),
  -- thread: ascension-isaiah-3-third-day-rising
  ('ascension-isaiah', 'ascension-isaiah', 3, 16, 'canon', '1-corinthians', 15, 4, 'free', E'1 Corinthians 15:4 — *And that he was buried, and that he rose again the third day according to the scriptures:* The sepulchre opened *on the third day* in Ascension of Isaiah 3:16 is the very third-day rising Paul names the heart of the gospel.'),
  ('ascension-isaiah', 'ascension-isaiah', 3, 16, 'canon', 'psalms', 16, 10, 'free', E'Psalm 16:10 — *For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption.* The Holy One who will not be left to corruption is the Beloved who comes forth from the opened sepulchre in Ascension of Isaiah 3:16.'),
  ('ascension-isaiah', 'ascension-isaiah', 3, 17, 'canon', '1-peter', 3, 18, 'free', E'1 Peter 3:18 — *For Messiah (Christ) also hath once suffered for sins, the just for the unjust, that he might bring us to Elohim (God), being put to death in the flesh, but quickened by the Spirit:* The Beloved who comes forth and sends out His twelve in Ascension of Isaiah 3:17 is the one put to death in the flesh and quickened in the Spirit.'),
  ('ascension-isaiah', 'ascension-isaiah', 3, 17, 'canon', '1-peter', 3, 19, 'free', E'1 Peter 3:19 — *By which also he went and preached unto the spirits in prison;* The descent the prophet saw before the third-day coming-forth of Ascension of Isaiah 3:17 is Peter''s witness to the Beloved preaching to the spirits in prison.'),
  -- thread: ascension-isaiah-3-ascension-and-witness
  ('ascension-isaiah', 'ascension-isaiah', 3, 18, 'canon', 'ephesians', 4, 10, 'free', E'Ephesians 4:10 — *He that descended is the same also that ascended up far above all heavens, that he might fill all things.* The Beloved''s *ascension into the seventh heaven whence He came* in Ascension of Isaiah 3:18 is Paul''s One who descended and ascended far above all heavens.'),
  ('ascension-isaiah', 'ascension-isaiah', 3, 18, 'canon', 'john', 3, 13, 'free', E'John 3:13 — *And no man hath ascended up to heaven, but he that came down from heaven, even the Son of Adam which is in heaven.* The single descent-and-ascent of the Beloved in Ascension of Isaiah 3:18 is the Son of Adam''s unique coming down and going up.'),
  ('ascension-isaiah', 'ascension-isaiah', 3, 18, 'canon', 'philippians', 2, 9, 'free', E'Philippians 2:9 — *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name:* The Beloved who ascends to the seventh heaven in Ascension of Isaiah 3:18 is the humbled One whom God highly exalts.'),
  ('ascension-isaiah', 'ascension-isaiah', 3, 18, 'canon', 'philippians', 2, 11, 'free', E'Philippians 2:11 — *And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father.* The disciples teaching *every tongue* of the risen Beloved in Ascension of Isaiah 3:18 is the every-tongue confession Paul says crowns His exaltation.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session403_asci3_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session403_asci3_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-3-false-prophet-accuses',
       E'Belchira the false accuser and the prophet condemned',
       E'The false prophet rises against the true. *And Belchira accused Isaiah and the prophets who were with him, saying: `Isaiah and those who are with him prophesy against Jerusalem and against the cities of Yahudah (Judah) that they shall be laid waste...* (Ascension of Isaiah 3:6), and *Jerusalem also he hath called Sodom, and the princes of Yahudah (Judah) and Jerusalem he hath declared to be the people of Gomorrah* (3:10) — the accusation that will end in Isaiah being sawn asunder. It ain''t new: the Messiah Himself names the city by this same long roll of murdered prophets, *O Jerusalem, Jerusalem, thou that killest the prophets, and stonest them which are sent unto thee* (Matthew 23:37), and gathers *all the righteous blood shed upon the earth, from the blood of righteous Abel* (Matthew 23:35). The blood of Isaiah is part of that very reckoning under Manasseh, *Moreover Manasseh shed innocent blood very much, till he had filled Jerusalem from one end to another* (2 Kings 21:16).',
       sv.verse_id, ev.verse_id, 'extras', 67550
  FROM _session403_asci3_lookup sv, _session403_asci3_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=6
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=3 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-3-beliar-in-manasseh',
       E'Beliar dwelling in the heart of the king',
       E'The adversary works from within the throne. *But Beliar dwelt in the heart of Manasseh and in the heart of the princes of Yahudah (Judah) and Benjamin* (Ascension of Isaiah 3:11), and *For Beliar was in great wrath against Isaiah by reason of the vision, and because of the exposure wherewith he had exposed Sammael* (3:13). It ain''t new: Paul names this same dark prince by this same name, *And what concord hath Messiah (Christ) with Belial? or what part hath he that believeth with an infidel?* (2 Corinthians 6:15). The Beloved unmasks him as the murderer and liar from the first, *He was a murderer from the beginning, and abode not in the truth, because there is no truth in him* (John 8:44) — the very spirit who set the false prophet''s lying words in the king''s heart against Isaiah, and who works *after the working of Satan with all power and signs and lying wonders* (2 Thessalonians 2:9).',
       sv.verse_id, ev.verse_id, 'extras', 67553
  FROM _session403_asci3_lookup sv, _session403_asci3_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=11
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=3 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-3-beloved-descends',
       E'The Beloved''s descent and the likeness of man foreseen',
       E'Here is the pre-Christian wonder: the incarnation read out by a prophet before Hezekiah''s grandson. Isaiah''s vision had made known *the going forth of the Beloved from the seventh heaven... and His transformation and His descent and the likeness into which He should be transformed (that is) the likeness of man, and the persecution wherewith he should be persecuted... and that He should before the sabbath be crucified upon the tree, and should be crucified together with wicked men, and that He should be buried in the sepulchre* (Ascension of Isaiah 3:13). It ain''t new: this is the hymn of Philippi, *Who, being in the form of Elohim (God), thought it not robbery to be equal with Elohim (God): But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men* (Philippians 2:6-7), *he humbled himself, and became obedient unto death, even the death of the cross* (Philippians 2:8). The mystery that *Elohim (God) was manifest in the flesh, justified in the Spirit, seen of angels* (1 Timothy 3:16) was sung over the wood-saw centuries before Bethlehem. He who came down crucified with the wicked was buried in the sepulchre, *And he made his grave with the wicked, and with the rich in his death* (Isaiah 53:9).',
       sv.verse_id, ev.verse_id, 'extras', 67556
  FROM _session403_asci3_lookup sv, _session403_asci3_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=13
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=3 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-3-third-day-rising',
       E'The third day, the open sepulchre, and the risen Beloved',
       E'The vision runs on past the grave to the empty tomb. *And that (Gabriel) the angel of the Ruach HaKodesh (Holy Spirit), and Michael, the chief of the holy angels, on the third day will open the sepulchre: And the Beloved sitting on their shoulders will come forth and send out His twelve disciples* (Ascension of Isaiah 3:16-17). It ain''t new: this is the gospel Paul says he received and delivered first of all, *And that he was buried, and that he rose again the third day according to the scriptures* (1 Corinthians 15:4). The third day was sworn in the psalm long before, *For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption* (Psalm 16:10). And in the days between cross and tomb the Beloved did not lie idle, *being put to death in the flesh, but quickened by the Spirit: By which also he went and preached unto the spirits in prison* (1 Peter 3:18-19) — the descent and the rising the prophet saw whole.',
       sv.verse_id, ev.verse_id, 'extras', 67559
  FROM _session403_asci3_lookup sv, _session403_asci3_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=16
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=3 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-3-ascension-and-witness',
       E'The ascension into the seventh heaven and the gospel of the nations',
       E'The vision ends where it began — the Beloved returns to the heaven He left. The disciples *will teach all the nations and every tongue of the resurrection of the Beloved, and those who believe in His cross will be saved, and in His ascension into the seventh heaven whence He came* (Ascension of Isaiah 3:18). It ain''t new: this is the descent-and-ascent Paul preaches, *Now that he ascended, what is it but that he also descended first into the lower parts of the earth?* (Ephesians 4:9), *He that descended is the same also that ascended up far above all heavens, that he might fill all things* (Ephesians 4:10). The Son of Adam alone makes this round trip, *And no man hath ascended up to heaven, but he that came down from heaven, even the Son of Adam which is in heaven* (John 3:13). And the end of His humbling is His exaltation over all tongues — *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name* (Philippians 2:9), *And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father* (Philippians 2:11).',
       sv.verse_id, ev.verse_id, 'extras', 67562
  FROM _session403_asci3_lookup sv, _session403_asci3_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=18
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=3 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ascension-isaiah-3-false-prophet-accuses
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 23:37 — *O Jerusalem, Jerusalem, thou that killest the prophets, and stonest them which are sent unto thee, how often would I have gathered thy children together, even as a hen gathereth her chickens under her wings, and ye would not!* The Beloved names the city by the very crime Belchira here sets in motion against Isaiah in Ascension of Isaiah 3:6.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-false-prophet-accuses'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 23:35 — *That upon you may come all the righteous blood shed upon the earth, from the blood of righteous Abel unto the blood of Zacharias son of Barachias, whom ye slew between the temple and the altar.* The slain Isaiah of Ascension of Isaiah 3:10, falsely charged with calling Jerusalem Sodom, belongs to this same righteous blood the city must answer for.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-false-prophet-accuses'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=23 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Kings 21:16 — *Moreover Manasseh shed innocent blood very much, till he had filled Jerusalem from one end to another; beside his sin wherewith he made Yahudah (Judah) to sin, in doing that which was evil in the sight of Yahuah (LORD).* The canon''s brief notice of Manasseh''s bloodshed is the very deed Ascension of Isaiah 3:10 enlarges, as Belchira brings his accusations before Manasseh.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-false-prophet-accuses'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=21 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-3-beliar-in-manasseh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 6:15 — *And what concord hath Messiah (Christ) with Belial? or what part hath he that believeth with an infidel?* The Beliar who dwells in Manasseh''s heart in Ascension of Isaiah 3:11 is the same Belial Paul sets in flat opposition to the Messiah.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-beliar-in-manasseh'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The murderer-and-liar the Beloved names is the very Beliar driving the false accusation and the king''s wrath in Ascension of Isaiah 3:11.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-beliar-in-manasseh'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Thessalonians 2:9 — *Even him, whose coming is after the working of Satan with all power and signs and lying wonders,* The lying prophecy and great wrath of Beliar in Ascension of Isaiah 3:13 is the same deceiving power Paul says works through Satan.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-beliar-in-manasseh'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-3-beloved-descends
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Philippians 2:7 — *But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men:* The very transformation into *the likeness of man* foreseen in Ascension of Isaiah 3:13 is Paul''s confession of the Beloved emptying Himself into the form of a servant.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-beloved-descends'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Philippians 2:8 — *And being found in fashion as a man, he humbled himself, and became obedient unto death, even the death of the cross.* The descent that ends with the Beloved *crucified upon the tree* in Ascension of Isaiah 3:13 is here the obedience unto the death of the cross.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-beloved-descends'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Timothy 3:16 — *And without controversy great is the mystery of godliness: Elohim (God) was manifest in the flesh, justified in the Spirit, seen of angels, preached unto the Gentiles, believed on in the world, received up into glory.* The whole arc of Ascension of Isaiah 3:13 — God in the likeness of man, persecuted, then ascended — is Paul''s six-fold mystery of godliness.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-beloved-descends'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 53:9 — *And he made his grave with the wicked, and with the rich in his death; because he had done no violence, neither was any deceit in his mouth.* The Beloved *crucified together with wicked men* and *buried in the sepulchre* in Ascension of Isaiah 3:13 is the same Servant who makes His grave with the wicked.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-beloved-descends'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-3-third-day-rising
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 15:4 — *And that he was buried, and that he rose again the third day according to the scriptures:* The sepulchre opened *on the third day* in Ascension of Isaiah 3:16 is the very third-day rising Paul names the heart of the gospel.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-third-day-rising'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 16:10 — *For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption.* The Holy One who will not be left to corruption is the Beloved who comes forth from the opened sepulchre in Ascension of Isaiah 3:16.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-third-day-rising'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=16 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 3:18 — *For Messiah (Christ) also hath once suffered for sins, the just for the unjust, that he might bring us to Elohim (God), being put to death in the flesh, but quickened by the Spirit:* The Beloved who comes forth and sends out His twelve in Ascension of Isaiah 3:17 is the one put to death in the flesh and quickened in the Spirit.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-third-day-rising'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 3:19 — *By which also he went and preached unto the spirits in prison;* The descent the prophet saw before the third-day coming-forth of Ascension of Isaiah 3:17 is Peter''s witness to the Beloved preaching to the spirits in prison.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-third-day-rising'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-3-ascension-and-witness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 4:10 — *He that descended is the same also that ascended up far above all heavens, that he might fill all things.* The Beloved''s *ascension into the seventh heaven whence He came* in Ascension of Isaiah 3:18 is Paul''s One who descended and ascended far above all heavens.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-ascension-and-witness'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 3:13 — *And no man hath ascended up to heaven, but he that came down from heaven, even the Son of Adam which is in heaven.* The single descent-and-ascent of the Beloved in Ascension of Isaiah 3:18 is the Son of Adam''s unique coming down and going up.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-ascension-and-witness'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Philippians 2:9 — *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name:* The Beloved who ascends to the seventh heaven in Ascension of Isaiah 3:18 is the humbled One whom God highly exalts.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-ascension-and-witness'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Philippians 2:11 — *And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father.* The disciples teaching *every tongue* of the risen Beloved in Ascension of Isaiah 3:18 is the every-tongue confession Paul says crowns His exaltation.'
  FROM cross_reference_threads t, cross_references x, _session403_asci3_lookup sv, _session403_asci3_lookup tv
 WHERE t.slug='ascension-isaiah-3-ascension-and-witness'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

