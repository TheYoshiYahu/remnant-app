-- ----- fragment: minion_1enoch_108.sql (session250 1-enoch 108) -----
-- Source anchor: enoch/1-enoch ch108. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en108 (view _session250_en108_lookup). Sort band base 52675, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en108_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-108-book-of-life-names-blotted
  ('enoch', '1-enoch', 108, 3, 'canon', 'malachi', 3, 16, 'free', E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* The book of remembrance for the righteous is the obverse of Enoch''s blotting — the elect are written before they are tested.'),
  ('enoch', '1-enoch', 108, 3, 'canon', 'daniel', 12, 1, 'free', E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* End-time deliverance belongs only to those already on the roll, the same register Enoch says cannot be augmented, only blotted.'),
  ('enoch', '1-enoch', 108, 3, 'canon', 'psalms', 69, 28, 'free', E'Psalm 69:28 — *Let them be blotted out of the book of the living, and not be written with the righteous.* The exact verb Enoch uses for the sinners'' names blotted from the book of life stands here in David''s prayer.'),
  ('enoch', '1-enoch', 108, 3, 'canon', 'revelation', 3, 5, 'free', E'Revelation 3:5 — *He that overcometh, the same shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels.* The kept name and the blotted name are the two outcomes of Enoch''s single book of life; the overcomer''s name is never erased.'),
  ('enoch', '1-enoch', 108, 3, 'enoch', '1-enoch', 48, 3, 'extras', E'1 Enoch 48:3 — *Yea, before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits.* Enoch''s own apparatus of names-named-before-creation grounds 108''s blotting — the roll is fixed before the world, never added to.'),
  -- thread: 1-enoch-108-spirits-of-the-righteous-shine
  ('enoch', '1-enoch', 108, 9, 'canon', 'deuteronomy', 32, 10, 'free', E'Deuteronomy 32:10 — *He found him in a desert land, and in the waste howling wilderness; he led him about, he instructed him, he kept him as the apple of his eye.* Enoch''s angelic guardians keep the righteous *as the apple of an eye* in the very words of the Song of Moses over Israel.'),
  ('enoch', '1-enoch', 108, 9, 'canon', 'psalms', 17, 8, 'free', E'Psalm 17:8 — *Keep me as the apple of the eye, hide me under the shadow of thy wings,* the believer''s prayer for exactly the guarding Enoch promises the holy ones.'),
  ('enoch', '1-enoch', 108, 9, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* Enoch''s *long sleep* with *nought to fear* is Daniel''s dust-sleep ending in everlasting life for the kept righteous.'),
  ('enoch', '1-enoch', 108, 10, 'canon', 'daniel', 12, 3, 'free', E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* Enoch''s *wise* seen *in security* are Daniel''s wise who shine as the firmament.'),
  ('enoch', '1-enoch', 108, 10, 'canon', 'matthew', 13, 43, 'free', E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* Yahusha gives the same shining-righteous resurrection that closes Enoch''s book.'),
  ('enoch', '1-enoch', 108, 9, 'apocrypha', 'the-wisdom-of-solomon', 3, 7, 'extras', E'Wisdom of Solomon 3:7 — *And in the time of their visitation they shall shine, and run to and fro like sparks among the stubble.* The parallel extra-canon resurrection hope matches Enoch''s wise shining in security after the long sleep.'),
  -- thread: 1-enoch-108-woe-to-the-sinners-fire
  ('enoch', '1-enoch', 108, 13, 'canon', 'isaiah', 66, 24, 'free', E'Isaiah 66:24 — *And they shall go forth, and look upon the carcases of the men that have transgressed against me: for their worm shall not die, neither shall their fire be quenched; and they shall be an abhorring unto all flesh.* The unquenchable fire that closes Isaiah is the *blazing flames burning worse than fire* that close Enoch.'),
  ('enoch', '1-enoch', 108, 13, 'canon', 'matthew', 13, 42, 'free', E'Matthew 13:42 — *And shall cast them into a furnace of fire: there shall be wailing and gnashing of teeth.* The furnace for the tares answers Enoch''s sinners burning *worse than fire* — the dark half of the parable whose light half shines the righteous.'),
  ('enoch', '1-enoch', 108, 11, 'enoch', '1-enoch', 104, 6, 'extras', E'1 Enoch 104:6 — *But woe to you, ye sinners, who are dead in your sins! Ye shall have no peace.* Enoch''s own running refrain of woe over the sinners frames the closing woes of 108.'),
  -- thread: 1-enoch-108-two-ways-choose-life
  ('enoch', '1-enoch', 108, 1, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* Enoch''s book for those who *observe the law in the last days* is the choosing of life over death, the two ways of the whole Epistle.'),
  ('enoch', '1-enoch', 108, 16, 'canon', 'james', 5, 1, 'free', E'James 5:1 — *Go to now, ye rich men, weep and howl for your miseries that shall come upon you.* James pronounces the same woe on the rich whose riches Enoch says *shall not be able to save them In the overthrow of their sins.*'),
  ('enoch', '1-enoch', 108, 16, 'canon', 'james', 5, 3, 'free', E'James 5:3 — *Your gold and silver is cankered; and the rust of them shall be a witness against you, and shall eat your flesh as it were fire. Ye have heaped treasure together for the last days.* The very gold and silver Enoch''s sinners bribe the rain with becomes the fire that eats them, witnessing against them in the last days.'),
  ('enoch', '1-enoch', 108, 10, 'canon', 'isaiah', 5, 8, 'free', E'Isaiah 5:8 — *Woe unto them that join house to house, that lay field to field, till there be no place, that they may be placed alone in the midst of the earth!* Isaiah''s woe on the land-grabbing rich is the system Enoch judges, whose riches cannot save in the overthrow of their sins.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en108_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en108_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-108-book-of-life-names-blotted',
       E'The names blotted from the book of life',
       E'The closing book of Enoch opens with a register kept in heaven: *Wait ye in patience until sin has passed away, For their names shall be blotted out of the book of life, And out of the books of the holy ones, And their seed shall be destroyed forever* (1 Enoch 108:3). Election runs the other way — the names are written first, never added, only blotted. The same ledger stands across the canon. The remnant who feared Yahuah are inscribed before they ever speak: *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name* (Malachi 3:16). Deliverance at the end belongs only to those already on the roll — *at that time thy people shall be delivered, every one that shall be found written in the book* (Daniel 12:1). The wicked are struck out: *Let them be blotted out of the book of the living, and not be written with the righteous* (Psalm 69:28). And the overcomer''s name is kept and confessed, never erased: *I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels* (Revelation 3:5) — election precedes confession, exactly as Enoch frames it.',
       sv.verse_id, ev.verse_id, 'extras', 52675
  FROM _session250_en108_lookup sv, _session250_en108_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=108 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=108 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-108-spirits-of-the-righteous-shine',
       E'The righteous sleep, awake, and shine in light',
       E'Enoch''s mystery turns from the fiery abyss for the sinners to the security of the righteous: *And over all the righteous and holy He will appoint guardians from amongst the holy angels To guard them as the apple of an eye... And though the righteous sleep a long sleep, they have nought to fear. And (then) the children of the earth shall see the wise in security* (1 Enoch 108:9-10). The guardianship is Yahuah''s own covenant figure for Israel: *He found him in a desert land... he kept him as the apple of his eye* (Deuteronomy 32:10), the cry the psalmist makes his own — *Keep me as the apple of the eye, hide me under the shadow of thy wings* (Psalm 17:8). The long sleep is the dust-sleep that ends in resurrection: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life... And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever* (Daniel 12:2-3) — the very wise of 108:10. The Master gives the same picture: *Then shall the righteous shine forth as the sun in the kingdom of their Father* (Matthew 13:43). And the parallel extra-canon resurrection oracle seals it — *the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them* (Wisdom of Solomon 3:1), *In the time of their visitation they shall shine, and run to and fro like sparks among the stubble* (Wisdom of Solomon 3:7). The righteous dead live and shine; this is no replacement of Israel but the awakening of the kept remnant.',
       sv.verse_id, ev.verse_id, 'extras', 52678
  FROM _session250_en108_lookup sv, _session250_en108_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=108 AND sv.verse_number=9
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=108 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-108-woe-to-the-sinners-fire',
       E'Woe to the sinners — burned worse than fire',
       E'The book ends in the woes of the Epistle: *Woe to you, ye sinners, on the day of strong anguish, Ye who afflict the righteous and burn them with fire: Ye shall be requited according to your works* (1 Enoch 108:11); *Woe to you, ye sinners, on account of the words of your mouth, And on account of the deeds of your hands... In blazing flames burning worse than fire shall ye burn* (1 Enoch 108:13). The fire that never quenches is the canon''s own last picture — *they shall go forth, and look upon the carcases of the men that have transgressed against me: for their worm shall not die, neither shall their fire be quenched* (Isaiah 66:24), the verse Yahusha pressed three times. The furnace of fire for the tares matches it precisely — Enoch''s *blazing flames* burning the sinner is the Master''s *furnace of fire: there shall be wailing and gnashing of teeth* (Matthew 13:42), the dark half of the same parable whose other half (13:43) lights the righteous. And Enoch''s own closing oath says the same of the unrepentant — *woe to you, ye sinners, who are dead in your sins! Ye shall have no peace* (1 Enoch 104:6). The woes fall on the oppressor who *afflicts the righteous and burns them*, requited *according to your works* — judgement of the system of cruelty, not arbitrary wrath.',
       sv.verse_id, ev.verse_id, 'extras', 52681
  FROM _session250_en108_lookup sv, _session250_en108_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=108 AND sv.verse_number=11
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=108 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-108-two-ways-choose-life',
       E'The two ways — the good keep the law to the end',
       E'The closing book is written for the doers of Torah: *Another book which Enoch wrote for his son Methuselah and for those who will come after him, And observe the law in the last days. Ye who have done good shall wait for those days in which the evil-doers are consumed* (1 Enoch 108:1-2). This is the two ways of the whole Epistle, set down once at Sinai''s gate: *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). The good *observe the law* and *wait* while the wicked are consumed — Torah is the way of life, never the curse. The other half of the page is the woe on the rich who afflict the righteous: Enoch''s *give presents to the rain... when it has received gold and silver from you that it may descend* (108:16) is the bribery the prophets damn, and the hoarder''s ruin James names plainly — *Go to now, ye rich men, weep and howl for your miseries that shall come upon you* (James 5:1), *Your gold and silver is cankered; and the rust of them shall be a witness against you, and shall eat your flesh as it were fire. Ye have heaped treasure together for the last days* (James 5:3). Isaiah pronounces the same woe on the land-grabbing systems — *Woe unto them that join house to house, that lay field to field, till there be no place* (Isaiah 5:8). The riches *shall not be able to save them In the overthrow of their sins* (108:10): the two ways divide the keeper of the law from the oppressor whose gold burns him.',
       sv.verse_id, ev.verse_id, 'extras', 52684
  FROM _session250_en108_lookup sv, _session250_en108_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=108 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=108 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-108-book-of-life-names-blotted
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* The book of remembrance for the righteous is the obverse of Enoch''s blotting — the elect are written before they are tested.'
  FROM cross_reference_threads t, cross_references x, _session250_en108_lookup sv, _session250_en108_lookup tv
 WHERE t.slug='1-enoch-108-book-of-life-names-blotted'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=108 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* End-time deliverance belongs only to those already on the roll, the same register Enoch says cannot be augmented, only blotted.'
  FROM cross_reference_threads t, cross_references x, _session250_en108_lookup sv, _session250_en108_lookup tv
 WHERE t.slug='1-enoch-108-book-of-life-names-blotted'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=108 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 69:28 — *Let them be blotted out of the book of the living, and not be written with the righteous.* The exact verb Enoch uses for the sinners'' names blotted from the book of life stands here in David''s prayer.'
  FROM cross_reference_threads t, cross_references x, _session250_en108_lookup sv, _session250_en108_lookup tv
 WHERE t.slug='1-enoch-108-book-of-life-names-blotted'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=108 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=69 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 3:5 — *He that overcometh, the same shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels.* The kept name and the blotted name are the two outcomes of Enoch''s single book of life; the overcomer''s name is never erased.'
  FROM cross_reference_threads t, cross_references x, _session250_en108_lookup sv, _session250_en108_lookup tv
 WHERE t.slug='1-enoch-108-book-of-life-names-blotted'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=108 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 48:3 — *Yea, before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits.* Enoch''s own apparatus of names-named-before-creation grounds 108''s blotting — the roll is fixed before the world, never added to.'
  FROM cross_reference_threads t, cross_references x, _session250_en108_lookup sv, _session250_en108_lookup tv
 WHERE t.slug='1-enoch-108-book-of-life-names-blotted'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=108 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-108-spirits-of-the-righteous-shine
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:10 — *He found him in a desert land, and in the waste howling wilderness; he led him about, he instructed him, he kept him as the apple of his eye.* Enoch''s angelic guardians keep the righteous *as the apple of an eye* in the very words of the Song of Moses over Israel.'
  FROM cross_reference_threads t, cross_references x, _session250_en108_lookup sv, _session250_en108_lookup tv
 WHERE t.slug='1-enoch-108-spirits-of-the-righteous-shine'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=108 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 17:8 — *Keep me as the apple of the eye, hide me under the shadow of thy wings,* the believer''s prayer for exactly the guarding Enoch promises the holy ones.'
  FROM cross_reference_threads t, cross_references x, _session250_en108_lookup sv, _session250_en108_lookup tv
 WHERE t.slug='1-enoch-108-spirits-of-the-righteous-shine'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=108 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=17 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* Enoch''s *long sleep* with *nought to fear* is Daniel''s dust-sleep ending in everlasting life for the kept righteous.'
  FROM cross_reference_threads t, cross_references x, _session250_en108_lookup sv, _session250_en108_lookup tv
 WHERE t.slug='1-enoch-108-spirits-of-the-righteous-shine'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=108 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* Enoch''s *wise* seen *in security* are Daniel''s wise who shine as the firmament.'
  FROM cross_reference_threads t, cross_references x, _session250_en108_lookup sv, _session250_en108_lookup tv
 WHERE t.slug='1-enoch-108-spirits-of-the-righteous-shine'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=108 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* Yahusha gives the same shining-righteous resurrection that closes Enoch''s book.'
  FROM cross_reference_threads t, cross_references x, _session250_en108_lookup sv, _session250_en108_lookup tv
 WHERE t.slug='1-enoch-108-spirits-of-the-righteous-shine'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=108 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Wisdom of Solomon 3:7 — *And in the time of their visitation they shall shine, and run to and fro like sparks among the stubble.* The parallel extra-canon resurrection hope matches Enoch''s wise shining in security after the long sleep.'
  FROM cross_reference_threads t, cross_references x, _session250_en108_lookup sv, _session250_en108_lookup tv
 WHERE t.slug='1-enoch-108-spirits-of-the-righteous-shine'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=108 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-108-woe-to-the-sinners-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 66:24 — *And they shall go forth, and look upon the carcases of the men that have transgressed against me: for their worm shall not die, neither shall their fire be quenched; and they shall be an abhorring unto all flesh.* The unquenchable fire that closes Isaiah is the *blazing flames burning worse than fire* that close Enoch.'
  FROM cross_reference_threads t, cross_references x, _session250_en108_lookup sv, _session250_en108_lookup tv
 WHERE t.slug='1-enoch-108-woe-to-the-sinners-fire'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=108 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 13:42 — *And shall cast them into a furnace of fire: there shall be wailing and gnashing of teeth.* The furnace for the tares answers Enoch''s sinners burning *worse than fire* — the dark half of the parable whose light half shines the righteous.'
  FROM cross_reference_threads t, cross_references x, _session250_en108_lookup sv, _session250_en108_lookup tv
 WHERE t.slug='1-enoch-108-woe-to-the-sinners-fire'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=108 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 104:6 — *But woe to you, ye sinners, who are dead in your sins! Ye shall have no peace.* Enoch''s own running refrain of woe over the sinners frames the closing woes of 108.'
  FROM cross_reference_threads t, cross_references x, _session250_en108_lookup sv, _session250_en108_lookup tv
 WHERE t.slug='1-enoch-108-woe-to-the-sinners-fire'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=108 AND sv.verse_number=11
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=104 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-108-two-ways-choose-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* Enoch''s book for those who *observe the law in the last days* is the choosing of life over death, the two ways of the whole Epistle.'
  FROM cross_reference_threads t, cross_references x, _session250_en108_lookup sv, _session250_en108_lookup tv
 WHERE t.slug='1-enoch-108-two-ways-choose-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=108 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 5:1 — *Go to now, ye rich men, weep and howl for your miseries that shall come upon you.* James pronounces the same woe on the rich whose riches Enoch says *shall not be able to save them In the overthrow of their sins.*'
  FROM cross_reference_threads t, cross_references x, _session250_en108_lookup sv, _session250_en108_lookup tv
 WHERE t.slug='1-enoch-108-two-ways-choose-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=108 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 5:3 — *Your gold and silver is cankered; and the rust of them shall be a witness against you, and shall eat your flesh as it were fire. Ye have heaped treasure together for the last days.* The very gold and silver Enoch''s sinners bribe the rain with becomes the fire that eats them, witnessing against them in the last days.'
  FROM cross_reference_threads t, cross_references x, _session250_en108_lookup sv, _session250_en108_lookup tv
 WHERE t.slug='1-enoch-108-two-ways-choose-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=108 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 5:8 — *Woe unto them that join house to house, that lay field to field, till there be no place, that they may be placed alone in the midst of the earth!* Isaiah''s woe on the land-grabbing rich is the system Enoch judges, whose riches cannot save in the overthrow of their sins.'
  FROM cross_reference_threads t, cross_references x, _session250_en108_lookup sv, _session250_en108_lookup tv
 WHERE t.slug='1-enoch-108-two-ways-choose-life'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=108 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

