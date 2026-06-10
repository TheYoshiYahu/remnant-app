-- ----- fragment: minion_hebrews_13.sql (S222 Hebrews 13) -----
-- =====================================================================
-- S222 minion — HEBREWS 13 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: HEBREWS 13 (the closing exhortations).  Tag: h13 (temp view _s222_h13_lookup).
-- Sort band: floor 7987, ceiling 7993, step 1 (sequential 7987..7991 used).
-- Source is ALWAYS the canon Hebrews verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: chapter 13 is the writer's closing string of exhortations, and each is
-- rooted in the Tanakh he has argued from all along. Brotherly love, hospitality, the marriage
-- bed, contentment, courage, praise — none of these is a new ethic; each is the old covenant
-- instruction now carried in a heart established by grace. WATCHPOINT v.9: *the heart be
-- established with grace; not with meats, which have not profited them that have been occupied
-- therein* — this is the false ascetic / sacrificial food-rules of the gainsayers (the
-- ceremonial-meat scruple that *cannot* establish the heart), NOT the clean-food Torah; Hebrews
-- never abolishes the dietary law. v.10-13: *we have an altar … the bodies of those beasts …
-- are burned without the camp* is the Day-of-Atonement pattern (Leviticus 16:27) read forward to
-- Yahusha who *suffered without the gate* — the sacrificial administration fulfilled in him, the
-- pattern honoured, not erased. v.15-16 the sacrifice of praise is the prophets' own *calves of
-- our lips* (Hosea 14:2). v.20 the *great shepherd … the blood of the everlasting covenant* is the
-- Shepherd brought up from the sea (Isaiah 63:11), the blood of the covenant (Zechariah 9:11), the
-- everlasting covenant of peace (Ezekiel 37:26). And v.8 holds the Christology: *Yahusha
-- HaMashiach (Jesus Christ) the same yesterday, and to day, and for ever* — the Formed who does
-- not change, the I-AM who took flesh and has a Father.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1     brotherly love continue
--           Tanakh: none added (carried in prose of the hospitality thread)  Extras: none warranted  NT: none warranted
--   v.2     entertain strangers / entertained angels unawares
--           Tanakh: Genesis 18:1-2 (Abraham at Mamre), Genesis 19:1-2 (Lot at the gate)  Extras: none warranted (Jasher/Jubilees parallels carry editorial noise; clean witness preferred)  NT: none warranted
--   v.3     remember them in bonds
--           Tanakh: none warranted  Extras: none warranted  NT: none warranted
--   v.4     marriage honourable, the bed undefiled, Elohim will judge
--           Tanakh: none warranted (no single load-bearing quote)  Extras: none warranted  NT: none warranted
--   v.5-6   I will never leave thee / Yahuah is my helper, I will not fear
--           Tanakh: Deuteronomy 31:6, Joshua 1:5 (he will not fail nor forsake), Psalm 118:6 (Yahuah is on my side, I will not fear)  Extras: none warranted  NT: none warranted
--   v.7     remember them which have the rule, whose faith follow
--           Tanakh: none warranted  Extras: none warranted  NT: none warranted
--   v.8     Yahusha the same yesterday and to day and for ever
--           Tanakh: none added (the unchanging-One; carried in prose of the shepherd thread)  Extras: none warranted  NT: none warranted
--   v.9     heart established with grace, not with meats
--           Tanakh: none warranted (WATCHPOINT — the false ascetic food-scruple, not the clean-food Torah)  Extras: none warranted  NT: none warranted
--   v.10-13 we have an altar / burned without the camp / suffered without the gate / go forth unto him
--           Tanakh: Leviticus 16:27 (the sin-offering carried forth and burned without the camp)  Extras: none warranted  NT: none warranted
--   v.14    here have we no continuing city, we seek one to come
--           Tanakh: none warranted (carried in prose of the without-the-camp thread)  Extras: none warranted  NT: none warranted
--   v.15-16 sacrifice of praise, the fruit of our lips / do good and communicate
--           Tanakh: Hosea 14:2 (calves of our lips), Psalm 50:14 (offer thanksgiving), Psalm 50:23 (whoso offereth praise glorifieth me)  Extras: none warranted  NT: none warranted
--   v.17-19 obey them that have the rule / pray for us
--           Tanakh: none warranted  Extras: none warranted  NT: none warranted
--   v.20-21 the Elohim of peace, the great shepherd, the blood of the everlasting covenant
--           Tanakh: Isaiah 63:11 (brought up from the sea with the shepherd), Zechariah 9:11 (by the blood of thy covenant), Ezekiel 37:26 (an everlasting covenant of peace)  Extras: none warranted  NT: none warranted
--   v.22-25 closing salutation, Timothy, Italy, grace be with you
--           Tanakh: none warranted  Extras: none warranted  NT: none warranted
--
-- THREADS (slug -> target libraries):
--   7987 hebrews-13-entertain-strangers-some-have-entertained-angels-genesis-18          (Tanakh)
--   7988 hebrews-13-i-will-never-leave-thee-nor-forsake-thee-deuteronomy-31              (Tanakh)
--   7989 hebrews-13-without-the-camp-bearing-his-reproach-leviticus-16                   (Tanakh)
--   7990 hebrews-13-the-sacrifice-of-praise-the-fruit-of-our-lips-hosea-14              (Tanakh)
--   7991 hebrews-13-the-great-shepherd-the-blood-of-the-everlasting-covenant-isaiah-63  (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s222_h13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hebrews-13-entertain-strangers-some-have-entertained-angels-genesis-18
  ('canon', 'hebrews', 13, 2, 'canon', 'genesis', 18, 1, 'free', E'*And Yahuah (LORD) appeared unto him in the plains of Mamre: and he sat in the tent door in the heat of the day;* (Genesis 18:1). When the writer says *be not forgetful to entertain strangers: for thereby some have entertained angels unawares* (Hebrews 13:2), this is the scene he has in hand. Abraham sat in the tent door and Yahuah (LORD) himself appeared in the plains of Mamre — the Formed One, come as a traveller. The hospitality of the covenant is no small courtesy; it received the visitation of Yahuah and his messengers, unawares.'),
  ('canon', 'hebrews', 13, 2, 'canon', 'genesis', 18, 2, 'free', E'*And he lift up his eyes and looked, and, lo, three men stood by him: and when he saw them, he ran to meet them from the tent door, and bowed himself toward the ground,* (Genesis 18:2). Abraham *ran to meet them* and *bowed himself toward the ground* — he did not yet know whom he served. *Some have entertained angels unawares* (Hebrews 13:2): the three who stood by Abraham were no ordinary wayfarers, and the welcome he gave the stranger was, all unknowing, a welcome given to heaven''s own.'),
  ('canon', 'hebrews', 13, 2, 'canon', 'genesis', 19, 1, 'free', E'*And there came two angels to Sodom at even; and Lot sat in the gate of Sodom: and Lot seeing them rose up to meet them; and he bowed himself with his face toward the ground;* (Genesis 19:1). The two who turned from Mamre came on to Sodom, and Lot too *rose up to meet them* at the gate. *Be not forgetful to entertain strangers* (Hebrews 13:2): twice in one account the welcome of strangers proved to be the welcome of angels, and the open door of the righteous became the door of their deliverance.'),
  -- thread: hebrews-13-i-will-never-leave-thee-nor-forsake-thee-deuteronomy-31
  ('canon', 'hebrews', 13, 5, 'canon', 'deuteronomy', 31, 6, 'free', E'*Be strong and of a good courage, fear not, nor be afraid of them: for Yahuah Elohayka (the LORD thy God), he it is that doth go with thee; he will not fail thee, nor forsake thee.* (Deuteronomy 31:6). The writer grounds contentment on a promise older than the epistle: *be content with such things as ye have: for he hath said, I will never leave thee, nor forsake thee* (Hebrews 13:5). It is the very word Moses spoke to all Yashar''el (Israel) at the edge of the land — *he will not fail thee, nor forsake thee.* The covetous heart grasps because it fears abandonment; the contented heart rests on the One who said he would never leave.'),
  ('canon', 'hebrews', 13, 5, 'canon', 'joshua', 1, 5, 'free', E'*There shall not any man be able to stand before thee all the days of thy life: as I was with Moses, so I will be with thee: I will not fail thee, nor forsake thee.* (Joshua 1:5). The same pledge Moses gave the people, Yahuah (LORD) gave again to Joshua at the crossing: *I will not fail thee, nor forsake thee.* When Hebrews says *he hath said, I will never leave thee, nor forsake thee* (Hebrews 13:5), it draws on a word spoken and re-spoken across the generations — the abiding presence that frees the heart from covetous fear.'),
  ('canon', 'hebrews', 13, 6, 'canon', 'psalms', 118, 6, 'free', E'*Yahuah (LORD) is on my side; I will not fear: what can man do unto me?* (Psalm 118:6). Because the promise stands, the writer draws the psalmist''s own conclusion: *so that we may boldly say, Yahuah (Lord) is my helper, and I will not fear what man shall do unto me* (Hebrews 13:6). The One who will never forsake is the One on my side; with him as helper, the fear of man falls away. The bold confession of Hebrews is the psalm sung forward.'),
  -- thread: hebrews-13-without-the-camp-bearing-his-reproach-leviticus-16
  ('canon', 'hebrews', 13, 11, 'canon', 'leviticus', 16, 27, 'free', E'*And the bullock for the sin offering, and the goat for the sin offering, whose blood was brought in to make atonement in the holy place, shall one carry forth without the camp; and they shall burn in the fire their skins, and their flesh, and their dung.* (Leviticus 16:27). The writer reads the Day of Atonement exactly: *the bodies of those beasts, whose blood is brought into the sanctuary by the high priest for sin, are burned without the camp* (Hebrews 13:11). The blood went into the holy place; the bodies went outside to be consumed. This is the ordained pattern Yahuah (LORD) gave, and the writer does not discard it — he reads it forward to its fulfilment.'),
  ('canon', 'hebrews', 13, 12, 'canon', 'leviticus', 16, 27, 'free', E'*And the bullock for the sin offering, and the goat for the sin offering, whose blood was brought in to make atonement in the holy place, shall one carry forth without the camp; and they shall burn in the fire their skins, and their flesh, and their dung.* (Leviticus 16:27). As the sin-offering was carried *without the camp,* so *Yahusha (Jesus) also, that he might sanctify the people with his own blood, suffered without the gate* (Hebrews 13:12). The pattern is not abolished but fulfilled: the body offered outside, the blood that sanctifies — Yahusha is both the high priest and the offering the atonement-day rite foreshadowed.'),
  -- thread: hebrews-13-the-sacrifice-of-praise-the-fruit-of-our-lips-hosea-14
  ('canon', 'hebrews', 13, 15, 'canon', 'hosea', 14, 2, 'free', E'*Take with you words, and turn to Yahuah (LORD): say unto him, Take away all iniquity, and receive us graciously: so will we render the calves of our lips.* (Hosea 14:2). *By him therefore let us offer the sacrifice of praise to Elohim (God) continually, that is, the fruit of our lips giving thanks to his name* (Hebrews 13:15). The fruit of the lips is the prophet''s *calves of our lips* — the offering of words and thanksgiving Hosea called the returning people to bring. The praise that ascends is the prophets'' own appointed sacrifice, now offered through the Mediator.'),
  ('canon', 'hebrews', 13, 15, 'canon', 'psalms', 50, 14, 'free', E'*Offer unto Elohim (God) thanksgiving; and pay thy vows unto the El Elyon (most High):* (Psalm 50:14). The *sacrifice of praise … the fruit of our lips giving thanks to his name* (Hebrews 13:15) is the very offering the psalm sets above slain beasts: *offer unto Elohim (God) thanksgiving.* What pleases the Most High is not the blood of bulls but the thankful heart and the paid vow — the sacrifice Hebrews calls the people to offer continually.'),
  ('canon', 'hebrews', 13, 16, 'canon', 'psalms', 50, 23, 'free', E'*Whoso offereth praise glorifieth me: and to him that ordereth his conversation aright will I shew the salvation of Elohim (God).* (Psalm 50:23). *But to do good and to communicate forget not: for with such sacrifices Elohim (God) is well pleased* (Hebrews 13:16). The psalm joins the two the writer joins: the praise that glorifies, and the ordered walk that does good. Such are the sacrifices that please — the lips that thank and the hands that share.'),
  -- thread: hebrews-13-the-great-shepherd-the-blood-of-the-everlasting-covenant-isaiah-63
  ('canon', 'hebrews', 13, 20, 'canon', 'isaiah', 63, 11, 'free', E'*Then he remembered the days of old, Moses, and his people, saying, Where is he that brought them up out of the sea with the shepherd of his flock? where is he that put his holy Spirit within him?* (Isaiah 63:11). *Now the Elohim (God) of peace, that brought again from the dead our Lord Yahusha (Lord Jesus), that great shepherd of the sheep* (Hebrews 13:20). The prophet asked after the One who *brought them up out of the sea with the shepherd of his flock;* the writer answers with the greater bringing-up — the Shepherd himself brought again from the dead. The Elohim of peace who raised the great shepherd is the same who once led the flock through the sea.'),
  ('canon', 'hebrews', 13, 20, 'canon', 'zechariah', 9, 11, 'free', E'*As for thee also, by the blood of thy covenant I have sent forth thy prisoners out of the pit wherein is no water.* (Zechariah 9:11). The *great shepherd of the sheep* was brought again from the dead *through the blood of the everlasting covenant* (Hebrews 13:20). The prophet had named that blood: *by the blood of thy covenant I have sent forth thy prisoners out of the pit.* The covenant-blood that frees the prisoner from the waterless pit is the same blood by which the Shepherd was raised — deliverance and resurrection sealed in one covenant.'),
  ('canon', 'hebrews', 13, 20, 'canon', 'ezekiel', 37, 26, 'free', E'*Moreover I will make a covenant of peace with them; it shall be an everlasting covenant with them: and I will place them, and multiply them, and will set my sanctuary in the midst of them for evermore.* (Ezekiel 37:26). The *blood of the everlasting covenant* (Hebrews 13:20) is the blood of the covenant the prophet promised: *an everlasting covenant … a covenant of peace.* And it is the Elohim *of peace* who raises the Shepherd — the everlasting covenant of peace, sealed in his blood, the sanctuary set in the midst of the gathered flock for evermore.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s222_h13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s222_h13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-13-entertain-strangers-some-have-entertained-angels-genesis-18',
       E'Entertain strangers — some have entertained angels unawares',
       E'*Be not forgetful to entertain strangers: for thereby some have entertained angels unawares* (Hebrews 13:2). The writer is not coining a new courtesy; he is pointing the reader back to a scene every covenant child knew. *And Yahuah (LORD) appeared unto him in the plains of Mamre: and he sat in the tent door in the heat of the day* (Genesis 18:1) — and *lo, three men stood by him: and when he saw them, he ran to meet them from the tent door, and bowed himself toward the ground* (Genesis 18:2). Abraham did not yet know whom he served; he ran, he bowed, he set bread before strangers in the heat of the day, and the strangers were Yahuah (LORD) and his messengers. The same wayfarers turned on to Sodom: *and there came two angels to Sodom at even; and Lot sat in the gate of Sodom: and Lot seeing them rose up to meet them; and he bowed himself with his face toward the ground* (Genesis 19:1), and the open door of the righteous became the door of his deliverance. Twice in one account the welcome of the stranger proved to be the welcome of angels. So *be not forgetful* — the brotherly love that *continue[s]* (Hebrews 13:1) opens its door not knowing whom it receives, and heaven itself has walked through such doors before.',
       sv.verse_id, ev.verse_id, 'free', 7987
  FROM _s222_h13_lookup sv, _s222_h13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=13 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-13-i-will-never-leave-thee-nor-forsake-thee-deuteronomy-31',
       E'I will never leave thee, nor forsake thee — Yahuah is my helper',
       E'The writer grounds contentment on a word older than the epistle. *Let your conversation be without covetousness; and be content with such things as ye have: for he hath said, I will never leave thee, nor forsake thee* (Hebrews 13:5). That word was spoken by Moses to all Yashar''el (Israel) at the edge of the land: *be strong and of a good courage, fear not, nor be afraid of them: for Yahuah Elohayka (the LORD thy God), he it is that doth go with thee; he will not fail thee, nor forsake thee* (Deuteronomy 31:6) — and given again to Joshua at the crossing: *as I was with Moses, so I will be with thee: I will not fail thee, nor forsake thee* (Joshua 1:5). The covetous heart grasps because it fears abandonment; the contented heart rests on the One who pledged he would never leave. And because that promise stands, the bold confession follows, drawn straight from the psalm: *so that we may boldly say, Yahuah (Lord) is my helper, and I will not fear what man shall do unto me* (Hebrews 13:6) — *Yahuah (LORD) is on my side; I will not fear: what can man do unto me?* (Psalm 118:6). The One who will never forsake is the One on my side; with him as helper, the fear of man falls away.',
       sv.verse_id, ev.verse_id, 'free', 7988
  FROM _s222_h13_lookup sv, _s222_h13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=13 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-13-without-the-camp-bearing-his-reproach-leviticus-16',
       E'Without the camp, bearing his reproach — the sin-offering burned outside',
       E'*We have an altar, whereof they have no right to eat which serve the tabernacle* (Hebrews 13:10). The writer is reading the Day of Atonement, and he reads it exactly. *For the bodies of those beasts, whose blood is brought into the sanctuary by the high priest for sin, are burned without the camp* (Hebrews 13:11) — which is precisely the ordinance: *the bullock for the sin offering, and the goat for the sin offering, whose blood was brought in to make atonement in the holy place, shall one carry forth without the camp; and they shall burn in the fire their skins, and their flesh, and their dung* (Leviticus 16:27). The blood went into the holy place; the body went outside to be consumed. This ordained pattern the writer does not discard — he reads it forward to its fulfilment: *wherefore Yahusha (Jesus) also, that he might sanctify the people with his own blood, suffered without the gate* (Hebrews 13:12). The sin-offering carried outside the camp is the Messiah crucified outside the gate, both high priest and offering at once. And so the call: *let us go forth therefore unto him without the camp, bearing his reproach* (Hebrews 13:13), *for here have we no continuing city, but we seek one to come* (Hebrews 13:14). The shadow is not erased; it is filled full, and the people follow the Offering outside the gate.',
       sv.verse_id, ev.verse_id, 'free', 7989
  FROM _s222_h13_lookup sv, _s222_h13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=13 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-13-the-sacrifice-of-praise-the-fruit-of-our-lips-hosea-14',
       E'The sacrifice of praise, the fruit of our lips — the calves of our lips',
       E'*By him therefore let us offer the sacrifice of praise to Elohim (God) continually, that is, the fruit of our lips giving thanks to his name* (Hebrews 13:15). The *fruit of our lips* is the prophet''s own phrase for the offering the returning people bring: *take with you words, and turn to Yahuah (LORD): say unto him, Take away all iniquity, and receive us graciously: so will we render the calves of our lips* (Hosea 14:2). And it is the offering the psalm sets above slain beasts: *offer unto Elohim (God) thanksgiving; and pay thy vows unto the El Elyon (most High)* (Psalm 50:14); *whoso offereth praise glorifieth me: and to him that ordereth his conversation aright will I shew the salvation of Elohim (God)* (Psalm 50:23). The psalm binds the two the writer binds — the lips that thank and the walk that does good: *but to do good and to communicate forget not: for with such sacrifices Elohim (God) is well pleased* (Hebrews 13:16). This is no new worship. The thankful heart, the paid vow, the ordered walk, the open hand — these were always the sacrifices that please, and now they ascend continually through the Mediator.',
       sv.verse_id, ev.verse_id, 'free', 7990
  FROM _s222_h13_lookup sv, _s222_h13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=13 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hebrews-13-the-great-shepherd-the-blood-of-the-everlasting-covenant-isaiah-63',
       E'The great shepherd, the blood of the everlasting covenant',
       E'*Now the Elohim (God) of peace, that brought again from the dead our Lord Yahusha (Lord Jesus), that great shepherd of the sheep, through the blood of the everlasting covenant* (Hebrews 13:20). Every clause of the benediction is the prophets'' own. The prophet had asked after the Shepherd led through the waters: *then he remembered the days of old, Moses, and his people, saying, Where is he that brought them up out of the sea with the shepherd of his flock? where is he that put his holy Spirit within him?* (Isaiah 63:11) — and the writer answers with the greater bringing-up, the Shepherd himself brought again from the dead. The covenant-blood was named by the prophet too: *as for thee also, by the blood of thy covenant I have sent forth thy prisoners out of the pit wherein is no water* (Zechariah 9:11) — the blood that frees the prisoner from the waterless pit is the blood by which the Shepherd was raised. And it is an *everlasting* covenant, as the prophet foretold: *moreover I will make a covenant of peace with them; it shall be an everlasting covenant with them: and I will place them, and multiply them, and will set my sanctuary in the midst of them for evermore* (Ezekiel 37:26). The Elohim *of peace* raises the great shepherd by the blood of the everlasting covenant of peace — and the same Shepherd is *Yahusha HaMashiach (Jesus Christ) the same yesterday, and to day, and for ever* (Hebrews 13:8), the unchanging One who led the flock through the sea and was brought up again from the dead to lead it home.',
       sv.verse_id, ev.verse_id, 'free', 7991
  FROM _s222_h13_lookup sv, _s222_h13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=20
   AND ev.edition_slug='canon' AND ev.book_slug='hebrews' AND ev.chapter_number=13 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hebrews-13-entertain-strangers-some-have-entertained-angels-genesis-18
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 18:1 — *Yahuah (LORD) appeared unto him in the plains of Mamre: and he sat in the tent door in the heat of the day* Abraham''s welcome of strangers received the visitation of Yahuah himself (Hebrews 13:2).'
  FROM cross_reference_threads t, cross_references x, _s222_h13_lookup sv, _s222_h13_lookup tv
 WHERE t.slug='hebrews-13-entertain-strangers-some-have-entertained-angels-genesis-18'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 18:2 — *he ran to meet them from the tent door, and bowed himself toward the ground* he entertained angels unawares (Hebrews 13:2).'
  FROM cross_reference_threads t, cross_references x, _s222_h13_lookup sv, _s222_h13_lookup tv
 WHERE t.slug='hebrews-13-entertain-strangers-some-have-entertained-angels-genesis-18'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 19:1 — *there came two angels to Sodom at even; and Lot sat in the gate of Sodom … and he bowed himself* the same strangers, the same welcome, the door of deliverance (Hebrews 13:2).'
  FROM cross_reference_threads t, cross_references x, _s222_h13_lookup sv, _s222_h13_lookup tv
 WHERE t.slug='hebrews-13-entertain-strangers-some-have-entertained-angels-genesis-18'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-13-i-will-never-leave-thee-nor-forsake-thee-deuteronomy-31
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 31:6 — *he will not fail thee, nor forsake thee* Moses'' word to all Yashar''el (Israel) is the promise that frees the heart from covetous fear (Hebrews 13:5).'
  FROM cross_reference_threads t, cross_references x, _s222_h13_lookup sv, _s222_h13_lookup tv
 WHERE t.slug='hebrews-13-i-will-never-leave-thee-nor-forsake-thee-deuteronomy-31'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 1:5 — *as I was with Moses, so I will be with thee: I will not fail thee, nor forsake thee* the same pledge re-spoken at the crossing (Hebrews 13:5).'
  FROM cross_reference_threads t, cross_references x, _s222_h13_lookup sv, _s222_h13_lookup tv
 WHERE t.slug='hebrews-13-i-will-never-leave-thee-nor-forsake-thee-deuteronomy-31'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 118:6 — *Yahuah (LORD) is on my side; I will not fear: what can man do unto me?* the bold confession Hebrews sings forward (Hebrews 13:6).'
  FROM cross_reference_threads t, cross_references x, _s222_h13_lookup sv, _s222_h13_lookup tv
 WHERE t.slug='hebrews-13-i-will-never-leave-thee-nor-forsake-thee-deuteronomy-31'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=118 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-13-without-the-camp-bearing-his-reproach-leviticus-16
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 16:27 — *whose blood was brought in to make atonement in the holy place, shall one carry forth without the camp* the Day-of-Atonement pattern the writer reads exactly (Hebrews 13:11).'
  FROM cross_reference_threads t, cross_references x, _s222_h13_lookup sv, _s222_h13_lookup tv
 WHERE t.slug='hebrews-13-without-the-camp-bearing-his-reproach-leviticus-16'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 16:27 — *shall one carry forth without the camp* so Yahusha *suffered without the gate,* the offering carried outside fulfilled (Hebrews 13:12).'
  FROM cross_reference_threads t, cross_references x, _s222_h13_lookup sv, _s222_h13_lookup tv
 WHERE t.slug='hebrews-13-without-the-camp-bearing-his-reproach-leviticus-16'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-13-the-sacrifice-of-praise-the-fruit-of-our-lips-hosea-14
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hosea 14:2 — *so will we render the calves of our lips* the fruit of the lips is the prophet''s appointed offering of words and thanksgiving (Hebrews 13:15).'
  FROM cross_reference_threads t, cross_references x, _s222_h13_lookup sv, _s222_h13_lookup tv
 WHERE t.slug='hebrews-13-the-sacrifice-of-praise-the-fruit-of-our-lips-hosea-14'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=14 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 50:14 — *offer unto Elohim (God) thanksgiving; and pay thy vows unto the El Elyon (most High)* the thank-offering set above slain beasts (Hebrews 13:15).'
  FROM cross_reference_threads t, cross_references x, _s222_h13_lookup sv, _s222_h13_lookup tv
 WHERE t.slug='hebrews-13-the-sacrifice-of-praise-the-fruit-of-our-lips-hosea-14'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=50 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 50:23 — *whoso offereth praise glorifieth me: and to him that ordereth his conversation aright* the praise and the ordered walk Hebrews binds together (Hebrews 13:16).'
  FROM cross_reference_threads t, cross_references x, _s222_h13_lookup sv, _s222_h13_lookup tv
 WHERE t.slug='hebrews-13-the-sacrifice-of-praise-the-fruit-of-our-lips-hosea-14'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=50 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hebrews-13-the-great-shepherd-the-blood-of-the-everlasting-covenant-isaiah-63
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 63:11 — *Where is he that brought them up out of the sea with the shepherd of his flock?* the Shepherd led through the waters, now brought again from the dead (Hebrews 13:20).'
  FROM cross_reference_threads t, cross_references x, _s222_h13_lookup sv, _s222_h13_lookup tv
 WHERE t.slug='hebrews-13-the-great-shepherd-the-blood-of-the-everlasting-covenant-isaiah-63'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=63 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 9:11 — *by the blood of thy covenant I have sent forth thy prisoners out of the pit* the covenant-blood by which the Shepherd was raised (Hebrews 13:20).'
  FROM cross_reference_threads t, cross_references x, _s222_h13_lookup sv, _s222_h13_lookup tv
 WHERE t.slug='hebrews-13-the-great-shepherd-the-blood-of-the-everlasting-covenant-isaiah-63'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=9 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 37:26 — *it shall be an everlasting covenant with them … a covenant of peace* the everlasting covenant of peace the Elohim of peace seals in the Shepherd''s blood (Hebrews 13:20).'
  FROM cross_reference_threads t, cross_references x, _s222_h13_lookup sv, _s222_h13_lookup tv
 WHERE t.slug='hebrews-13-the-great-shepherd-the-blood-of-the-everlasting-covenant-isaiah-63'
   AND sv.edition_slug='canon' AND sv.book_slug='hebrews' AND sv.chapter_number=13 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
