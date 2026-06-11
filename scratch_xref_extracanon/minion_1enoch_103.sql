-- ----- fragment: minion_1enoch_103.sql (session250 1-enoch 103) -----
-- Source anchor: enoch/1-enoch ch103. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en103 (view _session250_en103_lookup). Sort band base 52550, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en103_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-103-oath-righteous-dead-shall-live
  ('enoch', '1-enoch', 103, 4, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The awakening Daniel sees is the very life Enoch swears the righteous spirits shall not lose.'),
  ('enoch', '1-enoch', 103, 4, 'canon', 'daniel', 12, 3, 'free', E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* The light Yahuah causes to appear on Enoch''s righteous (103:4) is Daniel''s firmament-shining.'),
  ('enoch', '1-enoch', 103, 4, 'canon', 'matthew', 13, 43, 'free', E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* Yahusha confirms the same shining of the righteous Enoch promises under oath.'),
  ('enoch', '1-enoch', 103, 7, 'apocrypha', 'the-wisdom-of-solomon', 3, 1, 'extras', E'The Wisdom of Solomon 3:1 — *But the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them.* The same safekeeping of the righteous spirits that Enoch swears shall not perish.'),
  ('enoch', '1-enoch', 103, 7, 'apocrypha', 'the-wisdom-of-solomon', 3, 4, 'extras', E'The Wisdom of Solomon 3:4 — *For though they be punished in the sight of men, yet is their hope full of immortality.* The hope full of immortality is the satisfied life Enoch swears the righteous shall have (103:7).'),
  -- thread: 1-enoch-103-names-written-books-of-life
  ('enoch', '1-enoch', 103, 3, 'canon', 'malachi', 3, 16, 'free', E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* The book of remembrance is the same heavenly register where Enoch sees the righteous already written (103:3).'),
  ('enoch', '1-enoch', 103, 9, 'canon', 'revelation', 20, 12, 'free', E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* The same opening of the books of the living and of the unrighteous that Enoch witnesses (103:9).'),
  ('enoch', '1-enoch', 103, 3, 'canon', 'revelation', 14, 13, 'free', E'Revelation 14:13 — *And I heard a voice from heaven saying unto me, Write, Blessed are the dead which die in Yahuah (Lord) from henceforth: Yea, saith the Spirit, that they may rest from their labours; and their works do follow them.* The blessing on the righteous dead, whose names stand in the books of life (103:3).'),
  ('enoch', '1-enoch', 103, 8, 'enoch', '1-enoch', 108, 3, 'extras', E'1 Enoch 108:3 — *Wait ye in patience until sin has passed away, For their names shall be blotted out of the book of life, And out of the books of the holy ones, And their seed shall be destroyed forever, And their spirits shall be slain, And they shall cry and lament in a waste place that has no water, And in the fire shall they burn.* Enoch''s own closing names what 103:8 promises the righteous will never suffer — the blotting falls only on the sinner.'),
  -- thread: 1-enoch-103-sinners-lot-darkness-sheol
  ('enoch', '1-enoch', 103, 10, 'canon', 'luke', 16, 23, 'free', E'Luke 16:23 — *And in hell he lift up his eyes, being in torments, and seeth Abraham afar off, and Lazarus in his bosom.* The torment-side of Sheol where Enoch sees the sinners'' spirits cast into darkness (103:10).'),
  ('enoch', '1-enoch', 103, 10, 'canon', 'luke', 16, 24, 'free', E'Luke 16:24 — *And he cried and said, Father Abraham, have mercy on me, and send Lazarus, that he may dip the tip of his finger in water, and cool my tongue; for I am tormented in this flame.* The cry from Sheol that Enoch says shall not be heard nor ascend to heaven (103:10-11).'),
  ('enoch', '1-enoch', 103, 9, 'canon', 'revelation', 20, 15, 'free', E'Revelation 20:15 — *And whosoever was not found written in the book of life was cast into the lake of fire.* The end of the names found in the books of the unrighteous that Enoch witnesses opened (103:9).'),
  -- thread: 1-enoch-103-woes-on-the-rich-oppressors
  ('enoch', '1-enoch', 103, 14, 'canon', 'isaiah', 5, 8, 'free', E'Isaiah 5:8 — *Woe unto them that join house to house, that lay field to field, till there be no place, that they may be placed alone in the midst of the earth!* Isaiah''s woe on land-grabbing greed matches Enoch''s woe on those who acquire gold and silver in unrighteousness (103:14-15).'),
  ('enoch', '1-enoch', 103, 15, 'canon', 'james', 5, 1, 'free', E'James 5:1 — *Go to now, ye rich men, weep and howl for your miseries that shall come upon you.* James opens the very woe Enoch pronounces on the rich whose glory shall not last (103:15, 24).'),
  ('enoch', '1-enoch', 103, 14, 'canon', 'james', 5, 4, 'free', E'James 5:4 — *Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth.* The defrauded labourers'' cry answers Enoch''s woe on those who tread upon the righteous with their might (103:14).'),
  ('enoch', '1-enoch', 103, 24, 'apocrypha', 'the-wisdom-of-solomon', 5, 8, 'extras', E'The Wisdom of Solomon 5:8 — *What has pride profited us? or what good has riches with our vaunting brought us?* The unmasked confession of the rich whose riches do not endure, just as Enoch declares (103:24).'),
  -- thread: 1-enoch-103-two-paths-righteousness
  ('enoch', '1-enoch', 103, 25, 'canon', 'deuteronomy', 30, 15, 'free', E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil.* Moses'' two ways are the very paths of righteousness and unrighteousness Enoch sets before his sons (103:25).'),
  ('enoch', '1-enoch', 103, 25, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live.* The choose-life command underlies Enoch''s path of righteousness over the path that is cut off (103:25).'),
  ('enoch', '1-enoch', 103, 25, 'canon', 'psalms', 1, 6, 'free', E'Psalm 1:6 — *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish.* The Psalter''s two ways are Enoch''s two paths, the way of unrighteousness that shall be cut off (103:25).'),
  ('enoch', '1-enoch', 103, 25, 'apocrypha', 'the-wisdom-of-solomon', 5, 15, 'extras', E'The Wisdom of Solomon 5:15 — *But the righteous live for evermore; their reward also is with Yahuah (God), and the care of them is with the Most High.* Where the path of righteousness ends — the everlasting life Enoch points his sons toward (103:25).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en103_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en103_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-103-oath-righteous-dead-shall-live',
       E'The oath: the righteous dead shall live and shine',
       E'Enoch swears it on oath — the righteous who died in faith are not lost: *"And the righteous shall be victorious in the name of Yahuah (God) of Spirits: And He will cause His light to appear on them, And He will make peace for them"* (1 Enoch 103:4), *"And as for the righteous, they shall be satisfied with life, And their spirits shall not perish"* (1 Enoch 103:7). This is the canon''s own resurrection hope. Daniel saw the same awakening: *"And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt"* (Daniel 12:2), and the wise *"shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever"* (Daniel 12:3). Yahusha sealed it: *"Then shall the righteous shine forth as the sun in the kingdom of their Father"* (Matthew 13:43). And the wisdom of the fathers said it plainly — *"But the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them"* (The Wisdom of Solomon 3:1), *"For though they be punished in the sight of men, yet is their hope full of immortality"* (The Wisdom of Solomon 3:4). It ain''t new — the light that appears on Enoch''s righteous is the same firmament-brightness Daniel and Yahusha promised.',
       sv.verse_id, ev.verse_id, 'extras', 52550
  FROM _session250_en103_lookup sv, _session250_en103_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=103 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=103 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-103-names-written-books-of-life',
       E'Names written in the books of life — election before confession',
       E'Enoch beholds the heavenly register: *"And I have beheld the books of life"* (1 Enoch 103:2), and the righteous are already there — *"your names are written in the books of life before the Most High"* (1 Enoch 103:3), *"their name shall not be blotted out"* (1 Enoch 103:8). The name is not earned at the end; it is written before, never added, only kept or blotted. Malachi saw the same book: *"a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name"* (Malachi 3:16). The book stands behind the judgement scene of Revelation: *"another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works"* (Revelation 20:12). And in the blessed-dead vision John heard, *"Blessed are the dead which die in Yahuah (Lord) from henceforth... that they may rest from their labours; and their works do follow them"* (Revelation 14:13). Enoch''s own closing seals which way the leaf turns — names are blotted, never inscribed late (1 Enoch 108:3). It ain''t new: election runs through the seed-line, written before the Most High, and the memorial of the righteous stands before Him.',
       sv.verse_id, ev.verse_id, 'extras', 52553
  FROM _session250_en103_lookup sv, _session250_en103_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=103 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=103 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-103-sinners-lot-darkness-sheol',
       E'The sinners'' lot: darkness and lament in Sheol',
       E'Over against the light made to appear on the righteous, Enoch sets the sinner''s portion: *"But woe to you, ye sinners, who are dead in your sins! Ye shall have no peace"* (1 Enoch 103:6), and *"their spirits shall be cast into darkness and destruction, And they shall cry out and lament in Sheol. And their cry shall not be heard, And their lamentation shall not ascend to heaven"* (1 Enoch 103:10-11). Yahusha drew the same hollow of Sheol in the rich man and Lazarus: *"And in hell he lift up his eyes, being in torments, and seeth Abraham afar off, and Lazarus in his bosom"* (Luke 16:23), *"I am tormented in this flame"* (Luke 16:24) — the cry that does not ascend. Revelation seals the end of the name not found: *"And whosoever was not found written in the book of life was cast into the lake of fire"* (Revelation 20:15). The contrast is not arbitrary cruelty but covenant requital — *"their deeds shall be requited according to their works"* (1 Enoch 103:12). The righteous enter peace; the sinner, dead in his sins, finds none.',
       sv.verse_id, ev.verse_id, 'extras', 52556
  FROM _session250_en103_lookup sv, _session250_en103_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=103 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=103 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-103-woes-on-the-rich-oppressors',
       E'Woes on the rich and the oppressors of the righteous',
       E'Enoch turns the woes on the unjust systems of wealth: *"Woe to you who eat all the best food, And drink wine in large bowls, And tread upon the righteous with your might"* (1 Enoch 103:14), *"Woe to you who acquire gold and silver in unrighteousness... Woe to you, O sinners! For your riches shall not endure, And your glory shall not last"* (1 Enoch 103:15, 24). The prophets and the brother of Yahusha sound the identical alarm against the same oppression — not against persons, but against the heaping of treasure and the defrauding of labourers. Isaiah: *"Woe unto them that join house to house, that lay field to field, till there be no place"* (Isaiah 5:8). James: *"Go to now, ye rich men, weep and howl for your miseries that shall come upon you"* (James 5:1), *"Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth"* (James 5:4). And the fathers'' wisdom, of those whose riches profited nothing: *"What has pride profited us? or what good has riches with our vaunting brought us?"* (The Wisdom of Solomon 5:8). It ain''t new — the woe falls on injustice and the systems that tread the righteous, and the riches gathered in unrighteousness do not endure.',
       sv.verse_id, ev.verse_id, 'extras', 52559
  FROM _session250_en103_lookup sv, _session250_en103_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=103 AND sv.verse_number=13
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=103 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-103-two-paths-righteousness',
       E'The two paths: the way of righteousness and the way cut off',
       E'Enoch closes the chapter with the choice that frames the whole Epistle: *"And now, my sons, listen to me, And I will show you the paths of righteousness, And the paths of unrighteousness, And I will show you how the paths of unrighteousness Shall be cut off"* (1 Enoch 103:25). This is the Torah''s set-before-you-life-and-death, the two ways. Moses laid it down: *"See, I have set before thee this day life and good, and death and evil"* (Deuteronomy 30:15), *"I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live"* (Deuteronomy 30:19). The Psalter opens on the same fork — the way of the righteous and the way that perishes (Psalm 1:6). And the wisdom of the fathers shows where the path of righteousness ends: *"But the righteous live for evermore; their reward also is with Yahuah (God), and the care of them is with the Most High"* (The Wisdom of Solomon 5:15). It ain''t new — Enoch''s two paths are Moses'' choose-life, the way of life that is the Torah, never the curse.',
       sv.verse_id, ev.verse_id, 'extras', 52562
  FROM _session250_en103_lookup sv, _session250_en103_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=103 AND sv.verse_number=25
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=103 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-103-oath-righteous-dead-shall-live
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The awakening Daniel sees is the very life Enoch swears the righteous spirits shall not lose.'
  FROM cross_reference_threads t, cross_references x, _session250_en103_lookup sv, _session250_en103_lookup tv
 WHERE t.slug='1-enoch-103-oath-righteous-dead-shall-live'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=103 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* The light Yahuah causes to appear on Enoch''s righteous (103:4) is Daniel''s firmament-shining.'
  FROM cross_reference_threads t, cross_references x, _session250_en103_lookup sv, _session250_en103_lookup tv
 WHERE t.slug='1-enoch-103-oath-righteous-dead-shall-live'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=103 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* Yahusha confirms the same shining of the righteous Enoch promises under oath.'
  FROM cross_reference_threads t, cross_references x, _session250_en103_lookup sv, _session250_en103_lookup tv
 WHERE t.slug='1-enoch-103-oath-righteous-dead-shall-live'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=103 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'The Wisdom of Solomon 3:1 — *But the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them.* The same safekeeping of the righteous spirits that Enoch swears shall not perish.'
  FROM cross_reference_threads t, cross_references x, _session250_en103_lookup sv, _session250_en103_lookup tv
 WHERE t.slug='1-enoch-103-oath-righteous-dead-shall-live'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=103 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'The Wisdom of Solomon 3:4 — *For though they be punished in the sight of men, yet is their hope full of immortality.* The hope full of immortality is the satisfied life Enoch swears the righteous shall have (103:7).'
  FROM cross_reference_threads t, cross_references x, _session250_en103_lookup sv, _session250_en103_lookup tv
 WHERE t.slug='1-enoch-103-oath-righteous-dead-shall-live'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=103 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-103-names-written-books-of-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* The book of remembrance is the same heavenly register where Enoch sees the righteous already written (103:3).'
  FROM cross_reference_threads t, cross_references x, _session250_en103_lookup sv, _session250_en103_lookup tv
 WHERE t.slug='1-enoch-103-names-written-books-of-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=103 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* The same opening of the books of the living and of the unrighteous that Enoch witnesses (103:9).'
  FROM cross_reference_threads t, cross_references x, _session250_en103_lookup sv, _session250_en103_lookup tv
 WHERE t.slug='1-enoch-103-names-written-books-of-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=103 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 14:13 — *And I heard a voice from heaven saying unto me, Write, Blessed are the dead which die in Yahuah (Lord) from henceforth: Yea, saith the Spirit, that they may rest from their labours; and their works do follow them.* The blessing on the righteous dead, whose names stand in the books of life (103:3).'
  FROM cross_reference_threads t, cross_references x, _session250_en103_lookup sv, _session250_en103_lookup tv
 WHERE t.slug='1-enoch-103-names-written-books-of-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=103 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 108:3 — *Wait ye in patience until sin has passed away, For their names shall be blotted out of the book of life, And out of the books of the holy ones, And their seed shall be destroyed forever, And their spirits shall be slain, And they shall cry and lament in a waste place that has no water, And in the fire shall they burn.* Enoch''s own closing names what 103:8 promises the righteous will never suffer — the blotting falls only on the sinner.'
  FROM cross_reference_threads t, cross_references x, _session250_en103_lookup sv, _session250_en103_lookup tv
 WHERE t.slug='1-enoch-103-names-written-books-of-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=103 AND sv.verse_number=8
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=108 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-103-sinners-lot-darkness-sheol
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 16:23 — *And in hell he lift up his eyes, being in torments, and seeth Abraham afar off, and Lazarus in his bosom.* The torment-side of Sheol where Enoch sees the sinners'' spirits cast into darkness (103:10).'
  FROM cross_reference_threads t, cross_references x, _session250_en103_lookup sv, _session250_en103_lookup tv
 WHERE t.slug='1-enoch-103-sinners-lot-darkness-sheol'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=103 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=16 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 16:24 — *And he cried and said, Father Abraham, have mercy on me, and send Lazarus, that he may dip the tip of his finger in water, and cool my tongue; for I am tormented in this flame.* The cry from Sheol that Enoch says shall not be heard nor ascend to heaven (103:10-11).'
  FROM cross_reference_threads t, cross_references x, _session250_en103_lookup sv, _session250_en103_lookup tv
 WHERE t.slug='1-enoch-103-sinners-lot-darkness-sheol'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=103 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=16 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 20:15 — *And whosoever was not found written in the book of life was cast into the lake of fire.* The end of the names found in the books of the unrighteous that Enoch witnesses opened (103:9).'
  FROM cross_reference_threads t, cross_references x, _session250_en103_lookup sv, _session250_en103_lookup tv
 WHERE t.slug='1-enoch-103-sinners-lot-darkness-sheol'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=103 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-103-woes-on-the-rich-oppressors
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 5:8 — *Woe unto them that join house to house, that lay field to field, till there be no place, that they may be placed alone in the midst of the earth!* Isaiah''s woe on land-grabbing greed matches Enoch''s woe on those who acquire gold and silver in unrighteousness (103:14-15).'
  FROM cross_reference_threads t, cross_references x, _session250_en103_lookup sv, _session250_en103_lookup tv
 WHERE t.slug='1-enoch-103-woes-on-the-rich-oppressors'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=103 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 5:1 — *Go to now, ye rich men, weep and howl for your miseries that shall come upon you.* James opens the very woe Enoch pronounces on the rich whose glory shall not last (103:15, 24).'
  FROM cross_reference_threads t, cross_references x, _session250_en103_lookup sv, _session250_en103_lookup tv
 WHERE t.slug='1-enoch-103-woes-on-the-rich-oppressors'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=103 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 5:4 — *Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth.* The defrauded labourers'' cry answers Enoch''s woe on those who tread upon the righteous with their might (103:14).'
  FROM cross_reference_threads t, cross_references x, _session250_en103_lookup sv, _session250_en103_lookup tv
 WHERE t.slug='1-enoch-103-woes-on-the-rich-oppressors'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=103 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'The Wisdom of Solomon 5:8 — *What has pride profited us? or what good has riches with our vaunting brought us?* The unmasked confession of the rich whose riches do not endure, just as Enoch declares (103:24).'
  FROM cross_reference_threads t, cross_references x, _session250_en103_lookup sv, _session250_en103_lookup tv
 WHERE t.slug='1-enoch-103-woes-on-the-rich-oppressors'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=103 AND sv.verse_number=24
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-103-two-paths-righteousness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil.* Moses'' two ways are the very paths of righteousness and unrighteousness Enoch sets before his sons (103:25).'
  FROM cross_reference_threads t, cross_references x, _session250_en103_lookup sv, _session250_en103_lookup tv
 WHERE t.slug='1-enoch-103-two-paths-righteousness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=103 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live.* The choose-life command underlies Enoch''s path of righteousness over the path that is cut off (103:25).'
  FROM cross_reference_threads t, cross_references x, _session250_en103_lookup sv, _session250_en103_lookup tv
 WHERE t.slug='1-enoch-103-two-paths-righteousness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=103 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 1:6 — *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish.* The Psalter''s two ways are Enoch''s two paths, the way of unrighteousness that shall be cut off (103:25).'
  FROM cross_reference_threads t, cross_references x, _session250_en103_lookup sv, _session250_en103_lookup tv
 WHERE t.slug='1-enoch-103-two-paths-righteousness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=103 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'The Wisdom of Solomon 5:15 — *But the righteous live for evermore; their reward also is with Yahuah (God), and the care of them is with the Most High.* Where the path of righteousness ends — the everlasting life Enoch points his sons toward (103:25).'
  FROM cross_reference_threads t, cross_references x, _session250_en103_lookup sv, _session250_en103_lookup tv
 WHERE t.slug='1-enoch-103-two-paths-righteousness'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=103 AND sv.verse_number=25
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

