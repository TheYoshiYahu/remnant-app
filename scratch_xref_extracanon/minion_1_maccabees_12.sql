-- ----- fragment: minion_1maccabees_12.sql (session253 1-maccabees 12) -----
-- Source anchor: apocrypha/1-maccabees ch12. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1mac12 (view _session253_1mac12_lookup). Sort band base 61775, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1mac12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-maccabees-12-stock-of-abraham
  ('apocrypha', '1-maccabees', 12, 21, 'canon', 'genesis', 15, 5, 'free', E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* The stock of Abraham the Spartans claim in 1 Maccabees 12:21 is the innumerable seed Yahuah promised to grow until it filled the nations.'),
  ('apocrypha', '1-maccabees', 12, 21, 'canon', 'genesis', 17, 5, 'free', E'Genesis 17:5 — *Neither shall thy name any more be called Abram, but thy name shall be Abraham; for a father of many nations have I made thee.* Abraham being made a father of many nations is the writing that lets a far people in 1 Maccabees 12:21 still be reckoned brothers of the Yahudim.'),
  ('apocrypha', '1-maccabees', 12, 21, 'canon', 'genesis', 17, 7, 'free', E'Genesis 17:7 — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee.* The everlasting covenant to Abraham''s seed is the deeper league standing under the friendship renewed in 1 Maccabees 12:21.'),
  ('apocrypha', '1-maccabees', 12, 6, 'apocrypha', '2-maccabees', 1, 2, 'extras', E'2 Maccabees 1:2 — *Yahuah (God) be gracious to you, and remember his covenant that he made with Abraham, Isaac, and Jacob, his faithful servants;* The brotherhood greeting Jonathan sends in 1 Maccabees 12:6 leans on the same covenant of the fathers that frames the Jerusalem brethren''s letter to their kin.'),
  -- thread: 1-maccabees-12-help-from-heaven
  ('apocrypha', '1-maccabees', 12, 15, 'apocrypha', '2-maccabees', 15, 7, 'extras', E'2 Maccabees 15:7 — *But Maccabeus had ever sure confidence that Yahuah (God) would help him:* The help from heaven Jonathan names in 1 Maccabees 12:15 is the same sure confidence in which his brother house fought, trusting deliverance to come from above.'),
  ('apocrypha', '1-maccabees', 12, 15, 'apocrypha', '2-maccabees', 15, 8, 'extras', E'2 Maccabees 15:8 — *Wherefore he exhorted his people not to fear the coming of the heathen against them, but to remember the help which in former times they had received from heaven, and now to expect the victory and aid, which should come to them from the Almighty.* The help from heaven that succoureth in 1 Maccabees 12:15 is exactly the remembered aid the Maccabees set against the dread of the heathen.'),
  ('apocrypha', '1-maccabees', 12, 9, 'apocrypha', '2-maccabees', 15, 34, 'extras', E'2 Maccabees 15:34 — *So every man praised toward the heaven the glorious Yahuah (God), saying, Blessed be he that has kept his own place undefiled.* Where 1 Maccabees 12:9 finds comfort in the holy books and heaven''s aid, the deliverance ends in praise lifted toward the same heaven that keeps its own place undefiled.'),
  -- thread: 1-maccabees-12-snare-of-the-trusting
  ('apocrypha', '1-maccabees', 12, 46, 'canon', 'psalms', 41, 9, 'free', E'Psalm 41:9 — *Yea, mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me.* Jonathan believing Tryphon and being taken in 1 Maccabees 12:46 is the ancient wound of the trusting betrayed by the friend who shared his table.'),
  ('apocrypha', '1-maccabees', 12, 43, 'canon', 'john', 13, 18, 'free', E'John 13:18 — *I speak not of you all: I know whom I have chosen: but that the scripture may be fulfilled, He that eateth bread with me hath lifted up his heel against me.* The honour and gifts with which Tryphon masks his snare in 1 Maccabees 12:43 foreshadow the betrayal-by-friendship the Messiah names at His own table.'),
  ('apocrypha', '1-maccabees', 12, 44, 'canon', 'proverbs', 26, 25, 'free', E'Proverbs 26:25 — *When he speaketh fair, believe him not: for there are seven abominations in his heart.* Tryphon''s fair words in 1 Maccabees 12:44 — there is no war between us — are the smooth speech the proverb warns hides a heart full of hidden malice.'),
  ('apocrypha', '1-maccabees', 12, 46, 'apocrypha', 'ecclesiasticus', 12, 10, 'extras', E'Sirach 12:10 — *Never trust your enemy: for like as iron rusteth, so is his wickedness.* Jonathan trusting and disarming himself in 1 Maccabees 12:46 is the very thing the wisdom of Sirach forbids — the enemy''s wickedness only waits, like rust, for its hour.'),
  -- thread: 1-maccabees-12-lamentation-no-captain
  ('apocrypha', '1-maccabees', 12, 53, 'canon', 'psalms', 41, 5, 'free', E'Psalm 41:5 — *Mine enemies speak evil of me, When shall he die, and his name perish?* The heathen plotting in 1 Maccabees 12:53 to take away Israel''s memorial speak the very wish of the psalmist''s foes — that the righteous die and his name be blotted out.'),
  ('apocrypha', '1-maccabees', 12, 52, 'canon', 'psalms', 41, 2, 'free', E'Psalm 41:2 — *Yahuah (LORD) will preserve him, and keep him alive; and he shall be blessed upon the earth: and thou wilt not deliver him unto the will of his enemies.* Against all Israel''s lamentation in 1 Maccabees 12:52, the psalm answers that Yahuah will not give the trusting over to the will of their enemies.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1mac12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1mac12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-12-stock-of-abraham',
       E'Of the stock of Abraham — the kindred claimed',
       E'When the Lacedemonians write to the high priest, the bond they name is not treaty but blood: *It is found in writing, that the Lacedemonians and Yahudim (Jews) are brothers, and that they are of the stock of Abraham* (1 Maccabees 12:21). It ain''t new — the seed of Abraham was promised to spread until *thy seed* could not be numbered: *Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be* (Genesis 15:5). The covenant that grew that seed made him *a father of many nations* (Genesis 17:5), the everlasting covenant *between me and thee and thy seed after thee in their generations* (Genesis 17:7). And so the regathered brothers remember one another *both in our feasts, and other convenient days... in the sacrifices which we offer, and in our prayers* (1 Maccabees 12:11) — the covenant people kept, scattered yet still kin, not a stranger-nation replacing them.',
       sv.verse_id, ev.verse_id, 'extras', 61775
  FROM _session253_1mac12_lookup sv, _session253_1mac12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=12 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-12-help-from-heaven',
       E'We have help from heaven — and the holy books in our hands',
       E'Jonathan''s letter waves away need of foreign aid because the true succour is elsewhere: *we have the holy books of scripture in our hands to comfort us* (1 Maccabees 12:9), and *we have help from heaven that succoureth us, so as we are delivered from our enemies, and our enemies are brought under foot* (1 Maccabees 12:15). It ain''t new — this is the unbroken Maccabean confidence: *But Maccabeus had ever sure confidence that Yahuah (God) would help him* (2 Maccabees 15:7), bidding his people *to remember the help which in former times they had received from heaven* (2 Maccabees 15:8). The deliverance is heaven''s, and the praise returns there: *So every man praised toward the heaven the glorious Yahuah (God), saying, Blessed be he that has kept his own place undefiled* (2 Maccabees 15:34). Not the arm of Rome but the help from above brings the enemy under foot.',
       sv.verse_id, ev.verse_id, 'extras', 61778
  FROM _session253_1mac12_lookup sv, _session253_1mac12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=12 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-12-snare-of-the-trusting',
       E'Believing him — the snare of the trusting',
       E'Tryphon cannot break Jonathan in the field, so he breaks him with a kiss of friendship: he *received him honourably, and commended him to all his friends, and gave him gifts* (1 Maccabees 12:43), then said, *seeing there is no war between us... come you with me to Ptolemais, for I will give it you* (1 Maccabees 12:44-45). *So Jonathan believing him did as he told him, and sent away his host* (1 Maccabees 12:46) — and was taken. It ain''t new — this is the oldest grief of the righteous, the table-friend who turns: *Yea, mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me* (Psalm 41:9). The Messiah will name that same psalm over His own betrayer: *He that eateth bread with me hath lifted up his heel against me* (John 13:18). And the swordless treachery wears a fair face: *When he speaketh fair, believe him not: for there are seven abominations in his heart* (Proverbs 26:25).',
       sv.verse_id, ev.verse_id, 'extras', 61781
  FROM _session253_1mac12_lookup sv, _session253_1mac12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=43
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=12 AND ev.verse_number=48
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-12-lamentation-no-captain',
       E'All Israel made great lamentation — no captain to help',
       E'With Jonathan taken, the heathen smell a leaderless flock: *all Yashar''el (Israel) made great lamentation* (1 Maccabees 12:52), and the nations round about say, *They have no captain, nor any to help them: now therefore let us make war upon them, and take away their memorial from among men* (1 Maccabees 12:53). It ain''t new — the cry that goes up is the cry of Psalm 41, the shepherdless people whose enemies wait for the name to perish: *Mine enemies speak evil of me, When shall he die, and his name perish?* (Psalm 41:5). Yet the same psalm answers the threat to take away their memorial: *Yahuah (LORD) will preserve him, and keep him alive; and he shall be blessed upon the earth: and thou wilt not deliver him unto the will of his enemies* (Psalm 41:2). The captain falls, but the help is from heaven (1 Maccabees 12:15) — and the seed of Abraham is not blotted out from among men.',
       sv.verse_id, ev.verse_id, 'extras', 61784
  FROM _session253_1mac12_lookup sv, _session253_1mac12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=52
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=12 AND ev.verse_number=53
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-maccabees-12-stock-of-abraham
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* The stock of Abraham the Spartans claim in 1 Maccabees 12:21 is the innumerable seed Yahuah promised to grow until it filled the nations.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac12_lookup sv, _session253_1mac12_lookup tv
 WHERE t.slug='1-maccabees-12-stock-of-abraham'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 17:5 — *Neither shall thy name any more be called Abram, but thy name shall be Abraham; for a father of many nations have I made thee.* Abraham being made a father of many nations is the writing that lets a far people in 1 Maccabees 12:21 still be reckoned brothers of the Yahudim.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac12_lookup sv, _session253_1mac12_lookup tv
 WHERE t.slug='1-maccabees-12-stock-of-abraham'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 17:7 — *And I will establish my covenant between me and thee and thy seed after thee in their generations for an everlasting covenant, to be a Elohim (God) unto thee, and to thy seed after thee.* The everlasting covenant to Abraham''s seed is the deeper league standing under the friendship renewed in 1 Maccabees 12:21.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac12_lookup sv, _session253_1mac12_lookup tv
 WHERE t.slug='1-maccabees-12-stock-of-abraham'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Maccabees 1:2 — *Yahuah (God) be gracious to you, and remember his covenant that he made with Abraham, Isaac, and Jacob, his faithful servants;* The brotherhood greeting Jonathan sends in 1 Maccabees 12:6 leans on the same covenant of the fathers that frames the Jerusalem brethren''s letter to their kin.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac12_lookup sv, _session253_1mac12_lookup tv
 WHERE t.slug='1-maccabees-12-stock-of-abraham'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-12-help-from-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Maccabees 15:7 — *But Maccabeus had ever sure confidence that Yahuah (God) would help him:* The help from heaven Jonathan names in 1 Maccabees 12:15 is the same sure confidence in which his brother house fought, trusting deliverance to come from above.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac12_lookup sv, _session253_1mac12_lookup tv
 WHERE t.slug='1-maccabees-12-help-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=15 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Maccabees 15:8 — *Wherefore he exhorted his people not to fear the coming of the heathen against them, but to remember the help which in former times they had received from heaven, and now to expect the victory and aid, which should come to them from the Almighty.* The help from heaven that succoureth in 1 Maccabees 12:15 is exactly the remembered aid the Maccabees set against the dread of the heathen.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac12_lookup sv, _session253_1mac12_lookup tv
 WHERE t.slug='1-maccabees-12-help-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=15 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Maccabees 15:34 — *So every man praised toward the heaven the glorious Yahuah (God), saying, Blessed be he that has kept his own place undefiled.* Where 1 Maccabees 12:9 finds comfort in the holy books and heaven''s aid, the deliverance ends in praise lifted toward the same heaven that keeps its own place undefiled.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac12_lookup sv, _session253_1mac12_lookup tv
 WHERE t.slug='1-maccabees-12-help-from-heaven'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=15 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-12-snare-of-the-trusting
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 41:9 — *Yea, mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me.* Jonathan believing Tryphon and being taken in 1 Maccabees 12:46 is the ancient wound of the trusting betrayed by the friend who shared his table.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac12_lookup sv, _session253_1mac12_lookup tv
 WHERE t.slug='1-maccabees-12-snare-of-the-trusting'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=41 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 13:18 — *I speak not of you all: I know whom I have chosen: but that the scripture may be fulfilled, He that eateth bread with me hath lifted up his heel against me.* The honour and gifts with which Tryphon masks his snare in 1 Maccabees 12:43 foreshadow the betrayal-by-friendship the Messiah names at His own table.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac12_lookup sv, _session253_1mac12_lookup tv
 WHERE t.slug='1-maccabees-12-snare-of-the-trusting'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=13 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 26:25 — *When he speaketh fair, believe him not: for there are seven abominations in his heart.* Tryphon''s fair words in 1 Maccabees 12:44 — there is no war between us — are the smooth speech the proverb warns hides a heart full of hidden malice.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac12_lookup sv, _session253_1mac12_lookup tv
 WHERE t.slug='1-maccabees-12-snare-of-the-trusting'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=26 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 12:10 — *Never trust your enemy: for like as iron rusteth, so is his wickedness.* Jonathan trusting and disarming himself in 1 Maccabees 12:46 is the very thing the wisdom of Sirach forbids — the enemy''s wickedness only waits, like rust, for its hour.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac12_lookup sv, _session253_1mac12_lookup tv
 WHERE t.slug='1-maccabees-12-snare-of-the-trusting'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=46
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=12 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-12-lamentation-no-captain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 41:5 — *Mine enemies speak evil of me, When shall he die, and his name perish?* The heathen plotting in 1 Maccabees 12:53 to take away Israel''s memorial speak the very wish of the psalmist''s foes — that the righteous die and his name be blotted out.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac12_lookup sv, _session253_1mac12_lookup tv
 WHERE t.slug='1-maccabees-12-lamentation-no-captain'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=53
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=41 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 41:2 — *Yahuah (LORD) will preserve him, and keep him alive; and he shall be blessed upon the earth: and thou wilt not deliver him unto the will of his enemies.* Against all Israel''s lamentation in 1 Maccabees 12:52, the psalm answers that Yahuah will not give the trusting over to the will of their enemies.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac12_lookup sv, _session253_1mac12_lookup tv
 WHERE t.slug='1-maccabees-12-lamentation-no-captain'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=12 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=41 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

