-- ----- fragment: minion_psalms_40_newsong_repair.sql (Psalm 40 new-song repair) -----
-- REPAIR: the thread psalm-40-he-brought-me-up-out-of-the-horrible-pit-a-new-song was created
-- member-less by a prior minion ("anchor-prose, kept LIGHT"), leaving an empty thread. This adds
-- 4 members to vv.1-3 (the deliverance from the pit + the new song), sealing Psalms at 0 empty.
-- Idempotent (ON CONFLICT DO NOTHING). Thread already exists; only cross_references + members added.

CREATE TEMP VIEW _s302_ps40fix_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    ('canon','psalms',40,2,'canon','psalms',30,3,'free',
      E'*O Yahuah (LORD), thou hast brought up my soul from the grave: thou hast kept me alive, that I should not go down to the pit.* (Psalm 30:3) — *He brought me up also out of an horrible pit, out of the miry clay* (Psalm 40:2). The same deliverance: lifted out of the pit, kept from going down to the grave — a figure of resurrection, the soul brought up from death itself.'),
    ('canon','psalms',40,2,'canon','psalms',27,5,'free',
      E'*…in the secret of his tabernacle shall he hide me; he shall set me up upon a rock.* (Psalm 27:5) — *and set my feet upon a rock, and established my goings* (Psalm 40:2). The one drawn out of the miry clay is set upon the Rock; the unsure footing of the pit is exchanged for the sure standing of the Rock that is the Formed One (the Rock, 1 Corinthians 10:4).'),
    ('canon','psalms',40,3,'canon','psalms',33,3,'free',
      E'*Sing unto him a new song; play skilfully with a loud noise.* (Psalm 33:3) — *And he hath put a new song in my mouth, even praise unto our Elohim (God)* (Psalm 40:3). The deliverance gives a new song: the rescued mouth answers with the very song the whole Psalter calls for, the new song of those who have seen his salvation.'),
    ('canon','psalms',40,3,'canon','revelation',5,9,'free',
      E'*And they sung a new song, saying, Thou art worthy to take the book, and to open the seals thereof: for thou wast slain, and hast redeemed us to Elohim (God) by thy blood out of every kindred, and tongue, and people, and nation* (Revelation 5:9) — the *new song* (Psalm 40:3) finds its consummation in the song of the redeemed before the throne: the new song of those bought by the blood, the deliverance from the pit fulfilled in the redemption of the slain Lamb.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps40fix_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps40fix_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*…thou hast brought up my soul from the grave* (Psalm 30:3) — the same deliverance from the pit, a resurrection figure.'
  FROM cross_reference_threads t
  JOIN _s302_ps40fix_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=40 AND sv.verse_number=2
  JOIN _s302_ps40fix_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=30 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-40-he-brought-me-up-out-of-the-horrible-pit-a-new-song'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*…he shall set me up upon a rock* (Psalm 27:5) — the miry clay exchanged for the sure standing of the Rock.'
  FROM cross_reference_threads t
  JOIN _s302_ps40fix_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=40 AND sv.verse_number=2
  JOIN _s302_ps40fix_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=27 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-40-he-brought-me-up-out-of-the-horrible-pit-a-new-song'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Sing unto him a new song* (Psalm 33:3) — the rescued mouth answers with the song the whole Psalter calls for.'
  FROM cross_reference_threads t
  JOIN _s302_ps40fix_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=40 AND sv.verse_number=3
  JOIN _s302_ps40fix_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-40-he-brought-me-up-out-of-the-horrible-pit-a-new-song'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*And they sung a new song… for thou wast slain, and hast redeemed us* (Revelation 5:9) — the new song consummated in the song of the redeemed before the throne.'
  FROM cross_reference_threads t
  JOIN _s302_ps40fix_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=40 AND sv.verse_number=3
  JOIN _s302_ps40fix_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-40-he-brought-me-up-out-of-the-horrible-pit-a-new-song'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
