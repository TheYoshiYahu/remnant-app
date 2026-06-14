-- ----- fragment: minion_hermas_15.sql (session253 hermas 15) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch15. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm15 (view _session253_herm15_lookup). Sort band base 71850, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-15-sorrow-crushes-the-ruach
  ('lightfoot-apostolic-fathers', 'hermas', 15, 1, 'canon', 'ephesians', 4, 30, 'free', E'Ephesians 4:30 — *And grieve not the holy Spirit of Elohim (God), whereby ye are sealed unto the day of redemption.* The Shepherd''s warning that sorrow crusheth out the Ruach HaKodesh is Sha''ul''s own charge — grieve not the Spirit (Hermas 15:1).'),
  ('lightfoot-apostolic-fathers', 'hermas', 15, 1, 'canon', 'proverbs', 17, 22, 'free', E'Proverbs 17:22 — *A merry heart doeth good like a medicine: but a broken spirit drieth the bones.* That sorrow is most fatal to the servants of Elohim, while cheerfulness heals, is the wise man''s word long before the Shepherd (Hermas 15:1).'),
  -- thread: hermas-15-grieve-not-the-spirit-that-dwelleth
  ('lightfoot-apostolic-fathers', 'hermas', 15, 2, 'canon', 'ephesians', 4, 30, 'free', E'Ephesians 4:30 — *And grieve not the holy Spirit of Elohim (God), whereby ye are sealed unto the day of redemption.* The Shepherd''s ''afflict not the Ruach HaKodesh that dwelleth in thee'' is Sha''ul''s plain charge not to grieve the Spirit (Hermas 15:2).'),
  ('lightfoot-apostolic-fathers', 'hermas', 15, 2, 'canon', '1-thessalonians', 5, 19, 'free', E'1 Thessalonians 5:19 — *Quench not the Spirit.* The sadness that crusheth out the Ruach HaKodesh is the very quenching Sha''ul forbids (Hermas 15:2).'),
  ('lightfoot-apostolic-fathers', 'hermas', 15, 2, 'canon', 'psalms', 51, 11, 'free', E'Psalm 51:11 — *Cast me not away from thy presence; and take not thy holy spirit from me.* The Shepherd''s warning lest the Spirit depart from the saddened man is David''s own penitent plea that the holy Spirit not be taken away (Hermas 15:2).'),
  -- thread: hermas-15-godly-sorrow-unto-repentance
  ('lightfoot-apostolic-fathers', 'hermas', 15, 2, 'canon', '2-corinthians', 7, 10, 'free', E'2 Corinthians 7:10 — *For godly sorrow worketh repentance to salvation not to be repented of: but the sorrow of the world worketh death.* The Shepherd''s sadness that brings salvation because the man repented of his evil is Sha''ul''s godly sorrow that worketh repentance, set against the worldly sorrow that crusheth the Spirit unto death (Hermas 15:2).'),
  -- thread: hermas-15-clothe-thyself-in-cheerfulness
  ('lightfoot-apostolic-fathers', 'hermas', 15, 3, 'canon', 'nehemiah', 8, 10, 'free', E'Nehemiah 8:10 — *Then he said unto them, Go your way, eat the fat, and drink the sweet, and send portions unto them for whom nothing is prepared: for this day is holy unto our Lord: neither be ye sorry; for the joy of Yahuah (LORD) is your strength.* The Shepherd''s call to put away sadness and clothe in cheerfulness is Nehemiah''s word to the weeping people — the joy of Yahuah is their strength (Hermas 15:3).'),
  ('lightfoot-apostolic-fathers', 'hermas', 15, 3, 'canon', 'philippians', 4, 4, 'free', E'Philippians 4:4 — *Rejoice in Yahuah (Lord) alway: and again I say, Rejoice.* The Shepherd''s ''clothe thyself in cheerfulness... and rejoice in it'' is Sha''ul''s twice-spoken command to rejoice in Yahuah always (Hermas 15:3).'),
  ('lightfoot-apostolic-fathers', 'hermas', 15, 3, 'canon', '1-thessalonians', 5, 16, 'free', E'1 Thessalonians 5:16 — *Rejoice evermore.* The cheerfulness that hath favour with Elohim always is Sha''ul''s briefest charge — rejoice evermore (Hermas 15:3).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-15-sorrow-crushes-the-ruach',
       E'Sorrow crusheth out the Ruach HaKodesh — put her away',
       E'The Shepherd charges Hermas plainly: *‘Put away sorrow from thyself,’ saith he, ‘for she is the sister of doubtful-mindedness and of angry temper.’* He names her the deadliest of the spirits: *sorrow is more evil than all the spirits, and is most fatal to the servants of Elohim (God), and beyond all the spirits destroys a man, and crushes out the Ruach HaKodesh (Holy Spirit)* (Hermas 15:1). It ain''t new. Sha''ul lays the same charge upon every saint: *And grieve not the holy Spirit of Elohim (God), whereby ye are sealed unto the day of redemption* (Ephesians 4:30). And the wise man knew long before that a crushed spirit withers the whole man, while gladness heals: *A merry heart doeth good like a medicine: but a broken spirit drieth the bones* (Proverbs 17:22). The Shepherd is teaching no novel discipline — he is teaching the old wisdom and the apostle''s plain word.',
       sv.verse_id, ev.verse_id, 'extras', 71850
  FROM _session253_herm15_lookup sv, _session253_herm15_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=15 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=15 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-15-grieve-not-the-spirit-that-dwelleth',
       E'Afflict not the Ruach HaKodesh that dwelleth in thee, lest He depart',
       E'The Shepherd warns what sadness costs: *Put away therefore from thyself sadness, and afflict not the Ruach HaKodesh (Holy Spirit) that dwelleth in thee, lest haply He intercede with Elohim (God) [against thee], and depart from thee. For the Spirit of Elohim (God), that was given unto this flesh, endureth not sadness neither constraint* (Hermas 15:2). It ain''t new. This is Sha''ul''s very command: *And grieve not the holy Spirit of Elohim (God), whereby ye are sealed unto the day of redemption* (Ephesians 4:30), and his terse word to the assembly: *Quench not the Spirit* (1 Thessalonians 5:19). The dread of the Spirit departing is David''s own prayer in his repentance: *Cast me not away from thy presence; and take not thy holy spirit from me* (Psalm 51:11). The indwelling Ruach is grieved by the same sorrow the prophets and apostles already named — come and see, it is one teaching.',
       sv.verse_id, ev.verse_id, 'extras', 71853
  FROM _session253_herm15_lookup sv, _session253_herm15_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=15 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=15 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-15-godly-sorrow-unto-repentance',
       E'The sadness that worketh salvation — godly versus worldly sorrow',
       E'The Shepherd draws a fine line: the doubtful mind and the angry temper both sadden the Spirit, yet of the man embittered who turns he says, *again sorrow entereth into the heart of the man that was ill-tempered, and he is grieved at the deed which he hath done, and repenteth that he did evil. This sadness therefore seemeth to bring salvation, because he repented at having done the evil* (Hermas 15:2). It ain''t new — this is precisely Sha''ul''s two-edged word on grief: *For godly sorrow worketh repentance to salvation not to be repented of: but the sorrow of the world worketh death* (2 Corinthians 7:10). The Shepherd, the angel of repentance, makes the same distinction the apostle made: there is a sorrow that crushes the Spirit unto death, and a sorrow that turns the heart unto life.',
       sv.verse_id, ev.verse_id, 'extras', 71856
  FROM _session253_herm15_lookup sv, _session253_herm15_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=15 AND sv.verse_number=2
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=15 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-15-clothe-thyself-in-cheerfulness',
       E'Clothe thyself in cheerfulness — that the intercession ascend pure',
       E'The Shepherd ends with the cure: *Therefore clothe thyself in cheerfulness, which hath favour with Elohim (God) always, and is acceptable to Him, and rejoice in it* (Hermas 15:3). The sad man''s prayer cannot rise — *the intercession of a sad man hath never at any time power to ascend to the altar of Elohim (God)* — for *as vinegar when mingled with wine... hath not the same pleasant taste, so likewise sadness mingled with the Ruach HaKodesh (Holy Spirit) hath not the same intercession*. It ain''t new. Nehemiah set the joy of Yahuah against the people''s weeping on a holy day: *neither be ye sorry; for the joy of Yahuah (LORD) is your strength* (Nehemiah 8:10). Sha''ul made cheerfulness a standing command: *Rejoice in Yahuah (Lord) alway: and again I say, Rejoice* (Philippians 4:4), and *Rejoice evermore* (1 Thessalonians 5:16). To put on gladness and rejoice before the altar is the old path of the faithful, not a new word.',
       sv.verse_id, ev.verse_id, 'extras', 71859
  FROM _session253_herm15_lookup sv, _session253_herm15_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=15 AND sv.verse_number=3
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=15 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-15-sorrow-crushes-the-ruach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 4:30 — *And grieve not the holy Spirit of Elohim (God), whereby ye are sealed unto the day of redemption.* The Shepherd''s warning that sorrow crusheth out the Ruach HaKodesh is Sha''ul''s own charge — grieve not the Spirit (Hermas 15:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm15_lookup sv, _session253_herm15_lookup tv
 WHERE t.slug='hermas-15-sorrow-crushes-the-ruach'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 17:22 — *A merry heart doeth good like a medicine: but a broken spirit drieth the bones.* That sorrow is most fatal to the servants of Elohim, while cheerfulness heals, is the wise man''s word long before the Shepherd (Hermas 15:1).'
  FROM cross_reference_threads t, cross_references x, _session253_herm15_lookup sv, _session253_herm15_lookup tv
 WHERE t.slug='hermas-15-sorrow-crushes-the-ruach'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=17 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-15-grieve-not-the-spirit-that-dwelleth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ephesians 4:30 — *And grieve not the holy Spirit of Elohim (God), whereby ye are sealed unto the day of redemption.* The Shepherd''s ''afflict not the Ruach HaKodesh that dwelleth in thee'' is Sha''ul''s plain charge not to grieve the Spirit (Hermas 15:2).'
  FROM cross_reference_threads t, cross_references x, _session253_herm15_lookup sv, _session253_herm15_lookup tv
 WHERE t.slug='hermas-15-grieve-not-the-spirit-that-dwelleth'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Thessalonians 5:19 — *Quench not the Spirit.* The sadness that crusheth out the Ruach HaKodesh is the very quenching Sha''ul forbids (Hermas 15:2).'
  FROM cross_reference_threads t, cross_references x, _session253_herm15_lookup sv, _session253_herm15_lookup tv
 WHERE t.slug='hermas-15-grieve-not-the-spirit-that-dwelleth'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=5 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 51:11 — *Cast me not away from thy presence; and take not thy holy spirit from me.* The Shepherd''s warning lest the Spirit depart from the saddened man is David''s own penitent plea that the holy Spirit not be taken away (Hermas 15:2).'
  FROM cross_reference_threads t, cross_references x, _session253_herm15_lookup sv, _session253_herm15_lookup tv
 WHERE t.slug='hermas-15-grieve-not-the-spirit-that-dwelleth'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-15-godly-sorrow-unto-repentance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 7:10 — *For godly sorrow worketh repentance to salvation not to be repented of: but the sorrow of the world worketh death.* The Shepherd''s sadness that brings salvation because the man repented of his evil is Sha''ul''s godly sorrow that worketh repentance, set against the worldly sorrow that crusheth the Spirit unto death (Hermas 15:2).'
  FROM cross_reference_threads t, cross_references x, _session253_herm15_lookup sv, _session253_herm15_lookup tv
 WHERE t.slug='hermas-15-godly-sorrow-unto-repentance'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-15-clothe-thyself-in-cheerfulness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Nehemiah 8:10 — *Then he said unto them, Go your way, eat the fat, and drink the sweet, and send portions unto them for whom nothing is prepared: for this day is holy unto our Lord: neither be ye sorry; for the joy of Yahuah (LORD) is your strength.* The Shepherd''s call to put away sadness and clothe in cheerfulness is Nehemiah''s word to the weeping people — the joy of Yahuah is their strength (Hermas 15:3).'
  FROM cross_reference_threads t, cross_references x, _session253_herm15_lookup sv, _session253_herm15_lookup tv
 WHERE t.slug='hermas-15-clothe-thyself-in-cheerfulness'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=8 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Philippians 4:4 — *Rejoice in Yahuah (Lord) alway: and again I say, Rejoice.* The Shepherd''s ''clothe thyself in cheerfulness... and rejoice in it'' is Sha''ul''s twice-spoken command to rejoice in Yahuah always (Hermas 15:3).'
  FROM cross_reference_threads t, cross_references x, _session253_herm15_lookup sv, _session253_herm15_lookup tv
 WHERE t.slug='hermas-15-clothe-thyself-in-cheerfulness'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='philippians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Thessalonians 5:16 — *Rejoice evermore.* The cheerfulness that hath favour with Elohim always is Sha''ul''s briefest charge — rejoice evermore (Hermas 15:3).'
  FROM cross_reference_threads t, cross_references x, _session253_herm15_lookup sv, _session253_herm15_lookup tv
 WHERE t.slug='hermas-15-clothe-thyself-in-cheerfulness'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=5 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

