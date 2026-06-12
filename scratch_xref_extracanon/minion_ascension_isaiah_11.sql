-- ----- fragment: minion_ascensionisaiah_11.sql (session403 ascension-isaiah 11) -----
-- Source anchor: ascension-isaiah/ascension-isaiah ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: asci11 (view _session403_asci11_lookup). Sort band base 67750, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session403_asci11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ascension-isaiah-11-virgin-bethlehem
  ('ascension-isaiah', 'ascension-isaiah', 11, 2, 'canon', 'isaiah', 7, 14, 'free', E'Isaiah 7:14 — *Therefore Yahuah (Lord) himself shall give you a sign; Behold, a virgin shall conceive, and bear a son, and shall call his name Immanuel.* The virgin Mary Isaiah beholds is the sign Isaiah himself had already spoken.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 2, 'canon', 'micah', 5, 2, 'free', E'Micah 5:2 — *But thou, Beth-lehem Ephratah, though thou be little among the thousands of Yahudah (Judah), yet out of thee shall he come forth unto me that is to be ruler in Yashar''el (Israel); whose goings forth have been from of old, from everlasting.* The Bethlehem of Judah named in the vision is the Bethlehem of the prophecy.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 2, 'canon', 'matthew', 1, 18, 'free', E'Matthew 1:18 — *Now the birth of Yahusha HaMashiach (Jesus Christ) was on this wise: When as his mother Mary was espoused to Joseph, before they came together, she was found with child of the Ruach HaKodesh (Holy Spirit).* The same Mary, espoused to Joseph and found with child, that Isaiah saw centuries before.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 3, 'canon', 'matthew', 1, 23, 'free', E'Matthew 1:23 — *Behold, a virgin shall be with child, and shall bring forth a son, and they shall call his name Emmanuel, which being interpreted is, Elohim (God) with us.* Joseph''s hesitation to put her away ends where Isaiah''s own Immanuel sign begins.'),
  -- thread: ascension-isaiah-11-elohim-into-his-portion
  ('ascension-isaiah', 'ascension-isaiah', 11, 10, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The infant in Joseph''s portion is the only begotten of the Father made flesh.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 10, 'canon', '1-timothy', 3, 16, 'free', E'1 Timothy 3:16 — *And without controversy great is the mystery of godliness: Elohim (God) was manifest in the flesh, justified in the Spirit, seen of angels, preached unto the Gentiles, believed on in the world, received up into glory.* Joseph praising because Elohim had come into his portion is the mystery of godliness manifest in the flesh.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 8, 'canon', 'luke', 2, 7, 'free', E'Luke 2:7 — *And she brought forth her firstborn son, and wrapped him in swaddling clothes, and laid him in a manger; because there was no room for them in the inn.* The small babe Mary suddenly beheld is the firstborn son of Luke''s nativity.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 9, 'canon', 'isaiah', 9, 6, 'free', E'Isaiah 9:6 — *For unto us a child is born, unto us a son is given: and the government shall be upon his shoulder: and his name shall be called Wonderful, Counsellor, El Gibbor (The mighty God), Avi-ad (The everlasting Father), Sar Shalom (The Prince of Peace).* The child appearing where the womb was found whole is the child born, the son given, of Isaiah''s own word.'),
  -- thread: ascension-isaiah-11-hidden-from-the-princes
  ('ascension-isaiah', 'ascension-isaiah', 11, 16, 'canon', '1-corinthians', 2, 8, 'free', E'1 Corinthians 2:8 — *Which none of the princes of this world knew: for had they known it, they would not have crucified Yahuah (Lord) of glory.* The descent that escaped all the princes of this world is why they crucified the Lord of glory unknowing.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 17, 'canon', 'philippians', 2, 7, 'free', E'Philippians 2:7 — *But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men:* Sucking the breast as a babe that He might not be recognized is the self-emptying of the Formed Son into the likeness of men.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 14, 'canon', 'isaiah', 53, 2, 'free', E'Isaiah 53:2 — *For he shall grow up before him as a tender plant, and as a root out of a dry ground: he hath no form nor comeliness; and when we shall see him, there is no beauty that we should desire him.* That they knew not whence He was is the no-form, no-comeliness Isaiah foretold.'),
  -- thread: ascension-isaiah-11-crucified-risen-the-third-day
  ('ascension-isaiah', 'ascension-isaiah', 11, 19, 'canon', 'ephesians', 4, 9, 'free', E'Ephesians 4:9 — *(Now that he ascended, what is it but that he also descended first into the lower parts of the earth?* His descent to the angel of Sheol is the descent into the lower parts of the earth Paul preaches.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 21, 'canon', 'ephesians', 4, 10, 'free', E'Ephesians 4:10 — *He that descended is the same also that ascended up far above all heavens, that he might fill all things.)* The one who rose the third day is the same who ascends far above all heavens through the seven that follow.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 19, 'canon', 'hebrews', 1, 3, 'free', E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* The Beloved delivered up and crucified is the express image of the Father who purged sins and sat down.'),
  -- thread: ascension-isaiah-11-ascent-the-angels-worshipped
  ('ascension-isaiah', 'ascension-isaiah', 11, 23, 'canon', 'philippians', 2, 9, 'free', E'Philippians 2:9 — *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name:* The angels worshipping as He ascends are answering the name the Father gave Him above every name.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 23, 'canon', 'philippians', 2, 10, 'free', E'Philippians 2:10 — *That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth;* The worship at each ascending heaven is every knee in heaven bowing to that name.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 23, 'canon', 'hebrews', 1, 6, 'free', E'Hebrews 1:6 — *And again, when he bringeth in the firstbegotten into the world, he saith, And let all the angels of Elohim (God) worship him.* The angels of the firmament worshipping is the Father''s own command over the firstbegotten.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 26, 'canon', 'revelation', 5, 12, 'free', E'Revelation 5:12 — *Saying with a loud voice, Worthy is the Lamb that was slain to receive power, and riches, and wisdom, and strength, and honour, and glory, and blessing.* The praise that increased in volume through the heavens is the heavenly worthy-is-the-Lamb of John''s throne-room.'),
  -- thread: ascension-isaiah-11-right-hand-of-the-great-glory
  ('ascension-isaiah', 'ascension-isaiah', 11, 32, 'canon', 'hebrews', 1, 3, 'free', E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* Sitting on the right hand of the Great Glory is the right hand of the Majesty on high — the Son seated, the Father glorified.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 32, 'canon', 'daniel', 7, 9, 'free', E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The Great Glory whose glory Isaiah could not behold is the Ancient of days enthroned in Daniel''s vision.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 32, 'canon', 'daniel', 7, 14, 'free', E'Daniel 7:14 — *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* The Beloved seated at the right hand receives the everlasting dominion the Ancient of days gives the Son of man.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 32, 'enoch', '1-enoch', 14, 15, 'extras', E'1 Enoch 14:15 — *But the middle one reached to heaven, like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire.* Enoch too was brought before the throne reaching to heaven whose Glory none of flesh could behold — it ain''t new.'),
  -- thread: ascension-isaiah-11-robes-thrones-crowns-laid-up
  ('ascension-isaiah', 'ascension-isaiah', 11, 40, 'canon', '2-timothy', 4, 8, 'free', E'2 Timothy 4:8 — *Henceforth there is laid up for me a crown of righteousness, which Yahuah (Lord), the righteous judge, shall give me at that day: and not to me only, but unto all them also that love his appearing.* The crowns of glory laid up in the seventh heaven are Paul''s crown of righteousness laid up for them that love His appearing.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 40, 'canon', 'revelation', 3, 5, 'free', E'Revelation 3:5 — *He that overcometh, the same shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels.* The garments laid up for those who watch are the white raiment promised the overcomer.'),
  ('ascension-isaiah', 'ascension-isaiah', 11, 40, 'canon', 'revelation', 4, 4, 'free', E'Revelation 4:4 — *And round about the throne were four and twenty seats: and upon the seats I saw four and twenty elders sitting, clothed in white raiment; and they had on their heads crowns of gold.* The thrones and crowns laid up in the seventh heaven are the elders'' seats and golden crowns about the throne.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session403_asci11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session403_asci11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-11-virgin-bethlehem',
       E'The virgin of David''s line — it ain''t new',
       E'Isaiah is shown the very thing Moses and the Prophets foretold: *And I indeed saw a woman of the family of David the prophet, named Mary, and Virgin, and she was espoused to a man named Joseph, a carpenter, and he also was of the seed and family of the righteous David of Bethlehem Yahudah (Judah).* (Ascension of Isaiah 11:2). The sign was given of old: *Therefore Yahuah (Lord) himself shall give you a sign; Behold, a virgin shall conceive, and bear a son, and shall call his name Immanuel.* (Isaiah 7:14), and the place named: *But thou, Beth-lehem Ephratah, though thou be little among the thousands of Yahudah (Judah), yet out of thee shall he come forth unto me that is to be ruler in Yashar''el (Israel); whose goings forth have been from of old, from everlasting.* (Micah 5:2). Matthew records the same espousal and the same conceiving: *Now the birth of Yahusha HaMashiach (Jesus Christ) was on this wise: When as his mother Mary was espoused to Joseph, before they came together, she was found with child of the Ruach HaKodesh (Holy Spirit).* (Matthew 1:18). The Beloved is the Formed Son sent into David''s line — not a stranger to the promise but its fulfilment.',
       sv.verse_id, ev.verse_id, 'extras', 67750
  FROM _session403_asci11_lookup sv, _session403_asci11_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=2
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=11 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-11-elohim-into-his-portion',
       E'Elohim come into his portion — the child appears',
       E'The birth in the vision is sudden and wondrous, the womb found whole as before: *It came to pass that when they were alone that Mary straightway looked with her eyes and saw a small babe, and she was astonished.* (Ascension of Isaiah 11:8). And Joseph''s eyes are opened to who the infant is: *And when her husband Joseph said unto her: "What has astonished thee?" his eyes were opened and he saw the infant and praised Elohim (God), because into his portion Elohim (God) had come.* (Ascension of Isaiah 11:10). This is the Word made flesh — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* (John 1:14) — the only begotten Son who HAS a Father, manifest in the flesh: *And without controversy great is the mystery of godliness: Elohim (God) was manifest in the flesh, justified in the Spirit, seen of angels, preached unto the Gentiles, believed on in the world, received up into glory.* (1 Timothy 3:16). Luke records the firstborn laid as a babe: *And she brought forth her firstborn son, and wrapped him in swaddling clothes, and laid him in a manger; because there was no room for them in the inn.* (Luke 2:7).',
       sv.verse_id, ev.verse_id, 'extras', 67753
  FROM _session403_asci11_lookup sv, _session403_asci11_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=8
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=11 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-11-hidden-from-the-princes',
       E'Hidden from the princes — they knew not whence He was',
       E'The Beloved came down veiled, unrecognised even at His birth: *And many said: "She has not borne a child, nor has a midwife gone up to her, nor have we heard the cries of labour pains." And they were all blinded respecting Him and they all knew regarding Him, though they knew not whence He was.* (Ascension of Isaiah 11:14). The descent itself escaped the heavens and the rulers: *And I saw, O Hezekiah and Josab my son, and I declare to the other prophets also who are standing by, that this hath escaped all the heavens and all the princes and all the gods of this world.* (Ascension of Isaiah 11:16). And in Nazareth He concealed His glory: *And I saw: In Nazareth He sucked the breast as a babe and as is customary in order that He might not be recognized.* (Ascension of Isaiah 11:17). Paul declares the very same hiddenness as the reason for the cross: *Which none of the princes of this world knew: for had they known it, they would not have crucified Yahuah (Lord) of glory.* (1 Corinthians 2:8). He made Himself of no reputation and took the form of a servant: *But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men:* (Philippians 2:7) — the Formed Son ordered under the Father, emptied that the rulers should not perceive Him. It ain''t new: of old He had no comeliness that we should desire Him.',
       sv.verse_id, ev.verse_id, 'extras', 67756
  FROM _session403_asci11_lookup sv, _session403_asci11_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=14
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=11 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-11-crucified-risen-the-third-day',
       E'Crucified on a tree, risen the third day',
       E'Isaiah sees the whole work of the Beloved at the end of the vision: *In Jerusalem indeed I saw Him being crucified on a tree:* (Ascension of Isaiah 11:20), and the resurrection: *And likewise after the third day rise again and remain days.* (Ascension of Isaiah 11:21). The adversary, not knowing who He was, stirred up the people: *And after this the adversary envied Him and roused the children of Yashar''el (Israel) against Him, not knowing who He was, and they delivered Him to the king, and crucified Him, and He descended to the angel of Sheol.* (Ascension of Isaiah 11:19). This is the descent and ascent of Ephesians: *(Now that he ascended, what is it but that he also descended first into the lower parts of the earth?* (Ephesians 4:9) — *He that descended is the same also that ascended up far above all heavens, that he might fill all things.)* (Ephesians 4:10). And the crucified one is the same who had by Himself purged sins and sat down: *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* (Hebrews 1:3). The Formed Son descends to Sheol and rises — sent, obedient, exalted.',
       sv.verse_id, ev.verse_id, 'extras', 67759
  FROM _session403_asci11_lookup sv, _session403_asci11_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=19
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=11 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-11-ascent-the-angels-worshipped',
       E'The ascent — every knee, in all the heavens',
       E'Risen, the Beloved ascends back through the firmament and the heavens, and the angels who had not perceived His descent now worship: *And I saw Him, and He was in the firmament, but He had not changed Himself into their form, and all the angels of the firmament and the Satans saw Him and they worshipped.* (Ascension of Isaiah 11:23). This is the exaltation Paul orders under the Father: *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name:* (Philippians 2:9) — *That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth;* (Philippians 2:10). The Father commands the angels to worship the firstbegotten: *And again, when he bringeth in the firstbegotten into the world, he saith, And let all the angels of Elohim (God) worship him.* (Hebrews 1:6). And John saw the same numberless host worshipping the Lamb: *And I beheld, and I heard the voice of many angels round about the throne and the beasts and the elders: and the number of them was ten thousand times ten thousand, and thousands of thousands;* (Revelation 5:11) — *Saying with a loud voice, Worthy is the Lamb that was slain to receive power, and riches, and wisdom, and strength, and honour, and glory, and blessing.* (Revelation 5:12). The order is kept: He is exalted and worshipped at the Father''s command, the Formed Son highly exalted.',
       sv.verse_id, ev.verse_id, 'extras', 67762
  FROM _session403_asci11_lookup sv, _session403_asci11_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=23
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=11 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-11-right-hand-of-the-great-glory',
       E'Seated at the right hand of the Great Glory',
       E'At the seventh heaven the ascent ends with the Beloved enthroned beside the Father, and the angel of the Spirit set in order: *And I saw how He ascended into the seventh heaven, and all the righteous and all the angels praised Him. And then I saw Him sit down on the right hand of that Great Glory whose glory I told you that I could not behold.* (Ascension of Isaiah 11:32), *And also the angel of the Ruach HaKodesh (Holy Spirit) I saw sitting on the left hand.* (Ascension of Isaiah 11:33). This is the right-hand seat Hebrews names: *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* (Hebrews 1:3). The Great Glory none can behold is the Ancient of days of Daniel''s throne, who gives the Son dominion: *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* (Daniel 7:9) — *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* (Daniel 7:14). It ain''t new: Enoch too was carried before that throne reaching to heaven: *But the middle one reached to heaven, like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire.* (1 Enoch 14:15). The Father is the Great Glory; the Son is seated at His right; the order is never flattened.',
       sv.verse_id, ev.verse_id, 'extras', 67765
  FROM _session403_asci11_lookup sv, _session403_asci11_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=32
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=11 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-11-robes-thrones-crowns-laid-up',
       E'Garments, thrones and crowns laid up in the seventh heaven',
       E'Isaiah is sent back to the flesh with a charge for the readers of the vision: *And thou wilt return into thy garment of the flesh until thy days are completed. Then thou wilt come hither.* (Ascension of Isaiah 11:35), and: *Such things ye will read. And watch ye in the Ruach HaKodesh (Holy Spirit) in order that ye may receive your garments and thrones and crowns of glory which are laid up in the seventh heaven.* (Ascension of Isaiah 11:40). The crown laid up is the same Paul awaited: *Henceforth there is laid up for me a crown of righteousness, which Yahuah (Lord), the righteous judge, shall give me at that day: and not to me only, but unto all them also that love his appearing.* (2 Timothy 4:8). The white robe is promised to the overcomer: *He that overcometh, the same shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels.* (Revelation 3:5), and the thrones are the elders'' seats about the throne: *And round about the throne were four and twenty seats: and upon the seats I saw four and twenty elders sitting, clothed in white raiment; and they had on their heads crowns of gold.* (Revelation 4:4). It ain''t new — the reward of the righteous is laid up in heaven and held for the faithful remnant.',
       sv.verse_id, ev.verse_id, 'extras', 67768
  FROM _session403_asci11_lookup sv, _session403_asci11_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=35
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=11 AND ev.verse_number=40
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ascension-isaiah-11-virgin-bethlehem
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 7:14 — *Therefore Yahuah (Lord) himself shall give you a sign; Behold, a virgin shall conceive, and bear a son, and shall call his name Immanuel.* The virgin Mary Isaiah beholds is the sign Isaiah himself had already spoken.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-virgin-bethlehem'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Micah 5:2 — *But thou, Beth-lehem Ephratah, though thou be little among the thousands of Yahudah (Judah), yet out of thee shall he come forth unto me that is to be ruler in Yashar''el (Israel); whose goings forth have been from of old, from everlasting.* The Bethlehem of Judah named in the vision is the Bethlehem of the prophecy.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-virgin-bethlehem'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 1:18 — *Now the birth of Yahusha HaMashiach (Jesus Christ) was on this wise: When as his mother Mary was espoused to Joseph, before they came together, she was found with child of the Ruach HaKodesh (Holy Spirit).* The same Mary, espoused to Joseph and found with child, that Isaiah saw centuries before.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-virgin-bethlehem'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 1:23 — *Behold, a virgin shall be with child, and shall bring forth a son, and they shall call his name Emmanuel, which being interpreted is, Elohim (God) with us.* Joseph''s hesitation to put her away ends where Isaiah''s own Immanuel sign begins.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-virgin-bethlehem'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-11-elohim-into-his-portion
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The infant in Joseph''s portion is the only begotten of the Father made flesh.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-elohim-into-his-portion'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Timothy 3:16 — *And without controversy great is the mystery of godliness: Elohim (God) was manifest in the flesh, justified in the Spirit, seen of angels, preached unto the Gentiles, believed on in the world, received up into glory.* Joseph praising because Elohim had come into his portion is the mystery of godliness manifest in the flesh.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-elohim-into-his-portion'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 2:7 — *And she brought forth her firstborn son, and wrapped him in swaddling clothes, and laid him in a manger; because there was no room for them in the inn.* The small babe Mary suddenly beheld is the firstborn son of Luke''s nativity.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-elohim-into-his-portion'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 9:6 — *For unto us a child is born, unto us a son is given: and the government shall be upon his shoulder: and his name shall be called Wonderful, Counsellor, El Gibbor (The mighty God), Avi-ad (The everlasting Father), Sar Shalom (The Prince of Peace).* The child appearing where the womb was found whole is the child born, the son given, of Isaiah''s own word.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-elohim-into-his-portion'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-11-hidden-from-the-princes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 2:8 — *Which none of the princes of this world knew: for had they known it, they would not have crucified Yahuah (Lord) of glory.* The descent that escaped all the princes of this world is why they crucified the Lord of glory unknowing.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-hidden-from-the-princes'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Philippians 2:7 — *But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men:* Sucking the breast as a babe that He might not be recognized is the self-emptying of the Formed Son into the likeness of men.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-hidden-from-the-princes'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 53:2 — *For he shall grow up before him as a tender plant, and as a root out of a dry ground: he hath no form nor comeliness; and when we shall see him, there is no beauty that we should desire him.* That they knew not whence He was is the no-form, no-comeliness Isaiah foretold.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-hidden-from-the-princes'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-11-crucified-risen-the-third-day
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 4:9 — *(Now that he ascended, what is it but that he also descended first into the lower parts of the earth?* His descent to the angel of Sheol is the descent into the lower parts of the earth Paul preaches.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-crucified-risen-the-third-day'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 4:10 — *He that descended is the same also that ascended up far above all heavens, that he might fill all things.)* The one who rose the third day is the same who ascends far above all heavens through the seven that follow.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-crucified-risen-the-third-day'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* The Beloved delivered up and crucified is the express image of the Father who purged sins and sat down.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-crucified-risen-the-third-day'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-11-ascent-the-angels-worshipped
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Philippians 2:9 — *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name:* The angels worshipping as He ascends are answering the name the Father gave Him above every name.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-ascent-the-angels-worshipped'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Philippians 2:10 — *That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth;* The worship at each ascending heaven is every knee in heaven bowing to that name.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-ascent-the-angels-worshipped'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:6 — *And again, when he bringeth in the firstbegotten into the world, he saith, And let all the angels of Elohim (God) worship him.* The angels of the firmament worshipping is the Father''s own command over the firstbegotten.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-ascent-the-angels-worshipped'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 5:12 — *Saying with a loud voice, Worthy is the Lamb that was slain to receive power, and riches, and wisdom, and strength, and honour, and glory, and blessing.* The praise that increased in volume through the heavens is the heavenly worthy-is-the-Lamb of John''s throne-room.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-ascent-the-angels-worshipped'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-11-right-hand-of-the-great-glory
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* Sitting on the right hand of the Great Glory is the right hand of the Majesty on high — the Son seated, the Father glorified.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-right-hand-of-the-great-glory'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The Great Glory whose glory Isaiah could not behold is the Ancient of days enthroned in Daniel''s vision.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-right-hand-of-the-great-glory'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 7:14 — *And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion, which shall not pass away, and his kingdom that which shall not be destroyed.* The Beloved seated at the right hand receives the everlasting dominion the Ancient of days gives the Son of man.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-right-hand-of-the-great-glory'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 14:15 — *But the middle one reached to heaven, like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire.* Enoch too was brought before the throne reaching to heaven whose Glory none of flesh could behold — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-right-hand-of-the-great-glory'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=32
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=14 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-11-robes-thrones-crowns-laid-up
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Timothy 4:8 — *Henceforth there is laid up for me a crown of righteousness, which Yahuah (Lord), the righteous judge, shall give me at that day: and not to me only, but unto all them also that love his appearing.* The crowns of glory laid up in the seventh heaven are Paul''s crown of righteousness laid up for them that love His appearing.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-robes-thrones-crowns-laid-up'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 3:5 — *He that overcometh, the same shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels.* The garments laid up for those who watch are the white raiment promised the overcomer.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-robes-thrones-crowns-laid-up'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 4:4 — *And round about the throne were four and twenty seats: and upon the seats I saw four and twenty elders sitting, clothed in white raiment; and they had on their heads crowns of gold.* The thrones and crowns laid up in the seventh heaven are the elders'' seats and golden crowns about the throne.'
  FROM cross_reference_threads t, cross_references x, _session403_asci11_lookup sv, _session403_asci11_lookup tv
 WHERE t.slug='ascension-isaiah-11-robes-thrones-crowns-laid-up'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=11 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

