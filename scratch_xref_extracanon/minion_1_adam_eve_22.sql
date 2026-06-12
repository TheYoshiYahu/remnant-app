-- ----- fragment: minion_1adameve_22.sql (session253 1-adam-eve 22) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch22. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae22 (view _session253_1ae22_lookup). Sort band base 64525, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae22_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-22-cursed-ground-affliction
  ('adam-eve-conflict', '1-adam-eve', 22, 1, 'canon', 'genesis', 3, 17, 'free', E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life;* The faintness and heat Adam laments in 1 Adam and Eve 22:1 are the lived edge of the curse on the ground pronounced at the gate.'),
  ('adam-eve-conflict', '1-adam-eve', 22, 3, 'canon', 'genesis', 3, 19, 'free', E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* Adam''s confession in 1 Adam and Eve 22:3 that in the garden he knew no heat, languor, or trembling is the exact reversal of this sweat-and-dust sentence.'),
  ('adam-eve-conflict', '1-adam-eve', 22, 1, 'canon', 'romans', 8, 22, 'free', E'Romans 8:22 — *For we know that the whole creation groaneth and travaileth in pain together until now.* Adam''s longing to be taken out to rest in 1 Adam and Eve 22:1 is the first voice of the creation that still groans for deliverance.'),
  -- thread: 1-adam-eve-22-light-and-grace-withdrawn
  ('adam-eve-conflict', '1-adam-eve', 22, 4, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The light and grace that rested on Adam while he kept the commandment in 1 Adam and Eve 22:4 are restored, full, in the Word made flesh.'),
  ('adam-eve-conflict', '1-adam-eve', 22, 4, 'canon', 'romans', 8, 19, 'free', E'Romans 8:19 — *For the earnest expectation of the creature waiteth for the manifestation of the sons of Elohim (God).* The sorrow that came over the land when Adam transgressed in 1 Adam and Eve 22:4 is the bondage all creation waits to be loosed from.'),
  -- thread: 1-adam-eve-22-tried-to-become-gods
  ('adam-eve-conflict', '1-adam-eve', 22, 5, 'canon', 'genesis', 3, 5, 'free', E'Genesis 3:5 — *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil.* Adam''s confession that they *tried to become gods like you* in 1 Adam and Eve 22:5 quotes back the serpent''s exact lie.'),
  ('adam-eve-conflict', '1-adam-eve', 22, 5, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The enemy who deceived Adam in 1 Adam and Eve 22:5 is the same disguised deceiver Paul warns the assembly still to dread.'),
  ('adam-eve-conflict', '1-adam-eve', 22, 5, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The Satan who deceived Adam in 1 Adam and Eve 22:5 is the enemy from the beginning whose works the manifested Son comes to destroy.'),
  -- thread: 1-adam-eve-22-i-will-take-it-on-myself-to-save-you
  ('adam-eve-conflict', '1-adam-eve', 22, 6, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Elohim''s vow to *take all this on Myself in order to save you* in 1 Adam and Eve 22:6 is the seed-promise of Eden, the bruised heel that crushes the serpent''s head.'),
  ('adam-eve-conflict', '1-adam-eve', 22, 6, 'canon', 'hebrews', 2, 14, 'free', E'Hebrews 2:14 — *Forasmuch then as the children are partakers of flesh and blood, he also himself likewise took part of the same; that through death he might destroy him that had the power of death, that is, the devil;* Yahuah''s taking Adam''s suffering *on Myself* in 1 Adam and Eve 22:6 is fulfilled when the Son takes Adam''s flesh to destroy the devil through his own death.'),
  ('adam-eve-conflict', '1-adam-eve', 22, 6, 'canon', 'galatians', 4, 4, 'free', E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The promise made to Adam in 1 Adam and Eve 22:6 to save him by taking it on Himself comes due in the fulness of time, the Son made of a woman.'),
  ('adam-eve-conflict', '1-adam-eve', 22, 6, 'canon', 'isaiah', 53, 4, 'free', E'Isaiah 53:4 — *Surely he hath borne our griefs, and carried our sorrows: yet we did esteem him stricken, smitten of Elohim (God), and afflicted.* The fear, languor, and suffering Yahuah promises to take on Himself in 1 Adam and Eve 22:6 are the griefs and sorrows the Servant bears as his own.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae22_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae22_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-22-cursed-ground-affliction',
       E'The heat, the languor, and the cursed ground',
       E'Adam, dried up in the heat of the world outside Eden, cries: *Then Adam said to Elohim (God), "I dry up in the heat, I am faint from walking, and I don''t want to be in this world. And I don''t know when You will take me out of it to rest."* (1 Adam and Eve 22:1), and again *"While I was in the garden I knew neither heat, nor languor, neither moving about, nor trembling, nor fear; but now since I came to this land, all this affliction has come over me."* (1 Adam and Eve 22:3). This is the very sentence pronounced at the gate: *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life;* (Genesis 3:17), and *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* (Genesis 3:19). Paul names the whole groaning creation that Adam first felt in his bones: *For we know that the whole creation groaneth and travaileth in pain together until now.* (Romans 8:22) — it ain''t new; the toil Adam mourns on the first day outside the garden is the bondage to vanity the whole world still waits to be loosed from.',
       sv.verse_id, ev.verse_id, 'extras', 64525
  FROM _session253_1ae22_lookup sv, _session253_1ae22_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=22 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-22-light-and-grace-withdrawn',
       E'While you kept My commandment, My light rested on you',
       E'Elohim answers Adam''s complaint by naming what was lost: *Then Elohim (God) said to Adam, "So long as you were keeping My commandment, My light and My grace rested on you. But when you transgressed My commandment, sorrow and misery came to you in this land."* (1 Adam and Eve 22:4). The withdrawn light is the glory the way back restores in the Word who carries it: *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* (John 1:14) — *full of grace and truth*, the grace Adam forfeited restored in the flesh. And the whole creation that lost its light waits with Adam: *For the earnest expectation of the creature waiteth for the manifestation of the sons of Elohim (God).* (Romans 8:19). Torah is here no curse but the keeping in which the light rested; the commandment is the covenant before Sinai.',
       sv.verse_id, ev.verse_id, 'extras', 64528
  FROM _session253_1ae22_lookup sv, _session253_1ae22_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=22 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-22-tried-to-become-gods',
       E'We tried to become gods, when Satan deceived us',
       E'Adam confesses the root of the fall by name: *And Adam cried and said, "O Yahuah (Lord), do not cut me off for this, neither punish me with heavy plagues, nor yet repay me according to my sin; for we, of our own will, transgressed Your commandment, and ignored Your law, and tried to become gods like you, when Satan the enemy deceived us."* (1 Adam and Eve 22:5). This is the serpent''s lie quoted back as confession: *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil.* (Genesis 3:5). It ain''t new — and the deceiver is the same liar still: *And no marvel; for Satan himself is transformed into an angel of light.* (2 Corinthians 11:14). The Son was manifested for exactly this enemy: *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* (1 John 3:8). Adam''s *of our own will* throws him on mercy, not law-as-curse, owning the seed-war as begun in his own house.',
       sv.verse_id, ev.verse_id, 'extras', 64531
  FROM _session253_1ae22_lookup sv, _session253_1ae22_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=5
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=22 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-22-i-will-take-it-on-myself-to-save-you',
       E'I will take all this on Myself in order to save you',
       E'The chapter closes on the gospel spoken at the dawn of the world: *Then Elohim (God) said again to Adam, "Because you have endured fear and trembling in this land, languor and suffering, treading and walking about, going on this mountain, and dying from it, I will take all this on Myself in order to save you."* (1 Adam and Eve 22:6). This is the seed-promise of Eden unfolded into incarnation: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15). He takes it *on Myself* by entering Adam''s own flesh: *Forasmuch then as the children are partakers of flesh and blood, he also himself likewise took part of the same; that through death he might destroy him that had the power of death, that is, the devil;* (Hebrews 2:14), and at the appointed hour: *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* (Galatians 4:4). The suffering Adam endured the Servant bears as his own: *Surely he hath borne our griefs, and carried our sorrows: yet we did esteem him stricken, smitten of Elohim (God), and afflicted.* (Isaiah 53:4). It ain''t new — the saving Word who comforts Adam on the first day is the Messiah foreordained before the foundation.',
       sv.verse_id, ev.verse_id, 'extras', 64534
  FROM _session253_1ae22_lookup sv, _session253_1ae22_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=6
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=22 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-22-cursed-ground-affliction
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life;* The faintness and heat Adam laments in 1 Adam and Eve 22:1 are the lived edge of the curse on the ground pronounced at the gate.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae22_lookup sv, _session253_1ae22_lookup tv
 WHERE t.slug='1-adam-eve-22-cursed-ground-affliction'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* Adam''s confession in 1 Adam and Eve 22:3 that in the garden he knew no heat, languor, or trembling is the exact reversal of this sweat-and-dust sentence.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae22_lookup sv, _session253_1ae22_lookup tv
 WHERE t.slug='1-adam-eve-22-cursed-ground-affliction'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 8:22 — *For we know that the whole creation groaneth and travaileth in pain together until now.* Adam''s longing to be taken out to rest in 1 Adam and Eve 22:1 is the first voice of the creation that still groans for deliverance.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae22_lookup sv, _session253_1ae22_lookup tv
 WHERE t.slug='1-adam-eve-22-cursed-ground-affliction'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-22-light-and-grace-withdrawn
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The light and grace that rested on Adam while he kept the commandment in 1 Adam and Eve 22:4 are restored, full, in the Word made flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae22_lookup sv, _session253_1ae22_lookup tv
 WHERE t.slug='1-adam-eve-22-light-and-grace-withdrawn'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 8:19 — *For the earnest expectation of the creature waiteth for the manifestation of the sons of Elohim (God).* The sorrow that came over the land when Adam transgressed in 1 Adam and Eve 22:4 is the bondage all creation waits to be loosed from.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae22_lookup sv, _session253_1ae22_lookup tv
 WHERE t.slug='1-adam-eve-22-light-and-grace-withdrawn'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-22-tried-to-become-gods
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:5 — *For Elohim (God) doth know that in the day ye eat thereof, then your eyes shall be opened, and ye shall be as gods, knowing good and evil.* Adam''s confession that they *tried to become gods like you* in 1 Adam and Eve 22:5 quotes back the serpent''s exact lie.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae22_lookup sv, _session253_1ae22_lookup tv
 WHERE t.slug='1-adam-eve-22-tried-to-become-gods'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The enemy who deceived Adam in 1 Adam and Eve 22:5 is the same disguised deceiver Paul warns the assembly still to dread.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae22_lookup sv, _session253_1ae22_lookup tv
 WHERE t.slug='1-adam-eve-22-tried-to-become-gods'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The Satan who deceived Adam in 1 Adam and Eve 22:5 is the enemy from the beginning whose works the manifested Son comes to destroy.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae22_lookup sv, _session253_1ae22_lookup tv
 WHERE t.slug='1-adam-eve-22-tried-to-become-gods'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-22-i-will-take-it-on-myself-to-save-you
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Elohim''s vow to *take all this on Myself in order to save you* in 1 Adam and Eve 22:6 is the seed-promise of Eden, the bruised heel that crushes the serpent''s head.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae22_lookup sv, _session253_1ae22_lookup tv
 WHERE t.slug='1-adam-eve-22-i-will-take-it-on-myself-to-save-you'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 2:14 — *Forasmuch then as the children are partakers of flesh and blood, he also himself likewise took part of the same; that through death he might destroy him that had the power of death, that is, the devil;* Yahuah''s taking Adam''s suffering *on Myself* in 1 Adam and Eve 22:6 is fulfilled when the Son takes Adam''s flesh to destroy the devil through his own death.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae22_lookup sv, _session253_1ae22_lookup tv
 WHERE t.slug='1-adam-eve-22-i-will-take-it-on-myself-to-save-you'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The promise made to Adam in 1 Adam and Eve 22:6 to save him by taking it on Himself comes due in the fulness of time, the Son made of a woman.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae22_lookup sv, _session253_1ae22_lookup tv
 WHERE t.slug='1-adam-eve-22-i-will-take-it-on-myself-to-save-you'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 53:4 — *Surely he hath borne our griefs, and carried our sorrows: yet we did esteem him stricken, smitten of Elohim (God), and afflicted.* The fear, languor, and suffering Yahuah promises to take on Himself in 1 Adam and Eve 22:6 are the griefs and sorrows the Servant bears as his own.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae22_lookup sv, _session253_1ae22_lookup tv
 WHERE t.slug='1-adam-eve-22-i-will-take-it-on-myself-to-save-you'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=22 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

