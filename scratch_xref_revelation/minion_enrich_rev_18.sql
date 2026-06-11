-- S227 enrichment — Revelation 18: Babylon fallen; come out of her; the Tyre-dirge; millstone; blood found in her
-- ADD-ONLY. References shared view _s227_rev_lookup.

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: babylon-the-great-is-fallen-is-fallen
  ('canon','revelation',18,2,'canon','isaiah',13,19,'free', E'*And Babylon, the glory of kingdoms, the beauty of the Chaldees’ excellency, shall be as when Elohim (God) overthrew Sodom and Gomorrah.* (Isaiah 13:19). Isaiah pronounced *Babylon, the glory of kingdoms,* overthrown as utterly as Sodom. *Babylon the great is fallen, is fallen, and is become the habitation of devils* (Revelation 18:2) — the proud glory of kingdoms cast down like the cities of the plain, emptied of men and given to the unclean. The seer re-speaks the prophet''s sentence on the whole doomed world-system.'),
  ('canon','revelation',18,2,'canon','jeremiah',51,37,'free', E'*And Babylon shall become heaps, a dwellingplace for dragons, an astonishment, and an hissing, without an inhabitant.* (Jeremiah 51:37). Jeremiah saw Babylon become *heaps, a dwellingplace for dragons... without an inhabitant.* So she is *become the habitation of devils, and the hold of every foul spirit, and a cage of every unclean and hateful bird* (Revelation 18:2) — the city of man''s pride no longer a city but a haunt of dragons and foul spirits, never to be inhabited again.'),
  -- thread: reward-her-double-the-cup-she-filled
  ('canon','revelation',18,6,'canon','jeremiah',16,18,'free', E'*And first I will recompense their iniquity and their sin double; because they have defiled my land...* (Jeremiah 16:18). Jeremiah names the law of double recompense: *I will recompense their iniquity and their sin double.* So the voice commands over Babylon, *double unto her double according to her works: in the cup which she hath filled fill to her double* (Revelation 18:6) — the measure-for-measure justice of the prophet, her defilements repaid double into her own cup.'),
  ('canon','revelation',18,7,'canon','isaiah',47,7,'free', E'*And thou saidst, I shall be a lady for ever: so that thou didst not lay these things to thy heart, neither didst remember the latter end of it.* (Isaiah 47:7). The daughter of Babylon''s boast — *I shall be a lady for ever* — forgetting her latter end, is the proud security the seer re-speaks: *For she saith in her heart, I sit a queen, and am no widow, and shall see no sorrow* (Revelation 18:7). The city certain of her own permanence, remembering no end, is the very figure Isaiah arraigned, undone in the day she thought could never come.'),
  -- thread: the-kings-and-merchants-lament-over-her (Tyre)
  ('canon','revelation',18,19,'canon','ezekiel',27,31,'free', E'*And they shall make themselves utterly bald for thee, and gird them with sackcloth, and they shall weep for thee with bitterness of heart and bitter wailing.* (Ezekiel 27:31). Ezekiel''s mourners over Tyre make themselves bald, gird with sackcloth, and *weep for thee with bitterness of heart and bitter wailing.* The shipmasters and sailors mourn the same way: *they cast dust on their heads, and cried, weeping and wailing* (Revelation 18:19) — the dirge over the merchant-city of the sea re-spoken over Babylon the great.'),
  ('canon','revelation',18,17,'canon','isaiah',23,1,'free', E'*The burden of Tyre. Howl, ye ships of Tarshish; for it is laid waste, so that there is no house, no entering in...* (Isaiah 23:1). Isaiah''s burden of Tyre opens with the wail of the seafarers — *Howl, ye ships of Tarshish.* So *every shipmaster, and all the company in ships, and sailors, and as many as trade by sea, stood afar off, and cried when they saw the smoke of her burning* (Revelation 18:17-18). The howling ships of Tyre''s dirge are the shipmasters wailing over the fallen city, their trade laid waste in one hour.'),
  -- thread: rejoice-over-her-thou-heaven
  ('canon','revelation',18,20,'canon','isaiah',44,23,'free', E'*Sing, O ye heavens; for Yahuah (LORD) hath done it: shout, ye lower parts of the earth... for Yahuah (LORD) hath redeemed Jacob, and glorified himself in Yashar''el (Israel).* (Isaiah 44:23). Isaiah calls the heavens to sing because Yahuah (LORD) has redeemed Jacob. *Rejoice over her, thou heaven, and ye holy apostles and prophets; for Elohim (God) hath avenged you on her* (Revelation 18:20) — the same summons to the heavens to rejoice, the fall of the oppressor being the redemption of the people, the heavens singing for the deliverance Yahuah (LORD) has wrought.'),
  -- thread: the-millstone-cast-into-the-sea
  ('canon','revelation',18,21,'canon','ezekiel',26,21,'free', E'*I will make thee a terror, and thou shalt be no more: though thou be sought for, yet shalt thou never be found again, saith Adonai Yahuah (the Lord GOD).* (Ezekiel 26:21). Ezekiel sealed Tyre''s doom: *thou shalt be no more... yet shalt thou never be found again.* So the angel casts the millstone into the sea: *Thus with violence shall that great city Babylon be thrown down, and shall be found no more at all* (Revelation 18:21). The city sunk like a stone, sought for and never found again — the prophet''s very sentence on the sea-city spoken over Babylon.'),
  ('canon','revelation',18,22,'canon','isaiah',24,8,'free', E'*The mirth of tabrets ceaseth, the noise of them that rejoice endeth, the joy of the harp ceaseth.* (Isaiah 24:8). Isaiah saw the joy of the city silenced — *the joy of the harp ceaseth.* So the seer silences the fallen city: *the voice of harpers, and musicians, and of pipers, and trumpeters, shall be heard no more at all in thee* (Revelation 18:22). The mirth and the harp that ceased in the prophet''s judgment cease forever in Babylon, the music and the millstone alike heard no more.'),
  -- thread: the-blood-of-prophets-and-saints-found-in-her
  ('canon','revelation',18,24,'enoch','1-enoch',47,1,'extras', E'*And in those days shall have ascended the prayer of the righteous, And the blood of the righteous from the earth before Yahuah (God) of Spirits.* (1 Enoch 47:1). The Hebrew library saw *the blood of the righteous* ascend from the earth, crying before the throne for judgment. *And in her was found the blood of prophets, and of saints, and of all that were slain upon the earth* (Revelation 18:24) — the same shed blood, ascended and remembered, the long account of the righteous slain closed in the doom of the city that shed it.'),
  ('canon','revelation',18,24,'enoch','1-enoch',47,2,'extras', E'*In those days the holy ones who dwell above in the heavens... supplicate and pray... On behalf of the blood of the righteous which has been shed... That judgement may be done unto them...* (1 Enoch 47:2). The holy ones above plead *on behalf of the blood of the righteous which has been shed, that judgement may be done.* That judgment falls when *in her was found the blood of prophets, and of saints* (Revelation 18:24) — the prayer for the avenging of righteous blood answered in Babylon''s fall, the cry of the souls under the altar heard at last.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- thread members -----
-- babylon-the-great-is-fallen-is-fallen
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 13:19 — *Babylon, the glory of kingdoms... shall be as when Elohim (God) overthrew Sodom and Gomorrah* the glory of kingdoms cast down like Sodom; *Babylon the great is fallen, is fallen* (Revelation 18:2).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-18-babylon-the-great-is-fallen-is-fallen-isaiah-21-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=13 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Jeremiah 51:37 — *Babylon shall become heaps, a dwellingplace for dragons... without an inhabitant* the city become a haunt of dragons; *become the habitation of devils, and the hold of every foul spirit* (Revelation 18:2).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-18-babylon-the-great-is-fallen-is-fallen-isaiah-21-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=51 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- reward-her-double-the-cup-she-filled
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Jeremiah 16:18 — *first I will recompense their iniquity and their sin double* the law of double recompense; *double unto her double according to her works* (Revelation 18:6).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-18-reward-her-double-the-cup-she-filled-jeremiah-50-psalm-137'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=16 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Isaiah 47:7 — *thou saidst, I shall be a lady for ever... neither didst remember the latter end of it* the daughter of Babylon''s boast, forgetting her end; *I sit a queen, and am no widow, and shall see no sorrow* (Revelation 18:7).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-18-reward-her-double-the-cup-she-filled-jeremiah-50-psalm-137'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=47 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- the-kings-and-merchants-lament-over-her (Tyre)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Ezekiel 27:31 — *they shall weep for thee with bitterness of heart and bitter wailing* the mourners over Tyre baldness and sackcloth; the shipmasters *weeping and wailing* over Babylon (Revelation 18:19).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-18-the-kings-and-merchants-lament-over-her-ezekiel-27-tyre'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=27 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Isaiah 23:1 — *The burden of Tyre. Howl, ye ships of Tarshish; for it is laid waste* the seafarers'' wail over Tyre; the shipmasters and sailors crying over the smoke of her burning (Revelation 18:17-18).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-18-the-kings-and-merchants-lament-over-her-ezekiel-27-tyre'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=23 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- rejoice-over-her-thou-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 44:23 — *Sing, O ye heavens; for Yahuah (LORD) hath done it... for Yahuah (LORD) hath redeemed Jacob* the heavens called to sing for the redemption of Jacob; *Rejoice over her, thou heaven... for Elohim (God) hath avenged you on her* (Revelation 18:20).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-18-rejoice-over-her-thou-heaven-elohim-hath-avenged-you-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- the-millstone-cast-into-the-sea
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Ezekiel 26:21 — *thou shalt be no more: though thou be sought for, yet shalt thou never be found again* the sea-city sunk and never found; *shall be found no more at all* (Revelation 18:21).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-18-the-millstone-cast-into-the-sea-babylon-thrown-down-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=26 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Isaiah 24:8 — *The mirth of tabrets ceaseth... the joy of the harp ceaseth* the silenced joy of the doomed city; *the voice of harpers, and musicians... shall be heard no more at all in thee* (Revelation 18:22).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-18-the-millstone-cast-into-the-sea-babylon-thrown-down-jeremiah-51'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- the-blood-of-prophets-and-saints-found-in-her
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'1 Enoch 47:1 — *the blood of the righteous from the earth before Yahuah (God) of Spirits* the blood of the righteous ascending to cry for judgment; *in her was found the blood of prophets, and of saints* (Revelation 18:24).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-18-the-blood-of-prophets-and-saints-found-in-her-jeremiah-51-matthew-23'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=24
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=47 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'1 Enoch 47:2 — *On behalf of the blood of the righteous which has been shed... That judgement may be done unto them* the holy ones pleading for the avenging of righteous blood; that judgment falls in Babylon''s reckoning (Revelation 18:24).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-18-the-blood-of-prophets-and-saints-found-in-her-jeremiah-51-matthew-23'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=18 AND sv.verse_number=24
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=47 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
