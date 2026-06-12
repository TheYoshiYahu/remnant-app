-- ----- fragment: minion_2adameve_08.sql (session253 2-adam-eve 8) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae8 (view _session253_2ae8_lookup). Sort band base 66175, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae8_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-8-keep-the-commandment
  ('adam-eve-conflict', '2-adam-eve', 8, 8, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The very names Adam binds the commandment to — Seth, then Enos — are the line on whom the calling on the Name begins.'),
  ('adam-eve-conflict', '2-adam-eve', 8, 8, 'canon', 'genesis', 5, 3, 'free', E'Genesis 5:3 — *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth.* The genealogy of the kept seed begins exactly where Adam hands down the commandment — through Seth, in Adam''s own likeness.'),
  ('adam-eve-conflict', '2-adam-eve', 8, 7, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Adam''s warning against Satan''s *apparitions in which he will show himself* is the same deceiver who masks himself as light.'),
  ('adam-eve-conflict', '2-adam-eve', 8, 7, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* Adam''s charge not to hearken to Satan is the same sober vigilance against the adversary who prowls to destroy.'),
  -- thread: 2-adam-eve-8-gold-incense-myrrh
  ('adam-eve-conflict', '2-adam-eve', 8, 17, 'canon', 'matthew', 2, 11, 'free', E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The three treasures Adam preserved for a sign are the three gifts the magi lay before the child Messiah.'),
  ('adam-eve-conflict', '2-adam-eve', 8, 17, 'canon', '1-peter', 1, 20, 'free', E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you.* The Saviour for whom Adam kept the gifts was already foreordained, awaiting His manifestation in the fulness of time.'),
  ('adam-eve-conflict', '2-adam-eve', 8, 17, 'canon', 'galatians', 4, 4, 'free', E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law.* The *days that are coming* when the treasures are offered is the fulness of time when the Son is sent forth.'),
  -- thread: 2-adam-eve-8-flood-eight-souls
  ('adam-eve-conflict', '2-adam-eve', 8, 10, 'canon', '1-peter', 3, 20, 'free', E'1 Peter 3:20 — *Which sometime were disobedient, when once the longsuffering of Elohim (God) waited in the days of Noah, while the ark was a preparing, wherein few, that is, eight souls were saved by water.* Adam''s *only eight souls* left out from the flood are the eight the apostle numbers saved in the ark.'),
  ('adam-eve-conflict', '2-adam-eve', 8, 11, 'canon', 'genesis', 7, 13, 'free', E'Genesis 7:13 — *In the selfsame day entered Noah, and Shem, and Ham, and Japheth, the sons of Noah, and Noah''s wife, and the three wives of his sons with them, into the ark.* The very eight whom the flood would leave out, to bear Adam''s body, are named at the door of the ark.'),
  ('adam-eve-conflict', '2-adam-eve', 8, 10, 'canon', 'genesis', 6, 7, 'free', E'Genesis 6:7 — *And Yahuah (LORD) said, I will destroy man whom I have created from the face of the earth; both man, and beast, and the creeping thing, and the fowls of the air; for it repenteth me that I have made them.* The flood Adam foretells overwhelming all creatures is the very judgment Yahuah decrees against the corrupted earth.'),
  -- thread: 2-adam-eve-8-word-made-man
  ('adam-eve-conflict', '2-adam-eve', 8, 18, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The *Word of Elohim made man* whom Adam awaits is the eternal Logos who was Elohim from the beginning.'),
  ('adam-eve-conflict', '2-adam-eve', 8, 18, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* Adam''s *Word of Elohim, made man* is exactly the Word made flesh who dwelt among us.'),
  ('adam-eve-conflict', '2-adam-eve', 8, 18, 'canon', 'hebrews', 1, 2, 'free', E'Hebrews 1:2 — *Hath in these last days spoken unto us by his Son, whom he hath appointed heir of all things, by whom also he made the worlds.* The incense token of His *being Elohim of heaven and earth* answers the Son by whom the worlds were made.'),
  ('adam-eve-conflict', '2-adam-eve', 8, 19, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The gold''s token of *His overcoming Satan, and all our foes* is the promised bruising of Satan under foot.'),
  -- thread: 2-adam-eve-8-sever-seth-from-cain
  ('adam-eve-conflict', '2-adam-eve', 8, 15, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The command to sever Seth''s seed from Cain''s is the keeping of the enmity between the two seeds set from the first promise.'),
  ('adam-eve-conflict', '2-adam-eve', 8, 15, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Adam keeps his line from *Cain''s children* because Cain is of the wicked one — the seed of the serpent.'),
  ('adam-eve-conflict', '2-adam-eve', 8, 15, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The very mingling Adam forbids — Seth''s line coming near Cain''s — is the corruption that brings on the flood when the lines mix.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae8_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae8_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-8-keep-the-commandment',
       E'Keep the commandment — handed down the holy line',
       E'Dying Adam charges Seth, *"to keep innocency, to be pure and just, and trusting in Elohim (God); and lean not to the discourses of Satan, nor to the apparitions in which he will show himself to thee"* (2 Adam and Eve 8:7), and binds the word to the generations: *"keep the commandments that I give thee this day; then give the same to thy son Enos; and let Enos give it to his son Cainan"* (2 Adam and Eve 8:8). It ain''t new — the way of Yahuah is kept from the first father, before Sinai, by a faithful handing-down. So *"to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD)"* (Genesis 4:26), and the line is the very seed-list Adam names: *"And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth"* (Genesis 5:3). And the warning against Satan''s *apparitions* is the apostle''s: *"And no marvel; for Satan himself is transformed into an angel of light"* (2 Corinthians 11:14), *"Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour"* (1 Peter 5:8).',
       sv.verse_id, ev.verse_id, 'extras', 66175
  FROM _session253_2ae8_lookup sv, _session253_2ae8_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=7
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=8 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-8-gold-incense-myrrh',
       E'Gold, incense, and myrrh — kept against the Saviour''s coming',
       E'Adam commands his body wound *"with myrrh, aloes, and cassia"* (2 Adam and Eve 8:9) and charges Seth and Eve, *"Preserve this gold, this incense, and this myrrh, that Elohim (God) has given us for a sign"* (2 Adam and Eve 8:17), to be carried through the flood and laid up in the midst of the earth until the Saviour comes. It ain''t new — the magi''s treasures are the very treasures Adam kept: *"And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh"* (Matthew 2:11). The gift was foreordained before the foundation: *"Who verily was foreordained before the foundation of the world, but was manifest in these last times for you"* (1 Peter 1:20), kept till *"when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law"* (Galatians 4:4).',
       sv.verse_id, ev.verse_id, 'extras', 66178
  FROM _session253_2ae8_lookup sv, _session253_2ae8_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=9
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=8 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-8-flood-eight-souls',
       E'The flood foretold — eight souls and Adam''s body in the ark',
       E'Adam prophesies the deluge: *"hereafter shall a flood come and overwhelm all creatures, and leave out only eight souls"* (2 Adam and Eve 8:10), and that his body be borne in a ship *"until the flood has been assuaged, and they come out of the ship"* (2 Adam and Eve 8:11). It ain''t new — the same eight are named at the ark''s door: *"In the selfsame day entered Noah, and Shem, and Ham, and Japheth, the sons of Noah, and Noah''s wife, and the three wives of his sons with them, into the ark"* (Genesis 7:13), and counted by the apostle: *"the longsuffering of Elohim (God) waited in the days of Noah, while the ark was a preparing, wherein few, that is, eight souls were saved by water"* (1 Peter 3:20). The judgment Adam sees is Yahuah''s: *"And GOD saw that the wickedness of man was great in the earth... I will destroy man whom I have created from the face of the earth"* (Genesis 6:5,7) — yet the seed and the promise are carried through the waters.',
       sv.verse_id, ev.verse_id, 'extras', 66181
  FROM _session253_2ae8_lookup sv, _session253_2ae8_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=10
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=8 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-8-word-made-man',
       E'The Word of Elohim made man — King, Elohim, and His passion',
       E'Adam unveils the mystery of the gifts: they are kept *"until the Word of Elohim (God), made man shall come; when kings shall take them, and shall offer to Him, gold in token of His being King; incense, in token of His being Elohim (God) of heaven and earth; and myrrh, in token of His passion"* (2 Adam and Eve 8:18), and again, *"gold also, as a token of His overcoming Satan... incense as a token that He will rise from the dead... and myrrh, in token that He will drink bitter gall"* (2 Adam and Eve 8:19). It ain''t new — the Word made man is the Logos: *"In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)"* (John 1:1), *"And the Word was made flesh, and dwelt among us"* (John 1:14), the Son *"by whom also he made the worlds"* (Hebrews 1:2). And the *overcoming of Satan* foretold in the gold is the seed-promise crushing the serpent: *"And the Elohim (God) of peace shall bruise Satan under your feet shortly"* (Romans 16:20).',
       sv.verse_id, ev.verse_id, 'extras', 66184
  FROM _session253_2ae8_lookup sv, _session253_2ae8_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=18
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=8 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-8-sever-seth-from-cain',
       E'Sever Seth''s line from Cain''s — the two seed-lines',
       E'Adam''s last command guards the seed: *"sever thy children and thy children''s children from Cain''s children; do not let them ever mix with those, nor come near them either in their words or in their deeds"* (2 Adam and Eve 8:15). It ain''t new — this is the seed-war of the first promise, the two lines kept apart: *"And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel"* (Genesis 3:15). Cain is marked of the wicked one — *"Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous"* (1 John 3:12) — and when the lines later mingle the flood follows: *"That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose"* (Genesis 6:2). It is not race but the covenant seed kept: election precedes confession.',
       sv.verse_id, ev.verse_id, 'extras', 66187
  FROM _session253_2ae8_lookup sv, _session253_2ae8_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=15
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=8 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-8-keep-the-commandment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The very names Adam binds the commandment to — Seth, then Enos — are the line on whom the calling on the Name begins.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-keep-the-commandment'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 5:3 — *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth.* The genealogy of the kept seed begins exactly where Adam hands down the commandment — through Seth, in Adam''s own likeness.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-keep-the-commandment'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* Adam''s warning against Satan''s *apparitions in which he will show himself* is the same deceiver who masks himself as light.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-keep-the-commandment'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour.* Adam''s charge not to hearken to Satan is the same sober vigilance against the adversary who prowls to destroy.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-keep-the-commandment'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-8-gold-incense-myrrh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The three treasures Adam preserved for a sign are the three gifts the magi lay before the child Messiah.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-gold-incense-myrrh'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you.* The Saviour for whom Adam kept the gifts was already foreordained, awaiting His manifestation in the fulness of time.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-gold-incense-myrrh'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law.* The *days that are coming* when the treasures are offered is the fulness of time when the Son is sent forth.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-gold-incense-myrrh'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-8-flood-eight-souls
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Peter 3:20 — *Which sometime were disobedient, when once the longsuffering of Elohim (God) waited in the days of Noah, while the ark was a preparing, wherein few, that is, eight souls were saved by water.* Adam''s *only eight souls* left out from the flood are the eight the apostle numbers saved in the ark.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-flood-eight-souls'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=3 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 7:13 — *In the selfsame day entered Noah, and Shem, and Ham, and Japheth, the sons of Noah, and Noah''s wife, and the three wives of his sons with them, into the ark.* The very eight whom the flood would leave out, to bear Adam''s body, are named at the door of the ark.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-flood-eight-souls'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 6:7 — *And Yahuah (LORD) said, I will destroy man whom I have created from the face of the earth; both man, and beast, and the creeping thing, and the fowls of the air; for it repenteth me that I have made them.* The flood Adam foretells overwhelming all creatures is the very judgment Yahuah decrees against the corrupted earth.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-flood-eight-souls'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-8-word-made-man
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The *Word of Elohim made man* whom Adam awaits is the eternal Logos who was Elohim from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-word-made-man'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* Adam''s *Word of Elohim, made man* is exactly the Word made flesh who dwelt among us.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-word-made-man'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:2 — *Hath in these last days spoken unto us by his Son, whom he hath appointed heir of all things, by whom also he made the worlds.* The incense token of His *being Elohim of heaven and earth* answers the Son by whom the worlds were made.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-word-made-man'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The gold''s token of *His overcoming Satan, and all our foes* is the promised bruising of Satan under foot.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-word-made-man'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-8-sever-seth-from-cain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The command to sever Seth''s seed from Cain''s is the keeping of the enmity between the two seeds set from the first promise.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-sever-seth-from-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Adam keeps his line from *Cain''s children* because Cain is of the wicked one — the seed of the serpent.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-sever-seth-from-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The very mingling Adam forbids — Seth''s line coming near Cain''s — is the corruption that brings on the flood when the lines mix.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae8_lookup sv, _session253_2ae8_lookup tv
 WHERE t.slug='2-adam-eve-8-sever-seth-from-cain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=8 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

