-- ----- fragment: minion_apocalypseofabraham_23.sql (session253 apocalypse-of-abraham 23) -----
-- Source anchor: apocalypse-of-abraham/apocalypse-of-abraham ch23. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: aoa23 (view _session253_aoa23_lookup). Sort band base 67550, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_aoa23_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: apocalypse-of-abraham-23-tree-eve-serpent
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 23, 3, 'canon', 'genesis', 3, 1, 'free', E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* The serpent in form behind the tree in Abraham''s vision is this same subtil beast that questioned the woman in the Garden.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 23, 4, 'canon', 'genesis', 3, 6, 'free', E'Genesis 3:6 — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* Abraham sees the very eating Moses recorded — both the man and the woman taking the fruit of the tree.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 23, 4, 'canon', '2-corinthians', 11, 3, 'free', E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* The serpent beguiling Eve under the tree is the same deception Sha''ul warns is still at work on the mind.'),
  -- thread: apocalypse-of-abraham-23-azazel-between-them
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 23, 6, 'enoch', '1-enoch', 10, 4, 'extras', E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* The Azazel standing between Adam and Eve in Abraham''s vision is the same fallen Watcher whom Enoch saw bound and cast into the darkness.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 23, 6, 'enoch', '1-enoch', 10, 8, 'extras', E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.''* Abraham''s word that Azazel is ''the beginning on the way to perdition'' matches Enoch''s verdict that to Azazel is ascribed all the corruption of the earth.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 23, 6, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The serpent-formed Azazel between the pair is unveiled by John as that old serpent who deceiveth the whole world.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 23, 6, 'canon', 'leviticus', 16, 8, 'free', E'Leviticus 16:8 — *And Aaron shall cast lots upon the two goats; one lot for Yahuah (LORD), and the other lot for the scapegoat.* The name Azazel is no invention of Abraham''s vision — Torah set it as the lot opposed to Yahuah on the Day of Atonement.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 23, 6, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Azazel the ungodly one belongs to the fallen angels Jude says are reserved in chains under darkness for the judgment.'),
  -- thread: apocalypse-of-abraham-23-evil-chosen-not-forced
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 23, 9, 'canon', 'james', 1, 13, 'free', E'James 1:13 — *Let no man say when he is tempted, I am tempted of Elohim (God): for Elohim (God) cannot be tempted with evil, neither tempteth he any man:* The Eternal''s word that He gives the tempter power only over them who will to do evil keeps the same line Ya''akov draws — Elohim tempts no man.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 23, 9, 'canon', 'james', 1, 14, 'free', E'James 1:14 — *But every man is tempted, when he is drawn away of his own lust, and enticed.* Abraham hears that the power falls upon those who will the evil — the man drawn away of his own lust, just as Ya''akov teaches.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 23, 11, 'canon', 'deuteronomy', 30, 15, 'free', E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* Abraham''s struggle over why evil should be desired meets Moses'' charge that life and death, good and evil, are set before man to choose.'),
  ('apocalypse-of-abraham', 'apocalypse-of-abraham', 23, 11, 'canon', 'deuteronomy', 30, 19, 'free', E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* The desire of evil that angers the Eternal is answered by the covenant call to choose life, that the seed may live.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_aoa23_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_aoa23_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-23-tree-eve-serpent',
       E'The Man, the Woman, and the Serpent Under the Tree',
       E'Abraham is shown the fall as a living picture: *And I saw there a man very great in height and fearful in breadth, incomparable in aspect, embracing a woman, who likewise approximated to the aspect and shape of the man.* (Apocalypse of Abraham 23:3) — *And they were standing under a tree of the Garden of Eden, and the fruit of this tree was like the appearance of a bunch of grapes of the vine, and behind the tree was standing as it were a serpent in form... and both were eating it whom I had seen embracing.* (Apocalypse of Abraham 23:4) It ain''t new — this is Eden retold. *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* (Genesis 3:1) The eating that undid the pair: *And when the woman saw that the tree was good for food... she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* (Genesis 3:6) Sha''ul reads the same scene as a present peril: *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* (2 Corinthians 11:3)',
       sv.verse_id, ev.verse_id, 'extras', 67550
  FROM _session253_aoa23_lookup sv, _session253_aoa23_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=23 AND sv.verse_number=3
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=23 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-23-azazel-between-them',
       E'Azazel Between Them — the Old Serpent, the Fallen Watcher',
       E'The figure between the embracing pair is named: *but he who is between them representeth ungodliness, their beginning on the way to perdition, even Azazel.* (Apocalypse of Abraham 23:6) The serpent of Eden is unmasked as the rebel spirit — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* (Revelation 12:9) This Azazel is no new villain; the Watchers'' chief is bound by the very name in the live witness of Enoch: *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness... and let him abide there for ever.* (1 Enoch 10:4) *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.* (1 Enoch 10:8) Torah already set his name and his lot apart: *And Aaron shall cast lots upon the two goats; one lot for Yahuah (LORD), and the other lot for the scapegoat.* (Leviticus 16:8) And the apostate angels await the same judgment: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* (Jude 1:6)',
       sv.verse_id, ev.verse_id, 'extras', 67553
  FROM _session253_aoa23_lookup sv, _session253_aoa23_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=23 AND sv.verse_number=6
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=23 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'apocalypse-of-abraham-23-evil-chosen-not-forced',
       E'Power Over Them That Will to Do Evil',
       E'Abraham presses the hard question of why such power was given, and the answer guards the freedom of the will: *And He said to me: "They who will to do evil — and how much I hated it in those who do it! — over them I gave him power, and to be beloved of them."* (Apocalypse of Abraham 23:9) Evil is not laid upon a man from above but is chosen by his own desire — it ain''t new. *Let no man say when he is tempted, I am tempted of Elohim (God): for Elohim (God) cannot be tempted with evil, neither tempteth he any man:* (James 1:13) *But every man is tempted, when he is drawn away of his own lust, and enticed.* (James 1:14) And Moses set the same choice before the seed at the threshold of the land: *See, I have set before thee this day life and good, and death and evil;* (Deuteronomy 30:15) *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* (Deuteronomy 30:19)',
       sv.verse_id, ev.verse_id, 'extras', 67556
  FROM _session253_aoa23_lookup sv, _session253_aoa23_lookup ev
 WHERE sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=23 AND sv.verse_number=8
   AND ev.edition_slug='apocalypse-of-abraham' AND ev.book_slug='apocalypse-of-abraham' AND ev.chapter_number=23 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: apocalypse-of-abraham-23-tree-eve-serpent
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* The serpent in form behind the tree in Abraham''s vision is this same subtil beast that questioned the woman in the Garden.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa23_lookup sv, _session253_aoa23_lookup tv
 WHERE t.slug='apocalypse-of-abraham-23-tree-eve-serpent'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=23 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:6 — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* Abraham sees the very eating Moses recorded — both the man and the woman taking the fruit of the tree.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa23_lookup sv, _session253_aoa23_lookup tv
 WHERE t.slug='apocalypse-of-abraham-23-tree-eve-serpent'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=23 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Corinthians 11:3 — *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ).* The serpent beguiling Eve under the tree is the same deception Sha''ul warns is still at work on the mind.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa23_lookup sv, _session253_aoa23_lookup tv
 WHERE t.slug='apocalypse-of-abraham-23-tree-eve-serpent'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=23 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-23-azazel-between-them
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 10:4 — *And again Yahuah (God) said to Raphael: ''Bind Azâzêl hand and foot, and cast him into the darkness: and make an opening in the desert, which is in Dûdâêl, and cast him therein.* The Azazel standing between Adam and Eve in Abraham''s vision is the same fallen Watcher whom Enoch saw bound and cast into the darkness.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa23_lookup sv, _session253_aoa23_lookup tv
 WHERE t.slug='apocalypse-of-abraham-23-azazel-between-them'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=23 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 10:8 — *And the whole earth has been corrupted through the works that were taught by Azâzêl: to him ascribe all sin.''* Abraham''s word that Azazel is ''the beginning on the way to perdition'' matches Enoch''s verdict that to Azazel is ascribed all the corruption of the earth.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa23_lookup sv, _session253_aoa23_lookup tv
 WHERE t.slug='apocalypse-of-abraham-23-azazel-between-them'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=23 AND sv.verse_number=6
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The serpent-formed Azazel between the pair is unveiled by John as that old serpent who deceiveth the whole world.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa23_lookup sv, _session253_aoa23_lookup tv
 WHERE t.slug='apocalypse-of-abraham-23-azazel-between-them'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=23 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 16:8 — *And Aaron shall cast lots upon the two goats; one lot for Yahuah (LORD), and the other lot for the scapegoat.* The name Azazel is no invention of Abraham''s vision — Torah set it as the lot opposed to Yahuah on the Day of Atonement.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa23_lookup sv, _session253_aoa23_lookup tv
 WHERE t.slug='apocalypse-of-abraham-23-azazel-between-them'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=23 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=16 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Azazel the ungodly one belongs to the fallen angels Jude says are reserved in chains under darkness for the judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa23_lookup sv, _session253_aoa23_lookup tv
 WHERE t.slug='apocalypse-of-abraham-23-azazel-between-them'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=23 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: apocalypse-of-abraham-23-evil-chosen-not-forced
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 1:13 — *Let no man say when he is tempted, I am tempted of Elohim (God): for Elohim (God) cannot be tempted with evil, neither tempteth he any man:* The Eternal''s word that He gives the tempter power only over them who will to do evil keeps the same line Ya''akov draws — Elohim tempts no man.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa23_lookup sv, _session253_aoa23_lookup tv
 WHERE t.slug='apocalypse-of-abraham-23-evil-chosen-not-forced'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=23 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 1:14 — *But every man is tempted, when he is drawn away of his own lust, and enticed.* Abraham hears that the power falls upon those who will the evil — the man drawn away of his own lust, just as Ya''akov teaches.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa23_lookup sv, _session253_aoa23_lookup tv
 WHERE t.slug='apocalypse-of-abraham-23-evil-chosen-not-forced'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=23 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 30:15 — *See, I have set before thee this day life and good, and death and evil;* Abraham''s struggle over why evil should be desired meets Moses'' charge that life and death, good and evil, are set before man to choose.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa23_lookup sv, _session253_aoa23_lookup tv
 WHERE t.slug='apocalypse-of-abraham-23-evil-chosen-not-forced'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=23 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 30:19 — *I call heaven and earth to record this day against you, that I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live:* The desire of evil that angers the Eternal is answered by the covenant call to choose life, that the seed may live.'
  FROM cross_reference_threads t, cross_references x, _session253_aoa23_lookup sv, _session253_aoa23_lookup tv
 WHERE t.slug='apocalypse-of-abraham-23-evil-chosen-not-forced'
   AND sv.edition_slug='apocalypse-of-abraham' AND sv.book_slug='apocalypse-of-abraham' AND sv.chapter_number=23 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

