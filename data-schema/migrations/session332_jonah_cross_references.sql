-- =====================================================================
-- Session 332 — Jonah FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session332_jonah_cross_references.sql
-- =====================================================================

\echo 'session332 — Jonah cross-references starting...'
BEGIN;

-- ----- fragment: minion_jonah_1.sql (Jonah 1) -----
-- Chapter: Jonah 1 — THE FLIGHT FROM THE PRESENCE OF YAHUAH; the great wind; the sleeping prophet;
-- the lot; the Creator-confession before the pagan sailors; cast into the sea to still the storm;
-- the men feared Yahuah and offered sacrifice; and the keystone — *Now Yahuah (LORD) had prepared a
-- great fish to swallow up Jonah. And Jonah was in the belly of the fish three days and three nights*
-- (1:17). The reluctant prophet flees his commission to the NATIONS (Nineveh); the impossibility of
-- fleeing the Maker of sea and land; the one given up so the many are saved; and the sign of Jonah —
-- the burial-and-rising type the Formed Son names of himself (Matthew 12:40).
-- Tag: jon01   Temp view: _s332_jon01_lookup
-- Sort band: base 45350, step 3 -> threads at 45350, 45353, 45356, 45359, 45362 (5 threads)
-- Source of EVERY row: 'canon','jonah',1,v
--
-- Jonah 1 coverage:
--   v.1-2 (the word of Yahuah... Arise, go to Nineveh, that great city, and cry against it)
--        NT/Extras/Tanakh: woven into THREAD 1 prose (the call to the nations resisted); no separate add forced
--   ★ v.3 (Jonah rose up to flee unto Tarshish from the presence of Yahuah (LORD))
--        NT:     none warranted distinct (the resented-mercy-to-the-nations forward-weave held in prose)
--        Extras: none warranted
--        Tanakh: ★★ Psalm 139:7,9,10 (Whither shall I flee from thy presence?... If I take the wings of
--                the morning, and dwell in the uttermost parts of the sea... there shall thy hand lead me) — THREAD 1
--   ★★ v.4-6 (Yahuah sent out a great wind... a mighty tempest... Jonah was gone down into the sides of
--          the ship; and he lay, and was fast asleep... arise, call upon thy Elohim)
--        NT:     ★★ Matthew 8:24,26 (there arose a great tempest... but he was asleep... he arose, and
--                rebuked the winds and the sea; and there was a great calm), ★★ Mark 4:38,39 (he was...
--                asleep on a pillow... Peace, be still. And the wind ceased) — THREAD 2
--        Extras: none warranted (clean storm-witness; no extras forced)
--        Tanakh: woven (Yahuah commands the wind) in prose
--   v.7-8 (cast lots... the lot fell upon Jonah)
--        NT/Extras/Tanakh: none warranted (the lot is narrative preface to the confession of v.9); recorded
--   ★ v.9 (I am an Hebrew; and I fear Yahuah (LORD), the Elohim (God) of heaven, which hath made the sea
--          and the dry land)
--        NT:     ★ Acts 17:24 (Elohim (God) that made the world and all things therein... the Lord of
--                heaven and earth) — THREAD 3
--        Extras: ★ Ecclesiasticus/Sirach 43:23,25 (By his counsel he appeaseth the deep... strange and
--                wondrous works, variety of all kinds of beasts and whales created) — THREAD 3
--        Tanakh: ★★ Genesis 1:9,10 (Let the waters... be gathered together... and let the dry land appear),
--                ★ Psalm 95:5 (The sea is his, and he made it: and his hands formed the dry land) — THREAD 3
--   v.10 (the men knew that he fled from the presence of Yahuah) — woven into THREAD 1; recorded
--   ★★ v.11-15 (Take me up, and cast me forth into the sea; so shall the sea be calm... for I know that
--          for my sake this great tempest is upon you... they took up Jonah, and cast him forth into the
--          sea: and the sea ceased from her raging)
--        NT:     ★★ John 11:50 (that one man should die for the people, and that the whole nation perish not) — THREAD 4
--        Extras: none warranted
--        Tanakh: ★ Psalm 69:2 (I am come into deep waters, where the floods overflow me), ★ Psalm 42:7
--                (all thy waves and thy billows are gone over me) — THREAD 4 (the deep/waters)
--   ★ v.16 (the men feared Yahuah (LORD) exceedingly, and offered a sacrifice unto Yahuah... made vows)
--        NT:     none warranted distinct
--        Extras: none warranted
--        Tanakh: ★ Malachi 1:11 (from the rising of the sun even unto the going down of the same my name
--                shall be great among the Gentiles... in every place incense shall be offered unto my name) — THREAD 3
--                (the nations brought to fear and worship the Creator, even through the disobedient prophet)
--   ★★★ v.17 (Now Yahuah had prepared a great fish to swallow up Jonah. And Jonah was in the belly of the
--          fish three days and three nights) — THE KEYSTONE
--        NT:     ★★★ Matthew 12:40 (For as Jonas was three days and three nights in the whale's belly; so
--                shall the Son of Adam be three days and three nights in the heart of the earth),
--                ★★ Matthew 12:39 (the sign of the prophet Jonas), ★ Matthew 16:4 (the sign of the prophet
--                Jonas), ★★ Luke 11:30 (as Jonas was a sign unto the Ninevites, so shall also the Son of
--                Adam be to this generation), Luke 11:29 (no sign... but the sign of Jonas the prophet) — THREAD 5
--        Extras: none warranted (the type is the gospel's own naming)
--        Tanakh: held in prose (the prepared fish = Yahuah's sovereign deliverance, not destruction)
--
-- Threads (slug — target libraries):
--   1. jonah-1-whither-shall-i-flee-from-thy-presence — Tanakh (Psalm 139) [free]
--      (★ the flight from the presence of Yahuah; no flight from his Spirit; the call to the nations resisted)
--   2. jonah-1-yahuah-sent-out-a-great-wind-the-sleeping-prophet — NT (Matthew 8, Mark 4) [free]
--      (★★ the prophet asleep in the storm; the parallel of the Formed Son asleep, who rebukes the wind — great calm)
--   3. jonah-1-which-hath-made-the-sea-and-the-dry-land — Tanakh (Genesis 1, Psalm 95, Malachi 1) + NT (Acts 17) + Extras (Sirach 43) [extras]
--      (★ the Creator-Elohim confessed before the pagan sailors; the nations brought to fear and worship Him)
--   4. jonah-1-cast-me-forth-into-the-sea-the-one-for-the-many — NT (John 11) + Tanakh (Psalm 69, Psalm 42) [free]
--      (★★ the one cast into the deep so the many are saved; the sea calmed — a type of the one given for the people)
--   5. jonah-1-three-days-and-three-nights-the-sign-of-jonah — NT (Matthew 12, Matthew 16, Luke 11) [free]
--      (★★★ THE KEYSTONE — the great fish, three days and three nights; the burial-and-rising sign the Formed Son names of himself)
--
-- Framing notes:
--   ★ NO FLIGHT FROM HIS PRESENCE (THREAD 1): *But Jonah rose up to flee unto Tarshish from the presence
--      of Yahuah (LORD)* (1:3) is answered by David's confession that there is no fleeing the Maker:
--      *Whither shall I go from thy spirit? or whither shall I flee from thy presence?* (Psalm 139:7),
--      *If I take the wings of the morning, and dwell in the uttermost parts of the sea; Even there shall
--      thy hand lead me* (139:9-10). The prophet flees a commission to the NATIONS (Nineveh) — the mercy
--      to the gentiles he resents; the same scandal the brother resents in Luke 15 and Paul answers in
--      Romans 10-11. Held in prose, anchored Tanakh.
--   ★★ THE SLEEPING PROPHET / THE STILLED STORM (THREAD 2): *Yahuah (LORD) sent out a great wind... and
--      Jonah was gone down into the sides of the ship; and he lay, and was fast asleep* (1:4-5). The
--      Formed Son sleeps the same sleep in the same storm: *there arose a great tempest... but he was
--      asleep* (Matthew 8:24); *he was in the hinder part of the ship, asleep on a pillow* (Mark 4:38);
--      and he stills it with a word: *he arose, and rebuked the winds and the sea; and there was a great
--      calm* (Matthew 8:26); *Peace, be still. And the wind ceased, and there was a great calm* (Mark
--      4:39). Jonah is cast into the sea to still it; the Greater-than-Jonah commands it stilled.
--   ★ THE CREATOR CONFESSED TO THE NATIONS (THREAD 3): *I am an Hebrew; and I fear Yahuah (LORD), the
--      Elohim (God) of heaven, which hath made the sea and the dry land* (1:9) — the Maker of Genesis 1:
--      *Let the waters under the heaven be gathered together... and let the dry land appear* (Genesis 1:9);
--      *The sea is his, and he made it: and his hands formed the dry land* (Psalm 95:5); *Elohim (God)
--      that made the world and all things therein* (Acts 17:24). The restored witness sings the same:
--      *By his counsel he appeaseth the deep... variety of all kinds of beasts and whales created*
--      (Sirach 43:23,25). And through the disobedient prophet the nations come to fear and worship Him —
--      *the men feared Yahuah (LORD) exceedingly, and offered a sacrifice* (1:16) — the foretaste of
--      *from the rising of the sun even unto the going down of the same my name shall be great among the
--      Gentiles* (Malachi 1:11).
--   ★★ THE ONE FOR THE MANY (THREAD 4): *Take me up, and cast me forth into the sea; so shall the sea be
--      calm unto you: for I know that for my sake this great tempest is upon you* (1:12); *they took up
--      Jonah, and cast him forth into the sea: and the sea ceased from her raging* (1:15). The one given
--      up so the many are spared is the very logic Caiaphas spoke better than he knew: *one man should
--      die for the people, and that the whole nation perish not* (John 11:50). The deep that closes over
--      him is the deep of the Psalms: *I am come into deep waters, where the floods overflow me* (Psalm
--      69:2); *all thy waves and thy billows are gone over me* (Psalm 42:7).
--   ★★★ THE SIGN OF JONAH (THREAD 5, KEYSTONE): *Now Yahuah (LORD) had prepared a great fish to swallow
--      up Jonah. And Jonah was in the belly of the fish three days and three nights* (1:17). The Formed
--      Son makes this his one sign: *as Jonas was three days and three nights in the whale's belly; so
--      shall the Son of Adam be three days and three nights in the heart of the earth* (Matthew 12:40);
--      *there shall no sign be given to it, but the sign of the prophet Jonas* (Matthew 12:39; Matthew
--      16:4); *as Jonas was a sign unto the Ninevites, so shall also the Son of Adam be to this generation*
--      (Luke 11:30). The prepared fish is Yahuah's sovereign DELIVERANCE, not destruction — the
--      burial-and-rising type fulfilled in the Son of Adam's three days in the heart of the earth.
--   VERSES WITH NO SEPARATE ADD: v.1-2 (the call — woven THREAD 1), v.7-8 (the lot — preface to the
--      confession), v.10 (they knew he fled — woven THREAD 1), v.13-14 (the rowing, the innocent-blood
--      plea — woven THREAD 4 prose). All recorded, none silently skipped.

CREATE TEMP VIEW _s332_jon01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): Whither shall I flee from thy presence — no flight from his Spirit
    ('canon','jonah',1,3,'canon','psalms',139,7,'free',
      E'*Whither shall I go from thy spirit? or whither shall I flee from thy presence?* (Psalm 139:7). The prophet who *rose up to flee unto Tarshish from the presence of Yahuah (LORD)* (Jonah 1:3) attempts the one impossible thing — David already knew there is no fleeing the Maker''s presence: *whither shall I flee from thy presence?* The flight is doomed from the deck; the sea itself is His.'),
    ('canon','jonah',1,3,'canon','psalms',139,9,'free',
      E'*If I take the wings of the morning, and dwell in the uttermost parts of the sea* (Psalm 139:9). Tarshish was the far edge of the known sea — *the uttermost parts of the sea* — the very place David names as no refuge from Yahuah. Jonah sails toward the one horizon the Psalm has already closed off; *from the presence of Yahuah (LORD)* (Jonah 1:3) is a course that does not exist.'),
    ('canon','jonah',1,3,'canon','psalms',139,10,'free',
      E'*Even there shall thy hand lead me, and thy right hand shall hold me* (Psalm 139:10). Even in the uttermost sea the fleeing prophet (Jonah 1:3) is held — *there shall thy hand lead me*. The great wind and the prepared fish are that very hand; the flight from the presence becomes the proof that there is no place outside it.'),

    -- THREAD 2 (★★): Yahuah sent out a great wind — the sleeping prophet / the stilled storm
    ('canon','jonah',1,5,'canon','matthew',8,24,'free',
      E'*And, behold, there arose a great tempest in the sea, insomuch that the ship was covered with the waves: but he was asleep* (Matthew 8:24). Jonah *was gone down into the sides of the ship; and he lay, and was fast asleep* (Jonah 1:5) while *Yahuah (LORD) sent out a great wind into the sea* (1:4) — the same scene the Formed Son enters: *a great tempest in the sea... but he was asleep*. The prophet asleep in the storm prefigures the Greater-than-Jonah asleep in the storm.'),
    ('canon','jonah',1,4,'canon','matthew',8,26,'free',
      E'*And he saith unto them, Why are ye fearful, O ye of little faith? Then he arose, and rebuked the winds and the sea; and there was a great calm* (Matthew 8:26). Yahuah *sent out a great wind into the sea, and there was a mighty tempest* (Jonah 1:4); the Formed Son commands that same sea — *he arose, and rebuked the winds and the sea; and there was a great calm*. Jonah is cast in to still the sea; the Son stills it with a word.'),
    ('canon','jonah',1,5,'canon','mark',4,38,'free',
      E'*And he was in the hinder part of the ship, asleep on a pillow: and they awake him, and say unto him, Master, carest thou not that we perish?* (Mark 4:38). Mark''s scene answers Jonah''s: the prophet *fast asleep* (Jonah 1:5) and the shipmaster crying *arise, call upon thy Elohim (God)... that we perish not* (1:6) is matched verse for verse — *asleep on a pillow... carest thou not that we perish?* The same storm, the same sleeper roused, the same plea against perishing.'),
    ('canon','jonah',1,4,'canon','mark',4,39,'free',
      E'*And he arose, and rebuked the wind, and said unto the sea, Peace, be still. And the wind ceased, and there was a great calm* (Mark 4:39). The *mighty tempest in the sea* Yahuah sent (Jonah 1:4) — and which *ceased from her raging* only when the prophet was cast in (1:15) — is the very wind the Formed Son silences by his word alone: *Peace, be still. And the wind ceased, and there was a great calm*.'),

    -- THREAD 3 (★, extras): Which hath made the sea and the dry land — the Creator confessed to the nations
    ('canon','jonah',1,9,'canon','genesis',1,9,'free',
      E'*And Elohim (God) said, Let the waters under the heaven be gathered together unto one place, and let the dry land appear: and it was so* (Genesis 1:9). The Hebrew''s confession to the pagan sailors — *I fear Yahuah (LORD), the Elohim (God) of heaven, which hath made the sea and the dry land* (Jonah 1:9) — reaches back to the third day, when the Maker divided *the sea and the dry land*. He confesses the Creator of the very sea that rages around the ship.'),
    ('canon','jonah',1,9,'canon','psalms',95,5,'free',
      E'*The sea is his, and he made it: and his hands formed the dry land* (Psalm 95:5). The confession *which hath made the sea and the dry land* (Jonah 1:9) is the Psalm''s own praise word for word — *the sea is his, and he made it: and his hands formed the dry land*. The sailors cried each to his own god (1:5); the prophet names the One whose the sea is.'),
    ('canon','jonah',1,9,'canon','acts',17,24,'free',
      E'*Elohim (God) that made the world and all things therein, seeing that he is the Lord of heaven and earth, dwelleth not in temples made with hands* (Acts 17:24). Jonah''s witness before the pagan mariners — *the Elohim (God) of heaven, which hath made the sea and the dry land* (Jonah 1:9) — is the same Maker Paul proclaims to the pagan Athenians: *Elohim (God) that made the world and all things therein... the Lord of heaven and earth*. The Creator confessed to the nations, even by a fleeing prophet.'),
    ('canon','jonah',1,9,'apocrypha','ecclesiasticus',43,23,'extras',
      E'*By his counsel he appeaseth the deep, and planteth islands in it* (Sirach/Ecclesiasticus 43:23). The One *which hath made the sea and the dry land* (Jonah 1:9) is the One who rules the deep that swallows the prophet — *by his counsel he appeaseth the deep*. The storm and the great fish are alike under the hand of the Maker the Hebrew confesses.'),
    ('canon','jonah',1,9,'apocrypha','ecclesiasticus',43,25,'extras',
      E'*For in it be strange and wondrous works, variety of all kinds of beasts and whales created* (Sirach/Ecclesiasticus 43:25). The Creator of *the sea and the dry land* (Jonah 1:9) made also the deep''s creatures — *all kinds of beasts and whales created* — among them the *great fish* He prepares to swallow Jonah (1:17). The confessed Maker holds the very fish of the sign in his hand.'),
    ('canon','jonah',1,16,'canon','malachi',1,11,'free',
      E'*For from the rising of the sun even unto the going down of the same my name shall be great among the Gentiles; and in every place incense shall be offered unto my name, and a pure offering: for my name shall be great among the heathen, saith Yahuah Tseva''ot (LORD of hosts)* (Malachi 1:11). Through the disobedient prophet the pagan crew is turned: *the men feared Yahuah (LORD) exceedingly, and offered a sacrifice unto Yahuah (LORD), and made vows* (Jonah 1:16) — a foretaste of the Name made *great among the Gentiles* and the offering arising *in every place*. The nations brought to fear the Creator, even by a prophet in flight.'),

    -- THREAD 4 (★★): Cast me forth into the sea — the one for the many
    ('canon','jonah',1,12,'canon','john',11,50,'free',
      E'*Nor consider that it is expedient for us, that one man should die for the people, and that the whole nation perish not* (John 11:50). Jonah''s own word — *Take me up, and cast me forth into the sea; so shall the sea be calm unto you: for I know that for my sake this great tempest is upon you* (Jonah 1:12) — is the same logic Caiaphas spoke better than he knew: *one man should die for the people, and that the whole nation perish not*. The one given up so the many are saved; the type of the One given for the people.'),
    ('canon','jonah',1,15,'canon','psalms',69,2,'free',
      E'*I sink in deep mire, where there is no standing: I am come into deep waters, where the floods overflow me* (Psalm 69:2). When *they took up Jonah, and cast him forth into the sea* (Jonah 1:15) he descends into the very deep the Psalm cries from — *I am come into deep waters, where the floods overflow me*. The one cast into the deep to still the storm sinks where the floods overflow; the deliverance comes only out of the depths.'),
    ('canon','jonah',1,15,'canon','psalms',42,7,'free',
      E'*Deep calleth unto deep at the noise of thy waterspouts: all thy waves and thy billows are gone over me* (Psalm 42:7). The sea that *ceased from her raging* once Jonah was cast in (Jonah 1:15) first closed over him — *all thy waves and thy billows are gone over me*. The Psalm names the place the one-for-the-many is given into: the deep that calls unto deep, the waves and billows gone over the head of the one cast forth.'),

    -- THREAD 5 (★★★, KEYSTONE): Three days and three nights — the sign of Jonah
    ('canon','jonah',1,17,'canon','matthew',12,40,'free',
      E'*For as Jonas was three days and three nights in the whale''s belly; so shall the Son of Adam be three days and three nights in the heart of the earth* (Matthew 12:40). This is the keystone: *Jonah was in the belly of the fish three days and three nights* (Jonah 1:17), and the Formed Son makes it the figure of his own burial and rising — *so shall the Son of Adam be three days and three nights in the heart of the earth*. The prepared fish is Yahuah''s deliverance, not destruction; the prophet swallowed and given up alive is the sign of the One who goes down and comes up.'),
    ('canon','jonah',1,17,'canon','matthew',12,39,'free',
      E'*But he answered and said unto them, An evil and adulterous generation seeketh after a sign; and there shall no sign be given to it, but the sign of the prophet Jonas* (Matthew 12:39). The *great fish... three days and three nights* (Jonah 1:17) is named the one sign the generation will be given — *the sign of the prophet Jonas*. The whole of Jonah 1:17 is gathered into that one sign: the going-down and the rising-up of the Son of Adam.'),
    ('canon','jonah',1,17,'canon','matthew',16,4,'free',
      E'*A wicked and adulterous generation seeketh after a sign; and there shall no sign be given unto it, but the sign of the prophet Jonas. And he left them, and departed* (Matthew 16:4). Again the Formed Son points to Jonah''s three days in the fish (Jonah 1:17) as the only sign — *the sign of the prophet Jonas*. The burial-and-rising type is the sign refused to the sign-seekers and given to faith.'),
    ('canon','jonah',1,17,'canon','luke',11,30,'free',
      E'*For as Jonas was a sign unto the Ninevites, so shall also the Son of Adam be to this generation* (Luke 11:30). Jonah given up out of the fish (Jonah 1:17) and sent to Nineveh was *a sign unto the Ninevites*; *so shall also the Son of Adam be to this generation* — the one who came up from the deep, preaching repentance to the nations. The sign of Jonah is the Son of Adam himself, risen.'),
    ('canon','jonah',1,17,'canon','luke',11,29,'free',
      E'*This is an evil generation: they seek a sign; and there shall no sign be given it, but the sign of Jonas the prophet* (Luke 11:29). The *three days and three nights* in the fish (Jonah 1:17) is the one sign the generation is granted — *the sign of Jonas the prophet*. The whole chapter''s deliverance-out-of-the-deep is the figure the Formed Son claims of himself.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s332_jon01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s332_jon01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jonah-1-whither-shall-i-flee-from-thy-presence',
       E'Whither shall I flee from thy presence — the flight from the face of Yahuah',
       E'The word comes plain: *Arise, go to Nineveh, that great city, and cry against it; for their wickedness is come up before me* (Jonah 1:2). It is a commission to the NATIONS — and the prophet runs the other way: *But Jonah rose up to flee unto Tarshish from the presence of Yahuah (LORD), and went down to Joppa; and he found a ship going to Tarshish... to go with them unto Tarshish from the presence of Yahuah (LORD)* (1:3). He attempts the one impossible thing. David has already closed off every road of escape: *Whither shall I go from thy spirit? or whither shall I flee from thy presence?* (Psalm 139:7); *If I take the wings of the morning, and dwell in the uttermost parts of the sea; Even there shall thy hand lead me, and thy right hand shall hold me* (Psalm 139:9-10). Tarshish was the far edge of the sea — the very *uttermost parts of the sea* the Psalm names as no refuge. The mercy to the gentiles is the thing the prophet resents and flees; it is the same scandal of grace the elder brother resents (Luke 15) and the same hardness Paul answers in Romans 10-11 — Yahuah''s reach to the nations, hated by the one sent to carry it. But the great wind and the prepared fish are that very hand that *shall hold me*; the flight from the face of Yahuah becomes the proof that there is no place outside His presence.',
       sv.verse_id, ev.verse_id, 'free', 45350
  FROM _s332_jon01_lookup sv, _s332_jon01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=1 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='jonah' AND ev.chapter_number=1 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jonah-1-yahuah-sent-out-a-great-wind-the-sleeping-prophet',
       E'Yahuah sent out a great wind — the sleeping prophet and the stilled storm',
       E'Yahuah Himself commands the storm: *But Yahuah (LORD) sent out a great wind into the sea, and there was a mighty tempest in the sea, so that the ship was like to be broken* (Jonah 1:4). And the prophet sleeps through the wrath he caused: *But Jonah was gone down into the sides of the ship; and he lay, and was fast asleep* (1:5), until the shipmaster rouses him — *What meanest thou, O sleeper? arise, call upon thy Elohim (God), if so be that Elohim (God) will think upon us, that we perish not* (1:6). The Formed Son enters the very same scene on the same sea: *there arose a great tempest in the sea, insomuch that the ship was covered with the waves: but he was asleep* (Matthew 8:24); *he was in the hinder part of the ship, asleep on a pillow: and they awake him, and say unto him, Master, carest thou not that we perish?* (Mark 4:38) — the sleeper roused, the same plea against perishing. But where Jonah must be cast into the sea before *the sea ceased from her raging* (1:15), the Greater-than-Jonah stills it with a word: *he arose, and rebuked the winds and the sea; and there was a great calm* (Matthew 8:26); *Peace, be still. And the wind ceased, and there was a great calm* (Mark 4:39). The prophet asleep in the storm is the shadow; the Son who commands the wind is the substance.',
       sv.verse_id, ev.verse_id, 'free', 45353
  FROM _s332_jon01_lookup sv, _s332_jon01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=1 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='jonah' AND ev.chapter_number=1 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★, extras)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jonah-1-which-hath-made-the-sea-and-the-dry-land',
       E'Which hath made the sea and the dry land — the Creator confessed to the nations',
       E'The lot falls, and the fleeing prophet must name his Elohim before the pagan crew: *And he said unto them, I am an Hebrew; and I fear Yahuah (LORD), the Elohim (God) of heaven, which hath made the sea and the dry land* (Jonah 1:9). The confession reaches back to the third day of creation — *And Elohim (God) said, Let the waters under the heaven be gathered together unto one place, and let the dry land appear: and it was so* (Genesis 1:9) — and it is the Psalm''s own praise word for word: *The sea is his, and he made it: and his hands formed the dry land* (Psalm 95:5). The sailors *cried every man unto his god* (1:5); the Hebrew names the One whose the raging sea is. It is the very God Paul proclaims to the pagan Athenians: *Elohim (God) that made the world and all things therein, seeing that he is the Lord of heaven and earth* (Acts 17:24). And the restored witness sings of the Maker who rules the deep that will swallow him: *By his counsel he appeaseth the deep, and planteth islands in it* (Sirach 43:23); *For in it be strange and wondrous works, variety of all kinds of beasts and whales created* (Sirach 43:25) — among them the *great fish* He prepares (1:17). Then the wonder: through a disobedient prophet, the nations are turned to the Creator — *Then the men feared Yahuah (LORD) exceedingly, and offered a sacrifice unto Yahuah (LORD), and made vows* (1:16) — a foretaste of *from the rising of the sun even unto the going down of the same my name shall be great among the Gentiles; and in every place incense shall be offered unto my name, and a pure offering* (Malachi 1:11). The Maker of sea and land confessed, and the heathen brought to fear Him.',
       sv.verse_id, ev.verse_id, 'extras', 45356
  FROM _s332_jon01_lookup sv, _s332_jon01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=1 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='jonah' AND ev.chapter_number=1 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jonah-1-cast-me-forth-into-the-sea-the-one-for-the-many',
       E'Cast me forth into the sea — the one given up so the many are saved',
       E'The prophet names his own remedy: *And he said unto them, Take me up, and cast me forth into the sea; so shall the sea be calm unto you: for I know that for my sake this great tempest is upon you* (Jonah 1:12). The sailors strive to spare him — *Nevertheless the men rowed hard to bring it to the land; but they could not* (1:13) — and plead innocent of his blood (1:14), until at last *they took up Jonah, and cast him forth into the sea: and the sea ceased from her raging* (1:15). One is given up so the many are saved, and the storm is stilled by his being cast into the deep. It is the very logic the high priest spoke better than he knew: *it is expedient for us, that one man should die for the people, and that the whole nation perish not* (John 11:50) — a type of the One given for the people. And the deep that closes over the one cast forth is the deep of the Psalms of distress: *I sink in deep mire, where there is no standing: I am come into deep waters, where the floods overflow me* (Psalm 69:2); *Deep calleth unto deep at the noise of thy waterspouts: all thy waves and thy billows are gone over me* (Psalm 42:7). The deliverance for the many is bought through the one going down into the depths.',
       sv.verse_id, ev.verse_id, 'free', 45359
  FROM _s332_jon01_lookup sv, _s332_jon01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=1 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='jonah' AND ev.chapter_number=1 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★★, KEYSTONE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jonah-1-three-days-and-three-nights-the-sign-of-jonah',
       E'Three days and three nights — the great fish and the sign of Jonah',
       E'The chapter closes on the keystone of the whole book: *Now Yahuah (LORD) had prepared a great fish to swallow up Jonah. And Jonah was in the belly of the fish three days and three nights* (Jonah 1:17). The fish is no monster of judgment but Yahuah''s sovereign DELIVERANCE — *prepared* to bear the prophet up alive out of the deep. And the Formed Son makes this the one sign he will give: *as Jonas was three days and three nights in the whale''s belly; so shall the Son of Adam be three days and three nights in the heart of the earth* (Matthew 12:40). To the sign-seekers he says it twice over: *there shall no sign be given to it, but the sign of the prophet Jonas* (Matthew 12:39); *there shall no sign be given unto it, but the sign of the prophet Jonas. And he left them, and departed* (Matthew 16:4). And Luke draws the line to the nations: *This is an evil generation: they seek a sign; and there shall no sign be given it, but the sign of Jonas the prophet* (Luke 11:29); *For as Jonas was a sign unto the Ninevites, so shall also the Son of Adam be to this generation* (Luke 11:30). Jonah, swallowed and given up alive, sent to preach repentance to a pagan city, is the figure of the Son of Adam who goes down into the heart of the earth and comes up the third day — the burial-and-rising at the heart of the gospel, prepared and provided by Yahuah Himself.',
       sv.verse_id, ev.verse_id, 'free', 45362
  FROM _s332_jon01_lookup sv, _s332_jon01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=1 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='jonah' AND ev.chapter_number=1 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Whither shall I go from thy spirit? or whither shall I flee from thy presence?* (Psalm 139:7) — the one impossible thing Jonah attempts: *to flee... from the presence of Yahuah (LORD)* (Jonah 1:3).'
  FROM cross_reference_threads t
  JOIN _s332_jon01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s332_jon01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-1-whither-shall-i-flee-from-thy-presence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*If I take the wings of the morning, and dwell in the uttermost parts of the sea* (Psalm 139:9) — Tarshish, the far edge of the sea Jonah sails toward (Jonah 1:3), is the very horizon the Psalm has already closed off.'
  FROM cross_reference_threads t
  JOIN _s332_jon01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s332_jon01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-1-whither-shall-i-flee-from-thy-presence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Even there shall thy hand lead me, and thy right hand shall hold me* (Psalm 139:10) — even in the uttermost sea the fleeing prophet is held; the great wind and the prepared fish are that very hand.'
  FROM cross_reference_threads t
  JOIN _s332_jon01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s332_jon01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-1-whither-shall-i-flee-from-thy-presence'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *there arose a great tempest in the sea... but he was asleep* (Matthew 8:24) — the prophet *fast asleep* in the storm (Jonah 1:5) prefigures the Formed Son asleep in the same storm.'
  FROM cross_reference_threads t
  JOIN _s332_jon01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=1 AND sv.verse_number=5
  JOIN _s332_jon01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=8 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-1-yahuah-sent-out-a-great-wind-the-sleeping-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *he arose, and rebuked the winds and the sea; and there was a great calm* (Matthew 8:26) — the *great wind* Yahuah sent (Jonah 1:4) is the sea the Son stills with a word, where Jonah must be cast in first.'
  FROM cross_reference_threads t
  JOIN _s332_jon01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s332_jon01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=8 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-1-yahuah-sent-out-a-great-wind-the-sleeping-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*asleep on a pillow... carest thou not that we perish?* (Mark 4:38) — the sleeper roused and the plea against perishing match Jonah 1:5-6 verse for verse.'
  FROM cross_reference_threads t
  JOIN _s332_jon01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=1 AND sv.verse_number=5
  JOIN _s332_jon01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=4 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-1-yahuah-sent-out-a-great-wind-the-sleeping-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Peace, be still. And the wind ceased, and there was a great calm* (Mark 4:39) — the *mighty tempest* Yahuah sent (Jonah 1:4), which ceased only when Jonah was cast in (1:15), the Son silences by his word alone.'
  FROM cross_reference_threads t
  JOIN _s332_jon01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s332_jon01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=4 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-1-yahuah-sent-out-a-great-wind-the-sleeping-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★, extras)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Let the waters... be gathered together... and let the dry land appear* (Genesis 1:9) — the confession *which hath made the sea and the dry land* (Jonah 1:9) reaches back to the third day of creation.'
  FROM cross_reference_threads t
  JOIN _s332_jon01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=1 AND sv.verse_number=9
  JOIN _s332_jon01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-1-which-hath-made-the-sea-and-the-dry-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *The sea is his, and he made it: and his hands formed the dry land* (Psalm 95:5) — Jonah''s confession (1:9) is the Psalm''s praise word for word.'
  FROM cross_reference_threads t
  JOIN _s332_jon01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=1 AND sv.verse_number=9
  JOIN _s332_jon01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=95 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-1-which-hath-made-the-sea-and-the-dry-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Elohim (God) that made the world and all things therein... the Lord of heaven and earth* (Acts 17:24) — the Creator Jonah confesses to the pagan sailors is the One Paul proclaims to the pagan Athenians.'
  FROM cross_reference_threads t
  JOIN _s332_jon01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=1 AND sv.verse_number=9
  JOIN _s332_jon01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=17 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-1-which-hath-made-the-sea-and-the-dry-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*By his counsel he appeaseth the deep, and planteth islands in it* (Sirach 43:23) — the Maker of sea and land (Jonah 1:9) rules the deep that swallows the prophet.'
  FROM cross_reference_threads t
  JOIN _s332_jon01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=1 AND sv.verse_number=9
  JOIN _s332_jon01_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=43 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-1-which-hath-made-the-sea-and-the-dry-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*variety of all kinds of beasts and whales created* (Sirach 43:25) — the confessed Maker (Jonah 1:9) holds the very *great fish* of the sign (1:17) in his hand.'
  FROM cross_reference_threads t
  JOIN _s332_jon01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=1 AND sv.verse_number=9
  JOIN _s332_jon01_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=43 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-1-which-hath-made-the-sea-and-the-dry-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *my name shall be great among the Gentiles... in every place incense shall be offered unto my name, and a pure offering* (Malachi 1:11) — the crew that *feared Yahuah (LORD) exceedingly, and offered a sacrifice* (Jonah 1:16) is a foretaste of the nations brought to worship the Creator.'
  FROM cross_reference_threads t
  JOIN _s332_jon01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=1 AND sv.verse_number=16
  JOIN _s332_jon01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=1 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-1-which-hath-made-the-sea-and-the-dry-land'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *one man should die for the people, and that the whole nation perish not* (John 11:50) — Jonah''s *cast me forth into the sea; so shall the sea be calm unto you* (1:12) is the same one-for-the-many logic, the type of the One given for the people.'
  FROM cross_reference_threads t
  JOIN _s332_jon01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=1 AND sv.verse_number=12
  JOIN _s332_jon01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=11 AND tv.verse_number=50
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-1-cast-me-forth-into-the-sea-the-one-for-the-many'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I am come into deep waters, where the floods overflow me* (Psalm 69:2) — when *they... cast him forth into the sea* (Jonah 1:15) the prophet descends into the very deep the Psalm cries from.'
  FROM cross_reference_threads t
  JOIN _s332_jon01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=1 AND sv.verse_number=15
  JOIN _s332_jon01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=69 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-1-cast-me-forth-into-the-sea-the-one-for-the-many'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*all thy waves and thy billows are gone over me* (Psalm 42:7) — the sea that *ceased from her raging* (Jonah 1:15) first closed over the one cast forth; the deep that calls unto deep.'
  FROM cross_reference_threads t
  JOIN _s332_jon01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=1 AND sv.verse_number=15
  JOIN _s332_jon01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=42 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-1-cast-me-forth-into-the-sea-the-one-for-the-many'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★★, KEYSTONE)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *as Jonas was three days and three nights in the whale''s belly; so shall the Son of Adam be three days and three nights in the heart of the earth* (Matthew 12:40) — the keystone; the great fish (Jonah 1:17) is the figure of the Son''s burial and rising.'
  FROM cross_reference_threads t
  JOIN _s332_jon01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=1 AND sv.verse_number=17
  JOIN _s332_jon01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=40
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-1-three-days-and-three-nights-the-sign-of-jonah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *there shall no sign be given to it, but the sign of the prophet Jonas* (Matthew 12:39) — all of Jonah 1:17 gathered into the one sign given to the generation.'
  FROM cross_reference_threads t
  JOIN _s332_jon01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=1 AND sv.verse_number=17
  JOIN _s332_jon01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-1-three-days-and-three-nights-the-sign-of-jonah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *there shall no sign be given unto it, but the sign of the prophet Jonas* (Matthew 16:4) — again the burial-and-rising type (Jonah 1:17) is the sign refused to the sign-seekers and given to faith.'
  FROM cross_reference_threads t
  JOIN _s332_jon01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=1 AND sv.verse_number=17
  JOIN _s332_jon01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=16 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-1-three-days-and-three-nights-the-sign-of-jonah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *as Jonas was a sign unto the Ninevites, so shall also the Son of Adam be to this generation* (Luke 11:30) — Jonah given up out of the fish (1:17) and sent to the nations is the figure of the risen Son of Adam.'
  FROM cross_reference_threads t
  JOIN _s332_jon01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=1 AND sv.verse_number=17
  JOIN _s332_jon01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=11 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-1-three-days-and-three-nights-the-sign-of-jonah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*there shall no sign be given it, but the sign of Jonas the prophet* (Luke 11:29) — the three days and three nights in the fish (Jonah 1:17) is the one sign granted to the generation.'
  FROM cross_reference_threads t
  JOIN _s332_jon01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=1 AND sv.verse_number=17
  JOIN _s332_jon01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=11 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-1-three-days-and-three-nights-the-sign-of-jonah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jonah_2.sql (Jonah 2) -----
