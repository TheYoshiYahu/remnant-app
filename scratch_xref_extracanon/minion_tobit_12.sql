-- ----- fragment: minion_tobit_12.sql (session253 tobit 12) -----
-- Source anchor: apocrypha/tobit ch12. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: tob12 (view _session253_tob12_lookup). Sort band base 59875, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_tob12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: tobit-12-seven-holy-angels
  ('apocrypha', 'tobit', 12, 15, 'canon', 'revelation', 8, 2, 'free', E'Revelation 8:2 — *And I saw the seven angels which stood before Elohim (God); and to them were given seven trumpets.* John beholds the very seven holy angels Raphael names himself among in Tobit 12:15.'),
  ('apocrypha', 'tobit', 12, 15, 'canon', 'revelation', 8, 3, 'free', E'Revelation 8:3 — *And another angel came and stood at the altar, having a golden censer; and there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne.* This is the heavenly office Raphael describes in Tobit 12:15 — an angel presenting the prayers of the saints at the throne.'),
  ('apocrypha', 'tobit', 12, 15, 'canon', 'revelation', 8, 4, 'free', E'Revelation 8:4 — *And the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel’s hand.* The saints'' prayers rising before the glory of the Holy One is exactly what Raphael did with Tobit''s prayer in Tobit 12:15.'),
  ('apocrypha', 'tobit', 12, 15, 'canon', 'luke', 1, 19, 'free', E'Luke 1:19 — *And the angel answering said unto him, I am Gabriel, that stand in the presence of Elohim (God); and am sent to speak unto thee, and to shew thee these glad tidings.* Gabriel self-identifies as one who stands before the glory of Elohim, the same station Raphael claims in Tobit 12:15.'),
  -- thread: tobit-12-prayers-remembered
  ('apocrypha', 'tobit', 12, 12, 'canon', 'psalms', 141, 2, 'free', E'Psalm 141:2 — *Let my prayer be set forth before thee as incense; and the lifting up of my hands as the evening sacrifice.* David asks that his prayer rise as incense before Yahuah, which is the very thing Raphael carried out in Tobit 12:12.'),
  ('apocrypha', 'tobit', 12, 12, 'canon', 'revelation', 8, 4, 'free', E'Revelation 8:4 — *And the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel’s hand.* The angel bearing the remembrance of prayers up to the throne matches Raphael bringing Tobit''s prayers before the Holy One in Tobit 12:12.'),
  ('apocrypha', 'tobit', 12, 12, 'canon', 'luke', 1, 13, 'free', E'Luke 1:13 — *But the angel said unto him, Fear not, Zacharias: for thy prayer is heard; and thy wife Elisabeth shall bear thee a son, and thou shalt call his name John.* The prayer heard and answered by a sent angel is the pattern Raphael reveals to Tobit in Tobit 12:12.'),
  -- thread: tobit-12-refuses-worship
  ('apocrypha', 'tobit', 12, 18, 'canon', 'revelation', 19, 10, 'free', E'Revelation 19:10 — *And I fell at his feet to worship him. And he said unto me, See thou do it not: I am thy fellowservant, and of thy brethren that have the testimony of Yahusha (Jesus): worship Elohim (God): for the testimony of Yahusha (Jesus) is the spirit of prophecy.* The angel refusing worship and redirecting it to Elohim is exactly Raphael''s word in Tobit 12:18.'),
  ('apocrypha', 'tobit', 12, 18, 'canon', 'revelation', 22, 9, 'free', E'Revelation 22:9 — *Then saith he unto me, See thou do it not: for I am thy fellowservant, and of thy brethren the prophets, and of them which keep the sayings of this book: worship Elohim (God).* The same fellowservant who declines worship matches Raphael disclaiming any favour of his own in Tobit 12:18.'),
  ('apocrypha', 'tobit', 12, 16, 'canon', 'revelation', 22, 8, 'free', E'Revelation 22:8 — *And I John saw these things, and heard them. And when I had heard and seen, I fell down to worship before the feet of the angel which shewed me these things.* John falling at the angel''s feet mirrors Tobit and Tobias falling on their faces before Raphael in Tobit 12:16.'),
  -- thread: tobit-12-go-up-to-him-that-sent-me
  ('apocrypha', 'tobit', 12, 20, 'canon', 'john', 6, 38, 'free', E'John 6:38 — *For I came down from heaven, not to do mine own will, but the will of him that sent me.* The posture of doing the will of the One who sent him, and returning to him, is Raphael''s own word in Tobit 12:20.'),
  ('apocrypha', 'tobit', 12, 20, 'canon', 'revelation', 1, 11, 'free', E'Revelation 1:11 — *Saying, I am Alpha and Omega, the first and the last: and, What thou seest, write in a book, and send it unto the seven churches which are in Asia; unto Ephesus, and unto Smyrna, and unto Pergamos, and unto Thyatira, and unto Sardis, and unto Philadelphia, and unto Laodicea.* The command to write all things in a book is given to John just as Raphael commands Tobit in Tobit 12:20.'),
  ('apocrypha', 'tobit', 12, 18, 'canon', 'john', 6, 38, 'free', E'John 6:38 — *For I came down from heaven, not to do mine own will, but the will of him that sent me.* Raphael came not of his own favour but by the will of Elohim (Tobit 12:18), the very pattern of the Sent One.'),
  -- thread: tobit-12-alms-fasting-prayer
  ('apocrypha', 'tobit', 12, 8, 'canon', 'matthew', 6, 1, 'free', E'Matthew 6:1 — *Take heed that ye do not your alms before men, to be seen of them: otherwise ye have no reward of your Father which is in heaven.* The good of almsgiving Raphael commends in Tobit 12:8 is the same alms Yahusha teaches, done before the Father not before men.'),
  ('apocrypha', 'tobit', 12, 8, 'canon', 'matthew', 6, 6, 'free', E'Matthew 6:6 — *But thou, when thou prayest, enter into thy closet, and when thou hast shut thy door, pray to thy Father which is in secret; and thy Father which seeth in secret shall reward thee openly.* The prayer Raphael calls good in Tobit 12:8 is the secret prayer Yahusha commends.'),
  ('apocrypha', 'tobit', 12, 8, 'canon', 'matthew', 6, 18, 'free', E'Matthew 6:18 — *That thou appear not unto men to fast, but unto thy Father which is in secret: and thy Father, which seeth in secret, shall reward thee openly.* The fasting Raphael joins to prayer and alms in Tobit 12:8 is the secret fasting Yahusha teaches.'),
  -- thread: tobit-12-alms-deliver-from-death
  ('apocrypha', 'tobit', 12, 9, 'canon', 'proverbs', 10, 2, 'free', E'Proverbs 10:2 — *Treasures of wickedness profit nothing: but righteousness delivereth from death.* Solomon''s word that righteousness delivers from death is the very promise Raphael attaches to alms in Tobit 12:9.'),
  ('apocrypha', 'tobit', 12, 9, 'canon', 'proverbs', 11, 4, 'free', E'Proverbs 11:4 — *Riches profit not in the day of wrath: but righteousness delivereth from death.* That righteousness, not hoarded gold, delivers from death echoes Raphael''s counsel in Tobit 12:9 that alms is better than laying up gold.'),
  ('apocrypha', 'tobit', 12, 9, 'apocrypha', 'tobit', 4, 10, 'extras', E'Tobit 4:10 — *Because that alms do deliver from death, and suffers not to come into darkness.* Tobit had already taught his son the lesson Raphael now confirms from heaven in Tobit 12:9.'),
  -- thread: tobit-12-reveal-the-works-of-god
  ('apocrypha', 'tobit', 12, 6, 'canon', 'luke', 1, 46, 'free', E'Luke 1:46 — *And Mary said, My soul doth magnify Yahuah (Lord),* Mary magnifies Yahuah just as Raphael commands the household to magnify and praise him in Tobit 12:6.'),
  ('apocrypha', 'tobit', 12, 6, 'canon', 'luke', 1, 49, 'free', E'Luke 1:49 — *For he that is mighty hath done to me great things; and holy is his name.* Praising Elohim for the great things he has done is the very response Raphael calls for in Tobit 12:6.'),
  ('apocrypha', 'tobit', 12, 14, 'canon', 'hebrews', 1, 14, 'free', E'Hebrews 1:14 — *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* This defines the office of the angel sent to heal Tobit and Sara in Tobit 12:14 — a ministering spirit sent for the heirs of salvation.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_tob12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_tob12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-12-seven-holy-angels',
       E'I am Raphael, one of the seven holy angels',
       E'When his work is finished Raphael unveils himself: *I am Raphael, one of the seven holy angels, which present the prayers of the saints, and which go in and out before the glory of the Holy One.* (Tobit 12:15). It ain''t new — John saw the same seven standing in the heavenly sanctuary: *And I saw the seven angels which stood before Elohim (God); and to them were given seven trumpets.* (Revelation 8:2), and another angel *having a golden censer; and there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne.* (Revelation 8:3), so that *the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel’s hand.* (Revelation 8:4). Gabriel names his own station to Zacharias in the very same words: *I am Gabriel, that stand in the presence of Elohim (God); and am sent to speak unto thee, and to shew thee these glad tidings.* (Luke 1:19). Tobit''s prayers and Sara''s were carried up the same way Tobit himself was told.',
       sv.verse_id, ev.verse_id, 'extras', 59875
  FROM _session253_tob12_lookup sv, _session253_tob12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=12 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-12-prayers-remembered',
       E'I brought the remembrance of your prayers before the Holy One',
       E'Raphael testifies that nothing Tobit and Sara prayed fell to the ground: *Now therefore, when you did pray, and Sara your daughter in law, I did bring the remembrance of your prayers before the Holy One: and when you did bury the dead, I was with you likewise.* (Tobit 12:12). David asked for exactly this ministry: *Let my prayer be set forth before thee as incense; and the lifting up of my hands as the evening sacrifice.* (Psalm 141:2). And John saw the angel carry it: *And the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel’s hand.* (Revelation 8:4). When Zacharias prayed at the altar of incense the answer came by an angel — *Fear not, Zacharias: for thy prayer is heard* (Luke 1:13) — the same pattern: the prayer remembered, the angel sent.',
       sv.verse_id, ev.verse_id, 'extras', 59878
  FROM _session253_tob12_lookup sv, _session253_tob12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=12 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-12-refuses-worship',
       E'Not of any favour of mine — worship Elohim alone',
       E'When the two fall on their faces in fear, the angel turns every eye back to Elohim: *For not of any favour of mine, but by the will of our Elohim (God) I came; wherefore praise him for ever.* (Tobit 12:18); *But he said to them, Fear not, for it shall go well with you; praise Yahuah (God) therefore.* (Tobit 12:17). John twice tried to worship the angel and was twice refused in the same breath: *And he said unto me, See thou do it not: I am thy fellowservant, and of thy brethren that have the testimony of Yahusha (Jesus): worship Elohim (God): for the testimony of Yahusha (Jesus) is the spirit of prophecy.* (Revelation 19:10); *Then saith he unto me, See thou do it not: for I am thy fellowservant, and of thy brethren the prophets, and of them which keep the sayings of this book: worship Elohim (God).* (Revelation 22:9). It ain''t new — the holy messenger never takes the worship owed to Yahuah alone.',
       sv.verse_id, ev.verse_id, 'extras', 59881
  FROM _session253_tob12_lookup sv, _session253_tob12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=12 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-12-go-up-to-him-that-sent-me',
       E'I go up to him that sent me',
       E'The angel''s parting word is the language of the Sent One: *Now therefore give Yahuah (God) thanks: for I go up to him that sent me; but write all things which are done in a book.* (Tobit 12:20). Yahusha speaks the same posture of the one sent: *For I came down from heaven, not to do mine own will, but the will of him that sent me.* (John 6:38) — and Raphael had already framed his coming the same way, *by the will of our Elohim (God) I came* (Tobit 12:18). And the charge to write it in a book is the charge John received: *Saying, I am Alpha and Omega, the first and the last: and, What thou seest, write in a book, and send it unto the seven churches which are in Asia...* (Revelation 1:11). What was done in mercy is to be recorded as witness.',
       sv.verse_id, ev.verse_id, 'extras', 59884
  FROM _session253_tob12_lookup sv, _session253_tob12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=12 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-12-alms-fasting-prayer',
       E'Prayer is good with fasting and alms',
       E'Raphael''s counsel binds the three together: *Prayer is good with fasting and alms and righteousness. A little with righteousness is better than much with unrighteousness. It is better to give alms than to lay up gold:* (Tobit 12:8). The Sermon on the Mount takes up the same three — alms, prayer, fasting — and guards each against display: *Take heed that ye do not your alms before men, to be seen of them: otherwise ye have no reward of your Father which is in heaven.* (Matthew 6:1); *But thou, when thou prayest, enter into thy closet, and when thou hast shut thy door, pray to thy Father which is in secret; and thy Father which seeth in secret shall reward thee openly.* (Matthew 6:6); *That thou appear not unto men to fast, but unto thy Father which is in secret: and thy Father, which seeth in secret, shall reward thee openly.* (Matthew 6:18). It ain''t new — the threefold piety of Tobit is the threefold piety Yahusha taught.',
       sv.verse_id, ev.verse_id, 'extras', 59887
  FROM _session253_tob12_lookup sv, _session253_tob12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=12 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-12-alms-deliver-from-death',
       E'Alms doth deliver from death',
       E'Raphael presses the promise further: *For alms does deliver from death, and shall purge away all sin. Those that exercise alms and righteousness shall be filled with life:* (Tobit 12:9). The proverb of Solomon says it plainly twice: *Treasures of wickedness profit nothing: but righteousness delivereth from death.* (Proverbs 10:2); *Riches profit not in the day of wrath: but righteousness delivereth from death.* (Proverbs 11:4). And Tobit had taught his own son the same lesson before ever Raphael spoke it: *Because that alms do deliver from death, and suffers not to come into darkness.* (Tobit 4:10). This is no merit-buying — it is the righteousness of the covenant kept, even in exile, that is filled with life.',
       sv.verse_id, ev.verse_id, 'extras', 59890
  FROM _session253_tob12_lookup sv, _session253_tob12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=12 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-12-reveal-the-works-of-god',
       E'Honourable to reveal the works of Elohim',
       E'Raphael calls the whole house to testimony: *Then he took them both apart, and said to them, Bless Yahuah (God), praise him, and magnify him, and praise him for the things which he has done to you in the sight of all that live...* (Tobit 12:6), and *It is good to keep close the secret of a king, but it is honourable to reveal the works of Yahuah (God). Do that which is good, and no evil shall touch you.* (Tobit 12:7). Mary''s song does just this — magnifying Yahuah for what he has done: *And Mary said, My soul doth magnify Yahuah (Lord),* (Luke 1:46), *For he that is mighty hath done to me great things; and holy is his name.* (Luke 1:49). And these ministering spirits exist for the heirs of salvation: *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* (Hebrews 1:14) — exactly what Raphael was to Tobit''s house.',
       sv.verse_id, ev.verse_id, 'extras', 59893
  FROM _session253_tob12_lookup sv, _session253_tob12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=12 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: tobit-12-seven-holy-angels
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 8:2 — *And I saw the seven angels which stood before Elohim (God); and to them were given seven trumpets.* John beholds the very seven holy angels Raphael names himself among in Tobit 12:15.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-seven-holy-angels'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 8:3 — *And another angel came and stood at the altar, having a golden censer; and there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne.* This is the heavenly office Raphael describes in Tobit 12:15 — an angel presenting the prayers of the saints at the throne.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-seven-holy-angels'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 8:4 — *And the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel’s hand.* The saints'' prayers rising before the glory of the Holy One is exactly what Raphael did with Tobit''s prayer in Tobit 12:15.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-seven-holy-angels'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=8 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 1:19 — *And the angel answering said unto him, I am Gabriel, that stand in the presence of Elohim (God); and am sent to speak unto thee, and to shew thee these glad tidings.* Gabriel self-identifies as one who stands before the glory of Elohim, the same station Raphael claims in Tobit 12:15.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-seven-holy-angels'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-12-prayers-remembered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 141:2 — *Let my prayer be set forth before thee as incense; and the lifting up of my hands as the evening sacrifice.* David asks that his prayer rise as incense before Yahuah, which is the very thing Raphael carried out in Tobit 12:12.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-prayers-remembered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=141 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 8:4 — *And the smoke of the incense, which came with the prayers of the saints, ascended up before Elohim (God) out of the angel’s hand.* The angel bearing the remembrance of prayers up to the throne matches Raphael bringing Tobit''s prayers before the Holy One in Tobit 12:12.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-prayers-remembered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=8 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 1:13 — *But the angel said unto him, Fear not, Zacharias: for thy prayer is heard; and thy wife Elisabeth shall bear thee a son, and thou shalt call his name John.* The prayer heard and answered by a sent angel is the pattern Raphael reveals to Tobit in Tobit 12:12.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-prayers-remembered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-12-refuses-worship
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 19:10 — *And I fell at his feet to worship him. And he said unto me, See thou do it not: I am thy fellowservant, and of thy brethren that have the testimony of Yahusha (Jesus): worship Elohim (God): for the testimony of Yahusha (Jesus) is the spirit of prophecy.* The angel refusing worship and redirecting it to Elohim is exactly Raphael''s word in Tobit 12:18.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-refuses-worship'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 22:9 — *Then saith he unto me, See thou do it not: for I am thy fellowservant, and of thy brethren the prophets, and of them which keep the sayings of this book: worship Elohim (God).* The same fellowservant who declines worship matches Raphael disclaiming any favour of his own in Tobit 12:18.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-refuses-worship'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 22:8 — *And I John saw these things, and heard them. And when I had heard and seen, I fell down to worship before the feet of the angel which shewed me these things.* John falling at the angel''s feet mirrors Tobit and Tobias falling on their faces before Raphael in Tobit 12:16.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-refuses-worship'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-12-go-up-to-him-that-sent-me
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 6:38 — *For I came down from heaven, not to do mine own will, but the will of him that sent me.* The posture of doing the will of the One who sent him, and returning to him, is Raphael''s own word in Tobit 12:20.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-go-up-to-him-that-sent-me'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 1:11 — *Saying, I am Alpha and Omega, the first and the last: and, What thou seest, write in a book, and send it unto the seven churches which are in Asia; unto Ephesus, and unto Smyrna, and unto Pergamos, and unto Thyatira, and unto Sardis, and unto Philadelphia, and unto Laodicea.* The command to write all things in a book is given to John just as Raphael commands Tobit in Tobit 12:20.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-go-up-to-him-that-sent-me'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 6:38 — *For I came down from heaven, not to do mine own will, but the will of him that sent me.* Raphael came not of his own favour but by the will of Elohim (Tobit 12:18), the very pattern of the Sent One.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-go-up-to-him-that-sent-me'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-12-alms-fasting-prayer
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 6:1 — *Take heed that ye do not your alms before men, to be seen of them: otherwise ye have no reward of your Father which is in heaven.* The good of almsgiving Raphael commends in Tobit 12:8 is the same alms Yahusha teaches, done before the Father not before men.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-alms-fasting-prayer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 6:6 — *But thou, when thou prayest, enter into thy closet, and when thou hast shut thy door, pray to thy Father which is in secret; and thy Father which seeth in secret shall reward thee openly.* The prayer Raphael calls good in Tobit 12:8 is the secret prayer Yahusha commends.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-alms-fasting-prayer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 6:18 — *That thou appear not unto men to fast, but unto thy Father which is in secret: and thy Father, which seeth in secret, shall reward thee openly.* The fasting Raphael joins to prayer and alms in Tobit 12:8 is the secret fasting Yahusha teaches.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-alms-fasting-prayer'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-12-alms-deliver-from-death
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 10:2 — *Treasures of wickedness profit nothing: but righteousness delivereth from death.* Solomon''s word that righteousness delivers from death is the very promise Raphael attaches to alms in Tobit 12:9.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-alms-deliver-from-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=10 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 11:4 — *Riches profit not in the day of wrath: but righteousness delivereth from death.* That righteousness, not hoarded gold, delivers from death echoes Raphael''s counsel in Tobit 12:9 that alms is better than laying up gold.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-alms-deliver-from-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Tobit 4:10 — *Because that alms do deliver from death, and suffers not to come into darkness.* Tobit had already taught his son the lesson Raphael now confirms from heaven in Tobit 12:9.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-alms-deliver-from-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-12-reveal-the-works-of-god
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 1:46 — *And Mary said, My soul doth magnify Yahuah (Lord),* Mary magnifies Yahuah just as Raphael commands the household to magnify and praise him in Tobit 12:6.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-reveal-the-works-of-god'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=46
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 1:49 — *For he that is mighty hath done to me great things; and holy is his name.* Praising Elohim for the great things he has done is the very response Raphael calls for in Tobit 12:6.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-reveal-the-works-of-god'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=49
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:14 — *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* This defines the office of the angel sent to heal Tobit and Sara in Tobit 12:14 — a ministering spirit sent for the heirs of salvation.'
  FROM cross_reference_threads t, cross_references x, _session253_tob12_lookup sv, _session253_tob12_lookup tv
 WHERE t.slug='tobit-12-reveal-the-works-of-god'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=12 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

