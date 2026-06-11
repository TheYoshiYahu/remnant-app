-- S227 enrichment — Revelation 12: the woman & dragon (travail of Zion, wilderness, the remnant)
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: the-woman-clothed-with-the-sun-the-travail-of-zion — add Isaiah 26:17-18 (the daughter of Zion in her pangs)
  ('canon','revelation',12,2,'canon','isaiah',26,17,'free', E'*Like as a woman with child, that draweth near the time of her delivery, is in pain, and crieth out in her pangs; so have we been in thy sight, O Yahuah (LORD).* (Isaiah 26:17). The woman *cried, travailing in birth, and pained to be delivered* (Revelation 12:2) is the travailing daughter of Zion the prophets drew long before — Isaiah''s own confession of the covenant people in her pangs before Yahuah (LORD), the nation labouring under affliction. The figure is no new thing: it is Yashar''el (Israel) in her sorrow, the woman in pain in the sight of her Elohim (God).'),
  ('canon','revelation',12,2,'canon','isaiah',26,18,'free', E'*We have been with child, we have been in pain, we have as it were brought forth wind; we have not wrought any deliverance in the earth; neither have the inhabitants of the world fallen.* (Isaiah 26:18). Isaiah''s travail brought forth only wind — pangs without deliverance, the old age''s labour that could not save itself. The woman of the vision travails the same travail (Revelation 12:2), but now the deliverance the prophet longed for and could not work is wrought: she *brought forth a man child* (Revelation 12:5), and the barren labour of Yashar''el (Israel) at last bears the seed of promise.'),

  -- thread: that-old-serpent-cast-down — add 1 Enoch 88 (the fallen star bound and cast into the abyss)
  ('canon','revelation',12,9,'enoch','1-enoch',88,1,'extras', E'*And I saw one of those four who had come forth first, and he seized that first star which had fallen from the heaven, and bound it hand and foot and cast it into an abyss: now that abyss was narrow and deep, and horrible and dark.* (1 Enoch 88:1). The restored library saw the casting-down before John named it: the fallen star — the chief of the rebels — *seized... bound... and cast... into an abyss.* When *the great dragon was cast out... he was cast out into the earth* (Revelation 12:9), it is the same old expulsion the seer of Enoch beheld, the rebel hurled down from heaven; and his binding in the narrow and dark abyss is the very chaining John sees completed when the dragon is *bound... a thousand years* (Revelation 20:2).'),
  ('canon','revelation',12,9,'enoch','1-enoch',88,3,'extras', E'*And as I was beholding in the vision, lo, one of those four who had come forth stoned (them) from heaven, and gathered and took all the great stars whose privy members were like those of horses, and bound them all hand and foot, and cast them in an abyss of the earth.* (1 Enoch 88:3). The rebel stars are *bound... hand and foot, and cast... in an abyss of the earth* — and with the dragon *his angels were cast out with him* (Revelation 12:9). The casting-down is no solitary fall but the whole company of the rebels hurled from heaven to the earth and the abyss, exactly the throwing-out of the dragon and his angels the vision shows; the library bears one witness to the expulsion of the fallen.'),

  -- thread: two-wings-of-a-great-eagle-into-the-wilderness — add Numbers 16:30,32 (the earth opens her mouth)
  ('canon','revelation',12,16,'canon','numbers',16,30,'free', E'*But if Yahuah (LORD) make a new thing, and the earth open her mouth, and swallow them up, with all that appertain unto them, and they go down quick into the pit; then ye shall understand that these men have provoked Yahuah (LORD).* (Numbers 16:30). When the serpent casts the flood after the woman, *the earth helped the woman, and the earth opened her mouth, and swallowed up the flood* (Revelation 12:16). The earth opening her mouth to swallow is the sign Moses called for against Korah — *the earth open her mouth, and swallow them up* — Yahuah (LORD)''s own new thing, the ground itself made his instrument against those who war on his people. The same earth that swallowed the rebels swallows the serpent''s flood to deliver the woman.'),
  ('canon','revelation',12,16,'canon','numbers',16,32,'free', E'*And the earth opened her mouth, and swallowed them up, and their houses, and all the men that appertained unto Korah, and all their goods.* (Numbers 16:32). *The earth opened her mouth, and swallowed up the flood which the dragon cast out of his mouth* (Revelation 12:16) — the very deed wrought against Korah, *the earth opened her mouth, and swallowed them up.* The deliverance of the woman is no new wonder but the old wonder turned to her defence: the ground that opened to devour the enemies of Yahuah (LORD) opens again to devour the flood loosed against the woman and her seed.'),

  -- thread: the-remnant-which-keep-the-commandments — add Daniel 7:25 (the war on the saints and the law)
  ('canon','revelation',12,17,'canon','daniel',7,25,'free', E'*And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* (Daniel 7:25). The dragon *went to make war with the remnant of her seed, which keep the commandments of Elohim (God)* (Revelation 12:17) — and Daniel had named the shape of that war: the power that wars on the saints is the power that *think[s] to change times and laws.* The assault on the commandment-keepers and the assault on the commandments are one assault; the dragon makes war on the woman''s seed precisely because they hold fast the times and laws he would overthrow.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s227_rev_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s227_rev_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---- member rows ----
-- the-woman-clothed-with-the-sun-the-travail-of-zion-genesis-37
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Isaiah 26:17 — *Like as a woman with child... is in pain, and crieth out in her pangs; so have we been in thy sight, O Yahuah (LORD)* the travailing daughter of Zion; the woman''s birth-pangs are Yashar''el (Israel) in her sorrow before her Elohim (God) (Revelation 12:2).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-12-the-woman-clothed-with-the-sun-the-travail-of-zion-genesis-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Isaiah 26:18 — *we have been in pain, we have as it were brought forth wind; we have not wrought any deliverance* the old age''s barren travail; the woman''s pangs now bear the deliverance Isaiah longed for and could not work (Revelation 12:2).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-12-the-woman-clothed-with-the-sun-the-travail-of-zion-genesis-37'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- that-old-serpent-the-devil-and-satan-cast-down-genesis-3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'1 Enoch 88:1 — *he seized that first star which had fallen from the heaven, and bound it hand and foot and cast it into an abyss* the restored library''s casting-down of the chief rebel; the same expulsion as the dragon cast out into the earth (Revelation 12:9).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-12-that-old-serpent-the-devil-and-satan-cast-down-genesis-3'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=88 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'1 Enoch 88:3 — *bound them all hand and foot, and cast them in an abyss of the earth* the whole company of rebel stars hurled down; with the dragon his angels were cast out with him (Revelation 12:9).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-12-that-old-serpent-the-devil-and-satan-cast-down-genesis-3'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=88 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- two-wings-of-a-great-eagle-into-the-wilderness-nourished-exodus-19
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Numbers 16:30 — *the earth open her mouth, and swallow them up... they go down quick into the pit* the sign Moses called against Korah; the earth made Yahuah (LORD)''s instrument, as it swallows the serpent''s flood (Revelation 12:16).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-12-two-wings-of-a-great-eagle-into-the-wilderness-nourished-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=16 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 22, E'Numbers 16:32 — *the earth opened her mouth, and swallowed them up... all the men that appertained unto Korah* the old wonder turned to the woman''s defence; the ground opens again to devour the flood loosed against her (Revelation 12:16).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-12-two-wings-of-a-great-eagle-into-the-wilderness-nourished-exodus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=16 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- the-remnant-which-keep-the-commandments-of-elohim-malachi-4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 21, E'Daniel 7:25 — *shall wear out the saints of the El Elyon (most High), and think to change times and laws* the war on the saints is the war on the law; the dragon makes war on the seed because they keep the commandments he would overthrow (Revelation 12:17).'
  FROM cross_reference_threads t, cross_references x, _s227_rev_lookup sv, _s227_rev_lookup tv
 WHERE t.slug='revelation-12-the-remnant-which-keep-the-commandments-of-elohim-malachi-4'
   AND sv.edition_slug='canon' AND sv.book_slug='revelation' AND sv.chapter_number=12 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
