-- ----- fragment: minion_ascensionisaiah_10.sql (session403 ascension-isaiah 10) -----
-- Source anchor: ascension-isaiah/ascension-isaiah ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: asci10 (view _session403_asci10_lookup). Sort band base 67725, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session403_asci10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ascension-isaiah-10-the-father-of-my-lord
  ('ascension-isaiah', 'ascension-isaiah', 10, 7, 'canon', 'philippians', 2, 6, 'free', E'Philippians 2:6 — *Who, being in the form of Elohim (God), thought it not robbery to be equal with Elohim (God):* The Most High speaking TO the Beloved (10:7) shows the order Paul guards — the Son in the Father''s form yet sent, not grasping co-equality.'),
  ('ascension-isaiah', 'ascension-isaiah', 10, 7, 'canon', 'hebrews', 1, 5, 'free', E'Hebrews 1:5 — *For unto which of the angels said he at any time, Thou art my Son, this day have I begotten thee? And again, I will be to him a Father, and he shall be to me a Son?* The "Father of my Lord" (10:7) is the begetting Father — the Beloved is the begotten Son, not one of the angels He outranks.'),
  ('ascension-isaiah', 'ascension-isaiah', 10, 6, 'canon', 'john', 17, 5, 'free', E'John 17:5 — *And now, O Father, glorify thou me with thine own self with the glory which I had with thee before the world was.* The glory the Most High holds (10:6) is the glory the Son shared before His descent and asks back after it.'),
  ('ascension-isaiah', 'ascension-isaiah', 10, 8, 'canon', 'proverbs', 30, 4, 'free', E'Proverbs 30:4 — *Who hath ascended up into heaven, or descended? who hath gathered the wind in his fists? who hath bound the waters in a garment? who hath established all the ends of the earth? what is his name, and what is his son''s name, if thou canst tell?* The descent commanded in 10:8 answers Agur''s ancient riddle: the Most High has a Son who descends.'),
  -- thread: ascension-isaiah-10-transformed-unknown
  ('ascension-isaiah', 'ascension-isaiah', 10, 11, 'canon', '1-corinthians', 2, 8, 'free', E'1 Corinthians 2:8 — *Which none of the princes of this world knew: for had they known it, they would not have crucified Yahuah (Lord) of glory.* Exactly the Ascension''s logic: the Beloved was so transformed (10:11) that the rulers did not know Him — had they known, they would not have crucified Him.'),
  ('ascension-isaiah', 'ascension-isaiah', 10, 9, 'canon', 'philippians', 2, 7, 'free', E'Philippians 2:7 — *But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men:* The command to become "like unto the likeness" of each rank (10:9) is the self-emptying Paul preaches — the Formed Son took the servant''s form.'),
  ('ascension-isaiah', 'ascension-isaiah', 10, 10, 'canon', 'isaiah', 53, 2, 'free', E'Isaiah 53:2 — *For he shall grow up before him as a tender plant, and as a root out of a dry ground: he hath no form nor comeliness; and when we shall see him, there is no beauty that we should desire him.* The veiled "form" through the heavens (10:10) is the same hidden comeliness the prophet foresaw on earth.'),
  ('ascension-isaiah', 'ascension-isaiah', 10, 11, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The One unknown to the angels (10:11) is the Word veiled in flesh, His glory beheld only by those given eyes.'),
  -- thread: ascension-isaiah-10-none-beside-us
  ('ascension-isaiah', 'ascension-isaiah', 10, 13, 'canon', 'isaiah', 45, 5, 'free', E'Isaiah 45:5 — *I am Yahuah (LORD), and there is none else, there is no Elohim (God) beside me: I girded thee, though thou hast not known me:* The boast of the rebel powers (10:13) is a theft of Yahuah''s own exclusive confession — His alone to make, blasphemy in their mouths.'),
  ('ascension-isaiah', 'ascension-isaiah', 10, 13, 'canon', 'isaiah', 45, 21, 'free', E'Isaiah 45:21 — *Tell ye, and bring them near; yea, let them take counsel together: who hath declared this from ancient time? who hath told it from that time? have not I Yahuah (LORD)? and there is no Elohim (God) else beside me; a just Elohim (God) and a Saviour; there is none beside me.* The gods who say "there is none beside us" (10:13) counterfeit the Saviour''s own word — and so are marked for the judgment the Beloved is sent to bring.'),
  -- thread: ascension-isaiah-10-exalted-right-hand
  ('ascension-isaiah', 'ascension-isaiah', 10, 14, 'canon', 'philippians', 2, 9, 'free', E'Philippians 2:9 — *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name:* The ascent "in glory" to sit at the right hand (10:14) is the exaltation Paul names — granted BY the Father after the descent, the Formed-Son order intact.'),
  ('ascension-isaiah', 'ascension-isaiah', 10, 15, 'canon', 'philippians', 2, 10, 'free', E'Philippians 2:10 — *That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth;* The princes and powers worshipping the returned Beloved (10:15) are the knees in heaven, earth, and under the earth that bow at His exalted name.'),
  ('ascension-isaiah', 'ascension-isaiah', 10, 14, 'canon', 'hebrews', 1, 3, 'free', E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* The seating "on My right hand" (10:14) is the same right hand of the Majesty — the Son enthroned beside, not over, the Father.'),
  ('ascension-isaiah', 'ascension-isaiah', 10, 15, 'canon', 'hebrews', 1, 6, 'free', E'Hebrews 1:6 — *And again, when he bringeth in the firstbegotten into the world, he saith, And let all the angels of Elohim (God) worship him.* The powers'' worship (10:15) is by the Father''s word — the firstbegotten is worshipped at the Most High''s command, never by self-seizure.'),
  -- thread: ascension-isaiah-10-descent-through-seven-heavens
  ('ascension-isaiah', 'ascension-isaiah', 10, 17, 'canon', 'ephesians', 4, 9, 'free', E'Ephesians 4:9 — *(Now that he ascended, what is it but that he also descended first into the lower parts of the earth?* The Lord going forth from the seventh heaven downward (10:17) is the descent "first into the lower parts" Paul declares of the one Lord.'),
  ('ascension-isaiah', 'ascension-isaiah', 10, 18, 'canon', 'ephesians', 4, 10, 'free', E'Ephesians 4:10 — *He that descended is the same also that ascended up far above all heavens, that he might fill all things.)* The Descender of 10:18 IS the Ascender — one Lord through all the heavens, exactly as the Vision shows.'),
  ('ascension-isaiah', 'ascension-isaiah', 10, 24, 'canon', '1-timothy', 3, 16, 'free', E'1 Timothy 3:16 — *And without controversy great is the mystery of godliness: Elohim (God) was manifest in the flesh, justified in the Spirit, seen of angels, preached unto the Gentiles, believed on in the world, received up into glory.* The veiled passage past the gates so as not to be recognized (10:24) is the mystery of godliness — manifested, seen of angels, received up into glory.'),
  ('ascension-isaiah', 'ascension-isaiah', 10, 17, 'canon', '2-corinthians', 12, 2, 'free', E'2 Corinthians 12:2 — *I knew a man in Messiah (Christ) above fourteen years ago, (whether in the body, I cannot tell; or whether out of the body, I cannot tell: Elohim (God) knoweth;) such an one caught up to the third heaven.* Isaiah''s heaven-by-heaven sight of his Lord (10:17) is the same order of ascent-vision Paul was granted, caught up through the heavens.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session403_asci10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session403_asci10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-10-the-father-of-my-lord',
       E'The Most High, the Father of my Lord — the Beloved sent forth',
       E'Isaiah hears the commissioning: *"This is the Most High of the high ones, dwelling in the holy world, and resting in His holy ones, who will be called by the Ruach HaKodesh (Holy Spirit) through the lips of the righteous the Father of Yahuah (Lord)."* (Ascension of Isaiah 10:6) — and then *And I heard the voice of the Most High, the Father of my Lord, saying to my Yahuah (Lord) Messiah (Christ) who will be called Yahusha (Jesus):* (Ascension of Isaiah 10:7) — *"Go forth and descend through all the heavens, and thou wilt descend to the firmament and that world..."* (Ascension of Isaiah 10:8). It ain''t new: this is the Formed Son ordered under His Father — one who HAS a Father and is sent by Him, not a co-equal abstraction nor a created angel. *Who, being in the form of Elohim (God), thought it not robbery to be equal with Elohim (God):* (Philippians 2:6). The Son is begotten and given a Father''s word: *Thou art my Son, this day have I begotten thee? And again, I will be to him a Father, and he shall be to me a Son?* (Hebrews 1:5). His glory with the Father preceded the sending: *And now, O Father, glorify thou me with thine own self with the glory which I had with thee before the world was.* (John 17:5). The riddle Agur set is here answered — the One who descends has a Father AND a name: *Who hath ascended up into heaven, or descended?... what is his name, and what is his son''s name, if thou canst tell?* (Proverbs 30:4).',
       sv.verse_id, ev.verse_id, 'extras', 67725
  FROM _session403_asci10_lookup sv, _session403_asci10_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=6
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=10 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-10-transformed-unknown',
       E'Transformed through the heavens — that none should know Him',
       E'The Father orders the Beloved to veil His glory: *And thou wilt become like unto the likeness of all who are in the five heavens.* (Ascension of Isaiah 10:9), *And thou wilt be careful to become like the form of the angels of the firmament and the angels also who are in Sheol.* (Ascension of Isaiah 10:10), *And none of the angels of that world shall know that Thou art with Me of the seven heavens and of their angels.* (Ascension of Isaiah 10:11). It ain''t new — this is the hidden glory Paul names: *But we speak the wisdom of Elohim (God) in a mystery, even the hidden wisdom, which Elohim (God) ordained before the world unto our glory:* (1 Corinthians 2:7) — *Which none of the princes of this world knew: for had they known it, they would not have crucified Yahuah (Lord) of glory.* (1 Corinthians 2:8). The veiling is the self-emptying: *But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men:* (Philippians 2:7). Isaiah had already foretold the unrecognized form: *For he shall grow up before him as a tender plant, and as a root out of a dry ground: he hath no form nor comeliness; and when we shall see him, there is no beauty that we should desire him.* (Isaiah 53:2). And the Word so veiled was yet the Word made flesh, His glory seen only by faith: *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* (John 1:14).',
       sv.verse_id, ev.verse_id, 'extras', 67728
  FROM _session403_asci10_lookup sv, _session403_asci10_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=9
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=10 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-10-none-beside-us',
       E'We alone are, and there is none beside us — the gods judged',
       E'The Father gives the Beloved authority to judge the usurping powers: *And they shall not know that Thou art with Me, till with a loud voice I have called to the heavens, and their angels and their lights, even unto the sixth heaven, in order that you mayest judge and destroy the princes and angels and gods of that world, and the world that is dominated by them:* (Ascension of Isaiah 10:12), *For they have denied Me and said: ''We alone are and there is none beside us.''* (Ascension of Isaiah 10:13). It ain''t new — that boast is the counterfeit of Yahuah''s own true word, stolen and turned to rebellion. The Most High alone may say it: *I am Yahuah (LORD), and there is none else, there is no Elohim (God) beside me: I girded thee, though thou hast not known me:* (Isaiah 45:5). The princes of that world parrot the Creator''s confession to deny Him: *Tell ye, and bring them near; yea, let them take counsel together: who hath declared this from ancient time? who hath told it from that time? have not I Yahuah (LORD)? and there is no Elohim (God) else beside me; a just Elohim (God) and a Saviour; there is none beside me.* (Isaiah 45:21). The Beloved descends as the Father''s appointed judge over these pretenders — the order holds: the Son executes the Father''s sentence on the gods who denied Him.',
       sv.verse_id, ev.verse_id, 'extras', 67731
  FROM _session403_asci10_lookup sv, _session403_asci10_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=12
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=10 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-10-exalted-right-hand',
       E'Ascend in glory and sit on My right hand — every power shall worship',
       E'After the descent the Father promises the Beloved''s untransformed return and exaltation: *And afterwards from the angels of death Thou wilt ascend to Thy place. And Thou wilt not be transformed in each heaven, but in glory wilt Thou ascend and sit on My right hand.* (Ascension of Isaiah 10:14), *And thereupon the princes and powers of that world will worship Thee.* (Ascension of Isaiah 10:15). It ain''t new — this is the wherefore of Philippians: because He humbled Himself, *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name:* (Philippians 2:9), *That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth;* (Philippians 2:10). The seating at the right hand is the order kept — the Son exalted BY the Father: *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* (Hebrews 1:3). And the worship of the powers (10:15) is the Father''s command, not the Son''s seizure: *And again, when he bringeth in the firstbegotten into the world, he saith, And let all the angels of Elohim (God) worship him.* (Hebrews 1:6).',
       sv.verse_id, ev.verse_id, 'extras', 67734
  FROM _session403_asci10_lookup sv, _session403_asci10_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=14
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=10 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-10-descent-through-seven-heavens',
       E'He descended far above all heavens — the seven-heaven descent',
       E'Isaiah watches the Lord go down rank by rank: *And so I saw my Lord go forth from the seventh heaven into the sixth heaven.* (Ascension of Isaiah 10:17), and the guide says *And the angel who conducted me from this world was with me and said unto me: "Understand, Isaiah, and see the transformation and descent of Yahuah (Lord) will appear."* (Ascension of Isaiah 10:18) — passing each gate giving the password, *And those who kept the gate of the third heaven demanded the password, and Yahuah (Lord) gave it to them in order that He should not be recognized. And when they saw Him, they did not praise or laud Him; for His form was like unto their form.* (Ascension of Isaiah 10:24). It ain''t new — Paul preaches the same one Descender-Ascender: *(Now that he ascended, what is it but that he also descended first into the lower parts of the earth?* (Ephesians 4:9), *He that descended is the same also that ascended up far above all heavens, that he might fill all things.)* (Ephesians 4:10). The whole mystery is the manifestation seen by angels and received back up: *And without controversy great is the mystery of godliness: Elohim (God) was manifest in the flesh, justified in the Spirit, seen of angels, preached unto the Gentiles, believed on in the world, received up into glory.* (1 Timothy 3:16). And Isaiah''s own caught-up vision is the same the apostle was given: *I knew a man in Messiah (Christ) above fourteen years ago, (whether in the body, I cannot tell; or whether out of the body, I cannot tell: Elohim (God) knoweth;) such an one caught up to the third heaven.* (2 Corinthians 12:2).',
       sv.verse_id, ev.verse_id, 'extras', 67737
  FROM _session403_asci10_lookup sv, _session403_asci10_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=17
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=10 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ascension-isaiah-10-the-father-of-my-lord
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Philippians 2:6 — *Who, being in the form of Elohim (God), thought it not robbery to be equal with Elohim (God):* The Most High speaking TO the Beloved (10:7) shows the order Paul guards — the Son in the Father''s form yet sent, not grasping co-equality.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-the-father-of-my-lord'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 1:5 — *For unto which of the angels said he at any time, Thou art my Son, this day have I begotten thee? And again, I will be to him a Father, and he shall be to me a Son?* The "Father of my Lord" (10:7) is the begetting Father — the Beloved is the begotten Son, not one of the angels He outranks.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-the-father-of-my-lord'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 17:5 — *And now, O Father, glorify thou me with thine own self with the glory which I had with thee before the world was.* The glory the Most High holds (10:6) is the glory the Son shared before His descent and asks back after it.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-the-father-of-my-lord'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=17 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 30:4 — *Who hath ascended up into heaven, or descended? who hath gathered the wind in his fists? who hath bound the waters in a garment? who hath established all the ends of the earth? what is his name, and what is his son''s name, if thou canst tell?* The descent commanded in 10:8 answers Agur''s ancient riddle: the Most High has a Son who descends.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-the-father-of-my-lord'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=30 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-10-transformed-unknown
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 2:8 — *Which none of the princes of this world knew: for had they known it, they would not have crucified Yahuah (Lord) of glory.* Exactly the Ascension''s logic: the Beloved was so transformed (10:11) that the rulers did not know Him — had they known, they would not have crucified Him.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-transformed-unknown'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=2 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Philippians 2:7 — *But made himself of no reputation, and took upon him the form of a servant, and was made in the likeness of men:* The command to become "like unto the likeness" of each rank (10:9) is the self-emptying Paul preaches — the Formed Son took the servant''s form.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-transformed-unknown'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 53:2 — *For he shall grow up before him as a tender plant, and as a root out of a dry ground: he hath no form nor comeliness; and when we shall see him, there is no beauty that we should desire him.* The veiled "form" through the heavens (10:10) is the same hidden comeliness the prophet foresaw on earth.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-transformed-unknown'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The One unknown to the angels (10:11) is the Word veiled in flesh, His glory beheld only by those given eyes.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-transformed-unknown'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-10-none-beside-us
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 45:5 — *I am Yahuah (LORD), and there is none else, there is no Elohim (God) beside me: I girded thee, though thou hast not known me:* The boast of the rebel powers (10:13) is a theft of Yahuah''s own exclusive confession — His alone to make, blasphemy in their mouths.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-none-beside-us'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 45:21 — *Tell ye, and bring them near; yea, let them take counsel together: who hath declared this from ancient time? who hath told it from that time? have not I Yahuah (LORD)? and there is no Elohim (God) else beside me; a just Elohim (God) and a Saviour; there is none beside me.* The gods who say "there is none beside us" (10:13) counterfeit the Saviour''s own word — and so are marked for the judgment the Beloved is sent to bring.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-none-beside-us'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-10-exalted-right-hand
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Philippians 2:9 — *Wherefore Elohim (God) also hath highly exalted him, and given him a name which is above every name:* The ascent "in glory" to sit at the right hand (10:14) is the exaltation Paul names — granted BY the Father after the descent, the Formed-Son order intact.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-exalted-right-hand'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Philippians 2:10 — *That at the name of Yahusha (Jesus) every knee should bow, of things in heaven, and things in earth, and things under the earth;* The princes and powers worshipping the returned Beloved (10:15) are the knees in heaven, earth, and under the earth that bow at His exalted name.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-exalted-right-hand'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:3 — *Who being the brightness of his glory, and the express image of his person, and upholding all things by the word of his power, when he had by himself purged our sins, sat down on the right hand of the Majesty on high;* The seating "on My right hand" (10:14) is the same right hand of the Majesty — the Son enthroned beside, not over, the Father.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-exalted-right-hand'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 1:6 — *And again, when he bringeth in the firstbegotten into the world, he saith, And let all the angels of Elohim (God) worship him.* The powers'' worship (10:15) is by the Father''s word — the firstbegotten is worshipped at the Most High''s command, never by self-seizure.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-exalted-right-hand'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-10-descent-through-seven-heavens
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 4:9 — *(Now that he ascended, what is it but that he also descended first into the lower parts of the earth?* The Lord going forth from the seventh heaven downward (10:17) is the descent "first into the lower parts" Paul declares of the one Lord.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-descent-through-seven-heavens'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 4:10 — *He that descended is the same also that ascended up far above all heavens, that he might fill all things.)* The Descender of 10:18 IS the Ascender — one Lord through all the heavens, exactly as the Vision shows.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-descent-through-seven-heavens'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Timothy 3:16 — *And without controversy great is the mystery of godliness: Elohim (God) was manifest in the flesh, justified in the Spirit, seen of angels, preached unto the Gentiles, believed on in the world, received up into glory.* The veiled passage past the gates so as not to be recognized (10:24) is the mystery of godliness — manifested, seen of angels, received up into glory.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-descent-through-seven-heavens'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Corinthians 12:2 — *I knew a man in Messiah (Christ) above fourteen years ago, (whether in the body, I cannot tell; or whether out of the body, I cannot tell: Elohim (God) knoweth;) such an one caught up to the third heaven.* Isaiah''s heaven-by-heaven sight of his Lord (10:17) is the same order of ascent-vision Paul was granted, caught up through the heavens.'
  FROM cross_reference_threads t, cross_references x, _session403_asci10_lookup sv, _session403_asci10_lookup tv
 WHERE t.slug='ascension-isaiah-10-descent-through-seven-heavens'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=10 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

