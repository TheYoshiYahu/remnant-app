-- ----- fragment: minion_jubilees_33.sql (session251 jubilees 33) -----
-- Source anchor: jubilees/jubilees ch33. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju33 (view _session251_ju33_lookup). Sort band base 53800, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju33_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-33-reuben-bilhah
  ('jubilees', 'jubilees', 33, 2, 'canon', 'genesis', 35, 22, 'free', E'Genesis 35:22 — *And it came to pass, when Yashar''el (Israel) dwelt in that land, that Reuben went and lay with Bilhah his father''s concubine: and Yashar''el (Israel) heard it. Now the sons of Jacob were twelve:* The one line Genesis gives Reuben''s sin, Jubilees 33:2-4 unfolds in the same order.'),
  ('jubilees', 'jubilees', 33, 9, 'canon', 'genesis', 49, 3, 'free', E'Genesis 49:3 — *Reuben, thou art my firstborn, my might, and the beginning of my strength, the excellency of dignity, and the excellency of power:* Jacob names what Reuben was before naming what his sin against Bilhah (Jubilees 33:9) cost him.'),
  ('jubilees', 'jubilees', 33, 9, 'canon', 'genesis', 49, 4, 'free', E'Genesis 49:4 — *Unstable as water, thou shalt not excel; because thou wentest up to thy father''s bed; then defiledst thou it: he went up to my couch.* The forfeited birthright that Jubilees 33:9 (''Jacob did not approach her again because Reuben had defiled her'') sets up.'),
  -- thread: jubilees-33-fathers-skirt-tablets
  ('jubilees', 'jubilees', 33, 10, 'canon', 'leviticus', 18, 8, 'free', E'Leviticus 18:8 — *The nakedness of thy father''s wife shalt thou not uncover: it is thy father''s nakedness.* The Sinai statute that Jubilees 33:10 says was already written and ordained on the heavenly tablets.'),
  ('jubilees', 'jubilees', 33, 10, 'canon', 'leviticus', 20, 11, 'free', E'Leviticus 20:11 — *And the man that lieth with his father''s wife hath uncovered his father''s nakedness: both of them shall surely be put to death; their blood shall be upon them.* The death sentence on both parties that Jubilees 33:10 pronounces (''they shall surely die together'').'),
  ('jubilees', 'jubilees', 33, 11, 'canon', 'deuteronomy', 27, 20, 'free', E'Deuteronomy 27:20 — *Cursed be he that lieth with his father''s wife; because he uncovereth his father''s skirt. And all the people shall say, Amen.* The very ''second time'' curse Jubilees 33:11 quotes, with the people''s answering ''So be it; so be it.'''),
  -- thread: jubilees-33-before-it-was-revealed
  ('jubilees', 'jubilees', 33, 16, 'canon', 'deuteronomy', 22, 30, 'free', E'Deuteronomy 22:30 — *A man shall not take his father''s wife, nor discover his father''s skirt.* The everlasting law Jubilees 33:16 says was revealed ''in your days'' though written long before.'),
  ('jubilees', 'jubilees', 33, 16, 'canon', 'psalms', 139, 16, 'free', E'Psalm 139:16 — *Thine eyes did see my substance, yet being unperfect; and in thy book all my members were written, which in continuance were fashioned, when as yet there was none of them.* The heavenly book that pre-writes what Jubilees 33:16 calls the law ''written'' before it was revealed.'),
  ('jubilees', 'jubilees', 33, 16, 'canon', 'malachi', 3, 16, 'free', E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* The same engraved-before-it-unfolds principle Jubilees 33:16 names as the everlasting law for everlasting generations.'),
  -- thread: jubilees-33-fornication-not-named
  ('jubilees', 'jubilees', 33, 20, 'canon', '1-corinthians', 5, 1, 'free', E'1 Corinthians 5:1 — *It is reported commonly that there is fornication among you, and such fornication as is not so much as named among the Gentiles, that one should have his father''s wife.* Paul names the very sin of Jubilees 33 — a man with his father''s wife — as the fornication ''not named among the nations.'''),
  -- thread: jubilees-33-holy-royal-priestly-nation
  ('jubilees', 'jubilees', 33, 20, 'canon', 'exodus', 19, 6, 'free', E'Exodus 19:6 — *And ye shall be unto me a kingdom of priests, and an holy nation. These are the words which thou shalt speak unto the children of Yashar''el (Israel).* The Sinai charter behind Jubilees 33:20''s ''priestly and royal nation.'''),
  ('jubilees', 'jubilees', 33, 20, 'canon', 'leviticus', 20, 26, 'free', E'Leviticus 20:26 — *And ye shall be holy unto me: for I Yahuah (LORD) am holy, and have severed you from other people, that ye should be mine.* The severing-unto-holiness that makes the uncleanness of Jubilees 33:20 intolerable in the camp.'),
  ('jubilees', 'jubilees', 33, 20, 'canon', 'deuteronomy', 7, 6, 'free', E'Deuteronomy 7:6 — *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* The election Jubilees 33:20 invokes as ''a nation of inheritance... for His own possession.'''),
  ('jubilees', 'jubilees', 33, 20, 'canon', '1-peter', 2, 9, 'free', E'1 Peter 2:9 — *But ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people; that ye should shew forth the praises of him who hath called you out of darkness into his marvellous light:* Peter carries Jubilees 33:20''s ''priestly and royal nation'' forward unbroken into the assembly.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju33_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju33_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-33-reuben-bilhah',
       E'Reuben and Bilhah — he went up to his father''s bed',
       E'Jubilees tells the same shameful thing Genesis records in a single verse: *And Reuben saw Bilhah, Rachel''s maid, the concubine of his father, bathing in water in a secret place, and he loved her* (Jubilees 33:2), and *he lay with her... and Jacob did not approach her again because Reuben had defiled her* (Jubilees 33:4, 9). This is Genesis spoken plainly — *And it came to pass, when Yashar''el (Israel) dwelt in that land, that Reuben went and lay with Bilhah his father''s concubine: and Yashar''el (Israel) heard it* (Genesis 35:22). And the cost of it falls on Reuben''s deathbed blessing: he was *my firstborn, my might, and the beginning of my strength* (Genesis 49:3), yet *Unstable as water, thou shalt not excel; because thou wentest up to thy father''s bed* (Genesis 49:4). The firstborn forfeits the birthright by this sin — Jubilees and Genesis testify as one witness. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53800
  FROM _session251_ju33_lookup sv, _session251_ju33_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=33 AND sv.verse_number=2
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=33 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-33-fathers-skirt-tablets',
       E'The law on the heavenly tablets — a man and his father''s wife',
       E'Jubilees grounds the prohibition not at Sinai but on the heavenly tablets, before the mountain ever smoked: *For this reason it is written and ordained on the heavenly tables that a man should not lie with his father''s wife, and should not uncover his father''s skirt... they shall surely die together, the man who lies with his father''s wife and the woman also* (Jubilees 33:10). That is Leviticus word for word — *The nakedness of thy father''s wife shalt thou not uncover: it is thy father''s nakedness* (Leviticus 18:8), and the sentence: *And the man that lieth with his father''s wife hath uncovered his father''s nakedness: both of them shall surely be put to death; their blood shall be upon them* (Leviticus 20:11). Jubilees even cites the curse ''a second time'' — *Cursed be he that lieth with his father''s wife; because he uncovereth his father''s skirt. And all the people shall say, Amen* (Deuteronomy 27:20). The Torah is older than Sinai; Jubilees says the holy ones answered ''So be it; so be it.'' It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53803
  FROM _session251_ju33_lookup sv, _session251_ju33_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=33 AND sv.verse_number=10
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=33 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-33-before-it-was-revealed',
       E'Why Reuben lived — the law not yet revealed in its completeness',
       E'Jubilees faces the obvious objection — Reuben was not stoned — and answers it: *until that time there had not been revealed the ordinance and judgment and law in its completeness for all, but in your days (it has been revealed) as a law of seasons and of days, and an everlasting law for the everlasting generations* (Jubilees 33:16). The statute itself is eternal; only its public revelation comes ''in your days.'' This is the heavenly-tablets framework: the law was written before it was given. *A man shall not take his father''s wife, nor discover his father''s skirt* (Deuteronomy 22:30) — the same word Jubilees forbids. And the tablets behind it are the books of remembrance: *in thy book all my members were written, which in continuance were fashioned, when as yet there was none of them* (Psalm 139:16), and *a book of remembrance was written before him for them that feared Yahuah (LORD)* (Malachi 3:16). The Torah did not begin at Sinai; it was unsealed there. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53806
  FROM _session251_ju33_lookup sv, _session251_ju33_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=33 AND sv.verse_number=13
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=33 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-33-fornication-not-named',
       E'No greater sin — the fornication not named among the nations',
       E'Jubilees weighs the sin: *there is no greater sin than the fornication which they commit on earth; for Yashar''el (Israel) is a holy nation to Yahuah (God) its Elohim (God)... and there shall no such uncleanness appear in the midst of the holy nation* (Jubilees 33:20). Paul names the identical sin in Corinth and judges it by the same standard: *It is reported commonly that there is fornication among you, and such fornication as is not so much as named among the Gentiles, that one should have his father''s wife* (1 Corinthians 5:1). The man-with-his-father''s-wife of Jubilees 33 is precisely the case Paul will not tolerate in the assembly — because the set-apart people carry the heavenly-tablets law. Genesis, Jubilees, and Paul testify to one Torah. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53809
  FROM _session251_ju33_lookup sv, _session251_ju33_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=33 AND sv.verse_number=19
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=33 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-33-holy-royal-priestly-nation',
       E'A priestly and royal nation — the election that precedes the law',
       E'The reason no such uncleanness may stand in Israel is election: *Yashar''el (Israel) is a holy nation to Yahuah (God) its Elohim (God), and a nation of inheritance, and a priestly and royal nation and for (His own) possession* (Jubilees 33:20). This is Sinai''s charter — *And ye shall be unto me a kingdom of priests, and an holy nation* (Exodus 19:6) — and the ground of the separation: *And ye shall be holy unto me: for I Yahuah (LORD) am holy, and have severed you from other people, that ye should be mine* (Leviticus 20:26). Moses says it plainly: *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself* (Deuteronomy 7:6). And Peter carries the whole charter forward unbroken: *But ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people* (1 Peter 2:9). Election precedes confession; the holy nation keeps the holy law. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53812
  FROM _session251_ju33_lookup sv, _session251_ju33_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=33 AND sv.verse_number=20
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=33 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-33-reuben-bilhah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 35:22 — *And it came to pass, when Yashar''el (Israel) dwelt in that land, that Reuben went and lay with Bilhah his father''s concubine: and Yashar''el (Israel) heard it. Now the sons of Jacob were twelve:* The one line Genesis gives Reuben''s sin, Jubilees 33:2-4 unfolds in the same order.'
  FROM cross_reference_threads t, cross_references x, _session251_ju33_lookup sv, _session251_ju33_lookup tv
 WHERE t.slug='jubilees-33-reuben-bilhah'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=33 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 49:3 — *Reuben, thou art my firstborn, my might, and the beginning of my strength, the excellency of dignity, and the excellency of power:* Jacob names what Reuben was before naming what his sin against Bilhah (Jubilees 33:9) cost him.'
  FROM cross_reference_threads t, cross_references x, _session251_ju33_lookup sv, _session251_ju33_lookup tv
 WHERE t.slug='jubilees-33-reuben-bilhah'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=33 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 49:4 — *Unstable as water, thou shalt not excel; because thou wentest up to thy father''s bed; then defiledst thou it: he went up to my couch.* The forfeited birthright that Jubilees 33:9 (''Jacob did not approach her again because Reuben had defiled her'') sets up.'
  FROM cross_reference_threads t, cross_references x, _session251_ju33_lookup sv, _session251_ju33_lookup tv
 WHERE t.slug='jubilees-33-reuben-bilhah'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=33 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-33-fathers-skirt-tablets
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 18:8 — *The nakedness of thy father''s wife shalt thou not uncover: it is thy father''s nakedness.* The Sinai statute that Jubilees 33:10 says was already written and ordained on the heavenly tablets.'
  FROM cross_reference_threads t, cross_references x, _session251_ju33_lookup sv, _session251_ju33_lookup tv
 WHERE t.slug='jubilees-33-fathers-skirt-tablets'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=33 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=18 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 20:11 — *And the man that lieth with his father''s wife hath uncovered his father''s nakedness: both of them shall surely be put to death; their blood shall be upon them.* The death sentence on both parties that Jubilees 33:10 pronounces (''they shall surely die together'').'
  FROM cross_reference_threads t, cross_references x, _session251_ju33_lookup sv, _session251_ju33_lookup tv
 WHERE t.slug='jubilees-33-fathers-skirt-tablets'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=33 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=20 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 27:20 — *Cursed be he that lieth with his father''s wife; because he uncovereth his father''s skirt. And all the people shall say, Amen.* The very ''second time'' curse Jubilees 33:11 quotes, with the people''s answering ''So be it; so be it.'''
  FROM cross_reference_threads t, cross_references x, _session251_ju33_lookup sv, _session251_ju33_lookup tv
 WHERE t.slug='jubilees-33-fathers-skirt-tablets'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=33 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=27 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-33-before-it-was-revealed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 22:30 — *A man shall not take his father''s wife, nor discover his father''s skirt.* The everlasting law Jubilees 33:16 says was revealed ''in your days'' though written long before.'
  FROM cross_reference_threads t, cross_references x, _session251_ju33_lookup sv, _session251_ju33_lookup tv
 WHERE t.slug='jubilees-33-before-it-was-revealed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=33 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=22 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 139:16 — *Thine eyes did see my substance, yet being unperfect; and in thy book all my members were written, which in continuance were fashioned, when as yet there was none of them.* The heavenly book that pre-writes what Jubilees 33:16 calls the law ''written'' before it was revealed.'
  FROM cross_reference_threads t, cross_references x, _session251_ju33_lookup sv, _session251_ju33_lookup tv
 WHERE t.slug='jubilees-33-before-it-was-revealed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=33 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* The same engraved-before-it-unfolds principle Jubilees 33:16 names as the everlasting law for everlasting generations.'
  FROM cross_reference_threads t, cross_references x, _session251_ju33_lookup sv, _session251_ju33_lookup tv
 WHERE t.slug='jubilees-33-before-it-was-revealed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=33 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-33-fornication-not-named
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Corinthians 5:1 — *It is reported commonly that there is fornication among you, and such fornication as is not so much as named among the Gentiles, that one should have his father''s wife.* Paul names the very sin of Jubilees 33 — a man with his father''s wife — as the fornication ''not named among the nations.'''
  FROM cross_reference_threads t, cross_references x, _session251_ju33_lookup sv, _session251_ju33_lookup tv
 WHERE t.slug='jubilees-33-fornication-not-named'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=33 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-33-holy-royal-priestly-nation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 19:6 — *And ye shall be unto me a kingdom of priests, and an holy nation. These are the words which thou shalt speak unto the children of Yashar''el (Israel).* The Sinai charter behind Jubilees 33:20''s ''priestly and royal nation.'''
  FROM cross_reference_threads t, cross_references x, _session251_ju33_lookup sv, _session251_ju33_lookup tv
 WHERE t.slug='jubilees-33-holy-royal-priestly-nation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=33 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 20:26 — *And ye shall be holy unto me: for I Yahuah (LORD) am holy, and have severed you from other people, that ye should be mine.* The severing-unto-holiness that makes the uncleanness of Jubilees 33:20 intolerable in the camp.'
  FROM cross_reference_threads t, cross_references x, _session251_ju33_lookup sv, _session251_ju33_lookup tv
 WHERE t.slug='jubilees-33-holy-royal-priestly-nation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=33 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=20 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 7:6 — *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* The election Jubilees 33:20 invokes as ''a nation of inheritance... for His own possession.'''
  FROM cross_reference_threads t, cross_references x, _session251_ju33_lookup sv, _session251_ju33_lookup tv
 WHERE t.slug='jubilees-33-holy-royal-priestly-nation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=33 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Peter 2:9 — *But ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people; that ye should shew forth the praises of him who hath called you out of darkness into his marvellous light:* Peter carries Jubilees 33:20''s ''priestly and royal nation'' forward unbroken into the assembly.'
  FROM cross_reference_threads t, cross_references x, _session251_ju33_lookup sv, _session251_ju33_lookup tv
 WHERE t.slug='jubilees-33-holy-royal-priestly-nation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=33 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

