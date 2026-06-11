-- ----- fragment: minion_jubilees_27.sql (session251 jubilees 27) -----
-- Source anchor: jubilees/jubilees ch27. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju27 (view _session251_ju27_lookup). Sort band base 53650, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju27_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-27-take-no-wife-of-canaan
  ('jubilees', 'jubilees', 27, 8, 'canon', 'genesis', 24, 3, 'free', E'Genesis 24:3 — *And I will make thee swear by Yahuah (LORD), the Elohim (God) of heaven, and the Elohim (God) of the earth, that thou shalt not take a wife unto my son of the daughters of the Canaanites, among whom I dwell:* The same oath Abraham bound a generation before now drives Rebecca''s grief over Esau''s Canaanite wives in Jubilees 27:8.'),
  ('jubilees', 'jubilees', 27, 10, 'canon', 'genesis', 28, 1, 'free', E'Genesis 28:1 — *And Isaac called Jacob, and blessed him, and charged him, and said unto him, Thou shalt not take a wife of the daughters of Canaan.* Jubilees 27:10 retells Isaac''s charge almost word for word — the Genesis source on the page beside it.'),
  ('jubilees', 'jubilees', 27, 10, 'canon', 'deuteronomy', 7, 3, 'free', E'Deuteronomy 7:3 — *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son.* The standing Torah law of the seed kept separate that Jubilees 27:10''s charge embodies.'),
  ('jubilees', 'jubilees', 27, 8, 'jubilees', 'jubilees', 30, 11, 'extras', E'Jubilees 30:11 — *And do you, Moses, command the children of Yashar’el (Israel) and exhort them not to give their daughters to the nations, and not to take for their sons any of the daughters of the nations, for this is abominable before Yahuah (God).* Jubilees'' own self-witness that the seed is kept holy — the covenant-line preserved, the same principle Rebecca pleads in 27:8.'),
  -- thread: jubilees-27-isaac-blessing-mesopotamia
  ('jubilees', 'jubilees', 27, 11, 'canon', 'genesis', 28, 3, 'free', E'Genesis 28:3 — *And El Shaddai (God Almighty) bless thee, and make thee fruitful, and multiply thee, that thou mayest be a multitude of people;* Jubilees 27:11 carries Isaac''s El-Shaddai blessing word for word — the company of nations promised to the seed.'),
  ('jubilees', 'jubilees', 27, 11, 'canon', 'genesis', 28, 4, 'free', E'Genesis 28:4 — *And give thee the blessing of Abraham, to thee, and to thy seed with thee; that thou mayest inherit the land wherein thou art a stranger, which Elohim (God) gave unto Abraham.* The blessing of Abraham and the inheritance of the land that Jubilees 27:11 hands down to Jacob.'),
  ('jubilees', 'jubilees', 27, 11, 'canon', 'genesis', 28, 5, 'free', E'Genesis 28:5 — *And Isaac sent away Jacob: and he went to Padan-aram unto Laban, son of Bethuel the Syrian, the brother of Rebekah, Jacob’s and Esau’s mother.* The sending to Mesopotamia/Padan-aram that Jubilees 27:11 records in its own words.'),
  -- thread: jubilees-27-bethel-ladder-john1-51
  ('jubilees', 'jubilees', 27, 21, 'canon', 'genesis', 28, 12, 'free', E'Genesis 28:12 — *And he dreamed, and behold a ladder set up on the earth, and the top of it reached to heaven: and behold the angels of Elohim (God) ascending and descending on it.* Jubilees 27:21 retells the Bethel dream almost verbatim — the ladder and the ascending-descending angels.'),
  ('jubilees', 'jubilees', 27, 21, 'canon', 'genesis', 28, 13, 'free', E'Genesis 28:13 — *And, behold, Yahuah (LORD) stood above it, and said, I am Yahuah Elohim (the LORD God) of Abraham thy father, and the Elohim (God) of Isaac: the land whereon thou liest, to thee will I give it, and to thy seed;* The voice from atop the ladder in Jubilees 27:21 quoting the covenant of the land and the seed.'),
  ('jubilees', 'jubilees', 27, 21, 'canon', 'john', 1, 51, 'free', E'John 1:51 — *And he saith unto him, Verily, verily, I say unto you, Hereafter ye shall see heaven open, and the angels of Elohim (God) ascending and descending upon the Son of Adam.* Yahusha unveils Jacob''s ladder of Jubilees 27:21 as Himself — the open heaven and the angels now resting upon the Son of Adam.'),
  ('jubilees', 'jubilees', 27, 19, 'canon', 'genesis', 28, 11, 'free', E'Genesis 28:11 — *And he lighted upon a certain place, and tarried there all night, because the sun was set; and he took of the stones of that place, and put them for his pillows, and lay down in that place to sleep.* The stone-pillow at the set of the sun that Jubilees 27:19-20 narrates in its own words.'),
  -- thread: jubilees-27-seed-as-dust-all-families-blessed
  ('jubilees', 'jubilees', 27, 23, 'canon', 'genesis', 28, 14, 'free', E'Genesis 28:14 — *And thy seed shall be as the dust of the earth, and thou shalt spread abroad to the west, and to the east, and to the north, and to the south: and in thee and in thy seed shall all the families of the earth be blessed.* Jubilees 27:23 retells the Bethel promise nearly verbatim — the seed as dust and the families blessed.'),
  ('jubilees', 'jubilees', 27, 23, 'canon', 'genesis', 12, 2, 'free', E'Genesis 12:2 — *And I will make of thee a great nation, and I will bless thee, and make thy name great; and thou shalt be a blessing:* The first word of the promise to Abraham that Jubilees 27:23 hands down unbroken to Jacob.'),
  ('jubilees', 'jubilees', 27, 23, 'canon', 'galatians', 3, 8, 'free', E'Galatians 3:8 — *And the scripture, foreseeing that Elohim (God) would justify the heathen through faith, preached before the gospel unto Abraham, saying, In thee shall all nations be blessed.* Paul calls the all-families promise of Jubilees 27:23 the gospel preached beforehand — the nations blessed by faith.'),
  -- thread: jubilees-27-i-am-with-thee-will-keep-thee
  ('jubilees', 'jubilees', 27, 24, 'canon', 'genesis', 28, 15, 'free', E'Genesis 28:15 — *And, behold, I am with thee, and will keep thee in all places whither thou goest, and will bring thee again into this land; for I will not leave thee, until I have done that which I have spoken to thee of.* Jubilees 27:24 carries the promise of presence and safe return word for word from the Bethel vision.'),
  ('jubilees', 'jubilees', 27, 15, 'jubilees', 'jubilees', 27, 15, 'extras', E'Jubilees 27:15 — *The El Elyon (Most High) Elohim (God) will preserve him from all evil, and will be with him; for He will not forsake him all his days;* Isaac''s earlier blessing in this same chapter foresees the very keeping that Yahuah Himself confirms at Bethel in 27:24.'),
  -- thread: jubilees-27-bethel-pillar-vow-tithe
  ('jubilees', 'jubilees', 27, 26, 'canon', 'genesis', 28, 18, 'free', E'Genesis 28:18 — *And Jacob rose up early in the morning, and took the stone that he had put for his pillows, and set it up for a pillar, and poured oil upon the top of it.* Jubilees 27:26 retells the raising and anointing of the Bethel pillar nearly verbatim.'),
  ('jubilees', 'jubilees', 27, 25, 'canon', 'genesis', 28, 17, 'free', E'Genesis 28:17 — *And he was afraid, and said, How dreadful is this place! this is none other but the house of Elohim (God), and this is the gate of heaven.* Jacob''s dread and the “gate of heaven” cry of Jubilees 27:25 word for word from Genesis.'),
  ('jubilees', 'jubilees', 27, 26, 'canon', 'genesis', 14, 20, 'free', E'Genesis 14:20 — *And blessed be the El Elyon (most high God), which hath delivered thine enemies into thy hand. And he gave him tithes of all.* Abraham tithed before Jacob ever did — the tenth Jacob vows in Jubilees 27:26 is the fathers'' practice, not a new thing.'),
  ('jubilees', 'jubilees', 27, 26, 'canon', 'leviticus', 27, 30, 'free', E'Leviticus 27:30 — *And all the tithe of the land, whether of the seed of the land, or of the fruit of the tree, is the LORD’S: it is holy unto Yahuah (LORD).* The Torah engraves as holy the very tithe Jacob vows to Yahuah at Bethel in Jubilees 27:26.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju27_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju27_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-27-take-no-wife-of-canaan',
       E'Take no wife of Canaan — the seed kept holy',
       E'Rebecca''s whole plea sends Jacob away so the seed-line is not lost to Canaan: *“I loathe my life because of the two daughters of Heth, whom Esau has taken him as wives; and if Jacob take a wife from among the daughters of the land such as these, for what purpose do I further live; for the daughters of Canaan are evil.”* (Jubilees 27:8). Isaac''s charge follows: *“Do not take you a wife of any of the daughters of Canaan; arise and go to Mesopotamia, to the house of Bethuel, your mother’s father, and take you a wife from thence of the daughters of Laban, your mother’s brother.”* (Jubilees 27:10). This is the same oath Abraham bound on his servant a generation before — *And I will make thee swear by Yahuah (LORD)… that thou shalt not take a wife unto my son of the daughters of the Canaanites, among whom I dwell* (Genesis 24:3) — and the standing law of the seed kept separate from the nations, *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son* (Deuteronomy 7:3). Jubilees itself frames this not as racism but as the paternal covenant-seed preserved holy: *do you, Moses, command the children of Yashar’el (Israel)… not to give their daughters to the nations, and not to take for their sons any of the daughters of the nations* (Jubilees 30:11). It ain''t new — the line is guarded so the Messiah''s seed comes through.',
       sv.verse_id, ev.verse_id, 'extras', 53650
  FROM _session251_ju27_lookup sv, _session251_ju27_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=27 AND sv.verse_number=8
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=27 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-27-isaac-blessing-mesopotamia',
       E'Isaac''s blessing — the blessing of Abraham passed to Jacob',
       E'As he sends Jacob to find a wife of his own kindred, Isaac lays the Abrahamic blessing on him: *“And El Shaddai (God Almighty) bless you and increase and multiply you that you may become a company of nations, and give you the blessings of my father Abraham, to you and to your seed after you, that you may inherit the land of your sojournings and all the land which Elohim (God) gave to Abraham: go, my son, in peace.”* (Jubilees 27:11). This is Genesis 28 retold nearly verbatim — *And El Shaddai (God Almighty) bless thee, and make thee fruitful, and multiply thee, that thou mayest be a multitude of people* (Genesis 28:3) and *And give thee the blessing of Abraham, to thee, and to thy seed with thee; that thou mayest inherit the land wherein thou art a stranger, which Elohim (God) gave unto Abraham* (Genesis 28:4). The election runs through the chosen son: the blessing is not earned but conferred, the land and the seed handed down the covenant-line.',
       sv.verse_id, ev.verse_id, 'extras', 53653
  FROM _session251_ju27_lookup sv, _session251_ju27_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=27 AND sv.verse_number=10
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=27 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-27-bethel-ladder-john1-51',
       E'The ladder at Bethel — the angels ascending and descending',
       E'The night Jacob sleeps with a stone for his pillow, the heavens open: *And he dreamt that night, and behold a ladder set up on the earth, and the top of it reached to heaven, and behold, the angels of Yahuah (God) ascended and descended on it: and behold, Yahuah (God) stood upon it.* (Jubilees 27:21). This is Genesis 28 retold — *And he dreamed, and behold a ladder set up on the earth, and the top of it reached to heaven: and behold the angels of Elohim (God) ascending and descending on it* (Genesis 28:12), and *And, behold, Yahuah (LORD) stood above it, and said, I am Yahuah Elohim (the LORD God) of Abraham thy father, and the Elohim (God) of Isaac: the land whereon thou liest, to thee will I give it, and to thy seed* (Genesis 28:13). And the Messiah Himself unveils what the ladder always was — the open heaven and the angels traffic, now resting on Him: *Verily, verily, I say unto you, Hereafter ye shall see heaven open, and the angels of Elohim (God) ascending and descending upon the Son of Adam* (John 1:51). The ladder is a Person. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53656
  FROM _session251_ju27_lookup sv, _session251_ju27_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=27 AND sv.verse_number=19
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=27 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-27-seed-as-dust-all-families-blessed',
       E'Thy seed as the dust — in thee all families blessed',
       E'From atop the ladder the covenant is renewed in full: *And your seed will be as the dust of the earth, and you will increase to the west and to the east, to the north and the south, and in you and in your seed will all the families of the nations be blessed.* (Jubilees 27:23). This is Genesis 28:14 retold — *And thy seed shall be as the dust of the earth, and thou shalt spread abroad to the west, and to the east, and to the north, and to the south: and in thee and in thy seed shall all the families of the earth be blessed* (Genesis 28:14) — the same word first spoken to Abraham, *And I will make of thee a great nation, and I will bless thee, and make thy name great; and thou shalt be a blessing* (Genesis 12:2). Paul names what “all the families” means: the gospel preached ahead of time — *the scripture, foreseeing that Elohim (God) would justify the heathen through faith, preached before the gospel unto Abraham, saying, In thee shall all nations be blessed* (Galatians 3:8). The blessing of the nations was promised at Bethel; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53659
  FROM _session251_ju27_lookup sv, _session251_ju27_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=27 AND sv.verse_number=23
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=27 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-27-i-am-with-thee-will-keep-thee',
       E'I shall be with thee and keep thee',
       E'The covenant word closes with a promise of presence and safe return: *And behold, I shall be with you, and shall keep you whithersoever you go, and I shall bring you again into this land in peace; for I shall not leave you until I do everything that I told you of.* (Jubilees 27:24). It is Genesis 28:15 word for word — *And, behold, I am with thee, and will keep thee in all places whither thou goest, and will bring thee again into this land; for I will not leave thee, until I have done that which I have spoken to thee of* (Genesis 28:15). And it is the same keeping Isaac had already foreseen over his son: *The El Elyon (Most High) Elohim (God) will preserve him from all evil, and will be with him; for He will not forsake him all his days* (Jubilees 27:15). The God who keeps the covenant keeps the man.',
       sv.verse_id, ev.verse_id, 'extras', 53662
  FROM _session251_ju27_lookup sv, _session251_ju27_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=27 AND sv.verse_number=24
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=27 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-27-bethel-pillar-vow-tithe',
       E'The pillar, the vow, and the tithe at Bethel',
       E'Waking in dread, Jacob marks the place and binds himself to Yahuah: *And Jacob awoke from his sleep, and said, “Truly this place is the house of Yahuah (God), and I knew it not.”* (Jubilees 27:25), and then *he… took the stone which he had put under his head and set it up as a pillar for a sign, and he poured oil upon the top of it. And he called the name of that place Bethel… And Jacob vowed a vow to Yahuah (God)… then shall Yahuah (God) be my Elohim (God)… and of all that you give me, I shall give the tenth to you, my Elohim (God)* (Jubilees 27:26). Genesis tells it the same — *And Jacob rose up early in the morning, and took the stone that he had put for his pillows, and set it up for a pillar, and poured oil upon the top of it* (Genesis 28:18). And the tenth Jacob vows is no new thing: Abraham gave it before him — *And he gave him tithes of all* (Genesis 14:20) — and the Torah engraves it as holy — *And all the tithe of the land, whether of the seed of the land, or of the fruit of the tree, is the LORD’S: it is holy unto Yahuah (LORD)* (Leviticus 27:30). The pillar, the house of God, and the tithe stand from the fathers. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53665
  FROM _session251_ju27_lookup sv, _session251_ju27_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=27 AND sv.verse_number=25
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=27 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-27-take-no-wife-of-canaan
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 24:3 — *And I will make thee swear by Yahuah (LORD), the Elohim (God) of heaven, and the Elohim (God) of the earth, that thou shalt not take a wife unto my son of the daughters of the Canaanites, among whom I dwell:* The same oath Abraham bound a generation before now drives Rebecca''s grief over Esau''s Canaanite wives in Jubilees 27:8.'
  FROM cross_reference_threads t, cross_references x, _session251_ju27_lookup sv, _session251_ju27_lookup tv
 WHERE t.slug='jubilees-27-take-no-wife-of-canaan'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=27 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 28:1 — *And Isaac called Jacob, and blessed him, and charged him, and said unto him, Thou shalt not take a wife of the daughters of Canaan.* Jubilees 27:10 retells Isaac''s charge almost word for word — the Genesis source on the page beside it.'
  FROM cross_reference_threads t, cross_references x, _session251_ju27_lookup sv, _session251_ju27_lookup tv
 WHERE t.slug='jubilees-27-take-no-wife-of-canaan'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=27 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 7:3 — *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son.* The standing Torah law of the seed kept separate that Jubilees 27:10''s charge embodies.'
  FROM cross_reference_threads t, cross_references x, _session251_ju27_lookup sv, _session251_ju27_lookup tv
 WHERE t.slug='jubilees-27-take-no-wife-of-canaan'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=27 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 30:11 — *And do you, Moses, command the children of Yashar’el (Israel) and exhort them not to give their daughters to the nations, and not to take for their sons any of the daughters of the nations, for this is abominable before Yahuah (God).* Jubilees'' own self-witness that the seed is kept holy — the covenant-line preserved, the same principle Rebecca pleads in 27:8.'
  FROM cross_reference_threads t, cross_references x, _session251_ju27_lookup sv, _session251_ju27_lookup tv
 WHERE t.slug='jubilees-27-take-no-wife-of-canaan'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=27 AND sv.verse_number=8
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=30 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-27-isaac-blessing-mesopotamia
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 28:3 — *And El Shaddai (God Almighty) bless thee, and make thee fruitful, and multiply thee, that thou mayest be a multitude of people;* Jubilees 27:11 carries Isaac''s El-Shaddai blessing word for word — the company of nations promised to the seed.'
  FROM cross_reference_threads t, cross_references x, _session251_ju27_lookup sv, _session251_ju27_lookup tv
 WHERE t.slug='jubilees-27-isaac-blessing-mesopotamia'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=27 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 28:4 — *And give thee the blessing of Abraham, to thee, and to thy seed with thee; that thou mayest inherit the land wherein thou art a stranger, which Elohim (God) gave unto Abraham.* The blessing of Abraham and the inheritance of the land that Jubilees 27:11 hands down to Jacob.'
  FROM cross_reference_threads t, cross_references x, _session251_ju27_lookup sv, _session251_ju27_lookup tv
 WHERE t.slug='jubilees-27-isaac-blessing-mesopotamia'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=27 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 28:5 — *And Isaac sent away Jacob: and he went to Padan-aram unto Laban, son of Bethuel the Syrian, the brother of Rebekah, Jacob’s and Esau’s mother.* The sending to Mesopotamia/Padan-aram that Jubilees 27:11 records in its own words.'
  FROM cross_reference_threads t, cross_references x, _session251_ju27_lookup sv, _session251_ju27_lookup tv
 WHERE t.slug='jubilees-27-isaac-blessing-mesopotamia'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=27 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-27-bethel-ladder-john1-51
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 28:12 — *And he dreamed, and behold a ladder set up on the earth, and the top of it reached to heaven: and behold the angels of Elohim (God) ascending and descending on it.* Jubilees 27:21 retells the Bethel dream almost verbatim — the ladder and the ascending-descending angels.'
  FROM cross_reference_threads t, cross_references x, _session251_ju27_lookup sv, _session251_ju27_lookup tv
 WHERE t.slug='jubilees-27-bethel-ladder-john1-51'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=27 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 28:13 — *And, behold, Yahuah (LORD) stood above it, and said, I am Yahuah Elohim (the LORD God) of Abraham thy father, and the Elohim (God) of Isaac: the land whereon thou liest, to thee will I give it, and to thy seed;* The voice from atop the ladder in Jubilees 27:21 quoting the covenant of the land and the seed.'
  FROM cross_reference_threads t, cross_references x, _session251_ju27_lookup sv, _session251_ju27_lookup tv
 WHERE t.slug='jubilees-27-bethel-ladder-john1-51'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=27 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 1:51 — *And he saith unto him, Verily, verily, I say unto you, Hereafter ye shall see heaven open, and the angels of Elohim (God) ascending and descending upon the Son of Adam.* Yahusha unveils Jacob''s ladder of Jubilees 27:21 as Himself — the open heaven and the angels now resting upon the Son of Adam.'
  FROM cross_reference_threads t, cross_references x, _session251_ju27_lookup sv, _session251_ju27_lookup tv
 WHERE t.slug='jubilees-27-bethel-ladder-john1-51'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=27 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=51
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 28:11 — *And he lighted upon a certain place, and tarried there all night, because the sun was set; and he took of the stones of that place, and put them for his pillows, and lay down in that place to sleep.* The stone-pillow at the set of the sun that Jubilees 27:19-20 narrates in its own words.'
  FROM cross_reference_threads t, cross_references x, _session251_ju27_lookup sv, _session251_ju27_lookup tv
 WHERE t.slug='jubilees-27-bethel-ladder-john1-51'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=27 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-27-seed-as-dust-all-families-blessed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 28:14 — *And thy seed shall be as the dust of the earth, and thou shalt spread abroad to the west, and to the east, and to the north, and to the south: and in thee and in thy seed shall all the families of the earth be blessed.* Jubilees 27:23 retells the Bethel promise nearly verbatim — the seed as dust and the families blessed.'
  FROM cross_reference_threads t, cross_references x, _session251_ju27_lookup sv, _session251_ju27_lookup tv
 WHERE t.slug='jubilees-27-seed-as-dust-all-families-blessed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=27 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 12:2 — *And I will make of thee a great nation, and I will bless thee, and make thy name great; and thou shalt be a blessing:* The first word of the promise to Abraham that Jubilees 27:23 hands down unbroken to Jacob.'
  FROM cross_reference_threads t, cross_references x, _session251_ju27_lookup sv, _session251_ju27_lookup tv
 WHERE t.slug='jubilees-27-seed-as-dust-all-families-blessed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=27 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Galatians 3:8 — *And the scripture, foreseeing that Elohim (God) would justify the heathen through faith, preached before the gospel unto Abraham, saying, In thee shall all nations be blessed.* Paul calls the all-families promise of Jubilees 27:23 the gospel preached beforehand — the nations blessed by faith.'
  FROM cross_reference_threads t, cross_references x, _session251_ju27_lookup sv, _session251_ju27_lookup tv
 WHERE t.slug='jubilees-27-seed-as-dust-all-families-blessed'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=27 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=3 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-27-i-am-with-thee-will-keep-thee
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 28:15 — *And, behold, I am with thee, and will keep thee in all places whither thou goest, and will bring thee again into this land; for I will not leave thee, until I have done that which I have spoken to thee of.* Jubilees 27:24 carries the promise of presence and safe return word for word from the Bethel vision.'
  FROM cross_reference_threads t, cross_references x, _session251_ju27_lookup sv, _session251_ju27_lookup tv
 WHERE t.slug='jubilees-27-i-am-with-thee-will-keep-thee'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=27 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 27:15 — *The El Elyon (Most High) Elohim (God) will preserve him from all evil, and will be with him; for He will not forsake him all his days;* Isaac''s earlier blessing in this same chapter foresees the very keeping that Yahuah Himself confirms at Bethel in 27:24.'
  FROM cross_reference_threads t, cross_references x, _session251_ju27_lookup sv, _session251_ju27_lookup tv
 WHERE t.slug='jubilees-27-i-am-with-thee-will-keep-thee'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=27 AND sv.verse_number=15
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=27 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-27-bethel-pillar-vow-tithe
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 28:18 — *And Jacob rose up early in the morning, and took the stone that he had put for his pillows, and set it up for a pillar, and poured oil upon the top of it.* Jubilees 27:26 retells the raising and anointing of the Bethel pillar nearly verbatim.'
  FROM cross_reference_threads t, cross_references x, _session251_ju27_lookup sv, _session251_ju27_lookup tv
 WHERE t.slug='jubilees-27-bethel-pillar-vow-tithe'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=27 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 28:17 — *And he was afraid, and said, How dreadful is this place! this is none other but the house of Elohim (God), and this is the gate of heaven.* Jacob''s dread and the “gate of heaven” cry of Jubilees 27:25 word for word from Genesis.'
  FROM cross_reference_threads t, cross_references x, _session251_ju27_lookup sv, _session251_ju27_lookup tv
 WHERE t.slug='jubilees-27-bethel-pillar-vow-tithe'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=27 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=28 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 14:20 — *And blessed be the El Elyon (most high God), which hath delivered thine enemies into thy hand. And he gave him tithes of all.* Abraham tithed before Jacob ever did — the tenth Jacob vows in Jubilees 27:26 is the fathers'' practice, not a new thing.'
  FROM cross_reference_threads t, cross_references x, _session251_ju27_lookup sv, _session251_ju27_lookup tv
 WHERE t.slug='jubilees-27-bethel-pillar-vow-tithe'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=27 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 27:30 — *And all the tithe of the land, whether of the seed of the land, or of the fruit of the tree, is the LORD’S: it is holy unto Yahuah (LORD).* The Torah engraves as holy the very tithe Jacob vows to Yahuah at Bethel in Jubilees 27:26.'
  FROM cross_reference_threads t, cross_references x, _session251_ju27_lookup sv, _session251_ju27_lookup tv
 WHERE t.slug='jubilees-27-bethel-pillar-vow-tithe'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=27 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=27 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

