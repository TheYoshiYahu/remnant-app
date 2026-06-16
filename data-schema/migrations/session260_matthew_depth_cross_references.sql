-- =====================================================================
-- Session 260 — Matthew (depth) FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session260_matthew_depth_cross_references.sql
-- =====================================================================

\echo 'session260 — Matthew (depth) cross-references starting...'
BEGIN;

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

-- ----- fragment: minion_matthew_05.sql (S260 Matthew depth) -----
-- ============================================================================
-- Matthew 5 — full-library cross-reference threads (NT DEPTH pass)
-- 8 threads: Beatitudes / salt-light / ★★★ Torah-never-abolished / anger /
-- lust-divorce / swear-not / eye-for-eye / love-enemies-be-perfect
-- sort_order band: 11120, step +3
-- ============================================================================

-- 3a. Temp view ------------------------------------------------------------
CREATE TEMP VIEW _mt05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- 3b. cross_references rows -------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES

  -- (a) 5:1-12 Beatitudes -------------------------------------------------
  ('canon','matthew',5,3,'canon','isaiah',61,1, 'free', E'*The Spirit of Adonai Yahuah (the Lord GOD) is upon me; because Yahuah (LORD) hath anointed me to preach good tidings unto the meek; he hath sent me to bind up the brokenhearted, to proclaim liberty to the captives...* (Isaiah 61:1). The Beatitudes are not a new ladder of merit — they are Yahusha (JESUS) reading His own anointing-scroll over the crowd. The poor, the meek, the mourning, the brokenhearted: these are the very people Isaiah said the Anointed One was sent to comfort.'),
  ('canon','matthew',5,4,'canon','isaiah',61,2, 'free', E'*To proclaim the acceptable year of Yahuah (LORD), and the day of vengeance of our Elohim (God); to comfort all that mourn* (Isaiah 61:2). *Blessed are they that mourn: for they shall be comforted* (Matthew 5:4) — the comfort is Isaiah''s own word, the mourners of Zion answered.'),
  ('canon','matthew',5,5,'canon','psalms',37,11, 'free', E'*But the meek shall inherit the earth; and shall delight themselves in the abundance of peace* (Psalm 37:11). Yahusha (JESUS) quotes the psalm almost word for word — *Blessed are the meek: for they shall inherit the earth.* The inheritance of the land is no abolished promise; it is reaffirmed to the lowly.'),
  ('canon','matthew',5,8,'canon','psalms',24,4, 'free', E'*He that hath clean hands, and a pure heart; who hath not lifted up his soul unto vanity, nor sworn deceitfully* (Psalm 24:4) — he shall ascend the hill of Yahuah (LORD). *Blessed are the pure in heart: for they shall see Elohim (God)* (Matthew 5:8). The pure heart that climbs the holy hill is the heart that sees Him.'),
  ('canon','matthew',5,3,'canon','isaiah',66,2, 'free', E'*...but to this man will I look, even to him that is poor and of a contrite spirit, and trembleth at my word* (Isaiah 66:2). *Blessed are the poor in spirit* (Matthew 5:3) — the One who fills heaven and earth looks to the poor and trembling. The first Beatitude is Isaiah''s own measure of the man Yahuah (LORD) regards.'),
  ('canon','matthew',5,3,'canon','luke',6,20, 'free', E'*And he lifted up his eyes on his disciples, and said, Blessed be ye poor: for yours is the kingdom of Elohim (God)* (Luke 6:20). The companion proclamation on the plain — the same blessing on the poor, the hungry, the weeping, the hated.'),

  -- (b) 5:13-16 salt & light ----------------------------------------------
  ('canon','matthew',5,13,'canon','leviticus',2,13, 'free', E'*And every oblation of thy meat offering shalt thou season with salt; neither shalt thou suffer the salt of the covenant of thy Elohim (God) to be lacking from thy meat offering: with all thine offerings thou shalt offer salt* (Leviticus 2:13). *Ye are the salt of the earth* (Matthew 5:13). Salt is the covenant-seasoning of every offering — to be salt is to be the people of the unbroken covenant, preserving and seasoning the world.'),
  ('canon','matthew',5,14,'canon','isaiah',42,6, 'free', E'*I Yahuah (LORD) have called thee in righteousness... and give thee for a covenant of the people, for a light of the Gentiles* (Isaiah 42:6). *Ye are the light of the world* (Matthew 5:14). The light His servant carries is the light Isaiah foretold — set to the nations, not hidden.'),
  ('canon','matthew',5,14,'canon','isaiah',49,6, 'free', E'*It is a light thing that thou shouldest be my servant to raise up the tribes of Jacob, and to restore the preserved of Yashar''el (Israel): I will also give thee for a light to the Gentiles* (Isaiah 49:6). The light gathers the scattered tribes AND reaches the nations — two-house and stranger together, the city that cannot be hid.'),
  ('canon','matthew',5,16,'canon','isaiah',60,1, 'free', E'*Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee* (Isaiah 60:1). *Let your light so shine before men, that they may see your good works, and glorify your Father which is in heaven* (Matthew 5:16). The shining is reflected glory — the Father glorified, never the lamp.'),

  -- (c) ★★★ 5:17-20 Torah-never-abolished — THE BANNER -------------------
  ('canon','matthew',5,17,'canon','deuteronomy',4,2, 'free', E'*Ye shall not add unto the word which I command you, neither shall ye diminish ought from it, that ye may keep the commandments of Yahuah Elohaychem (the LORD your God)* (Deuteronomy 4:2). *Think not that I am come to destroy the law, or the prophets... but to fulfil* (Matthew 5:17). To destroy the law would be to diminish from it — the very thing Moses forbade. Yahusha (JESUS) stands inside the Torah''s own guard, not against it.'),
  ('canon','matthew',5,17,'canon','deuteronomy',12,32, 'free', E'*What thing soever I command you, observe to do it: thou shalt not add thereto, nor diminish from it* (Deuteronomy 12:32). The same hedge, twice spoken. The One who fulfils the law is the One who keeps the command not to subtract from it.'),
  ('canon','matthew',5,18,'canon','psalms',119,89, 'free', E'*For ever, O Yahuah (LORD), thy word is settled in heaven* (Psalm 119:89). *Till heaven and earth pass, one jot or one tittle shall in no wise pass from the law* (Matthew 5:18). The word is fixed above the heavens — it outlasts the very sky it is settled in.'),
  ('canon','matthew',5,18,'canon','psalms',119,142, 'free', E'*Thy righteousness is an everlasting righteousness, and thy law is the truth* (Psalm 119:142). The law is not a passing arrangement but everlasting truth — which is why not one tittle can fail.'),
  ('canon','matthew',5,18,'canon','psalms',119,160, 'free', E'*Thy word is true from the beginning: and every one of thy righteous judgments endureth for ever* (Psalm 119:160). Every judgment endures *for ever* — the jot and the tittle included.'),
  ('canon','matthew',5,18,'canon','isaiah',40,8, 'free', E'*The grass withereth, the flower fadeth: but the word of our Elohim (God) shall stand for ever* (Isaiah 40:8). Heaven and earth are grass and flower; the word stands when they fade. Matthew 5:18 is Isaiah''s contrast made a promise about the Torah.'),
  ('canon','matthew',5,19,'canon','malachi',4,4, 'free', E'*Remember ye the law of Moses my servant, which I commanded unto him in Horeb for all Yashar''el (Israel), with the statutes and judgments* (Malachi 4:4). The last word of the prophets before Yahusha (JESUS) is *remember the law* — so He, breaking nothing, honours the least commandment and calls great whoever does and teaches them (Matthew 5:19).'),
  ('canon','matthew',5,18,'enoch','1-enoch',99,2, 'extras', E'*Woe to them who pervert the words of uprightness, And transgress the eternal law, And transform themselves into what they were not* (1 Enoch 99:2). The library itself pronounces the woe Matthew 5:19 implies — the one who breaks the least commandment and teaches men so is the perverter of the eternal law.'),
  ('canon','matthew',5,18,'apocrypha','baruch-with-the-letter-of-jeremiah',4,1, 'extras', E'*This is the book of the commandments of Yahuah (God), and the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die* (Baruch 4:1). *The law that endureth for ever* — Baruch says it in the very words of Matthew 5:18. To keep it is life; to leave it, death.'),
  ('canon','matthew',5,17,'apocrypha','ecclesiasticus',24,23, 'extras', E'*All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob* (Sirach 24:23). Wisdom herself is identified with the Torah — the heritage of Jacob. Yahusha (JESUS) does not come to disinherit the congregations but to fulfil their inheritance.'),
  ('canon','matthew',5,18,'canon','luke',16,17, 'free', E'*And it is easier for heaven and earth to pass, than one tittle of the law to fail* (Luke 16:17). The same banner on Luke''s lips — sharper still: not merely *shall not* pass, but it is *easier* for the cosmos to dissolve than for a single stroke of the law to fail.'),

  -- (d) 5:21-26 anger = root of murder ------------------------------------
  ('canon','matthew',5,21,'canon','exodus',20,13, 'free', E'*Thou shalt not kill* (Exodus 20:13). *Ye have heard that it was said... Thou shalt not kill* (Matthew 5:21). Yahusha (JESUS) does not loosen the sixth word — He drives it to its root. The hand that kills began as a heart that hated.'),
  ('canon','matthew',5,22,'canon','leviticus',19,17, 'free', E'*Thou shalt not hate thy brother in thine heart: thou shalt in any wise rebuke thy neighbour, and not suffer sin upon him* (Leviticus 19:17). The Torah already forbade the inward hatred behind the deed. *Whosoever is angry with his brother... shall be in danger of the judgment* (Matthew 5:22) — this is Leviticus deepened, not displaced.'),
  ('canon','matthew',5,22,'canon','genesis',4,5, 'free', E'*But unto Cain and to his offering he had not respect. And Cain was very wroth, and his countenance fell* (Genesis 4:5). The first murder began as the first anger. Yahusha (JESUS) reaches back to Cain to show that *whosoever is angry with his brother* already stands where the killer stood.'),
  ('canon','matthew',5,24,'canon','genesis',4,7, 'free', E'*If thou doest well, shalt thou not be accepted? and if thou doest not well, sin lieth at the door. And unto thee shall be his desire, and thou shalt rule over him* (Genesis 4:7). *First be reconciled to thy brother, and then come and offer thy gift* (Matthew 5:24). Yahuah (LORD) warned Cain to master the anger before it mastered him — the gift at the altar is worthless while the brother is wronged.'),
  ('canon','matthew',5,22,'canon','leviticus',19,18, 'free', E'*Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). The grudge nursed in the heart is the seed of the council and the fire. The command to love the neighbour already pulled it up by the root.'),

  -- (e) 5:27-32 lust / adultery / divorce ---------------------------------
  ('canon','matthew',5,27,'canon','exodus',20,14, 'free', E'*Thou shalt not commit adultery* (Exodus 20:14). *Ye have heard that it was said... Thou shalt not commit adultery* (Matthew 5:27). Again the commandment stands; again Yahusha (JESUS) drives it inward — to the look that has already broken it in the heart.'),
  ('canon','matthew',5,28,'canon','job',31,1, 'free', E'*I made a covenant with mine eyes; why then should I think upon a maid?* (Job 31:1). Long before the Sermon, righteous Job had made the very covenant Yahusha (JESUS) commands — a guard on the eye, not merely the hand. *Whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart* (Matthew 5:28).'),
  ('canon','matthew',5,28,'canon','proverbs',6,25, 'free', E'*Lust not after her beauty in thine heart; neither let her take thee with her eyelids* (Proverbs 6:25). Wisdom already forbade the inward lust — *in thine heart* — that Matthew 5:28 names. The heart-adultery is an old warning made plain.'),
  ('canon','matthew',5,31,'canon','deuteronomy',24,1, 'free', E'*When a man hath taken a wife... then let him write her a bill of divorcement, and give it in her hand, and send her out of his house* (Deuteronomy 24:1). *It hath been said, Whosoever shall put away his wife, let him give her a writing of divorcement* (Matthew 5:31). The certificate was a restraint on a hard heart, not a license; Yahusha (JESUS) restores the union to its first intent.'),
  ('canon','matthew',5,32,'canon','malachi',2,16, 'free', E'*...Therefore take heed to your spirit, and let none deal treacherously against the wife of his youth* (Malachi 2:15). Yahuah (LORD) is witness between a man and the wife of his covenant (Malachi 2:14); He hates the treacherous putting-away. Matthew 5:32 stands squarely on Malachi — divorce wielded against the covenant-wife is treachery.'),

  -- (f) 5:33-37 swear not / yea yea ---------------------------------------
  ('canon','matthew',5,33,'canon','leviticus',19,12, 'free', E'*And ye shall not swear by my name falsely, neither shalt thou profane the name of thy Elohim (God): I am Yahuah (LORD)* (Leviticus 19:12). *Thou shalt not forswear thyself, but shalt perform unto Yahuah (Lord) thine oaths* (Matthew 5:33). The Torah forbade the false oath and the profaned Name — Yahusha (JESUS) guards the Name so jealously He removes the occasion for the oath entirely.'),
  ('canon','matthew',5,33,'canon','numbers',30,2, 'free', E'*If a man vow a vow unto Yahuah (LORD), or swear an oath to bind his soul with a bond; he shall not break his word, he shall do according to all that proceedeth out of his mouth* (Numbers 30:2). The vow is binding; the mouth must be kept. *Let your yea be yea* is this command made the rule of every word.'),
  ('canon','matthew',5,33,'canon','deuteronomy',23,21, 'free', E'*When thou shalt vow a vow unto Yahuah Elohayka (the LORD thy God), thou shalt not slack to pay it... and it would be sin in thee* (Deuteronomy 23:21). Better not to vow at all than to vow and not pay (Deuteronomy 23:22-23). Yahusha (JESUS) reaches the heart of it: *Swear not at all... let your communication be, Yea, yea* (Matthew 5:34, 37).'),
  ('canon','matthew',5,34,'apocrypha','ecclesiasticus',23,9, 'extras', E'*Accustom not your mouth to swearing; neither use thyself to the naming of the Holy One* (Sirach 23:9). The library''s own wisdom anticipates the Sermon — *a man that useth much swearing shall be filled with iniquity* (23:11). *Swear not at all* (Matthew 5:34) is Sirach''s counsel brought to its full edge.'),
  ('canon','matthew',5,37,'canon','james',5,12, 'free', E'*But above all things, my brethren, swear not, neither by heaven, neither by the earth, neither by any other oath: but let your yea be yea; and your nay, nay; lest ye fall into condemnation* (James 5:12). James preserves the Master''s word almost verbatim — the plain truthful word that needs no oath behind it.'),

  -- (g) 5:38-42 eye for an eye / resist not -------------------------------
  ('canon','matthew',5,38,'canon','exodus',21,24, 'free', E'*Eye for eye, tooth for tooth, hand for hand, foot for foot* (Exodus 21:24). *Ye have heard... An eye for an eye, and a tooth for a tooth* (Matthew 5:38). The law of measured recompense was a limit on vengeance set in the court — never a charter for private revenge. Yahusha (JESUS) lifts the disciple above retaliation altogether.'),
  ('canon','matthew',5,38,'canon','leviticus',24,20, 'free', E'*Breach for breach, eye for eye, tooth for tooth: as he hath caused a blemish in a man, so shall it be done to him again* (Leviticus 24:20). The equal-measure standard of the judges — proportion, not passion. The Sermon does not abolish the court''s justice; it forbids the heart''s reprisal.'),
  ('canon','matthew',5,38,'canon','deuteronomy',19,21, 'free', E'*And thine eye shall not pity; but life shall go for life, eye for eye, tooth for tooth, hand for hand, foot for foot* (Deuteronomy 19:21). Set in the law of witnesses and judges — civic justice, not the believer''s license to strike back.'),
  ('canon','matthew',5,39,'canon','proverbs',20,22, 'free', E'*Say not thou, I will recompense evil; but wait on Yahuah (LORD), and he shall save thee* (Proverbs 20:22). *Resist not evil* (Matthew 5:39) is wisdom''s old word — leave the recompense to Yahuah (LORD), do not seize it yourself.'),
  ('canon','matthew',5,39,'canon','lamentations',3,30, 'free', E'*He giveth his cheek to him that smiteth him: he is filled full with reproach* (Lamentations 3:30). *Whosoever shall smite thee on thy right cheek, turn to him the other also* (Matthew 5:39). The offered cheek is already the posture of the righteous sufferer in the Tanakh.'),
  ('canon','matthew',5,39,'canon','isaiah',50,6, 'free', E'*I gave my back to the smiters, and my cheeks to them that plucked off the hair: I hid not my face from shame and spitting* (Isaiah 50:6). The Servant Himself first turned the cheek He commands. *Resist not evil* is the path the Master walked to the cross.'),

  -- (h) 5:43-48 love your enemies / be perfect ----------------------------
  ('canon','matthew',5,43,'canon','leviticus',19,18, 'free', E'*...but thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). *Thou shalt love thy neighbour* — Yahusha (JESUS) quotes the Torah; but *hate thine enemy* was never written there. He strips off the added gloss and gives the commandment back whole: love that reaches even the enemy.'),
  ('canon','matthew',5,44,'canon','exodus',23,4, 'free', E'*If thou meet thine enemy''s ox or his ass going astray, thou shalt surely bring it back to him again* (Exodus 23:4). The Torah already commanded kindness to the enemy''s very beast (Exodus 23:5). *Love your enemies* (Matthew 5:44) is the heart of a law that already bent the hand toward the foe.'),
  ('canon','matthew',5,44,'canon','proverbs',25,21, 'free', E'*If thine enemy be hungry, give him bread to eat; and if he be thirsty, give him water to drink* (Proverbs 25:21). Wisdom commanded enemy-love in deed long before the Sermon — *for thou shalt heap coals of fire upon his head, and Yahuah (LORD) shall reward thee* (25:22).'),
  ('canon','matthew',5,44,'canon','romans',12,20, 'free', E'*Therefore if thine enemy hunger, feed him; if he thirst, give him drink: for in so doing thou shalt heap coals of fire on his head* (Romans 12:20). Sha''ul carries Proverbs and the Sermon forward unchanged — the enemy fed, vengeance left to Yahuah (LORD).'),
  ('canon','matthew',5,48,'canon','leviticus',19,2, 'free', E'*Speak unto all the congregation of the children of Yashar''el (Israel)... Ye shall be holy: for I Yahuah Elohaychem (the LORD your God) am holy* (Leviticus 19:2). *Be ye therefore perfect, even as your Father which is in heaven is perfect* (Matthew 5:48). The call to mirror the Father''s holiness is the heart of the holiness code — Leviticus 19 itself, the chapter of loving the neighbour.'),
  ('canon','matthew',5,48,'canon','deuteronomy',18,13, 'free', E'*Thou shalt be perfect with Yahuah Elohayka (the LORD thy God)* (Deuteronomy 18:13). The very word *perfect* is Moses''. To *be ye therefore perfect* is to walk wholly with the Father — an old command, not a new impossibility.'),
  ('canon','matthew',5,44,'canon','luke',6,27, 'free', E'*But I say unto you which hear, Love your enemies, do good to them which hate you* (Luke 6:27). The plain''s parallel — love, bless, do good, pray — *and ye shall be the children of the Highest: for he is kind unto the unthankful and to the evil* (Luke 6:35).')

)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _mt05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _mt05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- 3c. Threads --------------------------------------------------------------

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-5-blessed-are-the-poor-in-spirit-the-beatitudes-isaiah-61-psalm-37',
       E'Blessed are the poor in spirit — the Beatitudes (Isaiah 61; Psalm 37; Isaiah 66)',
       E'When Yahusha (JESUS) opens His mouth on the mountain, He is not inventing a new ethic — He is reading His own anointing-scroll over the crowd. *The Spirit of Adonai Yahuah (the Lord GOD) is upon me; because Yahuah (LORD) hath anointed me to preach good tidings unto the meek; he hath sent me to bind up the brokenhearted* (Isaiah 61:1), *to comfort all that mourn* (Isaiah 61:2). The poor, the meek, the mourning — these are exactly the ones Isaiah said the Anointed One came to lift. *Blessed are they that mourn: for they shall be comforted* is Isaiah''s own promise; *Blessed are the meek: for they shall inherit the earth* is Psalm 37 almost word for word — *the meek shall inherit the earth; and shall delight themselves in the abundance of peace* (Psalm 37:11). The land-inheritance is no cancelled promise but a reaffirmed one. *Blessed are the poor in spirit* answers Isaiah 66:2 — *to this man will I look, even to him that is poor and of a contrite spirit, and trembleth at my word.* *Blessed are the pure in heart: for they shall see Elohim (God)* climbs Psalm 24''s holy hill — *He that hath clean hands, and a pure heart... shall receive the blessing from Yahuah (LORD)* (Psalm 24:4). And the companion proclamation on the plain seals it: *Blessed be ye poor: for yours is the kingdom of Elohim (God)* (Luke 6:20). Come and see — the Beatitudes are the Tanakh''s own song of the lowly, sung by the One it foretold.',
       sv.verse_id, ev.verse_id, 'free', 11120
  FROM _mt05_lookup sv, _mt05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=5 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-5-ye-are-the-salt-and-light-leviticus-2-isaiah-42-49-60',
       E'Ye are the salt of the earth and the light of the world (Leviticus 2; Isaiah 42, 49, 60)',
       E'*Ye are the salt of the earth* (Matthew 5:13). Salt is the covenant-seasoning of the altar: *every oblation of thy meat offering shalt thou season with salt; neither shalt thou suffer the salt of the covenant of thy Elohim (God) to be lacking* (Leviticus 2:13). To be salt is to be the people of the unbroken covenant — preserving, seasoning, never to lose its savour. *Ye are the light of the world* (Matthew 5:14) carries Isaiah''s servant-calling: *I Yahuah (LORD) have called thee in righteousness... and give thee for a covenant of the people, for a light of the Gentiles* (Isaiah 42:6). That light does double work — *to raise up the tribes of Jacob, and to restore the preserved of Yashar''el (Israel): I will also give thee for a light to the Gentiles* (Isaiah 49:6): scattered Israel gathered home AND the nations brought in, the city on the hill that cannot be hid. And the shining itself is reflected glory, not the lamp''s own: *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee* (Isaiah 60:1) — so *let your light so shine before men, that they may see your good works, and glorify your Father which is in heaven* (Matthew 5:16). The Father is glorified; the lamp only carries His light.',
       sv.verse_id, ev.verse_id, 'free', 11123
  FROM _mt05_lookup sv, _mt05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=5 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-5-think-not-that-i-am-come-to-destroy-the-law-one-jot-or-one-tittle-deuteronomy-4-psalm-119-baruch-4',
       E'Think not that I am come to destroy the law — one jot or one tittle (Deuteronomy 4; Psalm 119; Isaiah 40; Malachi 4; Baruch 4; Sirach 24; 1 Enoch 99; Luke 16)',
       E'Here is the banner over the whole Sermon — and over this entire library: *Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil* (Matthew 5:17). To destroy the law would be to *diminish* from it, the very thing Moses twice forbade: *Ye shall not add unto the word which I command you, neither shall ye diminish ought from it* (Deuteronomy 4:2); *thou shalt not add thereto, nor diminish from it* (Deuteronomy 12:32). Yahusha (JESUS) stands inside the Torah''s own guard, never against it. *Till heaven and earth pass, one jot or one tittle shall in no wise pass from the law, till all be fulfilled* (Matthew 5:18) — because *for ever, O Yahuah (LORD), thy word is settled in heaven* (Psalm 119:89); *thy righteousness is an everlasting righteousness, and thy law is the truth* (Psalm 119:142); *thy word is true from the beginning: and every one of thy righteous judgments endureth for ever* (Psalm 119:160). Heaven and earth are grass and flower — *the grass withereth, the flower fadeth: but the word of our Elohim (God) shall stand for ever* (Isaiah 40:8). The last word of the prophets before Him was *Remember ye the law of Moses my servant... with the statutes and judgments* (Malachi 4:4) — so He honours even the least commandment and calls *great* whoever does and teaches them (Matthew 5:19). The whole library testifies with one voice: *This is the book of the commandments of Yahuah (God), and the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die* (Baruch 4:1) — *the law that endureth for ever*, in the very words of verse 18. Wisdom herself is the Torah: *All these things are the book of the covenant of the most high Yahuah (God), even the law which Moses commanded for an heritage to the congregations of Jacob* (Sirach 24:23). And the woe Matthew 5:19 implies, the library pronounces aloud: *Woe to them who pervert the words of uprightness, And transgress the eternal law, And transform themselves into what they were not* (1 Enoch 99:2). Luke sharpens the banner to its finest point: *it is easier for heaven and earth to pass, than one tittle of the law to fail* (Luke 16:17). Come and see — Messiah upholds the Torah; He does not abolish it. Grace is no license. The antitheses that follow do not loosen a single command; they drive each one down to its heart, where the law was always aimed.',
       sv.verse_id, ev.verse_id, 'extras', 11126
  FROM _mt05_lookup sv, _mt05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=5 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-5-whosoever-is-angry-anger-the-root-of-murder-exodus-20-leviticus-19-genesis-4',
       E'Whosoever is angry — anger, the root of murder (Exodus 20; Leviticus 19; Genesis 4)',
       E'*Ye have heard that it was said by them of old time, Thou shalt not kill* (Matthew 5:21) — the sixth word, *Thou shalt not kill* (Exodus 20:13). Yahusha (JESUS) does not loosen it; He drives it to its root. *Whosoever is angry with his brother without a cause shall be in danger of the judgment* (Matthew 5:22). The Torah had already forbidden the inward hatred behind the deed: *Thou shalt not hate thy brother in thine heart* (Leviticus 19:17), and *Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). The first murder shows the chain plainly: *unto Cain and to his offering he had not respect. And Cain was very wroth, and his countenance fell* (Genesis 4:5) — and Yahuah (LORD) warned him before he ever lifted his hand: *if thou doest not well, sin lieth at the door. And unto thee shall be his desire, and thou shalt rule over him* (Genesis 4:7). The anger came first; the blood came after. So *if thou bring thy gift to the altar, and there rememberest that thy brother hath ought against thee... first be reconciled to thy brother, and then come and offer thy gift* (Matthew 5:24). Come and see — this is the sixth commandment deepened, not displaced: the hand is held by guarding the heart.',
       sv.verse_id, ev.verse_id, 'free', 11129
  FROM _mt05_lookup sv, _mt05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=5 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-5-whosoever-looketh-to-lust-adultery-and-divorce-exodus-20-job-31-deuteronomy-24-malachi-2',
       E'Whosoever looketh to lust — adultery and divorce (Exodus 20; Job 31; Proverbs 6; Deuteronomy 24; Malachi 2)',
       E'*Ye have heard that it was said by them of old time, Thou shalt not commit adultery* (Matthew 5:27) — the seventh word, *Thou shalt not commit adultery* (Exodus 20:14). Again the commandment stands whole; again Yahusha (JESUS) drives it inward: *whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart* (Matthew 5:28). This is no novelty — righteous Job had made the very covenant long before: *I made a covenant with mine eyes; why then should I think upon a maid?* (Job 31:1). And Wisdom had already forbidden the inward lust by name: *Lust not after her beauty in thine heart; neither let her take thee with her eyelids* (Proverbs 6:25). On divorce, the certificate of Deuteronomy was a restraint on a hard heart, not a license — *let him write her a bill of divorcement, and give it in her hand, and send her out of his house* (Deuteronomy 24:1) — and Malachi names the abuse of it for what it is: *Yahuah (LORD) hath been witness between thee and the wife of thy youth, against whom thou hast dealt treacherously: yet is she thy companion, and the wife of thy covenant* (Malachi 2:14), so *take heed to your spirit, and let none deal treacherously against the wife of his youth* (Malachi 2:15). Come and see — Yahusha (JESUS) restores marriage to its first intent and guards it at the eye, exactly where the Tanakh already stood.',
       sv.verse_id, ev.verse_id, 'free', 11132
  FROM _mt05_lookup sv, _mt05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=5 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-5-swear-not-at-all-let-your-yea-be-yea-leviticus-19-numbers-30-deuteronomy-23-sirach-23-james-5',
       E'Swear not at all — let your yea be yea (Leviticus 19; Numbers 30; Deuteronomy 23; Sirach 23; James 5)',
       E'*Thou shalt not forswear thyself, but shalt perform unto Yahuah (Lord) thine oaths* (Matthew 5:33). The Torah forbade the false oath and the profaned Name: *ye shall not swear by my name falsely, neither shalt thou profane the name of thy Elohim (God): I am Yahuah (LORD)* (Leviticus 19:12); and it bound the vow absolutely — *if a man vow a vow unto Yahuah (LORD), or swear an oath to bind his soul with a bond; he shall not break his word, he shall do according to all that proceedeth out of his mouth* (Numbers 30:2); *when thou shalt vow a vow unto Yahuah Elohayka (the LORD thy God), thou shalt not slack to pay it... and it would be sin in thee* (Deuteronomy 23:21). Yahusha (JESUS) guards the Name so jealously that He removes the occasion for the casual oath entirely: *Swear not at all... let your communication be, Yea, yea; Nay, nay* (Matthew 5:34, 37). The library''s own wisdom said the same: *Accustom not your mouth to swearing; neither use thyself to the naming of the Holy One... a man that useth much swearing shall be filled with iniquity* (Sirach 23:9, 11). And His brother Ya''aqob (James) keeps the word almost unchanged: *swear not, neither by heaven, neither by the earth, neither by any other oath: but let your yea be yea; and your nay, nay; lest ye fall into condemnation* (James 5:12). Come and see — the plain truthful word that needs no oath behind it is the law''s own reverence for the Name, brought to its full edge.',
       sv.verse_id, ev.verse_id, 'extras', 11135
  FROM _mt05_lookup sv, _mt05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=33
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=5 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-5-an-eye-for-an-eye-resist-not-evil-exodus-21-leviticus-24-deuteronomy-19-isaiah-50',
       E'An eye for an eye — resist not evil, turn the other cheek (Exodus 21; Leviticus 24; Deuteronomy 19; Proverbs 20; Lamentations 3; Isaiah 50)',
       E'*Ye have heard that it hath been said, An eye for an eye, and a tooth for a tooth* (Matthew 5:38) — *Eye for eye, tooth for tooth, hand for hand, foot for foot* (Exodus 21:24); *as he hath caused a blemish in a man, so shall it be done to him again* (Leviticus 24:20); *life shall go for life, eye for eye, tooth for tooth* (Deuteronomy 19:21). That measured recompense was a limit on vengeance, set in the court of the judges — never a charter for private revenge. Wisdom had already drawn the line for the individual: *Say not thou, I will recompense evil; but wait on Yahuah (LORD), and he shall save thee* (Proverbs 20:22). So *resist not evil: but whosoever shall smite thee on thy right cheek, turn to him the other also* (Matthew 5:39) is no overturning of the law''s justice; it forbids the heart''s reprisal and walks the path of the righteous sufferer: *He giveth his cheek to him that smiteth him: he is filled full with reproach* (Lamentations 3:30). The Servant Himself first turned the cheek He commands: *I gave my back to the smiters, and my cheeks to them that plucked off the hair: I hid not my face from shame and spitting* (Isaiah 50:6). Come and see — the court still measures justice, but the disciple leaves the recompense to Yahuah (LORD) and follows the Master to the cross.',
       sv.verse_id, ev.verse_id, 'free', 11138
  FROM _mt05_lookup sv, _mt05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=38
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=5 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-5-love-your-enemies-be-ye-perfect-leviticus-19-exodus-23-proverbs-25-deuteronomy-18-romans-12',
       E'Love your enemies — be ye perfect as your Father (Leviticus 19; Exodus 23; Proverbs 25; Leviticus 19:2; Deuteronomy 18; Romans 12; Luke 6)',
       E'*Ye have heard that it hath been said, Thou shalt love thy neighbour, and hate thine enemy* (Matthew 5:43). But *hate thine enemy* was never written in the Torah — only *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). Yahusha (JESUS) strips off the added gloss and gives the command back whole: *Love your enemies, bless them that curse you, do good to them that hate you* (Matthew 5:44). And the law had already bent the hand toward the foe — *if thou meet thine enemy''s ox or his ass going astray, thou shalt surely bring it back to him again* (Exodus 23:4); and Wisdom in deed: *if thine enemy be hungry, give him bread to eat; and if he be thirsty, give him water to drink* (Proverbs 25:21), which Sha''ul carries forward unchanged — *if thine enemy hunger, feed him; if he thirst, give him drink* (Romans 12:20). The plain''s parallel seals it: *Love your enemies, do good to them which hate you* (Luke 6:27). The whole reaches its summit in *Be ye therefore perfect, even as your Father which is in heaven is perfect* (Matthew 5:48) — the heart of the holiness code itself: *Ye shall be holy: for I Yahuah Elohaychem (the LORD your God) am holy* (Leviticus 19:2), and Moses'' own word, *Thou shalt be perfect with Yahuah Elohayka (the LORD thy God)* (Deuteronomy 18:13). Come and see — to love the enemy and walk whole with the Father is no new impossibility; it is the Torah''s deepest aim, the holiness of the One who *maketh his sun to rise on the evil and on the good.*',
       sv.verse_id, ev.verse_id, 'free', 11141
  FROM _mt05_lookup sv, _mt05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=43
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=5 AND ev.verse_number=48
ON CONFLICT (slug) DO NOTHING;

