-- ----- fragment: minion_1adameve_51.sql (session253 1-adam-eve 51) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch51. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae51 (view _session253_1ae51_lookup). Sort band base 65250, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae51_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-51-word-binds-satan
  ('adam-eve-conflict', '1-adam-eve', 51, 4, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word who comes from heaven to bind Satan in 1 Adam and Eve 51:4 is the eternal Word who was with Elohim from the beginning.'),
  ('adam-eve-conflict', '1-adam-eve', 51, 4, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The same Word who comforts Adam in 1 Adam and Eve 51 would in the fulness of time take flesh to save the seed He here defends.'),
  ('adam-eve-conflict', '1-adam-eve', 51, 2, 'canon', 'hebrews', 1, 1, 'free', E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets,* The Word communing with Adam in 51:2 is the same Mighty One who spake to the fathers in every age.'),
  ('adam-eve-conflict', '1-adam-eve', 51, 4, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Binding Satan beside the skins in 51:4 is the first instalment of the promised crushing of the adversary under the seed''s feet.'),
  -- thread: 1-adam-eve-51-hidden-in-the-serpent
  ('adam-eve-conflict', '1-adam-eve', 51, 5, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The one hidden in the serpent against Adam in 51:5 is named in full as the world-deceiving dragon.'),
  ('adam-eve-conflict', '1-adam-eve', 51, 5, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The deceiver of 51:5 is the liar and murderer from the beginning exposed by Yahusha.'),
  ('adam-eve-conflict', '1-adam-eve', 51, 6, 'canon', '2-corinthians', 11, 3, 'free', E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* Satan''s promise of majesty and divinity in 51:6 is the same subtle beguiling of Eve that still threatens the saints.'),
  ('adam-eve-conflict', '1-adam-eve', 51, 5, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The serpent who deceived and stripped Adam in 51:5 is the one whose works the Son came to destroy.'),
  -- thread: 1-adam-eve-51-garment-of-light
  ('adam-eve-conflict', '1-adam-eve', 51, 5, 'canon', 'genesis', 3, 7, 'free', E'Genesis 3:7 — *And the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons.* The garment of light lost in 51:5 left the pair naked, sewing their own fig-leaf covering.'),
  ('adam-eve-conflict', '1-adam-eve', 51, 8, 'canon', 'genesis', 3, 21, 'free', E'Genesis 3:21 — *Unto Adam also and to his wife did Yahuah Elohim (the LORD God) make coats of skins, and clothed them.* The earthly sheep-skin garment Satan would destroy in 51:8 is the very coat of skins Yahuah made to clothe Adam and Eve.'),
  -- thread: 1-adam-eve-51-fallen-angel-of-light
  ('adam-eve-conflict', '1-adam-eve', 51, 6, 'canon', 'isaiah', 14, 12, 'free', E'Isaiah 14:12 — *How art thou fallen from heaven, O Lucifer, son of the morning! how art thou cut down to the ground, which didst weaken the nations!* The lost light and glory the Word asks after in 51:6 is the fall of the son of the morning.'),
  ('adam-eve-conflict', '1-adam-eve', 51, 7, 'canon', 'luke', 10, 18, 'free', E'Luke 10:18 — *And he said unto them, I beheld Satan as lightning fall from heaven.* The one now hideous and abominable among angels in 51:7 is the Satan Yahusha saw fall as lightning.'),
  ('adam-eve-conflict', '1-adam-eve', 51, 6, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The stolen beauty and false divinity exposed in 51:6 is the disguise of light by which Satan still deceives.'),
  ('adam-eve-conflict', '1-adam-eve', 51, 7, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* The adversary unmasked as Satan in 51:7 is the prowling devil the saints are warned to watch against.'),
  -- thread: 1-adam-eve-51-no-power-is-left
  ('adam-eve-conflict', '1-adam-eve', 51, 10, 'canon', 'colossians', 2, 15, 'free', E'Colossians 2:15 — *And having spoiled principalities and powers, he made a shew of them openly, triumphing over them in it.* Binding the enemy and showing his weakness openly to Adam in 51:10 foreshadows the cross''s open triumph over the powers.'),
  ('adam-eve-conflict', '1-adam-eve', 51, 10, 'canon', 'hebrews', 2, 14, 'free', E'Hebrews 2:14 — *Forasmuch then as the children are partakers of flesh and blood, he also himself likewise took part of the same; that through death he might destroy him that had the power of death, that is, the devil;* That no power is left with the bound Satan in 51:10 anticipates the Son destroying the devil through His own death.'),
  ('adam-eve-conflict', '1-adam-eve', 51, 11, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Releasing the now-powerless adversary in 51:11 keeps the long enmity going toward the promised bruising of the serpent''s head.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae51_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae51_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-51-word-binds-satan',
       E'The Word came from heaven and bound the adversary',
       E'Satan races to destroy the skin-coverings, but heaven moves first: *But as he was about to take them, the Word of Elohim (God) came from heaven, and bound him by the side of those skins until Adam and Eve came near him.* (1 Adam and Eve 51:4). The One who acts is the Word — the same Word who in the beginning spoke all things: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* (John 1:1), and who at last *was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* (John 1:14). It ain''t new — from the first days outside the garden the Word is the Mighty One who *spake in time past unto the fathers* (Hebrews 1:1), the Son *by whom also he made the worlds* (Hebrews 1:2). The promise to bruise the serpent is already being kept in deed: *And the Elohim (God) of peace shall bruise Satan under your feet shortly.* (Romans 16:20).',
       sv.verse_id, ev.verse_id, 'extras', 65250
  FROM _session253_1ae51_lookup sv, _session253_1ae51_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=51 AND sv.verse_number=2
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=51 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-51-hidden-in-the-serpent',
       E'This is he who was hidden in the serpent and deceived you',
       E'The Word names the adversary to his victims: *This is he who was hidden in the serpent, and who deceived you, and stripped you of the garment of light and glory in which you were.* (1 Adam and Eve 51:5) — *This is he who promised you majesty and divinity.* (1 Adam and Eve 51:6). It ain''t new: this is the seed-war of Eden carried outside the garden. The serpent who hid himself is unmasked in Revelation as *that old serpent, called the Devil, and Satan, which deceiveth the whole world* (Revelation 12:9); he is the one of whom Yahusha said *He was a murderer from the beginning, and abode not in the truth, because there is no truth in him* (John 8:44). His false promise of *majesty and divinity* is the same lie Paul warned of: *as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ)* (2 Corinthians 11:3). And the Son was manifested for just this: *that he might destroy the works of the devil* (1 John 3:8).',
       sv.verse_id, ev.verse_id, 'extras', 65253
  FROM _session253_1ae51_lookup sv, _session253_1ae51_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=51 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=51 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-51-garment-of-light',
       E'Stripped of the garment of light, clothed in skins',
       E'The Word recalls the theft and the mercy together: *stripped you of the garment of light and glory in which you were* (1 Adam and Eve 51:5), yet *he wished to take from you this earthly garment of sheep-skins, and to destroy it, and not let you be covered with it* (1 Adam and Eve 51:8). It ain''t new: when the deceit was done *the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons* (Genesis 3:7) — man''s own covering — but Yahuah Himself answered: *Unto Adam also and to his wife did Yahuah Elohim (the LORD God) make coats of skins, and clothed them* (Genesis 3:21). The very skins Satan now schemes to burn are the token of covenant mercy, a covering Yahuah gave and Yahuah defends.',
       sv.verse_id, ev.verse_id, 'extras', 65256
  FROM _session253_1ae51_lookup sv, _session253_1ae51_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=51 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=51 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-51-fallen-angel-of-light',
       E'Where is his light? — the fallen angel exposed',
       E'The Word turns the deceiver''s stolen splendour into a mirror: *Where, then, is the beauty that was on him? Where is his divinity? Where is his light? Where is the glory that rested on him?* (1 Adam and Eve 51:6) — *Now his figure is hideous; he is become abominable among angels; and he has come to be called Satan.* (1 Adam and Eve 51:7). It ain''t new: his fall was foretold, *How art thou fallen from heaven, O Lucifer, son of the morning! how art thou cut down to the ground, which didst weaken the nations!* (Isaiah 14:12), and Yahusha witnessed it, *I beheld Satan as lightning fall from heaven* (Luke 10:18). His masquerade of light still snares the unwary, for *Satan himself is transformed into an angel of light* (2 Corinthians 11:14); therefore *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour* (1 Peter 5:8).',
       sv.verse_id, ev.verse_id, 'extras', 65259
  FROM _session253_1ae51_lookup sv, _session253_1ae51_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=51 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=51 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-51-no-power-is-left',
       E'Bound and disarmed — no power is left with him',
       E'The lesson the Word teaches by binding the enemy: *See, I bound him until you came and saw him and beheld his weakness, that no power is left with him.* (1 Adam and Eve 51:10) — *And Elohim (God) released him from his bonds.* (1 Adam and Eve 51:11). It ain''t new: this open shaming of the enemy before the seed prefigures the cross, where the Mighty One *having spoiled principalities and powers, he made a shew of them openly, triumphing over them in it* (Colossians 2:15). For the Son took flesh *that through death he might destroy him that had the power of death, that is, the devil* (Hebrews 2:14) — the same purpose for which *the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (1 John 3:8). From the first days outside Eden, the seed''s victory over the bound and powerless adversary was already shown.',
       sv.verse_id, ev.verse_id, 'extras', 65262
  FROM _session253_1ae51_lookup sv, _session253_1ae51_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=51 AND sv.verse_number=10
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=51 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-51-word-binds-satan
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word who comes from heaven to bind Satan in 1 Adam and Eve 51:4 is the eternal Word who was with Elohim from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae51_lookup sv, _session253_1ae51_lookup tv
 WHERE t.slug='1-adam-eve-51-word-binds-satan'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=51 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The same Word who comforts Adam in 1 Adam and Eve 51 would in the fulness of time take flesh to save the seed He here defends.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae51_lookup sv, _session253_1ae51_lookup tv
 WHERE t.slug='1-adam-eve-51-word-binds-satan'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=51 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets,* The Word communing with Adam in 51:2 is the same Mighty One who spake to the fathers in every age.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae51_lookup sv, _session253_1ae51_lookup tv
 WHERE t.slug='1-adam-eve-51-word-binds-satan'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=51 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Binding Satan beside the skins in 51:4 is the first instalment of the promised crushing of the adversary under the seed''s feet.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae51_lookup sv, _session253_1ae51_lookup tv
 WHERE t.slug='1-adam-eve-51-word-binds-satan'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=51 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-51-hidden-in-the-serpent
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The one hidden in the serpent against Adam in 51:5 is named in full as the world-deceiving dragon.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae51_lookup sv, _session253_1ae51_lookup tv
 WHERE t.slug='1-adam-eve-51-hidden-in-the-serpent'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=51 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The deceiver of 51:5 is the liar and murderer from the beginning exposed by Yahusha.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae51_lookup sv, _session253_1ae51_lookup tv
 WHERE t.slug='1-adam-eve-51-hidden-in-the-serpent'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=51 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* Satan''s promise of majesty and divinity in 51:6 is the same subtle beguiling of Eve that still threatens the saints.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae51_lookup sv, _session253_1ae51_lookup tv
 WHERE t.slug='1-adam-eve-51-hidden-in-the-serpent'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=51 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The serpent who deceived and stripped Adam in 51:5 is the one whose works the Son came to destroy.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae51_lookup sv, _session253_1ae51_lookup tv
 WHERE t.slug='1-adam-eve-51-hidden-in-the-serpent'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=51 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-51-garment-of-light
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:7 — *And the eyes of them both were opened, and they knew that they were naked; and they sewed fig leaves together, and made themselves aprons.* The garment of light lost in 51:5 left the pair naked, sewing their own fig-leaf covering.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae51_lookup sv, _session253_1ae51_lookup tv
 WHERE t.slug='1-adam-eve-51-garment-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=51 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:21 — *Unto Adam also and to his wife did Yahuah Elohim (the LORD God) make coats of skins, and clothed them.* The earthly sheep-skin garment Satan would destroy in 51:8 is the very coat of skins Yahuah made to clothe Adam and Eve.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae51_lookup sv, _session253_1ae51_lookup tv
 WHERE t.slug='1-adam-eve-51-garment-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=51 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-51-fallen-angel-of-light
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 14:12 — *How art thou fallen from heaven, O Lucifer, son of the morning! how art thou cut down to the ground, which didst weaken the nations!* The lost light and glory the Word asks after in 51:6 is the fall of the son of the morning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae51_lookup sv, _session253_1ae51_lookup tv
 WHERE t.slug='1-adam-eve-51-fallen-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=51 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 10:18 — *And he said unto them, I beheld Satan as lightning fall from heaven.* The one now hideous and abominable among angels in 51:7 is the Satan Yahusha saw fall as lightning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae51_lookup sv, _session253_1ae51_lookup tv
 WHERE t.slug='1-adam-eve-51-fallen-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=51 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=10 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The stolen beauty and false divinity exposed in 51:6 is the disguise of light by which Satan still deceives.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae51_lookup sv, _session253_1ae51_lookup tv
 WHERE t.slug='1-adam-eve-51-fallen-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=51 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* The adversary unmasked as Satan in 51:7 is the prowling devil the saints are warned to watch against.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae51_lookup sv, _session253_1ae51_lookup tv
 WHERE t.slug='1-adam-eve-51-fallen-angel-of-light'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=51 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-51-no-power-is-left
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Colossians 2:15 — *And having spoiled principalities and powers, he made a shew of them openly, triumphing over them in it.* Binding the enemy and showing his weakness openly to Adam in 51:10 foreshadows the cross''s open triumph over the powers.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae51_lookup sv, _session253_1ae51_lookup tv
 WHERE t.slug='1-adam-eve-51-no-power-is-left'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=51 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 2:14 — *Forasmuch then as the children are partakers of flesh and blood, he also himself likewise took part of the same; that through death he might destroy him that had the power of death, that is, the devil;* That no power is left with the bound Satan in 51:10 anticipates the Son destroying the devil through His own death.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae51_lookup sv, _session253_1ae51_lookup tv
 WHERE t.slug='1-adam-eve-51-no-power-is-left'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=51 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Releasing the now-powerless adversary in 51:11 keeps the long enmity going toward the promised bruising of the serpent''s head.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae51_lookup sv, _session253_1ae51_lookup tv
 WHERE t.slug='1-adam-eve-51-no-power-is-left'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=51 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

