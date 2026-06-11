-- ----- fragment: minion_1enoch_07.sql (session250 1-enoch 7) -----
-- Source anchor: enoch/1-enoch ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en07 (view _session250_en07_lookup). Sort band base 50150, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-7-watchers-took-wives
  ('enoch', '1-enoch', 7, 1, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The canon''s own account of the same Watchers taking wives that 1 Enoch 7:1 narrates.'),
  ('enoch', '1-enoch', 7, 1, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude reads the Watchers'' descent of 1 Enoch 7:1 as rebellion against the Creator''s assigned order, reserved for judgment.'),
  ('enoch', '1-enoch', 7, 1, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter carries the same binding of the fallen Watchers whose sin begins in 1 Enoch 7:1.'),
  ('enoch', '1-enoch', 7, 1, 'jubilees', 'jubilees', 5, 1, 'extras', E'Jubilees 5:1 — *And it came to pass when the children of men began to multiply on the face of the earth and daughters were born to them, that the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* Jubilees tells the identical descent and union that opens 1 Enoch 7:1.'),
  ('enoch', '1-enoch', 7, 1, 'jasher', 'jasher', 4, 18, 'extras', E'Jasher 4:18 — *And their judges and rulers went to the daughters of men and took their wives by force from their husbands according to their choice, and the sons of men in those days took from the cattle of the earth, the beasts of the field and the fowls of the air, and taught the mixture of animals of one species with the other, in order therewith to provoke Yahuah (the Lord); and Elohim saw the whole earth and it was corrupt, for all flesh had corrupted its ways upon earth, all men and all animals.* Jasher remembers both the seizing of wives and the taught, corrupting arts of 1 Enoch 7:1.'),
  -- thread: 1-enoch-7-giants-born
  ('enoch', '1-enoch', 7, 2, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The Torah''s own witness to the giants born of the Watchers, exactly as 1 Enoch 7:2.'),
  ('enoch', '1-enoch', 7, 2, 'jubilees', 'jubilees', 7, 21, 'extras', E'Jubilees 7:21 — *For owing to these three things came the flood upon the earth, namely, owing to the fornication wherein the Watchers against the law of their ordinances went a whoring after the daughters of men, and took themselves wives of all which they chose: and they made the beginning of uncleanness. And they begat sons the Nâphîdîm, and they were all unlike, and they devoured one another: and the Giants slew the Nâphîl, and the Nâphîl slew the Eljô, and the Eljô mankind, and one man another.* Jubilees names the giant brood born of the same union 1 Enoch 7:2 records, and their mutual slaughter.'),
  -- thread: 1-enoch-7-devouring-and-blood
  ('enoch', '1-enoch', 7, 4, 'canon', 'genesis', 9, 4, 'free', E'Genesis 9:4 — *But flesh with the life thereof, which is the blood thereof, shall ye not eat.* The blood-drinking of 1 Enoch 7:4 is the exact corruption the Creator forbids to the renewed post-flood earth.'),
  ('enoch', '1-enoch', 7, 4, 'canon', 'leviticus', 17, 14, 'free', E'Leviticus 17:14 — *For it is the life of all flesh; the blood of it is for the life thereof: therefore I said unto the children of Yashar''el (Israel), Ye shall eat the blood of no manner of flesh: for the life of all flesh is the blood thereof: whosoever eateth it shall be cut off.* The Torah''s standing blood statute marks the very line the giants of 1 Enoch 7:4 crossed when they devoured flesh and drank blood.'),
  ('enoch', '1-enoch', 7, 4, 'jubilees', 'jubilees', 7, 24, 'extras', E'Jubilees 7:24 — *And after this they sinned against the beasts and birds, and all that moves and walks on the earth: and much blood was shed on the earth, and every imagination and desire of men imagined vanity and evil continually.* Jubilees records the same sinning against beasts and birds and the much blood shed that 1 Enoch 7:3-4 describes.'),
  -- thread: 1-enoch-7-earth-accuses
  ('enoch', '1-enoch', 7, 5, 'canon', 'genesis', 6, 11, 'free', E'Genesis 6:11 — *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* The Torah''s verdict on the same generation whose lawlessness makes the earth itself lay accusation in 1 Enoch 7:5.'),
  ('enoch', '1-enoch', 7, 5, 'enoch', '1-enoch', 9, 1, 'extras', E'1 Enoch 9:1 — *And then Michael, Uriel, Raphael, and Gabriel looked down from heaven and saw much blood being shed upon the earth, and all lawlessness being wrought upon the earth.* Enoch''s own next chapter answers the earth''s accusation of 7:5 as heaven looks down and sees the bloodshed.'),
  ('enoch', '1-enoch', 7, 5, 'jubilees', 'jubilees', 7, 25, 'extras', E'Jubilees 7:25 — *And Yahuah (God) destroyed everything from off the face of the earth; because of the wickedness of their deeds, and because of the blood which they had shed in the midst of the earth He destroyed everything.* Jubilees names the shed blood as the very ground of the judgment the earth''s accusation in 1 Enoch 7:5 calls for.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-7-watchers-took-wives',
       E'The Watchers Took Wives and Taught Forbidden Arts',
       E'1 Enoch opens the corruption plainly: *And all the others together with them took unto themselves wives, and each chose for himself one, and they began to go in unto them and to defile themselves with them, and they taught them charms and enchantments, and the cutting of roots, and made them acquainted with plants.* (1 Enoch 7:1) It ain''t new — this is the canon''s own Genesis 6: *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* (Genesis 6:2) Jubilees tells the same descent — *the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* (Jubilees 5:1) — and Jasher remembers the taught arts and the forced unions, *the mixture of animals of one species with the other, in order therewith to provoke Yahuah (the Lord)* (Jasher 4:18). The New Testament names these same beings and their crime as rebellion against the Creator''s order, not mere weakness: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* (Jude 1:6) The Watchers'' sin is leaving the estate the Creator assigned them and corrupting His order; the Torah and its keepers stand on the other side of that line.',
       sv.verse_id, ev.verse_id, 'extras', 50150
  FROM _session250_en07_lookup sv, _session250_en07_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=7 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-7-giants-born',
       E'And They Bare Great Giants',
       E'From the forbidden union come the giants: *And they became pregnant, and they bare great giants, whose height was three thousand ells.* (1 Enoch 7:2) The Torah records the same offspring of the same union: *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* (Genesis 6:4) Jubilees names the brood and their mutual slaughter — *And they begat sons the Nâphîdîm, and they were all unlike, and they devoured one another: and the Giants slew the Nâphîl, and the Nâphîl slew the Eljô, and the Eljô mankind, and one man another.* (Jubilees 7:21) This is the head of the seed-war: a counterfeit line sown into the earth alongside Adam''s, which the canon will trace forward to the tares among the wheat. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 50153
  FROM _session250_en07_lookup sv, _session250_en07_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=7 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-7-devouring-and-blood',
       E'Devouring Flesh and Drinking Blood',
       E'The giants consume everything, then mankind itself turns predator: *Who consumed all the acquisitions of men. And when men could no longer sustain them, the giants turned against them and devoured mankind. And they began to sin against birds, and beasts, and reptiles, and fish, and to devour one another’s flesh, and drink the blood.* (1 Enoch 7:3-4) Jubilees tells the same cascade of bloodshed against the creatures — *And after this they sinned against the beasts and birds, and all that moves and walks on the earth: and much blood was shed on the earth, and every imagination and desire of men imagined vanity and evil continually.* (Jubilees 7:24) The drinking of blood is the precise thing the Creator forbids to Noah''s renewed earth: *But flesh with the life thereof, which is the blood thereof, shall ye not eat.* (Genesis 9:4) — and the Torah seals it as a standing statute, *For it is the life of all flesh; the blood of it is for the life thereof: therefore I said unto the children of Yashar''el (Israel), Ye shall eat the blood of no manner of flesh* (Leviticus 17:14). The Watchers'' world is precisely the order the law later forbids; the law does not curse — it draws the line the giants crossed.',
       sv.verse_id, ev.verse_id, 'extras', 50156
  FROM _session250_en07_lookup sv, _session250_en07_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=7 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-7-earth-accuses',
       E'The Earth Lays Accusation',
       E'The chapter ends with creation itself crying out: *Then the earth laid accusation against the lawless ones.* (1 Enoch 7:5) The very next chapter answers it from heaven — *And then Michael, Uriel, Raphael, and Gabriel looked down from heaven and saw much blood being shed upon the earth, and all lawlessness being wrought upon the earth.* (1 Enoch 9:1) The Torah''s own verdict on this generation is the same: *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* (Genesis 6:11) And Jubilees names the bloodshed as the very ground of the Creator''s destroying judgment — *And Yahuah (God) destroyed everything from off the face of the earth; because of the wickedness of their deeds, and because of the blood which they had shed in the midst of the earth He destroyed everything.* (Jubilees 7:25) The accusation is not arbitrary wrath: it is the covenant order vindicating itself against rebellion.',
       sv.verse_id, ev.verse_id, 'extras', 50159
  FROM _session250_en07_lookup sv, _session250_en07_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=7 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-7-watchers-took-wives
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The canon''s own account of the same Watchers taking wives that 1 Enoch 7:1 narrates.'
  FROM cross_reference_threads t, cross_references x, _session250_en07_lookup sv, _session250_en07_lookup tv
 WHERE t.slug='1-enoch-7-watchers-took-wives'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude reads the Watchers'' descent of 1 Enoch 7:1 as rebellion against the Creator''s assigned order, reserved for judgment.'
  FROM cross_reference_threads t, cross_references x, _session250_en07_lookup sv, _session250_en07_lookup tv
 WHERE t.slug='1-enoch-7-watchers-took-wives'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter carries the same binding of the fallen Watchers whose sin begins in 1 Enoch 7:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en07_lookup sv, _session250_en07_lookup tv
 WHERE t.slug='1-enoch-7-watchers-took-wives'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 5:1 — *And it came to pass when the children of men began to multiply on the face of the earth and daughters were born to them, that the angels of Elohim (God) saw them on a certain year of this jubilee, that they were beautiful to look upon; and they took themselves wives of all whom they chose, and they bare to them sons and they were giants.* Jubilees tells the identical descent and union that opens 1 Enoch 7:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en07_lookup sv, _session250_en07_lookup tv
 WHERE t.slug='1-enoch-7-watchers-took-wives'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jasher 4:18 — *And their judges and rulers went to the daughters of men and took their wives by force from their husbands according to their choice, and the sons of men in those days took from the cattle of the earth, the beasts of the field and the fowls of the air, and taught the mixture of animals of one species with the other, in order therewith to provoke Yahuah (the Lord); and Elohim saw the whole earth and it was corrupt, for all flesh had corrupted its ways upon earth, all men and all animals.* Jasher remembers both the seizing of wives and the taught, corrupting arts of 1 Enoch 7:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en07_lookup sv, _session250_en07_lookup tv
 WHERE t.slug='1-enoch-7-watchers-took-wives'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=4 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-7-giants-born
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The Torah''s own witness to the giants born of the Watchers, exactly as 1 Enoch 7:2.'
  FROM cross_reference_threads t, cross_references x, _session250_en07_lookup sv, _session250_en07_lookup tv
 WHERE t.slug='1-enoch-7-giants-born'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 7:21 — *For owing to these three things came the flood upon the earth, namely, owing to the fornication wherein the Watchers against the law of their ordinances went a whoring after the daughters of men, and took themselves wives of all which they chose: and they made the beginning of uncleanness. And they begat sons the Nâphîdîm, and they were all unlike, and they devoured one another: and the Giants slew the Nâphîl, and the Nâphîl slew the Eljô, and the Eljô mankind, and one man another.* Jubilees names the giant brood born of the same union 1 Enoch 7:2 records, and their mutual slaughter.'
  FROM cross_reference_threads t, cross_references x, _session250_en07_lookup sv, _session250_en07_lookup tv
 WHERE t.slug='1-enoch-7-giants-born'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=7 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-7-devouring-and-blood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 9:4 — *But flesh with the life thereof, which is the blood thereof, shall ye not eat.* The blood-drinking of 1 Enoch 7:4 is the exact corruption the Creator forbids to the renewed post-flood earth.'
  FROM cross_reference_threads t, cross_references x, _session250_en07_lookup sv, _session250_en07_lookup tv
 WHERE t.slug='1-enoch-7-devouring-and-blood'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 17:14 — *For it is the life of all flesh; the blood of it is for the life thereof: therefore I said unto the children of Yashar''el (Israel), Ye shall eat the blood of no manner of flesh: for the life of all flesh is the blood thereof: whosoever eateth it shall be cut off.* The Torah''s standing blood statute marks the very line the giants of 1 Enoch 7:4 crossed when they devoured flesh and drank blood.'
  FROM cross_reference_threads t, cross_references x, _session250_en07_lookup sv, _session250_en07_lookup tv
 WHERE t.slug='1-enoch-7-devouring-and-blood'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 7:24 — *And after this they sinned against the beasts and birds, and all that moves and walks on the earth: and much blood was shed on the earth, and every imagination and desire of men imagined vanity and evil continually.* Jubilees records the same sinning against beasts and birds and the much blood shed that 1 Enoch 7:3-4 describes.'
  FROM cross_reference_threads t, cross_references x, _session250_en07_lookup sv, _session250_en07_lookup tv
 WHERE t.slug='1-enoch-7-devouring-and-blood'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=7 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-7-earth-accuses
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:11 — *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* The Torah''s verdict on the same generation whose lawlessness makes the earth itself lay accusation in 1 Enoch 7:5.'
  FROM cross_reference_threads t, cross_references x, _session250_en07_lookup sv, _session250_en07_lookup tv
 WHERE t.slug='1-enoch-7-earth-accuses'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 9:1 — *And then Michael, Uriel, Raphael, and Gabriel looked down from heaven and saw much blood being shed upon the earth, and all lawlessness being wrought upon the earth.* Enoch''s own next chapter answers the earth''s accusation of 7:5 as heaven looks down and sees the bloodshed.'
  FROM cross_reference_threads t, cross_references x, _session250_en07_lookup sv, _session250_en07_lookup tv
 WHERE t.slug='1-enoch-7-earth-accuses'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=9 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 7:25 — *And Yahuah (God) destroyed everything from off the face of the earth; because of the wickedness of their deeds, and because of the blood which they had shed in the midst of the earth He destroyed everything.* Jubilees names the shed blood as the very ground of the judgment the earth''s accusation in 1 Enoch 7:5 calls for.'
  FROM cross_reference_threads t, cross_references x, _session250_en07_lookup sv, _session250_en07_lookup tv
 WHERE t.slug='1-enoch-7-earth-accuses'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=7 AND sv.verse_number=5
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