-- 3d. Thread members -------------------------------------------------------

-- (a) Beatitudes members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 61:1 — *...he hath anointed me to preach good tidings unto the meek; he hath sent me to bind up the brokenhearted...* The anointing-scroll Yahusha (JESUS) reads over the crowd.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-blessed-are-the-poor-in-spirit-the-beatitudes-isaiah-61-psalm-37'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 61:2 — *...to comfort all that mourn.* Blessed are they that mourn: for they shall be comforted.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-blessed-are-the-poor-in-spirit-the-beatitudes-isaiah-61-psalm-37'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 37:11 — *But the meek shall inherit the earth.* Quoted almost word for word in Matthew 5:5; the land-inheritance reaffirmed to the lowly.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-blessed-are-the-poor-in-spirit-the-beatitudes-isaiah-61-psalm-37'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 66:2 — *...to him that is poor and of a contrite spirit, and trembleth at my word.* The measure of the man Yahuah (LORD) regards — Blessed are the poor in spirit.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-blessed-are-the-poor-in-spirit-the-beatitudes-isaiah-61-psalm-37'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 24:4 — *He that hath clean hands, and a pure heart...* shall ascend the holy hill. Blessed are the pure in heart: for they shall see Elohim (God).'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-blessed-are-the-poor-in-spirit-the-beatitudes-isaiah-61-psalm-37'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=24 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Luke 6:20 — *Blessed be ye poor: for yours is the kingdom of Elohim (God).* The companion proclamation on the plain.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-blessed-are-the-poor-in-spirit-the-beatitudes-isaiah-61-psalm-37'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=6 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (b) salt & light members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 2:13 — *...the salt of the covenant of thy Elohim (God)...* To be salt is to be the people of the unbroken covenant.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-ye-are-the-salt-and-light-leviticus-2-isaiah-42-49-60'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=2 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 42:6 — *...give thee for a covenant of the people, for a light of the Gentiles.* The light to the nations the servant carries.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-ye-are-the-salt-and-light-leviticus-2-isaiah-42-49-60'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=42 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 49:6 — *...to restore the preserved of Yashar''el (Israel): I will also give thee for a light to the Gentiles.* The tribes gathered AND the nations brought in.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-ye-are-the-salt-and-light-leviticus-2-isaiah-42-49-60'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 60:1 — *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* The shining is reflected glory; the Father glorified, not the lamp.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-ye-are-the-salt-and-light-leviticus-2-isaiah-42-49-60'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (c) ★★★ Torah-banner members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 4:2 — *Ye shall not add unto the word... neither shall ye diminish ought from it...* To destroy the law would be to diminish it — the very thing Moses forbade.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-think-not-that-i-am-come-to-destroy-the-law-one-jot-or-one-tittle-deuteronomy-4-psalm-119-baruch-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 12:32 — *...thou shalt not add thereto, nor diminish from it.* The same hedge, twice spoken.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-think-not-that-i-am-come-to-destroy-the-law-one-jot-or-one-tittle-deuteronomy-4-psalm-119-baruch-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 119:89 — *For ever, O Yahuah (LORD), thy word is settled in heaven.* The word outlasts the very sky it is settled in.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-think-not-that-i-am-come-to-destroy-the-law-one-jot-or-one-tittle-deuteronomy-4-psalm-119-baruch-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=89
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 119:142 — *...thy law is the truth.* Not a passing arrangement but everlasting truth.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-think-not-that-i-am-come-to-destroy-the-law-one-jot-or-one-tittle-deuteronomy-4-psalm-119-baruch-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=142
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 119:160 — *...every one of thy righteous judgments endureth for ever.* The jot and tittle included.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-think-not-that-i-am-come-to-destroy-the-law-one-jot-or-one-tittle-deuteronomy-4-psalm-119-baruch-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=160
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Isaiah 40:8 — *...but the word of our Elohim (God) shall stand for ever.* Heaven and earth are grass and flower; the word stands when they fade.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-think-not-that-i-am-come-to-destroy-the-law-one-jot-or-one-tittle-deuteronomy-4-psalm-119-baruch-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Malachi 4:4 — *Remember ye the law of Moses my servant... with the statutes and judgments.* The last word of the prophets: remember the law.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-think-not-that-i-am-come-to-destroy-the-law-one-jot-or-one-tittle-deuteronomy-4-psalm-119-baruch-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'1 Enoch 99:2 — *Woe to them who pervert the words of uprightness, And transgress the eternal law...* The library pronounces aloud the woe Matthew 5:19 implies.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-think-not-that-i-am-come-to-destroy-the-law-one-jot-or-one-tittle-deuteronomy-4-psalm-119-baruch-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=99 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Baruch 4:1 — *...the law that endureth for ever: all they that keep it shall come to life; but such as leave it shall die.* The law that endureth for ever — in the very words of verse 18.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-think-not-that-i-am-come-to-destroy-the-law-one-jot-or-one-tittle-deuteronomy-4-psalm-119-baruch-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 10, E'Sirach 24:23 — *...even the law which Moses commanded for an heritage to the congregations of Jacob.* Wisdom herself is the Torah, the heritage of Jacob.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-think-not-that-i-am-come-to-destroy-the-law-one-jot-or-one-tittle-deuteronomy-4-psalm-119-baruch-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 11, E'Luke 16:17 — *And it is easier for heaven and earth to pass, than one tittle of the law to fail.* The same banner, sharper still.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-think-not-that-i-am-come-to-destroy-the-law-one-jot-or-one-tittle-deuteronomy-4-psalm-119-baruch-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=16 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (d) anger members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:13 — *Thou shalt not kill.* The sixth word, which Yahusha (JESUS) drives to its root, not loosens.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-whosoever-is-angry-anger-the-root-of-murder-exodus-20-leviticus-19-genesis-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 19:17 — *Thou shalt not hate thy brother in thine heart...* The Torah already forbade the inward hatred behind the deed.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-whosoever-is-angry-anger-the-root-of-murder-exodus-20-leviticus-19-genesis-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 19:18 — *Thou shalt not avenge, nor bear any grudge... but thou shalt love thy neighbour as thyself.* The grudge in the heart is the seed of the council and the fire.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-whosoever-is-angry-anger-the-root-of-murder-exodus-20-leviticus-19-genesis-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 4:5 — *...And Cain was very wroth, and his countenance fell.* The first murder began as the first anger.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-whosoever-is-angry-anger-the-root-of-murder-exodus-20-leviticus-19-genesis-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Genesis 4:7 — *...sin lieth at the door. And unto thee shall be his desire, and thou shalt rule over him.* The warning to master the anger before the gift at the altar means anything.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-whosoever-is-angry-anger-the-root-of-murder-exodus-20-leviticus-19-genesis-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (e) lust / divorce members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:14 — *Thou shalt not commit adultery.* The seventh word, driven inward to the look that has already broken it.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-whosoever-looketh-to-lust-adultery-and-divorce-exodus-20-job-31-deuteronomy-24-malachi-2'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Job 31:1 — *I made a covenant with mine eyes; why then should I think upon a maid?* Righteous Job had made the very covenant Yahusha (JESUS) commands.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-whosoever-looketh-to-lust-adultery-and-divorce-exodus-20-job-31-deuteronomy-24-malachi-2'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=31 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 6:25 — *Lust not after her beauty in thine heart...* Wisdom already forbade the inward lust by name.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-whosoever-looketh-to-lust-adultery-and-divorce-exodus-20-job-31-deuteronomy-24-malachi-2'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=6 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 24:1 — *...then let him write her a bill of divorcement...* The certificate was a restraint on a hard heart, not a license.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-whosoever-looketh-to-lust-adultery-and-divorce-exodus-20-job-31-deuteronomy-24-malachi-2'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=24 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Malachi 2:15 — *...let none deal treacherously against the wife of his youth.* Yahuah (LORD) hates the treacherous putting-away; Matthew 5:32 stands on Malachi.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-whosoever-looketh-to-lust-adultery-and-divorce-exodus-20-job-31-deuteronomy-24-malachi-2'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (f) swear-not members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:12 — *And ye shall not swear by my name falsely, neither shalt thou profane the name of thy Elohim (God)...* The Torah forbade the false oath and the profaned Name.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-swear-not-at-all-let-your-yea-be-yea-leviticus-19-numbers-30-deuteronomy-23-sirach-23-james-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 30:2 — *...he shall not break his word, he shall do according to all that proceedeth out of his mouth.* The vow is binding; the mouth must be kept.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-swear-not-at-all-let-your-yea-be-yea-leviticus-19-numbers-30-deuteronomy-23-sirach-23-james-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=30 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 23:21 — *...thou shalt not slack to pay it... and it would be sin in thee.* Better not to vow at all than to vow and not pay.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-swear-not-at-all-let-your-yea-be-yea-leviticus-19-numbers-30-deuteronomy-23-sirach-23-james-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=23 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 23:9 — *Accustom not your mouth to swearing; neither use thyself to the naming of the Holy One.* The library''s own wisdom anticipates the Sermon.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-swear-not-at-all-let-your-yea-be-yea-leviticus-19-numbers-30-deuteronomy-23-sirach-23-james-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=34
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=23 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'James 5:12 — *...swear not... but let your yea be yea; and your nay, nay; lest ye fall into condemnation.* His brother keeps the Master''s word almost verbatim.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-swear-not-at-all-let-your-yea-be-yea-leviticus-19-numbers-30-deuteronomy-23-sirach-23-james-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (g) eye-for-eye members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 21:24 — *Eye for eye, tooth for tooth, hand for hand, foot for foot.* A limit on vengeance set in the court, not a charter for private revenge.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-an-eye-for-an-eye-resist-not-evil-exodus-21-leviticus-24-deuteronomy-19-isaiah-50'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=21 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 24:20 — *Breach for breach, eye for eye, tooth for tooth...* The equal-measure standard of the judges: proportion, not passion.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-an-eye-for-an-eye-resist-not-evil-exodus-21-leviticus-24-deuteronomy-19-isaiah-50'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=24 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 19:21 — *...life shall go for life, eye for eye, tooth for tooth...* Set in the law of witnesses and judges — civic justice, not the believer''s license.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-an-eye-for-an-eye-resist-not-evil-exodus-21-leviticus-24-deuteronomy-19-isaiah-50'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=19 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 20:22 — *Say not thou, I will recompense evil; but wait on Yahuah (LORD)...* Wisdom''s old word: leave the recompense to Yahuah (LORD).'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-an-eye-for-an-eye-resist-not-evil-exodus-21-leviticus-24-deuteronomy-19-isaiah-50'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=20 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Lamentations 3:30 — *He giveth his cheek to him that smiteth him...* The offered cheek is already the posture of the righteous sufferer in the Tanakh.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-an-eye-for-an-eye-resist-not-evil-exodus-21-leviticus-24-deuteronomy-19-isaiah-50'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=3 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Isaiah 50:6 — *I gave my back to the smiters, and my cheeks to them that plucked off the hair...* The Servant first turned the cheek He commands.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-an-eye-for-an-eye-resist-not-evil-exodus-21-leviticus-24-deuteronomy-19-isaiah-50'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=50 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (h) love-enemies members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:18 — *...thou shalt love thy neighbour as thyself: I am Yahuah (LORD).* Yahusha (JESUS) quotes the Torah; *hate thine enemy* was never written there.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-love-your-enemies-be-ye-perfect-leviticus-19-exodus-23-proverbs-25-deuteronomy-18-romans-12'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 23:4 — *If thou meet thine enemy''s ox or his ass going astray, thou shalt surely bring it back to him again.* The law already bent the hand toward the foe.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-love-your-enemies-be-ye-perfect-leviticus-19-exodus-23-proverbs-25-deuteronomy-18-romans-12'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 25:21 — *If thine enemy be hungry, give him bread to eat; and if he be thirsty, give him water to drink.* Wisdom commanded enemy-love in deed long before the Sermon.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-love-your-enemies-be-ye-perfect-leviticus-19-exodus-23-proverbs-25-deuteronomy-18-romans-12'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=25 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 12:20 — *Therefore if thine enemy hunger, feed him; if he thirst, give him drink...* Sha''ul carries Proverbs and the Sermon forward unchanged.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-love-your-enemies-be-ye-perfect-leviticus-19-exodus-23-proverbs-25-deuteronomy-18-romans-12'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Leviticus 19:2 — *Ye shall be holy: for I Yahuah Elohaychem (the LORD your God) am holy.* The heart of the holiness code — Be ye therefore perfect.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-love-your-enemies-be-ye-perfect-leviticus-19-exodus-23-proverbs-25-deuteronomy-18-romans-12'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Deuteronomy 18:13 — *Thou shalt be perfect with Yahuah Elohayka (the LORD thy God).* The very word *perfect* is Moses''.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-love-your-enemies-be-ye-perfect-leviticus-19-exodus-23-proverbs-25-deuteronomy-18-romans-12'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Luke 6:27 — *Love your enemies, do good to them which hate you.* The plain''s parallel, sealing the command.'
  FROM cross_reference_threads t, cross_references x, _mt05_lookup sv, _mt05_lookup tv
 WHERE t.slug='matthew-5-love-your-enemies-be-ye-perfect-leviticus-19-exodus-23-proverbs-25-deuteronomy-18-romans-12'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=5 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=6 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_matthew_06.sql (S260 Matthew depth) -----
