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

-- ----- fragment: minion_jasher_09.sql (session252 jasher 9) -----
-- Source anchor: jasher/jasher ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja09 (view _session252_ja09_lookup). Sort band base 55200, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja09_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-9-haran-family-and-the-birth-of-sarai
  ('jasher', 'jasher', 9, 3, 'canon', 'genesis', 11, 29, 'free', E'Genesis 11:29 — *And Abram and Nahor took them wives: the name of Abram’s wife was Sarai; and the name of Nahor’s wife, Milcah, the daughter of Haran, the father of Milcah, and the father of Iscah.* the canon names the same daughters of Haran''s house that Jasher records, Milcah and Sarai (Jasher 9:3).'),
  -- thread: jasher-9-abram-in-the-house-of-noah-and-shem-knew-yahuah
  ('jasher', 'jasher', 9, 5, 'canon', 'genesis', 9, 26, 'free', E'Genesis 9:26 — *And he said, Blessed be Yahuah Elohim (the LORD God) of Shem; and Canaan shall be his servant.* Abram learns the way of Yahuah in the house of Shem, the blessed line in whose tents the knowledge of the Creator was kept (Jasher 9:5).'),
  ('jasher', 'jasher', 9, 6, 'canon', 'isaiah', 51, 2, 'free', E'Isaiah 51:2 — *Look unto Abraham your father, and unto Sarah that bare you: for I called him alone, and blessed him, and increased him.* the prophet names the lone calling that Jasher shows beginning in the hidden boy who knew Yahuah from three years old (Jasher 9:6).'),
  ('jasher', 'jasher', 9, 6, 'canon', 'acts', 7, 2, 'free', E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran,* Stephen sets the call in Mesopotamia, the land of the idol-houses Jasher describes, before ever Abram reached Haran (Jasher 9:6).'),
  ('jasher', 'jasher', 9, 5, 'canon', 'joshua', 24, 3, 'free', E'Joshua 24:3 — *And I took your father Abraham from the other side of the flood, and led him throughout all the land of Canaan, and multiplied his seed, and gave him Isaac.* Yahuah''s own testimony that He took Abraham out, the deliverance Jasher shows beginning in the house of Noah and Shem (Jasher 9:5).'),
  -- thread: jasher-9-the-generation-serves-gods-of-wood-and-stone
  ('jasher', 'jasher', 9, 7, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* the canon names Terah the idolater exactly as Jasher does — the first of the idol-servers (Jasher 9:7).'),
  ('jasher', 'jasher', 9, 6, 'canon', 'psalms', 115, 4, 'free', E'Psalm 115:4 — *Their idols are silver and gold, the work of men’s hands.* the gods of wood and stone that could neither speak nor hear nor deliver (Jasher 9:6) are the very dumb idols the psalm derides.'),
  ('jasher', 'jasher', 9, 6, 'canon', 'jeremiah', 10, 14, 'free', E'Jeremiah 10:14 — *Every man is brutish in his knowledge: every founder is confounded by the graven image: for his molten image is falsehood, and there is no breath in them.* the prophet''s verdict on the breathless idols Jasher''s generation served (Jasher 9:6).'),
  -- thread: jasher-9-abram-reasons-from-the-sun-and-moon-to-the-creator
  ('jasher', 'jasher', 9, 7, 'canon', 'deuteronomy', 4, 19, 'free', E'Deuteronomy 4:19 — *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them,* Moses forbids the host-of-heaven worship that Abram reasons his way out of, finding sun and moon are servants, not gods (Jasher 9:7).'),
  ('jasher', 'jasher', 9, 7, 'jubilees', 'jubilees', 12, 17, 'extras', E'Jubilees 12:17 — *All the signs of the stars, and the signs of the moon and of the sun are all in the hand of Yahuah (God). Why do I search (them) out?* Jubilees records the same reasoning — Abram turning from the host of heaven to the One in whose hand they are (Jasher 9:7).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja09_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja09_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-9-haran-family-and-the-birth-of-sarai',
       E'Haran''s house and the birth of Sarai',
       E'Jasher names the household from which the chosen seed will take its wife: *And Haran, the son of Terah, Abram’s oldest brother, took a wife in those days* (Jasher 9:1), and *she conceived again and bare a daughter... she called her name Sarai* (Jasher 9:3). The canon names the same marriages: *And Abram and Nahor took them wives: the name of Abram’s wife was Sarai; and the name of Nahor’s wife, Milcah, the daughter of Haran, the father of Milcah, and the father of Iscah* (Genesis 11:29). The line is being drawn toward the seed of promise.',
       sv.verse_id, ev.verse_id, 'extras', 55200
  FROM _session252_ja09_lookup sv, _session252_ja09_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=9 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-9-abram-in-the-house-of-noah-and-shem-knew-yahuah',
       E'Abram in the house of Noah and Shem — he knew Yahuah',
       E'The chosen child is hidden in the one righteous house left on the earth: *when Abram came out from the cave, he went to Noah and his son Shem, and he remained with them to learn the instruction of Yahuah (the Lord) and his ways* (Jasher 9:5), *and Abram knew Yahuah (the Lord) from three years old, and he went in the ways of Yahuah (the Lord) until the day of his death, as Noah and his son Shem had taught him* (Jasher 9:6). It is the school of Shem — *Blessed be Yahuah Elohim (the LORD God) of Shem* (Genesis 9:26) — from which the prophet says Yahuah drew him alone: *Look unto Abraham your father... for I called him alone, and blessed him, and increased him* (Isaiah 51:2). Stephen tells it the same way: *The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran* (Acts 7:2), and Yahuah testifies *I took your father Abraham from the other side of the flood... and multiplied his seed* (Joshua 24:3). The election is before the confession — the seed kept and chosen out of the idolatrous world.',
       sv.verse_id, ev.verse_id, 'extras', 55203
  FROM _session252_ja09_lookup sv, _session252_ja09_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=9 AND sv.verse_number=5
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=9 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-9-the-generation-serves-gods-of-wood-and-stone',
       E'The generation serves gods of wood and stone',
       E'Abram is the one knower of Yahuah in a world wholly turned to idols: *all the sons of the earth in those days greatly transgressed against Yahuah (the Lord)... and the inhabitants of the earth made to themselves, at that time, every man his god; gods of wood and stone which could neither speak, hear, nor deliver* (Jasher 9:6), *and the king and all his servants, and Terah with all his household were then the first of those that served gods of wood and stone* (Jasher 9:7). Joshua names the same fathers: *Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham... and they served other gods* (Joshua 24:2). The prophets mock the dumb idol Jasher describes: *Their idols are silver and gold, the work of men’s hands* (Psalm 115:4), *his molten image is falsehood, and there is no breath in them* (Jeremiah 10:14). The seed is chosen out of a house of idols.',
       sv.verse_id, ev.verse_id, 'extras', 55206
  FROM _session252_ja09_lookup sv, _session252_ja09_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=9 AND sv.verse_number=6
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=9 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-9-abram-reasons-from-the-sun-and-moon-to-the-creator',
       E'Abram reasons from the sun and moon to the Creator',
       E'Given an understanding heart, Abram tests the host of heaven and finds them servants, not gods: he served the sun, *and when evening came the sun set as usual, and Abram said within himself, Surely this cannot be Elohim?* then *Abram saw the stars and moon... Surely this is the Elohim... and behold these his servants are gods around him*, until at dawn *Surely these are not gods that made the earth and all mankind, but these are the servants of Elohim* (Jasher 9:7). Moses had warned against the very worship Abram reasons his way out of: *lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them* (Deuteronomy 4:19). Jubilees tells the same turning: *All the signs of the stars, and the signs of the moon and of the sun are all in the hand of Yahuah (God). Why do I search (them) out?* (Jubilees 12:17). The host of heaven points past itself to the One who made it.',
       sv.verse_id, ev.verse_id, 'extras', 55209
  FROM _session252_ja09_lookup sv, _session252_ja09_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=9 AND sv.verse_number=7
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=9 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-9-haran-family-and-the-birth-of-sarai
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 11:29 — *And Abram and Nahor took them wives: the name of Abram’s wife was Sarai; and the name of Nahor’s wife, Milcah, the daughter of Haran, the father of Milcah, and the father of Iscah.* the canon names the same daughters of Haran''s house that Jasher records, Milcah and Sarai (Jasher 9:3).'
  FROM cross_reference_threads t, cross_references x, _session252_ja09_lookup sv, _session252_ja09_lookup tv
 WHERE t.slug='jasher-9-haran-family-and-the-birth-of-sarai'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=9 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-9-abram-in-the-house-of-noah-and-shem-knew-yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 9:26 — *And he said, Blessed be Yahuah Elohim (the LORD God) of Shem; and Canaan shall be his servant.* Abram learns the way of Yahuah in the house of Shem, the blessed line in whose tents the knowledge of the Creator was kept (Jasher 9:5).'
  FROM cross_reference_threads t, cross_references x, _session252_ja09_lookup sv, _session252_ja09_lookup tv
 WHERE t.slug='jasher-9-abram-in-the-house-of-noah-and-shem-knew-yahuah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 51:2 — *Look unto Abraham your father, and unto Sarah that bare you: for I called him alone, and blessed him, and increased him.* the prophet names the lone calling that Jasher shows beginning in the hidden boy who knew Yahuah from three years old (Jasher 9:6).'
  FROM cross_reference_threads t, cross_references x, _session252_ja09_lookup sv, _session252_ja09_lookup tv
 WHERE t.slug='jasher-9-abram-in-the-house-of-noah-and-shem-knew-yahuah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=51 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran,* Stephen sets the call in Mesopotamia, the land of the idol-houses Jasher describes, before ever Abram reached Haran (Jasher 9:6).'
  FROM cross_reference_threads t, cross_references x, _session252_ja09_lookup sv, _session252_ja09_lookup tv
 WHERE t.slug='jasher-9-abram-in-the-house-of-noah-and-shem-knew-yahuah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Joshua 24:3 — *And I took your father Abraham from the other side of the flood, and led him throughout all the land of Canaan, and multiplied his seed, and gave him Isaac.* Yahuah''s own testimony that He took Abraham out, the deliverance Jasher shows beginning in the house of Noah and Shem (Jasher 9:5).'
  FROM cross_reference_threads t, cross_references x, _session252_ja09_lookup sv, _session252_ja09_lookup tv
 WHERE t.slug='jasher-9-abram-in-the-house-of-noah-and-shem-knew-yahuah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-9-the-generation-serves-gods-of-wood-and-stone
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:2 — *Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* the canon names Terah the idolater exactly as Jasher does — the first of the idol-servers (Jasher 9:7).'
  FROM cross_reference_threads t, cross_references x, _session252_ja09_lookup sv, _session252_ja09_lookup tv
 WHERE t.slug='jasher-9-the-generation-serves-gods-of-wood-and-stone'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 115:4 — *Their idols are silver and gold, the work of men’s hands.* the gods of wood and stone that could neither speak nor hear nor deliver (Jasher 9:6) are the very dumb idols the psalm derides.'
  FROM cross_reference_threads t, cross_references x, _session252_ja09_lookup sv, _session252_ja09_lookup tv
 WHERE t.slug='jasher-9-the-generation-serves-gods-of-wood-and-stone'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 10:14 — *Every man is brutish in his knowledge: every founder is confounded by the graven image: for his molten image is falsehood, and there is no breath in them.* the prophet''s verdict on the breathless idols Jasher''s generation served (Jasher 9:6).'
  FROM cross_reference_threads t, cross_references x, _session252_ja09_lookup sv, _session252_ja09_lookup tv
 WHERE t.slug='jasher-9-the-generation-serves-gods-of-wood-and-stone'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=9 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-9-abram-reasons-from-the-sun-and-moon-to-the-creator
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 4:19 — *And lest thou lift up thine eyes unto heaven, and when thou seest the sun, and the moon, and the stars, even all the host of heaven, shouldest be driven to worship them, and serve them,* Moses forbids the host-of-heaven worship that Abram reasons his way out of, finding sun and moon are servants, not gods (Jasher 9:7).'
  FROM cross_reference_threads t, cross_references x, _session252_ja09_lookup sv, _session252_ja09_lookup tv
 WHERE t.slug='jasher-9-abram-reasons-from-the-sun-and-moon-to-the-creator'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 12:17 — *All the signs of the stars, and the signs of the moon and of the sun are all in the hand of Yahuah (God). Why do I search (them) out?* Jubilees records the same reasoning — Abram turning from the host of heaven to the One in whose hand they are (Jasher 9:7).'
  FROM cross_reference_threads t, cross_references x, _session252_ja09_lookup sv, _session252_ja09_lookup tv
 WHERE t.slug='jasher-9-abram-reasons-from-the-sun-and-moon-to-the-creator'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=9 AND sv.verse_number=7
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=12 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jasher_10.sql (session252 jasher 10) -----
-- Source anchor: jasher/jasher ch10. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja10 (view _session252_ja10_lookup). Sort band base 55225, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja10_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-10-peleg-eber-seedline
  ('jasher', 'jasher', 10, 1, 'canon', 'genesis', 10, 25, 'free', E'Genesis 10:25 — *And unto Eber were born two sons: the name of one was Peleg; for in his days was the earth divided; and his brother’s name was Joktan.* Jasher 10:1 dates Peleg''s death in Abram''s lifetime; Genesis names him for the very dividing of the earth this chapter recounts.'),
  ('jasher', 'jasher', 10, 1, 'canon', 'genesis', 11, 16, 'free', E'Genesis 11:16 — *And Eber lived four and thirty years, and begat Peleg:* the canon''s lifespan register carrying the seed-line Shem-Eber-Peleg that Jasher 10:1 is counting toward Abram.'),
  ('jasher', 'jasher', 10, 1, 'canon', 'genesis', 11, 17, 'free', E'Genesis 11:17 — *And Eber lived after he begat Peleg four hundred and thirty years, and begat sons and daughters.* The chosen line is kept generation by generation, the same chain Jasher 10:1 measures by Peleg''s two hundred and thirty-nine years.'),
  ('jasher', 'jasher', 10, 1, 'jubilees', 'jubilees', 8, 8, 'extras', E'Jubilees 8:8 — *And in the sixth year thereof, she bare him a son, and he called his name Peleg; for in the days when he was born the children of Noah began to divide the earth amongst themselves: for this reason he called his name Peleg.* The Jubilees apparatus names Peleg by the identical dividing of the earth Jasher 10:1 stands at the head of.'),
  -- thread: jasher-10-babel-scattered-nations
  ('jasher', 'jasher', 10, 2, 'canon', 'genesis', 11, 8, 'free', E'Genesis 11:8 — *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city.* The very scattering Jasher 10:2 recounts as the sons of men dispersed into the four corners of the earth.'),
  ('jasher', 'jasher', 10, 3, 'canon', 'genesis', 11, 9, 'free', E'Genesis 11:9 — *Therefore is the name of it called Babel; because Yahuah (LORD) did there confound the language of all the earth: and from thence did Yahuah (LORD) scatter them abroad upon the face of all the earth.* Genesis names the confusion of tongues that Jasher 10:3 describes as each family according to its language.'),
  ('jasher', 'jasher', 10, 4, 'canon', 'deuteronomy', 32, 8, 'free', E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* The scattering and city-building of Jasher 10:4 is the Most High bounding the nations around the chosen seed.'),
  ('jasher', 'jasher', 10, 5, 'canon', 'acts', 17, 26, 'free', E'Acts 17:26 — *And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation;* Paul preaches the same divine ordering of the nations and their dwellings that Jasher 10:5 narrates after the tower.'),
  ('jasher', 'jasher', 10, 2, 'jubilees', 'jubilees', 10, 25, 'extras', E'Jubilees 10:25 — *For this reason the whole land of Shinar is called Babel, because Yahuah (God) did there confound all the language of the children of men, and from thence they were dispersed into their cities, each according to his language and his nation.* The Jubilees apparatus seals the same dispersal-into-cities that Jasher 10:2 opens this chapter with.'),
  -- thread: jasher-10-sons-of-japheth
  ('jasher', 'jasher', 10, 7, 'canon', 'genesis', 10, 2, 'free', E'Genesis 10:2 — *The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras.* The identical roll of Japheth''s seven sons that Jasher 10:7 names according to their generations.'),
  ('jasher', 'jasher', 10, 6, 'canon', 'genesis', 10, 5, 'free', E'Genesis 10:5 — *By these were the isles of the Gentiles divided in their lands; every one after his tongue, after their families, in their nations.* Genesis records the same division of Japheth''s line into lands and languages that Jasher 10:6 recounts as they built cities where they were scattered.'),
  ('jasher', 'jasher', 10, 7, 'jubilees', 'jubilees', 9, 8, 'extras', E'Jubilees 9:8 — *And the first portion came forth for Gomer to the east from the north side to the river Tînâ; and in the north there came forth for Magog all the inner portions of the north until it reaches to the sea of Mê’at.* The Jubilees apparatus apportions by lot the same sons of Japheth — Gomer and Magog — that Jasher 10:7 lists.'),
  -- thread: jasher-10-sons-of-ham-philistines
  ('jasher', 'jasher', 10, 19, 'canon', 'genesis', 10, 6, 'free', E'Genesis 10:6 — *And the sons of Ham; Cush, and Mizraim, and Phut, and Canaan.* The same four sons of Ham that Jasher 10:19 names according to their generation and cities.'),
  ('jasher', 'jasher', 10, 21, 'canon', 'genesis', 10, 13, 'free', E'Genesis 10:13 — *And Mizraim begat Ludim, and Anamim, and Lehabim, and Naphtuhim,* the identical Egyptian families Jasher 10:21 lists as the children of Mitzraim.'),
  ('jasher', 'jasher', 10, 23, 'canon', 'genesis', 10, 14, 'free', E'Genesis 10:14 — *And Pathrusim, and Casluhim, (out of whom came Philistim,) and Caphtorim.* Genesis names the same Philistine origin that Jasher 10:23 records as the Pelishtim going forth from Pathros and Casloch.'),
  ('jasher', 'jasher', 10, 19, 'jubilees', 'jubilees', 9, 1, 'extras', E'Jubilees 9:1 — *And Ham divided amongst his sons, and the first portion came forth for Cush towards the east, and to the west of him for Mizraim, and to the west . of him for Put, and to the west of him and to the west thereof on the sea for Canaan.* The Jubilees apparatus apportions by lot the same four sons of Ham that Jasher 10:19 names.'),
  -- thread: jasher-10-cities-of-the-plain-sodom
  ('jasher', 'jasher', 10, 25, 'canon', 'genesis', 10, 19, 'free', E'Genesis 10:19 — *And the border of the Canaanites was from Sidon, as thou comest to Gerar, unto Gaza; as thou goest, unto Sodom, and Gomorrah, and Admah, and Zeboim, even unto Lasha.* Genesis sets the Canaanite border at the very four cities of the plain Jasher 10:25 says four men of Ham founded.'),
  ('jasher', 'jasher', 10, 26, 'canon', 'genesis', 14, 2, 'free', E'Genesis 14:2 — *That these made war with Bera king of Sodom, and with Birsha king of Gomorrah, Shinab king of Admah, and Shemeber king of Zeboiim, and the king of Bela, which is Zoar.* The canon names the same four plain-cities by their kings that Jasher 10:26 records being built and named after their founders.'),
  -- thread: jasher-10-shem-asshur-nineveh
  ('jasher', 'jasher', 10, 31, 'canon', 'genesis', 10, 22, 'free', E'Genesis 10:22 — *The children of Shem; Elam, and Asshur, and Arphaxad, and Lud, and Aram.* The identical five sons of Shem that Jasher 10:31 names, the father-stock of the chosen line.'),
  ('jasher', 'jasher', 10, 30, 'canon', 'genesis', 10, 21, 'free', E'Genesis 10:21 — *Unto Shem also, the father of all the children of Eber, the brother of Japheth the elder, even to him were children born.* Genesis marks Shem as father of Eber''s line — the seed Jasher 10:30 traces as it builds cities after the scattering.'),
  ('jasher', 'jasher', 10, 33, 'canon', 'genesis', 10, 11, 'free', E'Genesis 10:11 — *Out of that land went forth Asshur, and builded Nineveh, and the city Rehoboth, and Calah,* the same Asshur founding the same cities — Nineveh, Rehoboth, Calah — that Jasher 10:33 names among Asshur''s four.'),
  ('jasher', 'jasher', 10, 32, 'jubilees', 'jubilees', 9, 3, 'extras', E'Jubilees 9:3 — *And for Asshur came forth the second portion, all the land of Asshur and Nineveh and Shinar and to the border of India, and it ascends and skirts the river.* The Jubilees apparatus apportions Asshur the same Nineveh-and-Shinar territory that Jasher 10:32 says Asshur went forth to build.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja10_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja10_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-10-peleg-eber-seedline',
       E'Peleg dies in Abram''s day — the seed-line kept through Eber',
       E'Jasher opens chapter ten on the seed-line clock: *And Peleg the son of Eber died in those days, in the forty-eighth year of the life of Abram son of Terah, and all the days of Peleg were two hundred and thirty-nine years* (Jasher 10:1). The chosen line runs Shem → Arphaxad → Eber → Peleg toward Abram, and Genesis keeps the very same register: *And unto Eber were born two sons: the name of one was Peleg; for in his days was the earth divided; and his brother’s name was Joktan* (Genesis 10:25). The lifespan-by-lifespan chain that carries the covenant seed is set down in *And Eber lived four and thirty years, and begat Peleg* and *And Eber lived after he begat Peleg four hundred and thirty years, and begat sons and daughters* (Genesis 11:16-17). Jubilees names Peleg by the same dividing of the earth: *And in the sixth year thereof, she bare him a son, and he called his name Peleg; for in the days when he was born the children of Noah began to divide the earth amongst themselves: for this reason he called his name Peleg* (Jubilees 8:8). Election precedes confession; the line is kept and chosen, generation by generation. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55225
  FROM _session252_ja10_lookup sv, _session252_ja10_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=10 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-10-babel-scattered-nations',
       E'Scattered from Babel — the nations divided and bounded',
       E'After the tower, Jasher shows the LORD dispersing mankind across the earth: *And when Yahuah (the Lord) had scattered the sons of men on account of their sin at the tower, behold they spread forth into many divisions, and all the sons of men were dispersed into the four corners of the earth* (Jasher 10:2), so that *all the families became each according to its language, its land, or its city* (Jasher 10:3), and they *built many cities according to their families, in all the places where they went, and throughout the earth where Yahuah (the Lord) had scattered them* (Jasher 10:4). This is Genesis verbatim in its architecture: *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city* (Genesis 11:8), *because Yahuah (LORD) did there confound the language of all the earth* (Genesis 11:9). The scattering is no accident but a bounding: *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel)* (Deuteronomy 32:8). Paul preaches the same to Athens: *And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation* (Acts 17:26). Jubilees seals it: *For this reason the whole land of Shinar is called Babel, because Yahuah (God) did there confound all the language of the children of men, and from thence they were dispersed into their cities, each according to his language and his nation* (Jubilees 10:25). The kingdom-of-man''s tower is broken; the nations are set in their bounds around the elect seed. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55228
  FROM _session252_ja10_lookup sv, _session252_ja10_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=2
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=10 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-10-sons-of-japheth',
       E'The sons of Japheth divided in their lands',
       E'Jasher expands the table of nations with Japheth''s line settling the isles: *And the sons of Japheth the son of Noah went and built themselves cities in the places where they were scattered... and the sons of Japheth were divided upon the face of the earth into many divisions and languages* (Jasher 10:6), naming *Gomer, Magog, Medai, Javan, Tubal, Meshech and Tiras; these are the children of Japheth according to their generations* (Jasher 10:7). This is Genesis 10 retold: *The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras* (Genesis 10:2), of whom *By these were the isles of the Gentiles divided in their lands; every one after his tongue, after their families, in their nations* (Genesis 10:5). Jubilees apportions the very same sons by lot: *And the first portion came forth for Gomer to the east from the north side to the river Tînâ; and in the north there came forth for Magog all the inner portions of the north until it reaches to the sea of Mê’at* (Jubilees 9:8). The same seventy nations, the same bounds. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55231
  FROM _session252_ja10_lookup sv, _session252_ja10_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=6
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=10 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-10-sons-of-ham-philistines',
       E'The sons of Ham — Mizraim, Canaan, and the Philistines come forth',
       E'Jasher traces Ham''s line: *And the children of Ham were Cush, Mitzraim, Phut and Canaan according to their generation and cities* (Jasher 10:19), then *the children of Mitzraim are the Ludim, Anamim, Lehabim, Naphtuchim, Pathrusim, Casluchim and Caphturim, seven families* (Jasher 10:21), out of whom *from them went forth the Pelishtim* (Jasher 10:23). Genesis sets down the same fathers: *And the sons of Ham; Cush, and Mizraim, and Phut, and Canaan* (Genesis 10:6), *And Mizraim begat Ludim, and Anamim, and Lehabim, and Naphtuhim* (Genesis 10:13), and the Philistine origin: *And Pathrusim, and Casluhim, (out of whom came Philistim,) and Caphtorim* (Genesis 10:14). Jubilees gives Ham''s same fourfold inheritance: *And Ham divided amongst his sons, and the first portion came forth for Cush towards the east, and to the west of him for Mizraim, and to the west . of him for Put, and to the west of him and to the west thereof on the sea for Canaan* (Jubilees 9:1). The nations of the world springing from Noah''s sons — the same table, three witnesses deep. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55234
  FROM _session252_ja10_lookup sv, _session252_ja10_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=19
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=10 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-10-cities-of-the-plain-sodom',
       E'Four men of Ham build Sodom and the cities of the plain',
       E'Jasher seeds the coming judgment-story of Sodom: *And four men from the family of Ham went to the land of the plain; these are the names of the four men, Sodom, Gomorrah, Admah and Zeboyim* (Jasher 10:25), who *built themselves four cities in the land of the plain, and they called the names of their cities after their own names* (Jasher 10:26), and *they were fruitful and multiplied greatly and dwelt peaceably* (Jasher 10:27) — the brief peace before the fire. Genesis sets the border of Ham''s Canaan exactly there: *And the border of the Canaanites was from Sidon, as thou comest to Gerar, unto Gaza; as thou goest, unto Sodom, and Gomorrah, and Admah, and Zeboim, even unto Lasha* (Genesis 10:19), and names these same four cities by their kings: *That these made war with Bera king of Sodom, and with Birsha king of Gomorrah, Shinab king of Admah, and Shemeber king of Zeboiim, and the king of Bela, which is Zoar* (Genesis 14:2). The cities Jasher founds here are the ones the canon will overthrow — the kingdom-of-man''s prosperity standing under judgment. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55237
  FROM _session252_ja10_lookup sv, _session252_ja10_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=25
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=10 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-10-shem-asshur-nineveh',
       E'The sons of Shem and Asshur''s Nineveh — kept apart from Nimrod''s seat',
       E'Jasher closes with the elect line''s father-stock and Asshur''s cities: *And the sons of Shem were Elam, Ashur, Arpachshad, Lud and Aram* (Jasher 10:31), and *Ashur son of Shem and his children and household went forth at that time... and they built themselves four cities* (Jasher 10:32), namely *Ninevah, Resen, Calach and Rehobother; and the children of Ashur dwell there to this day* (Jasher 10:33). Genesis carries Shem''s same sons, and marks him as the seed-bearer: *The children of Shem; Elam, and Asshur, and Arphaxad, and Lud, and Aram* (Genesis 10:22), *the father of all the children of Eber* (Genesis 10:21). And Genesis shows Asshur''s cities going forth out of Nimrod''s Shinar — the elect stock settling apart from the kingdom-of-man''s seat: *Out of that land went forth Asshur, and builded Nineveh, and the city Rehoboth, and Calah* (Genesis 10:11). Jubilees apportions Asshur the same northern land: *And for Asshur came forth the second portion, all the land of Asshur and Nineveh and Shinar and to the border of India, and it ascends and skirts the river* (Jubilees 9:3). Shem the father of Eber — the seed kept toward Abraham. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55240
  FROM _session252_ja10_lookup sv, _session252_ja10_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=30
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=10 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-10-peleg-eber-seedline
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:25 — *And unto Eber were born two sons: the name of one was Peleg; for in his days was the earth divided; and his brother’s name was Joktan.* Jasher 10:1 dates Peleg''s death in Abram''s lifetime; Genesis names him for the very dividing of the earth this chapter recounts.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-peleg-eber-seedline'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 11:16 — *And Eber lived four and thirty years, and begat Peleg:* the canon''s lifespan register carrying the seed-line Shem-Eber-Peleg that Jasher 10:1 is counting toward Abram.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-peleg-eber-seedline'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 11:17 — *And Eber lived after he begat Peleg four hundred and thirty years, and begat sons and daughters.* The chosen line is kept generation by generation, the same chain Jasher 10:1 measures by Peleg''s two hundred and thirty-nine years.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-peleg-eber-seedline'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 8:8 — *And in the sixth year thereof, she bare him a son, and he called his name Peleg; for in the days when he was born the children of Noah began to divide the earth amongst themselves: for this reason he called his name Peleg.* The Jubilees apparatus names Peleg by the identical dividing of the earth Jasher 10:1 stands at the head of.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-peleg-eber-seedline'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=8 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-10-babel-scattered-nations
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 11:8 — *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city.* The very scattering Jasher 10:2 recounts as the sons of men dispersed into the four corners of the earth.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-babel-scattered-nations'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 11:9 — *Therefore is the name of it called Babel; because Yahuah (LORD) did there confound the language of all the earth: and from thence did Yahuah (LORD) scatter them abroad upon the face of all the earth.* Genesis names the confusion of tongues that Jasher 10:3 describes as each family according to its language.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-babel-scattered-nations'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 32:8 — *When the El Elyon (most High) divided to the nations their inheritance, when he separated the sons of Adam, he set the bounds of the people according to the number of the children of Yashar''el (Israel).* The scattering and city-building of Jasher 10:4 is the Most High bounding the nations around the chosen seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-babel-scattered-nations'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Acts 17:26 — *And hath made of one blood all nations of men for to dwell on all the face of the earth, and hath determined the times before appointed, and the bounds of their habitation;* Paul preaches the same divine ordering of the nations and their dwellings that Jasher 10:5 narrates after the tower.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-babel-scattered-nations'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=17 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 10:25 — *For this reason the whole land of Shinar is called Babel, because Yahuah (God) did there confound all the language of the children of men, and from thence they were dispersed into their cities, each according to his language and his nation.* The Jubilees apparatus seals the same dispersal-into-cities that Jasher 10:2 opens this chapter with.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-babel-scattered-nations'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=10 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-10-sons-of-japheth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:2 — *The sons of Japheth; Gomer, and Magog, and Madai, and Javan, and Tubal, and Meshech, and Tiras.* The identical roll of Japheth''s seven sons that Jasher 10:7 names according to their generations.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-sons-of-japheth'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 10:5 — *By these were the isles of the Gentiles divided in their lands; every one after his tongue, after their families, in their nations.* Genesis records the same division of Japheth''s line into lands and languages that Jasher 10:6 recounts as they built cities where they were scattered.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-sons-of-japheth'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 9:8 — *And the first portion came forth for Gomer to the east from the north side to the river Tînâ; and in the north there came forth for Magog all the inner portions of the north until it reaches to the sea of Mê’at.* The Jubilees apparatus apportions by lot the same sons of Japheth — Gomer and Magog — that Jasher 10:7 lists.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-sons-of-japheth'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=7
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=9 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-10-sons-of-ham-philistines
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:6 — *And the sons of Ham; Cush, and Mizraim, and Phut, and Canaan.* The same four sons of Ham that Jasher 10:19 names according to their generation and cities.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-sons-of-ham-philistines'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 10:13 — *And Mizraim begat Ludim, and Anamim, and Lehabim, and Naphtuhim,* the identical Egyptian families Jasher 10:21 lists as the children of Mitzraim.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-sons-of-ham-philistines'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 10:14 — *And Pathrusim, and Casluhim, (out of whom came Philistim,) and Caphtorim.* Genesis names the same Philistine origin that Jasher 10:23 records as the Pelishtim going forth from Pathros and Casloch.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-sons-of-ham-philistines'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 9:1 — *And Ham divided amongst his sons, and the first portion came forth for Cush towards the east, and to the west of him for Mizraim, and to the west . of him for Put, and to the west of him and to the west thereof on the sea for Canaan.* The Jubilees apparatus apportions by lot the same four sons of Ham that Jasher 10:19 names.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-sons-of-ham-philistines'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=19
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=9 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-10-cities-of-the-plain-sodom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:19 — *And the border of the Canaanites was from Sidon, as thou comest to Gerar, unto Gaza; as thou goest, unto Sodom, and Gomorrah, and Admah, and Zeboim, even unto Lasha.* Genesis sets the Canaanite border at the very four cities of the plain Jasher 10:25 says four men of Ham founded.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-cities-of-the-plain-sodom'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 14:2 — *That these made war with Bera king of Sodom, and with Birsha king of Gomorrah, Shinab king of Admah, and Shemeber king of Zeboiim, and the king of Bela, which is Zoar.* The canon names the same four plain-cities by their kings that Jasher 10:26 records being built and named after their founders.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-cities-of-the-plain-sodom'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-10-shem-asshur-nineveh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:22 — *The children of Shem; Elam, and Asshur, and Arphaxad, and Lud, and Aram.* The identical five sons of Shem that Jasher 10:31 names, the father-stock of the chosen line.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-shem-asshur-nineveh'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 10:21 — *Unto Shem also, the father of all the children of Eber, the brother of Japheth the elder, even to him were children born.* Genesis marks Shem as father of Eber''s line — the seed Jasher 10:30 traces as it builds cities after the scattering.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-shem-asshur-nineveh'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 10:11 — *Out of that land went forth Asshur, and builded Nineveh, and the city Rehoboth, and Calah,* the same Asshur founding the same cities — Nineveh, Rehoboth, Calah — that Jasher 10:33 names among Asshur''s four.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-shem-asshur-nineveh'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 9:3 — *And for Asshur came forth the second portion, all the land of Asshur and Nineveh and Shinar and to the border of India, and it ascends and skirts the river.* The Jubilees apparatus apportions Asshur the same Nineveh-and-Shinar territory that Jasher 10:32 says Asshur went forth to build.'
  FROM cross_reference_threads t, cross_references x, _session252_ja10_lookup sv, _session252_ja10_lookup tv
 WHERE t.slug='jasher-10-shem-asshur-nineveh'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=10 AND sv.verse_number=32
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=9 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jasher_11.sql (session252 jasher 11) -----
-- Source anchor: jasher/jasher ch11. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja11 (view _session252_ja11_lookup). Sort band base 55250, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja11_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-11-nimrod-babel-cities
  ('jasher', 'jasher', 11, 1, 'canon', 'genesis', 10, 8, 'free', E'Genesis 10:8 — *And Cush begat Nimrod: he began to be a mighty one in the earth.* Jasher''s Nimrod reigning and building in Shinar is the same mighty one Genesis names — the kingdom-of-man founder.'),
  ('jasher', 'jasher', 11, 3, 'canon', 'genesis', 10, 10, 'free', E'Genesis 10:10 — *And the beginning of his kingdom was Babel, and Erech, and Accad, and Calneh, in the land of Shinar.* Jasher names the same four cities (Babel, Erech, Eched, Calnah) after the tower''s fall, expanding the canon''s bare list.'),
  ('jasher', 'jasher', 11, 3, 'canon', 'genesis', 11, 8, 'free', E'Genesis 11:8 — *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city.* Jasher names Babel for this confounding and dispersing — the cities are monuments to the judgment Genesis records.'),
  ('jasher', 'jasher', 11, 7, 'canon', 'romans', 1, 22, 'free', E'Romans 1:22 — *Professing themselves to be wise, they became fools,* — Nimrod teaching wickedness to the sons of men is Paul''s whole-earth idolatry diagnosis, the kingdom of man rebelling against its Maker.'),
  -- thread: jasher-11-war-of-kings
  ('jasher', 'jasher', 11, 11, 'canon', 'genesis', 14, 4, 'free', E'Genesis 14:4 — *Twelve years they served Chedorlaomer, and in the thirteenth year they rebelled.* Jasher''s twelve-year tax to Chedorlaomer is the exact servitude Genesis names, the seed of the war of kings that Abram will enter.'),
  -- thread: jasher-11-abram-elect-out-of-idolatry
  ('jasher', 'jasher', 11, 15, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Jasher''s Terah serving strange gods is the very idolatry Joshua names — the house Abram is called out of.'),
  ('jasher', 'jasher', 11, 14, 'canon', 'isaiah', 51, 2, 'free', E'Isaiah 51:2 — *Look unto Abraham your father, and unto Sarah that bare you: for I called him alone, and blessed him, and increased him.* Abram knowing Yahuah amid idols is the elect seed Isaiah names — called alone, not a church, the covenant line kept and chosen.'),
  ('jasher', 'jasher', 11, 13, 'canon', 'acts', 7, 2, 'free', E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran.* Stephen places Abram''s call in idolatrous Mesopotamia — exactly where Jasher has him come forth knowing Yahuah.'),
  ('jasher', 'jasher', 11, 14, 'jubilees', 'jubilees', 12, 17, 'extras', E'Jubilees 12:17 — *All the signs of the stars, and the signs of the moon and of the sun are all in the hand of Yahuah (God).* Jubilees has the same Abram turning from the host of heaven to the Maker, the elect heart that Jasher shows knowing Yahuah.'),
  -- thread: jasher-11-idols-cannot-speak
  ('jasher', 'jasher', 11, 32, 'canon', 'psalms', 115, 5, 'free', E'Psalm 115:5 — *They have mouths, but they speak not: eyes have they, but they see not:* Abram''s cry that the idols have mouths without speech and eyes without sight is the Psalmist''s idol-polemic exactly.'),
  ('jasher', 'jasher', 11, 32, 'canon', 'psalms', 115, 6, 'free', E'Psalm 115:6 — *They have ears, but they hear not: noses have they, but they smell not:* Jasher''s ears without hearing and idols that can neither smell carries the same line of the Psalm''s rebuke.'),
  ('jasher', 'jasher', 11, 26, 'canon', 'isaiah', 44, 9, 'free', E'Isaiah 44:9 — *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* The gods that cannot stretch a hand to eat are Isaiah''s blind, profitless graven images.'),
  ('jasher', 'jasher', 11, 32, 'canon', 'jeremiah', 10, 3, 'free', E'Jeremiah 10:3 — *For the customs of the people are vain: for one cutteth a tree out of the forest, the work of the hands of the workman, with the axe.* Abram''s idols of wood, like them are those that made them, is Jeremiah''s tree cut and shaped by the workman''s axe.'),
  -- thread: jasher-11-abram-breaks-the-idols
  ('jasher', 'jasher', 11, 43, 'canon', 'habakkuk', 2, 18, 'free', E'Habakkuk 2:18 — *What profiteth the graven image that the maker thereof hath graven it; the molten image, and a teacher of lies, that the maker of his work trusteth therein, to make dumb idols?* Abram asking what power is in idols that cannot deliver is Habakkuk''s exact charge against the dumb, profitless image.'),
  ('jasher', 'jasher', 11, 33, 'canon', 'jeremiah', 10, 14, 'free', E'Jeremiah 10:14 — *Every man is brutish in his knowledge: every founder is confounded by the graven image: for his molten image is falsehood, and there is no breath in them.* Abram breaking the breathless idols confounds the founder exactly as Jeremiah says — there is no breath in them.'),
  ('jasher', 'jasher', 11, 43, 'canon', 'isaiah', 44, 17, 'free', E'Isaiah 44:17 — *And the residue thereof he maketh a god, even his graven image: he falleth down unto it, and worshippeth it, and prayeth unto it, and saith, Deliver me; for thou art my god.* Abram mocks idols that cannot hear prayer or deliver — the very cry Isaiah shows the maker raising to dead wood.'),
  ('jasher', 'jasher', 11, 33, 'jubilees', 'jubilees', 12, 12, 'extras', E'Jubilees 12:12 — *Abram arose by night, and burned the house of the idols, and he burned all that was in the house, and no man knew it.* Jubilees tells the same deed Jasher tells with the hatchet — the called seed destroying his father''s gods, a second witness to the legend.'),
  -- thread: jasher-11-abram-before-nimrod
  ('jasher', 'jasher', 11, 58, 'canon', 'genesis', 7, 23, 'free', E'Genesis 7:23 — *And every living substance was destroyed which was upon the face of the ground, both man, and cattle, and the creeping things, and the fowl of the heaven; and they were destroyed from the earth: and Noah only remained alive, and they that were with him in the ark.* Abram warns Nimrod by the flood that destroyed the whole earth — the very judgment Genesis records standing against the kingdom of man.'),
  ('jasher', 'jasher', 11, 61, 'canon', 'genesis', 11, 8, 'free', E'Genesis 11:8 — *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city.* Abram''s closing word that Yahuah sees and judges the wicked is the same judgment that scattered Nimrod''s Babel.'),
  ('jasher', 'jasher', 11, 53, 'jubilees', 'jubilees', 12, 7, 'extras', E'Jubilees 12:7 — *And if I tell them the truth, they will slay me; for their soul cleaves to them to worship them and honour them. Keep silent, my son, lest they slay you.* Jubilees gives the fearful father where Jasher gives the fearless son before Nimrod — the same idol-people who would slay the witness of truth.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja11_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja11_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-11-nimrod-babel-cities',
       E'Nimrod rebuilds in Shinar — the kingdom of man after Babel',
       E'Jasher 11 opens with the tyrant rebuilding: *And Nimrod son of Cush was still in the land of Shinar, and he reigned over it and dwelt there, and he built cities in the land of Shinar* (Jasher 11:1), and *Nimrod dwelt in Babel, and he there renewed his reign over the rest of his subjects, and he reigned securely* (Jasher 11:6). This is the Genesis Nimrod expanded: *And Cush begat Nimrod: he began to be a mighty one in the earth* (Genesis 10:8), whose kingdom is named: *And the beginning of his kingdom was Babel, and Erech, and Accad, and Calneh, in the land of Shinar* (Genesis 10:10) — the very Babel that Jasher names *Because Yahuah (the Lord) there confounded the language of the whole earth* (Jasher 11:3), retelling *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city* (Genesis 11:8). Jasher reads the man''s heart honestly: *Nimrod did not return to Yahuah (the Lord), and he continued in wickedness and teaching wickedness to the sons of men* (Jasher 11:7) — the kingdom of man rebuilt on the same rebellion, it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55250
  FROM _session252_ja11_lookup sv, _session252_ja11_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=11 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-11-war-of-kings',
       E'Chedorlaomer subdues the cities of the plain',
       E'Jasher sets the stage for Genesis 14 in advance: *And Chedorlaomer, king of Elam, went away from the families of the children of Ham, and he fought with them and he subdued them, and he went to the five cities of the plain and he fought against them and he subdued them, and they were under his control* (Jasher 11:10), and *they served him twelve years, and they gave him a yearly tax* (Jasher 11:11). This is the very servitude Genesis records as the trigger of the war Abram will later fight: *Twelve years they served Chedorlaomer, and in the thirteenth year they rebelled* (Genesis 14:4). Jasher carries the canon''s narrative spine — the kingdoms of men warring among themselves while the chosen seed is being raised up unseen — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55253
  FROM _session252_ja11_lookup sv, _session252_ja11_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=9
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=11 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-11-abram-elect-out-of-idolatry',
       E'Abram comes forth knowing Yahuah — the seed called out of his father''s house',
       E'Against Terah''s idol-temple Jasher sets the called seed: *And Abram knew Yahuah (the Lord), and he went in his ways and instructions, and Yahuah his Elohim (the Lord his God) was with him* (Jasher 11:14), while *Terah his father was in those days, still captain of the host of king Nimrod, and he still followed strange gods* (Jasher 11:15), with *twelve gods standing there in their temples* (Jasher 11:16). The canon names this same house of idols: *Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods* (Joshua 24:2). Abram is the elect drawn out, not a convert who chose first: *Look unto Abraham your father, and unto Sarah that bare you: for I called him alone, and blessed him, and increased him* (Isaiah 51:2), and Stephen tells it the same way: *The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran* (Acts 7:2). Election precedes confession — Yahuah called him alone out of the idolatrous world, it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55256
  FROM _session252_ja11_lookup sv, _session252_ja11_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=13
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=11 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-11-idols-cannot-speak',
       E'The idol-polemic — wood and stone that cannot eat, hear, or speak',
       E'Abram lays the offering before the gods and they do nothing: *Abram saw on the day when he was sitting amongst them, that they had no voice, no hearing, no motion, and not one of them could stretch forth his hand to eat* (Jasher 11:26), and clothed with the Spirit he cries: *who serve these idols of wood and stone which can neither eat, smell, hear nor speak, who have mouths without speech, eyes without sight, ears without hearing, hands without feeling, and legs which cannot move; like them are those that made them and that trust in them* (Jasher 11:32). This is the prophets'' own idol-polemic, word for word in pattern: *They have mouths, but they speak not: eyes have they, but they see not* (Psalm 115:5), *They have ears, but they hear not: noses have they, but they smell not* (Psalm 115:6). Isaiah mocks the same dead craft: *They that make a graven image are all of them vanity... they see not, nor know; that they may be ashamed* (Isaiah 44:9), and Jeremiah: *For the customs of the people are vain: for one cutteth a tree out of the forest, the work of the hands of the workman, with the axe* (Jeremiah 10:3). Jasher''s young Abram preaches the Tanakh''s idol-rebuke before it was written — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55259
  FROM _session252_ja11_lookup sv, _session252_ja11_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=26
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=11 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-11-abram-breaks-the-idols',
       E'Abram takes the hatchet and breaks his father''s gods',
       E'The legend''s heart: *he hastened and took a hatchet in his hand, and came to the chamber of the gods, and he broke all his father''s gods* (Jasher 11:33), then *placed the hatchet in the hand of the great god which was there before them* (Jasher 11:34). Confronted, he presses the polemic home: *And how can you then serve these idols in whom there is no power to do any thing? Can those idols in which you trust deliver you? can they hear your prayers when you call upon them?* (Jasher 11:43). This breaking is Habakkuk''s verdict enacted: *What profiteth the graven image that the maker thereof hath graven it... to make dumb idols?* (Habakkuk 2:18), and Jeremiah''s: *every founder is confounded by the graven image: for his molten image is falsehood, and there is no breath in them* (Jeremiah 10:14). Isaiah names the absurd cry the broken god cannot answer: *Deliver me; for thou art my god* (Isaiah 44:17). And Jubilees tells the same deed: *Abram arose by night, and burned the house of the idols, and he burned all that was in the house, and no man knew it* (Jubilees 12:12) — two witnesses to the seed who shatters the false gods, it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55262
  FROM _session252_ja11_lookup sv, _session252_ja11_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=33
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=11 AND ev.verse_number=49
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-11-abram-before-nimrod',
       E'Abram before Nimrod — the flood-warning to the tyrant-king',
       E'Terah hands his son to the tyrant: *the king sent three men of his servants, and they went and brought Abram before the king. And Nimrod and all his princes and servants were that day sitting before him* (Jasher 11:52). Abram preaches to Nimrod''s face, warning by the flood: *Dost you not know... that this evil which you do, our ancestors sinned in it in days of old, and the eternal Elohim brought the waters of the flood upon them and destroyed them all, and also destroyed the whole earth on their account?* (Jasher 11:58). This is Genesis'' flood set as the standing witness against the kingdom of man: *And every living substance was destroyed which was upon the face of the ground... and Noah only remained alive, and they that were with him in the ark* (Genesis 7:23). Abram closes lifting his eyes: *Yahuah (the Lord) sees all the wicked, and he will judge them* (Jasher 11:61) — the same Yahuah who scattered Babel and drowned the old world. Jubilees gives the parallel of the father who dares not speak truth to the idol-people: *if I tell them the truth, they will slay me* (Jubilees 12:7). The chosen seed stands witness before the kingdom of man — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55265
  FROM _session252_ja11_lookup sv, _session252_ja11_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=52
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=11 AND ev.verse_number=61
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-11-nimrod-babel-cities
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:8 — *And Cush begat Nimrod: he began to be a mighty one in the earth.* Jasher''s Nimrod reigning and building in Shinar is the same mighty one Genesis names — the kingdom-of-man founder.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-nimrod-babel-cities'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 10:10 — *And the beginning of his kingdom was Babel, and Erech, and Accad, and Calneh, in the land of Shinar.* Jasher names the same four cities (Babel, Erech, Eched, Calnah) after the tower''s fall, expanding the canon''s bare list.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-nimrod-babel-cities'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 11:8 — *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city.* Jasher names Babel for this confounding and dispersing — the cities are monuments to the judgment Genesis records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-nimrod-babel-cities'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 1:22 — *Professing themselves to be wise, they became fools,* — Nimrod teaching wickedness to the sons of men is Paul''s whole-earth idolatry diagnosis, the kingdom of man rebelling against its Maker.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-nimrod-babel-cities'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-11-war-of-kings
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 14:4 — *Twelve years they served Chedorlaomer, and in the thirteenth year they rebelled.* Jasher''s twelve-year tax to Chedorlaomer is the exact servitude Genesis names, the seed of the war of kings that Abram will enter.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-war-of-kings'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-11-abram-elect-out-of-idolatry
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* Jasher''s Terah serving strange gods is the very idolatry Joshua names — the house Abram is called out of.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-abram-elect-out-of-idolatry'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 51:2 — *Look unto Abraham your father, and unto Sarah that bare you: for I called him alone, and blessed him, and increased him.* Abram knowing Yahuah amid idols is the elect seed Isaiah names — called alone, not a church, the covenant line kept and chosen.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-abram-elect-out-of-idolatry'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=51 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran.* Stephen places Abram''s call in idolatrous Mesopotamia — exactly where Jasher has him come forth knowing Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-abram-elect-out-of-idolatry'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 12:17 — *All the signs of the stars, and the signs of the moon and of the sun are all in the hand of Yahuah (God).* Jubilees has the same Abram turning from the host of heaven to the Maker, the elect heart that Jasher shows knowing Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-abram-elect-out-of-idolatry'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=14
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=12 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-11-idols-cannot-speak
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 115:5 — *They have mouths, but they speak not: eyes have they, but they see not:* Abram''s cry that the idols have mouths without speech and eyes without sight is the Psalmist''s idol-polemic exactly.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-idols-cannot-speak'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 115:6 — *They have ears, but they hear not: noses have they, but they smell not:* Jasher''s ears without hearing and idols that can neither smell carries the same line of the Psalm''s rebuke.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-idols-cannot-speak'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 44:9 — *They that make a graven image are all of them vanity; and their delectable things shall not profit; and they are their own witnesses; they see not, nor know; that they may be ashamed.* The gods that cannot stretch a hand to eat are Isaiah''s blind, profitless graven images.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-idols-cannot-speak'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jeremiah 10:3 — *For the customs of the people are vain: for one cutteth a tree out of the forest, the work of the hands of the workman, with the axe.* Abram''s idols of wood, like them are those that made them, is Jeremiah''s tree cut and shaped by the workman''s axe.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-idols-cannot-speak'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=32
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-11-abram-breaks-the-idols
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Habakkuk 2:18 — *What profiteth the graven image that the maker thereof hath graven it; the molten image, and a teacher of lies, that the maker of his work trusteth therein, to make dumb idols?* Abram asking what power is in idols that cannot deliver is Habakkuk''s exact charge against the dumb, profitless image.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-abram-breaks-the-idols'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 10:14 — *Every man is brutish in his knowledge: every founder is confounded by the graven image: for his molten image is falsehood, and there is no breath in them.* Abram breaking the breathless idols confounds the founder exactly as Jeremiah says — there is no breath in them.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-abram-breaks-the-idols'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 44:17 — *And the residue thereof he maketh a god, even his graven image: he falleth down unto it, and worshippeth it, and prayeth unto it, and saith, Deliver me; for thou art my god.* Abram mocks idols that cannot hear prayer or deliver — the very cry Isaiah shows the maker raising to dead wood.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-abram-breaks-the-idols'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 12:12 — *Abram arose by night, and burned the house of the idols, and he burned all that was in the house, and no man knew it.* Jubilees tells the same deed Jasher tells with the hatchet — the called seed destroying his father''s gods, a second witness to the legend.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-abram-breaks-the-idols'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=33
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=12 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-11-abram-before-nimrod
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 7:23 — *And every living substance was destroyed which was upon the face of the ground, both man, and cattle, and the creeping things, and the fowl of the heaven; and they were destroyed from the earth: and Noah only remained alive, and they that were with him in the ark.* Abram warns Nimrod by the flood that destroyed the whole earth — the very judgment Genesis records standing against the kingdom of man.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-abram-before-nimrod'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=58
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 11:8 — *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city.* Abram''s closing word that Yahuah sees and judges the wicked is the same judgment that scattered Nimrod''s Babel.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-abram-before-nimrod'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=61
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 12:7 — *And if I tell them the truth, they will slay me; for their soul cleaves to them to worship them and honour them. Keep silent, my son, lest they slay you.* Jubilees gives the fearful father where Jasher gives the fearless son before Nimrod — the same idol-people who would slay the witness of truth.'
  FROM cross_reference_threads t, cross_references x, _session252_ja11_lookup sv, _session252_ja11_lookup tv
 WHERE t.slug='jasher-11-abram-before-nimrod'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=11 AND sv.verse_number=53
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jasher_12.sql (session252 jasher 12) -----
-- Source anchor: jasher/jasher ch12. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja12 (view _session252_ja12_lookup). Sort band base 55275, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-12-furnace-deliverance
  ('jasher', 'jasher', 12, 6, 'canon', 'daniel', 3, 6, 'free', E'Daniel 3:6 — *And whoso falleth not down and worshippeth shall the same hour be cast into the midst of a burning fiery furnace.* Nimrod''s brick furnace prepared three days and nights (Jasher 12:6) is the same king-of-man instrument Nebuchadnezzar wields against those who will not worship the image.'),
  ('jasher', 'jasher', 12, 26, 'canon', 'daniel', 3, 22, 'free', E'Daniel 3:22 — *Therefore because the king''s commandment was urgent, and the furnace exceeding hot, the flame of the fire slew those men that took up Shadrach, Meshach, and Abed-nego.* As the flame slays Nebuchadnezzar''s executioners, so the fire spreads over Nimrod''s servants and twelve of them die while Abram walks unharmed (Jasher 12:26).'),
  ('jasher', 'jasher', 12, 27, 'canon', 'daniel', 3, 27, 'free', E'Daniel 3:27 — *And the princes, governors, and captains, and the king''s counsellors, being gathered together, saw these men, upon whose bodies the fire had no power, nor was an hair of their head singed, neither were their coats changed, nor the smell of fire had passed on them.* The same wonder the king''s princes report of Abram, whose garments are unburned though the binding cord is consumed (Jasher 12:27).'),
  ('jasher', 'jasher', 12, 25, 'canon', 'isaiah', 43, 2, 'free', E'Isaiah 43:2 — *When thou passest through the waters, I will be with thee; and through the rivers, they shall not overflow thee: when thou walkest through the fire, thou shalt not be burned; neither shall the flame kindle upon thee.* The covenant word the legend dramatizes as Abram remains and walks about in the fire (Jasher 12:25).'),
  ('jasher', 'jasher', 12, 24, 'canon', 'hebrews', 11, 34, 'free', E'Hebrews 11:34 — *Quenched the violence of fire, escaped the edge of the sword, out of weakness were made strong, waxed valiant in fight, turned to flight the armies of the aliens.* The faith-roll''s quenched fire, the same deliverance Yahuah works for Abram when he came down and the man was not burned (Jasher 12:24).'),
  -- thread: jasher-12-nimrod-slay-the-seed
  ('jasher', 'jasher', 12, 16, 'canon', 'exodus', 1, 16, 'free', E'Exodus 1:16 — *And he said, When ye do the office of a midwife to the Hebrew women, and see them upon the stools; if it be a son, then ye shall kill him: but if it be a daughter, then she shall live.* Pharaoh''s decree against the Hebrew sons is the same king-of-man terror that made Nimrod kill the substituted child and seek Abram''s death (Jasher 12:10, 16).'),
  ('jasher', 'jasher', 12, 58, 'canon', 'matthew', 2, 13, 'free', E'Matthew 2:13 — *Arise, and take the young child and his mother, and flee into Egypt, and be thou there until I bring thee word: for Herod will seek the young child to destroy him.* Herod''s hunt for the child mirrors Nimrod sending servants in secret to seize Abram and put him to death (Jasher 12:58).'),
  ('jasher', 'jasher', 12, 55, 'canon', 'revelation', 12, 4, 'free', E'Revelation 12:4 — *And his tail drew the third part of the stars of heaven, and did cast them to the earth: and the dragon stood before the woman which was ready to be delivered, for to devour her child as soon as it was born.* The dragon waiting to devour the child is the same star-and-slaughter pattern Nimrod''s seers read, the seed of Abram that will slay the king in latter days (Jasher 12:55).'),
  ('jasher', 'jasher', 12, 53, 'canon', 'psalms', 105, 14, 'free', E'Psalm 105:14 — *He suffered no man to do them wrong: yea, he reproved kings for their sakes.* Yahuah''s guard over the patriarchs against kings answers the counsellor''s threat that Abram''s seed will war with and smite the king''s hosts (Jasher 12:53).'),
  -- thread: jasher-12-haran-dies-ur
  ('jasher', 'jasher', 12, 26, 'canon', 'genesis', 11, 28, 'free', E'Genesis 11:28 — *And Haran died before his father Terah in the land of his nativity, in Ur of the Chaldees.* The bare canon record that Jasher fills out — Haran burned to ashes in the fire of Casdim because his heart was not perfect with Yahuah (Jasher 12:26).'),
  ('jasher', 'jasher', 12, 44, 'canon', 'genesis', 11, 29, 'free', E'Genesis 11:29 — *And Abram and Nahor took them wives: the name of Abram''s wife was Sarai; and the name of Nahor''s wife, Milcah, the daughter of Haran, the father of Milcah, and the father of Iscah.* The same double marriage of the brothers to Haran''s daughters that Jasher records (Jasher 12:44).'),
  ('jasher', 'jasher', 12, 44, 'canon', 'genesis', 11, 30, 'free', E'Genesis 11:30 — *But Sarai was barren; she had no child.* The same note Jasher carries, that Sarai was barren and had no offspring in those days (Jasher 12:44).'),
  -- thread: jasher-12-abram-called-out-of-ur
  ('jasher', 'jasher', 12, 65, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* The idolatrous land Abram begs Terah to leave for Canaan (Jasher 12:65) is the very world Joshua names — the fathers served other gods beyond the river.'),
  ('jasher', 'jasher', 12, 42, 'canon', 'isaiah', 51, 2, 'free', E'Isaiah 51:2 — *Look unto Abraham your father, and unto Sarah that bare you: for I called him alone, and blessed him, and increased him.* Called alone — election before confession, the same Abram who from that day served Yahuah all his days and inclined men''s hearts to Him (Jasher 12:42-43).'),
  ('jasher', 'jasher', 12, 68, 'canon', 'acts', 7, 2, 'free', E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran.* Stephen sets the call in Mesopotamia before Haran, the same flight from Nimrod''s reach toward Canaan that Abram urges on Terah (Jasher 12:68).'),
  ('jasher', 'jasher', 12, 68, 'canon', 'genesis', 12, 1, 'free', E'Genesis 12:1 — *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee.* The canon call that Jasher dramatizes as Abram''s plea to leave the land of Nimrod and go to Canaan (Jasher 12:68).'),
  ('jasher', 'jasher', 12, 42, 'canon', 'hebrews', 11, 8, 'free', E'Hebrews 11:8 — *By faith Abraham, when he was called to go out into a place which he should after receive for an inheritance, obeyed; and he went out, not knowing whither he went.* The faith that walked in Yahuah''s ways and followed His law all Abram''s days (Jasher 12:42) is the faith that obeyed the call.'),
  -- thread: jasher-12-jubilees-self-link
  ('jasher', 'jasher', 12, 26, 'jubilees', 'jubilees', 12, 14, 'extras', E'Jubilees 12:14 — *And Haran hasted to save them, but the fire flamed over him, and he was burnt in the fire, and he died in Ur of the Chaldees before Terah his father, and they buried him in Ur of the Chaldees...* The same death of Haran by fire in the Chaldees that Jasher records, his heart not perfect with Yahuah (Jasher 12:26).'),
  ('jasher', 'jasher', 12, 44, 'jubilees', 'jubilees', 12, 9, 'extras', E'Jubilees 12:9 — *And in the fortieth jubilee, in the second week, in the seventh year thereof, Abram took to himself a wife, and her name was Sarai, the daughter of his father, and she became his wife.* The same marriage of Abram to Sarai that Jasher records alongside Nahor''s to Milca (Jasher 12:44).'),
  ('jasher', 'jasher', 12, 68, 'jubilees', 'jubilees', 12, 2, 'extras', E'Jubilees 12:2 — *What help and profit have we from those idols which you do worship, And before which you do bow yourself? For there is no spirit in them, For they are dumb forms, and a misleading of the heart. Worship them not: Worship the Elohim (God) of heaven, Who causes the rain and the dew to descend on the earth...* Abram''s idol-polemic to his father, the same plea Jasher gives him to cast away the vain things and serve Yahuah (Jasher 12:68).')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-12-furnace-deliverance',
       E'Cast into the fire and not burned — the refuse-to-bow witness',
       E'Nimrod''s sages decree the chosen man must die in the flames: *And they all answered the king saying, The man who reviles the king should be hanged upon a tree; but having done all the things that he said, and having despised our gods, he must therefore be burned to death, for this is the law in this matter.* (Jasher 12:5). They bind Abram and cast him in — *And they bound their hands and feet with linen cords, and the servants of the king lifted them up and cast them both into the furnace.* (Jasher 12:23) — but Yahuah comes down and Abram walks unharmed: *And Abram walked in the midst of the fire three days and three nights... and even the lower garments which are upon him are not burned, but the cord with which he was bound is burned.* (Jasher 12:27). It ain''t new — the same architecture recurs in Babylon, where a later king-of-man builds an idol, decrees the furnace, and three who will not bow are cast in: *And whoso falleth not down and worshippeth shall the same hour be cast into the midst of a burning fiery furnace.* (Daniel 3:6); *Therefore because the king''s commandment was urgent, and the furnace exceeding hot, the flame of the fire slew those men that took up Shadrach, Meshach, and Abed-nego.* (Daniel 3:22), exactly as the flame here slays twelve of Nimrod''s men (Jasher 12:26); and the deliverance is identical: *And the princes, governors, and captains, and the king''s counsellors, being gathered together, saw these men, upon whose bodies the fire had no power, nor was an hair of their head singed, neither were their coats changed, nor the smell of fire had passed on them.* (Daniel 3:27). The prophets name the covenant promise the legend dramatizes — *when thou walkest through the fire, thou shalt not be burned; neither shall the flame kindle upon thee.* (Isaiah 43:2) — and the faith-roll counts it among the elect: *Quenched the violence of fire, escaped the edge of the sword, out of weakness were made strong, waxed valiant in fight, turned to flight the armies of the aliens.* (Hebrews 11:34). The kingdom-of-man commands worship and the chosen seed refuses; the fire bows, not the witness.',
       sv.verse_id, ev.verse_id, 'extras', 55275
  FROM _session252_ja12_lookup sv, _session252_ja12_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=5
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=12 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-12-nimrod-slay-the-seed',
       E'Nimrod''s dream — the king-of-man who would slay the chosen seed',
       E'Two years later the tyrant dreams of a man like Abram coming forth from the furnace with a drawn sword, and his counsellor reads it as the seed-war: *And behold the day will come when Abram and his seed and the children of his household will war with my king, and they will smite all the king''s hosts and his troops.* (Jasher 12:53). So Nimrod resolves what every kingdom-of-man resolves against the seed — *And Nimrod hearkened to the voice of Anuki, and he sent some of his servants in secret to go and seize Abram, and bring him before the king to suffer death.* (Jasher 12:58). It ain''t new: it is the antichrist pattern that runs the whole canon. Pharaoh decrees the death of the Hebrew sons — *And he said, When ye do the office of a midwife to the Hebrew women, and see them upon the stools; if it be a son, then ye shall kill him: but if it be a daughter, then she shall live.* (Exodus 1:16); Herod hunts the child — *Arise, and take the young child and his mother, and flee into Egypt, and be thou there until I bring thee word: for Herod will seek the young child to destroy him.* (Matthew 2:13); and behind every throne stands the dragon — *And his tail drew the third part of the stars of heaven, and did cast them to the earth: and the dragon stood before the woman which was ready to be delivered, for to devour her child as soon as it was born.* (Revelation 12:4), the same star-and-slaughter omen Nimrod''s conjurors first read at Abram''s birth. But Yahuah guards the seed against the kings: *He suffered no man to do them wrong: yea, he reproved kings for their sakes.* (Psalm 105:14). The tyrant slays the seed; the seed is kept.',
       sv.verse_id, ev.verse_id, 'extras', 55278
  FROM _session252_ja12_lookup sv, _session252_ja12_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=45
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=12 AND ev.verse_number=58
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-12-haran-dies-ur',
       E'Haran dead in Ur, Sarai barren — Jasher fills out Genesis 11',
       E'Where Jasher gives the legend, Genesis gives the bare record it expands. Abram''s brother dies in the fire of the Chaldees: *And Haran died when they had cast him into the fire, and he was burned to ashes, for his heart was not perfect with Yahuah (the Lord)... and twelve men of them died.* (Jasher 12:26), and Abram and Nahor marry: *And at that time Nahor and Abram took to themselves wives, the daughters of their brother Haran; the wife of Nahor was Milca and the name of Abram''s wife was Sarai. And Sarai, wife of Abram, was barren; she had no offspring in those days.* (Jasher 12:44). It ain''t new — this is Genesis told straight: *Now these are the generations of Terah: Terah begat Abram, Nahor, and Haran; and Haran begat Lot.* (Genesis 11:27); *And Haran died before his father Terah in the land of his nativity, in Ur of the Chaldees.* (Genesis 11:28) — Jasher only tells us how Haran died and why; *And Abram and Nahor took them wives: the name of Abram''s wife was Sarai; and the name of Nahor''s wife, Milcah, the daughter of Haran, the father of Milcah, and the father of Iscah.* (Genesis 11:29); *But Sarai was barren; she had no child.* (Genesis 11:30). The retelling carries the canon, name for name.',
       sv.verse_id, ev.verse_id, 'extras', 55281
  FROM _session252_ja12_lookup sv, _session252_ja12_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=26
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=12 AND ev.verse_number=44
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-12-abram-called-out-of-ur',
       E'Get thee out — the election of Abram from the idolatrous world',
       E'Delivered from the fire, Abram does not found a religion; he serves Yahuah and draws others, then urges his father to leave the land of the tyrant: *And Abram returned on that day and went to his father''s house, he and the men that followed him, and Abram served Yahuah his Elohim (the Lord his God) all the days of his life, and he walked in his ways and followed his law.* (Jasher 12:42); *Now therefore hearken to my voice, and let us arise and go to the land of Canaan, out of the reach of injury from Nimrod; and serve you Yahuah (the Lord) who created you in the earth and it will be well with you; and cast away all the vain things which you pursue.* (Jasher 12:68). It ain''t new — this is the election the canon names: Yahuah took Abram out of the world that served other gods, *Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods. And I took your father Abraham from the other side of the flood* (Joshua 24:2-3); *Look unto Abraham your father, and unto Sarah that bare you: for I called him alone, and blessed him, and increased him.* (Isaiah 51:2) — called alone, election before any confession; *The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran* (Acts 7:2); and the call itself: *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee* (Genesis 12:1). The seed is chosen and kept out of the idolatrous world — not a church, the covenant line.',
       sv.verse_id, ev.verse_id, 'extras', 55284
  FROM _session252_ja12_lookup sv, _session252_ja12_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=42
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=12 AND ev.verse_number=68
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-12-jubilees-self-link',
       E'The same events in Jubilees — Haran in the fire, the wife, the call',
       E'Jasher narrates the very events the Jubilees apparatus carries, and the two confirm each other. Haran dies in the fire of the Chaldees: *And Haran died when they had cast him into the fire, and he was burned to ashes, for his heart was not perfect with Yahuah (the Lord)* (Jasher 12:26) — Jubilees gives the same death by fire in Ur: *And Haran hasted to save them, but the fire flamed over him, and he was burnt in the fire, and he died in Ur of the Chaldees before Terah his father, and they buried him in Ur of the Chaldees...* (Jubilees 12:14). Abram takes Sarai to wife: *the wife of Nahor was Milca and the name of Abram''s wife was Sarai* (Jasher 12:44) — *And in the fortieth jubilee, in the second week, in the seventh year thereof, Abram took to himself a wife, and her name was Sarai, the daughter of his father, and she became his wife.* (Jubilees 12:9). And Abram urges Terah to forsake the idols and follow Yahuah — *serve you Yahuah (the Lord) who created you in the earth... and cast away all the vain things which you pursue* (Jasher 12:68) — exactly as Jubilees has him plead: *Worship the Elohim (God) of heaven, Who causes the rain and the dew to descend on the earth... Why do you worship things that have no spirit in them? For they are the work of (men''s) hands...* (Jubilees 12:2). Two witnesses to the one covenant story — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55287
  FROM _session252_ja12_lookup sv, _session252_ja12_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=26
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=12 AND ev.verse_number=68
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-12-furnace-deliverance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 3:6 — *And whoso falleth not down and worshippeth shall the same hour be cast into the midst of a burning fiery furnace.* Nimrod''s brick furnace prepared three days and nights (Jasher 12:6) is the same king-of-man instrument Nebuchadnezzar wields against those who will not worship the image.'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-furnace-deliverance'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 3:22 — *Therefore because the king''s commandment was urgent, and the furnace exceeding hot, the flame of the fire slew those men that took up Shadrach, Meshach, and Abed-nego.* As the flame slays Nebuchadnezzar''s executioners, so the fire spreads over Nimrod''s servants and twelve of them die while Abram walks unharmed (Jasher 12:26).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-furnace-deliverance'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 3:27 — *And the princes, governors, and captains, and the king''s counsellors, being gathered together, saw these men, upon whose bodies the fire had no power, nor was an hair of their head singed, neither were their coats changed, nor the smell of fire had passed on them.* The same wonder the king''s princes report of Abram, whose garments are unburned though the binding cord is consumed (Jasher 12:27).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-furnace-deliverance'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 43:2 — *When thou passest through the waters, I will be with thee; and through the rivers, they shall not overflow thee: when thou walkest through the fire, thou shalt not be burned; neither shall the flame kindle upon thee.* The covenant word the legend dramatizes as Abram remains and walks about in the fire (Jasher 12:25).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-furnace-deliverance'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Hebrews 11:34 — *Quenched the violence of fire, escaped the edge of the sword, out of weakness were made strong, waxed valiant in fight, turned to flight the armies of the aliens.* The faith-roll''s quenched fire, the same deliverance Yahuah works for Abram when he came down and the man was not burned (Jasher 12:24).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-furnace-deliverance'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-12-nimrod-slay-the-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 1:16 — *And he said, When ye do the office of a midwife to the Hebrew women, and see them upon the stools; if it be a son, then ye shall kill him: but if it be a daughter, then she shall live.* Pharaoh''s decree against the Hebrew sons is the same king-of-man terror that made Nimrod kill the substituted child and seek Abram''s death (Jasher 12:10, 16).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-nimrod-slay-the-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 2:13 — *Arise, and take the young child and his mother, and flee into Egypt, and be thou there until I bring thee word: for Herod will seek the young child to destroy him.* Herod''s hunt for the child mirrors Nimrod sending servants in secret to seize Abram and put him to death (Jasher 12:58).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-nimrod-slay-the-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=58
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 12:4 — *And his tail drew the third part of the stars of heaven, and did cast them to the earth: and the dragon stood before the woman which was ready to be delivered, for to devour her child as soon as it was born.* The dragon waiting to devour the child is the same star-and-slaughter pattern Nimrod''s seers read, the seed of Abram that will slay the king in latter days (Jasher 12:55).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-nimrod-slay-the-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=55
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 105:14 — *He suffered no man to do them wrong: yea, he reproved kings for their sakes.* Yahuah''s guard over the patriarchs against kings answers the counsellor''s threat that Abram''s seed will war with and smite the king''s hosts (Jasher 12:53).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-nimrod-slay-the-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=53
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-12-haran-dies-ur
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 11:28 — *And Haran died before his father Terah in the land of his nativity, in Ur of the Chaldees.* The bare canon record that Jasher fills out — Haran burned to ashes in the fire of Casdim because his heart was not perfect with Yahuah (Jasher 12:26).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-haran-dies-ur'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 11:29 — *And Abram and Nahor took them wives: the name of Abram''s wife was Sarai; and the name of Nahor''s wife, Milcah, the daughter of Haran, the father of Milcah, and the father of Iscah.* The same double marriage of the brothers to Haran''s daughters that Jasher records (Jasher 12:44).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-haran-dies-ur'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 11:30 — *But Sarai was barren; she had no child.* The same note Jasher carries, that Sarai was barren and had no offspring in those days (Jasher 12:44).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-haran-dies-ur'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-12-abram-called-out-of-ur
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods.* The idolatrous land Abram begs Terah to leave for Canaan (Jasher 12:65) is the very world Joshua names — the fathers served other gods beyond the river.'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-abram-called-out-of-ur'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=65
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 51:2 — *Look unto Abraham your father, and unto Sarah that bare you: for I called him alone, and blessed him, and increased him.* Called alone — election before confession, the same Abram who from that day served Yahuah all his days and inclined men''s hearts to Him (Jasher 12:42-43).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-abram-called-out-of-ur'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=51 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran.* Stephen sets the call in Mesopotamia before Haran, the same flight from Nimrod''s reach toward Canaan that Abram urges on Terah (Jasher 12:68).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-abram-called-out-of-ur'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=68
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 12:1 — *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father''s house, unto a land that I will shew thee.* The canon call that Jasher dramatizes as Abram''s plea to leave the land of Nimrod and go to Canaan (Jasher 12:68).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-abram-called-out-of-ur'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=68
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Hebrews 11:8 — *By faith Abraham, when he was called to go out into a place which he should after receive for an inheritance, obeyed; and he went out, not knowing whither he went.* The faith that walked in Yahuah''s ways and followed His law all Abram''s days (Jasher 12:42) is the faith that obeyed the call.'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-abram-called-out-of-ur'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-12-jubilees-self-link
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jubilees 12:14 — *And Haran hasted to save them, but the fire flamed over him, and he was burnt in the fire, and he died in Ur of the Chaldees before Terah his father, and they buried him in Ur of the Chaldees...* The same death of Haran by fire in the Chaldees that Jasher records, his heart not perfect with Yahuah (Jasher 12:26).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-jubilees-self-link'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=26
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=12 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jubilees 12:9 — *And in the fortieth jubilee, in the second week, in the seventh year thereof, Abram took to himself a wife, and her name was Sarai, the daughter of his father, and she became his wife.* The same marriage of Abram to Sarai that Jasher records alongside Nahor''s to Milca (Jasher 12:44).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-jubilees-self-link'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=44
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=12 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 12:2 — *What help and profit have we from those idols which you do worship, And before which you do bow yourself? For there is no spirit in them, For they are dumb forms, and a misleading of the heart. Worship them not: Worship the Elohim (God) of heaven, Who causes the rain and the dew to descend on the earth...* Abram''s idol-polemic to his father, the same plea Jasher gives him to cast away the vain things and serve Yahuah (Jasher 12:68).'
  FROM cross_reference_threads t, cross_references x, _session252_ja12_lookup sv, _session252_ja12_lookup tv
 WHERE t.slug='jasher-12-jubilees-self-link'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=12 AND sv.verse_number=68
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jasher_13.sql (session252 jasher 13) -----
-- Source anchor: jasher/jasher ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja13 (view _session252_ja13_lookup). Sort band base 55300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-13-out-of-haran
  ('jasher', 'jasher', 13, 1, 'canon', 'acts', 7, 2, 'free', E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran* — Stephen sets the same Ur-to-Haran migration that opens Jasher 13:1 at the head of the gospel story.'),
  ('jasher', 'jasher', 13, 1, 'canon', 'acts', 7, 4, 'free', E'Acts 7:4 — *Then came he out of the land of the Chaldæans, and dwelt in Charran: and from thence, when his father was dead, he removed him into this land, wherein ye now dwell* — the very Ur-Casdim-to-Haran-to-Canaan route Terah''s household travels in Jasher 13:1.'),
  ('jasher', 'jasher', 13, 2, 'canon', 'joshua', 24, 2, 'free', E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods* — names the idolatry the seed Abram teaches against in Haran (Jasher 13:2) was called out of.'),
  ('jasher', 'jasher', 13, 5, 'canon', 'joshua', 24, 3, 'free', E'Joshua 24:3 — *And I took your father Abraham from the other side of the flood, and led him throughout all the land of Canaan, and multiplied his seed, and gave him Isaac* — election precedes confession: the same going-up to Canaan Abram makes at Yahuah''s word in Jasher 13:5.'),
  ('jasher', 'jasher', 13, 1, 'jubilees', 'jubilees', 12, 28, 'extras', E'Jubilees 12:28 — *And it came to pass in the seventh year of the sixth week that he spoke to his father, and informed him that he would leave Haran to go into the land of Canaan to see it and return to him...* — the Jubilees apparatus keeps the same Haran stop on the road to Canaan that opens Jasher 13:1.'),
  -- thread: jasher-13-keep-my-commandments
  ('jasher', 'jasher', 13, 4, 'canon', 'genesis', 15, 5, 'free', E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be* — the seed-like-the-stars promise Yahuah binds to keeping his commandments in Jasher 13:4.'),
  ('jasher', 'jasher', 13, 4, 'canon', 'genesis', 15, 6, 'free', E'Genesis 15:6 — *And he believed in Yahuah (LORD); and he counted it to him for righteousness* — Abram''s faith answers the same star-multiplied promise spoken over him in Jasher 13:4.'),
  ('jasher', 'jasher', 13, 4, 'canon', 'hebrews', 11, 8, 'free', E'Hebrews 11:8 — *By faith Abraham, when he was called to go out into a place which he should after receive for an inheritance, obeyed; and he went out, not knowing whither he went* — the obedience to Yahuah''s voice that Jasher 13:4 lays as the condition of the blessing.'),
  ('jasher', 'jasher', 13, 8, 'canon', 'genesis', 12, 7, 'free', E'Genesis 12:7 — *And Yahuah (LORD) appeared unto Abram, and said, Unto thy seed will I give this land: and there builded he an altar unto Yahuah (LORD), who appeared unto him* — the same altar Abram builds and calls on the Name in Jasher 13:8.'),
  -- thread: jasher-13-this-land-to-thy-seed
  ('jasher', 'jasher', 13, 7, 'canon', 'genesis', 12, 7, 'free', E'Genesis 12:7 — *And Yahuah (LORD) appeared unto Abram, and said, Unto thy seed will I give this land: and there builded he an altar unto Yahuah (LORD), who appeared unto him* — the same land-to-your-seed word Yahuah speaks at Abram''s entry into Canaan in Jasher 13:7.'),
  ('jasher', 'jasher', 13, 7, 'canon', 'genesis', 13, 15, 'free', E'Genesis 13:15 — *For all the land which thou seest, to thee will I give it, and to thy seed for ever* — the all-the-lands-which-you-see inheritance forever of Jasher 13:7.'),
  ('jasher', 'jasher', 13, 18, 'canon', 'genesis', 15, 18, 'free', E'Genesis 15:18 — *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates* — the very river-to-river boundary Yahuah draws for the seed in Jasher 13:18.'),
  ('jasher', 'jasher', 13, 7, 'jubilees', 'jubilees', 13, 2, 'extras', E'Jubilees 13:2 — *...And Yahuah (God) said to him: “To you and to your seed will I give this land.”* — the Jubilees apparatus carries the same land-grant to the seed at Abram''s entry that Jasher 13:7 records.'),
  -- thread: jasher-13-nimrod-chedorlaomer-war
  ('jasher', 'jasher', 13, 12, 'canon', 'genesis', 10, 8, 'free', E'Genesis 10:8 — *And Cush begat Nimrod: he began to be a mighty one in the earth* — the canon names Nimrod the first tyrant-king of Shinar whose war Jasher 13:12 recounts.'),
  ('jasher', 'jasher', 13, 13, 'canon', 'genesis', 11, 8, 'free', E'Genesis 11:8 — *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city* — the dispersal of the tower-host that Jasher 13:13 says scattered Chedorlaomer to Elam.'),
  ('jasher', 'jasher', 13, 11, 'canon', 'genesis', 14, 4, 'free', E'Genesis 14:4 — *Twelve years they served Chedorlaomer, and in the thirteenth year they rebelled* — the same twelve-year service and thirteenth-year revolt against Chedorlaomer that Jasher 13:11 dates to Abram''s fifth year in Canaan.'),
  ('jasher', 'jasher', 13, 16, 'canon', 'genesis', 14, 1, 'free', E'Genesis 14:1 — *And it came to pass in the days of Amraphel king of Shinar, Arioch king of Ellasar, Chedorlaomer king of Elam, and Tidal king of nations* — the same Arioch and Tidal Chedorlaomer covenants with in Jasher 13:16.'),
  -- thread: jasher-13-go-forth-great-nation
  ('jasher', 'jasher', 13, 23, 'canon', 'genesis', 12, 1, 'free', E'Genesis 12:1 — *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father’s house, unto a land that I will shew thee* — the founding go-forth call Yahuah renews in Jasher 13:23.'),
  ('jasher', 'jasher', 13, 23, 'canon', 'genesis', 12, 2, 'free', E'Genesis 12:2 — *And I will make of thee a great nation, and I will bless thee, and make thy name great; and thou shalt be a blessing* — the great-nation, great-name blessing Jasher 13:23 quotes back to Abram.'),
  ('jasher', 'jasher', 13, 23, 'canon', 'genesis', 12, 3, 'free', E'Genesis 12:3 — *And I will bless them that bless thee, and curse him that curseth thee: and in thee shall all families of the earth be blessed* — the families-of-the-earth blessing Jasher 13:23 carries verbatim.'),
  ('jasher', 'jasher', 13, 26, 'canon', 'genesis', 12, 4, 'free', E'Genesis 12:4 — *So Abram departed, as Yahuah (LORD) had spoken unto him; and Lot went with him: and Abram was seventy and five years old when he departed out of Haran* — the same seventy-five-year-old Abram leaving Haran with Lot in Jasher 13:26.'),
  -- thread: jasher-13-death-of-noah
  ('jasher', 'jasher', 13, 9, 'canon', 'genesis', 9, 28, 'free', E'Genesis 9:28 — *And Noah lived after the flood three hundred and fifty years* — the canon''s count that closes Noah''s nine hundred and fifty years just as Jasher 13:9 marks his death in Abram''s fifty-eighth year.'),
  ('jasher', 'jasher', 13, 9, 'canon', 'hebrews', 11, 7, 'free', E'Hebrews 11:7 — *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith* — keeps the same Noah whose death Jasher 13:9 records in the roll of faith that runs into Abram''s call.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-13-out-of-haran',
       E'Out of Haran — the call to go to Canaan',
       E'Jasher opens with the chosen seed pulled out of the idol-world: *And Terah took his son Abram and his grandson Lot, the son of Haran, and Sarai his daughter-in-law, the wife of his son Abram, and all the souls of his household and went with them from Ur Casdim to go to the land of Canaan. And when they came as far as the land of Haran they remained there, for it was exceedingly good land for pasture* (Jasher 13:1). This is the very migration Stephen sets at the head of the whole story: *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran* (Acts 7:2), and *Then came he out of the land of the Chaldæans, and dwelt in Charran: and from thence, when his father was dead, he removed him into this land, wherein ye now dwell* (Acts 7:4). Joshua names the idolatry the seed was called out of: *Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods* (Joshua 24:2). Election precedes confession — Yahuah took Abram out before he could choose: *And I took your father Abraham from the other side of the flood, and led him throughout all the land of Canaan, and multiplied his seed, and gave him Isaac* (Joshua 24:3). Jubilees keeps the same stop at Haran and the father''s blessing to go: *And it came to pass in the seventh year of the sixth week that he spoke to his father, and informed him that he would leave Haran to go into the land of Canaan to see it and return to him* (Jubilees 12:28). It ain''t new — the canon already carries the call out of Chaldea.',
       sv.verse_id, ev.verse_id, 'extras', 55300
  FROM _session252_ja13_lookup sv, _session252_ja13_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=13 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-13-keep-my-commandments',
       E'Hearken to my voice and keep my commandments — Torah before Sinai',
       E'Yahuah meets Abram in Haran and binds the promise to obedience long before Sinai: *And now therefore if you will hearken to my voice and keep my commandments, my statutes and my laws, then will I cause your enemies to fall before you, and I will multiply your seed like the stars of heaven, and I will send my blessing upon all the works of your hands, and you shall lack nothing* (Jasher 13:4). The fathers kept the way; the law was not a curse hung on Israel at Horeb but the path the chosen seed already walked — it ain''t new. And the seed-like-the-stars word is the canon''s own: *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be* (Genesis 15:5), which Abram answered with the faith that anchors the whole covenant: *And he believed in Yahuah (LORD); and he counted it to him for righteousness* (Genesis 15:6). Jasher''s altar-builder is the canon''s: *And Abram built an altar in the place where Elohim had spoken to him, and Abram there called upon the name of Yahuah (the Lord)* (Jasher 13:8) — *and there builded he an altar unto Yahuah (LORD), who appeared unto him* (Genesis 12:7). Hebrews names the faith that obeyed the call: *By faith Abraham, when he was called to go out into a place which he should after receive for an inheritance, obeyed; and he went out, not knowing whither he went* (Hebrews 11:8).',
       sv.verse_id, ev.verse_id, 'extras', 55303
  FROM _session252_ja13_lookup sv, _session252_ja13_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=4
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=13 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-13-this-land-to-thy-seed',
       E'This is the land I give to your seed forever',
       E'Arriving in Canaan, Abram receives the land-grant that frames the whole Torah: *And Yahuah (the Lord) appeared to Abram when he came to the land of Canaan, and said to him, This is the land which I gave to you and to your seed after you forever, and I will make your seed like the stars of heaven, and I will give to your seed for an inheritance all the lands which you see* (Jasher 13:7). The canon speaks it word for word: *And Yahuah (LORD) appeared unto Abram, and said, Unto thy seed will I give this land* (Genesis 12:7), and again *For all the land which thou seest, to thee will I give it, and to thy seed for ever* (Genesis 13:15). The boundaries Jasher draws — *Now therefore walk before me and be perfect and keep my commands, for to you and to your seed I will give this land for an inheritance, from the river Mitzraim to the great river Euphrates* (Jasher 13:18) — are the cut-covenant of Genesis: *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates* (Genesis 15:18). This is the twelve-tribe inheritance kept and chosen, not a spiritual category. Jubilees holds the same grant on the same hill: *And Yahuah (God) said to him: “To you and to your seed will I give this land”* (Jubilees 13:2).',
       sv.verse_id, ev.verse_id, 'extras', 55306
  FROM _session252_ja13_lookup sv, _session252_ja13_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=7
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=13 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-13-nimrod-chedorlaomer-war',
       E'Nimrod king of Shinar wars with Chedorlaomer — the kingdom of man',
       E'Jasher fills in the back-story of the war Genesis only names: *And in the tenth year of Abram’s dwelling in the land of Canaan there was war between Nimrod king of Shinar and Chedorlaomer king of Elam, and Nimrod came to fight with Chedorlaomer and to subdue him* (Jasher 13:12). This is the rebel kingdom-of-man at its own throat — the Babel-builder whose tower-host scattered: *For Chedorlaomer was at that time one of the princes of the hosts of Nimrod, and when all the people at the tower were dispersed and those that remained were also scattered upon the face of the earth, Chedorlaomer went to the land of Elam and reigned over it and rebelled against his Lord* (Jasher 13:13). The canon names Nimrod the first tyrant-king: *And Cush begat Nimrod: he began to be a mighty one in the earth* (Genesis 10:8), *He was a mighty hunter before Yahuah (LORD): wherefore it is said, Even as Nimrod the mighty hunter before Yahuah (LORD)* (Genesis 10:9) — and scatters his tower: *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city* (Genesis 11:8). Genesis carries the same Chedorlaomer revolt Jasher times to Abram''s fifth year (Jasher 13:11): *Twelve years they served Chedorlaomer, and in the thirteenth year they rebelled* (Genesis 14:4), with the same Arioch and Tidal of Jasher 13:16: *And it came to pass in the days of Amraphel king of Shinar, Arioch king of Ellasar, Chedorlaomer king of Elam, and Tidal king of nations* (Genesis 14:1). The kingdom of man rises and tears itself; the seed sits quiet in Canaan.',
       sv.verse_id, ev.verse_id, 'extras', 55309
  FROM _session252_ja13_lookup sv, _session252_ja13_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=11
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=13 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-13-go-forth-great-nation',
       E'Go forth from your land — in you shall the families of the earth be blessed',
       E'After the war and the altars, Yahuah renews the founding call of Genesis 12, which Jasher quotes almost word for word: *Behold, I spoke to you these twenty years back saying, Go forth from your land, from your birth-place and from your father’s house, to the land which I have shown you to give it to you and to your children, for there in that land will I bless you, and make you a great nation, and make your name great, and in you shall the families of the earth be blessed* (Jasher 13:22-23). The canon''s own first words to Abram: *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father’s house, unto a land that I will shew thee* (Genesis 12:1), *And I will make of thee a great nation, and I will bless thee, and make thy name great; and thou shalt be a blessing* (Genesis 12:2), *And I will bless them that bless thee, and curse him that curseth thee: and in thee shall all families of the earth be blessed* (Genesis 12:3). And Jasher''s seventy-five-year-old who returns to Canaan with Lot — *and Abram was seventy-five years old when he went forth from Haran to return to the land of Canaan* (Jasher 13:26) — is the canon''s exactly: *So Abram departed, as Yahuah (LORD) had spoken unto him; and Lot went with him: and Abram was seventy and five years old when he departed out of Haran* (Genesis 12:4). It ain''t new — the families-of-the-earth blessing was already spoken over the chosen seed.',
       sv.verse_id, ev.verse_id, 'extras', 55312
  FROM _session252_ja13_lookup sv, _session252_ja13_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=22
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=13 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-13-death-of-noah',
       E'Noah died — nine hundred and fifty years',
       E'Jasher marks the seed-line''s generations by their deaths, and here the ark-father passes in Abram''s lifetime: *At that time, at the end of three years of Abram’s dwelling in the land of Canaan, in that year Noah died, which was the fifty-eighth year of the life of Abram; and all the days that Noah lived were nine hundred and fifty years and he died* (Jasher 13:9). The canon closes Noah''s nine-hundred-fifty exactly there: *And Noah lived after the flood three hundred and fifty years* (Genesis 9:28) — the same total the genealogy of the chosen line records. And Hebrews keeps Noah in the very roll of faith that runs straight into Abram''s call, the seed kept generation to generation: *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith* (Hebrews 11:7). Adam to Seth to Noah to Shem to Abraham — Jasher traces the line death by death; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55315
  FROM _session252_ja13_lookup sv, _session252_ja13_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=9
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=13 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-13-out-of-haran
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Acts 7:2 — *And he said, Men, brethren, and fathers, hearken; The Elohim (God) of glory appeared unto our father Abraham, when he was in Mesopotamia, before he dwelt in Charran* — Stephen sets the same Ur-to-Haran migration that opens Jasher 13:1 at the head of the gospel story.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-out-of-haran'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Acts 7:4 — *Then came he out of the land of the Chaldæans, and dwelt in Charran: and from thence, when his father was dead, he removed him into this land, wherein ye now dwell* — the very Ur-Casdim-to-Haran-to-Canaan route Terah''s household travels in Jasher 13:1.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-out-of-haran'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joshua 24:2 — *And Joshua said unto all the people, Thus saith Yahuah Elohim (the LORD God) of Yashar''el (Israel), Your fathers dwelt on the other side of the flood in old time, even Terah, the father of Abraham, and the father of Nachor: and they served other gods* — names the idolatry the seed Abram teaches against in Haran (Jasher 13:2) was called out of.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-out-of-haran'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Joshua 24:3 — *And I took your father Abraham from the other side of the flood, and led him throughout all the land of Canaan, and multiplied his seed, and gave him Isaac* — election precedes confession: the same going-up to Canaan Abram makes at Yahuah''s word in Jasher 13:5.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-out-of-haran'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 12:28 — *And it came to pass in the seventh year of the sixth week that he spoke to his father, and informed him that he would leave Haran to go into the land of Canaan to see it and return to him...* — the Jubilees apparatus keeps the same Haran stop on the road to Canaan that opens Jasher 13:1.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-out-of-haran'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=1
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=12 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-13-keep-my-commandments
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be* — the seed-like-the-stars promise Yahuah binds to keeping his commandments in Jasher 13:4.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-keep-my-commandments'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:6 — *And he believed in Yahuah (LORD); and he counted it to him for righteousness* — Abram''s faith answers the same star-multiplied promise spoken over him in Jasher 13:4.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-keep-my-commandments'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:8 — *By faith Abraham, when he was called to go out into a place which he should after receive for an inheritance, obeyed; and he went out, not knowing whither he went* — the obedience to Yahuah''s voice that Jasher 13:4 lays as the condition of the blessing.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-keep-my-commandments'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 12:7 — *And Yahuah (LORD) appeared unto Abram, and said, Unto thy seed will I give this land: and there builded he an altar unto Yahuah (LORD), who appeared unto him* — the same altar Abram builds and calls on the Name in Jasher 13:8.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-keep-my-commandments'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-13-this-land-to-thy-seed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 12:7 — *And Yahuah (LORD) appeared unto Abram, and said, Unto thy seed will I give this land: and there builded he an altar unto Yahuah (LORD), who appeared unto him* — the same land-to-your-seed word Yahuah speaks at Abram''s entry into Canaan in Jasher 13:7.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-this-land-to-thy-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 13:15 — *For all the land which thou seest, to thee will I give it, and to thy seed for ever* — the all-the-lands-which-you-see inheritance forever of Jasher 13:7.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-this-land-to-thy-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=13 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 15:18 — *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates* — the very river-to-river boundary Yahuah draws for the seed in Jasher 13:18.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-this-land-to-thy-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 13:2 — *...And Yahuah (God) said to him: “To you and to your seed will I give this land.”* — the Jubilees apparatus carries the same land-grant to the seed at Abram''s entry that Jasher 13:7 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-this-land-to-thy-seed'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=7
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-13-nimrod-chedorlaomer-war
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 10:8 — *And Cush begat Nimrod: he began to be a mighty one in the earth* — the canon names Nimrod the first tyrant-king of Shinar whose war Jasher 13:12 recounts.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-nimrod-chedorlaomer-war'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 11:8 — *So Yahuah (LORD) scattered them abroad from thence upon the face of all the earth: and they left off to build the city* — the dispersal of the tower-host that Jasher 13:13 says scattered Chedorlaomer to Elam.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-nimrod-chedorlaomer-war'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 14:4 — *Twelve years they served Chedorlaomer, and in the thirteenth year they rebelled* — the same twelve-year service and thirteenth-year revolt against Chedorlaomer that Jasher 13:11 dates to Abram''s fifth year in Canaan.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-nimrod-chedorlaomer-war'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 14:1 — *And it came to pass in the days of Amraphel king of Shinar, Arioch king of Ellasar, Chedorlaomer king of Elam, and Tidal king of nations* — the same Arioch and Tidal Chedorlaomer covenants with in Jasher 13:16.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-nimrod-chedorlaomer-war'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-13-go-forth-great-nation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 12:1 — *Now Yahuah (LORD) had said unto Abram, Get thee out of thy country, and from thy kindred, and from thy father’s house, unto a land that I will shew thee* — the founding go-forth call Yahuah renews in Jasher 13:23.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-go-forth-great-nation'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 12:2 — *And I will make of thee a great nation, and I will bless thee, and make thy name great; and thou shalt be a blessing* — the great-nation, great-name blessing Jasher 13:23 quotes back to Abram.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-go-forth-great-nation'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 12:3 — *And I will bless them that bless thee, and curse him that curseth thee: and in thee shall all families of the earth be blessed* — the families-of-the-earth blessing Jasher 13:23 carries verbatim.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-go-forth-great-nation'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 12:4 — *So Abram departed, as Yahuah (LORD) had spoken unto him; and Lot went with him: and Abram was seventy and five years old when he departed out of Haran* — the same seventy-five-year-old Abram leaving Haran with Lot in Jasher 13:26.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-go-forth-great-nation'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-13-death-of-noah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 9:28 — *And Noah lived after the flood three hundred and fifty years* — the canon''s count that closes Noah''s nine hundred and fifty years just as Jasher 13:9 marks his death in Abram''s fifty-eighth year.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-death-of-noah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=9 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:7 — *By faith Noah, being warned of Elohim (God) of things not seen as yet, moved with fear, prepared an ark to the saving of his house; by the which he condemned the world, and became heir of the righteousness which is by faith* — keeps the same Noah whose death Jasher 13:9 records in the roll of faith that runs into Abram''s call.'
  FROM cross_reference_threads t, cross_references x, _session252_ja13_lookup sv, _session252_ja13_lookup tv
 WHERE t.slug='jasher-13-death-of-noah'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=13 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jasher_14.sql (session252 jasher 14) -----
-- Source anchor: jasher/jasher ch14. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja14 (view _session252_ja14_lookup). Sort band base 55325, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-14-wisdom-grace-before-the-king
  ('jasher', 'jasher', 14, 26, 'canon', 'genesis', 41, 38, 'free', E'Genesis 41:38 — *And Pharaoh said unto his servants, Can we find such a one as this is, a man in whom the Spirit of Elohim (God) is?* The canon''s true wise man before Pharaoh is filled with the Spirit of Elohim, where Rikayon of Jasher 14:26 is filled only with the cunning that finds grace in a king''s sight.'),
  ('jasher', 'jasher', 14, 26, 'canon', 'genesis', 41, 39, 'free', E'Genesis 41:39 — *And Pharaoh said unto Joseph, Forasmuch as Elohim (God) hath shewed thee all this, there is none so discreet and wise as thou art* — the same finding-of-grace by wisdom that lifts Rikayon in Jasher 14:26, but the discernment is given by Elohim, not seized from the rabble.'),
  ('jasher', 'jasher', 14, 1, 'canon', 'genesis', 10, 10, 'free', E'Genesis 10:10 — *And the beginning of his kingdom was Babel, and Erech, and Accad, and Calneh, in the land of Shinar* — Rikayon arises out of that same land of Shinar (Jasher 14:1), the seedbed of Nimrod''s kingdom-of-man, and carries its scheming down into Egypt.'),
  -- thread: jasher-14-tax-upon-the-dead
  ('jasher', 'jasher', 14, 19, 'canon', 'proverbs', 28, 15, 'free', E'Proverbs 28:15 — *As a roaring lion, and a ranging bear; so is a wicked ruler over the poor people* — exactly Rikayon, who in Jasher 14:19 exacts a tax even from the dead, the wicked ruler preying on a city he has ruined.'),
  ('jasher', 'jasher', 14, 14, 'canon', 'genesis', 47, 26, 'free', E'Genesis 47:26 — *And Joseph made it a law over the land of Egypt unto this day, that Pharaoh should have the fifth part; except the land of the priests only, which became not Pharaoh''s* — the lawful Egyptian tax "unto this day" set by Joseph to preserve life, the mirror-image of Rikayon''s grave-tax in Jasher 14:14 set only to enrich himself.'),
  ('jasher', 'jasher', 14, 20, 'canon', 'genesis', 47, 20, 'free', E'Genesis 47:20 — *And Joseph bought all the land of Egypt for Pharaoh; for the Egyptians sold every man his field, because the famine prevailed over them: so the land became Pharaoh''s* — the throne Rikayon founds will swallow all Egypt into Pharaoh''s hand, the people crying "the whole city is ruined" already in Jasher 14:20.'),
  -- thread: jasher-14-name-called-pharaoh
  ('jasher', 'jasher', 14, 27, 'canon', 'genesis', 41, 45, 'free', E'Genesis 41:45 — *And Pharaoh called Joseph''s name Zaphnath-paaneah; and he gave him to wife Asenath the daughter of Poti-pherah priest of On. And Joseph went out over all the land of Egypt* — the canon''s renaming of the exalted man, the same gesture by which Rikayon is renamed Pharaoh in Jasher 14:27.'),
  ('jasher', 'jasher', 14, 33, 'canon', 'exodus', 1, 8, 'free', E'Exodus 1:8 — *Now there arose up a new king over Egypt, which knew not Joseph* — the line of Pharaohs founded in Jasher 14:33 runs on "to this day" until one of them turns the kingdom-of-man against the covenant seed.'),
  ('jasher', 'jasher', 14, 33, 'canon', 'exodus', 1, 11, 'free', E'Exodus 1:11 — *Therefore they did set over them taskmasters to afflict them with their burdens. And they built for Pharaoh treasure cities, Pithom and Raamses* — the title Pharaoh, established by Rikayon''s tax in Jasher 14:33, becomes the name of the taskmaster-king who oppresses Yashar''el.'),
  ('jasher', 'jasher', 14, 30, 'jasher', 'jasher', 15, 2, 'extras', E'Jasher 15:2 — *And Abram and all belonging to him rose and went down to Egypt on account of the famine, and when they were at the brook Mitzraim they remained there some time to rest from the fatigue of the road* — the very throne of Pharaoh founded in Jasher 14:30 is the throne the chosen seed Abram meets in the next chapter, the kingdom-of-man and the seed brought face to face.'),
  -- thread: jasher-14-poor-mans-cunning-and-vanity
  ('jasher', 'jasher', 14, 31, 'canon', 'psalms', 49, 16, 'free', E'Psalm 49:16 — *Be not thou afraid when one is made rich, when the glory of his house is increased* — the warning over Rikayon, who in Jasher 14:31 cunningly usurps Egypt and is made rich at the people''s cost.'),
  ('jasher', 'jasher', 14, 15, 'canon', 'psalms', 49, 17, 'free', E'Psalm 49:17 — *For when he dieth he shall carry nothing away: his glory shall not descend after him* — the silver and gold Rikayon gathers in Jasher 14:15 is the very riches the Psalm says a man carries nothing of into death.'),
  ('jasher', 'jasher', 14, 31, 'canon', 'ecclesiastes', 8, 8, 'free', E'Ecclesiastes 8:8 — *There is no man that hath power over the spirit to retain the spirit; neither hath he power in the day of death: and there is no discharge in that war; neither shall wickedness deliver those that are given to it* — the preacher''s verdict on the man like Rikayon (Jasher 14:31) who rules over others to their hurt, yet has no power in the day of death.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-14-wisdom-grace-before-the-king',
       E'The wise man finds grace before the king of Egypt',
       E'Jasher opens not with Nimrod''s furnace but with the etiology of Egypt''s throne: *In those days there was in the land of Shinar a wise man who had understanding in all wisdom, and of a beautiful appearance, but he was poor and indigent; his name was Rikayon and he was hard set to support himself* (Jasher 14:1). A man of wisdom comes out of Shinar to stand before the king of Egypt, and the king''s heart turns to him: *And when the king heard the words of Rikayon and his wisdom, Rikayon found grace in his sight, and he met with grace and kindness from all the servants of the king and from all the inhabitants of Egypt, on account of his wisdom and excellent speeches, and from that time they loved him exceedingly* (Jasher 14:26). It ain''t new — the canon will run this same architecture through Joseph: *And Pharaoh said unto his servants, Can we find such a one as this is, a man in whom the Spirit of Elohim (God) is?* (Genesis 41:38), *Forasmuch as Elohim (God) hath shewed thee all this, there is none so discreet and wise as thou art* (Genesis 41:39). But mark the difference the framework demands: Rikayon''s wisdom is the cunning of the rabble lifting itself, while Joseph''s is the Spirit of Elohim setting the chosen seed over the kingdom-of-man — election, not contrivance, exalts the seed.',
       sv.verse_id, ev.verse_id, 'extras', 55325
  FROM _session252_ja14_lookup sv, _session252_ja14_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=14 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-14-tax-upon-the-dead',
       E'The death-tax: a wicked ruler over the poor people',
       E'Rikayon''s scheme is to set armed men over the graves of Egypt and exact silver from the grieving: *And he commanded them, saying, Thus says the king, Strengthen yourselves and be valiant men, and let no man be buried here until two hundred pieces of silver be given, and then he may be buried* (Jasher 14:14). The people cry out against the burden no former king ever laid: *We know it to be the custom of kings to take a yearly tax from the living, but you dost not only do this, but from the dead also you exact a tax day by day* (Jasher 14:19). This is the kingdom-of-man at its purest — the strong-man devouring the poor — and the prophets name it for what it is: *As a roaring lion, and a ranging bear; so is a wicked ruler over the poor people* (Proverbs 28:15). The canon shows the lawful counterpart in Joseph''s fifth-part, made by famine-mercy and not by extortion: *And Joseph made it a law over the land of Egypt unto this day, that Pharaoh should have the fifth part* (Genesis 47:26) — a fifth taken to keep a people alive, against Rikayon''s tax taken to bleed them in their grief.',
       sv.verse_id, ev.verse_id, 'extras', 55328
  FROM _session252_ja14_lookup sv, _session252_ja14_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=14 AND sv.verse_number=14
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=14 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-14-name-called-pharaoh',
       E'The renaming: how the title Pharaoh began',
       E'The king crowns Rikayon''s cunning by giving him a new name and making it the name of every king to follow: *And the king answered and said to Rikayon, Your name shall no more be called Rikayon but Pharaoh shall be your name, since you did exact a tax from the dead; and he called his name Pharaoh* (Jasher 14:27), *Therefore all the kings that reigned in Egypt from that time forward were called Pharaoh to this day* (Jasher 14:33). The renaming of the exalted man is the canon''s own pattern — *And Pharaoh called Joseph''s name Zaphnath-paaneah* (Genesis 41:45) — but here the name itself is born of extortion, and it becomes the standing title of the kingdom-of-man that will one day turn against the seed: *Now there arose up a new king over Egypt, which knew not Joseph* (Exodus 1:8), the Pharaoh who enslaves Yashar''el and is named here at its founding. Jasher carries the thread forward at once, for the very next chapter brings the chosen seed down to this throne: *And Abram and all belonging to him rose and went down to Egypt on account of the famine* (Jasher 15:2).',
       sv.verse_id, ev.verse_id, 'extras', 55331
  FROM _session252_ja14_lookup sv, _session252_ja14_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=14 AND sv.verse_number=27
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=14 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-14-poor-mans-cunning-and-vanity',
       E'The poor man''s cunning and the vanity of stolen glory',
       E'Rikayon begins poor and pinched with hunger, sleeping in a ruined bake house: *And in the evening Rikayon went out and found a house in ruins, formerly a bake house in Egypt, and he abode there all night in bitterness of soul and pinched with hunger, and sleep was removed from his eyes* (Jasher 14:6). From that bitterness he devises not righteousness but a scheme, and *in eight months time Rikayon and his men gathered great riches of silver and gold* (Jasher 14:15), until *Rikayon Pharaoh cunningly usurped the government of Egypt, and he exacted a tax from all the inhabitants of Egypt* (Jasher 14:31). This is the kingdom-of-man''s whole career in miniature — riches and rule seized by craft — and the Psalm pronounces its end: *Be not thou afraid when one is made rich, when the glory of his house is increased; For when he dieth he shall carry nothing away: his glory shall not descend after him* (Psalm 49:16-17). The wisdom that is only cunning gathers gold over the graves of others, and is itself carried to the grave.',
       sv.verse_id, ev.verse_id, 'extras', 55334
  FROM _session252_ja14_lookup sv, _session252_ja14_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=14 AND sv.verse_number=6
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=14 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-14-wisdom-grace-before-the-king
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 41:38 — *And Pharaoh said unto his servants, Can we find such a one as this is, a man in whom the Spirit of Elohim (God) is?* The canon''s true wise man before Pharaoh is filled with the Spirit of Elohim, where Rikayon of Jasher 14:26 is filled only with the cunning that finds grace in a king''s sight.'
  FROM cross_reference_threads t, cross_references x, _session252_ja14_lookup sv, _session252_ja14_lookup tv
 WHERE t.slug='jasher-14-wisdom-grace-before-the-king'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=14 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 41:39 — *And Pharaoh said unto Joseph, Forasmuch as Elohim (God) hath shewed thee all this, there is none so discreet and wise as thou art* — the same finding-of-grace by wisdom that lifts Rikayon in Jasher 14:26, but the discernment is given by Elohim, not seized from the rabble.'
  FROM cross_reference_threads t, cross_references x, _session252_ja14_lookup sv, _session252_ja14_lookup tv
 WHERE t.slug='jasher-14-wisdom-grace-before-the-king'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=14 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 10:10 — *And the beginning of his kingdom was Babel, and Erech, and Accad, and Calneh, in the land of Shinar* — Rikayon arises out of that same land of Shinar (Jasher 14:1), the seedbed of Nimrod''s kingdom-of-man, and carries its scheming down into Egypt.'
  FROM cross_reference_threads t, cross_references x, _session252_ja14_lookup sv, _session252_ja14_lookup tv
 WHERE t.slug='jasher-14-wisdom-grace-before-the-king'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=10 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-14-tax-upon-the-dead
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 28:15 — *As a roaring lion, and a ranging bear; so is a wicked ruler over the poor people* — exactly Rikayon, who in Jasher 14:19 exacts a tax even from the dead, the wicked ruler preying on a city he has ruined.'
  FROM cross_reference_threads t, cross_references x, _session252_ja14_lookup sv, _session252_ja14_lookup tv
 WHERE t.slug='jasher-14-tax-upon-the-dead'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=14 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=28 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 47:26 — *And Joseph made it a law over the land of Egypt unto this day, that Pharaoh should have the fifth part; except the land of the priests only, which became not Pharaoh''s* — the lawful Egyptian tax "unto this day" set by Joseph to preserve life, the mirror-image of Rikayon''s grave-tax in Jasher 14:14 set only to enrich himself.'
  FROM cross_reference_threads t, cross_references x, _session252_ja14_lookup sv, _session252_ja14_lookup tv
 WHERE t.slug='jasher-14-tax-upon-the-dead'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=14 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=47 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 47:20 — *And Joseph bought all the land of Egypt for Pharaoh; for the Egyptians sold every man his field, because the famine prevailed over them: so the land became Pharaoh''s* — the throne Rikayon founds will swallow all Egypt into Pharaoh''s hand, the people crying "the whole city is ruined" already in Jasher 14:20.'
  FROM cross_reference_threads t, cross_references x, _session252_ja14_lookup sv, _session252_ja14_lookup tv
 WHERE t.slug='jasher-14-tax-upon-the-dead'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=14 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=47 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-14-name-called-pharaoh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 41:45 — *And Pharaoh called Joseph''s name Zaphnath-paaneah; and he gave him to wife Asenath the daughter of Poti-pherah priest of On. And Joseph went out over all the land of Egypt* — the canon''s renaming of the exalted man, the same gesture by which Rikayon is renamed Pharaoh in Jasher 14:27.'
  FROM cross_reference_threads t, cross_references x, _session252_ja14_lookup sv, _session252_ja14_lookup tv
 WHERE t.slug='jasher-14-name-called-pharaoh'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=14 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=41 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 1:8 — *Now there arose up a new king over Egypt, which knew not Joseph* — the line of Pharaohs founded in Jasher 14:33 runs on "to this day" until one of them turns the kingdom-of-man against the covenant seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja14_lookup sv, _session252_ja14_lookup tv
 WHERE t.slug='jasher-14-name-called-pharaoh'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=14 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 1:11 — *Therefore they did set over them taskmasters to afflict them with their burdens. And they built for Pharaoh treasure cities, Pithom and Raamses* — the title Pharaoh, established by Rikayon''s tax in Jasher 14:33, becomes the name of the taskmaster-king who oppresses Yashar''el.'
  FROM cross_reference_threads t, cross_references x, _session252_ja14_lookup sv, _session252_ja14_lookup tv
 WHERE t.slug='jasher-14-name-called-pharaoh'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=14 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jasher 15:2 — *And Abram and all belonging to him rose and went down to Egypt on account of the famine, and when they were at the brook Mitzraim they remained there some time to rest from the fatigue of the road* — the very throne of Pharaoh founded in Jasher 14:30 is the throne the chosen seed Abram meets in the next chapter, the kingdom-of-man and the seed brought face to face.'
  FROM cross_reference_threads t, cross_references x, _session252_ja14_lookup sv, _session252_ja14_lookup tv
 WHERE t.slug='jasher-14-name-called-pharaoh'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=14 AND sv.verse_number=30
   AND tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=15 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-14-poor-mans-cunning-and-vanity
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 49:16 — *Be not thou afraid when one is made rich, when the glory of his house is increased* — the warning over Rikayon, who in Jasher 14:31 cunningly usurps Egypt and is made rich at the people''s cost.'
  FROM cross_reference_threads t, cross_references x, _session252_ja14_lookup sv, _session252_ja14_lookup tv
 WHERE t.slug='jasher-14-poor-mans-cunning-and-vanity'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=14 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=49 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 49:17 — *For when he dieth he shall carry nothing away: his glory shall not descend after him* — the silver and gold Rikayon gathers in Jasher 14:15 is the very riches the Psalm says a man carries nothing of into death.'
  FROM cross_reference_threads t, cross_references x, _session252_ja14_lookup sv, _session252_ja14_lookup tv
 WHERE t.slug='jasher-14-poor-mans-cunning-and-vanity'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=14 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=49 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ecclesiastes 8:8 — *There is no man that hath power over the spirit to retain the spirit; neither hath he power in the day of death: and there is no discharge in that war; neither shall wickedness deliver those that are given to it* — the preacher''s verdict on the man like Rikayon (Jasher 14:31) who rules over others to their hurt, yet has no power in the day of death.'
  FROM cross_reference_threads t, cross_references x, _session252_ja14_lookup sv, _session252_ja14_lookup tv
 WHERE t.slug='jasher-14-poor-mans-cunning-and-vanity'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=14 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=8 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jasher_15.sql (session252 jasher 15) -----
-- Source anchor: jasher/jasher ch15. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja15 (view _session252_ja15_lookup). Sort band base 55350, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-15-famine-down-to-egypt
  ('jasher', 'jasher', 15, 1, 'canon', 'genesis', 12, 10, 'free', E'Genesis 12:10 — *And there was a famine in the land: and Abram went down into Egypt to sojourn there; for the famine was grievous in the land.* The Genesis source of Jasher 15:1-2, the grievous Canaan famine that sends Abram to Egypt.'),
  ('jasher', 'jasher', 15, 1, 'canon', 'genesis', 26, 1, 'free', E'Genesis 26:1 — *And there was a famine in the land, beside the first famine that was in the days of Abraham. And Isaac went unto Abimelech king of the Philistines unto Gerar.* The same famine-driven sojourn recurs over Isaac, showing Jasher 15:1''s scene is a covenant pattern.'),
  ('jasher', 'jasher', 15, 2, 'canon', 'hebrews', 11, 9, 'free', E'Hebrews 11:9 — *By faith he sojourned in the land of promise, as in a strange country, dwelling in tabernacles with Isaac and Jacob, the heirs with him of the same promise.* Names the faith-posture of Abram''s descent in Jasher 15:2 — the elect seed sojourning among the nations.'),
  ('jasher', 'jasher', 15, 2, 'jubilees', 'jubilees', 13, 11, 'extras', E'Jubilees 13:11 — *And Abram went into Egypt in the third year of the week, and he dwelt in Egypt five years before his wife was torn away from him.* Jubilees retells the identical descent into Egypt that opens Jasher 15.'),
  -- thread: jasher-15-she-is-my-sister
  ('jasher', 'jasher', 15, 4, 'canon', 'genesis', 12, 11, 'free', E'Genesis 12:11 — *And it came to pass, when he was come near to enter into Egypt, that he said unto Sarai his wife, Behold now, I know that thou art a fair woman to look upon.* The Genesis source of Abram''s fear in Jasher 15:4 as Egypt nears.'),
  ('jasher', 'jasher', 15, 5, 'canon', 'genesis', 12, 13, 'free', E'Genesis 12:13 — *Say, I pray thee, thou art my sister: that it may be well with me for thy sake; and my soul shall live because of thee.* The exact instruction Jasher 15:5 expands — call yourself sister that it may be well with me.'),
  ('jasher', 'jasher', 15, 6, 'canon', 'genesis', 20, 2, 'free', E'Genesis 20:2 — *And Abraham said of Sarah his wife, She is my sister: and Abimelech king of Gerar sent, and took Sarah.* The same sister-stratagem returns at Gerar, showing Jasher 15:6''s command is a recurring pattern over the seed.'),
  ('jasher', 'jasher', 15, 5, 'canon', 'genesis', 26, 7, 'free', E'Genesis 26:7 — *And the men of the place asked him of his wife; and he said, She is my sister: for he feared to say, She is my wife; lest, said he, the men of the place should kill me for Rebekah; because she was fair to look upon.* Isaac repeats the very fear and stratagem of Jasher 15:5.'),
  -- thread: jasher-15-prayer-and-the-angel-delivers-sarai
  ('jasher', 'jasher', 15, 16, 'canon', 'genesis', 12, 15, 'free', E'Genesis 12:15 — *The princes also of Pharaoh saw her, and commended her before Pharaoh: and the woman was taken into Pharaoh''s house.* The Genesis source of Sarai being brought to Pharaoh''s house in Jasher 15:16.'),
  ('jasher', 'jasher', 15, 19, 'canon', 'psalms', 34, 7, 'free', E'Psalms 34:7 — *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them.* The canon''s word for the delivering angel Jasher 15:19 sends to rescue Sarai.'),
  ('jasher', 'jasher', 15, 16, 'canon', 'psalms', 105, 15, 'free', E'Psalms 105:15 — *Saying, Touch not mine anointed, and do my prophets no harm.* The covenant charter that guards Abram in Pharaoh''s house, the protection his prayer in Jasher 15:16 appeals to.'),
  -- thread: jasher-15-pharaoh-plagued-sarai-restored
  ('jasher', 'jasher', 15, 28, 'canon', 'genesis', 12, 17, 'free', E'Genesis 12:17 — *And Yahuah (LORD) plagued Pharaoh and his house with great plagues because of Sarai Abram''s wife.* The Genesis source of the plague on Pharaoh''s house in Jasher 15:28.'),
  ('jasher', 'jasher', 15, 30, 'canon', 'genesis', 12, 19, 'free', E'Genesis 12:19 — *Why saidst thou, She is my sister? so I might have taken her to me to wife: now therefore behold thy wife, take her, and go thy way.* Pharaoh''s dismissal of Abram and Sarai, expanded in Jasher 15:30.'),
  ('jasher', 'jasher', 15, 28, 'jubilees', 'jubilees', 13, 12, 'extras', E'Jubilees 13:12 — *And it came to pass when Pharaoh seized Sarai, the wife of Abram, that Yahuah (God) plagued Pharaoh and his house with great plagues because of Sarai, Abram''s wife.* Jubilees retells the very plague Jasher 15:28 says smote Pharaoh on Sarai''s account.'),
  ('jasher', 'jasher', 15, 30, 'jubilees', 'jubilees', 13, 15, 'extras', E'Jubilees 13:15 — *And Pharaoh gave back Sarai, the wife of Abram, and he sent him out of the land of Egypt, and he journeyed to the place where he had pitched his tent at the beginning.* The restoration and sending-out that Jasher 15:30 narrates.'),
  -- thread: jasher-15-abram-and-lot-separate
  ('jasher', 'jasher', 15, 36, 'canon', 'genesis', 13, 7, 'free', E'Genesis 13:7 — *And there was a strife between the herdmen of Abram''s cattle and the herdmen of Lot''s cattle: and the Canaanite and the Perizzite dwelled then in the land.* The Genesis source of the herdsmen''s quarrel in Jasher 15:36.'),
  ('jasher', 'jasher', 15, 41, 'canon', 'genesis', 13, 8, 'free', E'Genesis 13:8 — *And Abram said unto Lot, Let there be no strife, I pray thee, between me and thee, and between my herdmen and thy herdmen; for we be brethren.* Abram''s peace-making appeal, expanded in Jasher 15:41.'),
  ('jasher', 'jasher', 15, 46, 'canon', 'genesis', 13, 11, 'free', E'Genesis 13:11 — *Then Lot chose him all the plain of Jordan; and Lot journeyed east: and they separated themselves the one from the other.* Lot''s choice of the well-watered plain and departure, as in Jasher 15:46.'),
  ('jasher', 'jasher', 15, 46, 'jubilees', 'jubilees', 13, 17, 'extras', E'Jubilees 13:17 — *And in the fourth year of this week Lot parted from him, and Lot dwelt in Sodom, and the men of Sodom were sinners exceedingly.* Jubilees records the same parting of Lot to Sodom that closes Jasher 15:46.'),
  -- thread: jasher-15-abram-dwells-in-mamre-hebron
  ('jasher', 'jasher', 15, 47, 'canon', 'genesis', 13, 18, 'free', E'Genesis 13:18 — *Then Abram removed his tent, and came and dwelt in the plain of Mamre, which is in Hebron, and built there an altar unto Yahuah (LORD).* The exact Genesis place-note that Jasher 15:47 records — Mamre in Hebron.'),
  ('jasher', 'jasher', 15, 47, 'canon', 'genesis', 13, 15, 'free', E'Genesis 13:15 — *For all the land which thou seest, to thee will I give it, and to thy seed for ever.* The land-promise renewed to the seed just as Abram settles in the place where Jasher 15:47 leaves him dwelling.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-15-famine-down-to-egypt',
       E'The famine drives Abram down to Egypt',
       E'Jasher opens the cycle exactly where Genesis does: *And in that year there was a heavy famine throughout the land of Canaan, and the inhabitants of the land could not remain on account of the famine for it was very grievous. And Abram and all belonging to him rose and went down to Egypt on account of the famine* (Jasher 15:1-2). Genesis carries the same scene unembellished — *And there was a famine in the land: and Abram went down into Egypt to sojourn there; for the famine was grievous in the land* (Genesis 12:10). The very same famine recurs over Isaac a generation later — *And there was a famine in the land, beside the first famine that was in the days of Abraham. And Isaac went unto Abimelech king of the Philistines unto Gerar* (Genesis 26:1) — the chosen seed sojourning among the nations is a pattern, not a one-off. Hebrews names the posture: *By faith he sojourned in the land of promise, as in a strange country, dwelling in tabernacles with Isaac and Jacob, the heirs with him of the same promise* (Hebrews 11:9). And Jubilees retells the identical descent — *And Abram went into Egypt in the third year of the week, and he dwelt in Egypt five years before his wife was torn away from him* (Jubilees 13:11). It ain''t new — Jasher is repeating the canon''s own famine-and-sojourn.',
       sv.verse_id, ev.verse_id, 'extras', 55350
  FROM _session252_ja15_lookup sv, _session252_ja15_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=15 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-15-she-is-my-sister',
       E'Say you are my sister — fear of the nations',
       E'On the border of Egypt Abram, fearing the godless land, instructs Sarai: *And Abram said to his wife Sarai, Since Elohim (God) has created you with such a beautiful countenance, I am afraid of the Egyptians lest they should slay me and take you away, for the fear of Elohim is not in these places. Surely then you shall do this, Say you are my sister to all that may ask you* (Jasher 15:4-5). This is Genesis 12 word-for-word in substance — *Behold now, I know that thou art a fair woman to look upon... Say, I pray thee, thou art my sister: that it may be well with me for thy sake; and my soul shall live because of thee* (Genesis 12:11,13). The same stratagem returns at Gerar with Abimelech — *And Abraham said of Sarah his wife, She is my sister: and Abimelech king of Gerar sent, and took Sarah* (Genesis 20:2) — and again over Isaac and Rebekah — *and he said, She is my sister: for he feared to say, She is my wife; lest, said he, the men of the place should kill me for Rebekah* (Genesis 26:7). The patriarch''s fear of the nations who have no fear of Elohim is the recurring danger over the chosen seed; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55353
  FROM _session252_ja15_lookup sv, _session252_ja15_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=3
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=15 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-15-prayer-and-the-angel-delivers-sarai',
       E'Sarai taken — Abram prays and the angel delivers',
       E'Sarai is carried into Pharaoh''s house and Abram cries out: *And the woman was then brought to Pharaoh''s house, and Abram grieved on account of his wife, and he prayed to Yahuah (the Lord) to deliver her from the hands of Pharaoh* (Jasher 15:16), and Yahuah answers — *And Yahuah (the Lord) hearkened to the voice of Sarai, and Yahuah (the Lord) sent an angel to deliver Sarai from the power of Pharaoh* (Jasher 15:19). Genesis states the taking plainly — *The princes also of Pharaoh saw her, and commended her before Pharaoh: and the woman was taken into Pharaoh''s house* (Genesis 12:15) — and the Psalms supply the deliverance Jasher dramatizes as an angel: *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them* (Psalms 34:7). The 105th Psalm makes it the very charter of Abram''s protection among the kings — *He suffered no man to do them wrong: yea, he reproved kings for their sakes; Saying, Touch not mine anointed, and do my prophets no harm* (Psalms 105:14-15). Where Jasher adds the standing angel, the canon already carries the deliverance: it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55356
  FROM _session252_ja15_lookup sv, _session252_ja15_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=16
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=15 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-15-pharaoh-plagued-sarai-restored',
       E'Pharaoh plagued; Sarai restored with gifts',
       E'The angel''s strokes fall on Pharaoh''s whole house until the king relents: *And Pharaoh knew that he was smitten on account of Sarai... in the morning the king called for Abram and said to him, What is this you have done to me?... Now therefore here is your wife, take her and go from our land lest we all die on her account* (Jasher 15:28-30), and the king loads Abram with cattle, servants, silver and gold (Jasher 15:30,33). Genesis is the spare original — *And Yahuah (LORD) plagued Pharaoh and his house with great plagues because of Sarai Abram''s wife* (Genesis 12:17), and *now therefore behold thy wife, take her, and go thy way* (Genesis 12:19). Jubilees narrates the same plague and restoration — *it came to pass when Pharaoh seized Sarai, the wife of Abram, that Yahuah (God) plagued Pharaoh and his house with great plagues because of Sarai, Abram''s wife* (Jubilees 13:12), and *And Pharaoh gave back Sarai, the wife of Abram, and he sent him out of the land of Egypt* (Jubilees 13:15). The kings-of-man are reproved for the seed''s sake; the same architecture runs through every retelling.',
       sv.verse_id, ev.verse_id, 'extras', 55359
  FROM _session252_ja15_lookup sv, _session252_ja15_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=28
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=15 AND ev.verse_number=33
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-15-abram-and-lot-separate',
       E'Abram and Lot separate in peace',
       E'Back in Canaan the substance grows too great and strife breaks out: *And when Abram was dwelling in the land the herdsmen of Lot quarrelled with the herdsmen of Abram, for their property was too great for them to remain together in the land* (Jasher 15:36), and Abram makes peace — *Now I beseech you let there be no more quarrelling between us, for we are kinsmen. But I pray you separate from me, go and choose a place where you may dwell* (Jasher 15:41-42). Genesis is the source, nearly verbatim — *And there was a strife between the herdmen of Abram''s cattle and the herdmen of Lot''s cattle* (Genesis 13:7), *Let there be no strife, I pray thee, between me and thee, and between my herdmen and thy herdmen; for we be brethren* (Genesis 13:8). Lot lifts his eyes to Jordan and chooses Sodom — *Then Lot chose him all the plain of Jordan; and Lot journeyed east: and they separated themselves the one from the other* (Genesis 13:11) — and Jubilees marks it: *And in the fourth year of this week Lot parted from him, and Lot dwelt in Sodom, and the men of Sodom were sinners exceedingly* (Jubilees 13:17).',
       sv.verse_id, ev.verse_id, 'extras', 55362
  FROM _session252_ja15_lookup sv, _session252_ja15_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=36
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=15 AND ev.verse_number=46
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-15-abram-dwells-in-mamre-hebron',
       E'Abram dwells in the plain of Mamre at Hebron',
       E'The chapter closes with Abram settled in the land of promise: *And Abram dwelt in the plain of Mamre, which is in Hebron, and he pitched his tent there, and Abram remained in that place many years* (Jasher 15:47). Genesis ends the Lot account in the very same place — *Then Abram removed his tent, and came and dwelt in the plain of Mamre, which is in Hebron, and built there an altar unto Yahuah (LORD)* (Genesis 13:18). And just after Lot''s departure the land-promise to the seed is renewed — *For all the land which thou seest, to thee will I give it, and to thy seed for ever. And I will make thy seed as the dust of the earth* (Genesis 13:15-16). The elect seed dwells in the land deeded forever; the promise to the fathers is the same promise carried through every telling — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55365
  FROM _session252_ja15_lookup sv, _session252_ja15_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=47
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=15 AND ev.verse_number=47
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-15-famine-down-to-egypt
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 12:10 — *And there was a famine in the land: and Abram went down into Egypt to sojourn there; for the famine was grievous in the land.* The Genesis source of Jasher 15:1-2, the grievous Canaan famine that sends Abram to Egypt.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-famine-down-to-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 26:1 — *And there was a famine in the land, beside the first famine that was in the days of Abraham. And Isaac went unto Abimelech king of the Philistines unto Gerar.* The same famine-driven sojourn recurs over Isaac, showing Jasher 15:1''s scene is a covenant pattern.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-famine-down-to-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:9 — *By faith he sojourned in the land of promise, as in a strange country, dwelling in tabernacles with Isaac and Jacob, the heirs with him of the same promise.* Names the faith-posture of Abram''s descent in Jasher 15:2 — the elect seed sojourning among the nations.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-famine-down-to-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 13:11 — *And Abram went into Egypt in the third year of the week, and he dwelt in Egypt five years before his wife was torn away from him.* Jubilees retells the identical descent into Egypt that opens Jasher 15.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-famine-down-to-egypt'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=2
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-15-she-is-my-sister
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 12:11 — *And it came to pass, when he was come near to enter into Egypt, that he said unto Sarai his wife, Behold now, I know that thou art a fair woman to look upon.* The Genesis source of Abram''s fear in Jasher 15:4 as Egypt nears.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-she-is-my-sister'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 12:13 — *Say, I pray thee, thou art my sister: that it may be well with me for thy sake; and my soul shall live because of thee.* The exact instruction Jasher 15:5 expands — call yourself sister that it may be well with me.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-she-is-my-sister'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 20:2 — *And Abraham said of Sarah his wife, She is my sister: and Abimelech king of Gerar sent, and took Sarah.* The same sister-stratagem returns at Gerar, showing Jasher 15:6''s command is a recurring pattern over the seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-she-is-my-sister'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=20 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 26:7 — *And the men of the place asked him of his wife; and he said, She is my sister: for he feared to say, She is my wife; lest, said he, the men of the place should kill me for Rebekah; because she was fair to look upon.* Isaac repeats the very fear and stratagem of Jasher 15:5.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-she-is-my-sister'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=26 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-15-prayer-and-the-angel-delivers-sarai
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 12:15 — *The princes also of Pharaoh saw her, and commended her before Pharaoh: and the woman was taken into Pharaoh''s house.* The Genesis source of Sarai being brought to Pharaoh''s house in Jasher 15:16.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-prayer-and-the-angel-delivers-sarai'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalms 34:7 — *The angel of Yahuah (LORD) encampeth round about them that fear him, and delivereth them.* The canon''s word for the delivering angel Jasher 15:19 sends to rescue Sarai.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-prayer-and-the-angel-delivers-sarai'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalms 105:15 — *Saying, Touch not mine anointed, and do my prophets no harm.* The covenant charter that guards Abram in Pharaoh''s house, the protection his prayer in Jasher 15:16 appeals to.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-prayer-and-the-angel-delivers-sarai'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-15-pharaoh-plagued-sarai-restored
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 12:17 — *And Yahuah (LORD) plagued Pharaoh and his house with great plagues because of Sarai Abram''s wife.* The Genesis source of the plague on Pharaoh''s house in Jasher 15:28.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-pharaoh-plagued-sarai-restored'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 12:19 — *Why saidst thou, She is my sister? so I might have taken her to me to wife: now therefore behold thy wife, take her, and go thy way.* Pharaoh''s dismissal of Abram and Sarai, expanded in Jasher 15:30.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-pharaoh-plagued-sarai-restored'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=12 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 13:12 — *And it came to pass when Pharaoh seized Sarai, the wife of Abram, that Yahuah (God) plagued Pharaoh and his house with great plagues because of Sarai, Abram''s wife.* Jubilees retells the very plague Jasher 15:28 says smote Pharaoh on Sarai''s account.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-pharaoh-plagued-sarai-restored'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=28
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 13:15 — *And Pharaoh gave back Sarai, the wife of Abram, and he sent him out of the land of Egypt, and he journeyed to the place where he had pitched his tent at the beginning.* The restoration and sending-out that Jasher 15:30 narrates.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-pharaoh-plagued-sarai-restored'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=30
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-15-abram-and-lot-separate
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 13:7 — *And there was a strife between the herdmen of Abram''s cattle and the herdmen of Lot''s cattle: and the Canaanite and the Perizzite dwelled then in the land.* The Genesis source of the herdsmen''s quarrel in Jasher 15:36.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-abram-and-lot-separate'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=36
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=13 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 13:8 — *And Abram said unto Lot, Let there be no strife, I pray thee, between me and thee, and between my herdmen and thy herdmen; for we be brethren.* Abram''s peace-making appeal, expanded in Jasher 15:41.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-abram-and-lot-separate'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=13 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 13:11 — *Then Lot chose him all the plain of Jordan; and Lot journeyed east: and they separated themselves the one from the other.* Lot''s choice of the well-watered plain and departure, as in Jasher 15:46.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-abram-and-lot-separate'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=13 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 13:17 — *And in the fourth year of this week Lot parted from him, and Lot dwelt in Sodom, and the men of Sodom were sinners exceedingly.* Jubilees records the same parting of Lot to Sodom that closes Jasher 15:46.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-abram-and-lot-separate'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=46
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-15-abram-dwells-in-mamre-hebron
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 13:18 — *Then Abram removed his tent, and came and dwelt in the plain of Mamre, which is in Hebron, and built there an altar unto Yahuah (LORD).* The exact Genesis place-note that Jasher 15:47 records — Mamre in Hebron.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-abram-dwells-in-mamre-hebron'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=13 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 13:15 — *For all the land which thou seest, to thee will I give it, and to thy seed for ever.* The land-promise renewed to the seed just as Abram settles in the place where Jasher 15:47 leaves him dwelling.'
  FROM cross_reference_threads t, cross_references x, _session252_ja15_lookup sv, _session252_ja15_lookup tv
 WHERE t.slug='jasher-15-abram-dwells-in-mamre-hebron'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=15 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=13 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jasher_16.sql (session252 jasher 16) -----
-- Source anchor: jasher/jasher ch16. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ja16 (view _session252_ja16_lookup). Sort band base 55375, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session252_ja16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jasher-16-war-of-kings-lot-rescued
  ('jasher', 'jasher', 16, 3, 'canon', 'genesis', 14, 2, 'free', E'Genesis 14:2 — *That these made war with Bera king of Sodom, and with Birsha king of Gomorrah, Shinab king of Admah, and Shemeber king of Zeboiim, and the king of Bela, which is Zoar.* The canon names the very five kings of Sodom Jasher 16:3 gathers in the valley of Siddim.'),
  ('jasher', 'jasher', 16, 6, 'canon', 'genesis', 14, 12, 'free', E'Genesis 14:12 — *And they took Lot, Abram’s brother’s son, who dwelt in Sodom, and his goods, and departed.* This is the captivity of Lot that Jasher 16:6 reports through Unic, Abram''s servant who saw the battle.'),
  ('jasher', 'jasher', 16, 7, 'canon', 'genesis', 14, 14, 'free', E'Genesis 14:14 — *And when Abram heard that his brother was taken captive, he armed his trained servants, born in his own house, three hundred and eighteen, and pursued them unto Dan.* The same three hundred and eighteen men of Abram''s household that Jasher 16:7 musters for the night pursuit.'),
  ('jasher', 'jasher', 16, 6, 'jubilees', 'jubilees', 13, 23, 'extras', E'Jubilees 13:23 — *And they took captive Sodom and Adam and Zeboim, and they took captive Lot also, the son of Abram’s brother, and all his possessions, and they went to Dan.* Jubilees retells the identical capture of Lot, confirming Jasher 16:6 across the patriarchal record.'),
  -- thread: jasher-16-melchizedek-shem-tithe
  ('jasher', 'jasher', 16, 11, 'canon', 'genesis', 14, 18, 'free', E'Genesis 14:18 — *And Melek Tsadiq (Melchizedek) king of Salem brought forth bread and wine: and he was the priest of the El Elyon (most high God).* The same priest-king with bread and wine whom Jasher 16:11 identifies as Shem, king of Jerusalem.'),
  ('jasher', 'jasher', 16, 12, 'canon', 'hebrews', 7, 3, 'free', E'Hebrews 7:3 — *Without father, without mother, without descent, having neither beginning of days, nor end of life; but made like unto the Son of Elohim (God); abideth a priest continually.* The priesthood before Elohim that Jasher 16:12 honors is read as the abiding order foreshadowing the Messiah.'),
  ('jasher', 'jasher', 16, 12, 'canon', 'psalms', 110, 4, 'free', E'Psalm 110:4 — *Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek).* The tithe Abram pays this priest in Jasher 16:12 is the order the Messiah will hold for ever.'),
  -- thread: jasher-16-not-a-thread-no-spoil
  ('jasher', 'jasher', 16, 16, 'canon', 'genesis', 14, 23, 'free', E'Genesis 14:23 — *That I will not take from a thread even to a shoelatchet, and that I will not take any thing that is thine, lest thou shouldest say, I have made Abram rich.* The very oath Abram swears in Jasher 16:16, refusing a thread or shoetie of Sodom''s spoil.'),
  ('jasher', 'jasher', 16, 16, 'canon', 'genesis', 14, 24, 'free', E'Genesis 14:24 — *Save only that which the young men have eaten, and the portion of the men which went with me, Aner, Eshcol, and Mamre; let them take their portion.* The same exception Jasher 16:16 makes for the food and for Anar, Ashcol, and Mamre.'),
  ('jasher', 'jasher', 16, 16, 'jubilees', 'jubilees', 13, 29, 'extras', E'Jubilees 13:29 — *I lift up my hands to the El Elyon (Most High) Elohim (God), that from a thread to a shoe-latchet I shall not take aught that is your, lest you should say I have made Abram rich; save only what the young men have eaten, and the portion of the men who went with me–Aner, Eschol, and Mamre.* Jubilees renders Abram''s refusal in Jasher 16:16 with the same thread-to-shoe-latchet oath.'),
  -- thread: jasher-16-seed-as-stars-covenant-land
  ('jasher', 'jasher', 16, 20, 'canon', 'genesis', 15, 5, 'free', E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* The star-promise that cannot be measured nor numbered, exactly as Jasher 16:20 renews it in Hebron.'),
  ('jasher', 'jasher', 16, 21, 'canon', 'genesis', 15, 18, 'free', E'Genesis 15:18 — *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates.* The covenant of the land for an inheritance forever that Jasher 16:21 promises to Abram''s seed.'),
  ('jasher', 'jasher', 16, 20, 'canon', 'romans', 4, 3, 'free', E'Romans 4:3 — *For what saith the scripture? Abraham believed Elohim (God), and it was counted unto him for righteousness.* The faith that receives the star-promise of Jasher 16:20 is election counted as righteousness, not works.'),
  ('jasher', 'jasher', 16, 20, 'jubilees', 'jubilees', 14, 5, 'extras', E'Jubilees 14:5 — *And he looked toward heaven, and beheld the stars. And He said to him: “So shall your seed be.”* Jubilees carries the same seed-as-stars vision that Jasher 16:20 sets in Hebron.'),
  -- thread: jasher-16-hagar-ishmael
  ('jasher', 'jasher', 16, 26, 'canon', 'genesis', 16, 2, 'free', E'Genesis 16:2 — *And Sarai said unto Abram, Behold now, Yahuah (LORD) hath restrained me from bearing: I pray thee, go in unto my maid; it may be that I may obtain children by her. And Abram hearkened to the voice of Sarai.* The canon''s form of Sarai''s proposal that Jasher 16:26 records, to obtain children through Hagar.'),
  ('jasher', 'jasher', 16, 34, 'canon', 'genesis', 16, 9, 'free', E'Genesis 16:9 — *And the angel of Yahuah (LORD) said unto her, Return to thy mistress, and submit thyself under her hands.* The angel''s same charge to the fleeing Hagar that Jasher 16:34 gives at the well.'),
  ('jasher', 'jasher', 16, 34, 'canon', 'genesis', 16, 11, 'free', E'Genesis 16:11 — *And the angel of Yahuah (LORD) said unto her, Behold, thou art with child, and shalt bear a son, and shalt call his name Ishmael; because Yahuah (LORD) hath heard thy affliction.* The naming of Ishmael the angel announces in Jasher 16:34, the son of the affliction heard.'),
  ('jasher', 'jasher', 16, 24, 'canon', 'galatians', 4, 22, 'free', E'Galatians 4:22 — *For it is written, that Abraham had two sons, the one by a bondmaid, the other by a freewoman.* Paul''s reading of the bondwoman''s son begun in Jasher 16:24, where Hagar is given to Abram for a wife.'),
  ('jasher', 'jasher', 16, 36, 'jubilees', 'jubilees', 14, 24, 'extras', E'Jubilees 14:24 — *And he went in to her, and she conceived and bare him a son, and he called his name Ishmael, in the fifth year of this week; and this was the eighty-sixth year in the life of Abram.* Jubilees gives the same birth and the same eighty-sixth year of Abram''s life that Jasher 16:36 records.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session252_ja16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session252_ja16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-16-war-of-kings-lot-rescued',
       E'The war of the four kings and the rescue of Lot',
       E'Jasher opens this chapter on the war of the kings — *And these four kings went up with all their camps, about eight hundred thousand men, and they went as they were, and smote every man they found in their road* (Jasher 16:2) — and when Lot is carried off, Abram arms his own household and pursues: *And Abram heard this, and he rose up with about three hundred and eighteen men that were with him, and he that night pursued these kings and smote them, and they all fell before Abram and his men* (Jasher 16:7). This is Genesis 14 told over again. The canon names the same coalition — *That these made war with Bera king of Sodom, and with Birsha king of Gomorrah, Shinab king of Admah, and Shemeber king of Zeboiim, and the king of Bela, which is Zoar* (Genesis 14:2) — the same captive — *And they took Lot, Abram’s brother’s son, who dwelt in Sodom, and his goods, and departed* (Genesis 14:12) — and the same numbered band: *he armed his trained servants, born in his own house, three hundred and eighteen, and pursued them unto Dan* (Genesis 14:14). Jubilees carries the identical scene, naming Chedorlaomer and the rest and Lot taken to Dan (Jubilees 13:23). It ain''t new: the called seed does not flee the kingdom of man — he goes out by night against eight hundred thousand for the sake of one captive, and wins.',
       sv.verse_id, ev.verse_id, 'extras', 55375
  FROM _session252_ja16_lookup sv, _session252_ja16_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=1
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=16 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-16-melchizedek-shem-tithe',
       E'Adonizedek the same was Shem — the priest who blessed Abram',
       E'Returning from the slaughter, Abram is met by the priest-king of Salem: *And Adonizedek king of Jerusalem, the same was Shem, went out with his men to meet Abram and his people, with bread and wine, and they remained together in the valley of Melech* (Jasher 16:11), *And Adonizedek blessed Abram, and Abram gave him a tenth from all that he had brought from the spoil of his enemies, for Adonizedek was a priest before Elohim (God)* (Jasher 16:12). Genesis names him Melchizedek and shows the same bread, wine, blessing and tithe — *And Melek Tsadiq (Melchizedek) king of Salem brought forth bread and wine: and he was the priest of the El Elyon (most high God)* (Genesis 14:18). Jasher''s gloss "the same was Shem" places this priesthood in the chosen seed-line itself — Shem the father of the elect line still living and serving as priest. The Spirit reads this priest as the very pattern of the Messiah''s eternal order: *Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek)* (Psalm 110:4), and Hebrews unfolds him — *Without father, without mother, without descent, having neither beginning of days, nor end of life; but made like unto the Son of Elohim (God); abideth a priest continually* (Hebrews 7:3). The tithe to the priest is Torah-before-Sinai; Jubilees seals it as an everlasting ordinance (Jubilees 13:25). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55378
  FROM _session252_ja16_lookup sv, _session252_ja16_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=11
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=16 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-16-not-a-thread-no-spoil',
       E'Not a thread nor a shoetie — Abram refuses the spoil of Sodom',
       E'When the kings of Sodom press him to keep the recovered goods, Abram swears by the Name and takes nothing: *And now therefore behold, here is all belonging to you, take it and go; as Yahuah (the Lord) lives I will not take from you from a living soul down to a shoetie or thread, excepting the expense of the food of those who went out with me to battle, as also the portions of the men who went with me, Anar, Ashcol, and Mamre* (Jasher 16:16). His reason is stated in the verse before — *For Yahuah my Elohim (the Lord my God) in whom I trust said to me, You shall lack nothing, for I will bless you in all the works of your hands* (Jasher 16:15). Genesis preserves the same oath nearly word for word — *That I will not take from a thread even to a shoelatchet, and that I will not take any thing that is thine, lest thou shouldest say, I have made Abram rich: Save only that which the young men have eaten, and the portion of the men which went with me, Aner, Eshcol, and Mamre; let them take their portion* (Genesis 14:23-24). Jubilees carries it too (Jubilees 13:29). The called seed will not be enriched by the kingdom of man''s plunder; his blessing comes from Yahuah, not from Sodom. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55381
  FROM _session252_ja16_lookup sv, _session252_ja16_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=14
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=16 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-16-seed-as-stars-covenant-land',
       E'Thy seed like the stars — the covenant of the land',
       E'After the war Yahuah appears again and renews the promise of seed and land: *At that time Yahuah (the Lord) again appeared to Abram in Hebron, and he said to him, Do not fear, your reward is very great before me, for I will not leave you, until I shall have multiplied you, and blessed you and made your seed like the stars in heaven, which cannot be measured nor numbered* (Jasher 16:20), *And I will give to your seed all these lands that you see with your eyes, to them will I give them for an inheritance forever, only be strong and do not fear, walk before me and be perfect* (Jasher 16:21). This is the vision of Genesis 15. The canon''s word and the star-promise stand on the page — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be* (Genesis 15:5) — and the land-grant — *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates* (Genesis 15:18). The seed is election kept, not earned — *For what saith the scripture? Abraham believed Elohim (God), and it was counted unto him for righteousness* (Romans 4:3). Jubilees holds the same star-vision and reckoning (Jubilees 14:5). The chosen line is multiplied and the land given for an inheritance forever; it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55384
  FROM _session252_ja16_lookup sv, _session252_ja16_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=20
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=16 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jasher-16-hagar-ishmael',
       E'Sarai gives Hagar — the bondwoman and Ishmael',
       E'Sarai being barren, she gives her handmaid to Abram: *And Sarai said to Abram, Behold here is my handmaid Hagar, go to her that she may bring forth upon my knees, that I may also obtain children through her* (Jasher 16:26), and at the well the angel turns the fleeing Hagar back — *And an angel of Yahuah (the Lord) found her in the place where she had fled, by a well, and he said to her, Do not fear, for I will multiply your seed, for you shall bear a son and you shall call his name Ishmael; now then return to Sarai your mistress, and submit thyself under her hands* (Jasher 16:34). This is Genesis 16. The canon gives Sarai''s same proposal — *And Sarai said unto Abram, Behold now, Yahuah (LORD) hath restrained me from bearing: I pray thee, go in unto my maid; it may be that I may obtain children by her. And Abram hearkened to the voice of Sarai* (Genesis 16:2) — and the angel''s same word at the well — *And the angel of Yahuah (LORD) said unto her, Return to thy mistress, and submit thyself under her hands* (Genesis 16:9) — naming the son for the affliction heard — *and shalt call his name Ishmael; because Yahuah (LORD) hath heard thy affliction* (Genesis 16:11). Paul reads the two sons as the figure of bondage and freedom — *For it is written, that Abraham had two sons, the one by a bondmaid, the other by a freewoman* (Galatians 4:22). Jubilees keeps the same handmaid and the same naming (Jubilees 14:24). It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 55387
  FROM _session252_ja16_lookup sv, _session252_ja16_lookup ev
 WHERE sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=23
   AND ev.edition_slug='jasher' AND ev.book_slug='jasher' AND ev.chapter_number=16 AND ev.verse_number=36
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jasher-16-war-of-kings-lot-rescued
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 14:2 — *That these made war with Bera king of Sodom, and with Birsha king of Gomorrah, Shinab king of Admah, and Shemeber king of Zeboiim, and the king of Bela, which is Zoar.* The canon names the very five kings of Sodom Jasher 16:3 gathers in the valley of Siddim.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-war-of-kings-lot-rescued'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 14:12 — *And they took Lot, Abram’s brother’s son, who dwelt in Sodom, and his goods, and departed.* This is the captivity of Lot that Jasher 16:6 reports through Unic, Abram''s servant who saw the battle.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-war-of-kings-lot-rescued'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 14:14 — *And when Abram heard that his brother was taken captive, he armed his trained servants, born in his own house, three hundred and eighteen, and pursued them unto Dan.* The same three hundred and eighteen men of Abram''s household that Jasher 16:7 musters for the night pursuit.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-war-of-kings-lot-rescued'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 13:23 — *And they took captive Sodom and Adam and Zeboim, and they took captive Lot also, the son of Abram’s brother, and all his possessions, and they went to Dan.* Jubilees retells the identical capture of Lot, confirming Jasher 16:6 across the patriarchal record.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-war-of-kings-lot-rescued'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=6
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-16-melchizedek-shem-tithe
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 14:18 — *And Melek Tsadiq (Melchizedek) king of Salem brought forth bread and wine: and he was the priest of the El Elyon (most high God).* The same priest-king with bread and wine whom Jasher 16:11 identifies as Shem, king of Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-melchizedek-shem-tithe'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 7:3 — *Without father, without mother, without descent, having neither beginning of days, nor end of life; but made like unto the Son of Elohim (God); abideth a priest continually.* The priesthood before Elohim that Jasher 16:12 honors is read as the abiding order foreshadowing the Messiah.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-melchizedek-shem-tithe'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 110:4 — *Yahuah (LORD) hath sworn, and will not repent, Thou art a priest for ever after the order of Melek Tsadiq (Melchizedek).* The tithe Abram pays this priest in Jasher 16:12 is the order the Messiah will hold for ever.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-melchizedek-shem-tithe'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=110 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-16-not-a-thread-no-spoil
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 14:23 — *That I will not take from a thread even to a shoelatchet, and that I will not take any thing that is thine, lest thou shouldest say, I have made Abram rich.* The very oath Abram swears in Jasher 16:16, refusing a thread or shoetie of Sodom''s spoil.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-not-a-thread-no-spoil'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 14:24 — *Save only that which the young men have eaten, and the portion of the men which went with me, Aner, Eshcol, and Mamre; let them take their portion.* The same exception Jasher 16:16 makes for the food and for Anar, Ashcol, and Mamre.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-not-a-thread-no-spoil'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=14 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 13:29 — *I lift up my hands to the El Elyon (Most High) Elohim (God), that from a thread to a shoe-latchet I shall not take aught that is your, lest you should say I have made Abram rich; save only what the young men have eaten, and the portion of the men who went with me–Aner, Eschol, and Mamre.* Jubilees renders Abram''s refusal in Jasher 16:16 with the same thread-to-shoe-latchet oath.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-not-a-thread-no-spoil'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=16
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=13 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-16-seed-as-stars-covenant-land
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:5 — *And he brought him forth abroad, and said, Look now toward heaven, and tell the stars, if thou be able to number them: and he said unto him, So shall thy seed be.* The star-promise that cannot be measured nor numbered, exactly as Jasher 16:20 renews it in Hebron.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-seed-as-stars-covenant-land'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 15:18 — *In the same day Yahuah (LORD) made a covenant with Abram, saying, Unto thy seed have I given this land, from the river of Egypt unto the great river, the river Euphrates.* The covenant of the land for an inheritance forever that Jasher 16:21 promises to Abram''s seed.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-seed-as-stars-covenant-land'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 4:3 — *For what saith the scripture? Abraham believed Elohim (God), and it was counted unto him for righteousness.* The faith that receives the star-promise of Jasher 16:20 is election counted as righteousness, not works.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-seed-as-stars-covenant-land'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Jubilees 14:5 — *And he looked toward heaven, and beheld the stars. And He said to him: “So shall your seed be.”* Jubilees carries the same seed-as-stars vision that Jasher 16:20 sets in Hebron.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-seed-as-stars-covenant-land'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=20
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=14 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jasher-16-hagar-ishmael
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 16:2 — *And Sarai said unto Abram, Behold now, Yahuah (LORD) hath restrained me from bearing: I pray thee, go in unto my maid; it may be that I may obtain children by her. And Abram hearkened to the voice of Sarai.* The canon''s form of Sarai''s proposal that Jasher 16:26 records, to obtain children through Hagar.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-hagar-ishmael'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=16 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 16:9 — *And the angel of Yahuah (LORD) said unto her, Return to thy mistress, and submit thyself under her hands.* The angel''s same charge to the fleeing Hagar that Jasher 16:34 gives at the well.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-hagar-ishmael'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=16 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 16:11 — *And the angel of Yahuah (LORD) said unto her, Behold, thou art with child, and shalt bear a son, and shalt call his name Ishmael; because Yahuah (LORD) hath heard thy affliction.* The naming of Ishmael the angel announces in Jasher 16:34, the son of the affliction heard.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-hagar-ishmael'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=16 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Galatians 4:22 — *For it is written, that Abraham had two sons, the one by a bondmaid, the other by a freewoman.* Paul''s reading of the bondwoman''s son begun in Jasher 16:24, where Hagar is given to Abram for a wife.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-hagar-ishmael'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Jubilees 14:24 — *And he went in to her, and she conceived and bare him a son, and he called his name Ishmael, in the fifth year of this week; and this was the eighty-sixth year in the life of Abram.* Jubilees gives the same birth and the same eighty-sixth year of Abram''s life that Jasher 16:36 records.'
  FROM cross_reference_threads t, cross_references x, _session252_ja16_lookup sv, _session252_ja16_lookup tv
 WHERE t.slug='jasher-16-hagar-ishmael'
   AND sv.edition_slug='jasher' AND sv.book_slug='jasher' AND sv.chapter_number=16 AND sv.verse_number=36
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=14 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session252 — Jasher cross-references complete.'
