-- ----- fragment: minion_matthew_03.sql (S260 Matthew depth) -----
CREATE TEMP VIEW _mt03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- =========================================================================
-- SECTION 3b — cross_references members
-- =========================================================================
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- THREAD 1: voice crying in the wilderness (Matt 3:1-3)
  ('canon','matthew',3,3,'canon','isaiah',40,3, 'free', E'*The voice of him that crieth in the wilderness, Prepare ye the way of Yahuah (LORD), make straight in the desert a highway for our Elohim (God)* (Isaiah 40:3). John IS that voice — Matthew names the prophet outright. The road is not built for a stranger; it is the King''s own way through the desert of a scattered people.'),
  ('canon','matthew',3,3,'canon','malachi',3,1, 'free', E'*Behold, I will send my messenger, and he shall prepare the way before me: and Yahuah (Lord), whom ye seek, shall suddenly come to his temple, even the messenger of the covenant* (Malachi 3:1). The same promise — a messenger sent ahead to ready the way for Yahuah''s own coming.'),
  ('canon','matthew',3,3,'canon','malachi',4,5, 'free', E'*Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD)* (Malachi 4:5). The messenger has a name and an office: the returning Elijah, the forerunner.'),
  ('canon','matthew',3,3,'canon','malachi',4,6, 'free', E'*And he shall turn the heart of the fathers to the children, and the heart of the children to their fathers, lest I come and smite the earth with a curse* (Malachi 4:6). The Elijah-work is restoration — knitting the generations back together before the day.'),
  ('canon','matthew',3,3,'apocrypha','ecclesiasticus',48,10, 'extras', E'*Who were ordained for reproofs in their times... and to turn the heart of the father to the son, and to restore the tribes of Jacob* (Sirach 48:10). The wise of the second Temple already read Malachi''s Elijah as the one who restores the scattered tribes — the two-house gathering in plain words.'),
  ('canon','matthew',3,3,'canon','luke',3,4, 'free', E'*As it is written in the book of the words of Esaias the prophet, saying, The voice of one crying in the wilderness, Prepare ye the way of Yahuah (Lord), make his paths straight* (Luke 3:4). Luke reaches for the very same Isaiah — the Gospels speak with one mouth.'),

  -- THREAD 2: camel hair, leathern girdle, locusts (Matt 3:4-6)
  ('canon','matthew',3,4,'canon','2-kings',1,8, 'free', E'*And they answered him, He was an hairy man, and girt with a girdle of leather about his loins. And he said, It is Elijah the Tishbite* (2 Kings 1:8). John''s camel-hair and leather girdle are not a costume — they are Elijah''s own dress. The forerunner is marked out by the prophet he comes in the spirit of.'),
  ('canon','matthew',3,4,'canon','malachi',4,5, 'free', E'*Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD)* (Malachi 4:5). The garb confirms the office: this is the promised Elijah, come before the day.'),
  ('canon','matthew',3,4,'canon','leviticus',11,21, 'free', E'*Yet these may ye eat of every flying creeping thing that goeth upon all four, which have legs above their feet, to leap withal upon the earth* (Leviticus 11:21). John''s meat of *locusts* is no wild eccentricity — the Torah names them among the clean. He eats by the law even in the wilderness.'),
  ('canon','matthew',3,4,'canon','leviticus',11,22, 'free', E'*Even these of them ye may eat; the locust after his kind, and the bald locust after his kind, and the beetle after his kind, and the grasshopper after his kind* (Leviticus 11:22). The Torah lists the locust by name as clean food. The forerunner of Messiah keeps the dietary law to the letter — the law is upheld, not set aside.'),

  -- THREAD 3: generation of vipers / fruits meet for repentance / stones to Abraham (Matt 3:7-10)
  ('canon','matthew',3,8,'canon','isaiah',1,16, 'free', E'*Wash you, make you clean; put away the evil of your doings from before mine eyes; cease to do evil* (Isaiah 1:16). *Fruits meet for repentance* are not a mood — they are washed hands and a turned life, exactly as Isaiah commands.'),
  ('canon','matthew',3,8,'canon','isaiah',1,17, 'free', E'*Learn to do well; seek judgment, relieve the oppressed, judge the fatherless, plead for the widow* (Isaiah 1:17). Repentance turns OUTWARD into obedience — doing well, defending the weak. That is the fruit John demands.'),
  ('canon','matthew',3,8,'canon','jeremiah',4,3, 'free', E'*Break up your fallow ground, and sow not among thorns* (Jeremiah 4:3). Before fruit there must be tilled, broken ground — a heart genuinely turned, not a hardened field left to thorns.'),
  ('canon','matthew',3,9,'canon','ezekiel',18,30, 'free', E'*Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin* (Ezekiel 18:30). To *repent* is to TURN — away from transgression, toward obedience. Resting on *We have Abraham to our father* while sin remains is the very presumption Ezekiel forbids.'),
  ('canon','matthew',3,9,'canon','ezekiel',18,31, 'free', E'*Cast away from you all your transgressions... and make you a new heart and a new spirit: for why will ye die, O house of Yashar''el (Israel)?* (Ezekiel 18:31). A new heart, not a bloodline, is what answers the axe at the root.'),
  ('canon','matthew',3,10,'canon','isaiah',10,33, 'free', E'*Behold, Yahuah (Lord)... shall lop the bough with terror: and the high ones of stature shall be hewn down, and the haughty shall be humbled* (Isaiah 10:33). The axe and the felling of proud trees is Isaiah''s own picture of judgment on the high and unfruitful.'),
  ('canon','matthew',3,9,'canon','romans',11,1, 'free', E'*Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1). Stones raised up to Abraham does NOT mean Israel cast off. Paul slams that door shut — Elohim has not abandoned his people.'),
  ('canon','matthew',3,9,'canon','romans',11,17, 'free', E'*And if some of the branches be broken off, and thou, being a wild olive tree, wert graffed in among them, and with them partakest of the root* (Romans 11:17). The stones become children of Abraham by GRAFTING into the same root — the nations brought in alongside Israel, not in place of her.'),

  -- THREAD 4: baptize with the Ruach HaKodesh and with fire / fan and chaff (Matt 3:11-12)
  ('canon','matthew',3,11,'canon','isaiah',4,4, 'free', E'*When Yahuah (Lord) shall have washed away the filth of the daughters of Zion... by the spirit of judgment, and by the spirit of burning* (Isaiah 4:4). Spirit AND fire stand together in Isaiah long before John — a cleansing that washes and that burns.'),
  ('canon','matthew',3,11,'canon','ezekiel',36,25, 'free', E'*Then will I sprinkle clean water upon you, and ye shall be clean: from all your filthiness, and from all your idols, will I cleanse you* (Ezekiel 36:25). The water-baptism John gives is the outward sign of this promised cleansing.'),
  ('canon','matthew',3,11,'canon','ezekiel',36,26, 'free', E'*A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh* (Ezekiel 36:26). The mightier One''s Spirit-baptism is this very gift — the stony heart removed.'),
  ('canon','matthew',3,11,'canon','ezekiel',36,27, 'free', E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). Here is the WHOLE point: the Spirit poured out is given so that we keep the statutes. Baptism with the Ruach is unto obedience, never instead of it.'),
  ('canon','matthew',3,11,'canon','joel',2,28, 'free', E'*And it shall come to pass afterward, that I will pour out my spirit upon all flesh; and your sons and your daughters shall prophesy* (Joel 2:28). The promised outpouring John points to — the Spirit on all flesh.'),
  ('canon','matthew',3,11,'canon','malachi',3,2, 'free', E'*Who may abide the day of his coming?... for he is like a refiner''s fire, and like fullers'' soap* (Malachi 3:2). The fire of the coming One is the refiner''s fire — it purifies; it does not merely destroy.'),
  ('canon','matthew',3,12,'canon','malachi',3,3, 'free', E'*And he shall sit as a refiner and purifier of silver... that they may offer unto Yahuah (LORD) an offering in righteousness* (Malachi 3:3). The fan that purges the floor is the refiner separating the precious from the dross — the end is a people offering in righteousness.'),
  ('canon','matthew',3,12,'canon','psalms',1,4, 'free', E'*The ungodly are not so: but are like the chaff which the wind driveth away* (Psalm 1:4). The chaff burned with unquenchable fire is the Psalm''s very image — the fruitless winnowed out from the wheat.'),
  ('canon','matthew',3,11,'canon','acts',2,17, 'free', E'*And it shall come to pass in the last days, saith Elohim (God), I will pour out of my Spirit upon all flesh* (Acts 2:17). At Pentecost Peter declares Joel''s promise fulfilled — the Spirit-baptism John foretold, poured out.'),

  -- THREAD 5: the baptism / heavens opened / This is my beloved Son (Matt 3:13-17)
  ('canon','matthew',3,17,'canon','psalms',2,7, 'free', E'*I will declare the decree: Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee* (Psalm 2:7). The voice from heaven echoes the Father''s own decree over the begotten Son — the Father SPEAKS, the Son is begotten and declared.'),
  ('canon','matthew',3,16,'canon','isaiah',42,1, 'free', E'*Behold my servant, whom I uphold; mine elect, in whom my soul delighteth; I have put my spirit upon him* (Isaiah 42:1). The Spirit descending as a dove IS the Father putting his Spirit upon his elect Servant — *in whom my soul delighteth* / *in whom I am well pleased.*'),
  ('canon','matthew',3,17,'canon','genesis',22,2, 'free', E'*Take now thy son, thine only son Isaac, whom thou lovest... and offer him there for a burnt offering* (Genesis 22:2). *My beloved Son* reaches back to the only-beloved son whom the father offered — Moriah''s pattern over the Jordan.'),
  ('canon','matthew',3,16,'canon','isaiah',11,2, 'free', E'*And the spirit of Yahuah (LORD) shall rest upon him, the spirit of wisdom and understanding, the spirit of counsel and might* (Isaiah 11:2). The Spirit does not merely visit; it RESTS upon him — the anointing Isaiah foretold for the Branch.'),
  ('canon','matthew',3,16,'canon','john',1,32, 'free', E'*And John bare record, saying, I saw the Spirit descending from heaven like a dove, and it abode upon him* (John 1:32). The fourth Gospel confirms the sign — the dove that remains marks out the Anointed One.'),
  ('canon','matthew',3,17,'canon','matthew',17,5, 'free', E'*Behold a voice out of the cloud, which said, This is my beloved Son, in whom I am well pleased; hear ye him* (Matthew 17:5). At the mount of transfiguration the Father speaks the same word again — Father as voice and source, declaring the Formed Son.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _mt03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _mt03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- =========================================================================
-- SECTION 3c — threads
-- =========================================================================
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-3-voice-crying-in-the-wilderness-prepare-the-way-isaiah-40-malachi-3-4',
       E'The voice of one crying in the wilderness, prepare ye the way (Isaiah 40; Malachi 3-4; Sirach 48)',
       E'**Come and see** — John is no new thing. Matthew tells us flat out who he is: *For this is he that was spoken of by the prophet Esaias, saying, The voice of one crying in the wilderness, Prepare ye the way of Yahuah (Lord), make his paths straight* (Matthew 3:3). That voice was written down ages before in **Isaiah 40:3** — *The voice of him that crieth in the wilderness, Prepare ye the way of Yahuah (LORD), make straight in the desert a highway for our Elohim (God).* The road is being built for the King''s own coming. ¶ Malachi names the office twice. **Malachi 3:1** — *Behold, I will send my messenger, and he shall prepare the way before me: and Yahuah (Lord), whom ye seek, shall suddenly come to his temple.* And **Malachi 4:5** — *Behold, I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD)* — with its work spelled out in **4:6**: *And he shall turn the heart of the fathers to the children, and the heart of the children to their fathers.* The forerunner is the returning Elijah, and his labour is RESTORATION. ¶ The wise of the second Temple already read it that way. **Sirach 48:10** says of Elijah he is *to turn the heart of the father to the son, and to restore the tribes of Jacob* — the two-house gathering named outright: the scattered tribes brought home. ¶ And **Luke 3:4** reaches for the very same Isaiah, *The voice of one crying in the wilderness* — the Gospels speak with one mouth. The voice in the desert is the oldest promise kept.',
       sv.verse_id, ev.verse_id, 'extras', 11060
  FROM _mt03_lookup sv, _mt03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=3 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-3-camels-hair-leathern-girdle-locusts-elijah-2-kings-1-leviticus-11',
       E'Camel''s hair and a leathern girdle, his meat locusts — the Elijah figure, clean food (2 Kings 1; Leviticus 11)',
       E'**Come and see** — *And the same John had his raiment of camel''s hair, and a leathern girdle about his loins; and his meat was locusts and wild honey* (Matthew 3:4). Every detail is from the Tanakh. ¶ The dress is Elijah''s own. When Ahaziah''s men describe the prophet, **2 Kings 1:8** answers: *He was an hairy man, and girt with a girdle of leather about his loins. And he said, It is Elijah the Tishbite.* The leather girdle is the badge of Elijah — so when **Malachi 4:5** promises *I will send you Elijah the prophet before the coming of the great and dreadful day of Yahuah (LORD)*, John walks out of the wilderness wearing the proof. ¶ And the *locusts*? No wild eccentricity, no breaking of the law. The Torah itself names them clean. **Leviticus 11:21** — *Yet these may ye eat of every flying creeping thing... which have legs above their feet, to leap withal upon the earth* — and **Leviticus 11:22** lists them by name: *the locust after his kind, and the bald locust after his kind, and the beetle after his kind, and the grasshopper after his kind.* The forerunner of Messiah eats by the dietary law to the letter, even in the wilderness. The law is upheld, not set aside.',
       sv.verse_id, ev.verse_id, 'free', 11063
  FROM _mt03_lookup sv, _mt03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-3-fruits-meet-for-repentance-stones-to-abraham-isaiah-1-ezekiel-18-romans-11',
       E'Bring forth fruits meet for repentance — stones raised to Abraham (Isaiah 1; Ezekiel 18; Romans 11)',
       E'**Come and see** — John''s thunder against *O generation of vipers* is not new severity; it is the prophets'' own demand. *Bring forth therefore fruits meet for repentance* (Matthew 3:8). Repentance is never a feeling — it is a TURNING into obedience, and the Tanakh has said so all along. ¶ **Isaiah 1:16** — *Wash you, make you clean; put away the evil of your doings from before mine eyes; cease to do evil* — and **1:17** turns it outward: *Learn to do well; seek judgment, relieve the oppressed, judge the fatherless, plead for the widow.* That is the fruit. **Jeremiah 4:3** demands the broken heart that bears it: *Break up your fallow ground, and sow not among thorns.* ¶ And to those who hide behind *We have Abraham to our father*, **Ezekiel 18:30** answers: *Repent, and turn yourselves from all your transgressions; so iniquity shall not be your ruin* — for what Elohim wants is **18:31**: *make you a new heart and a new spirit: for why will ye die, O house of Yashar''el (Israel)?* A new heart, not a bloodline. The axe laid to the root is Isaiah''s own picture — **Isaiah 10:33** — *shall lop the bough with terror... and the haughty shall be humbled.* ¶ But hear the guard carefully. *Elohim is able of these stones to raise up children unto Abraham* does NOT mean Israel cast off. **Romans 11:1** — *Hath Elohim (God) cast away his people? Elohim (God) forbid.* The stones become Abraham''s children by **Romans 11:17** — *thou, being a wild olive tree, wert graffed in among them, and with them partakest of the root* — the nations grafted INTO the same root, brought home alongside Israel, never in place of her.',
       sv.verse_id, ev.verse_id, 'free', 11066
  FROM _mt03_lookup sv, _mt03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=3 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-3-baptize-with-the-spirit-and-fire-fan-and-chaff-ezekiel-36-joel-2-malachi-3',
       E'He shall baptize you with the Ruach HaKodesh and with fire — the fan and the chaff (Ezekiel 36; Joel 2; Malachi 3)',
       E'**Come and see** — *he shall baptize you with the Ruach HaKodesh (Holy Spirit), and with fire* (Matthew 3:11). Spirit AND fire is no novelty; it is the prophets'' double-word for cleansing. **Isaiah 4:4** already joins them: *When Yahuah (Lord) shall have washed away the filth of the daughters of Zion... by the spirit of judgment, and by the spirit of burning.* ¶ What does the Spirit-baptism DO? **Ezekiel 36:25** — *Then will I sprinkle clean water upon you, and ye shall be clean* (John''s water-baptism is the sign of it); **36:26** — *A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh*; and then the whole point, **36:27** — *And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them.* The Spirit poured out is given UNTO obedience — that we may keep the statutes, never instead of them. **Joel 2:28** names the outpouring: *I will pour out my spirit upon all flesh* — which Peter declares fulfilled at Pentecost in **Acts 2:17**. ¶ And the fire? It is the refiner''s, not mere ruin. **Malachi 3:2** — *he is like a refiner''s fire, and like fullers'' soap* — **3:3** — *he shall sit as a refiner and purifier of silver... that they may offer unto Yahuah (LORD) an offering in righteousness.* The fan that purges the floor separates the precious from the dross. The chaff burned with unquenchable fire is **Psalm 1:4** itself: *The ungodly... are like the chaff which the wind driveth away.* The wheat is gathered; only the fruitless is winnowed out.',
       sv.verse_id, ev.verse_id, 'free', 11069
  FROM _mt03_lookup sv, _mt03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=3 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-3-the-baptism-heavens-opened-this-is-my-beloved-son-psalm-2-isaiah-42',
       E'The heavens opened — This is my beloved Son: the Father declares the Formed Son (Psalm 2; Isaiah 42; Genesis 22)',
       E'**Come and see** — read the scene exactly as Matthew gives it and the unity is unmistakable. *And Yahusha (Jesus), when he was baptized, went up straightway out of the water: and, lo, the heavens were opened unto him, and he saw the Spirit of Elohim (God) descending like a dove, and lighting upon him: And lo a voice from heaven, saying, This is my beloved Son, in whom I am well pleased* (Matthew 3:16-17). Mark who does what: the **voice comes FROM heaven** — that is the Father, the source, who speaks; the **Son is in the water**; the **Spirit descends as a dove**. The Father declares and anoints His Son. This is not three co-equal persons jostling at the river — it is the Father making His Formed Son known. ¶ The voice is the Father''s own decree of **Psalm 2:7** — *Yahuah (LORD) hath said unto me, Thou art my Son; this day have I begotten thee.* The Son is BEGOTTEN, declared by the Father. The dove fulfils **Isaiah 42:1** — *Behold my servant, whom I uphold; mine elect, in whom my soul delighteth; I have put my spirit upon him* — *in whom my soul delighteth* is *in whom I am well pleased.* The Spirit does not merely visit but RESTS, as **Isaiah 11:2** foretold of the Branch: *the spirit of Yahuah (LORD) shall rest upon him, the spirit of wisdom and understanding.* ¶ *My beloved Son* reaches back to **Genesis 22:2** — *thy son, thine only son Isaac, whom thou lovest* — the only-beloved son the father offered on Moriah. **John 1:32** confirms the sign — *I saw the Spirit descending from heaven like a dove, and it abode upon him* — and on the mount the Father will speak the same word again, **Matthew 17:5**: *This is my beloved Son, in whom I am well pleased; hear ye him.* Father as voice and source; Son in the water; Spirit upon him. One Elohim, made known in His Son.',
       sv.verse_id, ev.verse_id, 'free', 11072
  FROM _mt03_lookup sv, _mt03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=3 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- =========================================================================
-- SECTION 3d — thread_members
-- =========================================================================
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 40:3 — *The voice of him that crieth in the wilderness, Prepare ye the way of Yahuah (LORD)* — the prophecy Matthew names; John is that voice.'
  FROM cross_reference_threads t, cross_references x, _mt03_lookup sv, _mt03_lookup tv
 WHERE t.slug='matthew-3-voice-crying-in-the-wilderness-prepare-the-way-isaiah-40-malachi-3-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Malachi 3:1 — *I will send my messenger, and he shall prepare the way before me* — the same forerunner promise.'
  FROM cross_reference_threads t, cross_references x, _mt03_lookup sv, _mt03_lookup tv
 WHERE t.slug='matthew-3-voice-crying-in-the-wilderness-prepare-the-way-isaiah-40-malachi-3-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 4:5 — *I will send you Elijah the prophet before the coming of the great and dreadful day* — the messenger named.'
  FROM cross_reference_threads t, cross_references x, _mt03_lookup sv, _mt03_lookup tv
 WHERE t.slug='matthew-3-voice-crying-in-the-wilderness-prepare-the-way-isaiah-40-malachi-3-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Malachi 4:6 — *he shall turn the heart of the fathers to the children* — the Elijah-work is restoration.'
  FROM cross_reference_threads t, cross_references x, _mt03_lookup sv, _mt03_lookup tv
 WHERE t.slug='matthew-3-voice-crying-in-the-wilderness-prepare-the-way-isaiah-40-malachi-3-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Sirach 48:10 — *to restore the tribes of Jacob* — the second-Temple reading of Elijah: the two-house gathering.'
  FROM cross_reference_threads t, cross_references x, _mt03_lookup sv, _mt03_lookup tv
 WHERE t.slug='matthew-3-voice-crying-in-the-wilderness-prepare-the-way-isaiah-40-malachi-3-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=48 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Luke 3:4 — *The voice of one crying in the wilderness* — Luke quotes the same Isaiah; the Gospels speak with one mouth.'
  FROM cross_reference_threads t, cross_references x, _mt03_lookup sv, _mt03_lookup tv
 WHERE t.slug='matthew-3-voice-crying-in-the-wilderness-prepare-the-way-isaiah-40-malachi-3-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 1:8 — *an hairy man, and girt with a girdle of leather about his loins. And he said, It is Elijah the Tishbite* — John wears Elijah''s very dress.'
  FROM cross_reference_threads t, cross_references x, _mt03_lookup sv, _mt03_lookup tv
 WHERE t.slug='matthew-3-camels-hair-leathern-girdle-locusts-elijah-2-kings-1-leviticus-11'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Malachi 4:5 — *I will send you Elijah the prophet* — the garb confirms the office.'
  FROM cross_reference_threads t, cross_references x, _mt03_lookup sv, _mt03_lookup tv
 WHERE t.slug='matthew-3-camels-hair-leathern-girdle-locusts-elijah-2-kings-1-leviticus-11'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 11:21 — *Yet these may ye eat... which have legs above their feet, to leap withal* — the Torah''s clean-food clause for locusts.'
  FROM cross_reference_threads t, cross_references x, _mt03_lookup sv, _mt03_lookup tv
 WHERE t.slug='matthew-3-camels-hair-leathern-girdle-locusts-elijah-2-kings-1-leviticus-11'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 11:22 — *the locust after his kind... and the grasshopper after his kind* — locusts named clean; the forerunner eats by the law.'
  FROM cross_reference_threads t, cross_references x, _mt03_lookup sv, _mt03_lookup tv
 WHERE t.slug='matthew-3-camels-hair-leathern-girdle-locusts-elijah-2-kings-1-leviticus-11'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 1:16 — *Wash you, make you clean... cease to do evil* — repentance is washed hands and a turned life.'
  FROM cross_reference_threads t, cross_references x, _mt03_lookup sv, _mt03_lookup tv
 WHERE t.slug='matthew-3-fruits-meet-for-repentance-stones-to-abraham-isaiah-1-ezekiel-18-romans-11'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 1:17 — *Learn to do well; seek judgment, relieve the oppressed* — repentance turns outward into obedience.'
  FROM cross_reference_threads t, cross_references x, _mt03_lookup sv, _mt03_lookup tv
 WHERE t.slug='matthew-3-fruits-meet-for-repentance-stones-to-abraham-isaiah-1-ezekiel-18-romans-11'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 4:3 — *Break up your fallow ground, and sow not among thorns* — the broken heart that bears fruit.'
  FROM cross_reference_threads t, cross_references x, _mt03_lookup sv, _mt03_lookup tv
 WHERE t.slug='matthew-3-fruits-meet-for-repentance-stones-to-abraham-isaiah-1-ezekiel-18-romans-11'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 18:30 — *Repent, and turn yourselves from all your transgressions* — to repent is to turn, not to rest on a bloodline.'
  FROM cross_reference_threads t, cross_references x, _mt03_lookup sv, _mt03_lookup tv
 WHERE t.slug='matthew-3-fruits-meet-for-repentance-stones-to-abraham-isaiah-1-ezekiel-18-romans-11'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ezekiel 18:31 — *make you a new heart and a new spirit* — a new heart, not Abraham''s blood, answers the axe.'
  FROM cross_reference_threads t, cross_references x, _mt03_lookup sv, _mt03_lookup tv
 WHERE t.slug='matthew-3-fruits-meet-for-repentance-stones-to-abraham-isaiah-1-ezekiel-18-romans-11'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=18 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Isaiah 10:33 — *shall lop the bough with terror... and the haughty shall be humbled* — the axe and felled trees are Isaiah''s picture.'
  FROM cross_reference_threads t, cross_references x, _mt03_lookup sv, _mt03_lookup tv
 WHERE t.slug='matthew-3-fruits-meet-for-repentance-stones-to-abraham-isaiah-1-ezekiel-18-romans-11'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=10 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Romans 11:1 — *Hath Elohim cast away his people? Elohim forbid* — stones-to-Abraham does NOT mean Israel cast off.'
  FROM cross_reference_threads t, cross_references x, _mt03_lookup sv, _mt03_lookup tv
 WHERE t.slug='matthew-3-fruits-meet-for-repentance-stones-to-abraham-isaiah-1-ezekiel-18-romans-11'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Romans 11:17 — *thou, being a wild olive tree, wert graffed in among them* — the stones become children by grafting into the same root, alongside Israel.'
  FROM cross_reference_threads t, cross_references x, _mt03_lookup sv, _mt03_lookup tv
 WHERE t.slug='matthew-3-fruits-meet-for-repentance-stones-to-abraham-isaiah-1-ezekiel-18-romans-11'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 4:4 — *by the spirit of judgment, and by the spirit of burning* — Spirit and fire joined long before John.'
  FROM cross_reference_threads t, cross_references x, _mt03_lookup sv, _mt03_lookup tv
 WHERE t.slug='matthew-3-baptize-with-the-spirit-and-fire-fan-and-chaff-ezekiel-36-joel-2-malachi-3'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 36:25 — *Then will I sprinkle clean water upon you, and ye shall be clean* — the cleansing the water-baptism signs.'
  FROM cross_reference_threads t, cross_references x, _mt03_lookup sv, _mt03_lookup tv
 WHERE t.slug='matthew-3-baptize-with-the-spirit-and-fire-fan-and-chaff-ezekiel-36-joel-2-malachi-3'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 36:26 — *A new heart also will I give you... and I will take away the stony heart* — the Spirit-baptism is this gift.'
  FROM cross_reference_threads t, cross_references x, _mt03_lookup sv, _mt03_lookup tv
 WHERE t.slug='matthew-3-baptize-with-the-spirit-and-fire-fan-and-chaff-ezekiel-36-joel-2-malachi-3'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 36:27 — *I will put my spirit within you, and cause you to walk in my statutes* — the Spirit poured out is UNTO obedience, the whole point.'
  FROM cross_reference_threads t, cross_references x, _mt03_lookup sv, _mt03_lookup tv
 WHERE t.slug='matthew-3-baptize-with-the-spirit-and-fire-fan-and-chaff-ezekiel-36-joel-2-malachi-3'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Joel 2:28 — *I will pour out my spirit upon all flesh* — the outpouring John points to.'
  FROM cross_reference_threads t, cross_references x, _mt03_lookup sv, _mt03_lookup tv
 WHERE t.slug='matthew-3-baptize-with-the-spirit-and-fire-fan-and-chaff-ezekiel-36-joel-2-malachi-3'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Malachi 3:2 — *he is like a refiner''s fire, and like fullers'' soap* — the fire purifies, not merely destroys.'
  FROM cross_reference_threads t, cross_references x, _mt03_lookup sv, _mt03_lookup tv
 WHERE t.slug='matthew-3-baptize-with-the-spirit-and-fire-fan-and-chaff-ezekiel-36-joel-2-malachi-3'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Malachi 3:3 — *he shall sit as a refiner and purifier of silver... that they may offer... an offering in righteousness* — the fan purges to leave a righteous people.'
  FROM cross_reference_threads t, cross_references x, _mt03_lookup sv, _mt03_lookup tv
 WHERE t.slug='matthew-3-baptize-with-the-spirit-and-fire-fan-and-chaff-ezekiel-36-joel-2-malachi-3'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Psalm 1:4 — *like the chaff which the wind driveth away* — the chaff of unquenchable fire is the Psalm''s own image.'
  FROM cross_reference_threads t, cross_references x, _mt03_lookup sv, _mt03_lookup tv
 WHERE t.slug='matthew-3-baptize-with-the-spirit-and-fire-fan-and-chaff-ezekiel-36-joel-2-malachi-3'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Acts 2:17 — *I will pour out of my Spirit upon all flesh* — Peter declares Joel''s promise fulfilled at Pentecost.'
  FROM cross_reference_threads t, cross_references x, _mt03_lookup sv, _mt03_lookup tv
 WHERE t.slug='matthew-3-baptize-with-the-spirit-and-fire-fan-and-chaff-ezekiel-36-joel-2-malachi-3'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 2:7 — *Thou art my Son; this day have I begotten thee* — the Father''s decree the heavenly voice echoes; the Son is begotten and declared.'
  FROM cross_reference_threads t, cross_references x, _mt03_lookup sv, _mt03_lookup tv
 WHERE t.slug='matthew-3-the-baptism-heavens-opened-this-is-my-beloved-son-psalm-2-isaiah-42'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 42:1 — *Behold my servant... mine elect, in whom my soul delighteth; I have put my spirit upon him* — the dove is the Father putting His Spirit on the elect Servant.'
  FROM cross_reference_threads t, cross_references x, _mt03_lookup sv, _mt03_lookup tv
 WHERE t.slug='matthew-3-the-baptism-heavens-opened-this-is-my-beloved-son-psalm-2-isaiah-42'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=42 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Genesis 22:2 — *thy son, thine only son Isaac, whom thou lovest* — *my beloved Son* reaches back to the only-beloved son offered on Moriah.'
  FROM cross_reference_threads t, cross_references x, _mt03_lookup sv, _mt03_lookup tv
 WHERE t.slug='matthew-3-the-baptism-heavens-opened-this-is-my-beloved-son-psalm-2-isaiah-42'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=22 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 11:2 — *the spirit of Yahuah shall rest upon him* — the Spirit RESTS, the anointing foretold for the Branch.'
  FROM cross_reference_threads t, cross_references x, _mt03_lookup sv, _mt03_lookup tv
 WHERE t.slug='matthew-3-the-baptism-heavens-opened-this-is-my-beloved-son-psalm-2-isaiah-42'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'John 1:32 — *I saw the Spirit descending from heaven like a dove, and it abode upon him* — the fourth Gospel confirms the sign.'
  FROM cross_reference_threads t, cross_references x, _mt03_lookup sv, _mt03_lookup tv
 WHERE t.slug='matthew-3-the-baptism-heavens-opened-this-is-my-beloved-son-psalm-2-isaiah-42'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Matthew 17:5 — *This is my beloved Son, in whom I am well pleased; hear ye him* — the Father speaks the same word at the transfiguration: voice and source declaring the Formed Son.'
  FROM cross_reference_threads t, cross_references x, _mt03_lookup sv, _mt03_lookup tv
 WHERE t.slug='matthew-3-the-baptism-heavens-opened-this-is-my-beloved-son-psalm-2-isaiah-42'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=3 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=17 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