-- ============================================================================
-- Matthew 6 — full-library cross-reference threads (NT DEPTH pass)
-- alms/prayer/fasting in secret + the Lord's Prayer + treasures / single eye /
-- seek first the kingdom. 7 threads. sort_order band 11150 step +3.
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 3a. Temp view
-- ----------------------------------------------------------------------------
CREATE TEMP VIEW _mt06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ----------------------------------------------------------------------------
-- 3b. The cross_references rows
-- ----------------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES

  -- (a) 6:1-4 alms in secret -------------------------------------------------
  ('canon','matthew',6,1,'canon','deuteronomy',15,11,'free', E'*For the poor shall never cease out of the land: therefore I command thee, saying, Thou shalt open thine hand wide unto thy brother, to thy poor, and to thy needy, in thy land.* (Deuteronomy 15:11) — alms is not optional charity but a standing command of the Torah; Yahusha (JESUS) only guards its motive.'),
  ('canon','matthew',6,1,'canon','proverbs',19,17,'free', E'*He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again.* (Proverbs 19:17) — the secret gift is a loan to Yahuah Himself, and the Father who *seeth in secret* repays.'),
  ('canon','matthew',6,1,'canon','psalms',112,9,'free', E'*He hath dispersed, he hath given to the poor; his righteousness endureth for ever; his horn shall be exalted with honour.* (Psalm 112:9) — the righteous scatter abroad and their reward is lasting, not the fleeting glory of men.'),
  ('canon','matthew',6,1,'apocrypha','tobit',4,7,'extras', E'*Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you.* (Tobit 4:7) — old Yashar''el (Israel) taught its sons this very secret-handed giving.'),
  ('canon','matthew',6,1,'apocrypha','tobit',12,8,'extras', E'*Prayer is good with fasting and alms and righteousness. A little with righteousness is better than much with unrighteousness. It is better to give alms than to lay up gold:* (Tobit 12:8) — the three pillars of Matthew 6 — prayer, fasting, alms — stand together in the older witness.'),
  ('canon','matthew',6,1,'apocrypha','ecclesiasticus',17,22,'extras', E'*The alms of a man is as a signet with him, and he will keep the good deeds of man as the apple of the eye, and give repentance to his sons and daughters.* (Sirach 17:22) — the alms done in secret is sealed and kept by the Father as the apple of His eye.'),

  -- (b) 6:5-8 prayer in secret -----------------------------------------------
  ('canon','matthew',6,5,'canon','isaiah',26,20,'free', E'*Come, my people, enter thou into thy chambers, and shut thy doors about thee: hide thyself as it were for a little moment, until the indignation be overpast.* (Isaiah 26:20) — *enter into thy closet, and when thou hast shut thy door, pray to thy Father which is in secret* (Matthew 6:6) is Isaiah''s very pattern: shut the door, seek Yahuah within.'),
  ('canon','matthew',6,5,'canon','ecclesiastes',5,2,'free', E'*Be not rash with thy mouth, and let not thine heart be hasty to utter any thing before Elohim (God): for Elohim (God) is in heaven, and thou upon earth: therefore let thy words be few.* (Ecclesiastes 5:2) — *use not vain repetitions* (Matthew 6:7) is the wisdom of the preacher: few words before the Father who already *knoweth what things ye have need of, before ye ask him.*'),

  -- (c) ★★ 6:9-13 the Lord's Prayer ------------------------------------------
  ('canon','matthew',6,9,'canon','isaiah',63,16,'free', E'*Doubtless thou art our father, though Abraham be ignorant of us, and Yashar''el (Israel) acknowledge us not: thou, O Yahuah (LORD), art our father, our redeemer; thy name is from everlasting.* (Isaiah 63:16) — when the Formed Son teaches *Our Father which art in heaven*, He points the children straight to Yahuah, the Father and Redeemer of old.'),
  ('canon','matthew',6,9,'canon','isaiah',64,8,'free', E'*But now, O Yahuah (LORD), thou art our father; we are the clay, and thou our potter; and we all are the work of thy hand.* (Isaiah 64:8) — the Father addressed in the prayer is the Potter, the Source; the Son who teaches us to pray is Himself the work of the Father''s hand.'),
  ('canon','matthew',6,9,'canon','ezekiel',36,23,'free', E'*And I will sanctify my great name, which was profaned among the heathen... and the heathen shall know that I am Yahuah (LORD)... when I shall be sanctified in you before their eyes.* (Ezekiel 36:23) — *Hallowed be thy name* is the prayer that Yahuah''s own great Name be sanctified in His people; the Name hallowed is the Name **Yahuah**.'),
  ('canon','matthew',6,9,'canon','leviticus',22,32,'free', E'*Neither shall ye profane my holy name; but I will be hallowed among the children of Yashar''el (Israel): I am Yahuah (LORD) which hallow you.* (Leviticus 22:32) — *Hallowed be thy name* roots in the Torah''s own charge to hallow the Name of Yahuah and never profane it.'),
  ('canon','matthew',6,9,'canon','psalms',103,19,'free', E'*Yahuah (LORD) hath prepared his throne in the heavens; and his kingdom ruleth over all.* (Psalm 103:19) — *Thy kingdom come... Thy will be done in earth, as it is in heaven*: the heavenly throne and the angels that *do his commandments* are the pattern earth is to follow.'),
  ('canon','matthew',6,9,'canon','psalms',145,11,'free', E'*They shall speak of the glory of thy kingdom, and talk of thy power... Thy kingdom is an everlasting kingdom, and thy dominion endureth throughout all generations.* (Psalm 145:11,13) — *Thine is the kingdom, and the power, and the glory, for ever* is drawn straight from this psalm of the everlasting kingdom.'),
  ('canon','matthew',6,9,'canon','proverbs',30,8,'free', E'*Remove far from me vanity and lies: give me neither poverty nor riches; feed me with food convenient for me.* (Proverbs 30:8) — *Give us this day our daily bread* is Agur''s prayer for *food convenient* — enough for the day, no more.'),
  ('canon','matthew',6,9,'canon','luke',11,2,'free', E'*When ye pray, say, Our Father which art in heaven, Hallowed be thy name. Thy kingdom come. Thy will be done, as in heaven, so in earth. Give us day by day our daily bread.* (Luke 11:2-3) — the same prayer, the same Father, given again to the disciples.'),

  -- (d) 6:14-15 forgive trespasses -------------------------------------------
  ('canon','matthew',6,14,'apocrypha','ecclesiasticus',28,2,'extras', E'*Forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven when you prayest.* (Sirach 28:2) — the very law of the prayer — *forgive us our debts, as we forgive our debtors* — was already taught in Yashar''el (Israel): release your neighbour and you are released.'),
  ('canon','matthew',6,14,'apocrypha','ecclesiasticus',28,4,'extras', E'*He sheweth no mercy to a man, which is like himself: and does he ask forgiveness of his own sins?* (Sirach 28:4) — the unforgiving man who *forgive not men their trespasses* has no ground to plead his own pardon.'),
  ('canon','matthew',6,14,'canon','mark',11,25,'free', E'*And when ye stand praying, forgive, if ye have ought against any: that your Father also which is in heaven may forgive you your trespasses.* (Mark 11:25) — the same word, joined again to prayer: forgiveness received flows through forgiveness given.'),

  -- (e) 6:16-18 fasting ------------------------------------------------------
  ('canon','matthew',6,16,'canon','isaiah',58,5,'free', E'*Is it such a fast that I have chosen? a day for a man to afflict his soul? is it to bow down his head as a bulrush, and to spread sackcloth and ashes under him? wilt thou call this a fast?* (Isaiah 58:5) — the *sad countenance* and *disfigured faces* of the hypocrites are exactly the show-fast Yahuah refuses.'),
  ('canon','matthew',6,16,'canon','isaiah',58,6,'free', E'*Is not this the fast that I have chosen? to loose the bands of wickedness, to undo the heavy burdens, and to let the oppressed go free, and that ye break every yoke?* (Isaiah 58:6) — the fast Yahuah honours is hidden mercy, not a performance *to appear unto men to fast.*'),
  ('canon','matthew',6,16,'canon','joel',2,12,'free', E'*Turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning: And rend your heart, and not your garments.* (Joel 2:12-13) — *rend your heart, and not your garments* is the whole counsel of Matthew 6:16-18: fasting is between you and the Father who *seeth in secret.*'),

  -- (f) 6:19-24 treasures / single eye / mammon ------------------------------
  ('canon','matthew',6,19,'canon','proverbs',23,4,'free', E'*Labour not to be rich: cease from thine own wisdom. Wilt thou set thine eyes upon that which is not? for riches certainly make themselves wings; they fly away as an eagle toward heaven.* (Proverbs 23:4-5) — earthly treasure that *moth and rust doth corrupt* takes wings; do not bind your heart to it.'),
  ('canon','matthew',6,19,'canon','ecclesiastes',5,10,'free', E'*He that loveth silver shall not be satisfied with silver; nor he that loveth abundance with increase: this is also vanity.* (Ecclesiastes 5:10) — the man who serves mammon is never filled; *ye cannot serve Elohim (God) and mammon.*'),
  ('canon','matthew',6,19,'canon','malachi',3,10,'free', E'*Bring ye all the tithes into the storehouse... and prove me now herewith, saith Yahuah Tseva''ot (LORD of hosts), if I will not open you the windows of heaven, and pour you out a blessing.* (Malachi 3:10) — treasure *laid up in heaven* by open-handed trust returns blessing that earth cannot hold.'),
  ('canon','matthew',6,19,'apocrypha','ecclesiasticus',29,11,'extras', E'*Lay up your treasure according to the commandments of the Most High, and it shall bring you more profit than gold. Shut up alms in your storehouses: and it shall deliver you from all affliction.* (Sirach 29:11-12) — *lay up for yourselves treasures in heaven* is the very counsel of Sirach: alms is treasure stored where it cannot corrupt.'),

  -- (g) 6:25-34 take no thought / lilies / seek first ------------------------
  ('canon','matthew',6,25,'canon','psalms',37,25,'free', E'*I have been young, and now am old; yet have I not seen the righteous forsaken, nor his seed begging bread.* (Psalm 37:25) — *Take no thought for your life*: the Father who has never forsaken the righteous feeds the fowls and clothes the grass.'),
  ('canon','matthew',6,25,'canon','psalms',55,22,'free', E'*Cast thy burden upon Yahuah (LORD), and he shall sustain thee: he shall never suffer the righteous to be moved.* (Psalm 55:22) — the cure for anxious thought is to cast the burden upon the Father who sustains.'),
  ('canon','matthew',6,25,'canon','psalms',104,14,'free', E'*He causeth the grass to grow for the cattle, and herb for the service of man; that he may bring forth food out of the earth... and bread which strengtheneth man''s heart.* (Psalm 104:14-15) — the same Father who feeds the cattle and brings forth bread *feedeth* the fowls and clothes the lilies.'),
  ('canon','matthew',6,25,'canon','proverbs',6,8,'free', E'*Provideth her meat in the summer, and gathereth her food in the harvest.* (Proverbs 6:8) — even the ant works within Yahuah''s provision; *take no thought* is not idleness but trust, the heart freed from anxious care.'),
  ('canon','matthew',6,25,'canon','luke',12,22,'free', E'*Take no thought for your life, what ye shall eat... Consider the ravens: for they neither sow nor reap... and Elohim (God) feedeth them... But rather seek ye the kingdom of Elohim (God); and all these things shall be added unto you.* (Luke 12:22,24,31) — the same teaching, *seek ye first the kingdom*, and the Father adds the rest.')

)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _mt06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _mt06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3c. The threads
-- ----------------------------------------------------------------------------

