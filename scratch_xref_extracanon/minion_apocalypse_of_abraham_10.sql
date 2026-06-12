-- ----- fragment: minion_apocalypseofabraham_10.sql (session253 apocalypse-of-abraham 10) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa10 (view _session253_aoa10_lookup). Sort band base 67225, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-10-friend-of-god
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 10, 3, 'canon', 'james', 2, 23, 'free', E'James 2:23 — *And the scripture was fulfilled which saith, Abraham believed Elohim (God), and it was imputed unto him for righteousness: and he was called the Friend of Elohim (God).* The angel hails Abraham by the very name Scripture gives him in apocalypse-of-abraham 10:3.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 10, 3, 'canon', '2-chronicles', 20, 7, 'free', E'2 Chronicles 20:7 — *Art not thou our Elohim (God), who didst drive out the inhabitants of this land before thy people Yashar''el (Israel), and gavest it to the seed of Abraham thy friend for ever?* Jehoshaphat pleads the same friendship the angel speaks over Abraham in apocalypse-of-abraham 10:3.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 10, 4, 'canon', 'isaiah', 41, 8, 'free', E'Isaiah 41:8 — *But thou, Yashar''el (Israel), art my servant, Jacob whom I have chosen, the seed of Abraham my friend.* The Creator who loveth Abraham (apocalypse-of-abraham 10:4) carries that love into the chosen seed of Israel.'),
  -- thread: apocalypse-of-abraham-10-the-name-bearing-angel
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 10, 6, 'canon', 'exodus', 23, 21, 'free', E'Exodus 23:21 — *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him.* Jaoel is a power by virtue of the ineffable Name dwelling in him (apocalypse-of-abraham 10:6) — the Name-bearing Angel of Exodus.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 10, 11, 'canon', 'exodus', 23, 20, 'free', E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* As that Angel brings Israel to the prepared place, Jaoel is sent to bring Abraham to the land prepared for him in apocalypse-of-abraham 10:11.'),
  -- thread: apocalypse-of-abraham-10-cherubim-leviathan-hades
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 10, 7, 'canon', 'ezekiel', 1, 13, 'free', E'Ezekiel 1:13 — *As for the likeness of the living creatures, their appearance was like burning coals of fire, and like the appearance of lamps: it went up and down among the living creatures; and the fire was bright, and out of the fire went forth lightning.* The living creatures of the Cherubim Jaoel restrains (apocalypse-of-abraham 10:7) are the fiery beasts of Ezekiel''s chariot.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 10, 8, 'canon', 'isaiah', 27, 1, 'free', E'Isaiah 27:1 — *In that day Yahuah (LORD) with his sore and great and strong sword shall punish leviathan the piercing serpent, even leviathan that crooked serpent; and he shall slay the dragon that is in the sea.* The Leviathan subject to Jaoel''s restraint (apocalypse-of-abraham 10:8) is the very dragon Yahuah judges.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 10, 8, 'canon', 'psalms', 74, 14, 'free', E'Psalm 74:14 — *Thou brakest the heads of leviathan in pieces, and gavest him to be meat to the people inhabiting the wilderness.* The menace of Leviathan that bows to His command (apocalypse-of-abraham 10:8) is the head Yahuah has already broken.'),
  -- thread: apocalypse-of-abraham-10-burn-the-idol-house
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 10, 10, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Terah''s idolatrous house, marked for burning in apocalypse-of-abraham 10:10, is named outright in Israel''s own record.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 10, 10, 'canon', 'isaiah', 44, 9, 'free', E'Isaiah 44:9 — *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* The dead idols Terah reveres (apocalypse-of-abraham 10:10) are the very vanity Isaiah exposes.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 10, 10, 'canon', 'isaiah', 44, 15, 'free', E'Isaiah 44:15 — *Then shall it be for a man to burn: for he will take thereof, and warm himself; yea, he kindleth it, and baketh bread; yea, he maketh a god, and worshippeth it; he maketh it a graven image, and falleth down thereto.* The wood that becomes a worshipped god is fit only for the fire that consumes the idol-house in apocalypse-of-abraham 10:10.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 10, 10, 'enoch', '1-enoch', 10, 8, 'extras', E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.* The corrupting reverence for dead idols burned away in apocalypse-of-abraham 10:10 is the same Azazel-system whose works defile the earth.'),
  -- thread: apocalypse-of-abraham-10-fulfil-the-sacrifices
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 10, 15, 'canon', 'genesis', 15, 9, 'free', E'Genesis 15:9 — *And he said unto him, Take me an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon.* The sacrifices Jaoel commands Abraham to fulfil (apocalypse-of-abraham 10:15) are the exact heifer, goat, ram, turtledove and pigeon of the Genesis covenant.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 10, 16, 'canon', 'genesis', 15, 5, 'free', E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* The generation prepared to spring from Abraham (apocalypse-of-abraham 10:16) is the innumerable seed shown as the stars.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 10, 11, 'canon', 'genesis', 12, 1, 'free', E'Genesis 12:1 — *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee.* The land the Eternal One hath prepared, for which Jaoel comes (apocalypse-of-abraham 10:11), is the land of the first calling-out.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-10-friend-of-god',
       E'Abraham, Friend of Elohim, raised and strengthened',
       E'Abraham lies on the earth as a stone, and the angel grasps him: *And the angel came, whom He had sent to me, in the likeness of a man, and grasped me by my right hand, and set me up upon my feet, and said to me: "Stand up, Abraham, Friend of Elohim (God) who loveth thee; let not the trembling of man seize thee!* It ain''t new — the title belongs to the whole witness. *And the scripture was fulfilled which saith, Abraham believed Elohim (God), and it was imputed unto him for righteousness: and he was called the Friend of Elohim (God)* (James 2:23); *Art not thou our Elohim (God)... and gavest it to the seed of Abraham thy friend for ever?* (2 Chronicles 20:7); *But thou, Yashar''el (Israel), art my servant, Jacob whom I have chosen, the seed of Abraham my friend* (Isaiah 41:8). The friendship reaches the elect seed, not a church replacing them.',
       sv.verse_id, ev.verse_id, 'extras', 67225
  FROM _session253_aoa10_lookup sv, _session253_aoa10_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=10 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-10-the-name-bearing-angel',
       E'Jaoel — the angel in whom is the ineffable Name',
       E'The angel names himself by the Name he carries: *I am called Jaoel by Him who moveth that which existeth with me on the seventh expanse upon the firmament, a power in virtue of the ineffable Name that is dwelling in me.* It ain''t new — this is the Angel of Exodus: *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared* (Exodus 23:20); *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him* (Exodus 23:21). The same Name dwells in the angel sent to bless Abraham — *I have been sent to bless thee now, and the land which the Eternal One... hath prepared for thee* — and the prepared place answers the prepared land.',
       sv.verse_id, ev.verse_id, 'extras', 67228
  FROM _session253_aoa10_lookup sv, _session253_aoa10_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=10 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-10-cherubim-leviathan-hades',
       E'Restraining the living creatures, the Leviathan, and Hades',
       E'Jaoel recounts his charge over the powers of the throne and the deep: *I am the one who hath been given to restrain, according to His commandment, the threatening attack of the living creatures of the Cherubim against one another, and to teach those who carry Him the song of the seventh hour of the night of man* — *I am ordained to restrain the Leviathan, for unto me are subject the attack and menace of every single reptile* — *I am he who hath been commissioned to loosen Hades, to destroy him who stareth at the dead.* It ain''t new — the living creatures are Ezekiel''s: *As for the likeness of the living creatures, their appearance was like burning coals of fire, and like the appearance of lamps... and out of the fire went forth lightning* (Ezekiel 1:13). And the Leviathan is the dragon Yahuah alone subdues: *In that day Yahuah (LORD) with his sore and great and strong sword shall punish leviathan the piercing serpent... and he shall slay the dragon that is in the sea* (Isaiah 27:1); *Thou brakest the heads of leviathan in pieces, and gavest him to be meat to the people inhabiting the wilderness* (Psalm 74:14).',
       sv.verse_id, ev.verse_id, 'extras', 67231
  FROM _session253_aoa10_lookup sv, _session253_aoa10_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=7
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=10 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-10-burn-the-idol-house',
       E'Set on fire thy father''s house — the dead idols cannot save',
       E'Jaoel declares his commission against Terah''s idolatry: *I am the one who was commissioned to set on fire thy father''s house together with him, because he displayed reverence for dead idols.* It ain''t new — the fathers served other gods, and the system burns: *And Joshua said unto all the people... Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham... and they served other gods* (Joshua 24:2). The idol-maker is exposed as vanity — *They that make a graven image are all of them vanity... they see not, nor know; that they may be ashamed* (Isaiah 44:9) — wood for the fire he bows to: *Then shall it be for a man to burn... yea, he maketh a god, and worshippeth it* (Isaiah 44:15). The dead idols cannot save; the system is dismantled, and Abraham is called out of it. So too the corrupting works traced to Azazel: *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin* (1 Enoch 10:8).',
       sv.verse_id, ev.verse_id, 'extras', 67234
  FROM _session253_aoa10_lookup sv, _session253_aoa10_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=10
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=10 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-10-fulfil-the-sacrifices',
       E'Go, fulfil the sacrifices commanded — the land and the seed',
       E'The angel sends Abraham to the covenant offering and to the seed to come: *Go, fulfil the sacrifices commanded* — *For, lo, I have been appointed to be with thee and with the generation prepared to spring from thee; and with me Michael blesseth thee for ever.* It ain''t new — this is the cutting of the covenant in Genesis 15: *And he said unto him, Take me an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon* (Genesis 15:9); and the prepared generation is the promised seed as the stars — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars... So shall thy seed be* (Genesis 15:5). The call to fulfil the sacrifice answers the first call out: *Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee* (Genesis 12:1).',
       sv.verse_id, ev.verse_id, 'extras', 67237
  FROM _session253_aoa10_lookup sv, _session253_aoa10_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=15
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=10 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-10-friend-of-god
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 2:23 — *And the scripture was fulfilled which saith, Abraham believed Elohim (God), and it was imputed unto him for righteousness: and he was called the Friend of Elohim (God).* The angel hails Abraham by the very name Scripture gives him in apocalypse-of-abraham 10:3.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa10_lookup sv, _session253_aoa10_lookup tv
 WHERE t.slug='apocalypse-of-abraham-10-friend-of-god'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Chronicles 20:7 — *Art not thou our Elohim (God), who didst drive out the inhabitants of this land before thy people Yashar''el (Israel), and gavest it to the seed of Abraham thy friend for ever?* Jehoshaphat pleads the same friendship the angel speaks over Abraham in apocalypse-of-abraham 10:3.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa10_lookup sv, _session253_aoa10_lookup tv
 WHERE t.slug='apocalypse-of-abraham-10-friend-of-god'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 41:8 — *But thou, Yashar''el (Israel), art my servant, Jacob whom I have chosen, the seed of Abraham my friend.* The Creator who loveth Abraham (apocalypse-of-abraham 10:4) carries that love into the chosen seed of Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa10_lookup sv, _session253_aoa10_lookup tv
 WHERE t.slug='apocalypse-of-abraham-10-friend-of-god'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=41 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-10-the-name-bearing-angel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 23:21 — *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him.* Jaoel is a power by virtue of the ineffable Name dwelling in him (apocalypse-of-abraham 10:6) — the Name-bearing Angel of Exodus.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa10_lookup sv, _session253_aoa10_lookup tv
 WHERE t.slug='apocalypse-of-abraham-10-the-name-bearing-angel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* As that Angel brings Israel to the prepared place, Jaoel is sent to bring Abraham to the land prepared for him in apocalypse-of-abraham 10:11.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa10_lookup sv, _session253_aoa10_lookup tv
 WHERE t.slug='apocalypse-of-abraham-10-the-name-bearing-angel'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-10-cherubim-leviathan-hades
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 1:13 — *As for the likeness of the living creatures, their appearance was like burning coals of fire, and like the appearance of lamps: it went up and down among the living creatures; and the fire was bright, and out of the fire went forth lightning.* The living creatures of the Cherubim Jaoel restrains (apocalypse-of-abraham 10:7) are the fiery beasts of Ezekiel''s chariot.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa10_lookup sv, _session253_aoa10_lookup tv
 WHERE t.slug='apocalypse-of-abraham-10-cherubim-leviathan-hades'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 27:1 — *In that day Yahuah (LORD) with his sore and great and strong sword shall punish leviathan the piercing serpent, even leviathan that crooked serpent; and he shall slay the dragon that is in the sea.* The Leviathan subject to Jaoel''s restraint (apocalypse-of-abraham 10:8) is the very dragon Yahuah judges.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa10_lookup sv, _session253_aoa10_lookup tv
 WHERE t.slug='apocalypse-of-abraham-10-cherubim-leviathan-hades'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=27 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 74:14 — *Thou brakest the heads of leviathan in pieces, and gavest him to be meat to the people inhabiting the wilderness.* The menace of Leviathan that bows to His command (apocalypse-of-abraham 10:8) is the head Yahuah has already broken.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa10_lookup sv, _session253_aoa10_lookup tv
 WHERE t.slug='apocalypse-of-abraham-10-cherubim-leviathan-hades'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=74 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-10-burn-the-idol-house
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Terah''s idolatrous house, marked for burning in apocalypse-of-abraham 10:10, is named outright in Israel''s own record.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa10_lookup sv, _session253_aoa10_lookup tv
 WHERE t.slug='apocalypse-of-abraham-10-burn-the-idol-house'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 44:9 — *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* The dead idols Terah reveres (apocalypse-of-abraham 10:10) are the very vanity Isaiah exposes.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa10_lookup sv, _session253_aoa10_lookup tv
 WHERE t.slug='apocalypse-of-abraham-10-burn-the-idol-house'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 44:15 — *Then shall it be for a man to burn: for he will take thereof, and warm himself; yea, he kindleth it, and baketh bread; yea, he maketh a god, and worshippeth it; he maketh it a graven image, and falleth down thereto.* The wood that becomes a worshipped god is fit only for the fire that consumes the idol-house in apocalypse-of-abraham 10:10.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa10_lookup sv, _session253_aoa10_lookup tv
 WHERE t.slug='apocalypse-of-abraham-10-burn-the-idol-house'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.* The corrupting reverence for dead idols burned away in apocalypse-of-abraham 10:10 is the same Azazel-system whose works defile the earth.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa10_lookup sv, _session253_aoa10_lookup tv
 WHERE t.slug='apocalypse-of-abraham-10-burn-the-idol-house'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=10
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-10-fulfil-the-sacrifices
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:9 — *And he said unto him, Take me an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon.* The sacrifices Jaoel commands Abraham to fulfil (apocalypse-of-abraham 10:15) are the exact heifer, goat, ram, turtledove and pigeon of the Genesis covenant.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa10_lookup sv, _session253_aoa10_lookup tv
 WHERE t.slug='apocalypse-of-abraham-10-fulfil-the-sacrifices'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* The generation prepared to spring from Abraham (apocalypse-of-abraham 10:16) is the innumerable seed shown as the stars.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa10_lookup sv, _session253_aoa10_lookup tv
 WHERE t.slug='apocalypse-of-abraham-10-fulfil-the-sacrifices'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 12:1 — *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee.* The land the Eternal One hath prepared, for which Jaoel comes (apocalypse-of-abraham 10:11), is the land of the first calling-out.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa10_lookup sv, _session253_aoa10_lookup tv
 WHERE t.slug='apocalypse-of-abraham-10-fulfil-the-sacrifices'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=10 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

