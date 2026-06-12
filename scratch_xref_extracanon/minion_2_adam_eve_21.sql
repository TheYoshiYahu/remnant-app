-- ----- fragment: minion_2adameve_21.sql (session253 2-adam-eve 21) -----
-- Source anchor: adam-eve-conflict/2-adam-eve ch21. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2ae21 (view _session253_2ae21_lookup). Sort band base 66500, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2ae21_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-adam-eve-21-keep-the-commandment-holy-mountain
  ('adam-eve-conflict', '2-adam-eve', 21, 4, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The mingling that drew Seth''s children down off the holy mountain in 2 Adam & Eve 21:4 is Genesis'' sons-of-God taking the daughters of men.'),
  ('adam-eve-conflict', '2-adam-eve', 21, 4, 'canon', 'genesis', 6, 4, 'free', E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* Jared''s grief over the fallen children of Seth (21:4) looks straight onto the giant-bearing intermarriage Genesis records.'),
  ('adam-eve-conflict', '2-adam-eve', 21, 4, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The holy mountain-line Jared charges to keep the commandment (21:4) is the Seth-line that first called on the Name.'),
  ('adam-eve-conflict', '2-adam-eve', 21, 7, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Jared''s charge to set their hearts and keep Elohim''s commandment (21:7) guards the very seed of the woman the serpent has hunted from the first day outside Eden.'),
  -- thread: 2-adam-eve-21-gold-incense-myrrh-the-saviour
  ('adam-eve-conflict', '2-adam-eve', 21, 7, 'canon', 'matthew', 2, 11, 'free', E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The gold, incense, and myrrh Jared bids them keep (21:7) are the magi''s three gifts, prepared in the first age for the Saviour''s coming.'),
  ('adam-eve-conflict', '2-adam-eve', 21, 7, 'jubilees', 'jubilees', 4, 25, 'extras', E'Jubilees 4:25 — *And he burnt the incense of the sanctuary, (even) sweet spices, acceptable before Yahuah (God) on the Mount. For Yahuah (God) has four places on the earth, the Garden of Eden, and the Mount of the East, and this mountain on which you are this day, Mount Sinai, and Mount Zion (which) will be sanctified in the new creation for a sanctification of the earth; through it will the earth be sanctified from all (its) guilt and its uncleanness throughout the generations of the world.* The incense Jared lays up (21:7) is the same sanctuary-incense Enoch offered on the holy Mount.'),
  -- thread: 2-adam-eve-21-word-of-elohim-salvation-middle-of-earth
  ('adam-eve-conflict', '2-adam-eve', 21, 8, 'canon', 'john', 1, 1, 'free', E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Elohim Jared says will come to the one left (21:8) is the eternal Logos of John''s prologue.'),
  ('adam-eve-conflict', '2-adam-eve', 21, 8, 'canon', 'john', 1, 14, 'free', E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word who comes to work salvation in the middle of the earth (21:8) is the Word made flesh.'),
  ('adam-eve-conflict', '2-adam-eve', 21, 8, 'canon', 'galatians', 4, 4, 'free', E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The coming of the Word foretold in 21:8 is fulfilled when the fulness of time was come.'),
  ('adam-eve-conflict', '2-adam-eve', 21, 11, 'canon', 'genesis', 3, 15, 'free', E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The place whence salvation shall come, where Shem lays Adam''s body (21:11), is where the woman''s seed bruises the serpent''s head.'),
  -- thread: 2-adam-eve-21-noah-shem-ark-flood
  ('adam-eve-conflict', '2-adam-eve', 21, 10, 'canon', 'hebrews', 11, 7, 'free', E'Hebrews 11:7 — *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith.* The Noah Jared names as the one left, who bears Adam''s body into the ark (21:10), is the faith-Noah who prepared the ark to save his house.'),
  ('adam-eve-conflict', '2-adam-eve', 21, 10, 'canon', 'genesis', 7, 7, 'free', E'Genesis 7:7 — *And Noah went in, and his sons, and his wife, and his sons'' wives with him, into the ark, because of the waters of the flood.* The flood and the ark Jared foretells (21:10) is the very entry Genesis narrates.'),
  ('adam-eve-conflict', '2-adam-eve', 21, 11, 'canon', 'genesis', 7, 13, 'free', E'Genesis 7:13 — *In the selfsame day entered Noah, and Shem, and Ham, and Japheth, the sons of Noah, and Noah''s wife, and the three wives of his sons with them, into the ark;* Shem, whom Jared singles out to lay Adam''s body (21:11), enters the ark first-named among Noah''s sons.'),
  -- thread: 2-adam-eve-21-jared-rest-enoch-ministers
  ('adam-eve-conflict', '2-adam-eve', 21, 12, 'canon', 'genesis', 5, 24, 'free', E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The Enoch charged to minister before Adam''s body all his days (21:12) is the Enoch who walked with Elohim until he was taken.'),
  ('adam-eve-conflict', '2-adam-eve', 21, 12, 'canon', 'hebrews', 11, 5, 'free', E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* Enoch''s diligent ministry in the cave (21:12) is the pleasing-Elohim testimony that crowned his translation.'),
  ('adam-eve-conflict', '2-adam-eve', 21, 12, 'jubilees', 'jubilees', 4, 23, 'extras', E'Jubilees 4:23 — *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour, and behold there he writes down the condemnation and judgment of the world, and all the wickedness of the children of men.* The Enoch set to minister before Adam''s body (21:12) is the same scribe-witness conducted into the Garden of Eden.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2ae21_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2ae21_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-21-keep-the-commandment-holy-mountain',
       E'Keep the commandment — the seed kept on the holy mountain',
       E'Dying Jared gathers the covenant line — *Then he called Enoch his eldest son, and Methuselah Enoch''s son, and Lamech the son of Methuselah, and Noah the son of Lamech* (2 Adam & Eve 21:3) — and binds them to the seed kept apart: *Ye are righteous, innocent sons; go ye not down from this holy mountain; for behold, your children and your children''s children have gone down from this holy mountain, and have estranged themselves from this holy mountain, through their abominable lust and transgression of Elohim''s (God''s) commandment* (21:4). This is the two seed-lines of the primeval war: the children of Seth held holy above, drawn down by the daughters below. *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2), and *There were giants in the earth in those days* (Genesis 6:4) — the same mingling Jared weeps over. The line itself is the calling on the Name begun in Seth: *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD)* (Genesis 4:26). It ain''t new — election precedes confession, and the seed is kept by mercy against the day the serpent''s head is bruised: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15).',
       sv.verse_id, ev.verse_id, 'extras', 66500
  FROM _session253_2ae21_lookup sv, _session253_2ae21_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=3
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=21 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-21-gold-incense-myrrh-the-saviour',
       E'The gold, the incense, and the myrrh kept for the Saviour',
       E'Jared commits the cave''s treasure to the line: *take with you the body of our father Adam, and with it these three precious gifts and offerings, namely, the gold, the incense, and the myrrh; and let them be in the place where the body of our father Adam shall lay* (2 Adam & Eve 21:7). These three gifts, hoarded from the first generation against the coming of the Saviour, are the very three the magi will carry to His cradle: *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh* (Matthew 2:11). It ain''t new — the gift was prepared at the dawn of the world. The incense itself echoes Enoch, who in the parallel witness *burnt the incense of the sanctuary, (even) sweet spices, acceptable before Yahuah (God) on the Mount* (Jubilees 4:25), the same mountain-sanctuary worship the holy line keeps.',
       sv.verse_id, ev.verse_id, 'extras', 66503
  FROM _session253_2ae21_lookup sv, _session253_2ae21_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=7
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=21 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-21-word-of-elohim-salvation-middle-of-earth',
       E'The Word of Elohim shall come — salvation in the middle of the earth',
       E'Jared prophesies the Logos who will come to redeem: *And unto him of you who shall be left, 0 my sons, shall the Word of Elohim (God) come, and when he goes out of this land he shall take with him the body of our father Adam, and shall lay it in the middle of the earth, the place in which salvation shall be wrought* (2 Adam & Eve 21:8). The Word of Elohim who comes is the Logos by whom all was made: *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God)* (John 1:1), and *the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth* (John 1:14). The promised coming arrives in the appointed fulness: *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law* (Galatians 4:4) — the place salvation is wrought is the place where the seed of the woman bruises the serpent: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). It ain''t new — the first fathers knew the Saviour was coming.',
       sv.verse_id, ev.verse_id, 'extras', 66506
  FROM _session253_2ae21_lookup sv, _session253_2ae21_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=8
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=21 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-21-noah-shem-ark-flood',
       E'Noah is the one left — Shem and the ark against the flood',
       E'Jared names the survivor of the holy line: *Thou art he that shall be left. And thou shalt take the body of our father Adam from the cave, and place it with thee in the ark when the flood comes* (2 Adam & Eve 21:10), and of Shem, *he it is who shall lay the body of our father Adam in the middle of the earth, in the place whence salvation shall come* (21:11). Noah preserved through the flood is the canon''s man of faith: *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith* (Hebrews 11:7). Genesis records the very entry Jared foretells: *And Noah went in, and his sons, and his wife, and his sons'' wives with him, into the ark, because of the waters of the flood* (Genesis 7:7), and names Shem first among the sons: *In the selfsame day entered Noah, and Shem, and Ham, and Japheth, the sons of Noah* (Genesis 7:13). It ain''t new — the seed is carried alive through judgment to the place of salvation.',
       sv.verse_id, ev.verse_id, 'extras', 66509
  FROM _session253_2ae21_lookup sv, _session253_2ae21_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=10
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=21 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-adam-eve-21-jared-rest-enoch-ministers',
       E'Jared enters rest — Enoch ministers before the body of Adam',
       E'Jared charges Enoch to keep the cave-sanctuary — *Thou, my son, abide in this cave, and minister diligently before the body of our father Adam all the days of thy life; and feed thy people in righteousness and innocence* (2 Adam & Eve 21:12) — then *His hands were loosened, his eyes closed, and he entered into rest like his fathers* (21:13). Enoch''s faithful ministry before he is taken echoes the canon''s witness of him: *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24), confirmed in faith — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God)* (Hebrews 11:5). The parallel restored witness sets him as the priest-scribe on the Mount: *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour, and behold there he writes down the condemnation and judgment of the world, and all the wickedness of the children of men* (Jubilees 4:23). It ain''t new — the same Enoch who ministers in the cave is taken up to walk with Elohim.',
       sv.verse_id, ev.verse_id, 'extras', 66512
  FROM _session253_2ae21_lookup sv, _session253_2ae21_lookup ev
 WHERE sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=12
   AND ev.edition_slug='adam-eve-conflict' AND ev.book_slug='2-adam-eve' AND ev.chapter_number=21 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-adam-eve-21-keep-the-commandment-holy-mountain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The mingling that drew Seth''s children down off the holy mountain in 2 Adam & Eve 21:4 is Genesis'' sons-of-God taking the daughters of men.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae21_lookup sv, _session253_2ae21_lookup tv
 WHERE t.slug='2-adam-eve-21-keep-the-commandment-holy-mountain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:4 — *There were giants in the earth in those days; and also after that, when the sons of Elohim (God) came in unto the daughters of men, and they bare children to them, the same became mighty men which were of old, men of renown.* Jared''s grief over the fallen children of Seth (21:4) looks straight onto the giant-bearing intermarriage Genesis records.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae21_lookup sv, _session253_2ae21_lookup tv
 WHERE t.slug='2-adam-eve-21-keep-the-commandment-holy-mountain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* The holy mountain-line Jared charges to keep the commandment (21:4) is the Seth-line that first called on the Name.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae21_lookup sv, _session253_2ae21_lookup tv
 WHERE t.slug='2-adam-eve-21-keep-the-commandment-holy-mountain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* Jared''s charge to set their hearts and keep Elohim''s commandment (21:7) guards the very seed of the woman the serpent has hunted from the first day outside Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae21_lookup sv, _session253_2ae21_lookup tv
 WHERE t.slug='2-adam-eve-21-keep-the-commandment-holy-mountain'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-21-gold-incense-myrrh-the-saviour
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 2:11 — *And when they were come into the house, they saw the young child with Mary his mother, and fell down, and worshipped him: and when they had opened their treasures, they presented unto him gifts; gold, and frankincense, and myrrh.* The gold, incense, and myrrh Jared bids them keep (21:7) are the magi''s three gifts, prepared in the first age for the Saviour''s coming.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae21_lookup sv, _session253_2ae21_lookup tv
 WHERE t.slug='2-adam-eve-21-gold-incense-myrrh-the-saviour'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 4:25 — *And he burnt the incense of the sanctuary, (even) sweet spices, acceptable before Yahuah (God) on the Mount. For Yahuah (God) has four places on the earth, the Garden of Eden, and the Mount of the East, and this mountain on which you are this day, Mount Sinai, and Mount Zion (which) will be sanctified in the new creation for a sanctification of the earth; through it will the earth be sanctified from all (its) guilt and its uncleanness throughout the generations of the world.* The incense Jared lays up (21:7) is the same sanctuary-incense Enoch offered on the holy Mount.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae21_lookup sv, _session253_2ae21_lookup tv
 WHERE t.slug='2-adam-eve-21-gold-incense-myrrh-the-saviour'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=7
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-21-word-of-elohim-salvation-middle-of-earth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 1:1 — *In the beginning was the Word, and the Word was with Elohim (God), and the Word was Elohim (God).* The Word of Elohim Jared says will come to the one left (21:8) is the eternal Logos of John''s prologue.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae21_lookup sv, _session253_2ae21_lookup tv
 WHERE t.slug='2-adam-eve-21-word-of-elohim-salvation-middle-of-earth'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 1:14 — *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth.* The Word who comes to work salvation in the middle of the earth (21:8) is the Word made flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae21_lookup sv, _session253_2ae21_lookup tv
 WHERE t.slug='2-adam-eve-21-word-of-elohim-salvation-middle-of-earth'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Galatians 4:4 — *But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law,* The coming of the Word foretold in 21:8 is fulfilled when the fulness of time was come.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae21_lookup sv, _session253_2ae21_lookup tv
 WHERE t.slug='2-adam-eve-21-word-of-elohim-salvation-middle-of-earth'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:15 — *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel.* The place whence salvation shall come, where Shem lays Adam''s body (21:11), is where the woman''s seed bruises the serpent''s head.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae21_lookup sv, _session253_2ae21_lookup tv
 WHERE t.slug='2-adam-eve-21-word-of-elohim-salvation-middle-of-earth'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-21-noah-shem-ark-flood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:7 — *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith.* The Noah Jared names as the one left, who bears Adam''s body into the ark (21:10), is the faith-Noah who prepared the ark to save his house.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae21_lookup sv, _session253_2ae21_lookup tv
 WHERE t.slug='2-adam-eve-21-noah-shem-ark-flood'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 7:7 — *And Noah went in, and his sons, and his wife, and his sons'' wives with him, into the ark, because of the waters of the flood.* The flood and the ark Jared foretells (21:10) is the very entry Genesis narrates.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae21_lookup sv, _session253_2ae21_lookup tv
 WHERE t.slug='2-adam-eve-21-noah-shem-ark-flood'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 7:13 — *In the selfsame day entered Noah, and Shem, and Ham, and Japheth, the sons of Noah, and Noah''s wife, and the three wives of his sons with them, into the ark;* Shem, whom Jared singles out to lay Adam''s body (21:11), enters the ark first-named among Noah''s sons.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae21_lookup sv, _session253_2ae21_lookup tv
 WHERE t.slug='2-adam-eve-21-noah-shem-ark-flood'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-adam-eve-21-jared-rest-enoch-ministers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The Enoch charged to minister before Adam''s body all his days (21:12) is the Enoch who walked with Elohim until he was taken.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae21_lookup sv, _session253_2ae21_lookup tv
 WHERE t.slug='2-adam-eve-21-jared-rest-enoch-ministers'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* Enoch''s diligent ministry in the cave (21:12) is the pleasing-Elohim testimony that crowned his translation.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae21_lookup sv, _session253_2ae21_lookup tv
 WHERE t.slug='2-adam-eve-21-jared-rest-enoch-ministers'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:23 — *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour, and behold there he writes down the condemnation and judgment of the world, and all the wickedness of the children of men.* The Enoch set to minister before Adam''s body (21:12) is the same scribe-witness conducted into the Garden of Eden.'
  FROM cross_reference_threads t, cross_references x, _session253_2ae21_lookup sv, _session253_2ae21_lookup tv
 WHERE t.slug='2-adam-eve-21-jared-rest-enoch-ministers'
   AND sv.edition_slug='adam-eve-conflict' AND sv.book_slug='2-adam-eve' AND sv.chapter_number=21 AND sv.verse_number=12
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

