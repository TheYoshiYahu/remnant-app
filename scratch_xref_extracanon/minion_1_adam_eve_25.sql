-- ----- fragment: minion_1adameve_25.sql (session253 1-adam-eve 25) -----
-- Source anchor: adam-eve-conflict/1-adam-eve ch25. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1ae25 (view _session253_1ae25_lookup). Sort band base 64600, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1ae25_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-adam-eve-25-self-slaughter-seed-war
  ('adam-eve-conflict', '1-adam-eve', 25, 1, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Adam''s drive to spill his own blood (25:1) is the serpent striking at the very seed-bearer Yahuah has sworn to keep.'),
  ('adam-eve-conflict', '1-adam-eve', 25, 1, 'canon', '1-john', 3, 8, 'free', E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The self-slaughter Adam imagines (25:1) is a work of the devil, and the promised Son comes precisely to undo it.'),
  ('adam-eve-conflict', '1-adam-eve', 25, 3, 'canon', 'romans', 16, 20, 'free', E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Adam grieving over his transgression and his lost light (25:3) stands on this side of the bruising of the same adversary that hounds him.'),
  -- thread: 1-adam-eve-25-no-pleasure-in-death
  ('adam-eve-conflict', '1-adam-eve', 25, 5, 'canon', 'ezekiel', 33, 11, 'free', E'Ezekiel 33:11 — *Say unto them, As I live, saith Adonai Yahuah (the Lord GOD), I have no pleasure in the death of the wicked; but that the wicked turn from his way and live: turn ye, turn ye from your evil ways; for why will ye die, O house of Yashar''el (Israel)?* Adam confesses the very mercy Yahuah will later swear by — that He does not want anyone to perish (25:5).'),
  ('adam-eve-conflict', '1-adam-eve', 25, 5, 'canon', '2-peter', 3, 9, 'free', E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* The God who ''does not want anyone to perish'' in Adam''s mouth (25:5) is the same longsuffering Yahuah of the last days.'),
  ('adam-eve-conflict', '1-adam-eve', 25, 4, 'canon', 'psalms', 103, 8, 'free', E'Psalm 103:8 — *Yahuah (LORD) is merciful and gracious, slow to anger, and plenteous in mercy.* Adam appeals to Yahuah''s goodness to revive him every time he dies (25:4) — the very plenteous mercy David sings.'),
  -- thread: 1-adam-eve-25-the-word-comforts-promises-messiah
  ('adam-eve-conflict', '1-adam-eve', 25, 7, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The ''Word of Elohim'' who comes, blesses, and covenants with Adam (25:7) is the eternal Logos Himself.'),
  ('adam-eve-conflict', '1-adam-eve', 25, 7, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The covenant ''to save him at the end of the days'' (25:7) is kept when the same Word takes flesh.'),
  ('adam-eve-conflict', '1-adam-eve', 25, 7, 'canon', 'galatians', 4, 4, 'free', E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The ''end of the days determined for him'' (25:7) is this appointed fulness in which the Son is sent.'),
  ('adam-eve-conflict', '1-adam-eve', 25, 7, 'canon', '1-peter', 1, 20, 'free', E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* The salvation covenanted to Adam on the first day outside Eden (25:7) was foreordained before creation itself.'),
  -- thread: 1-adam-eve-25-first-offering-custom
  ('adam-eve-conflict', '1-adam-eve', 25, 8, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Adam''s first offering becoming his custom (25:8) is the same primeval worship the seed of Seth carries on.'),
  ('adam-eve-conflict', '1-adam-eve', 25, 8, 'canon', 'hebrews', 13, 15, 'free', E'Hebrews 13:15 — *By him therefore let us offer the sacrifice of praise to Elohim (God) continually, that is, the fruit of our lips giving thanks to his name.* The ''custom'' of offering Adam establishes (25:8) is fulfilled as the continual sacrifice of praise.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1ae25_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1ae25_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-25-self-slaughter-seed-war',
       E'The Self-Slaughter Forbidden — the Serpent Striking at the Seed',
       E'*But Elohim (God) knew that Adam believed he should frequently kill himself and make an offering to Him of his blood... ''O Adam, don''t ever kill yourself like this again, by throwing yourself down from that mountain.''* (1 Adam & Eve 25:1-2). It ain''t new: from the first day outside the garden the enmity declared in Eden is already at work, the serpent driving the man of dust to destroy himself — *I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). The despair is not Adam''s own counsel but the prowling adversary, of whom it is written *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (1 John 3:8). The same Yahuah who promised the bruising of the head will not let the seed-bearer perish: *And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20).',
       sv.verse_id, ev.verse_id, 'extras', 64600
  FROM _session253_1ae25_lookup sv, _session253_1ae25_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=25 AND sv.verse_number=1
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=25 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-25-no-pleasure-in-death',
       E'A Merciful Elohim Who Wills That None Should Perish',
       E'*And thereby it will be made known that You are a merciful Elohim (God), who does not want anyone to perish; who loves not that one should fall; and who does not condemn any one cruelly, badly, and by whole destruction* (1 Adam & Eve 25:5). Adam''s plea is the very heart Yahuah reveals to the prophets and apostles. To the house of Yashar''el He swears: *As I live, saith Adonai Yahuah (the Lord GOD), I have no pleasure in the death of the wicked; but that the wicked turn from his way and live* (Ezekiel 33:11). And the same longsuffering reaches the last days: *Yahuah (Lord) is not slack concerning his promise... not willing that any should perish, but that all should come to repentance* (2 Peter 3:9). This is the character sung over all His works: *Yahuah (LORD) is merciful and gracious, slow to anger, and plenteous in mercy* (Psalm 103:8) — the mercy that keeps the seed alive from the first day outside Eden.',
       sv.verse_id, ev.verse_id, 'extras', 64603
  FROM _session253_1ae25_lookup sv, _session253_1ae25_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=25 AND sv.verse_number=4
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=25 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-25-the-word-comforts-promises-messiah',
       E'The Word of Elohim Who Comforts and Covenants to Save at the End of the Days',
       E'*And the Word of Elohim (God) came to him, and blessed him, and comforted him, and covenanted with him, that He would save him at the end of the days determined for him* (1 Adam & Eve 25:7). This is no created angel but the Logos Himself, the One the apostle names: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1), the Word who *was made flesh, and dwelt among us... full of grace and truth* (John 1:14). The ''end of the days determined'' is the appointed fulness Adam was promised — fulfilled when *the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law* (Galatians 4:4). It was no afterthought: the Saviour was *foreordained before the foundation of the world, but was manifest in these last times for you* (1 Peter 1:20).',
       sv.verse_id, ev.verse_id, 'extras', 64606
  FROM _session253_1ae25_lookup sv, _session253_1ae25_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=25 AND sv.verse_number=7
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=25 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-adam-eve-25-first-offering-custom',
       E'Adam''s First Offering — the Way Kept Before Sinai',
       E'*This, then, was the first offering Adam made to Elohim (God); and so it became his custom to do* (1 Adam & Eve 25:8). The offerings and the calling on the Name run from the very first generation, long before Sinai: *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD)* (Genesis 4:26). What Adam begins as his custom the writer to the Hebrews names the enduring sacrifice: *By him therefore let us offer the sacrifice of praise to Elohim (God) continually, that is, the fruit of our lips giving thanks to his name* (Hebrews 13:15). The blessing and comfort Adam receives are not earned by blood but given in covenant mercy — *Yahuah (LORD) is merciful and gracious, slow to anger, and plenteous in mercy* (Psalm 103:8).',
       sv.verse_id, ev.verse_id, 'extras', 64609
  FROM _session253_1ae25_lookup sv, _session253_1ae25_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=25 AND sv.verse_number=8
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='1-adam-eve' AND ev.chapter_number=25 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-adam-eve-25-self-slaughter-seed-war
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Adam''s drive to spill his own blood (25:1) is the serpent striking at the very seed-bearer Yahuah has sworn to keep.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae25_lookup sv, _session253_1ae25_lookup tv
 WHERE t.slug='1-adam-eve-25-self-slaughter-seed-war'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=25 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 3:8 — *He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil.* The self-slaughter Adam imagines (25:1) is a work of the devil, and the promised Son comes precisely to undo it.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae25_lookup sv, _session253_1ae25_lookup tv
 WHERE t.slug='1-adam-eve-25-self-slaughter-seed-war'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=25 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 16:20 — *And the Elohim (God) of peace shall bruise Satan under your feet shortly. The grace of our Lord Yahusha HaMashiach (Lord Jesus Christ) be with you. Amen.* Adam grieving over his transgression and his lost light (25:3) stands on this side of the bruising of the same adversary that hounds him.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae25_lookup sv, _session253_1ae25_lookup tv
 WHERE t.slug='1-adam-eve-25-self-slaughter-seed-war'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=25 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-25-no-pleasure-in-death
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 33:11 — *Say unto them, As I live, saith Adonai Yahuah (the Lord GOD), I have no pleasure in the death of the wicked; but that the wicked turn from his way and live: turn ye, turn ye from your evil ways; for why will ye die, O house of Yashar''el (Israel)?* Adam confesses the very mercy Yahuah will later swear by — that He does not want anyone to perish (25:5).'
  FROM cross_reference_threads t, cross_references x, _session253_1ae25_lookup sv, _session253_1ae25_lookup tv
 WHERE t.slug='1-adam-eve-25-no-pleasure-in-death'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=25 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=33 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 3:9 — *Yahuah (Lord) is not slack concerning his promise, as some men count slackness; but is longsuffering to us-ward, not willing that any should perish, but that all should come to repentance.* The God who ''does not want anyone to perish'' in Adam''s mouth (25:5) is the same longsuffering Yahuah of the last days.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae25_lookup sv, _session253_1ae25_lookup tv
 WHERE t.slug='1-adam-eve-25-no-pleasure-in-death'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=25 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 103:8 — *Yahuah (LORD) is merciful and gracious, slow to anger, and plenteous in mercy.* Adam appeals to Yahuah''s goodness to revive him every time he dies (25:4) — the very plenteous mercy David sings.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae25_lookup sv, _session253_1ae25_lookup tv
 WHERE t.slug='1-adam-eve-25-no-pleasure-in-death'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=25 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-25-the-word-comforts-promises-messiah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The ''Word of Elohim'' who comes, blesses, and covenants with Adam (25:7) is the eternal Logos Himself.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae25_lookup sv, _session253_1ae25_lookup tv
 WHERE t.slug='1-adam-eve-25-the-word-comforts-promises-messiah'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=25 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The covenant ''to save him at the end of the days'' (25:7) is kept when the same Word takes flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae25_lookup sv, _session253_1ae25_lookup tv
 WHERE t.slug='1-adam-eve-25-the-word-comforts-promises-messiah'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=25 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The ''end of the days determined for him'' (25:7) is this appointed fulness in which the Son is sent.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae25_lookup sv, _session253_1ae25_lookup tv
 WHERE t.slug='1-adam-eve-25-the-word-comforts-promises-messiah'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=25 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 1:20 — *Who verily was foreordained before the foundation of the world, but was manifest in these last times for you,* The salvation covenanted to Adam on the first day outside Eden (25:7) was foreordained before creation itself.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae25_lookup sv, _session253_1ae25_lookup tv
 WHERE t.slug='1-adam-eve-25-the-word-comforts-promises-messiah'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=25 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-adam-eve-25-first-offering-custom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Adam''s first offering becoming his custom (25:8) is the same primeval worship the seed of Seth carries on.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae25_lookup sv, _session253_1ae25_lookup tv
 WHERE t.slug='1-adam-eve-25-first-offering-custom'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=25 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 13:15 — *By him therefore let us offer the sacrifice of praise to Elohim (God) continually, that is, the fruit of our lips giving thanks to his name.* The ''custom'' of offering Adam establishes (25:8) is fulfilled as the continual sacrifice of praise.'
  FROM cross_reference_threads t, cross_references x, _session253_1ae25_lookup sv, _session253_1ae25_lookup tv
 WHERE t.slug='1-adam-eve-25-first-offering-custom'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='1-adam-eve' AND sv.chapter_number=25 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=13 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

