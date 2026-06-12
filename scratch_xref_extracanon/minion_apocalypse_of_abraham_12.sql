-- ----- fragment: minion_apocalypseofabraham_12.sql (session253 apocalypse-of-abraham 12) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch12. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa12 (view _session253_aoa12_lookup). Sort band base 67275, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-12-forty-days-no-bread
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 12, 1, 'canon', 'exodus', 34, 28, 'free', E'Exodus 34:28 — *And he was there with Yahuah (LORD) forty days and forty nights; he did neither eat bread, nor drink water. And he wrote upon the tables the words of the covenant, the ten commandments.* Abraham''s forty-day fast without bread or water on Horeb is the same mountain-fast Moses kept before the covenant was written.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 12, 1, 'canon', 'deuteronomy', 9, 9, 'free', E'Deuteronomy 9:9 — *When I was gone up into the mount to receive the tables of stone, even the tables of the covenant which Yahuah (LORD) made with you, then I abode in the mount forty days and forty nights, I neither did eat bread nor drink water:* the identical phrasing of Abraham''s abstinence marks his ascent as a covenant-mountain ordeal like Moses'' own.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 12, 1, 'enoch', '1-enoch', 14, 2, 'extras', E'1 Enoch 14:2 — *Enoch also saw the vision, the ends of all things, and all things did he see, even to the ends of the earth, and no one spoke a word to him.* As Enoch was carried in silent vision to the ends of all things, so Abraham is fed only by the angel''s speech, sustained by the sight he is about to be given.'),
  -- thread: apocalypse-of-abraham-12-mount-of-elohim-horeb
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 12, 2, 'canon', 'exodus', 3, 1, 'free', E'Exodus 3:1 — *Now Moses kept the flock of Jethro his father in law, the priest of Midian: and he led the flock to the backside of the desert, and came to the mountain of Elohim (God), even to Horeb.* Abraham is brought to the very Horeb, the Mount of Elohim, where Moses will later stand before the fire of the bush.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 12, 8, 'canon', 'exodus', 3, 4, 'free', E'Exodus 3:4 — *And when Yahuah (LORD) saw that he turned aside to see, Elohim (God) called unto him out of the midst of the bush, and said, Moses, Moses. And he said, Here am I.* Abraham''s reply ''Here am I'' to the angel''s call is the ready answer of the servant, echoing Moses at the bush on this same mountain.'),
  -- thread: apocalypse-of-abraham-12-covenant-sacrifice
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 12, 6, 'canon', 'genesis', 15, 9, 'free', E'Genesis 15:9 — *And he said unto him, Take me an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon.* The five animals the angel shows Abraham are precisely the five Yahuah named for the covenant cutting between the pieces.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 12, 9, 'canon', 'genesis', 15, 10, 'free', E'Genesis 15:10 — *And he took unto him all these, and divided them in the midst, and laid each piece one against another: but the birds divided he not.* The command to halve the beasts one against the other yet leave the birds unsevered is the very rite of Genesis 15 reenacted on Horeb.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 12, 9, 'canon', 'romans', 4, 18, 'free', E'Romans 4:18 — *Who against hope believed in hope, that he might become the father of many nations; according to that which was spoken, So shall thy seed be.* The sacrifice Abraham prepares seals the promise of the seed as the stars, the faith Paul holds up as the father''s righteousness.'),
  -- thread: apocalypse-of-abraham-12-yahoel-name-bearing-angel
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 12, 1, 'canon', 'exodus', 23, 20, 'free', E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* The angel who leads Abraham up the mountain to the place prepared for the vision is the same sent Angel who goes before to keep the way.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 12, 3, 'canon', 'exodus', 23, 21, 'free', E'Exodus 23:21 — *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him.* Yahoel, whom Abraham obeys in every word and calls Singer of the Eternal One, is the messenger in whom the Name dwells — his name itself bearing YAH.'),
  -- thread: apocalypse-of-abraham-12-ascent-chariot-cosmic-vision
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 12, 9, 'enoch', '1-enoch', 14, 3, 'extras', E'1 Enoch 14:3 — *And I Enoch was carried off in a whirlwind, with a chariot of fire, and the wind lifted me up and bore me into the ends of heaven.* As Enoch was borne up by the fiery chariot to the ends of heaven, so the angel will bear Abraham up on the wings of the bird to be shown heaven and earth.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 12, 9, 'canon', 'ezekiel', 1, 4, 'free', E'Ezekiel 1:4 — *And I looked, and, behold, a whirlwind came out of the north, a great cloud, and a fire infolding itself, and a brightness was about it, and out of the midst thereof as the colour of amber, out of the midst of the fire.* The heaven into which Abraham is to ascend is the merkabah-fire Ezekiel saw, the throne-chariot of the living Elohim.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 12, 9, 'canon', 'genesis', 1, 1, 'free', E'Genesis 1:1 — *In the beginning Elohim (God) created the heaven and the earth.* The fulness of the whole world Abraham is promised to gaze upon — heaven, earth, sea, abyss, and the Garden — is the entire creation Moses opens with in the beginning.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-12-forty-days-no-bread',
       E'Forty days, no bread, no water — the fast of the mountain',
       E'Abraham journeys to the holy mount as Moses fasted before the LORD: *And we went, the two of us together, forty days and nights, and I ate no bread, and drank no water, because my food was to see the angel who was with me, and his speech — that was my drink* (Apocalypse of Abraham 12:1). It ain''t new — this is the very measure of the mountain-fast: *And he was there with Yahuah (LORD) forty days and forty nights; he did neither eat bread, nor drink water* (Exodus 34:28), and again *then I abode in the mount forty days and forty nights, I neither did eat bread nor drink water* (Deuteronomy 9:9). And the seer borne up to behold all things — *Enoch also saw the vision, the ends of all things, and all things did he see, even to the ends of the earth, and no one spoke a word to him* (1 Enoch 14:2). The friend of Elohim is fed not by bread but by the word of the messenger.',
       sv.verse_id, ev.verse_id, 'extras', 67275
  FROM _session253_aoa12_lookup sv, _session253_aoa12_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=12 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-12-mount-of-elohim-horeb',
       E'The Mount of Elohim, the glorious Horeb — ''Here am I''',
       E'They arrive where Moses would later meet the fire: *And we came to the Mount of Elohim (God), the glorious Horeb* (Apocalypse of Abraham 12:2); and when the angel calls *''Abraham!''* (12:7) he answers *''Here am I''* (12:8). It ain''t new — the mountain is named already: *and he led the flock to the backside of the desert, and came to the mountain of Elohim (God), even to Horeb* (Exodus 3:1); and the call-and-answer is the burning-bush exchange — *Elohim (God) called unto him out of the midst of the bush, and said, Moses, Moses. And he said, Here am I* (Exodus 3:4). The same holy ground, the same summons, the same ready word of the called-out servant.',
       sv.verse_id, ev.verse_id, 'extras', 67278
  FROM _session253_aoa12_lookup sv, _session253_aoa12_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=2
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=12 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-12-covenant-sacrifice',
       E'The covenant sacrifice — heifer, she-goat, ram, turtledove, pigeon',
       E'The angel shows the very animals of the covenant cut: *there were following us all the prescribed sacrificial animals — the young heifer, and the she-goat, and the ram, and the turtle-dove, and the pigeon* (Apocalypse of Abraham 12:6), and commands *All these slaughter, and divide the animals into halves, one against the other, but the birds do not sever* (12:9). It ain''t new — this is Genesis 15 itself: *Take me an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon* (Genesis 15:9), *and divided them in the midst, and laid each piece one against another: but the birds divided he not* (Genesis 15:10). And the seed that this cutting seals is the stars of heaven — *according to that which was spoken, So shall thy seed be* (Romans 4:18). The Apocalypse opens out the same covenant scene Moses recorded.',
       sv.verse_id, ev.verse_id, 'extras', 67281
  FROM _session253_aoa12_lookup sv, _session253_aoa12_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=12 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-12-yahoel-name-bearing-angel',
       E'Yahoel — the angel who is fed upon, in whom is the Name',
       E'Abraham''s food and drink is the angel and his speech (12:1), and he names him *''Singer of the Eternal One!''* (12:3) and obeys his every word. It ain''t new — this is the Name-bearing messenger of the Exodus: *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared* (Exodus 23:20), of whom it is said *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him* (Exodus 23:21). Yahoel — the angel whose very name carries YAH — is that same messenger in whom the Name dwells, to be heeded and not provoked; not a rival god, but the bearer of the One Name.',
       sv.verse_id, ev.verse_id, 'extras', 67284
  FROM _session253_aoa12_lookup sv, _session253_aoa12_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=12 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-12-ascent-chariot-cosmic-vision',
       E'Borne up on the wings — heaven, earth, abyss, the whole world shown',
       E'The angel takes the turtledove and pigeon for himself: *I will ascend upon the wings of the bird, in order to shew thee in heaven, and on the earth, and in the sea, and in the abyss, and in the under-world, and in the Garden of Eden, and in its rivers and in the fulness of the whole world and its circle — thou shalt gaze in them all* (Apocalypse of Abraham 12:9). It ain''t new — the righteous are carried up in fire to behold all things: *And I Enoch was carried off in a whirlwind, with a chariot of fire, and the wind lifted me up and bore me into the ends of heaven* (1 Enoch 14:3). The opened heaven is the merkabah-fire — *a whirlwind came out of the north, a great cloud, and a fire infolding itself, and a brightness was about it, and out of the midst thereof as the colour of amber* (Ezekiel 1:4) — and what Abraham will gaze upon is the whole creation, from the beginning: *In the beginning Elohim (God) created the heaven and the earth* (Genesis 1:1).',
       sv.verse_id, ev.verse_id, 'extras', 67287
  FROM _session253_aoa12_lookup sv, _session253_aoa12_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=9
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=12 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-12-forty-days-no-bread
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 34:28 — *And he was there with Yahuah (LORD) forty days and forty nights; he did neither eat bread, nor drink water. And he wrote upon the tables the words of the covenant, the ten commandments.* Abraham''s forty-day fast without bread or water on Horeb is the same mountain-fast Moses kept before the covenant was written.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa12_lookup sv, _session253_aoa12_lookup tv
 WHERE t.slug='apocalypse-of-abraham-12-forty-days-no-bread'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 9:9 — *When I was gone up into the mount to receive the tables of stone, even the tables of the covenant which Yahuah (LORD) made with you, then I abode in the mount forty days and forty nights, I neither did eat bread nor drink water:* the identical phrasing of Abraham''s abstinence marks his ascent as a covenant-mountain ordeal like Moses'' own.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa12_lookup sv, _session253_aoa12_lookup tv
 WHERE t.slug='apocalypse-of-abraham-12-forty-days-no-bread'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=9 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 14:2 — *Enoch also saw the vision, the ends of all things, and all things did he see, even to the ends of the earth, and no one spoke a word to him.* As Enoch was carried in silent vision to the ends of all things, so Abraham is fed only by the angel''s speech, sustained by the sight he is about to be given.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa12_lookup sv, _session253_aoa12_lookup tv
 WHERE t.slug='apocalypse-of-abraham-12-forty-days-no-bread'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=14 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-12-mount-of-elohim-horeb
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 3:1 — *Now Moses kept the flock of Jethro his father in law, the priest of Midian: and he led the flock to the backside of the desert, and came to the mountain of Elohim (God), even to Horeb.* Abraham is brought to the very Horeb, the Mount of Elohim, where Moses will later stand before the fire of the bush.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa12_lookup sv, _session253_aoa12_lookup tv
 WHERE t.slug='apocalypse-of-abraham-12-mount-of-elohim-horeb'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 3:4 — *And when Yahuah (LORD) saw that he turned aside to see, Elohim (God) called unto him out of the midst of the bush, and said, Moses, Moses. And he said, Here am I.* Abraham''s reply ''Here am I'' to the angel''s call is the ready answer of the servant, echoing Moses at the bush on this same mountain.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa12_lookup sv, _session253_aoa12_lookup tv
 WHERE t.slug='apocalypse-of-abraham-12-mount-of-elohim-horeb'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-12-covenant-sacrifice
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:9 — *And he said unto him, Take me an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon.* The five animals the angel shows Abraham are precisely the five Yahuah named for the covenant cutting between the pieces.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa12_lookup sv, _session253_aoa12_lookup tv
 WHERE t.slug='apocalypse-of-abraham-12-covenant-sacrifice'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:10 — *And he took unto him all these, and divided them in the midst, and laid each piece one against another: but the birds divided he not.* The command to halve the beasts one against the other yet leave the birds unsevered is the very rite of Genesis 15 reenacted on Horeb.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa12_lookup sv, _session253_aoa12_lookup tv
 WHERE t.slug='apocalypse-of-abraham-12-covenant-sacrifice'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 4:18 — *Who against hope believed in hope, that he might become the father of many nations; according to that which was spoken, So shall thy seed be.* The sacrifice Abraham prepares seals the promise of the seed as the stars, the faith Paul holds up as the father''s righteousness.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa12_lookup sv, _session253_aoa12_lookup tv
 WHERE t.slug='apocalypse-of-abraham-12-covenant-sacrifice'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-12-yahoel-name-bearing-angel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* The angel who leads Abraham up the mountain to the place prepared for the vision is the same sent Angel who goes before to keep the way.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa12_lookup sv, _session253_aoa12_lookup tv
 WHERE t.slug='apocalypse-of-abraham-12-yahoel-name-bearing-angel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 23:21 — *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him.* Yahoel, whom Abraham obeys in every word and calls Singer of the Eternal One, is the messenger in whom the Name dwells — his name itself bearing YAH.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa12_lookup sv, _session253_aoa12_lookup tv
 WHERE t.slug='apocalypse-of-abraham-12-yahoel-name-bearing-angel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-12-ascent-chariot-cosmic-vision
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 14:3 — *And I Enoch was carried off in a whirlwind, with a chariot of fire, and the wind lifted me up and bore me into the ends of heaven.* As Enoch was borne up by the fiery chariot to the ends of heaven, so the angel will bear Abraham up on the wings of the bird to be shown heaven and earth.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa12_lookup sv, _session253_aoa12_lookup tv
 WHERE t.slug='apocalypse-of-abraham-12-ascent-chariot-cosmic-vision'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=14 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 1:4 — *And I looked, and, behold, a whirlwind came out of the north, a great cloud, and a fire infolding itself, and a brightness was about it, and out of the midst thereof as the colour of amber, out of the midst of the fire.* The heaven into which Abraham is to ascend is the merkabah-fire Ezekiel saw, the throne-chariot of the living Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa12_lookup sv, _session253_aoa12_lookup tv
 WHERE t.slug='apocalypse-of-abraham-12-ascent-chariot-cosmic-vision'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 1:1 — *In the beginning Elohim (God) created the heaven and the earth.* The fulness of the whole world Abraham is promised to gaze upon — heaven, earth, sea, abyss, and the Garden — is the entire creation Moses opens with in the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa12_lookup sv, _session253_aoa12_lookup tv
 WHERE t.slug='apocalypse-of-abraham-12-ascent-chariot-cosmic-vision'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

