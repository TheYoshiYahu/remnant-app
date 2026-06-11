-- S227 enrichment — Revelation 4: throne / sea of glass / creatures / elders / Maker
-- Adds prophetic + extra-canonical roots (1 Enoch throne-visions especially) to live threads.
-- References shared view _s227_rev_lookup (defined by the assembled migration).

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: revelation-4-the-throne-set-in-heaven-and-one-sat-on-the-throne-ezekiel-1
  ('canon','revelation',4,2,'canon','isaiah',6,1,'free', E'*In the year that king Uzziah died I saw also Yahuah (Lord) sitting upon a throne, high and lifted up, and his train filled the temple* (Isaiah 6:1). Before Ezekiel and before John, Isaiah was caught up to the same throne: *Yahuah (Lord) sitting upon a throne, high and lifted up.* The seer''s *a throne was set in heaven, and one sat on the throne* (Revelation 4:2) is the one throne the prophets all behold — the Father, the Most High, shown in vision-form to His servants.'),
  ('canon','revelation',4,2,'enoch','1-enoch',14,18,'extras', E'*And beyond that abyss I saw a place which had no firmament of the heaven above, and no firmly founded earth beneath it... but it was a waste and horrible place* (1 Enoch 14:18). In the same vision where Enoch reached the throne of Yahuah (God), he passed the lofty throne-room John is now caught up into — *a door was opened in heaven* (Revelation 4:1), the throne *set in heaven* (Revelation 4:2). The seers of Yashar''el (Israel) ascended to behold what John beholds: the throne of the living Elohim (God) above the firmament.'),
  ('canon','revelation',4,9,'enoch','1-enoch',71,8,'extras', E'*And after that I saw the hidden things in heaven... how the fountains of the spirits are reckoned* (1 Enoch 71:8). Enoch was translated to *the heaven of heavens* and saw *a structure built of crystals, and between those crystals tongues of living fire* (1 Enoch 71:9) — the crystal throne-house of fire where the Head of Days sits. It is the same throne-room John enters, where *him that liveth for ever and ever* (Revelation 4:9) receives glory and honour and thanks; the lofty throne of glory the seers of Yashar''el (Israel) beheld before him.'),
  -- thread: revelation-4-the-sea-of-glass-before-the-throne-exodus-24
  ('canon','revelation',4,6,'enoch','1-enoch',71,5,'extras', E'*And he translated my spirit into the heaven of heavens, And I saw there a structure built of crystals, And between those crystals tongues of living fire* (1 Enoch 71:5). Enoch saw the throne-room floored and walled with crystal — *a structure built of crystals* — the same clear, shining expanse John names *a sea of glass like unto crystal* (Revelation 4:6). The crystal pavement of the throne-house the seers of Yashar''el (Israel) beheld is the crystal sea before the throne, the clear floor of the heavenly sanctuary.'),
  -- thread: revelation-4-holy-holy-holy-the-lord-god-almighty-isaiah-6
  ('canon','revelation',4,8,'enoch','1-enoch',39,11,'extras', E'*And I saw the four presences which surround the throne of glory, and they praise Yahuah (God) of Spirits, and they intercede for the children of men* (1 Enoch 39:11). Enoch saw the very four John sees: *four presences which surround the throne of glory,* unceasing in praise — John''s *four beasts* who *rest not day and night, saying, Holy, holy, holy* (Revelation 4:8). The four worship-bearers about the throne are one order across the library, the burning ones who circle the throne of the Most High.'),
  -- thread: revelation-4-the-elders-cast-their-crowns-and-the-myriads-before-the-throne
  ('canon','revelation',4,10,'canon','daniel',7,10,'free', E'*A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened* (Daniel 7:10). The numberless host that ministers before the throne in John''s vision — the elders and the *myriads* — is Daniel''s court: *thousand thousands ministered unto him, and ten thousand times ten thousand stood before him.* The four and twenty elders who *cast their crowns before the throne* (Revelation 4:10) are of that same uncountable throng before the Ancient of days.'),
  ('canon','revelation',4,10,'enoch','1-enoch',60,1,'extras', E'*...the host of the Most High, and the angels, a thousand thousands and ten thousand times ten thousand, were disquieted with a great disquiet* (1 Enoch 60:1). The Hebrew library numbered the throne-host exactly as John does: *a thousand thousands and ten thousand times ten thousand,* the angels of the Most High; and *the Head of Days sat on the throne of His glory, and the angels and the righteous stood around Him* (1 Enoch 60:2) — the very picture of the elders and myriads who fall down and worship before the throne (Revelation 4:10).'),
  -- thread: revelation-4-thou-hast-created-all-things-the-maker-worshipped-genesis-1-nehemiah-9
  ('canon','revelation',4,11,'canon','isaiah',40,26,'free', E'*Lift up your eyes on high, and behold who hath created these things, that bringeth out their host by number: he calleth them all by names by the greatness of his might... not one faileth* (Isaiah 40:26). The elders'' song — *thou hast created all things, and for thy pleasure they are and were created* (Revelation 4:11) — is Isaiah''s confession of the Maker who *created these things* and calls the whole host by name. He is worthy because he made and numbers and upholds all; the throne is the throne of the Creator.'),
  ('canon','revelation',4,11,'canon','jeremiah',10,12,'free', E'*He hath made the earth by his power, he hath established the world by his wisdom, and hath stretched out the heavens by his discretion* (Jeremiah 10:12). Jeremiah names the One the elders crown as Maker: *he hath made the earth by his power... and hath stretched out the heavens by his discretion.* So they sing *thou hast created all things* (Revelation 4:11) — power, wisdom, and discretion gathered into the one Creator on the throne, worthy of all glory and honour and power.'),
  ('canon','revelation',4,11,'enoch','1-enoch',9,5,'extras', E'*Thou hast made all things, and power over all things hast Thou: and all things are naked and open in Thy sight... and nothing can hide itself from Thee* (1 Enoch 9:5). The Hebrew library lifts the elders'' very creed: *Thou hast made all things, and power over all things hast Thou.* It is the ground of all the throne-room''s worship — *for thou hast created all things, and for thy pleasure they are and were created* (Revelation 4:11) — the Maker who made all and holds power over all.'),
  ('canon','revelation',4,11,'apocrypha','2-esdras',6,38,'extras', E'*And I said, O Yahuah (God), you spakest from the beginning of the creation, even the first day, and saidst thus; Let heaven and earth be made; and your word was a perfect work* (2 Esdras 6:38). Ezra recounts the creation the elders crown the Maker for: *you spakest from the beginning of the creation... Let heaven and earth be made.* The same confession stands behind *thou hast created all things* (Revelation 4:11) — all things made by his word, *for as soon as your word went forth the work was made* (2 Esdras 6:43), and so worthy is he who made them.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- thread members -----

-- thread: revelation-4-the-throne-set-in-heaven-and-one-sat-on-the-throne-ezekiel-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 6:1 — *I saw also Yahuah (Lord) sitting upon a throne, high and lifted up* the throne Isaiah was caught up to behold, the one throne John is caught up to, *a throne was set in heaven, and one sat on the throne* (Revelation 4:2).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-4-the-throne-set-in-heaven-and-one-sat-on-the-throne-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'1 Enoch 14:18 — *I saw a place which had no firmament of the heaven above* the lofty throne-room Enoch reached in his ascent, the heaven into which a door opens and John is caught up (Revelation 4:1-2).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-4-the-throne-set-in-heaven-and-one-sat-on-the-throne-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=14 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'1 Enoch 71:8 — *I saw the hidden things in heaven* Enoch translated to the heaven of heavens and the crystal throne-house of living fire, the throne-room of *him that liveth for ever and ever* (Revelation 4:9).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-4-the-throne-set-in-heaven-and-one-sat-on-the-throne-ezekiel-1'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=71 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- thread: revelation-4-the-sea-of-glass-before-the-throne-exodus-24
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'1 Enoch 71:5 — *I saw there a structure built of crystals, And between those crystals tongues of living fire* the crystal throne-house Enoch beheld in the heaven of heavens, the same crystal expanse as John''s sea of glass like crystal (Revelation 4:6).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-4-the-sea-of-glass-before-the-throne-exodus-24'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=71 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- thread: revelation-4-holy-holy-holy-the-lord-god-almighty-isaiah-6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'1 Enoch 39:11 — *I saw the four presences which surround the throne of glory, and they praise Yahuah (God) of Spirits* the four about the throne whose ceaseless praise Enoch saw, John''s four beasts crying *Holy, holy, holy* day and night (Revelation 4:8).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-4-holy-holy-holy-the-lord-god-almighty-isaiah-6'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=39 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- thread: revelation-4-the-elders-cast-their-crowns-and-the-myriads-before-the-throne
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Daniel 7:10 — *thousand thousands ministered unto him, and ten thousand times ten thousand stood before him* the numberless court before the Ancient of days, the host of which the enthroned elders who cast their crowns are a part (Revelation 4:10).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-4-the-elders-cast-their-crowns-and-the-myriads-before-the-throne'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'1 Enoch 60:1 — *a thousand thousands and ten thousand times ten thousand* the host of the Most High before the throne of glory where the Head of Days sits, the angels and righteous standing around Him (Revelation 4:10).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-4-the-elders-cast-their-crowns-and-the-myriads-before-the-throne'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=60 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- thread: revelation-4-thou-hast-created-all-things-the-maker-worshipped-genesis-1-nehemiah-9
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 40:26 — *behold who hath created these things, that bringeth out their host by number... not one faileth* the Maker who created and numbers the whole host, worthy because *thou hast created all things* (Revelation 4:11).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-4-thou-hast-created-all-things-the-maker-worshipped-genesis-1-nehemiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Jeremiah 10:12 — *He hath made the earth by his power... and hath stretched out the heavens by his discretion* the Creator the elders crown as Maker, worthy of glory and honour and power, *for thou hast created all things* (Revelation 4:11).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-4-thou-hast-created-all-things-the-maker-worshipped-genesis-1-nehemiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'1 Enoch 9:5 — *Thou hast made all things, and power over all things hast Thou* the Hebrew library''s creed of the Maker, the ground of the elders'' song, *thou hast created all things, and for thy pleasure they are and were created* (Revelation 4:11).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-4-thou-hast-created-all-things-the-maker-worshipped-genesis-1-nehemiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=9 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 24, E'2 Esdras 6:38 — *you spakest from the beginning of the creation... Let heaven and earth be made; and your word was a perfect work* the creation by the word, the ground of the elders'' worship of the Maker (Revelation 4:11).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-4-thou-hast-created-all-things-the-maker-worshipped-genesis-1-nehemiah-9'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=6 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
