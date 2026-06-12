-- ----- fragment: minion_2adameve_04.sql (session253 2-adam-eve 4) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae4 (view _session253_2ae4_lookup). Sort band base 66075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae4_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-4-hideous-form-unmasked
  ('adam-eve-conflict', '2-adam-eve', 4, 1, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The hideous form Adam is made to see is the unmasking of the old serpent whose whole trade is deceiving the world.'),
  ('adam-eve-conflict', '2-adam-eve', 4, 1, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* Messiah names the same liar-from-the-beginning whom Yahuah here orders to show himself plainly to Adam.'),
  ('adam-eve-conflict', '2-adam-eve', 4, 3, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The one who made Adam fall from brightness into darkness is the very work the Son was manifested to destroy.'),
  -- thread: 2-adam-eve-4-can-elohim-be-black
  ('adam-eve-conflict', '2-adam-eve', 4, 4, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The devil who once *said of himself that he is Elohim* is the same transformer Paul warns of; Yahuah unmasks the very disguise.'),
  ('adam-eve-conflict', '2-adam-eve', 4, 4, 'canon', '2-corinthians', 11, 3, 'free', E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* The subtle claim to be Elohim that Yahuah here exposes is the same beguiling that took Eve in Eden.'),
  ('adam-eve-conflict', '2-adam-eve', 4, 4, 'canon', 'genesis', 3, 13, 'free', E'Genesis 3:13 — *And Yahuah Elohim (the LORD God) said unto the woman, What is this that thou hast done? And the woman said, The serpent beguiled me, and I did eat.* Yahuah''s questions to Adam answer the very lie by which the serpent had beguiled Eve to eat.'),
  ('adam-eve-conflict', '2-adam-eve', 4, 4, 'canon', 'isaiah', 14, 12, 'free', E'Isaiah 14:12 — *How art thou fallen from heaven, O Lucifer, son of the morning! how art thou cut down to the ground, which didst weaken the nations!* The pretender who claims to be Elohim is the fallen son of the morning, cut down and now shown to Adam in his hideous form.'),
  -- thread: 2-adam-eve-4-bound-in-the-air
  ('adam-eve-conflict', '2-adam-eve', 4, 5, 'canon', 'revelation', 20, 2, 'free', E'Revelation 20:2 — *And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years,* The enemy Adam beholds *bound in thy presence, in the air* is the same dragon laid hold of and chained at the end.'),
  ('adam-eve-conflict', '2-adam-eve', 4, 5, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The charge *be not afraid of him* rests on the seed-promise that Yahuah will bruise this Satan underfoot.'),
  ('adam-eve-conflict', '2-adam-eve', 4, 5, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* Adam''s order to *beware of him, in whatever he may do to thee* is Peter''s same vigilance against the prowling adversary.'),
  ('adam-eve-conflict', '2-adam-eve', 4, 5, 'jubilees', 'jubilees', 10, 11, 'extras', E'Jubilees 10:11 — *And we did according to all His words: all the malignant evil ones we bound in the place of condemnation, and a tenth part of them we left that they might be subject before Satan on the earth.* The devil shown to Adam *bound... unable to flee away* belongs to the same binding the angels carried out in the primeval history.'),
  -- thread: 2-adam-eve-4-word-comforts-cave-of-treasures
  ('adam-eve-conflict', '2-adam-eve', 4, 6, 'canon', 'john', 14, 18, 'free', E'John 14:18 — *I will not leave you comfortless: I will come to you.* The Word who *strengthened* Adam and *comforted* his heart is the same Logos who promises His own He will not leave comfortless.'),
  ('adam-eve-conflict', '2-adam-eve', 4, 6, 'canon', 'isaiah', 41, 10, 'free', E'Isaiah 41:10 — *Fear thou not; for I am with thee: be not dismayed; for I am thy Elohim (God): I will strengthen thee; yea, I will help thee; yea, I will uphold thee with the right hand of my righteousness.* Yahuah''s strengthening of Adam after the assault is the same covenant assurance He gives His people not to fear.'),
  ('adam-eve-conflict', '2-adam-eve', 4, 8, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Adam''s worship before Yahuah for his deliverance is the first calling on the Name, kept down the holy line of Seth.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae4_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae4_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-4-hideous-form-unmasked',
       E'Satan shown in his own hideous form',
       E'Yahuah strips the disguise off the deceiver and makes Adam look him in the face: *THEN Elohim (God) ordered Satan to show himself to Adam plainly, in his own hideous form.* (2 Adam & Eve 4:1), *And Elohim (God) said to Adam, ''Look at this devil, and at his hideous look, and know that he it is who made thee fall from brightness into darkness, from peace and rest to toil and misery.* (2 Adam & Eve 4:3). It ain''t new — this is the old serpent of the garden unmasked. From the first day outside Eden he is named for what he is: *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* (Revelation 12:9). Messiah declares his nature with the same plainness — *Ye are of your father the devil... He was a murderer from the beginning, and abode not in the truth, because there is no truth in him.* (John 8:44). And the reason the Son of Elohim came is the destruction of this very enemy: *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* (1 John 3:8).',
       sv.verse_id, ev.verse_id, 'extras', 66075
  FROM _session253_2ae4_lookup sv, _session253_2ae4_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=4 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-4-can-elohim-be-black',
       E'The false claim to be Elohim exposed',
       E'Yahuah dismantles the lie by which the serpent first seduced Eve — that he speaks for or as Elohim: *And look, 0 Adam, at him, who said of himself that he is Elohim (God)! Can Elohim (God) be black? Would Elohim (God) take the form of a woman? Is there any one stronger than Elohim (God)? And can He be overpowered?* (2 Adam & Eve 4:4). This is the deceiver''s signature method — transformation, the lie dressed as light: *And no marvel; for Satan himself is transformed into an angel of light.* (2 Corinthians 11:14). It is the same subtlety that took Eve in the garden: *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* (2 Corinthians 11:3) — for the woman confessed *The serpent beguiled me, and I did eat* (Genesis 3:13). The lie has a name and a beginning in heaven''s own record: *How art thou fallen from heaven, O Lucifer, son of the morning! how art thou cut down to the ground, which didst weaken the nations!* (Isaiah 14:12).',
       sv.verse_id, ev.verse_id, 'extras', 66078
  FROM _session253_2ae4_lookup sv, _session253_2ae4_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=4 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-4-bound-in-the-air',
       E'Behold him bound — fear him not',
       E'Adam is shown the enemy not loosed but bound and powerless, and is charged to fear him no longer: *"See, then, 0 Adam, and behold him bound in thy presence, in the air, unable to flee away! Therefore, I say unto thee, be not afraid of him; henceforth take care, and beware of him, in whatever he may do to thee."* (2 Adam & Eve 4:5). This is the seed-war''s whole arc previewed on the first day outside Eden — the dragon is destined to be seized and chained: *And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years,* (Revelation 20:2). The crushing was already promised at the gate: *And the Elohim (God) of peace shall bruise Satan under your feet shortly...* (Romans 16:20). Yet Adam is told to *beware of him*, for the bound adversary still prowls: *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* (1 Peter 5:8). The chains prepared for him are the same the primeval record knows — *all the malignant evil ones we bound in the place of condemnation, and a tenth part of them we left that they might be subject before Satan on the earth.* (Jubilees 10:11).',
       sv.verse_id, ev.verse_id, 'extras', 66081
  FROM _session253_2ae4_lookup sv, _session253_2ae4_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=4 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-4-word-comforts-cave-of-treasures',
       E'The Word strengthens Adam and quells the lust',
       E'Having driven the deceiver off, the Word of Elohim Himself strengthens and comforts Adam, names the Cave of Treasures, and quells the disordered passion stirred by the assault: *Then Elohim (God) drove Satan away from before Adam, whom He strengthened, and whose heart He comforted, saying to him, "Go down to the Cave of Treasures, and separate not thyself from Eve; I will quell in you all animal lust."* (2 Adam & Eve 4:6), *Then Adam worshipped before Yahuah (Lord), for having delivered him, and for having layed his passions.* (2 Adam & Eve 4:8). The comforting voice that comes to the man is the Logos who will not abandon His own — *I will not leave you comfortless: I will come to you.* (John 14:18) — the very promise Yahuah keeps from the first day outside the garden: *Fear thou not; for I am with thee: be not dismayed; for I am thy Elohim (God): I will strengthen thee...* (Isaiah 41:10). And Adam''s worship and calling on his Deliverer is the worship the holy seed will carry down the line of Seth: *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* (Genesis 4:26).',
       sv.verse_id, ev.verse_id, 'extras', 66084
  FROM _session253_2ae4_lookup sv, _session253_2ae4_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=4 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-4-hideous-form-unmasked
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The hideous form Adam is made to see is the unmasking of the old serpent whose whole trade is deceiving the world.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae4_lookup sv, _session253_2ae4_lookup tv
 WHERE t.slug='2-adam-eve-4-hideous-form-unmasked'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* Messiah names the same liar-from-the-beginning whom Yahuah here orders to show himself plainly to Adam.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae4_lookup sv, _session253_2ae4_lookup tv
 WHERE t.slug='2-adam-eve-4-hideous-form-unmasked'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The one who made Adam fall from brightness into darkness is the very work the Son was manifested to destroy.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae4_lookup sv, _session253_2ae4_lookup tv
 WHERE t.slug='2-adam-eve-4-hideous-form-unmasked'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-4-can-elohim-be-black
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The devil who once *said of himself that he is Elohim* is the same transformer Paul warns of; Yahuah unmasks the very disguise.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae4_lookup sv, _session253_2ae4_lookup tv
 WHERE t.slug='2-adam-eve-4-can-elohim-be-black'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* The subtle claim to be Elohim that Yahuah here exposes is the same beguiling that took Eve in Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae4_lookup sv, _session253_2ae4_lookup tv
 WHERE t.slug='2-adam-eve-4-can-elohim-be-black'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:13 — *And Yahuah Elohim (the LORD God) said unto the woman, What is this that thou hast done? And the woman said, The serpent beguiled me, and I did eat.* Yahuah''s questions to Adam answer the very lie by which the serpent had beguiled Eve to eat.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae4_lookup sv, _session253_2ae4_lookup tv
 WHERE t.slug='2-adam-eve-4-can-elohim-be-black'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 14:12 — *How art thou fallen from heaven, O Lucifer, son of the morning! how art thou cut down to the ground, which didst weaken the nations!* The pretender who claims to be Elohim is the fallen son of the morning, cut down and now shown to Adam in his hideous form.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae4_lookup sv, _session253_2ae4_lookup tv
 WHERE t.slug='2-adam-eve-4-can-elohim-be-black'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-4-bound-in-the-air
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 20:2 — *And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years,* The enemy Adam beholds *bound in thy presence, in the air* is the same dragon laid hold of and chained at the end.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae4_lookup sv, _session253_2ae4_lookup tv
 WHERE t.slug='2-adam-eve-4-bound-in-the-air'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The charge *be not afraid of him* rests on the seed-promise that Yahuah will bruise this Satan underfoot.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae4_lookup sv, _session253_2ae4_lookup tv
 WHERE t.slug='2-adam-eve-4-bound-in-the-air'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* Adam''s order to *beware of him, in whatever he may do to thee* is Peter''s same vigilance against the prowling adversary.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae4_lookup sv, _session253_2ae4_lookup tv
 WHERE t.slug='2-adam-eve-4-bound-in-the-air'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 10:11 — *And we did according to all His words: all the malignant evil ones we bound in the place of condemnation, and a tenth part of them we left that they might be subject before Satan on the earth.* The devil shown to Adam *bound... unable to flee away* belongs to the same binding the angels carried out in the primeval history.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae4_lookup sv, _session253_2ae4_lookup tv
 WHERE t.slug='2-adam-eve-4-bound-in-the-air'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-4-word-comforts-cave-of-treasures
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 14:18 — *I will not leave you comfortless: I will come to you.* The Word who *strengthened* Adam and *comforted* his heart is the same Logos who promises His own He will not leave comfortless.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae4_lookup sv, _session253_2ae4_lookup tv
 WHERE t.slug='2-adam-eve-4-word-comforts-cave-of-treasures'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 41:10 — *Fear thou not; for I am with thee: be not dismayed; for I am thy Elohim (God): I will strengthen thee; yea, I will help thee; yea, I will uphold thee with the right hand of my righteousness.* Yahuah''s strengthening of Adam after the assault is the same covenant assurance He gives His people not to fear.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae4_lookup sv, _session253_2ae4_lookup tv
 WHERE t.slug='2-adam-eve-4-word-comforts-cave-of-treasures'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=41 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Adam''s worship before Yahuah for his deliverance is the first calling on the Name, kept down the holy line of Seth.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae4_lookup sv, _session253_2ae4_lookup tv
 WHERE t.slug='2-adam-eve-4-word-comforts-cave-of-treasures'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

