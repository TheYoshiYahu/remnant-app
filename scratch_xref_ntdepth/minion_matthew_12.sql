-- ----- fragment: minion_matthew_12.sql (S260 Matthew depth) -----
-- ============================================================================
-- Matthew 12 — full-library cross-reference threads (NT DEPTH pass)
-- 6 threads, band 11330 step +3
-- ============================================================================

-- 3a. Temp view --------------------------------------------------------------
CREATE TEMP VIEW _mt12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- 3b. cross_references rows ---------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- THREAD 1: 12:1-8 Lord of the sabbath -------------------------------------
  ('canon','matthew',12,1,'canon','deuteronomy',23,25, 'free', E'*When thou comest into the standing corn of thy neighbour, then thou mayest pluck the ears with thine hand; but thou shalt not move a sickle unto thy neighbour''s standing corn* (Deuteronomy 23:25). The Torah itself gave the disciples leave to pluck and eat — it was never theft, never sabbath-breaking. Yahusha defends them FROM the law, not against it.'),
  ('canon','matthew',12,3,'canon','1-samuel',21,6, 'free', E'*So the priest gave him hallowed bread: for there was no bread there but the shewbread, that was taken from before Yahuah (LORD)* (1 Samuel 21:6). David in his hunger ate the shewbread — mercy toward the famished took precedence, and Scripture does not condemn him. Have ye not read?'),
  ('canon','matthew',12,5,'canon','numbers',28,9, 'free', E'*And on the sabbath day two lambs of the first year without spot... mingled with oil, and the drink offering thereof* (Numbers 28:9). The priests labour hardest on the sabbath, kindling fire and slaying lambs — work the Torah itself commands. They "profane" it yet are blameless, for the sabbath was made for worship, not idleness.'),
  ('canon','matthew',12,4,'canon','leviticus',24,8, 'free', E'*Every sabbath he shall set it in order before Yahuah (LORD) continually... by an everlasting covenant. And it shall be Aaron''s and his sons''; and they shall eat it in the holy place* (Leviticus 24:8-9). The shewbread David ate was the priests'' portion by perpetual statute — which is why the Lord of the sabbath, greater than the temple, may rightly judge its use.'),
  ('canon','matthew',12,7,'canon','hosea',6,6, 'free', E'*For I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6). Yahusha quotes Hosea against the Pharisees: had they known the heart of the Torah they would not have condemned the guiltless. Mercy is not the abolition of the law — it IS its weightier matter.'),
  ('canon','matthew',12,7,'apocrypha','ecclesiasticus',35,1, 'extras', E'*He that keepeth the law brings offerings enough: he that takes heed to the commandment offers a peace offering* (Sirach 35:1). The wisdom of the fathers had long taught what Yahusha presses home — obedience IS the truest sacrifice; the keeping of the commandment is the offering Elohim desires.'),
  ('canon','matthew',12,8,'canon','mark',2,27, 'free', E'*And he said unto them, The sabbath was made for man, and not man for the sabbath: Therefore the Son of Adam is Yahuah (Lord) also of the sabbath* (Mark 2:27-28). Mark gives the reason: the sabbath is a gift FOR man. The Son of Adam, its Lord, is its right Interpreter — never its abolisher.'),
  -- THREAD 2: 12:9-14 the withered hand / lawful to do well ------------------
  ('canon','matthew',12,12,'canon','deuteronomy',22,4, 'free', E'*Thou shalt not see thy brother''s ass or his ox fall down by the way, and hide thyself from them: thou shalt surely help him to lift them up again* (Deuteronomy 22:4). The Torah commands rescue even of a beast in distress — how much more a man with a withered hand? Doing good on the sabbath is the law obeyed, not broken.'),
  ('canon','matthew',12,11,'canon','exodus',23,5, 'free', E'*If thou see the ass of him that hateth thee lying under his burden, and wouldest forbear to help him, thou shalt surely help with him* (Exodus 23:5). The law lifts a fallen beast even of an enemy. Yahusha''s "what man among you... will he not lay hold on it, and lift it out?" simply reads the commandment aloud.'),
  ('canon','matthew',12,12,'canon','leviticus',19,18, 'free', E'*Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). To heal the man is to love the neighbour — the royal commandment. Mercy IS the sabbath kept.'),
  ('canon','matthew',12,11,'canon','proverbs',12,10, 'free', E'*A righteous man regardeth the life of his beast: but the tender mercies of the wicked are cruel* (Proverbs 12:10). The righteous heart that pities a sheep in a pit will surely pity a suffering man — the Pharisees who would forbid the healing are the cruel ones.'),
  -- THREAD 3: 12:15-21 behold my servant (Isaiah 42) -------------------------
  ('canon','matthew',12,18,'canon','isaiah',42,1, 'free', E'*Behold my servant, whom I uphold; mine elect, in whom my soul delighteth; I have put my spirit upon him: he shall bring forth judgment to the Gentiles* (Isaiah 42:1). Matthew names the chosen Servant — the Formed Son anointed BY the Father, in whom the Father''s soul delights. The Spirit is put UPON him; the Father is the source.'),
  ('canon','matthew',12,20,'canon','isaiah',42,3, 'free', E'*A bruised reed shall he not break, and the smoking flax shall he not quench: he shall bring forth judgment unto truth* (Isaiah 42:3). The gentle Servant — he will not crush the broken nor snuff the faint. This is the Master whose yoke is easy, the same Servant Matthew sees healing the multitudes without strife or cry.'),
  ('canon','matthew',12,21,'canon','isaiah',42,4, 'free', E'*He shall not fail nor be discouraged, till he have set judgment in the earth: and the isles shall wait for his law* (Isaiah 42:4). "In his name shall the Gentiles trust" — the isles waiting for his Torah. The nations drawn in are scattered Yashar''el gathered home and the stranger grafted, never the law set aside.'),
  ('canon','matthew',12,21,'canon','isaiah',49,6, 'free', E'*It is a light thing that thou shouldest be my servant to raise up the tribes of Jacob, and to restore the preserved of Yashar''el (Israel): I will also give thee for a light to the Gentiles* (Isaiah 49:6). The Servant''s twofold work — restore the tribes AND be a light to the nations. The two houses gathered into one (Ezek 37), the Gentiles brought near.'),
  ('canon','matthew',12,21,'canon','isaiah',11,10, 'free', E'*And in that day there shall be a root of Jesse, which shall stand for an ensign of the people; to it shall the Gentiles seek: and his rest shall be glorious* (Isaiah 11:10). The Root of Jesse raised as a banner — *to it shall the Gentiles seek*. "In his name shall the Gentiles trust" is Isaiah''s own promise come to pass.'),
  -- THREAD 4: 12:22-37 by Beelzebub / blasphemy against the Spirit -----------
  ('canon','matthew',12,29,'canon','isaiah',49,24, 'free', E'*Shall the prey be taken from the mighty, or the lawful captive delivered? But thus saith Yahuah (LORD)... I will contend with him that contendeth with thee, and I will save thy children* (Isaiah 49:24-25). To plunder the strong man''s house is to take back the prey from the mighty — exactly what Isaiah promised Yahuah would do for his captive children.'),
  ('canon','matthew',12,28,'canon','ezekiel',36,27, 'free', E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). The Spirit of Elohim by which Yahusha casts out devils is the same Spirit promised to write the statutes on the heart — the kingdom come is a people made to keep the Torah, not freed from it.'),
  ('canon','matthew',12,24,'enoch','1-enoch',15,11, 'extras', E'*From the days of the slaughter and destruction and death of the giants, from the souls of whose flesh the spirits, having gone forth, shall destroy... until the day of the consummation, the great judgement* (1 Enoch 15:11). The library tells where the unclean spirits came from — the souls of the dead giants, the offspring of the Watchers. These are the very devils the Son binds and casts out.'),
  ('canon','matthew',12,25,'canon','1-samuel',2,25, 'free', E'*If one man sin against another, the judge shall judge him: but if a man sin against Yahuah (LORD), who shall intreat for him?* (1 Samuel 2:25). The blasphemy against the Ruach HaKodesh is the sin that calls the work of Elohim the work of Satan — to sin against Yahuah himself, for whom no intercessor is left while the heart stays hard.'),
  ('canon','matthew',12,37,'canon','proverbs',18,21, 'free', E'*Death and life are in the power of the tongue: and they that love it shall eat the fruit thereof* (Proverbs 18:21). "By thy words thou shalt be justified, and by thy words thou shalt be condemned" — the wisdom of Proverbs made plain: the mouth speaks out of the heart''s treasure, and the heart is judged by its fruit.'),
  -- THREAD 5: 12:38-42 the sign of Jonah / greater than Solomon --------------
  ('canon','matthew',12,40,'canon','jonah',1,17, 'free', E'*Now Yahuah (LORD) had prepared a great fish to swallow up Jonah. And Jonah was in the belly of the fish three days and three nights* (Jonah 1:17). The one sign given the evil generation — Jonah three days in the deep is the Son of Adam three days in the heart of the earth, the sign of resurrection.'),
  ('canon','matthew',12,41,'canon','jonah',3,5, 'free', E'*So the people of Nineveh believed Elohim (God), and proclaimed a fast, and put on sackcloth, from the greatest of them even to the least of them* (Jonah 3:5). The men of Nineveh repented at Jonah''s preaching — and shall rise to condemn a generation that has a greater than Jonah standing before it and will not turn.'),
  ('canon','matthew',12,42,'canon','1-kings',10,1, 'free', E'*And when the queen of Sheba heard of the fame of Solomon concerning the name of Yahuah (LORD), she came to prove him with hard questions* (1 Kings 10:1). The queen of the south came from the ends of the earth to hear Solomon''s wisdom — and a greater than Solomon is here, unsought by his own.'),
  -- THREAD 6: 12:43-50 the unclean spirit returns / whoso doeth the will -----
  ('canon','matthew',12,45,'canon','proverbs',26,11, 'free', E'*As a dog returneth to his vomit, so a fool returneth to his folly* (Proverbs 26:11). The house swept and empty but left untenanted is worse at the last than the first — repentance that does not fill the heart with obedience invites seven spirits more wicked back in.'),
  ('canon','matthew',12,50,'canon','deuteronomy',33,9, 'free', E'*Who said unto his father and to his mother, I have not seen him... for they have observed thy word, and kept thy covenant* (Deuteronomy 33:9). Levi''s blessing: loyalty to Yahuah''s covenant above flesh and kin. So Yahusha names the true family — not by blood but by keeping the Father''s word.'),
  ('canon','matthew',12,50,'canon','psalms',22,22, 'free', E'*I will declare thy name unto my brethren: in the midst of the congregation will I praise thee* (Psalm 22:22). The Messiah calls his obedient ones brethren — the congregation gathered around the Father''s will. *Whosoever shall do the will of my Father which is in heaven, the same is my brother, and sister, and mother.*')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _mt12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _mt12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- 3c. Threads ----------------------------------------------------------------
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-12-the-son-of-adam-is-lord-of-the-sabbath-deuteronomy-23-1-samuel-21-hosea-6',
       E'The Son of Adam is Lord of the sabbath — have ye not read (Deuteronomy 23; 1 Samuel 21; Numbers 28; Hosea 6; Sirach 35)',
       E'When the Pharisees charge the disciples with sabbath-breaking for plucking corn, Yahusha does not loosen the sabbath — he reads it rightly out of the Torah itself. *When thou comest into the standing corn of thy neighbour, then thou mayest pluck the ears with thine hand* (Deuteronomy 23:25): the law gave them leave; it was never theft, never breaking. Then *have ye not read what David did* — *So the priest gave him hallowed bread: for there was no bread there but the shewbread, that was taken from before Yahuah (LORD)* (1 Samuel 21:6): hunger and mercy took precedence and Scripture did not condemn him. And the priests themselves? *On the sabbath day two lambs of the first year... mingled with oil, and the drink offering thereof* (Numbers 28:9) — they labour hardest of all men on the sabbath, kindling fire and slaying lambs the Torah commands, and *are blameless*. The shewbread David ate was the priests'' own portion: *Every sabbath he shall set it in order before Yahuah (LORD) continually... and they shall eat it in the holy place... by a perpetual statute* (Leviticus 24:8-9). The Lord of the sabbath, *greater than the temple*, may rightly judge its use. The whole defense turns on Hosea: *For I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6) — had the Pharisees known the heart of the law they would not have condemned the guiltless. The fathers had taught it long before: *He that keepeth the law brings offerings enough: he that takes heed to the commandment offers a peace offering* (Sirach 35:1) — obedience IS the truest sacrifice. Mark gives the key: *The sabbath was made for man, and not man for the sabbath: Therefore the Son of Adam is Yahuah (Lord) also of the sabbath* (Mark 2:27-28). The sabbath is a gift FOR man, and its Lord is its right Interpreter — never its abolisher. This is the anchor against the lie that "Jesus broke the Sabbath": he upholds it, and rebukes those who forgot mercy was always its weightier matter.',
       sv.verse_id, ev.verse_id, 'extras', 11330
  FROM _mt12_lookup sv, _mt12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=12 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-12-lawful-to-do-well-on-the-sabbath-the-withered-hand-deuteronomy-22-leviticus-19',
       E'It is lawful to do well on the sabbath — the withered hand (Deuteronomy 22; Exodus 23; Leviticus 19; Proverbs 12)',
       E'*Is it lawful to heal on the sabbath days?* — and Yahusha answers with the Torah, not against it. *What man... that shall have one sheep, and if it fall into a pit on the sabbath day, will he not lay hold on it, and lift it out?* He is simply reading the commandment aloud: *Thou shalt not see thy brother''s ass or his ox fall down by the way, and hide thyself from them: thou shalt surely help him to lift them up again* (Deuteronomy 22:4). The law commands rescue even of a beast — *If thou see the ass of him that hateth thee lying under his burden... thou shalt surely help with him* (Exodus 23:5) — and lifts the fallen even of an enemy. *How much then is a man better than a sheep?* To heal the withered hand is to keep the royal commandment: *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). And *A righteous man regardeth the life of his beast: but the tender mercies of the wicked are cruel* (Proverbs 12:10) — the heart that pities a sheep in a pit will surely pity a suffering man; it is the Pharisees plotting his destruction who are the cruel ones. *Wherefore it is lawful to do well on the sabbath days.* Mercy is not a loophole in the sabbath — mercy IS the sabbath kept.',
       sv.verse_id, ev.verse_id, 'free', 11333
  FROM _mt12_lookup sv, _mt12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=12 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=12 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-12-behold-my-servant-whom-i-have-chosen-isaiah-42-isaiah-49-isaiah-11',
       E'Behold my servant whom I have chosen — a bruised reed (Isaiah 42; Isaiah 49; Isaiah 11)',
       E'Matthew sees the healing Servant and names him from Isaiah, quoted in full. *Behold my servant, whom I uphold; mine elect, in whom my soul delighteth; I have put my spirit upon him: he shall bring forth judgment to the Gentiles* (Isaiah 42:1) — the Formed Son chosen and anointed BY the Father, in whom the Father''s own soul delights. The Spirit is put UPON him; the Father is the source. He is gentle: *A bruised reed shall he not break, and the smoking flax shall he not quench: he shall bring forth judgment unto truth* (Isaiah 42:3) — the same Master whose yoke is easy, who heals without strife or cry. *He shall not fail nor be discouraged, till he have set judgment in the earth: and the isles shall wait for his law* (Isaiah 42:4) — and so Matthew can say *in his name shall the Gentiles trust*: the isles waiting for his Torah. This is the Servant''s twofold charge: *It is a light thing that thou shouldest be my servant to raise up the tribes of Jacob, and to restore the preserved of Yashar''el (Israel): I will also give thee for a light to the Gentiles* (Isaiah 49:6) — restore the two houses AND draw the nations. *And in that day there shall be a root of Jesse, which shall stand for an ensign of the people; to it shall the Gentiles seek* (Isaiah 11:10): the nations seeking the Root of Jesse are scattered Yashar''el gathered home and the stranger grafted in — never the law set aside, for the isles wait for it still.',
       sv.verse_id, ev.verse_id, 'free', 11336
  FROM _mt12_lookup sv, _mt12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=12 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=12 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-12-binding-the-strong-man-blasphemy-against-the-spirit-isaiah-49-1-enoch-15',
       E'Binding the strong man — the blasphemy against the Ruach HaKodesh (Isaiah 49; Ezekiel 36; 1 Enoch 15; Proverbs 18)',
       E'When the Pharisees call his work the work of Beelzebub, Yahusha shows whose power is truly at work. *How can one enter into a strong man''s house, and spoil his goods, except he first bind the strong man?* — this is Isaiah''s promise: *Shall the prey be taken from the mighty, or the lawful captive delivered? But thus saith Yahuah (LORD)... I will contend with him that contendeth with thee, and I will save thy children* (Isaiah 49:24-25). To plunder the strong man''s house is to take back the captives from the mighty. And by what Spirit? *I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27) — the Spirit of Elohim by which the devils are cast out is the same Spirit that writes the Torah on the heart; the kingdom come is a people made to keep the commandments, not freed from them. The library even tells us what these unclean spirits ARE: *from the souls of whose flesh the spirits, having gone forth, shall destroy... until the day of the consummation, the great judgement* (1 Enoch 15:11) — the spirits of the dead giants, offspring of the Watchers, the very devils the Son binds. To call this work satanic is the unpardonable sin — *if a man sin against Yahuah (LORD), who shall intreat for him?* (1 Samuel 2:25). For the mouth betrays the heart: *Death and life are in the power of the tongue* (Proverbs 18:21); *by thy words thou shalt be justified, and by thy words thou shalt be condemned.*',
       sv.verse_id, ev.verse_id, 'extras', 11339
  FROM _mt12_lookup sv, _mt12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=12 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=12 AND ev.verse_number=37
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-12-the-sign-of-the-prophet-jonah-greater-than-solomon-jonah-1-jonah-3-1-kings-10',
       E'The sign of the prophet Jonah — a greater than Solomon is here (Jonah 1; Jonah 3; 1 Kings 10)',
       E'The evil generation seeks a sign, and only one is given. *Now Yahuah (LORD) had prepared a great fish to swallow up Jonah. And Jonah was in the belly of the fish three days and three nights* (Jonah 1:17) — *so shall the Son of Adam be three days and three nights in the heart of the earth*: the sign of resurrection, the going down into the deep and the rising again. The Ninevites will judge this generation: *So the people of Nineveh believed Elohim (God), and proclaimed a fast, and put on sackcloth, from the greatest of them even to the least of them* (Jonah 3:5) — pagans repented at Jonah''s preaching, *and, behold, a greater than Jonas is here*, yet his own will not turn. So too the queen of the south: *And when the queen of Sheba heard of the fame of Solomon concerning the name of Yahuah (LORD), she came to prove him with hard questions* (1 Kings 10:1) — she crossed the earth to hear Solomon''s wisdom, *and, behold, a greater than Solomon is here*, unsought. The witnesses of the nations will rise to condemn the unbelief of those who had the Greater standing before them.',
       sv.verse_id, ev.verse_id, 'free', 11342
  FROM _mt12_lookup sv, _mt12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=12 AND sv.verse_number=38
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=12 AND ev.verse_number=42
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-12-whosoever-shall-do-the-will-of-my-father-the-true-family-deuteronomy-33-psalm-22',
       E'Whosoever shall do the will of my Father — the true family (Proverbs 26; Deuteronomy 33; Psalm 22)',
       E'The unclean spirit that left returns to find the house *empty, swept, and garnished* — and brings seven worse. *As a dog returneth to his vomit, so a fool returneth to his folly* (Proverbs 26:11): a repentance that empties the heart but does not fill it with obedience leaves the door open, and *the last state of that man is worse than the first.* Then the true house is named. When his mother and brethren stand without, Yahusha defines kinship not by blood but by the Father''s will — the very loyalty of Levi: *Who said unto his father and to his mother, I have not seen him... for they have observed thy word, and kept thy covenant* (Deuteronomy 33:9). The Messiah gathers an obedient family and calls them brethren: *I will declare thy name unto my brethren: in the midst of the congregation will I praise thee* (Psalm 22:22). *For whosoever shall do the will of my Father which is in heaven, the same is my brother, and sister, and mother.* This is the seal against every lawless reading — the will of the Father is His commandment, and the true family is the one that does it.',
       sv.verse_id, ev.verse_id, 'free', 11345
  FROM _mt12_lookup sv, _mt12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=12 AND sv.verse_number=43
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=12 AND ev.verse_number=50
ON CONFLICT (slug) DO NOTHING;

