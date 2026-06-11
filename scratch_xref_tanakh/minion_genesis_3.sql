-- ----- fragment: minion_genesis_3.sql (Genesis 3) -----
-- Chapter: Genesis 3 (The Fall, the protoevangelium, the expulsion)
-- Tag: ge03   Temp view: _s301_ge03_lookup
-- Sort band: base 20050, step 3 -> threads at 20050, 20053, 20056, 20059, 20062 (5 threads)
-- Source of EVERY row: 'canon','genesis',3,v
--
-- Genesis 3 coverage:
--   v.1  ("Yea, hath Elohim said?" — the serpent's foundational lie)
--        NT:     2 Corinthians 11:3 (the serpent beguiled Eve through his subtilty); John 8:44 (a liar, and the father of it)
--        Extras: none warranted as MEMBER (Wisdom 2:24 carries a trailing apparatus glyph; not quoted)
--        Tanakh: none warranted (the lie is named forward in the NT)
--   v.2-5 (the dialogue; "ye shall be as gods, knowing good and evil")
--        NT:     2 Corinthians 11:3 (already woven at v.1 — the corrupting of the mind)
--        Extras: none warranted
--        Tanakh: none warranted
--   v.6  (she took, did eat, gave to her husband)
--        NT:     1 Timothy 2:14 considered; the seed-war / fall framing carried at v.15 instead
--        Extras: none warranted
--        Tanakh: none warranted
--   v.7-13 (eyes opened, hid, the LORD God walking, the blame, "the serpent beguiled me")
--        NT:     2 Corinthians 11:3 (beguiled Eve through his subtilty) — woven at v.1 thread, anchored to v.13
--        Extras: none warranted
--        Tanakh: none warranted (theophany — the Formed walking — noted in summary, no add)
--   v.14 (the serpent cursed)
--        NT:     Revelation 12:9 (that old serpent, called the Devil) — woven into the seed thread
--        Extras: none warranted distinct from the protoevangelium thread
--        Tanakh: none warranted
--   ★ v.15 (THE PROTOEVANGELIUM — the seed of the woman bruises the serpent's head)
--        NT:     Romans 16:20; 1 John 3:8; Galatians 4:4; Revelation 12:9; Revelation 12:17; Luke 10:18; Luke 10:19
--        Extras: Wisdom of Solomon 2:24 (through envy of the devil came death) — NOT quoted as member (trailing apparatus glyph); recorded only
--        Tanakh: none added (the seed-war runs forward into the NT)
--   v.16 (sorrow multiplied; bring forth children)
--        NT:     none warranted as its own thread (Jubilees retelling not distinctive)
--        Extras: none warranted
--        Tanakh: none warranted
--   v.17-19 (cursed is the ground; thorns and thistles; dust to dust)
--        NT:     Romans 8:20; Romans 8:21; Romans 8:22 (creation subjected, groaneth); 1 Corinthians 15:21,22,45 (last Adam undoes dust)
--        Extras: none warranted as MEMBER (Jubilees 3:25 is a near-verbatim retelling, not a distinct witness)
--        Tanakh: none warranted
--   v.20 (Adam named his wife Eve, mother of all living)
--        NT:     none warranted
--        Extras: none warranted
--        Tanakh: none warranted (a naming note; no forward weave demanded)
--   v.21 (coats of skins — the first covering)
--        NT:     none direct; the covering-of-righteousness type carried by Isaiah 61:10
--        Extras: Jubilees 3:26 (He made for them coats of skin, and clothed them)
--        Tanakh: Isaiah 61:10 (the robe of righteousness, garments of salvation)
--   v.22-24 (driven out; cherubim and flaming sword guard the tree of life)
--        NT:     Revelation 2:7 (to him that overcometh... the tree of life); Revelation 22:2 (leaves for the healing of the nations); Revelation 22:14 (right to the tree of life)
--        Extras: Jubilees 3:26 (sent them forth from the Garden of Eden); Jubilees 3:32 (the new moon of the fourth month — the expulsion date); Jubilees 3:28 (the mouth of all beasts closed)
--        Tanakh: none warranted
--
-- Threads (slug -> target libraries):
--   genesis-3-yea-hath-elohim-said-the-serpents-foundational-lie        [NT]            tier free
--   genesis-3-the-seed-of-the-woman-shall-bruise-the-serpents-head      [NT]            tier free   ★ CENTERPIECE
--   genesis-3-cursed-is-the-ground-creation-subjected-and-the-last-adam [NT]            tier free
--   genesis-3-coats-of-skins-the-first-covering-and-the-robe-of-righteousness [NT+Extras+Tanakh] tier extras
--   genesis-3-driven-out-the-flaming-sword-and-the-tree-of-life-reopened [NT+Extras]    tier extras
--
-- Framework-load-bearing notes:
--   v.15 PROTOEVANGELIUM: read NOT as a generic good-vs-evil moral but as the institution of the
--     literal seed-war — enmity between the serpent's seed and the woman's seed — that runs the whole
--     canon. The woman's seed is the Formed Son (Galatians 4:4, made of a woman) who crushes the head;
--     the bruised heel is the cross. Romans 16:20 hands the victory to the body (under YOUR feet);
--     Revelation 12:17 names the ongoing war on the remnant of her seed which keep the commandments —
--     the 1 John 2:3-4 filter holds. The wheat/tares fullness (Matthew 13) is NOT pulled here; this is
--     the enmity instituted, not the harvest. Centerpiece thread, richest weave.
--   v.1 "Yea, hath Elohim said?": framed as the FOUNDATIONAL lie — the same "did God really say?"
--     doubt the framework names as the antichrist voice; tied to 2 Corinthians 11:3 and John 8:44.
--   v.8 theophany: the voice of Yahuah Elohim walking in the garden is the Formed Son — noted in
--     summary prose, no separate add.
--   Wisdom of Solomon 2:24 (through envy of the devil came death into the world) was the natural
--     extras member for the seed/death thread, but the parse returns a trailing apparatus glyph (' ⸻')
--     after the sentence; per the brief I do not quote a verse carrying apparatus noise, so it is
--     recorded in coverage only and NOT added as a member.

CREATE TEMP VIEW _s301_ge03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ============================== cross_references ==============================
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: "Yea, hath Elohim said?" — the foundational lie
    ('canon','genesis',3,1,'canon','2-corinthians',11,3,'free',
      E'*But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ)* (2 Corinthians 11:3). The serpent''s opening words — *Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* (Genesis 3:1) — are not a question for information but the first assault on the word: the *did Elohim really say?* doubt that hollows the commandment out. Sha''ul names the same *subtilty* still beguiling minds away from the simplicity of the truth; the foundational lie has never changed its method.'),
    ('canon','genesis',3,1,'canon','john',8,44,'free',
      E'*Ye are of your father the devil, and the lusts of your father ye will do. He was a murderer from the beginning, and abode not in the truth, because there is no truth in him. When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it* (John 8:44). The serpent''s *Yea, hath Elohim (God) said* (Genesis 3:1) and his flat contradiction *Ye shall not surely die* (3:4) are the first lie ever spoken; Yahusha (Jesus) traces every lie back to this same father, *a liar, and the father of it* — the diagnostic for the voice that questions the word.'),

    -- THREAD 2 (CENTERPIECE): the seed of the woman bruises the serpent's head
    ('canon','genesis',3,15,'canon','romans',16,20,'free',
      E'*And the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20). The sentence on the serpent — *it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15) — is handed forward to the body: the same crushing-of-the-head verb, now *under YOUR feet*, the people sharing the woman''s-seed victory. The enmity instituted in the garden is being finished in those who are in the Seed.'),
    ('canon','genesis',3,15,'canon','1-john',3,8,'free',
      E'*He that committeth sin is of the devil; for the devil sinneth from the beginning. For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (1 John 3:8). *I will put enmity between thee and the woman, and between thy seed and her seed* (Genesis 3:15) is the war declared; *that he might destroy the works of the devil* is the war''s purpose stated plainly. The bruised head is the works of the devil undone at the root.'),
    ('canon','genesis',3,15,'canon','galatians',4,4,'free',
      E'*But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law* (Galatians 4:4). *Her seed* (Genesis 3:15) is read here exactly — *made of a woman* — the Formed Son drawn into flesh to be the woman''s Seed that crushes the head. The seed-war is not metaphor: it required a Son sent in the fulness of time, born of the woman, keeping the very Torah the serpent told her to doubt.'),
    ('canon','genesis',3,15,'canon','revelation',12,9,'free',
      E'*And the great dragon was cast out, that old serpent, called the Devil, and Satan, which deceiveth the whole world: he was cast out into the earth, and his angels were cast out with him* (Revelation 12:9). The garden serpent is named at the end of the canon — *that old serpent* — confirming the foe of Genesis 3:15 is one continuous enemy from the first deception to the last. *And I will put enmity between thee and the woman* opens the war that this casting-out begins to close.'),
    ('canon','genesis',3,15,'canon','revelation',12,17,'free',
      E'*And the dragon was wroth with the woman, and went to make war with the remnant of her seed, which keep the commandments of Elohim (God), and have the testimony of Yahusha HaMashiach (Jesus Christ)* (Revelation 12:17). Genesis 3:15''s *enmity... between thy seed and her seed* still runs: the dragon wars on *the remnant of her seed*, marked by the very thing the serpent first attacked — they *keep the commandments of Elohim*. The seed-war and the commandment are inseparable to the end.'),
    ('canon','genesis',3,15,'canon','luke',10,18,'free',
      E'*And he said unto them, I beheld Satan as lightning fall from heaven* (Luke 10:18). The Seed who would *bruise thy head* (Genesis 3:15) reports the fall as already in motion; the head-crushing is not deferred to a far horizon but breaking in wherever his authority advances.'),
    ('canon','genesis',3,15,'canon','luke',10,19,'free',
      E'*Behold, I give unto you power to tread on serpents and scorpions, and over all the power of the enemy: and nothing shall by any means hurt you* (Luke 10:19). The promise that the woman''s seed *shall bruise thy head* (Genesis 3:15) is extended to his sent ones — *power to tread on serpents* — the heel set on the serpent''s head in those who walk in the Seed''s authority.'),

    -- THREAD 3: cursed is the ground — creation subjected, the last Adam
    ('canon','genesis',3,17,'canon','romans',8,20,'free',
      E'*For the creature was made subject to vanity, not willingly, but by reason of him who hath subjected the same in hope* (Romans 8:20). When Yahuah Elohim (the LORD God) said *cursed is the ground for thy sake* (Genesis 3:17), the whole creation was bent under Adam''s fall — *made subject to vanity*, yet the very wording carries *in hope*, the curse never the last word.'),
    ('canon','genesis',3,18,'canon','romans',8,21,'free',
      E'*Because the creature itself also shall be delivered from the bondage of corruption into the glorious liberty of the children of Elohim (God)* (Romans 8:21). The *thorns also and thistles* (Genesis 3:18) are the ground in its bondage; Sha''ul promises the same ground *delivered from the bondage of corruption* — Eden''s curse reversed when the children of Elohim are revealed.'),
    ('canon','genesis',3,19,'canon','romans',8,22,'free',
      E'*For we know that the whole creation groaneth and travaileth in pain together until now* (Romans 8:22). *In the sweat of thy face shalt thou eat bread, till thou return unto the ground... for dust thou art, and unto dust shalt thou return* (Genesis 3:19) is the groan put into the soil and the flesh; the whole creation has been *travailing* under that sentence ever since, waiting to be loosed.'),
    ('canon','genesis',3,19,'canon','1-corinthians',15,22,'free',
      E'*For as in Adam all die, even so in Messiah (Christ) shall all be made alive* (1 Corinthians 15:22). *Dust thou art, and unto dust shalt thou return* (Genesis 3:19) is the death that entered in Adam; the answer is set Adam against Adam — *as in Adam all die, even so in Messiah shall all be made alive* — the dust-sentence undone in the One who rose.'),
    ('canon','genesis',3,19,'canon','1-corinthians',15,45,'free',
      E'*And so it is written, The first man Adam was made a living soul; the last Adam was made a quickening spirit* (1 Corinthians 15:45). The man of dust who must *return unto the ground* (Genesis 3:19) is *the first man Adam*; the *last Adam* comes as *a quickening spirit* to give back the life the ground took, the second Adam reversing the first Adam''s return to dust.'),

    -- THREAD 4: coats of skins — the first covering, the robe of righteousness
    ('canon','genesis',3,21,'canon','isaiah',61,10,'free',
      E'*I will greatly rejoice in Yahuah (LORD)... for he hath clothed me with the garments of salvation, he hath covered me with the robe of righteousness, as a bridegroom decketh himself with ornaments, and as a bride adorneth herself with her jewels* (Isaiah 61:10). When *Yahuah Elohim (the LORD God) make coats of skins, and clothed them* (Genesis 3:21), the self-made fig-leaf aprons (3:7) were set aside for a covering that cost a life — the first of the *garments of salvation*, the *robe of righteousness* Yahuah himself puts on his people.'),
    ('canon','genesis',3,21,'jubilees','jubilees',3,26,'extras',
      E'*And He made for them coats of skin, and clothed them, and sent them forth from the Garden of Eden* (Jubilees 3:26). The restored witness keeps the order of Genesis 3:21 — *Unto Adam also and to his wife did Yahuah Elohim (the LORD God) make coats of skins, and clothed them* — joining the covering directly to the sending-out: clothed first, then driven, the mercy folded into the judgment.'),

    -- THREAD 5: driven out — the flaming sword, the tree of life reopened
    ('canon','genesis',3,24,'canon','revelation',2,7,'free',
      E'*He that hath an ear, let him hear what the Spirit saith unto the churches; To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God)* (Revelation 2:7). The *flaming sword which turned every way, to keep the way of the tree of life* (Genesis 3:24) barred the way; the risen Yahusha (Jesus) reopens it — *to him that overcometh will I give to eat of the tree of life* — Eden lost in Adam, Eden regained in the Overcomer.'),
    ('canon','genesis',3,24,'canon','revelation',22,2,'free',
      E'*In the midst of the street of it, and on either side of the river, was there the tree of life, which bare twelve manner of fruits, and yielded her fruit every month: and the leaves of the tree were for the healing of the nations* (Revelation 22:2). The tree guarded by *Cherubims, and a flaming sword* (Genesis 3:24) stands again at the canon''s end — no sword now, but *the leaves of the tree... for the healing of the nations* — the way to the tree of life thrown open and the curse of Genesis 3 healed.'),
    ('canon','genesis',3,24,'canon','revelation',22,14,'free',
      E'*Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city* (Revelation 22:14). The man driven out lest he *take also of the tree of life, and eat, and live for ever* (Genesis 3:22) is given the way back — *they that do his commandments... have right to the tree of life* — the very commandment the serpent attacked is the door back into the garden.'),
    ('canon','genesis',3,23,'jubilees','jubilees',3,26,'extras',
      E'*And He made for them coats of skin, and clothed them, and sent them forth from the Garden of Eden* (Jubilees 3:26). *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken* (Genesis 3:23) is echoed in the restored book — *sent them forth from the Garden of Eden* — the same expulsion, the covering and the sending bound together.'),
    ('canon','genesis',3,24,'jubilees','jubilees',3,32,'extras',
      E'*And on the new moon of the fourth month, Adam and his wife went forth from the Garden of Eden, and they dwelt in the land of ''Eldâ, in the land of their creation* (Jubilees 3:32). Where Genesis 3:24 says only *So he drove out the man*, Jubilees fixes the going-forth to an appointed day — *the new moon of the fourth month* — placing even the expulsion within Yahuah''s calendar, the times marked from the beginning.'),
    ('canon','genesis',3,24,'jubilees','jubilees',3,28,'extras',
      E'*And on that day was closed the mouth of all beasts, and of cattle, and of birds, and of whatever walks, and of whatever moves, so that they could no longer speak: for they had all spoken one with another with one lip and with one tongue* (Jubilees 3:28). The serpent that *said unto the woman* (Genesis 3:1) had a tongue to speak; the restored witness records that on the day of the driving-out *was closed the mouth of all beasts*, the speaking creation silenced as the garden was sealed behind the cherubim.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s301_ge03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s301_ge03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ============================== threads ==============================
-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-3-yea-hath-elohim-said-the-serpents-foundational-lie',
       E'Yea, hath Elohim said? — the serpent''s foundational lie',
       E'The first words ever spoken against the word of Yahuah are a question: *Now the serpent was more subtil than any beast of the field which Yahuah Elohim (the LORD God) had made. And he said unto the woman, Yea, hath Elohim (God) said, Ye shall not eat of every tree of the garden?* (Genesis 3:1). It is not a request for information; it is the *did Elohim really say?* doubt that loosens the commandment, followed by the flat denial *Ye shall not surely die* (3:4). Sha''ul names the very same method still at work: *But I fear, lest by any means, as the serpent beguiled Eve through his subtilty, so your minds should be corrupted from the simplicity that is in Messiah (Christ)* (2 Corinthians 11:3) — the *subtilty* that corrupts the mind away from the plain truth. And Yahusha (Jesus) traces every such lie to its source: *When he speaketh a lie, he speaketh of his own: for he is a liar, and the father of it* (John 8:44). The foundational lie is the voice that questions whether Yahuah meant what he said.',
       sv.verse_id, ev.verse_id, 'free', 20050
  FROM _s301_ge03_lookup sv, _s301_ge03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=3 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (CENTERPIECE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-3-the-seed-of-the-woman-shall-bruise-the-serpents-head',
       E'The seed of the woman shall bruise the serpent''s head',
       E'This is the headline of the whole canon. To the serpent Yahuah Elohim (the LORD God) declares: *And I will put enmity between thee and the woman, and between thy seed and her seed; it shall bruise thy head, and thou shalt bruise his heel* (Genesis 3:15). The seed-war is instituted here — two seeds, the serpent''s and the woman''s, in lasting enmity, with the woman''s Seed crushing the head and taking a wounded heel in the crushing. *Her seed* is read exactly forward: *when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law* (Galatians 4:4) — the Formed Son drawn into flesh to be that Seed, keeping the Torah the serpent told the woman to doubt. The war''s purpose is stated plainly: *For this purpose the Son of Elohim (God) was manifested, that he might destroy the works of the devil* (1 John 3:8). The foe is named at the canon''s far end as one continuous enemy: *the great dragon... that old serpent, called the Devil, and Satan* (Revelation 12:9), still warring on *the remnant of her seed, which keep the commandments of Elohim (God)* (Revelation 12:17). And the victory is shared with the body: *the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20), the same head-crushing now *under your feet*. Yahusha (Jesus) declares the fall already in motion — *I beheld Satan as lightning fall from heaven* (Luke 10:18) — and hands the heel-on-the-head authority to his sent ones: *Behold, I give unto you power to tread on serpents and scorpions, and over all the power of the enemy* (Luke 10:19). Genesis 3:15 is the seed-promise the whole library grows from: not a moral about snakes, but the war between two seeds that the Seed of the woman wins.',
       sv.verse_id, ev.verse_id, 'free', 20053
  FROM _s301_ge03_lookup sv, _s301_ge03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=3 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-3-cursed-is-the-ground-creation-subjected-and-the-last-adam',
       E'Cursed is the ground — creation subjected, and the last Adam',
       E'Adam''s fall bends the whole creation under it. *Cursed is the ground for thy sake; in sorrow shalt thou eat of it all the days of thy life; thorns also and thistles shall it bring forth to thee* (Genesis 3:17-18), ending in the dust-sentence: *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return* (3:19). Sha''ul reads the cursed ground as the whole creation enslaved, yet never without hope: *For the creature was made subject to vanity, not willingly, but by reason of him who hath subjected the same in hope* (Romans 8:20); *the creature itself also shall be delivered from the bondage of corruption into the glorious liberty of the children of Elohim (God)* (Romans 8:21); *the whole creation groaneth and travaileth in pain together until now* (Romans 8:22) — the thorns and the groan are one. And the dust-sentence is answered by setting Adam against Adam: *as in Adam all die, even so in Messiah (Christ) shall all be made alive* (1 Corinthians 15:22); *the first man Adam was made a living soul; the last Adam was made a quickening spirit* (1 Corinthians 15:45). The ground that took man back to dust is reversed in the last Adam who gives the life back.',
       sv.verse_id, ev.verse_id, 'free', 20056
  FROM _s301_ge03_lookup sv, _s301_ge03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=3 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-3-coats-of-skins-the-first-covering-and-the-robe-of-righteousness',
       E'Coats of skins — the first covering and the robe of righteousness',
       E'When their eyes were opened *they sewed fig leaves together, and made themselves aprons* (Genesis 3:7) — the first self-made covering, and it was not enough. Yahuah himself replaces it: *Unto Adam also and to his wife did Yahuah Elohim (the LORD God) make coats of skins, and clothed them* (Genesis 3:21). A covering that costs a life is given for the naked — the first death to clothe the fallen, a foreshadow of the covering Yahuah always provides. Isaiah sings the fullness of it: *he hath clothed me with the garments of salvation, he hath covered me with the robe of righteousness, as a bridegroom decketh himself with ornaments, and as a bride adorneth herself with her jewels* (Isaiah 61:10) — the self-made apron set aside for the robe of righteousness Yahuah puts on his people. The restored witness keeps the very order, binding the mercy to the judgment: *And He made for them coats of skin, and clothed them, and sent them forth from the Garden of Eden* (Jubilees 3:26) — clothed first, then sent.',
       sv.verse_id, ev.verse_id, 'extras', 20059
  FROM _s301_ge03_lookup sv, _s301_ge03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=3 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'genesis-3-driven-out-the-flaming-sword-and-the-tree-of-life-reopened',
       E'Driven out — the flaming sword and the tree of life reopened',
       E'The chapter ends with the way home barred. *Therefore Yahuah Elohim (the LORD God) sent him forth from the garden of Eden, to till the ground from whence he was taken. So he drove out the man; and he placed at the east of the garden of Eden Cherubims, and a flaming sword which turned every way, to keep the way of the tree of life* (Genesis 3:23-24) — the man kept out *lest he put forth his hand, and take also of the tree of life, and eat, and live for ever* (3:22). What the flaming sword guards, the risen Yahusha (Jesus) reopens: *To him that overcometh will I give to eat of the tree of life, which is in the midst of the paradise of Elohim (God)* (Revelation 2:7). At the canon''s end the tree stands again with no sword before it: *the tree of life... and the leaves of the tree were for the healing of the nations* (Revelation 22:2); and the door back is the very thing the serpent attacked — *Blessed are they that do his commandments, that they may have right to the tree of life, and may enter in through the gates into the city* (Revelation 22:14). The restored book fixes even the expulsion within Yahuah''s appointed times: *And on the new moon of the fourth month, Adam and his wife went forth from the Garden of Eden* (Jubilees 3:32), and records the silencing of the speaking creation as the garden was sealed: *And on that day was closed the mouth of all beasts... so that they could no longer speak: for they had all spoken one with another with one lip and with one tongue* (Jubilees 3:28). Eden lost in Adam; Eden reopened in the Overcomer who keeps the commandments.',
       sv.verse_id, ev.verse_id, 'extras', 20062
  FROM _s301_ge03_lookup sv, _s301_ge03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='genesis' AND ev.chapter_number=3 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- ============================== thread_members ==============================
-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*as the serpent beguiled Eve through his subtilty, so your minds should be corrupted* (2 Corinthians 11:3) — the *subtilty* of Genesis 3:1 still at work, corrupting minds from the simplicity of the truth.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=11 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-yea-hath-elohim-said-the-serpents-foundational-lie'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*he is a liar, and the father of it* (John 8:44) — Yahusha (Jesus) names the source of the *Yea, hath Elohim said?* lie: the father of every lie.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=1
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=44
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-yea-hath-elohim-said-the-serpents-foundational-lie'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (centerpiece)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*made of a woman, made under the law* (Galatians 4:4) — *her seed* (Genesis 3:15) read exactly: the Formed Son drawn into flesh to be the woman''s Seed.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=15
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-the-seed-of-the-woman-shall-bruise-the-serpents-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*that he might destroy the works of the devil* (1 John 3:8) — the purpose of the head-crushing stated plainly.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=15
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-john' AND tv.chapter_number=3 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-the-seed-of-the-woman-shall-bruise-the-serpents-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*that old serpent, called the Devil, and Satan* (Revelation 12:9) — the garden serpent named as one continuous enemy at the canon''s end.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=15
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-the-seed-of-the-woman-shall-bruise-the-serpents-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*war with the remnant of her seed, which keep the commandments of Elohim (God)* (Revelation 12:17) — the seed-war still running, marked by the commandment the serpent first attacked.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=15
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=12 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-the-seed-of-the-woman-shall-bruise-the-serpents-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the Elohim (God) of peace shall bruise Satan under your feet shortly* (Romans 16:20) — the head-crushing of Genesis 3:15 handed to the body.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=15
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=16 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-the-seed-of-the-woman-shall-bruise-the-serpents-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*I beheld Satan as lightning fall from heaven* (Luke 10:18) — the fall already in motion wherever the Seed''s authority advances.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=15
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=10 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-the-seed-of-the-woman-shall-bruise-the-serpents-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*I give unto you power to tread on serpents* (Luke 10:19) — the heel-on-the-head authority extended to the sent ones.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=15
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=10 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-the-seed-of-the-woman-shall-bruise-the-serpents-head'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*the creature was made subject to vanity... in hope* (Romans 8:20) — the cursed ground (Genesis 3:17) read as the whole creation bent under Adam, yet never without hope.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-cursed-is-the-ground-creation-subjected-and-the-last-adam'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*delivered from the bondage of corruption* (Romans 8:21) — the thorns-and-thistles ground (Genesis 3:18) promised its release.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=18
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-cursed-is-the-ground-creation-subjected-and-the-last-adam'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the whole creation groaneth and travaileth* (Romans 8:22) — the dust-sentence (Genesis 3:19) put into the soil and the flesh, the creation groaning ever since.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=19
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-cursed-is-the-ground-creation-subjected-and-the-last-adam'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*as in Adam all die, even so in Messiah (Christ) shall all be made alive* (1 Corinthians 15:22) — the dust-death answered by setting Adam against Adam.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=19
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-cursed-is-the-ground-creation-subjected-and-the-last-adam'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the last Adam was made a quickening spirit* (1 Corinthians 15:45) — the man of dust (Genesis 3:19) reversed by the second Adam who gives life back.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=19
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=45
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-cursed-is-the-ground-creation-subjected-and-the-last-adam'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*he hath covered me with the robe of righteousness* (Isaiah 61:10) — the coats of skins (Genesis 3:21) as the first of Yahuah''s garments of salvation.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=21
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-coats-of-skins-the-first-covering-and-the-robe-of-righteousness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*He made for them coats of skin, and clothed them, and sent them forth* (Jubilees 3:26) — the restored witness keeps the order of Genesis 3:21, clothing bound to the sending.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=21
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-coats-of-skins-the-first-covering-and-the-robe-of-righteousness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*To him that overcometh will I give to eat of the tree of life* (Revelation 2:7) — the flaming sword (Genesis 3:24) reopened by the risen Yahusha (Jesus).'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=24
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-driven-out-the-flaming-sword-and-the-tree-of-life-reopened'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*the leaves of the tree were for the healing of the nations* (Revelation 22:2) — the guarded tree (Genesis 3:24) standing again with no sword and the curse healed.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=24
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-driven-out-the-flaming-sword-and-the-tree-of-life-reopened'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Blessed are they that do his commandments, that they may have right to the tree of life* (Revelation 22:14) — the door back (Genesis 3:22) is the very commandment the serpent attacked.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=24
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-driven-out-the-flaming-sword-and-the-tree-of-life-reopened'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*sent them forth from the Garden of Eden* (Jubilees 3:26) — echoing the expulsion of Genesis 3:23, the covering and the sending bound together.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=23
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-driven-out-the-flaming-sword-and-the-tree-of-life-reopened'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*on the new moon of the fourth month, Adam and his wife went forth from the Garden of Eden* (Jubilees 3:32) — the expulsion of Genesis 3:24 fixed within Yahuah''s appointed times.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=24
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-driven-out-the-flaming-sword-and-the-tree-of-life-reopened'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*was closed the mouth of all beasts... so that they could no longer speak* (Jubilees 3:28) — the speaking serpent of Genesis 3:1 silenced with all creation as the garden was sealed.'
  FROM cross_reference_threads t
  JOIN _s301_ge03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='genesis' AND sv.chapter_number=3 AND sv.verse_number=24
  JOIN _s301_ge03_lookup tv ON tv.edition_slug='jubilees' AND tv.book_slug='jubilees' AND tv.chapter_number=3 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='genesis-3-driven-out-the-flaming-sword-and-the-tree-of-life-reopened'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
