-- ----- fragment: minion_1maccabees_10.sql (session253 1-maccabees 10) -----
-- Source anchor: apocrypha/1-maccabees ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1mac10 (view _session253_1mac10_lookup). Sort band base 61725, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1mac10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-maccabees-10-build-the-walls
  ('apocrypha', '1-maccabees', 10, 11, 'canon', 'nehemiah', 2, 17, 'free', E'Nehemiah 2:17 — *Then said I unto them, Ye see the distress that we are in, how Jerusalem lieth waste, and the gates thereof are burned with fire: come, and let us build up the wall of Jerusalem, that we be no more a reproach.* Jonathan walling Mount Sion with square stones takes up Nehemiah''s very labour — the reproach of a broken Jerusalem answered with rebuilt walls.'),
  ('apocrypha', '1-maccabees', 10, 11, 'canon', 'nehemiah', 4, 6, 'free', E'Nehemiah 4:6 — *So built we the wall; and all the wall was joined together unto the half thereof: for the people had a mind to work.* As Nehemiah''s people had a mind to work, so Jonathan''s workmen build and it is done — the same single-minded restoration of the city.'),
  ('apocrypha', '1-maccabees', 10, 11, 'canon', 'psalms', 51, 18, 'free', E'Psalm 51:18 — *Do good in thy good pleasure unto Zion: build thou the walls of Jerusalem.* The psalmist''s plea for Zion''s walls is answered in Jonathan''s command to wall the mount Sion with fortified stone.'),
  ('apocrypha', '1-maccabees', 10, 45, 'canon', 'isaiah', 60, 10, 'free', E'Isaiah 60:10 — *And the sons of strangers shall build up thy walls, and their kings shall minister unto thee: for in my wrath I smote thee, but in my favour have I had mercy on thee.* The pagan king''s accounts paying for Jerusalem''s walls is the strangers and their kings made to minister to Zion just as Isaiah foretold.'),
  -- thread: 1-maccabees-10-high-priest-holy-robe
  ('apocrypha', '1-maccabees', 10, 21, 'canon', 'numbers', 25, 11, 'free', E'Numbers 25:11 — *Phinehas, the son of Eleazar, the son of Aaron the priest, hath turned my wrath away from the children of Yashar''el (Israel), while he was zealous for my sake among them, that I consumed not the children of Yashar''el (Israel) in my jealousy.* The Maccabean priesthood Jonathan now wears descends from Phinehas'' zeal — the same fire for the covenant that turns away wrath.'),
  ('apocrypha', '1-maccabees', 10, 20, 'canon', 'numbers', 25, 13, 'free', E'Numbers 25:13 — *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel).* Jonathan''s ordination to the high priesthood is the covenant of an everlasting priesthood given to the zealous, kept alive in the house of Mattathias.'),
  ('apocrypha', '1-maccabees', 10, 21, 'canon', 'exodus', 28, 2, 'free', E'Exodus 28:2 — *And thou shalt make holy garments for Aaron thy brother for glory and for beauty.* The holy robe Jonathan puts on is the very priestly vesture Yahuah commanded for Aaron, for glory and for beauty — the office restored, not replaced.'),
  ('apocrypha', '1-maccabees', 10, 21, 'canon', 'zechariah', 3, 4, 'free', E'Zechariah 3:4 — *And he answered and spake unto those that stood before him, saying, Take away the filthy garments from him. And unto him he said, Behold, I have caused thine iniquity to pass from thee, and I will clothe thee with change of raiment.* As Joshua the high priest was stripped of filthy garments and re-clothed, so the defiled high priesthood is cleansed and re-vested when Jonathan dons the holy robe.'),
  -- thread: 1-maccabees-10-feasts-sabbaths-newmoons
  ('apocrypha', '1-maccabees', 10, 34, 'canon', 'leviticus', 23, 2, 'free', E'Leviticus 23:2 — *Speak unto the children of Yashar''el (Israel), and say unto them, Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts.* The feasts and solemn days the king frees for the Yahudim are the very feasts Yahuah claims as His own holy convocations.'),
  ('apocrypha', '1-maccabees', 10, 34, 'canon', 'numbers', 28, 11, 'free', E'Numbers 28:11 — *And in the beginnings of your months ye shall offer a burnt offering unto Yahuah (LORD); two young bullocks, and one ram, seven lambs of the first year without spot.* The new moons set free in the king''s decree are the beginnings of months Torah appoints for offering unto Yahuah.'),
  ('apocrypha', '1-maccabees', 10, 34, 'canon', 'isaiah', 1, 14, 'free', E'Isaiah 1:14 — *Your new moons and your appointed feasts my soul hateth: they are a trouble unto me; I am weary to bear them.* The same feasts and new moons Jonathan''s people are freed to keep are despised only when emptied of justice — the prophet rebukes the heart, not the calendar.'),
  ('apocrypha', '1-maccabees', 10, 34, 'canon', 'colossians', 2, 16, 'free', E'Colossians 2:16 — *Let no man therefore judge you in meat, or in drink, or in respect of an holyday, or of the new moon, or of the sabbath days.* Paul names the very triad freed here — holyday, new moon, sabbath — guarding the keeping of them from the judgment of men, not abolishing them.'),
  -- thread: 1-maccabees-10-accusers-flee-clothed-in-honor
  ('apocrypha', '1-maccabees', 10, 62, 'canon', 'zechariah', 3, 4, 'free', E'Zechariah 3:4 — *And he answered and spake unto those that stood before him, saying, Take away the filthy garments from him. And unto him he said, Behold, I have caused thine iniquity to pass from thee, and I will clothe thee with change of raiment.* Jonathan stripped of his garments and clothed in purple before the king is Joshua the high priest re-robed before the accuser — the reproach removed, the servant honoured.'),
  ('apocrypha', '1-maccabees', 10, 64, 'canon', 'zechariah', 3, 5, 'free', E'Zechariah 3:5 — *And I said, Let them set a fair mitre upon his head. So they set a fair mitre upon his head, and clothed him with garments. And the angel of Yahuah (LORD) stood by.* As Joshua was crowned with a fair mitre and the accusing satan silenced, so Jonathan is clothed in purple and his accusers flee all away.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1mac10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1mac10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-10-build-the-walls',
       E'Build and repair the city — the walls of Zion rise again',
       E'With the tower''s hostages restored to their parents, Jonathan turns at once to stone and mortar: *This done, Jonathan settled himself in Jerusalem, and began to build and repair the city.* *And he commanded the workmen to build the walls and the mount Sion and about with square stones for fortification; and they did so.* (1 Maccabees 10:10-11). And when even the foreign kings are made to bankroll it — *Yea, and for the building of the walls of Jerusalem, and the fortifying thereof round about, expences shall be given out of the king''s accounts* (1 Maccabees 10:45) — this is no new thing. It is Nehemiah''s cry come round again: *Then said I unto them, Ye see the distress that we are in, how Jerusalem lieth waste, and the gates thereof are burned with fire: come, and let us build up the wall of Jerusalem, that we be no more a reproach.* (Nehemiah 2:17), answered by the same single mind: *So built we the wall; and all the wall was joined together unto the half thereof: for the people had a mind to work.* (Nehemiah 4:6). It is the prayer of the psalmist made stone: *Do good in thy good pleasure unto Zion: build thou the walls of Jerusalem.* (Psalm 51:18) — and the promise that even Gentile kings would be bent to the work: *And the sons of strangers shall build up thy walls, and their kings shall minister unto thee: for in my wrath I smote thee, but in my favour have I had mercy on thee.* (Isaiah 60:10). The covenant people are not replaced; they are rebuilt, the same wall on the same mount.',
       sv.verse_id, ev.verse_id, 'extras', 61725
  FROM _session253_1mac10_lookup sv, _session253_1mac10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=10 AND ev.verse_number=45
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-10-high-priest-holy-robe',
       E'The high priesthood restored — Jonathan puts on the holy robe',
       E'The office that Antiochus had defiled is set right again upon a son of the zealous house: *Wherefore now this day we ordain you to be the high priest of your nation... (and therewithal he sent him a purple robe and a crown of gold)* (1 Maccabees 10:20), and Jonathan answers it on the appointed day — *So in the seventh month of the hundred and sixtieth year, at the feast of the tabernacles, Jonathan put on the holy robe, and gathered together forces* (1 Maccabees 10:21). The priesthood comes to the Hasmoneans as heirs of the original zeal, the covenant first sworn to Phinehas: *Phinehas, the son of Eleazar, the son of Aaron the priest, hath turned my wrath away from the children of Yashar''el (Israel), while he was zealous for my sake among them, that I consumed not the children of Yashar''el (Israel) in my jealousy.* (Numbers 25:11), *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel).* (Numbers 25:13) — the Maccabees'' zeal for the law was Phinehas'' zeal renewed. The holy robe Jonathan dons is the very vesture commanded at Sinai: *And thou shalt make holy garments for Aaron thy brother for glory and for beauty.* (Exodus 28:2). And the picture of a high priest re-clothed after defilement is Joshua the high priest in the prophet''s vision: *Take away the filthy garments from him. And unto him he said, Behold, I have caused thine iniquity to pass from thee, and I will clothe thee with change of raiment.* (Zechariah 3:4) — the priesthood is not abolished but cleansed and re-vested.',
       sv.verse_id, ev.verse_id, 'extras', 61728
  FROM _session253_1mac10_lookup sv, _session253_1mac10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=20
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=10 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-10-feasts-sabbaths-newmoons',
       E'The feasts, sabbaths, and new moons kept free',
       E'When the king''s grant secures the calendar of Yahuah for all the people — *Furthermore I will that all the feasts, and sabbaths, and new moons, and solemn days, and the three days before the feast, and the three days after the feast shall be all of immunity and freedom for all the Yahudim (Jews) in my realm.* (1 Maccabees 10:34) — what is freed is precisely the appointed times Yahuah named His own: *Speak unto the children of Yashar''el (Israel), and say unto them, Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts.* (Leviticus 23:2). The new moons stand in that same Torah list: *And in the beginnings of your months ye shall offer a burnt offering unto Yahuah (LORD); two young bullocks, and one ram, seven lambs of the first year without spot* (Numbers 28:11). These are no abolished shadows to be despised — when kept in faith they are honoured, and only divorced from a right heart does the prophet rebuke them: *Your new moons and your appointed feasts my soul hateth: they are a trouble unto me; I am weary to bear them.* (Isaiah 1:14). Paul, far from cancelling them, calls them the body''s own forecast: *Let no man therefore judge you in meat, or in drink, or in respect of an holyday, or of the new moon, or of the sabbath days* (Colossians 2:16) — the feast, the new moon, the sabbath, freed for the faithful in Jonathan''s day as in our own.',
       sv.verse_id, ev.verse_id, 'extras', 61731
  FROM _session253_1mac10_lookup sv, _session253_1mac10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=34
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=10 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-10-accusers-flee-clothed-in-honor',
       E'The accusers flee — the servant clothed in honour',
       E'When the wicked of Yashar''el rise to slander Jonathan before the king, the king will not hear them, and reverses their accusation into vindication: *Yea more than that, the king commanded to take off his garments, and clothe him in purple: and they did so.* (1 Maccabees 10:62), *Now when his accusers saw that he was honored according to the proclamation, and clothed in purple, they fled all away.* (1 Maccabees 10:64). This is the prophet''s courtroom vision exactly: the adversary stands to accuse the high priest, and the verdict is not condemnation but re-robing — *Take away the filthy garments from him. And unto him he said, Behold, I have caused thine iniquity to pass from thee, and I will clothe thee with change of raiment.* (Zechariah 3:4), *And I said, Let them set a fair mitre upon his head. So they set a fair mitre upon his head, and clothed him with garments. And the angel of Yahuah (LORD) stood by.* (Zechariah 3:5). The faithful servant accused before the throne is stripped of reproach and clothed in glory; the accusers, like the satan silenced, flee away.',
       sv.verse_id, ev.verse_id, 'extras', 61734
  FROM _session253_1mac10_lookup sv, _session253_1mac10_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=61
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=10 AND ev.verse_number=64
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-maccabees-10-build-the-walls
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Nehemiah 2:17 — *Then said I unto them, Ye see the distress that we are in, how Jerusalem lieth waste, and the gates thereof are burned with fire: come, and let us build up the wall of Jerusalem, that we be no more a reproach.* Jonathan walling Mount Sion with square stones takes up Nehemiah''s very labour — the reproach of a broken Jerusalem answered with rebuilt walls.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac10_lookup sv, _session253_1mac10_lookup tv
 WHERE t.slug='1-maccabees-10-build-the-walls'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Nehemiah 4:6 — *So built we the wall; and all the wall was joined together unto the half thereof: for the people had a mind to work.* As Nehemiah''s people had a mind to work, so Jonathan''s workmen build and it is done — the same single-minded restoration of the city.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac10_lookup sv, _session253_1mac10_lookup tv
 WHERE t.slug='1-maccabees-10-build-the-walls'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 51:18 — *Do good in thy good pleasure unto Zion: build thou the walls of Jerusalem.* The psalmist''s plea for Zion''s walls is answered in Jonathan''s command to wall the mount Sion with fortified stone.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac10_lookup sv, _session253_1mac10_lookup tv
 WHERE t.slug='1-maccabees-10-build-the-walls'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 60:10 — *And the sons of strangers shall build up thy walls, and their kings shall minister unto thee: for in my wrath I smote thee, but in my favour have I had mercy on thee.* The pagan king''s accounts paying for Jerusalem''s walls is the strangers and their kings made to minister to Zion just as Isaiah foretold.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac10_lookup sv, _session253_1mac10_lookup tv
 WHERE t.slug='1-maccabees-10-build-the-walls'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-10-high-priest-holy-robe
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 25:11 — *Phinehas, the son of Eleazar, the son of Aaron the priest, hath turned my wrath away from the children of Yashar''el (Israel), while he was zealous for my sake among them, that I consumed not the children of Yashar''el (Israel) in my jealousy.* The Maccabean priesthood Jonathan now wears descends from Phinehas'' zeal — the same fire for the covenant that turns away wrath.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac10_lookup sv, _session253_1mac10_lookup tv
 WHERE t.slug='1-maccabees-10-high-priest-holy-robe'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 25:13 — *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel).* Jonathan''s ordination to the high priesthood is the covenant of an everlasting priesthood given to the zealous, kept alive in the house of Mattathias.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac10_lookup sv, _session253_1mac10_lookup tv
 WHERE t.slug='1-maccabees-10-high-priest-holy-robe'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 28:2 — *And thou shalt make holy garments for Aaron thy brother for glory and for beauty.* The holy robe Jonathan puts on is the very priestly vesture Yahuah commanded for Aaron, for glory and for beauty — the office restored, not replaced.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac10_lookup sv, _session253_1mac10_lookup tv
 WHERE t.slug='1-maccabees-10-high-priest-holy-robe'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=28 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Zechariah 3:4 — *And he answered and spake unto those that stood before him, saying, Take away the filthy garments from him. And unto him he said, Behold, I have caused thine iniquity to pass from thee, and I will clothe thee with change of raiment.* As Joshua the high priest was stripped of filthy garments and re-clothed, so the defiled high priesthood is cleansed and re-vested when Jonathan dons the holy robe.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac10_lookup sv, _session253_1mac10_lookup tv
 WHERE t.slug='1-maccabees-10-high-priest-holy-robe'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-10-feasts-sabbaths-newmoons
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 23:2 — *Speak unto the children of Yashar''el (Israel), and say unto them, Concerning the feasts of Yahuah (LORD), which ye shall proclaim to be holy convocations, even these are my feasts.* The feasts and solemn days the king frees for the Yahudim are the very feasts Yahuah claims as His own holy convocations.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac10_lookup sv, _session253_1mac10_lookup tv
 WHERE t.slug='1-maccabees-10-feasts-sabbaths-newmoons'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 28:11 — *And in the beginnings of your months ye shall offer a burnt offering unto Yahuah (LORD); two young bullocks, and one ram, seven lambs of the first year without spot.* The new moons set free in the king''s decree are the beginnings of months Torah appoints for offering unto Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac10_lookup sv, _session253_1mac10_lookup tv
 WHERE t.slug='1-maccabees-10-feasts-sabbaths-newmoons'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=28 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 1:14 — *Your new moons and your appointed feasts my soul hateth: they are a trouble unto me; I am weary to bear them.* The same feasts and new moons Jonathan''s people are freed to keep are despised only when emptied of justice — the prophet rebukes the heart, not the calendar.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac10_lookup sv, _session253_1mac10_lookup tv
 WHERE t.slug='1-maccabees-10-feasts-sabbaths-newmoons'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Colossians 2:16 — *Let no man therefore judge you in meat, or in drink, or in respect of an holyday, or of the new moon, or of the sabbath days.* Paul names the very triad freed here — holyday, new moon, sabbath — guarding the keeping of them from the judgment of men, not abolishing them.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac10_lookup sv, _session253_1mac10_lookup tv
 WHERE t.slug='1-maccabees-10-feasts-sabbaths-newmoons'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=2 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-10-accusers-flee-clothed-in-honor
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Zechariah 3:4 — *And he answered and spake unto those that stood before him, saying, Take away the filthy garments from him. And unto him he said, Behold, I have caused thine iniquity to pass from thee, and I will clothe thee with change of raiment.* Jonathan stripped of his garments and clothed in purple before the king is Joshua the high priest re-robed before the accuser — the reproach removed, the servant honoured.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac10_lookup sv, _session253_1mac10_lookup tv
 WHERE t.slug='1-maccabees-10-accusers-flee-clothed-in-honor'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=62
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 3:5 — *And I said, Let them set a fair mitre upon his head. So they set a fair mitre upon his head, and clothed him with garments. And the angel of Yahuah (LORD) stood by.* As Joshua was crowned with a fair mitre and the accusing satan silenced, so Jonathan is clothed in purple and his accusers flee all away.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac10_lookup sv, _session253_1mac10_lookup tv
 WHERE t.slug='1-maccabees-10-accusers-flee-clothed-in-honor'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=10 AND sv.verse_number=64
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

