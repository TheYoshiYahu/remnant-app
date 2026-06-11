-- ----- fragment: minion_jubilees_30.sql (session251 jubilees 30) -----
-- Source anchor: jubilees/jubilees ch30. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju30 (view _session251_ju30_lookup). Sort band base 53725, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju30_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-30-dinah-shechem-genesis
  ('jubilees', 'jubilees', 30, 2, 'canon', 'genesis', 34, 2, 'free', E'Genesis 34:2 — *And when Shechem the son of Hamor the Hivite, prince of the country, saw her, he took her, and lay with her, and defiled her.* The Genesis source for Jubilees 30:2, naming the same prince and the same defiling of Dinah.'),
  ('jubilees', 'jubilees', 30, 3, 'canon', 'genesis', 34, 7, 'free', E'Genesis 34:7 — *And the sons of Jacob came out of the field when they heard it: and the men were grieved, and they were very wroth, because he had wrought folly in Yashar''el (Israel) in lying with Jacob’s daughter; which thing ought not to be done.* The wrath of Jacob and his sons in Jubilees 30:3 is the wrath Genesis records.'),
  ('jubilees', 'jubilees', 30, 4, 'canon', 'genesis', 34, 25, 'free', E'Genesis 34:25 — *And it came to pass on the third day, when they were sore, that two of the sons of Jacob, Simeon and Levi, Dinah’s brethren, took each man his sword, and came upon the city boldly, and slew all the males.* The two avengers of Jubilees 30:4 are named in Genesis as Simeon and Levi.'),
  ('jubilees', 'jubilees', 30, 24, 'canon', 'genesis', 34, 27, 'free', E'Genesis 34:27 — *The sons of Jacob came upon the slain, and spoiled the city, because they had defiled their sister.* The spoiling of Shechem and the rescue of Dinah in Jubilees 30:24 follow Genesis exactly.'),
  -- thread: jubilees-30-seed-kept-separate-intermarriage
  ('jubilees', 'jubilees', 30, 11, 'canon', 'deuteronomy', 7, 3, 'free', E'Deuteronomy 7:3 — *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son.* The very command Jubilees 30:11 puts in Moses'' mouth, word for word the Torah''s marriage law.'),
  ('jubilees', 'jubilees', 30, 11, 'canon', 'deuteronomy', 7, 4, 'free', E'Deuteronomy 7:4 — *For they will turn away thy son from following me, that they may serve other gods: so will the anger of Yahuah (LORD) be kindled against you, and destroy thee suddenly.* This gives Jubilees 30''s reason: the seed is kept separate to keep the heart from turning to other gods, not for race.'),
  ('jubilees', 'jubilees', 30, 11, 'canon', 'genesis', 24, 3, 'free', E'Genesis 24:3 — *And I will make thee swear by Yahuah (LORD), the Elohim (God) of heaven, and the Elohim (God) of the earth, that thou shalt not take a wife unto my son of the daughters of the Canaanites, among whom I dwell.* Abraham''s oath shows the seed-kept-separate law standing in Genesis itself, long before Jubilees 30:11.'),
  ('jubilees', 'jubilees', 30, 8, 'canon', 'deuteronomy', 7, 6, 'free', E'Deuteronomy 7:6 — *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* The holiness Jubilees 30:8 invokes — Israel holy to Yahuah — is election, the ground of the separation.'),
  ('jubilees', 'jubilees', 30, 14, 'canon', '2-corinthians', 6, 14, 'free', E'2 Corinthians 6:14 — *Be ye not unequally yoked together with unbelievers: for what fellowship hath righteousness with unrighteousness? and what communion hath light with darkness?* The apostle carries the same uncleanness-separation of Jubilees 30:14 forward into the assembly.'),
  -- thread: jubilees-30-holiness-profaned-malachi-ezra
  ('jubilees', 'jubilees', 30, 14, 'canon', 'ezra', 9, 2, 'free', E'Ezra 9:2 — *For they have taken of their daughters for themselves, and for their sons: so that the holy seed have mingled themselves with the people of those lands: yea, the hand of the princes and rulers hath been chief in this trespass.* The mingled holy seed Ezra mourns is exactly the uncleanness Jubilees 30:14 forbids.'),
  ('jubilees', 'jubilees', 30, 14, 'canon', 'ezra', 9, 12, 'free', E'Ezra 9:12 — *Now therefore give not your daughters unto their sons, neither take their daughters unto your sons, nor seek their peace or their wealth for ever: that ye may be strong, and eat the good of the land, and leave it for an inheritance to your children for ever.* Ezra repeats the give-not/take-not statute of Jubilees 30:11,14 verbatim in form.'),
  ('jubilees', 'jubilees', 30, 15, 'canon', 'ezra', 10, 11, 'free', E'Ezra 10:11 — *Now therefore make confession unto Yahuah Elohim (the LORD God) of your fathers, and do his pleasure: and separate yourselves from the people of the land, and from the strange wives.* The separation Ezra commands is the remedy for the very profanation Jubilees 30:15 warns will bring curse upon the nation.'),
  ('jubilees', 'jubilees', 30, 15, 'canon', 'malachi', 2, 11, 'free', E'Malachi 2:11 — *Yahudah (Judah) hath dealt treacherously, and an abomination is committed in Yashar''el (Israel) and in Jerusalem; for Yahudah (Judah) hath profaned the holiness of Yahuah (LORD) which he loved, and hath married the daughter of a strange god.* Malachi names the profaning of holiness Jubilees 30:15 foretells when Israel marries the daughters of the nations.'),
  -- thread: jubilees-30-levi-zeal-priesthood
  ('jubilees', 'jubilees', 30, 18, 'canon', 'numbers', 25, 11, 'free', E'Numbers 25:11 — *Phinehas, the son of Eleazar, the son of Aaron the priest, hath turned my wrath away from the children of Yashar''el (Israel), while he was zealous for my sake among them, that I consumed not the children of Yashar''el (Israel) in my jealousy.* The zeal-counted-righteous that wins Levi the priesthood in Jubilees 30:18 is the same zeal of Phinehas, a Levite.'),
  ('jubilees', 'jubilees', 30, 18, 'canon', 'numbers', 25, 13, 'free', E'Numbers 25:13 — *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel).* The everlasting priesthood given for zeal is precisely the blessing Jubilees 30:18 lays on Levi and his sons.'),
  ('jubilees', 'jubilees', 30, 18, 'canon', 'deuteronomy', 33, 10, 'free', E'Deuteronomy 33:10 — *They shall teach Jacob thy judgments, and Yashar''el (Israel) thy law: they shall put incense before thee, and whole burnt sacrifice upon thine altar.* Moses'' blessing seals the priestly ministry Jubilees 30:18 says Levi was chosen for — to minister before Yahuah continually.'),
  ('jubilees', 'jubilees', 30, 16, 'canon', 'deuteronomy', 33, 9, 'free', E'Deuteronomy 33:9 — *Who said unto his father and to his mother, I have not seen him; neither did he acknowledge his brethren, nor knew his own children: for they have observed thy word, and kept thy covenant.* Levi''s setting of covenant above kin is the same zeal reckoned for righteousness in Jubilees 30:16,18.'),
  -- thread: jubilees-30-heavenly-tables-book-of-life
  ('jubilees', 'jubilees', 30, 19, 'canon', 'exodus', 32, 32, 'free', E'Exodus 32:32 — *Yet now, if thou wilt forgive their sin—; and if not, blot me, I pray thee, out of thy book which thou hast written.* Moses'' plea names the very book that Jubilees 30:19-21 calls the heavenly tables — the register of blessing and destruction.'),
  ('jubilees', 'jubilees', 30, 21, 'canon', 'exodus', 32, 33, 'free', E'Exodus 32:33 — *And Yahuah (LORD) said unto Moses, Whosoever hath sinned against me, him will I blot out of my book.* The blotting from the book is exactly the destruction out of the book of life threatened in Jubilees 30:21.'),
  ('jubilees', 'jubilees', 30, 21, 'canon', 'psalms', 69, 28, 'free', E'Psalm 69:28 — *Let them be blotted out of the book of the living, and not be written with the righteous.* The book of the living and the writing of the righteous are the two columns of the heavenly tables in Jubilees 30:21.'),
  ('jubilees', 'jubilees', 30, 19, 'canon', 'malachi', 3, 16, 'free', E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* The favourable inscription on the heavenly tables in Jubilees 30:19 is Malachi''s book of remembrance for the faithful.'),
  ('jubilees', 'jubilees', 30, 21, 'canon', 'revelation', 3, 5, 'free', E'Revelation 3:5 — *He that overcometh, the same shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels.* The Messiah keeps the same book of life Jubilees 30:21 says the unfaithful are blotted from.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju30_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju30_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-30-dinah-shechem-genesis',
       E'Dinah defiled, Simeon and Levi avenge her — Genesis 34 retold',
       E'Jubilees opens the chapter on the wound: *And there they carried off Dinah, the daughter of Jacob, into the house of Shechem, the son of Hamor, the Hivite, the prince of the land, and he lay with her and defiled her* (Jubilees 30:2), and then the swift judgment: *And Simeon and Levi came unexpectedly to Shechem and executed judgment on all the men of Shechem* (Jubilees 30:4). It ain''t new — it is Genesis quoted back to us. *And when Shechem the son of Hamor the Hivite, prince of the country, saw her, he took her, and lay with her, and defiled her* (Genesis 34:2). The grief of the sons is the same grief: *And the sons of Jacob came out of the field when they heard it: and the men were grieved, and they were very wroth, because he had wrought folly in Yashar''el (Israel) in lying with Jacob’s daughter; which thing ought not to be done* (Genesis 34:7). And the two brothers act exactly as Jubilees records: *And it came to pass on the third day, when they were sore, that two of the sons of Jacob, Simeon and Levi, Dinah’s brethren, took each man his sword, and came upon the city boldly, and slew all the males* (Genesis 34:25). Jubilees is not inventing a legend; it is unfolding the Torah''s own account.',
       sv.verse_id, ev.verse_id, 'extras', 53725
  FROM _session251_ju30_lookup sv, _session251_ju30_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=30 AND sv.verse_number=2
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=30 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-30-seed-kept-separate-intermarriage',
       E'The seed kept holy — no daughter of Israel given to the nations',
       E'Here is the heart of the chapter and one of the framework''s load-bearing pillars: the paternal seed-line kept separate, NOT racism but the covenant preserved. *And do you, Moses, command the children of Yashar’el (Israel) and exhort them not to give their daughters to the nations, and not to take for their sons any of the daughters of the nations, for this is abominable before Yahuah (God)* (Jubilees 30:11). It ain''t new — it is the Torah''s own marriage law, given first to Abraham''s servant: *And I will make thee swear by Yahuah (LORD), the Elohim (God) of heaven, and the Elohim (God) of the earth, that thou shalt not take a wife unto my son of the daughters of the Canaanites, among whom I dwell* (Genesis 24:3), and engraved in Deuteronomy: *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son* (Deuteronomy 7:3). The reason is never bloodline but the keeping of the covenant heart: *For they will turn away thy son from following me, that they may serve other gods* (Deuteronomy 7:4) — because *thou art an holy people unto Yahuah Elohayka (the LORD thy God)* (Deuteronomy 7:6). The same separation the apostle carries forward: *Be ye not unequally yoked together with unbelievers* (2 Corinthians 6:14). The seed is kept holy so the worship stays pure.',
       sv.verse_id, ev.verse_id, 'extras', 53728
  FROM _session251_ju30_lookup sv, _session251_ju30_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=30 AND sv.verse_number=11
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=30 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-30-holiness-profaned-malachi-ezra',
       E'The strange wives and the profaned holiness — Ezra and Malachi',
       E'Jubilees names the consequence of mingling the seed: *And Yashar’el (Israel) will not be free from this uncleanness if it has a wife of the daughters of the nations, or has given any of its daughters to a man who is of any of the nations* (Jubilees 30:14), warning of *plague upon plague, and curse upon curse* on those who *profane His holy name* (Jubilees 30:15). It ain''t new — it is the very sin Ezra confronted in the return: *For they have taken of their daughters for themselves, and for their sons: so that the holy seed have mingled themselves with the people of those lands* (Ezra 9:2). The remedy was repentance and separation: *separate yourselves from the people of the land, and from the strange wives* (Ezra 10:11). And Malachi names it as profaning holiness: *Yahudah (Judah) hath dealt treacherously, and an abomination is committed in Yashar''el (Israel) and in Jerusalem; for Yahudah (Judah) hath profaned the holiness of Yahuah (LORD) which he loved, and hath married the daughter of a strange god* (Malachi 2:11). Jubilees 30 is the heavenly-tablets statute behind Ezra''s reform and Malachi''s rebuke.',
       sv.verse_id, ev.verse_id, 'extras', 53731
  FROM _session251_ju30_lookup sv, _session251_ju30_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=30 AND sv.verse_number=14
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=30 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-30-levi-zeal-priesthood',
       E'Levi''s zeal counted for righteousness — the covenant of priesthood',
       E'The deed of Simeon and Levi is reckoned not as bloodlust but as righteousness, and Levi is set apart: *And the seed of Levi was chosen for the priesthood, and to be Levites, that they might minister before Yahuah (God), as we, continually, and that Levi and his sons may be blessed for ever; for he was zealous to execute righteousness and judgment and vengeance on all those who arose against Yashar’el (Israel)* (Jubilees 30:18). It ain''t new — it is the same logic that crowned Phinehas, whose spear-zeal at Peor earned the priesthood: *Phinehas, the son of Eleazar, the son of Aaron the priest, hath turned my wrath away from the children of Yashar''el (Israel), while he was zealous for my sake among them* (Numbers 25:11), so that Yahuah gives *the covenant of an everlasting priesthood; because he was zealous for his Elohim (God)* (Numbers 25:13). The blessing of Moses confirms Levi''s priestly calling: *They shall teach Jacob thy judgments, and Yashar''el (Israel) thy law: they shall put incense before thee, and whole burnt sacrifice upon thine altar* (Deuteronomy 33:10). The zeal that guards the holy seed is the zeal that wins the altar.',
       sv.verse_id, ev.verse_id, 'extras', 53734
  FROM _session251_ju30_lookup sv, _session251_ju30_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=30 AND sv.verse_number=18
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=30 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-30-heavenly-tables-book-of-life',
       E'Recorded on the heavenly tables — the book of life and the book of the destroyed',
       E'Jubilees grounds the whole judgment in the heavenly tablets, where deeds are written for blessing or for destruction: *And so they inscribe as a testimony in his favour on the heavenly tables blessing and righteousness before the Elohim (God) of all* (Jubilees 30:19), while the transgressors *will be destroyed out of the book of life, and they will be recorded in the book of those who will be destroyed* (Jubilees 30:21). It ain''t new — these are the books of Scripture''s own courtroom. Moses pleads at one: *blot me, I pray thee, out of thy book which thou hast written* (Exodus 32:32), and Yahuah answers, *Whosoever hath sinned against me, him will I blot out of my book* (Exodus 32:33). The psalmist prays the same blotting on the wicked: *Let them be blotted out of the book of the living, and not be written with the righteous* (Psalm 69:28). A book of remembrance is written for the faithful: *a book of remembrance was written before him for them that feared Yahuah (LORD)* (Malachi 3:16). And the risen Messiah keeps the same register: *I will not blot out his name out of the book of life* (Revelation 3:5). The heavenly tables of Jubilees 30 are the book of life the prophets and the apostles saw.',
       sv.verse_id, ev.verse_id, 'extras', 53737
  FROM _session251_ju30_lookup sv, _session251_ju30_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=30 AND sv.verse_number=19
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=30 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-30-dinah-shechem-genesis
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 34:2 — *And when Shechem the son of Hamor the Hivite, prince of the country, saw her, he took her, and lay with her, and defiled her.* The Genesis source for Jubilees 30:2, naming the same prince and the same defiling of Dinah.'
  FROM cross_reference_threads t, cross_references x, _session251_ju30_lookup sv, _session251_ju30_lookup tv
 WHERE t.slug='jubilees-30-dinah-shechem-genesis'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=30 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=34 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 34:7 — *And the sons of Jacob came out of the field when they heard it: and the men were grieved, and they were very wroth, because he had wrought folly in Yashar''el (Israel) in lying with Jacob’s daughter; which thing ought not to be done.* The wrath of Jacob and his sons in Jubilees 30:3 is the wrath Genesis records.'
  FROM cross_reference_threads t, cross_references x, _session251_ju30_lookup sv, _session251_ju30_lookup tv
 WHERE t.slug='jubilees-30-dinah-shechem-genesis'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=30 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=34 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 34:25 — *And it came to pass on the third day, when they were sore, that two of the sons of Jacob, Simeon and Levi, Dinah’s brethren, took each man his sword, and came upon the city boldly, and slew all the males.* The two avengers of Jubilees 30:4 are named in Genesis as Simeon and Levi.'
  FROM cross_reference_threads t, cross_references x, _session251_ju30_lookup sv, _session251_ju30_lookup tv
 WHERE t.slug='jubilees-30-dinah-shechem-genesis'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=30 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=34 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 34:27 — *The sons of Jacob came upon the slain, and spoiled the city, because they had defiled their sister.* The spoiling of Shechem and the rescue of Dinah in Jubilees 30:24 follow Genesis exactly.'
  FROM cross_reference_threads t, cross_references x, _session251_ju30_lookup sv, _session251_ju30_lookup tv
 WHERE t.slug='jubilees-30-dinah-shechem-genesis'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=30 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=34 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-30-seed-kept-separate-intermarriage
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 7:3 — *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son.* The very command Jubilees 30:11 puts in Moses'' mouth, word for word the Torah''s marriage law.'
  FROM cross_reference_threads t, cross_references x, _session251_ju30_lookup sv, _session251_ju30_lookup tv
 WHERE t.slug='jubilees-30-seed-kept-separate-intermarriage'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=30 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 7:4 — *For they will turn away thy son from following me, that they may serve other gods: so will the anger of Yahuah (LORD) be kindled against you, and destroy thee suddenly.* This gives Jubilees 30''s reason: the seed is kept separate to keep the heart from turning to other gods, not for race.'
  FROM cross_reference_threads t, cross_references x, _session251_ju30_lookup sv, _session251_ju30_lookup tv
 WHERE t.slug='jubilees-30-seed-kept-separate-intermarriage'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=30 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 24:3 — *And I will make thee swear by Yahuah (LORD), the Elohim (God) of heaven, and the Elohim (God) of the earth, that thou shalt not take a wife unto my son of the daughters of the Canaanites, among whom I dwell.* Abraham''s oath shows the seed-kept-separate law standing in Genesis itself, long before Jubilees 30:11.'
  FROM cross_reference_threads t, cross_references x, _session251_ju30_lookup sv, _session251_ju30_lookup tv
 WHERE t.slug='jubilees-30-seed-kept-separate-intermarriage'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=30 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=24 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 7:6 — *For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* The holiness Jubilees 30:8 invokes — Israel holy to Yahuah — is election, the ground of the separation.'
  FROM cross_reference_threads t, cross_references x, _session251_ju30_lookup sv, _session251_ju30_lookup tv
 WHERE t.slug='jubilees-30-seed-kept-separate-intermarriage'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=30 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Corinthians 6:14 — *Be ye not unequally yoked together with unbelievers: for what fellowship hath righteousness with unrighteousness? and what communion hath light with darkness?* The apostle carries the same uncleanness-separation of Jubilees 30:14 forward into the assembly.'
  FROM cross_reference_threads t, cross_references x, _session251_ju30_lookup sv, _session251_ju30_lookup tv
 WHERE t.slug='jubilees-30-seed-kept-separate-intermarriage'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=30 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-30-holiness-profaned-malachi-ezra
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 9:2 — *For they have taken of their daughters for themselves, and for their sons: so that the holy seed have mingled themselves with the people of those lands: yea, the hand of the princes and rulers hath been chief in this trespass.* The mingled holy seed Ezra mourns is exactly the uncleanness Jubilees 30:14 forbids.'
  FROM cross_reference_threads t, cross_references x, _session251_ju30_lookup sv, _session251_ju30_lookup tv
 WHERE t.slug='jubilees-30-holiness-profaned-malachi-ezra'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=30 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=9 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 9:12 — *Now therefore give not your daughters unto their sons, neither take their daughters unto your sons, nor seek their peace or their wealth for ever: that ye may be strong, and eat the good of the land, and leave it for an inheritance to your children for ever.* Ezra repeats the give-not/take-not statute of Jubilees 30:11,14 verbatim in form.'
  FROM cross_reference_threads t, cross_references x, _session251_ju30_lookup sv, _session251_ju30_lookup tv
 WHERE t.slug='jubilees-30-holiness-profaned-malachi-ezra'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=30 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=9 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezra 10:11 — *Now therefore make confession unto Yahuah Elohim (the LORD God) of your fathers, and do his pleasure: and separate yourselves from the people of the land, and from the strange wives.* The separation Ezra commands is the remedy for the very profanation Jubilees 30:15 warns will bring curse upon the nation.'
  FROM cross_reference_threads t, cross_references x, _session251_ju30_lookup sv, _session251_ju30_lookup tv
 WHERE t.slug='jubilees-30-holiness-profaned-malachi-ezra'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=30 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=10 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Malachi 2:11 — *Yahudah (Judah) hath dealt treacherously, and an abomination is committed in Yashar''el (Israel) and in Jerusalem; for Yahudah (Judah) hath profaned the holiness of Yahuah (LORD) which he loved, and hath married the daughter of a strange god.* Malachi names the profaning of holiness Jubilees 30:15 foretells when Israel marries the daughters of the nations.'
  FROM cross_reference_threads t, cross_references x, _session251_ju30_lookup sv, _session251_ju30_lookup tv
 WHERE t.slug='jubilees-30-holiness-profaned-malachi-ezra'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=30 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=2 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-30-levi-zeal-priesthood
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 25:11 — *Phinehas, the son of Eleazar, the son of Aaron the priest, hath turned my wrath away from the children of Yashar''el (Israel), while he was zealous for my sake among them, that I consumed not the children of Yashar''el (Israel) in my jealousy.* The zeal-counted-righteous that wins Levi the priesthood in Jubilees 30:18 is the same zeal of Phinehas, a Levite.'
  FROM cross_reference_threads t, cross_references x, _session251_ju30_lookup sv, _session251_ju30_lookup tv
 WHERE t.slug='jubilees-30-levi-zeal-priesthood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=30 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 25:13 — *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel).* The everlasting priesthood given for zeal is precisely the blessing Jubilees 30:18 lays on Levi and his sons.'
  FROM cross_reference_threads t, cross_references x, _session251_ju30_lookup sv, _session251_ju30_lookup tv
 WHERE t.slug='jubilees-30-levi-zeal-priesthood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=30 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 33:10 — *They shall teach Jacob thy judgments, and Yashar''el (Israel) thy law: they shall put incense before thee, and whole burnt sacrifice upon thine altar.* Moses'' blessing seals the priestly ministry Jubilees 30:18 says Levi was chosen for — to minister before Yahuah continually.'
  FROM cross_reference_threads t, cross_references x, _session251_ju30_lookup sv, _session251_ju30_lookup tv
 WHERE t.slug='jubilees-30-levi-zeal-priesthood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=30 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=33 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Deuteronomy 33:9 — *Who said unto his father and to his mother, I have not seen him; neither did he acknowledge his brethren, nor knew his own children: for they have observed thy word, and kept thy covenant.* Levi''s setting of covenant above kin is the same zeal reckoned for righteousness in Jubilees 30:16,18.'
  FROM cross_reference_threads t, cross_references x, _session251_ju30_lookup sv, _session251_ju30_lookup tv
 WHERE t.slug='jubilees-30-levi-zeal-priesthood'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=30 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=33 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-30-heavenly-tables-book-of-life
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 32:32 — *Yet now, if thou wilt forgive their sin—; and if not, blot me, I pray thee, out of thy book which thou hast written.* Moses'' plea names the very book that Jubilees 30:19-21 calls the heavenly tables — the register of blessing and destruction.'
  FROM cross_reference_threads t, cross_references x, _session251_ju30_lookup sv, _session251_ju30_lookup tv
 WHERE t.slug='jubilees-30-heavenly-tables-book-of-life'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=30 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 32:33 — *And Yahuah (LORD) said unto Moses, Whosoever hath sinned against me, him will I blot out of my book.* The blotting from the book is exactly the destruction out of the book of life threatened in Jubilees 30:21.'
  FROM cross_reference_threads t, cross_references x, _session251_ju30_lookup sv, _session251_ju30_lookup tv
 WHERE t.slug='jubilees-30-heavenly-tables-book-of-life'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=30 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 69:28 — *Let them be blotted out of the book of the living, and not be written with the righteous.* The book of the living and the writing of the righteous are the two columns of the heavenly tables in Jubilees 30:21.'
  FROM cross_reference_threads t, cross_references x, _session251_ju30_lookup sv, _session251_ju30_lookup tv
 WHERE t.slug='jubilees-30-heavenly-tables-book-of-life'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=30 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=69 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Malachi 3:16 — *Then they that feared Yahuah (LORD) spake often one to another: and Yahuah (LORD) hearkened, and heard it, and a book of remembrance was written before him for them that feared Yahuah (LORD), and that thought upon his name.* The favourable inscription on the heavenly tables in Jubilees 30:19 is Malachi''s book of remembrance for the faithful.'
  FROM cross_reference_threads t, cross_references x, _session251_ju30_lookup sv, _session251_ju30_lookup tv
 WHERE t.slug='jubilees-30-heavenly-tables-book-of-life'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=30 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Revelation 3:5 — *He that overcometh, the same shall be clothed in white raiment; and I will not blot out his name out of the book of life, but I will confess his name before my Father, and before his angels.* The Messiah keeps the same book of life Jubilees 30:21 says the unfaithful are blotted from.'
  FROM cross_reference_threads t, cross_references x, _session251_ju30_lookup sv, _session251_ju30_lookup tv
 WHERE t.slug='jubilees-30-heavenly-tables-book-of-life'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=30 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

