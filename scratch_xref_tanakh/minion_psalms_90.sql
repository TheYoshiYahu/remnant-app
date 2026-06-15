-- ----- fragment: minion_psalms_90.sql (Psalm 90) -----
-- Chapter: Psalm 90 — A KEYSTONE — "A Prayer of Mosheh (Moses) the man of Elohim", the oldest psalm,
-- opening Book IV. The eternity of Elohim set against the frailty of the son of Adam. It opens on the
-- everlasting dwelling place — *Yahuah (Lord), thou hast been our dwelling place in all generations.
-- Before the mountains were brought forth, or ever thou hadst formed the earth and the world, even from
-- everlasting to everlasting, thou art Elohim (God)* (vv.1-2). It sets man''s fleeting span against
-- Yahuah''s timelessness — *Thou turnest man to destruction; and sayest, Return, ye children of men. For
-- a thousand years in thy sight are but as yesterday* (vv.3-4) — the verse 2 Peter quotes (3:8). It
-- weighs mortality under the burden of sin — *Thou hast set our iniquities before thee, our secret sins
-- in the light of thy countenance... The days of our years are threescore years and ten* (vv.8,10). It
-- prays the KEYSTONE prayer — *So teach us to number our days, that we may apply our hearts unto wisdom*
-- (v.12): mortality is the teacher of the heart of wisdom. And it closes pleading that the fleeting work
-- of mortal hands be established by the eternal Elohim — *let the beauty of Yahuah Eloheinu (the LORD our
-- God) be upon us: and establish thou the work of our hands upon us* (v.17).
-- Tag: ps090   Temp view: _s302_ps090_lookup
-- Sort band: base 24225, step 3 -> threads at 24225,24228,24231,24234,24237 (5 threads)
-- Source of EVERY row: 'canon','psalms',90,v
--
-- Psalm 90 coverage:
--   ★★ vv.1-2 (Yahuah, thou hast been our dwelling place in all generations. Before the mountains were
--          brought forth... even from everlasting to everlasting, thou art Elohim)
--        NT:     ★★ Hebrews 1:10-12 (Thou, Lord, in the beginning hast laid the foundation of the earth...
--                they shall perish; but thou remainest... thou art the same), ★★ John 8:58 (Before Abraham
--                was, I am — the Formed Son from everlasting) — THREAD 1
--        Extras: none warranted (the eternity weave is carried cleaner by the psalter + Isaiah + Hebrews)
--        Tanakh: ★ Psalm 102:25-27 (Of old hast thou laid the foundation of the earth... but thou art the
--                same), ★ Deuteronomy 33:27 (The eternal Elohim is thy refuge, and underneath are the
--                everlasting arms), ★ Isaiah 40:28 (El Olam (the everlasting God), Yahuah, the Creator of
--                the ends of the earth), ★ Psalm 93:2 (Thy throne is established of old: thou art from
--                everlasting) — THREAD 1
--   ★★★ vv.3-6 (Thou turnest man to destruction; and sayest, Return, ye children of men. For a thousand
--          years in thy sight are but as yesterday... they are as a sleep... like grass which groweth up)
--        NT:     ★★ 2 Peter 3:8 (one day is with the Lord as a thousand years, and a thousand years as one
--                day — Peter on this very verse), ★ 1 Peter 1:24 (all flesh is as grass... the grass
--                withereth), ★ James 1:10-11 (as the flower of the grass he shall pass away) — THREAD 2
--        Extras: ★ Sirach 18:9-10 (The number of a man''s days at the most are an hundred years... so are
--                a thousand years to the days of eternity), ★ Sirach 17:30 (the son of Adam is not
--                immortal... all men are but earth and ashes) — THREAD 2
--        Tanakh: ★ Genesis 3:19 (dust thou art, and unto dust shalt thou return), ★ Psalm 103:14-15 (he
--                remembereth that we are dust... his days are as grass), ★ Isaiah 40:6-8 (All flesh is
--                grass... but the word of our Elohim shall stand for ever) — THREAD 2
--   ★★ vv.7-11 (we are consumed by thine anger... Thou hast set our iniquities before thee, our secret
--          sins in the light of thy countenance... The days of our years are threescore years and ten)
--        NT:     ★★ Romans 5:12 (by one man sin entered into the world, and death by sin), ★ Hebrews 4:13
--                (all things are naked and opened unto the eyes of him with whom we have to do) — THREAD 3
--        Extras: none warranted (Sirach''s mortality witness gathered into THREAD 2; the sin-and-death
--                weave here is the Genesis-to-Romans canon line)
--        Tanakh: ★ Ecclesiastes 12:7 (the dust return to the earth as it was: and the spirit return unto
--                Elohim who gave it) — THREAD 3
--   ★★★ v.12 (So teach us to number our days, that we may apply our hearts unto wisdom) — THE KEYSTONE
--        NT:     none warranted (the number-our-days prayer is a wisdom-of-the-Tanakh weave)
--        Extras: none warranted (Sirach''s span-of-days held to THREAD 2)
--        Tanakh: ★★ Deuteronomy 32:29 (O that they were wise... that they would consider their latter
--                end), ★ Psalm 39:4 (make me to know mine end... that I may know how frail I am),
--                ★ Ecclesiastes 7:2 (better to go to the house of mourning... for that is the end of all
--                men; and the living will lay it to his heart) — THREAD 4
--   ★ vv.13-17 (Return, O Yahuah... O satisfy us early with thy mercy... let the beauty of Yahuah Eloheinu
--          be upon us: and establish thou the work of our hands upon us)
--        NT:     ★ 1 Corinthians 15:58 (your labour is not in vain in Yahuah) — THREAD 5
--        Extras: none warranted
--        Tanakh: ★ Psalm 27:4 (to behold the beauty of Yahuah, and to enquire in his temple), ★ Psalm
--                102:13 (Thou shalt arise, and have mercy upon Zion: for the set time, is come) — THREAD 5
--
-- Threads (slug — target libraries):
--   1. psalm-90-from-everlasting-to-everlasting-thou-art-elohim — NT (Hebrews 1, John 8) + Tanakh (Psalm 102, Deuteronomy 33, Isaiah 40, Psalm 93) [free]
--      (★★ keystone: the eternity of Elohim before creation, the everlasting dwelling place; the Formed Son from everlasting)
--   2. psalm-90-a-thousand-years-are-but-as-yesterday — NT (2 Peter 3, 1 Peter 1, James 1) + Extras (Sirach 18, Sirach 17) + Tanakh (Genesis 3, Psalm 103, Isaiah 40) [extras]
--      (★★★ the son-of-Adam frailty against Elohim''s timelessness; 2 Peter quotes this verse)
--   3. psalm-90-our-secret-sins-in-the-light-of-thy-countenance — NT (Romans 5, Hebrews 4) + Tanakh (Ecclesiastes 12) [free]
--      (★★ mortality under the weight of sin, the hidden sins exposed)
--   4. psalm-90-so-teach-us-to-number-our-days — Tanakh (Deuteronomy 32, Psalm 39, Ecclesiastes 7) [free]
--      (★★★ THE KEYSTONE: mortality teaches the heart of wisdom — the fear of Yahuah, the Torah-life in light of the end)
--   5. psalm-90-establish-thou-the-work-of-our-hands — NT (1 Corinthians 15) + Tanakh (Psalm 27, Psalm 102) [free]
--      (★ the fleeting work of mortal hands established by the eternal Elohim)
--
-- Framing notes:
--   ★★ THE EVERLASTING DWELLING PLACE (THREAD 1): before the mountains, before the earth was formed, *from
--      everlasting to everlasting, thou art Elohim*. Hebrews sets the foundation-laying on the Lord who
--      *remainest* unchanged (Heb 1:10-12, quoting Ps 102), and John names the Formed Son who is *Before
--      Abraham was, I am* (John 8:58) — Yahuah the everlasting refuge (Deut 33:27), El Olam (Isa 40:28).
--   ★★★ A THOUSAND YEARS AS YESTERDAY (THREAD 2): the son-of-Adam returned to dust (Gen 3:19), grass that
--      withers (Isa 40:6-8 / Ps 103), against the timeless One — 2 Peter 3:8 quotes the verse outright;
--      Sirach 18:10 sings the same (a thousand years to the days of eternity), Sirach 17:30 (the son of
--      Adam is not immortal). NOTE: Sirach quoted as a clean witness, NOT the despair-passages.
--   ★★ OUR SECRET SINS EXPOSED (THREAD 3): the wrath that consumes is the death sin brought — Romans 5:12
--      (by one man sin entered... and death by sin); the secret sins in the light of His countenance =
--      all things naked before His eyes (Heb 4:13); the dust returns, the spirit to Elohim (Eccl 12:7).
--   ★★★ NUMBER OUR DAYS (THREAD 4): the keystone prayer — mortality teaches wisdom; Deut 32:29 (consider
--      the latter end), Ps 39:4 (know mine end), Eccl 7:2 (the house of mourning). Wisdom = the fear of
--      Yahuah, the Torah-life lived in the light of the end.
--   ★ ESTABLISH THE WORK OF OUR HANDS (THREAD 5): the prayer that the labour of fleeting hands not be in
--      vain (1 Cor 15:58) but established by the eternal One; the beauty of Yahuah sought (Ps 27:4); His
--      set time to favour Zion come (Ps 102:13).
--   VERSES WITH NO SEPARATE ADD: none — every verse-block (1-2, 3-6, 7-11, 12, 13-17) carries a thread.
--      The superscription (A Prayer of Mosheh) frames the whole and is woven into THREAD 1''s prose.