-- (a) 6:1-4 alms in secret
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-6-alms-in-secret-the-father-which-seeth-in-secret-deuteronomy-15-tobit-4',
       E'Alms in secret — thy Father which seeth in secret (Deuteronomy 15; Proverbs 19; Tobit; Sirach)',
       E'*Take heed that ye do not your alms before men, to be seen of them... That thine alms may be in secret: and thy Father which seeth in secret himself shall reward thee openly* (Matthew 6:1,4). Yahusha (JESUS) is not inventing charity; He is guarding the heart of a standing Torah command. *For the poor shall never cease out of the land: therefore I command thee, saying, Thou shalt open thine hand wide unto thy brother, to thy poor, and to thy needy, in thy land* (Deuteronomy 15:11). The open hand is commanded — only the trumpet is forbidden. And the gift handed quietly is no loss: *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again* (Proverbs 19:17). *He hath dispersed, he hath given to the poor; his righteousness endureth for ever* (Psalm 112:9). Old Yashar''el (Israel) already taught its sons this secret-handed giving: *Give alms of your substance; and when you give alms, let not your eye be envious... and the face of Yahuah (God) shall not be turned away from you* (Tobit 4:7); *It is better to give alms than to lay up gold* (Tobit 12:8); *The alms of a man is as a signet with him, and he will keep the good deeds of man as the apple of the eye* (Sirach 17:22). The reward of the hypocrite is the glance of men; the reward of the hidden giver is the eye of the Father.',
       sv.verse_id, ev.verse_id, 'extras', 11150
  FROM _mt06_lookup sv, _mt06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=6 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- (b) 6:5-8 prayer in secret
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-6-prayer-in-secret-enter-into-thy-closet-isaiah-26-ecclesiastes-5',
       E'Prayer in secret — enter into thy closet, shut thy door (Isaiah 26; Ecclesiastes 5)',
       E'*But thou, when thou prayest, enter into thy closet, and when thou hast shut thy door, pray to thy Father which is in secret; and thy Father which seeth in secret shall reward thee openly* (Matthew 6:6). This is no new commandment but Isaiah''s very pattern: *Come, my people, enter thou into thy chambers, and shut thy doors about thee: hide thyself as it were for a little moment, until the indignation be overpast* (Isaiah 26:20). Shut the door, seek Yahuah within. And against the heathen who *think that they shall be heard for their much speaking* (Matthew 6:7), the preacher had already said: *Be not rash with thy mouth, and let not thine heart be hasty to utter any thing before Elohim (God): for Elohim (God) is in heaven, and thou upon earth: therefore let thy words be few* (Ecclesiastes 5:2). Few words, and those in secret — for *your Father knoweth what things ye have need of, before ye ask him* (Matthew 6:8). Prayer is not performance to be seen; it is a son speaking to his Father behind a shut door.',
       sv.verse_id, ev.verse_id, 'free', 11153
  FROM _mt06_lookup sv, _mt06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=6 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- (c) ★★ 6:9-13 the Lord's Prayer
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-6-the-lords-prayer-our-father-hallowed-be-thy-name-isaiah-63-ezekiel-36',
       E'The Lord''s Prayer — Our Father, hallowed be thy name (Isaiah 63-64; Ezekiel 36; Leviticus 22; Psalm 103, 145)',
       E'*After this manner therefore pray ye: Our Father which art in heaven, Hallowed be thy name. Thy kingdom come. Thy will be done in earth, as it is in heaven. Give us this day our daily bread* (Matthew 6:9-11). The Formed Son does not teach the disciples to pray to Himself — He teaches them to address **the Father**, the Source. *Doubtless thou art our father, though Abraham be ignorant of us, and Yashar''el (Israel) acknowledge us not: thou, O Yahuah (LORD), art our father, our redeemer; thy name is from everlasting* (Isaiah 63:16). *But now, O Yahuah (LORD), thou art our father; we are the clay, and thou our potter* (Isaiah 64:8) — the Father is the Potter; the Son who teaches us to pray is Himself the work of His hand. **Hallowed be thy name**: the Name to be hallowed is the Name **Yahuah**. *And I will sanctify my great name, which was profaned among the heathen... and the heathen shall know that I am Yahuah (LORD)... when I shall be sanctified in you before their eyes* (Ezekiel 36:23); *Neither shall ye profane my holy name; but I will be hallowed among the children of Yashar''el (Israel): I am Yahuah (LORD) which hallow you* (Leviticus 22:32). **Thy kingdom come, thy will be done**: *Yahuah (LORD) hath prepared his throne in the heavens; and his kingdom ruleth over all* (Psalm 103:19) — and the angels that *do his commandments* are the pattern earth is to follow. *Thy kingdom is an everlasting kingdom, and thy dominion endureth throughout all generations* (Psalm 145:13), from which the closing doxology is drawn: *For thine is the kingdom, and the power, and the glory, for ever.* **Daily bread**: *give me neither poverty nor riches; feed me with food convenient for me* (Proverbs 30:8) — enough for the day. And the same prayer was given again: *When ye pray, say, Our Father which art in heaven, Hallowed be thy name. Thy kingdom come* (Luke 11:2). One Father, one Name, one kingdom — and the Son who reveals the invisible Father by teaching us to call upon Him.',
       sv.verse_id, ev.verse_id, 'free', 11156
  FROM _mt06_lookup sv, _mt06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=6 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- (d) 6:14-15 forgive trespasses
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-6-forgive-men-their-trespasses-as-we-forgive-sirach-28-mark-11',
       E'Forgive men their trespasses — as we forgive our debtors (Sirach 28; Mark 11)',
       E'*For if ye forgive men their trespasses, your heavenly Father will also forgive you: But if ye forgive not men their trespasses, neither will your Father forgive your trespasses* (Matthew 6:14-15). This unfolds the petition *forgive us our debts, as we forgive our debtors* — and it was no new law. Yashar''el (Israel) had long been taught: *Forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven when you prayest* (Sirach 28:2). And the unforgiving man is left without a plea: *He sheweth no mercy to a man, which is like himself: and does he ask forgiveness of his own sins?* (Sirach 28:4). The Master joins the same word to prayer once more: *And when ye stand praying, forgive, if ye have ought against any: that your Father also which is in heaven may forgive you your trespasses* (Mark 11:25). Forgiveness received and forgiveness given are one stream — to dam the one is to dam the other.',
       sv.verse_id, ev.verse_id, 'extras', 11159
  FROM _mt06_lookup sv, _mt06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=6 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- (e) 6:16-18 fasting
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-6-fasting-not-as-the-hypocrites-the-fast-yahuah-chooses-isaiah-58-joel-2',
       E'Fasting — not as the hypocrites, the fast Yahuah chooses (Isaiah 58; Joel 2)',
       E'*Moreover when ye fast, be not, as the hypocrites, of a sad countenance: for they disfigure their faces, that they may appear unto men to fast... But thou, when thou fastest, anoint thine head, and wash thy face; That thou appear not unto men to fast, but unto thy Father which is in secret* (Matthew 6:16-18). The disfigured face is exactly the show-fast Yahuah long ago refused: *Is it such a fast that I have chosen? a day for a man to afflict his soul? is it to bow down his head as a bulrush, and to spread sackcloth and ashes under him? wilt thou call this a fast?* (Isaiah 58:5). The fast Yahuah honours is hidden mercy: *Is not this the fast that I have chosen? to loose the bands of wickedness, to undo the heavy burdens, and to let the oppressed go free, and that ye break every yoke?* (Isaiah 58:6). And Joel names the whole secret of it: *Turn ye even to me with all your heart, and with fasting, and with weeping... And rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God)* (Joel 2:12-13). Rend the heart, not the garment — fasting is between a man and the Father who *seeth in secret.*',
       sv.verse_id, ev.verse_id, 'free', 11162
  FROM _mt06_lookup sv, _mt06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=6 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- (f) 6:19-24 treasures / single eye / mammon
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-6-treasures-in-heaven-ye-cannot-serve-god-and-mammon-proverbs-23-sirach-29',
       E'Treasures in heaven — ye cannot serve Elohim and mammon (Proverbs 23; Ecclesiastes 5; Malachi 3; Sirach 29)',
       E'*Lay not up for yourselves treasures upon earth, where moth and rust doth corrupt... But lay up for yourselves treasures in heaven... For where your treasure is, there will your heart be also* (Matthew 6:19-21). The wise had long warned that earthly hoard takes wings: *Labour not to be rich: cease from thine own wisdom. Wilt thou set thine eyes upon that which is not? for riches certainly make themselves wings; they fly away as an eagle toward heaven* (Proverbs 23:4-5). And it never satisfies: *He that loveth silver shall not be satisfied with silver; nor he that loveth abundance with increase: this is also vanity* (Ecclesiastes 5:10) — which is why *No man can serve two masters... Ye cannot serve Elohim (God) and mammon* (Matthew 6:24). The treasure that endures is laid up by open-handed trust: *Bring ye all the tithes into the storehouse... and prove me now herewith, saith Yahuah Tseva''ot (LORD of hosts), if I will not open you the windows of heaven, and pour you out a blessing, that there shall not be room enough to receive it* (Malachi 3:10). Yashar''el (Israel) knew this treasury well: *Lay up your treasure according to the commandments of the Most High, and it shall bring you more profit than gold. Shut up alms in your storehouses: and it shall deliver you from all affliction* (Sirach 29:11-12). Alms given is treasure stored where no moth corrupts and no thief breaks through.',
       sv.verse_id, ev.verse_id, 'extras', 11165
  FROM _mt06_lookup sv, _mt06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=6 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- (g) 6:25-34 take no thought / lilies / seek first
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-6-take-no-thought-seek-first-the-kingdom-psalm-37-psalm-55-luke-12',
       E'Take no thought — consider the lilies, seek first the kingdom (Psalm 37, 55, 104; Proverbs 6; Luke 12)',
       E'*Therefore I say unto you, Take no thought for your life... Behold the fowls of the air: for they sow not, neither do they reap... yet your heavenly Father feedeth them... Consider the lilies of the field, how they grow... But seek ye first the kingdom of Elohim (God), and his righteousness; and all these things shall be added unto you* (Matthew 6:25-26,28,33). The ground of this trust is the Father''s unbroken faithfulness: *I have been young, and now am old; yet have I not seen the righteous forsaken, nor his seed begging bread* (Psalm 37:25). So the cure for anxious thought is to hand the weight over: *Cast thy burden upon Yahuah (LORD), and he shall sustain thee: he shall never suffer the righteous to be moved* (Psalm 55:22). The same Father who feeds the fowls brings forth bread from the earth: *He causeth the grass to grow for the cattle, and herb for the service of man; that he may bring forth food out of the earth... and bread which strengtheneth man''s heart* (Psalm 104:14-15). *Take no thought* is not idleness — even the ant *provideth her meat in the summer, and gathereth her food in the harvest* (Proverbs 6:8) — but trust, the heart freed from care to seek the kingdom first. And the Master taught it twice: *Take no thought for your life... Consider the ravens: for they neither sow nor reap... and Elohim (God) feedeth them... But rather seek ye the kingdom of Elohim (God); and all these things shall be added unto you* (Luke 12:22,24,31).',
       sv.verse_id, ev.verse_id, 'free', 11168
  FROM _mt06_lookup sv, _mt06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=6 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3d. The thread_members
