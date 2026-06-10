-- ----- fragment: minion_acts_27.sql (S217 Acts 27) -----
-- =====================================================================
-- S217 minion — ACTS 27 FULL-LIBRARY cross-references
-- =====================================================================
-- Anchor chapter: ACTS 27.  Tag: a27 (temp view _s217_a27_lookup).  Sort band: 5925-5949 (step 3).
-- Source is ALWAYS the canon Acts 27 verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- WATCHPOINTS (Red Lines, Christology, son-of-Adam):
--  * The voyage to Rome is largely sailing-narrative; the load-bearing weight is (a) the
--    angel-of-Elohim keeping-and-delivering promise made good (27:23-24, cf. Acts 23:11 — the
--    Master's own sending to Rome confirmed), (b) the ship saved for the righteous one's sake
--    (all them that sail given to Paul — the Genesis 18 Abraham/Sodom pattern, the many spared
--    for the one), (c) the tempest in which all hope is taken away and the Lord alone stills the
--    storm and brings to the desired haven (Psalm 107; Jonah 1), (d) the not-a-hair-perish
--    preservation promise (1 Samuel 14:45; 2 Samuel 14:11; Luke 21:18), and (e) the
--    giving-thanks/breaking-bread witness's table (Luke 22:19; Luke 24:30).
--  * The angel of Elohim (God) standing by, *whose I am, and whom I serve* (27:23): the keeping
--    of the servant on the journey to his appointed witness — the messenger sent to keep the way,
--    as the good angel kept Tobias (Tobit 5). NOT a generic guardian-angel devotion; the angel
--    bears the word of Elohim that the journey ends at its appointed place.
--  * The deliverance of all 276 souls FOR Paul's sake (27:24,44 — *escaped all safe to land*):
--    the righteous one's presence preserving the many, as Yahuah (LORD) would spare Sodom for the
--    sake of the righteous found in it (Genesis 18). Read as the preserving weight of the witness,
--    NOT a merit-transfer scheme.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  ACTS 27:
--   v.1-8   sail to Italy / Sidon / under Crete  Tanakh: none warranted (itinerary)  Extras: none warranted  NT: none warranted
--   v.9-13  Paul admonishes / not heeded         Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative; warning honored at the deliverance threads)
--   v.14-20 Euroclydon / all hope taken away     Tanakh: Psalm 107:25, Psalm 107:27; Jonah 1:4, Jonah 1:5  Extras: none warranted  NT: none warranted
--   v.21-26 Paul stood forth / the angel stood by Tanakh: none added here (the keeping carried via the Acts 23 NT anchor + Genesis 18)  Extras: Tobit 5:16, Tobit 5:21  NT: Acts 23:11
--   v.23-24 the ship given for Paul''s sake       Tanakh: Genesis 18:26, Genesis 18:32  Extras: (carried in the angel thread)  NT: none added
--   v.27-32 fourteenth night / soundings / boat  Tanakh: none warranted (narrative)  Extras: none warranted  NT: none warranted
--   v.33-34 take meat / not a hair shall fall     Tanakh: 1 Samuel 14:45, 2 Samuel 14:11  Extras: none warranted  NT: Luke 21:18
--   v.35    took bread / gave thanks / brake it   Tanakh: none warranted  Extras: none warranted  NT: Luke 22:19, Luke 24:30
--   v.36-38 all of good cheer / 276 souls / wheat Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative)
--   v.39-44 aground / broken / escaped all safe   Tanakh: Genesis 18:26 (carried)  Extras: none warranted  NT: none added (the all-safe deliverance carried in the ship-saved thread + Psalm 107:30 desired haven)
--
-- THREADS (slug -> target libraries):
--   5925 acts-27-the-angel-of-god-stood-by-me-fear-not-thou-must-be-brought-to-caesar   (NT, Acts<->Acts + Extras: Tobit)
--   5928 acts-27-given-thee-all-them-that-sail-with-thee-the-ship-saved-for-the-righteous (Tanakh: Genesis 18)
--   5931 acts-27-all-hope-taken-away-the-stormy-wind-he-raiseth-and-the-storm-he-stilleth (Tanakh: Psalm 107 + Jonah 1)
--   5934 acts-27-there-shall-not-an-hair-fall-from-the-head-of-any-of-you               (Tanakh: 1-2 Samuel + NT: Luke)
--   5937 acts-27-he-took-bread-and-gave-thanks-in-presence-of-them-all-and-brake-it      (NT: Luke)
-- =====================================================================

