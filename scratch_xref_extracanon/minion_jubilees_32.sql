-- ----- fragment: minion_jubilees_32.sql (session251 jubilees 32) -----
-- Source anchor: jubilees/jubilees ch32. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju32 (view _session251_ju32_lookup). Sort band base 53775, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju32_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-32-tithe-at-bethel
  ('jubilees', 'jubilees', 32, 2, 'canon', 'genesis', 28, 22, 'free', E'Genesis 28:22 — *And this stone, which I have set for a pillar, shall be Elohim''s (God''s) house: and of all that thou shalt give me I will surely give the tenth unto thee.* Jubilees 32:2 is the payment of this very Bethel vow — the tithe was promised at the pillar and now rendered in full.'),
  ('jubilees', 'jubilees', 32, 9, 'canon', 'leviticus', 27, 30, 'free', E'Leviticus 27:30 — *And all the tithe of the land, whether of the seed of the land, or of the fruit of the tree, is the LORD''S: it is holy unto Yahuah (LORD).* Jacob "sanctified it, and it became holy to Him" (Jubilees 32:9) because the tithe was always Yahuah''s holy portion, not the giver''s.'),
  ('jubilees', 'jubilees', 32, 4, 'canon', 'leviticus', 27, 32, 'free', E'Leviticus 27:32 — *And concerning the tithe of the herd, or of the flock, even of whatsoever passeth under the rod, the tenth shall be holy unto Yahuah (LORD).* Jacob''s tithe of oxen, rams, sheep and goats on the altar (Jubilees 32:4) is the tithe of the herd and flock the Torah marks as holy.'),
  ('jubilees', 'jubilees', 32, 9, 'canon', 'numbers', 18, 21, 'free', E'Numbers 18:21 — *And, behold, I have given the children of Levi all the tenth in Yashar''el (Israel) for an inheritance, for their service which they serve, even the service of the tabernacle of the congregation.* Jacob gives the tithe into Levi''s priestly hand (Jubilees 32:9), the very assignment the Torah later codifies.'),
  -- thread: jubilees-32-second-tithe-eaten-before-yahuah
  ('jubilees', 'jubilees', 32, 11, 'canon', 'deuteronomy', 14, 22, 'free', E'Deuteronomy 14:22 — *Thou shalt truly tithe all the increase of thy seed, that the field bringeth forth year by year.* The "second tithe before Yahuah... from this year to the year following" (Jubilees 32:11) is exactly this year-by-year tithe of the increase.'),
  ('jubilees', 'jubilees', 32, 10, 'canon', 'deuteronomy', 14, 23, 'free', E'Deuteronomy 14:23 — *And thou shalt eat before Yahuah Elohayka (the LORD thy God), in the place which he shall choose to place his name there, the tithe of thy corn, of thy wine, and of thine oil, and the firstlings of thy herds and of thy flocks; that thou mayest learn to fear Yahuah Elohayka (the LORD thy God) always.* The heavenly-tablet law to "eat before Yahuah... in the place where it is chosen that His name should dwell" (Jubilees 32:10) is this Deuteronomy command verbatim in substance.'),
  ('jubilees', 'jubilees', 32, 15, 'canon', 'leviticus', 27, 30, 'free', E'Leviticus 27:30 — *And all the tithe of the land, whether of the seed of the land, or of the fruit of the tree, is the LORD''S: it is holy unto Yahuah (LORD).* The tithe of oxen and sheep "holy to Yahuah... and shall belong to His priests" (Jubilees 32:15) rests on this declaration that the tithe is the LORD''s, holy.'),
  -- thread: jubilees-32-thy-name-shall-be-israel
  ('jubilees', 'jubilees', 32, 17, 'canon', 'genesis', 35, 10, 'free', E'Genesis 35:10 — *And Elohim (God) said unto him, Thy name is Jacob: thy name shall not be called any more Jacob, but Yashar''el (Israel) shall be thy name: and he called his name Yashar''el (Israel).* Jubilees 32:17 retells this Bethel renaming word for word — Jacob becomes Yashar''el at the very altar of his vow.'),
  ('jubilees', 'jubilees', 32, 18, 'canon', 'genesis', 35, 11, 'free', E'Genesis 35:11 — *And Elohim (God) said unto him, I am El Shaddai (God Almighty): be fruitful and multiply; a nation and a company of nations shall be of thee, and kings shall come out of thy loins;* The "I am Yahuah who created the heaven and the earth... kings will come forth from you" of Jubilees 32:18 is this El Shaddai covenant renewed.'),
  ('jubilees', 'jubilees', 32, 18, 'canon', 'genesis', 17, 6, 'free', E'Genesis 17:6 — *And I will make thee exceeding fruitful, and I will make nations of thee, and kings shall come out of thee.* The royal "kings will come forth from you" promised to Jacob (Jubilees 32:18) was first sworn to Abraham — the kept seed-line carrying the kings down to Israel.'),
  -- thread: jubilees-32-heavenly-tablets-shown-to-jacob
  ('jubilees', 'jubilees', 32, 20, 'canon', 'psalms', 139, 16, 'free', E'Psalm 139:16 — *Thine eyes did see my substance, yet being unperfect; and in thy book all my members were written, which in continuance were fashioned, when as yet there was none of them.* The seven tablets that show Jacob "all... which would befall him and his sons throughout all the ages" (Jubilees 32:20) are this heavenly book where the days are written before they are.'),
  ('jubilees', 'jubilees', 32, 28, 'canon', 'malachi', 3, 16, 'free', E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* The feast "written on the heavenly tables" (Jubilees 32:28) belongs to this same book of remembrance kept before Yahuah.'),
  -- thread: jubilees-32-levi-the-priest-at-bethel
  ('jubilees', 'jubilees', 32, 3, 'canon', 'deuteronomy', 33, 8, 'free', E'Deuteronomy 33:8 — *And of Levi he said, Let thy Thummim and thy Urim be with thy holy one, whom thou didst prove at Massah, and with whom thou didst strive at the waters of Meribah;* Jacob clothing Levi "in the garments of the priesthood" (Jubilees 32:3) is the patriarchal root of Moses'' priestly blessing on the tribe of Levi.'),
  ('jubilees', 'jubilees', 32, 1, 'jubilees', 'jubilees', 31, 16, 'extras', E'Jubilees 31:16 — *Your mother has called your name Levi, And justly has she called your name; You will be joined to Yahuah (God) And be the companion of all the sons of Jacob; Let His table be your, And do you and your sons eat thereof...* Levi dreamed priest "for ever" here (Jubilees 32:1) is the dream-fulfillment of Isaac''s blessing the chapter before — Levi joined to Yahuah at His table.'),
  ('jubilees', 'jubilees', 32, 9, 'canon', 'hebrews', 7, 13, 'free', E'Hebrews 7:13 — *For he of whom these things are spoken pertaineth to another tribe, of which no man gave attendance at the altar.* Levi serves the altar at Bethel (Jubilees 32:9), but the New Testament marks that the Messiah-priest springs from Judah''s kingly tribe, not Levi''s — the twin Jubilees blessing of priest and king.'),
  -- thread: jubilees-32-deborah-rachel-benjamin
  ('jubilees', 'jubilees', 32, 30, 'canon', 'genesis', 35, 8, 'free', E'Genesis 35:8 — *But Deborah Rebekah’s nurse died, and she was buried beneath Beth-el under an oak: and the name of it was called Allon-bachuth.* Jubilees 32:30 retells the death of Deborah and her burial under the oak of mourning — the same nurse, the same oak at Bethel.'),
  ('jubilees', 'jubilees', 32, 33, 'canon', 'genesis', 35, 18, 'free', E'Genesis 35:18 — *And it came to pass, as her soul was in departing, (for she died) that she called his name Ben-oni: but his father called him Benjamin.* Rachel''s "Son of my sorrow" renamed Benjamin by his father (Jubilees 32:33) is this Genesis birth-and-naming exactly.'),
  ('jubilees', 'jubilees', 32, 34, 'canon', 'genesis', 35, 19, 'free', E'Genesis 35:19 — *And Rachel died, and was buried in the way to Ephrath, which is Beth-lehem.* Rachel buried "in the land of Ephrath, the same is Bethlehem" with a pillar on her grave (Jubilees 32:34) matches Genesis to the place — Bethlehem named where Rachel falls.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju32_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju32_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-32-tithe-at-bethel',
       E'Jacob tithes at Bethel — the tenth vowed and paid',
       E'Jacob keeps the vow he made when he fled Esau: *And Jacob rose early in the morning, on the fourteenth of this month, and he gave a tithe of all that came with him, both of men and cattle, both of gold and every vessel and garment, yea, he gave tithes of all.* (Jubilees 32:2). It ain''t new — this is the payment of the exact vow Genesis records at the stone of Bethel: *And this stone, which I have set for a pillar, shall be Elohim''s (God''s) house: and of all that thou shalt give me I will surely give the tenth unto thee.* (Genesis 28:22). The tithe is no later temple invention; it is Yahuah''s own portion from the land: *And all the tithe of the land, whether of the seed of the land, or of the fruit of the tree, is the LORD''S: it is holy unto Yahuah (LORD).* (Leviticus 27:30), and of the flock too: *And concerning the tithe of the herd, or of the flock, even of whatsoever passeth under the rod, the tenth shall be holy unto Yahuah (LORD).* (Leviticus 27:32). The tenth is given into the priestly hand of Levi, just as the Torah assigns it: *And, behold, I have given the children of Levi all the tenth in Yashar''el (Israel) for an inheritance, for their service which they serve, even the service of the tabernacle of the congregation.* (Numbers 18:21).',
       sv.verse_id, ev.verse_id, 'extras', 53775
  FROM _session251_ju32_lookup sv, _session251_ju32_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=32 AND sv.verse_number=2
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=32 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-32-second-tithe-eaten-before-yahuah',
       E'The second tithe — eaten before Yahuah in the chosen place',
       E'Jubilees grounds the second tithe in the patriarch and the heavenly tablets: *And for this reason it is ordained on the heavenly tables as a law for the tithing again the tithe to eat before Yahuah (God) from year to year, in the place where it is chosen that His name should dwell, and to this law there is no limit of days for ever.* (Jubilees 32:10). It ain''t new — this is word-for-word the Deuteronomy ordinance of the second tithe: *Thou shalt truly tithe all the increase of thy seed, that the field bringeth forth year by year.* (Deuteronomy 14:22), eaten before Yahuah in the place He chooses for His name: *And thou shalt eat before Yahuah Elohayka (the LORD thy God), in the place which he shall choose to place his name there, the tithe of thy corn, of thy wine, and of thine oil, and the firstlings of thy herds and of thy flocks; that thou mayest learn to fear Yahuah Elohayka (the LORD thy God) always.* (Deuteronomy 14:23). The herd and flock tithe belongs to His priests and is most holy: *And all the tithe of the land, whether of the seed of the land, or of the fruit of the tree, is the LORD''S: it is holy unto Yahuah (LORD).* (Leviticus 27:30). The feast of eating before Yahuah is engraved on the tablets before Moses ever wrote it down.',
       sv.verse_id, ev.verse_id, 'extras', 53778
  FROM _session251_ju32_lookup sv, _session251_ju32_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=32 AND sv.verse_number=10
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=32 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-32-thy-name-shall-be-israel',
       E'Renamed Israel — kings shall come forth from thee',
       E'At Bethel Yahuah appears and renews the covenant: *And Yahuah (God) appeared to him by night and blessed him and said to him: “Your name shall not be called Jacob, but Yashar’el (Israel) shall they name your name.”* (Jubilees 32:17), declaring *“I am Yahuah (God) who created the heaven and the earth, and I shall increase you and multiply you exceedingly, and kings will come forth from you...”* (Jubilees 32:18). It ain''t new — this is the Genesis Bethel theophany retold: *And Elohim (God) said unto him, Thy name is Jacob: thy name shall not be called any more Jacob, but Yashar''el (Israel) shall be thy name: and he called his name Yashar''el (Israel).* (Genesis 35:10), with the same promise of nations and kings: *And Elohim (God) said unto him, I am El Shaddai (God Almighty): be fruitful and multiply; a nation and a company of nations shall be of thee, and kings shall come out of thy loins;* (Genesis 35:11). The "kings shall come" word is the patriarchal promise first spoken to Abraham: *And I will make thee exceeding fruitful, and I will make nations of thee, and kings shall come out of thee.* (Genesis 17:6) — the royal seed-line, kept and carried down to Israel.',
       sv.verse_id, ev.verse_id, 'extras', 53781
  FROM _session251_ju32_lookup sv, _session251_ju32_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=32 AND sv.verse_number=17
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=32 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-32-heavenly-tablets-shown-to-jacob',
       E'The seven heavenly tablets — what would befall his sons',
       E'An angel brings Jacob the pre-written record: *And he saw in a vision of the night, and behold an angel descended from heaven with seven tablets in his hands, and he gave them to Jacob, and he read them and knew all that was written therein which would befall him and his sons throughout all the ages.* (Jubilees 32:20). This is the Jubilees spine — the law and the history engraved on the heavenly tablets before they unfold, the "Addition" feast-day itself recorded there: *And thus it was manifested that it should be, and it is written on the heavenly tables: wherefore it was revealed to him that he should celebrate it, and add it to the seven days of the feast.* (Jubilees 32:28). Scripture names these same heavenly books: *Thine eyes did see my substance, yet being unperfect; and in thy book all my members were written, which in continuance were fashioned, when as yet there was none of them.* (Psalm 139:16), and *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* (Malachi 3:16). The ages are written before they run.',
       sv.verse_id, ev.verse_id, 'extras', 53784
  FROM _session251_ju32_lookup sv, _session251_ju32_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=32 AND sv.verse_number=20
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=32 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-32-levi-the-priest-at-bethel',
       E'Levi the priest — the tenth son made the tenth offering',
       E'The chapter opens with Levi ordained priest in a dream: *And he abode that night at Bethel, and Levi dreamed that they had ordained and made him the priest of the El Elyon (Most High) Elohim (God), him and his sons for ever* (Jubilees 32:1), and Jacob counting his sons makes Levi the tithe: *Jacob counted his sons from him upwards and Levi fell to the portion of Yahuah (God), and his father clothed him in the garments of the priesthood and filled his hands* (Jubilees 32:3), so that *Levi discharged the priestly office at Bethel before Jacob his father in preference to his ten brothers* (Jubilees 32:9). It ain''t new — Moses'' blessing seals Levi to the holy office: *And of Levi he said, Let thy Thummim and thy Urim be with thy holy one, whom thou didst prove at Massah, and with whom thou didst strive at the waters of Meribah;* (Deuteronomy 33:8). This is the priesthood-of-Levi half of the twin blessing Jubilees gives a chapter earlier, where Levi is "joined to Yahuah" (Jubilees 31:16) — Levi the priest, Judah the king. The New Testament marks that the Messiah springs not from Levi but from Judah, the kingly tribe: *For he of whom these things are spoken pertaineth to another tribe, of which no man gave attendance at the altar.* (Hebrews 7:13).',
       sv.verse_id, ev.verse_id, 'extras', 53787
  FROM _session251_ju32_lookup sv, _session251_ju32_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=32 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=32 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-32-deborah-rachel-benjamin',
       E'Deborah''s oak; Rachel dies, Benjamin born',
       E'The chapter closes in mourning and birth: *And in the night, on the twenty-third of this month, Deborah Rebecca’s nurse died, and they buried her beneath the city under the oak of the river, and he called the name of this place, “The river of Deborah,” and the oak, “The oak of the mourning of Deborah.”* (Jubilees 32:30), then *Rachel bare a son in the night, and called his name “Son of my sorrow”; for she suffered in giving him birth: but his father called his name Benjamin* (Jubilees 32:33), and *Rachel died there and she was buried in the land of Ephrath, the same is Bethlehem, and Jacob built a pillar on the grave of Rachel* (Jubilees 32:34). It ain''t new — Genesis tells the very same two burials at Bethel and on the Ephrath road: *But Deborah Rebekah’s nurse died, and she was buried beneath Beth-el under an oak: and the name of it was called Allon-bachuth.* (Genesis 35:8); *And it came to pass, as her soul was in departing, (for she died) that she called his name Ben-oni: but his father called him Benjamin.* (Genesis 35:18); *And Rachel died, and was buried in the way to Ephrath, which is Beth-lehem.* (Genesis 35:19). Bethlehem is already on the page where Rachel falls.',
       sv.verse_id, ev.verse_id, 'extras', 53790
  FROM _session251_ju32_lookup sv, _session251_ju32_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=32 AND sv.verse_number=30
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=32 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-32-tithe-at-bethel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 28:22 — *And this stone, which I have set for a pillar, shall be Elohim''s (God''s) house: and of all that thou shalt give me I will surely give the tenth unto thee.* Jubilees 32:2 is the payment of this very Bethel vow — the tithe was promised at the pillar and now rendered in full.'
  FROM cross_reference_threads t, cross_references x, _session251_ju32_lookup sv, _session251_ju32_lookup tv
 WHERE t.slug='jubilees-32-tithe-at-bethel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=32 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 27:30 — *And all the tithe of the land, whether of the seed of the land, or of the fruit of the tree, is the LORD''S: it is holy unto Yahuah (LORD).* Jacob "sanctified it, and it became holy to Him" (Jubilees 32:9) because the tithe was always Yahuah''s holy portion, not the giver''s.'
  FROM cross_reference_threads t, cross_references x, _session251_ju32_lookup sv, _session251_ju32_lookup tv
 WHERE t.slug='jubilees-32-tithe-at-bethel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=32 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=27 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 27:32 — *And concerning the tithe of the herd, or of the flock, even of whatsoever passeth under the rod, the tenth shall be holy unto Yahuah (LORD).* Jacob''s tithe of oxen, rams, sheep and goats on the altar (Jubilees 32:4) is the tithe of the herd and flock the Torah marks as holy.'
  FROM cross_reference_threads t, cross_references x, _session251_ju32_lookup sv, _session251_ju32_lookup tv
 WHERE t.slug='jubilees-32-tithe-at-bethel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=32 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=27 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Numbers 18:21 — *And, behold, I have given the children of Levi all the tenth in Yashar''el (Israel) for an inheritance, for their service which they serve, even the service of the tabernacle of the congregation.* Jacob gives the tithe into Levi''s priestly hand (Jubilees 32:9), the very assignment the Torah later codifies.'
  FROM cross_reference_threads t, cross_references x, _session251_ju32_lookup sv, _session251_ju32_lookup tv
 WHERE t.slug='jubilees-32-tithe-at-bethel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=32 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-32-second-tithe-eaten-before-yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 14:22 — *Thou shalt truly tithe all the increase of thy seed, that the field bringeth forth year by year.* The "second tithe before Yahuah... from this year to the year following" (Jubilees 32:11) is exactly this year-by-year tithe of the increase.'
  FROM cross_reference_threads t, cross_references x, _session251_ju32_lookup sv, _session251_ju32_lookup tv
 WHERE t.slug='jubilees-32-second-tithe-eaten-before-yahuah'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=32 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=14 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 14:23 — *And thou shalt eat before Yahuah Elohayka (the LORD thy God), in the place which he shall choose to place his name there, the tithe of thy corn, of thy wine, and of thine oil, and the firstlings of thy herds and of thy flocks; that thou mayest learn to fear Yahuah Elohayka (the LORD thy God) always.* The heavenly-tablet law to "eat before Yahuah... in the place where it is chosen that His name should dwell" (Jubilees 32:10) is this Deuteronomy command verbatim in substance.'
  FROM cross_reference_threads t, cross_references x, _session251_ju32_lookup sv, _session251_ju32_lookup tv
 WHERE t.slug='jubilees-32-second-tithe-eaten-before-yahuah'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=32 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=14 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 27:30 — *And all the tithe of the land, whether of the seed of the land, or of the fruit of the tree, is the LORD''S: it is holy unto Yahuah (LORD).* The tithe of oxen and sheep "holy to Yahuah... and shall belong to His priests" (Jubilees 32:15) rests on this declaration that the tithe is the LORD''s, holy.'
  FROM cross_reference_threads t, cross_references x, _session251_ju32_lookup sv, _session251_ju32_lookup tv
 WHERE t.slug='jubilees-32-second-tithe-eaten-before-yahuah'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=32 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=27 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-32-thy-name-shall-be-israel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 35:10 — *And Elohim (God) said unto him, Thy name is Jacob: thy name shall not be called any more Jacob, but Yashar''el (Israel) shall be thy name: and he called his name Yashar''el (Israel).* Jubilees 32:17 retells this Bethel renaming word for word — Jacob becomes Yashar''el at the very altar of his vow.'
  FROM cross_reference_threads t, cross_references x, _session251_ju32_lookup sv, _session251_ju32_lookup tv
 WHERE t.slug='jubilees-32-thy-name-shall-be-israel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=32 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 35:11 — *And Elohim (God) said unto him, I am El Shaddai (God Almighty): be fruitful and multiply; a nation and a company of nations shall be of thee, and kings shall come out of thy loins;* The "I am Yahuah who created the heaven and the earth... kings will come forth from you" of Jubilees 32:18 is this El Shaddai covenant renewed.'
  FROM cross_reference_threads t, cross_references x, _session251_ju32_lookup sv, _session251_ju32_lookup tv
 WHERE t.slug='jubilees-32-thy-name-shall-be-israel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=32 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 17:6 — *And I will make thee exceeding fruitful, and I will make nations of thee, and kings shall come out of thee.* The royal "kings will come forth from you" promised to Jacob (Jubilees 32:18) was first sworn to Abraham — the kept seed-line carrying the kings down to Israel.'
  FROM cross_reference_threads t, cross_references x, _session251_ju32_lookup sv, _session251_ju32_lookup tv
 WHERE t.slug='jubilees-32-thy-name-shall-be-israel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=32 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=17 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-32-heavenly-tablets-shown-to-jacob
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 139:16 — *Thine eyes did see my substance, yet being unperfect; and in thy book all my members were written, which in continuance were fashioned, when as yet there was none of them.* The seven tablets that show Jacob "all... which would befall him and his sons throughout all the ages" (Jubilees 32:20) are this heavenly book where the days are written before they are.'
  FROM cross_reference_threads t, cross_references x, _session251_ju32_lookup sv, _session251_ju32_lookup tv
 WHERE t.slug='jubilees-32-heavenly-tablets-shown-to-jacob'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=32 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* The feast "written on the heavenly tables" (Jubilees 32:28) belongs to this same book of remembrance kept before Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju32_lookup sv, _session251_ju32_lookup tv
 WHERE t.slug='jubilees-32-heavenly-tablets-shown-to-jacob'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=32 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-32-levi-the-priest-at-bethel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 33:8 — *And of Levi he said, Let thy Thummim and thy Urim be with thy holy one, whom thou didst prove at Massah, and with whom thou didst strive at the waters of Meribah;* Jacob clothing Levi "in the garments of the priesthood" (Jubilees 32:3) is the patriarchal root of Moses'' priestly blessing on the tribe of Levi.'
  FROM cross_reference_threads t, cross_references x, _session251_ju32_lookup sv, _session251_ju32_lookup tv
 WHERE t.slug='jubilees-32-levi-the-priest-at-bethel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=32 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=33 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 31:16 — *Your mother has called your name Levi, And justly has she called your name; You will be joined to Yahuah (God) And be the companion of all the sons of Jacob; Let His table be your, And do you and your sons eat thereof...* Levi dreamed priest "for ever" here (Jubilees 32:1) is the dream-fulfillment of Isaac''s blessing the chapter before — Levi joined to Yahuah at His table.'
  FROM cross_reference_threads t, cross_references x, _session251_ju32_lookup sv, _session251_ju32_lookup tv
 WHERE t.slug='jubilees-32-levi-the-priest-at-bethel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=32 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=31 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 7:13 — *For he of whom these things are spoken pertaineth to another tribe, of which no man gave attendance at the altar.* Levi serves the altar at Bethel (Jubilees 32:9), but the New Testament marks that the Messiah-priest springs from Judah''s kingly tribe, not Levi''s — the twin Jubilees blessing of priest and king.'
  FROM cross_reference_threads t, cross_references x, _session251_ju32_lookup sv, _session251_ju32_lookup tv
 WHERE t.slug='jubilees-32-levi-the-priest-at-bethel'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=32 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-32-deborah-rachel-benjamin
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 35:8 — *But Deborah Rebekah’s nurse died, and she was buried beneath Beth-el under an oak: and the name of it was called Allon-bachuth.* Jubilees 32:30 retells the death of Deborah and her burial under the oak of mourning — the same nurse, the same oak at Bethel.'
  FROM cross_reference_threads t, cross_references x, _session251_ju32_lookup sv, _session251_ju32_lookup tv
 WHERE t.slug='jubilees-32-deborah-rachel-benjamin'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=32 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 35:18 — *And it came to pass, as her soul was in departing, (for she died) that she called his name Ben-oni: but his father called him Benjamin.* Rachel''s "Son of my sorrow" renamed Benjamin by his father (Jubilees 32:33) is this Genesis birth-and-naming exactly.'
  FROM cross_reference_threads t, cross_references x, _session251_ju32_lookup sv, _session251_ju32_lookup tv
 WHERE t.slug='jubilees-32-deborah-rachel-benjamin'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=32 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 35:19 — *And Rachel died, and was buried in the way to Ephrath, which is Beth-lehem.* Rachel buried "in the land of Ephrath, the same is Bethlehem" with a pillar on her grave (Jubilees 32:34) matches Genesis to the place — Bethlehem named where Rachel falls.'
  FROM cross_reference_threads t, cross_references x, _session251_ju32_lookup sv, _session251_ju32_lookup tv
 WHERE t.slug='jubilees-32-deborah-rachel-benjamin'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=32 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

