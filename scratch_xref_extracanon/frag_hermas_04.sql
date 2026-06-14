-- ----- fragment: minion_hermas_04.sql (session253 hermas 4) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm4 (view _session253_herm4_lookup). Sort band base 71575, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm4_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-4-beast-great-tribulation
  ('lightfoot-apostolic-fathers', 'hermas', 4, 1, 'canon', 'matthew', 24, 21, 'free', E'Matthew 24:21 — *For then shall be great tribulation, such as was not since the beginning of the world to this time, no, nor ever shall be.* The Messiah names the very tribulation the beast of Hermas 4:1 is shown to typify.'),
  ('lightfoot-apostolic-fathers', 'hermas', 4, 1, 'canon', 'matthew', 24, 13, 'free', E'Matthew 24:13 — *But he that shall endure unto the end, the same shall be saved.* Hermas passes the beast by faith and is unhurt, as the Master promises the enduring one in Hermas 4:1.'),
  ('lightfoot-apostolic-fathers', 'hermas', 4, 1, 'canon', '1-peter', 1, 7, 'free', E'1 Peter 1:7 — *That the trial of your faith, being much more precious than of gold that perisheth, though it be tried with fire, might be found unto praise and honour and glory at the appearing of Yahusha HaMashiach (Jesus Christ):* The fiery beast is the trial of faith more precious than gold that Hermas 4:1 endures unmoved.'),
  -- thread: hermas-4-repent-whole-heart-cast-care
  ('lightfoot-apostolic-fathers', 'hermas', 4, 2, 'canon', 'ezekiel', 18, 30, 'free', E'Ezekiel 18:30 — *Therefore I will judge you, O house of Yashar''el (Israel), every one according to his ways, saith Adonai Yahuah (the Lord GOD). Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin.* The prophet''s whole-hearted turning is the very repentance the Church urges in Hermas 4:2.'),
  ('lightfoot-apostolic-fathers', 'hermas', 4, 2, 'canon', '2-peter', 3, 9, 'free', E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* The longsuffering that gives time to prepare and repent is the mercy Hermas 4:2 declares to the elect.'),
  ('lightfoot-apostolic-fathers', 'hermas', 4, 2, 'canon', 'psalms', 55, 22, 'free', E'Psalm 55:22 — *Cast thy burden upon Yahuah (LORD), and he shall sustain thee: he shall never suffer the righteous to be moved.* The Psalmist''s casting of the burden is word-for-word the counsel that delivered Hermas in 4:2.'),
  ('lightfoot-apostolic-fathers', 'hermas', 4, 2, 'canon', '1-peter', 5, 7, 'free', E'1 Peter 5:7 — *Casting all your care upon him; for he careth for you.* Peter repeats the same exhortation the Church gives Hermas, to cast every care upon Yahuah in 4:2.'),
  -- thread: hermas-4-gold-tried-fire-tower-elect
  ('lightfoot-apostolic-fathers', 'hermas', 4, 3, 'canon', 'malachi', 3, 3, 'free', E'Malachi 3:3 — *And he shall sit as a refiner and purifier of silver: and he shall purify the sons of Levi, and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness.* The refiner''s fire that purges gold is exactly the testing that makes the saints useful for the tower in Hermas 4:3.'),
  ('lightfoot-apostolic-fathers', 'hermas', 4, 3, 'canon', 'zechariah', 13, 9, 'free', E'Zechariah 13:9 — *And I will bring the third part through the fire, and will refine them as silver is refined, and will try them as gold is tried: they shall call on my name, and I will hear them: I will say, It is my people: and they shall say, Yahuah (LORD) is my Elohim (God).* The remnant brought through the fire and tried as gold is the very purifying of the golden ones in Hermas 4:3.'),
  ('lightfoot-apostolic-fathers', 'hermas', 4, 3, 'canon', '1-peter', 2, 5, 'free', E'1 Peter 2:5 — *Ye also, as lively stones, are built up a spiritual house, an holy priesthood, to offer up spiritual sacrifices, acceptable to Elohim (God) by Yahusha HaMashiach (Jesus Christ).* The living-stone house is the tower the purified are made useful to build in Hermas 4:3.'),
  ('lightfoot-apostolic-fathers', 'hermas', 4, 3, 'canon', 'revelation', 21, 27, 'free', E'Revelation 21:27 — *And there shall in no wise enter into it any thing that defileth, neither whatsoever worketh abomination, or maketh a lie: but they which are written in the Lamb''s book of life.* The white coming-age where the elect without spot dwell is the New Jerusalem of Hermas 4:3, entered only by the undefiled.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm4_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm4_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-4-beast-great-tribulation',
       E'The beast — a type of the great tribulation to come',
       E'Hermas sees the fourth vision *for a type of the impending tribulation* — *a huge beast like some sea-monster, and from its mouth fiery locusts issued forth* — and the word comes, *Be not of doubtful mind, Hermas*. Having *put on the faith of Yahuah (Lord)* he passes through unhurt: the beast *stretcheth itself on the ground... and stirred not at all until I had passed by it*. It ain''t new. The Master Himself named the beast''s hour: *For then shall be great tribulation, such as was not since the beginning of the world to this time, no, nor ever shall be* (Matthew 24:21) — yet the promise stands for the faithful, *But he that shall endure unto the end, the same shall be saved* (Matthew 24:13). And the trial is not wrath but refining: *That the trial of your faith, being much more precious than of gold that perisheth, though it be tried with fire, might be found unto praise and honour and glory at the appearing of Yahusha HaMashiach (Jesus Christ)* (1 Peter 1:7). The doubtful mind is the only enemy; the faith of Yahuah shuts the lion''s mouth.',
       sv.verse_id, ev.verse_id, 'extras', 71575
  FROM _session253_herm4_lookup sv, _session253_herm4_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=4 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-4-repent-whole-heart-cast-care',
       E'Repent with your whole heart — cast your care upon Yahuah',
       E'The Church charges Hermas: *declare to the elect of Yahuah (Lord) His mighty works*, for *If therefore ye prepare yourselves beforehand, and repent (and turn) unto Yahuah (Lord) with your whole heart, ye shall be able to escape it.* And the counsel that saved him: *thou didst cast thy care upon Elohim (God), and didst open thy heart to Yahuah (Lord)... Cast your cares upon Yahuah (Lord) and He will set them straight.* It ain''t new — this is the second repentance offered to the fallen, the everlasting call of the prophets: *Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin* (Ezekiel 18:30); and the patience of Elohim that holds the door, *not willing that any should perish, but that all should come to repentance* (2 Peter 3:9). The casting of care is straight from the Psalter, *Cast thy burden upon Yahuah (LORD), and he shall sustain thee* (Psalm 55:22), echoed by the apostle, *Casting all your care upon him; for he careth for you* (1 Peter 5:7). The elect are charged before they confess; the commandment to turn stands.',
       sv.verse_id, ev.verse_id, 'extras', 71578
  FROM _session253_herm4_lookup sv, _session253_herm4_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=4 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=4 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-4-gold-tried-fire-tower-elect',
       E'Gold tried in the fire — the elect built into the tower',
       E'The four colours are unfolded: *as the gold is tested by the fire and is made useful, so ye also... are being tested in yourselves. Ye then that abide and pass through the fire will be purified by it... and shall be useful for the building of the tower. But the white portion is the coming age, in which the elect of Elohim (God) shall dwell; because the elect of Elohim (God) shall be without spot and pure unto life eternal.* It ain''t new. The refining fire is the prophet''s: *And he shall sit as a refiner and purifier of silver: and he shall purify the sons of Levi, and purge them as gold and silver* (Malachi 3:3); and the remnant passed through it, *And I will bring the third part through the fire, and will refine them as silver is refined, and will try them as gold is tried: they shall call on my name, and I will hear them* (Zechariah 13:9). The tower is the house of living stones, *Ye also, as lively stones, are built up a spiritual house, an holy priesthood* (1 Peter 2:5); and into the white age, the New Jerusalem, *there shall in no wise enter into it any thing that defileth... but they which are written in the Lamb''s book of life* (Revelation 21:27) — the elect without spot, tried and fitted before they are placed.',
       sv.verse_id, ev.verse_id, 'extras', 71581
  FROM _session253_herm4_lookup sv, _session253_herm4_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=4 AND sv.verse_number=3
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=4 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-4-beast-great-tribulation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 24:21 — *For then shall be great tribulation, such as was not since the beginning of the world to this time, no, nor ever shall be.* The Messiah names the very tribulation the beast of Hermas 4:1 is shown to typify.'
  FROM cross_reference_threads t, cross_references x, _session253_herm4_lookup sv, _session253_herm4_lookup tv
 WHERE t.slug='hermas-4-beast-great-tribulation'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 24:13 — *But he that shall endure unto the end, the same shall be saved.* Hermas passes the beast by faith and is unhurt, as the Master promises the enduring one in Hermas 4:1.'
  FROM cross_reference_threads t, cross_references x, _session253_herm4_lookup sv, _session253_herm4_lookup tv
 WHERE t.slug='hermas-4-beast-great-tribulation'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 1:7 — *That the trial of your faith, being much more precious than of gold that perisheth, though it be tried with fire, might be found unto praise and honour and glory at the appearing of Yahusha HaMashiach (Jesus Christ):* The fiery beast is the trial of faith more precious than gold that Hermas 4:1 endures unmoved.'
  FROM cross_reference_threads t, cross_references x, _session253_herm4_lookup sv, _session253_herm4_lookup tv
 WHERE t.slug='hermas-4-beast-great-tribulation'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-4-repent-whole-heart-cast-care
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 18:30 — *Therefore I will judge you, O house of Yashar''el (Israel), every one according to his ways, saith Adonai Yahuah (the Lord GOD). Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin.* The prophet''s whole-hearted turning is the very repentance the Church urges in Hermas 4:2.'
  FROM cross_reference_threads t, cross_references x, _session253_herm4_lookup sv, _session253_herm4_lookup tv
 WHERE t.slug='hermas-4-repent-whole-heart-cast-care'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* The longsuffering that gives time to prepare and repent is the mercy Hermas 4:2 declares to the elect.'
  FROM cross_reference_threads t, cross_references x, _session253_herm4_lookup sv, _session253_herm4_lookup tv
 WHERE t.slug='hermas-4-repent-whole-heart-cast-care'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 55:22 — *Cast thy burden upon Yahuah (LORD), and he shall sustain thee: he shall never suffer the righteous to be moved.* The Psalmist''s casting of the burden is word-for-word the counsel that delivered Hermas in 4:2.'
  FROM cross_reference_threads t, cross_references x, _session253_herm4_lookup sv, _session253_herm4_lookup tv
 WHERE t.slug='hermas-4-repent-whole-heart-cast-care'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=55 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 5:7 — *Casting all your care upon him; for he careth for you.* Peter repeats the same exhortation the Church gives Hermas, to cast every care upon Yahuah in 4:2.'
  FROM cross_reference_threads t, cross_references x, _session253_herm4_lookup sv, _session253_herm4_lookup tv
 WHERE t.slug='hermas-4-repent-whole-heart-cast-care'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-4-gold-tried-fire-tower-elect
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 3:3 — *And he shall sit as a refiner and purifier of silver: and he shall purify the sons of Levi, and purge them as gold and silver, that they may offer unto Yahuah (LORD) an offering in righteousness.* The refiner''s fire that purges gold is exactly the testing that makes the saints useful for the tower in Hermas 4:3.'
  FROM cross_reference_threads t, cross_references x, _session253_herm4_lookup sv, _session253_herm4_lookup tv
 WHERE t.slug='hermas-4-gold-tried-fire-tower-elect'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 13:9 — *And I will bring the third part through the fire, and will refine them as silver is refined, and will try them as gold is tried: they shall call on my name, and I will hear them: I will say, It is my people: and they shall say, Yahuah (LORD) is my Elohim (God).* The remnant brought through the fire and tried as gold is the very purifying of the golden ones in Hermas 4:3.'
  FROM cross_reference_threads t, cross_references x, _session253_herm4_lookup sv, _session253_herm4_lookup tv
 WHERE t.slug='hermas-4-gold-tried-fire-tower-elect'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=13 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 2:5 — *Ye also, as lively stones, are built up a spiritual house, an holy priesthood, to offer up spiritual sacrifices, acceptable to Elohim (God) by Yahusha HaMashiach (Jesus Christ).* The living-stone house is the tower the purified are made useful to build in Hermas 4:3.'
  FROM cross_reference_threads t, cross_references x, _session253_herm4_lookup sv, _session253_herm4_lookup tv
 WHERE t.slug='hermas-4-gold-tried-fire-tower-elect'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 21:27 — *And there shall in no wise enter into it any thing that defileth, neither whatsoever worketh abomination, or maketh a lie: but they which are written in the Lamb''s book of life.* The white coming-age where the elect without spot dwell is the New Jerusalem of Hermas 4:3, entered only by the undefiled.'
  FROM cross_reference_threads t, cross_references x, _session253_herm4_lookup sv, _session253_herm4_lookup tv
 WHERE t.slug='hermas-4-gold-tried-fire-tower-elect'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

