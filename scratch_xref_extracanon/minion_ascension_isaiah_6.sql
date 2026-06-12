-- ----- fragment: minion_ascensionisaiah_06.sql (session403 ascension-isaiah 6) -----
-- Source anchor: ascension-isaiah/ascension-isaiah ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: asci6 (view _session403_asci6_lookup). Sort band base 67625, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session403_asci6_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ascension-isaiah-6-a-door-opened-in-heaven
  ('ascension-isaiah', 'ascension-isaiah', 6, 6, 'canon', 'revelation', 4, 1, 'free', E'Revelation 4:1 — *After this I looked, and, behold, a door was opened in heaven: and the first voice which I heard was as it were of a trumpet talking with me; which said, Come up hither, and I will shew thee things which must be hereafter.* The same opened door of heaven and the same summoning voice that Isaiah''s hearers heard at 6:6.'),
  ('ascension-isaiah', 'ascension-isaiah', 6, 6, 'canon', '2-corinthians', 12, 2, 'free', E'2 Corinthians 12:2 — *I knew a man in Messiah (Christ) above fourteen years ago, (whether in the body, I cannot tell; or whether out of the body, I cannot tell: Elohim (God) knoweth;) such an one caught up to the third heaven.* Paul, like Isaiah, is carried through the opened door into the heavens — body or no body, the Most High knoweth.'),
  ('ascension-isaiah', 'ascension-isaiah', 6, 8, 'canon', 'revelation', 4, 8, 'free', E'Revelation 4:8 — *And the four beasts had each of them six wings about him; and they were full of eyes within: and they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come.* The worship the prophets render the Most High at 6:8 is the unceasing worship of heaven before the throne.'),
  -- thread: ascension-isaiah-6-mind-taken-up-the-vision-trance
  ('ascension-isaiah', 'ascension-isaiah', 6, 10, 'canon', '2-corinthians', 12, 3, 'free', E'2 Corinthians 12:3 — *And I knew such a man, (whether in the body, or out of the body, I cannot tell: Elohim (God) knoweth;)* Paul''s not-knowing whether body or spirit matches Isaiah''s mind being taken up while his breath remained (6:10, 6:12).'),
  ('ascension-isaiah', 'ascension-isaiah', 6, 12, 'canon', '2-corinthians', 12, 4, 'free', E'2 Corinthians 12:4 — *How that he was caught up into paradise, and heard unspeakable words, which it is not lawful for a man to utter.* The vision Isaiah saw, hidden from the flesh (6:15), is the same caught-up sight of things unspeakable.'),
  ('ascension-isaiah', 'ascension-isaiah', 6, 15, 'canon', 'numbers', 12, 6, 'free', E'Numbers 12:6 — *And he said, Hear now my words: If there be a prophet among you, I Yahuah (LORD) will make myself known unto him in a vision, and will speak unto him in a dream.* The vision not from this world but hidden from the flesh (6:15) is Yahuah''s own appointed way of making Himself known to a true prophet.'),
  -- thread: ascension-isaiah-6-the-angel-from-the-seventh-heaven
  ('ascension-isaiah', 'ascension-isaiah', 6, 13, 'canon', 'daniel', 7, 9, 'free', E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The seventh-heaven realm the angel comes from (6:13) is the throne-realm of the Ancient of days, the Father most high.'),
  ('ascension-isaiah', 'ascension-isaiah', 6, 13, 'enoch', '1-enoch', 14, 15, 'extras', E'1 Enoch 14:15 — *But the middle one reached to heaven, like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire.* Enoch''s ascent to the throne reaching to heaven is the elder pattern of Isaiah''s angel from the seventh heaven (6:13) — it ain''t new.'),
  ('ascension-isaiah', 'ascension-isaiah', 6, 13, 'canon', 'revelation', 4, 2, 'free', E'Revelation 4:2 — *And immediately I was in the spirit: and, behold, a throne was set in heaven, and one sat on the throne.* John''s heavenly guide and throne mirror the seventh-heaven angel who makes Isaiah see (6:13).'),
  -- thread: ascension-isaiah-6-the-prophet-band-and-the-spirit
  ('ascension-isaiah', 'ascension-isaiah', 6, 5, 'canon', '1-samuel', 10, 6, 'free', E'1 Samuel 10:6 — *And the Spirit of Yahuah (LORD) will come upon thee, and thou shalt prophesy with them, and shalt be turned into another man.* The prophet-band prophesying under Isaiah''s hand (6:5) is the same Spirit-borne company Saul met.'),
  ('ascension-isaiah', 'ascension-isaiah', 6, 6, 'canon', 'acts', 2, 17, 'free', E'Acts 2:17 — *And it shall come to pass in the last days, saith Elohim (God), I will pour out of my Spirit upon all flesh: and your sons and your daughters shall prophesy, and your young men shall see visions, and your old men shall dream dreams.* The voice of the Ruach HaKodesh through the opened door (6:6) is the outpoured Spirit that makes sons and daughters prophesy.'),
  ('ascension-isaiah', 'ascension-isaiah', 6, 9, 'canon', 'amos', 3, 7, 'free', E'Amos 3:7 — *Surely Adonai Yahuah (the Lord GOD) will do nothing, but he revealeth his secret unto his servants the prophets.* The door bestowed in an alien world upon a man (6:9) is the secret Yahuah opens only to His servant-prophets.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session403_asci6_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session403_asci6_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-6-a-door-opened-in-heaven',
       E'A door opened, and the voice of the Spirit',
       E'As Isaiah speaks truth before Hezekiah, *they all heard a door which one had opened and the voice of the Ruach HaKodesh (Holy Spirit)* (Ascension of Isaiah 6:6). It ain''t new — the opened door of heaven is the same threshold John is called through: *After this I looked, and, behold, a door was opened in heaven: and the first voice which I heard was as it were of a trumpet talking with me; which said, Come up hither, and I will shew thee things which must be hereafter* (Revelation 4:1). Paul knew that door too, *caught up to the third heaven* (2 Corinthians 12:2). It opens not by a man''s will but by the Father''s, *the Most High who is in the upper world* (Ascension of Isaiah 6:8) — and the seer''s only posture is worship, as Yahudah''s prophets *worshipped on their knees, and glorified the Elohim (God) of truth* before the One on high.',
       sv.verse_id, ev.verse_id, 'extras', 67625
  FROM _session403_asci6_lookup sv, _session403_asci6_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=6 AND sv.verse_number=6
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=6 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-6-mind-taken-up-the-vision-trance',
       E'His mind taken up — the body left behind',
       E'When the Spirit fell, *he became silent and his mind was taken up from him and he saw not the men that stood before him* (Ascension of Isaiah 6:10), yet *his breath was in him; for he was seeing a vision* (Ascension of Isaiah 6:12). It ain''t new: the seer''s flesh is left behind while the inner man is carried, exactly Paul''s uncertainty — *whether in the body, or out of the body, I cannot tell: Elohim (God) knoweth* (2 Corinthians 12:3). This vision *was not from this world but from the world which is hidden from the flesh* (Ascension of Isaiah 6:15), for what is shown belongs to the realm Yahuah reserves for His prophets: *If there be a prophet among you, I Yahuah (LORD) will make myself known unto him in a vision* (Numbers 12:6).',
       sv.verse_id, ev.verse_id, 'extras', 67628
  FROM _session403_asci6_lookup sv, _session403_asci6_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=6 AND sv.verse_number=10
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=6 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-6-the-angel-from-the-seventh-heaven',
       E'The angel guide from the seventh heaven',
       E'The one who comes to lead Isaiah up is no earthly messenger: *the angel who was sent to make him see was not of this firmament, nor was he of the angels of glory of this world, but he had come from the seventh heaven* (Ascension of Isaiah 6:13). It ain''t new — the seer is always given a guide who descends from the throne-realm. Daniel beheld the heights where *the Ancient of days did sit, whose garment was white as snow* (Daniel 7:9), and Enoch before him was carried where *the middle one reached to heaven, like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire* (1 Enoch 14:15). The guide who carries the prophet through the heavens is the same office that escorts John through the opened door — and the throne he climbs toward is the Father''s, the Great Glory whom none can behold, the Most High under whom the Formed Son is ordered.',
       sv.verse_id, ev.verse_id, 'extras', 67631
  FROM _session403_asci6_lookup sv, _session403_asci6_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=6 AND sv.verse_number=13
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=6 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ascension-isaiah-6-the-prophet-band-and-the-spirit',
       E'The prophets gathered, the Spirit poured out',
       E'Forty prophets and sons of the prophets gather, *that he might place his hands upon them, and that they might prophesy* (Ascension of Isaiah 6:5). It ain''t new — this is the company Samuel knew, where *the Spirit of Yahuah (LORD) will come upon thee, and thou shalt prophesy with them, and shalt be turned into another man* (1 Samuel 10:6). And the door opened in Isaiah''s hearing is the same Spirit foretold by Joel and poured out at Pentecost: *I will pour out of my Spirit upon all flesh: and your sons and your daughters shall prophesy, and your young men shall see visions* (Acts 2:17). The Most High *revealeth his secret unto his servants the prophets* (Amos 3:7) — and so He bestowed *a door in an alien world* upon a man (Ascension of Isaiah 6:9).',
       sv.verse_id, ev.verse_id, 'extras', 67634
  FROM _session403_asci6_lookup sv, _session403_asci6_lookup ev
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=6 AND sv.verse_number=3
   AND ev.edition_slug='ascension-isaiah' AND ev.book_slug='ascension-isaiah' AND ev.chapter_number=6 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ascension-isaiah-6-a-door-opened-in-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 4:1 — *After this I looked, and, behold, a door was opened in heaven: and the first voice which I heard was as it were of a trumpet talking with me; which said, Come up hither, and I will shew thee things which must be hereafter.* The same opened door of heaven and the same summoning voice that Isaiah''s hearers heard at 6:6.'
  FROM cross_reference_threads t, cross_references x, _session403_asci6_lookup sv, _session403_asci6_lookup tv
 WHERE t.slug='ascension-isaiah-6-a-door-opened-in-heaven'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 12:2 — *I knew a man in Messiah (Christ) above fourteen years ago, (whether in the body, I cannot tell; or whether out of the body, I cannot tell: Elohim (God) knoweth;) such an one caught up to the third heaven.* Paul, like Isaiah, is carried through the opened door into the heavens — body or no body, the Most High knoweth.'
  FROM cross_reference_threads t, cross_references x, _session403_asci6_lookup sv, _session403_asci6_lookup tv
 WHERE t.slug='ascension-isaiah-6-a-door-opened-in-heaven'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 4:8 — *And the four beasts had each of them six wings about him; and they were full of eyes within: and they rest not day and night, saying, Holy, holy, holy, Yahuah Elohim (Lord God) Almighty, which was, and is, and is to come.* The worship the prophets render the Most High at 6:8 is the unceasing worship of heaven before the throne.'
  FROM cross_reference_threads t, cross_references x, _session403_asci6_lookup sv, _session403_asci6_lookup tv
 WHERE t.slug='ascension-isaiah-6-a-door-opened-in-heaven'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-6-mind-taken-up-the-vision-trance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 12:3 — *And I knew such a man, (whether in the body, or out of the body, I cannot tell: Elohim (God) knoweth;)* Paul''s not-knowing whether body or spirit matches Isaiah''s mind being taken up while his breath remained (6:10, 6:12).'
  FROM cross_reference_threads t, cross_references x, _session403_asci6_lookup sv, _session403_asci6_lookup tv
 WHERE t.slug='ascension-isaiah-6-mind-taken-up-the-vision-trance'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=6 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 12:4 — *How that he was caught up into paradise, and heard unspeakable words, which it is not lawful for a man to utter.* The vision Isaiah saw, hidden from the flesh (6:15), is the same caught-up sight of things unspeakable.'
  FROM cross_reference_threads t, cross_references x, _session403_asci6_lookup sv, _session403_asci6_lookup tv
 WHERE t.slug='ascension-isaiah-6-mind-taken-up-the-vision-trance'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=12 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 12:6 — *And he said, Hear now my words: If there be a prophet among you, I Yahuah (LORD) will make myself known unto him in a vision, and will speak unto him in a dream.* The vision not from this world but hidden from the flesh (6:15) is Yahuah''s own appointed way of making Himself known to a true prophet.'
  FROM cross_reference_threads t, cross_references x, _session403_asci6_lookup sv, _session403_asci6_lookup tv
 WHERE t.slug='ascension-isaiah-6-mind-taken-up-the-vision-trance'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=12 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-6-the-angel-from-the-seventh-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:9 — *I beheld till the thrones were cast down, and the Ancient of days did sit, whose garment was white as snow, and the hair of his head like the pure wool: his throne was like the fiery flame, and his wheels as burning fire.* The seventh-heaven realm the angel comes from (6:13) is the throne-realm of the Ancient of days, the Father most high.'
  FROM cross_reference_threads t, cross_references x, _session403_asci6_lookup sv, _session403_asci6_lookup tv
 WHERE t.slug='ascension-isaiah-6-the-angel-from-the-seventh-heaven'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=6 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 14:15 — *But the middle one reached to heaven, like the throne of Yahuah (God), of stibium, and the top of the throne was of sapphire.* Enoch''s ascent to the throne reaching to heaven is the elder pattern of Isaiah''s angel from the seventh heaven (6:13) — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session403_asci6_lookup sv, _session403_asci6_lookup tv
 WHERE t.slug='ascension-isaiah-6-the-angel-from-the-seventh-heaven'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=6 AND sv.verse_number=13
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=14 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 4:2 — *And immediately I was in the spirit: and, behold, a throne was set in heaven, and one sat on the throne.* John''s heavenly guide and throne mirror the seventh-heaven angel who makes Isaiah see (6:13).'
  FROM cross_reference_threads t, cross_references x, _session403_asci6_lookup sv, _session403_asci6_lookup tv
 WHERE t.slug='ascension-isaiah-6-the-angel-from-the-seventh-heaven'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=6 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ascension-isaiah-6-the-prophet-band-and-the-spirit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Samuel 10:6 — *And the Spirit of Yahuah (LORD) will come upon thee, and thou shalt prophesy with them, and shalt be turned into another man.* The prophet-band prophesying under Isaiah''s hand (6:5) is the same Spirit-borne company Saul met.'
  FROM cross_reference_threads t, cross_references x, _session403_asci6_lookup sv, _session403_asci6_lookup tv
 WHERE t.slug='ascension-isaiah-6-the-prophet-band-and-the-spirit'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 2:17 — *And it shall come to pass in the last days, saith Elohim (God), I will pour out of my Spirit upon all flesh: and your sons and your daughters shall prophesy, and your young men shall see visions, and your old men shall dream dreams.* The voice of the Ruach HaKodesh through the opened door (6:6) is the outpoured Spirit that makes sons and daughters prophesy.'
  FROM cross_reference_threads t, cross_references x, _session403_asci6_lookup sv, _session403_asci6_lookup tv
 WHERE t.slug='ascension-isaiah-6-the-prophet-band-and-the-spirit'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Amos 3:7 — *Surely Adonai Yahuah (the Lord GOD) will do nothing, but he revealeth his secret unto his servants the prophets.* The door bestowed in an alien world upon a man (6:9) is the secret Yahuah opens only to His servant-prophets.'
  FROM cross_reference_threads t, cross_references x, _session403_asci6_lookup sv, _session403_asci6_lookup tv
 WHERE t.slug='ascension-isaiah-6-the-prophet-band-and-the-spirit'
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

