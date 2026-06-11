-- S227 enrichment — Revelation 19: the great Alleluia, the marriage, the angel refuses worship, the supper on Gog, the beast cast into fire
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- great-alleluia: add Jeremiah's heaven-sings-over-Babylon (prophetic)
  ('canon','revelation',19,3,'canon','jeremiah',51,48,'free', E'*Then the heaven and the earth, and all that is therein, shall sing for Babylon: for the spoilers shall come unto her from the north, saith Yahuah (LORD).* (Jeremiah 51:48). The four Alleluias of heaven are sung over the smoke of the great whore rising for ever (Revelation 19:3); Jeremiah foretold the very thing — that heaven and earth would sing *for Babylon* when her spoilers came. The doom of the harlot-city is the appointed occasion of the song; the seer hears arrive the praise the prophet promised would break out over Babylon''s fall.'),

  -- marriage-of-the-lamb: add Hosea 2:20 + Isaiah 62:5 (prophetic), 2 Esdras 2:39-40 (extra)
  ('canon','revelation',19,7,'canon','hosea',2,20,'free', E'*I will even betroth thee unto me in faithfulness: and thou shalt know Yahuah (LORD).* (Hosea 2:20). The wife who *hath made herself ready* (Revelation 19:7) is the harlot of Hosea wooed home and betrothed *in faithfulness* — she who had played the harlot is taken back, and the knowing of Yahuah (LORD) is restored. The marriage of the Lamb is this betrothal consummated: Israel, not a stranger-people, brought back to her husband.'),
  ('canon','revelation',19,7,'canon','isaiah',62,5,'free', E'*and as the bridegroom rejoiceth over the bride, so shall thy Elohim (God) rejoice over thee.* (Isaiah 62:5). Heaven calls to *give honour to him: for the marriage of the Lamb is come* (Revelation 19:7); Isaiah had already named the joy of that wedding — thy Elohim (God) rejoicing over thee as a bridegroom over his bride. The forsaken wife is married again, and the rejoicing the prophet foresaw is the gladness of the marriage supper.'),
  ('canon','revelation',19,8,'apocrypha','2-esdras',2,40,'extras', E'*Take your number, O Sion, and shut up those of yours that are clothed in white, which have fulfilled the law of Yahuah (God).* (2 Esdras 2:40). The Bride is *arrayed in fine linen, clean and white: for the fine linen is the righteousness of saints* (Revelation 19:8). The restored library names the same company — Sion''s own, *clothed in white, which have fulfilled the law*: the white raiment is the righteousness of the law-keepers, the commandment-keeping saints, not a garment woven apart from Torah.'),

  -- worship-elohim, the angel refuses (P=0,E=0): Tobit 12 + Ascension of Isaiah (extras)
  ('canon','revelation',19,10,'apocrypha','tobit',12,18,'extras', E'*For not of any favour of mine, but by the will of our Elohim (God) I came; wherefore praise him for ever.* (Tobit 12:18). When John falls to worship the angel, the answer is, *See thou do it not: I am thy fellowservant... worship Elohim (God)* (Revelation 19:10). Raphael had spoken the same refusal to Tobit and Tobias when they fell on their faces in fear — deflecting all honour from himself to the One: *praise him for ever.* The mighty angel of the apocalypse keeps the angel''s ancient rule: worship is the One''s alone.'),
  ('canon','revelation',19,10,'ascension-isaiah','ascension-isaiah',7,21,'extras', E'*And I fell on my face to worship him, but the angel who conducted me did not permit me, but said unto me: "Worship neither throne nor angel..."* (Ascension of Isaiah 7:21). John''s very gesture — *I fell at his feet to worship him* (Revelation 19:10) — is Isaiah''s in his ascent, and the angel''s refusal is the same: he will not permit the worship, for *I am not thy lord, but thy fellow servant* (Ascension of Isaiah 8:5). Throughout the apocalyptic seers the rule holds unbroken: the conducting angel forbids the worship and turns it back to the One.'),

  -- beast-and-false-prophet cast into the lake of fire (Daniel 7 only): 1 Enoch (extras)
  ('canon','revelation',19,20,'enoch','1-enoch',54,6,'extras', E'*...take hold of them on that great day, and cast them on that day into the burning furnace, that Yahuah (God) of Spirits may take vengeance on them...* (1 Enoch 54:6). The beast and the false prophet are *cast alive into a lake of fire burning with brimstone* (Revelation 19:20). Enoch saw the same end for the chiefs of the rebellion — the holy angels casting them on the great day *into the burning furnace*, the deep valley of fire prepared for the hosts of the adversary. The lake of fire of the apocalypse is the burning furnace of the watcher-judgment come at last.'),
  ('canon','revelation',19,20,'enoch','1-enoch',10,6,'extras', E'*And on the day of the great judgement he shall be cast into the fire.* (1 Enoch 10:6). The two beasts are taken and *cast alive into a lake of fire* (Revelation 19:20); Enoch''s oldest oracle of judgment decreed it of the chief of the watchers — bound now, *cast into the fire* at the great judgment. The fate Revelation gives the beast is the fate the Hebrew library long assigned the head of the rebellion.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---- member rows ----
-- great-alleluia
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Jeremiah 51:48 — *the heaven and the earth... shall sing for Babylon* the prophet''s heaven singing over Babylon''s fall, the Alleluias raised over the smoke of the great whore (Revelation 19:3).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-19-the-great-alleluia-hallelu-yah-salvation-unto-yahuah-psalm-104-and-106'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=19 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=51 AND tv.verse_number=48
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- marriage-of-the-lamb
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Hosea 2:20 — *I will even betroth thee unto me in faithfulness: and thou shalt know Yahuah (LORD)* the harlot wooed home and betrothed, the wife of the Lamb made ready (Revelation 19:7).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-19-the-marriage-of-the-lamb-the-bride-in-fine-linen-isaiah-61-and-54-and-hosea-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=19 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Isaiah 62:5 — *as the bridegroom rejoiceth over the bride, so shall thy Elohim (God) rejoice over thee* the joy of the wedding foretold, the gladness over the marriage of the Lamb (Revelation 19:7).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-19-the-marriage-of-the-lamb-the-bride-in-fine-linen-isaiah-61-and-54-and-hosea-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=19 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=62 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 23, E'2 Esdras 2:40 — *shut up those of yours that are clothed in white, which have fulfilled the law of Yahuah (God)* the restored library''s white-clad law-keepers, the fine linen that is the righteousness of saints (Revelation 19:8).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-19-the-marriage-of-the-lamb-the-bride-in-fine-linen-isaiah-61-and-54-and-hosea-2'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=19 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=2 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- worship-elohim, the angel refuses worship
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Tobit 12:18 — *not of any favour of mine, but by the will of our Elohim (God) I came; wherefore praise him for ever* Raphael deflecting all honour to the One, as the angel refuses John''s worship — *worship Elohim (God)* (Revelation 19:10).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-19-worship-elohim-the-angel-refuses-worship-exodus-34-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=19 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=12 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Ascension of Isaiah 7:21 — *I fell on my face to worship him, but the angel... did not permit me* Isaiah''s seer-gesture and the angel''s same refusal, *I am not thy lord, but thy fellow servant* (Revelation 19:10).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-19-worship-elohim-the-angel-refuses-worship-exodus-34-deuteronomy-6'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=19 AND sv.verse_number=10
   AND tv.edition_slug='ascension-isaiah' AND tv.book_slug='ascension-isaiah' AND tv.chapter_number=7 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- beast-and-false-prophet cast into the lake of fire
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'1 Enoch 54:6 — *cast them... into the burning furnace, that Yahuah (God) of Spirits may take vengeance on them* the chiefs of the rebellion cast into the valley of fire, the beast and false prophet cast into the lake of fire (Revelation 19:20).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-19-the-beast-and-false-prophet-cast-into-the-lake-of-fire-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=19 AND sv.verse_number=20
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=54 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'1 Enoch 10:6 — *on the day of the great judgement he shall be cast into the fire* the oldest decree of the watcher-judgment, the fate given the beast cast alive into the lake of fire (Revelation 19:20).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-19-the-beast-and-false-prophet-cast-into-the-lake-of-fire-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=19 AND sv.verse_number=20
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
