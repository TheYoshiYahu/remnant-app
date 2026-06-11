-- ----- fragment: minion_1enoch_40.sql (session250 1-enoch 40) -----
-- Source anchor: enoch/1-enoch ch40. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en40 (view _session250_en40_lookup). Sort band base 50975, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en40_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-40-myriads-before-the-throne
  ('enoch', '1-enoch', 40, 1, 'canon', 'daniel', 7, 10, 'free', E'Daniel 7:10 — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* Daniel''s uncountable court before the Ancient of days is Enoch''s myriads of myriads standing before the Yahuah of Spirits at 40:1.'),
  ('enoch', '1-enoch', 40, 1, 'canon', 'revelation', 5, 11, 'free', E'Revelation 5:11 — *And I beheld, and I heard the voice of many angels round about the throne and the beasts and the elders: and the number of them was ten thousand times ten thousand, and thousands of thousands;* John hears the identical numbering of the host around the throne that Enoch saw at 40:1.'),
  ('enoch', '1-enoch', 40, 1, 'canon', 'revelation', 7, 11, 'free', E'Revelation 7:11 — *And all the angels stood round about the throne, and about the elders and the four beasts, and fell before the throne on their faces, and worshipped Elohim (God),* the whole host standing before the throne to worship is the posture of Enoch''s infinite number standing before the Yahuah of Spirits at 40:1.'),
  -- thread: 1-enoch-40-four-presences-holy
  ('enoch', '1-enoch', 40, 3, 'canon', 'isaiah', 6, 2, 'free', E'Isaiah 6:2 — *Above it stood the seraphims: each one had six wings; with twain he covered his face, and with twain he covered his feet, and with twain he did fly.* Isaiah''s seraphim stationed above the throne are Enoch''s four presences ranged on the four sides of the Yahuah of Spirits at 40:2-3.'),
  ('enoch', '1-enoch', 40, 4, 'canon', 'isaiah', 6, 3, 'free', E'Isaiah 6:3 — *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory.* The seraphim''s threefold cry of blessing is the first of Enoch''s four voices, which blesses the Yahuah of Spirits for ever and ever at 40:4.'),
  -- thread: 1-enoch-40-second-voice-elect-one
  ('enoch', '1-enoch', 40, 5, 'enoch', '1-enoch', 46, 3, 'extras', E'1 Enoch 46:3 — *And he answered and said unto me: This is the Son of Adam who hath righteousness, with whom dwelleth righteousness, and who revealeth all the treasures of that which is hidden, because Yahuah (God) of Spirits hath chosen him, and whose lot hath the pre-eminence before Yahuah (God) of Spirits in uprightness for ever.* The Similitudes name the Elect One blessed by Enoch''s second voice (40:5) as the chosen Son of Adam who reveals the hidden treasures.'),
  ('enoch', '1-enoch', 40, 5, 'enoch', '1-enoch', 48, 2, 'extras', E'1 Enoch 48:2 — *And at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days.* The Elect One blessed at 40:5 is the Son of Adam named before the Head of Days, the Formed proceeding from the Father — named before creation, election before confession.'),
  ('enoch', '1-enoch', 40, 5, 'canon', 'isaiah', 42, 1, 'free', E'Isaiah 42:1 — *Behold my servant, whom I uphold; mine elect, in whom my soul delighteth; I have put my spirit upon him: he shall bring forth judgment to the Gentiles.* Isaiah''s chosen servant with the Spirit upon Him is the Elect One whom Enoch''s second voice blesses at 40:5.'),
  ('enoch', '1-enoch', 40, 5, 'canon', 'daniel', 7, 13, 'free', E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* Daniel sees one LIKE the Son of Adam (the kaph — resembling mortal-man because He took on flesh) brought to the Ancient of days; Enoch''s Similitudes NAME that same One the Elect One blessed at 40:5.'),
  -- thread: 1-enoch-40-third-voice-intercession
  ('enoch', '1-enoch', 40, 7, 'canon', 'zechariah', 3, 1, 'free', E'Zechariah 3:1 — *And he shewed me Joshua the high priest standing before the angel of Yahuah (LORD), and Satan standing at his right hand to resist him.* Zechariah sees the satan resisting a man before the Yahuah''s angel — precisely the accusation Enoch''s fourth voice fends off at 40:7.'),
  ('enoch', '1-enoch', 40, 7, 'canon', 'revelation', 12, 10, 'free', E'Revelation 12:10 — *And I heard a loud voice saying in heaven, Now is come salvation, and strength, and the kingdom of our Elohim (God), and the power of his Messiah (Christ): for the accuser of our brethren is cast down, which accused them before our Elohim (God) day and night.* John hears the day the accuser is cast down — the satans Enoch''s fourth voice forbids to accuse the dwellers on earth at 40:7.'),
  ('enoch', '1-enoch', 40, 6, 'apocrypha', 'tobit', 12, 15, 'extras', E'Tobit 12:15 — *I am Raphael, one of the seven holy angels, which present the prayers of the saints, and which go in and out before the glory of the Holy One.* Raphael, named in Enoch 40:9, is the angel who presents the saints'' prayers — the work of the third voice interceding before the Yahuah of Spirits at 40:6.'),
  ('enoch', '1-enoch', 40, 6, 'canon', 'revelation', 8, 3, 'free', E'Revelation 8:3 — *And another angel came and stood at the altar, having a golden censer; and there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne.* The angel offering the saints'' prayers at the throne is the third voice praying and interceding for those who dwell on earth at 40:6.'),
  ('enoch', '1-enoch', 40, 6, 'canon', 'romans', 8, 34, 'free', E'Romans 8:34 — *Who is he that condemneth? It is Messiah (Christ) that died, yea rather, that is risen again, who is even at the right hand of Elohim (God), who also maketh intercession for us.* The angels'' supplication at 40:6 points toward the Son of Adam Himself, who intercedes at the Father''s right hand.'),
  -- thread: 1-enoch-40-four-archangels-named
  ('enoch', '1-enoch', 40, 9, 'canon', 'daniel', 12, 1, 'free', E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* Daniel names Michael the prince who stands for the people — the merciful, long-suffering first presence of Enoch 40:9.'),
  ('enoch', '1-enoch', 40, 9, 'canon', 'jude', 1, 9, 'free', E'Jude 1:9 — *Yet Michael the archangel, when contending with the devil he disputed about the body of Moses, durst not bring against him a railing accusation, but said, Yahuah (Lord) rebuke thee.* Jude names Michael the archangel who leaves the rebuke to the Yahuah — the long-suffering first presence whose voice blesses in Enoch 40:9.'),
  ('enoch', '1-enoch', 40, 9, 'apocrypha', 'tobit', 12, 15, 'extras', E'Tobit 12:15 — *I am Raphael, one of the seven holy angels, which present the prayers of the saints, and which go in and out before the glory of the Holy One.* Tobit names Raphael the healer-angel who bears the saints'' prayers — the second presence set over all sickness and all wounds in Enoch 40:9.'),
  ('enoch', '1-enoch', 40, 9, 'jubilees', 'jubilees', 2, 2, 'extras', E'Jubilees 2:2 — *For on the first day He created the heavens which are above and the earth and the waters and all the spirits which serve before Him–the angels of the presence, and the angels of sanctification ... and the angels of the spirit of the winds, and the angels of the spirit of the clouds, and of darkness, and of snow and of hail and of hoar frost ...* Jubilees records the same ranked angels of the presence set over the works of creation that Enoch names and assigns at 40:9.'),
  -- thread: 1-enoch-40-secrets-revealed-to-elect
  ('enoch', '1-enoch', 40, 21, 'canon', 'job', 38, 22, 'free', E'Job 38:22 — *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail,* the very storehouses of the winds and weather Enoch says shall be opened to the righteous at 40:21 are the treasuries the Yahuah questions Job about.'),
  ('enoch', '1-enoch', 40, 13, 'canon', 'daniel', 2, 22, 'free', E'Daniel 2:22 — *He revealeth the deep and secret things: he knoweth what is in the darkness, and the light dwelleth with him.* Daniel names the One who reveals the deep and secret things — the unsealing of the secrets of thunder, winds, and the luminaries promised in Enoch 40:13.'),
  ('enoch', '1-enoch', 40, 13, 'enoch', '1-enoch', 46, 3, 'extras', E'1 Enoch 46:3 — *This is the Son of Adam who hath righteousness, with whom dwelleth righteousness, and who revealeth all the treasures of that which is hidden, because Yahuah (God) of Spirits hath chosen him ...* The Similitudes name the Elect One as the One through whom the hidden treasures of 40:13 are revealed to the righteous and elect.'),
  ('enoch', '1-enoch', 40, 17, 'canon', 'matthew', 10, 26, 'free', E'Matthew 10:26 — *Fear them not therefore: for there is nothing covered, that shall not be revealed; and hid, that shall not be known.* Yahusha''s promise that every hidden thing shall be uncovered is the unsealing of the secrets to the righteous and elect at 40:17.'),
  ('enoch', '1-enoch', 40, 24, 'canon', '1-corinthians', 2, 10, 'free', E'1 Corinthians 2:10 — *But Elohim (God) hath revealed them unto us by his Spirit: for the Spirit searcheth all things, yea, the deep things of Elohim (God).* The Spirit who searches the deep things and discloses them to those who love Him is the unveiling of the secrets of the deep and of Sheol to the righteous and elect at 40:24.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en40_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en40_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-40-myriads-before-the-throne',
       E'Thousands of thousands before the Yahuah of Spirits',
       E'Enoch is lifted into the throne-room and counts the host: *And after that I saw thousands of thousands and myriads of myriads, and an infinite number of people, standing before Yahuah (God) of Spirits.* (1 Enoch 40:1). It ain''t new — Daniel sees the same uncountable court convene for judgement: *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* (Daniel 7:10), and John, carried up in the Spirit, hears the very same numbering around the throne, *the number of them was ten thousand times ten thousand, and thousands of thousands;* (Revelation 5:11), the whole heavenly assembly falling on their faces, *And all the angels stood round about the throne, and about the elders and the four beasts, and fell before the throne on their faces, and worshipped Elohim (God),* (Revelation 7:11). One court, one Yahuah of Spirits, seen by Enoch, by Daniel, and by John.',
       sv.verse_id, ev.verse_id, 'extras', 50975
  FROM _session250_en40_lookup sv, _session250_en40_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=40 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=40 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-40-four-presences-holy',
       E'The four presences and the voice of praise',
       E'Around the throne stand four faces lifting praise: *And on the four sides of Yahuah (God) of Spirits I saw four presences, different from those that stand* (1 Enoch 40:2), *And I heard the voices of those four presences as they uttered praises before Yahuah (God) of glory.* (1 Enoch 40:3), *The first voice blesses Yahuah (God) of Spirits for ever and ever.* (1 Enoch 40:4). It ain''t new — Isaiah is shown the same surrounding throne-attendants whose whole work is praise: *Above it stood the seraphims: each one had six wings; with twain he covered his face, and with twain he covered his feet, and with twain he did fly.* (Isaiah 6:2), and their cry — *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory.* (Isaiah 6:3) — is the first of Enoch''s four voices, blessing the Yahuah of Spirits for ever. John records the matching scene of the four living creatures and the host ringed about the throne in ceaseless worship (Revelation 7:11). The four presences are not a new mythology; they are the seraphim of the temple vision seen from another angle.',
       sv.verse_id, ev.verse_id, 'extras', 50978
  FROM _session250_en40_lookup sv, _session250_en40_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=40 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=40 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-40-second-voice-elect-one',
       E'The second voice blesses the Elect One',
       E'The second of the four voices is reserved for One who is blessed beside the Yahuah of Spirits: *And the second voice I heard blessing the Elect One and the elect ones who hang upon Yahuah (God) of Spirits.* (1 Enoch 40:5), and the same blessing rises from the earth into heaven — *and the voices of those who bless the Elect One shall be heard in the heaven.* (1 Enoch 40:11). The Elect One here is the Formed Son who proceeds from the Head of Days (the formless Father), chosen and named before creation, worshipped with Him yet ordered under Him — the same figure this very book will name a few chapters on: *This is the Son of Adam who hath righteousness ... because Yahuah (God) of Spirits hath chosen him* (1 Enoch 46:3), *And at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days.* (1 Enoch 48:2). It ain''t new — Isaiah had already announced Him as the chosen one upon whom the Spirit rests: *Behold my servant, whom I uphold; mine elect, in whom my soul delighteth; I have put my spirit upon him* (Isaiah 42:1). And when Daniel sees Him brought to the throne, he keeps the kaph — *behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days* (Daniel 7:13): Daniel sees one LIKE the Son of Adam, the figure resembling mortal-man because He took on flesh while remaining the Formed; Enoch''s Similitudes NAME that same One the Elect One. John in turn sees Him standing among the lampstands, again with the kaph, *one like unto the Son of Adam* (Revelation 1:13). The elect ones who hang upon the Yahuah of Spirits are His people, chosen with Him — election before confession.',
       sv.verse_id, ev.verse_id, 'extras', 50981
  FROM _session250_en40_lookup sv, _session250_en40_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=40 AND sv.verse_number=5
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=40 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-40-third-voice-intercession',
       E'The third voice intercedes; the fourth fends off the satans',
       E'Two of the four voices wage heaven''s war for the people of the earth: *And the third voice I heard praying and interceding for those who dwell on the earth and supplicate in the name of Yahuah (God) of Spirits.* (1 Enoch 40:6), *And I heard the fourth voice fending off the Satans and forbidding them to come before Yahuah (God) of Spirits to accuse them who dwell on the earth.* (1 Enoch 40:7). It ain''t new — Zechariah is shown that very accusing satan resisting a man before the Yahuah''s angel: *And he shewed me Joshua the high priest standing before the angel of Yahuah (LORD), and Satan standing at his right hand to resist him.* (Zechariah 3:1), and John hears the day the accuser is silenced: *for the accuser of our brethren is cast down, which accused them before our Elohim (God) day and night.* (Revelation 12:10). The interceding voice is no isolated angelology either — Raphael himself is the one who lifts up prayers: *I am Raphael, one of the seven holy angels, which present the prayers of the saints, and which go in and out before the glory of the Holy One.* (Tobit 12:15), and the same incense-prayer ascends in John''s throne-room: *And another angel came and stood at the altar, having a golden censer ... that he should offer it with the prayers of all saints upon the golden altar which was before the throne.* (Revelation 8:3). Above all these created intercessors stands the Son of Adam Himself, who *maketh intercession for us* (Romans 8:34) — the One the angels'' supplication points toward.',
       sv.verse_id, ev.verse_id, 'extras', 50984
  FROM _session250_en40_lookup sv, _session250_en40_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=40 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=40 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-40-four-archangels-named',
       E'Michael, Raphael, Gabriel, Phanuel — the four named',
       E'Enoch''s angel-guide names the four presences: *This first is Michael, the merciful and long-suffering: and the second, who is set over all sickness and all wounds, is Raphael: and the third, who is set over all the powers, is Gabriel: and the fourth, who is set over the repentance unto hope of those who inherit eternal life, is named Phanuel.* (1 Enoch 40:9). It ain''t new — Michael is named in Daniel as the prince who stands for the people: *And at that time shall Michael stand up, the great prince which standeth for the children of thy people* (Daniel 12:1), and Jude calls him the archangel who would not himself rail against the accuser, *Yet Michael the archangel, when contending with the devil he disputed about the body of Moses ... but said, Yahuah (Lord) rebuke thee.* (Jude 1:9) — the merciful, long-suffering blesser of Enoch 40. Raphael, set over all sickness and wounds, is the one Tobit names as the healer who presents the prayers of the saints, *I am Raphael, one of the seven holy angels, which present the prayers of the saints* (Tobit 12:15). And this very ranking of named presences over winds and clouds and the works of creation is the order Jubilees records from the first day: *the angels of the spirit of the winds, and the angels of the spirit of the clouds, and of darkness, and of snow and of hail* (Jubilees 2:2). The four are not invented mythology; they are the canon''s own named ministers.',
       sv.verse_id, ev.verse_id, 'extras', 50987
  FROM _session250_en40_lookup sv, _session250_en40_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=40 AND sv.verse_number=8
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=40 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-40-secrets-revealed-to-elect',
       E'The hidden things revealed to the righteous and elect',
       E'In the day of the Elect One the closed treasuries of creation are thrown open: *And in those days the secrets of the thunder and the lightning shall be revealed, and the secrets of the winds and the clouds, and the secrets of the sun and the moon and the stars shall be revealed.* (1 Enoch 40:13), *And the treasuries of the winds shall be opened to the righteous and elect.* (1 Enoch 40:21), *And the secrets of Sheol shall be laid bare to the righteous and elect.* (1 Enoch 40:24). It ain''t new — the Tanakh already locates these very storehouses with the Yahuah alone: *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail* (Job 38:22), and Daniel confesses the One who unseals them: *He revealeth the deep and secret things: he knoweth what is in the darkness, and the light dwelleth with him.* (Daniel 2:22). And it is the Son of Adam, the Elect One, through whom they are unsealed, *who revealeth all the treasures of that which is hidden* (1 Enoch 46:3). The Gospel promises the same disclosure to the elect — *Fear them not therefore: for there is nothing covered, that shall not be revealed; and hid, that shall not be known.* (Matthew 10:26) — and Paul names the Spirit who searches the storehouses out, *the Spirit searcheth all things, yea, the deep things of Elohim (God).* (1 Corinthians 2:10). The secrets are not hoarded; they are kept for the righteous and elect — the people chosen with the Elect One.',
       sv.verse_id, ev.verse_id, 'extras', 50990
  FROM _session250_en40_lookup sv, _session250_en40_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=40 AND sv.verse_number=13
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=40 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-40-myriads-before-the-throne
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:10 — *A fiery stream issued and came forth from before him: thousand thousands ministered unto him, and ten thousand times ten thousand stood before him: the judgment was set, and the books were opened.* Daniel''s uncountable court before the Ancient of days is Enoch''s myriads of myriads standing before the Yahuah of Spirits at 40:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en40_lookup sv, _session250_en40_lookup tv
 WHERE t.slug='1-enoch-40-myriads-before-the-throne'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=40 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 5:11 — *And I beheld, and I heard the voice of many angels round about the throne and the beasts and the elders: and the number of them was ten thousand times ten thousand, and thousands of thousands;* John hears the identical numbering of the host around the throne that Enoch saw at 40:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en40_lookup sv, _session250_en40_lookup tv
 WHERE t.slug='1-enoch-40-myriads-before-the-throne'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=40 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 7:11 — *And all the angels stood round about the throne, and about the elders and the four beasts, and fell before the throne on their faces, and worshipped Elohim (God),* the whole host standing before the throne to worship is the posture of Enoch''s infinite number standing before the Yahuah of Spirits at 40:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en40_lookup sv, _session250_en40_lookup tv
 WHERE t.slug='1-enoch-40-myriads-before-the-throne'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=40 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-40-four-presences-holy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 6:2 — *Above it stood the seraphims: each one had six wings; with twain he covered his face, and with twain he covered his feet, and with twain he did fly.* Isaiah''s seraphim stationed above the throne are Enoch''s four presences ranged on the four sides of the Yahuah of Spirits at 40:2-3.'
  FROM cross_reference_threads t, cross_references x, _session250_en40_lookup sv, _session250_en40_lookup tv
 WHERE t.slug='1-enoch-40-four-presences-holy'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=40 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 6:3 — *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory.* The seraphim''s threefold cry of blessing is the first of Enoch''s four voices, which blesses the Yahuah of Spirits for ever and ever at 40:4.'
  FROM cross_reference_threads t, cross_references x, _session250_en40_lookup sv, _session250_en40_lookup tv
 WHERE t.slug='1-enoch-40-four-presences-holy'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=40 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-40-second-voice-elect-one
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 46:3 — *And he answered and said unto me: This is the Son of Adam who hath righteousness, with whom dwelleth righteousness, and who revealeth all the treasures of that which is hidden, because Yahuah (God) of Spirits hath chosen him, and whose lot hath the pre-eminence before Yahuah (God) of Spirits in uprightness for ever.* The Similitudes name the Elect One blessed by Enoch''s second voice (40:5) as the chosen Son of Adam who reveals the hidden treasures.'
  FROM cross_reference_threads t, cross_references x, _session250_en40_lookup sv, _session250_en40_lookup tv
 WHERE t.slug='1-enoch-40-second-voice-elect-one'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=40 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=46 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 48:2 — *And at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days.* The Elect One blessed at 40:5 is the Son of Adam named before the Head of Days, the Formed proceeding from the Father — named before creation, election before confession.'
  FROM cross_reference_threads t, cross_references x, _session250_en40_lookup sv, _session250_en40_lookup tv
 WHERE t.slug='1-enoch-40-second-voice-elect-one'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=40 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 42:1 — *Behold my servant, whom I uphold; mine elect, in whom my soul delighteth; I have put my spirit upon him: he shall bring forth judgment to the Gentiles.* Isaiah''s chosen servant with the Spirit upon Him is the Elect One whom Enoch''s second voice blesses at 40:5.'
  FROM cross_reference_threads t, cross_references x, _session250_en40_lookup sv, _session250_en40_lookup tv
 WHERE t.slug='1-enoch-40-second-voice-elect-one'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=40 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=42 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 7:13 — *I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days, and they brought him near before him.* Daniel sees one LIKE the Son of Adam (the kaph — resembling mortal-man because He took on flesh) brought to the Ancient of days; Enoch''s Similitudes NAME that same One the Elect One blessed at 40:5.'
  FROM cross_reference_threads t, cross_references x, _session250_en40_lookup sv, _session250_en40_lookup tv
 WHERE t.slug='1-enoch-40-second-voice-elect-one'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=40 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-40-third-voice-intercession
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Zechariah 3:1 — *And he shewed me Joshua the high priest standing before the angel of Yahuah (LORD), and Satan standing at his right hand to resist him.* Zechariah sees the satan resisting a man before the Yahuah''s angel — precisely the accusation Enoch''s fourth voice fends off at 40:7.'
  FROM cross_reference_threads t, cross_references x, _session250_en40_lookup sv, _session250_en40_lookup tv
 WHERE t.slug='1-enoch-40-third-voice-intercession'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=40 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 12:10 — *And I heard a loud voice saying in heaven, Now is come salvation, and strength, and the kingdom of our Elohim (God), and the power of his Messiah (Christ): for the accuser of our brethren is cast down, which accused them before our Elohim (God) day and night.* John hears the day the accuser is cast down — the satans Enoch''s fourth voice forbids to accuse the dwellers on earth at 40:7.'
  FROM cross_reference_threads t, cross_references x, _session250_en40_lookup sv, _session250_en40_lookup tv
 WHERE t.slug='1-enoch-40-third-voice-intercession'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=40 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Tobit 12:15 — *I am Raphael, one of the seven holy angels, which present the prayers of the saints, and which go in and out before the glory of the Holy One.* Raphael, named in Enoch 40:9, is the angel who presents the saints'' prayers — the work of the third voice interceding before the Yahuah of Spirits at 40:6.'
  FROM cross_reference_threads t, cross_references x, _session250_en40_lookup sv, _session250_en40_lookup tv
 WHERE t.slug='1-enoch-40-third-voice-intercession'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=40 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=12 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Revelation 8:3 — *And another angel came and stood at the altar, having a golden censer; and there was given unto him much incense, that he should offer it with the prayers of all saints upon the golden altar which was before the throne.* The angel offering the saints'' prayers at the throne is the third voice praying and interceding for those who dwell on earth at 40:6.'
  FROM cross_reference_threads t, cross_references x, _session250_en40_lookup sv, _session250_en40_lookup tv
 WHERE t.slug='1-enoch-40-third-voice-intercession'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=40 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 8:34 — *Who is he that condemneth? It is Messiah (Christ) that died, yea rather, that is risen again, who is even at the right hand of Elohim (God), who also maketh intercession for us.* The angels'' supplication at 40:6 points toward the Son of Adam Himself, who intercedes at the Father''s right hand.'
  FROM cross_reference_threads t, cross_references x, _session250_en40_lookup sv, _session250_en40_lookup tv
 WHERE t.slug='1-enoch-40-third-voice-intercession'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=40 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-40-four-archangels-named
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* Daniel names Michael the prince who stands for the people — the merciful, long-suffering first presence of Enoch 40:9.'
  FROM cross_reference_threads t, cross_references x, _session250_en40_lookup sv, _session250_en40_lookup tv
 WHERE t.slug='1-enoch-40-four-archangels-named'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=40 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jude 1:9 — *Yet Michael the archangel, when contending with the devil he disputed about the body of Moses, durst not bring against him a railing accusation, but said, Yahuah (Lord) rebuke thee.* Jude names Michael the archangel who leaves the rebuke to the Yahuah — the long-suffering first presence whose voice blesses in Enoch 40:9.'
  FROM cross_reference_threads t, cross_references x, _session250_en40_lookup sv, _session250_en40_lookup tv
 WHERE t.slug='1-enoch-40-four-archangels-named'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=40 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Tobit 12:15 — *I am Raphael, one of the seven holy angels, which present the prayers of the saints, and which go in and out before the glory of the Holy One.* Tobit names Raphael the healer-angel who bears the saints'' prayers — the second presence set over all sickness and all wounds in Enoch 40:9.'
  FROM cross_reference_threads t, cross_references x, _session250_en40_lookup sv, _session250_en40_lookup tv
 WHERE t.slug='1-enoch-40-four-archangels-named'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=40 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=12 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 2:2 — *For on the first day He created the heavens which are above and the earth and the waters and all the spirits which serve before Him–the angels of the presence, and the angels of sanctification ... and the angels of the spirit of the winds, and the angels of the spirit of the clouds, and of darkness, and of snow and of hail and of hoar frost ...* Jubilees records the same ranked angels of the presence set over the works of creation that Enoch names and assigns at 40:9.'
  FROM cross_reference_threads t, cross_references x, _session250_en40_lookup sv, _session250_en40_lookup tv
 WHERE t.slug='1-enoch-40-four-archangels-named'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=40 AND sv.verse_number=9
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-40-secrets-revealed-to-elect
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 38:22 — *Hast thou entered into the treasures of the snow? or hast thou seen the treasures of the hail,* the very storehouses of the winds and weather Enoch says shall be opened to the righteous at 40:21 are the treasuries the Yahuah questions Job about.'
  FROM cross_reference_threads t, cross_references x, _session250_en40_lookup sv, _session250_en40_lookup tv
 WHERE t.slug='1-enoch-40-secrets-revealed-to-elect'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=40 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 2:22 — *He revealeth the deep and secret things: he knoweth what is in the darkness, and the light dwelleth with him.* Daniel names the One who reveals the deep and secret things — the unsealing of the secrets of thunder, winds, and the luminaries promised in Enoch 40:13.'
  FROM cross_reference_threads t, cross_references x, _session250_en40_lookup sv, _session250_en40_lookup tv
 WHERE t.slug='1-enoch-40-secrets-revealed-to-elect'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=40 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 46:3 — *This is the Son of Adam who hath righteousness, with whom dwelleth righteousness, and who revealeth all the treasures of that which is hidden, because Yahuah (God) of Spirits hath chosen him ...* The Similitudes name the Elect One as the One through whom the hidden treasures of 40:13 are revealed to the righteous and elect.'
  FROM cross_reference_threads t, cross_references x, _session250_en40_lookup sv, _session250_en40_lookup tv
 WHERE t.slug='1-enoch-40-secrets-revealed-to-elect'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=40 AND sv.verse_number=13
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=46 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 10:26 — *Fear them not therefore: for there is nothing covered, that shall not be revealed; and hid, that shall not be known.* Yahusha''s promise that every hidden thing shall be uncovered is the unsealing of the secrets to the righteous and elect at 40:17.'
  FROM cross_reference_threads t, cross_references x, _session250_en40_lookup sv, _session250_en40_lookup tv
 WHERE t.slug='1-enoch-40-secrets-revealed-to-elect'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=40 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Corinthians 2:10 — *But Elohim (God) hath revealed them unto us by his Spirit: for the Spirit searcheth all things, yea, the deep things of Elohim (God).* The Spirit who searches the deep things and discloses them to those who love Him is the unveiling of the secrets of the deep and of Sheol to the righteous and elect at 40:24.'
  FROM cross_reference_threads t, cross_references x, _session250_en40_lookup sv, _session250_en40_lookup tv
 WHERE t.slug='1-enoch-40-secrets-revealed-to-elect'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=40 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

