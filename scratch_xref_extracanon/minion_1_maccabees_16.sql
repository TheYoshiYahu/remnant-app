-- ----- fragment: minion_1maccabees_16.sql (session253 1-maccabees 16) -----
-- Source anchor: apocrypha/1-maccabees ch16. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1mac16 (view _session253_1mac16_lookup). Sort band base 61875, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1mac16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-maccabees-16-be-strong-charge
  ('apocrypha', '1-maccabees', 16, 3, 'canon', 'deuteronomy', 31, 6, 'free', E'Deuteronomy 31:6 — *Be strong and of a good courage, fear not, nor be afraid of them: for Yahuah Elohayka (the LORD thy God), he it is that doth go with thee; he will not fail thee, nor forsake thee.* As aged Simon sends his sons out with *the help from heaven*, it is Moses'' own charge — the fight is the LORD''s, who does not fail the next generation.'),
  ('apocrypha', '1-maccabees', 16, 3, 'canon', 'deuteronomy', 31, 7, 'free', E'Deuteronomy 31:7 — *And Moses called unto Joshua, and said unto him in the sight of all Yashar''el (Israel), Be strong and of a good courage: for thou must go with this people unto the land which Yahuah (LORD) hath sworn unto their fathers to give them; and thou shalt cause them to inherit it.* Simon handing the war to Judas and John echoes Moses charging Joshua — the covenant commission passes from the dying captain to the young.'),
  ('apocrypha', '1-maccabees', 16, 2, 'canon', 'deuteronomy', 31, 23, 'free', E'Deuteronomy 31:23 — *And he gave Joshua the son of Nun a charge, and said, Be strong and of a good courage: for thou shalt bring the children of Yashar''el (Israel) into the land which I sware unto them: and I will be with thee.* Simon''s recital of *my father''s house* that *delivered Yashar''el (Israel) often* is the same chain of deliverance entrusted, generation to generation, with the promise *I will be with thee*.'),
  -- thread: 1-maccabees-16-holy-trumpets
  ('apocrypha', '1-maccabees', 16, 8, 'canon', 'numbers', 10, 9, 'free', E'Numbers 10:9 — *And if ye go to war in your land against the enemy that oppresseth you, then ye shall blow an alarm with the trumpets; and ye shall be remembered before Yahuah Elohaychem (the LORD your God), and ye shall be saved from your enemies.* The *holy trumpets* that put Cendebeus to flight are this very Torah ordinance — sounded, the host is remembered before the LORD and saved.'),
  ('apocrypha', '1-maccabees', 16, 8, 'canon', 'numbers', 10, 8, 'free', E'Numbers 10:8 — *And the sons of Aaron, the priests, shall blow with the trumpets; and they shall be to you for an ordinance for ever throughout your generations.* The trumpets are called *holy* because they are the priests'' ordinance for ever — the Maccabean priest-house wages even its wars within the worship of the Torah.'),
  -- thread: 1-maccabees-16-feast-of-betrayal
  ('apocrypha', '1-maccabees', 16, 16, 'canon', 'psalms', 41, 9, 'free', E'Psalm 41:9 — *Yea, mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me.* Ptolemee was Simon''s son-in-law who *made them a great banquet* before he slew them — the familiar friend who shares the bread and then lifts the heel.'),
  ('apocrypha', '1-maccabees', 16, 16, 'canon', '2-samuel', 20, 9, 'free', E'2 Samuel 20:9 — *And Joab said to Amasa, Art thou in health, my brother? And Joab took Amasa by the beard with the right hand to kiss him.* As Joab drew his kinsman near with a brother''s greeting to kill him, Ptolemee received Simon and his sons *deceitfully* with a banquet before the weapons rose.'),
  ('apocrypha', '1-maccabees', 16, 16, 'canon', '2-samuel', 20, 10, 'free', E'2 Samuel 20:10 — *But Amasa took no heed to the sword that was in Joab''s hand: so he smote him therewith in the fifth rib, and shed out his bowels to the ground, and struck him not again; and he died. So Joab and Abishai his brother pursued after Sheba the son of Bichri.* The hidden sword struck Amasa unawares at the greeting, as the hidden men *rose up, and took their weapons* upon Simon when he had drunk largely.'),
  ('apocrypha', '1-maccabees', 16, 17, 'canon', 'john', 13, 18, 'free', E'John 13:18 — *I speak not of you all: I know whom I have chosen: but that the scripture may be fulfilled, He that eateth bread with me hath lifted up his heel against me.* At His own table the Messiah names the table-treachery of Psalm 41 — the same betrayal-by-banquet by which Ptolemee committed *a great treachery* against Simon.'),
  ('apocrypha', '1-maccabees', 16, 17, 'canon', 'romans', 12, 17, 'free', E'Romans 12:17 — *Recompense to no man evil for evil. Provide things honest in the sight of all men.* The verdict on Ptolemee is its exact inversion — he *recompensed evil for good*, the very thing the covenant people are forbidden to do.'),
  -- thread: 1-maccabees-16-john-hyrcanus-chronicles
  ('apocrypha', '1-maccabees', 16, 23, 'canon', '1-kings', 11, 41, 'free', E'1 Kings 11:41 — *And the rest of the acts of Solomon, and all that he did, and his wisdom, are they not written in the book of the acts of Solomon?* The closing line on John — *the rest of the acts of John... are written in the chronicles of his priesthood* — is the same annalist''s cadence by which the canon seals the record of its leaders.'),
  ('apocrypha', '1-maccabees', 16, 24, 'canon', 'deuteronomy', 31, 7, 'free', E'Deuteronomy 31:7 — *And Moses called unto Joshua, and said unto him in the sight of all Yashar''el (Israel), Be strong and of a good courage: for thou must go with this people unto the land which Yahuah (LORD) hath sworn unto their fathers to give them; and thou shalt cause them to inherit it.* John made high priest *after his father* is the Torah handing-on of office — the line kept unbroken from Mattathias'' house through the treachery to the next high priest.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1mac16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1mac16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-16-be-strong-charge',
       E'Be Strong: The Old Captain Hands the War to His Sons',
       E'Simon, last of the warring brothers, lays the charge upon Judas and John: *I, and my brothers, and my father''s house, have ever from my youth to this day fought against the enemies of Yashar''el (Israel); and things have prospered so well in our hands, that we have delivered Yashar''el (Israel) often* (1 Maccabees 16:2). *But now I am old, and you, by the mercy of Yahuah (God), are of a sufficient age: be you instead of me and my brother, and go and fight for our nation, and the help from heaven be with you* (1 Maccabees 16:3). It ain''t new — this is the Torah handing-on of the covenant fight from one generation to the next. Moses, at the end, gives the same charge to the people and to his successor: *Be strong and of a good courage, fear not, nor be afraid of them: for Yahuah Elohayka (the LORD thy God), he it is that doth go with thee; he will not fail thee, nor forsake thee* (Deuteronomy 31:6). And to Joshua by name: *Be strong and of a good courage: for thou must go with this people unto the land which Yahuah (LORD) hath sworn unto their fathers to give them; and thou shalt cause them to inherit it* (Deuteronomy 31:7). The seed is kept not by a dynasty''s strength but by the help from heaven passed down the line.',
       sv.verse_id, ev.verse_id, 'extras', 61875
  FROM _session253_1mac16_lookup sv, _session253_1mac16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=16 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=16 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-16-holy-trumpets',
       E'The Holy Trumpets and the Help From Heaven',
       E'Outnumbered by the enemy''s horsemen, Simon''s sons sound the alarm: *Then sounded they with the holy trumpets: whereupon Cendebeus and his host were put to flight, so that many of them were slain, and the remnant got them to the strong hold* (1 Maccabees 16:8). It ain''t new — these are the silver trumpets of the Torah, the ordinance that turns a battle into a remembrance before Yahuah: *And if ye go to war in your land against the enemy that oppresseth you, then ye shall blow an alarm with the trumpets; and ye shall be remembered before Yahuah Elohaychem (the LORD your God), and ye shall be saved from your enemies* (Numbers 10:9). They are *holy* trumpets because only the priesthood may sound them: *And the sons of Aaron, the priests, shall blow with the trumpets; and they shall be to you for an ordinance for ever throughout your generations* (Numbers 10:8). The rout of Cendebeus is no chance of war but the covenant ordinance answered from heaven.',
       sv.verse_id, ev.verse_id, 'extras', 61878
  FROM _session253_1mac16_lookup sv, _session253_1mac16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=16 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=16 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-16-feast-of-betrayal',
       E'The Feast of Betrayal: Evil for Good at the Banquet',
       E'Simon''s own son-in-law Ptolemee plots his death, and chooses a feast for the deed: *Where the son of Abubus receiving them deceitfully into a little hold, called Docus, which he had built, made them a great banquet: howbeit he had hid men there* (1 Maccabees 16:15). *So when Simon and his sons had drunk largely, Ptolemee and his men rose up, and took their weapons, and came upon Simon into the banqueting place, and slew him, and his two sons, and certain of his servants* (1 Maccabees 16:16). *In which doing he committed a great treachery, and recompensed evil for good* (1 Maccabees 16:17). It ain''t new — the bread-and-table betrayal is the oldest treachery in the covenant. David sang it: *Yea, mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me* (Psalm 41:9). Joab worked it with a kinsman''s greeting: *And Joab said to Amasa, Art thou in health, my brother? And Joab took Amasa by the beard with the right hand to kiss him* (2 Samuel 20:9) — *But Amasa took no heed to the sword that was in Joab''s hand: so he smote him therewith in the fifth rib, and shed out his bowels to the ground* (2 Samuel 20:10). And the Messiah, at His own table, took that same Psalm onto His lips of Judas: *I speak not of you all: I know whom I have chosen: but that the scripture may be fulfilled, He that eateth bread with me hath lifted up his heel against me* (John 13:18). Over against the treachery stands the covenant way the apostle commands: *Recompense to no man evil for evil. Provide things honest in the sight of all men* (Romans 12:17) — Ptolemee did the opposite, and *recompensed evil for good*.',
       sv.verse_id, ev.verse_id, 'extras', 61881
  FROM _session253_1mac16_lookup sv, _session253_1mac16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=16 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=16 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-16-john-hyrcanus-chronicles',
       E'The Rest of the Acts: The Priesthood Passes and the Book Closes',
       E'Warned in time, John escapes the assassins, and the book ends on the regnal-chronicle formula of the kings of old: *As concerning the rest of the acts of John, and his wars, and worthy deeds which he did, and the building of the walls which he made, and his doings, Behold, these are written in the chronicles of his priesthood, from the time he was made high priest after his father* (1 Maccabees 16:23-24). It ain''t new — this is the very closing cadence the Scriptures use for the deeds of a leader committed to the record: *And the rest of the acts of Solomon, and all that he did, and his wisdom, are they not written in the book of the acts of Solomon?* (1 Kings 11:41). And the priesthood passing *after his father* is the Torah succession of office — *And Moses called unto Joshua... Be strong and of a good courage: for thou must go with this people unto the land which Yahuah (LORD) hath sworn unto their fathers* (Deuteronomy 31:7). The Maccabean witness closes the way the canon closes its annals — the office handed on, the deeds kept in the chronicles, the covenant line unbroken.',
       sv.verse_id, ev.verse_id, 'extras', 61884
  FROM _session253_1mac16_lookup sv, _session253_1mac16_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=16 AND sv.verse_number=23
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=16 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-maccabees-16-be-strong-charge
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 31:6 — *Be strong and of a good courage, fear not, nor be afraid of them: for Yahuah Elohayka (the LORD thy God), he it is that doth go with thee; he will not fail thee, nor forsake thee.* As aged Simon sends his sons out with *the help from heaven*, it is Moses'' own charge — the fight is the LORD''s, who does not fail the next generation.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac16_lookup sv, _session253_1mac16_lookup tv
 WHERE t.slug='1-maccabees-16-be-strong-charge'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 31:7 — *And Moses called unto Joshua, and said unto him in the sight of all Yashar''el (Israel), Be strong and of a good courage: for thou must go with this people unto the land which Yahuah (LORD) hath sworn unto their fathers to give them; and thou shalt cause them to inherit it.* Simon handing the war to Judas and John echoes Moses charging Joshua — the covenant commission passes from the dying captain to the young.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac16_lookup sv, _session253_1mac16_lookup tv
 WHERE t.slug='1-maccabees-16-be-strong-charge'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 31:23 — *And he gave Joshua the son of Nun a charge, and said, Be strong and of a good courage: for thou shalt bring the children of Yashar''el (Israel) into the land which I sware unto them: and I will be with thee.* Simon''s recital of *my father''s house* that *delivered Yashar''el (Israel) often* is the same chain of deliverance entrusted, generation to generation, with the promise *I will be with thee*.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac16_lookup sv, _session253_1mac16_lookup tv
 WHERE t.slug='1-maccabees-16-be-strong-charge'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=16 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-16-holy-trumpets
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 10:9 — *And if ye go to war in your land against the enemy that oppresseth you, then ye shall blow an alarm with the trumpets; and ye shall be remembered before Yahuah Elohaychem (the LORD your God), and ye shall be saved from your enemies.* The *holy trumpets* that put Cendebeus to flight are this very Torah ordinance — sounded, the host is remembered before the LORD and saved.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac16_lookup sv, _session253_1mac16_lookup tv
 WHERE t.slug='1-maccabees-16-holy-trumpets'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=16 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=10 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 10:8 — *And the sons of Aaron, the priests, shall blow with the trumpets; and they shall be to you for an ordinance for ever throughout your generations.* The trumpets are called *holy* because they are the priests'' ordinance for ever — the Maccabean priest-house wages even its wars within the worship of the Torah.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac16_lookup sv, _session253_1mac16_lookup tv
 WHERE t.slug='1-maccabees-16-holy-trumpets'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=16 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-16-feast-of-betrayal
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 41:9 — *Yea, mine own familiar friend, in whom I trusted, which did eat of my bread, hath lifted up his heel against me.* Ptolemee was Simon''s son-in-law who *made them a great banquet* before he slew them — the familiar friend who shares the bread and then lifts the heel.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac16_lookup sv, _session253_1mac16_lookup tv
 WHERE t.slug='1-maccabees-16-feast-of-betrayal'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=16 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=41 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Samuel 20:9 — *And Joab said to Amasa, Art thou in health, my brother? And Joab took Amasa by the beard with the right hand to kiss him.* As Joab drew his kinsman near with a brother''s greeting to kill him, Ptolemee received Simon and his sons *deceitfully* with a banquet before the weapons rose.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac16_lookup sv, _session253_1mac16_lookup tv
 WHERE t.slug='1-maccabees-16-feast-of-betrayal'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=16 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=20 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Samuel 20:10 — *But Amasa took no heed to the sword that was in Joab''s hand: so he smote him therewith in the fifth rib, and shed out his bowels to the ground, and struck him not again; and he died. So Joab and Abishai his brother pursued after Sheba the son of Bichri.* The hidden sword struck Amasa unawares at the greeting, as the hidden men *rose up, and took their weapons* upon Simon when he had drunk largely.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac16_lookup sv, _session253_1mac16_lookup tv
 WHERE t.slug='1-maccabees-16-feast-of-betrayal'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=16 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=20 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 13:18 — *I speak not of you all: I know whom I have chosen: but that the scripture may be fulfilled, He that eateth bread with me hath lifted up his heel against me.* At His own table the Messiah names the table-treachery of Psalm 41 — the same betrayal-by-banquet by which Ptolemee committed *a great treachery* against Simon.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac16_lookup sv, _session253_1mac16_lookup tv
 WHERE t.slug='1-maccabees-16-feast-of-betrayal'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=16 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=13 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Romans 12:17 — *Recompense to no man evil for evil. Provide things honest in the sight of all men.* The verdict on Ptolemee is its exact inversion — he *recompensed evil for good*, the very thing the covenant people are forbidden to do.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac16_lookup sv, _session253_1mac16_lookup tv
 WHERE t.slug='1-maccabees-16-feast-of-betrayal'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=16 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-16-john-hyrcanus-chronicles
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Kings 11:41 — *And the rest of the acts of Solomon, and all that he did, and his wisdom, are they not written in the book of the acts of Solomon?* The closing line on John — *the rest of the acts of John... are written in the chronicles of his priesthood* — is the same annalist''s cadence by which the canon seals the record of its leaders.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac16_lookup sv, _session253_1mac16_lookup tv
 WHERE t.slug='1-maccabees-16-john-hyrcanus-chronicles'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=16 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=11 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 31:7 — *And Moses called unto Joshua, and said unto him in the sight of all Yashar''el (Israel), Be strong and of a good courage: for thou must go with this people unto the land which Yahuah (LORD) hath sworn unto their fathers to give them; and thou shalt cause them to inherit it.* John made high priest *after his father* is the Torah handing-on of office — the line kept unbroken from Mattathias'' house through the treachery to the next high priest.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac16_lookup sv, _session253_1mac16_lookup tv
 WHERE t.slug='1-maccabees-16-john-hyrcanus-chronicles'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=16 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

