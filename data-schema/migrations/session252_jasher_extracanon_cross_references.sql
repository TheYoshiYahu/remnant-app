-- =====================================================================
-- Session 252 — Jasher FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session252_jasher_extracanon_cross_references.sql
-- =====================================================================

\echo 'session252 — Jasher cross-references starting...'
BEGIN;

-- ----- fragment: minion_jasher_01.sql (session252 jasher 1) -----
-- Source anchor: jasher/jasher ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja01 (view _session252_ja01_lookup). Sort band base 55000, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-1-man-and-the-woman-formed
  ('jasher', 'jasher', 1, 1, 'canon', 'genesis', 1, 26, 'free', E'Genesis 1:26 — *And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth, and over every creeping thing that creepeth upon the earth.* Jasher 1:1 quotes the canon''s own "let us make man" word-for-word as the head of its retelling.'),
  ('jasher', 'jasher', 1, 2, 'canon', 'genesis', 2, 7, 'free', E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* Jasher 1:2''s forming from the ground and breath into the nostrils is Genesis 2:7, adding only that the soul was "endowed with speech."'),
  ('jasher', 'jasher', 1, 4, 'canon', 'genesis', 2, 22, 'free', E'Genesis 2:22 — *And the rib, which Yahuah Elohim (the LORD God) had taken from man, made he a woman, and brought her unto the man.* Jasher 1:4''s deep sleep, the taken rib, the flesh built upon it, and the woman brought to Adam follow Genesis rib for rib.'),
  ('jasher', 'jasher', 1, 4, 'jubilees', 'jubilees', 3, 5, 'extras', E'Jubilees 3:5 — *And Yahuah our Elohim (the LORD our God) caused a deep sleep to fall upon him, and he slept, and He took for the woman one rib from amongst his ribs, and this rib was the origin of the woman from amongst his ribs, and He built up the flesh in its stead, and built the woman.* Jubilees narrates the same forming of the woman as Jasher 1:4 — the now-live witness beside it.'),
  ('jasher', 'jasher', 1, 6, 'canon', 'matthew', 19, 4, 'free', E'Matthew 19:4 — *And he answered and said unto them, Have ye not read, that he which made them at the beginning made them male and female,* Messiah reads the same beginning Jasher 1:6 records — created male and female, blessed to be fruitful and multiply.'),
  -- thread: jasher-1-garden-command-and-the-fall
  ('jasher', 'jasher', 1, 7, 'canon', 'genesis', 2, 15, 'free', E'Genesis 2:15 — *And Yahuah Elohim (the LORD God) took the man, and put him into the garden of Eden to dress it and to keep it.* Jasher 1:7 places Adam and his wife in Eden "to dress it and to keep it" in the canon''s own words.'),
  ('jasher', 'jasher', 1, 7, 'canon', 'genesis', 2, 17, 'free', E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* The single prohibition Jasher 1:7 records — eat of every tree but this one — is Genesis 2:17 carried verbatim.'),
  ('jasher', 'jasher', 1, 9, 'canon', 'genesis', 3, 1, 'free', E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* Jasher 1:9''s serpent who came "to incite them to transgress" is the subtil serpent of Genesis 3:1.'),
  ('jasher', 'jasher', 1, 10, 'canon', 'genesis', 3, 6, 'free', E'Genesis 3:6 — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* Jasher 1:10 — the woman hearkening, taking, eating, and giving to her husband — is Genesis 3:6.'),
  ('jasher', 'jasher', 1, 10, 'apocrypha', 'the-wisdom-of-solomon', 2, 24, 'extras', E'Wisdom of Solomon 2:24 — *Nevertheless through envy of the devil came death into the world: and they that do hold of his side do find it.* Wisdom names the envy of the devil behind the serpent''s enticement that Jasher 1:10 recounts.'),
  -- thread: jasher-1-expelled-and-the-seed-begun
  ('jasher', 'jasher', 1, 12, 'canon', 'genesis', 3, 23, 'free', E'Genesis 3:23 — *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* Jasher 1:12 drives them out "to till the ground from which they were taken" — Genesis 3:23 word for word.'),
  ('jasher', 'jasher', 1, 12, 'canon', 'genesis', 3, 24, 'free', E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* Jasher 1:12''s dwelling "at the east of the garden of Eden" is the very ground east of the cherubim-guarded gate of Genesis 3:24.'),
  ('jasher', 'jasher', 1, 5, 'canon', 'genesis', 3, 20, 'free', E'Genesis 3:20 — *And Adam called his wife''s name Eve; because she was the mother of all living.* Jasher 1:5 names her Eve "for she was the mother of all living" — the canon''s own etymology of the matriarch through whom the seed comes.'),
  ('jasher', 'jasher', 1, 13, 'canon', 'genesis', 4, 1, 'free', E'Genesis 4:1 — *And Adam knew Eve his wife; and she conceived, and bare Cain, and said, I have gotten a man from Yahuah (LORD).* Jasher 1:13''s "I have obtained a man from Yahuah" at Cain''s naming is Eve''s word in Genesis 4:1 — the first link of the seed-line.'),
  ('jasher', 'jasher', 1, 13, 'jubilees', 'jubilees', 4, 1, 'extras', E'Jubilees 4:1 — *And in the third week in the second jubilee she gave birth to Cain, and in the fourth she gave birth to Abel, and in the fifth she gave birth to her daughter ''Âwân.* Jubilees records the same first births Jasher 1:13 names — the now-live patriarchal witness, dated in jubilees.'),
  -- thread: jasher-1-cain-and-abel-offerings
  ('jasher', 'jasher', 1, 14, 'canon', 'genesis', 4, 2, 'free', E'Genesis 4:2 — *And she again bare his brother Abel. And Abel was a keeper of sheep, but Cain was a tiller of the ground.* Jasher 1:14 gives the brothers their identical callings — Cain a tiller of the ground, Abel a keeper of sheep.'),
  ('jasher', 'jasher', 1, 15, 'canon', 'genesis', 4, 4, 'free', E'Genesis 4:4 — *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering:* Jasher 1:15''s firstlings "from the fat of it" and Yahuah''s inclining to Abel is Genesis 4:4, with the added sign of heaven''s consuming fire.'),
  ('jasher', 'jasher', 1, 16, 'canon', 'genesis', 4, 5, 'free', E'Genesis 4:5 — *But unto Cain and to his offering he had not respect. And Cain was very wroth, and his countenance fell.* Jasher 1:16''s Cain, whose offering was not turned to and who grew jealous "and sought a pretext to slay him," is the wroth Cain of Genesis 4:5.'),
  ('jasher', 'jasher', 1, 15, 'canon', 'hebrews', 11, 4, 'free', E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* The heaven-consumed gift of Jasher 1:15 is the more excellent sacrifice Hebrews calls faith and righteousness.'),
  ('jasher', 'jasher', 1, 16, 'jubilees', 'jubilees', 4, 2, 'extras', E'Jubilees 4:2 — *And in the first (year) of the third jubilee, Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain.* Jubilees names the rejected offering of Jasher 1:16 as the very cause of the murder to come — the now-live witness beside it.'),
  -- thread: jasher-1-murder-of-abel
  ('jasher', 'jasher', 1, 25, 'canon', 'genesis', 4, 8, 'free', E'Genesis 4:8 — *And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him.* Jasher 1:25''s Cain who "rose up" in the field and slew his brother is Genesis 4:8, named down to the instrument.'),
  ('jasher', 'jasher', 1, 22, 'canon', '1-john', 3, 12, 'free', E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Abel''s plea to the Judge in Jasher 1:22 — the wicked requited for his evil, the righteous vindicated — is John''s reading of the first murder as the two lines, evil works against righteous.'),
  ('jasher', 'jasher', 1, 25, 'apocrypha', 'the-wisdom-of-solomon', 10, 3, 'extras', E'Wisdom of Solomon 10:3 — *But when the unrighteous went away from her in his anger, he perished also in the fury with which he murdered his brother.* Wisdom names the same fratricidal fury that Jasher 1:25 recounts in the slaying of Abel.'),
  ('jasher', 'jasher', 1, 25, 'jubilees', 'jubilees', 4, 3, 'extras', E'Jubilees 4:3 — *And he slew him in the field: and his blood cried from the ground to heaven, complaining because he had slain him.* Jubilees tells the same field-murder of Jasher 1:25, with Abel''s blood crying from the ground — the now-live patriarchal witness.'),
  -- thread: jasher-1-curse-and-the-wandering
  ('jasher', 'jasher', 1, 29, 'canon', 'genesis', 4, 9, 'free', E'Genesis 4:9 — *And Yahuah (LORD) said unto Cain, Where is Abel thy brother? And he said, I know not: Am I my brother''s keeper?* Jasher 1:29''s dissembling "am I my brother''s keeper?" is Cain''s word in Genesis 4:9.'),
  ('jasher', 'jasher', 1, 31, 'canon', 'genesis', 4, 11, 'free', E'Genesis 4:11 — *And now art thou cursed from the earth, which hath opened her mouth to receive thy brother''s blood from thy hand;* Jasher 1:31''s curse from the ground "which opened its mouth to receive your brother''s blood" is Genesis 4:11 word for word.'),
  ('jasher', 'jasher', 1, 32, 'canon', 'genesis', 4, 12, 'free', E'Genesis 4:12 — *When thou tillest the ground, it shall not henceforth yield unto thee her strength; a fugitive and a vagabond shalt thou be in the earth.* Jasher 1:32 — the ground withholding its strength and the moving-and-wandering sentence — is Genesis 4:12.'),
  ('jasher', 'jasher', 1, 33, 'canon', 'genesis', 4, 16, 'free', E'Genesis 4:16 — *And Cain went out from the presence of Yahuah (LORD), and dwelt in the land of Nod, on the east of Eden.* Jasher 1:33''s Cain going out "from the presence of Yahuah... toward the east of Eden" is the land of Nod east of Eden in Genesis 4:16.'),
  ('jasher', 'jasher', 1, 31, 'jubilees', 'jubilees', 4, 4, 'extras', E'Jubilees 4:4 — *And Yahuah (God) reproved Cain because of Abel, because he had slain him, and he made him a fugitive on the earth because of the blood of his brother, and he cursed him upon the earth...* Jubilees gives the same curse and fugitive-sentence Jasher 1:31 records — the now-live witness, adding the heavenly-tables verdict on treacherous murder.'),
  -- thread: jasher-1-cain-line-and-the-city
  ('jasher', 'jasher', 1, 34, 'canon', 'genesis', 4, 17, 'free', E'Genesis 4:17 — *And Cain knew his wife; and she conceived, and bare Enoch: and he builded a city, and called the name of the city, after the name of his son, Enoch.* Jasher 1:34-35''s birth of Enoch and the city named for him is Genesis 4:17 — the first city, the kingdom-of-man pattern begun east of Eden.'),
  ('jasher', 'jasher', 1, 36, 'canon', 'genesis', 4, 18, 'free', E'Genesis 4:18 — *And unto Enoch was born Irad: and Irad begat Mehujael: and Mehujael begat Methusael: and Methusael begat Lamech.* Jasher 1:36''s Irad–Mechuyael–Methusael genealogy traces Cain''s line exactly as Genesis 4:18 does.'),
  ('jasher', 'jasher', 1, 35, 'jubilees', 'jubilees', 4, 31, 'extras', E'Jubilees 4:31 — *At the close of this jubilee Cain was killed after him in the same year; for his house fell upon him and he died in the midst of his house, and he was killed by its stones, for with a stone he had killed Abel, and by a stone was he killed in righteous judgment.* Jubilees follows the same Cain whose city Jasher 1:35 builds to his stone-struck end in righteous judgment — the now-live witness.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-1-man-and-the-woman-formed',
       E'Let us make man — Adam and Eve formed',
       E'Jasher opens on the sixth day in the very words of the canon: *And Elohim (God) said, Let us make man in our image, after our likeness, and Elohim created man in his own image.* (Jasher 1:1) — *And Elohim formed man from the ground, and he blew into his nostrils the breath of life, and man became a living soul endowed with speech.* (Jasher 1:2). This is Genesis carried, not invented. *And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth, and over every creeping thing that creepeth upon the earth.* (Genesis 1:26); *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* (Genesis 2:7). The making of the woman matches the canon rib for rib: *And the rib, which Yahuah Elohim (the LORD God) had taken from man, made he a woman, and brought her unto the man.* (Genesis 2:22). Jubilees tells the same scene the same way — *And Yahuah our Elohim (the LORD our God) caused a deep sleep to fall upon him, and he slept, and He took for the woman one rib from amongst his ribs... and built the woman.* (Jubilees 3:5) — and Messiah Himself reads this beginning forward into marriage: *And he answered and said unto them, Have ye not read, that he which made them at the beginning made them male and female,* (Matthew 19:4). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55000
  FROM _session252_ja01_lookup sv, _session252_ja01_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=1 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-1-garden-command-and-the-fall',
       E'The garden, the command, and the fall',
       E'Jasher sets Adam and his wife in Eden under the one command exactly as the canon does: *And Yahuah Elohim took Adam and his wife, and he placed them in the garden of Eden to dress it and to keep it; and he commanded them and said to them, From every tree of the garden you may eat, but from the tree of the knowledge of good and evil you shall not eat, for in the day that you eat of it you shall surely die.* (Jasher 1:7). That is Genesis: *And Yahuah Elohim (the LORD God) took the man, and put him into the garden of Eden to dress it and to keep it.* (Genesis 2:15); *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* (Genesis 2:17). The serpent''s enticement and the woman''s taking match Genesis 3 — *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made...* (Genesis 3:1); *And when the woman saw that the tree was good for food... she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* (Genesis 3:6). The apocryphal witness names the deceiver behind the serpent: *Nevertheless through envy of the devil came death into the world: and they that do hold of his side do find it.* (Wisdom of Solomon 2:24). The fall is the canon''s fall — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55003
  FROM _session252_ja01_lookup sv, _session252_ja01_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=7
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=1 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-1-expelled-and-the-seed-begun',
       E'Driven from Eden — the seed-line begun',
       E'Jasher''s expulsion and the first birth follow the canon''s hinge: *And Yahuah Elohim drove them that day from the garden of Eden, to till the ground from which they were taken, and they went and dwelt at the east of the garden of Eden; and Adam knew his wife Eve and she bore two sons and three daughters.* (Jasher 1:12). Genesis tells the same driving-out: *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* (Genesis 3:23); *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* (Genesis 3:24). The naming of Eve and the first births open the chosen seed-line — *And Adam called his wife''s name Eve; because she was the mother of all living.* (Genesis 3:20); *And Adam knew Eve his wife; and she conceived, and bare Cain... And she again bare his brother Abel...* (Genesis 4:1-2). Election precedes confession: the line of Adam is begun here that will run through Seth to Noah to Shem. Jubilees dates the same births in its jubilee-reckoning — *And in the third week in the second jubilee she gave birth to Cain, and in the fourth she gave birth to Abel...* (Jubilees 4:1).',
       sv.verse_id, ev.verse_id, 'extras', 55006
  FROM _session252_ja01_lookup sv, _session252_ja01_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=12
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=1 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-1-cain-and-abel-offerings',
       E'The two offerings — Abel''s accepted, Cain''s refused',
       E'Jasher gives the two brothers their callings and their offerings as Genesis does: *And the boys grew up and their father gave them a possession in the land; and Cain was a tiller of the ground, and Abel a keeper of sheep.* (Jasher 1:14) — *and Cain brought from the fruit of the ground, and Abel brought from the firstlings of his flock from the fat of it, and Elohim turned and inclined to Abel and his offering, and a fire came down from Yahuah (the Lord) from heaven and consumed it.* (Jasher 1:15). This is the canon: *And Abel was a keeper of sheep, but Cain was a tiller of the ground.* (Genesis 4:2); *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering:* (Genesis 4:4). Jasher''s added detail — fire from heaven consuming the accepted gift — names the sign of a respected sacrifice; the seed-war of the two lines is already drawn at the altar. Hebrews reads Abel''s gift as faith: *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous...* (Hebrews 11:4); and Jubilees fixes the same cause of the coming murder — *Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain.* (Jubilees 4:2). The fathers sacrificed before Sinai — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55009
  FROM _session252_ja01_lookup sv, _session252_ja01_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=14
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=1 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-1-murder-of-abel',
       E'Cain rose up and slew his brother',
       E'Jasher expands the field-quarrel and then strikes the canon''s blow: *And Cain hastened and rose up, and took the iron part of his ploughing instrument, with which he suddenly smote his brother and he slew him, and Cain spilt the blood of his brother Abel upon the earth...* (Jasher 1:25). Genesis tells it bare: *And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him.* (Genesis 4:8). Abel had appealed to the Judge — *Surely Elohim who has made us in the earth, he will avenge my cause, and he will require my blood from you should you slay me, for Yahuah (the Lord) is the judge and arbiter...* (Jasher 1:22). The New Testament reads the murder as the first fruit of the two lines, the wicked seed against the righteous: *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* (1 John 3:12); and Wisdom names it the same way: *But when the unrighteous went away from her in his anger, he perished also in the fury with which he murdered his brother.* (Wisdom of Solomon 10:3). The seed-war is here at the beginning — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55012
  FROM _session252_ja01_lookup sv, _session252_ja01_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=21
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=1 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-1-curse-and-the-wandering',
       E'The blood that cries — the curse on Cain',
       E'Yahuah confronts and curses Cain exactly as the canon does: *And Cain dissembled, and said, I do not know, am I my brother''s keeper? And Yahuah (the Lord) said to him, What have you done? The voice of your brother''s blood cries to me from the ground where you have slain him.* (Jasher 1:29) — *and now, therefore, cursed be you from the ground which opened its mouth to receive your brother''s blood from your hand...* (Jasher 1:31) — *and you shall be moving and wandering in the earth until the day of your death.* (Jasher 1:32). Genesis is the source word for word: *And Yahuah (LORD) said unto Cain, Where is Abel thy brother? And he said, I know not: Am I my brother''s keeper?* (Genesis 4:9); *And now art thou cursed from the earth, which hath opened her mouth to receive thy brother''s blood from thy hand;* (Genesis 4:11); *a fugitive and a vagabond shalt thou be in the earth.* (Genesis 4:12). His going out east of Eden is the canon''s land of Nod — *And Cain went out from the presence of Yahuah (LORD), and dwelt in the land of Nod, on the east of Eden.* (Genesis 4:16). Jubilees confirms the same sentence: *...he made him a fugitive on the earth because of the blood of his brother, and he cursed him upon the earth.* (Jubilees 4:4).',
       sv.verse_id, ev.verse_id, 'extras', 55015
  FROM _session252_ja01_lookup sv, _session252_ja01_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=28
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=1 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-1-cain-line-and-the-city',
       E'Cain''s line and the city Enoch',
       E'Jasher closes the chapter tracing Cain''s line and his city, the first kingdom-of-man raised east of Eden: *And Cain knew his wife in those days, and she conceived and bare a son, and he called his name Enoch...* (Jasher 1:34) — *And at that time Cain also began to build a city: and he built the city and he called the name of the city Enoch, according to the name of his son...* (Jasher 1:35) — *And Irad was born to Enoch, and Irad begat Mechuyael and Mechuyael begat Methusael.* (Jasher 1:36). Genesis records the same line and the same first city: *And Cain knew his wife; and she conceived, and bare Enoch: and he builded a city, and called the name of the city, after the name of his son, Enoch.* (Genesis 4:17); *And unto Enoch was born Irad: and Irad begat Mehujael: and Mehujael begat Methusael...* (Genesis 4:18). This is the line set against the chosen seed — the wandering builder who founds a city, the pattern that will rise again in Nimrod''s Babel. Jubilees follows Cain to his stone-struck end in righteous judgment: *...for his house fell upon him and he died in the midst of his house, and he was killed by its stones, for with a stone he had killed Abel, and by a stone was he killed in righteous judgment.* (Jubilees 4:31).',
       sv.verse_id, ev.verse_id, 'extras', 55018
  FROM _session252_ja01_lookup sv, _session252_ja01_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=34
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=1 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-1-man-and-the-woman-formed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 1:26 — *And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth, and over every creeping thing that creepeth upon the earth.* Jasher 1:1 quotes the canon''s own "let us make man" word-for-word as the head of its retelling.'
  FROM cross_reference_threads t, cross_references x, _session252_ja01_lookup sv, _session252_ja01_lookup tv
 WHERE t.slug='jasher-1-man-and-the-woman-formed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:7 — *And Yahuah Elohim (the LORD God) formed man of the dust of the ground, and breathed into his nostrils the breath of life; and man became a living soul.* Jasher 1:2''s forming from the ground and breath into the nostrils is Genesis 2:7, adding only that the soul was "endowed with speech."'
  FROM cross_reference_threads t, cross_references x, _session252_ja01_lookup sv, _session252_ja01_lookup tv
 WHERE t.slug='jasher-1-man-and-the-woman-formed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 2:22 — *And the rib, which Yahuah Elohim (the LORD God) had taken from man, made he a woman, and brought her unto the man.* Jasher 1:4''s deep sleep, the taken rib, the flesh built upon it, and the woman brought to Adam follow Genesis rib for rib.'
  FROM cross_reference_threads t, cross_references x, _session252_ja01_lookup sv, _session252_ja01_lookup tv
 WHERE t.slug='jasher-1-man-and-the-woman-formed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 3:5 — *And Yahuah our Elohim (the LORD our God) caused a deep sleep to fall upon him, and he slept, and He took for the woman one rib from amongst his ribs, and this rib was the origin of the woman from amongst his ribs, and He built up the flesh in its stead, and built the woman.* Jubilees narrates the same forming of the woman as Jasher 1:4 — the now-live witness beside it.'
  FROM cross_reference_threads t, cross_references x, _session252_ja01_lookup sv, _session252_ja01_lookup tv
 WHERE t.slug='jasher-1-man-and-the-woman-formed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=4
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Matthew 19:4 — *And he answered and said unto them, Have ye not read, that he which made them at the beginning made them male and female,* Messiah reads the same beginning Jasher 1:6 records — created male and female, blessed to be fruitful and multiply.'
  FROM cross_reference_threads t, cross_references x, _session252_ja01_lookup sv, _session252_ja01_lookup tv
 WHERE t.slug='jasher-1-man-and-the-woman-formed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=19 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-1-garden-command-and-the-fall
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:15 — *And Yahuah Elohim (the LORD God) took the man, and put him into the garden of Eden to dress it and to keep it.* Jasher 1:7 places Adam and his wife in Eden "to dress it and to keep it" in the canon''s own words.'
  FROM cross_reference_threads t, cross_references x, _session252_ja01_lookup sv, _session252_ja01_lookup tv
 WHERE t.slug='jasher-1-garden-command-and-the-fall'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 2:17 — *But of the tree of the knowledge of good and evil, thou shalt not eat of it: for in the day that thou eatest thereof thou shalt surely die.* The single prohibition Jasher 1:7 records — eat of every tree but this one — is Genesis 2:17 carried verbatim.'
  FROM cross_reference_threads t, cross_references x, _session252_ja01_lookup sv, _session252_ja01_lookup tv
 WHERE t.slug='jasher-1-garden-command-and-the-fall'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:1 — *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* Jasher 1:9''s serpent who came "to incite them to transgress" is the subtil serpent of Genesis 3:1.'
  FROM cross_reference_threads t, cross_references x, _session252_ja01_lookup sv, _session252_ja01_lookup tv
 WHERE t.slug='jasher-1-garden-command-and-the-fall'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 3:6 — *And when the woman saw that the tree was good for food, and that it was pleasant to the eyes, and a tree to be desired to make one wise, she took of the fruit thereof, and did eat, and gave also unto her husband with her; and he did eat.* Jasher 1:10 — the woman hearkening, taking, eating, and giving to her husband — is Genesis 3:6.'
  FROM cross_reference_threads t, cross_references x, _session252_ja01_lookup sv, _session252_ja01_lookup tv
 WHERE t.slug='jasher-1-garden-command-and-the-fall'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Wisdom of Solomon 2:24 — *Nevertheless through envy of the devil came death into the world: and they that do hold of his side do find it.* Wisdom names the envy of the devil behind the serpent''s enticement that Jasher 1:10 recounts.'
  FROM cross_reference_threads t, cross_references x, _session252_ja01_lookup sv, _session252_ja01_lookup tv
 WHERE t.slug='jasher-1-garden-command-and-the-fall'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-1-expelled-and-the-seed-begun
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:23 — *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken.* Jasher 1:12 drives them out "to till the ground from which they were taken" — Genesis 3:23 word for word.'
  FROM cross_reference_threads t, cross_references x, _session252_ja01_lookup sv, _session252_ja01_lookup tv
 WHERE t.slug='jasher-1-expelled-and-the-seed-begun'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 3:24 — *So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life.* Jasher 1:12''s dwelling "at the east of the garden of Eden" is the very ground east of the cherubim-guarded gate of Genesis 3:24.'
  FROM cross_reference_threads t, cross_references x, _session252_ja01_lookup sv, _session252_ja01_lookup tv
 WHERE t.slug='jasher-1-expelled-and-the-seed-begun'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:20 — *And Adam called his wife''s name Eve; because she was the mother of all living.* Jasher 1:5 names her Eve "for she was the mother of all living" — the canon''s own etymology of the matriarch through whom the seed comes.'
  FROM cross_reference_threads t, cross_references x, _session252_ja01_lookup sv, _session252_ja01_lookup tv
 WHERE t.slug='jasher-1-expelled-and-the-seed-begun'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 4:1 — *And Adam knew Eve his wife; and she conceived, and bare Cain, and said, I have gotten a man from Yahuah (LORD).* Jasher 1:13''s "I have obtained a man from Yahuah" at Cain''s naming is Eve''s word in Genesis 4:1 — the first link of the seed-line.'
  FROM cross_reference_threads t, cross_references x, _session252_ja01_lookup sv, _session252_ja01_lookup tv
 WHERE t.slug='jasher-1-expelled-and-the-seed-begun'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 4:1 — *And in the third week in the second jubilee she gave birth to Cain, and in the fourth she gave birth to Abel, and in the fifth she gave birth to her daughter ''Âwân.* Jubilees records the same first births Jasher 1:13 names — the now-live patriarchal witness, dated in jubilees.'
  FROM cross_reference_threads t, cross_references x, _session252_ja01_lookup sv, _session252_ja01_lookup tv
 WHERE t.slug='jasher-1-expelled-and-the-seed-begun'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=13
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-1-cain-and-abel-offerings
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:2 — *And she again bare his brother Abel. And Abel was a keeper of sheep, but Cain was a tiller of the ground.* Jasher 1:14 gives the brothers their identical callings — Cain a tiller of the ground, Abel a keeper of sheep.'
  FROM cross_reference_threads t, cross_references x, _session252_ja01_lookup sv, _session252_ja01_lookup tv
 WHERE t.slug='jasher-1-cain-and-abel-offerings'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:4 — *And Abel, he also brought of the firstlings of his flock and of the fat thereof. And Yahuah (LORD) had respect unto Abel and to his offering:* Jasher 1:15''s firstlings "from the fat of it" and Yahuah''s inclining to Abel is Genesis 4:4, with the added sign of heaven''s consuming fire.'
  FROM cross_reference_threads t, cross_references x, _session252_ja01_lookup sv, _session252_ja01_lookup tv
 WHERE t.slug='jasher-1-cain-and-abel-offerings'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 4:5 — *But unto Cain and to his offering he had not respect. And Cain was very wroth, and his countenance fell.* Jasher 1:16''s Cain, whose offering was not turned to and who grew jealous "and sought a pretext to slay him," is the wroth Cain of Genesis 4:5.'
  FROM cross_reference_threads t, cross_references x, _session252_ja01_lookup sv, _session252_ja01_lookup tv
 WHERE t.slug='jasher-1-cain-and-abel-offerings'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 11:4 — *By faith Abel offered unto Elohim (God) a more excellent sacrifice than Cain, by which he obtained witness that he was righteous, Elohim (God) testifying of his gifts: and by it he being dead yet speaketh.* The heaven-consumed gift of Jasher 1:15 is the more excellent sacrifice Hebrews calls faith and righteousness.'
  FROM cross_reference_threads t, cross_references x, _session252_ja01_lookup sv, _session252_ja01_lookup tv
 WHERE t.slug='jasher-1-cain-and-abel-offerings'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 4:2 — *And in the first (year) of the third jubilee, Cain slew Abel because Elohim (God) accepted the sacrifice of Abel, and did not accept the offering of Cain.* Jubilees names the rejected offering of Jasher 1:16 as the very cause of the murder to come — the now-live witness beside it.'
  FROM cross_reference_threads t, cross_references x, _session252_ja01_lookup sv, _session252_ja01_lookup tv
 WHERE t.slug='jasher-1-cain-and-abel-offerings'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=16
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-1-murder-of-abel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:8 — *And Cain talked with Abel his brother: and it came to pass, when they were in the field, that Cain rose up against Abel his brother, and slew him.* Jasher 1:25''s Cain who "rose up" in the field and slew his brother is Genesis 4:8, named down to the instrument.'
  FROM cross_reference_threads t, cross_references x, _session252_ja01_lookup sv, _session252_ja01_lookup tv
 WHERE t.slug='jasher-1-murder-of-abel'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 John 3:12 — *Not as Cain, who was of that wicked one, and slew his brother. And wherefore slew he him? Because his own works were evil, and his brother''s righteous.* Abel''s plea to the Judge in Jasher 1:22 — the wicked requited for his evil, the righteous vindicated — is John''s reading of the first murder as the two lines, evil works against righteous.'
  FROM cross_reference_threads t, cross_references x, _session252_ja01_lookup sv, _session252_ja01_lookup tv
 WHERE t.slug='jasher-1-murder-of-abel'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Wisdom of Solomon 10:3 — *But when the unrighteous went away from her in his anger, he perished also in the fury with which he murdered his brother.* Wisdom names the same fratricidal fury that Jasher 1:25 recounts in the slaying of Abel.'
  FROM cross_reference_threads t, cross_references x, _session252_ja01_lookup sv, _session252_ja01_lookup tv
 WHERE t.slug='jasher-1-murder-of-abel'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=25
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=10 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 4:3 — *And he slew him in the field: and his blood cried from the ground to heaven, complaining because he had slain him.* Jubilees tells the same field-murder of Jasher 1:25, with Abel''s blood crying from the ground — the now-live patriarchal witness.'
  FROM cross_reference_threads t, cross_references x, _session252_ja01_lookup sv, _session252_ja01_lookup tv
 WHERE t.slug='jasher-1-murder-of-abel'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=25
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-1-curse-and-the-wandering
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:9 — *And Yahuah (LORD) said unto Cain, Where is Abel thy brother? And he said, I know not: Am I my brother''s keeper?* Jasher 1:29''s dissembling "am I my brother''s keeper?" is Cain''s word in Genesis 4:9.'
  FROM cross_reference_threads t, cross_references x, _session252_ja01_lookup sv, _session252_ja01_lookup tv
 WHERE t.slug='jasher-1-curse-and-the-wandering'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:11 — *And now art thou cursed from the earth, which hath opened her mouth to receive thy brother''s blood from thy hand;* Jasher 1:31''s curse from the ground "which opened its mouth to receive your brother''s blood" is Genesis 4:11 word for word.'
  FROM cross_reference_threads t, cross_references x, _session252_ja01_lookup sv, _session252_ja01_lookup tv
 WHERE t.slug='jasher-1-curse-and-the-wandering'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 4:12 — *When thou tillest the ground, it shall not henceforth yield unto thee her strength; a fugitive and a vagabond shalt thou be in the earth.* Jasher 1:32 — the ground withholding its strength and the moving-and-wandering sentence — is Genesis 4:12.'
  FROM cross_reference_threads t, cross_references x, _session252_ja01_lookup sv, _session252_ja01_lookup tv
 WHERE t.slug='jasher-1-curse-and-the-wandering'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 4:16 — *And Cain went out from the presence of Yahuah (LORD), and dwelt in the land of Nod, on the east of Eden.* Jasher 1:33''s Cain going out "from the presence of Yahuah... toward the east of Eden" is the land of Nod east of Eden in Genesis 4:16.'
  FROM cross_reference_threads t, cross_references x, _session252_ja01_lookup sv, _session252_ja01_lookup tv
 WHERE t.slug='jasher-1-curse-and-the-wandering'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 4:4 — *And Yahuah (God) reproved Cain because of Abel, because he had slain him, and he made him a fugitive on the earth because of the blood of his brother, and he cursed him upon the earth...* Jubilees gives the same curse and fugitive-sentence Jasher 1:31 records — the now-live witness, adding the heavenly-tables verdict on treacherous murder.'
  FROM cross_reference_threads t, cross_references x, _session252_ja01_lookup sv, _session252_ja01_lookup tv
 WHERE t.slug='jasher-1-curse-and-the-wandering'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=31
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-1-cain-line-and-the-city
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:17 — *And Cain knew his wife; and she conceived, and bare Enoch: and he builded a city, and called the name of the city, after the name of his son, Enoch.* Jasher 1:34-35''s birth of Enoch and the city named for him is Genesis 4:17 — the first city, the kingdom-of-man pattern begun east of Eden.'
  FROM cross_reference_threads t, cross_references x, _session252_ja01_lookup sv, _session252_ja01_lookup tv
 WHERE t.slug='jasher-1-cain-line-and-the-city'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:18 — *And unto Enoch was born Irad: and Irad begat Mehujael: and Mehujael begat Methusael: and Methusael begat Lamech.* Jasher 1:36''s Irad–Mechuyael–Methusael genealogy traces Cain''s line exactly as Genesis 4:18 does.'
  FROM cross_reference_threads t, cross_references x, _session252_ja01_lookup sv, _session252_ja01_lookup tv
 WHERE t.slug='jasher-1-cain-line-and-the-city'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:31 — *At the close of this jubilee Cain was killed after him in the same year; for his house fell upon him and he died in the midst of his house, and he was killed by its stones, for with a stone he had killed Abel, and by a stone was he killed in righteous judgment.* Jubilees follows the same Cain whose city Jasher 1:35 builds to his stone-struck end in righteous judgment — the now-live witness.'
  FROM cross_reference_threads t, cross_references x, _session252_ja01_lookup sv, _session252_ja01_lookup tv
 WHERE t.slug='jasher-1-cain-line-and-the-city'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=1 AND sv.verse_number=35
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jasher_02.sql (session252 jasher 2) -----
-- Source anchor: jasher/jasher ch2. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja02 (view _session252_ja02_lookup). Sort band base 55025, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-2-seth-the-appointed-seed
  ('jasher', 'jasher', 2, 1, 'canon', 'genesis', 4, 25, 'free', E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* Jasher 2:1 carries the Genesis naming of Seth verbatim, the appointed seed set in Abel''s place.'),
  ('jasher', 'jasher', 2, 1, 'canon', 'genesis', 5, 3, 'free', E'Genesis 5:3 — *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth:* Jasher 2:1 fixes the same hundred-and-thirtieth year and the likeness-and-image language of the seed-line record.'),
  ('jasher', 'jasher', 2, 2, 'canon', 'genesis', 5, 6, 'free', E'Genesis 5:6 — *And Seth lived an hundred and five years, and begat Enos:* Jasher 2:2 traces the chosen line one more generation, Seth begetting Enosh at a hundred and five years.'),
  ('jasher', 'jasher', 2, 1, 'jubilees', 'jubilees', 4, 7, 'extras', E'Jubilees 4:7 — *Adam knew his wife again, and she bare him a son, and he called his name Seth; for he said "Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him."* Jubilees narrates the identical appointed-seed scene of Jasher 2:1 — both now live, the same election.'),
  -- thread: jasher-2-enosh-idolatry-forgot-the-lord
  ('jasher', 'jasher', 2, 5, 'canon', 'genesis', 4, 26, 'free', E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Jasher 2:5 sets its account of the days of Enosh against the very generation Genesis marks as the beginning of calling on the Name, the two lines diverging.'),
  ('jasher', 'jasher', 2, 4, 'canon', 'romans', 1, 21, 'free', E'Romans 1:21 — *Because that, when they knew Elohim (God), they glorified him not as Elohim (God), neither were thankful; but became vain in their imaginations, and their foolish heart was darkened.* Sha''ul names the same fall Jasher 2:4 describes — men who knew their Creator yet forgot Him and served other gods.'),
  ('jasher', 'jasher', 2, 4, 'canon', 'romans', 1, 23, 'free', E'Romans 1:23 — *And changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things.* The images of brass, iron, wood and stone of Jasher 2:4 are the idolatry Sha''ul indicts — the glory of God exchanged for an image.'),
  ('jasher', 'jasher', 2, 8, 'canon', 'genesis', 5, 29, 'free', E'Genesis 5:29 — *And he called his name Noah, saying, This same shall comfort us concerning our work and toil of our hands, because of the ground which Yahuah (LORD) hath cursed.* The thorns and barren ground of Jasher 2:8 are the curse on the earth that Genesis itself remembers from Adam''s day down to Noah.'),
  -- thread: jasher-2-cainan-the-wise-foreseeing-flood
  ('jasher', 'jasher', 2, 10, 'canon', 'genesis', 5, 9, 'free', E'Genesis 5:9 — *And Enos lived ninety years, and begat Cainan:* Jasher 2:10 carries the genealogy verbatim, Enosh begetting Cainan at ninety years, before expanding him into the wise ruler.'),
  ('jasher', 'jasher', 2, 15, 'canon', 'genesis', 5, 12, 'free', E'Genesis 5:12 — *And Cainan lived seventy years, and begat Mahalaleel:* Jasher 2:15 keeps the same seventieth-year reckoning for Cainan''s offspring that the seed-line record fixes in Genesis.'),
  ('jasher', 'jasher', 2, 13, 'jubilees', 'jubilees', 4, 17, 'extras', E'Jubilees 4:17 — *And he was the first among men that are born on earth who learnt writing and knowledge and wisdom and who wrote down the signs of heaven according to the order of their months in a book, that men might know the seasons of the years according to the order of their separate months.* Cainan''s writing of things to come on stone tablets in Jasher 2:13 mirrors the chosen line''s scribal foreknowledge that Jubilees gives to Enoch.'),
  -- thread: jasher-2-lamech-and-the-line-of-cain
  ('jasher', 'jasher', 2, 17, 'canon', 'genesis', 4, 19, 'free', E'Genesis 4:19 — *And Lamech took unto him two wives: the name of the one was Adah, and the name of the other Zillah.* Jasher 2:17 names the same two wives of Lamech, Adah and Zillah, retelling the Cainite genealogy.'),
  ('jasher', 'jasher', 2, 17, 'canon', 'genesis', 4, 20, 'free', E'Genesis 4:20 — *And Adah bare Jabal: he was the father of such as dwell in tents, and of such as have cattle.* Jasher 2:17 names Jabal as Adah''s son exactly as Genesis records the father of the herdsmen.'),
  ('jasher', 'jasher', 2, 18, 'canon', 'genesis', 4, 21, 'free', E'Genesis 4:21 — *And his brother''s name was Jubal: he was the father of all such as handle the harp and organ.* Jasher 2:18 names Jubal as the second son born to Adah, the same brother Genesis makes father of the musicians.'),
  ('jasher', 'jasher', 2, 24, 'canon', 'genesis', 4, 22, 'free', E'Genesis 4:22 — *And Zillah, she also bare Tubal-cain, an instructer of every artificer in brass and iron: and the sister of Tubal-cain was Naamah.* Jasher 2:24-25 names Zillah''s children Tubal Cain and Naamah just as Genesis closes the line of Cain with its smith and his sister.'),
  -- thread: jasher-2-lamech-slays-cain
  ('jasher', 'jasher', 2, 35, 'canon', 'genesis', 4, 23, 'free', E'Genesis 4:23 — *And Lamech said unto his wives, Adah and Zillah, Hear my voice; ye wives of Lamech, hearken unto my speech: for I have slain a man to my wounding, and a young man to my hurt.* Jasher 2:35 expands this very song of Lamech, supplying the story of the man and young man he slew.'),
  ('jasher', 'jasher', 2, 29, 'canon', 'genesis', 4, 15, 'free', E'Genesis 4:15 — *And Yahuah (LORD) said unto him, Therefore whosoever slayeth Cain, vengeance shall be taken on him sevenfold. And Yahuah (LORD) set a mark upon Cain, lest any finding him should kill him.* Jasher 2:29 reads Cain''s death by Lamech''s arrow as the Lord requiting his wickedness, the sevenfold word at last fulfilled.'),
  ('jasher', 'jasher', 2, 29, 'jubilees', 'jubilees', 4, 31, 'extras', E'Jubilees 4:31 — *Cain was killed after him in the same year; for his house fell upon him and he died in the midst of his house, and he was killed by its stones, for with a stone he had killed Abel, and by a stone was he killed in righteous judgment.* Both Jasher 2:29 and Jubilees end Cain in measure-for-measure judgment for Abel''s blood — the same event, both now live.'),
  -- thread: jasher-2-line-toward-enoch
  ('jasher', 'jasher', 2, 37, 'canon', 'genesis', 5, 15, 'free', E'Genesis 5:15 — *And Mahalaleel lived sixty and five years, and begat Jared:* Jasher 2:37 carries the same sixty-five-year reckoning of Mahalaleel begetting Jared in the chosen line.'),
  ('jasher', 'jasher', 2, 37, 'canon', 'genesis', 5, 18, 'free', E'Genesis 5:18 — *And Jared lived an hundred sixty and two years, and he begat Enoch:* Jasher 2:37 brings the line to Jared begetting Enoch, the same generation Genesis fixes before the one who walked with Elohim.'),
  ('jasher', 'jasher', 2, 37, 'jubilees', 'jubilees', 4, 15, 'extras', E'Jubilees 4:15 — *Mahalalel took to him to wife Dînâh, the daughter of Barâkî''êl the daughter of his father''s brother, and she bare him a son... and he called his name Jared; for in his days the angels of Yahuah (God) descended on the earth, those who are named the Watchers, that they should instruct the children of men.* Jubilees carries the same Mahalaleel-Jared generation of Jasher 2:37 and marks Jared''s days as when the Watchers came down — the corruption Jasher''s next chapters and 1 Enoch unfold.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-2-seth-the-appointed-seed',
       E'Seth, the appointed seed in Abel''s place',
       E'Jasher opens the chapter on the chosen line: *And it was in the hundred and thirtieth year of the life of Adam upon the earth, that he again knew Eve his wife, and she conceived and bare a son in his likeness and in his image, and she called his name Seth, saying, Because Elohim (God) has appointed me another seed in the place of Abel, for Cain has slain him.* (Jasher 2:1) This is Genesis told over again, word answering word: *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* (Genesis 4:25). The genealogy fixes the year exactly — *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth:* (Genesis 5:3) — and the line continues, *And Seth lived one hundred and five years, and he begat a son; and Seth called the name of his son Enosh* (Jasher 2:2), retelling *And Seth lived an hundred and five years, and begat Enos:* (Genesis 5:6). Jubilees keeps the same record of the appointed seed: *Adam knew his wife again, and she bare him a son, and he called his name Seth; for he said "Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him."* (Jubilees 4:7). The election runs Adam to Seth to Enosh — the covenant seed kept and chosen. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55025
  FROM _session252_ja02_lookup sv, _session252_ja02_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=2 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-2-enosh-idolatry-forgot-the-lord',
       E'The days of Enosh: images of brass and stone, and the Lord forgotten',
       E'Jasher reads the sons of men''s descent into idolatry into the very generation Genesis marks as the start of calling on the Name: *And the sons of men went and they served other gods, and they forgot Yahuah (the Lord) who had created them in the earth: and in those days the sons of men made images of brass and iron, wood and stone, and they bowed down and served them.* (Jasher 2:4) — *And every man made his god and they bowed down to them, and the sons of men forsook Yahuah (the Lord) all the days of Enosh* (Jasher 2:5). Genesis fixes the pivot in the same days: *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* (Genesis 4:26). Sha''ul names exactly this fall — knowing the Creator yet turning to images: *Because that, when they knew Elohim (God), they glorified him not as Elohim (God), neither were thankful; but became vain in their imaginations, and their foolish heart was darkened.* (Romans 1:21), *And changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things.* (Romans 1:23). The corrupted ways corrupt the earth itself (Jasher 2:9), and the thorns and famine (Jasher 2:7-8) carry the curse already spoken from Adam''s day: *And he called his name Noah, saying, This same shall comfort us concerning our work and toil of our hands, because of the ground which Yahuah (LORD) hath cursed.* (Genesis 5:29). The seed-war is already running — the line that forgets against the line that calls on the Name. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55028
  FROM _session252_ja02_lookup sv, _session252_ja02_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=3
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=2 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-2-cainan-the-wise-foreseeing-flood',
       E'Cainan the wise, who foresaw the flood and wrote on stone',
       E'Jasher fills out the bare Genesis name Cainan with the legend of a wise ruler who foresaw the judgment: *And Enosh lived ninety years and he begat Cainan* (Jasher 2:10) — exactly *And Enos lived ninety years, and begat Cainan:* (Genesis 5:9). Where Genesis only lists him — *And Cainan lived seventy years, and begat Mahalaleel:* (Genesis 5:12) — Jasher adds the detail of the seer-king: *And Cainan knew by his wisdom that Elohim would destroy the sons of men for having sinned upon earth, and that Yahuah (the Lord) would in the latter days bring upon them the waters of the flood.* (Jasher 2:12), who *wrote upon tablets of stone, what was to take place in time to come* (Jasher 2:13). This is the same scribal-foreknowledge motif Jubilees gives to the chosen line, where Enoch *wrote down the signs of heaven... in a book, that men might know the seasons* (Jubilees 4:17) and the angels *should instruct the children of men* in the days of Jared (Jubilees 4:15). Jasher anchors the addition to the canon''s genealogy and to the genuine parallel — never inventing a fulfillment the text does not carry. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55031
  FROM _session252_ja02_lookup sv, _session252_ja02_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=10
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=2 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-2-lamech-and-the-line-of-cain',
       E'Lamech, Adah and Zillah, and the craftsmen of the line of Cain',
       E'Jasher names the families of the Cainite Lamech that Genesis lists: *And Lamech, the son of Methusael, became related to Cainan by marriage, and he took his two daughters for his wives, and Adah conceived and bare a son to Lamech, and she called his name Jabal. And she again conceived and bare a son, and called his name Jubal* (Jasher 2:17-18); and later *she conceived and bare a son and she called his name Tubal Cain* and *bare a daughter, and she called her name Naamah* (Jasher 2:24-25). Genesis carries the same roster: *And Lamech took unto him two wives: the name of the one was Adah, and the name of the other Zillah.* (Genesis 4:19) — *And Adah bare Jabal: he was the father of such as dwell in tents, and of such as have cattle.* (Genesis 4:20) — *And his brother''s name was Jubal: he was the father of all such as handle the harp and organ.* (Genesis 4:21) — *And Zillah, she also bare Tubal-cain, an instructer of every artificer in brass and iron: and the sister of Tubal-cain was Naamah.* (Genesis 4:22). This is the parallel line, Cain''s seed building its own world of cities and crafts beside the line that calls on the Name. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55034
  FROM _session252_ja02_lookup sv, _session252_ja02_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=17
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=2 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-2-lamech-slays-cain',
       E'Lamech slays Cain, and the requiting of Abel''s blood',
       E'Jasher gives the legend behind Lamech''s dark song in Genesis — that the blind old Lamech, guided by Tubal Cain, slew Cain himself: *And the arrows entered Cain''s body although he was distant from them, and he fell to the ground and died.* (Jasher 2:28), *And Yahuah (the Lord) requited Cain''s evil according to his wickedness, which he had done to his brother Abel* (Jasher 2:29). Then Lamech pleads to his wives, *Hear my voice O wives of Lamech, attend to my words, for now you have imagined and said that I slew a man with my wounds, and a child with my stripes* (Jasher 2:35) — the very speech Genesis preserves: *And Lamech said unto his wives, Adah and Zillah, Hear my voice; ye wives of Lamech, hearken unto my speech: for I have slain a man to my wounding, and a young man to my hurt.* (Genesis 4:23), *If Cain shall be avenged sevenfold, truly Lamech seventy and sevenfold.* (Genesis 4:24). And the sevenfold vengeance threatened over Cain is satisfied — *And Yahuah (LORD) said unto him, Therefore whosoever slayeth Cain, vengeance shall be taken on him sevenfold.* (Genesis 4:15). Jubilees keeps the same measure-for-measure end: *Cain was killed... for his house fell upon him... for with a stone he had killed Abel, and by a stone was he killed in righteous judgment.* (Jubilees 4:31). The blood of Abel is requited; the way of Cain ends under judgment. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55037
  FROM _session252_ja02_lookup sv, _session252_ja02_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=26
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=2 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-2-line-toward-enoch',
       E'Mahalaleel to Jared to Enoch — the chosen line toward the one translated',
       E'Jasher closes the chapter by carrying the elect line one step further, to the threshold of Enoch''s story: *And Mahlallel the son of Cainan lived sixty-five years and he begat Jared; and Jared lived sixty-two years and he begat Enoch.* (Jasher 2:37). Genesis gives the same generations and years: *And Mahalaleel lived sixty and five years, and begat Jared:* (Genesis 5:15) and *And Jared lived an hundred sixty and two years, and he begat Enoch:* (Genesis 5:18). Jubilees keeps the very record and adds the days of Jared when the Watchers descended: *Mahalalel took to him to wife Dînâh... and she bare him a son... and he called his name Jared; for in his days the angels of Yahuah (God) descended on the earth, those who are named the Watchers* (Jubilees 4:15). The line runs unbroken toward Enoch who walked with Elohim and was taken — the chosen seed kept across the generations, set up here for the chapter to come. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55040
  FROM _session252_ja02_lookup sv, _session252_ja02_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=37
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=2 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-2-seth-the-appointed-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:25 — *And Adam knew his wife again; and she bare a son, and called his name Seth: For Elohim (God), said she, hath appointed me another seed instead of Abel, whom Cain slew.* Jasher 2:1 carries the Genesis naming of Seth verbatim, the appointed seed set in Abel''s place.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-seth-the-appointed-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 5:3 — *And Adam lived an hundred and thirty years, and begat a son in his own likeness, after his image; and called his name Seth:* Jasher 2:1 fixes the same hundred-and-thirtieth year and the likeness-and-image language of the seed-line record.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-seth-the-appointed-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 5:6 — *And Seth lived an hundred and five years, and begat Enos:* Jasher 2:2 traces the chosen line one more generation, Seth begetting Enosh at a hundred and five years.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-seth-the-appointed-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 4:7 — *Adam knew his wife again, and she bare him a son, and he called his name Seth; for he said "Elohim (God) has raised up a second seed to us on the earth instead of Abel; for Cain slew him."* Jubilees narrates the identical appointed-seed scene of Jasher 2:1 — both now live, the same election.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-seth-the-appointed-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-2-enosh-idolatry-forgot-the-lord
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:26 — *And to Seth, to him also there was born a son; and he called his name Enos: then began men to call upon the name of Yahuah (LORD).* Jasher 2:5 sets its account of the days of Enosh against the very generation Genesis marks as the beginning of calling on the Name, the two lines diverging.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-enosh-idolatry-forgot-the-lord'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 1:21 — *Because that, when they knew Elohim (God), they glorified him not as Elohim (God), neither were thankful; but became vain in their imaginations, and their foolish heart was darkened.* Sha''ul names the same fall Jasher 2:4 describes — men who knew their Creator yet forgot Him and served other gods.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-enosh-idolatry-forgot-the-lord'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 1:23 — *And changed the glory of the uncorruptible Elohim (God) into an image made like to corruptible man, and to birds, and fourfooted beasts, and creeping things.* The images of brass, iron, wood and stone of Jasher 2:4 are the idolatry Sha''ul indicts — the glory of God exchanged for an image.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-enosh-idolatry-forgot-the-lord'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 5:29 — *And he called his name Noah, saying, This same shall comfort us concerning our work and toil of our hands, because of the ground which Yahuah (LORD) hath cursed.* The thorns and barren ground of Jasher 2:8 are the curse on the earth that Genesis itself remembers from Adam''s day down to Noah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-enosh-idolatry-forgot-the-lord'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-2-cainan-the-wise-foreseeing-flood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:9 — *And Enos lived ninety years, and begat Cainan:* Jasher 2:10 carries the genealogy verbatim, Enosh begetting Cainan at ninety years, before expanding him into the wise ruler.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-cainan-the-wise-foreseeing-flood'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 5:12 — *And Cainan lived seventy years, and begat Mahalaleel:* Jasher 2:15 keeps the same seventieth-year reckoning for Cainan''s offspring that the seed-line record fixes in Genesis.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-cainan-the-wise-foreseeing-flood'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:17 — *And he was the first among men that are born on earth who learnt writing and knowledge and wisdom and who wrote down the signs of heaven according to the order of their months in a book, that men might know the seasons of the years according to the order of their separate months.* Cainan''s writing of things to come on stone tablets in Jasher 2:13 mirrors the chosen line''s scribal foreknowledge that Jubilees gives to Enoch.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-cainan-the-wise-foreseeing-flood'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-2-lamech-and-the-line-of-cain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:19 — *And Lamech took unto him two wives: the name of the one was Adah, and the name of the other Zillah.* Jasher 2:17 names the same two wives of Lamech, Adah and Zillah, retelling the Cainite genealogy.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-lamech-and-the-line-of-cain'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:20 — *And Adah bare Jabal: he was the father of such as dwell in tents, and of such as have cattle.* Jasher 2:17 names Jabal as Adah''s son exactly as Genesis records the father of the herdsmen.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-lamech-and-the-line-of-cain'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 4:21 — *And his brother''s name was Jubal: he was the father of all such as handle the harp and organ.* Jasher 2:18 names Jubal as the second son born to Adah, the same brother Genesis makes father of the musicians.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-lamech-and-the-line-of-cain'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 4:22 — *And Zillah, she also bare Tubal-cain, an instructer of every artificer in brass and iron: and the sister of Tubal-cain was Naamah.* Jasher 2:24-25 names Zillah''s children Tubal Cain and Naamah just as Genesis closes the line of Cain with its smith and his sister.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-lamech-and-the-line-of-cain'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-2-lamech-slays-cain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 4:23 — *And Lamech said unto his wives, Adah and Zillah, Hear my voice; ye wives of Lamech, hearken unto my speech: for I have slain a man to my wounding, and a young man to my hurt.* Jasher 2:35 expands this very song of Lamech, supplying the story of the man and young man he slew.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-lamech-slays-cain'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 4:15 — *And Yahuah (LORD) said unto him, Therefore whosoever slayeth Cain, vengeance shall be taken on him sevenfold. And Yahuah (LORD) set a mark upon Cain, lest any finding him should kill him.* Jasher 2:29 reads Cain''s death by Lamech''s arrow as the Lord requiting his wickedness, the sevenfold word at last fulfilled.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-lamech-slays-cain'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=4 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:31 — *Cain was killed after him in the same year; for his house fell upon him and he died in the midst of his house, and he was killed by its stones, for with a stone he had killed Abel, and by a stone was he killed in righteous judgment.* Both Jasher 2:29 and Jubilees end Cain in measure-for-measure judgment for Abel''s blood — the same event, both now live.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-lamech-slays-cain'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=29
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-2-line-toward-enoch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:15 — *And Mahalaleel lived sixty and five years, and begat Jared:* Jasher 2:37 carries the same sixty-five-year reckoning of Mahalaleel begetting Jared in the chosen line.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-line-toward-enoch'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 5:18 — *And Jared lived an hundred sixty and two years, and he begat Enoch:* Jasher 2:37 brings the line to Jared begetting Enoch, the same generation Genesis fixes before the one who walked with Elohim.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-line-toward-enoch'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:15 — *Mahalalel took to him to wife Dînâh, the daughter of Barâkî''êl the daughter of his father''s brother, and she bare him a son... and he called his name Jared; for in his days the angels of Yahuah (God) descended on the earth, those who are named the Watchers, that they should instruct the children of men.* Jubilees carries the same Mahalaleel-Jared generation of Jasher 2:37 and marks Jared''s days as when the Watchers came down — the corruption Jasher''s next chapters and 1 Enoch unfold.'
  FROM cross_reference_threads t, cross_references x, _session252_ja02_lookup sv, _session252_ja02_lookup tv
 WHERE t.slug='jasher-2-line-toward-enoch'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=2 AND sv.verse_number=37
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jasher_03.sql (session252 jasher 3) -----
-- Source anchor: jasher/jasher ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja03 (view _session252_ja03_lookup). Sort band base 55050, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-3-enoch-walked-with-elohim
  ('jasher', 'jasher', 3, 1, 'canon', 'genesis', 5, 21, 'free', E'Genesis 5:21 — *And Enoch lived sixty and five years, and begat Methuselah:* the exact age and birth Jasher 3:1 opens with, retelling the Genesis seed-line.'),
  ('jasher', 'jasher', 3, 1, 'canon', 'genesis', 5, 22, 'free', E'Genesis 5:22 — *And Enoch walked with Elohim (God) after he begat Methuselah three hundred years, and begat sons and daughters:* the walk Jasher 3:1 echoes, Enoch serving Yahuah and despising the evil ways of men.'),
  ('jasher', 'jasher', 3, 1, 'canon', 'genesis', 5, 18, 'free', E'Genesis 5:18 — *And Jared lived an hundred sixty and two years, and he begat Enoch:* the father whose son Jasher 3 expands, tracing Adam→Seth→Enoch through the chosen line.'),
  ('jasher', 'jasher', 3, 1, 'jubilees', 'jubilees', 4, 16, 'extras', E'Jubilees 4:16 — *And in the eleventh jubilee Jared took to himself a wife... and she bare him a son in the fifth week, in the fourth year of the jubilee, and he called his name Enoch.* the same patriarchal birth Jasher 3:1 records, both tracing the seed-line generation by generation.'),
  -- thread: jasher-3-enoch-the-teacher-scribe
  ('jasher', 'jasher', 3, 2, 'enoch', '1-enoch', 12, 1, 'extras', E'1 Enoch 12:1 — *Before these things Enoch was hidden, and no one of the children of men knew where he was hidden, and where he abode, and what had become of him.* the same withdrawal Jasher 3:2 describes when Enoch secreted himself from men for many days.'),
  ('jasher', 'jasher', 3, 5, 'enoch', '1-enoch', 12, 3, 'extras', E'1 Enoch 12:3 — *And I Enoch was blessing Yahuah (God) of majesty and the King of the ages, and lo! the Watchers called me—Enoch the scribe—and said to me:* the teaching, righteous-scribe Enoch Jasher 3:5 sends out to instruct the sons of men.'),
  ('jasher', 'jasher', 3, 8, 'jubilees', 'jubilees', 4, 17, 'extras', E'Jubilees 4:17 — *And he was the first among men that are born on earth who learnt writing and knowledge and wisdom... And he was the first to write a testimony, and he testified to the sons of men among the generations of the earth* the wisdom Jasher 3:8 says the spirit of Elohim gave Enoch to teach all his men.'),
  ('jasher', 'jasher', 3, 8, 'apocrypha', 'ecclesiasticus', 44, 16, 'extras', E'Ecclesiasticus 44:16 — *Enoch pleased Yahuah (God), and was translated, being an example of repentance to all generations.* the teacher of righteousness Jasher 3:8 portrays, set down as an example for every generation.'),
  -- thread: jasher-3-enoch-reigned-righteous-king
  ('jasher', 'jasher', 3, 9, 'apocrypha', 'ecclesiasticus', 44, 3, 'extras', E'Ecclesiasticus 44:3 — *Such as did bear rule in their kingdoms, men renowned for their power, giving counsel by their understanding, and declaring prophecies:* the wise fathers the kings sought, as Jasher 3:9 has the kings come to Enoch''s wisdom and ask him to reign.'),
  ('jasher', 'jasher', 3, 12, 'apocrypha', 'ecclesiasticus', 44, 10, 'extras', E'Ecclesiasticus 44:10 — *But these were merciful men, whose righteousness has not been forgotten.* the justice and righteousness Jasher 3:12 says Enoch did with all his people through his reign.'),
  ('jasher', 'jasher', 3, 12, 'apocrypha', 'ecclesiasticus', 44, 11, 'extras', E'Ecclesiasticus 44:11 — *With their seed shall continually remain a good inheritance, and their children are within the covenant.* the covenant seed-line whose righteous reign Jasher 3:12 carries forward in the ways of Yahuah.'),
  -- thread: jasher-3-adam-died-tree-of-knowledge
  ('jasher', 'jasher', 3, 14, 'canon', 'genesis', 5, 5, 'free', E'Genesis 5:5 — *And all the days that Adam lived were nine hundred and thirty years: and he died.* the exact age Jasher 3:14 gives for Adam''s death during Enoch''s reign.'),
  ('jasher', 'jasher', 3, 16, 'jubilees', 'jubilees', 4, 30, 'extras', E'Jubilees 4:30 — *And he lacked seventy years of one thousand years; for one thousand years are as one day in the testimony of the heavens and therefore was it written concerning the tree of knowledge: "On the day that you eat thereof you will die."* the very tree-of-knowledge death Jasher 3:16 names as the cause of Adam''s dying.'),
  ('jasher', 'jasher', 3, 14, 'jubilees', 'jubilees', 4, 29, 'extras', E'Jubilees 4:29 — *And at the close of the nineteenth jubilee... Adam died, and all his sons buried him in the land of his creation, and he was the first to be buried in the earth.* the burial Jasher 3:14 records with Enoch and Methuselah laying Adam in the cave with great pomp.'),
  -- thread: jasher-3-enoch-translated-taken-up
  ('jasher', 'jasher', 3, 36, 'canon', 'genesis', 5, 24, 'free', E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* the five-word canon source Jasher 3:36 unfolds into Enoch''s ascent in a whirlwind with chariots of fire.'),
  ('jasher', 'jasher', 3, 36, 'canon', 'hebrews', 11, 5, 'free', E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* the translation Jasher 3:36 narrates, read as faith in the Renewed Covenant.'),
  ('jasher', 'jasher', 3, 36, 'enoch', '1-enoch', 14, 3, 'extras', E'1 Enoch 14:3 — *And I Enoch was carried off in a whirlwind, with a chariot of fire, and the wind lifted me up and bore me into the ends of heaven.* the very whirlwind and chariot of fire Jasher 3:36 gives for Enoch''s ascent, told by Enoch himself.'),
  ('jasher', 'jasher', 3, 23, 'jubilees', 'jubilees', 4, 23, 'extras', E'Jubilees 4:23 — *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour, and behold there he writes down the condemnation and judgment of the world* the taking-up Jasher 3:23 sets in motion when the angel calls Enoch to reign in heaven.'),
  ('jasher', 'jasher', 3, 36, 'enoch', '1-enoch', 70, 1, 'extras', E'1 Enoch 70:1 — *And it came to pass after this that my spirit was translated And it ascended into the heavens: And I saw the holy sons of Elohim (God). They were stepping on flames of fire... And their faces shone like snow.* the heavenly translation Jasher 3:36 records, even the snow Jasher 3:38 finds at the place of his ascent.'),
  -- thread: jasher-3-enoch-prophesied-judgment
  ('jasher', 'jasher', 3, 26, 'canon', 'jude', 1, 14, 'free', E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints,* the prophetic Enoch whose final statutes and judgments Jasher 3:26 has him place before the sons of men.'),
  ('jasher', 'jasher', 3, 26, 'canon', 'jude', 1, 15, 'free', E'Jude 1:15 — *To execute judgment upon all, and to convince all that are ungodly among them of all their ungodly deeds which they have ungodly committed* the coming judgment behind the instruction Jasher 3:26 says Enoch gave for how to live upon earth.'),
  ('jasher', 'jasher', 3, 25, 'jubilees', 'jubilees', 4, 19, 'extras', E'Jubilees 4:19 — *And what was and what will be he saw in a vision of his sleep... he saw and understood everything, and wrote his testimony, and placed the testimony on earth for all the children of men and for their generations.* the parting wisdom Jasher 3:25 has Enoch leave so the sons of men may live.'),
  ('jasher', 'jasher', 3, 31, 'jubilees', 'jubilees', 4, 24, 'extras', E'Jubilees 4:24 — *he was set as a sign and that he should testify against all the children of men, that he should recount all the deeds of the generations until the day of condemnation.* the witness-to-the-generations role behind Jasher 3:31, where Enoch''s last day teaching bids all men serve Yahuah and walk in his ways.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-3-enoch-walked-with-elohim',
       E'Enoch walked with Elohim — Jasher fills in Genesis 5',
       E'Jasher opens the same line Genesis closes in a single verse: *And Enoch lived sixty-five years and he begat Methuselah; and Enoch walked with Elohim (God) after having begot Methuselah, and he served Yahuah (the Lord), and despised the evil ways of men.* (Jasher 3:1). That is Genesis spoken back almost word for word — *And Enoch lived sixty and five years, and begat Methuselah* (Genesis 5:21) and *And Enoch walked with Elohim (God) after he begat Methuselah three hundred years, and begat sons and daughters* (Genesis 5:22). Jasher is not a new tale; it is the seed-line of Genesis 5 unfolded — Jared the father named in *And Jared lived an hundred sixty and two years, and he begat Enoch* (Genesis 5:18). Jubilees keeps the very same register of the chosen line: *and she bare him a son in the fifth week, in the fourth year of the jubilee, and he called his name Enoch.* (Jubilees 4:16). It ain''t new — the walk with Elohim before the Flood, Torah lived before Sinai, is carried in three witnesses at once.',
       sv.verse_id, ev.verse_id, 'extras', 55050
  FROM _session252_ja03_lookup sv, _session252_ja03_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=3 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-3-enoch-the-teacher-scribe',
       E'Enoch the teacher and scribe — called to instruct the sons of men',
       E'Jasher gives Enoch a ministry the canon only hints at: *And the soul of Enoch was wrapped up in the instruction of Yahuah (the Lord), in knowledge and in understanding; and he wisely retired from the sons of men, and secreted himself from them for many days.* (Jasher 3:2), until an angel calls him out — *Rise, go forth from your house... and appear to the sons of men, in order that you may teach them the way in which they should go* (Jasher 3:4) — and *he went to the sons of men and taught them the ways of Yahuah (the Lord)* (Jasher 3:5). This is the Enoch the live extra-canon already knows: *And his activities had to do with the Watchers, and his days were with the holy ones.* (1 Enoch 12:2) and *the Watchers called me—Enoch the scribe* (1 Enoch 12:3). Jubilees names him the first teacher of wisdom: *And he was the first among men that are born on earth who learnt writing and knowledge and wisdom and who wrote down the signs of heaven... And he was the first to write a testimony, and he testified to the sons of men* (Jubilees 4:17). Ecclesiasticus crowns it: *Enoch pleased Yahuah (God), and was translated, being an example of repentance to all generations.* (Ecclesiasticus 44:16). Four witnesses, one Enoch — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55053
  FROM _session252_ja03_lookup sv, _session252_ja03_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=2
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=3 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-3-enoch-reigned-righteous-king',
       E'Enoch reigned in righteousness — peace throughout the earth',
       E'Jasher alone gives Enoch a kingdom: *And all the kings of the sons of men, both first and last, together with their princes and judges, came to Enoch when they heard of his wisdom... and they also required of Enoch to reign over them, to which he consented.* (Jasher 3:9), *and they made Enoch king over them* (Jasher 3:10), *and he made peace amongst them, and peace was throughout the earth during the life of Enoch.* (Jasher 3:11), *And Enoch reigned over the sons of Adam two hundred and forty-three years, and he did justice and righteousness with all his people, and he led them in the ways of Yahuah (the Lord).* (Jasher 3:12). This is the seed-line''s righteous king set against the kingdom-of-man that Nimrod will build in Jasher 8 — justice and the ways of Yahuah, not the tyrant''s tower. Ecclesiasticus names the same line of fathers who *did bear rule in their kingdoms, men renowned for their power, giving counsel by their understanding, and declaring prophecies:* (Ecclesiasticus 44:3), and binds their seed in covenant — *and their children are within the covenant.* (Ecclesiasticus 44:11). The election runs through the righteous reign, not the rebel one.',
       sv.verse_id, ev.verse_id, 'extras', 55056
  FROM _session252_ja03_lookup sv, _session252_ja03_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=9
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=3 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-3-adam-died-tree-of-knowledge',
       E'Adam died — the death foretold in the Garden',
       E'In the middle of Enoch''s reign Jasher buries the first father: *And it was in the fifty-sixth year of the life of Lamech when Adam died; nine hundred and thirty years old was he at his death* (Jasher 3:14), *And Adam died because he ate of the tree of knowledge; he and his children after him, as Yahuah Elohim (the Lord God) had spoken.* (Jasher 3:16). Genesis records the same span — *And all the days that Adam lived were nine hundred and thirty years: and he died.* (Genesis 5:5) — and names the death sentence the eating brought. Jubilees reckons it as the unkept thousand-year day: *And he lacked seventy years of one thousand years; for one thousand years are as one day... and therefore was it written concerning the tree of knowledge: "On the day that you eat thereof you will die."* (Jubilees 4:30), buried by all his sons — *And at the close of the nineteenth jubilee... Adam died, and all his sons buried him in the land of his creation, and he was the first to be buried in the earth.* (Jubilees 4:29). One death, three witnesses, the Genesis word standing exactly.',
       sv.verse_id, ev.verse_id, 'extras', 55059
  FROM _session252_ja03_lookup sv, _session252_ja03_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=14
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=3 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-3-enoch-translated-taken-up',
       E'Enoch was not, for Elohim took him — translated that he should not see death',
       E'Jasher''s whole chapter drives to the moment Genesis states in five words. An angel calls again — *behold an angel of Yahuah (the Lord) then called to Enoch from heaven, and wished to bring him up to heaven to make him reign there over the sons of Elohim* (Jasher 3:23) — and *it was upon the seventh day that Enoch ascended into heaven in a whirlwind, with horses and chariots of fire.* (Jasher 3:36). That is Genesis told long: *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* (Genesis 5:24). The Renewed Covenant reads it as faith: *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* (Hebrews 11:5). And the live 1 Enoch supplies the chariot Jasher names: *And I Enoch was carried off in a whirlwind, with a chariot of fire, and the wind lifted me up and bore me into the ends of heaven.* (1 Enoch 14:3). Jubilees seals the taking: *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour* (Jubilees 4:23). It ain''t new — the translation of Enoch is one event held by five witnesses.',
       sv.verse_id, ev.verse_id, 'extras', 55062
  FROM _session252_ja03_lookup sv, _session252_ja03_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=23
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=3 AND ev.verse_number=38
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-3-enoch-prophesied-judgment',
       E'Enoch prophesied — the seventh from Adam and the day of judgment',
       E'Before he is taken, Jasher''s Enoch gives a last charge: *And now therefore I will teach you wisdom and knowledge and will give you instruction before I leave you, how to act upon earth by which you may live* (Jasher 3:25), and *he placed before them statutes and judgments to do upon earth, and he made peace amongst them, and he taught them everlasting life* (Jasher 3:26). The Renewed Covenant remembers this Enoch as a prophet of the judgment to come: *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints,* (Jude 1:14), *To execute judgment upon all, and to convince all that are ungodly among them of all their ungodly deeds* (Jude 1:15). The live 1 Enoch is the very testimony Jude quotes — Enoch the witness who *placed the testimony on earth for all the children of men and for their generations* (Jubilees 4:19) and *should recount all the deeds of the generations until the day of condemnation.* (Jubilees 4:24). The statutes and the warning are one apparatus — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55065
  FROM _session252_ja03_lookup sv, _session252_ja03_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=24
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=3 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-3-enoch-walked-with-elohim
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:21 — *And Enoch lived sixty and five years, and begat Methuselah:* the exact age and birth Jasher 3:1 opens with, retelling the Genesis seed-line.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-walked-with-elohim'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 5:22 — *And Enoch walked with Elohim (God) after he begat Methuselah three hundred years, and begat sons and daughters:* the walk Jasher 3:1 echoes, Enoch serving Yahuah and despising the evil ways of men.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-walked-with-elohim'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 5:18 — *And Jared lived an hundred sixty and two years, and he begat Enoch:* the father whose son Jasher 3 expands, tracing Adam→Seth→Enoch through the chosen line.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-walked-with-elohim'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 4:16 — *And in the eleventh jubilee Jared took to himself a wife... and she bare him a son in the fifth week, in the fourth year of the jubilee, and he called his name Enoch.* the same patriarchal birth Jasher 3:1 records, both tracing the seed-line generation by generation.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-walked-with-elohim'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-3-enoch-the-teacher-scribe
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Enoch 12:1 — *Before these things Enoch was hidden, and no one of the children of men knew where he was hidden, and where he abode, and what had become of him.* the same withdrawal Jasher 3:2 describes when Enoch secreted himself from men for many days.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-the-teacher-scribe'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=2
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 12:3 — *And I Enoch was blessing Yahuah (God) of majesty and the King of the ages, and lo! the Watchers called me—Enoch the scribe—and said to me:* the teaching, righteous-scribe Enoch Jasher 3:5 sends out to instruct the sons of men.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-the-teacher-scribe'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:17 — *And he was the first among men that are born on earth who learnt writing and knowledge and wisdom... And he was the first to write a testimony, and he testified to the sons of men among the generations of the earth* the wisdom Jasher 3:8 says the spirit of Elohim gave Enoch to teach all his men.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-the-teacher-scribe'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 44:16 — *Enoch pleased Yahuah (God), and was translated, being an example of repentance to all generations.* the teacher of righteousness Jasher 3:8 portrays, set down as an example for every generation.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-the-teacher-scribe'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=44 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-3-enoch-reigned-righteous-king
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiasticus 44:3 — *Such as did bear rule in their kingdoms, men renowned for their power, giving counsel by their understanding, and declaring prophecies:* the wise fathers the kings sought, as Jasher 3:9 has the kings come to Enoch''s wisdom and ask him to reign.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-reigned-righteous-king'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=44 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiasticus 44:10 — *But these were merciful men, whose righteousness has not been forgotten.* the justice and righteousness Jasher 3:12 says Enoch did with all his people through his reign.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-reigned-righteous-king'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=44 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiasticus 44:11 — *With their seed shall continually remain a good inheritance, and their children are within the covenant.* the covenant seed-line whose righteous reign Jasher 3:12 carries forward in the ways of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-reigned-righteous-king'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=44 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-3-adam-died-tree-of-knowledge
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:5 — *And all the days that Adam lived were nine hundred and thirty years: and he died.* the exact age Jasher 3:14 gives for Adam''s death during Enoch''s reign.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-adam-died-tree-of-knowledge'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 4:30 — *And he lacked seventy years of one thousand years; for one thousand years are as one day in the testimony of the heavens and therefore was it written concerning the tree of knowledge: "On the day that you eat thereof you will die."* the very tree-of-knowledge death Jasher 3:16 names as the cause of Adam''s dying.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-adam-died-tree-of-knowledge'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:29 — *And at the close of the nineteenth jubilee... Adam died, and all his sons buried him in the land of his creation, and he was the first to be buried in the earth.* the burial Jasher 3:14 records with Enoch and Methuselah laying Adam in the cave with great pomp.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-adam-died-tree-of-knowledge'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=14
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-3-enoch-translated-taken-up
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* the five-word canon source Jasher 3:36 unfolds into Enoch''s ascent in a whirlwind with chariots of fire.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-translated-taken-up'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* the translation Jasher 3:36 narrates, read as faith in the Renewed Covenant.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-translated-taken-up'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 14:3 — *And I Enoch was carried off in a whirlwind, with a chariot of fire, and the wind lifted me up and bore me into the ends of heaven.* the very whirlwind and chariot of fire Jasher 3:36 gives for Enoch''s ascent, told by Enoch himself.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-translated-taken-up'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=36
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=14 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 4:23 — *And he was taken from amongst the children of men, and we conducted him into the Garden of Eden in majesty and honour, and behold there he writes down the condemnation and judgment of the world* the taking-up Jasher 3:23 sets in motion when the angel calls Enoch to reign in heaven.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-translated-taken-up'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=23
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Enoch 70:1 — *And it came to pass after this that my spirit was translated And it ascended into the heavens: And I saw the holy sons of Elohim (God). They were stepping on flames of fire... And their faces shone like snow.* the heavenly translation Jasher 3:36 records, even the snow Jasher 3:38 finds at the place of his ascent.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-translated-taken-up'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=36
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=70 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-3-enoch-prophesied-judgment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jude 1:14 — *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints,* the prophetic Enoch whose final statutes and judgments Jasher 3:26 has him place before the sons of men.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-prophesied-judgment'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jude 1:15 — *To execute judgment upon all, and to convince all that are ungodly among them of all their ungodly deeds which they have ungodly committed* the coming judgment behind the instruction Jasher 3:26 says Enoch gave for how to live upon earth.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-prophesied-judgment'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 4:19 — *And what was and what will be he saw in a vision of his sleep... he saw and understood everything, and wrote his testimony, and placed the testimony on earth for all the children of men and for their generations.* the parting wisdom Jasher 3:25 has Enoch leave so the sons of men may live.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-prophesied-judgment'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=25
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 4:24 — *he was set as a sign and that he should testify against all the children of men, that he should recount all the deeds of the generations until the day of condemnation.* the witness-to-the-generations role behind Jasher 3:31, where Enoch''s last day teaching bids all men serve Yahuah and walk in his ways.'
  FROM cross_reference_threads t, cross_references x, _session252_ja03_lookup sv, _session252_ja03_lookup tv
 WHERE t.slug='jasher-3-enoch-prophesied-judgment'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=3 AND sv.verse_number=31
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=4 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jasher_04.sql (session252 jasher 4) -----
-- Source anchor: jasher/jasher ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja04 (view _session252_ja04_lookup). Sort band base 55075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-4-methuselah-reigns
  ('jasher', 'jasher', 4, 1, 'canon', 'genesis', 5, 23, 'free', E'Genesis 5:23 — *And all the days of Enoch were three hundred sixty and five years:* the very count Jasher 4:1 repeats for Enoch upon the earth.'),
  ('jasher', 'jasher', 4, 2, 'canon', 'genesis', 5, 24, 'free', E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The canon''s translation of Enoch is the ascent Jasher 4:2 narrates before Methuselah reigns in his place.'),
  ('jasher', 'jasher', 4, 3, 'canon', 'genesis', 5, 25, 'free', E'Genesis 5:25 — *And Methuselah lived an hundred eighty and seven years, and begat Lamech:* the seed-line Jasher 4:3 keeps as Methuselah, taught by Enoch, walks uprightly and teaches the sons of men.'),
  -- thread: jasher-4-corruption-repented
  ('jasher', 'jasher', 4, 7, 'canon', 'genesis', 6, 5, 'free', E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* The whole-earth wickedness Jasher 4:4-7 details as robbing, plundering and rebellion.'),
  ('jasher', 'jasher', 4, 7, 'canon', 'genesis', 6, 6, 'free', E'Genesis 6:6 — *And it repented Yahuah (LORD) that he had made man on the earth, and it grieved him at his heart.* The very grief Jasher 4:7 names when Yahuah repents that he had made man.'),
  ('jasher', 'jasher', 4, 6, 'canon', 'genesis', 3, 18, 'free', E'Genesis 3:18 — *Thorns also and thistles shall it bring forth to thee; and thou shalt eat the herb of the field;* the Eden curse pressed on the rebel earth as thorns and thistles spring where Jasher 4:6 says they did not sow.'),
  -- thread: jasher-4-seth-dies-seedline
  ('jasher', 'jasher', 4, 10, 'canon', 'genesis', 5, 8, 'free', E'Genesis 5:8 — *And all the days of Seth were nine hundred and twelve years: and he died.* The exact nine hundred and twelve years Jasher 4:10 records for Seth the son of Adam.'),
  ('jasher', 'jasher', 4, 9, 'canon', 'genesis', 5, 28, 'free', E'Genesis 5:28 — *And Lamech lived an hundred eighty and two years, and begat a son:* the Lamech of the chosen line whose age Jasher 4:9 fixes at the death of Seth.'),
  -- thread: jasher-4-noah-born-comfort
  ('jasher', 'jasher', 4, 14, 'canon', 'genesis', 5, 29, 'free', E'Genesis 5:29 — *And he called his name Noah, saying, This same shall comfort us concerning our work and toil of our hands, because of the ground which Yahuah (LORD) hath cursed.* The naming Jasher 4:14 expands into Methuselah''s and Lamech''s twin sayings of rest and comfort.'),
  ('jasher', 'jasher', 4, 15, 'canon', 'genesis', 6, 9, 'free', E'Genesis 6:9 — *These are the generations of Noah: Noah was a just man and perfect in his generations, and Noah walked with Elohim (God).* The perfect and upright walk Jasher 4:15 says Noah grew into in the ways of Methuselah.'),
  ('jasher', 'jasher', 4, 15, 'jubilees', 'jubilees', 5, 19, 'extras', E'Jubilees 5:19 — *...no man''s person was accepted save that of Noah alone; for his person was accepted in behalf of his sons... for his heart was righteous in all his ways...* the same righteous Noah Jasher 4:15 says walked perfect and upright with Elohim while all flesh corrupted.'),
  -- thread: jasher-4-watchers-seedwar
  ('jasher', 'jasher', 4, 18, 'canon', 'genesis', 6, 2, 'free', E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The taking of wives by force Jasher 4:18 ascribes to the judges and rulers going to the daughters of men.'),
  ('jasher', 'jasher', 4, 18, 'canon', 'genesis', 6, 11, 'free', E'Genesis 6:11 — *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* The whole-earth corruption of all flesh Jasher 4:18 says Elohim saw upon the earth.'),
  ('jasher', 'jasher', 4, 18, 'enoch', '1-enoch', 6, 2, 'extras', E'1 Enoch 6:2 — *And the angels, the children of the heaven, saw and lusted after them, and said to one another: ''Come, let us choose us wives from among the children of men and beget us children.''* The fallen-ones'' descent Jasher 4:18 narrates as the rulers taking wives by force.'),
  ('jasher', 'jasher', 4, 18, 'enoch', '1-enoch', 8, 2, 'extras', E'1 Enoch 8:2 — *And there arose much godlessness, and they committed fornication, and they were led astray, and became corrupt in all their ways...* the taught corruptions and mixtures Jasher 4:18 says provoked Yahuah and corrupted all flesh.'),
  ('jasher', 'jasher', 4, 18, 'jubilees', 'jubilees', 5, 2, 'extras', E'Jubilees 5:2 — *And lawlessness increased on the earth and all flesh corrupted its way, alike men and cattle and beasts and birds and everything that walks on the earth...* the same mixture of all flesh, men and animals, that Jasher 4:18 says corrupted its ways upon earth.'),
  -- thread: jasher-4-noah-grace-judgment
  ('jasher', 'jasher', 4, 19, 'canon', 'genesis', 6, 7, 'free', E'Genesis 6:7 — *And Yahuah (LORD) said, I will destroy man whom I have created from the face of the earth; both man, and beast, and the creeping thing, and the fowls of the air; for it repenteth me that I have made them.* The blotting-out decree, even to the birds of the air, that Jasher 4:19 records.'),
  ('jasher', 'jasher', 4, 21, 'canon', 'genesis', 6, 8, 'free', E'Genesis 6:8 — *But Noah found grace in the eyes of Yahuah (LORD).* The grace and election Jasher 4:21 expands as Yahuah choosing Noah and his children to raise up seed.'),
  ('jasher', 'jasher', 4, 19, 'canon', 'jude', 1, 6, 'free', E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The judgment on the fallen ones whose corruption Jasher 4 details and Jasher 4:19 brings to the verge of the Flood.'),
  ('jasher', 'jasher', 4, 21, 'canon', '2-peter', 2, 5, 'free', E'2 Peter 2:5 — *And spared not the old world, but saved Noah the eighth person, a preacher of righteousness, bringing in the flood upon the world of the ungodly;* the saving of Noah and the coming flood Jasher 4:20-21 sets up as the righteous die and Noah is chosen.'),
  ('jasher', 'jasher', 4, 21, 'jubilees', 'jubilees', 5, 5, 'extras', E'Jubilees 5:5 — *But Noah found grace before the eyes of Yahuah (God).* The same election of Noah out of the doomed world that Jasher 4:21 declares.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-4-methuselah-reigns',
       E'Enoch translated, Methuselah taught the way',
       E'Jasher opens the chapter on the seed-line: *And all the days that Enoch lived upon earth, were three hundred and sixty-five years* (Jasher 4:1), and *when Enoch had ascended into heaven... they caused him to reign over them in the place of his father* — *Methuselah acted uprightly in the sight of Elohim (God), as his father Enoch had taught him* (Jasher 4:2-3). This is Genesis 5 unfolded: *And all the days of Enoch were three hundred sixty and five years* (Genesis 5:23), *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24). The chosen line is kept and handed on, father to son — Methuselah *begat Lamech* (Genesis 5:25), and Jasher''s self-link Jubilees carries the same generations of the upright fathers. It ain''t new: the canon names the years; Jasher tells us the son walked in them.',
       sv.verse_id, ev.verse_id, 'extras', 55075
  FROM _session252_ja04_lookup sv, _session252_ja04_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=4 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-4-corruption-repented',
       E'The earth corrupted; it repented Yahuah that he had made man',
       E'Now the great corruption: *in the latter days of Methuselah, the sons of men turned from Yahuah (the Lord), they corrupted the earth, they robbed and plundered each other, and they rebelled against Elohim* (Jasher 4:4); they *did not turn from their evil ways... and Yahuah (the Lord) was very wroth, and repented that he had made man* (Jasher 4:7). This is Genesis 6 word for word in its weight: *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually* (Genesis 6:5), *And it repented Yahuah (LORD) that he had made man on the earth, and it grieved him at his heart* (Genesis 6:6). And when Yahuah stops the seed in the ground so that *thorns and thistles were produced which they did not sow* (Jasher 4:6), the curse of Eden is pressed harder upon the rebel earth: *Thorns also and thistles shall it bring forth to thee* (Genesis 3:18). The judgment is announced; the next generation will see the Flood.',
       sv.verse_id, ev.verse_id, 'extras', 55078
  FROM _session252_ja04_lookup sv, _session252_ja04_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=4
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=4 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-4-seth-dies-seedline',
       E'Seth dies — the chosen line measured out',
       E'Jasher marks the death of the firstborn of the elect line: *In those days when Lamech the son of Methuselah was one hundred and sixty years old, Seth the son of Adam died. And all the days that Seth lived, were nine hundred and twelve years, and he died* (Jasher 4:9-10), and *Lamech... took Ashmua, the daughter of Elishaa the son of Enoch his uncle, and she conceived* (Jasher 4:11). This is the book of the generations of Adam still being written: *And all the days of Seth were nine hundred and twelve years: and he died* (Genesis 5:8) — Seth, the appointed seed in place of Abel, the line that runs Adam to Seth to Noah. *And Methuselah lived an hundred eighty and seven years, and begat Lamech* (Genesis 5:25), and *Lamech lived an hundred eighty and two years, and begat a son* (Genesis 5:28). Election precedes confession: the covenant seed is kept and chosen generation by generation.',
       sv.verse_id, ev.verse_id, 'extras', 55081
  FROM _session252_ja04_lookup sv, _session252_ja04_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=9
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=4 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-4-noah-born-comfort',
       E'Noah born — this one shall comfort us',
       E'Into the corrupted earth the chosen seed is born: *the wife of Lamech conceived and bare him a son... And Methuselah called his name Noah, saying, The earth was in his days at rest and free from corruption, and Lamech his father called his name Menachem, saying, This one shall comfort us in our works and miserable toil in the earth, which Elohim had cursed* (Jasher 4:13-14); and *the child grew up... and he went in the ways of his father Methuselah, perfect and upright with Elohim* (Jasher 4:15). The canon gives the naming in one breath: *And he called his name Noah, saying, This same shall comfort us concerning our work and toil of our hands, because of the ground which Yahuah (LORD) hath cursed* (Genesis 5:29). The cursed ground of Jasher 4:6 and the comfort named in Noah are the same hope — and the same Noah of whom the canon will say he *was a just man and perfect in his generations* (Genesis 6:9). The seed-line carries the rest that is coming.',
       sv.verse_id, ev.verse_id, 'extras', 55084
  FROM _session252_ja04_lookup sv, _session252_ja04_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=13
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=4 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-4-watchers-seedwar',
       E'The sons of men, the daughters, and the mixture of all flesh',
       E'Here is the seed-war corruption itself: *their judges and rulers went to the daughters of men and took their wives by force from their husbands according to their choice, and the sons of men in those days took from the cattle of the earth... and taught the mixture of animals of one species with the other, in order therewith to provoke Yahuah (the Lord); and Elohim saw the whole earth and it was corrupt, for all flesh had corrupted its ways upon earth, all men and all animals* (Jasher 4:18). This is Genesis 6 told from the inside: *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose* (Genesis 6:2), *There were giants in the earth in those days...* (Genesis 6:4), *The earth also was corrupt before Elohim (God), and the earth was filled with violence* (Genesis 6:11). The now-live self-links speak the same event: the Watchers *saw and lusted after them, and said... let us choose us wives from among the children of men* (1 Enoch 6:2), and Azazel *taught men to make swords... became corrupt in all their ways* (1 Enoch 8:1-2), while Jubilees records *all flesh corrupted its way... and they began to devour each other* (Jubilees 5:2). The mixture and the violence are one corruption — it ain''t new, three witnesses tell it.',
       sv.verse_id, ev.verse_id, 'extras', 55087
  FROM _session252_ja04_lookup sv, _session252_ja04_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=16
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=4 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-4-noah-grace-judgment',
       E'Noah found grace; the judgment declared',
       E'The chapter closes on grace and the coming judgment: *And Yahuah (the Lord) said, I will blot out man that I created from the face of the earth... for I repent that I made them* (Jasher 4:19); the righteous are taken first, *And all men who walked in the ways of Yahuah (the Lord), died in those days, before Yahuah (the Lord) brought the evil upon man* (Jasher 4:20); and then the election stands: *And Noah found grace in the sight of Yahuah (the Lord), and Yahuah (the Lord) chose him and his children to raise up seed from them upon the face of the whole earth* (Jasher 4:21). The canon gives both halves: *And Yahuah (LORD) said, I will destroy man whom I have created from the face of the earth... for it repenteth me that I have made them* (Genesis 6:7) and *But Noah found grace in the eyes of Yahuah (LORD)* (Genesis 6:8). The fallen ones are *reserved in everlasting chains under darkness unto the judgment of the great day* (Jude 1:6), and Yahuah *spared not the old world, but saved Noah the eighth person... bringing in the flood upon the world of the ungodly* (2 Peter 2:5). Jubilees seals it: *But Noah found grace before the eyes of Yahuah (God)* (Jubilees 5:5) — the chosen seed kept through the judgment.',
       sv.verse_id, ev.verse_id, 'extras', 55090
  FROM _session252_ja04_lookup sv, _session252_ja04_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=19
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=4 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-4-methuselah-reigns
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:23 — *And all the days of Enoch were three hundred sixty and five years:* the very count Jasher 4:1 repeats for Enoch upon the earth.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-methuselah-reigns'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* The canon''s translation of Enoch is the ascent Jasher 4:2 narrates before Methuselah reigns in his place.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-methuselah-reigns'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 5:25 — *And Methuselah lived an hundred eighty and seven years, and begat Lamech:* the seed-line Jasher 4:3 keeps as Methuselah, taught by Enoch, walks uprightly and teaches the sons of men.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-methuselah-reigns'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-4-corruption-repented
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:5 — *And GOD saw that the wickedness of man was great in the earth, and that every imagination of the thoughts of his heart was only evil continually.* The whole-earth wickedness Jasher 4:4-7 details as robbing, plundering and rebellion.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-corruption-repented'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:6 — *And it repented Yahuah (LORD) that he had made man on the earth, and it grieved him at his heart.* The very grief Jasher 4:7 names when Yahuah repents that he had made man.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-corruption-repented'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 3:18 — *Thorns also and thistles shall it bring forth to thee; and thou shalt eat the herb of the field;* the Eden curse pressed on the rebel earth as thorns and thistles spring where Jasher 4:6 says they did not sow.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-corruption-repented'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-4-seth-dies-seedline
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:8 — *And all the days of Seth were nine hundred and twelve years: and he died.* The exact nine hundred and twelve years Jasher 4:10 records for Seth the son of Adam.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-seth-dies-seedline'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 5:28 — *And Lamech lived an hundred eighty and two years, and begat a son:* the Lamech of the chosen line whose age Jasher 4:9 fixes at the death of Seth.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-seth-dies-seedline'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-4-noah-born-comfort
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:29 — *And he called his name Noah, saying, This same shall comfort us concerning our work and toil of our hands, because of the ground which Yahuah (LORD) hath cursed.* The naming Jasher 4:14 expands into Methuselah''s and Lamech''s twin sayings of rest and comfort.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-noah-born-comfort'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:9 — *These are the generations of Noah: Noah was a just man and perfect in his generations, and Noah walked with Elohim (God).* The perfect and upright walk Jasher 4:15 says Noah grew into in the ways of Methuselah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-noah-born-comfort'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 5:19 — *...no man''s person was accepted save that of Noah alone; for his person was accepted in behalf of his sons... for his heart was righteous in all his ways...* the same righteous Noah Jasher 4:15 says walked perfect and upright with Elohim while all flesh corrupted.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-noah-born-comfort'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=15
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-4-watchers-seedwar
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:2 — *That the sons of Elohim (God) saw the daughters of men that they were fair; and they took them wives of all which they chose.* The taking of wives by force Jasher 4:18 ascribes to the judges and rulers going to the daughters of men.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-watchers-seedwar'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:11 — *The earth also was corrupt before Elohim (God), and the earth was filled with violence.* The whole-earth corruption of all flesh Jasher 4:18 says Elohim saw upon the earth.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-watchers-seedwar'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 6:2 — *And the angels, the children of the heaven, saw and lusted after them, and said to one another: ''Come, let us choose us wives from among the children of men and beget us children.''* The fallen-ones'' descent Jasher 4:18 narrates as the rulers taking wives by force.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-watchers-seedwar'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=18
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=6 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 8:2 — *And there arose much godlessness, and they committed fornication, and they were led astray, and became corrupt in all their ways...* the taught corruptions and mixtures Jasher 4:18 says provoked Yahuah and corrupted all flesh.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-watchers-seedwar'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=18
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=8 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 5:2 — *And lawlessness increased on the earth and all flesh corrupted its way, alike men and cattle and beasts and birds and everything that walks on the earth...* the same mixture of all flesh, men and animals, that Jasher 4:18 says corrupted its ways upon earth.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-watchers-seedwar'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=18
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-4-noah-grace-judgment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:7 — *And Yahuah (LORD) said, I will destroy man whom I have created from the face of the earth; both man, and beast, and the creeping thing, and the fowls of the air; for it repenteth me that I have made them.* The blotting-out decree, even to the birds of the air, that Jasher 4:19 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-noah-grace-judgment'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:8 — *But Noah found grace in the eyes of Yahuah (LORD).* The grace and election Jasher 4:21 expands as Yahuah choosing Noah and his children to raise up seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-noah-grace-judgment'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jude 1:6 — *And the angels which kept not their first estate, but left their own habitation, he hath reserved in everlasting chains under darkness unto the judgment of the great day.* The judgment on the fallen ones whose corruption Jasher 4 details and Jasher 4:19 brings to the verge of the Flood.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-noah-grace-judgment'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='jude' AND tv.chapter_number=1 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Peter 2:5 — *And spared not the old world, but saved Noah the eighth person, a preacher of righteousness, bringing in the flood upon the world of the ungodly;* the saving of Noah and the coming flood Jasher 4:20-21 sets up as the righteous die and Noah is chosen.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-noah-grace-judgment'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 5:5 — *But Noah found grace before the eyes of Yahuah (God).* The same election of Noah out of the doomed world that Jasher 4:21 declares.'
  FROM cross_reference_threads t, cross_references x, _session252_ja04_lookup sv, _session252_ja04_lookup tv
 WHERE t.slug='jasher-4-noah-grace-judgment'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=4 AND sv.verse_number=21
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jasher_05.sql (session252 jasher 5) -----
-- Source anchor: jasher/jasher ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja05 (view _session252_ja05_lookup). Sort band base 55100, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-5-seed-line-fathers-die
  ('jasher', 'jasher', 5, 1, 'canon', 'genesis', 5, 8, 'free', E'Genesis 5:8 — *And all the days of Seth were nine hundred and twelve years: and he died.* Jasher''s dying patriarchs are the same chosen Sethite line Genesis numbers and buries before the flood.'),
  ('jasher', 'jasher', 5, 2, 'canon', 'genesis', 5, 14, 'free', E'Genesis 5:14 — *And all the days of Cainan were nine hundred and ten years: and he died.* Genesis gives Cainan''s exact nine hundred and ten years that Jasher 5:2 repeats.'),
  ('jasher', 'jasher', 5, 4, 'canon', 'genesis', 5, 20, 'free', E'Genesis 5:20 — *And all the days of Jared were nine hundred sixty and two years: and he died.* Jared''s nine hundred sixty-two years in Jasher 5:4 stand verbatim with the canon roll of the seed-line.'),
  ('jasher', 'jasher', 5, 5, 'jubilees', 'jubilees', 5, 19, 'extras', E'Jubilees 5:19 — *And as for all those who corrupted their ways and their thoughts before the flood, no man''s person was accepted save that of Noah alone; for his person was accepted in behalf of his sons, whom Elohim (God) saved from the waters of the flood on his account...* The fathers who followed Yahuah die out (Jasher 5:5), leaving Noah alone as the accepted remnant.'),
  -- thread: jasher-5-hundred-twenty-years-warning
  ('jasher', 'jasher', 5, 8, 'canon', 'genesis', 6, 3, 'free', E'Genesis 6:3 — *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years.* Jasher 5:8 unfolds this same hundred and twenty year reprieve as a spoken call to repent.'),
  ('jasher', 'jasher', 5, 9, 'canon', '2-peter', 2, 5, 'free', E'2 Peter 2:5 — *And spared not the old world, but saved Noah the eighth person, a preacher of righteousness, bringing in the flood upon the world of the ungodly.* The apostle names the preaching office Jasher 5:9 shows Noah and Methuselah filling day after day.'),
  ('jasher', 'jasher', 5, 8, 'jubilees', 'jubilees', 5, 8, 'extras', E'Jubilees 5:8 — *And He said "Your spirit will not always abide on man; for they also are flesh and their days shall be one hundred and twenty years."* The same hundred and twenty year decree against corrupted flesh stands in the live Jubilees apparatus beside Jasher 5:8.'),
  -- thread: jasher-5-noah-just-and-perfect-chosen
  ('jasher', 'jasher', 5, 13, 'canon', 'genesis', 6, 9, 'free', E'Genesis 6:9 — *These are the generations of Noah: Noah was a just man and perfect in his generations, and Noah walked with Elohim (God).* Jasher 5:13 repeats the canon''s just-and-perfect verdict that grounds Noah''s election.'),
  ('jasher', 'jasher', 5, 14, 'canon', 'genesis', 6, 8, 'free', E'Genesis 6:8 — *But Noah found grace in the eyes of Yahuah (LORD).* The grace Genesis names is the choosing Jasher 5:14 voices when the LORD bids Noah beget seed.'),
  ('jasher', 'jasher', 5, 13, 'canon', 'hebrews', 11, 7, 'free', E'Hebrews 11:7 — *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith.* The faith-righteousness of the Companion is the same just man Jasher 5:13 says God chose to raise seed.'),
  ('jasher', 'jasher', 5, 17, 'canon', 'genesis', 6, 10, 'free', E'Genesis 6:10 — *And Noah begat three sons, Shem, Ham, and Japheth.* Jasher 5:17 names the same sons through whom the remnant seed is carried past the flood.'),
  -- thread: jasher-5-command-build-the-ark
  ('jasher', 'jasher', 5, 25, 'canon', 'genesis', 6, 13, 'free', E'Genesis 6:13 — *And Elohim (God) said unto Noah, The end of all flesh is come before me; for the earth is filled with violence through them; and, behold, I will destroy them with the earth.* Jasher 5:25 carries the canon''s end-of-all-flesh decree nearly word for word.'),
  ('jasher', 'jasher', 5, 26, 'canon', 'genesis', 6, 14, 'free', E'Genesis 6:14 — *Make thee an ark of gopher wood; rooms shalt thou make in the ark, and shalt pitch it within and without with pitch.* The gopher-wood ark Jasher 5:26 commands is the very ark of the Torah.'),
  ('jasher', 'jasher', 5, 27, 'canon', 'genesis', 6, 15, 'free', E'Genesis 6:15 — *And this is the fashion which thou shalt make it of: The length of the ark shall be three hundred cubits, the breadth of it fifty cubits, and the height of it thirty cubits.* Jasher 5:27 gives the identical three-hundred-by-fifty-by-thirty cubit measure.'),
  ('jasher', 'jasher', 5, 29, 'canon', 'genesis', 6, 17, 'free', E'Genesis 6:17 — *And, behold, I, even I, do bring a flood of waters upon the earth, to destroy all flesh, wherein is the breath of life, from under heaven; and every thing that is in the earth shall die.* Jasher 5:29''s flood of waters destroying all flesh matches the canon''s own threat.'),
  ('jasher', 'jasher', 5, 25, 'canon', 'genesis', 6, 18, 'free', E'Genesis 6:18 — *But with thee will I establish my covenant; and thou shalt come into the ark, thou, and thy sons, and thy wife, and thy sons'' wives with thee.* The covenant of preservation rides on the same word of judgment Jasher 5:25 reports.'),
  -- thread: jasher-5-two-of-every-sort-and-food
  ('jasher', 'jasher', 5, 30, 'canon', 'genesis', 6, 19, 'free', E'Genesis 6:19 — *And of every living thing of all flesh, two of every sort shalt thou bring into the ark, to keep them alive with thee; they shall be male and female.* Jasher 5:30''s two couple of all living things, male and female, is the Torah''s own command to preserve the seed.'),
  ('jasher', 'jasher', 5, 31, 'canon', 'genesis', 6, 21, 'free', E'Genesis 6:21 — *And take thou unto thee of all food that is eaten, and thou shalt gather it to thee; and it shall be for food for thee, and for them.* The provisioning Jasher 5:31 records is the canon''s identical charge to gather food for man and beast.'),
  ('jasher', 'jasher', 5, 33, 'canon', 'genesis', 6, 22, 'free', E'Genesis 6:22 — *Thus did Noah; according to all that Elohim (God) commanded him, so did he.* Jasher 5:33''s obedient ark-building is the Torah''s summary verdict that Noah did all as commanded.'),
  ('jasher', 'jasher', 5, 33, 'jubilees', 'jubilees', 5, 22, 'extras', E'Jubilees 5:22 — *And Noah made the ark in all respects as He commanded him, in the twenty-seventh jubilee of years, in the fifth week in the fifth year (on the new moon of the first month).* The live Jubilees apparatus dates the same obedient ark-building Jasher 5:33 narrates.'),
  -- thread: jasher-5-righteous-seen-before-me
  ('jasher', 'jasher', 5, 35, 'canon', 'genesis', 7, 1, 'free', E'Genesis 7:1 — *And Yahuah (LORD) said unto Noah, Come thou and all thy house into the ark; for thee have I seen righteous before me in this generation.* Jasher''s seen-righteous verdict and household-gathering (5:14, 5:35) lead straight into the canon''s call to enter the ark.'),
  ('jasher', 'jasher', 5, 30, 'canon', 'genesis', 7, 2, 'free', E'Genesis 7:2 — *Of every clean beast thou shalt take to thee by sevens, the male and his female: and of beasts that are not clean by two, the male and his female.* The clean/unclean distinction stands before Sinai — Torah already in force as Jasher 5:30 gathers the living kinds.'),
  ('jasher', 'jasher', 5, 33, 'canon', 'genesis', 7, 5, 'free', E'Genesis 7:5 — *And Noah did according unto all that Yahuah (LORD) commanded him.* The obedient Noah of Jasher 5:33 is the canon''s same man who did all the LORD commanded.'),
  ('jasher', 'jasher', 5, 25, 'enoch', '1-enoch', 10, 2, 'extras', E'1 Enoch 10:2 — *And said to him: ''Go to Noah and tell him in My Name "Hide thyself!" and reveal to him the end that is approaching: that the whole earth will be destroyed, and a deluge is about to come upon the whole earth, and will destroy all that is on it.* The live Enoch apparatus carries the same end-is-coming warning to Noah that Jasher 5:25 reports.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-5-seed-line-fathers-die',
       E'The chosen line dies away — Seth''s sons buried before the flood',
       E'Jasher opens by burying the seed-line generation by generation: *And it was in the eighty-fourth year of the life of Noah, that Enoch the son of Seth died, he was nine hundred and five years old at his death* (Jasher 5:1), then Cainan, Mahlallel, and Jared, *And all who followed Yahuah (the Lord) died in those days, before they saw the evil which Elohim (God) declared to do upon earth* (Jasher 5:5). This is the very roll-call of Genesis 5, the book of the chosen seed Adam→Seth→Noah. Genesis gives the same line and the same lifespans: *And all the days of Cainan were nine hundred and ten years: and he died* (Genesis 5:14), and traces it to Noah''s father Lamech — *And he called his name Noah, saying, This same shall comfort us concerning our work and toil of our hands, because of the ground which Yahuah (LORD) hath cursed* (Genesis 5:29). Jubilees keeps the same righteous remnant frame, that of all the corrupt generation *no man''s person was accepted save that of Noah alone* (Jubilees 5:19). It ain''t new — the election precedes the flood; the righteous are gathered home before the judgment falls.',
       sv.verse_id, ev.verse_id, 'extras', 55100
  FROM _session252_ja05_lookup sv, _session252_ja05_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=5 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-5-hundred-twenty-years-warning',
       E'The hundred and twenty years — Noah and Methuselah preach repentance',
       E'Elohim sends a herald''s grace before the sword: *For thus says Yahuah (the Lord), Behold I give you a period of one hundred and twenty years; if you will turn to me and forsake your evil ways, then will I also turn away from the evil which I told you* (Jasher 5:8), and *Noah and Methuselah spoke all the words of Yahuah (the Lord) to the sons of men, day after day, constantly speaking to them* (Jasher 5:9). This is Genesis 6:3 unfolded into a preaching ministry — *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years* (Genesis 6:3). The New Testament names the office Jasher dramatizes: God *spared not the old world, but saved Noah the eighth person, a preacher of righteousness* (2 Peter 2:5). Jubilees frames the same hundred and twenty years against the corrupted flesh — *Your spirit will not always abide on man; for they also are flesh and their days shall be one hundred and twenty years* (Jubilees 5:8). The longsuffering call goes out first; the door stays open a hundred and twenty years before it shuts.',
       sv.verse_id, ev.verse_id, 'extras', 55103
  FROM _session252_ja05_lookup sv, _session252_ja05_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=6
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=5 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-5-noah-just-and-perfect-chosen',
       E'Noah a just man, perfect — chosen to raise up seed',
       E'The election is stated plainly: *And Noah was a just man, he was perfect in his generation, and Yahuah (the Lord) chose him to raise up seed from his seed upon the face of the earth* (Jasher 5:13), and the LORD commands him to marry and beget — *Take to you a wife, and beget children, for I have seen you righteous before me in this generation* (Jasher 5:14). This is Genesis 6:8-9 carried into Jasher''s narrative: *But Noah found grace in the eyes of Yahuah (LORD)... Noah was a just man and perfect in his generations, and Noah walked with Elohim (God)* (Genesis 6:8-9). The Companion of faith records it as the founding act of trust: *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house... and became heir of the righteousness which is by faith* (Hebrews 11:7). Jasher even names the sons — *he called his name Shem, saying, Elohim has made me a remnant, to raise up seed in the midst of the earth* (Jasher 5:17) — the very triad of Genesis 6:10. Election precedes the ark: God chooses the righteous seed, then preserves it.',
       sv.verse_id, ev.verse_id, 'extras', 55106
  FROM _session252_ja05_lookup sv, _session252_ja05_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=12
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=5 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-5-command-build-the-ark',
       E'Make a large ark of gopher wood — the flood decreed',
       E'The judgment-word and the building command come together: *The end of all flesh is come before me, on account of their evil deeds, and behold I will destroy the earth* (Jasher 5:25), *And do you take to you gopher wood, and go to a certain place and make a large ark... three hundred cubits its length, fifty cubits broad and thirty cubits high* (Jasher 5:26-27). Jasher quotes Genesis almost word for word: *And Elohim (God) said unto Noah, The end of all flesh is come before me; for the earth is filled with violence through them; and, behold, I will destroy them with the earth* (Genesis 6:13), *Make thee an ark of gopher wood... The length of the ark shall be three hundred cubits, the breadth of it fifty cubits, and the height of it thirty cubits* (Genesis 6:14-15). The covenant of preservation belongs to this same word: *But with thee will I establish my covenant; and thou shalt come into the ark* (Genesis 6:18). It ain''t new — the dimensions, the gopher wood, the pitch, the door all stand in the Torah Jasher is retelling.',
       sv.verse_id, ev.verse_id, 'extras', 55109
  FROM _session252_ja05_lookup sv, _session252_ja05_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=25
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=5 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-5-two-of-every-sort-and-food',
       E'Two couple of all living things — gather them and their food',
       E'Noah is told to preserve the living seed of the world: *And you and your household shall go and gather two couple of all living things, male and female, and shall bring them to the ark, to raise up seed from them upon earth* (Jasher 5:30), *And gather to you all food that is eaten by all the animals, that there may be food for you and for them* (Jasher 5:31). Genesis gives the same charge: *And of every living thing of all flesh, two of every sort shalt thou bring into the ark, to keep them alive with thee; they shall be male and female* (Genesis 6:19), and *take thou unto thee of all food that is eaten, and thou shalt gather it to thee; and it shall be for food for thee, and for them* (Genesis 6:21). Jubilees records the obedient builder behind it: *And Noah made the ark in all respects as He commanded him, in the twenty-seventh jubilee of years* (Jubilees 5:22). The same ark, the same pairs, the same provision — preservation of the seed against the day of waters.',
       sv.verse_id, ev.verse_id, 'extras', 55112
  FROM _session252_ja05_lookup sv, _session252_ja05_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=30
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=5 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-5-righteous-seen-before-me',
       E'Seen righteous before me — the call to come into the ark',
       E'Twice the LORD names Noah''s righteousness as the ground of his salvation: *for I have seen you righteous before me in this generation* (Jasher 5:14), and the household is gathered with the maidens chosen for the sons, *as Yahuah (the Lord) had commanded Noah* (Jasher 5:35), down to Methuselah''s death as the waters near (Jasher 5:36). This is Genesis 7''s threshold-word: *And Yahuah (LORD) said unto Noah, Come thou and all thy house into the ark; for thee have I seen righteous before me in this generation* (Genesis 7:1). The clean and unclean enter as the Torah-before-Sinai already distinguished them — *Of every clean beast thou shalt take to thee by sevens, the male and his female: and of beasts that are not clean by two* (Genesis 7:2) — and Noah obeys: *And Noah did according unto all that Yahuah (LORD) commanded him* (Genesis 7:5). 1 Enoch preserves the same warning sent ahead of the deluge: *Go to Noah and tell him in My Name "Hide thyself!" and reveal to him the end that is approaching* (1 Enoch 10:2). The righteous remnant is warned, gathered, and shut in before the world of the ungodly is swept away.',
       sv.verse_id, ev.verse_id, 'extras', 55115
  FROM _session252_ja05_lookup sv, _session252_ja05_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=32
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=5 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-5-seed-line-fathers-die
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:8 — *And all the days of Seth were nine hundred and twelve years: and he died.* Jasher''s dying patriarchs are the same chosen Sethite line Genesis numbers and buries before the flood.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-seed-line-fathers-die'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 5:14 — *And all the days of Cainan were nine hundred and ten years: and he died.* Genesis gives Cainan''s exact nine hundred and ten years that Jasher 5:2 repeats.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-seed-line-fathers-die'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 5:20 — *And all the days of Jared were nine hundred sixty and two years: and he died.* Jared''s nine hundred sixty-two years in Jasher 5:4 stand verbatim with the canon roll of the seed-line.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-seed-line-fathers-die'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 5:19 — *And as for all those who corrupted their ways and their thoughts before the flood, no man''s person was accepted save that of Noah alone; for his person was accepted in behalf of his sons, whom Elohim (God) saved from the waters of the flood on his account...* The fathers who followed Yahuah die out (Jasher 5:5), leaving Noah alone as the accepted remnant.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-seed-line-fathers-die'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-5-hundred-twenty-years-warning
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:3 — *And Yahuah (LORD) said, My spirit shall not always strive with man, for that he also is flesh: yet his days shall be an hundred and twenty years.* Jasher 5:8 unfolds this same hundred and twenty year reprieve as a spoken call to repent.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-hundred-twenty-years-warning'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Peter 2:5 — *And spared not the old world, but saved Noah the eighth person, a preacher of righteousness, bringing in the flood upon the world of the ungodly.* The apostle names the preaching office Jasher 5:9 shows Noah and Methuselah filling day after day.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-hundred-twenty-years-warning'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 5:8 — *And He said "Your spirit will not always abide on man; for they also are flesh and their days shall be one hundred and twenty years."* The same hundred and twenty year decree against corrupted flesh stands in the live Jubilees apparatus beside Jasher 5:8.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-hundred-twenty-years-warning'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-5-noah-just-and-perfect-chosen
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:9 — *These are the generations of Noah: Noah was a just man and perfect in his generations, and Noah walked with Elohim (God).* Jasher 5:13 repeats the canon''s just-and-perfect verdict that grounds Noah''s election.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-noah-just-and-perfect-chosen'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:8 — *But Noah found grace in the eyes of Yahuah (LORD).* The grace Genesis names is the choosing Jasher 5:14 voices when the LORD bids Noah beget seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-noah-just-and-perfect-chosen'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:7 — *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith.* The faith-righteousness of the Companion is the same just man Jasher 5:13 says God chose to raise seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-noah-just-and-perfect-chosen'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 6:10 — *And Noah begat three sons, Shem, Ham, and Japheth.* Jasher 5:17 names the same sons through whom the remnant seed is carried past the flood.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-noah-just-and-perfect-chosen'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-5-command-build-the-ark
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:13 — *And Elohim (God) said unto Noah, The end of all flesh is come before me; for the earth is filled with violence through them; and, behold, I will destroy them with the earth.* Jasher 5:25 carries the canon''s end-of-all-flesh decree nearly word for word.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-command-build-the-ark'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:14 — *Make thee an ark of gopher wood; rooms shalt thou make in the ark, and shalt pitch it within and without with pitch.* The gopher-wood ark Jasher 5:26 commands is the very ark of the Torah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-command-build-the-ark'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 6:15 — *And this is the fashion which thou shalt make it of: The length of the ark shall be three hundred cubits, the breadth of it fifty cubits, and the height of it thirty cubits.* Jasher 5:27 gives the identical three-hundred-by-fifty-by-thirty cubit measure.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-command-build-the-ark'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 6:17 — *And, behold, I, even I, do bring a flood of waters upon the earth, to destroy all flesh, wherein is the breath of life, from under heaven; and every thing that is in the earth shall die.* Jasher 5:29''s flood of waters destroying all flesh matches the canon''s own threat.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-command-build-the-ark'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Genesis 6:18 — *But with thee will I establish my covenant; and thou shalt come into the ark, thou, and thy sons, and thy wife, and thy sons'' wives with thee.* The covenant of preservation rides on the same word of judgment Jasher 5:25 reports.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-command-build-the-ark'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-5-two-of-every-sort-and-food
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 6:19 — *And of every living thing of all flesh, two of every sort shalt thou bring into the ark, to keep them alive with thee; they shall be male and female.* Jasher 5:30''s two couple of all living things, male and female, is the Torah''s own command to preserve the seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-two-of-every-sort-and-food'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 6:21 — *And take thou unto thee of all food that is eaten, and thou shalt gather it to thee; and it shall be for food for thee, and for them.* The provisioning Jasher 5:31 records is the canon''s identical charge to gather food for man and beast.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-two-of-every-sort-and-food'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 6:22 — *Thus did Noah; according to all that Elohim (God) commanded him, so did he.* Jasher 5:33''s obedient ark-building is the Torah''s summary verdict that Noah did all as commanded.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-two-of-every-sort-and-food'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 5:22 — *And Noah made the ark in all respects as He commanded him, in the twenty-seventh jubilee of years, in the fifth week in the fifth year (on the new moon of the first month).* The live Jubilees apparatus dates the same obedient ark-building Jasher 5:33 narrates.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-two-of-every-sort-and-food'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=33
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-5-righteous-seen-before-me
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 7:1 — *And Yahuah (LORD) said unto Noah, Come thou and all thy house into the ark; for thee have I seen righteous before me in this generation.* Jasher''s seen-righteous verdict and household-gathering (5:14, 5:35) lead straight into the canon''s call to enter the ark.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-righteous-seen-before-me'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 7:2 — *Of every clean beast thou shalt take to thee by sevens, the male and his female: and of beasts that are not clean by two, the male and his female.* The clean/unclean distinction stands before Sinai — Torah already in force as Jasher 5:30 gathers the living kinds.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-righteous-seen-before-me'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 7:5 — *And Noah did according unto all that Yahuah (LORD) commanded him.* The obedient Noah of Jasher 5:33 is the canon''s same man who did all the LORD commanded.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-righteous-seen-before-me'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 10:2 — *And said to him: ''Go to Noah and tell him in My Name "Hide thyself!" and reveal to him the end that is approaching: that the whole earth will be destroyed, and a deluge is about to come upon the whole earth, and will destroy all that is on it.* The live Enoch apparatus carries the same end-is-coming warning to Noah that Jasher 5:25 reports.'
  FROM cross_reference_threads t, cross_references x, _session252_ja05_lookup sv, _session252_ja05_lookup tv
 WHERE t.slug='jasher-5-righteous-seen-before-me'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=5 AND sv.verse_number=25
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=10 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jasher_06.sql (session252 jasher 6) -----
-- Source anchor: jasher/jasher ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja06 (view _session252_ja06_lookup). Sort band base 55125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-6-gathering-of-the-beasts
  ('jasher', 'jasher', 6, 9, 'canon', 'genesis', 7, 2, 'free', E'Genesis 7:2 — *Of every clean beast thou shalt take to thee by sevens, the male and his female: and of beasts that are not clean by two, the male and his female.* The clean-by-sevens command Jasher 6:9 retells, the Torah distinction kept before Sinai.'),
  ('jasher', 'jasher', 6, 9, 'canon', 'genesis', 7, 9, 'free', E'Genesis 7:9 — *There went in two and two unto Noah into the ark, the male and the female, as Elohim (God) had commanded Noah.* The two-and-two ingathering of Jasher 6:9, the same scene quoted beside its source.'),
  ('jasher', 'jasher', 6, 8, 'jubilees', 'jubilees', 5, 23, 'extras', E'Jubilees 5:23 — *he entered, and all that we brought to him, into the ark, and Yahuah (God) closed it from without on the seventeenth evening.* Jubilees keeps the same record of the creatures brought in that Jasher 6:8 narrates, both witnesses now live.'),
  -- thread: jasher-6-fountains-of-the-deep-broken-up
  ('jasher', 'jasher', 6, 14, 'canon', 'genesis', 7, 11, 'free', E'Genesis 7:11 — *In the six hundredth year of Noah''s life, in the second month, the seventeenth day of the month, the same day were all the fountains of the great deep broken up, and the windows of heaven were opened.* The fountains and windows of Jasher 6:14, the Genesis source dated to the day.'),
  ('jasher', 'jasher', 6, 14, 'canon', 'genesis', 7, 12, 'free', E'Genesis 7:12 — *And the rain was upon the earth forty days and forty nights.* The forty days and nights Jasher 6:14 carries verbatim from its source.'),
  ('jasher', 'jasher', 6, 14, 'enoch', '1-enoch', 89, 3, 'extras', E'1 Enoch 89:3 — *And I saw again and behold fountains were opened on the earth, in that great enclosure, and that water began to swell and rise upon the earth, and I saw that enclosure till all its surface was covered with water.* Enoch''s Animal Apocalypse sees the same fountains opened that Jasher 6:14 names, the flood-vision live beside it.'),
  ('jasher', 'jasher', 6, 14, 'jubilees', 'jubilees', 5, 23, 'extras', E'Jubilees 5:23 — *And Yahuah (God) opened seven flood-gates of heaven, And the mouths of the fountains of the great deep, seven mouths in number.* Jubilees keeps the same fountains-of-the-deep that Jasher 6:14 reports, the patriarchal record self-linked.'),
  -- thread: jasher-6-yahuah-shut-him-in
  ('jasher', 'jasher', 6, 15, 'canon', 'genesis', 7, 16, 'free', E'Genesis 7:16 — *And they that went in, went in male and female of all flesh, as Elohim (God) had commanded him: and Yahuah (LORD) shut him in.* The very shutting-in of Jasher 6:15, quoted beside its source.'),
  ('jasher', 'jasher', 6, 26, 'canon', 'genesis', 7, 23, 'free', E'Genesis 7:23 — *And every living substance was destroyed which was upon the face of the ground, both man, and cattle, and the creeping things, and the fowl of the heaven; and they were destroyed from the earth: and Noah only remained alive, and they that were with him in the ark.* The death of all flesh and the remnant of Jasher 6:26, the Genesis verdict beside it.'),
  ('jasher', 'jasher', 6, 26, 'enoch', '1-enoch', 89, 6, 'extras', E'1 Enoch 89:6 — *But that vessel floated on the water, while all the oxen and elephants and camels and asses sank to the bottom with all the animals, so that I could no longer see them, and they were not able to escape, (but) perished and sank into the depths.* Enoch''s vision of all the beasts drowned while the vessel floats matches the all-flesh-died of Jasher 6:26.'),
  ('jasher', 'jasher', 6, 15, 'jubilees', 'jubilees', 5, 19, 'extras', E'Jubilees 5:19 — *no man''s person was accepted save that of Noah alone; for his person was accepted in behalf of his sons, whom Elohim (God) saved from the waters of the flood on his account; for his heart was righteous in all his ways.* Jubilees names the same righteous remnant shut into the ark of Jasher 6:15, the election of the seed-line kept.'),
  -- thread: jasher-6-ark-borne-up-and-rested
  ('jasher', 'jasher', 6, 27, 'canon', 'genesis', 7, 17, 'free', E'Genesis 7:17 — *And the flood was forty days upon the earth; and the waters increased, and bare up the ark, and it was lift up above the earth.* The ark borne up of Jasher 6:27, the Genesis source quoted beside it.'),
  ('jasher', 'jasher', 6, 33, 'canon', 'genesis', 8, 1, 'free', E'Genesis 8:1 — *And Elohim (God) remembered Noah, and every living thing, and all the cattle that was with him in the ark: and Elohim (God) made a wind to pass over the earth, and the waters asswaged.* The wind passing and the waters stilling of Jasher 6:33, the canon''s I-remembered-him beside it.'),
  ('jasher', 'jasher', 6, 35, 'canon', 'genesis', 8, 4, 'free', E'Genesis 8:4 — *And the ark rested in the seventh month, on the seventeenth day of the month, upon the mountains of Ararat.* The resting on Ararat of Jasher 6:35, dated to the day in its Genesis source.'),
  ('jasher', 'jasher', 6, 27, 'enoch', '1-enoch', 89, 8, 'extras', E'1 Enoch 89:8 — *Then the water began to run down into these, till the earth became visible; but that vessel settled on the earth, and the darkness retired and light appeared.* Enoch''s vessel settling as the waters run down matches the ark borne up and resting of Jasher 6:27, 6:35.'),
  -- thread: jasher-6-go-forth-blessed-fruitful
  ('jasher', 'jasher', 6, 40, 'canon', 'genesis', 8, 16, 'free', E'Genesis 8:16 — *Go forth of the ark, thou, and thy wife, and thy sons, and thy sons'' wives with thee.* The command to go out that Jasher 6:40 obeys, the Genesis source beside it.'),
  ('jasher', 'jasher', 6, 42, 'canon', 'genesis', 9, 1, 'free', E'Genesis 9:1 — *And Elohim (God) blessed Noah and his sons, and said unto them, Be fruitful, and multiply, and replenish the earth.* The be-fruitful blessing of Jasher 6:42, the Genesis charge to the renewed seed-line.'),
  ('jasher', 'jasher', 6, 42, 'jubilees', 'jubilees', 6, 5, 'extras', E'Jubilees 6:5 — *And you, increase you and multiply upon the earth, and become many upon it, and be a blessing upon it.* Jubilees keeps the same multiply-and-be-a-blessing word that Jasher 6:42 carries, the patriarchal record self-linked.'),
  -- thread: jasher-6-altar-covenant-bow
  ('jasher', 'jasher', 6, 41, 'canon', 'genesis', 8, 20, 'free', E'Genesis 8:20 — *And Noah builded an altar unto Yahuah (LORD); and took of every clean beast, and of every clean fowl, and offered burnt offerings on the altar.* The service of Yahuah that Jasher 6:41 records is the clean-beast altar of Genesis, Torah-worship before Sinai.'),
  ('jasher', 'jasher', 6, 41, 'canon', 'genesis', 8, 21, 'free', E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake; for the imagination of man''s heart is evil from his youth; neither will I again smite any more every thing living, as I have done.* The mercy that follows Noah''s altar in Jasher 6:41, the I-will-not-again of the covenant.'),
  ('jasher', 'jasher', 6, 41, 'canon', 'genesis', 9, 13, 'free', E'Genesis 9:13 — *I do set my bow in the cloud, and it shall be for a token of a covenant between me and the earth.* The bow sealing the covenant that crowns Noah''s service in Jasher 6:41.'),
  ('jasher', 'jasher', 6, 41, 'jubilees', 'jubilees', 6, 4, 'extras', E'Jubilees 6:4 — *And Yahuah (God) smelt the goodly savour, and He made a covenant with him that there should not be any more a flood to destroy the earth.* Jubilees keeps the same altar-savour and no-more-flood covenant that follows the service of Jasher 6:41.'),
  ('jasher', 'jasher', 6, 41, 'jubilees', 'jubilees', 6, 16, 'extras', E'Jubilees 6:16 — *He set His bow in the cloud for a sign of the eternal covenant that there should not again be a flood on the earth to destroy it all the days of the earth.* Jubilees keeps the bow of the eternal covenant that crowns Noah''s going-forth in Jasher 6:41, self-linked.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-6-gathering-of-the-beasts',
       E'Two and two, and the clean by sevens — the beasts gather to the ark',
       E'Jasher tells how the creatures came to Noah of their own accord: *And Noah brought into the ark from all living creatures that were upon earth, so that there was none left but which Noah brought into the ark* (Jasher 6:8), and *Two and two came to Noah into the ark, but from the clean animals, and clean fowls, he brought seven couples, as Elohim (God) had commanded him* (Jasher 6:9). This is the retelling of the Genesis command itself — *Of every clean beast thou shalt take to thee by sevens, the male and his female: and of beasts that are not clean by two, the male and his female* (Genesis 7:2) — and its doing: *There went in two and two unto Noah into the ark, the male and the female, as Elohim (God) had commanded Noah* (Genesis 7:9). Jubilees keeps the same record of the gathering: *he entered, and all that we brought to him, into the ark* (Jubilees 5:23). It ain''t new — the clean-and-unclean distinction stands before Sinai, the Torah carried in the fathers.',
       sv.verse_id, ev.verse_id, 'extras', 55125
  FROM _session252_ja06_lookup sv, _session252_ja06_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=8
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=6 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-6-fountains-of-the-deep-broken-up',
       E'The fountains of the deep broken up — the waters of the flood come',
       E'Jasher dates the storm to the very year Genesis does: *And at the end of seven days, in the six hundredth year of the life of Noah, the waters of the flood were upon the earth* (Jasher 6:13), and *And all the fountains of the deep were broken up, and the windows of heaven were opened, and the rain was upon the earth forty days and forty nights* (Jasher 6:14). This is Genesis word for word — *In the six hundredth year of Noah''s life, in the second month, the seventeenth day of the month, the same day were all the fountains of the great deep broken up, and the windows of heaven were opened* (Genesis 7:11) — and *the rain was upon the earth forty days and forty nights* (Genesis 7:12). The Animal Apocalypse of Enoch saw the same flood as a vision: *And I saw again and behold fountains were opened on the earth, in that great enclosure, and that water began to swell and rise upon the earth* (1 Enoch 89:3). Jubilees agrees the very fountains were opened: *And the mouths of the fountains of the great deep, seven mouths in number* (Jubilees 5:23). It ain''t new — three witnesses, one flood.',
       sv.verse_id, ev.verse_id, 'extras', 55128
  FROM _session252_ja06_lookup sv, _session252_ja06_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=13
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=6 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-6-yahuah-shut-him-in',
       E'Yahuah shut him in — the men shut out, all flesh died',
       E'Jasher records the shutting of the door and the perishing of all flesh: *And Noah and his household, and all the living creatures that were with him, came into the ark on account of the waters of the flood, and Yahuah (the Lord) shut him in* (Jasher 6:15), and *all flesh that was upon the earth or in the waters died, whether men, animals, beasts, creeping things or birds of the air, and there only remained Noah and those that were with him in the ark* (Jasher 6:26). Genesis is the same shutting and the same death: *and Yahuah (LORD) shut him in* (Genesis 7:16), and *And every living substance was destroyed which was upon the face of the ground… and Noah only remained alive, and they that were with him in the ark* (Genesis 7:23). Jasher adds the seven hundred thousand who begged at the door (Jasher 6:17) — the rebellion that said *that he does not exist* (Jasher 6:19) — but the verdict is the canon''s: the door of mercy was shut after a hundred and twenty years of warning. The flood is judgment on the corrupted earth that the Watchers (Jasher 4, 1 Enoch, Jubilees 5) defiled.',
       sv.verse_id, ev.verse_id, 'extras', 55131
  FROM _session252_ja06_lookup sv, _session252_ja06_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=15
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=6 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-6-ark-borne-up-and-rested',
       E'The ark borne up and the wind passes — the waters abate on Ararat',
       E'Jasher tells how the waters lifted the ark and then stilled: *And the waters prevailed and they greatly increased upon the earth, and they lifted up the ark and it was raised from the earth* (Jasher 6:27), and after Noah''s prayer *a wind passed over the earth, and the waters were still and the ark rested* (Jasher 6:33), till *the ark rested upon the mountains of Ararat* (Jasher 6:35). Genesis bears the same lifting, the same wind, the same resting place: *and the waters increased, and bare up the ark, and it was lift up above the earth* (Genesis 7:17); *And Elohim (God) made a wind to pass over the earth, and the waters asswaged* (Genesis 8:1); *And the ark rested in the seventh month, on the seventeenth day of the month, upon the mountains of Ararat* (Genesis 8:4). Enoch''s Animal Apocalypse saw the vessel float and then settle: *But that vessel floated on the water* (1 Enoch 89:6) and *that vessel settled on the earth, and the darkness retired and light appeared* (1 Enoch 89:8). It ain''t new — Yahuah remembered Noah, and the same wind that hovered over the deep at creation passes over it again.',
       sv.verse_id, ev.verse_id, 'extras', 55134
  FROM _session252_ja06_lookup sv, _session252_ja06_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=27
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=6 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-6-go-forth-blessed-fruitful',
       E'Go forth and be fruitful — Noah leaves the ark blessed',
       E'Jasher closes the flood with the going-forth and the blessing: *the earth was dry, but Noah and his sons, and those that were with him, did not go out from the ark until Yahuah (the Lord) told them* (Jasher 6:39); *they all went out from the ark* (Jasher 6:40); *Yahuah (the Lord) blessed Noah and his sons on their going out from the ark* (Jasher 6:41); *And he said to them, Be fruitful and fill all the earth; become strong and increase abundantly in the earth and multiply in it* (Jasher 6:42). Genesis carries the same command to go forth and the same blessing: *Go forth of the ark, thou, and thy wife, and thy sons, and thy sons'' wives with thee* (Genesis 8:16), and *And Elohim (God) blessed Noah and his sons, and said unto them, Be fruitful, and multiply, and replenish the earth* (Genesis 9:1). Jubilees keeps the blessing in the very words: *And you, increase you and multiply upon the earth, and become many upon it, and be a blessing upon it* (Jubilees 6:5). The seed-line goes on — Adam to Seth to Noah to Shem — the chosen line through whom the earth is overspread.',
       sv.verse_id, ev.verse_id, 'extras', 55137
  FROM _session252_ja06_lookup sv, _session252_ja06_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=39
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=6 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-6-altar-covenant-bow',
       E'The altar, the I-will-not-again, and the bow — the covenant after the flood',
       E'Though Jasher 6 ends at the going-forth and the be-fruitful blessing, its scene of Noah preserved and sent out to fill the earth opens directly upon the altar, the sweet savour, and the bow of the covenant in the canon and in Jubilees. Where Jasher records Noah *served Yahuah (the Lord) all their days* (Jasher 6:41) on leaving the ark, Genesis shows what that service was: *And Noah builded an altar unto Yahuah (LORD); and took of every clean beast… and offered burnt offerings on the altar* (Genesis 8:20), and Yahuah''s pledge *I will not again curse the ground any more for man''s sake* (Genesis 8:21), sealed with *I do set my bow in the cloud, and it shall be for a token of a covenant between me and the earth* (Genesis 9:13). Jubilees keeps the altar and the same goodly savour and bow: *And Yahuah (God) smelt the goodly savour, and He made a covenant with him that there should not be any more a flood to destroy the earth* (Jubilees 6:4), and *He set His bow in the cloud for a sign of the eternal covenant* (Jubilees 6:16). The clean-beast altar before Sinai — Torah stands; the fathers kept the way.',
       sv.verse_id, ev.verse_id, 'extras', 55140
  FROM _session252_ja06_lookup sv, _session252_ja06_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=41
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=6 AND ev.verse_number=41
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-6-gathering-of-the-beasts
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 7:2 — *Of every clean beast thou shalt take to thee by sevens, the male and his female: and of beasts that are not clean by two, the male and his female.* The clean-by-sevens command Jasher 6:9 retells, the Torah distinction kept before Sinai.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-gathering-of-the-beasts'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 7:9 — *There went in two and two unto Noah into the ark, the male and the female, as Elohim (God) had commanded Noah.* The two-and-two ingathering of Jasher 6:9, the same scene quoted beside its source.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-gathering-of-the-beasts'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 5:23 — *he entered, and all that we brought to him, into the ark, and Yahuah (God) closed it from without on the seventeenth evening.* Jubilees keeps the same record of the creatures brought in that Jasher 6:8 narrates, both witnesses now live.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-gathering-of-the-beasts'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-6-fountains-of-the-deep-broken-up
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 7:11 — *In the six hundredth year of Noah''s life, in the second month, the seventeenth day of the month, the same day were all the fountains of the great deep broken up, and the windows of heaven were opened.* The fountains and windows of Jasher 6:14, the Genesis source dated to the day.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-fountains-of-the-deep-broken-up'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 7:12 — *And the rain was upon the earth forty days and forty nights.* The forty days and nights Jasher 6:14 carries verbatim from its source.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-fountains-of-the-deep-broken-up'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 89:3 — *And I saw again and behold fountains were opened on the earth, in that great enclosure, and that water began to swell and rise upon the earth, and I saw that enclosure till all its surface was covered with water.* Enoch''s Animal Apocalypse sees the same fountains opened that Jasher 6:14 names, the flood-vision live beside it.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-fountains-of-the-deep-broken-up'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=89 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 5:23 — *And Yahuah (God) opened seven flood-gates of heaven, And the mouths of the fountains of the great deep, seven mouths in number.* Jubilees keeps the same fountains-of-the-deep that Jasher 6:14 reports, the patriarchal record self-linked.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-fountains-of-the-deep-broken-up'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-6-yahuah-shut-him-in
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 7:16 — *And they that went in, went in male and female of all flesh, as Elohim (God) had commanded him: and Yahuah (LORD) shut him in.* The very shutting-in of Jasher 6:15, quoted beside its source.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-yahuah-shut-him-in'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 7:23 — *And every living substance was destroyed which was upon the face of the ground, both man, and cattle, and the creeping things, and the fowl of the heaven; and they were destroyed from the earth: and Noah only remained alive, and they that were with him in the ark.* The death of all flesh and the remnant of Jasher 6:26, the Genesis verdict beside it.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-yahuah-shut-him-in'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 89:6 — *But that vessel floated on the water, while all the oxen and elephants and camels and asses sank to the bottom with all the animals, so that I could no longer see them, and they were not able to escape, (but) perished and sank into the depths.* Enoch''s vision of all the beasts drowned while the vessel floats matches the all-flesh-died of Jasher 6:26.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-yahuah-shut-him-in'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=26
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=89 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 5:19 — *no man''s person was accepted save that of Noah alone; for his person was accepted in behalf of his sons, whom Elohim (God) saved from the waters of the flood on his account; for his heart was righteous in all his ways.* Jubilees names the same righteous remnant shut into the ark of Jasher 6:15, the election of the seed-line kept.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-yahuah-shut-him-in'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=15
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=5 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-6-ark-borne-up-and-rested
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 7:17 — *And the flood was forty days upon the earth; and the waters increased, and bare up the ark, and it was lift up above the earth.* The ark borne up of Jasher 6:27, the Genesis source quoted beside it.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-ark-borne-up-and-rested'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 8:1 — *And Elohim (God) remembered Noah, and every living thing, and all the cattle that was with him in the ark: and Elohim (God) made a wind to pass over the earth, and the waters asswaged.* The wind passing and the waters stilling of Jasher 6:33, the canon''s I-remembered-him beside it.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-ark-borne-up-and-rested'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 8:4 — *And the ark rested in the seventh month, on the seventeenth day of the month, upon the mountains of Ararat.* The resting on Ararat of Jasher 6:35, dated to the day in its Genesis source.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-ark-borne-up-and-rested'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 89:8 — *Then the water began to run down into these, till the earth became visible; but that vessel settled on the earth, and the darkness retired and light appeared.* Enoch''s vessel settling as the waters run down matches the ark borne up and resting of Jasher 6:27, 6:35.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-ark-borne-up-and-rested'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=27
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=89 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-6-go-forth-blessed-fruitful
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 8:16 — *Go forth of the ark, thou, and thy wife, and thy sons, and thy sons'' wives with thee.* The command to go out that Jasher 6:40 obeys, the Genesis source beside it.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-go-forth-blessed-fruitful'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 9:1 — *And Elohim (God) blessed Noah and his sons, and said unto them, Be fruitful, and multiply, and replenish the earth.* The be-fruitful blessing of Jasher 6:42, the Genesis charge to the renewed seed-line.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-go-forth-blessed-fruitful'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 6:5 — *And you, increase you and multiply upon the earth, and become many upon it, and be a blessing upon it.* Jubilees keeps the same multiply-and-be-a-blessing word that Jasher 6:42 carries, the patriarchal record self-linked.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-go-forth-blessed-fruitful'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=42
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-6-altar-covenant-bow
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 8:20 — *And Noah builded an altar unto Yahuah (LORD); and took of every clean beast, and of every clean fowl, and offered burnt offerings on the altar.* The service of Yahuah that Jasher 6:41 records is the clean-beast altar of Genesis, Torah-worship before Sinai.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-altar-covenant-bow'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 8:21 — *And Yahuah (LORD) smelled a sweet savour; and Yahuah (LORD) said in his heart, I will not again curse the ground any more for man''s sake; for the imagination of man''s heart is evil from his youth; neither will I again smite any more every thing living, as I have done.* The mercy that follows Noah''s altar in Jasher 6:41, the I-will-not-again of the covenant.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-altar-covenant-bow'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=8 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 9:13 — *I do set my bow in the cloud, and it shall be for a token of a covenant between me and the earth.* The bow sealing the covenant that crowns Noah''s service in Jasher 6:41.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-altar-covenant-bow'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 6:4 — *And Yahuah (God) smelt the goodly savour, and He made a covenant with him that there should not be any more a flood to destroy the earth.* Jubilees keeps the same altar-savour and no-more-flood covenant that follows the service of Jasher 6:41.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-altar-covenant-bow'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=41
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 6:16 — *He set His bow in the cloud for a sign of the eternal covenant that there should not again be a flood on the earth to destroy it all the days of the earth.* Jubilees keeps the bow of the eternal covenant that crowns Noah''s going-forth in Jasher 6:41, self-linked.'
  FROM cross_reference_threads t, cross_references x, _session252_ja06_lookup sv, _session252_ja06_lookup tv
 WHERE t.slug='jasher-6-altar-covenant-bow'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=6 AND sv.verse_number=41
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=6 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jasher_07.sql (session252 jasher 7) -----
-- Source anchor: jasher/jasher ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja07 (view _session252_ja07_lookup). Sort band base 55150, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-7-three-sons-of-noah
  ('jasher', 'jasher', 7, 1, 'canon', 'genesis', 9, 18, 'free', E'Genesis 9:18 — *And the sons of Noah, that went forth of the ark, were Shem, and Ham, and Japheth: and Ham is the father of Canaan.* The same three brothers Jasher names are the three who came out of the ark in the canon.'),
  ('jasher', 'jasher', 7, 1, 'canon', 'genesis', 9, 19, 'free', E'Genesis 9:19 — *These are the three sons of Noah: and of them was the whole earth overspread.* Jasher 7''s whole genealogy of the nations is the unfolding of this one verse — from the three, all the earth.'),
  ('jasher', 'jasher', 7, 1, 'canon', 'genesis', 10, 1, 'free', E'Genesis 10:1 — *Now these are the generations of the sons of Noah, Shem, Ham, and Japheth: and unto them were sons born after the flood.* Jasher 7:1 is the same heading to the table of nations, the children born after the flood.'),
  ('jasher', 'jasher', 7, 1, 'jubilees', 'jubilees', 8, 10, 'extras', E'Jubilees 8:10 — *And it came to pass in the beginning of the thirty-third jubilee that they divided the earth into three parts, for Shem and Ham and Japheth, according to the inheritance of each, in the first year in the first week, when one of us, who had been sent, was with them.* The live Jubilees apparatus tells the same three-way division of the earth among Noah''s sons.'),
  -- thread: jasher-7-sons-of-japheth
  ('jasher', 'jasher', 7, 2, 'canon', 'genesis', 10, 2, 'free', E'Genesis 10:2 — *The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras.* The same seven sons of Japheth Jasher 7:2 names, in the same order.'),
  ('jasher', 'jasher', 7, 3, 'canon', 'genesis', 10, 3, 'free', E'Genesis 10:3 — *And the sons of Gomer; Ashkenaz, and Riphath, and Togarmah.* Jasher 7:3''s Askinaz, Rephath and Tegarmah are these same three sons of Gomer.'),
  ('jasher', 'jasher', 7, 6, 'canon', 'genesis', 10, 4, 'free', E'Genesis 10:4 — *And the sons of Javan; Elishah, and Tarshish, Kittim, and Dodanim.* Jasher 7:6''s sons of Javan match the canon''s line of Javan exactly.'),
  ('jasher', 'jasher', 7, 9, 'canon', 'genesis', 10, 5, 'free', E'Genesis 10:5 — *By these were the isles of the Gentiles divided in their lands; every one after his tongue, after their families, in their nations.* Jasher closing the families of Japheth with their numbers is the same dividing-into-nations the canon records here.'),
  -- thread: jasher-7-sons-of-ham
  ('jasher', 'jasher', 7, 10, 'canon', 'genesis', 10, 6, 'free', E'Genesis 10:6 — *And the sons of Ham; Cush, and Mizraim, and Phut, and Canaan.* The same four sons of Ham Jasher 7:10 names — Cush, Mitzraim, Phut and Canaan.'),
  ('jasher', 'jasher', 7, 10, 'canon', 'genesis', 10, 7, 'free', E'Genesis 10:7 — *And the sons of Cush; Seba, and Havilah, and Sabtah, and Raamah, and Sabtecha: and the sons of Raamah; Sheba, and Dedan.* Jasher 7:10''s house of Cush, down to Raama''s sons Sheba and Dedan, is the canon''s line of Cush.'),
  ('jasher', 'jasher', 7, 13, 'canon', 'genesis', 10, 15, 'free', E'Genesis 10:15 — *And Canaan begat Sidon his firstborn, and Heth.* Jasher 7:13 opens Canaan''s sons with the same Zidon and Heth the canon names first.'),
  ('jasher', 'jasher', 7, 13, 'canon', 'genesis', 10, 17, 'free', E'Genesis 10:17 — *And the Hivite, and the Arkite, and the Sinite.* Jasher 7:13''s Hivi, Arkee and Seni are these same Canaanite families of the table of nations.'),
  -- thread: jasher-7-sons-of-shem-seed-line
  ('jasher', 'jasher', 7, 15, 'canon', 'genesis', 10, 22, 'free', E'Genesis 10:22 — *The children of Shem; Elam, and Asshur, and Arphaxad, and Lud, and Aram.* The same five sons of Shem Jasher 7:15 names — Elam, Ashur, Arpachshad, Lud and Aram.'),
  ('jasher', 'jasher', 7, 17, 'canon', 'genesis', 10, 23, 'free', E'Genesis 10:23 — *And the children of Aram; Uz, and Hul, and Gether, and Mash.* Jasher 7:17''s sons of Aram — Uz, Chul, Gather and Mash — are the canon''s line of Aram.'),
  ('jasher', 'jasher', 7, 15, 'canon', 'genesis', 10, 21, 'free', E'Genesis 10:21 — *Unto Shem also, the father of all the children of Eber, the brother of Japheth the elder, even to him were children born.* Jasher narrowing to Shem''s house marks the chosen seed-line — Shem the father of the children of Eber, through whom the promise runs.'),
  -- thread: jasher-7-peleg-the-earth-divided
  ('jasher', 'jasher', 7, 18, 'canon', 'genesis', 10, 25, 'free', E'Genesis 10:25 — *And unto Eber were born two sons: the name of one was Peleg; for in his days was the earth divided; and his brother''s name was Joktan.* Jasher 7:18 gives the same Peleg, so named because in his days the earth was divided.'),
  ('jasher', 'jasher', 7, 18, 'canon', 'genesis', 10, 32, 'free', E'Genesis 10:32 — *These are the families of the sons of Noah, after their generations, in their nations: and by these were the nations divided in the earth after the flood.* The whole genealogy of Jasher 7 is the dividing of the nations after the flood the canon seals here.'),
  ('jasher', 'jasher', 7, 18, 'canon', 'deuteronomy', 32, 8, 'free', E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* The dividing in Peleg''s day was the Most High apportioning the nations their inheritance.'),
  ('jasher', 'jasher', 7, 18, 'canon', 'acts', 17, 26, 'free', E'Acts 17:26 — *And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation.* Paul preaches the same truth Jasher 7 narrates — one blood, the bounds of the nations'' habitation set.'),
  ('jasher', 'jasher', 7, 18, 'jubilees', 'jubilees', 8, 8, 'extras', E'Jubilees 8:8 — *And in the sixth year thereof, she bare him a son, and he called his name Peleg; for in the days when he was born the children of Noah began to divide the earth amongst themselves: for this reason he called his name Peleg.* The live Jubilees apparatus names the same Peleg born when the earth was divided.'),
  -- thread: jasher-7-nimrod-shinar-kingdom-of-man
  ('jasher', 'jasher', 7, 18, 'canon', 'genesis', 10, 8, 'free', E'Genesis 10:8 — *And Cush begat Nimrod: he began to be a mighty one in the earth.* Jasher 7:18''s Nimrod, son of Cush, grown mighty in the earth, is the very figure the canon introduces here.'),
  ('jasher', 'jasher', 7, 18, 'canon', 'genesis', 10, 10, 'free', E'Genesis 10:10 — *And the beginning of his kingdom was Babel, and Erech, and Accad, and Calneh, in the land of Shinar.* Jasher 7:18 names Nimrod''s city Shinar and his great kingdom — the canon''s land of Shinar, the beginning of his rebel rule.'),
  ('jasher', 'jasher', 7, 18, 'canon', 'genesis', 11, 1, 'free', E'Genesis 11:1 — *And the whole earth was of one language, and of one speech.* Jasher 7:18''s earth of one tongue gathered under Nimrod is the Babel generation of one language.'),
  ('jasher', 'jasher', 7, 18, 'canon', 'micah', 5, 6, 'free', E'Micah 5:6 — *And they shall waste the land of Assyria with the sword, and the land of Nimrod in the entrances thereof: thus shall he deliver us from the Assyrian, when he cometh into our land, and when he treadeth within our borders.* The prophet still calls the kingdom-of-man Nimrod built ''the land of Nimrod'' — the rebel power undone in the deliverance.'),
  ('jasher', 'jasher', 7, 18, 'jubilees', 'jubilees', 10, 19, 'extras', E'Jubilees 10:19 — *For they departed from the land of Ararat eastward to Shinar; for in his days they built the city and the tower, saying, "Go to, let us ascend thereby into heaven."* The live Jubilees apparatus tells the same city and tower at Shinar that Jasher 7:18 narrates under Nimrod.'),
  -- thread: jasher-7-garments-enoch-terah-abram
  ('jasher', 'jasher', 7, 18, 'canon', 'genesis', 5, 24, 'free', E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* Jasher 7:18''s Enoch ''taken up to Elohim'' is the canon''s Enoch whom God took.'),
  ('jasher', 'jasher', 7, 18, 'canon', 'hebrews', 11, 5, 'free', E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* The witness names the same translation Jasher 7:18 recalls when Enoch was taken up and passed the garments on.'),
  ('jasher', 'jasher', 7, 18, 'canon', 'genesis', 11, 26, 'free', E'Genesis 11:26 — *And Terah lived seventy years, and begat Abram, Nahor, and Haran.* Jasher 7:18 records the same Terah, seventy years old, begetting Abram — the called seed entering the story.'),
  ('jasher', 'jasher', 7, 18, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Abram born to Terah inside Nimrod''s idolatrous Shinar is the seed called out from fathers who served other gods.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-7-three-sons-of-noah',
       E'The sons of Noah, of them the whole earth overspread',
       E'Jasher opens the post-Flood world with the three brothers: *And these are the names of the sons of Noah: Japheth, Ham and Shem; and children were born to them after the flood, for they had taken wives before the flood* (Jasher 7:1). It ain''t new — Genesis says the same, naming the three who went out of the ark: *And the sons of Noah, that went forth of the ark, were Shem, and Ham, and Japheth: and Ham is the father of Canaan* (Genesis 9:18), and from them *of them was the whole earth overspread* (Genesis 9:19). The table of nations begins identically: *Now these are the generations of the sons of Noah, Shem, Ham, and Japheth: and unto them were sons born after the flood* (Genesis 10:1). The same generations are told in the Jubilees apparatus now live beside this, where Noah divides the whole earth among these three sons (Jubilees 8:10). The chosen seed runs forward from this household.',
       sv.verse_id, ev.verse_id, 'extras', 55150
  FROM _session252_ja07_lookup sv, _session252_ja07_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=7 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-7-sons-of-japheth',
       E'The sons of Japheth, the isles of the nations',
       E'Jasher names the seven sons of Japheth: *These are the sons of Japheth; Gomer, Magog, Madai, Javan, Tubal, Meshech, and Tiras, seven sons* (Jasher 7:2), with Gomer''s line — *And the sons of Gomer were Askinaz, Rephath and Tegarmah* (Jasher 7:3) — and Javan''s — *And the sons of Javan were Elisha, Tarshish, Chittim and Dudonim* (Jasher 7:6). It ain''t new: the canon''s table of nations lists the same names. *The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras* (Genesis 10:2); *And the sons of Gomer; Ashkenaz, and Riphath, and Togarmah* (Genesis 10:3); *And the sons of Javan; Elishah, and Tarshish, Kittim, and Dodanim* (Genesis 10:4). From these the nations spread — *By these were the isles of the Gentiles divided in their lands; every one after his tongue, after their families, in their nations* (Genesis 10:5). Jasher simply adds the count of men and a few extra names; the spine is Genesis 10.',
       sv.verse_id, ev.verse_id, 'extras', 55153
  FROM _session252_ja07_lookup sv, _session252_ja07_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=2
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=7 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-7-sons-of-ham',
       E'The sons of Ham, Cush and Canaan',
       E'Jasher lists Ham''s four sons and their houses: *And these are the sons of Ham; Cush, Mitzraim, Phut and Canaan, four sons; and the sons of Cush were Seba, Havilah, Sabta, Raama and Satecha, and the sons of Raama were Sheba and Dedan* (Jasher 7:10), and Canaan''s many sons — *And the sons of Canaan were Zidon, Heth, Amori, Gergashi, Hivi, Arkee, Seni, Arodi, Zimodi and Chamothi* (Jasher 7:13). It ain''t new. The canon names the same fathers: *And the sons of Ham; Cush, and Mizraim, and Phut, and Canaan* (Genesis 10:6); *And the sons of Cush; Seba, and Havilah, and Sabtah, and Raamah, and Sabtecha: and the sons of Raamah; Sheba, and Dedan* (Genesis 10:7); and Canaan''s line — *And Canaan begat Sidon his firstborn, and Heth* (Genesis 10:15) — through *the Hivite, and the Arkite, and the Sinite* (Genesis 10:17). Jasher''s spelling differs, but Zidon, Heth, the Amorite, Girgashite, Hivite, Arkite, Sinite are the canon''s Canaanite families spread abroad.',
       sv.verse_id, ev.verse_id, 'extras', 55156
  FROM _session252_ja07_lookup sv, _session252_ja07_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=10
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=7 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-7-sons-of-shem-seed-line',
       E'The sons of Shem — the chosen seed-line kept',
       E'The genealogy narrows toward the elect line: *And these are the sons of Shem; Elam, Ashur, Arpachshad, Lud and Aram, five sons* (Jasher 7:15), and Aram''s house — *and the sons of Aram were Uz, Chul, Gather and Mash* (Jasher 7:17). It ain''t new: *The children of Shem; Elam, and Asshur, and Arphaxad, and Lud, and Aram* (Genesis 10:22); *And the children of Aram; Uz, and Hul, and Gether, and Mash* (Genesis 10:23). The canon marks Shem as the father of the covenant line — *Unto Shem also, the father of all the children of Eber, the brother of Japheth the elder, even to him were children born* (Genesis 10:21). This is election traced generation by generation: through Shem and Arpachshad the chosen seed runs on toward Eber, Peleg, and Abram, kept and named long before any confession — the line that bears the promise.',
       sv.verse_id, ev.verse_id, 'extras', 55159
  FROM _session252_ja07_lookup sv, _session252_ja07_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=15
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=7 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-7-peleg-the-earth-divided',
       E'Peleg — the nations divided in their lands and tongues',
       E'Within the long verse 18 Jasher records the dividing: Eber''s two sons, *the name of one was Peleg, for in his days the sons of men were divided, and in the latter days, the earth was divided* (Jasher 7:18). It ain''t new: *And unto Eber were born two sons: the name of one was Peleg; for in his days was the earth divided; and his brother''s name was Joktan* (Genesis 10:25), and the whole table closes — *These are the families of the sons of Noah, after their generations, in their nations: and by these were the nations divided in the earth after the flood* (Genesis 10:32). This dividing was no accident but the Most High''s own apportioning: *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8), which the apostle preaches still — *And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation* (Acts 17:26). The live Jubilees apparatus names the same Peleg and the same dividing (Jubilees 8:8) and binds the nations by an oath of their inheritance (Jubilees 9:14).',
       sv.verse_id, ev.verse_id, 'extras', 55162
  FROM _session252_ja07_lookup sv, _session252_ja07_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=7 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-7-nimrod-shinar-kingdom-of-man',
       E'Nimrod — the mighty hunter, Shinar, the kingdom of man',
       E'Inside verse 18 the rebel king arises: Cush *had begotten Nimrod... and when Nimrod was twenty years old he put on those garments. And Nimrod became strong when he put on the garments... and he was a mighty hunter in the earth* (Jasher 7:18), who built Shinar, reigned over all the sons of Noah, *and all the earth was of one tongue and words of union, but Nimrod did not go in the ways of Yahuah (the Lord)... And he made gods of wood and stone, and he bowed down to them* (Jasher 7:18). It ain''t new: *And Cush begat Nimrod: he began to be a mighty one in the earth. He was a mighty hunter before Yahuah (LORD)* (Genesis 10:8-9), *And the beginning of his kingdom was Babel, and Erech, and Accad, and Calneh, in the land of Shinar* (Genesis 10:10). Jasher''s one-tongued earth gathering to Nimrod''s city is the Babel scene: *And the whole earth was of one language, and of one speech* (Genesis 11:1); *let us build us a city and a tower... lest we be scattered abroad* (Genesis 11:4); *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth* (Genesis 11:8). The live Jubilees apparatus tells the same tower at Shinar and its overthrow (Jubilees 10:19-22). Nimrod is the kingdom-of-man pattern Scripture still names against — *the land of Nimrod* (Micah 5:6).',
       sv.verse_id, ev.verse_id, 'extras', 55165
  FROM _session252_ja07_lookup sv, _session252_ja07_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=7 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-7-garments-enoch-terah-abram',
       E'Adam''s garments, Enoch translated, and the birth of Abram',
       E'Verse 18 carries two threads the chosen line will need. First the garments: *the garments of skin which Elohim made for Adam and his wife... were given to Enoch, the son of Jared, and when Enoch was taken up to Elohim, he gave them to Methuselah, his son* (Jasher 7:18). Enoch''s being taken up is the canon''s own — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him* (Genesis 5:24), which the witness names as translation by faith: *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him* (Hebrews 11:5). The same Enoch-translated event is woven heavily in Jasher 3 and the live 1 Enoch and Jubilees apparatus. Then the elect line surfaces against Nimrod''s kingdom: *Terah was seventy years old when he begat him, and Terah called the name of his son that was born to him Abram* (Jasher 7:18). It ain''t new: *And Terah lived seventy years, and begat Abram, Nahor, and Haran* (Genesis 11:26). And the canon remembers Terah served other gods — *even Terah, the father of Abraham... and they served other gods* (Joshua 24:2) — out of which the called seed Abram is taken: the wheat among the tares of Nimrod''s Babel.',
       sv.verse_id, ev.verse_id, 'extras', 55168
  FROM _session252_ja07_lookup sv, _session252_ja07_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=7 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-7-three-sons-of-noah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 9:18 — *And the sons of Noah, that went forth of the ark, were Shem, and Ham, and Japheth: and Ham is the father of Canaan.* The same three brothers Jasher names are the three who came out of the ark in the canon.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-three-sons-of-noah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 9:19 — *These are the three sons of Noah: and of them was the whole earth overspread.* Jasher 7''s whole genealogy of the nations is the unfolding of this one verse — from the three, all the earth.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-three-sons-of-noah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 10:1 — *Now these are the generations of the sons of Noah, Shem, Ham, and Japheth: and unto them were sons born after the flood.* Jasher 7:1 is the same heading to the table of nations, the children born after the flood.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-three-sons-of-noah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 8:10 — *And it came to pass in the beginning of the thirty-third jubilee that they divided the earth into three parts, for Shem and Ham and Japheth, according to the inheritance of each, in the first year in the first week, when one of us, who had been sent, was with them.* The live Jubilees apparatus tells the same three-way division of the earth among Noah''s sons.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-three-sons-of-noah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=8 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-7-sons-of-japheth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:2 — *The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras.* The same seven sons of Japheth Jasher 7:2 names, in the same order.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-sons-of-japheth'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 10:3 — *And the sons of Gomer; Ashkenaz, and Riphath, and Togarmah.* Jasher 7:3''s Askinaz, Rephath and Tegarmah are these same three sons of Gomer.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-sons-of-japheth'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 10:4 — *And the sons of Javan; Elishah, and Tarshish, Kittim, and Dodanim.* Jasher 7:6''s sons of Javan match the canon''s line of Javan exactly.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-sons-of-japheth'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 10:5 — *By these were the isles of the Gentiles divided in their lands; every one after his tongue, after their families, in their nations.* Jasher closing the families of Japheth with their numbers is the same dividing-into-nations the canon records here.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-sons-of-japheth'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-7-sons-of-ham
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:6 — *And the sons of Ham; Cush, and Mizraim, and Phut, and Canaan.* The same four sons of Ham Jasher 7:10 names — Cush, Mitzraim, Phut and Canaan.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-sons-of-ham'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 10:7 — *And the sons of Cush; Seba, and Havilah, and Sabtah, and Raamah, and Sabtecha: and the sons of Raamah; Sheba, and Dedan.* Jasher 7:10''s house of Cush, down to Raama''s sons Sheba and Dedan, is the canon''s line of Cush.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-sons-of-ham'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 10:15 — *And Canaan begat Sidon his firstborn, and Heth.* Jasher 7:13 opens Canaan''s sons with the same Zidon and Heth the canon names first.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-sons-of-ham'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 10:17 — *And the Hivite, and the Arkite, and the Sinite.* Jasher 7:13''s Hivi, Arkee and Seni are these same Canaanite families of the table of nations.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-sons-of-ham'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-7-sons-of-shem-seed-line
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:22 — *The children of Shem; Elam, and Asshur, and Arphaxad, and Lud, and Aram.* The same five sons of Shem Jasher 7:15 names — Elam, Ashur, Arpachshad, Lud and Aram.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-sons-of-shem-seed-line'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 10:23 — *And the children of Aram; Uz, and Hul, and Gether, and Mash.* Jasher 7:17''s sons of Aram — Uz, Chul, Gather and Mash — are the canon''s line of Aram.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-sons-of-shem-seed-line'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 10:21 — *Unto Shem also, the father of all the children of Eber, the brother of Japheth the elder, even to him were children born.* Jasher narrowing to Shem''s house marks the chosen seed-line — Shem the father of the children of Eber, through whom the promise runs.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-sons-of-shem-seed-line'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-7-peleg-the-earth-divided
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:25 — *And unto Eber were born two sons: the name of one was Peleg; for in his days was the earth divided; and his brother''s name was Joktan.* Jasher 7:18 gives the same Peleg, so named because in his days the earth was divided.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-peleg-the-earth-divided'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 10:32 — *These are the families of the sons of Noah, after their generations, in their nations: and by these were the nations divided in the earth after the flood.* The whole genealogy of Jasher 7 is the dividing of the nations after the flood the canon seals here.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-peleg-the-earth-divided'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* The dividing in Peleg''s day was the Most High apportioning the nations their inheritance.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-peleg-the-earth-divided'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 17:26 — *And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation.* Paul preaches the same truth Jasher 7 narrates — one blood, the bounds of the nations'' habitation set.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-peleg-the-earth-divided'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=17 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 8:8 — *And in the sixth year thereof, she bare him a son, and he called his name Peleg; for in the days when he was born the children of Noah began to divide the earth amongst themselves: for this reason he called his name Peleg.* The live Jubilees apparatus names the same Peleg born when the earth was divided.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-peleg-the-earth-divided'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=8 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-7-nimrod-shinar-kingdom-of-man
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:8 — *And Cush begat Nimrod: he began to be a mighty one in the earth.* Jasher 7:18''s Nimrod, son of Cush, grown mighty in the earth, is the very figure the canon introduces here.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-nimrod-shinar-kingdom-of-man'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 10:10 — *And the beginning of his kingdom was Babel, and Erech, and Accad, and Calneh, in the land of Shinar.* Jasher 7:18 names Nimrod''s city Shinar and his great kingdom — the canon''s land of Shinar, the beginning of his rebel rule.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-nimrod-shinar-kingdom-of-man'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 11:1 — *And the whole earth was of one language, and of one speech.* Jasher 7:18''s earth of one tongue gathered under Nimrod is the Babel generation of one language.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-nimrod-shinar-kingdom-of-man'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Micah 5:6 — *And they shall waste the land of Assyria with the sword, and the land of Nimrod in the entrances thereof: thus shall he deliver us from the Assyrian, when he cometh into our land, and when he treadeth within our borders.* The prophet still calls the kingdom-of-man Nimrod built ''the land of Nimrod'' — the rebel power undone in the deliverance.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-nimrod-shinar-kingdom-of-man'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=5 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 10:19 — *For they departed from the land of Ararat eastward to Shinar; for in his days they built the city and the tower, saying, "Go to, let us ascend thereby into heaven."* The live Jubilees apparatus tells the same city and tower at Shinar that Jasher 7:18 narrates under Nimrod.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-nimrod-shinar-kingdom-of-man'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-7-garments-enoch-terah-abram
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 5:24 — *And Enoch walked with Elohim (God): and he was not; for Elohim (God) took him.* Jasher 7:18''s Enoch ''taken up to Elohim'' is the canon''s Enoch whom God took.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-garments-enoch-terah-abram'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=5 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:5 — *By faith Enoch was translated that he should not see death; and was not found, because Elohim (God) had translated him: for before his translation he had this testimony, that he pleased Elohim (God).* The witness names the same translation Jasher 7:18 recalls when Enoch was taken up and passed the garments on.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-garments-enoch-terah-abram'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 11:26 — *And Terah lived seventy years, and begat Abram, Nahor, and Haran.* Jasher 7:18 records the same Terah, seventy years old, begetting Abram — the called seed entering the story.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-garments-enoch-terah-abram'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Abram born to Terah inside Nimrod''s idolatrous Shinar is the seed called out from fathers who served other gods.'
  FROM cross_reference_threads t, cross_references x, _session252_ja07_lookup sv, _session252_ja07_lookup tv
 WHERE t.slug='jasher-7-garments-enoch-terah-abram'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=7 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jasher_08.sql (session252 jasher 8) -----
-- Source anchor: jasher/jasher ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja08 (view _session252_ja08_lookup). Sort band base 55175, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja08_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-8-the-star-and-the-magi
  ('jasher', 'jasher', 8, 2, 'canon', 'matthew', 2, 2, 'free', E'Matthew 2:2 — *Saying, Where is he that is born King of the Yahudim (Jews)? for we have seen his star in the east, and are come to worship him.* The same eastern stargazers reading a King''s birth in a star that Jasher sets over Abram''s cradle.'),
  ('jasher', 'jasher', 8, 2, 'canon', 'matthew', 2, 1, 'free', E'Matthew 2:1 — *Now when Yahusha (Jesus) was born in Bethlehem of Judaea in the days of Herod the king, behold, there came wise men from the east to Jerusalem.* The wise-men-from-the-east-at-a-royal-birth motif Jasher gives Abram is carried into the Messiah''s nativity.'),
  ('jasher', 'jasher', 8, 4, 'canon', 'genesis', 12, 2, 'free', E'Genesis 12:2 — *And I will make of thee a great nation, and I will bless thee, and make thy name great; and thou shalt be a blessing.* The destiny the magi read in the star is the very covenant Yahuah would speak over Abram.'),
  ('jasher', 'jasher', 8, 2, 'jubilees', 'jubilees', 12, 16, 'extras', E'Jubilees 12:16 — *And in the sixth week, in the fifth year thereof, Abram sat up throughout the night on the new moon of the seventh month to observe the stars from the evening to the morning, in order to see what would be the character of the year with regard to the rains, and he was alone as he sat and observed.* The same star-watching Chaldean world that frames Abram''s birth in Jasher; Jubilees has Abram himself reading the heavens.'),
  -- thread: jasher-8-nimrod-seeks-the-childs-life
  ('jasher', 'jasher', 8, 16, 'canon', 'exodus', 1, 22, 'free', E'Exodus 1:22 — *And Pharaoh charged all his people, saying, Every son that is born ye shall cast into the river, and every daughter ye shall save alive.* Pharaoh''s edict against the Hebrew sons is the same kingdom-of-man move Nimrod makes against the infant Abram.'),
  ('jasher', 'jasher', 8, 13, 'canon', 'matthew', 2, 16, 'free', E'Matthew 2:16 — *Then Herod, when he saw that he was mocked of the wise men, was exceeding wroth, and sent forth, and slew all the children that were in Bethlehem, and in all the coasts thereof, from two years old and under, according to the time which he had diligently enquired of the wise men.* Herod, warned by stargazers of a King''s birth, slays the children — Nimrod''s plot against Abram replayed against the Messiah.'),
  ('jasher', 'jasher', 8, 16, 'canon', 'exodus', 1, 16, 'free', E'Exodus 1:16 — *And he said, When ye do the office of a midwife to the Hebrew women, and see them upon the stools; if it be a son, then ye shall kill him: but if it be a daughter, then she shall live.* The tyrant-king ordering the slaying of the newborn son to crush the seed — the exact menace Nimrod presses on Terah.'),
  -- thread: jasher-8-nimrod-kingdom-of-man
  ('jasher', 'jasher', 8, 32, 'canon', 'genesis', 10, 8, 'free', E'Genesis 10:8 — *And Cush begat Nimrod: he began to be a mighty one in the earth.* The canon''s own naming of the tyrant whose murderous reach over Terah''s house Jasher dramatizes.'),
  ('jasher', 'jasher', 8, 32, 'canon', 'genesis', 10, 10, 'free', E'Genesis 10:10 — *And the beginning of his kingdom was Babel, and Erech, and Accad, and Calneh, in the land of Shinar.* Babel is Nimrod''s throne; the king threatening Terah is the founder of the kingdom-of-man.'),
  ('jasher', 'jasher', 8, 32, 'canon', 'genesis', 11, 4, 'free', E'Genesis 11:4 — *And they said, Go to, let us build us a city and a tower, whose top may reach unto heaven; and let us make us a name, lest we be scattered abroad upon the face of the whole earth.* The name-making rebellion of Babel is the spirit of Nimrod''s kingdom set against the chosen seed.'),
  ('jasher', 'jasher', 8, 32, 'jubilees', 'jubilees', 11, 2, 'extras', E'Jubilees 11:2 — *And the sons of Noah began to war on each other, to take captive and to slay each other, and to shed the blood of men on the earth, and to eat blood, and to build strong cities, and walls, and towers, and individuals (began) to exalt themselves above the nation, and to found the beginnings of kingdoms, and to go to war people against people, and nation against nation, and city against city, and all (began) to do evil.* The Jubilees portrait of the kingdoms-of-man rising in Nimrod''s generation — the very throne menacing Abram''s house.'),
  -- thread: jasher-8-yahuah-preserves-the-seed
  ('jasher', 'jasher', 8, 35, 'canon', 'exodus', 2, 2, 'free', E'Exodus 2:2 — *And the woman conceived, and bare a son: and when she saw him that he was a goodly child, she hid him three months.* Moses hidden from Pharaoh''s death-edict is the canon''s same deliverer-concealed pattern as Abram hidden in the cave from Nimrod.'),
  ('jasher', 'jasher', 8, 36, 'canon', 'matthew', 2, 14, 'free', E'Matthew 2:14 — *When he arose, he took the young child and his mother by night, and departed into Egypt.* The Messiah-child taken by night and hidden from the murdering king — Yahuah preserving the seed exactly as He hides Abram from Nimrod.'),
  ('jasher', 'jasher', 8, 34, 'canon', 'exodus', 2, 24, 'free', E'Exodus 2:24 — *And Elohim (God) heard their groaning, and Elohim (God) remembered his covenant with Abraham, with Isaac, and with Jacob.* The covenant Yahuah keeps in Exodus is the very seed He shields in the cave so Nimrod cannot end it before Abraham.'),
  -- thread: jasher-8-terah-the-idolater-father
  ('jasher', 'jasher', 8, 28, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* The canon confirms Jasher''s Terah — Nimrod''s idol-serving prince — as the house out of which Yahuah calls the chosen seed.'),
  ('jasher', 'jasher', 8, 28, 'jubilees', 'jubilees', 12, 2, 'extras', E'Jubilees 12:2 — *Worship the Elohim (God) of heaven, Who causes the rain and the dew to descend on the earth, And does everything upon the earth... Why do you worship things that have no spirit in them?* Jubilees gives the same father — an idolater Abram must rebuke — that Jasher shows bargaining with Nimrod.'),
  ('jasher', 'jasher', 8, 31, 'jubilees', 'jubilees', 12, 7, 'extras', E'Jubilees 12:7 — *And if I tell them the truth, they will slay me; for their soul cleaves to them to worship them and honour them. Keep silent, my son, lest they slay you.* Terah''s fear of the people matches Jasher''s Terah trembling before Nimrod''s threat over his household.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja08_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja08_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-8-the-star-and-the-magi',
       E'The star that swallowed four stars — the magi read a King''s birth',
       E'On the night Abram is born the wise men and conjurors of Nimrod *lifted up their eyes toward heaven that night to look at the stars, and they saw, and behold one very large star came from the east and ran in the heavens, and he swallowed up the four stars from the four sides of the heavens* (Jasher 8:2), and they read in it a child *who will grow up and be fruitful, and multiply, and possess all the earth, he and his children for ever* (Jasher 8:4). It ain''t new: the canon already knows this scene with the roles inverted toward the Seed of Abram. *Now when Yahusha (Jesus) was born in Bethlehem of Judaea in the days of Herod the king, behold, there came wise men from the east to Jerusalem* (Matthew 2:1) — eastern stargazers reading a royal birth in the heavens — *Saying, Where is he that is born King of the Yahudim (Jews)? for we have seen his star in the east, and are come to worship him* (Matthew 2:2). The covenant promise the star encodes is Genesis 12: *And I will make of thee a great nation, and I will bless thee, and make thy name great; and thou shalt be a blessing* (Genesis 12:2). Jubilees keeps the same astronomy-watching father-line, for Abram too *sat up throughout the night on the new moon of the seventh month to observe the stars from the evening to the morning* (Jubilees 12:16) — the heavens declaring the chosen seed.',
       sv.verse_id, ev.verse_id, 'extras', 55175
  FROM _session252_ja08_lookup sv, _session252_ja08_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=2
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=8 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-8-nimrod-seeks-the-childs-life',
       E'Nimrod demands the child be slain — the tyrant against the seed',
       E'Hearing the omen, Nimrod''s counsel is murder: *give me the child, that we may slay him before his evil springs up against us, and I will give you for his value, your house full of silver and gold* (Jasher 8:16). The kingdom-of-man moves to kill the chosen seed in the cradle — the antichrist pattern the canon repeats twice over. Pharaoh first: *And Pharaoh charged all his people, saying, Every son that is born ye shall cast into the river, and every daughter ye shall save alive* (Exodus 1:22), the tyrant slaying the Hebrew sons to choke the covenant nation. Then Herod, the wise men''s star turned against the child: *Then Herod, when he saw that he was mocked of the wise men, was exceeding wroth, and sent forth, and slew all the children that were in Bethlehem, and in all the coasts thereof, from two years old and under, according to the time which he had diligently enquired of the wise men* (Matthew 2:16). Nimrod, Pharaoh, Herod — one rebel kingdom-of-man across the ages, and each time the child it hunts is the one *whose top may reach unto heaven* in Yahuah''s purpose, not in Babel''s (Genesis 11:4). The tyrant strikes; the seed is preserved.',
       sv.verse_id, ev.verse_id, 'extras', 55178
  FROM _session252_ja08_lookup sv, _session252_ja08_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=13
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=8 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-8-nimrod-kingdom-of-man',
       E'Nimrod the rebel king — Babel''s builder against the chosen line',
       E'The whole scene turns on who Nimrod is: the king whose conjurors fear a rival, who buys infants for slaughter, the tyrant whose word is *should you not do this, I will send and slay all you have in your house, so that you shall not even have a dog remaining* (Jasher 8:32). The canon names him exactly — the first kingdom-of-man. *And Cush begat Nimrod: he began to be a mighty one in the earth* (Genesis 10:8), *And the beginning of his kingdom was Babel, and Erech, and Accad, and Calneh, in the land of Shinar* (Genesis 10:10): Babel is his throne. And Babel''s spirit is the name-making rebellion: *And they said, Go to, let us build us a city and a tower, whose top may reach unto heaven; and let us make us a name, lest we be scattered abroad upon the face of the whole earth* (Genesis 11:4). Jubilees frames the same hour — the rise of the kingdoms of man out of Noah''s sons: *individuals (began) to exalt themselves above the nation, and to found the beginnings of kingdoms, and to go to war people against people* (Jubilees 11:2). Nimrod is that exaltation made flesh, and the seed of Abram is the line Yahuah sets against it.',
       sv.verse_id, ev.verse_id, 'extras', 55181
  FROM _session252_ja08_lookup sv, _session252_ja08_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=32
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=8 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-8-yahuah-preserves-the-seed',
       E'Yahuah was with Terah — the chosen seed hidden and kept',
       E'The tyrant''s edict fails because election precedes everything: *And Yahuah (the Lord) was with Terah in this matter, that Nimrod might not cause Abram''s death... and this was concealed from him from that day... as it was the will of Providence not to suffer Abram''s death* (Jasher 8:34), and Abram is hidden in a cave where *Yahuah (the Lord) was with Abram in the cave and he grew up* (Jasher 8:36). The canon already keeps a hunted deliverer this exact way: *And the woman conceived, and bare a son: and when she saw him that he was a goodly child, she hid him three months* (Exodus 2:2). And the Messiah-child is hidden from the murdering king by the same hand: *When he arose, he took the young child and his mother by night, and departed into Egypt: And was there until the death of Herod* (Matthew 2:14-15). It ain''t new — Yahuah conceals and preserves the chosen seed under the tyrant''s nose, from Abram to Moses to the Messiah. The hiding is not retreat but election kept.',
       sv.verse_id, ev.verse_id, 'extras', 55184
  FROM _session252_ja08_lookup sv, _session252_ja08_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=34
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=8 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-8-terah-the-idolater-father',
       E'Terah before the king — the idol-serving father of the called seed',
       E'Jasher shows Terah as Nimrod''s man, *the prince of your host* (Jasher 8:9), bargaining with the tyrant and at last yielding *yea, even my son, he is in the king''s power* (Jasher 8:28) — the idolater father out of whom Yahuah will call the seed. The canon never hides this: *Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods* (Joshua 24:2). Election runs through, not around, an idol-serving house. Jubilees presses the same point — Abram confronting his father: *Worship the Elohim (God) of heaven, Who causes the rain and the dew to descend on the earth... Why do you worship things that have no spirit in them?* (Jubilees 12:2), to which Terah answers that he serves idols only for fear of the people who *will slay me* (Jubilees 12:7). Out of that compromised house Yahuah takes Abram — election precedes the confession.',
       sv.verse_id, ev.verse_id, 'extras', 55187
  FROM _session252_ja08_lookup sv, _session252_ja08_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=28
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=8 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-8-the-star-and-the-magi
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 2:2 — *Saying, Where is he that is born King of the Yahudim (Jews)? for we have seen his star in the east, and are come to worship him.* The same eastern stargazers reading a King''s birth in a star that Jasher sets over Abram''s cradle.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-the-star-and-the-magi'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 2:1 — *Now when Yahusha (Jesus) was born in Bethlehem of Judaea in the days of Herod the king, behold, there came wise men from the east to Jerusalem.* The wise-men-from-the-east-at-a-royal-birth motif Jasher gives Abram is carried into the Messiah''s nativity.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-the-star-and-the-magi'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 12:2 — *And I will make of thee a great nation, and I will bless thee, and make thy name great; and thou shalt be a blessing.* The destiny the magi read in the star is the very covenant Yahuah would speak over Abram.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-the-star-and-the-magi'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 12:16 — *And in the sixth week, in the fifth year thereof, Abram sat up throughout the night on the new moon of the seventh month to observe the stars from the evening to the morning, in order to see what would be the character of the year with regard to the rains, and he was alone as he sat and observed.* The same star-watching Chaldean world that frames Abram''s birth in Jasher; Jubilees has Abram himself reading the heavens.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-the-star-and-the-magi'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=12 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-8-nimrod-seeks-the-childs-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:22 — *And Pharaoh charged all his people, saying, Every son that is born ye shall cast into the river, and every daughter ye shall save alive.* Pharaoh''s edict against the Hebrew sons is the same kingdom-of-man move Nimrod makes against the infant Abram.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-nimrod-seeks-the-childs-life'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 2:16 — *Then Herod, when he saw that he was mocked of the wise men, was exceeding wroth, and sent forth, and slew all the children that were in Bethlehem, and in all the coasts thereof, from two years old and under, according to the time which he had diligently enquired of the wise men.* Herod, warned by stargazers of a King''s birth, slays the children — Nimrod''s plot against Abram replayed against the Messiah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-nimrod-seeks-the-childs-life'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 1:16 — *And he said, When ye do the office of a midwife to the Hebrew women, and see them upon the stools; if it be a son, then ye shall kill him: but if it be a daughter, then she shall live.* The tyrant-king ordering the slaying of the newborn son to crush the seed — the exact menace Nimrod presses on Terah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-nimrod-seeks-the-childs-life'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-8-nimrod-kingdom-of-man
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:8 — *And Cush begat Nimrod: he began to be a mighty one in the earth.* The canon''s own naming of the tyrant whose murderous reach over Terah''s house Jasher dramatizes.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-nimrod-kingdom-of-man'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 10:10 — *And the beginning of his kingdom was Babel, and Erech, and Accad, and Calneh, in the land of Shinar.* Babel is Nimrod''s throne; the king threatening Terah is the founder of the kingdom-of-man.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-nimrod-kingdom-of-man'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 11:4 — *And they said, Go to, let us build us a city and a tower, whose top may reach unto heaven; and let us make us a name, lest we be scattered abroad upon the face of the whole earth.* The name-making rebellion of Babel is the spirit of Nimrod''s kingdom set against the chosen seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-nimrod-kingdom-of-man'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 11:2 — *And the sons of Noah began to war on each other, to take captive and to slay each other, and to shed the blood of men on the earth, and to eat blood, and to build strong cities, and walls, and towers, and individuals (began) to exalt themselves above the nation, and to found the beginnings of kingdoms, and to go to war people against people, and nation against nation, and city against city, and all (began) to do evil.* The Jubilees portrait of the kingdoms-of-man rising in Nimrod''s generation — the very throne menacing Abram''s house.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-nimrod-kingdom-of-man'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=32
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=11 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-8-yahuah-preserves-the-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 2:2 — *And the woman conceived, and bare a son: and when she saw him that he was a goodly child, she hid him three months.* Moses hidden from Pharaoh''s death-edict is the canon''s same deliverer-concealed pattern as Abram hidden in the cave from Nimrod.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-yahuah-preserves-the-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 2:14 — *When he arose, he took the young child and his mother by night, and departed into Egypt.* The Messiah-child taken by night and hidden from the murdering king — Yahuah preserving the seed exactly as He hides Abram from Nimrod.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-yahuah-preserves-the-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 2:24 — *And Elohim (God) heard their groaning, and Elohim (God) remembered his covenant with Abraham, with Isaac, and with Jacob.* The covenant Yahuah keeps in Exodus is the very seed He shields in the cave so Nimrod cannot end it before Abraham.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-yahuah-preserves-the-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-8-terah-the-idolater-father
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* The canon confirms Jasher''s Terah — Nimrod''s idol-serving prince — as the house out of which Yahuah calls the chosen seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-terah-the-idolater-father'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 12:2 — *Worship the Elohim (God) of heaven, Who causes the rain and the dew to descend on the earth, And does everything upon the earth... Why do you worship things that have no spirit in them?* Jubilees gives the same father — an idolater Abram must rebuke — that Jasher shows bargaining with Nimrod.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-terah-the-idolater-father'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=28
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 12:7 — *And if I tell them the truth, they will slay me; for their soul cleaves to them to worship them and honour them. Keep silent, my son, lest they slay you.* Terah''s fear of the people matches Jasher''s Terah trembling before Nimrod''s threat over his household.'
  FROM cross_reference_threads t, cross_references x, _session252_ja08_lookup sv, _session252_ja08_lookup tv
 WHERE t.slug='jasher-8-terah-the-idolater-father'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=8 AND sv.verse_number=31
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session252 — Jasher cross-references complete.'
