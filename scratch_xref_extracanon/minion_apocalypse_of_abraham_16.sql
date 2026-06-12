-- ----- fragment: minion_apocalypseofabraham_16.sql (session253 apocalypse-of-abraham 16) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch16. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa16 (view _session253_aoa16_lookup). Sort band base 67375, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-16-himself-thou-canst-not-see
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 16, 3, 'canon', 'exodus', 33, 20, 'free', E'Exodus 33:20 — *And he said, Thou canst not see my face: for there shall no man see me, and live.* The same boundary set for Moses is set for Abraham in 16:3 — the Eternal One draws near and loves, yet His face cannot be seen by mortal eyes.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 16, 3, 'canon', 'deuteronomy', 4, 12, 'free', E'Deuteronomy 4:12 — *And Yahuah (LORD) spake unto you out of the midst of the fire: ye heard the voice of the words, but saw no similitude; only ye heard a voice.* Israel at Horeb heard the voice and saw no form, just as Abraham hears the ''great voice of holiness'' in 16:3 while Himself he cannot see.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 16, 3, 'canon', '1-timothy', 6, 16, 'free', E'1 Timothy 6:16 — *Who only hath immortality, dwelling in the light which no man can approach unto; whom no man hath seen, nor can see: to whom be honour and power everlasting. Amen.* Paul states as doctrine what Abraham learns by experience in 16:3 — the Eternal One who loves him dwells in unapproachable light and cannot be seen.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 16, 3, 'canon', 'john', 1, 18, 'free', E'John 1:18 — *No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him.* The unseen God of 16:3 is made known through a mediator — the same office the Name-bearing angel fills for Abraham as he is brought near.'),
  -- thread: apocalypse-of-abraham-16-fear-not-i-am-with-thee
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 16, 4, 'canon', 'isaiah', 41, 10, 'free', E'Isaiah 41:10 — *Fear thou not; for I am with thee: be not dismayed; for I am thy Elohim (God): I will strengthen thee; yea, I will help thee; yea, I will uphold thee with the right hand of my righteousness.* The angel''s exact words to Abraham in 16:4 — ''fear not... I am with thee, strengthening thee'' — are the LORD''s own covenant promise to Abraham''s seed.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 16, 2, 'canon', 'genesis', 15, 1, 'free', E'Genesis 15:1 — *After these things the word of Yahuah (the LORD) came unto Abram in a vision, saying, Fear not, Abram: I am thy shield, and thy exceeding great reward.* The ''fear not'' that opens Abraham''s covenant vision is the same word the angel speaks over him in 16:2 as he is brought up to the throne.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 16, 4, 'canon', 'revelation', 1, 17, 'free', E'Revelation 1:17 — *And when I saw him, I fell at his feet as dead. And he laid his right hand upon me, saying unto me, Fear not; I am the first and the last.* As Abraham grows faint before the loud crying in 16:4, John too is overcome and steadied by the same ''fear not'' — the seer''s response to the throne is always one word.'),
  -- thread: apocalypse-of-abraham-16-the-name-bearing-angel
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 16, 2, 'canon', 'exodus', 23, 20, 'free', E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* The angel who steadies Abraham and brings him up in 16:2 is the same Name-bearing Angel sent to lead the covenant seed.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 16, 3, 'canon', 'exodus', 23, 21, 'free', E'Exodus 23:21 — *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him.* The angel beside Abraham in 16:2-3, who points to the Eternal One yet bears His authority, is Yahoel — the angel in whom the Name dwells.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 16, 3, 'canon', 'isaiah', 6, 3, 'free', E'Isaiah 6:3 — *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory.* The ''great voice of holiness'' coming straight toward Abraham in 16:3 is the seraphim''s cry before the throne the angel leads him to.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 16, 2, 'enoch', '1-enoch', 10, 8, 'extras', E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azazel: to him ascribe all sin.* The fallen Watcher rebuked in Abraham''s ascent is this same Azazel; in 16:2 it is the Name-bearing angel, not the corrupter, who keeps the elect near.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-16-himself-thou-canst-not-see',
       E'The Eternal One whom thou canst not see',
       E'*And He whom thou seest come straight towards us with great voice of holiness — that is the Eternal One who loveth thee; but Himself thou canst not see* (Apocalypse of Abraham 16:3). The angel does not hide the LORD from Abraham out of cruelty but out of the very nature of the Holy One: He comes near, He loves, yet His face is veiled to mortal eyes. It ain''t new — this is the same word the LORD spoke to Moses on the mount: *And he said, Thou canst not see my face: for there shall no man see me, and live* (Exodus 33:20). At Horeb the people heard the voice and saw nothing: *And Yahuah (LORD) spake unto you out of the midst of the fire: ye heard the voice of the words, but saw no similitude; only ye heard a voice* (Deuteronomy 4:12) — exactly Abraham''s ''great voice of holiness'' without a form. Paul names the same mystery: the Eternal One *only hath immortality, dwelling in the light which no man can approach unto; whom no man hath seen, nor can see* (1 Timothy 6:16). And John tells how the unseen God is made known: *No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him* (John 1:18) — the same pattern by which the angel Yahoel, bearing the Name, brings Abraham near to the One he cannot look upon.',
       sv.verse_id, ev.verse_id, 'extras', 67375
  FROM _session253_aoa16_lookup sv, _session253_aoa16_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=16 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=16 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-16-fear-not-i-am-with-thee',
       E'Fear not; I am with thee, strengthening thee',
       E'Trembling and faint, Abraham is steadied by the angel: *Remain by me; fear not* (Apocalypse of Abraham 16:2), and again *let not thy spirit grow faint on account of the loud crying, for I am with thee, strengthening thee* (Apocalypse of Abraham 16:4). It ain''t new — this is the LORD''s own covenant word to the seed of Abraham: *Fear thou not; for I am with thee: be not dismayed; for I am thy Elohim (God): I will strengthen thee; yea, I will help thee; yea, I will uphold thee with the right hand of my righteousness* (Isaiah 41:10). It is the word that falls on every man overcome by the glory: *And when I saw him, I fell at his feet as dead. And he laid his right hand upon me, saying unto me, Fear not; I am the first and the last* (Revelation 1:17). The same ''fear not'' was the first word over Abraham''s covenant vision from the beginning: in the like scene the LORD says *After these things the word of Yahuah (LORD) came unto Abram in a vision, saying, Fear not, Abram: I am thy shield, and thy exceeding great reward* (Genesis 15:1). The angel who strengthens does not replace the LORD; he carries the Name and the LORD''s own assurance to the man on his face.',
       sv.verse_id, ev.verse_id, 'extras', 67378
  FROM _session253_aoa16_lookup sv, _session253_aoa16_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=16 AND sv.verse_number=2
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=16 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-16-the-name-bearing-angel',
       E'Yahoel, the angel in whom is the Name',
       E'The angel says of the One approaching, *that is the Eternal One who loveth thee* (Apocalypse of Abraham 16:3), and yet it is the angel himself — Yahoel, who bears the Name — who stands beside Abraham strengthening him: *Remain by me; fear not* (Apocalypse of Abraham 16:2). It ain''t new — this is the Angel of the LORD given to lead the seed of Abraham, *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared* (Exodus 23:20), the one of whom it is said *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him* (Exodus 23:21) — the very pattern of Yahoel, the Name borne in the angel. The throne he leads Abraham toward is the merkabah of the prophets, where the living creatures cry holy: *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory* (Isaiah 6:3) — the same ''great voice of holiness'' that comes straight toward Abraham. The adversary who is rebuked in this ascent is the Watcher Azazel, *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.’* (1 Enoch 10:8); the Name-bearing angel, not the fallen one, brings the elect near.',
       sv.verse_id, ev.verse_id, 'extras', 67381
  FROM _session253_aoa16_lookup sv, _session253_aoa16_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=16 AND sv.verse_number=2
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=16 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-16-himself-thou-canst-not-see
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 33:20 — *And he said, Thou canst not see my face: for there shall no man see me, and live.* The same boundary set for Moses is set for Abraham in 16:3 — the Eternal One draws near and loves, yet His face cannot be seen by mortal eyes.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa16_lookup sv, _session253_aoa16_lookup tv
 WHERE t.slug='apocalypse-of-abraham-16-himself-thou-canst-not-see'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=33 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 4:12 — *And Yahuah (LORD) spake unto you out of the midst of the fire: ye heard the voice of the words, but saw no similitude; only ye heard a voice.* Israel at Horeb heard the voice and saw no form, just as Abraham hears the ''great voice of holiness'' in 16:3 while Himself he cannot see.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa16_lookup sv, _session253_aoa16_lookup tv
 WHERE t.slug='apocalypse-of-abraham-16-himself-thou-canst-not-see'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Timothy 6:16 — *Who only hath immortality, dwelling in the light which no man can approach unto; whom no man hath seen, nor can see: to whom be honour and power everlasting. Amen.* Paul states as doctrine what Abraham learns by experience in 16:3 — the Eternal One who loves him dwells in unapproachable light and cannot be seen.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa16_lookup sv, _session253_aoa16_lookup tv
 WHERE t.slug='apocalypse-of-abraham-16-himself-thou-canst-not-see'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 1:18 — *No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him.* The unseen God of 16:3 is made known through a mediator — the same office the Name-bearing angel fills for Abraham as he is brought near.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa16_lookup sv, _session253_aoa16_lookup tv
 WHERE t.slug='apocalypse-of-abraham-16-himself-thou-canst-not-see'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-16-fear-not-i-am-with-thee
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 41:10 — *Fear thou not; for I am with thee: be not dismayed; for I am thy Elohim (God): I will strengthen thee; yea, I will help thee; yea, I will uphold thee with the right hand of my righteousness.* The angel''s exact words to Abraham in 16:4 — ''fear not... I am with thee, strengthening thee'' — are the LORD''s own covenant promise to Abraham''s seed.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa16_lookup sv, _session253_aoa16_lookup tv
 WHERE t.slug='apocalypse-of-abraham-16-fear-not-i-am-with-thee'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=16 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=41 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:1 — *After these things the word of Yahuah (the LORD) came unto Abram in a vision, saying, Fear not, Abram: I am thy shield, and thy exceeding great reward.* The ''fear not'' that opens Abraham''s covenant vision is the same word the angel speaks over him in 16:2 as he is brought up to the throne.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa16_lookup sv, _session253_aoa16_lookup tv
 WHERE t.slug='apocalypse-of-abraham-16-fear-not-i-am-with-thee'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=16 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 1:17 — *And when I saw him, I fell at his feet as dead. And he laid his right hand upon me, saying unto me, Fear not; I am the first and the last.* As Abraham grows faint before the loud crying in 16:4, John too is overcome and steadied by the same ''fear not'' — the seer''s response to the throne is always one word.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa16_lookup sv, _session253_aoa16_lookup tv
 WHERE t.slug='apocalypse-of-abraham-16-fear-not-i-am-with-thee'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=16 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-16-the-name-bearing-angel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* The angel who steadies Abraham and brings him up in 16:2 is the same Name-bearing Angel sent to lead the covenant seed.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa16_lookup sv, _session253_aoa16_lookup tv
 WHERE t.slug='apocalypse-of-abraham-16-the-name-bearing-angel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=16 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 23:21 — *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him.* The angel beside Abraham in 16:2-3, who points to the Eternal One yet bears His authority, is Yahoel — the angel in whom the Name dwells.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa16_lookup sv, _session253_aoa16_lookup tv
 WHERE t.slug='apocalypse-of-abraham-16-the-name-bearing-angel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 6:3 — *And one cried unto another, and said, Holy, holy, holy, is Yahuah Tseva''ot (LORD of hosts): the whole earth is full of his glory.* The ''great voice of holiness'' coming straight toward Abraham in 16:3 is the seraphim''s cry before the throne the angel leads him to.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa16_lookup sv, _session253_aoa16_lookup tv
 WHERE t.slug='apocalypse-of-abraham-16-the-name-bearing-angel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azazel: to him ascribe all sin.* The fallen Watcher rebuked in Abraham''s ascent is this same Azazel; in 16:2 it is the Name-bearing angel, not the corrupter, who keeps the elect near.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa16_lookup sv, _session253_aoa16_lookup tv
 WHERE t.slug='apocalypse-of-abraham-16-the-name-bearing-angel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=16 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

