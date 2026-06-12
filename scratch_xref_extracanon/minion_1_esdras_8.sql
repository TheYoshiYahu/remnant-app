-- ----- fragment: minion_1esdras_08.sql (session253 1-esdras 8) -----
-- Source anchor: apocrypha/1-esdras ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1esd8 (view _session253_1esd8_lookup). Sort band base 62675, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1esd8_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-esdras-8-ready-scribe
  ('apocrypha', '1-esdras', 8, 3, 'canon', 'ezra', 7, 6, 'free', E'Ezra 7:6 — *This Ezra went up from Babylon; and he was a ready scribe in the law of Moses, which Yahuah Elohim (the LORD God) of Yashar''el (Israel) had given: and the king granted him all his request, according to the hand of Yahuah Elohav (the LORD his God) upon him.* The canon names the same ready scribe going up from Babylon with the law of Moses that 1 Esdras 8:3 retells.'),
  ('apocrypha', '1-esdras', 8, 7, 'canon', 'ezra', 7, 10, 'free', E'Ezra 7:10 — *For Ezra had prepared his heart to seek the law of Yahuah (LORD), and to do it, and to teach in Yashar''el (Israel) statutes and judgments.* The seek-do-teach heart of Ezra 7:10 is exactly the man who omitted nothing of the law in 1 Esdras 8:7.'),
  -- thread: 1-esdras-8-kings-letter
  ('apocrypha', '1-esdras', 8, 10, 'canon', 'ezra', 7, 13, 'free', E'Ezra 7:13 — *I make a decree, that all they of the people of Yashar''el (Israel), and of his priests and Levites, in my realm, which are minded of their own freewill to go up to Jerusalem, go with thee.* The canon''s freewill decree to go up to Jerusalem is the same commission 1 Esdras 8:10 records.'),
  ('apocrypha', '1-esdras', 8, 13, 'canon', 'ezra', 7, 15, 'free', E'Ezra 7:15 — *And to carry the silver and gold, which the king and his counsellors have freely offered unto the Elohim (God) of Yashar''el (Israel), whose habitation is in Jerusalem.* The freely-offered silver and gold borne to Jerusalem in Ezra 7:15 is the vowed gold and silver of 1 Esdras 8:13.'),
  ('apocrypha', '1-esdras', 8, 21, 'canon', 'ezra', 7, 23, 'free', E'Ezra 7:23 — *Whatsoever is commanded by the Elohim (God) of heaven, let it be diligently done for the house of the Elohim (God) of heaven: for why should there be wrath against the realm of the king and his sons?* The canon''s same dread of wrath upon the king and his sons matches 1 Esdras 8:21 word for word.'),
  -- thread: 1-esdras-8-blessed-be-Yahuah
  ('apocrypha', '1-esdras', 8, 25, 'canon', 'ezra', 7, 27, 'free', E'Ezra 7:27 — *Blessed be Yahuah Elohim (the LORD God) of our fathers, which hath put such a thing as this in the king''s heart, to beautify the house of Yahuah (LORD) which is in Jerusalem.* The canon''s blessing for the heart moved to glorify the house is the same doxology as 1 Esdras 8:25.'),
  ('apocrypha', '1-esdras', 8, 26, 'canon', 'ezra', 7, 28, 'free', E'Ezra 7:28 — *And hath extended mercy unto me before the king, and his counsellors, and before all the king''s mighty princes. And I was strengthened as the hand of Yahuah Elohai (the LORD my God) was upon me, and I gathered together out of Yashar''el (Israel) chief men to go up with me.* The mercy shown before king and counsellors in Ezra 7:28 is the very favour 1 Esdras 8:26 records.'),
  ('apocrypha', '1-esdras', 8, 25, 'canon', 'proverbs', 21, 1, 'free', E'Proverbs 21:1 — *The king''s heart is in the hand of Yahuah, as the rivers of water: he turneth it whithersoever he will.* Proverbs gives the principle behind 1 Esdras 8:25 — Yahuah put the matter into the heart of Artaxerxes.'),
  -- thread: 1-esdras-8-strange-marriages
  ('apocrypha', '1-esdras', 8, 69, 'canon', 'ezra', 9, 1, 'free', E'Ezra 9:1 — *Now when these things were done, the princes came to me, saying, The people of Yashar''el (Israel), and the priests, and the Levites, have not separated themselves from the people of the lands, doing according to their abominations, even of the Canaanites, the Hittites, the Perizzites, the Jebusites, the Ammonites, the Moabites, the Egyptians, and the Amorites.* The canon''s report of the unseparated people is the same news brought to Ezra in 1 Esdras 8:69.'),
  ('apocrypha', '1-esdras', 8, 70, 'canon', 'ezra', 9, 2, 'free', E'Ezra 9:2 — *For they have taken of their daughters for themselves, and for their sons: so that the holy seed have mingled themselves with the people of those lands: yea, the hand of the princes and rulers hath been chief in this trespass.* The mingled holy seed of Ezra 9:2 is the same trespass named in 1 Esdras 8:70.'),
  ('apocrypha', '1-esdras', 8, 70, 'canon', 'deuteronomy', 7, 3, 'free', E'Deuteronomy 7:3 — *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son.* The Torah command broken in 1 Esdras 8:70 is the marriage prohibition Moses gave in Deuteronomy 7:3.'),
  ('apocrypha', '1-esdras', 8, 70, 'canon', 'isaiah', 6, 13, 'free', E'Isaiah 6:13 — *But yet in it shall be a tenth, and it shall return, and shall be eaten: as a teil tree, and as an oak, whose substance is in them, when they cast their leaves: so the holy seed shall be the substance thereof.* Isaiah''s holy seed that remains as the substance is the very seed 1 Esdras 8:70 mourns as mingled.'),
  -- thread: 1-esdras-8-confession-remnant
  ('apocrypha', '1-esdras', 8, 75, 'canon', 'ezra', 9, 6, 'free', E'Ezra 9:6 — *And said, O my Elohim (God), I am ashamed and blush to lift up my face to thee, my Elohim (God): for our iniquities are increased over our head, and our trespass is grown up unto the heavens.* The canon''s iniquities risen over the head and grown to heaven are the very words of 1 Esdras 8:75.'),
  ('apocrypha', '1-esdras', 8, 78, 'canon', 'ezra', 9, 8, 'free', E'Ezra 9:8 — *And now for a little space grace hath been shewed from Yahuah Eloheinu (the LORD our God), to leave us a remnant to escape, and to give us a nail in his holy place, that our Elohim (God) may lighten our eyes, and give us a little reviving in our bondage.* The remnant left in the holy place in Ezra 9:8 is the root and name 1 Esdras 8:78 confesses.'),
  ('apocrypha', '1-esdras', 8, 89, 'canon', 'ezra', 9, 15, 'free', E'Ezra 9:15 — *O Yahuah Elohim (LORD God) of Yashar''el (Israel), thou art righteous: for we remain yet escaped, as it is this day: behold, we are before thee in our trespasses: for we cannot stand before thee because of this.* The canon''s "thou art righteous, we remain yet escaped" is exactly the root-left-this-day confession of 1 Esdras 8:89.'),
  ('apocrypha', '1-esdras', 8, 74, 'canon', 'daniel', 9, 4, 'free', E'Daniel 9:4 — *And I prayed unto Yahuah Elohai (the LORD my God), and made my confession, and said, O Yahuah (Lord), the great and dreadful Elohim (God), keeping the covenant and mercy to them that love him, and to them that keep his commandments.* Daniel''s confessing prayer that pleads the covenant kept is the sibling of Ezra''s confession opened in 1 Esdras 8:74.'),
  -- thread: 1-esdras-8-oath-put-away
  ('apocrypha', '1-esdras', 8, 91, 'canon', 'ezra', 10, 1, 'free', E'Ezra 10:1 — *Now when Ezra had prayed, and when he had confessed, weeping and casting himself down before the house of Elohim (God), there assembled unto him out of Yashar''el (Israel) a very great congregation of men and women and children: for the people wept very sore.* The canon''s weeping congregation gathered before the house is the same multitude 1 Esdras 8:91 describes.'),
  ('apocrypha', '1-esdras', 8, 93, 'canon', 'ezra', 10, 3, 'free', E'Ezra 10:3 — *Now therefore let us make a covenant with our Elohim (God) to put away all the wives, and such as are born of them, according to the counsel of my lord, and of those that tremble at the commandment of our Elohim (God); and let it be done according to the law.* The covenant to put away the wives according to the law is the very oath Jechonias proposes in 1 Esdras 8:93.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1esd8_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1esd8_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-8-ready-scribe',
       E'The scribe with the law in his hand',
       E'1 Esdras opens with the scribe who carries the Torah back to Jerusalem: *This Esdras went up from Babylon, as a scribe, being very ready in the law of Moses, that was given by Yahuah (God) of Yashar''el (Israel)* (1 Esdras 8:3), and *For Esdras had very great skill, so that he omitted nothing of the law and commandments of Yahuah (God), but taught all Yashar''el (Israel) the ordinances and judgments* (1 Esdras 8:7). It ain''t new — this is the very Ezra of the canon, word for word: *This Ezra went up from Babylon; and he was a ready scribe in the law of Moses, which Yahuah Elohim (the LORD God) of Yashar''el (Israel) had given* (Ezra 7:6), the man who *had prepared his heart to seek the law of Yahuah (LORD), and to do it, and to teach in Yashar''el (Israel) statutes and judgments* (Ezra 7:10). Torah carried home, sought, done, and taught — the threefold pattern stands.',
       sv.verse_id, ev.verse_id, 'extras', 62675
  FROM _session253_1esd8_lookup sv, _session253_1esd8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=8 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-8-kings-letter',
       E'The king''s freewill decree for the house',
       E'The Persian decree is reproduced almost line for line. 1 Esdras gives *King Artexerxes to Esdras the priest and reader of the law of Yahuah (God) sends greeting* (1 Esdras 8:9), authorizing all who *are willing and desirous* to go up (8:10), the silver and gold *which I and my friends have vowed* carried to Jerusalem (8:13), and the warning *Let all things be performed after the law of Yahuah (God) diligently to the most high Yahuah (God), that wrath come not upon the kingdom of the king and his sons* (1 Esdras 8:21). The canon''s letter is the same hand: *I make a decree, that all they of the people of Yashar''el (Israel)... which are minded of their own freewill to go up to Jerusalem, go with thee* (Ezra 7:13), the *freewill offered* silver and gold (Ezra 7:15), and *why should there be wrath against the realm of the king and his sons?* (Ezra 7:23). A pagan king''s edict serving the house of Yahuah — election working even through Persia.',
       sv.verse_id, ev.verse_id, 'extras', 62678
  FROM _session253_1esd8_lookup sv, _session253_1esd8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=8 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-8-blessed-be-Yahuah',
       E'Blessed be Yahuah who moved the king''s heart',
       E'Ezra''s doxology breaks out at the decree: *Then said Esdras the scribe, Blessed be the only Yahuah (God) of my fathers, who has put these things into the heart of the king, to glorify his house that is in Jerusalem* (1 Esdras 8:25), *And has honoured me in the sight of the king, and his counsellors, and all his friends and nobles* (8:26). The canon''s blessing is identical: *Blessed be Yahuah Elohim (the LORD God) of our fathers, which hath put such a thing as this in the king''s heart, to beautify the house of Yahuah (LORD) which is in Jerusalem* (Ezra 7:27), *And hath extended mercy unto me before the king, and his counsellors, and before all the king''s mighty princes* (Ezra 7:28). The King of kings turns the heart of an earthly king — *The king''s heart is in the hand of Yahuah, as the rivers of water: he turneth it whithersoever he will* (Proverbs 21:1).',
       sv.verse_id, ev.verse_id, 'extras', 62681
  FROM _session253_1esd8_lookup sv, _session253_1esd8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=25
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=8 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-8-strange-marriages',
       E'The holy seed mingled with the strangers',
       E'The crisis is reported to Ezra: *The nation of Yashar''el (Israel), the princes, the priests and Levites, have not put away from them the strange people of the land* (1 Esdras 8:69), and *the holy seed is mixed with the strange people of the land* (1 Esdras 8:70). The canon reports it in the same words: *The people of Yashar''el (Israel), and the priests, and the Levites, have not separated themselves from the people of the lands* (Ezra 9:1), *so that the holy seed have mingled themselves with the people of those lands* (Ezra 9:2). The Torah command stands behind both — *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son* (Deuteronomy 7:3) — and Isaiah names the very phrase, *so the holy seed shall be the substance thereof* (Isaiah 6:13). The covenant seed kept distinct, never dissolved into the nations.',
       sv.verse_id, ev.verse_id, 'extras', 62684
  FROM _session253_1esd8_lookup sv, _session253_1esd8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=69
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=8 AND ev.verse_number=70
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-8-confession-remnant',
       E'Ezra''s confession and the root left',
       E'Ezra prays the great penitential confession: *I said, O Yahuah (God), I am confounded and ashamed before your face* (1 Esdras 8:74), *For our sins are multiplied above our heads, and our ignorances have reached up to heaven* (8:75), yet *there should be left us a root and a name in the place of your sanctuary* (8:78), closing *O Yahuah (God) of Yashar''el (Israel), you are true: for we are left a root this day* (1 Esdras 8:89). The canon''s Ezra prays the same: *O my Elohim (God), I am ashamed and blush to lift up my face to thee... for our iniquities are increased over our head* (Ezra 9:6), pleading the *remnant to escape* (Ezra 9:8) and confessing *thou art righteous: for we remain yet escaped, as it is this day* (Ezra 9:15). Daniel''s parallel confession stands beside it: *O Yahuah (Lord), the great and dreadful Elohim (God), keeping the covenant and mercy* (Daniel 9:4). Election precedes confession — the root is left because Yahuah is true, not because the people earned it; the remnant of the covenant is never cast away.',
       sv.verse_id, ev.verse_id, 'extras', 62687
  FROM _session253_1esd8_lookup sv, _session253_1esd8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=74
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=8 AND ev.verse_number=89
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-8-oath-put-away',
       E'The covenant and the great congregation',
       E'The people answer the prayer with an oath: *And as Esdras in his prayer made his confession, weeping, and lying flat upon the ground before the temple, there gathered to him from Jerusalem a very great multitude of men and women and children: for there was great weeping among the multitude* (1 Esdras 8:91), and Jechonias cries *Let us make an oath to Yahuah (God), that we will put away all our wives, which we have taken of the heathen, with their children* (1 Esdras 8:93). The canon is the same scene: *Now when Ezra had prayed, and when he had confessed, weeping and casting himself down before the house of Elohim (God), there assembled unto him out of Yashar''el (Israel) a very great congregation* (Ezra 10:1), and Shechaniah answers *let us make a covenant with our Elohim (God) to put away all the wives... and let it be done according to the law* (Ezra 10:3). Repentance gathers the congregation; the covenant is renewed by obeying the law of Yahuah — Torah stands, never set aside.',
       sv.verse_id, ev.verse_id, 'extras', 62690
  FROM _session253_1esd8_lookup sv, _session253_1esd8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=91
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=8 AND ev.verse_number=93
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-esdras-8-ready-scribe
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 7:6 — *This Ezra went up from Babylon; and he was a ready scribe in the law of Moses, which Yahuah Elohim (the LORD God) of Yashar''el (Israel) had given: and the king granted him all his request, according to the hand of Yahuah Elohav (the LORD his God) upon him.* The canon names the same ready scribe going up from Babylon with the law of Moses that 1 Esdras 8:3 retells.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-ready-scribe'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 7:10 — *For Ezra had prepared his heart to seek the law of Yahuah (LORD), and to do it, and to teach in Yashar''el (Israel) statutes and judgments.* The seek-do-teach heart of Ezra 7:10 is exactly the man who omitted nothing of the law in 1 Esdras 8:7.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-ready-scribe'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-8-kings-letter
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 7:13 — *I make a decree, that all they of the people of Yashar''el (Israel), and of his priests and Levites, in my realm, which are minded of their own freewill to go up to Jerusalem, go with thee.* The canon''s freewill decree to go up to Jerusalem is the same commission 1 Esdras 8:10 records.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-kings-letter'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 7:15 — *And to carry the silver and gold, which the king and his counsellors have freely offered unto the Elohim (God) of Yashar''el (Israel), whose habitation is in Jerusalem.* The freely-offered silver and gold borne to Jerusalem in Ezra 7:15 is the vowed gold and silver of 1 Esdras 8:13.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-kings-letter'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=7 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezra 7:23 — *Whatsoever is commanded by the Elohim (God) of heaven, let it be diligently done for the house of the Elohim (God) of heaven: for why should there be wrath against the realm of the king and his sons?* The canon''s same dread of wrath upon the king and his sons matches 1 Esdras 8:21 word for word.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-kings-letter'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-8-blessed-be-Yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 7:27 — *Blessed be Yahuah Elohim (the LORD God) of our fathers, which hath put such a thing as this in the king''s heart, to beautify the house of Yahuah (LORD) which is in Jerusalem.* The canon''s blessing for the heart moved to glorify the house is the same doxology as 1 Esdras 8:25.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-blessed-be-Yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=7 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 7:28 — *And hath extended mercy unto me before the king, and his counsellors, and before all the king''s mighty princes. And I was strengthened as the hand of Yahuah Elohai (the LORD my God) was upon me, and I gathered together out of Yashar''el (Israel) chief men to go up with me.* The mercy shown before king and counsellors in Ezra 7:28 is the very favour 1 Esdras 8:26 records.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-blessed-be-Yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=7 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 21:1 — *The king''s heart is in the hand of Yahuah, as the rivers of water: he turneth it whithersoever he will.* Proverbs gives the principle behind 1 Esdras 8:25 — Yahuah put the matter into the heart of Artaxerxes.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-blessed-be-Yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-8-strange-marriages
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 9:1 — *Now when these things were done, the princes came to me, saying, The people of Yashar''el (Israel), and the priests, and the Levites, have not separated themselves from the people of the lands, doing according to their abominations, even of the Canaanites, the Hittites, the Perizzites, the Jebusites, the Ammonites, the Moabites, the Egyptians, and the Amorites.* The canon''s report of the unseparated people is the same news brought to Ezra in 1 Esdras 8:69.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-strange-marriages'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=69
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=9 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 9:2 — *For they have taken of their daughters for themselves, and for their sons: so that the holy seed have mingled themselves with the people of those lands: yea, the hand of the princes and rulers hath been chief in this trespass.* The mingled holy seed of Ezra 9:2 is the same trespass named in 1 Esdras 8:70.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-strange-marriages'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=70
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=9 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 7:3 — *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son.* The Torah command broken in 1 Esdras 8:70 is the marriage prohibition Moses gave in Deuteronomy 7:3.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-strange-marriages'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=70
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 6:13 — *But yet in it shall be a tenth, and it shall return, and shall be eaten: as a teil tree, and as an oak, whose substance is in them, when they cast their leaves: so the holy seed shall be the substance thereof.* Isaiah''s holy seed that remains as the substance is the very seed 1 Esdras 8:70 mourns as mingled.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-strange-marriages'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=70
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-8-confession-remnant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 9:6 — *And said, O my Elohim (God), I am ashamed and blush to lift up my face to thee, my Elohim (God): for our iniquities are increased over our head, and our trespass is grown up unto the heavens.* The canon''s iniquities risen over the head and grown to heaven are the very words of 1 Esdras 8:75.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-confession-remnant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=75
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 9:8 — *And now for a little space grace hath been shewed from Yahuah Eloheinu (the LORD our God), to leave us a remnant to escape, and to give us a nail in his holy place, that our Elohim (God) may lighten our eyes, and give us a little reviving in our bondage.* The remnant left in the holy place in Ezra 9:8 is the root and name 1 Esdras 8:78 confesses.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-confession-remnant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=78
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=9 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezra 9:15 — *O Yahuah Elohim (LORD God) of Yashar''el (Israel), thou art righteous: for we remain yet escaped, as it is this day: behold, we are before thee in our trespasses: for we cannot stand before thee because of this.* The canon''s "thou art righteous, we remain yet escaped" is exactly the root-left-this-day confession of 1 Esdras 8:89.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-confession-remnant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=89
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=9 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 9:4 — *And I prayed unto Yahuah Elohai (the LORD my God), and made my confession, and said, O Yahuah (Lord), the great and dreadful Elohim (God), keeping the covenant and mercy to them that love him, and to them that keep his commandments.* Daniel''s confessing prayer that pleads the covenant kept is the sibling of Ezra''s confession opened in 1 Esdras 8:74.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-confession-remnant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=74
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-8-oath-put-away
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 10:1 — *Now when Ezra had prayed, and when he had confessed, weeping and casting himself down before the house of Elohim (God), there assembled unto him out of Yashar''el (Israel) a very great congregation of men and women and children: for the people wept very sore.* The canon''s weeping congregation gathered before the house is the same multitude 1 Esdras 8:91 describes.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-oath-put-away'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=91
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=10 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 10:3 — *Now therefore let us make a covenant with our Elohim (God) to put away all the wives, and such as are born of them, according to the counsel of my lord, and of those that tremble at the commandment of our Elohim (God); and let it be done according to the law.* The covenant to put away the wives according to the law is the very oath Jechonias proposes in 1 Esdras 8:93.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-oath-put-away'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=93
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=10 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

