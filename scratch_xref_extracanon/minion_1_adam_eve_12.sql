-- ----- fragment: minion_1adameve_12.sql (session253 1-adam-eve 12) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch12. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae12 (view _session253_1ae12_lookup). Sort band base 64275, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-12-night-of-mourning
  ('adam-eve-conflict', '1-adam-eve', 12, 1, 'canon', 'genesis', 3, 16, 'free', E'Genesis 3:16 — *Unto the woman he said, I will greatly multiply thy sorrow and thy conception; in sorrow thou shalt bring forth children; and thy desire shall be to thy husband, and he shall rule over thee.* The whole-night mourning of 1 Adam & Eve 12:1 is the sorrow Yahuah pronounced over Eve being lived out the first night beyond Eden.'),
  ('adam-eve-conflict', '1-adam-eve', 12, 1, 'canon', 'psalms', 30, 5, 'free', E'Psalms 30:5 — *For his anger endureth but a moment; in his favour is life: weeping may endure for a night, but joy cometh in the morning.* Adam and Eve sigh over the length of the night in 1 Adam & Eve 12:1, but Yahuah has already set the morning as the bound of their weeping.'),
  ('adam-eve-conflict', '1-adam-eve', 12, 1, 'canon', 'psalms', 107, 10, 'free', E'Psalms 107:10 — *Such as sit in darkness and in the shadow of death, being bound in affliction and iron;* describes precisely the estate of Adam and Eve mourning in the cave-dark of 1 Adam & Eve 12:1, the seed bound under the shadow until deliverance comes.'),
  -- thread: 1-adam-eve-12-adam-fallen-as-dead
  ('adam-eve-conflict', '1-adam-eve', 12, 2, 'canon', 'genesis', 3, 19, 'free', E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* Adam lying as dead in the cave (1 Adam & Eve 12:2) is the dust-sentence already pressing him toward the ground from which he was taken.'),
  ('adam-eve-conflict', '1-adam-eve', 12, 3, 'canon', 'psalms', 23, 4, 'free', E'Psalms 23:4 — *Yea, though I walk through the valley of the shadow of death, I will fear no evil: for thou art with me; thy rod and thy staff they comfort me.* Eve finding Adam like a corpse in the dark (1 Adam & Eve 12:3) is the valley of the shadow of death — yet Yahuah is with them in it.'),
  ('adam-eve-conflict', '1-adam-eve', 12, 2, 'canon', 'job', 33, 30, 'free', E'Job 33:30 — *To bring back his soul from the pit, to be enlightened with the light of the living.* Adam thrown down as dead in 1 Adam & Eve 12:2 is the very soul Yahuah purposes to bring back from the pit into the light of the living.'),
  -- thread: 1-adam-eve-12-word-raises-adam
  ('adam-eve-conflict', '1-adam-eve', 12, 6, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Elohim who comes and raises Adam in 1 Adam & Eve 12:6 is the eternal Logos, with Elohim and Himself Elohim from the beginning.'),
  ('adam-eve-conflict', '1-adam-eve', 12, 6, 'canon', 'john', 1, 4, 'free', E'John 1:4 — *In him was life; and the life was the light of men.* The Word who raises Adam from his death in 1 Adam & Eve 12:6 is the One in whom is the life — the very life He restores to the man lying as dead.'),
  ('adam-eve-conflict', '1-adam-eve', 12, 6, 'canon', 'john', 11, 25, 'free', E'John 11:25 — *Yahusha (Jesus) said unto her, I am the resurrection, and the life: he that believeth in me, though he were dead, yet shall he live:* The Word who raised the first Adam from his death (1 Adam & Eve 12:6) is the same who is the resurrection and the life made flesh.'),
  ('adam-eve-conflict', '1-adam-eve', 12, 6, 'canon', 'john', 5, 21, 'free', E'John 5:21 — *For as the Father raiseth up the dead, and quickeneth them; even so the Son quickeneth whom he will.* The Word raising Adam from his death in 1 Adam & Eve 12:6 shows the Son quickening the dead just as He chose to quicken the first man.'),
  -- thread: 1-adam-eve-12-light-departed-darkness
  ('adam-eve-conflict', '1-adam-eve', 12, 7, 'canon', 'genesis', 1, 2, 'free', E'Genesis 1:2 — *And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of Elohim (God) moved upon the face of the waters.* Adam''s complaint that light departed and darkness covered them (1 Adam & Eve 12:7) is the world feeling like the formless dark before Yahuah first spoke light.'),
  ('adam-eve-conflict', '1-adam-eve', 12, 10, 'canon', 'genesis', 1, 3, 'free', E'Genesis 1:3 — *And Elohim (God) said, Let there be light: and there was light.* The one bright light Adam recalls from the garden (1 Adam & Eve 12:10) is the light Elohim first called forth, now mourned as lost outside Eden.'),
  ('adam-eve-conflict', '1-adam-eve', 12, 8, 'canon', 'john', 1, 5, 'free', E'John 1:5 — *And the light shineth in darkness; and the darkness comprehended it not.* Adam asks where the darkness was before it covered them (1 Adam & Eve 12:8); the answer is the Word, the Light that shines on in darkness the dark cannot overtake.'),
  ('adam-eve-conflict', '1-adam-eve', 12, 9, 'canon', 'john', 8, 12, 'free', E'John 8:12 — *Then spake Yahusha (Jesus) again unto them, saying, I am the light of the world: he that followeth me shall not walk in darkness, but shall have the light of life.* Adam''s grief at never having known darkness in the garden (1 Adam & Eve 12:9) is answered by the Light of the world who frees men from walking in darkness.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-12-night-of-mourning',
       E'Weeping endures for a night',
       E'Outside the garden the first man knows the first long night: *Then Adam beat his chest, he and Eve, and they mourned the whole night until the crack of dawn, and they sighed over the length of the night* (1 Adam & Eve 12:1). This is the very sorrow Yahuah measured out in Eden''s sentence — *in sorrow thou shalt bring forth children* (Genesis 3:16) — yet the same mouth that cursed the ground set the bound of grief: *weeping may endure for a night, but joy cometh in the morning* (Psalms 30:5). Adam and Eve are made to *sit in darkness and in the shadow of death, being bound in affliction* (Psalms 107:10) — the seed of the woman already under the heel, awaiting the morning. It ain''t new: the night of tears and the promised dawn stand together from the first day out of the garden.',
       sv.verse_id, ev.verse_id, 'extras', 64275
  FROM _session253_1ae12_lookup sv, _session253_1ae12_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=12 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-12-adam-fallen-as-dead',
       E'He lay there as dead',
       E'Grief overwhelms the man until life itself seems to leave him: *And Adam beat himself, and threw himself on the ground in the cave, from bitter grief, and because of the darkness, and lay there as dead* (1 Adam & Eve 12:2), and Eve *felt about for him with her hands, and found him like a corpse* (12:3). This is the dust-sentence pressing down — *for dust thou art, and unto dust shalt thou return* (Genesis 3:19) — Satan''s striking at the seed of the woman, driving Adam toward the grave. Yet the man laid out as a corpse is the same who walks through *the valley of the shadow of death* and need not fear, *for thou art with me* (Psalms 23:4); Yahuah will *bring back his soul from the pit, to be enlightened with the light of the living* (Job 33:30). The serpent bruises the heel, but he shall not have the head.',
       sv.verse_id, ev.verse_id, 'extras', 64278
  FROM _session253_1ae12_lookup sv, _session253_1ae12_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=2
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=12 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-12-word-raises-adam',
       E'The Word of Elohim raised him from his death',
       E'When Adam lies as a corpse, deliverance comes not as a force but as a Person: *And the Word of Elohim came to Adam and raised him from his death, and opened Eve''s mouth that she might speak* (1 Adam & Eve 12:6), for *the merciful Yahuah looked on the death of Adam, and on Eve''s silence from fear of the darkness* (12:5). This is the Logos — *In the beginning was the Word, and the Word was with Elohim, and the Word was Elohim* (John 1:1) — *In him was life; and the life was the light of men* (John 1:4). The Word who raised the first Adam is He who would say, *I am the resurrection, and the life: he that believeth in me, though he were dead, yet shall he live* (John 11:25), for *as the Father raiseth up the dead, and quickeneth them; even so the Son quickeneth whom he will* (John 5:21). The same mercy that opened Eve''s mouth foretells the One who calls the dead forth by His voice. It ain''t new: the Word who saves Adam in the cave is the Word made flesh.',
       sv.verse_id, ev.verse_id, 'extras', 64281
  FROM _session253_1ae12_lookup sv, _session253_1ae12_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=12 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-12-light-departed-darkness',
       E'Why has light departed from us?',
       E'Risen, Adam frames the whole agony as the loss of the light he had known in Eden: *O Elohim, why has light departed from us, and darkness covered us?* (1 Adam & Eve 12:7); *For so long as we were in the garden, we neither saw nor even knew what darkness is* (12:9); *But she and I were both in one bright light. I saw her and she saw me. Yet now since we came into this cave, darkness has covered us, and separated us* (12:10). Adam laments a world fallen back toward the deep — *darkness was upon the face of the deep* (Genesis 1:2) — before Yahuah divided it: *Let there be light: and there was light* (Genesis 1:3). The answer to Adam''s cry is the Logos he does not yet see: *And the light shineth in darkness; and the darkness comprehended it not* (John 1:5), the One who declares *I am the light of the world: he that followeth me shall not walk in darkness, but shall have the light of life* (John 8:12). The bright light lost in Eden is restored in the Light who comes to seek the seed.',
       sv.verse_id, ev.verse_id, 'extras', 64284
  FROM _session253_1ae12_lookup sv, _session253_1ae12_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=7
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=12 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-12-night-of-mourning
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:16 — *Unto the woman he said, I will greatly multiply thy sorrow and thy conception; in sorrow thou shalt bring forth children; and thy desire shall be to thy husband, and he shall rule over thee.* The whole-night mourning of 1 Adam & Eve 12:1 is the sorrow Yahuah pronounced over Eve being lived out the first night beyond Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae12_lookup sv, _session253_1ae12_lookup tv
 WHERE t.slug='1-adam-eve-12-night-of-mourning'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 30:5 — *For his anger endureth but a moment; in his favour is life: weeping may endure for a night, but joy cometh in the morning.* Adam and Eve sigh over the length of the night in 1 Adam & Eve 12:1, but Yahuah has already set the morning as the bound of their weeping.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae12_lookup sv, _session253_1ae12_lookup tv
 WHERE t.slug='1-adam-eve-12-night-of-mourning'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=30 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 107:10 — *Such as sit in darkness and in the shadow of death, being bound in affliction and iron;* describes precisely the estate of Adam and Eve mourning in the cave-dark of 1 Adam & Eve 12:1, the seed bound under the shadow until deliverance comes.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae12_lookup sv, _session253_1ae12_lookup tv
 WHERE t.slug='1-adam-eve-12-night-of-mourning'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=107 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-12-adam-fallen-as-dead
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* Adam lying as dead in the cave (1 Adam & Eve 12:2) is the dust-sentence already pressing him toward the ground from which he was taken.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae12_lookup sv, _session253_1ae12_lookup tv
 WHERE t.slug='1-adam-eve-12-adam-fallen-as-dead'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 23:4 — *Yea, though I walk through the valley of the shadow of death, I will fear no evil: for thou art with me; thy rod and thy staff they comfort me.* Eve finding Adam like a corpse in the dark (1 Adam & Eve 12:3) is the valley of the shadow of death — yet Yahuah is with them in it.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae12_lookup sv, _session253_1ae12_lookup tv
 WHERE t.slug='1-adam-eve-12-adam-fallen-as-dead'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=23 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 33:30 — *To bring back his soul from the pit, to be enlightened with the light of the living.* Adam thrown down as dead in 1 Adam & Eve 12:2 is the very soul Yahuah purposes to bring back from the pit into the light of the living.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae12_lookup sv, _session253_1ae12_lookup tv
 WHERE t.slug='1-adam-eve-12-adam-fallen-as-dead'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=33 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-12-word-raises-adam
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Elohim who comes and raises Adam in 1 Adam & Eve 12:6 is the eternal Logos, with Elohim and Himself Elohim from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae12_lookup sv, _session253_1ae12_lookup tv
 WHERE t.slug='1-adam-eve-12-word-raises-adam'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:4 — *In him was life; and the life was the light of men.* The Word who raises Adam from his death in 1 Adam & Eve 12:6 is the One in whom is the life — the very life He restores to the man lying as dead.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae12_lookup sv, _session253_1ae12_lookup tv
 WHERE t.slug='1-adam-eve-12-word-raises-adam'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 11:25 — *Yahusha (Jesus) said unto her, I am the resurrection, and the life: he that believeth in me, though he were dead, yet shall he live:* The Word who raised the first Adam from his death (1 Adam & Eve 12:6) is the same who is the resurrection and the life made flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae12_lookup sv, _session253_1ae12_lookup tv
 WHERE t.slug='1-adam-eve-12-word-raises-adam'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=11 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 5:21 — *For as the Father raiseth up the dead, and quickeneth them; even so the Son quickeneth whom he will.* The Word raising Adam from his death in 1 Adam & Eve 12:6 shows the Son quickening the dead just as He chose to quicken the first man.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae12_lookup sv, _session253_1ae12_lookup tv
 WHERE t.slug='1-adam-eve-12-word-raises-adam'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-12-light-departed-darkness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:2 — *And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of Elohim (God) moved upon the face of the waters.* Adam''s complaint that light departed and darkness covered them (1 Adam & Eve 12:7) is the world feeling like the formless dark before Yahuah first spoke light.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae12_lookup sv, _session253_1ae12_lookup tv
 WHERE t.slug='1-adam-eve-12-light-departed-darkness'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 1:3 — *And Elohim (God) said, Let there be light: and there was light.* The one bright light Adam recalls from the garden (1 Adam & Eve 12:10) is the light Elohim first called forth, now mourned as lost outside Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae12_lookup sv, _session253_1ae12_lookup tv
 WHERE t.slug='1-adam-eve-12-light-departed-darkness'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 1:5 — *And the light shineth in darkness; and the darkness comprehended it not.* Adam asks where the darkness was before it covered them (1 Adam & Eve 12:8); the answer is the Word, the Light that shines on in darkness the dark cannot overtake.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae12_lookup sv, _session253_1ae12_lookup tv
 WHERE t.slug='1-adam-eve-12-light-departed-darkness'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 8:12 — *Then spake Yahusha (Jesus) again unto them, saying, I am the light of the world: he that followeth me shall not walk in darkness, but shall have the light of life.* Adam''s grief at never having known darkness in the garden (1 Adam & Eve 12:9) is answered by the Light of the world who frees men from walking in darkness.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae12_lookup sv, _session253_1ae12_lookup tv
 WHERE t.slug='1-adam-eve-12-light-departed-darkness'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

