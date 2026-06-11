-- ----- fragment: minion_1enoch_67.sql (session250 1-enoch 67) -----
-- Source anchor: enoch/1-enoch ch67. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en67 (view _session250_en67_lookup). Sort band base 51650, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en67_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-67-watchers-abyss-of-fire
  ('enoch', '1-enoch', 67, 1, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The reserving of the fallen angels for "the judgment of the great day" is exactly Enoch''s "that great day" when their punishment is consummated in the abyss of fire.'),
  ('enoch', '1-enoch', 67, 1, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter carries the same Watcher-tradition Enoch records: the sinning angels cast down and kept in chains of darkness until the sentence Enoch 67:1 sees finally consummated.'),
  ('enoch', '1-enoch', 67, 2, 'canon', 'matthew', 13, 42, 'free', E'Matthew 13:42 — *And shall cast them into a furnace of fire: there shall be wailing and gnashing of teeth.* The Son of Adam''s own word for the end uses Enoch''s "burning furnace," the very place the archangels cast the Watchers into at the great-day vengeance of Enoch 67:2.'),
  ('enoch', '1-enoch', 67, 2, 'enoch', '1-enoch', 54, 6, 'extras', E'1 Enoch 54:6 — *And Michael, and Gabriel, and Raphael, and Phanuel shall take hold of them on that great day, and cast them on that day into the burning furnace, that Yahuah (God) of Spirits may take vengeance on them for their unrighteousness in becoming subject to Satan and leading astray those who dwell on the earth.* Enoch states the same sentence by the same four archangels word-for-word at the burning valley of Azazel''s hosts, confirming 67:2 as one judgement, not two.'),
  -- thread: 1-enoch-67-earth-sheol-give-back-the-dead
  ('enoch', '1-enoch', 67, 3, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* Daniel''s dust-of-the-earth awaking is Enoch''s earth giving back what was entrusted to it — the same two-fold resurrection to life and to judgement.'),
  ('enoch', '1-enoch', 67, 3, 'canon', 'john', 5, 28, 'free', E'John 5:28 — *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice.* The graves yielding their dead at the voice of the Son is precisely Sheol and hell giving back what they hold in Enoch 67:3.'),
  ('enoch', '1-enoch', 67, 3, 'canon', 'revelation', 20, 13, 'free', E'Revelation 20:13 — *And the sea gave up the dead which were in it; and death and hell delivered up the dead which were in them: and they were judged every man according to their works.* John names the same three custodians Enoch lists — earth/sea, Sheol, and hell — each compelled to surrender its dead for judgement.'),
  ('enoch', '1-enoch', 67, 3, 'enoch', '1-enoch', 51, 1, 'extras', E'1 Enoch 51:1 — *And in those days shall the earth also give back that which has been entrusted to it, And Sheol also shall give back that which it has received, And hell shall give back that which it owes.* Enoch records the identical line in the Parables, where the Elect One then arises — tying the resurrection of 67:3 to the Son of Adam who raises the dead.'),
  -- thread: 1-enoch-67-head-of-days-throne-books-of-living
  ('enoch', '1-enoch', 67, 4, 'canon', 'daniel', 7, 9, 'free', E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* Daniel''s Ancient of days seated for judgement is Enoch''s Head of Days on the throne of His glory — the same enthroned Father, the formless One, opening His court.'),
  ('enoch', '1-enoch', 67, 4, 'canon', 'daniel', 7, 10, 'free', E'Daniel 7:10 — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* The standing host and the opened books are Enoch''s host of heaven and counsellors before whom the books of the living are opened in 67:4.'),
  ('enoch', '1-enoch', 67, 4, 'canon', 'revelation', 20, 12, 'free', E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* John''s book of life answers Enoch''s "books of the living" opened before the throne — names already written before the judgement is read.'),
  ('enoch', '1-enoch', 67, 5, 'canon', 'revelation', 6, 10, 'free', E'Revelation 6:10 — *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* The martyrs'' cry for their blood to be avenged is Enoch''s blood of the righteous "required before Yahuah (God) of Spirits" at 67:5.'),
  ('enoch', '1-enoch', 67, 5, 'enoch', '1-enoch', 47, 4, 'extras', E'1 Enoch 47:4 — *And the hearts of the holy were filled with joy; Because the number of the righteous had been offered, And the prayer of the righteous had been heard, And the blood of the righteous been required before Yahuah (God) of Spirits.* Enoch records the very same throne-scene earlier in the Parables, fixing 67:5 as the answered cry of the martyred righteous, not a new event.'),
  -- thread: 1-enoch-67-earth-cleansed-new-creation
  ('enoch', '1-enoch', 67, 7, 'canon', 'isaiah', 65, 17, 'free', E'Isaiah 65:17 — *For, behold, I create new heavens and a new earth: and the former shall not be remembered, nor come into mind.* Isaiah''s new creation is Enoch''s earth cleansed from all corruption — the defiled former order wiped away and remembered no more.'),
  ('enoch', '1-enoch', 67, 7, 'canon', '2-peter', 3, 13, 'free', E'2 Peter 3:13 — *Nevertheless we, according to his promise, look for new heavens and a new earth, wherein dwelleth righteousness.* Peter''s hope of an earth "wherein dwelleth righteousness" is Enoch''s earth cleansed from all unrighteousness, sin, and iniquity at 67:7.'),
  ('enoch', '1-enoch', 67, 7, 'canon', 'revelation', 21, 1, 'free', E'Revelation 21:1 — *And I saw a new heaven and a new earth: for the first heaven and the first earth were passed away; and there was no more sea.* John sees the cleansed creation Enoch foresaw — the corrupted first earth passed away once all sin and iniquity are purged at 67:7.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en67_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en67_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-67-watchers-abyss-of-fire',
       E'The fallen angels led to the abyss of fire',
       E'Enoch sees the Watchers'' sentence carried out: *And in those days the punishment of the fallen angels shall be consummated, And they shall be led off to the abyss of fire: And in the fire shall they be covered, And in the fire shall they be tormented* (1 Enoch 67:1), and the archangels execute it: *And Michael, and Gabriel, and Raphael, and Phanuel Shall take hold of them on that great day, And cast them on that day into the burning furnace, That Yahuah (God) of Spirits may take vengeance on them For their unrighteousness in becoming subject to Satan And leading astray those who dwell on the earth* (1 Enoch 67:2). It ain''t new — this is the canon''s own Genesis-6 rebellion held over for sentence: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6), and *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). Yahusha''s own furnace-language echoes Enoch''s: *And shall cast them into a furnace of fire: there shall be wailing and gnashing of teeth* (Matthew 13:42). Enoch elsewhere names the same place and the same four archangels at the same task (1 Enoch 54:5-6), and the earlier word over Azazel sets the precedent: *In those days they shall be led off to the abyss of fire: and to the torment and the prison in which they shall be confined for ever* (1 Enoch 10:13). The Watchers'' sin is rebellion against the Creator''s order, not Torah-keeping — the judgement falls on those who left their estate and led the earth astray.',
       sv.verse_id, ev.verse_id, 'extras', 51650
  FROM _session250_en67_lookup sv, _session250_en67_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=67 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=67 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-67-earth-sheol-give-back-the-dead',
       E'The earth and Sheol give back the dead',
       E'At the great judgement the grave itself surrenders its trust: *And in those days shall the earth also give back that which has been entrusted to it, And Sheol also shall give back that which it has received, And hell shall give back that which it owes* (1 Enoch 67:3). It ain''t new — this is the resurrection Daniel foresaw: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2), and the resurrection Yahusha promised: *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice* (John 5:28), *And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation* (John 5:29). John''s vision at the white throne renders Enoch''s three custodians in one stroke: *And the sea gave up the dead which were in it; and death and hell delivered up the dead which were in them: and they were judged every man according to their works* (Revelation 20:13). Enoch repeats the same line verbatim within the Parables (1 Enoch 51:1), where it is the Elect One who then arises — binding the giving-back of the dead to the Son of Adam who raises them.',
       sv.verse_id, ev.verse_id, 'extras', 51653
  FROM _session250_en67_lookup sv, _session250_en67_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=67 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=67 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-67-head-of-days-throne-books-of-living',
       E'The Head of Days on the throne; the books of the living opened',
       E'The Father takes His seat for judgement: *And the Head of Days shall sit on the throne of His glory, And the books of the living shall be opened before Him: And all His host which is in heaven above and His counsellors shall stand before Him* (1 Enoch 67:4); and the long cry of the martyrs is answered: *And the hearts of the holy shall be filled with joy; Because the number of the righteous has been offered, And the prayer of the righteous has been heard, And the blood of the righteous has been required before Yahuah (God) of Spirits* (1 Enoch 67:5). The Head of Days is the Father, the formless One enthroned — and it ain''t new, for Daniel saw the same court: *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire* (Daniel 7:9), *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened* (Daniel 7:10). John saw the books opened too: *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works* (Revelation 20:12). And the blood of the righteous required is the fifth-seal cry: *And when he had opened the fifth seal, I saw under the altar the souls of them that were slain for the word of Elohim (God), and for the testimony which they held* (Revelation 6:9), *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* (Revelation 6:10). Enoch states this whole scene once already (1 Enoch 47:3-4) — the same throne, the same books of the living, the same number of the righteous fulfilled — so that the avenging of the covenant-people''s blood, not the cancelling of the law, is what the court is set to accomplish.',
       sv.verse_id, ev.verse_id, 'extras', 51656
  FROM _session250_en67_lookup sv, _session250_en67_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=67 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=67 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-67-earth-cleansed-new-creation',
       E'The earth cleansed from all corruption',
       E'The judgement ends not in ruin but in a purified world: *And the earth shall be cleansed from all corruption, And from all unrighteousness, And from all sin, And from all iniquity* (1 Enoch 67:7), after the punishment falls on the sinners, the fallen angels, and their children (1 Enoch 67:6). It ain''t new — the prophets and the apostles look to the same cleansed creation: *For, behold, I create new heavens and a new earth: and the former shall not be remembered, nor come into mind* (Isaiah 65:17); *Nevertheless we, according to his promise, look for new heavens and a new earth, wherein dwelleth righteousness* (2 Peter 3:13); and John sees it fulfilled: *And I saw a new heaven and a new earth: for the first heaven and the first earth were passed away; and there was no more sea* (Revelation 21:1). The cleansing of the earth from corruption is the Watcher-defilement of Genesis 6 finally undone — the Creator''s order restored, righteousness dwelling where iniquity had reigned.',
       sv.verse_id, ev.verse_id, 'extras', 51659
  FROM _session250_en67_lookup sv, _session250_en67_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=67 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=67 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-67-watchers-abyss-of-fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The reserving of the fallen angels for "the judgment of the great day" is exactly Enoch''s "that great day" when their punishment is consummated in the abyss of fire.'
  FROM cross_reference_threads t, cross_references x, _session250_en67_lookup sv, _session250_en67_lookup tv
 WHERE t.slug='1-enoch-67-watchers-abyss-of-fire'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=67 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter carries the same Watcher-tradition Enoch records: the sinning angels cast down and kept in chains of darkness until the sentence Enoch 67:1 sees finally consummated.'
  FROM cross_reference_threads t, cross_references x, _session250_en67_lookup sv, _session250_en67_lookup tv
 WHERE t.slug='1-enoch-67-watchers-abyss-of-fire'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=67 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 13:42 — *And shall cast them into a furnace of fire: there shall be wailing and gnashing of teeth.* The Son of Adam''s own word for the end uses Enoch''s "burning furnace," the very place the archangels cast the Watchers into at the great-day vengeance of Enoch 67:2.'
  FROM cross_reference_threads t, cross_references x, _session250_en67_lookup sv, _session250_en67_lookup tv
 WHERE t.slug='1-enoch-67-watchers-abyss-of-fire'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=67 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 54:6 — *And Michael, and Gabriel, and Raphael, and Phanuel shall take hold of them on that great day, and cast them on that day into the burning furnace, that Yahuah (God) of Spirits may take vengeance on them for their unrighteousness in becoming subject to Satan and leading astray those who dwell on the earth.* Enoch states the same sentence by the same four archangels word-for-word at the burning valley of Azazel''s hosts, confirming 67:2 as one judgement, not two.'
  FROM cross_reference_threads t, cross_references x, _session250_en67_lookup sv, _session250_en67_lookup tv
 WHERE t.slug='1-enoch-67-watchers-abyss-of-fire'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=67 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=54 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-67-earth-sheol-give-back-the-dead
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* Daniel''s dust-of-the-earth awaking is Enoch''s earth giving back what was entrusted to it — the same two-fold resurrection to life and to judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en67_lookup sv, _session250_en67_lookup tv
 WHERE t.slug='1-enoch-67-earth-sheol-give-back-the-dead'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=67 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 5:28 — *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice.* The graves yielding their dead at the voice of the Son is precisely Sheol and hell giving back what they hold in Enoch 67:3.'
  FROM cross_reference_threads t, cross_references x, _session250_en67_lookup sv, _session250_en67_lookup tv
 WHERE t.slug='1-enoch-67-earth-sheol-give-back-the-dead'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=67 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 20:13 — *And the sea gave up the dead which were in it; and death and hell delivered up the dead which were in them: and they were judged every man according to their works.* John names the same three custodians Enoch lists — earth/sea, Sheol, and hell — each compelled to surrender its dead for judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en67_lookup sv, _session250_en67_lookup tv
 WHERE t.slug='1-enoch-67-earth-sheol-give-back-the-dead'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=67 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 51:1 — *And in those days shall the earth also give back that which has been entrusted to it, And Sheol also shall give back that which it has received, And hell shall give back that which it owes.* Enoch records the identical line in the Parables, where the Elect One then arises — tying the resurrection of 67:3 to the Son of Adam who raises the dead.'
  FROM cross_reference_threads t, cross_references x, _session250_en67_lookup sv, _session250_en67_lookup tv
 WHERE t.slug='1-enoch-67-earth-sheol-give-back-the-dead'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=67 AND sv.verse_number=3
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=51 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-67-head-of-days-throne-books-of-living
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* Daniel''s Ancient of days seated for judgement is Enoch''s Head of Days on the throne of His glory — the same enthroned Father, the formless One, opening His court.'
  FROM cross_reference_threads t, cross_references x, _session250_en67_lookup sv, _session250_en67_lookup tv
 WHERE t.slug='1-enoch-67-head-of-days-throne-books-of-living'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=67 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:10 — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* The standing host and the opened books are Enoch''s host of heaven and counsellors before whom the books of the living are opened in 67:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en67_lookup sv, _session250_en67_lookup tv
 WHERE t.slug='1-enoch-67-head-of-days-throne-books-of-living'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=67 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 20:12 — *And I saw the dead, small and great, stand before Elohim (God); and the books were opened: and another book was opened, which is the book of life: and the dead were judged out of those things which were written in the books, according to their works.* John''s book of life answers Enoch''s "books of the living" opened before the throne — names already written before the judgement is read.'
  FROM cross_reference_threads t, cross_references x, _session250_en67_lookup sv, _session250_en67_lookup tv
 WHERE t.slug='1-enoch-67-head-of-days-throne-books-of-living'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=67 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 6:10 — *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* The martyrs'' cry for their blood to be avenged is Enoch''s blood of the righteous "required before Yahuah (God) of Spirits" at 67:5.'
  FROM cross_reference_threads t, cross_references x, _session250_en67_lookup sv, _session250_en67_lookup tv
 WHERE t.slug='1-enoch-67-head-of-days-throne-books-of-living'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=67 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 47:4 — *And the hearts of the holy were filled with joy; Because the number of the righteous had been offered, And the prayer of the righteous had been heard, And the blood of the righteous been required before Yahuah (God) of Spirits.* Enoch records the very same throne-scene earlier in the Parables, fixing 67:5 as the answered cry of the martyred righteous, not a new event.'
  FROM cross_reference_threads t, cross_references x, _session250_en67_lookup sv, _session250_en67_lookup tv
 WHERE t.slug='1-enoch-67-head-of-days-throne-books-of-living'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=67 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=47 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-67-earth-cleansed-new-creation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 65:17 — *For, behold, I create new heavens and a new earth: and the former shall not be remembered, nor come into mind.* Isaiah''s new creation is Enoch''s earth cleansed from all corruption — the defiled former order wiped away and remembered no more.'
  FROM cross_reference_threads t, cross_references x, _session250_en67_lookup sv, _session250_en67_lookup tv
 WHERE t.slug='1-enoch-67-earth-cleansed-new-creation'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=67 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 3:13 — *Nevertheless we, according to his promise, look for new heavens and a new earth, wherein dwelleth righteousness.* Peter''s hope of an earth "wherein dwelleth righteousness" is Enoch''s earth cleansed from all unrighteousness, sin, and iniquity at 67:7.'
  FROM cross_reference_threads t, cross_references x, _session250_en67_lookup sv, _session250_en67_lookup tv
 WHERE t.slug='1-enoch-67-earth-cleansed-new-creation'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=67 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 21:1 — *And I saw a new heaven and a new earth: for the first heaven and the first earth were passed away; and there was no more sea.* John sees the cleansed creation Enoch foresaw — the corrupted first earth passed away once all sin and iniquity are purged at 67:7.'
  FROM cross_reference_threads t, cross_references x, _session250_en67_lookup sv, _session250_en67_lookup tv
 WHERE t.slug='1-enoch-67-earth-cleansed-new-creation'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=67 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

