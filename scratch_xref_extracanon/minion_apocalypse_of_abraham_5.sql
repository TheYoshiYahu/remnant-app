-- ----- fragment: minion_apocalypseofabraham_05.sql (session253 apocalypse-of-abraham 5) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa5 (view _session253_aoa5_lookup). Sort band base 67100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa5_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-5-the-god-of-wood-burns
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 5, 8, 'canon', 'isaiah', 44, 15, 'free', E'Isaiah 44:15 — *Then shall it be for a man to burn: for he will take thereof, and warm himself; yea, he kindleth it, and baketh bread; yea, he maketh a god, and worshippeth it; he maketh it a graven image, and falleth down thereto.* The wood-god of Apocalypse of Abraham 5:8 is the very thing Isaiah names — fuel called a god, kindled by the same hand that bows to it.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 5, 11, 'canon', 'isaiah', 44, 20, 'free', E'Isaiah 44:20 — *He feedeth on ashes: a deceived heart hath turned him aside, that he cannot deliver his soul, nor say, Is there not a lie in my right hand?* Barisat reduced to ashes in Apocalypse of Abraham 5:11 is Isaiah''s deceived heart unmasked — the god is the lie in the idol-maker''s hand.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 5, 8, 'apocrypha', 'the-wisdom-of-solomon', 13, 16, 'extras', E'Wisdom of Solomon 13:16 — *For he provided for it that it might not fall, knowing that it was unable to help itself; for it is an image, and has need of help.* The carpenter must fasten the idol lest it topple; in Apocalypse of Abraham 5:8 Barisat does fall backward into the fire, helpless to save even itself.'),
  -- thread: apocalypse-of-abraham-5-it-cannot-save-itself
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 5, 16, 'canon', 'psalms', 115, 8, 'free', E'Psalm 115:8 — *They that make them are like unto them; so is every one that trusteth in them.* Terah the idol-maker and the ashen Barisat of Apocalypse of Abraham 5:16 are bound as one — the maker is as lifeless as what his hands have made.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 5, 9, 'canon', 'jeremiah', 10, 5, 'free', E'Jeremiah 10:5 — *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good.* Abraham''s taunt in Apocalypse of Abraham 5:9 exposes exactly this — a god that must be carried and cannot move cannot kindle a fire or cook a meal.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 5, 16, 'canon', 'isaiah', 46, 7, 'free', E'Isaiah 46:7 — *They bear him upon the shoulder, they carry him, and set him in his place, and he standeth; from his place shall he not remove: yea, one shall cry unto him, yet can he not answer, nor save him out of his trouble.* Barisat, burnt to dust in Apocalypse of Abraham 5:16, could not answer or save itself from the flame, let alone its worshipper.'),
  -- thread: apocalypse-of-abraham-5-fathers-served-other-gods
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 5, 18, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Scripture names Terah the very idolater whose endless wood-gods Abraham mocks in Apocalypse of Abraham 5:18.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 5, 13, 'canon', 'acts', 7, 2, 'free', E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran.* While Terah blesses Merumath in Apocalypse of Abraham 5:13, the God of glory is already moving to call Abraham out of that idol-house.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 5, 17, 'apocrypha', 'the-wisdom-of-solomon', 13, 10, 'extras', E'Wisdom of Solomon 13:10 — *But miserable are they, and in dead things is their hope, who call them gods, which are the works of men''s hands, gold and silver, to shew art in, and resemblances of beasts, or a stone good for nothing, the work of an ancient hand.* Terah''s boast in Apocalypse of Abraham 5:17 — *Great is the power of Barisat!* — is the misery the apocrypha names: hope set in dead things, the work of a maker''s hand.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa5_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa5_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-5-the-god-of-wood-burns',
       E'The god of wood burned to ashes',
       E'*And it came to pass, when I had laid the splinters in the fire, in order that I might make ready food for my father — on going out to ask a question regarding the food, I placed Barisat before the kindled fire... And on returning I found Barisat fallen backwards, and his feet surrounded by fire and horribly burnt... he was gradually burnt up by the fire and reduced to ashes* (Apocalypse of Abraham 5:6,8,11). The young Abraham sees the lie with his own eyes: the same fire that was meant to cook the meal devours the god. It ain''t new — the prophets say exactly this. *He burneth part thereof in the fire... yea, he maketh a god, and worshippeth it; he maketh it a graven image, and falleth down thereto* (Isaiah 44:16,15) — the selfsame wood that warms the man is called a god. *He feedeth on ashes: a deceived heart hath turned him aside, that he cannot deliver his soul, nor say, Is there not a lie in my right hand?* (Isaiah 44:20) — Barisat reduced to ashes is the prophet''s verdict made visible. And the apocrypha says it of one piece: *a crooked piece of wood, and full of knots, has carved it diligently... and fashioned it to the image of a man... For he provided for it that it might not fall, knowing that it was unable to help itself* (Wisdom of Solomon 13:13,16) — the carpenter props up what cannot stand, and Barisat fell backward into the flame.',
       sv.verse_id, ev.verse_id, 'extras', 67100
  FROM _session253_aoa5_lookup sv, _session253_aoa5_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=5 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=5 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-5-it-cannot-save-itself',
       E'It cannot save — not even itself',
       E'Abraham''s mocking taunt cuts to the root: *Truly, Barisat, thou canst kindle the fire and cook food!* (Apocalypse of Abraham 5:9) — and *He is burnt to ashes in the violence of the fire and is reduced to dust* (5:16). A god that cannot deliver itself from the flame can deliver no one. It ain''t new — the psalm and the prophet say the same of every idol of men''s hands. *They have mouths, but they speak not... They that make them are like unto them; so is every one that trusteth in them* (Psalm 115:5,8). *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good* (Jeremiah 10:5). And Isaiah''s word lands precisely: *one shall cry unto him, yet can he not answer, nor save him out of his trouble* (Isaiah 46:7) — Barisat could not so much as keep its own feet from the fire.',
       sv.verse_id, ev.verse_id, 'extras', 67103
  FROM _session253_aoa5_lookup sv, _session253_aoa5_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=5 AND sv.verse_number=9
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=5 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-5-fathers-served-other-gods',
       E'Terah the idol-maker — your fathers served other gods',
       E'Terah blesses his god Merumath, and is content to *make another to-day* when Barisat is gone: *Great is the power of Barisat! I will make another to-day, and to-morrow he will prepare my food* (Apocalypse of Abraham 5:17-18). The father who carves gods cannot grieve their death — he simply carves more. It ain''t new — the LORD names Terah by name as the idolater out of whom Abraham was called. *Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods* (Joshua 24:2). And the calling-out follows: *The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran* (Acts 7:2) — the One living Elohim breaks into the idol-maker''s house. The apocrypha frames the whole tragedy: *miserable are they, and in dead things is their hope, who call them gods, which are the works of men''s hands* (Wisdom of Solomon 13:10).',
       sv.verse_id, ev.verse_id, 'extras', 67106
  FROM _session253_aoa5_lookup sv, _session253_aoa5_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=5 AND sv.verse_number=13
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=5 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-5-the-god-of-wood-burns
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 44:15 — *Then shall it be for a man to burn: for he will take thereof, and warm himself; yea, he kindleth it, and baketh bread; yea, he maketh a god, and worshippeth it; he maketh it a graven image, and falleth down thereto.* The wood-god of Apocalypse of Abraham 5:8 is the very thing Isaiah names — fuel called a god, kindled by the same hand that bows to it.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa5_lookup sv, _session253_aoa5_lookup tv
 WHERE t.slug='apocalypse-of-abraham-5-the-god-of-wood-burns'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 44:20 — *He feedeth on ashes: a deceived heart hath turned him aside, that he cannot deliver his soul, nor say, Is there not a lie in my right hand?* Barisat reduced to ashes in Apocalypse of Abraham 5:11 is Isaiah''s deceived heart unmasked — the god is the lie in the idol-maker''s hand.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa5_lookup sv, _session253_aoa5_lookup tv
 WHERE t.slug='apocalypse-of-abraham-5-the-god-of-wood-burns'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=5 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 13:16 — *For he provided for it that it might not fall, knowing that it was unable to help itself; for it is an image, and has need of help.* The carpenter must fasten the idol lest it topple; in Apocalypse of Abraham 5:8 Barisat does fall backward into the fire, helpless to save even itself.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa5_lookup sv, _session253_aoa5_lookup tv
 WHERE t.slug='apocalypse-of-abraham-5-the-god-of-wood-burns'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-5-it-cannot-save-itself
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 115:8 — *They that make them are like unto them; so is every one that trusteth in them.* Terah the idol-maker and the ashen Barisat of Apocalypse of Abraham 5:16 are bound as one — the maker is as lifeless as what his hands have made.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa5_lookup sv, _session253_aoa5_lookup tv
 WHERE t.slug='apocalypse-of-abraham-5-it-cannot-save-itself'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=5 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 10:5 — *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good.* Abraham''s taunt in Apocalypse of Abraham 5:9 exposes exactly this — a god that must be carried and cannot move cannot kindle a fire or cook a meal.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa5_lookup sv, _session253_aoa5_lookup tv
 WHERE t.slug='apocalypse-of-abraham-5-it-cannot-save-itself'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=5 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 46:7 — *They bear him upon the shoulder, they carry him, and set him in his place, and he standeth; from his place shall he not remove: yea, one shall cry unto him, yet can he not answer, nor save him out of his trouble.* Barisat, burnt to dust in Apocalypse of Abraham 5:16, could not answer or save itself from the flame, let alone its worshipper.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa5_lookup sv, _session253_aoa5_lookup tv
 WHERE t.slug='apocalypse-of-abraham-5-it-cannot-save-itself'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=5 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=46 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-5-fathers-served-other-gods
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Scripture names Terah the very idolater whose endless wood-gods Abraham mocks in Apocalypse of Abraham 5:18.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa5_lookup sv, _session253_aoa5_lookup tv
 WHERE t.slug='apocalypse-of-abraham-5-fathers-served-other-gods'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran.* While Terah blesses Merumath in Apocalypse of Abraham 5:13, the God of glory is already moving to call Abraham out of that idol-house.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa5_lookup sv, _session253_aoa5_lookup tv
 WHERE t.slug='apocalypse-of-abraham-5-fathers-served-other-gods'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 13:10 — *But miserable are they, and in dead things is their hope, who call them gods, which are the works of men''s hands, gold and silver, to shew art in, and resemblances of beasts, or a stone good for nothing, the work of an ancient hand.* Terah''s boast in Apocalypse of Abraham 5:17 — *Great is the power of Barisat!* — is the misery the apocrypha names: hope set in dead things, the work of a maker''s hand.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa5_lookup sv, _session253_aoa5_lookup tv
 WHERE t.slug='apocalypse-of-abraham-5-fathers-served-other-gods'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