CREATE TEMP VIEW _s302_ps090_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): From everlasting to everlasting, thou art Elohim
    ('canon','psalms',90,2,'canon','hebrews',1,10,'free',
      E'*And, Thou, Yahuah (Lord), in the beginning hast laid the foundation of the earth; and the heavens are the works of thine hands: They shall perish; but thou remainest; and they all shall wax old as doth a garment* (Hebrews 1:10-11). *Before the mountains were brought forth, or ever thou hadst formed the earth and the world, even from everlasting to everlasting, thou art Elohim (God)* (Psalm 90:2): the eternity Mosheh confesses is set upon the Formed Son — He laid the foundation of the earth, the heavens are the works of His hands, and while they perish He remains; the One before the mountains is the One who made them.'),
    ('canon','psalms',90,2,'canon','hebrews',1,12,'free',
      E'*And as a vesture shalt thou fold them up, and they shall be changed: but thou art the same, and thy years shall not fail* (Hebrews 1:12). *From everlasting to everlasting, thou art Elohim (God)* (Psalm 90:2): the everlasting changelessness — *thou art the same, and thy years shall not fail* — is the very thing the psalm sings; creation waxes old like a garment, but the Elohim who formed it is from everlasting to everlasting.'),
    ('canon','psalms',90,2,'canon','john',8,58,'free',
      E'*Yahusha (Jesus) said unto them, Verily, verily, I say unto you, Before Abraham was, I am* (John 8:58). *Before the mountains were brought forth... even from everlasting to everlasting, thou art Elohim (God)* (Psalm 90:2): the Formed Son speaks the eternity of the psalm in His own voice — *Before Abraham was, I am* — the One drawn from the Formless who was before the earth was formed, who is from everlasting, and who has a Father.'),
    ('canon','psalms',90,2,'canon','psalms',102,27,'free',
      E'*Of old hast thou laid the foundation of the earth: and the heavens are the work of thy hands. They shall perish, but thou shalt endure... but thou art the same, and thy years shall have no end* (Psalm 102:25-27). *From everlasting to everlasting, thou art Elohim (God)* (Psalm 90:2): the psalter''s twin confession — the foundation laid of old, the heavens that perish, and the Elohim who endures the same, whose years have no end; the eternity Mosheh prayed sung again over Zion.'),
    ('canon','psalms',90,1,'canon','deuteronomy',33,27,'free',
      E'*The eternal Elohim (God) is thy refuge, and underneath are the everlasting arms: and he shall thrust out the enemy from before thee* (Deuteronomy 33:27). *Yahuah (Lord), thou hast been our dwelling place in all generations* (Psalm 90:1): the man of Elohim who prays this psalm is the same Mosheh who blessed Yashar''el (Israel) — the eternal Elohim the dwelling place, the everlasting arms underneath, the refuge in all generations.'),
    ('canon','psalms',90,2,'canon','isaiah',40,28,'free',
      E'*Hast thou not known? hast thou not heard, that El Olam (the everlasting God), Yahuah (LORD), the Creator of the ends of the earth, fainteth not, neither is weary? there is no searching of his understanding* (Isaiah 40:28). *From everlasting to everlasting, thou art Elohim (God)* (Psalm 90:2): Isaiah names Him El Olam, the everlasting Elohim, Creator of the ends of the earth who never faints — the same eternity the psalm confesses, set over against the grass that withers.'),
    ('canon','psalms',90,2,'canon','psalms',93,2,'free',
      E'*Thy throne is established of old: thou art from everlasting* (Psalm 93:2). *From everlasting to everlasting, thou art Elohim (God)* (Psalm 90:2): the throne established of old, the One *from everlasting* — the psalter answers Mosheh''s prayer with the kingship of the eternal Elohim, before the world was stablished.'),

    -- THREAD 2 (★★★): A thousand years are but as yesterday — the frailty of the son of Adam
    ('canon','psalms',90,4,'canon','2-peter',3,8,'free',
      E'*But, beloved, be not ignorant of this one thing, that one day is with Yahuah (Lord) as a thousand years, and a thousand years as one day* (2 Peter 3:8). *For a thousand years in thy sight are but as yesterday when it is past, and as a watch in the night* (Psalm 90:4): Peter quotes this very verse — the timelessness of Yahuah, before whom a thousand years pass as a day; the Father is not slack concerning His promise, for the long delay is no delay in His everlasting sight.'),
    ('canon','psalms',90,3,'canon','genesis',3,19,'free',
      E'*In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return* (Genesis 3:19). *Thou turnest man to destruction; and sayest, Return, ye children of men* (Psalm 90:3): the turning of man back to the dust is the Eden sentence rehearsed — *unto dust shalt thou return* — the son of Adam called back to the ground from which he was taken; the frailty of vv.3-6 is the wage of the fall.'),
    ('canon','psalms',90,5,'canon','psalms',103,15,'free',
      E'*As for man, his days are as grass: as a flower of the field, so he flourisheth. For the wind passeth over it, and it is gone; and the place thereof shall know it no more* (Psalm 103:15-16). *In the morning they are like grass which groweth up. In the morning it flourisheth, and groweth up; in the evening it is cut down, and withereth* (Psalm 90:5-6): the same grass-figure of the son of Adam — flourishing at morning, gone by evening; the dust-frame Yahuah remembers (Psalm 103:14), the flower the wind passes over and the place knows no more.'),
    ('canon','psalms',90,6,'canon','isaiah',40,8,'free',
      E'*The grass withereth, the flower fadeth: but the word of our Elohim (God) shall stand for ever* (Isaiah 40:8). *In the evening it is cut down, and withereth* (Psalm 90:6): the grass that withers is set against the One thing that does not — the word of our Elohim that stands for ever; all flesh is grass, but His word, like His years, has no end.'),
    ('canon','psalms',90,6,'canon','1-peter',1,24,'free',
      E'*For all flesh is as grass, and all the glory of man as the flower of grass. The grass withereth, and the flower thereof falleth away: But the word of Yahuah (Lord) endureth for ever* (1 Peter 1:24-25). *In the morning it flourisheth, and groweth up; in the evening it is cut down, and withereth* (Psalm 90:6): Peter gathers the psalm and Isaiah into one — the flesh is grass that withers, but the word of Yahuah endures for ever; the fleeting son of Adam against the abiding word.'),
    ('canon','psalms',90,5,'canon','james',1,10,'free',
      E'*But the rich, in that he is made low: because as the flower of the grass he shall pass away. For the sun is no sooner risen with a burning heat, but it withereth the grass, and the flower thereof falleth... so also shall the rich man fade away in his ways* (James 1:10-11). *They are as a sleep: in the morning they are like grass which groweth up* (Psalm 90:5): James presses the same figure — the flower of the grass that the sun withers, the rich man that fades; the leveling mortality of every son of Adam, high and low alike.'),
    ('canon','psalms',90,4,'apocrypha','ecclesiasticus',18,10,'extras',
      E'*As a drop of water to the sea, and a gravelstone in comparison of the sand; so are a thousand years to the days of eternity* (Sirach 18:10). *For a thousand years in thy sight are but as yesterday when it is past* (Psalm 90:4): the restored wisdom sings Mosheh''s very thought — a thousand years are but a drop to the sea, a gravelstone to the sand, set against the days of eternity; the span of man is nothing before the everlasting Elohim.'),
    ('canon','psalms',90,3,'apocrypha','ecclesiasticus',17,30,'extras',
      E'*For all things cannot be in men, because the son of Adam is not immortal* (Sirach 17:30). *Thou turnest man to destruction; and sayest, Return, ye children of men* (Psalm 90:3): the wisdom-book names the frailty plainly — the son of Adam is not immortal, all men are but earth and ashes; the very mortality the psalm sets against the timelessness of Yahuah.'),

    -- THREAD 3 (★★): Our secret sins in the light of thy countenance — mortality under sin
    ('canon','psalms',90,7,'canon','romans',5,12,'free',
      E'*Wherefore, as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* (Romans 5:12). *For we are consumed by thine anger, and by thy wrath are we troubled* (Psalm 90:7): the wrath that consumes is the death that sin brought — by one man sin entered and death by sin; the threescore-and-ten cut short (v.10) is the wage of the fall passed upon all the sons of Adam.'),
    ('canon','psalms',90,8,'canon','hebrews',4,13,'free',
      E'*Neither is there any creature that is not manifest in his sight: but all things are naked and opened unto the eyes of him with whom we have to do* (Hebrews 4:13). *Thou hast set our iniquities before thee, our secret sins in the light of thy countenance* (Psalm 90:8): the secret sins are not secret to Him — all things are naked and opened unto His eyes; the hidden iniquity of the son of Adam stands exposed in the light of His countenance.'),
    ('canon','psalms',90,10,'canon','ecclesiastes',12,7,'free',
      E'*Then shall the dust return to the earth as it was: and the spirit shall return unto Elohim (God) who gave it* (Ecclesiastes 12:7). *The days of our years are threescore years and ten... for it is soon cut off, and we fly away* (Psalm 90:10): the flying-away at the end of the short span is the dust returning to the earth and the spirit to Elohim who gave it — the Preacher and the man of Elohim sing the one frail end of every son of Adam.'),

    -- THREAD 4 (★★★): So teach us to number our days — the keystone of wisdom
    ('canon','psalms',90,12,'canon','deuteronomy',32,29,'free',
      E'*O that they were wise, that they understood this, that they would consider their latter end!* (Deuteronomy 32:29). *So teach us to number our days, that we may apply our hearts unto wisdom* (Psalm 90:12): the same Mosheh who sang the Song now prays its lesson — to number our days is to consider the latter end; the wisdom the psalm begs is the very wisdom the Torah laments men will not take, the heart that weighs its mortality and so fears Yahuah.'),
    ('canon','psalms',90,12,'canon','psalms',39,4,'free',
      E'*Yahuah (LORD), make me to know mine end, and the measure of my days, what it is; that I may know how frail I am* (Psalm 39:4). *So teach us to number our days, that we may apply our hearts unto wisdom* (Psalm 90:12): the twin prayer of the psalter — to know mine end, the measure of my days, how frail I am; the numbering of days is the knowledge of the frailty that turns the heart toward wisdom.'),
    ('canon','psalms',90,12,'canon','ecclesiastes',7,2,'free',
      E'*It is better to go to the house of mourning, than to go to the house of feasting: for that is the end of all men; and the living will lay it to his heart* (Ecclesiastes 7:2). *So teach us to number our days, that we may apply our hearts unto wisdom* (Psalm 90:12): the Preacher names the same school — the house of mourning teaches what feasting cannot, for death is the end of all men, and the living lay it to heart; numbering the days is laying the end to the heart and so growing wise.'),

    -- THREAD 5 (★): Establish thou the work of our hands — the eternal Elohim over fleeting labour
    ('canon','psalms',90,17,'canon','1-corinthians',15,58,'free',
      E'*Therefore, my beloved brethren, be ye stedfast, unmoveable, always abounding in the work of Yahuah (Lord), forasmuch as ye know that your labour is not in vain in Yahuah (Lord)* (1 Corinthians 15:58). *And let the beauty of Yahuah Eloheinu (the LORD our God) be upon us: and establish thou the work of our hands upon us; yea, the work of our hands establish thou it* (Psalm 90:17): the prayer that the work of fleeting hands not be lost is answered — the labour done in Yahuah is not in vain; the eternal Elohim establishes what the mortal hand could never make abide.'),
    ('canon','psalms',90,17,'canon','psalms',27,4,'free',
      E'*One thing have I desired of Yahuah (LORD), that will I seek after; that I may dwell in the house of Yahuah (LORD) all the days of my life, to behold the beauty of Yahuah (LORD), and to enquire in his temple* (Psalm 27:4). *And let the beauty of Yahuah Eloheinu (the LORD our God) be upon us* (Psalm 90:17): the beauty of Yahuah Mosheh prays to rest upon his people is the one thing David desired to behold — the loveliness of Yahuah sought above all, the dwelling-place prayer of v.1 come to its fullness.'),
    ('canon','psalms',90,13,'canon','psalms',102,13,'free',
      E'*Thou shalt arise, and have mercy upon Zion: for the time to favour her, yea, the set time, is come* (Psalm 102:13). *Return, O Yahuah (LORD), how long? and let it repent thee concerning thy servants* (Psalm 90:13): the plea *Return, O Yahuah, how long?* is answered in the psalter''s assurance — Thou shalt arise and have mercy upon Zion, the set time to favour her is come; the eternal One who turns man to dust turns also to His servants in mercy.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps090_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps090_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-90-from-everlasting-to-everlasting-thou-art-elohim',
       E'From everlasting to everlasting, thou art Elohim — the eternal dwelling place',
       E'The prayer of Mosheh (Moses) the man of Elohim opens on the eternity of Yahuah and the refuge He has been: *Yahuah (Lord), thou hast been our dwelling place in all generations. Before the mountains were brought forth, or ever thou hadst formed the earth and the world, even from everlasting to everlasting, thou art Elohim (God)* (Psalm 90:1-2). This is the same Mosheh who blessed Yashar''el (Israel): *The eternal Elohim (God) is thy refuge, and underneath are the everlasting arms* (Deuteronomy 33:27). The psalter confesses the same eternity over Zion: *Of old hast thou laid the foundation of the earth: and the heavens are the work of thy hands. They shall perish, but thou shalt endure... but thou art the same, and thy years shall have no end* (Psalm 102:25-27); *Thy throne is established of old: thou art from everlasting* (Psalm 93:2). Isaiah names Him El Olam: *that El Olam (the everlasting God), Yahuah (LORD), the Creator of the ends of the earth, fainteth not, neither is weary* (Isaiah 40:28). And Hebrews sets this very foundation-laying upon the Formed Son: *Thou, Yahuah (Lord), in the beginning hast laid the foundation of the earth... they shall perish; but thou remainest... but thou art the same, and thy years shall not fail* (Hebrews 1:10-12) — the One who speaks His own eternity, *Before Abraham was, I am* (John 8:58). The Formed Son, drawn from the Formless, was before the earth was formed; He has a Father, and He is from everlasting to everlasting.',
       sv.verse_id, ev.verse_id, 'free', 24225
  FROM _s302_ps090_lookup sv, _s302_ps090_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=90 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=90 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-90-a-thousand-years-are-but-as-yesterday',
       E'A thousand years are but as yesterday — the frailty of the son of Adam',
       E'Against the timelessness of Elohim the psalm sets the fleeting span of the son of Adam: *Thou turnest man to destruction; and sayest, Return, ye children of men. For a thousand years in thy sight are but as yesterday when it is past, and as a watch in the night. Thou carriest them away as with a flood; they are as a sleep: in the morning they are like grass which groweth up. In the morning it flourisheth, and groweth up; in the evening it is cut down, and withereth* (Psalm 90:3-6). The turning of man to destruction is the Eden sentence: *dust thou art, and unto dust shalt thou return* (Genesis 3:19). Peter quotes the fourth verse outright: *one day is with Yahuah (Lord) as a thousand years, and a thousand years as one day* (2 Peter 3:8). The grass-figure runs through the canon: *As for man, his days are as grass... the wind passeth over it, and it is gone* (Psalm 103:15-16); *All flesh is grass... the grass withereth, the flower fadeth: but the word of our Elohim (God) shall stand for ever* (Isaiah 40:6-8); *all flesh is as grass... but the word of Yahuah (Lord) endureth for ever* (1 Peter 1:24-25); *as the flower of the grass he shall pass away* (James 1:10-11). The restored wisdom sings the same: *so are a thousand years to the days of eternity* (Sirach 18:10); *the son of Adam is not immortal* (Sirach 17:30). The seed of Adam passes like grass; the everlasting Elohim, and His word, abide.',
       sv.verse_id, ev.verse_id, 'extras', 24228
  FROM _s302_ps090_lookup sv, _s302_ps090_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=90 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=90 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-90-our-secret-sins-in-the-light-of-thy-countenance',
       E'Our secret sins in the light of thy countenance — mortality under the weight of sin',
       E'The psalm weighs why the son of Adam is so short-lived: it is the wrath upon sin. *For we are consumed by thine anger, and by thy wrath are we troubled. Thou hast set our iniquities before thee, our secret sins in the light of thy countenance... The days of our years are threescore years and ten; and if by reason of strength they be fourscore years, yet is their strength labour and sorrow; for it is soon cut off, and we fly away* (Psalm 90:7-10). The consuming wrath is the death sin brought into the world: *as by one man sin entered into the world, and death by sin; and so death passed upon all men, for that all have sinned* (Romans 5:12). The secret sins are not hidden from Him: *all things are naked and opened unto the eyes of him with whom we have to do* (Hebrews 4:13). And the flying-away at the end of the brief span is the dust returning and the spirit going home: *Then shall the dust return to the earth as it was: and the spirit shall return unto Elohim (God) who gave it* (Ecclesiastes 12:7). The mortality of the son of Adam is the wage of sin, lived out under the open eye of the eternal Elohim.',
       sv.verse_id, ev.verse_id, 'free', 24231
  FROM _s302_ps090_lookup sv, _s302_ps090_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=90 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=90 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★★) — THE KEYSTONE
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-90-so-teach-us-to-number-our-days',
       E'So teach us to number our days — that we may apply our hearts unto wisdom',
       E'Out of the weighing of mortality rises the keystone prayer: *So teach us to number our days, that we may apply our hearts unto wisdom* (Psalm 90:12). Mortality is the teacher; the heart that reckons its few days is the heart that grows wise. The same Mosheh who prays it had already sung the lament: *O that they were wise, that they understood this, that they would consider their latter end!* (Deuteronomy 32:29) — to number the days is to consider the latter end. The psalter prays the twin: *Yahuah (LORD), make me to know mine end, and the measure of my days, what it is; that I may know how frail I am* (Psalm 39:4). And the Preacher names the school where it is learned: *It is better to go to the house of mourning, than to go to the house of feasting: for that is the end of all men; and the living will lay it to his heart* (Ecclesiastes 7:2). This wisdom is no abstraction — it is the fear of Yahuah, the Torah-life lived in the light of the end; the brevity of the son of Adam''s days is the very thing that turns the heart to walk in His ways while there is yet time.',
       sv.verse_id, ev.verse_id, 'free', 24234
  FROM _s302_ps090_lookup sv, _s302_ps090_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=90 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=90 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-90-establish-thou-the-work-of-our-hands',
       E'Establish thou the work of our hands — the eternal Elohim over fleeting labour',
       E'The prayer closes pleading that the eternal One turn back to His servants and give their fleeting work an abiding: *Return, O Yahuah (LORD), how long? and let it repent thee concerning thy servants. O satisfy us early with thy mercy; that we may rejoice and be glad all our days... Let thy work appear unto thy servants, and thy glory unto their children. And let the beauty of Yahuah Eloheinu (the LORD our God) be upon us: and establish thou the work of our hands upon us; yea, the work of our hands establish thou it* (Psalm 90:13-17). The plea *Return, O Yahuah, how long?* is met by the psalter''s assurance: *Thou shalt arise, and have mercy upon Zion: for the time to favour her, yea, the set time, is come* (Psalm 102:13). The beauty Mosheh prays to rest upon his people is the one thing David desired to behold: *that I may dwell in the house of Yahuah (LORD)... to behold the beauty of Yahuah (LORD), and to enquire in his temple* (Psalm 27:4). And the prayer that mortal hands not labour in vain is answered: *always abounding in the work of Yahuah (Lord), forasmuch as ye know that your labour is not in vain in Yahuah (Lord)* (1 Corinthians 15:58). What the fleeting hand could never make abide, the everlasting Elohim establishes.',
       sv.verse_id, ev.verse_id, 'free', 24237
  FROM _s302_ps090_lookup sv, _s302_ps090_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=90 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=90 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Thou, Yahuah (Lord), in the beginning hast laid the foundation of the earth... they shall perish; but thou remainest* (Hebrews 1:10-11) — the eternity of 90:2 set upon the Formed Son.'
  FROM cross_reference_threads t
  JOIN _s302_ps090_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=90 AND sv.verse_number=2
  JOIN _s302_ps090_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-90-from-everlasting-to-everlasting-thou-art-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *but thou art the same, and thy years shall not fail* (Hebrews 1:12) — the changeless eternity of 90:2; creation waxes old, the Elohim who formed it does not.'
  FROM cross_reference_threads t
  JOIN _s302_ps090_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=90 AND sv.verse_number=2
  JOIN _s302_ps090_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=1 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-90-from-everlasting-to-everlasting-thou-art-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *Before Abraham was, I am* (John 8:58) — the Formed Son speaks the everlasting-to-everlasting of 90:2 in His own voice; He has a Father.'
  FROM cross_reference_threads t
  JOIN _s302_ps090_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=90 AND sv.verse_number=2
  JOIN _s302_ps090_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=8 AND tv.verse_number=58
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-90-from-everlasting-to-everlasting-thou-art-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Of old hast thou laid the foundation of the earth... but thou art the same, and thy years shall have no end* (Psalm 102:25-27) — the psalter''s twin confession of 90:2.'
  FROM cross_reference_threads t
  JOIN _s302_ps090_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=90 AND sv.verse_number=2
  JOIN _s302_ps090_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=102 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-90-from-everlasting-to-everlasting-thou-art-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *The eternal Elohim (God) is thy refuge, and underneath are the everlasting arms* (Deuteronomy 33:27) — the same Mosheh''s blessing; the eternal Elohim the dwelling place of 90:1.'
  FROM cross_reference_threads t
  JOIN _s302_ps090_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=90 AND sv.verse_number=1
  JOIN _s302_ps090_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=33 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-90-from-everlasting-to-everlasting-thou-art-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *that El Olam (the everlasting God), Yahuah (LORD), the Creator of the ends of the earth, fainteth not* (Isaiah 40:28) — El Olam, the everlasting Elohim of 90:2.'
  FROM cross_reference_threads t
  JOIN _s302_ps090_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=90 AND sv.verse_number=2
  JOIN _s302_ps090_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-90-from-everlasting-to-everlasting-thou-art-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*Thy throne is established of old: thou art from everlasting* (Psalm 93:2) — the kingship of the eternal Elohim of 90:2, from everlasting.'
  FROM cross_reference_threads t
  JOIN _s302_ps090_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=90 AND sv.verse_number=2
  JOIN _s302_ps090_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=93 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-90-from-everlasting-to-everlasting-thou-art-elohim'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *one day is with Yahuah (Lord) as a thousand years, and a thousand years as one day* (2 Peter 3:8) — Peter quotes 90:4; the Father''s timelessness, the delay no delay.'
  FROM cross_reference_threads t
  JOIN _s302_ps090_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=90 AND sv.verse_number=4
  JOIN _s302_ps090_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-90-a-thousand-years-are-but-as-yesterday'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *dust thou art, and unto dust shalt thou return* (Genesis 3:19) — the turning of man to destruction in 90:3 is the Eden sentence; the frailty is the wage of the fall.'
  FROM cross_reference_threads t
  JOIN _s302_ps090_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=90 AND sv.verse_number=3
  JOIN _s302_ps090_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-90-a-thousand-years-are-but-as-yesterday'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*As for man, his days are as grass... the wind passeth over it, and it is gone* (Psalm 103:15-16) — the same grass-figure of the son of Adam as 90:5-6; the dust-frame He remembers.'
  FROM cross_reference_threads t
  JOIN _s302_ps090_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=90 AND sv.verse_number=5
  JOIN _s302_ps090_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-90-a-thousand-years-are-but-as-yesterday'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *The grass withereth, the flower fadeth: but the word of our Elohim (God) shall stand for ever* (Isaiah 40:8) — the withering grass of 90:6 against the abiding word.'
  FROM cross_reference_threads t
  JOIN _s302_ps090_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=90 AND sv.verse_number=6
  JOIN _s302_ps090_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-90-a-thousand-years-are-but-as-yesterday'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *all flesh is as grass... but the word of Yahuah (Lord) endureth for ever* (1 Peter 1:24-25) — Peter gathers psalm and Isaiah; the fleeting son of Adam against the abiding word.'
  FROM cross_reference_threads t
  JOIN _s302_ps090_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=90 AND sv.verse_number=6
  JOIN _s302_ps090_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-90-a-thousand-years-are-but-as-yesterday'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *as the flower of the grass he shall pass away... so also shall the rich man fade away* (James 1:10-11) — the leveling mortality of every son of Adam, as 90:5.'
  FROM cross_reference_threads t
  JOIN _s302_ps090_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=90 AND sv.verse_number=5
  JOIN _s302_ps090_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-90-a-thousand-years-are-but-as-yesterday'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *so are a thousand years to the days of eternity* (Sirach 18:10) — the restored wisdom sings 90:4; the span of man nothing before the everlasting Elohim.'
  FROM cross_reference_threads t
  JOIN _s302_ps090_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=90 AND sv.verse_number=4
  JOIN _s302_ps090_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=18 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-90-a-thousand-years-are-but-as-yesterday'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *the son of Adam is not immortal* (Sirach 17:30) — the wisdom-book names the mortality of 90:3 plainly; all men but earth and ashes.'
  FROM cross_reference_threads t
  JOIN _s302_ps090_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=90 AND sv.verse_number=3
  JOIN _s302_ps090_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=17 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-90-a-thousand-years-are-but-as-yesterday'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *by one man sin entered into the world, and death by sin; and so death passed upon all men* (Romans 5:12) — the consuming wrath of 90:7 is the death sin brought.'
  FROM cross_reference_threads t
  JOIN _s302_ps090_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=90 AND sv.verse_number=7
  JOIN _s302_ps090_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=5 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-90-our-secret-sins-in-the-light-of-thy-countenance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *all things are naked and opened unto the eyes of him with whom we have to do* (Hebrews 4:13) — the secret sins of 90:8 not secret to Him.'
  FROM cross_reference_threads t
  JOIN _s302_ps090_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=90 AND sv.verse_number=8
  JOIN _s302_ps090_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-90-our-secret-sins-in-the-light-of-thy-countenance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the dust return to the earth as it was: and the spirit shall return unto Elohim (God) who gave it* (Ecclesiastes 12:7) — the flying-away of 90:10; the dust home, the spirit to Elohim.'
  FROM cross_reference_threads t
  JOIN _s302_ps090_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=90 AND sv.verse_number=10
  JOIN _s302_ps090_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=12 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-90-our-secret-sins-in-the-light-of-thy-countenance'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★★) — THE KEYSTONE
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *O that they were wise... that they would consider their latter end!* (Deuteronomy 32:29) — the same Mosheh''s Song; to number the days of 90:12 is to consider the latter end.'
  FROM cross_reference_threads t
  JOIN _s302_ps090_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=90 AND sv.verse_number=12
  JOIN _s302_ps090_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-90-so-teach-us-to-number-our-days'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *make me to know mine end, and the measure of my days... that I may know how frail I am* (Psalm 39:4) — the psalter''s twin of 90:12; numbering days is knowing the frailty.'
  FROM cross_reference_threads t
  JOIN _s302_ps090_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=90 AND sv.verse_number=12
  JOIN _s302_ps090_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=39 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-90-so-teach-us-to-number-our-days'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *better to go to the house of mourning... for that is the end of all men; and the living will lay it to his heart* (Ecclesiastes 7:2) — the Preacher''s school of 90:12; lay the end to heart and grow wise.'
  FROM cross_reference_threads t
  JOIN _s302_ps090_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=90 AND sv.verse_number=12
  JOIN _s302_ps090_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=7 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-90-so-teach-us-to-number-our-days'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *always abounding in the work of Yahuah (Lord)... your labour is not in vain in Yahuah (Lord)* (1 Corinthians 15:58) — the prayer of 90:17 answered; the eternal Elohim establishes the fleeting hand''s work.'
  FROM cross_reference_threads t
  JOIN _s302_ps090_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=90 AND sv.verse_number=17
  JOIN _s302_ps090_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=58
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-90-establish-thou-the-work-of-our-hands'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *to behold the beauty of Yahuah (LORD), and to enquire in his temple* (Psalm 27:4) — the beauty of Yahuah of 90:17, the one thing David desired to behold.'
  FROM cross_reference_threads t
  JOIN _s302_ps090_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=90 AND sv.verse_number=17
  JOIN _s302_ps090_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=27 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-90-establish-thou-the-work-of-our-hands'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Thou shalt arise, and have mercy upon Zion: for... the set time, is come* (Psalm 102:13) — the plea Return, O Yahuah, how long? of 90:13 answered; the set time of mercy come.'
  FROM cross_reference_threads t
  JOIN _s302_ps090_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=90 AND sv.verse_number=13
  JOIN _s302_ps090_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=102 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-90-establish-thou-the-work-of-our-hands'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
