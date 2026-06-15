-- ----- fragment: minion_exodus_4.sql (Exodus 4) -----
-- Chapter: Exodus 4  |  Tag: ex04  |  Session prefix: s305  |  Sort band base: 29075 (step 3)
-- The rod and the three signs; "Yashar'el is my son, even my firstborn"; the hardening of
-- Pharaoh begun; the bridegroom of blood (Zipporah circumcises Gershom).
--
-- Exodus 4 coverage checklist:
--   v.1-9   three signs (rod->serpent, leprous hand, water->blood) — the authenticating signs
--           NT:     none warranted as members here (the rod-swallowing belongs to ch7)
--           Extras: Jubilees 48:4 names the signs/wonders performed (woven in bridegroom thread)
--           Tanakh: Exodus 7:10-12 (the rod swallows the magicians' rods) — THREAD 2
--   v.10-12 "I am not eloquent... slow of speech... I will be with thy mouth, and teach thee"
--           NT:     Matthew 10:19-20; Luke 12:12 (it shall be given you what ye speak) — THREAD 3
--           Extras: none warranted
--           Tanakh: Jeremiah 1:6-9 (same objection; the touched mouth) — THREAD 3
--   v.13-20 send by another's hand; Aaron given; return to Egypt; rod of Elohim in hand
--           NT/Extras/Tanakh: none warranted (rod-of-Elohim folded into signs/bridegroom context)
--   v.21    "I will harden his heart, that he shall not let the people go"
--           NT:     Romans 9:17-18 (raised thee up... whom he will he hardeneth) — THREAD 4
--           Extras: none warranted
--           Tanakh: (Pharaoh's own self-hardening developed across ch7-14; kept restrained here)
--   v.22-23 ★★ "Yashar'el is my son, even my firstborn... Let my son go... I will slay thy son"
--           NT:     Matthew 2:15 (Out of Egypt have I called my son) — THREAD 1 (keystone)
--           Extras: none warranted
--           Tanakh: Hosea 11:1; Jeremiah 31:9 (Ephraim is my firstborn) — THREAD 1
--   v.24-26 the bridegroom of blood; Zipporah circumcises her son with a sharp stone
--           NT:     none warranted
--           Extras: Jubilees 48:2-4 (Mastema at the lodging-place sought to slay him) — THREAD 5
--           Tanakh: Genesis 17:10-14 (circumcision the everlasting covenant token) — THREAD 5
--   v.27-31 Aaron meets Moses; signs done before the elders; the people believed and worshipped
--           NT/Extras/Tanakh: none warranted (believing-the-signs resolves the ch3-4 doubt arc)
--
-- THREADS (slug -> target libraries):
--   exodus-4-yasharel-is-my-son-even-my-firstborn-out-of-egypt-have-i-called-my-son-hosea-11-matthew-2   [canon/NT — free]
--   exodus-4-the-three-signs-the-rod-that-swallows-the-magicians-rods-exodus-7                            [canon — free]
--   exodus-4-i-will-be-with-thy-mouth-the-reluctant-prophet-equipped-jeremiah-1-matthew-10                [canon/NT — free]
--   exodus-4-i-will-harden-his-heart-the-oppressor-judged-for-yahuahs-name-romans-9                       [canon/NT — free]
--   exodus-4-a-bloody-husband-the-covenant-sign-on-the-deliverer-genesis-17-jubilees-48                   [extras — Jubilees member]
--
-- Framework-load-bearing / contested framing:
--   v.22-23 KEYSTONE — Yashar'el is Yahuah's firstborn SON. Hosea 11:1 + Matthew 2:15 frame the
--     Formed Son recapitulating the firstborn-son nation; Jeremiah 31:9 (Ephraim is my firstborn)
--     binds it to the two-house people, not a replacement church.
--   v.21 hardening — framed per the lens as covenant-judgment displayed for Yahuah's name in all
--     the earth on a self-hardening oppressor (Romans 9:17 "that my name might be declared
--     throughout all the earth"), NOT arbitrary reprobation of a people.
--   v.24-26 — circumcision the everlasting covenant sign (Genesis 17:13), not abolished; the
--     mediator himself must bear the sign on his house. Jubilees 48 names the assailant Mastema.

CREATE TEMP VIEW _s305_ex04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: firstborn-son keystone (4:22-23)
    ('canon','exodus',4,22,'canon','hosea',11,1,'free',
     E'*When Yashar''el (Israel) was a child, then I loved him, and called my son out of Egypt.* (Hosea 11:1). Hosea reaches back to this very word — *Thus saith Yahuah (LORD), Yashar''el (Israel) is my son, even my firstborn* (Exodus 4:22) — and reads the whole exodus as a Father calling his son home. The nation is Yahuah''s firstborn son, loved out of bondage.'),
    ('canon','exodus',4,22,'canon','jeremiah',31,9,'free',
     E'*for I am a father to Yashar''el (Israel), and Ephraim is my firstborn.* (Jeremiah 31:9). The firstborn-son sonship Yahuah declares here — *Yashar''el (Israel) is my son, even my firstborn* (Exodus 4:22) — is carried by Jeremiah onto the scattered northern house: Ephraim too is the firstborn, gathered in the great ingathering, the two-house people made one.'),
    ('canon','exodus',4,22,'canon','matthew',2,15,'free',
     E'*that it might be fulfilled which was spoken of Yahuah (Lord) by the prophet, saying, Out of Egypt have I called my son.* (Matthew 2:15). The firstborn son *Yashar''el (Israel)* (Exodus 4:22) is fulfilled in the Formed Son: Messiah comes up out of Egypt, recapitulating the firstborn nation, the true Son embodying the whole people Yahuah loves.'),
    ('canon','exodus',4,23,'canon','matthew',2,15,'free',
     E'*Out of Egypt have I called my son.* (Matthew 2:15). Yahuah''s demand — *Let my son go, that he may serve me* (Exodus 4:23) — is answered in the Formed Son drawn up out of Egypt to do the Father''s will; the firstborn-son claim runs from the nation to the Son who embodies it.'),

    -- THREAD 2: the three signs / the rod (4:1-9, esp. 4:2-4,17)
    ('canon','exodus',4,3,'canon','exodus',7,10,'free',
     E'*and Aaron cast down his rod before Pharaoh, and before his servants, and it became a serpent.* (Exodus 7:10). The first authenticating sign given Moses — *he cast it on the ground, and it became a serpent* (Exodus 4:3) — is the same rod loosed before Pharaoh, the sign carried from the wilderness into the throne-room of Egypt.'),
    ('canon','exodus',4,4,'canon','exodus',7,12,'free',
     E'*For they cast down every man his rod, and they became serpents: but Aaron''s rod swallowed up their rods.* (Exodus 7:12). The rod Moses takes again by the tail — *and it became a rod in his hand* (Exodus 4:4) — is the rod of Elohim that swallows the magicians'' counterfeits: the true sign devours the imitation, Yahuah''s power over Egypt''s wisdom.'),
    ('canon','exodus',4,17,'canon','exodus',7,12,'free',
     E'*but Aaron''s rod swallowed up their rods.* (Exodus 7:12). *And thou shalt take this rod in thine hand, wherewith thou shalt do signs* (Exodus 4:17): the rod commissioned here is the rod that proves Yahuah greater than every enchantment of Egypt.'),

    -- THREAD 3: I will be with thy mouth (4:10-12)
    ('canon','exodus',4,10,'canon','jeremiah',1,6,'free',
     E'*Then said I, Ah, Yahuah (Lord) GOD! behold, I cannot speak: for I am a child.* (Jeremiah 1:6). Moses'' objection — *I am not eloquent... I am slow of speech, and of a slow tongue* (Exodus 4:10) — is the prophet''s recurring plea; Jeremiah raises the same reluctance and is met with the same Yahuah-with-the-mouth answer.'),
    ('canon','exodus',4,11,'canon','jeremiah',1,9,'free',
     E'*Then Yahuah (LORD) put forth his hand, and touched my mouth. And Yahuah (LORD) said unto me, Behold, I have put my words in thy mouth.* (Jeremiah 1:9). *Who hath made man''s mouth?... have not I Yahuah (LORD)?* (Exodus 4:11): the One who formed the mouth is the One who fills it; Jeremiah''s touched mouth is the same equipping promised to Moses.'),
    ('canon','exodus',4,12,'canon','jeremiah',1,9,'free',
     E'*Behold, I have put my words in thy mouth.* (Jeremiah 1:9). The promise *I will be with thy mouth, and teach thee what thou shalt say* (Exodus 4:12) is repeated word for word to Jeremiah: the reluctant prophet is not chosen for eloquence but equipped by the Word himself.'),
    ('canon','exodus',4,12,'canon','matthew',10,19,'free',
     E'*But when they deliver you up, take no thought how or what ye shall speak: for it shall be given you in that same hour what ye shall speak.* (Matthew 10:19). The Master makes the Mosaic promise the standing inheritance of his sent ones — *I will be with thy mouth, and teach thee what thou shalt say* (Exodus 4:12) — the words given in the hour of need.'),
    ('canon','exodus',4,12,'canon','matthew',10,20,'free',
     E'*For it is not ye that speak, but the Spirit of your Father which speaketh in you.* (Matthew 10:20). *I will be with thy mouth, and teach thee what thou shalt say* (Exodus 4:12): the teaching of the mouth is the Spirit of the Father speaking — the same Presence that equipped Moses now speaks in the sent.'),
    ('canon','exodus',4,12,'canon','luke',12,12,'free',
     E'*For the Ruach HaKodesh (Holy Spirit) shall teach you in the same hour what ye ought to say.* (Luke 12:12). The promise to Moses — *I will be with thy mouth, and teach thee what thou shalt say* (Exodus 4:12) — is the work of the Ruach HaKodesh, who teaches in the very hour what ought to be said.'),

    -- THREAD 4: I will harden his heart (4:21)
    ('canon','exodus',4,21,'canon','romans',9,17,'free',
     E'*For the scripture saith unto Pharaoh, Even for this same purpose have I raised thee up, that I might shew my power in thee, and that my name might be declared throughout all the earth.* (Romans 9:17). *I will harden his heart, that he shall not let the people go* (Exodus 4:21): the hardening is no arbitrary doom but covenant-judgment displayed upon a self-hardening oppressor, so Yahuah''s name is published in all the earth.'),
    ('canon','exodus',4,21,'canon','romans',9,18,'free',
     E'*Therefore hath he mercy on whom he will have mercy, and whom he will he hardeneth.* (Romans 9:18). The word spoken to Moses — *but I will harden his heart* (Exodus 4:21) — is read by Paul as Yahuah''s sovereign freedom over a tyrant: mercy and hardening are his, the oppressor''s own obstinacy ripened for judgment and for the showing of the Name.'),

    -- THREAD 5: a bloody husband / the covenant sign (4:24-26)
    ('canon','exodus',4,25,'canon','genesis',17,10,'extras',
     E'*This is my covenant, which ye shall keep, between me and you and thy seed after thee; Every man child among you shall be circumcised.* (Genesis 17:10). Zipporah''s sharp stone answers this everlasting command — *Then Zipporah took a sharp stone, and cut off the foreskin of her son* (Exodus 4:25): the deliverer''s own house must bear the covenant sign before he can deliver Yahuah''s firstborn.'),
    ('canon','exodus',4,26,'canon','genesis',17,13,'extras',
     E'*and my covenant shall be in your flesh for an everlasting covenant.* (Genesis 17:13). *A bloody husband thou art, because of the circumcision* (Exodus 4:26): the blood of the covenant-token in the flesh is what turns away the death that met Moses in the way — the everlasting sign, not abolished but enforced upon the mediator himself.'),
    ('canon','exodus',4,24,'jubilees','jubilees',48,2,'extras',
     E'*And you yourself know what He spake to you on Mount Sinai, and what prince Mastêmâ desired to do with you when you were returning into Egypt on the way when you did meet him at the lodging-place.* (Jubilees 48:2). The restored witness names the assailant at the inn — *Yahuah (LORD) met him, and sought to kill him* (Exodus 4:24) — as prince Mastema confronting the deliverer at the lodging-place on the road back to Egypt.'),
    ('canon','exodus',4,24,'jubilees','jubilees',48,3,'extras',
     E'*Did he not with all his power seek to slay you and deliver the Egyptians out of your hand when he saw that you were sent to execute judgment and vengeance on the Egyptians?* (Jubilees 48:3). The deadly encounter in the way — *and sought to kill him* (Exodus 4:24) — is read in Jubilees as Mastema''s assault on the very man sent to execute judgment on Egypt; the covenant blood (Exodus 4:25-26) repels him.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-4-yasharel-is-my-son-even-my-firstborn-out-of-egypt-have-i-called-my-son-hosea-11-matthew-2',
       E'Yashar''el is My Son, Even My Firstborn — Out of Egypt Have I Called My Son',
       E'At the heart of the commission Yahuah (LORD) gives Moses the word that will define the whole exodus: *And thou shalt say unto Pharaoh, Thus saith Yahuah (LORD), Yashar''el (Israel) is my son, even my firstborn: And I say unto thee, Let my son go, that he may serve me: and if thou refuse to let him go, behold, I will slay thy son, even thy firstborn.* (Exodus 4:22-23). The nation is not Pharaoh''s property nor merely a people of slaves — it is Yahuah''s firstborn son, and the firstborn of Egypt will answer for the firstborn of Yahuah held in bondage.\n\nHosea reaches back to this exact sonship and reads the redemption as a Father''s love: *When Yashar''el (Israel) was a child, then I loved him, and called my son out of Egypt.* (Hosea 11:1). And Jeremiah carries the firstborn-son name onto the scattered northern house, so it covers the whole two-house people gathered home: *for I am a father to Yashar''el (Israel), and Ephraim is my firstborn.* (Jeremiah 31:9).\n\nThe type is fulfilled in the Formed Son. When the child is carried into Egypt and called back, Matthew reads Hosea''s word of the nation as the word of the One who embodies it: *that it might be fulfilled which was spoken of Yahuah (Lord) by the prophet, saying, Out of Egypt have I called my son.* (Matthew 2:15). The firstborn son Yashar''el, loved out of bondage, finds its head and fulness in the true Son drawn up out of Egypt — the same call, the same Father, the same firstborn claim running from the nation to the Messiah who is its life.',
       sv.verse_id, ev.verse_id, 'free', 29075
  FROM _s305_ex04_lookup sv, _s305_ex04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=4 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=4 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-4-the-three-signs-the-rod-that-swallows-the-magicians-rods-exodus-7',
       E'The Three Signs — The Rod That Swallows the Magicians'' Rods',
       E'Yahuah (LORD) equips Moses with authenticating signs so the people will know he is sent. The first is the rod: *And he said, Cast it on the ground. And he cast it on the ground, and it became a serpent; and Moses fled from before it.* (Exodus 4:3); then *he put forth his hand, and caught it, and it became a rod in his hand* (Exodus 4:4). The commission is sealed: *And thou shalt take this rod in thine hand, wherewith thou shalt do signs.* (Exodus 4:17).\n\nThat same rod is carried from the wilderness into the throne-room of Egypt, where the sign confronts the counterfeit head-on: *and Aaron cast down his rod before Pharaoh, and before his servants, and it became a serpent.* (Exodus 7:10). The magicians answer in kind, *but* the true sign devours the imitation: *For they cast down every man his rod, and they became serpents: but Aaron''s rod swallowed up their rods.* (Exodus 7:12). The rod of Elohim swallows the wisdom of Egypt — the authenticating sign is no stage-trick to be matched, but the power of Yahuah over every enchantment, the first stroke of the deliverance to come.',
       sv.verse_id, ev.verse_id, 'free', 29078
  FROM _s305_ex04_lookup sv, _s305_ex04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=4 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=4 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-4-i-will-be-with-thy-mouth-the-reluctant-prophet-equipped-jeremiah-1-matthew-10',
       E'I Will Be With Thy Mouth — The Reluctant Prophet Equipped',
       E'Moses pleads inadequacy: *O my Lord, I am not eloquent, neither heretofore, nor since thou hast spoken unto thy servant: but I am slow of speech, and of a slow tongue.* (Exodus 4:10). Yahuah (LORD) does not deny the weakness; he overrides it by pointing to himself as the Maker of the very mouth: *Who hath made man''s mouth? or who maketh the dumb, or deaf, or the seeing, or the blind? have not I Yahuah (LORD)?* (Exodus 4:11). Then the promise: *Now therefore go, and I will be with thy mouth, and teach thee what thou shalt say.* (Exodus 4:12).\n\nThis is the pattern of the reluctant prophet equipped. Jeremiah raises the identical objection and receives the identical answer: *Then said I, Ah, Yahuah (Lord) GOD! behold, I cannot speak: for I am a child.* (Jeremiah 1:6) — and *Then Yahuah (LORD) put forth his hand, and touched my mouth. And Yahuah (LORD) said unto me, Behold, I have put my words in thy mouth.* (Jeremiah 1:9). The One who formed the mouth is the One who fills it.\n\nThe Master makes this Mosaic promise the standing inheritance of his sent ones: *take no thought how or what ye shall speak: for it shall be given you in that same hour what ye shall speak. For it is not ye that speak, but the Spirit of your Father which speaketh in you.* (Matthew 10:19-20); *For the Ruach HaKodesh (Holy Spirit) shall teach you in the same hour what ye ought to say.* (Luke 12:12). The teaching of the mouth promised to Moses is the Spirit of the Father, who gives the words in the very hour they are needed.',
       sv.verse_id, ev.verse_id, 'free', 29081
  FROM _s305_ex04_lookup sv, _s305_ex04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=4 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=4 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-4-i-will-harden-his-heart-the-oppressor-judged-for-yahuahs-name-romans-9',
       E'I Will Harden His Heart — The Oppressor Judged for Yahuah''s Name',
       E'Before Moses ever returns, Yahuah (LORD) announces how the contest will go: *When thou goest to return into Egypt, see that thou do all those wonders before Pharaoh, which I have put in thine hand: but I will harden his heart, that he shall not let the people go.* (Exodus 4:21). This is not arbitrary reprobation of a people; it is covenant-judgment on a self-hardening tyrant who has enslaved Yahuah''s firstborn son. The hardening ripens an oppressor already set in his cruelty, so that the full weight of the deliverance — and the Name behind it — may be displayed.\n\nPaul reads it exactly so, fixing the purpose on the publishing of the Name in all the earth: *For the scripture saith unto Pharaoh, Even for this same purpose have I raised thee up, that I might shew my power in thee, and that my name might be declared throughout all the earth.* (Romans 9:17), *Therefore hath he mercy on whom he will have mercy, and whom he will he hardeneth.* (Romans 9:18). The sovereign freedom is real, but its end is named: the deliverance of the firstborn son and the declaring of Yahuah''s name where Egypt thought no power stood above its throne.',
       sv.verse_id, ev.verse_id, 'free', 29084
  FROM _s305_ex04_lookup sv, _s305_ex04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=4 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=4 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-4-a-bloody-husband-the-covenant-sign-on-the-deliverer-genesis-17-jubilees-48',
       E'A Bloody Husband — The Covenant Sign on the Deliverer',
       E'On the road back to Egypt the narrative turns suddenly deadly: *And it came to pass by the way in the inn, that Yahuah (LORD) met him, and sought to kill him.* (Exodus 4:24). The danger is turned aside not by argument but by blood — the covenant sign applied to the deliverer''s own house: *Then Zipporah took a sharp stone, and cut off the foreskin of her son, and cast it at his feet, and said, Surely a bloody husband art thou to me.* (Exodus 4:25); *So he let him go: then she said, A bloody husband thou art, because of the circumcision.* (Exodus 4:26).\n\nThe sign goes back to Abraham as an everlasting covenant, never abolished: *This is my covenant, which ye shall keep, between me and you and thy seed after thee; Every man child among you shall be circumcised.* (Genesis 17:10); *and my covenant shall be in your flesh for an everlasting covenant.* (Genesis 17:13). The man sent to bring Yahuah''s firstborn son out of Egypt cannot leave the covenant token unkept in his own household; the mediator himself must bear the sign before he can deliver.\n\nThe restored witness of Jubilees names the assailant at the lodging-place — not an unexplained wrath of Yahuah, but prince Mastema set against the deliverer: *what prince Mastêmâ desired to do with you when you were returning into Egypt on the way when you did meet him at the lodging-place.* (Jubilees 48:2); *Did he not with all his power seek to slay you and deliver the Egyptians out of your hand when he saw that you were sent to execute judgment and vengeance on the Egyptians?* (Jubilees 48:3). The covenant blood repels the destroyer — a foreshadow of the Passover blood that will turn away the same death from Yahuah''s firstborn.',
       sv.verse_id, ev.verse_id, 'extras', 29087
  FROM _s305_ex04_lookup sv, _s305_ex04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=4 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=4 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- ===== THREAD MEMBERS =====

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*When Yashar''el (Israel) was a child, then I loved him, and called my son out of Egypt.* (Hosea 11:1) — Hosea reads the exodus as a Father calling home his firstborn son.'
  FROM cross_reference_threads t
  JOIN _s305_ex04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=4 AND sv.verse_number=22
  JOIN _s305_ex04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-4-yasharel-is-my-son-even-my-firstborn-out-of-egypt-have-i-called-my-son-hosea-11-matthew-2'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*for I am a father to Yashar''el (Israel), and Ephraim is my firstborn.* (Jeremiah 31:9) — the firstborn-son name covers the scattered northern house, the two-house people gathered home.'
  FROM cross_reference_threads t
  JOIN _s305_ex04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=4 AND sv.verse_number=22
  JOIN _s305_ex04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-4-yasharel-is-my-son-even-my-firstborn-out-of-egypt-have-i-called-my-son-hosea-11-matthew-2'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Out of Egypt have I called my son.* (Matthew 2:15) — the firstborn son Yashar''el fulfilled in the Formed Son drawn up out of Egypt.'
  FROM cross_reference_threads t
  JOIN _s305_ex04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=4 AND sv.verse_number=22
  JOIN _s305_ex04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-4-yasharel-is-my-son-even-my-firstborn-out-of-egypt-have-i-called-my-son-hosea-11-matthew-2'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Out of Egypt have I called my son.* (Matthew 2:15) — *Let my son go, that he may serve me* (Exodus 4:23) answered in the Son who does the Father''s will.'
  FROM cross_reference_threads t
  JOIN _s305_ex04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=4 AND sv.verse_number=23
  JOIN _s305_ex04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-4-yasharel-is-my-son-even-my-firstborn-out-of-egypt-have-i-called-my-son-hosea-11-matthew-2'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*and Aaron cast down his rod before Pharaoh... and it became a serpent.* (Exodus 7:10) — the wilderness sign carried into Pharaoh''s throne-room.'
  FROM cross_reference_threads t
  JOIN _s305_ex04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=4 AND sv.verse_number=3
  JOIN _s305_ex04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=7 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-4-the-three-signs-the-rod-that-swallows-the-magicians-rods-exodus-7'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*but Aaron''s rod swallowed up their rods.* (Exodus 7:12) — the true sign devours the counterfeit; Yahuah''s power over Egypt''s wisdom.'
  FROM cross_reference_threads t
  JOIN _s305_ex04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=4 AND sv.verse_number=4
  JOIN _s305_ex04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=7 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-4-the-three-signs-the-rod-that-swallows-the-magicians-rods-exodus-7'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*but Aaron''s rod swallowed up their rods.* (Exodus 7:12) — *this rod... wherewith thou shalt do signs* (Exodus 4:17) proves Yahuah greater than every enchantment.'
  FROM cross_reference_threads t
  JOIN _s305_ex04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=4 AND sv.verse_number=17
  JOIN _s305_ex04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=7 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-4-the-three-signs-the-rod-that-swallows-the-magicians-rods-exodus-7'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Ah, Yahuah (Lord) GOD! behold, I cannot speak: for I am a child.* (Jeremiah 1:6) — the prophet''s same plea of inadequacy.'
  FROM cross_reference_threads t
  JOIN _s305_ex04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=4 AND sv.verse_number=10
  JOIN _s305_ex04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-4-i-will-be-with-thy-mouth-the-reluctant-prophet-equipped-jeremiah-1-matthew-10'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*touched my mouth... I have put my words in thy mouth.* (Jeremiah 1:9) — the One who made the mouth (Exodus 4:11) is the One who fills it.'
  FROM cross_reference_threads t
  JOIN _s305_ex04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=4 AND sv.verse_number=11
  JOIN _s305_ex04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-4-i-will-be-with-thy-mouth-the-reluctant-prophet-equipped-jeremiah-1-matthew-10'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Behold, I have put my words in thy mouth.* (Jeremiah 1:9) — the promise of Exodus 4:12 repeated word for word.'
  FROM cross_reference_threads t
  JOIN _s305_ex04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=4 AND sv.verse_number=12
  JOIN _s305_ex04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-4-i-will-be-with-thy-mouth-the-reluctant-prophet-equipped-jeremiah-1-matthew-10'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*it shall be given you in that same hour what ye shall speak.* (Matthew 10:19) — the Mosaic promise made the inheritance of the sent ones.'
  FROM cross_reference_threads t
  JOIN _s305_ex04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=4 AND sv.verse_number=12
  JOIN _s305_ex04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-4-i-will-be-with-thy-mouth-the-reluctant-prophet-equipped-jeremiah-1-matthew-10'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*it is not ye that speak, but the Spirit of your Father which speaketh in you.* (Matthew 10:20) — the teaching of the mouth is the Spirit of the Father.'
  FROM cross_reference_threads t
  JOIN _s305_ex04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=4 AND sv.verse_number=12
  JOIN _s305_ex04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-4-i-will-be-with-thy-mouth-the-reluctant-prophet-equipped-jeremiah-1-matthew-10'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*the Ruach HaKodesh (Holy Spirit) shall teach you in the same hour what ye ought to say.* (Luke 12:12) — the Spirit who equipped Moses teaches in the hour.'
  FROM cross_reference_threads t
  JOIN _s305_ex04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=4 AND sv.verse_number=12
  JOIN _s305_ex04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-4-i-will-be-with-thy-mouth-the-reluctant-prophet-equipped-jeremiah-1-matthew-10'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Even for this same purpose have I raised thee up... that my name might be declared throughout all the earth.* (Romans 9:17) — the hardening serves the publishing of the Name.'
  FROM cross_reference_threads t
  JOIN _s305_ex04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=4 AND sv.verse_number=21
  JOIN _s305_ex04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-4-i-will-harden-his-heart-the-oppressor-judged-for-yahuahs-name-romans-9'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*whom he will he hardeneth.* (Romans 9:18) — Yahuah''s sovereign freedom over a self-hardening tyrant, not reprobation of a people.'
  FROM cross_reference_threads t
  JOIN _s305_ex04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=4 AND sv.verse_number=21
  JOIN _s305_ex04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-4-i-will-harden-his-heart-the-oppressor-judged-for-yahuahs-name-romans-9'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Every man child among you shall be circumcised.* (Genesis 17:10) — Zipporah''s stone answers the everlasting covenant command.'
  FROM cross_reference_threads t
  JOIN _s305_ex04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=4 AND sv.verse_number=25
  JOIN _s305_ex04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-4-a-bloody-husband-the-covenant-sign-on-the-deliverer-genesis-17-jubilees-48'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*my covenant shall be in your flesh for an everlasting covenant.* (Genesis 17:13) — the sign in the flesh, not abolished but enforced on the mediator''s house.'
  FROM cross_reference_threads t
  JOIN _s305_ex04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=4 AND sv.verse_number=26
  JOIN _s305_ex04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-4-a-bloody-husband-the-covenant-sign-on-the-deliverer-genesis-17-jubilees-48'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*what prince Mastêmâ desired to do with you... at the lodging-place.* (Jubilees 48:2) — the restored witness names the assailant at the inn.'
  FROM cross_reference_threads t
  JOIN _s305_ex04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=4 AND sv.verse_number=24
  JOIN _s305_ex04_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=48 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-4-a-bloody-husband-the-covenant-sign-on-the-deliverer-genesis-17-jubilees-48'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Did he not with all his power seek to slay you...* (Jubilees 48:3) — Mastema''s assault on the man sent to judge Egypt; the covenant blood repels him.'
  FROM cross_reference_threads t
  JOIN _s305_ex04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=4 AND sv.verse_number=24
  JOIN _s305_ex04_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=48 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-4-a-bloody-husband-the-covenant-sign-on-the-deliverer-genesis-17-jubilees-48'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
