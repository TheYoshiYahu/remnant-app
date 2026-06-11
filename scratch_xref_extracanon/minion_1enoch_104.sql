-- ----- fragment: minion_1enoch_104.sql (session250 1-enoch 104) -----
-- Source anchor: enoch/1-enoch ch104. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en104 (view _session250_en104_lookup). Sort band base 52575, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en104_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-104-righteous-shine
  ('enoch', '1-enoch', 104, 4, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The awakening of the dust-sleepers is the very resurrection Enoch promises the righteous in 104:2-5.'),
  ('enoch', '1-enoch', 104, 4, 'canon', 'daniel', 12, 3, 'free', E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* Yahuah causing His light to appear on the righteous (104:4) is Daniel''s wise shining as the firmament.'),
  ('enoch', '1-enoch', 104, 4, 'canon', 'matthew', 13, 43, 'free', E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* Yahusha seals Enoch''s promise: the righteous shine in the Father''s kingdom.'),
  ('enoch', '1-enoch', 104, 5, 'apocrypha', 'the-wisdom-of-solomon', 3, 7, 'extras', E'the Wisdom of Solomon 3:7 — *And in the time of their visitation they shall shine, and run to and fro like sparks among the stubble.* The same extra-canonical resurrection-shining: the righteous vindicated and luminous at their visitation.'),
  -- thread: 1-enoch-104-names-written-books-of-life
  ('enoch', '1-enoch', 104, 3, 'canon', 'malachi', 3, 16, 'free', E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* The book of remembrance is the same heavenly register where the righteous names of 104:3 are written before the Most High.'),
  ('enoch', '1-enoch', 104, 3, 'canon', 'daniel', 12, 1, 'free', E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* Deliverance belongs to every one written in the book — Enoch''s elect whose names stand before the Most High.'),
  ('enoch', '1-enoch', 104, 8, 'canon', 'psalms', 69, 28, 'free', E'Psalm 69:28 — *Let them be blotted out of the book of the living, and not be written with the righteous.* Enoch''s righteous name shall NOT be blotted out (104:8); the wicked are blotted, never the elect written-in.'),
  ('enoch', '1-enoch', 104, 8, 'canon', 'revelation', 3, 5, 'free', E'Revelation 3:5 — *He that overcometh, the same shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels.* Yahusha''s promise not to blot the overcomer''s name is Enoch''s name that shall not be blotted out.'),
  ('enoch', '1-enoch', 104, 8, 'enoch', '1-enoch', 108, 3, 'extras', E'1 Enoch 108:3 — *Wait ye in patience until sin has passed away, For their names shall be blotted out of the book of life, And out of the books of the holy ones, And their seed shall be destroyed forever, And their spirits shall be slain, And they shall cry and lament in a waste place that has no water, And in the fire shall they burn.* Enoch''s own closing book confirms the asymmetry: the wicked are blotted out, while the righteous name of 104:8 endures.'),
  -- thread: 1-enoch-104-books-opened-judgment
  ('enoch', '1-enoch', 104, 9, 'canon', 'revelation', 20, 12, 'free', E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* John''s opened books are Enoch''s books of the living and of the unrighteous opened in 104:9.'),
  ('enoch', '1-enoch', 104, 12, 'canon', 'revelation', 20, 15, 'free', E'Revelation 20:15 — *And whosoever was not found written in the book of life was cast into the lake of fire.* The fire that receives the unwritten is the darkness and destruction into which Enoch''s sinners are cast (104:10-12).'),
  -- thread: 1-enoch-104-woe-to-the-rich
  ('enoch', '1-enoch', 104, 15, 'canon', 'isaiah', 5, 8, 'free', E'Isaiah 5:8 — *Woe unto them that join house to house, that lay field to field, till there be no place, that they may be placed alone in the midst of the earth!* Isaiah''s woe on the land-engrossers matches Enoch''s woe on those who acquire gold and silver in unrighteousness (104:15).'),
  ('enoch', '1-enoch', 104, 14, 'canon', 'james', 5, 1, 'free', E'James 5:1 — *Go to now, ye rich men, weep and howl for your miseries that shall come upon you.* James echoes Enoch''s woe on the rich who tread upon the righteous with their might (104:14).'),
  ('enoch', '1-enoch', 104, 17, 'canon', 'james', 5, 4, 'free', E'James 5:4 — *Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth.* The defrauded labourers'' cry is the very system Enoch indicts — the many husbandmen and labourers feeding the granaries of the rich (104:16-18).'),
  -- thread: 1-enoch-104-paths-of-righteousness-two-ways
  ('enoch', '1-enoch', 104, 25, 'canon', 'deuteronomy', 30, 15, 'free', E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* Moses sets the same two ways Enoch shows his sons — the paths of righteousness and of unrighteousness (104:25).'),
  ('enoch', '1-enoch', 104, 25, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* The call to choose life is the choice Enoch lays out in showing the paths and how unrighteousness shall be cut off (104:25).'),
  ('enoch', '1-enoch', 104, 25, 'canon', 'psalms', 1, 6, 'free', E'Psalm 1:6 — *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish.* The two ways of the Psalter — and the perishing of the ungodly way — is the cutting off of the path of unrighteousness in 104:25.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en104_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en104_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-104-righteous-shine',
       E'The righteous shall shine — companions of the host of heaven',
       E'Enoch sees the destiny of the elect dead: *And the righteous shall be victorious in the name of Yahuah (God) of Spirits: And He will cause His light to appear on them, And He will make peace for them.* (1 Enoch 104:4). This is the resurrection-glory of Daniel: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2), where *they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* (Daniel 12:3). Yahusha names the same hope: *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* (Matthew 13:43). And the parallel extra-canonical witness, the Wisdom of Solomon, sees the persecuted righteous vindicated: *And in the time of their visitation they shall shine, and run to and fro like sparks among the stubble.* (the Wisdom of Solomon 3:7). The light is not earned but caused to appear — election precedes the shining.',
       sv.verse_id, ev.verse_id, 'extras', 52575
  FROM _session250_en104_lookup sv, _session250_en104_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=104 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=104 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-104-names-written-books-of-life',
       E'Your names are written in the books of life — never blotted out',
       E'Election runs through the seed-line and is recorded before confession: *And your spirits have been found worthy of the lot of the righteous, And your names are written in the books of life before the Most High.* (1 Enoch 104:3), and again *And their memorial shall be before the Most High, And their name shall not be blotted out.* (1 Enoch 104:8). This is the canon''s book of remembrance: *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* (Malachi 3:16). Daniel ties deliverance to that same book — *and at that time thy people shall be delivered, every one that shall be found written in the book.* (Daniel 12:1). The names are blotted, never added: *Let them be blotted out of the book of the living, and not be written with the righteous.* (Psalm 69:28), which Yahusha confirms — *He that overcometh, the same shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels.* (Revelation 3:5). Enoch''s own closing seals the warning for the wicked: *their names shall be blotted out of the book of life* (1 Enoch 108:3).',
       sv.verse_id, ev.verse_id, 'extras', 52578
  FROM _session250_en104_lookup sv, _session250_en104_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=104 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=104 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-104-books-opened-judgment',
       E'The books of the living opened — judged according to their works',
       E'Enoch sees the heavenly assize: *And I saw the books of the living, And the books of the unrighteous were opened, And the names of the sinners were found therein.* (1 Enoch 104:9), and their *deeds shall be requited according to their works, And according to the measure of their unrighteousness.* (1 Enoch 104:12). This is the white-throne scene John saw — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* (Revelation 20:12), where *whosoever was not found written in the book of life was cast into the lake of fire.* (Revelation 20:15). The wicked spirits *shall be cast into darkness and destruction* (1 Enoch 104:10) — judged for breaking the covenant, by the measure of their own deeds; the books, not arbitrary verdict, do the work.',
       sv.verse_id, ev.verse_id, 'extras', 52581
  FROM _session250_en104_lookup sv, _session250_en104_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=104 AND sv.verse_number=9
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=104 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-104-woe-to-the-rich',
       E'Woe to you who acquire gold and silver in unrighteousness',
       E'The woes of the Epistle fall on the systems of oppression — the rich who trample the poor: *Woe to you who acquire gold and silver in unrighteousness, And say: "We have become rich with riches and have possessions; And we have acquired everything that we have desired."* (1 Enoch 104:15), who *tread upon the righteous with your might.* (1 Enoch 104:14). Isaiah cried the same woe against the land-grabbers — *Woe unto them that join house to house, that lay field to field, till there be no place, that they may be placed alone in the midst of the earth!* (Isaiah 5:8). James turns it on the hoarders of the last days: *Go to now, ye rich men, weep and howl for your miseries that shall come upon you.* (James 5:1), for *the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth.* (James 5:4). The woe targets the unjust system — wealth wrung from the labourers (104:17-18) — not the persons; their riches *shall not endure* (1 Enoch 104:24).',
       sv.verse_id, ev.verse_id, 'extras', 52584
  FROM _session250_en104_lookup sv, _session250_en104_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=104 AND sv.verse_number=13
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=104 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-104-paths-of-righteousness-two-ways',
       E'I will show you the paths of righteousness — the two ways',
       E'Enoch closes the chapter as a father setting the two ways before his sons: *And now, my sons, listen to me, And I will show you the paths of righteousness, And the paths of unrighteousness, And I will show you how the paths of unrighteousness Shall be cut off.* (1 Enoch 104:25). This is Moses'' charge — *See, I have set before thee this day life and good, and death and evil;* (Deuteronomy 30:15), pressed to its choice: *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* (Deuteronomy 30:19). The Psalter frames the same fork — *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish.* (Psalm 1:6) — and the path of unrighteousness shall be cut off. Torah is the way of life, never the curse; the righteous keep it, and the satisfied life of 104:7 is its reward.',
       sv.verse_id, ev.verse_id, 'extras', 52587
  FROM _session250_en104_lookup sv, _session250_en104_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=104 AND sv.verse_number=25
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=104 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-104-righteous-shine
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The awakening of the dust-sleepers is the very resurrection Enoch promises the righteous in 104:2-5.'
  FROM cross_reference_threads t, cross_references x, _session250_en104_lookup sv, _session250_en104_lookup tv
 WHERE t.slug='1-enoch-104-righteous-shine'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=104 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* Yahuah causing His light to appear on the righteous (104:4) is Daniel''s wise shining as the firmament.'
  FROM cross_reference_threads t, cross_references x, _session250_en104_lookup sv, _session250_en104_lookup tv
 WHERE t.slug='1-enoch-104-righteous-shine'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=104 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* Yahusha seals Enoch''s promise: the righteous shine in the Father''s kingdom.'
  FROM cross_reference_threads t, cross_references x, _session250_en104_lookup sv, _session250_en104_lookup tv
 WHERE t.slug='1-enoch-104-righteous-shine'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=104 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'the Wisdom of Solomon 3:7 — *And in the time of their visitation they shall shine, and run to and fro like sparks among the stubble.* The same extra-canonical resurrection-shining: the righteous vindicated and luminous at their visitation.'
  FROM cross_reference_threads t, cross_references x, _session250_en104_lookup sv, _session250_en104_lookup tv
 WHERE t.slug='1-enoch-104-righteous-shine'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=104 AND sv.verse_number=5
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-104-names-written-books-of-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* The book of remembrance is the same heavenly register where the righteous names of 104:3 are written before the Most High.'
  FROM cross_reference_threads t, cross_references x, _session250_en104_lookup sv, _session250_en104_lookup tv
 WHERE t.slug='1-enoch-104-names-written-books-of-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=104 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* Deliverance belongs to every one written in the book — Enoch''s elect whose names stand before the Most High.'
  FROM cross_reference_threads t, cross_references x, _session250_en104_lookup sv, _session250_en104_lookup tv
 WHERE t.slug='1-enoch-104-names-written-books-of-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=104 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 69:28 — *Let them be blotted out of the book of the living, and not be written with the righteous.* Enoch''s righteous name shall NOT be blotted out (104:8); the wicked are blotted, never the elect written-in.'
  FROM cross_reference_threads t, cross_references x, _session250_en104_lookup sv, _session250_en104_lookup tv
 WHERE t.slug='1-enoch-104-names-written-books-of-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=104 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=69 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 3:5 — *He that overcometh, the same shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels.* Yahusha''s promise not to blot the overcomer''s name is Enoch''s name that shall not be blotted out.'
  FROM cross_reference_threads t, cross_references x, _session250_en104_lookup sv, _session250_en104_lookup tv
 WHERE t.slug='1-enoch-104-names-written-books-of-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=104 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 108:3 — *Wait ye in patience until sin has passed away, For their names shall be blotted out of the book of life, And out of the books of the holy ones, And their seed shall be destroyed forever, And their spirits shall be slain, And they shall cry and lament in a waste place that has no water, And in the fire shall they burn.* Enoch''s own closing book confirms the asymmetry: the wicked are blotted out, while the righteous name of 104:8 endures.'
  FROM cross_reference_threads t, cross_references x, _session250_en104_lookup sv, _session250_en104_lookup tv
 WHERE t.slug='1-enoch-104-names-written-books-of-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=104 AND sv.verse_number=8
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=108 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-104-books-opened-judgment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* John''s opened books are Enoch''s books of the living and of the unrighteous opened in 104:9.'
  FROM cross_reference_threads t, cross_references x, _session250_en104_lookup sv, _session250_en104_lookup tv
 WHERE t.slug='1-enoch-104-books-opened-judgment'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=104 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 20:15 — *And whosoever was not found written in the book of life was cast into the lake of fire.* The fire that receives the unwritten is the darkness and destruction into which Enoch''s sinners are cast (104:10-12).'
  FROM cross_reference_threads t, cross_references x, _session250_en104_lookup sv, _session250_en104_lookup tv
 WHERE t.slug='1-enoch-104-books-opened-judgment'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=104 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-104-woe-to-the-rich
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 5:8 — *Woe unto them that join house to house, that lay field to field, till there be no place, that they may be placed alone in the midst of the earth!* Isaiah''s woe on the land-engrossers matches Enoch''s woe on those who acquire gold and silver in unrighteousness (104:15).'
  FROM cross_reference_threads t, cross_references x, _session250_en104_lookup sv, _session250_en104_lookup tv
 WHERE t.slug='1-enoch-104-woe-to-the-rich'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=104 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 5:1 — *Go to now, ye rich men, weep and howl for your miseries that shall come upon you.* James echoes Enoch''s woe on the rich who tread upon the righteous with their might (104:14).'
  FROM cross_reference_threads t, cross_references x, _session250_en104_lookup sv, _session250_en104_lookup tv
 WHERE t.slug='1-enoch-104-woe-to-the-rich'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=104 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 5:4 — *Behold, the hire of the labourers who have reaped down your fields, which is of you kept back by fraud, crieth: and the cries of them which have reaped are entered into the ears of Yahuah (Lord) of sabaoth.* The defrauded labourers'' cry is the very system Enoch indicts — the many husbandmen and labourers feeding the granaries of the rich (104:16-18).'
  FROM cross_reference_threads t, cross_references x, _session250_en104_lookup sv, _session250_en104_lookup tv
 WHERE t.slug='1-enoch-104-woe-to-the-rich'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=104 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-104-paths-of-righteousness-two-ways
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* Moses sets the same two ways Enoch shows his sons — the paths of righteousness and of unrighteousness (104:25).'
  FROM cross_reference_threads t, cross_references x, _session250_en104_lookup sv, _session250_en104_lookup tv
 WHERE t.slug='1-enoch-104-paths-of-righteousness-two-ways'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=104 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* The call to choose life is the choice Enoch lays out in showing the paths and how unrighteousness shall be cut off (104:25).'
  FROM cross_reference_threads t, cross_references x, _session250_en104_lookup sv, _session250_en104_lookup tv
 WHERE t.slug='1-enoch-104-paths-of-righteousness-two-ways'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=104 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 1:6 — *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish.* The two ways of the Psalter — and the perishing of the ungodly way — is the cutting off of the path of unrighteousness in 104:25.'
  FROM cross_reference_threads t, cross_references x, _session250_en104_lookup sv, _session250_en104_lookup tv
 WHERE t.slug='1-enoch-104-paths-of-righteousness-two-ways'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=104 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

