-- ----- fragment: minion_1enoch_25.sql (session250 1-enoch 25) -----
-- Source anchor: enoch/1-enoch ch25. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: en25 (view _session250_en25_lookup). Sort band base 50600, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session250_en25_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-enoch-25-watchers-petition-refused
  ('enoch', '1-enoch', 25, 2, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude names the very Watchers whose intercession Enoch is told to refuse — reserved in chains, not pardoned.'),
  ('enoch', '1-enoch', 25, 2, 'canon', '2-peter', 2, 4, 'free', E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter confirms the sentence Enoch delivers: the angels that sinned are held for judgement, their plea denied.'),
  -- thread: 1-enoch-25-watchers-defiled-with-daughters-of-men
  ('enoch', '1-enoch', 25, 3, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* Enoch''s charge that the Watchers "lain with women" and "taken to yourselves wives" is the inside account of this verse.'),
  ('enoch', '1-enoch', 25, 3, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The giants Enoch says the Watchers begot are the giants Genesis records in the same days.'),
  ('enoch', '1-enoch', 25, 4, 'canon', 'genesis', 6, 3, 'free', E'Genesis 6:3 — *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years.* The Creator''s limit on flesh answers the Watchers who, though spiritual and living the eternal life, lusted after flesh and blood.'),
  -- thread: 1-enoch-25-evil-spirits-from-the-giants
  ('enoch', '1-enoch', 25, 9, 'canon', 'matthew', 12, 43, 'free', E'Matthew 12:43 — *When the unclean spirit is gone out of a man, he walketh through dry places, seeking rest, and findeth none.* Yahusha''s bodiless, restless unclean spirit is exactly Enoch''s evil spirit of the giants, dwelling on the earth, hungering yet taking no food.'),
  ('enoch', '1-enoch', 25, 7, 'enoch', '1-enoch', 15, 7, 'extras', E'1 Enoch 15:7 — *Evil spirits have proceeded from their bodies; because they are born from men and from the holy Watchers is their beginning and primal origin; evil spirits they will be upon earth and evil spirits will they be called.* Chapter 25 in this parse is a verbatim duplicate of chapter 15; the same word on the origin of evil spirits stands in both places.'),
  ('enoch', '1-enoch', 25, 6, 'jubilees', 'jubilees', 10, 1, 'extras', E'Jubilees 10:1 — *And in the third week of this jubilee the unclean demons began to lead astray the children of the sons of Noah; and to make to err and destroy them.* Jubilees shows Enoch''s evil spirits at work after the Flood, the giants'' offspring leading the living astray.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session250_en25_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session250_en25_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-25-watchers-petition-refused',
       E'Intercede for men, not men for you — the Watchers'' petition refused',
       E'Enoch is sent back to the fallen ones with a verdict, not a pardon: *And go, say to the Watchers of heaven, who have sent thee to intercede for them: "You should intercede for men, and not men for you* (1 Enoch 25:2). The order of heaven is inverted when the guardians become the guilty — there is no mediator above them to plead their cause, for they kept not the order they were given. Jude carries this same sentence into the canon: *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6). Peter seals it the same way: *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment* (2 Peter 2:4). The Watchers'' sin is rebellion against the Creator''s order, and the judgement is sure; the petition cannot stand.',
       sv.verse_id, ev.verse_id, 'extras', 50600
  FROM _session250_en25_lookup sv, _session250_en25_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=25 AND sv.verse_number=1
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=25 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-25-watchers-defiled-with-daughters-of-men',
       E'Left the holy heaven and lain with women — Genesis 6 named',
       E'The charge is laid out plainly: *Wherefore have ye left the high, holy, and eternal heaven, and lain with women, and defiled yourselves with the daughters of men and taken to yourselves wives, and done like the children of earth, and begotten giants (as your) sons?* (1 Enoch 25:3); and again, *And though ye were holy, spiritual, living the eternal life, you have defiled yourselves with the blood of women* (1 Enoch 25:4). This is the canon''s own Genesis 6 from the inside: *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2), and *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown* (Genesis 6:4). The Creator''s own answer follows — *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years* (Genesis 6:3) — the same boundary on flesh that Enoch presses against the spiritual ones who lusted after it. It ain''t new: the seed-war begins here.',
       sv.verse_id, ev.verse_id, 'extras', 50603
  FROM _session250_en25_lookup sv, _session250_en25_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=25 AND sv.verse_number=3
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=25 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-enoch-25-evil-spirits-from-the-giants',
       E'Evil spirits proceed from the giants — the origin of the unclean spirits',
       E'Here the text gives the genealogy of evil itself: *And now, the giants, who are produced from the spirits and flesh, shall be called evil spirits upon the earth, and on the earth shall be their dwelling* (1 Enoch 25:6); *Evil spirits have proceeded from their bodies; because they are born from men and from the holy Watchers is their beginning and primal origin* (1 Enoch 25:7); and they *afflict, oppress, destroy, attack, do battle, and work destruction on the earth* (1 Enoch 25:9). This is the explanation behind Yahusha''s own words about the unclean spirit who has no body of its own and roams the dry places seeking rest: *When the unclean spirit is gone out of a man, he walketh through dry places, seeking rest, and findeth none* (Matthew 12:43) — the disembodied dead of the giants, hungering yet eating nothing, exactly as Enoch says they *take no food, but nevertheless hunger and thirst* (1 Enoch 25:9). Jubilees tells the same origin from Noah''s side: *And in the third week of this jubilee the unclean demons began to lead astray the children of the sons of Noah; and to make to err and destroy them* (Jubilees 10:1), and Noah pleads against *Your Watchers, the fathers of these spirits* (Jubilees 10:5). Note for Yoshi: in THIS parse the whole of chapter 25 is a verbatim duplicate of chapter 15 (the intercession-refused / origin-of-spirits rebuke), mislabelled with a throne/tree-of-life title; the self-link below makes the duplication visible on the page.',
       sv.verse_id, ev.verse_id, 'extras', 50606
  FROM _session250_en25_lookup sv, _session250_en25_lookup ev
 WHERE sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=25 AND sv.verse_number=6
   AND ev.edition_slug='enoch' AND ev.book_slug='1-enoch' AND ev.chapter_number=25 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-enoch-25-watchers-petition-refused
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* Jude names the very Watchers whose intercession Enoch is told to refuse — reserved in chains, not pardoned.'
  FROM cross_reference_threads t, cross_references x, _session250_en25_lookup sv, _session250_en25_lookup tv
 WHERE t.slug='1-enoch-25-watchers-petition-refused'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=25 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 2:4 — *For if Elohim (God) spared not the angels that sinned, but cast them down to hell, and delivered them into chains of darkness, to be reserved unto judgment;* Peter confirms the sentence Enoch delivers: the angels that sinned are held for judgement, their plea denied.'
  FROM cross_reference_threads t, cross_references x, _session250_en25_lookup sv, _session250_en25_lookup tv
 WHERE t.slug='1-enoch-25-watchers-petition-refused'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=25 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-25-watchers-defiled-with-daughters-of-men
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* Enoch''s charge that the Watchers "lain with women" and "taken to yourselves wives" is the inside account of this verse.'
  FROM cross_reference_threads t, cross_references x, _session250_en25_lookup sv, _session250_en25_lookup tv
 WHERE t.slug='1-enoch-25-watchers-defiled-with-daughters-of-men'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=25 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* The giants Enoch says the Watchers begot are the giants Genesis records in the same days.'
  FROM cross_reference_threads t, cross_references x, _session250_en25_lookup sv, _session250_en25_lookup tv
 WHERE t.slug='1-enoch-25-watchers-defiled-with-daughters-of-men'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=25 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 6:3 — *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years.* The Creator''s limit on flesh answers the Watchers who, though spiritual and living the eternal life, lusted after flesh and blood.'
  FROM cross_reference_threads t, cross_references x, _session250_en25_lookup sv, _session250_en25_lookup tv
 WHERE t.slug='1-enoch-25-watchers-defiled-with-daughters-of-men'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=25 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-enoch-25-evil-spirits-from-the-giants
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 12:43 — *When the unclean spirit is gone out of a man, he walketh through dry places, seeking rest, and findeth none.* Yahusha''s bodiless, restless unclean spirit is exactly Enoch''s evil spirit of the giants, dwelling on the earth, hungering yet taking no food.'
  FROM cross_reference_threads t, cross_references x, _session250_en25_lookup sv, _session250_en25_lookup tv
 WHERE t.slug='1-enoch-25-evil-spirits-from-the-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=25 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 15:7 — *Evil spirits have proceeded from their bodies; because they are born from men and from the holy Watchers is their beginning and primal origin; evil spirits they will be upon earth and evil spirits will they be called.* Chapter 25 in this parse is a verbatim duplicate of chapter 15; the same word on the origin of evil spirits stands in both places.'
  FROM cross_reference_threads t, cross_references x, _session250_en25_lookup sv, _session250_en25_lookup tv
 WHERE t.slug='1-enoch-25-evil-spirits-from-the-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=25 AND sv.verse_number=7
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=15 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 10:1 — *And in the third week of this jubilee the unclean demons began to lead astray the children of the sons of Noah; and to make to err and destroy them.* Jubilees shows Enoch''s evil spirits at work after the Flood, the giants'' offspring leading the living astray.'
  FROM cross_reference_threads t, cross_references x, _session250_en25_lookup sv, _session250_en25_lookup tv
 WHERE t.slug='1-enoch-25-evil-spirits-from-the-giants'
   AND sv.edition_slug='enoch' AND sv.book_slug='1-enoch' AND sv.chapter_number=25 AND sv.verse_number=6
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

