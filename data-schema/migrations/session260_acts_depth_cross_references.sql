-- =====================================================================
-- Session 260 — Acts (depth) FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py /tmp/nt-depth-wt/data-schema/migrations/session260_acts_depth_cross_references.sql
-- =====================================================================

\echo 'session260 — Acts (depth) cross-references starting...'
BEGIN;

-- ----- fragment: minion_acts_06.sql -----
-- ============================================================================
-- Acts 6 — NT depth pass — 3 NEW threads (THIN-ADD)
-- Existing anchors AVOIDED: 6:1 (the-seven-chosen...), 6:8 (tried-like-his-master...)
-- New blocks: 6:7 ; 6:11-14 ; 6:15
-- sort_order band base 16150 step 3 -> 16150, 16153, 16156
-- ============================================================================

-- 3a. Temp view -------------------------------------------------------------
CREATE TEMP VIEW _acts06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- 3b. cross_references rows --------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- ===== Thread 1 — 6:7 the word increased / the priests obedient =====
  ('canon','acts',6,7,'canon','isaiah',55,11, 'free', E'*So shall my word be that goeth forth out of my mouth: it shall not return unto me void, but it shall accomplish that which I please, and it shall prosper in the thing whereto I sent it* (Isaiah 55:11). Luke says *the word of Elohim (God) increased* (Acts 6:7), and here is the promise it was keeping: Yahuah''s word never comes back empty-handed. It prospers in the very thing He sent it to do — and in Jerusalem it was prospering greatly.'),
  ('canon','acts',6,7,'canon','psalms',110,3, 'free', E'*Thy people shall be willing in the day of thy power, in the beauties of holiness from the womb of the morning: thou hast the dew of thy youth* (Psalm 110:3). When *a great company of the priests were obedient to the faith* (Acts 6:7), this is the willing people of the Anointed One''s day of power — and the same psalm names Him *a priest for ever after the order of Melek Tsadiq (Melchizedek)* (110:4). The priests bow to a greater Priest.'),
  ('canon','acts',6,7,'canon','isaiah',55,3, 'free', E'*Incline your ear, and come unto me: hear, and your soul shall live; and I will make an everlasting covenant with you, even the sure mercies of David* (Isaiah 55:3). The word that *increased* (Acts 6:7) carried these sure mercies to Yahuah''s own people — the priests among them. The covenant was never withdrawn from Yashar''el (Israel); it was being kept.'),
  ('canon','acts',6,7,'canon','romans',11,1, 'free', E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1). That *a great company of the priests* (Acts 6:7) came in is living proof — Yahuah has not cast off Yashar''el. The faith spreads first among His own.'),
  ('canon','acts',6,7,'canon','romans',11,2, 'free', E'*Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2). Hold this guard over Acts 6:7: the priests believing is not Israel replaced but Israel''s remnant gathered — *the election of grace* (11:5) — the word prospering in the thing whereto it was sent.'),

  -- ===== Thread 2 — 6:11-14 the false witnesses against Moses / the law =====
  ('canon','acts',6,11,'canon','exodus',20,16, 'free', E'*Thou shalt not bear false witness against thy neighbour* (Exodus 20:16). The accusers *suborned men* (Acts 6:11) and *set up false witnesses* (6:13) — breaking the very Torah they claimed Stephen despised. The ninth word condemns the accuser, not the accused.'),
  ('canon','acts',6,13,'canon','deuteronomy',19,16, 'free', E'*If a false witness rise up against any man to testify against him that which is wrong* (Deuteronomy 19:16). The Torah foresaw this exact scene and set its judges over it: *the judges shall make diligent inquisition: and, behold, if the witness be a false witness... then shall ye do unto him, as he had thought to have done unto his brother* (19:18-19). The law is Stephen''s defender, not his enemy.'),
  ('canon','acts',6,13,'canon','1-kings',21,13, 'free', E'*And there came in two men, children of Belial, and sat before him: and the men of Belial witnessed against him, even against Naboth... saying, Naboth did blaspheme Elohim (God) and the king. Then they carried him forth out of the city, and stoned him with stones, that he died* (1 Kings 21:13). Jezebel''s plot against Naboth is the template: bought witnesses, a charge of blasphemy, a stoning. Stephen is led the same road (Acts 6:11-13; 7:58).'),
  ('canon','acts',6,11,'canon','1-kings',21,10, 'free', E'*And set two men, sons of Belial, before him, to bear witness against him, saying, Thou didst blaspheme Elohim (God) and the king. And then carry him out, and stone him, that he may die* (1 Kings 21:10). They *suborned men, which said, We have heard him speak blasphemous words* (Acts 6:11) — the suborning of false witnesses is an old Belial-craft, and Yahuah judged it then as He judges it now.'),
  ('canon','acts',6,11,'canon','psalms',35,11, 'free', E'*False witnesses did rise up; they laid to my charge things that I knew not* (Psalm 35:11). The righteous sufferer''s cry is now Stephen''s — and his Master''s before him. They charged him with words he never spake against Moses and the Torah.'),
  ('canon','acts',6,13,'canon','psalms',27,12, 'free', E'*Deliver me not over unto the will of mine enemies: for false witnesses are risen up against me, and such as breathe out cruelty* (Psalm 27:12). David''s prayer fits the council chamber exactly — *false witnesses* (Acts 6:13) breathing out cruelty against a holy place and the law he never reviled.'),

  -- ===== Thread 3 — 6:15 his face as the face of an angel =====
  ('canon','acts',6,15,'canon','exodus',34,29, 'free', E'*And it came to pass, when Moses came down from mount Sinai with the two tables of testimony in Moses'' hand... that Moses wist not that the skin of his face shone while he talked with him* (Exodus 34:29). They accused Stephen of speaking against Moses — yet his face shines with the very glory Moses bore coming down from Yahuah with the Torah in his hands. The witness wears the law''s own glory.'),
  ('canon','acts',6,15,'canon','exodus',34,30, 'free', E'*And when Aaron and all the children of Yashar''el (Israel) saw Moses, behold, the skin of his face shone; and they were afraid to come nigh him* (Exodus 34:30). As Yashar''el saw and feared Moses'' shining face, so *all that sat in the council, looking stedfastly on him, saw his face as it had been the face of an angel* (Acts 6:15) — the same testimony of glory before the same kind of crowd.'),
  ('canon','acts',6,15,'canon','exodus',34,35, 'free', E'*And the children of Yashar''el (Israel) saw the face of Moses, that the skin of Moses'' face shone* (Exodus 34:35). The mark of one who has stood before Yahuah is a shining face. Stephen, charged with despising Moses, is sealed with Moses'' own sign.'),
  ('canon','acts',6,15,'canon','ecclesiastes',8,1, 'free', E'*Who is as the wise man? and who knoweth the interpretation of a thing? a man''s wisdom maketh his face to shine, and the boldness of his face shall be changed* (Ecclesiastes 8:1). They *were not able to resist the wisdom and the spirit by which he spake* (Acts 6:10) — and the wisdom they could not resist made his very face to shine (6:15).'),
  ('canon','acts',6,15,'canon','2-corinthians',3,7, 'free', E'*But if the ministration of death, written and engraven in stones, was glorious, so that the children of Yashar''el (Israel) could not stedfastly behold the face of Moses for the glory of his countenance* (2 Corinthians 3:7). Sha''ul keeps the very picture — the glory on Moses'' face — to show how much more glorious the Spirit''s ministry is. Stephen, full of the Ruach HaKodesh (Holy Spirit), carries that surpassing glory openly (Acts 6:15).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _acts06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _acts06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- 3c. threads ---------------------------------------------------------------
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-6-the-word-increased-and-the-priests-obedient-isaiah-55',
       E'The word that returns not void — and the priests obey',
       E'*And the word of Elohim (God) increased; and the number of the disciples multiplied in Jerusalem greatly; and a great company of the priests were obedient to the faith* (Acts 6:7). Come and see how old this prospering is. Yahuah promised it through Isaiah: *So shall my word be that goeth forth out of my mouth: it shall not return unto me void, but it shall accomplish that which I please, and it shall prosper in the thing whereto I sent it* (Isaiah 55:11). The word *increased* because Yahuah''s word always does what it was sent to do.\n\nAnd who came in? *A great company of the priests.* The willing people of Messiah''s day of power: *Thy people shall be willing in the day of thy power, in the beauties of holiness from the womb of the morning* (Psalm 110:3) — the same psalm that names Him *a priest for ever after the order of Melek Tsadiq (Melchizedek)* (110:4). The priests of the old order bowing to the greater Priest. This was the sure covenant kept, not cancelled: *I will make an everlasting covenant with you, even the sure mercies of David* (Isaiah 55:3).\n\nHold the guard close: this is Yashar''el (Israel) gathered, not Israel cast off. *Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1) — *Elohim (God) hath not cast away his people which he foreknew* (Romans 11:2). That the priests believed is the remnant *according to the election of grace* coming home. The word prospered in the thing whereto it was sent — and it began among His own.',
       sv.verse_id, ev.verse_id, 'free', 16150
  FROM _acts06_lookup sv, _acts06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=6 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=6 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-6-false-witnesses-against-moses-and-the-law-deuteronomy-19',
       E'False witnesses against Moses — the Torah they broke to accuse him',
       E'*Then they suborned men, which said, We have heard him speak blasphemous words against Moses, and against Elohim (God)... And set up false witnesses, which said, This man ceaseth not to speak blasphemous words against this holy place, and the law* (Acts 6:11,13). Come and see who is really breaking the Torah in this room. They charge Stephen with despising the law — and to do it they trample the law. *Thou shalt not bear false witness against thy neighbour* (Exodus 20:16). The ninth word condemns the accusers, not the accused.\n\nThe Torah even wrote the script for handling this very crime: *If a false witness rise up against any man to testify against him that which is wrong* — then *the judges shall make diligent inquisition: and, behold, if the witness be a false witness... then shall ye do unto him, as he had thought to have done unto his brother* (Deuteronomy 19:16,18-19). The law is Stephen''s defender. The accusation against Stephen — that Yahusha (Jesus) would *change the customs which Moses delivered us* (Acts 6:14) — is the lie of paid mouths, not the truth of the gospel. The Torah is honored here; it is the liars who break it.\n\nThis is an old, dark craft. Jezebel did it to Naboth: *And set two men, sons of Belial, before him, to bear witness against him, saying, Thou didst blaspheme Elohim (God) and the king. And then carry him out, and stone him* (1 Kings 21:10) — and so they did: *the men of Belial witnessed against him... Then they carried him forth out of the city, and stoned him with stones, that he died* (1 Kings 21:13). Bought witnesses, a blasphemy charge, a stoning — the very road Stephen is led down. And the righteous have always cried under it: *False witnesses did rise up; they laid to my charge things that I knew not* (Psalm 35:11); *for false witnesses are risen up against me, and such as breathe out cruelty* (Psalm 27:12). Stephen stands where David stood, and where his Master stood. The Torah is not on trial — the false witnesses are.',
       sv.verse_id, ev.verse_id, 'free', 16153
  FROM _acts06_lookup sv, _acts06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=6 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=6 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-6-his-face-as-the-face-of-an-angel-exodus-34',
       E'His face as the face of an angel — the Torah-glory of Moses',
       E'*And all that sat in the council, looking stedfastly on him, saw his face as it had been the face of an angel* (Acts 6:15). Come and see the irony Yahuah sets before the accusers. They charge Stephen with speaking *against Moses* — and as they stare, his face shines with the very glory Moses bore. *And it came to pass, when Moses came down from mount Sinai with the two tables of testimony in Moses'' hand... that Moses wist not that the skin of his face shone while he talked with him* (Exodus 34:29). The man accused of despising the Torah wears the Torah''s own light.\n\nWhat Yashar''el (Israel) once saw, the council now sees: *And when Aaron and all the children of Yashar''el (Israel) saw Moses, behold, the skin of his face shone; and they were afraid to come nigh him* (Exodus 34:30); *and the children of Yashar''el (Israel) saw the face of Moses, that the skin of Moses'' face shone* (Exodus 34:35). A shining face is the mark of one who has stood before Yahuah. And it is wisdom''s mark too: *a man''s wisdom maketh his face to shine* (Ecclesiastes 8:1) — the wisdom *they were not able to resist* (Acts 6:10) was now blazing from his face.\n\nSha''ul keeps the same picture to show how the glory only deepens in the Spirit: *if the ministration of death, written and engraven in stones, was glorious, so that the children of Yashar''el (Israel) could not stedfastly behold the face of Moses for the glory of his countenance* (2 Corinthians 3:7) — *how shall not the ministration of the spirit be rather glorious?* (3:8). Stephen, *full of faith and of the Ruach HaKodesh (Holy Spirit)* (Acts 6:5), carries that surpassing glory openly. The faithful witness shines like Moses — because the same Yahuah, the same word, the same Spirit stand behind both.',
       sv.verse_id, ev.verse_id, 'free', 16156
  FROM _acts06_lookup sv, _acts06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=6 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=6 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- 3d. thread_members --------------------------------------------------------
-- Thread 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 55:11 — *it shall not return unto me void, but it shall accomplish that which I please, and it shall prosper in the thing whereto I sent it* — the word increased because Yahuah''s word always prospers in its errand.'
  FROM cross_reference_threads t, cross_references x, _acts06_lookup sv, _acts06_lookup tv
 WHERE t.slug='acts-6-the-word-increased-and-the-priests-obedient-isaiah-55'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 110:3 — *Thy people shall be willing in the day of thy power* — the priests obedient to the faith are the willing people of Messiah''s day; 110:4 names Him priest after Melek Tsadiq (Melchizedek).'
  FROM cross_reference_threads t, cross_references x, _acts06_lookup sv, _acts06_lookup tv
 WHERE t.slug='acts-6-the-word-increased-and-the-priests-obedient-isaiah-55'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 55:3 — *I will make an everlasting covenant with you, even the sure mercies of David* — the word carried the covenant to His own people; it was kept, not cancelled.'
  FROM cross_reference_threads t, cross_references x, _acts06_lookup sv, _acts06_lookup tv
 WHERE t.slug='acts-6-the-word-increased-and-the-priests-obedient-isaiah-55'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 11:1 — *Hath Elohim (God) cast away his people? Elohim (God) forbid* — the priests believing is living proof Yashar''el is not cast off.'
  FROM cross_reference_threads t, cross_references x, _acts06_lookup sv, _acts06_lookup tv
 WHERE t.slug='acts-6-the-word-increased-and-the-priests-obedient-isaiah-55'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 11:2 — *Elohim (God) hath not cast away his people which he foreknew* — the guard over the verse: Israel''s remnant gathered, not Israel replaced.'
  FROM cross_reference_threads t, cross_references x, _acts06_lookup sv, _acts06_lookup tv
 WHERE t.slug='acts-6-the-word-increased-and-the-priests-obedient-isaiah-55'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:16 — *Thou shalt not bear false witness against thy neighbour* — the ninth word condemns the accusers who suborned men and set up false witnesses.'
  FROM cross_reference_threads t, cross_references x, _acts06_lookup sv, _acts06_lookup tv
 WHERE t.slug='acts-6-false-witnesses-against-moses-and-the-law-deuteronomy-19'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=6 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 19:16 — *If a false witness rise up against any man to testify against him that which is wrong* — the Torah set judges over this exact crime (19:18-19), so the law is Stephen''s defender.'
  FROM cross_reference_threads t, cross_references x, _acts06_lookup sv, _acts06_lookup tv
 WHERE t.slug='acts-6-false-witnesses-against-moses-and-the-law-deuteronomy-19'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=6 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=19 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Kings 21:10 — *set two men, sons of Belial... to bear witness against him, saying, Thou didst blaspheme Elohim (God) and the king* — Jezebel''s suborning of false witnesses, the same Belial-craft.'
  FROM cross_reference_threads t, cross_references x, _acts06_lookup sv, _acts06_lookup tv
 WHERE t.slug='acts-6-false-witnesses-against-moses-and-the-law-deuteronomy-19'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=6 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=21 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Kings 21:13 — *the men of Belial witnessed against him... Then they carried him forth out of the city, and stoned him* — bought witnesses, a blasphemy charge, a stoning: the very road Stephen is led down.'
  FROM cross_reference_threads t, cross_references x, _acts06_lookup sv, _acts06_lookup tv
 WHERE t.slug='acts-6-false-witnesses-against-moses-and-the-law-deuteronomy-19'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=6 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=21 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 35:11 — *False witnesses did rise up; they laid to my charge things that I knew not* — the righteous sufferer''s cry, now Stephen''s, charged with words he never spake.'
  FROM cross_reference_threads t, cross_references x, _acts06_lookup sv, _acts06_lookup tv
 WHERE t.slug='acts-6-false-witnesses-against-moses-and-the-law-deuteronomy-19'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=6 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=35 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Psalm 27:12 — *for false witnesses are risen up against me, and such as breathe out cruelty* — David''s prayer fits the council chamber exactly.'
  FROM cross_reference_threads t, cross_references x, _acts06_lookup sv, _acts06_lookup tv
 WHERE t.slug='acts-6-false-witnesses-against-moses-and-the-law-deuteronomy-19'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=6 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=27 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 34:29 — *Moses wist not that the skin of his face shone while he talked with him* — the accused of despising Moses wears the very Torah-glory Moses bore from Sinai.'
  FROM cross_reference_threads t, cross_references x, _acts06_lookup sv, _acts06_lookup tv
 WHERE t.slug='acts-6-his-face-as-the-face-of-an-angel-exodus-34'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 34:30 — *the skin of his face shone; and they were afraid to come nigh him* — as Yashar''el saw and feared Moses'' shining face, so the council stares at Stephen''s.'
  FROM cross_reference_threads t, cross_references x, _acts06_lookup sv, _acts06_lookup tv
 WHERE t.slug='acts-6-his-face-as-the-face-of-an-angel-exodus-34'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 34:35 — *the children of Yashar''el (Israel) saw the face of Moses, that the skin of Moses'' face shone* — a shining face is the mark of one who has stood before Yahuah; Stephen is sealed with Moses'' own sign.'
  FROM cross_reference_threads t, cross_references x, _acts06_lookup sv, _acts06_lookup tv
 WHERE t.slug='acts-6-his-face-as-the-face-of-an-angel-exodus-34'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiastes 8:1 — *a man''s wisdom maketh his face to shine* — the wisdom they could not resist (Acts 6:10) made his face to shine (6:15).'
  FROM cross_reference_threads t, cross_references x, _acts06_lookup sv, _acts06_lookup tv
 WHERE t.slug='acts-6-his-face-as-the-face-of-an-angel-exodus-34'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=8 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Corinthians 3:7 — *the glory of his countenance* on Moses'' face — Sha''ul keeps the picture to show the Spirit''s ministry is more glorious still; Stephen carries that glory openly.'
  FROM cross_reference_threads t, cross_references x, _acts06_lookup sv, _acts06_lookup tv
 WHERE t.slug='acts-6-his-face-as-the-face-of-an-angel-exodus-34'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_acts_09.sql -----
-- ============================================================================
-- minion_acts_09.sql — Acts 9 NT DEPTH cross-references (3 NEW threads)
-- Saul humbled blind & fasting (9:8-9); scales fall / herald sent (9:17-20);
-- Tabitha raised (9:36-42). DEDUP: 9:3 and 9:10 already anchored — NOT reused.
-- sort_order band base 16240 step 3.
-- ============================================================================

CREATE TEMP VIEW _acts09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================================
-- 3b. cross_references rows
-- ============================================================================
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- THREAD 1 — Saul arose blind, three days neither ate nor drank (9:8-9)
  ('canon','acts',9,8,'canon','genesis',19,11, 'free', E'*And they smote the men that were at the door of the house with blindness, both small and great: so that they wearied themselves to find the door* (Genesis 19:11). The messengers of Yahuah struck the men of Sodom blind at the very door they meant to break down — the proud groping in the dark. So Saul, breathing slaughter, is met on the Damascus road and *led by the hand* (Acts 9:8), the persecutor now as helpless as those he came to bind.'),
  ('canon','acts',9,9,'canon','deuteronomy',8,2, 'free', E'*And thou shalt remember all the way which Yahuah Elohayka (the LORD thy God) led thee these forty years in the wilderness, to humble thee, and to prove thee, to know what was in thine heart, whether thou wouldest keep his commandments, or no* (Deuteronomy 8:2). Yahuah humbles and proves before He gives. Saul''s three dark days are his own little wilderness — the proud heart laid bare before it is remade.'),
  ('canon','acts',9,9,'canon','deuteronomy',8,3, 'free', E'*And he humbled thee, and suffered thee to hunger... that he might make thee know that man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah (LORD) doth man live* (Deuteronomy 8:3). Saul *neither did eat nor drink* (Acts 9:9) — emptied of every fleshly support, taught that life is not in bread but in the word now turning him.'),
  ('canon','acts',9,9,'canon','jonah',3,7, 'free', E'*Let neither man nor beast, herd nor flock, taste any thing: let them not feed, nor drink water* (Jonah 3:7). Nineveh''s fast turned a city from violence; Saul''s fast turns a violent man. Neither eating nor drinking is the body bowing while the heart repents.'),
  ('canon','acts',9,9,'canon','exodus',24,18, 'free', E'*And Moses went into the midst of the cloud... and Moses was in the mount forty days and forty nights* (Exodus 24:18). The dark waiting before revelation — Moses hidden in the cloud, Saul hidden in his blindness, each held in stillness until Yahuah speaks the next word.'),
  ('canon','acts',9,9,'canon','exodus',34,28, 'free', E'*And he was there with Yahuah (LORD) forty days and forty nights; he did neither eat bread, nor drink water. And he wrote upon the tables the words of the covenant, the ten commandments* (Exodus 34:28). Moses too neither ate nor drank in the presence of Yahuah — and came down bearing the covenant, the Torah unbroken. Saul''s fast is the same pattern: the flesh stilled, the word of Yahuah about to be written anew on a heart (Ezekiel 36:26-27), the commandments standing as ever.'),

  -- THREAD 2 — scales fell, filled with the Ruach, straightway preached (9:17-20)
  ('canon','acts',9,18,'canon','isaiah',35,5, 'free', E'*Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped* (Isaiah 35:5). When *immediately there fell from his eyes as it had been scales* (Acts 9:18), the prophet''s promise is fulfilled in a single man — and it is Yahuah who opens eyes, the Father''s sign worked through the name of His Formed Son.'),
  ('canon','acts',9,17,'canon','isaiah',42,6, 'free', E'*I Yahuah (LORD) have called thee in righteousness, and will hold thine hand, and will keep thee... and give thee for a covenant of the people, for a light of the Gentiles* (Isaiah 42:6). Ananias is sent to one already called to be a light to the nations — sight given so that a herald may go.'),
  ('canon','acts',9,17,'canon','isaiah',42,7, 'free', E'*To open the blind eyes, to bring out the prisoners from the prison, and them that sit in darkness out of the prison house* (Isaiah 42:7). The Servant''s own commission is laid on Saul: his blind eyes opened that he might open others'', the jailer of saints now their fellow-prisoner of hope.'),
  ('canon','acts',9,20,'canon','isaiah',49,6, 'free', E'*It is a light thing that thou shouldest be my servant to raise up the tribes of Jacob, and to restore the preserved of Yashar''el (Israel): I will also give thee for a light to the Gentiles, that thou mayest be my salvation unto the end of the earth* (Isaiah 49:6). *Straightway he preached Messiah... that he is the Son of Elohim* (Acts 9:20). The light goes to the nations — yet never apart from Israel, for the nations gathered are scattered Yashar''el coming home and the stranger grafted in; *Elohim hath not cast away his people* (Romans 11:1-2).'),

  -- THREAD 3 — Tabitha raised: the Father raises the dead through the Son name (9:36-42)
  ('canon','acts',9,40,'canon','1-kings',17,21, 'free', E'*And he stretched himself upon the child three times, and cried unto Yahuah (LORD)... let this child''s soul come into him again* (1 Kings 17:21). Elijah does not raise by his own power but cries unto Yahuah. So Peter *kneeled down, and prayed* (Acts 9:40) before he says *Tabitha, arise* — the prophet bows, the Father raises.'),
  ('canon','acts',9,40,'canon','1-kings',17,22, 'free', E'*And Yahuah (LORD) heard the voice of Elijah; and the soul of the child came into him again, and he revived* (1 Kings 17:22). It is Yahuah who heard and Yahuah who restored — the same hand that, in the name of Yahusha, now opens Tabitha''s eyes.'),
  ('canon','acts',9,40,'canon','2-kings',4,34, 'free', E'*And he went up, and lay upon the child... and the flesh of the child waxed warm* (2 Kings 4:34). Elisha, like Elijah before him, raises a dead child through earnest prayer and the power of Yahuah — the pattern Peter walks in at Joppa.'),
  ('canon','acts',9,40,'canon','2-kings',4,35, 'free', E'*And the child sneezed seven times, and the child opened his eyes* (2 Kings 4:35). *And she opened her eyes: and when she saw Peter, she sat up* (Acts 9:40). The very gesture echoes across the centuries — the dead opening their eyes by the resurrection-power of Yahuah.'),
  ('canon','acts',9,40,'canon','ezekiel',37,3, 'free', E'*Son of Adam, can these bones live? And I answered, O Yahuah (Lord) GOD, thou knowest* (Ezekiel 37:3). Only Yahuah knows, and only Yahuah can. Tabitha raised is one woman; the dry bones are the whole house of Yashar''el — the same breath of life promised to a nation.'),
  ('canon','acts',9,40,'canon','ezekiel',37,5, 'free', E'*Thus saith Adonai Yahuah (the Lord GOD) unto these bones; Behold, I will cause breath to enter into you, and ye shall live* (Ezekiel 37:5). The Father is the giver of breath and life — through Elijah, through Elisha, through Peter in Yahusha''s name, and at the last over all the slain of His people.'),
  ('canon','acts',9,42,'apocrypha','the-wisdom-of-solomon',16,13, 'extras', E'*For you have power of life and death: you leadest to the gates of hell, and bringest up again* (Wisdom of Solomon 16:13). Israel''s own wisdom confessed it long before Joppa: life and death belong to Yahuah alone, who *bringest up again*. When *many believed in Yahuah* (Acts 9:42), they believed in the One who has always held that power.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _acts09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _acts09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================================
-- 3c. threads
-- ============================================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-9-blind-and-fasting-the-proud-persecutor-humbled-before-he-is-remade',
       E'Three Days Blind and Fasting — the Proud Humbled Before He Is Remade',
       E'Come and see how Saul''s broken days were written long before. *And Saul arose from the earth; and when his eyes were opened, he saw no man: but they led him by the hand, and brought him into Damascus. And he was three days without sight, and neither did eat nor drink* (Acts 9:8-9). The man who came to bind is led like a child; the man who breathed slaughter cannot feed himself.\n\nThis is an old pattern. *And they smote the men that were at the door of the house with blindness, both small and great: so that they wearied themselves to find the door* (Genesis 19:11) — the proud of Sodom struck blind at the very door they meant to break. And before Yahuah gives, He humbles: *And thou shalt remember all the way which Yahuah Elohayka (the LORD thy God) led thee these forty years in the wilderness, to humble thee, and to prove thee, to know what was in thine heart* (Deuteronomy 8:2), *that he might make thee know that man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah (LORD) doth man live* (Deuteronomy 8:3).\n\nThe fast is the body bowing while the heart turns — Nineveh''s decree: *Let neither man nor beast, herd nor flock, taste any thing: let them not feed, nor drink water* (Jonah 3:7). And the dark waiting before revelation is Moses'' own: *And Moses went into the midst of the cloud... and Moses was in the mount forty days and forty nights* (Exodus 24:18); *And he was there with Yahuah (LORD) forty days and forty nights; he did neither eat bread, nor drink water. And he wrote upon the tables the words of the covenant, the ten commandments* (Exodus 34:28). Moses came down bearing the Torah unbroken. Saul comes out of his blindness with the same word about to be written on a new heart (Ezekiel 36:26-27) — the commandments standing, the flesh stilled, the persecutor made ready to be remade.',
       sv.verse_id, ev.verse_id, 'free', 16240
  FROM _acts09_lookup sv, _acts09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=9 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-9-scales-fell-from-his-eyes-the-chief-persecutor-made-a-light-to-the-nations',
       E'The Scales Fell — Sight Given, the Persecutor Made a Herald',
       E'Come and see the prophet''s commission laid on the chief persecutor. *And immediately there fell from his eyes as it had been scales: and he received sight forthwith, and arose, and was baptized* (Acts 9:18), and *straightway he preached Messiah (Christ) in the synagogues, that he is the Son of Elohim (God)* (Acts 9:20). Ananias lays on hands, the Ruach HaKodesh fills him, and the jailer of saints becomes their herald.\n\nThis is the Servant-song made flesh in a man. *Then the eyes of the blind shall be opened, and the ears of the deaf shall be unstopped* (Isaiah 35:5) — and it is Yahuah who opens eyes, the Father''s sign worked through the name of His Formed Son. *I Yahuah (LORD) have called thee in righteousness, and will hold thine hand, and will keep thee... and give thee for a covenant of the people, for a light of the Gentiles* (Isaiah 42:6); *to open the blind eyes, to bring out the prisoners from the prison, and them that sit in darkness out of the prison house* (Isaiah 42:7). His own blind eyes opened that he might open others''.\n\nAnd the reach of that light is named: *It is a light thing that thou shouldest be my servant to raise up the tribes of Jacob, and to restore the preserved of Yashar''el (Israel): I will also give thee for a light to the Gentiles, that thou mayest be my salvation unto the end of the earth* (Isaiah 49:6). The light goes to the nations — yet never apart from Israel, for the nations gathered are scattered Yashar''el coming home and the stranger grafted in. *Elohim hath not cast away his people* (Romans 11:1-2). One library, one purpose, the persecutor turned to herald.',
       sv.verse_id, ev.verse_id, 'free', 16243
  FROM _acts09_lookup sv, _acts09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=9 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-9-tabitha-arise-the-father-raises-the-dead-through-the-sons-name',
       E'Tabitha, Arise — the Father Raises the Dead, Once Through the Prophets, Now Through His Son''s Name',
       E'Come and see that the power to raise the dead has always been Yahuah''s. *But Peter put them all forth, and kneeled down, and prayed; and turning him to the body said, Tabitha, arise. And she opened her eyes: and when she saw Peter, she sat up* (Acts 9:40). Peter kneels first — the prophet bows, the Father raises — and *many believed in Yahuah* (Acts 9:42).\n\nElijah walked this path: *And he stretched himself upon the child three times, and cried unto Yahuah (LORD)... let this child''s soul come into him again* (1 Kings 17:21); *And Yahuah (LORD) heard the voice of Elijah; and the soul of the child came into him again, and he revived* (1 Kings 17:22). So did Elisha: *And he went up, and lay upon the child... and the flesh of the child waxed warm* (2 Kings 4:34); *Then the child sneezed seven times, and the child opened his eyes* (2 Kings 4:35) — the very gesture Tabitha makes, the dead opening their eyes.\n\nAnd the promise runs to a whole nation: *Son of Adam, can these bones live? And I answered, O Yahuah (Lord) GOD, thou knowest* (Ezekiel 37:3); *Behold, I will cause breath to enter into you, and ye shall live* (Ezekiel 37:5). Israel''s own wisdom confessed it: *For you have power of life and death: you leadest to the gates of hell, and bringest up again* (Wisdom of Solomon 16:13). Through Elijah, through Elisha, through Peter in Yahusha''s name, and at the last over all the slain of His people — the Father is the giver of breath and life.',
       sv.verse_id, ev.verse_id, 'extras', 16246
  FROM _acts09_lookup sv, _acts09_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=36
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=9 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

-- ============================================================================
-- 3d. thread_members
-- ============================================================================
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 19:11 — *they smote the men that were at the door... with blindness, both small and great* — the proud groping in the dark, struck at the very door they meant to break.'
  FROM cross_reference_threads t, cross_references x, _acts09_lookup sv, _acts09_lookup tv
 WHERE t.slug='acts-9-blind-and-fasting-the-proud-persecutor-humbled-before-he-is-remade'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=19 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 8:2 — *to humble thee, and to prove thee, to know what was in thine heart* — Yahuah humbles before He gives; Saul''s three dark days are his wilderness.'
  FROM cross_reference_threads t, cross_references x, _acts09_lookup sv, _acts09_lookup tv
 WHERE t.slug='acts-9-blind-and-fasting-the-proud-persecutor-humbled-before-he-is-remade'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 8:3 — *man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah* — Saul emptied of fleshly support, taught where life truly is.'
  FROM cross_reference_threads t, cross_references x, _acts09_lookup sv, _acts09_lookup tv
 WHERE t.slug='acts-9-blind-and-fasting-the-proud-persecutor-humbled-before-he-is-remade'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jonah 3:7 — *let them not feed, nor drink water* — Nineveh''s fast turned a city from violence; Saul''s turns a violent man.'
  FROM cross_reference_threads t, cross_references x, _acts09_lookup sv, _acts09_lookup tv
 WHERE t.slug='acts-9-blind-and-fasting-the-proud-persecutor-humbled-before-he-is-remade'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=3 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Exodus 24:18 — *Moses was in the mount forty days and forty nights* — the dark waiting before revelation, held in stillness until Yahuah speaks.'
  FROM cross_reference_threads t, cross_references x, _acts09_lookup sv, _acts09_lookup tv
 WHERE t.slug='acts-9-blind-and-fasting-the-proud-persecutor-humbled-before-he-is-remade'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=24 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Exodus 34:28 — *he did neither eat bread, nor drink water. And he wrote... the ten commandments* — Moses fasts and comes down with the Torah unbroken; Saul''s fast is the same pattern, the commandments standing.'
  FROM cross_reference_threads t, cross_references x, _acts09_lookup sv, _acts09_lookup tv
 WHERE t.slug='acts-9-blind-and-fasting-the-proud-persecutor-humbled-before-he-is-remade'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=34 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 35:5 — *Then the eyes of the blind shall be opened* — the prophet''s promise fulfilled in one man; it is Yahuah who opens eyes, through the name of His Formed Son.'
  FROM cross_reference_threads t, cross_references x, _acts09_lookup sv, _acts09_lookup tv
 WHERE t.slug='acts-9-scales-fell-from-his-eyes-the-chief-persecutor-made-a-light-to-the-nations'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 42:6 — *I will... give thee for a covenant of the people, for a light of the Gentiles* — Ananias is sent to one already called to be a light to the nations.'
  FROM cross_reference_threads t, cross_references x, _acts09_lookup sv, _acts09_lookup tv
 WHERE t.slug='acts-9-scales-fell-from-his-eyes-the-chief-persecutor-made-a-light-to-the-nations'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=42 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 42:7 — *To open the blind eyes, to bring out the prisoners* — the Servant''s commission laid on Saul: his eyes opened that he might open others''.'
  FROM cross_reference_threads t, cross_references x, _acts09_lookup sv, _acts09_lookup tv
 WHERE t.slug='acts-9-scales-fell-from-his-eyes-the-chief-persecutor-made-a-light-to-the-nations'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=42 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 49:6 — *to raise up the tribes of Jacob... I will also give thee for a light to the Gentiles* — the light to the nations is never apart from Israel; *Elohim hath not cast away his people* (Romans 11:1-2).'
  FROM cross_reference_threads t, cross_references x, _acts09_lookup sv, _acts09_lookup tv
 WHERE t.slug='acts-9-scales-fell-from-his-eyes-the-chief-persecutor-made-a-light-to-the-nations'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Kings 17:21 — *he... cried unto Yahuah... let this child''s soul come into him again* — Elijah raises not by his own power but by crying unto Yahuah; Peter likewise kneels and prays.'
  FROM cross_reference_threads t, cross_references x, _acts09_lookup sv, _acts09_lookup tv
 WHERE t.slug='acts-9-tabitha-arise-the-father-raises-the-dead-through-the-sons-name'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=17 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Kings 17:22 — *And Yahuah heard the voice of Elijah; and the soul of the child came into him again* — it is Yahuah who heard and Yahuah who restored.'
  FROM cross_reference_threads t, cross_references x, _acts09_lookup sv, _acts09_lookup tv
 WHERE t.slug='acts-9-tabitha-arise-the-father-raises-the-dead-through-the-sons-name'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=17 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Kings 4:34 — *he went up, and lay upon the child... and the flesh of the child waxed warm* — Elisha raises a dead child through earnest prayer and the power of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _acts09_lookup sv, _acts09_lookup tv
 WHERE t.slug='acts-9-tabitha-arise-the-father-raises-the-dead-through-the-sons-name'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=4 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Kings 4:35 — *the child sneezed seven times, and the child opened his eyes* — the very gesture Tabitha makes: *she opened her eyes... and sat up* (Acts 9:40).'
  FROM cross_reference_threads t, cross_references x, _acts09_lookup sv, _acts09_lookup tv
 WHERE t.slug='acts-9-tabitha-arise-the-father-raises-the-dead-through-the-sons-name'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=4 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ezekiel 37:3 — *Son of Adam, can these bones live? ... O Yahuah (Lord) GOD, thou knowest* — only Yahuah knows and only Yahuah can; Tabitha is one woman, the dry bones the whole house of Yashar''el.'
  FROM cross_reference_threads t, cross_references x, _acts09_lookup sv, _acts09_lookup tv
 WHERE t.slug='acts-9-tabitha-arise-the-father-raises-the-dead-through-the-sons-name'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Ezekiel 37:5 — *I will cause breath to enter into you, and ye shall live* — the Father is the giver of breath and life, through Elijah, Elisha, Peter, and at the last over all His people.'
  FROM cross_reference_threads t, cross_references x, _acts09_lookup sv, _acts09_lookup tv
 WHERE t.slug='acts-9-tabitha-arise-the-father-raises-the-dead-through-the-sons-name'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Wisdom of Solomon 16:13 — *For you have power of life and death... and bringest up again* — Israel''s own wisdom confessed long before Joppa that life and death belong to Yahuah alone.'
  FROM cross_reference_threads t, cross_references x, _acts09_lookup sv, _acts09_lookup tv
 WHERE t.slug='acts-9-tabitha-arise-the-father-raises-the-dead-through-the-sons-name'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=9 AND sv.verse_number=42
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=16 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_acts_11.sql -----
-- minion_acts_11.sql — Acts 11 NT-depth full-library cross-reference threads
-- THIN-ADD: avoids existing anchors 11:15 and 11:19. Three NEW threads on 11:21, 11:26, 11:27-30.

-- ============================================================ 3a. TEMP VIEW
CREATE TEMP VIEW _acts11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================ 3b. CROSS_REFERENCES (all members)
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- THREAD 1 — 11:21 the hand of Yahuah / a great number turned (shuv)
  ('canon','acts',11,21,'canon','2-chronicles',30,12, 'free', E'*Also in Yahudah (Judah) the hand of Elohim (God) was to give them one heart to do the commandment of the king and of the princes, by the word of Yahuah (LORD)* (2 Chronicles 30:12). When Hezekiah called all Yashar''el (Israel) and Yahudah (Judah) back to the Passover, it was the Father''s hand that gave them one heart to obey — the very thing now at work in Antioch: *the hand of Yahuah (Lord) was with them.*'),
  ('canon','acts',11,21,'canon','ezra',7,9, 'free', E'*For upon the first day of the first month began he to go up from Babylon, and on the first day of the fifth month came he to Jerusalem, according to the good hand of his Elohim (God) upon him* (Ezra 7:9). The good hand of Elohim brought Ezra up to teach the Torah; the same good hand goes with the heralds at Antioch — the gathering is His doing, not man''s.'),
  ('canon','acts',11,21,'canon','isaiah',59,1, 'free', E'*Behold, the LORD''S hand is not shortened, that it cannot save; neither his ear heavy, that it cannot hear* (Isaiah 59:1). The hand that *was with them* at Antioch is the unshortened saving hand of Yahuah — reaching now to a great number who believed and turned.'),
  ('canon','acts',11,21,'canon','1-samuel',7,3, 'free', E'*If ye do return unto Yahuah (LORD) with all your hearts, then put away the strange gods and Ashtaroth from among you, and prepare your hearts unto Yahuah (LORD), and serve him only* (1 Samuel 7:3). To *turn unto Yahuah* is the old word — shuv, return. The great number at Antioch did exactly what Samuel called Yashar''el to do: turn back with the whole heart.'),
  ('canon','acts',11,21,'canon','acts',2,47, 'free', E'*Praising Elohim (God), and having favour with all the people. And Yahuah (Lord) added to the church daily such as should be saved* (Acts 2:47). From the first ingathering at Jerusalem to this one at Antioch, the increase is the same: Yahuah Himself adds, His hand gathering His people home.'),

  -- THREAD 2 — 11:26 called Christians (of HaMashiach) first in Antioch — the new name
  ('canon','acts',11,26,'canon','isaiah',62,2, 'free', E'*And the Gentiles shall see thy righteousness, and all kings thy glory: and thou shalt be called by a new name, which the mouth of Yahuah (LORD) shall name* (Isaiah 62:2). The people of Messiah bear a name no man invented; the mouth of Yahuah named the gathered, and at Antioch the new name is heard — those of HaMashiach.'),
  ('canon','acts',11,26,'canon','isaiah',65,15, 'free', E'*And ye shall leave your name for a curse unto my chosen: for Adonai Yahuah (the Lord GOD) shall slay thee, and call his servants by another name* (Isaiah 65:15). Yahuah promised to *call his servants by another name* — the old reproach left behind, His servants marked as His own. Antioch hears it: His servants called by His Anointed''s name.'),
  ('canon','acts',11,26,'canon','isaiah',56,5, 'free', E'*Even unto them will I give in mine house and within my walls a place and a name better than of sons and of daughters: I will give them an everlasting name, that shall not be cut off* (Isaiah 56:5). To the stranger and the eunuch who join themselves to Yahuah He gives *a name better than of sons* — the everlasting name now resting on the gathered at Antioch, Judah and grafted nations as one.'),
  ('canon','acts',11,26,'canon','romans',11,1, 'free', E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1). The new name names a people made larger, never a people replaced — *Elohim hath not cast away his people which he foreknew* (Romans 11:2). The strangers grafted in at Antioch join Yashar''el; they do not supplant her.'),

  -- THREAD 3 — 11:27-30 Agabus foretells the famine / relief to Judaea — Torah of the open hand
  ('canon','acts',11,27,'canon','genesis',41,29, 'free', E'*Behold, there come seven years of great plenty throughout all the land of Egypt* (Genesis 41:29). As Yoseph was given by the Spirit to foresee the famine and lay up bread, so Agabus *signified by the Spirit* the great dearth to come — the prophet forewarns, that the people may prepare.'),
  ('canon','acts',11,27,'canon','genesis',41,30, 'free', E'*And there shall arise after them seven years of famine; and all the plenty shall be forgotten in the land of Egypt; and the famine shall consume the land* (Genesis 41:30). The pattern is one: Elohim shows His servant what He is about to do, and through that forewarning a whole household is kept alive. Antioch hears Agabus and at once provides for the brethren in Judaea.'),
  ('canon','acts',11,29,'canon','deuteronomy',15,7, 'free', E'*If there be among you a poor man of one of thy brethren within any of thy gates in thy land which Yahuah Elohayka (the LORD thy God) giveth thee, thou shalt not harden thine heart, nor shut thine hand from thy poor brother* (Deuteronomy 15:7). The relief sent to Judaea is the Torah of the open hand kept in full — *thou shalt open thine hand wide unto him* (Deuteronomy 15:8). The commandment was never abolished; it is alive in the body of Messiah caring for its own across the distance.'),
  ('canon','acts',11,29,'canon','proverbs',11,25, 'free', E'*The liberal soul shall be made fat: and he that watereth shall be watered also himself* (Proverbs 11:25). Each gave *according to his ability* — the liberal soul of Proverbs, watering the brethren and so being watered.'),
  ('canon','acts',11,29,'canon','proverbs',19,17, 'free', E'*He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again* (Proverbs 19:17). What Antioch sent to Judaea was, in truth, lent to Yahuah Himself; He keeps the account of every open hand.'),
  ('canon','acts',11,29,'apocrypha','ecclesiasticus',29,9, 'extras', E'*Help the poor for the commandment''s sake, and turn him not away because of his poverty* (Sirach 29:9). The second-Temple sages read the open-hand statute exactly as Antioch lived it — mercy to the poor done *for the commandment''s sake*, Torah obeyed in love, not set aside.'),
  ('canon','acts',11,29,'canon','2-corinthians',9,7, 'free', E'*Every man according as he purposeth in his heart, so let him give; not grudgingly, or of necessity: for Elohim (God) loveth a cheerful giver* (2 Corinthians 9:7). The same Sha''ul who carried this relief later wrote how it is to be given — *every man according as he purposeth* — the open-hand Torah breathing through the gathered, one people caring for one people.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _acts11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _acts11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================ 3c. THREADS
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-11-the-hand-of-yahuah-and-a-great-number-turned-the-gathering-hand',
       E'Acts 11:21 — The hand of Yahuah, and a great number turned',
       E'*And the hand of Yahuah (Lord) was with them: and a great number believed, and turned unto Yahuah (Lord)* (Acts 11:21). The increase at Antioch is laid at one source — the Father''s hand. Come and see how old that hand is. When Hezekiah called all Yashar''el (Israel) and Yahudah (Judah) home to the Passover, *the hand of Elohim (God) was to give them one heart to do the commandment* (2 Chronicles 30:12). When Ezra went up to teach the Torah it was *according to the good hand of his Elohim (God) upon him* (Ezra 7:9). And lest any think the arm grown weak: *Behold, the LORD''S hand is not shortened, that it cannot save* (Isaiah 59:1). The turning itself is the old word — shuv, to return: *If ye do return unto Yahuah (LORD) with all your hearts... and serve him only* (1 Samuel 7:3), Samuel''s call now answered by a great number at Antioch. From the first ingathering — *Yahuah (Lord) added to the church daily such as should be saved* (Acts 2:47) — to this one, the gathering is His hand, His doing. The library is one, and it ain''t new.',
       sv.verse_id, ev.verse_id, 'free', 16300
  FROM _acts11_lookup sv, _acts11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=11 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=11 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-11-called-by-a-new-name-the-people-of-hamashiach-isaiah-62',
       E'Acts 11:26 — Called by a new name: the people of HaMashiach',
       E'*And the disciples were called Christians first in Antioch* (Acts 11:26) — the gathered marked out by the name of HaMashiach. Come and see: a new name on the people of Yahuah was promised long before Antioch. *Thou shalt be called by a new name, which the mouth of Yahuah (LORD) shall name* (Isaiah 62:2) — no name man invented, but one the mouth of Yahuah speaks. *Adonai Yahuah (the Lord GOD)... shall call his servants by another name* (Isaiah 65:15), the old reproach left behind. And to the stranger who joins himself to Yahuah: *I will give them an everlasting name, that shall not be cut off* (Isaiah 56:5) — *a name better than of sons.* But mark the guard: this new name names a people made larger, never a people replaced. *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1); *Elohim hath not cast away his people which he foreknew* (Romans 11:2). The Grecians grafted in at Antioch join Yashar''el — Judah and the nations gathered into one — they do not supplant her. The library is one, and it ain''t new.',
       sv.verse_id, ev.verse_id, 'free', 16303
  FROM _acts11_lookup sv, _acts11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=11 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=11 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-11-agabus-the-dearth-and-the-torah-of-the-open-hand-genesis-41-deut-15',
       E'Acts 11:27-30 — Agabus, the dearth, and the Torah of the open hand',
       E'*And there stood up one of them named Agabus, and signified by the Spirit that there should be great dearth throughout all the world... Then the disciples, every man according to his ability, determined to send relief unto the brethren which dwelt in Judæa* (Acts 11:28-29). Two old patterns meet here. First the prophet forewarns: as Yoseph was shown the famine — *Behold, there come seven years of great plenty* (Genesis 41:29) and *there shall arise after them seven years of famine* (Genesis 41:30) — and laid up bread to keep a household alive, so Agabus signifies the dearth that the body may prepare. Then the body answers in the very words of the Torah: *thou shalt not harden thine heart, nor shut thine hand from thy poor brother* (Deuteronomy 15:7); *thou shalt open thine hand wide unto him* (Deuteronomy 15:8). The commandment was never abolished — it breathes. *The liberal soul shall be made fat* (Proverbs 11:25); *He that hath pity upon the poor lendeth unto Yahuah (LORD)* (Proverbs 19:17). The second-Temple sages kept the same reading: *Help the poor for the commandment''s sake* (Sirach 29:9) — mercy done for the commandment''s sake, not in place of it. And the apostle who carried this relief later wrote how it is given: *Elohim (God) loveth a cheerful giver* (2 Corinthians 9:7). One people caring for one people across the distance — the Torah of the open hand, alive. The library is one, and it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 16306
  FROM _acts11_lookup sv, _acts11_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=11 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=11 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

-- ============================================================ 3d. THREAD_MEMBERS
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Chronicles 30:12 — *the hand of Elohim (God) was to give them one heart to do the commandment* — Hezekiah''s ingathering; the Father''s hand gives one heart to obey.'
  FROM cross_reference_threads t, cross_references x, _acts11_lookup sv, _acts11_lookup tv
 WHERE t.slug='acts-11-the-hand-of-yahuah-and-a-great-number-turned-the-gathering-hand'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=11 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=30 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 7:9 — *according to the good hand of his Elohim (God) upon him* — the good hand brings up His own to do and teach Torah.'
  FROM cross_reference_threads t, cross_references x, _acts11_lookup sv, _acts11_lookup tv
 WHERE t.slug='acts-11-the-hand-of-yahuah-and-a-great-number-turned-the-gathering-hand'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=11 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 59:1 — *the LORD''S hand is not shortened, that it cannot save* — the hand with them at Antioch is the unshortened saving hand.'
  FROM cross_reference_threads t, cross_references x, _acts11_lookup sv, _acts11_lookup tv
 WHERE t.slug='acts-11-the-hand-of-yahuah-and-a-great-number-turned-the-gathering-hand'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=11 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=59 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Samuel 7:3 — *If ye do return unto Yahuah (LORD) with all your hearts... and serve him only* — to turn unto Yahuah is shuv, return; the great number does it.'
  FROM cross_reference_threads t, cross_references x, _acts11_lookup sv, _acts11_lookup tv
 WHERE t.slug='acts-11-the-hand-of-yahuah-and-a-great-number-turned-the-gathering-hand'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=11 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Acts 2:47 — *Yahuah (Lord) added to the church daily such as should be saved* — the same gathering hand, first at Jerusalem, now at Antioch.'
  FROM cross_reference_threads t, cross_references x, _acts11_lookup sv, _acts11_lookup tv
 WHERE t.slug='acts-11-the-hand-of-yahuah-and-a-great-number-turned-the-gathering-hand'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=11 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=47
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 62:2 — *thou shalt be called by a new name, which the mouth of Yahuah (LORD) shall name* — the new name on the gathered is named by Yahuah Himself.'
  FROM cross_reference_threads t, cross_references x, _acts11_lookup sv, _acts11_lookup tv
 WHERE t.slug='acts-11-called-by-a-new-name-the-people-of-hamashiach-isaiah-62'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=11 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=62 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 65:15 — *shall call his servants by another name* — the old reproach left behind, His servants newly named.'
  FROM cross_reference_threads t, cross_references x, _acts11_lookup sv, _acts11_lookup tv
 WHERE t.slug='acts-11-called-by-a-new-name-the-people-of-hamashiach-isaiah-62'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=11 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 56:5 — *a place and a name better than of sons and of daughters... an everlasting name, that shall not be cut off* — given to the stranger grafted in.'
  FROM cross_reference_threads t, cross_references x, _acts11_lookup sv, _acts11_lookup tv
 WHERE t.slug='acts-11-called-by-a-new-name-the-people-of-hamashiach-isaiah-62'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=11 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=56 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 11:1 — *Hath Elohim (God) cast away his people? Elohim (God) forbid* — the guard: the new name enlarges Yashar''el, never replaces her (Romans 11:2).'
  FROM cross_reference_threads t, cross_references x, _acts11_lookup sv, _acts11_lookup tv
 WHERE t.slug='acts-11-called-by-a-new-name-the-people-of-hamashiach-isaiah-62'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=11 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 41:29 — *there come seven years of great plenty* — Yoseph shown the years by the Spirit, as Agabus signifies the dearth.'
  FROM cross_reference_threads t, cross_references x, _acts11_lookup sv, _acts11_lookup tv
 WHERE t.slug='acts-11-agabus-the-dearth-and-the-torah-of-the-open-hand-genesis-41-deut-15'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=11 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 41:30 — *there shall arise after them seven years of famine... and the famine shall consume the land* — forewarned, a household is kept alive.'
  FROM cross_reference_threads t, cross_references x, _acts11_lookup sv, _acts11_lookup tv
 WHERE t.slug='acts-11-agabus-the-dearth-and-the-torah-of-the-open-hand-genesis-41-deut-15'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=11 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 15:7 — *thou shalt not harden thine heart, nor shut thine hand from thy poor brother* — the open-hand statute the relief to Judaea fulfils (Deut 15:8).'
  FROM cross_reference_threads t, cross_references x, _acts11_lookup sv, _acts11_lookup tv
 WHERE t.slug='acts-11-agabus-the-dearth-and-the-torah-of-the-open-hand-genesis-41-deut-15'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=11 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 11:25 — *The liberal soul shall be made fat: and he that watereth shall be watered also himself* — each gave according to his ability.'
  FROM cross_reference_threads t, cross_references x, _acts11_lookup sv, _acts11_lookup tv
 WHERE t.slug='acts-11-agabus-the-dearth-and-the-torah-of-the-open-hand-genesis-41-deut-15'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=11 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Proverbs 19:17 — *He that hath pity upon the poor lendeth unto Yahuah (LORD)* — what Antioch sent was lent to Yahuah Himself.'
  FROM cross_reference_threads t, cross_references x, _acts11_lookup sv, _acts11_lookup tv
 WHERE t.slug='acts-11-agabus-the-dearth-and-the-torah-of-the-open-hand-genesis-41-deut-15'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=11 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Sirach 29:9 — *Help the poor for the commandment''s sake* — the second-Temple reading of the open-hand statute: Torah obeyed in love, not set aside.'
  FROM cross_reference_threads t, cross_references x, _acts11_lookup sv, _acts11_lookup tv
 WHERE t.slug='acts-11-agabus-the-dearth-and-the-torah-of-the-open-hand-genesis-41-deut-15'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=11 AND sv.verse_number=29
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=29 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'2 Corinthians 9:7 — *Elohim (God) loveth a cheerful giver* — the apostle who carried this relief on how it is given; the open-hand Torah breathing through the gathered.'
  FROM cross_reference_threads t, cross_references x, _acts11_lookup sv, _acts11_lookup tv
 WHERE t.slug='acts-11-agabus-the-dearth-and-the-torah-of-the-open-hand-genesis-41-deut-15'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=11 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=9 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_acts_12.sql -----
-- ============================================================================
-- minion_acts_12.sql  —  Acts 12 NT-depth full-library cross-reference threads
-- James martyred / Peter freed from prison / Herod struck down / the word grows
-- 3 NEW threads (THIN-ADD); DEDUP avoids 12:5 and 12:20 existing anchors.
-- Temp-view tag: _acts12_lookup   sort_order band: 16330 step 3
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 3a. Temp view
-- ----------------------------------------------------------------------------
CREATE TEMP VIEW _acts12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ----------------------------------------------------------------------------
-- 3b. cross_references rows
-- ----------------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES

  -- === THREAD 1 — 12:1-4 James slain with the sword / Peter taken at the feast ===
  ('canon','acts',12,2,'canon','psalms',79,3, 'free', E'*Their blood have they shed like water round about Jerusalem; and there was none to bury them* (Psalm 79:3). When Herod *killed James the brother of John with the sword* (Acts 12:2), the cry of Asaph rises up under it — the blood of Yahuah''s servants poured out like water, the very plea *Let the sighing of the prisoner come before thee* (Psalm 79:11) that Peter would need that same night.'),
  ('canon','acts',12,2,'canon','lamentations',4,13, 'free', E'*For the sins of her prophets, and the iniquities of her priests, that have shed the blood of the just in the midst of her* (Lamentations 4:13). The first apostle-martyr falls in the very city where the blood of the just had been shed before — Jerusalem is again the place where the righteous are cut down, the long lament continued.'),
  ('canon','acts',12,2,'canon','zechariah',13,7, 'free', E'*Awake, O sword, against my shepherd, and against the man that is my fellow, saith Yahuah Tseva''ot (LORD of hosts): smite the shepherd, and the sheep shall be scattered* (Zechariah 13:7). The sword that took James is the sword the prophet foresaw falling on the shepherd and the flock — the scattering of the little ones, the cup of suffering the Master had already drunk.'),
  ('canon','acts',12,2,'canon','matthew',26,31, 'free', E'*Then saith Yahusha (Jesus) unto them, All ye shall be offended because of me this night: for it is written, I will smite the shepherd, and the sheep of the flock shall be scattered abroad* (Matthew 26:31). The Formed Son had named Zechariah''s word over His own twelve; now the sword reaches one of them. He drank the cup first; James drinks after Him — the servant is not above his Master.'),
  ('canon','acts',12,2,'canon','revelation',6,9, 'free', E'*And when he had opened the fifth seal, I saw under the altar the souls of them that were slain for the word of Elohim (God), and for the testimony which they held* (Revelation 6:9). James goes to the altar where the martyrs wait — *How long, O Yahuah (Lord)... dost thou not judge and avenge our blood?* (Revelation 6:10). The same *how long* Asaph cried (Psalm 79:5); the same blood not forgotten.'),
  ('canon','acts',12,3,'canon','exodus',12,14, 'free', E'*And this day shall be unto you for a memorial; and ye shall keep it a feast to Yahuah (LORD) throughout your generations; ye shall keep it a feast by an ordinance for ever* (Exodus 12:14). Luke marks the season precisely — *(Then were the days of unleavened bread.)* (Acts 12:3). The feast is still being KEPT, decades after the resurrection; the ordinance for ever stands, the calendar of Yahuah unbroken.'),
  ('canon','acts',12,3,'canon','1-corinthians',5,8, 'free', E'*Therefore let us keep the feast, not with old leaven, neither with the leaven of malice and wickedness; but with the unleavened bread of sincerity and truth* (1 Corinthians 5:8). The same apostolic generation is told to *keep the feast* — Messiah our passover sacrificed, the unleavened bread still on the table. Acts 12:3 simply shows them doing it.'),
  ('canon','acts',12,3,'apocrypha','1-maccabees',2,50, 'extras', E'*Now therefore, my sons, be you zealous for the law, and give your lives for the covenant of your fathers. Call to remembrance what acts our fathers did in their time; so shall you receive great honour and an everlasting name* (1 Maccabees 2:50-51). Mattathias'' charge to his sons is the pattern James fulfils — to give one''s life for the covenant and win an everlasting name. The martyr does not die for a new thing but for the old faith of the fathers.'),

  -- === THREAD 2 — 12:6-11 the chains fall off / the iron gate opens of its own accord ===
  ('canon','acts',12,7,'canon','psalms',107,14, 'free', E'*He brought them out of darkness and the shadow of death, and brake their bands in sunder* (Psalm 107:14). *A light shined in the prison... and his chains fell off from his hands* (Acts 12:7). The Father who breaks the bands of the captive is the One who frees Peter; the angel is His messenger, the deliverance His.'),
  ('canon','acts',12,7,'canon','psalms',107,16, 'free', E'*For he hath broken the gates of brass, and cut the bars of iron in sunder* (Psalm 107:16). The *iron gate that leadeth unto the city; which opened to them of his own accord* (Acts 12:10) is the very gate of iron the psalm sang of — the Deliverer needs no key; brass and iron yield before Him.'),
  ('canon','acts',12,7,'canon','psalms',146,7, 'free', E'*Which executeth judgment for the oppressed: which giveth food to the hungry. Yahuah (LORD) looseth the prisoners* (Psalm 146:7). Put not your trust in princes, the psalm says — and Herod is the prince undone. It is Yahuah, not man, who *looseth the prisoners*; Peter is loosed by the hand the psalm names.'),
  ('canon','acts',12,7,'canon','isaiah',61,1, 'free', E'*The Spirit of Adonai Yahuah (the Lord GOD) is upon me; because Yahuah (LORD) hath anointed me... to proclaim liberty to the captives, and the opening of the prison to them that are bound* (Isaiah 61:1). The Messiah''s own commission — the opening of the prison — works on through His messenger upon His servant; the captive set at liberty in the flesh, a sign of the greater liberty.'),
  ('canon','acts',12,7,'canon','daniel',6,22, 'free', E'*My Elohim (God) hath sent his angel, and hath shut the lions'' mouths, that they have not hurt me: forasmuch as before him innocency was found in me* (Daniel 6:22). Daniel in the lions'' den, Peter between the soldiers — the same word: *My Elohim hath sent his angel.* Peter says it too: *Now I know of a surety, that Yahuah (Lord) hath sent his angel, and hath delivered me* (Acts 12:11). The library tells one rescue twice.'),
  ('canon','acts',12,7,'canon','acts',5,19, 'free', E'*But the angel of Yahuah (Lord) by night opened the prison doors, and brought them forth* (Acts 5:19). This is not the first time — earlier the same angel opened the same kind of door for the apostles. The Father guards His witnesses; the prison cannot hold the word He has loosed.'),
  ('canon','acts',12,7,'canon','acts',16,26, 'free', E'*And suddenly there was a great earthquake, so that the foundations of the prison were shaken: and immediately all the doors were opened, and every one''s bands were loosed* (Acts 16:26). Paul and Silas after Peter — doors opened, bands loosed, the very pattern of Acts 12. The Deliverer is consistent; chains fall wherever His servants are bound for the word.'),

  -- === THREAD 3 — 12:24 but the word of Elohim grew and multiplied ===
  ('canon','acts',12,24,'canon','isaiah',55,11, 'free', E'*So shall my word be that goeth forth out of my mouth: it shall not return unto me void, but it shall accomplish that which I please, and it shall prosper in the thing whereto I sent it* (Isaiah 55:11). Herod is *eaten of worms* (Acts 12:23) — *But the word of Elohim (God) grew and multiplied* (Acts 12:24). The tyrant returns to dust; the Father''s word does not return void. That is the whole contrast that closes the chapter.'),
  ('canon','acts',12,24,'canon','exodus',1,12, 'free', E'*But the more they afflicted them, the more they multiplied and grew* (Exodus 1:12). The oldest law of Yahuah''s people under a tyrant: persecution makes them increase. Pharaoh could not stop Yashar''el; Herod cannot stop the word — *grew and multiplied* (Acts 12:24) echoes Egypt word for word.'),
  ('canon','acts',12,24,'canon','genesis',1,28, 'free', E'*And Elohim (God) blessed them, and Elohim (God) said unto them, Be fruitful, and multiply, and replenish the earth* (Genesis 1:28). The Creator''s first blessing — *be fruitful, and multiply* — is the very verb spoken over His word. What He blessed at the beginning He blesses still; the word *grew and multiplied* under the same creating power.'),
  ('canon','acts',12,24,'canon','psalms',2,1, 'free', E'*Why do the heathen rage, and the people imagine a vain thing? The kings of the earth set themselves, and the rulers take counsel together, against Yahuah (LORD), and against his anointed* (Psalm 2:1-2). Herod is the raging king, the ruler taking counsel; the *vain thing* is his oration on the throne. The chapter is Psalm 2 played out in Caesarea.'),
  ('canon','acts',12,24,'canon','psalms',2,4, 'free', E'*He that sitteth in the heavens shall laugh: Yahuah (Lord) shall have them in derision* (Psalm 2:4). The king arrayed in royal apparel is hailed as a god and struck the same hour — He that sitteth in the heavens laughs. The throne in Caesarea is nothing before the throne in heaven; the word goes on.'),
  ('canon','acts',12,24,'canon','acts',19,20, 'free', E'*So mightily grew the word of Elohim (God) and prevailed* (Acts 19:20). Luke sounds the refrain again later — the word *grew* and *prevailed*, unstoppable. Acts 12:24 is the seed of it: every tyrant falls, the word keeps multiplying.'),
  ('canon','acts',12,24,'apocrypha','1-maccabees',2,62, 'extras', E'*Fear not then the words of a sinful man: for his glory shall be dung and worms. To day he shall be lifted up and to morrow he shall not be found, because he is returned into his dust* (1 Maccabees 2:62-63). Mattathias named the end of the proud tyrant — lifted up today, dung and worms tomorrow. Herod *eaten of worms* (Acts 12:23) is that word fulfilled to the letter, while the word of Elohim multiplies on.')

)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _acts12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _acts12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3c. threads
-- ----------------------------------------------------------------------------

-- THREAD 1 — 12:1-4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-12-james-slain-with-the-sword-the-feast-still-kept',
       E'James slain with the sword — the blood of the just, the feast still kept',
       E'**Come and see** — the first of the twelve to fall. *And he killed James the brother of John with the sword* (Acts 12:2); and because it pleased the people, Herod took Peter also, *(Then were the days of unleavened bread.)* (Acts 12:3). This is no new grief. *Their blood have they shed like water round about Jerusalem; and there was none to bury them* (Psalm 79:3) — Asaph''s lament rises under it, the same *how long?* (Psalm 79:5) Peter would need that night. It falls in the city *that have shed the blood of the just in the midst of her* (Lamentations 4:13), the long lament continued. The sword itself was foreseen: *Awake, O sword, against my shepherd... smite the shepherd, and the sheep shall be scattered* (Zechariah 13:7) — the word the Formed Son had already taken over His own twelve, *for it is written, I will smite the shepherd, and the sheep of the flock shall be scattered abroad* (Matthew 26:31). He drank the cup first; James drinks after Him, going up to the altar where the martyrs wait — *I saw under the altar the souls of them that were slain for the word of Elohim (God)... How long, O Yahuah (Lord)... dost thou not judge and avenge our blood?* (Revelation 6:9-10). And mark the season Luke is careful to give: *ye shall keep it a feast to Yahuah (LORD) throughout your generations... by an ordinance for ever* (Exodus 12:14). Decades after the resurrection the days of unleavened bread are still being KEPT — *Therefore let us keep the feast... with the unleavened bread of sincerity and truth* (1 Corinthians 5:8). The Torah is not abolished by the gospel; the apostles live it. And the martyr dies for that same old faith: *be you zealous for the law, and give your lives for the covenant of your fathers... so shall you receive great honour and an everlasting name* (1 Maccabees 2:50-51). James wins the everlasting name — not for a new thing, but for the covenant of the fathers, the library that is one and ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 16330
  FROM _acts12_lookup sv, _acts12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=12 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 — 12:6-11
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-12-the-chains-fell-off-the-iron-gate-opened',
       E'The chains fell off — the iron gate that opened of its own accord',
       E'**Come and see** — the same night Herod meant to bring him forth, Peter slept *bound with two chains* between the soldiers (Acts 12:6); *and, behold, the angel of Yahuah (Lord) came upon him, and a light shined in the prison... And his chains fell off from his hands* (Acts 12:7). This is the Father''s own work, done by His messenger. *He brought them out of darkness and the shadow of death, and brake their bands in sunder* (Psalm 107:14) — and when they came to *the iron gate that leadeth unto the city; which opened to them of his own accord* (Acts 12:10), it is the very gate the psalm sang: *For he hath broken the gates of brass, and cut the bars of iron in sunder* (Psalm 107:16). The Deliverer needs no key. *Put not your trust in princes* — for *Yahuah (LORD) looseth the prisoners* (Psalm 146:7); Herod the prince is undone, and it is Yahuah, not man, who looses. The Messiah''s own commission runs on through this: *he hath sent me... to proclaim liberty to the captives, and the opening of the prison to them that are bound* (Isaiah 61:1). And Peter himself names the source — *Now I know of a surety, that Yahuah (Lord) hath sent his angel, and hath delivered me out of the hand of Herod* (Acts 12:11) — the very words of Daniel in the den: *My Elohim (God) hath sent his angel, and hath shut the lions'' mouths* (Daniel 6:22). The library tells one rescue many times: *the angel of Yahuah (Lord) by night opened the prison doors* (Acts 5:19) before, and after, *immediately all the doors were opened, and every one''s bands were loosed* (Acts 16:26) for Paul and Silas. The Father guards His witnesses; chains fall wherever His servants are bound for the word — distinct from the prayer of the church (12:5), this is the act of release itself, His hand on the iron.',
       sv.verse_id, ev.verse_id, 'free', 16333
  FROM _acts12_lookup sv, _acts12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=12 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 — 12:24
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-12-the-word-of-elohim-grew-and-multiplied',
       E'But the word of Elohim grew and multiplied — the tyrant struck, the word unstoppable',
       E'**Come and see** the contrast that closes the chapter. The king is hailed *It is the voice of a god, and not of a man* (Acts 12:22), and the same hour *the angel of Yahuah (Lord) smote him, because he gave not Elohim (God) the glory: and he was eaten of worms, and gave up the ghost* (Acts 12:23). Then one line, quiet and unstoppable: *But the word of Elohim (God) grew and multiplied* (Acts 12:24). The tyrant returns to dust; the Father''s word does not return void — *it shall not return unto me void, but it shall accomplish that which I please, and it shall prosper in the thing whereto I sent it* (Isaiah 55:11). It is the oldest law of His people under a tyrant: *the more they afflicted them, the more they multiplied and grew* (Exodus 1:12). Pharaoh could not stop Yashar''el; Herod cannot stop the word — *grew and multiplied* echoes Egypt word for word, and echoes the Creator''s first blessing: *Be fruitful, and multiply, and replenish the earth* (Genesis 1:28). What He blessed at the beginning He blesses still. And the proud king on his throne? *Why do the heathen rage... The kings of the earth set themselves, and the rulers take counsel together, against Yahuah (LORD), and against his anointed* (Psalm 2:1-2) — yet *He that sitteth in the heavens shall laugh: Yahuah (Lord) shall have them in derision* (Psalm 2:4). The throne in Caesarea is nothing before the throne in heaven. Luke sounds the refrain again later — *So mightily grew the word of Elohim (God) and prevailed* (Acts 19:20). And Mattathias named the end of every such tyrant long before: *Fear not then the words of a sinful man: for his glory shall be dung and worms. To day he shall be lifted up and to morrow he shall not be found* (1 Maccabees 2:62-63). Herod eaten of worms is that word to the letter — while the word of Elohim multiplies on. The library is one, and it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 16336
  FROM _acts12_lookup sv, _acts12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=12 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3d. thread_members
-- ----------------------------------------------------------------------------

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 79:3 — *Their blood have they shed like water round about Jerusalem; and there was none to bury them.* Asaph''s lament under the martyr''s blood.'
  FROM cross_reference_threads t, cross_references x, _acts12_lookup sv, _acts12_lookup tv
 WHERE t.slug='acts-12-james-slain-with-the-sword-the-feast-still-kept'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=79 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Lamentations 4:13 — *...that have shed the blood of the just in the midst of her.* The city where the righteous are cut down again.'
  FROM cross_reference_threads t, cross_references x, _acts12_lookup sv, _acts12_lookup tv
 WHERE t.slug='acts-12-james-slain-with-the-sword-the-feast-still-kept'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=4 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 13:7 — *...smite the shepherd, and the sheep shall be scattered...* The foreseen sword on shepherd and flock.'
  FROM cross_reference_threads t, cross_references x, _acts12_lookup sv, _acts12_lookup tv
 WHERE t.slug='acts-12-james-slain-with-the-sword-the-feast-still-kept'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=13 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 26:31 — *...I will smite the shepherd, and the sheep of the flock shall be scattered abroad.* The Formed Son had named Zechariah over His twelve.'
  FROM cross_reference_threads t, cross_references x, _acts12_lookup sv, _acts12_lookup tv
 WHERE t.slug='acts-12-james-slain-with-the-sword-the-feast-still-kept'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 6:9 — *...the souls of them that were slain for the word of Elohim (God)...* James goes to the altar where the martyrs wait and cry *how long*.'
  FROM cross_reference_threads t, cross_references x, _acts12_lookup sv, _acts12_lookup tv
 WHERE t.slug='acts-12-james-slain-with-the-sword-the-feast-still-kept'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Exodus 12:14 — *...ye shall keep it a feast by an ordinance for ever.* The days of unleavened bread still kept; the Torah not abolished.'
  FROM cross_reference_threads t, cross_references x, _acts12_lookup sv, _acts12_lookup tv
 WHERE t.slug='acts-12-james-slain-with-the-sword-the-feast-still-kept'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'1 Corinthians 5:8 — *Therefore let us keep the feast... with the unleavened bread of sincerity and truth.* The same apostolic generation keeping the feast.'
  FROM cross_reference_threads t, cross_references x, _acts12_lookup sv, _acts12_lookup tv
 WHERE t.slug='acts-12-james-slain-with-the-sword-the-feast-still-kept'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'1 Maccabees 2:50-51 — *...give your lives for the covenant of your fathers... so shall you receive great honour and an everlasting name.* The martyr-pattern James fulfils.'
  FROM cross_reference_threads t, cross_references x, _acts12_lookup sv, _acts12_lookup tv
 WHERE t.slug='acts-12-james-slain-with-the-sword-the-feast-still-kept'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=2 AND tv.verse_number=50
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 107:14 — *He brought them out of darkness and the shadow of death, and brake their bands in sunder.* The chains fall; the bands are broken.'
  FROM cross_reference_threads t, cross_references x, _acts12_lookup sv, _acts12_lookup tv
 WHERE t.slug='acts-12-the-chains-fell-off-the-iron-gate-opened'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=107 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 107:16 — *For he hath broken the gates of brass, and cut the bars of iron in sunder.* The iron gate that opened of its own accord.'
  FROM cross_reference_threads t, cross_references x, _acts12_lookup sv, _acts12_lookup tv
 WHERE t.slug='acts-12-the-chains-fell-off-the-iron-gate-opened'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=107 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 146:7 — *...Yahuah (LORD) looseth the prisoners.* Not man but Yahuah looses Peter; Herod the prince undone.'
  FROM cross_reference_threads t, cross_references x, _acts12_lookup sv, _acts12_lookup tv
 WHERE t.slug='acts-12-the-chains-fell-off-the-iron-gate-opened'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=146 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 61:1 — *...to proclaim liberty to the captives, and the opening of the prison to them that are bound.* The Messiah''s commission runs on through His messenger.'
  FROM cross_reference_threads t, cross_references x, _acts12_lookup sv, _acts12_lookup tv
 WHERE t.slug='acts-12-the-chains-fell-off-the-iron-gate-opened'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Daniel 6:22 — *My Elohim (God) hath sent his angel, and hath shut the lions'' mouths...* The same word Peter speaks in 12:11; one rescue told twice.'
  FROM cross_reference_threads t, cross_references x, _acts12_lookup sv, _acts12_lookup tv
 WHERE t.slug='acts-12-the-chains-fell-off-the-iron-gate-opened'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=6 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Acts 5:19 — *But the angel of Yahuah (Lord) by night opened the prison doors, and brought them forth...* The same angel had opened the same kind of door before.'
  FROM cross_reference_threads t, cross_references x, _acts12_lookup sv, _acts12_lookup tv
 WHERE t.slug='acts-12-the-chains-fell-off-the-iron-gate-opened'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=5 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Acts 16:26 — *...immediately all the doors were opened, and every one''s bands were loosed.* Paul and Silas after Peter; the Deliverer is consistent.'
  FROM cross_reference_threads t, cross_references x, _acts12_lookup sv, _acts12_lookup tv
 WHERE t.slug='acts-12-the-chains-fell-off-the-iron-gate-opened'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=16 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 55:11 — *So shall my word be... it shall not return unto me void...* The Father''s word does not return void; the tyrant returns to dust.'
  FROM cross_reference_threads t, cross_references x, _acts12_lookup sv, _acts12_lookup tv
 WHERE t.slug='acts-12-the-word-of-elohim-grew-and-multiplied'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 1:12 — *But the more they afflicted them, the more they multiplied and grew.* Persecution makes Yahuah''s people increase; *grew and multiplied* echoes Egypt.'
  FROM cross_reference_threads t, cross_references x, _acts12_lookup sv, _acts12_lookup tv
 WHERE t.slug='acts-12-the-word-of-elohim-grew-and-multiplied'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 1:28 — *...Be fruitful, and multiply, and replenish the earth...* The Creator''s first blessing is the verb spoken over His word.'
  FROM cross_reference_threads t, cross_references x, _acts12_lookup sv, _acts12_lookup tv
 WHERE t.slug='acts-12-the-word-of-elohim-grew-and-multiplied'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 2:1 — *Why do the heathen rage... The kings of the earth set themselves...* Herod the raging king; the chapter is Psalm 2 played out in Caesarea.'
  FROM cross_reference_threads t, cross_references x, _acts12_lookup sv, _acts12_lookup tv
 WHERE t.slug='acts-12-the-word-of-elohim-grew-and-multiplied'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 2:4 — *He that sitteth in the heavens shall laugh...* The throne in Caesarea is nothing before the throne in heaven.'
  FROM cross_reference_threads t, cross_references x, _acts12_lookup sv, _acts12_lookup tv
 WHERE t.slug='acts-12-the-word-of-elohim-grew-and-multiplied'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Acts 19:20 — *So mightily grew the word of Elohim (God) and prevailed.* Luke''s refrain sounded again; the word unstoppable.'
  FROM cross_reference_threads t, cross_references x, _acts12_lookup sv, _acts12_lookup tv
 WHERE t.slug='acts-12-the-word-of-elohim-grew-and-multiplied'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=19 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'1 Maccabees 2:62-63 — *...for his glory shall be dung and worms. To day he shall be lifted up and to morrow he shall not be found...* Herod eaten of worms, that word to the letter.'
  FROM cross_reference_threads t, cross_references x, _acts12_lookup sv, _acts12_lookup tv
 WHERE t.slug='acts-12-the-word-of-elohim-grew-and-multiplied'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=12 AND sv.verse_number=24
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=2 AND tv.verse_number=62
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session260 — Acts (depth) cross-references complete.'
