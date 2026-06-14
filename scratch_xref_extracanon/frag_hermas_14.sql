-- ----- fragment: minion_hermas_14.sql (session253 hermas 14) -----
-- Source anchor: lightfoot-apostolic-fathers/hermas ch14. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: herm14 (view _session253_herm14_lookup). Sort band base 71825, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_herm14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: hermas-14-ask-nothing-wavering
  ('lightfoot-apostolic-fathers', 'hermas', 14, 1, 'canon', 'james', 1, 6, 'free', E'James 1:6 — *But let him ask in faith, nothing wavering. For he that wavereth is like a wave of the sea driven with the wind and tossed.* The Shepherd''s ''ask of Yahuah nothing wavering'' is Ya''aqov''s (James''s) very word — the same charge to ask in faith, the same wavering soul tossed like the sea.'),
  ('lightfoot-apostolic-fathers', 'hermas', 14, 1, 'canon', 'james', 1, 7, 'free', E'James 1:7 — *For let not that man think that he shall receive any thing of Yahuah (Lord).* The Shepherd''s ruling that the waverer ''shall surely receive none of thy petitions'' is Ya''aqov''s (James''s) own sentence on the man who doubts — it ain''t new.'),
  -- thread: hermas-14-doubtful-minded-double-minded
  ('lightfoot-apostolic-fathers', 'hermas', 14, 1, 'canon', 'james', 1, 8, 'free', E'James 1:8 — *A double minded man is unstable in all his ways.* The Shepherd''s ''doubtful-minded'' man who never obtains his petitions is Ya''aqov''s (James''s) double-minded man, unstable in all his ways — the same divided heart in the same Spirit.'),
  ('lightfoot-apostolic-fathers', 'hermas', 14, 1, 'canon', 'james', 3, 15, 'free', E'James 3:15 — *This wisdom descendeth not from above, but is earthly, sensual, devilish.* The Shepherd''s word that doubtful-mindedness ''is an earthly spirit from the devil... a daughter of the devil'' matches Ya''aqov''s (James''s) verdict on what is earthly and devilish, not from above.'),
  -- thread: hermas-14-faith-from-above-receives-all
  ('lightfoot-apostolic-fathers', 'hermas', 14, 1, 'canon', 'matthew', 21, 22, 'free', E'Matthew 21:22 — *And all things, whatsoever ye shall ask in prayer, believing, ye shall receive.* The Shepherd''s promise that they who ask trusting and nothing doubting ''shall receive all things'' is the Master''s own word — ask believing, and receive.'),
  ('lightfoot-apostolic-fathers', 'hermas', 14, 1, 'canon', 'mark', 11, 24, 'free', E'Mark 11:24 — *Therefore I say unto you, What things soever ye desire, when ye pray, believe that ye receive them, and ye shall have them.* The Shepherd''s ''ask without wavering, nothing doubting, and ye receive'' is the Master''s command to believe when you pray, that you may have — it ain''t new.'),
  -- thread: hermas-14-put-on-strong-faith-please-elohim
  ('lightfoot-apostolic-fathers', 'hermas', 14, 1, 'canon', 'hebrews', 11, 6, 'free', E'Hebrews 11:6 — *But without faith it is impossible to please him: for he that cometh to Elohim (God) must believe that he is, and that he is a rewarder of them that diligently seek him.* The Shepherd''s call to ''put on faith which is strong and trust Elohim that thou wilt receive'' rests on the same foundation — he that cometh to Elohim must believe He rewards the seeker.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_herm14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_herm14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-14-ask-nothing-wavering',
       E'Ask of Yahuah nothing wavering — the double-minded receive nothing',
       E'The Shepherd sets the whole law of prayer in one charge: *turn to Yahuah (Lord) with thy whole heart, and ask of Him nothing wavering, and thou shalt know His exceeding compassion... ask of Yahuah (Lord), and thou shalt receive all things, and shalt lack nothing of all thy petitions, if thou ask of Yahuah (Lord) nothing wavering. But if thou waver in thy heart, thou shalt surely receive none of thy petitions.* (Hermas 14:1) It ain''t new — Ya''aqov (James) had already laid the same measure on the man who prays: *But let him ask in faith, nothing wavering. For he that wavereth is like a wave of the sea driven with the wind and tossed* (James 1:6), and the verdict that follows is the Shepherd''s verdict exactly: *For let not that man think that he shall receive any thing of Yahuah (Lord)* (James 1:7). The wavering heart and the empty hand stand together in both witnesses, one teaching, never two.',
       sv.verse_id, ev.verse_id, 'extras', 71825
  FROM _session253_herm14_lookup sv, _session253_herm14_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=14 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-14-doubtful-minded-double-minded',
       E'The doubtful-minded — the double-minded man unstable in all his ways',
       E'The Shepherd names the sickness and traces it to its root: *For they that waver towards Elohim (God), these are the doubtful-minded, and they never obtain any of their petitions... for every doubtful-minded man, if he repent not, shall hardly be saved... For indeed this doubtful-mindedness is a daughter of the devil, and worketh great wickedness against the servants of Elohim (God).* (Hermas 14:1) Ya''aqov (James) had already coined the very word and pronounced the very instability: *A double minded man is unstable in all his ways* (James 1:8). And the Shepherd''s word that this spirit *is an earthly spirit from the devil, and hath no power* is Ya''aqov''s (James''s) own anatomy of the wisdom that is not from above: *This wisdom descendeth not from above, but is earthly, sensual, devilish* (James 3:15). Two men of the same Spirit, naming the same divided heart — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 71828
  FROM _session253_herm14_lookup sv, _session253_herm14_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=14 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-14-faith-from-above-receives-all',
       E'Faith is from above and receiveth all — believe, and ye shall receive',
       E'Over against the waverer the Shepherd lifts the faithful soul: *But they that are complete in the faith make all their petitions trusting in Yahuah (Lord), and they receive, because they ask without wavering, nothing doubting... faith is from above from Yahuah (Lord), and hath great power.* (Hermas 14:1) This is the Master''s own promise in the temple court: *And all things, whatsoever ye shall ask in prayer, believing, ye shall receive* (Matthew 21:22), and again on the road from Bethany: *What things soever ye desire, when ye pray, believe that ye receive them, and ye shall have them* (Mark 11:24). The Shepherd''s ''ask without wavering, nothing doubting'' is the Master''s ''believing... and shall not doubt in his heart'' — the Shepherd of repentance teaches no new prayer, only the prayer Yahusha (Jesus) Himself gave.',
       sv.verse_id, ev.verse_id, 'extras', 71831
  FROM _session253_herm14_lookup sv, _session253_herm14_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=14 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'hermas-14-put-on-strong-faith-please-elohim',
       E'Put on faith which is strong — without faith it is impossible to please Him',
       E'The Shepherd''s closing charge turns from the warning to the cure: *Cleanse therefore thy heart from doubtful-mindedness, and put on faith, for it is strong, and trust Elohim (God) that thou wilt receive all thy petitions which thou askest... Do thou therefore serve that faith which hath power... and thou shalt live unto Elohim (God).* (Hermas 14:1) It ain''t new — the writer to the Ivrim (Hebrews) had set the same foundation under all approach to Yahuah: *But without faith it is impossible to please him: for he that cometh to Elohim (God) must believe that he is, and that he is a rewarder of them that diligently seek him* (Hebrews 11:6). The doubtful heart cannot please Him because it does not trust that He rewards the seeker; the strong faith the Shepherd bids us put on is the very faith that draws near believing — the one path to life unto Elohim.',
       sv.verse_id, ev.verse_id, 'extras', 71834
  FROM _session253_herm14_lookup sv, _session253_herm14_lookup ev
 WHERE sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='lightfoot-apostolic-fathers' AND ev.book_slug='hermas' AND ev.chapter_number=14 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: hermas-14-ask-nothing-wavering
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 1:6 — *But let him ask in faith, nothing wavering. For he that wavereth is like a wave of the sea driven with the wind and tossed.* The Shepherd''s ''ask of Yahuah nothing wavering'' is Ya''aqov''s (James''s) very word — the same charge to ask in faith, the same wavering soul tossed like the sea.'
  FROM cross_reference_threads t, cross_references x, _session253_herm14_lookup sv, _session253_herm14_lookup tv
 WHERE t.slug='hermas-14-ask-nothing-wavering'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 1:7 — *For let not that man think that he shall receive any thing of Yahuah (Lord).* The Shepherd''s ruling that the waverer ''shall surely receive none of thy petitions'' is Ya''aqov''s (James''s) own sentence on the man who doubts — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session253_herm14_lookup sv, _session253_herm14_lookup tv
 WHERE t.slug='hermas-14-ask-nothing-wavering'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-14-doubtful-minded-double-minded
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 1:8 — *A double minded man is unstable in all his ways.* The Shepherd''s ''doubtful-minded'' man who never obtains his petitions is Ya''aqov''s (James''s) double-minded man, unstable in all his ways — the same divided heart in the same Spirit.'
  FROM cross_reference_threads t, cross_references x, _session253_herm14_lookup sv, _session253_herm14_lookup tv
 WHERE t.slug='hermas-14-doubtful-minded-double-minded'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 3:15 — *This wisdom descendeth not from above, but is earthly, sensual, devilish.* The Shepherd''s word that doubtful-mindedness ''is an earthly spirit from the devil... a daughter of the devil'' matches Ya''aqov''s (James''s) verdict on what is earthly and devilish, not from above.'
  FROM cross_reference_threads t, cross_references x, _session253_herm14_lookup sv, _session253_herm14_lookup tv
 WHERE t.slug='hermas-14-doubtful-minded-double-minded'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-14-faith-from-above-receives-all
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 21:22 — *And all things, whatsoever ye shall ask in prayer, believing, ye shall receive.* The Shepherd''s promise that they who ask trusting and nothing doubting ''shall receive all things'' is the Master''s own word — ask believing, and receive.'
  FROM cross_reference_threads t, cross_references x, _session253_herm14_lookup sv, _session253_herm14_lookup tv
 WHERE t.slug='hermas-14-faith-from-above-receives-all'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=21 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Mark 11:24 — *Therefore I say unto you, What things soever ye desire, when ye pray, believe that ye receive them, and ye shall have them.* The Shepherd''s ''ask without wavering, nothing doubting, and ye receive'' is the Master''s command to believe when you pray, that you may have — it ain''t new.'
  FROM cross_reference_threads t, cross_references x, _session253_herm14_lookup sv, _session253_herm14_lookup tv
 WHERE t.slug='hermas-14-faith-from-above-receives-all'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=11 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: hermas-14-put-on-strong-faith-please-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:6 — *But without faith it is impossible to please him: for he that cometh to Elohim (God) must believe that he is, and that he is a rewarder of them that diligently seek him.* The Shepherd''s call to ''put on faith which is strong and trust Elohim that thou wilt receive'' rests on the same foundation — he that cometh to Elohim must believe He rewards the seeker.'
  FROM cross_reference_threads t, cross_references x, _session253_herm14_lookup sv, _session253_herm14_lookup tv
 WHERE t.slug='hermas-14-put-on-strong-faith-please-elohim'
   AND sv.edition_slug='lightfoot-apostolic-fathers' AND sv.book_slug='hermas' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

