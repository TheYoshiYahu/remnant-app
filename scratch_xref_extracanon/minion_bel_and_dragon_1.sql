-- ----- fragment: minion_belandthedragon_01.sql (session253 bel-and-the-dragon 1) -----
-- Source anchor: apocrypha/bel-and-the-dragon ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: bel1 (view _session253_bel1_lookup). Sort band base 61200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_bel1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: bel-and-dragon-1-idol-made-with-hands
  ('apocrypha', 'bel-and-the-dragon', 1, 5, 'canon', 'isaiah', 46, 6, 'free', E'Isaiah 46:6 — *They lavish gold out of the bag, and weigh silver in the balance, and hire a goldsmith; and he maketh it a god: they fall down, yea, they worship.* Isaiah''s portrait of the hired-out, hand-made god is the very idol Daniel refuses to adore in Bel and the Dragon 1:5.'),
  ('apocrypha', 'bel-and-the-dragon', 1, 5, 'canon', 'psalms', 115, 4, 'free', E'Psalm 115:4 — *Their idols are silver and gold, the work of men''s hands.* The psalmist names exactly what Daniel calls ''idols made with hands'' in Bel and the Dragon 1:5.'),
  ('apocrypha', 'bel-and-the-dragon', 1, 5, 'canon', 'acts', 17, 24, 'free', E'Acts 17:24 — *Elohim (God) that made the world and all things therein, seeing that he is Yahuah (Lord) of heaven and earth, dwelleth not in temples made with hands;* Paul preaches the same Maker of heaven and earth, untouched by hands, whom Daniel confesses in Bel and the Dragon 1:5.'),
  ('apocrypha', 'bel-and-the-dragon', 1, 7, 'canon', 'psalms', 115, 5, 'free', E'Psalm 115:5 — *They have mouths, but they speak not: eyes have they, but they see not:* Daniel''s verdict that Bel ''is but clay within, and brass without, and did never eat or drink any thing'' (Bel and the Dragon 1:7) echoes the psalm''s dead, senseless idol.'),
  -- thread: bel-and-dragon-1-they-cannot-eat
  ('apocrypha', 'bel-and-the-dragon', 1, 6, 'canon', 'jeremiah', 10, 5, 'free', E'Jeremiah 10:5 — *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good.* Jeremiah''s helpless idol cannot move or act — just as Bel cannot truly eat the offerings the king credits to him in Bel and the Dragon 1:6.'),
  ('apocrypha', 'bel-and-the-dragon', 1, 7, 'canon', 'psalms', 115, 7, 'free', E'Psalm 115:7 — *They have hands, but they handle not: feet have they, but they walk not: neither speak they through their throat.* The idol with throat that cannot swallow is precisely Daniel''s clay-and-brass Bel that ''did never eat or drink any thing'' in Bel and the Dragon 1:7.'),
  ('apocrypha', 'bel-and-the-dragon', 1, 13, 'canon', 'isaiah', 44, 20, 'free', E'Isaiah 44:20 — *He feedeth on ashes: a deceived heart hath turned him aside, that he cannot deliver his soul, nor say, Is there not a lie in my right hand?* The deceived heart and the lie at the idol''s table match the priests'' secret entrance and consumed offerings of Bel and the Dragon 1:13 — fittingly, Daniel exposes them by ashes.'),
  -- thread: bel-and-dragon-1-bel-boweth-down
  ('apocrypha', 'bel-and-the-dragon', 1, 22, 'canon', 'isaiah', 46, 1, 'free', E'Isaiah 46:1 — *Bel boweth down, Nebo stoopeth, their idols were upon the beasts, and upon the cattle: your carriages were heavy loaden; they are a burden to the weary beast.* Isaiah foresaw the very god by name brought low — the Bel that Daniel destroys with his temple in Bel and the Dragon 1:22.'),
  ('apocrypha', 'bel-and-the-dragon', 1, 18, 'canon', 'jeremiah', 10, 14, 'free', E'Jeremiah 10:14 — *Every man is brutish in his knowledge: every founder is confounded by the graven image: for his molten image is falsehood, and there is no breath in them.* The king''s praise ''Great art you, O Bel, and with you is no deceit at all'' (Bel and the Dragon 1:18) is the brutish confidence Jeremiah condemns — the image is breathless falsehood.'),
  ('apocrypha', 'bel-and-the-dragon', 1, 22, 'canon', 'isaiah', 44, 25, 'free', E'Isaiah 44:25 — *That frustrateth the tokens of the liars, and maketh diviners mad; that turneth wise men backward, and maketh their knowledge foolish;* Yahuah who frustrates the liars is at work as Daniel slays the priests and tears down Bel''s temple in Bel and the Dragon 1:22.'),
  -- thread: bel-and-dragon-1-living-elohim-no-other
  ('apocrypha', 'bel-and-the-dragon', 1, 25, 'canon', 'jeremiah', 10, 10, 'free', E'Jeremiah 10:10 — *But Yahuah (LORD) is the true Elohim (God), he is the living Elohim (God), and an everlasting king: at his wrath the earth shall tremble, and the nations shall not be able to abide his indignation.* Daniel''s confession of ''the living Yahuah (God)'' in Bel and the Dragon 1:25 is the very title Jeremiah sets against the dead gods.'),
  ('apocrypha', 'bel-and-the-dragon', 1, 25, 'canon', 'isaiah', 44, 6, 'free', E'Isaiah 44:6 — *Thus saith Yahuah (LORD) the King of Yashar''el (Israel), and his redeemer Yahuah Tseva''ot (LORD of hosts); I am the first, and I am the last; and beside me there is no Elohim (God).* The ''beside me there is no Elohim'' that grounds Daniel''s worship in Bel and the Dragon 1:25 is Isaiah''s first-and-last King.'),
  ('apocrypha', 'bel-and-the-dragon', 1, 41, 'canon', 'deuteronomy', 4, 39, 'free', E'Deuteronomy 4:39 — *Know therefore this day, and consider it in thine heart, that Yahuah (LORD) he is Elohim (God) in heaven above, and upon the earth beneath: there is none else.* The king''s cry ''there is none other beside you'' in Bel and the Dragon 1:41 confesses the very ''there is none else'' Moses taught Israel.'),
  ('apocrypha', 'bel-and-the-dragon', 1, 25, 'canon', '1-thessalonians', 1, 9, 'free', E'1 Thessalonians 1:9 — *For they themselves shew of us what manner of entering in we had unto you, and how ye turned to Elohim (God) from idols to serve the living and true Elohim (God);* The Thessalonians'' turn from idols to ''the living and true Elohim'' is the same exchange Daniel makes before the dragon in Bel and the Dragon 1:25 — it ain''t new.'),
  -- thread: bel-and-dragon-1-lions-mouths-shut
  ('apocrypha', 'bel-and-the-dragon', 1, 40, 'canon', 'daniel', 6, 22, 'free', E'Daniel 6:22 — *My Elohim (God) hath sent his angel, and hath shut the lions'' mouths, that they have not hurt me: forasmuch as before him innocency was found in me; and also before thee, O king, have I done no hurt.* The canonical Daniel names the angel who shuts the lions'' mouths — the same deliverance the king finds when Daniel sits unharmed in Bel and the Dragon 1:40.'),
  ('apocrypha', 'bel-and-the-dragon', 1, 31, 'canon', 'psalms', 91, 13, 'free', E'Psalm 91:13 — *Thou shalt tread upon the lion and adder: the young lion and the dragon shalt thou trample under feet.* The psalm puts BOTH the lion and the dragon under the righteous man''s feet — the two beasts Daniel overcomes in Bel and the Dragon 1:31.'),
  ('apocrypha', 'bel-and-the-dragon', 1, 38, 'canon', 'daniel', 6, 27, 'free', E'Daniel 6:27 — *He delivereth and rescueth, and he worketh signs and wonders in heaven and in earth, who hath delivered Daniel from the power of the lions.* Daniel''s trust that Yahuah has ''not forsaken them that seek'' Him (Bel and the Dragon 1:38) is the deliverance Darius proclaims in the canonical book.'),
  -- thread: bel-and-dragon-1-angel-carries-habakkuk
  ('apocrypha', 'bel-and-the-dragon', 1, 36, 'canon', 'psalms', 34, 7, 'free', E'Psalm 34:7 — *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them.* The angel who bears Habbacuc by the hair to feed Daniel in Bel and the Dragon 1:36 is the encamping deliverer of the psalm.'),
  ('apocrypha', 'bel-and-the-dragon', 1, 34, 'canon', 'psalms', 91, 11, 'free', E'Psalm 91:11 — *For he shall give his angels charge over thee, to keep thee in all thy ways.* The angel of Yahuah charged to carry Habbacuc''s dinner into Babylon in Bel and the Dragon 1:34 fulfills the psalm''s promise of angelic keeping.'),
  ('apocrypha', 'bel-and-the-dragon', 1, 39, 'canon', 'psalms', 34, 10, 'free', E'Psalm 34:10 — *The young lions do lack, and suffer hunger: but they that seek Yahuah (LORD) shall not want any good thing.* While the den''s lions are kept from their prey, Daniel who seeks Yahuah is fed and lacks no good thing — the angel setting Habbacuc home again in Bel and the Dragon 1:39.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_bel1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_bel1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'bel-and-dragon-1-idol-made-with-hands',
       E'I may not worship idols made with hands',
       E'Daniel draws the line of the First Commandment in the heart of Babylon: *Who answered and said, Because I may not worship idols made with hands, but the living Yahuah (God), who has created the heaven and the earth, and has sovereignty over all flesh.* (Bel and the Dragon 1:5) The prophets had already mocked the manufactured god — *They lavish gold out of the bag, and weigh silver in the balance, and hire a goldsmith; and he maketh it a god: they fall down, yea, they worship.* (Isaiah 46:6); *Their idols are silver and gold, the work of men''s hands.* (Psalm 115:4) And the apostle carries the same word to Athens: *Elohim (God) that made the world and all things therein, seeing that he is Yahuah (Lord) of heaven and earth, dwelleth not in temples made with hands;* (Acts 17:24) It ain''t new — the Maker of heaven and earth is set against everything fashioned by hands.',
       sv.verse_id, ev.verse_id, 'extras', 61200
  FROM _session253_bel1_lookup sv, _session253_bel1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='bel-and-the-dragon' AND sv.chapter_number=1 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='bel-and-the-dragon' AND ev.chapter_number=1 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'bel-and-dragon-1-they-cannot-eat',
       E'The idol that cannot eat',
       E'The king is sure Bel is alive because the food vanishes each night: *Then said the king to him, Thinkest you not that Bel is a living Yahuah (God)? seest you not how much he eats and drinks every day?* (Bel and the Dragon 1:6) But Daniel exposes a lie of priests and a secret door — the idol *did never eat or drink any thing.* (Bel and the Dragon 1:7) Jeremiah had already laughed at the staked, dumb scarecrow: *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good.* (Jeremiah 10:5) And the psalm: *They have hands, but they handle not: feet have they, but they walk not: neither speak they through their throat.* (Psalm 115:7) The god that must be fed by men is no god at all.',
       sv.verse_id, ev.verse_id, 'extras', 61203
  FROM _session253_bel1_lookup sv, _session253_bel1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='bel-and-the-dragon' AND sv.chapter_number=1 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='bel-and-the-dragon' AND ev.chapter_number=1 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'bel-and-dragon-1-bel-boweth-down',
       E'Bel boweth down — the idol destroyed',
       E'When the ashes betray the footsteps of priests, wives and children, the fraud collapses: *Therefore the king slew them, and delivered Bel into Daniel''s power, who destroyed him and his temple.* (Bel and the Dragon 1:22) Isaiah named this god by name and saw him fall: *Bel boweth down, Nebo stoopeth, their idols were upon the beasts, and upon the cattle: your carriages were heavy loaden; they are a burden to the weary beast.* (Isaiah 46:1) The molten image is *falsehood, and there is no breath in them.* (Jeremiah 10:14) The Maker frustrates the liars: *That frustrateth the tokens of the liars, and maketh diviners mad; that turneth wise men backward, and maketh their knowledge foolish;* (Isaiah 44:25) The whole SYSTEM of dead gods is overthrown — not a person, but the lie.',
       sv.verse_id, ev.verse_id, 'extras', 61206
  FROM _session253_bel1_lookup sv, _session253_bel1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='bel-and-the-dragon' AND sv.chapter_number=1 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='bel-and-the-dragon' AND ev.chapter_number=1 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'bel-and-dragon-1-living-elohim-no-other',
       E'I will worship the living Elohim',
       E'Pressed to bow to the dragon, Daniel confesses the living God: *Then said Daniel to the king, I will worship Yahuah (God), my Elohim (God): for he is the living Yahuah (God).* (Bel and the Dragon 1:25) Jeremiah set the living King against all the perishing gods: *But Yahuah (LORD) is the true Elohim (God), he is the living Elohim (God), and an everlasting king: at his wrath the earth shall tremble, and the nations shall not be able to abide his indignation.* (Jeremiah 10:10) And He alone is first and last: *Thus saith Yahuah (LORD) the King of Yashar''el (Israel), and his redeemer Yahuah Tseva''ot (LORD of hosts); I am the first, and I am the last; and beside me there is no Elohim (God).* (Isaiah 44:6) When the king at last cries it from the den''s mouth — *Great art you, O Yahuah (God) of Daniel, and there is none other beside you.* (Bel and the Dragon 1:41) — he speaks the Shema of Deuteronomy: *Know therefore this day, and consider it in thine heart, that Yahuah (LORD) he is Elohim (God) in heaven above, and upon the earth beneath: there is none else.* (Deuteronomy 4:39)',
       sv.verse_id, ev.verse_id, 'extras', 61209
  FROM _session253_bel1_lookup sv, _session253_bel1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='bel-and-the-dragon' AND sv.chapter_number=1 AND sv.verse_number=25
   AND ev.edition_slug='apocrypha' AND ev.book_slug='bel-and-the-dragon' AND ev.chapter_number=1 AND ev.verse_number=41
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'bel-and-dragon-1-lions-mouths-shut',
       E'Yahuah shut the lions'' mouths',
       E'Cast among seven starving lions, Daniel is unharmed: *Upon the seventh day the king went to bewail Daniel: and when he came to the den, he looked in, and behold, Daniel was sitting.* (Bel and the Dragon 1:40) This is the deliverance of the canonical Daniel: *My Elohim (God) hath sent his angel, and hath shut the lions'' mouths, that they have not hurt me: forasmuch as before him innocency was found in me; and also before thee, O king, have I done no hurt.* (Daniel 6:22) The psalm sings the promise: *Thou shalt tread upon the lion and adder: the young lion and the dragon shalt thou trample under feet.* (Psalm 91:13) — both lion AND dragon under foot, the two beasts of this very chapter. The living Elohim does not forsake them that seek Him: *And Daniel said, You have remembered me, O Yahuah (God): neither have you forsaken them that seek you and love you.* (Bel and the Dragon 1:38)',
       sv.verse_id, ev.verse_id, 'extras', 61212
  FROM _session253_bel1_lookup sv, _session253_bel1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='bel-and-the-dragon' AND sv.chapter_number=1 AND sv.verse_number=31
   AND ev.edition_slug='apocrypha' AND ev.book_slug='bel-and-the-dragon' AND ev.chapter_number=1 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'bel-and-dragon-1-angel-carries-habakkuk',
       E'The angel that carries them that fear Him',
       E'Yahuah feeds His servant in the den by a wonder — the prophet Habbacuc is borne from Jewry to Babylon: *Then the angel of Yahuah (God) took him by the crown, and bare him by the hair of his head, and through the vehemency of his spirit set him in Babylon over the den.* (Bel and the Dragon 1:36) The psalm sings this guarding ministry: *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them.* (Psalm 34:7) And the charge given the angels: *For he shall give his angels charge over thee, to keep thee in all thy ways. They shall bear thee up in their hands, lest thou dash thy foot against a stone.* (Psalm 91:11) The bread carried to Daniel is the table the living Elohim spreads for them that love Him.',
       sv.verse_id, ev.verse_id, 'extras', 61215
  FROM _session253_bel1_lookup sv, _session253_bel1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='bel-and-the-dragon' AND sv.chapter_number=1 AND sv.verse_number=34
   AND ev.edition_slug='apocrypha' AND ev.book_slug='bel-and-the-dragon' AND ev.chapter_number=1 AND ev.verse_number=39
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: bel-and-dragon-1-idol-made-with-hands
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 46:6 — *They lavish gold out of the bag, and weigh silver in the balance, and hire a goldsmith; and he maketh it a god: they fall down, yea, they worship.* Isaiah''s portrait of the hired-out, hand-made god is the very idol Daniel refuses to adore in Bel and the Dragon 1:5.'
  FROM cross_reference_threads t, cross_references x, _session253_bel1_lookup sv, _session253_bel1_lookup tv
 WHERE t.slug='bel-and-dragon-1-idol-made-with-hands'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='bel-and-the-dragon' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=46 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 115:4 — *Their idols are silver and gold, the work of men''s hands.* The psalmist names exactly what Daniel calls ''idols made with hands'' in Bel and the Dragon 1:5.'
  FROM cross_reference_threads t, cross_references x, _session253_bel1_lookup sv, _session253_bel1_lookup tv
 WHERE t.slug='bel-and-dragon-1-idol-made-with-hands'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='bel-and-the-dragon' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 17:24 — *Elohim (God) that made the world and all things therein, seeing that he is Yahuah (Lord) of heaven and earth, dwelleth not in temples made with hands;* Paul preaches the same Maker of heaven and earth, untouched by hands, whom Daniel confesses in Bel and the Dragon 1:5.'
  FROM cross_reference_threads t, cross_references x, _session253_bel1_lookup sv, _session253_bel1_lookup tv
 WHERE t.slug='bel-and-dragon-1-idol-made-with-hands'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='bel-and-the-dragon' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=17 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 115:5 — *They have mouths, but they speak not: eyes have they, but they see not:* Daniel''s verdict that Bel ''is but clay within, and brass without, and did never eat or drink any thing'' (Bel and the Dragon 1:7) echoes the psalm''s dead, senseless idol.'
  FROM cross_reference_threads t, cross_references x, _session253_bel1_lookup sv, _session253_bel1_lookup tv
 WHERE t.slug='bel-and-dragon-1-idol-made-with-hands'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='bel-and-the-dragon' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: bel-and-dragon-1-they-cannot-eat
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 10:5 — *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good.* Jeremiah''s helpless idol cannot move or act — just as Bel cannot truly eat the offerings the king credits to him in Bel and the Dragon 1:6.'
  FROM cross_reference_threads t, cross_references x, _session253_bel1_lookup sv, _session253_bel1_lookup tv
 WHERE t.slug='bel-and-dragon-1-they-cannot-eat'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='bel-and-the-dragon' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 115:7 — *They have hands, but they handle not: feet have they, but they walk not: neither speak they through their throat.* The idol with throat that cannot swallow is precisely Daniel''s clay-and-brass Bel that ''did never eat or drink any thing'' in Bel and the Dragon 1:7.'
  FROM cross_reference_threads t, cross_references x, _session253_bel1_lookup sv, _session253_bel1_lookup tv
 WHERE t.slug='bel-and-dragon-1-they-cannot-eat'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='bel-and-the-dragon' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 44:20 — *He feedeth on ashes: a deceived heart hath turned him aside, that he cannot deliver his soul, nor say, Is there not a lie in my right hand?* The deceived heart and the lie at the idol''s table match the priests'' secret entrance and consumed offerings of Bel and the Dragon 1:13 — fittingly, Daniel exposes them by ashes.'
  FROM cross_reference_threads t, cross_references x, _session253_bel1_lookup sv, _session253_bel1_lookup tv
 WHERE t.slug='bel-and-dragon-1-they-cannot-eat'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='bel-and-the-dragon' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: bel-and-dragon-1-bel-boweth-down
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 46:1 — *Bel boweth down, Nebo stoopeth, their idols were upon the beasts, and upon the cattle: your carriages were heavy loaden; they are a burden to the weary beast.* Isaiah foresaw the very god by name brought low — the Bel that Daniel destroys with his temple in Bel and the Dragon 1:22.'
  FROM cross_reference_threads t, cross_references x, _session253_bel1_lookup sv, _session253_bel1_lookup tv
 WHERE t.slug='bel-and-dragon-1-bel-boweth-down'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='bel-and-the-dragon' AND sv.chapter_number=1 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=46 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 10:14 — *Every man is brutish in his knowledge: every founder is confounded by the graven image: for his molten image is falsehood, and there is no breath in them.* The king''s praise ''Great art you, O Bel, and with you is no deceit at all'' (Bel and the Dragon 1:18) is the brutish confidence Jeremiah condemns — the image is breathless falsehood.'
  FROM cross_reference_threads t, cross_references x, _session253_bel1_lookup sv, _session253_bel1_lookup tv
 WHERE t.slug='bel-and-dragon-1-bel-boweth-down'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='bel-and-the-dragon' AND sv.chapter_number=1 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 44:25 — *That frustrateth the tokens of the liars, and maketh diviners mad; that turneth wise men backward, and maketh their knowledge foolish;* Yahuah who frustrates the liars is at work as Daniel slays the priests and tears down Bel''s temple in Bel and the Dragon 1:22.'
  FROM cross_reference_threads t, cross_references x, _session253_bel1_lookup sv, _session253_bel1_lookup tv
 WHERE t.slug='bel-and-dragon-1-bel-boweth-down'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='bel-and-the-dragon' AND sv.chapter_number=1 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: bel-and-dragon-1-living-elohim-no-other
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 10:10 — *But Yahuah (LORD) is the true Elohim (God), he is the living Elohim (God), and an everlasting king: at his wrath the earth shall tremble, and the nations shall not be able to abide his indignation.* Daniel''s confession of ''the living Yahuah (God)'' in Bel and the Dragon 1:25 is the very title Jeremiah sets against the dead gods.'
  FROM cross_reference_threads t, cross_references x, _session253_bel1_lookup sv, _session253_bel1_lookup tv
 WHERE t.slug='bel-and-dragon-1-living-elohim-no-other'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='bel-and-the-dragon' AND sv.chapter_number=1 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 44:6 — *Thus saith Yahuah (LORD) the King of Yashar''el (Israel), and his redeemer Yahuah Tseva''ot (LORD of hosts); I am the first, and I am the last; and beside me there is no Elohim (God).* The ''beside me there is no Elohim'' that grounds Daniel''s worship in Bel and the Dragon 1:25 is Isaiah''s first-and-last King.'
  FROM cross_reference_threads t, cross_references x, _session253_bel1_lookup sv, _session253_bel1_lookup tv
 WHERE t.slug='bel-and-dragon-1-living-elohim-no-other'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='bel-and-the-dragon' AND sv.chapter_number=1 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 4:39 — *Know therefore this day, and consider it in thine heart, that Yahuah (LORD) he is Elohim (God) in heaven above, and upon the earth beneath: there is none else.* The king''s cry ''there is none other beside you'' in Bel and the Dragon 1:41 confesses the very ''there is none else'' Moses taught Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_bel1_lookup sv, _session253_bel1_lookup tv
 WHERE t.slug='bel-and-dragon-1-living-elohim-no-other'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='bel-and-the-dragon' AND sv.chapter_number=1 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Thessalonians 1:9 — *For they themselves shew of us what manner of entering in we had unto you, and how ye turned to Elohim (God) from idols to serve the living and true Elohim (God);* The Thessalonians'' turn from idols to ''the living and true Elohim'' is the same exchange Daniel makes before the dragon in Bel and the Dragon 1:25 — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session253_bel1_lookup sv, _session253_bel1_lookup tv
 WHERE t.slug='bel-and-dragon-1-living-elohim-no-other'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='bel-and-the-dragon' AND sv.chapter_number=1 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=1 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: bel-and-dragon-1-lions-mouths-shut
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 6:22 — *My Elohim (God) hath sent his angel, and hath shut the lions'' mouths, that they have not hurt me: forasmuch as before him innocency was found in me; and also before thee, O king, have I done no hurt.* The canonical Daniel names the angel who shuts the lions'' mouths — the same deliverance the king finds when Daniel sits unharmed in Bel and the Dragon 1:40.'
  FROM cross_reference_threads t, cross_references x, _session253_bel1_lookup sv, _session253_bel1_lookup tv
 WHERE t.slug='bel-and-dragon-1-lions-mouths-shut'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='bel-and-the-dragon' AND sv.chapter_number=1 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=6 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 91:13 — *Thou shalt tread upon the lion and adder: the young lion and the dragon shalt thou trample under feet.* The psalm puts BOTH the lion and the dragon under the righteous man''s feet — the two beasts Daniel overcomes in Bel and the Dragon 1:31.'
  FROM cross_reference_threads t, cross_references x, _session253_bel1_lookup sv, _session253_bel1_lookup tv
 WHERE t.slug='bel-and-dragon-1-lions-mouths-shut'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='bel-and-the-dragon' AND sv.chapter_number=1 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=91 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 6:27 — *He delivereth and rescueth, and he worketh signs and wonders in heaven and in earth, who hath delivered Daniel from the power of the lions.* Daniel''s trust that Yahuah has ''not forsaken them that seek'' Him (Bel and the Dragon 1:38) is the deliverance Darius proclaims in the canonical book.'
  FROM cross_reference_threads t, cross_references x, _session253_bel1_lookup sv, _session253_bel1_lookup tv
 WHERE t.slug='bel-and-dragon-1-lions-mouths-shut'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='bel-and-the-dragon' AND sv.chapter_number=1 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=6 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: bel-and-dragon-1-angel-carries-habakkuk
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 34:7 — *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them.* The angel who bears Habbacuc by the hair to feed Daniel in Bel and the Dragon 1:36 is the encamping deliverer of the psalm.'
  FROM cross_reference_threads t, cross_references x, _session253_bel1_lookup sv, _session253_bel1_lookup tv
 WHERE t.slug='bel-and-dragon-1-angel-carries-habakkuk'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='bel-and-the-dragon' AND sv.chapter_number=1 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 91:11 — *For he shall give his angels charge over thee, to keep thee in all thy ways.* The angel of Yahuah charged to carry Habbacuc''s dinner into Babylon in Bel and the Dragon 1:34 fulfills the psalm''s promise of angelic keeping.'
  FROM cross_reference_threads t, cross_references x, _session253_bel1_lookup sv, _session253_bel1_lookup tv
 WHERE t.slug='bel-and-dragon-1-angel-carries-habakkuk'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='bel-and-the-dragon' AND sv.chapter_number=1 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=91 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 34:10 — *The young lions do lack, and suffer hunger: but they that seek Yahuah (LORD) shall not want any good thing.* While the den''s lions are kept from their prey, Daniel who seeks Yahuah is fed and lacks no good thing — the angel setting Habbacuc home again in Bel and the Dragon 1:39.'
  FROM cross_reference_threads t, cross_references x, _session253_bel1_lookup sv, _session253_bel1_lookup tv
 WHERE t.slug='bel-and-dragon-1-angel-carries-habakkuk'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='bel-and-the-dragon' AND sv.chapter_number=1 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

