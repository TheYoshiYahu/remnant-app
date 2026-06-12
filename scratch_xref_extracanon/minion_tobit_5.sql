-- ----- fragment: minion_tobit_05.sql (session253 tobit 5) -----
-- Source anchor: apocrypha/tobit ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: tob5 (view _session253_tob5_lookup). Sort band base 59700, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_tob5_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: tobit-5-angel-of-the-journey
  ('apocrypha', 'tobit', 5, 16, 'canon', 'exodus', 23, 20, 'free', E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* The angel of Yahuah whom Tobit asks to keep his son company on the road to Rages is the same guide Yahuah pledged to send before Israel to keep them in the way.'),
  ('apocrypha', 'tobit', 5, 16, 'canon', 'psalms', 91, 11, 'free', E'Psalm 91:11 — *For he shall give his angels charge over thee, to keep thee in all thy ways.* Tobit''s prayer that the angel of Yahuah keep Tobias company echoes the psalm''s charge over the traveller''s every way.'),
  ('apocrypha', 'tobit', 5, 6, 'canon', 'hebrews', 1, 14, 'free', E'Hebrews 1:14 — *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* Raphael''s promise to go with Tobias and lead the way is exactly this ministering-spirit office, sent forth to serve the heirs of the covenant.'),
  -- thread: tobit-5-angel-prosper-thy-way
  ('apocrypha', 'tobit', 5, 16, 'canon', 'genesis', 24, 7, 'free', E'Genesis 24:7 — *Yahuah Elohim (The LORD God) of heaven, which took me from my father’s house, and from the land of my kindred, and which spake unto me, and that sware unto me, saying, Unto thy seed will I give this land; he shall send his angel before thee, and thou shalt take a wife unto my son from thence.* Tobit invokes the same God of heaven who sends his angel before a son''s journey to kindred, as Tobias likewise rides toward Sara.'),
  ('apocrypha', 'tobit', 5, 21, 'canon', 'genesis', 24, 40, 'free', E'Genesis 24:40 — *And he said unto me, Yahuah (LORD), before whom I walk, will send his angel with thee, and prosper thy way; and thou shalt take a wife for my son of my kindred, and of my father’s house:* Tobit''s assurance that the good angel will prosper Tobias''s journey and bring him back safe is word-for-word the hope of Abraham''s servant.'),
  -- thread: tobit-5-firstborn-and-the-tenths
  ('apocrypha', 'tobit', 5, 13, 'canon', 'deuteronomy', 14, 23, 'free', E'Deuteronomy 14:23 — *And thou shalt eat before Yahuah Elohayka (the LORD thy God), in the place which he shall choose to place his name there, the tithe of thy corn, of thy wine, and of thine oil, and the firstlings of thy herds and of thy flocks; that thou mayest learn to fear Yahuah Elohayka (the LORD thy God) always.* Tobit remembers going up to Jerusalem to offer the tenths of the fruits, the very tithe Torah commands be eaten before Yahuah in the place of his name.'),
  ('apocrypha', 'tobit', 5, 13, 'canon', 'numbers', 18, 15, 'free', E'Numbers 18:15 — *Every thing that openeth the matrix in all flesh, which they bring unto Yahuah (LORD), whether it be of men or beasts, shall be thine: nevertheless the firstborn of man shalt thou surely redeem, and the firstling of unclean beasts shalt thou redeem.* The firstborn that Tobit''s kindred faithfully offered is the same firstborn the priestly law dedicates wholly to Yahuah.'),
  ('apocrypha', 'tobit', 5, 13, 'canon', 'exodus', 23, 14, 'free', E'Exodus 23:14 — *Three times thou shalt keep a feast unto me in the year.* The pilgrim-journeys to Jerusalem to worship that Tobit recalls are the thrice-yearly feasts Torah appoints, kept by the faithful remnant in exile-prone days.'),
  -- thread: tobit-5-the-angel-unrecognized
  ('apocrypha', 'tobit', 5, 4, 'canon', 'luke', 1, 19, 'free', E'Luke 1:19 — *And the angel answering said unto him, I am Gabriel, that stand in the presence of Elohim (God); and am sent to speak unto thee, and to shew thee these glad tidings.* Raphael, unrecognized and named Azarias, belongs to the same order of angels that stand in the presence of Elohim and are sent forth to households of the faithful.'),
  ('apocrypha', 'tobit', 5, 12, 'canon', 'hebrews', 1, 14, 'free', E'Hebrews 1:14 — *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* The angel who takes the name Azarias (''Yahuah-helps'') to serve Tobias is the ministering spirit Hebrews describes, sent forth to minister for the heirs.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_tob5_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_tob5_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-5-angel-of-the-journey',
       E'The Angel Sent Before to Keep the Way',
       E'Raphael comes disguised as the kinsman ''Azarias'' to lead Tobias to Rages, and the blind father blesses the setting-out: *To whom the angel said, I will go with you, and I know the way well: for I have lodged with our brother Gabael.* (Tobit 5:6) ... *Then said he to Tobias, Prepare thyself for the journey, and Yahuah (God) send you a good journey... and the angel of Yahuah (God) keep you company.* (Tobit 5:16) This is the oldest covenant promise of the protecting guide of the road. To the wilderness generation it was spoken plainly: *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* (Exodus 23:20). The psalm widens it to every faithful traveller: *For he shall give his angels charge over thee, to keep thee in all thy ways.* (Psalm 91:11). And the apostle names the office for what it is, neither to be worshipped nor feared: *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* (Hebrews 1:14). It ain''t new — the unseen escort of the journey is the same witness from Exodus to the Apocrypha to the writer of Hebrews.',
       sv.verse_id, ev.verse_id, 'extras', 59700
  FROM _session253_tob5_lookup sv, _session253_tob5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=5 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=5 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-5-angel-prosper-thy-way',
       E'Send His Angel and Prosper Thy Way',
       E'The father commits his son to a guided road: *Go you with this man, and Yahuah (God), which dwells in heaven, prosper your journey, and the angel of Yahuah (God) keep you company.* (Tobit 5:16). This is Abraham''s servant going to Rages-like distance to fetch a wife, and the very same promise carries the errand: *Yahuah Elohim (The LORD God) of heaven... he shall send his angel before thee, and thou shalt take a wife unto my son from thence.* (Genesis 24:7), and again *Yahuah (LORD), before whom I walk, will send his angel with thee, and prosper thy way.* (Genesis 24:40). And the mother is comforted by the same certainty: *For the good angel will keep him company, and his journey shall be prosperous, and he shall return safe.* (Tobit 5:21). The God of heaven sends his angel before the betrothal-journey and prospers the way — it ain''t new, it is Genesis 24 walked again.',
       sv.verse_id, ev.verse_id, 'extras', 59703
  FROM _session253_tob5_lookup sv, _session253_tob5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=5 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=5 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-5-firstborn-and-the-tenths',
       E'The Firstborn and the Tenths Brought Up to Jerusalem',
       E'Tobit names his kinsman''s good stock by their Torah-faithfulness in exile-bound days: *for I know Ananias and Jonathas, sons of that great Samaias, as we went together to Jerusalem to worship, and offered the firstborn, and the tenths of the fruits; and they were not seduced with the error of our brothers.* (Tobit 5:13). The tithe of the increase is the standing command: *Thou shalt eat before Yahuah Elohayka (the LORD thy God), in the place which he shall choose to place his name there, the tithe of thy corn, of thy wine, and of thine oil, and the firstlings of thy herds and of thy flocks; that thou mayest learn to fear Yahuah Elohayka (the LORD thy God) always.* (Deuteronomy 14:23), and the firstborn redeemed: *the firstborn of man shalt thou surely redeem, and the firstling of unclean beasts shalt thou redeem.* (Numbers 18:15). The whole feast-cycle that drew them up to Jerusalem stands behind it: *Three times thou shalt keep a feast unto me in the year.* (Exodus 23:14). Torah kept in the scattering is no curse — it is the seed kept faithful while the rest were seduced.',
       sv.verse_id, ev.verse_id, 'extras', 59706
  FROM _session253_tob5_lookup sv, _session253_tob5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=5 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=5 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'tobit-5-the-angel-unrecognized',
       E'The Angel Unrecognized, Who Will Not Be Worshipped',
       E'The whole scene turns on the disguise: *Therefore when he went to seek a man, he found Raphael that was an angel.* (Tobit 5:4) ... *But he knew not.* (Tobit 5:5). The deliverer walks beside men unrecognized, taking the name Azarias (''Yahuah-helps''). So too the messenger stands ready in the presence of Elohim and is sent to a household unawares: *And the angel answering said unto him, I am Gabriel, that stand in the presence of Elohim (God); and am sent to speak unto thee, and to shew thee these glad tidings.* (Luke 1:19) — the same order of the seven holy angels to which Raphael belongs. And the angel never claims worship, for he is a ministering spirit: *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* (Hebrews 1:14). The helper hidden in a kinsman''s face is the messenger who stands before Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 59709
  FROM _session253_tob5_lookup sv, _session253_tob5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=5 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='tobit' AND ev.chapter_number=5 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: tobit-5-angel-of-the-journey
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* The angel of Yahuah whom Tobit asks to keep his son company on the road to Rages is the same guide Yahuah pledged to send before Israel to keep them in the way.'
  FROM cross_reference_threads t, cross_references x, _session253_tob5_lookup sv, _session253_tob5_lookup tv
 WHERE t.slug='tobit-5-angel-of-the-journey'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=5 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 91:11 — *For he shall give his angels charge over thee, to keep thee in all thy ways.* Tobit''s prayer that the angel of Yahuah keep Tobias company echoes the psalm''s charge over the traveller''s every way.'
  FROM cross_reference_threads t, cross_references x, _session253_tob5_lookup sv, _session253_tob5_lookup tv
 WHERE t.slug='tobit-5-angel-of-the-journey'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=5 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=91 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 1:14 — *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* Raphael''s promise to go with Tobias and lead the way is exactly this ministering-spirit office, sent forth to serve the heirs of the covenant.'
  FROM cross_reference_threads t, cross_references x, _session253_tob5_lookup sv, _session253_tob5_lookup tv
 WHERE t.slug='tobit-5-angel-of-the-journey'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=5 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-5-angel-prosper-thy-way
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 24:7 — *Yahuah Elohim (The LORD God) of heaven, which took me from my father’s house, and from the land of my kindred, and which spake unto me, and that sware unto me, saying, Unto thy seed will I give this land; he shall send his angel before thee, and thou shalt take a wife unto my son from thence.* Tobit invokes the same God of heaven who sends his angel before a son''s journey to kindred, as Tobias likewise rides toward Sara.'
  FROM cross_reference_threads t, cross_references x, _session253_tob5_lookup sv, _session253_tob5_lookup tv
 WHERE t.slug='tobit-5-angel-prosper-thy-way'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=5 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 24:40 — *And he said unto me, Yahuah (LORD), before whom I walk, will send his angel with thee, and prosper thy way; and thou shalt take a wife for my son of my kindred, and of my father’s house:* Tobit''s assurance that the good angel will prosper Tobias''s journey and bring him back safe is word-for-word the hope of Abraham''s servant.'
  FROM cross_reference_threads t, cross_references x, _session253_tob5_lookup sv, _session253_tob5_lookup tv
 WHERE t.slug='tobit-5-angel-prosper-thy-way'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=5 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-5-firstborn-and-the-tenths
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 14:23 — *And thou shalt eat before Yahuah Elohayka (the LORD thy God), in the place which he shall choose to place his name there, the tithe of thy corn, of thy wine, and of thine oil, and the firstlings of thy herds and of thy flocks; that thou mayest learn to fear Yahuah Elohayka (the LORD thy God) always.* Tobit remembers going up to Jerusalem to offer the tenths of the fruits, the very tithe Torah commands be eaten before Yahuah in the place of his name.'
  FROM cross_reference_threads t, cross_references x, _session253_tob5_lookup sv, _session253_tob5_lookup tv
 WHERE t.slug='tobit-5-firstborn-and-the-tenths'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=14 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 18:15 — *Every thing that openeth the matrix in all flesh, which they bring unto Yahuah (LORD), whether it be of men or beasts, shall be thine: nevertheless the firstborn of man shalt thou surely redeem, and the firstling of unclean beasts shalt thou redeem.* The firstborn that Tobit''s kindred faithfully offered is the same firstborn the priestly law dedicates wholly to Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_tob5_lookup sv, _session253_tob5_lookup tv
 WHERE t.slug='tobit-5-firstborn-and-the-tenths'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 23:14 — *Three times thou shalt keep a feast unto me in the year.* The pilgrim-journeys to Jerusalem to worship that Tobit recalls are the thrice-yearly feasts Torah appoints, kept by the faithful remnant in exile-prone days.'
  FROM cross_reference_threads t, cross_references x, _session253_tob5_lookup sv, _session253_tob5_lookup tv
 WHERE t.slug='tobit-5-firstborn-and-the-tenths'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: tobit-5-the-angel-unrecognized
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 1:19 — *And the angel answering said unto him, I am Gabriel, that stand in the presence of Elohim (God); and am sent to speak unto thee, and to shew thee these glad tidings.* Raphael, unrecognized and named Azarias, belongs to the same order of angels that stand in the presence of Elohim and are sent forth to households of the faithful.'
  FROM cross_reference_threads t, cross_references x, _session253_tob5_lookup sv, _session253_tob5_lookup tv
 WHERE t.slug='tobit-5-the-angel-unrecognized'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 1:14 — *Are they not all ministering spirits, sent forth to minister for them who shall be heirs of salvation?* The angel who takes the name Azarias (''Yahuah-helps'') to serve Tobias is the ministering spirit Hebrews describes, sent forth to minister for the heirs.'
  FROM cross_reference_threads t, cross_references x, _session253_tob5_lookup sv, _session253_tob5_lookup tv
 WHERE t.slug='tobit-5-the-angel-unrecognized'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='tobit' AND sv.chapter_number=5 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

