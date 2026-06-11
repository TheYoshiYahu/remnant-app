-- ----- fragment: minion_jubilees_26.sql (session251 jubilees 26) -----
-- Source anchor: jubilees/jubilees ch26. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: ju26 (view _session251_ju26_lookup). Sort band base 53625, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session251_ju26_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: jubilees-26-the-venison-and-the-blessing
  ('jubilees', 'jubilees', 26, 1, 'canon', 'genesis', 27, 1, 'free', E'Genesis 27:1 — *And it came to pass, that when Isaac was old, and his eyes were dim, so that he could not see, he called Esau his eldest son, and said unto him, My son: and he said unto him, Behold, here am I.* Jubilees 26:1 retells the same blind, aged Isaac calling Esau his elder son.'),
  ('jubilees', 'jubilees', 26, 2, 'canon', 'genesis', 27, 4, 'free', E'Genesis 27:4 — *And make me savoury meat, such as I love, and bring it to me, that I may eat; that my soul may bless thee before I die.* The savoury-meat-and-blessing charge of Jubilees 26:2 is lifted straight from Genesis.'),
  ('jubilees', 'jubilees', 26, 5, 'canon', 'genesis', 27, 5, 'free', E'Genesis 27:5 — *And Rebekah heard when Isaac spake to Esau his son. And Esau went to the field to hunt for venison, and to bring it.* Jubilees 26:3-4 records the same: Rebecca overhearing and Esau going out to hunt.'),
  ('jubilees', 'jubilees', 26, 6, 'canon', 'genesis', 27, 9, 'free', E'Genesis 27:9 — *Go now to the flock, and fetch me from thence two good kids of the goats; and I will make them savoury meat for thy father, such as he loveth:* Rebecca''s instruction to Jacob in Jubilees 26:6 is the same two-kids-of-the-goats plan.'),
  -- thread: jubilees-26-the-disguise-a-dispensation-from-heaven
  ('jubilees', 'jubilees', 26, 15, 'canon', 'genesis', 27, 20, 'free', E'Genesis 27:20 — *And Isaac said unto his son, How is it that thou hast found it so quickly, my son? And he said, Because Yahuah Elohayka (the LORD thy God) brought it to me.* Jubilees 26:15 has Jacob give the same answer, crediting Elohim for the quick find.'),
  ('jubilees', 'jubilees', 26, 18, 'canon', 'genesis', 27, 22, 'free', E'Genesis 27:22 — *And Jacob went near unto Isaac his father; and he felt him, and said, The voice is Jacob’s voice, but the hands are the hands of Esau.* Jubilees 26:18 quotes the identical line, then adds that the failed perception was “a dispensation from heaven.”'),
  ('jubilees', 'jubilees', 26, 18, 'canon', 'genesis', 27, 23, 'free', E'Genesis 27:23 — *And he discerned him not, because his hands were hairy, as his brother Esau’s hands: so he blessed him.* Jubilees 26:18 reads this same non-discernment as heaven removing Isaac''s perception so the blessing would fall on Jacob.'),
  -- thread: jubilees-26-the-dew-of-heaven-and-the-nations-bow
  ('jubilees', 'jubilees', 26, 21, 'canon', 'genesis', 27, 27, 'free', E'Genesis 27:27 — *And he came near, and kissed him: and he smelled the smell of his raiment, and blessed him, and said, See, the smell of my son is as the smell of a field which Yahuah (LORD) hath blessed:* Jubilees 26:21 opens the blessing with the same smell-of-the-field that Yahuah has blessed.'),
  ('jubilees', 'jubilees', 26, 21, 'canon', 'genesis', 27, 28, 'free', E'Genesis 27:28 — *Therefore Elohim (God) give thee of the dew of heaven, and the fatness of the earth, and plenty of corn and wine:* The dew of heaven and plenty of corn of Jubilees 26:21 is the Genesis blessing word for word.'),
  ('jubilees', 'jubilees', 26, 21, 'canon', 'genesis', 27, 29, 'free', E'Genesis 27:29 — *Let people serve thee, and nations bow down to thee: be lord over thy brethren, and let thy mother’s sons bow down to thee: cursed be every one that curseth thee, and blessed be he that blesseth thee.* Jubilees 26:21,24 carries the same nations-serve-you, mother''s-sons-bow, cursed/blessed formula.'),
  ('jubilees', 'jubilees', 26, 24, 'canon', 'hebrews', 11, 20, 'free', E'Hebrews 11:20 — *By faith Isaac blessed Jacob and Esau concerning things to come.* The faith-blessing the NT reckons to Isaac is the very blessing Jubilees 26:21-24 imparts to Jacob “and to your seed for ever.”'),
  -- thread: jubilees-26-election-the-elder-shall-serve-the-younger
  ('jubilees', 'jubilees', 26, 28, 'canon', 'genesis', 27, 33, 'free', E'Genesis 27:33 — *And Isaac trembled very exceedingly, and said, Who? where is he that hath taken venison, and brought it me, and I have eaten of all before thou camest, and have blessed him? yea, and he shall be blessed.* Jubilees 26:28 confirms the same irrevocable verdict: he and all his seed shall be blessed for ever.'),
  ('jubilees', 'jubilees', 26, 28, 'canon', 'romans', 9, 12, 'free', E'Romans 9:12 — *It was said unto her, The elder shall serve the younger.* Paul reads the Jacob-blessing of Jubilees 26:28 as the standing word of election over the elder Esau and the younger Jacob.'),
  ('jubilees', 'jubilees', 26, 28, 'canon', 'romans', 9, 13, 'free', E'Romans 9:13 — *As it is written, Jacob have I loved, but Esau have I hated.* The settled election Jubilees 26:28 records — the blessing fixed on Jacob — is what Paul names Jacob-loved, Esau-hated.'),
  ('jubilees', 'jubilees', 26, 28, 'canon', 'malachi', 1, 2, 'free', E'Malachi 1:2 — *I have loved you, saith Yahuah (LORD). Yet ye say, Wherein hast thou loved us? Was not Esau Jacob’s brother? saith Yahuah (LORD): yet I loved Jacob,* The prophet grounds Yahuah''s love for Israel in the very Jacob-over-Esau choice Jubilees 26:28 seals.'),
  -- thread: jubilees-26-esau-bitter-cry-profane-birthright
  ('jubilees', 'jubilees', 26, 29, 'canon', 'genesis', 27, 34, 'free', E'Genesis 27:34 — *And when Esau heard the words of his father, he cried with a great and exceeding bitter cry, and said unto his father, Bless me, even me also, O my father.* Jubilees 26:29 retells the same great and bitter cry of Esau pleading to be blessed too.'),
  ('jubilees', 'jubilees', 26, 29, 'canon', 'genesis', 27, 36, 'free', E'Genesis 27:36 — *And he said, Is not he rightly named Jacob? for he hath supplanted me these two times: he took away my birthright; and, behold, now he hath taken away my blessing. And he said, Hast thou not reserved a blessing for me?* Jubilees 26:29 has Esau name the two supplantings — birthright then blessing — in the same words.'),
  ('jubilees', 'jubilees', 26, 29, 'jubilees', 'jubilees', 24, 3, 'extras', E'Jubilees 24:3 — *And Jacob said to him: “Sell to me your primogeniture, this birthright and I will give you bread, and also some of this lentil pottage.”* The birthright Esau mourns losing in Jubilees 26:29 he had already sold for pottage in Jubilees'' earlier telling.'),
  ('jubilees', 'jubilees', 26, 29, 'canon', 'hebrews', 12, 16, 'free', E'Hebrews 12:16 — *Lest there be any fornicator, or profane person, as Esau, who for one morsel of meat sold his birthright.* The NT reads the Esau of Jubilees 26:29 as the profane man whose lost blessing began with a despised birthright.'),
  -- thread: jubilees-26-esau-lesser-blessing-by-the-sword
  ('jubilees', 'jubilees', 26, 33, 'canon', 'genesis', 27, 39, 'free', E'Genesis 27:39 — *And Isaac his father answered and said unto him, Behold, thy dwelling shall be the fatness of the earth, and of the dew of heaven from above;* Jubilees 26:33 gives the inverse — Esau''s dwelling far from the dew — of the same Genesis word over Esau.'),
  ('jubilees', 'jubilees', 26, 34, 'canon', 'genesis', 27, 40, 'free', E'Genesis 27:40 — *And by thy sword shalt thou live, and shalt serve thy brother; and it shall come to pass when thou shalt have the dominion, that thou shalt break his yoke from off thy neck.* Jubilees 26:34 carries the same sword-and-yoke word, adding that shaking the yoke ends in Esau''s seed rooted out.'),
  ('jubilees', 'jubilees', 26, 34, 'canon', 'genesis', 27, 41, 'free', E'Genesis 27:41 — *And Esau hated Jacob because of the blessing wherewith his father blessed him: and Esau said in his heart, The days of mourning for my father are at hand; then will I slay my brother Jacob.* Jubilees 26:34 ends with the identical murderous resolve in Esau''s heart.'),
  ('jubilees', 'jubilees', 26, 34, 'canon', 'malachi', 1, 3, 'free', E'Malachi 1:3 — *And I hated Esau, and laid his mountains and his heritage waste for the dragons of the wilderness.* The prophet confirms the sentence Jubilees 26:34 pronounces on Esau''s seed — his heritage laid waste.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session251_ju26_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session251_ju26_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-26-the-venison-and-the-blessing',
       E'Isaac sends for venison that his soul may bless his son',
       E'Jubilees opens Genesis 27 almost word for word. Isaac, blind and not knowing the day of his death, sends Esau to hunt: *“And now take your hunting weapons, your quiver and your bow, and go out to the field, and hunt and catch me (venison), my son, and make me savoury meat, such as my soul loves, and bring it to me that I may eat, and that my soul may bless you before I die.”* (Jubilees 26:2). The Genesis source stands beside it almost verbatim: *Now therefore take, I pray thee, thy weapons, thy quiver and thy bow, and go out to the field, and take me some venison;* (Genesis 27:3) and *And make me savoury meat, such as I love, and bring it to me, that I may eat; that my soul may bless thee before I die.* (Genesis 27:4). Rebecca, who overhears, moves Jacob toward the blessing in obedience: *And now, my son, obey my voice in that which I command you: Go to your flock and fetch me two good kids of the goats* (Jubilees 26:6), matched by *Go now to the flock, and fetch me from thence two good kids of the goats; and I will make them savoury meat for thy father, such as he loveth* (Genesis 27:9). It ain''t new — Jubilees is retelling the patriarch''s blessing exactly as Genesis records it.',
       sv.verse_id, ev.verse_id, 'extras', 53625
  FROM _session251_ju26_lookup sv, _session251_ju26_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=26 AND sv.verse_number=1
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=26 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-26-the-disguise-a-dispensation-from-heaven',
       E'The voice of Jacob, the hands of Esau — a dispensation from heaven',
       E'Jacob comes in disguised, and the deception holds because heaven wills the younger to carry the blessing. Jubilees names the cause plainly: *“The voice is Jacob’s voice, but the hands are the hands of Esau,” and he discerned him not, because it was a dispensation from heaven to remove his power of perception and Isaac discerned not, for his hands were hairy as (his brother) Esau’s, so that he blessed him.* (Jubilees 26:18). Genesis records the words and the failed perception without the heavenly gloss: *And Jacob went near unto Isaac his father; and he felt him, and said, The voice is Jacob’s voice, but the hands are the hands of Esau.* (Genesis 27:22) and *And he discerned him not, because his hands were hairy, as his brother Esau’s hands: so he blessed him.* (Genesis 27:23). Jacob even credits the LORD for the swift hunt — *And Jacob said: “Because Yahuah (God) your Elohim (God) caused me to find.”* (Jubilees 26:15) — matching *And he said, Because Yahuah Elohayka (the LORD thy God) brought it to me.* (Genesis 27:20). Jubilees reads the whole episode as election driving the narrative: the blessing was always meant for Jacob.',
       sv.verse_id, ev.verse_id, 'extras', 53628
  FROM _session251_ju26_lookup sv, _session251_ju26_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=26 AND sv.verse_number=13
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=26 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-26-the-dew-of-heaven-and-the-nations-bow',
       E'The dew of heaven, plenty of corn, and nations bowing down',
       E'The blessing itself is the heart of the chapter — the dew, the corn and oil, and the nations made to serve. Jubilees: *“Behold, the smell of my son is as the smell of a (full) field which Yahuah (God) has blessed. And may Yahuah (God) give you of the dew of heaven And of the dew of the earth, and plenty of corn and oil: Let nations serve you, And peoples bow down to you.* (Jubilees 26:21). Genesis sets the same words side by side: *Therefore Elohim (God) give thee of the dew of heaven, and the fatness of the earth, and plenty of corn and wine:* (Genesis 27:28) and *Let people serve thee, and nations bow down to thee: be lord over thy brethren, and let thy mother’s sons bow down to thee: cursed be every one that curseth thee, and blessed be he that blesseth thee.* (Genesis 27:29). Jubilees binds the blessing back into the Abrahamic covenant and forward to the seed: *And may all the blessings wherewith Yahuah (God) has blessed me and blessed Abraham, my father, Be imparted to you and to your seed for ever* (Jubilees 26:24). The election carried in this blessing is exactly what the apostle later reads off it — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53631
  FROM _session251_ju26_lookup sv, _session251_ju26_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=26 AND sv.verse_number=21
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=26 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-26-election-the-elder-shall-serve-the-younger',
       E'He shall be blessed — the elder serves the younger',
       E'When Isaac learns Jacob came first, he confirms the blessing as irrevocable — election, not Esau''s effort, decides: *“Who is he that has hunted and caught and brought (it) to me, and I have eaten of all before you came, and have blessed him: (and) he shall be blessed, and all his seed for ever.”* (Jubilees 26:28), matching *And Isaac trembled very exceedingly, and said, Who? where is he that hath taken venison, and brought it me, and I have eaten of all before thou camest, and have blessed him? yea, and he shall be blessed.* (Genesis 27:33). This is the seed-line carried by choice. Paul reads the whole transaction as the doctrine of election: *(For the children being not yet born, neither having done any good or evil, that the purpose of Elohim (God) according to election might stand, not of works, but of him that calleth;)* (Romans 9:11), *It was said unto her, The elder shall serve the younger.* (Romans 9:12), and *As it is written, Jacob have I loved, but Esau have I hated.* (Romans 9:13). The prophet says the same at the close of the Tanakh: *I have loved you, saith Yahuah (LORD). Yet ye say, Wherein hast thou loved us? Was not Esau Jacob’s brother? saith Yahuah (LORD): yet I loved Jacob,* (Malachi 1:2). The election Jubilees narrates is the election the canon confesses — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 53634
  FROM _session251_ju26_lookup sv, _session251_ju26_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=26 AND sv.verse_number=28
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=26 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-26-esau-bitter-cry-profane-birthright',
       E'Esau''s bitter cry — the profane man who sold his birthright',
       E'Esau comes in too late and learns the blessing is gone; his grief is the grief of the man who had already despised his birthright. Jubilees: *And it came to pass when Esau heard the words of his father Isaac that he cried with an exceeding great and bitter cry, and said to his father: “Bless me, (even) me also, father.” And he said to him: “Your brother came with guile, and has taken away your blessing.” And he said: “Now I know why his name is named Jacob: behold, he has supplanted me these two times: he took away my birth-right, and now he has taken away my blessing.”* (Jubilees 26:29). Genesis matches it: *And when Esau heard the words of his father, he cried with a great and exceeding bitter cry, and said unto his father, Bless me, even me also, O my father.* (Genesis 27:34) and *Is not he rightly named Jacob? for he hath supplanted me these two times: he took away my birthright; and, behold, now he hath taken away my blessing.* (Genesis 27:36). The birthright was sold long before, in Jubilees'' own earlier telling: *And Jacob said to him: “Sell to me your primogeniture, this birthright and I will give you bread, and also some of this lentil pottage.”* (Jubilees 24:3), the same scene Genesis records when *he sold his birthright unto Jacob* (Genesis 25:33). The NT reads Esau as the profane man and the warning to us: *Lest there be any fornicator, or profane person, as Esau, who for one morsel of meat sold his birthright.* (Hebrews 12:16) — *for he found no place of repentance, though he sought it carefully with tears.* (Hebrews 12:17).',
       sv.verse_id, ev.verse_id, 'extras', 53637
  FROM _session251_ju26_lookup sv, _session251_ju26_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=26 AND sv.verse_number=24
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=26 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jubilees-26-esau-lesser-blessing-by-the-sword',
       E'Esau''s blessing — by the sword, and serving his brother',
       E'Isaac has only a lesser word left for Esau — away from the dew, living by the sword, serving the younger, and Jubilees sharpens the warning at the end. *And Isaac answered and said to him: “Behold, far from the dew of the earth shall be your dwelling, And far from the dew of heaven from above.* (Jubilees 26:33), *And by your sword will you live, And you will serve your brother. And it shall come to pass when you become great, And do shake his yoke from off your neck, You will sin a complete sin to death, And your seed will be rooted out from under heaven.”* (Jubilees 26:34). Genesis gives the same lesser blessing: *And Isaac his father answered and said unto him, Behold, thy dwelling shall be the fatness of the earth, and of the dew of heaven from above;* (Genesis 27:39) and *And by thy sword shalt thou live, and shalt serve thy brother; and it shall come to pass when thou shalt have the dominion, that thou shalt break his yoke from off thy neck.* (Genesis 27:40). Even Esau''s murderous resolve is carried over: *And Esau hated Jacob because of the blessing wherewith his father blessed him: and Esau said in his heart, The days of mourning for my father are at hand; then will I slay my brother Jacob.* (Genesis 27:41), matching Jubilees 26:34''s *“May the days of mourning for my father now come, so that I may slay my brother Jacob.”* The prophet later confirms the sentence on Esau''s line: *And I hated Esau, and laid his mountains and his heritage waste for the dragons of the wilderness.* (Malachi 1:3).',
       sv.verse_id, ev.verse_id, 'extras', 53640
  FROM _session251_ju26_lookup sv, _session251_ju26_lookup ev
 WHERE sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=26 AND sv.verse_number=33
   AND ev.edition_slug='jubilees' AND ev.book_slug='jubilees' AND ev.chapter_number=26 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: jubilees-26-the-venison-and-the-blessing
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 27:1 — *And it came to pass, that when Isaac was old, and his eyes were dim, so that he could not see, he called Esau his eldest son, and said unto him, My son: and he said unto him, Behold, here am I.* Jubilees 26:1 retells the same blind, aged Isaac calling Esau his elder son.'
  FROM cross_reference_threads t, cross_references x, _session251_ju26_lookup sv, _session251_ju26_lookup tv
 WHERE t.slug='jubilees-26-the-venison-and-the-blessing'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=26 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 27:4 — *And make me savoury meat, such as I love, and bring it to me, that I may eat; that my soul may bless thee before I die.* The savoury-meat-and-blessing charge of Jubilees 26:2 is lifted straight from Genesis.'
  FROM cross_reference_threads t, cross_references x, _session251_ju26_lookup sv, _session251_ju26_lookup tv
 WHERE t.slug='jubilees-26-the-venison-and-the-blessing'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=26 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 27:5 — *And Rebekah heard when Isaac spake to Esau his son. And Esau went to the field to hunt for venison, and to bring it.* Jubilees 26:3-4 records the same: Rebecca overhearing and Esau going out to hunt.'
  FROM cross_reference_threads t, cross_references x, _session251_ju26_lookup sv, _session251_ju26_lookup tv
 WHERE t.slug='jubilees-26-the-venison-and-the-blessing'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=26 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Genesis 27:9 — *Go now to the flock, and fetch me from thence two good kids of the goats; and I will make them savoury meat for thy father, such as he loveth:* Rebecca''s instruction to Jacob in Jubilees 26:6 is the same two-kids-of-the-goats plan.'
  FROM cross_reference_threads t, cross_references x, _session251_ju26_lookup sv, _session251_ju26_lookup tv
 WHERE t.slug='jubilees-26-the-venison-and-the-blessing'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=26 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-26-the-disguise-a-dispensation-from-heaven
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 27:20 — *And Isaac said unto his son, How is it that thou hast found it so quickly, my son? And he said, Because Yahuah Elohayka (the LORD thy God) brought it to me.* Jubilees 26:15 has Jacob give the same answer, crediting Elohim for the quick find.'
  FROM cross_reference_threads t, cross_references x, _session251_ju26_lookup sv, _session251_ju26_lookup tv
 WHERE t.slug='jubilees-26-the-disguise-a-dispensation-from-heaven'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=26 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 27:22 — *And Jacob went near unto Isaac his father; and he felt him, and said, The voice is Jacob’s voice, but the hands are the hands of Esau.* Jubilees 26:18 quotes the identical line, then adds that the failed perception was “a dispensation from heaven.”'
  FROM cross_reference_threads t, cross_references x, _session251_ju26_lookup sv, _session251_ju26_lookup tv
 WHERE t.slug='jubilees-26-the-disguise-a-dispensation-from-heaven'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=26 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 27:23 — *And he discerned him not, because his hands were hairy, as his brother Esau’s hands: so he blessed him.* Jubilees 26:18 reads this same non-discernment as heaven removing Isaac''s perception so the blessing would fall on Jacob.'
  FROM cross_reference_threads t, cross_references x, _session251_ju26_lookup sv, _session251_ju26_lookup tv
 WHERE t.slug='jubilees-26-the-disguise-a-dispensation-from-heaven'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=26 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-26-the-dew-of-heaven-and-the-nations-bow
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 27:27 — *And he came near, and kissed him: and he smelled the smell of his raiment, and blessed him, and said, See, the smell of my son is as the smell of a field which Yahuah (LORD) hath blessed:* Jubilees 26:21 opens the blessing with the same smell-of-the-field that Yahuah has blessed.'
  FROM cross_reference_threads t, cross_references x, _session251_ju26_lookup sv, _session251_ju26_lookup tv
 WHERE t.slug='jubilees-26-the-dew-of-heaven-and-the-nations-bow'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=26 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 27:28 — *Therefore Elohim (God) give thee of the dew of heaven, and the fatness of the earth, and plenty of corn and wine:* The dew of heaven and plenty of corn of Jubilees 26:21 is the Genesis blessing word for word.'
  FROM cross_reference_threads t, cross_references x, _session251_ju26_lookup sv, _session251_ju26_lookup tv
 WHERE t.slug='jubilees-26-the-dew-of-heaven-and-the-nations-bow'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=26 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 27:29 — *Let people serve thee, and nations bow down to thee: be lord over thy brethren, and let thy mother’s sons bow down to thee: cursed be every one that curseth thee, and blessed be he that blesseth thee.* Jubilees 26:21,24 carries the same nations-serve-you, mother''s-sons-bow, cursed/blessed formula.'
  FROM cross_reference_threads t, cross_references x, _session251_ju26_lookup sv, _session251_ju26_lookup tv
 WHERE t.slug='jubilees-26-the-dew-of-heaven-and-the-nations-bow'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=26 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 11:20 — *By faith Isaac blessed Jacob and Esau concerning things to come.* The faith-blessing the NT reckons to Isaac is the very blessing Jubilees 26:21-24 imparts to Jacob “and to your seed for ever.”'
  FROM cross_reference_threads t, cross_references x, _session251_ju26_lookup sv, _session251_ju26_lookup tv
 WHERE t.slug='jubilees-26-the-dew-of-heaven-and-the-nations-bow'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=26 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-26-election-the-elder-shall-serve-the-younger
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 27:33 — *And Isaac trembled very exceedingly, and said, Who? where is he that hath taken venison, and brought it me, and I have eaten of all before thou camest, and have blessed him? yea, and he shall be blessed.* Jubilees 26:28 confirms the same irrevocable verdict: he and all his seed shall be blessed for ever.'
  FROM cross_reference_threads t, cross_references x, _session251_ju26_lookup sv, _session251_ju26_lookup tv
 WHERE t.slug='jubilees-26-election-the-elder-shall-serve-the-younger'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=26 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 9:12 — *It was said unto her, The elder shall serve the younger.* Paul reads the Jacob-blessing of Jubilees 26:28 as the standing word of election over the elder Esau and the younger Jacob.'
  FROM cross_reference_threads t, cross_references x, _session251_ju26_lookup sv, _session251_ju26_lookup tv
 WHERE t.slug='jubilees-26-election-the-elder-shall-serve-the-younger'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=26 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 9:13 — *As it is written, Jacob have I loved, but Esau have I hated.* The settled election Jubilees 26:28 records — the blessing fixed on Jacob — is what Paul names Jacob-loved, Esau-hated.'
  FROM cross_reference_threads t, cross_references x, _session251_ju26_lookup sv, _session251_ju26_lookup tv
 WHERE t.slug='jubilees-26-election-the-elder-shall-serve-the-younger'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=26 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Malachi 1:2 — *I have loved you, saith Yahuah (LORD). Yet ye say, Wherein hast thou loved us? Was not Esau Jacob’s brother? saith Yahuah (LORD): yet I loved Jacob,* The prophet grounds Yahuah''s love for Israel in the very Jacob-over-Esau choice Jubilees 26:28 seals.'
  FROM cross_reference_threads t, cross_references x, _session251_ju26_lookup sv, _session251_ju26_lookup tv
 WHERE t.slug='jubilees-26-election-the-elder-shall-serve-the-younger'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=26 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-26-esau-bitter-cry-profane-birthright
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 27:34 — *And when Esau heard the words of his father, he cried with a great and exceeding bitter cry, and said unto his father, Bless me, even me also, O my father.* Jubilees 26:29 retells the same great and bitter cry of Esau pleading to be blessed too.'
  FROM cross_reference_threads t, cross_references x, _session251_ju26_lookup sv, _session251_ju26_lookup tv
 WHERE t.slug='jubilees-26-esau-bitter-cry-profane-birthright'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=26 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 27:36 — *And he said, Is not he rightly named Jacob? for he hath supplanted me these two times: he took away my birthright; and, behold, now he hath taken away my blessing. And he said, Hast thou not reserved a blessing for me?* Jubilees 26:29 has Esau name the two supplantings — birthright then blessing — in the same words.'
  FROM cross_reference_threads t, cross_references x, _session251_ju26_lookup sv, _session251_ju26_lookup tv
 WHERE t.slug='jubilees-26-esau-bitter-cry-profane-birthright'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=26 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jubilees 24:3 — *And Jacob said to him: “Sell to me your primogeniture, this birthright and I will give you bread, and also some of this lentil pottage.”* The birthright Esau mourns losing in Jubilees 26:29 he had already sold for pottage in Jubilees'' earlier telling.'
  FROM cross_reference_threads t, cross_references x, _session251_ju26_lookup sv, _session251_ju26_lookup tv
 WHERE t.slug='jubilees-26-esau-bitter-cry-profane-birthright'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=26 AND sv.verse_number=29
   AND tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=24 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 12:16 — *Lest there be any fornicator, or profane person, as Esau, who for one morsel of meat sold his birthright.* The NT reads the Esau of Jubilees 26:29 as the profane man whose lost blessing began with a despised birthright.'
  FROM cross_reference_threads t, cross_references x, _session251_ju26_lookup sv, _session251_ju26_lookup tv
 WHERE t.slug='jubilees-26-esau-bitter-cry-profane-birthright'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=26 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: jubilees-26-esau-lesser-blessing-by-the-sword
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 27:39 — *And Isaac his father answered and said unto him, Behold, thy dwelling shall be the fatness of the earth, and of the dew of heaven from above;* Jubilees 26:33 gives the inverse — Esau''s dwelling far from the dew — of the same Genesis word over Esau.'
  FROM cross_reference_threads t, cross_references x, _session251_ju26_lookup sv, _session251_ju26_lookup tv
 WHERE t.slug='jubilees-26-esau-lesser-blessing-by-the-sword'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=26 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=39
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Genesis 27:40 — *And by thy sword shalt thou live, and shalt serve thy brother; and it shall come to pass when thou shalt have the dominion, that thou shalt break his yoke from off thy neck.* Jubilees 26:34 carries the same sword-and-yoke word, adding that shaking the yoke ends in Esau''s seed rooted out.'
  FROM cross_reference_threads t, cross_references x, _session251_ju26_lookup sv, _session251_ju26_lookup tv
 WHERE t.slug='jubilees-26-esau-lesser-blessing-by-the-sword'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=26 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=40
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 27:41 — *And Esau hated Jacob because of the blessing wherewith his father blessed him: and Esau said in his heart, The days of mourning for my father are at hand; then will I slay my brother Jacob.* Jubilees 26:34 ends with the identical murderous resolve in Esau''s heart.'
  FROM cross_reference_threads t, cross_references x, _session251_ju26_lookup sv, _session251_ju26_lookup tv
 WHERE t.slug='jubilees-26-esau-lesser-blessing-by-the-sword'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=26 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=27 AND tv.verse_number=41
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Malachi 1:3 — *And I hated Esau, and laid his mountains and his heritage waste for the dragons of the wilderness.* The prophet confirms the sentence Jubilees 26:34 pronounces on Esau''s seed — his heritage laid waste.'
  FROM cross_reference_threads t, cross_references x, _session251_ju26_lookup sv, _session251_ju26_lookup tv
 WHERE t.slug='jubilees-26-esau-lesser-blessing-by-the-sword'
   AND sv.edition_slug='jubilees' AND sv.book_slug='jubilees' AND sv.chapter_number=26 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

