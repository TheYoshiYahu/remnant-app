-- ----- fragment: minion_thewisdomofsolomon_09.sql (session253 the-wisdom-of-solomon 9) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis09 (view _session253_wis09_lookup). Sort band base 58200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-9-solomon-asks-for-wisdom
  ('apocrypha', 'the-wisdom-of-solomon', 9, 4, 'canon', '1-kings', 3, 9, 'free', E'1 Kings 3:9 — *Give therefore thy servant an understanding heart to judge thy people, that I may discern between good and bad: for who is able to judge this thy so great a people?* Solomon''s plea for throne-wisdom in Wisdom 9:4 is the same petition for a discerning heart at Gibeon.'),
  ('apocrypha', 'the-wisdom-of-solomon', 9, 5, 'canon', '2-chronicles', 1, 10, 'free', E'2 Chronicles 1:10 — *Give me now wisdom and knowledge, that I may go out and come in before this people: for who can judge this thy people, that is so great?* Solomon''s confession of being too young for judgment (Wisdom 9:5) is answered by this Chronicles prayer for wisdom to govern.'),
  ('apocrypha', 'the-wisdom-of-solomon', 9, 6, 'canon', 'james', 1, 5, 'free', E'James 1:5 — *If any of you lack wisdom, let him ask of God, that giveth to all men liberally, and upbraideth not; and it shall be given him.* Wisdom 9:6 — that the perfect man is nothing without wisdom — is why James commands the lacking to ask the giving Elohim.'),
  -- thread: wisdom-9-wisdom-present-at-creation
  ('apocrypha', 'the-wisdom-of-solomon', 9, 9, 'canon', 'proverbs', 8, 30, 'free', E'Proverbs 8:30 — *Then I was by him, as one brought up with him: and I was daily his delight, rejoicing always before him.* Wisdom present when Yahuah made the world (Wisdom 9:9) is the formed Wisdom rejoicing beside Him in Proverbs 8.'),
  ('apocrypha', 'the-wisdom-of-solomon', 9, 9, 'canon', 'john', 1, 3, 'free', E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* Wisdom 9:9 — wisdom knowing the works and present at the world''s making — is the Logos through whom all was made.'),
  ('apocrypha', 'the-wisdom-of-solomon', 9, 9, 'canon', 'colossians', 1, 16, 'free', E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him.* The wisdom present at creation in 9:9 is the One in whom and for whom all things were made.'),
  -- thread: wisdom-9-sent-from-the-throne
  ('apocrypha', 'the-wisdom-of-solomon', 9, 10, 'canon', 'proverbs', 2, 6, 'free', E'Proverbs 2:6 — *For the LORD giveth wisdom: out of his mouth cometh knowledge and understanding.* Solomon''s plea to have wisdom sent from the holy heavens (Wisdom 9:10) rests on Yahuah being the sole giver of wisdom.'),
  ('apocrypha', 'the-wisdom-of-solomon', 9, 10, 'canon', 'john', 3, 13, 'free', E'John 3:13 — *And no man hath ascended up to heaven, but he that came down from heaven, even the Son of man which is in heaven.* Wisdom sent down from the throne of glory (Wisdom 9:10) matches the descent of the Son who alone brings heavenly things.'),
  -- thread: wisdom-9-who-can-know-the-counsel
  ('apocrypha', 'the-wisdom-of-solomon', 9, 13, 'canon', 'isaiah', 40, 13, 'free', E'Isaiah 40:13 — *Who hath directed the Spirit of the LORD, or being his counsellor hath taught him?* Solomon''s question — what man can know the counsel of Yahuah (Wisdom 9:13) — is Isaiah''s challenge to the mind that would counsel its Maker.'),
  ('apocrypha', 'the-wisdom-of-solomon', 9, 13, 'canon', 'romans', 11, 34, 'free', E'Romans 11:34 — *For who hath known the mind of the Lord? or who hath been his counsellor?* Paul''s doxology echoes Wisdom 9:13 — no mortal can know the counsel of Yahuah apart from His own revealing.'),
  ('apocrypha', 'the-wisdom-of-solomon', 9, 16, 'canon', 'john', 3, 12, 'free', E'John 3:12 — *If I have told you earthly things, and ye believe not, how shall ye believe, if I tell you of heavenly things?* Wisdom 9:16 — that the things in heaven none has searched out — is the very gap Messiah names to Nicodemus.'),
  -- thread: wisdom-9-spirit-from-above-saved-through-wisdom
  ('apocrypha', 'the-wisdom-of-solomon', 9, 17, 'canon', '1-corinthians', 2, 10, 'free', E'1 Corinthians 2:10 — *But God hath revealed them unto us by his Spirit: for the Spirit searcheth all things, yea, the deep things of God.* Wisdom 9:17 — that none knows Yahuah''s counsel unless He sends the Ruach HaKodesh — is exactly the Spirit who searches the deep things of Elohim.'),
  ('apocrypha', 'the-wisdom-of-solomon', 9, 17, 'canon', 'john', 16, 13, 'free', E'John 16:13 — *Howbeit when he, the Spirit of truth, is come, he will guide you into all truth: for he shall not speak of himself; but whatsoever he shall hear, that shall he speak: and he will shew you things to come.* The Spirit sent from above to teach (Wisdom 9:17) is the Spirit of truth who guides into all truth.'),
  ('apocrypha', 'the-wisdom-of-solomon', 9, 18, 'canon', 'proverbs', 3, 6, 'free', E'Proverbs 3:6 — *In all thy ways acknowledge him, and he shall direct thy paths.* Wisdom 9:18 — men''s ways reformed and saved through wisdom — is the directed path of the one who acknowledges Yahuah in all his ways.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-9-solomon-asks-for-wisdom',
       E'Solomon''s prayer — give me wisdom that sits by Your throne',
       E'Solomon prays as a young, untried king: *Give me wisdom, that sits by your throne; and reject me not from among your children* (The Wisdom of Solomon 9:4), confessing *I your servant and son of yours handmaid am a feeble person, and of a short time, and too young for the understanding of judgment and laws* (The Wisdom of Solomon 9:5). This is the prayer the Tanakh records at Gibeon, where Yahuah is pleased that Solomon asks not for long life or riches but for discernment: *Give therefore thy servant an understanding heart to judge thy people, that I may discern between good and bad* (1 Kings 3:9), and the parallel *Give me now wisdom and knowledge, that I may go out and come in before this people* (2 Chronicles 1:10). The NT carries the same posture forward — wisdom is still a gift to be asked for: *If any of you lack wisdom, let him ask of God, that giveth to all men liberally, and upbraideth not; and it shall be given him* (James 1:5). It ain''t new: the throne-wisdom Solomon begs for is the same Spirit James says is given to the humble who ask.',
       sv.verse_id, ev.verse_id, 'extras', 58200
  FROM _session253_wis09_lookup sv, _session253_wis09_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=9 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-9-wisdom-present-at-creation',
       E'Wisdom present when You made the world',
       E'Solomon names wisdom as the one who stood beside Yahuah at the founding of all things: *And wisdom was with you: which knoweth your works, and was present when you madest the world, and knew what was acceptable in your sight, and right in your commandments* (The Wisdom of Solomon 9:9). This is the formed Wisdom of Proverbs, the craftsman beside Yahuah before the deep was: *Then I was by him, as one brought up with him: and I was daily his delight, rejoicing always before him* (Proverbs 8:30), the Wisdom by whom *Yahuah by wisdom hath founded the earth* (Proverbs 3:19). The NT names this Wisdom as the Logos through whom the worlds were framed: *All things were made by him; and without him was not any thing made that was made* (John 1:3), and *by him were all things created, that are in heaven, and that are in earth* (Colossians 1:16). It ain''t new: the Wisdom present at creation in 9:9 is the Word made flesh.',
       sv.verse_id, ev.verse_id, 'extras', 58203
  FROM _session253_wis09_lookup sv, _session253_wis09_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=9 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-9-sent-from-the-throne',
       E'Send her out of Your holy heavens — wisdom from the throne',
       E'Solomon asks not to summon wisdom upward but to have her sent down: *O send her out of your holy heavens, and from the throne of your glory, that being present she may labour with me, that I may know what is pleasing to you* (The Wisdom of Solomon 9:10). Wisdom is a gift dispatched from above, never grasped from below — *For Yahuah giveth wisdom: out of his mouth cometh knowledge and understanding* (Proverbs 2:6). The same descent-not-ascent logic anchors Messiah''s word to Nicodemus: heavenly things are known only because One came down from the throne — *And no man hath ascended up to heaven, but he that came down from heaven, even the Son of man which is in heaven* (John 3:13). It ain''t new: wisdom sent from the throne of glory in 9:10 is the heavenly gift that descends, not the human ascent that fails.',
       sv.verse_id, ev.verse_id, 'extras', 58206
  FROM _session253_wis09_lookup sv, _session253_wis09_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=9 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-9-who-can-know-the-counsel',
       E'Who can know the counsel of Yahuah?',
       E'Solomon presses the limit of the unaided mind: *For what man is he that can know the counsel of Yahuah (God)? or who can think what the will of Yahuah (God) is?* (The Wisdom of Solomon 9:13), for *the corruptible body presseth down the soul, and the earthy tabernacle weigheth down the mind that museth upon many things* (The Wisdom of Solomon 9:15), and *the things that are in heaven who has searched out?* (The Wisdom of Solomon 9:16). Isaiah set the question first: *Who hath directed the Spirit of the LORD, or being his counsellor hath taught him?* (Isaiah 40:13). Paul quotes that very line as the doxology closing his mystery of election: *For who hath known the mind of the Lord? or who hath been his counsellor?* (Romans 11:34). And Messiah seals it for Nicodemus: *If I have told you earthly things, and ye believe not, how shall ye believe, if I tell you of heavenly things?* (John 3:12). It ain''t new: the unsearchable counsel of 9:13-16 is the mind of Yahuah that only the sent Spirit reveals.',
       sv.verse_id, ev.verse_id, 'extras', 58209
  FROM _session253_wis09_lookup sv, _session253_wis09_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=9 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-9-spirit-from-above-saved-through-wisdom',
       E'Except You send Your Ruach HaKodesh from above',
       E'The chapter''s hinge is the gift of the Spirit: *And your counsel who has known, except you give wisdom, and send your Ruach HaKodesh (Holy Spirit) from above?* (The Wisdom of Solomon 9:17), so that *the ways of them which lived on the earth were reformed, and men were taught the things that are pleasing to you, and were saved through wisdom* (The Wisdom of Solomon 9:18). The counsel of Yahuah is searched out only by His Spirit: *the Spirit searcheth all things, yea, the deep things of God* (1 Corinthians 2:10), and the Comforter *will guide you into all truth* (John 16:13). It ain''t new: the Ruach HaKodesh sent from above to teach and to save in 9:17-18 is the same Spirit of truth poured out to lead the reformed into all that is pleasing to Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 58212
  FROM _session253_wis09_lookup sv, _session253_wis09_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=9 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-9-solomon-asks-for-wisdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Kings 3:9 — *Give therefore thy servant an understanding heart to judge thy people, that I may discern between good and bad: for who is able to judge this thy so great a people?* Solomon''s plea for throne-wisdom in Wisdom 9:4 is the same petition for a discerning heart at Gibeon.'
  FROM cross_reference_threads t, cross_references x, _session253_wis09_lookup sv, _session253_wis09_lookup tv
 WHERE t.slug='wisdom-9-solomon-asks-for-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=3 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Chronicles 1:10 — *Give me now wisdom and knowledge, that I may go out and come in before this people: for who can judge this thy people, that is so great?* Solomon''s confession of being too young for judgment (Wisdom 9:5) is answered by this Chronicles prayer for wisdom to govern.'
  FROM cross_reference_threads t, cross_references x, _session253_wis09_lookup sv, _session253_wis09_lookup tv
 WHERE t.slug='wisdom-9-solomon-asks-for-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'James 1:5 — *If any of you lack wisdom, let him ask of God, that giveth to all men liberally, and upbraideth not; and it shall be given him.* Wisdom 9:6 — that the perfect man is nothing without wisdom — is why James commands the lacking to ask the giving Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_wis09_lookup sv, _session253_wis09_lookup tv
 WHERE t.slug='wisdom-9-solomon-asks-for-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-9-wisdom-present-at-creation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 8:30 — *Then I was by him, as one brought up with him: and I was daily his delight, rejoicing always before him.* Wisdom present when Yahuah made the world (Wisdom 9:9) is the formed Wisdom rejoicing beside Him in Proverbs 8.'
  FROM cross_reference_threads t, cross_references x, _session253_wis09_lookup sv, _session253_wis09_lookup tv
 WHERE t.slug='wisdom-9-wisdom-present-at-creation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:3 — *All things were made by him; and without him was not any thing made that was made.* Wisdom 9:9 — wisdom knowing the works and present at the world''s making — is the Logos through whom all was made.'
  FROM cross_reference_threads t, cross_references x, _session253_wis09_lookup sv, _session253_wis09_lookup tv
 WHERE t.slug='wisdom-9-wisdom-present-at-creation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Colossians 1:16 — *For by him were all things created, that are in heaven, and that are in earth, visible and invisible, whether they be thrones, or dominions, or principalities, or powers: all things were created by him, and for him.* The wisdom present at creation in 9:9 is the One in whom and for whom all things were made.'
  FROM cross_reference_threads t, cross_references x, _session253_wis09_lookup sv, _session253_wis09_lookup tv
 WHERE t.slug='wisdom-9-wisdom-present-at-creation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-9-sent-from-the-throne
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 2:6 — *For the LORD giveth wisdom: out of his mouth cometh knowledge and understanding.* Solomon''s plea to have wisdom sent from the holy heavens (Wisdom 9:10) rests on Yahuah being the sole giver of wisdom.'
  FROM cross_reference_threads t, cross_references x, _session253_wis09_lookup sv, _session253_wis09_lookup tv
 WHERE t.slug='wisdom-9-sent-from-the-throne'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=2 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 3:13 — *And no man hath ascended up to heaven, but he that came down from heaven, even the Son of man which is in heaven.* Wisdom sent down from the throne of glory (Wisdom 9:10) matches the descent of the Son who alone brings heavenly things.'
  FROM cross_reference_threads t, cross_references x, _session253_wis09_lookup sv, _session253_wis09_lookup tv
 WHERE t.slug='wisdom-9-sent-from-the-throne'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-9-who-can-know-the-counsel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 40:13 — *Who hath directed the Spirit of the LORD, or being his counsellor hath taught him?* Solomon''s question — what man can know the counsel of Yahuah (Wisdom 9:13) — is Isaiah''s challenge to the mind that would counsel its Maker.'
  FROM cross_reference_threads t, cross_references x, _session253_wis09_lookup sv, _session253_wis09_lookup tv
 WHERE t.slug='wisdom-9-who-can-know-the-counsel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 11:34 — *For who hath known the mind of the Lord? or who hath been his counsellor?* Paul''s doxology echoes Wisdom 9:13 — no mortal can know the counsel of Yahuah apart from His own revealing.'
  FROM cross_reference_threads t, cross_references x, _session253_wis09_lookup sv, _session253_wis09_lookup tv
 WHERE t.slug='wisdom-9-who-can-know-the-counsel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 3:12 — *If I have told you earthly things, and ye believe not, how shall ye believe, if I tell you of heavenly things?* Wisdom 9:16 — that the things in heaven none has searched out — is the very gap Messiah names to Nicodemus.'
  FROM cross_reference_threads t, cross_references x, _session253_wis09_lookup sv, _session253_wis09_lookup tv
 WHERE t.slug='wisdom-9-who-can-know-the-counsel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-9-spirit-from-above-saved-through-wisdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 2:10 — *But God hath revealed them unto us by his Spirit: for the Spirit searcheth all things, yea, the deep things of God.* Wisdom 9:17 — that none knows Yahuah''s counsel unless He sends the Ruach HaKodesh — is exactly the Spirit who searches the deep things of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_wis09_lookup sv, _session253_wis09_lookup tv
 WHERE t.slug='wisdom-9-spirit-from-above-saved-through-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=2 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 16:13 — *Howbeit when he, the Spirit of truth, is come, he will guide you into all truth: for he shall not speak of himself; but whatsoever he shall hear, that shall he speak: and he will shew you things to come.* The Spirit sent from above to teach (Wisdom 9:17) is the Spirit of truth who guides into all truth.'
  FROM cross_reference_threads t, cross_references x, _session253_wis09_lookup sv, _session253_wis09_lookup tv
 WHERE t.slug='wisdom-9-spirit-from-above-saved-through-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=16 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 3:6 — *In all thy ways acknowledge him, and he shall direct thy paths.* Wisdom 9:18 — men''s ways reformed and saved through wisdom — is the directed path of the one who acknowledges Yahuah in all his ways.'
  FROM cross_reference_threads t, cross_references x, _session253_wis09_lookup sv, _session253_wis09_lookup tv
 WHERE t.slug='wisdom-9-spirit-from-above-saved-through-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=9 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

