-- ----- fragment: minion_jubilees_31.sql (session251 jubilees 31) -----
-- Source anchor: jubilees/jubilees ch31. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju31 (view _session251_ju31_lookup). Sort band base 53750, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju31_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-31-bethel-altar-vow
  ('jubilees', 'jubilees', 31, 1, 'canon', 'genesis', 35, 1, 'free', E'Genesis 35:1 — *And Elohim (God) said unto Jacob, Arise, go up to Beth-el, and dwell there: and make there an altar unto Elohim (God), that appeared unto thee when thou fleddest from the face of Esau thy brother.* The same summons to Bethel and the same memory of fleeing Esau stands behind Jubilees 31:1.'),
  ('jubilees', 'jubilees', 31, 1, 'canon', 'genesis', 35, 2, 'free', E'Genesis 35:2 — *Then Jacob said unto his household, and to all that were with him, Put away the strange gods that are among you, and be clean, and change your garments:* Jacob''s word to his house in Jubilees 31:1 — purify, change garments, put away the strange gods — is this verse retold.'),
  ('jubilees', 'jubilees', 31, 3, 'canon', 'genesis', 35, 7, 'free', E'Genesis 35:7 — *And he built there an altar, and called the place El-beth-el: because there Elohim (God) appeared unto him, when he fled from the face of his brother.* The altar built at the place where he had slept (Jubilees 31:3) is the El-beth-el altar of Genesis.'),
  ('jubilees', 'jubilees', 31, 3, 'jubilees', 'jubilees', 27, 26, 'extras', E'Jubilees 27:26 — *And Jacob arose early in the morning, and took the stone which he had put under his head and set it up as a pillar for a sign… And Jacob vowed a vow to Yahuah (God)… of all that you give me, I shall give the tenth to you, my Elohim (God).* The pillar and the sacrifice of Jubilees 31:3 pay the vow Jubilees first recorded at the ladder.'),
  -- thread: jubilees-31-levi-priesthood-blessing
  ('jubilees', 'jubilees', 31, 13, 'canon', 'deuteronomy', 33, 8, 'free', E'Deuteronomy 33:8 — *And of Levi he said, Let thy Thummim and thy Urim be with thy holy one, whom thou didst prove at Massah, and with whom thou didst strive at the waters of Meribah;* Moses'' blessing of Levi as Yahuah''s holy one matches Isaac drawing Levi''s seed near to serve in the sanctuary (Jubilees 31:13).'),
  ('jubilees', 'jubilees', 31, 15, 'canon', 'deuteronomy', 33, 10, 'free', E'Deuteronomy 33:10 — *They shall teach Jacob thy judgments, and Yashar''el (Israel) thy law: they shall put incense before thee, and whole burnt sacrifice upon thine altar.* Levi declaring Yahuah''s ways to Jacob and His paths to Israel (Jubilees 31:15) is this same teaching office.'),
  ('jubilees', 'jubilees', 31, 13, 'canon', 'deuteronomy', 10, 8, 'free', E'Deuteronomy 10:8 — *At that time Yahuah (LORD) separated the tribe of Levi, to bear the ark of the covenant of Yahuah (LORD), to stand before Yahuah (LORD) to minister unto him, and to bless in his name, unto this day.* Levi''s seed approaching to serve in the sanctuary (Jubilees 31:13) is the separated tribe that stands before Yahuah.'),
  ('jubilees', 'jubilees', 31, 13, 'canon', 'numbers', 18, 2, 'free', E'Numbers 18:2 — *And thy brethren also of the tribe of Levi, the tribe of thy father, bring thou with thee, that they may be joined unto thee, and minister unto thee: but thou and thy sons with thee shall minister before the tabernacle of witness.* The Levites'' joining to minister is the drawing-near to serve Isaac foretells in Jubilees 31:13.'),
  ('jubilees', 'jubilees', 31, 15, 'canon', 'malachi', 2, 7, 'free', E'Malachi 2:7 — *For the priest’s lips should keep knowledge, and they should seek the law at his mouth: for he is the messenger of Yahuah Tseva''ot (LORD of hosts).* The mouth that speaks Yahuah''s word in righteousness (Jubilees 31:15) is the covenant of Levi the prophet still holds Levi to.'),
  -- thread: jubilees-31-judah-sceptre-salvation
  ('jubilees', 'jubilees', 31, 18, 'canon', 'genesis', 49, 10, 'free', E'Genesis 49:10 — *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be.* The prince-over-the-sons-of-Jacob blessing of Jubilees 31:18 is Jacob''s undeparting sceptre of Judah.'),
  ('jubilees', 'jubilees', 31, 18, 'canon', 'genesis', 49, 8, 'free', E'Genesis 49:8 — *Yahudah (Judah), thou art he whom thy brethren shall praise: thy hand shall be in the neck of thine enemies; thy father’s children shall bow down before thee.* Treading down all that hate him and ruling the sons of Jacob (Jubilees 31:18) echoes Judah''s hand on the enemy''s neck.'),
  ('jubilees', 'jubilees', 31, 18, 'canon', 'numbers', 24, 17, 'free', E'Numbers 24:17 — *I shall see him, but not now… there shall come a Star out of Jacob, and a Sceptre shall rise out of Yashar''el (Israel), and shall smite the corners of Moab, and destroy all the children of Sheth.* The salvation of Israel in Judah (Jubilees 31:18) is the Sceptre that rises out of Israel.'),
  ('jubilees', 'jubilees', 31, 18, 'canon', 'hebrews', 7, 14, 'free', E'Hebrews 7:14 — *For it is evident that our Lord sprang out of Juda; of which tribe Moses spake nothing concerning priesthood.* The deliverer found in Judah (Jubilees 31:18) is the Lord the New Testament says sprang out of Judah.'),
  ('jubilees', 'jubilees', 31, 20, 'canon', 'revelation', 5, 5, 'free', E'Revelation 5:5 — *And one of the elders saith unto me, Weep not: behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book, and to loose the seven seals thereof.* The throne of righteousness Judah sits on (Jubilees 31:20) is the throne of the Lion of Judah who prevails.'),
  -- thread: jubilees-31-bless-and-curse-the-seed
  ('jubilees', 'jubilees', 31, 17, 'canon', 'genesis', 12, 3, 'free', E'Genesis 12:3 — *And I will bless them that bless thee, and curse him that curseth thee: and in thee shall all families of the earth be blessed.* Isaac''s blessed-be-he-that-blesses-you / cursed-be-the-nation-that-curses-you (Jubilees 31:17) is the Abrahamic promise carried onto Levi.'),
  ('jubilees', 'jubilees', 31, 17, 'canon', 'genesis', 27, 29, 'free', E'Genesis 27:29 — *Let people serve thee, and nations bow down to thee… cursed be every one that curseth thee, and blessed be he that blesseth thee.* Isaac repeats over Levi and Judah (Jubilees 31:17) the same seal he once spoke over Jacob himself.'),
  -- thread: jubilees-31-eternal-testimony-heavenly-tables
  ('jubilees', 'jubilees', 31, 32, 'canon', 'psalms', 139, 16, 'free', E'Psalm 139:16 — *Thine eyes did see my substance, yet being unperfect; and in thy book all my members were written, which in continuance were fashioned, when as yet there was none of them.* The blessing recorded on the heavenly tables (Jubilees 31:32) belongs to the same pre-written book this Psalm names.'),
  ('jubilees', 'jubilees', 31, 32, 'canon', 'malachi', 3, 16, 'free', E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* The eternal testimony inscribed for Levi and Judah (Jubilees 31:32) is this book of remembrance written before Yahuah.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju31_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju31_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-31-bethel-altar-vow',
       E'Up to Bethel again — the altar, the pillar, the vow paid',
       E'Jacob returns to keep what he swore in flight: *“Purify yourselves and change your garments, and let us arise and go up to Bethel, where I vowed a vow to Him on the day when I fled from the face of Esau my brother… and put you away the strange gods that are among you”* (Jubilees 31:1). This is Genesis told again from the inside. The Torah carries the same charge: *“And Elohim (God) said unto Jacob, Arise, go up to Beth-el, and dwell there: and make there an altar unto Elohim (God), that appeared unto thee when thou fleddest from the face of Esau thy brother”* (Genesis 35:1), and Jacob answers, *“Put away the strange gods that are among you, and be clean, and change your garments”* (Genesis 35:2). The altar at Bethel is named in Genesis: *“And he built there an altar, and called the place El-beth-el: because there Elohim (God) appeared unto him, when he fled from the face of his brother”* (Genesis 35:7). And the vow he now comes to pay is the very vow Jubilees itself recorded chapters earlier, when he first slept on the stone: *“And Jacob vowed a vow to Yahuah (God)… of all that you give me, I shall give the tenth to you, my Elohim (God)”* (Jubilees 27:26). It ain''t new — the man keeps his word to Yahuah, and the ground of the ladder becomes the ground of the altar.',
       sv.verse_id, ev.verse_id, 'extras', 53750
  FROM _session251_ju31_lookup sv, _session251_ju31_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=31 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=31 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-31-levi-priesthood-blessing',
       E'Isaac blesses Levi — the priesthood, to stand before Yahuah and teach',
       E'The spirit of prophecy falls on Isaac and he blesses Levi first: *“And may Yahuah (God) give to you and to your seed greatness and great glory, and cause you and your seed, from among all flesh, to approach Him to serve in His sanctuary as the angels of the presence and as the holy ones”* (Jubilees 31:13), and again, *“They will speak the word of Yahuah (God) in righteousness… And they will declare My ways to Jacob And My paths to Yashar’el (Israel)”* (Jubilees 31:15). This is the Levitical office spoken before it exists. Moses blesses the same tribe in the same terms: *“They shall teach Jacob thy judgments, and Yashar''el (Israel) thy law: they shall put incense before thee, and whole burnt sacrifice upon thine altar”* (Deuteronomy 33:10), and earlier, *“At that time Yahuah (LORD) separated the tribe of Levi… to stand before Yahuah (LORD) to minister unto him, and to bless in his name, unto this day”* (Deuteronomy 10:8). The drawing-near to serve in the sanctuary is the gift of Numbers: *“And thy brethren also of the tribe of Levi… that they may be joined unto thee, and minister unto thee”* (Numbers 18:2). And the teaching mouth Isaac names is the covenant of Levi in the prophets: *“For the priest’s lips should keep knowledge, and they should seek the law at his mouth: for he is the messenger of Yahuah Tseva''ot (LORD of hosts)”* (Malachi 2:7). It ain''t new — the priesthood that teaches Torah and stands before Yahuah is engraved here in a patriarch''s blessing.',
       sv.verse_id, ev.verse_id, 'extras', 53753
  FROM _session251_ju31_lookup sv, _session251_ju31_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=31 AND sv.verse_number=13
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=31 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-31-judah-sceptre-salvation',
       E'Isaac blesses Judah — the prince, the sceptre, the salvation of Israel',
       E'Then to the son on his left hand: *“A prince shall you be, you and one of your sons, over the sons of Jacob… In you shall be the help of Jacob, And in you be found the salvation of Yashar’el (Israel)”* (Jubilees 31:18), and *“And when you sit on the throne of the honour of your righteousness, There will be great peace for all the seed of the sons of the beloved”* (Jubilees 31:20). This is the kingship-line and the deliverer, spoken before David, before the Messiah. Jacob''s own blessing in Genesis names the sceptre: *“The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be”* (Genesis 49:10), and *“Yahudah (Judah), thou art he whom thy brethren shall praise: thy hand shall be in the neck of thine enemies”* (Genesis 49:8). Balaam saw the same Sceptre rise: *“there shall come a Star out of Jacob, and a Sceptre shall rise out of Yashar''el (Israel)”* (Numbers 24:17). The New Testament names where that prince came from: *“For it is evident that our Lord sprang out of Juda; of which tribe Moses spake nothing concerning priesthood”* (Hebrews 7:14), and Revelation calls Him the throned Lion: *“behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book”* (Revelation 5:5). The salvation of Israel found in Judah (Jubilees 31:18) is the Messianic sceptre — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53756
  FROM _session251_ju31_lookup sv, _session251_ju31_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=31 AND sv.verse_number=18
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=31 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-31-bless-and-curse-the-seed',
       E'Blessed be he that blesses you — the Abrahamic blessing carried on the tribes',
       E'Both blessings close with the same Abrahamic seal: *“And blessed be he that blesses you, And cursed be every nation that curses you”* (Jubilees 31:17). The covenant given to Abraham now rests on Levi and Judah — the blessing-and-cursing word runs in the seed-line. It is Yahuah''s first promise to Abram: *“And I will bless them that bless thee, and curse him that curseth thee: and in thee shall all families of the earth be blessed”* (Genesis 12:3), and the very words Isaac himself had spoken over Jacob: *“cursed be every one that curseth thee, and blessed be he that blesseth thee”* (Genesis 27:29). The blessing is not new property invented for the tribes — it is the one paternal-seed promise handed down, Abraham to Isaac to Jacob to Levi and Judah, the seed kept and carried.',
       sv.verse_id, ev.verse_id, 'extras', 53759
  FROM _session251_ju31_lookup sv, _session251_ju31_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=31 AND sv.verse_number=17
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=31 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-31-eternal-testimony-heavenly-tables',
       E'Recorded on the heavenly tables — an eternal testimony',
       E'The chapter ends where Jubilees always grounds itself: *“Now I know that I have an eternal hope, and my sons also, before the Elohim (God) of all;” and thus is it ordained concerning the two; and they record it as an eternal testimony to them on the heavenly tables how Isaac blessed them* (Jubilees 31:32). The priesthood of Levi and the kingship of Judah are not improvised — they are written above before they unfold below. This is the heavenly-books framework the rest of Scripture keeps lifting the veil on: *“Thine eyes did see my substance, yet being unperfect; and in thy book all my members were written”* (Psalm 139:16), and *“a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name”* (Malachi 3:16). What Isaac spoke in the spirit of prophecy was already inscribed; the blessing stands as eternal testimony. Torah and its offices are engraved — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53762
  FROM _session251_ju31_lookup sv, _session251_ju31_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=31 AND sv.verse_number=32
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=31 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-31-bethel-altar-vow
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 35:1 — *And Elohim (God) said unto Jacob, Arise, go up to Beth-el, and dwell there: and make there an altar unto Elohim (God), that appeared unto thee when thou fleddest from the face of Esau thy brother.* The same summons to Bethel and the same memory of fleeing Esau stands behind Jubilees 31:1.'
  FROM cross_reference_threads t, cross_references x, _session251_ju31_lookup sv, _session251_ju31_lookup tv
 WHERE t.slug='jubilees-31-bethel-altar-vow'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=31 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 35:2 — *Then Jacob said unto his household, and to all that were with him, Put away the strange gods that are among you, and be clean, and change your garments:* Jacob''s word to his house in Jubilees 31:1 — purify, change garments, put away the strange gods — is this verse retold.'
  FROM cross_reference_threads t, cross_references x, _session251_ju31_lookup sv, _session251_ju31_lookup tv
 WHERE t.slug='jubilees-31-bethel-altar-vow'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=31 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 35:7 — *And he built there an altar, and called the place El-beth-el: because there Elohim (God) appeared unto him, when he fled from the face of his brother.* The altar built at the place where he had slept (Jubilees 31:3) is the El-beth-el altar of Genesis.'
  FROM cross_reference_threads t, cross_references x, _session251_ju31_lookup sv, _session251_ju31_lookup tv
 WHERE t.slug='jubilees-31-bethel-altar-vow'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=31 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 27:26 — *And Jacob arose early in the morning, and took the stone which he had put under his head and set it up as a pillar for a sign… And Jacob vowed a vow to Yahuah (God)… of all that you give me, I shall give the tenth to you, my Elohim (God).* The pillar and the sacrifice of Jubilees 31:3 pay the vow Jubilees first recorded at the ladder.'
  FROM cross_reference_threads t, cross_references x, _session251_ju31_lookup sv, _session251_ju31_lookup tv
 WHERE t.slug='jubilees-31-bethel-altar-vow'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=31 AND sv.verse_number=3
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=27 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-31-levi-priesthood-blessing
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 33:8 — *And of Levi he said, Let thy Thummim and thy Urim be with thy holy one, whom thou didst prove at Massah, and with whom thou didst strive at the waters of Meribah;* Moses'' blessing of Levi as Yahuah''s holy one matches Isaac drawing Levi''s seed near to serve in the sanctuary (Jubilees 31:13).'
  FROM cross_reference_threads t, cross_references x, _session251_ju31_lookup sv, _session251_ju31_lookup tv
 WHERE t.slug='jubilees-31-levi-priesthood-blessing'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=31 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=33 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 33:10 — *They shall teach Jacob thy judgments, and Yashar''el (Israel) thy law: they shall put incense before thee, and whole burnt sacrifice upon thine altar.* Levi declaring Yahuah''s ways to Jacob and His paths to Israel (Jubilees 31:15) is this same teaching office.'
  FROM cross_reference_threads t, cross_references x, _session251_ju31_lookup sv, _session251_ju31_lookup tv
 WHERE t.slug='jubilees-31-levi-priesthood-blessing'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=31 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=33 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 10:8 — *At that time Yahuah (LORD) separated the tribe of Levi, to bear the ark of the covenant of Yahuah (LORD), to stand before Yahuah (LORD) to minister unto him, and to bless in his name, unto this day.* Levi''s seed approaching to serve in the sanctuary (Jubilees 31:13) is the separated tribe that stands before Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju31_lookup sv, _session251_ju31_lookup tv
 WHERE t.slug='jubilees-31-levi-priesthood-blessing'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=31 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Numbers 18:2 — *And thy brethren also of the tribe of Levi, the tribe of thy father, bring thou with thee, that they may be joined unto thee, and minister unto thee: but thou and thy sons with thee shall minister before the tabernacle of witness.* The Levites'' joining to minister is the drawing-near to serve Isaac foretells in Jubilees 31:13.'
  FROM cross_reference_threads t, cross_references x, _session251_ju31_lookup sv, _session251_ju31_lookup tv
 WHERE t.slug='jubilees-31-levi-priesthood-blessing'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=31 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Malachi 2:7 — *For the priest’s lips should keep knowledge, and they should seek the law at his mouth: for he is the messenger of Yahuah Tseva''ot (LORD of hosts).* The mouth that speaks Yahuah''s word in righteousness (Jubilees 31:15) is the covenant of Levi the prophet still holds Levi to.'
  FROM cross_reference_threads t, cross_references x, _session251_ju31_lookup sv, _session251_ju31_lookup tv
 WHERE t.slug='jubilees-31-levi-priesthood-blessing'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=31 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-31-judah-sceptre-salvation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 49:10 — *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be.* The prince-over-the-sons-of-Jacob blessing of Jubilees 31:18 is Jacob''s undeparting sceptre of Judah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju31_lookup sv, _session251_ju31_lookup tv
 WHERE t.slug='jubilees-31-judah-sceptre-salvation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=31 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 49:8 — *Yahudah (Judah), thou art he whom thy brethren shall praise: thy hand shall be in the neck of thine enemies; thy father’s children shall bow down before thee.* Treading down all that hate him and ruling the sons of Jacob (Jubilees 31:18) echoes Judah''s hand on the enemy''s neck.'
  FROM cross_reference_threads t, cross_references x, _session251_ju31_lookup sv, _session251_ju31_lookup tv
 WHERE t.slug='jubilees-31-judah-sceptre-salvation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=31 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 24:17 — *I shall see him, but not now… there shall come a Star out of Jacob, and a Sceptre shall rise out of Yashar''el (Israel), and shall smite the corners of Moab, and destroy all the children of Sheth.* The salvation of Israel in Judah (Jubilees 31:18) is the Sceptre that rises out of Israel.'
  FROM cross_reference_threads t, cross_references x, _session251_ju31_lookup sv, _session251_ju31_lookup tv
 WHERE t.slug='jubilees-31-judah-sceptre-salvation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=31 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=24 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 7:14 — *For it is evident that our Lord sprang out of Juda; of which tribe Moses spake nothing concerning priesthood.* The deliverer found in Judah (Jubilees 31:18) is the Lord the New Testament says sprang out of Judah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju31_lookup sv, _session251_ju31_lookup tv
 WHERE t.slug='jubilees-31-judah-sceptre-salvation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=31 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 5:5 — *And one of the elders saith unto me, Weep not: behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book, and to loose the seven seals thereof.* The throne of righteousness Judah sits on (Jubilees 31:20) is the throne of the Lion of Judah who prevails.'
  FROM cross_reference_threads t, cross_references x, _session251_ju31_lookup sv, _session251_ju31_lookup tv
 WHERE t.slug='jubilees-31-judah-sceptre-salvation'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=31 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-31-bless-and-curse-the-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 12:3 — *And I will bless them that bless thee, and curse him that curseth thee: and in thee shall all families of the earth be blessed.* Isaac''s blessed-be-he-that-blesses-you / cursed-be-the-nation-that-curses-you (Jubilees 31:17) is the Abrahamic promise carried onto Levi.'
  FROM cross_reference_threads t, cross_references x, _session251_ju31_lookup sv, _session251_ju31_lookup tv
 WHERE t.slug='jubilees-31-bless-and-curse-the-seed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=31 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 27:29 — *Let people serve thee, and nations bow down to thee… cursed be every one that curseth thee, and blessed be he that blesseth thee.* Isaac repeats over Levi and Judah (Jubilees 31:17) the same seal he once spoke over Jacob himself.'
  FROM cross_reference_threads t, cross_references x, _session251_ju31_lookup sv, _session251_ju31_lookup tv
 WHERE t.slug='jubilees-31-bless-and-curse-the-seed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=31 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-31-eternal-testimony-heavenly-tables
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 139:16 — *Thine eyes did see my substance, yet being unperfect; and in thy book all my members were written, which in continuance were fashioned, when as yet there was none of them.* The blessing recorded on the heavenly tables (Jubilees 31:32) belongs to the same pre-written book this Psalm names.'
  FROM cross_reference_threads t, cross_references x, _session251_ju31_lookup sv, _session251_ju31_lookup tv
 WHERE t.slug='jubilees-31-eternal-testimony-heavenly-tables'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=31 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* The eternal testimony inscribed for Levi and Judah (Jubilees 31:32) is this book of remembrance written before Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju31_lookup sv, _session251_ju31_lookup tv
 WHERE t.slug='jubilees-31-eternal-testimony-heavenly-tables'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=31 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

