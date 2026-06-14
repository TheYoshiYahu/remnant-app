-- ----- fragment: minion_hermas_22.sql (session253 hermas 22) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch22. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm22 (view _session253_herm22_lookup). Sort band base 72025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm22_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-22-the-true-fast
  ('lightfoot-apostolic-fathers', 'hermas', 22, 1, 'canon', 'isaiah', 58, 6, 'free', E'Isaiah 58:6 — *Is not this the fast that I have chosen? to loose the bands of wickedness, to undo the heavy burdens, and to let the oppressed go free, and that ye break every yoke?* The Shepherd''s ''do no wickedness, observe His commandments and walk in His ordinances'' is the prophet''s own fast that looses wickedness — the true fast was never mere abstinence.'),
  ('lightfoot-apostolic-fathers', 'hermas', 22, 1, 'canon', 'isaiah', 58, 7, 'free', E'Isaiah 58:7 — *Is it not to deal thy bread to the hungry, and that thou bring the poor that are cast out to thy house? when thou seest the naked, that thou cover him; and that thou hide not thyself from thine own flesh?* The fast Yahuah chooses pours out to the hungry and the cast-out, the very righteousness the Shepherd sets in place of the vain fast.'),
  -- thread: hermas-22-the-vineyard-fenced-and-digged
  ('lightfoot-apostolic-fathers', 'hermas', 22, 2, 'canon', 'matthew', 21, 33, 'free', E'Matthew 21:33 — *Hear another parable: There was a certain householder, which planted a vineyard, and hedged it round about, and digged a winepress in it, and built a tower, and let it out to husbandmen, and went into a far country:* The Shepherd''s master who planted a vineyard, set a fence about it, and travelled abroad is the Master''s own householder — the planted vineyard is the people, kept by the servant against the lord''s return.'),
  -- thread: hermas-22-the-son-the-formed-in-power
  ('lightfoot-apostolic-fathers', 'hermas', 22, 6, 'canon', 'romans', 8, 3, 'free', E'Romans 8:3 — *For what the law could not do, in that it was weak through the flesh, Elohim (God) sending his own Son in the likeness of sinful flesh, and for sin, condemned sin in the flesh:* The Son who cleansed His people''s sins by much labour, the Formed Son sent by His Father, is the very Son sent in the likeness of flesh to condemn sin in the flesh — power exercised in obedience to the One who sent Him.'),
  ('lightfoot-apostolic-fathers', 'hermas', 22, 6, 'canon', 'romans', 8, 4, 'free', E'Romans 8:4 — *That the righteousness of the law might be fulfilled in us, who walk not after the flesh, but after the Spirit.* The Son who ''showed them the paths of life, giving them the law which He received from His Father'' gives the law that its righteousness be fulfilled in the people — the Torah honoured and written within, never cast off.'),
  -- thread: hermas-22-keep-the-flesh-pure-temple-of-the-spirit
  ('lightfoot-apostolic-fathers', 'hermas', 22, 7, 'canon', '1-corinthians', 3, 16, 'free', E'1 Corinthians 3:16 — *Know ye not that ye are the temple of Elohim (God), and that the Spirit of Elohim (God) dwelleth in you?* The Shepherd''s flesh wherein the Ruach HaKodesh dwells is Sha''ul''s temple in which the Spirit of Elohim dwells — the body made the dwelling-place of the Spirit.'),
  ('lightfoot-apostolic-fathers', 'hermas', 22, 7, 'canon', '1-corinthians', 3, 17, 'free', E'1 Corinthians 3:17 — *If any man defile the temple of Elohim (God), him shall Elohim (God) destroy; for the temple of Elohim (God) is holy, which temple ye are.* The Shepherd''s warning that he who defiles his flesh defiles the Spirit and shall not live is Sha''ul''s own — defile the temple and Elohim will destroy, for the temple is holy.'),
  ('lightfoot-apostolic-fathers', 'hermas', 22, 7, 'canon', '1-corinthians', 6, 19, 'free', E'1 Corinthians 6:19 — *What? know ye not that your body is the temple of the Ruach HaKodesh (Holy Spirit) which is in you, which ye have of Elohim (God), and ye are not your own?* The charge to keep this flesh pure and undefiled because the Holy Spirit dwells in it is Sha''ul''s word that the body is the temple of the Ruach HaKodesh and is not our own.'),
  ('lightfoot-apostolic-fathers', 'hermas', 22, 7, 'canon', 'romans', 8, 16, 'free', E'Romans 8:16 — *The Spirit itself beareth witness with our spirit, that we are the children of Elohim (God):* The Shepherd''s promise that the Spirit dwelling in the kept flesh ''may bear witness to it, and thy flesh may be justified'' is Sha''ul''s witnessing Spirit, testifying with our spirit that we are children of Elohim.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm22_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm22_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-22-the-true-fast',
       E'The true fast — keep the commandments, do righteousness',
       E'When Hermas boasts of his accustomed fasting, the Shepherd cuts straight through the ritual to the heart: *‘Ye know not,’ saith he, ‘how to fast unto Yahuah (Lord), neither is this a fast, this unprofitable fast which ye make unto Him... Elohim (God) desireth not such a vain fast; for by so fasting unto Elohim (God) thou shalt do nothing for righteousness. But fast thou [unto Elohim (God)] such a fast as this; do no wickedness in thy life, and serve Yahuah (Lord) with a pure heart; observe His commandments and walk in His ordinances, and let no evil desire rise up in thy heart; but believe Elohim (God).’* (Hermas 22:1) It ain''t new — this is the prophet''s own word, the fast Yahuah Himself chooses: *Is not this the fast that I have chosen? to loose the bands of wickedness, to undo the heavy burdens, and to let the oppressed go free, and that ye break every yoke?* (Isaiah 58:6), and *Is it not to deal thy bread to the hungry, and that thou bring the poor that are cast out to thy house?* (Isaiah 58:7). The Shepherd does not abolish the fast; he restores it to what the prophet said it always was — keeping the commandments, walking in His ordinances, doing righteousness. The commandments stand at the centre of the acceptable fast.',
       sv.verse_id, ev.verse_id, 'extras', 72025
  FROM _session253_herm22_lookup sv, _session253_herm22_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=22 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=22 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-22-the-vineyard-fenced-and-digged',
       E'The faithful servant who fenced and digged the vineyard',
       E'The Shepherd tells the parable of fasting: a master *planted a vineyard*, and gave it over to a trusty servant — *‘Take this vineyard [which I have planted], and fence it [till I come]... Now keep this my commandment, and thou shalt be free in my house.’* The servant fenced it, then, seeing it choked with weeds, *‘took and digged the vineyard, and all the weeds that were in the vineyard he plucked up. And that vineyard became very neat and flourishing.’* (Hermas 22:2) It ain''t new — the Master Himself spoke the same picture: *Hear another parable: There was a certain householder, which planted a vineyard, and hedged it round about, and digged a winepress in it, and built a tower, and let it out to husbandmen, and went into a far country* (Matthew 21:33). And the labour that pleases the lord — the servant who not only kept the command but dug out the weeds — is the doing of righteousness beyond the bare letter, the good work that crowns obedience, the same the prophets called the chosen fast. The vineyard is the planted people; the keeping of the commandment is the servant''s freedom.',
       sv.verse_id, ev.verse_id, 'extras', 72028
  FROM _session253_herm22_lookup sv, _session253_herm22_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=22 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=22 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-22-the-son-the-formed-in-power',
       E'The Son revealed not as servant but in power and lordship — the Formed Son',
       E'When Hermas asks why the Son of Elohim is figured as a servant, the Shepherd corrects him: *‘the Son of Elohim (God) is not represented in the guise of a servant, but is represented in great power and lordship... Elohim (God) planted the vineyard, that is, He created the people, and delivered them over to His Son... Having Himself then cleansed the sins of His people, He showed them the paths of life, giving them the law which He received from His Father. Thou seest,’ saith he, ‘that He is Himself Yahuah (Lord) of the people, having received all power from His Father.’* (Hermas 22:6) Mark the order the Shepherd keeps: the Son receives the law from His Father, receives all power from His Father — the Formed Son who is Lord of the people, yet ever pointing back to the One who sent Him. It ain''t new — this is the Son sent in the likeness of flesh: *For what the law could not do, in that it was weak through the flesh, Elohim (God) sending his own Son in the likeness of sinful flesh, and for sin, condemned sin in the flesh* (Romans 8:3), *That the righteousness of the law might be fulfilled in us, who walk not after the flesh, but after the Spirit* (Romans 8:4). He cleanses the sins of the people and gives them the law He received — not abolishing the law but writing it in them, that its righteousness be fulfilled. The Son holds all power, and the power is given Him; the Lord of the people is Himself under His Father.',
       sv.verse_id, ev.verse_id, 'extras', 72031
  FROM _session253_herm22_lookup sv, _session253_herm22_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=22 AND sv.verse_number=6
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=22 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-22-keep-the-flesh-pure-temple-of-the-spirit',
       E'Keep the flesh pure that the Spirit dwelling in it may bear witness',
       E'The Shepherd''s charge at the close: *‘The Holy Pre-existent Spirit, Which created the whole creation, Elohim (God) made to dwell in flesh that He desired. This flesh, therefore, in which the Ruach HaKodesh (Holy Spirit) dwelt, was subject unto the Spirit, walking honourably in holiness and purity, without in any way defiling the Spirit... for all flesh, which is found undefiled and unspotted, wherein the Ruach HaKodesh (Holy Spirit) dwelt, shall receive a reward.’* (Hermas 22:6) And then to Hermas himself: *‘Keep this thy flesh pure and undefiled, that the Spirit which dwelleth in it may bear witness to it, and thy flesh may be justified... [For] if thou defile thy flesh, thou shalt defile the Ruach HaKodesh (Holy Spirit) also.’* (Hermas 22:7) It ain''t new — Sha''ul taught the same dwelling: *Know ye not that ye are the temple of Elohim (God), and that the Spirit of Elohim (God) dwelleth in you?* (1 Corinthians 3:16), and the warning is the same — *If any man defile the temple of Elohim (God), him shall Elohim (God) destroy; for the temple of Elohim (God) is holy, which temple ye are* (1 Corinthians 3:17). And again: *What? know ye not that your body is the temple of the Ruach HaKodesh (Holy Spirit) which is in you, which ye have of Elohim (God), and ye are not your own?* (1 Corinthians 6:19). The Spirit that bears witness with the man''s spirit is no new doctrine: *The Spirit itself beareth witness with our spirit, that we are the children of Elohim (God)* (Romans 8:16). Keep the flesh holy, that the indwelling Spirit may stand as witness for thee.',
       sv.verse_id, ev.verse_id, 'extras', 72034
  FROM _session253_herm22_lookup sv, _session253_herm22_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=22 AND sv.verse_number=7
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=22 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-22-the-true-fast
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 58:6 — *Is not this the fast that I have chosen? to loose the bands of wickedness, to undo the heavy burdens, and to let the oppressed go free, and that ye break every yoke?* The Shepherd''s ''do no wickedness, observe His commandments and walk in His ordinances'' is the prophet''s own fast that looses wickedness — the true fast was never mere abstinence.'
  FROM cross_reference_threads t, cross_references x, _session253_herm22_lookup sv, _session253_herm22_lookup tv
 WHERE t.slug='hermas-22-the-true-fast'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=22 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 58:7 — *Is it not to deal thy bread to the hungry, and that thou bring the poor that are cast out to thy house? when thou seest the naked, that thou cover him; and that thou hide not thyself from thine own flesh?* The fast Yahuah chooses pours out to the hungry and the cast-out, the very righteousness the Shepherd sets in place of the vain fast.'
  FROM cross_reference_threads t, cross_references x, _session253_herm22_lookup sv, _session253_herm22_lookup tv
 WHERE t.slug='hermas-22-the-true-fast'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=22 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-22-the-vineyard-fenced-and-digged
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 21:33 — *Hear another parable: There was a certain householder, which planted a vineyard, and hedged it round about, and digged a winepress in it, and built a tower, and let it out to husbandmen, and went into a far country:* The Shepherd''s master who planted a vineyard, set a fence about it, and travelled abroad is the Master''s own householder — the planted vineyard is the people, kept by the servant against the lord''s return.'
  FROM cross_reference_threads t, cross_references x, _session253_herm22_lookup sv, _session253_herm22_lookup tv
 WHERE t.slug='hermas-22-the-vineyard-fenced-and-digged'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=22 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=21 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-22-the-son-the-formed-in-power
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 8:3 — *For what the law could not do, in that it was weak through the flesh, Elohim (God) sending his own Son in the likeness of sinful flesh, and for sin, condemned sin in the flesh:* The Son who cleansed His people''s sins by much labour, the Formed Son sent by His Father, is the very Son sent in the likeness of flesh to condemn sin in the flesh — power exercised in obedience to the One who sent Him.'
  FROM cross_reference_threads t, cross_references x, _session253_herm22_lookup sv, _session253_herm22_lookup tv
 WHERE t.slug='hermas-22-the-son-the-formed-in-power'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=22 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 8:4 — *That the righteousness of the law might be fulfilled in us, who walk not after the flesh, but after the Spirit.* The Son who ''showed them the paths of life, giving them the law which He received from His Father'' gives the law that its righteousness be fulfilled in the people — the Torah honoured and written within, never cast off.'
  FROM cross_reference_threads t, cross_references x, _session253_herm22_lookup sv, _session253_herm22_lookup tv
 WHERE t.slug='hermas-22-the-son-the-formed-in-power'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=22 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-22-keep-the-flesh-pure-temple-of-the-spirit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 3:16 — *Know ye not that ye are the temple of Elohim (God), and that the Spirit of Elohim (God) dwelleth in you?* The Shepherd''s flesh wherein the Ruach HaKodesh dwells is Sha''ul''s temple in which the Spirit of Elohim dwells — the body made the dwelling-place of the Spirit.'
  FROM cross_reference_threads t, cross_references x, _session253_herm22_lookup sv, _session253_herm22_lookup tv
 WHERE t.slug='hermas-22-keep-the-flesh-pure-temple-of-the-spirit'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=22 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 3:17 — *If any man defile the temple of Elohim (God), him shall Elohim (God) destroy; for the temple of Elohim (God) is holy, which temple ye are.* The Shepherd''s warning that he who defiles his flesh defiles the Spirit and shall not live is Sha''ul''s own — defile the temple and Elohim will destroy, for the temple is holy.'
  FROM cross_reference_threads t, cross_references x, _session253_herm22_lookup sv, _session253_herm22_lookup tv
 WHERE t.slug='hermas-22-keep-the-flesh-pure-temple-of-the-spirit'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=22 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Corinthians 6:19 — *What? know ye not that your body is the temple of the Ruach HaKodesh (Holy Spirit) which is in you, which ye have of Elohim (God), and ye are not your own?* The charge to keep this flesh pure and undefiled because the Holy Spirit dwells in it is Sha''ul''s word that the body is the temple of the Ruach HaKodesh and is not our own.'
  FROM cross_reference_threads t, cross_references x, _session253_herm22_lookup sv, _session253_herm22_lookup tv
 WHERE t.slug='hermas-22-keep-the-flesh-pure-temple-of-the-spirit'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=22 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=6 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 8:16 — *The Spirit itself beareth witness with our spirit, that we are the children of Elohim (God):* The Shepherd''s promise that the Spirit dwelling in the kept flesh ''may bear witness to it, and thy flesh may be justified'' is Sha''ul''s witnessing Spirit, testifying with our spirit that we are children of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_herm22_lookup sv, _session253_herm22_lookup tv
 WHERE t.slug='hermas-22-keep-the-flesh-pure-temple-of-the-spirit'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=22 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

