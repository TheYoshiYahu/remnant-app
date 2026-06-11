-- ----- fragment: minion_1enoch_105.sql (session250 1-enoch 105) -----
-- Source anchor: enoch/1-enoch ch105. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en105 (view _session250_en105_lookup). Sort band base 52600, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en105_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-105-names-known-memorial
  ('enoch', '1-enoch', 105, 2, 'canon', 'malachi', 3, 16, 'free', E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* The Most High knowing the names of the righteous (Enoch 105:2) is the book of remembrance kept for those who fear Him.'),
  ('enoch', '1-enoch', 105, 2, 'canon', 'daniel', 12, 1, 'free', E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* The memorial before Him (Enoch 105:2) is deliverance for every name already written in the book — election before the trouble, not after.'),
  ('enoch', '1-enoch', 105, 1, 'canon', 'matthew', 13, 42, 'free', E'Matthew 13:42 — *And shall cast them into a furnace of fire: there shall be wailing and gnashing of teeth.* The sinner''s end as the lake of fire (Enoch 105:1) is the canon''s furnace into which the tares of the seed-war are gathered.'),
  -- thread: 1-enoch-105-righteous-inherit-the-earth
  ('enoch', '1-enoch', 105, 3, 'canon', 'psalms', 37, 29, 'free', E'Psalm 37:29 — *The righteous shall inherit the land, and dwell therein for ever.* Word for word the promise of Enoch 105:3 — the righteous inherit and dwell in the land for ever and ever.'),
  ('enoch', '1-enoch', 105, 3, 'canon', 'psalms', 37, 9, 'free', E'Psalm 37:9 — *For evildoers shall be cut off: but those that wait upon Yahuah (LORD), they shall inherit the earth.* The inheritance of Enoch 105:3 is for those who wait on Yahuah, set against the evildoers who are cut off.'),
  ('enoch', '1-enoch', 105, 3, 'canon', 'matthew', 5, 5, 'free', E'Matthew 5:5 — *Blessed are the meek: for they shall inherit the earth.* Yahusha''s beatitude is Enoch''s promise (105:3) spoken from the mount — the same inheritance for the same kept people.'),
  ('enoch', '1-enoch', 105, 3, 'canon', 'daniel', 7, 27, 'free', E'Daniel 7:27 — *And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him.* The forever-and-ever dwelling of Enoch 105:3 is the everlasting kingdom handed to the saints of the Most High.'),
  -- thread: 1-enoch-105-shine-as-the-lights-of-heaven
  ('enoch', '1-enoch', 105, 4, 'canon', 'daniel', 12, 3, 'free', E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* The righteous shining as the lights of heaven (Enoch 105:4) is Daniel''s wise shining as the firmament and the stars.'),
  ('enoch', '1-enoch', 105, 4, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* Before they shine (Enoch 105:4) the righteous dead must awake from the dust — the resurrection underwriting the glory.'),
  ('enoch', '1-enoch', 105, 4, 'canon', 'matthew', 13, 43, 'free', E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* Yahusha names the same shining the righteous of Enoch 105:4 are promised, in the kingdom of the Father.'),
  ('enoch', '1-enoch', 105, 4, 'canon', 'isaiah', 26, 19, 'free', E'Isaiah 26:19 — *Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead.* The glory of Enoch 105:4 rests on the dust giving back its dead, that they who dwell in dust awake and sing.'),
  ('enoch', '1-enoch', 105, 4, 'apocrypha', 'the-wisdom-of-solomon', 3, 7, 'extras', E'the Wisdom of Solomon 3:7 — *And in the time of their visitation they shall shine, and run to and fro like sparks among the stubble.* The parallel extra-canon witness gives the same image as Enoch 105:4 — the righteous shining at their visitation.'),
  -- thread: 1-enoch-105-most-high-arises-in-wrath
  ('enoch', '1-enoch', 105, 6, 'canon', 'isaiah', 66, 15, 'free', E'Isaiah 66:15 — *For, behold, Yahuah (LORD) will come with fire, and with his chariots like a whirlwind, to render his anger with fury, and his rebuke with flames of fire.* The Most High arising in wrath (Enoch 105:6) is Yahuah coming with fire and the chariots of His fury.'),
  ('enoch', '1-enoch', 105, 6, 'canon', 'isaiah', 66, 16, 'free', E'Isaiah 66:16 — *For by fire and by his sword will Yahuah (LORD) plead with all flesh: and the slain of Yahuah (LORD) shall be many.* Judgement executed upon all flesh (Enoch 105:6) is Yahuah pleading by fire and sword with all flesh.'),
  ('enoch', '1-enoch', 105, 6, 'canon', '2-thessalonians', 1, 8, 'free', E'2 Thessalonians 1:8 — *In flaming fire taking vengeance on them that know not Elohim (God), and that obey not the gospel of our Lord Yahusha HaMashiach (Lord Jesus Christ).* The destruction of the ungodly from off the earth (Enoch 105:6) is the flaming-fire vengeance at the revealing of Yahusha.'),
  ('enoch', '1-enoch', 105, 5, 'canon', 'jude', 1, 14, 'free', E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints.* The near day of the sinners (Enoch 105:5) is the coming Enoch himself prophesied, which Jude quotes as Scripture — it ain''t new.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en105_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en105_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-105-names-known-memorial',
       E'Your names are known, your memorial is before Him',
       E'Enoch comforts the elect dead and the living righteous: *Fear not, ye righteous, For Yahuah (God) of Spirits knows your names, And your memorial is before Him* (1 Enoch 105:2). Election precedes confession — the righteous are not a self-selected class but a people whose names are already kept. This is the framework''s book of remembrance: *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name* (Malachi 3:16) — and the deliverance written in the book, *at that time thy people shall be delivered, every one that shall be found written in the book* (Daniel 12:1). The sinner''s opposite is *their memorial is destruction, And their end is the lake of fire* (1 Enoch 105:1), the same furnace the canon names in *And shall cast them into a furnace of fire: there shall be wailing and gnashing of teeth* (Matthew 13:42). The righteous are remembered; the wicked are forgotten.',
       sv.verse_id, ev.verse_id, 'extras', 52600
  FROM _session250_en105_lookup sv, _session250_en105_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=105 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=105 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-105-righteous-inherit-the-earth',
       E'The righteous shall inherit the earth forever',
       E'The inheritance of the meek runs straight from Enoch through the Psalter into the Gospel: *And the righteous shall inherit the earth, And they shall dwell therein forever and ever* (1 Enoch 105:3). This is no church-replacing-Israel hope; it is the covenant land-inheritance of the elect seed-line. The Psalter says it twice over: *For evildoers shall be cut off: but those that wait upon Yahuah (LORD), they shall inherit the earth* (Psalm 37:9) and *The righteous shall inherit the land, and dwell therein for ever* (Psalm 37:29). Yahusha sets it as a beatitude — *Blessed are the meek: for they shall inherit the earth* (Matthew 5:5) — and the everlasting kingdom is given to the very people Enoch names: *And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him* (Daniel 7:27). Torah''s promise of the land stands; the meek do not earn it — they wait on Yahuah and are kept.',
       sv.verse_id, ev.verse_id, 'extras', 52603
  FROM _session250_en105_lookup sv, _session250_en105_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=105 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=105 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-105-shine-as-the-lights-of-heaven',
       E'They shall shine as the lights of heaven',
       E'Here is the resurrection-glory of the righteous dead, the Epistle''s great hope: *And their glory shall be great, And they shall shine as the lights of heaven, And they shall be companions of the holy ones* (1 Enoch 105:4). Daniel says it of the awakened sleepers: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2), *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever* (Daniel 12:3). Yahusha repeats it exactly — *Then shall the righteous shine forth as the sun in the kingdom of their Father* (Matthew 13:43) — and Isaiah promises the dust will give back its dead: *Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead* (Isaiah 26:19). The parallel extra-canon witness shines with the same light: *And in the time of their visitation they shall shine, and run to and fro like sparks among the stubble* (the Wisdom of Solomon 3:7). Election precedes confession; the names are written first, then they wake and shine.',
       sv.verse_id, ev.verse_id, 'extras', 52606
  FROM _session250_en105_lookup sv, _session250_en105_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=105 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=105 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-105-most-high-arises-in-wrath',
       E'The Most High arises in wrath against all flesh',
       E'The chapter closes on the day of judgement against the oppressor: *And fear not the sinners, For their day is near, And their destruction is at hand* (1 Enoch 105:5), *And the Most High will arise in His wrath, And execute judgment upon all flesh, And destroy the ungodly from off the earth* (1 Enoch 105:6). The judgement falls not on persons for personhood but on the ungodly systems that pervert the eternal order — and it comes in the fire the prophets foresaw: *For, behold, Yahuah (LORD) will come with fire, and with his chariots like a whirlwind, to render his anger with fury, and his rebuke with flames of fire* (Isaiah 66:15), *For by fire and by his sword will Yahuah (LORD) plead with all flesh: and the slain of Yahuah (LORD) shall be many* (Isaiah 66:16). The New Testament binds it to the revealing of Yahusha: *And to you who are troubled rest with us, when the Lord Yahusha (Lord Jesus) shall be revealed from heaven with his mighty angels* (2 Thessalonians 1:7), *In flaming fire taking vengeance on them that know not Elohim (God), and that obey not the gospel of our Lord Yahusha HaMashiach (Lord Jesus Christ)* (2 Thessalonians 1:8). This is the very coming Enoch himself prophesied, quoted in the canon: *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints* (Jude 1:14). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 52609
  FROM _session250_en105_lookup sv, _session250_en105_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=105 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=105 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-105-names-known-memorial
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* The Most High knowing the names of the righteous (Enoch 105:2) is the book of remembrance kept for those who fear Him.'
  FROM cross_reference_threads t, cross_references x, _session250_en105_lookup sv, _session250_en105_lookup tv
 WHERE t.slug='1-enoch-105-names-known-memorial'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=105 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* The memorial before Him (Enoch 105:2) is deliverance for every name already written in the book — election before the trouble, not after.'
  FROM cross_reference_threads t, cross_references x, _session250_en105_lookup sv, _session250_en105_lookup tv
 WHERE t.slug='1-enoch-105-names-known-memorial'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=105 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 13:42 — *And shall cast them into a furnace of fire: there shall be wailing and gnashing of teeth.* The sinner''s end as the lake of fire (Enoch 105:1) is the canon''s furnace into which the tares of the seed-war are gathered.'
  FROM cross_reference_threads t, cross_references x, _session250_en105_lookup sv, _session250_en105_lookup tv
 WHERE t.slug='1-enoch-105-names-known-memorial'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=105 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-105-righteous-inherit-the-earth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 37:29 — *The righteous shall inherit the land, and dwell therein for ever.* Word for word the promise of Enoch 105:3 — the righteous inherit and dwell in the land for ever and ever.'
  FROM cross_reference_threads t, cross_references x, _session250_en105_lookup sv, _session250_en105_lookup tv
 WHERE t.slug='1-enoch-105-righteous-inherit-the-earth'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=105 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 37:9 — *For evildoers shall be cut off: but those that wait upon Yahuah (LORD), they shall inherit the earth.* The inheritance of Enoch 105:3 is for those who wait on Yahuah, set against the evildoers who are cut off.'
  FROM cross_reference_threads t, cross_references x, _session250_en105_lookup sv, _session250_en105_lookup tv
 WHERE t.slug='1-enoch-105-righteous-inherit-the-earth'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=105 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 5:5 — *Blessed are the meek: for they shall inherit the earth.* Yahusha''s beatitude is Enoch''s promise (105:3) spoken from the mount — the same inheritance for the same kept people.'
  FROM cross_reference_threads t, cross_references x, _session250_en105_lookup sv, _session250_en105_lookup tv
 WHERE t.slug='1-enoch-105-righteous-inherit-the-earth'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=105 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 7:27 — *And the kingdom and dominion, and the greatness of the kingdom under the whole heaven, shall be given to the people of the saints of the El Elyon (most High), whose kingdom is an everlasting kingdom, and all dominions shall serve and obey him.* The forever-and-ever dwelling of Enoch 105:3 is the everlasting kingdom handed to the saints of the Most High.'
  FROM cross_reference_threads t, cross_references x, _session250_en105_lookup sv, _session250_en105_lookup tv
 WHERE t.slug='1-enoch-105-righteous-inherit-the-earth'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=105 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-105-shine-as-the-lights-of-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:3 — *And they that be wise shall shine as the brightness of the firmament; and they that turn many to righteousness as the stars for ever and ever.* The righteous shining as the lights of heaven (Enoch 105:4) is Daniel''s wise shining as the firmament and the stars.'
  FROM cross_reference_threads t, cross_references x, _session250_en105_lookup sv, _session250_en105_lookup tv
 WHERE t.slug='1-enoch-105-shine-as-the-lights-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=105 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* Before they shine (Enoch 105:4) the righteous dead must awake from the dust — the resurrection underwriting the glory.'
  FROM cross_reference_threads t, cross_references x, _session250_en105_lookup sv, _session250_en105_lookup tv
 WHERE t.slug='1-enoch-105-shine-as-the-lights-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=105 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 13:43 — *Then shall the righteous shine forth as the sun in the kingdom of their Father. Who hath ears to hear, let him hear.* Yahusha names the same shining the righteous of Enoch 105:4 are promised, in the kingdom of the Father.'
  FROM cross_reference_threads t, cross_references x, _session250_en105_lookup sv, _session250_en105_lookup tv
 WHERE t.slug='1-enoch-105-shine-as-the-lights-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=105 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 26:19 — *Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead.* The glory of Enoch 105:4 rests on the dust giving back its dead, that they who dwell in dust awake and sing.'
  FROM cross_reference_threads t, cross_references x, _session250_en105_lookup sv, _session250_en105_lookup tv
 WHERE t.slug='1-enoch-105-shine-as-the-lights-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=105 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'the Wisdom of Solomon 3:7 — *And in the time of their visitation they shall shine, and run to and fro like sparks among the stubble.* The parallel extra-canon witness gives the same image as Enoch 105:4 — the righteous shining at their visitation.'
  FROM cross_reference_threads t, cross_references x, _session250_en105_lookup sv, _session250_en105_lookup tv
 WHERE t.slug='1-enoch-105-shine-as-the-lights-of-heaven'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=105 AND sv.verse_number=4
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-105-most-high-arises-in-wrath
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 66:15 — *For, behold, Yahuah (LORD) will come with fire, and with his chariots like a whirlwind, to render his anger with fury, and his rebuke with flames of fire.* The Most High arising in wrath (Enoch 105:6) is Yahuah coming with fire and the chariots of His fury.'
  FROM cross_reference_threads t, cross_references x, _session250_en105_lookup sv, _session250_en105_lookup tv
 WHERE t.slug='1-enoch-105-most-high-arises-in-wrath'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=105 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 66:16 — *For by fire and by his sword will Yahuah (LORD) plead with all flesh: and the slain of Yahuah (LORD) shall be many.* Judgement executed upon all flesh (Enoch 105:6) is Yahuah pleading by fire and sword with all flesh.'
  FROM cross_reference_threads t, cross_references x, _session250_en105_lookup sv, _session250_en105_lookup tv
 WHERE t.slug='1-enoch-105-most-high-arises-in-wrath'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=105 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Thessalonians 1:8 — *In flaming fire taking vengeance on them that know not Elohim (God), and that obey not the gospel of our Lord Yahusha HaMashiach (Lord Jesus Christ).* The destruction of the ungodly from off the earth (Enoch 105:6) is the flaming-fire vengeance at the revealing of Yahusha.'
  FROM cross_reference_threads t, cross_references x, _session250_en105_lookup sv, _session250_en105_lookup tv
 WHERE t.slug='1-enoch-105-most-high-arises-in-wrath'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=105 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints.* The near day of the sinners (Enoch 105:5) is the coming Enoch himself prophesied, which Jude quotes as Scripture — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session250_en105_lookup sv, _session250_en105_lookup tv
 WHERE t.slug='1-enoch-105-most-high-arises-in-wrath'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=105 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