-- Chapter: Jonah 2 — Jonah's prayer from the belly of the fish. *I cried by reason of mine
-- affliction unto Yahuah (LORD), and he heard me; out of the belly of hell cried I, and thou
-- heardest my voice* (2:2); *yet hast thou brought up my life from corruption, O Yahuah (LORD)
-- my Elohim (God)* (2:6); *Salvation is of Yahuah (LORD)* (2:9). The chapter is a psalm woven
-- from the Psalter — the descent into the deep/Sheol as a type of death and the grave (the sign
-- of Jonah, Matthew 12:40 "the heart of the earth"), the soul brought up from corruption (the
-- resurrection type, Psalm 16:10 → Acts 2:27/13:35), and the climactic name-confession
-- *Salvation is of Yahuah* (Yeshu'atah la-Yahuah — the very name Yahusha = "Yahuah is
-- salvation"). The deliverance at Yahuah's word completes the burial-rising type (Hosea 6:2 the
-- third day; 1 Corinthians 15:4 raised the third day).
-- Tag: jon02   Temp view: _s332_jon02_lookup
-- Sort band: base 45358, step 3 -> threads at 45358, 45361, 45364, 45367 (4 threads)
-- Source of EVERY row: 'canon','jonah',2,v
--
-- Jonah 2 coverage:
--   v.1 (Then Jonah prayed unto Yahuah Elohav (the LORD his God) out of the fish's belly)
--        NT/Extras/Tanakh: none separate — the prayer's setting; woven into THREAD 1's prose.
--   ★★ v.2-3 (I cried... out of the belly of hell cried I, and thou heardest my voice... the
--          floods compassed me about: all thy billows and thy waves passed over me)
--        NT:     ★★ Matthew 12:40 (as Jonas was three days and three nights in the whale's belly;
--                so shall the Son of Adam be three days and three nights in the heart of the
--                earth) — THREAD 1 (the sign of Jonah, the descent)
--        Extras: ★ Ecclesiasticus 51:2-3,5,11 (delivered me... from the depth of the belly of
--                hell... my prayer was heard) — THREAD 1 (clean witness, the cry from Sheol heard)
--        Tanakh: ★★ Psalm 42:7 (all thy waves and thy billows are gone over me); ★ Psalm 18:4-6
--                (the sorrows of hell compassed me about... he heard my voice out of his temple);
--                ★ Psalm 130:1 (Out of the depths have I cried unto thee, O Yahuah) — THREAD 1
--   ★ v.4 (I am cast out of thy sight; yet I will look again toward thy holy temple)
--        NT:     none warranted distinct (the turn-of-faith toward the temple is the Tanakh's own
--                temple-prayer pattern; held in THREAD 2 prose)
--        Extras: none warranted
--        Tanakh: ★ 1 Kings 8:38-39 (spread forth his hands toward this house... then hear thou in
--                heaven) — THREAD 2
--   v.5 (The waters compassed me about, even to the soul... the weeds were wrapped about my head)
--        NT/Extras: none warranted (the depths-imagery woven into THREAD 1)
--        Tanakh: ★ Psalm 69:1-2 (the waters are come in unto my soul... I am come into deep
--                waters) — THREAD 1
--   ★★ v.6 (I went down to the bottoms of the mountains... yet hast thou brought up my life from
--          corruption, O Yahuah my Elohim)
--        NT:     ★★ Acts 2:27 (thou wilt not leave my soul in hell, neither wilt thou suffer
--                thine Holy One to see corruption); ★ Acts 13:35 (Thou shalt not suffer thine
--                Holy One to see corruption) — THREAD 2; and THREAD 4 (the raising)
--        Extras: none warranted (Sirach in THREAD 1)
--        Tanakh: ★★ Psalm 16:10 (thou wilt not leave my soul in hell; neither wilt thou suffer
--                thine Holy One to see corruption) — THREAD 2
--   v.7 (When my soul fainted within me I remembered Yahuah: and my prayer came in unto thee,
--          into thine holy temple)
--        Tanakh: ★ 1 Kings 8:38-39 (THREAD 2 — the prayer reaching the temple)
--   ★ v.8 (They that observe lying vanities forsake their own mercy)
--        Tanakh: ★ Psalm 31:6 (I have hated them that regard lying vanities: but I trust in
--                Yahuah) — THREAD 3
--   ★★ v.9 (I will sacrifice unto thee with the voice of thanksgiving; I will pay that that I
--          have vowed. Salvation is of Yahuah)
--        NT:     ★ Hebrews 13:15 (the sacrifice of praise... the fruit of our lips); ★ Revelation
--                7:10 (Salvation to our Elohim which sitteth upon the throne) — THREAD 3
--        Extras: none warranted (Sirach thanksgiving woven in THREAD 1)
--        Tanakh: ★★ Psalm 3:8 (Salvation belongeth unto Yahuah); ★ Psalm 50:14 (Offer unto
--                Elohim thanksgiving; and pay thy vows unto the El Elyon) — THREAD 3
--   ★ v.10 (And Yahuah spake unto the fish, and it vomited out Jonah upon the dry land)
--        NT:     ★★ 1 Corinthians 15:4 (he was buried, and... he rose again the third day
--                according to the scriptures) — THREAD 4
--        Extras: none warranted
--        Tanakh: ★★ Hosea 6:2 (in the third day he will raise us up, and we shall live in his
--                sight) — THREAD 4
--
-- Threads (slug — target libraries):
--   1. jonah-2-out-of-the-belly-of-hell-cried-i — NT (Matthew 12) + Extras (Ecclesiasticus 51)
--      + Tanakh (Psalm 42, 69, 18, 130) [extras] (★★ the descent into the deep/Sheol; the sign
--      of Jonah; the cry heard from the depths; the waves/billows psalms)
--   2. jonah-2-brought-up-my-life-from-corruption — NT (Acts 2, Acts 13) + Tanakh (Psalm 16,
--      1 Kings 8) [free] (★★ the turn toward the temple + brought up from corruption = the
--      resurrection-from-corruption type, the Holy One who sees no corruption)
--   3. jonah-2-salvation-is-of-yahuah — NT (Hebrews 13, Revelation 7) + Tanakh (Psalm 3, 50, 31)
--      [free] (★★ the name-confession Salvation-is-of-Yahuah = Yahusha; the thanksgiving
--      sacrifice and paid vow; the lying vanities forsaken)
--   4. jonah-2-vomited-out-upon-the-dry-land-the-third-day — NT (1 Corinthians 15) + Tanakh
--      (Hosea 6) [free] (★ the deliverance at Yahuah's word = the burial-rising completed, the
--      third-day raising)
--
-- Framing notes:
--   ★★ THE DESCENT / THE SIGN OF JONAH (THREAD 1): *out of the belly of hell cried I, and thou
--      heardest my voice* (2:2); *all thy billows and thy waves passed over me* (2:3). Yahusha
--      names this very descent as the one sign given: *as Jonas was three days and three nights
--      in the whale's belly; so shall the Son of Adam be three days and three nights in the heart
--      of the earth* (Matthew 12:40) — the belly of the fish a type of the grave. The waves are
--      the Psalter's own: *all thy waves and thy billows are gone over me* (Psalm 42:7); the cry
--      from the depths *Out of the depths have I cried unto thee, O Yahuah* (Psalm 130:1) and
--      *the sorrows of hell compassed me about... he heard my voice out of his temple* (Psalm
--      18:5-6). The restored witness sings the same deliverance from Sheol: *from the depth of
--      the belly of hell... my prayer was heard* (Ecclesiasticus 51:5,11).
--   ★★ BROUGHT UP FROM CORRUPTION (THREAD 2): *yet hast thou brought up my life from
--      corruption, O Yahuah my Elohim* (2:6) is the resurrection word. David sang it of the Holy
--      One — *thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see
--      corruption* (Psalm 16:10) — and Peter and Paul declare it fulfilled in the risen Messiah
--      (Acts 2:27; Acts 13:35). The turn of faith from the depths is the temple-prayer pattern:
--      *yet I will look again toward thy holy temple* (2:4) answers Solomon's *spread forth his
--      hands toward this house... then hear thou in heaven* (1 Kings 8:38-39).
--   ★★ SALVATION IS OF YAHUAH (THREAD 3): *Salvation is of Yahuah* (2:9) — the name-confession
--      itself (Yahusha = "Yahuah is salvation"). *Salvation belongeth unto Yahuah* (Psalm 3:8),
--      *Salvation to our Elohim which sitteth upon the throne* (Revelation 7:10). The thanksgiving
--      sacrifice and paid vow are the Psalter's appointed worship: *Offer unto Elohim
--      thanksgiving; and pay thy vows unto the El Elyon* (Psalm 50:14), filled in *the sacrifice
--      of praise... the fruit of our lips* (Hebrews 13:15). The forsaken vanities: *I have hated
--      them that regard lying vanities: but I trust in Yahuah* (Psalm 31:6).
--   ★ THE DELIVERANCE / THE THIRD DAY (THREAD 4): *And Yahuah spake unto the fish, and it
--      vomited out Jonah upon the dry land* (2:10) — the rising from the deep at Yahuah's word.
--      Hosea sings the same raising: *in the third day he will raise us up, and we shall live in
--      his sight* (Hosea 6:2); and Paul: *he was buried, and... he rose again the third day
--      according to the scriptures* (1 Corinthians 15:4). The dry land is the new life.
--   VERSES WITH NO SEPARATE ADD: v.1 (the setting of the prayer — woven into THREAD 1), v.5 (the
--      waters/weeds — depths-imagery folded into THREAD 1 with Psalm 69), v.7 (the prayer
--      reaching the temple — folded into THREAD 2 with v.4 and 1 Kings 8). All recorded, none
--      silently skipped.

CREATE TEMP VIEW _s332_jon02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): Out of the belly of hell cried I — the descent, the sign of Jonah, the depths psalms
    ('canon','jonah',2,2,'canon','matthew',12,40,'free',
      E'*For as Jonas was three days and three nights in the whale''s belly; so shall the Son of Adam be three days and three nights in the heart of the earth* (Matthew 12:40). Yahusha (Jesus) names the descent of Jonah''s prayer — *out of the belly of hell cried I, and thou heardest my voice* (Jonah 2:2) — as the one sign given: the belly of the fish a type of *the heart of the earth*, the grave from which he would rise. The cry from Sheol is the foreshadow of the three days in the tomb.'),
    ('canon','jonah',2,2,'apocrypha','ecclesiasticus',51,5,'extras',
      E'*From the depth of the belly of hell, from an unclean tongue, and from lying words* (Ecclesiasticus 51:5). The restored witness sings the same deliverance Jonah cried for — *out of the belly of hell cried I* (Jonah 2:2) — *from the depth of the belly of hell* the soul is drawn up. One cry from Sheol, one Yahuah who hears from the depths.'),
    ('canon','jonah',2,2,'apocrypha','ecclesiasticus',51,11,'extras',
      E'*I will praise your name continually, and will sing praises with thanksgiving; and so my prayer was heard* (Ecclesiasticus 51:11). Jonah''s *he heard me... and thou heardest my voice* (Jonah 2:2) is the same answered cry — *so my prayer was heard*. The prayer from the depths reaches Yahuah and is heard; deliverance turns to thanksgiving.'),
    ('canon','jonah',2,3,'canon','psalms',42,7,'free',
      E'*Deep calleth unto deep at the noise of thy waterspouts: all thy waves and thy billows are gone over me* (Psalm 42:7). Jonah''s *all thy billows and thy waves passed over me* (Jonah 2:3) is the Psalter''s own word — the chapter is a psalm woven from the Psalter. The waters of affliction are owned as Yahuah''s: *all THY waves and THY billows*, the hand that casts down is the hand that will bring up.'),
    ('canon','jonah',2,5,'canon','psalms',69,1,'free',
      E'*Save me, O Elohim (God); for the waters are come in unto my soul* (Psalm 69:1). Jonah''s *The waters compassed me about, even to the soul* (Jonah 2:5) is this very cry — *the waters are come in unto my soul*. The engulfing deep, the soul brought to the edge of drowning, the plea that Yahuah save from the flood.'),
    ('canon','jonah',2,5,'canon','psalms',69,2,'free',
      E'*I sink in deep mire, where there is no standing: I am come into deep waters, where the floods overflow me* (Psalm 69:2). The depth that *closed me round about, the weeds were wrapped about my head* (Jonah 2:5) is the same sinking — *deep waters, where the floods overflow me*. The man with no standing, swallowed by the deep, with only the cry left to him.'),
    ('canon','jonah',2,2,'canon','psalms',130,1,'free',
      E'*Out of the depths have I cried unto thee, O Yahuah (LORD)* (Psalm 130:1). Jonah''s *out of the belly of hell cried I* (Jonah 2:2) is the very posture of this psalm — *Out of the depths have I cried unto thee*. From the lowest place the cry goes up, and Yahuah, with whom *is plenteous redemption* (Psalm 130:7), hears.'),
    ('canon','jonah',2,2,'canon','psalms',18,5,'free',
      E'*The sorrows of hell compassed me about: the snares of death prevented me* (Psalm 18:5). Jonah''s *out of the belly of hell cried I* (Jonah 2:2) echoes David encircled by *the sorrows of hell* — the same grip of Sheol, the same death-snares, the same cry that follows.'),
    ('canon','jonah',2,2,'canon','psalms',18,6,'free',
      E'*In my distress I called upon Yahuah (LORD), and cried unto my Elohim (God): he heard my voice out of his temple, and my cry came before him, even into his ears* (Psalm 18:6). Jonah''s *and thou heardest my voice* (Jonah 2:2) is David''s *he heard my voice out of his temple* — and Jonah too looks *toward thy holy temple* (2:4,7). The cry from the depths is heard from the temple on high.'),

    -- THREAD 2 (★★): Brought up my life from corruption — the resurrection type, the temple-turn
    ('canon','jonah',2,6,'canon','psalms',16,10,'free',
      E'*For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption* (Psalm 16:10). Jonah''s *yet hast thou brought up my life from corruption, O Yahuah (LORD) my Elohim (God)* (Jonah 2:6) is the resurrection word David sang of the Holy One — *thou wilt not... suffer thine Holy One to see corruption*. The life drawn up from the pit is the type of the One raised incorruptible.'),
    ('canon','jonah',2,6,'canon','acts',2,27,'free',
      E'*Because thou wilt not leave my soul in hell, neither wilt thou suffer thine Holy One to see corruption* (Acts 2:27). Peter at Pentecost reads Psalm 16:10 as fulfilled in the risen Messiah — *his soul was not left in hell, neither his flesh did see corruption* (Acts 2:31). Jonah''s *brought up my life from corruption* (Jonah 2:6) is the same deliverance from the grave, the foreshadow filled in the resurrection.'),
    ('canon','jonah',2,6,'canon','acts',13,35,'free',
      E'*Wherefore he saith also in another psalm, Thou shalt not suffer thine Holy One to see corruption* (Acts 13:35). Paul at Antioch declares it of the One *whom Elohim (God) raised again, saw no corruption* (Acts 13:37). Jonah *brought up... from corruption* (Jonah 2:6) is the pattern; the Holy One who saw no corruption is its fulfillment.'),
    ('canon','jonah',2,4,'canon','1-kings',8,38,'free',
      E'*What prayer and supplication soever be made by any man, or by all thy people Yashar''el (Israel), which shall know every man the plague of his own heart, and spread forth his hands toward this house* (1 Kings 8:38). Jonah''s turn of faith from the depths — *yet I will look again toward thy holy temple* (Jonah 2:4) — is the very temple-prayer Solomon dedicated: the afflicted man who *spread forth his hands toward this house*.'),
    ('canon','jonah',2,7,'canon','1-kings',8,39,'free',
      E'*Then hear thou in heaven thy dwelling place, and forgive, and do, and give to every man according to his ways, whose heart thou knowest* (1 Kings 8:39). Jonah''s *my prayer came in unto thee, into thine holy temple* (Jonah 2:7) is the answer to Solomon''s plea — the prayer made toward the house is heard in heaven, Yahuah''s dwelling place. The cry from the fish''s belly reaches the throne.'),

    -- THREAD 3 (★★): Salvation is of Yahuah — the name-confession, the thanksgiving, the vanities forsaken
    ('canon','jonah',2,9,'canon','psalms',3,8,'free',
      E'*Salvation belongeth unto Yahuah (LORD): thy blessing is upon thy people* (Psalm 3:8). Jonah''s climactic confession *Salvation is of Yahuah (LORD)* (Jonah 2:9) is the Psalter''s own — *Salvation belongeth unto Yahuah*. The deliverance is no man''s work; it is of Yahuah alone, the very meaning carried in the Name Yahusha — Yahuah is salvation.'),
    ('canon','jonah',2,9,'canon','psalms',50,14,'free',
      E'*Offer unto Elohim (God) thanksgiving; and pay thy vows unto the El Elyon (most High)* (Psalm 50:14). Jonah''s vow — *I will sacrifice unto thee with the voice of thanksgiving; I will pay that that I have vowed* (Jonah 2:9) — is exactly this appointed worship: the thanksgiving offering and the paid vow. *Whoso offereth praise glorifieth me* (Psalm 50:23).'),
    ('canon','jonah',2,8,'canon','psalms',31,6,'free',
      E'*I have hated them that regard lying vanities: but I trust in Yahuah (LORD)* (Psalm 31:6). Jonah''s *They that observe lying vanities forsake their own mercy* (Jonah 2:8) is David''s same renouncing — the idols that cannot save are forsaken, and trust is set on Yahuah, with whom salvation is. From the same psalm: *Into thine hand I commit my spirit* (Psalm 31:5).'),
    ('canon','jonah',2,9,'canon','hebrews',13,15,'free',
      E'*By him therefore let us offer the sacrifice of praise to Elohim (God) continually, that is, the fruit of our lips giving thanks to his name* (Hebrews 13:15). Jonah''s *the voice of thanksgiving* (Jonah 2:9) is filled in *the sacrifice of praise... the fruit of our lips giving thanks to his name*. The thanksgiving the delivered man pours is the offering that pleases — praise from one drawn up out of the depths.'),
    ('canon','jonah',2,9,'canon','revelation',7,10,'free',
      E'*And cried with a loud voice, saying, Salvation to our Elohim (God) which sitteth upon the throne, and unto the Lamb* (Revelation 7:10). Jonah''s *Salvation is of Yahuah (LORD)* (Jonah 2:9) is the cry of the great multitude before the throne — *Salvation to our Elohim*. The confession from the fish''s belly becomes the song of the redeemed; salvation is of Yahuah, first and last.'),

    -- THREAD 4 (★): Vomited out upon the dry land — the deliverance, the third-day raising
    ('canon','jonah',2,10,'canon','hosea',6,2,'free',
      E'*After two days will he revive us: in the third day he will raise us up, and we shall live in his sight* (Hosea 6:2). Jonah delivered at Yahuah''s word — *And Yahuah (LORD) spake unto the fish, and it vomited out Jonah upon the dry land* (Jonah 2:10) — is the burial-rising type Hosea sings: the third-day raising, the dead brought up to *live in his sight*. The dry land is the new life.'),
    ('canon','jonah',2,10,'canon','1-corinthians',15,4,'free',
      E'*And that he was buried, and that he rose again the third day according to the scriptures* (1 Corinthians 15:4). The deliverance of Jonah from the deep — *it vomited out Jonah upon the dry land* (Jonah 2:10), after the three days in the belly (the sign of Jonah) — foreshadows *he was buried, and... he rose again the third day according to the scriptures*. The cast-down life is raised; salvation is of Yahuah.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s332_jon02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s332_jon02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jonah-2-out-of-the-belly-of-hell-cried-i',
       E'Out of the belly of hell cried I — the descent, and the cry heard from the depths',
       E'From inside the fish Jonah prays, and the prayer is a psalm woven from the Psalter: *I cried by reason of mine affliction unto Yahuah (LORD), and he heard me; out of the belly of hell cried I, and thou heardest my voice. For thou hadst cast me into the deep, in the midst of the seas; and the floods compassed me about: all thy billows and thy waves passed over me* (Jonah 2:2-3); *The waters compassed me about, even to the soul: the depth closed me round about, the weeds were wrapped about my head* (2:5). This is the descent into the deep, a type of death and the grave — and Yahusha (Jesus) names it the one sign given: *For as Jonas was three days and three nights in the whale''s belly; so shall the Son of Adam be three days and three nights in the heart of the earth* (Matthew 12:40). The waves are the Psalter''s own: *Deep calleth unto deep at the noise of thy waterspouts: all thy waves and thy billows are gone over me* (Psalm 42:7); *Save me, O Elohim (God); for the waters are come in unto my soul... I am come into deep waters, where the floods overflow me* (Psalm 69:1-2). And the cry from the depths is heard: *Out of the depths have I cried unto thee, O Yahuah (LORD)* (Psalm 130:1); *The sorrows of hell compassed me about... In my distress I called upon Yahuah (LORD)... he heard my voice out of his temple* (Psalm 18:5-6). The restored witness sings the same deliverance from Sheol: *From the depth of the belly of hell, from an unclean tongue, and from lying words* (Ecclesiasticus 51:5)... *and so my prayer was heard* (51:11). One cry from the depths, one Yahuah who hears.',
       sv.verse_id, ev.verse_id, 'extras', 45358
  FROM _s332_jon02_lookup sv, _s332_jon02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=2 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='jonah' AND ev.chapter_number=2 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jonah-2-brought-up-my-life-from-corruption',
       E'Brought up my life from corruption — the temple-turn and the resurrection type',
       E'Even from the lowest place the prayer turns toward Yahuah: *Then I said, I am cast out of thy sight; yet I will look again toward thy holy temple* (Jonah 2:4); *When my soul fainted within me I remembered Yahuah (LORD): and my prayer came in unto thee, into thine holy temple* (2:7). This is the very temple-prayer Solomon dedicated — the afflicted man who *spread forth his hands toward this house* (1 Kings 8:38), whom Yahuah hears *in heaven thy dwelling place* (8:39). And from the bottoms of the mountains comes the resurrection word: *I went down to the bottoms of the mountains; the earth with her bars was about me for ever: yet hast thou brought up my life from corruption, O Yahuah (LORD) my Elohim (God)* (Jonah 2:6). David sang it of the Holy One — *For thou wilt not leave my soul in hell; neither wilt thou suffer thine Holy One to see corruption* (Psalm 16:10) — and Peter and Paul declare it fulfilled in the risen Messiah: *thou wilt not... suffer thine Holy One to see corruption* (Acts 2:27); *Thou shalt not suffer thine Holy One to see corruption* (Acts 13:35), of the One *whom Elohim (God) raised again, saw no corruption* (Acts 13:37). The life brought up from the pit is the type of the One raised incorruptible.',
       sv.verse_id, ev.verse_id, 'free', 45361
  FROM _s332_jon02_lookup sv, _s332_jon02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=2 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='jonah' AND ev.chapter_number=2 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jonah-2-salvation-is-of-yahuah',
       E'Salvation is of Yahuah — the name-confession, the thanksgiving, the vanities forsaken',
       E'The prayer climbs to its confession: *They that observe lying vanities forsake their own mercy. But I will sacrifice unto thee with the voice of thanksgiving; I will pay that that I have vowed. Salvation is of Yahuah (LORD)* (Jonah 2:8-9). *Salvation is of Yahuah* — Yeshu''atah la-Yahuah — is the very meaning carried in the Name Yahusha (Jesus): Yahuah is salvation. The Psalter says it the same: *Salvation belongeth unto Yahuah (LORD): thy blessing is upon thy people* (Psalm 3:8), and the redeemed before the throne cry it: *Salvation to our Elohim (God) which sitteth upon the throne, and unto the Lamb* (Revelation 7:10). The forsaking of idols is David''s own: *I have hated them that regard lying vanities: but I trust in Yahuah (LORD)* (Psalm 31:6) — the vanities that cannot save are abandoned, and trust is set where salvation truly is. And the vow of thanksgiving is the appointed worship: *Offer unto Elohim (God) thanksgiving; and pay thy vows unto the El Elyon (most High)* (Psalm 50:14), filled in *the sacrifice of praise... the fruit of our lips giving thanks to his name* (Hebrews 13:15). The man drawn up from the depths answers with thanksgiving, for salvation is of Yahuah alone.',
       sv.verse_id, ev.verse_id, 'free', 45364
  FROM _s332_jon02_lookup sv, _s332_jon02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=2 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='jonah' AND ev.chapter_number=2 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jonah-2-vomited-out-upon-the-dry-land-the-third-day',
       E'Vomited out upon the dry land — the deliverance, the third-day raising',
       E'The prayer is answered in deliverance at Yahuah''s word: *And Yahuah (LORD) spake unto the fish, and it vomited out Jonah upon the dry land* (Jonah 2:10). After the three days in the belly — the sign of Jonah — the cast-down life is raised, the dry land its new life. Hosea sings the same burial-rising: *After two days will he revive us: in the third day he will raise us up, and we shall live in his sight* (Hosea 6:2). And Paul names the gospel itself: *that he was buried, and that he rose again the third day according to the scriptures* (1 Corinthians 15:4). The deliverance from the deep is the foreshadow of the resurrection on the third day; the life Yahuah brought up from corruption (2:6) walks out upon dry land — for salvation is of Yahuah.',
       sv.verse_id, ev.verse_id, 'free', 45367
  FROM _s332_jon02_lookup sv, _s332_jon02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=2 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='jonah' AND ev.chapter_number=2 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *so shall the Son of Adam be three days and three nights in the heart of the earth* (Matthew 12:40) — the belly of the fish (Jonah 2:2) a type of the grave; the one sign given.'
  FROM cross_reference_threads t
  JOIN _s332_jon02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s332_jon02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=40
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-2-out-of-the-belly-of-hell-cried-i'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Out of the depths have I cried unto thee, O Yahuah (LORD)* (Psalm 130:1) — the same posture as *out of the belly of hell cried I* (Jonah 2:2); the cry from the lowest place.'
  FROM cross_reference_threads t
  JOIN _s332_jon02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s332_jon02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=130 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-2-out-of-the-belly-of-hell-cried-i'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*The sorrows of hell compassed me about: the snares of death prevented me* (Psalm 18:5) — David encircled by Sheol as Jonah *out of the belly of hell cried I* (Jonah 2:2).'
  FROM cross_reference_threads t
  JOIN _s332_jon02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s332_jon02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-2-out-of-the-belly-of-hell-cried-i'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*he heard my voice out of his temple, and my cry came before him* (Psalm 18:6) — *thou heardest my voice* (Jonah 2:2); the cry from the depths heard from the temple on high.'
  FROM cross_reference_threads t
  JOIN _s332_jon02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s332_jon02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-2-out-of-the-belly-of-hell-cried-i'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *From the depth of the belly of hell... and from lying words* (Ecclesiasticus 51:5) — the restored witness''s same deliverance from Sheol as Jonah *out of the belly of hell* (Jonah 2:2).'
  FROM cross_reference_threads t
  JOIN _s332_jon02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s332_jon02_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=51 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-2-out-of-the-belly-of-hell-cried-i'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*and so my prayer was heard* (Ecclesiasticus 51:11) — the same answered cry as *he heard me... and thou heardest my voice* (Jonah 2:2).'
  FROM cross_reference_threads t
  JOIN _s332_jon02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s332_jon02_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=51 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-2-out-of-the-belly-of-hell-cried-i'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★★ *all thy waves and thy billows are gone over me* (Psalm 42:7) — Jonah''s *all thy billows and thy waves passed over me* (Jonah 2:3); the waters owned as Yahuah''s own.'
  FROM cross_reference_threads t
  JOIN _s332_jon02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=2 AND sv.verse_number=3
  JOIN _s332_jon02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=42 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-2-out-of-the-belly-of-hell-cried-i'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*for the waters are come in unto my soul* (Psalm 69:1) — Jonah''s *The waters compassed me about, even to the soul* (Jonah 2:5); the engulfing deep.'
  FROM cross_reference_threads t
  JOIN _s332_jon02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s332_jon02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=69 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-2-out-of-the-belly-of-hell-cried-i'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*I am come into deep waters, where the floods overflow me* (Psalm 69:2) — the depth that *closed me round about* (Jonah 2:5); no standing, swallowed by the deep.'
  FROM cross_reference_threads t
  JOIN _s332_jon02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=2 AND sv.verse_number=5
  JOIN _s332_jon02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=69 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-2-out-of-the-belly-of-hell-cried-i'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *neither wilt thou suffer thine Holy One to see corruption* (Psalm 16:10) — Jonah''s *brought up my life from corruption* (Jonah 2:6); the resurrection word David sang of the Holy One.'
  FROM cross_reference_threads t
  JOIN _s332_jon02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s332_jon02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=16 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-2-brought-up-my-life-from-corruption'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *neither wilt thou suffer thine Holy One to see corruption* (Acts 2:27) — Peter declares Psalm 16:10 fulfilled in the risen Messiah; Jonah *brought up... from corruption* (Jonah 2:6) is the foreshadow.'
  FROM cross_reference_threads t
  JOIN _s332_jon02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s332_jon02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-2-brought-up-my-life-from-corruption'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Thou shalt not suffer thine Holy One to see corruption* (Acts 13:35) — Paul of the One who *saw no corruption*; Jonah''s *brought up... from corruption* (Jonah 2:6) the pattern.'
  FROM cross_reference_threads t
  JOIN _s332_jon02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=2 AND sv.verse_number=6
  JOIN _s332_jon02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=13 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-2-brought-up-my-life-from-corruption'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *spread forth his hands toward this house* (1 Kings 8:38) — Jonah''s *yet I will look again toward thy holy temple* (Jonah 2:4); the temple-prayer of the afflicted.'
  FROM cross_reference_threads t
  JOIN _s332_jon02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=2 AND sv.verse_number=4
  JOIN _s332_jon02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=8 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-2-brought-up-my-life-from-corruption'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Then hear thou in heaven thy dwelling place, and forgive* (1 Kings 8:39) — Jonah''s *my prayer came in unto thee, into thine holy temple* (Jonah 2:7); the prayer toward the house heard in heaven.'
  FROM cross_reference_threads t
  JOIN _s332_jon02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=2 AND sv.verse_number=7
  JOIN _s332_jon02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=8 AND tv.verse_number=39
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-2-brought-up-my-life-from-corruption'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Salvation belongeth unto Yahuah (LORD): thy blessing is upon thy people* (Psalm 3:8) — the Psalter''s own *Salvation is of Yahuah* (Jonah 2:9); deliverance is of Yahuah alone.'
  FROM cross_reference_threads t
  JOIN _s332_jon02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=2 AND sv.verse_number=9
  JOIN _s332_jon02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=3 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-2-salvation-is-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Salvation to our Elohim (God) which sitteth upon the throne, and unto the Lamb* (Revelation 7:10) — the redeemed cry Jonah''s confession (Jonah 2:9) before the throne.'
  FROM cross_reference_threads t
  JOIN _s332_jon02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=2 AND sv.verse_number=9
  JOIN _s332_jon02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-2-salvation-is-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Offer unto Elohim (God) thanksgiving; and pay thy vows unto the El Elyon (most High)* (Psalm 50:14) — Jonah''s *the voice of thanksgiving; I will pay that that I have vowed* (Jonah 2:9); the appointed worship.'
  FROM cross_reference_threads t
  JOIN _s332_jon02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=2 AND sv.verse_number=9
  JOIN _s332_jon02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=50 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-2-salvation-is-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *the sacrifice of praise... the fruit of our lips giving thanks to his name* (Hebrews 13:15) — Jonah''s *the voice of thanksgiving* (Jonah 2:9) filled in the offering that pleases.'
  FROM cross_reference_threads t
  JOIN _s332_jon02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=2 AND sv.verse_number=9
  JOIN _s332_jon02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-2-salvation-is-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*I have hated them that regard lying vanities: but I trust in Yahuah (LORD)* (Psalm 31:6) — Jonah''s *They that observe lying vanities forsake their own mercy* (Jonah 2:8); the idols that cannot save forsaken.'
  FROM cross_reference_threads t
  JOIN _s332_jon02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=2 AND sv.verse_number=8
  JOIN _s332_jon02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=31 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-2-salvation-is-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *in the third day he will raise us up, and we shall live in his sight* (Hosea 6:2) — Jonah delivered upon the dry land (Jonah 2:10); the third-day raising sung in Hosea.'
  FROM cross_reference_threads t
  JOIN _s332_jon02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=2 AND sv.verse_number=10
  JOIN _s332_jon02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=6 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-2-vomited-out-upon-the-dry-land-the-third-day'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *he was buried, and that he rose again the third day according to the scriptures* (1 Corinthians 15:4) — Jonah cast up on dry land (Jonah 2:10) the foreshadow of the resurrection on the third day.'
  FROM cross_reference_threads t
  JOIN _s332_jon02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=2 AND sv.verse_number=10
  JOIN _s332_jon02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-2-vomited-out-upon-the-dry-land-the-third-day'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jonah_3.sql (Jonah 3) -----
-- Chapter: Jonah 3 — NINEVEH HEARS, REPENTS, AND YAHUAH RELENTS. *And the word of Yahuah (LORD)
-- came unto Jonah the second time* (3:1) — the recommissioned prophet sent again to the great
-- pagan city. *So the people of Nineveh believed Elohim (God), and proclaimed a fast, and put on
-- sackcloth, from the greatest of them even to the least of them* (3:5) — the whole city, the king
-- off his throne in ashes, *let them turn every one from his evil way, and from the violence that
-- is in their hands* (3:8). And the verdict: *And Elohim (God) saw their works, that they turned
-- from their evil way; and Elohim (God) repented of the evil... and he did it not* (3:10). Yahusha
-- makes the men of Nineveh THE witness against the unrepentant generation (Matthew 12:41/Luke
-- 11:32); the nations' repentance shames Israel's hardness yet never replaces her (Romans 11 the
-- provocation — the gentiles gathered to fear Yahuah, the two-house people still beloved). True
-- repentance = turning from the WAY and the violence (fruits, not words — Acts 26:20, Matthew 3:8,
-- Ezekiel 18). And the relenting Elohim is the same across the canon: He repents of the evil when a
-- nation turns (Jeremiah 18:7-8, Exodus 32:14, Joel 2:13-14) — *I have no pleasure in the death of
-- the wicked* (Ezekiel 33:11).
-- Tag: jon03   Temp view: _s332_jon03_lookup
-- Sort band: base 45366, step 3 -> threads at 45366, 45369, 45372, 45375 (4 threads)
-- Source of EVERY row: 'canon','jonah',3,v
--
-- Jonah 3 coverage:
--   ★ v.1-2 (And the word of Yahuah (LORD) came unto Jonah the second time, saying, Arise, go unto
--          Nineveh... and preach unto it the preaching that I bid thee)
--        NT:     ★ John 21:15-17 (Yahusha saith to Simon Peter... Feed my sheep — the third-time
--                restoration of the fallen servant, "son of Jonas") — THREAD 1
--        Extras: none warranted (the restored-commission weave is the NT's own)
--        Tanakh: held in prose (the second word = Yahuah's patience with His servant)
--   v.3-4 (Jonah arose, and went unto Nineveh... Yet forty days, and Nineveh shall be overthrown)
--        NT:     woven into THREAD 2 (the preaching of Jonas the men of Nineveh repented at)
--        Extras: none warranted
--        Tanakh: none separate (the forty-day warning is the preface to the repentance)
--   ★★ v.5-9 (the people of Nineveh believed Elohim... proclaimed a fast... put on sackcloth... let
--          them turn every one from his evil way, and from the violence that is in their hands... Who
--          can tell if Elohim will turn and repent...)
--        NT:     ★★★ Matthew 12:41 (The men of Nineveh shall rise in judgment with this generation,
--                and shall condemn it: because they repented at the preaching of Jonas), ★★ Luke
--                11:32 (same) — THREAD 2 (the keystone); ★ Acts 26:20 (do works meet for
--                repentance), ★ Matthew 3:8 (fruits meet for repentance) — THREAD 3
--        Extras: ★ Sirach 17:24-26 (to them that repent, he granted them return... Return to Yahuah
--                (God), and forsake your sins... Turn again to the Most High) — THREAD 3 (clean
--                witness on returning to Yahuah)
--        Tanakh: ★ Ezekiel 18:21-23 (if the wicked will turn from all his sins... he shall surely
--                live) — THREAD 3 (the wicked turning and living)
--   ★★ v.10 (And Elohim saw their works, that they turned from their evil way; and Elohim repented
--          of the evil, that he had said that he would do unto them; and he did it not)
--        NT:     none warranted distinct (the relenting-Elohim weave is carried by the Tanakh's own
--                covenant-language; the NT keystone sits on the repentance of v.5-9, THREAD 2)
--        Extras: none warranted distinct (Sirach's return-and-forgive weave sits on THREAD 3)
--        Tanakh: ★★ Jeremiah 18:7-8 (if that nation... turn from their evil, I will repent of the
--                evil), ★ Exodus 32:14 (Yahuah repented of the evil which he thought to do), ★ Joel
--                2:13-14 (he is gracious and merciful... repenteth him of the evil... Who knoweth if
--                he will return and repent), ★ Ezekiel 33:11 (I have no pleasure in the death of the
--                wicked; but that the wicked turn from his way and live) — THREAD 4 (the keystone)
--
-- Threads (slug — target libraries):
--   1. jonah-3-the-word-came-the-second-time-restored-commission — NT (John 21) [free]
--      (★ the recommissioned prophet; the fallen servant restored — Peter, "son of Jonas," fed back)
--   2. jonah-3-the-men-of-nineveh-shall-rise-in-judgment — NT (Matthew 12, Luke 11) [free]
--      (★★★ THE keystone — the pagan city's repentance as witness against the unrepentant generation)
--   3. jonah-3-they-turned-from-their-evil-way-fruits-of-repentance — NT (Acts 26, Matthew 3) +
--      Tanakh (Ezekiel 18) + Extras (Sirach 17) [extras]
--      (★★ repentance = turning from the WAY and the violence; fruits/works, not words)
--   4. jonah-3-and-elohim-repented-of-the-evil-the-relenting — Tanakh (Jeremiah 18, Exodus 32, Joel
--      2, Ezekiel 33) [free]
--      (★★ the relenting Elohim — He repents of the evil when a nation truly turns)
--
-- Framing notes:
--   ★ THE SECOND WORD (THREAD 1): *And the word of Yahuah (LORD) came unto Jonah the second time*
--      (3:1). The fled and swallowed prophet is recommissioned — Yahuah's patience restoring His
--      servant. The clearest forward type is Peter, addressed three times as "son of Jonas," restored
--      after his threefold denial: *Simon, son of Jonas, lovest thou me?... Feed my sheep* (John
--      21:15-17). The fallen servant is sent again to feed/preach; mercy recommissions.
--   ★★★ THE MEN OF NINEVEH (THREAD 2, KEYSTONE): the whole city repents at the preaching — *So the
--      people of Nineveh believed Elohim (God), and proclaimed a fast, and put on sackcloth, from the
--      greatest of them even to the least of them* (3:5), the king himself off his throne in ashes
--      (3:6). Yahusha makes them the eschatological WITNESS: *The men of Nineveh shall rise in
--      judgment with this generation, and shall condemn it: because they repented at the preaching of
--      Jonas; and, behold, a greater than Jonas is here* (Matthew 12:41; Luke 11:32). A pagan city
--      heard one prophet and turned; the generation before the Greater-than-Jonas would not. Frame
--      via Romans 11: the nations' repentance PROVOKES, never replaces — the two-house people remain
--      beloved (Romans 11:1-2), and the gentiles are gathered to fear Yahuah.
--   ★★ THE FRUITS OF REPENTANCE (THREAD 3): true turning is conduct, not words — *let them turn
--      every one from his evil way, and from the violence that is in their hands* (3:8). The NT names
--      it: *do works meet for repentance* (Acts 26:20), *Bring forth therefore fruits meet for
--      repentance* (Matthew 3:8). The Tanakh's own rule of life stands: *if the wicked will turn from
--      all his sins... and keep all my statutes, and do that which is lawful and right, he shall
--      surely live* (Ezekiel 18:21) — repentance unto Torah-walking, never instead of it. The clean
--      extra-canonical witness echoes it: *Return to Yahuah (God), and forsake your sins... Turn
--      again to the Most High, and turn away from iniquity* (Sirach 17:25-26).
--   ★★ THE RELENTING ELOHIM (THREAD 4, KEYSTONE): *And Elohim (God) saw their works, that they
--      turned from their evil way; and Elohim (God) repented of the evil... and he did it not* (3:10).
--      This is the covenant rule Jeremiah states outright: *if that nation, against whom I have
--      pronounced, turn from their evil, I will repent of the evil that I thought to do unto them*
--      (Jeremiah 18:8). It is the mercy Moses pleaded and Yahuah granted: *And Yahuah (LORD) repented
--      of the evil which he thought to do unto his people* (Exodus 32:14). It is the heart Joel names:
--      *for he is gracious and merciful, slow to anger, and of great kindness, and repenteth him of
--      the evil* (Joel 2:13). And it is His own oath in Ezekiel: *I have no pleasure in the death of
--      the wicked; but that the wicked turn from his way and live* (Ezekiel 33:11).
--   EXTRAS: Sirach 17:24-26 (return to Yahuah and forsake sin) — clean parse verified, woven on the
--      fruits-of-repentance thread. No extras forced on the relenting-Elohim or the men-of-Nineveh
--      threads (the Tanakh/NT weave carries them).
--   VERSES WITH NO SEPARATE ADD: v.3-4 (Jonah's obedience + the forty-day warning — the preface to
--      the city's repentance, woven into THREAD 2's preaching). All recorded, none silently skipped.

CREATE TEMP VIEW _s332_jon03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): The word came the second time — the restored commission
    ('canon','jonah',3,1,'canon','john',21,15,'free',
      E'*So when they had dined, Yahusha (Jesus) saith to Simon Peter, Simon, son of Jonas, lovest thou me more than these? He saith unto him, Yea, Lord; thou knowest that I love thee. He saith unto him, Feed my lambs* (John 21:15). When *the word of Yahuah (LORD) came unto Jonah the second time* (Jonah 3:1), the fled and swallowed prophet is recommissioned — Yahuah''s patience restoring His servant. So Yahusha restores Peter, thrice-denying, addressing him as *Simon, son of Jonas* and sending him back to feed: mercy does not discard the fallen servant; it sends him again.'),
    ('canon','jonah',3,1,'canon','john',21,17,'free',
      E'*He saith unto him the third time, Simon, son of Jonas, lovest thou me?... Yahusha (Jesus) saith unto him, Feed my sheep* (John 21:17). The *second time* the word came to Jonah (Jonah 3:1) is the pattern of the restored prophet, and the third question to *Simon, son of Jonas* lifts Peter''s threefold denial into a threefold recommission — *Feed my sheep*. The servant who failed is sent again to the work; the second chance is grace recommissioning, not condemnation.'),

    -- THREAD 2 (★★★): The men of Nineveh shall rise in judgment — the keystone
    ('canon','jonah',3,5,'canon','matthew',12,41,'free',
      E'*The men of Nineveh shall rise in judgment with this generation, and shall condemn it: because they repented at the preaching of Jonas; and, behold, a greater than Jonas is here* (Matthew 12:41). When *the people of Nineveh believed Elohim (God), and proclaimed a fast, and put on sackcloth, from the greatest of them even to the least of them* (Jonah 3:5), a whole pagan city turned at one prophet''s word. Yahusha makes them the witness against the unrepentant generation that would not turn before the *greater than Jonas* — the nations'' repentance condemning the hardness of those who heard far more.'),
    ('canon','jonah',3,5,'canon','luke',11,32,'free',
      E'*The men of Nineve shall rise up in the judgment with this generation, and shall condemn it: for they repented at the preaching of Jonas; and, behold, a greater than Jonas is here* (Luke 11:32). The Ninevites who *believed Elohim (God), and proclaimed a fast* (Jonah 3:5) — pagans who heard one warning and turned — stand as the rising witness against the generation that beheld the Greater-than-Jonas and would not repent. The nations'' turning shames Israel''s hardness, yet never replaces her (Romans 11:1-2): it is provocation unto jealousy, the gentiles gathered to fear Yahuah.'),
    ('canon','jonah',3,8,'canon','matthew',12,41,'free',
      E'*The men of Nineveh shall rise in judgment with this generation... because they repented at the preaching of Jonas* (Matthew 12:41). What Yahusha calls repentance is exactly what Nineveh did: *let them turn every one from his evil way, and from the violence that is in their hands* (Jonah 3:8) — a turning of conduct, not a ceremony of words. This real turning is what *rise[s] in judgment* against a generation that confessed much and changed nothing.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s332_jon03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s332_jon03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 3 (★★): They turned from their evil way — fruits of repentance
    ('canon','jonah',3,8,'canon','acts',26,20,'free',
      E'*But shewed first unto them of Damascus, and at Jerusalem, and throughout all the coasts of Judæa, and then to the Gentiles, that they should repent and turn to Elohim (God), and do works meet for repentance* (Acts 26:20). Nineveh''s repentance was no empty fast: *let them turn every one from his evil way, and from the violence that is in their hands* (Jonah 3:8). Paul names the same thing — repentance proven by *works meet for repentance*, a turning of conduct to Elohim, not a confession of words alone.'),
    ('canon','jonah',3,8,'canon','matthew',3,8,'free',
      E'*Bring forth therefore fruits meet for repentance* (Matthew 3:8). The Ninevites'' turning *from his evil way, and from the violence that is in their hands* (Jonah 3:8) is exactly the fruit John demands — not the saying but the doing. True repentance is measured by the change in the way and the works, the violence laid down.'),
    ('canon','jonah',3,8,'canon','ezekiel',18,21,'free',
      E'*But if the wicked will turn from all his sins that he hath committed, and keep all my statutes, and do that which is lawful and right, he shall surely live, he shall not die* (Ezekiel 18:21). Nineveh''s decree — *let them turn every one from his evil way* (Jonah 3:8) — is the very life-rule Ezekiel sets: the wicked who turns and *keep[s] all my statutes* lives. Repentance is unto Torah-walking, the evil way exchanged for *that which is lawful and right*, never a turning that leaves the commandments behind.'),
    ('canon','jonah',3,8,'apocrypha','ecclesiasticus',17,25,'extras',
      E'*Return to Yahuah (God), and forsake your sins, make your prayer before his face, and offend less* (Sirach 17:25). The restored witness states Nineveh''s very act — *let them turn every one from his evil way* (Jonah 3:8) — as the call to all: *Return to Yahuah (God), and forsake your sins.* To repent is to return AND to forsake the sin; the prayer before His face joined to the turning of the way.'),
    ('canon','jonah',3,8,'apocrypha','ecclesiasticus',17,26,'extras',
      E'*Turn again to the Most High, and turn away from iniquity: for he will lead you out of darkness into the light of health, and hate you abomination vehemently* (Sirach 17:26). Nineveh''s turning *from his evil way, and from the violence that is in their hands* (Jonah 3:8) is this double turning — *Turn again to the Most High, and turn away from iniquity.* The one who turns from the evil way is led *out of darkness into the light*; the relenting mercy meets the genuine turn.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s332_jon03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s332_jon03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 4 (★★): And Elohim repented of the evil — the relenting
    ('canon','jonah',3,10,'canon','jeremiah',18,8,'free',
      E'*If that nation, against whom I have pronounced, turn from their evil, I will repent of the evil that I thought to do unto them* (Jeremiah 18:8). This is the covenant rule that Jonah 3:10 enacts — *And Elohim (God) saw their works, that they turned from their evil way; and Elohim (God) repented of the evil... and he did it not.* The potter''s word stands: when a nation turns from its evil, Yahuah turns from the judgment. The relenting is not caprice but the fixed character of mercy meeting repentance.'),
    ('canon','jonah',3,10,'canon','exodus',32,14,'free',
      E'*And Yahuah (LORD) repented of the evil which he thought to do unto his people* (Exodus 32:14). The same word that closes Jonah 3 — *Elohim (God) repented of the evil... and he did it not* (Jonah 3:10) — is the mercy Moses pleaded for at the calf and Yahuah granted. Whether for His own people at Sinai or the pagan city of Nineveh, the relenting is one: judgment pronounced, repentance met, the evil withheld.'),
    ('canon','jonah',3,10,'canon','joel',2,13,'free',
      E'*And rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful, slow to anger, and of great kindness, and repenteth him of the evil* (Joel 2:13). The verdict of Jonah 3:10 — *Elohim (God) repented of the evil* — flows from this revealed heart: He *repenteth him of the evil* because He is *gracious and merciful, slow to anger.* The torn heart of the turning city draws the relenting of the merciful Elohim.'),
    ('canon','jonah',3,10,'canon','joel',2,14,'free',
      E'*Who knoweth if he will return and repent, and leave a blessing behind him; even a meat offering and a drink offering unto Yahuah Elohaychem (the LORD your God)?* (Joel 2:14). Joel''s hope is Nineveh''s very cry — *Who can tell if Elohim (God) will turn and repent, and turn away from his fierce anger, that we perish not?* (Jonah 3:9) — and Jonah 3:10 is its answer: He did return and repent, and the city was spared. The *who knoweth* of the turning sinner is met by the relenting mercy of Yahuah.'),
    ('canon','jonah',3,10,'canon','ezekiel',33,11,'free',
      E'*Say unto them, As I live, saith Adonai Yahuah (the Lord GOD), I have no pleasure in the death of the wicked; but that the wicked turn from his way and live: turn ye, turn ye from your evil ways; for why will ye die, O house of Yashar''el (Israel)?* (Ezekiel 33:11). When *Elohim (God) saw their works, that they turned from their evil way* (Jonah 3:10), He spared them — because He *ha[s] no pleasure in the death of the wicked.* The whole point of the warning to Nineveh, as to Israel, was always *that the wicked turn from his way and live.*')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s332_jon03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s332_jon03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jonah-3-the-word-came-the-second-time-restored-commission',
       E'The word came the second time — the fallen servant recommissioned',
       E'The book of Jonah opens its second half with mercy on the prophet himself: *And the word of Yahuah (LORD) came unto Jonah the second time, saying, Arise, go unto Nineveh, that great city, and preach unto it the preaching that I bid thee* (Jonah 3:1-2). The man who fled and was swallowed is not cast off but sent again — Yahuah''s patience restoring His servant to the work. The clearest forward picture is Peter, who denied his Master three times and was restored by the risen Yahusha (Jesus) — addressed, fittingly, as *son of Jonas*: *So when they had dined, Yahusha (Jesus) saith to Simon Peter, Simon, son of Jonas, lovest thou me more than these?... He saith unto him, Feed my lambs* (John 21:15), and *He saith unto him the third time, Simon, son of Jonas, lovest thou me?... Yahusha (Jesus) saith unto him, Feed my sheep* (John 21:17). The threefold question lifts the threefold denial into a threefold recommission. The second word to Jonah and the third question to Simon teach one thing: mercy does not discard the servant who failed — it sends him again to feed, to preach, to go.',
       sv.verse_id, ev.verse_id, 'free', 45366
  FROM _s332_jon03_lookup sv, _s332_jon03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='jonah' AND ev.chapter_number=3 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jonah-3-the-men-of-nineveh-shall-rise-in-judgment',
       E'The men of Nineveh shall rise in judgment — the pagan city''s repentance as witness',
       E'A whole pagan city heard one prophet and turned: *So the people of Nineveh believed Elohim (God), and proclaimed a fast, and put on sackcloth, from the greatest of them even to the least of them* (Jonah 3:5) — the king himself rising from his throne, laying off his robe, sitting in ashes (3:6), the decree going out *let them turn every one from his evil way, and from the violence that is in their hands* (3:8), with the trembling hope *Who can tell if Elohim (God) will turn and repent... that we perish not?* (3:9). Yahusha (Jesus) makes this repentance the eschatological witness against unbelief: *The men of Nineveh shall rise in judgment with this generation, and shall condemn it: because they repented at the preaching of Jonas; and, behold, a greater than Jonas is here* (Matthew 12:41), and again *The men of Nineve shall rise up in the judgment with this generation, and shall condemn it: for they repented at the preaching of Jonas* (Luke 11:32). The lesson cuts: pagans heard a single warning and turned, while the generation that beheld the Greater-than-Jonas would not. Read it through Romans 11: the nations'' repentance PROVOKES, never replaces — *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1) — it is the gentiles gathered to fear Yahuah, provoking the two-house people to jealousy, never a casting-off of Israel. The men of Nineveh stand as the sign that genuine turning is possible, and the refusal to turn is without excuse.',
       sv.verse_id, ev.verse_id, 'free', 45369
  FROM _s332_jon03_lookup sv, _s332_jon03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=3 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='jonah' AND ev.chapter_number=3 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jonah-3-they-turned-from-their-evil-way-fruits-of-repentance',
       E'They turned from their evil way — repentance proved by fruits, not words',
       E'Nineveh''s repentance was not a ceremony of words but a turning of conduct: *But let man and beast be covered with sackcloth, and cry mightily unto Elohim (God): yea, let them turn every one from his evil way, and from the violence that is in their hands* (Jonah 3:8) — and Yahuah''s verdict weighs exactly that: *And Elohim (God) saw their works, that they turned from their evil way* (3:10). The NT names this rule plainly. John the Baptist demands *Bring forth therefore fruits meet for repentance* (Matthew 3:8); Paul preaches *that they should repent and turn to Elohim (God), and do works meet for repentance* (Acts 26:20). And the Tanakh''s own life-rule stands behind both: *But if the wicked will turn from all his sins that he hath committed, and keep all my statutes, and do that which is lawful and right, he shall surely live, he shall not die* (Ezekiel 18:21) — repentance is unto Torah-walking, the evil way exchanged for *that which is lawful and right*, never a turning that leaves the commandments behind. The restored witness sounds the same call: *Return to Yahuah (God), and forsake your sins, make your prayer before his face, and offend less* (Sirach 17:25); *Turn again to the Most High, and turn away from iniquity: for he will lead you out of darkness into the light of health* (Sirach 17:26). To repent is to return AND to forsake the sin — the prayer joined to the laying-down of the violence.',
       sv.verse_id, ev.verse_id, 'extras', 45372
  FROM _s332_jon03_lookup sv, _s332_jon03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=3 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='jonah' AND ev.chapter_number=3 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jonah-3-and-elohim-repented-of-the-evil-the-relenting',
       E'And Elohim repented of the evil — the relenting mercy that meets the turning',
       E'The chapter ends not in destruction but in mercy: *And Elohim (God) saw their works, that they turned from their evil way; and Elohim (God) repented of the evil, that he had said that he would do unto them; and he did it not* (Jonah 3:10). This is no change of mind in a fickle deity but the fixed covenant rule of Yahuah, stated outright at the potter''s house: *If that nation, against whom I have pronounced, turn from their evil, I will repent of the evil that I thought to do unto them* (Jeremiah 18:8). It is the very mercy Moses pleaded and Yahuah granted at the golden calf: *And Yahuah (LORD) repented of the evil which he thought to do unto his people* (Exodus 32:14). It flows from the revealed heart Joel names: *for he is gracious and merciful, slow to anger, and of great kindness, and repenteth him of the evil* (Joel 2:13) — and Nineveh''s trembling *Who can tell if Elohim (God) will turn and repent...?* (Jonah 3:9) is the very *Who knoweth if he will return and repent...?* (Joel 2:14) of the turning sinner, answered here with a yes. The whole purpose of the warning was always this: *I have no pleasure in the death of the wicked; but that the wicked turn from his way and live: turn ye, turn ye from your evil ways* (Ezekiel 33:11). The judgment pronounced, the repentance met, the evil withheld — one mercy, for Israel and for Nineveh alike.',
       sv.verse_id, ev.verse_id, 'free', 45375
  FROM _s332_jon03_lookup sv, _s332_jon03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=3 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='jonah' AND ev.chapter_number=3 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Simon, son of Jonas, lovest thou me more than these?... Feed my lambs* (John 21:15) — the *second time* the word came to Jonah (Jonah 3:1) is the pattern of the fallen servant restored and sent again.'
  FROM cross_reference_threads t
  JOIN _s332_jon03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s332_jon03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=21 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-3-the-word-came-the-second-time-restored-commission'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *He saith unto him the third time, Simon, son of Jonas, lovest thou me?... Feed my sheep* (John 21:17) — the threefold recommission of *son of Jonas* mirrors the renewed word to Jonah; mercy sends the servant who failed back to the work.'
  FROM cross_reference_threads t
  JOIN _s332_jon03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s332_jon03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=21 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-3-the-word-came-the-second-time-restored-commission'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *The men of Nineveh shall rise in judgment with this generation, and shall condemn it: because they repented at the preaching of Jonas; and, behold, a greater than Jonas is here* (Matthew 12:41) — the city that *believed Elohim (God)* (Jonah 3:5) becomes the witness against the unrepentant.'
  FROM cross_reference_threads t
  JOIN _s332_jon03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s332_jon03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=41
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-3-the-men-of-nineveh-shall-rise-in-judgment'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *The men of Nineve shall rise up in the judgment with this generation, and shall condemn it: for they repented at the preaching of Jonas* (Luke 11:32) — the nations'' turning shames Israel''s hardness yet provokes, never replaces (Romans 11:1-2).'
  FROM cross_reference_threads t
  JOIN _s332_jon03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s332_jon03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=11 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-3-the-men-of-nineveh-shall-rise-in-judgment'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *because they repented at the preaching of Jonas* (Matthew 12:41) — the repentance Yahusha commends is the conduct-turning *from his evil way, and from the violence* (Jonah 3:8), not words.'
  FROM cross_reference_threads t
  JOIN _s332_jon03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=3 AND sv.verse_number=8
  JOIN _s332_jon03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=41
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-3-the-men-of-nineveh-shall-rise-in-judgment'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *that they should repent and turn to Elohim (God), and do works meet for repentance* (Acts 26:20) — Nineveh''s turning *from his evil way, and from the violence* (Jonah 3:8) is repentance proven by works, not words.'
  FROM cross_reference_threads t
  JOIN _s332_jon03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=3 AND sv.verse_number=8
  JOIN _s332_jon03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=26 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-3-they-turned-from-their-evil-way-fruits-of-repentance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Bring forth therefore fruits meet for repentance* (Matthew 3:8) — the laying-down of *the violence that is in their hands* (Jonah 3:8) is the fruit, not the saying.'
  FROM cross_reference_threads t
  JOIN _s332_jon03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=3 AND sv.verse_number=8
  JOIN _s332_jon03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=3 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-3-they-turned-from-their-evil-way-fruits-of-repentance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *if the wicked will turn from all his sins... and keep all my statutes, and do that which is lawful and right, he shall surely live* (Ezekiel 18:21) — repentance is unto Torah-walking, the evil way exchanged for the lawful and right.'
  FROM cross_reference_threads t
  JOIN _s332_jon03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=3 AND sv.verse_number=8
  JOIN _s332_jon03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-3-they-turned-from-their-evil-way-fruits-of-repentance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Return to Yahuah (God), and forsake your sins, make your prayer before his face* (Sirach 17:25) — the restored witness states Nineveh''s act: to return AND forsake the sin (Jonah 3:8).'
  FROM cross_reference_threads t
  JOIN _s332_jon03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=3 AND sv.verse_number=8
  JOIN _s332_jon03_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=17 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-3-they-turned-from-their-evil-way-fruits-of-repentance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Turn again to the Most High, and turn away from iniquity: for he will lead you out of darkness into the light of health* (Sirach 17:26) — the double turning of Jonah 3:8, met by the leading out of darkness.'
  FROM cross_reference_threads t
  JOIN _s332_jon03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=3 AND sv.verse_number=8
  JOIN _s332_jon03_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=17 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-3-they-turned-from-their-evil-way-fruits-of-repentance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *If that nation, against whom I have pronounced, turn from their evil, I will repent of the evil that I thought to do unto them* (Jeremiah 18:8) — the covenant rule that Jonah 3:10 enacts; the relenting is fixed character, not caprice.'
  FROM cross_reference_threads t
  JOIN _s332_jon03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s332_jon03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=18 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-3-and-elohim-repented-of-the-evil-the-relenting'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *And Yahuah (LORD) repented of the evil which he thought to do unto his people* (Exodus 32:14) — the same relenting Moses pleaded at the calf; one mercy for Israel and for Nineveh.'
  FROM cross_reference_threads t
  JOIN _s332_jon03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s332_jon03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-3-and-elohim-repented-of-the-evil-the-relenting'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *he is gracious and merciful, slow to anger, and of great kindness, and repenteth him of the evil* (Joel 2:13) — the revealed heart from which the verdict of Jonah 3:10 flows.'
  FROM cross_reference_threads t
  JOIN _s332_jon03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s332_jon03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-3-and-elohim-repented-of-the-evil-the-relenting'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Who knoweth if he will return and repent, and leave a blessing behind him?* (Joel 2:14) — Joel''s *who knoweth* is Nineveh''s *Who can tell?* (Jonah 3:9), answered with a yes in 3:10.'
  FROM cross_reference_threads t
  JOIN _s332_jon03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s332_jon03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-3-and-elohim-repented-of-the-evil-the-relenting'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *I have no pleasure in the death of the wicked; but that the wicked turn from his way and live* (Ezekiel 33:11) — the whole purpose of the warning to Nineveh, as to Israel: turn and live.'
  FROM cross_reference_threads t
  JOIN _s332_jon03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=3 AND sv.verse_number=10
  JOIN _s332_jon03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=33 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-3-and-elohim-repented-of-the-evil-the-relenting'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jonah_4.sql (Jonah 4) -----
-- Chapter: Jonah 4 — Jonah's anger at Yahuah's mercy; the gourd, the worm, the east wind; and the
-- book's closing open question, *should not I spare Nineveh, that great city?* (4:11). The runaway
-- prophet, swallowed and spared in the fish, now resents the very mercy he himself received: he is
-- *very angry* (4:1) that Nineveh was spared, and he indicts Yahuah by quoting Yahuah's own
-- self-revelation — *I knew that thou art a gracious Elohim (God), and merciful, slow to anger, and
-- of great kindness, and repentest thee of the evil* (4:2) — the great character-creed of Exodus
-- 34:6-7, sung across the Tanakh (Joel 2:13; Psalm 86:15; Psalm 103:8; Numbers 14:18; Nehemiah
-- 9:17). The gourd, the worm, the vehement east wind are the fourth, fifth and sixth things Yahuah
-- *prepared* (after the fish): a sovereign object-lesson rebuking misplaced compassion — Jonah pities
-- a plant he did not grow, but not a city of more than sixscore thousand souls. The book ends not on
-- a verdict but on a QUESTION left open to the reader: Yahuah's heart for the nations, the mercy that
-- gathers the gentile city WITHOUT casting off Yashar'el — woven forward to *Elohim (God) so loved
-- the world* (John 3:16), *not willing that any should perish* (2 Peter 3:9), *who will have all men
-- to be saved* (1 Timothy 2:4), *the same the Lord over all is rich unto all* (Romans 10:12).
-- Tag: jon04   Temp view: _s332_jon04_lookup
-- Sort band: base 45374, step 3 -> threads at 45374, 45377, 45380, 45383 (4 threads)
-- Source of EVERY row: 'canon','jonah',4,v
--
-- Jonah 4 coverage:
--   ★★ v.1-3 (it displeased Jonah exceedingly, and he was very angry... I knew that thou art a
--          gracious Elohim (God), and merciful, slow to anger... take, I beseech thee, my life from me)
--        NT:     ★ Luke 15:28-30 (the elder brother *was angry, and would not go in* at the father's
--                mercy) — THREAD 1; ★ Matthew 20:15 (*Is thine eye evil, because I am good?*) — THREAD 1
--        Extras: none warranted on the anger itself (the character-creed extras land on the keystone)
--        Tanakh: ★★ Exodus 34:6 (Yahuah... merciful and gracious, longsuffering, and abundant in
--                goodness and truth) — THREAD 2 (the creed Jonah quotes); ★ Joel 2:13, ★ Psalm 86:15,
--                ★ Psalm 103:8, ★ Numbers 14:18, ★ Nehemiah 9:17 — THREAD 2 (the same creed across the
--                Tanakh); ★ 1 Kings 19:4 (Elijah *requested for himself that he might die*) — THREAD 1
--                (the death-wish prophet)
--   ★ v.4 + v.9 (Doest thou well to be angry?)
--        NT:     none warranted distinct (the searching probe is woven into THREAD 1 prose)
--        Extras: none warranted
--        Tanakh: ★ Genesis 4:6 (Yahuah said unto Cain, Why art thou wroth? and why is thy countenance
--                fallen?) — THREAD 1 (Yahuah's gentle probing of the resentful heart)
--   ★★ v.5-10 (the prepared gourd... the worm... the vehement east wind... Thou hast had pity on the
--          gourd, for the which thou hast not laboured)
--        NT:     none warranted distinct (the object-lesson's point is the keystone of THREAD 4)
--        Extras: none warranted (the gourd/worm/wind are Yahuah's sovereign sign; held in prose)
--        Tanakh: held in THREAD 3 (the prepared things; Yahuah's sovereign object-lesson) — anchored
--                in-chapter; no forced outside Tanakh add
--   ★★★ v.11 (should not I spare Nineveh, that great city, wherein are more than sixscore thousand
--          persons that cannot discern between their right hand and their left hand; and also much cattle?)
--        NT:     ★★★ John 3:16 (Elohim (God) so loved the world), ★★ 1 Timothy 2:4 (who will have all
--                men to be saved), ★★ 2 Peter 3:9 (not willing that any should perish), ★ Romans 10:12
--                (the same the Lord over all is rich unto all) — THREAD 4
--        Extras: ★ Wisdom of Solomon 11:23 (you have mercy upon all... because they should amend),
--                ★★ Wisdom of Solomon 11:26 (you sparest all: for they are yours, O Yahuah (God), you
--                lover of souls), ★★ Sirach/Ecclesiasticus 18:13 (the mercy of Yahuah (God) is upon all
--                flesh) — THREAD 4
--        Tanakh: ★★ Ezekiel 18:23 (Have I any pleasure at all that the wicked should die?), ★★ Ezekiel
--                33:11 (I have no pleasure in the death of the wicked; but that the wicked turn... and
--                live), ★ Genesis 12:3 (in thee shall all families of the earth be blessed) — THREAD 4
--
-- Threads (slug — target libraries):
--   1. jonah-4-doest-thou-well-to-be-angry-the-resentful-prophet — NT (Luke 15, Matthew 20) +
--      Tanakh (Genesis 4, 1 Kings 19) [free]
--      (★★ Jonah's anger at mercy = the elder brother, the evil eye at goodness, Cain probed, Elijah's
--       death-wish; the resentful heart Yahuah searches with a question)
--   2. jonah-4-i-knew-that-thou-art-a-gracious-elohim — Tanakh (Exodus 34, Joel 2, Psalm 86, Psalm
--      103, Numbers 14, Nehemiah 9) [free]
--      (★★ the character-creed of Yahuah Jonah resents — Exodus 34:6 sung across the whole Tanakh)
--   3. jonah-4-the-gourd-the-worm-and-the-east-wind-prepared — (in-chapter, no outside members) -> FOLDED
--      INTO THREAD 1/4 prose; NOT emitted as a separate empty thread (every thread must have >=1 member)
--   4. jonah-4-should-not-i-spare-nineveh-mercy-on-the-nations — NT (John 3, 1 Timothy 2, 2 Peter 3,
--      Romans 10) + Extras (Wisdom 11, Sirach 18) + Tanakh (Ezekiel 18, Ezekiel 33, Genesis 12) [extras]
--      (★★★ THE KEYSTONE — the book's closing open question; Yahuah's mercy on the 120,000 of Nineveh,
--       the gentile city spared; the universal scope of mercy that gathers the nations WITHOUT casting
--       off Yashar'el (Israel) — Romans 11:1-2 guard held in prose)
--
-- NOTE on thread count: the brief allows 3-6 curated threads. The gourd/worm/wind object-lesson
-- (v.5-10) carries no warranted OUTSIDE member (its meaning is the keystone v.11 it sets up), and a
-- thread with zero members is forbidden — so I emit THREE member-bearing threads and weave the
-- object-lesson into THREAD 4's keystone prose (Jonah pitied a gourd he did not grow; should not
-- Yahuah spare a city of souls?). All v.5-10 verses are recorded above; none silently skipped.
--
-- Framing notes:
--   ★★ THE RESENTFUL PROPHET (THREAD 1): *But it displeased Jonah exceedingly, and he was very angry*
--      (4:1). The prophet spared in the fish resents the sparing of Nineveh — and Yahuah answers not
--      with a verdict but with a question: *Doest thou well to be angry?* (4:4, 4:9). It is the same
--      searching probe Yahuah put to Cain when his offering was refused and his face fell: *Why art thou
--      wroth? and why is thy countenance fallen?* (Genesis 4:6). And Yahusha (Jesus) draws the very
--      portrait in the elder brother who *was angry, and would not go in* at the father's mercy to the
--      prodigal (Luke 15:28) — and in the householder's word to the grudging laborer, *Is thine eye evil,
--      because I am good?* (Matthew 20:15). Jonah's death-wish — *take... my life from me; for it is
--      better for me to die than to live* (4:3) — is Elijah's own under the juniper: *he requested for
--      himself that he might die... take away my life* (1 Kings 19:4). The resentment of mercy is the
--      sickness Yahuah heals with a question.
--   ★★ THE CHARACTER-CREED (THREAD 2): Jonah indicts Yahuah by quoting Yahuah's own self-revelation —
--      *for I knew that thou art a gracious Elohim (God), and merciful, slow to anger, and of great
--      kindness, and repentest thee of the evil* (4:2). This is the creed proclaimed at Sinai when
--      Yahuah passed by: *Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious,
--      longsuffering, and abundant in goodness and truth* (Exodus 34:6) — the most-quoted self-portrait
--      in the Tanakh. Joel sings it as the ground of return (*he is gracious and merciful, slow to anger*,
--      Joel 2:13); the psalms sing it (*full of compassion, and gracious, longsuffering*, Psalm 86:15;
--      *merciful and gracious, slow to anger*, Psalm 103:8); Moses pleads it (*longsuffering, and of great
--      mercy*, Numbers 14:18); the Levites confess it (*a Elohim (God) ready to pardon, gracious and
--      merciful, slow to anger*, Nehemiah 9:17). The irony: Jonah resents the very mercy that, in chapter
--      2, lifted his own life from the pit. The creed is true — and it is for the nations too.
--   THE PREPARED OBJECT-LESSON (folded into THREAD 4): *And Yahuah Elohim (the LORD God) prepared a
--      gourd... But Elohim (God) prepared a worm... and Elohim (God) prepared a vehement east wind*
--      (4:6-8) — the same sovereign *prepared* that appointed the great fish (1:17). *Thou hast had pity
--      on the gourd, for the which thou hast not laboured, neither madest it grow* (4:10): the prophet
--      grieves a plant he did not make and could not keep, yet would have Yahuah destroy a city of living
--      souls. The lesson sets up the keystone exactly.
--   ★★★ SHOULD NOT I SPARE NINEVEH (THREAD 4, KEYSTONE): the book closes on a question left open to the
--      reader — *And should not I spare Nineveh, that great city, wherein are more than sixscore thousand
--      persons that cannot discern between their right hand and their left hand; and also much cattle?*
--      (4:11). Yahuah's compassion reaches the gentile city, even its cattle. This is the heart the whole
--      library reveals: *Have I any pleasure at all that the wicked should die?... and not that he should
--      return from his ways, and live?* (Ezekiel 18:23); *I have no pleasure in the death of the wicked;
--      but that the wicked turn from his way and live* (Ezekiel 33:11). It is the promise to Abraham
--      reaching its purpose — *in thee shall all families of the earth be blessed* (Genesis 12:3) — and
--      the restored witnesses sing it: *you have mercy upon all... because they should amend* (Wisdom of
--      Solomon 11:23); *you sparest all: for they are yours, O Yahuah (God), you lover of souls* (Wisdom
--      11:26); *the mercy of man is toward his neighbour; but the mercy of Yahuah (God) is upon all flesh*
--      (Sirach 18:13). And it is fulfilled forward: *Elohim (God) so loved the world, that he gave his
--      only begotten Son* (John 3:16); *Who will have all men to be saved* (1 Timothy 2:4); *not willing
--      that any should perish, but that all should come to repentance* (2 Peter 3:9); *the same the Lord
--      over all is rich unto all that call upon him* (Romans 10:12). THE GUARD: this mercy to the nations
--      does NOT cancel Yashar'el (Israel) — *Hath Elohim (God) cast away his people? Elohim (God) forbid*
--      (Romans 11:1-2). Nineveh gathered to mercy is the nations brought near, never Israel cast off; the
--      two-house people are the light by which the families of the earth are blessed (Genesis 12:3).
--   EXTRAS: Wisdom of Solomon 11:23/11:26 and Sirach (Ecclesiasticus) 18:13 — clean witnesses to
--      Yahuah's mercy upon all flesh, parses verified (v.26's trailing apparatus glyph stripped).
--   VERSES WITH NO SEPARATE ADD: v.4 and v.9 (Doest thou well to be angry? — woven into THREAD 1 with
--      Genesis 4:6); v.5 (the booth on the east side — narrative setting for the object-lesson); v.6-8
--      (the gourd/worm/wind — folded into THREAD 4's keystone prose); v.10 (Thou hast had pity on the
--      gourd — the lesson's premise, folded into THREAD 4). All recorded, none silently skipped.

CREATE TEMP VIEW _s332_jon04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): Doest thou well to be angry? — the resentful prophet
    ('canon','jonah',4,1,'canon','luke',15,28,'free',
      E'*And he was angry, and would not go in: therefore came his father out, and intreated him* (Luke 15:28). The elder brother''s refusal at the father''s mercy to the prodigal is Jonah''s own anger drawn to the life: *But it displeased Jonah exceedingly, and he was very angry* (Jonah 4:1). Both resent grace shown to the one they reckoned undeserving; and to both the Father comes out and entreats, not condemns.'),
    ('canon','jonah',4,2,'canon','matthew',20,15,'free',
      E'*Is it not lawful for me to do what I will with mine own? Is thine eye evil, because I am good?* (Matthew 20:15). The householder''s word to the grudging laborer names Jonah''s sickness exactly: the prophet quotes Yahuah''s mercy — *I knew that thou art a gracious Elohim (God), and merciful, slow to anger* (Jonah 4:2) — not in praise but in complaint. *Is thine eye evil, because I am good?* The goodness of Yahuah toward the nations offends the heart that wanted judgment.'),
    ('canon','jonah',4,3,'canon','1-kings',19,4,'free',
      E'*But he himself went a day''s journey into the wilderness, and came and sat down under a juniper tree: and he requested for himself that he might die; and said, It is enough; now, O Yahuah (LORD), take away my life* (1 Kings 19:4). Elijah under the juniper is Jonah under his booth: *take, I beseech thee, my life from me; for it is better for me to die than to live* (Jonah 4:3). The prophet who has had enough of his own calling asks to die — and Yahuah answers neither with death nor rebuke, but with provision and a question.'),
    ('canon','jonah',4,4,'canon','genesis',4,6,'free',
      E'*And Yahuah (LORD) said unto Cain, Why art thou wroth? and why is thy countenance fallen?* (Genesis 4:6). Yahuah''s probe to the angry Jonah — *Doest thou well to be angry?* (Jonah 4:4) — is the same searching question put to Cain when his offering was refused and his face fell. Yahuah meets the resentful heart not with a verdict but with a question that calls it to see itself; the anger that sin lieth at the door of (Genesis 4:7) is the anger Jonah must master.'),

    -- THREAD 2 (★★): I knew that thou art a gracious Elohim — the character-creed
    ('canon','jonah',4,2,'canon','exodus',34,6,'free',
      E'*And Yahuah (LORD) passed by before him, and proclaimed, Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth* (Exodus 34:6). When Jonah says *I knew that thou art a gracious Elohim (God), and merciful, slow to anger, and of great kindness* (Jonah 4:2), he is quoting the creed Yahuah proclaimed of himself at Sinai — the great self-revelation *merciful and gracious, longsuffering*. Jonah knows the character of Yahuah perfectly; he simply resents that it reaches Nineveh.'),
    ('canon','jonah',4,2,'canon','joel',2,13,'free',
      E'*And rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful, slow to anger, and of great kindness, and repenteth him of the evil* (Joel 2:13). Joel preaches the same creed Jonah recites — *gracious and merciful, slow to anger, and of great kindness, and repentest thee of the evil* (Jonah 4:2) — as the very ground for a people to return. The character that Jonah resents toward Nineveh is the character that calls Yashar''el (Israel) home; one mercy, for the house and for the nations.'),
    ('canon','jonah',4,2,'canon','psalms',86,15,'free',
      E'*But thou, O Yahuah (Lord), art a Elohim (God) full of compassion, and gracious, longsuffering, and plenteous in mercy and truth* (Psalm 86:15). The psalmist sings the creed Jonah quotes — *a gracious Elohim (God), and merciful, slow to anger, and of great kindness* (Jonah 4:2). What David pleads as comfort, Jonah throws as accusation; the same compassion is balm to the humble and offense to the resentful.'),
    ('canon','jonah',4,2,'canon','psalms',103,8,'free',
      E'*Yahuah (LORD) is merciful and gracious, slow to anger, and plenteous in mercy* (Psalm 103:8). The creed runs through the psalms word for word with Jonah''s complaint — *merciful, slow to anger, and of great kindness* (Jonah 4:2). This is the settled self-revelation of Yahuah, sung in worship and quoted by the angry prophet alike: he is, and ever was, slow to anger and plenteous in mercy.'),
    ('canon','jonah',4,2,'canon','numbers',14,18,'free',
      E'*Yahuah (LORD) is longsuffering, and of great mercy, forgiving iniquity and transgression, and by no means clearing the guilty* (Numbers 14:18). Moses pleads this creed to spare a rebellious Yashar''el (Israel) in the wilderness — *longsuffering, and of great mercy* — the same words Jonah recites against the sparing of Nineveh (Jonah 4:2). Moses wields the mercy to save; Jonah resents it; the creed itself never changes.'),
    ('canon','jonah',4,2,'canon','nehemiah',9,17,'free',
      E'*But thou art a Elohim (God) ready to pardon, gracious and merciful, slow to anger, and of great kindness, and forsookest them not* (Nehemiah 9:17). The Levites confess the creed Jonah quotes — *gracious... merciful, slow to anger, and of great kindness* (Jonah 4:2) — as the reason Yahuah did NOT forsake a stiff-necked people. The very longsuffering that Jonah grudges to Nineveh is the longsuffering by which Yashar''el (Israel) itself survived its rebellions.'),

    -- THREAD 4 (★★★, KEYSTONE): Should not I spare Nineveh — mercy on the nations
    ('canon','jonah',4,11,'canon','john',3,16,'extras',
      E'*For Elohim (God) so loved the world, that he gave his only begotten Son, that whosoever believeth in him should not perish, but have everlasting life* (John 3:16). The book''s closing question — *should not I spare Nineveh, that great city, wherein are more than sixscore thousand persons?* (Jonah 4:11) — is answered in the breadth of *Elohim (God) so loved the world*. The mercy that spared the gentile city is the mercy that gives the only begotten Son for the world; the heart that grieves over Nineveh is the heart of John 3:16.'),
    ('canon','jonah',4,11,'canon','1-timothy',2,4,'extras',
      E'*Who will have all men to be saved, and to come unto the knowledge of the truth* (1 Timothy 2:4). The 120,000 of Nineveh *that cannot discern between their right hand and their left hand* (Jonah 4:11) are exactly those Yahuah *will have... to be saved*. The closing question of Jonah is the will of Yahuah stated plainly: not the death of the wicked, but that all men be saved and come to the knowledge of the truth.'),
    ('canon','jonah',4,11,'canon','2-peter',3,9,'extras',
      E'*Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance* (2 Peter 3:9). Nineveh repented and was spared; the question *should not I spare Nineveh?* (Jonah 4:11) is the *longsuffering... not willing that any should perish* of 2 Peter. The forty-day reprieve Jonah preached is the patience that waits on repentance, that none be lost.'),
    ('canon','jonah',4,11,'canon','romans',10,12,'extras',
      E'*For there is no difference between the Yahudi (Jew) and the Greek: for the same the Lord over all is rich unto all that call upon him* (Romans 10:12). The mercy that spared Nineveh — *should not I spare Nineveh, that great city?* (Jonah 4:11) — is the mercy *rich unto all*. The gentile city brought to repentance shows there is no people beyond the reach of the Lord *over all*; yet this richness unto the nations never cancels Yashar''el (Israel) — *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1).'),
    ('canon','jonah',4,11,'canon','ezekiel',18,23,'extras',
      E'*Have I any pleasure at all that the wicked should die? saith Adonai Yahuah (the Lord GOD): and not that he should return from his ways, and live?* (Ezekiel 18:23). The closing question of Jonah is the standing heart of Yahuah: *should not I spare Nineveh?* (Jonah 4:11) is *Have I any pleasure at all that the wicked should die?* The mercy on the gentile city is no exception but the rule — Yahuah desires the wicked to turn and live, not to perish.'),
    ('canon','jonah',4,11,'canon','ezekiel',33,11,'extras',
      E'*Say unto them, As I live, saith Adonai Yahuah (the Lord GOD), I have no pleasure in the death of the wicked; but that the wicked turn from his way and live: turn ye, turn ye from your evil ways; for why will ye die, O house of Yashar''el (Israel)?* (Ezekiel 33:11). The sparing of Nineveh (Jonah 4:11) is the very plea Yahuah makes to his own house: *I have no pleasure in the death of the wicked; but that the wicked turn... and live*. One mercy reaches Nineveh and the house of Yashar''el (Israel) alike — turn, and live.'),
    ('canon','jonah',4,11,'canon','genesis',12,3,'extras',
      E'*And I will bless them that bless thee, and curse him that curseth thee: and in thee shall all families of the earth be blessed* (Genesis 12:3). The sparing of the gentile city (Jonah 4:11) is the promise to Abraham reaching its purpose — *in thee shall all families of the earth be blessed*. Nineveh gathered to mercy is the families of the earth blessed THROUGH the covenant people, never instead of them; the two-house people are the light by which the nations come.'),
    ('canon','jonah',4,11,'apocrypha','the-wisdom-of-solomon',11,23,'extras',
      E'*But you have mercy upon all; for you can do all things, and winkest at the sins of men, because they should amend* (Wisdom of Solomon 11:23). The closing question — *should not I spare Nineveh?* (Jonah 4:11) — is this restored witness exactly: Yahuah *has mercy upon all... because they should amend*. The reprieve given Nineveh is mercy that withholds judgment that the sinner may repent.'),
    ('canon','jonah',4,11,'apocrypha','the-wisdom-of-solomon',11,26,'extras',
      E'*But you sparest all: for they are yours, O Yahuah (God), you lover of souls* (Wisdom of Solomon 11:26). Why spare Nineveh and its sixscore thousand? Because *you sparest all: for they are yours, O Yahuah (God), you lover of souls*. The gentile city is no less Yahuah''s handiwork than Yashar''el (Israel); the lover of souls spares all that are his, and so the question of Jonah 4:11 answers itself.'),
    ('canon','jonah',4,11,'apocrypha','ecclesiasticus',18,13,'extras',
      E'*The mercy of man is toward his neighbour; but the mercy of Yahuah (God) is upon all flesh: he reproveth, and nurtureth, and teaches and brings again, as a shepherd his flock* (Sirach 18:13). Jonah''s mercy was toward his own; Yahuah''s mercy — *should not I spare Nineveh?* (Jonah 4:11) — is *upon all flesh*. The shepherd who reproves and brings again gathers even the city Jonah would have seen burn.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s332_jon04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s332_jon04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================ THREADS ============================

-- THREAD 1: jonah-4-doest-thou-well-to-be-angry-the-resentful-prophet
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jonah-4-doest-thou-well-to-be-angry-the-resentful-prophet',
       E'Doest thou well to be angry? — the prophet who resents mercy',
       E'The prophet spared in the fish resents the sparing of Nineveh: *But it displeased Jonah exceedingly, and he was very angry* (Jonah 4:1), and he asks to die — *take, I beseech thee, my life from me; for it is better for me to die than to live* (4:3). Yahuah answers not with a verdict but with a searching question, twice: *Doest thou well to be angry?* (4:4, 4:9). It is the same question Yahuah put to the angry Cain when his face fell — *Why art thou wroth? and why is thy countenance fallen?* (Genesis 4:6). And Yahusha (Jesus) draws Jonah''s portrait twice over: in the elder brother who *was angry, and would not go in* when the father showed mercy to the prodigal (Luke 15:28), and in the householder''s word to the grudging laborer, *Is thine eye evil, because I am good?* (Matthew 20:15). Jonah''s death-wish is Elijah''s own under the juniper — *he requested for himself that he might die... take away my life* (1 Kings 19:4). The resentment of grace is a sickness, and Yahuah heals it not by argument but by a question that calls the heart to see itself.',
       sv.verse_id, ev.verse_id, 'free', 45374
  FROM _s332_jon04_lookup sv, _s332_jon04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='jonah' AND ev.chapter_number=4 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2: jonah-4-i-knew-that-thou-art-a-gracious-elohim
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jonah-4-i-knew-that-thou-art-a-gracious-elohim',
       E'I knew that thou art a gracious Elohim — the character-creed Jonah resents',
       E'Jonah indicts Yahuah by quoting Yahuah''s own self-revelation: *for I knew that thou art a gracious Elohim (God), and merciful, slow to anger, and of great kindness, and repentest thee of the evil* (Jonah 4:2). This is the great creed Yahuah proclaimed of himself when he passed by at Sinai — *Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth* (Exodus 34:6) — the most-quoted self-portrait in the Tanakh. Joel preaches it as the ground of return (*he is gracious and merciful, slow to anger, and of great kindness*, Joel 2:13); the psalms sing it (*full of compassion, and gracious, longsuffering*, Psalm 86:15; *merciful and gracious, slow to anger*, Psalm 103:8); Moses pleads it to spare a rebellious people (*longsuffering, and of great mercy*, Numbers 14:18); the Levites confess it as the reason Yahuah did not forsake them (*ready to pardon, gracious and merciful, slow to anger*, Nehemiah 9:17). The irony cuts deep: Jonah resents the very mercy that, one chapter before, lifted his own life from the belly of the deep. The creed is true — and it is for the nations too.',
       sv.verse_id, ev.verse_id, 'free', 45377
  FROM _s332_jon04_lookup sv, _s332_jon04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=4 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='jonah' AND ev.chapter_number=4 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4: jonah-4-should-not-i-spare-nineveh-mercy-on-the-nations (KEYSTONE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jonah-4-should-not-i-spare-nineveh-mercy-on-the-nations',
       E'Should not I spare Nineveh? — Yahuah''s mercy on the nations',
       E'The book ends not on a verdict but on a QUESTION left open to the reader. Jonah pities a gourd he did not grow — *And Yahuah Elohim (the LORD God) prepared a gourd... But Elohim (God) prepared a worm... and Elohim (God) prepared a vehement east wind* (4:6-8); *Thou hast had pity on the gourd, for the which thou hast not laboured, neither madest it grow* (4:10) — and Yahuah answers: *And should not I spare Nineveh, that great city, wherein are more than sixscore thousand persons that cannot discern between their right hand and their left hand; and also much cattle?* (4:11). This is the heart the whole library reveals. The Tanakh: *Have I any pleasure at all that the wicked should die?... and not that he should return from his ways, and live?* (Ezekiel 18:23); *I have no pleasure in the death of the wicked; but that the wicked turn from his way and live* (Ezekiel 33:11); and the promise to Abraham reaching its purpose — *in thee shall all families of the earth be blessed* (Genesis 12:3). The restored witnesses sing it: *you have mercy upon all... because they should amend* (Wisdom of Solomon 11:23); *you sparest all: for they are yours, O Yahuah (God), you lover of souls* (Wisdom 11:26); *the mercy of Yahuah (God) is upon all flesh* (Sirach 18:13). And it is fulfilled forward: *Elohim (God) so loved the world, that he gave his only begotten Son* (John 3:16); *Who will have all men to be saved* (1 Timothy 2:4); *not willing that any should perish, but that all should come to repentance* (2 Peter 3:9); *the same the Lord over all is rich unto all that call upon him* (Romans 10:12). THE GUARD: this mercy to the nations does NOT cancel Yashar''el (Israel) — *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1). Nineveh gathered to mercy is the families of the earth blessed THROUGH the covenant people, the two-house light by which the nations come — never Israel cast off. The question is left open: it is asked of every reader who, like Jonah, would sooner see judgment than mercy.',
       sv.verse_id, ev.verse_id, 'extras', 45380
  FROM _s332_jon04_lookup sv, _s332_jon04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=4 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='jonah' AND ev.chapter_number=4 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ======================== THREAD MEMBERS ========================

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Luke 15:28 — the elder brother *was angry, and would not go in* at the father''s mercy; Jonah''s anger drawn to the life.'
  FROM cross_reference_threads t
  JOIN _s332_jon04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=4 AND sv.verse_number=1
  JOIN _s332_jon04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=15 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-4-doest-thou-well-to-be-angry-the-resentful-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Matthew 20:15 — *Is thine eye evil, because I am good?* names the resentment of grace shown to the undeserving.'
  FROM cross_reference_threads t
  JOIN _s332_jon04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s332_jon04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=20 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-4-doest-thou-well-to-be-angry-the-resentful-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'1 Kings 19:4 — Elijah under the juniper *requested for himself that he might die*; the death-wish prophet, Jonah''s twin.'
  FROM cross_reference_threads t
  JOIN _s332_jon04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=4 AND sv.verse_number=3
  JOIN _s332_jon04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=19 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-4-doest-thou-well-to-be-angry-the-resentful-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Genesis 4:6 — *Why art thou wroth?* — the same searching question Yahuah puts to the angry heart; the probe of Jonah 4:4.'
  FROM cross_reference_threads t
  JOIN _s332_jon04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=4 AND sv.verse_number=4
  JOIN _s332_jon04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-4-doest-thou-well-to-be-angry-the-resentful-prophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'Exodus 34:6 — the creed at Sinai: *merciful and gracious, longsuffering, and abundant in goodness and truth* — the self-portrait Jonah quotes.'
  FROM cross_reference_threads t
  JOIN _s332_jon04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s332_jon04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-4-i-knew-that-thou-art-a-gracious-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'Joel 2:13 — the same creed as the ground of return: *gracious and merciful, slow to anger... and repenteth him of the evil*.'
  FROM cross_reference_threads t
  JOIN _s332_jon04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s332_jon04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-4-i-knew-that-thou-art-a-gracious-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'Psalm 86:15 — the psalmist sings the creed as comfort: *full of compassion, and gracious, longsuffering, and plenteous in mercy and truth*.'
  FROM cross_reference_threads t
  JOIN _s332_jon04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s332_jon04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=86 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-4-i-knew-that-thou-art-a-gracious-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Psalm 103:8 — the creed word for word: *Yahuah (LORD) is merciful and gracious, slow to anger, and plenteous in mercy*.'
  FROM cross_reference_threads t
  JOIN _s332_jon04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s332_jon04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-4-i-knew-that-thou-art-a-gracious-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Numbers 14:18 — Moses pleads the creed to spare rebellious Yashar''el (Israel): *longsuffering, and of great mercy, forgiving iniquity and transgression*.'
  FROM cross_reference_threads t
  JOIN _s332_jon04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s332_jon04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-4-i-knew-that-thou-art-a-gracious-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Nehemiah 9:17 — the Levites confess the creed as the reason Yahuah forsook them not: *ready to pardon, gracious and merciful, slow to anger*.'
  FROM cross_reference_threads t
  JOIN _s332_jon04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=4 AND sv.verse_number=2
  JOIN _s332_jon04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-4-i-knew-that-thou-art-a-gracious-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (KEYSTONE)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'John 3:16 — *Elohim (God) so loved the world* — the breadth that answers *should not I spare Nineveh?*'
  FROM cross_reference_threads t
  JOIN _s332_jon04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=4 AND sv.verse_number=11
  JOIN _s332_jon04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=3 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-4-should-not-i-spare-nineveh-mercy-on-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'1 Timothy 2:4 — *Who will have all men to be saved* — the will of Yahuah for the 120,000 of Nineveh.'
  FROM cross_reference_threads t
  JOIN _s332_jon04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=4 AND sv.verse_number=11
  JOIN _s332_jon04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=2 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-4-should-not-i-spare-nineveh-mercy-on-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'2 Peter 3:9 — *not willing that any should perish, but that all should come to repentance* — the patience that spared Nineveh.'
  FROM cross_reference_threads t
  JOIN _s332_jon04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=4 AND sv.verse_number=11
  JOIN _s332_jon04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-4-should-not-i-spare-nineveh-mercy-on-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'Romans 10:12 — *the same the Lord over all is rich unto all* — mercy to the nations that yet casts not off Israel (Rom 11:1).'
  FROM cross_reference_threads t
  JOIN _s332_jon04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=4 AND sv.verse_number=11
  JOIN _s332_jon04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=10 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-4-should-not-i-spare-nineveh-mercy-on-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'Ezekiel 18:23 — *Have I any pleasure at all that the wicked should die?* — the standing heart of Yahuah behind the sparing.'
  FROM cross_reference_threads t
  JOIN _s332_jon04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=4 AND sv.verse_number=11
  JOIN _s332_jon04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-4-should-not-i-spare-nineveh-mercy-on-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'Ezekiel 33:11 — *I have no pleasure in the death of the wicked; but that the wicked turn... and live* — turn ye, and live, said also to the house of Israel.'
  FROM cross_reference_threads t
  JOIN _s332_jon04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=4 AND sv.verse_number=11
  JOIN _s332_jon04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=33 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-4-should-not-i-spare-nineveh-mercy-on-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'Genesis 12:3 — *in thee shall all families of the earth be blessed* — Nineveh spared = the families blessed THROUGH the covenant people, not instead.'
  FROM cross_reference_threads t
  JOIN _s332_jon04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=4 AND sv.verse_number=11
  JOIN _s332_jon04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-4-should-not-i-spare-nineveh-mercy-on-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'Wisdom of Solomon 11:23 — *you have mercy upon all... because they should amend* — the reprieve that withholds judgment for repentance.'
  FROM cross_reference_threads t
  JOIN _s332_jon04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=4 AND sv.verse_number=11
  JOIN _s332_jon04_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=11 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-4-should-not-i-spare-nineveh-mercy-on-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'Wisdom of Solomon 11:26 — *you sparest all: for they are yours, O Yahuah (God), you lover of souls* — why spare Nineveh: all are his.'
  FROM cross_reference_threads t
  JOIN _s332_jon04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=4 AND sv.verse_number=11
  JOIN _s332_jon04_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=11 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-4-should-not-i-spare-nineveh-mercy-on-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'Sirach (Ecclesiasticus) 18:13 — *the mercy of Yahuah (God) is upon all flesh* — the shepherd who brings again gathers even Nineveh.'
  FROM cross_reference_threads t
  JOIN _s332_jon04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jonah' AND sv.chapter_number=4 AND sv.verse_number=11
  JOIN _s332_jon04_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=18 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jonah-4-should-not-i-spare-nineveh-mercy-on-the-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session332 — Jonah cross-references complete.'
