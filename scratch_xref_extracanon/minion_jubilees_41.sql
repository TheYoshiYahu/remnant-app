-- ----- fragment: minion_jubilees_41.sql (session251 jubilees 41) -----
-- Source anchor: jubilees/jubilees ch41. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju41 (view _session251_ju41_lookup). Sort band base 54000, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju41_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-41-er-and-onan-slain
  ('jubilees', 'jubilees', 41, 1, 'canon', 'genesis', 38, 6, 'free', E'Genesis 38:6 — *And Yahudah (Judah) took a wife for Er his firstborn, whose name was Tamar.* The same marriage that opens Jubilees 41:1 opens the Genesis source.'),
  ('jubilees', 'jubilees', 41, 3, 'canon', 'genesis', 38, 7, 'free', E'Genesis 38:7 — *And Er, Yahudah''s (Judah’s) firstborn, was wicked in the sight of Yahuah (LORD); and Yahuah (LORD) slew him.* Jubilees 41:3 quotes the verdict on Er almost word for word.'),
  ('jubilees', 'jubilees', 41, 4, 'canon', 'genesis', 38, 8, 'free', E'Genesis 38:8 — *And Yahudah (Judah) said unto Onan, Go in unto thy brother’s wife, and marry her, and raise up seed to thy brother.* The levirate charge in Jubilees 41:4 is the same charge Judah gives in Genesis.'),
  ('jubilees', 'jubilees', 41, 5, 'canon', 'genesis', 38, 10, 'free', E'Genesis 38:10 — *And the thing which he did displeased Yahuah (LORD): wherefore he slew him also.* Onan''s death in Jubilees 41:5 matches Genesis exactly.'),
  ('jubilees', 'jubilees', 41, 4, 'canon', 'deuteronomy', 25, 5, 'free', E'Deuteronomy 25:5 — *If brethren dwell together, and one of them die, and have no child, the wife of the dead shall not marry without unto a stranger: her husband’s brother shall go in unto her, and take her to him to wife, and perform the duty of an husband’s brother unto her.* The duty Judah lays on Onan in Jubilees 41:4 is the Torah''s own levirate ordinance.'),
  -- thread: jubilees-41-tamar-withheld-and-the-veil
  ('jubilees', 'jubilees', 41, 6, 'canon', 'genesis', 38, 11, 'free', E'Genesis 38:11 — *Then said Yahudah (Judah) to Tamar his daughter in law, Remain a widow at thy father’s house, till Shelah my son be grown: for he said, Lest peradventure he die also, as his brethren did. And Tamar went and dwelt in her father’s house.* Judah''s word to Tamar in Jubilees 41:6 is the same withholding.'),
  ('jubilees', 'jubilees', 41, 9, 'canon', 'genesis', 38, 14, 'free', E'Genesis 38:14 — *And she put her widow’s garments off from her, and covered her with a vail, and wrapped herself, and sat in an open place, which is by the way to Timnath; for she saw that Shelah was grown, and she was not given unto him to wife.* The veil and the wayside seat of Jubilees 41:9 are drawn straight from Genesis.'),
  ('jubilees', 'jubilees', 41, 11, 'canon', 'genesis', 38, 18, 'free', E'Genesis 38:18 — *And he said, What pledge shall I give thee? And she said, Thy signet, and thy bracelets, and thy staff that is in thine hand. And he gave it her, and came in unto her, and she conceived by him.* The ring, necklace, and staff of Jubilees 41:11 are the signet, bracelets, and staff of Genesis.'),
  ('jubilees', 'jubilees', 41, 6, 'canon', 'leviticus', 18, 15, 'free', E'Leviticus 18:15 — *Thou shalt not uncover the nakedness of thy daughter in law: she is thy son’s wife; thou shalt not uncover her nakedness.* Tamar is named Judah''s daughter-in-law in Jubilees 41:6 — the very relation Torah forbids.'),
  -- thread: jubilees-41-she-is-more-righteous-than-i
  ('jubilees', 'jubilees', 41, 16, 'canon', 'genesis', 38, 24, 'free', E'Genesis 38:24 — *And it came to pass about three months after, that it was told Yahudah (Judah), saying, Tamar thy daughter in law hath played the harlot; and also, behold, she is with child by whoredom. And Yahudah (Judah) said, Bring her forth, and let her be burnt.* The three-month report and the sentence of burning in Jubilees 41:16 are Genesis.'),
  ('jubilees', 'jubilees', 41, 18, 'canon', 'genesis', 38, 25, 'free', E'Genesis 38:25 — *When she was brought forth, she sent to her father in law, saying, By the man, whose these are, am I with child: and she said, Discern, I pray thee, whose are these, the signet, and bracelets, and staff.* Tamar''s sending of the pledge in Jubilees 41:18 matches Genesis word for word.'),
  ('jubilees', 'jubilees', 41, 19, 'canon', 'genesis', 38, 26, 'free', E'Genesis 38:26 — *And Yahudah (Judah) acknowledged them, and said, She hath been more righteous than I; because that I gave her not to Shelah my son. And he knew her again no more.* Judah''s “Tamar is more righteous than I am” in Jubilees 41:19 is the very confession of Genesis.'),
  ('jubilees', 'jubilees', 41, 21, 'canon', 'genesis', 38, 29, 'free', E'Genesis 38:29 — *And it came to pass, as he drew back his hand, that, behold, his brother came out: and she said, How hast thou broken forth? this breach be upon thee: therefore his name was called Pharez.* The birth of Perez in Jubilees 41:21 is the breach-birth of Genesis.'),
  -- thread: jubilees-41-the-messianic-seed-through-perez
  ('jubilees', 'jubilees', 41, 21, 'canon', 'matthew', 1, 3, 'free', E'Matthew 1:3 — *And Judas begat Phares and Zara of Thamar; and Phares begat Esrom; and Esrom begat Aram;* The Perez and Zerah born in Jubilees 41:21 stand by Tamar''s name in the genealogy of the Messiah.'),
  ('jubilees', 'jubilees', 41, 21, 'canon', 'ruth', 4, 12, 'free', E'Ruth 4:12 — *And let thy house be like the house of Pharez, whom Tamar bare unto Yahudah (Judah), of the seed which Yahuah (LORD) shall give thee of this young woman.* The Pharez of Jubilees 41:21 becomes Israel''s blessing-name for a fruitful house.'),
  ('jubilees', 'jubilees', 41, 21, 'canon', 'ruth', 4, 18, 'free', E'Ruth 4:18 — *Now these are the generations of Pharez: Pharez begat Hezron,* The genealogy to David opens with the Perez born in Jubilees 41:21.'),
  ('jubilees', 'jubilees', 41, 26, 'canon', 'ruth', 4, 17, 'free', E'Ruth 4:17 — *And the women her neighbours gave it a name, saying, There is a son born to Naomi; and they called his name Obed: he is the father of Jesse, the father of David.* The seed “not rooted out” in Jubilees 41:26 runs through Perez down to David.'),
  -- thread: jubilees-41-judahs-repentance-and-forgiveness
  ('jubilees', 'jubilees', 41, 23, 'canon', 'leviticus', 18, 15, 'free', E'Leviticus 18:15 — *Thou shalt not uncover the nakedness of thy daughter in law: she is thy son’s wife; thou shalt not uncover her nakedness.* The transgression Judah laments in Jubilees 41:23 is the Torah ordinance he had broken.'),
  ('jubilees', 'jubilees', 41, 25, 'canon', 'matthew', 1, 3, 'free', E'Matthew 1:3 — *And Judas begat Phares and Zara of Thamar; and Phares begat Esrom; and Esrom begat Aram;* The Judah who receives forgiveness in Jubilees 41:25 is the Judah carried into the Messianic line.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju41_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju41_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-41-er-and-onan-slain',
       E'Er and Onan — the wicked sons whom Yahuah slew',
       E'Jubilees opens the Judah-and-Tamar account exactly as Genesis tells it: *And in the forty-fifth jubilee, in the second week, (and) in the second year, Yahudah (Judah) took for his first-born Er, a wife from the daughters of Aram, named Tamar.* (Jubilees 41:1) — then *And this Er, the first-born of Yahudah (Judah), was wicked, and Yahuah (God) slew him.* (Jubilees 41:3). Genesis is the source being retold: *And Er, Yahudah''s (Judah’s) firstborn, was wicked in the sight of Yahuah (LORD); and Yahuah (LORD) slew him.* (Genesis 38:7). When Onan refuses to raise up seed for his brother, the same judgement falls — *And the thing which he did displeased Yahuah (LORD): wherefore he slew him also.* (Genesis 38:10) — for the levirate duty Judah invokes is Torah itself: *If brethren dwell together, and one of them die, and have no child, the wife of the dead shall not marry without unto a stranger: her husband’s brother shall go in unto her, and take her to him to wife, and perform the duty of an husband’s brother unto her.* (Deuteronomy 25:5). It ain''t new — Jubilees and Genesis stand on the same page.',
       sv.verse_id, ev.verse_id, 'extras', 54000
  FROM _session251_ju41_lookup sv, _session251_ju41_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=41 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=41 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-41-tamar-withheld-and-the-veil',
       E'Tamar withheld, the veil, and the pledge',
       E'Judah holds Tamar back from his last son: *And Yahudah (Judah) said to Tamar, his daughter-in-law: “Remain in your father’s house as a widow till Shelah my son be grown up, and I shall give you to him to wife.”* (Jubilees 41:6) — the same dismissal as Genesis: *Then said Yahudah (Judah) to Tamar his daughter in law, Remain a widow at thy father’s house, till Shelah my son be grown* (Genesis 38:11). So she takes the veil and waits in the gate: *And she put off her widow’s clothes, and put on a veil, and adorned herself, and sat in the gate adjoining the way to Timnah.* (Jubilees 41:9) — *And she put her widow’s garments off from her, and covered her with a vail... and sat in an open place, which is by the way to Timnath* (Genesis 38:14). The pledge Judah surrenders — ring, necklace, staff (Jubilees 41:11) — is the signet, bracelets, and staff of Genesis: *And he gave it her, and came in unto her, and she conceived by him.* (Genesis 38:18). And the very relation Judah will violate is named in Torah''s forbidden list: *Thou shalt not uncover the nakedness of thy daughter in law: she is thy son’s wife* (Leviticus 18:15).',
       sv.verse_id, ev.verse_id, 'extras', 54003
  FROM _session251_ju41_lookup sv, _session251_ju41_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=41 AND sv.verse_number=6
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=41 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-41-she-is-more-righteous-than-i',
       E'“Tamar is more righteous than I” — the pledge revealed',
       E'Condemned to the fire, Tamar sends back the pledge: *And it came to pass when they brought her forth to bum her that she sent to her father-in-law the ring and the necklace, and the staff, saying: “Discern whose are these, for by him am I with child.”* (Jubilees 41:18) — word for word with Genesis: *she sent to her father in law, saying, By the man, whose these are, am I with child: and she said, Discern, I pray thee, whose are these, the signet, and bracelets, and staff.* (Genesis 38:25). Judah''s confession is the heart of both texts: *And Yahudah (Judah) acknowledged, and said: “Tamar is more righteous than I am. And therefore let them burn her not.”* (Jubilees 41:19) — *And Yahudah (Judah) acknowledged them, and said, She hath been more righteous than I; because that I gave her not to Shelah my son. And he knew her again no more.* (Genesis 38:26). The death sentence had been the same: *And Yahudah (Judah) said, Bring her forth, and let her be burnt.* (Genesis 38:24). Out of this unlikely vindication the twins are born — *behold, his brother came out... therefore his name was called Pharez.* (Genesis 38:29).',
       sv.verse_id, ev.verse_id, 'extras', 54006
  FROM _session251_ju41_lookup sv, _session251_ju41_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=41 AND sv.verse_number=16
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=41 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-41-the-messianic-seed-through-perez',
       E'Perez and Zerah — the seed kept, the line to David and Messiah',
       E'*And after that she bare two sons, Perez and Zerah, in the seventh year of this second week.* (Jubilees 41:21). This is no footnote: through this unexpected birth the Messianic seed is carried. Ruth''s blessing names it: *And let thy house be like the house of Pharez, whom Tamar bare unto Yahudah (Judah), of the seed which Yahuah (LORD) shall give thee of this young woman.* (Ruth 4:12), and the genealogy that closes Ruth runs straight from him: *Now these are the generations of Pharez: Pharez begat Hezron,* (Ruth 4:18) — on to David: *he is the father of Jesse, the father of David.* (Ruth 4:17). And Matthew sets Tamar by name in the line of the Messiah: *And Judas begat Phares and Zara of Thamar; and Phares begat Esrom; and Esrom begat Aram;* (Matthew 1:3). The seed war could not root out the promise — *for this reason his seed was established for a second generation, and would not be rooted out.* (Jubilees 41:26). The seed kept through the unlikeliest of mothers: it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 54009
  FROM _session251_ju41_lookup sv, _session251_ju41_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=41 AND sv.verse_number=21
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=41 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-41-judahs-repentance-and-forgiveness',
       E'Judah''s repentance — forgiven because he turned',
       E'Jubilees adds what Genesis leaves unspoken — Judah''s grief and forgiveness: *And Yahudah (Judah) acknowledged that the deed which he had done was evil... and he began to lament and to supplicate before Yahuah (God) because of his transgression.* (Jubilees 41:23), and the answer comes: *And we told him in a dream that it was forgiven him because he supplicated earnestly, and lamented, and did not again commit it.* (Jubilees 41:24) — *And he received forgiveness because he turned from his sin and from his ignorance* (Jubilees 41:25). The sin he laments is the one Torah names by relation: *Thou shalt not uncover the nakedness of thy daughter in law: she is thy son’s wife; thou shalt not uncover her nakedness.* (Leviticus 18:15). Yet the repentant Judah is the same Judah set in the Messianic line — *And Judas begat Phares and Zara of Thamar* (Matthew 1:3): grace meets the turned heart, and the seed is kept.',
       sv.verse_id, ev.verse_id, 'extras', 54012
  FROM _session251_ju41_lookup sv, _session251_ju41_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=41 AND sv.verse_number=23
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=41 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-41-er-and-onan-slain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 38:6 — *And Yahudah (Judah) took a wife for Er his firstborn, whose name was Tamar.* The same marriage that opens Jubilees 41:1 opens the Genesis source.'
  FROM cross_reference_threads t, cross_references x, _session251_ju41_lookup sv, _session251_ju41_lookup tv
 WHERE t.slug='jubilees-41-er-and-onan-slain'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=41 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=38 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 38:7 — *And Er, Yahudah''s (Judah’s) firstborn, was wicked in the sight of Yahuah (LORD); and Yahuah (LORD) slew him.* Jubilees 41:3 quotes the verdict on Er almost word for word.'
  FROM cross_reference_threads t, cross_references x, _session251_ju41_lookup sv, _session251_ju41_lookup tv
 WHERE t.slug='jubilees-41-er-and-onan-slain'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=41 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=38 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 38:8 — *And Yahudah (Judah) said unto Onan, Go in unto thy brother’s wife, and marry her, and raise up seed to thy brother.* The levirate charge in Jubilees 41:4 is the same charge Judah gives in Genesis.'
  FROM cross_reference_threads t, cross_references x, _session251_ju41_lookup sv, _session251_ju41_lookup tv
 WHERE t.slug='jubilees-41-er-and-onan-slain'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=41 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=38 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 38:10 — *And the thing which he did displeased Yahuah (LORD): wherefore he slew him also.* Onan''s death in Jubilees 41:5 matches Genesis exactly.'
  FROM cross_reference_threads t, cross_references x, _session251_ju41_lookup sv, _session251_ju41_lookup tv
 WHERE t.slug='jubilees-41-er-and-onan-slain'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=41 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=38 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Deuteronomy 25:5 — *If brethren dwell together, and one of them die, and have no child, the wife of the dead shall not marry without unto a stranger: her husband’s brother shall go in unto her, and take her to him to wife, and perform the duty of an husband’s brother unto her.* The duty Judah lays on Onan in Jubilees 41:4 is the Torah''s own levirate ordinance.'
  FROM cross_reference_threads t, cross_references x, _session251_ju41_lookup sv, _session251_ju41_lookup tv
 WHERE t.slug='jubilees-41-er-and-onan-slain'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=41 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-41-tamar-withheld-and-the-veil
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 38:11 — *Then said Yahudah (Judah) to Tamar his daughter in law, Remain a widow at thy father’s house, till Shelah my son be grown: for he said, Lest peradventure he die also, as his brethren did. And Tamar went and dwelt in her father’s house.* Judah''s word to Tamar in Jubilees 41:6 is the same withholding.'
  FROM cross_reference_threads t, cross_references x, _session251_ju41_lookup sv, _session251_ju41_lookup tv
 WHERE t.slug='jubilees-41-tamar-withheld-and-the-veil'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=41 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=38 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 38:14 — *And she put her widow’s garments off from her, and covered her with a vail, and wrapped herself, and sat in an open place, which is by the way to Timnath; for she saw that Shelah was grown, and she was not given unto him to wife.* The veil and the wayside seat of Jubilees 41:9 are drawn straight from Genesis.'
  FROM cross_reference_threads t, cross_references x, _session251_ju41_lookup sv, _session251_ju41_lookup tv
 WHERE t.slug='jubilees-41-tamar-withheld-and-the-veil'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=41 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=38 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 38:18 — *And he said, What pledge shall I give thee? And she said, Thy signet, and thy bracelets, and thy staff that is in thine hand. And he gave it her, and came in unto her, and she conceived by him.* The ring, necklace, and staff of Jubilees 41:11 are the signet, bracelets, and staff of Genesis.'
  FROM cross_reference_threads t, cross_references x, _session251_ju41_lookup sv, _session251_ju41_lookup tv
 WHERE t.slug='jubilees-41-tamar-withheld-and-the-veil'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=41 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=38 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 18:15 — *Thou shalt not uncover the nakedness of thy daughter in law: she is thy son’s wife; thou shalt not uncover her nakedness.* Tamar is named Judah''s daughter-in-law in Jubilees 41:6 — the very relation Torah forbids.'
  FROM cross_reference_threads t, cross_references x, _session251_ju41_lookup sv, _session251_ju41_lookup tv
 WHERE t.slug='jubilees-41-tamar-withheld-and-the-veil'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=41 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=18 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-41-she-is-more-righteous-than-i
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 38:24 — *And it came to pass about three months after, that it was told Yahudah (Judah), saying, Tamar thy daughter in law hath played the harlot; and also, behold, she is with child by whoredom. And Yahudah (Judah) said, Bring her forth, and let her be burnt.* The three-month report and the sentence of burning in Jubilees 41:16 are Genesis.'
  FROM cross_reference_threads t, cross_references x, _session251_ju41_lookup sv, _session251_ju41_lookup tv
 WHERE t.slug='jubilees-41-she-is-more-righteous-than-i'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=41 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=38 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 38:25 — *When she was brought forth, she sent to her father in law, saying, By the man, whose these are, am I with child: and she said, Discern, I pray thee, whose are these, the signet, and bracelets, and staff.* Tamar''s sending of the pledge in Jubilees 41:18 matches Genesis word for word.'
  FROM cross_reference_threads t, cross_references x, _session251_ju41_lookup sv, _session251_ju41_lookup tv
 WHERE t.slug='jubilees-41-she-is-more-righteous-than-i'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=41 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=38 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 38:26 — *And Yahudah (Judah) acknowledged them, and said, She hath been more righteous than I; because that I gave her not to Shelah my son. And he knew her again no more.* Judah''s “Tamar is more righteous than I am” in Jubilees 41:19 is the very confession of Genesis.'
  FROM cross_reference_threads t, cross_references x, _session251_ju41_lookup sv, _session251_ju41_lookup tv
 WHERE t.slug='jubilees-41-she-is-more-righteous-than-i'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=41 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=38 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 38:29 — *And it came to pass, as he drew back his hand, that, behold, his brother came out: and she said, How hast thou broken forth? this breach be upon thee: therefore his name was called Pharez.* The birth of Perez in Jubilees 41:21 is the breach-birth of Genesis.'
  FROM cross_reference_threads t, cross_references x, _session251_ju41_lookup sv, _session251_ju41_lookup tv
 WHERE t.slug='jubilees-41-she-is-more-righteous-than-i'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=41 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=38 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-41-the-messianic-seed-through-perez
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 1:3 — *And Judas begat Phares and Zara of Thamar; and Phares begat Esrom; and Esrom begat Aram;* The Perez and Zerah born in Jubilees 41:21 stand by Tamar''s name in the genealogy of the Messiah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju41_lookup sv, _session251_ju41_lookup tv
 WHERE t.slug='jubilees-41-the-messianic-seed-through-perez'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=41 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ruth 4:12 — *And let thy house be like the house of Pharez, whom Tamar bare unto Yahudah (Judah), of the seed which Yahuah (LORD) shall give thee of this young woman.* The Pharez of Jubilees 41:21 becomes Israel''s blessing-name for a fruitful house.'
  FROM cross_reference_threads t, cross_references x, _session251_ju41_lookup sv, _session251_ju41_lookup tv
 WHERE t.slug='jubilees-41-the-messianic-seed-through-perez'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=41 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=4 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ruth 4:18 — *Now these are the generations of Pharez: Pharez begat Hezron,* The genealogy to David opens with the Perez born in Jubilees 41:21.'
  FROM cross_reference_threads t, cross_references x, _session251_ju41_lookup sv, _session251_ju41_lookup tv
 WHERE t.slug='jubilees-41-the-messianic-seed-through-perez'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=41 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=4 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ruth 4:17 — *And the women her neighbours gave it a name, saying, There is a son born to Naomi; and they called his name Obed: he is the father of Jesse, the father of David.* The seed “not rooted out” in Jubilees 41:26 runs through Perez down to David.'
  FROM cross_reference_threads t, cross_references x, _session251_ju41_lookup sv, _session251_ju41_lookup tv
 WHERE t.slug='jubilees-41-the-messianic-seed-through-perez'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=41 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=4 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-41-judahs-repentance-and-forgiveness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 18:15 — *Thou shalt not uncover the nakedness of thy daughter in law: she is thy son’s wife; thou shalt not uncover her nakedness.* The transgression Judah laments in Jubilees 41:23 is the Torah ordinance he had broken.'
  FROM cross_reference_threads t, cross_references x, _session251_ju41_lookup sv, _session251_ju41_lookup tv
 WHERE t.slug='jubilees-41-judahs-repentance-and-forgiveness'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=41 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=18 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 1:3 — *And Judas begat Phares and Zara of Thamar; and Phares begat Esrom; and Esrom begat Aram;* The Judah who receives forgiveness in Jubilees 41:25 is the Judah carried into the Messianic line.'
  FROM cross_reference_threads t, cross_references x, _session251_ju41_lookup sv, _session251_ju41_lookup tv
 WHERE t.slug='jubilees-41-judahs-repentance-and-forgiveness'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=41 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

