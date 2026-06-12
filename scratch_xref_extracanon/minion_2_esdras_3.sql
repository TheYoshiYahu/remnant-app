-- ----- fragment: minion_2esdras_03.sql (session253 2-esdras 3) -----
-- Source anchor: apocrypha/2-esdras ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2esd3 (view _session253_2esd3_lookup). Sort band base 63050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2esd3_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-esdras-3-wicked-heart-of-adam
  ('apocrypha', '2-esdras', 3, 21, 'canon', 'romans', 5, 12, 'free', E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned:* Sha''ul traces death to the one transgression of Adam exactly as 2 Esdras 3:21 traces our overthrow to the first Adam''s wicked heart.'),
  ('apocrypha', '2-esdras', 3, 21, 'canon', 'genesis', 6, 5, 'free', E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* The wicked heart Ezra names in 2 Esdras 3:21 is the very imagination Yahuah saw before the flood.'),
  ('apocrypha', '2-esdras', 3, 22, 'canon', 'genesis', 8, 21, 'free', E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake; for the imagination of man''s heart is evil from his youth; neither will I again smite any more every thing living, as I have done.* That the evil ''abode still'' after the flood (2 Esdras 3:22) is Yahuah''s own verdict over Noah''s altar.'),
  -- thread: 2-esdras-3-law-not-take-away-wicked-heart
  ('apocrypha', '2-esdras', 3, 20, 'canon', 'romans', 7, 18, 'free', E'Romans 7:18 — *For I know that in me (that is, in my flesh,) dwelleth no good thing: for to will is present with me; but how to perform that which is good I find not.* This is Ezra''s grief that the law could not bring forth fruit (2 Esdras 3:20) felt in Sha''ul''s own members.'),
  ('apocrypha', '2-esdras', 3, 20, 'canon', 'romans', 7, 23, 'free', E'Romans 7:23 — *But I see another law in my members, warring against the law of my mind, and bringing me into captivity to the law of sin which is in my members.* The seed-war Ezra describes between the holy law and the malignant root (2 Esdras 3:20,22) is the very warring Sha''ul names within.'),
  ('apocrypha', '2-esdras', 3, 20, 'canon', 'jeremiah', 17, 9, 'free', E'Jeremiah 17:9 — *The heart is deceitful above all things, and desperately wicked: who can know it?* The wicked heart Yahuah did not yet take away (2 Esdras 3:20) is the unsearchable heart the prophet weighs.'),
  ('apocrypha', '2-esdras', 3, 20, 'canon', 'ezekiel', 36, 26, 'free', E'Ezekiel 36:26 — *A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh.* What Ezra laments was withheld (2 Esdras 3:20) Yahuah promises to do — the wicked heart taken away, a new one given.'),
  -- thread: 2-esdras-3-the-breath-and-the-commandment
  ('apocrypha', '2-esdras', 3, 5, 'canon', 'genesis', 2, 7, 'free', E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* Ezra''s body given the breath of life and made living (2 Esdras 3:5) is this verse retold.'),
  ('apocrypha', '2-esdras', 3, 7, 'canon', 'genesis', 3, 17, 'free', E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life;* the transgressed commandment and appointed death of 2 Esdras 3:7 is this sentence over Adam.'),
  ('apocrypha', '2-esdras', 3, 7, 'canon', 'romans', 5, 12, 'free', E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned:* the death appointed ''in him and in his generations'' (2 Esdras 3:7) is Sha''ul''s death passing upon all men.'),
  -- thread: 2-esdras-3-jacob-chosen-everlasting-covenant
  ('apocrypha', '2-esdras', 3, 15, 'canon', 'genesis', 17, 7, 'free', E'Genesis 17:7 — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee.* The everlasting covenant never to forsake Abraham''s seed (2 Esdras 3:15) is cut here.'),
  ('apocrypha', '2-esdras', 3, 16, 'canon', 'romans', 9, 13, 'free', E'Romans 9:13 — *As it is written, Jacob have I loved, but Esau have I hated.* Ezra''s ''you did choose him to you, and put by Esau'' (2 Esdras 3:16) is the same sovereign election Sha''ul cites.'),
  ('apocrypha', '2-esdras', 3, 15, 'canon', 'romans', 11, 1, 'free', E'Romans 11:1 — *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* Because Yahuah promised never to forsake the seed (2 Esdras 3:15), Israel is not cast away.'),
  -- thread: 2-esdras-3-israel-by-name-kept-the-precepts
  ('apocrypha', '2-esdras', 3, 36, 'canon', 'ezekiel', 36, 27, 'free', E'Ezekiel 36:27 — *And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* The Israel that ''by name has kept your precepts'' (2 Esdras 3:36) is the people Yahuah enables to keep His judgments by His Spirit.'),
  ('apocrypha', '2-esdras', 3, 32, 'canon', 'ezekiel', 36, 24, 'free', E'Ezekiel 36:24 — *For I will take you from among the heathen, and gather you out of all countries, and will bring you into your own land.* Ezra''s question of who knows Yahuah beside Israel (2 Esdras 3:32) is answered by the regathering of that very people.'),
  ('apocrypha', '2-esdras', 3, 32, 'canon', 'romans', 11, 1, 'free', E'Romans 11:1 — *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* Israel believing the covenants as Jacob did (2 Esdras 3:32) is the people Sha''ul insists is not cast away.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2esd3_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2esd3_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-3-wicked-heart-of-adam',
       E'The grain of evil seed sown in the heart of Adam',
       E'Ezra''s first complaint reaches behind every sin to a single root in the first man: *For the first Adam bearing a wicked heart transgressed, and was overcome; and so be all they that are born of him* (2 Esdras 3:21), so that *infirmity was made permanent* and *the good departed away, and the evil abode still* (2 Esdras 3:22). It ain''t new — this is Sha''ul''s whole argument: *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* (Romans 5:12). The flood-generation, Ezra says, were only watering the same seed, for Yahuah saw from the beginning *that every imagination of the thoughts of his heart was only evil continually* (Genesis 6:5), and even after the waters He owned *the imagination of man''s heart is evil from his youth* (Genesis 8:21). The wicked heart is not theory but the diagnosis underneath all of Scripture''s mercy.',
       sv.verse_id, ev.verse_id, 'extras', 63050
  FROM _session253_2esd3_lookup sv, _session253_2esd3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=3 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-3-law-not-take-away-wicked-heart',
       E'The law given, yet the wicked heart not taken away',
       E'Ezra rehearses Sinai — *that you might give the law to the seed of Jacob* (2 Esdras 3:19) — and then sets his finger on the wound: *And yet tookest you not away from them a wicked heart, that your law might bring forth fruit in them* (2 Esdras 3:20). The good law lands on bad soil, *the law (also) in the heart of the people with the malignity of the root* (2 Esdras 3:22). This is precisely Sha''ul''s torn cry over the same holy Torah: *For I delight in the law of Elohim (God) after the inward man: But I see another law in my members, warring against the law of my mind, and bringing me into captivity to the law of sin which is in my members* (Romans 7:22-23). The flesh cannot do what the commandment requires — *For I know that in me (that is, in my flesh,) dwelleth no good thing* (Romans 7:18). And the prophet had already exposed why the law brings forth no fruit: *The heart is deceitful above all things, and desperately wicked: who can know it?* (Jeremiah 17:9). The complaint cries for the new heart that only Yahuah Himself can give.',
       sv.verse_id, ev.verse_id, 'extras', 63053
  FROM _session253_2esd3_lookup sv, _session253_2esd3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=20
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=3 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-3-the-breath-and-the-commandment',
       E'Adam formed, given breath, given the commandment he transgressed',
       E'Before the complaint, Ezra retells the making of the first man: *And gavest a body to Adam without soul, which was the workmanship of yours hands, and did breathe into him the breath of life, and he was made living before you* (2 Esdras 3:5) — a near-quotation of Bereshith: *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul* (Genesis 2:7). Then comes the single charge that loosed death: *And to him you gavest commandment to love your way: which he transgressed, and immediately you appointedst death in him and in his generations* (2 Esdras 3:7). So the LORD pronounced over the man who ate: *cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life* (Genesis 3:17). Ezra is reading Genesis 2-3 straight; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 63056
  FROM _session253_2esd3_lookup sv, _session253_2esd3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=3 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-3-jacob-chosen-everlasting-covenant',
       E'Abraham loved, the everlasting covenant, Jacob chosen',
       E'Against the wreck of Sion, Ezra rests on election that precedes any confession: *And madest an everlasting covenant with him, promising him that you would never forsake his seed* (2 Esdras 3:15), and *As for Jacob, you did choose him to you, and put by Esau: and so Jacob became a great multitude* (2 Esdras 3:16). This is the covenant Yahuah cut with Abraham: *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant* (Genesis 17:7). And the choosing of Jacob over Esau is the very text Sha''ul presses to show election stands not of works: *As it is written, Jacob have I loved, but Esau have I hated* (Romans 9:13). Because that election precedes confession, the unfaithful generation forfeits but the seed is never cast away: *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1). Yahuah will never forsake the seed.',
       sv.verse_id, ev.verse_id, 'extras', 63059
  FROM _session253_2esd3_lookup sv, _session253_2esd3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=3 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-esdras-3-israel-by-name-kept-the-precepts',
       E'Israel by name hath kept thy precepts',
       E'Ezra''s complaint ends not in despair over the nations but in a confession of the faithful remnant: *Or is there any other people that knoweth you beside Yashar''el (Israel)? or what generation has so believed your covenants as Jacob?* (2 Esdras 3:32), closing with *You shall find that Yashar''el (Israel) by name has kept your precepts; but not the heathen* (2 Esdras 3:36). This is not a people replacing Israel — it is Israel, by name, holding the covenant when the nations ''think not upon your commandments'' (2 Esdras 3:33). The prophets answer the grief: though scattered for their own way, Yahuah gathers them home — *For I will take you from among the heathen, and gather you out of all countries, and will bring you into your own land* (Ezekiel 36:24) — and gives the new heart that makes the precept-keeping real: *And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). And Sha''ul guards the floor under it all: *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1). The covenant holds with Israel; election precedes confession.',
       sv.verse_id, ev.verse_id, 'extras', 63062
  FROM _session253_2esd3_lookup sv, _session253_2esd3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=32
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-esdras' AND ev.chapter_number=3 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-esdras-3-wicked-heart-of-adam
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned:* Sha''ul traces death to the one transgression of Adam exactly as 2 Esdras 3:21 traces our overthrow to the first Adam''s wicked heart.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd3_lookup sv, _session253_2esd3_lookup tv
 WHERE t.slug='2-esdras-3-wicked-heart-of-adam'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* The wicked heart Ezra names in 2 Esdras 3:21 is the very imagination Yahuah saw before the flood.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd3_lookup sv, _session253_2esd3_lookup tv
 WHERE t.slug='2-esdras-3-wicked-heart-of-adam'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake; for the imagination of man''s heart is evil from his youth; neither will I again smite any more every thing living, as I have done.* That the evil ''abode still'' after the flood (2 Esdras 3:22) is Yahuah''s own verdict over Noah''s altar.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd3_lookup sv, _session253_2esd3_lookup tv
 WHERE t.slug='2-esdras-3-wicked-heart-of-adam'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-3-law-not-take-away-wicked-heart
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 7:18 — *For I know that in me (that is, in my flesh,) dwelleth no good thing: for to will is present with me; but how to perform that which is good I find not.* This is Ezra''s grief that the law could not bring forth fruit (2 Esdras 3:20) felt in Sha''ul''s own members.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd3_lookup sv, _session253_2esd3_lookup tv
 WHERE t.slug='2-esdras-3-law-not-take-away-wicked-heart'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=7 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 7:23 — *But I see another law in my members, warring against the law of my mind, and bringing me into captivity to the law of sin which is in my members.* The seed-war Ezra describes between the holy law and the malignant root (2 Esdras 3:20,22) is the very warring Sha''ul names within.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd3_lookup sv, _session253_2esd3_lookup tv
 WHERE t.slug='2-esdras-3-law-not-take-away-wicked-heart'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 17:9 — *The heart is deceitful above all things, and desperately wicked: who can know it?* The wicked heart Yahuah did not yet take away (2 Esdras 3:20) is the unsearchable heart the prophet weighs.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd3_lookup sv, _session253_2esd3_lookup tv
 WHERE t.slug='2-esdras-3-law-not-take-away-wicked-heart'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=17 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 36:26 — *A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh.* What Ezra laments was withheld (2 Esdras 3:20) Yahuah promises to do — the wicked heart taken away, a new one given.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd3_lookup sv, _session253_2esd3_lookup tv
 WHERE t.slug='2-esdras-3-law-not-take-away-wicked-heart'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-3-the-breath-and-the-commandment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* Ezra''s body given the breath of life and made living (2 Esdras 3:5) is this verse retold.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd3_lookup sv, _session253_2esd3_lookup tv
 WHERE t.slug='2-esdras-3-the-breath-and-the-commandment'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:17 — *And unto Adam he said, Because thou hast hearkened unto the voice of thy wife, and hast eaten of the tree, of which I commanded thee, saying, Thou shalt not eat of it: cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life;* the transgressed commandment and appointed death of 2 Esdras 3:7 is this sentence over Adam.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd3_lookup sv, _session253_2esd3_lookup tv
 WHERE t.slug='2-esdras-3-the-breath-and-the-commandment'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 5:12 — *Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned:* the death appointed ''in him and in his generations'' (2 Esdras 3:7) is Sha''ul''s death passing upon all men.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd3_lookup sv, _session253_2esd3_lookup tv
 WHERE t.slug='2-esdras-3-the-breath-and-the-commandment'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-3-jacob-chosen-everlasting-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 17:7 — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee.* The everlasting covenant never to forsake Abraham''s seed (2 Esdras 3:15) is cut here.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd3_lookup sv, _session253_2esd3_lookup tv
 WHERE t.slug='2-esdras-3-jacob-chosen-everlasting-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 9:13 — *As it is written, Jacob have I loved, but Esau have I hated.* Ezra''s ''you did choose him to you, and put by Esau'' (2 Esdras 3:16) is the same sovereign election Sha''ul cites.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd3_lookup sv, _session253_2esd3_lookup tv
 WHERE t.slug='2-esdras-3-jacob-chosen-everlasting-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 11:1 — *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* Because Yahuah promised never to forsake the seed (2 Esdras 3:15), Israel is not cast away.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd3_lookup sv, _session253_2esd3_lookup tv
 WHERE t.slug='2-esdras-3-jacob-chosen-everlasting-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-esdras-3-israel-by-name-kept-the-precepts
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 36:27 — *And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* The Israel that ''by name has kept your precepts'' (2 Esdras 3:36) is the people Yahuah enables to keep His judgments by His Spirit.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd3_lookup sv, _session253_2esd3_lookup tv
 WHERE t.slug='2-esdras-3-israel-by-name-kept-the-precepts'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 36:24 — *For I will take you from among the heathen, and gather you out of all countries, and will bring you into your own land.* Ezra''s question of who knows Yahuah beside Israel (2 Esdras 3:32) is answered by the regathering of that very people.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd3_lookup sv, _session253_2esd3_lookup tv
 WHERE t.slug='2-esdras-3-israel-by-name-kept-the-precepts'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 11:1 — *I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin.* Israel believing the covenants as Jacob did (2 Esdras 3:32) is the people Sha''ul insists is not cast away.'
  FROM cross_reference_threads t, cross_references x, _session253_2esd3_lookup sv, _session253_2esd3_lookup tv
 WHERE t.slug='2-esdras-3-israel-by-name-kept-the-precepts'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-esdras' AND sv.chapter_number=3 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

