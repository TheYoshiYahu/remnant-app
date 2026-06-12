-- ----- fragment: minion_1adameve_72.sql (session253 1-adam-eve 72) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch72. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae72 (view _session253_1ae72_lookup). Sort band base 65775, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae72_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-72-transformed-maidens
  ('adam-eve-conflict', '1-adam-eve', 72, 1, 'canon', '2-corinthians', 11, 14, 'free', E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The very transformation Paul names is acted out as Satan and his hosts put on the borrowed grace of maidens to deceive Adam in 1 Adam and Eve 72:1.'),
  ('adam-eve-conflict', '1-adam-eve', 72, 9, 'canon', 'john', 8, 44, 'free', E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The narrator''s verdict that this was a device of Satan to deceive Adam (72:9) is the same liar and murderer the Messiah exposes.'),
  ('adam-eve-conflict', '1-adam-eve', 72, 1, 'canon', 'revelation', 12, 9, 'free', E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The shining maidens are the old serpent who deceiveth the whole world, here at his earliest work on the first man in 1 Adam and Eve 72:1.'),
  -- thread: 1-adam-eve-72-device-to-kill-the-seed
  ('adam-eve-conflict', '1-adam-eve', 72, 12, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s plot to make Adam disappear from off the earth (72:12) is the serpent striking at the woman''s seed declared in Eden.'),
  ('adam-eve-conflict', '1-adam-eve', 72, 11, 'canon', '1-peter', 5, 8, 'free', E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* The adversary who would have Adam slain (72:11) is the same devourer Kepha warns the saints to watch against.'),
  ('adam-eve-conflict', '1-adam-eve', 72, 12, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Against Satan''s design to destroy the first man (72:12) stands the promise that he himself will be bruised underfoot.'),
  ('adam-eve-conflict', '1-adam-eve', 72, 11, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The devil who sins from the beginning is the very plotter of 72:11, and the Son is manifested to undo his works.'),
  -- thread: 1-adam-eve-72-fire-of-sin-restrained
  ('adam-eve-conflict', '1-adam-eve', 72, 13, 'canon', 'james', 1, 14, 'free', E'James 1:14 — *But every man is tempted, when he is drawn away of his own lust, and enticed.* The fire of sin that comes over Adam and his thought of committing it (72:13) is exactly the drawing-away and enticing James describes.'),
  ('adam-eve-conflict', '1-adam-eve', 72, 13, 'canon', 'james', 1, 15, 'free', E'James 1:15 — *Then when lust hath conceived, it bringeth forth sin: and sin, when it is finished, bringeth forth death.* Adam restrains himself precisely because he fears the death this lust would bring forth (72:13), the end James names.'),
  ('adam-eve-conflict', '1-adam-eve', 72, 16, 'canon', 'matthew', 26, 41, 'free', E'Matthew 26:41 — *Watch and pray, that ye enter not into temptation: the spirit indeed is willing, but the flesh is weak.* Adam standing in prayer through the night against the thoughts in his heart (72:16) lives out the Messiah''s counsel to watch and pray against temptation.'),
  ('adam-eve-conflict', '1-adam-eve', 72, 13, 'canon', 'matthew', 4, 1, 'free', E'Matthew 4:1 — *Then was Yahusha (Jesus) led up of the Spirit into the wilderness to be tempted of the devil.* Adam tried by the devil''s apparition (72:13) prefigures the Last Adam likewise led to be tempted of the same enemy.'),
  -- thread: 1-adam-eve-72-pray-for-permission
  ('adam-eve-conflict', '1-adam-eve', 72, 20, 'canon', 'psalms', 50, 15, 'free', E'Psalm 50:15 — *And call upon me in the day of trouble: I will deliver thee, and thou shalt glorify me.* Adam and Eve turning to pray in their cave whether the counsel be good (72:20) is the calling-upon Yahuah promises to answer with deliverance.'),
  ('adam-eve-conflict', '1-adam-eve', 72, 19, 'canon', 'genesis', 2, 18, 'free', E'Genesis 2:18 — *And Yahuah Elohim (the LORD God) said, It is not good that the man should be alone; I will make him an help meet for him.* The marriage Adam waits on Yahuah to authorize (72:19) is the help meet Yahuah Himself first gave him.'),
  ('adam-eve-conflict', '1-adam-eve', 72, 19, 'canon', 'hebrews', 13, 4, 'free', E'Hebrews 13:4 — *Marriage is honourable in all, and the bed undefiled: but whoremongers and adulterers Elohim (God) will judge.* Adam refuses to let Satan defile with sinful apparitions (72:19) the marriage Scripture calls honourable and undefiled.'),
  ('adam-eve-conflict', '1-adam-eve', 72, 24, 'jubilees', 'jubilees', 3, 6, 'extras', E'Jubilees 3:6 — *And He awaked Adam out of his sleep and on awaking he rose on the sixth day, and He brought her to him, and he knew her, and said to her: “This is now bone of my bones and flesh of my flesh; she will be called my wife; because she was taken from her husband.” Therefore shall man and wife be one, and therefore shall a man leave his father and his mother, and cleave to his wife, and they shall be one flesh.* The one-flesh bond Adam fears the devils will counterfeit by their apparitions (72:24) is the genuine union Yahuah brought Adam from his own side.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae72_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae72_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-72-transformed-maidens',
       E'Satan transformed into maidens of grace',
       E'Outside the garden the old enemy comes dressed in beauty: *Then Satan, and ten from his hosts, transformed themselves into maidens, unlike any others in the whole world for grace.* (1 Adam and Eve 72:1), and they came up out of the river and greeted Adam and Eve so that the two *stood wondering at them* (72:2). The text names the disguise as a *device of Satan to deceive Adam* (72:9). It ain''t new — the apostle had already unmasked this very wardrobe: *And no marvel; for Satan himself is transformed into an angel of light.* (2 Corinthians 11:14). The Messiah traced the same lie to its father: *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* (John 8:44). And Yahuchanan (John) the Revelator unveils the same shape-shifter at the end as at the beginning: *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* (Revelation 12:9). The serpent of Eden simply changes costume; the deceiver is one.',
       sv.verse_id, ev.verse_id, 'extras', 65775
  FROM _session253_1ae72_lookup sv, _session253_1ae72_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=72 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=72 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-72-device-to-kill-the-seed',
       E'The device to slay the seed of the woman',
       E'Satan''s reasoning lays the plot bare: *Now, then, if I deceive him to do this thing, and to marry Eve without Elohim''s (God''s) permission, Elohim (God) will kill him then.* (1 Adam and Eve 72:11), *because he sought to kill him, and to make him disappear from off the face of the earth.* (72:12). The whole stratagem is one more blow at the promised Seed — the enmity declared in Eden: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* (Genesis 3:15). The serpent strikes at the heel that he may keep the head from ever coming. Yet the same Word who set the enmity sets the outcome: *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* (Romans 16:20). For this end the Seed Himself appears: *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* (1 John 3:8). The murderer who was a murderer from the beginning fails again at the beginning.',
       sv.verse_id, ev.verse_id, 'extras', 65778
  FROM _session253_1ae72_lookup sv, _session253_1ae72_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=72 AND sv.verse_number=10
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=72 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-72-fire-of-sin-restrained',
       E'The fire of sin, and Adam''s restraint',
       E'The temptation reaches inward: *Meanwhile the fire of sin came over Adam, and he thought of committing sin. But he restrained himself, fearing that if he followed this advice of Satan, Elohim (God) would put him to death.* (1 Adam and Eve 72:13). Yaaqov (James) traces this same fire from kindling to fruit: *But every man is tempted, when he is drawn away of his own lust, and enticed.* (James 1:14); *Then when lust hath conceived, it bringeth forth sin: and sin, when it is finished, bringeth forth death.* (James 1:15). Adam''s remedy is the Messiah''s own counsel in the night of His own trial: *Watch and pray, that ye enter not into temptation: the spirit indeed is willing, but the flesh is weak.* (Matthew 26:41) — and indeed Adam rose and prayed (72:14, 16). The pattern is fixed: the Spirit Himself leads into the place of testing — *Then was Yahusha (Jesus) led up of the Spirit into the wilderness to be tempted of the devil.* (Matthew 4:1) — and the way out is the fear of Yahuah that holds the heart.',
       sv.verse_id, ev.verse_id, 'extras', 65781
  FROM _session253_1ae72_lookup sv, _session253_1ae72_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=72 AND sv.verse_number=13
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=72 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-72-pray-for-permission',
       E'Asking Yahuah, lest the marriage be sin',
       E'Adam will not act without his Maker''s word: *That I may request Yahuah (Lord) to inform me about marrying you; for I will not do it without His permission... For those devils have set my heart on fire, with thoughts of what they showed us, in their sinful apparitions.* (1 Adam and Eve 72:19), and Eve answers, *Let us rather stand up and pray in our cave to Elohim (God), to let us know whether this counsel is good or not.* (72:20). The cure for the enemy''s apparitions is to call on the Name in the day of trouble: *And call upon me in the day of trouble: I will deliver thee, and thou shalt glorify me.* (Psalm 50:15). And the very joining they wait on Yahuah to bless is the joining He Himself ordained at the first: *And Yahuah Elohim (the LORD God) said, It is not good that the man should be alone; I will make him an help meet for him.* (Genesis 2:18). What Satan twists into a snare of death, the Word made honourable from the beginning: *Marriage is honourable in all, and the bed undefiled: but whoremongers and adulterers Elohim (God) will judge.* (Hebrews 13:4). Election precedes confession: Adam waits on the covenant Word before he takes a single step.',
       sv.verse_id, ev.verse_id, 'extras', 65784
  FROM _session253_1ae72_lookup sv, _session253_1ae72_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=72 AND sv.verse_number=17
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=72 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-72-transformed-maidens
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Corinthians 11:14 — *And no marvel; for Satan himself is transformed into an angel of light.* The very transformation Paul names is acted out as Satan and his hosts put on the borrowed grace of maidens to deceive Adam in 1 Adam and Eve 72:1.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae72_lookup sv, _session253_1ae72_lookup tv
 WHERE t.slug='1-adam-eve-72-transformed-maidens'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=72 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 8:44 — *Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it.* The narrator''s verdict that this was a device of Satan to deceive Adam (72:9) is the same liar and murderer the Messiah exposes.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae72_lookup sv, _session253_1ae72_lookup tv
 WHERE t.slug='1-adam-eve-72-transformed-maidens'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=72 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 12:9 — *And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him.* The shining maidens are the old serpent who deceiveth the whole world, here at his earliest work on the first man in 1 Adam and Eve 72:1.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae72_lookup sv, _session253_1ae72_lookup tv
 WHERE t.slug='1-adam-eve-72-transformed-maidens'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=72 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-72-device-to-kill-the-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Satan''s plot to make Adam disappear from off the earth (72:12) is the serpent striking at the woman''s seed declared in Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae72_lookup sv, _session253_1ae72_lookup tv
 WHERE t.slug='1-adam-eve-72-device-to-kill-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=72 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Peter 5:8 — *Be sober, be vigilant; because your adversary the devil, as a roaring lion, walketh about, seeking whom he may devour:* The adversary who would have Adam slain (72:11) is the same devourer Kepha warns the saints to watch against.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae72_lookup sv, _session253_1ae72_lookup tv
 WHERE t.slug='1-adam-eve-72-device-to-kill-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=72 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Against Satan''s design to destroy the first man (72:12) stands the promise that he himself will be bruised underfoot.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae72_lookup sv, _session253_1ae72_lookup tv
 WHERE t.slug='1-adam-eve-72-device-to-kill-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=72 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The devil who sins from the beginning is the very plotter of 72:11, and the Son is manifested to undo his works.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae72_lookup sv, _session253_1ae72_lookup tv
 WHERE t.slug='1-adam-eve-72-device-to-kill-the-seed'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=72 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-72-fire-of-sin-restrained
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 1:14 — *But every man is tempted, when he is drawn away of his own lust, and enticed.* The fire of sin that comes over Adam and his thought of committing it (72:13) is exactly the drawing-away and enticing James describes.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae72_lookup sv, _session253_1ae72_lookup tv
 WHERE t.slug='1-adam-eve-72-fire-of-sin-restrained'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=72 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 1:15 — *Then when lust hath conceived, it bringeth forth sin: and sin, when it is finished, bringeth forth death.* Adam restrains himself precisely because he fears the death this lust would bring forth (72:13), the end James names.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae72_lookup sv, _session253_1ae72_lookup tv
 WHERE t.slug='1-adam-eve-72-fire-of-sin-restrained'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=72 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 26:41 — *Watch and pray, that ye enter not into temptation: the spirit indeed is willing, but the flesh is weak.* Adam standing in prayer through the night against the thoughts in his heart (72:16) lives out the Messiah''s counsel to watch and pray against temptation.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae72_lookup sv, _session253_1ae72_lookup tv
 WHERE t.slug='1-adam-eve-72-fire-of-sin-restrained'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=72 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Matthew 4:1 — *Then was Yahusha (Jesus) led up of the Spirit into the wilderness to be tempted of the devil.* Adam tried by the devil''s apparition (72:13) prefigures the Last Adam likewise led to be tempted of the same enemy.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae72_lookup sv, _session253_1ae72_lookup tv
 WHERE t.slug='1-adam-eve-72-fire-of-sin-restrained'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=72 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-72-pray-for-permission
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 50:15 — *And call upon me in the day of trouble: I will deliver thee, and thou shalt glorify me.* Adam and Eve turning to pray in their cave whether the counsel be good (72:20) is the calling-upon Yahuah promises to answer with deliverance.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae72_lookup sv, _session253_1ae72_lookup tv
 WHERE t.slug='1-adam-eve-72-pray-for-permission'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=72 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=50 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:18 — *And Yahuah Elohim (the LORD God) said, It is not good that the man should be alone; I will make him an help meet for him.* The marriage Adam waits on Yahuah to authorize (72:19) is the help meet Yahuah Himself first gave him.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae72_lookup sv, _session253_1ae72_lookup tv
 WHERE t.slug='1-adam-eve-72-pray-for-permission'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=72 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 13:4 — *Marriage is honourable in all, and the bed undefiled: but whoremongers and adulterers Elohim (God) will judge.* Adam refuses to let Satan defile with sinful apparitions (72:19) the marriage Scripture calls honourable and undefiled.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae72_lookup sv, _session253_1ae72_lookup tv
 WHERE t.slug='1-adam-eve-72-pray-for-permission'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=72 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 3:6 — *And He awaked Adam out of his sleep and on awaking he rose on the sixth day, and He brought her to him, and he knew her, and said to her: “This is now bone of my bones and flesh of my flesh; she will be called my wife; because she was taken from her husband.” Therefore shall man and wife be one, and therefore shall a man leave his father and his mother, and cleave to his wife, and they shall be one flesh.* The one-flesh bond Adam fears the devils will counterfeit by their apparitions (72:24) is the genuine union Yahuah brought Adam from his own side.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae72_lookup sv, _session253_1ae72_lookup tv
 WHERE t.slug='1-adam-eve-72-pray-for-permission'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=72 AND sv.verse_number=24
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

