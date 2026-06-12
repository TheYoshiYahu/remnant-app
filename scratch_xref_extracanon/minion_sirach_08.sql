-- ----- fragment: minion_ecclesiasticus_08.sql (session253 ecclesiasticus 8) -----
-- Source anchor: apocrypha/ecclesiasticus ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir08 (view _session253_sir08_lookup). Sort band base 58475, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-8-strive-not-with-the-angry
  ('apocrypha', 'ecclesiasticus', 8, 1, 'canon', 'proverbs', 22, 24, 'free', E'Proverbs 22:24 — *Make no friendship with an angry man; and with a furious man thou shalt not go:* The same charge Ben Sira gives in Sirach 8:1,16 — keep no fellowship with the violent or the powerful who will overpower you.'),
  ('apocrypha', 'ecclesiasticus', 8, 16, 'canon', 'proverbs', 22, 25, 'free', E'Proverbs 22:25 — *Lest thou learn his ways, and get a snare to thy soul.* Why not walk into a solitary place with the angry man of Sirach 8:16 — his ways become a snare and overthrow you where there is no help.'),
  ('apocrypha', 'ecclesiasticus', 8, 16, 'canon', 'proverbs', 13, 20, 'free', E'Proverbs 13:20 — *He that walketh with wise men shall be wise: but a companion of fools shall be destroyed.* The traveling-companion warning of Sirach 8:15-16 is the same: walk with the bold and angry and you perish with them through their folly.'),
  -- thread: ecclesiasticus-8-contend-not-with-the-loud
  ('apocrypha', 'ecclesiasticus', 8, 3, 'canon', 'proverbs', 26, 20, 'free', E'Proverbs 26:20 — *Where no wood is, there the fire goeth out: so where there is no talebearer, the strife ceaseth.* The very image of Sirach 8:3,10 — withhold the wood, refuse to kindle the coals, and the sinner''s fire dies down.'),
  ('apocrypha', 'ecclesiasticus', 8, 11, 'canon', 'matthew', 5, 25, 'free', E'Matthew 5:25 — *Agree with thine adversary quickly, whiles thou art in the way with him; lest at any time the adversary deliver thee to the judge, and the judge deliver thee to the officer, and thou be cast into prison.* The Sermon on the Mount carries Sirach 8:11''s wisdom — do not rise up to be entrapped in words; settle quickly before judgment falls.'),
  -- thread: ecclesiasticus-8-reproach-not-we-are-all-worthy
  ('apocrypha', 'ecclesiasticus', 8, 5, 'canon', 'ecclesiastes', 7, 20, 'free', E'Ecclesiastes 7:20 — *For there is not a just man upon earth, that doeth good, and sinneth not.* The ground of Sirach 8:5 — do not reproach the one turning from sin, for there is no sinless man to cast the stone.'),
  ('apocrypha', 'ecclesiasticus', 8, 5, 'canon', 'romans', 3, 23, 'free', E'Romans 3:23 — *For all have sinned, and come short of the glory of Elohim (God);* Sha''ul states Sirach 8:5''s "we are all worthy of punishment" as the gospel premise — all alike need mercy, so none may despise the penitent.'),
  ('apocrypha', 'ecclesiasticus', 8, 5, 'canon', 'matthew', 7, 1, 'free', E'Matthew 7:1 — *Judge not, that ye be not judged.* The Messiah commands what Sirach 8:5 counsels — refuse the reproach that forgets you too stand under judgment.'),
  ('apocrypha', 'ecclesiasticus', 8, 5, 'canon', 'galatians', 6, 1, 'free', E'Galatians 6:1 — *Brethren, if a man be overtaken in a fault, ye which are spiritual, restore such an one in the spirit of meekness; considering thyself, lest thou also be tempted.* The restoring meekness of Sirach 8:5 — handle the one who turns from sin gently, remembering your own frailty.'),
  -- thread: ecclesiasticus-8-honour-the-old-and-the-dead
  ('apocrypha', 'ecclesiasticus', 8, 6, 'canon', 'leviticus', 19, 32, 'free', E'Leviticus 19:32 — *Thou shalt rise up before the hoary head, and honour the face of the old man, and fear thy Elohim (God): I am Yahuah (LORD).* Torah itself underwrites Sirach 8:6 — honour the aged, for the fear of Yahuah binds it.'),
  ('apocrypha', 'ecclesiasticus', 8, 6, 'canon', 'proverbs', 16, 31, 'free', E'Proverbs 16:31 — *The hoary head is a crown of glory, if it be found in the way of righteousness.* Why dishonour not old age (Sirach 8:6) — the grey head is a crown, not a thing to be despised.'),
  ('apocrypha', 'ecclesiasticus', 8, 7, 'canon', 'proverbs', 24, 17, 'free', E'Proverbs 24:17 — *Rejoice not when thine enemy falleth, and let not thine heart be glad when he stumbleth:* The exact restraint of Sirach 8:7 — no gloating over the fallen foe, for we die all.'),
  -- thread: ecclesiasticus-8-despise-not-the-wise-and-the-elders
  ('apocrypha', 'ecclesiasticus', 8, 8, 'canon', 'proverbs', 1, 5, 'free', E'Proverbs 1:5 — *A wise man will hear, and will increase learning; and a man of understanding shall attain unto wise counsels:* The teachableness Sirach 8:8 commands — acquaint yourself with the proverbs of the wise and your learning increases.'),
  ('apocrypha', 'ecclesiasticus', 8, 9, 'canon', 'job', 12, 12, 'free', E'Job 12:12 — *With the ancient is wisdom; and in length of days understanding.* Why miss not the discourse of the elders (Sirach 8:9) — they learned of their fathers, and length of days carries understanding.'),
  ('apocrypha', 'ecclesiasticus', 8, 8, 'apocrypha', 'ecclesiasticus', 6, 34, 'extras', E'Ecclesiasticus 6:34 — *Stand in the multitude of the elders; and cleave to him that is wise.* Ben Sira''s own earlier charge, repeated here in Sirach 8:8-9 — keep company with the wise and the elders and learn.'),
  ('apocrypha', 'ecclesiasticus', 8, 8, 'apocrypha', 'the-wisdom-of-solomon', 6, 11, 'extras', E'Wisdom of Solomon 6:11 — *Wherefore set your affection upon my words; desire them, and you shall be instructed.* The sister wisdom-book echoes Sirach 8:8 — do not despise the discourse of the wise but set your affection on it and be instructed.'),
  -- thread: ecclesiasticus-8-keep-counsel-and-secrets
  ('apocrypha', 'ecclesiasticus', 8, 19, 'canon', 'proverbs', 11, 13, 'free', E'Proverbs 11:13 — *A talebearer revealeth secrets: but he that is of a faithful spirit concealeth the matter.* Why open not your heart to every man (Sirach 8:19) — the talebearer reveals what the faithful conceal.'),
  ('apocrypha', 'ecclesiasticus', 8, 18, 'canon', 'proverbs', 25, 9, 'free', E'Proverbs 25:9 — *Debate thy cause with thy neighbour himself; and discover not a secret to another:* The exact caution of Sirach 8:18 — do no secret thing before a stranger; keep the matter between the two concerned.'),
  ('apocrypha', 'ecclesiasticus', 8, 17, 'canon', 'proverbs', 11, 14, 'free', E'Proverbs 11:14 — *Where no counsel is, the people fall: but in the multitude of counsellors there is safety.* Sirach 8:17 says consult not with a fool who cannot keep counsel — but Proverbs keeps the door open to the safety found in many wise counsellors.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-8-strive-not-with-the-angry',
       E'Strive not with a mighty or an angry man',
       E'Ben Sira opens the chapter with the wisdom of choosing one''s battles: *Strive not with a mighty man’ lest you fall into his hands.* (Ecclesiasticus 8:1), and again, *Strive not with an angry man, and go not with him into a solitary place: for blood is as nothing in his sight, and where there is no help, he will overthrow you.* (Ecclesiasticus 8:16). It ain''t new — this is Proverbs'' counsel almost word for word: *Make no friendship with an angry man; and with a furious man thou shalt not go:* (Proverbs 22:24), *Lest thou learn his ways, and get a snare to thy soul.* (Proverbs 22:25). The company a man keeps shapes his soul, so the wise weigh whom they walk beside: *He that walketh with wise men shall be wise: but a companion of fools shall be destroyed.* (Proverbs 13:20).',
       sv.verse_id, ev.verse_id, 'extras', 58475
  FROM _session253_sir08_lookup sv, _session253_sir08_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=8 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-8-contend-not-with-the-loud',
       E'Heap not wood upon his fire',
       E'Against the loud and the inflaming Ben Sira counsels silence: *Strive not with a man that is full of tongue, and heap not wood upon his fire.* (Ecclesiasticus 8:3), and *Kindle not the coals of a sinner, lest you be burnt with the flame of his fire.* (Ecclesiasticus 8:10). The strife is starved when its fuel is withheld — exactly Solomon''s proverb: *Where no wood is, there the fire goeth out: so where there is no talebearer, the strife ceaseth.* (Proverbs 26:20). And the angry man''s quarrel is not a place to linger but to leave: *Rise not up in anger at the presence of an injurious person, lest he lie in wait to entrap you in your words* (Ecclesiasticus 8:11) — Yeshua of Nazareth would say it as a kingdom command, *Agree with thine adversary quickly, whiles thou art in the way with him; lest at any time the adversary deliver thee to the judge, and the judge deliver thee to the officer, and thou be cast into prison.* (Matthew 5:25).',
       sv.verse_id, ev.verse_id, 'extras', 58478
  FROM _session253_sir08_lookup sv, _session253_sir08_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=8 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-8-reproach-not-we-are-all-worthy',
       E'Reproach not — we are all worthy of punishment',
       E'Ben Sira tempers every rebuke with a mirror: *Reproach not a man that turns from sin, but remember that we are all worthy of punishment.* (Ecclesiasticus 8:5). None stands clean enough to despise the penitent — *For there is not a just man upon earth, that doeth good, and sinneth not.* (Ecclesiastes 7:20), and Sha''ul gathers it into the gospel: *For all have sinned, and come short of the glory of Elohim (God);* (Romans 3:23). The Messiah forbids the contemptuous judgment that forgets its own debt — *Judge not, that ye be not judged.* (Matthew 7:1) — and Sha''ul shows the gentle way to restore the one who turns: *Brethren, if a man be overtaken in a fault, ye which are spiritual, restore such an one in the spirit of meekness; considering thyself, lest thou also be tempted.* (Galatians 6:1).',
       sv.verse_id, ev.verse_id, 'extras', 58481
  FROM _session253_sir08_lookup sv, _session253_sir08_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=8 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-8-honour-the-old-and-the-dead',
       E'Dishonour not old age; rejoice not over the dead',
       E'The fear of Yahuah teaches reverence for grey hairs and restraint at a fallen enemy: *Dishonour not a man in his old age: for even some of us wax old.* (Ecclesiasticus 8:6), and *Rejoice not over your greatest enemy being dead, but remember that we die all.* (Ecclesiasticus 8:7). Torah wrote the honour of age into the covenant: *Thou shalt rise up before the hoary head, and honour the face of the old man, and fear thy Elohim (God): I am Yahuah (LORD).* (Leviticus 19:32), and the proverb crowns it — *The hoary head is a crown of glory, if it be found in the way of righteousness.* (Proverbs 16:31). As for the dead foe, Solomon forbids the glad heart that Ben Sira forbids: *Rejoice not when thine enemy falleth, and let not thine heart be glad when he stumbleth:* (Proverbs 24:17).',
       sv.verse_id, ev.verse_id, 'extras', 58484
  FROM _session253_sir08_lookup sv, _session253_sir08_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=8 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-8-despise-not-the-wise-and-the-elders',
       E'Despise not the discourse of the wise and the elders',
       E'The heart of the chapter is the counsel to sit and learn: *Despise not the discourse of the wise, but acquaint thyself with their proverbs: for of them you shall learn instruction, and how to serve great men with ease.* (Ecclesiasticus 8:8), and *Miss not the discourse of the elders: for they also learned of their fathers, and of them you shall learn understanding, and to give answer as need requires.* (Ecclesiasticus 8:9). It ain''t new — Proverbs makes the teachable man wise: *A wise man will hear, and will increase learning; and a man of understanding shall attain unto wise counsels:* (Proverbs 1:5), and Job sets wisdom with the aged: *With the ancient is wisdom; and in length of days understanding.* (Job 12:12). Ben Sira had already pressed it in his own book — *Stand in the multitude of the elders; and cleave to him that is wise.* (Ecclesiasticus 6:34) — and Wisdom of Solomon answers with the same affection: *Wherefore set your affection upon my words; desire them, and you shall be instructed.* (Wisdom of Solomon 6:11).',
       sv.verse_id, ev.verse_id, 'extras', 58487
  FROM _session253_sir08_lookup sv, _session253_sir08_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=8 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-8-keep-counsel-and-secrets',
       E'Open not your heart to every man',
       E'Ben Sira closes with prudence in speech and trust: *Consult not with a fool; for he cannot keep counsel.* (Ecclesiasticus 8:17), *Do no secret thing before a stranger; for you know not what he will bring forth.* (Ecclesiasticus 8:18), and *Open not yours heart to every man, lest he requite you with a shrewd turn.* (Ecclesiasticus 8:19). Solomon''s wisdom is the same — guard the matter, and keep the dispute close: *A talebearer revealeth secrets: but he that is of a faithful spirit concealeth the matter.* (Proverbs 11:13), *Debate thy cause with thy neighbour himself; and discover not a secret to another:* (Proverbs 25:9). Yet counsel itself is not abandoned, only rightly placed: *Where no counsel is, the people fall: but in the multitude of counsellors there is safety.* (Proverbs 11:14).',
       sv.verse_id, ev.verse_id, 'extras', 58490
  FROM _session253_sir08_lookup sv, _session253_sir08_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=8 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-8-strive-not-with-the-angry
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 22:24 — *Make no friendship with an angry man; and with a furious man thou shalt not go:* The same charge Ben Sira gives in Sirach 8:1,16 — keep no fellowship with the violent or the powerful who will overpower you.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-strive-not-with-the-angry'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=22 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 22:25 — *Lest thou learn his ways, and get a snare to thy soul.* Why not walk into a solitary place with the angry man of Sirach 8:16 — his ways become a snare and overthrow you where there is no help.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-strive-not-with-the-angry'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=22 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 13:20 — *He that walketh with wise men shall be wise: but a companion of fools shall be destroyed.* The traveling-companion warning of Sirach 8:15-16 is the same: walk with the bold and angry and you perish with them through their folly.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-strive-not-with-the-angry'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=13 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-8-contend-not-with-the-loud
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 26:20 — *Where no wood is, there the fire goeth out: so where there is no talebearer, the strife ceaseth.* The very image of Sirach 8:3,10 — withhold the wood, refuse to kindle the coals, and the sinner''s fire dies down.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-contend-not-with-the-loud'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=26 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 5:25 — *Agree with thine adversary quickly, whiles thou art in the way with him; lest at any time the adversary deliver thee to the judge, and the judge deliver thee to the officer, and thou be cast into prison.* The Sermon on the Mount carries Sirach 8:11''s wisdom — do not rise up to be entrapped in words; settle quickly before judgment falls.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-contend-not-with-the-loud'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-8-reproach-not-we-are-all-worthy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiastes 7:20 — *For there is not a just man upon earth, that doeth good, and sinneth not.* The ground of Sirach 8:5 — do not reproach the one turning from sin, for there is no sinless man to cast the stone.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-reproach-not-we-are-all-worthy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=7 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 3:23 — *For all have sinned, and come short of the glory of Elohim (God);* Sha''ul states Sirach 8:5''s "we are all worthy of punishment" as the gospel premise — all alike need mercy, so none may despise the penitent.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-reproach-not-we-are-all-worthy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=3 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 7:1 — *Judge not, that ye be not judged.* The Messiah commands what Sirach 8:5 counsels — refuse the reproach that forgets you too stand under judgment.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-reproach-not-we-are-all-worthy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Galatians 6:1 — *Brethren, if a man be overtaken in a fault, ye which are spiritual, restore such an one in the spirit of meekness; considering thyself, lest thou also be tempted.* The restoring meekness of Sirach 8:5 — handle the one who turns from sin gently, remembering your own frailty.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-reproach-not-we-are-all-worthy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-8-honour-the-old-and-the-dead
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:32 — *Thou shalt rise up before the hoary head, and honour the face of the old man, and fear thy Elohim (God): I am Yahuah (LORD).* Torah itself underwrites Sirach 8:6 — honour the aged, for the fear of Yahuah binds it.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-honour-the-old-and-the-dead'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 16:31 — *The hoary head is a crown of glory, if it be found in the way of righteousness.* Why dishonour not old age (Sirach 8:6) — the grey head is a crown, not a thing to be despised.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-honour-the-old-and-the-dead'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 24:17 — *Rejoice not when thine enemy falleth, and let not thine heart be glad when he stumbleth:* The exact restraint of Sirach 8:7 — no gloating over the fallen foe, for we die all.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-honour-the-old-and-the-dead'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=24 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-8-despise-not-the-wise-and-the-elders
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 1:5 — *A wise man will hear, and will increase learning; and a man of understanding shall attain unto wise counsels:* The teachableness Sirach 8:8 commands — acquaint yourself with the proverbs of the wise and your learning increases.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-despise-not-the-wise-and-the-elders'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 12:12 — *With the ancient is wisdom; and in length of days understanding.* Why miss not the discourse of the elders (Sirach 8:9) — they learned of their fathers, and length of days carries understanding.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-despise-not-the-wise-and-the-elders'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=12 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 6:34 — *Stand in the multitude of the elders; and cleave to him that is wise.* Ben Sira''s own earlier charge, repeated here in Sirach 8:8-9 — keep company with the wise and the elders and learn.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-despise-not-the-wise-and-the-elders'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=6 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 6:11 — *Wherefore set your affection upon my words; desire them, and you shall be instructed.* The sister wisdom-book echoes Sirach 8:8 — do not despise the discourse of the wise but set your affection on it and be instructed.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-despise-not-the-wise-and-the-elders'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-8-keep-counsel-and-secrets
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 11:13 — *A talebearer revealeth secrets: but he that is of a faithful spirit concealeth the matter.* Why open not your heart to every man (Sirach 8:19) — the talebearer reveals what the faithful conceal.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-keep-counsel-and-secrets'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 25:9 — *Debate thy cause with thy neighbour himself; and discover not a secret to another:* The exact caution of Sirach 8:18 — do no secret thing before a stranger; keep the matter between the two concerned.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-keep-counsel-and-secrets'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=25 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 11:14 — *Where no counsel is, the people fall: but in the multitude of counsellors there is safety.* Sirach 8:17 says consult not with a fool who cannot keep counsel — but Proverbs keeps the door open to the safety found in many wise counsellors.'
  FROM cross_reference_threads t, cross_references x, _session253_sir08_lookup sv, _session253_sir08_lookup tv
 WHERE t.slug='ecclesiasticus-8-keep-counsel-and-secrets'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=8 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