-- ----------------------------------------------------------------------------

-- (a) 6:1-4 alms in secret members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 15:11 — *Thou shalt open thine hand wide unto thy brother, to thy poor, and to thy needy* — alms is a standing Torah command.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-alms-in-secret-the-father-which-seeth-in-secret-deuteronomy-15-tobit-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 19:17 — *He that hath pity upon the poor lendeth unto Yahuah (LORD)* — the secret gift is a loan the Father repays.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-alms-in-secret-the-father-which-seeth-in-secret-deuteronomy-15-tobit-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 112:9 — *He hath dispersed, he hath given to the poor; his righteousness endureth for ever* — lasting reward, not fleeting glory.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-alms-in-secret-the-father-which-seeth-in-secret-deuteronomy-15-tobit-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=112 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Tobit 4:7 — *Give alms of your substance... and the face of Yahuah (God) shall not be turned away from you* — old Yashar''el (Israel) taught secret-handed giving.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-alms-in-secret-the-father-which-seeth-in-secret-deuteronomy-15-tobit-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Tobit 12:8 — *Prayer is good with fasting and alms and righteousness* — the three pillars of Matthew 6 stand together in the older witness.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-alms-in-secret-the-father-which-seeth-in-secret-deuteronomy-15-tobit-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=12 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Sirach 17:22 — *The alms of a man is as a signet with him... as the apple of the eye* — the secret alms is sealed and kept by the Father.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-alms-in-secret-the-father-which-seeth-in-secret-deuteronomy-15-tobit-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=17 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (b) 6:5-8 prayer in secret members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 26:20 — *enter thou into thy chambers, and shut thy doors about thee* — the very pattern of the shut closet.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-prayer-in-secret-enter-into-thy-closet-isaiah-26-ecclesiastes-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiastes 5:2 — *Elohim (God) is in heaven, and thou upon earth: therefore let thy words be few* — against the heathen''s much speaking.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-prayer-in-secret-enter-into-thy-closet-isaiah-26-ecclesiastes-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (c) 6:9-13 Lord's Prayer members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 63:16 — *thou, O Yahuah (LORD), art our father, our redeemer; thy name is from everlasting* — the Father the Son points us to.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-the-lords-prayer-our-father-hallowed-be-thy-name-isaiah-63-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=63 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 64:8 — *thou art our father; we are the clay, and thou our potter* — the Father is the Source; the Son is the work of His hand.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-the-lords-prayer-our-father-hallowed-be-thy-name-isaiah-63-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=64 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 36:23 — *I will sanctify my great name... I am Yahuah (LORD)* — Hallowed be thy name: the Name hallowed is Yahuah.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-the-lords-prayer-our-father-hallowed-be-thy-name-isaiah-63-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 22:32 — *Neither shall ye profane my holy name; but I will be hallowed... I am Yahuah (LORD)* — the Torah''s charge to hallow the Name.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-the-lords-prayer-our-father-hallowed-be-thy-name-isaiah-63-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=22 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 103:19 — *Yahuah (LORD) hath prepared his throne in the heavens; and his kingdom ruleth over all* — Thy kingdom come, thy will be done.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-the-lords-prayer-our-father-hallowed-be-thy-name-isaiah-63-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Psalm 145:11,13 — *Thy kingdom is an everlasting kingdom* — the source of the closing doxology, thine is the kingdom and the power and the glory.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-the-lords-prayer-our-father-hallowed-be-thy-name-isaiah-63-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=145 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Proverbs 30:8 — *give me neither poverty nor riches; feed me with food convenient for me* — Give us this day our daily bread.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-the-lords-prayer-our-father-hallowed-be-thy-name-isaiah-63-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=30 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Luke 11:2-3 — *When ye pray, say, Our Father which art in heaven, Hallowed be thy name* — the same prayer given again.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-the-lords-prayer-our-father-hallowed-be-thy-name-isaiah-63-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=11 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (d) 6:14-15 forgive members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Sirach 28:2 — *Forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven* — the law of the prayer, taught of old.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-forgive-men-their-trespasses-as-we-forgive-sirach-28-mark-11'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=28 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach 28:4 — *He sheweth no mercy to a man, which is like himself: and does he ask forgiveness of his own sins?* — the unforgiving have no plea.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-forgive-men-their-trespasses-as-we-forgive-sirach-28-mark-11'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=28 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Mark 11:25 — *when ye stand praying, forgive... that your Father also which is in heaven may forgive you* — the same word joined to prayer.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-forgive-men-their-trespasses-as-we-forgive-sirach-28-mark-11'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=11 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (e) 6:16-18 fasting members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 58:5 — *is it to bow down his head as a bulrush... wilt thou call this a fast?* — the show-fast Yahuah refuses.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-fasting-not-as-the-hypocrites-the-fast-yahuah-chooses-isaiah-58-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 58:6 — *Is not this the fast that I have chosen? to loose the bands of wickedness... let the oppressed go free* — the fast Yahuah honours is hidden mercy.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-fasting-not-as-the-hypocrites-the-fast-yahuah-chooses-isaiah-58-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joel 2:12 — *turn ye even to me with all your heart, and with fasting... And rend your heart, and not your garments* — fasting between a man and the Father in secret.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-fasting-not-as-the-hypocrites-the-fast-yahuah-chooses-isaiah-58-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (f) 6:19-24 treasures members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 23:4-5 — *riches certainly make themselves wings; they fly away as an eagle* — earthly hoard that moth and rust corrupt.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-treasures-in-heaven-ye-cannot-serve-god-and-mammon-proverbs-23-sirach-29'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=23 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiastes 5:10 — *He that loveth silver shall not be satisfied with silver* — mammon never fills; ye cannot serve Elohim (God) and mammon.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-treasures-in-heaven-ye-cannot-serve-god-and-mammon-proverbs-23-sirach-29'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=5 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 3:10 — *prove me now herewith... if I will not open you the windows of heaven, and pour you out a blessing* — treasure laid up by open-handed trust.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-treasures-in-heaven-ye-cannot-serve-god-and-mammon-proverbs-23-sirach-29'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 29:11-12 — *Lay up your treasure according to the commandments of the Most High... Shut up alms in your storehouses* — alms is treasure stored where it cannot corrupt.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-treasures-in-heaven-ye-cannot-serve-god-and-mammon-proverbs-23-sirach-29'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=19
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=29 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (g) 6:25-34 take no thought members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 37:25 — *yet have I not seen the righteous forsaken, nor his seed begging bread* — the ground of the trust that takes no thought.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-take-no-thought-seek-first-the-kingdom-psalm-37-psalm-55-luke-12'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 55:22 — *Cast thy burden upon Yahuah (LORD), and he shall sustain thee* — the cure for anxious thought.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-take-no-thought-seek-first-the-kingdom-psalm-37-psalm-55-luke-12'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=55 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 104:14-15 — *He causeth the grass to grow... and bread which strengtheneth man''s heart* — the Father who feeds the fowls brings forth bread.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-take-no-thought-seek-first-the-kingdom-psalm-37-psalm-55-luke-12'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 6:8 — *Provideth her meat in the summer, and gathereth her food in the harvest* — take no thought is trust, not idleness.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-take-no-thought-seek-first-the-kingdom-psalm-37-psalm-55-luke-12'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Luke 12:22,24,31 — *Take no thought for your life... Consider the ravens... seek ye the kingdom of Elohim (God); and all these things shall be added* — the same teaching given again.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-take-no-thought-seek-first-the-kingdom-psalm-37-psalm-55-luke-12'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_matthew_07.sql (S260 Matthew depth) -----
-- Matthew 7 full-library cross-reference threads (NT DEPTH pass)
-- 8 threads, band 11180 step +3

