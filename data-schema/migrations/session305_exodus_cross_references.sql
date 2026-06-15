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

-- ----- fragment: minion_exodus_13.sql (Exodus 13) -----
-- Chapter: Exodus 13 — SANCTIFY THE FIRSTBORN; the feast of Unleavened Bread (seven days, no leaven seen); the sign on the hand and frontlets between the eyes (that Yahuah's torah may be in thy mouth); the redemption of the firstborn (every firstling of an ass redeemed with a lamb, all the firstborn of man redeemed); Elohim leads them not by the way of the Philistines but about by the wilderness of the Red sea; Moses takes the bones of Joseph; Yahuah goes before them in a pillar of cloud by day and a pillar of fire by night.
-- Tag: ex13   Temp view: _s305_ex13_lookup   Session prefix: s305
-- Sort band: base 29300, step 3 -> threads at 29300, 29303, 29306, 29309, 29312 (5 threads)
-- Source of EVERY row: 'canon','exodus',13,v
--
-- Exodus 13 coverage:
--   ★★ v.2,11-15 (Sanctify unto me all the firstborn, whatsoever openeth the womb... it is mine; set apart all that openeth the matrix; every firstling of an ass redeem with a lamb; all the firstborn of man among thy children shalt thou redeem; for Yahuah slew all the firstborn of Egypt — therefore I sacrifice... but all the firstborn of my children I redeem)
--        NT:     ★ Luke 2:22-23 (they brought him to Jerusalem, to present him to Yahuah... Every male that openeth the womb shall be called holy to Yahuah — quoted OF Yahusha's presentation) — THREAD 1 (the firstborn-redeemed type, Yahusha presented under THIS ordinance); Colossians 1:15 (the firstborn of every creature — lateral); Hebrews 12:23 (the church of the firstborn, which are written in heaven — lateral)
--        Extras: none warranted distinct (Jubilees/Jasher carry the going-out and Passover-night, not a clean firstborn-redemption clause; framed in prose, not forced as members)
--        Tanakh: ★ Numbers 3:12-13 (I have taken the Levites... instead of all the firstborn that openeth the matrix... for on the day that I smote all the firstborn in Egypt I hallowed unto me all the firstborn); Numbers 8:17 (all the firstborn of the children of Yashar'el are mine... I sanctified them for myself) — THREAD 1 (the Levites taken IN STEAD of the firstborn; the substitution/redemption order)
--   ★ v.3-10 (Remember this day; no leavened bread eaten; this day came ye out in the month Abib; seven days thou shalt eat unleavened bread, in the seventh day a feast to Yahuah; no leaven seen in all thy quarters; keep this ordinance in his season from year to year)
--        NT:     ★ 1 Corinthians 5:7-8 (Messiah our passover is sacrificed for us... let us keep the feast... with the unleavened bread of sincerity and truth — lateral, the feast KEPT not abolished) — THREAD 2
--        Extras: ★ Jubilees 49:21 (the festival of unleavened bread, that they should eat unleavened bread seven days... that they should observe its festival); Jubilees 49:23 (you celebrated this festival with haste when you went forth from Egypt) — THREAD 2
--        Tanakh: ★ Leviticus 23:6 (on the fifteenth day of the same month is the feast of unleavened bread unto Yahuah: seven days ye must eat unleavened bread); Deuteronomy 16:3 (seven days shalt thou eat unleavened bread... even the bread of affliction; for thou camest forth out of Egypt in haste) — THREAD 2 (the appointed time on the moedim calendar, the teaching-ordinance kept in its season)
--   ★★ v.8-9,16 (thou shalt shew thy son... it shall be for a sign upon thine hand, and for a memorial between thine eyes, that Yahuah's torah may be in thy mouth; a token upon thine hand and frontlets between thine eyes)
--        NT:     none warranted distinct (the bind-the-word forward-weave is the Torah-on-the-heart of Jer 31/Ezek 36, belongs to its own pack; no clean NT member here, framed in prose)
--        Extras: none warranted distinct (no clean parse of the sign/frontlets ordinance in the extras for this verse-block; framed in prose)
--        Tanakh: ★★ Deuteronomy 6:6-8 (these words... shall be in thine heart... bind them for a sign upon thine hand, and they shall be as frontlets between thine eyes); Deuteronomy 11:18 (lay up these my words in your heart... bind them for a sign upon your hand, that they may be as frontlets between your eyes); Psalm 78:4-5 (we will not hide them from their children... he established a testimony in Jacob, and appointed a law in Yashar'el... that they should make them known to their children) — THREAD 3 (Torah-affirmed: the word bound on hand and eyes, taught to the children, kept in the mouth)
--   v.17-18 (Elohim led them not through the way of the Philistines, although near... but led them about, through the way of the wilderness of the Red sea; went up harnessed)
--        NT:     none warranted (the leading is narrative here; the cloud-leading is THREAD 5)
--        Extras: Jasher 81 narrative parallel of the going-out (not framework-load-bearing for the leading-route itself)
--        Tanakh: none warranted distinct (the shepherd-leading is carried by THREAD 5's pillar)
--   ★★ v.19 (Moses took the bones of Joseph with him: for he had straitly sworn the children of Yashar'el, saying, Elohim will surely visit you; and ye shall carry up my bones away hence with you)
--        NT:     ★ Hebrews 11:22 (By faith Joseph, when he died, made mention of the departing of the children of Yashar'el; and gave commandment concerning his bones) — THREAD 4 (the oath kept by faith)
--        Extras: ★ Jasher 80:62 (Moses hastened and rose up and went to the river of Egypt, and brought up from there the coffin of Joseph and took it with him) — THREAD 4
--        Tanakh: ★ Genesis 50:25 (Joseph took an oath... Elohim will surely visit you, and ye shall carry up my bones from hence); Joshua 24:32 (the bones of Joseph... buried they in Shechem... it became the inheritance of the children of Joseph); ★★ Ezekiel 37:19 (I will take the stick of Joseph, which is in the hand of Ephraim... and make them one stick — the two-house hope) — THREAD 4
--   ★★ v.21-22 (Yahuah went before them by day in a pillar of a cloud, to lead them the way; and by night in a pillar of fire, to give them light; he took not away the pillar of the cloud by day, nor the pillar of fire by night)
--        NT:     ★ 1 Corinthians 10:1-2 (all our fathers were under the cloud, and all passed through the sea; and were all baptized unto Moses in the cloud and in the sea) — THREAD 5 (the Presence = the Formed Son, Red Line #4)
--        Extras: ★ Wisdom of Solomon 18:3 (you gavest them a burning pillar of fire, both to be a guide of the unknown journey, and an harmless sun) — THREAD 5
--        Tanakh: ★ Nehemiah 9:12 (thou leddest them in the day by a cloudy pillar; and in the night by a pillar of fire); Nehemiah 9:19 (the pillar of the cloud departed not from them by day... neither the pillar of fire by night); Isaiah 4:5 (Yahuah will create upon mount Zion... a cloud and smoke by day, and the shining of a flaming fire by night — lateral) — THREAD 5
--
-- Threads (slug — target libraries):
--   1. exodus-13-sanctify-unto-me-all-the-firstborn-the-redeemed-firstborn — NT (Luke, Colossians, Hebrews) + Tanakh (Numbers) [free] (★★ the firstborn-redeemed type; Yahusha presented under this ordinance; the Levites taken in stead)
--   2. exodus-13-the-feast-of-unleavened-bread-seven-days-the-appointed-time-kept — NT (1 Corinthians) + Tanakh (Leviticus, Deuteronomy) + Extras (Jubilees) [extras] (★ the appointed time KEPT, the teaching-ordinance not abolished)
--   3. exodus-13-a-sign-upon-thine-hand-and-frontlets-the-torah-in-thy-mouth — Tanakh (Deuteronomy, Psalm) [free] (★★ Torah-affirmed: the word bound on hand and eyes, taught to the children)
--   4. exodus-13-the-bones-of-joseph-the-two-house-hope-of-return — NT (Hebrews) + Tanakh (Genesis, Joshua, Ezekiel) + Extras (Jasher) [extras] (★★ two-house: Joseph/Ephraim carried up, the promise of return, the two sticks made one)
--   5. exodus-13-the-pillar-of-cloud-and-fire-the-presence-went-before-them — NT (1 Corinthians) + Tanakh (Nehemiah, Isaiah) + Extras (Wisdom of Solomon) [extras] (★★ the Presence leading = the Formed Son, the Glory of bush and Sinai)
--
-- Framing notes:
--   ★★ THE REDEEMED FIRSTBORN (THREAD 1): *Sanctify unto me all the firstborn... it is mine* (13:2) and *all the firstborn of man among thy children shalt thou redeem* (13:13). This ties directly to the Passover-firstborn-spared of ch12: because Yahuah slew Egypt's firstborn and spared Yashar'el's under the blood, Yashar'el's firstborn are HIS, claimed and then redeemed. The NT names Yahusha presented under THIS very ordinance: *they brought him to Jerusalem, to present him to Yahuah... Every male that openeth the womb shall be called holy to Yahuah* (Luke 2:22-23) — the Firstborn brought to the temple under the firstborn-law. Numbers 3:12-13 / 8:17 give the substitution: the Levites taken IN STEAD of the firstborn. Colossians 1:15 / Hebrews 12:23 are lateral firstborn-language (the firstborn of every creature; the church of the firstborn) — framed as the firstborn-theme widening, NOT co-equal-persons grammar.
--   ★ THE FEAST KEPT (THREAD 2): *Seven days thou shalt eat unleavened bread* (13:6), *keep this ordinance in his season from year to year* (13:10). The appointed time on Yahuah's calendar (Red Line #3): Leviticus 23:6 sets it on the moedim, Deuteronomy 16:3 names the bread of affliction, and 1 Corinthians 5:7-8 keeps it FULFILLED, not abolished — *let us keep the feast... with the unleavened bread of sincerity and truth*. A teaching-ordinance kept in its season, never retired. Jubilees 49:21,23 carry the seven-day festival and the haste.
--   ★★ THE SIGN AND THE FRONTLETS (THREAD 3): *it shall be for a sign upon thine hand, and for a memorial between thine eyes, that Yahuah's torah may be in thy mouth* (13:9,16). Torah-affirmed (Red Lines #6; 1 John 2:3-4 filter): Deuteronomy 6:6-8 and 11:18 echo the binding for a sign on the hand and frontlets between the eyes, and Psalm 78:4-5 the testimony taught to the children. The torah is to be in the mouth, on the hand, before the eyes, taught to the son — the living covenant-word, not a defunct law. (The Torah-on-the-heart forward-weave Jer 31 / Ezek 36 belongs to its own pack; framed in prose only.)
--   ★★ THE BONES OF JOSEPH / TWO-HOUSE HOPE (THREAD 4): *Moses took the bones of Joseph with him* (13:19), the oath of Genesis 50:25 kept — *Elohim will surely visit you, and ye shall carry up my bones from hence*. Hebrews 11:22 names it faith; Joshua 24:32 buries them in Shechem in the inheritance of the children of Joseph. The framework reads Joseph = the northern house / Ephraim (Red Lines #1,#2): the bones of Joseph carried up to the land are the pledge of the northern house's return, bound to Ezekiel 37:19 — *the stick of Joseph, which is in the hand of Ephraim... and make them one stick*. The promise of return for the scattered house. Jasher 80:62 keeps Moses bringing up the coffin.
--   ★★ THE PILLAR OF CLOUD AND FIRE (THREAD 5): *Yahuah went before them by day in a pillar of a cloud... and by night in a pillar of fire* (13:21). The Presence that leads is the Formed Son (Red Line #4) — the same Glory of the bush and of Sinai, the One who bears the Name and goes before His people. 1 Corinthians 10:1-2 reads it: *all our fathers were under the cloud... and were all baptized unto Moses in the cloud and in the sea*. Nehemiah 9:12,19 sing the unceasing pillar; Isaiah 4:5 (lateral) sees the cloud-and-fire restored over Zion. Wisdom of Solomon 18:3 — *a burning pillar of fire... an harmless sun*.
--   EXTRAS: Jubilees 49:21,23 (edition 'jubilees', book 'jubilees', DOUBLE-WRITTEN) carry the seven-day unleavened festival and the haste of the going-out, clean. Jasher 80:62 (edition 'jasher', book 'jasher', DOUBLE-WRITTEN) carries Moses bringing up the coffin of Joseph, clean; note the Jasher parse reads "Israel" (not "Yashar'el") and "Joseph" — quoted exactly as returned. Wisdom of Solomon 18:3 (edition 'apocrypha', book 'the-wisdom-of-solomon', NOT double-written) carries the burning pillar of fire, clean.
--   VERSES WITH NO ADD: v.17-18 (Elohim led them not by the way of the Philistines but about by the wilderness of the Red sea; went up harnessed) — the leading-route is narrative and the shepherd-leading is carried by THREAD 5's pillar; v.20 (took their journey from Succoth, encamped in Etham) — an itinerary notice, no framework-bearing distinct target warranted in this pack.

CREATE TEMP VIEW _s305_ex13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): Sanctify unto me all the firstborn — the redeemed firstborn
    ('canon','exodus',13,2,'canon','luke',2,23,'free',
      E'*(As it is written in the law of Yahuah (Lord), Every male that openeth the womb shall be called holy to Yahuah (Lord);)* (Luke 2:23). The command *Sanctify unto me all the firstborn, whatsoever openeth the womb among the children of Yashar''el (Israel)... it is mine* (Exodus 13:2) is the very ordinance under which Yahusha (Jesus) is brought to the temple — *Every male that openeth the womb shall be called holy to Yahuah*. The Firstborn Son is presented under the firstborn-law given at the going-out; the type given here is filled in the One *called holy to Yahuah*.'),
    ('canon','exodus',13,2,'canon','luke',2,22,'free',
      E'*And when the days of her purification according to the law of Moses were accomplished, they brought him to Jerusalem, to present him to Yahuah (Lord)* (Luke 2:22). The setting-apart of *all the firstborn, whatsoever openeth the womb... it is mine* (Exodus 13:2) is kept to the letter — *they brought him to Jerusalem, to present him to Yahuah* — the parents doing for the firstborn child *after the custom of the law*. The ordinance of Exodus 13 is not retired but obeyed in the presentation of the Firstborn.'),
    ('canon','exodus',13,13,'canon','colossians',1,15,'free',
      E'*Who is the image of the invisible Elohim (God), the firstborn of every creature* (Colossians 1:15). The redemption-law — *all the firstborn of man among thy children shalt thou redeem* (Exodus 13:13) — runs into the great firstborn-title: the Formed Son is *the image of the invisible Elohim, the firstborn of every creature*. The firstborn claimed and redeemed in Yashar''el (Israel) foreshadows the One who is Himself the Firstborn, the image of the Father drawn from the Formless — the heir, not a first creature.'),
    ('canon','exodus',13,2,'canon','hebrews',12,23,'free',
      E'*To the general assembly and church of the firstborn, which are written in heaven, and to Elohim (God) the Judge of all, and to the spirits of just men made perfect* (Hebrews 12:23). The firstborn *sanctified unto me... it is mine* (Exodus 13:2) widens to the whole gathered people named *the church of the firstborn, which are written in heaven*. The ones claimed as Yahuah''s own at the going-out are the figure of the assembly of the firstborn, set apart and written above.'),
    ('canon','exodus',13,13,'canon','numbers',3,12,'free',
      E'*And I, behold, I have taken the Levites from among the children of Yashar''el (Israel) instead of all the firstborn that openeth the matrix among the children of Yashar''el (Israel); therefore the Levites shall be mine* (Numbers 3:12). The redemption of *all the firstborn of man among thy children shalt thou redeem* (Exodus 13:13) is carried out by substitution: the Levites *taken... instead of all the firstborn that openeth the matrix*. The firstborn that is Yahuah''s is redeemed by another taken in his place — the pattern of one set apart in the stead of the claimed.'),
    ('canon','exodus',13,15,'canon','numbers',3,13,'free',
      E'*Because all the firstborn are mine; for on the day that I smote all the firstborn in the land of Egypt I hallowed unto me all the firstborn in Yashar''el (Israel), both man and beast: mine shall they be: I am Yahuah (LORD)* (Numbers 3:13). The reason given in *when Pharaoh would hardly let us go... Yahuah (LORD) slew all the firstborn in the land of Egypt... therefore I sacrifice to Yahuah all that openeth the matrix* (Exodus 13:15) is named again: the firstborn of Yashar''el are Yahuah''s *for on the day that I smote all the firstborn in Egypt I hallowed unto me all the firstborn*. The Passover-night sparing is the ground of the firstborn-claim.'),
    ('canon','exodus',13,15,'canon','numbers',8,17,'free',
      E'*For all the firstborn of the children of Yashar''el (Israel) are mine, both man and beast: on the day that I smote every firstborn in the land of Egypt I sanctified them for myself* (Numbers 8:17). The word *Yahuah (LORD) slew all the firstborn in the land of Egypt, both the firstborn of man, and the firstborn of beast: therefore I sacrifice to Yahuah all that openeth the matrix* (Exodus 13:15) is restated: *all the firstborn... are mine... on the day that I smote every firstborn in Egypt I sanctified them for myself*. The judgment that fell on Egypt sets apart Yashar''el''s firstborn as Yahuah''s portion forever.'),

    -- THREAD 2 (★): The feast of unleavened bread, seven days — the appointed time kept
    ('canon','exodus',13,6,'canon','leviticus',23,6,'free',
      E'*And on the fifteenth day of the same month is the feast of unleavened bread unto Yahuah (LORD): seven days ye must eat unleavened bread* (Leviticus 23:6). The command *Seven days thou shalt eat unleavened bread, and in the seventh day shall be a feast to Yahuah (LORD)* (Exodus 13:6) is set on Yahuah''s calendar of appointed times: *the feast of unleavened bread unto Yahuah: seven days ye must eat unleavened bread*. The seven-day feast given at the going-out is one of the moedim, the seasons of Yahuah kept throughout the generations.'),
    ('canon','exodus',13,3,'canon','deuteronomy',16,3,'free',
      E'*Thou shalt eat no leavened bread with it; seven days shalt thou eat unleavened bread therewith, even the bread of affliction; for thou camest forth out of the land of Egypt in haste: that thou mayest remember the day when thou camest forth out of the land of Egypt all the days of thy life* (Deuteronomy 16:3). The charge *Remember this day, in which ye came out from Egypt... there shall no leavened bread be eaten* (Exodus 13:3) is named again as *the bread of affliction... for thou camest forth out of Egypt in haste*. The unleavened bread is bound to the memory of the going-out, the feast kept *all the days of thy life*.'),
    ('canon','exodus',13,6,'canon','1-corinthians',5,7,'free',
      E'*Purge out therefore the old leaven, that ye may be a new lump, as ye are unleavened. For even Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7). The seven-day removal of leaven — *Seven days thou shalt eat unleavened bread... there shall no leaven be seen with thee in all thy quarters* (Exodus 13:6-7) — is read forward by Sha''ul (Paul): *purge out therefore the old leaven... Messiah our passover is sacrificed for us*. The Lamb is slain, and the unleavened walk goes on; the feast is fulfilled and lived, not abolished.'),
    ('canon','exodus',13,7,'canon','1-corinthians',5,8,'free',
      E'*Therefore let us keep the feast, not with old leaven, neither with the leaven of malice and wickedness; but with the unleavened bread of sincerity and truth* (1 Corinthians 5:8). Against every reading that retires the appointed time, Sha''ul (Paul) says plainly *let us keep the feast* — answering *there shall no leavened bread be seen with thee, neither shall there be leaven seen with thee in all thy quarters* (Exodus 13:7). The leaven put out of every quarter is the leaven of malice put out of the heart; the feast of unleavened bread is kept in sincerity and truth.'),
    ('canon','exodus',13,6,'jubilees','jubilees',49,21,'extras',
      E'*And do you, Moses, command the children of Yashar''el (Israel) to observe the ordinances of the passover... and the festival of unleavened bread, that they should eat unleavened bread seven days, (and) that they should observe its festival, and that they bring an oblation every day during those seven days of joy before Yahuah (God)* (Jubilees 49:21). The restored witness keeps the command of *Seven days thou shalt eat unleavened bread, and in the seventh day shall be a feast to Yahuah (LORD)* (Exodus 13:6) — *the festival of unleavened bread... eat unleavened bread seven days... observe its festival*. The seven-day appointed time is a standing ordinance, kept with joy before Yahuah.'),
    ('canon','exodus',13,3,'jubilees','jubilees',49,23,'extras',
      E'*For you celebrated this festival with haste when you went forth from Egypt till you entered into the wilderness of Shur; for on the shore of the sea you completed it* (Jubilees 49:23). The charge *Remember this day, in which ye came out from Egypt, out of the house of bondage; for by strength of hand Yahuah (LORD) brought you out* (Exodus 13:3) is echoed in the restored witness — *you celebrated this festival with haste when you went forth from Egypt*. The hurried going-out is the very thing the feast remembers, kept as a memorial of the deliverance.'),

    -- THREAD 3 (★★): A sign upon thine hand and frontlets — that Yahuah's torah may be in thy mouth
    ('canon','exodus',13,9,'canon','deuteronomy',6,8,'free',
      E'*And thou shalt bind them for a sign upon thine hand, and they shall be as frontlets between thine eyes* (Deuteronomy 6:8). The word *it shall be for a sign unto thee upon thine hand, and for a memorial between thine eyes, that the LORD''S law may be in thy mouth* (Exodus 13:9) is taken up whole in the Shema: *bind them for a sign upon thine hand, and they shall be as frontlets between thine eyes*. The torah of Yahuah is to be bound on the hand and set before the eyes — the living covenant-word carried on the body and kept in the heart, not a law laid aside.'),
    ('canon','exodus',13,9,'canon','deuteronomy',6,6,'free',
      E'*And these words, which I command thee this day, shall be in thine heart* (Deuteronomy 6:6). The aim of the sign on the hand — *that the LORD''S law may be in thy mouth* (Exodus 13:9) — is the same aim as *these words, which I command thee this day, shall be in thine heart*. What is bound on the hand and set before the eyes is first laid up in the heart and spoken in the mouth; the torah is to dwell in the inward man and be taught diligently to the children.'),
    ('canon','exodus',13,16,'canon','deuteronomy',11,18,'free',
      E'*Therefore shall ye lay up these my words in your heart and in your soul, and bind them for a sign upon your hand, that they may be as frontlets between your eyes* (Deuteronomy 11:18). The repeated charge *it shall be for a token upon thine hand, and for frontlets between thine eyes* (Exodus 13:16) is given again word for word: *bind them for a sign upon your hand, that they may be as frontlets between your eyes*. The token on the hand and the frontlets between the eyes are the words of Yahuah laid up in the soul, the covenant-instruction worn and remembered.'),
    ('canon','exodus',13,8,'canon','psalms',78,4,'free',
      E'*We will not hide them from their children, shewing to the generation to come the praises of Yahuah (LORD), and his strength, and his wonderful works that he hath done* (Psalm 78:4). The command *thou shalt shew thy son in that day, saying, This is done because of that which Yahuah (LORD) did unto me when I came forth out of Egypt* (Exodus 13:8) is the heart of the psalm''s charge — *we will not hide them from their children, shewing to the generation to come... his wonderful works*. The going-out is told to the son; the testimony is handed down.'),
    ('canon','exodus',13,8,'canon','psalms',78,5,'free',
      E'*For he established a testimony in Jacob, and appointed a law in Yashar''el (Israel), which he commanded our fathers, that they should make them known to their children* (Psalm 78:5). The duty *thou shalt shew thy son in that day* (Exodus 13:8) is named as the very purpose of the law: *he established a testimony in Jacob, and appointed a law in Yashar''el... that they should make them known to their children*. The torah and the testimony of the deliverance are taught from father to son, generation to generation.'),

    -- THREAD 4 (★★): The bones of Joseph — the two-house hope of return
    ('canon','exodus',13,19,'canon','genesis',50,25,'free',
      E'*And Joseph took an oath of the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you, and ye shall carry up my bones from hence* (Genesis 50:25). The act *Moses took the bones of Joseph with him: for he had straitly sworn the children of Yashar''el... Elohim (God) will surely visit you; and ye shall carry up my bones away hence with you* (Exodus 13:19) keeps the dying oath of Joseph exactly — *Elohim will surely visit you, and ye shall carry up my bones from hence*. The visitation Joseph foresaw has come; the bones are carried up toward the land of the promise.'),
    ('canon','exodus',13,19,'canon','hebrews',11,22,'free',
      E'*By faith Joseph, when he died, made mention of the departing of the children of Yashar''el (Israel); and gave commandment concerning his bones* (Hebrews 11:22). The oath behind *he had straitly sworn the children of Yashar''el... ye shall carry up my bones away hence with you* (Exodus 13:19) is named as faith: Joseph *by faith... made mention of the departing of the children of Yashar''el; and gave commandment concerning his bones*. The dying Joseph trusted the going-out would come, and bound his sons to carry his bones to the land — faith in the visitation of Yahuah.'),
    ('canon','exodus',13,19,'canon','joshua',24,32,'free',
      E'*And the bones of Joseph, which the children of Yashar''el (Israel) brought up out of Egypt, buried they in Shechem, in a parcel of ground which Jacob bought of the sons of Hamor... and it became the inheritance of the children of Joseph* (Joshua 24:32). What begins in *Moses took the bones of Joseph with him* (Exodus 13:19) is completed when *the bones of Joseph... buried they in Shechem... and it became the inheritance of the children of Joseph*. The bones carried out of Egypt come to rest in the inheritance of the house of Joseph — the northern house brought home to the land.'),
    ('canon','exodus',13,19,'canon','ezekiel',37,19,'free',
      E'*Say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the stick of Joseph, which is in the hand of Ephraim, and the tribes of Yashar''el (Israel) his fellows, and will put them with him, even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19). The carrying-up of *the bones of Joseph* (Exodus 13:19) is the pledge of the northern house''s hope, which the prophet seals: *the stick of Joseph, which is in the hand of Ephraim... and the stick of Yahudah... make them one stick*. Joseph''s bones brought out of Egypt are a sign of Ephraim gathered and joined again to Yahudah — the two houses made one in Yahuah''s hand.'),
    ('canon','exodus',13,19,'jasher','jasher',80,62,'extras',
      E'*And Moses hastened and rose up and went to the river of Egypt, and brought up from there the coffin of Joseph and took it with him* (Jasher 80:62). The extended witness keeps the deed of *Moses took the bones of Joseph with him* (Exodus 13:19) — *Moses hastened... and brought up from there the coffin of Joseph and took it with him*. On the very night of the going-out Moses sees to the oath, carrying up the coffin of Joseph that the dying patriarch''s word might be kept.'),

    -- THREAD 5 (★★): The pillar of cloud and fire — the Presence went before them
    ('canon','exodus',13,21,'canon','1-corinthians',10,1,'free',
      E'*Moreover, brethren, I would not that ye should be ignorant, how that all our fathers were under the cloud, and all passed through the sea* (1 Corinthians 10:1). The leading *Yahuah (LORD) went before them by day in a pillar of a cloud, to lead them the way* (Exodus 13:21) is what Sha''ul (Paul) names: *all our fathers were under the cloud, and all passed through the sea*. The pillar that went before Yashar''el (Israel) is the cloud under which the whole people walked — the Presence leading them out.'),
    ('canon','exodus',13,21,'canon','1-corinthians',10,2,'free',
      E'*And were all baptized unto Moses in the cloud and in the sea* (1 Corinthians 10:2). The pillar that led by day and gave light by night — *a pillar of a cloud, to lead them the way; and by night in a pillar of fire, to give them light* (Exodus 13:21) — is read as a baptism: the fathers *all baptized unto Moses in the cloud and in the sea*. The cloud that is the Presence of Yahuah brings the people through; the Formed Son who bears the Name goes before them, the same Glory that filled the bush and would descend on Sinai.'),
    ('canon','exodus',13,21,'canon','nehemiah',9,12,'free',
      E'*Moreover thou leddest them in the day by a cloudy pillar; and in the night by a pillar of fire, to give them light in the way wherein they should go* (Nehemiah 9:12). The Levites'' confession remembers *Yahuah (LORD) went before them by day in a pillar of a cloud... and by night in a pillar of fire, to give them light* (Exodus 13:21) almost word for word — *thou leddest them in the day by a cloudy pillar; and in the night by a pillar of fire*. The leading-Presence of the going-out is sung as Yahuah''s own faithfulness to His people.'),
    ('canon','exodus',13,22,'canon','nehemiah',9,19,'free',
      E'*Yet thou in thy manifold mercies forsookest them not in the wilderness: the pillar of the cloud departed not from them by day, to lead them in the way; neither the pillar of fire by night* (Nehemiah 9:19). The word *He took not away the pillar of the cloud by day, nor the pillar of fire by night, from before the people* (Exodus 13:22) is confessed again: *the pillar of the cloud departed not from them by day... neither the pillar of fire by night*. The unceasing Presence is the mercy that did not forsake them in the wilderness.'),
    ('canon','exodus',13,21,'canon','isaiah',4,5,'free',
      E'*And Yahuah (LORD) will create upon every dwelling place of mount Zion, and upon her assemblies, a cloud and smoke by day, and the shining of a flaming fire by night: for upon all the glory shall be a defence* (Isaiah 4:5). The pillar *a cloud, to lead them the way; and by night... a pillar of fire* (Exodus 13:21) is taken up by the prophet as the restored canopy over Zion — *a cloud and smoke by day, and the shining of a flaming fire by night*. The leading-Presence of the wilderness becomes the abiding glory and defence over the gathered assemblies.'),
    ('canon','exodus',13,21,'apocrypha','the-wisdom-of-solomon',18,3,'extras',
      E'*Instead of which you gavest them a burning pillar of fire, both to be a guide of the unknown journey, and an harmless sun to entertain them honourably* (Wisdom of Solomon 18:3). The night-pillar *by night in a pillar of fire, to give them light* (Exodus 13:21) is sung as Yahuah''s gift — *a burning pillar of fire, both to be a guide of the unknown journey, and an harmless sun*. The fire that led Yashar''el (Israel) through the dark is the guiding Presence, a sun that did not scorch, lighting the unknown road.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-13-sanctify-unto-me-all-the-firstborn-the-redeemed-firstborn',
       E'Sanctify unto me all the firstborn — the redeemed firstborn',
       E'The night the firstborn of Egypt were smitten and the firstborn of Yashar''el (Israel) were spared under the blood, Yahuah lays His claim: *Sanctify unto me all the firstborn, whatsoever openeth the womb among the children of Yashar''el (Israel), both of man and of beast: it is mine* (Exodus 13:2). Because they were spared, they are His — and so they must be redeemed: *every firstling of an ass thou shalt redeem with a lamb... and all the firstborn of man among thy children shalt thou redeem* (Exodus 13:13), *for... Yahuah (LORD) slew all the firstborn in the land of Egypt... therefore I sacrifice to Yahuah all that openeth the matrix, being males; but all the firstborn of my children I redeem* (Exodus 13:15). The Torah carries out the claim by substitution: *I have taken the Levites from among the children of Yashar''el (Israel) instead of all the firstborn that openeth the matrix... therefore the Levites shall be mine* (Numbers 3:12), *for all the firstborn of the children of Yashar''el are mine... on the day that I smote every firstborn in Egypt I sanctified them for myself* (Numbers 8:17) — one tribe taken in the stead of the claimed firstborn. And the great fulfillment: when the time came, the Firstborn Son was brought to the temple under this very ordinance — *they brought him to Jerusalem, to present him to Yahuah (Lord)... Every male that openeth the womb shall be called holy to Yahuah (Lord)* (Luke 2:22-23). The firstborn-theme widens to the One who is Himself *the image of the invisible Elohim (God), the firstborn of every creature* (Colossians 1:15) — the heir, the image of the Father drawn from the Formless, not a first creature — and to the whole gathered people, *the general assembly and church of the firstborn, which are written in heaven* (Hebrews 12:23). The firstborn spared at Passover, claimed and redeemed, is the figure of the Firstborn given and the firstborn-people set apart.',
       sv.verse_id, ev.verse_id, 'free', 29300
  FROM _s305_ex13_lookup sv, _s305_ex13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=13 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-13-the-feast-of-unleavened-bread-seven-days-the-appointed-time-kept',
       E'The feast of unleavened bread, seven days — the appointed time kept',
       E'The going-out is to be remembered by a feast, kept every year in its season: *Remember this day, in which ye came out from Egypt, out of the house of bondage; for by strength of hand Yahuah (LORD) brought you out from this place: there shall no leavened bread be eaten* (Exodus 13:3). *Seven days thou shalt eat unleavened bread, and in the seventh day shall be a feast to Yahuah (LORD)* (Exodus 13:6); *there shall no leaven be seen with thee in all thy quarters* (Exodus 13:7); *thou shalt therefore keep this ordinance in his season from year to year* (Exodus 13:10). This is one of the moedim, the appointed times of Yahuah: *on the fifteenth day of the same month is the feast of unleavened bread unto Yahuah (LORD): seven days ye must eat unleavened bread* (Leviticus 23:6); *seven days shalt thou eat unleavened bread therewith, even the bread of affliction; for thou camest forth out of the land of Egypt in haste* (Deuteronomy 16:3). And the feast is not retired in the Besorah (Gospel) but fulfilled and kept: *purge out therefore the old leaven, that ye may be a new lump... for even Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7); *therefore let us keep the feast, not with old leaven... but with the unleavened bread of sincerity and truth* (1 Corinthians 5:8). The leaven put out of every quarter is the leaven of malice put out of the heart. The restored witness keeps the seven-day festival as a standing ordinance — *the festival of unleavened bread, that they should eat unleavened bread seven days... that they should observe its festival* (Jubilees 49:21) — remembering the haste of the going-out: *you celebrated this festival with haste when you went forth from Egypt* (Jubilees 49:23). A teaching-ordinance kept in its season, never abolished.',
       sv.verse_id, ev.verse_id, 'extras', 29303
  FROM _s305_ex13_lookup sv, _s305_ex13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=13 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-13-a-sign-upon-thine-hand-and-frontlets-the-torah-in-thy-mouth',
       E'A sign upon thine hand and frontlets between thine eyes — that Yahuah''s torah may be in thy mouth',
       E'The deliverance is to be taught and worn and spoken: *thou shalt shew thy son in that day, saying, This is done because of that which Yahuah (LORD) did unto me when I came forth out of Egypt* (Exodus 13:8); *and it shall be for a sign unto thee upon thine hand, and for a memorial between thine eyes, that the LORD''S law may be in thy mouth* (Exodus 13:9); *it shall be for a token upon thine hand, and for frontlets between thine eyes* (Exodus 13:16). The torah of Yahuah is to be bound on the hand, set before the eyes, kept in the mouth, and taught to the son. The Shema takes up the same words: *and these words, which I command thee this day, shall be in thine heart* (Deuteronomy 6:6), *and thou shalt bind them for a sign upon thine hand, and they shall be as frontlets between thine eyes* (Deuteronomy 6:8); and again, *lay up these my words in your heart and in your soul, and bind them for a sign upon your hand, that they may be as frontlets between your eyes* (Deuteronomy 11:18). The psalmist names the duty of telling the son: *we will not hide them from their children, shewing to the generation to come the praises of Yahuah (LORD), and his strength, and his wonderful works that he hath done* (Psalm 78:4); *for he established a testimony in Jacob, and appointed a law in Yashar''el (Israel)... that they should make them known to their children* (Psalm 78:5). The torah is the living covenant-word — laid up in the heart, worn on the body, declared in the mouth, handed down to the children — never a law set aside.',
       sv.verse_id, ev.verse_id, 'free', 29306
  FROM _s305_ex13_lookup sv, _s305_ex13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=13 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-13-the-bones-of-joseph-the-two-house-hope-of-return',
       E'The bones of Joseph — the two-house hope of return',
       E'In the very hour of the going-out, one act keeps a promise two centuries old: *And Moses took the bones of Joseph with him: for he had straitly sworn the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you; and ye shall carry up my bones away hence with you* (Exodus 13:19). Joseph had bound his brethren by oath as he died: *Joseph took an oath of the children of Yashar''el (Israel), saying, Elohim (God) will surely visit you, and ye shall carry up my bones from hence* (Genesis 50:25). The letter to the Hebrews names it faith: *By faith Joseph, when he died, made mention of the departing of the children of Yashar''el (Israel); and gave commandment concerning his bones* (Hebrews 11:22) — Joseph trusted the visitation would come. And it is completed in the land: *the bones of Joseph, which the children of Yashar''el (Israel) brought up out of Egypt, buried they in Shechem... and it became the inheritance of the children of Joseph* (Joshua 24:32). The extended witness keeps the deed: *Moses hastened and rose up and went to the river of Egypt, and brought up from there the coffin of Joseph and took it with him* (Jasher 80:62). The framework hears in this the hope of the northern house, for Joseph is Ephraim, the house scattered and to be gathered — and the prophet seals it: *I will take the stick of Joseph, which is in the hand of Ephraim, and the tribes of Yashar''el (Israel) his fellows... even with the stick of Yahudah (Judah), and make them one stick, and they shall be one in mine hand* (Ezekiel 37:19). The bones of Joseph carried out of Egypt and brought home to the land are the pledge of the two houses made one — Ephraim gathered, joined again to Yahudah, the promise of return kept by the One who surely visits His people.',
       sv.verse_id, ev.verse_id, 'extras', 29309
  FROM _s305_ex13_lookup sv, _s305_ex13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=13 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-13-the-pillar-of-cloud-and-fire-the-presence-went-before-them',
       E'The pillar of cloud and fire — the Presence went before them',
       E'Yahuah does not send His people into the wilderness alone; He goes before them Himself: *And Yahuah (LORD) went before them by day in a pillar of a cloud, to lead them the way; and by night in a pillar of fire, to give them light; to go by day and night* (Exodus 13:21); *He took not away the pillar of the cloud by day, nor the pillar of fire by night, from before the people* (Exodus 13:22). This leading-Presence is the Formed Son — the same Glory that burned in the bush and would descend on Sinai, the One who bears the Name and walks before Yashar''el (Israel). Sha''ul (Paul) reads the cloud as the people''s very deliverance: *all our fathers were under the cloud, and all passed through the sea* (1 Corinthians 10:1), *and were all baptized unto Moses in the cloud and in the sea* (1 Corinthians 10:2). The Levites confess the unceasing pillar: *thou leddest them in the day by a cloudy pillar; and in the night by a pillar of fire, to give them light in the way wherein they should go* (Nehemiah 9:12); *the pillar of the cloud departed not from them by day... neither the pillar of fire by night* (Nehemiah 9:19). The prophet sees the canopy restored over the gathered assemblies: *Yahuah (LORD) will create upon every dwelling place of mount Zion... a cloud and smoke by day, and the shining of a flaming fire by night: for upon all the glory shall be a defence* (Isaiah 4:5). And the restored witness sings the fire as gift: *you gavest them a burning pillar of fire, both to be a guide of the unknown journey, and an harmless sun to entertain them honourably* (Wisdom of Solomon 18:3). The cloud by day, the fire by night — the abiding Presence of Yahuah leading His people through the dark, the Formed Son going before them all the way.',
       sv.verse_id, ev.verse_id, 'extras', 29312
  FROM _s305_ex13_lookup sv, _s305_ex13_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=13 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Every male that openeth the womb shall be called holy to Yahuah (Lord)* (Luke 2:23) — the firstborn-law of 13:2 quoted of Yahusha presented at the temple; the Firstborn under the ordinance.'
  FROM cross_reference_threads t
  JOIN _s305_ex13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=2
  JOIN _s305_ex13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=2 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-13-sanctify-unto-me-all-the-firstborn-the-redeemed-firstborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*they brought him to Jerusalem, to present him to Yahuah (Lord)* (Luke 2:22) — the setting-apart of *all the firstborn... it is mine* (13:2) obeyed in the presentation of the Firstborn Son.'
  FROM cross_reference_threads t
  JOIN _s305_ex13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=2
  JOIN _s305_ex13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=2 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-13-sanctify-unto-me-all-the-firstborn-the-redeemed-firstborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I have taken the Levites... instead of all the firstborn that openeth the matrix... therefore the Levites shall be mine* (Numbers 3:12) — the redemption of 13:13 carried out by substitution: one tribe taken in the firstborn''s stead.'
  FROM cross_reference_threads t
  JOIN _s305_ex13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=13
  JOIN _s305_ex13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=3 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-13-sanctify-unto-me-all-the-firstborn-the-redeemed-firstborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*all the firstborn are mine; for on the day that I smote all the firstborn in Egypt I hallowed unto me all the firstborn in Yashar''el (Israel)* (Numbers 3:13) — the Passover-night sparing (13:15) is the ground of the firstborn-claim.'
  FROM cross_reference_threads t
  JOIN _s305_ex13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=15
  JOIN _s305_ex13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=3 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-13-sanctify-unto-me-all-the-firstborn-the-redeemed-firstborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*all the firstborn of the children of Yashar''el (Israel) are mine... I sanctified them for myself* (Numbers 8:17) — the firstborn smiting of 13:15 sets apart Yashar''el''s firstborn as Yahuah''s portion.'
  FROM cross_reference_threads t
  JOIN _s305_ex13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=15
  JOIN _s305_ex13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=8 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-13-sanctify-unto-me-all-the-firstborn-the-redeemed-firstborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*the image of the invisible Elohim (God), the firstborn of every creature* (Colossians 1:15) — the redeemed firstborn of 13:13 widens to the One who is Himself the Firstborn, the image of the Father, the heir (not a first creature).'
  FROM cross_reference_threads t
  JOIN _s305_ex13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=13
  JOIN _s305_ex13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='colossians' AND tv.chapter_number=1 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-13-sanctify-unto-me-all-the-firstborn-the-redeemed-firstborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*the general assembly and church of the firstborn, which are written in heaven* (Hebrews 12:23) — the firstborn claimed as Yahuah''s own (13:2) is the figure of the whole firstborn-people, written above.'
  FROM cross_reference_threads t
  JOIN _s305_ex13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=2
  JOIN _s305_ex13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-13-sanctify-unto-me-all-the-firstborn-the-redeemed-firstborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the feast of unleavened bread unto Yahuah (LORD): seven days ye must eat unleavened bread* (Leviticus 23:6) — the seven-day feast of 13:6 set on Yahuah''s calendar of appointed times.'
  FROM cross_reference_threads t
  JOIN _s305_ex13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=6
  JOIN _s305_ex13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-13-the-feast-of-unleavened-bread-seven-days-the-appointed-time-kept'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*seven days shalt thou eat unleavened bread... even the bread of affliction; for thou camest forth out of Egypt in haste* (Deuteronomy 16:3) — *Remember this day* (13:3): the unleavened bread bound to the memory of the going-out.'
  FROM cross_reference_threads t
  JOIN _s305_ex13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=3
  JOIN _s305_ex13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=16 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-13-the-feast-of-unleavened-bread-seven-days-the-appointed-time-kept'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Messiah (Christ) our passover is sacrificed for us* (1 Corinthians 5:7) — the seven-day purge of leaven (13:6-7) fulfilled and lived in the Lamb slain; the feast not abolished.'
  FROM cross_reference_threads t
  JOIN _s305_ex13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=6
  JOIN _s305_ex13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=5 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-13-the-feast-of-unleavened-bread-seven-days-the-appointed-time-kept'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*therefore let us keep the feast... with the unleavened bread of sincerity and truth* (1 Corinthians 5:8) — answering *no leaven seen with thee in all thy quarters* (13:7): the feast KEPT, the leaven of malice put out of the heart.'
  FROM cross_reference_threads t
  JOIN _s305_ex13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=7
  JOIN _s305_ex13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=5 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-13-the-feast-of-unleavened-bread-seven-days-the-appointed-time-kept'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the festival of unleavened bread, that they should eat unleavened bread seven days... that they should observe its festival* (Jubilees 49:21) — the seven-day feast of 13:6 kept as a standing ordinance with joy before Yahuah.'
  FROM cross_reference_threads t
  JOIN _s305_ex13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=6
  JOIN _s305_ex13_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=49 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-13-the-feast-of-unleavened-bread-seven-days-the-appointed-time-kept'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*you celebrated this festival with haste when you went forth from Egypt* (Jubilees 49:23) — echoing *Remember this day, in which ye came out from Egypt* (13:3): the feast remembers the hurried going-out.'
  FROM cross_reference_threads t
  JOIN _s305_ex13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=3
  JOIN _s305_ex13_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=49 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-13-the-feast-of-unleavened-bread-seven-days-the-appointed-time-kept'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*bind them for a sign upon thine hand, and they shall be as frontlets between thine eyes* (Deuteronomy 6:8) — the sign and frontlets of 13:9 taken up whole in the Shema: the torah worn on hand and eyes.'
  FROM cross_reference_threads t
  JOIN _s305_ex13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=9
  JOIN _s305_ex13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-13-a-sign-upon-thine-hand-and-frontlets-the-torah-in-thy-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*these words, which I command thee this day, shall be in thine heart* (Deuteronomy 6:6) — the aim of *that Yahuah''s torah may be in thy mouth* (13:9): the word laid up in the heart and spoken.'
  FROM cross_reference_threads t
  JOIN _s305_ex13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=9
  JOIN _s305_ex13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=6 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-13-a-sign-upon-thine-hand-and-frontlets-the-torah-in-thy-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*bind them for a sign upon your hand, that they may be as frontlets between your eyes* (Deuteronomy 11:18) — the token and frontlets of 13:16 given again word for word.'
  FROM cross_reference_threads t
  JOIN _s305_ex13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=16
  JOIN _s305_ex13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=11 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-13-a-sign-upon-thine-hand-and-frontlets-the-torah-in-thy-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*we will not hide them from their children, shewing to the generation to come... his wonderful works* (Psalm 78:4) — *thou shalt shew thy son in that day* (13:8): the going-out told to the son.'
  FROM cross_reference_threads t
  JOIN _s305_ex13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=8
  JOIN _s305_ex13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-13-a-sign-upon-thine-hand-and-frontlets-the-torah-in-thy-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*he established a testimony in Jacob, and appointed a law in Yashar''el (Israel)... that they should make them known to their children* (Psalm 78:5) — the duty of *shew thy son* (13:8) named as the purpose of the law.'
  FROM cross_reference_threads t
  JOIN _s305_ex13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=8
  JOIN _s305_ex13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=78 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-13-a-sign-upon-thine-hand-and-frontlets-the-torah-in-thy-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Joseph took an oath of the children of Yashar''el (Israel)... Elohim will surely visit you, and ye shall carry up my bones from hence* (Genesis 50:25) — the dying oath kept in *Moses took the bones of Joseph with him* (13:19).'
  FROM cross_reference_threads t
  JOIN _s305_ex13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=19
  JOIN _s305_ex13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=50 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-13-the-bones-of-joseph-the-two-house-hope-of-return'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*By faith Joseph, when he died... gave commandment concerning his bones* (Hebrews 11:22) — the oath behind 13:19 named as faith: Joseph trusted the visitation and the going-out would come.'
  FROM cross_reference_threads t
  JOIN _s305_ex13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=19
  JOIN _s305_ex13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-13-the-bones-of-joseph-the-two-house-hope-of-return'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the bones of Joseph... buried they in Shechem... it became the inheritance of the children of Joseph* (Joshua 24:32) — what begins in 13:19 is completed: the bones come to rest in the house of Joseph''s inheritance.'
  FROM cross_reference_threads t
  JOIN _s305_ex13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=19
  JOIN _s305_ex13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joshua' AND tv.chapter_number=24 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-13-the-bones-of-joseph-the-two-house-hope-of-return'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *the stick of Joseph, which is in the hand of Ephraim... and make them one stick* (Ezekiel 37:19) — the bones of Joseph (13:19) are the two-house pledge: Ephraim gathered, joined again to Yahudah.'
  FROM cross_reference_threads t
  JOIN _s305_ex13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=19
  JOIN _s305_ex13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-13-the-bones-of-joseph-the-two-house-hope-of-return'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Moses... brought up from there the coffin of Joseph and took it with him* (Jasher 80:62) — the extended witness keeps the deed of 13:19: Moses sees to the oath on the night of the going-out.'
  FROM cross_reference_threads t
  JOIN _s305_ex13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=19
  JOIN _s305_ex13_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=80 AND tv.verse_number=62
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-13-the-bones-of-joseph-the-two-house-hope-of-return'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*all our fathers were under the cloud, and all passed through the sea* (1 Corinthians 10:1) — the pillar that led (13:21) is the cloud under which the whole people walked.'
  FROM cross_reference_threads t
  JOIN _s305_ex13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=21
  JOIN _s305_ex13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-13-the-pillar-of-cloud-and-fire-the-presence-went-before-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*and were all baptized unto Moses in the cloud and in the sea* (1 Corinthians 10:2) — the leading pillar of 13:21 read as a baptism; the Presence (the Formed Son) brings the people through.'
  FROM cross_reference_threads t
  JOIN _s305_ex13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=21
  JOIN _s305_ex13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=10 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-13-the-pillar-of-cloud-and-fire-the-presence-went-before-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*thou leddest them in the day by a cloudy pillar; and in the night by a pillar of fire* (Nehemiah 9:12) — the leading-Presence of 13:21 sung almost word for word as Yahuah''s faithfulness.'
  FROM cross_reference_threads t
  JOIN _s305_ex13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=21
  JOIN _s305_ex13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-13-the-pillar-of-cloud-and-fire-the-presence-went-before-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the pillar of the cloud departed not from them by day... neither the pillar of fire by night* (Nehemiah 9:19) — *He took not away the pillar* (13:22): the unceasing Presence, the mercy that did not forsake them.'
  FROM cross_reference_threads t
  JOIN _s305_ex13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=22
  JOIN _s305_ex13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-13-the-pillar-of-cloud-and-fire-the-presence-went-before-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*a cloud and smoke by day, and the shining of a flaming fire by night: for upon all the glory shall be a defence* (Isaiah 4:5) — the wilderness pillar of 13:21 taken up as the restored canopy over Zion.'
  FROM cross_reference_threads t
  JOIN _s305_ex13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=21
  JOIN _s305_ex13_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=4 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-13-the-pillar-of-cloud-and-fire-the-presence-went-before-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*a burning pillar of fire, both to be a guide of the unknown journey, and an harmless sun* (Wisdom of Solomon 18:3) — the night-pillar of 13:21 sung as Yahuah''s guiding gift, a sun that did not scorch.'
  FROM cross_reference_threads t
  JOIN _s305_ex13_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=13 AND sv.verse_number=21
  JOIN _s305_ex13_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=18 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-13-the-pillar-of-cloud-and-fire-the-presence-went-before-them'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_exodus_19.sql (Exodus 19) -----
-- Chapter: Exodus 19 — SINAI: the third month, the covenant proposal, the kingdom of priests, the theophany on the mount. "Ye have seen... how I bare you on eagles' wings, and brought you unto myself"; "if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me... a kingdom of priests, and an holy nation"; "All that Yahuah hath spoken we will do"; bounds set about the mount, whosoever toucheth shall die; thunders, lightnings, thick cloud, the trumpet exceeding loud, the mount on fire and smoking, the whole mount quaking; "Yahuah descended upon it in fire." The One on the mountain = the Formed Son, the Glory who came down. The conditioned covenant rests on obey-my-voice-and-keep-my-covenant (Torah-affirmed); the peculiar treasure is Yashar'el, NOT a new people replacing.
-- Tag: ex19   Temp view: _s305_ex19_lookup
-- Sort band: base 29450, step 3 -> threads at 29450, 29453, 29456, 29459, 29462, 29465 (6 threads)
-- Source of EVERY row: 'canon','exodus',19,v
--
-- Exodus 19 coverage:
--   ★ v.4 (how I bare you on eagles' wings, and brought you unto myself)
--        NT:     Revelation 12:14 (to the woman were given two wings of a great eagle, that she might fly into the wilderness... where she is nourished) — THREAD 1 (lateral NT; the eagle-borne flight to the place of nourishing)
--        Extras: none warranted (the eagle-bearing carried by Deut 32 + Rev 12)
--        Tanakh: ★ Deuteronomy 32:11-12 (As an eagle stirreth up her nest... beareth them on her wings; so Yahuah alone did lead him) — THREAD 1 (load-bearing: the song of Moses names the eagle-bearing of the exodus)
--   ★★ v.5-6 (if ye will obey my voice indeed, and keep my covenant... a peculiar treasure unto me... a kingdom of priests, and an holy nation) — THE KEYSTONE
--        NT:     1 Peter 2:9 (ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people); Revelation 1:6 (hath made us kings and priests unto Elohim); Revelation 5:10 (hast made us unto our Elohim kings and priests); Titus 2:14 (purify unto himself a peculiar people, zealous of good works) — THREAD 2 (load-bearing: the two-house restored people, NOT replacement)
--        Extras: none warranted (the keystone forward-weave is NT + Torah laterals)
--        Tanakh: Deuteronomy 7:6 (chosen thee to be a special people unto himself); Deuteronomy 14:2 (a peculiar people unto himself, above all the nations); Deuteronomy 26:18 (his peculiar people... that thou shouldest keep all his commandments) — THREAD 2 (lateral: the peculiar-people refrain, conditioned on commandment-keeping)
--   v.7-8 (Moses laid the words before the elders; All that Yahuah hath spoken we will do)
--        NT:     none warranted (the covenant-vow forward-weave is the Torah-on-the-heart, held in prose; no clean direct member in set)
--        Extras: none warranted distinct (the giving carried by THREAD 6 Jubilees/Jasher)
--        Tanakh: ★ Exodus 24:3 (all the people answered with one voice... All the words which Yahuah hath said will we do); Exodus 24:7 (the book of the covenant... All that Yahuah hath said will we do, and be obedient) — THREAD 3 (the covenant vow, the Torah received willingly)
--   ★ v.9-13 (a thick cloud; bounds set about the mount; whosoever toucheth the mount shall be surely put to death; sanctify them; when the trumpet soundeth long)
--        NT:     ★★ Hebrews 12:18-21 (the mount that might be touched, and that burned with fire... if so much as a beast touch the mountain, it shall be stoned... so terrible was the sight, that Moses said, I exceedingly fear and quake) — THREAD 4 (load-bearing keystone: Sinai's holiness/separation)
--        Extras: none warranted distinct here (Sinai-fire carried to THREADS 5/6)
--        Tanakh: none warranted distinct (the bounds/touch carried by Hebrews 12)
--   ★★ v.16-19 (thunders, lightnings, thick cloud, the voice of the trumpet exceeding loud; the mount on fire and smoking; the whole mount quaked; the voice of the trumpet waxed louder and louder)
--        NT:     Hebrews 12:26 (Whose voice then shook the earth: but now he hath promised... Yet once more I shake not the earth only, but also heaven); Acts 2:1 (when the day of Pentecost was fully come) — THREAD 5 (Shavuot = the giving of Torah, the appointed-time backdrop)
--        Extras: ★ 1 Enoch 1:4 (the eternal Elohim will tread upon the earth, even on Mount Sinai... appear in the strength of His might); Jubilees 1:2-3 (the glory of Yahuah abode on Mount Sinai, and a cloud overshadowed it... like a flaming fire on the top of the Mount); Jasher 82:8 (the glory of Yahuah rested upon Mount Sinai... Moses came in the midst of a cloud) — THREAD 5
--        Tanakh: ★ Deuteronomy 4:11-12 (the mountain burned with fire... ye heard the voice of the words, but saw no similitude); Deuteronomy 5:22-24 (out of the midst of the fire, of the cloud, and of the thick darkness, with a great voice... Elohim doth talk with man, and he liveth) — THREAD 5
--   ★★ v.18,20 (Yahuah descended upon it in fire... Yahuah came down upon mount Sinai, on the top of the mount) — THE FORMED who came down (Red Line #4)
--        NT:     none warranted distinct (the descent's NT fulfillment is the Word made flesh, John 1:14, held in prose; the shaking is at THREAD 5 Hebrews 12:26)
--        Extras: ★ Jubilees 1:1 (as Yahuah spake to Moses on Mount Sinai when he went up to receive the tables of the law); Jasher 82:6 (Yahuah gave to Israel the ten commandments on Mount Sinai) — THREAD 6
--        Tanakh: ★ Nehemiah 9:13 (Thou camest down also upon mount Sinai, and spakest with them from heaven, and gavest them... true laws, good statutes and commandments) — THREAD 6 (load-bearing: the One who descended)
--   v.14-15 (sanctified the people; washed clothes; be ready against the third day) — sanctification preparation; carried by THREAD 4's holiness frame, no distinct member warranted
--   v.21-25 (charge the people lest they break through; the priests sanctify themselves; Moses and Aaron) — the renewed warning, holiness of approach; carried by THREAD 4, no distinct member warranted
--
-- Threads (slug — target libraries):
--   1. exodus-19-eagles-wings-and-brought-you-unto-myself — Tanakh (Deuteronomy 32) + NT (Revelation 12) [free] (★ the eagle-borne gathering)
--   2. exodus-19-a-peculiar-treasure-a-kingdom-of-priests-an-holy-nation — NT (1 Peter, Revelation 1, Revelation 5, Titus) + Tanakh (Deuteronomy 7,14,26) [free] (★★ KEYSTONE: two-house restored people, conditioned on obey-my-voice)
--   3. exodus-19-all-that-yahuah-hath-spoken-we-will-do — Tanakh (Exodus 24) [free] (the covenant vow, Torah received willingly)
--   4. exodus-19-bounds-about-the-mount-the-mount-that-might-be-touched — NT (Hebrews 12) [free] (★★ Sinai's holiness/separation)
--   5. exodus-19-thunders-and-the-trumpet-and-the-mount-on-fire — NT (Hebrews 12, Acts 2) + Tanakh (Deuteronomy 4, Deuteronomy 5) + Extras (1 Enoch, Jubilees, Jasher) [extras] (★★ the Sinai theophany = the Formed presence; Shavuot backdrop)
--   6. exodus-19-yahuah-descended-upon-it-in-fire — Tanakh (Nehemiah 9) + Extras (Jubilees, Jasher) [extras] (★ the One who came down = the Formed Son)
--
-- Framing notes:
--   ★ THREAD 1 (eagles' wings): *how I bare you on eagles' wings, and brought you unto myself* (19:4) — the song of Moses sings the same bearing (*As an eagle... beareth them on her wings; so Yahuah (LORD) alone did lead him*, Deut 32:11-12), and Revelation 12:14 carries the figure forward as the woman given *two wings of a great eagle, that she might fly into the wilderness... where she is nourished* — the same eagle-borne flight to the wilderness place of keeping. Lateral NT, clean, not forced; framed as the gathering/bearing of Yashar'el.
--   ★★ THREAD 2 (KEYSTONE — peculiar treasure / kingdom of priests): the most-quoted election text in the canon. *if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me... a kingdom of priests, and an holy nation* (19:5-6). The covenant is CONDITIONED on *obey my voice... and keep my covenant* — Torah-affirmed, never a new people by confession. 1 Peter 2:9 quotes it almost verbatim *of the same people restored* (*a royal priesthood, an holy nation, a peculiar people*); Revelation 1:6 / 5:10 (*made us kings and priests*); Titus 2:14 (*a peculiar people, zealous of good works*). Framed strictly as Yashar'el RESTORED — the two-house people (cf. 1 Pet 1:1 strangers scattered, James 1:1 twelve tribes), the natural and the wild olive both Yashar'el — NOT a church replacing Israel. The Torah laterals seal the condition: Deut 7:6 / 14:2 (*a peculiar people... above all the nations*) and Deut 26:18 (*his peculiar people... that thou shouldest keep all his commandments*).
--   THREAD 3 (the covenant vow): *All that Yahuah (LORD) hath spoken we will do* (19:8) — answered again at the covenant ratification, Exodus 24:3,7 (*All that Yahuah hath said will we do, and be obedient*). The Torah received willingly, the people's own vow; the lateral keeps the vow within Exodus itself.
--   ★★ THREAD 4 (Sinai's holiness — the mount that might be touched): *whosoever toucheth the mount shall be surely put to death... whether it be beast or man, it shall not live* (19:12-13). Hebrews 12:18-21 names this very scene — *the mount that might be touched, and that burned with fire... if so much as a beast touch the mountain, it shall be stoned... so terrible was the sight, that Moses said, I exceedingly fear and quake* — the Sinai-vs-Zion contrast. The holiness of the mount, the bounds, the unapproachable fire: read NOT as Torah-abolished (Hebrews' point is the greater glory, not a lesser law) but as the awe of the Formed presence among His people.
--   ★★ THREAD 5 (the theophany — the Formed presence; Shavuot backdrop): *thunders, and lightnings, and a thick cloud upon the mount, and the voice of the trumpet exceeding loud... mount Sinai was altogether on a smoke... and the whole mount quaked greatly* (19:16-18). The Sinai theophany = the Formed presence (Red Line #4). Hebrews 12:26 carries the voice that *then shook the earth*. Deuteronomy 4:11-12 / 5:22-24 retell it (*the voice... out of the midst of the fire... Elohim (God) doth talk with man, and he liveth*). The appointed-time backdrop: Sinai is the giving of Torah at the third month — the feast the NT names *Pentecost* (Acts 2:1, Shavuot), the same fire-and-voice now poured on the gathered. EXTRAS: 1 Enoch 1:4 (*the eternal Elohim (God) will tread upon the earth, even on Mount Sinai... appear in the strength of His might*) — clean, the Holy One on Sinai; Jubilees 1:2-3 (*the glory of Yahuah (God) abode on Mount Sinai, and a cloud overshadowed it... like a flaming fire on the top of the Mount*); Jasher 82:8 (*the glory of Yahuah (the Lord) rested upon Mount Sinai... Moses came in the midst of a cloud*). Jubilees + Jasher DOUBLE-WRITTEN. 1 Enoch edition `enoch` + book `1-enoch`.
--   ★ THREAD 6 (Yahuah descended in fire — the One who came down): *mount Sinai was altogether on a smoke, because Yahuah (LORD) descended upon it in fire* (19:18); *Yahuah (LORD) came down upon mount Sinai, on the top of the mount* (19:20). The Formed Son is the One who descended (Red Line #4) — the visible Glory, who has a Father. Nehemiah 9:13 confesses it: *Thou camest down also upon mount Sinai, and spakest with them from heaven, and gavest them right judgments, and true laws*. EXTRAS: Jubilees 1:1 (*as Yahuah (God) spake to Moses on Mount Sinai when he went up to receive the tables of the law*); Jasher 82:6 (*Yahuah (the Lord) gave to Israel the ten commandments on Mount Sinai*). Jubilees + Jasher DOUBLE-WRITTEN.
--   VERSES WITH NO ADD: v.14-15 (sanctification preparation, washing of clothes) and v.21-25 (renewed warning, the priests sanctify themselves, Moses and Aaron) — the holiness frame of THREAD 4 carries them; no distinct framework-bearing target warranted.

CREATE TEMP VIEW _s305_ex19_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: eagles' wings, brought you unto myself
    ('canon','exodus',19,4,'canon','deuteronomy',32,11,'free',
      E'*As an eagle stirreth up her nest, fluttereth over her young, spreadeth abroad her wings, taketh them, beareth them on her wings* (Deuteronomy 32:11). The song of Moses sings what Yahuah (LORD) said at Sinai — *how I bare you on eagles'' wings, and brought you unto myself* (Exodus 19:4): the exodus deliverance is the eagle bearing her young, Yahuah carrying Yashar''el (Israel) out of Egypt and up to the mount unto Himself.'),
    ('canon','exodus',19,4,'canon','deuteronomy',32,12,'free',
      E'*So Yahuah (LORD) alone did lead him, and there was no strange god with him* (Deuteronomy 32:12). The eagle-bearing of *I bare you on eagles'' wings, and brought you unto myself* (Exodus 19:4) is Yahuah leading His people ALONE — no strange god, no other deliverer; He bore them out and brought them to Himself at Sinai.'),
    ('canon','exodus',19,4,'canon','revelation',12,14,'free',
      E'*And to the woman were given two wings of a great eagle, that she might fly into the wilderness, into her place, where she is nourished for a time, and times, and half a time, from the face of the serpent* (Revelation 12:14). The figure of *I bare you on eagles'' wings, and brought you unto myself* (Exodus 19:4) returns at the end: the woman borne on *two wings of a great eagle* into the wilderness place of nourishing, the same eagle-flight to the keeping-place, Yashar''el carried from the face of the serpent.'),

    -- THREAD 2 (★★ KEYSTONE): a peculiar treasure, a kingdom of priests, an holy nation
    ('canon','exodus',19,6,'canon','1-peter',2,9,'free',
      E'*But ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people; that ye should shew forth the praises of him who hath called you out of darkness into his marvellous light* (1 Peter 2:9). Kepha (Peter) quotes Sinai almost word for word — *a kingdom of priests, and an holy nation... a peculiar treasure unto me* (Exodus 19:5-6) — and lays it on the SAME people restored: *a royal priesthood, an holy nation, a peculiar people*. Not a new people replacing Yashar''el (Israel), but the two-house people gathered and called out of darkness, the election of the mount carried to its fullness.'),
    ('canon','exodus',19,6,'canon','revelation',1,6,'free',
      E'*And hath made us kings and priests unto Elohim (God) and his Father; to him be glory and dominion for ever and ever. Amen* (Revelation 1:6). The promise of *a kingdom of priests* (Exodus 19:6) is fulfilled — *made us kings and priests unto Elohim and his Father*. The royal-priestly nation proposed at Sinai is the people who reign and serve before Him; note the Formed Son who *hath made us... unto Elohim and his Father*, the One with a Father.'),
    ('canon','exodus',19,6,'canon','revelation',5,10,'free',
      E'*And hast made us unto our Elohim (God) kings and priests: and we shall reign on the earth* (Revelation 5:10). The new song answers Sinai''s word *ye shall be unto me a kingdom of priests, and an holy nation* (Exodus 19:6): the redeemed *made... unto our Elohim kings and priests*, the royal-priestly nation that *shall reign on the earth* — the kingdom of priests come to its inheritance.'),
    ('canon','exodus',19,5,'canon','titus',2,14,'free',
      E'*Who gave himself for us, that he might redeem us from all iniquity, and purify unto himself a peculiar people, zealous of good works* (Titus 2:14). The *peculiar treasure unto me* (Exodus 19:5) is the *peculiar people* purified *unto himself* — and they are *zealous of good works*, the very obey-my-voice-and-keep-my-covenant condition of the mount, never grace instead of obedience but grace unto a peculiar people who keep His ways.'),
    ('canon','exodus',19,5,'canon','deuteronomy',7,6,'free',
      E'*For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth* (Deuteronomy 7:6). The Sinai word *ye shall be a peculiar treasure unto me above all people* (Exodus 19:5) is named again to the same nation — *a special people unto himself, above all people* — the chosen, treasured nation, Yashar''el (Israel) set apart unto Yahuah.'),
    ('canon','exodus',19,5,'canon','deuteronomy',14,2,'free',
      E'*For thou art an holy people unto Yahuah Elohayka (the LORD thy God), and Yahuah (LORD) hath chosen thee to be a peculiar people unto himself, above all the nations that are upon the earth* (Deuteronomy 14:2). The exact phrase of *a peculiar treasure unto me above all people* (Exodus 19:5) recurs — *a peculiar people unto himself, above all the nations* — and stands at the head of the dietary statutes: the peculiarity of the people is bound to keeping His ways, the holy nation marked out by His instruction.'),
    ('canon','exodus',19,5,'canon','deuteronomy',26,18,'free',
      E'*And Yahuah (LORD) hath avouched thee this day to be his peculiar people, as he hath promised thee, and that thou shouldest keep all his commandments* (Deuteronomy 26:18). The covenant proposal *if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me* (Exodus 19:5) is sealed here — *his peculiar people... that thou shouldest keep all his commandments*. The treasure is conditioned on commandment-keeping; the peculiar people are the obedient people, the Torah affirmed as the very mark of the election.'),

    -- THREAD 3: All that Yahuah hath spoken we will do (the covenant vow)
    ('canon','exodus',19,8,'canon','exodus',24,3,'free',
      E'*And Moses came and told the people all the words of Yahuah (LORD), and all the judgments: and all the people answered with one voice, and said, All the words which Yahuah (LORD) hath said will we do* (Exodus 24:3). The vow first spoken at the mount — *All that Yahuah (LORD) hath spoken we will do* (Exodus 19:8) — is answered again at the covenant ratification, *all the people answered with one voice... All the words which Yahuah hath said will we do*: the Torah received willingly, the people binding themselves to the covenant of their own accord.'),
    ('canon','exodus',19,8,'canon','exodus',24,7,'free',
      E'*And he took the book of the covenant, and read in the audience of the people: and they said, All that Yahuah (LORD) hath said will we do, and be obedient* (Exodus 24:7). The people''s word *All that Yahuah (LORD) hath spoken we will do* (Exodus 19:8) is repeated over the book of the covenant — *All that Yahuah hath said will we do, and be obedient* — the willing vow sealed in blood; the covenant is no burden imposed but a marriage-promise answered freely.'),

    -- THREAD 4 (★★): bounds about the mount, the mount that might be touched
    ('canon','exodus',19,12,'canon','hebrews',12,18,'free',
      E'*For ye are not come unto the mount that might be touched, and that burned with fire, nor unto blackness, and darkness, and tempest* (Hebrews 12:18). The bounds of Sinai — *Take heed to yourselves, that ye go not up into the mount, or touch the border of it: whosoever toucheth the mount shall be surely put to death* (Exodus 19:12) — are named as *the mount that might be touched, and that burned with fire*. The unapproachable holiness of the Formed presence on Sinai: the mount fenced, the touch forbidden on pain of death.'),
    ('canon','exodus',19,13,'canon','hebrews',12,20,'free',
      E'*(For they could not endure that which was commanded, And if so much as a beast touch the mountain, it shall be stoned, or thrust through with a dart* (Hebrews 12:20). The decree *whether it be beast or man, it shall not live* (Exodus 19:13) is quoted exactly — *if so much as a beast touch the mountain, it shall be stoned, or thrust through with a dart*. The holiness of the mount admits no approach; even a beast straying past the bound dies, so terrible is the nearness of Yahuah (LORD).'),
    ('canon','exodus',19,12,'canon','hebrews',12,21,'free',
      E'*And so terrible was the sight, that Moses said, I exceedingly fear and quake* (Hebrews 12:21). The fenced, fire-crowned mount of *whosoever toucheth the mount shall be surely put to death* (Exodus 19:12) was a sight so terrible that even Moses *exceedingly fear[ed] and quake[d]*. The bounds were no arbitrary cruelty but the guarding of a people from the consuming nearness of the Holy One who came down.'),

    -- THREAD 5 (★★): thunders and the trumpet and the mount on fire (the theophany; Shavuot)
    ('canon','exodus',19,18,'canon','hebrews',12,26,'free',
      E'*Whose voice then shook the earth: but now he hath promised, saying, Yet once more I shake not the earth only, but also heaven* (Hebrews 12:26). When at Sinai *the whole mount quaked greatly* (Exodus 19:18), it was the voice of Yahuah (LORD) that *then shook the earth* — and the promise reaches beyond Sinai to a final shaking of earth and heaven. The trembling mount is the Formed presence whose voice moves the creation.'),
    ('canon','exodus',19,16,'canon','acts',2,1,'free',
      E'*And when the day of Pentecost was fully come, they were all with one accord in one place* (Acts 2:1). Sinai''s theophany — *thunders, and lightnings, and a thick cloud upon the mount, and the voice of the trumpet exceeding loud* (Exodus 19:16) — fell in the third month, at the feast the NT names *Pentecost*, Shavuot, the appointed time of the giving of Torah. The same fire and voice that came down on the mount came down on the gathered when *the day of Pentecost was fully come*: the feast of the Torah given is the feast of the Ruach (Spirit) poured, the Torah now written on the heart.'),
    ('canon','exodus',19,16,'canon','deuteronomy',4,11,'free',
      E'*And ye came near and stood under the mountain; and the mountain burned with fire unto the midst of heaven, with darkness, clouds, and thick darkness* (Deuteronomy 4:11). Moses retells the scene of *a thick cloud upon the mount, and the voice of the trumpet exceeding loud* (Exodus 19:16): *the mountain burned with fire unto the midst of heaven, with darkness, clouds, and thick darkness* — the fire and the cloud of the Formed presence, the mount ablaze before all the people.'),
    ('canon','exodus',19,19,'canon','deuteronomy',5,24,'free',
      E'*And ye said, Behold, Yahuah Eloheinu (the LORD our God) hath shewed us his glory and his greatness, and we have heard his voice out of the midst of the fire: we have seen this day that Elohim (God) doth talk with man, and he liveth* (Deuteronomy 5:24). When *the voice of the trumpet sounded long, and waxed louder and louder, Moses spake, and Elohim (God) answered him by a voice* (Exodus 19:19), the people heard *his voice out of the midst of the fire* and marvelled that *Elohim doth talk with man, and he liveth* — the Formed Son speaking with His people from the fire, and they not consumed.'),
    ('canon','exodus',19,18,'enoch','1-enoch',1,4,'extras',
      E'*And the eternal Elohim (God) will tread upon the earth, (even) on Mount Sinai, [And appear from His camp] And appear in the strength of His might from the heaven of heavens* (1 Enoch 1:4). The watcher of old saw the same descent as *Yahuah (LORD) descended upon it in fire* (Exodus 19:18): *the eternal Elohim will tread upon the earth, even on Mount Sinai... appear in the strength of His might*. The Holy One coming down on Sinai is the great manifestation of His might, the Formed presence treading the mount.'),
    ('canon','exodus',19,16,'jubilees','jubilees',1,2,'extras',
      E'*And Moses went up into the mount of Elohim (God), and the glory of Yahuah (God) abode on Mount Sinai, and a cloud overshadowed it six days* (Jubilees 1:2). The restored witness keeps the cloud and the glory of *a thick cloud upon the mount* (Exodus 19:16): *the glory of Yahuah abode on Mount Sinai, and a cloud overshadowed it* — the visible Glory settled on the mount, the Formed presence in the cloud.'),
    ('canon','exodus',19,18,'jubilees','jubilees',1,3,'extras',
      E'*And He called to Moses on the seventh day out of the midst of the cloud, and the appearance of the glory of Yahuah (God) was like a flaming fire on the top of the Mount* (Jubilees 1:3). The restored witness matches *Yahuah (LORD) descended upon it in fire* (Exodus 19:18): *the appearance of the glory of Yahuah was like a flaming fire on the top of the Mount* — the glory and the fire are one, the Formed presence blazing on the height.'),
    ('canon','exodus',19,18,'jasher','jasher',82,8,'extras',
      E'*And the glory of Yahuah (the Lord) rested upon Mount Sinai, and he called to Moses, and Moses came in the midst of a cloud and ascended the mountain* (Jasher 82:8). The extended witness keeps the resting Glory of *mount Sinai was altogether on a smoke, because Yahuah (LORD) descended upon it in fire* (Exodus 19:18): *the glory of Yahuah rested upon Mount Sinai... Moses came in the midst of a cloud* — Moses going up into the very cloud of the descended Glory.'),

    -- THREAD 6 (★): Yahuah descended upon it in fire (the One who came down = the Formed Son)
    ('canon','exodus',19,18,'canon','nehemiah',9,13,'free',
      E'*Thou camest down also upon mount Sinai, and spakest with them from heaven, and gavest them right judgments, and true laws, good statutes and commandments* (Nehemiah 9:13). The confession of the returned remnant names the One of *Yahuah (LORD) descended upon it in fire... Yahuah (LORD) came down upon mount Sinai* (Exodus 19:18,20): *Thou camest down also upon mount Sinai, and spakest with them... and gavest them... true laws, good statutes and commandments*. The Formed Son who descended is the same who gave the Torah — the law called *good*, *true*, *right*, never the curse.'),
    ('canon','exodus',19,20,'jubilees','jubilees',1,1,'extras',
      E'*...as Yahuah (God) spake to Moses on Mount Sinai when he went up to receive the tables of the law and of the commandment, according to the voice of Elohim (God) as He said to him, "Go up to the top of the Mount."* (Jubilees 1:1). The restored witness opens at the moment of *Yahuah (LORD) came down upon mount Sinai, on the top of the mount: and Yahuah (LORD) called Moses up to the top of the mount* (Exodus 19:20): *Go up to the top of the Mount* — the descended Yahuah calling Moses up to receive *the tables of the law*, the giving of the covenant instruction.'),
    ('canon','exodus',19,20,'jasher','jasher',82,6,'extras',
      E'*And in the third month from the children of Israel''s departure from Egypt, on the sixth day of it, Yahuah (the Lord) gave to Israel the ten commandments on Mount Sinai* (Jasher 82:6). The extended witness names the gift of the descent of *Yahuah (LORD) came down upon mount Sinai* (Exodus 19:20): *Yahuah gave to Israel the ten commandments on Mount Sinai* in the third month — the One who came down in fire is the One who gave the ten words, the covenant words of the holy nation.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex19_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex19_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-19-eagles-wings-and-brought-you-unto-myself',
       E'Eagles'' wings — and brought you unto myself',
       E'Before a single commandment is given, Yahuah (LORD) tells Yashar''el (Israel) what He has already done: *Ye have seen what I did unto the Egyptians, and how I bare you on eagles'' wings, and brought you unto myself* (Exodus 19:4). The exodus was an eagle bearing her young — not driven, but carried; and the carrying had a destination: *unto myself*. The song of Moses sings the same: *As an eagle stirreth up her nest, fluttereth over her young, spreadeth abroad her wings, taketh them, beareth them on her wings: so Yahuah (LORD) alone did lead him, and there was no strange god with him* (Deuteronomy 32:11-12) — Yahuah alone bore them, no other deliverer. And the figure returns at the end of the canon: *to the woman were given two wings of a great eagle, that she might fly into the wilderness, into her place, where she is nourished for a time, and times, and half a time, from the face of the serpent* (Revelation 12:14) — the same eagle-flight to the wilderness place of keeping, Yashar''el carried out of the serpent''s reach. The covenant about to be proposed rests on this: He bore them, He brought them to Himself, and the gathering of His people is His own doing.',
       sv.verse_id, ev.verse_id, 'free', 29450
  FROM _s305_ex19_lookup sv, _s305_ex19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=19 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=19 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★ KEYSTONE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-19-a-peculiar-treasure-a-kingdom-of-priests-an-holy-nation',
       E'A peculiar treasure — a kingdom of priests, and an holy nation',
       E'This is the covenant proposal, and the most-quoted election text in all the Scriptures: *Now therefore, if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people: for all the earth is mine: and ye shall be unto me a kingdom of priests, and an holy nation* (Exodus 19:5-6). Mark the condition — *if ye will obey my voice indeed, and keep my covenant* — the treasured status is bound to obedience and covenant-keeping; this is Torah affirmed as the very mark of the people, never grace instead of obedience. Kepha (Peter) lays the words on the SAME people gathered and restored: *ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people; that ye should shew forth the praises of him who hath called you out of darkness into his marvellous light* (1 Peter 2:9) — a people called out of darkness, the two houses regathered (cf. *strangers scattered*, 1 Peter 1:1), NOT a new people replacing Yashar''el (Israel). The Revelation sings the kingdom of priests come to its inheritance: *hath made us kings and priests unto Elohim (God) and his Father* (Revelation 1:6), *hast made us unto our Elohim (God) kings and priests: and we shall reign on the earth* (Revelation 5:10). And Sha''ul (Paul) keeps the condition intact: *purify unto himself a peculiar people, zealous of good works* (Titus 2:14) — the peculiar people are the obedient people. The Torah itself repeats the refrain to the same nation: *a special people unto himself, above all people* (Deuteronomy 7:6); *a peculiar people unto himself, above all the nations* (Deuteronomy 14:2); *his peculiar people... that thou shouldest keep all his commandments* (Deuteronomy 26:18). The treasure and the commandment-keeping are one.',
       sv.verse_id, ev.verse_id, 'free', 29453
  FROM _s305_ex19_lookup sv, _s305_ex19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=19 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=19 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-19-all-that-yahuah-hath-spoken-we-will-do',
       E'All that Yahuah hath spoken we will do — the covenant vow',
       E'Moses lays the covenant proposal before the elders, and the people answer as one: *And all the people answered together, and said, All that Yahuah (LORD) hath spoken we will do. And Moses returned the words of the people unto Yahuah (LORD)* (Exodus 19:8). The covenant is not imposed; it is answered freely, a marriage-promise spoken back. This same vow is repeated at the ratification of the covenant: *all the people answered with one voice, and said, All the words which Yahuah (LORD) hath said will we do* (Exodus 24:3), and over the book of the covenant read aloud, *All that Yahuah (LORD) hath said will we do, and be obedient* (Exodus 24:7). The Torah is received willingly, the people binding themselves of their own accord — *we will do, and be obedient*. The covenant about to thunder from the mount is one the people have already said yes to; obedience is the answer of a people loved and borne.',
       sv.verse_id, ev.verse_id, 'free', 29456
  FROM _s305_ex19_lookup sv, _s305_ex19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=19 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=19 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-19-bounds-about-the-mount-the-mount-that-might-be-touched',
       E'Bounds about the mount — the mount that might be touched',
       E'Before the Glory descends, the mount is fenced: *thou shalt set bounds unto the people round about, saying, Take heed to yourselves, that ye go not up into the mount, or touch the border of it: whosoever toucheth the mount shall be surely put to death: there shall not an hand touch it, but he shall surely be stoned, or shot through; whether it be beast or man, it shall not live* (Exodus 19:12-13). The holiness of the Formed presence is so consuming that the touch of the mount is death — even to a straying beast. The letter to the Hebrews names this very scene: *ye are not come unto the mount that might be touched, and that burned with fire, nor unto blackness, and darkness, and tempest* (Hebrews 12:18), *And if so much as a beast touch the mountain, it shall be stoned, or thrust through with a dart* (Hebrews 12:20) — quoting the decree exactly — *and so terrible was the sight, that Moses said, I exceedingly fear and quake* (Hebrews 12:21). The bounds are no cruelty but mercy: a guarding of the people from the nearness that would consume them. Hebrews sets Sinai against Zion not to abolish the law but to magnify the glory; the awe of the mount is the awe due the Holy One who came down to His people.',
       sv.verse_id, ev.verse_id, 'free', 29459
  FROM _s305_ex19_lookup sv, _s305_ex19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=19 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=19 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-19-thunders-and-the-trumpet-and-the-mount-on-fire',
       E'Thunders, and the trumpet, and the mount on fire — the Sinai theophany',
       E'On the third day the mount erupts with the presence of Yahuah (LORD): *there were thunders and lightnings, and a thick cloud upon the mount, and the voice of the trumpet exceeding loud; so that all the people that was in the camp trembled* (Exodus 19:16), *and mount Sinai was altogether on a smoke, because Yahuah (LORD) descended upon it in fire... and the whole mount quaked greatly* (Exodus 19:18), *and when the voice of the trumpet sounded long, and waxed louder and louder, Moses spake, and Elohim (God) answered him by a voice* (Exodus 19:19). This is the Formed presence — the visible Glory in fire and cloud and trumpet-voice. Moses retells it: *the mountain burned with fire unto the midst of heaven, with darkness, clouds, and thick darkness* (Deuteronomy 4:11); the people heard *his voice out of the midst of the fire: we have seen this day that Elohim (God) doth talk with man, and he liveth* (Deuteronomy 5:24). The letter to the Hebrews carries the voice forward: *whose voice then shook the earth: but now he hath promised... Yet once more I shake not the earth only, but also heaven* (Hebrews 12:26). And the appointed time matters: Sinai fell in the third month, the feast the NT names *Pentecost* — Shavuot, the giving of Torah — *and when the day of Pentecost was fully come, they were all with one accord in one place* (Acts 2:1): the same fire and voice poured on the gathered, the Torah now written on the heart. The restored witnesses keep the fire whole: *the eternal Elohim (God) will tread upon the earth, even on Mount Sinai... appear in the strength of His might* (1 Enoch 1:4); *the glory of Yahuah (God) abode on Mount Sinai, and a cloud overshadowed it* (Jubilees 1:2), *the appearance of the glory of Yahuah was like a flaming fire on the top of the Mount* (Jubilees 1:3); *the glory of Yahuah (the Lord) rested upon Mount Sinai... Moses came in the midst of a cloud* (Jasher 82:8). The One who treads Sinai in fire is the Formed Son, the expressed might of the Most High.',
       sv.verse_id, ev.verse_id, 'extras', 29462
  FROM _s305_ex19_lookup sv, _s305_ex19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=19 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=19 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-19-yahuah-descended-upon-it-in-fire',
       E'Yahuah descended upon it in fire — the One who came down',
       E'Twice the text says it plainly: *mount Sinai was altogether on a smoke, because Yahuah (LORD) descended upon it in fire* (Exodus 19:18), and *Yahuah (LORD) came down upon mount Sinai, on the top of the mount: and Yahuah (LORD) called Moses up to the top of the mount* (Exodus 19:20). The Most High is the formless Source; the One who DESCENDED, who came down upon the mount in fire and spoke and called Moses up, is the Formed Son — the visible Glory who has a Father. The returned remnant confesses Him by this very deed: *Thou camest down also upon mount Sinai, and spakest with them from heaven, and gavest them right judgments, and true laws, good statutes and commandments* (Nehemiah 9:13) — the One who came down is the One who gave the Torah, and the law He gave is named *good*, *true*, *right*, never a curse. The restored witnesses keep the descent and the gift together: *as Yahuah (God) spake to Moses on Mount Sinai when he went up to receive the tables of the law... "Go up to the top of the Mount"* (Jubilees 1:1); *Yahuah (the Lord) gave to Israel the ten commandments on Mount Sinai* in the third month (Jasher 82:6). The fire on the mount is the presence of the Formed Son, and the words He spoke from it are the covenant words of the holy nation.',
       sv.verse_id, ev.verse_id, 'extras', 29465
  FROM _s305_ex19_lookup sv, _s305_ex19_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=19 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=19 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*As an eagle... beareth them on her wings* (Deuteronomy 32:11) — the song of Moses sings the eagle-bearing of *I bare you on eagles'' wings* (19:4): the exodus deliverance.'
  FROM cross_reference_threads t
  JOIN _s305_ex19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=19 AND sv.verse_number=4
  JOIN _s305_ex19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-19-eagles-wings-and-brought-you-unto-myself'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*So Yahuah (LORD) alone did lead him, and there was no strange god with him* (Deuteronomy 32:12) — He bore them ALONE to *brought you unto myself* (19:4); no other deliverer.'
  FROM cross_reference_threads t
  JOIN _s305_ex19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=19 AND sv.verse_number=4
  JOIN _s305_ex19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-19-eagles-wings-and-brought-you-unto-myself'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*two wings of a great eagle, that she might fly into the wilderness... where she is nourished* (Revelation 12:14) — the eagle-flight of 19:4 returns: Yashar''el (Israel) borne to the wilderness place of keeping, from the serpent.'
  FROM cross_reference_threads t
  JOIN _s305_ex19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=19 AND sv.verse_number=4
  JOIN _s305_ex19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-19-eagles-wings-and-brought-you-unto-myself'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★ KEYSTONE)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*ye are a chosen generation, a royal priesthood, an holy nation, a peculiar people* (1 Peter 2:9) — Sinai''s *a kingdom of priests, and an holy nation* (19:6) quoted of the SAME people restored, called out of darkness.'
  FROM cross_reference_threads t
  JOIN _s305_ex19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=19 AND sv.verse_number=6
  JOIN _s305_ex19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-19-a-peculiar-treasure-a-kingdom-of-priests-an-holy-nation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*hath made us kings and priests unto Elohim (God) and his Father* (Revelation 1:6) — *a kingdom of priests* (19:6) fulfilled; note the Formed Son who made us unto Elohim AND his Father.'
  FROM cross_reference_threads t
  JOIN _s305_ex19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=19 AND sv.verse_number=6
  JOIN _s305_ex19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-19-a-peculiar-treasure-a-kingdom-of-priests-an-holy-nation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*hast made us unto our Elohim (God) kings and priests: and we shall reign on the earth* (Revelation 5:10) — the kingdom of priests of 19:6 come to its inheritance, reigning on the earth.'
  FROM cross_reference_threads t
  JOIN _s305_ex19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=19 AND sv.verse_number=6
  JOIN _s305_ex19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-19-a-peculiar-treasure-a-kingdom-of-priests-an-holy-nation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*purify unto himself a peculiar people, zealous of good works* (Titus 2:14) — the *peculiar treasure* (19:5) kept; the condition intact, a peculiar people zealous of good works.'
  FROM cross_reference_threads t
  JOIN _s305_ex19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=19 AND sv.verse_number=5
  JOIN _s305_ex19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='titus' AND tv.chapter_number=2 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-19-a-peculiar-treasure-a-kingdom-of-priests-an-holy-nation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*chosen thee to be a special people unto himself, above all people* (Deuteronomy 7:6) — the *peculiar treasure... above all people* (19:5) refrain, named again to the same nation.'
  FROM cross_reference_threads t
  JOIN _s305_ex19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=19 AND sv.verse_number=5
  JOIN _s305_ex19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-19-a-peculiar-treasure-a-kingdom-of-priests-an-holy-nation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*a peculiar people unto himself, above all the nations* (Deuteronomy 14:2) — the exact phrase of 19:5, set at the head of the dietary statutes: peculiarity bound to His ways.'
  FROM cross_reference_threads t
  JOIN _s305_ex19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=19 AND sv.verse_number=5
  JOIN _s305_ex19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=14 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-19-a-peculiar-treasure-a-kingdom-of-priests-an-holy-nation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*his peculiar people... that thou shouldest keep all his commandments* (Deuteronomy 26:18) — seals the condition of 19:5: the treasure is the commandment-keeping people, Torah affirmed.'
  FROM cross_reference_threads t
  JOIN _s305_ex19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=19 AND sv.verse_number=5
  JOIN _s305_ex19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=26 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-19-a-peculiar-treasure-a-kingdom-of-priests-an-holy-nation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*All the words which Yahuah (LORD) hath said will we do* (Exodus 24:3) — the vow of *All that Yahuah hath spoken we will do* (19:8) answered again at the ratification.'
  FROM cross_reference_threads t
  JOIN _s305_ex19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=19 AND sv.verse_number=8
  JOIN _s305_ex19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=24 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-19-all-that-yahuah-hath-spoken-we-will-do'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*All that Yahuah (LORD) hath said will we do, and be obedient* (Exodus 24:7) — the willing vow of 19:8 sealed over the book of the covenant.'
  FROM cross_reference_threads t
  JOIN _s305_ex19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=19 AND sv.verse_number=8
  JOIN _s305_ex19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=24 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-19-all-that-yahuah-hath-spoken-we-will-do'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the mount that might be touched, and that burned with fire* (Hebrews 12:18) — names the fenced Sinai of *touch the border of it... shall be surely put to death* (19:12).'
  FROM cross_reference_threads t
  JOIN _s305_ex19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=19 AND sv.verse_number=12
  JOIN _s305_ex19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-19-bounds-about-the-mount-the-mount-that-might-be-touched'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*if so much as a beast touch the mountain, it shall be stoned, or thrust through with a dart* (Hebrews 12:20) — quotes *whether it be beast or man, it shall not live* (19:13) exactly.'
  FROM cross_reference_threads t
  JOIN _s305_ex19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=19 AND sv.verse_number=13
  JOIN _s305_ex19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-19-bounds-about-the-mount-the-mount-that-might-be-touched'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*so terrible was the sight, that Moses said, I exceedingly fear and quake* (Hebrews 12:21) — the awe of the fenced mount of 19:12; even Moses trembled at the Formed presence.'
  FROM cross_reference_threads t
  JOIN _s305_ex19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=19 AND sv.verse_number=12
  JOIN _s305_ex19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-19-bounds-about-the-mount-the-mount-that-might-be-touched'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*whose voice then shook the earth... Yet once more I shake not the earth only, but also heaven* (Hebrews 12:26) — the voice that made *the whole mount quaked greatly* (19:18) reaches to a final shaking.'
  FROM cross_reference_threads t
  JOIN _s305_ex19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=19 AND sv.verse_number=18
  JOIN _s305_ex19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-19-thunders-and-the-trumpet-and-the-mount-on-fire'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*when the day of Pentecost was fully come* (Acts 2:1) — Sinai''s fire and trumpet (19:16) fell at Shavuot, the giving of Torah; the same fire poured at Pentecost, Torah on the heart.'
  FROM cross_reference_threads t
  JOIN _s305_ex19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=19 AND sv.verse_number=16
  JOIN _s305_ex19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-19-thunders-and-the-trumpet-and-the-mount-on-fire'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the mountain burned with fire unto the midst of heaven, with darkness, clouds, and thick darkness* (Deuteronomy 4:11) — Moses retells *a thick cloud upon the mount* (19:16): the fire and cloud of the Formed presence.'
  FROM cross_reference_threads t
  JOIN _s305_ex19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=19 AND sv.verse_number=16
  JOIN _s305_ex19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=4 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-19-thunders-and-the-trumpet-and-the-mount-on-fire'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*his voice out of the midst of the fire... Elohim (God) doth talk with man, and he liveth* (Deuteronomy 5:24) — the voice-answering of 19:19: the Formed Son speaks from the fire and the people are not consumed.'
  FROM cross_reference_threads t
  JOIN _s305_ex19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=19 AND sv.verse_number=19
  JOIN _s305_ex19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-19-thunders-and-the-trumpet-and-the-mount-on-fire'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the eternal Elohim (God) will tread upon the earth, even on Mount Sinai... appear in the strength of His might* (1 Enoch 1:4) — the Holy One on Sinai, the same descent as *Yahuah descended upon it in fire* (19:18).'
  FROM cross_reference_threads t
  JOIN _s305_ex19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=19 AND sv.verse_number=18
  JOIN _s305_ex19_lookup tv ON tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=1 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-19-thunders-and-the-trumpet-and-the-mount-on-fire'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*the glory of Yahuah (God) abode on Mount Sinai, and a cloud overshadowed it* (Jubilees 1:2) — the cloud and glory of *a thick cloud upon the mount* (19:16) kept in the restored witness.'
  FROM cross_reference_threads t
  JOIN _s305_ex19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=19 AND sv.verse_number=16
  JOIN _s305_ex19_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=1 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-19-thunders-and-the-trumpet-and-the-mount-on-fire'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*the appearance of the glory of Yahuah (God) was like a flaming fire on the top of the Mount* (Jubilees 1:3) — matches *Yahuah descended upon it in fire* (19:18): the glory and the fire are one.'
  FROM cross_reference_threads t
  JOIN _s305_ex19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=19 AND sv.verse_number=18
  JOIN _s305_ex19_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=1 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-19-thunders-and-the-trumpet-and-the-mount-on-fire'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*the glory of Yahuah (the Lord) rested upon Mount Sinai... Moses came in the midst of a cloud* (Jasher 82:8) — the resting Glory of *altogether on a smoke, because Yahuah descended upon it in fire* (19:18).'
  FROM cross_reference_threads t
  JOIN _s305_ex19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=19 AND sv.verse_number=18
  JOIN _s305_ex19_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=82 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-19-thunders-and-the-trumpet-and-the-mount-on-fire'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Thou camest down also upon mount Sinai... and gavest them... true laws, good statutes and commandments* (Nehemiah 9:13) — the One who descended in fire (19:18) is the One who gave the Torah, named good and true.'
  FROM cross_reference_threads t
  JOIN _s305_ex19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=19 AND sv.verse_number=18
  JOIN _s305_ex19_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-19-yahuah-descended-upon-it-in-fire'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*as Yahuah (God) spake to Moses on Mount Sinai... "Go up to the top of the Mount"* (Jubilees 1:1) — the descended Yahuah calling Moses up (19:20) to receive the tables of the law.'
  FROM cross_reference_threads t
  JOIN _s305_ex19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=19 AND sv.verse_number=20
  JOIN _s305_ex19_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=1 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-19-yahuah-descended-upon-it-in-fire'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Yahuah (the Lord) gave to Israel the ten commandments on Mount Sinai* (Jasher 82:6) — the gift of the descent of *Yahuah came down upon mount Sinai* (19:20): the ten words of the holy nation.'
  FROM cross_reference_threads t
  JOIN _s305_ex19_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=19 AND sv.verse_number=20
  JOIN _s305_ex19_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=82 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-19-yahuah-descended-upon-it-in-fire'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_exodus_20.sql (Exodus 20) -----
-- Chapter: Exodus 20 — THE TEN WORDS, THE DECALOGUE: Yahuah speaks all these words from the mount — "I am Yahuah thy Elohim, which brought thee out of Egypt" (the preamble, grace before the commands); no other gods, no graven image, "I am a jealous Elohim"; not take the Name in vain; "Remember the sabbath day to keep it holy... for in six days Yahuah made heaven and earth" (creation-rooted, the fourth word); honour father and mother; thou shalt not kill / commit adultery / steal / bear false witness / covet (the second table); the people stood afar off and Moses drew near to the thick darkness; the altar of earth, unhewn stone. The everlasting covenant standard — GIVEN, never abolished (Matthew 5:17-19 the anti-antinomian centerpiece, 1 John 2:3-4 the filter).
-- Tag: ex20   Temp view: _s305_ex20_lookup
-- Sort band: base 29475, step 3 -> threads at 29475, 29478, 29481, 29484, 29487, 29490, 29493 (7 threads)
-- Source of EVERY row: 'canon','exodus',20,v
--
-- Exodus 20 coverage:
--   ★ v.1-2 (I am Yahuah thy Elohim, which brought thee out of Egypt, out of the house of bondage — the PREAMBLE, grace precedes the commands)
--        NT:     none warranted distinct (the redeemed-first-then-given-Torah shape is carried by THREAD 1's Deut lateral + the peculiar-people Jubilees; NT "saved unto good works" Eph 2:10 belongs to its own pack)
--        Extras: Jubilees 2:19 (I will separate to Myself a people... I will sanctify them to Myself as My people... they will be My people and I shall be their Elohim); Jubilees 2:20 (chosen the seed of Jacob... written him down as My firstborn son) — THREAD 1
--        Tanakh: ★ Deuteronomy 5:6 (I am Yahuah Elohayka, which brought thee out of the land of Egypt, from the house of bondage) — the second giving, verse-for-verse — THREAD 1
--   ★★ v.3-6 (no other gods before me; no graven image; bow not down; I Yahuah am a jealous Elohim; mercy to thousands of them that love me and keep my commandments — first/second words)
--        NT:     Matthew 4:10 (Thou shalt worship Yahuah Elohayka, and him only shalt thou serve); Matthew 22:37-38 (Thou shalt love Yahuah Elohayka with all thy heart... the first and great commandment); 1 Corinthians 8:4-6 (an idol is nothing... none other Elohim but one... to us there is but one Elohim, the Father); 1 John 5:21 (keep yourselves from idols) — THREAD 2
--        Extras: none warranted distinct as MEMBER (Wisdom 13-14 idol-folly clean but the seed-war-against-idolatry weave is fully carried by the NT + Deut lateral; not forced)
--        Tanakh: ★ Deuteronomy 5:7-9 (none other gods... not make thee any graven image... a jealous Elohim) — second giving — THREAD 2
--   ★ v.7 (not take the name of Yahuah in vain; Yahuah will not hold him guiltless — the third word)
--        NT:     Matthew 5:33-37 (Swear not at all... let your communication be, Yea, yea; Nay, nay) — THREAD 3
--        Extras: ★ Sirach 23:9-11 (Accustom not your mouth to swearing; neither use thyself to the naming of the Holy One... he that sweareth and nameth Yahuah continually shall not be faultless) — THREAD 3
--        Tanakh: ★ Leviticus 19:12 (ye shall not swear by my name falsely, neither shalt thou profane the name of thy Elohim: I am Yahuah); Deuteronomy 5:11 (second giving) — THREAD 3
--   ★★★ v.8-11 (Remember the sabbath day to keep it holy... the seventh day is the sabbath of Yahuah... for in six days Yahuah made heaven and earth... and rested the seventh day: wherefore Yahuah blessed the sabbath day, and hallowed it — THE FOURTH WORD, creation-rooted)
--        NT:     ★ Hebrews 4:9 (There remaineth therefore a rest to the people of Elohim); ★ Mark 2:27-28 (The sabbath was made for man... the Son of Adam is Yahuah also of the sabbath) — THREAD 4
--        Extras: ★★ Jubilees 2:1 (kept Sabbath on the seventh day and hallowed it for all ages, and appointed it as a sign for all His works); Jubilees 2:19 (these will keep the Sabbath day... they will be My people); Jubilees 50:9 (rest... and keep Sabbath from all work... a holy day... for all Yashar'el for ever) — THREAD 4
--        Tanakh: ★★ Genesis 2:2-3 (on the seventh day Elohim... rested... blessed the seventh day, and sanctified it — creation root); ★ Isaiah 58:13-14 (turn away thy foot from the sabbath... call the sabbath a delight); ★ Isaiah 66:23 (from one sabbath to another, shall all flesh come to worship); Deuteronomy 5:12-15 (Keep the sabbath day... as Yahuah commanded thee) — THREAD 4
--   ★ v.12 (Honour thy father and thy mother: that thy days may be long upon the land — the fifth word)
--        NT:     Matthew 15:4 (Honour thy father and mother... He that curseth father or mother, let him die the death); Matthew 19:19 (Honour thy father and thy mother... love thy neighbour as thyself); Ephesians 6:2-3 (Honour thy father and mother; which is the first commandment with promise) — THREAD 5
--        Extras: none warranted distinct (Sirach 3 honour-of-parents clean but the NT triple-witness fully carries the fifth word; held)
--        Tanakh: ★ Deuteronomy 5:16 (Honour thy father and thy mother... that thy days may be prolonged) — second giving — THREAD 5
--   ★★ v.13-17 (Thou shalt not kill / commit adultery / steal / bear false witness / covet — the SECOND TABLE, love of neighbour)
--        NT:     ★★★ Matthew 5:17-19 (Think not that I am come to destroy the law... I am not come to destroy, but to fulfil... whosoever shall do and teach them, the same shall be called great) THE ANTI-ANTINOMIAN CENTERPIECE; Matthew 5:21-22 (Thou shalt not kill... whosoever is angry with his brother); Matthew 5:27-28 (Thou shalt not commit adultery... whosoever looketh on a woman to lust); ★ Romans 13:9 (Thou shalt not commit adultery... briefly comprehended in this saying, Thou shalt love thy neighbour); Romans 7:7 (I had not known lust, except the law had said, Thou shalt not covet); James 2:11 (he that said, Do not commit adultery, said also, Do not kill) — THREAD 6
--        Extras: none warranted distinct (the Decalogue-affirmed-and-deepened weave is fully NT + Lev 19:18 lateral; not forced)
--        Tanakh: ★ Leviticus 19:18 (thou shalt love thy neighbour as thyself: I am Yahuah) — the second table summed; Deuteronomy 5:17-21 (second giving) — THREAD 6
--   ★ v.18-21 (the people saw the thunderings... stood afar off; let not Elohim speak with us, lest we die; Moses drew near unto the thick darkness — Sinai terror and the mediator)
--        NT:     ★ Hebrews 12:18-21 (ye are not come unto the mount that might be touched, and that burned with fire... so terrible was the sight, that Moses said, I exceedingly fear and quake); 1 Timothy 2:5 (one mediator between Elohim and men, the man HaMashiach Yahusha) — THREAD 7
--        Extras: none warranted distinct
--        Tanakh: ★ Deuteronomy 5:23-27 (when ye heard the voice... ye came near unto me... Go thou near, and hear... and we will hear it, and do it) — second giving — THREAD 7
--   v.22-26 (gods of silver and gold; the altar of earth; in all places where I record my name I will bless thee; unhewn stone; no steps)
--        NT:     none warranted   Extras: none warranted   Tanakh: the silver/gold idol echo is carried by THREAD 2; the altar/record-my-name instruction is the Tabernacle pack's concern — NO ADD (no clean framework-bearing weave forced here)
--
-- Threads (slug — target libraries):
--   1. exodus-20-i-am-yahuah-which-brought-thee-out-of-egypt — Tanakh (Deuteronomy) + Extras (Jubilees) [extras] (★ the preamble; grace precedes the commands — redeemed FIRST, then given the Torah)
--   2. exodus-20-thou-shalt-have-no-other-gods-no-graven-image — NT (Matthew, 1 Corinthians, 1 John) + Tanakh (Deuteronomy) [free] (★★ first/second words; worship Him only)
--   3. exodus-20-not-take-the-name-of-yahuah-in-vain — NT (Matthew) + Tanakh (Leviticus, Deuteronomy) + Extras (Sirach) [extras] (★ the third word; reverence of the Name)
--   4. exodus-20-remember-the-sabbath-day-to-keep-it-holy — NT (Hebrews, Mark) + Tanakh (Genesis, Isaiah, Deuteronomy) + Extras (Jubilees) [extras] (★★★ THE keystone Sabbath thread; creation-rooted, NOT abolished)
--   5. exodus-20-honour-thy-father-and-thy-mother — NT (Matthew, Ephesians) + Tanakh (Deuteronomy) [free] (★ the fifth word, first commandment with promise)
--   6. exodus-20-thou-shalt-not-kill-the-second-table-love-of-neighbour — NT (Matthew, Romans, James) + Tanakh (Leviticus, Deuteronomy) [free] (★★ words six-ten; Messiah INTENSIFIES not abolishes; Matt 5:17-19 the centerpiece)
--   7. exodus-20-the-people-stood-afar-off-moses-drew-near-the-mediator — NT (Hebrews, 1 Timothy) + Tanakh (Deuteronomy) [free] (★ Sinai terror; the mediator Moses → the better Mediator)
--
-- Framing notes:
--   ★ PREAMBLE (THREAD 1): *I am Yahuah Elohayka (the LORD thy God), which have brought thee out of the land of Egypt, out of the house of bondage* (20:2) stands BEFORE every command. The framework reads the Decalogue's opening as grace-precedes-the-commands (Red Line #6): Yashar'el is redeemed FIRST, brought out by the mighty hand, and ONLY THEN given the Torah — never legalism, never earning the deliverance. Jubilees 2:19-20 names the peculiar-people election that the redemption seals (two-house: *the seed of Jacob... My firstborn son*).
--   ★★ FIRST/SECOND WORDS (THREAD 2): *Thou shalt have no other gods before me* (20:3) and *I Yahuah Elohayka am a jealous Elohim* (20:5). Yahusha quotes it in the wilderness — *Thou shalt worship Yahuah Elohayka, and him only shalt thou serve* (Matthew 4:10) — and names it the first and great commandment (Matthew 22:37). The seed-war against idolatry: *an idol is nothing in the world, and... there is none other Elohim but one* (1 Corinthians 8:4), *but to us there is but one Elohim, the Father... and one Lord Yahusha HaMashiach* (1 Corinthians 8:6) — the Formed-and-the-Formless held clean: the Father the one Elohim, the Son the one Lord through whom all things, NOT two co-equal persons, NOT a second god. *Little children, keep yourselves from idols* (1 John 5:21) seals it.
--   ★ THE NAME (THREAD 3): *Thou shalt not take the name of Yahuah Elohayka in vain* (20:7). Woven to Leviticus 19:12 (*ye shall not swear by my name falsely, neither shalt thou profane the name of thy Elohim*) and to Yahusha's deepening — *Swear not at all... let your communication be, Yea, yea; Nay, nay* (Matthew 5:34,37) — and Sirach 23:9-11 (*neither use thyself to the naming of the Holy One*). Reverence of the Name, never lightly upon the lips.
--   ★★★ THE SABBATH (THREAD 4, THE KEYSTONE — Red Line #3): *Remember the sabbath day, to keep it holy... for in six days Yahuah made heaven and earth... and rested the seventh day: wherefore Yahuah blessed the sabbath day, and hallowed it* (20:8-11). Creation-rooted — Genesis 2:2-3 — NOT a Jewish ceremony abolished at the cross. Hebrews 4:9: *There remaineth therefore a rest [sabbatismos] to the people of Elohim* — PRESENT TENSE, still remaining. Mark 2:27-28: *the sabbath was made for man... the Son of Adam is Yahuah also of the sabbath* — the Formed Son is its Lord, He upholds it, He does not abolish it. Isaiah 58:13-14 calls it *a delight*; Isaiah 66:23 carries it into the new heavens — *from one sabbath to another, shall all flesh come to worship*. Jubilees 2:1 names it *a sign for all His works*; Jubilees 50:9 *a holy day... for all Yashar'el for ever*. The 1 John 2:3-4 filter: any reading that makes the fourth word irrelevant is false.
--   ★ FIFTH WORD (THREAD 5): *Honour thy father and thy mother* (20:12). Yahusha defends it against the corban-tradition (Matthew 15:4); Sha'ul names it *the first commandment with promise* (Ephesians 6:2-3). The Decalogue affirmed.
--   ★★ SECOND TABLE (THREAD 6, the anti-antinomian heart): *Thou shalt not kill... commit adultery... steal... bear false witness... covet* (20:13-17). THE CENTERPIECE: *Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil... Whosoever therefore shall break one of these least commandments... but whosoever shall do and teach them, the same shall be called great in the kingdom of heaven* (Matthew 5:17,19). Yahusha INTENSIFIES the words to the heart — anger is murder (Matthew 5:21-22), lust is adultery (Matthew 5:27-28) — never abolishing. Sha'ul: the commandments are *briefly comprehended in this saying, Thou shalt love thy neighbour as thyself* (Romans 13:9; Leviticus 19:18), and *I had not known lust, except the law had said, Thou shalt not covet* (Romans 7:7). Ya'aqob: the Lawgiver who said one said all (James 2:11). The Decalogue affirmed and deepened by Messiah and the apostles, never set aside.
--   ★ SINAI TERROR / THE MEDIATOR (THREAD 7): *the people... stood afar off... let not Elohim speak with us, lest we die... and Moses drew near unto the thick darkness where Elohim was* (20:18-21). Hebrews 12:18-21 names the terror of the touchable mount; the mediator Moses who stood between (Deuteronomy 5:5) foreshadows *one mediator between Elohim and men, the man HaMashiach Yahusha* (1 Timothy 2:5) — framed as the MAN who mediates (the Formed Son who took flesh), lateral and clean, NOT a co-equal-person grammar.
--   EXTRAS: Jubilees DOUBLE-WRITTEN 'jubilees','jubilees'. Jubilees 2 + 50 carry the Sabbath as the great sign and the everlasting ordinance of Yashar'el (clean parse). Sirach 23 (edition 'apocrypha', book 'ecclesiasticus') carries the reverence-of-the-Name (clean). No Jasher/Enoch member warranted in this chapter.
--   VERSES WITH NO ADD: v.22-26 (gods of silver/gold echo carried by THREAD 2; the altar-of-earth / record-my-name / unhewn-stone instruction belongs to the Tabernacle-altar concern of later packs — no clean framework-bearing target forced here).

CREATE TEMP VIEW _s305_ex20_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: I am Yahuah which brought thee out of Egypt (the preamble — grace precedes the commands)
    ('canon','exodus',20,2,'canon','deuteronomy',5,6,'free',
      E'*I am Yahuah Elohayka (the LORD thy God), which brought thee out of the land of Egypt, from the house of bondage* (Deuteronomy 5:6). The second giving of the Ten Words opens with the very same preamble as *I am Yahuah Elohayka (the LORD thy God), which have brought thee out of the land of Egypt, out of the house of bondage* (Exodus 20:2). Before one command is spoken, the redemption is named: Yashar''el (Israel) is brought out FIRST, by the mighty hand, and only then given the Torah — the covenant standard rests on grace already received, never on a wage to be earned.'),
    ('canon','exodus',20,2,'jubilees','jubilees',2,19,'extras',
      E'*Behold, I will separate to Myself a people from among all the peoples... and I will sanctify them to Myself as My people, and will bless them... and they will be My people and I shall be their Elohim (God)* (Jubilees 2:19). The restored witness names the election the redemption seals: the One who *brought thee out of the land of Egypt* (Exodus 20:2) is the One who separates a people to Himself — *they will be My people and I shall be their Elohim*. The Ten Words are the covenant-life of a people already chosen and brought out, not the price of becoming His.'),
    ('canon','exodus',20,2,'jubilees','jubilees',2,20,'extras',
      E'*And I have chosen the seed of Jacob from amongst all that I have seen, and have written him down as My firstborn son, and have sanctified him to Myself for ever and ever* (Jubilees 2:20). The redeemed people of *brought thee out of the land of Egypt, out of the house of bondage* (Exodus 20:2) are *the seed of Jacob... My firstborn son* — the covenant lineage (the two-house people) sanctified for ever. The deliverance from Egypt is the redemption of a son already chosen; the commands that follow are the household law of the firstborn.'),

    -- THREAD 2 (★★): Thou shalt have no other gods — no graven image — a jealous Elohim
    ('canon','exodus',20,3,'canon','deuteronomy',5,7,'free',
      E'*Thou shalt have none other gods before me* (Deuteronomy 5:7). The second giving keeps the first word entire, matching *Thou shalt have no other gods before me* (Exodus 20:3). One Yahuah, no rival — the foundation on which every other word stands.'),
    ('canon','exodus',20,4,'canon','deuteronomy',5,8,'free',
      E'*Thou shalt not make thee any graven image, or any likeness of any thing that is in heaven above, or that is in the earth beneath, or that is in the waters beneath the earth* (Deuteronomy 5:8). The second giving carries the second word whole, matching *Thou shalt not make unto thee any graven image, or any likeness of any thing that is in heaven above* (Exodus 20:4). The invisible Yahuah is not to be reduced to a carved thing; worship is bound to the Word, never to an image.'),
    ('canon','exodus',20,3,'canon','matthew',4,10,'free',
      E'*Then saith Yahusha (Jesus) unto him, Get thee hence, Satan: for it is written, Thou shalt worship Yahuah Elohayka (the Lord thy God), and him only shalt thou serve* (Matthew 4:10). In the wilderness the Formed Son wields the first word itself against the tempter''s offer of the kingdoms — *Thou shalt have no other gods before me* (Exodus 20:3) becomes *him only shalt thou serve*. The Ten Words are not abolished by Messiah; He lives by them and defeats the adversary with them.'),
    ('canon','exodus',20,3,'canon','matthew',22,37,'free',
      E'*Yahusha (Jesus) said unto him, Thou shalt love Yahuah Elohayka (the Lord thy God) with all thy heart, and with all thy soul, and with all thy mind. This is the first and great commandment* (Matthew 22:37-38). The first word — *Thou shalt have no other gods before me* (Exodus 20:3) — is named by Yahusha *the first and great commandment*: undivided love for the one Yahuah, the heart of the whole first table.'),
    ('canon','exodus',20,3,'canon','1-corinthians',8,4,'free',
      E'*As concerning therefore the eating of those things that are offered in sacrifice unto idols, we know that an idol is nothing in the world, and that there is none other Elohim (God) but one* (1 Corinthians 8:4). Sha''ul (Paul) reasons straight from *Thou shalt have no other gods before me* (Exodus 20:3): *an idol is nothing... there is none other Elohim but one*. The so-called gods are emptiness; the first word stands.'),
    ('canon','exodus',20,3,'canon','1-corinthians',8,6,'free',
      E'*But to us there is but one Elohim (God), the Father, of whom are all things, and we in him; and one Lord Yahusha HaMashiach (Lord Jesus Christ), by whom are all things, and we by him* (1 Corinthians 8:6). The one-Yahuah confession of *no other gods before me* (Exodus 20:3) is upheld in the Formed-and-the-Formless: *one Elohim, the Father, of whom are all things*, and *one Lord Yahusha HaMashiach, by whom are all things* — the Father the Source, the Son the One through whom all things came, never two co-equal gods, never a rival to the Father.'),
    ('canon','exodus',20,4,'canon','1-john',5,21,'free',
      E'*Little children, keep yourselves from idols. Amen* (1 John 5:21). The whole letter closes on the second word — *Thou shalt not make unto thee any graven image* (Exodus 20:4) — *keep yourselves from idols*. The seed-war against idolatry runs from Sinai to the last apostle: the people of the one Yahuah guard their worship from every carved and counterfeit thing.'),

    -- THREAD 3 (★): Not take the name of Yahuah in vain (the third word)
    ('canon','exodus',20,7,'canon','deuteronomy',5,11,'free',
      E'*Thou shalt not take the name of Yahuah Elohayka (the LORD thy God) in vain: for Yahuah (LORD) will not hold him guiltless that taketh his name in vain* (Deuteronomy 5:11). The second giving keeps the third word verse-for-verse with *Thou shalt not take the name of Yahuah Elohayka (the LORD thy God) in vain; for Yahuah (LORD) will not hold him guiltless that taketh his name in vain* (Exodus 20:7). The Name is holy; it is not to be emptied, sworn lightly, or worn as a cloak for falsehood.'),
    ('canon','exodus',20,7,'canon','leviticus',19,12,'free',
      E'*And ye shall not swear by my name falsely, neither shalt thou profane the name of thy Elohim (God): I am Yahuah (LORD)* (Leviticus 19:12). The third word — *Thou shalt not take the name of Yahuah Elohayka (the LORD thy God) in vain* (Exodus 20:7) — is unfolded in the holiness law: to swear falsely by the Name is to *profane the name of thy Elohim*. Reverence of the Name and truth on the lips are one command.'),
    ('canon','exodus',20,7,'canon','matthew',5,34,'free',
      E'*But I say unto you, Swear not at all; neither by heaven; for it is Elohim''s (God''s) throne... But let your communication be, Yea, yea; Nay, nay: for whatsoever is more than these cometh of evil* (Matthew 5:34,37). Yahusha drives the third word — *not take the name of Yahuah... in vain* (Exodus 20:7) — to its root: rather than guard the Name against false oaths, let speech be so true that no oath is needed. He deepens the word, never loosens it.'),
    ('canon','exodus',20,7,'apocrypha','ecclesiasticus',23,9,'extras',
      E'*Accustom not your mouth to swearing; neither use thyself to the naming of the Holy One* (Sirach 23:9). The wisdom of the fathers guards the third word — *not take the name of Yahuah Elohayka (the LORD thy God) in vain* (Exodus 20:7) — by warning against the careless, habitual naming of the Holy One; *he that sweareth and nameth Yahuah (God) continually shall not be faultless* (Sirach 23:10). The Name is not to grow common on the tongue.'),

    -- THREAD 4 (★★★ KEYSTONE): Remember the sabbath day — for in six days Yahuah made heaven and earth
    ('canon','exodus',20,11,'canon','genesis',2,2,'free',
      E'*And on the seventh day Elohim (God) ended his work which he had made; and he rested on the seventh day from all his work which he had made* (Genesis 2:2). The fourth word grounds itself in creation: *For in six days Yahuah (LORD) made heaven and earth... and rested the seventh day* (Exodus 20:11). The Sabbath is not a later Jewish ceremony but a creation ordinance — Yahuah Himself rested on the seventh day before any nation existed; the seventh-day rest is woven into the world.'),
    ('canon','exodus',20,11,'canon','genesis',2,3,'free',
      E'*And Elohim (God) blessed the seventh day, and sanctified it: because that in it he had rested from all his work which Elohim (God) created and made* (Genesis 2:3). The closing word of the fourth command — *wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it* (Exodus 20:11) — is the very act of creation: *Elohim blessed the seventh day, and sanctified it*. What Yahuah blessed and hallowed at the foundation is what Yashar''el (Israel) is commanded to remember; the blessing was set on the day before it was ever commanded.'),
    ('canon','exodus',20,8,'canon','deuteronomy',5,12,'free',
      E'*Keep the sabbath day to sanctify it, as Yahuah Elohayka (the LORD thy God) hath commanded thee* (Deuteronomy 5:12). The second giving keeps the fourth word — *Remember the sabbath day, to keep it holy* (Exodus 20:8) — with *Keep the sabbath day to sanctify it, as Yahuah Elohayka hath commanded thee*. Exodus says remember (the creation root); Deuteronomy says keep (and adds the Egypt-deliverance ground, 5:15) — two facets of the one everlasting command.'),
    ('canon','exodus',20,9,'canon','hebrews',4,9,'free',
      E'*There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9). The Sabbath of *six days shalt thou labour... but the seventh day is the sabbath of Yahuah Elohayka* (Exodus 20:9-10) is spoken of in the present tense, still standing: *there remaineth* — a sabbath-rest (sabbatismos) yet for the people of Elohim. The letter does not abolish the seventh-day rest; it presses its abiding reality, *for he that is entered into his rest, he also hath ceased from his own works, as Elohim did from his* (Hebrews 4:10).'),
    ('canon','exodus',20,10,'canon','mark',2,27,'free',
      E'*And he said unto them, The sabbath was made for man, and not man for the sabbath: Therefore the Son of Adam is Yahuah (Lord) also of the sabbath* (Mark 2:27-28). The seventh-day rest of *the seventh day is the sabbath of Yahuah Elohayka* (Exodus 20:10) was *made for man* — a gift, not a burden. And the Formed Son is its Lord: *the Son of Adam is Yahuah also of the sabbath* — He who made it and rested at creation upholds and rightly keeps it; the Lord of the Sabbath does not abolish His own day.'),
    ('canon','exodus',20,8,'canon','isaiah',58,13,'free',
      E'*If thou turn away thy foot from the sabbath, from doing thy pleasure on my holy day; and call the sabbath a delight, the holy of Yahuah (LORD), honourable... Then shalt thou delight thyself in Yahuah* (Isaiah 58:13-14). The command to *keep it holy* (Exodus 20:8) is unfolded by the prophet as joy, not bondage — *call the sabbath a delight, the holy of Yahuah, honourable*. The day set apart at creation is the day of delight in Yahuah, with the heritage of Jacob promised to those who keep it.'),
    ('canon','exodus',20,11,'canon','isaiah',66,23,'free',
      E'*And it shall come to pass, that from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me, saith Yahuah (LORD)* (Isaiah 66:23). The hallowed seventh day of *Yahuah blessed the sabbath day, and hallowed it* (Exodus 20:11) is carried into the new heavens and new earth: *from one sabbath to another, shall all flesh come to worship*. Far from being abolished, the Sabbath endures into the world to come, kept by all flesh before Yahuah.'),
    ('canon','exodus',20,11,'jubilees','jubilees',2,1,'extras',
      E'*...how in six days Yahuah Elohim (the LORD God) finished all His works and all that He created, and kept Sabbath on the seventh day and hallowed it for all ages, and appointed it as a sign for all His works* (Jubilees 2:1). The restored witness names the very ground of *in six days Yahuah made heaven and earth... and rested the seventh day* (Exodus 20:11): Yahuah *kept Sabbath on the seventh day and hallowed it for all ages, and appointed it as a sign for all His works*. The seventh-day rest is a creation sign set for all ages, not a temporary ordinance.'),
    ('canon','exodus',20,10,'jubilees','jubilees',2,19,'extras',
      E'*Behold, I will separate to Myself a people from among all the peoples, and these will keep the Sabbath day, and I will sanctify them to Myself as My people... even so shall I bless them, and they will be My people and I shall be their Elohim (God)* (Jubilees 2:19). The keeping of *the sabbath of Yahuah Elohayka* (Exodus 20:10) is the very mark of the separated people — *these will keep the Sabbath day, and I will sanctify them to Myself as My people*. The Sabbath is the sign between Yahuah and His own; to keep it is to be marked as His.'),
    ('canon','exodus',20,10,'jubilees','jubilees',50,9,'extras',
      E'*You shall do no work whatever on the Sabbath day save that you have prepared for yourselves on the sixth day, so as to eat, and drink, and rest, and keep Sabbath from all work on that day, and to bless Yahuah your Elohim (the LORD your God)... a day of the holy kingdom for all Yashar''el (Israel) is this day among their days for ever* (Jubilees 50:9). The rest of *in it thou shalt not do any work* (Exodus 20:10) is named an everlasting ordinance — *a holy day... for all Yashar''el for ever*. The fourth word is no shadow that passes; it is the holy day of the kingdom, kept for ever.'),

    -- THREAD 5 (★): Honour thy father and thy mother (the fifth word)
    ('canon','exodus',20,12,'canon','deuteronomy',5,16,'free',
      E'*Honour thy father and thy mother, as Yahuah Elohayka (the LORD thy God) hath commanded thee; that thy days may be prolonged, and that it may go well with thee, in the land which Yahuah Elohayka (the LORD thy God) giveth thee* (Deuteronomy 5:16). The second giving keeps the fifth word with its promise, matching *Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka giveth thee* (Exodus 20:12). The honour owed to parents is the hinge between the love of Yahuah and the love of neighbour, and it carries a promise of long life in the land.'),
    ('canon','exodus',20,12,'canon','matthew',15,4,'free',
      E'*For Elohim (God) commanded, saying, Honour thy father and mother: and, He that curseth father or mother, let him die the death* (Matthew 15:4). Yahusha defends the fifth word — *Honour thy father and thy mother* (Exodus 20:12) — against the tradition that let men withhold from their parents under cover of a vow. He calls it what Yahuah commanded and binds men to it; the word is upheld against the commandments of men.'),
    ('canon','exodus',20,12,'canon','matthew',19,19,'free',
      E'*Honour thy father and thy mother: and, Thou shalt love thy neighbour as thyself* (Matthew 19:19). To the man who asked the way to life, Yahusha names the fifth word — *Honour thy father and thy mother* (Exodus 20:12) — among the very commandments to be kept. The way of life He points to is the keeping of these words, not their setting aside.'),
    ('canon','exodus',20,12,'canon','ephesians',6,2,'free',
      E'*Honour thy father and mother; (which is the first commandment with promise;) That it may be well with thee, and thou mayest live long on the earth* (Ephesians 6:2-3). Sha''ul (Paul) teaches the fifth word to the assemblies as binding — *Honour thy father and thy mother* (Exodus 20:12) — and names it *the first commandment with promise*. The Decalogue is the standard the apostle hands on, promise and all, not a code left behind.'),

    -- THREAD 6 (★★): Thou shalt not kill / commit adultery / steal / bear false witness / covet (the second table)
    ('canon','exodus',20,13,'canon','matthew',5,17,'free',
      E'*Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil. For verily I say unto you, Till heaven and earth pass, one jot or one tittle shall in no wise pass from the law, till all be fulfilled* (Matthew 5:17-18). Before He touches a single command of the second table — *Thou shalt not kill* (Exodus 20:13) and the words that follow — Yahusha sets the frame plainly: He is *not come to destroy, but to fulfil*; not one jot or tittle of the law shall pass. The Ten Words stand; what follows is their deepening, never their abolition.'),
    ('canon','exodus',20,13,'canon','matthew',5,19,'free',
      E'*Whosoever therefore shall break one of these least commandments, and shall teach men so, he shall be called the least in the kingdom of heaven: but whosoever shall do and teach them, the same shall be called great in the kingdom of heaven* (Matthew 5:19). The second table — *Thou shalt not kill... commit adultery... steal... bear false witness... covet* (Exodus 20:13-17) — is exactly what Yahusha guards here: greatness in the kingdom is for those who *do and teach* the commandments, least for those who break and teach men to break them. This is the anti-antinomian word: the Torah is the covenant inheritance, kept and taught, never loosed.'),
    ('canon','exodus',20,13,'canon','matthew',5,21,'free',
      E'*Ye have heard that it was said by them of old time, Thou shalt not kill... But I say unto you, That whosoever is angry with his brother without a cause shall be in danger of the judgment* (Matthew 5:21-22). Yahusha takes the sixth word — *Thou shalt not kill* (Exodus 20:13) — and presses it inward to its root: the murder begins in the anger of the heart. He intensifies the command, reaching past the hand to the heart, never relaxing it.'),
    ('canon','exodus',20,14,'canon','matthew',5,27,'free',
      E'*Ye have heard that it was said by them of old time, Thou shalt not commit adultery: But I say unto you, That whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart* (Matthew 5:27-28). The seventh word — *Thou shalt not commit adultery* (Exodus 20:14) — is driven to the heart: the lustful look is already the breach. Yahusha makes the command more searching, not less binding; the second table reaches the inward man.'),
    ('canon','exodus',20,14,'canon','romans',13,9,'free',
      E'*For this, Thou shalt not commit adultery, Thou shalt not kill, Thou shalt not steal, Thou shalt not bear false witness, Thou shalt not covet; and if there be any other commandment, it is briefly comprehended in this saying, namely, Thou shalt love thy neighbour as thyself* (Romans 13:9). Sha''ul (Paul) gathers the whole second table — *commit adultery... kill... steal... bear false witness... covet* (Exodus 20:13-17) — and shows it summed in love: *Thou shalt love thy neighbour as thyself*. Love does not replace the commandments; it is their fulfilling, *for love is the fulfilling of the law* (Romans 13:10).'),
    ('canon','exodus',20,17,'canon','romans',7,7,'free',
      E'*Nay, I had not known sin, but by the law: for I had not known lust, except the law had said, Thou shalt not covet* (Romans 7:7). The tenth word — *Thou shalt not covet thy neighbour''s house... nor any thing that is thy neighbour''s* (Exodus 20:17) — is what taught Sha''ul to know sin for what it is. Far from being abolished, the command is honoured as holy and good: it is the very lamp that exposes the coveting heart.'),
    ('canon','exodus',20,14,'canon','james',2,11,'free',
      E'*For he that said, Do not commit adultery, said also, Do not kill. Now if thou commit no adultery, yet if thou kill, thou art become a transgressor of the law* (James 2:11). Ya''aqob (James) binds the words of the second table together by the one Lawgiver who spoke them — *Thou shalt not commit adultery* and *Thou shalt not kill* (Exodus 20:13-14). The Decalogue is one whole; to break one is to become a transgressor of the law, for it is Yahuah''s single living standard.'),
    ('canon','exodus',20,16,'canon','leviticus',19,18,'free',
      E'*Thou shalt not avenge, nor bear any grudge against the children of thy people, but thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). The second table — against killing, adultery, theft, false witness, coveting (Exodus 20:13-17) — is summed in the holiness law: *thou shalt love thy neighbour as thyself*. Every neighbour-ward command flows from this; the false witness of *Thou shalt not bear false witness against thy neighbour* (Exodus 20:16) is the opposite of the love owed him.'),
    ('canon','exodus',20,13,'canon','deuteronomy',5,17,'free',
      E'*Thou shalt not kill* (Deuteronomy 5:17). The second giving repeats the second table word-for-word, beginning with *Thou shalt not kill* — the same command as *Thou shalt not kill* (Exodus 20:13). The Ten Words are confirmed unchanged a second time at the edge of the land, the standard the people carry in with them.'),

    -- THREAD 7 (★): The people stood afar off — Moses drew near the thick darkness (the mediator)
    ('canon','exodus',20,18,'canon','hebrews',12,18,'free',
      E'*For ye are not come unto the mount that might be touched, and that burned with fire, nor unto blackness, and darkness, and tempest, And the sound of a trumpet, and the voice of words* (Hebrews 12:18-19). The terror of *all the people saw the thunderings, and the lightnings, and the noise of the trumpet, and the mountain smoking* (Exodus 20:18) is named exactly: the touchable mount that burned, the trumpet, the voice of words from which the people drew back. The same Yahuah who spoke the Ten Words is the consuming fire; the awe of Sinai is not erased but remembered.'),
    ('canon','exodus',20,19,'canon','hebrews',12,21,'free',
      E'*And so terrible was the sight, that Moses said, I exceedingly fear and quake* (Hebrews 12:21). The people''s cry — *let not Elohim (God) speak with us, lest we die* (Exodus 20:19) — is matched by the dread of Moses himself: *I exceedingly fear and quake*. The holiness of the One who gives the Law is such that even the mediator trembles; the Ten Words come from a fire that none may treat lightly.'),
    ('canon','exodus',20,21,'canon','1-timothy',2,5,'free',
      E'*For there is one Elohim (God), and one mediator between Elohim (God) and men, the man HaMashiach Yahusha (Christ Jesus)* (1 Timothy 2:5). When the people stood afar off and *Moses drew near unto the thick darkness where Elohim (God) was* (Exodus 20:21), he stood as mediator between Yahuah and the trembling people. Moses foreshadows the one to come — *one mediator between Elohim and men, the man HaMashiach Yahusha* — the Formed Son who took flesh and draws near for His people, the better Mediator the darkness of Sinai pointed toward.'),
    ('canon','exodus',20,19,'canon','deuteronomy',5,27,'free',
      E'*Go thou near, and hear all that Yahuah Eloheinu (the LORD our God) shall say: and speak thou unto us all that Yahuah Eloheinu (the LORD our God) shall speak unto thee; and we will hear it, and do it* (Deuteronomy 5:27). The second giving recounts the people''s plea of *Speak thou with us, and we will hear: but let not Elohim (God) speak with us, lest we die* (Exodus 20:19): they ask Moses to go near and bring back the word, *and we will hear it, and do it*. The mediator carries the word from the fire to the people, who pledge to hear and do — the very posture the framework upholds: hear and obey.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex20_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex20_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-20-i-am-yahuah-which-brought-thee-out-of-egypt',
       E'I am Yahuah which brought thee out of Egypt — grace precedes the commands',
       E'*And Elohim (God) spake all these words, saying, I am Yahuah Elohayka (the LORD thy God), which have brought thee out of the land of Egypt, out of the house of bondage* (Exodus 20:1-2). Before a single command is spoken, the redemption is named. This is the whole posture of the covenant: Yashar''el (Israel) is brought out FIRST, by the mighty hand and the stretched-out arm, and ONLY THEN given the Ten Words. The Torah is never the price of deliverance — it is the household law of a people already redeemed, already chosen, already brought out. The second giving opens with the very same preamble: *I am Yahuah Elohayka (the LORD thy God), which brought thee out of the land of Egypt, from the house of bondage* (Deuteronomy 5:6). The restored witness names the election the deliverance seals: *I will separate to Myself a people from among all the peoples... and I will sanctify them to Myself as My people... and they will be My people and I shall be their Elohim (God)* (Jubilees 2:19), and *I have chosen the seed of Jacob from amongst all that I have seen, and have written him down as My firstborn son, and have sanctified him to Myself for ever and ever* (Jubilees 2:20). The people of the Ten Words are the redeemed firstborn son, the two-house covenant lineage — never earning His favour by the law, but living the covenant-life of those already brought out of bondage. Grace before the commands, always.',
       sv.verse_id, ev.verse_id, 'extras', 29475
  FROM _s305_ex20_lookup sv, _s305_ex20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=20 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-20-thou-shalt-have-no-other-gods-no-graven-image',
       E'No other gods, no graven image — I Yahuah am a jealous Elohim',
       E'*Thou shalt have no other gods before me. Thou shalt not make unto thee any graven image, or any likeness of any thing that is in heaven above, or that is in the earth beneath, or that is in the water under the earth* (Exodus 20:3-4) — and the ground of it: *for I Yahuah Elohayka (the LORD thy God) am a jealous Elohim (God)... shewing mercy unto thousands of them that love me, and keep my commandments* (Exodus 20:5-6). The first and second words: one Yahuah, no rival, no carved likeness. The second giving keeps them whole (Deuteronomy 5:7-8). The Formed Son lives by the first word and wields it against the tempter: *Thou shalt worship Yahuah Elohayka (the Lord thy God), and him only shalt thou serve* (Matthew 4:10), and names it *the first and great commandment... Thou shalt love Yahuah Elohayka with all thy heart* (Matthew 22:37-38). Sha''ul (Paul) reasons straight from it: *an idol is nothing in the world, and... there is none other Elohim but one* (1 Corinthians 8:4); *but to us there is but one Elohim, the Father, of whom are all things... and one Lord Yahusha HaMashiach, by whom are all things* (1 Corinthians 8:6) — the Father the formless Source, the Formed Son the One through whom all things came, never two co-equal gods, never a rival to the one Yahuah. And the last apostle seals the second word: *Little children, keep yourselves from idols* (1 John 5:21). The seed-war against idolatry runs from Sinai to the end: the people of the one Yahuah guard their worship from every counterfeit and carved thing, and His mercy rests on *them that love me, and keep my commandments* (Exodus 20:6) — love and commandment-keeping bound together, the 1 John 2:3-4 filter.',
       sv.verse_id, ev.verse_id, 'free', 29478
  FROM _s305_ex20_lookup sv, _s305_ex20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=20 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-20-not-take-the-name-of-yahuah-in-vain',
       E'Thou shalt not take the name of Yahuah in vain — reverence of the Name',
       E'*Thou shalt not take the name of Yahuah Elohayka (the LORD thy God) in vain; for Yahuah (LORD) will not hold him guiltless that taketh his name in vain* (Exodus 20:7). The third word guards the Name itself — it is not to be emptied, sworn falsely, or worn as a cloak for a lie. The second giving keeps it verse-for-verse (Deuteronomy 5:11). The holiness law unfolds it: *ye shall not swear by my name falsely, neither shalt thou profane the name of thy Elohim (God): I am Yahuah (LORD)* (Leviticus 19:12) — to swear falsely by the Name is to profane it. And Yahusha drives it to its root, past the false oath to the false heart: *Swear not at all; neither by heaven; for it is Elohim''s (God''s) throne... But let your communication be, Yea, yea; Nay, nay: for whatsoever is more than these cometh of evil* (Matthew 5:34,37) — let speech be so true that no oath upon the Name is ever needed. The wisdom of the fathers warns the same: *Accustom not your mouth to swearing; neither use thyself to the naming of the Holy One* (Sirach 23:9), *for... he that sweareth and nameth Yahuah (God) continually shall not be faultless* (Sirach 23:10). The Name is holy; it is not to grow common or careless on the tongue. The third word is deepened by Messiah and the sages, never loosed.',
       sv.verse_id, ev.verse_id, 'extras', 29481
  FROM _s305_ex20_lookup sv, _s305_ex20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=20 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★★ KEYSTONE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-20-remember-the-sabbath-day-to-keep-it-holy',
       E'Remember the sabbath day to keep it holy — for in six days Yahuah made heaven and earth',
       E'*Remember the sabbath day, to keep it holy. Six days shalt thou labour, and do all thy work: But the seventh day is the sabbath of Yahuah Elohayka (the LORD thy God)... For in six days Yahuah (LORD) made heaven and earth, the sea, and all that in them is, and rested the seventh day: wherefore Yahuah (LORD) blessed the sabbath day, and hallowed it* (Exodus 20:8-11). The fourth word grounds itself not in Sinai but in CREATION. The Sabbath is no later Jewish ceremony bolted onto the Law and abolished at the cross — it is woven into the world from the seventh day: *And on the seventh day Elohim (God) ended his work... and he rested... And Elohim blessed the seventh day, and sanctified it* (Genesis 2:2-3). Yahuah blessed and hallowed the day before any nation existed; the command only bids Yashar''el (Israel) remember what was already holy. The second giving keeps it — *Keep the sabbath day to sanctify it, as Yahuah Elohayka hath commanded thee* (Deuteronomy 5:12) — adding the Egypt-deliverance ground; remember and keep are the two facets of the one everlasting word. The Renewed Writings do not abolish it: *There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9) — present tense, still standing, a sabbath-rest yet for His people. And the Formed Son is its Lord, not its destroyer: *The sabbath was made for man, and not man for the sabbath: Therefore the Son of Adam is Yahuah (Lord) also of the sabbath* (Mark 2:27-28) — He made it, He rested on it at creation, He upholds it as a gift to man. The prophet calls it joy — *call the sabbath a delight, the holy of Yahuah (LORD), honourable... Then shalt thou delight thyself in Yahuah* (Isaiah 58:13-14) — and carries it into the world to come: *from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me* (Isaiah 66:23). The restored witness names it the great sign: *kept Sabbath on the seventh day and hallowed it for all ages, and appointed it as a sign for all His works* (Jubilees 2:1); the mark of His separated people — *these will keep the Sabbath day, and I will sanctify them to Myself as My people* (Jubilees 2:19); the everlasting ordinance — *a day of the holy kingdom for all Yashar''el (Israel) is this day among their days for ever* (Jubilees 50:9). Creation-rooted, prophet-affirmed, kept by Messiah, carried into the new heavens — the fourth word stands. The 1 John 2:3-4 filter: any reading that makes the Sabbath irrelevant is the false reading this work exists to overturn.',
       sv.verse_id, ev.verse_id, 'extras', 29484
  FROM _s305_ex20_lookup sv, _s305_ex20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=20 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-20-honour-thy-father-and-thy-mother',
       E'Honour thy father and thy mother — the first commandment with promise',
       E'*Honour thy father and thy mother: that thy days may be long upon the land which Yahuah Elohayka (the LORD thy God) giveth thee* (Exodus 20:12). The fifth word is the hinge between the table of the love of Yahuah and the table of the love of neighbour, and it alone carries a promise — long life in the land. The second giving keeps it with its promise (Deuteronomy 5:16). Yahusha defends it against the corban-tradition that let men withhold from their parents under cover of a vow: *For Elohim (God) commanded, saying, Honour thy father and mother: and, He that curseth father or mother, let him die the death* (Matthew 15:4) — He upholds the word against the commandments of men. To the man who asked the way to life He names it among the commandments to be kept: *Honour thy father and thy mother: and, Thou shalt love thy neighbour as thyself* (Matthew 19:19). And Sha''ul (Paul) hands it to the assemblies as binding, promise and all: *Honour thy father and mother; (which is the first commandment with promise;) That it may be well with thee, and thou mayest live long on the earth* (Ephesians 6:2-3). The Decalogue is the standard taught from Sinai to the apostles — the fifth word affirmed, never abolished.',
       sv.verse_id, ev.verse_id, 'free', 29487
  FROM _s305_ex20_lookup sv, _s305_ex20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=20 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-20-thou-shalt-not-kill-the-second-table-love-of-neighbour',
       E'Thou shalt not kill, commit adultery, steal, bear false witness, covet — the second table, deepened not abolished',
       E'*Thou shalt not kill. Thou shalt not commit adultery. Thou shalt not steal. Thou shalt not bear false witness against thy neighbour. Thou shalt not covet... any thing that is thy neighbour''s* (Exodus 20:13-17). The second table — the love of neighbour in five commands. The second giving repeats them word-for-word (Deuteronomy 5:17-21). And here stands the anti-antinomian centerpiece of the whole Renewed Writings: before Yahusha touches a single one of these words He sets the frame — *Think not that I am come to destroy the law, or the prophets: I am not come to destroy, but to fulfil... one jot or one tittle shall in no wise pass from the law, till all be fulfilled* (Matthew 5:17-18) — and then, *Whosoever therefore shall break one of these least commandments, and shall teach men so, he shall be called the least in the kingdom of heaven: but whosoever shall do and teach them, the same shall be called great in the kingdom of heaven* (Matthew 5:19). He does not loose the Ten Words; He drives them to the heart. The sixth word reaches anger — *whosoever is angry with his brother... shall be in danger of the judgment* (Matthew 5:21-22); the seventh reaches the lustful look — *whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart* (Matthew 5:27-28). The intensifying is not abolition; it is the command reaching the inward man. Sha''ul (Paul) gathers the table and shows it summed in love — *Thou shalt not commit adultery, Thou shalt not kill, Thou shalt not steal, Thou shalt not bear false witness, Thou shalt not covet... it is briefly comprehended in this saying, namely, Thou shalt love thy neighbour as thyself* (Romans 13:9) — for *love is the fulfilling of the law* (Romans 13:10), the very word of the holiness law: *thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18). The tenth word is what taught him to know sin: *I had not known lust, except the law had said, Thou shalt not covet* (Romans 7:7) — the command honoured as holy, the lamp that exposes the heart. And Ya''aqob (James) binds the words by the one Lawgiver who spoke them all: *he that said, Do not commit adultery, said also, Do not kill* (James 2:11) — the Decalogue is one living standard. The second table, affirmed and deepened by Messiah and the apostles, never set aside.',
       sv.verse_id, ev.verse_id, 'free', 29490
  FROM _s305_ex20_lookup sv, _s305_ex20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=20 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- THREAD 7 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-20-the-people-stood-afar-off-moses-drew-near-the-mediator',
       E'The people stood afar off — Moses drew near unto the thick darkness (the mediator)',
       E'*And all the people saw the thunderings, and the lightnings, and the noise of the trumpet, and the mountain smoking: and when the people saw it, they removed, and stood afar off. And they said unto Moses, Speak thou with us, and we will hear: but let not Elohim (God) speak with us, lest we die... And the people stood afar off, and Moses drew near unto the thick darkness where Elohim (God) was* (Exodus 20:18-21). The Ten Words come from a fire so holy the people cannot bear the voice; they beg a mediator, and Moses goes near for them into the thick darkness. The Renewed Writings name the terror exactly: *ye are not come unto the mount that might be touched, and that burned with fire... and the sound of a trumpet, and the voice of words; which voice they that heard intreated that the word should not be spoken to them any more* (Hebrews 12:18-19), and even the mediator trembled — *so terrible was the sight, that Moses said, I exceedingly fear and quake* (Hebrews 12:21). The holiness of the One who gives the Law is not erased; it is remembered. And the mediator who stood between Yahuah and the people foreshadows the One to come: *there is one Elohim (God), and one mediator between Elohim (God) and men, the man HaMashiach Yahusha (Christ Jesus)* (1 Timothy 2:5) — the Formed Son who took flesh and draws near for His people, the better Mediator the darkness of Sinai pointed toward. The second giving recounts the people''s plea and pledge: *Go thou near, and hear all that Yahuah Eloheinu (the LORD our God) shall say... and we will hear it, and do it* (Deuteronomy 5:27) — the mediator carries the word from the fire, and the people answer hear and obey, the very posture the covenant asks.',
       sv.verse_id, ev.verse_id, 'free', 29493
  FROM _s305_ex20_lookup sv, _s305_ex20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=20 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*I am Yahuah Elohayka (the LORD thy God), which brought thee out of the land of Egypt, from the house of bondage* (Deuteronomy 5:6) — the second giving opens with the same preamble as 20:2; redeemed FIRST, then given the Torah.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=2
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-i-am-yahuah-which-brought-thee-out-of-egypt'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I will separate to Myself a people from among all the peoples... they will be My people and I shall be their Elohim (God)* (Jubilees 2:19) — the election the deliverance of 20:2 seals; the commands are the law of a people already His.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=2
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=2 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-i-am-yahuah-which-brought-thee-out-of-egypt'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*I have chosen the seed of Jacob... and have written him down as My firstborn son... for ever and ever* (Jubilees 2:20) — the redeemed of 20:2 are the firstborn son, the two-house covenant lineage.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=2
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=2 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-i-am-yahuah-which-brought-thee-out-of-egypt'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Thou shalt have none other gods before me* (Deuteronomy 5:7) — the first word kept entire in the second giving (20:3).'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=3
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-thou-shalt-have-no-other-gods-no-graven-image'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Thou shalt not make thee any graven image, or any likeness of any thing that is in heaven above* (Deuteronomy 5:8) — the second word kept entire in the second giving (20:4).'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=4
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-thou-shalt-have-no-other-gods-no-graven-image'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Thou shalt worship Yahuah Elohayka (the Lord thy God), and him only shalt thou serve* (Matthew 4:10) — the Formed Son wields the first word (20:3) against the tempter.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=3
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=4 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-thou-shalt-have-no-other-gods-no-graven-image'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Thou shalt love Yahuah Elohayka (the Lord thy God) with all thy heart... This is the first and great commandment* (Matthew 22:37-38) — Yahusha names the first word (20:3) the great commandment.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=3
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=22 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-thou-shalt-have-no-other-gods-no-graven-image'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*an idol is nothing in the world, and... there is none other Elohim (God) but one* (1 Corinthians 8:4) — Sha''ul reasons straight from the first word (20:3); the gods are emptiness.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=3
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=8 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-thou-shalt-have-no-other-gods-no-graven-image'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*to us there is but one Elohim (God), the Father... and one Lord Yahusha HaMashiach (Lord Jesus Christ), by whom are all things* (1 Corinthians 8:6) — the one-Yahuah confession of 20:3 in the Formed-and-the-Formless; Father the Source, Son the One through whom all things came.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=3
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=8 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-thou-shalt-have-no-other-gods-no-graven-image'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Little children, keep yourselves from idols* (1 John 5:21) — the last apostle seals the second word (20:4); the seed-war against idolatry runs to the end.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=4
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=5 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-thou-shalt-have-no-other-gods-no-graven-image'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Thou shalt not take the name of Yahuah Elohayka (the LORD thy God) in vain... will not hold him guiltless* (Deuteronomy 5:11) — the third word kept verse-for-verse in the second giving (20:7).'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=7
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-not-take-the-name-of-yahuah-in-vain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*ye shall not swear by my name falsely, neither shalt thou profane the name of thy Elohim (God): I am Yahuah (LORD)* (Leviticus 19:12) — the third word (20:7) unfolded: false oath = profaning the Name.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=7
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-not-take-the-name-of-yahuah-in-vain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Swear not at all... let your communication be, Yea, yea; Nay, nay* (Matthew 5:34,37) — Yahusha drives the third word (20:7) to its root: speech so true no oath on the Name is needed.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=7
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-not-take-the-name-of-yahuah-in-vain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Accustom not your mouth to swearing; neither use thyself to the naming of the Holy One* (Sirach 23:9) — the fathers'' wisdom guards the third word (20:7); the Name not to grow common on the tongue.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=7
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=23 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-not-take-the-name-of-yahuah-in-vain'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★★ KEYSTONE)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*on the seventh day Elohim (God)... rested on the seventh day from all his work* (Genesis 2:2) — the creation root of the fourth word (20:11): Yahuah rested before any nation was.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=11
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-remember-the-sabbath-day-to-keep-it-holy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Elohim (God) blessed the seventh day, and sanctified it* (Genesis 2:3) — the very act behind *Yahuah blessed the sabbath day, and hallowed it* (20:11); blessed before it was commanded.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=11
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-remember-the-sabbath-day-to-keep-it-holy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Keep the sabbath day to sanctify it, as Yahuah Elohayka (the LORD thy God) hath commanded thee* (Deuteronomy 5:12) — the second giving of the fourth word (20:8): remember and keep, two facets of one command.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=8
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-remember-the-sabbath-day-to-keep-it-holy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*There remaineth therefore a rest to the people of Elohim (God)* (Hebrews 4:9) — the seventh-day rest of 20:9-10 still STANDS, present tense; a sabbatismos yet for His people.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=9
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-remember-the-sabbath-day-to-keep-it-holy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*The sabbath was made for man... the Son of Adam is Yahuah (Lord) also of the sabbath* (Mark 2:27-28) — the Formed Son is Lord of the seventh day (20:10); He upholds it, never abolishes it.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=10
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=2 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-remember-the-sabbath-day-to-keep-it-holy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*call the sabbath a delight, the holy of Yahuah (LORD), honourable... Then shalt thou delight thyself in Yahuah* (Isaiah 58:13-14) — the prophet unfolds *keep it holy* (20:8) as joy, not bondage.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=8
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-remember-the-sabbath-day-to-keep-it-holy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*from one new moon to another, and from one sabbath to another, shall all flesh come to worship before me* (Isaiah 66:23) — the hallowed day of 20:11 carried into the new heavens; never abolished.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=11
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=66 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-remember-the-sabbath-day-to-keep-it-holy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*kept Sabbath on the seventh day and hallowed it for all ages, and appointed it as a sign for all His works* (Jubilees 2:1) — the restored witness grounds 20:11: a creation sign for all ages.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=11
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=2 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-remember-the-sabbath-day-to-keep-it-holy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*these will keep the Sabbath day, and I will sanctify them to Myself as My people* (Jubilees 2:19) — keeping *the sabbath of Yahuah Elohayka* (20:10) is the mark of His separated people.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=10
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=2 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-remember-the-sabbath-day-to-keep-it-holy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'*keep Sabbath from all work on that day... a day of the holy kingdom for all Yashar''el (Israel) is this day among their days for ever* (Jubilees 50:9) — the rest of 20:10 named an everlasting ordinance.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=10
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=50 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-remember-the-sabbath-day-to-keep-it-holy'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Honour thy father and thy mother, as Yahuah Elohayka (the LORD thy God) hath commanded thee; that thy days may be prolonged* (Deuteronomy 5:16) — the fifth word with its promise kept in the second giving (20:12).'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=12
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-honour-thy-father-and-thy-mother'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Elohim (God) commanded, saying, Honour thy father and mother... He that curseth father or mother, let him die the death* (Matthew 15:4) — Yahusha upholds the fifth word (20:12) against the corban-tradition.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=12
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=15 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-honour-thy-father-and-thy-mother'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Honour thy father and thy mother: and, Thou shalt love thy neighbour as thyself* (Matthew 19:19) — Yahusha names the fifth word (20:12) among the commandments that are the way of life.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=12
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=19 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-honour-thy-father-and-thy-mother'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Honour thy father and mother; (which is the first commandment with promise;) That it may be well with thee* (Ephesians 6:2-3) — Sha''ul hands on the fifth word (20:12) as binding, promise and all.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=12
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-honour-thy-father-and-thy-mother'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Think not that I am come to destroy the law... I am not come to destroy, but to fulfil... one jot or one tittle shall in no wise pass* (Matthew 5:17-18) — the frame over the whole second table (20:13-17): not abolished.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=13
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-thou-shalt-not-kill-the-second-table-love-of-neighbour'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*whosoever shall do and teach them, the same shall be called great in the kingdom of heaven* (Matthew 5:19) — the anti-antinomian word over 20:13-17: keep and teach the commandments.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=13
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-thou-shalt-not-kill-the-second-table-love-of-neighbour'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Thou shalt not kill... whosoever is angry with his brother... shall be in danger of the judgment* (Matthew 5:21-22) — Yahusha presses the sixth word (20:13) inward to the heart.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=13
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-thou-shalt-not-kill-the-second-table-love-of-neighbour'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Thou shalt not commit adultery... whosoever looketh on a woman to lust after her hath committed adultery with her already in his heart* (Matthew 5:27-28) — the seventh word (20:14) driven to the heart.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=14
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-thou-shalt-not-kill-the-second-table-love-of-neighbour'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*Thou shalt not commit adultery, Thou shalt not kill, Thou shalt not steal... briefly comprehended in this saying, Thou shalt love thy neighbour as thyself* (Romans 13:9) — Sha''ul sums the second table (20:13-17) in love; love fulfils the law, not abolishes it.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=14
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=13 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-thou-shalt-not-kill-the-second-table-love-of-neighbour'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*I had not known lust, except the law had said, Thou shalt not covet* (Romans 7:7) — the tenth word (20:17) honoured as the holy lamp that exposes the coveting heart.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=17
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=7 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-thou-shalt-not-kill-the-second-table-love-of-neighbour'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*he that said, Do not commit adultery, said also, Do not kill... thou art become a transgressor of the law* (James 2:11) — Ya''aqob binds the second table (20:13-14) by the one Lawgiver; the Decalogue is one whole.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=14
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=2 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-thou-shalt-not-kill-the-second-table-love-of-neighbour'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*thou shalt love thy neighbour as thyself: I am Yahuah (LORD)* (Leviticus 19:18) — the second table (20:13-17, esp. the false witness of 20:16) summed in the love of neighbour.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=16
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-thou-shalt-not-kill-the-second-table-love-of-neighbour'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*Thou shalt not kill* (Deuteronomy 5:17) — the second table confirmed word-for-word a second time at the edge of the land (20:13).'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=13
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-thou-shalt-not-kill-the-second-table-love-of-neighbour'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 7 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*ye are not come unto the mount that might be touched, and that burned with fire... and the voice of words* (Hebrews 12:18-19) — the terror of the smoking mount (20:18) named exactly.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=18
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-the-people-stood-afar-off-moses-drew-near-the-mediator'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*so terrible was the sight, that Moses said, I exceedingly fear and quake* (Hebrews 12:21) — even the mediator trembles; matches the people''s *lest we die* (20:19).'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=19
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-the-people-stood-afar-off-moses-drew-near-the-mediator'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*one mediator between Elohim (God) and men, the man HaMashiach Yahusha (Christ Jesus)* (1 Timothy 2:5) — Moses drawing near the thick darkness (20:21) foreshadows the Formed Son, the better Mediator.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=21
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=2 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-the-people-stood-afar-off-moses-drew-near-the-mediator'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Go thou near, and hear all that Yahuah Eloheinu (the LORD our God) shall say... and we will hear it, and do it* (Deuteronomy 5:27) — the second giving of the people''s plea (20:19); hear and obey, the covenant posture.'
  FROM cross_reference_threads t
  JOIN _s305_ex20_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=20 AND sv.verse_number=19
  JOIN _s305_ex20_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-20-the-people-stood-afar-off-moses-drew-near-the-mediator'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_exodus_24.sql (Exodus 24) -----
-- Chapter: Exodus 24 — THE COVENANT RATIFIED IN BLOOD; the elders see the Elohim of Yashar'el; Moses into the cloud forty days. Moses tells the people all the words and judgments and they answer with one voice, *All the words which Yahuah hath said will we do*; he writes the words, builds an altar and twelve pillars, the young men offer burnt offerings and peace offerings; Moses sprinkles half the blood on the altar, reads the book of the covenant, and sprinkles the blood on the people: *Behold the blood of the covenant, which Yahuah hath made with you concerning all these words*. Then Moses, Aaron, Nadab, Abihu, and seventy elders go up and *saw the Elohim of Yashar'el*, and *did eat and drink* — the covenant meal in His presence. Yahuah calls Moses up for the tables of stone and the law He has written; the glory of Yahuah abides on Sinai, the cloud covers six days, the seventh day He calls; the sight of the glory is like devouring fire; Moses is in the mount forty days and forty nights.
-- Tag: ex24   Temp view: _s305_ex24_lookup
-- Sort band: base 29575, step 3 -> threads at 29575, 29578, 29581, 29584, 29587 (5 threads)
-- Source of EVERY row: 'canon','exodus',24,v
--
-- Exodus 24 coverage:
--   ★ v.3,7 (all the people answered with one voice... All the words which Yahuah hath said will we do; he took the book of the covenant, and read in the audience of the people: and they said, All that Yahuah hath said will we do, and be obedient)
--        NT:     none warranted distinct (the covenant vow's forward-weave is the same Torah-on-the-heart of THREAD 2's Jeremiah; the willing "we will do" is a Tanakh lateral matter)
--        Extras: none warranted distinct (Jasher 82:31 "We will do all that Yahuah has spoken to you" is the SANCTUARY-vow after the calf, a later moment; not forced onto the 24:3,7 ratification vow)
--        Tanakh: ★ Exodus 19:8 (all the people answered together... All that Yahuah hath spoken we will do); Deuteronomy 5:27 (speak thou unto us all that Yahuah... shall speak unto thee; and we will hear it, and do it) — THREAD 1 (the willing covenant vow; Torah received gladly)
--   ★★ v.6-8 (Moses took half of the blood... sprinkled on the altar... took the book of the covenant, and read in the audience of the people... took the blood, and sprinkled it on the people, and said, Behold the blood of the covenant, which Yahuah hath made with you concerning all these words) — THE KEYSTONE
--        NT:     ★★ Hebrews 9:18-20 (neither the first testament was dedicated without blood... he took the blood of calves and of goats... and sprinkled both the book, and all the people, Saying, This is the blood of the testament which Elohim hath enjoined unto you) — Hebrews QUOTES this verse; ★ Matthew 26:28 / Mark 14:24 / Luke 22:20 (This is my blood of the new testament/covenant, which is shed for many) — Yahusha takes up the very words; Hebrews 10:29 (the blood of the covenant, wherewith he was sanctified); 1 Peter 1:2 (sprinkling of the blood of Yahusha HaMashiach) — THREAD 2
--        Extras: none warranted distinct (Jasher 82 / Jubilees 1 carry the Sinai-ascent and tables but not the blood-sprinkling rite of 24:6-8; not forced)
--        Tanakh: ★ Jeremiah 31:31-33 (I will make a new covenant... I will put my law in their inward parts, and write it in their hearts) — the renewed covenant in the same blood-pattern, the SAME Torah on the heart, NOT a different law — THREAD 2
--   ★★ v.9-11 (Then went up Moses, and Aaron, Nadab, and Abihu, and seventy of the elders... And they saw the Elohim of Yashar'el... also they saw Elohim, and did eat and drink) — THE THEOPHANY
--        NT:     ★★ John 1:18 (No man hath seen Elohim at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him); John 6:46 (Not that any man hath seen the Father, save he which is of Elohim, he hath seen the Father); 1 Timothy 6:16 (whom no man hath seen, nor can see) — what the elders SAW = the Formed Son, not the invisible Father (Red Line #4) — THREAD 3
--        Extras: none warranted distinct (the theophany is carried by the NT Formed-and-Formless filter; no clean extras witness to the seventy-elders' vision in the assigned set)
--        Tanakh: none warranted distinct (the seeing-and-living of Deut 5:24 belongs to the Decalogue scene; held in THREAD 3 prose, not forced as member)
--   ★ v.12 (I will give thee tables of stone, and a law, and commandments which I have written; that thou mayest teach them)
--        NT:     none warranted distinct (the Torah-as-gift forward-weave is the law written on the heart of THREAD 2's Jeremiah; not duplicated here)
--        Extras: Jubilees 1:1 / Jasher 82:10-11 (the tables of the law... written with the finger of Elohim) — carried in THREAD 5's glory/cloud weave; not split out separately
--        Tanakh: ★ Exodus 31:18 (two tables of testimony... written with the finger of Elohim); Exodus 32:16 (the tables were the work of Elohim, and the writing was the writing of Elohim); Deuteronomy 9:10 (two tables of stone written with the finger of Elohim) — the Torah written by Yahuah's own hand — THREAD 4
--   ★ v.13-14 (Moses rose up, and his minister Joshua... Moses went up into the mount of Elohim; And he said unto the elders, Tarry ye here for us, until we come again unto you)
--        NT:     none warranted   Extras: none warranted   Tanakh: none warranted (the transitional ascent notice; carried by THREAD 5's mount-ascent)
--   ★ v.15-18 (Moses went up... a cloud covered the mount. And the glory of Yahuah abode upon mount Sinai, and the cloud covered it six days: and the seventh day he called unto Moses out of the midst of the cloud. And the sight of the glory of Yahuah was like devouring fire... Moses was in the mount forty days and forty nights)
--        NT:     ★ Hebrews 12:29 (For our Elohim is a consuming fire) — the glory like devouring fire — THREAD 5; Matthew 4:2 (forty days/forty nights fast) weighed but NOT forced (a loose lateral, the brief says do not force) — none added
--        Extras: ★ Jubilees 1:2-4 (the glory of Yahuah abode on Mount Sinai, and a cloud overshadowed it six days. And He called to Moses on the seventh day out of the midst of the cloud... like a flaming fire on the top of the Mount. And Moses was on the Mount forty days and forty nights) — verse-for-verse; ★ Jasher 82:8-9 (the glory of Yahuah rested upon Mount Sinai, and he called to Moses, and Moses came in the midst of a cloud... forty days and forty nights) — THREAD 5
--        Tanakh: Deuteronomy 9:9 (I abode in the mount forty days and forty nights) — the forty days; carried in THREAD 5 prose, the extras witnesses serving as members
--
-- Threads (slug — target libraries):
--   1. exodus-24-all-the-words-which-yahuah-hath-said-will-we-do — Tanakh (Exodus 19:8, Deuteronomy 5:27) [free] (the willing covenant vow; Torah received gladly)
--   2. exodus-24-behold-the-blood-of-the-covenant — NT (Hebrews 9, Matthew, Mark, Luke, Hebrews 10, 1 Peter) + Tanakh (Jeremiah 31) [free] (★★ THE KEYSTONE: the blood that ratifies; the renewed covenant in the same blood-pattern, the same Torah on the heart)
--   3. exodus-24-they-saw-the-elohim-of-yashar-el — NT (John 1, John 6, 1 Timothy 6) [free] (★★ the theophany: what they SAW = the Formed Son, not the invisible Father — Red Line #4)
--   4. exodus-24-tables-of-stone-and-a-law-which-i-have-written — Tanakh (Exodus 31, Exodus 32, Deuteronomy 9) [free] (the Torah written by Yahuah's own hand; the Torah as gift)
--   5. exodus-24-the-glory-abode-the-cloud-six-days-forty-days — NT (Hebrews 12) + Extras (Jubilees 1, Jasher 82) [extras] (the glory/cloud = the Formed presence; six days, the seventh-day call, the devouring fire, the forty days)
--
-- Framing notes:
--   ★ THE COVENANT VOW (THREAD 1): *All the words which Yahuah (LORD) hath said will we do* (24:3) and *All that Yahuah (LORD) hath said will we do, and be obedient* (24:7). The people RECEIVE the Torah willingly — the covenant is no curse imposed but a treasure embraced. Woven to the same vow at Exodus 19:8 (*All that Yahuah hath spoken we will do*) and to Deuteronomy 5:27 (*we will hear it, and do it*). Torah-affirmed throughout (Red Line #6, the covenant inheritance never the curse; 1 John 2:3-4 filter).
--   ★★ THE KEYSTONE — THE BLOOD OF THE COVENANT (THREAD 2): *Behold the blood of the covenant, which Yahuah (LORD) hath made with you concerning all these words* (24:8). Hebrews QUOTES this verse outright — *neither the first testament was dedicated without blood... and sprinkled both the book, and all the people, Saying, This is the blood of the testament which Elohim hath enjoined unto you* (Hebrews 9:18-20). And Yahusha takes up the VERY WORDS at the table: *This is my blood of the new testament, which is shed for many for the remission of sins* (Matthew 26:28; Mark 14:24; Luke 22:20). The renewed covenant is the SAME blood-pattern — Jeremiah 31:31-33 names it: *I will put my law in their inward parts, and write it in their hearts* — the Torah ON THE HEART, NOT a different law, NOT Torah abolished (Red Line #6). 1 Peter 1:2 (*sprinkling of the blood*) and Hebrews 10:29 (*the blood of the covenant, wherewith he was sanctified*) keep the same sprinkling-rite. The blood that ratifies Sinai is the blood that ratifies the renewal — one covenant-pattern, one Torah, deepened not displaced.
--   ★★ THE THEOPHANY — WHAT THEY SAW (THREAD 3): *And they saw the Elohim (God) of Yashar'el (Israel)... also they saw Elohim (God), and did eat and drink* (24:10-11). Read strictly through the Formed-and-the-Formless (Red Line #4): the seventy elders did NOT behold the invisible Father — *No man hath seen Elohim (God) at any time* (John 1:18), *whom no man hath seen, nor can see* (1 Timothy 6:16), *Not that any man hath seen the Father* (John 6:46). What they saw was the Formed Son, the One who bears the Name, the visible Glory who appears and speaks in the Tanakh and later took on flesh — the *only begotten Son, which is in the bosom of the Father, he hath declared him* (John 1:18). The covenant meal in His presence — *did eat and drink* — is the foreshadow of the marriage-supper to come. NOT co-equal-persons grammar, NOT modalist collapse: the Formed who has a Father is the One beheld on the mount.
--   ★ THE TORAH WRITTEN BY YAHUAH'S OWN HAND (THREAD 4): *I will give thee tables of stone, and a law, and commandments which I have written; that thou mayest teach them* (24:12). The Torah is Yahuah's own gift, written by His own hand — *written with the finger of Elohim (God)* (Exodus 31:18; Deuteronomy 9:10), *the writing was the writing of Elohim (God), graven upon the tables* (Exodus 32:16). The law is no human invention but the very script of the Most High; to be taught and kept (Red Line #6).
--   ★ THE GLORY, THE CLOUD, THE FORTY DAYS (THREAD 5): *the glory of Yahuah (LORD) abode upon mount Sinai, and the cloud covered it six days: and the seventh day he called unto Moses out of the midst of the cloud. And the sight of the glory of Yahuah (LORD) was like devouring fire* (24:16-17); *Moses was in the mount forty days and forty nights* (24:18). The glory and the cloud are the Formed presence; the devouring fire is named in the letter — *For our Elohim (God) is a consuming fire* (Hebrews 12:29). The restored witnesses carry the scene verse-for-verse: *the glory of Yahuah abode on Mount Sinai, and a cloud overshadowed it six days. And He called to Moses on the seventh day out of the midst of the cloud... like a flaming fire on the top of the Mount. And Moses was on the Mount forty days and forty nights* (Jubilees 1:2-4); *the glory of Yahuah rested upon Mount Sinai, and he called to Moses, and Moses came in the midst of a cloud... forty days and forty nights* (Jasher 82:8-9). The six days of covering and the seventh-day call hold the Sabbath-rhythm even on the mount.
--   EXTRAS: Jubilees 1 opens with the Sinai-ascent of Exodus 24 verse-for-verse (Jub 1:1-4: *Come up to Me on the Mount, and I will give you two tables of stone of the law and of the commandment, which I have written, that you may teach them*; the glory, the six-day cloud, the seventh-day call, the forty days) — clean parse, used as THREAD 5 members. Jubilees DOUBLE-WRITTEN 'jubilees','jubilees'. Jasher 82 carries the same ascent (82:8-9), the tables written with the finger of Elohim (82:11), then the golden-calf episode and the SECOND ascent — the calf/second-tables material belongs to Exodus 32/34's own packs; only the clean 24-parallel verses (82:8-9) are members here. Jasher DOUBLE-WRITTEN 'jasher','jasher'. Jasher 82:31 (*We will do all that Yahuah has spoken to you*) echoes 24:3,7 but is spoken at the SANCTUARY-vow after the calf, a later moment — deliberately NOT forced onto THREAD 1.
--   VERSES WITH NO ADD: v.1-2 (the summons to come up and worship afar off, Moses alone to come near) — the framing summons, carried into THREAD 3's ascent and THREAD 5's mount; v.4-5 (the altar, twelve pillars, the burnt and peace offerings) — the ratification preparation, no distinct framework-bearing target beyond THREAD 2's blood-rite; v.13-14 (Moses and Joshua go up; Tarry ye here until we come again) — the transitional ascent notice, no add.

CREATE TEMP VIEW _s305_ex24_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: All the words which Yahuah hath said will we do (the willing covenant vow)
    ('canon','exodus',24,3,'canon','exodus',19,8,'free',
      E'*And all the people answered together, and said, All that Yahuah (LORD) hath spoken we will do. And Moses returned the words of the people unto Yahuah (LORD)* (Exodus 19:8). Before the mountain ever burned, the people vowed the same word they now repeat at the ratification — *all the people answered with one voice, and said, All the words which Yahuah (LORD) hath said will we do* (Exodus 24:3). The covenant is no curse forced upon them but an inheritance embraced with one voice; twice over they say *we will do*, the Torah received gladly.'),
    ('canon','exodus',24,7,'canon','deuteronomy',5,27,'free',
      E'*Go thou near, and hear all that Yahuah Eloheinu (the LORD our God) shall say: and speak thou unto us all that Yahuah Eloheinu (the LORD our God) shall speak unto thee; and we will hear it, and do it* (Deuteronomy 5:27). When Moses *took the book of the covenant, and read in the audience of the people: and they said, All that Yahuah (LORD) hath said will we do, and be obedient* (Exodus 24:7), it is the same heart Moses recalls at Horeb — *we will hear it, and do it*. The hearing and the doing are one; the words of the covenant are taken up willingly, *and be obedient*, the Torah owned as the people''s own.'),

    -- THREAD 2 (★★ KEYSTONE): Behold the blood of the covenant
    ('canon','exodus',24,8,'canon','hebrews',9,20,'free',
      E'*Saying, This is the blood of the testament which Elohim (God) hath enjoined unto you* (Hebrews 9:20). Hebrews quotes this very verse — *Behold the blood of the covenant, which Yahuah (LORD) hath made with you concerning all these words* (Exodus 24:8) — naming the Sinai blood-rite as the pattern: the testament dedicated in blood, the words of the covenant sealed upon the people. What Moses spoke at the altar the letter carries forward unchanged: *the blood of the testament which Elohim hath enjoined unto you*.'),
    ('canon','exodus',24,8,'canon','hebrews',9,18,'free',
      E'*Whereupon neither the first testament was dedicated without blood* (Hebrews 9:18). The rite of *Moses took the blood, and sprinkled it on the people* (Exodus 24:8) is named the dedication of the covenant — *neither the first testament was dedicated without blood*. Hebrews 9:19 recounts it whole: *when Moses had spoken every precept to all the people according to the law, he took the blood... and sprinkled both the book, and all the people*. The covenant is ratified in blood; the sprinkled blood binds the people to *all these words*.'),
    ('canon','exodus',24,8,'canon','matthew',26,28,'free',
      E'*For this is my blood of the new testament, which is shed for many for the remission of sins* (Matthew 26:28). At the table Yahusha (Jesus) takes up the very words of the mount — *Behold the blood of the covenant, which Yahuah (LORD) hath made with you concerning all these words* (Exodus 24:8) — and speaks them over the cup: *my blood of the new testament*. The same blood-pattern that ratified Sinai ratifies the renewal; the covenant deepened, not displaced — one blood that binds the people to the words of Yahuah.'),
    ('canon','exodus',24,8,'canon','mark',14,24,'free',
      E'*And he said unto them, This is my blood of the new testament, which is shed for many* (Mark 14:24). The cup carries the words of the mount — *the blood of the covenant... concerning all these words* (Exodus 24:8) — now *my blood of the new testament, which is shed for many*. The renewal stands in the same blood-rite Moses performed; the Formed Son who made the covenant at Sinai seals its renewal in His own blood.'),
    ('canon','exodus',24,8,'canon','luke',22,20,'free',
      E'*Likewise also the cup after supper, saying, This cup is the new testament in my blood, which is shed for you* (Luke 22:20). What Moses declared — *Behold the blood of the covenant, which Yahuah (LORD) hath made with you* (Exodus 24:8) — Yahusha (Jesus) declares anew: *the new testament in my blood*. The covenant cup of the table answers the sprinkled blood of the altar; the same covenant, the same blood-pattern, the Torah-on-the-heart renewal Jeremiah foretold.'),
    ('canon','exodus',24,8,'canon','hebrews',10,29,'free',
      E'*Of how much sorer punishment, suppose ye, shall he be thought worthy, who hath trodden under foot the Son of Elohim (God), and hath counted the blood of the covenant, wherewith he was sanctified, an unholy thing* (Hebrews 10:29). The phrase from the mount — *the blood of the covenant* (Exodus 24:8) — is held sacred still: to despise *the blood of the covenant, wherewith he was sanctified* is the gravest of sins. The blood that bound the people at Sinai binds them yet; it is no light thing to count it unholy.'),
    ('canon','exodus',24,8,'canon','1-peter',1,2,'free',
      E'*Elect according to the foreknowledge of Elohim (God) the Father, through sanctification of the Spirit, unto obedience and sprinkling of the blood of Yahusha HaMashiach (Jesus Christ)* (1 Peter 1:2). The sprinkled blood of the mount — *Moses took the blood, and sprinkled it on the people* (Exodus 24:8) — is named as the figure the elect stand under: *unto obedience and sprinkling of the blood*. The sprinkling binds to obedience, exactly as the Sinai rite bound the people to *all these words*; the blood-pattern carries unbroken into the renewal.'),
    ('canon','exodus',24,8,'canon','jeremiah',31,33,'free',
      E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). The renewed covenant sealed at the table answers the blood of the mount — *the blood of the covenant... concerning all these words* (Exodus 24:8) — but it is the SAME Torah, now written within: *I will put my law in their inward parts, and write it in their hearts*. Jeremiah 31:31 calls it *a new covenant with the house of Yashar''el, and with the house of Yahudah (Judah)* — the two houses gathered under one renewed covenant, the Torah moved from tables of stone to tables of the heart, never abolished, never exchanged for a different law.'),

    -- THREAD 3 (★★): They saw the Elohim of Yashar'el (the theophany — the Formed Son)
    ('canon','exodus',24,10,'canon','john',1,18,'free',
      E'*No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him* (John 1:18). When the seventy elders *saw the Elohim (God) of Yashar''el (Israel)* (Exodus 24:10), they did not behold the invisible Father — *No man hath seen Elohim at any time*. What was seen on the mount was the Formed Son, the *only begotten Son, which is in the bosom of the Father, he hath declared him*: the One who bears the Name, the visible Glory who appears and speaks in the Tanakh, who later took on flesh. The Formed who has a Father was beheld; the Formless was not.'),
    ('canon','exodus',24,11,'canon','john',6,46,'free',
      E'*Not that any man hath seen the Father, save he which is of Elohim (God), he hath seen the Father* (John 6:46). The nobles *saw Elohim (God), and did eat and drink* (Exodus 24:11) — yet *not that any man hath seen the Father*. Only the One who *is of Elohim* has seen the Father; what the elders beheld was that very One, the Formed Son, in whose presence they ate and drank the covenant meal. The seeing on the mount is the seeing of the Son who declares the Father, not of the Father Himself.'),
    ('canon','exodus',24,10,'canon','1-timothy',6,16,'free',
      E'*Who only hath immortality, dwelling in the light which no man can approach unto; whom no man hath seen, nor can see: to whom be honour and power everlasting. Amen* (1 Timothy 6:16). The Father is the One *whom no man hath seen, nor can see* — so the elders'' vision, *they saw the Elohim (God) of Yashar''el (Israel)* (Exodus 24:10), is the seeing of the Formed Son, not the Formless Source. The invisible Father dwells in unapproachable light; the Son drawn from Him is the One who appeared on Sinai, beheld and yet leaving them alive.'),

    -- THREAD 4: Tables of stone, and a law, which I have written (Torah by Yahuah's own hand)
    ('canon','exodus',24,12,'canon','exodus',31,18,'free',
      E'*And he gave unto Moses, when he had made an end of communing with him upon mount Sinai, two tables of testimony, tables of stone, written with the finger of Elohim (God)* (Exodus 31:18). The promise *I will give thee tables of stone, and a law, and commandments which I have written* (Exodus 24:12) is fulfilled in the giving — *tables of stone, written with the finger of Elohim*. The Torah is Yahuah''s own hand-written gift; the law Moses is to teach is the very script of the Most High, not a thing of men.'),
    ('canon','exodus',24,12,'canon','exodus',32,16,'free',
      E'*And the tables were the work of Elohim (God), and the writing was the writing of Elohim (God), graven upon the tables* (Exodus 32:16). The law promised — *commandments which I have written* (Exodus 24:12) — is named *the work of Elohim, and the writing was the writing of Elohim*. Twice the text presses it: the tables and the writing alike are Yahuah''s own. The Torah is the gift of His hand, given that Moses *mayest teach them* to the people.'),
    ('canon','exodus',24,12,'canon','deuteronomy',9,10,'free',
      E'*And Yahuah (LORD) delivered unto me two tables of stone written with the finger of Elohim (God); and on them was written according to all the words, which Yahuah (LORD) spake with you in the mount out of the midst of the fire in the day of the assembly* (Deuteronomy 9:10). Moses recalls the very gift of *tables of stone, and a law, and commandments which I have written* (Exodus 24:12) — *written with the finger of Elohim... according to all the words* Yahuah spoke from the fire. The covenant words sealed in blood are the same words graven on the stone by the finger of Elohim; word and writing are one Torah.'),

    -- THREAD 5: The glory abode, the cloud six days, forty days (the Formed presence)
    ('canon','exodus',24,17,'canon','hebrews',12,29,'free',
      E'*For our Elohim (God) is a consuming fire* (Hebrews 12:29). The sight on the mount — *the sight of the glory of Yahuah (LORD) was like devouring fire on the top of the mount in the eyes of the children of Yashar''el (Israel)* (Exodus 24:17) — is named again in the letter: *our Elohim is a consuming fire*. Hebrews 12 sets that very Sinai-fire (*the mount that... burned with fire*) against Mount Sion, yet the Elohim who appeared as devouring fire is the same; the glory beheld on Sinai is the consuming fire still.'),
    ('canon','exodus',24,16,'jubilees','jubilees',1,2,'extras',
      E'*And Moses went up into the mount of Elohim (God), and the glory of Yahuah (God) abode on Mount Sinai, and a cloud overshadowed it six days* (Jubilees 1:2). The restored witness keeps the scene verse-for-verse with *the glory of Yahuah (LORD) abode upon mount Sinai, and the cloud covered it six days* (Exodus 24:16) — the glory abiding, the cloud covering six days, the Formed presence settling on the mount.'),
    ('canon','exodus',24,16,'jubilees','jubilees',1,3,'extras',
      E'*And He called to Moses on the seventh day out of the midst of the cloud, and the appearance of the glory of Yahuah (God) was like a flaming fire on the top of the Mount* (Jubilees 1:3). The restored witness carries the seventh-day call and the fire whole — matching *the seventh day he called unto Moses out of the midst of the cloud* (Exodus 24:16) and *the sight of the glory of Yahuah was like devouring fire on the top of the mount* (Exodus 24:17). The Sabbath-rhythm holds even on the mount: six days of covering, the seventh-day call.'),
    ('canon','exodus',24,18,'jubilees','jubilees',1,4,'extras',
      E'*And Moses was on the Mount forty days and forty nights, and Elohim (God) taught him the earlier and the later history of the division of all the days of the law and of the testimony* (Jubilees 1:4). The restored witness keeps the forty days — *Moses was in the mount forty days and forty nights* (Exodus 24:18) — and names what passed there: Elohim taught him *the law and of the testimony*, the very tables and instruction the mount was for.'),
    ('canon','exodus',24,16,'jasher','jasher',82,8,'extras',
      E'*And the glory of Yahuah (the Lord) rested upon Mount Sinai, and he called to Moses, and Moses came in the midst of a cloud and ascended the mountain* (Jasher 82:8). The extended witness carries the glory, the call, and the cloud together — matching *the glory of Yahuah (LORD) abode upon mount Sinai... he called unto Moses out of the midst of the cloud* (Exodus 24:16); Moses enters the cloud to ascend, into the Formed presence.'),
    ('canon','exodus',24,18,'jasher','jasher',82,9,'extras',
      E'*And Moses was upon the mount forty days and forty nights; he ate no bread and drank no water, and Yahuah (the Lord) instructed him in the statutes and judgments in order to teach the children of Israel* (Jasher 82:9). The extended witness keeps the forty days — *Moses was in the mount forty days and forty nights* (Exodus 24:18) — and names the purpose: Yahuah *instructed him in the statutes and judgments... to teach* Yashar''el, the Torah given to be taught (as Exodus 24:12, *that thou mayest teach them*).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex24_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex24_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-24-all-the-words-which-yahuah-hath-said-will-we-do',
       E'All the words which Yahuah hath said will we do — the willing covenant vow',
       E'Moses comes down from the mount and lays the covenant before the people: *And Moses came and told the people all the words of Yahuah (LORD), and all the judgments: and all the people answered with one voice, and said, All the words which Yahuah (LORD) hath said will we do* (Exodus 24:3). Then, after he writes the words and reads the book of the covenant aloud, they vow it again: *he took the book of the covenant, and read in the audience of the people: and they said, All that Yahuah (LORD) hath said will we do, and be obedient* (Exodus 24:7). Twice over the people take up the Torah willingly — with one voice, gladly, *and be obedient*. The covenant is no curse forced upon a captive people; it is an inheritance embraced. This is the same vow first spoken before the mountain ever burned: *And all the people answered together, and said, All that Yahuah (LORD) hath spoken we will do* (Exodus 19:8). And Moses recalls the people''s own desire at Horeb to hear and obey: *speak thou unto us all that Yahuah Eloheinu (the LORD our God) shall speak unto thee; and we will hear it, and do it* (Deuteronomy 5:27). The hearing and the doing are one road; the words of Yahuah are received as the people''s own treasure, the Torah owned and vowed.',
       sv.verse_id, ev.verse_id, 'free', 29575
  FROM _s305_ex24_lookup sv, _s305_ex24_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=24 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=24 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★ KEYSTONE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-24-behold-the-blood-of-the-covenant',
       E'Behold the blood of the covenant — the blood that ratifies, the renewal in the same blood-pattern',
       E'The covenant is sealed in blood. *Moses took half of the blood, and put it in basons; and half of the blood he sprinkled on the altar* (Exodus 24:6); then, the book of the covenant read aloud and the people''s vow given, *Moses took the blood, and sprinkled it on the people, and said, Behold the blood of the covenant, which Yahuah (LORD) hath made with you concerning all these words* (Exodus 24:8). Half on the altar, half on the people: the blood binds Yahuah and Yashar''el (Israel) to *all these words*. The letter to the Hebrews quotes this very verse as the pattern of all covenant-dedication: *Whereupon neither the first testament was dedicated without blood. For when Moses had spoken every precept to all the people according to the law, he took the blood of calves and of goats... and sprinkled both the book, and all the people, Saying, This is the blood of the testament which Elohim (God) hath enjoined unto you* (Hebrews 9:18-20). And at the table Yahusha (Jesus) takes up the WORDS THEMSELVES: *For this is my blood of the new testament, which is shed for many for the remission of sins* (Matthew 26:28), *This is my blood of the new testament, which is shed for many* (Mark 14:24), *This cup is the new testament in my blood, which is shed for you* (Luke 22:20). The same blood-rite that ratified Sinai ratifies the renewal — the covenant deepened, never displaced. To despise it is the gravest sin: *hath counted the blood of the covenant, wherewith he was sanctified, an unholy thing* (Hebrews 10:29); and the elect stand *unto obedience and sprinkling of the blood of Yahusha HaMashiach (Jesus Christ)* (1 Peter 1:2), the same sprinkling unto obedience. And the renewal is the SAME Torah, now written within — Jeremiah names it: *I will make a new covenant with the house of Yashar''el (Israel), and with the house of Yahudah (Judah)* (Jeremiah 31:31), *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). The two houses gathered under one renewed covenant; the Torah moved from tables of stone to tables of the heart — not a different law, not Torah abolished, but the same words sealed in the same blood, carried from the altar of Sinai to the cup of the table.',
       sv.verse_id, ev.verse_id, 'free', 29578
  FROM _s305_ex24_lookup sv, _s305_ex24_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=24 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=24 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-24-they-saw-the-elohim-of-yashar-el',
       E'They saw the Elohim of Yashar''el — the theophany of the Formed Son',
       E'*Then went up Moses, and Aaron, Nadab, and Abihu, and seventy of the elders of Yashar''el (Israel): And they saw the Elohim (God) of Yashar''el (Israel): and there was under his feet as it were a paved work of a sapphire stone, and as it were the body of heaven in his clearness* (Exodus 24:9-10). And again, that none might miss it: *upon the nobles of the children of Yashar''el (Israel) he laid not his hand: also they saw Elohim (God), and did eat and drink* (Exodus 24:11). The seventy elders BEHELD the Elohim of Yashar''el, sapphire under His feet, and lived — and ate and drank the covenant meal in His presence. Yet the Scripture is plain that the invisible Father has never been seen: *No man hath seen Elohim (God) at any time; the only begotten Son, which is in the bosom of the Father, he hath declared him* (John 1:18); *Not that any man hath seen the Father, save he which is of Elohim (God), he hath seen the Father* (John 6:46); the Father *only hath immortality, dwelling in the light which no man can approach unto; whom no man hath seen, nor can see* (1 Timothy 6:16). So what the elders saw was the Formed Son — the One drawn from the Formless, who bears the Name, the visible Glory who appeared and spoke through the whole Tanakh and later took on flesh: the *only begotten Son... he hath declared him*. The Formed who has a Father was beheld on the mount; the Formless Source was not. This is the lens, not a collapse of the two into one nor a setting of them as two co-equal persons: the Son who declares the Father is the Elohim of Yashar''el the elders saw and ate before — a foreshadow of the marriage-supper to come, when the covenant people will *eat and drink* in His presence again.',
       sv.verse_id, ev.verse_id, 'free', 29581
  FROM _s305_ex24_lookup sv, _s305_ex24_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=24 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=24 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-24-tables-of-stone-and-a-law-which-i-have-written',
       E'Tables of stone, and a law, which I have written — the Torah by Yahuah''s own hand',
       E'*And Yahuah (LORD) said unto Moses, Come up to me into the mount, and be there: and I will give thee tables of stone, and a law, and commandments which I have written; that thou mayest teach them* (Exodus 24:12). The Torah is Yahuah''s own gift, written by His own hand and given to be taught. The giving is recorded plainly: *he gave unto Moses, when he had made an end of communing with him upon mount Sinai, two tables of testimony, tables of stone, written with the finger of Elohim (God)* (Exodus 31:18). And twice the text presses whose work it is: *the tables were the work of Elohim (God), and the writing was the writing of Elohim (God), graven upon the tables* (Exodus 32:16). Moses recalls it at Horeb: *Yahuah (LORD) delivered unto me two tables of stone written with the finger of Elohim (God); and on them was written according to all the words, which Yahuah (LORD) spake with you in the mount out of the midst of the fire in the day of the assembly* (Deuteronomy 9:10). The law is no human invention but the very script of the Most High — the same *all these words* sealed in the blood of the covenant, now graven in stone by the finger of Elohim. The Torah is the gift of His hand, given that Moses *mayest teach them* to the people, kept and taught, never set aside.',
       sv.verse_id, ev.verse_id, 'free', 29584
  FROM _s305_ex24_lookup sv, _s305_ex24_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=24 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=24 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-24-the-glory-abode-the-cloud-six-days-forty-days',
       E'The glory abode, the cloud six days, forty days — the Formed presence on the mount',
       E'*And Moses went up into the mount, and a cloud covered the mount. And the glory of Yahuah (LORD) abode upon mount Sinai, and the cloud covered it six days: and the seventh day he called unto Moses out of the midst of the cloud* (Exodus 24:15-16). The glory and the cloud are the Formed presence settling on Sinai; and the seventh-day call holds the Sabbath-rhythm even on the mount — six days of covering, the seventh-day word. *And the sight of the glory of Yahuah (LORD) was like devouring fire on the top of the mount in the eyes of the children of Yashar''el (Israel)* (Exodus 24:17), and *Moses went into the midst of the cloud, and gat him up into the mount: and Moses was in the mount forty days and forty nights* (Exodus 24:18). The fire is named again in the letter to the Hebrews: *For our Elohim (God) is a consuming fire* (Hebrews 12:29) — the same glory that burned on Sinai. The restored witnesses keep the whole scene verse-for-verse. Jubilees opens here: *the glory of Yahuah (God) abode on Mount Sinai, and a cloud overshadowed it six days* (Jubilees 1:2), *And He called to Moses on the seventh day out of the midst of the cloud, and the appearance of the glory of Yahuah (God) was like a flaming fire on the top of the Mount* (Jubilees 1:3), *And Moses was on the Mount forty days and forty nights, and Elohim (God) taught him the earlier and the later history of the division of all the days of the law and of the testimony* (Jubilees 1:4). And Jasher: *the glory of Yahuah (the Lord) rested upon Mount Sinai, and he called to Moses, and Moses came in the midst of a cloud and ascended the mountain* (Jasher 82:8), *And Moses was upon the mount forty days and forty nights... and Yahuah (the Lord) instructed him in the statutes and judgments in order to teach the children of Israel* (Jasher 82:9). The cloud and the glory, the six days and the seventh-day call, the devouring fire and the forty days — the Formed presence on the mount, where the law and the testimony were given to be taught.',
       sv.verse_id, ev.verse_id, 'extras', 29587
  FROM _s305_ex24_lookup sv, _s305_ex24_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=24 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=24 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*All that Yahuah (LORD) hath spoken we will do* (Exodus 19:8) — the same vow first given before the mountain burned; the willing covenant of 24:3.'
  FROM cross_reference_threads t
  JOIN _s305_ex24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=24 AND sv.verse_number=3
  JOIN _s305_ex24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-24-all-the-words-which-yahuah-hath-said-will-we-do'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*we will hear it, and do it* (Deuteronomy 5:27) — Moses recalls the people''s own desire to obey; the hearing and doing of 24:7, *and be obedient*.'
  FROM cross_reference_threads t
  JOIN _s305_ex24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=24 AND sv.verse_number=7
  JOIN _s305_ex24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=5 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-24-all-the-words-which-yahuah-hath-said-will-we-do'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★ KEYSTONE)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *This is the blood of the testament which Elohim (God) hath enjoined unto you* (Hebrews 9:20) — Hebrews QUOTES 24:8: the Sinai blood-rite named the pattern of all covenant-dedication.'
  FROM cross_reference_threads t
  JOIN _s305_ex24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=24 AND sv.verse_number=8
  JOIN _s305_ex24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-24-behold-the-blood-of-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*neither the first testament was dedicated without blood* (Hebrews 9:18) — the sprinkling of 24:8 named the dedication of the covenant; blood binds the people to all these words.'
  FROM cross_reference_threads t
  JOIN _s305_ex24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=24 AND sv.verse_number=8
  JOIN _s305_ex24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=9 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-24-behold-the-blood-of-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *this is my blood of the new testament, which is shed for many for the remission of sins* (Matthew 26:28) — Yahusha takes up the very words of 24:8 at the table; the same blood-pattern ratifies the renewal.'
  FROM cross_reference_threads t
  JOIN _s305_ex24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=24 AND sv.verse_number=8
  JOIN _s305_ex24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=26 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-24-behold-the-blood-of-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*This is my blood of the new testament, which is shed for many* (Mark 14:24) — the cup carries the words of the mount (24:8); the Formed Son seals the renewal in His own blood.'
  FROM cross_reference_threads t
  JOIN _s305_ex24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=24 AND sv.verse_number=8
  JOIN _s305_ex24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=14 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-24-behold-the-blood-of-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*This cup is the new testament in my blood, which is shed for you* (Luke 22:20) — the covenant cup answers the sprinkled blood of the altar (24:8); the same covenant, the same blood.'
  FROM cross_reference_threads t
  JOIN _s305_ex24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=24 AND sv.verse_number=8
  JOIN _s305_ex24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=22 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-24-behold-the-blood-of-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*hath counted the blood of the covenant, wherewith he was sanctified, an unholy thing* (Hebrews 10:29) — the phrase from the mount (24:8) held sacred still; to despise the blood of the covenant is the gravest sin.'
  FROM cross_reference_threads t
  JOIN _s305_ex24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=24 AND sv.verse_number=8
  JOIN _s305_ex24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-24-behold-the-blood-of-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*unto obedience and sprinkling of the blood of Yahusha HaMashiach (Jesus Christ)* (1 Peter 1:2) — the sprinkling binds unto obedience, as the Sinai rite (24:8) bound the people to all these words.'
  FROM cross_reference_threads t
  JOIN _s305_ex24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=24 AND sv.verse_number=8
  JOIN _s305_ex24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-24-behold-the-blood-of-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *I will put my law in their inward parts, and write it in their hearts* (Jeremiah 31:33) — the renewal is the SAME Torah, now within; the two houses (Jer 31:31) under one renewed covenant, not Torah abolished (24:8).'
  FROM cross_reference_threads t
  JOIN _s305_ex24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=24 AND sv.verse_number=8
  JOIN _s305_ex24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-24-behold-the-blood-of-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *No man hath seen Elohim (God) at any time; the only begotten Son... he hath declared him* (John 1:18) — what the elders saw (24:10) was the Formed Son, not the invisible Father.'
  FROM cross_reference_threads t
  JOIN _s305_ex24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=24 AND sv.verse_number=10
  JOIN _s305_ex24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-24-they-saw-the-elohim-of-yashar-el'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Not that any man hath seen the Father, save he which is of Elohim (God), he hath seen the Father* (John 6:46) — the nobles saw and ate (24:11) before the One who is of Elohim, the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s305_ex24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=24 AND sv.verse_number=11
  JOIN _s305_ex24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=6 AND tv.verse_number=46
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-24-they-saw-the-elohim-of-yashar-el'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*whom no man hath seen, nor can see* (1 Timothy 6:16) — the Father dwells in unapproachable light; the elders'' vision (24:10) is the seeing of the Son drawn from Him.'
  FROM cross_reference_threads t
  JOIN _s305_ex24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=24 AND sv.verse_number=10
  JOIN _s305_ex24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-24-they-saw-the-elohim-of-yashar-el'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*two tables of testimony, tables of stone, written with the finger of Elohim (God)* (Exodus 31:18) — the promise of 24:12 fulfilled; the Torah Yahuah''s own hand-written gift.'
  FROM cross_reference_threads t
  JOIN _s305_ex24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=24 AND sv.verse_number=12
  JOIN _s305_ex24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=31 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-24-tables-of-stone-and-a-law-which-i-have-written'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the tables were the work of Elohim (God), and the writing was the writing of Elohim (God)* (Exodus 32:16) — the law promised in 24:12 is the very work and writing of Elohim, not of men.'
  FROM cross_reference_threads t
  JOIN _s305_ex24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=24 AND sv.verse_number=12
  JOIN _s305_ex24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-24-tables-of-stone-and-a-law-which-i-have-written'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*two tables of stone written with the finger of Elohim (God)... according to all the words* (Deuteronomy 9:10) — Moses recalls the gift of 24:12; word and writing one Torah, sealed in blood and graven in stone.'
  FROM cross_reference_threads t
  JOIN _s305_ex24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=24 AND sv.verse_number=12
  JOIN _s305_ex24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=9 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-24-tables-of-stone-and-a-law-which-i-have-written'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*For our Elohim (God) is a consuming fire* (Hebrews 12:29) — the glory like devouring fire on the mount (24:17) named again; the same Elohim who appeared as fire on Sinai.'
  FROM cross_reference_threads t
  JOIN _s305_ex24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=24 AND sv.verse_number=17
  JOIN _s305_ex24_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-24-the-glory-abode-the-cloud-six-days-forty-days'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the glory of Yahuah (God) abode on Mount Sinai, and a cloud overshadowed it six days* (Jubilees 1:2) — the glory and the six-day cloud of 24:16 kept verse-for-verse in the restored witness.'
  FROM cross_reference_threads t
  JOIN _s305_ex24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=24 AND sv.verse_number=16
  JOIN _s305_ex24_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=1 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-24-the-glory-abode-the-cloud-six-days-forty-days'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*He called to Moses on the seventh day out of the midst of the cloud... like a flaming fire on the top of the Mount* (Jubilees 1:3) — the seventh-day call and the fire of 24:16-17; the Sabbath-rhythm on the mount.'
  FROM cross_reference_threads t
  JOIN _s305_ex24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=24 AND sv.verse_number=16
  JOIN _s305_ex24_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=1 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-24-the-glory-abode-the-cloud-six-days-forty-days'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Moses was on the Mount forty days and forty nights, and Elohim (God) taught him... the law and of the testimony* (Jubilees 1:4) — the forty days of 24:18, and what passed there: the law given to be taught.'
  FROM cross_reference_threads t
  JOIN _s305_ex24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=24 AND sv.verse_number=18
  JOIN _s305_ex24_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=1 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-24-the-glory-abode-the-cloud-six-days-forty-days'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the glory of Yahuah (the Lord) rested upon Mount Sinai, and he called to Moses, and Moses came in the midst of a cloud* (Jasher 82:8) — the glory, the call, the cloud of 24:16; Moses enters the Formed presence.'
  FROM cross_reference_threads t
  JOIN _s305_ex24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=24 AND sv.verse_number=16
  JOIN _s305_ex24_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=82 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-24-the-glory-abode-the-cloud-six-days-forty-days'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Moses was upon the mount forty days and forty nights... Yahuah (the Lord) instructed him in the statutes and judgments in order to teach the children of Israel* (Jasher 82:9) — the forty days of 24:18, the Torah given to teach (as 24:12).'
  FROM cross_reference_threads t
  JOIN _s305_ex24_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=24 AND sv.verse_number=18
  JOIN _s305_ex24_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=82 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-24-the-glory-abode-the-cloud-six-days-forty-days'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_exodus_34.sql (Exodus 34) -----
-- Chapter: Exodus 34 — THE NAME PROCLAIMED, THE COVENANT RENEWED, THE SHINING FACE.
--   After the golden calf (Exodus 32), Yahuah bids Moses hew two tables of stone LIKE UNTO THE FIRST;
--   Yahuah descends in the cloud and PROCLAIMS THE NAME — *Yahuah, Yahuah Elohim, merciful and gracious,
--   longsuffering, and abundant in goodness and truth, keeping mercy for thousands, forgiving iniquity...
--   and that will by no means clear the guilty* (the most-quoted self-revelation in all the Tanakh);
--   the covenant is RENEWED (no covenant with the inhabitants; worship no other god; whose name is Jealous);
--   the feasts re-commanded (unleavened bread, sabbath, weeks, ingathering, thrice-in-the-year);
--   the tables re-written (the ten words); and Moses' face SHONE so he put a veil on it.
-- Tag: ex34   Temp view: _s305_ex34_lookup
-- Sort band: base 29825, step 3 -> threads at 29825, 29828, 29831, 29834, 29837, 29840 (6 threads)
-- Source of EVERY row: 'canon','exodus',34,v
--
-- Exodus 34 coverage:
--   ★ v.1,4,27-28 (Hew thee two tables of stone like unto the first... he wrote upon the tables the words of the covenant, the ten commandments)
--        NT:     none warranted distinct (the re-written Torah's forward-weave is the law written on the heart, held to THREAD 6 — Jer/Ezek/2 Cor 3)
--        Extras: Jasher 82:24-25 (hew two stone tablets... Yahuah wrote the ten commandments upon the tablets); Jubilees 1:1 (the tables of the law and of the commandment... on Mount Sinai) — THREAD 1
--        Tanakh: ★ Deuteronomy 10:1-4 (Hew thee two tables of stone like unto the first... I will write on the tables the words that were in the first tables which thou brakest); Exodus 32:15-16 (the first tables, the work of Elohim, broken) — THREAD 1
--   ★★★ v.5-7 (Yahuah descended in the cloud, and proclaimed the name of Yahuah... merciful and gracious, longsuffering, and abundant in goodness and truth, keeping mercy for thousands, forgiving iniquity)
--        NT:     ★ John 1:14 (the Word made flesh... full of grace and truth); John 1:17 (grace and truth came by Yahusha HaMashiach) — THREAD 2 (the proclaimed mercy-and-truth made flesh; the One who descended = the Formed Son)
--        Extras: Jubilees 1:1-2 (the glory of Yahuah abode on Mount Sinai, and a cloud overshadowed it) — woven at THREAD 1's prose; the Name-proclamation itself has no clean distinct extra-canon parallel, held to canon chorus
--        Tanakh: ★★★ THE CHORUS — Numbers 14:18; Nehemiah 9:17; Psalm 86:15; Psalm 103:8; Psalm 145:8; Joel 2:13; Jonah 4:2; Nahum 1:3 — THREAD 2 (the most-quoted self-revelation echoed across the whole Tanakh)
--   ★ v.6-7 (keeping mercy... forgiving iniquity... and that will by no means clear the guilty; visiting the iniquity of the fathers)
--        NT:     Romans 2:4-6 (the riches of his goodness... leadeth thee to repentance; who will render to every man according to his deeds) — THREAD 3 (the balance of mercy and justice)
--        Extras: none warranted distinct (the mercy/justice balance carried by canon)
--        Tanakh: ★ Exodus 20:5-6 (a jealous Elohim, visiting the iniquity of the fathers... and shewing mercy unto thousands of them that love me, and keep my commandments) — THREAD 3
--   ★ v.11-17 (make no covenant with the inhabitants... lest it be a snare; destroy their altars; worship no other god, for Yahuah, whose name is Jealous)
--        NT:     2 Corinthians 6:14-17 (be ye not unequally yoked... come out from among them, and be ye separate) — THREAD 4 (separation from idolatry; the SYSTEM, not the peoples)
--        Extras: Jubilees 1:9-10 (they will walk after the nations... and will serve their gods, and these will prove to them an offence and... a snare) — THREAD 4
--        Tanakh: ★ Exodus 20:3-5 (Thou shalt have no other gods before me... I... am a jealous Elohim) — THREAD 4
--   ★ v.18-26 (the feasts renewed: unleavened bread, sabbath, weeks, ingathering; thrice in the year all your men appear before Yahuah)
--        NT:     none warranted distinct (the moedim's NT filling — Messiah our Passover, Shavuot, Tabernacles — belongs to those feast-chapters; not forced here)
--        Extras: none warranted distinct
--        Tanakh: ★ Leviticus 23:2-6,15-16,33-34 (the feasts of Yahuah... holy convocations); Exodus 20:8-11 (Remember the sabbath day... for in six days Yahuah made heaven and earth) — THREAD 5 (the appointed times NOT abolished, re-commanded in the covenant renewal)
--   ★★ v.29-35 (the skin of Moses' face shone... he put a vail on his face)
--        NT:     ★★ 2 Corinthians 3:7-18 (the ministration... was glorious... the children of Yashar'el could not stedfastly behold the face of Moses... when it shall turn to Yahuah, the vail shall be taken away); Matthew 17:2 (transfigured... his face did shine as the sun) — THREAD 6
--        Extras: none warranted distinct
--        Tanakh: ★★ Jeremiah 31:33 (I will put my law in their inward parts, and write it in their hearts); Ezekiel 36:27 (I will put my spirit within you, and cause you to walk in my statutes) — THREAD 6 (the SAME glory written on the heart = the greater glory; NOT Torah abolished)
--   v.2-3,8-10 (the readiness; Moses worships; the covenant-marvels; stiffnecked people; pardon our iniquity)
--        NT/Extras/Tanakh: none forced as distinct members — v.5-7 (the Name) carries the mercy of v.9-10's pardon (THREAD 2/3); v.2-3 is the staging of the ascent (held in THREAD 1 prose)
--
-- Threads (slug — target libraries):
--   1. exodus-34-hew-two-tables-like-the-first-the-covenant-renewed — Tanakh (Deuteronomy, Exodus 32) + Extras (Jasher, Jubilees) [extras] (★ the same Torah re-written after the calf)
--   2. exodus-34-the-name-proclaimed-merciful-and-gracious — NT (John) + Tanakh (Numbers, Nehemiah, Psalms x3, Joel, Jonah, Nahum) [free... see note: John makes it stay free] (★★★ THE keystone self-revelation + the Formed made flesh)
--   3. exodus-34-by-no-means-clear-the-guilty-mercy-and-justice — NT (Romans) + Tanakh (Exodus 20) [free] (★ the balance of mercy and judgment)
--   4. exodus-34-whose-name-is-jealous-no-covenant-with-the-inhabitants — NT (2 Corinthians) + Tanakh (Exodus 20) + Extras (Jubilees) [extras] (★ separation from idolatry — the system, victims-not-enemies)
--   5. exodus-34-the-feasts-renewed-in-the-covenant — Tanakh (Leviticus, Exodus 20) [free] (★ the appointed times re-commanded, NOT abolished)
--   6. exodus-34-the-skin-of-his-face-shone-the-vail-and-the-greater-glory — NT (2 Corinthians, Matthew) + Tanakh (Jeremiah, Ezekiel) [free] (★★ the veil read through the lens — the Torah-glory not abolished but written on the heart)
--
-- Framing notes:
--   ★ THE NAME (THREAD 2): *And Yahuah (LORD) descended in the cloud... and proclaimed, Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth, Keeping mercy for thousands, forgiving iniquity* (34:5-7). Through the Formed-and-Formless lens (Red Line #4): the One who DESCENDED in the cloud and proclaimed the Name is the Formed Son — the visible Glory who appears and speaks in the Tanakh. The forward-weave is John 1:14,17 — *the Word was made flesh... full of grace and truth... grace and truth came by Yahusha HaMashiach (Jesus Christ)* — the proclaimed mercy-and-truth made flesh. NO co-equal-persons grammar; the Formed Son bears the Name and has a Father. The lateral chorus (Num/Neh/Ps/Joel/Jonah/Nah) is the whole Tanakh quoting this one self-revelation back to Yahuah.
--   ★★ THE VAIL (THREAD 6): framed CAREFULLY. 2 Corinthians 3:7-18 is NOT read as "the law is now done away in the antinomian sense." The *letter that killeth* (3:6) is the covenant approached without the Spirit / the unturned heart; *the vail is upon their heart* (3:15) — it is over the HEART that *shall turn to Yahuah* (3:16), not over the Torah. The SAME glory shines GREATER in the Formed Son and is written on the heart by the Spirit (Jer 31:33; Ezek 36:27) — *that which remaineth is glorious* (3:11). The shining face = transfigured glory (Matt 17:2, the Formed Son's own face shone as the sun).
--   ★ JEALOUS / SEPARATION (THREAD 4): *Take heed... lest thou make a covenant with the inhabitants... lest it be for a snare* (34:12); *Yahuah, whose name is Jealous, is a jealous Elohim* (34:14). Victims-not-enemies (Red Line #7): the war is against the SYSTEM of idolatry and the mingling that ensnares, never ethnic hatred. 2 Cor 6:17 (*come out from among them, and be ye separate*) is the gathered-people separation, not replacement.
--   TIER NOTE: THREAD 2 includes John 1:14,17 (canon NT) and an all-canon Tanakh chorus — EVERY member canon -> tier 'free'. All six threads are all-canon EXCEPT THREADS 1 and 4 (Jasher/Jubilees members) -> 'extras'.
--   EXTRAS: Jasher 82 carries the second-tables hewing verse-for-verse (82:24-25, clean parse) and Jubilees 1 the Sinai-tables/Name/covenant frame (1:1-2,9-10, clean). Jasher DOUBLE-WRITTEN 'jasher','jasher'; Jubilees DOUBLE-WRITTEN 'jubilees','jubilees'.
--   VERSES WITH NO ADD: v.2-3 (the readiness/ascent staging) and v.8-10 (Moses worships; I make a covenant, I will do marvels; pardon our iniquity) — the pardon-mercy is carried by the Name proclaimed (THREADS 2-3); no further distinct framework-bearing target forced.

CREATE TEMP VIEW _s305_ex34_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: Hew two tables like the first — the covenant renewed (the same Torah re-written)
    ('canon','exodus',34,1,'canon','deuteronomy',10,1,'free',
      E'*At that time Yahuah (LORD) said unto me, Hew thee two tables of stone like unto the first, and come up unto me into the mount, and make thee an ark of wood* (Deuteronomy 10:1). Moses, retelling the renewal, repeats the very command of *Hew thee two tables of stone like unto the first: and I will write upon these tables the words that were in the first tables, which thou brakest* (Exodus 34:1). The shattered covenant is not scrapped for another — the SAME words are written again on tables hewn like the first; the Torah is restored, not replaced.'),
    ('canon','exodus',34,1,'canon','deuteronomy',10,2,'free',
      E'*And I will write on the tables the words that were in the first tables which thou brakest, and thou shalt put them in the ark* (Deuteronomy 10:2). The promise of *I will write upon these tables the words that were in the first tables, which thou brakest* (Exodus 34:1) is named again: the identical words go back onto the stone. After the golden calf the covenant-word is re-given unchanged — the same ten words, the same Torah, the breach healed not by a new law but by the old law re-written.'),
    ('canon','exodus',34,28,'canon','deuteronomy',10,4,'free',
      E'*And he wrote on the tables, according to the first writing, the ten commandments, which Yahuah (LORD) spake unto you in the mount out of the midst of the fire in the day of the assembly* (Deuteronomy 10:4). This names what *he wrote upon the tables the words of the covenant, the ten commandments* (Exodus 34:28) accomplished — *according to the first writing*, the same ten words. The renewed covenant carries the identical Torah; the second tables are no abridgement, but the first words restored.'),
    ('canon','exodus',34,1,'canon','exodus',32,16,'free',
      E'*And the tables were the work of Elohim (God), and the writing was the writing of Elohim (God), graven upon the tables* (Exodus 32:16). These are the FIRST tables Moses *brakest* (Exodus 34:1) beneath the mount when he saw the calf. That the second tables carry *the words that were in the first tables* binds the renewal to what was broken — the same writing of Elohim, given again; mercy does not lower the covenant-word, it re-writes it.'),
    ('canon','exodus',34,1,'jasher','jasher',82,24,'extras',
      E'*Then spoke Yahuah (the Lord) to Moses to hew two stone tablets and to bring them up to Yahuah (the Lord), who would write upon them the ten commandments* (Jasher 82:24). The extended witness keeps the renewal verse-for-verse with *Hew thee two tables of stone like unto the first: and I will write upon these tables the words* (Exodus 34:1) — Yahuah Himself re-writes the ten words after the calf, the covenant re-given on freshly hewn stone.'),
    ('canon','exodus',34,28,'jasher','jasher',82,25,'extras',
      E'*Now Moses did so, and he came down and hewed the two tablets and went up to Mount Sinai to Yahuah (the Lord), and Yahuah (the Lord) wrote the ten commandments upon the tablets* (Jasher 82:25). The extended witness matches *he wrote upon the tables the words of the covenant, the ten commandments* (Exodus 34:28): the second tables bear the same ten words as the first, the Torah restored entire after Yashar''el''s breach.'),
    ('canon','exodus',34,28,'jubilees','jubilees',1,1,'extras',
      E'*...as Yahuah (God) spake to Moses on Mount Sinai when he went up to receive the tables of the law and of the commandment... "Come up to Me on the Mount, and I will give you two tables of stone of the law and of the commandment, which I have written, that you may teach them."* (Jubilees 1:1). The restored witness frames the very tables of *he wrote upon the tables the words of the covenant, the ten commandments* (Exodus 34:28) as *the tables of the law and of the commandment* given that Yashar''el might be taught — the covenant-instruction handed down, not handed off.'),

    -- THREAD 2 (★★★): The Name proclaimed — merciful and gracious (the chorus + the Formed made flesh)
    ('canon','exodus',34,6,'canon','john',1,14,'free',
      E'*And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth* (John 1:14). The Name proclaimed on Sinai — Yahuah *merciful and gracious, longsuffering, and abundant in goodness and truth* (Exodus 34:6) — is the very character Yochanan (John) beholds made flesh: *full of grace and truth*. The mercy-and-truth that descended in the cloud and proclaimed itself is the same that *dwelt among us*; the One who appeared on the mount is the Formed Son who took flesh.'),
    ('canon','exodus',34,6,'canon','john',1,17,'free',
      E'*For the law was given by Moses, but grace and truth came by Yahusha HaMashiach (Jesus Christ)* (John 1:17). The pairing is not opposition but fulfillment: the *goodness and truth* of *merciful and gracious, longsuffering, and abundant in goodness and truth* (Exodus 34:6) — proclaimed to Moses on the mount of the renewed covenant — *came by Yahusha HaMashiach*. The grace-and-truth named at Sinai is the grace-and-truth embodied; the Formed Son who gave the Torah by Moses is the One in whom its mercy is made manifest.'),
    ('canon','exodus',34,6,'canon','numbers',14,18,'free',
      E'*Yahuah (LORD) is longsuffering, and of great mercy, forgiving iniquity and transgression, and by no means clearing the guilty, visiting the iniquity of the fathers upon the children unto the third and fourth generation* (Numbers 14:18). Moses pleads the Name back to Yahuah almost word-for-word from *Yahuah Elohim... merciful and gracious, longsuffering... forgiving iniquity and transgression and sin, and that will by no means clear the guilty; visiting the iniquity of the fathers* (Exodus 34:6-7). The self-revelation of Sinai becomes Yashar''el''s prayer-ground; mercy proclaimed is mercy claimed.'),
    ('canon','exodus',34,6,'canon','nehemiah',9,17,'free',
      E'*...but thou art a Elohim (God) ready to pardon, gracious and merciful, slow to anger, and of great kindness, and forsookest them not* (Nehemiah 9:17). The Levites'' great confession reaches all the way back to the Name proclaimed — *merciful and gracious, longsuffering* (Exodus 34:6) — even naming the golden calf in the same breath. The character Yahuah declared on the renewed-covenant mount is the very mercy that *forsookest them not* through every rebellion after.'),
    ('canon','exodus',34,6,'canon','psalms',86,15,'free',
      E'*But thou, O Yahuah (Lord), art a Elohim (God) full of compassion, and gracious, longsuffering, and plenteous in mercy and truth* (Psalm 86:15). David sings the Sinai self-revelation back as praise: *gracious, longsuffering, and plenteous in mercy and truth* echoes *merciful and gracious, longsuffering, and abundant in goodness and truth* (Exodus 34:6). The Name proclaimed in the cloud becomes the worshipper''s confidence.'),
    ('canon','exodus',34,6,'canon','psalms',103,8,'free',
      E'*Yahuah (LORD) is merciful and gracious, slow to anger, and plenteous in mercy* (Psalm 103:8). The psalm names the very words — *merciful and gracious* — and even recalls that Yahuah *made known his ways unto Moses* (Psalm 103:7). The Name proclaimed to Moses on the mount (Exodus 34:6) is sung as Yashar''el''s standing comfort: the mercy that removes transgressions as far as the east from the west.'),
    ('canon','exodus',34,6,'canon','psalms',145,8,'free',
      E'*Yahuah (LORD) is gracious, and full of compassion; slow to anger, and of great mercy* (Psalm 145:8). The crown of the Psalter''s praise quotes the Sinai Name — *gracious... slow to anger, and of great mercy* — straight from *merciful and gracious, longsuffering* (Exodus 34:6). The self-revelation of the renewed covenant is the refrain the whole congregation sings.'),
    ('canon','exodus',34,6,'canon','joel',2,13,'free',
      E'*And rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God): for he is gracious and merciful, slow to anger, and of great kindness, and repenteth him of the evil* (Joel 2:13). The prophet calls Yashar''el to return on the ground of the proclaimed Name — *gracious and merciful, slow to anger* (Exodus 34:6) — the mercy declared at Sinai is the very reason the heart may turn back and not be consumed.'),
    ('canon','exodus',34,6,'canon','jonah',4,2,'free',
      E'*...for I knew that thou art a gracious Elohim (God), and merciful, slow to anger, and of great kindness, and repentest thee of the evil* (Jonah 4:2). Even angry Jonah knows the Name by heart — *gracious... merciful, slow to anger* (Exodus 34:6) — and it is precisely this mercy he fears will spare Nineveh. The self-revelation of the mount reaches beyond Yashar''el to the relenting of judgment on a city that turns.'),
    ('canon','exodus',34,7,'canon','nahum',1,3,'free',
      E'*Yahuah (LORD) is slow to anger, and great in power, and will not at all acquit the wicked: Yahuah (LORD) hath his way in the whirlwind and in the storm* (Nahum 1:3). Nahum holds the other half of the Name — *slow to anger* yet *will not at all acquit the wicked*, exactly *that will by no means clear the guilty* (Exodus 34:7). The proclaimed character is mercy AND justice together; the longsuffering Yahuah does not leave the unrepentant unjudged.'),

    -- THREAD 3 (★): By no means clear the guilty — the balance of mercy and justice
    ('canon','exodus',34,7,'canon','exodus',20,5,'free',
      E'*Thou shalt not bow down thyself to them, nor serve them: for I Yahuah Elohayka (the LORD thy God) am a jealous Elohim (God), visiting the iniquity of the fathers upon the children unto the third and fourth generation of them that hate me* (Exodus 20:5). The renewed proclamation carries the same word as the Ten given at the first — *visiting the iniquity of the fathers upon the children, and upon the children''s children, unto the third and to the fourth generation* (Exodus 34:7). The justice of the covenant is unchanged from first tables to second; mercy does not cancel the reckoning.'),
    ('canon','exodus',34,7,'canon','exodus',20,6,'free',
      E'*And shewing mercy unto thousands of them that love me, and keep my commandments* (Exodus 20:6). The other side of the balance: *Keeping mercy for thousands, forgiving iniquity and transgression and sin* (Exodus 34:7). The mercy proclaimed in the renewed covenant is the mercy of the first tables — mercy *unto thousands of them that love me, and keep my commandments*; love and commandment-keeping are the soil where the kept mercy abides.'),
    ('canon','exodus',34,7,'canon','romans',2,4,'free',
      E'*Or despisest thou the riches of his goodness and forbearance and longsuffering; not knowing that the goodness of Elohim (God) leadeth thee to repentance?* (Romans 2:4). Sha''ul names the *longsuffering, and abundant in goodness* of the proclaimed Name (Exodus 34:6-7) as a summons, not a license: the goodness *leadeth thee to repentance*. The mercy that keeps for thousands is meant to turn the heart, never to leave sin uncalled.'),
    ('canon','exodus',34,7,'canon','romans',2,6,'free',
      E'*Who will render to every man according to his deeds* (Romans 2:6). The justice-half of the Name — *that will by no means clear the guilty* (Exodus 34:7) — is carried into the letter: Yahuah *will render to every man according to his deeds*. The mercy proclaimed at Sinai is held together with the rendering of judgment; the longsuffering does not dissolve the reckoning, it gives room to turn before it.'),

    -- THREAD 4 (★): Whose name is Jealous — no covenant with the inhabitants (separation from idolatry)
    ('canon','exodus',34,14,'canon','exodus',20,3,'free',
      E'*Thou shalt have no other gods before me* (Exodus 20:3). The renewed covenant re-presses the first word of the Ten: *For thou shalt worship no other god: for Yahuah (LORD), whose name is Jealous, is a jealous Elohim (God)* (Exodus 34:14). The jealousy of Yahuah is the jealousy of the covenant-marriage — the one Husband of Yashar''el will not share His bride with the gods of the nations.'),
    ('canon','exodus',34,12,'canon','2-corinthians',6,14,'free',
      E'*Be ye not unequally yoked together with unbelievers: for what fellowship hath righteousness with unrighteousness? and what communion hath light with darkness?* (2 Corinthians 6:14). The warning of *Take heed to thyself, lest thou make a covenant with the inhabitants of the land... lest it be for a snare in the midst of thee* (Exodus 34:12) is the same separation Sha''ul presses — no yoking with the worship of darkness. The peril is the SNARE of mingled worship, the system that draws the heart away, never the peoples as enemies.'),
    ('canon','exodus',34,15,'canon','2-corinthians',6,17,'free',
      E'*Wherefore come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you* (2 Corinthians 6:17). Against *lest thou make a covenant with the inhabitants of the land, and they go a whoring after their gods... and thou eat of his sacrifice* (Exodus 34:15), the call is the gathered-people separation — *come out from among them, and be ye separate*. The whoring after other gods is the snare; the separation is unto Yahuah, who *will receive you* as His own.'),
    ('canon','exodus',34,12,'jubilees','jubilees',1,9,'extras',
      E'*For they will forget all My commandments... and they will walk after the nations, and after their uncleanness, and after their shame, and will serve their gods, and these will prove to them an offence and a tribulation and an affliction and a snare* (Jubilees 1:9). The restored witness names the very danger of *lest it be for a snare in the midst of thee* (Exodus 34:12): the gods of the nations become *a snare*. The covenant-warning of the mount is no arbitrary boundary — mingled worship is the trap that ensnares the heart.'),

    -- THREAD 5 (★): The feasts renewed in the covenant (the appointed times NOT abolished)
    ('canon','exodus',34,18,'canon','leviticus',23,6,'free',
      E'*And on the fifteenth day of the same month is the feast of unleavened bread unto Yahuah (LORD): seven days ye must eat unleavened bread* (Leviticus 23:6). The renewed covenant re-commands the feast: *The feast of unleavened bread shalt thou keep. Seven days thou shalt eat unleavened bread... in the time of the month Abib* (Exodus 34:18). The appointed times stand within the renewed covenant exactly as in the feast-law of Leviticus 23 — the moedim are covenant architecture, not abolished but re-affirmed.'),
    ('canon','exodus',34,22,'canon','leviticus',23,16,'free',
      E'*Even unto the morrow after the seventh sabbath shall ye number fifty days; and ye shall offer a new meat offering unto Yahuah (LORD)* (Leviticus 23:16). The feast of weeks re-commanded in the renewal — *thou shalt observe the feast of weeks, of the firstfruits of wheat harvest, and the feast of ingathering at the year''s end* (Exodus 34:22) — is the same Shavuot of the count-of-fifty in Leviticus 23. The covenant renewed keeps Yahuah''s calendar intact, harvest by harvest.'),
    ('canon','exodus',34,21,'canon','exodus',20,8,'free',
      E'*Remember the sabbath day, to keep it holy* (Exodus 20:8). The renewed covenant sets the Sabbath even in the press of the harvest: *Six days thou shalt work, but on the seventh day thou shalt rest: in earing time and in harvest thou shalt rest* (Exodus 34:21). The seventh-day rest of the Ten is carried into the renewal unbroken — creation-rooted, *for in six days Yahuah (LORD) made heaven and earth... and rested the seventh day* (Exodus 20:11) — the Sabbath holds even when the fields are ready.'),

    -- THREAD 6 (★★): The skin of his face shone — the vail and the greater glory
    ('canon','exodus',34,29,'canon','2-corinthians',3,7,'free',
      E'*But if the ministration of death, written and engraven in stones, was glorious, so that the children of Yashar''el (Israel) could not stedfastly behold the face of Moses for the glory of his countenance; which glory was to be done away* (2 Corinthians 3:7). Sha''ul reads *the skin of his face shone... and they were afraid to come nigh him* (Exodus 34:29-30): the glory on Moses'' face was real and from Yahuah. The argument is not that the covenant-glory was worthless but that a GREATER glory exceeds it — *if the ministration of death... was glorious, how shall not the ministration of the spirit be rather glorious?* The Torah written on stone shone; the Torah written on the heart by the Spirit shines more.'),
    ('canon','exodus',34,33,'canon','2-corinthians',3,15,'free',
      E'*But even unto this day, when Moses is read, the vail is upon their heart* (2 Corinthians 3:15). When *Moses had done speaking with them, he put a vail on his face* (Exodus 34:33), Sha''ul reads the veil as moving to the HEART — *the vail is upon their heart*. The veil is not over the Torah but over the unturned heart; *when it shall turn to Yahuah (Lord), the vail shall be taken away* (2 Corinthians 3:16). The same glory is seen with open face by the heart that turns.'),
    ('canon','exodus',34,35,'canon','2-corinthians',3,18,'free',
      E'*But we all, with open face beholding as in a glass the glory of Yahuah (Lord), are changed into the same image from glory to glory, even as by the Spirit of Yahuah (Lord)* (2 Corinthians 3:18). Where *the children of Yashar''el (Israel) saw the face of Moses, that the skin of Moses'' face shone* (Exodus 34:35) yet hid behind a veil, the turned heart now beholds *with open face* and is changed *from glory to glory*. The shining of Moses'' face was the first measure of a glory that, by the Spirit, transfigures the beholder.'),
    ('canon','exodus',34,29,'canon','matthew',17,2,'free',
      E'*And was transfigured before them: and his face did shine as the sun, and his raiment was white as the light* (Matthew 17:2). Moses'' face shone with a borrowed, fading glory after he *talked with him* (Exodus 34:29); on the mount of transfiguration the Formed Son''s own face *did shine as the sun* — glory not reflected but His own. The veiled glory of Sinai is unveiled in the One whose face is the very light, and Moses himself stands there with Him.'),
    ('canon','exodus',34,29,'canon','jeremiah',31,33,'free',
      E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). The tables of stone Moses carried down with his face shining (Exodus 34:29) point to a writing yet to come — the SAME law *in their inward parts... in their hearts*. The greater glory is not a different Torah but this Torah moved from stone to heart; the new covenant is the law written within, never the law abolished.'),
    ('canon','exodus',34,29,'canon','ezekiel',36,27,'free',
      E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). The glory that shone on Moses'' face from the stone tables (Exodus 34:29) becomes, by the Spirit, an inward power to keep the very statutes those tables held — *cause you to walk in my statutes... and do them*. This is the greater glory of the ministration of the Spirit: not freedom from the Torah but the Spirit-given heart that walks in it.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s305_ex34_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s305_ex34_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-34-hew-two-tables-like-the-first-the-covenant-renewed',
       E'Hew two tables like the first — the covenant renewed, the same Torah re-written',
       E'After the golden calf shattered the first tables, the covenant is not scrapped for a new one — it is RENEWED with the same words: *And Yahuah (LORD) said unto Moses, Hew thee two tables of stone like unto the first: and I will write upon these tables the words that were in the first tables, which thou brakest* (Exodus 34:1). At the end of the forty days, *he wrote upon the tables the words of the covenant, the ten commandments* (Exodus 34:28) — the identical ten words. Moses retelling it presses the point: *Hew thee two tables of stone like unto the first... I will write on the tables the words that were in the first tables which thou brakest* (Deuteronomy 10:1-2), *according to the first writing, the ten commandments* (Deuteronomy 10:4). The first tables were *the work of Elohim (God), and the writing was the writing of Elohim (God)* (Exodus 32:16) before Moses broke them beneath the mount — and the second carry that same writing again. The Torah is not lowered to meet the people''s sin; the breach is healed by the old law re-written. The restored witnesses keep it whole: *Then spoke Yahuah (the Lord) to Moses to hew two stone tablets... who would write upon them the ten commandments... and Yahuah (the Lord) wrote the ten commandments upon the tablets* (Jasher 82:24-25), and Jubilees frames the gift as *the tables of the law and of the commandment... which I have written, that you may teach them* (Jubilees 1:1). Mercy after the calf means the covenant-word restored entire — the Torah given again, unchanged.',
       sv.verse_id, ev.verse_id, 'extras', 29825
  FROM _s305_ex34_lookup sv, _s305_ex34_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=34 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-34-the-name-proclaimed-merciful-and-gracious',
       E'The Name proclaimed — merciful and gracious (the chorus of the Tanakh, the mercy made flesh)',
       E'This is the keystone of the chapter and one of the great keystones of the whole Tanakh — the self-revelation of Yahuah''s own character: *And Yahuah (LORD) descended in the cloud, and stood with him there, and proclaimed the name of Yahuah (LORD). And Yahuah (LORD) passed by before him, and proclaimed, Yahuah (LORD), Yahuah Elohim (The LORD God), merciful and gracious, longsuffering, and abundant in goodness and truth, Keeping mercy for thousands, forgiving iniquity and transgression and sin, and that will by no means clear the guilty* (Exodus 34:5-7). Read through the Formed-and-the-Formless: the One who *descended in the cloud* and proclaimed the Name is the Formed Son — the visible Glory who appears and speaks throughout the Tanakh, who bears the Name and has a Father. The forward-weave names Him made flesh: *the Word was made flesh, and dwelt among us... full of grace and truth* (John 1:14), *grace and truth came by Yahusha HaMashiach (Jesus Christ)* (John 1:17) — the *goodness and truth* proclaimed on the mount embodied. This self-revelation becomes the chorus the whole Tanakh sings back: Moses pleads it for the people — *Yahuah (LORD) is longsuffering, and of great mercy, forgiving iniquity and transgression, and by no means clearing the guilty* (Numbers 14:18); the Levites confess it over the very calf — *thou art a Elohim (God) ready to pardon, gracious and merciful, slow to anger* (Nehemiah 9:17); David prays it — *full of compassion, and gracious, longsuffering, and plenteous in mercy and truth* (Psalm 86:15); the Psalter sings it — *Yahuah (LORD) is merciful and gracious, slow to anger* (Psalm 103:8), *gracious, and full of compassion; slow to anger, and of great mercy* (Psalm 145:8); the prophets call the heart home by it — *gracious and merciful, slow to anger... and repenteth him of the evil* (Joel 2:13), and even angry Jonah knows it by heart — *a gracious Elohim (God), and merciful, slow to anger* (Jonah 4:2). And Nahum holds the other side of the same Name — *slow to anger, and great in power, and will not at all acquit the wicked* (Nahum 1:3), the *by no means clear the guilty* of the proclamation. The Name proclaimed at the renewed covenant is the river the entire Tanakh drinks from, and the mercy-and-truth it names is the Formed Son who would dwell among us.',
       sv.verse_id, ev.verse_id, 'free', 29828
  FROM _s305_ex34_lookup sv, _s305_ex34_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=34 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-34-by-no-means-clear-the-guilty-mercy-and-justice',
       E'By no means clear the guilty — the balance of mercy and justice',
       E'The proclaimed Name holds two things together that the antinomian heart wants to split: boundless mercy AND unwavering justice. *Keeping mercy for thousands, forgiving iniquity and transgression and sin, and that will by no means clear the guilty; visiting the iniquity of the fathers upon the children... unto the third and to the fourth generation* (Exodus 34:7). This is the very word of the Ten given at the first: *I Yahuah Elohayka (the LORD thy God) am a jealous Elohim (God), visiting the iniquity of the fathers upon the children unto the third and fourth generation of them that hate me* (Exodus 20:5), *and shewing mercy unto thousands of them that love me, and keep my commandments* (Exodus 20:6). Mercy is *unto thousands of them that love me, and keep my commandments* — kept mercy abides where love and obedience are, never as a license to leave sin uncalled. Sha''ul carries both sides forward: the *longsuffering, and abundant in goodness* of the Name is a summons, not indulgence — *the goodness of Elohim (God) leadeth thee to repentance* (Romans 2:4) — and the *by no means clear the guilty* stands, for Yahuah *will render to every man according to his deeds* (Romans 2:6). The mercy proclaimed on the mount gives room to turn before the reckoning; it never dissolves it.',
       sv.verse_id, ev.verse_id, 'free', 29831
  FROM _s305_ex34_lookup sv, _s305_ex34_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=34 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-34-whose-name-is-jealous-no-covenant-with-the-inhabitants',
       E'Whose name is Jealous — make no covenant with the inhabitants (separation from idolatry)',
       E'The renewed covenant guards the heart from the one thing that broke it — the worship of other gods: *Take heed to thyself, lest thou make a covenant with the inhabitants of the land whither thou goest, lest it be for a snare in the midst of thee* (Exodus 34:12); *thou shalt worship no other god: for Yahuah (LORD), whose name is Jealous, is a jealous Elohim (God)* (Exodus 34:14). This re-presses the first word of the Ten — *Thou shalt have no other gods before me* (Exodus 20:3) — and the jealousy is the jealousy of the covenant-marriage: the one Husband will not share His bride with the gods of the nations, lest *they go a whoring after their gods... and one call thee, and thou eat of his sacrifice* (Exodus 34:15). The danger is the SNARE of mingled worship — the system that draws the heart away — never the peoples as enemies; the restored witness names it plainly: *they will walk after the nations... and will serve their gods, and these will prove to them an offence and a tribulation and an affliction and a snare* (Jubilees 1:9). The same separation sounds in Sha''ul: *Be ye not unequally yoked together with unbelievers... what communion hath light with darkness?* (2 Corinthians 6:14), *Wherefore come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you* (2 Corinthians 6:17). The separation is unto Yahuah, who receives His people as His own — the gathered, not the replaced.',
       sv.verse_id, ev.verse_id, 'extras', 29834
  FROM _s305_ex34_lookup sv, _s305_ex34_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=34 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-34-the-feasts-renewed-in-the-covenant',
       E'The feasts renewed in the covenant — the appointed times re-commanded',
       E'When the covenant is renewed, Yahuah does not leave out His calendar — the appointed times are re-commanded in the same breath as the second tables: *The feast of unleavened bread shalt thou keep. Seven days thou shalt eat unleavened bread, as I commanded thee, in the time of the month Abib* (Exodus 34:18); *thou shalt observe the feast of weeks, of the firstfruits of wheat harvest, and the feast of ingathering at the year''s end* (Exodus 34:22); *Thrice in the year shall all your men children appear before Adonai Yahuah (the Lord GOD), the Elohim (God) of Yashar''el (Israel)* (Exodus 34:23). These are the very feasts of the great feast-law: *on the fifteenth day of the same month is the feast of unleavened bread unto Yahuah (LORD): seven days ye must eat unleavened bread* (Leviticus 23:6), and the count-of-fifty unto Weeks — *shall ye number fifty days; and ye shall offer a new meat offering unto Yahuah (LORD)* (Leviticus 23:16). And in the press of the harvest the Sabbath holds: *Six days thou shalt work, but on the seventh day thou shalt rest: in earing time and in harvest thou shalt rest* (Exodus 34:21) — the seventh-day rest of the Ten, *Remember the sabbath day, to keep it holy* (Exodus 20:8), creation-rooted, *for in six days Yahuah (LORD) made heaven and earth... and rested the seventh day* (Exodus 20:11). The moedim are not abolished and not optional; they are the architecture of the covenant, carried whole into its renewal.',
       sv.verse_id, ev.verse_id, 'free', 29837
  FROM _s305_ex34_lookup sv, _s305_ex34_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=34 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'exodus-34-the-skin-of-his-face-shone-the-vail-and-the-greater-glory',
       E'The skin of his face shone — the vail, and the glory written on the heart',
       E'Coming down from the mount with the second tables, *Moses wist not that the skin of his face shone while he talked with him* (Exodus 34:29); Yashar''el *were afraid to come nigh him* (Exodus 34:30), and so *he put a vail on his face* (Exodus 34:33), taking it off only when he went in before Yahuah. Sha''ul reads this scene — and the framework reads it carefully, against the antinomian misuse. The glory on Moses'' face was REAL and from Yahuah: *if the ministration of death, written and engraven in stones, was glorious, so that the children of Yashar''el (Israel) could not stedfastly behold the face of Moses for the glory of his countenance* (2 Corinthians 3:7). The argument is not that the covenant-glory was worthless but that a GREATER glory exceeds it — *that which remaineth is glorious* (3:11). And where is the veil now? *When Moses is read, the vail is upon their heart* (2 Corinthians 3:15) — over the HEART, not over the Torah; *when it shall turn to Yahuah (Lord), the vail shall be taken away* (3:16), and the turned heart beholds *with open face... and is changed into the same image from glory to glory* (2 Corinthians 3:18). That greater glory is not a different law but this same Torah moved from stone to heart: *I will put my law in their inward parts, and write it in their hearts* (Jeremiah 31:33); *I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). The fading shine on Moses'' face was the first measure of a glory unveiled in the Formed Son, whose own face *did shine as the sun* (Matthew 17:2) — with Moses himself standing beside Him. The letter that kills is the covenant approached without the Spirit and the unturned heart; the Torah written within by the Spirit is the glory that remains.',
       sv.verse_id, ev.verse_id, 'free', 29840
  FROM _s305_ex34_lookup sv, _s305_ex34_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=29
   AND ev.edition_slug='canon' AND ev.book_slug='exodus' AND ev.chapter_number=34 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Hew thee two tables of stone like unto the first... I will write on the tables the words that were in the first tables which thou brakest* (Deuteronomy 10:1) — Moses retells the renewal of 34:1: the same words re-written, the Torah restored not replaced.'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=1
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-hew-two-tables-like-the-first-the-covenant-renewed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I will write on the tables the words that were in the first tables which thou brakest* (Deuteronomy 10:2) — the identical words go back on the stone; the breach healed by the old law re-given (34:1).'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=1
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-hew-two-tables-like-the-first-the-covenant-renewed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*according to the first writing, the ten commandments* (Deuteronomy 10:4) — names what *the words of the covenant, the ten commandments* (34:28) accomplished: the same ten words restored.'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=28
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-hew-two-tables-like-the-first-the-covenant-renewed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the tables were the work of Elohim (God), and the writing was the writing of Elohim (God)* (Exodus 32:16) — the FIRST tables Moses brakest (34:1); the second carry the same divine writing again.'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=1
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=32 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-hew-two-tables-like-the-first-the-covenant-renewed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*hew two stone tablets... and Yahuah wrote the ten commandments upon the tablets* (Jasher 82:24) — the restored witness keeps the renewal of 34:1 verse-for-verse.'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=1
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=82 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-hew-two-tables-like-the-first-the-covenant-renewed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Yahuah (the Lord) wrote the ten commandments upon the tablets* (Jasher 82:25) — matches *the words of the covenant, the ten commandments* (34:28); the same ten words on the second tables.'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=28
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='jasher' AND tv.book_slug='jasher' AND tv.chapter_number=82 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-hew-two-tables-like-the-first-the-covenant-renewed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*the tables of the law and of the commandment... which I have written, that you may teach them* (Jubilees 1:1) — frames the tables of 34:28 as covenant-instruction handed down to be taught.'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=28
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=1 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-hew-two-tables-like-the-first-the-covenant-renewed'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the Word was made flesh, and dwelt among us... full of grace and truth* (John 1:14) — the *goodness and truth* proclaimed on the mount (34:6) made flesh; the One who descended in the cloud = the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=6
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-the-name-proclaimed-merciful-and-gracious'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*grace and truth came by Yahusha HaMashiach (Jesus Christ)* (John 1:17) — the grace-and-truth of the Name (34:6) embodied; not opposition to the Torah given by Moses but its mercy made manifest.'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=6
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-the-name-proclaimed-merciful-and-gracious'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Yahuah (LORD) is longsuffering, and of great mercy, forgiving iniquity and transgression, and by no means clearing the guilty* (Numbers 14:18) — Moses pleads the Name of 34:6-7 back almost word-for-word.'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=6
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=14 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-the-name-proclaimed-merciful-and-gracious'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*a Elohim (God) ready to pardon, gracious and merciful, slow to anger* (Nehemiah 9:17) — the Levites confess the Name over the very calf; the mercy that forsook them not.'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=6
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=9 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-the-name-proclaimed-merciful-and-gracious'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*full of compassion, and gracious, longsuffering, and plenteous in mercy and truth* (Psalm 86:15) — David sings the Sinai self-revelation of 34:6 back as praise.'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=6
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=86 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-the-name-proclaimed-merciful-and-gracious'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Yahuah (LORD) is merciful and gracious, slow to anger, and plenteous in mercy* (Psalm 103:8) — the psalm recalls Yahuah made known his ways unto Moses (34:5-6); the Name sung as standing comfort.'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=6
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-the-name-proclaimed-merciful-and-gracious'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Yahuah (LORD) is gracious, and full of compassion; slow to anger, and of great mercy* (Psalm 145:8) — the Psalter''s crown of praise quotes the Sinai Name of 34:6 straight.'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=6
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=145 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-the-name-proclaimed-merciful-and-gracious'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*gracious and merciful, slow to anger, and of great kindness, and repenteth him of the evil* (Joel 2:13) — the prophet calls the heart home on the ground of the proclaimed Name (34:6).'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=6
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-the-name-proclaimed-merciful-and-gracious'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'*thou art a gracious Elohim (God), and merciful, slow to anger... and repentest thee of the evil* (Jonah 4:2) — even angry Jonah knows the Name of 34:6 by heart; mercy reaching a city that turns.'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=6
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=4 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-the-name-proclaimed-merciful-and-gracious'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 10, E'*Yahuah (LORD) is slow to anger, and great in power, and will not at all acquit the wicked* (Nahum 1:3) — the OTHER half of the Name: *that will by no means clear the guilty* (34:7); mercy and justice together.'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=7
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nahum' AND tv.chapter_number=1 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-the-name-proclaimed-merciful-and-gracious'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*a jealous Elohim (God), visiting the iniquity of the fathers upon the children unto the third and fourth generation of them that hate me* (Exodus 20:5) — the justice-word of the Ten, unchanged in the renewed proclamation (34:7).'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=7
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-by-no-means-clear-the-guilty-mercy-and-justice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*shewing mercy unto thousands of them that love me, and keep my commandments* (Exodus 20:6) — the mercy-half: kept mercy abides where love and obedience are (34:7''s *keeping mercy for thousands*).'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=7
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-by-no-means-clear-the-guilty-mercy-and-justice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the goodness of Elohim (God) leadeth thee to repentance* (Romans 2:4) — the *longsuffering, and abundant in goodness* of 34:6 is a summons to turn, not a license.'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=7
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-by-no-means-clear-the-guilty-mercy-and-justice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Who will render to every man according to his deeds* (Romans 2:6) — the *by no means clear the guilty* of 34:7 carried forward; mercy does not dissolve the reckoning.'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=7
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-by-no-means-clear-the-guilty-mercy-and-justice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Thou shalt have no other gods before me* (Exodus 20:3) — the first word of the Ten re-pressed in 34:14: *worship no other god... whose name is Jealous*.'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=14
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-whose-name-is-jealous-no-covenant-with-the-inhabitants'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Be ye not unequally yoked together with unbelievers... what communion hath light with darkness?* (2 Corinthians 6:14) — the same separation as *lest it be for a snare* (34:12); the system, not the peoples.'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=12
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-whose-name-is-jealous-no-covenant-with-the-inhabitants'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*come out from among them, and be ye separate, saith Yahuah (Lord)... and I will receive you* (2 Corinthians 6:17) — against the whoring-after-gods of 34:15; separation unto Yahuah, the gathered not the replaced.'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=15
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-whose-name-is-jealous-no-covenant-with-the-inhabitants'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*they will serve their gods, and these will prove to them an offence... and a snare* (Jubilees 1:9) — the restored witness names the very *snare* of 34:12; mingled worship is the trap.'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=12
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-whose-name-is-jealous-no-covenant-with-the-inhabitants'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the feast of unleavened bread unto Yahuah (LORD): seven days ye must eat unleavened bread* (Leviticus 23:6) — the same feast re-commanded in the renewal (34:18); the moedim are covenant architecture.'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=18
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-the-feasts-renewed-in-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*shall ye number fifty days; and ye shall offer a new meat offering unto Yahuah (LORD)* (Leviticus 23:16) — the feast of weeks of 34:22, the Shavuot count-of-fifty kept whole in the renewal.'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=22
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-the-feasts-renewed-in-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Remember the sabbath day, to keep it holy* (Exodus 20:8) — the seventh-day rest of the Ten; in the renewal it holds even in harvest (34:21).'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=21
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-the-feasts-renewed-in-the-covenant'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*if the ministration of death, written and engraven in stones, was glorious, so that the children of Yashar''el could not stedfastly behold the face of Moses* (2 Corinthians 3:7) — the shining face of 34:29 was real glory; a GREATER glory exceeds it, not abolishes it.'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=29
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=3 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-the-skin-of-his-face-shone-the-vail-and-the-greater-glory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*when Moses is read, the vail is upon their heart* (2 Corinthians 3:15) — the veil Moses put on (34:33) is read as over the HEART, not the Torah; lifted *when it shall turn to Yahuah* (3:16).'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=33
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=3 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-the-skin-of-his-face-shone-the-vail-and-the-greater-glory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*we all, with open face... are changed into the same image from glory to glory... by the Spirit* (2 Corinthians 3:18) — where Yashar''el saw Moses'' face veiled (34:35), the turned heart beholds unveiled and is transfigured.'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=35
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=3 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-the-skin-of-his-face-shone-the-vail-and-the-greater-glory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*was transfigured before them: and his face did shine as the sun* (Matthew 17:2) — Moses'' borrowed fading shine (34:29) unveiled in the Formed Son whose own face is the light, Moses beside Him.'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=29
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=17 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-the-skin-of-his-face-shone-the-vail-and-the-greater-glory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*I will put my law in their inward parts, and write it in their hearts* (Jeremiah 31:33) — the SAME law of the stone tables (34:29) moved to the heart; the greater glory is the Torah written within, not abolished.'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=29
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-the-skin-of-his-face-shone-the-vail-and-the-greater-glory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27) — the ministration of the Spirit: not freedom from the Torah of 34:29 but the heart that walks in it.'
  FROM cross_reference_threads t
  JOIN _s305_ex34_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='exodus' AND sv.chapter_number=34 AND sv.verse_number=29
  JOIN _s305_ex34_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='exodus-34-the-skin-of-his-face-shone-the-vail-and-the-greater-glory'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session305 — Exodus cross-references complete.'
