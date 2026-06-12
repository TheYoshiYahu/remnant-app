-- ----- fragment: minion_baruchwiththeletterofjeremiah_06.sql (session253 baruch-with-the-letter-of-jeremiah 6) -----
-- Source anchor: apocrypha/baruch-with-the-letter-of-jeremiah ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: bar6 (view _session253_bar6_lookup). Sort band base 60825, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_bar6_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: baruch-6-borne-cannot-walk
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 6, 26, 'canon', 'jeremiah', 10, 5, 'free', E'Jeremiah 10:5 — *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good.* The very source of the Epistle: the idol must be carried because it cannot walk, exactly as Baruch 6:26.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 6, 26, 'canon', 'isaiah', 46, 7, 'free', E'Isaiah 46:7 — *They bear him upon the shoulder, they carry him, and set him in his place, and he standeth; from his place shall he not remove: yea, one shall cry unto him, yet can he not answer, nor save him out of his trouble.* Isaiah''s Bel-and-Nebo taunt matches Baruch 6:26 word for word in scorn — the god borne and immovable.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 6, 27, 'canon', 'isaiah', 46, 4, 'free', E'Isaiah 46:4 — *and even to your old age I am he; and even to hoar hairs will I carry you: I have made, and I will bear; even I will carry, and will deliver you.* The living Elohim carries His people; the idol of Baruch 6:27 cannot even lift itself off the ground.'),
  -- thread: baruch-6-cannot-speak-see
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 6, 8, 'canon', 'psalms', 115, 5, 'free', E'Psalm 115:5 — *They have mouths, but they speak not: eyes have they, but they see not.* The Psalm''s idol-catalogue is the very charge of Baruch 6:8 — gilded tongues that cannot speak.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 6, 17, 'canon', 'psalms', 115, 8, 'free', E'Psalm 115:8 — *They that make them are like unto them; so is every one that trusteth in them.* The dust-blind eyes of Baruch 6:17 blind also the worshipper, who becomes as lifeless as the thing he trusts.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 6, 19, 'canon', 'habakkuk', 2, 19, 'free', E'Habakkuk 2:19 — *Woe unto him that saith to the wood, Awake; to the dumb stone, Arise, it shall teach! Behold, it is laid over with gold and silver, and there is no breath at all in the midst of it.* Candles before eyes that cannot see one (Baruch 6:19) is Habakkuk''s woe — wood and stone overlaid with metal, with no breath in it.'),
  -- thread: baruch-6-work-of-mens-hands
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 6, 45, 'canon', 'isaiah', 44, 17, 'free', E'Isaiah 44:17 — *And the residue thereof he maketh a god, even his graven image: he falleth down unto it, and worshippeth it, and prayeth unto it, and saith, Deliver me; for thou art my god.* Isaiah''s residue-god is Baruch 6:45''s carpenter-made thing — it can be nothing but what the workman wills.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 6, 51, 'canon', 'deuteronomy', 4, 28, 'free', E'Deuteronomy 4:28 — *And there ye shall serve gods, the work of men''s hands, wood and stone, which neither see, nor hear, nor eat, nor smell.* Moses named the work-of-men''s-hands curse of exile that Baruch 6:51 watches play out among the Babylonian gods.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 6, 51, 'canon', '1-corinthians', 8, 4, 'free', E'1 Corinthians 8:4 — *As concerning therefore the eating of those things that are offered in sacrifice unto idols, we know that an idol is nothing in the world, and that there is none other Elohim (God) but one.* Paul speaks the same verdict as Baruch 6:51 — no work of Yahuah is in them; the idol is nothing, and Elohim is one.'),
  -- thread: baruch-6-cannot-save
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 6, 36, 'canon', 'jeremiah', 10, 10, 'free', E'Jeremiah 10:10 — *But Yahuah (LORD) is the true Elohim (God), he is the living Elohim (God), and an everlasting king: at his wrath the earth shall tremble, and the nations shall not be able to abide his indignation.* The living Elohim of Jeremiah saves and judges where the idol of Baruch 6:36 can deliver no one from death.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 6, 36, 'canon', 'isaiah', 44, 6, 'free', E'Isaiah 44:6 — *Thus saith Yahuah (LORD) the King of Yashar''el (Israel), and his redeemer Yahuah Tseva''ot (LORD of hosts); I am the first, and I am the last; and beside me there is no Elohim (God).* The redeemer who is first and last is the answer to Baruch 6:36 — beside Him there is no god to save.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 6, 38, 'canon', 'psalms', 115, 9, 'free', E'Psalm 115:9 — *O Yashar''el (Israel), trust thou in Yahuah (LORD): he is their help and their shield.* The idol shows no mercy to widow or fatherless (Baruch 6:38); Yahuah alone is the help and shield Israel is to trust.'),
  -- thread: baruch-6-bel-chaldeans-dishonour
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 6, 41, 'apocrypha', 'bel-and-the-dragon', 1, 5, 'extras', E'Bel and the Dragon 1:5 — *Because I may not worship idols made with hands, but the living Yahuah (God), who has created the heaven and the earth, and has sovereignty over all flesh.* Daniel''s confession before the very Bel that Baruch 6:41 says the Babylonians intreat — the living Creator against the dumb idol.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 6, 41, 'canon', 'isaiah', 46, 1, 'free', E'Isaiah 46:1 — *Bel boweth down, Nebo stoopeth, their idols were upon the beasts, and upon the cattle: your carriages were heavy loaden; they are a burden to the weary beast.* Isaiah names Bel''s collapse; Baruch 6:41 shows the same Bel intreated in vain to make a dumb man speak.'),
  ('apocrypha', 'baruch-with-the-letter-of-jeremiah', 6, 40, 'canon', 'romans', 1, 23, 'free', E'Romans 1:23 — *And changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things.* Paul names the exchange that Baruch 6:40 marvels at — even the Chaldeans dishonour the images they have set in Elohim''s place.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_bar6_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_bar6_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-6-borne-cannot-walk',
       E'Borne on shoulders, having no feet',
       E'The Epistle of Jeremy strips the idol of its last pretence — it cannot even stand: *They are borne upon shoulders, having no feet by which they declare to men that they be nothing worth* (Baruch 6:26), and *They also that serve them are ashamed: for if they fall to the ground at any time, they cannot rise up again of themselves: neither, if one set them upright, can they move of themselves* (Baruch 6:27). It ain''t new: Jeremiah said the same of the carved tree — *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good* (Jeremiah 10:5). Isaiah mocks Bel and Nebo loaded on the cattle — *They bear him upon the shoulder, they carry him, and set him in his place, and he standeth; from his place shall he not remove: yea, one shall cry unto him, yet can he not answer, nor save him out of his trouble* (Isaiah 46:7) — and over against the dead god sets the living Elohim who carries Israel: *and even to your old age I am he; and even to hoar hairs will I carry you: I have made, and I will bear; even I will carry, and will deliver you* (Isaiah 46:4). The whole contrast of the chapter: the idol must be carried; Yahuah carries His people.',
       sv.verse_id, ev.verse_id, 'extras', 60825
  FROM _session253_bar6_lookup sv, _session253_bar6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=26
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=6 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-6-cannot-speak-see',
       E'False, and cannot speak',
       E'The mouths are gilded but mute: *As for their tongue, it is polished by the workman, and they themselves are gilded and laid over with silver; yet are they but false, and cannot speak* (Baruch 6:8); their eyes fill with dust — *when they be set up in the temple, their eyes be full of dust through the feet of them that come in* (Baruch 6:17); and the worshippers light them candles *of which they cannot see one* (Baruch 6:19). This is the Psalmist''s catalogue verbatim in spirit: *They have mouths, but they speak not: eyes have they, but they see not* (Psalm 115:5), with the verdict that the maker becomes as the made — *They that make them are like unto them; so is every one that trusteth in them* (Psalm 115:8). Habakkuk closes the case: *Woe unto him that saith to the wood, Awake; to the dumb stone, Arise, it shall teach! Behold, it is laid over with gold and silver, and there is no breath at all in the midst of it* (Habakkuk 2:19). Dead gods of silver and gold against the One who is in His holy temple.',
       sv.verse_id, ev.verse_id, 'extras', 60828
  FROM _session253_bar6_lookup sv, _session253_bar6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=6 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-6-work-of-mens-hands',
       E'The works of men''s hands, no gods',
       E'The refrain returns again and again — *fear them not* — because the thing has a maker: *They are made of carpenters and goldsmiths: they can be nothing else than the workmen will have them to be* (Baruch 6:45), and the proof at last shall *manifestly appear to all nations and kings that they are no gods, but the works of men''s hands, and that there is no work of Yahuah (God) in them* (Baruch 6:51). This is Isaiah''s residue-god, half burned for fuel and half worshipped — *And the residue thereof he maketh a god, even his graven image: he falleth down unto it, and worshippeth it, and prayeth unto it, and saith, Deliver me; for thou art my god* (Isaiah 44:17). Moses foresaw it as the curse of exile — *And there ye shall serve gods, the work of men''s hands, wood and stone, which neither see, nor hear, nor eat, nor smell* (Deuteronomy 4:28) — the very scattering into Babylon that frames the whole Epistle (Baruch 6:2). And Paul gathers the witness: the idol is nothing, *we know that an idol is nothing in the world, and that there is none other Elohim (God) but one* (1 Corinthians 8:4). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 60831
  FROM _session253_bar6_lookup sv, _session253_bar6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=45
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=6 AND ev.verse_number=51
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-6-cannot-save',
       E'They can save no man from death',
       E'The heart of the polemic: the dead god is useless precisely where help is needed — *They can save no man from death, neither deliver the weak from the mighty* (Baruch 6:36), *They cannot restore a blind man to his sight, nor help any man in his distress* (Baruch 6:37), *They can shew no mercy to the widow, nor do good to the fatherless* (Baruch 6:38). Over against this stands Yahuah alone the King of nations — *But Yahuah (LORD) is the true Elohim (God), he is the living Elohim (God), and an everlasting king: at his wrath the earth shall tremble, and the nations shall not be able to abide his indignation* (Jeremiah 10:10) — and the redeemer who is first and last beside whom there is no Elohim — *Thus saith Yahuah (LORD) the King of Yashar''el (Israel), and his redeemer Yahuah Tseva''ot (LORD of hosts); I am the first, and I am the last; and beside me there is no Elohim (God)* (Isaiah 44:6). The idol cannot save; only the living Elohim saves.',
       sv.verse_id, ev.verse_id, 'extras', 60834
  FROM _session253_bar6_lookup sv, _session253_bar6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=36
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=6 AND ev.verse_number=38
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'baruch-6-bel-chaldeans-dishonour',
       E'Even the Chaldeans dishonour them; intreat Bel',
       E'The Epistle turns the heathen''s own conduct into testimony — *How should a man then think and say that they are gods, when even the Chaldeans themselves dishonour them?* (Baruch 6:40) — and pictures them bringing a dumb man to *intreat Bel that he may speak, as though he were able to understand* (Baruch 6:41). The name Bel is no abstraction in this library: Daniel faced that very idol — *Now the Babylons had an idol, called Bel, and there were spent upon him every day twelve great measures of fine flour, and forty sheep, and six vessels of wine* (Bel and the Dragon 1:3) — and gave the Epistle''s own confession: *Because I may not worship idols made with hands, but the living Yahuah (God), who has created the heaven and the earth, and has sovereignty over all flesh* (Bel and the Dragon 1:5). Isaiah had already prophesied Bel''s fall: *Bel boweth down, Nebo stoopeth, their idols were upon the beasts, and upon the cattle: your carriages were heavy loaden; they are a burden to the weary beast* (Isaiah 46:1). And Paul names the root sin: men *changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man* (Romans 1:23).',
       sv.verse_id, ev.verse_id, 'extras', 60837
  FROM _session253_bar6_lookup sv, _session253_bar6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=40
   AND ev.edition_slug='apocrypha' AND ev.book_slug='baruch-with-the-letter-of-jeremiah' AND ev.chapter_number=6 AND ev.verse_number=41
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: baruch-6-borne-cannot-walk
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 10:5 — *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good.* The very source of the Epistle: the idol must be carried because it cannot walk, exactly as Baruch 6:26.'
  FROM cross_reference_threads t, cross_references x, _session253_bar6_lookup sv, _session253_bar6_lookup tv
 WHERE t.slug='baruch-6-borne-cannot-walk'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 46:7 — *They bear him upon the shoulder, they carry him, and set him in his place, and he standeth; from his place shall he not remove: yea, one shall cry unto him, yet can he not answer, nor save him out of his trouble.* Isaiah''s Bel-and-Nebo taunt matches Baruch 6:26 word for word in scorn — the god borne and immovable.'
  FROM cross_reference_threads t, cross_references x, _session253_bar6_lookup sv, _session253_bar6_lookup tv
 WHERE t.slug='baruch-6-borne-cannot-walk'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=46 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 46:4 — *and even to your old age I am he; and even to hoar hairs will I carry you: I have made, and I will bear; even I will carry, and will deliver you.* The living Elohim carries His people; the idol of Baruch 6:27 cannot even lift itself off the ground.'
  FROM cross_reference_threads t, cross_references x, _session253_bar6_lookup sv, _session253_bar6_lookup tv
 WHERE t.slug='baruch-6-borne-cannot-walk'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=46 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-6-cannot-speak-see
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 115:5 — *They have mouths, but they speak not: eyes have they, but they see not.* The Psalm''s idol-catalogue is the very charge of Baruch 6:8 — gilded tongues that cannot speak.'
  FROM cross_reference_threads t, cross_references x, _session253_bar6_lookup sv, _session253_bar6_lookup tv
 WHERE t.slug='baruch-6-cannot-speak-see'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 115:8 — *They that make them are like unto them; so is every one that trusteth in them.* The dust-blind eyes of Baruch 6:17 blind also the worshipper, who becomes as lifeless as the thing he trusts.'
  FROM cross_reference_threads t, cross_references x, _session253_bar6_lookup sv, _session253_bar6_lookup tv
 WHERE t.slug='baruch-6-cannot-speak-see'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Habakkuk 2:19 — *Woe unto him that saith to the wood, Awake; to the dumb stone, Arise, it shall teach! Behold, it is laid over with gold and silver, and there is no breath at all in the midst of it.* Candles before eyes that cannot see one (Baruch 6:19) is Habakkuk''s woe — wood and stone overlaid with metal, with no breath in it.'
  FROM cross_reference_threads t, cross_references x, _session253_bar6_lookup sv, _session253_bar6_lookup tv
 WHERE t.slug='baruch-6-cannot-speak-see'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-6-work-of-mens-hands
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 44:17 — *And the residue thereof he maketh a god, even his graven image: he falleth down unto it, and worshippeth it, and prayeth unto it, and saith, Deliver me; for thou art my god.* Isaiah''s residue-god is Baruch 6:45''s carpenter-made thing — it can be nothing but what the workman wills.'
  FROM cross_reference_threads t, cross_references x, _session253_bar6_lookup sv, _session253_bar6_lookup tv
 WHERE t.slug='baruch-6-work-of-mens-hands'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 4:28 — *And there ye shall serve gods, the work of men''s hands, wood and stone, which neither see, nor hear, nor eat, nor smell.* Moses named the work-of-men''s-hands curse of exile that Baruch 6:51 watches play out among the Babylonian gods.'
  FROM cross_reference_threads t, cross_references x, _session253_bar6_lookup sv, _session253_bar6_lookup tv
 WHERE t.slug='baruch-6-work-of-mens-hands'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 8:4 — *As concerning therefore the eating of those things that are offered in sacrifice unto idols, we know that an idol is nothing in the world, and that there is none other Elohim (God) but one.* Paul speaks the same verdict as Baruch 6:51 — no work of Yahuah is in them; the idol is nothing, and Elohim is one.'
  FROM cross_reference_threads t, cross_references x, _session253_bar6_lookup sv, _session253_bar6_lookup tv
 WHERE t.slug='baruch-6-work-of-mens-hands'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=8 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-6-cannot-save
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 10:10 — *But Yahuah (LORD) is the true Elohim (God), he is the living Elohim (God), and an everlasting king: at his wrath the earth shall tremble, and the nations shall not be able to abide his indignation.* The living Elohim of Jeremiah saves and judges where the idol of Baruch 6:36 can deliver no one from death.'
  FROM cross_reference_threads t, cross_references x, _session253_bar6_lookup sv, _session253_bar6_lookup tv
 WHERE t.slug='baruch-6-cannot-save'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 44:6 — *Thus saith Yahuah (LORD) the King of Yashar''el (Israel), and his redeemer Yahuah Tseva''ot (LORD of hosts); I am the first, and I am the last; and beside me there is no Elohim (God).* The redeemer who is first and last is the answer to Baruch 6:36 — beside Him there is no god to save.'
  FROM cross_reference_threads t, cross_references x, _session253_bar6_lookup sv, _session253_bar6_lookup tv
 WHERE t.slug='baruch-6-cannot-save'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 115:9 — *O Yashar''el (Israel), trust thou in Yahuah (LORD): he is their help and their shield.* The idol shows no mercy to widow or fatherless (Baruch 6:38); Yahuah alone is the help and shield Israel is to trust.'
  FROM cross_reference_threads t, cross_references x, _session253_bar6_lookup sv, _session253_bar6_lookup tv
 WHERE t.slug='baruch-6-cannot-save'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: baruch-6-bel-chaldeans-dishonour
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Bel and the Dragon 1:5 — *Because I may not worship idols made with hands, but the living Yahuah (God), who has created the heaven and the earth, and has sovereignty over all flesh.* Daniel''s confession before the very Bel that Baruch 6:41 says the Babylonians intreat — the living Creator against the dumb idol.'
  FROM cross_reference_threads t, cross_references x, _session253_bar6_lookup sv, _session253_bar6_lookup tv
 WHERE t.slug='baruch-6-bel-chaldeans-dishonour'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=41
   AND tv.edition_slug='apocrypha' AND tv.book_slug='bel-and-the-dragon' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 46:1 — *Bel boweth down, Nebo stoopeth, their idols were upon the beasts, and upon the cattle: your carriages were heavy loaden; they are a burden to the weary beast.* Isaiah names Bel''s collapse; Baruch 6:41 shows the same Bel intreated in vain to make a dumb man speak.'
  FROM cross_reference_threads t, cross_references x, _session253_bar6_lookup sv, _session253_bar6_lookup tv
 WHERE t.slug='baruch-6-bel-chaldeans-dishonour'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=46 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 1:23 — *And changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things.* Paul names the exchange that Baruch 6:40 marvels at — even the Chaldeans dishonour the images they have set in Elohim''s place.'
  FROM cross_reference_threads t, cross_references x, _session253_bar6_lookup sv, _session253_bar6_lookup tv
 WHERE t.slug='baruch-6-bel-chaldeans-dishonour'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='baruch-with-the-letter-of-jeremiah' AND sv.chapter_number=6 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

