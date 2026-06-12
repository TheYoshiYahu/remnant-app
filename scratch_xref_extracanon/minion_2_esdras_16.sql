-- ----- fragment: minion_2esdras_16.sql (session253 2-esdras 16) -----
-- Source anchor: apocrypha/2-esdras ch16. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2esd16 (view _session253_2esd16_lookup). Sort band base 63375, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2esd16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-esdras-16-woe-babylon-unquenchable-sword
  ('apocrypha', '2-esdras', 16, 1, 'canon', 'revelation', 18, 2, 'free', E'Revelation 18:2 — *And he cried mightily with a strong voice, saying, Babylon the great is fallen, is fallen, and is become the habitation of devils, and the hold of every foul spirit, and a cage of every unclean and hateful bird.* The Babylon over whom Esdras cries woe (2 Esdras 16:1) is the same great city the angel of the Revelation declares fallen.'),
  ('apocrypha', '2-esdras', 16, 4, 'canon', 'revelation', 18, 8, 'free', E'Revelation 18:8 — *Therefore shall her plagues come in one day, death, and mourning, and famine; and she shall be utterly burned with fire: for strong is Yahuah Elohim (the Lord God) who judgeth her.* Esdras'' fire that no man may quench (2 Esdras 16:4) is the fire that utterly burns Babylon, for strong is the Yahuah who judges her.'),
  ('apocrypha', '2-esdras', 16, 3, 'canon', 'isaiah', 24, 6, 'free', E'Isaiah 24:6 — *Therefore hath the curse devoured the earth, and they that dwell therein are desolate: therefore the inhabitants of the earth are burned, and few men left.* The sword none may turn back (2 Esdras 16:3) is the curse Isaiah saw devour the earth and burn its inhabitants until few are left.'),
  -- thread: 2-esdras-16-mighty-hand-arrows-that-miss-not
  ('apocrypha', '2-esdras', 16, 12, 'canon', 'luke', 21, 25, 'free', E'Luke 21:25 — *And there shall be signs in the sun, and in the moon, and in the stars; and upon the earth distress of nations, with perplexity; the sea and the waves roaring;* The sea rising with troubled waves before Yahuah''s glory (2 Esdras 16:12) is the roaring sea and distress of nations Yahusha set as a sign of the end.'),
  ('apocrypha', '2-esdras', 16, 13, 'canon', 'isaiah', 24, 18, 'free', E'Isaiah 24:18 — *And it shall come to pass, that he who fleeth from the noise of the fear shall fall into the pit; and he that cometh up out of the midst of the pit shall be taken in the snare: for the windows from on high are open, and the foundations of the earth do shake.* The sharp arrows shot into the ends of the world that shall not miss (2 Esdras 16:13) reach the man who flees, for the very foundations shake under the opened windows on high.'),
  -- thread: 2-esdras-16-beginning-of-sorrows-famine-sword
  ('apocrypha', '2-esdras', 16, 18, 'canon', 'matthew', 24, 8, 'free', E'Matthew 24:8 — *All these are the beginning of sorrows.* Esdras'' "beginning of sorrows... beginning of famine... beginning of wars" (2 Esdras 16:18) is the very phrase Yahusha set over the wars and famines of the last days.'),
  ('apocrypha', '2-esdras', 16, 18, 'canon', 'luke', 21, 10, 'free', E'Luke 21:10 — *Then said he unto them, Nation shall rise against nation, and kingdom against kingdom:* The beginning of wars and great death (2 Esdras 16:18) is the nation-against-nation upheaval Yahusha foretold.'),
  ('apocrypha', '2-esdras', 16, 39, 'canon', 'matthew', 24, 7, 'free', E'Matthew 24:7 — *For nation shall rise against nation, and kingdom against kingdom: and there shall be famines, and pestilences, and earthquakes, in divers places.* The plagues that shall not be slack to come on the earth (2 Esdras 16:39) are the famines and pestilences Yahusha said must come on every side.'),
  -- thread: 2-esdras-16-pilgrims-sit-loose-to-the-world
  ('apocrypha', '2-esdras', 16, 42, 'canon', '1-john', 2, 15, 'free', E'1 John 2:15 — *Love not the world, neither the things that are in the world. If any man love the world, the love of the Father is not in him.* The merchandise held as if it brought no profit and the house built as if one shall not dwell in it (2 Esdras 16:42) is John''s charge not to love the world.'),
  ('apocrypha', '2-esdras', 16, 42, 'canon', '1-john', 2, 17, 'free', E'1 John 2:17 — *And the world passeth away, and the lust thereof: but he that doeth the will of Elohim (God) abideth for ever.* Esdras bids each buy and build as one who will lose it (2 Esdras 16:42) because the world is passing, and only the doer of Elohim''s will abides.'),
  ('apocrypha', '2-esdras', 16, 40, 'canon', 'revelation', 18, 4, 'free', E'Revelation 18:4 — *And I heard another voice from heaven, saying, Come out of her, my people, that ye be not partakers of her sins, and that ye receive not of her plagues.* "O my people, hear my word: make you ready" and be as pilgrims (2 Esdras 16:40) is the same heavenly summons to the remnant to come out of Babylon before her plagues.'),
  -- thread: 2-esdras-16-all-knowing-maker-and-judge
  ('apocrypha', '2-esdras', 16, 54, 'canon', 'malachi', 3, 16, 'free', E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* The Yahuah who knows every thought and heart (2 Esdras 16:54) writes the fearers'' very words in His book of remembrance.'),
  ('apocrypha', '2-esdras', 16, 66, 'canon', 'luke', 21, 36, 'free', E'Luke 21:36 — *Watch ye therefore, and pray always, that ye may be accounted worthy to escape all these things that shall come to pass, and to stand before the Son of Adam.* Esdras'' question "how will you hide your sins before Yahuah and his angels?" (2 Esdras 16:66) drives to the watchfulness Yahusha commands so that one may stand before the Son of Adam.'),
  -- thread: 2-esdras-16-chosen-tried-as-gold-kept-through-trouble
  ('apocrypha', '2-esdras', 16, 73, 'canon', '1-peter', 1, 7, 'free', E'1 Peter 1:7 — *That the trial of your faith, being much more precious than of gold that perisheth, though it be tried with fire, might be found unto praise and honour and glory at the appearing of Yahusha HaMashiach (Jesus Christ):* The chosen tried as gold in the fire (2 Esdras 16:73) is Peter''s trial of faith, more precious than perishing gold, proven by fire unto glory.'),
  ('apocrypha', '2-esdras', 16, 73, 'canon', 'zechariah', 13, 9, 'free', E'Zechariah 13:9 — *And I will bring the third part through the fire, and will refine them as silver is refined, and will try them as gold is tried: they shall call on my name, and I will hear them: I will say, It is my people: and they shall say, Yahuah (LORD) is my Elohim (God).* The trying of the chosen as gold (2 Esdras 16:73) is the refining of the remnant third whom Yahuah brings through the fire and claims as His people.'),
  ('apocrypha', '2-esdras', 16, 74, 'canon', 'matthew', 24, 13, 'free', E'Matthew 24:13 — *But he that shall endure unto the end, the same shall be saved.* The beloved told the days of trouble are at hand but "I will deliver you from the same" (2 Esdras 16:74) is the endurance unto the end Yahusha promises shall be saved.'),
  ('apocrypha', '2-esdras', 16, 76, 'canon', 'luke', 21, 36, 'free', E'Luke 21:36 — *Watch ye therefore, and pray always, that ye may be accounted worthy to escape all these things that shall come to pass, and to stand before the Son of Adam.* Yahuah''s guidance of them who keep His commandments and precepts (2 Esdras 16:76) is the watching and praying by which the kept remnant escapes and stands before the Son of Adam.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2esd16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2esd16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-16-woe-babylon-unquenchable-sword',
       E'Woe, Babylon — the sword and fire none can turn back',
       E'The woes open over the nations of the world-system: *Woe be to you, Babylon, and Asia! woe be to you, Egypt and Syria!* (2 Esdras 16:1), and the judgment is sent past all recall — *A sword is sent upon you, and who may turn it back?* (2 Esdras 16:3) — *A fire is sent among you, and who may quench it?* (2 Esdras 16:4). The same Babylon falls in the Revelation, and the apostle hears the heavens answer the wail with the very wording Esdras uses for the unquenchable fire: *And he cried mightily with a strong voice, saying, Babylon the great is fallen, is fallen, and is become the habitation of devils, and the hold of every foul spirit, and a cage of every unclean and hateful bird.* (Revelation 18:2). The prophets had already pronounced the curse that *devoured the earth* — *Therefore hath the curse devoured the earth, and they that dwell therein are desolate: therefore the inhabitants of the earth are burned, and few men left.* (Isaiah 24:6). It ain''t new: the same word against the kingdom of man, sent and not turned back.',
       sv.verse_id, ev.verse_id, 'extras', 63375
  FROM _session253_2esd16_lookup sv, _session253_2esd16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=16 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-16-mighty-hand-arrows-that-miss-not',
       E'The mighty hand that bends the bow — the Creator''s wrath',
       E'The judge is no idol but the living Maker: *The mighty Yahuah (God) sends the plagues and who is he that can drive them away?* (2 Esdras 16:8) — *For strong is his right hand that bendeth the bow, his arrows that he shooteth are sharp, and shall not miss, when they begin to be shot into the ends of the world.* (2 Esdras 16:13). When He thunders the whole creation trembles — *The earth quakes, and the foundations thereof; the sea ariseth up with waves from the deep, and the waves of it are troubled* (2 Esdras 16:12). Yahusha foretold the same shaking before the end: *And there shall be signs in the sun, and in the moon, and in the stars; and upon the earth distress of nations, with perplexity; the sea and the waves roaring;* (Luke 21:25). And Isaiah saw the very foundations heave — *for the windows from on high are open, and the foundations of the earth do shake.* (Isaiah 24:18). The arrows of the Almighty do not miss.',
       sv.verse_id, ev.verse_id, 'extras', 63378
  FROM _session253_2esd16_lookup sv, _session253_2esd16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=16 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-16-beginning-of-sorrows-famine-sword',
       E'The beginning of sorrows — famine, sword, and great death',
       E'The tribulation is named as a birth-onset: *The beginning of sorrows and great mournings; the beginning of famine and great death; the beginning of wars, and the powers shall stand in fear; the beginning of evils!* (2 Esdras 16:18), and the pangs come quick as travail — *Even so shall not the plagues be slack to come upon the earth, and the world shall mourn, and sorrows shall come upon it on every side.* (2 Esdras 16:39). Yahusha used the identical figure for the last days: *For nation shall rise against nation, and kingdom against kingdom: and there shall be famines, and pestilences, and earthquakes, in divers places.* (Matthew 24:7) — *All these are the beginning of sorrows.* (Matthew 24:8). And Luke heard Him list the same scourges — *Then said he unto them, Nation shall rise against nation, and kingdom against kingdom:* (Luke 21:10). It ain''t new: the beginning of sorrows is the same birth-pang in both witnesses.',
       sv.verse_id, ev.verse_id, 'extras', 63381
  FROM _session253_2esd16_lookup sv, _session253_2esd16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=16 AND ev.verse_number=39
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-16-pilgrims-sit-loose-to-the-world',
       E'Be as pilgrims — buy as one who will lose, build as one who shall not dwell',
       E'★ The call to the elect: sit loose to the perishing world-system and be ready. *O my people, hear my word: make you ready to your battle, and in those evils be even as pilgrims upon the earth.* (2 Esdras 16:40) — *He that selleth, let him be as he that fleeth away: and he that buyeth, as one that will lose:* (2 Esdras 16:41) — *He that occupieth merchandise, as he that has no profit by it: and he that buildeth, as he that shall not dwell in it:* (2 Esdras 16:42). John gives the same charge by the contrary command — *Love not the world, neither the things that are in the world. If any man love the world, the love of the Father is not in him.* (1 John 2:15) — *And the world passeth away, and the lust thereof: but he that doeth the will of Elohim (God) abideth for ever.* (1 John 2:17). And Yahusha''s voice from heaven calls the remnant clean out of the doomed city — *Come out of her, my people, that ye be not partakers of her sins, and that ye receive not of her plagues.* (Revelation 18:4). Hold the world as a pilgrim holds a road he is only passing.',
       sv.verse_id, ev.verse_id, 'extras', 63384
  FROM _session253_2esd16_lookup sv, _session253_2esd16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=40
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=16 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-16-all-knowing-maker-and-judge',
       E'The Maker who spoke the world knows every hidden sin',
       E'The judge before whom no sin can hide is the Creator Himself: *Behold, Yahuah (God) knoweth all the works of men, their imaginations, their thoughts, and their hearts:* (2 Esdras 16:54) — *Which spoke but the word, Let the earth be made; and it was made: Let the heaven be made; and it was created.* (2 Esdras 16:55) — *In his word were the stars made, and he knoweth the number of them.* (2 Esdras 16:56). Therefore no concealment avails — *What will you do? or how will you hide your sins before Yahuah (God) and his angels?* (2 Esdras 16:66). The fearers of Yahuah are written in His book even now — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* (Malachi 3:16). And the same Maker who spoke the worlds is the Word by whom all hidden things are searched — *And the world passeth away, and the lust thereof: but he that doeth the will of Elohim (God) abideth for ever.* (1 John 2:17). The word that made the stars numbers your thoughts.',
       sv.verse_id, ev.verse_id, 'extras', 63387
  FROM _session253_2esd16_lookup sv, _session253_2esd16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=54
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=16 AND ev.verse_number=66
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-16-chosen-tried-as-gold-kept-through-trouble',
       E'My chosen tried as gold — kept through the days of trouble',
       E'★ The seed sealed and kept: the persecution of those that fear Yahuah is the very furnace that reveals the elect — *Then shall they be known, who are my chosen; and they shall be tried as the gold in the fire.* (2 Esdras 16:73). Then comes the promise to the beloved remnant — *Hear, O you my beloved, says Yahuah (God): behold, the days of trouble are at hand, but I will deliver you from the same.* (2 Esdras 16:74) — the guide of *them who keep my commandments and precepts* (2 Esdras 16:76). Peter says the same of the scattered elect — *That the trial of your faith, being much more precious than of gold that perisheth, though it be tried with fire, might be found unto praise and honour and glory at the appearing of Yahusha HaMashiach (Jesus Christ):* (1 Peter 1:7). The prophets foresaw the refining of the remnant — *And I will bring the third part through the fire, and will refine them as silver is refined, and will try them as gold is tried: they shall call on my name, and I will hear them: I will say, It is my people* (Zechariah 13:9). And Yahusha''s word to the kept seed is the promise of endurance — *But he that shall endure unto the end, the same shall be saved.* (Matthew 24:13). The chosen are not consumed by the fire but proven by it — election before confession, the remnant of both houses kept whole.',
       sv.verse_id, ev.verse_id, 'extras', 63390
  FROM _session253_2esd16_lookup sv, _session253_2esd16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=73
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=16 AND ev.verse_number=78
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-esdras-16-woe-babylon-unquenchable-sword
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 18:2 — *And he cried mightily with a strong voice, saying, Babylon the great is fallen, is fallen, and is become the habitation of devils, and the hold of every foul spirit, and a cage of every unclean and hateful bird.* The Babylon over whom Esdras cries woe (2 Esdras 16:1) is the same great city the angel of the Revelation declares fallen.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-woe-babylon-unquenchable-sword'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=18 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 18:8 — *Therefore shall her plagues come in one day, death, and mourning, and famine; and she shall be utterly burned with fire: for strong is Yahuah Elohim (the Lord God) who judgeth her.* Esdras'' fire that no man may quench (2 Esdras 16:4) is the fire that utterly burns Babylon, for strong is the Yahuah who judges her.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-woe-babylon-unquenchable-sword'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=18 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 24:6 — *Therefore hath the curse devoured the earth, and they that dwell therein are desolate: therefore the inhabitants of the earth are burned, and few men left.* The sword none may turn back (2 Esdras 16:3) is the curse Isaiah saw devour the earth and burn its inhabitants until few are left.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-woe-babylon-unquenchable-sword'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-16-mighty-hand-arrows-that-miss-not
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 21:25 — *And there shall be signs in the sun, and in the moon, and in the stars; and upon the earth distress of nations, with perplexity; the sea and the waves roaring;* The sea rising with troubled waves before Yahuah''s glory (2 Esdras 16:12) is the roaring sea and distress of nations Yahusha set as a sign of the end.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-mighty-hand-arrows-that-miss-not'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=21 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 24:18 — *And it shall come to pass, that he who fleeth from the noise of the fear shall fall into the pit; and he that cometh up out of the midst of the pit shall be taken in the snare: for the windows from on high are open, and the foundations of the earth do shake.* The sharp arrows shot into the ends of the world that shall not miss (2 Esdras 16:13) reach the man who flees, for the very foundations shake under the opened windows on high.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-mighty-hand-arrows-that-miss-not'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-16-beginning-of-sorrows-famine-sword
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 24:8 — *All these are the beginning of sorrows.* Esdras'' "beginning of sorrows... beginning of famine... beginning of wars" (2 Esdras 16:18) is the very phrase Yahusha set over the wars and famines of the last days.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-beginning-of-sorrows-famine-sword'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 21:10 — *Then said he unto them, Nation shall rise against nation, and kingdom against kingdom:* The beginning of wars and great death (2 Esdras 16:18) is the nation-against-nation upheaval Yahusha foretold.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-beginning-of-sorrows-famine-sword'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=21 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 24:7 — *For nation shall rise against nation, and kingdom against kingdom: and there shall be famines, and pestilences, and earthquakes, in divers places.* The plagues that shall not be slack to come on the earth (2 Esdras 16:39) are the famines and pestilences Yahusha said must come on every side.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-beginning-of-sorrows-famine-sword'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-16-pilgrims-sit-loose-to-the-world
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 John 2:15 — *Love not the world, neither the things that are in the world. If any man love the world, the love of the Father is not in him.* The merchandise held as if it brought no profit and the house built as if one shall not dwell in it (2 Esdras 16:42) is John''s charge not to love the world.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-pilgrims-sit-loose-to-the-world'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 2:17 — *And the world passeth away, and the lust thereof: but he that doeth the will of Elohim (God) abideth for ever.* Esdras bids each buy and build as one who will lose it (2 Esdras 16:42) because the world is passing, and only the doer of Elohim''s will abides.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-pilgrims-sit-loose-to-the-world'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 18:4 — *And I heard another voice from heaven, saying, Come out of her, my people, that ye be not partakers of her sins, and that ye receive not of her plagues.* "O my people, hear my word: make you ready" and be as pilgrims (2 Esdras 16:40) is the same heavenly summons to the remnant to come out of Babylon before her plagues.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-pilgrims-sit-loose-to-the-world'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=18 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-16-all-knowing-maker-and-judge
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* The Yahuah who knows every thought and heart (2 Esdras 16:54) writes the fearers'' very words in His book of remembrance.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-all-knowing-maker-and-judge'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=54
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 21:36 — *Watch ye therefore, and pray always, that ye may be accounted worthy to escape all these things that shall come to pass, and to stand before the Son of Adam.* Esdras'' question "how will you hide your sins before Yahuah and his angels?" (2 Esdras 16:66) drives to the watchfulness Yahusha commands so that one may stand before the Son of Adam.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-all-knowing-maker-and-judge'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=66
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=21 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-16-chosen-tried-as-gold-kept-through-trouble
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Peter 1:7 — *That the trial of your faith, being much more precious than of gold that perisheth, though it be tried with fire, might be found unto praise and honour and glory at the appearing of Yahusha HaMashiach (Jesus Christ):* The chosen tried as gold in the fire (2 Esdras 16:73) is Peter''s trial of faith, more precious than perishing gold, proven by fire unto glory.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-chosen-tried-as-gold-kept-through-trouble'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=73
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 13:9 — *And I will bring the third part through the fire, and will refine them as silver is refined, and will try them as gold is tried: they shall call on my name, and I will hear them: I will say, It is my people: and they shall say, Yahuah (LORD) is my Elohim (God).* The trying of the chosen as gold (2 Esdras 16:73) is the refining of the remnant third whom Yahuah brings through the fire and claims as His people.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-chosen-tried-as-gold-kept-through-trouble'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=73
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=13 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 24:13 — *But he that shall endure unto the end, the same shall be saved.* The beloved told the days of trouble are at hand but "I will deliver you from the same" (2 Esdras 16:74) is the endurance unto the end Yahusha promises shall be saved.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-chosen-tried-as-gold-kept-through-trouble'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=74
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 21:36 — *Watch ye therefore, and pray always, that ye may be accounted worthy to escape all these things that shall come to pass, and to stand before the Son of Adam.* Yahuah''s guidance of them who keep His commandments and precepts (2 Esdras 16:76) is the watching and praying by which the kept remnant escapes and stands before the Son of Adam.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd16_lookup sv, _session253_2esd16_lookup tv
 WHERE t.slug='2-esdras-16-chosen-tried-as-gold-kept-through-trouble'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=16 AND sv.verse_number=76
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=21 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

