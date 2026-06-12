-- ----- fragment: minion_apocalypseofabraham_04.sql (session253 apocalypse-of-abraham 4) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa4 (view _session253_aoa4_lookup). Sort band base 67075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa4_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-4-gods-cannot-save
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 4, 4, 'canon', 'isaiah', 44, 9, 'free', E'Isaiah 44:9 — *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* Isaiah''s verdict on the carved god is Abraham''s verdict on Terah''s wares — their power is vain (Apocalypse of Abraham 4:4).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 4, 4, 'canon', 'isaiah', 44, 10, 'free', E'Isaiah 44:10 — *Who hath formed a god, or molten a graven image that is profitable for nothing?* The prophet''s mocking question echoes Abraham''s: the thing the maker formed cannot profit or save him (Apocalypse of Abraham 4:4).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 4, 4, 'canon', 'psalms', 115, 5, 'free', E'Psalm 115:5 — *They have mouths, but they speak not: eyes have they, but they see not:* The idols that did not help themselves are the deaf, blind handiwork of Psalm 115 — they cannot help Terah (Apocalypse of Abraham 4:4).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 4, 4, 'canon', 'psalms', 115, 8, 'free', E'Psalm 115:8 — *They that make them are like unto them; so is every one that trusteth in them.* Abraham''s barb that Terah is his gods'' god — *thou art their god, since thou hast made them* — is the Psalm''s warning that the maker shares the idol''s ruin (Apocalypse of Abraham 4:4).'),
  -- thread: apocalypse-of-abraham-4-the-idol-maker
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 4, 2, 'canon', 'isaiah', 44, 12, 'free', E'Isaiah 44:12 — *The smith with the tongs both worketh in the coals, and fashioneth it with hammers, and worketh it with the strength of his arms: yea, he is hungry, and his strength faileth: he drinketh no water, and is faint.* Terah''s boast that *my work was not in vain* is the labouring smith of Isaiah — sweat poured into a thing that cannot feed him (Apocalypse of Abraham 4:2).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 4, 4, 'canon', 'isaiah', 44, 17, 'free', E'Isaiah 44:17 — *And the residue thereof he maketh a god, even his graven image: he falleth down unto it, and worshippeth it, and prayeth unto it, and saith, Deliver me; for thou art my god.* The maker who calls his own handiwork god is exactly Abraham''s charge — *thou art their god, since thou hast made them* (Apocalypse of Abraham 4:4).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 4, 5, 'canon', 'jeremiah', 10, 4, 'free', E'Jeremiah 10:4 — *They deck it with silver and with gold; they fasten it with nails and with hammers, that it move not.* The silver Abraham carries for the broken gods is the silver-decked idol Jeremiah describes, nailed down so it cannot fall (Apocalypse of Abraham 4:5).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 4, 5, 'canon', 'jeremiah', 10, 5, 'free', E'Jeremiah 10:5 — *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good.* The broken gods Abraham brokered the money for cannot move or save — Jeremiah''s helpless, carried idol (Apocalypse of Abraham 4:5).'),
  -- thread: apocalypse-of-abraham-4-fathers-served-other-gods
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 4, 6, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Joshua names Terah by name as an idolater — the very father whose gods Abraham rebukes (Apocalypse of Abraham 4:6).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 4, 6, 'canon', 'joshua', 24, 3, 'free', E'Joshua 24:3 — *And I took your father Abraham from the other side of the flood, and led him throughout all the land of Canaan, and multiplied his seed, and gave him Isaac.* Abraham''s break with his father''s gods is the hinge on which Yahuah takes him out and multiplies the seed (Apocalypse of Abraham 4:6).'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 4, 6, 'canon', 'acts', 7, 3, 'free', E'Acts 7:3 — *And said unto him, Get thee out of thy country, and from thy kindred, and come into the land which I shall shew thee.* Stephen''s retelling of the call out of Ur frames Abraham''s rupture with Terah''s house as the start of the covenant (Apocalypse of Abraham 4:6).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa4_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa4_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-4-gods-cannot-save',
       E'Their blessing is ruination — the gods that cannot help themselves',
       E'Abraham hands Terah the silver and turns his father''s own boast back on him: *"Blessed are the gods of thee, for thou art their god, since thou hast made them; for their blessing is ruination, and their power is vain; they who did not help themselves, how shall they, then, help thee or bless me?"* (Apocalypse of Abraham 4:4). It ain''t new — this is the prophets'' indictment of the idol exactly. Isaiah laughs the same laugh: *"They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed."* (Isaiah 44:9), and *"Who hath formed a god, or molten a graven image that is profitable for nothing?"* (Isaiah 44:10). The Psalmist seals the futility: *"They have mouths, but they speak not: eyes have they, but they see not:"* (Psalm 115:5) — and the verdict that the maker shares the fate of his handiwork: *"They that make them are like unto them; so is every one that trusteth in them."* (Psalm 115:8). The young Abraham sees what Israel would later be charged to see: a god you carve cannot carry you.',
       sv.verse_id, ev.verse_id, 'extras', 67075
  FROM _session253_aoa4_lookup sv, _session253_aoa4_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=4 AND sv.verse_number=4
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=4 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-4-the-idol-maker',
       E'Because thou hast made them — the workman and his god',
       E'Terah glories in his trade: *"Blessed art thou, Abraham, of my gods, because thou hast brought the price of the gods, so that my work was not in vain."* (Apocalypse of Abraham 4:2), and Abraham fixes on the absurdity — *"Blessed are the gods of thee, for thou art their god, since thou hast made them"* (Apocalypse of Abraham 4:4). This is the very scene Isaiah dissects, the craftsman who fells a tree, burns half for warmth, and bows to the rest: *"The smith with the tongs both worketh in the coals, and fashioneth it with hammers, and worketh it with the strength of his arms: yea, he is hungry, and his strength faileth: he drinketh no water, and is faint."* (Isaiah 44:12), until *"the residue thereof he maketh a god, even his graven image: he falleth down unto it, and worshippeth it, and prayeth unto it, and saith, Deliver me; for thou art my god."* (Isaiah 44:17). Jeremiah names the tools Terah used — silver, nails, hammers: *"They deck it with silver and with gold; they fasten it with nails and with hammers, that it move not."* (Jeremiah 10:4), the dumb thing that *"must needs be borne, because they cannot go."* (Jeremiah 10:5). The man bowing to what his own hands hammered is the system Abraham walks out of.',
       sv.verse_id, ev.verse_id, 'extras', 67078
  FROM _session253_aoa4_lookup sv, _session253_aoa4_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=4 AND sv.verse_number=2
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=4 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-4-fathers-served-other-gods',
       E'Your fathers served other gods — and Abraham was taken out',
       E'Abraham''s hard words against Terah''s gods — *"And when he heard my word, he became furiously angry with me, because I had spoken hard words against his gods."* (Apocalypse of Abraham 4:6) — stand at the seam of the whole story of election. Joshua tells Israel plainly where Abraham came from: *"Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods."* (Joshua 24:2), and then the call: *"And I took your father Abraham from the other side of the flood, and led him throughout all the land of Canaan, and multiplied his seed, and gave him Isaac."* (Joshua 24:3). Stephen preaches the same call out of the idol-house: *"And said unto him, Get thee out of thy country, and from thy kindred, and come into the land which I shall shew thee."* (Acts 7:3). It ain''t new — the man who rejects his father''s idols is the man Yahuah calls out of Ur, and the covenant begins not with a church replacing Israel but with the seed taken from among the nations and kept.',
       sv.verse_id, ev.verse_id, 'extras', 67081
  FROM _session253_aoa4_lookup sv, _session253_aoa4_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=4 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=4 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-4-gods-cannot-save
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 44:9 — *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* Isaiah''s verdict on the carved god is Abraham''s verdict on Terah''s wares — their power is vain (Apocalypse of Abraham 4:4).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa4_lookup sv, _session253_aoa4_lookup tv
 WHERE t.slug='apocalypse-of-abraham-4-gods-cannot-save'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 44:10 — *Who hath formed a god, or molten a graven image that is profitable for nothing?* The prophet''s mocking question echoes Abraham''s: the thing the maker formed cannot profit or save him (Apocalypse of Abraham 4:4).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa4_lookup sv, _session253_aoa4_lookup tv
 WHERE t.slug='apocalypse-of-abraham-4-gods-cannot-save'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 115:5 — *They have mouths, but they speak not: eyes have they, but they see not:* The idols that did not help themselves are the deaf, blind handiwork of Psalm 115 — they cannot help Terah (Apocalypse of Abraham 4:4).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa4_lookup sv, _session253_aoa4_lookup tv
 WHERE t.slug='apocalypse-of-abraham-4-gods-cannot-save'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 115:8 — *They that make them are like unto them; so is every one that trusteth in them.* Abraham''s barb that Terah is his gods'' god — *thou art their god, since thou hast made them* — is the Psalm''s warning that the maker shares the idol''s ruin (Apocalypse of Abraham 4:4).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa4_lookup sv, _session253_aoa4_lookup tv
 WHERE t.slug='apocalypse-of-abraham-4-gods-cannot-save'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-4-the-idol-maker
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 44:12 — *The smith with the tongs both worketh in the coals, and fashioneth it with hammers, and worketh it with the strength of his arms: yea, he is hungry, and his strength faileth: he drinketh no water, and is faint.* Terah''s boast that *my work was not in vain* is the labouring smith of Isaiah — sweat poured into a thing that cannot feed him (Apocalypse of Abraham 4:2).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa4_lookup sv, _session253_aoa4_lookup tv
 WHERE t.slug='apocalypse-of-abraham-4-the-idol-maker'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 44:17 — *And the residue thereof he maketh a god, even his graven image: he falleth down unto it, and worshippeth it, and prayeth unto it, and saith, Deliver me; for thou art my god.* The maker who calls his own handiwork god is exactly Abraham''s charge — *thou art their god, since thou hast made them* (Apocalypse of Abraham 4:4).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa4_lookup sv, _session253_aoa4_lookup tv
 WHERE t.slug='apocalypse-of-abraham-4-the-idol-maker'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=4 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 10:4 — *They deck it with silver and with gold; they fasten it with nails and with hammers, that it move not.* The silver Abraham carries for the broken gods is the silver-decked idol Jeremiah describes, nailed down so it cannot fall (Apocalypse of Abraham 4:5).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa4_lookup sv, _session253_aoa4_lookup tv
 WHERE t.slug='apocalypse-of-abraham-4-the-idol-maker'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 10:5 — *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good.* The broken gods Abraham brokered the money for cannot move or save — Jeremiah''s helpless, carried idol (Apocalypse of Abraham 4:5).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa4_lookup sv, _session253_aoa4_lookup tv
 WHERE t.slug='apocalypse-of-abraham-4-the-idol-maker'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-4-fathers-served-other-gods
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Joshua names Terah by name as an idolater — the very father whose gods Abraham rebukes (Apocalypse of Abraham 4:6).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa4_lookup sv, _session253_aoa4_lookup tv
 WHERE t.slug='apocalypse-of-abraham-4-fathers-served-other-gods'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 24:3 — *And I took your father Abraham from the other side of the flood, and led him throughout all the land of Canaan, and multiplied his seed, and gave him Isaac.* Abraham''s break with his father''s gods is the hinge on which Yahuah takes him out and multiplies the seed (Apocalypse of Abraham 4:6).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa4_lookup sv, _session253_aoa4_lookup tv
 WHERE t.slug='apocalypse-of-abraham-4-fathers-served-other-gods'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:3 — *And said unto him, Get thee out of thy country, and from thy kindred, and come into the land which I shall shew thee.* Stephen''s retelling of the call out of Ur frames Abraham''s rupture with Terah''s house as the start of the covenant (Apocalypse of Abraham 4:6).'
  FROM cross_reference_threads t, cross_references x, _session253_aoa4_lookup sv, _session253_aoa4_lookup tv
 WHERE t.slug='apocalypse-of-abraham-4-fathers-served-other-gods'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

