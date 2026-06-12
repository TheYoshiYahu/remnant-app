-- ----- fragment: minion_1adameve_27.sql (session253 1-adam-eve 27) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch27. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae27 (view _session253_1ae27_lookup). Sort band base 64650, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae27_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-27-angel-of-light-apparition
  ('adam-eve-conflict', '1-adam-eve', 27, 3, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The very disguise Sha''ul warns of is the apparition Satan raises at the cave in 1 Adam and Eve 27:3-4 to be worshipped as heaven.'),
  ('adam-eve-conflict', '1-adam-eve', 27, 2, 'canon', 'isaiah', 14, 13, 'free', E'Isaiah 14:13 — *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation, in the sides of the north.* The throne Satan sets at the cave''s mouth in 1 Adam and Eve 27:2-3 is the same exalted seat of his first rebellion.'),
  ('adam-eve-conflict', '1-adam-eve', 27, 4, 'canon', 'john', 1, 5, 'free', E'John 1:5 — *And the light shineth in darkness; and the darkness comprehended it not.* Satan''s counterfeit glistening in 1 Adam and Eve 27:4 only apes the true Light that the darkness can neither seize nor mimic at the root.'),
  -- thread: 1-adam-eve-27-try-the-spirits-shema
  ('adam-eve-conflict', '1-adam-eve', 27, 10, 'canon', 'deuteronomy', 6, 4, 'free', E'Deuteronomy 6:4 — *Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD).* Adam''s question whether there is *another god besides You* in 1 Adam and Eve 27:10 is the Shema confessed at the cave generations before it was spoken to Israel.'),
  ('adam-eve-conflict', '1-adam-eve', 27, 8, 'canon', '1-john', 4, 1, 'free', E'1 John 4:1 — *Beloved, believe not every spirit, but try the spirits whether they are of Elohim (God): because many false prophets are gone out into the world.* Adam''s refusal to trust the host until they prove their sending in 1 Adam and Eve 27:8 is this same proving of the spirits.'),
  ('adam-eve-conflict', '1-adam-eve', 27, 11, 'canon', 'galatians', 1, 8, 'free', E'Galatians 1:8 — *But though we, or an angel from heaven, preach any other gospel unto you than that which we have preached unto you, let him be accursed.* Adam testing whether the shining host is truly *sent by you* in 1 Adam and Eve 27:11 enacts the warning that even an angel of light may bring a curse.'),
  -- thread: 1-adam-eve-27-serpent-first-the-seed-war
  ('adam-eve-conflict', '1-adam-eve', 27, 12, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The angel''s word that Satan *was hidden in the serpent* and now strikes again in 1 Adam and Eve 27:12 is the seed-war of Eden continuing against the woman''s line.'),
  ('adam-eve-conflict', '1-adam-eve', 27, 12, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The one who *deceived you at first* in 1 Adam and Eve 27:12 is named here the liar and murderer from the beginning.'),
  ('adam-eve-conflict', '1-adam-eve', 27, 12, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The serpent of Adam''s first fall and the angel-of-light at the cave in 1 Adam and Eve 27:12 are one and the same old serpent who deceives the whole world.'),
  ('adam-eve-conflict', '1-adam-eve', 27, 13, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The angel stripping Satan to his *own hideous form* in 1 Adam and Eve 27:13 foreshadows the Son manifested to undo his works.'),
  -- thread: 1-adam-eve-27-fallen-from-heaven-hideous-form
  ('adam-eve-conflict', '1-adam-eve', 27, 14, 'canon', 'luke', 10, 18, 'free', E'Luke 10:18 — *And he said unto them, I beheld Satan as lightning fall from heaven.* The angel''s word that Satan''s hideous form is his *ever since Elohim (God) made him fall from heaven* in 1 Adam and Eve 27:14 is the very fall Messiah witnessed.'),
  ('adam-eve-conflict', '1-adam-eve', 27, 14, 'canon', 'isaiah', 14, 12, 'free', E'Isaiah 14:12 — *How art thou fallen from heaven, O Lucifer, son of the morning! how art thou cut down to the ground, which didst weaken the nations!* The shining angel-of-light counterfeit in 1 Adam and Eve 27:14 masks the morning-star already cast down from heaven.'),
  ('adam-eve-conflict', '1-adam-eve', 27, 14, 'enoch', '1-enoch', 54, 6, 'extras', E'1 Enoch 54:6 — *And Michael, and Gabriel, and Raphael, and Phanuel shall take hold of them on that great day, and cast them on that day into the burning furnace, that Yahuah (God) of Spirits may take vengeance on them for their unrighteousness in becoming subject to Satan and leading astray those who dwell on the earth.* The hosts Satan marshals in his deceit at the cave in 1 Adam and Eve 27:14 are the same who, subject to Satan and leading men astray, are sealed for the fiery judgment.'),
  -- thread: 1-adam-eve-27-fear-not-the-angel-guard
  ('adam-eve-conflict', '1-adam-eve', 27, 15, 'canon', 'psalms', 34, 7, 'free', E'Psalm 34:7 — *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them.* The angel who drives Satan away and bids them fear not in 1 Adam and Eve 27:15 is this delivering guard encamped round about those who fear Yahuah.'),
  ('adam-eve-conflict', '1-adam-eve', 27, 15, 'canon', 'hebrews', 1, 14, 'free', E'Hebrews 1:14 — *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* The true messenger sent to strengthen Adam and Eve in 1 Adam and Eve 27:15 is exactly such a ministering spirit serving the heirs of salvation.'),
  ('adam-eve-conflict', '1-adam-eve', 27, 16, 'canon', 'psalms', 91, 11, 'free', E'Psalm 91:11 — *For he shall give his angels charge over thee, to keep thee in all thy ways.* The angel given charge to guard the cave and depart only when the danger is gone in 1 Adam and Eve 27:15-16 fulfills this promised keeping.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae27_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae27_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-27-angel-of-light-apparition',
       E'Satan transformed into light at the cave''s mouth',
       E'Satan cannot enter where they pray, so he counterfeits heaven itself: *He then placed his throne near the mouth of the cave because he could not enter into it by reason of their prayers. And he shed light into the cave, until the cave glistened over Adam and Eve; while his hosts began to sing praises.* (1 Adam and Eve 27:3) — the lie engineered *that when Adam saw the light, he should think within himself that it was a heavenly light, and that Satan''s hosts were angels.* (1 Adam and Eve 27:4) It ain''t new: this is the same craft Sha''ul names — *And no marvel; for Satan himself is transformed into an angel of light.* (2 Corinthians 11:14) The throne lifted up in counterfeit glory is the old ambition of the fallen one — *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation, in the sides of the north.* (Isaiah 14:13) Yet against him stands the true Light no darkness can master — *And the light shineth in darkness; and the darkness comprehended it not.* (John 1:5)',
       sv.verse_id, ev.verse_id, 'extras', 64650
  FROM _session253_1ae27_lookup sv, _session253_1ae27_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=27 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=27 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-27-try-the-spirits-shema',
       E'Adam proves the spirits and confesses one Elohim',
       E'Adam will not bow on sight; he weighs the strange host: *If they were from Elohim (God), they would come into the cave with us, and would tell us why they were sent.* (1 Adam and Eve 27:8) Then he turns it into prayer, confessing there is no rival Maker: *O Yahuah (Lord), is there in the world another god besides You, who created angels and filled them with light, and sent them to keep us, who would come with them?* (1 Adam and Eve 27:10) This is the Shema kept before Sinai — *Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD).* (Deuteronomy 6:4) And it is the apostolic rule of discernment Adam already practices — *Beloved, believe not every spirit, but try the spirits whether they are of Elohim (God): because many false prophets are gone out into the world.* (1 John 4:1) Even an angel of heaven preaching another way is to be refused — *But though we, or an angel from heaven, preach any other gospel unto you than that which we have preached unto you, let him be accursed.* (Galatians 1:8)',
       sv.verse_id, ev.verse_id, 'extras', 64653
  FROM _session253_1ae27_lookup sv, _session253_1ae27_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=27 AND sv.verse_number=8
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=27 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-27-serpent-first-the-seed-war',
       E'The same deceiver, the same enmity: hidden first in the serpent',
       E'Yahuah answers Adam''s prayer with a true messenger who unmasks the lie and names the war from its first day: *This is Satan and his hosts; he wishes to deceive you as he deceived you at first. For the first time, he was hidden in the serpent; but this time he is come to you in the likeness of an angel of light.* (1 Adam and Eve 27:12) The serpent of the first deception is the very enmity Yahuah decreed — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15) John names the deceiver-from-the-beginning plainly — *Ye are of your father the devil... He was a murderer from the beginning, and abode not in the truth* (John 8:44) — and the Revelation seals the identity across the ages — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world.* (Revelation 12:9) For this the Son was manifested — *that he might destroy the works of the devil.* (1 John 3:8)',
       sv.verse_id, ev.verse_id, 'extras', 64656
  FROM _session253_1ae27_lookup sv, _session253_1ae27_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=27 AND sv.verse_number=12
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=27 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-27-fallen-from-heaven-hideous-form',
       E'The hideous form: Satan since the fall from heaven',
       E'The angel exposes why Satan must borrow a disguise at all: *This hideous form has been his ever since Elohim (God) made him fall from heaven. He could not have come near you in it; he therefore transformed himself into an angel of light.* (1 Adam and Eve 27:14) Messiah Himself testified to that casting down — *And he said unto them, I beheld Satan as lightning fall from heaven.* (Luke 10:18) — and the prophet mourns the morning-star''s ruin — *How art thou fallen from heaven, O Lucifer, son of the morning! how art thou cut down to the ground, which didst weaken the nations!* (Isaiah 14:12) The restored watchers'' witness keeps the same judgment: the rebel hosts *subject to Satan and leading astray those who dwell on the earth* are bound for the abyss (1 Enoch 54:6).',
       sv.verse_id, ev.verse_id, 'extras', 64659
  FROM _session253_1ae27_lookup sv, _session253_1ae27_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=27 AND sv.verse_number=14
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=27 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-27-fear-not-the-angel-guard',
       E'Fear not: the true angel drives Satan away and strengthens them',
       E'Mercy ends the scene — the true messenger seizes and banishes the deceiver, leaving a promise: *Then the angel drove away Satan and his hosts from Adam and Eve, and said to them, "Fear not; Elohim (God) who created you, will strengthen you."* (1 Adam and Eve 27:15) This is the ministering guard Yahuah keeps over His own — *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them.* (Psalm 34:7) — the very office of the heavenly servants — *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* (Hebrews 1:14) — and the charge of keeping promised against every snare — *For he shall give his angels charge over thee, to keep thee in all thy ways.* (Psalm 91:11) So Adam, who proved the false host and refused to bow, is kept by the true one.',
       sv.verse_id, ev.verse_id, 'extras', 64662
  FROM _session253_1ae27_lookup sv, _session253_1ae27_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=27 AND sv.verse_number=15
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=27 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-27-angel-of-light-apparition
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The very disguise Sha''ul warns of is the apparition Satan raises at the cave in 1 Adam and Eve 27:3-4 to be worshipped as heaven.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae27_lookup sv, _session253_1ae27_lookup tv
 WHERE t.slug='1-adam-eve-27-angel-of-light-apparition'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=27 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 14:13 — *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation, in the sides of the north.* The throne Satan sets at the cave''s mouth in 1 Adam and Eve 27:2-3 is the same exalted seat of his first rebellion.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae27_lookup sv, _session253_1ae27_lookup tv
 WHERE t.slug='1-adam-eve-27-angel-of-light-apparition'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=27 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 1:5 — *And the light shineth in darkness; and the darkness comprehended it not.* Satan''s counterfeit glistening in 1 Adam and Eve 27:4 only apes the true Light that the darkness can neither seize nor mimic at the root.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae27_lookup sv, _session253_1ae27_lookup tv
 WHERE t.slug='1-adam-eve-27-angel-of-light-apparition'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=27 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-27-try-the-spirits-shema
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 6:4 — *Hear, O Yashar''el (Israel): Yahuah Eloheinu (The LORD our God) is one Yahuah (LORD).* Adam''s question whether there is *another god besides You* in 1 Adam and Eve 27:10 is the Shema confessed at the cave generations before it was spoken to Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae27_lookup sv, _session253_1ae27_lookup tv
 WHERE t.slug='1-adam-eve-27-try-the-spirits-shema'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=27 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 4:1 — *Beloved, believe not every spirit, but try the spirits whether they are of Elohim (God): because many false prophets are gone out into the world.* Adam''s refusal to trust the host until they prove their sending in 1 Adam and Eve 27:8 is this same proving of the spirits.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae27_lookup sv, _session253_1ae27_lookup tv
 WHERE t.slug='1-adam-eve-27-try-the-spirits-shema'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=27 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Galatians 1:8 — *But though we, or an angel from heaven, preach any other gospel unto you than that which we have preached unto you, let him be accursed.* Adam testing whether the shining host is truly *sent by you* in 1 Adam and Eve 27:11 enacts the warning that even an angel of light may bring a curse.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae27_lookup sv, _session253_1ae27_lookup tv
 WHERE t.slug='1-adam-eve-27-try-the-spirits-shema'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=27 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-27-serpent-first-the-seed-war
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The angel''s word that Satan *was hidden in the serpent* and now strikes again in 1 Adam and Eve 27:12 is the seed-war of Eden continuing against the woman''s line.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae27_lookup sv, _session253_1ae27_lookup tv
 WHERE t.slug='1-adam-eve-27-serpent-first-the-seed-war'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=27 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The one who *deceived you at first* in 1 Adam and Eve 27:12 is named here the liar and murderer from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae27_lookup sv, _session253_1ae27_lookup tv
 WHERE t.slug='1-adam-eve-27-serpent-first-the-seed-war'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=27 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The serpent of Adam''s first fall and the angel-of-light at the cave in 1 Adam and Eve 27:12 are one and the same old serpent who deceives the whole world.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae27_lookup sv, _session253_1ae27_lookup tv
 WHERE t.slug='1-adam-eve-27-serpent-first-the-seed-war'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=27 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The angel stripping Satan to his *own hideous form* in 1 Adam and Eve 27:13 foreshadows the Son manifested to undo his works.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae27_lookup sv, _session253_1ae27_lookup tv
 WHERE t.slug='1-adam-eve-27-serpent-first-the-seed-war'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=27 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-27-fallen-from-heaven-hideous-form
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 10:18 — *And he said unto them, I beheld Satan as lightning fall from heaven.* The angel''s word that Satan''s hideous form is his *ever since Elohim (God) made him fall from heaven* in 1 Adam and Eve 27:14 is the very fall Messiah witnessed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae27_lookup sv, _session253_1ae27_lookup tv
 WHERE t.slug='1-adam-eve-27-fallen-from-heaven-hideous-form'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=27 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=10 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 14:12 — *How art thou fallen from heaven, O Lucifer, son of the morning! how art thou cut down to the ground, which didst weaken the nations!* The shining angel-of-light counterfeit in 1 Adam and Eve 27:14 masks the morning-star already cast down from heaven.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae27_lookup sv, _session253_1ae27_lookup tv
 WHERE t.slug='1-adam-eve-27-fallen-from-heaven-hideous-form'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=27 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 54:6 — *And Michael, and Gabriel, and Raphael, and Phanuel shall take hold of them on that great day, and cast them on that day into the burning furnace, that Yahuah (God) of Spirits may take vengeance on them for their unrighteousness in becoming subject to Satan and leading astray those who dwell on the earth.* The hosts Satan marshals in his deceit at the cave in 1 Adam and Eve 27:14 are the same who, subject to Satan and leading men astray, are sealed for the fiery judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae27_lookup sv, _session253_1ae27_lookup tv
 WHERE t.slug='1-adam-eve-27-fallen-from-heaven-hideous-form'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=27 AND sv.verse_number=14
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=54 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-27-fear-not-the-angel-guard
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 34:7 — *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them.* The angel who drives Satan away and bids them fear not in 1 Adam and Eve 27:15 is this delivering guard encamped round about those who fear Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae27_lookup sv, _session253_1ae27_lookup tv
 WHERE t.slug='1-adam-eve-27-fear-not-the-angel-guard'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=27 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 1:14 — *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* The true messenger sent to strengthen Adam and Eve in 1 Adam and Eve 27:15 is exactly such a ministering spirit serving the heirs of salvation.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae27_lookup sv, _session253_1ae27_lookup tv
 WHERE t.slug='1-adam-eve-27-fear-not-the-angel-guard'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=27 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 91:11 — *For he shall give his angels charge over thee, to keep thee in all thy ways.* The angel given charge to guard the cave and depart only when the danger is gone in 1 Adam and Eve 27:15-16 fulfills this promised keeping.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae27_lookup sv, _session253_1ae27_lookup tv
 WHERE t.slug='1-adam-eve-27-fear-not-the-angel-guard'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=27 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=91 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