-- 3d. Thread members ---------------------------------------------------------
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 23:25 — *thou mayest pluck the ears with thine hand* — the Torah gave the disciples leave; it was never sabbath-breaking.'
  FROM cross_reference_threads t, cross_references x, _mt12_lookup sv, _mt12_lookup tv
 WHERE t.slug='matthew-12-the-son-of-adam-is-lord-of-the-sabbath-deuteronomy-23-1-samuel-21-hosea-6'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=12 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=23 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Samuel 21:6 — David ate the shewbread in his hunger; mercy took precedence and Scripture did not condemn him.'
  FROM cross_reference_threads t, cross_references x, _mt12_lookup sv, _mt12_lookup tv
 WHERE t.slug='matthew-12-the-son-of-adam-is-lord-of-the-sabbath-deuteronomy-23-1-samuel-21-hosea-6'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=12 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=21 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 28:9 — the priests labour hardest on the sabbath by the Torah''s own command, and are blameless.'
  FROM cross_reference_threads t, cross_references x, _mt12_lookup sv, _mt12_lookup tv
 WHERE t.slug='matthew-12-the-son-of-adam-is-lord-of-the-sabbath-deuteronomy-23-1-samuel-21-hosea-6'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=12 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=28 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 24:8-9 — the shewbread was the priests'' portion by everlasting covenant; the Lord greater than the temple judges its use.'
  FROM cross_reference_threads t, cross_references x, _mt12_lookup sv, _mt12_lookup tv
 WHERE t.slug='matthew-12-the-son-of-adam-is-lord-of-the-sabbath-deuteronomy-23-1-samuel-21-hosea-6'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=12 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=24 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Hosea 6:6 — *I desired mercy, and not sacrifice* — the weightier matter of the Torah, not its abolition.'
  FROM cross_reference_threads t, cross_references x, _mt12_lookup sv, _mt12_lookup tv
 WHERE t.slug='matthew-12-the-son-of-adam-is-lord-of-the-sabbath-deuteronomy-23-1-samuel-21-hosea-6'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=12 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=6 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Sirach 35:1 — *He that keepeth the law brings offerings enough* — the fathers taught that obedience is the truest sacrifice.'
  FROM cross_reference_threads t, cross_references x, _mt12_lookup sv, _mt12_lookup tv
 WHERE t.slug='matthew-12-the-son-of-adam-is-lord-of-the-sabbath-deuteronomy-23-1-samuel-21-hosea-6'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=12 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=35 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Mark 2:27-28 — *The sabbath was made for man* — the gift FOR man, whose Lord is its right Interpreter, never its abolisher.'
  FROM cross_reference_threads t, cross_references x, _mt12_lookup sv, _mt12_lookup tv
 WHERE t.slug='matthew-12-the-son-of-adam-is-lord-of-the-sabbath-deuteronomy-23-1-samuel-21-hosea-6'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=12 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=2 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 22:4 — the Torah commands rescue of a fallen beast; how much more a suffering man?'
  FROM cross_reference_threads t, cross_references x, _mt12_lookup sv, _mt12_lookup tv
 WHERE t.slug='matthew-12-lawful-to-do-well-on-the-sabbath-the-withered-hand-deuteronomy-22-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=12 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=22 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 23:5 — the law lifts a fallen beast even of an enemy; Yahusha simply reads the commandment aloud.'
  FROM cross_reference_threads t, cross_references x, _mt12_lookup sv, _mt12_lookup tv
 WHERE t.slug='matthew-12-lawful-to-do-well-on-the-sabbath-the-withered-hand-deuteronomy-22-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=12 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 19:18 — to heal the man is to love the neighbour; mercy IS the sabbath kept.'
  FROM cross_reference_threads t, cross_references x, _mt12_lookup sv, _mt12_lookup tv
 WHERE t.slug='matthew-12-lawful-to-do-well-on-the-sabbath-the-withered-hand-deuteronomy-22-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=12 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 12:10 — the righteous regard the life of a beast; the Pharisees who forbid the healing are the cruel ones.'
  FROM cross_reference_threads t, cross_references x, _mt12_lookup sv, _mt12_lookup tv
 WHERE t.slug='matthew-12-lawful-to-do-well-on-the-sabbath-the-withered-hand-deuteronomy-22-leviticus-19'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=12 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=12 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 42:1 — the chosen Servant anointed BY the Father, in whom the Father''s soul delights; the Spirit put UPON him.'
  FROM cross_reference_threads t, cross_references x, _mt12_lookup sv, _mt12_lookup tv
 WHERE t.slug='matthew-12-behold-my-servant-whom-i-have-chosen-isaiah-42-isaiah-49-isaiah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=12 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=42 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 42:3 — *a bruised reed shall he not break* — the gentle Servant whose yoke is easy, healing without strife.'
  FROM cross_reference_threads t, cross_references x, _mt12_lookup sv, _mt12_lookup tv
 WHERE t.slug='matthew-12-behold-my-servant-whom-i-have-chosen-isaiah-42-isaiah-49-isaiah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=12 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=42 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 42:4 — *the isles shall wait for his law* — the nations'' trust is for his Torah, not its setting aside.'
  FROM cross_reference_threads t, cross_references x, _mt12_lookup sv, _mt12_lookup tv
 WHERE t.slug='matthew-12-behold-my-servant-whom-i-have-chosen-isaiah-42-isaiah-49-isaiah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=12 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=42 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 49:6 — the Servant''s twofold work: restore the two houses AND be a light to the Gentiles.'
  FROM cross_reference_threads t, cross_references x, _mt12_lookup sv, _mt12_lookup tv
 WHERE t.slug='matthew-12-behold-my-servant-whom-i-have-chosen-isaiah-42-isaiah-49-isaiah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=12 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 11:10 — the Root of Jesse a banner *to it shall the Gentiles seek* — Isaiah''s own promise of the nations'' trust.'
  FROM cross_reference_threads t, cross_references x, _mt12_lookup sv, _mt12_lookup tv
 WHERE t.slug='matthew-12-behold-my-servant-whom-i-have-chosen-isaiah-42-isaiah-49-isaiah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=12 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 49:24-25 — to spoil the strong man''s house is to take back the prey from the mighty, Yahuah''s own promise.'
  FROM cross_reference_threads t, cross_references x, _mt12_lookup sv, _mt12_lookup tv
 WHERE t.slug='matthew-12-binding-the-strong-man-blasphemy-against-the-spirit-isaiah-49-1-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=12 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 36:27 — the Spirit that casts out devils is the same Spirit that writes the statutes on the heart.'
  FROM cross_reference_threads t, cross_references x, _mt12_lookup sv, _mt12_lookup tv
 WHERE t.slug='matthew-12-binding-the-strong-man-blasphemy-against-the-spirit-isaiah-49-1-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=12 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 15:11 — the unclean spirits are the souls of the dead giants, offspring of the Watchers — the very devils the Son binds.'
  FROM cross_reference_threads t, cross_references x, _mt12_lookup sv, _mt12_lookup tv
 WHERE t.slug='matthew-12-binding-the-strong-man-blasphemy-against-the-spirit-isaiah-49-1-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=12 AND sv.verse_number=24
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=15 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Samuel 2:25 — *if a man sin against Yahuah, who shall intreat for him?* — the unpardonable hardness against the Spirit.'
  FROM cross_reference_threads t, cross_references x, _mt12_lookup sv, _mt12_lookup tv
 WHERE t.slug='matthew-12-binding-the-strong-man-blasphemy-against-the-spirit-isaiah-49-1-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=12 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=2 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Proverbs 18:21 — *death and life are in the power of the tongue* — the mouth speaks the heart''s treasure, and is judged by its fruit.'
  FROM cross_reference_threads t, cross_references x, _mt12_lookup sv, _mt12_lookup tv
 WHERE t.slug='matthew-12-binding-the-strong-man-blasphemy-against-the-spirit-isaiah-49-1-enoch-15'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=12 AND sv.verse_number=37
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=18 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jonah 1:17 — three days and three nights in the belly of the fish — the sign of resurrection, the going down and the rising.'
  FROM cross_reference_threads t, cross_references x, _mt12_lookup sv, _mt12_lookup tv
 WHERE t.slug='matthew-12-the-sign-of-the-prophet-jonah-greater-than-solomon-jonah-1-jonah-3-1-kings-10'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=12 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jonah 3:5 — the Ninevites repented at Jonah''s preaching; a greater than Jonah is here, yet his own will not turn.'
  FROM cross_reference_threads t, cross_references x, _mt12_lookup sv, _mt12_lookup tv
 WHERE t.slug='matthew-12-the-sign-of-the-prophet-jonah-greater-than-solomon-jonah-1-jonah-3-1-kings-10'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=12 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Kings 10:1 — the queen of Sheba crossed the earth to hear Solomon''s wisdom; a greater than Solomon is here, unsought.'
  FROM cross_reference_threads t, cross_references x, _mt12_lookup sv, _mt12_lookup tv
 WHERE t.slug='matthew-12-the-sign-of-the-prophet-jonah-greater-than-solomon-jonah-1-jonah-3-1-kings-10'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=12 AND sv.verse_number=42
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=10 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 26:11 — *as a dog returneth to his vomit* — a repentance that leaves the heart empty invites worse back in.'
  FROM cross_reference_threads t, cross_references x, _mt12_lookup sv, _mt12_lookup tv
 WHERE t.slug='matthew-12-whosoever-shall-do-the-will-of-my-father-the-true-family-deuteronomy-33-psalm-22'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=12 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=26 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 33:9 — Levi''s loyalty to the covenant above flesh and kin; the true family keeps the Father''s word.'
  FROM cross_reference_threads t, cross_references x, _mt12_lookup sv, _mt12_lookup tv
 WHERE t.slug='matthew-12-whosoever-shall-do-the-will-of-my-father-the-true-family-deuteronomy-33-psalm-22'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=12 AND sv.verse_number=50
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=33 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 22:22 — the Messiah calls his obedient ones brethren in the congregation; the will of the Father is His commandment.'
  FROM cross_reference_threads t, cross_references x, _mt12_lookup sv, _mt12_lookup tv
 WHERE t.slug='matthew-12-whosoever-shall-do-the-will-of-my-father-the-true-family-deuteronomy-33-psalm-22'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=12 AND sv.verse_number=50
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=22 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
