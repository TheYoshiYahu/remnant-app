-- ----- fragment: minion_ecclesiasticus_12.sql (session253 ecclesiasticus 12) -----
-- Source anchor: apocrypha/ecclesiasticus ch12. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir12 (view _session253_sir12_lookup). Sort band base 58575, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-12-do-good-to-the-worthy
  ('apocrypha', 'ecclesiasticus', 12, 1, 'canon', 'proverbs', 25, 21, 'free', E'Proverbs 25:21 — *If thine enemy be hungry, give him bread to eat; and if he be thirsty, give him water to drink:* the Tanakh root of beneficence that Sirach 12:1 frames with discernment of the recipient.'),
  ('apocrypha', 'ecclesiasticus', 12, 2, 'canon', 'matthew', 5, 44, 'free', E'Matthew 5:44 — *But I say unto you, Love your enemies, bless them that curse you, do good to them that hate you, and pray for them which despitefully use you, and persecute you;* the Sermon presses doing-good outward to the enemy where Sirach 12:2 anchors the recompence in the Most High.'),
  ('apocrypha', 'ecclesiasticus', 12, 4, 'canon', 'romans', 12, 20, 'free', E'Romans 12:20 — *Therefore if thine enemy hunger, feed him; if he thirst, give him drink: for in so doing thou shalt heap coals of fire on his head.* Sha''ul commands feeding the enemy; Sirach 12:4 is the guarded counterpart, ''Give to the godly man, and help not a sinner.'''),
  ('apocrypha', 'ecclesiasticus', 12, 6, 'apocrypha', 'ecclesiasticus', 6, 7, 'extras', E'Ecclesiasticus 6:7 — *If you would get a friend, prove him first and be not hasty to credit him.* the same wisdom prudence ben Sira applies to charity in Sirach 12:6, that the Most High repays the ungodly, calls for proving a man before trusting him.'),
  -- thread: ecclesiasticus-12-never-trust-thine-enemy
  ('apocrypha', 'ecclesiasticus', 12, 16, 'canon', 'proverbs', 26, 24, 'free', E'Proverbs 26:24 — *He that hateth dissembleth with his lips, and layeth up deceit within him;* the exact portrait of Sirach 12:16''s enemy who speaks sweetly while imagining the pit.'),
  ('apocrypha', 'ecclesiasticus', 12, 11, 'canon', 'proverbs', 26, 25, 'free', E'Proverbs 26:25 — *When he speaketh fair, believe him not: for there are seven abominations in his heart.* answers Sirach 12:11''s warning that the crouching, humbled enemy''s rust ''has not been altogether wiped away.'''),
  ('apocrypha', 'ecclesiasticus', 12, 10, 'canon', 'proverbs', 27, 6, 'free', E'Proverbs 27:6 — *Faithful are the wounds of a friend; but the kisses of an enemy are deceitful.* the proverbial blade behind Sirach 12:10''s ''Never trust your enemy: for like as iron rusteth, so is his wickedness.'''),
  ('apocrypha', 'ecclesiasticus', 12, 12, 'canon', 'micah', 7, 5, 'free', E'Micah 7:5 — *Trust ye not in a friend, put ye not confidence in a guide: keep the doors of thy mouth from her that lieth in thy bosom.* the prophet''s last-days discernment matching Sirach 12:12''s caution not to seat the enemy at your right hand.'),
  -- thread: ecclesiasticus-12-the-feigned-friend-lifts-the-heel
  ('apocrypha', 'ecclesiasticus', 12, 9, 'canon', 'psalms', 41, 9, 'free', E'Psalm 41:9 — *Yea, mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me.* David''s table-betrayer is the archetype of Sirach 12:9''s friend who departs in the day of adversity.'),
  ('apocrypha', 'ecclesiasticus', 12, 17, 'canon', 'matthew', 26, 49, 'free', E'Matthew 26:49 — *And forthwith he came to Yahusha (Jesus), and said, Hail, master; and kissed him.* the feigned friend of Sirach 12:17 who ''pretends to help'' yet undermines, fulfilled in the betrayer''s kiss.'),
  ('apocrypha', 'ecclesiasticus', 12, 15, 'apocrypha', 'ecclesiasticus', 6, 8, 'extras', E'Ecclesiasticus 6:8 — *For some man is a friend for his own occasion, and will not abide in the day of your trouble.* ben Sira''s own friendship-pack naming the companion of Sirach 12:15 who will not tarry once you begin to fall.'),
  ('apocrypha', 'ecclesiasticus', 12, 8, 'apocrypha', 'ecclesiasticus', 6, 10, 'extras', E'Ecclesiasticus 6:10 — *Again, some friend is a companion at the table, and will not continue in the day of your affliction.* the table-friend exposed by adversity, the very test Sirach 12:8 sets for knowing friend from enemy.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-12-do-good-to-the-worthy',
       E'Do good — and to whom: the wisdom of discerning charity',
       E'Ben Sira opens with a wisdom counsel on charity: *When you will do good know to whom you do it; so shall you be thanked for your benefits* (Ecclesiasticus 12:1), *Do good to the godly man, and you shall find a recompence; and if not from him, yet from the Most High* (Ecclesiasticus 12:2). This is the Proverbs ethic of the open hand turned toward the worthy — *Give to the godly man, and help not a sinner* (Ecclesiasticus 12:4). The Sermon on the Mount pushes the same root deeper toward the enemy: *But I say unto you, Love your enemies, bless them that curse you, do good to them that hate you, and pray for them which despitefully use you, and persecute you;* (Matthew 5:44). And the Tanakh already carried the coal: *If thine enemy be hungry, give him bread to eat; and if he be thirsty, give him water to drink:* (Proverbs 25:21), which Sha''ul gathers up — *Therefore if thine enemy hunger, feed him; if he thirst, give him drink: for in so doing thou shalt heap coals of fire on his head.* (Romans 12:20). It ain''t new: Sirach is the same covenant ethic, only more guarded — where the Tanakh and the NT press feeding the enemy, ben Sira warns that kindness to the unrepentant sinner can return as harm, *lest you shall receive twice as much evil for all the good you shall have done to him*. The same wisdom stream, weighing mercy against discernment.',
       sv.verse_id, ev.verse_id, 'extras', 58575
  FROM _session253_sir12_lookup sv, _session253_sir12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=12 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-12-never-trust-thine-enemy',
       E'Never trust thine enemy, though he speak fair',
       E'The chapter turns to the heart of its warning: *Never trust your enemy: for like as iron rusteth, so is his wickedness* (Ecclesiasticus 12:10), *Though he humble himself, and go crouching, yet take good heed and beware of him... you shall know that his rust has not been altogether wiped away* (Ecclesiasticus 12:11). The smooth speech hides the pit: *An enemy speaks sweetly with his lips, but in his heart he imagineth how to throw you into a pit* (Ecclesiasticus 12:16). This is pure Proverbs: *He that hateth dissembleth with his lips, and layeth up deceit within him;* (Proverbs 26:24), *When he speaketh fair, believe him not: for there are seven abominations in his heart.* (Proverbs 26:25), *Whose hatred is covered by deceit, his wickedness shall be shewed before the whole congregation.* (Proverbs 26:26) — and the famous *Faithful are the wounds of a friend; but the kisses of an enemy are deceitful.* (Proverbs 27:6). The prophet Micah carries the same hard discernment into the last-days remnant: *Trust ye not in a friend, put ye not confidence in a guide: keep the doors of thy mouth from her that lieth in thy bosom.* (Micah 7:5). It ain''t new — Sirach''s ''beware the crouching enemy'' is the wisdom tradition''s settled testimony that fair words conceal a covered heart.',
       sv.verse_id, ev.verse_id, 'extras', 58578
  FROM _session253_sir12_lookup sv, _session253_sir12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=12 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=12 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-12-the-feigned-friend-lifts-the-heel',
       E'The feigned friend who departs in adversity and lifts up the heel',
       E'Ben Sira measures friendship by the day of trouble: *A friend cannot be known in prosperity: and an enemy cannot be hidden in adversity* (Ecclesiasticus 12:8), *In the prosperity of a man enemies will be grieved: but in his adversity even a friend will depart* (Ecclesiasticus 12:9), and *For a while he will abide with you, but if you begin to fall, he will not tarry* (Ecclesiasticus 12:15). The feigned helper turns saboteur — *though he pretend to help you, yet shall he undermine you* (Ecclesiasticus 12:17). This is David''s lament over the betrayer at his own table: *Yea, mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me.* (Psalm 41:9) — the very word Yahusha sealed at the Last Supper, fulfilled in the kiss: *And forthwith he came to Yahusha (Jesus), and said, Hail, master; and kissed him.* (Matthew 26:49). Ben Sira''s own wisdom-pack on friendship names the same false companion: *For some man is a friend for his own occasion, and will not abide in the day of your trouble* (Ecclesiasticus 6:8), *some friend is a companion at the table, and will not continue in the day of your affliction* (Ecclesiasticus 6:10). It ain''t new: the table-fellow who lifts the heel runs from the Psalter through ben Sira to the betrayal of the Messiah.',
       sv.verse_id, ev.verse_id, 'extras', 58581
  FROM _session253_sir12_lookup sv, _session253_sir12_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=12 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=12 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-12-do-good-to-the-worthy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 25:21 — *If thine enemy be hungry, give him bread to eat; and if he be thirsty, give him water to drink:* the Tanakh root of beneficence that Sirach 12:1 frames with discernment of the recipient.'
  FROM cross_reference_threads t, cross_references x, _session253_sir12_lookup sv, _session253_sir12_lookup tv
 WHERE t.slug='ecclesiasticus-12-do-good-to-the-worthy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=25 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 5:44 — *But I say unto you, Love your enemies, bless them that curse you, do good to them that hate you, and pray for them which despitefully use you, and persecute you;* the Sermon presses doing-good outward to the enemy where Sirach 12:2 anchors the recompence in the Most High.'
  FROM cross_reference_threads t, cross_references x, _session253_sir12_lookup sv, _session253_sir12_lookup tv
 WHERE t.slug='ecclesiasticus-12-do-good-to-the-worthy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=12 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 12:20 — *Therefore if thine enemy hunger, feed him; if he thirst, give him drink: for in so doing thou shalt heap coals of fire on his head.* Sha''ul commands feeding the enemy; Sirach 12:4 is the guarded counterpart, ''Give to the godly man, and help not a sinner.'''
  FROM cross_reference_threads t, cross_references x, _session253_sir12_lookup sv, _session253_sir12_lookup tv
 WHERE t.slug='ecclesiasticus-12-do-good-to-the-worthy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=12 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 6:7 — *If you would get a friend, prove him first and be not hasty to credit him.* the same wisdom prudence ben Sira applies to charity in Sirach 12:6, that the Most High repays the ungodly, calls for proving a man before trusting him.'
  FROM cross_reference_threads t, cross_references x, _session253_sir12_lookup sv, _session253_sir12_lookup tv
 WHERE t.slug='ecclesiasticus-12-do-good-to-the-worthy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-12-never-trust-thine-enemy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 26:24 — *He that hateth dissembleth with his lips, and layeth up deceit within him;* the exact portrait of Sirach 12:16''s enemy who speaks sweetly while imagining the pit.'
  FROM cross_reference_threads t, cross_references x, _session253_sir12_lookup sv, _session253_sir12_lookup tv
 WHERE t.slug='ecclesiasticus-12-never-trust-thine-enemy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=12 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=26 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 26:25 — *When he speaketh fair, believe him not: for there are seven abominations in his heart.* answers Sirach 12:11''s warning that the crouching, humbled enemy''s rust ''has not been altogether wiped away.'''
  FROM cross_reference_threads t, cross_references x, _session253_sir12_lookup sv, _session253_sir12_lookup tv
 WHERE t.slug='ecclesiasticus-12-never-trust-thine-enemy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=12 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=26 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 27:6 — *Faithful are the wounds of a friend; but the kisses of an enemy are deceitful.* the proverbial blade behind Sirach 12:10''s ''Never trust your enemy: for like as iron rusteth, so is his wickedness.'''
  FROM cross_reference_threads t, cross_references x, _session253_sir12_lookup sv, _session253_sir12_lookup tv
 WHERE t.slug='ecclesiasticus-12-never-trust-thine-enemy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=12 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=27 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Micah 7:5 — *Trust ye not in a friend, put ye not confidence in a guide: keep the doors of thy mouth from her that lieth in thy bosom.* the prophet''s last-days discernment matching Sirach 12:12''s caution not to seat the enemy at your right hand.'
  FROM cross_reference_threads t, cross_references x, _session253_sir12_lookup sv, _session253_sir12_lookup tv
 WHERE t.slug='ecclesiasticus-12-never-trust-thine-enemy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=12 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=7 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-12-the-feigned-friend-lifts-the-heel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 41:9 — *Yea, mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me.* David''s table-betrayer is the archetype of Sirach 12:9''s friend who departs in the day of adversity.'
  FROM cross_reference_threads t, cross_references x, _session253_sir12_lookup sv, _session253_sir12_lookup tv
 WHERE t.slug='ecclesiasticus-12-the-feigned-friend-lifts-the-heel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=12 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=41 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 26:49 — *And forthwith he came to Yahusha (Jesus), and said, Hail, master; and kissed him.* the feigned friend of Sirach 12:17 who ''pretends to help'' yet undermines, fulfilled in the betrayer''s kiss.'
  FROM cross_reference_threads t, cross_references x, _session253_sir12_lookup sv, _session253_sir12_lookup tv
 WHERE t.slug='ecclesiasticus-12-the-feigned-friend-lifts-the-heel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=12 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=49
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 6:8 — *For some man is a friend for his own occasion, and will not abide in the day of your trouble.* ben Sira''s own friendship-pack naming the companion of Sirach 12:15 who will not tarry once you begin to fall.'
  FROM cross_reference_threads t, cross_references x, _session253_sir12_lookup sv, _session253_sir12_lookup tv
 WHERE t.slug='ecclesiasticus-12-the-feigned-friend-lifts-the-heel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=12 AND sv.verse_number=15
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 6:10 — *Again, some friend is a companion at the table, and will not continue in the day of your affliction.* the table-friend exposed by adversity, the very test Sirach 12:8 sets for knowing friend from enemy.'
  FROM cross_reference_threads t, cross_references x, _session253_sir12_lookup sv, _session253_sir12_lookup tv
 WHERE t.slug='ecclesiasticus-12-the-feigned-friend-lifts-the-heel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=12 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

