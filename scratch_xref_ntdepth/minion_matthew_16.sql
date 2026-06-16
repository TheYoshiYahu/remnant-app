-- ----- fragment: minion_matthew_16.sql (S260 Matthew depth) -----
-- ============================================================================
-- Matthew 16 — full-library cross-reference threads (NT DEPTH pass)
-- 5 threads / sort_order band 11450 step +3
-- ============================================================================

-- 3a. Temp view ---------------------------------------------------------------
CREATE TEMP VIEW _mt16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- 3b. cross_references rows ---------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- THREAD 1 — 16:1-4 the sign of the times / no sign but Jonah
  ('canon','matthew',16,4,'canon','jonah',1,17, 'free', E'*Now Yahuah (LORD) had prepared a great fish to swallow up Jonah. And Jonah was in the belly of the fish three days and three nights* (Jonah 1:17). The one sign granted to a sign-seeking generation: three days in the deep and a coming-up — a figure of the burial and the rising.'),
  ('canon','matthew',16,3,'canon','luke',12,56, 'free', E'*Ye hypocrites, ye can discern the face of the sky and of the earth; but how is it that ye do not discern this time?* (Luke 12:56). The same rebuke recorded twice: they read the red sky but not the day of their visitation standing before them.'),
  ('canon','matthew',16,4,'canon','matthew',12,40, 'free', E'*For as Jonas was three days and three nights in the whale''s belly; so shall the Son of Adam be three days and three nights in the heart of the earth* (Matthew 12:40). Yahusha names the sign plainly — Jonah''s deep is the heart of the earth, and the surfacing is the third day.'),

  -- THREAD 2 — 16:5-12 the leaven of the Pharisees and Sadducees
  ('canon','matthew',16,6,'canon','exodus',12,15, 'free', E'*Seven days shall ye eat unleavened bread; even the first day ye shall put away leaven out of your houses: for whosoever eateth leavened bread from the first day until the seventh day, that soul shall be cut off from Yashar''el (Israel)* (Exodus 12:15). The feast itself teaches the lesson: leaven is the thing purged out, the small thing that works through the whole.'),
  ('canon','matthew',16,12,'canon','hosea',7,4, 'free', E'*They are all adulterers, as an oven heated by the baker, who ceaseth from raising after he hath kneaded the dough, until it be leavened* (Hosea 7:4). The prophet already used leaven for a heart secretly fermenting toward corruption — the doctrine of the Pharisees and Sadducees working unseen.'),
  ('canon','matthew',16,11,'canon','1-corinthians',5,6, 'free', E'*Know ye not that a little leaven leaveneth the whole lump?* (1 Corinthians 5:6). Sha''ul keeps the same Passover-grammar: a little false teaching, like a little leaven, spreads through the whole assembly if it is not put away.'),
  ('canon','matthew',16,12,'canon','1-corinthians',5,8, 'free', E'*Therefore let us keep the feast, not with old leaven, neither with the leaven of malice and wickedness; but with the unleavened bread of sincerity and truth* (1 Corinthians 5:8). The feast is kept — and the leaven beware of is the doctrine of malice and falsehood, exactly the leaven Yahusha names.'),

  -- THREAD 3 — 16:13-20 the confession / the rock / the keys
  ('canon','matthew',16,16,'canon','psalms',2,7, 'free', E'*I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee* (Psalm 2:7). Peter''s confession — *the Son of the living Elohim* — is the Father''s own decree confessed: a begotten Son who HAS a Father, not a second deity.'),
  ('canon','matthew',16,16,'canon','2-samuel',7,14, 'free', E'*I will be his father, and he shall be my son* (2 Samuel 7:14). The covenant to David already framed the Sonship as a Father giving and a son receiving — the Formed Son of the living Elohim, the throne-heir.'),
  ('canon','matthew',16,17,'canon','daniel',2,45, 'free', E'*Forasmuch as thou sawest that the stone was cut out of the mountain without hands... the great Elohim (God) hath made known to the king what shall come to pass* (Daniel 2:45). Flesh and blood revealed it not — as the stone was cut WITHOUT hands, the confession is not of man''s quarrying but the Father''s own revealing.'),
  ('canon','matthew',16,18,'canon','isaiah',28,16, 'free', E'*Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation: he that believeth shall not make haste* (Isaiah 28:16). The Rock the assembly is built upon is the tried stone Yahuah laid — the confessed Messiah himself, the sure foundation.'),
  ('canon','matthew',16,19,'canon','isaiah',22,22, 'free', E'*And the key of the house of David will I lay upon his shoulder; so he shall open, and none shall shut; and he shall shut, and none shall open* (Isaiah 22:22). The keys of the kingdom are the steward''s keys of David''s house — a stewardship entrusted, opening and shutting under the Master''s authority.'),
  ('canon','matthew',16,16,'enoch','1-enoch',48,2, 'extras', E'*And at that hour that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days* (1 Enoch 48:2). The library already knew the Son of Adam named and hidden before the Father — the confessed One, revealed by the Father of Spirits.'),
  ('canon','matthew',16,16,'enoch','1-enoch',48,3, 'extras', E'*Yea, before the sun and the signs were created, Before the stars of the heaven were made, His name was named before Yahuah (God) of Spirits* (1 Enoch 48:3). His name named before the stars — the Formed Son foreknown of the Father, not a creature of the moment nor a co-equal second.'),
  ('canon','matthew',16,16,'canon','john',6,69, 'free', E'*And we believe and are sure that thou art that Messiah (Christ), the Son of the living Elohim (God)* (John 6:69). The very words of Peter''s confession echo in John''s account — *the Son of the living Elohim* — one confession on one mouth.'),
  ('canon','matthew',16,19,'canon','revelation',3,7, 'free', E'*These things saith he that is holy, he that is true, he that hath the key of David, he that openeth, and no man shutteth; and shutteth, and no man openeth* (Revelation 3:7). Isaiah''s key of David is held by Messiah himself — and the keys of the kingdom are given to the stewards under his hand.'),

  -- THREAD 4 — 16:21-23 the suffering foretold / get thee behind me Satan
  ('canon','matthew',16,21,'canon','isaiah',53,3, 'free', E'*He is despised and rejected of men; a man of sorrows, and acquainted with grief... he was despised, and we esteemed him not* (Isaiah 53:3). Yahusha shews his disciples he must suffer many things — Isaiah foretold the rejected man long before Peter recoiled from it.'),
  ('canon','matthew',16,21,'canon','isaiah',53,5, 'free', E'*But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed* (Isaiah 53:5). The suffering Peter would *be it far from thee* is the very wounding by which peace comes — the appointed way, not an accident to be turned aside.'),
  ('canon','matthew',16,21,'canon','isaiah',53,10, 'free', E'*Yet it pleased Yahuah (LORD) to bruise him... when thou shalt make his soul an offering for sin, he shall see his seed, he shall prolong his days* (Isaiah 53:10). The killing AND the rising in one breath — *he shall prolong his days* — exactly as Yahusha said he must be killed and be raised the third day.'),

  -- THREAD 5 — 16:24-28 take up the cross / the Son of man comes in glory rewarding every man
  ('canon','matthew',16,26,'canon','psalms',49,7, 'free', E'*None of them can by any means redeem his brother, nor give to Elohim (God) a ransom for him* (Psalm 49:7). *What shall a man give in exchange for his soul?* — the psalm already answered: no man can buy back a soul, neither his brother''s nor his own.'),
  ('canon','matthew',16,26,'canon','psalms',49,8, 'free', E'*(For the redemption of their soul is precious, and it ceaseth for ever:)* (Psalm 49:8). The price of a soul is beyond all the world a man might gain — and so the gain of the whole world is no exchange for losing it.'),
  ('canon','matthew',16,27,'canon','proverbs',24,12, 'free', E'*Doth not he that pondereth the heart consider it?... and shall not he render to every man according to his works?* (Proverbs 24:12). The Son of Adam who *shall reward every man according to his works* renders by the Father''s own settled measure — works weighed, the heart pondered.'),
  ('canon','matthew',16,27,'canon','daniel',7,13, 'free', E'*I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days* (Daniel 7:13). The glory-coming is Daniel''s vision — one LIKE the Son of Adam, in the likeness, coming WITH the clouds; the comparative kept, the figure not flattened.'),
  ('canon','matthew',16,27,'canon','daniel',7,14, 'free', E'*And there was given him dominion, and glory, and a kingdom, that all people, nations, and languages, should serve him: his dominion is an everlasting dominion* (Daniel 7:14). The kingdom is GIVEN him by the Ancient of days — the glory of his Father, dominion received from the Father''s hand, not seized as a co-equal.'),
  ('canon','matthew',16,27,'enoch','1-enoch',62,7, 'extras', E'*And Yahuah (God) of Spirits said: This is the Son of Adam who is born unto righteousness, And righteousness abides over him, And the righteousness of the Head of Days forsakes him not* (1 Enoch 62:7). The library''s own vision of the Son of Adam seated to judge — born unto righteousness, the Head of Days behind him, rewarding every man.'),
  ('canon','matthew',16,28,'canon','zechariah',14,5, 'free', E'*And Yahuah Elohai (the LORD my God) shall come, and all the saints with thee* (Zechariah 14:5). The Son of Adam coming in his kingdom — Yahuah coming with all his set-apart ones, as Yahusha said *with his angels*.'),
  ('canon','matthew',16,25,'canon','luke',9,23, 'free', E'*If any man will come after me, let him deny himself, and take up his cross daily, and follow me* (Luke 9:23). The same call, set down again with *daily* — the cross taken up is not one moment but the whole walk of losing the life to find it.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _mt16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _mt16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- 3c. Threads -----------------------------------------------------------------
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-16-no-sign-but-the-prophet-jonah-the-signs-of-the-times-jonah-1',
       E'A wicked generation seeketh a sign — none but the sign of Jonah (Jonah 1:17; Luke 12:56)',
       E'The Pharisees and Sadducees come *tempting* — *that he would shew them a sign from heaven* (16:1). Yahusha answers that they read the sky but not the season: *can ye not discern the signs of the times?* (16:3). The same rebuke stands in Luke''s account — *Ye hypocrites, ye can discern the face of the sky and of the earth; but how is it that ye do not discern this time?* (Luke 12:56). One sign only is given: *the sign of the prophet Jonas* (16:4). And the prophet''s sign is plain in the Tanakh — *Now Yahuah (LORD) had prepared a great fish to swallow up Jonah. And Jonah was in the belly of the fish three days and three nights* (Jonah 1:17): three days in the deep and a coming-up. Yahusha himself reads it: *For as Jonas was three days and three nights in the whale''s belly; so shall the Son of Adam be three days and three nights in the heart of the earth* (Matthew 12:40). The sign-seekers wanted a wonder in the sky; the sign given was the burial and the rising — and they would not discern it.',
       sv.verse_id, ev.verse_id, 'free', 11450
  FROM _mt16_lookup sv, _mt16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=16 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-16-beware-the-leaven-of-the-pharisees-and-sadducees-exodus-12-1-corinthians-5',
       E'Beware the leaven of the Pharisees and Sadducees — the doctrine that works through the whole (Exodus 12:15; 1 Corinthians 5:6)',
       E'*Take heed and beware of the leaven of the Pharisees and of the Sadducees* (16:6). The disciples think he speaks of bread; he means *the doctrine of the Pharisees and of the Sadducees* (16:12). The figure is drawn straight from the feast: *Seven days shall ye eat unleavened bread; even the first day ye shall put away leaven out of your houses: for whosoever eateth leavened bread... that soul shall be cut off from Yashar''el (Israel)* (Exodus 12:15) — leaven is the small thing purged out, the thing that secretly works through the whole. Hosea already turned that figure on a corrupt heart: *They are all adulterers, as an oven heated by the baker, who ceaseth from raising after he hath kneaded the dough, until it be leavened* (Hosea 7:4). And Sha''ul keeps the same Passover-grammar exactly: *Know ye not that a little leaven leaveneth the whole lump?* (1 Corinthians 5:6) — *Therefore let us keep the feast, not with old leaven, neither with the leaven of malice and wickedness; but with the unleavened bread of sincerity and truth* (1 Corinthians 5:8). The feast is kept; the leaven to be put away is false doctrine and malice — exactly the leaven Yahusha names.',
       sv.verse_id, ev.verse_id, 'free', 11453
  FROM _mt16_lookup sv, _mt16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=16 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-16-thou-art-the-messiah-the-rock-and-the-keys-psalm-2-isaiah-22-isaiah-28',
       E'Thou art the Messiah, the Son of the living Elohim — the Rock and the keys (Psalm 2:7; Isaiah 28:16; Isaiah 22:22)',
       E'*Whom say ye that I am?* — and Simon Peter answers, *Thou art the Messiah (Christ), the Son of the living Elohim (God)* (16:16). Yahusha names the source of it at once: *flesh and blood hath not revealed it unto thee, but my Father which is in heaven* (16:17). This is the Father''s own decree confessed — *Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee* (Psalm 2:7) — and the covenant Sonship of David''s seed, *I will be his father, and he shall be my son* (2 Samuel 7:14): a begotten Son who HAS a Father, revealed BY the Father, not a second deity beside Him. That the confession is not man''s quarrying is itself the figure of Daniel — *the stone was cut out of the mountain without hands... the great Elohim (God) hath made known* (Daniel 2:45). The Rock on which the assembly is built is the tried stone Yahuah laid: *Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation: he that believeth shall not make haste* (Isaiah 28:16) — the confessed Messiah himself. And the keys of the kingdom are the steward''s keys of David''s house: *the key of the house of David will I lay upon his shoulder; so he shall open, and none shall shut; and he shall shut, and none shall open* (Isaiah 22:22) — a stewardship entrusted under the Master''s authority. The library knew this Son before the worlds — *that Son of Adam was named In the presence of Yahuah (God) of Spirits, And his name before the Head of Days* (1 Enoch 48:2), *Yea, before the sun and the signs were created... His name was named before Yahuah (God) of Spirits* (1 Enoch 48:3): the Formed Son foreknown of the Father. John records the very confession on the same mouth — *we believe and are sure that thou art that Messiah (Christ), the Son of the living Elohim (God)* (John 6:69) — and Messiah holds Isaiah''s key himself: *he that hath the key of David, he that openeth, and no man shutteth; and shutteth, and no man openeth* (Revelation 3:7).',
       sv.verse_id, ev.verse_id, 'extras', 11456
  FROM _mt16_lookup sv, _mt16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=16 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-16-get-thee-behind-me-satan-he-must-suffer-many-things-isaiah-53',
       E'He must suffer many things and be killed and be raised — get thee behind me, Satan (Isaiah 53:3,5,10)',
       E'*From that time forth* Yahusha shews his disciples *how that he must go unto Jerusalem, and suffer many things... and be killed, and be raised again the third day* (16:21). Peter recoils — *Be it far from thee, Yahuah (Lord): this shall not be unto thee* (16:22) — and is answered, *Get thee behind me, Satan... thou savourest not the things that be of Elohim (God), but those that be of men* (16:23). For the suffering Peter would turn aside is the very thing Isaiah foretold: *He is despised and rejected of men; a man of sorrows, and acquainted with grief... he was despised, and we esteemed him not* (Isaiah 53:3). It is no accident but the appointed way of peace — *he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed* (Isaiah 53:5). And the killing and the rising stand together in one breath in the prophet, as in Yahusha''s own word: *Yet it pleased Yahuah (LORD) to bruise him; he hath put him to grief: when thou shalt make his soul an offering for sin, he shall see his seed, he shall prolong his days* (Isaiah 53:10) — bruised unto death, yet prolonging his days, raised the third day.',
       sv.verse_id, ev.verse_id, 'free', 11459
  FROM _mt16_lookup sv, _mt16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=16 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-16-take-up-the-cross-the-son-of-man-shall-come-in-glory-rewarding-psalm-49-daniel-7',
       E'Take up the cross — the Son of Adam comes in glory and rewards every man (Psalm 49:7-8; Proverbs 24:12; Daniel 7:13-14)',
       E'*If any man will come after me, let him deny himself, and take up his cross, and follow me* (16:24) — *whosoever will lose his life for my sake shall find it* (16:25). The same call stands in Luke with the whole walk in view: *let him deny himself, and take up his cross daily, and follow me* (Luke 9:23). And *what shall a man give in exchange for his soul?* (16:26) — the psalm long ago answered that no gain of the world can buy a soul back: *None of them can by any means redeem his brother, nor give to Elohim (God) a ransom for him* (Psalm 49:7), *(For the redemption of their soul is precious, and it ceaseth for ever:)* (Psalm 49:8). Then comes the day of reckoning: *the Son of Adam shall come in the glory of his Father with his angels; and then he shall reward every man according to his works* (16:27). That rendering is the Father''s own settled measure — *he that pondereth the heart consider it?... and shall not he render to every man according to his works?* (Proverbs 24:12). And the glory-coming is Daniel''s very vision — *behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days* (Daniel 7:13): one LIKE the Son of Adam, in the likeness, the comparative kept, the figure not flattened — *and there was given him dominion, and glory, and a kingdom... his dominion is an everlasting dominion* (Daniel 7:14): a kingdom GIVEN him by the Ancient of days, the glory of his Father received from the Father''s hand. The library''s own seer saw him seated to judge — *This is the Son of Adam who is born unto righteousness, And righteousness abides over him, And the righteousness of the Head of Days forsakes him not* (1 Enoch 62:7). And he comes not alone: *Yahuah Elohai (the LORD my God) shall come, and all the saints with thee* (Zechariah 14:5) — *with his angels*, the Son of Adam *coming in his kingdom* (16:28).',
       sv.verse_id, ev.verse_id, 'extras', 11462
  FROM _mt16_lookup sv, _mt16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=16 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- 3d. Thread members ----------------------------------------------------------
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jonah 1:17 — *three days and three nights* in the deep, the one sign granted.'
  FROM cross_reference_threads t, cross_references x, _mt16_lookup sv, _mt16_lookup tv
 WHERE t.slug='matthew-16-no-sign-but-the-prophet-jonah-the-signs-of-the-times-jonah-1'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 12:56 — they discern the sky but not *this time*; the same rebuke twice told.'
  FROM cross_reference_threads t, cross_references x, _mt16_lookup sv, _mt16_lookup tv
 WHERE t.slug='matthew-16-no-sign-but-the-prophet-jonah-the-signs-of-the-times-jonah-1'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=56
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 12:40 — Yahusha reads Jonah''s deep as the heart of the earth and the third-day rising.'
  FROM cross_reference_threads t, cross_references x, _mt16_lookup sv, _mt16_lookup tv
 WHERE t.slug='matthew-16-no-sign-but-the-prophet-jonah-the-signs-of-the-times-jonah-1'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 12:15 — the feast itself: leaven purged out, the small thing that works the whole.'
  FROM cross_reference_threads t, cross_references x, _mt16_lookup sv, _mt16_lookup tv
 WHERE t.slug='matthew-16-beware-the-leaven-of-the-pharisees-and-sadducees-exodus-12-1-corinthians-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hosea 7:4 — the prophet''s leaven: a heart secretly fermenting toward corruption.'
  FROM cross_reference_threads t, cross_references x, _mt16_lookup sv, _mt16_lookup tv
 WHERE t.slug='matthew-16-beware-the-leaven-of-the-pharisees-and-sadducees-exodus-12-1-corinthians-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=7 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 5:6 — *a little leaven leaveneth the whole lump*; the same Passover-grammar.'
  FROM cross_reference_threads t, cross_references x, _mt16_lookup sv, _mt16_lookup tv
 WHERE t.slug='matthew-16-beware-the-leaven-of-the-pharisees-and-sadducees-exodus-12-1-corinthians-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=5 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 5:8 — keep the feast without the leaven of malice and wickedness.'
  FROM cross_reference_threads t, cross_references x, _mt16_lookup sv, _mt16_lookup tv
 WHERE t.slug='matthew-16-beware-the-leaven-of-the-pharisees-and-sadducees-exodus-12-1-corinthians-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 2:7 — *Thou art my Son; this day have I begotten thee*; the Father''s own decree.'
  FROM cross_reference_threads t, cross_references x, _mt16_lookup sv, _mt16_lookup tv
 WHERE t.slug='matthew-16-thou-art-the-messiah-the-rock-and-the-keys-psalm-2-isaiah-22-isaiah-28'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Samuel 7:14 — *I will be his father, and he shall be my son*; the covenant Sonship.'
  FROM cross_reference_threads t, cross_references x, _mt16_lookup sv, _mt16_lookup tv
 WHERE t.slug='matthew-16-thou-art-the-messiah-the-rock-and-the-keys-psalm-2-isaiah-22-isaiah-28'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 2:45 — the stone cut *without hands*; the confession not of man''s quarrying.'
  FROM cross_reference_threads t, cross_references x, _mt16_lookup sv, _mt16_lookup tv
 WHERE t.slug='matthew-16-thou-art-the-messiah-the-rock-and-the-keys-psalm-2-isaiah-22-isaiah-28'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 28:16 — the tried stone, sure foundation; the Rock the assembly is built upon.'
  FROM cross_reference_threads t, cross_references x, _mt16_lookup sv, _mt16_lookup tv
 WHERE t.slug='matthew-16-thou-art-the-messiah-the-rock-and-the-keys-psalm-2-isaiah-22-isaiah-28'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=28 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 22:22 — *the key of the house of David*; the keys of the kingdom as stewardship.'
  FROM cross_reference_threads t, cross_references x, _mt16_lookup sv, _mt16_lookup tv
 WHERE t.slug='matthew-16-thou-art-the-messiah-the-rock-and-the-keys-psalm-2-isaiah-22-isaiah-28'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=22 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Enoch 48:2 — the Son of Adam named before the Head of Days; revealed by the Father.'
  FROM cross_reference_threads t, cross_references x, _mt16_lookup sv, _mt16_lookup tv
 WHERE t.slug='matthew-16-thou-art-the-messiah-the-rock-and-the-keys-psalm-2-isaiah-22-isaiah-28'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=16
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'1 Enoch 48:3 — his name named before the stars; the Formed Son foreknown of the Father.'
  FROM cross_reference_threads t, cross_references x, _mt16_lookup sv, _mt16_lookup tv
 WHERE t.slug='matthew-16-thou-art-the-messiah-the-rock-and-the-keys-psalm-2-isaiah-22-isaiah-28'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=16
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=48 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'John 6:69 — the very confession on the same mouth: *the Son of the living Elohim*.'
  FROM cross_reference_threads t, cross_references x, _mt16_lookup sv, _mt16_lookup tv
 WHERE t.slug='matthew-16-thou-art-the-messiah-the-rock-and-the-keys-psalm-2-isaiah-22-isaiah-28'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=69
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Revelation 3:7 — Messiah holds Isaiah''s key of David; openeth and none shutteth.'
  FROM cross_reference_threads t, cross_references x, _mt16_lookup sv, _mt16_lookup tv
 WHERE t.slug='matthew-16-thou-art-the-messiah-the-rock-and-the-keys-psalm-2-isaiah-22-isaiah-28'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:3 — *despised and rejected of men*; the suffering Peter recoiled from, foretold.'
  FROM cross_reference_threads t, cross_references x, _mt16_lookup sv, _mt16_lookup tv
 WHERE t.slug='matthew-16-get-thee-behind-me-satan-he-must-suffer-many-things-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 53:5 — *with his stripes we are healed*; the appointed way of peace, not an accident.'
  FROM cross_reference_threads t, cross_references x, _mt16_lookup sv, _mt16_lookup tv
 WHERE t.slug='matthew-16-get-thee-behind-me-satan-he-must-suffer-many-things-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 53:10 — bruised unto death yet *he shall prolong his days*; killed and raised in one breath.'
  FROM cross_reference_threads t, cross_references x, _mt16_lookup sv, _mt16_lookup tv
 WHERE t.slug='matthew-16-get-thee-behind-me-satan-he-must-suffer-many-things-isaiah-53'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 49:7 — none can redeem his brother nor ransom him; no exchange for a soul.'
  FROM cross_reference_threads t, cross_references x, _mt16_lookup sv, _mt16_lookup tv
 WHERE t.slug='matthew-16-take-up-the-cross-the-son-of-man-shall-come-in-glory-rewarding-psalm-49-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=49 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 49:8 — the redemption of the soul is precious; beyond all the world a man might gain.'
  FROM cross_reference_threads t, cross_references x, _mt16_lookup sv, _mt16_lookup tv
 WHERE t.slug='matthew-16-take-up-the-cross-the-son-of-man-shall-come-in-glory-rewarding-psalm-49-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=49 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 24:12 — he that pondereth the heart renders to every man according to his works.'
  FROM cross_reference_threads t, cross_references x, _mt16_lookup sv, _mt16_lookup tv
 WHERE t.slug='matthew-16-take-up-the-cross-the-son-of-man-shall-come-in-glory-rewarding-psalm-49-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=24 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 7:13 — *one like the Son of Adam* coming with the clouds; the kaph comparative kept.'
  FROM cross_reference_threads t, cross_references x, _mt16_lookup sv, _mt16_lookup tv
 WHERE t.slug='matthew-16-take-up-the-cross-the-son-of-man-shall-come-in-glory-rewarding-psalm-49-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Daniel 7:14 — dominion and a kingdom GIVEN him by the Ancient of days; received from the Father.'
  FROM cross_reference_threads t, cross_references x, _mt16_lookup sv, _mt16_lookup tv
 WHERE t.slug='matthew-16-take-up-the-cross-the-son-of-man-shall-come-in-glory-rewarding-psalm-49-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Enoch 62:7 — the Son of Adam born unto righteousness, the Head of Days behind him.'
  FROM cross_reference_threads t, cross_references x, _mt16_lookup sv, _mt16_lookup tv
 WHERE t.slug='matthew-16-take-up-the-cross-the-son-of-man-shall-come-in-glory-rewarding-psalm-49-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=27
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=62 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Zechariah 14:5 — *and all the saints with thee*; he comes not alone, with his angels.'
  FROM cross_reference_threads t, cross_references x, _mt16_lookup sv, _mt16_lookup tv
 WHERE t.slug='matthew-16-take-up-the-cross-the-son-of-man-shall-come-in-glory-rewarding-psalm-49-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=14 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Luke 9:23 — *take up his cross daily*; the whole walk of losing the life to find it.'
  FROM cross_reference_threads t, cross_references x, _mt16_lookup sv, _mt16_lookup tv
 WHERE t.slug='matthew-16-take-up-the-cross-the-son-of-man-shall-come-in-glory-rewarding-psalm-49-daniel-7'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=16 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=9 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
