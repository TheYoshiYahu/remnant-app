-- ----- fragment: minion_1enoch_19.sql (session250 1-enoch 19) -----
-- Source anchor: enoch/1-enoch ch19. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en19 (view _session250_en19_lookup). Sort band base 50450, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en19_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-19-sacrificing-to-demons
  ('enoch', '1-enoch', 19, 1, 'canon', 'deuteronomy', 32, 17, 'free', E'Deuteronomy 32:17 — *They sacrificed unto devils, not to Elohim (God); to gods whom they knew not, to new gods that came newly up, whom your fathers feared not.* Moses'' Song already names exactly what Enoch sees: men led astray into sacrificing to demons as gods, the very deception the Watchers planted.'),
  ('enoch', '1-enoch', 19, 1, 'canon', 'leviticus', 17, 7, 'free', E'Leviticus 17:7 — *And they shall no more offer their sacrifices unto devils, after whom they have gone a whoring. This shall be a statute for ever unto them throughout their generations.* The Torah forbids the demon-sacrifice Enoch 19:1 blames on the fallen Watchers — the covenant stands against the deception, never as a curse.'),
  ('enoch', '1-enoch', 19, 1, 'canon', 'psalms', 106, 37, 'free', E'Psalms 106:37 — *Yea, they sacrificed their sons and their daughters unto devils,* The Psalmist records how far the spirits'' deception led Yashar''el astray, the same demon-worship Enoch 19:1 traces to the angels who fell.'),
  ('enoch', '1-enoch', 19, 1, 'canon', '1-corinthians', 10, 20, 'free', E'1 Corinthians 10:20 — *But I say, that the things which the Gentiles sacrifice, they sacrifice to devils, and not to Elohim (God): and I would not that ye should have fellowship with devils.* Sha''ul carries Enoch 19:1''s verdict unbroken into the assembly: the idol is nothing, but a demon stands behind it.'),
  ('enoch', '1-enoch', 19, 1, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude names the same reserved host standing ''till the day of the great judgement'' that Uriel shows Enoch in 19:1.'),
  -- thread: 1-enoch-19-spirits-lead-men-astray
  ('enoch', '1-enoch', 19, 1, 'enoch', '1-enoch', 15, 8, 'extras', E'1 Enoch 15:8 — *As for the spirits of heaven, in heaven shall be their dwelling, but as for the spirits of the earth which were born upon the earth, on the earth shall be their dwelling.* Enoch''s own earlier vision identifies the form-shifting spirits of 19:1 as the earth-bound evil spirits sprung from the dead giants.'),
  ('enoch', '1-enoch', 19, 1, 'enoch', '1-enoch', 15, 10, 'extras', E'1 Enoch 15:10 — *And these spirits shall rise up against the children of men and against the women, because they have proceeded from them.* This is the defiling and leading-astray of mankind that Uriel shows Enoch in 19:1, the same spirits at work.'),
  ('enoch', '1-enoch', 19, 1, 'jubilees', 'jubilees', 10, 1, 'extras', E'Jubilees 10:1 — *And in the third week of this jubilee the unclean demons began to lead astray the children of the sons of Noah; and to make to err and destroy them.* Jubilees records the very leading-astray of mankind that Enoch 19:1 foresees, the spirits of the dead giants at their deceiving work.'),
  ('enoch', '1-enoch', 19, 1, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Kepha confirms Enoch 19:1''s frame: the fallen angels stand bound, reserved unto the day of the great judgement.'),
  ('enoch', '1-enoch', 19, 1, 'canon', 'revelation', 9, 20, 'free', E'Revelation 9:20 — *And the rest of the men which were not killed by these plagues yet repented not of the works of their hands, that they should not worship devils, and idols of gold, and silver, and brass, and stone, and of wood: which neither can see, nor hear, nor walk:* The demon-worship the Watchers seeded in Enoch 19:1 persists unrepented to the very end, just before the reckoning closes.'),
  -- thread: 1-enoch-19-women-became-sirens
  ('enoch', '1-enoch', 19, 2, 'enoch', '1-enoch', 16, 3, 'extras', E'1 Enoch 16:3 — *And these things have ye shown to women, and through these mysteries women and men work much destruction on earth.* Enoch''s own word explains why the women of 19:2 become agents of destruction: the Watchers taught them the forbidden mysteries.'),
  ('enoch', '1-enoch', 19, 2, 'canon', 'psalms', 106, 28, 'free', E'Psalms 106:28 — *They joined themselves also unto Baal-peor, and ate the sacrifices of the dead.* The seductive snare into demon-sacrifice that Enoch 19:2 pictures as sirens is the same trap that drew Yashar''el to Baal-peor and the sacrifices of the dead.'),
  ('enoch', '1-enoch', 19, 2, 'canon', '1-corinthians', 10, 21, 'free', E'1 Corinthians 10:21 — *Ye cannot drink the cup of Yahuah (Lord), and the cup of devils: ye cannot be partakers of Yahuah''s (Lord''s) table, and of the table of devils.* Sha''ul draws the line the siren-song of Enoch 19:2 blurs: there is no fellowship between the Lord''s table and the table of devils.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en19_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en19_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-19-sacrificing-to-demons',
       E'They sacrificed to demons, not to Elohim',
       E'Uriel shows Enoch the place of the bound rebel host: *And Uriel said to me: ''Here shall stand the angels who have connected themselves with women, and their spirits assuming many different forms are defiling mankind and shall lead them astray into sacrificing to demons as gods, here shall they stand, till the day of the great judgement in which they shall be judged till they are made an end of.* (1 Enoch 19:1). This is no innovation of Enoch''s — it is the verdict Moses already sang against a forgetful Yashar''el: *They sacrificed unto devils, not to Elohim (God); to gods whom they knew not, to new gods that came newly up, whom your fathers feared not.* (Deuteronomy 32:17). The Torah even names the place of the cure, the door of the tabernacle, *And they shall no more offer their sacrifices unto devils, after whom they have gone a whoring. This shall be a statute for ever unto them throughout their generations.* (Leviticus 17:7) — the covenant stands, and the Watchers'' deception is rebellion against the Creator''s own order. The Psalmist records how deep the snare ran: *Yea, they sacrificed their sons and their daughters unto devils,* (Psalms 106:37). Sha''ul carries the same line forward into the assembly, unbroken: *But I say, that the things which the Gentiles sacrifice, they sacrifice to devils, and not to Elohim (God): and I would not that ye should have fellowship with devils.* (1 Corinthians 10:20). And the bound host stand only *till the day of the great judgement* — the same reserving-until-the-reckoning that the apostles preached: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* (Jude 1:6). It ain''t new: from Sinai to Corinth to the abyss, the demons behind the idols and the day of their end are one testimony.',
       sv.verse_id, ev.verse_id, 'extras', 50450
  FROM _session250_en19_lookup sv, _session250_en19_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=19 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=19 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-19-spirits-lead-men-astray',
       E'The spirits that lead men astray, held till the reckoning',
       E'Enoch sees that the Watchers'' *spirits assuming many different forms are defiling mankind and shall lead them astray* (1 Enoch 19:1), and Enoch has already been told where those spirits came from: *And now, the giants, who are produced from the spirits and flesh, shall be called evil spirits upon the earth, and on the earth shall be their dwelling.* (1 Enoch 15:8) — the disembodied dead of the giants, who *shall rise up against the children of men* (1 Enoch 15:10) until the consummation. Jubilees tells the same history plainly: *And in the third week of this jubilee the unclean demons began to lead astray the children of the sons of Noah; and to make to err and destroy them.* (Jubilees 10:1), a tenth part left under Mastema to work that deception until the judgment. The deceiving spirits and idols persist to the very end, and men still will not turn: *And the rest of the men which were not killed by these plagues yet repented not of the works of their hands, that they should not worship devils, and idols of gold, and silver, and brass, and stone, and of wood: which neither can see, nor hear, nor walk:* (Revelation 9:20). And the same apostolic frame holds them reserved: *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* (2 Peter 2:4). The seed-war that began on Hermon runs through every page — and it ends not in the spirits'' victory but in their being made an end of.',
       sv.verse_id, ev.verse_id, 'extras', 50453
  FROM _session250_en19_lookup sv, _session250_en19_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=19 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=19 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-19-women-became-sirens',
       E'The women became sirens — destruction through the mysteries',
       E'Uriel''s vision closes the matter of the wives: *And the women also of the angels who went astray shall become sirens.''* (1 Enoch 19:2). The judgement falls not only on the Watchers but on the corruption channeled through the women they took — Enoch was already shown that *these things have ye shown to women, and through these mysteries women and men work much destruction on earth.* (1 Enoch 16:3). The pattern is woven through the Tanakh: when Yashar''el *joined themselves also unto Baal-peor, and ate the sacrifices of the dead.* (Psalms 106:28), the seduction into demon-sacrifice ran by exactly this snare. Sha''ul names the spirits behind it for the assembly: *Ye cannot drink the cup of Yahuah (Lord), and the cup of devils: ye cannot be partakers of Yahuah''s (Lord''s) table, and of the table of devils.* (1 Corinthians 10:21). The siren is the lie made beautiful — but its singers, like those who taught them, *shall stand, till the day of the great judgement* (1 Enoch 19:1).',
       sv.verse_id, ev.verse_id, 'extras', 50456
  FROM _session250_en19_lookup sv, _session250_en19_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=19 AND sv.verse_number=2
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=19 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-19-sacrificing-to-demons
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 32:17 — *They sacrificed unto devils, not to Elohim (God); to gods whom they knew not, to new gods that came newly up, whom your fathers feared not.* Moses'' Song already names exactly what Enoch sees: men led astray into sacrificing to demons as gods, the very deception the Watchers planted.'
  FROM cross_reference_threads t, cross_references x, _session250_en19_lookup sv, _session250_en19_lookup tv
 WHERE t.slug='1-enoch-19-sacrificing-to-demons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 17:7 — *And they shall no more offer their sacrifices unto devils, after whom they have gone a whoring. This shall be a statute for ever unto them throughout their generations.* The Torah forbids the demon-sacrifice Enoch 19:1 blames on the fallen Watchers — the covenant stands against the deception, never as a curse.'
  FROM cross_reference_threads t, cross_references x, _session250_en19_lookup sv, _session250_en19_lookup tv
 WHERE t.slug='1-enoch-19-sacrificing-to-demons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=17 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 106:37 — *Yea, they sacrificed their sons and their daughters unto devils,* The Psalmist records how far the spirits'' deception led Yashar''el astray, the same demon-worship Enoch 19:1 traces to the angels who fell.'
  FROM cross_reference_threads t, cross_references x, _session250_en19_lookup sv, _session250_en19_lookup tv
 WHERE t.slug='1-enoch-19-sacrificing-to-demons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 10:20 — *But I say, that the things which the Gentiles sacrifice, they sacrifice to devils, and not to Elohim (God): and I would not that ye should have fellowship with devils.* Sha''ul carries Enoch 19:1''s verdict unbroken into the assembly: the idol is nothing, but a demon stands behind it.'
  FROM cross_reference_threads t, cross_references x, _session250_en19_lookup sv, _session250_en19_lookup tv
 WHERE t.slug='1-enoch-19-sacrificing-to-demons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude names the same reserved host standing ''till the day of the great judgement'' that Uriel shows Enoch in 19:1.'
  FROM cross_reference_threads t, cross_references x, _session250_en19_lookup sv, _session250_en19_lookup tv
 WHERE t.slug='1-enoch-19-sacrificing-to-demons'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-19-spirits-lead-men-astray
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 15:8 — *As for the spirits of heaven, in heaven shall be their dwelling, but as for the spirits of the earth which were born upon the earth, on the earth shall be their dwelling.* Enoch''s own earlier vision identifies the form-shifting spirits of 19:1 as the earth-bound evil spirits sprung from the dead giants.'
  FROM cross_reference_threads t, cross_references x, _session250_en19_lookup sv, _session250_en19_lookup tv
 WHERE t.slug='1-enoch-19-spirits-lead-men-astray'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=15 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 15:10 — *And these spirits shall rise up against the children of men and against the women, because they have proceeded from them.* This is the defiling and leading-astray of mankind that Uriel shows Enoch in 19:1, the same spirits at work.'
  FROM cross_reference_threads t, cross_references x, _session250_en19_lookup sv, _session250_en19_lookup tv
 WHERE t.slug='1-enoch-19-spirits-lead-men-astray'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=15 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 10:1 — *And in the third week of this jubilee the unclean demons began to lead astray the children of the sons of Noah; and to make to err and destroy them.* Jubilees records the very leading-astray of mankind that Enoch 19:1 foresees, the spirits of the dead giants at their deceiving work.'
  FROM cross_reference_threads t, cross_references x, _session250_en19_lookup sv, _session250_en19_lookup tv
 WHERE t.slug='1-enoch-19-spirits-lead-men-astray'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Kepha confirms Enoch 19:1''s frame: the fallen angels stand bound, reserved unto the day of the great judgement.'
  FROM cross_reference_threads t, cross_references x, _session250_en19_lookup sv, _session250_en19_lookup tv
 WHERE t.slug='1-enoch-19-spirits-lead-men-astray'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 9:20 — *And the rest of the men which were not killed by these plagues yet repented not of the works of their hands, that they should not worship devils, and idols of gold, and silver, and brass, and stone, and of wood: which neither can see, nor hear, nor walk:* The demon-worship the Watchers seeded in Enoch 19:1 persists unrepented to the very end, just before the reckoning closes.'
  FROM cross_reference_threads t, cross_references x, _session250_en19_lookup sv, _session250_en19_lookup tv
 WHERE t.slug='1-enoch-19-spirits-lead-men-astray'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=19 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=9 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-19-women-became-sirens
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 16:3 — *And these things have ye shown to women, and through these mysteries women and men work much destruction on earth.* Enoch''s own word explains why the women of 19:2 become agents of destruction: the Watchers taught them the forbidden mysteries.'
  FROM cross_reference_threads t, cross_references x, _session250_en19_lookup sv, _session250_en19_lookup tv
 WHERE t.slug='1-enoch-19-women-became-sirens'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=19 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=16 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 106:28 — *They joined themselves also unto Baal-peor, and ate the sacrifices of the dead.* The seductive snare into demon-sacrifice that Enoch 19:2 pictures as sirens is the same trap that drew Yashar''el to Baal-peor and the sacrifices of the dead.'
  FROM cross_reference_threads t, cross_references x, _session250_en19_lookup sv, _session250_en19_lookup tv
 WHERE t.slug='1-enoch-19-women-became-sirens'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=19 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 10:21 — *Ye cannot drink the cup of Yahuah (Lord), and the cup of devils: ye cannot be partakers of Yahuah''s (Lord''s) table, and of the table of devils.* Sha''ul draws the line the siren-song of Enoch 19:2 blurs: there is no fellowship between the Lord''s table and the table of devils.'
  FROM cross_reference_threads t, cross_references x, _session250_en19_lookup sv, _session250_en19_lookup tv
 WHERE t.slug='1-enoch-19-women-became-sirens'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=19 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

