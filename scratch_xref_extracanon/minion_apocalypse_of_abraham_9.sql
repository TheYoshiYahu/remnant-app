-- ----- fragment: minion_apocalypseofabraham_09.sql (session253 apocalypse-of-abraham 9) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa9 (view _session253_aoa9_lookup). Sort band base 67200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa9_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-9-the-covenant-sacrifice
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 9, 5, 'canon', 'genesis', 15, 9, 'free', E'Genesis 15:9 — *And he said unto him, Take me an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon.* The five creatures of Apocalypse of Abraham 9:5 are the very beasts Yahuah names for the covenant sacrifice in Genesis — it ain''t new.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 9, 5, 'canon', 'genesis', 15, 17, 'free', E'Genesis 15:17 — *And it came to pass, that, when the sun went down, and it was dark, behold a smoking furnace, and a burning lamp that passed between those pieces.* The pure sacrifice Abraham is told to set forth in 9:5 is the covenant between the pieces, sealed by the burning lamp that passes through them.'),
  -- thread: apocalypse-of-abraham-9-fear-not-i-am-thy-shield
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 9, 4, 'canon', 'genesis', 15, 1, 'free', E'Genesis 15:1 — *After these things the word of Yahuah (LORD) came unto Abram in a vision, saying, Fear not, Abram: I am thy shield, and thy exceeding great reward.* The ''fear not... I am a shield over thee'' of Apocalypse of Abraham 9:3-4 is the opening of the same covenant vision in Genesis.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 9, 4, 'canon', 'isaiah', 41, 10, 'free', E'Isaiah 41:10 — *Fear thou not; for I am with thee: be not dismayed; for I am thy Elohim (God): I will strengthen thee; yea, I will help thee; yea, I will uphold thee with the right hand of my righteousness.* The Helper of 9:4 is the same upholding right hand spoken over Abraham''s chosen seed in Isaiah.'),
  -- thread: apocalypse-of-abraham-9-named-my-friend
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 9, 6, 'canon', 'isaiah', 41, 8, 'free', E'Isaiah 41:8 — *But thou, Yashar''el (Israel), art my servant, Jacob whom I have chosen, the seed of Abraham my friend.* The ''I have named thee my Friend'' of 9:6 is the prophet''s own title for Abraham, carried down to his chosen seed.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 9, 6, 'canon', '2-chronicles', 20, 7, 'free', E'2 Chronicles 20:7 — *Art not thou our Elohim (God), who didst drive out the inhabitants of this land before thy people Yashar''el (Israel), and gavest it to the seed of Abraham thy friend for ever?* Jehoshaphat pleads at the throne the very friend-name Abraham is given in 9:6.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 9, 6, 'canon', 'james', 2, 23, 'free', E'James 2:23 — *And the scripture was fulfilled which saith, Abraham believed Elohim (God), and it was imputed unto him for righteousness: and he was called the Friend of Elohim (God).* The apostle confirms the same name spoken over Abraham in 9:6 — it ain''t new.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 9, 6, 'canon', 'john', 15, 15, 'free', E'John 15:15 — *Henceforth I call you not servants; for the servant knoweth not what his lord doeth: but I have called you friends; for all things that I have heard of my Father I have made known unto you.* The friend-naming of Abraham in 9:6 — to whom the ages are made known — is the pattern the Master extends to His own, making all things known to friends.'),
  -- thread: apocalypse-of-abraham-9-the-ages-to-come-shewn
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 9, 6, 'canon', 'genesis', 15, 13, 'free', E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years.* The ''ages to come'' laid before Abraham in 9:6 are the very foretelling joined to the Genesis covenant — what shall come to pass upon the seed.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 9, 6, 'canon', 'genesis', 15, 5, 'free', E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* The ''great things which thou hast not seen hitherto'' of 9:6 begin with the seed beyond numbering shown at the same sacrifice.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 9, 7, 'canon', 'romans', 4, 17, 'free', E'Romans 4:17 — *(As it is written, I have made thee a father of many nations,) before him whom he believed, even Elohim (God), who quickeneth the dead, and calleth those things which be not as though they were.* The ages ''which shall come to pass'' shewn Abraham in 9:7 are seen by the same faith that calls the not-yet as though it already were.'),
  -- thread: apocalypse-of-abraham-9-go-forth-to-the-place-shewn
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 9, 7, 'canon', 'genesis', 12, 1, 'free', E'Genesis 12:1 — *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee.* The ''place which I will shew thee'' of 9:7 echoes the first call out of Ur — the land Yahuah shews and does not yet name.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 9, 7, 'canon', 'acts', 7, 3, 'free', E'Acts 7:3 — *And said unto him, Get thee out of thy country, and from thy kindred, and come into the land which I shall shew thee.* Stephen rehearses the same shew-thee call before the council — the appointed place Abraham is sent to in 9:7 is the calling out itself.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 9, 7, 'canon', 'exodus', 23, 20, 'free', E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* The angel who bears the Name (the Yahoel of this Apocalypse) brings to the prepared place — the very mountain Abraham is told to go up to in 9:7.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 9, 7, 'canon', 'exodus', 23, 21, 'free', E'Exodus 23:21 — *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him.* The Word by which Yahuah shews Abraham the ages in 9:7 is borne by the angel in whom the Name dwells — the Name-bearing guide of the called-out man.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa9_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa9_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-9-the-covenant-sacrifice',
       E'The heifer, the goat, the ram, the turtledove and the pigeon',
       E'The voice commands the very offering of the covenant between the pieces: *Go, take me a young heifer of three years old, and a she-goat of three years old, and a ram of three years old, and a turtledove and a pigeon, and bring me a pure sacrifice* (Apocalypse of Abraham 9:5). It ain''t new — it is Genesis word for word: *And he said unto him, Take me an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon* (Genesis 15:9). And the smoking furnace that passed between the pieces sealed the covenant: *And it came to pass, that, when the sun went down, and it was dark, behold a smoking furnace, and a burning lamp that passed between those pieces* (Genesis 15:17). The same beasts, the same Abraham, the same cutting of the covenant.',
       sv.verse_id, ev.verse_id, 'extras', 67200
  FROM _session253_aoa9_lookup sv, _session253_aoa9_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=5
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=9 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-9-fear-not-i-am-thy-shield',
       E'Fear not — I am a shield over thee',
       E'The voice that calls Abraham twice steadies him: *fear not, for I am before the worlds, and a mighty Elohim (God) who hath created the light of the world* (Apocalypse of Abraham 9:3), *I am a shield over thee, and I am thy helper* (Apocalypse of Abraham 9:4). It ain''t new — this is the opening of the covenant vision: *Fear not, Abram: I am thy shield, and thy exceeding great reward* (Genesis 15:1). The shield-word stands over Abraham''s seed forever: *Fear thou not; for I am with thee: be not dismayed; for I am thy Elohim (God): I will strengthen thee; yea, I will help thee* (Isaiah 41:10). The same fear-not, the same shield, the same Helper.',
       sv.verse_id, ev.verse_id, 'extras', 67203
  FROM _session253_aoa9_lookup sv, _session253_aoa9_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=9 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-9-named-my-friend',
       E'I have named thee my Friend',
       E'The voice tells Abraham why this vision is given him: *because thou hast loved to search me out, and I have named thee my Friend* (Apocalypse of Abraham 9:6). It ain''t new — the title rings through the whole library. The prophet calls him so: *the seed of Abraham my friend* (Isaiah 41:8). Jehoshaphat pleads it before the throne: *gavest it to the seed of Abraham thy friend for ever* (2 Chronicles 20:7). The apostle seals it: *and he was called the Friend of Elohim (God)* (James 2:23). And the Master turns the name toward His own: *Henceforth I call you not servants... but I have called you friends* (John 15:15). The friendship of Abraham is the pattern of all who are called out.',
       sv.verse_id, ev.verse_id, 'extras', 67206
  FROM _session253_aoa9_lookup sv, _session253_aoa9_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=9 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-9-the-ages-to-come-shewn',
       E'In this sacrifice I will lay before thee the ages to come',
       E'Upon the covenant offering the unseen things are unveiled: *And in this sacrifice I will lay before thee the ages (to come), and make known to thee what is reserved, and thou shalt see great things which thou hast not seen hitherto* (Apocalypse of Abraham 9:6); *there I will shew thee the ages which have been created and established... and I will make known to thee what shall come to pass in them on those who have done evil and practised righteousness* (Apocalypse of Abraham 9:7). It ain''t new — Genesis joins the cutting of the covenant to the long foretelling of what shall befall the seed: *Know of a surety that thy seed shall be a stranger in a land that is not theirs... and afterward shall they come out with great substance* (Genesis 15:13-14). And the same Abraham was shown the seed beyond numbering: *Look now toward heaven, and tell the stars, if thou be able to number them... So shall thy seed be* (Genesis 15:5); the apostle names this the faith that *calleth those things which be not as though they were* (Romans 4:17). The sacrifice opens the scroll of the ages.',
       sv.verse_id, ev.verse_id, 'extras', 67209
  FROM _session253_aoa9_lookup sv, _session253_aoa9_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=9 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-9-go-forth-to-the-place-shewn',
       E'Set forth for me the sacrifice in the place which I will shew thee',
       E'The fast of forty days ends with a journey to an appointed mountain: *then set forth for me the sacrifice which I have commanded thee, in the place which I will shew thee, on a high mountain* (Apocalypse of Abraham 9:7). It ain''t new — this is the call out of the land, to a place not yet named: *Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee* (Genesis 12:1). Stephen rehearses it before the council: *The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia* (Acts 7:2), *come into the land which I shall shew thee* (Acts 7:3). And the One who brings to the prepared place is the angel who bears the Name — the same Yahoel who will lead Abraham up: *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared... for my name is in him* (Exodus 23:20-21). The called-out man is led by the Name to the place the Name appoints.',
       sv.verse_id, ev.verse_id, 'extras', 67212
  FROM _session253_aoa9_lookup sv, _session253_aoa9_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=7
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=9 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-9-the-covenant-sacrifice
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:9 — *And he said unto him, Take me an heifer of three years old, and a she goat of three years old, and a ram of three years old, and a turtledove, and a young pigeon.* The five creatures of Apocalypse of Abraham 9:5 are the very beasts Yahuah names for the covenant sacrifice in Genesis — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa9_lookup sv, _session253_aoa9_lookup tv
 WHERE t.slug='apocalypse-of-abraham-9-the-covenant-sacrifice'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:17 — *And it came to pass, that, when the sun went down, and it was dark, behold a smoking furnace, and a burning lamp that passed between those pieces.* The pure sacrifice Abraham is told to set forth in 9:5 is the covenant between the pieces, sealed by the burning lamp that passes through them.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa9_lookup sv, _session253_aoa9_lookup tv
 WHERE t.slug='apocalypse-of-abraham-9-the-covenant-sacrifice'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-9-fear-not-i-am-thy-shield
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:1 — *After these things the word of Yahuah (LORD) came unto Abram in a vision, saying, Fear not, Abram: I am thy shield, and thy exceeding great reward.* The ''fear not... I am a shield over thee'' of Apocalypse of Abraham 9:3-4 is the opening of the same covenant vision in Genesis.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa9_lookup sv, _session253_aoa9_lookup tv
 WHERE t.slug='apocalypse-of-abraham-9-fear-not-i-am-thy-shield'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 41:10 — *Fear thou not; for I am with thee: be not dismayed; for I am thy Elohim (God): I will strengthen thee; yea, I will help thee; yea, I will uphold thee with the right hand of my righteousness.* The Helper of 9:4 is the same upholding right hand spoken over Abraham''s chosen seed in Isaiah.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa9_lookup sv, _session253_aoa9_lookup tv
 WHERE t.slug='apocalypse-of-abraham-9-fear-not-i-am-thy-shield'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=41 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-9-named-my-friend
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 41:8 — *But thou, Yashar''el (Israel), art my servant, Jacob whom I have chosen, the seed of Abraham my friend.* The ''I have named thee my Friend'' of 9:6 is the prophet''s own title for Abraham, carried down to his chosen seed.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa9_lookup sv, _session253_aoa9_lookup tv
 WHERE t.slug='apocalypse-of-abraham-9-named-my-friend'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=41 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Chronicles 20:7 — *Art not thou our Elohim (God), who didst drive out the inhabitants of this land before thy people Yashar''el (Israel), and gavest it to the seed of Abraham thy friend for ever?* Jehoshaphat pleads at the throne the very friend-name Abraham is given in 9:6.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa9_lookup sv, _session253_aoa9_lookup tv
 WHERE t.slug='apocalypse-of-abraham-9-named-my-friend'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 2:23 — *And the scripture was fulfilled which saith, Abraham believed Elohim (God), and it was imputed unto him for righteousness: and he was called the Friend of Elohim (God).* The apostle confirms the same name spoken over Abraham in 9:6 — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa9_lookup sv, _session253_aoa9_lookup tv
 WHERE t.slug='apocalypse-of-abraham-9-named-my-friend'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=2 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 15:15 — *Henceforth I call you not servants; for the servant knoweth not what his lord doeth: but I have called you friends; for all things that I have heard of my Father I have made known unto you.* The friend-naming of Abraham in 9:6 — to whom the ages are made known — is the pattern the Master extends to His own, making all things known to friends.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa9_lookup sv, _session253_aoa9_lookup tv
 WHERE t.slug='apocalypse-of-abraham-9-named-my-friend'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=15 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-9-the-ages-to-come-shewn
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:13 — *And he said unto Abram, Know of a surety that thy seed shall be a stranger in a land that is not theirs, and shall serve them; and they shall afflict them four hundred years.* The ''ages to come'' laid before Abraham in 9:6 are the very foretelling joined to the Genesis covenant — what shall come to pass upon the seed.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa9_lookup sv, _session253_aoa9_lookup tv
 WHERE t.slug='apocalypse-of-abraham-9-the-ages-to-come-shewn'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* The ''great things which thou hast not seen hitherto'' of 9:6 begin with the seed beyond numbering shown at the same sacrifice.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa9_lookup sv, _session253_aoa9_lookup tv
 WHERE t.slug='apocalypse-of-abraham-9-the-ages-to-come-shewn'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 4:17 — *(As it is written, I have made thee a father of many nations,) before him whom he believed, even Elohim (God), who quickeneth the dead, and calleth those things which be not as though they were.* The ages ''which shall come to pass'' shewn Abraham in 9:7 are seen by the same faith that calls the not-yet as though it already were.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa9_lookup sv, _session253_aoa9_lookup tv
 WHERE t.slug='apocalypse-of-abraham-9-the-ages-to-come-shewn'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-9-go-forth-to-the-place-shewn
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 12:1 — *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee.* The ''place which I will shew thee'' of 9:7 echoes the first call out of Ur — the land Yahuah shews and does not yet name.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa9_lookup sv, _session253_aoa9_lookup tv
 WHERE t.slug='apocalypse-of-abraham-9-go-forth-to-the-place-shewn'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 7:3 — *And said unto him, Get thee out of thy country, and from thy kindred, and come into the land which I shall shew thee.* Stephen rehearses the same shew-thee call before the council — the appointed place Abraham is sent to in 9:7 is the calling out itself.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa9_lookup sv, _session253_aoa9_lookup tv
 WHERE t.slug='apocalypse-of-abraham-9-go-forth-to-the-place-shewn'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 23:20 — *Behold, I send an Angel before thee, to keep thee in the way, and to bring thee into the place which I have prepared.* The angel who bears the Name (the Yahoel of this Apocalypse) brings to the prepared place — the very mountain Abraham is told to go up to in 9:7.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa9_lookup sv, _session253_aoa9_lookup tv
 WHERE t.slug='apocalypse-of-abraham-9-go-forth-to-the-place-shewn'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 23:21 — *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him.* The Word by which Yahuah shews Abraham the ages in 9:7 is borne by the angel in whom the Name dwells — the Name-bearing guide of the called-out man.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa9_lookup sv, _session253_aoa9_lookup tv
 WHERE t.slug='apocalypse-of-abraham-9-go-forth-to-the-place-shewn'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

