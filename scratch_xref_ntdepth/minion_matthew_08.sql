-- ----- fragment: minion_matthew_08.sql (S260 Matthew depth) -----
-- ============================================================================
-- Matthew 8 — full-library cross-reference threads (NT DEPTH pass)
-- 6 threads / 33 members. Band 11210 step +3. Temp-view tag _mt08_lookup.
-- ============================================================================

-- 3a. Temp view -------------------------------------------------------------
CREATE TEMP VIEW _mt08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- 3b. cross_references rows --------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- THREAD 1: the leper / offer the gift Moses commanded (8:1-4) ------------
  ('canon','matthew',8,4,'canon','leviticus',13,45, 'free', E'*And the leper in whom the plague is, his clothes shall be rent, and his head bare, and he shall put a covering upon his upper lip, and shall cry, Unclean, unclean* (Leviticus 13:45). The Torah set the leper outside the camp, crying his own uncleanness — and only the Torah could bring him back.'),
  ('canon','matthew',8,4,'canon','leviticus',14,2, 'free', E'*This shall be the law of the leper in the day of his cleansing: He shall be brought unto the priest* (Leviticus 14:2). When Yahusha (Jesus) says *go thy way, shew thyself to the priest, and offer the gift that Moses commanded*, He is sending the cleansed man straight into THIS chapter — He upholds the Torah, He does not abolish it.'),
  ('canon','matthew',8,4,'canon','leviticus',14,4, 'free', E'*Then shall the priest command to take for him that is to be cleansed two birds alive and clean, and cedar wood, and scarlet, and hyssop* (Leviticus 14:4). The very gift Moses commanded — Yahusha (Jesus) honours it to the letter, *for a testimony unto them*.'),
  ('canon','matthew',8,4,'canon','2-kings',5,14, 'free', E'*Then went he down, and dipped himself seven times in Jordan, according to the saying of the man of Elohim (God): and his flesh came again like unto the flesh of a little child, and he was clean* (2 Kings 5:14). Naaman the leper made whole by obedience — a foreshadow of the cleansing touch.'),

  -- THREAD 2: the centurion / east and west to the feast (8:5-13) -----------
  ('canon','matthew',8,11,'canon','isaiah',25,6, 'free', E'*And in this mountain shall Yahuah Tseva''ot (LORD of hosts) make unto all people a feast of fat things, a feast of wines on the lees, of fat things full of marrow, of wines on the lees well refined* (Isaiah 25:6). *Many shall come from the east and west, and shall sit down with Abraham, and Isaac, and Jacob* — this is that mountain feast for all people.'),
  ('canon','matthew',8,11,'canon','isaiah',49,12, 'free', E'*Behold, these shall come from far: and, lo, these from the north and from the west; and these from the land of Sinim* (Isaiah 49:12). The scattered drawn home from every quarter — the gathering Yahusha (Jesus) sees in this one believing soldier.'),
  ('canon','matthew',8,11,'canon','psalms',107,3, 'free', E'*And gathered them out of the lands, from the east, and from the west, from the north, and from the south* (Psalm 107:3). The redeemed of Yahuah brought in from the four winds — scattered Yashar''el coming home and the stranger grafted in.'),
  ('canon','matthew',8,11,'canon','malachi',1,11, 'free', E'*For from the rising of the sun even unto the going down of the same my name shall be great among the Gentiles; and in every place incense shall be offered unto my name, and a pure offering: for my name shall be great among the heathen, saith Yahuah Tseva''ot (LORD of hosts)* (Malachi 1:11). The nations brought near — the centurion is the firstfruit.'),
  ('canon','matthew',8,12,'canon','romans',11,1, 'free', E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1). *The children of the kingdom cast out* is INDIVIDUAL unbelief, never the casting off of Yashar''el as a people — read it through this guard.'),
  ('canon','matthew',8,12,'canon','romans',11,2, 'free', E'*Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2). The warning of verse 12 falls on the unbelieving heart, not on the nation; the feast GAINS the believing stranger, it does not disinherit Israel.'),
  ('canon','matthew',8,11,'canon','luke',13,29, 'free', E'*And they shall come from the east, and from the west, and from the north, and from the south, and shall sit down in the kingdom of Elohim (God)* (Luke 13:29). The same word in Luke — the gathering to the table of the fathers.'),

  -- THREAD 3: himself took our infirmities (8:14-17) ------------------------
  ('canon','matthew',8,17,'canon','isaiah',53,4, 'free', E'*Surely he hath borne our griefs, and carried our sorrows: yet we did esteem him stricken, smitten of Elohim (God), and afflicted* (Isaiah 53:4). Matthew names the prophet and quotes him — *Himself took our infirmities, and bare our sicknesses* IS Isaiah 53:4. The suffering Servant bearing what is ours.'),
  ('canon','matthew',8,17,'canon','psalms',103,3, 'free', E'*Who forgiveth all thine iniquities; who healeth all thy diseases* (Psalm 103:3). The healing of the body and the forgiving of the soul flow from one hand — the Formed Son does the Father''s healing work.'),
  ('canon','matthew',8,17,'canon','2-kings',5,14, 'free', E'*and his flesh came again like unto the flesh of a little child, and he was clean* (2 Kings 5:14). Israel''s prophets bore healing as a sign; in Yahusha (Jesus) the sign is fulfilled — He took the infirmities He healed.'),

  -- THREAD 4: the Son of man hath not where to lay his head (8:18-22) -------
  ('canon','matthew',8,20,'canon','daniel',7,13, 'extras', E'*I saw in the night visions, and, behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days* (Daniel 7:13). Yahusha (Jesus) takes the very title — *the Son of Adam* — yet note the kaph, *one LIKE the Son of Adam*: He comes in the likeness, the Formed Son brought near before the Ancient of days, not flattened into a mere man nor a second deity.'),
  ('canon','matthew',8,20,'canon','psalms',109,25, 'free', E'*I became also a reproach unto them: when they looked upon me they shaked their heads* (Psalm 109:25). The Son of Adam *hath not where to lay his head* — the despised, homeless path the righteous sufferer walks.'),
  ('canon','matthew',8,20,'enoch','1-enoch',46,3, 'extras', E'*This is the Son of Adam who hath righteousness, with whom dwelleth righteousness, and who revealeth all the treasures of that which is hidden, because Yahuah (God) of Spirits hath chosen him* (1 Enoch 46:3). The library''s own Son-of-Adam witness — the heavenly figure of Daniel 7 named and exalted, chosen by Yahuah of Spirits, the One the prophets looked toward.'),
  ('canon','matthew',8,20,'canon','luke',9,58, 'free', E'*Foxes have holes, and birds of the air have nests; but the Son of Adam hath not where to lay his head* (Luke 9:58). The same saying in Luke — the cost of following Him, all the way down.'),

  -- THREAD 5: he rebukes the wind and sea (8:23-27) ------------------------
  ('canon','matthew',8,26,'canon','psalms',107,28, 'free', E'*Then they cry unto Yahuah (LORD) in their trouble, and he bringeth them out of their distresses* (Psalm 107:28). The mariners cried to Yahuah in the tempest — the disciples cry *Lord, save us; we perish* — and the answer is the same hand.'),
  ('canon','matthew',8,26,'canon','psalms',107,29, 'free', E'*He maketh the storm a calm, so that the waves thereof are still* (Psalm 107:29). What the Psalm says Yahuah does, the disciples watch Yahusha (Jesus) do — *he rebuked the winds and the sea; and there was a great calm.*'),
  ('canon','matthew',8,26,'canon','psalms',89,9, 'free', E'*Thou rulest the raging of the sea: when the waves thereof arise, thou stillest them* (Psalm 89:9). The Creator''s own authority over the deep — exercised here in the Formed Son, through whom the Father stills the sea.'),
  ('canon','matthew',8,27,'canon','psalms',65,7, 'free', E'*Which stilleth the noise of the seas, the noise of their waves, and the tumult of the people* (Psalm 65:7). *What manner of man is this, that even the winds and the sea obey him!* — He is the One the Psalm sang of.'),
  ('canon','matthew',8,27,'canon','job',38,11, 'free', E'*And said, Hitherto shalt thou come, but no further: and here shall thy proud waves be stayed?* (Job 38:11). The voice that set the bounds of the sea at creation now speaks from a fishing boat — the Father''s authority in the Son.'),
  ('canon','matthew',8,26,'canon','jonah',1,15, 'free', E'*So they took up Jonah, and cast him forth into the sea: and the sea ceased from her raging* (Jonah 1:15). A greater than Jonah is here — asleep in the storm, then rising to still it with a word.'),

  -- THREAD 6: the Gadarene demoniacs / the swine (8:28-34) ------------------
  ('canon','matthew',8,29,'enoch','1-enoch',15,8, 'extras', E'*As for the spirits of heaven, in heaven shall be their dwelling, but as for the spirits of the earth which were born upon the earth, on the earth shall be their dwelling* (1 Enoch 15:8). The library tells where these unclean spirits came from — the spirits of the giants, earth-bound, given over to the earth.'),
  ('canon','matthew',8,29,'enoch','1-enoch',15,9, 'extras', E'*And the spirits of the giants afflict, oppress, destroy, attack, do battle, and work destruction on the earth, and cause trouble* (1 Enoch 15:9). The very work of the demons in the tombs — afflicting, destroying — and they know their judgement is coming.'),
  ('canon','matthew',8,29,'enoch','1-enoch',15,11, 'extras', E'*from the souls of whose flesh the spirits, having gone forth, shall destroy without incurring judgement—thus shall they destroy until the day of the consummation, the great judgement* (1 Enoch 15:11). This is why they cry *art thou come hither to torment us before the time?* — they know the appointed day of the great judgement, and they tremble that He is here.'),
  ('canon','matthew',8,30,'canon','isaiah',65,4, 'free', E'*Which remain among the graves, and lodge in the monuments, which eat swine''s flesh, and broth of abominable things is in their vessels* (Isaiah 65:4). The unclean herd by the tombs — graves, monuments, and swine''s flesh — Isaiah''s very picture of defilement; the demons find their fit company there.'),
  ('canon','matthew',8,31,'canon','psalms',106,37, 'free', E'*Yea, they sacrificed their sons and their daughters unto devils* (Psalm 106:37). The land in bondage to devils — and the whole herd runs to its destruction in the sea, while the men are set free and the devils are subject to the Son.'),
  ('canon','matthew',8,29,'canon','romans',11,2, 'free', E'*Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2). Even in the Gentile coasts of the Gergesenes the Son of Elohim reigns over the spirits — the gathering reaches every land, Israel never cast off.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _mt08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _mt08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- 3c. threads ----------------------------------------------------------------
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-8-the-leper-offer-the-gift-moses-commanded-leviticus-14-2-kings-5',
       E'The leper cleansed — go, offer the gift that Moses commanded (Leviticus 13–14; 2 Kings 5)',
       E'When the leper worships and pleads *if thou wilt, thou canst make me clean*, Yahusha (Jesus) reaches out, touches the untouchable, and heals him — and then look where He sends him. *See thou tell no man; but go thy way, shew thyself to the priest, and offer the gift that Moses commanded, for a testimony unto them.* The Torah had put this man outside the camp: *And the leper in whom the plague is, his clothes shall be rent, and his head bare, and he shall put a covering upon his upper lip, and shall cry, Unclean, unclean* (Leviticus 13:45). And the Torah was the only road back: *This shall be the law of the leper in the day of his cleansing: He shall be brought unto the priest* (Leviticus 14:2), who would *take for him that is to be cleansed two birds alive and clean, and cedar wood, and scarlet, and hyssop* (Leviticus 14:4). Yahusha (Jesus) sends the healed man straight into that chapter — He upholds the Torah, He does not abolish it. The same pattern stands in *Then went he down, and dipped himself seven times in Jordan... and his flesh came again like unto the flesh of a little child, and he was clean* (2 Kings 5:14): Naaman the leper made whole by humble obedience. Come and see — the One who heals is the One who keeps Moses'' word.',
       sv.verse_id, ev.verse_id, 'free', 11210
  FROM _mt08_lookup sv, _mt08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=8 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-8-many-from-east-and-west-sit-with-abraham-isaiah-25-malachi-1',
       E'Many shall come from east and west to the feast with Abraham (Isaiah 25; Malachi 1; Romans 11)',
       E'A Roman centurion — a Gentile soldier — believes that a word at a distance can heal, and Yahusha (Jesus) marvels: *I have not found so great faith, no, not in Yashar''el (Israel).* Then He opens the table: *many shall come from the east and west, and shall sit down with Abraham, and Isaac, and Jacob, in the kingdom of heaven.* This is the mountain feast of the prophets — *And in this mountain shall Yahuah Tseva''ot (LORD of hosts) make unto all people a feast of fat things* (Isaiah 25:6) — the scattered drawn home from every quarter: *Behold, these shall come from far: and, lo, these from the north and from the west* (Isaiah 49:12), *gathered... from the east, and from the west, from the north, and from the south* (Psalm 107:3), so that *from the rising of the sun even unto the going down of the same my name shall be great among the Gentiles* (Malachi 1:11). Luke sings the same: *they shall come from the east, and from the west... and shall sit down in the kingdom of Elohim (God)* (Luke 13:29). But hear the warning rightly — *the children of the kingdom shall be cast out* is individual unbelief, NOT the casting off of the nation. *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1); *Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2). The feast GAINS the believing stranger and gathers scattered Yashar''el home — it never disinherits Israel.',
       sv.verse_id, ev.verse_id, 'free', 11213
  FROM _mt08_lookup sv, _mt08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=8 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-8-himself-took-our-infirmities-isaiah-53-4-psalm-103',
       E'Himself took our infirmities and bare our sicknesses (Isaiah 53:4; Psalm 103)',
       E'At evening they bring Him the sick and the oppressed, and He casts out the spirits with a word and heals them all — *That it might be fulfilled which was spoken by Esaias the prophet, saying, Himself took our infirmities, and bare our sicknesses.* Matthew names the prophet and quotes him outright: *Surely he hath borne our griefs, and carried our sorrows: yet we did esteem him stricken, smitten of Elohim (God), and afflicted* (Isaiah 53:4). This is the suffering Servant of Isaiah 53, bearing what is ours — not waving sickness away from a distance, but TAKING it. The healing and the pardon flow from one hand: *Who forgiveth all thine iniquities; who healeth all thy diseases* (Psalm 103:3) — the Formed Son doing the Father''s own healing work. Israel''s prophets had borne healing as a sign — *his flesh came again like unto the flesh of a little child, and he was clean* (2 Kings 5:14) — and now the sign is fulfilled in the One who took the infirmities He healed.',
       sv.verse_id, ev.verse_id, 'free', 11216
  FROM _mt08_lookup sv, _mt08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=8 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-8-the-son-of-man-nowhere-to-lay-his-head-daniel-7-enoch-46',
       E'The Son of Adam hath not where to lay his head (Daniel 7:13; 1 Enoch 46)',
       E'A scribe vows to follow Him anywhere, and Yahusha (Jesus) answers with the cost: *The foxes have holes, and the birds of the air have nests; but the Son of Adam hath not where to lay his head.* He takes the very title of Daniel''s night-vision — *behold, one like the Son of Adam came with the clouds of heaven, and came to the Ancient of days* (Daniel 7:13). Hold the kaph close: *one LIKE the Son of Adam* — He comes in the likeness, the Formed Son brought near before the Ancient of days, neither flattened into a mere man nor swelled into a second deity. The library knew this figure: *This is the Son of Adam who hath righteousness, with whom dwelleth righteousness, and who revealeth all the treasures of that which is hidden, because Yahuah (God) of Spirits hath chosen him* (1 Enoch 46:3). Yet the road of this exalted One runs low — *I became also a reproach unto them: when they looked upon me they shaked their heads* (Psalm 109:25). Luke records the same word: *Foxes have holes, and birds of the air have nests; but the Son of Adam hath not where to lay his head* (Luke 9:58). Come and see the glory and the homelessness held in one Person.',
       sv.verse_id, ev.verse_id, 'extras', 11219
  FROM _mt08_lookup sv, _mt08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=8 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-8-he-rebukes-the-wind-and-sea-psalm-107-psalm-89-job-38',
       E'He rebuked the winds and the sea — what manner of man is this? (Psalm 107; Psalm 89; Job 38)',
       E'A great tempest covers the ship while He sleeps, and the terrified disciples wake Him: *Lord, save us: we perish.* He rises, *rebuked the winds and the sea; and there was a great calm* — and the men marvel, *What manner of man is this, that even the winds and the sea obey him!* The Tanakh has already answered. *Then they cry unto Yahuah (LORD) in their trouble, and he bringeth them out of their distresses* (Psalm 107:28); *He maketh the storm a calm, so that the waves thereof are still* (Psalm 107:29) — what the Psalm says Yahuah does, the disciples watch Yahusha (Jesus) do. *Thou rulest the raging of the sea: when the waves thereof arise, thou stillest them* (Psalm 89:9). He is the One who *stilleth the noise of the seas, the noise of their waves, and the tumult of the people* (Psalm 65:7). The voice that set the sea''s bounds at creation — *Hitherto shalt thou come, but no further: and here shall thy proud waves be stayed?* (Job 38:11) — now speaks from a fishing boat: the Creator''s authority exercised in the Formed Son, through whom the Father stills the deep. And a greater than Jonah is here, for when they cast Jonah forth *the sea ceased from her raging* (Jonah 1:15) — but THIS One needs only a word.',
       sv.verse_id, ev.verse_id, 'free', 11222
  FROM _mt08_lookup sv, _mt08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=8 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-8-the-gadarene-demoniacs-and-the-swine-isaiah-65-enoch-15',
       E'The demoniacs and the swine — art thou come to torment us before the time? (Isaiah 65; 1 Enoch 15)',
       E'Across the water, in the tombs of the Gergesenes, two fierce men possessed with devils meet Him, and the spirits cry out: *What have we to do with thee, Yahusha (Jesus), thou Son of Elohim (God)? art thou come hither to torment us before the time?* The library tells us what these spirits are and why they fear a *time*. *As for the spirits of heaven, in heaven shall be their dwelling, but as for the spirits of the earth which were born upon the earth, on the earth shall be their dwelling* (1 Enoch 15:8) — these are the spirits of the giants, the offspring of the Watchers, and *the spirits of the giants afflict, oppress, destroy, attack, do battle, and work destruction on the earth* (1 Enoch 15:9). That is their very trade in the tombs. And they know their reckoning is fixed: *thus shall they destroy until the day of the consummation, the great judgement* (1 Enoch 15:11) — so they tremble, *art thou come hither to torment us before the time?* The unclean herd fits them: *Which remain among the graves, and lodge in the monuments, which eat swine''s flesh, and broth of abominable things is in their vessels* (Isaiah 65:4) — graves, monuments, and swine, Isaiah''s very picture of defilement. They had *sacrificed their sons and their daughters unto devils* (Psalm 106:37) — but here the devils are subject to the Son, the whole herd runs to ruin in the sea, and the men are set free. Even in Gentile coasts He reigns, for *Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2) — the gathering reaches every land.',
       sv.verse_id, ev.verse_id, 'extras', 11225
  FROM _mt08_lookup sv, _mt08_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=28
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=8 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

-- 3d. thread_members ---------------------------------------------------------
-- THREAD 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 13:45 — *his clothes shall be rent... and shall cry, Unclean, unclean* — the Torah put the leper outside the camp.'
  FROM cross_reference_threads t, cross_references x, _mt08_lookup sv, _mt08_lookup tv
 WHERE t.slug='matthew-8-the-leper-offer-the-gift-moses-commanded-leviticus-14-2-kings-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=13 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 14:2 — *the law of the leper in the day of his cleansing* — exactly where Yahusha (Jesus) sends the healed man. Torah upheld.'
  FROM cross_reference_threads t, cross_references x, _mt08_lookup sv, _mt08_lookup tv
 WHERE t.slug='matthew-8-the-leper-offer-the-gift-moses-commanded-leviticus-14-2-kings-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=14 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 14:4 — *two birds alive and clean, and cedar wood, and scarlet, and hyssop* — the very gift Moses commanded.'
  FROM cross_reference_threads t, cross_references x, _mt08_lookup sv, _mt08_lookup tv
 WHERE t.slug='matthew-8-the-leper-offer-the-gift-moses-commanded-leviticus-14-2-kings-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=14 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Kings 5:14 — Naaman the leper *was clean* by obedience — a foreshadow of the cleansing touch.'
  FROM cross_reference_threads t, cross_references x, _mt08_lookup sv, _mt08_lookup tv
 WHERE t.slug='matthew-8-the-leper-offer-the-gift-moses-commanded-leviticus-14-2-kings-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 25:6 — *a feast of fat things... unto all people* — the mountain feast the gathered sit down to.'
  FROM cross_reference_threads t, cross_references x, _mt08_lookup sv, _mt08_lookup tv
 WHERE t.slug='matthew-8-many-from-east-and-west-sit-with-abraham-isaiah-25-malachi-1'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=25 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 49:12 — *these shall come from far... from the north and from the west* — the scattered drawn home.'
  FROM cross_reference_threads t, cross_references x, _mt08_lookup sv, _mt08_lookup tv
 WHERE t.slug='matthew-8-many-from-east-and-west-sit-with-abraham-isaiah-25-malachi-1'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 107:3 — *gathered them out of the lands, from the east, and from the west* — the four-winds ingathering.'
  FROM cross_reference_threads t, cross_references x, _mt08_lookup sv, _mt08_lookup tv
 WHERE t.slug='matthew-8-many-from-east-and-west-sit-with-abraham-isaiah-25-malachi-1'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=107 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Malachi 1:11 — *my name shall be great among the Gentiles* — the centurion is the firstfruit.'
  FROM cross_reference_threads t, cross_references x, _mt08_lookup sv, _mt08_lookup tv
 WHERE t.slug='matthew-8-many-from-east-and-west-sit-with-abraham-isaiah-25-malachi-1'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 11:1 — *Hath Elohim (God) cast away his people? Elohim (God) forbid* — the guard on verse 12: unbelief, not the nation.'
  FROM cross_reference_threads t, cross_references x, _mt08_lookup sv, _mt08_lookup tv
 WHERE t.slug='matthew-8-many-from-east-and-west-sit-with-abraham-isaiah-25-malachi-1'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Romans 11:2 — *Elohim (God) hath not cast away his people which he foreknew* — Israel never replaced.'
  FROM cross_reference_threads t, cross_references x, _mt08_lookup sv, _mt08_lookup tv
 WHERE t.slug='matthew-8-many-from-east-and-west-sit-with-abraham-isaiah-25-malachi-1'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Luke 13:29 — *they shall come from the east, and from the west... and shall sit down in the kingdom* — the same gathering.'
  FROM cross_reference_threads t, cross_references x, _mt08_lookup sv, _mt08_lookup tv
 WHERE t.slug='matthew-8-many-from-east-and-west-sit-with-abraham-isaiah-25-malachi-1'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=13 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 53:4 — *Surely he hath borne our griefs, and carried our sorrows* — Matthew quotes it outright.'
  FROM cross_reference_threads t, cross_references x, _mt08_lookup sv, _mt08_lookup tv
 WHERE t.slug='matthew-8-himself-took-our-infirmities-isaiah-53-4-psalm-103'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 103:3 — *Who forgiveth all thine iniquities; who healeth all thy diseases* — the Father''s healing work in the Son.'
  FROM cross_reference_threads t, cross_references x, _mt08_lookup sv, _mt08_lookup tv
 WHERE t.slug='matthew-8-himself-took-our-infirmities-isaiah-53-4-psalm-103'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Kings 5:14 — the prophets bore healing as a sign, fulfilled in the One who took the infirmities He healed.'
  FROM cross_reference_threads t, cross_references x, _mt08_lookup sv, _mt08_lookup tv
 WHERE t.slug='matthew-8-himself-took-our-infirmities-isaiah-53-4-psalm-103'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 7:13 — *one LIKE the Son of Adam came with the clouds* — preserve the kaph; the Formed Son brought near before the Ancient of days.'
  FROM cross_reference_threads t, cross_references x, _mt08_lookup sv, _mt08_lookup tv
 WHERE t.slug='matthew-8-the-son-of-man-nowhere-to-lay-his-head-daniel-7-enoch-46'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 46:3 — *This is the Son of Adam who hath righteousness... because Yahuah (God) of Spirits hath chosen him* — the library''s own Son-of-Adam witness, the Daniel-7 figure named.'
  FROM cross_reference_threads t, cross_references x, _mt08_lookup sv, _mt08_lookup tv
 WHERE t.slug='matthew-8-the-son-of-man-nowhere-to-lay-his-head-daniel-7-enoch-46'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=20
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=46 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 109:25 — *I became also a reproach unto them* — the despised, head-shaken path the homeless One walks.'
  FROM cross_reference_threads t, cross_references x, _mt08_lookup sv, _mt08_lookup tv
 WHERE t.slug='matthew-8-the-son-of-man-nowhere-to-lay-his-head-daniel-7-enoch-46'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=109 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 9:58 — *the Son of Adam hath not where to lay his head* — the same saying; the cost of following.'
  FROM cross_reference_threads t, cross_references x, _mt08_lookup sv, _mt08_lookup tv
 WHERE t.slug='matthew-8-the-son-of-man-nowhere-to-lay-his-head-daniel-7-enoch-46'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=9 AND tv.verse_number=58
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 107:28 — *Then they cry unto Yahuah (LORD) in their trouble* — the mariners cried as the disciples cry.'
  FROM cross_reference_threads t, cross_references x, _mt08_lookup sv, _mt08_lookup tv
 WHERE t.slug='matthew-8-he-rebukes-the-wind-and-sea-psalm-107-psalm-89-job-38'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=107 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 107:29 — *He maketh the storm a calm, so that the waves thereof are still* — what Yahuah does, Yahusha (Jesus) does.'
  FROM cross_reference_threads t, cross_references x, _mt08_lookup sv, _mt08_lookup tv
 WHERE t.slug='matthew-8-he-rebukes-the-wind-and-sea-psalm-107-psalm-89-job-38'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=107 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 89:9 — *Thou rulest the raging of the sea... thou stillest them* — the Creator''s authority in the Formed Son.'
  FROM cross_reference_threads t, cross_references x, _mt08_lookup sv, _mt08_lookup tv
 WHERE t.slug='matthew-8-he-rebukes-the-wind-and-sea-psalm-107-psalm-89-job-38'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 65:7 — *Which stilleth the noise of the seas... and the tumult of the people* — the One the Psalm sang of.'
  FROM cross_reference_threads t, cross_references x, _mt08_lookup sv, _mt08_lookup tv
 WHERE t.slug='matthew-8-he-rebukes-the-wind-and-sea-psalm-107-psalm-89-job-38'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=65 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Job 38:11 — *Hitherto shalt thou come, but no further... here shall thy proud waves be stayed* — the voice that set the sea''s bounds.'
  FROM cross_reference_threads t, cross_references x, _mt08_lookup sv, _mt08_lookup tv
 WHERE t.slug='matthew-8-he-rebukes-the-wind-and-sea-psalm-107-psalm-89-job-38'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=38 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Jonah 1:15 — *the sea ceased from her raging* — a greater than Jonah is here, who needs only a word.'
  FROM cross_reference_threads t, cross_references x, _mt08_lookup sv, _mt08_lookup tv
 WHERE t.slug='matthew-8-he-rebukes-the-wind-and-sea-psalm-107-psalm-89-job-38'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 15:8 — *the spirits of the earth which were born upon the earth, on the earth shall be their dwelling* — where the unclean spirits belong.'
  FROM cross_reference_threads t, cross_references x, _mt08_lookup sv, _mt08_lookup tv
 WHERE t.slug='matthew-8-the-gadarene-demoniacs-and-the-swine-isaiah-65-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=29
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=15 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 15:9 — *the spirits of the giants afflict, oppress, destroy... and work destruction on the earth* — their very trade in the tombs.'
  FROM cross_reference_threads t, cross_references x, _mt08_lookup sv, _mt08_lookup tv
 WHERE t.slug='matthew-8-the-gadarene-demoniacs-and-the-swine-isaiah-65-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=29
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=15 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 15:11 — *until the day of the consummation, the great judgement* — why they cry *art thou come... before the time?*'
  FROM cross_reference_threads t, cross_references x, _mt08_lookup sv, _mt08_lookup tv
 WHERE t.slug='matthew-8-the-gadarene-demoniacs-and-the-swine-isaiah-65-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=29
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=15 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 65:4 — *which eat swine''s flesh, and broth of abominable things* — graves, monuments, and swine, the picture of defilement.'
  FROM cross_reference_threads t, cross_references x, _mt08_lookup sv, _mt08_lookup tv
 WHERE t.slug='matthew-8-the-gadarene-demoniacs-and-the-swine-isaiah-65-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 106:37 — *they sacrificed their sons and their daughters unto devils* — the land in bondage to devils, now broken.'
  FROM cross_reference_threads t, cross_references x, _mt08_lookup sv, _mt08_lookup tv
 WHERE t.slug='matthew-8-the-gadarene-demoniacs-and-the-swine-isaiah-65-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Romans 11:2 — *Elohim (God) hath not cast away his people* — even in Gentile coasts the Son reigns; Israel never cast off.'
  FROM cross_reference_threads t, cross_references x, _mt08_lookup sv, _mt08_lookup tv
 WHERE t.slug='matthew-8-the-gadarene-demoniacs-and-the-swine-isaiah-65-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=8 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