CREATE TEMP VIEW _s217_a27_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-27-the-angel-of-god-stood-by-me-fear-not-thou-must-be-brought-to-caesar
  ('canon', 'acts', 27, 23, 'canon', 'acts', 23, 11, 'free', E'*And the night following Yahuah (Lord) stood by him, and said, Be of good cheer, Paul: for as thou hast testified of me in Jerusalem, so must thou bear witness also at Rome.* (Acts 23:11). The promise made in the castle at Yerushalayim is the promise kept on the foundering ship: *there stood by me this night the angel of Elohim (God), whose I am, and whom I serve, Saying, Fear not, Paul; thou must be brought before Cæsar* (Acts 27:23-24). The Master who stood by Paul in the night and sent him to bear witness at Rome now sends his messenger to keep him through the tempest — the sending confirmed, the journey to its appointed witness guarded; the storm cannot break what the word of Elohim (God) has appointed.'),
  ('canon', 'acts', 27, 23, 'apocrypha', 'tobit', 5, 16, 'extras', E'*Go you with this man, and Yahuah (God), which dwells in heaven, prosper your journey, and the angel of Yahuah (God) keep you company.* (Tobit 5:16). As the angel of Yahuah (God) was sent to keep Tobias company on the road and bring him home safe, so the angel of Elohim (God) stands by Paul on the sea: *Fear not, Paul; thou must be brought before Cæsar: and, lo, Elohim (God) hath given thee all them that sail with thee* (Acts 27:24). The same keeping — the messenger of Elohim (God) sent to guard the servant the whole length of the journey to its appointed end.'),
  ('canon', 'acts', 27, 24, 'apocrypha', 'tobit', 5, 21, 'extras', E'*For the good angel will keep him company, and his journey shall be prosperous, and he shall return safe.* (Tobit 5:21). The word over Tobias — the good angel keeping the journey, the safe return — is the very shape of the word over Paul and all who sailed with him: *Fear not, Paul … and, lo, Elohim (God) hath given thee all them that sail with thee* (Acts 27:24), and so *they escaped all safe to land* (Acts 27:44). The angel keeps the journey; the appointed one and those given him come safe through.'),
  -- thread: acts-27-given-thee-all-them-that-sail-with-thee-the-ship-saved-for-the-righteous
  ('canon', 'acts', 27, 24, 'canon', 'genesis', 18, 26, 'free', E'*And Yahuah (LORD) said, If I find in Sodom fifty righteous within the city, then I will spare all the place for their sakes.* (Genesis 18:26). The pattern Abraham pressed before Yahuah (LORD) — the whole place spared for the sake of the righteous found in it — is worked again on the sea: *lo, Elohim (God) hath given thee all them that sail with thee* (Acts 27:24). The two hundred threescore and sixteen souls are spared for the one whom Elohim (God) is bringing before Cæsar; the presence of the appointed witness preserves the many.'),
  ('canon', 'acts', 27, 24, 'canon', 'genesis', 18, 32, 'free', E'*And he said, Oh let not Yahuah (Lord) be angry, and I will speak yet but this once: Peradventure ten shall be found there. And he said, I will not destroy it for ten''s sake.* (Genesis 18:32). Yahuah (Lord) would withhold the destruction of a whole city for the sake of a few righteous within it. On the ship the principle is laid bare and made good: *there shall be no loss of any man''s life among you, but of the ship* (Acts 27:22), for *Elohim (God) hath given thee all them that sail with thee* (Acts 27:24). The many are kept alive for the sake of the one.'),
  ('canon', 'acts', 27, 44, 'canon', 'genesis', 18, 26, 'free', E'*And Yahuah (LORD) said, If I find in Sodom fifty righteous within the city, then I will spare all the place for their sakes.* (Genesis 18:26). The sparing of the place for the righteous'' sake reaches its plain end on the shore: the ship breaks, *but the centurion, willing to save Paul, kept them from their purpose* (Acts 27:43), *and so it came to pass, that they escaped all safe to land* (Acts 27:44). None of the two hundred threescore and sixteen is lost — all preserved for the sake of the one Elohim (God) is bringing before Cæsar.'),
  -- thread: acts-27-all-hope-taken-away-the-stormy-wind-he-raiseth-and-the-storm-he-stilleth
  ('canon', 'acts', 27, 20, 'canon', 'psalms', 107, 25, 'free', E'*For he commandeth, and raiseth the stormy wind, which lifteth up the waves thereof.* (Psalm 107:25). The Euroclydon is no mere weather: *he commandeth, and raiseth the stormy wind.* And under it *neither sun nor stars in many days appeared, and no small tempest lay on us, all hope that we should be saved was then taken away* (Acts 27:20). The same Yahuah (LORD) who raises the stormy wind over them that go down to the sea in ships is the One whose angel now stands by to bring them through it.'),
  ('canon', 'acts', 27, 20, 'canon', 'psalms', 107, 27, 'free', E'*They reel to and fro, and stagger like a drunken man, and are at their wits'' end.* (Psalm 107:27). The Psalm names the very place the ship reaches — wits'' end, *all hope that we should be saved was then taken away* (Acts 27:20). But the Psalm does not end there: *Then they cry unto Yahuah (LORD) in their trouble, and he bringeth them out of their distresses* (Psalm 107:28), and *he bringeth them unto their desired haven* (Psalm 107:30). At the wits''-end of the tempest the deliverance of Yahuah (LORD) is exactly where the word of his angel meets the ship.'),
  ('canon', 'acts', 27, 18, 'canon', 'jonah', 1, 4, 'free', E'*But Yahuah (LORD) sent out a great wind into the sea, and there was a mighty tempest in the sea, so that the ship was like to be broken.* (Jonah 1:4). As at Joppa, so in Adria: the mighty tempest that threatens to break the ship — *we being exceedingly tossed with a tempest, the next day they lightened the ship* (Acts 27:18). The sea and the wind are in the hand of Yahuah (LORD); the tempest that breaks the ship cannot take the life he has appointed to be kept.'),
  ('canon', 'acts', 27, 18, 'canon', 'jonah', 1, 5, 'free', E'*Then the mariners were afraid, and cried every man unto his god, and cast forth the wares that were in the ship into the sea, to lighten it of them.* (Jonah 1:5). The mariners of Jonah lighten the ship of its wares in their fear; so on the way to Rome *the next day they lightened the ship* (Acts 27:18), and the third day cast out the tackling, and at the last *cast out the wheat into the sea* (Acts 27:38). The men throw the cargo overboard to live — but the deliverance, when it comes, is not by their lightening but by the keeping word of Elohim (God).'),
  -- thread: acts-27-there-shall-not-an-hair-fall-from-the-head-of-any-of-you
  ('canon', 'acts', 27, 34, 'canon', '1-samuel', 14, 45, 'free', E'*And the people said unto Saul, Shall Jonathan die, who hath wrought this great salvation in Yashar''el (Israel)? Elohim (God) forbid: as Yahuah (LORD) liveth, there shall not one hair of his head fall to the ground; for he hath wrought with Elohim (God) this day. So the people rescued Jonathan, that he died not.* (1 Samuel 14:45). The oath that delivered Jonathan — *there shall not one hair of his head fall to the ground* — is the very pledge Paul gives the whole ship: *there shall not an hair fall from the head of any of you* (Acts 27:34). The hair-of-the-head is the token of the whole life kept; not one is lost.'),
  ('canon', 'acts', 27, 34, 'canon', '2-samuel', 14, 11, 'free', E'*Then said she, I pray thee, let the king remember Yahuah Elohayka (the LORD thy God), that thou wouldest not suffer the revengers of blood to destroy any more, lest they destroy my son. And he said, As Yahuah (LORD) liveth, there shall not one hair of thy son fall to the earth.* (2 Samuel 14:11). The king''s pledge of preservation — *there shall not one hair of thy son fall to the earth* — is the same word of keeping Paul speaks over the two hundred threescore and sixteen: *there shall not an hair fall from the head of any of you* (Acts 27:34). The not-a-hair-lost is the surety of a life wholly preserved.'),
  ('canon', 'acts', 27, 34, 'canon', 'luke', 21, 18, 'free', E'*But there shall not an hair of your head perish.* (Luke 21:18). The Master''s promise to his own in the midst of hatred and peril — *there shall not an hair of your head perish* — is the very assurance Paul carries onto the breaking ship: *there shall not an hair fall from the head of any of you* (Acts 27:34). The keeping that holds through betrayal and tribulation holds also through the tempest; the preservation of the appointed is to the last hair.'),
  -- thread: acts-27-he-took-bread-and-gave-thanks-in-presence-of-them-all-and-brake-it
  ('canon', 'acts', 27, 35, 'canon', 'luke', 22, 19, 'free', E'*And he took bread, and gave thanks, and brake it, and gave unto them, saying, This is my body which is given for you: this do in remembrance of me.* (Luke 22:19). The Master took bread, gave thanks, and brake it at the table; and now on the foundering ship Paul does the same in the sight of all: *he took bread, and gave thanks to Elohim (God) in presence of them all: and when he had broken it, he began to eat* (Acts 27:35). The witness''s table is set in the storm — the blessing and the breaking before two hundred threescore and sixteen souls, the giving of thanks that names who keeps them.'),
  ('canon', 'acts', 27, 35, 'canon', 'luke', 24, 30, 'free', E'*And it came to pass, as he sat at meat with them, he took bread, and blessed it, and brake, and gave to them.* (Luke 24:30). At Emmaus the Master was known in the taking, blessing, and breaking of bread; so on the ship the same fourfold act marks the witness: *he took bread, and gave thanks to Elohim (God) in presence of them all: and when he had broken it, he began to eat* (Acts 27:35). The breaking of bread with thanksgiving is the sign of the One who keeps the table even on the deep.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s217_a27_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a27_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-27-the-angel-of-god-stood-by-me-fear-not-thou-must-be-brought-to-caesar',
       E'The angel of Elohim (God) stood by me — Fear not, thou must be brought before Cæsar',
       E'When all hope of being saved is taken away, Paul stands forth in the midst of the ship: *there stood by me this night the angel of Elohim (God), whose I am, and whom I serve, Saying, Fear not, Paul; thou must be brought before Cæsar: and, lo, Elohim (God) hath given thee all them that sail with thee* (Acts 27:23-24). This is the keeping of an earlier word made good. In the castle at Yerushalayim the Master himself had stood by him: *the night following Yahuah (Lord) stood by him, and said, Be of good cheer, Paul: for as thou hast testified of me in Jerusalem, so must thou bear witness also at Rome* (Acts 23:11). The sending to Rome cannot fail; so the messenger of Elohim (God) is sent to keep the servant through the tempest the whole length of the journey to its appointed witness. It is the same keeping the older library names — the angel of Yahuah (God) sent to walk the road with the traveller and bring him home: *Yahuah (God), which dwells in heaven, prosper your journey, and the angel of Yahuah (God) keep you company* (Tobit 5:16), *for the good angel will keep him company, and his journey shall be prosperous, and he shall return safe* (Tobit 5:21). The angel keeps the journey; the appointed one, and all given to him, come safe through. *I believe Elohim (God), that it shall be even as it was told me* (Acts 27:25).',
       sv.verse_id, ev.verse_id, 'extras', 5925
  FROM _s217_a27_lookup sv, _s217_a27_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=27 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=27 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-27-given-thee-all-them-that-sail-with-thee-the-ship-saved-for-the-righteous',
       E'Given thee all them that sail with thee — the ship saved for the righteous one''s sake',
       E'The word of the angel does not save Paul only: *lo, Elohim (God) hath given thee all them that sail with thee* (Acts 27:24), *there shall be no loss of any man''s life among you, but of the ship* (Acts 27:22). The whole company — two hundred threescore and sixteen souls — is preserved for the sake of the one whom Elohim (God) is bringing before Cæsar. This is the pattern Abraham pressed before Yahuah (LORD) at the oaks of Mamre: *If I find in Sodom fifty righteous within the city, then I will spare all the place for their sakes* (Genesis 18:26), down to *I will not destroy it for ten''s sake* (Genesis 18:32). The presence of the righteous preserves the place; the presence of the appointed witness preserves the ship. And so it is made good on the shore — the ship breaks, but *the centurion, willing to save Paul, kept them from their purpose* (Acts 27:43), *and so it came to pass, that they escaped all safe to land* (Acts 27:44). Not one of the many is lost; all are kept for the sake of the one.',
       sv.verse_id, ev.verse_id, 'free', 5928
  FROM _s217_a27_lookup sv, _s217_a27_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=27 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=27 AND ev.verse_number=44
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-27-all-hope-taken-away-the-stormy-wind-he-raiseth-and-the-storm-he-stilleth',
       E'All hope taken away — the stormy wind he raiseth, and the storm he stilleth',
       E'For many days no sun nor stars appear, and the tempest beats on the ship until *all hope that we should be saved was then taken away* (Acts 27:20). The Psalm of them that go down to the sea in ships names every part of it. The storm itself is no chance: *he commandeth, and raiseth the stormy wind, which lifteth up the waves thereof* (Psalm 107:25). The wits''-end is named exactly: *they reel to and fro, and stagger like a drunken man, and are at their wits'' end* (Psalm 107:27). And so is the deliverance: *Then they cry unto Yahuah (LORD) in their trouble, and he bringeth them out of their distresses* (Psalm 107:28); *he maketh the storm a calm, so that the waves thereof are still* (Psalm 107:29); *so he bringeth them unto their desired haven* (Psalm 107:30). The sea obeys him who made it — as at Joppa, *Yahuah (LORD) sent out a great wind into the sea, and there was a mighty tempest in the sea, so that the ship was like to be broken* (Jonah 1:4), and the mariners *cast forth the wares that were in the ship into the sea, to lighten it* (Jonah 1:5), as these on the way to Rome *lightened the ship* (Acts 27:18) and at the last *cast out the wheat into the sea* (Acts 27:38). The men throw the cargo overboard to live; but the deliverance, when it comes, is by the keeping word of Elohim (God) — the same Yahuah (LORD) who raises the stormy wind is the One whose angel stands by to bring the ship through it.',
       sv.verse_id, ev.verse_id, 'free', 5931
  FROM _s217_a27_lookup sv, _s217_a27_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=27 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=27 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-27-there-shall-not-an-hair-fall-from-the-head-of-any-of-you',
       E'There shall not an hair fall from the head of any of you',
       E'As the day comes on, Paul presses them all to take meat, and seals it with a pledge of total preservation: *for this is for your health: for there shall not an hair fall from the head of any of you* (Acts 27:34). It is the oath-language of deliverance the older Scriptures already carry. When the people would not let Jonathan die for breaking an unwitting vow, they swore: *as Yahuah (LORD) liveth, there shall not one hair of his head fall to the ground; for he hath wrought with Elohim (God) this day. So the people rescued Jonathan, that he died not* (1 Samuel 14:45). When the woman of Tekoah pleaded for her son''s life, the king swore: *As Yahuah (LORD) liveth, there shall not one hair of thy son fall to the earth* (2 Samuel 14:11). And the Master gave the same surety to his own in the midst of hatred and peril: *But there shall not an hair of your head perish* (Luke 21:18). The hair of the head is the token of the whole life kept — not one of the two hundred threescore and sixteen lost. The keeping that holds through betrayal and tribulation holds also through the tempest, to the very last hair.',
       sv.verse_id, ev.verse_id, 'free', 5934
  FROM _s217_a27_lookup sv, _s217_a27_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=27 AND sv.verse_number=33
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=27 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-27-he-took-bread-and-gave-thanks-in-presence-of-them-all-and-brake-it',
       E'He took bread, and gave thanks in presence of them all, and brake it',
       E'On the foundering ship, before two hundred threescore and sixteen souls, Paul does what the Master did at the table: *he took bread, and gave thanks to Elohim (God) in presence of them all: and when he had broken it, he began to eat* (Acts 27:35). The fourfold act is the Master''s own. At the last supper *he took bread, and gave thanks, and brake it, and gave unto them, saying, This is my body which is given for you: this do in remembrance of me* (Luke 22:19). At Emmaus he was known in the doing of it: *as he sat at meat with them, he took bread, and blessed it, and brake, and gave to them* (Luke 24:30). The witness''s table is set in the storm — the taking, the thanksgiving, the breaking, in the sight of all — and the giving of thanks names openly who it is that keeps them. *Then were they all of good cheer, and they also took some meat* (Acts 27:36). The blessing and the breaking of bread is the sign of the One who keeps the table even on the deep.',
       sv.verse_id, ev.verse_id, 'free', 5937
  FROM _s217_a27_lookup sv, _s217_a27_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=27 AND sv.verse_number=35
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=27 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: acts-27-the-angel-of-god-stood-by-me-fear-not-thou-must-be-brought-to-caesar
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 23:11 — *Yahuah (Lord) stood by him … so must thou bear witness also at Rome* the sending the angel now keeps good through the tempest (Acts 27:23-24).'
  FROM cross_reference_threads t, cross_references x, _s217_a27_lookup sv, _s217_a27_lookup tv
 WHERE t.slug='acts-27-the-angel-of-god-stood-by-me-fear-not-thou-must-be-brought-to-caesar'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=27 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=23 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Tobit 5:16 — *the angel of Yahuah (God) keep you company* the messenger sent to guard the journey, as the angel of Elohim (God) keeps Paul on the sea (Acts 27:23).'
  FROM cross_reference_threads t, cross_references x, _s217_a27_lookup sv, _s217_a27_lookup tv
 WHERE t.slug='acts-27-the-angel-of-god-stood-by-me-fear-not-thou-must-be-brought-to-caesar'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=27 AND sv.verse_number=23
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=5 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Tobit 5:21 — *the good angel will keep him company … and he shall return safe* the keeping that brings the appointed one and those given him safe through (Acts 27:24,44).'
  FROM cross_reference_threads t, cross_references x, _s217_a27_lookup sv, _s217_a27_lookup tv
 WHERE t.slug='acts-27-the-angel-of-god-stood-by-me-fear-not-thou-must-be-brought-to-caesar'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=27 AND sv.verse_number=24
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=5 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-27-given-thee-all-them-that-sail-with-thee-the-ship-saved-for-the-righteous
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 18:26 — *I will spare all the place for their sakes* the whole place spared for the righteous; the ship spared for the one Elohim (God) brings before Cæsar (Acts 27:24).'
  FROM cross_reference_threads t, cross_references x, _s217_a27_lookup sv, _s217_a27_lookup tv
 WHERE t.slug='acts-27-given-thee-all-them-that-sail-with-thee-the-ship-saved-for-the-righteous'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=27 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 18:32 — *I will not destroy it for ten''s sake* the many withheld from destruction for the sake of a few righteous, as no life is lost but the ship (Acts 27:22,24).'
  FROM cross_reference_threads t, cross_references x, _s217_a27_lookup sv, _s217_a27_lookup tv
 WHERE t.slug='acts-27-given-thee-all-them-that-sail-with-thee-the-ship-saved-for-the-righteous'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=27 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 18:26 — *spare all the place for their sakes* made good on the shore: *they escaped all safe to land* — none of the 276 lost for the one''s sake (Acts 27:44).'
  FROM cross_reference_threads t, cross_references x, _s217_a27_lookup sv, _s217_a27_lookup tv
 WHERE t.slug='acts-27-given-thee-all-them-that-sail-with-thee-the-ship-saved-for-the-righteous'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=27 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-27-all-hope-taken-away-the-stormy-wind-he-raiseth-and-the-storm-he-stilleth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 107:25 — *he commandeth, and raiseth the stormy wind* the Euroclydon is in his hand, the tempest under which all hope was taken away (Acts 27:20).'
  FROM cross_reference_threads t, cross_references x, _s217_a27_lookup sv, _s217_a27_lookup tv
 WHERE t.slug='acts-27-all-hope-taken-away-the-stormy-wind-he-raiseth-and-the-storm-he-stilleth'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=27 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=107 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 107:27 — *they … are at their wits'' end* the wits''-end of the tempest where his deliverance meets the ship and brings to the desired haven (Acts 27:20).'
  FROM cross_reference_threads t, cross_references x, _s217_a27_lookup sv, _s217_a27_lookup tv
 WHERE t.slug='acts-27-all-hope-taken-away-the-stormy-wind-he-raiseth-and-the-storm-he-stilleth'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=27 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=107 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jonah 1:4 — *Yahuah (LORD) sent out a great wind into the sea … the ship was like to be broken* the sea in his hand, the tempest that threatens the ship (Acts 27:18).'
  FROM cross_reference_threads t, cross_references x, _s217_a27_lookup sv, _s217_a27_lookup tv
 WHERE t.slug='acts-27-all-hope-taken-away-the-stormy-wind-he-raiseth-and-the-storm-he-stilleth'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=27 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jonah 1:5 — *cast forth the wares that were in the ship into the sea, to lighten it* the mariners lighten the ship, as these *lightened the ship* and cast out the wheat (Acts 27:18,38).'
  FROM cross_reference_threads t, cross_references x, _s217_a27_lookup sv, _s217_a27_lookup tv
 WHERE t.slug='acts-27-all-hope-taken-away-the-stormy-wind-he-raiseth-and-the-storm-he-stilleth'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=27 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=1 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-27-there-shall-not-an-hair-fall-from-the-head-of-any-of-you
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Samuel 14:45 — *there shall not one hair of his head fall to the ground* the oath that rescued Jonathan; the token of the whole life kept (Acts 27:34).'
  FROM cross_reference_threads t, cross_references x, _s217_a27_lookup sv, _s217_a27_lookup tv
 WHERE t.slug='acts-27-there-shall-not-an-hair-fall-from-the-head-of-any-of-you'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=27 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=14 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Samuel 14:11 — *there shall not one hair of thy son fall to the earth* the king''s pledge of preservation, the same not-a-hair-lost surety (Acts 27:34).'
  FROM cross_reference_threads t, cross_references x, _s217_a27_lookup sv, _s217_a27_lookup tv
 WHERE t.slug='acts-27-there-shall-not-an-hair-fall-from-the-head-of-any-of-you'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=27 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=14 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 21:18 — *there shall not an hair of your head perish* the Master''s keeping through tribulation, holding also through the tempest (Acts 27:34).'
  FROM cross_reference_threads t, cross_references x, _s217_a27_lookup sv, _s217_a27_lookup tv
 WHERE t.slug='acts-27-there-shall-not-an-hair-fall-from-the-head-of-any-of-you'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=27 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=21 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-27-he-took-bread-and-gave-thanks-in-presence-of-them-all-and-brake-it
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Luke 22:19 — *he took bread, and gave thanks, and brake it, and gave unto them* the Master''s table; Paul does the same in the sight of all on the ship (Acts 27:35).'
  FROM cross_reference_threads t, cross_references x, _s217_a27_lookup sv, _s217_a27_lookup tv
 WHERE t.slug='acts-27-he-took-bread-and-gave-thanks-in-presence-of-them-all-and-brake-it'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=27 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=22 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 24:30 — *he took bread, and blessed it, and brake, and gave to them* the Emmaus breaking by which the Master was known, the same fourfold act on the deep (Acts 27:35).'
  FROM cross_reference_threads t, cross_references x, _s217_a27_lookup sv, _s217_a27_lookup tv
 WHERE t.slug='acts-27-he-took-bread-and-gave-thanks-in-presence-of-them-all-and-brake-it'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=27 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
