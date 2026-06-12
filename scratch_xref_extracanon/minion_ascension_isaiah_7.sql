-- ----- fragment: minion_ascensionisaiah_07.sql (session403 ascension-isaiah 7) -----
-- Source anchor: ascension-isaiah/ascension-isaiah ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: asci7 (view _session403_asci7_lookup). Sort band base 67650, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session403_asci7_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ascension-isaiah-7-sent-from-the-seventh-heaven
  ('ascension-isaiah', 'ascension-isaiah', 7, 8, 'canon', 'ephesians', 4, 10, 'free', E'Ephesians 4:10 — *He that descended is the same also that ascended up far above all heavens, that he might fill all things.)* The one sent down from the seventh heaven is the same one who ascends back above all the heavens — the descent-and-ascent of Ascension of Isaiah 7:8.'),
  ('ascension-isaiah', 'ascension-isaiah', 7, 8, 'canon', 'philippians', 2, 9, 'free', E'Philippians 2:9 — *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name:* The Beloved is exalted BY the Father who is greater — exaltation given, not seized, matching the sent-and-subordinate order of Ascension of Isaiah 7:8.'),
  ('ascension-isaiah', 'ascension-isaiah', 7, 8, 'canon', 'john', 17, 5, 'free', E'John 17:5 — *And now, O Father, glorify thou me with thine own self with the glory which I had with thee before the world was.* The Son addresses a Father greater than Himself and names a glory held WITH Him before the world — the very frame of "His Father also who is greater" in Ascension of Isaiah 7:8.'),
  -- thread: ascension-isaiah-7-the-beloved-and-the-one-on-the-throne
  ('ascension-isaiah', 'ascension-isaiah', 7, 17, 'canon', 'hebrews', 1, 6, 'free', E'Hebrews 1:6 — *And again, when he bringeth in the firstbegotten into the world, he saith, And let all the angels of Elohim (God) worship him.* The Beloved who receives the heavens'' praise in Ascension of Isaiah 7:17 is the firstbegotten the Father commands the angels to worship.'),
  ('ascension-isaiah', 'ascension-isaiah', 7, 17, 'canon', 'revelation', 5, 13, 'free', E'Revelation 5:13 — *And every creature which is in heaven, and on the earth, and under the earth, and such as are in the sea, and all that are in them, heard I saying, Blessing, and honour, and glory, and power, be unto him that sitteth upon the throne, and unto the Lamb for ever and ever.* The same two-fold honour — to Him on the throne AND to the Lamb/Beloved — that the angel describes in Ascension of Isaiah 7:17.'),
  ('ascension-isaiah', 'ascension-isaiah', 7, 17, 'canon', 'philippians', 2, 11, 'free', E'Philippians 2:11 — *And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father.* Confession of the Beloved as Lord redounds TO the Father''s glory — the ordered honour of Ascension of Isaiah 7:17, never collapsed into one person.'),
  -- thread: ascension-isaiah-7-caught-up-through-the-heavens
  ('ascension-isaiah', 'ascension-isaiah', 7, 3, 'canon', '2-corinthians', 12, 2, 'free', E'2 Corinthians 12:2 — *I knew a man in Messiah (Christ) above fourteen years ago, (whether in the body, I cannot tell; or whether out of the body, I cannot tell: Elohim (God) knoweth;) such an one caught up to the third heaven.* Paul''s ascent through the heavens — caught up bodily yet uncertain of the body — is the same kind of vision Isaiah is seized into in Ascension of Isaiah 7:3.'),
  ('ascension-isaiah', 'ascension-isaiah', 7, 5, 'canon', '2-corinthians', 12, 4, 'free', E'2 Corinthians 12:4 — *How that he was caught up into paradise, and heard unspeakable words, which it is not lawful for a man to utter.* The unspeakable things heard above, with a return to the body, match Isaiah''s promised return in Ascension of Isaiah 7:5.'),
  -- thread: ascension-isaiah-7-thrones-crowns-laid-up
  ('ascension-isaiah', 'ascension-isaiah', 7, 22, 'canon', 'revelation', 4, 4, 'free', E'Revelation 4:4 — *And round about the throne were four and twenty seats: and upon the seats I saw four and twenty elders sitting, clothed in white raiment; and they had on their heads crowns of gold.* The throne, white garment and crown laid up above the heavens in Ascension of Isaiah 7:22 are the very seats, raiment and crowns John sees about the throne.'),
  ('ascension-isaiah', 'ascension-isaiah', 7, 22, 'canon', 'revelation', 3, 5, 'free', E'Revelation 3:5 — *He that overcometh, the same shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels.* The garments reserved above for the overcomer answer the garments shown to Isaiah in Ascension of Isaiah 7:22.'),
  ('ascension-isaiah', 'ascension-isaiah', 7, 23, 'canon', '2-timothy', 4, 8, 'free', E'2 Timothy 4:8 — *Henceforth there is laid up for me a crown of righteousness, which Yahuah (Lord), the righteous judge, shall give me at that day: and not to me only, but unto all them also that love his appearing.* The crown laid up for them that love His appearing matches the reward for those who love the Most High and His Beloved in Ascension of Isaiah 7:23.'),
  -- thread: ascension-isaiah-7-sammael-and-the-seed-war
  ('ascension-isaiah', 'ascension-isaiah', 7, 12, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The war till the Beloved comes and destroys him in Ascension of Isaiah 7:12 is the head-bruising promised at the start — it ain''t new.'),
  ('ascension-isaiah', 'ascension-isaiah', 7, 9, 'jubilees', 'jubilees', 10, 8, 'extras', E'Jubilees 10:8 — *And the chief of the spirits, Mastêmâ, came and said: “Yahuah (God), Creator, let some of them remain before me, and let them hearken to my voice, and do all that I shall say to them; for if some of them are not left to me, I shall not be able to execute the power of my will on the sons of men; for these are for corruption and leading astray before my judgment, for great is the wickedness of the sons of men.” And He said: “Let the tenth part of them remain before him, and let nine parts descend into the place of condemnation.”* The chief-of-spirits left to rule is the same Sammael with his hosts envying in the firmament in Ascension of Isaiah 7:9.'),
  ('ascension-isaiah', 'ascension-isaiah', 7, 9, 'jubilees', 'jubilees', 10, 11, 'extras', E'Jubilees 10:11 — *And we did according to all His words: all the malignant evil ones we bound in the place of condemnation, and a tenth part of them we left that they might be subject before Satan on the earth.* The remnant of evil spirits left subject to Satan is the host of Sammael at war in Ascension of Isaiah 7:9.'),
  -- thread: ascension-isaiah-7-the-only-begotten-none-can-name
  ('ascension-isaiah', 'ascension-isaiah', 7, 37, 'canon', 'john', 1, 18, 'free', E'John 1:18 — *No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him.* The unseen Father and the distinct Only-begotten of Ascension of Isaiah 7:37 are John''s unseen Elohim and the only begotten Son in His bosom.'),
  ('ascension-isaiah', 'ascension-isaiah', 7, 37, 'canon', 'exodus', 33, 20, 'free', E'Exodus 33:20 — *And he said, Thou canst not see my face: for there shall no man see me, and live.* The One "whose name is not known to any flesh" in Ascension of Isaiah 7:37 is the same Most High whose face no man may see and live.'),
  ('ascension-isaiah', 'ascension-isaiah', 7, 37, 'canon', 'proverbs', 30, 4, 'free', E'Proverbs 30:4 — *Who hath ascended up into heaven, or descended? who hath gathered the wind in his fists? who hath bound the waters in a garment? who hath established all the ends of the earth? what is his name, and what is his son’s name, if thou canst tell?* Agur''s riddle of the Father''s name and His son''s name is answered in the unnamed One and the Only-begotten of Ascension of Isaiah 7:37 — it ain''t new.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session403_asci7_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session403_asci7_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-7-sent-from-the-seventh-heaven',
       E'Sent from the seventh heaven — the Father who is greater',
       E'The guiding angel keeps the order of heaven exactly as Yoshi reads it: *And His Father also who is greater thou wilt see; for for this purpose have I been sent from the seventh heaven in order to explain all these things unto thee.* (Ascension of Isaiah 7:8). The one who descends is **sent** and has a **Father who is greater** — the Formed Son ordered under the Most High, not a co-equal person and not the Father Himself. It ain''t new: the Word was *with* Elohim and made flesh by the Father''s purpose — *He that descended is the same also that ascended up far above all heavens, that he might fill all things.* (Ephesians 4:10); *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name:* (Philippians 2:9); and the Son Himself names the glory He had *with* the Father before the descent — *And now, O Father, glorify thou me with thine own self with the glory which I had with thee before the world was.* (John 17:5).',
       sv.verse_id, ev.verse_id, 'extras', 67650
  FROM _session403_asci7_lookup sv, _session403_asci7_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=8
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=7 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-7-the-beloved-and-the-one-on-the-throne',
       E'Praise sent to Him who sitteth in the seventh heaven, and to His Beloved',
       E'The angel names the destination of all the heavens'' praise — and holds the order: *It is sent to the praise of Him who sitteth in the seventh heaven: to Him who rests in the holy world, and to His Beloved, whence I have been sent to thee. Thither is it sent.* (Ascension of Isaiah 7:17). The One on the throne is the Father; **His Beloved** is distinct from Him and beside Him — not a second God and not the same person, but the Son the Father loves. It ain''t new: the firstbegotten brought into the world is worshipped at the Father''s word — *And again, when he bringeth in the firstbegotten into the world, he saith, And let all the angels of Elohim (God) worship him.* (Hebrews 1:6); and Revelation keeps the same two-fold honour — *And every creature which is in heaven, and on the earth, and under the earth, and such as are in the sea, and all that are in them, heard I saying, Blessing, and honour, and glory, and power, be unto him that sitteth upon the throne, and unto the Lamb for ever and ever.* (Revelation 5:13). Every tongue confesses the Beloved as Lord *to the glory of Elohim (God) the Father* — *And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father.* (Philippians 2:11).',
       sv.verse_id, ev.verse_id, 'extras', 67653
  FROM _session403_asci7_lookup sv, _session403_asci7_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=17
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=7 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-7-caught-up-through-the-heavens',
       E'Raised on high through the degrees — caught up to the heavens',
       E'Isaiah is seized by the hand and lifted: *And having seized me by my hand he raised me on high, and I said unto him: "Who art thou, and what is thy name, and whither art thou raising me on high? for strength was given me to speak with him."* (Ascension of Isaiah 7:3), and the angel promises a return to the body: *Because thou wilt return into this thy body, but whither I am raising thee on high, thou wilt see; for for this purpose have I been sent.* (Ascension of Isaiah 7:5). It ain''t new — Paul is caught up the same way and cannot tell body from spirit: *I knew a man in Messiah (Christ) above fourteen years ago, (whether in the body, I cannot tell; or whether out of the body, I cannot tell: Elohim (God) knoweth;) such an one caught up to the third heaven.* (2 Corinthians 12:2); *How that he was caught up into paradise, and heard unspeakable words, which it is not lawful for a man to utter.* (2 Corinthians 12:4).',
       sv.verse_id, ev.verse_id, 'extras', 67656
  FROM _session403_asci7_lookup sv, _session403_asci7_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=3
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=7 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-7-thrones-crowns-laid-up',
       E'Thrones, garments and crowns laid up above the heavens',
       E'The angel forbids worship of any throne or angel of the six heavens, then reveals what is kept for the righteous: *For above all the heavens and their angels has thy throne been placed, and thy garments and thy crown which thou shalt see.* (Ascension of Isaiah 7:22); and the ascent belongs to those who love the Most High and His Beloved: *And I rejoiced with great joy, that those who love the Most High and His Beloved will afterwards ascend thither by the angel of the Ruach HaKodesh (Holy Spirit).* (Ascension of Isaiah 7:23). It ain''t new — the throne, the white robe and the crown are already laid up: *And round about the throne were four and twenty seats: and upon the seats I saw four and twenty elders sitting, clothed in white raiment; and they had on their heads crowns of gold.* (Revelation 4:4); *He that overcometh, the same shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels.* (Revelation 3:5); *Henceforth there is laid up for me a crown of righteousness, which Yahuah (Lord), the righteous judge, shall give me at that day: and not to me only, but unto all them also that love his appearing.* (2 Timothy 4:8).',
       sv.verse_id, ev.verse_id, 'extras', 67659
  FROM _session403_asci7_lookup sv, _session403_asci7_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=22
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=7 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-7-sammael-and-the-seed-war',
       E'Sammael in the firmament — the war that ends when He comes',
       E'Rising to the firmament, Isaiah sees the adversary''s host at war: *And we ascended to the firmament, I and he, and there I saw Sammael and his hosts, and there was great fighting therein and the angels of Satan were envying one another.* (Ascension of Isaiah 7:9); and the angel sets its end: *And he said unto me: "So has it been since this world was made until now, and this war (will continue) till He, whom thou shalt see will come and destroy him."* (Ascension of Isaiah 7:12). It ain''t new — the war is the seed-war declared in the garden: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15); and Sammael/ha-satan is the very chief of spirits left to rule, as the restored books record — *And the chief of the spirits, Mastêmâ, came and said... let some of them remain before me...* (Jubilees 10:8); *And we did according to all His words: all the malignant evil ones we bound in the place of condemnation, and a tenth part of them we left that they might be subject before Satan on the earth.* (Jubilees 10:11).',
       sv.verse_id, ev.verse_id, 'extras', 67662
  FROM _session403_asci7_lookup sv, _session403_asci7_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=9
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=7 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-7-the-only-begotten-none-can-name',
       E'The Only-begotten and Him who is not named — none can behold',
       E'At the fifth heaven Isaiah''s praise rises past every throne to the unnameable One and His Son: *And I praised Him, who is not named and the Only-begotten who dwelleth in the heavens, whose name is not known to any flesh, who has bestowed such glory on the several heavens, and who makes great the glory of the angels, and more excellent the glory of Him who sitteth on the throne.* (Ascension of Isaiah 7:37). The Father is unseen and unnamed; the **Only-begotten** is distinct and dwells in the heavens — the Formed Son, not the Father, not a creature. It ain''t new: *No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him.* (John 1:18); *And he said, Thou canst not see my face: for there shall no man see me, and live.* (Exodus 33:20); and Agur already asked the Father-and-Son riddle — *Who hath ascended up into heaven, or descended?... what is his name, and what is his son’s name, if thou canst tell?* (Proverbs 30:4).',
       sv.verse_id, ev.verse_id, 'extras', 67665
  FROM _session403_asci7_lookup sv, _session403_asci7_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=37
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=7 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ascension-isaiah-7-sent-from-the-seventh-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 4:10 — *He that descended is the same also that ascended up far above all heavens, that he might fill all things.)* The one sent down from the seventh heaven is the same one who ascends back above all the heavens — the descent-and-ascent of Ascension of Isaiah 7:8.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-sent-from-the-seventh-heaven'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Philippians 2:9 — *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name:* The Beloved is exalted BY the Father who is greater — exaltation given, not seized, matching the sent-and-subordinate order of Ascension of Isaiah 7:8.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-sent-from-the-seventh-heaven'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 17:5 — *And now, O Father, glorify thou me with thine own self with the glory which I had with thee before the world was.* The Son addresses a Father greater than Himself and names a glory held WITH Him before the world — the very frame of "His Father also who is greater" in Ascension of Isaiah 7:8.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-sent-from-the-seventh-heaven'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=17 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-7-the-beloved-and-the-one-on-the-throne
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 1:6 — *And again, when he bringeth in the firstbegotten into the world, he saith, And let all the angels of Elohim (God) worship him.* The Beloved who receives the heavens'' praise in Ascension of Isaiah 7:17 is the firstbegotten the Father commands the angels to worship.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-the-beloved-and-the-one-on-the-throne'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 5:13 — *And every creature which is in heaven, and on the earth, and under the earth, and such as are in the sea, and all that are in them, heard I saying, Blessing, and honour, and glory, and power, be unto him that sitteth upon the throne, and unto the Lamb for ever and ever.* The same two-fold honour — to Him on the throne AND to the Lamb/Beloved — that the angel describes in Ascension of Isaiah 7:17.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-the-beloved-and-the-one-on-the-throne'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Philippians 2:11 — *And that every tongue should confess that Yahusha HaMashiach (Jesus Christ) is Lord, to the glory of Elohim (God) the Father.* Confession of the Beloved as Lord redounds TO the Father''s glory — the ordered honour of Ascension of Isaiah 7:17, never collapsed into one person.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-the-beloved-and-the-one-on-the-throne'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-7-caught-up-through-the-heavens
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 12:2 — *I knew a man in Messiah (Christ) above fourteen years ago, (whether in the body, I cannot tell; or whether out of the body, I cannot tell: Elohim (God) knoweth;) such an one caught up to the third heaven.* Paul''s ascent through the heavens — caught up bodily yet uncertain of the body — is the same kind of vision Isaiah is seized into in Ascension of Isaiah 7:3.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-caught-up-through-the-heavens'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 12:4 — *How that he was caught up into paradise, and heard unspeakable words, which it is not lawful for a man to utter.* The unspeakable things heard above, with a return to the body, match Isaiah''s promised return in Ascension of Isaiah 7:5.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-caught-up-through-the-heavens'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=12 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-7-thrones-crowns-laid-up
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 4:4 — *And round about the throne were four and twenty seats: and upon the seats I saw four and twenty elders sitting, clothed in white raiment; and they had on their heads crowns of gold.* The throne, white garment and crown laid up above the heavens in Ascension of Isaiah 7:22 are the very seats, raiment and crowns John sees about the throne.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-thrones-crowns-laid-up'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 3:5 — *He that overcometh, the same shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels.* The garments reserved above for the overcomer answer the garments shown to Isaiah in Ascension of Isaiah 7:22.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-thrones-crowns-laid-up'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Timothy 4:8 — *Henceforth there is laid up for me a crown of righteousness, which Yahuah (Lord), the righteous judge, shall give me at that day: and not to me only, but unto all them also that love his appearing.* The crown laid up for them that love His appearing matches the reward for those who love the Most High and His Beloved in Ascension of Isaiah 7:23.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-thrones-crowns-laid-up'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-7-sammael-and-the-seed-war
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The war till the Beloved comes and destroys him in Ascension of Isaiah 7:12 is the head-bruising promised at the start — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-sammael-and-the-seed-war'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 10:8 — *And the chief of the spirits, Mastêmâ, came and said: “Yahuah (God), Creator, let some of them remain before me, and let them hearken to my voice, and do all that I shall say to them; for if some of them are not left to me, I shall not be able to execute the power of my will on the sons of men; for these are for corruption and leading astray before my judgment, for great is the wickedness of the sons of men.” And He said: “Let the tenth part of them remain before him, and let nine parts descend into the place of condemnation.”* The chief-of-spirits left to rule is the same Sammael with his hosts envying in the firmament in Ascension of Isaiah 7:9.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-sammael-and-the-seed-war'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 10:11 — *And we did according to all His words: all the malignant evil ones we bound in the place of condemnation, and a tenth part of them we left that they might be subject before Satan on the earth.* The remnant of evil spirits left subject to Satan is the host of Sammael at war in Ascension of Isaiah 7:9.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-sammael-and-the-seed-war'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-7-the-only-begotten-none-can-name
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:18 — *No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him.* The unseen Father and the distinct Only-begotten of Ascension of Isaiah 7:37 are John''s unseen Elohim and the only begotten Son in His bosom.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-the-only-begotten-none-can-name'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 33:20 — *And he said, Thou canst not see my face: for there shall no man see me, and live.* The One "whose name is not known to any flesh" in Ascension of Isaiah 7:37 is the same Most High whose face no man may see and live.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-the-only-begotten-none-can-name'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=33 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 30:4 — *Who hath ascended up into heaven, or descended? who hath gathered the wind in his fists? who hath bound the waters in a garment? who hath established all the ends of the earth? what is his name, and what is his son’s name, if thou canst tell?* Agur''s riddle of the Father''s name and His son''s name is answered in the unnamed One and the Only-begotten of Ascension of Isaiah 7:37 — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session403_asci7_lookup sv, _session403_asci7_lookup tv
 WHERE t.slug='ascension-isaiah-7-the-only-begotten-none-can-name'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=7 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=30 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

