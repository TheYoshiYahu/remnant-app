-- ----- fragment: minion_exodus_8.sql (Exodus 8) -----
-- Exodus 8 — the plagues of frogs, lice, and flies; "this is the finger of Elohim";
--   Yahuah sets a division between Egypt and his people. Tag: ex08. Session: s305.
--   Sort band base 29175 (step 3): 29175, 29178, 29181.
--
-- Exodus 8 coverage:
--   v.1-4 (frogs decreed)  NT:     Revelation 16:13-14 (three unclean spirits like frogs)
--                          Extras: none warranted
--                          Tanakh: Psalm 78:45 / Psalm 105:30 (the plague resung)
--   v.5-7 (frogs come up)  NT:     Revelation 16:13-14 (same thread)
--                          Extras: none warranted
--                          Tanakh: Psalm 105:30 (same thread)
--   v.8-14 (frogs removed) NT:     none warranted (narrative of relief/hardening)
--                          Extras: none warranted
--                          Tanakh: none warranted
--   v.15 (heart hardened)  NT:     none warranted (recurs; framed in thread prose)
--                          Extras: none warranted
--                          Tanakh: none warranted
--   v.16-17 (lice)         NT:     Luke 11:20 (same thread — the finger of Elohim)
--                          Extras: none warranted
--                          Tanakh: none warranted
--   v.18-19 (finger of El) NT:     Luke 11:20 (the finger of Elohim casts out devils)
--                          Extras: none warranted
--                          Tanakh: none warranted
--   v.20-21 (flies sent)   NT:     none warranted (carried into division thread)
--                          Extras: Wisdom of Solomon 16:9 (flies that killed the enemy)
--                          Tanakh: Psalm 78:45 (divers sorts of flies devoured them)
--   v.22-23 (the division) NT:     Romans 9:4 (the adoption pertains to Yashar'el)
--                          Extras: Wisdom of Solomon 16:9 (the measured recompense)
--                          Tanakh: Exodus 11:7 / Malachi 3:18 (Yahuah severs his own)
--   v.24-32 (flies/hardening) NT:  none warranted
--                          Extras: none warranted
--                          Tanakh: none warranted
--
-- Threads:
--   exodus-8-the-river-shall-bring-forth-frogs-abundantly (29175, free)
--     targets: Revelation (NT, forward), Psalms x2 (Tanakh, lateral)
--   exodus-8-this-is-the-finger-of-elohim (29178, free)
--     targets: Luke (NT, forward)
--   exodus-8-i-will-put-a-division-between-my-people-and-thy-people (29181, extras)
--     targets: Psalms (Tanakh), Exodus 11 (Tanakh), Malachi (Tanakh), Romans (NT),
--              Wisdom of Solomon (extras)
--   Contested/load-bearing: 8:22-23 the division is Yahuah's redemptive distinction UPON
--     his covenant people (the two-house people set apart) — framed as setting-apart, never
--     replacement; Romans 9:4 keeps the adoption with Yashar'el.

CREATE TEMP VIEW _s305_ex08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: the river shall bring forth frogs abundantly
    ('canon','exodus',8,3,'canon','revelation',16,13,'free',
     E'*And I saw three unclean spirits like frogs come out of the mouth of the dragon, and out of the mouth of the beast, and out of the mouth of the false prophet* (Revelation 16:13). The frogs Yahuah (LORD) loosed on Egypt — *the river shall bring forth frogs abundantly, which shall go up and come into thine house, and into thy bedchamber* (Exodus 8:3) — are taken up at the last as the very image of the demonic deception that swarms out upon the kings of the earth. The plague that filled Pharaoh''s house becomes the spirits that fill the whole world.'),
    ('canon','exodus',8,3,'canon','revelation',16,14,'free',
     E'*For they are the spirits of devils, working miracles, which go forth unto the kings of the earth and of the whole world, to gather them to the battle of that great day of El Shaddai (God Almighty)* (Revelation 16:14). The frog that came up *into thine ovens, and into thy kneadingtroughs* (Exodus 8:3) is no random vermin: the end-time deception wears the frog''s face, and like Pharaoh''s magicians it works counterfeit miracles to harden the rulers against Yahuah (LORD).'),
    ('canon','exodus',8,6,'canon','psalms',105,30,'free',
     E'*Their land brought forth frogs in abundance, in the chambers of their kings* (Psalm 105:30). The Psalm resings the very moment — *and the frogs came up, and covered the land of Egypt* (Exodus 8:6) — and presses it into the chambers of their kings, that Yahuah (LORD) reached even the seat of Pharaoh''s power. Yashar''el (Israel) is taught to remember the plagues as the acts of her Redeemer.'),
    ('canon','exodus',8,3,'canon','psalms',78,45,'free',
     E'*He sent divers sorts of flies among them, which devoured them; and frogs, which destroyed them* (Psalm 78:45). Asaph''s history-psalm names the frogs alongside the flies as instruments of judgment — *the river shall bring forth frogs abundantly* (Exodus 8:3) — that Yashar''el (Israel) might tell the generations how Yahuah (LORD) brake the power of Egypt.'),
    -- THREAD 2: this is the finger of Elohim
    ('canon','exodus',8,19,'canon','luke',11,20,'free',
     E'*But if I with the finger of Elohim (God) cast out devils, no doubt the kingdom of Elohim (God) is come upon you* (Luke 11:20). The magicians could not bring forth the lice and were forced to confess, *This is the finger of Elohim (God)* (Exodus 8:19) — the one power the counterfeiters could not imitate. That same finger of Elohim, in the Formed Son''s ministry, casts out the unclean; the kingdom presses in where the imitators are shut out.'),
    ('canon','exodus',8,16,'canon','luke',11,20,'free',
     E'*But if I with the finger of Elohim (God) cast out devils, no doubt the kingdom of Elohim (God) is come upon you* (Luke 11:20). When Aaron was told, *Stretch out thy rod, and smite the dust of the land, that it may become lice* (Exodus 8:16), the dust itself obeyed the finger of Elohim (God). The Formed Son wields that same finger against the unclean spirits, the kingdom of Yahuah (LORD) breaking in upon the very power Egypt''s wise men could not counterfeit.'),
    -- THREAD 3: I will put a division between my people and thy people
    ('canon','exodus',8,21,'canon','psalms',78,45,'free',
     E'*He sent divers sorts of flies among them, which devoured them; and frogs, which destroyed them* (Psalm 78:45). The threatened swarm — *behold, I will send swarms of flies upon thee, and upon thy servants, and upon thy people* (Exodus 8:21) — is remembered in the Psalm as a devouring judgment, that Yashar''el (Israel) might rehearse to her children how Yahuah (LORD) fought for them against Egypt.'),
    ('canon','exodus',8,22,'canon','exodus',11,7,'free',
     E'*But against any of the children of Israel shall not a dog move his tongue, against man or beast: that ye may know how that Yahuah (LORD) doth put a difference between the Egyptians and Israel* (Exodus 11:7). The same severing word runs to the last plague: *I will sever in that day the land of Goshen, in which my people dwell* (Exodus 8:22). Yahuah (LORD) makes a distinction upon his own — covenant people set apart from Egypt, never blended into her.'),
    ('canon','exodus',8,23,'canon','malachi',3,18,'free',
     E'*Then shall ye return, and discern between the righteous and the wicked, between him that serveth Elohim (God) and him that serveth him not* (Malachi 3:18). The division Yahuah (LORD) set in Egypt — *I will put a division between my people and thy people* (Exodus 8:23) — is the same line the prophets carry to the end: a discerning between those who serve Yahuah (LORD) and those who do not. The flies that found every Egyptian house could not touch Goshen.'),
    ('canon','exodus',8,23,'canon','romans',9,4,'free',
     E'*Who are Israelites; to whom pertaineth the adoption, and the glory, and the covenants, and the giving of the law, and the service of Elohim (God), and the promises* (Romans 9:4). The division — *I will put a division between my people and thy people* (Exodus 8:23) — is no abolition of Yashar''el (Israel) but the marking of her: the adoption, the covenants, and the promises pertain to her still. Yahuah''s severing in Goshen is the first picture of a people kept distinct unto himself.'),
    ('canon','exodus',8,24,'apocrypha','the-wisdom-of-solomon',16,9,'extras',
     E'*For them the bitings of grasshoppers and flies killed, neither was there found any remedy for their life: for they were worthy to be punished by such* (Wisdom of Solomon 16:9). The restored wisdom-book reads the plague exactly as Yahuah (LORD) framed it: *there came a grievous swarm of flies into the house of Pharaoh... the land was corrupted by reason of the swarm of flies* (Exodus 8:24) — measured recompense on the oppressor, while Yahuah''s own sons the same creatures could not overcome.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-8-the-river-shall-bring-forth-frogs-abundantly',
       E'The river shall bring forth frogs abundantly',
       E'The second plague rises out of the very water of the Nile: *And the river shall bring forth frogs abundantly, which shall go up and come into thine house, and into thy bedchamber, and upon thy bed, and into the house of thy servants, and upon thy people, and into thine ovens, and into thy kneadingtroughs* (Exodus 8:3). Pharaoh''s whole household is overrun by the unclean swarm. Yashar''el (Israel) is taught to keep this judgment in memory: *Their land brought forth frogs in abundance, in the chambers of their kings* (Psalm 105:30); *He sent divers sorts of flies among them, which devoured them; and frogs, which destroyed them* (Psalm 78:45). The plague reaches even the chambers of the kings, that none might say Egypt''s gods withstood the hand of Yahuah (LORD). At the end of the age the frog is taken up as the very image of the deception that swarms upon the rulers of the earth: *And I saw three unclean spirits like frogs come out of the mouth of the dragon, and out of the mouth of the beast, and out of the mouth of the false prophet* (Revelation 16:13); *For they are the spirits of devils, working miracles, which go forth unto the kings of the earth and of the whole world, to gather them to the battle of that great day of El Shaddai (God Almighty)* (Revelation 16:14). As the frog filled Pharaoh''s house and his magicians aped the wonder, so the last deception works counterfeit miracles to harden the kings against Yahuah (LORD).',
       sv.verse_id, ev.verse_id, 'free', 29175
  FROM _s305_ex08_lookup sv, _s305_ex08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=8 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-8-this-is-the-finger-of-elohim',
       E'This is the finger of Elohim',
       E'At the third plague the counterfeit breaks. *And the magicians did so with their enchantments to bring forth lice, but they could not: so there were lice upon man, and upon beast* (Exodus 8:18). Where the river and the frogs had been mimicked, the dust of the earth obeys only one hand: *Stretch out thy rod, and smite the dust of the land, that it may become lice throughout all the land of Egypt* (Exodus 8:16). And so even Pharaoh''s wise men are forced to confess what they cannot reproduce: *Then the magicians said unto Pharaoh, This is the finger of Elohim (God)* (Exodus 8:19). That finger does not vanish from the story. In the Formed Son''s ministry it is the same power, naming itself by the same Tanakh phrase: *But if I with the finger of Elohim (God) cast out devils, no doubt the kingdom of Elohim (God) is come upon you* (Luke 11:20). The finger the imitators could not match in Egypt is the finger that casts out the unclean spirits and presses the kingdom of Yahuah (LORD) in upon the world.',
       sv.verse_id, ev.verse_id, 'free', 29178
  FROM _s305_ex08_lookup sv, _s305_ex08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=8 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=8 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-8-i-will-put-a-division-between-my-people-and-thy-people',
       E'I will put a division between my people and thy people',
       E'With the fourth plague Yahuah (LORD) draws a line through Egypt itself. *I will sever in that day the land of Goshen, in which my people dwell, that no swarms of flies shall be there; to the end thou mayest know that I am Yahuah (LORD) in the midst of the earth* (Exodus 8:22); *And I will put a division between my people and thy people: to morrow shall this sign be* (Exodus 8:23). The swarm that filled every Egyptian house — *there came a grievous swarm of flies into the house of Pharaoh... the land was corrupted by reason of the swarm of flies* (Exodus 8:24) — could not cross into Goshen. Yashar''el (Israel) is to remember the judgment: *He sent divers sorts of flies among them, which devoured them* (Psalm 78:45). The restored wisdom-book reads the recompense the same way: *For them the bitings of grasshoppers and flies killed, neither was there found any remedy for their life: for they were worthy to be punished by such* (Wisdom of Solomon 16:9) — measured judgment on the oppressor, while Yahuah''s own sons the creatures could not overcome. This division is the heartbeat of the whole deliverance, carried to the last plague — *that ye may know how that Yahuah (LORD) doth put a difference between the Egyptians and Israel* (Exodus 11:7) — and on to the prophets: *Then shall ye return, and discern between the righteous and the wicked, between him that serveth Elohim (God) and him that serveth him not* (Malachi 3:18). It is never the casting-off of Yashar''el (Israel) but the marking of her: *Who are Israelites; to whom pertaineth the adoption, and the glory, and the covenants, and the giving of the law, and the service of Elohim (God), and the promises* (Romans 9:4). The severing in Goshen is the first picture of a covenant people kept distinct unto Yahuah (LORD) himself.',
       sv.verse_id, ev.verse_id, 'extras', 29181
  FROM _s305_ex08_lookup sv, _s305_ex08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=8 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=8 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- MEMBERS — THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (8,3,'canon','revelation',16,13,1,E'Revelation 16:13 — *three unclean spirits like frogs* come out of the dragon, beast, and false prophet; the frog-plague taken up as end-time deception.'),
    (8,3,'canon','revelation',16,14,2,E'Revelation 16:14 — *the spirits of devils, working miracles, which go forth unto the kings of the earth*; counterfeit wonders that harden the rulers, as Pharaoh''s magicians once aped the plague.'),
    (8,6,'canon','psalms',105,30,3,E'Psalm 105:30 — *Their land brought forth frogs in abundance, in the chambers of their kings*; the plague reached even the seat of Pharaoh''s power.'),
    (8,3,'canon','psalms',78,45,4,E'Psalm 78:45 — *frogs, which destroyed them*; Asaph rehearses the judgment so Yashar''el (Israel) tells the generations.')
  ) AS m(src_v,src_v2,tgt_edition,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-8-the-river-shall-bring-forth-frogs-abundantly'
  JOIN _s305_ex08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=8 AND sv.verse_number=m.src_v2
  JOIN _s305_ex08_lookup tv ON tv.edition_slug=m.tgt_edition AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- MEMBERS — THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (8,19,'canon','luke',11,20,1,E'Luke 11:20 — *if I with the finger of Elohim (God) cast out devils*; the power the counterfeiters could not imitate casts out the unclean.'),
    (8,16,'canon','luke',11,20,2,E'Luke 11:20 — the same finger that made the dust become lice (Exodus 8:16) breaks in upon the unclean spirits in the Formed Son''s ministry.')
  ) AS m(src_v,src_v2,tgt_edition,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-8-this-is-the-finger-of-elohim'
  JOIN _s305_ex08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=8 AND sv.verse_number=m.src_v2
  JOIN _s305_ex08_lookup tv ON tv.edition_slug=m.tgt_edition AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- MEMBERS — THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, m.sort_order, m.member_note
  FROM (VALUES
    (8,21,'canon','psalms',78,45,1,E'Psalm 78:45 — *He sent divers sorts of flies among them, which devoured them*; the threatened swarm remembered as devouring judgment.'),
    (8,24,'apocrypha','the-wisdom-of-solomon',16,9,2,E'Wisdom of Solomon 16:9 — *the bitings of grasshoppers and flies killed* the enemy; measured recompense on the oppressor while Yahuah''s sons are spared.'),
    (8,22,'canon','exodus',11,7,3,E'Exodus 11:7 — *Yahuah (LORD) doth put a difference between the Egyptians and Israel*; the same severing word carried to the last plague.'),
    (8,23,'canon','malachi',3,18,4,E'Malachi 3:18 — *discern... between him that serveth Elohim (God) and him that serveth him not*; the division carried to the prophets'' end.'),
    (8,23,'canon','romans',9,4,5,E'Romans 9:4 — *to whom pertaineth the adoption... the covenants... and the promises*; the division marks Yashar''el (Israel), never casts her off.')
  ) AS m(src_v,src_v2,tgt_edition,tgt_slug,tgt_ch,tgt_v,sort_order,member_note)
  JOIN cross_reference_threads t ON t.slug='exodus-8-i-will-put-a-division-between-my-people-and-thy-people'
  JOIN _s305_ex08_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=8 AND sv.verse_number=m.src_v2
  JOIN _s305_ex08_lookup tv ON tv.edition_slug=m.tgt_edition AND tv.book_slug=m.tgt_slug AND tv.chapter_number=m.tgt_ch AND tv.verse_number=m.tgt_v
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
