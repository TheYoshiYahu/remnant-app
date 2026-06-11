-- S227 enrichment — Revelation 15: song of Moses & the Lamb; sanctuary opened; seven last plagues
-- ADD-ONLY. References shared view _s227_rev_lookup (defined by assembled migration).

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: song-of-moses-and-the-lamb
  ('canon','revelation',15,2,'canon','psalms',98,1,'free', E'*O sing unto Yahuah (LORD) a new song; for he hath done marvellous things: his right hand, and his holy arm, hath gotten him the victory.* (Psalm 98:1). The victors stand on the sea of glass having *gotten the victory over the beast* (Revelation 15:2), and the song they raise is this new song: the marvellous things done by his right hand, the holy arm that drowned Pharaoh and now overthrows the beast. *Great and marvellous are thy works* is the choir taking up the psalmist''s reason for the new song — the victory is his, not theirs, won by the arm of Yahuah (LORD).'),
  ('canon','revelation',15,2,'apocrypha','2-esdras',2,42,'extras', E'*I Esdras saw upon the mount Sion a great people, whom I could not number, and they all praised Yahuah (God) with songs.* (2 Esdras 2:42). The Hebrew library beheld the very scene: a numberless company on mount Sion *praised Yahuah (God) with songs*, and in their midst *a young man of a high stature, taller than all the rest... set crowns* upon them (2 Esdras 2:43). So the victors stand *on the sea of glass, having the harps of Elohim (God)* (Revelation 15:2) and sing — the redeemed gathered to praise, crowned by the exalted one who stands among them.'),
  -- thread: just-and-true-the-Rock
  ('canon','revelation',15,3,'canon','psalms',111,2,'free', E'*The works of Yahuah (LORD) are great, sought out of all them that have pleasure therein.* (Psalm 111:2). The song confesses *Great and marvellous are thy works, Yahuah Elohim (Lord God) Almighty* (Revelation 15:3) — the very praise of the psalm, *the works of Yahuah (LORD) are great.* The redeemed search out his works and find them great, and over the seven plagues about to fall they declare not fear but wonder, for every work of his is great and worthy to be sought out.'),
  ('canon','revelation',15,3,'canon','psalms',111,3,'free', E'*His work is honourable and glorious: and his righteousness endureth for ever.* (Psalm 111:3). *Just and true are thy ways, thou King of saints* (Revelation 15:3) is the song''s confession of the same righteousness the psalm names — *his righteousness endureth for ever.* As the witness-song of Moses called him the Rock whose work is perfect, so the psalm calls his work honourable and glorious; the redeemed sing that the judgments now poured out carry that everlasting righteousness, just and true in every way.'),
  -- thread: all-nations-shall-come-and-worship
  ('canon','revelation',15,4,'canon','isaiah',66,23,'free', E'*And it shall come to pass, that from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD).* (Isaiah 66:23). The song declares *all nations shall come and worship before thee* (Revelation 15:4), and Isaiah named the manner of that worship: *all flesh* coming *from one sabbath to another* to bow before him. The nations gathered are not loosed from his appointed times but keep them — new moon and sabbath — the Torah-honouring worship of the One who alone is holy.'),
  ('canon','revelation',15,4,'canon','jeremiah',16,19,'free', E'*O Yahuah (LORD), my strength, and my fortress... the Gentiles shall come unto thee from the ends of the earth, and shall say, Surely our fathers have inherited lies, vanity, and things wherein there is no profit.* (Jeremiah 16:19). Jeremiah foresaw the Gentiles coming *from the ends of the earth*, casting away the lies their fathers inherited. The song sees it manifest: *all nations shall come and worship before thee* (Revelation 15:4) — the nations turning from the idols that *cannot do evil, neither... good* to bow before the only One who is holy, the very turning home the prophet promised.'),
  -- thread: temple-of-the-tabernacle-of-the-testimony-opened
  ('canon','revelation',15,5,'canon','ezekiel',44,4,'free', E'*Then brought he me the way of the north gate before the house: and I looked, and, behold, the glory of Yahuah (LORD) filled the house of Yahuah (LORD): and I fell upon my face.* (Ezekiel 44:4). When the sanctuary opens, *the temple of the tabernacle of the testimony in heaven was opened* (Revelation 15:5). Ezekiel, brought to the opened house, saw *the glory of Yahuah (LORD) filled the house* and fell on his face — the same heavenly sanctuary, the glory filling it, of which Moses'' tent of testimony was the earthly copy.'),
  -- thread: temple-filled-with-smoke
  ('canon','revelation',15,8,'canon','ezekiel',10,4,'free', E'*Then the glory of Yahuah (LORD) went up from the cherub, and stood over the threshold of the house; and the house was filled with the cloud, and the court was full of the brightness of the LORD’S glory.* (Ezekiel 10:4). Ezekiel saw *the house... filled with the cloud* and the court full of the brightness of the glory. So *the temple was filled with smoke from the glory of Elohim (God), and from his power* (Revelation 15:8). The cloud of glory that filled the house in Ezekiel''s vision is the smoke that fills the heavenly temple — the visible weight of holiness no flesh can stand before.'),
  -- thread: seven-last-plagues-covenant-sanctions
  ('canon','revelation',15,1,'canon','leviticus',26,25,'free', E'*And I will bring a sword upon you, that shall avenge the quarrel of my covenant... I will send the pestilence among you; and ye shall be delivered into the hand of the enemy.* (Leviticus 26:25). The seven last plagues *fill up... the wrath of Elohim (God)* (Revelation 15:1), and the covenant set out that very wrath — *seven times* (Leviticus 26:24) the sword *that shall avenge the quarrel of my covenant*, with pestilence behind it. The bowls are no novelty but the covenant''s own avenging sanction, sworn at Sinai, filled up at the last upon the kingdom of the beast.'),
  ('canon','revelation',15,1,'canon','ezekiel',5,12,'free', E'*A third part of thee shall die with the pestilence, and with famine shall they be consumed... and a third part shall fall by the sword round about thee; and I will scatter a third part into all the winds...* (Ezekiel 5:12). Ezekiel poured out the covenant sanctions in measured thirds — pestilence, famine, sword, scattering. The seven angels carry that same measured judgment to its sevenfold fullness: *seven angels having the seven last plagues; for in them is filled up the wrath of Elohim (God)* (Revelation 15:1). The prophet''s portioned wrath is the bowls'' wrath filled up and final.'),
  ('canon','revelation',15,1,'canon','amos',4,10,'free', E'*I have sent among you the pestilence after the manner of Egypt: your young men have I slain with the sword... yet have ye not returned unto me, saith Yahuah (LORD).* (Amos 4:10). Amos named the covenant plagues *after the manner of Egypt*, sent again and again on a people that would not return. The seven last plagues are that same Egypt-wrath brought to its end — *filled up* upon men who, like Amos''s hearers, *repented not* (Revelation 16:9,11). The pestilence after the manner of Egypt is poured out a final time on the new Egypt that will not turn.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- thread members -----
-- song-of-moses-and-the-lamb
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Psalm 98:1 — *O sing unto Yahuah (LORD) a new song; for he hath done marvellous things: his right hand, and his holy arm, hath gotten him the victory* the victors who *gotten the victory over the beast* take up the new song; the marvellous works are his, the victory his (Revelation 15:2-3).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-15-the-song-of-moses-and-the-lamb-the-new-exodus-sung-in-the-old-exodus-words-exodus-15'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=98 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'2 Esdras 2:42 — *upon the mount Sion a great people, whom I could not number, and they all praised Yahuah (God) with songs* the Hebrew library beholds the numberless company singing on Sion, the exalted young man crowning them, the posture of the victors with the harps (Revelation 15:2).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-15-the-song-of-moses-and-the-lamb-the-new-exodus-sung-in-the-old-exodus-words-exodus-15'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=2 AND tv.verse_number=42
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- just-and-true-the-Rock
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Psalm 111:2 — *The works of Yahuah (LORD) are great, sought out of all them that have pleasure therein* the redeemed search out his works and find them great; *great and marvellous are thy works* (Revelation 15:3).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-15-just-and-true-are-thy-ways-the-rock-whose-work-is-perfect-deuteronomy-32'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=111 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Psalm 111:3 — *His work is honourable and glorious: and his righteousness endureth for ever* the everlasting righteousness the song confesses, *just and true are thy ways* (Revelation 15:3).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-15-just-and-true-are-thy-ways-the-rock-whose-work-is-perfect-deuteronomy-32'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=111 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- all-nations-shall-come-and-worship
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 66:23 — *from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me* the manner of the nations'' worship: keeping his appointed times; *all nations shall come and worship before thee* (Revelation 15:4).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-15-all-nations-shall-come-and-worship-before-thee-psalm-86-jeremiah-10'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=15 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Jeremiah 16:19 — *the Gentiles shall come unto thee from the ends of the earth, and shall say, Surely our fathers have inherited lies* the nations turning from inherited idols to the only Holy One; *all nations shall come and worship before thee* (Revelation 15:4).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-15-all-nations-shall-come-and-worship-before-thee-psalm-86-jeremiah-10'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=15 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=16 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- temple-of-the-tabernacle-of-the-testimony-opened
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Ezekiel 44:4 — *the glory of Yahuah (LORD) filled the house of Yahuah (LORD): and I fell upon my face* the prophet at the opened house sees the glory fill it; *the temple of the tabernacle of the testimony in heaven was opened* (Revelation 15:5).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-15-the-temple-of-the-tabernacle-of-the-testimony-opened-the-heavenly-pattern-exodus-38'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=15 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=44 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- temple-filled-with-smoke
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Ezekiel 10:4 — *the house was filled with the cloud, and the court was full of the brightness of the LORD’S glory* the cloud of glory that fills the house; *the temple was filled with smoke from the glory of Elohim (God)* (Revelation 15:8).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-15-the-temple-filled-with-smoke-from-the-glory-none-able-to-enter-exodus-40-isaiah-6'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=15 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- seven-last-plagues-covenant-sanctions
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Leviticus 26:25 — *a sword upon you, that shall avenge the quarrel of my covenant... I will send the pestilence among you* the covenant''s avenging sword and pestilence, *seven times* (26:24); the seven last plagues fill up that wrath (Revelation 15:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-15-the-seven-last-plagues-the-covenant-sanctions-poured-out-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Ezekiel 5:12 — *A third part of thee shall die with the pestilence... and a third part shall fall by the sword... and I will scatter a third part into all the winds* the prophet pours out the covenant sanctions in measured portions; the seven last plagues bring that wrath to sevenfold fullness (Revelation 15:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-15-the-seven-last-plagues-the-covenant-sanctions-poured-out-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'Amos 4:10 — *I have sent among you the pestilence after the manner of Egypt... yet have ye not returned unto me* the covenant plagues after the manner of Egypt on a people that would not turn; the seven last plagues fill up that wrath on the new Egypt (Revelation 15:1).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-15-the-seven-last-plagues-the-covenant-sanctions-poured-out-leviticus-26'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=4 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
