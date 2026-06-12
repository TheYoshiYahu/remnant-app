-- ----- fragment: minion_1adameve_33.sql (session253 1-adam-eve 33) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch33. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae33 (view _session253_1ae33_lookup). Sort band base 64800, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae33_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-33-roaring-lion-seeks-them
  ('adam-eve-conflict', '1-adam-eve', 33, 1, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* The Satan who *sought them in the cave* and *searched diligently for them* in 1 Adam & Eve 33:1 is Kepha''s same prowling lion seeking whom he may devour.'),
  ('adam-eve-conflict', '1-adam-eve', 33, 1, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The hater of all good who hunts Adam and Eve in 1 Adam & Eve 33:1 is the murderer and liar Yahusha says was such from the beginning.'),
  ('adam-eve-conflict', '1-adam-eve', 33, 2, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s plot to take Adam and Eve *from under my hand* in 1 Adam & Eve 33:2 is the enmity of Eden working itself out — the serpent striking back at the woman whose seed will bruise his head.'),
  -- thread: 1-adam-eve-33-angel-of-light-beguiles-eve
  ('adam-eve-conflict', '1-adam-eve', 33, 4, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* When Satan *took the form of an angel of Elohim* to deceive Eve in 1 Adam & Eve 33:4, he is doing the very thing Sha''ul warns of — transforming himself into an angel of light.'),
  ('adam-eve-conflict', '1-adam-eve', 33, 5, 'canon', '2-corinthians', 11, 3, 'free', E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* The false "glad tidings of salvation" Satan speaks to Eve in 1 Adam & Eve 33:5 is the same subtle beguiling by which the serpent first deceived her.'),
  ('adam-eve-conflict', '1-adam-eve', 33, 8, 'canon', '1-timothy', 2, 14, 'free', E'1 Timothy 2:14 — *And Adam was not deceived, but the woman being deceived was in the transgression.* That Satan *went not to Adam, but he went to Eve*, who thinking his appearance real *came out of the sea* (1 Adam & Eve 33:8), follows the Eden pattern Sha''ul records — the woman being deceived.'),
  ('adam-eve-conflict', '1-adam-eve', 33, 9, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The phantom who goes before Eve and then *hid himself from her, and she saw him no more* (1 Adam & Eve 33:9) is that old serpent whose whole work is to deceive the world.'),
  -- thread: 1-adam-eve-33-cave-of-treasures-gold-myrrh
  ('adam-eve-conflict', '1-adam-eve', 33, 7, 'canon', 'matthew', 2, 11, 'free', E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The gold, incense, and myrrh laid up in the Cave of Treasures in 1 Adam & Eve 33:7 are the very three gifts the magi open before the Saviour they were kept for.'),
  ('adam-eve-conflict', '1-adam-eve', 33, 7, 'canon', 'galatians', 4, 4, 'free', E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The treasures Adam guards in the cave in 1 Adam & Eve 33:7 wait for the appointed time when Elohim sends forth His Son, made of a woman.'),
  -- thread: 1-adam-eve-33-word-of-elohim-raises-adam
  ('adam-eve-conflict', '1-adam-eve', 33, 12, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The *Word of Elohim* who *came from heaven* and raised Adam out of the water in 1 Adam & Eve 33:12 is the Logos who was in the beginning with Elohim and was Elohim.'),
  ('adam-eve-conflict', '1-adam-eve', 33, 12, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The same Word who comes from heaven to rescue Adam in 1 Adam & Eve 33:12 will be made flesh and dwell among men, full of grace and truth.'),
  ('adam-eve-conflict', '1-adam-eve', 33, 14, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* When Adam is given *to know it was Satan* in 1 Adam & Eve 33:14, the deceiver''s work is unmasked — the very works the Son of Elohim was manifested to destroy.'),
  ('adam-eve-conflict', '1-adam-eve', 33, 14, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Every deception of Satan unmasked in 1 Adam & Eve 33:14 moves toward the promised end, when the Elohim of peace bruises Satan underfoot.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae33_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae33_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-33-roaring-lion-seeks-them',
       E'The hater of all good seeks the seed',
       E'*But Satan, the hater of all good, sought them in the cave, but found them not, although he searched diligently for them.* (1 Adam & Eve 33:1) — *But he found them standing in the water praying... and to take them from under my hand.* (1 Adam & Eve 33:2) From the very first days outside the garden the seed-war is already joined: the adversary prowls, hunting the woman and her seed at prayer. It ain''t new — Yahusha names him the murderer who was such *from the beginning*: *Ye are of your father the devil... He was a murderer from the beginning... for he is a liar, and the father of it.* (John 8:44) Kepha calls him by the same hunting figure: *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* (1 Peter 5:8) And the enmity Yahuah set in Eden is the reason Satan searches the cave at all: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15)',
       sv.verse_id, ev.verse_id, 'extras', 64800
  FROM _session253_1ae33_lookup sv, _session253_1ae33_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=33 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=33 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-33-angel-of-light-beguiles-eve',
       E'Transformed into an angel — Eve beguiled again',
       E'*Then the hater of all good, went not to Adam, but he went to Eve, and took the form of an angel of Elohim (God), praising and rejoicing...* (1 Adam & Eve 33:4) — *"Peace be to you! Be glad and rejoice! Elohim (God) is favorable to you, and He sent me to Adam..."* (1 Adam & Eve 33:5) — *And thinking Satan''s appearance was real, she came out of the sea.* (1 Adam & Eve 33:8) The deceiver wears borrowed light and false comfort, and he goes again to the woman — exactly as in Eden. It ain''t new: *And no marvel; for Satan himself is transformed into an angel of light.* (2 Corinthians 11:14) Sha''ul names the very pattern — *as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* (2 Corinthians 11:3) — and *Adam was not deceived, but the woman being deceived was in the transgression.* (1 Timothy 2:14) The serpent who once said *Ye shall not surely die* now says "peace and salvation," but he remains *that old serpent... which deceiveth the whole world* (Revelation 12:9).',
       sv.verse_id, ev.verse_id, 'extras', 64803
  FROM _session253_1ae33_lookup sv, _session253_1ae33_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=33 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=33 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-33-cave-of-treasures-gold-myrrh',
       E'The Cave of Treasures — gold, incense, and myrrh',
       E'*"...how Elohim (God) sent his angels who took us and brought us to the Cave of Treasures; and laid the gold on the southern side; incense, on the eastern side; and myrrh on the western side."* (1 Adam & Eve 33:7) Even on Satan''s lying lips the sign is true: the three treasures Yahuah laid up in the cave against the day of His coming. Adam keeps gold, incense, and myrrh from the first generation — and the wise men bring the very three to the manger when the fulness of time is come. It ain''t new: *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* (Matthew 2:11) The promise the Word will keep is the same promise that brought Him: *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law* (Galatians 4:4).',
       sv.verse_id, ev.verse_id, 'extras', 64806
  FROM _session253_1ae33_lookup sv, _session253_1ae33_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=33 AND sv.verse_number=7
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=33 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-33-word-of-elohim-raises-adam',
       E'The Word of Elohim raises Adam from the water',
       E'*But Elohim (God) looked at him and at his misery, and at his being about to breathe his last. And the Word of Elohim (God) came from heaven, raised him out of the water...* (1 Adam & Eve 33:12) When grief sinks Adam beneath the water it is the Word of Elohim who comes from heaven to lift him and to expose the deceiver. This is the Logos — the same who comforts Adam in the earlier chapters and foretells His own coming to save him. It ain''t new: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* (John 1:1) — *And the Word was made flesh, and dwelt among us... full of grace and truth.* (John 1:14) The mercy that *raised him out of the water* and let Adam *know it was Satan* (1 Adam & Eve 33:14) is the same purpose for which the Word was manifested: *For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* (1 John 3:8) — and the promised crushing draws near: *And the Elohim (God) of peace shall bruise Satan under your feet shortly.* (Romans 16:20)',
       sv.verse_id, ev.verse_id, 'extras', 64809
  FROM _session253_1ae33_lookup sv, _session253_1ae33_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=33 AND sv.verse_number=12
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=33 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-33-roaring-lion-seeks-them
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* The Satan who *sought them in the cave* and *searched diligently for them* in 1 Adam & Eve 33:1 is Kepha''s same prowling lion seeking whom he may devour.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae33_lookup sv, _session253_1ae33_lookup tv
 WHERE t.slug='1-adam-eve-33-roaring-lion-seeks-them'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=33 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The hater of all good who hunts Adam and Eve in 1 Adam & Eve 33:1 is the murderer and liar Yahusha says was such from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae33_lookup sv, _session253_1ae33_lookup tv
 WHERE t.slug='1-adam-eve-33-roaring-lion-seeks-them'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=33 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s plot to take Adam and Eve *from under my hand* in 1 Adam & Eve 33:2 is the enmity of Eden working itself out — the serpent striking back at the woman whose seed will bruise his head.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae33_lookup sv, _session253_1ae33_lookup tv
 WHERE t.slug='1-adam-eve-33-roaring-lion-seeks-them'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=33 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-33-angel-of-light-beguiles-eve
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* When Satan *took the form of an angel of Elohim* to deceive Eve in 1 Adam & Eve 33:4, he is doing the very thing Sha''ul warns of — transforming himself into an angel of light.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae33_lookup sv, _session253_1ae33_lookup tv
 WHERE t.slug='1-adam-eve-33-angel-of-light-beguiles-eve'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=33 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* The false "glad tidings of salvation" Satan speaks to Eve in 1 Adam & Eve 33:5 is the same subtle beguiling by which the serpent first deceived her.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae33_lookup sv, _session253_1ae33_lookup tv
 WHERE t.slug='1-adam-eve-33-angel-of-light-beguiles-eve'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=33 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Timothy 2:14 — *And Adam was not deceived, but the woman being deceived was in the transgression.* That Satan *went not to Adam, but he went to Eve*, who thinking his appearance real *came out of the sea* (1 Adam & Eve 33:8), follows the Eden pattern Sha''ul records — the woman being deceived.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae33_lookup sv, _session253_1ae33_lookup tv
 WHERE t.slug='1-adam-eve-33-angel-of-light-beguiles-eve'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=33 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The phantom who goes before Eve and then *hid himself from her, and she saw him no more* (1 Adam & Eve 33:9) is that old serpent whose whole work is to deceive the world.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae33_lookup sv, _session253_1ae33_lookup tv
 WHERE t.slug='1-adam-eve-33-angel-of-light-beguiles-eve'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=33 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-33-cave-of-treasures-gold-myrrh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The gold, incense, and myrrh laid up in the Cave of Treasures in 1 Adam & Eve 33:7 are the very three gifts the magi open before the Saviour they were kept for.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae33_lookup sv, _session253_1ae33_lookup tv
 WHERE t.slug='1-adam-eve-33-cave-of-treasures-gold-myrrh'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=33 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The treasures Adam guards in the cave in 1 Adam & Eve 33:7 wait for the appointed time when Elohim sends forth His Son, made of a woman.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae33_lookup sv, _session253_1ae33_lookup tv
 WHERE t.slug='1-adam-eve-33-cave-of-treasures-gold-myrrh'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=33 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-33-word-of-elohim-raises-adam
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The *Word of Elohim* who *came from heaven* and raised Adam out of the water in 1 Adam & Eve 33:12 is the Logos who was in the beginning with Elohim and was Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae33_lookup sv, _session253_1ae33_lookup tv
 WHERE t.slug='1-adam-eve-33-word-of-elohim-raises-adam'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=33 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The same Word who comes from heaven to rescue Adam in 1 Adam & Eve 33:12 will be made flesh and dwell among men, full of grace and truth.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae33_lookup sv, _session253_1ae33_lookup tv
 WHERE t.slug='1-adam-eve-33-word-of-elohim-raises-adam'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=33 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* When Adam is given *to know it was Satan* in 1 Adam & Eve 33:14, the deceiver''s work is unmasked — the very works the Son of Elohim was manifested to destroy.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae33_lookup sv, _session253_1ae33_lookup tv
 WHERE t.slug='1-adam-eve-33-word-of-elohim-raises-adam'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=33 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Every deception of Satan unmasked in 1 Adam & Eve 33:14 moves toward the promised end, when the Elohim of peace bruises Satan underfoot.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae33_lookup sv, _session253_1ae33_lookup tv
 WHERE t.slug='1-adam-eve-33-word-of-elohim-raises-adam'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=33 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

