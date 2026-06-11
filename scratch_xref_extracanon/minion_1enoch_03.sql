-- ----- fragment: minion_1enoch_03.sql (session250 1-enoch 3) -----
-- Source anchor: enoch/1-enoch ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en03 (view _session250_en03_lookup). Sort band base 50050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-3-trees-keep-appointed-seasons
  ('enoch', '1-enoch', 3, 1, 'canon', 'genesis', 1, 14, 'free', E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The seasons the trees keep in Enoch 3:1 were ordained at creation, when the lights were set for signs and appointed times.'),
  ('enoch', '1-enoch', 3, 1, 'canon', 'jeremiah', 33, 20, 'free', E'Jeremiah 33:20 — *Thus saith Yahuah (LORD); If ye can break my covenant of the day, and my covenant of the night, and that there should not be day and night in their season;* The steadfastness of the winter trees in Enoch 3:1 is Yahuah''s own covenant of the seasons, as sure as His promise to David.'),
  ('enoch', '1-enoch', 3, 1, 'enoch', '1-enoch', 2, 2, 'extras', E'1 Enoch 2:2 — *Behold ye the earth, and give heed to the things which take place upon it from first to last, how steadfast they are, how none of the things upon earth change, but all the works of Elohim (God) appear to you.* The same call to observe the steadfast order of creation that frames the trees of Enoch 3:1.'),
  ('enoch', '1-enoch', 3, 1, 'enoch', '1-enoch', 5, 1, 'extras', E'1 Enoch 5:1 — *Observe ye how the trees cover themselves with green leaves and bear fruit: wherefore give ye heed and know with regard to all His works, and recognize how He that liveth for ever hath made them so.* The renewal that answers the withered winter trees of Enoch 3:1 — both seasons obey the One who made them so.'),
  -- thread: 1-enoch-3-the-sun-burns-at-his-command
  ('enoch', '1-enoch', 3, 2, 'canon', 'psalms', 104, 19, 'free', E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The summer sun of Enoch 3:2 burns within its appointed course, knowing its rising and its setting.'),
  ('enoch', '1-enoch', 3, 2, 'apocrypha', 'ecclesiasticus', 43, 3, 'extras', E'Ecclesiasticus 43:3 — *At noon it parcheth the country, and who can abide the burning heat thereof?* The very heat that drives men to shade and shelter in Enoch 3:2, named by the same sapiential witness.'),
  ('enoch', '1-enoch', 3, 2, 'apocrypha', 'ecclesiasticus', 43, 5, 'extras', E'Ecclesiasticus 43:5 — *Great is Yahuah (God) that made it; and at his commandment runs hastily.* The burning sun of Enoch 3:2 obeys a command — it runs at the bidding of the One who made it.'),
  ('enoch', '1-enoch', 3, 2, 'jubilees', 'jubilees', 2, 9, 'extras', E'Jubilees 2:9 — *And Elohim (God) appointed the sun to be a great sign on the earth for days and for sabbaths and for months and for feasts and for years and for sabbaths of years and for jubilees and for all seasons of the years.* The sun whose heat Enoch observes in 3:2 was appointed to rule the days and mark the moedim.'),
  -- thread: 1-enoch-3-creation-obeys-but-you-have-not
  ('enoch', '1-enoch', 3, 2, 'canon', 'jeremiah', 8, 7, 'free', E'Jeremiah 8:7 — *Yea, the stork in the heaven knoweth her appointed times; and the turtle and the crane and the swallow observe the time of their coming; but my people know not the judgment of Yahuah (LORD).* The same indictment Enoch 3 implies: nature keeps its appointed order while the people forsake the way.'),
  ('enoch', '1-enoch', 3, 1, 'canon', 'psalms', 19, 1, 'free', E'Psalm 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* The trees and sun of Enoch 3 preach the Creator''s glory wordlessly, as the heavens do here.'),
  ('enoch', '1-enoch', 3, 1, 'enoch', '1-enoch', 2, 1, 'extras', E'1 Enoch 2:1 — *Observe ye everything that takes place in the heaven, how they do not change their orbits, and the luminaries which are in the heaven, how they all rise and set in order each in its season, and transgress not against their appointed order.* The heavenly witness paired with the earthly trees of Enoch 3 — both transgress not their appointed order.'),
  ('enoch', '1-enoch', 3, 2, 'enoch', '1-enoch', 5, 4, 'extras', E'1 Enoch 5:4 — *But ye—ye have not been steadfast, nor done the commandments of Yahuah (God), but ye have turned away and spoken proud and hard words with your impure mouths against His greatness. Oh, ye hard-hearted, ye shall find no peace.* The indictment toward which the steadfast trees and sun of Enoch 3 are building: creation kept the commandments; you did not.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-3-trees-keep-appointed-seasons',
       E'The trees keep their appointed seasons',
       E'Enoch points to the winter forest as a witness that creation obeys the order set for it: *Observe and see how (in the winter) all the trees seem as though they had withered and shed all their leaves, except fourteen trees, which do not lose their foliage but retain the old foliage from two to three years till the new comes.* (1 Enoch 3:1). This is the same lesson he draws from the unchanging luminaries — *Behold ye the earth, and give heed to the things which take place upon it from first to last, how steadfast they are, how none of the things upon earth change, but all the works of Elohim (God) appear to you.* (1 Enoch 2:2) — and again from the green of returning spring: *Observe ye how the trees cover themselves with green leaves and bear fruit: wherefore give ye heed and know with regard to all His works, and recognize how He that liveth for ever hath made them so.* (1 Enoch 5:1). The order itself was fixed at the beginning, when the lights were appointed for the seasons: *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* (Genesis 1:14). Yahuah binds that order to His covenant so firmly that to break the seasons would be to break His faithfulness to David: *Thus saith Yahuah (LORD); If ye can break my covenant of the day, and my covenant of the night, and that there should not be day and night in their season;* (Jeremiah 33:20). The Watchers will transgress this Creator''s order; the trees never do.',
       sv.verse_id, ev.verse_id, 'extras', 50050
  FROM _session250_en03_lookup sv, _session250_en03_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=3 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-3-the-sun-burns-at-his-command',
       E'The summer sun burns under its appointed dominion',
       E'Enoch turns from winter to the heat of summer, again to show creation under command: *And again, observe the days of summer how the sun is above the earth over against it. And you seek shade and shelter by reason of the heat of the sun, and the earth also is burning with growing heat, and so you cannot tread on the earth, or on a rock by reason of its heat.* (1 Enoch 3:2). The Psalmist sees the same sun ruling its appointed round: *He appointed the moon for seasons: the sun knoweth his going down.* (Psalm 104:19). The wisdom of the apocrypha describes that very midday scorching: *At noon it parcheth the country, and who can abide the burning heat thereof?* (Ecclesiasticus 43:3), and confesses Who set it running: *Great is Yahuah (God) that made it; and at his commandment runs hastily.* (Ecclesiasticus 43:5). Jubilees grounds the sun''s dominion in the fourth-day decree, where it is appointed to rule and to mark the feasts: *And Elohim (God) appointed the sun to be a great sign on the earth for days and for sabbaths and for months and for feasts and for years and for sabbaths of years and for jubilees and for all seasons of the years.* (Jubilees 2:9). The sun''s burning is no terror without order — it keeps the law the Creator gave it, the same law the Watchers will abandon.',
       sv.verse_id, ev.verse_id, 'extras', 50053
  FROM _session250_en03_lookup sv, _session250_en03_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=3 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=3 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-3-creation-obeys-but-you-have-not',
       E'Creation keeps its order — but you have not',
       E'The whole point of the winter trees and the summer sun is an indictment: every part of creation holds to the order given it, so that man''s rebellion stands exposed. Enoch lays the charge bare a chapter later: *But ye—ye have not been steadfast, nor done the commandments of Yahuah (God), but ye have turned away and spoken proud and hard words with your impure mouths against His greatness. Oh, ye hard-hearted, ye shall find no peace.* (1 Enoch 5:4). The luminaries he sets beside the trees *transgress not against their appointed order* — *Observe ye everything that takes place in the heaven, how they do not change their orbits, and the luminaries which are in the heaven, how they all rise and set in order each in its season, and transgress not against their appointed order.* (1 Enoch 2:1). The prophet draws the identical contrast from the birds that keep their seasons while the people forsake the way: *Yea, the stork in the heaven knoweth her appointed times; and the turtle and the crane and the swallow observe the time of their coming; but my people know not the judgment of Yahuah (LORD).* (Jeremiah 8:7). And the heavens themselves preach this without a word: *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* (Psalm 19:1). The trees of Enoch 3 testify that the Creator''s order — His Torah — stands; the judgement to come falls on those who, unlike the trees, would not keep it.',
       sv.verse_id, ev.verse_id, 'extras', 50056
  FROM _session250_en03_lookup sv, _session250_en03_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=3 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-3-trees-keep-appointed-seasons
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:14 — *And Elohim (God) said, Let there be lights in the firmament of the heaven to divide the day from the night; and let them be for signs, and for seasons, and for days, and years:* The seasons the trees keep in Enoch 3:1 were ordained at creation, when the lights were set for signs and appointed times.'
  FROM cross_reference_threads t, cross_references x, _session250_en03_lookup sv, _session250_en03_lookup tv
 WHERE t.slug='1-enoch-3-trees-keep-appointed-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 33:20 — *Thus saith Yahuah (LORD); If ye can break my covenant of the day, and my covenant of the night, and that there should not be day and night in their season;* The steadfastness of the winter trees in Enoch 3:1 is Yahuah''s own covenant of the seasons, as sure as His promise to David.'
  FROM cross_reference_threads t, cross_references x, _session250_en03_lookup sv, _session250_en03_lookup tv
 WHERE t.slug='1-enoch-3-trees-keep-appointed-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=33 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 2:2 — *Behold ye the earth, and give heed to the things which take place upon it from first to last, how steadfast they are, how none of the things upon earth change, but all the works of Elohim (God) appear to you.* The same call to observe the steadfast order of creation that frames the trees of Enoch 3:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en03_lookup sv, _session250_en03_lookup tv
 WHERE t.slug='1-enoch-3-trees-keep-appointed-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 5:1 — *Observe ye how the trees cover themselves with green leaves and bear fruit: wherefore give ye heed and know with regard to all His works, and recognize how He that liveth for ever hath made them so.* The renewal that answers the withered winter trees of Enoch 3:1 — both seasons obey the One who made them so.'
  FROM cross_reference_threads t, cross_references x, _session250_en03_lookup sv, _session250_en03_lookup tv
 WHERE t.slug='1-enoch-3-trees-keep-appointed-seasons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-3-the-sun-burns-at-his-command
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 104:19 — *He appointed the moon for seasons: the sun knoweth his going down.* The summer sun of Enoch 3:2 burns within its appointed course, knowing its rising and its setting.'
  FROM cross_reference_threads t, cross_references x, _session250_en03_lookup sv, _session250_en03_lookup tv
 WHERE t.slug='1-enoch-3-the-sun-burns-at-his-command'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiasticus 43:3 — *At noon it parcheth the country, and who can abide the burning heat thereof?* The very heat that drives men to shade and shelter in Enoch 3:2, named by the same sapiential witness.'
  FROM cross_reference_threads t, cross_references x, _session250_en03_lookup sv, _session250_en03_lookup tv
 WHERE t.slug='1-enoch-3-the-sun-burns-at-his-command'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=43 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 43:5 — *Great is Yahuah (God) that made it; and at his commandment runs hastily.* The burning sun of Enoch 3:2 obeys a command — it runs at the bidding of the One who made it.'
  FROM cross_reference_threads t, cross_references x, _session250_en03_lookup sv, _session250_en03_lookup tv
 WHERE t.slug='1-enoch-3-the-sun-burns-at-his-command'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=43 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 2:9 — *And Elohim (God) appointed the sun to be a great sign on the earth for days and for sabbaths and for months and for feasts and for years and for sabbaths of years and for jubilees and for all seasons of the years.* The sun whose heat Enoch observes in 3:2 was appointed to rule the days and mark the moedim.'
  FROM cross_reference_threads t, cross_references x, _session250_en03_lookup sv, _session250_en03_lookup tv
 WHERE t.slug='1-enoch-3-the-sun-burns-at-his-command'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-3-creation-obeys-but-you-have-not
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 8:7 — *Yea, the stork in the heaven knoweth her appointed times; and the turtle and the crane and the swallow observe the time of their coming; but my people know not the judgment of Yahuah (LORD).* The same indictment Enoch 3 implies: nature keeps its appointed order while the people forsake the way.'
  FROM cross_reference_threads t, cross_references x, _session250_en03_lookup sv, _session250_en03_lookup tv
 WHERE t.slug='1-enoch-3-creation-obeys-but-you-have-not'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=8 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 19:1 — *The heavens declare the glory of Elohim (God); and the firmament sheweth his handywork.* The trees and sun of Enoch 3 preach the Creator''s glory wordlessly, as the heavens do here.'
  FROM cross_reference_threads t, cross_references x, _session250_en03_lookup sv, _session250_en03_lookup tv
 WHERE t.slug='1-enoch-3-creation-obeys-but-you-have-not'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 2:1 — *Observe ye everything that takes place in the heaven, how they do not change their orbits, and the luminaries which are in the heaven, how they all rise and set in order each in its season, and transgress not against their appointed order.* The heavenly witness paired with the earthly trees of Enoch 3 — both transgress not their appointed order.'
  FROM cross_reference_threads t, cross_references x, _session250_en03_lookup sv, _session250_en03_lookup tv
 WHERE t.slug='1-enoch-3-creation-obeys-but-you-have-not'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 5:4 — *But ye—ye have not been steadfast, nor done the commandments of Yahuah (God), but ye have turned away and spoken proud and hard words with your impure mouths against His greatness. Oh, ye hard-hearted, ye shall find no peace.* The indictment toward which the steadfast trees and sun of Enoch 3 are building: creation kept the commandments; you did not.'
  FROM cross_reference_threads t, cross_references x, _session250_en03_lookup sv, _session250_en03_lookup tv
 WHERE t.slug='1-enoch-3-creation-obeys-but-you-have-not'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=5 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

