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

