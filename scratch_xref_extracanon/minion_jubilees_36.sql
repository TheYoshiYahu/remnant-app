-- ----- fragment: minion_jubilees_36.sql (session251 jubilees 36) -----
-- Source anchor: jubilees/jubilees ch36. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju36 (view _session251_ju36_lookup). Sort band base 53875, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju36_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-36-double-cave-burial
  ('jubilees', 'jubilees', 36, 2, 'canon', 'genesis', 23, 9, 'free', E'Genesis 23:9 — *That he may give me the cave of Machpelah, which he hath, which is in the end of his field; for as much money as it is worth he shall give it me for a possession of a buryingplace amongst you.* The double cave Isaac names is the Machpelah Abraham bought, retold here in Jubilees 36:2.'),
  ('jubilees', 'jubilees', 36, 2, 'canon', 'genesis', 23, 19, 'free', E'Genesis 23:19 — *And after this, Abraham buried Sarah his wife in the cave of the field of Machpelah before Mamre: the same is Hebron in the land of Canaan.* Sarah was already laid in this same cave that Isaac asks to share in Jubilees 36:2.'),
  ('jubilees', 'jubilees', 36, 2, 'canon', 'genesis', 49, 29, 'free', E'Genesis 49:29 — *And he charged them, and said unto them, I am to be gathered unto my people: bury me with my fathers in the cave that is in the field of Ephron the Hittite.* Jacob will give the very charge Isaac gives in Jubilees 36:2, both naming Ephron''s field.'),
  -- thread: jubilees-36-love-one-another
  ('jubilees', 'jubilees', 36, 4, 'canon', 'leviticus', 19, 18, 'free', E'Leviticus 19:18 — *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* Isaac''s charge to love one''s brother as one''s own soul in Jubilees 36:4 is this Torah command spoken before Sinai.'),
  ('jubilees', 'jubilees', 36, 6, 'canon', 'deuteronomy', 6, 5, 'free', E'Deuteronomy 6:5 — *And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might.* Isaac binds his sons to fear and worship Yahuah in Jubilees 36:6 — the first of the two great commandments.'),
  ('jubilees', 'jubilees', 36, 8, 'canon', 'matthew', 22, 39, 'free', E'Matthew 22:39 — *And the second is like unto it, Thou shalt love thy neighbour as thyself.* Yahusha names the very pairing Isaac''s testament holds in Jubilees 36:8 — love of Yahuah and love of brother.'),
  ('jubilees', 'jubilees', 36, 4, 'canon', 'john', 13, 34, 'free', E'John 13:34 — *A new commandment I give unto you, That ye love one another; as I have loved you, that ye also love one another.* What Yahusha calls a new commandment Isaac already commands in Jubilees 36:4 — new in love''s measure, not in its origin.'),
  ('jubilees', 'jubilees', 36, 9, 'canon', '1-john', 4, 20, 'free', E'1 John 4:20 — *If a man say, I love Elohim (God), and hateth his brother, he is a liar: for he that loveth not his brother whom he hath seen, how can he love Elohim (God) whom he hath not seen?* Isaac''s warning that whoever devises evil against his brother is destroyed (Jubilees 36:9) is the same testimony John gives.'),
  -- thread: jubilees-36-reject-the-idols
  ('jubilees', 'jubilees', 36, 5, 'canon', 'exodus', 20, 3, 'free', E'Exodus 20:3 — *Thou shalt have no other gods before me.* Isaac commands his sons to reject and hate the idols in Jubilees 36:5 — the first word of the Decalogue spoken before Sinai.'),
  ('jubilees', 'jubilees', 36, 5, 'canon', 'exodus', 20, 4, 'free', E'Exodus 20:4 — *Thou shalt make unto thee any graven image, or any likeness of any thing that is in heaven above, or that is in the earth beneath, or that is in the water under the earth.* Isaac''s command against the idols in Jubilees 36:5 is this engraved law of the heavenly tablets.'),
  ('jubilees', 'jubilees', 36, 5, 'jubilees', 'jubilees', 21, 5, 'extras', E'Jubilees 21:5 — *And do you, my son, observe His commandments and His ordinances and His judgments, and walk not after the abominations and after the graven images and after the molten images.* Abraham''s testament to Isaac is the same charge Isaac now passes to his sons in Jubilees 36:5.'),
  ('jubilees', 'jubilees', 36, 5, 'canon', '1-john', 5, 21, 'free', E'1 John 5:21 — *Little children, keep yourselves from idols. Amen.* The apostle''s closing word is Isaac''s dying word in Jubilees 36:5 — flee the idols.'),
  -- thread: jubilees-36-seed-as-the-stars
  ('jubilees', 'jubilees', 36, 6, 'canon', 'genesis', 22, 17, 'free', E'Genesis 22:17 — *That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies.* Isaac in Jubilees 36:6 recalls the very stars-of-heaven oath sworn to Abraham at the binding.'),
  ('jubilees', 'jubilees', 36, 6, 'canon', 'genesis', 26, 4, 'free', E'Genesis 26:4 — *And I will make thy seed to multiply as the stars of heaven, and will give unto thy seed all these countries; and in thy seed shall all the nations of the earth be blessed.* The promise Isaac repeats in Jubilees 36:6 is the one Yahuah had renewed to Isaac directly.'),
  ('jubilees', 'jubilees', 36, 6, 'jubilees', 'jubilees', 21, 24, 'extras', E'Jubilees 21:24 — *And He will bless you in all your deeds, And will raise up from you the plant of righteousness through all the earth, throughout all generations of the earth, And my name and your name will not be forgotten under heaven for ever.* Isaac''s plant-of-righteousness blessing in Jubilees 36:6 echoes the blessing Abraham spoke before him.'),
  -- thread: jubilees-36-book-of-life
  ('jubilees', 'jubilees', 36, 10, 'canon', 'exodus', 32, 32, 'free', E'Exodus 32:32 — *Yet now, if thou wilt forgive their sin—; and if not, blot me, I pray thee, out of thy book which thou hast written.* The book of life from which the evildoer is blotted in Jubilees 36:10 is the very book Moses names at Sinai.'),
  ('jubilees', 'jubilees', 36, 10, 'canon', 'psalms', 69, 28, 'free', E'Psalms 69:28 — *Let them be blotted out of the book of the living, and not be written with the righteous.* Isaac''s sentence in Jubilees 36:10 — blotted from the book of life, recorded for destruction — is the psalmist''s plea against the wicked.'),
  ('jubilees', 'jubilees', 36, 10, 'canon', 'revelation', 20, 15, 'free', E'Revelation 20:15 — *And whosoever was not found written in the book of life was cast into the lake of fire.* The destruction-appointed ledger Isaac names in Jubilees 36:10 is sealed at the white throne.'),
  -- thread: jubilees-36-isaac-dies-buried
  ('jubilees', 'jubilees', 36, 18, 'canon', 'genesis', 35, 28, 'free', E'Genesis 35:28 — *And the days of Isaac were an hundred and fourscore years.* Jubilees 36:18 gives the identical age — one hundred and eighty years — at Isaac''s death.'),
  ('jubilees', 'jubilees', 36, 18, 'canon', 'genesis', 35, 29, 'free', E'Genesis 35:29 — *And Isaac gave up the ghost, and died, and was gathered unto his people, being old and full of days: and his sons Esau and Jacob buried him.* Jubilees 36:18 retells this verse — Isaac dies and his two sons Esau and Jacob bury him.'),
  ('jubilees', 'jubilees', 36, 19, 'canon', 'genesis', 36, 8, 'free', E'Genesis 36:8 — *Thus dwelt Esau in mount Seir: Esau is Edom.* Jubilees 36:19 records the same departure of the elder brother to the mountains of Seir — the Esau-Edom line dividing from the elect line of Jacob.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju36_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju36_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-36-double-cave-burial',
       E'Bury me near Abraham in the double cave',
       E'Isaac, going the way of his fathers, charges his sons: *Wherefore bury me near Abraham my father, in the double cave in the field of Ephron the Hittite, where Abraham purchased a sepulchre to bury in* (Jubilees 36:2). This is the Machpelah of Genesis, the field bought for a burying-place — *That he may give me the cave of Machpelah, which he hath, which is in the end of his field; for as much money as it is worth he shall give it me for a possession of a buryingplace amongst you* (Genesis 23:9) — where Abraham had already laid Sarah: *And after this, Abraham buried Sarah his wife in the cave of the field of Machpelah before Mamre: the same is Hebron in the land of Canaan* (Genesis 23:19). Jacob will repeat the same charge over the same cave — *bury me with my fathers in the cave that is in the field of Ephron the Hittite* (Genesis 49:29). Jubilees retells Genesis: the patriarchs are gathered to one ground. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53875
  FROM _session251_ju36_lookup sv, _session251_ju36_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=36 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=36 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-36-love-one-another',
       E'Love one another as a man loves his own soul',
       E'Isaac''s dying testament is the two great commandments grounded in the patriarch: *And love one another, my sons, your brothers as a man who loves his own soul, and let each seek in what he may benefit his brother, and act together on the earth; and let them love each other as their own souls* (Jubilees 36:4). That is the Torah word verbatim — *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18) — set beside the first command Isaac also presses, to fear and worship Yahuah: *And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might* (Deuteronomy 6:5). Yahusha hangs all the Law and the prophets on these two: *And the second is like unto it, Thou shalt love thy neighbour as thyself* (Matthew 22:39). When He said *A new commandment I give unto you, That ye love one another* (John 13:34) it was new only in measure, not in substance — Isaac is already commanding it. And John seals the testament: *If a man say, I love Elohim (God), and hateth his brother, he is a liar* (1 John 4:20). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53878
  FROM _session251_ju36_lookup sv, _session251_ju36_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=36 AND sv.verse_number=4
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=36 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-36-reject-the-idols',
       E'Reject the idols and hate them',
       E'Isaac''s testament flees idolatry no less than it commands love: *And concerning the question of idols, I command and admonish you to reject them and hate them, and love them not; for they are full of deception for those that worship them and for those that bow down to them* (Jubilees 36:5). This is the heart of the commandment given at Sinai — *Thou shalt have no other gods before me* (Exodus 20:3); *Thou shalt make unto thee any graven image* (Exodus 20:4) — but Isaac speaks it long before. His father Abraham''s own testament had said the same in Jubilees: *And do you, my son, observe His commandments and His ordinances and His judgments, and walk not after the abominations and after the graven images and after the molten images* (Jubilees 21:5). And the apostle''s last word closes the same circle: *Little children, keep yourselves from idols. Amen* (1 John 5:21). The abominations were always to be hated. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53881
  FROM _session251_ju36_lookup sv, _session251_ju36_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=36 AND sv.verse_number=5
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=36 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-36-seed-as-the-stars',
       E'Multiply your seed as the stars, the plant of righteousness',
       E'Isaac recalls the covenant promise as he blesses: *that He might multiply you and increase your seed as the stars of heaven in multitude, and establish you on the earth as the plant of righteousness which will not be rooted out to all the generations for ever* (Jubilees 36:6). This is the oath sworn to Abraham at the binding — *That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore* (Genesis 22:17) — and renewed to Isaac himself: *And I will make thy seed to multiply as the stars of heaven, and will give unto thy seed all these countries* (Genesis 26:4). The plant-of-righteousness language is Jubilees'' own, already spoken over Abraham: *And He will bless you in all your deeds, And will raise up from you the plant of righteousness through all the earth* (Jubilees 21:24). The seed is kept and rooted forever. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53884
  FROM _session251_ju36_lookup sv, _session251_ju36_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=36 AND sv.verse_number=6
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=36 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-36-book-of-life',
       E'Blotted from the book of life',
       E'Isaac''s warning against the brother who devises evil reaches to the final ledger: *he will be blotted out of the book of the discipline of the children of men, and not be recorded in the book of life, but in that which is appointed to destruction* (Jubilees 36:10). The book is the heavenly tablet of judgement. Moses pled at that same book — *blot me, I pray thee, out of thy book which thou hast written* (Exodus 32:32) — and the psalmist invoked it against the wicked: *Let them be blotted out of the book of the living, and not be written with the righteous* (Psalm 69:28). The Revelation closes the testament Isaac opens: *And whosoever was not found written in the book of life was cast into the lake of fire* (Revelation 20:15). The names were written and weighed before they were lived. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53887
  FROM _session251_ju36_lookup sv, _session251_ju36_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=36 AND sv.verse_number=9
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=36 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-36-isaac-dies-buried',
       E'Isaac slept the eternal sleep; his sons buried him',
       E'The retelling closes on the Genesis verse exactly: *And Isaac slept on his bed that day rejoicing; and he slept the eternal sleep, and died one hundred and eighty years old... and his two sons Esau and Jacob buried him* (Jubilees 36:18). Genesis gives the same age and the same burial by the same two sons: *And the days of Isaac were an hundred and fourscore years* (Genesis 35:28); *And Isaac gave up the ghost, and died, and was gathered unto his people, being old and full of days: and his sons Esau and Jacob buried him* (Genesis 35:29). And Esau departs to his portion — *And Esau went to the land of Edom, to the mountains of Seir, and dwelt there* (Jubilees 36:19) — as Genesis records the division of the brothers: *Thus dwelt Esau in mount Seir: Esau is Edom* (Genesis 36:8). The elder to Seir, the younger keeping his father''s tower. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53890
  FROM _session251_ju36_lookup sv, _session251_ju36_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=36 AND sv.verse_number=18
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=36 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-36-double-cave-burial
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 23:9 — *That he may give me the cave of Machpelah, which he hath, which is in the end of his field; for as much money as it is worth he shall give it me for a possession of a buryingplace amongst you.* The double cave Isaac names is the Machpelah Abraham bought, retold here in Jubilees 36:2.'
  FROM cross_reference_threads t, cross_references x, _session251_ju36_lookup sv, _session251_ju36_lookup tv
 WHERE t.slug='jubilees-36-double-cave-burial'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=36 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=23 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 23:19 — *And after this, Abraham buried Sarah his wife in the cave of the field of Machpelah before Mamre: the same is Hebron in the land of Canaan.* Sarah was already laid in this same cave that Isaac asks to share in Jubilees 36:2.'
  FROM cross_reference_threads t, cross_references x, _session251_ju36_lookup sv, _session251_ju36_lookup tv
 WHERE t.slug='jubilees-36-double-cave-burial'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=36 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=23 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 49:29 — *And he charged them, and said unto them, I am to be gathered unto my people: bury me with my fathers in the cave that is in the field of Ephron the Hittite.* Jacob will give the very charge Isaac gives in Jubilees 36:2, both naming Ephron''s field.'
  FROM cross_reference_threads t, cross_references x, _session251_ju36_lookup sv, _session251_ju36_lookup tv
 WHERE t.slug='jubilees-36-double-cave-burial'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=36 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-36-love-one-another
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:18 — *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* Isaac''s charge to love one''s brother as one''s own soul in Jubilees 36:4 is this Torah command spoken before Sinai.'
  FROM cross_reference_threads t, cross_references x, _session251_ju36_lookup sv, _session251_ju36_lookup tv
 WHERE t.slug='jubilees-36-love-one-another'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=36 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 6:5 — *And thou shalt love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, and with all thy might.* Isaac binds his sons to fear and worship Yahuah in Jubilees 36:6 — the first of the two great commandments.'
  FROM cross_reference_threads t, cross_references x, _session251_ju36_lookup sv, _session251_ju36_lookup tv
 WHERE t.slug='jubilees-36-love-one-another'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=36 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 22:39 — *And the second is like unto it, Thou shalt love thy neighbour as thyself.* Yahusha names the very pairing Isaac''s testament holds in Jubilees 36:8 — love of Yahuah and love of brother.'
  FROM cross_reference_threads t, cross_references x, _session251_ju36_lookup sv, _session251_ju36_lookup tv
 WHERE t.slug='jubilees-36-love-one-another'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=36 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=22 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 13:34 — *A new commandment I give unto you, That ye love one another; as I have loved you, that ye also love one another.* What Yahusha calls a new commandment Isaac already commands in Jubilees 36:4 — new in love''s measure, not in its origin.'
  FROM cross_reference_threads t, cross_references x, _session251_ju36_lookup sv, _session251_ju36_lookup tv
 WHERE t.slug='jubilees-36-love-one-another'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=36 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=13 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 John 4:20 — *If a man say, I love Elohim (God), and hateth his brother, he is a liar: for he that loveth not his brother whom he hath seen, how can he love Elohim (God) whom he hath not seen?* Isaac''s warning that whoever devises evil against his brother is destroyed (Jubilees 36:9) is the same testimony John gives.'
  FROM cross_reference_threads t, cross_references x, _session251_ju36_lookup sv, _session251_ju36_lookup tv
 WHERE t.slug='jubilees-36-love-one-another'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=36 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=4 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-36-reject-the-idols
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:3 — *Thou shalt have no other gods before me.* Isaac commands his sons to reject and hate the idols in Jubilees 36:5 — the first word of the Decalogue spoken before Sinai.'
  FROM cross_reference_threads t, cross_references x, _session251_ju36_lookup sv, _session251_ju36_lookup tv
 WHERE t.slug='jubilees-36-reject-the-idols'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=36 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 20:4 — *Thou shalt make unto thee any graven image, or any likeness of any thing that is in heaven above, or that is in the earth beneath, or that is in the water under the earth.* Isaac''s command against the idols in Jubilees 36:5 is this engraved law of the heavenly tablets.'
  FROM cross_reference_threads t, cross_references x, _session251_ju36_lookup sv, _session251_ju36_lookup tv
 WHERE t.slug='jubilees-36-reject-the-idols'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=36 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 21:5 — *And do you, my son, observe His commandments and His ordinances and His judgments, and walk not after the abominations and after the graven images and after the molten images.* Abraham''s testament to Isaac is the same charge Isaac now passes to his sons in Jubilees 36:5.'
  FROM cross_reference_threads t, cross_references x, _session251_ju36_lookup sv, _session251_ju36_lookup tv
 WHERE t.slug='jubilees-36-reject-the-idols'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=36 AND sv.verse_number=5
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=21 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 John 5:21 — *Little children, keep yourselves from idols. Amen.* The apostle''s closing word is Isaac''s dying word in Jubilees 36:5 — flee the idols.'
  FROM cross_reference_threads t, cross_references x, _session251_ju36_lookup sv, _session251_ju36_lookup tv
 WHERE t.slug='jubilees-36-reject-the-idols'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=36 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=5 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-36-seed-as-the-stars
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 22:17 — *That in blessing I will bless thee, and in multiplying I will multiply thy seed as the stars of the heaven, and as the sand which is upon the sea shore; and thy seed shall possess the gate of his enemies.* Isaac in Jubilees 36:6 recalls the very stars-of-heaven oath sworn to Abraham at the binding.'
  FROM cross_reference_threads t, cross_references x, _session251_ju36_lookup sv, _session251_ju36_lookup tv
 WHERE t.slug='jubilees-36-seed-as-the-stars'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=36 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 26:4 — *And I will make thy seed to multiply as the stars of heaven, and will give unto thy seed all these countries; and in thy seed shall all the nations of the earth be blessed.* The promise Isaac repeats in Jubilees 36:6 is the one Yahuah had renewed to Isaac directly.'
  FROM cross_reference_threads t, cross_references x, _session251_ju36_lookup sv, _session251_ju36_lookup tv
 WHERE t.slug='jubilees-36-seed-as-the-stars'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=36 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 21:24 — *And He will bless you in all your deeds, And will raise up from you the plant of righteousness through all the earth, throughout all generations of the earth, And my name and your name will not be forgotten under heaven for ever.* Isaac''s plant-of-righteousness blessing in Jubilees 36:6 echoes the blessing Abraham spoke before him.'
  FROM cross_reference_threads t, cross_references x, _session251_ju36_lookup sv, _session251_ju36_lookup tv
 WHERE t.slug='jubilees-36-seed-as-the-stars'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=36 AND sv.verse_number=6
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=21 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-36-book-of-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 32:32 — *Yet now, if thou wilt forgive their sin—; and if not, blot me, I pray thee, out of thy book which thou hast written.* The book of life from which the evildoer is blotted in Jubilees 36:10 is the very book Moses names at Sinai.'
  FROM cross_reference_threads t, cross_references x, _session251_ju36_lookup sv, _session251_ju36_lookup tv
 WHERE t.slug='jubilees-36-book-of-life'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=36 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 69:28 — *Let them be blotted out of the book of the living, and not be written with the righteous.* Isaac''s sentence in Jubilees 36:10 — blotted from the book of life, recorded for destruction — is the psalmist''s plea against the wicked.'
  FROM cross_reference_threads t, cross_references x, _session251_ju36_lookup sv, _session251_ju36_lookup tv
 WHERE t.slug='jubilees-36-book-of-life'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=36 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=69 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 20:15 — *And whosoever was not found written in the book of life was cast into the lake of fire.* The destruction-appointed ledger Isaac names in Jubilees 36:10 is sealed at the white throne.'
  FROM cross_reference_threads t, cross_references x, _session251_ju36_lookup sv, _session251_ju36_lookup tv
 WHERE t.slug='jubilees-36-book-of-life'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=36 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=20 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-36-isaac-dies-buried
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 35:28 — *And the days of Isaac were an hundred and fourscore years.* Jubilees 36:18 gives the identical age — one hundred and eighty years — at Isaac''s death.'
  FROM cross_reference_threads t, cross_references x, _session251_ju36_lookup sv, _session251_ju36_lookup tv
 WHERE t.slug='jubilees-36-isaac-dies-buried'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=36 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 35:29 — *And Isaac gave up the ghost, and died, and was gathered unto his people, being old and full of days: and his sons Esau and Jacob buried him.* Jubilees 36:18 retells this verse — Isaac dies and his two sons Esau and Jacob bury him.'
  FROM cross_reference_threads t, cross_references x, _session251_ju36_lookup sv, _session251_ju36_lookup tv
 WHERE t.slug='jubilees-36-isaac-dies-buried'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=36 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=35 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 36:8 — *Thus dwelt Esau in mount Seir: Esau is Edom.* Jubilees 36:19 records the same departure of the elder brother to the mountains of Seir — the Esau-Edom line dividing from the elect line of Jacob.'
  FROM cross_reference_threads t, cross_references x, _session251_ju36_lookup sv, _session251_ju36_lookup tv
 WHERE t.slug='jubilees-36-isaac-dies-buried'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=36 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=36 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

