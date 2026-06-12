-- ----- fragment: minion_ecclesiasticus_09.sql (session253 ecclesiasticus 9) -----
-- Source anchor: apocrypha/ecclesiasticus ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir09 (view _session253_sir09_lookup). Sort band base 58500, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-9-strange-woman-snares
  ('apocrypha', 'ecclesiasticus', 9, 3, 'canon', 'proverbs', 5, 3, 'free', E'Proverbs 5:3 — *For the lips of a strange woman drop as an honeycomb, and her mouth is smoother than oil:* the honeyed lure Ben Sira calls a snare in Sirach 9:3.'),
  ('apocrypha', 'ecclesiasticus', 9, 3, 'canon', 'proverbs', 5, 5, 'free', E'Proverbs 5:5 — *Her feet go down to death; her steps take hold on hell.* the end of the harlot''s path that makes Sirach 9:3''s snare deadly.'),
  ('apocrypha', 'ecclesiasticus', 9, 6, 'canon', 'proverbs', 6, 26, 'free', E'Proverbs 6:26 — *For by means of a whorish woman a man is brought to a piece of bread: and the adulteress will hunt for the precious life.* the lost inheritance Ben Sira warns of in Sirach 9:6.'),
  ('apocrypha', 'ecclesiasticus', 9, 6, 'canon', 'proverbs', 7, 26, 'free', E'Proverbs 7:26 — *For she hath cast down many wounded: yea, many strong men have been slain by her.* the toll of the strange woman that Sirach 9:6 would have the wise escape.'),
  ('apocrypha', 'ecclesiasticus', 9, 3, 'canon', 'proverbs', 6, 24, 'free', E'Proverbs 6:24 — *To keep thee from the evil woman, from the flattery of the tongue of a strange woman.* the Torah-light that does what Sirach 9:3 commands the prudent to do.'),
  -- thread: ecclesiasticus-9-turn-away-the-eye
  ('apocrypha', 'ecclesiasticus', 9, 8, 'canon', 'job', 31, 1, 'free', E'Job 31:1 — *I made a covenant with mine eyes; why then should I think upon a maid?* the eye-covenant Ben Sira enjoins when he says turn away the eye in Sirach 9:8.'),
  ('apocrypha', 'ecclesiasticus', 9, 5, 'canon', 'proverbs', 6, 25, 'free', E'Proverbs 6:25 — *Lust not after her beauty in thine heart; neither let her take thee with her eyelids.* the inward guard against the beauty Sirach 9:5 says not to gaze upon.'),
  ('apocrypha', 'ecclesiasticus', 9, 8, 'canon', 'matthew', 5, 28, 'free', E'Matthew 5:28 — *But I say unto you, That whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart.* the Messiah taking Sirach 9:8''s turn-away-the-eye to the heart''s root.'),
  ('apocrypha', 'ecclesiasticus', 9, 8, 'canon', '2-peter', 2, 14, 'free', E'2 Peter 2:14 — *Having eyes full of adultery, and that cannot cease from sin; beguiling unstable souls: an heart they have exercised with covetous practices; cursed children:* the very deception by beauty Sirach 9:8 warns has deceived many.'),
  -- thread: ecclesiasticus-9-another-mans-wife-wine
  ('apocrypha', 'ecclesiasticus', 9, 9, 'canon', 'proverbs', 6, 29, 'free', E'Proverbs 6:29 — *So he that goeth in to his neighbour''s wife; whosoever toucheth her shall not be innocent.* the guilt Ben Sira would have a man avoid by not sitting with another man''s wife in Sirach 9:9.'),
  ('apocrypha', 'ecclesiasticus', 9, 9, 'canon', 'proverbs', 23, 31, 'free', E'Proverbs 23:31 — *Look not thou upon the wine when it is red, when it giveth his colour in the cup, when it moveth itself aright.* the deceiving cup Sirach 9:9 says not to share with another man''s wife.'),
  ('apocrypha', 'ecclesiasticus', 9, 9, 'canon', 'james', 1, 14, 'free', E'James 1:14 — *But every man is tempted, when he is drawn away of his own lust, and enticed.* the inclined desire by which Sirach 9:9 says a man falls into destruction.'),
  -- thread: ecclesiasticus-9-forsake-not-old-friend
  ('apocrypha', 'ecclesiasticus', 9, 10, 'canon', 'proverbs', 27, 10, 'free', E'Proverbs 27:10 — *Thine own friend, and thy father''s friend, forsake not; neither go into thy brother''s house in the day of thy calamity: for better is a neighbour that is near than a brother far off.* the same command Sirach 9:10 gives not to forsake the old friend.'),
  ('apocrypha', 'ecclesiasticus', 9, 10, 'apocrypha', 'ecclesiasticus', 6, 16, 'extras', E'Ecclesiasticus 6:16 — *A faithful friend is the medicine of life; and they that fear Yahuah (God) shall find him.* Ben Sira''s own praise of the tried friend that Sirach 9:10 says not to forsake.'),
  ('apocrypha', 'ecclesiasticus', 9, 10, 'apocrypha', 'ecclesiasticus', 6, 14, 'extras', E'Ecclesiasticus 6:14 — *A faithfull friend is a strong defence: and he that has found such an one has found a treasure.* the treasure of the old friend Sirach 9:10 ranks above the new.'),
  -- thread: ecclesiasticus-9-envy-not-talk-with-wise
  ('apocrypha', 'ecclesiasticus', 9, 11, 'canon', 'psalms', 37, 1, 'free', E'Psalm 37:1 — *Fret not thyself because of evildoers, neither be thou envious against the workers of iniquity.* the very envy of the sinner''s glory Sirach 9:11 forbids.'),
  ('apocrypha', 'ecclesiasticus', 9, 11, 'canon', 'proverbs', 23, 17, 'free', E'Proverbs 23:17 — *Let not thine heart envy sinners: but be thou in the fear of Yahuah (LORD) all the day long.* the same pairing Sirach 9:11-16 makes — no envy of sinners, but the fear of Yahuah.'),
  ('apocrypha', 'ecclesiasticus', 9, 15, 'canon', 'psalms', 1, 2, 'free', E'Psalm 1:2 — *But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night.* the law-of-the-Most-High talk Sirach 9:15 says fills the wise man''s communication.'),
  ('apocrypha', 'ecclesiasticus', 9, 14, 'canon', 'proverbs', 13, 20, 'free', E'Proverbs 13:20 — *He that walketh with wise men shall be wise: but a companion of fools shall be destroyed.* the consult-with-the-wise counsel of Sirach 9:14-15.'),
  ('apocrypha', 'ecclesiasticus', 9, 15, 'apocrypha', 'ecclesiasticus', 37, 12, 'extras', E'Ecclesiasticus 37:12 — *But be continually with a godly man, whom you know to keep the commandments of Yahuah (God), whose, mind is according to your mind, and will sorrow with you, if you shall miscarry.* Ben Sira''s own counsel to keep company with the law-keeping wise, as in Sirach 9:15-16.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-9-strange-woman-snares',
       E'Meet not with the harlot — the snares of the strange woman',
       E'Ben Sira sets the wise man''s guard against the seductress: *Meet not with an harlot, lest you fall into her snares* (Ecclesiasticus 9:3), and *Give not your soul to harlots, that you lose not your inheritance* (Ecclesiasticus 9:6). It ain''t new — this is Proverbs'' own warning, where *the lips of a strange woman drop as an honeycomb, and her mouth is smoother than oil: But her end is bitter as wormwood, sharp as a twoedged sword* (Proverbs 5:3-4), and *Her feet go down to death; her steps take hold on hell* (Proverbs 5:5). The Torah-light keeps a man *from the evil woman, from the flattery of the tongue of a strange woman* (Proverbs 6:24), for *by means of a whorish woman a man is brought to a piece of bread* (Proverbs 6:26) — the very inheritance Ben Sira would not lose. Wisdom personified is set as the guard: *That they may keep thee from the strange woman, from the stranger which flattereth with her words* (Proverbs 7:5), who *hath cast down many wounded: yea, many strong men have been slain by her* (Proverbs 7:26).',
       sv.verse_id, ev.verse_id, 'extras', 58500
  FROM _session253_sir09_lookup sv, _session253_sir09_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=9 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-9-turn-away-the-eye',
       E'Turn away the eye from the beauty that kindles as fire',
       E'Ben Sira aims at the heart through the eye: *Gaze not on a maid, that you fall not by those things that are precious in her* (Ecclesiasticus 9:5), and *Turn away your eye from a beautiful woman, and look not upon another''s beauty; for many have been deceived by the beauty of a woman; for herewith love is kindled as a fire* (Ecclesiasticus 9:8). Job already made the covenant: *I made a covenant with mine eyes; why then should I think upon a maid?* (Job 31:1), and Proverbs warns *Lust not after her beauty in thine heart; neither let her take thee with her eyelids* (Proverbs 6:25). The Messiah carries this same teaching to its root in the Sermon on the Mount — *But I say unto you, That whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart* (Matthew 5:28) — and Peter rebukes those *Having eyes full of adultery, and that cannot cease from sin* (2 Peter 2:14). The wisdom of the eye-covenant is one witness across the library.',
       sv.verse_id, ev.verse_id, 'extras', 58503
  FROM _session253_sir09_lookup sv, _session253_sir09_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=9 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-9-another-mans-wife-wine',
       E'Sit not with another man''s wife at the wine — desire to destruction',
       E'Ben Sira''s sharpest counsel against adultery joins the table, the cup, and the heart: *Sit not at all with another man''s wife, nor sit down with her in your arms, and spend not your money with her at the wine; lest yours heart incline to her, and so through your desire you fall into destruction* (Ecclesiasticus 9:9). Proverbs sets the same fence around the neighbour''s wife: *So he that goeth in to his neighbour''s wife; whosoever toucheth her shall not be innocent* (Proverbs 6:29), and binds it to the deceiving cup — *Look not thou upon the wine when it is red, when it giveth his colour in the cup, when it moveth itself aright* (Proverbs 23:31). James names the mechanism of the fall: *But every man is tempted, when he is drawn away of his own lust, and enticed* (James 1:14) — the very desire that Ben Sira says ends in destruction. The wisdom is one: guard the heart at the table before the desire inclines.',
       sv.verse_id, ev.verse_id, 'extras', 58506
  FROM _session253_sir09_lookup sv, _session253_sir09_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=9 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-9-forsake-not-old-friend',
       E'Forsake not an old friend — the seasoned wine',
       E'Against the lure of the new, Ben Sira pleads for the tried bond: *Forsake not an old friend; for the new is not comparable to him: a new friend is as new wine; when it is old, you shall drink it with pleasure* (Ecclesiasticus 9:10). Proverbs says it plainly: *Thine own friend, and thy father''s friend, forsake not; neither go into thy brother''s house in the day of thy calamity: for better is a neighbour that is near than a brother far off* (Proverbs 27:10). Ben Sira self-witnesses elsewhere that *A faithful friend is the medicine of life; and they that fear Yahuah (God) shall find him* (Ecclesiasticus 6:16) — for *he that has found such an one has found a treasure* (Ecclesiasticus 6:14). It ain''t new: the value of the seasoned, faithful friend runs straight through the wisdom-witness of the library.',
       sv.verse_id, ev.verse_id, 'extras', 58509
  FROM _session253_sir09_lookup sv, _session253_sir09_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=9 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-9-envy-not-talk-with-wise',
       E'Envy not the sinner; let your talk be with the wise in the law',
       E'Ben Sira turns from women to company and counsel: *Envy not the glory of a sinner: for you know not what shall be his end* (Ecclesiasticus 9:11), and *Let your talk be with the wise, and all your communication in the law of the Most High* (Ecclesiasticus 9:15), with glorying *in the fear of Yahuah (God)* (Ecclesiasticus 9:16). The Psalter opens the same way: *Blessed is the man that walketh not in the counsel of the ungodly... But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night* (Psalm 1:1-2), and warns *Fret not thyself because of evildoers, neither be thou envious against the workers of iniquity* (Psalm 37:1). Proverbs commands *Let not thine heart envy sinners: but be thou in the fear of Yahuah (LORD) all the day long* (Proverbs 23:17), and *He that walketh with wise men shall be wise: but a companion of fools shall be destroyed* (Proverbs 13:20). Ben Sira''s own counsel-witness adds: *be continually with a godly man, whom you know to keep the commandments of Yahuah (God)* (Ecclesiasticus 37:12). The wise man''s table, talk, and glorying all rest in the fear of Yahuah and the law of the Most High.',
       sv.verse_id, ev.verse_id, 'extras', 58512
  FROM _session253_sir09_lookup sv, _session253_sir09_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=9 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-9-strange-woman-snares
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 5:3 — *For the lips of a strange woman drop as an honeycomb, and her mouth is smoother than oil:* the honeyed lure Ben Sira calls a snare in Sirach 9:3.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-strange-woman-snares'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 5:5 — *Her feet go down to death; her steps take hold on hell.* the end of the harlot''s path that makes Sirach 9:3''s snare deadly.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-strange-woman-snares'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 6:26 — *For by means of a whorish woman a man is brought to a piece of bread: and the adulteress will hunt for the precious life.* the lost inheritance Ben Sira warns of in Sirach 9:6.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-strange-woman-snares'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=6 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 7:26 — *For she hath cast down many wounded: yea, many strong men have been slain by her.* the toll of the strange woman that Sirach 9:6 would have the wise escape.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-strange-woman-snares'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=7 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Proverbs 6:24 — *To keep thee from the evil woman, from the flattery of the tongue of a strange woman.* the Torah-light that does what Sirach 9:3 commands the prudent to do.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-strange-woman-snares'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=6 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-9-turn-away-the-eye
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Job 31:1 — *I made a covenant with mine eyes; why then should I think upon a maid?* the eye-covenant Ben Sira enjoins when he says turn away the eye in Sirach 9:8.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-turn-away-the-eye'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=31 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 6:25 — *Lust not after her beauty in thine heart; neither let her take thee with her eyelids.* the inward guard against the beauty Sirach 9:5 says not to gaze upon.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-turn-away-the-eye'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=6 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 5:28 — *But I say unto you, That whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart.* the Messiah taking Sirach 9:8''s turn-away-the-eye to the heart''s root.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-turn-away-the-eye'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Peter 2:14 — *Having eyes full of adultery, and that cannot cease from sin; beguiling unstable souls: an heart they have exercised with covetous practices; cursed children:* the very deception by beauty Sirach 9:8 warns has deceived many.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-turn-away-the-eye'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-9-another-mans-wife-wine
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 6:29 — *So he that goeth in to his neighbour''s wife; whosoever toucheth her shall not be innocent.* the guilt Ben Sira would have a man avoid by not sitting with another man''s wife in Sirach 9:9.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-another-mans-wife-wine'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=6 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 23:31 — *Look not thou upon the wine when it is red, when it giveth his colour in the cup, when it moveth itself aright.* the deceiving cup Sirach 9:9 says not to share with another man''s wife.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-another-mans-wife-wine'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=23 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 1:14 — *But every man is tempted, when he is drawn away of his own lust, and enticed.* the inclined desire by which Sirach 9:9 says a man falls into destruction.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-another-mans-wife-wine'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-9-forsake-not-old-friend
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 27:10 — *Thine own friend, and thy father''s friend, forsake not; neither go into thy brother''s house in the day of thy calamity: for better is a neighbour that is near than a brother far off.* the same command Sirach 9:10 gives not to forsake the old friend.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-forsake-not-old-friend'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=27 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiasticus 6:16 — *A faithful friend is the medicine of life; and they that fear Yahuah (God) shall find him.* Ben Sira''s own praise of the tried friend that Sirach 9:10 says not to forsake.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-forsake-not-old-friend'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=6 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 6:14 — *A faithfull friend is a strong defence: and he that has found such an one has found a treasure.* the treasure of the old friend Sirach 9:10 ranks above the new.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-forsake-not-old-friend'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=6 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-9-envy-not-talk-with-wise
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 37:1 — *Fret not thyself because of evildoers, neither be thou envious against the workers of iniquity.* the very envy of the sinner''s glory Sirach 9:11 forbids.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-envy-not-talk-with-wise'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 23:17 — *Let not thine heart envy sinners: but be thou in the fear of Yahuah (LORD) all the day long.* the same pairing Sirach 9:11-16 makes — no envy of sinners, but the fear of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-envy-not-talk-with-wise'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=23 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 1:2 — *But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night.* the law-of-the-Most-High talk Sirach 9:15 says fills the wise man''s communication.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-envy-not-talk-with-wise'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 13:20 — *He that walketh with wise men shall be wise: but a companion of fools shall be destroyed.* the consult-with-the-wise counsel of Sirach 9:14-15.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-envy-not-talk-with-wise'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=13 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ecclesiasticus 37:12 — *But be continually with a godly man, whom you know to keep the commandments of Yahuah (God), whose, mind is according to your mind, and will sorrow with you, if you shall miscarry.* Ben Sira''s own counsel to keep company with the law-keeping wise, as in Sirach 9:15-16.'
  FROM cross_reference_threads t, cross_references x, _session253_sir09_lookup sv, _session253_sir09_lookup tv
 WHERE t.slug='ecclesiasticus-9-envy-not-talk-with-wise'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=9 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=37 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

