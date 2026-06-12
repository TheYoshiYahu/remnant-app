-- ----- fragment: minion_2esdras_09.sql (session253 2-esdras 9) -----
-- Source anchor: apocrypha/2-esdras ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2esd9 (view _session253_2esd9_lookup). Sort band base 63200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2esd9_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-esdras-9-signs-of-the-end
  ('apocrypha', '2-esdras', 9, 3, 'canon', 'matthew', 24, 7, 'free', E'Matthew 24:7 — *For nation shall rise against nation, and kingdom against kingdom: and there shall be famines, and pestilences, and earthquakes, in divers places.* The earthquakes and uproars of the peoples that mark Ezra''s hour are the very birth-pangs Yahusha names before the visitation of 2 Esdras 9:3.'),
  ('apocrypha', '2-esdras', 9, 2, 'canon', 'matthew', 24, 14, 'free', E'Matthew 24:14 — *And this gospel of the kingdom shall be preached in all the world for a witness unto all nations; and then shall the end come.* As the Highest will *begin to visit the world* once the signs are read, so the end comes only after the witness is borne in 2 Esdras 9:2.'),
  ('apocrypha', '2-esdras', 9, 5, 'canon', 'daniel', 12, 1, 'free', E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* The manifest end with its plain beginning and ending of 2 Esdras 9:5 is Daniel''s time of trouble whose deliverance is for the written remnant.'),
  -- thread: 2-esdras-9-saved-by-works-and-faith
  ('apocrypha', '2-esdras', 9, 7, 'canon', 'matthew', 7, 14, 'free', E'Matthew 7:14 — *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* The few who *escape by his works, and by faith* in 2 Esdras 9:7 are the few that find the narrow way to life.'),
  ('apocrypha', '2-esdras', 9, 7, 'canon', 'matthew', 7, 21, 'free', E'Matthew 7:21 — *Not every one that saith unto me, Yahuah (Lord), Yahuah (Lord), shall enter into the kingdom of heaven; but he that doeth the will of my Father which is in heaven.* Ezra''s salvation *by his works, and by faith* is Yahusha''s doer of the Father''s will, not the mere confessor, in 2 Esdras 9:7.'),
  ('apocrypha', '2-esdras', 9, 8, 'canon', 'james', 2, 17, 'free', E'James 2:17 — *Even so faith, if it hath not works, is dead, being alone.* The very pairing Ezra makes — escape *by his works, and by faith* — is James''s living faith that bears works, in 2 Esdras 9:8.'),
  -- thread: 2-esdras-9-torment-after-death
  ('apocrypha', '2-esdras', 9, 12, 'canon', 'luke', 16, 23, 'free', E'Luke 16:23 — *And in hell he lift up his eyes, being in torments, and seeth Abraham afar off, and Lazarus in his bosom.* Those who despised the law and *must know it after death by pain* in 2 Esdras 9:12 are the rich man lifting up his eyes in torment.'),
  ('apocrypha', '2-esdras', 9, 11, 'canon', 'luke', 16, 25, 'free', E'Luke 16:25 — *But Abraham said, Son, remember that thou in thy lifetime receivedst thy good things, and likewise Lazarus evil things: but now he is comforted, and thou art tormented.* Ezra''s ones who had *liberty* and *place of repentance* yet despised it are Abraham''s son who had his good things in his lifetime, in 2 Esdras 9:11.'),
  ('apocrypha', '2-esdras', 9, 9, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The pitiful case of those who abused His ways and *dwell in torments* in 2 Esdras 9:9 is Daniel''s waking to shame and everlasting contempt.'),
  -- thread: 2-esdras-9-grape-of-the-cluster
  ('apocrypha', '2-esdras', 9, 21, 'canon', 'isaiah', 5, 7, 'free', E'Isaiah 5:7 — *For the vineyard of Yahuah Tseva''ot (LORD of hosts) is the house of Yashar''el (Israel), and the men of Yahudah (Judah) his pleasant plant: and he looked for judgment, but behold oppression; for righteousness, but behold a cry.* The *plant of a great people* kept in 2 Esdras 9:21 is Isaiah''s pleasant plant, the two houses of Yashar''el and Yahudah.'),
  ('apocrypha', '2-esdras', 9, 21, 'canon', 'isaiah', 5, 2, 'free', E'Isaiah 5:2 — *And he fenced it, and gathered out the stones thereof, and planted it with the choicest vine, and built a tower in the midst of it, and also made a winepress therein: and he looked that it should bring forth grapes, and it brought forth wild grapes.* The Holy One who *kept me a grape of the cluster* in 2 Esdras 9:21 is the husbandman of Isaiah''s vineyard who sought His grapes.'),
  ('apocrypha', '2-esdras', 9, 22, 'canon', 'romans', 11, 5, 'free', E'Romans 11:5 — *Even so then at this present time also there is a remnant according to the election of grace.* The grape kept while the multitude perishes in 2 Esdras 9:22 is Sha''ul''s remnant according to the election of grace.'),
  ('apocrypha', '2-esdras', 9, 22, 'canon', 'romans', 11, 1, 'free', E'Romans 11:1 — *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* The perishing of the multitude in 2 Esdras 9:22 is not Israel cast away, for the grape — the elect remnant — is kept.'),
  -- thread: 2-esdras-9-law-sown-perishes-not
  ('apocrypha', '2-esdras', 9, 31, 'canon', 'matthew', 13, 8, 'free', E'Matthew 13:8 — *But other fell into good ground, and brought forth fruit, some an hundredfold, some sixtyfold, some thirtyfold.* The law that the Holy One says He will *sow in you, and it shall bring fruit* in 2 Esdras 9:31 is the seed that bears fruit in the good ground of Yahusha''s parable.'),
  ('apocrypha', '2-esdras', 9, 31, 'canon', 'jeremiah', 31, 33, 'free', E'Jeremiah 31:33 — *But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* The law *sown in you* that brings fruit forever in 2 Esdras 9:31 is the same law written upon the inward parts in the new covenant.'),
  ('apocrypha', '2-esdras', 9, 37, 'canon', 'hebrews', 8, 10, 'free', E'Hebrews 8:10 — *For this is the covenant that I will make with the house of Yashar''el (Israel) after those days, saith Yahuah (Lord); I will put my laws into their mind, and write them in their hearts: and I will be to them a Elohim (God), and they shall be to me a people:* That the law *perishes not, but remains in his force* in 2 Esdras 9:37 is confirmed where the covenant writes the same law on mind and heart.'),
  -- thread: 2-esdras-9-barren-woman-mourns
  ('apocrypha', '2-esdras', 9, 45, 'canon', '1-samuel', 1, 11, 'free', E'1 Samuel 1:11 — *And she vowed a vow, and said, O Yahuah Tseva''ot (LORD of hosts), if thou wilt indeed look on the affliction of thine handmaid, and remember me, and not forget thine handmaid, but wilt give unto thine handmaid a man child, then I will give him unto Yahuah (LORD) all the days of his life, and there shall no razor come upon his head.* The handmaid whom *Yahuah heard* and gave a son after thirty years of prayer in 2 Esdras 9:45 is Hannah, who vowed and was remembered.'),
  ('apocrypha', '2-esdras', 9, 44, 'canon', '1-samuel', 1, 10, 'free', E'1 Samuel 1:10 — *And she was in bitterness of soul, and prayed unto Yahuah (LORD), and wept sore.* The woman who did nothing *but make my prayer to the Highest* day and night in 2 Esdras 9:44 is Hannah in bitterness of soul, weeping sore at Shiloh.'),
  ('apocrypha', '2-esdras', 9, 43, 'canon', 'isaiah', 54, 1, 'free', E'Isaiah 54:1 — *Sing, O barren, thou that didst not bear; break forth into singing, and cry aloud, thou that didst not travail with child: for more are the children of the desolate than the children of the married wife, saith Yahuah (LORD).* The barren one who *had no child* in 2 Esdras 9:43 is the desolate Tziyon bidden to sing, for her children shall outnumber the married wife''s.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2esd9_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2esd9_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-9-signs-of-the-end',
       E'Measure the time: the signs of the end',
       E'The messenger bids Ezra read the season by its signs: *Measure you the time diligently in itself: and when you see part of the signs past, which I have told you before,* *Then shall you understand, that it is the very same time, in which the Highest will begin to visit the world which he made.* *Therefore when there shall be seen earthquakes and uproars of the people in the world:* It ain''t new — Yahusha gives the same birth-pangs on Olivet: *For nation shall rise against nation, and kingdom against kingdom: and there shall be famines, and pestilences, and earthquakes, in divers places.* (Matthew 24:7), and the appointed end follows the witness: *And this gospel of the kingdom shall be preached in all the world for a witness unto all nations; and then shall the end come.* (Matthew 24:14). Daniel set the same hour of trouble and deliverance: *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* (Daniel 12:1).',
       sv.verse_id, ev.verse_id, 'extras', 63200
  FROM _session253_2esd9_lookup sv, _session253_2esd9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=9 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-9-saved-by-works-and-faith',
       E'Saved by his works and by faith: the narrow way',
       E'The salvation is for the doer who trusts: *And every one that shall be saved, and shall be able to escape by his works, and by faith, by which you have believed,* *Shall be preserved from the said perils, and shall see my salvation in my land, and within my borders: for I have sanctified them for me from the beginning.* This is no law-as-curse — it is the same Torah-keeping faith Yahusha sets at the strait gate: *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* (Matthew 7:14), and *Not every one that saith unto me, Yahuah (Lord), Yahuah (Lord), shall enter into the kingdom of heaven; but he that doeth the will of my Father which is in heaven.* (Matthew 7:21). James holds Ezra''s same wedding of works and faith: *Even so faith, if it hath not works, is dead, being alone.* (James 2:17).',
       sv.verse_id, ev.verse_id, 'extras', 63203
  FROM _session253_2esd9_lookup sv, _session253_2esd9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=9 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-9-torment-after-death',
       E'They knew Him not: torment after death',
       E'Those who spurned the open door of repentance reap pain beyond the grave: *And they that have loathed my law, while they had yet liberty, and, when as yet place of repentance was open to them, understood not, but despised it;* *The same must know it after death by pain.* Yahusha paints that same torment in the rich man who slighted Moses and the prophets: *And in hell he lift up his eyes, being in torments, and seeth Abraham afar off, and Lazarus in his bosom.* (Luke 16:23) — *But Abraham said, Son, remember that thou in thy lifetime receivedst thy good things, and likewise Lazarus evil things: but now he is comforted, and thou art tormented.* (Luke 16:25). Daniel divides the risen dead the same way: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2).',
       sv.verse_id, ev.verse_id, 'extras', 63206
  FROM _session253_2esd9_lookup sv, _session253_2esd9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=9 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-9-grape-of-the-cluster',
       E'A grape of the cluster kept: the remnant of the great people',
       E'Though the multitude perish, the Holy One preserves a seed: *And I saw, and spared it greatly, and have kept me a grape of the cluster, and a plant of a great people.* *Let the multitude perish then, which was born in vain; and let my grape be kept, and my plant; for with great labour have I made it perfect.* This is the vineyard of Yahuah — His own house, not a church replacing it: *And he fenced it, and gathered out the stones thereof, and planted it with the choicest vine...* (Isaiah 5:2) — *For the vineyard of Yahuah Tseva''ot (LORD of hosts) is the house of Yashar''el (Israel), and the men of Yahudah (Judah) his pleasant plant...* (Isaiah 5:7). Sha''ul keeps Ezra''s grape as the remnant that is never cast away: *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* (Romans 11:1) — *Even so then at this present time also there is a remnant according to the election of grace.* (Romans 11:5). The unfaithful generation forfeits; the faithful remnant of both houses keeps the inheritance.',
       sv.verse_id, ev.verse_id, 'extras', 63209
  FROM _session253_2esd9_lookup sv, _session253_2esd9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=9 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-9-law-sown-perishes-not',
       E'I sow my law in you: the seed that perishes not',
       E'Ezra pleads the covenant at Sinai, the law sown into Israel: *And you spakest saying, Hear me, O Yashar''el (Israel); and mark my words, you seed of Jacob.* *For, behold, I sow my law in you, and it shall bring fruit in you, and you shall be honoured in it for ever.* Though the fathers kept it not, the law itself cannot perish: *Notwithstanding the law perishes not, but remains in his force.* It ain''t new — Yahusha''s sower casts the same seed that bears fruit in good ground: *But other fell into good ground, and brought forth fruit, some an hundredfold, some sixtyfold, some thirtyfold.* (Matthew 13:8). And the law Ezra says is *sown in you* is the very law of the new covenant written within: *But this shall be the covenant that I will make with the house of Yashar''el (Israel)... I will put my law in their inward parts, and write it in their hearts...* (Jeremiah 31:33), echoed in *I will put my laws into their mind, and write them in their hearts...* (Hebrews 8:10). Torah stands and remains in force.',
       sv.verse_id, ev.verse_id, 'extras', 63212
  FROM _session253_2esd9_lookup sv, _session253_2esd9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=31
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=9 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-9-barren-woman-mourns',
       E'The barren woman who bore a son: from grief to glory',
       E'Ezra turns to a woman in deep mourning, who tells her story: *I your servant have been barren, and had no child, though I had an husband thirty years,* *And those thirty years I did nothing else day and night, and every hour, but make my, prayer to the Highest.* *After thirty years Yahuah (God) heard me yours handmaid, looked upon my misery, considered my trouble, and gave me a son...* Her barrenness-turned-fruitfulness is Hannah''s, who wept and vowed at Shiloh: *And she was in bitterness of soul, and prayed unto Yahuah (LORD), and wept sore.* (1 Samuel 1:10) — *And she vowed a vow, and said, O Yahuah Tseva''ot (LORD of hosts), if thou wilt indeed look on the affliction of thine handmaid, and remember me, and not forget thine handmaid, but wilt give unto thine handmaid a man child...* (1 Samuel 1:11). And the woman is figure of desolate Tziyon, bidden to sing: *Sing, O barren, thou that didst not bear; break forth into singing, and cry aloud, thou that didst not travail with child: for more are the children of the desolate than the children of the married wife, saith Yahuah (LORD).* (Isaiah 54:1).',
       sv.verse_id, ev.verse_id, 'extras', 63215
  FROM _session253_2esd9_lookup sv, _session253_2esd9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=38
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=9 AND ev.verse_number=47
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-esdras-9-signs-of-the-end
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 24:7 — *For nation shall rise against nation, and kingdom against kingdom: and there shall be famines, and pestilences, and earthquakes, in divers places.* The earthquakes and uproars of the peoples that mark Ezra''s hour are the very birth-pangs Yahusha names before the visitation of 2 Esdras 9:3.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-signs-of-the-end'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 24:14 — *And this gospel of the kingdom shall be preached in all the world for a witness unto all nations; and then shall the end come.* As the Highest will *begin to visit the world* once the signs are read, so the end comes only after the witness is borne in 2 Esdras 9:2.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-signs-of-the-end'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 12:1 — *And at that time shall Michael stand up, the great prince which standeth for the children of thy people: and there shall be a time of trouble, such as never was since there was a nation even to that same time: and at that time thy people shall be delivered, every one that shall be found written in the book.* The manifest end with its plain beginning and ending of 2 Esdras 9:5 is Daniel''s time of trouble whose deliverance is for the written remnant.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-signs-of-the-end'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-9-saved-by-works-and-faith
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 7:14 — *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* The few who *escape by his works, and by faith* in 2 Esdras 9:7 are the few that find the narrow way to life.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-saved-by-works-and-faith'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 7:21 — *Not every one that saith unto me, Yahuah (Lord), Yahuah (Lord), shall enter into the kingdom of heaven; but he that doeth the will of my Father which is in heaven.* Ezra''s salvation *by his works, and by faith* is Yahusha''s doer of the Father''s will, not the mere confessor, in 2 Esdras 9:7.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-saved-by-works-and-faith'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 2:17 — *Even so faith, if it hath not works, is dead, being alone.* The very pairing Ezra makes — escape *by his works, and by faith* — is James''s living faith that bears works, in 2 Esdras 9:8.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-saved-by-works-and-faith'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-9-torment-after-death
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 16:23 — *And in hell he lift up his eyes, being in torments, and seeth Abraham afar off, and Lazarus in his bosom.* Those who despised the law and *must know it after death by pain* in 2 Esdras 9:12 are the rich man lifting up his eyes in torment.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-torment-after-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=16 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 16:25 — *But Abraham said, Son, remember that thou in thy lifetime receivedst thy good things, and likewise Lazarus evil things: but now he is comforted, and thou art tormented.* Ezra''s ones who had *liberty* and *place of repentance* yet despised it are Abraham''s son who had his good things in his lifetime, in 2 Esdras 9:11.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-torment-after-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=16 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The pitiful case of those who abused His ways and *dwell in torments* in 2 Esdras 9:9 is Daniel''s waking to shame and everlasting contempt.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-torment-after-death'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-9-grape-of-the-cluster
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 5:7 — *For the vineyard of Yahuah Tseva''ot (LORD of hosts) is the house of Yashar''el (Israel), and the men of Yahudah (Judah) his pleasant plant: and he looked for judgment, but behold oppression; for righteousness, but behold a cry.* The *plant of a great people* kept in 2 Esdras 9:21 is Isaiah''s pleasant plant, the two houses of Yashar''el and Yahudah.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-grape-of-the-cluster'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 5:2 — *And he fenced it, and gathered out the stones thereof, and planted it with the choicest vine, and built a tower in the midst of it, and also made a winepress therein: and he looked that it should bring forth grapes, and it brought forth wild grapes.* The Holy One who *kept me a grape of the cluster* in 2 Esdras 9:21 is the husbandman of Isaiah''s vineyard who sought His grapes.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-grape-of-the-cluster'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 11:5 — *Even so then at this present time also there is a remnant according to the election of grace.* The grape kept while the multitude perishes in 2 Esdras 9:22 is Sha''ul''s remnant according to the election of grace.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-grape-of-the-cluster'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 11:1 — *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* The perishing of the multitude in 2 Esdras 9:22 is not Israel cast away, for the grape — the elect remnant — is kept.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-grape-of-the-cluster'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-9-law-sown-perishes-not
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 13:8 — *But other fell into good ground, and brought forth fruit, some an hundredfold, some sixtyfold, some thirtyfold.* The law that the Holy One says He will *sow in you, and it shall bring fruit* in 2 Esdras 9:31 is the seed that bears fruit in the good ground of Yahusha''s parable.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-law-sown-perishes-not'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 31:33 — *But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* The law *sown in you* that brings fruit forever in 2 Esdras 9:31 is the same law written upon the inward parts in the new covenant.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-law-sown-perishes-not'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 8:10 — *For this is the covenant that I will make with the house of Yashar''el (Israel) after those days, saith Yahuah (Lord); I will put my laws into their mind, and write them in their hearts: and I will be to them a Elohim (God), and they shall be to me a people:* That the law *perishes not, but remains in his force* in 2 Esdras 9:37 is confirmed where the covenant writes the same law on mind and heart.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-law-sown-perishes-not'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=8 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-9-barren-woman-mourns
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Samuel 1:11 — *And she vowed a vow, and said, O Yahuah Tseva''ot (LORD of hosts), if thou wilt indeed look on the affliction of thine handmaid, and remember me, and not forget thine handmaid, but wilt give unto thine handmaid a man child, then I will give him unto Yahuah (LORD) all the days of his life, and there shall no razor come upon his head.* The handmaid whom *Yahuah heard* and gave a son after thirty years of prayer in 2 Esdras 9:45 is Hannah, who vowed and was remembered.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-barren-woman-mourns'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Samuel 1:10 — *And she was in bitterness of soul, and prayed unto Yahuah (LORD), and wept sore.* The woman who did nothing *but make my prayer to the Highest* day and night in 2 Esdras 9:44 is Hannah in bitterness of soul, weeping sore at Shiloh.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-barren-woman-mourns'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 54:1 — *Sing, O barren, thou that didst not bear; break forth into singing, and cry aloud, thou that didst not travail with child: for more are the children of the desolate than the children of the married wife, saith Yahuah (LORD).* The barren one who *had no child* in 2 Esdras 9:43 is the desolate Tziyon bidden to sing, for her children shall outnumber the married wife''s.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd9_lookup sv, _session253_2esd9_lookup tv
 WHERE t.slug='2-esdras-9-barren-woman-mourns'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=9 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=54 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

