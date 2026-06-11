-- ----- fragment: minion_1enoch_59.sql (session250 1-enoch 59) -----
-- Source anchor: enoch/1-enoch ch59. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en59 (view _session250_en59_lookup). Sort band base 51450, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en59_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-59-lightnings-for-blessing-or-curse
  ('enoch', '1-enoch', 59, 1, 'canon', 'job', 28, 26, 'free', E'Job 28:26 — *When he made a decree for the rain, and a way for the lightning of the thunder:* Job names the very decree behind Enoch''s lightnings, which flash only as Yahuah of Spirits wills.'),
  ('enoch', '1-enoch', 59, 1, 'canon', 'jeremiah', 10, 13, 'free', E'Jeremiah 10:13 — *When he uttereth his voice, there is a multitude of waters in the heavens, and he causeth the vapours to ascend from the ends of the earth; he maketh lightnings with rain, and bringeth forth the wind out of his treasures.* Jeremiah binds lightning, rain, and wind to the Creator''s stored treasuries, the same chambers Enoch is shown.'),
  ('enoch', '1-enoch', 59, 1, 'canon', 'psalms', 135, 7, 'free', E'Psalm 135:7 — *He causeth the vapours to ascend from the ends of the earth; he maketh lightnings for the rain; he bringeth the wind out of his treasuries.* The Psalmist''s lightnings-for-the-rain are Enoch''s secrets of the lightning, executed at Yahuah''s command.'),
  ('enoch', '1-enoch', 59, 1, 'enoch', '1-enoch', 41, 3, 'extras', E'1 Enoch 41:3 — *And there mine eyes saw the secrets of the lightning and of the thunder, and the secrets of the winds, how they are divided to blow over the earth, and the secrets of the clouds and dew, and there I saw from whence they proceed in that place and from whence they saturate the dusty earth.* Enoch''s earlier sight in the Parables is repeated almost word-for-word here in chapter 59.'),
  -- thread: 1-enoch-59-thunder-and-the-voice-over-the-waters
  ('enoch', '1-enoch', 59, 2, 'canon', 'psalms', 29, 3, 'free', E'Psalm 29:3 — *The voice of Yahuah (LORD) is upon the waters: the Elohim (God) of glory thundereth: Yahuah (LORD) is upon many waters.* David hears the thunder as the voice of Yahuah, the secret Enoch is shown behind the storm.'),
  ('enoch', '1-enoch', 59, 2, 'jubilees', 'jubilees', 2, 2, 'extras', E'Jubilees 2:2 — *For on the first day He created the heavens which are above and the earth and the waters and all the spirits which serve before Him–the angels of the presence, and the angels of sanctification, and the angels of the spirit of fire and the angels of the spirit of the winds, and the angels of the spirit of the clouds, and of darkness, and of snow and of hail and of hoar frost, and the angels of the voices and of the thunder and of the lightning, and the angels of the spirits of cold and of heat, and of winter and of spring and of autumn and of summer, and of all the spirits of His creatures which are in the heavens and on the earth, (He created) the abysses and the darkness, eventide (and night), and the light, dawn and day, which He has prepared in the knowledge of His heart.* Jubilees stations angels over the very winds, clouds, hail, thunder, and lightning whose divided chambers Enoch is shown.'),
  -- thread: 1-enoch-59-sun-moon-keep-faith-winds-shake-earth
  ('enoch', '1-enoch', 59, 4, 'enoch', '1-enoch', 60, 11, 'extras', E'1 Enoch 60:11 — *And the other angel who went with me and showed me what was hidden told me what is first and last in the heaven in the height, and beneath the earth in the depth, and at the ends of the heaven, and on the foundation of the heaven, and in the chamber of the winds, and how the spirits are divided, and how the weighing in the balance is done, and how the fountains of the spirits are reckoned, each according to the power of the spirit, the power of the lights of the moon, and according to the power that is in righteousness.* The next chapter unfolds the same weighed order of winds and moon-lights Enoch glimpses here in their faithful orbit.'),
  ('enoch', '1-enoch', 59, 6, 'canon', 'psalms', 135, 7, 'free', E'Psalm 135:7 — *He causeth the vapours to ascend from the ends of the earth; he maketh lightnings for the rain; he bringeth the wind out of his treasuries.* The wind that goes forth and shakes the earth in Enoch is the wind Yahuah brings from His treasuries.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en59_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en59_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-59-lightnings-for-blessing-or-curse',
       E'The secret of the lightnings — a blessing or a curse',
       E'Enoch is shown the hidden order behind the storm: *In those days mine eyes saw the secrets of the lightning, and of the lights, and the judgements they execute (lit. ''their judgements''): and they lighten for a blessing or a curse as Yahuah (God) of Spirits willeth.* (1 Enoch 59:1). The lightning is not loose power but a servant under decree — exactly the Tanakh''s confession that Yahuah appointed *a way for the lightning of the thunder:* (Job 28:26), that *he maketh lightnings with rain, and bringeth forth the wind out of his treasures.* (Jeremiah 10:13), and again *he maketh lightnings for the rain; he bringeth the wind out of his treasuries.* (Psalm 135:7). Enoch had already glimpsed the same chambers earlier in the Parables — *And there mine eyes saw the secrets of the lightning and of the thunder, and the secrets of the winds, how they are divided to blow over the earth* (1 Enoch 41:3) — so this is no novelty but the canon''s own doctrine of the lightning that flashes for blessing or curse at the word of the Creator. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 51450
  FROM _session250_en59_lookup sv, _session250_en59_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=59 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=59 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-59-thunder-and-the-voice-over-the-waters',
       E'The secrets of the thunder, the winds, and the clouds',
       E'The vision widens from lightning to the whole weather-host: *And there I saw the secrets of the thunder, and he showed me the secrets of the winds, how they are divided to blow over the earth, and the secrets of the clouds and dew, and there I saw from whence they proceed in that place and from whence they saturate the dusty earth.* (1 Enoch 59:2), then *And there I saw closed chambers out of which the winds are divided, the chamber of the hail and winds, the chamber of the mist, and of the clouds* (1 Enoch 59:3). The Tanakh already sings this thunder as the very voice of Yahuah: *The voice of Yahuah (LORD) is upon the waters: the Elohim (God) of glory thundereth: Yahuah (LORD) is upon many waters.* (Psalm 29:3). And Enoch''s catalogue of divided spirits — winds, clouds, hail, frost — is the same roster Jubilees assigns to ministering angels at creation: *the angels of the spirit of the winds, and the angels of the spirit of the clouds, and of darkness, and of snow and of hail and of hoar frost, and the angels of the voices and of the thunder and of the lightning* (Jubilees 2:2). The weather is liturgy; the thunder is a voice; the chambers are tended. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 51453
  FROM _session250_en59_lookup sv, _session250_en59_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=59 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=59 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-59-sun-moon-keep-faith-winds-shake-earth',
       E'The sun and moon keep faith in their orbit; the winds shake the earth',
       E'Enoch sees the luminaries hold their appointed course without straying: *And I saw the chambers of the sun and moon, whence they proceed and whither they come again, and their glorious return, and how one is superior to the other, and their stately orbit, and how they do not leave their orbit, and they add nothing to their orbit and they take nothing from it, and they keep faith with each other* (1 Enoch 59:4), each in his own chariot and in six directions out and six back (1 Enoch 59:5), until *the winds go forth and spread over the earth, and cause the earth and all that is on the earth to shake, and the waters and all that is in the waters to shake.* (1 Enoch 59:6). This is the same weighed, reckoned order the angel later unfolds in the next chapter — *the chamber of the winds, and how the spirits are divided, and how the weighing in the balance is done, and how the fountains of the spirits are reckoned, each according to the power of the spirit, the power of the lights of the moon, and according to the power that is in righteousness.* (1 Enoch 60:11) — and the same treasury the Psalmist names: *He causeth the vapours to ascend from the ends of the earth; he maketh lightnings for the rain; he bringeth the wind out of his treasuries.* (Psalm 135:7). The lights that keep faith and the winds that shake the earth are one obedient creation under one Creator. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 51456
  FROM _session250_en59_lookup sv, _session250_en59_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=59 AND sv.verse_number=4
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=59 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-59-lightnings-for-blessing-or-curse
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 28:26 — *When he made a decree for the rain, and a way for the lightning of the thunder:* Job names the very decree behind Enoch''s lightnings, which flash only as Yahuah of Spirits wills.'
  FROM cross_reference_threads t, cross_references x, _session250_en59_lookup sv, _session250_en59_lookup tv
 WHERE t.slug='1-enoch-59-lightnings-for-blessing-or-curse'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=59 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=28 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 10:13 — *When he uttereth his voice, there is a multitude of waters in the heavens, and he causeth the vapours to ascend from the ends of the earth; he maketh lightnings with rain, and bringeth forth the wind out of his treasures.* Jeremiah binds lightning, rain, and wind to the Creator''s stored treasuries, the same chambers Enoch is shown.'
  FROM cross_reference_threads t, cross_references x, _session250_en59_lookup sv, _session250_en59_lookup tv
 WHERE t.slug='1-enoch-59-lightnings-for-blessing-or-curse'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=59 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 135:7 — *He causeth the vapours to ascend from the ends of the earth; he maketh lightnings for the rain; he bringeth the wind out of his treasuries.* The Psalmist''s lightnings-for-the-rain are Enoch''s secrets of the lightning, executed at Yahuah''s command.'
  FROM cross_reference_threads t, cross_references x, _session250_en59_lookup sv, _session250_en59_lookup tv
 WHERE t.slug='1-enoch-59-lightnings-for-blessing-or-curse'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=59 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=135 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 41:3 — *And there mine eyes saw the secrets of the lightning and of the thunder, and the secrets of the winds, how they are divided to blow over the earth, and the secrets of the clouds and dew, and there I saw from whence they proceed in that place and from whence they saturate the dusty earth.* Enoch''s earlier sight in the Parables is repeated almost word-for-word here in chapter 59.'
  FROM cross_reference_threads t, cross_references x, _session250_en59_lookup sv, _session250_en59_lookup tv
 WHERE t.slug='1-enoch-59-lightnings-for-blessing-or-curse'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=59 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=41 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-59-thunder-and-the-voice-over-the-waters
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 29:3 — *The voice of Yahuah (LORD) is upon the waters: the Elohim (God) of glory thundereth: Yahuah (LORD) is upon many waters.* David hears the thunder as the voice of Yahuah, the secret Enoch is shown behind the storm.'
  FROM cross_reference_threads t, cross_references x, _session250_en59_lookup sv, _session250_en59_lookup tv
 WHERE t.slug='1-enoch-59-thunder-and-the-voice-over-the-waters'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=59 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=29 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 2:2 — *For on the first day He created the heavens which are above and the earth and the waters and all the spirits which serve before Him–the angels of the presence, and the angels of sanctification, and the angels of the spirit of fire and the angels of the spirit of the winds, and the angels of the spirit of the clouds, and of darkness, and of snow and of hail and of hoar frost, and the angels of the voices and of the thunder and of the lightning, and the angels of the spirits of cold and of heat, and of winter and of spring and of autumn and of summer, and of all the spirits of His creatures which are in the heavens and on the earth, (He created) the abysses and the darkness, eventide (and night), and the light, dawn and day, which He has prepared in the knowledge of His heart.* Jubilees stations angels over the very winds, clouds, hail, thunder, and lightning whose divided chambers Enoch is shown.'
  FROM cross_reference_threads t, cross_references x, _session250_en59_lookup sv, _session250_en59_lookup tv
 WHERE t.slug='1-enoch-59-thunder-and-the-voice-over-the-waters'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=59 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-59-sun-moon-keep-faith-winds-shake-earth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 60:11 — *And the other angel who went with me and showed me what was hidden told me what is first and last in the heaven in the height, and beneath the earth in the depth, and at the ends of the heaven, and on the foundation of the heaven, and in the chamber of the winds, and how the spirits are divided, and how the weighing in the balance is done, and how the fountains of the spirits are reckoned, each according to the power of the spirit, the power of the lights of the moon, and according to the power that is in righteousness.* The next chapter unfolds the same weighed order of winds and moon-lights Enoch glimpses here in their faithful orbit.'
  FROM cross_reference_threads t, cross_references x, _session250_en59_lookup sv, _session250_en59_lookup tv
 WHERE t.slug='1-enoch-59-sun-moon-keep-faith-winds-shake-earth'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=59 AND sv.verse_number=4
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=60 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 135:7 — *He causeth the vapours to ascend from the ends of the earth; he maketh lightnings for the rain; he bringeth the wind out of his treasuries.* The wind that goes forth and shakes the earth in Enoch is the wind Yahuah brings from His treasuries.'
  FROM cross_reference_threads t, cross_references x, _session250_en59_lookup sv, _session250_en59_lookup tv
 WHERE t.slug='1-enoch-59-sun-moon-keep-faith-winds-shake-earth'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=59 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=135 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

