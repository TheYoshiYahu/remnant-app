-- ----- fragment: minion_matthew_01.sql (S260 Matthew depth) -----
-- Matthew 1 — full-library cross-reference threads (NT DEPTH pass)
-- 7 threads, band 11000 + 3

CREATE TEMP VIEW _mt01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- =====================================================================
-- 3b. cross_references rows
-- =====================================================================
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- Thread 1: the genealogy / book of the generation / scepter of Judah (anchor 1:1)
  ('canon','matthew',1,1,'canon','genesis',5,1, 'free', E'*This is the book of the generations of Adam. In the day that Elohim (God) created man, in the likeness of Elohim (God) made he him* (Genesis 5:1). Matthew opens his scroll with the very same words — *the book of the generation* — laying Yahusha into the one unbroken line that runs from the first Adam.'),
  ('canon','matthew',1,1,'canon','genesis',22,18, 'free', E'*And in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice* (Genesis 22:18). *The son of Abraham* — the promised Seed in whom every nation is blessed.'),
  ('canon','matthew',1,1,'canon','genesis',49,10, 'free', E'*The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be* (Genesis 49:10). The genealogy traces the scepter line of Judah down to its rightful heir.'),
  ('canon','matthew',1,1,'canon','ruth',4,18, 'free', E'*Now these are the generations of Pharez: Pharez begat Hezron* (Ruth 4:18). Matthew''s list walks the Perez line that Ruth records.'),
  ('canon','matthew',1,1,'canon','ruth',4,22, 'free', E'*And Obed begat Jesse, and Jesse begat David* (Ruth 4:22). The Boaz-Ruth line lands on David the king — the throne the Son inherits.'),
  ('canon','matthew',1,1,'jubilees','jubilees',31,18, 'extras', E'*And to Yahudah (Judah) he said: ... A prince shall you be ... In you shall be the help of Jacob, And in you be found the salvation of Yashar’el (Israel)* (Jubilees 31:18). Isaac blesses Judah with the very office Matthew''s genealogy delivers — the prince in whom the salvation of Israel is found.'),
  ('canon','matthew',1,1,'canon','revelation',5,5, 'free', E'*Behold, the Lion of the tribe of Juda, the Root of David, hath prevailed* (Revelation 5:5). The end of the library names the One the genealogy opens it with — Lion of Judah, Root of David.'),
  ('canon','matthew',1,1,'canon','luke',3,23, 'free', E'*And Yahusha (Jesus) himself began to be about thirty years of age, being (as was supposed) the son of Joseph, which was the son of Heli* (Luke 3:23). Luke runs the same line the other direction, back to Adam — two witnesses to one generation.'),

  -- Thread 2: the four women / strangers grafted in (anchor 1:3-6)
  ('canon','matthew',1,3,'canon','genesis',38,29, 'free', E'*And it came to pass, as he drew back his hand, that, behold, his brother came out: ... therefore his name was called Pharez* (Genesis 38:29). Tamar — wronged, then vindicated — is named in the King''s line.'),
  ('canon','matthew',1,5,'canon','joshua',6,25, 'free', E'*And Joshua saved Rahab the harlot alive ... and she dwelleth in Yashar''el (Israel) even unto this day; because she hid the messengers* (Joshua 6:25). Rahab the Canaanite is grafted in and stands in the royal line.'),
  ('canon','matthew',1,5,'canon','ruth',4,22, 'free', E'*And Obed begat Jesse, and Jesse begat David* (Ruth 4:22). Ruth the Moabitess — the stranger who clung to the Elohim of Israel — is great-grandmother to David.'),
  ('canon','matthew',1,6,'canon','2-samuel',7,12, 'free', E'*I will set up thy seed after thee, which shall proceed out of thy bowels, and I will establish his kingdom* (2 Samuel 7:12). The wife of Uriah mothers Solomon, and through him the throne-promise runs to the Son.'),

  -- Thread 3: conceived of the Ruach HaKodesh (anchor 1:18-20)
  ('canon','matthew',1,18,'canon','genesis',1,2, 'free', E'*And the Spirit of Elohim (God) moved upon the face of the waters* (Genesis 1:2). The same Ruach that brooded over the first creation now overshadows the new — the Formed Son conceived of the Spirit.'),
  ('canon','matthew',1,18,'canon','isaiah',11,1, 'free', E'*And there shall come forth a rod out of the stem of Jesse, and a Branch shall grow out of his roots* (Isaiah 11:1). The Branch springs up — not by the will of man, but by the Father''s Spirit.'),
  ('canon','matthew',1,20,'canon','isaiah',11,2, 'free', E'*And the spirit of Yahuah (LORD) shall rest upon him, the spirit of wisdom and understanding, the spirit of counsel and might* (Isaiah 11:2). The Spirit who forms him rests upon him — the Father''s own Ruach on the Formed Son.'),
  ('canon','matthew',1,20,'canon','luke',1,35, 'free', E'*The Ruach HaKodesh (Holy Spirit) shall come upon thee, and the power of the Highest shall overshadow thee: therefore also that holy thing which shall be born of thee shall be called the Son of Elohim (God)* (Luke 1:35). The angel to Mary says plainly what Matthew tells Joseph — conceived of the Spirit, Son of the Most High.'),

  -- Thread 4: save his people from their sins (anchor 1:21)
  ('canon','matthew',1,21,'canon','psalms',130,8, 'free', E'*And he shall redeem Yashar''el (Israel) from all his iniquities* (Psalms 130:8). *He shall save his people from their sins* — Matthew quotes the psalm''s very promise. The saving is from sin, and the people are Israel redeemed.'),
  ('canon','matthew',1,21,'canon','isaiah',53,5, 'free', E'*But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed* (Isaiah 53:5). How he saves from sin is written ahead of time in the suffering servant.'),
  ('canon','matthew',1,21,'canon','isaiah',53,11, 'free', E'*by his knowledge shall my righteous servant justify many; for he shall bear their iniquities* (Isaiah 53:11). The servant bears the iniquities — this is the saving Matthew names.'),
  ('canon','matthew',1,21,'canon','acts',4,12, 'free', E'*Neither is there salvation in any other: for there is none other name under heaven given among men, whereby we must be saved* (Acts 4:12). The name given to save IS the saving — the apostles confess what the angel announced.'),

  -- Thread 5: the name Yahusha = Yahuah saves (anchor 1:21)
  ('canon','matthew',1,21,'canon','isaiah',12,2, 'free', E'*Behold, Elohim (God) is my salvation; I will trust, and not be afraid: for Yahuah (LORD) JEHOVAH is my strength and my song; he also is become my salvation* (Isaiah 12:2). The name *Yahusha* is *Yahuah saves* — and here Yahuah Himself *is become my salvation.*'),
  ('canon','matthew',1,21,'canon','exodus',3,15, 'free', E'*Yahuah Elohim (The LORD God) of your fathers ... hath sent me unto you: this is my name for ever, and this is my memorial unto all generations* (Exodus 3:15). The Name revealed to Moses is the Name carried into the world in the Formed Son — *Yahuah saves.*'),
  ('canon','matthew',1,21,'apocrypha','tobit',13,11, 'extras', E'*Many nations shall come from far to the name of Yahuah (God) with gifts in their hands ... all generations shall praise you with great joy* (Tobit 13:11). The nations stream to the Name — the very ingathering the saving Name accomplishes.'),
  ('canon','matthew',1,21,'canon','acts',4,12, 'free', E'*there is none other name under heaven given among men, whereby we must be saved* (Acts 4:12). The Name and the salvation are one and the same.'),

  -- Thread 6: a virgin shall be with child / Immanuel — the Father present in the Formed Son (anchor 1:22-23)
  ('canon','matthew',1,23,'canon','isaiah',7,14, 'free', E'*Therefore Yahuah (Lord) himself shall give you a sign; Behold, a virgin shall conceive, and bear a son, and shall call his name Immanuel* (Isaiah 7:14). Matthew points straight to the sign promised to the house of David.'),
  ('canon','matthew',1,23,'canon','isaiah',8,8, 'free', E'*he shall reach even to the neck; and the stretching out of his wings shall fill the breadth of thy land, O Immanuel* (Isaiah 8:8). The land is *Immanuel''s* land — the sign-name carried forward through Isaiah''s own prophecy.'),
  ('canon','matthew',1,23,'canon','isaiah',8,10, 'free', E'*Take counsel together, and it shall come to nought ... for Elohim (God) is with us* (Isaiah 8:10). *Immanuel* interpreted — *Elohim with us* — the invisible Father made present, not a second deity beside Him.'),
  ('canon','matthew',1,23,'apocrypha','the-wisdom-of-solomon',18,15, 'extras', E'*Your Almighty word leaped down from heaven out of your royal throne ... into the midst of a land* (Wisdom of Solomon 18:15). The Father''s own Word comes down — *God with us* — the Formed Son who reveals the One who sent him.'),

  -- Thread 7: Joseph the just, obedient (anchor 1:19, 1:24-25)
  ('canon','matthew',1,19,'canon','genesis',6,9, 'free', E'*Noah was a just man and perfect in his generations, and Noah walked with Elohim (God)* (Genesis 6:9). *Joseph her husband, being a just man* — the same word that marks Noah marks Joseph: a righteous man who walks with Elohim.'),
  ('canon','matthew',1,24,'canon','genesis',6,8, 'free', E'*But Noah found grace in the eyes of Yahuah (LORD)* (Genesis 6:8). Joseph, like Noah, simply obeys what the messenger of Yahuah commands — *did as the angel of Yahuah had bidden him.*'),
  ('canon','matthew',1,24,'canon','psalms',1,1, 'free', E'*Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful* (Psalms 1:1). The just man of the Psalm is Joseph to the life — quiet, obedient, refusing to shame.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _mt01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _mt01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- =====================================================================
-- 3c. threads
-- =====================================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-1-the-book-of-the-generation-scepter-of-judah-genesis-49-ruth-4-jubilees-31',
       E'The book of the generation — son of David, son of Abraham, the scepter of Judah (Genesis 5; 22; 49; Ruth 4; Jubilees 31; Revelation 5)',
       E'Matthew opens the New Testament the way Genesis opens the Old: *The book of the generation of Yahusha HaMashiach (Jesus Christ), the son of David, the son of Abraham* (Matthew 1:1) — the same phrase as *This is the book of the generations of Adam* (Genesis 5:1). One library, one line, unbroken from the first man.\n\n*The son of Abraham* reaches back to *And in thy seed shall all the nations of the earth be blessed; because thou hast obeyed my voice* (Genesis 22:18) — the promised Seed of blessing. *The son of David* reaches back to the scepter: *The sceptre shall not depart from Yahudah (Judah), nor a lawgiver from between his feet, until Shiloh come; and unto him shall the gathering of the people be* (Genesis 49:10). The genealogy walks that scepter line — *Now these are the generations of Pharez: Pharez begat Hezron* (Ruth 4:18) down to *And Obed begat Jesse, and Jesse begat David* (Ruth 4:22).\n\nThe extra-canon witness sings the same office. Isaac blessed Judah, *A prince shall you be ... In you shall be the help of Jacob, And in you be found the salvation of Yashar’el (Israel)* (Jubilees 31:18) — the very prince Matthew''s list delivers. And the end of the library names the One it opens with: *Behold, the Lion of the tribe of Juda, the Root of David, hath prevailed* (Revelation 5:5). Luke runs the same line the other direction — *the son of Joseph, which was the son of Heli* (Luke 3:23) — two witnesses to one generation.\n\nThis is the gathering of the scepter of Judah, the hope of all the tribes — not a new story, but the old promise come to its heir.',
       sv.verse_id, ev.verse_id, 'extras', 11000
  FROM _mt01_lookup sv, _mt01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=1 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-1-four-women-in-the-line-the-stranger-grafted-in-genesis-38-joshua-6-ruth-4',
       E'The four women in the line — Tamar, Rahab, Ruth, the wife of Uriah: the stranger grafted in (Genesis 38; Joshua 6; Ruth 4; 2 Samuel 7)',
       E'The King''s genealogy does a startling thing — it names women, and not the expected matriarchs but the outsiders and the wronged. Tamar: *behold, his brother came out: ... therefore his name was called Pharez* (Genesis 38:29). Rahab the Canaanite: *Joshua saved Rahab the harlot alive ... and she dwelleth in Yashar''el (Israel) even unto this day; because she hid the messengers* (Joshua 6:25). Ruth the Moabitess, the stranger who clung to the Elohim of Israel: *And Obed begat Jesse, and Jesse begat David* (Ruth 4:22). And the wife of Uriah, mother of Solomon, through whom the throne-promise runs: *I will set up thy seed after thee, which shall proceed out of thy bowels, and I will establish his kingdom* (2 Samuel 7:12).\n\nThis is the two-house heart of the gospel set right at the doorway: scattered Israel coming home and the stranger grafted in. Not Israel cast off and replaced — *Elohim hath not cast away his people* — but the nations drawn into the very bloodline of the King. The royal line of Judah was always meant to gather, not to exclude.',
       sv.verse_id, ev.verse_id, 'free', 11003
  FROM _mt01_lookup sv, _mt01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=1 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-1-conceived-of-the-ruach-hakodesh-genesis-1-isaiah-11-luke-1',
       E'Conceived of the Ruach HaKodesh — the Spirit that brooded over creation forms the Son (Genesis 1; Isaiah 11; Luke 1)',
       E'*she was found with child of the Ruach HaKodesh (Holy Spirit)* (Matthew 1:18). The Spirit that does this work is no stranger to the library — *And the Spirit of Elohim (God) moved upon the face of the waters* (Genesis 1:2). The same Ruach that brooded over the first creation now overshadows the new.\n\nThe prophet saw it as a fresh shoot from a felled stump: *And there shall come forth a rod out of the stem of Jesse, and a Branch shall grow out of his roots* (Isaiah 11:1) — sprung not by the will of man but by the Father''s Spirit, who then rests upon him: *And the spirit of Yahuah (LORD) shall rest upon him, the spirit of wisdom and understanding, the spirit of counsel and might* (Isaiah 11:2).\n\nLuke tells Mary plainly what Matthew tells Joseph: *The Ruach HaKodesh (Holy Spirit) shall come upon thee, and the power of the Highest shall overshadow thee: therefore also that holy thing which shall be born of thee shall be called the Son of Elohim (God)* (Luke 1:35). This is the Formed Son — begotten by the Father''s own Spirit, the image of the invisible Father, never a second deity standing beside Him.',
       sv.verse_id, ev.verse_id, 'free', 11006
  FROM _mt01_lookup sv, _mt01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=1 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-1-he-shall-save-his-people-from-their-sins-psalm-130-isaiah-53-acts-4',
       E'He shall save his people from their sins — redeemed from all iniquities (Psalm 130; Isaiah 53; Acts 4)',
       E'*thou shalt call his name Yahusha (JESUS): for he shall save his people from their sins* (Matthew 1:21). The angel is quoting a promise already written: *And he shall redeem Yashar''el (Israel) from all his iniquities* (Psalms 130:8). The saving is from sin, and *his people* are Israel redeemed — never a different people swapped in.\n\nHow the saving is done was set out long before in the suffering servant: *But he was wounded for our transgressions, he was bruised for our iniquities: the chastisement of our peace was upon him; and with his stripes we are healed* (Isaiah 53:5); *by his knowledge shall my righteous servant justify many; for he shall bear their iniquities* (Isaiah 53:11). He saves by bearing the sin himself.\n\nAnd the apostles confess exactly what the angel announced: *Neither is there salvation in any other: for there is none other name under heaven given among men, whereby we must be saved* (Acts 4:12). The name given to save IS the saving.',
       sv.verse_id, ev.verse_id, 'free', 11009
  FROM _mt01_lookup sv, _mt01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=1 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-1-his-name-yahusha-yahuah-saves-isaiah-12-exodus-3-tobit-13',
       E'His name Yahusha — Yahuah saves: the Name carried into the world (Isaiah 12; Exodus 3; Tobit 13; Acts 4)',
       E'*thou shalt call his name Yahusha (JESUS)* (Matthew 1:21) — and the name itself preaches: *Yahuah saves.* Isaiah said it in the very words: *Behold, Elohim (God) is my salvation; I will trust, and not be afraid: for Yahuah (LORD) JEHOVAH is my strength and my song; he also is become my salvation* (Isaiah 12:2).\n\nThe Name belongs to the Father from of old — *Yahuah Elohim (The LORD God) of your fathers ... hath sent me unto you: this is my name for ever, and this is my memorial unto all generations* (Exodus 3:15). The Formed Son carries the Father''s own Name into the world; he does not bear a rival name but reveals the One who sent him.\n\nThat Name is the magnet of the gathering: *Many nations shall come from far to the name of Yahuah (God) with gifts in their hands ... all generations shall praise you with great joy* (Tobit 13:11). And the saving is found nowhere else: *there is none other name under heaven given among men, whereby we must be saved* (Acts 4:12). The Name and the salvation are one.',
       sv.verse_id, ev.verse_id, 'extras', 11012
  FROM _mt01_lookup sv, _mt01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=1 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-1-a-virgin-shall-be-with-child-immanuel-god-with-us-isaiah-7-isaiah-8-wisdom-18',
       E'A virgin shall be with child — Immanuel, Elohim with us: the Father present in the Formed Son (Isaiah 7; Isaiah 8; Wisdom 18)',
       E'*Behold, a virgin shall be with child, and shall bring forth a son, and they shall call his name Emmanuel, which being interpreted is, Elohim (God) with us* (Matthew 1:23). Matthew points straight at the sign promised to the house of David: *Therefore Yahuah (Lord) himself shall give you a sign; Behold, a virgin shall conceive, and bear a son, and shall call his name Immanuel* (Isaiah 7:14).\n\nIsaiah carries the sign-name forward through his own prophecy: the land itself is *Immanuel''s* — *the stretching out of his wings shall fill the breadth of thy land, O Immanuel* (Isaiah 8:8) — and then he interprets it: *Take counsel together, and it shall come to nought ... for Elohim (God) is with us* (Isaiah 8:10).\n\nHold the name carefully. *Elohim with us* does not mean a second deity has appeared beside the Father; it means the invisible Father is made present in the Formed Son. The wisdom of the fathers pictures it well: *Your Almighty word leaped down from heaven out of your royal throne ... into the midst of a land* (Wisdom of Solomon 18:15). The Father''s own Word comes down — God with us — the Son who reveals the One who sent him.',
       sv.verse_id, ev.verse_id, 'extras', 11015
  FROM _mt01_lookup sv, _mt01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=1 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-1-joseph-a-just-man-obedient-genesis-6-psalm-1',
       E'Joseph a just man — quiet, obedient, like Noah before him (Genesis 6; Psalm 1)',
       E'*Then Joseph her husband, being a just man, and not willing to make her a publick example, was minded to put her away privily* (Matthew 1:19). The word that marks Joseph — *just* — is the word that marks Noah: *Noah was a just man and perfect in his generations, and Noah walked with Elohim (God)* (Genesis 6:9). A righteous man is not a harsh man; mercy and obedience walk together.\n\nLike Noah, who *found grace in the eyes of Yahuah (LORD)* (Genesis 6:8), Joseph simply does what the messenger commands — *Then Joseph being raised from sleep did as the angel of Yahuah (Lord) had bidden him* (Matthew 1:24). No protest, no delay.\n\nHe is the man of the first Psalm to the life: *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful* (Psalms 1:1). Quiet obedience, refusing to shame, sheltering the promise — that is righteousness, the Torah lived from the heart.',
       sv.verse_id, ev.verse_id, 'free', 11018
  FROM _mt01_lookup sv, _mt01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=1 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

-- =====================================================================
-- 3d. thread_members
-- =====================================================================
-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:1 — *This is the book of the generations of Adam* — Matthew''s opening phrase, the one unbroken line.'
  FROM cross_reference_threads t, cross_references x, _mt01_lookup sv, _mt01_lookup tv
 WHERE t.slug='matthew-1-the-book-of-the-generation-scepter-of-judah-genesis-49-ruth-4-jubilees-31'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 22:18 — *in thy seed shall all the nations of the earth be blessed* — the son of Abraham, the promised Seed.'
  FROM cross_reference_threads t, cross_references x, _mt01_lookup sv, _mt01_lookup tv
 WHERE t.slug='matthew-1-the-book-of-the-generation-scepter-of-judah-genesis-49-ruth-4-jubilees-31'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 49:10 — *The sceptre shall not depart from Yahudah (Judah) ... until Shiloh come* — the scepter line the genealogy traces.'
  FROM cross_reference_threads t, cross_references x, _mt01_lookup sv, _mt01_lookup tv
 WHERE t.slug='matthew-1-the-book-of-the-generation-scepter-of-judah-genesis-49-ruth-4-jubilees-31'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=49 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ruth 4:18 — *the generations of Pharez: Pharez begat Hezron* — the Perez line Matthew walks.'
  FROM cross_reference_threads t, cross_references x, _mt01_lookup sv, _mt01_lookup tv
 WHERE t.slug='matthew-1-the-book-of-the-generation-scepter-of-judah-genesis-49-ruth-4-jubilees-31'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=4 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ruth 4:22 — *And Obed begat Jesse, and Jesse begat David* — the line lands on David the king.'
  FROM cross_reference_threads t, cross_references x, _mt01_lookup sv, _mt01_lookup tv
 WHERE t.slug='matthew-1-the-book-of-the-generation-scepter-of-judah-genesis-49-ruth-4-jubilees-31'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=4 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Jubilees 31:18 — Isaac''s blessing on Judah: *A prince shall you be ... In you be found the salvation of Yashar’el* — the prince Matthew''s list delivers.'
  FROM cross_reference_threads t, cross_references x, _mt01_lookup sv, _mt01_lookup tv
 WHERE t.slug='matthew-1-the-book-of-the-generation-scepter-of-judah-genesis-49-ruth-4-jubilees-31'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=31 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Revelation 5:5 — *the Lion of the tribe of Juda, the Root of David, hath prevailed* — the end of the library names the One it opens with.'
  FROM cross_reference_threads t, cross_references x, _mt01_lookup sv, _mt01_lookup tv
 WHERE t.slug='matthew-1-the-book-of-the-generation-scepter-of-judah-genesis-49-ruth-4-jubilees-31'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Luke 3:23 — *being (as was supposed) the son of Joseph, which was the son of Heli* — Luke runs the same line back to Adam.'
  FROM cross_reference_threads t, cross_references x, _mt01_lookup sv, _mt01_lookup tv
 WHERE t.slug='matthew-1-the-book-of-the-generation-scepter-of-judah-genesis-49-ruth-4-jubilees-31'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=3 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 38:29 — *his name was called Pharez* — Tamar, wronged then vindicated, named in the King''s line.'
  FROM cross_reference_threads t, cross_references x, _mt01_lookup sv, _mt01_lookup tv
 WHERE t.slug='matthew-1-four-women-in-the-line-the-stranger-grafted-in-genesis-38-joshua-6-ruth-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=38 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joshua 6:25 — *Joshua saved Rahab the harlot alive ... she dwelleth in Yashar''el* — the Canaanite grafted in.'
  FROM cross_reference_threads t, cross_references x, _mt01_lookup sv, _mt01_lookup tv
 WHERE t.slug='matthew-1-four-women-in-the-line-the-stranger-grafted-in-genesis-38-joshua-6-ruth-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=6 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ruth 4:22 — *Jesse begat David* — Ruth the Moabitess, the stranger who clung, great-grandmother to the king.'
  FROM cross_reference_threads t, cross_references x, _mt01_lookup sv, _mt01_lookup tv
 WHERE t.slug='matthew-1-four-women-in-the-line-the-stranger-grafted-in-genesis-38-joshua-6-ruth-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ruth' AND tv.chapter_number=4 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Samuel 7:12 — *I will set up thy seed after thee ... establish his kingdom* — the wife of Uriah mothers the throne-line.'
  FROM cross_reference_threads t, cross_references x, _mt01_lookup sv, _mt01_lookup tv
 WHERE t.slug='matthew-1-four-women-in-the-line-the-stranger-grafted-in-genesis-38-joshua-6-ruth-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=7 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:2 — *the Spirit of Elohim moved upon the face of the waters* — the Ruach over the first creation, now over the new.'
  FROM cross_reference_threads t, cross_references x, _mt01_lookup sv, _mt01_lookup tv
 WHERE t.slug='matthew-1-conceived-of-the-ruach-hakodesh-genesis-1-isaiah-11-luke-1'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 11:1 — *a rod out of the stem of Jesse, and a Branch shall grow out of his roots* — the shoot sprung by the Spirit.'
  FROM cross_reference_threads t, cross_references x, _mt01_lookup sv, _mt01_lookup tv
 WHERE t.slug='matthew-1-conceived-of-the-ruach-hakodesh-genesis-1-isaiah-11-luke-1'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 11:2 — *the spirit of Yahuah shall rest upon him* — the Spirit who forms him rests upon him.'
  FROM cross_reference_threads t, cross_references x, _mt01_lookup sv, _mt01_lookup tv
 WHERE t.slug='matthew-1-conceived-of-the-ruach-hakodesh-genesis-1-isaiah-11-luke-1'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 1:35 — *the Ruach HaKodesh shall come upon thee ... that holy thing ... shall be called the Son of Elohim* — said to Mary as Matthew tells Joseph.'
  FROM cross_reference_threads t, cross_references x, _mt01_lookup sv, _mt01_lookup tv
 WHERE t.slug='matthew-1-conceived-of-the-ruach-hakodesh-genesis-1-isaiah-11-luke-1'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 130:8 — *he shall redeem Yashar''el from all his iniquities* — the very promise the angel quotes; saving from sin.'
  FROM cross_reference_threads t, cross_references x, _mt01_lookup sv, _mt01_lookup tv
 WHERE t.slug='matthew-1-he-shall-save-his-people-from-their-sins-psalm-130-isaiah-53-acts-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=130 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 53:5 — *he was wounded for our transgressions ... with his stripes we are healed* — how the saving is done.'
  FROM cross_reference_threads t, cross_references x, _mt01_lookup sv, _mt01_lookup tv
 WHERE t.slug='matthew-1-he-shall-save-his-people-from-their-sins-psalm-130-isaiah-53-acts-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 53:11 — *my righteous servant justify many; for he shall bear their iniquities* — he saves by bearing the sin.'
  FROM cross_reference_threads t, cross_references x, _mt01_lookup sv, _mt01_lookup tv
 WHERE t.slug='matthew-1-he-shall-save-his-people-from-their-sins-psalm-130-isaiah-53-acts-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 4:12 — *none other name under heaven ... whereby we must be saved* — the apostles confess what the angel announced.'
  FROM cross_reference_threads t, cross_references x, _mt01_lookup sv, _mt01_lookup tv
 WHERE t.slug='matthew-1-he-shall-save-his-people-from-their-sins-psalm-130-isaiah-53-acts-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=4 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 12:2 — *Elohim is my salvation ... he also is become my salvation* — the name Yahusha said in full: Yahuah saves.'
  FROM cross_reference_threads t, cross_references x, _mt01_lookup sv, _mt01_lookup tv
 WHERE t.slug='matthew-1-his-name-yahusha-yahuah-saves-isaiah-12-exodus-3-tobit-13'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 3:15 — *this is my name for ever ... my memorial unto all generations* — the Father''s Name carried in the Formed Son.'
  FROM cross_reference_threads t, cross_references x, _mt01_lookup sv, _mt01_lookup tv
 WHERE t.slug='matthew-1-his-name-yahusha-yahuah-saves-isaiah-12-exodus-3-tobit-13'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=3 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Tobit 13:11 — *Many nations shall come from far to the name of Yahuah* — the Name is the magnet of the gathering.'
  FROM cross_reference_threads t, cross_references x, _mt01_lookup sv, _mt01_lookup tv
 WHERE t.slug='matthew-1-his-name-yahusha-yahuah-saves-isaiah-12-exodus-3-tobit-13'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=21
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=13 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 4:12 — *none other name ... whereby we must be saved* — the Name and the salvation are one.'
  FROM cross_reference_threads t, cross_references x, _mt01_lookup sv, _mt01_lookup tv
 WHERE t.slug='matthew-1-his-name-yahusha-yahuah-saves-isaiah-12-exodus-3-tobit-13'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=4 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 7:14 — *a virgin shall conceive, and bear a son, and shall call his name Immanuel* — the sign to the house of David.'
  FROM cross_reference_threads t, cross_references x, _mt01_lookup sv, _mt01_lookup tv
 WHERE t.slug='matthew-1-a-virgin-shall-be-with-child-immanuel-god-with-us-isaiah-7-isaiah-8-wisdom-18'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=7 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 8:8 — *the breadth of thy land, O Immanuel* — the sign-name carried forward in Isaiah''s own prophecy.'
  FROM cross_reference_threads t, cross_references x, _mt01_lookup sv, _mt01_lookup tv
 WHERE t.slug='matthew-1-a-virgin-shall-be-with-child-immanuel-god-with-us-isaiah-7-isaiah-8-wisdom-18'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=8 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 8:10 — *for Elohim (God) is with us* — Immanuel interpreted: the invisible Father made present, not a second deity.'
  FROM cross_reference_threads t, cross_references x, _mt01_lookup sv, _mt01_lookup tv
 WHERE t.slug='matthew-1-a-virgin-shall-be-with-child-immanuel-god-with-us-isaiah-7-isaiah-8-wisdom-18'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=8 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Wisdom of Solomon 18:15 — *Your Almighty word leaped down from heaven out of your royal throne* — the Father''s own Word come down, God with us.'
  FROM cross_reference_threads t, cross_references x, _mt01_lookup sv, _mt01_lookup tv
 WHERE t.slug='matthew-1-a-virgin-shall-be-with-child-immanuel-god-with-us-isaiah-7-isaiah-8-wisdom-18'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=23
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=18 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 7
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:9 — *Noah was a just man and perfect in his generations, and Noah walked with Elohim* — the same word that marks Joseph.'
  FROM cross_reference_threads t, cross_references x, _mt01_lookup sv, _mt01_lookup tv
 WHERE t.slug='matthew-1-joseph-a-just-man-obedient-genesis-6-psalm-1'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:8 — *Noah found grace in the eyes of Yahuah* — like Noah, Joseph simply obeys the messenger.'
  FROM cross_reference_threads t, cross_references x, _mt01_lookup sv, _mt01_lookup tv
 WHERE t.slug='matthew-1-joseph-a-just-man-obedient-genesis-6-psalm-1'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 1:1 — *Blessed is the man that walketh not in the counsel of the ungodly* — Joseph is the just man of the first Psalm to the life.'
  FROM cross_reference_threads t, cross_references x, _mt01_lookup sv, _mt01_lookup tv
 WHERE t.slug='matthew-1-joseph-a-just-man-obedient-genesis-6-psalm-1'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=1 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
