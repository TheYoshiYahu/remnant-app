-- ----- fragment: minion_jasher_05.sql (session252 jasher 5) -----
-- Source anchor: jasher/jasher ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja05 (view _session252_ja05_lookup). Sort band base 55100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-5-seed-line-fathers-die
  ('jasher', 'jasher', 5, 1, 'canon', 'genesis', 5, 8, 'free', E'Genesis 5:8 — *And all the days of Seth were nine hundred and twelve years: and he died.* Jasher''s dying patriarchs are the same chosen Sethite line Genesis numbers and buries before the flood.'),
  ('jasher', 'jasher', 5, 2, 'canon', 'genesis', 5, 14, 'free', E'Genesis 5:14 — *And all the days of Cainan were nine hundred and ten years: and he died.* Genesis gives Cainan''s exact nine hundred and ten years that Jasher 5:2 repeats.'),
  ('jasher', 'jasher', 5, 4, 'canon', 'genesis', 5, 20, 'free', E'Genesis 5:20 — *And all the days of Jared were nine hundred sixty and two years: and he died.* Jared''s nine hundred sixty-two years in Jasher 5:4 stand verbatim with the canon roll of the seed-line.'),
  ('jasher', 'jasher', 5, 5, 'jubilees', 'jubilees', 5, 19, 'extras', E'Jubilees 5:19 — *And as for all those who corrupted their ways and their thoughts before the flood, no man''s person was accepted save that of Noah alone; for his person was accepted in behalf of his sons, whom Elohim (God) saved from the waters of the flood on his account...* The fathers who followed Yahuah die out (Jasher 5:5), leaving Noah alone as the accepted remnant.'),
  -- thread: jasher-5-hundred-twenty-years-warning
  ('jasher', 'jasher', 5, 8, 'canon', 'genesis', 6, 3, 'free', E'Genesis 6:3 — *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years.* Jasher 5:8 unfolds this same hundred and twenty year reprieve as a spoken call to repent.'),
  ('jasher', 'jasher', 5, 9, 'canon', '2-peter', 2, 5, 'free', E'2 Peter 2:5 — *And spared not the old world, but saved Noah the eighth person, a preacher of righteousness, bringing in the flood upon the world of the ungodly.* The apostle names the preaching office Jasher 5:9 shows Noah and Methuselah filling day after day.'),
  ('jasher', 'jasher', 5, 8, 'jubilees', 'jubilees', 5, 8, 'extras', E'Jubilees 5:8 — *And He said "Your spirit will not always abide on man; for they also are flesh and their days shall be one hundred and twenty years."* The same hundred and twenty year decree against corrupted flesh stands in the live Jubilees apparatus beside Jasher 5:8.'),
  -- thread: jasher-5-noah-just-and-perfect-chosen
  ('jasher', 'jasher', 5, 13, 'canon', 'genesis', 6, 9, 'free', E'Genesis 6:9 — *These are the generations of Noah: Noah was a just man and perfect in his generations, and Noah walked with Elohim (God).* Jasher 5:13 repeats the canon''s just-and-perfect verdict that grounds Noah''s election.'),
  ('jasher', 'jasher', 5, 14, 'canon', 'genesis', 6, 8, 'free', E'Genesis 6:8 — *But Noah found grace in the eyes of Yahuah (LORD).* The grace Genesis names is the choosing Jasher 5:14 voices when the LORD bids Noah beget seed.'),
  ('jasher', 'jasher', 5, 13, 'canon', 'hebrews', 11, 7, 'free', E'Hebrews 11:7 — *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith.* The faith-righteousness of the Companion is the same just man Jasher 5:13 says God chose to raise seed.'),
  ('jasher', 'jasher', 5, 17, 'canon', 'genesis', 6, 10, 'free', E'Genesis 6:10 — *And Noah begat three sons, Shem, Ham, and Japheth.* Jasher 5:17 names the same sons through whom the remnant seed is carried past the flood.'),
  -- thread: jasher-5-command-build-the-ark
  ('jasher', 'jasher', 5, 25, 'canon', 'genesis', 6, 13, 'free', E'Genesis 6:13 — *And Elohim (God) said unto Noah, The end of all flesh is come before me; for the earth is filled with violence through them; and, behold, I will destroy them with the earth.* Jasher 5:25 carries the canon''s end-of-all-flesh decree nearly word for word.'),
  ('jasher', 'jasher', 5, 26, 'canon', 'genesis', 6, 14, 'free', E'Genesis 6:14 — *Make thee an ark of gopher wood; rooms shalt thou make in the ark, and shalt pitch it within and without with pitch.* The gopher-wood ark Jasher 5:26 commands is the very ark of the Torah.'),
  ('jasher', 'jasher', 5, 27, 'canon', 'genesis', 6, 15, 'free', E'Genesis 6:15 — *And this is the fashion which thou shalt make it of: The length of the ark shall be three hundred cubits, the breadth of it fifty cubits, and the height of it thirty cubits.* Jasher 5:27 gives the identical three-hundred-by-fifty-by-thirty cubit measure.'),
  ('jasher', 'jasher', 5, 29, 'canon', 'genesis', 6, 17, 'free', E'Genesis 6:17 — *And, behold, I, even I, do bring a flood of waters upon the earth, to destroy all flesh, wherein is the breath of life, from under heaven; and every thing that is in the earth shall die.* Jasher 5:29''s flood of waters destroying all flesh matches the canon''s own threat.'),
  ('jasher', 'jasher', 5, 25, 'canon', 'genesis', 6, 18, 'free', E'Genesis 6:18 — *But with thee will I establish my covenant; and thou shalt come into the ark, thou, and thy sons, and thy wife, and thy sons'' wives with thee.* The covenant of preservation rides on the same word of judgment Jasher 5:25 reports.'),
  -- thread: jasher-5-two-of-every-sort-and-food
  ('jasher', 'jasher', 5, 30, 'canon', 'genesis', 6, 19, 'free', E'Genesis 6:19 — *And of every living thing of all flesh, two of every sort shalt thou bring into the ark, to keep them alive with thee; they shall be male and female.* Jasher 5:30''s two couple of all living things, male and female, is the Torah''s own command to preserve the seed.'),
  ('jasher', 'jasher', 5, 31, 'canon', 'genesis', 6, 21, 'free', E'Genesis 6:21 — *And take thou unto thee of all food that is eaten, and thou shalt gather it to thee; and it shall be for food for thee, and for them.* The provisioning Jasher 5:31 records is the canon''s identical charge to gather food for man and beast.'),
  ('jasher', 'jasher', 5, 33, 'canon', 'genesis', 6, 22, 'free', E'Genesis 6:22 — *Thus did Noah; according to all that Elohim (God) commanded him, so did he.* Jasher 5:33''s obedient ark-building is the Torah''s summary verdict that Noah did all as commanded.'),
  ('jasher', 'jasher', 5, 33, 'jubilees', 'jubilees', 5, 22, 'extras', E'Jubilees 5:22 — *And Noah made the ark in all respects as He commanded him, in the twenty-seventh jubilee of years, in the fifth week in the fifth year (on the new moon of the first month).* The live Jubilees apparatus dates the same obedient ark-building Jasher 5:33 narrates.'),
  -- thread: jasher-5-righteous-seen-before-me
  ('jasher', 'jasher', 5, 35, 'canon', 'genesis', 7, 1, 'free', E'Genesis 7:1 — *And Yahuah (LORD) said unto Noah, Come thou and all thy house into the ark; for thee have I seen righteous before me in this generation.* Jasher''s seen-righteous verdict and household-gathering (5:14, 5:35) lead straight into the canon''s call to enter the ark.'),
  ('jasher', 'jasher', 5, 30, 'canon', 'genesis', 7, 2, 'free', E'Genesis 7:2 — *Of every clean beast thou shalt take to thee by sevens, the male and his female: and of beasts that are not clean by two, the male and his female.* The clean/unclean distinction stands before Sinai — Torah already in force as Jasher 5:30 gathers the living kinds.'),
  ('jasher', 'jasher', 5, 33, 'canon', 'genesis', 7, 5, 'free', E'Genesis 7:5 — *And Noah did according unto all that Yahuah (LORD) commanded him.* The obedient Noah of Jasher 5:33 is the canon''s same man who did all the LORD commanded.'),
  ('jasher', 'jasher', 5, 25, 'enoch', '1-enoch', 10, 2, 'extras', E'1 Enoch 10:2 — *And said to him: ''Go to Noah and tell him in My Name "Hide thyself!" and reveal to him the end that is approaching: that the whole earth will be destroyed, and a deluge is about to come upon the whole earth, and will destroy all that is on it.* The live Enoch apparatus carries the same end-is-coming warning to Noah that Jasher 5:25 reports.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-5-seed-line-fathers-die',
       E'The chosen line dies away — Seth''s sons buried before the flood',
       E'Jasher opens by burying the seed-line generation by generation: *And it was in the eighty-fourth year of the life of Noah, that Enoch the son of Seth died, he was nine hundred and five years old at his death* (Jasher 5:1), then Cainan, Mahlallel, and Jared, *And all who followed Yahuah (the Lord) died in those days, before they saw the evil which Elohim (God) declared to do upon earth* (Jasher 5:5). This is the very roll-call of Genesis 5, the book of the chosen seed Adam→Seth→Noah. Genesis gives the same line and the same lifespans: *And all the days of Cainan were nine hundred and ten years: and he died* (Genesis 5:14), and traces it to Noah''s father Lamech — *And he called his name Noah, saying, This same shall comfort us concerning our work and toil of our hands, because of the ground which Yahuah (LORD) hath cursed* (Genesis 5:29). Jubilees keeps the same righteous remnant frame, that of all the corrupt generation *no man''s person was accepted save that of Noah alone* (Jubilees 5:19). It ain''t new — the election precedes the flood; the righteous are gathered home before the judgment falls.',
       sv.verse_id, ev.verse_id, 'extras', 55100
  FROM _session252_ja05_lookup sv, _session252_ja05_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=5 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-5-hundred-twenty-years-warning',
       E'The hundred and twenty years — Noah and Methuselah preach repentance',
       E'Elohim sends a herald''s grace before the sword: *For thus says Yahuah (the Lord), Behold I give you a period of one hundred and twenty years; if you will turn to me and forsake your evil ways, then will I also turn away from the evil which I told you* (Jasher 5:8), and *Noah and Methuselah spoke all the words of Yahuah (the Lord) to the sons of men, day after day, constantly speaking to them* (Jasher 5:9). This is Genesis 6:3 unfolded into a preaching ministry — *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years* (Genesis 6:3). The New Testament names the office Jasher dramatizes: God *spared not the old world, but saved Noah the eighth person, a preacher of righteousness* (2 Peter 2:5). Jubilees frames the same hundred and twenty years against the corrupted flesh — *Your spirit will not always abide on man; for they also are flesh and their days shall be one hundred and twenty years* (Jubilees 5:8). The longsuffering call goes out first; the door stays open a hundred and twenty years before it shuts.',
       sv.verse_id, ev.verse_id, 'extras', 55103
  FROM _session252_ja05_lookup sv, _session252_ja05_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=6
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=5 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-5-noah-just-and-perfect-chosen',
       E'Noah a just man, perfect — chosen to raise up seed',
       E'The election is stated plainly: *And Noah was a just man, he was perfect in his generation, and Yahuah (the Lord) chose him to raise up seed from his seed upon the face of the earth* (Jasher 5:13), and the LORD commands him to marry and beget — *Take to you a wife, and beget children, for I have seen you righteous before me in this generation* (Jasher 5:14). This is Genesis 6:8-9 carried into Jasher''s narrative: *But Noah found grace in the eyes of Yahuah (LORD)... Noah was a just man and perfect in his generations, and Noah walked with Elohim (God)* (Genesis 6:8-9). The Companion of faith records it as the founding act of trust: *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house... and became heir of the righteousness which is by faith* (Hebrews 11:7). Jasher even names the sons — *he called his name Shem, saying, Elohim has made me a remnant, to raise up seed in the midst of the earth* (Jasher 5:17) — the very triad of Genesis 6:10. Election precedes the ark: God chooses the righteous seed, then preserves it.',
       sv.verse_id, ev.verse_id, 'extras', 55106
  FROM _session252_ja05_lookup sv, _session252_ja05_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=12
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=5 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-5-command-build-the-ark',
       E'Make a large ark of gopher wood — the flood decreed',
       E'The judgment-word and the building command come together: *The end of all flesh is come before me, on account of their evil deeds, and behold I will destroy the earth* (Jasher 5:25), *And do you take to you gopher wood, and go to a certain place and make a large ark... three hundred cubits its length, fifty cubits broad and thirty cubits high* (Jasher 5:26-27). Jasher quotes Genesis almost word for word: *And Elohim (God) said unto Noah, The end of all flesh is come before me; for the earth is filled with violence through them; and, behold, I will destroy them with the earth* (Genesis 6:13), *Make thee an ark of gopher wood... The length of the ark shall be three hundred cubits, the breadth of it fifty cubits, and the height of it thirty cubits* (Genesis 6:14-15). The covenant of preservation belongs to this same word: *But with thee will I establish my covenant; and thou shalt come into the ark* (Genesis 6:18). It ain''t new — the dimensions, the gopher wood, the pitch, the door all stand in the Torah Jasher is retelling.',
       sv.verse_id, ev.verse_id, 'extras', 55109
  FROM _session252_ja05_lookup sv, _session252_ja05_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=25
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=5 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-5-two-of-every-sort-and-food',
       E'Two couple of all living things — gather them and their food',
       E'Noah is told to preserve the living seed of the world: *And you and your household shall go and gather two couple of all living things, male and female, and shall bring them to the ark, to raise up seed from them upon earth* (Jasher 5:30), *And gather to you all food that is eaten by all the animals, that there may be food for you and for them* (Jasher 5:31). Genesis gives the same charge: *And of every living thing of all flesh, two of every sort shalt thou bring into the ark, to keep them alive with thee; they shall be male and female* (Genesis 6:19), and *take thou unto thee of all food that is eaten, and thou shalt gather it to thee; and it shall be for food for thee, and for them* (Genesis 6:21). Jubilees records the obedient builder behind it: *And Noah made the ark in all respects as He commanded him, in the twenty-seventh jubilee of years* (Jubilees 5:22). The same ark, the same pairs, the same provision — preservation of the seed against the day of waters.',
       sv.verse_id, ev.verse_id, 'extras', 55112
  FROM _session252_ja05_lookup sv, _session252_ja05_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=30
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=5 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-5-righteous-seen-before-me',
       E'Seen righteous before me — the call to come into the ark',
       E'Twice the LORD names Noah''s righteousness as the ground of his salvation: *for I have seen you righteous before me in this generation* (Jasher 5:14), and the household is gathered with the maidens chosen for the sons, *as Yahuah (the Lord) had commanded Noah* (Jasher 5:35), down to Methuselah''s death as the waters near (Jasher 5:36). This is Genesis 7''s threshold-word: *And Yahuah (LORD) said unto Noah, Come thou and all thy house into the ark; for thee have I seen righteous before me in this generation* (Genesis 7:1). The clean and unclean enter as the Torah-before-Sinai already distinguished them — *Of every clean beast thou shalt take to thee by sevens, the male and his female: and of beasts that are not clean by two* (Genesis 7:2) — and Noah obeys: *And Noah did according unto all that Yahuah (LORD) commanded him* (Genesis 7:5). 1 Enoch preserves the same warning sent ahead of the deluge: *Go to Noah and tell him in My Name "Hide thyself!" and reveal to him the end that is approaching* (1 Enoch 10:2). The righteous remnant is warned, gathered, and shut in before the world of the ungodly is swept away.',
       sv.verse_id, ev.verse_id, 'extras', 55115
  FROM _session252_ja05_lookup sv, _session252_ja05_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=32
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=5 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-5-seed-line-fathers-die
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:8 — *And all the days of Seth were nine hundred and twelve years: and he died.* Jasher''s dying patriarchs are the same chosen Sethite line Genesis numbers and buries before the flood.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-seed-line-fathers-die'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 5:14 — *And all the days of Cainan were nine hundred and ten years: and he died.* Genesis gives Cainan''s exact nine hundred and ten years that Jasher 5:2 repeats.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-seed-line-fathers-die'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 5:20 — *And all the days of Jared were nine hundred sixty and two years: and he died.* Jared''s nine hundred sixty-two years in Jasher 5:4 stand verbatim with the canon roll of the seed-line.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-seed-line-fathers-die'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 5:19 — *And as for all those who corrupted their ways and their thoughts before the flood, no man''s person was accepted save that of Noah alone; for his person was accepted in behalf of his sons, whom Elohim (God) saved from the waters of the flood on his account...* The fathers who followed Yahuah die out (Jasher 5:5), leaving Noah alone as the accepted remnant.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-seed-line-fathers-die'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-5-hundred-twenty-years-warning
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:3 — *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years.* Jasher 5:8 unfolds this same hundred and twenty year reprieve as a spoken call to repent.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-hundred-twenty-years-warning'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 2:5 — *And spared not the old world, but saved Noah the eighth person, a preacher of righteousness, bringing in the flood upon the world of the ungodly.* The apostle names the preaching office Jasher 5:9 shows Noah and Methuselah filling day after day.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-hundred-twenty-years-warning'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 5:8 — *And He said "Your spirit will not always abide on man; for they also are flesh and their days shall be one hundred and twenty years."* The same hundred and twenty year decree against corrupted flesh stands in the live Jubilees apparatus beside Jasher 5:8.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-hundred-twenty-years-warning'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-5-noah-just-and-perfect-chosen
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:9 — *These are the generations of Noah: Noah was a just man and perfect in his generations, and Noah walked with Elohim (God).* Jasher 5:13 repeats the canon''s just-and-perfect verdict that grounds Noah''s election.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-noah-just-and-perfect-chosen'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:8 — *But Noah found grace in the eyes of Yahuah (LORD).* The grace Genesis names is the choosing Jasher 5:14 voices when the LORD bids Noah beget seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-noah-just-and-perfect-chosen'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:7 — *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith.* The faith-righteousness of the Companion is the same just man Jasher 5:13 says God chose to raise seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-noah-just-and-perfect-chosen'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 6:10 — *And Noah begat three sons, Shem, Ham, and Japheth.* Jasher 5:17 names the same sons through whom the remnant seed is carried past the flood.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-noah-just-and-perfect-chosen'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-5-command-build-the-ark
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:13 — *And Elohim (God) said unto Noah, The end of all flesh is come before me; for the earth is filled with violence through them; and, behold, I will destroy them with the earth.* Jasher 5:25 carries the canon''s end-of-all-flesh decree nearly word for word.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-command-build-the-ark'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:14 — *Make thee an ark of gopher wood; rooms shalt thou make in the ark, and shalt pitch it within and without with pitch.* The gopher-wood ark Jasher 5:26 commands is the very ark of the Torah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-command-build-the-ark'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 6:15 — *And this is the fashion which thou shalt make it of: The length of the ark shall be three hundred cubits, the breadth of it fifty cubits, and the height of it thirty cubits.* Jasher 5:27 gives the identical three-hundred-by-fifty-by-thirty cubit measure.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-command-build-the-ark'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 6:17 — *And, behold, I, even I, do bring a flood of waters upon the earth, to destroy all flesh, wherein is the breath of life, from under heaven; and every thing that is in the earth shall die.* Jasher 5:29''s flood of waters destroying all flesh matches the canon''s own threat.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-command-build-the-ark'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Genesis 6:18 — *But with thee will I establish my covenant; and thou shalt come into the ark, thou, and thy sons, and thy wife, and thy sons'' wives with thee.* The covenant of preservation rides on the same word of judgment Jasher 5:25 reports.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-command-build-the-ark'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-5-two-of-every-sort-and-food
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:19 — *And of every living thing of all flesh, two of every sort shalt thou bring into the ark, to keep them alive with thee; they shall be male and female.* Jasher 5:30''s two couple of all living things, male and female, is the Torah''s own command to preserve the seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-two-of-every-sort-and-food'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:21 — *And take thou unto thee of all food that is eaten, and thou shalt gather it to thee; and it shall be for food for thee, and for them.* The provisioning Jasher 5:31 records is the canon''s identical charge to gather food for man and beast.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-two-of-every-sort-and-food'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 6:22 — *Thus did Noah; according to all that Elohim (God) commanded him, so did he.* Jasher 5:33''s obedient ark-building is the Torah''s summary verdict that Noah did all as commanded.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-two-of-every-sort-and-food'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 5:22 — *And Noah made the ark in all respects as He commanded him, in the twenty-seventh jubilee of years, in the fifth week in the fifth year (on the new moon of the first month).* The live Jubilees apparatus dates the same obedient ark-building Jasher 5:33 narrates.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-two-of-every-sort-and-food'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=33
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-5-righteous-seen-before-me
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 7:1 — *And Yahuah (LORD) said unto Noah, Come thou and all thy house into the ark; for thee have I seen righteous before me in this generation.* Jasher''s seen-righteous verdict and household-gathering (5:14, 5:35) lead straight into the canon''s call to enter the ark.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-righteous-seen-before-me'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 7:2 — *Of every clean beast thou shalt take to thee by sevens, the male and his female: and of beasts that are not clean by two, the male and his female.* The clean/unclean distinction stands before Sinai — Torah already in force as Jasher 5:30 gathers the living kinds.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-righteous-seen-before-me'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 7:5 — *And Noah did according unto all that Yahuah (LORD) commanded him.* The obedient Noah of Jasher 5:33 is the canon''s same man who did all the LORD commanded.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-righteous-seen-before-me'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 10:2 — *And said to him: ''Go to Noah and tell him in My Name "Hide thyself!" and reveal to him the end that is approaching: that the whole earth will be destroyed, and a deluge is about to come upon the whole earth, and will destroy all that is on it.* The live Enoch apparatus carries the same end-is-coming warning to Noah that Jasher 5:25 reports.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-righteous-seen-before-me'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=25
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