-- ============================================================
-- 3a. Temp view
-- ============================================================
CREATE TEMP VIEW _mt07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================================================
-- 3b. cross_references rows
-- ============================================================
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- (a) 7:1-5 judge not / mote & beam
  ('canon','matthew',7,1,'canon','leviticus',19,15, 'free', E'*Ye shall do no unrighteousness in judgment... but in righteousness shalt thou judge thy neighbour* (Leviticus 19:15). The Torah never bans judging; it commands righteous judgment without respect of persons.'),
  ('canon','matthew',7,1,'canon','proverbs',24,23, 'free', E'*These things also belong to the wise. It is not good to have respect of persons in judgment* (Proverbs 24:23). The wisdom root of the same warning.'),
  ('canon','matthew',7,2,'canon','psalms',18,25, 'free', E'*With the merciful thou wilt shew thyself merciful; with an upright man thou wilt shew thyself upright* (Psalm 18:25). The measure ye mete is the measure measured back.'),
  ('canon','matthew',7,2,'canon','psalms',18,26, 'free', E'*With the pure thou wilt shew thyself pure; and with the froward thou wilt shew thyself froward* (Psalm 18:26). The mirror-law of judgment, spoken by David long before.'),
  ('canon','matthew',7,5,'canon','2-samuel',12,7, 'free', E'*And Nathan said to David, Thou art the man* (2 Samuel 12:7). David passed swift sentence on the rich man of the parable — and the beam was in his own eye.'),
  ('canon','matthew',7,1,'canon','leviticus',19,17, 'free', E'*Thou shalt not hate thy brother in thine heart: thou shalt in any wise rebuke thy neighbour, and not suffer sin upon him* (Leviticus 19:17). Rebuke is commanded; the beam must come out first.'),

  -- (b) 7:6 pearls before swine
  ('canon','matthew',7,6,'canon','proverbs',9,7, 'free', E'*He that reproveth a scorner getteth to himself shame: and he that rebuketh a wicked man getteth himself a blot* (Proverbs 9:7). The holy thing flung at the scorner turns to rending.'),
  ('canon','matthew',7,6,'canon','proverbs',9,8, 'free', E'*Reprove not a scorner, lest he hate thee: rebuke a wise man, and he will love thee* (Proverbs 9:8). Discern the hearer — give the wise man what the scorner will trample.'),
  ('canon','matthew',7,6,'canon','proverbs',23,9, 'free', E'*Speak not in the ears of a fool: for he will despise the wisdom of thy words* (Proverbs 23:9). The pearl is wasted on the despiser.'),

  -- (c) 7:7-11 ask seek knock / good gifts
  ('canon','matthew',7,7,'canon','jeremiah',29,13, 'free', E'*And ye shall seek me, and find me, when ye shall search for me with all your heart* (Jeremiah 29:13). The promise to the scattered exiles: seek and ye shall find.'),
  ('canon','matthew',7,7,'canon','jeremiah',29,12, 'free', E'*Then shall ye call upon me, and ye shall go and pray unto me, and I will hearken unto you* (Jeremiah 29:12). Ask, and it shall be given — the Father hearkens.'),
  ('canon','matthew',7,7,'canon','isaiah',55,6, 'free', E'*Seek ye Yahuah (LORD) while he may be found, call ye upon him while he is near* (Isaiah 55:6). The open door of Isaiah''s gospel call.'),
  ('canon','matthew',7,7,'canon','proverbs',8,17, 'free', E'*I love them that love me; and those that seek me early shall find me* (Proverbs 8:17). Wisdom''s own promise to the seeker.'),
  ('canon','matthew',7,11,'canon','psalms',34,10, 'free', E'*The young lions do lack, and suffer hunger: but they that seek Yahuah (LORD) shall not want any good thing* (Psalm 34:10). The Father gives good things to them that ask him.'),
  ('canon','matthew',7,7,'apocrypha','the-wisdom-of-solomon',6,12, 'extras', E'*Wisdom is glorious, and never fadeth away: yes, she is easily seen of them that love her, and found of such as seek her* (Wisdom of Solomon 6:12). Found of such as seek her — the very rhythm of ask-seek-knock.'),
  ('canon','matthew',7,7,'apocrypha','the-wisdom-of-solomon',6,14, 'extras', E'*Whoso seeks her early shall have no great travail: for he shall find her sitting at his doors* (Wisdom of Solomon 6:14). She is found waiting at the door for the one who knocks.'),

  -- (d) 7:12 the golden rule — law and prophets
  ('canon','matthew',7,12,'canon','leviticus',19,18, 'free', E'*Thou shalt not avenge, nor bear any grudge... but thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). The golden rule is Torah summed, not Torah replaced.'),
  ('canon','matthew',7,12,'canon','leviticus',19,34, 'free', E'*But the stranger that dwelleth with you shall be unto you as one born among you, and thou shalt love him as thyself* (Leviticus 19:34). The same love commanded toward the grafted-in stranger.'),
  ('canon','matthew',7,12,'apocrypha','tobit',4,15, 'extras', E'*Do that to no man which you hatest* (Tobit 4:15). The negative form of the golden rule, already in the mouth of righteous Tobit centuries before — the library is one.'),

  -- (e) 7:13-14 strait gate / two ways
  ('canon','matthew',7,13,'canon','deuteronomy',30,15, 'free', E'*See, I have set before thee this day life and good, and death and evil* (Deuteronomy 30:15). Moses set the Two Ways before Yashar''el (Israel) first.'),
  ('canon','matthew',7,13,'canon','deuteronomy',30,19, 'free', E'*I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). Choose life — the strait gate is the chosen way.'),
  ('canon','matthew',7,13,'canon','jeremiah',21,8, 'free', E'*Behold, I set before you the way of life, and the way of death* (Jeremiah 21:8). The prophet repeats Moses'' two ways.'),
  ('canon','matthew',7,14,'canon','psalms',1,6, 'free', E'*For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish* (Psalm 1:6). Two ways, two ends — the whole Psalter opens here.'),
  ('canon','matthew',7,13,'canon','proverbs',14,12, 'free', E'*There is a way which seemeth right unto a man, but the end thereof are the ways of death* (Proverbs 14:12). The broad way looks right and leadeth to destruction.'),
  ('canon','matthew',7,13,'apocrypha','ecclesiasticus',15,17, 'extras', E'*Before man is life and death; and whether him liketh shall be given him* (Sirach 15:17). Ben Sira sets the same choice before every man.'),

  -- (f) 7:15-20 false prophets / by their fruits
  ('canon','matthew',7,15,'canon','deuteronomy',13,3, 'free', E'*Thou shalt not hearken unto the words of that prophet... for Yahuah Elohaychem (the LORD your God) proveth you, to know whether ye love Yahuah Elohaychem with all your heart* (Deuteronomy 13:3). The Torah''s own test of the false prophet.'),
  ('canon','matthew',7,15,'canon','deuteronomy',13,5, 'free', E'*And that prophet... shall be put to death; because he hath spoken to turn you away from Yahuah Elohaychem (the LORD your God)* (Deuteronomy 13:5). The wolf in sheep''s clothing draws away from the commandment.'),
  ('canon','matthew',7,15,'canon','deuteronomy',18,22, 'free', E'*When a prophet speaketh in the name of Yahuah (LORD), if the thing follow not, nor come to pass... the prophet hath spoken it presumptuously* (Deuteronomy 18:22). The fruit-test of the word.'),
  ('canon','matthew',7,15,'canon','jeremiah',23,16, 'free', E'*Hearken not unto the words of the prophets that prophesy unto you: they make you vain: they speak a vision of their own heart* (Jeremiah 23:16). The false prophets of Jeremiah''s day, by their fruits known.'),
  ('canon','matthew',7,15,'canon','ezekiel',22,27, 'free', E'*Her princes in the midst thereof are like wolves ravening the prey, to shed blood, and to destroy souls, to get dishonest gain* (Ezekiel 22:27). The ravening wolves named by Ezekiel.'),
  ('canon','matthew',7,16,'canon','isaiah',5,7, 'free', E'*For the vineyard of Yahuah Tseva''ot (LORD of hosts) is the house of Yashar''el (Israel)... and he looked for judgment, but behold oppression* (Isaiah 5:7). The vineyard that brought forth wild grapes — known by its fruit.'),
  ('canon','matthew',7,16,'canon','luke',6,44, 'free', E'*For every tree is known by his own fruit. For of thorns men do not gather figs, nor of a bramble bush gather they grapes* (Luke 6:44). The same word in Luke''s plain.'),

  -- (g) 7:21-23 not every one that saith Lord Lord
  ('canon','matthew',7,23,'canon','psalms',6,8, 'free', E'*Depart from me, all ye workers of iniquity; for Yahuah (LORD) hath heard the voice of my weeping* (Psalm 6:8). The very sentence Yahusha (Jesus) pronounces — depart from me, ye that work iniquity.'),
  ('canon','matthew',7,21,'canon','hosea',8,2, 'free', E'*Yashar''el (Israel) shall cry unto me, My Elohim (God), we know thee* (Hosea 8:2). They cry Lord, Lord, and claim to know him.'),
  ('canon','matthew',7,21,'canon','hosea',8,3, 'free', E'*Yashar''el (Israel) hath cast off the thing that is good: the enemy shall pursue him* (Hosea 8:3). To cast off the good — the commandment — is to be unknown of him, though the mouth confess.'),

  -- (h) 7:24-27 wise & foolish builders / the rock
  ('canon','matthew',7,24,'canon','isaiah',28,16, 'free', E'*Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation: he that believeth shall not make haste* (Isaiah 28:16). The sure foundation on which the wise man builds.'),
  ('canon','matthew',7,24,'canon','proverbs',10,25, 'free', E'*As the whirlwind passeth, so is the wicked no more: but the righteous is an everlasting foundation* (Proverbs 10:25). The storm that sweeps the wicked cannot move the founded house.'),
  ('canon','matthew',7,26,'canon','ezekiel',13,11, 'free', E'*Say unto them which daub it with untempered morter, that it shall fall: there shall be an overflowing shower... and a stormy wind shall rend it* (Ezekiel 13:11). The untempered wall is the house on the sand.'),
  ('canon','matthew',7,26,'canon','ezekiel',13,14, 'free', E'*So will I break down the wall that ye have daubed with untempered morter... and it shall fall, and ye shall be consumed in the midst thereof* (Ezekiel 13:14). Great was the fall of it.'),
  ('canon','matthew',7,24,'canon','luke',6,48, 'free', E'*He is like a man which built an house, and digged deep, and laid the foundation on a rock: and when the flood arose, the stream beat vehemently upon that house, and could not shake it* (Luke 6:48). The same parable in Luke''s telling.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _mt07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _mt07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================================================
-- 3c. threads
-- ============================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-7-judge-not-the-mote-and-the-beam-leviticus-19-proverbs-24',
       E'Judge not, that ye be not judged — the mote and the beam (Leviticus 19; Proverbs 24; 2 Samuel 12)',
       E'*Judge not, that ye be not judged* (Matthew 7:1) is no ban on discernment — Yahusha (Jesus) is forbidding the hypocrite''s crooked scale, not the righteous eye. The Torah commands judgment: *Ye shall do no unrighteousness in judgment: thou shalt not respect the person of the poor, nor honour the person of the mighty: but in righteousness shalt thou judge thy neighbour* (Leviticus 19:15), and the wise echo it — *It is not good to have respect of persons in judgment* (Proverbs 24:23). The measure is a mirror: *With the merciful thou wilt shew thyself merciful; with an upright man thou wilt shew thyself upright* (Psalm 18:25); *With the pure thou wilt shew thyself pure; and with the froward thou wilt shew thyself froward* (Psalm 18:26) — *with what measure ye mete, it shall be measured to you again* (Matthew 7:2). And the great living parable of the beam: David thundered sentence on the rich man, *the man that hath done this thing shall surely die* — and Nathan answered, *Thou art the man* (2 Samuel 12:7). First cast out thine own beam. Even then the brother is not abandoned: *thou shalt in any wise rebuke thy neighbour, and not suffer sin upon him* (Leviticus 19:17). The commandment stands; only the hypocrisy is cast out.',
       sv.verse_id, ev.verse_id, 'free', 11180
  FROM _mt07_lookup sv, _mt07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=7 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-7-give-not-that-which-is-holy-unto-the-dogs-pearls-before-swine-proverbs-9-23',
       E'Give not that which is holy unto the dogs — pearls before swine (Proverbs 9; Proverbs 23)',
       E'*Give not that which is holy unto the dogs, neither cast ye your pearls before swine, lest they trample them under their feet, and turn again and rend you* (Matthew 7:6). This is the wisdom of discernment — the same lesson the Proverbs press hard. *He that reproveth a scorner getteth to himself shame: and he that rebuketh a wicked man getteth himself a blot* (Proverbs 9:7); *Reprove not a scorner, lest he hate thee: rebuke a wise man, and he will love thee* (Proverbs 9:8). Know the hearer before you spend the holy thing on him. And again: *Speak not in the ears of a fool: for he will despise the wisdom of thy words* (Proverbs 23:9). The pearl is precious; do not waste it on the one who will only trample and rend. Yahusha (Jesus) is teaching the same shepherd-prudence the wisdom books taught Yashar''el (Israel) long before.',
       sv.verse_id, sv.verse_id, 'free', 11183
  FROM _mt07_lookup sv
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-7-ask-seek-knock-good-gifts-jeremiah-29-isaiah-55-wisdom-6',
       E'Ask, and it shall be given — seek and find, knock and it shall be opened (Jeremiah 29; Isaiah 55; Wisdom 6)',
       E'*Ask, and it shall be given you; seek, and ye shall find; knock, and it shall be opened unto you* (Matthew 7:7) — this is not new; it is the ancient promise to a seeking people. To the exiles Yahuah (Yahuah) said, *Then shall ye call upon me, and ye shall go and pray unto me, and I will hearken unto you* (Jeremiah 29:12), *And ye shall seek me, and find me, when ye shall search for me with all your heart* (Jeremiah 29:13). The prophet''s open door: *Seek ye Yahuah (LORD) while he may be found, call ye upon him while he is near* (Isaiah 55:6). Wisdom''s own pledge: *I love them that love me; and those that seek me early shall find me* (Proverbs 8:17). The Father withholds no good thing from the seeker: *they that seek Yahuah (LORD) shall not want any good thing* (Psalm 34:10) — *how much more shall your Father which is in heaven give good things to them that ask him* (Matthew 7:11). The Wisdom of Solomon sings the same: *she is easily seen of them that love her, and found of such as seek her* (Wisdom of Solomon 6:12); *Whoso seeks her early shall have no great travail: for he shall find her sitting at his doors* (Wisdom of Solomon 6:14) — found waiting at the door for the one who knocks. The Formed Son teaches us to address THE FATHER, who is the giver of every good gift.',
       sv.verse_id, ev.verse_id, 'extras', 11186
  FROM _mt07_lookup sv, _mt07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=7 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-7-the-golden-rule-this-is-the-law-and-the-prophets-leviticus-19-tobit-4',
       E'The golden rule — for this is the law and the prophets (Leviticus 19; Tobit 4)',
       E'*Therefore all things whatsoever ye would that men should do to you, do ye even so to them: for this is the law and the prophets* (Matthew 7:12). Hear the seal he sets on it — *this IS the law and the prophets.* Yahusha (Jesus) does not abolish the Torah here; he SUMS it. The golden rule is the heart-distillation of the commandment given through Moses: *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18), a love that reaches the grafted-in stranger too — *the stranger that dwelleth with you shall be unto you as one born among you, and thou shalt love him as thyself* (Leviticus 19:34). And the witness of the library reaches back further still: righteous Tobit charged his son, *Do that to no man which you hatest* (Tobit 4:15) — the negative form of the very same rule, generations before the Sermon on the Mount. One law, one love, one library. Messiah is its summing-up, never its end.',
       sv.verse_id, sv.verse_id, 'extras', 11189
  FROM _mt07_lookup sv
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-7-the-strait-gate-the-two-ways-deuteronomy-30-jeremiah-21-psalm-1',
       E'Enter ye in at the strait gate — the Two Ways (Deuteronomy 30; Jeremiah 21; Psalm 1; Sirach 15)',
       E'*Enter ye in at the strait gate... strait is the gate, and narrow is the way, which leadeth unto life, and few there be that find it* (Matthew 7:13-14). This is the oldest sermon in Yashar''el (Israel) — the Two Ways. Moses set it before the people on the plains of Moab: *See, I have set before thee this day life and good, and death and evil* (Deuteronomy 30:15), *I have set before you life and death, blessing and cursing: therefore choose life, that both thou and thy seed may live* (Deuteronomy 30:19). The prophet says it plain: *Behold, I set before you the way of life, and the way of death* (Jeremiah 21:8). The Psalter opens on it: *For Yahuah (LORD) knoweth the way of the righteous: but the way of the ungodly shall perish* (Psalm 1:6). And the warning against the broad way that only seems right: *There is a way which seemeth right unto a man, but the end thereof are the ways of death* (Proverbs 14:12). Ben Sira sets the same choice before every soul: *Before man is life and death; and whether him liketh shall be given him* (Sirach 15:17). The strait gate is the chosen way of the commandment; the broad way is the way of him who casts it off.',
       sv.verse_id, ev.verse_id, 'extras', 11192
  FROM _mt07_lookup sv, _mt07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=7 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-7-beware-of-false-prophets-by-their-fruits-deuteronomy-13-jeremiah-23-isaiah-5',
       E'Beware of false prophets — by their fruits ye shall know them (Deuteronomy 13 & 18; Jeremiah 23; Ezekiel 22; Isaiah 5)',
       E'*Beware of false prophets, which come to you in sheep''s clothing, but inwardly they are ravening wolves. Ye shall know them by their fruits* (Matthew 7:15-16). The Torah armed Yashar''el (Israel) with this test long ago. The fruit-test of the heart: the lying prophet may even give a sign, *Thou shalt not hearken unto the words of that prophet... for Yahuah Elohaychem (the LORD your God) proveth you, to know whether ye love Yahuah Elohaychem with all your heart* (Deuteronomy 13:3); for *he hath spoken to turn you away from Yahuah Elohaychem (the LORD your God)* (Deuteronomy 13:5) — the wolf draws you off the commandment. And the fruit-test of the word: *if the thing follow not, nor come to pass... the prophet hath spoken it presumptuously* (Deuteronomy 18:22). The prophets named the same wolves: *they speak a vision of their own heart, and not out of the mouth of Yahuah (LORD)* (Jeremiah 23:16); *Her princes in the midst thereof are like wolves ravening the prey... to get dishonest gain* (Ezekiel 22:27). And the vineyard that bore wild grapes is Yashar''el judged by her fruit: *the vineyard of Yahuah Tseva''ot (LORD of hosts) is the house of Yashar''el (Israel)... and he looked for judgment, but behold oppression* (Isaiah 5:7). Yahusha (Jesus) gathers it all and says it twice over in Luke''s plain: *every tree is known by his own fruit. For of thorns men do not gather figs, nor of a bramble bush gather they grapes* (Luke 6:44).',
       sv.verse_id, ev.verse_id, 'free', 11195
  FROM _mt07_lookup sv, _mt07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=7 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-7-not-every-one-that-saith-lord-lord-but-he-that-doeth-the-will-psalm-6-hosea-8',
       E'Not every one that saith Lord, Lord — but he that DOETH the will (Psalm 6; Hosea 8)',
       E'*Not every one that saith unto me, Yahuah (Lord), Yahuah (Lord), shall enter into the kingdom of heaven; but he that doeth the will of my Father which is in heaven* (Matthew 7:21). Here is the anti-antinomian seal of the whole Sermon: the confession of the lips is not the entrance — DOING the Father''s will is, and the Father''s will is his commandment. And mark the sentence Yahusha (Jesus) pronounces on the workers of lawlessness, *depart from me, ye that work iniquity* (Matthew 7:23) — it is David''s own word, *Depart from me, all ye workers of iniquity; for Yahuah (LORD) hath heard the voice of my weeping* (Psalm 6:8). Hosea showed the same hollow cry centuries before: *Yashar''el (Israel) shall cry unto me, My Elohim (God), we know thee* (Hosea 8:2) — yet *Yashar''el (Israel) hath cast off the thing that is good: the enemy shall pursue him* (Hosea 8:3). To cry "we know thee" while casting off the good — the Torah — is to be answered, *I never knew you.* The doing is the knowing.',
       sv.verse_id, ev.verse_id, 'free', 11198
  FROM _mt07_lookup sv, _mt07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=7 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-7-the-wise-and-foolish-builders-the-rock-isaiah-28-proverbs-10-ezekiel-13',
       E'The wise and foolish builders — built upon a rock (Isaiah 28; Proverbs 10; Ezekiel 13; Luke 6)',
       E'*Whosoever heareth these sayings of mine, and doeth them, I will liken him unto a wise man, which built his house upon a rock* (Matthew 7:24) — and the doer''s house *fell not: for it was founded upon a rock* (Matthew 7:25), while the house upon the sand fell, *and great was the fall of it* (Matthew 7:27). The sure foundation was laid in Zion long before: *Behold, I lay in Zion for a foundation a stone, a tried stone, a precious corner stone, a sure foundation: he that believeth shall not make haste* (Isaiah 28:16). The wisdom root: *As the whirlwind passeth, so is the wicked no more: but the righteous is an everlasting foundation* (Proverbs 10:25). And the house on the sand is Ezekiel''s untempered wall — they built and *daubed it with untempered morter*, but *there shall be an overflowing shower... and a stormy wind shall rend it* (Ezekiel 13:11); *So will I break down the wall that ye have daubed... and it shall fall, and ye shall be consumed in the midst thereof* (Ezekiel 13:14). Hearing without doing is daubing with untempered morter; the rock is the heard word DONE. Luke tells the same: *He is like a man which built an house, and digged deep, and laid the foundation on a rock... and could not shake it* (Luke 6:48).',
       sv.verse_id, ev.verse_id, 'free', 11201
  FROM _mt07_lookup sv, _mt07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=24
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=7 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- ============================================================
-- 3d. thread_members
-- ============================================================
-- (a) judge not
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:15 — *but in righteousness shalt thou judge thy neighbour.* Torah commands righteous judgment.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-judge-not-the-mote-and-the-beam-leviticus-19-proverbs-24'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 24:23 — *It is not good to have respect of persons in judgment.*'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-judge-not-the-mote-and-the-beam-leviticus-19-proverbs-24'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=24 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 18:25 — *with an upright man thou wilt shew thyself upright* — the measure is a mirror.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-judge-not-the-mote-and-the-beam-leviticus-19-proverbs-24'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 18:26 — *with the froward thou wilt shew thyself froward* — as ye mete, so measured back.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-judge-not-the-mote-and-the-beam-leviticus-19-proverbs-24'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Samuel 12:7 — *Thou art the man.* David judged the parable and the beam was his own.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-judge-not-the-mote-and-the-beam-leviticus-19-proverbs-24'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='2-samuel' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Leviticus 19:17 — *thou shalt in any wise rebuke thy neighbour* — rebuke commanded once the beam is out.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-judge-not-the-mote-and-the-beam-leviticus-19-proverbs-24'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (b) pearls before swine
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 9:7 — *he that rebuketh a wicked man getteth himself a blot.*'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-give-not-that-which-is-holy-unto-the-dogs-pearls-before-swine-proverbs-9-23'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=9 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 9:8 — *Reprove not a scorner, lest he hate thee.* Discern the hearer.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-give-not-that-which-is-holy-unto-the-dogs-pearls-before-swine-proverbs-9-23'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=9 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 23:9 — *Speak not in the ears of a fool: for he will despise the wisdom of thy words.*'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-give-not-that-which-is-holy-unto-the-dogs-pearls-before-swine-proverbs-9-23'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=23 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (c) ask seek knock
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 29:13 — *ye shall seek me, and find me, when ye shall search for me with all your heart.*'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-ask-seek-knock-good-gifts-jeremiah-29-isaiah-55-wisdom-6'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=29 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 29:12 — *ye shall... pray unto me, and I will hearken unto you.* Ask, and it is given.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-ask-seek-knock-good-gifts-jeremiah-29-isaiah-55-wisdom-6'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=29 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 55:6 — *Seek ye Yahuah (LORD) while he may be found.* The open door.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-ask-seek-knock-good-gifts-jeremiah-29-isaiah-55-wisdom-6'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 8:17 — *those that seek me early shall find me.* Wisdom''s pledge to the seeker.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-ask-seek-knock-good-gifts-jeremiah-29-isaiah-55-wisdom-6'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 34:10 — *they that seek Yahuah (LORD) shall not want any good thing.* The Father gives good gifts.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-ask-seek-knock-good-gifts-jeremiah-29-isaiah-55-wisdom-6'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Wisdom of Solomon 6:12 — *found of such as seek her.* The rhythm of ask-seek-knock.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-ask-seek-knock-good-gifts-jeremiah-29-isaiah-55-wisdom-6'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=6 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Wisdom of Solomon 6:14 — *he shall find her sitting at his doors* — found waiting for the one who knocks.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-ask-seek-knock-good-gifts-jeremiah-29-isaiah-55-wisdom-6'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=6 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (d) golden rule
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:18 — *thou shalt love thy neighbour as thyself.* The golden rule is Torah summed.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-the-golden-rule-this-is-the-law-and-the-prophets-leviticus-19-tobit-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 19:34 — *thou shalt love him as thyself* — the same love toward the grafted-in stranger.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-the-golden-rule-this-is-the-law-and-the-prophets-leviticus-19-tobit-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Tobit 4:15 — *Do that to no man which you hatest* — the negative golden rule, generations before.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-the-golden-rule-this-is-the-law-and-the-prophets-leviticus-19-tobit-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (e) two ways
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 30:15 — *I have set before thee this day life and good, and death and evil.*'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-the-strait-gate-the-two-ways-deuteronomy-30-jeremiah-21-psalm-1'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 30:19 — *therefore choose life* — the strait gate is the chosen way.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-the-strait-gate-the-two-ways-deuteronomy-30-jeremiah-21-psalm-1'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 21:8 — *Behold, I set before you the way of life, and the way of death.*'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-the-strait-gate-the-two-ways-deuteronomy-30-jeremiah-21-psalm-1'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=21 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 1:6 — *the way of the righteous... the way of the ungodly shall perish.* Two ways, two ends.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-the-strait-gate-the-two-ways-deuteronomy-30-jeremiah-21-psalm-1'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Proverbs 14:12 — *a way which seemeth right... but the end thereof are the ways of death.* The broad way.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-the-strait-gate-the-two-ways-deuteronomy-30-jeremiah-21-psalm-1'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=14 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Sirach 15:17 — *Before man is life and death.* Ben Sira sets the same choice before every man.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-the-strait-gate-the-two-ways-deuteronomy-30-jeremiah-21-psalm-1'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=15 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (f) false prophets
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 13:3 — *the LORD your God proveth you, to know whether ye love* him. The heart-test.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-beware-of-false-prophets-by-their-fruits-deuteronomy-13-jeremiah-23-isaiah-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=13 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 13:5 — *he hath spoken to turn you away* from Yahuah. The wolf draws off the commandment.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-beware-of-false-prophets-by-their-fruits-deuteronomy-13-jeremiah-23-isaiah-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=13 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 18:22 — *if the thing follow not... the prophet hath spoken it presumptuously.* The fruit-test.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-beware-of-false-prophets-by-their-fruits-deuteronomy-13-jeremiah-23-isaiah-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 23:16 — *they speak a vision of their own heart, and not out of the mouth of Yahuah (LORD).*'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-beware-of-false-prophets-by-their-fruits-deuteronomy-13-jeremiah-23-isaiah-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ezekiel 22:27 — *Her princes... are like wolves ravening the prey.* The ravening wolves named.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-beware-of-false-prophets-by-their-fruits-deuteronomy-13-jeremiah-23-isaiah-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=22 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Isaiah 5:7 — the vineyard of Yashar''el (Israel) that brought forth wild grapes, known by its fruit.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-beware-of-false-prophets-by-their-fruits-deuteronomy-13-jeremiah-23-isaiah-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Luke 6:44 — *every tree is known by his own fruit.* The same word in Luke''s plain.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-beware-of-false-prophets-by-their-fruits-deuteronomy-13-jeremiah-23-isaiah-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=6 AND tv.verse_number=44
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (g) Lord Lord
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 6:8 — *Depart from me, all ye workers of iniquity.* The very sentence Yahusha pronounces.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-not-every-one-that-saith-lord-lord-but-he-that-doeth-the-will-psalm-6-hosea-8'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hosea 8:2 — *Yashar''el (Israel) shall cry unto me, My Elohim (God), we know thee.* The hollow confession.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-not-every-one-that-saith-lord-lord-but-he-that-doeth-the-will-psalm-6-hosea-8'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hosea 8:3 — *Yashar''el (Israel) hath cast off the thing that is good* — to cast off the Torah is to be unknown of him.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-not-every-one-that-saith-lord-lord-but-he-that-doeth-the-will-psalm-6-hosea-8'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (h) builders
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 28:16 — *a tried stone, a precious corner stone, a sure foundation.* The rock for the wise builder.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-the-wise-and-foolish-builders-the-rock-isaiah-28-proverbs-10-ezekiel-13'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=28 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 10:25 — *the righteous is an everlasting foundation.* The storm cannot move the founded house.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-the-wise-and-foolish-builders-the-rock-isaiah-28-proverbs-10-ezekiel-13'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=10 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 13:11 — the untempered wall: *a stormy wind shall rend it.* The house on the sand.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-the-wise-and-foolish-builders-the-rock-isaiah-28-proverbs-10-ezekiel-13'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=13 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 13:14 — *it shall fall, and ye shall be consumed in the midst thereof.* Great was the fall of it.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-the-wise-and-foolish-builders-the-rock-isaiah-28-proverbs-10-ezekiel-13'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=13 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Luke 6:48 — *laid the foundation on a rock... could not shake it.* The same parable in Luke.'
  FROM cross_reference_threads t, cross_references x, _mt07_lookup sv, _mt07_lookup tv
 WHERE t.slug='matthew-7-the-wise-and-foolish-builders-the-rock-isaiah-28-proverbs-10-ezekiel-13'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=7 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=6 AND tv.verse_number=48
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session260 — Matthew (depth) cross-references complete.'
