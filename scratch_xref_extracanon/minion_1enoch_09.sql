-- ----- fragment: minion_1enoch_09.sql (session250 1-enoch 9) -----
-- Source anchor: enoch/1-enoch ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en09 (view _session250_en09_lookup). Sort band base 50200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-9-blood-cries-from-the-ground
  ('enoch', '1-enoch', 9, 1, 'canon', 'genesis', 6, 5, 'free', E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* The lawlessness the watchers see filling the earth in Enoch 9:1 is the very wickedness Genesis names as the cause of the Flood.'),
  ('enoch', '1-enoch', 9, 1, 'canon', 'genesis', 6, 11, 'free', E'Genesis 6:11 — *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* The blood and lawlessness wrought upon the earth in Enoch 9:1 is Genesis'' earth filled with violence.'),
  ('enoch', '1-enoch', 9, 2, 'canon', 'genesis', 4, 10, 'free', E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother’s blood crieth unto me from the ground.* The voice of crying that reaches the gates of heaven in Enoch 9:2 is the same shed blood that cries from the ground from Abel onward.'),
  ('enoch', '1-enoch', 9, 2, 'jubilees', 'jubilees', 7, 23, 'extras', E'Jubilees 7:23 — *And every one sold himself to work iniquity and to shed much blood, and the earth was filled with iniquity.* Jubilees names the same flood-cause Enoch 9:2 mourns: much blood shed, the earth filled with iniquity.'),
  -- thread: 1-enoch-9-throne-of-glory-all-naked-before-him
  ('enoch', '1-enoch', 9, 5, 'canon', 'hebrews', 4, 13, 'free', E'Hebrews 4:13 — *Neither is there any creature that is not manifest in his sight: but all things are naked and opened unto the eyes of him with whom we have to do.* Enoch 9:5''s all things naked and open in His sight, nothing hidden, is carried verbatim into the apostolic word.'),
  ('enoch', '1-enoch', 9, 5, 'canon', 'proverbs', 15, 11, 'free', E'Proverbs 15:11 — *Hell and destruction are before Yahuah (LORD): how much more then the hearts of the children of men?* The Most High who seest all things in Enoch 9:5 is the Yahuah before whom even hell and the hidden heart lie open.'),
  ('enoch', '1-enoch', 9, 4, 'canon', 'psalms', 11, 4, 'free', E'Psalm 11:4 — *Yahuah (LORD) is in his holy temple, the LORD’S throne is in heaven: his eyes behold, his eyelids try, the children of men.* The throne of glory standing unto all generations in Enoch 9:4 is the heavenly throne whose eyes try the children of men.'),
  -- thread: 1-enoch-9-azazel-and-shemyaza-the-watchers-named
  ('enoch', '1-enoch', 9, 6, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* Azazel and Shemyaza in Enoch 9:6-7 are the sons of Elohim whose descent Genesis records in a single dense verse.'),
  ('enoch', '1-enoch', 9, 7, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude names the very fate of Shemyaza and his associates from Enoch 9:7: angels who left their estate, chained unto the great judgment.'),
  ('enoch', '1-enoch', 9, 6, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter, like Enoch 9:6, holds the sinning Watchers in chains of darkness reserved unto judgment.'),
  -- thread: 1-enoch-9-daughters-of-men-and-the-giants
  ('enoch', '1-enoch', 9, 8, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The Watchers going to the daughters of men in Enoch 9:8 is Genesis'' sons of Elohim taking the daughters of men to wife.'),
  ('enoch', '1-enoch', 9, 8, 'jubilees', 'jubilees', 5, 1, 'extras', E'Jubilees 5:1 — *the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* Jubilees joins Enoch 9:8-9: the angels took wives and the women bore giants.'),
  ('enoch', '1-enoch', 9, 8, 'jubilees', 'jubilees', 7, 21, 'extras', E'Jubilees 7:21 — *owing to the fornication wherein the Watchers against the law of their ordinances went a whoring after the daughters of men, and took themselves wives of all which they chose: and they made the beginning of uncleanness.* Jubilees names the watchers'' fornication of Enoch 9:8 as a chief cause of the Flood.'),
  ('enoch', '1-enoch', 9, 8, 'jasher', 'jasher', 4, 18, 'extras', E'Jasher 4:18 — *and Elohim saw the whole earth and it was corrupt, for all flesh had corrupted its ways upon earth, all men and all animals.* Jasher records the same defiling of the earth Enoch 9:8 lays at the Watchers'' charge.'),
  ('enoch', '1-enoch', 9, 9, 'apocrypha', 'the-wisdom-of-solomon', 14, 6, 'extras', E'The Wisdom of Solomon 14:6 — *For in the old time also, when the proud giants perished, the hope of the world governed by your hand escaped in a weak vessel, and left to all ages a seed of generation.* Wisdom remembers the perishing of the very giants the women bore in Enoch 9:9, with Noah''s vessel preserved.'),
  -- thread: 1-enoch-9-souls-of-the-slain-cry-how-long
  ('enoch', '1-enoch', 9, 10, 'canon', 'revelation', 6, 9, 'free', E'Revelation 6:9 — *I saw under the altar the souls of them that were slain for the word of Elohim (God), and for the testimony which they held.* The souls of the dead crying at the gates of heaven in Enoch 9:10 are John''s souls under the altar awaiting the judgment.'),
  ('enoch', '1-enoch', 9, 10, 'canon', 'revelation', 6, 10, 'free', E'Revelation 6:10 — *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* The unceasing lamentation of Enoch 9:10 is the same How long? cry of the slain pleading for the judgment of those who dwell on the earth.'),
  ('enoch', '1-enoch', 9, 11, 'apocrypha', 'ecclesiasticus', 16, 7, 'extras', E'Ecclesiasticus 16:7 — *He was not pacified toward the old giants, who fell away in the strength of their foolishness.* The judgment Enoch 9:11 longs for is the one Ben Sira recalls: the Most High unappeased toward the old giants.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-9-blood-cries-from-the-ground',
       E'Much blood shed, and the voice of crying reaches heaven',
       E'The four watching archangels look down and see the ruin of Genesis 6: *And then Michael, Uriel, Raphael, and Gabriel looked down from heaven and saw much blood being shed upon the earth, and all lawlessness being wrought upon the earth* (1 Enoch 9:1), so that *The earth lost through those who dwell upon her! The voice of their crying has reached unto the gates of heaven* (1 Enoch 9:2). This is the canon''s own indictment of the corrupted age — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually* (Genesis 6:5); *The earth also was corrupt before Elohim (God), and the earth was filled with violence* (Genesis 6:11). Blood crying from the ground is older still: *the voice of thy brother’s blood crieth unto me from the ground* (Genesis 4:10), and Jubilees rehearses the same flood-cause — *every one sold himself to work iniquity and to shed much blood, and the earth was filled with iniquity* (Jubilees 7:23). It ain''t new: the angels'' grief over shed blood is Yahuah''s own grief that *grieved him at his heart* (Genesis 6:6) — the Creator''s order violated, not a law made into a curse.',
       sv.verse_id, ev.verse_id, 'extras', 50200
  FROM _session250_en09_lookup sv, _session250_en09_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=9 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-9-throne-of-glory-all-naked-before-him',
       E'Lord of lords — all things naked and open in His sight',
       E'The angels lift their suit to the formless Most High with a doxology of His order and His all-seeing knowledge: *Lord of lords, Elohim (God) of elohiym, King of kings, and Elohim (God) of the ages, the throne of Thy glory (standeth) unto all the generations of the world, and Thy Name is holy and glorious and blessed unto all the ages!* (1 Enoch 9:4), and *Thou hast made all things, and power over all things hast Thou: and all things are naked and open in Thy sight, and Thou seest all things, and nothing can hide itself from Thee* (1 Enoch 9:5). The New Testament puts the same words on the page almost verbatim: *Neither is there any creature that is not manifest in his sight: but all things are naked and opened unto the eyes of him with whom we have to do* (Hebrews 4:13). The Tanakh stands underneath it — *Hell and destruction are before Yahuah (LORD): how much more then the hearts of the children of men?* (Proverbs 15:11), and *Yahuah (LORD) is in his holy temple, the LORD’S throne is in heaven: his eyes behold, his eyelids try, the children of men* (Psalm 11:4). The Head of Days is the Father, formless on the throne of glory, before whom nothing can hide — this is the One the angels appeal to, not a created power.',
       sv.verse_id, ev.verse_id, 'extras', 50203
  FROM _session250_en09_lookup sv, _session250_en09_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=9 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-9-azazel-and-shemyaza-the-watchers-named',
       E'Azazel and Shemyaza — the Watchers who left their estate',
       E'The angels name the chief offenders: *Thou seest what Azâzêl hath done, who hath taught all unrighteousness on earth and revealed the eternal secrets which were (preserved) in heaven, which men were striving to learn* (1 Enoch 9:6), *And what Shemyaza hath done, to whom Thou hast given authority to bear rule over his associates* (1 Enoch 9:7). These are the Watchers of Genesis 6 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown* (Genesis 6:4) — and the apostles carry their fate forward by name: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6); *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). Their sin is rebellion against the Creator''s order — they revealed the secrets preserved in heaven that were not theirs to give. Here the seed-war begins, the tares first sown among the wheat.',
       sv.verse_id, ev.verse_id, 'extras', 50206
  FROM _session250_en09_lookup sv, _session250_en09_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=9 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-9-daughters-of-men-and-the-giants',
       E'They defiled the daughters of men, and the women bore giants',
       E'The angels recount the act itself: *And they have gone to the daughters of men upon the earth, and have slept with the women, and have defiled themselves, and revealed to them all kinds of sins* (1 Enoch 9:8), *And the women have borne giants, and the whole earth has thereby been filled with blood and unrighteousness* (1 Enoch 9:9). This is Genesis 6 in its own words — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2) — and the parallel extra-canonical witnesses tell the same flood-cause. Jubilees: *the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants* (Jubilees 5:1); and again, *the Watchers against the law of their ordinances went a whoring after the daughters of men, and took themselves wives of all which they chose* (Jubilees 7:21). Jasher records the corruption — *Elohim saw the whole earth and it was corrupt, for all flesh had corrupted its ways upon earth* (Jasher 4:18) — and the Wisdom of Solomon remembers the end of the giant-brood: *For in the old time also, when the proud giants perished, the hope of the world governed by your hand escaped in a weak vessel, and left to all ages a seed of generation* (The Wisdom of Solomon 14:6). One transgression of the Creator''s order, witnessed across every shelf of the library.',
       sv.verse_id, ev.verse_id, 'extras', 50209
  FROM _session250_en09_lookup sv, _session250_en09_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=8
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=9 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-9-souls-of-the-slain-cry-how-long',
       E'The souls of the dead cry at the gates of heaven',
       E'The angels close their appeal with the cry of the dead: *And now, behold, the souls of those who have died are crying and making their suit to the gates of heaven, and their lamentations have ascended: and cannot cease because of the lawless deeds which are wrought on the earth* (1 Enoch 9:10), *And Thou knowest all things before they come to pass, and Thou seest these things and Thou dost suffer them, and Thou dost not say to us what we are to do to them in regard to these* (1 Enoch 9:11). The Revelation lays the same scene under the altar: *I saw under the altar the souls of them that were slain for the word of Elohim (God), and for the testimony which they held* (Revelation 6:9), *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* (Revelation 6:10). The judgment of the giant-age is remembered by the elders of Israel too: *He was not pacified toward the old giants, who fell away in the strength of their foolishness* (Ecclesiasticus 16:7). The cry of the righteous dead ascends and is answered in its appointed time — election and judgment held by the One who knows all things before they come to pass.',
       sv.verse_id, ev.verse_id, 'extras', 50212
  FROM _session250_en09_lookup sv, _session250_en09_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=10
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=9 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-9-blood-cries-from-the-ground
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* The lawlessness the watchers see filling the earth in Enoch 9:1 is the very wickedness Genesis names as the cause of the Flood.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-blood-cries-from-the-ground'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:11 — *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* The blood and lawlessness wrought upon the earth in Enoch 9:1 is Genesis'' earth filled with violence.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-blood-cries-from-the-ground'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 4:10 — *And he said, What hast thou done? the voice of thy brother’s blood crieth unto me from the ground.* The voice of crying that reaches the gates of heaven in Enoch 9:2 is the same shed blood that cries from the ground from Abel onward.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-blood-cries-from-the-ground'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 7:23 — *And every one sold himself to work iniquity and to shed much blood, and the earth was filled with iniquity.* Jubilees names the same flood-cause Enoch 9:2 mourns: much blood shed, the earth filled with iniquity.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-blood-cries-from-the-ground'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-9-throne-of-glory-all-naked-before-him
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 4:13 — *Neither is there any creature that is not manifest in his sight: but all things are naked and opened unto the eyes of him with whom we have to do.* Enoch 9:5''s all things naked and open in His sight, nothing hidden, is carried verbatim into the apostolic word.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-throne-of-glory-all-naked-before-him'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 15:11 — *Hell and destruction are before Yahuah (LORD): how much more then the hearts of the children of men?* The Most High who seest all things in Enoch 9:5 is the Yahuah before whom even hell and the hidden heart lie open.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-throne-of-glory-all-naked-before-him'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=15 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 11:4 — *Yahuah (LORD) is in his holy temple, the LORD’S throne is in heaven: his eyes behold, his eyelids try, the children of men.* The throne of glory standing unto all generations in Enoch 9:4 is the heavenly throne whose eyes try the children of men.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-throne-of-glory-all-naked-before-him'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-9-azazel-and-shemyaza-the-watchers-named
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* Azazel and Shemyaza in Enoch 9:6-7 are the sons of Elohim whose descent Genesis records in a single dense verse.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-azazel-and-shemyaza-the-watchers-named'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude names the very fate of Shemyaza and his associates from Enoch 9:7: angels who left their estate, chained unto the great judgment.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-azazel-and-shemyaza-the-watchers-named'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment.* Peter, like Enoch 9:6, holds the sinning Watchers in chains of darkness reserved unto judgment.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-azazel-and-shemyaza-the-watchers-named'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-9-daughters-of-men-and-the-giants
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The Watchers going to the daughters of men in Enoch 9:8 is Genesis'' sons of Elohim taking the daughters of men to wife.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-daughters-of-men-and-the-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 5:1 — *the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* Jubilees joins Enoch 9:8-9: the angels took wives and the women bore giants.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-daughters-of-men-and-the-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=8
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 7:21 — *owing to the fornication wherein the Watchers against the law of their ordinances went a whoring after the daughters of men, and took themselves wives of all which they chose: and they made the beginning of uncleanness.* Jubilees names the watchers'' fornication of Enoch 9:8 as a chief cause of the Flood.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-daughters-of-men-and-the-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=8
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=7 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jasher 4:18 — *and Elohim saw the whole earth and it was corrupt, for all flesh had corrupted its ways upon earth, all men and all animals.* Jasher records the same defiling of the earth Enoch 9:8 lays at the Watchers'' charge.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-daughters-of-men-and-the-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=8
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=4 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'The Wisdom of Solomon 14:6 — *For in the old time also, when the proud giants perished, the hope of the world governed by your hand escaped in a weak vessel, and left to all ages a seed of generation.* Wisdom remembers the perishing of the very giants the women bore in Enoch 9:9, with Noah''s vessel preserved.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-daughters-of-men-and-the-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=14 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-9-souls-of-the-slain-cry-how-long
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 6:9 — *I saw under the altar the souls of them that were slain for the word of Elohim (God), and for the testimony which they held.* The souls of the dead crying at the gates of heaven in Enoch 9:10 are John''s souls under the altar awaiting the judgment.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-souls-of-the-slain-cry-how-long'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 6:10 — *And they cried with a loud voice, saying, How long, O Yahuah (Lord), holy and true, dost thou not judge and avenge our blood on them that dwell on the earth?* The unceasing lamentation of Enoch 9:10 is the same How long? cry of the slain pleading for the judgment of those who dwell on the earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-souls-of-the-slain-cry-how-long'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 16:7 — *He was not pacified toward the old giants, who fell away in the strength of their foolishness.* The judgment Enoch 9:11 longs for is the one Ben Sira recalls: the Most High unappeased toward the old giants.'
  FROM cross_reference_threads t, cross_references x, _session250_en09_lookup sv, _session250_en09_lookup tv
 WHERE t.slug='1-enoch-9-souls-of-the-slain-cry-how-long'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=9 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=16 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

