-- ----- fragment: minion_psalms_149.sql (Psalm 149) -----
-- Chapter: Psalm 149  | Tag: ps149  | Session: s302  | Sort band base: 25700
-- Temp view: _s302_ps149_lookup
--
-- Psalm 149 coverage:
--   vv.1-3 (new song / congregation of saints / Zion's children praise with timbrel & harp)
--        NT:     Rev 5:9 (the Lamb's new song of the redeemed), Rev 14:3 (the 144,000 new song)
--        Extras: none warranted (the new-song motif is wholly canon-internal; no extras adds weight)
--        Tanakh: Ps 33:3, Ps 96:1, Ps 98:1 (the new-song psalms), Isa 12:6 (Zion's inhabitant shout)
--   v.2  (Yashar'el rejoice in him that made him / children of Zion joyful in their King)
--        NT:     none warranted (Zeph 3:17 carries the Maker-King-rejoices weight more exactly)
--        Extras: none warranted
--        Tanakh: Zeph 3:17 (Yahuah in the midst, the King who rejoices over his people with singing)
--   vv.4-5 (Yahuah taketh pleasure in his people / beautify the meek with salvation / songs on their beds)
--        NT:     Matt 5:5 (the meek inherit the earth)
--        Extras: none warranted
--        Tanakh: Ps 25:9 (the meek guided/taught), Isa 61:1 (good tidings to the meek / beauty for ashes), Job 35:10 (Elohim my maker giveth songs in the night)
--   vv.6-7 (high praises of El in the mouth + a twoedged sword in their hand / execute vengeance)
--        NT:     Heb 4:12 (word sharper than a twoedged sword), Eph 6:17 (sword of the Spirit = the word), Rev 1:16 (twoedged sword out of the mouth), Rev 19:13/19:15 (the Word of Elohim, sword out of his mouth)
--        Extras: none warranted
--        Tanakh: Isa 11:4 (smite the earth with the rod of his mouth)
--   vv.7-9 (vengeance on the heathen / bind kings / execute the judgment written / this honour have all his saints)
--        NT:     1 Cor 6:2 (the saints shall judge the world)
--        Extras: none warranted
--        Tanakh: Deut 32:43 (Yahuah avenges the blood of his servants — vengeance is HIS), Dan 7:22 (judgment given to the saints, the saints possess the kingdom)
--
-- Threads (slug : target libraries):
--   1. psalm-149-the-new-song-in-the-congregation-of-saints            : Tanakh + NT (free)
--   2. psalm-149-rejoice-in-him-that-made-him-the-formed-king          : Tanakh (free)
--   3. psalm-149-he-will-beautify-the-meek-with-salvation              : Tanakh + NT (free)
--   4. psalm-149-the-twoedged-sword-is-the-high-praises-of-el-the-word : Tanakh + NT (free)
--   5. psalm-149-the-judgment-written-this-honour-have-all-his-saints  : Tanakh + NT (free)
--
-- FRAMEWORK NOTES (load-bearing / contested):
--   * The TWOEDGED SWORD (v.6) is framed CAREFULLY per the brief's victims-not-enemies rule.
--     The saints' weapon is named in the SAME breath as the sword: "the high praises of El in
--     their mouth, AND a twoedged sword in their hand." The two are one: the WORD is the sword.
--     Heb 4:12 makes the word itself "sharper than any twoedged sword"; Eph 6:17 names "the
--     sword of the Spirit, which is the word of Elohim"; Rev 1:16 / 19:15 put the sword OUT OF
--     THE MOUTH of the Formed Word; Isa 11:4 smites "with the rod of his mouth." This is the
--     judgment-cry of the seed-war that dismantles the rebel SYSTEMS (kings/nobles bound, the
--     "judgment written" executed) — NEVER a charter for ethnic violence against peoples.
--   * v.2 "him that made him" + "their King" = the FORMED King who has a Father (Christology
--     §4): Yashar'el rejoices in her Maker-King, the visible One; Zeph 3:17 is that King in the
--     midst rejoicing back over his people. Not a co-equal-persons gloss — a Son who is Yahuah
--     and has a Father.
--   * "his people" / "the children of Zion" / "Yashar'el" = the two-house covenant people, the
--     redeemed congregation, not a replacement body (§2). The new song is sung by the redeemed
--     out of every kindred (Rev 5:9) = the scattered houses gathered, not Gentiles supplanting.

CREATE TEMP VIEW _s302_ps149_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- Thread 1: the new song in the congregation of saints (vv.1-3)
    ('canon','psalms',149,1,'canon','psalms',33,3,'free',
     E'*Sing unto him a new song; play skilfully with a loud noise.* (Psalm 33:3). Psalm 149 opens with the same summons — *Sing unto Yahuah (LORD) a new song, and his praise in the congregation of saints* (Psalm 149:1) — the recurring call of the redeemed to a song their old mouths could not sing.'),
    ('canon','psalms',149,1,'canon','psalms',96,1,'free',
     E'*O sing unto Yahuah (LORD) a new song: sing unto Yahuah (LORD), all the earth.* (Psalm 96:1). The new song of Psalm 149 — *Sing unto Yahuah (LORD) a new song* (Psalm 149:1) — is the same new song the whole earth is summoned into when the King reigns.'),
    ('canon','psalms',149,1,'canon','psalms',98,1,'free',
     E'*O sing unto Yahuah (LORD) a new song; for he hath done marvellous things: his right hand, and his holy arm, hath gotten him the victory.* (Psalm 98:1). The new song is always the song of a VICTORY already won; Psalm 149''s *new song... in the congregation of saints* (Psalm 149:1) sings the same triumph of Yahuah''s right hand.'),
    ('canon','psalms',149,2,'canon','isaiah',12,6,'free',
     E'*Cry out and shout, thou inhabitant of Zion: for great is the Holy One of Yashar''el (Israel) in the midst of thee.* (Isaiah 12:6). When Psalm 149 calls *let the children of Zion be joyful in their King* (Psalm 149:2), it sounds Zion''s own shout in Isaiah — the Holy One of Yashar''el dwelling in the midst of his gathered people.'),
    ('canon','psalms',149,1,'canon','revelation',5,9,'free',
     E'*And they sung a new song, saying, Thou art worthy to take the book, and to open the seals thereof: for thou wast slain, and hast redeemed us to Elohim (God) by thy blood out of every kindred, and tongue, and people, and nation;* (Revelation 5:9). The *new song... in the congregation of saints* (Psalm 149:1) finds its end in heaven''s new song — the song of the redeemed who were bought by the blood of the slain Lamb, the scattered houses gathered out of every nation.'),
    ('canon','psalms',149,1,'canon','revelation',14,3,'free',
     E'*And they sung as it were a new song before the throne, and before the four beasts, and the elders: and no man could learn that song but the hundred and forty and four thousand, which were redeemed from the earth.* (Revelation 14:3). Psalm 149''s *new song... in the congregation of saints* (Psalm 149:1) is the song only the redeemed can learn — the 144,000 of the gathered tribes singing what no other mouth can.'),

    -- Thread 2: rejoice in him that made him — the Formed King (v.2)
    ('canon','psalms',149,2,'canon','zephaniah',3,17,'free',
     E'*Yahuah Elohayka (The LORD thy God) in the midst of thee is mighty; he will save, he will rejoice over thee with joy; he will rest in his love, he will joy over thee with singing.* (Zephaniah 3:17). Psalm 149 bids *Yashar''el (Israel) rejoice in him that made him: let the children of Zion be joyful in their King* (Psalm 149:2) — and Zephaniah turns the joy both ways: the Maker-King in the midst of his people rejoices BACK over them with singing. The One they rejoice in is their Maker and their King at once — the Formed King who is Yahuah and has a Father.'),

    -- Thread 3: he will beautify the meek with salvation (vv.4-5)
    ('canon','psalms',149,4,'canon','psalms',25,9,'free',
     E'*The meek will he guide in judgment: and the meek will he teach his way.* (Psalm 25:9). The same meek whom Yahuah guides and teaches are the meek whom Psalm 149 sees adorned — *he will beautify the meek with salvation* (Psalm 149:4).'),
    ('canon','psalms',149,4,'canon','isaiah',61,1,'free',
     E'*The Spirit of Adonai Yahuah (the Lord GOD) is upon me; because Yahuah (LORD) hath anointed me to preach good tidings unto the meek; he hath sent me to bind up the brokenhearted, to proclaim liberty to the captives, and the opening of the prison to them that are bound;* (Isaiah 61:1). When Psalm 149 says *he will beautify the meek with salvation* (Psalm 149:4), Isaiah names the Anointed who carries that good tidings TO the meek — beauty for ashes, the captives freed.'),
    ('canon','psalms',149,4,'canon','matthew',5,5,'free',
     E'*Blessed are the meek: for they shall inherit the earth.* (Matthew 5:5). The promise that *Yahuah (LORD)... will beautify the meek with salvation* (Psalm 149:4) is the same beatitude the Formed Son pronounces — the lowly, not the violent, are the heirs.'),
    ('canon','psalms',149,5,'canon','job',35,10,'free',
     E'*But none saith, Where is Elohim (God) my maker, who giveth songs in the night;* (Job 35:10). Psalm 149''s *let them sing aloud upon their beds* (Psalm 149:5) is exactly the gift Job names — the Maker who gives his saints songs in the night, joy that does not wait for the daylight.'),

    -- Thread 4: the twoedged sword is the high praises of El — the Word (vv.6-7)
    ('canon','psalms',149,6,'canon','hebrews',4,12,'free',
     E'*For the word of Elohim (God) is quick, and powerful, and sharper than any twoedged sword, piercing even to the dividing asunder of soul and spirit, and of the joints and marrow, and is a discerner of the thoughts and intents of the heart.* (Hebrews 4:12). Psalm 149 names the saints'' two weapons in one breath — *the high praises of Elohim (God)... in their mouth, and a twoedged sword in their hand* (Psalm 149:6) — and Hebrews shows they are ONE: the word itself IS the twoedged sword.'),
    ('canon','psalms',149,6,'canon','ephesians',6,17,'free',
     E'*And take the helmet of salvation, and the sword of the Spirit, which is the word of Elohim (God):* (Ephesians 6:17). The *twoedged sword in their hand* (Psalm 149:6), set beside the high praises of El in their mouth, is the sword Paul names plainly — the sword of the Spirit, which is the word of Elohim. The saints'' warfare is fought with the Word.'),
    ('canon','psalms',149,6,'canon','revelation',1,16,'free',
     E'*And he had in his right hand seven stars: and out of his mouth went a sharp twoedged sword: and his countenance was as the sun shineth in his strength.* (Revelation 1:16). The very *twoedged sword* of Psalm 149:6 proceeds OUT OF THE MOUTH of the Formed One — the Word himself wields it as speech, not steel.'),
    ('canon','psalms',149,6,'canon','revelation',19,15,'free',
     E'*And out of his mouth goeth a sharp sword, that with it he should smite the nations: and he shall rule them with a rod of iron: and he treadeth the winepress of the fierceness and wrath of El Shaddai (Almighty God).* (Revelation 19:15). He is named two verses before — *his name is called The Word of Elohim (God)* (Revelation 19:13) — and the sword that smites the nations comes out of his mouth. Psalm 149''s sword in the saints'' hand is the Word''s own sword, the vengeance executed by his speech.'),
    ('canon','psalms',149,7,'canon','isaiah',11,4,'free',
     E'*But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* (Isaiah 11:4). When Psalm 149 sends the saints *To execute vengeance upon the heathen* (Psalm 149:7), it is the Branch''s mode of judgment — smiting with the ROD OF HIS MOUTH, the word, never the carnal blade.'),

    -- Thread 5: the judgment written — this honour have all his saints (vv.7-9)
    ('canon','psalms',149,7,'canon','deuteronomy',32,43,'free',
     E'*Rejoice, O ye nations, with his people: for he will avenge the blood of his servants, and will render vengeance to his adversaries, and will be merciful unto his land, and to his people.* (Deuteronomy 32:43). The *vengeance upon the heathen* of Psalm 149:7 is never the saints'' private grudge — it is HIS vengeance, the avenging of the blood of his servants, the judgment that belongs to Yahuah and is mercy to his people.'),
    ('canon','psalms',149,9,'canon','daniel',7,22,'free',
     E'*Until the Ancient of days came, and judgment was given to the saints of the El Elyon (most High); and the time came that the saints possessed the kingdom.* (Daniel 7:22). Psalm 149''s *To execute upon them the judgment written: this honour have all his saints* (Psalm 149:9) is the very honour Daniel sees granted — judgment given to the saints, the kingdom possessed, after the rebel horn is broken.'),
    ('canon','psalms',149,9,'canon','1-corinthians',6,2,'free',
     E'*Do ye not know that the saints shall judge the world? and if the world shall be judged by you, are ye unworthy to judge the smallest matters?* (1 Corinthians 6:2). The honour of Psalm 149:9 — *To execute upon them the judgment written: this honour have all his saints* — is the dignity Paul presses on the assembly: the saints shall judge the world, so they must surely judge the small things now.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps149_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps149_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== THREADS =====

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-149-the-new-song-in-the-congregation-of-saints',
       E'The new song in the congregation of saints',
       E'Psalm 149 opens with the summons that runs through the whole Psalter: *Sing unto Yahuah (LORD) a new song, and his praise in the congregation of saints* (Psalm 149:1), *Let them praise his name in the dance: let them sing praises unto him with the timbrel and harp* (Psalm 149:3). The new song is never an old tune relearned — it is the song of a victory already won, the song the redeemed could not sing before. *Sing unto him a new song; play skilfully with a loud noise* (Psalm 33:3); *O sing unto Yahuah (LORD) a new song: sing unto Yahuah (LORD), all the earth* (Psalm 96:1); *O sing unto Yahuah (LORD) a new song; for he hath done marvellous things: his right hand, and his holy arm, hath gotten him the victory* (Psalm 98:1). Zion herself takes up the shout: *Cry out and shout, thou inhabitant of Zion: for great is the Holy One of Yashar''el (Israel) in the midst of thee* (Isaiah 12:6) — the same children of Zion who *be joyful in their King* (Psalm 149:2). And the new song does not end on earth. In the throne-room the redeemed sing it: *And they sung a new song, saying, Thou art worthy to take the book... for thou wast slain, and hast redeemed us to Elohim (God) by thy blood out of every kindred, and tongue, and people, and nation* (Revelation 5:9) — the scattered houses bought back and gathered. *And they sung as it were a new song before the throne... and no man could learn that song but the hundred and forty and four thousand, which were redeemed from the earth* (Revelation 14:3). The new song belongs to those who have been bought; the congregation of saints is the gathered, redeemed Yashar''el, singing what no other mouth can learn.',
       sv.verse_id, ev.verse_id, 'free', 25700
  FROM _s302_ps149_lookup sv, _s302_ps149_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=149 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=149 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-149-rejoice-in-him-that-made-him-the-formed-king',
       E'Rejoice in him that made him — the Formed King',
       E'*Let Yashar''el (Israel) rejoice in him that made him: let the children of Zion be joyful in their King* (Psalm 149:2). The One Yashar''el rejoices in is named twice over in a single line — he is *him that made him*, the Maker, AND he is *their King*. This is the Formed King who is Yahuah and has a Father: the visible One who made his people and reigns over them. The joy runs both directions. *Yahuah Elohayka (The LORD thy God) in the midst of thee is mighty; he will save, he will rejoice over thee with joy; he will rest in his love, he will joy over thee with singing* (Zephaniah 3:17). The King in the midst of Zion rejoices BACK over his people with singing — the Maker delighting in the very ones he made and saved. Yashar''el sings to her King; her King sings over her. Not a co-equal-persons gloss laid on the text, but a Son who is the Maker, the King in the midst, who has a Father over him.',
       sv.verse_id, ev.verse_id, 'free', 25701
  FROM _s302_ps149_lookup sv, _s302_ps149_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=149 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=149 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-149-he-will-beautify-the-meek-with-salvation',
       E'He will beautify the meek with salvation',
       E'*For Yahuah (LORD) taketh pleasure in his people: he will beautify the meek with salvation. Let the saints be joyful in glory: let them sing aloud upon their beds* (Psalm 149:4-5). The ones Yahuah adorns are not the mighty but the MEEK — the same meek the whole canon singles out for grace. *The meek will he guide in judgment: and the meek will he teach his way* (Psalm 25:9). The Anointed is sent expressly to them: *the Spirit of Adonai Yahuah (the Lord GOD) is upon me; because Yahuah (LORD) hath anointed me to preach good tidings unto the meek; he hath sent me to bind up the brokenhearted, to proclaim liberty to the captives* (Isaiah 61:1) — beauty for ashes, the meek made beautiful with salvation. The Formed Son seals it on the mount: *Blessed are the meek: for they shall inherit the earth* (Matthew 5:5). The lowly, not the violent, are the heirs. And the joy he gives them is not daylight joy only — *let them sing aloud upon their beds* (Psalm 149:5), for *none saith, Where is Elohim (God) my maker, who giveth songs in the night* (Job 35:10). The Maker gives his saints songs in the darkness.',
       sv.verse_id, ev.verse_id, 'free', 25702
  FROM _s302_ps149_lookup sv, _s302_ps149_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=149 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=149 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-149-the-twoedged-sword-is-the-high-praises-of-el-the-word',
       E'The twoedged sword is the high praises of El — the Word',
       E'*Let the high praises of Elohim (God) be in their mouth, and a twoedged sword in their hand; To execute vengeance upon the heathen, and punishments upon the people* (Psalm 149:6-7). Read carelessly this is a charter for ethnic violence. Read in full, the verse names the saints'' two weapons in one breath — the high praises of El in the MOUTH, and the twoedged sword in the HAND — and the rest of the library shows they are ONE thing. The sword IS the Word. *For the word of Elohim (God) is quick, and powerful, and sharper than any twoedged sword, piercing even to the dividing asunder of soul and spirit... and is a discerner of the thoughts and intents of the heart* (Hebrews 4:12). *Take the helmet of salvation, and the sword of the Spirit, which is the word of Elohim (God)* (Ephesians 6:17). The Formed One wields it as speech, not steel: *out of his mouth went a sharp twoedged sword* (Revelation 1:16); and when he rides to judge, *his name is called The Word of Elohim (God)* (Revelation 19:13) and *out of his mouth goeth a sharp sword, that with it he should smite the nations* (Revelation 19:15). It is the Branch''s own mode of judgment: *he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked* (Isaiah 11:4). The saints'' warfare dismantles the rebel SYSTEMS — it is a judgment-cry, the high praises of El sharpened into a sword, never a license to attack peoples.',
       sv.verse_id, ev.verse_id, 'free', 25703
  FROM _s302_ps149_lookup sv, _s302_ps149_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=149 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=149 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-149-the-judgment-written-this-honour-have-all-his-saints',
       E'The judgment written — this honour have all his saints',
       E'*To bind their kings with chains, and their nobles with fetters of iron; To execute upon them the judgment written: this honour have all his saints* (Psalm 149:8-9). The vengeance is not the saints'' private grudge — it is HIS, *the judgment WRITTEN*, executed at his command and on his timing. *Rejoice, O ye nations, with his people: for he will avenge the blood of his servants, and will render vengeance to his adversaries, and will be merciful unto his land, and to his people* (Deuteronomy 32:43) — vengeance belongs to Yahuah, and it ends in mercy to his people. The honour Psalm 149 grants is the very dignity Daniel sees handed down: *Until the Ancient of days came, and judgment was given to the saints of the El Elyon (most High); and the time came that the saints possessed the kingdom* (Daniel 7:22) — judgment given, the kingdom possessed, after the rebel horn is broken. And Paul presses that same honour on the assembly: *Do ye not know that the saints shall judge the world? and if the world shall be judged by you, are ye unworthy to judge the smallest matters?* (1 Corinthians 6:2). This is the saints'' honour — to share in the judgment written against the rebel powers — never a warrant to take vengeance into their own hands.',
       sv.verse_id, ev.verse_id, 'free', 25704
  FROM _s302_ps149_lookup sv, _s302_ps149_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=149 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=149 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- ===== THREAD MEMBERS =====

-- Thread 1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Sing unto him a new song; play skilfully with a loud noise* (Psalm 33:3) — the same new-song summons.'
  FROM cross_reference_threads t
  JOIN _s302_ps149_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=149 AND sv.verse_number=1
  JOIN _s302_ps149_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=33 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-149-the-new-song-in-the-congregation-of-saints'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*O sing unto Yahuah (LORD) a new song: sing unto Yahuah (LORD), all the earth* (Psalm 96:1) — the whole earth drawn into the new song.'
  FROM cross_reference_threads t
  JOIN _s302_ps149_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=149 AND sv.verse_number=1
  JOIN _s302_ps149_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=96 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-149-the-new-song-in-the-congregation-of-saints'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*O sing unto Yahuah (LORD) a new song; for he hath done marvellous things* (Psalm 98:1) — the new song of a victory already won.'
  FROM cross_reference_threads t
  JOIN _s302_ps149_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=149 AND sv.verse_number=1
  JOIN _s302_ps149_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=98 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-149-the-new-song-in-the-congregation-of-saints'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Cry out and shout, thou inhabitant of Zion: for great is the Holy One of Yashar''el (Israel) in the midst of thee* (Isaiah 12:6) — Zion''s children joyful in their King.'
  FROM cross_reference_threads t
  JOIN _s302_ps149_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=149 AND sv.verse_number=2
  JOIN _s302_ps149_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=12 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-149-the-new-song-in-the-congregation-of-saints'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*And they sung a new song... for thou wast slain, and hast redeemed us to Elohim (God) by thy blood out of every kindred, and tongue, and people, and nation* (Revelation 5:9) — the gathered houses sing the new song of the Lamb.'
  FROM cross_reference_threads t
  JOIN _s302_ps149_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=149 AND sv.verse_number=1
  JOIN _s302_ps149_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-149-the-new-song-in-the-congregation-of-saints'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*And they sung as it were a new song before the throne... and no man could learn that song but the hundred and forty and four thousand, which were redeemed from the earth* (Revelation 14:3) — only the redeemed can learn it.'
  FROM cross_reference_threads t
  JOIN _s302_ps149_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=149 AND sv.verse_number=1
  JOIN _s302_ps149_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=14 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-149-the-new-song-in-the-congregation-of-saints'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Yahuah Elohayka (The LORD thy God) in the midst of thee is mighty... he will joy over thee with singing* (Zephaniah 3:17) — the Maker-King rejoices BACK over his people.'
  FROM cross_reference_threads t
  JOIN _s302_ps149_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=149 AND sv.verse_number=2
  JOIN _s302_ps149_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=3 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-149-rejoice-in-him-that-made-him-the-formed-king'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The meek will he guide in judgment: and the meek will he teach his way* (Psalm 25:9) — the same meek whom Yahuah adorns.'
  FROM cross_reference_threads t
  JOIN _s302_ps149_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=149 AND sv.verse_number=4
  JOIN _s302_ps149_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=25 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-149-he-will-beautify-the-meek-with-salvation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*...he hath anointed me to preach good tidings unto the meek; he hath sent me to bind up the brokenhearted* (Isaiah 61:1) — the Anointed sent to the meek, beauty for ashes.'
  FROM cross_reference_threads t
  JOIN _s302_ps149_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=149 AND sv.verse_number=4
  JOIN _s302_ps149_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=61 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-149-he-will-beautify-the-meek-with-salvation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Blessed are the meek: for they shall inherit the earth* (Matthew 5:5) — the Formed Son seals the meek as heirs.'
  FROM cross_reference_threads t
  JOIN _s302_ps149_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=149 AND sv.verse_number=4
  JOIN _s302_ps149_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-149-he-will-beautify-the-meek-with-salvation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*...Elohim (God) my maker, who giveth songs in the night* (Job 35:10) — the Maker gives songs aloud upon their beds, joy in the dark.'
  FROM cross_reference_threads t
  JOIN _s302_ps149_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=149 AND sv.verse_number=5
  JOIN _s302_ps149_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=35 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-149-he-will-beautify-the-meek-with-salvation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*For the word of Elohim (God) is quick, and powerful, and sharper than any twoedged sword* (Hebrews 4:12) — the Word IS the twoedged sword.'
  FROM cross_reference_threads t
  JOIN _s302_ps149_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=149 AND sv.verse_number=6
  JOIN _s302_ps149_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-149-the-twoedged-sword-is-the-high-praises-of-el-the-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*...the sword of the Spirit, which is the word of Elohim (God)* (Ephesians 6:17) — the saints'' sword named plainly.'
  FROM cross_reference_threads t
  JOIN _s302_ps149_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=149 AND sv.verse_number=6
  JOIN _s302_ps149_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-149-the-twoedged-sword-is-the-high-praises-of-el-the-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*...out of his mouth went a sharp twoedged sword* (Revelation 1:16) — the very sword proceeds from the Formed One''s mouth.'
  FROM cross_reference_threads t
  JOIN _s302_ps149_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=149 AND sv.verse_number=6
  JOIN _s302_ps149_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=1 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-149-the-twoedged-sword-is-the-high-praises-of-el-the-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*...his name is called The Word of Elohim (God)... and out of his mouth goeth a sharp sword, that with it he should smite the nations* (Revelation 19:13,15) — the Word wields the sword as speech.'
  FROM cross_reference_threads t
  JOIN _s302_ps149_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=149 AND sv.verse_number=6
  JOIN _s302_ps149_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-149-the-twoedged-sword-is-the-high-praises-of-el-the-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*...he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked* (Isaiah 11:4) — the Branch judges with the rod of his mouth, never the carnal blade.'
  FROM cross_reference_threads t
  JOIN _s302_ps149_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=149 AND sv.verse_number=7
  JOIN _s302_ps149_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-149-the-twoedged-sword-is-the-high-praises-of-el-the-word'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*...he will avenge the blood of his servants, and will render vengeance to his adversaries, and will be merciful unto his land, and to his people* (Deuteronomy 32:43) — vengeance is HIS, ending in mercy.'
  FROM cross_reference_threads t
  JOIN _s302_ps149_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=149 AND sv.verse_number=7
  JOIN _s302_ps149_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=43
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-149-the-judgment-written-this-honour-have-all-his-saints'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*...judgment was given to the saints of the El Elyon (most High); and the time came that the saints possessed the kingdom* (Daniel 7:22) — the very honour granted to the saints.'
  FROM cross_reference_threads t
  JOIN _s302_ps149_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=149 AND sv.verse_number=9
  JOIN _s302_ps149_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-149-the-judgment-written-this-honour-have-all-his-saints'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Do ye not know that the saints shall judge the world?* (1 Corinthians 6:2) — the saints'' honour pressed on the assembly.'
  FROM cross_reference_threads t
  JOIN _s302_ps149_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=149 AND sv.verse_number=9
  JOIN _s302_ps149_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=6 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-149-the-judgment-written-this-honour-have-all-his-saints'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
