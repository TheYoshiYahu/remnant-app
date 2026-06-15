-- =====================================================================
-- Session 305 — Exodus FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session305_exodus_cross_references.sql
-- =====================================================================

\echo 'session305 — Exodus cross-references starting...'
BEGIN;

-- ----- fragment: minion_exodus_3.sql (Exodus 3) -----
-- Chapter: Exodus 3 — THE BURNING BUSH, I AM THAT I AM, THE ANGEL OF YAHUAH = THE FORMED SON (the framework heavyweight of the book): Moses keeps the flock at Horeb, the mountain of Elohim; the angel of Yahuah appears in a flame of fire in the midst of a bush, and the bush burns but is not consumed; "put off thy shoes... the place whereon thou standest is holy ground"; "I am the Elohim of thy father, the Elohim of Abraham, Isaac, and Jacob"; "I have surely seen the affliction of my people... and am come down to deliver them" into a land flowing with milk and honey; the token — "ye shall serve Elohim upon this mountain"; the Name revealed — "Ehyeh asher Ehyeh (I AM THAT I AM)... this is my name for ever, and this is my memorial unto all generations"; the spoiling of Egypt — "ye shall not go empty."
-- Tag: ex03   Temp view: _s305_ex03_lookup   Session prefix: s305
-- Sort band: base 29050, step 3 -> threads at 29050, 29053, 29056, 29059, 29062, 29065 (6 threads)
-- Source of EVERY row: 'canon','exodus',3,v
--
-- Exodus 3 coverage:
--   ★★ v.2-6 (the angel of Yahuah appeared unto him in a flame of fire out of the midst of a bush... I am the Elohim of thy father, the Elohim of Abraham, Isaac, and Jacob)
--        NT:     John 8:58 (Before Abraham was, I am); John 8:56 (Your father Abraham rejoiced to see my day); Acts 7:30 (there appeared to him in the wilderness of mount Sina an angel of Yahuah in a flame of fire in a bush); Acts 7:32 (I am the Elohim of thy fathers...); Acts 7:35 (a ruler and a deliverer by the hand of the angel which appeared to him in the bush) — THREAD 1 (load-bearing: the Angel in the bush = the Formed Son who bears the Name, Red Line #4 STRICT)
--        Extras: Jasher 79:3-4 (Yahuah appeared there to him in the bush... the fire had no power over the bush to consume it... Yahuah called to Moses out of the fire) — THREAD 1
--        Tanakh: Exodus 23:20-21 (Behold, I send an Angel before thee... obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him); Genesis 48:16 (The Angel which redeemed me from all evil, bless the lads) — THREAD 1 (the Angel who bears the Name, lateral)
--   ★ v.5 (Draw not nigh hither: put off thy shoes from off thy feet, for the place whereon thou standest is holy ground)
--        NT:     Acts 7:33 (Put off thy shoes from thy feet: for the place where thou standest is holy ground) — THREAD 2
--        Extras: none warranted (Jasher 79 has the bush but not the shoes-and-holy-ground word, clean)
--        Tanakh: ★ Joshua 5:15 (Loose thy shoe from off thy foot; for the place whereon thou standest is holy — the captain of the host of Yahuah, same Formed presence) — THREAD 2 (load-bearing lateral: same word, same Formed One)
--   ★★ v.6 (I am the Elohim of Abraham, the Elohim of Isaac, and the Elohim of Jacob)
--        NT:     Matthew 22:31-32 (Elohim is not the Elohim of the dead, but of the living); Mark 12:26-27 (have ye not read in the book of Moses, how in the bush Elohim spake unto him); Luke 20:37-38 (even Moses shewed at the bush... for all live unto him) — THREAD 3 (load-bearing: Yahusha quotes THIS verse to prove the resurrection)
--        Extras: none warranted distinct (the resurrection-proof is the NT reading of the verse)
--        Tanakh: none warranted distinct here (the Abraham-Isaac-Jacob Name carried by THREAD 1; the living-Elohim weave is the NT proof)
--   ★ v.12 (this shall be a token unto thee... When thou hast brought forth the people out of Egypt, ye shall serve Elohim upon this mountain)
--        NT:     none warranted distinct (the Sinai-service trajectory is Tanakh-lateral; the feast-fulfilment belongs to its own packs)
--        Extras: none warranted (Jubilees 48:1-2 references Sinai but framed around Mastema, not the token)
--        Tanakh: ★ Exodus 19:11 (the third day Yahuah will come down... upon mount Sinai); Exodus 23:14-15 (Three times thou shalt keep a feast unto me in the year... the feast of unleavened bread) — THREAD 4 (the token fulfilled: the same mountain, the appointed-times service, Red Line #3)
--   ★★ v.13-15 (Ehyeh asher Ehyeh — I AM THAT I AM... this is my name for ever, and this is my memorial unto all generations)
--        NT:     John 8:24 (if ye believe not that I am he, ye shall die in your sins); John 8:28 (When ye have lifted up the Son of Adam, then shall ye know that I am he); John 8:58 (Before Abraham was, I am); John 18:5-6 (I am he... they went backward, and fell to the ground); Revelation 1:8 (I am Alpha and Omega... which is, and which was, and which is to come) — THREAD 5 (THE keystone: the Name I AM, claimed by the Formed Son who bears it)
--        Extras: none warranted distinct (the I AM weave is canon NT)
--        Tanakh: ★ Hosea 12:5 (Even Yahuah Elohim of hosts; Yahuah is his memorial); ★ Malachi 3:6 (For I am Yahuah, I change not) — THREAD 5 (the Name as memorial-forever, unchanging — NOT abolished, Red Line #6)
--   ★ v.7-10 + v.21-22 (I have surely seen the affliction of my people... and am come down to deliver them... and ye shall not go empty... ye shall spoil the Egyptians)
--        NT:     Acts 7:34 (I have seen, I have seen the affliction of my people which is in Egypt... and am come down to deliver them) — THREAD 6
--        Extras: Jubilees 48:19 (And we did not lead forth the children of Yashar'el from Egypt empty handed) — THREAD 6 (the spoiling/not-empty promise kept)
--        Tanakh: none warranted distinct beyond THREAD 6 (the deliverance pattern carried forward by Acts; the gathering language not forced here)
--   v.11 (Who am I, that I should go unto Pharaoh?) — Moses' demur, narrative; no framework-bearing target, carried into THREAD 5/6 prose.
--   v.16-20 (gather the elders... the king of Egypt will not let you go... I will smite Egypt with all my wonders) — the commission and the plague-foretelling; the milk-and-honey land repeats v.8 (held to THREAD 6); no distinct add.
--
-- Threads (slug — target libraries):
--   1. exodus-3-the-angel-in-the-bush-bears-the-name-the-formed-son — NT (John, Acts) + Tanakh (Exodus 23, Genesis 48) + Extras (Jasher) [extras] (★★ the Angel in the flame = the Formed Son who bears the Name; Red Line #4 STRICT)
--   2. exodus-3-put-off-thy-shoes-the-place-is-holy-ground — NT (Acts) + Tanakh (Joshua) [free] (★ the Formed One's presence makes ground holy)
--   3. exodus-3-the-elohim-of-the-living-not-of-the-dead — NT (Matthew, Mark, Luke) [free] (★★ Yahusha quotes 3:6 to prove the resurrection)
--   4. exodus-3-ye-shall-serve-elohim-upon-this-mountain — Tanakh (Exodus 19, Exodus 23) [free] (★ the token: Sinai service, the appointed times)
--   5. exodus-3-i-am-that-i-am-this-is-my-name-for-ever — NT (John, Revelation) + Tanakh (Hosea, Malachi) [free] (★★ THE keystone: the Name I AM, memorial-forever, unchanging)
--   6. exodus-3-i-have-come-down-to-deliver-them — NT (Acts) + Extras (Jubilees) [extras] (★ the deliverance pattern; the not-empty spoiling kept)
--
-- Framing notes:
--   ★★ THE ANGEL IN THE BUSH = THE FORMED SON (THREAD 1): *the angel of Yahuah (LORD) appeared unto him in a flame of fire out of the midst of a bush* (3:2), yet the very One in the flame speaks as *the Elohim of Abraham, the Elohim of Isaac, and the Elohim of Jacob* (3:6) and as *Yahuah* (3:7). This is the Formed-and-Formless lens (Red Line #4) at its sharpest: the One who appears, who is called the angel (the sent one) of Yahuah, is the visible, Formed Son who bears the Name and speaks AS Elohim — and who has a Father, the Formless Most High. The same Angel-who-carries-the-Name is named in Exodus 23:20-21 (*provoke him not... for my name is in him*) and Genesis 48:16 (*The Angel which redeemed me from all evil*). Yahusha claims this very identity: *Before Abraham was, I am* (John 8:58) — the One who met the fathers. Stephen reads the bush exactly so: *the angel which appeared to him in the bush* is the One who sent Moses *to be a ruler and a deliverer* (Acts 7:35). NO Trinitarian co-equal-persons grammar; NO modalist collapse — the Formed Son who appeared in the flame is Yahuah and has a Father.
--   ★★ THE ELOHIM OF THE LIVING (THREAD 3): *I am the Elohim (God) of Abraham, the Elohim (God) of Isaac, and the Elohim (God) of Jacob* (3:6). Yahusha presses the present tense to silence the Sadducees: *I am the Elohim of Abraham... Elohim is not the Elohim of the dead, but of the living* (Matthew 22:32). The Torah itself testifies of the resurrection — the patriarchs live unto Him.
--   ★★ THE NAME I AM, MEMORIAL-FOREVER (THREAD 5): *Ehyeh asher Ehyeh (I AM THAT I AM)... this is my name for ever, and this is my memorial unto all generations* (3:14-15). The Name is given as the everlasting memorial — NOT a name to be abolished or replaced (Red Line #6). Yahusha takes the I AM upon Himself — *if ye believe not that I am he, ye shall die in your sins* (John 8:24); *Before Abraham was, I am* (John 8:58); at His arrest *I am he... they went backward, and fell to the ground* (John 18:6) — the Formed Son who bears the Name spoken in the bush. Revelation seals it: *which is, and which was, and which is to come* (Revelation 1:8). Hosea 12:5 and Malachi 3:6 hold the Name as memorial and unchanging.
--   EXTRAS: Jasher 79:3-4 carries the bush clean — *Yahuah appeared there to him in the bush... the fire had no power over the bush to consume it* — DOUBLE-WRITTEN 'jasher','jasher'. Jubilees 48 carries the deliverance and the plagues, but framed around the prince Mastema (48:2-3,9-17) and the Sinai return; the clean, framework-bearing member is Jubilees 48:19 (*we did not lead forth the children of Yashar'el from Egypt empty handed*), DOUBLE-WRITTEN 'jubilees','jubilees'. The Mastema-frame is recorded here for the lens but not threaded.
--   VERSES WITH NO ADD: v.11 (Moses' "Who am I?" demur — narrative, carried into thread prose) and v.16-20 (the commission to the elders and the plague-foretelling — the milk-and-honey land repeats v.8, held to THREAD 6; no distinct framework target warranted in this chapter).

CREATE TEMP VIEW _s305_ex03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): The angel of Yahuah in the bush bears the Name — the Formed Son
    ('canon','exodus',3,2,'canon','acts',7,30,'free',
      E'*And when forty years were expired, there appeared to him in the wilderness of mount Sina an angel of Yahuah (Lord) in a flame of fire in a bush* (Acts 7:30). Stephen reads the bush exactly as the Torah gives it — *the angel of Yahuah (LORD) appeared unto him in a flame of fire out of the midst of a bush* (Exodus 3:2): the One in the flame is the angel (the sent one) of Yahuah, the visible Formed One who appears, who would speak as Elohim Himself.'),
    ('canon','exodus',3,6,'canon','acts',7,32,'free',
      E'*Saying, I am the Elohim (God) of thy fathers, the Elohim (God) of Abraham, and the Elohim (God) of Isaac, and the Elohim (God) of Jacob. Then Moses trembled, and durst not behold* (Acts 7:32). The voice from the bush that says *I am the Elohim (God) of thy father, the Elohim (God) of Abraham, the Elohim (God) of Isaac, and the Elohim (God) of Jacob* (Exodus 3:6) is the angel of the flame — the Formed Son who bears the Name speaking AS the Elohim of the fathers, before whom Moses hid his face.'),
    ('canon','exodus',3,2,'canon','acts',7,35,'free',
      E'*This Moses whom they refused... the same did Elohim (God) send to be a ruler and a deliverer by the hand of the angel which appeared to him in the bush* (Acts 7:35). Stephen names the One of *the angel of Yahuah (LORD) appeared unto him in a flame of fire out of the midst of a bush* (Exodus 3:2) as the sender who made Moses ruler and deliverer — *the angel which appeared to him in the bush*: the Formed Son who carries the Name and commissions the deliverance.'),
    ('canon','exodus',3,6,'canon','john',8,58,'free',
      E'*Yahusha (Jesus) said unto them, Verily, verily, I say unto you, Before Abraham was, I am* (John 8:58). The One who said *I am the Elohim (God) of... Abraham, the Elohim (God) of Isaac, and the Elohim (God) of Jacob* (Exodus 3:6) is the One who met the fathers — and Yahusha claims it outright: *Before Abraham was, I am*. The Formed Son who appeared in the bush, who has a Father, is the I AM of Abraham, Isaac, and Jacob.'),
    ('canon','exodus',3,2,'canon','exodus',23,21,'free',
      E'*Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him* (Exodus 23:21). The Angel of *the angel of Yahuah (LORD) appeared unto him in a flame of fire* (Exodus 3:2) is the Angel in whom the Name dwells — *for my name is in him*. No mere created messenger carries Yahuah''s own Name and the power to pardon or not pardon; this is the Formed Son who bears the Name and speaks as Elohim.'),
    ('canon','exodus',3,2,'canon','genesis',48,16,'free',
      E'*The Angel which redeemed me from all evil, bless the lads; and let my name be named on them, and the name of my fathers Abraham and Isaac; and let them grow into a multitude in the midst of the earth* (Genesis 48:16). Jacob blesses by *The Angel which redeemed me from all evil* — the same Angel of *the angel of Yahuah (LORD)... in a flame of fire* (Exodus 3:2), set parallel to Elohim Himself (Genesis 48:15-16): the Formed One who redeems, who appeared to the fathers and now to Moses in the bush.'),
    ('canon','exodus',3,2,'jasher','jasher',79,3,'extras',
      E'*And when he came to Horeb, Yahuah (the Lord) appeared there to him in the bush, and he found the bush burning with fire, but the fire had no power over the bush to consume it* (Jasher 79:3). The restored witness keeps the sight whole — *Yahuah appeared there to him in the bush... the fire had no power over the bush to consume it* — matching *the angel of Yahuah (LORD) appeared unto him in a flame of fire out of the midst of a bush... and the bush was not consumed* (Exodus 3:2). The Formed One in the unconsuming flame.'),
    ('canon','exodus',3,4,'jasher','jasher',79,4,'extras',
      E'*And Moses was greatly astonished at this sight... and Yahuah (the Lord) called to Moses out of the fire and commanded him to go down to Egypt, to Pharaoh king of Egypt, to send the children of Israel from his service* (Jasher 79:4). The restored witness carries the call from the flame — *Yahuah called to Moses out of the fire* — as *Elohim (God) called unto him out of the midst of the bush, and said, Moses, Moses* (Exodus 3:4): the One in the fire speaks, and sends him to deliver.'),

    -- THREAD 2 (★): Put off thy shoes — the place is holy ground
    ('canon','exodus',3,5,'canon','joshua',5,15,'free',
      E'*And the captain of the LORD''S host said unto Joshua, Loose thy shoe from off thy foot; for the place whereon thou standest is holy. And Joshua did so* (Joshua 5:15). The same word that met Moses meets Joshua at Jericho — *Loose thy shoe from off thy foot; for the place whereon thou standest is holy*, echoing *put off thy shoes from off thy feet, for the place whereon thou standest is holy ground* (Exodus 3:5). The captain of Yahuah''s host is the same Formed presence as the Angel in the bush; where He stands, the ground is made holy.'),
    ('canon','exodus',3,5,'canon','acts',7,33,'free',
      E'*Then said Yahuah (Lord) to him, Put off thy shoes from thy feet: for the place where thou standest is holy ground* (Acts 7:33). Stephen quotes the bush-word entire — *Put off thy shoes from thy feet: for the place where thou standest is holy ground* — as Exodus 3:5: the presence of the Formed One in the flame is what makes that patch of Horeb holy; the shoes come off before the One who bears the Name.'),

    -- THREAD 3 (★★): The Elohim of the living, not of the dead (the resurrection from the bush)
    ('canon','exodus',3,6,'canon','matthew',22,32,'free',
      E'*I am the Elohim (God) of Abraham, and the Elohim (God) of Isaac, and the Elohim (God) of Jacob? Elohim (God) is not the Elohim (God) of the dead, but of the living* (Matthew 22:32). Yahusha takes *I am the Elohim (God) of Abraham, the Elohim (God) of Isaac, and the Elohim (God) of Jacob* (Exodus 3:6) and presses its present tense to prove the resurrection: He IS — still — their Elohim, for *Elohim is not the Elohim of the dead, but of the living*. The Torah itself testifies the patriarchs live unto Him.'),
    ('canon','exodus',3,6,'canon','mark',12,26,'free',
      E'*And as touching the dead, that they rise: have ye not read in the book of Moses, how in the bush Elohim (God) spake unto him, saying, I am the Elohim (God) of Abraham, and the Elohim (God) of Isaac, and the Elohim (God) of Jacob?* (Mark 12:26). Yahusha points to the very scene — *in the bush Elohim spake unto him* — and to the very words of *I am the Elohim (God) of thy father, the Elohim (God) of Abraham, the Elohim (God) of Isaac, and the Elohim (God) of Jacob* (Exodus 3:6) as the proof of resurrection: He is not the Elohim of the dead.'),
    ('canon','exodus',3,6,'canon','mark',12,27,'free',
      E'*He is not the Elohim (God) of the dead, but the Elohim (God) of the living: ye therefore do greatly err* (Mark 12:27). The conclusion drawn straight from *I am the Elohim (God) of Abraham, the Elohim (God) of Isaac, and the Elohim (God) of Jacob* (Exodus 3:6): because He still names Himself their Elohim, they live — *the Elohim of the living*; to deny the resurrection is to greatly err against the bush itself.'),
    ('canon','exodus',3,6,'canon','luke',20,37,'free',
      E'*Now that the dead are raised, even Moses shewed at the bush, when he calleth Yahuah (Lord) the Elohim (God) of Abraham, and the Elohim (God) of Isaac, and the Elohim (God) of Jacob* (Luke 20:37). Yahusha credits Moses himself — *even Moses shewed at the bush* — with showing the resurrection in *I am the Elohim (God) of Abraham, the Elohim (God) of Isaac, and the Elohim (God) of Jacob* (Exodus 3:6); the Torah teaches the rising of the dead.'),
    ('canon','exodus',3,6,'canon','luke',20,38,'free',
      E'*For he is not a Elohim (God) of the dead, but of the living: for all live unto him* (Luke 20:38). The bush-word of *the Elohim (God) of Abraham... Isaac... Jacob* (Exodus 3:6) means *all live unto him* — the fathers are not perished but living before Yahuah; the Name spoken in the flame holds them in life.'),

    -- THREAD 4 (★): Ye shall serve Elohim upon this mountain (the token, the appointed times)
    ('canon','exodus',3,12,'canon','exodus',19,11,'free',
      E'*And be ready against the third day: for the third day Yahuah (LORD) will come down in the sight of all the people upon mount Sinai* (Exodus 19:11). The token given at the bush — *When thou hast brought forth the people out of Egypt, ye shall serve Elohim (God) upon this mountain* (Exodus 3:12) — is made good at Sinai, the same mountain of Elohim (Horeb): brought out of Egypt, the people meet Yahuah on the mount to serve Him, exactly as the sign foretold.'),
    ('canon','exodus',3,12,'canon','exodus',23,14,'free',
      E'*Three times thou shalt keep a feast unto me in the year* (Exodus 23:14). The service promised in *ye shall serve Elohim (God) upon this mountain* (Exodus 3:12) takes shape in the appointed times Yahuah gives at that very mountain — *three times thou shalt keep a feast unto me in the year*: the deliverance is unto worship, the bringing-out is unto the feasts, the calendar of Yahuah given to the redeemed.'),

    -- THREAD 5 (★★): I AM THAT I AM — this is my name for ever (the keystone)
    ('canon','exodus',3,14,'canon','john',8,24,'free',
      E'*I said therefore unto you, that ye shall die in your sins: for if ye believe not that I am he, ye shall die in your sins* (John 8:24). Yahusha takes the Name of the bush — *Ehyeh asher Ehyeh (I AM THAT I AM)... I AM hath sent me unto you* (Exodus 3:14) — upon Himself: *if ye believe not that I am he, ye shall die in your sins*. The Formed Son speaks the I AM that was given to Moses.'),
    ('canon','exodus',3,14,'canon','john',8,28,'free',
      E'*Then said Yahusha (Jesus) unto them, When ye have lifted up the Son of Adam, then shall ye know that I am he* (John 8:28). The lifted-up Son declares the very Name of *I AM hath sent me unto you* (Exodus 3:14) — *then shall ye know that I am he*; the Formed Son bears the I AM revealed in the flame, doing nothing of Himself but as the Father taught Him.'),
    ('canon','exodus',3,14,'canon','john',8,58,'free',
      E'*Yahusha (Jesus) said unto them, Verily, verily, I say unto you, Before Abraham was, I am* (John 8:58). The Name *Ehyeh asher Ehyeh (I AM THAT I AM)* (Exodus 3:14) is taken by Yahusha as His own — *Before Abraham was, I am* — and they took up stones, for they heard Him claim the Name of the bush; the Formed One who met the fathers is the I AM.'),
    ('canon','exodus',3,14,'canon','john',18,6,'free',
      E'*As soon then as he had said unto them, I am he, they went backward, and fell to the ground* (John 18:6). At His arrest the Name spoken sends the band reeling — *I am he... they went backward, and fell to the ground* — the same power in *I AM hath sent me unto you* (Exodus 3:14): the Formed Son speaks the Name and even those who came to seize Him fall before it.'),
    ('canon','exodus',3,15,'canon','revelation',1,8,'free',
      E'*I am Alpha and Omega, the beginning and the ending, saith Yahuah (Lord), which is, and which was, and which is to come, the Almighty* (Revelation 1:8). The Name given for ever — *this is my name for ever, and this is my memorial unto all generations* (Exodus 3:15) — is the *which is, and which was, and which is to come*: the everlasting I AM, the same in the bush, in the flesh, and on the throne, never abolished, never replaced.'),
    ('canon','exodus',3,15,'canon','hosea',12,5,'free',
      E'*Even Yahuah Elohim (the LORD God) of hosts; Yahuah (LORD) is his memorial* (Hosea 12:5). The prophet holds the Name exactly as the bush gave it — *Yahuah is his memorial* — answering *this is my name for ever, and this is my memorial unto all generations* (Exodus 3:15): the Name is the standing memorial of Yahuah to every generation, not a thing to fade.'),
    ('canon','exodus',3,15,'canon','malachi',3,6,'free',
      E'*For I am Yahuah (LORD), I change not; therefore ye sons of Jacob are not consumed* (Malachi 3:6). The Name *for ever... unto all generations* (Exodus 3:15) belongs to the One who *change[s] not*; because the I AM of the bush is unchanging, the sons of Jacob are not consumed — the everlasting Name is the everlasting faithfulness.'),

    -- THREAD 6 (★): I am come down to deliver them (the deliverance pattern, the not-empty spoiling)
    ('canon','exodus',3,7,'canon','acts',7,34,'extras',
      E'*I have seen, I have seen the affliction of my people which is in Egypt, and I have heard their groaning, and am come down to deliver them. And now come, I will send thee into Egypt* (Acts 7:34). Stephen carries the bush-word entire — *I have seen, I have seen the affliction of my people... and am come down to deliver them* — as *I have surely seen the affliction of my people which are in Egypt, and have heard their cry... and am come down to deliver them* (Exodus 3:7-8): Yahuah sees, hears, and comes down to redeem His people. (Tiered extras because this thread also carries an extra-canonical member.)'),
    ('canon','exodus',3,22,'jubilees','jubilees',48,19,'extras',
      E'*And we did not lead forth the children of Yashar''el (Israel) from Egypt empty handed* (Jubilees 48:19). The restored witness confirms the promise of the bush kept — *we did not lead forth the children of Yashar''el from Egypt empty handed* — matching *ye shall not go empty... and ye shall spoil the Egyptians* (Exodus 3:21-22): the deliverance Yahuah foretold at Horeb is fulfilled to the letter, the redeemed brought out laden, not bare.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-3-the-angel-in-the-bush-bears-the-name-the-formed-son',
       E'The angel of Yahuah in the flame bears the Name — the Formed Son',
       E'*And the angel of Yahuah (LORD) appeared unto him in a flame of fire out of the midst of a bush: and he looked, and, behold, the bush burned with fire, and the bush was not consumed* (Exodus 3:2). Mark who is in the flame: He is called *the angel of Yahuah* — the sent one — yet when He speaks He says *I am the Elohim (God) of thy father, the Elohim (God) of Abraham, the Elohim (God) of Isaac, and the Elohim (God) of Jacob* (Exodus 3:6), and the chapter calls Him *Yahuah* (3:7). This is the Formed-and-the-Formless: the One who appears, who bears the Name, who speaks AS Elohim, is the Formed Son — the visible One who met the fathers and would one day take on flesh — and He has a Father, the Formless Most High. The Torah itself shows that the Angel carries the very Name: *Beware of him, and obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him* (Exodus 23:21) — no created messenger holds Yahuah''s own Name and the power to pardon. Jacob blessed by Him: *The Angel which redeemed me from all evil, bless the lads* (Genesis 48:16), set side by side with Elohim Himself. And Yahusha claims this very identity, the One who met Abraham: *Before Abraham was, I am* (John 8:58). Stephen reads the bush exactly so — *there appeared to him in the wilderness of mount Sina an angel of Yahuah (Lord) in a flame of fire in a bush* (Acts 7:30), *I am the Elohim (God) of thy fathers* (Acts 7:32) — and names Him the sender who made Moses *a ruler and a deliverer by the hand of the angel which appeared to him in the bush* (Acts 7:35). The restored witness keeps the sight whole: *Yahuah (the Lord) appeared there to him in the bush... the fire had no power over the bush to consume it... Yahuah called to Moses out of the fire* (Jasher 79:3-4). NO Trinitarian co-equal-persons grammar; NO modalist collapse — the Formed Son in the unconsuming flame is Yahuah and has a Father.',
       sv.verse_id, ev.verse_id, 'extras', 29050
  FROM _s305_ex03_lookup sv, _s305_ex03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=3 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-3-put-off-thy-shoes-the-place-is-holy-ground',
       E'Put off thy shoes — the place whereon thou standest is holy ground',
       E'*And he said, Draw not nigh hither: put off thy shoes from off thy feet, for the place whereon thou standest is holy ground* (Exodus 3:5). The desert sand at Horeb is no holier than any other — until the Formed One in the flame stands there; His presence makes the ground holy, and the shoes come off before Him. The same word meets Joshua at Jericho, before the captain of Yahuah''s host: *Loose thy shoe from off thy foot; for the place whereon thou standest is holy. And Joshua did so* (Joshua 5:15) — the same Formed presence, the same holy ground, the same command to bare the feet. Stephen quotes the bush-word entire when he tells the council of Moses: *Put off thy shoes from thy feet: for the place where thou standest is holy ground* (Acts 7:33). Where the One who bears the Name appears, the dust beneath becomes sanctuary.',
       sv.verse_id, ev.verse_id, 'free', 29053
  FROM _s305_ex03_lookup sv, _s305_ex03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=3 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=3 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-3-the-elohim-of-the-living-not-of-the-dead',
       E'The Elohim of Abraham, Isaac, and Jacob — the Elohim of the living, not of the dead',
       E'*Moreover he said, I am the Elohim (God) of thy father, the Elohim (God) of Abraham, the Elohim (God) of Isaac, and the Elohim (God) of Jacob. And Moses hid his face; for he was afraid to look upon Elohim (God)* (Exodus 3:6). Centuries after the patriarchs are buried, the voice from the bush speaks in the present tense — *I am* their Elohim. Yahusha seizes on exactly that to silence the Sadducees who denied the resurrection: *I am the Elohim (God) of Abraham, and the Elohim (God) of Isaac, and the Elohim (God) of Jacob? Elohim (God) is not the Elohim (God) of the dead, but of the living* (Matthew 22:32). He points to the very scene — *have ye not read in the book of Moses, how in the bush Elohim (God) spake unto him* (Mark 12:26) — and draws the conclusion: *He is not the Elohim (God) of the dead, but the Elohim (God) of the living: ye therefore do greatly err* (Mark 12:27). Luke records the same: *even Moses shewed at the bush, when he calleth Yahuah (Lord) the Elohim (God) of Abraham, and the Elohim (God) of Isaac, and the Elohim (God) of Jacob* (Luke 20:37), *for all live unto him* (Luke 20:38). The Torah itself, in the words of the bush, teaches the rising of the dead — the fathers are not perished but living before Yahuah, held in life by the Name spoken in the flame.',
       sv.verse_id, ev.verse_id, 'free', 29056
  FROM _s305_ex03_lookup sv, _s305_ex03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=3 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=3 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-3-ye-shall-serve-elohim-upon-this-mountain',
       E'Ye shall serve Elohim upon this mountain — the token of the appointed service',
       E'*And he said, Certainly I will be with thee; and this shall be a token unto thee, that I have sent thee: When thou hast brought forth the people out of Egypt, ye shall serve Elohim (God) upon this mountain* (Exodus 3:12). The sign that the bush-vision is true will come only after obedience — at the very mountain of Elohim, Horeb, the redeemed will serve. And so it is: *be ready against the third day: for the third day Yahuah (LORD) will come down in the sight of all the people upon mount Sinai* (Exodus 19:11) — brought out of Egypt, the people meet Yahuah on the mount, exactly as the token foretold. The deliverance is not unto wandering but unto worship: at that mountain Yahuah gives the appointed times, *Three times thou shalt keep a feast unto me in the year* (Exodus 23:14) — the bringing-out is unto the feasts, the calendar of Yahuah handed to the people He redeemed. The token of the bush opens onto the whole life of the covenant: a delivered people gathered to serve their Elohim at His mountain, in His seasons.',
       sv.verse_id, ev.verse_id, 'free', 29059
  FROM _s305_ex03_lookup sv, _s305_ex03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=3 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=3 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-3-i-am-that-i-am-this-is-my-name-for-ever',
       E'Ehyeh asher Ehyeh — I AM THAT I AM, this is my name for ever',
       E'*And Elohim (God) said unto Moses, Ehyeh asher Ehyeh (I AM THAT I AM): and he said, Thus shalt thou say unto the children of Yashar''el (Israel), I AM hath sent me unto you* (Exodus 3:14). And then the Name is sealed as the everlasting memorial: *Yahuah Elohim (The LORD God) of your fathers... hath sent me unto you: this is my name for ever, and this is my memorial unto all generations* (Exodus 3:15). The Name is given to STAND — *for ever... unto all generations* — never to be abolished or replaced. Yahusha, the Formed Son who bears it, takes the I AM upon Himself again and again: *if ye believe not that I am he, ye shall die in your sins* (John 8:24); *When ye have lifted up the Son of Adam, then shall ye know that I am he* (John 8:28); and most plainly, *Before Abraham was, I am* (John 8:58) — at which they took up stones, for they heard the Name of the bush claimed. At His arrest the spoken Name has power still: *As soon then as he had said unto them, I am he, they went backward, and fell to the ground* (John 18:6). And the risen One on the throne is the same I AM: *I am Alpha and Omega... which is, and which was, and which is to come, the Almighty* (Revelation 1:8). The prophets guard the Name as memorial and unchanging: *Yahuah (LORD) is his memorial* (Hosea 12:5); *For I am Yahuah (LORD), I change not; therefore ye sons of Jacob are not consumed* (Malachi 3:6). The Name spoken in the flame is the everlasting Name, the same in the bush, in the flesh, and on the throne.',
       sv.verse_id, ev.verse_id, 'free', 29062
  FROM _s305_ex03_lookup sv, _s305_ex03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=3 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=3 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-3-i-have-come-down-to-deliver-them',
       E'I have surely seen the affliction of my people — I am come down to deliver them',
       E'*And Yahuah (LORD) said, I have surely seen the affliction of my people which are in Egypt, and have heard their cry by reason of their taskmasters; for I know their sorrows; and I am come down to deliver them out of the hand of the Egyptians, and to bring them up out of that land unto a good land and a large, unto a land flowing with milk and honey* (Exodus 3:7-8). This is the shape of all redemption: Yahuah SEES the affliction, HEARS the cry, KNOWS the sorrows, and COMES DOWN to deliver. Stephen carries the bush-word entire: *I have seen, I have seen the affliction of my people which is in Egypt, and I have heard their groaning, and am come down to deliver them. And now come, I will send thee into Egypt* (Acts 7:34). And the deliverance is not bare-handed — Yahuah promises *when ye go, ye shall not go empty... and ye shall spoil the Egyptians* (Exodus 3:21-22), the wages of generations of bondage at last restored. The restored witness confirms it kept to the letter: *And we did not lead forth the children of Yashar''el (Israel) from Egypt empty handed* (Jubilees 48:19). The Elohim who came down in the flame is the Elohim who comes down to redeem His people and bring them out laden, into the good land.',
       sv.verse_id, ev.verse_id, 'extras', 29065
  FROM _s305_ex03_lookup sv, _s305_ex03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=3 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=3 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*there appeared to him in the wilderness of mount Sina an angel of Yahuah (Lord) in a flame of fire in a bush* (Acts 7:30) — Stephen reads the bush of 3:2: the One in the flame is the angel (sent one) of Yahuah, the Formed One who appears.'
  FROM cross_reference_threads t
  JOIN _s305_ex03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=3 AND sv.verse_number=2
  JOIN _s305_ex03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-3-the-angel-in-the-bush-bears-the-name-the-formed-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I am the Elohim (God) of thy fathers, the Elohim (God) of Abraham, and the Elohim (God) of Isaac, and the Elohim (God) of Jacob* (Acts 7:32) — the voice from the bush of 3:6: the Angel of the flame speaking AS the Elohim of the fathers.'
  FROM cross_reference_threads t
  JOIN _s305_ex03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=3 AND sv.verse_number=6
  JOIN _s305_ex03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-3-the-angel-in-the-bush-bears-the-name-the-formed-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*a ruler and a deliverer by the hand of the angel which appeared to him in the bush* (Acts 7:35) — Stephen names the One of 3:2 as the sender; the Formed Son who carries the Name commissions the deliverance.'
  FROM cross_reference_threads t
  JOIN _s305_ex03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=3 AND sv.verse_number=2
  JOIN _s305_ex03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-3-the-angel-in-the-bush-bears-the-name-the-formed-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Before Abraham was, I am* (John 8:58) — the One who said *I am the Elohim of Abraham, Isaac, and Jacob* (3:6) is the One who met the fathers; the Formed Son claims it outright.'
  FROM cross_reference_threads t
  JOIN _s305_ex03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=3 AND sv.verse_number=6
  JOIN _s305_ex03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=58
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-3-the-angel-in-the-bush-bears-the-name-the-formed-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *obey his voice, provoke him not; for he will not pardon your transgressions: for my name is in him* (Exodus 23:21) — the Angel of 3:2 carries Yahuah''s own Name; no created messenger holds the Name and the power to pardon.'
  FROM cross_reference_threads t
  JOIN _s305_ex03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=3 AND sv.verse_number=2
  JOIN _s305_ex03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-3-the-angel-in-the-bush-bears-the-name-the-formed-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*The Angel which redeemed me from all evil, bless the lads* (Genesis 48:16) — Jacob blesses by the same Angel of 3:2, set parallel to Elohim Himself; the Formed One who redeems and appeared to the fathers.'
  FROM cross_reference_threads t
  JOIN _s305_ex03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=3 AND sv.verse_number=2
  JOIN _s305_ex03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=48 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-3-the-angel-in-the-bush-bears-the-name-the-formed-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Yahuah (the Lord) appeared there to him in the bush... the fire had no power over the bush to consume it* (Jasher 79:3) — the sight of 3:2 kept whole in the restored witness; the Formed One in the unconsuming flame.'
  FROM cross_reference_threads t
  JOIN _s305_ex03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=3 AND sv.verse_number=2
  JOIN _s305_ex03_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=79 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-3-the-angel-in-the-bush-bears-the-name-the-formed-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*Yahuah (the Lord) called to Moses out of the fire and commanded him to go down to Egypt* (Jasher 79:4) — the call from the flame of 3:4: the One in the fire speaks and sends him to deliver.'
  FROM cross_reference_threads t
  JOIN _s305_ex03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=3 AND sv.verse_number=4
  JOIN _s305_ex03_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=79 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-3-the-angel-in-the-bush-bears-the-name-the-formed-son'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Loose thy shoe from off thy foot; for the place whereon thou standest is holy* (Joshua 5:15) — the captain of Yahuah''s host gives the same word as the bush (3:5); the same Formed presence makes the ground holy.'
  FROM cross_reference_threads t
  JOIN _s305_ex03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s305_ex03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=5 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-3-put-off-thy-shoes-the-place-is-holy-ground'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Put off thy shoes from thy feet: for the place where thou standest is holy ground* (Acts 7:33) — Stephen quotes 3:5 entire; the presence of the Formed One makes Horeb holy.'
  FROM cross_reference_threads t
  JOIN _s305_ex03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s305_ex03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-3-put-off-thy-shoes-the-place-is-holy-ground'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Elohim (God) is not the Elohim (God) of the dead, but of the living* (Matthew 22:32) — Yahusha presses the present tense of 3:6 to prove the resurrection: He IS still their Elohim.'
  FROM cross_reference_threads t
  JOIN _s305_ex03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=3 AND sv.verse_number=6
  JOIN _s305_ex03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=22 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-3-the-elohim-of-the-living-not-of-the-dead'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*how in the bush Elohim (God) spake unto him, saying, I am the Elohim of Abraham, Isaac, and Jacob* (Mark 12:26) — Yahusha points to the very scene of 3:6 as the proof of resurrection.'
  FROM cross_reference_threads t
  JOIN _s305_ex03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=3 AND sv.verse_number=6
  JOIN _s305_ex03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=12 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-3-the-elohim-of-the-living-not-of-the-dead'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*He is not the Elohim of the dead, but the Elohim of the living: ye therefore do greatly err* (Mark 12:27) — the conclusion from 3:6: to deny the resurrection is to err against the bush itself.'
  FROM cross_reference_threads t
  JOIN _s305_ex03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=3 AND sv.verse_number=6
  JOIN _s305_ex03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=12 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-3-the-elohim-of-the-living-not-of-the-dead'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*even Moses shewed at the bush, when he calleth Yahuah the Elohim of Abraham, Isaac, and Jacob* (Luke 20:37) — Yahusha credits Moses himself with showing the resurrection in 3:6.'
  FROM cross_reference_threads t
  JOIN _s305_ex03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=3 AND sv.verse_number=6
  JOIN _s305_ex03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=20 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-3-the-elohim-of-the-living-not-of-the-dead'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*For he is not a Elohim of the dead, but of the living: for all live unto him* (Luke 20:38) — the bush-word of 3:6 means the fathers live unto Yahuah, held in life by the Name spoken in the flame.'
  FROM cross_reference_threads t
  JOIN _s305_ex03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=3 AND sv.verse_number=6
  JOIN _s305_ex03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=20 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-3-the-elohim-of-the-living-not-of-the-dead'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the third day Yahuah (LORD) will come down in the sight of all the people upon mount Sinai* (Exodus 19:11) — the token of 3:12 made good: brought out of Egypt, the people meet Yahuah on the same mountain.'
  FROM cross_reference_threads t
  JOIN _s305_ex03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=3 AND sv.verse_number=12
  JOIN _s305_ex03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-3-ye-shall-serve-elohim-upon-this-mountain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Three times thou shalt keep a feast unto me in the year* (Exodus 23:14) — the service of 3:12 takes shape in the appointed times given at that mountain; the deliverance is unto the feasts.'
  FROM cross_reference_threads t
  JOIN _s305_ex03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=3 AND sv.verse_number=12
  JOIN _s305_ex03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-3-ye-shall-serve-elohim-upon-this-mountain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *if ye believe not that I am he, ye shall die in your sins* (John 8:24) — Yahusha takes the Name *I AM* of 3:14 upon Himself.'
  FROM cross_reference_threads t
  JOIN _s305_ex03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=3 AND sv.verse_number=14
  JOIN _s305_ex03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-3-i-am-that-i-am-this-is-my-name-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*When ye have lifted up the Son of Adam, then shall ye know that I am he* (John 8:28) — the lifted-up Son declares the Name of 3:14, doing nothing of Himself but as the Father taught Him.'
  FROM cross_reference_threads t
  JOIN _s305_ex03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=3 AND sv.verse_number=14
  JOIN _s305_ex03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-3-i-am-that-i-am-this-is-my-name-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Before Abraham was, I am* (John 8:58) — Yahusha claims the Name of 3:14 as His own; they took up stones, for they heard the Name of the bush.'
  FROM cross_reference_threads t
  JOIN _s305_ex03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=3 AND sv.verse_number=14
  JOIN _s305_ex03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=58
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-3-i-am-that-i-am-this-is-my-name-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*I am he... they went backward, and fell to the ground* (John 18:6) — the spoken Name of 3:14 has power still; even those who came to seize Him fall before it.'
  FROM cross_reference_threads t
  JOIN _s305_ex03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=3 AND sv.verse_number=14
  JOIN _s305_ex03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=18 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-3-i-am-that-i-am-this-is-my-name-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*I am Alpha and Omega... which is, and which was, and which is to come, the Almighty* (Revelation 1:8) — the Name *for ever* of 3:15 on the throne; the everlasting I AM, never abolished.'
  FROM cross_reference_threads t
  JOIN _s305_ex03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=3 AND sv.verse_number=15
  JOIN _s305_ex03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-3-i-am-that-i-am-this-is-my-name-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Yahuah (LORD) is his memorial* (Hosea 12:5) — the prophet holds the Name as the bush gave it (3:15): the standing memorial of Yahuah to every generation.'
  FROM cross_reference_threads t
  JOIN _s305_ex03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=3 AND sv.verse_number=15
  JOIN _s305_ex03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=12 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-3-i-am-that-i-am-this-is-my-name-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *For I am Yahuah (LORD), I change not; therefore ye sons of Jacob are not consumed* (Malachi 3:6) — the Name *for ever* of 3:15 belongs to the One who changes not; the everlasting Name is the everlasting faithfulness.'
  FROM cross_reference_threads t
  JOIN _s305_ex03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=3 AND sv.verse_number=15
  JOIN _s305_ex03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-3-i-am-that-i-am-this-is-my-name-for-ever'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I have seen, I have seen the affliction of my people... and am come down to deliver them* (Acts 7:34) — Stephen carries the bush-word of 3:7-8 entire: Yahuah sees, hears, and comes down to redeem.'
  FROM cross_reference_threads t
  JOIN _s305_ex03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=3 AND sv.verse_number=7
  JOIN _s305_ex03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=7 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-3-i-have-come-down-to-deliver-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*we did not lead forth the children of Yashar''el from Egypt empty handed* (Jubilees 48:19) — the not-empty promise of 3:21-22 kept to the letter in the restored witness; the redeemed brought out laden.'
  FROM cross_reference_threads t
  JOIN _s305_ex03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=3 AND sv.verse_number=22
  JOIN _s305_ex03_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=48 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-3-i-have-come-down-to-deliver-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_exodus_12.sql (Exodus 12) -----
-- Chapter: Exodus 12 — THE PASSOVER, the greatest appointed-time type in the Torah: "This month shall be unto you the beginning of months" (the moedim calendar instituted); the lamb without blemish, a male of the first year, kept up until the fourteenth and killed in the evening; the blood on the lintel and two side posts; "when I see the blood, I will pass over you"; eaten roast with fire, with unleavened bread and bitter herbs, loins girded, in haste; "this day shall be unto you for a memorial... an ordinance for ever"; the bunch of hyssop dipped in the blood, the destroyer kept from the door; the firstborn smitten at midnight; the going-out from Rameses, the mixed multitude that went up also; the ordinance of the passover — no stranger eateth, neither shall ye break a bone thereof; the stranger who is circumcised eats as one born in the land — ONE law for the homeborn and the stranger.
-- Tag: ex12   Temp view: _s305_ex12_lookup   Session prefix: s305
-- Sort band: base 29275, step 3 -> threads at 29275, 29278, 29281, 29284, 29287, 29290, 29293, 29296 (8 threads)
-- Source of EVERY row: 'canon','exodus',12,v
--
-- Exodus 12 coverage:
--   ★ v.1-2 (This month shall be unto you the beginning of months: it shall be the first month of the year to you)
--        NT:     none warranted distinct (the calendar-architecture forward-weave is the feasts themselves; the Passover-fulfilled is held to THREAD 4/5)
--        Extras: Jubilees 49:1 (celebrate it in its season on the fourteenth of the first month) — THREAD 1 (the fixed appointed season)
--        Tanakh: ★ Leviticus 23:5 (In the fourteenth day of the first month at even is the LORD'S passover) — THREAD 1 (the moedim architecture; Passover head of the feast-calendar)
--   ★★ v.3-6 (a lamb according to the house of their fathers; your lamb shall be without blemish, a male of the first year; keep it up until the fourteenth; the whole assembly shall kill it in the evening)
--        NT:     ★ 1 Peter 1:19 (the precious blood of Messiah, as of a lamb without blemish and without spot); John 1:29 (Behold the Lamb of Elohim, which taketh away the sin of the world) — THREAD 2 (THE lamb type)
--        Extras: none warranted distinct as MEMBER here (Jubilees 49 carries the timing not the blemish-clause; held to THREAD 1/4/5)
--        Tanakh: ★ Isaiah 53:7 (he is brought as a lamb to the slaughter... so he openeth not his mouth) — THREAD 2 (the suffering servant lamb)
--   ★★ v.7-13 (take of the blood, strike it on the two side posts and upper door post; when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you)
--        NT:     ★ Hebrews 11:28 (Through faith he kept the passover, and the sprinkling of blood, lest he that destroyed the firstborn should touch them); Hebrews 9:22 (without shedding of blood is no remission); 1 Peter 1:2 (sprinkling of the blood of Yahusha HaMashiach); Romans 5:9 (being now justified by his blood) — THREAD 3 (the blood that turns the destroyer)
--        Extras: Jubilees 49:3 woven in prose at THREAD 6 (the blood on the lintels = the sign); not double-counted here
--        Tanakh: none warranted distinct (the blood-token forward-weave is the NT sprinkling; the destroyer is THREAD 6)
--   ★★ v.8-11 (eat the flesh roast with fire, and unleavened bread, and with bitter herbs; loins girded, shoes on feet, staff in hand, in haste: it is the LORD'S passover)
--        NT:     ★★ 1 Corinthians 5:7 (Messiah our passover is sacrificed for us); 1 Corinthians 5:8 (let us keep the feast... with the unleavened bread of sincerity and truth) — KEYSTONE (the feast KEPT, not abolished); Luke 22:19 (Yahusha keeps the Passover: This is my body... this do in remembrance of me) — THREAD 4
--        Extras: Jubilees 49:13 (roast on the fire... they shall eat it with diligence); Jubilees 49:23 (you celebrated this festival with haste when you went forth from Egypt) — THREAD 4
--        Tanakh: ★ Deuteronomy 16:3 (seven days shalt thou eat unleavened bread therewith, even the bread of affliction; for thou camest forth out of the land of Egypt in haste) — THREAD 4
--   ★ v.14 (this day shall be unto you for a memorial; ye shall keep it a feast to Yahuah throughout your generations; an ordinance for ever)
--        NT:     Luke 22:19 (this do in remembrance of me) — THREAD 5 (the memorial kept)
--        Extras: ★ Jubilees 49:8 (it is an eternal ordinance, and engraven on the heavenly tables... ordained for ever); Jubilees 49:15 (observe the passover throughout their days... a memorial well pleasing before Yahuah) — THREAD 5
--        Tanakh: Leviticus 23:5 woven (the feast on the calendar) — held to THREAD 1; THREAD 5 anchors the everlasting-ordinance clause
--   ★★ v.21-23 (a bunch of hyssop dipped in the blood, strike the lintel and the two side posts; Yahuah will pass over the door, and will not suffer the destroyer to come in unto your houses to smite you) + v.29 (at midnight Yahuah smote all the firstborn)
--        NT:     Hebrews 11:28 (lest he that destroyed the firstborn should touch them) — THREAD 6 (echoed; primary at THREAD 3)
--        Extras: ★ Wisdom 18:13 (upon the destruction of the firstborn, they acknowledged this people to be the sons of Yahuah); Wisdom 18:14-15 (that night... your Almighty word leaped down from heaven); Wisdom 18:25 (To these the destroyer gave place); Jubilees 49:3 (the blood of a lamb... into that house they should not enter to slay); Jasher 80:41 (when I see your Passover, I will pass over you) — THREAD 6
--        Tanakh: none warranted distinct (the destroyer/firstborn night is carried by NT + extras)
--   ★★ v.46 (in one house shall it be eaten... neither shall ye break a bone thereof)
--        NT:     ★★ John 19:36 (these things were done, that the scripture should be fulfilled, A bone of him shall not be broken) — KEYSTONE FULFILLMENT — THREAD 7
--        Extras: Jubilees 49:13 (not break any bone thereof; for of the children of Yashar'el no bone shall be crushed) — THREAD 7
--        Tanakh: ★ Numbers 9:12 (nor break any bone of it: according to all the ordinances of the passover); Psalm 34:20 (He keepeth all his bones: not one of them is broken) — THREAD 7
--   ★ v.37-38 (a mixed multitude went up also with them) + v.43-49 (no stranger shall eat thereof... when a stranger shall sojourn with thee, let all his males be circumcised... he shall be as one that is born in the land... ONE law shall be to him that is homeborn, and unto the stranger)
--        NT:     none warranted distinct as MEMBER (the grafted-stranger-under-one-Torah weave is framed in the prose; closest NT is Ephesians 2, which belongs to its own pack)
--        Extras: Jasher 81:2 (a mixed multitude went up with them, and flocks and herds) — THREAD 8
--        Tanakh: none warranted distinct beyond the chapter's own one-law clause (Numbers 15:15-16 belongs to its own pack); THREAD 8 binds v.38 to v.48-49 within the chapter and frames in prose
--   v.30-36, v.39-42, v.50-51 (the great cry in Egypt; the spoiling of the Egyptians; the dough not leavened; the 430 years; the hosts of Yahuah went out; the selfsame-day going-out)
--        NT:     none warranted   Extras: Jasher 80:44-59 / 81:1-5 narrative parallels (going-out, riches), not framework-load-bearing beyond THREAD 8's mixed-multitude verse
--        Tanakh: none warranted (the going-out is narrative; the 430 years prepares Galatians 3:17, that pack's concern)
--
-- Threads (slug — target libraries):
--   1. exodus-12-this-month-the-beginning-of-months-the-appointed-times-instituted — Tanakh (Leviticus) + Extras (Jubilees) [extras] (★ the moedim calendar instituted, NOT abolished)
--   2. exodus-12-a-lamb-without-blemish-behold-the-lamb-of-elohim — NT (1 Peter, John) + Tanakh (Isaiah) [free] (★★ THE lamb type)
--   3. exodus-12-when-i-see-the-blood-i-will-pass-over-you — NT (Hebrews, 1 Peter, Romans) [free] (★★ the blood that turns the destroyer)
--   4. exodus-12-messiah-our-passover-keep-the-feast-with-unleavened-bread — NT (1 Corinthians, Luke) + Tanakh (Deuteronomy) + Extras (Jubilees) [extras] (★★ KEYSTONE: the feast KEPT, not abolished)
--   5. exodus-12-a-memorial-an-ordinance-for-ever-this-do-in-remembrance — NT (Luke) + Extras (Jubilees) [extras] (★ the everlasting ordinance, appointed-times-not-abolished)
--   6. exodus-12-the-destroyer-the-night-of-the-smitten-firstborn — NT (Hebrews) + Extras (Wisdom of Solomon, Jubilees, Jasher) [extras] (★★ the destroyer, judgment-and-deliverance)
--   7. exodus-12-not-a-bone-of-it-shall-be-broken — NT (John) + Tanakh (Numbers, Psalm) + Extras (Jubilees) [extras] (★★ KEYSTONE fulfillment)
--   8. exodus-12-a-mixed-multitude-and-one-law-for-the-stranger — Extras (Jasher) [extras] (★ two-house + the joined stranger under ONE Torah)
--
-- Framing notes:
--   ★ THE APPOINTED TIMES INSTITUTED (THREAD 1): *This month shall be unto you the beginning of months* (12:2) is the birth of the moedim calendar (Red Line #3). Woven to *In the fourteenth day of the first month at even is the LORD'S passover* (Leviticus 23:5) — Passover at the head of the feast-calendar — and to Jubilees 49:1, the fixed appointed season. This is Yahuah's calendar, NOT a defunct Jewish reckoning; the architecture the whole framework stands on.
--   ★★ THE LAMB TYPE (THREAD 2): *your lamb shall be without blemish, a male of the first year* (12:5) read forward (Red Line #5) to *a lamb without blemish and without spot* (1 Peter 1:19) and *Behold the Lamb of Elohim* (John 1:29), and laterally to the suffering servant *brought as a lamb to the slaughter* (Isaiah 53:7). THE Passover-lamb type of the Formed Son.
--   ★★ THE BLOOD THAT TURNS THE DESTROYER (THREAD 3): *when I see the blood, I will pass over you* (12:13) — Hebrews 11:28 names it *the sprinkling of blood, lest he that destroyed the firstborn should touch them*; 1 Peter 1:2 the *sprinkling of the blood*; Romans 5:9 *justified by his blood*. The token-blood is the type of the blood that delivers from wrath.
--   ★★ KEYSTONE — THE FEAST KEPT (THREAD 4): *unleavened bread... in haste: it is the LORD'S passover* (12:8-11) → *Messiah (Christ) our passover is sacrificed for us... let us keep the feast... with the unleavened bread of sincerity and truth* (1 Corinthians 5:7-8). The verse the antinomian reading mishandles: the Passover is FULFILLED and KEPT, never abolished (Red Lines #3,#6; 1 John 2:3-4 filter). Luke 22:19 — Yahusha keeps it. Deuteronomy 16:3 names the bread of affliction. Jubilees 49:13,23 keep the roasting and the haste.
--   ★ THE EVERLASTING ORDINANCE (THREAD 5): *ye shall keep it a feast by an ordinance for ever* (12:14) → Jubilees 49:8 *an eternal ordinance, and engraven on the heavenly tables... ordained for ever*; Luke 22:19 *this do in remembrance of me* — the memorial kept, not retired.
--   ★★ THE DESTROYER (THREAD 6): *Yahuah will pass over the door, and will not suffer the destroyer to come in* (12:23). Wisdom of Solomon 18 reads the firstborn-night whole: *upon the destruction of the firstborn, they acknowledged this people to be the sons of Yahuah* (18:13), *your Almighty word leaped down from heaven* (18:14-15), *To these the destroyer gave place* (18:25); Jasher 80:41 *when I see your Passover, I will pass over you*; Jubilees 49:3 the blood-sign on the lintels. Judgment on Egypt's gods, deliverance for the covenant-people — the seed-war turned to salvation.
--   ★★ KEYSTONE FULFILLMENT — NOT A BONE BROKEN (THREAD 7): *neither shall ye break a bone thereof* (12:46) → *that the scripture should be fulfilled, A bone of him shall not be broken* (John 19:36). The same ordinance is restated at Numbers 9:12 and sung at Psalm 34:20; Jubilees 49:13 keeps it (*no bone shall be crushed*). The whole Lamb, unbroken, the Passover fulfilled in the body.
--   ★ TWO-HOUSE + THE JOINED STRANGER (THREAD 8): *a mixed multitude went up also with them* (12:38) read WITH *when a stranger shall sojourn... let all his males be circumcised... he shall be as one that is born in the land... ONE law shall be to him that is homeborn, and unto the stranger* (12:48-49). The mingled who attach to Yashar'el (Israel) come IN by covenant (circumcision), not a separate people, not false-inclusion-by-confession (Red Lines #1,#2) — ONE Torah for all who join. Jasher 81:2 carries the mixed multitude. NT Ephesians-2 grafting belongs to its own pack and is framed in prose only.
--   EXTRAS: Jubilees 49 is the great Passover-ordinance chapter, clean verse-for-verse (DOUBLE-WRITTEN 'jubilees','jubilees'). Wisdom of Solomon 18 (edition 'apocrypha', book 'the-wisdom-of-solomon', NOT double-written) carries the firstborn-night and the destroyer cleanly. Jasher 80:41 / 81:2 (DOUBLE-WRITTEN 'jasher','jasher') carry the Passover-night word and the mixed multitude; note the Jasher parse reads "Israel" (not "Yashar'el") — quoted exactly as returned.
--   VERSES WITH NO ADD: v.30-36 (the great cry; the spoiling of the Egyptians), v.39-42 (the unleavened dough; the 430 years; the hosts went out), v.50-51 (the selfsame-day going-out) — narrative of the exodus night and going-out; no framework-bearing distinct target warranted in this Passover-ordinance pack (the 430 years prepares Galatians 3:17, that pack's concern).

CREATE TEMP VIEW _s305_ex12_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: This month shall be the beginning of months (the appointed times instituted)
    ('canon','exodus',12,2,'canon','leviticus',23,5,'free',
      E'*In the fourteenth day of the first month at even is the LORD''S passover* (Leviticus 23:5). The word *This month shall be unto you the beginning of months: it shall be the first month of the year to you* (Exodus 12:2) sets the head of Yahuah''s calendar, and Leviticus names the feast that opens it — *the fourteenth day of the first month... the LORD''S passover*. The appointed times are instituted here at the going-out, the architecture of the moedim, the seasons of Yahuah that are not abolished but kept throughout the generations.'),
    ('canon','exodus',12,2,'jubilees','jubilees',49,1,'extras',
      E'*Remember the commandment which Yahuah (God) commanded you concerning the passover, that you should celebrate it in its season on the fourteenth of the first month, that you should kill it before it is evening, and that they should eat it by night on the evening of the fifteenth from the time of the setting of the sun* (Jubilees 49:1). The restored witness keeps *the beginning of months... the first month of the year* (Exodus 12:2) as a fixed appointed season — *in its season on the fourteenth of the first month* — the Passover set on Yahuah''s calendar by His own commandment, to be remembered and kept.'),

    -- THREAD 2 (★★): A lamb without blemish — Behold the Lamb of Elohim
    ('canon','exodus',12,5,'canon','1-peter',1,19,'free',
      E'*But with the precious blood of Messiah (Christ), as of a lamb without blemish and without spot* (1 Peter 1:19). The command *Your lamb shall be without blemish, a male of the first year* (Exodus 12:5) is the very type Kepha (Peter) names: the redeeming blood is *as of a lamb without blemish and without spot*. The unblemished Passover lamb foreshadows the Formed Son, the spotless offering whose blood redeems — the type set down at the going-out from Egypt and filled in the Lamb slain.'),
    ('canon','exodus',12,3,'canon','john',1,29,'free',
      E'*The next day John seeth Yahusha (Jesus) coming unto him, and saith, Behold the Lamb of Elohim (God), which taketh away the sin of the world* (John 1:29). When Yashar''el (Israel) is told *they shall take to them every man a lamb, according to the house of their fathers, a lamb for an house* (Exodus 12:3), it is the shadow of the one Lamb for the whole house — *Behold the Lamb of Elohim, which taketh away the sin of the world*. The lamb of every household at the Passover is the type of the Lamb that takes away the sin of all.'),
    ('canon','exodus',12,5,'canon','isaiah',53,7,'free',
      E'*He was oppressed, and he was afflicted, yet he opened not his mouth: he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth* (Isaiah 53:7). The lamb *without blemish, a male of the first year* (Exodus 12:5) is the suffering servant of Isaiah — *brought as a lamb to the slaughter*, silent before the shearers. The spotless Passover lamb and the silent servant-lamb are one figure: the Formed Son led to the offering for the people.'),

    -- THREAD 3 (★★): When I see the blood, I will pass over you
    ('canon','exodus',12,13,'canon','hebrews',11,28,'free',
      E'*Through faith he kept the passover, and the sprinkling of blood, lest he that destroyed the firstborn should touch them* (Hebrews 11:28). The promise *when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you* (Exodus 12:13) is named as faith: Moses *kept the passover, and the sprinkling of blood, lest he that destroyed the firstborn should touch them*. The token-blood on the door is the blood of faith that turns the destroyer aside.'),
    ('canon','exodus',12,7,'canon','hebrews',9,22,'free',
      E'*And almost all things are by the law purged with blood; and without shedding of blood is no remission* (Hebrews 9:22). The command to *take of the blood, and strike it on the two side posts and on the upper door post* (Exodus 12:7) stands at the root of the whole order Hebrews names — *without shedding of blood is no remission*. The struck blood of the Passover is the first great picture: deliverance comes only through the shed blood of the offering.'),
    ('canon','exodus',12,13,'canon','1-peter',1,2,'free',
      E'*Elect according to the foreknowledge of Elohim (God) the Father, through sanctification of the Spirit, unto obedience and sprinkling of the blood of Yahusha HaMashiach (Jesus Christ): Grace unto you, and peace, be multiplied* (1 Peter 1:2). The *blood... for a token* that brings *when I see the blood, I will pass over you* (Exodus 12:13) is filled in the *sprinkling of the blood of Yahusha HaMashiach*. The chosen people of the going-out are kept by the sprinkled blood; so the elect are sanctified unto obedience by the blood of the Lamb.'),
    ('canon','exodus',12,13,'canon','romans',5,9,'free',
      E'*Much more then, being now justified by his blood, we shall be saved from wrath through him* (Romans 5:9). The word *the plague shall not be upon you to destroy you* (Exodus 12:13) — the blood that saves from the smiting — is the shadow of *being now justified by his blood, we shall be saved from wrath through him*. As the Passover blood turned the destroyer from the door, so the blood of the Formed Son saves from the wrath to come.'),

    -- THREAD 4 (★★ KEYSTONE): Messiah our passover — keep the feast with the unleavened bread
    ('canon','exodus',12,8,'canon','1-corinthians',5,7,'free',
      E'*Purge out therefore the old leaven, that ye may be a new lump, as ye are unleavened. For even Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7). The command to eat *unleavened bread* with the lamb (Exodus 12:8) is read by Sha''ul (Paul) as fulfilled and kept: *Messiah our passover is sacrificed for us* — the Lamb is slain, and the leaven is still to be purged out. The Passover is not abolished; it is filled by the true Lamb and lived out in the unleavened walk.'),
    ('canon','exodus',12,11,'canon','1-corinthians',5,8,'free',
      E'*Therefore let us keep the feast, not with old leaven, neither with the leaven of malice and wickedness; but with the unleavened bread of sincerity and truth* (1 Corinthians 5:8). Against every reading that retires the feast, Sha''ul (Paul) says plainly *let us keep the feast* — answering the ordinance *it is the LORD''S passover* (Exodus 12:11). The Passover-and-Unleavened-Bread is FULFILLED in Messiah and KEPT in sincerity and truth; the leaven put out of the houses (12:15) is the leaven of malice put out of the heart.'),
    ('canon','exodus',12,11,'canon','luke',22,19,'free',
      E'*And he took bread, and gave thanks, and brake it, and gave unto them, saying, This is my body which is given for you: this do in remembrance of me* (Luke 22:19). At the very Passover *it is the LORD''S passover* (Exodus 12:11), Yahusha (Jesus) keeps the feast and fills it — *This is my body which is given for you*. The Master does not abolish the appointed night; He sits down to it and shows Himself the Lamb whose body is given, the Passover kept *in remembrance*.'),
    ('canon','exodus',12,8,'canon','deuteronomy',16,3,'free',
      E'*Thou shalt eat no leavened bread with it; seven days shalt thou eat unleavened bread therewith, even the bread of affliction; for thou camest forth out of the land of Egypt in haste: that thou mayest remember the day when thou camest forth out of the land of Egypt all the days of thy life* (Deuteronomy 16:3). The *unleavened bread* and the *haste* of Exodus 12:8,11 are named again as *the bread of affliction* eaten because *thou camest forth out of the land of Egypt in haste* — the Torah binds the unleavened bread to the memory of the going-out, the feast kept all the days of one''s life.'),
    ('canon','exodus',12,8,'jubilees','jubilees',49,13,'extras',
      E'*And they shall not cook it with water, nor shall they eat it raw, but roast on the fire: they shall eat it with diligence, its head with the inwards thereof and its feet they shall roast with fire, and not break any bone thereof; for of the children of Yashar''el (Israel) no bone shall be crushed* (Jubilees 49:13). The restored witness keeps the eating-ordinance whole — *roast on the fire... they shall eat it with diligence* — matching *roast with fire... his head with his legs, and with the purtenance thereof* (Exodus 12:8-9). The manner of the feast is kept exactly: roasted, eaten in earnest, the lamb whole.'),
    ('canon','exodus',12,11,'jubilees','jubilees',49,23,'extras',
      E'*For you celebrated this festival with haste when you went forth from Egypt till you entered into the wilderness of Shur; for on the shore of the sea you completed it* (Jubilees 49:23). The restored witness keeps the *haste* of *ye shall eat it in haste: it is the LORD''S passover* (Exodus 12:11) — *you celebrated this festival with haste when you went forth from Egypt*. The girded, hurried eating of the first Passover is remembered as the festival kept at the going-out.'),

    -- THREAD 5: A memorial, an ordinance for ever — this do in remembrance
    ('canon','exodus',12,14,'canon','luke',22,19,'free',
      E'*And he took bread, and gave thanks, and brake it, and gave unto them, saying, This is my body which is given for you: this do in remembrance of me* (Luke 22:19). The ordinance *this day shall be unto you for a memorial; and ye shall keep it a feast to Yahuah (LORD) throughout your generations* (Exodus 12:14) is kept, not retired, when Yahusha (Jesus) says *this do in remembrance of me*. The everlasting memorial of the deliverance is filled by the Lamb whose body is given; the feast is kept in remembrance still.'),
    ('canon','exodus',12,14,'jubilees','jubilees',49,8,'extras',
      E'*For it is an eternal ordinance, and engraven on the heavenly tables regarding all the children of Yashar''el (Israel) that they should observe it every year on its day once a year, throughout all their generations; and there is no limit of days, for this is ordained for ever* (Jubilees 49:8). The restored witness keeps the *ordinance for ever* of *ye shall keep it a feast by an ordinance for ever* (Exodus 12:14) — *an eternal ordinance, and engraven on the heavenly tables... ordained for ever*. The Passover is no temporary statute but an everlasting appointed time written in heaven.'),
    ('canon','exodus',12,14,'jubilees','jubilees',49,15,'extras',
      E'*And do you command the children of Yashar''el (Israel) to observe the passover throughout their days, every year, once a year on the day of its fixed time, and it will come for a memorial well pleasing before Yahuah (God)* (Jubilees 49:15). The restored witness echoes *this day shall be unto you for a memorial* (Exodus 12:14) — *it will come for a memorial well pleasing before Yahuah*. The feast kept on its fixed time year by year is the memorial Yahuah Himself receives, the appointed remembrance of the going-out.'),

    -- THREAD 6 (★★): The destroyer — the night of the smitten firstborn
    ('canon','exodus',12,23,'canon','hebrews',11,28,'free',
      E'*Through faith he kept the passover, and the sprinkling of blood, lest he that destroyed the firstborn should touch them* (Hebrews 11:28). The promise *Yahuah (LORD) will pass over the door, and will not suffer the destroyer to come in unto your houses to smite you* (Exodus 12:23) is named exactly: the sprinkling was kept *lest he that destroyed the firstborn should touch them*. The blood on the lintel is what stays the destroyer''s hand; faith in the blood is the dividing line between the smitten and the spared.'),
    ('canon','exodus',12,29,'apocrypha','the-wisdom-of-solomon',18,13,'extras',
      E'*For whereas they would not believe any thing by reason of the enchantments; upon the destruction of the firstborn, they acknowledged this people to be the sons of Yahuah (God)* (Wisdom of Solomon 18:13). When *at midnight Yahuah (LORD) smote all the firstborn in the land of Egypt* (Exodus 12:29), the very judgment confessed the covenant: *upon the destruction of the firstborn, they acknowledged this people to be the sons of Yahuah*. The smiting that fell on Egypt''s firstborn marked out Yahuah''s firstborn-son people, delivered while the oppressor was judged.'),
    ('canon','exodus',12,29,'apocrypha','the-wisdom-of-solomon',18,15,'extras',
      E'*Your Almighty word leaped down from heaven out of your royal throne, as a fierce man of war into the midst of a land of destruction* (Wisdom of Solomon 18:15). The midnight smiting — *at midnight Yahuah (LORD) smote all the firstborn* (Exodus 12:29) — is sung as *your Almighty word leaped down from heaven* into the land of destruction. The Formed Word of Yahuah is the one who goes through Egypt that night; the judgment is borne by Him who bears the Name.'),
    ('canon','exodus',12,23,'apocrypha','the-wisdom-of-solomon',18,25,'extras',
      E'*To these the destroyer gave place, and was afraid of them: for it was enough that they only tasted of the wrath* (Wisdom of Solomon 18:25). The word *will not suffer the destroyer to come in unto your houses* (Exodus 12:23) is answered: *To these the destroyer gave place, and was afraid of them*. The destroyer yields where the covenant-sign and the oaths to the fathers stand; the wrath is turned aside from the blood-marked house.'),
    ('canon','exodus',12,23,'jubilees','jubilees',49,3,'extras',
      E'*And this is the sign which Yahuah (God) gave them: Into every house on the lintels of which they saw the blood of a lamb of the first year, into (that) house they should not enter to slay, but should pass by (it), that all those should be saved that were in the house because the sign of the blood was on its lintels* (Jubilees 49:3). The restored witness keeps the deliverance of *when he seeth the blood upon the lintel... Yahuah (LORD) will pass over the door* (Exodus 12:23) — *the sign of the blood was on its lintels*, and into that house the destroying powers *should not enter to slay*. The blood-sign saves all who are within.'),
    ('canon','exodus',12,23,'jasher','jasher',80,41,'extras',
      E'*And the days of darkness passed away, and Yahuah (the Lord) sent Moses and Aaron to the children of Israel, saying, Celebrate your feast and make your Passover, for behold I come in the midst of the night amongst all the Egyptians, and I will smite all their first born, from the first born of a man to the first born of a beast, and when I see your Passover, I will pass over you* (Jasher 80:41). The extended witness keeps the promise of *Yahuah (LORD) will pass over the door* (Exodus 12:23) in Yahuah''s own voice — *when I see your Passover, I will pass over you* — the smiting of the firstborn and the passing-over of the covenant-houses in one night.'),

    -- THREAD 7 (★★ KEYSTONE): Not a bone of it shall be broken
    ('canon','exodus',12,46,'canon','john',19,36,'free',
      E'*For these things were done, that the scripture should be fulfilled, A bone of him shall not be broken* (John 19:36). The Passover ordinance *neither shall ye break a bone thereof* (Exodus 12:46) is named outright as fulfilled at the cross — *that the scripture should be fulfilled, A bone of him shall not be broken*. The whole, unbroken Passover lamb is the type of the Formed Son: His legs not broken, the Passover kept to the letter in His body.'),
    ('canon','exodus',12,46,'canon','numbers',9,12,'free',
      E'*They shall leave none of it unto the morning, nor break any bone of it: according to all the ordinances of the passover they shall keep it* (Numbers 9:12). The command *neither shall ye break a bone thereof* (Exodus 12:46) is restated in the wilderness Passover — *nor break any bone of it: according to all the ordinances of the passover*. The unbroken lamb is bound into the standing ordinance, kept in every generation, the figure waiting for its fulfillment.'),
    ('canon','exodus',12,46,'canon','psalms',34,20,'free',
      E'*He keepeth all his bones: not one of them is broken* (Psalm 34:20). The Passover statute *neither shall ye break a bone thereof* (Exodus 12:46) is sung of the righteous one — *He keepeth all his bones: not one of them is broken*. The whole, unbroken lamb and the kept-bones of the righteous meet in the Formed Son, of whom John says the scripture was fulfilled.'),
    ('canon','exodus',12,46,'jubilees','jubilees',49,13,'extras',
      E'*And they shall not cook it with water, nor shall they eat it raw, but roast on the fire... and not break any bone thereof; for of the children of Yashar''el (Israel) no bone shall be crushed* (Jubilees 49:13). The restored witness keeps the unbroken-lamb ordinance of *neither shall ye break a bone thereof* (Exodus 12:46) — *not break any bone thereof; for of the children of Yashar''el no bone shall be crushed*. The whole lamb is kept entire, the statute carried in the covenant memory.'),

    -- THREAD 8: A mixed multitude — and one law for the homeborn and the stranger
    ('canon','exodus',12,38,'jasher','jasher',81,2,'extras',
      E'*Also a mixed multitude went up with them, and flocks and herds, even much cattle* (Jasher 81:2). The extended witness keeps the going-out of *a mixed multitude went up also with them; and flocks, and herds, even very much cattle* (Exodus 12:38) — *a mixed multitude went up with them, and flocks and herds*. The mingled who attached themselves to Yashar''el (Israel) came out with the covenant-people, the joined ones brought near at the going-out.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex12_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex12_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-12-this-month-the-beginning-of-months-the-appointed-times-instituted',
       E'This month shall be the beginning of months — the appointed times instituted',
       E'The Passover opens not only the night of deliverance but the whole calendar of Yahuah: *And Yahuah (LORD) spake unto Moses and Aaron in the land of Egypt, saying, This month shall be unto you the beginning of months: it shall be the first month of the year to you* (Exodus 12:1-2). The going-out resets the reckoning of time; the moedim — the appointed times — are born here. Leviticus sets the Passover at the head of the feast-calendar: *In the fourteenth day of the first month at even is the LORD''S passover* (Leviticus 23:5), the first of *the feasts of Yahuah (LORD), even holy convocations, which ye shall proclaim in their seasons*. And the restored witness keeps it a fixed appointed season: *Remember the commandment which Yahuah (God) commanded you concerning the passover, that you should celebrate it in its season on the fourteenth of the first month* (Jubilees 49:1). This is the architecture the whole framework stands upon — Yahuah''s own calendar, His seasons and His feasts, instituted at the redemption from Egypt and kept throughout the generations. Not a defunct reckoning, not abolished: the beginning of months by which His people number their days.',
       sv.verse_id, ev.verse_id, 'extras', 29275
  FROM _s305_ex12_lookup sv, _s305_ex12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=12 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-12-a-lamb-without-blemish-behold-the-lamb-of-elohim',
       E'A lamb without blemish, a male of the first year — Behold the Lamb of Elohim',
       E'The heart of the Passover is the lamb, and every detail is the type: *they shall take to them every man a lamb, according to the house of their fathers, a lamb for an house* (Exodus 12:3) — one lamb for the whole household; *Your lamb shall be without blemish, a male of the first year* (Exodus 12:5) — spotless, in the prime of its strength; *ye shall keep it up until the fourteenth day... and the whole assembly of the congregation of Yashar''el (Israel) shall kill it in the evening* (Exodus 12:6). When the Baptizer sees Yahusha (Jesus) he names the fulfillment: *Behold the Lamb of Elohim (God), which taketh away the sin of the world* (John 1:29) — the one Lamb for the whole house of Yashar''el and beyond. Kepha (Peter) names the unblemished clause exactly: the redeeming blood is *as of a lamb without blemish and without spot* (1 Peter 1:19). And the prophet sees the lamb led silent to the offering: *he is brought as a lamb to the slaughter, and as a sheep before her shearers is dumb, so he openeth not his mouth* (Isaiah 53:7). The spotless Passover lamb, the silent servant-lamb, the Lamb of Elohim that takes away sin — one figure, the Formed Son foreshadowed at the going-out and slain in the fulness of time.',
       sv.verse_id, ev.verse_id, 'free', 29278
  FROM _s305_ex12_lookup sv, _s305_ex12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=12 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-12-when-i-see-the-blood-i-will-pass-over-you',
       E'When I see the blood, I will pass over you — the blood that turns the destroyer',
       E'The lamb is slain that its blood may stand between the people and the smiting: *And they shall take of the blood, and strike it on the two side posts and on the upper door post of the houses, wherein they shall eat it* (Exodus 12:7). And the great promise: *the blood shall be to you for a token upon the houses where ye are: and when I see the blood, I will pass over you, and the plague shall not be upon you to destroy you, when I smite the land of Egypt* (Exodus 12:13). The blood is the dividing line. Hebrews names the faith in it: *Through faith he kept the passover, and the sprinkling of blood, lest he that destroyed the firstborn should touch them* (Hebrews 11:28), and sets it in the whole order — *without shedding of blood is no remission* (Hebrews 9:22). Kepha (Peter) fills the token-blood with the blood of the Lamb: the elect are sanctified *unto obedience and sprinkling of the blood of Yahusha HaMashiach (Jesus Christ)* (1 Peter 1:2). And Sha''ul (Paul) carries it to the wrath to come: *being now justified by his blood, we shall be saved from wrath through him* (Romans 5:9). As the struck blood on the lintel turned the destroyer from the door, so the shed blood of the Formed Son turns away the wrath; the token-blood of the Passover is the shadow of the blood that saves.',
       sv.verse_id, ev.verse_id, 'free', 29281
  FROM _s305_ex12_lookup sv, _s305_ex12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=12 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★ KEYSTONE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-12-messiah-our-passover-keep-the-feast-with-unleavened-bread',
       E'Messiah our passover — keep the feast with the unleavened bread of sincerity and truth',
       E'The lamb is eaten in the manner Yahuah commands: *they shall eat the flesh in that night, roast with fire, and unleavened bread; and with bitter herbs they shall eat it* (Exodus 12:8); *with your loins girded, your shoes on your feet, and your staff in your hand; and ye shall eat it in haste: it is the LORD''S passover* (Exodus 12:11). The Torah binds the unleavened bread to the going-out: *seven days shalt thou eat unleavened bread therewith, even the bread of affliction; for thou camest forth out of the land of Egypt in haste* (Deuteronomy 16:3). Now hear the verse the antichrist reading mishandles — for Sha''ul (Paul) does not retire this feast, he fulfills it and keeps it: *Purge out therefore the old leaven, that ye may be a new lump, as ye are unleavened. For even Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7), *therefore let us keep the feast, not with old leaven, neither with the leaven of malice and wickedness; but with the unleavened bread of sincerity and truth* (1 Corinthians 5:8). The Lamb is slain — *Messiah our passover is sacrificed* — and the command stands: *let us keep the feast*. The leaven put out of the houses (12:15) is the leaven of malice put out of the heart. At the very Passover, Yahusha (Jesus) sits down and fills it: *This is my body which is given for you: this do in remembrance of me* (Luke 22:19). The restored witness keeps the manner — *roast on the fire: they shall eat it with diligence* (Jubilees 49:13) — and the haste: *you celebrated this festival with haste when you went forth from Egypt* (Jubilees 49:23). The Passover is not abolished; it is the appointed time fulfilled in the Lamb and kept in sincerity and truth.',
       sv.verse_id, ev.verse_id, 'extras', 29284
  FROM _s305_ex12_lookup sv, _s305_ex12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=12 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-12-a-memorial-an-ordinance-for-ever-this-do-in-remembrance',
       E'A memorial, an ordinance for ever — this do in remembrance of me',
       E'The Passover is given not for one night only but for all the generations: *And this day shall be unto you for a memorial; and ye shall keep it a feast to Yahuah (LORD) throughout your generations; ye shall keep it a feast by an ordinance for ever* (Exodus 12:14). An ordinance for ever — the words leave no room for retiring it. The restored witness presses the same: *For it is an eternal ordinance, and engraven on the heavenly tables regarding all the children of Yashar''el (Israel)... and there is no limit of days, for this is ordained for ever* (Jubilees 49:8); *it will come for a memorial well pleasing before Yahuah (God)* (Jubilees 49:15). And when Yahusha (Jesus) keeps the feast, He does not end the memorial but fills it: *This is my body which is given for you: this do in remembrance of me* (Luke 22:19). The everlasting memorial of the deliverance from Egypt is kept in remembrance still — the appointed feast filled by the Lamb whose body is given, the ordinance for ever carried forward, never abolished.',
       sv.verse_id, ev.verse_id, 'extras', 29287
  FROM _s305_ex12_lookup sv, _s305_ex12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=12 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-12-the-destroyer-the-night-of-the-smitten-firstborn',
       E'The destroyer — the night of the smitten firstborn',
       E'Moses gives the elders the rite of the blood: *ye shall take a bunch of hyssop, and dip it in the blood that is in the bason, and strike the lintel and the two side posts with the blood* (Exodus 12:22), with the promise that follows: *For Yahuah (LORD) will pass through to smite the Egyptians; and when he seeth the blood upon the lintel, and on the two side posts, Yahuah (LORD) will pass over the door, and will not suffer the destroyer to come in unto your houses to smite you* (Exodus 12:23). Then the judgment falls: *at midnight Yahuah (LORD) smote all the firstborn in the land of Egypt* (Exodus 12:29). Hebrews names the faith that kept the people: *the sprinkling of blood, lest he that destroyed the firstborn should touch them* (Hebrews 11:28). The Wisdom of Solomon sings the night whole — *upon the destruction of the firstborn, they acknowledged this people to be the sons of Yahuah (God)* (Wisdom of Solomon 18:13); *Your Almighty word leaped down from heaven out of your royal throne, as a fierce man of war into the midst of a land of destruction* (Wisdom of Solomon 18:15) — the Formed Word of Yahuah going through Egypt; *To these the destroyer gave place, and was afraid of them* (Wisdom of Solomon 18:25), the wrath turned aside where the covenant and the oaths to the fathers stand. The restored witnesses keep the sign and the voice: *the sign of the blood was on its lintels... into (that) house they should not enter to slay* (Jubilees 49:3); *when I see your Passover, I will pass over you* (Jasher 80:41). Judgment on Egypt and its gods, deliverance for the blood-marked house — the seed-war turned to salvation in a single night.',
       sv.verse_id, ev.verse_id, 'extras', 29290
  FROM _s305_ex12_lookup sv, _s305_ex12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=12 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- THREAD 7 (★★ KEYSTONE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-12-not-a-bone-of-it-shall-be-broken',
       E'Not a bone of it shall be broken — the whole lamb, the Passover fulfilled',
       E'Among the ordinances of the Passover stands a command that reaches all the way to the cross: *In one house shall it be eaten; thou shalt not carry forth ought of the flesh abroad out of the house; neither shall ye break a bone thereof* (Exodus 12:46). The lamb is kept whole, unbroken. The wilderness Passover restates it: *They shall leave none of it unto the morning, nor break any bone of it: according to all the ordinances of the passover they shall keep it* (Numbers 9:12); and the psalmist sings it of the righteous one: *He keepeth all his bones: not one of them is broken* (Psalm 34:20). The restored witness keeps the statute: *not break any bone thereof; for of the children of Yashar''el (Israel) no bone shall be crushed* (Jubilees 49:13). And the Besorah (Gospel) names the fulfillment at the place of the skull, where the soldiers broke the legs of the others but not His: *For these things were done, that the scripture should be fulfilled, A bone of him shall not be broken* (John 19:36). The whole, unbroken Passover lamb is the type of the Formed Son — His body kept entire, the Passover ordinance fulfilled to the letter in the Lamb of Elohim.',
       sv.verse_id, ev.verse_id, 'extras', 29293
  FROM _s305_ex12_lookup sv, _s305_ex12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=46
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=12 AND ev.verse_number=46
ON CONFLICT (slug) DO NOTHING;

-- THREAD 8
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-12-a-mixed-multitude-and-one-law-for-the-stranger',
       E'A mixed multitude — and one law for the homeborn and the stranger',
       E'Out of Egypt came not only the tribes but those who joined themselves to them: *And a mixed multitude went up also with them; and flocks, and herds, even very much cattle* (Exodus 12:38). The extended witness keeps it: *Also a mixed multitude went up with them, and flocks and herds, even much cattle* (Jasher 81:2). But the Passover ordinance sets the terms by which the joined ones come in — not by mere presence, and not by a separate people: *There shall no stranger eat thereof* (Exodus 12:43), yet *when a stranger shall sojourn with thee, and will keep the passover to Yahuah (LORD), let all his males be circumcised, and then let him come near and keep it; and he shall be as one that is born in the land: for no uncircumcised person shall eat thereof* (Exodus 12:48). The mingled who attach to Yashar''el (Israel) are brought in by covenant — circumcised, joined to the people — and then they eat *as one that is born in the land*. And the seal: *One law shall be to him that is homeborn, and unto the stranger that sojourneth among you* (Exodus 12:49). Not two peoples, not a false inclusion by word alone, but ONE Torah for all who join — the stranger grafted into the covenant-people under the same instruction, the gathering of the mingled who come near by the blood of the Lamb and the covenant of Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 29296
  FROM _s305_ex12_lookup sv, _s305_ex12_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=38
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=12 AND ev.verse_number=49
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*In the fourteenth day of the first month at even is the LORD''S passover* (Leviticus 23:5) — the Passover at the head of Yahuah''s feast-calendar; *this month... the beginning of months* (12:2) sets the moedim architecture.'
  FROM cross_reference_threads t
  JOIN _s305_ex12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=2
  JOIN _s305_ex12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-12-this-month-the-beginning-of-months-the-appointed-times-instituted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*celebrate it in its season on the fourteenth of the first month* (Jubilees 49:1) — the restored witness keeps *the beginning of months* (12:2) as a fixed appointed season set by Yahuah''s commandment.'
  FROM cross_reference_threads t
  JOIN _s305_ex12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=2
  JOIN _s305_ex12_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=49 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-12-this-month-the-beginning-of-months-the-appointed-times-instituted'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Behold the Lamb of Elohim (God), which taketh away the sin of the world* (John 1:29) — *a lamb for an house* (12:3) foreshadows the one Lamb for the whole house, who takes away the sin of all.'
  FROM cross_reference_threads t
  JOIN _s305_ex12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=3
  JOIN _s305_ex12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-12-a-lamb-without-blemish-behold-the-lamb-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the precious blood of Messiah (Christ), as of a lamb without blemish and without spot* (1 Peter 1:19) — the *without blemish* clause of 12:5 named exactly; the spotless lamb is the type of the spotless Son.'
  FROM cross_reference_threads t
  JOIN _s305_ex12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=5
  JOIN _s305_ex12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-12-a-lamb-without-blemish-behold-the-lamb-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*he is brought as a lamb to the slaughter... so he openeth not his mouth* (Isaiah 53:7) — the lamb *without blemish* (12:5) is the silent suffering servant led to the offering.'
  FROM cross_reference_threads t
  JOIN _s305_ex12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=5
  JOIN _s305_ex12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=53 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-12-a-lamb-without-blemish-behold-the-lamb-of-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Through faith he kept the passover, and the sprinkling of blood, lest he that destroyed the firstborn should touch them* (Hebrews 11:28) — *when I see the blood, I will pass over you* (12:13): the blood of faith turns the destroyer aside.'
  FROM cross_reference_threads t
  JOIN _s305_ex12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=13
  JOIN _s305_ex12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-12-when-i-see-the-blood-i-will-pass-over-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*without shedding of blood is no remission* (Hebrews 9:22) — the struck blood of 12:7 stands at the root of the whole order: deliverance comes through shed blood.'
  FROM cross_reference_threads t
  JOIN _s305_ex12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=7
  JOIN _s305_ex12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-12-when-i-see-the-blood-i-will-pass-over-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*sprinkling of the blood of Yahusha HaMashiach (Jesus Christ)* (1 Peter 1:2) — the *blood... for a token* of 12:13 is filled in the sprinkled blood of the Lamb that keeps the elect.'
  FROM cross_reference_threads t
  JOIN _s305_ex12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=13
  JOIN _s305_ex12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-12-when-i-see-the-blood-i-will-pass-over-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*being now justified by his blood, we shall be saved from wrath through him* (Romans 5:9) — *the plague shall not be upon you to destroy you* (12:13): the blood that saves from wrath.'
  FROM cross_reference_threads t
  JOIN _s305_ex12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=13
  JOIN _s305_ex12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-12-when-i-see-the-blood-i-will-pass-over-you'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★ KEYSTONE)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7) — the unleavened-bread Passover of 12:8 fulfilled in the Lamb slain; purge out the old leaven.'
  FROM cross_reference_threads t
  JOIN _s305_ex12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=8
  JOIN _s305_ex12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=5 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-12-messiah-our-passover-keep-the-feast-with-unleavened-bread'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *let us keep the feast... with the unleavened bread of sincerity and truth* (1 Corinthians 5:8) — against the antinomian reading: *it is the LORD''S passover* (12:11) is KEPT, not abolished.'
  FROM cross_reference_threads t
  JOIN _s305_ex12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=11
  JOIN _s305_ex12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=5 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-12-messiah-our-passover-keep-the-feast-with-unleavened-bread'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*This is my body which is given for you: this do in remembrance of me* (Luke 22:19) — at *the LORD''S passover* (12:11) Yahusha keeps the feast and fills it; the Master does not abolish the night.'
  FROM cross_reference_threads t
  JOIN _s305_ex12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=11
  JOIN _s305_ex12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=22 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-12-messiah-our-passover-keep-the-feast-with-unleavened-bread'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*seven days shalt thou eat unleavened bread... even the bread of affliction; for thou camest forth out of the land of Egypt in haste* (Deuteronomy 16:3) — the unleavened bread and haste of 12:8,11 bound to the memory of the going-out.'
  FROM cross_reference_threads t
  JOIN _s305_ex12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=8
  JOIN _s305_ex12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=16 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-12-messiah-our-passover-keep-the-feast-with-unleavened-bread'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*roast on the fire: they shall eat it with diligence* (Jubilees 49:13) — the restored witness keeps the manner of eating of 12:8-9: roasted, eaten in earnest, the lamb whole.'
  FROM cross_reference_threads t
  JOIN _s305_ex12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=8
  JOIN _s305_ex12_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=49 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-12-messiah-our-passover-keep-the-feast-with-unleavened-bread'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*you celebrated this festival with haste when you went forth from Egypt* (Jubilees 49:23) — the girded, hurried eating of *in haste: it is the LORD''S passover* (12:11) remembered.'
  FROM cross_reference_threads t
  JOIN _s305_ex12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=11
  JOIN _s305_ex12_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=49 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-12-messiah-our-passover-keep-the-feast-with-unleavened-bread'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*This is my body which is given for you: this do in remembrance of me* (Luke 22:19) — the memorial of 12:14 kept, not retired; the feast filled by the Lamb and kept in remembrance.'
  FROM cross_reference_threads t
  JOIN _s305_ex12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=14
  JOIN _s305_ex12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=22 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-12-a-memorial-an-ordinance-for-ever-this-do-in-remembrance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *an eternal ordinance, and engraven on the heavenly tables... ordained for ever* (Jubilees 49:8) — *an ordinance for ever* (12:14): no temporary statute, an everlasting appointed time written in heaven.'
  FROM cross_reference_threads t
  JOIN _s305_ex12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=14
  JOIN _s305_ex12_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=49 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-12-a-memorial-an-ordinance-for-ever-this-do-in-remembrance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*it will come for a memorial well pleasing before Yahuah (God)* (Jubilees 49:15) — the *memorial* of 12:14 received by Yahuah Himself, the appointed remembrance of the going-out.'
  FROM cross_reference_threads t
  JOIN _s305_ex12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=14
  JOIN _s305_ex12_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=49 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-12-a-memorial-an-ordinance-for-ever-this-do-in-remembrance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the sprinkling of blood, lest he that destroyed the firstborn should touch them* (Hebrews 11:28) — *will not suffer the destroyer to come in unto your houses* (12:23): the blood stays the destroyer''s hand.'
  FROM cross_reference_threads t
  JOIN _s305_ex12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=23
  JOIN _s305_ex12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-12-the-destroyer-the-night-of-the-smitten-firstborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*upon the destruction of the firstborn, they acknowledged this people to be the sons of Yahuah (God)* (Wisdom of Solomon 18:13) — the midnight smiting of 12:29 marked out Yahuah''s firstborn-son people.'
  FROM cross_reference_threads t
  JOIN _s305_ex12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=29
  JOIN _s305_ex12_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=18 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-12-the-destroyer-the-night-of-the-smitten-firstborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Your Almighty word leaped down from heaven... as a fierce man of war* (Wisdom of Solomon 18:15) — the midnight smiting of 12:29: the Formed Word of Yahuah goes through Egypt that night.'
  FROM cross_reference_threads t
  JOIN _s305_ex12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=29
  JOIN _s305_ex12_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=18 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-12-the-destroyer-the-night-of-the-smitten-firstborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*To these the destroyer gave place, and was afraid of them* (Wisdom of Solomon 18:25) — *will not suffer the destroyer to come in* (12:23): the destroyer yields where the covenant and the oaths to the fathers stand.'
  FROM cross_reference_threads t
  JOIN _s305_ex12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=23
  JOIN _s305_ex12_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=18 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-12-the-destroyer-the-night-of-the-smitten-firstborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the sign of the blood was on its lintels... into (that) house they should not enter to slay* (Jubilees 49:3) — the deliverance of *when he seeth the blood... Yahuah will pass over the door* (12:23) kept whole.'
  FROM cross_reference_threads t
  JOIN _s305_ex12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=23
  JOIN _s305_ex12_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=49 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-12-the-destroyer-the-night-of-the-smitten-firstborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*when I see your Passover, I will pass over you* (Jasher 80:41) — the promise of *Yahuah (LORD) will pass over the door* (12:23) in Yahuah''s own voice: the smiting and the passing-over in one night.'
  FROM cross_reference_threads t
  JOIN _s305_ex12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=23
  JOIN _s305_ex12_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=80 AND tv.verse_number=41
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-12-the-destroyer-the-night-of-the-smitten-firstborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 7 members (★★ KEYSTONE)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *that the scripture should be fulfilled, A bone of him shall not be broken* (John 19:36) — *neither shall ye break a bone thereof* (12:46) fulfilled at the cross; the whole, unbroken Lamb.'
  FROM cross_reference_threads t
  JOIN _s305_ex12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=46
  JOIN _s305_ex12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=19 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-12-not-a-bone-of-it-shall-be-broken'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*nor break any bone of it: according to all the ordinances of the passover* (Numbers 9:12) — the unbroken-lamb command of 12:46 restated as standing ordinance in the wilderness Passover.'
  FROM cross_reference_threads t
  JOIN _s305_ex12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=46
  JOIN _s305_ex12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=9 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-12-not-a-bone-of-it-shall-be-broken'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*He keepeth all his bones: not one of them is broken* (Psalm 34:20) — the unbroken-lamb statute of 12:46 sung of the righteous one, met in the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s305_ex12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=46
  JOIN _s305_ex12_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-12-not-a-bone-of-it-shall-be-broken'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*not break any bone thereof; for of the children of Yashar''el (Israel) no bone shall be crushed* (Jubilees 49:13) — the unbroken-lamb ordinance of 12:46 kept in the covenant memory.'
  FROM cross_reference_threads t
  JOIN _s305_ex12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=46
  JOIN _s305_ex12_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=49 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-12-not-a-bone-of-it-shall-be-broken'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 8 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Also a mixed multitude went up with them, and flocks and herds, even much cattle* (Jasher 81:2) — the going-out of *a mixed multitude went up also with them* (12:38); the joined ones brought out with the covenant-people, who come in by ONE Torah (12:48-49).'
  FROM cross_reference_threads t
  JOIN _s305_ex12_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=12 AND sv.verse_number=38
  JOIN _s305_ex12_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=81 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-12-a-mixed-multitude-and-one-law-for-the-stranger'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_exodus_14.sql (Exodus 14) -----
-- Chapter: Exodus 14 — THE RED SEA: the great deliverance, the baptism type, the seed-war victory. Pharaoh pursues with six hundred chosen chariots; Yashar'el cries out in terror, pinned between Migdol and the sea; Moses answers "stand still, and see the salvation of Yahuah... Yahuah shall fight for you, and ye shall hold your peace"; the Angel of Elohim and the pillar of cloud remove and stand behind the camp; Moses stretches out his hand, the sea goes back by a strong east wind, the waters are a wall on the right hand and the left, Yashar'el passes through on dry ground; the Egyptians pursue into the midst, the sea returns to his strength, "there remained not so much as one of them"; "Thus Yahuah saved Yashar'el that day... and the people feared Yahuah, and believed Yahuah, and his servant Moses."
-- Tag: ex14   Temp view: _s305_ex14_lookup
-- Sort band: base 29325, step 3 -> threads at 29325, 29328, 29331, 29334, 29337 (5 threads)
-- Source of EVERY row: 'canon','exodus',14,v
--
-- Exodus 14 coverage:
--   ★ v.13-14 (stand still, and see the salvation of Yahuah... Yahuah shall fight for you, and ye shall hold your peace)
--        NT:     none warranted distinct (the salvation-is-Yahuah's-doing forward-weave is held by the cloud/baptism type at THREAD 2/3; no closer NT lateral than the deliverance-faith of Hebrews 11:29 at THREAD 5)
--        Extras: Jasher 81:28,32 (Fear not, stand still and see the salvation of Yahuah... Yahuah will fight for you, and you shall remain silent) — THREAD 1 (the words carried verse-for-verse)
--        Tanakh: ★ 2 Chronicles 20:17 (Ye shall not need to fight in this battle: set yourselves, stand ye still, and see the salvation of Yahuah) — SAME words at Jehoshaphat's deliverance; Isaiah 63:9 (the angel of his presence saved them) — THREAD 1 (the salvation is Yahuah's own, wrought by the Angel/Presence)
--   ★★ v.19-20 (the angel of Elohim, which went before the camp of Yashar'el, removed and went behind them; and the pillar of the cloud... it gave light by night to these)
--        NT:     1 Corinthians 10:1-2 (all our fathers were under the cloud... baptized unto Moses in the cloud and in the sea) — THREAD 2 (the cloud that led them; Red Line #4 the Formed Presence)
--        Extras: Jubilees 48:12 (And I stood between the Egyptians and Yashar'el, and we delivered Yashar'el out of his hand... and Yahuah brought them through the midst of the sea as if it were dry land) — THREAD 2 (the divine Presence standing between the camps)
--        Tanakh: ★ Isaiah 63:9 (the angel of his presence saved them: in his love and in his pity he redeemed them) — THREAD 2 (the Angel of the Presence = the Formed Son leading Yashar'el); Psalm 78:14 (in the daytime also he led them with a cloud, and all the night with a light of fire) — THREAD 2
--   ★★★ v.21-22 (the waters were divided; the children of Yashar'el went into the midst of the sea upon the dry ground: and the waters were a wall unto them on their right hand, and on their left)
--        NT:     ★★ 1 Corinthians 10:1-2 (all passed through the sea; and were all baptized unto Moses in the cloud and in the sea) — THE keystone baptism type — THREAD 3; Hebrews 11:29 (By faith they passed through the Red sea as by dry land) — THREAD 3
--        Extras: Wisdom 19:7-8 (where water stood before, dry land appeared; and out of the Red sea a way without impediment... Wherethrough all the people went that were defended with your hand); Jasher 81:38 (the waters of the sea were divided into twelve parts, and the children of Israel passed through on foot... as a man would pass through a prepared road) — THREAD 3
--        Tanakh: ★ Isaiah 63:11-13 (Where is he that brought them up out of the sea... dividing the water before them... that led them through the deep); Psalm 78:13 (He divided the sea, and caused them to pass through; and he made the waters to stand as an heap); Psalm 114:3 (The sea saw it, and fled) — THREAD 3
--   ★★ v.27-28 (the sea returned to his strength... the waters returned, and covered the chariots, and the horsemen, and all the host of Pharaoh... there remained not so much as one of them)
--        NT:     Hebrews 11:29 (which the Egyptians assaying to do were drowned) — THREAD 4; ★ Revelation 15:3 (they sing the song of Moses the servant of Elohim, and the song of the Lamb... just and true are thy ways) — THREAD 4 (the song of the Red-Sea victory sung at the last)
--        Extras: Jubilees 48:14 (Yahuah our Elohim cast them into the midst of the sea, into the depths of the abyss); Wisdom 10:19 (she drowned their enemies, and cast them up out of the bottom of the deep) — THREAD 4
--        Tanakh: ★ Psalm 106:11 (And the waters covered their enemies: there was not one of them left) — THREAD 4 (the judgment on the oppressor; the seed-war)
--   ★ v.30-31 (Thus Yahuah saved Yashar'el that day... and the people feared Yahuah, and believed Yahuah, and his servant Moses)
--        NT:     Hebrews 11:29 (By faith they passed through the Red sea) — THREAD 5 (the faith of the redeemed)
--        Extras: Jasher 81:42 (all the children of Israel saw that the Egyptians had perished, and they beheld the great hand of Yahuah) — THREAD 5
--        Tanakh: ★ Psalm 106:12 (Then believed they his words; they sang his praise) — THREAD 5 (the believing that followed the seeing)
--   v.1-12 (the encampment at Pi-hahiroth; Pharaoh's hardened heart and six hundred chariots; the people's terror and murmuring) — narrative set-up; the framework weight rests on the deliverance verses 13-31; v.4,8,17 (I will harden Pharaoh's heart / I will be honoured) carried in the prose of THREAD 1/4 but not bound as distinct members. NO ADD.
--
-- Threads (slug — target libraries):
--   1. exodus-14-stand-still-and-see-the-salvation-of-yahuah — Tanakh (2 Chronicles, Isaiah) + Extras (Jasher) [extras] (★ the salvation is Yahuah's doing, not the people's)
--   2. exodus-14-the-angel-and-the-pillar-the-formed-led-them — NT (1 Corinthians) + Tanakh (Isaiah, Psalm) + Extras (Jubilees) [extras] (★★ the Angel of the Presence = the Formed Son; the cloud)
--   3. exodus-14-through-the-midst-of-the-sea-the-baptism — NT (1 Corinthians, Hebrews) + Tanakh (Isaiah, Psalm 78, Psalm 114) + Extras (Wisdom, Jasher) [extras] (★★★ THE keystone baptism type)
--   4. exodus-14-the-sea-returned-the-egyptians-drowned — NT (Hebrews, Revelation) + Tanakh (Psalm 106) + Extras (Jubilees, Wisdom) [extras] (★★ the judgment on the oppressor; the song of Moses)
--   5. exodus-14-they-feared-and-believed-yahuah — NT (Hebrews) + Tanakh (Psalm 106) + Extras (Jasher) [extras] (★ the faith of the redeemed)
--
-- Framing notes:
--   ★ STAND STILL, SEE THE SALVATION (THREAD 1): *Fear ye not, stand still, and see the salvation of Yahuah (LORD)... Yahuah (LORD) shall fight for you, and ye shall hold your peace* (14:13-14). The deliverance is Yahuah's doing, not Yashar'el's — they have only to be still. The very words return at Jehoshaphat's deliverance: *stand ye still, and see the salvation of Yahuah (LORD) with you... for Yahuah (LORD) will be with you* (2 Chronicles 20:17). Isaiah names WHO does the saving: *the angel of his presence saved them* (Isaiah 63:9) — the Angel/Presence who bears the Name, the Formed (Red Line #4). Jasher carries the words verse-for-verse.
--   ★★ THE ANGEL AND THE PILLAR — THE FORMED LED THEM (THREAD 2): *the angel of Elohim (God), which went before the camp of Yashar'el (Israel), removed and went behind them; and the pillar of the cloud went from before their face, and stood behind them* (14:19). The Angel of Elohim and the pillar are ONE Presence — the Formed Son leading the camp (Red Line #4). Isaiah 63:9 names him *the angel of his presence*; Sha'ul reads the cloud as the thing they were baptized under — *all our fathers were under the cloud... baptized unto Moses in the cloud* (1 Cor 10:1-2). Jubilees 48:12: *I stood between the Egyptians and Yashar'el* — the divine Presence between the camps. NOT a created angel, NOT a Trinitarian co-equal person: the visible Glory who led them is the One who took flesh.
--   ★★★ THROUGH THE MIDST OF THE SEA — THE BAPTISM (THREAD 3): *the children of Yashar'el (Israel) went into the midst of the sea upon the dry ground: and the waters were a wall unto them on their right hand, and on their left* (14:22). This is THE keystone baptism type: *all passed through the sea; and were all baptized unto Moses in the cloud and in the sea* (1 Cor 10:1-2) — the passage through the water is the figure of baptism, the whole nation brought through. *By faith they passed through the Red sea as by dry land* (Hebrews 11:29). Isaiah 63, Psalm 78, Psalm 114 sing the dividing; Wisdom and Jasher keep the dry road through the deep. The crossing is the birth of the redeemed people through the water.
--   ★★ THE SEA RETURNED — THE EGYPTIANS DROWNED (THREAD 4): *the waters returned, and covered the chariots, and the horsemen, and all the host of Pharaoh... there remained not so much as one of them* (14:28). The judgment on the oppressor — the seed-war victory, the enemy of Yahuah's people destroyed in the very water through which the redeemed passed safe. *By faith they passed through the Red sea as by dry land: which the Egyptians assaying to do were drowned* (Hebrews 11:29). Psalm 106:11 (*there was not one of them left*), Jubilees 48:14, Wisdom 10:19 keep the drowning. And the song of this victory is sung at the very end: *they sing the song of Moses the servant of Elohim (God), and the song of the Lamb* (Revelation 15:3) — the Red-Sea deliverance and the last great deliverance one song. (Rev 15:2 reads the redeemed standing on a *sea of glass* — the Red-Sea figure carried to the consummation.)
--   ★ THEY FEARED AND BELIEVED (THREAD 5): *the people feared Yahuah (LORD), and believed Yahuah (LORD), and his servant Moses* (14:31). The seeing of the great work bred the faith — the same trust Hebrews names as the means of the crossing (*By faith they passed* — Hebrews 11:29), and the believing Psalm 106 records: *Then believed they his words; they sang his praise* (Psalm 106:12). Jasher: *they beheld the great hand of Yahuah*. The redeemed people is born in faith at the sea. NOTE: Psalm 106 frames the same generation's later faithlessness (106:13, *They soon forgat his works*) — the believing here is real but not yet the Torah-on-the-heart that endures; the framework holds the deliverance-faith without flattening it into the wilderness rebellion.
--   EXTRAS: Jasher 81 carries the Exodus crossing at length (clean parse): the four divisions of the people and Moses' word *stand still and see the salvation of Yahuah* / *Yahuah will fight for you* (81:28,32), the sea divided into twelve parts and crossed as a prepared road (81:38), the Egyptians sunk and the great hand of Yahuah beheld (81:40,42). Jasher DOUBLE-WRITTEN 'jasher','jasher'. (Jasher 81:40-41's Pharaoh-spared-and-reigned-over-Nineveh tradition is a narrative coda, NOT bound as a member.) Jubilees 48 frames the crossing with prince Mastema bound at the sea (48:15,17) — recorded for the lens; the clean deliverance verses (48:12,14) are the members, not the Mastema material. Jubilees DOUBLE-WRITTEN 'jubilees','jubilees'. Wisdom of Solomon 10:18-19 and 19:7-8 (single-edition apocrypha) keep the dry road and the drowning.
--   VERSES WITH NO ADD: v.1-12 (the encampment at Pi-hahiroth, Pharaoh's hardened heart, the six hundred chariots, the people's terror and murmuring) — narrative set-up; the framework-bearing weaves rest on the deliverance verses 13-31. The hardening (v.4,8,17, *I will be honoured upon Pharaoh*) is carried in the prose but not forced as a distinct member here.

CREATE TEMP VIEW _s305_ex14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Stand still, and see the salvation of Yahuah (the salvation is Yahuah's doing)
    ('canon','exodus',14,13,'canon','2-chronicles',20,17,'free',
      E'*Ye shall not need to fight in this battle: set yourselves, stand ye still, and see the salvation of Yahuah (LORD) with you, O Yahudah (Judah) and Jerusalem: fear not, nor be dismayed; to morrow go out against them: for Yahuah (LORD) will be with you* (2 Chronicles 20:17). At the sea Moses says the very thing — *stand still, and see the salvation of Yahuah (LORD), which he will shew to you to day* (Exodus 14:13). Generations later, hemmed in by a great multitude, Yahudah (Judah) hears the same word: the battle is His, the deliverance His to work; their part is to stand still and watch Him save. The salvation is Yahuah''s doing, never the people''s strength.'),
    ('canon','exodus',14,14,'canon','isaiah',63,9,'free',
      E'*In all their affliction he was afflicted, and the angel of his presence saved them: in his love and in his pity he redeemed them; and he bare them, and carried them all the days of old* (Isaiah 63:9). When Moses says *Yahuah (LORD) shall fight for you, and ye shall hold your peace* (Exodus 14:14), Isaiah names who does the fighting and the saving: *the angel of his presence saved them*. The Angel of the Presence who bears the Name — the Formed Son — is the One who wrought the salvation at the sea; the deliverance was His own to give, in His love and His pity.'),
    ('canon','exodus',14,13,'jasher','jasher',81,28,'extras',
      E'*And Moses said to them, Fear not, stand still and see the salvation of Yahuah (the Lord) which He will effect this day for you* (Jasher 81:28). The extended witness carries the word entire — *Fear not, stand still and see the salvation of Yahuah* — the same charge as *Fear ye not, stand still, and see the salvation of Yahuah (LORD)* (Exodus 14:13): the people pinned against the sea are bid to be still and let Yahuah save.'),
    ('canon','exodus',14,14,'jasher','jasher',81,32,'extras',
      E'*And Moses said to them, Stand in your places, for Yahuah (the Lord) will fight for you, and you shall remain silent* (Jasher 81:32). The extended witness keeps *Yahuah will fight for you... you shall remain silent* — word-for-word with *Yahuah (LORD) shall fight for you, and ye shall hold your peace* (Exodus 14:14). The battle belongs to Yahuah; the redeemed are to hold their peace while He works the deliverance.'),

    -- THREAD 2 (★★): The angel and the pillar — the Formed led them
    ('canon','exodus',14,19,'canon','1-corinthians',10,1,'free',
      E'*Moreover, brethren, I would not that ye should be ignorant, how that all our fathers were under the cloud, and all passed through the sea* (1 Corinthians 10:1). The pillar that *went before the camp of Yashar''el (Israel)* and *stood behind them* (Exodus 14:19) is the cloud Sha''ul (Paul) names: *all our fathers were under the cloud*. The whole nation walked beneath the Presence that led and shielded them — the cloud was not weather but the visible Glory, the One who went before His people.'),
    ('canon','exodus',14,19,'canon','isaiah',63,9,'free',
      E'*In all their affliction he was afflicted, and the angel of his presence saved them: in his love and in his pity he redeemed them* (Isaiah 63:9). The *angel of Elohim (God), which went before the camp of Yashar''el (Israel)* (Exodus 14:19) is *the angel of his presence* — the Angel who bears the Name, the Formed Son leading the camp. Read through the Formed-and-the-Formless: the visible Glory in the pillar is not a created messenger nor a co-equal second person, but the One drawn from the Most High who appeared and led Yashar''el, and who would take flesh.'),
    ('canon','exodus',14,19,'canon','psalms',78,14,'free',
      E'*In the daytime also he led them with a cloud, and all the night with a light of fire* (Psalm 78:14). The psalmist sings what Exodus records — *the pillar of the cloud went from before their face, and stood behind them... it was a cloud and darkness to them, but it gave light by night to these* (Exodus 14:19-20): a cloud by day, fire by night. The same Presence that led the camp shielded it, darkness to the enemy and light to the redeemed.'),
    ('canon','exodus',14,19,'jubilees','jubilees',48,12,'extras',
      E'*And I stood between the Egyptians and Yashar''el (Israel), and we delivered Yashar''el (Israel) out of his hand, and out of the hand of his people, and Yahuah (God) brought them through the midst of the sea as if it were dry land* (Jubilees 48:12). The restored witness keeps the Presence standing between the camps — *I stood between the Egyptians and Yashar''el* — the same office as the angel and the pillar that *came between the camp of the Egyptians and the camp of Yashar''el (Israel)* (Exodus 14:19-20). The divine Presence is the wall that holds the enemy back and brings the people through.'),

    -- THREAD 3 (★★★): Through the midst of the sea — the baptism
    ('canon','exodus',14,22,'canon','1-corinthians',10,2,'free',
      E'*And were all baptized unto Moses in the cloud and in the sea* (1 Corinthians 10:2). The crossing — *the children of Yashar''el (Israel) went into the midst of the sea upon the dry ground: and the waters were a wall unto them on their right hand, and on their left* (Exodus 14:22) — is the keystone baptism type: *baptized unto Moses in the cloud and in the sea*. The whole nation brought through the water is the figure of baptism; the people is born by passing through the deep under the Presence.'),
    ('canon','exodus',14,22,'canon','hebrews',11,29,'free',
      E'*By faith they passed through the Red sea as by dry land: which the Egyptians assaying to do were drowned* (Hebrews 11:29). The way through the parted waters — *went into the midst of the sea upon the dry ground* (Exodus 14:22) — was a way of faith: *By faith they passed through the Red sea as by dry land*. The same path that bore the believing through bore the pursuers down; the dry road was given to trust, not to force.'),
    ('canon','exodus',14,21,'canon','isaiah',63,12,'free',
      E'*That led them by the right hand of Moses with his glorious arm, dividing the water before them, to make himself an everlasting name?* (Isaiah 63:12). When *Yahuah (LORD) caused the sea to go back by a strong east wind... and the waters were divided* (Exodus 14:21), it was His glorious arm at work — *dividing the water before them, to make himself an everlasting name*. The deliverance at the sea is remembered as Yahuah''s own act, the name made everlasting in the parting.'),
    ('canon','exodus',14,21,'canon','psalms',78,13,'free',
      E'*He divided the sea, and caused them to pass through; and he made the waters to stand as an heap* (Psalm 78:13). The psalmist sings the dividing of Exodus 14:21 — *He divided the sea, and caused them to pass through; and he made the waters to stand as an heap* — the same wall of water that *were a wall unto them on their right hand, and on their left* (Exodus 14:22). Yahuah stood the sea up like a heap that His people might walk through dry.'),
    ('canon','exodus',14,22,'canon','psalms',114,3,'free',
      E'*The sea saw it, and fled: Jordan was driven back* (Psalm 114:3). The crossing where *the children of Yashar''el (Israel) went into the midst of the sea upon the dry ground* (Exodus 14:22) is sung as the sea''s own flight before its Maker: *The sea saw it, and fled*. The waters that should have drowned the people drew back at the presence of the Elohim (God) of Jacob, and the dry road opened.'),
    ('canon','exodus',14,22,'apocrypha','the-wisdom-of-solomon',19,7,'extras',
      E'*As namely, a cloud shadowing the camp; and where water stood before, dry land appeared; and out of the Red sea a way without impediment; and out of the violent stream a green field* (Wisdom of Solomon 19:7). The restored wisdom-witness keeps the wonder — *where water stood before, dry land appeared; and out of the Red sea a way without impediment* — the same dry road of *upon the dry ground... the waters were a wall* (Exodus 14:22). The sea became a highway for the people defended by Yahuah''s hand.'),
    ('canon','exodus',14,22,'jasher','jasher',81,38,'extras',
      E'*And the waters of the sea were divided into twelve parts, and the children of Israel passed through on foot, with shoes, as a man would pass through a prepared road* (Jasher 81:38). The extended witness sees the crossing as a made way — *as a man would pass through a prepared road* — the *dry ground* of Exodus 14:22 opened for the twelve tribes, each its own path through the deep.'),

    -- THREAD 4 (★★): The sea returned — the Egyptians drowned (the judgment on the oppressor)
    ('canon','exodus',14,28,'canon','hebrews',11,29,'free',
      E'*By faith they passed through the Red sea as by dry land: which the Egyptians assaying to do were drowned* (Hebrews 11:29). The return of the sea — *the waters returned, and covered the chariots, and the horsemen, and all the host of Pharaoh... there remained not so much as one of them* (Exodus 14:28) — is named: *which the Egyptians assaying to do were drowned*. The same water that was a wall to the redeemed was a grave to the oppressor; the seed-war ends with the enemy of Yahuah''s people swallowed in the deep.'),
    ('canon','exodus',14,28,'canon','psalms',106,11,'free',
      E'*And the waters covered their enemies: there was not one of them left* (Psalm 106:11). The psalmist keeps the judgment whole — *the waters covered their enemies: there was not one of them left* — matching *the waters returned, and covered the chariots, and the horsemen... there remained not so much as one of them* (Exodus 14:28). The oppressor of the redeemed is utterly undone; not one of Pharaoh''s host survives the sea that bore Yashar''el through.'),
    ('canon','exodus',14,27,'canon','revelation',15,3,'free',
      E'*And they sing the song of Moses the servant of Elohim (God), and the song of the Lamb, saying, Great and marvellous are thy works, Yahuah Elohim (Lord God) Almighty; just and true are thy ways, thou King of saints* (Revelation 15:3). When *Yahuah (LORD) overthrew the Egyptians in the midst of the sea* (Exodus 14:27), the victory broke into the song of Moses at the sea''s edge — and that song is sung again at the last great deliverance: *the song of Moses the servant of Elohim, and the song of the Lamb*. The redeemed standing on the sea of glass sing the Red-Sea triumph carried to its consummation.'),
    ('canon','exodus',14,28,'jubilees','jubilees',48,14,'extras',
      E'*And all the peoples whom he brought to pursue after Yashar''el (Israel), Yahuah our Elohim (the LORD our God) cast them into the midst of the sea, into the depths of the abyss beneath the children of Yashar''el (Israel)* (Jubilees 48:14). The restored witness keeps the drowning — *cast them into the midst of the sea, into the depths of the abyss* — the same overthrow as *the waters returned, and covered the chariots... there remained not so much as one of them* (Exodus 14:28). The pursuers go down into the deep beneath the very people they hunted.'),
    ('canon','exodus',14,28,'apocrypha','the-wisdom-of-solomon',10,19,'extras',
      E'*But she drowned their enemies, and cast them up out of the bottom of the deep* (Wisdom of Solomon 10:19). The restored wisdom-witness keeps the judgment — *she drowned their enemies, and cast them up out of the bottom of the deep* — the same end as *the waters returned, and covered the chariots, and the horsemen... there remained not so much as one of them* (Exodus 14:28). The sea that opened a road to the redeemed closed as a grave on the oppressor.'),

    -- THREAD 5 (★): They feared and believed Yahuah (the faith of the redeemed)
    ('canon','exodus',14,31,'canon','hebrews',11,29,'free',
      E'*By faith they passed through the Red sea as by dry land: which the Egyptians assaying to do were drowned* (Hebrews 11:29). The deliverance bred faith — *the people feared Yahuah (LORD), and believed Yahuah (LORD), and his servant Moses* (Exodus 14:31) — and Hebrews names the crossing itself as the act of that faith: *By faith they passed through the Red sea*. The seeing of the great work and the believing are one; the redeemed people is born trusting the One who saved it.'),
    ('canon','exodus',14,31,'canon','psalms',106,12,'free',
      E'*Then believed they his words; they sang his praise* (Psalm 106:12). The psalmist records the same hour as Exodus 14:31 — *the people feared Yahuah (LORD), and believed Yahuah (LORD)* — *Then believed they his words; they sang his praise*. The great work seen at the sea drew faith and song out of the redeemed; the believing answered the saving.'),
    ('canon','exodus',14,30,'jasher','jasher',81,42,'extras',
      E'*And on that day Yahuah (the Lord) saved Israel from the hand of Egypt, and all the children of Israel saw that the Egyptians had perished, and they beheld the great hand of Yahuah (the Lord), in what he had performed in Egypt and in the sea* (Jasher 81:42). The extended witness keeps the saving and the seeing — *Yahuah saved Israel from the hand of Egypt... they beheld the great hand of Yahuah* — matching *Thus Yahuah (LORD) saved Yashar''el (Israel) that day... and Yashar''el (Israel) saw that great work which Yahuah (LORD) did* (Exodus 14:30-31). The beholding of the great hand is the ground of the faith that followed.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-14-stand-still-and-see-the-salvation-of-yahuah',
       E'Stand still, and see the salvation of Yahuah — the deliverance is His to work',
       E'Pharaoh''s six hundred chosen chariots bear down, the sea is in front and the desert behind, and the people cry out in terror — *wherefore hast thou dealt thus with us, to carry us forth out of Egypt?* (Exodus 14:11). Moses'' answer is the heart of the chapter: *Fear ye not, stand still, and see the salvation of Yahuah (LORD), which he will shew to you to day: for the Egyptians whom ye have seen to day, ye shall see them again no more for ever* (Exodus 14:13), *Yahuah (LORD) shall fight for you, and ye shall hold your peace* (Exodus 14:14). The deliverance is Yahuah''s doing, not the people''s strength; their whole part is to be still and watch Him save. The same word returns at Jehoshaphat''s deliverance generations later: *Ye shall not need to fight in this battle: set yourselves, stand ye still, and see the salvation of Yahuah (LORD) with you... for Yahuah (LORD) will be with you* (2 Chronicles 20:17) — the battle is His. And Isaiah names WHO works the salvation: *the angel of his presence saved them: in his love and in his pity he redeemed them* (Isaiah 63:9) — the Angel of the Presence who bears the Name, the Formed Son, is the One who fought at the sea. The extended witness keeps Moses'' charge entire: *Fear not, stand still and see the salvation of Yahuah (the Lord) which He will effect this day for you* (Jasher 81:28), *Yahuah (the Lord) will fight for you, and you shall remain silent* (Jasher 81:32). The redeemed do not win their freedom; they receive it from the hand that fights for them.',
       sv.verse_id, ev.verse_id, 'extras', 29325
  FROM _s305_ex14_lookup sv, _s305_ex14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=14 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=14 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-14-the-angel-and-the-pillar-the-formed-led-them',
       E'The angel and the pillar — the Formed led them through the sea',
       E'*And the angel of Elohim (God), which went before the camp of Yashar''el (Israel), removed and went behind them; and the pillar of the cloud went from before their face, and stood behind them: And it came between the camp of the Egyptians and the camp of Yashar''el (Israel); and it was a cloud and darkness to them, but it gave light by night to these* (Exodus 14:19-20). The Angel of Elohim and the pillar are not two things but one Presence — and the framework reads that Presence as the Formed Son (Red Line #4), the One who bears the Name and appeared and led Yashar''el through the Tanakh. Isaiah names him outright: *the angel of his presence saved them: in his love and in his pity he redeemed them* (Isaiah 63:9). He is no created messenger and no co-equal second person — He is the visible Glory drawn from the formless Most High, who would one day take flesh. Sha''ul (Paul) reads the cloud as the thing the whole nation was brought under: *all our fathers were under the cloud, and all passed through the sea* (1 Corinthians 10:1). The psalmist sings the double office of the pillar: *In the daytime also he led them with a cloud, and all the night with a light of fire* (Psalm 78:14) — darkness to the enemy, light to the redeemed, exactly as Exodus tells it. And the restored witness puts the Presence between the camps in the first person: *And I stood between the Egyptians and Yashar''el (Israel), and we delivered Yashar''el (Israel) out of his hand... and Yahuah (God) brought them through the midst of the sea as if it were dry land* (Jubilees 48:12). The wall that held the enemy back and brought the people through was the Formed Himself.',
       sv.verse_id, ev.verse_id, 'extras', 29328
  FROM _s305_ex14_lookup sv, _s305_ex14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=14 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=14 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-14-through-the-midst-of-the-sea-the-baptism',
       E'Through the midst of the sea on dry ground — the baptism of the redeemed',
       E'*And Moses stretched out his hand over the sea; and Yahuah (LORD) caused the sea to go back by a strong east wind all that night, and made the sea dry land, and the waters were divided. And the children of Yashar''el (Israel) went into the midst of the sea upon the dry ground: and the waters were a wall unto them on their right hand, and on their left* (Exodus 14:21-22). This is the keystone baptism type of the whole Torah. Sha''ul (Paul) reads it plainly: *all our fathers were under the cloud, and all passed through the sea; and were all baptized unto Moses in the cloud and in the sea* (1 Corinthians 10:1-2) — the passage through the water is the figure of baptism, the whole nation born by being brought through the deep under the Presence. And the crossing was an act of faith: *By faith they passed through the Red sea as by dry land: which the Egyptians assaying to do were drowned* (Hebrews 11:29). The prophets and the psalms sing the dividing as Yahuah''s own glorious arm: *dividing the water before them, to make himself an everlasting name... That led them through the deep, as an horse in the wilderness* (Isaiah 63:12-13); *He divided the sea, and caused them to pass through; and he made the waters to stand as an heap* (Psalm 78:13); *The sea saw it, and fled* (Psalm 114:3). The restored witnesses keep the dry road through the deep: *where water stood before, dry land appeared; and out of the Red sea a way without impediment* (Wisdom of Solomon 19:7), and *the waters of the sea were divided into twelve parts, and the children of Israel passed through on foot... as a man would pass through a prepared road* (Jasher 81:38). The people walks down into the water and comes up the other side a redeemed nation — the great figure of baptism, the death of the old bondage and the birth of the covenant people.',
       sv.verse_id, ev.verse_id, 'extras', 29331
  FROM _s305_ex14_lookup sv, _s305_ex14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=14 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=14 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-14-the-sea-returned-the-egyptians-drowned',
       E'The sea returned — the Egyptians drowned, not one remained (the song of Moses)',
       E'*And Moses stretched forth his hand over the sea, and the sea returned to his strength when the morning appeared; and the Egyptians fled against it; and Yahuah (LORD) overthrew the Egyptians in the midst of the sea. And the waters returned, and covered the chariots, and the horsemen, and all the host of Pharaoh that came into the sea after them; there remained not so much as one of them* (Exodus 14:27-28). The same water that was a wall to the redeemed is a grave to the oppressor — the seed-war victory, the enemy of Yahuah''s people swallowed whole. Hebrews names it: *By faith they passed through the Red sea as by dry land: which the Egyptians assaying to do were drowned* (Hebrews 11:29). The psalmist keeps the judgment entire: *And the waters covered their enemies: there was not one of them left* (Psalm 106:11). The restored witnesses see the pursuers go down into the abyss: *Yahuah our Elohim (the LORD our God) cast them into the midst of the sea, into the depths of the abyss beneath the children of Yashar''el (Israel)* (Jubilees 48:14); *she drowned their enemies, and cast them up out of the bottom of the deep* (Wisdom of Solomon 10:19). And the victory at the sea breaks into a song that is sung again at the very end of all things: *they sing the song of Moses the servant of Elohim (God), and the song of the Lamb, saying, Great and marvellous are thy works, Yahuah Elohim (Lord God) Almighty; just and true are thy ways* (Revelation 15:3) — the redeemed standing on a sea of glass mingled with fire (Revelation 15:2) sing the Red-Sea triumph carried to its consummation. The deliverance at the sea and the last great deliverance are one song.',
       sv.verse_id, ev.verse_id, 'extras', 29334
  FROM _s305_ex14_lookup sv, _s305_ex14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=14 AND sv.verse_number=27
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=14 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-14-they-feared-and-believed-yahuah',
       E'They feared Yahuah and believed Yahuah — the faith of the redeemed',
       E'*Thus Yahuah (LORD) saved Yashar''el (Israel) that day out of the hand of the Egyptians; and Yashar''el (Israel) saw the Egyptians dead upon the sea shore. And Yashar''el (Israel) saw that great work which Yahuah (LORD) did upon the Egyptians: and the people feared Yahuah (LORD), and believed Yahuah (LORD), and his servant Moses* (Exodus 14:30-31). The seeing of the great work bred the faith — the redeemed people is born trusting the One who saved it. Hebrews names the crossing itself as the act of that faith: *By faith they passed through the Red sea as by dry land* (Hebrews 11:29) — the seeing and the believing are one. The psalmist records the same hour: *Then believed they his words; they sang his praise* (Psalm 106:12). And the extended witness keeps the saving and the beholding: *Yahuah (the Lord) saved Israel from the hand of Egypt, and all the children of Israel saw that the Egyptians had perished, and they beheld the great hand of Yahuah (the Lord), in what he had performed in Egypt and in the sea* (Jasher 81:42). Yet the same psalm that records the believing also records how soon it failed — *They soon forgat his works; they waited not for his counsel* (Psalm 106:13): the deliverance-faith at the sea is real, but it is not yet the Torah written on the heart that endures. The faith born in the seeing must be kept; the redeemed are called to walk in the One they believed.',
       sv.verse_id, ev.verse_id, 'extras', 29337
  FROM _s305_ex14_lookup sv, _s305_ex14_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=14 AND sv.verse_number=30
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=14 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*stand ye still, and see the salvation of Yahuah (LORD) with you... for Yahuah (LORD) will be with you* (2 Chronicles 20:17) — the same word at Jehoshaphat''s deliverance; the battle is Yahuah''s, as at the sea (14:13).'
  FROM cross_reference_threads t
  JOIN _s305_ex14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=14 AND sv.verse_number=13
  JOIN _s305_ex14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-14-stand-still-and-see-the-salvation-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *the angel of his presence saved them: in his love and in his pity he redeemed them* (Isaiah 63:9) — names WHO fights for them (14:14): the Angel of the Presence, the Formed who bears the Name.'
  FROM cross_reference_threads t
  JOIN _s305_ex14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=14 AND sv.verse_number=14
  JOIN _s305_ex14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=63 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-14-stand-still-and-see-the-salvation-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Fear not, stand still and see the salvation of Yahuah (the Lord) which He will effect this day for you* (Jasher 81:28) — Moses'' charge of 14:13 carried verse-for-verse in the restored witness.'
  FROM cross_reference_threads t
  JOIN _s305_ex14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=14 AND sv.verse_number=13
  JOIN _s305_ex14_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=81 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-14-stand-still-and-see-the-salvation-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Yahuah (the Lord) will fight for you, and you shall remain silent* (Jasher 81:32) — word-for-word with *Yahuah shall fight for you, and ye shall hold your peace* (14:14).'
  FROM cross_reference_threads t
  JOIN _s305_ex14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=14 AND sv.verse_number=14
  JOIN _s305_ex14_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=81 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-14-stand-still-and-see-the-salvation-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*all our fathers were under the cloud, and all passed through the sea* (1 Corinthians 10:1) — the pillar that went before and behind (14:19) is the cloud the whole nation was under.'
  FROM cross_reference_threads t
  JOIN _s305_ex14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=14 AND sv.verse_number=19
  JOIN _s305_ex14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-14-the-angel-and-the-pillar-the-formed-led-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *the angel of his presence saved them* (Isaiah 63:9) — the *angel of Elohim which went before the camp* (14:19) is the Angel of the Presence, the Formed Son leading Yashar''el; not a created angel, not a co-equal person.'
  FROM cross_reference_threads t
  JOIN _s305_ex14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=14 AND sv.verse_number=19
  JOIN _s305_ex14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=63 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-14-the-angel-and-the-pillar-the-formed-led-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*In the daytime also he led them with a cloud, and all the night with a light of fire* (Psalm 78:14) — the pillar of 14:19-20: darkness to the enemy, light to the redeemed.'
  FROM cross_reference_threads t
  JOIN _s305_ex14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=14 AND sv.verse_number=19
  JOIN _s305_ex14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-14-the-angel-and-the-pillar-the-formed-led-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*I stood between the Egyptians and Yashar''el (Israel)... and Yahuah brought them through the midst of the sea as if it were dry land* (Jubilees 48:12) — the Presence between the camps of 14:19-20, in the first person.'
  FROM cross_reference_threads t
  JOIN _s305_ex14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=14 AND sv.verse_number=19
  JOIN _s305_ex14_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=48 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-14-the-angel-and-the-pillar-the-formed-led-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *And were all baptized unto Moses in the cloud and in the sea* (1 Corinthians 10:2) — the keystone baptism type; the crossing of 14:22 is the figure of baptism, the whole nation brought through the water.'
  FROM cross_reference_threads t
  JOIN _s305_ex14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=14 AND sv.verse_number=22
  JOIN _s305_ex14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-14-through-the-midst-of-the-sea-the-baptism'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*By faith they passed through the Red sea as by dry land* (Hebrews 11:29) — the dry road of 14:22 was a way of faith; the same path bore the believing through and the pursuers down.'
  FROM cross_reference_threads t
  JOIN _s305_ex14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=14 AND sv.verse_number=22
  JOIN _s305_ex14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-14-through-the-midst-of-the-sea-the-baptism'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*dividing the water before them, to make himself an everlasting name* (Isaiah 63:12) — the dividing of 14:21 was Yahuah''s glorious arm, His name made everlasting in the parting.'
  FROM cross_reference_threads t
  JOIN _s305_ex14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=14 AND sv.verse_number=21
  JOIN _s305_ex14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=63 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-14-through-the-midst-of-the-sea-the-baptism'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*He divided the sea, and caused them to pass through; and he made the waters to stand as an heap* (Psalm 78:13) — the parted wall of 14:21-22 sung: the sea stood up like a heap.'
  FROM cross_reference_threads t
  JOIN _s305_ex14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=14 AND sv.verse_number=21
  JOIN _s305_ex14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-14-through-the-midst-of-the-sea-the-baptism'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*The sea saw it, and fled: Jordan was driven back* (Psalm 114:3) — the crossing of 14:22: the waters fled at the presence of the Elohim of Jacob.'
  FROM cross_reference_threads t
  JOIN _s305_ex14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=14 AND sv.verse_number=22
  JOIN _s305_ex14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=114 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-14-through-the-midst-of-the-sea-the-baptism'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*where water stood before, dry land appeared; and out of the Red sea a way without impediment* (Wisdom of Solomon 19:7) — the dry road of 14:22, the sea made a highway for the people.'
  FROM cross_reference_threads t
  JOIN _s305_ex14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=14 AND sv.verse_number=22
  JOIN _s305_ex14_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=19 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-14-through-the-midst-of-the-sea-the-baptism'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*the waters of the sea were divided into twelve parts, and the children of Israel passed through on foot... as a man would pass through a prepared road* (Jasher 81:38) — the *dry ground* of 14:22 opened for the twelve tribes.'
  FROM cross_reference_threads t
  JOIN _s305_ex14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=14 AND sv.verse_number=22
  JOIN _s305_ex14_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=81 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-14-through-the-midst-of-the-sea-the-baptism'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*which the Egyptians assaying to do were drowned* (Hebrews 11:29) — the return of the sea of 14:28: the wall to the redeemed was a grave to the oppressor.'
  FROM cross_reference_threads t
  JOIN _s305_ex14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=14 AND sv.verse_number=28
  JOIN _s305_ex14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-14-the-sea-returned-the-egyptians-drowned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*And the waters covered their enemies: there was not one of them left* (Psalm 106:11) — the judgment of 14:28 sung whole: the oppressor utterly undone.'
  FROM cross_reference_threads t
  JOIN _s305_ex14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=14 AND sv.verse_number=28
  JOIN _s305_ex14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-14-the-sea-returned-the-egyptians-drowned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *they sing the song of Moses the servant of Elohim (God), and the song of the Lamb... just and true are thy ways* (Revelation 15:3) — the Red-Sea victory of 14:27 sung again at the last great deliverance, one song.'
  FROM cross_reference_threads t
  JOIN _s305_ex14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=14 AND sv.verse_number=27
  JOIN _s305_ex14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=15 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-14-the-sea-returned-the-egyptians-drowned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Yahuah our Elohim cast them into the midst of the sea, into the depths of the abyss beneath the children of Yashar''el (Israel)* (Jubilees 48:14) — the drowning of 14:28 in the restored witness: the pursuers go down into the deep.'
  FROM cross_reference_threads t
  JOIN _s305_ex14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=14 AND sv.verse_number=28
  JOIN _s305_ex14_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=48 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-14-the-sea-returned-the-egyptians-drowned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*she drowned their enemies, and cast them up out of the bottom of the deep* (Wisdom of Solomon 10:19) — the end of 14:28: the sea that opened a road closed as a grave on the oppressor.'
  FROM cross_reference_threads t
  JOIN _s305_ex14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=14 AND sv.verse_number=28
  JOIN _s305_ex14_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=10 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-14-the-sea-returned-the-egyptians-drowned'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*By faith they passed through the Red sea as by dry land* (Hebrews 11:29) — the crossing was the act of the faith of 14:31; the seeing of the great work and the believing are one.'
  FROM cross_reference_threads t
  JOIN _s305_ex14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=14 AND sv.verse_number=31
  JOIN _s305_ex14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-14-they-feared-and-believed-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Then believed they his words; they sang his praise* (Psalm 106:12) — the believing of 14:31 recorded; the great work seen drew faith and song. (106:13 notes how soon it failed — deliverance-faith not yet Torah-on-the-heart.)'
  FROM cross_reference_threads t
  JOIN _s305_ex14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=14 AND sv.verse_number=31
  JOIN _s305_ex14_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-14-they-feared-and-believed-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*they beheld the great hand of Yahuah (the Lord), in what he had performed in Egypt and in the sea* (Jasher 81:42) — the beholding of the great work of 14:30-31, the ground of the faith that followed.'
  FROM cross_reference_threads t
  JOIN _s305_ex14_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=14 AND sv.verse_number=30
  JOIN _s305_ex14_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=81 AND tv.verse_number=42
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-14-they-feared-and-believed-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_exodus_16.sql (Exodus 16) -----
-- Chapter: Exodus 16 — THE MANNA, THE BREAD FROM HEAVEN, and the SABBATH given BEFORE Sinai. In the wilderness of Sin, between Elim and Sinai, on the fifteenth day of the second month, the congregation murmurs for bread; Yahuah rains bread from heaven — *I will rain bread from heaven for you... that I may prove them, whether they will walk in my law, or no* (16:4); the small round thing, the manna, *This is the bread which Yahuah (LORD) hath given you to eat* (16:15); gathered an omer a man, *he that gathered much had nothing over, and he that gathered little had no lack* (16:18); double on the sixth, none on the seventh — *To morrow is the rest of the holy sabbath unto Yahuah (LORD)* (16:23), *See, for that Yahuah (LORD) hath given you the sabbath* (16:29) — the seventh-day Sabbath kept BEFORE the Ten Words were spoken at Sinai; an omer of manna laid up *before the Testimony, to be kept for your generations* (16:33-34); manna forty years until the borders of Canaan.
-- Tag: ex16   Temp view: _s305_ex16_lookup
-- Sort band: base 29375, step 3 -> threads at 29375, 29378, 29381, 29384, 29387 (5 threads)
-- Source of EVERY row: 'canon','exodus',16,v
--
-- Exodus 16 coverage:
--   v.1-3 (journey from Elim to the wilderness of Sin, the fifteenth day of the second month; the murmuring, the flesh pots of Egypt)
--        NT:     none warranted distinct (the murmuring/place is carried into THREAD 1's place-and-date parallel via the extras; John 6:41 names the same murmuring spirit but is held in THREAD 1's John block)
--        Extras: Jasher 81:47-49 (journeyed from Elim and came to the wilderness of Sin, on the fifteenth day of the second month... gave the manna... caused food to rain from heaven... ate the manna for forty years) — THREAD 1 (the place-and-date + the gift)
--        Tanakh: none warranted distinct (the wilderness-feeding is the manna theme of THREAD 1)
--   ★★ v.4,14-15 (I will rain bread from heaven for you; This is the bread which Yahuah hath given you to eat — the manna, the type of the true bread)
--        NT:     ★ John 6:31-32,35,48-51,58 (Our fathers did eat manna in the desert; as it is written, He gave them bread from heaven to eat... Moses gave you not that bread from heaven; but my Father giveth you the true bread from heaven... I am the bread of life... I am the living bread which came down from heaven) — THREAD 1 (THE keystone forward-weave: manna = the type Yahusha fills as the true bread)
--        Extras: Wisdom of Solomon 16:20-21,26 (you feddest your own people with angels' food, and did send them from heaven bread prepared without their labour... it is your word, which preserves them); Jasher 81:48 (Yahuah caused food to rain from heaven for the children of Israel day by day) — THREAD 1
--        Tanakh: ★ Psalm 78:24-25 (had rained down manna upon them to eat, and had given them of the corn of heaven; man did eat angels' food); Nehemiah 9:15,20 (gavest them bread from heaven for their hunger... withheldest not thy manna from their mouth) — THREAD 1
--   ★★ v.4 (that I may prove them, whether they will walk in my law, or no — the manna a test of Torah-walk)
--        NT:     ★ Matthew 4:4 / Luke 4:4 (Man shall not live by bread alone, but by every word that proceedeth out of the mouth of Elohim — Yahusha quotes the manna-lesson) — THREAD 2 (the Torah-affirmed thread)
--        Extras: none warranted distinct (the prove-them/walk-in-my-law is carried by Deut 8 + the Gospel temptation; Wisdom 16:6,11 mindful-of-the-commandment is the serpent-sign chapter, not the manna-test verse — not forced)
--        Tanakh: ★ Deuteronomy 8:2-3 (to humble thee, and to prove thee... whether thou wouldest keep his commandments, or no... fed thee with manna... that he might make thee know that man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah) — THREAD 2 (the master commentary on 16:4)
--   ★ v.16-18 (gather every man according to his eating; he that gathered much had nothing over, and he that gathered little had no lack)
--        NT:     ★ 2 Corinthians 8:14-15 (by an equality... that there may be equality: As it is written, He that had gathered much had nothing over; and he that had gathered little had no lack — Sha'ul quotes the manna-equity) — THREAD 3
--        Extras: none warranted   Tanakh: none warranted distinct (the manna-equity is held to THREAD 3)
--   ★★ v.22-30 (gather double on the sixth, none on the seventh; To morrow is the rest of the holy sabbath unto Yahuah; See, for that Yahuah hath given you the sabbath — the seventh-day Sabbath given BEFORE Sinai)
--        NT:     ★ Hebrews 4:9 (There remaineth therefore a rest to the people of Elohim) — THREAD 4 (the rest that remaineth)
--        Extras: ★ Jubilees 50:7,9 (Six days will you labour, but on the seventh day is the Sabbath of Yahuah your Elohim... save that you have prepared for yourselves on the sixth day, so as to eat, and drink, and rest, and keep Sabbath) — THREAD 4 (same six-days-labour / prepare-on-the-sixth / Sabbath-rest pattern; Jub 50:1 names the same desert of Sinai between Elim and Sinai)
--        Tanakh: ★★ Genesis 2:2-3 (he rested on the seventh day... Elohim blessed the seventh day, and sanctified it); ★ Exodus 20:8-11 (Remember the sabbath day... for in six days Yahuah made heaven and earth... and rested the seventh day); ★ Isaiah 58:13-14 (If thou turn away thy foot from the sabbath... call the sabbath a delight, the holy of Yahuah, honourable) — THREAD 4 (Sabbath creation-rooted, pre-Sinai, prophet-affirmed, NOT abolished)
--   ★ v.31-34 (the manna laid up — Fill an omer of it to be kept for your generations... lay it up before Yahuah... before the Testimony, to be kept)
--        NT:     ★ Hebrews 9:4 (the golden pot that had manna) in the ark; ★ Revelation 2:17 (To him that overcometh will I give to eat of the hidden manna) — THREAD 5 (the memorial manna; the hidden manna)
--        Extras: none warranted distinct (Jasher 81:48-49 covers the forty-years giving, held to THREAD 1; the laid-up pot is carried by Heb 9 / Rev 2)
--        Tanakh: none warranted distinct (the pot-before-the-Testimony is held to THREAD 5)
--   v.5-13 (Moses and Aaron's word; the glory in the cloud; the quails at even, the dew, the small round thing) — narrative scaffolding; the glory-in-the-cloud (16:10) is the Formed-Glory appearing but here belongs to its own theophany pack (Exod 13/19/40); the quails are picked up by Ps 78:27-31 but that is the lust-and-wrath turn, not the manna-grace this chapter teaches — NOT forced as members.
--   v.19-21,35-36 (leave none till morning / it bred worms; manna forty years; an omer is the tenth of an ephah) — v.35 forty-years carried by Jasher 81:49 within THREAD 1; the worms (16:20) and the omer-measure (16:36) are narrative detail, no framework-bearing target warranted.
--
-- Threads (slug — target libraries):
--   1. exodus-16-i-will-rain-bread-from-heaven-the-true-bread — NT (John) + Tanakh (Psalm 78, Nehemiah 9) + Extras (Wisdom of Solomon, Jasher) [extras] (★★ THE keystone: manna = the type Yahusha fills as the true bread of life)
--   2. exodus-16-that-i-may-prove-them-whether-they-will-walk-in-my-torah — NT (Matthew, Luke) + Tanakh (Deuteronomy 8) [free] (★★ the manna a test of Torah-walk; man lives by every word — Torah-affirmed)
--   3. exodus-16-he-that-gathered-much-had-nothing-over — NT (2 Corinthians) [free] (★ the manna-equity Sha'ul quotes for the collection)
--   4. exodus-16-the-sabbath-given-before-sinai — Tanakh (Genesis 2, Exodus 20, Isaiah 58) + NT (Hebrews 4) + Extras (Jubilees) [extras] (★★ the seventh-day Sabbath creation-rooted, given BEFORE the Ten Words, NOT abolished)
--   5. exodus-16-a-pot-of-manna-before-the-testimony-the-hidden-manna — NT (Hebrews 9, Revelation 2) [free] (★ the memorial manna in the ark; the hidden manna to the overcomer)
--
-- Framing notes:
--   ★★ THE KEYSTONE (THREAD 1): *I will rain bread from heaven for you* (16:4); *This is the bread which Yahuah (LORD) hath given you to eat* (16:15). Yahusha takes up the very text in John 6: the crowd cites *Our fathers did eat manna in the desert; as it is written, He gave them bread from heaven to eat* (John 6:31), and he answers *Moses gave you not that bread from heaven; but my Father giveth you the true bread from heaven* (6:32), *I am the bread of life* (6:35), *I am the living bread which came down from heaven* (6:51). The manna is the TYPE; the Formed Son who fed Yashar'el in the wilderness is the true bread the Father gives — read through the Formed-and-the-Formless lens, never collapsing Father and Son. Psalm 78:24-25 sings it (*the corn of heaven... man did eat angels' food*), Nehemiah 9 confesses it (*gavest them bread from heaven*), Wisdom of Solomon 16 names it *angels' food... bread prepared without their labour* and draws the same lesson Deuteronomy 8 draws — *it is your word, which preserves them* (Wis 16:26).
--   ★★ THE TORAH-TEST (THREAD 2): *that I may prove them, whether they will walk in my law, or no* (16:4). Deuteronomy 8:2-3 is the master commentary — the manna humbled and PROVED Yashar'el *whether thou wouldest keep his commandments, or no... that man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah*. Yahusha stands on this very word in the wilderness temptation: *Man shall not live by bread alone, but by every word... of Elohim* (Matthew 4:4 / Luke 4:4). The daily bread is the daily test of Torah-walk; the word of Yahuah is the true sustenance — Torah affirmed, never set aside.
--   ★ THE MANNA-EQUITY (THREAD 3): *he that gathered much had nothing over, and he that gathered little had no lack* (16:18). Sha'ul (Paul) quotes it word-for-word in the Macedonian collection — *that there may be equality: As it is written, He that had gathered much had nothing over; and he that had gathered little had no lack* (2 Corinthians 8:14-15). The manna-economy of sufficiency, where none hoarded and none lacked, becomes the pattern for the saints' generosity.
--   ★★ THE SABBATH BEFORE SINAI (THREAD 4): *To morrow is the rest of the holy sabbath unto Yahuah (LORD)* (16:23); *See, for that Yahuah (LORD) hath given you the sabbath* (16:29). This is the load-bearing point: the seventh-day Sabbath is taught and kept HERE, in the wilderness of Sin, BEFORE the Ten Words are spoken at Sinai (Exodus 20). It is no Sinai-novelty but creation-rooted — *he rested on the seventh day... Elohim blessed the seventh day, and sanctified it* (Genesis 2:2-3) — and the fourth word grounds itself there (*for in six days Yahuah made heaven and earth... and rested the seventh day*, Exodus 20:11). The prophet calls it *the holy of Yahuah, honourable* (Isaiah 58:13), and the letter to the Hebrews declares *There remaineth therefore a rest to the people of Elohim* (Hebrews 4:9) — the Sabbath kept, never abolished. Jubilees 50 carries the same pattern (*Six days will you labour, but on the seventh day is the Sabbath... save that you have prepared for yourselves on the sixth day*, 50:7,9) and names the same desert of Sinai between Elim and Sinai (50:1).
--   ★ THE MEMORIAL MANNA (THREAD 5): *Fill an omer of it to be kept for your generations... lay it up before Yahuah (LORD)... before the Testimony* (16:32-34). The letter to the Hebrews places it in the ark — *the golden pot that had manna* (Hebrews 9:4) — and the Spirit promises the overcomer *the hidden manna* (Revelation 2:17): the memorial of the bread from heaven kept before the Testimony, and the hidden bread reserved for those who overcome.
--   EXTRAS: Wisdom of Solomon 16:20-21,26 (apocrypha, single-edition) is the rich clean parallel — *angels' food... bread prepared without their labour... it is your word, which preserves them*. Jasher 81:47-49 (DOUBLE-WRITTEN 'jasher','jasher') keeps the place-and-date and the gift verse-for-verse with 16:1,4,35; note this Jasher parse reads "Israel" / "the Lord" (not Yashar'el/Yahuah) — quoted EXACTLY as returned. Jubilees 50:7,9 (DOUBLE-WRITTEN 'jubilees','jubilees') carries the Sabbath six-days/prepare-on-the-sixth pattern; Jubilees does not narrate the manna event itself, so it is a member only on the Sabbath thread.
--   VERSES WITH NO ADD: v.5-13 (Moses/Aaron's word, the glory in the cloud, the quails and dew — narrative scaffolding; the glory-theophany belongs to its own pack, the quails to Psalm 78's lust-and-wrath turn, not the manna-grace taught here); v.19-21,36 (the worms, the melting, the omer-measure — narrative detail). v.35 forty-years is carried by Jasher 81:49 in THREAD 1.

CREATE TEMP VIEW _s305_ex16_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): I will rain bread from heaven — the true bread of life
    ('canon','exodus',16,4,'canon','john',6,31,'free',
      E'*Our fathers did eat manna in the desert; as it is written, He gave them bread from heaven to eat* (John 6:31). The crowd quotes the very gift of *I will rain bread from heaven for you* (Exodus 16:4) — the manna *which Yahuah (LORD) hath given you to eat* (16:15) is the *bread from heaven* the fathers ate. They cite the type back to the One who is its fulfillment, standing before the true bread without seeing it.'),
    ('canon','exodus',16,4,'canon','john',6,32,'free',
      E'*Then Yahusha (Jesus) said unto them, Verily, verily, I say unto you, Moses gave you not that bread from heaven; but my Father giveth you the true bread from heaven* (John 6:32). The manna rained down in *I will rain bread from heaven for you* (Exodus 16:4) was never Moses'' gift but Yahuah''s; and it was the shadow — *my Father giveth you the true bread from heaven*. The wilderness bread points past itself to the One the Father gives.'),
    ('canon','exodus',16,15,'canon','john',6,35,'free',
      E'*And Yahusha (Jesus) said unto them, I am the bread of life: he that cometh to me shall never hunger; and he that believeth on me shall never thirst* (John 6:35). Where Moses said *This is the bread which Yahuah (LORD) hath given you to eat* (Exodus 16:15), the Formed Son says *I am the bread of life*. The manna fed the body a day and was gathered again the next; the true bread satisfies for ever — *he that cometh to me shall never hunger*.'),
    ('canon','exodus',16,15,'canon','john',6,51,'free',
      E'*I am the living bread which came down from heaven: if any man eat of this bread, he shall live for ever: and the bread that I will give is my flesh, which I will give for the life of the world* (John 6:51). The manna of *This is the bread which Yahuah (LORD) hath given you to eat* (Exodus 16:15) *came down from heaven* (16:4) as the figure; the *living bread which came down from heaven* is the substance — the Formed Son given for the life of the world, the true bread the manna foreshadowed.'),
    ('canon','exodus',16,15,'canon','john',6,58,'free',
      E'*This is that bread which came down from heaven: not as your fathers did eat manna, and are dead: he that eateth of this bread shall live for ever* (John 6:58). The contrast is drawn sharp against Exodus 16: the fathers ate the manna — *the bread which Yahuah (LORD) hath given you to eat* (16:15) — *and are dead*; but *he that eateth of this bread shall live for ever*. The wilderness bread was the type that could not give life; the true bread does.'),
    ('canon','exodus',16,14,'canon','psalms',78,24,'free',
      E'*And had rained down manna upon them to eat, and had given them of the corn of heaven* (Psalm 78:24). The psalmist sings the gift of *I will rain bread from heaven for you* (Exodus 16:4) and the *small round thing* upon the wilderness (16:14): Yahuah *rained down manna upon them to eat... the corn of heaven*. The bread from heaven is remembered as Yahuah''s own provision to a murmuring people.'),
    ('canon','exodus',16,15,'canon','psalms',78,25,'free',
      E'*Man did eat angels'' food: he sent them meat to the full* (Psalm 78:25). The manna — *the bread which Yahuah (LORD) hath given you to eat* (Exodus 16:15) — is sung as *angels'' food*, bread of the heavenly host given to men. What the children gathered an omer at a time was no common meat but the food of heaven, the type of the true bread to come.'),
    ('canon','exodus',16,15,'canon','nehemiah',9,15,'free',
      E'*And gavest them bread from heaven for their hunger, and broughtest forth water for them out of the rock for their thirst* (Nehemiah 9:15). The Levites'' confession remembers Exodus 16: against the people''s hunger Yahuah *gavest them bread from heaven* — the very manna of *This is the bread which Yahuah (LORD) hath given you to eat* (16:15) — the faithfulness of the Provider over a wilderness generation.'),
    ('canon','exodus',16,35,'canon','nehemiah',9,20,'free',
      E'*Thou gavest also thy good spirit to instruct them, and withheldest not thy manna from their mouth, and gavest them water for their thirst* (Nehemiah 9:20). The forty years of *the children of Yashar''el (Israel) did eat manna forty years, until they came to a land inhabited* (Exodus 16:35) are confessed here: through all the rebellion Yahuah *withheldest not thy manna from their mouth* — the bread from heaven sustained unbroken across the whole wilderness sojourn.'),
    ('canon','exodus',16,15,'apocrypha','the-wisdom-of-solomon',16,20,'extras',
      E'*Instead of which you feddest your own people with angels'' food, and did send them from heaven bread prepared without their labour, able to content every man''s delight, and agreeing to every taste* (Wisdom of Solomon 16:20). The witness names the manna of *the bread which Yahuah (LORD) hath given you to eat* (Exodus 16:15) as *angels'' food... bread prepared without their labour* — the bread from heaven given freely, suiting every taste, the gift no labour earned.'),
    ('canon','exodus',16,4,'apocrypha','the-wisdom-of-solomon',16,26,'extras',
      E'*That your children, O Yahuah (God), whom you lovest, might know, that it is not the growing of fruits that nourishes man: but that it is your word, which preserves them that put their trust in you* (Wisdom of Solomon 16:26). The witness draws from the manna the very lesson of *that I may prove them, whether they will walk in my law* (Exodus 16:4): *it is your word, which preserves them* — man is sustained not by bread but by the word of Yahuah, the same truth Deuteronomy 8:3 and Yahusha speak.'),
    ('canon','exodus',16,4,'jasher','jasher',81,48,'extras',
      E'*At that time Yahuah (the Lord) gave the manna to the children of Israel to eat, and Yahuah (the Lord) caused food to rain from heaven for the children of Israel day by day* (Jasher 81:48). The extended witness keeps the gift verse-for-verse with *I will rain bread from heaven for you; and the people shall go out and gather a certain rate every day* (Exodus 16:4): Yahuah *caused food to rain from heaven... day by day* — the daily bread from heaven for a wandering people.')
,

    -- THREAD 2 (★★): That I may prove them, whether they will walk in my torah
    ('canon','exodus',16,4,'canon','deuteronomy',8,3,'free',
      E'*And he humbled thee, and suffered thee to hunger, and fed thee with manna, which thou knewest not, neither did thy fathers know; that he might make thee know that man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah (LORD) doth man live* (Deuteronomy 8:3). This is the master commentary on *that I may prove them, whether they will walk in my law, or no* (Exodus 16:4): the manna *fed thee... that he might make thee know that man doth not live by bread only, but by every word*. The daily bread was the daily school of Torah-walk, teaching that the word of Yahuah is the true life.'),
    ('canon','exodus',16,4,'canon','deuteronomy',8,2,'free',
      E'*And thou shalt remember all the way which Yahuah Elohayka (the LORD thy God) led thee these forty years in the wilderness, to humble thee, and to prove thee, to know what was in thine heart, whether thou wouldest keep his commandments, or no* (Deuteronomy 8:2). The purpose of the manna is named outright as the purpose of *that I may prove them, whether they will walk in my law, or no* (Exodus 16:4): *to prove thee... whether thou wouldest keep his commandments, or no*. The wilderness feeding was the testing-ground of the covenant heart.'),
    ('canon','exodus',16,4,'canon','matthew',4,4,'free',
      E'*But he answered and said, It is written, Man shall not live by bread alone, but by every word that proceedeth out of the mouth of Elohim (God)* (Matthew 4:4). In the wilderness, hungering forty days, Yahusha stands on the very lesson the manna taught — *that I may prove them, whether they will walk in my law* (Exodus 16:4). Tested for bread, he answers from the manna-word of Deuteronomy 8:3: *Man shall not live by bread alone, but by every word*. Where Yashar''el was proved and murmured, the Formed Son is proved and trusts the word.'),
    ('canon','exodus',16,4,'canon','luke',4,4,'free',
      E'*And Yahusha (Jesus) answered him, saying, It is written, That man shall not live by bread alone, but by every word of Elohim (God)* (Luke 4:4). Yahusha meets the tempter''s bread with the manna-lesson of *that I may prove them, whether they will walk in my law* (Exodus 16:4): *man shall not live by bread alone, but by every word of Elohim*. The test of the daily bread in the wilderness of Sin is answered in the wilderness of the temptation — by the word, not by bread.')
,

    -- THREAD 3 (★): He that gathered much had nothing over
    ('canon','exodus',16,18,'canon','2-corinthians',8,15,'free',
      E'*As it is written, He that had gathered much had nothing over; and he that had gathered little had no lack* (2 Corinthians 8:15). Sha''ul (Paul) quotes the manna-measure word-for-word: *he that gathered much had nothing over, and he that gathered little had no lack; they gathered every man according to his eating* (Exodus 16:18). The manna-economy where none hoarded and none lacked becomes the written pattern for the saints'' giving.'),
    ('canon','exodus',16,18,'canon','2-corinthians',8,14,'free',
      E'*But by an equality, that now at this time your abundance may be a supply for their want, that their abundance also may be a supply for your want: that there may be equality* (2 Corinthians 8:14). The equity of *he that gathered much had nothing over, and he that gathered little had no lack* (Exodus 16:18) is read forward as the rule of *equality* among the saints — abundance supplying want, so that, as with the manna gathered *every man according to his eating*, none has too much and none too little.')
,

    -- THREAD 4 (★★): The Sabbath given through the manna, BEFORE Sinai
    ('canon','exodus',16,23,'canon','genesis',2,2,'free',
      E'*And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day from all his work which he had made* (Genesis 2:2). The *rest of the holy sabbath unto Yahuah (LORD)* declared in the wilderness (Exodus 16:23) is no new thing but the seventh day from creation — *he rested on the seventh day from all his work*. The Sabbath given through the manna reaches back to the rest Yahuah took at the founding of the world.'),
    ('canon','exodus',16,23,'canon','genesis',2,3,'free',
      E'*And Elohim (God) blessed the seventh day, and sanctified it: because that in it he had rested from all his work which Elohim (God) created and made* (Genesis 2:3). When Moses calls the morrow *the rest of the holy sabbath unto Yahuah (LORD)* (Exodus 16:23), it is the day Yahuah *blessed... and sanctified* at creation. The holiness of the seventh day was set before Sinai, before the manna — the Sabbath kept here is the creation-Sabbath remembered.'),
    ('canon','exodus',16,29,'canon','exodus',20,11,'free',
      E'*For in six days Yahuah (LORD) made heaven and earth, the sea, and all that in them is, and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it* (Exodus 20:11). The Sabbath *Yahuah (LORD) hath given you* through the manna (Exodus 16:29) is the same the fourth word will ground in creation — *in six days Yahuah made heaven and earth... and rested the seventh day*. The keystone: the people are keeping the Sabbath in chapter 16, BEFORE the Ten Words are spoken in chapter 20; the command at Sinai ratifies a rest already given.'),
    ('canon','exodus',16,29,'canon','isaiah',58,13,'free',
      E'*If thou turn away thy foot from the sabbath, from doing thy pleasure on my holy day; and call the sabbath a delight, the holy of Yahuah (LORD), honourable; and shalt honour him, not doing thine own ways, nor finding thine own pleasure, nor speaking thine own words* (Isaiah 58:13). The Sabbath *Yahuah (LORD) hath given you* (Exodus 16:29) the prophet calls *a delight, the holy of Yahuah, honourable* — kept and honoured, never abolished. The gift first taught through the manna is the same day Isaiah summons Yashar''el to delight in.'),
    ('canon','exodus',16,23,'canon','hebrews',4,9,'free',
      E'*There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9). The *rest of the holy sabbath unto Yahuah (LORD)* given in the wilderness (Exodus 16:23) is not done away — *There remaineth therefore a rest to the people of Elohim*. The seventh-day rest taught through the manna stands; the letter declares it abides for the people of Yahuah.'),
    ('canon','exodus',16,23,'jubilees','jubilees',50,7,'extras',
      E'*Six days will you labour, but on the seventh day is the Sabbath of Yahuah your Elohim (the LORD your God). In it you shall do no manner of work, you and your sons, and your men-servants and your maid-servants, and all your cattle and the sojourner also who is with you* (Jubilees 50:7). The restored witness keeps the same Sabbath-pattern declared through the manna — *To morrow is the rest of the holy sabbath unto Yahuah (LORD)* (Exodus 16:23): *six days will you labour, but on the seventh day is the Sabbath of Yahuah*. Jubilees sets this very law in the desert of Sinai, between Elim and Sinai (50:1) — the place of the manna.'),
    ('canon','exodus',16,23,'jubilees','jubilees',50,9,'extras',
      E'*You shall do no work whatever on the Sabbath day save that you have prepared for yourselves on the sixth day, so as to eat, and drink, and rest, and keep Sabbath from all work on that day* (Jubilees 50:9). The witness keeps the exact provision of the manna-Sabbath — *bake that which ye will bake to day... and that which remaineth over lay up for you to be kept until the morning* (Exodus 16:23): work prepared on the sixth day *so as to eat, and drink, and rest, and keep Sabbath* on the seventh. The double-gathering on the sixth is the same ordinance.')
,

    -- THREAD 5 (★): A pot of manna before the Testimony — the hidden manna
    ('canon','exodus',16,33,'canon','hebrews',9,4,'free',
      E'*Which had the golden censer, and the ark of the covenant overlaid round about with gold, wherein was the golden pot that had manna, and Aaron''s rod that budded, and the tables of the covenant* (Hebrews 9:4). The omer Moses commands Aaron to *lay it up before Yahuah (LORD), to be kept for your generations* (Exodus 16:33) is named in the ark — *the golden pot that had manna*. The memorial of the bread from heaven was kept beside the tables of the covenant, a witness to the generations of Yahuah''s wilderness provision.'),
    ('canon','exodus',16,33,'canon','revelation',2,17,'free',
      E'*He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the hidden manna, and will give him a white stone, and in the stone a new name written, which no man knoweth saving he that receiveth it* (Revelation 2:17). The pot of manna laid up *before the Testimony, to be kept* (Exodus 16:34) becomes the promise of *the hidden manna* — the bread from heaven reserved out of sight for the overcomer, the memorial manna made the reward of the faithful.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex16_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex16_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-16-i-will-rain-bread-from-heaven-the-true-bread',
       E'I will rain bread from heaven — the manna and the true bread of life',
       E'In the wilderness of Sin the congregation murmurs for the flesh pots of Egypt, and Yahuah answers with grace: *Then said Yahuah (LORD) unto Moses, Behold, I will rain bread from heaven for you; and the people shall go out and gather a certain rate every day* (Exodus 16:4). In the morning the dew lifts and there lies *a small round thing, as small as the hoar frost on the ground* (16:14), and Moses names it: *This is the bread which Yahuah (LORD) hath given you to eat* (16:15). The bread from heaven — manna — fed Yashar''el forty years until the borders of Canaan (16:35). This is the great type the Gospel fills. In John 6 the crowd cites it back to him: *Our fathers did eat manna in the desert; as it is written, He gave them bread from heaven to eat* (John 6:31). And Yahusha answers — *Moses gave you not that bread from heaven; but my Father giveth you the true bread from heaven* (6:32), *I am the bread of life: he that cometh to me shall never hunger* (6:35), *I am the living bread which came down from heaven... and the bread that I will give is my flesh, which I will give for the life of the world* (6:51), *not as your fathers did eat manna, and are dead: he that eateth of this bread shall live for ever* (6:58). Read through the Formed-and-the-Formless: the Formed Son who fed Yashar''el in the wilderness is himself the true bread the Father gives. The Tanakh sings the gift — *had rained down manna upon them to eat, and had given them of the corn of heaven; man did eat angels'' food* (Psalm 78:24-25) — and the Levites confess it — *gavest them bread from heaven for their hunger* (Nehemiah 9:15), *withheldest not thy manna from their mouth* (9:20). The restored witnesses keep it whole: *you feddest your own people with angels'' food, and did send them from heaven bread prepared without their labour* (Wisdom of Solomon 16:20), *it is your word, which preserves them that put their trust in you* (16:26); and *Yahuah (the Lord) caused food to rain from heaven for the children of Israel day by day* (Jasher 81:48). The bread that fell a day at a time was the shadow; the living bread that came down from heaven is the substance.',
       sv.verse_id, ev.verse_id, 'extras', 29375
  FROM _s305_ex16_lookup sv, _s305_ex16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=16 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=16 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-16-that-i-may-prove-them-whether-they-will-walk-in-my-torah',
       E'That I may prove them, whether they will walk in my law — man lives by every word',
       E'The bread from heaven came with a purpose beyond the filling of hungry mouths: *Behold, I will rain bread from heaven for you; and the people shall go out and gather a certain rate every day, that I may prove them, whether they will walk in my law, or no* (Exodus 16:4). The manna was a daily test of Torah-walk — would they gather as commanded, leave none till morning, keep the seventh day? Deuteronomy 8 is the master commentary, naming the manna''s purpose outright: *to humble thee, and to prove thee, to know what was in thine heart, whether thou wouldest keep his commandments, or no* (Deuteronomy 8:2), *and fed thee with manna, which thou knewest not... that he might make thee know that man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah (LORD) doth man live* (8:3). The daily bread was the daily school: the word of Yahuah, not bread, is the true sustenance of man. And the Formed Son stands on this very lesson in his own wilderness. Hungering forty days, tested for bread, he answers from the manna-word: *Man shall not live by bread alone, but by every word that proceedeth out of the mouth of Elohim (God)* (Matthew 4:4), *but by every word of Elohim* (Luke 4:4). Where Yashar''el was proved by the manna and murmured, Yahusha is proved and trusts the word. The test is the same in both wildernesses — and the answer is the word, never set aside but kept; this is no abolition of Torah but its affirmation, the proving of whether the heart will walk in it.',
       sv.verse_id, ev.verse_id, 'free', 29378
  FROM _s305_ex16_lookup sv, _s305_ex16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=16 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=16 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-16-he-that-gathered-much-had-nothing-over',
       E'He that gathered much had nothing over — the manna-equity',
       E'Each was to gather *an omer for every man, according to the number of your persons* (Exodus 16:16), and the wonder of the manna was its measure: *And when they did mete it with an omer, he that gathered much had nothing over, and he that gathered little had no lack; they gathered every man according to his eating* (Exodus 16:18). However much or little a man took, when it was measured each had exactly his need — an economy of sufficiency where none hoarded and none lacked, and what was kept against the command bred worms and stank (16:20). Sha''ul (Paul) reaches back to this very measure when he stirs the saints to give for the want of others: *But by an equality, that now at this time your abundance may be a supply for their want, that their abundance also may be a supply for your want: that there may be equality* (2 Corinthians 8:14), *As it is written, He that had gathered much had nothing over; and he that had gathered little had no lack* (8:15). The manna-pattern becomes the written rule of generosity among Yahuah''s people — abundance flowing to fill want, so that, as in the wilderness, none has too much and none too little.',
       sv.verse_id, ev.verse_id, 'free', 29381
  FROM _s305_ex16_lookup sv, _s305_ex16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=16 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=16 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-16-the-sabbath-given-before-sinai',
       E'The Sabbath given through the manna — before Sinai, creation-rooted, not abolished',
       E'On the sixth day a double portion fell, two omers a man, and Moses unfolds the reason: *This is that which Yahuah (LORD) hath said, To morrow is the rest of the holy sabbath unto Yahuah (LORD): bake that which ye will bake to day, and seethe that ye will seethe; and that which remaineth over lay up for you to be kept until the morning* (Exodus 16:23). On the seventh there was none in the field, and to those who went out to gather Yahuah said *How long refuse ye to keep my commandments and my laws?* (16:28), *See, for that Yahuah (LORD) hath given you the sabbath* (16:29) — *So the people rested on the seventh day* (16:30). Here is the load-bearing point: the seventh-day Sabbath is taught and KEPT in the wilderness of Sin, in chapter sixteen, BEFORE the Ten Words are ever spoken at Sinai in chapter twenty. It is no Sinai-novelty. It reaches back to the founding of the world — *on the seventh day Elohim (God) ended his work... and he rested on the seventh day* (Genesis 2:2), *And Elohim (God) blessed the seventh day, and sanctified it* (Genesis 2:3) — and when the fourth word is finally spoken it grounds itself there: *For in six days Yahuah (LORD) made heaven and earth, the sea, and all that in them is, and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it* (Exodus 20:11). The command at Sinai ratifies a rest already given. The prophet calls it *a delight, the holy of Yahuah (LORD), honourable* (Isaiah 58:13), to be kept and honoured; and the letter declares *There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9) — the Sabbath abides, never abolished. The restored witness keeps the same ordinance: *Six days will you labour, but on the seventh day is the Sabbath of Yahuah your Elohim (the LORD your God)* (Jubilees 50:7), *save that you have prepared for yourselves on the sixth day, so as to eat, and drink, and rest, and keep Sabbath* (50:9) — set, like the manna, in the desert of Sinai between Elim and Sinai. The double-gathering on the sixth and the rest on the seventh are one law, given through the bread from heaven before ever a word was thundered from the mount.',
       sv.verse_id, ev.verse_id, 'extras', 29384
  FROM _s305_ex16_lookup sv, _s305_ex16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=16 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=16 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-16-a-pot-of-manna-before-the-testimony-the-hidden-manna',
       E'A pot of manna before the Testimony — the memorial and the hidden manna',
       E'The bread from heaven was not only to be eaten but remembered. *And Moses said, This is the thing which Yahuah (LORD) commandeth, Fill an omer of it to be kept for your generations; that they may see the bread wherewith I have fed you in the wilderness* (Exodus 16:32); *Take a pot, and put an omer full of manna therein, and lay it up before Yahuah (LORD), to be kept for your generations* (16:33); *so Aaron laid it up before the Testimony, to be kept* (16:34). An omer of manna was sealed up in a pot before the ark — a memorial to the generations of Yahuah''s wilderness provision. The letter to the Hebrews names it among the ark''s holy things: *wherein was the golden pot that had manna, and Aaron''s rod that budded, and the tables of the covenant* (Hebrews 9:4) — the bread from heaven kept beside the very tables of the covenant. And the Spirit takes the laid-up manna and makes it a promise to the faithful: *To him that overcometh will I give to eat of the hidden manna, and will give him a white stone, and in the stone a new name written* (Revelation 2:17). The manna hidden away before the Testimony becomes *the hidden manna* — the bread of heaven reserved out of sight for the one who overcomes, the wilderness provision made the reward of the end.',
       sv.verse_id, ev.verse_id, 'free', 29387
  FROM _s305_ex16_lookup sv, _s305_ex16_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=16 AND sv.verse_number=32
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=16 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Our fathers did eat manna in the desert; as it is written, He gave them bread from heaven to eat* (John 6:31) — the crowd cites the gift of *I will rain bread from heaven for you* (16:4) back to its fulfillment.'
  FROM cross_reference_threads t
  JOIN _s305_ex16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=16 AND sv.verse_number=4
  JOIN _s305_ex16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-16-i-will-rain-bread-from-heaven-the-true-bread'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Moses gave you not that bread from heaven; but my Father giveth you the true bread from heaven* (John 6:32) — the manna of 16:4 was the shadow; the Father gives the true bread.'
  FROM cross_reference_threads t
  JOIN _s305_ex16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=16 AND sv.verse_number=4
  JOIN _s305_ex16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-16-i-will-rain-bread-from-heaven-the-true-bread'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I am the bread of life: he that cometh to me shall never hunger* (John 6:35) — what Moses called *the bread which Yahuah hath given you to eat* (16:15), the Formed Son says of himself.'
  FROM cross_reference_threads t
  JOIN _s305_ex16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=16 AND sv.verse_number=15
  JOIN _s305_ex16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-16-i-will-rain-bread-from-heaven-the-true-bread'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*I am the living bread which came down from heaven... the bread that I will give is my flesh* (John 6:51) — the manna of 16:15 the figure, the living bread the substance given for the life of the world.'
  FROM cross_reference_threads t
  JOIN _s305_ex16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=16 AND sv.verse_number=15
  JOIN _s305_ex16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=51
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-16-i-will-rain-bread-from-heaven-the-true-bread'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*not as your fathers did eat manna, and are dead: he that eateth of this bread shall live for ever* (John 6:58) — the manna of 16:15 could not give life; the true bread does.'
  FROM cross_reference_threads t
  JOIN _s305_ex16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=16 AND sv.verse_number=15
  JOIN _s305_ex16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=58
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-16-i-will-rain-bread-from-heaven-the-true-bread'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*had rained down manna upon them to eat, and had given them of the corn of heaven* (Psalm 78:24) — the psalm sings the gift of 16:4,14, the bread from heaven for a murmuring people.'
  FROM cross_reference_threads t
  JOIN _s305_ex16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=16 AND sv.verse_number=14
  JOIN _s305_ex16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-16-i-will-rain-bread-from-heaven-the-true-bread'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Man did eat angels'' food: he sent them meat to the full* (Psalm 78:25) — the manna of 16:15 sung as the food of the heavenly host.'
  FROM cross_reference_threads t
  JOIN _s305_ex16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=16 AND sv.verse_number=15
  JOIN _s305_ex16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-16-i-will-rain-bread-from-heaven-the-true-bread'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*gavest them bread from heaven for their hunger* (Nehemiah 9:15) — the Levites confess the manna of 16:15 as Yahuah''s faithful provision against the people''s hunger.'
  FROM cross_reference_threads t
  JOIN _s305_ex16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=16 AND sv.verse_number=15
  JOIN _s305_ex16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-16-i-will-rain-bread-from-heaven-the-true-bread'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*withheldest not thy manna from their mouth* (Nehemiah 9:20) — the forty years of 16:35 confessed: the bread from heaven sustained unbroken through all the rebellion.'
  FROM cross_reference_threads t
  JOIN _s305_ex16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=16 AND sv.verse_number=35
  JOIN _s305_ex16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-16-i-will-rain-bread-from-heaven-the-true-bread'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'*you feddest your own people with angels'' food, and did send them from heaven bread prepared without their labour* (Wisdom of Solomon 16:20) — the manna of 16:15 named as the bread no labour earned.'
  FROM cross_reference_threads t
  JOIN _s305_ex16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=16 AND sv.verse_number=15
  JOIN _s305_ex16_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=16 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-16-i-will-rain-bread-from-heaven-the-true-bread'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 11, E'*it is your word, which preserves them that put their trust in you* (Wisdom of Solomon 16:26) — the witness draws from the manna the lesson of *that I may prove them, whether they will walk in my law* (16:4): man is sustained by the word.'
  FROM cross_reference_threads t
  JOIN _s305_ex16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=16 AND sv.verse_number=4
  JOIN _s305_ex16_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=16 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-16-i-will-rain-bread-from-heaven-the-true-bread'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 12, E'*Yahuah (the Lord) caused food to rain from heaven for the children of Israel day by day* (Jasher 81:48) — the daily bread of *I will rain bread from heaven for you* (16:4) kept verse-for-verse in the restored witness.'
  FROM cross_reference_threads t
  JOIN _s305_ex16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=16 AND sv.verse_number=4
  JOIN _s305_ex16_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=81 AND tv.verse_number=48
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-16-i-will-rain-bread-from-heaven-the-true-bread'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*to humble thee, and to prove thee... whether thou wouldest keep his commandments, or no* (Deuteronomy 8:2) — names the purpose of the manna outright, the prove-them of 16:4.'
  FROM cross_reference_threads t
  JOIN _s305_ex16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=16 AND sv.verse_number=4
  JOIN _s305_ex16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-16-that-i-may-prove-them-whether-they-will-walk-in-my-torah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*fed thee with manna... that man doth not live by bread only, but by every word that proceedeth out of the mouth of Yahuah* (Deuteronomy 8:3) — the master commentary on 16:4: the daily bread the daily school of Torah.'
  FROM cross_reference_threads t
  JOIN _s305_ex16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=16 AND sv.verse_number=4
  JOIN _s305_ex16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-16-that-i-may-prove-them-whether-they-will-walk-in-my-torah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Man shall not live by bread alone, but by every word that proceedeth out of the mouth of Elohim* (Matthew 4:4) — the Formed Son, tested in the wilderness, answers from the manna-lesson of 16:4.'
  FROM cross_reference_threads t
  JOIN _s305_ex16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=16 AND sv.verse_number=4
  JOIN _s305_ex16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=4 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-16-that-i-may-prove-them-whether-they-will-walk-in-my-torah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*man shall not live by bread alone, but by every word of Elohim* (Luke 4:4) — Yahusha meets the tempter''s bread with the proving-word of 16:4, by the word and not by bread.'
  FROM cross_reference_threads t
  JOIN _s305_ex16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=16 AND sv.verse_number=4
  JOIN _s305_ex16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=4 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-16-that-i-may-prove-them-whether-they-will-walk-in-my-torah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*by an equality... that there may be equality* (2 Corinthians 8:14) — the manna-equity of 16:18 read forward as the rule of equality among the saints, abundance supplying want.'
  FROM cross_reference_threads t
  JOIN _s305_ex16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=16 AND sv.verse_number=18
  JOIN _s305_ex16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=8 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-16-he-that-gathered-much-had-nothing-over'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*As it is written, He that had gathered much had nothing over; and he that had gathered little had no lack* (2 Corinthians 8:15) — Sha''ul quotes the manna-measure of 16:18 word-for-word as the written pattern for giving.'
  FROM cross_reference_threads t
  JOIN _s305_ex16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=16 AND sv.verse_number=18
  JOIN _s305_ex16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=8 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-16-he-that-gathered-much-had-nothing-over'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*he rested on the seventh day from all his work which he had made* (Genesis 2:2) — the *rest of the holy sabbath* of 16:23 reaches back to the seventh day from creation.'
  FROM cross_reference_threads t
  JOIN _s305_ex16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=16 AND sv.verse_number=23
  JOIN _s305_ex16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-16-the-sabbath-given-before-sinai'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Elohim blessed the seventh day, and sanctified it* (Genesis 2:3) — the day Moses calls *the holy sabbath unto Yahuah* (16:23) was blessed and sanctified at the founding of the world.'
  FROM cross_reference_threads t
  JOIN _s305_ex16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=16 AND sv.verse_number=23
  JOIN _s305_ex16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-16-the-sabbath-given-before-sinai'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*in six days Yahuah made heaven and earth... and rested the seventh day: wherefore Yahuah blessed the sabbath day* (Exodus 20:11) — the Sabbath *Yahuah hath given you* in 16:29 is ratified at Sinai, grounded in creation; the people kept it BEFORE the fourth word was spoken.'
  FROM cross_reference_threads t
  JOIN _s305_ex16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=16 AND sv.verse_number=29
  JOIN _s305_ex16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-16-the-sabbath-given-before-sinai'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*call the sabbath a delight, the holy of Yahuah, honourable* (Isaiah 58:13) — the prophet summons Yashar''el to honour the very Sabbath given through the manna (16:29), kept and not abolished.'
  FROM cross_reference_threads t
  JOIN _s305_ex16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=16 AND sv.verse_number=29
  JOIN _s305_ex16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-16-the-sabbath-given-before-sinai'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*There remaineth therefore a rest to the people of Elohim* (Hebrews 4:9) — the seventh-day rest of 16:23 is not done away; it abides for the people of Yahuah.'
  FROM cross_reference_threads t
  JOIN _s305_ex16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=16 AND sv.verse_number=23
  JOIN _s305_ex16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-16-the-sabbath-given-before-sinai'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Six days will you labour, but on the seventh day is the Sabbath of Yahuah your Elohim* (Jubilees 50:7) — the restored witness keeps the same Sabbath-pattern of 16:23, set in the desert of Sinai between Elim and Sinai.'
  FROM cross_reference_threads t
  JOIN _s305_ex16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=16 AND sv.verse_number=23
  JOIN _s305_ex16_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=50 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-16-the-sabbath-given-before-sinai'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*save that you have prepared for yourselves on the sixth day, so as to eat, and drink, and rest, and keep Sabbath* (Jubilees 50:9) — the exact provision of 16:23: prepare on the sixth, rest on the seventh; the double-gathering is the same ordinance.'
  FROM cross_reference_threads t
  JOIN _s305_ex16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=16 AND sv.verse_number=23
  JOIN _s305_ex16_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=50 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-16-the-sabbath-given-before-sinai'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*wherein was the golden pot that had manna* (Hebrews 9:4) — the omer laid up *before Yahuah* (16:33) named in the ark, beside the tables of the covenant.'
  FROM cross_reference_threads t
  JOIN _s305_ex16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=16 AND sv.verse_number=33
  JOIN _s305_ex16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-16-a-pot-of-manna-before-the-testimony-the-hidden-manna'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*To him that overcometh will I give to eat of the hidden manna* (Revelation 2:17) — the manna laid up *before the Testimony, to be kept* (16:34) becomes the hidden bread reserved for the overcomer.'
  FROM cross_reference_threads t
  JOIN _s305_ex16_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=16 AND sv.verse_number=33
  JOIN _s305_ex16_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-16-a-pot-of-manna-before-the-testimony-the-hidden-manna'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_exodus_17.sql (Exodus 17) -----
-- Chapter: Exodus 17 — THE ROCK THAT GAVE WATER (Massah/Meribah) and AMALEK / the hands of Moses. At Rephidim there was no water; the people chided and tempted Yahuah — "Is Yahuah among us, or not?"; Yahuah stood upon the rock in Horeb and Moses smote it and water came out; the place named Massah and Meribah. Then Amalek came and fought Yashar'el; while Moses held up his hand Yashar'el prevailed, his hands stayed up by Aaron and Hur until the going down of the sun; Joshua discomfited Amalek. Yahuah bid Moses write it for a memorial — "I will utterly put out the remembrance of Amalek"; Moses built an altar, Yahuah Nissi, "Yahuah will have war with Amalek from generation to generation."
-- Tag: ex17   Temp view: _s305_ex17_lookup
-- Sort band: base 29400, step 3 -> threads at 29400, 29403, 29406, 29409 (4 threads)
-- Source of EVERY row: 'canon','exodus',17,v
--
-- Exodus 17 coverage:
--   v.1-4 (no water; chode with Moses; wherefore do ye tempt Yahuah; murmured; ready to stone me)
--        NT:     1 Corinthians 10:9-10 (Neither let us tempt Messiah... Neither murmur ye) — woven within THREAD 2's prose (the murmuring/tempting frame); not forced as a distinct member here (the load-bearing 10:4 sits in THREAD 1)
--        Extras: none warranted (Jasher 81:51 places them at Rephidim — narrative setting, used in THREAD 3; no water-strife verse)
--        Tanakh: the tempting is the Massah naming of v.7 — carried by THREAD 2 (Ps 95 / Deut 6 / Heb 3)
--   ★★★ v.5-6 (Behold, I will stand before thee there upon the rock in Horeb; thou shalt smite the rock, and there shall come water out of it)
--        NT:     1 Corinthians 10:4 (they drank of that spiritual Rock that followed them: and that Rock was Messiah) — THE KEYSTONE, THREAD 1; John 7:37-38 (If any man thirst, let him come unto me... out of his belly shall flow rivers of living water); John 4:14 (the water that I shall give him shall be in him a well of water springing up into everlasting life) — THREAD 1
--        Extras: Wisdom 11:4 (water was given them out of the flinty rock, and their thirst was quenched out of the hard stone) — THREAD 1 (clean rock-water parallel)
--        Tanakh: Psalm 78:15-16,20 (He clave the rocks... He brought streams also out of the rock... he smote the rock, that the waters gushed out); Psalm 105:41 (He opened the rock, and the waters gushed out); Psalm 114:8 (Which turned the rock into a standing water, the flint into a fountain of waters); Isaiah 48:21 (he clave the rock also, and the waters gushed out); Numbers 20:11 (Moses... smote the rock twice: and the water came out abundantly — the SECOND rock, lateral) — THREAD 1
--   ★★ v.7 (Massah, and Meribah... because they tempted Yahuah, saying, Is Yahuah among us, or not?)
--        NT:     Hebrews 3:8-9 (Harden not your hearts, as in the provocation, in the day of temptation in the wilderness: when your fathers tempted me); Matthew 4:7 (Thou shalt not tempt Yahuah Elohayka); Luke 4:12 (It is said, Thou shalt not tempt Yahuah Elohayka) — THREAD 2
--        Extras: none warranted (no clean Massah/Meribah witness in the restored library — Jubilees 48 carries the plagues/Mastema, not Rephidim)
--        Tanakh: Psalm 95:8-9 (Harden not your heart, as in the provocation, and as in the day of temptation in the wilderness: when your fathers tempted me); Deuteronomy 6:16 (Ye shall not tempt Yahuah Elohaychem, as ye tempted him in Massah) — THREAD 2
--   ★★ v.8-13 (Amalek fought; while Moses held up his hand Yashar'el prevailed; Aaron and Hur stayed up his hands until the going down of the sun; Joshua discomfited Amalek)
--        NT:     1 Timothy 2:8 (I will therefore that men pray every where, lifting up holy hands, without wrath and doubting) — THREAD 3 (the uplifted-hands intercession type, clean)
--        Extras: Jasher 81:52 (Amalek the son of Eliphaz... came to fight with Israel); Jasher 81:55 (the children of Israel smote Amalek... at the edge of the sword) — THREAD 3
--        Tanakh: Genesis 3:15 (I will put enmity between thee and the woman, and between thy seed and her seed) — THREAD 3 (the seed-war root); Deuteronomy 25:17-18 (Remember what Amalek did... smote the hindmost of thee... when thou wast faint and weary); 1 Samuel 15:2 (I remember that which Amalek did to Yashar'el, how he laid wait for him in the way) — THREAD 3
--   ★★ v.14-16 (Write this for a memorial... I will utterly put out the remembrance of Amalek; Yahuah Nissi; Yahuah will have war with Amalek from generation to generation)
--        NT:     none warranted distinct (the perpetual seed-war forward-weave is the Genesis 3:15 enmity carried in THREAD 3; no NT Amalek-memorial text)
--        Extras: Jasher 81:56 (Write this thing as a memorial... you shall utterly efface the remembrance of Amalek from under heaven); Jasher 81:60 (you shall blot out the remembrance of Amalek from under heaven, you shall not forget it) — THREAD 4
--        Tanakh: Deuteronomy 25:19 (thou shalt blot out the remembrance of Amalek from under heaven; thou shalt not forget it); 1 Samuel 15:3 (Now go and smite Amalek, and utterly destroy all that they have) — THREAD 4
--
-- Threads (slug — target libraries):
--   1. exodus-17-smite-the-rock-the-rock-was-messiah — NT (1 Corinthians, John x2) + Tanakh (Psalm 78, Psalm 105, Psalm 114, Isaiah 48, Numbers 20) + Extras (Wisdom of Solomon) [extras] (★★★ THE keystone: the smitten Rock = the Formed Son)
--   2. exodus-17-massah-and-meribah-harden-not-your-heart — NT (Hebrews, Matthew, Luke) + Tanakh (Psalm 95, Deuteronomy 6) [free] (★★ rest-forfeited-by-unbelief / tempting Yahuah)
--   3. exodus-17-amalek-fought-the-hands-of-moses-held-up — NT (1 Timothy) + Tanakh (Genesis 3, Deuteronomy 25, 1 Samuel 15) + Extras (Jasher) [extras] (★★ the seed-war; uplifted-hands intercession)
--   4. exodus-17-yahuah-nissi-war-with-amalek-generation-to-generation — Tanakh (Deuteronomy 25, 1 Samuel 15) + Extras (Jasher) [extras] (★★ Yahuah-nissi the banner; the perpetual seed-war)
--
-- Framing notes:
--   ★★★ THE KEYSTONE (THREAD 1): *Behold, I will stand before thee there upon the rock in Horeb; and thou shalt smite the rock, and there shall come water out of it* (17:6). Yahuah stands UPON the rock; the rock is smitten; water flows. Sha'ul names the rock outright: *they drank of that spiritual Rock that followed them: and that Rock was Messiah (Christ)* (1 Corinthians 10:4) — read through the Formed-and-the-Formless (Red Line #4): the One who stood on the rock in Horeb, the Formed Son, IS the smitten Rock from whom the living water flows; NOT a second co-equal person, NOT a collapse of Father and Son, but the Formed who appeared and led Yashar'el, struck once that the water of life might pour out. Yahusha fills it: *If any man thirst, let him come unto me, and drink* and *out of his belly shall flow rivers of living water* (John 7:37-38); *the water that I shall give him shall be... a well of water springing up into everlasting life* (John 4:14). Numbers 20:11 is held as the lateral SECOND rock — Moses *smote the rock twice* when bidden to SPEAK; the smitten-once rock here is the clean type, the second-rock smiting cost Moses the land (the type marred by striking again).
--   ★★ MASSAH AND MERIBAH (THREAD 2): *because they tempted Yahuah (LORD), saying, Is Yahuah (LORD) among us, or not?* (17:7). This is THE great warning text the whole library reaches back to. Psalm 95:8-9 sings it (*Harden not your heart, as in the provocation, and as in the day of temptation in the wilderness: when your fathers tempted me*); Hebrews 3:8-9 quotes the psalm as the Ruach HaKodesh's living word against an *evil heart of unbelief* that forfeits the rest; Deuteronomy 6:16 makes it law (*Ye shall not tempt Yahuah... as ye tempted him in Massah*) — the very verse Yahusha wields at His own wilderness temptation: *Thou shalt not tempt Yahuah Elohayka (the Lord thy God)* (Matthew 4:7 / Luke 4:12). Where Yashar'el tempted and fell, the Formed Son stood in the same wilderness and did not. ALL-CANON thread = tier 'free'.
--   ★★ AMALEK / THE HANDS OF MOSES (THREAD 3): *Then came Amalek, and fought with Yashar'el (Israel) in Rephidim* (17:8). Amalek is the standing seed-war enemy — the enmity of *thy seed and her seed* (Genesis 3:15) made flesh in the nation that struck *the hindmost... when thou wast faint and weary* (Deuteronomy 25:17-18). VICTIMS-NOT-ENEMIES (Red Line #7): the seed-war is against the SYSTEM that ambushes the weak, never an ethnic hatred. While Moses *held up his hand... Yashar'el prevailed* (17:11), his hands stayed by Aaron and Hur — the uplifted-hands intercession that wins the battle (1 Timothy 2:8, *lifting up holy hands*). Jasher 81:52,55 carries the war. EXTRAS thread = tier 'extras'.
--   ★★ YAHUAH NISSI / PERPETUAL WAR (THREAD 4): *Yahuah (LORD) will have war with Amalek from generation to generation* (17:16); the altar named *Yahuah Nissi (Jehovah-nissi)* — Yahuah my banner (17:15). The memorial of v.14 is renewed in Deuteronomy 25:19 (*thou shalt blot out the remembrance of Amalek... thou shalt not forget it*) and pressed on Saul in 1 Samuel 15:2-3 — the standing seed-war that runs the generations. Jasher 81:56,60 keeps the memorial verse-for-verse. EXTRAS thread = tier 'extras'.
--   VERSES WITH NO ADD: v.1-4 the water-strife setting and v.10,12 the battle-detail mechanics carry no distinct framework target beyond the threads above (the murmuring is the Massah/tempting carried by THREAD 2; the setting at Rephidim and the battle by THREAD 3) — no library silently skipped.
--   EXTRAS: Jubilees has NO Rephidim/Massah/Amalek material (ch48 = plagues + prince Mastema), so no Jubilees member — recorded as 'none warranted', not forced. Jasher DOUBLE-WRITTEN 'jasher','jasher'. Wisdom of Solomon single-edition 'apocrypha'/'the-wisdom-of-solomon'.

CREATE TEMP VIEW _s305_ex17_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★★): Smite the rock — the Rock was Messiah
    ('canon','exodus',17,6,'canon','1-corinthians',10,4,'free',
      E'*And did all drink the same spiritual drink: for they drank of that spiritual Rock that followed them: and that Rock was Messiah (Christ)* (1 Corinthians 10:4). This is the keystone of *Behold, I will stand before thee there upon the rock in Horeb; and thou shalt smite the rock, and there shall come water out of it* (Exodus 17:6). Read through the Formed-and-the-Formless: the One who STOOD upon the rock in Horeb is the Formed Son, and He is *that spiritual Rock* — smitten that the water of life might flow. Not a co-equal second person, not a collapse of Father and Son, but the Formed who led Yashar''el (Israel) in the wilderness, struck once that His people might drink.'),
    ('canon','exodus',17,6,'canon','john',7,37,'free',
      E'*In the last day, that great day of the feast, Yahusha (Jesus) stood and cried, saying, If any man thirst, let him come unto me, and drink* (John 7:37). The water from the smitten rock — *thou shalt smite the rock, and there shall come water out of it, that the people may drink* (Exodus 17:6) — is filled when Yahusha stands at the feast and calls the thirsty to Himself. The Rock that gave drink in Horeb is the One who now says *come unto me, and drink*.'),
    ('canon','exodus',17,6,'canon','john',7,38,'free',
      E'*He that believeth on me, as the scripture hath said, out of his belly shall flow rivers of living water* (John 7:38). The water that *come out of it, that the people may drink* (Exodus 17:6) is the living water Yahusha pours — *out of his belly shall flow rivers of living water*. What gushed from the rock in Horeb becomes the rivers that flow from the believer through the smitten Rock who is Messiah (Christ).'),
    ('canon','exodus',17,6,'canon','john',4,14,'free',
      E'*But whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life* (John 4:14). The water Moses drew from the rock quenched a day''s thirst; the water of *thou shalt smite the rock, and there shall come water out of it* (Exodus 17:6) is filled by the One who gives *a well of water springing up into everlasting life*. The smitten Rock gives the water that ends thirst forever.'),
    ('canon','exodus',17,6,'canon','psalms',78,15,'free',
      E'*He clave the rocks in the wilderness, and gave them drink as out of the great depths* (Psalm 78:15). The psalm sings the wonder of Exodus 17 — *thou shalt smite the rock, and there shall come water out of it* (17:6) — as Yahuah''s own deed: *He clave the rocks in the wilderness, and gave them drink*. The smiting of the rock by Moses'' hand was Yahuah''s cleaving, the water His gift to a thirsting people.'),
    ('canon','exodus',17,6,'canon','psalms',78,20,'free',
      E'*Behold, he smote the rock, that the waters gushed out, and the streams overflowed; can he give bread also? can he provide flesh for his people?* (Psalm 78:20). The psalm recalls the very act of *smite the rock, and there shall come water out of it* (Exodus 17:6) — *he smote the rock, that the waters gushed out* — and turns it into the wilderness''s unbelief: the same generation that drank from the rock still doubted whether He could provide. The provision of water testified that *Is Yahuah among us, or not?* was answered.'),
    ('canon','exodus',17,6,'canon','psalms',105,41,'free',
      E'*He opened the rock, and the waters gushed out; they ran in the dry places like a river* (Psalm 105:41). The covenant-psalm names the deed of Horeb — *thou shalt smite the rock, and there shall come water out of it* (Exodus 17:6) — as Yahuah remembering His holy promise to Abraham: *He opened the rock, and the waters gushed out*. The rock-water is sung as the faithfulness of the One who keeps His covenant in the dry places.'),
    ('canon','exodus',17,6,'canon','psalms',114,8,'free',
      E'*Which turned the rock into a standing water, the flint into a fountain of waters* (Psalm 114:8). The psalm of the Exodus marvels at *smite the rock, and there shall come water out of it* (Exodus 17:6) — *the flint into a fountain of waters*. The hardest stone becomes the source of life at Yahuah''s word; the smitten flint is made a fountain.'),
    ('canon','exodus',17,6,'canon','isaiah',48,21,'free',
      E'*And they thirsted not when he led them through the deserts: he caused the waters to flow out of the rock for them: he clave the rock also, and the waters gushed out* (Isaiah 48:21). The prophet reaches back to *thou shalt smite the rock, and there shall come water out of it, that the people may drink* (Exodus 17:6) as the seal of redeemed Yashar''el (Israel): *he clave the rock also, and the waters gushed out*. The rock-water of Horeb is the standing pledge that the led people *thirsted not*.'),
    ('canon','exodus',17,6,'canon','numbers',20,11,'free',
      E'*And Moses lifted up his hand, and with his rod he smote the rock twice: and the water came out abundantly, and the congregation drank, and their beasts also* (Numbers 20:11). This is the SECOND rock, the lateral — at Horeb Moses was bidden *smite the rock, and there shall come water out of it* (Exodus 17:6) and the type was clean, the rock struck once; but at Meribah-Kadesh, bidden to SPEAK to the rock, Moses *smote the rock twice* and the cost was the land. The first-smitten rock is the unmarred type; the twice-smitten marring is the warning beside it.'),
    ('canon','exodus',17,6,'apocrypha','the-wisdom-of-solomon',11,4,'extras',
      E'*When they were thirsty, they called upon you, and water was given them out of the flinty rock, and their thirst was quenched out of the hard stone* (Wisdom of Solomon 11:4). The restored witness keeps the wonder of *smite the rock, and there shall come water out of it, that the people may drink* (Exodus 17:6) — *water was given them out of the flinty rock... out of the hard stone*. The hard stone yielding water to the thirsting is the mercy that answered *Is Yahuah among us, or not?*'),

    -- THREAD 2 (★★): Massah and Meribah — harden not your heart
    ('canon','exodus',17,7,'canon','psalms',95,8,'free',
      E'*Harden not your heart, as in the provocation, and as in the day of temptation in the wilderness* (Psalm 95:8). The naming of *Massah, and Meribah... because they tempted Yahuah (LORD)* (Exodus 17:7) becomes the psalm''s living warning — *Harden not your heart, as in the provocation* (Massah = temptation, Meribah = strife). The place-names are made a perpetual call not to repeat the wilderness unbelief.'),
    ('canon','exodus',17,7,'canon','psalms',95,9,'free',
      E'*When your fathers tempted me, proved me, and saw my work* (Psalm 95:9). The very sin of *because they tempted Yahuah (LORD), saying, Is Yahuah (LORD) among us, or not?* (Exodus 17:7) is sung as the fathers'' guilt — *your fathers tempted me, proved me, and saw my work*. They put Yahuah to the test even as His works stood before their eyes; the rock had given water, yet they doubted His presence.'),
    ('canon','exodus',17,7,'canon','deuteronomy',6,16,'free',
      E'*Ye shall not tempt Yahuah Elohaychem (the LORD your God), as ye tempted him in Massah* (Deuteronomy 6:16). Moses makes the naming of *Massah... because they tempted Yahuah (LORD)* (Exodus 17:7) into binding Torah: *Ye shall not tempt Yahuah... as ye tempted him in Massah*. The place of the testing becomes the standing command never to test Him again.'),
    ('canon','exodus',17,7,'canon','hebrews',3,8,'free',
      E'*Harden not your hearts, as in the provocation, in the day of temptation in the wilderness* (Hebrews 3:8). The letter carries the Massah warning forward as the Ruach HaKodesh''s (Holy Spirit''s) living word — *Harden not your hearts, as in the provocation* — against an *evil heart of unbelief* that forfeits the rest. The tempting of *Is Yahuah among us, or not?* (Exodus 17:7) is the very hardness the new generation is warned not to repeat.'),
    ('canon','exodus',17,7,'canon','hebrews',3,9,'free',
      E'*When your fathers tempted me, proved me, and saw my works forty years* (Hebrews 3:9). The sin of *they tempted Yahuah (LORD), saying, Is Yahuah (LORD) among us, or not?* (Exodus 17:7) is named as the forty-year provocation — *your fathers tempted me, proved me, and saw my works*. They tested Him while His works were plain before them; the unbelief at Massah is the pattern Hebrews warns against unto the end.'),
    ('canon','exodus',17,7,'canon','matthew',4,7,'free',
      E'*Yahusha (Jesus) said unto him, It is written again, Thou shalt not tempt Yahuah Elohayka (the Lord thy God)* (Matthew 4:7). Where Yashar''el (Israel) *tempted Yahuah (LORD), saying, Is Yahuah (LORD) among us, or not?* (Exodus 17:7), the Formed Son stands in the same wilderness and answers the tempter with the Massah-law itself: *Thou shalt not tempt Yahuah Elohayka*. The temptation Yashar''el failed, He kept.'),
    ('canon','exodus',17,7,'canon','luke',4,12,'free',
      E'*And Yahusha (Jesus) answering said unto him, It is said, Thou shalt not tempt Yahuah Elohayka (the Lord thy God)* (Luke 4:12). The same Massah-word stands in Yahusha''s mouth against the tempter — *Thou shalt not tempt Yahuah Elohayka* — overturning the failure of *they tempted Yahuah (LORD), saying, Is Yahuah (LORD) among us, or not?* (Exodus 17:7). In the wilderness where the fathers tested Yahuah, the Formed Son refused to test Him.'),

    -- THREAD 3 (★★): Amalek fought — the hands of Moses held up
    ('canon','exodus',17,8,'canon','genesis',3,15,'free',
      E'*And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). The war of *Then came Amalek, and fought with Yashar''el (Israel) in Rephidim* (Exodus 17:8) is the enmity of Eden made flesh — *between thy seed and her seed*. Amalek is the standing seed-war enemy that strikes the people of promise; the battle at Rephidim is one front of the long enmity that runs the whole canon.'),
    ('canon','exodus',17,8,'canon','deuteronomy',25,17,'free',
      E'*Remember what Amalek did unto thee by the way, when ye were come forth out of Egypt* (Deuteronomy 25:17). Moses calls Yashar''el (Israel) to remember *Then came Amalek, and fought with Yashar''el in Rephidim* (Exodus 17:8) — *Remember what Amalek did unto thee by the way*. The Rephidim attack is sealed as a thing never to be forgotten.'),
    ('canon','exodus',17,8,'canon','deuteronomy',25,18,'free',
      E'*How he met thee by the way, and smote the hindmost of thee, even all that were feeble behind thee, when thou wast faint and weary; and he feared not Elohim (God)* (Deuteronomy 25:18). The character of the foe who *fought with Yashar''el (Israel) in Rephidim* (Exodus 17:8) is laid bare — he *smote the hindmost... all that were feeble behind thee, when thou wast faint and weary*. The seed-war strikes the weak and the lagging; the enmity is against a SYSTEM that preys on the faint, never an ethnic people.'),
    ('canon','exodus',17,8,'canon','1-samuel',15,2,'free',
      E'*Thus saith Yahuah Tseva''ot (LORD of hosts), I remember that which Amalek did to Yashar''el (Israel), how he laid wait for him in the way, when he came up from Egypt* (1 Samuel 15:2). Generations after *Then came Amalek, and fought with Yashar''el in Rephidim* (Exodus 17:8), Yahuah still remembers — *how he laid wait for him in the way*. The Rephidim ambush is not forgotten; the seed-war reckoning comes due in Saul''s day.'),
    ('canon','exodus',17,11,'canon','1-timothy',2,8,'free',
      E'*I will therefore that men pray every where, lifting up holy hands, without wrath and doubting* (1 Timothy 2:8). When *Moses held up his hand, that Yashar''el (Israel) prevailed* (Exodus 17:11), the battle was won not by the sword alone but by the uplifted hands of intercession — the type Sha''ul (Paul) names: *lifting up holy hands*. The hands raised to Yahuah, stayed by Aaron and Hur, are the prayer that turns the war.'),
    ('canon','exodus',17,8,'jasher','jasher',81,52,'extras',
      E'*And when the children of Israel were in Rephidim, Amalek the son of Eliphaz, the son of Esau, the brother of Zepho, came to fight with Israel* (Jasher 81:52). The extended witness names the foe of *Then came Amalek, and fought with Yashar''el (Israel) in Rephidim* (Exodus 17:8) — *Amalek the son of Eliphaz, the son of Esau*. The seed-war is traced to Esau''s line, the old enmity within the family of promise risen up against Yashar''el.'),
    ('canon','exodus',17,13,'jasher','jasher',81,55,'extras',
      E'*And the children of Israel smote Amalek and his people at the edge of the sword, but the battle was very sore upon the children of Israel* (Jasher 81:55). The extended witness keeps the victory of *Joshua discomfited Amalek and his people with the edge of the sword* (Exodus 17:13) — *Israel smote Amalek... at the edge of the sword, but the battle was very sore*. The seed-war is won, but at cost; the foe of the faint is overcome by the uplifted hands and the sword together.'),

    -- THREAD 4 (★★): Yahuah Nissi — war with Amalek from generation to generation
    ('canon','exodus',17,14,'canon','deuteronomy',25,19,'free',
      E'*Therefore it shall be, when Yahuah Elohayka (the LORD thy God) hath given thee rest from all thine enemies round about... thou shalt blot out the remembrance of Amalek from under heaven; thou shalt not forget it* (Deuteronomy 25:19). The memorial Yahuah bid be written — *I will utterly put out the remembrance of Amalek from under heaven* (Exodus 17:14) — is handed to the people as their charge: *thou shalt blot out the remembrance of Amalek... thou shalt not forget it*. What Yahuah swore to do, Yashar''el (Israel) is commanded never to forget.'),
    ('canon','exodus',17,16,'canon','1-samuel',15,3,'free',
      E'*Now go and smite Amalek, and utterly destroy all that they have, and spare them not; but slay both man and woman, infant and suckling, ox and sheep, camel and ass* (1 Samuel 15:3). The word that *Yahuah (LORD) will have war with Amalek from generation to generation* (Exodus 17:16) comes due in Saul''s commission — *go and smite Amalek*. The perpetual seed-war reaches the generation appointed to execute the long-sworn judgment on the system that ambushed the faint.'),
    ('canon','exodus',17,14,'jasher','jasher',81,56,'extras',
      E'*And Yahuah (the Lord) said to Moses, Write this thing as a memorial for you in a book, and place it in the hand of Joshua, the son of Nun, your servant... you shall utterly efface the remembrance of Amalek from under heaven* (Jasher 81:56). The extended witness keeps the command of *Write this for a memorial in a book, and rehearse it in the ears of Joshua: for I will utterly put out the remembrance of Amalek from under heaven* (Exodus 17:14) — *Write this thing as a memorial... place it in the hand of Joshua... efface the remembrance of Amalek*. The memorial is set down verse-for-verse.'),
    ('canon','exodus',17,16,'jasher','jasher',81,60,'extras',
      E'*Therefore it shall be when Yahuah your Elohim (the Lord your God) shall have given you rest from all your enemies round about... that you shall blot out the remembrance of Amalek from under heaven, you shall not forget it* (Jasher 81:60). The extended witness carries the charge that answers *Yahuah (LORD) will have war with Amalek from generation to generation* (Exodus 17:16) — *you shall blot out the remembrance of Amalek... you shall not forget it*. The perpetual war is bound to the day of rest in the inheritance.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex17_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex17_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-17-smite-the-rock-the-rock-was-messiah',
       E'Smite the rock — and that Rock was Messiah',
       E'At Rephidim there is no water, and the people chide: *Give us water that we may drink* (Exodus 17:2). Yahuah answers with a word that is the heart of the chapter: *Behold, I will stand before thee there upon the rock in Horeb; and thou shalt smite the rock, and there shall come water out of it, that the people may drink* (Exodus 17:6). Yahuah stands UPON the rock; the rock is smitten; the water flows to a dying people. Sha''ul (Paul) names what the rock was: *they drank of that spiritual Rock that followed them: and that Rock was Messiah (Christ)* (1 Corinthians 10:4). Read through the Formed-and-the-Formless: the One who stood on the rock in Horeb — the Formed Son who appeared and led Yashar''el (Israel) — IS the smitten Rock, struck once that the water of life might pour out; not a co-equal second person, not a collapse of Father and Son, but the Formed who took flesh and was smitten. Yahusha (Jesus) fills the type: *If any man thirst, let him come unto me, and drink* and *out of his belly shall flow rivers of living water* (John 7:37-38); *the water that I shall give him shall be in him a well of water springing up into everlasting life* (John 4:14). The Tanakh sings the wonder again and again: *He clave the rocks in the wilderness, and gave them drink* and *he smote the rock, that the waters gushed out* (Psalm 78:15,20); *He opened the rock, and the waters gushed out* (Psalm 105:41); *the flint into a fountain of waters* (Psalm 114:8); *he clave the rock also, and the waters gushed out* (Isaiah 48:21). Beside this clean type stands the lateral warning of the second rock: bidden to SPEAK to the rock, Moses *smote the rock twice* (Numbers 20:11) and it cost him the land — the type marred by a second striking. The restored witness keeps the mercy entire: *water was given them out of the flinty rock, and their thirst was quenched out of the hard stone* (Wisdom of Solomon 11:4). The hard stone yielding water to the thirsting is the answer to *Is Yahuah among us, or not?* — He was, and He is the Rock.',
       sv.verse_id, ev.verse_id, 'extras', 29400
  FROM _s305_ex17_lookup sv, _s305_ex17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=17 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=17 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-17-massah-and-meribah-harden-not-your-heart',
       E'Massah and Meribah — harden not your heart',
       E'*And he called the name of the place Massah, and Meribah, because of the chiding of the children of Yashar''el (Israel), and because they tempted Yahuah (LORD), saying, Is Yahuah (LORD) among us, or not?* (Exodus 17:7). Massah is "temptation," Meribah is "strife" — the place where a redeemed people, fresh from the sea and the manna, put Yahuah to the test even as His works stood before their eyes. The whole library reaches back to this naming as THE great warning. The psalmist sings it: *Harden not your heart, as in the provocation, and as in the day of temptation in the wilderness: when your fathers tempted me, proved me, and saw my work* (Psalm 95:8-9). Moses makes it binding Torah: *Ye shall not tempt Yahuah Elohaychem (the LORD your God), as ye tempted him in Massah* (Deuteronomy 6:16). The letter to the Hebrews carries the psalm forward as the Ruach HaKodesh''s (Holy Spirit''s) living word against an *evil heart of unbelief*: *Harden not your hearts, as in the provocation, in the day of temptation in the wilderness: when your fathers tempted me, proved me, and saw my works forty years* (Hebrews 3:8-9) — the generation that tempted at Massah forfeited the rest. And when the Formed Son stands in the same wilderness, He wields the Massah-law itself against the tempter: *Thou shalt not tempt Yahuah Elohayka (the Lord thy God)* (Matthew 4:7; Luke 4:12). Where Yashar''el tempted and fell, Yahusha (Jesus) was tempted and stood. The naming at Rephidim is the abiding call: do not harden the heart; do not ask *Is Yahuah among us, or not?* when His works are plain.',
       sv.verse_id, ev.verse_id, 'free', 29403
  FROM _s305_ex17_lookup sv, _s305_ex17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=17 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=17 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-17-amalek-fought-the-hands-of-moses-held-up',
       E'Amalek fought — the hands of Moses held up (the seed-war)',
       E'*Then came Amalek, and fought with Yashar''el (Israel) in Rephidim* (Exodus 17:8). Amalek is no ordinary foe: he is the standing seed-war enemy, the enmity of Eden made flesh — *I will put enmity... between thy seed and her seed* (Genesis 3:15). Deuteronomy lays bare his character: *How he met thee by the way, and smote the hindmost of thee, even all that were feeble behind thee, when thou wast faint and weary; and he feared not Elohim (God)* (Deuteronomy 25:17-18) — the seed-war strikes the weak, the lagging, the faint. The lens holds VICTIMS-NOT-ENEMIES: the war is against a SYSTEM that preys on the helpless, never an ethnic people. Yahuah remembers it generations later — *I remember that which Amalek did to Yashar''el, how he laid wait for him in the way* (1 Samuel 15:2). And the battle is won not by the sword alone: *when Moses held up his hand, that Yashar''el (Israel) prevailed: and when he let down his hand, Amalek prevailed* (Exodus 17:11), his hands stayed by Aaron and Hur until the going down of the sun. Sha''ul (Paul) names the type: *I will therefore that men pray every where, lifting up holy hands, without wrath and doubting* (1 Timothy 2:8) — the uplifted hands of intercession that turn the war. The restored witness traces the foe to Esau''s line and keeps the victory: *Amalek the son of Eliphaz, the son of Esau... came to fight with Israel* (Jasher 81:52); *the children of Israel smote Amalek and his people at the edge of the sword, but the battle was very sore* (Jasher 81:55). The old enmity within the family of promise rises against Yashar''el, and is overcome by the sword below and the lifted hands above.',
       sv.verse_id, ev.verse_id, 'extras', 29406
  FROM _s305_ex17_lookup sv, _s305_ex17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=17 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=17 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-17-yahuah-nissi-war-with-amalek-generation-to-generation',
       E'Yahuah Nissi — war with Amalek from generation to generation',
       E'When the battle is won, Yahuah seals it with a memorial and a name: *Write this for a memorial in a book, and rehearse it in the ears of Joshua: for I will utterly put out the remembrance of Amalek from under heaven* (Exodus 17:14). Moses builds an altar and names it *Yahuah Nissi (Jehovah-nissi)* — Yahuah my banner (Exodus 17:15) — *For he said, Because Yahuah (LORD) hath sworn that Yahuah (LORD) will have war with Amalek from generation to generation* (Exodus 17:16). This is the perpetual seed-war, sworn by Yahuah''s own oath. The charge is handed to the people: *thou shalt blot out the remembrance of Amalek from under heaven; thou shalt not forget it* (Deuteronomy 25:19) — what Yahuah swore to do, Yashar''el (Israel) is commanded never to forget. And the reckoning comes due in Saul''s generation: *Now go and smite Amalek, and utterly destroy all that they have, and spare them not* (1 Samuel 15:3). The restored witness keeps the memorial entire: *Write this thing as a memorial for you in a book, and place it in the hand of Joshua... you shall utterly efface the remembrance of Amalek from under heaven* (Jasher 81:56), and binds it to the day of rest in the inheritance: *when Yahuah your Elohim shall have given you rest from all your enemies round about... you shall blot out the remembrance of Amalek from under heaven, you shall not forget it* (Jasher 81:60). Yahuah is the banner over His people in a war that runs the generations until the seed of the serpent is put out from under heaven.',
       sv.verse_id, ev.verse_id, 'extras', 29409
  FROM _s305_ex17_lookup sv, _s305_ex17_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=17 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=17 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*they drank of that spiritual Rock that followed them: and that Rock was Messiah (Christ)* (1 Corinthians 10:4) — THE keystone: the One who stood upon the rock in Horeb (17:6) is the Formed Son, the smitten Rock from whom living water flows.'
  FROM cross_reference_threads t
  JOIN _s305_ex17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=17 AND sv.verse_number=6
  JOIN _s305_ex17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-17-smite-the-rock-the-rock-was-messiah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*If any man thirst, let him come unto me, and drink* (John 7:37) — the smitten rock that gave drink (17:6) is the One who now calls the thirsty to Himself.'
  FROM cross_reference_threads t
  JOIN _s305_ex17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=17 AND sv.verse_number=6
  JOIN _s305_ex17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=7 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-17-smite-the-rock-the-rock-was-messiah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*out of his belly shall flow rivers of living water* (John 7:38) — the water from the rock (17:6) is the living water Yahusha (Jesus) pours through the believer.'
  FROM cross_reference_threads t
  JOIN _s305_ex17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=17 AND sv.verse_number=6
  JOIN _s305_ex17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=7 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-17-smite-the-rock-the-rock-was-messiah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the water that I shall give him shall be in him a well of water springing up into everlasting life* (John 4:14) — the smitten Rock (17:6) gives the water that ends thirst forever.'
  FROM cross_reference_threads t
  JOIN _s305_ex17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=17 AND sv.verse_number=6
  JOIN _s305_ex17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=4 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-17-smite-the-rock-the-rock-was-messiah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*He clave the rocks in the wilderness, and gave them drink as out of the great depths* (Psalm 78:15) — the smiting of the rock (17:6) sung as Yahuah''s own cleaving.'
  FROM cross_reference_threads t
  JOIN _s305_ex17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=17 AND sv.verse_number=6
  JOIN _s305_ex17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-17-smite-the-rock-the-rock-was-messiah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*he smote the rock, that the waters gushed out, and the streams overflowed; can he give bread also?* (Psalm 78:20) — the very act of 17:6, turned into the wilderness''s unbelief: they drank yet still doubted.'
  FROM cross_reference_threads t
  JOIN _s305_ex17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=17 AND sv.verse_number=6
  JOIN _s305_ex17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-17-smite-the-rock-the-rock-was-messiah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*He opened the rock, and the waters gushed out; they ran in the dry places like a river* (Psalm 105:41) — the deed of 17:6 sung as Yahuah keeping His covenant in the dry places.'
  FROM cross_reference_threads t
  JOIN _s305_ex17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=17 AND sv.verse_number=6
  JOIN _s305_ex17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=105 AND tv.verse_number=41
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-17-smite-the-rock-the-rock-was-messiah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*Which turned the rock into a standing water, the flint into a fountain of waters* (Psalm 114:8) — the hardest stone (17:6) made the source of life at Yahuah''s word.'
  FROM cross_reference_threads t
  JOIN _s305_ex17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=17 AND sv.verse_number=6
  JOIN _s305_ex17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=114 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-17-smite-the-rock-the-rock-was-messiah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*he caused the waters to flow out of the rock for them: he clave the rock also, and the waters gushed out* (Isaiah 48:21) — the rock-water of Horeb (17:6) as the pledge that the led people thirsted not.'
  FROM cross_reference_threads t
  JOIN _s305_ex17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=17 AND sv.verse_number=6
  JOIN _s305_ex17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=48 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-17-smite-the-rock-the-rock-was-messiah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'*Moses... with his rod he smote the rock twice: and the water came out abundantly* (Numbers 20:11) — the lateral SECOND rock: bidden to SPEAK, Moses smote twice and lost the land; the once-smitten rock of 17:6 is the clean type, this the marring.'
  FROM cross_reference_threads t
  JOIN _s305_ex17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=17 AND sv.verse_number=6
  JOIN _s305_ex17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=20 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-17-smite-the-rock-the-rock-was-messiah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 11, E'*water was given them out of the flinty rock, and their thirst was quenched out of the hard stone* (Wisdom of Solomon 11:4) — the restored witness keeps the mercy of 17:6: the hard stone yielding water, answering *Is Yahuah among us, or not?*'
  FROM cross_reference_threads t
  JOIN _s305_ex17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=17 AND sv.verse_number=6
  JOIN _s305_ex17_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=11 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-17-smite-the-rock-the-rock-was-messiah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Harden not your heart, as in the provocation, and as in the day of temptation in the wilderness* (Psalm 95:8) — the naming of Massah and Meribah (17:7) made a perpetual call not to repeat the unbelief.'
  FROM cross_reference_threads t
  JOIN _s305_ex17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=17 AND sv.verse_number=7
  JOIN _s305_ex17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=95 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-17-massah-and-meribah-harden-not-your-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*When your fathers tempted me, proved me, and saw my work* (Psalm 95:9) — the sin of 17:7 sung as the fathers'' guilt: they tested Yahuah even as His works stood before them.'
  FROM cross_reference_threads t
  JOIN _s305_ex17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=17 AND sv.verse_number=7
  JOIN _s305_ex17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=95 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-17-massah-and-meribah-harden-not-your-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Ye shall not tempt Yahuah Elohaychem (the LORD your God), as ye tempted him in Massah* (Deuteronomy 6:16) — the naming of 17:7 made binding Torah: never test Him as at Massah.'
  FROM cross_reference_threads t
  JOIN _s305_ex17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=17 AND sv.verse_number=7
  JOIN _s305_ex17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-17-massah-and-meribah-harden-not-your-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Harden not your hearts, as in the provocation, in the day of temptation in the wilderness* (Hebrews 3:8) — the Massah warning of 17:7 carried as the Ruach HaKodesh''s living word against the heart of unbelief that forfeits the rest.'
  FROM cross_reference_threads t
  JOIN _s305_ex17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=17 AND sv.verse_number=7
  JOIN _s305_ex17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=3 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-17-massah-and-meribah-harden-not-your-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*When your fathers tempted me, proved me, and saw my works forty years* (Hebrews 3:9) — the tempting of 17:7 named as the forty-year provocation: testing Him while His works were plain.'
  FROM cross_reference_threads t
  JOIN _s305_ex17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=17 AND sv.verse_number=7
  JOIN _s305_ex17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=3 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-17-massah-and-meribah-harden-not-your-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*It is written again, Thou shalt not tempt Yahuah Elohayka (the Lord thy God)* (Matthew 4:7) — the Formed Son wields the Massah-law of 17:7 against the tempter in the same wilderness; what Yashar''el failed, He kept.'
  FROM cross_reference_threads t
  JOIN _s305_ex17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=17 AND sv.verse_number=7
  JOIN _s305_ex17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=4 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-17-massah-and-meribah-harden-not-your-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*It is said, Thou shalt not tempt Yahuah Elohayka (the Lord thy God)* (Luke 4:12) — the same Massah-word (17:7) in Yahusha''s mouth, overturning the fathers'' failure in the wilderness where they tested Yahuah.'
  FROM cross_reference_threads t
  JOIN _s305_ex17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=17 AND sv.verse_number=7
  JOIN _s305_ex17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=4 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-17-massah-and-meribah-harden-not-your-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I will put enmity... between thy seed and her seed* (Genesis 3:15) — the war of Amalek at Rephidim (17:8) is the enmity of Eden made flesh; Amalek the standing seed-war foe.'
  FROM cross_reference_threads t
  JOIN _s305_ex17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=17 AND sv.verse_number=8
  JOIN _s305_ex17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-17-amalek-fought-the-hands-of-moses-held-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Remember what Amalek did unto thee by the way, when ye were come forth out of Egypt* (Deuteronomy 25:17) — the Rephidim attack (17:8) sealed as a thing never to be forgotten.'
  FROM cross_reference_threads t
  JOIN _s305_ex17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=17 AND sv.verse_number=8
  JOIN _s305_ex17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-17-amalek-fought-the-hands-of-moses-held-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*he... smote the hindmost of thee, even all that were feeble behind thee, when thou wast faint and weary* (Deuteronomy 25:18) — the foe of 17:8 laid bare: the seed-war strikes the weak; the enmity is against a SYSTEM that preys on the faint, never a people.'
  FROM cross_reference_threads t
  JOIN _s305_ex17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=17 AND sv.verse_number=8
  JOIN _s305_ex17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-17-amalek-fought-the-hands-of-moses-held-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*I remember that which Amalek did to Yashar''el (Israel), how he laid wait for him in the way* (1 Samuel 15:2) — generations after Rephidim (17:8) Yahuah still remembers the ambush.'
  FROM cross_reference_threads t
  JOIN _s305_ex17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=17 AND sv.verse_number=8
  JOIN _s305_ex17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=15 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-17-amalek-fought-the-hands-of-moses-held-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*I will therefore that men pray every where, lifting up holy hands, without wrath and doubting* (1 Timothy 2:8) — when Moses held up his hand Yashar''el prevailed (17:11): the uplifted-hands intercession that turns the war.'
  FROM cross_reference_threads t
  JOIN _s305_ex17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=17 AND sv.verse_number=11
  JOIN _s305_ex17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=2 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-17-amalek-fought-the-hands-of-moses-held-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Amalek the son of Eliphaz, the son of Esau... came to fight with Israel* (Jasher 81:52) — the foe of 17:8 traced to Esau''s line: the old enmity within the family of promise.'
  FROM cross_reference_threads t
  JOIN _s305_ex17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=17 AND sv.verse_number=8
  JOIN _s305_ex17_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=81 AND tv.verse_number=52
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-17-amalek-fought-the-hands-of-moses-held-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*the children of Israel smote Amalek and his people at the edge of the sword, but the battle was very sore* (Jasher 81:55) — the victory of 17:13 kept entire; the seed-war won at cost.'
  FROM cross_reference_threads t
  JOIN _s305_ex17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=17 AND sv.verse_number=13
  JOIN _s305_ex17_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=81 AND tv.verse_number=55
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-17-amalek-fought-the-hands-of-moses-held-up'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*thou shalt blot out the remembrance of Amalek from under heaven; thou shalt not forget it* (Deuteronomy 25:19) — the memorial Yahuah bid written (17:14) handed to the people as their charge.'
  FROM cross_reference_threads t
  JOIN _s305_ex17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=17 AND sv.verse_number=14
  JOIN _s305_ex17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=25 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-17-yahuah-nissi-war-with-amalek-generation-to-generation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Now go and smite Amalek, and utterly destroy all that they have* (1 Samuel 15:3) — the perpetual war of 17:16 (*war with Amalek from generation to generation*) come due in Saul''s commission.'
  FROM cross_reference_threads t
  JOIN _s305_ex17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=17 AND sv.verse_number=16
  JOIN _s305_ex17_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=15 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-17-yahuah-nissi-war-with-amalek-generation-to-generation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Write this thing as a memorial for you in a book, and place it in the hand of Joshua... efface the remembrance of Amalek from under heaven* (Jasher 81:56) — the command of 17:14 set down verse-for-verse in the restored witness.'
  FROM cross_reference_threads t
  JOIN _s305_ex17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=17 AND sv.verse_number=14
  JOIN _s305_ex17_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=81 AND tv.verse_number=56
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-17-yahuah-nissi-war-with-amalek-generation-to-generation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*when Yahuah your Elohim shall have given you rest from all your enemies... you shall blot out the remembrance of Amalek from under heaven, you shall not forget it* (Jasher 81:60) — the perpetual war of 17:16 bound to the day of rest in the inheritance.'
  FROM cross_reference_threads t
  JOIN _s305_ex17_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=17 AND sv.verse_number=16
  JOIN _s305_ex17_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=81 AND tv.verse_number=60
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-17-yahuah-nissi-war-with-amalek-generation-to-generation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session305 — Exodus cross-references complete.'
