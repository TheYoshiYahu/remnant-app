-- ----- fragment: minion_judith_11.sql (session253 judith 11) -----
-- Source anchor: apocrypha/judith ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: jdt11 (view _session253_jdt11_lookup). Sort band base 60250, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_jdt11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: judith-11-sin-the-only-breach
  ('apocrypha', 'judith', 11, 10, 'canon', '2-chronicles', 15, 2, 'free', E'2 Chronicles 15:2 — *And he went out to meet Asa, and said unto him, Hear ye me, Asa, and all Yahudah (Judah) and Benjamin; Yahuah (LORD) is with you, while ye be with him; and if ye seek him, he will be found of you; but if ye forsake him, he will forsake you.* Judith''s words that the sword cannot prevail except they sin (11:10) are simply Azariah''s covenant law — protection while they hold to Yahuah, abandonment only if they forsake him.'),
  ('apocrypha', 'judith', 11, 10, 'canon', 'deuteronomy', 28, 25, 'free', E'Deuteronomy 28:25 — *Yahuah (LORD) shall cause thee to be smitten before thine enemies: thou shalt go out one way against them, and flee seven ways before them: and shalt be removed into all the kingdoms of the earth.* The defeat Judith dangles before Holofernes — that it comes only by Israel''s sin (11:10) — is this Deuteronomic sentence, where being smitten before the enemy is the wage of forsaking the voice of Yahuah.'),
  ('apocrypha', 'judith', 11, 11, 'canon', 'leviticus', 26, 36, 'free', E'Leviticus 26:36 — *And upon them that are left alive of you I will send a faintness into their hearts in the lands of their enemies; and the sound of a shaken leaf shall chase them; and they shall flee, as fleeing from a sword; and they shall fall when none pursueth.* When Judith says their sin would provoke their Elohim to anger and bring death upon them (11:11), she invokes the very faintness-of-heart curse Moses promised the covenant-breaker.'),
  ('apocrypha', 'judith', 11, 12, 'canon', 'deuteronomy', 32, 30, 'free', E'Deuteronomy 32:30 — *How should one chase a thousand, and two put ten thousand to flight, except their Rock had sold them, and Yahuah (LORD) had shut them up?* Judith''s claim that Bethulia could only fall by transgressing the food-laws Yahuah forbade (11:12) rests on this: a nation is never overrun by enemy strength but only when its Rock sells it for its sin.'),
  -- thread: judith-11-king-of-all-the-earth
  ('apocrypha', 'judith', 11, 1, 'canon', 'daniel', 3, 5, 'free', E'Daniel 3:5 — *That at what time ye hear the sound of the cornet, flute, harp, sackbut, psaltery, dulcimer, and all kinds of musick, ye fall down and worship the golden image that Nebuchadnezzar the king hath set up:* The Nebuchadnezzar whose servant Holofernes calls king of all the earth (11:1) is the same world-king who commands all peoples to fall down and worship his image.'),
  ('apocrypha', 'judith', 11, 7, 'canon', 'daniel', 3, 6, 'free', E'Daniel 3:6 — *And whoso falleth not down and worshippeth shall the same hour be cast into the midst of a burning fiery furnace.* Judith''s flattery that even the beasts and fowls live by Nebuchadnezzar''s power (11:7) exposes the tyrant''s claim on all flesh, enforced in Daniel by the furnace that awaits any who refuse him worship.'),
  ('apocrypha', 'judith', 11, 7, 'canon', 'daniel', 3, 18, 'free', E'Daniel 3:18 — *But if not, be it known unto thee, O king, that we will not serve thy gods, nor worship the golden image which thou hast set up.* Against the boast that all things serve Nebuchadnezzar (11:7), the three Hebrews give the covenant answer that breaks the system — they will not serve the king''s gods even unto the fire.'),
  -- thread: judith-11-handmaid-who-serves-yahuah
  ('apocrypha', 'judith', 11, 5, 'canon', 'luke', 1, 38, 'free', E'Luke 1:38 — *And Mary said, Behold the handmaid of Yahuah (Lord); be it unto me according to thy word. And the angel departed from her.* Judith calling herself handmaid before Holofernes (11:5) joins the line of lowly women who name themselves Yahuah''s handmaid and become the vessel of his deliverance.'),
  ('apocrypha', 'judith', 11, 17, 'canon', 'judges', 4, 9, 'free', E'Judges 4:9 — *And she said, I will surely go with thee: notwithstanding the journey that thou takest shall not be for thine honour; for Yahuah (LORD) shall sell Sisera into the hand of a woman. And Deborah arose, and went with Barak to Kedesh.* Judith''s vow to serve Yahuah and bring back word of the enemy''s fall (11:17) re-treads Deborah''s word that Yahuah would sell the enemy captain into a woman''s hand.'),
  -- thread: judith-11-snare-of-his-own-confidence
  ('apocrypha', 'judith', 11, 22, 'canon', 'proverbs', 11, 8, 'free', E'Proverbs 11:8 — *The righteous is delivered out of trouble, and the wicked cometh in his stead.* Holofernes'' confidence that Judith''s counsel brings destruction on his enemies (11:22) is the snare reversed — the righteous goes free and the wicked man steps into the trouble he meant for her.'),
  ('apocrypha', 'judith', 11, 19, 'canon', '1-samuel', 17, 47, 'free', E'1 Samuel 17:47 — *And all this assembly shall know that Yahuah (LORD) saveth not with sword and spear: for the battle is the LORD''S, and he will give you into our hands.* Holofernes plans to march his army to Jerusalem behind Judith (11:19), but the outcome belongs to David''s truth — the battle is Yahuah''s, not won by sword and spear.'),
  ('apocrypha', 'judith', 11, 22, 'canon', '1-corinthians', 1, 27, 'free', E'1 Corinthians 1:27 — *But Elohim (God) hath chosen the foolish things of the world to confound the wise; and Elohim (God) hath chosen the weak things of the world to confound the things which are mighty;* The mighty general who marvels at a widow''s wisdom (11:22) is about to be confounded by the weak thing Elohim chose, exactly as Paul describes.'),
  -- thread: judith-11-by-a-womans-hand
  ('apocrypha', 'judith', 11, 6, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Judith''s promise that Yahuah will bring the thing perfectly to pass by her hand (11:6) echoes the first promise that the head of the enemy is bruised through the woman.'),
  ('apocrypha', 'judith', 11, 16, 'canon', 'judges', 4, 21, 'free', E'Judges 4:21 — *Then Jael Heber''s wife took a nail of the tent, and took an hammer in her hand, and went softly unto him, and smote the nail into his temples, and fastened it into the ground: for he was fast asleep and weary. So he died.* The deed at which all the earth shall be astonished (11:16) mirrors Jael''s hand felling the enemy commander in his sleep — Yahuah''s victory carried by a woman.'),
  ('apocrypha', 'judith', 11, 16, 'canon', 'luke', 1, 51, 'free', E'Luke 1:51 — *He hath shewed strength with his arm; he hath scattered the proud in the imagination of their hearts.* Judith sent to work a wonder before all the earth (11:16) belongs to the Magnificat''s pattern, where Yahuah''s arm scatters the proud and lifts the lowly.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_jdt11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_jdt11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-11-sin-the-only-breach',
       E'No Sword Can Prevail Except They Sin',
       E'Judith bends low before Holofernes and yet, in the very act of seeming to betray her people, she preaches Moses to him: *for our nation shall not be punished, neither can sword prevail against them, except they sin against their Elohim (God)* (Judith 11:10). This is the whole Torah condition spoken into the enemy''s tent — Israel is unconquerable while she keeps covenant, and only sin opens the gate. Azariah laid the same law on Asa: *Hear ye me, Asa, and all Yahudah (Judah) and Benjamin; Yahuah (LORD) is with you, while ye be with him; and if ye seek him, he will be found of you; but if ye forsake him, he will forsake you* (2 Chronicles 15:2). The blessings-and-curses of Deuteronomy turn on the same hinge — only when the people forsake the voice of their Elohim does the enemy prevail: *Yahuah (LORD) shall cause thee to be smitten before thine enemies: thou shalt go out one way against them, and flee seven ways before them* (Deuteronomy 28:25). And the curse names exactly the panic Judith warns of, when they would *provoke their Elohim (God) to anger*: *the sound of a shaken leaf shall chase them; and they shall flee, as fleeing from a sword; and they shall fall when none pursueth* (Leviticus 26:36). The Song of Moses settles who actually hands a nation over: *How should one chase a thousand, and two put ten thousand to flight, except their Rock had sold them, and Yahuah (LORD) had shut them up?* (Deuteronomy 32:30). It ain''t new — the only weapon that can touch Israel is her own transgression.',
       sv.verse_id, ev.verse_id, 'extras', 60250
  FROM _session253_jdt11_lookup sv, _session253_jdt11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=11 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-11-king-of-all-the-earth',
       E'The King of All the Earth Demands Worship',
       E'The whole speech is steeped in the boast of the kingdom of man: Holofernes opens by naming his master *Nabuchodonosor, the king of all the earth* (Judith 11:1), and Judith plays it back as a hymn — *not only men shall serve him by you, but also the beasts of the field, and the cattle, and the fowls of the air, shall live by your power under Nabuchodonosor and all his house* (Judith 11:7). This is the antichrist pattern, the tyrant who claims the worship and the very breath of all flesh that belong to Yahuah alone. Daniel met the same Nebuchadnezzar with the same demand: *at what time ye hear the sound of the cornet, flute, harp, sackbut, psaltery, dulcimer, and all kinds of musick, ye fall down and worship the golden image that Nebuchadnezzar the king hath set up* (Daniel 3:5), backed by the furnace — *And whoso falleth not down and worshippeth shall the same hour be cast into the midst of a burning fiery furnace* (Daniel 3:6). And the three Hebrews give the only faithful answer to every world-king who would be worshipped: *But if not, be it known unto thee, O king, that we will not serve thy gods, nor worship the golden image which thou hast set up* (Daniel 3:18). The system that demands universal homage is dismantled not by a bigger army but by a covenant people who will not bow.',
       sv.verse_id, ev.verse_id, 'extras', 60253
  FROM _session253_jdt11_lookup sv, _session253_jdt11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=11 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-11-handmaid-who-serves-yahuah',
       E'Thy Handmaid That Serveth Yahuah Day and Night',
       E'Beneath the cunning, Judith names her true allegiance: *Receive the words of your servant, and suffer yours handmaid to speak in your presence* (Judith 11:5), and *your servant is religious, and serveth Yahuah (God) of heaven day and night... I will pray to Yahuah (God), and he will tell me when they have committed their sins* (Judith 11:17). The lowly handmaid who serves Yahuah night and day is the figure the Most High lifts up to confound the proud. Miriam answered Gabriel in exactly this posture: *And Mary said, Behold the handmaid of Yahuah (Lord); be it unto me according to thy word. And the angel departed from her* (Luke 1:38) — the willing servant through whom the deliverance comes. And the deliverance Judith carries belongs to a settled pattern, declared to Barak before another enemy general fell: *for Yahuah (LORD) shall sell Sisera into the hand of a woman* (Judges 4:9). The Elohim of Israel hides his victory in a handmaid''s hand.',
       sv.verse_id, ev.verse_id, 'extras', 60256
  FROM _session253_jdt11_lookup sv, _session253_jdt11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=11 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-11-snare-of-his-own-confidence',
       E'The Wicked Cometh in His Stead',
       E'Holofernes swallows the bait whole, marvelling at her wisdom and pledging that her counsel will put *strength... in our hands and destruction upon them that lightly regard my lord* (Judith 11:22) — and his confidence becomes the very snare that takes him. Judith promises to *lead you through the midst of Judea, until you come before Jerusalem* (Judith 11:19), and the general who trusts the trap will find the trap turned. Solomon names the reversal exactly: *The righteous is delivered out of trouble, and the wicked cometh in his stead* (Proverbs 11:8). The battle was never decided by the spear he would lift — David told another giant, *And all this assembly shall know that Yahuah (LORD) saveth not with sword and spear: for the battle is the LORD''S, and he will give you into our hands* (1 Samuel 17:47). This is how the Elohim of Israel works: *Elohim (God) hath chosen the weak things of the world to confound the things which are mighty* (1 Corinthians 1:27).',
       sv.verse_id, ev.verse_id, 'extras', 60259
  FROM _session253_jdt11_lookup sv, _session253_jdt11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=19
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=11 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-11-by-a-womans-hand',
       E'By the Hand of a Woman',
       E'Judith stakes everything on Yahuah accomplishing the work through her: *if you will follow the words of yours handmaid, Yahuah (God) will bring the thing perfectly to pass by you* (Judith 11:6), and *Yahuah (God) has sent me to work things with you, whereat all the earth shall be astonished* (Judith 11:16). The astonishing thing is the oldest promise — that the seed of the woman crushes the head of the enemy: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). Jael had already prefigured it, the woman''s hand driving the spike into the sleeping general''s skull: *Then Jael Heber''s wife took a nail of the tent, and took an hammer in her hand, and went softly unto him, and smote the nail into his temples, and fastened it into the ground* (Judges 4:21). And Miriam sings the meaning of every such victory — the proud cast down by the arm of Yahuah through the lowly: *He hath shewed strength with his arm; he hath scattered the proud in the imagination of their hearts* (Luke 1:51). The weak-confound-the-mighty pattern runs straight from Eden to the Magnificat; Judith stands in that line without being made the Messiah of it.',
       sv.verse_id, ev.verse_id, 'extras', 60262
  FROM _session253_jdt11_lookup sv, _session253_jdt11_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=11 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: judith-11-sin-the-only-breach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Chronicles 15:2 — *And he went out to meet Asa, and said unto him, Hear ye me, Asa, and all Yahudah (Judah) and Benjamin; Yahuah (LORD) is with you, while ye be with him; and if ye seek him, he will be found of you; but if ye forsake him, he will forsake you.* Judith''s words that the sword cannot prevail except they sin (11:10) are simply Azariah''s covenant law — protection while they hold to Yahuah, abandonment only if they forsake him.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt11_lookup sv, _session253_jdt11_lookup tv
 WHERE t.slug='judith-11-sin-the-only-breach'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=15 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 28:25 — *Yahuah (LORD) shall cause thee to be smitten before thine enemies: thou shalt go out one way against them, and flee seven ways before them: and shalt be removed into all the kingdoms of the earth.* The defeat Judith dangles before Holofernes — that it comes only by Israel''s sin (11:10) — is this Deuteronomic sentence, where being smitten before the enemy is the wage of forsaking the voice of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt11_lookup sv, _session253_jdt11_lookup tv
 WHERE t.slug='judith-11-sin-the-only-breach'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 26:36 — *And upon them that are left alive of you I will send a faintness into their hearts in the lands of their enemies; and the sound of a shaken leaf shall chase them; and they shall flee, as fleeing from a sword; and they shall fall when none pursueth.* When Judith says their sin would provoke their Elohim to anger and bring death upon them (11:11), she invokes the very faintness-of-heart curse Moses promised the covenant-breaker.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt11_lookup sv, _session253_jdt11_lookup tv
 WHERE t.slug='judith-11-sin-the-only-breach'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 32:30 — *How should one chase a thousand, and two put ten thousand to flight, except their Rock had sold them, and Yahuah (LORD) had shut them up?* Judith''s claim that Bethulia could only fall by transgressing the food-laws Yahuah forbade (11:12) rests on this: a nation is never overrun by enemy strength but only when its Rock sells it for its sin.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt11_lookup sv, _session253_jdt11_lookup tv
 WHERE t.slug='judith-11-sin-the-only-breach'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-11-king-of-all-the-earth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 3:5 — *That at what time ye hear the sound of the cornet, flute, harp, sackbut, psaltery, dulcimer, and all kinds of musick, ye fall down and worship the golden image that Nebuchadnezzar the king hath set up:* The Nebuchadnezzar whose servant Holofernes calls king of all the earth (11:1) is the same world-king who commands all peoples to fall down and worship his image.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt11_lookup sv, _session253_jdt11_lookup tv
 WHERE t.slug='judith-11-king-of-all-the-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 3:6 — *And whoso falleth not down and worshippeth shall the same hour be cast into the midst of a burning fiery furnace.* Judith''s flattery that even the beasts and fowls live by Nebuchadnezzar''s power (11:7) exposes the tyrant''s claim on all flesh, enforced in Daniel by the furnace that awaits any who refuse him worship.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt11_lookup sv, _session253_jdt11_lookup tv
 WHERE t.slug='judith-11-king-of-all-the-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 3:18 — *But if not, be it known unto thee, O king, that we will not serve thy gods, nor worship the golden image which thou hast set up.* Against the boast that all things serve Nebuchadnezzar (11:7), the three Hebrews give the covenant answer that breaks the system — they will not serve the king''s gods even unto the fire.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt11_lookup sv, _session253_jdt11_lookup tv
 WHERE t.slug='judith-11-king-of-all-the-earth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-11-handmaid-who-serves-yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 1:38 — *And Mary said, Behold the handmaid of Yahuah (Lord); be it unto me according to thy word. And the angel departed from her.* Judith calling herself handmaid before Holofernes (11:5) joins the line of lowly women who name themselves Yahuah''s handmaid and become the vessel of his deliverance.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt11_lookup sv, _session253_jdt11_lookup tv
 WHERE t.slug='judith-11-handmaid-who-serves-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Judges 4:9 — *And she said, I will surely go with thee: notwithstanding the journey that thou takest shall not be for thine honour; for Yahuah (LORD) shall sell Sisera into the hand of a woman. And Deborah arose, and went with Barak to Kedesh.* Judith''s vow to serve Yahuah and bring back word of the enemy''s fall (11:17) re-treads Deborah''s word that Yahuah would sell the enemy captain into a woman''s hand.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt11_lookup sv, _session253_jdt11_lookup tv
 WHERE t.slug='judith-11-handmaid-who-serves-yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-11-snare-of-his-own-confidence
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 11:8 — *The righteous is delivered out of trouble, and the wicked cometh in his stead.* Holofernes'' confidence that Judith''s counsel brings destruction on his enemies (11:22) is the snare reversed — the righteous goes free and the wicked man steps into the trouble he meant for her.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt11_lookup sv, _session253_jdt11_lookup tv
 WHERE t.slug='judith-11-snare-of-his-own-confidence'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Samuel 17:47 — *And all this assembly shall know that Yahuah (LORD) saveth not with sword and spear: for the battle is the LORD''S, and he will give you into our hands.* Holofernes plans to march his army to Jerusalem behind Judith (11:19), but the outcome belongs to David''s truth — the battle is Yahuah''s, not won by sword and spear.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt11_lookup sv, _session253_jdt11_lookup tv
 WHERE t.slug='judith-11-snare-of-his-own-confidence'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=17 AND tv.verse_number=47
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 1:27 — *But Elohim (God) hath chosen the foolish things of the world to confound the wise; and Elohim (God) hath chosen the weak things of the world to confound the things which are mighty;* The mighty general who marvels at a widow''s wisdom (11:22) is about to be confounded by the weak thing Elohim chose, exactly as Paul describes.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt11_lookup sv, _session253_jdt11_lookup tv
 WHERE t.slug='judith-11-snare-of-his-own-confidence'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-11-by-a-womans-hand
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Judith''s promise that Yahuah will bring the thing perfectly to pass by her hand (11:6) echoes the first promise that the head of the enemy is bruised through the woman.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt11_lookup sv, _session253_jdt11_lookup tv
 WHERE t.slug='judith-11-by-a-womans-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Judges 4:21 — *Then Jael Heber''s wife took a nail of the tent, and took an hammer in her hand, and went softly unto him, and smote the nail into his temples, and fastened it into the ground: for he was fast asleep and weary. So he died.* The deed at which all the earth shall be astonished (11:16) mirrors Jael''s hand felling the enemy commander in his sleep — Yahuah''s victory carried by a woman.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt11_lookup sv, _session253_jdt11_lookup tv
 WHERE t.slug='judith-11-by-a-womans-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=4 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 1:51 — *He hath shewed strength with his arm; he hath scattered the proud in the imagination of their hearts.* Judith sent to work a wonder before all the earth (11:16) belongs to the Magnificat''s pattern, where Yahuah''s arm scatters the proud and lifts the lowly.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt11_lookup sv, _session253_jdt11_lookup tv
 WHERE t.slug='judith-11-by-a-womans-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=11 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=51
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

