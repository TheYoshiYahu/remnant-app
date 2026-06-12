-- ----- fragment: minion_apocalypseofabraham_14.sql (session253 apocalypse-of-abraham 14) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch14. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa14 (view _session253_aoa14_lookup). Sort band base 67325, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-14-rebuke-azazel-scapegoat
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 14, 4, 'canon', 'leviticus', 16, 10, 'free', E'Leviticus 16:10 — *But the goat, on which the lot fell to be the scapegoat, shall be presented alive before Yahuah (LORD), to make an atonement with him, and to let him go for a scapegoat into the wilderness.* The Day of Atonement already drives Azazel out into the desert, exactly the ''inaccessible parts of the earth'' to which Abraham banishes him in 14:4.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 14, 4, 'enoch', '1-enoch', 10, 4, 'extras', E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* The Watchers'' apocalypse names the same fallen one and consigns him to the same desert pit Abraham invokes in 14:4.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 14, 4, 'enoch', '1-enoch', 10, 6, 'extras', E'1 Enoch 10:6 — *And on the day of the great judgement he shall be cast into the fire.* Abraham''s word makes Azazel ''the burning coal of the Furnace of the earth'' (14:4) — the same fire reserved for him at the great judgement.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 14, 4, 'enoch', '1-enoch', 10, 8, 'extras', E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.* This is the ''heritage'' and ''enmity'' Abraham assigns him in 14:4 — the corrupter of the earth, to whom all sin is ascribed.'),
  -- thread: apocalypse-of-abraham-14-stars-clouds-watchers-taught
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 14, 4, 'enoch', '1-enoch', 8, 1, 'extras', E'1 Enoch 8:1 — *And Azâzêl taught men to make swords, and knives, and shields, and breastplates, and made known to them the metals of the earth and the art of working them, and bracelets, and ornaments, and the use of antimony, and the beautifying of the eyelids, and all kinds of costly stones, and all colouring tinctures.* Named there as the teacher of the earth''s hidden craft, this is the very one whom 14:3 calls scatterer of ''the secrets of heaven.'''),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 14, 4, 'enoch', '1-enoch', 8, 2, 'extras', E'1 Enoch 8:2 — *And there arose much godlessness, and they committed fornication, and they were led astray, and became corrupt in all their ways. Semjâzâ taught enchantments, and root-cuttings, Armârôs the resolving of enchantments, Barâqîjâl taught astrology, Kôkabêl the constellations, Ezêqêêl the knowledge of the clouds, Araqiêl the signs of the earth, Shamsiêl the signs of the sun, and Sariêl the course of the moon. And as men perished, they cried, and their cry went up to heaven.* The Watchers'' stolen lore of constellations and clouds is exactly the ''stars and clouds'' Abraham binds to Azazel''s portion in 14:4.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 14, 3, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The apostle confirms the sentence on the one who ''hath rebelled against the Mighty One'' (14:3) — chains and darkness reserved for the great judgement.'),
  -- thread: apocalypse-of-abraham-14-answer-him-not-resist
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 14, 8, 'canon', 'james', 4, 7, 'free', E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* The apostle''s rule is the angel''s counsel of 14:8-9 — give the adversary no foothold, and his ''will'' has no free course.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 14, 8, 'canon', 'revelation', 20, 2, 'free', E'Revelation 20:2 — *And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years.* The adversary Abraham refuses to answer is the same old serpent finally laid hold of and bound in the vision''s end.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 14, 3, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* He who ''slandereth truth'' (14:3) is the deceiver of the whole world, cast out — the accuser overthrown, not appeased.'),
  -- thread: apocalypse-of-abraham-14-name-bearing-angel
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 14, 5, 'canon', 'exodus', 23, 21, 'free', E'Exodus 23:21 — *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him.* The angel who teaches Abraham the word of rebuke (14:5) is the Name-bearing angel — Yahoel — in whom the very Name dwells.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 14, 5, 'canon', 'exodus', 23, 20, 'free', E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* The sent angel who keeps and leads is the same office as the guide who commands and teaches Abraham every word in 14:5,10.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 14, 10, 'canon', 'zechariah', 3, 1, 'free', E'Zechariah 3:1 — *And he shewed me Joshua the high priest standing before the angel of Yahuah (LORD), and Satan standing at his right hand to resist him.* The accuser stands to resist before the angel of Yahuah, exactly as Azazel stands before Abraham and the angel — and in both the adversary is rebuked, not answered (14:10).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-14-rebuke-azazel-scapegoat',
       E'Go, Azazel — the burning coal, the scapegoat into the wilderness',
       E'The angel arms Abraham with the word of rebuke: *Say to him: ''Be thou the burning coal of the Furnace of the earth; go, Azazel, into the inaccessible parts of the earth; for thy heritage is to be over those existing with thee, being born with the stars and clouds, with the men whose portion thou art, and who through thy being exist; and thine enmity is justification.* It ain''t new. The Day of Atonement already drove a lot-cast adversary out into the desert: *But the goat, on which the lot fell to be the scapegoat, shall be presented alive before Yahuah (LORD), to make an atonement with him, and to let him go for a scapegoat into the wilderness* (Leviticus 16:10) — the Hebrew names that goat *Azazel*. And the Watchers'' apocalypse already sentenced him by name: *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein* (1 Enoch 10:4) — *And on the day of the great judgement he shall be cast into the fire* (1 Enoch 10:6), the very Furnace Abraham names. *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin* (1 Enoch 10:8) — that is the ''heritage'' and the ''enmity.'' The adversary is sent OUT; he is not worshipped, he is dismissed.',
       sv.verse_id, ev.verse_id, 'extras', 67325
  FROM _session253_aoa14_lookup sv, _session253_aoa14_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=4
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=14 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-14-stars-clouds-watchers-taught',
       E'Born with the stars and clouds — the secrets scattered, the Watchers'' craft',
       E'Abraham''s rebuke charges Azazel with the men *being born with the stars and clouds, with the men whose portion thou art* (14:4), and earlier the angel names him as the one *who hath scattered over the earth the secrets of heaven and hath rebelled against the Mighty One* (14:3). It ain''t new. The Watchers'' indictment is precisely this scattering of forbidden secrets: *And Azâzêl taught men to make swords, and knives, and shields, and breastplates, and made known to them the metals of the earth and the art of working them* (1 Enoch 8:1) — *Barâqîjâl taught astrology, Kôkabêl the constellations... Ezêqêêl the knowledge of the clouds* (1 Enoch 8:2), the very stars and clouds of Abraham''s verdict. And the apostle ratifies the sentence on the rebels: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6). The ''secrets of heaven'' were stolen and scattered; Abraham, son of the idol-maker, hands them back to the dark.',
       sv.verse_id, ev.verse_id, 'extras', 67328
  FROM _session253_aoa14_lookup sv, _session253_aoa14_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=14 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-14-answer-him-not-resist',
       E'Answer him not — the adversary rebuked, the chosen given authority',
       E'Twice the angel warns: *Answer him not; for Elohim (God) hath given him power (lit. will) over those who do answer him* (14:8), *that his will may have no free course in thee* (14:9). And Abraham is told the Eternal One *hath chosen thee, He whom thou lovest; be of good courage and use this authority... against him who slandereth truth* (14:3). It ain''t new. The same posture stands across the witness: *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you* (James 4:7). It is the rebuke itself, not parley, that drives him out — *And I saw an angel come down from heaven, having the key of the bottomless pit and a great chain in his hand* (Revelation 20:1) — *And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years* (Revelation 20:2). The accuser who *slandereth truth* is the one *which deceiveth the whole world* — *he was cast out into the earth, and his angels were cast out with him* (Revelation 12:9). The chosen one does not negotiate with the system; he stands in given authority and says, *go, Azazel.*',
       sv.verse_id, ev.verse_id, 'extras', 67331
  FROM _session253_aoa14_lookup sv, _session253_aoa14_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=8
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=14 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-14-name-bearing-angel',
       E'The angel who teaches the word — my Name is in him',
       E'Abraham does nothing of himself; he speaks only *the words which the angel had taught me* (14:5), and obeys: *I did what was commanded me by the angel; and however much he spake to me, I answered him nothing whatsoever* (14:10). It ain''t new. The wilderness generation was given just such a Name-bearing guide: *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared* (Exodus 23:20) — *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him* (Exodus 23:21). This is Yahoel, the angel who bears the Name, in whom the authority resides. And the pattern of the accuser silenced before the high priest is the same scene from the other side: *And he shewed me Joshua the high priest standing before the angel of Yahuah (LORD), and Satan standing at his right hand to resist him* (Zechariah 3:1) — there too the adversary is rebuked, not answered.',
       sv.verse_id, ev.verse_id, 'extras', 67334
  FROM _session253_aoa14_lookup sv, _session253_aoa14_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=5
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=14 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-14-rebuke-azazel-scapegoat
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 16:10 — *But the goat, on which the lot fell to be the scapegoat, shall be presented alive before Yahuah (LORD), to make an atonement with him, and to let him go for a scapegoat into the wilderness.* The Day of Atonement already drives Azazel out into the desert, exactly the ''inaccessible parts of the earth'' to which Abraham banishes him in 14:4.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa14_lookup sv, _session253_aoa14_lookup tv
 WHERE t.slug='apocalypse-of-abraham-14-rebuke-azazel-scapegoat'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* The Watchers'' apocalypse names the same fallen one and consigns him to the same desert pit Abraham invokes in 14:4.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa14_lookup sv, _session253_aoa14_lookup tv
 WHERE t.slug='apocalypse-of-abraham-14-rebuke-azazel-scapegoat'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 10:6 — *And on the day of the great judgement he shall be cast into the fire.* Abraham''s word makes Azazel ''the burning coal of the Furnace of the earth'' (14:4) — the same fire reserved for him at the great judgement.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa14_lookup sv, _session253_aoa14_lookup tv
 WHERE t.slug='apocalypse-of-abraham-14-rebuke-azazel-scapegoat'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.* This is the ''heritage'' and ''enmity'' Abraham assigns him in 14:4 — the corrupter of the earth, to whom all sin is ascribed.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa14_lookup sv, _session253_aoa14_lookup tv
 WHERE t.slug='apocalypse-of-abraham-14-rebuke-azazel-scapegoat'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-14-stars-clouds-watchers-taught
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 8:1 — *And Azâzêl taught men to make swords, and knives, and shields, and breastplates, and made known to them the metals of the earth and the art of working them, and bracelets, and ornaments, and the use of antimony, and the beautifying of the eyelids, and all kinds of costly stones, and all colouring tinctures.* Named there as the teacher of the earth''s hidden craft, this is the very one whom 14:3 calls scatterer of ''the secrets of heaven.'''
  FROM cross_reference_threads t, cross_references x, _session253_aoa14_lookup sv, _session253_aoa14_lookup tv
 WHERE t.slug='apocalypse-of-abraham-14-stars-clouds-watchers-taught'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=8 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 8:2 — *And there arose much godlessness, and they committed fornication, and they were led astray, and became corrupt in all their ways. Semjâzâ taught enchantments, and root-cuttings, Armârôs the resolving of enchantments, Barâqîjâl taught astrology, Kôkabêl the constellations, Ezêqêêl the knowledge of the clouds, Araqiêl the signs of the earth, Shamsiêl the signs of the sun, and Sariêl the course of the moon. And as men perished, they cried, and their cry went up to heaven.* The Watchers'' stolen lore of constellations and clouds is exactly the ''stars and clouds'' Abraham binds to Azazel''s portion in 14:4.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa14_lookup sv, _session253_aoa14_lookup tv
 WHERE t.slug='apocalypse-of-abraham-14-stars-clouds-watchers-taught'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The apostle confirms the sentence on the one who ''hath rebelled against the Mighty One'' (14:3) — chains and darkness reserved for the great judgement.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa14_lookup sv, _session253_aoa14_lookup tv
 WHERE t.slug='apocalypse-of-abraham-14-stars-clouds-watchers-taught'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-14-answer-him-not-resist
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 4:7 — *Submit yourselves therefore to Elohim (God). Resist the devil, and he will flee from you.* The apostle''s rule is the angel''s counsel of 14:8-9 — give the adversary no foothold, and his ''will'' has no free course.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa14_lookup sv, _session253_aoa14_lookup tv
 WHERE t.slug='apocalypse-of-abraham-14-answer-him-not-resist'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 20:2 — *And he laid hold on the dragon, that old serpent, which is the Devil, and Satan, and bound him a thousand years.* The adversary Abraham refuses to answer is the same old serpent finally laid hold of and bound in the vision''s end.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa14_lookup sv, _session253_aoa14_lookup tv
 WHERE t.slug='apocalypse-of-abraham-14-answer-him-not-resist'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* He who ''slandereth truth'' (14:3) is the deceiver of the whole world, cast out — the accuser overthrown, not appeased.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa14_lookup sv, _session253_aoa14_lookup tv
 WHERE t.slug='apocalypse-of-abraham-14-answer-him-not-resist'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-14-name-bearing-angel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 23:21 — *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him.* The angel who teaches Abraham the word of rebuke (14:5) is the Name-bearing angel — Yahoel — in whom the very Name dwells.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa14_lookup sv, _session253_aoa14_lookup tv
 WHERE t.slug='apocalypse-of-abraham-14-name-bearing-angel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* The sent angel who keeps and leads is the same office as the guide who commands and teaches Abraham every word in 14:5,10.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa14_lookup sv, _session253_aoa14_lookup tv
 WHERE t.slug='apocalypse-of-abraham-14-name-bearing-angel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 3:1 — *And he shewed me Joshua the high priest standing before the angel of Yahuah (LORD), and Satan standing at his right hand to resist him.* The accuser stands to resist before the angel of Yahuah, exactly as Azazel stands before Abraham and the angel — and in both the adversary is rebuked, not answered (14:10).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa14_lookup sv, _session253_aoa14_lookup tv
 WHERE t.slug='apocalypse-of-abraham-14-name-bearing-angel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=14 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

