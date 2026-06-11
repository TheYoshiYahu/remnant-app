-- ----- fragment: minion_jasher_04.sql (session252 jasher 4) -----
-- Source anchor: jasher/jasher ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja04 (view _session252_ja04_lookup). Sort band base 55075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-4-methuselah-reigns
  ('jasher', 'jasher', 4, 1, 'canon', 'genesis', 5, 23, 'free', E'Genesis 5:23 — *And all the days of Enoch were three hundred sixty and five years:* the very count Jasher 4:1 repeats for Enoch upon the earth.'),
  ('jasher', 'jasher', 4, 2, 'canon', 'genesis', 5, 24, 'free', E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The canon''s translation of Enoch is the ascent Jasher 4:2 narrates before Methuselah reigns in his place.'),
  ('jasher', 'jasher', 4, 3, 'canon', 'genesis', 5, 25, 'free', E'Genesis 5:25 — *And Methuselah lived an hundred eighty and seven years, and begat Lamech:* the seed-line Jasher 4:3 keeps as Methuselah, taught by Enoch, walks uprightly and teaches the sons of men.'),
  -- thread: jasher-4-corruption-repented
  ('jasher', 'jasher', 4, 7, 'canon', 'genesis', 6, 5, 'free', E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* The whole-earth wickedness Jasher 4:4-7 details as robbing, plundering and rebellion.'),
  ('jasher', 'jasher', 4, 7, 'canon', 'genesis', 6, 6, 'free', E'Genesis 6:6 — *And it repented Yahuah (LORD) that he had made man on the earth, and it grieved him at his heart.* The very grief Jasher 4:7 names when Yahuah repents that he had made man.'),
  ('jasher', 'jasher', 4, 6, 'canon', 'genesis', 3, 18, 'free', E'Genesis 3:18 — *Thorns also and thistles shall it bring forth to thee; and thou shalt eat the herb of the field;* the Eden curse pressed on the rebel earth as thorns and thistles spring where Jasher 4:6 says they did not sow.'),
  -- thread: jasher-4-seth-dies-seedline
  ('jasher', 'jasher', 4, 10, 'canon', 'genesis', 5, 8, 'free', E'Genesis 5:8 — *And all the days of Seth were nine hundred and twelve years: and he died.* The exact nine hundred and twelve years Jasher 4:10 records for Seth the son of Adam.'),
  ('jasher', 'jasher', 4, 9, 'canon', 'genesis', 5, 28, 'free', E'Genesis 5:28 — *And Lamech lived an hundred eighty and two years, and begat a son:* the Lamech of the chosen line whose age Jasher 4:9 fixes at the death of Seth.'),
  -- thread: jasher-4-noah-born-comfort
  ('jasher', 'jasher', 4, 14, 'canon', 'genesis', 5, 29, 'free', E'Genesis 5:29 — *And he called his name Noah, saying, This same shall comfort us concerning our work and toil of our hands, because of the ground which Yahuah (LORD) hath cursed.* The naming Jasher 4:14 expands into Methuselah''s and Lamech''s twin sayings of rest and comfort.'),
  ('jasher', 'jasher', 4, 15, 'canon', 'genesis', 6, 9, 'free', E'Genesis 6:9 — *These are the generations of Noah: Noah was a just man and perfect in his generations, and Noah walked with Elohim (God).* The perfect and upright walk Jasher 4:15 says Noah grew into in the ways of Methuselah.'),
  ('jasher', 'jasher', 4, 15, 'jubilees', 'jubilees', 5, 19, 'extras', E'Jubilees 5:19 — *...no man''s person was accepted save that of Noah alone; for his person was accepted in behalf of his sons... for his heart was righteous in all his ways...* the same righteous Noah Jasher 4:15 says walked perfect and upright with Elohim while all flesh corrupted.'),
  -- thread: jasher-4-watchers-seedwar
  ('jasher', 'jasher', 4, 18, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The taking of wives by force Jasher 4:18 ascribes to the judges and rulers going to the daughters of men.'),
  ('jasher', 'jasher', 4, 18, 'canon', 'genesis', 6, 11, 'free', E'Genesis 6:11 — *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* The whole-earth corruption of all flesh Jasher 4:18 says Elohim saw upon the earth.'),
  ('jasher', 'jasher', 4, 18, 'enoch', '1-enoch', 6, 2, 'extras', E'1 Enoch 6:2 — *And the angels, the children of the heaven, saw and lusted after them, and said to one another: ''Come, let us choose us wives from among the children of men and beget us children.''* The fallen-ones'' descent Jasher 4:18 narrates as the rulers taking wives by force.'),
  ('jasher', 'jasher', 4, 18, 'enoch', '1-enoch', 8, 2, 'extras', E'1 Enoch 8:2 — *And there arose much godlessness, and they committed fornication, and they were led astray, and became corrupt in all their ways...* the taught corruptions and mixtures Jasher 4:18 says provoked Yahuah and corrupted all flesh.'),
  ('jasher', 'jasher', 4, 18, 'jubilees', 'jubilees', 5, 2, 'extras', E'Jubilees 5:2 — *And lawlessness increased on the earth and all flesh corrupted its way, alike men and cattle and beasts and birds and everything that walks on the earth...* the same mixture of all flesh, men and animals, that Jasher 4:18 says corrupted its ways upon earth.'),
  -- thread: jasher-4-noah-grace-judgment
  ('jasher', 'jasher', 4, 19, 'canon', 'genesis', 6, 7, 'free', E'Genesis 6:7 — *And Yahuah (LORD) said, I will destroy man whom I have created from the face of the earth; both man, and beast, and the creeping thing, and the fowls of the air; for it repenteth me that I have made them.* The blotting-out decree, even to the birds of the air, that Jasher 4:19 records.'),
  ('jasher', 'jasher', 4, 21, 'canon', 'genesis', 6, 8, 'free', E'Genesis 6:8 — *But Noah found grace in the eyes of Yahuah (LORD).* The grace and election Jasher 4:21 expands as Yahuah choosing Noah and his children to raise up seed.'),
  ('jasher', 'jasher', 4, 19, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The judgment on the fallen ones whose corruption Jasher 4 details and Jasher 4:19 brings to the verge of the Flood.'),
  ('jasher', 'jasher', 4, 21, 'canon', '2-peter', 2, 5, 'free', E'2 Peter 2:5 — *And spared not the old world, but saved Noah the eighth person, a preacher of righteousness, bringing in the flood upon the world of the ungodly;* the saving of Noah and the coming flood Jasher 4:20-21 sets up as the righteous die and Noah is chosen.'),
  ('jasher', 'jasher', 4, 21, 'jubilees', 'jubilees', 5, 5, 'extras', E'Jubilees 5:5 — *But Noah found grace before the eyes of Yahuah (God).* The same election of Noah out of the doomed world that Jasher 4:21 declares.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-4-methuselah-reigns',
       E'Enoch translated, Methuselah taught the way',
       E'Jasher opens the chapter on the seed-line: *And all the days that Enoch lived upon earth, were three hundred and sixty-five years* (Jasher 4:1), and *when Enoch had ascended into heaven... they caused him to reign over them in the place of his father* — *Methuselah acted uprightly in the sight of Elohim (God), as his father Enoch had taught him* (Jasher 4:2-3). This is Genesis 5 unfolded: *And all the days of Enoch were three hundred sixty and five years* (Genesis 5:23), *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24). The chosen line is kept and handed on, father to son — Methuselah *begat Lamech* (Genesis 5:25), and Jasher''s self-link Jubilees carries the same generations of the upright fathers. It ain''t new: the canon names the years; Jasher tells us the son walked in them.',
       sv.verse_id, ev.verse_id, 'extras', 55075
  FROM _session252_ja04_lookup sv, _session252_ja04_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=4 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-4-corruption-repented',
       E'The earth corrupted; it repented Yahuah that he had made man',
       E'Now the great corruption: *in the latter days of Methuselah, the sons of men turned from Yahuah (the Lord), they corrupted the earth, they robbed and plundered each other, and they rebelled against Elohim* (Jasher 4:4); they *did not turn from their evil ways... and Yahuah (the Lord) was very wroth, and repented that he had made man* (Jasher 4:7). This is Genesis 6 word for word in its weight: *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually* (Genesis 6:5), *And it repented Yahuah (LORD) that he had made man on the earth, and it grieved him at his heart* (Genesis 6:6). And when Yahuah stops the seed in the ground so that *thorns and thistles were produced which they did not sow* (Jasher 4:6), the curse of Eden is pressed harder upon the rebel earth: *Thorns also and thistles shall it bring forth to thee* (Genesis 3:18). The judgment is announced; the next generation will see the Flood.',
       sv.verse_id, ev.verse_id, 'extras', 55078
  FROM _session252_ja04_lookup sv, _session252_ja04_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=4
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=4 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-4-seth-dies-seedline',
       E'Seth dies — the chosen line measured out',
       E'Jasher marks the death of the firstborn of the elect line: *In those days when Lamech the son of Methuselah was one hundred and sixty years old, Seth the son of Adam died. And all the days that Seth lived, were nine hundred and twelve years, and he died* (Jasher 4:9-10), and *Lamech... took Ashmua, the daughter of Elishaa the son of Enoch his uncle, and she conceived* (Jasher 4:11). This is the book of the generations of Adam still being written: *And all the days of Seth were nine hundred and twelve years: and he died* (Genesis 5:8) — Seth, the appointed seed in place of Abel, the line that runs Adam to Seth to Noah. *And Methuselah lived an hundred eighty and seven years, and begat Lamech* (Genesis 5:25), and *Lamech lived an hundred eighty and two years, and begat a son* (Genesis 5:28). Election precedes confession: the covenant seed is kept and chosen generation by generation.',
       sv.verse_id, ev.verse_id, 'extras', 55081
  FROM _session252_ja04_lookup sv, _session252_ja04_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=9
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=4 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-4-noah-born-comfort',
       E'Noah born — this one shall comfort us',
       E'Into the corrupted earth the chosen seed is born: *the wife of Lamech conceived and bare him a son... And Methuselah called his name Noah, saying, The earth was in his days at rest and free from corruption, and Lamech his father called his name Menachem, saying, This one shall comfort us in our works and miserable toil in the earth, which Elohim had cursed* (Jasher 4:13-14); and *the child grew up... and he went in the ways of his father Methuselah, perfect and upright with Elohim* (Jasher 4:15). The canon gives the naming in one breath: *And he called his name Noah, saying, This same shall comfort us concerning our work and toil of our hands, because of the ground which Yahuah (LORD) hath cursed* (Genesis 5:29). The cursed ground of Jasher 4:6 and the comfort named in Noah are the same hope — and the same Noah of whom the canon will say he *was a just man and perfect in his generations* (Genesis 6:9). The seed-line carries the rest that is coming.',
       sv.verse_id, ev.verse_id, 'extras', 55084
  FROM _session252_ja04_lookup sv, _session252_ja04_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=13
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=4 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-4-watchers-seedwar',
       E'The sons of men, the daughters, and the mixture of all flesh',
       E'Here is the seed-war corruption itself: *their judges and rulers went to the daughters of men and took their wives by force from their husbands according to their choice, and the sons of men in those days took from the cattle of the earth... and taught the mixture of animals of one species with the other, in order therewith to provoke Yahuah (the Lord); and Elohim saw the whole earth and it was corrupt, for all flesh had corrupted its ways upon earth, all men and all animals* (Jasher 4:18). This is Genesis 6 told from the inside: *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2), *There were giants in the earth in those days...* (Genesis 6:4), *The earth also was corrupt before Elohim (God), and the earth was filled with violence* (Genesis 6:11). The now-live self-links speak the same event: the Watchers *saw and lusted after them, and said... let us choose us wives from among the children of men* (1 Enoch 6:2), and Azazel *taught men to make swords... became corrupt in all their ways* (1 Enoch 8:1-2), while Jubilees records *all flesh corrupted its way... and they began to devour each other* (Jubilees 5:2). The mixture and the violence are one corruption — it ain''t new, three witnesses tell it.',
       sv.verse_id, ev.verse_id, 'extras', 55087
  FROM _session252_ja04_lookup sv, _session252_ja04_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=16
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=4 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-4-noah-grace-judgment',
       E'Noah found grace; the judgment declared',
       E'The chapter closes on grace and the coming judgment: *And Yahuah (the Lord) said, I will blot out man that I created from the face of the earth... for I repent that I made them* (Jasher 4:19); the righteous are taken first, *And all men who walked in the ways of Yahuah (the Lord), died in those days, before Yahuah (the Lord) brought the evil upon man* (Jasher 4:20); and then the election stands: *And Noah found grace in the sight of Yahuah (the Lord), and Yahuah (the Lord) chose him and his children to raise up seed from them upon the face of the whole earth* (Jasher 4:21). The canon gives both halves: *And Yahuah (LORD) said, I will destroy man whom I have created from the face of the earth... for it repenteth me that I have made them* (Genesis 6:7) and *But Noah found grace in the eyes of Yahuah (LORD)* (Genesis 6:8). The fallen ones are *reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6), and Yahuah *spared not the old world, but saved Noah the eighth person... bringing in the flood upon the world of the ungodly* (2 Peter 2:5). Jubilees seals it: *But Noah found grace before the eyes of Yahuah (God)* (Jubilees 5:5) — the chosen seed kept through the judgment.',
       sv.verse_id, ev.verse_id, 'extras', 55090
  FROM _session252_ja04_lookup sv, _session252_ja04_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=19
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=4 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-4-methuselah-reigns
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:23 — *And all the days of Enoch were three hundred sixty and five years:* the very count Jasher 4:1 repeats for Enoch upon the earth.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-methuselah-reigns'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The canon''s translation of Enoch is the ascent Jasher 4:2 narrates before Methuselah reigns in his place.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-methuselah-reigns'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 5:25 — *And Methuselah lived an hundred eighty and seven years, and begat Lamech:* the seed-line Jasher 4:3 keeps as Methuselah, taught by Enoch, walks uprightly and teaches the sons of men.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-methuselah-reigns'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-4-corruption-repented
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* The whole-earth wickedness Jasher 4:4-7 details as robbing, plundering and rebellion.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-corruption-repented'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:6 — *And it repented Yahuah (LORD) that he had made man on the earth, and it grieved him at his heart.* The very grief Jasher 4:7 names when Yahuah repents that he had made man.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-corruption-repented'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:18 — *Thorns also and thistles shall it bring forth to thee; and thou shalt eat the herb of the field;* the Eden curse pressed on the rebel earth as thorns and thistles spring where Jasher 4:6 says they did not sow.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-corruption-repented'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-4-seth-dies-seedline
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:8 — *And all the days of Seth were nine hundred and twelve years: and he died.* The exact nine hundred and twelve years Jasher 4:10 records for Seth the son of Adam.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-seth-dies-seedline'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 5:28 — *And Lamech lived an hundred eighty and two years, and begat a son:* the Lamech of the chosen line whose age Jasher 4:9 fixes at the death of Seth.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-seth-dies-seedline'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-4-noah-born-comfort
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:29 — *And he called his name Noah, saying, This same shall comfort us concerning our work and toil of our hands, because of the ground which Yahuah (LORD) hath cursed.* The naming Jasher 4:14 expands into Methuselah''s and Lamech''s twin sayings of rest and comfort.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-noah-born-comfort'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:9 — *These are the generations of Noah: Noah was a just man and perfect in his generations, and Noah walked with Elohim (God).* The perfect and upright walk Jasher 4:15 says Noah grew into in the ways of Methuselah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-noah-born-comfort'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 5:19 — *...no man''s person was accepted save that of Noah alone; for his person was accepted in behalf of his sons... for his heart was righteous in all his ways...* the same righteous Noah Jasher 4:15 says walked perfect and upright with Elohim while all flesh corrupted.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-noah-born-comfort'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=15
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-4-watchers-seedwar
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The taking of wives by force Jasher 4:18 ascribes to the judges and rulers going to the daughters of men.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-watchers-seedwar'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:11 — *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* The whole-earth corruption of all flesh Jasher 4:18 says Elohim saw upon the earth.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-watchers-seedwar'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 6:2 — *And the angels, the children of the heaven, saw and lusted after them, and said to one another: ''Come, let us choose us wives from among the children of men and beget us children.''* The fallen-ones'' descent Jasher 4:18 narrates as the rulers taking wives by force.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-watchers-seedwar'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=18
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 8:2 — *And there arose much godlessness, and they committed fornication, and they were led astray, and became corrupt in all their ways...* the taught corruptions and mixtures Jasher 4:18 says provoked Yahuah and corrupted all flesh.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-watchers-seedwar'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=18
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 5:2 — *And lawlessness increased on the earth and all flesh corrupted its way, alike men and cattle and beasts and birds and everything that walks on the earth...* the same mixture of all flesh, men and animals, that Jasher 4:18 says corrupted its ways upon earth.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-watchers-seedwar'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=18
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-4-noah-grace-judgment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:7 — *And Yahuah (LORD) said, I will destroy man whom I have created from the face of the earth; both man, and beast, and the creeping thing, and the fowls of the air; for it repenteth me that I have made them.* The blotting-out decree, even to the birds of the air, that Jasher 4:19 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-noah-grace-judgment'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:8 — *But Noah found grace in the eyes of Yahuah (LORD).* The grace and election Jasher 4:21 expands as Yahuah choosing Noah and his children to raise up seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-noah-grace-judgment'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The judgment on the fallen ones whose corruption Jasher 4 details and Jasher 4:19 brings to the verge of the Flood.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-noah-grace-judgment'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Peter 2:5 — *And spared not the old world, but saved Noah the eighth person, a preacher of righteousness, bringing in the flood upon the world of the ungodly;* the saving of Noah and the coming flood Jasher 4:20-21 sets up as the righteous die and Noah is chosen.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-noah-grace-judgment'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 5:5 — *But Noah found grace before the eyes of Yahuah (God).* The same election of Noah out of the doomed world that Jasher 4:21 declares.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-noah-grace-judgment'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=21
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

