-- ----- fragment: minion_1adameve_73.sql (session253 1-adam-eve 73) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch73. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae73 (view _session253_1ae73_lookup). Sort band base 65800, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae73_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-73-word-comes-to-adam
  ('adam-eve-conflict', '1-adam-eve', 73, 2, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Elohim who comes and speaks to Adam in 1 Adam & Eve 73:2 is the eternal Logos, with Elohim from the beginning.'),
  ('adam-eve-conflict', '1-adam-eve', 73, 2, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The same Word who counsels Adam in 73:2 would in the fulness of time take flesh to save the seed He had promised.'),
  ('adam-eve-conflict', '1-adam-eve', 73, 2, 'canon', 'hebrews', 1, 1, 'free', E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets,* He who spoke to the fathers spoke first of all to Adam, the first father, as 73:2 records.'),
  -- thread: 1-adam-eve-73-gold-incense-myrrh-wedding
  ('adam-eve-conflict', '1-adam-eve', 73, 4, 'canon', 'matthew', 2, 11, 'free', E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The gold, incense, and myrrh given to Eve as a wedding gift in 73:4 are the very treasures laid up for the Saviour and brought to Him at His birth.'),
  ('adam-eve-conflict', '1-adam-eve', 73, 4, 'canon', 'genesis', 2, 24, 'free', E'Genesis 2:24 — *Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh.* The angels'' command that Adam and Eve be "one flesh" in 73:4 enacts the marriage ordinance spoken in Eden.'),
  ('adam-eve-conflict', '1-adam-eve', 73, 4, 'canon', 'ephesians', 5, 31, 'free', E'Ephesians 5:31 — *For this cause shall a man leave his father and mother, and shall be joined unto his wife, and they two shall be one flesh.* The one-flesh marriage of Adam and Eve in 73:4 is the mystery Paul reads forward to Messiah and His bride.'),
  -- thread: 1-adam-eve-73-forty-days-fast-before-union
  ('adam-eve-conflict', '1-adam-eve', 73, 6, 'canon', '1-corinthians', 7, 5, 'free', E'1 Corinthians 7:5 — *Defraud ye not one the other, except it be with consent for a time, that ye may give yourselves to fasting and prayer; and come together again, that Satan tempt you not for your incontinency.* The forty days of prayer before Adam comes to Eve in 73:6 is the same set-apart abstinence for prayer that frustrates Satan''s temptation.'),
  ('adam-eve-conflict', '1-adam-eve', 73, 6, 'canon', 'genesis', 1, 28, 'free', E'Genesis 1:28 — *And Elohim (God) blessed them, and Elohim (God) said unto them, Be fruitful, and multiply, and replenish the earth, and subdue it: and have dominion over the fish of the sea, and over the fowl of the air, and over every living thing that moveth upon the earth.* The angels'' purpose that the children "multiply, and replenish the face of the earth" in 73:6 carries forward the Eden blessing.'),
  ('adam-eve-conflict', '1-adam-eve', 73, 6, 'canon', 'hebrews', 13, 4, 'free', E'Hebrews 13:4 — *Marriage is honourable in all, and the bed undefiled: but whoremongers and adulterers Elohim (God) will judge.* The angels declare the union after the fast "an act pure and undefiled" in 73:6 — the very honour Scripture sets on the marriage bed.'),
  -- thread: 1-adam-eve-73-satans-war-defeated
  ('adam-eve-conflict', '1-adam-eve', 73, 9, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s defeated war in 73:9 is the enmity decreed at the fall, the serpent striking in vain at the seed of the woman.'),
  ('adam-eve-conflict', '1-adam-eve', 73, 9, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The overthrow of Satan''s war in 73:9 anticipates the final bruising of Satan promised to the saints.'),
  ('adam-eve-conflict', '1-adam-eve', 73, 9, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* Satan''s defeat in 73:9 is one early work of the devil undone, the work the Son was manifested to destroy.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae73_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae73_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-73-word-comes-to-adam',
       E'The Word of Elohim Comes to Adam',
       E'Elohim approves the patience Adam learned against Satan''s counsel, *and the Word of Elohim (God) came to Adam and said to him, "O Adam, if only you had had this caution at first, before you came out of the garden into this land!"* (1 Adam & Eve 73:2). The One who walks and speaks with Adam from the first day outside the garden is no created messenger but the Logos — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1) — the same Word who would at last be *made flesh, and dwelt among us* (John 1:14). It ain''t new: He who *at sundry times and in divers manners spake in time past unto the fathers by the prophets* (Hebrews 1:1) had already spoken to the first father. The Word who counsels Adam in the land of his exile is the Saviour foretold for the great five days and a half.',
       sv.verse_id, ev.verse_id, 'extras', 65800
  FROM _session253_1ae73_lookup sv, _session253_1ae73_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=73 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=73 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-73-gold-incense-myrrh-wedding',
       E'Gold, Incense, and Myrrh — the Wedding Gift Kept for the Saviour',
       E'The three angels who had carried the tokens out of the garden now bring them to the marriage: *Then those angels said to Adam, "Take the gold and give it to Eve as a wedding gift, and promise to marry her; then give her some incense and myrrh as a present; and be you, you and she, one flesh"* (1 Adam & Eve 73:4). The very gold, incense, and myrrh laid up in the Cave of Treasures against the Saviour''s coming are the wedding-portion of the first marriage — and they reappear at His birth: *and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh* (Matthew 2:11). The one-flesh union the angels command is the first marriage ordained in Eden: *Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh* (Genesis 2:24). It ain''t new — the gifts that crown Messiah crowned the first bride.',
       sv.verse_id, ev.verse_id, 'extras', 65803
  FROM _session253_1ae73_lookup sv, _session253_1ae73_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=73 AND sv.verse_number=3
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=73 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-73-forty-days-fast-before-union',
       E'Forty Days of Prayer Before the Pure Union',
       E'Before Adam may come to his wife the angels set a fast: *Then the angels commanded Adam and Eve to get up and pray forty days and forty nights; when that was done, then Adam was to have sexual intercourse with his wife; for then this would be an act pure and undefiled; so that he would have children who would multiply, and replenish the face of the earth* (1 Adam & Eve 73:6). This is the Eden mandate restored in the land of exile: *And Elohim (God) blessed them, and Elohim (God) said unto them, Be fruitful, and multiply, and replenish the earth* (Genesis 1:28). The set-apart abstinence for prayer, then coming together, is the very pattern Paul gives the married: *Defraud ye not one the other, except it be with consent for a time, that ye may give yourselves to fasting and prayer; and come together again, that Satan tempt you not for your incontinency* (1 Corinthians 7:5). And the bed thus kept is what Scripture honours: *Marriage is honourable in all, and the bed undefiled* (Hebrews 13:4). It ain''t new — the holy order of the first marriage is the apostle''s counsel.',
       sv.verse_id, ev.verse_id, 'extras', 65806
  FROM _session253_1ae73_lookup sv, _session253_1ae73_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=73 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=73 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-73-satans-war-defeated',
       E'Thus Was Satan''s War With Adam Defeated',
       E'The chapter closes the long siege: *Thus was Satan''s war with Adam defeated* (1 Adam & Eve 73:9). The serpent who struck at the woman and her seed from the first day is overthrown by Yahuah''s mercy — the spine of the whole conflict is the seed-promise: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). Every assault repelled here is a foretaste of the final crushing: *And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20). For this the Word came to Adam, and for this He would come in flesh: *For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (1 John 3:8). It ain''t new — the war Satan loses at Eve''s wedding is the war he loses at the cross.',
       sv.verse_id, ev.verse_id, 'extras', 65809
  FROM _session253_1ae73_lookup sv, _session253_1ae73_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=73 AND sv.verse_number=9
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=73 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-73-word-comes-to-adam
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Elohim who comes and speaks to Adam in 1 Adam & Eve 73:2 is the eternal Logos, with Elohim from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae73_lookup sv, _session253_1ae73_lookup tv
 WHERE t.slug='1-adam-eve-73-word-comes-to-adam'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=73 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The same Word who counsels Adam in 73:2 would in the fulness of time take flesh to save the seed He had promised.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae73_lookup sv, _session253_1ae73_lookup tv
 WHERE t.slug='1-adam-eve-73-word-comes-to-adam'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=73 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:1 — *Elohim (God), who at sundry times and in divers manners spake in time past unto the fathers by the prophets,* He who spoke to the fathers spoke first of all to Adam, the first father, as 73:2 records.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae73_lookup sv, _session253_1ae73_lookup tv
 WHERE t.slug='1-adam-eve-73-word-comes-to-adam'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=73 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-73-gold-incense-myrrh-wedding
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The gold, incense, and myrrh given to Eve as a wedding gift in 73:4 are the very treasures laid up for the Saviour and brought to Him at His birth.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae73_lookup sv, _session253_1ae73_lookup tv
 WHERE t.slug='1-adam-eve-73-gold-incense-myrrh-wedding'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=73 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:24 — *Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh.* The angels'' command that Adam and Eve be "one flesh" in 73:4 enacts the marriage ordinance spoken in Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae73_lookup sv, _session253_1ae73_lookup tv
 WHERE t.slug='1-adam-eve-73-gold-incense-myrrh-wedding'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=73 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 5:31 — *For this cause shall a man leave his father and mother, and shall be joined unto his wife, and they two shall be one flesh.* The one-flesh marriage of Adam and Eve in 73:4 is the mystery Paul reads forward to Messiah and His bride.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae73_lookup sv, _session253_1ae73_lookup tv
 WHERE t.slug='1-adam-eve-73-gold-incense-myrrh-wedding'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=73 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-73-forty-days-fast-before-union
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 7:5 — *Defraud ye not one the other, except it be with consent for a time, that ye may give yourselves to fasting and prayer; and come together again, that Satan tempt you not for your incontinency.* The forty days of prayer before Adam comes to Eve in 73:6 is the same set-apart abstinence for prayer that frustrates Satan''s temptation.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae73_lookup sv, _session253_1ae73_lookup tv
 WHERE t.slug='1-adam-eve-73-forty-days-fast-before-union'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=73 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=7 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:28 — *And Elohim (God) blessed them, and Elohim (God) said unto them, Be fruitful, and multiply, and replenish the earth, and subdue it: and have dominion over the fish of the sea, and over the fowl of the air, and over every living thing that moveth upon the earth.* The angels'' purpose that the children "multiply, and replenish the face of the earth" in 73:6 carries forward the Eden blessing.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae73_lookup sv, _session253_1ae73_lookup tv
 WHERE t.slug='1-adam-eve-73-forty-days-fast-before-union'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=73 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 13:4 — *Marriage is honourable in all, and the bed undefiled: but whoremongers and adulterers Elohim (God) will judge.* The angels declare the union after the fast "an act pure and undefiled" in 73:6 — the very honour Scripture sets on the marriage bed.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae73_lookup sv, _session253_1ae73_lookup tv
 WHERE t.slug='1-adam-eve-73-forty-days-fast-before-union'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=73 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-73-satans-war-defeated
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s defeated war in 73:9 is the enmity decreed at the fall, the serpent striking in vain at the seed of the woman.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae73_lookup sv, _session253_1ae73_lookup tv
 WHERE t.slug='1-adam-eve-73-satans-war-defeated'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=73 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* The overthrow of Satan''s war in 73:9 anticipates the final bruising of Satan promised to the saints.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae73_lookup sv, _session253_1ae73_lookup tv
 WHERE t.slug='1-adam-eve-73-satans-war-defeated'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=73 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* Satan''s defeat in 73:9 is one early work of the devil undone, the work the Son was manifested to destroy.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae73_lookup sv, _session253_1ae73_lookup tv
 WHERE t.slug='1-adam-eve-73-satans-war-defeated'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=73 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

