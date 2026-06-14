-- ----- fragment: minion_hermas_05.sql (session253 hermas 5) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm5 (view _session253_herm5_lookup). Sort band base 71600, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm5_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-5-shepherd-angel-of-repentance
  ('lightfoot-apostolic-fathers', 'hermas', 5, 1, 'canon', 'ezekiel', 33, 11, 'free', E'Ezekiel 33:11 — *Say unto them, As I live, saith Adonai Yahuah (the Lord GOD), I have no pleasure in the death of the wicked; but that the wicked turn from his way and live: turn ye, turn ye from your evil ways; for why will ye die, O house of Yashar''el (Israel)?* The angel of repentance carries Yahuah''s own ancient plea to the fallen in hermas 5:1.'),
  ('lightfoot-apostolic-fathers', 'hermas', 5, 1, 'canon', 'ezekiel', 18, 30, 'free', E'Ezekiel 18:30 — *Therefore I will judge you, O house of Yashar''el (Israel), every one according to his ways, saith Adonai Yahuah (the Lord GOD). Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin.* The second repentance the shepherd offers in hermas 5:1 is the prophet''s call to turn and live.'),
  ('lightfoot-apostolic-fathers', 'hermas', 5, 1, 'canon', '2-peter', 3, 9, 'free', E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* The Master''s longsuffering is why the angel of repentance is sent to dwell with Hermas in hermas 5:1.'),
  ('lightfoot-apostolic-fathers', 'hermas', 5, 1, 'canon', 'luke', 15, 7, 'free', E'Luke 15:7 — *I say unto you, that likewise joy shall be in heaven over one sinner that repenteth, more than over ninety and nine just persons, which need no repentance.* The Good Shepherd''s joy over the recovered is the heart of the shepherd of repentance in hermas 5:1.'),
  -- thread: hermas-5-keep-the-commandments
  ('lightfoot-apostolic-fathers', 'hermas', 5, 1, 'canon', 'john', 14, 15, 'free', E'John 14:15 — *If ye love me, keep my commandments.* The shepherd''s call to keep and walk in the commandments with a pure heart in hermas 5:1 is the Messiah''s own measure of love.'),
  ('lightfoot-apostolic-fathers', 'hermas', 5, 1, 'canon', '1-john', 5, 3, 'free', E'1 John 5:3 — *For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous.* The keeping the shepherd commands in hermas 5:1 is love made visible, the yoke that is not a burden.'),
  ('lightfoot-apostolic-fathers', 'hermas', 5, 1, 'canon', 'malachi', 4, 4, 'free', E'Malachi 4:4 — *Remember ye the law of Moses my servant, which I commanded unto him in Horeb for all Yashar''el (Israel), with the statutes and judgments.* The commandments Hermas is told to write and keep in hermas 5:1 are the same statutes and judgments that endure.'),
  ('lightfoot-apostolic-fathers', 'hermas', 5, 1, 'canon', 'psalms', 15, 2, 'free', E'Psalm 15:2 — *He that walketh uprightly, and worketh righteousness, and speaketh the truth in his heart.* The pure heart that walks in the commandments in hermas 5:1 is the dweller in Yahuah''s holy hill.'),
  -- thread: hermas-5-remember-whence-fallen
  ('lightfoot-apostolic-fathers', 'hermas', 5, 1, 'canon', 'revelation', 2, 5, 'free', E'Revelation 2:5 — *Remember therefore from whence thou art fallen, and repent, and do the first works; or else I will come unto thee quickly, and will remove thy candlestick out of his place, except thou repent.* The shepherd''s either-or of promise or its opposite in hermas 5:1 is the Messiah''s own charge to repent and do the first works.'),
  ('lightfoot-apostolic-fathers', 'hermas', 5, 1, 'canon', 'matthew', 7, 14, 'free', E'Matthew 7:14 — *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* The two outcomes the shepherd lays out in hermas 5:1 are the two ways: the narrow road of keeping, or its opposite.'),
  ('lightfoot-apostolic-fathers', 'hermas', 5, 1, 'canon', 'ezekiel', 18, 32, 'free', E'Ezekiel 18:32 — *For I have no pleasure in the death of him that dieth, saith Adonai Yahuah (the Lord GOD): wherefore turn yourselves, and live ye.* The opposite that the unrepentant receive in hermas 5:1 is the death Yahuah takes no pleasure in — turn, and live.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm5_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm5_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-5-shepherd-angel-of-repentance',
       E'The shepherd, the angel of repentance',
       E'Hermas is met by a glorious figure in a shepherd''s garb — *‘I,’ saith he, ‘am the shepherd, unto whom thou wast delivered.’* — and at the close he names him plainly: *All these the shepherd, the angel of repentance, commanded me so to write.* The shepherd who guards and gathers the flock, and the call to *turn ye, turn ye*, is no new thing. Yahuah pleads through Ezekiel, *As I live, saith Adonai Yahuah (the Lord GOD), I have no pleasure in the death of the wicked; but that the wicked turn from his way and live: turn ye, turn ye from your evil ways; for why will ye die, O house of Yashar''el (Israel)?* (Ezekiel 33:11). And again, *Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin* (Ezekiel 18:30). The Master is *not willing that any should perish, but that all should come to repentance* (2 Peter 3:9) — election before confession, the seed kept, the wanderer sought.',
       sv.verse_id, ev.verse_id, 'extras', 71600
  FROM _session253_herm5_lookup sv, _session253_herm5_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=5 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-5-keep-the-commandments',
       E'Keep the commandments and live',
       E'The shepherd''s charge is plain: *‘Be not confounded, but strengthen thyself in my commandments which I am about to command thee’* — and the promise hangs on the keeping: *If then, when ye hear them, ye keep them and walk in them, and do them with a pure heart, ye shall receive from Yahuah (Lord) all things that He promised you; but if, when ye hear them, ye do not repent, but still add to your sins, ye shall receive from Yahuah (Lord) the opposite.* This is the everlasting word, never law-as-curse. The Messiah Himself binds love to obedience: *If ye love me, keep my commandments* (John 14:15), and the beloved disciple confirms, *For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous* (1 John 5:3). The charge to remember stands from of old: *Remember ye the law of Moses my servant, which I commanded unto him in Horeb for all Yashar''el (Israel), with the statutes and judgments* (Malachi 4:4).',
       sv.verse_id, ev.verse_id, 'extras', 71603
  FROM _session253_herm5_lookup sv, _session253_herm5_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=5 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-5-remember-whence-fallen',
       E'Repent, or receive the opposite',
       E'The shepherd sets the two outcomes before the hearer: keep the commandments and *ye shall receive from Yahuah (Lord) all things that He promised you*, or *if, when ye hear them, ye do not repent, but still add to your sins, ye shall receive from Yahuah (Lord) the opposite.* The risen Messiah speaks the very same warning to His assemblies: *Remember therefore from whence thou art fallen, and repent, and do the first works; or else I will come unto thee quickly, and will remove thy candlestick out of his place, except thou repent* (Revelation 2:5). And the way is narrow, the two ways set before every soul: *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it* (Matthew 7:14). The second repentance is real mercy, but it is a door to be walked through, not a license to *add to your sins*.',
       sv.verse_id, ev.verse_id, 'extras', 71606
  FROM _session253_herm5_lookup sv, _session253_herm5_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=5 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-5-shepherd-angel-of-repentance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 33:11 — *Say unto them, As I live, saith Adonai Yahuah (the Lord GOD), I have no pleasure in the death of the wicked; but that the wicked turn from his way and live: turn ye, turn ye from your evil ways; for why will ye die, O house of Yashar''el (Israel)?* The angel of repentance carries Yahuah''s own ancient plea to the fallen in hermas 5:1.'
  FROM cross_reference_threads t, cross_references x, _session253_herm5_lookup sv, _session253_herm5_lookup tv
 WHERE t.slug='hermas-5-shepherd-angel-of-repentance'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=33 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 18:30 — *Therefore I will judge you, O house of Yashar''el (Israel), every one according to his ways, saith Adonai Yahuah (the Lord GOD). Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin.* The second repentance the shepherd offers in hermas 5:1 is the prophet''s call to turn and live.'
  FROM cross_reference_threads t, cross_references x, _session253_herm5_lookup sv, _session253_herm5_lookup tv
 WHERE t.slug='hermas-5-shepherd-angel-of-repentance'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* The Master''s longsuffering is why the angel of repentance is sent to dwell with Hermas in hermas 5:1.'
  FROM cross_reference_threads t, cross_references x, _session253_herm5_lookup sv, _session253_herm5_lookup tv
 WHERE t.slug='hermas-5-shepherd-angel-of-repentance'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 15:7 — *I say unto you, that likewise joy shall be in heaven over one sinner that repenteth, more than over ninety and nine just persons, which need no repentance.* The Good Shepherd''s joy over the recovered is the heart of the shepherd of repentance in hermas 5:1.'
  FROM cross_reference_threads t, cross_references x, _session253_herm5_lookup sv, _session253_herm5_lookup tv
 WHERE t.slug='hermas-5-shepherd-angel-of-repentance'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=15 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-5-keep-the-commandments
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 14:15 — *If ye love me, keep my commandments.* The shepherd''s call to keep and walk in the commandments with a pure heart in hermas 5:1 is the Messiah''s own measure of love.'
  FROM cross_reference_threads t, cross_references x, _session253_herm5_lookup sv, _session253_herm5_lookup tv
 WHERE t.slug='hermas-5-keep-the-commandments'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 5:3 — *For this is the love of Elohim (God), that we keep his commandments: and his commandments are not grievous.* The keeping the shepherd commands in hermas 5:1 is love made visible, the yoke that is not a burden.'
  FROM cross_reference_threads t, cross_references x, _session253_herm5_lookup sv, _session253_herm5_lookup tv
 WHERE t.slug='hermas-5-keep-the-commandments'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 4:4 — *Remember ye the law of Moses my servant, which I commanded unto him in Horeb for all Yashar''el (Israel), with the statutes and judgments.* The commandments Hermas is told to write and keep in hermas 5:1 are the same statutes and judgments that endure.'
  FROM cross_reference_threads t, cross_references x, _session253_herm5_lookup sv, _session253_herm5_lookup tv
 WHERE t.slug='hermas-5-keep-the-commandments'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 15:2 — *He that walketh uprightly, and worketh righteousness, and speaketh the truth in his heart.* The pure heart that walks in the commandments in hermas 5:1 is the dweller in Yahuah''s holy hill.'
  FROM cross_reference_threads t, cross_references x, _session253_herm5_lookup sv, _session253_herm5_lookup tv
 WHERE t.slug='hermas-5-keep-the-commandments'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=15 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-5-remember-whence-fallen
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Revelation 2:5 — *Remember therefore from whence thou art fallen, and repent, and do the first works; or else I will come unto thee quickly, and will remove thy candlestick out of his place, except thou repent.* The shepherd''s either-or of promise or its opposite in hermas 5:1 is the Messiah''s own charge to repent and do the first works.'
  FROM cross_reference_threads t, cross_references x, _session253_herm5_lookup sv, _session253_herm5_lookup tv
 WHERE t.slug='hermas-5-remember-whence-fallen'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 7:14 — *Because strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it.* The two outcomes the shepherd lays out in hermas 5:1 are the two ways: the narrow road of keeping, or its opposite.'
  FROM cross_reference_threads t, cross_references x, _session253_herm5_lookup sv, _session253_herm5_lookup tv
 WHERE t.slug='hermas-5-remember-whence-fallen'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 18:32 — *For I have no pleasure in the death of him that dieth, saith Adonai Yahuah (the Lord GOD): wherefore turn yourselves, and live ye.* The opposite that the unrepentant receive in hermas 5:1 is the death Yahuah takes no pleasure in — turn, and live.'
  FROM cross_reference_threads t, cross_references x, _session253_herm5_lookup sv, _session253_herm5_lookup tv
 WHERE t.slug='hermas-5-remember-whence-fallen'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

