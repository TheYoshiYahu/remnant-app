-- =====================================================================
-- Session 309 — Jeremiah FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session309_jeremiah_cross_references.sql
-- =====================================================================

\echo 'session309 — Jeremiah cross-references starting...'
BEGIN;

-- ----- fragment: minion_jeremiah_1.sql (Jeremiah 1) -----
-- Chapter: Jeremiah 1 — THE CALL OF JEREMIAH. The word of Yahuah comes to the priest's son of Anathoth:
-- *Before I formed thee in the belly I knew thee; and before thou camest forth out of the womb I sanctified
-- thee, and I ordained thee a prophet unto the nations* — foreknown and set apart from the womb. The
-- reluctant child-prophet (*I cannot speak: for I am a child*) is enabled: Yahuah touches his mouth and puts
-- his words there. Two sign-visions: the ROD OF AN ALMOND TREE (the watching, hastening word) and the
-- SEETHING POT toward the north (the boiling judgment out of the north). And the prophet is fortified — a
-- defenced city, an iron pillar, brasen walls — against the whole land: they shall fight but not prevail,
-- for Yahuah is with him to deliver.
-- Tag: jer01   Session: s309   Temp view: _s309_jer01_lookup
-- Sort band: base 34000, step 3 -> threads at 34000, 34003, 34006, 34009 (4 threads)
-- Source of EVERY row: 'canon','jeremiah',1,v
--
-- Jeremiah 1 coverage:
--   v.1-3 (the words of Jeremiah son of Hilkiah of the priests of Anathoth; in the days of Josiah,
--          Jehoiakim, Zedekiah; unto the carrying away of Jerusalem captive)
--        NT:     none warranted (the historical superscription — prophet, lineage, regnal dating)
--        Extras: none warranted
--        Tanakh: none separate (the captivity foretold here is the burden of the whole book; not a row)
--   ★★ v.4-5 (Then the word of Yahuah came unto me... Before I formed thee in the belly I knew thee; and
--          before thou camest forth out of the womb I sanctified thee, and I ordained thee a prophet unto
--          the nations)
--        NT:     ★★ Galatians 1:15 (who separated me from my mother's womb, and called me by his grace),
--                ★ Luke 1:15 (filled with the Ruach HaKodesh, even from his mother's womb) — THREAD 1
--        Extras: none warranted (clean canon-NT-Tanakh foreknowledge weave)
--        Tanakh: ★★ Isaiah 49:1 (Yahuah hath called me from the womb), ★ Isaiah 49:5 (that formed me from
--                the womb to be his servant), ★ Psalm 139:13 (thou hast covered me in my mother's womb),
--                ★ Psalm 139:16 (in thy book all my members were written) — THREAD 1
--   ★ v.6-9 (Ah, Yahuah GOD! I cannot speak: for I am a child... Say not, I am a child... whatsoever I
--          command thee thou shalt speak... I am with thee to deliver thee... Behold, I have put my words
--          in thy mouth)
--        NT:     ★ Matthew 10:19-20 (it shall be given you in that same hour what ye shall speak... it is
--                the Spirit of your Father which speaketh in you) — THREAD 2
--        Extras: none warranted
--        Tanakh: ★★ Exodus 4:10 (I am slow of speech), ★★ Exodus 4:12 (I will be with thy mouth, and teach
--                thee what thou shalt say), ★ Isaiah 6:7 (laid the live coal upon my mouth; thine iniquity
--                is taken away), ★★ Deuteronomy 18:18 (I will put my words in his mouth) — THREAD 2
--   v.10 (See, I have this day set thee over the nations and over the kingdoms, to root out... to build,
--          and to plant)
--        NT:     none warranted distinct (the prophet's commission over nations; woven in THREAD 2 prose)
--        Extras: none warranted
--        Tanakh: none separate (root-out / build-and-plant = the office given; held in prose)
--   ★ v.11-16 (the rod of an almond tree... I will hasten my word to perform it... a seething pot; the face
--          thereof toward the north... Out of the north an evil shall break forth... families of the
--          kingdoms of the north... against all the cities of Yahudah... they have forsaken me)
--        NT:     none warranted (the two sign-visions; the watched word answered in the OT prophets and
--                Isaiah 55 — held to Tanakh)
--        Extras: none warranted
--        Tanakh: ★★ Ezekiel 24:3 (Set on a pot, set it on... — the boiling pot, lateral), ★ Jeremiah 6:1
--                (evil appeareth out of the north), ★ Jeremiah 6:22 (a people cometh from the north
--                country), ★★ Isaiah 55:11 (so shall my word be... it shall not return unto me void) —
--                THREAD 3
--   ★ v.17-19 (gird up thy loins... be not dismayed at their faces... I have made thee this day a defenced
--          city, and an iron pillar, and brasen walls against the whole land... they shall fight against
--          thee; but they shall not prevail against thee; for I am with thee, saith Yahuah, to deliver thee)
--        NT:     ★ Romans 8:31 (If Elohim be for us, who can be against us?), ★ Acts 18:9-10 (Be not
--                afraid... for I am with thee, and no man shall set on thee to hurt thee) — THREAD 4
--        Extras: none warranted
--        Tanakh: ★★ Ezekiel 3:8-9 (I have made thy forehead strong against their foreheads — lateral, the
--                fortified prophet), ★ Isaiah 50:7 (I have set my face like a flint... I shall not be
--                ashamed) — THREAD 4
--
-- Threads (slug — target libraries):
--   1. jeremiah-1-before-i-formed-thee-in-the-belly-i-knew-thee — NT (Galatians 1, Luke 1) + Tanakh (Isaiah 49, Psalm 139) [free]
--      (★★ foreknown and sanctified from the womb; the prophet known and ordained before birth)
--   2. jeremiah-1-behold-i-have-put-my-words-in-thy-mouth — NT (Matthew 10) + Tanakh (Exodus 4, Isaiah 6, Deuteronomy 18) [free]
--      (★ the reluctant child-prophet enabled; Yahuah's word put in his mouth — the word supplied, not self-found)
--   3. jeremiah-1-the-almond-rod-and-the-seething-pot-out-of-the-north — Tanakh (Ezekiel 24, Jeremiah 6, Isaiah 55) [free]
--      (★ the two sign-visions; the watching/hastening word and the boiling pot of northern judgment)
--   4. jeremiah-1-a-defenced-city-an-iron-pillar-they-shall-not-prevail — NT (Romans 8, Acts 18) + Tanakh (Ezekiel 3, Isaiah 50) [free]
--      (★ the prophet fortified against the whole land; they fight but do not prevail, Yahuah with him to deliver)
--
-- Framing notes:
--   ★★ KNOWN AND ORDAINED FROM THE WOMB (THREAD 1): *Then the word of Yahuah (LORD) came unto me, saying,
--      Before I formed thee in the belly I knew thee; and before thou camest forth out of the womb I
--      sanctified thee, and I ordained thee a prophet unto the nations* (Jeremiah 1:4-5). Yahuah's
--      foreknowledge and setting-apart precede birth — known, sanctified, ordained before the womb gave him
--      up. Paul claims the very pattern for his own call: *But when it pleased Elohim (God), who separated me
--      from my mother's womb, and called me by his grace* (Galatians 1:15). Isaiah's Servant says it too:
--      *Yahuah (LORD) hath called me from the womb; from the bowels of my mother hath he made mention of my
--      name* (Isaiah 49:1), *that formed me from the womb to be his servant* (Isaiah 49:5). The psalmist
--      sings the same craftsmanship: *thou hast possessed my reins: thou hast covered me in my mother's
--      womb* (Psalm 139:13), *and in thy book all my members were written* (Psalm 139:16). And John the
--      Immerser is *filled with the Ruach HaKodesh (Holy Spirit), even from his mother's womb* (Luke 1:15).
--      The prophet is not self-appointed; he is known by Yahuah before he is formed.
--   ★ THE WORD PUT IN HIS MOUTH (THREAD 2): the reluctant child draws back — *Ah, Yahuah (Lord) GOD! behold,
--      I cannot speak: for I am a child* (1:6) — and Yahuah overrides the excuse: *Say not, I am a child:
--      for thou shalt go to all that I shall send thee, and whatsoever I command thee thou shalt speak*
--      (1:7), then *put forth his hand, and touched my mouth... Behold, I have put my words in thy mouth*
--      (1:9). This is Moses' very objection and answer: *I am slow of speech, and of a slow tongue* (Exodus
--      4:10) met by *Now therefore go, and I will be with thy mouth, and teach thee what thou shalt say*
--      (Exodus 4:12). It is Isaiah's unclean lips touched by the live coal — *thine iniquity is taken away,
--      and thy sin purged* (Isaiah 6:7). And it is the very promise of the Prophet-like-Moses: *I will...
--      put my words in his mouth; and he shall speak unto them all that I shall command him* (Deuteronomy
--      18:18). The Formed Son tells his sent ones the same: *it shall be given you in that same hour what ye
--      shall speak. For it is not ye that speak, but the Spirit of your Father which speaketh in you*
--      (Matthew 10:19-20). The word is supplied by Yahuah, never self-found.
--   ★ THE WATCHED WORD AND THE BOILING POT (THREAD 3): two sign-visions. *I see a rod of an almond tree...
--      Thou hast well seen: for I will hasten my word to perform it* (1:11-12) — a pun in the Hebrew
--      (shaqed, almond / shoqed, watching): Yahuah watches over his word to perform it. Then *I see a
--      seething pot; and the face thereof is toward the north... Out of the north an evil shall break forth
--      upon all the inhabitants of the land* (1:13-14). Ezekiel is given the same boiling-pot sign against
--      the bloody city — *Set on a pot, set it on, and also pour water into it* (Ezekiel 24:3); Jeremiah
--      himself sounds the northern alarm — *evil appeareth out of the north, and great destruction*
--      (Jeremiah 6:1), *a people cometh from the north country* (Jeremiah 6:22). And the almond-rod's
--      lesson is Isaiah's: *so shall my word be that goeth forth out of my mouth: it shall not return unto
--      me void, but it shall accomplish that which I please* (Isaiah 55:11). The word is watched over to
--      perform it.
--   ★ THE DEFENCED CITY (THREAD 4): the prophet is armoured for the fight — *gird up thy loins... be not
--      dismayed at their faces... I have made thee this day a defenced city, and an iron pillar, and brasen
--      walls against the whole land... And they shall fight against thee; but they shall not prevail against
--      thee; for I am with thee, saith Yahuah (LORD), to deliver thee* (1:17-19). Ezekiel is hardened the
--      same way — *I have made thy face strong against their faces, and thy forehead strong against their
--      foreheads* (Ezekiel 3:8). Isaiah's Servant sets his face like a stone — *therefore have I set my
--      face like a flint, and I know that I shall not be ashamed* (Isaiah 50:7). Paul names the principle —
--      *If Elohim (God) be for us, who can be against us?* (Romans 8:31). And the Formed Son speaks the same
--      defence to Paul that Yahuah spoke to Jeremiah — *Be not afraid, but speak, and hold not thy peace:
--      For I am with thee, and no man shall set on thee to hurt thee* (Acts 18:9-10). Yahuah with him to
--      deliver: the iron pillar does not stand by its own strength.
--   VERSES WITH NO SEPARATE ADD: v.1-3 (the historical superscription — lineage of Anathoth, the regnal
--      dating to the captivity; the carrying-away is the book's burden, not a row), v.10 (the commission
--      over nations to root out and to build — the office given, woven in THREAD 2 prose). All verses are
--      recorded in the coverage checklist above; every meaningful block carries a thread.

CREATE TEMP VIEW _s309_jer01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): Before I formed thee in the belly I knew thee — known and ordained from the womb
    ('canon','jeremiah',1,5,'canon','galatians',1,15,'free',
      E'*But when it pleased Elohim (God), who separated me from my mother''s womb, and called me by his grace* (Galatians 1:15). Paul claims for his own call the very pattern of Jeremiah''s — *Before I formed thee in the belly I knew thee; and before thou camest forth out of the womb I sanctified thee, and I ordained thee a prophet unto the nations* (Jeremiah 1:5). The apostle, like the prophet, is set apart from the womb and called by grace, ordained to the nations before he could choose. The calling precedes the man.'),
    ('canon','jeremiah',1,5,'canon','luke',1,15,'free',
      E'*For he shall be great in the sight of Yahuah (Lord), and shall drink neither wine nor strong drink; and he shall be filled with the Ruach HaKodesh (Holy Spirit), even from his mother''s womb* (Luke 1:15). As Yahuah said *before thou camest forth out of the womb I sanctified thee, and I ordained thee a prophet unto the nations* (Jeremiah 1:5), so John the Immerser is set apart and filled with the Spirit from the womb. The forerunner-prophet, like Jeremiah, is sanctified before birth for his office.'),
    ('canon','jeremiah',1,5,'canon','isaiah',49,1,'free',
      E'*Listen, O isles, unto me; and hearken, ye people, from far; Yahuah (LORD) hath called me from the womb; from the bowels of my mother hath he made mention of my name* (Isaiah 49:1). Isaiah''s Servant speaks Jeremiah''s call before Jeremiah — *Before I formed thee in the belly I knew thee... before thou camest forth out of the womb I sanctified thee* (Jeremiah 1:5): called from the womb, his name named in the bowels of his mother. The one set apart from the womb is named and known before he is born.'),
    ('canon','jeremiah',1,5,'canon','isaiah',49,5,'free',
      E'*And now, saith Yahuah (LORD) that formed me from the womb to be his servant, to bring Jacob again to him* (Isaiah 49:5). The forming and ordaining of Jeremiah — *Before I formed thee in the belly I knew thee... I ordained thee a prophet unto the nations* (Jeremiah 1:5) — is the Servant''s own word: Yahuah *formed me from the womb to be his servant*. The womb is the workshop of Yahuah''s purpose; the servant is shaped for his task before he draws breath.'),
    ('canon','jeremiah',1,5,'canon','psalms',139,13,'free',
      E'*For thou hast possessed my reins: thou hast covered me in my mother''s womb* (Psalm 139:13). The foreknowledge of *Before I formed thee in the belly I knew thee* (Jeremiah 1:5) is the psalmist''s wonder — Yahuah possessed his inward parts and covered him in the womb. The same hand that forms the body in secret knows and sets apart the prophet within it.'),
    ('canon','jeremiah',1,5,'canon','psalms',139,16,'free',
      E'*Thine eyes did see my substance, yet being unperfect; and in thy book all my members were written, which in continuance were fashioned, when as yet there was none of them* (Psalm 139:16). Yahuah''s ordaining of the prophet before the womb gave him up — *before thou camest forth out of the womb I sanctified thee, and I ordained thee a prophet* (Jeremiah 1:5) — is the writing of all his members in Yahuah''s book before any of them were. The life and the calling are written before the man exists.'),

    -- THREAD 2 (★): I cannot speak, I am a child — Behold, I have put my words in thy mouth
    ('canon','jeremiah',1,9,'canon','exodus',4,12,'free',
      E'*Now therefore go, and I will be with thy mouth, and teach thee what thou shalt say* (Exodus 4:12). Yahuah''s answer to the child-prophet — *Then Yahuah (LORD) put forth his hand, and touched my mouth. And Yahuah (LORD) said unto me, Behold, I have put my words in thy mouth* (Jeremiah 1:9) — is the same answer he gave Moses: *I will be with thy mouth, and teach thee what thou shalt say*. The mouth that cannot speak is the mouth Yahuah fills; the word is given, not found.'),
    ('canon','jeremiah',1,6,'canon','exodus',4,10,'free',
      E'*And Moses said unto Yahuah (LORD), O my Lord, I am not eloquent, neither heretofore, nor since thou hast spoken unto thy servant: but I am slow of speech, and of a slow tongue* (Exodus 4:10). Jeremiah''s drawing-back — *Ah, Yahuah (Lord) GOD! behold, I cannot speak: for I am a child* (Jeremiah 1:6) — is Moses'' very objection: *I am slow of speech, and of a slow tongue*. The called one pleads his unfitness; Yahuah answers the unfitness, not the man.'),
    ('canon','jeremiah',1,9,'canon','deuteronomy',18,18,'free',
      E'*I will raise them up a Prophet from among their brethren, like unto thee, and will put my words in his mouth; and he shall speak unto them all that I shall command him* (Deuteronomy 18:18). The touching of Jeremiah''s mouth — *Behold, I have put my words in thy mouth* (Jeremiah 1:9) — is the mark of the true prophet of Yahuah: the words put in the mouth, spoken at command, as the Prophet-like-Moses was promised. The prophet speaks Yahuah''s words, not his own; this is what makes him sent.'),
    ('canon','jeremiah',1,7,'canon','matthew',10,19,'free',
      E'*But when they deliver you up, take no thought how or what ye shall speak: for it shall be given you in that same hour what ye shall speak* (Matthew 10:19). Yahuah''s charge *thou shalt go to all that I shall send thee, and whatsoever I command thee thou shalt speak* (Jeremiah 1:7) is the Formed Son''s promise to his sent ones — the speech *shall be given you in that same hour*. The one sent does not provide his own words; they are given when needed.'),
    ('canon','jeremiah',1,9,'canon','matthew',10,20,'free',
      E'*For it is not ye that speak, but the Spirit of your Father which speaketh in you* (Matthew 10:20). The word put in Jeremiah''s mouth — *Behold, I have put my words in thy mouth* (Jeremiah 1:9) — is the very thing the Formed Son names: *it is not ye that speak, but the Spirit of your Father which speaketh in you*. The prophet''s mouth is the channel; the speaker is Yahuah himself by his Spirit.'),
    ('canon','jeremiah',1,9,'canon','isaiah',6,7,'free',
      E'*And he laid it upon my mouth, and said, Lo, this hath touched thy lips; and thine iniquity is taken away, and thy sin purged* (Isaiah 6:7). As Yahuah *touched my mouth* and put his words there (Jeremiah 1:9), so the seraph lays the live coal on Isaiah''s lips — the unclean mouth made fit to speak Yahuah''s word. The prophet''s mouth is touched and prepared by Yahuah before it is sent.'),

    -- THREAD 3 (★): the rod of an almond tree and the seething pot toward the north
    ('canon','jeremiah',1,13,'canon','ezekiel',24,3,'free',
      E'*And utter a parable unto the rebellious house, and say unto them, Thus saith Adonai Yahuah (the Lord GOD); Set on a pot, set it on, and also pour water into it* (Ezekiel 24:3). Jeremiah''s sign of *a seething pot; and the face thereof is toward the north* (Jeremiah 1:13) is matched in Ezekiel''s boiling-pot parable against the bloody city — *Set on a pot, set it on*. The same image of the seething cauldron carries the same verdict: the city set on the fire of judgment.'),
    ('canon','jeremiah',1,14,'canon','jeremiah',6,1,'free',
      E'*O ye children of Benjamin, gather yourselves to flee out of the midst of Jerusalem, and blow the trumpet in Tekoa, and set up a sign of fire in Beth-haccerem: for evil appeareth out of the north, and great destruction* (Jeremiah 6:1). The word given here — *Out of the north an evil shall break forth upon all the inhabitants of the land* (Jeremiah 1:14) — Jeremiah sounds again as alarm: *evil appeareth out of the north, and great destruction*. The northern judgment of the seething pot is the burden he must cry through the book.'),
    ('canon','jeremiah',1,14,'canon','jeremiah',6,22,'free',
      E'*Thus saith Yahuah (LORD), Behold, a people cometh from the north country, and a great nation shall be raised from the sides of the earth* (Jeremiah 6:22). The pot whose face is *toward the north* (Jeremiah 1:13) and the evil that breaks *out of the north* (Jeremiah 1:14) take shape as *a people cometh from the north country, and a great nation*. The sign-vision is the invading foe Yahuah calls from the north against Yahudah (Judah).'),
    ('canon','jeremiah',1,12,'canon','isaiah',55,11,'free',
      E'*So shall my word be that goeth forth out of my mouth: it shall not return unto me void, but it shall accomplish that which I please, and it shall prosper in the thing whereto I sent it* (Isaiah 55:11). The almond-rod sign means just this — *Thou hast well seen: for I will hasten my word to perform it* (Jeremiah 1:12): Yahuah watches over his word to bring it to pass. Isaiah names the same certainty: the word *shall not return unto me void, but it shall accomplish that which I please*. The watched word is the performed word.'),

    -- THREAD 4 (★): a defenced city, an iron pillar — they shall not prevail; I am with thee to deliver
    ('canon','jeremiah',1,19,'canon','romans',8,31,'free',
      E'*What shall we then say to these things? If Elohim (God) be for us, who can be against us?* (Romans 8:31). The promise *they shall fight against thee; but they shall not prevail against thee; for I am with thee, saith Yahuah (LORD), to deliver thee* (Jeremiah 1:19) is the principle Paul names: with Yahuah for him, no adversary prevails. The whole land may fight the prophet, but the One who is with him to deliver makes them unable to prevail.'),
    ('canon','jeremiah',1,8,'canon','acts',18,9,'free',
      E'*Then spake Yahuah (Lord) to Paul in the night by a vision, Be not afraid, but speak, and hold not thy peace* (Acts 18:9). The charge to the prophet — *Be not afraid of their faces: for I am with thee to deliver thee, saith Yahuah (LORD)* (Jeremiah 1:8) — is the same word the Formed Son speaks to Paul: *Be not afraid, but speak, and hold not thy peace*. The fear is forbidden because Yahuah himself stands with the one he sends.'),
    ('canon','jeremiah',1,19,'canon','acts',18,10,'free',
      E'*For I am with thee, and no man shall set on thee to hurt thee: for I have much people in this city* (Acts 18:10). Yahuah''s pledge *for I am with thee, saith Yahuah (LORD), to deliver thee* (Jeremiah 1:19) is the very assurance given Paul — *I am with thee, and no man shall set on thee to hurt thee*. The defenced city, the iron pillar, the brasen walls stand because the One with him keeps the enemy from prevailing.'),
    ('canon','jeremiah',1,18,'canon','ezekiel',3,8,'free',
      E'*Behold, I have made thy face strong against their faces, and thy forehead strong against their foreheads* (Ezekiel 3:8). As Yahuah made Jeremiah *a defenced city, and an iron pillar, and brasen walls against the whole land* (Jeremiah 1:18), so he hardens Ezekiel — *I have made thy face strong against their faces*. The prophet sent to a rebellious people is fortified by Yahuah against their opposition, not left to his own strength.'),
    ('canon','jeremiah',1,18,'canon','isaiah',50,7,'free',
      E'*For Adonai Yahuah (the Lord GOD) will help me; therefore shall I not be confounded: therefore have I set my face like a flint, and I know that I shall not be ashamed* (Isaiah 50:7). The iron pillar and brasen walls of Jeremiah 1:18 are Isaiah''s Servant setting *my face like a flint* — unshaken before the smiters because *Adonai Yahuah will help me*. The fortified face of the prophet is the confidence of the helped one, who shall not be ashamed.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s309_jer01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s309_jer01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-1-before-i-formed-thee-in-the-belly-i-knew-thee',
       E'Before I formed thee in the belly I knew thee — sanctified and ordained from the womb',
       E'The word of Yahuah comes to the young man of Anathoth with a staggering claim about his beginning: *Then the word of Yahuah (LORD) came unto me, saying, Before I formed thee in the belly I knew thee; and before thou camest forth out of the womb I sanctified thee, and I ordained thee a prophet unto the nations* (Jeremiah 1:4-5). Foreknown, set apart, and ordained — all before the womb gave him up. The calling does not begin with the man; it precedes him. Paul claims the same pattern for his own apostleship: *But when it pleased Elohim (God), who separated me from my mother''s womb, and called me by his grace* (Galatians 1:15) — separated from the womb, called by grace, sent to the nations as Jeremiah was. Isaiah''s Servant speaks it before either of them: *Yahuah (LORD) hath called me from the womb; from the bowels of my mother hath he made mention of my name* (Isaiah 49:1), and again, *Yahuah (LORD) that formed me from the womb to be his servant* (Isaiah 49:5) — the womb is the workshop where Yahuah shapes the one he has already named. The psalmist marvels at the same secret craftsmanship: *For thou hast possessed my reins: thou hast covered me in my mother''s womb* (Psalm 139:13), *and in thy book all my members were written, which in continuance were fashioned, when as yet there was none of them* (Psalm 139:16) — the life and the calling written before the man exists. And John the Immerser, the last of this line of womb-set prophets, is *filled with the Ruach HaKodesh (Holy Spirit), even from his mother''s womb* (Luke 1:15). The prophet is never self-appointed: he is known by Yahuah before he is formed, sanctified before he is born, ordained before he can answer.',
       sv.verse_id, ev.verse_id, 'free', 34000
  FROM _s309_jer01_lookup sv, _s309_jer01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=1 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=1 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-1-behold-i-have-put-my-words-in-thy-mouth',
       E'I cannot speak, for I am a child — Behold, I have put my words in thy mouth',
       E'The called prophet draws back at his own unfitness: *Then said I, Ah, Yahuah (Lord) GOD! behold, I cannot speak: for I am a child* (Jeremiah 1:6). Yahuah does not argue with the excuse — he overrides it: *Say not, I am a child: for thou shalt go to all that I shall send thee, and whatsoever I command thee thou shalt speak* (1:7), *Be not afraid of their faces: for I am with thee to deliver thee* (1:8). Then comes the enabling act: *Then Yahuah (LORD) put forth his hand, and touched my mouth. And Yahuah (LORD) said unto me, Behold, I have put my words in thy mouth* (1:9). This is Moses'' very objection and Yahuah''s very answer: *I am not eloquent... but I am slow of speech, and of a slow tongue* (Exodus 4:10), met by *Now therefore go, and I will be with thy mouth, and teach thee what thou shalt say* (Exodus 4:12). It is Isaiah''s unclean lips touched by the live coal: *he laid it upon my mouth, and said, Lo, this hath touched thy lips; and thine iniquity is taken away* (Isaiah 6:7). And it is the very signature of the true Prophet-like-Moses: *I will... put my words in his mouth; and he shall speak unto them all that I shall command him* (Deuteronomy 18:18). The Formed Son tells his own sent ones the same when they are dragged before rulers: *take no thought how or what ye shall speak: for it shall be given you in that same hour what ye shall speak. For it is not ye that speak, but the Spirit of your Father which speaketh in you* (Matthew 10:19-20). The prophet''s mouth is the channel; the speaker is Yahuah himself. The word is supplied, never self-found — and the child who cannot speak is made to speak to nations and kingdoms (1:10).',
       sv.verse_id, ev.verse_id, 'free', 34003
  FROM _s309_jer01_lookup sv, _s309_jer01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=1 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=1 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-1-the-almond-rod-and-the-seething-pot-out-of-the-north',
       E'The rod of an almond tree and the seething pot — the watched word, the evil out of the north',
       E'Two sign-visions seal the call. First the almond rod: *Moreover the word of Yahuah (LORD) came unto me, saying, Jeremiah, what seest thou? And I said, I see a rod of an almond tree. Then said Yahuah (LORD) unto me, Thou hast well seen: for I will hasten my word to perform it* (Jeremiah 1:11-12). The almond (shaqed) is the watcher (shoqed): Yahuah is awake over his word, hastening to perform it. Isaiah names the same certainty — *So shall my word be that goeth forth out of my mouth: it shall not return unto me void, but it shall accomplish that which I please, and it shall prosper in the thing whereto I sent it* (Isaiah 55:11): the watched word is the performed word. Then the second vision, the verdict: *I see a seething pot; and the face thereof is toward the north... Out of the north an evil shall break forth upon all the inhabitants of the land* (Jeremiah 1:13-14), *For, lo, I will call all the families of the kingdoms of the north... against all the cities of Yahudah (Judah)* (1:15), because *they have forsaken me, and have burned incense unto other gods* (1:16). Ezekiel is given the same boiling-pot sign against the bloody city: *Set on a pot, set it on, and also pour water into it* (Ezekiel 24:3). And Jeremiah himself must sound the northern alarm again and again: *evil appeareth out of the north, and great destruction* (Jeremiah 6:1), *Behold, a people cometh from the north country, and a great nation shall be raised from the sides of the earth* (Jeremiah 6:22). The two visions are one message: the word Yahuah watches over to perform is the word of the judgment now boiling over from the north.',
       sv.verse_id, ev.verse_id, 'free', 34006
  FROM _s309_jer01_lookup sv, _s309_jer01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=1 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=1 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-1-a-defenced-city-an-iron-pillar-they-shall-not-prevail',
       E'A defenced city, an iron pillar, brasen walls — they shall fight but not prevail',
       E'The call closes with the prophet armoured for the conflict ahead: *Thou therefore gird up thy loins, and arise, and speak unto them all that I command thee: be not dismayed at their faces, lest I confound thee before them. For, behold, I have made thee this day a defenced city, and an iron pillar, and brasen walls against the whole land, against the kings of Yahudah (Judah), against the princes thereof, against the priests thereof, and against the people of the land* (Jeremiah 1:17-18). The whole land will turn on him — kings, princes, priests, people — and Yahuah makes him a walled city to stand against it. The pledge is unconditional: *And they shall fight against thee; but they shall not prevail against thee; for I am with thee, saith Yahuah (LORD), to deliver thee* (1:19). Ezekiel is hardened the same way for the same rebellious house: *Behold, I have made thy face strong against their faces, and thy forehead strong against their foreheads* (Ezekiel 3:8). Isaiah''s Servant sets his face like stone before the smiters: *therefore have I set my face like a flint, and I know that I shall not be ashamed* (Isaiah 50:7) — because *Adonai Yahuah (the Lord GOD) will help me*. Paul names the principle plainly: *If Elohim (God) be for us, who can be against us?* (Romans 8:31). And the Formed Son speaks to Paul almost word for word what Yahuah spoke to Jeremiah: *Be not afraid, but speak, and hold not thy peace: For I am with thee, and no man shall set on thee to hurt thee* (Acts 18:9-10). The iron pillar does not stand by its own iron; it stands because the One who set it there is with it to deliver.',
       sv.verse_id, ev.verse_id, 'free', 34009
  FROM _s309_jer01_lookup sv, _s309_jer01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=1 AND sv.verse_number=17
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=1 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *who separated me from my mother''s womb, and called me by his grace* (Galatians 1:15) — Paul claims Jeremiah''s very pattern (1:5); the apostle set apart from the womb, ordained to the nations.'
  FROM cross_reference_threads t
  JOIN _s309_jer01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=1 AND sv.verse_number=5
  JOIN _s309_jer01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=1 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-1-before-i-formed-thee-in-the-belly-i-knew-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Yahuah (LORD) hath called me from the womb; from the bowels of my mother hath he made mention of my name* (Isaiah 49:1) — the Servant called and named from the womb, as Jeremiah was sanctified before birth (1:5).'
  FROM cross_reference_threads t
  JOIN _s309_jer01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=1 AND sv.verse_number=5
  JOIN _s309_jer01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-1-before-i-formed-thee-in-the-belly-i-knew-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Yahuah (LORD) that formed me from the womb to be his servant* (Isaiah 49:5) — the forming of the prophet (1:5) is the Servant''s own word; the womb is the workshop of Yahuah''s purpose.'
  FROM cross_reference_threads t
  JOIN _s309_jer01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=1 AND sv.verse_number=5
  JOIN _s309_jer01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-1-before-i-formed-thee-in-the-belly-i-knew-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *thou hast possessed my reins: thou hast covered me in my mother''s womb* (Psalm 139:13) — the foreknowledge of *I knew thee* (1:5) is the psalmist''s wonder; the hand that forms in secret knows the prophet within.'
  FROM cross_reference_threads t
  JOIN _s309_jer01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=1 AND sv.verse_number=5
  JOIN _s309_jer01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-1-before-i-formed-thee-in-the-belly-i-knew-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *in thy book all my members were written... when as yet there was none of them* (Psalm 139:16) — the ordaining before the womb (1:5) is the life written in Yahuah''s book before the man exists.'
  FROM cross_reference_threads t
  JOIN _s309_jer01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=1 AND sv.verse_number=5
  JOIN _s309_jer01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-1-before-i-formed-thee-in-the-belly-i-knew-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *filled with the Ruach HaKodesh (Holy Spirit), even from his mother''s womb* (Luke 1:15) — John the Immerser, like Jeremiah (1:5), set apart and filled from the womb for his prophetic office.'
  FROM cross_reference_threads t
  JOIN _s309_jer01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=1 AND sv.verse_number=5
  JOIN _s309_jer01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-1-before-i-formed-thee-in-the-belly-i-knew-thee'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *I will be with thy mouth, and teach thee what thou shalt say* (Exodus 4:12) — Yahuah''s answer to Moses is his answer to Jeremiah: *I have put my words in thy mouth* (1:9); the word is given, not found.'
  FROM cross_reference_threads t
  JOIN _s309_jer01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=1 AND sv.verse_number=9
  JOIN _s309_jer01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=4 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-1-behold-i-have-put-my-words-in-thy-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *I am slow of speech, and of a slow tongue* (Exodus 4:10) — Moses'' objection is Jeremiah''s *I cannot speak: for I am a child* (1:6); Yahuah answers the unfitness, not the man.'
  FROM cross_reference_threads t
  JOIN _s309_jer01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=1 AND sv.verse_number=6
  JOIN _s309_jer01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=4 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-1-behold-i-have-put-my-words-in-thy-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *I will... put my words in his mouth; and he shall speak... all that I shall command him* (Deuteronomy 18:18) — the touched mouth (1:9) is the mark of the true prophet of Yahuah; he speaks Yahuah''s words, not his own.'
  FROM cross_reference_threads t
  JOIN _s309_jer01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=1 AND sv.verse_number=9
  JOIN _s309_jer01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-1-behold-i-have-put-my-words-in-thy-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *it shall be given you in that same hour what ye shall speak* (Matthew 10:19) — the Formed Son''s promise to the sent matches *whatsoever I command thee thou shalt speak* (1:7); the speech is given when needed.'
  FROM cross_reference_threads t
  JOIN _s309_jer01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s309_jer01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-1-behold-i-have-put-my-words-in-thy-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *it is not ye that speak, but the Spirit of your Father which speaketh in you* (Matthew 10:20) — the words put in the prophet''s mouth (1:9) are Yahuah''s own Spirit speaking through him.'
  FROM cross_reference_threads t
  JOIN _s309_jer01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=1 AND sv.verse_number=9
  JOIN _s309_jer01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-1-behold-i-have-put-my-words-in-thy-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *he laid it upon my mouth... thine iniquity is taken away, and thy sin purged* (Isaiah 6:7) — the live coal on Isaiah''s lips, like Yahuah touching Jeremiah''s mouth (1:9); the mouth prepared before it is sent.'
  FROM cross_reference_threads t
  JOIN _s309_jer01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=1 AND sv.verse_number=9
  JOIN _s309_jer01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-1-behold-i-have-put-my-words-in-thy-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *I will hasten my word to perform it* (Jeremiah 1:12) answered in *my word... shall not return unto me void, but it shall accomplish that which I please* (Isaiah 55:11) — the almond-rod watched word is the performed word.'
  FROM cross_reference_threads t
  JOIN _s309_jer01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=1 AND sv.verse_number=12
  JOIN _s309_jer01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-1-the-almond-rod-and-the-seething-pot-out-of-the-north'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Set on a pot, set it on, and also pour water into it* (Ezekiel 24:3) — Ezekiel''s boiling-pot parable matches Jeremiah''s *seething pot... toward the north* (1:13); the cauldron of judgment on the city.'
  FROM cross_reference_threads t
  JOIN _s309_jer01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=1 AND sv.verse_number=13
  JOIN _s309_jer01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=24 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-1-the-almond-rod-and-the-seething-pot-out-of-the-north'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *evil appeareth out of the north, and great destruction* (Jeremiah 6:1) — the evil that breaks *out of the north* (1:14) sounded again as alarm; the northern judgment is the book''s burden.'
  FROM cross_reference_threads t
  JOIN _s309_jer01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=1 AND sv.verse_number=14
  JOIN _s309_jer01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=6 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-1-the-almond-rod-and-the-seething-pot-out-of-the-north'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *a people cometh from the north country, and a great nation* (Jeremiah 6:22) — the pot *toward the north* (1:13) takes shape as the invading foe Yahuah calls from the north against Yahudah (Judah).'
  FROM cross_reference_threads t
  JOIN _s309_jer01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=1 AND sv.verse_number=14
  JOIN _s309_jer01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=6 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-1-the-almond-rod-and-the-seething-pot-out-of-the-north'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *If Elohim (God) be for us, who can be against us?* (Romans 8:31) — the principle of *they shall not prevail against thee; for I am with thee... to deliver thee* (1:19); with Yahuah for him, no adversary prevails.'
  FROM cross_reference_threads t
  JOIN _s309_jer01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=1 AND sv.verse_number=19
  JOIN _s309_jer01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-1-a-defenced-city-an-iron-pillar-they-shall-not-prevail'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Be not afraid, but speak, and hold not thy peace* (Acts 18:9) — the Formed Son speaks to Paul the very charge given Jeremiah: *Be not afraid of their faces: for I am with thee* (1:8).'
  FROM cross_reference_threads t
  JOIN _s309_jer01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=1 AND sv.verse_number=8
  JOIN _s309_jer01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=18 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-1-a-defenced-city-an-iron-pillar-they-shall-not-prevail'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *I am with thee, and no man shall set on thee to hurt thee* (Acts 18:10) — the same pledge as *I am with thee... to deliver thee* (1:19); the walls stand because the One with him keeps the enemy from prevailing.'
  FROM cross_reference_threads t
  JOIN _s309_jer01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=1 AND sv.verse_number=19
  JOIN _s309_jer01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=18 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-1-a-defenced-city-an-iron-pillar-they-shall-not-prevail'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *I have made thy face strong against their faces, and thy forehead strong against their foreheads* (Ezekiel 3:8) — Ezekiel hardened as Jeremiah was made *a defenced city... and brasen walls* (1:18); the prophet fortified by Yahuah.'
  FROM cross_reference_threads t
  JOIN _s309_jer01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=1 AND sv.verse_number=18
  JOIN _s309_jer01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=3 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-1-a-defenced-city-an-iron-pillar-they-shall-not-prevail'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *I have set my face like a flint, and I know that I shall not be ashamed* (Isaiah 50:7) — the iron pillar of 1:18 is the Servant''s flint-set face; fortified because *Adonai Yahuah (the Lord GOD) will help me*.'
  FROM cross_reference_threads t
  JOIN _s309_jer01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=1 AND sv.verse_number=18
  JOIN _s309_jer01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=50 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-1-a-defenced-city-an-iron-pillar-they-shall-not-prevail'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jeremiah_7.sql (Jeremiah 7) -----
-- Chapter: Jeremiah 7 — THE TEMPLE SERMON. Standing in the gate of the LORD'S house, Jeremiah tears down
-- the false trust in the building: *Trust ye not in lying words, The temple of Yahuah, The temple of
-- Yahuah, The temple of Yahuah, are these* (7:4). The standard is OBEDIENCE to the covenant, not the
-- talisman of the temple nor empty sacrifice: amend your ways; do not break the Decalogue then hide in
-- the house called by my name (the *den of robbers*); *Obey my voice* — not burnt offerings as a bribe;
-- and the idolatry Yahuah never commanded (the *queen of heaven*; child-sacrifice at Tophet). The whole
-- chapter is the framework's bedrock: the covenant is kept by a hearing heart and a doing life, never by
-- ritual that covers sin — and the Torah's offerings were never meant as a substitute for obedience, NOT
-- that they are abolished.
-- Tag: jer07   Session: s309   Temp view: _s309_jer07_lookup
-- Sort band: base 34150, step 3 -> 34150, 34153, 34156, 34159 (4 threads)
-- Source of EVERY row: 'canon','jeremiah',7,v
--
-- Jeremiah 7 coverage:
--   v.1-2 (Stand in the gate of the LORD'S house... Hear the word of Yahuah, all ye of Yahudah)
--        NT: none warranted (the sermon preface) | Extras: none warranted | Tanakh: none separate (woven THREAD 1)
--   ★★ v.3-8 (Amend your ways... Trust ye not in lying words, The temple of Yahuah... then will I cause you
--          to dwell in this place... ye trust in lying words, that cannot profit)
--        NT:     ★★ Matthew 3:9 (think not to say... We have Abraham to our father) — THREAD 1
--        Extras: none warranted (clean canon/NT weave)
--        Tanakh: ★★ Micah 3:11 (yet will they lean upon Yahuah... none evil can come upon us), ★★ 1 Samuel
--                4:3 (let us fetch the ark... it may save us) + ★★ 1 Samuel 4:11 (the ark of Elohim was
--                taken — the talisman trust failed), ★ Isaiah 48:1-2 (which swear by the name of Yahuah...
--                but not in truth) — THREAD 1
--   ★★ v.9-11 (Will ye steal, murder, and commit adultery, and swear falsely, and burn incense unto Baal...
--          and come and stand before me in this house... Is this house... become a den of robbers?)
--        NT:     ★★★ Matthew 21:13 (My house shall be called the house of prayer; but ye have made it a den
--                of thieves — the Messiah quotes Jeremiah cleansing the temple), ★★ Mark 11:17 (My house
--                shall be called of all nations the house of prayer; but ye have made it a den of thieves) — THREAD 2
--        Extras: none warranted
--        Tanakh: ★★ Exodus 20:15 (Thou shalt not steal) + ★★ Exodus 20:13 (Thou shalt not kill) + ★★ Exodus
--                20:14 (Thou shalt not commit adultery — the very commandments listed), ★ Isaiah 56:7 (mine
--                house... an house of prayer for all people — the house's true calling) — THREAD 2
--   v.12-15 (go to Shiloh... the whole seed of Ephraim) — the Shiloh precedent + the northern house cast out;
--        woven THREAD 1 prose (Shiloh = the same ark-talisman failure). NT none / Extras none / Tanakh none warranted separate.
--   v.16-17 (pray not thou for this people) — the intercession-refused; woven THREAD 4 prose. None warranted separate.
--   ★ v.18 (the children gather wood, and the fathers kindle the fire, and the women knead their dough, to
--          make cakes to the queen of heaven... drink offerings unto other gods)
--        NT:     none warranted | Extras: none warranted
--        Tanakh: ★ Deuteronomy 12:31 (every abomination... they have burnt... their sons and their daughters
--                in the fire) — THREAD 4 (the foreign worship Yahuah hates)
--   v.19-20 (do they not provoke themselves... mine anger... shall burn, and shall not be quenched) — the
--        verdict; woven THREAD 4 prose. None warranted separate.
--   ★★ v.21-23 (Put your burnt offerings unto your sacrifices, and eat flesh... I spake not unto your
--          fathers... concerning burnt offerings or sacrifices: But this thing commanded I them, saying,
--          Obey my voice... walk ye in all the ways that I have commanded you)
--        NT:     ★★ Matthew 9:13 (I will have mercy, and not sacrifice — the Messiah quotes Hosea), ★★ Matthew
--                12:7 (if ye had known what this meaneth, I will have mercy, and not sacrifice) — THREAD 3
--        Extras: none warranted
--        Tanakh: ★★★ 1 Samuel 15:22 (to obey is better than sacrifice), ★★ Hosea 6:6 (I desired mercy, and
--                not sacrifice), ★★ Psalm 51:16 (thou desirest not sacrifice) + ★★ Psalm 51:17 (a broken and
--                a contrite heart) — THREAD 3
--   v.24-29 (they hearkened not... went backward, and not forward... truth is perished) — the long history of
--        disobedience; woven THREAD 3 prose. None warranted separate.
--   ★ v.30-31 (they have set their abominations in the house... they have built the high places of Tophet...
--          to burn their sons and their daughters in the fire; which I commanded them not)
--        NT:     none warranted | Extras: none warranted
--        Tanakh: ★★ Leviticus 18:21 (thou shalt not let any of thy seed pass through the fire to Molech),
--                ★★ Jeremiah 19:5 (the high places of Baal, to burn their sons with fire... which I commanded
--                not) — THREAD 4
--   v.32-34 (the valley of slaughter... the voice of mirth... shall cease) — the judgment on Tophet; woven
--        THREAD 4 prose. None warranted separate.
--
-- Threads (slug — target libraries):
--   1. jeremiah-7-trust-ye-not-in-lying-words-the-temple-of-yahuah — NT (Matthew 3) + Tanakh (Micah 3, 1 Samuel 4, Isaiah 48) [free]
--      (★★ false trust in the building while living in sin; the ark-talisman that failed; the temple is no shield for the unrepentant)
--   2. jeremiah-7-a-den-of-robbers-in-the-house-called-by-my-name — NT (Matthew 21, Mark 11) + Tanakh (Exodus 20, Isaiah 56) [free]
--      (★★ breaking the Decalogue then hiding behind the temple; the Messiah quotes Jeremiah cleansing the house of prayer)
--   3. jeremiah-7-obey-my-voice-not-burnt-offerings — NT (Matthew 9, Matthew 12) + Tanakh (1 Samuel 15, Hosea 6, Psalm 51) [free]
--      (★★ obedience of the heart is the point; sacrifice was never a bribe to cover sin — the offerings NOT abolished but never a substitute)
--   4. jeremiah-7-the-queen-of-heaven-and-the-fires-of-tophet — Tanakh (Deuteronomy 12, Leviticus 18, Jeremiah 19) [free]
--      (★ the idolatry Yahuah never commanded — the queen of heaven; child-sacrifice at Tophet — which came not into my heart)
--
-- Framing notes:
--   ★★ TRUST YE NOT IN LYING WORDS (THREAD 1): the temple-building is no shield for the unrepentant. *Trust
--      ye not in lying words, saying, The temple of Yahuah (LORD), The temple of Yahuah (LORD), The temple of
--      Yahuah (LORD), are these* (7:4) — the threefold cry is the lie. Micah names the same false security:
--      *yet will they lean upon Yahuah (LORD), and say, Is not Yahuah (LORD) among us? none evil can come upon
--      us* (Micah 3:11). John the Baptist breaks the same presumption — *think not to say within yourselves,
--      We have Abraham to our father* (Matthew 3:9): lineage-claim and building-claim alike are no cover for
--      an unamended life. And the talisman trust already failed once at Shiloh: *Let us fetch the ark of the
--      covenant of Yahuah (LORD)... that... it may save us* (1 Samuel 4:3), yet *the ark of Elohim (God) was
--      taken* (1 Samuel 4:11) — the very precedent Jeremiah invokes (*go ye now unto my place which was in
--      Shiloh*, 7:12). Isaiah named the hollow profession: *which swear by the name of Yahuah (LORD)... but
--      not in truth, nor in righteousness* (Isaiah 48:1). The condition stands: *if ye throughly amend your
--      ways... then will I cause you to dwell in this place* (7:5,7).
--   ★★ A DEN OF ROBBERS (THREAD 2): the Torah broken under cover of the cult. *Will ye steal, murder, and
--      commit adultery, and swear falsely, and burn incense unto Baal... and come and stand before me in this
--      house, which is called by my name, and say, We are delivered to do all these abominations? Is this
--      house... become a den of robbers in your eyes?* (7:9-11). The crimes are the Decalogue itself — *Thou
--      shalt not kill... Thou shalt not commit adultery... Thou shalt not steal* (Exodus 20:13-15). The
--      Messiah quotes this very verse cleansing the temple — *My house shall be called the house of prayer;
--      but ye have made it a den of thieves* (Matthew 21:13; Mark 11:17), fusing Jeremiah 7:11 with Isaiah
--      56:7 (*mine house shall be called an house of prayer for all people*). The house called by Yahuah's
--      name is not a hiding place for lawbreakers; its true calling is prayer, not robbery.
--   ★★ OBEY MY VOICE, NOT BURNT OFFERINGS (THREAD 3): obedience of the heart is the point, the sacrifices were
--      never meant as a bribe to cover sin. *Put your burnt offerings unto your sacrifices, and eat flesh. For
--      I spake not unto your fathers... concerning burnt offerings or sacrifices: But this thing commanded I
--      them, saying, Obey my voice... and walk ye in all the ways that I have commanded you* (7:21-23). This
--      is NOT the abolition of the Torah's offerings — Yahuah is exposing sacrifice offered as a substitute
--      for a hearing heart. Samuel said it to Saul: *to obey is better than sacrifice, and to hearken than
--      the fat of rams* (1 Samuel 15:22). Hosea: *I desired mercy, and not sacrifice; and the knowledge of
--      Elohim (God) more than burnt offerings* (Hosea 6:6). David, having sinned: *thou desirest not
--      sacrifice... The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart*
--      (Psalm 51:16-17). The Messiah twice quotes Hosea against the heartless cult — *I will have mercy, and
--      not sacrifice* (Matthew 9:13; 12:7). Sacrifice without obedience is empty; the offering was never a
--      bribe to license sin.
--   ★ THE QUEEN OF HEAVEN AND TOPHET (THREAD 4): the idolatry Yahuah never commanded. *The children gather
--      wood, and the fathers kindle the fire, and the women knead their dough, to make cakes to the queen of
--      heaven, and to pour out drink offerings unto other gods* (7:18); *they have built the high places of
--      Tophet... to burn their sons and their daughters in the fire; which I commanded them not, neither came
--      it into my heart* (7:31). The Torah forbade exactly this: *every abomination to Yahuah (LORD), which he
--      hateth, have they done unto their gods; for even their sons and their daughters they have burnt in the
--      fire to their gods* (Deuteronomy 12:31); *thou shalt not let any of thy seed pass through the fire to
--      Molech* (Leviticus 18:21). Jeremiah names the same fire again — *the high places of Baal, to burn their
--      sons with fire for burnt offerings unto Baal, which I commanded not, nor spake it, neither came it into
--      my mind* (Jeremiah 19:5). The worship Yahuah hates is the worship he never asked for.
--   VERSES WITH NO SEPARATE ADD: v.1-2 (the sermon preface; THREAD 1 prose); v.12-15 (Shiloh precedent + the
--      whole seed of Ephraim cast out; THREAD 1 prose); v.16-17 (intercession refused; THREAD 4 prose);
--      v.19-20 (the unquenchable anger; THREAD 4 prose); v.24-29 (the long disobedience; THREAD 3 prose);
--      v.32-34 (the valley of slaughter; THREAD 4 prose). All recorded above; every block carries a thread.

CREATE TEMP VIEW _s309_jer07_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): Trust ye not in lying words, The temple of Yahuah
    ('canon','jeremiah',7,4,'canon','micah',3,11,'free',
      E'*The heads thereof judge for reward, and the priests thereof teach for hire, and the prophets thereof divine for money: yet will they lean upon Yahuah (LORD), and say, Is not Yahuah (LORD) among us? none evil can come upon us* (Micah 3:11). Micah names the very lie Jeremiah tears down — *Trust ye not in lying words, saying, The temple of Yahuah (LORD), The temple of Yahuah (LORD), The temple of Yahuah (LORD), are these* (Jeremiah 7:4). The corrupt presume Yahuah''s presence shields them from judgment; but the building is no cover for bribery, hireling teaching, and bloodshed.'),
    ('canon','jeremiah',7,4,'canon','matthew',3,9,'free',
      E'*And think not to say within yourselves, We have Abraham to our father: for I say unto you, that Elohim (God) is able of these stones to raise up children unto Abraham* (Matthew 3:9). John the Baptist breaks the same false security Jeremiah confronts — the threefold cry *The temple of Yahuah (LORD), The temple of Yahuah (LORD), The temple of Yahuah (LORD), are these* (Jeremiah 7:4). Building-claim and lineage-claim alike are no shield for an unamended life; the call is *Bring forth therefore fruits meet for repentance* (Matthew 3:8), as Jeremiah calls to *amend your ways and your doings* (7:3).'),
    ('canon','jeremiah',7,3,'canon','1-samuel',4,3,'free',
      E'*Wherefore hath Yahuah (LORD) smitten us to day before the Philistines? Let us fetch the ark of the covenant of Yahuah (LORD) out of Shiloh unto us, that, when it cometh among us, it may save us out of the hand of our enemies* (1 Samuel 4:3). Yashar''el (Israel) once trusted the ark as a talisman exactly as Yahudah (Judah) now trusts the temple — but Yahuah''s answer to both is *Amend your ways and your doings, and I will cause you to dwell in this place* (Jeremiah 7:3). The sacred object saves no one who will not turn; Jeremiah points back to that very place: *go ye now unto my place which was in Shiloh* (7:12).'),
    ('canon','jeremiah',7,4,'canon','1-samuel',4,11,'free',
      E'*And the ark of Elohim (God) was taken; and the two sons of Eli, Hophni and Phinehas, were slain* (1 Samuel 4:11). The talisman trust failed: the ark itself was carried off by the Philistines, *the glory is departed from Yashar''el (Israel)* (1 Samuel 4:22). So the temple, leaned on as a charm — *The temple of Yahuah (LORD), The temple of Yahuah (LORD), The temple of Yahuah (LORD), are these* (Jeremiah 7:4) — will be done *as I have done to Shiloh* (7:14). The house is no shield for the unrepentant.'),
    ('canon','jeremiah',7,8,'canon','isaiah',48,1,'free',
      E'*Hear ye this, O house of Jacob, which are called by the name of Yashar''el (Israel)... which swear by the name of Yahuah (LORD), and make mention of the Elohim (God) of Yashar''el (Israel), but not in truth, nor in righteousness* (Isaiah 48:1). Isaiah names the hollow profession Jeremiah exposes — *Behold, ye trust in lying words, that cannot profit* (Jeremiah 7:8). To invoke the Name, to claim the temple, while living in sin, is to swear *but not in truth*; the words *cannot profit* those who will not amend.'),

    -- THREAD 2 (★★): a den of robbers in the house called by my name
    ('canon','jeremiah',7,11,'canon','matthew',21,13,'free',
      E'*And said unto them, It is written, My house shall be called the house of prayer; but ye have made it a den of thieves* (Matthew 21:13). The Messiah cleanses the temple with Jeremiah''s own words — *Is this house, which is called by my name, become a den of robbers in your eyes?* (Jeremiah 7:11). The Formed Son, Yahuah who has a Father, takes up the temple-sermon: the house called by his Name is no den for lawbreakers, but the house of prayer it was meant to be (Isaiah 56:7).'),
    ('canon','jeremiah',7,11,'canon','mark',11,17,'free',
      E'*And he taught, saying unto them, Is it not written, My house shall be called of all nations the house of prayer? but ye have made it a den of thieves* (Mark 11:17). Mark records the Messiah quoting Jeremiah''s *den of robbers* (Jeremiah 7:11) as he overturns the moneychangers'' tables. The same charge Jeremiah laid against Yahudah (Judah) — abomination committed under cover of the house called by Yahuah''s name — the Messiah lays again, joining it to Isaiah''s *house of prayer*.'),
    ('canon','jeremiah',7,9,'canon','exodus',20,15,'free',
      E'*Thou shalt not steal* (Exodus 20:15). The first crime in Jeremiah''s indictment is the eighth word of the Decalogue — *Will ye steal, murder, and commit adultery, and swear falsely* (Jeremiah 7:9). The very commandments Yahuah spoke at Sinai are broken, then the breakers come *and stand before me in this house* (7:10). The Torah is the standard the temple-goers have shattered.'),
    ('canon','jeremiah',7,9,'canon','exodus',20,13,'free',
      E'*Thou shalt not kill* (Exodus 20:13). Murder stands in the list of the cult''s crimes — *Will ye steal, murder, and commit adultery, and swear falsely, and burn incense unto Baal* (Jeremiah 7:9). The house called by Yahuah''s name is filled with those who trample the sixth word, then *say, We are delivered to do all these abominations* (7:10). The commandment exposes the robbery hidden under worship.'),
    ('canon','jeremiah',7,9,'canon','exodus',20,14,'free',
      E'*Thou shalt not commit adultery* (Exodus 20:14). Adultery, too, is named among the abominations carried into the temple — *Will ye steal, murder, and commit adultery, and swear falsely* (Jeremiah 7:9). To break the seventh word and then *come and stand before me in this house, which is called by my name* (7:10) is to make the house a *den of robbers* (7:11). The Decalogue measures the worshippers, and they are found wanting.'),
    ('canon','jeremiah',7,11,'canon','isaiah',56,7,'free',
      E'*Even them will I bring to my holy mountain, and make them joyful in my house of prayer: their burnt offerings and their sacrifices shall be accepted upon mine altar; for mine house shall be called an house of prayer for all people* (Isaiah 56:7). Isaiah names the house''s true calling — a *house of prayer* — the very phrase the Messiah sets against Jeremiah''s charge: the den of robbers (Jeremiah 7:11) is the betrayal of the house of prayer. What was meant to gather the nations in prayer has been made a hiding place for thieves.'),

    -- THREAD 3 (★★): Obey my voice, not burnt offerings — obedience over empty sacrifice
    ('canon','jeremiah',7,23,'canon','1-samuel',15,22,'free',
      E'*And Samuel said, Hath Yahuah (LORD) as great delight in burnt offerings and sacrifices, as in obeying the voice of Yahuah (LORD)? Behold, to obey is better than sacrifice, and to hearken than the fat of rams* (1 Samuel 15:22). Samuel says to Saul what Jeremiah says to Yahudah (Judah) — *this thing commanded I them, saying, Obey my voice... and walk ye in all the ways that I have commanded you* (Jeremiah 7:23). Obedience is what Yahuah sought; the sacrifice that comes without a hearing heart is no substitute, and *to obey is better than sacrifice*.'),
    ('canon','jeremiah',7,22,'canon','hosea',6,6,'free',
      E'*For I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6). Hosea voices the same priority Jeremiah declares — *I spake not unto your fathers... concerning burnt offerings or sacrifices: But this thing commanded I them, saying, Obey my voice* (Jeremiah 7:22-23). Yahuah desires mercy and the knowledge of him above ritual; the offerings were never meant as a bribe to cover an unmerciful, disobedient life.'),
    ('canon','jeremiah',7,22,'canon','psalms',51,16,'free',
      E'*For thou desirest not sacrifice; else would I give it: thou delightest not in burnt offering* (Psalm 51:16). David, broken over his sin, knows what Jeremiah preaches — *I spake not unto your fathers... concerning burnt offerings or sacrifices* (Jeremiah 7:22). The sacrifice that covers nothing is the sacrifice offered in place of repentance; Yahuah delights not in it, but in a turned heart.'),
    ('canon','jeremiah',7,23,'canon','psalms',51,17,'free',
      E'*The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise* (Psalm 51:17). The obedience Yahuah commanded — *Obey my voice... walk ye in all the ways that I have commanded you* (Jeremiah 7:23) — begins in the broken and contrite heart David names. The acceptable offering is the hearing heart; the cult that hides a hard heart is rejected.'),
    ('canon','jeremiah',7,23,'canon','matthew',9,13,'free',
      E'*But go ye and learn what that meaneth, I will have mercy, and not sacrifice: for I am not come to call the righteous, but sinners to repentance* (Matthew 9:13). The Messiah quotes Hosea against the heartless cult, naming the very principle of Jeremiah''s sermon — *Obey my voice... that it may be well unto you* (Jeremiah 7:23). Mercy and obedience over ritual: the offering was never a bribe; Yahuah comes to call sinners to repentance, not to be appeased by sacrifice.'),
    ('canon','jeremiah',7,23,'canon','matthew',12,7,'free',
      E'*But if ye had known what this meaneth, I will have mercy, and not sacrifice, ye would not have condemned the guiltless* (Matthew 12:7). Again the Messiah lays down the standard Jeremiah preached — *this thing commanded I them, saying, Obey my voice* (Jeremiah 7:23). Mercy is what Yahuah desired; those who keep the ritual while crushing the guiltless have missed the whole point, *to obey* and to show mercy above the sacrifice.'),

    -- THREAD 4 (★): the queen of heaven and the fires of Tophet — what I commanded them not
    ('canon','jeremiah',7,18,'canon','deuteronomy',12,31,'free',
      E'*Thou shalt not do so unto Yahuah Elohayka (the LORD thy God): for every abomination to Yahuah (LORD), which he hateth, have they done unto their gods; for even their sons and their daughters they have burnt in the fire to their gods* (Deuteronomy 12:31). The cakes to the queen of heaven and the drink offerings to other gods (Jeremiah 7:18) are the foreign worship the Torah forbade outright — the abominations Yahuah *hateth*, the burning of sons and daughters in the fire. Yahudah (Judah) does the very thing Moses warned against.'),
    ('canon','jeremiah',7,31,'canon','leviticus',18,21,'free',
      E'*And thou shalt not let any of thy seed pass through the fire to Molech, neither shalt thou profane the name of thy Elohim (God): I am Yahuah (LORD)* (Leviticus 18:21). The high places of Tophet, *to burn their sons and their daughters in the fire* (Jeremiah 7:31), are the passing of seed through the fire the Torah expressly bans. Yahuah''s verdict — *which I commanded them not, neither came it into my heart* (7:31) — answers the commandment that never sanctioned this horror.'),
    ('canon','jeremiah',7,31,'canon','jeremiah',19,5,'free',
      E'*They have built also the high places of Baal, to burn their sons with fire for burnt offerings unto Baal, which I commanded not, nor spake it, neither came it into my mind* (Jeremiah 19:5). Jeremiah names the same fire of Tophet again, in nearly the same words — *they have built the high places of Tophet... to burn their sons and their daughters in the fire; which I commanded them not, neither came it into my heart* (Jeremiah 7:31). The child-sacrifice Yahuah never asked for is the abomination that turns the valley of Hinnom into the valley of slaughter (7:32; 19:6).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s309_jer07_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s309_jer07_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-7-trust-ye-not-in-lying-words-the-temple-of-yahuah',
       E'Trust ye not in lying words, The temple of Yahuah — the building is no shield for the unrepentant',
       E'Standing in the gate of the house, Jeremiah sets the whole framework before Yahudah (Judah): the covenant is kept by amended ways, not by the talisman of the temple. *Thus saith Yahuah Tseva''ot (LORD of hosts), the Elohim (God) of Yashar''el (Israel), Amend your ways and your doings, and I will cause you to dwell in this place. Trust ye not in lying words, saying, The temple of Yahuah (LORD), The temple of Yahuah (LORD), The temple of Yahuah (LORD), are these* (7:3-4). The threefold cry is the lie — a chant of false security while judgment, oppression, and idolatry go on. The promise is conditional: *if ye throughly amend your ways and your doings... if ye oppress not the stranger, the fatherless, and the widow... Then will I cause you to dwell in this place* (7:5-7); but *Behold, ye trust in lying words, that cannot profit* (7:8). Micah names the same presumption among the corrupt: *yet will they lean upon Yahuah (LORD), and say, Is not Yahuah (LORD) among us? none evil can come upon us* (Micah 3:11). John the Baptist breaks the same false confidence — *think not to say within yourselves, We have Abraham to our father* (Matthew 3:9): lineage-claim and building-claim are alike no cover for an unrepentant life. And the talisman trust had already failed once: when Yashar''el (Israel) cried *Let us fetch the ark of the covenant of Yahuah (LORD)... that... it may save us* (1 Samuel 4:3), instead *the ark of Elohim (God) was taken* (1 Samuel 4:11) — the very Shiloh precedent Jeremiah invokes, *go ye now unto my place which was in Shiloh... and see what I did to it* (7:12), threatening *as I have done to Shiloh* (7:14). Isaiah long ago named the hollow profession: those *which swear by the name of Yahuah (LORD)... but not in truth, nor in righteousness* (Isaiah 48:1). The Name on their lips and the house at their back save no one who will not turn.',
       sv.verse_id, ev.verse_id, 'free', 34150
  FROM _s309_jer07_lookup sv, _s309_jer07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=7 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=7 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-7-a-den-of-robbers-in-the-house-called-by-my-name',
       E'A den of robbers in the house called by my name — the Torah broken under cover of the cult',
       E'The sermon turns to the crimes carried into the temple: *Will ye steal, murder, and commit adultery, and swear falsely, and burn incense unto Baal, and walk after other gods whom ye know not; And come and stand before me in this house, which is called by my name, and say, We are delivered to do all these abominations? Is this house, which is called by my name, become a den of robbers in your eyes? Behold, even I have seen it, saith Yahuah (LORD)* (7:9-11). The list is the Decalogue itself — *Thou shalt not kill* (Exodus 20:13), *Thou shalt not commit adultery* (Exodus 20:14), *Thou shalt not steal* (Exodus 20:15) — the very words of Sinai trampled, then the breakers come to *stand before me in this house* as though the building absolves them. The Messiah takes up this exact verse cleansing the temple: *It is written, My house shall be called the house of prayer; but ye have made it a den of thieves* (Matthew 21:13), and *My house shall be called of all nations the house of prayer; but ye have made it a den of thieves* (Mark 11:17). He fuses Jeremiah''s *den of robbers* with Isaiah''s word on the house''s true calling: *mine house shall be called an house of prayer for all people* (Isaiah 56:7). The Formed Son, Yahuah who has a Father, lays the same charge again that Jeremiah laid: the house called by the Name is no hiding place for lawbreakers. The Torah broken under cover of the cult turns the house of prayer into a den of robbers.',
       sv.verse_id, ev.verse_id, 'free', 34153
  FROM _s309_jer07_lookup sv, _s309_jer07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=7 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=7 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-7-obey-my-voice-not-burnt-offerings',
       E'Obey my voice — obedience is what Yahuah sought, not sacrifice offered to cover sin',
       E'Yahuah strips the ritual of its false power: *Thus saith Yahuah Tseva''ot (LORD of hosts), the Elohim (God) of Yashar''el (Israel); Put your burnt offerings unto your sacrifices, and eat flesh. For I spake not unto your fathers, nor commanded them in the day that I brought them out of the land of Egypt, concerning burnt offerings or sacrifices: But this thing commanded I them, saying, Obey my voice, and I will be your Elohim (God), and ye shall be my people: and walk ye in all the ways that I have commanded you, that it may be well unto you* (7:21-23). This is not the abolition of the Torah''s offerings — Yahuah is exposing sacrifice offered as a bribe to cover sin, in place of a hearing heart. The point is obedience: *Obey my voice... walk ye in all the ways that I have commanded you*. Samuel said the same to Saul: *to obey is better than sacrifice, and to hearken than the fat of rams* (1 Samuel 15:22). Hosea: *I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6). David, broken over his own sin, knew it: *thou desirest not sacrifice; else would I give it: thou delightest not in burnt offering. The sacrifices of Elohim (God) are a broken spirit: a broken and a contrite heart, O Elohim (God), thou wilt not despise* (Psalm 51:16-17). And the Messiah twice quotes Hosea against the heartless cult: *I will have mercy, and not sacrifice: for I am not come to call the righteous, but sinners to repentance* (Matthew 9:13), *if ye had known what this meaneth, I will have mercy, and not sacrifice, ye would not have condemned the guiltless* (Matthew 12:7). The offering was never meant as a substitute for obedience; the people *hearkened not, nor inclined their ear, but walked in the counsels and in the imagination of their evil heart, and went backward, and not forward* (7:24). Obedience of the heart is what Yahuah sought from the first.',
       sv.verse_id, ev.verse_id, 'free', 34156
  FROM _s309_jer07_lookup sv, _s309_jer07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=7 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=7 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-7-the-queen-of-heaven-and-the-fires-of-tophet',
       E'Cakes to the queen of heaven and the fires of Tophet — which I commanded them not',
       E'Beside the empty temple-trust runs open idolatry — the worship Yahuah never asked for. *The children gather wood, and the fathers kindle the fire, and the women knead their dough, to make cakes to the queen of heaven, and to pour out drink offerings unto other gods, that they may provoke me to anger* (7:18) — a whole household enlisted in the service of a false goddess. And worse, in the valley of the son of Hinnom: *they have built the high places of Tophet... to burn their sons and their daughters in the fire; which I commanded them not, neither came it into my heart* (7:31). The Torah forbade exactly these abominations: *every abomination to Yahuah (LORD), which he hateth, have they done unto their gods; for even their sons and their daughters they have burnt in the fire to their gods* (Deuteronomy 12:31); *thou shalt not let any of thy seed pass through the fire to Molech, neither shalt thou profane the name of thy Elohim (God): I am Yahuah (LORD)* (Leviticus 18:21). Jeremiah himself names the same fire again at Tophet — *they have built also the high places of Baal, to burn their sons with fire for burnt offerings unto Baal, which I commanded not, nor spake it, neither came it into my mind* (Jeremiah 19:5). The refrain is the key: *which I commanded them not, neither came it into my heart*. The worship Yahuah hates is the worship he never sanctioned; for it the valley of Hinnom becomes *the valley of slaughter* (7:32), and the prophet may not even pray for the people (7:16).',
       sv.verse_id, ev.verse_id, 'free', 34159
  FROM _s309_jer07_lookup sv, _s309_jer07_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=7 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=7 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *yet will they lean upon Yahuah (LORD), and say, Is not Yahuah (LORD) among us? none evil can come upon us* (Micah 3:11) — the same false security Jeremiah 7:4 tears down; the corrupt presume the presence shields them.'
  FROM cross_reference_threads t
  JOIN _s309_jer07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=7 AND sv.verse_number=4
  JOIN _s309_jer07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=3 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-7-trust-ye-not-in-lying-words-the-temple-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *think not to say within yourselves, We have Abraham to our father* (Matthew 3:9) — John breaks the same presumption as the temple-chant of Jeremiah 7:4; lineage-claim and building-claim are no cover for an unamended life.'
  FROM cross_reference_threads t
  JOIN _s309_jer07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=7 AND sv.verse_number=4
  JOIN _s309_jer07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=3 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-7-trust-ye-not-in-lying-words-the-temple-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *Let us fetch the ark of the covenant of Yahuah (LORD)... that... it may save us* (1 Samuel 4:3) — the same talisman trust as the temple of Jeremiah 7:3; the sacred object saves no one who will not turn.'
  FROM cross_reference_threads t
  JOIN _s309_jer07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=7 AND sv.verse_number=3
  JOIN _s309_jer07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=4 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-7-trust-ye-not-in-lying-words-the-temple-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *the ark of Elohim (God) was taken* (1 Samuel 4:11) — the talisman trust failed; so the temple leaned on as a charm (Jeremiah 7:4) will be done as Shiloh was (7:14).'
  FROM cross_reference_threads t
  JOIN _s309_jer07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=7 AND sv.verse_number=4
  JOIN _s309_jer07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=4 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-7-trust-ye-not-in-lying-words-the-temple-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *which swear by the name of Yahuah (LORD)... but not in truth, nor in righteousness* (Isaiah 48:1) — the hollow profession behind the lying words of Jeremiah 7:8; the Name invoked while sin goes on cannot profit.'
  FROM cross_reference_threads t
  JOIN _s309_jer07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=7 AND sv.verse_number=8
  JOIN _s309_jer07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=48 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-7-trust-ye-not-in-lying-words-the-temple-of-yahuah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *My house shall be called the house of prayer; but ye have made it a den of thieves* (Matthew 21:13) — the Messiah cleanses the temple with Jeremiah 7:11''s own words; the house called by the Name is no den for lawbreakers.'
  FROM cross_reference_threads t
  JOIN _s309_jer07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=7 AND sv.verse_number=11
  JOIN _s309_jer07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=21 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-7-a-den-of-robbers-in-the-house-called-by-my-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *My house shall be called of all nations the house of prayer; but ye have made it a den of thieves* (Mark 11:17) — Mark records the same quotation of Jeremiah 7:11 as he overturns the moneychangers'' tables.'
  FROM cross_reference_threads t
  JOIN _s309_jer07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=7 AND sv.verse_number=11
  JOIN _s309_jer07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=11 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-7-a-den-of-robbers-in-the-house-called-by-my-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *Thou shalt not steal* (Exodus 20:15) — the first crime in Jeremiah 7:9 is the eighth word of the Decalogue; the Torah is the standard the worshippers have shattered.'
  FROM cross_reference_threads t
  JOIN _s309_jer07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=7 AND sv.verse_number=9
  JOIN _s309_jer07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-7-a-den-of-robbers-in-the-house-called-by-my-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *Thou shalt not kill* (Exodus 20:13) — murder stands in the list of the cult''s crimes (Jeremiah 7:9); the sixth word trampled, then the breakers stand in the house.'
  FROM cross_reference_threads t
  JOIN _s309_jer07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=7 AND sv.verse_number=9
  JOIN _s309_jer07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-7-a-den-of-robbers-in-the-house-called-by-my-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *Thou shalt not commit adultery* (Exodus 20:14) — the seventh word, named among the abominations of Jeremiah 7:9 carried into the house called by the Name.'
  FROM cross_reference_threads t
  JOIN _s309_jer07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=7 AND sv.verse_number=9
  JOIN _s309_jer07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-7-a-den-of-robbers-in-the-house-called-by-my-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *for mine house shall be called an house of prayer for all people* (Isaiah 56:7) — the house''s true calling; the den of robbers (Jeremiah 7:11) is the betrayal of the house of prayer.'
  FROM cross_reference_threads t
  JOIN _s309_jer07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=7 AND sv.verse_number=11
  JOIN _s309_jer07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=56 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-7-a-den-of-robbers-in-the-house-called-by-my-name'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *to obey is better than sacrifice, and to hearken than the fat of rams* (1 Samuel 15:22) — Samuel says to Saul what Jeremiah 7:23 says to Yahudah (Judah); obedience over ritual.'
  FROM cross_reference_threads t
  JOIN _s309_jer07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=7 AND sv.verse_number=23
  JOIN _s309_jer07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=15 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-7-obey-my-voice-not-burnt-offerings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *I desired mercy, and not sacrifice; and the knowledge of Elohim (God) more than burnt offerings* (Hosea 6:6) — the same priority as Jeremiah 7:22; the offering was never a bribe to cover sin.'
  FROM cross_reference_threads t
  JOIN _s309_jer07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=7 AND sv.verse_number=22
  JOIN _s309_jer07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=6 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-7-obey-my-voice-not-burnt-offerings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *thou desirest not sacrifice; else would I give it: thou delightest not in burnt offering* (Psalm 51:16) — David knows what Jeremiah 7:22 preaches; the sacrifice that covers nothing is offered in place of repentance.'
  FROM cross_reference_threads t
  JOIN _s309_jer07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=7 AND sv.verse_number=22
  JOIN _s309_jer07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-7-obey-my-voice-not-burnt-offerings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *a broken and a contrite heart, O Elohim (God), thou wilt not despise* (Psalm 51:17) — the obedience Yahuah commanded (Jeremiah 7:23) begins in the broken heart; the acceptable offering is the hearing heart.'
  FROM cross_reference_threads t
  JOIN _s309_jer07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=7 AND sv.verse_number=23
  JOIN _s309_jer07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-7-obey-my-voice-not-burnt-offerings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *I will have mercy, and not sacrifice: for I am not come to call the righteous, but sinners to repentance* (Matthew 9:13) — the Messiah quotes Hosea, naming the principle of Jeremiah 7:23; mercy and obedience over ritual.'
  FROM cross_reference_threads t
  JOIN _s309_jer07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=7 AND sv.verse_number=23
  JOIN _s309_jer07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=9 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-7-obey-my-voice-not-burnt-offerings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★ *if ye had known what this meaneth, I will have mercy, and not sacrifice, ye would not have condemned the guiltless* (Matthew 12:7) — again the Messiah lays down the standard of Jeremiah 7:23; mercy is what Yahuah desired above the offering.'
  FROM cross_reference_threads t
  JOIN _s309_jer07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=7 AND sv.verse_number=23
  JOIN _s309_jer07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=12 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-7-obey-my-voice-not-burnt-offerings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *for even their sons and their daughters they have burnt in the fire to their gods* (Deuteronomy 12:31) — the foreign worship Yahuah hates; the cakes to the queen of heaven (Jeremiah 7:18) are the abomination the Torah forbade.'
  FROM cross_reference_threads t
  JOIN _s309_jer07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=7 AND sv.verse_number=18
  JOIN _s309_jer07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=12 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-7-the-queen-of-heaven-and-the-fires-of-tophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *thou shalt not let any of thy seed pass through the fire to Molech* (Leviticus 18:21) — the Torah expressly bans the fire of Tophet (Jeremiah 7:31); Yahuah''s *which I commanded them not* answers the commandment that never sanctioned it.'
  FROM cross_reference_threads t
  JOIN _s309_jer07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=7 AND sv.verse_number=31
  JOIN _s309_jer07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=18 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-7-the-queen-of-heaven-and-the-fires-of-tophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *the high places of Baal, to burn their sons with fire... which I commanded not, nor spake it, neither came it into my mind* (Jeremiah 19:5) — Jeremiah names the same Tophet fire again in nearly the words of 7:31; the abomination Yahuah never asked for.'
  FROM cross_reference_threads t
  JOIN _s309_jer07_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=7 AND sv.verse_number=31
  JOIN _s309_jer07_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=19 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-7-the-queen-of-heaven-and-the-fires-of-tophet'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jeremiah_23.sql (Jeremiah 23) -----
-- Chapter: Jeremiah 23 — ★★★ KEYSTONE. The false shepherds that destroy and scatter the flock judged,
-- and the remnant gathered out of all countries with true shepherds set over them (partner to Ezekiel 34);
-- ★★★ THE RIGHTEOUS BRANCH raised unto David — a King who reigns and prospers, in whose days BOTH HOUSES
-- (Yahudah AND Yashar'el) are saved, whose name is YAHUAH TSIDKENU (THE LORD OUR RIGHTEOUSNESS): the Davidic
-- Branch-King who BEARS THE NAME Yahuah — the Formed Son, Yahuah who has a Father, our Righteousness; the
-- SECOND EXODUS from the north country eclipsing the first; the lying prophets who speak a vision of their
-- own heart, unsent, prophesying lies in the Name; *is not my word like as a fire? and like a hammer that
-- breaketh the rock in pieces?*; and Yahuah a Elohim near and afar off who fills heaven and earth.
-- Tag: jer23   Temp view: _s309_jer23_lookup   Session: s309
-- Sort band: base 34550, step 3 -> 34550, 34553, 34556, 34559, 34562, 34565 (6 threads)
-- Source of EVERY row: 'canon','jeremiah',23,v
--
-- Jeremiah 23 coverage:
--   ★★ v.1-4 (Woe be unto the pastors that destroy and scatter the sheep of my pasture... I will gather
--          the remnant of my flock out of all countries... And I will set up shepherds over them which
--          shall feed them)
--        NT:     ★★ John 10:11 (I am the good shepherd) + John 10:16 (other sheep I have... one fold, one
--                shepherd), ★ Matthew 9:36 (scattered abroad, as sheep having no shepherd) — THREAD 1
--        Extras: none warranted (clean canon-NT-Tanakh shepherd weave)
--        Tanakh: ★★ Ezekiel 34:2 + 34:6 + 34:11-13 (woe to the shepherds... I will both search my sheep,
--                and seek them out... gather them from the countries), ★ Zechariah 11:17 (the idol
--                shepherd that leaveth the flock) — THREAD 1
--   ★★★ v.5-6 (I will raise unto David a righteous Branch, and a King shall reign and prosper... In his
--          days Yahudah shall be saved, and Yashar'el shall dwell safely: and this is his name... YAHUAH
--          TSIDKENU)
--        NT:     ★★ 1 Corinthians 1:30 (Messiah... is made unto us... righteousness), ★★ 2 Corinthians
--                5:21 (made the righteousness of Elohim in him), ★ Luke 1:32-33 (the throne of his father
--                David... reign over the house of Jacob for ever) — THREAD 2
--        Extras: none warranted
--        Tanakh: ★★★ Zechariah 3:8 (my servant the BRANCH) + Zechariah 6:12-13 (the man whose name is The
--                BRANCH... he shall build the temple... and bear the glory), ★★ Isaiah 11:1 + 11:4-5 (a
--                Branch shall grow out of his roots... with righteousness shall he judge), ★ Isaiah 4:2
--                (the branch of Yahuah be beautiful and glorious) — THREAD 2
--   ★ v.7-8 (they shall no more say, Yahuah liveth, which brought up Yashar'el out of Egypt; But, Yahuah
--          liveth, which brought up the seed of the house of Yashar'el out of the north country)
--        NT:     none warranted distinct (the second-exodus regathering; NT ingathering held in THREAD 1's
--                one-fold weave)
--        Extras: none warranted
--        Tanakh: ★★ Jeremiah 16:14-15 (lateral, the same saying — out of the land of the north), ★ Isaiah
--                43:18-19 (remember not the former things... I will do a new thing), ★ Ezekiel 37:21 (I
--                will take the children of Yashar'el from among the heathen... bring them into their own
--                land) — THREAD 3
--   v.9-15 (mine heart within me is broken because of the prophets; the land full of adulterers; prophet
--          and priest profane; the prophets of Samaria/Jerusalem; wormwood and gall)
--        NT:     none warranted (the lament + indictment; the unsent-prophet weave gathered in THREAD 4 at
--                v.16f)
--        Extras: none warranted
--        Tanakh: none separate (the covenant-lawsuit preface to the false-prophet oracle; woven in prose)
--   ★★ v.16-22 + 25-27 (Hearken not unto the prophets... they speak a vision of their own heart, and not
--          out of the mouth of Yahuah... I have not sent these prophets, yet they ran... prophesy lies in
--          my name, saying, I have dreamed)
--        NT:     ★★ Matthew 7:15 (false prophets... in sheep's clothing... ravening wolves), ★ 2 Peter
--                2:1 (false prophets... false teachers... damnable heresies) — THREAD 4
--        Extras: none warranted
--        Tanakh: ★★ Ezekiel 13:2-3 + 13:6 (lateral, the foolish prophets that follow their own spirit...
--                Yahuah hath not sent them), ★ Deuteronomy 18:20 + 18:22 (the prophet which shall presume
--                to speak a word in my name, which I have not commanded) — THREAD 4
--   ★★ v.28-29 (He that hath my word, let him speak my word faithfully. What is the chaff to the wheat?...
--          Is not my word like as a fire?... and like a hammer that breaketh the rock in pieces?)
--        NT:     ★★ Hebrews 4:12 (the word of Elohim is quick, and powerful, and sharper than any twoedged
--                sword), ★ Luke 3:17 (he will burn up the chaff with fire unquenchable) — THREAD 5
--        Extras: none warranted
--        Tanakh: ★★ Isaiah 55:11 (so shall my word be... it shall not return unto me void), ★ Psalm 12:6
--                (the words of Yahuah are pure words) — THREAD 5
--   ★ v.23-24 (Am I a Elohim at hand... and not a Elohim afar off? Can any hide himself in secret places
--          that I shall not see him?... Do not I fill heaven and earth?)
--        NT:     ★ Acts 17:27-28 (he be not far from every one of us: for in him we live, and move, and
--                have our being) — THREAD 6
--        Extras: none warranted
--        Tanakh: ★★ Psalm 139:7-10 (whither shall I flee from thy presence?... thou art there), ★ 1 Kings
--                8:27 (the heaven of heavens cannot contain thee) — THREAD 6
--   v.30-40 (I am against the prophets that steal my words... the burden of Yahuah... I will utterly
--          forget you... everlasting reproach) — the closing oracle against the stolen-word prophets and
--          the abused "burden of Yahuah" formula; woven into THREAD 4 prose (the unsent-prophet verdict);
--          no separate add (NT none / Extras none / Tanakh none warranted distinct).
--
-- Threads (slug — target libraries):
--   1. jeremiah-23-woe-unto-the-pastors-that-scatter-the-flock-regathered — NT (John 10, Matthew 9) + Tanakh (Ezekiel 34, Zechariah 11) [free]
--      (★★ the false shepherds judged, the remnant gathered, true shepherds set up; partner to Ezekiel 34; the good shepherd, one fold)
--   2. jeremiah-23-a-righteous-branch-whose-name-is-yahuah-tsidkenu — NT (1 Corinthians 1, 2 Corinthians 5, Luke 1) + Tanakh (Zechariah 3, Zechariah 6, Isaiah 11, Isaiah 4) [free]
--      (★★★ THE central thread — the Davidic Branch-King who BEARS THE NAME Yahuah, our Righteousness; BOTH houses saved; the Formed Son)
--   3. jeremiah-23-yahuah-liveth-that-brought-them-from-the-north-country — Tanakh (Jeremiah 16, Isaiah 43, Ezekiel 37) [free]
--      (★ the second exodus eclipsing the first; the regathering from the north; the new thing; the two-house ingathering)
--   4. jeremiah-23-they-speak-a-vision-of-their-own-heart-i-sent-them-not — NT (Matthew 7, 2 Peter 2) + Tanakh (Ezekiel 13, Deuteronomy 18) [free]
--      (★★ the lying prophets who speak from their own heart, unsent; the Torah test; the false prophets contrasted with the true word)
--   5. jeremiah-23-is-not-my-word-like-as-a-fire-and-like-a-hammer — NT (Hebrews 4, Luke 3) + Tanakh (Isaiah 55, Psalm 12) [free]
--      (★★ the power and purity of Yahuah's true word vs the chaff of false dreams; the word like fire and hammer, quick and powerful, pure)
--   6. jeremiah-23-am-i-a-elohim-at-hand-and-not-a-elohim-afar-off — NT (Acts 17) + Tanakh (Psalm 139, 1 Kings 8) [free]
--      (★ Yahuah's omnipresence; no hiding from him; he fills heaven and earth; not far from every one of us)
--
-- Framing notes:
--   ★★ THE SHEPHERDS (THREAD 1): *Woe be unto the pastors that destroy and scatter the sheep of my pasture!*
--      (23:1) — the false shepherds who *have scattered my flock, and driven them away* (23:2) are judged,
--      and Yahuah himself gathers: *I will gather the remnant of my flock out of all countries whither I
--      have driven them... And I will set up shepherds over them which shall feed them* (23:3-4). This is
--      the twin of Ezekiel 34 — *Woe be to the shepherds of Yashar''el (Israel) that do feed themselves!*
--      (Ezek 34:2), *Behold, I, even I, will both search my sheep, and seek them out* (34:11). The Formed
--      Son answers it: *I am the good shepherd* (John 10:11), gathering the scattered into *one fold, and
--      one shepherd* (John 10:16) — the two-house flock made one. Matthew sees the unshepherded flock —
--      *scattered abroad, as sheep having no shepherd* (Matt 9:36) — and Zechariah the false one — *Woe to
--      the idol shepherd that leaveth the flock!* (Zech 11:17).
--   ★★★ THE BRANCH WHO BEARS THE NAME (THREAD 2, the keystone): *I will raise unto David a righteous Branch,
--      and a King shall reign and prosper, and shall execute judgment and justice in the earth. In his days
--      Yahudah (Judah) shall be saved, and Yashar''el (Israel) shall dwell safely: and this is his name
--      whereby he shall be called, Yahuah Tsidkenu (THE LORD OUR RIGHTEOUSNESS)* (23:5-6). The Davidic
--      Branch-King BEARS THE NAME Yahuah — the Formed Son, Yahuah who has a Father, made unto us
--      Righteousness; and BOTH houses are saved (Yahudah AND Yashar''el = the two-house frame). Zechariah
--      names the same Branch — *my servant the BRANCH* (Zech 3:8), *the man whose name is The BRANCH... he
--      shall build the temple of Yahuah (LORD)... and he shall bear the glory* (Zech 6:12-13). Isaiah: *a
--      Branch shall grow out of his roots... with righteousness shall he judge* (Isa 11:1,4); *the branch of
--      Yahuah (LORD) be beautiful and glorious* (Isa 4:2). The NT names the Name borne: Messiah *of Elohim
--      (God) is made unto us... righteousness* (1 Cor 1:30); *made the righteousness of Elohim (God) in him*
--      (2 Cor 5:21); given *the throne of his father David... reign over the house of Jacob for ever* (Luke
--      1:32-33). YAHUAH TSIDKENU is the Name the Branch bears.
--   ★ THE SECOND EXODUS (THREAD 3): *they shall no more say, Yahuah (LORD) liveth, which brought up the
--      children of Yashar''el (Israel) out of the land of Egypt; But, Yahuah (LORD) liveth, which brought
--      up... the seed of the house of Yashar''el (Israel) out of the north country* (23:7-8) — the
--      regathering from the north eclipsing the first exodus. Jeremiah says it again — *out of the land of
--      the north* (Jer 16:15); Isaiah names it the new thing — *Remember ye not the former things... I will
--      do a new thing* (Isa 43:18-19); Ezekiel: *I will take the children of Yashar''el (Israel) from among
--      the heathen... and bring them into their own land* (Ezek 37:21). The greater ingathering of the
--      two-house people.
--   ★★ THE LYING PROPHETS (THREAD 4): *Hearken not unto the words of the prophets that prophesy unto you:
--      they make you vain: they speak a vision of their own heart, and not out of the mouth of Yahuah (LORD)*
--      (23:16); *I have not sent these prophets, yet they ran: I have not spoken to them, yet they
--      prophesied* (23:21); *prophesy lies in my name, saying, I have dreamed, I have dreamed* (23:25). The
--      unsent prophets who speak from their own heart — the lateral twin is Ezekiel 13: *Woe unto the
--      foolish prophets, that follow their own spirit... Yahuah (LORD) hath not sent them* (Ezek 13:3,6).
--      The Torah test stands: *the prophet, which shall presume to speak a word in my name, which I have not
--      commanded him to speak... even that prophet shall die* (Deut 18:20). The Messiah warns the same —
--      *Beware of false prophets, which come to you in sheep''s clothing, but inwardly they are ravening
--      wolves* (Matt 7:15) — and Peter: *there shall be false teachers among you, who privily shall bring
--      in damnable heresies* (2 Pet 2:1).
--   ★★ THE WORD LIKE FIRE AND HAMMER (THREAD 5): *he that hath my word, let him speak my word faithfully.
--      What is the chaff to the wheat? saith Yahuah (LORD). Is not my word like as a fire? saith Yahuah
--      (LORD); and like a hammer that breaketh the rock in pieces?* (23:28-29). The true word, fire and
--      hammer, against the chaff of false dreams. Hebrews: *the word of Elohim (God) is quick, and powerful,
--      and sharper than any twoedged sword* (Heb 4:12); John Baptist: *the chaff he will burn with fire
--      unquenchable* (Luke 3:17). Isaiah: *so shall my word be... it shall not return unto me void* (Isa
--      55:11); the Psalm: *the words of Yahuah (LORD) are pure words* (Ps 12:6).
--   ★ THE ELOHIM NEAR AND AFAR OFF (THREAD 6): *Am I a Elohim (God) at hand, saith Yahuah (LORD), and not a
--      Elohim (God) afar off? Can any hide himself in secret places that I shall not see him?... Do not I
--      fill heaven and earth?* (23:23-24) — Yahuah''s omnipresence, no hiding from the false prophet''s
--      secret heart. The Psalm sings it — *Whither shall I go from thy spirit? or whither shall I flee from
--      thy presence?* (Ps 139:7); Solomon prays it — *the heaven and heaven of heavens cannot contain thee*
--      (1 Kgs 8:27); Paul preaches it — *he be not far from every one of us: For in him we live, and move,
--      and have our being* (Acts 17:27-28).
--   VERSES WITH NO SEPARATE ADD: v.9-15 (the lament + the indictment of the profane prophets/priests of
--      Samaria and Jerusalem — covenant-lawsuit preface; woven in THREAD 4 prose), v.30-40 (I am against the
--      prophets that steal my words; the abused "burden of Yahuah" formula; everlasting reproach — the
--      unsent-prophet verdict; woven in THREAD 4 prose). All verses recorded in the coverage checklist above.

CREATE TEMP VIEW _s309_jer23_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): woe unto the pastors that scatter the flock — the remnant regathered
    ('canon','jeremiah',23,1,'canon','ezekiel',34,2,'free',
      E'*Son of Adam, prophesy against the shepherds of Yashar''el (Israel)... Woe be to the shepherds of Yashar''el (Israel) that do feed themselves! should not the shepherds feed the flocks?* (Ezekiel 34:2). Ezekiel speaks the very woe Jeremiah speaks: *Woe be unto the pastors that destroy and scatter the sheep of my pasture!* (Jeremiah 23:1). The self-feeding shepherds who scatter the flock are judged in both prophets — the same indictment, the same flock of Yahuah neglected and driven away.'),
    ('canon','jeremiah',23,2,'canon','ezekiel',34,6,'free',
      E'*My sheep wandered through all the mountains, and upon every high hill: yea, my flock was scattered upon all the face of the earth, and none did search or seek after them* (Ezekiel 34:6). The charge against the pastors — *Ye have scattered my flock, and driven them away, and have not visited them* (Jeremiah 23:2) — is Ezekiel''s charge word for word: the flock scattered, none seeking, the shepherds failing the sheep. The scattering of the two-house flock is the crime Yahuah visits upon the false shepherds.'),
    ('canon','jeremiah',23,3,'canon','ezekiel',34,11,'free',
      E'*For thus saith Adonai Yahuah (the Lord GOD); Behold, I, even I, will both search my sheep, and seek them out* (Ezekiel 34:11). When the shepherds fail, Yahuah himself gathers — *And I will gather the remnant of my flock out of all countries whither I have driven them, and will bring them again to their folds* (Jeremiah 23:3) — exactly as Ezekiel promises: *I, even I, will both search my sheep, and seek them out*. The Shepherd of Yashar''el (Israel) seeks the scattered remnant with his own hand.'),
    ('canon','jeremiah',23,3,'canon','ezekiel',34,13,'free',
      E'*And I will bring them out from the people, and gather them from the countries, and will bring them to their own land, and feed them upon the mountains of Yashar''el (Israel) by the rivers* (Ezekiel 34:13). Jeremiah''s *I will gather the remnant of my flock out of all countries... and will bring them again to their folds* (Jeremiah 23:3) is Ezekiel''s gathering *from the countries... to their own land*. The same regathering of the scattered flock to its own folds — the two-house ingathering.'),
    ('canon','jeremiah',23,1,'canon','john',10,11,'free',
      E'*I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11). Against the pastors *that destroy and scatter the sheep of my pasture* (Jeremiah 23:1), the Formed Son sets himself the true Shepherd — *I am the good shepherd*, who unlike the hireling does not flee when *the wolf catcheth them, and scattereth the sheep* (John 10:12), but lays down his life for them. He is the answer to Jeremiah''s woe.'),
    ('canon','jeremiah',23,4,'canon','john',10,16,'free',
      E'*And other sheep I have, which are not of this fold: them also I must bring, and they shall hear my voice; and there shall be one fold, and one shepherd* (John 10:16). The promise *I will set up shepherds over them which shall feed them* (Jeremiah 23:4) reaches its end in the one Shepherd who gathers the scattered flock — including the *other sheep... not of this fold*, the dispersed northern house — into *one fold, and one shepherd*. The regathered remnant of Jeremiah 23:3-4 is the one flock of both houses.'),
    ('canon','jeremiah',23,1,'canon','matthew',9,36,'free',
      E'*But when he saw the multitudes, he was moved with compassion on them, because they fainted, and were scattered abroad, as sheep having no shepherd* (Matthew 9:36). The scattered flock of *the pastors that destroy and scatter the sheep of my pasture* (Jeremiah 23:1) stands before the Formed Son — *scattered abroad, as sheep having no shepherd*. His compassion on the shepherdless multitude is the gathering Jeremiah promised, now come.'),
    ('canon','jeremiah',23,1,'canon','zechariah',11,17,'free',
      E'*Woe to the idol shepherd that leaveth the flock! the sword shall be upon his arm, and upon his right eye* (Zechariah 11:17). Zechariah pronounces the same woe Jeremiah pronounces — *Woe be unto the pastors that destroy and scatter the sheep of my pasture!* (Jeremiah 23:1): the worthless shepherd who abandons the flock is cursed. The false shepherd and the idol shepherd are one and the same, judged by Yahuah.'),

    -- THREAD 2 (★★★): a righteous Branch raised unto David — his name YAHUAH TSIDKENU
    ('canon','jeremiah',23,5,'canon','zechariah',3,8,'free',
      E'*Hear now, O Joshua the high priest, thou, and thy fellows that sit before thee: for they are men wondered at: for, behold, I will bring forth my servant the BRANCH* (Zechariah 3:8). Zechariah names the very Branch Jeremiah names — *I will raise unto David a righteous Branch* (Jeremiah 23:5): *my servant the BRANCH*. The righteous Branch raised to David is Yahuah''s own Servant, the coming King.'),
    ('canon','jeremiah',23,5,'canon','zechariah',6,12,'free',
      E'*Behold the man whose name is The BRANCH; and he shall grow up out of his place, and he shall build the temple of Yahuah (LORD)* (Zechariah 6:12). The *righteous Branch* raised unto David (Jeremiah 23:5) is *the man whose name is The BRANCH* — who *shall grow up out of his place* and build Yahuah''s temple. The Branch-King who reigns and prospers is the temple-builder, the crowned Servant.'),
    ('canon','jeremiah',23,5,'canon','zechariah',6,13,'free',
      E'*Even he shall build the temple of Yahuah (LORD); and he shall bear the glory, and shall sit and rule upon his throne; and he shall be a priest upon his throne: and the counsel of peace shall be between them both* (Zechariah 6:13). The King who *shall reign and prosper, and shall execute judgment and justice in the earth* (Jeremiah 23:5) is the Branch who *shall bear the glory, and shall sit and rule upon his throne* — King and priest at once. The Branch of Jeremiah is the enthroned Branch of Zechariah.'),
    ('canon','jeremiah',23,5,'canon','isaiah',11,1,'free',
      E'*And there shall come forth a rod out of the stem of Jesse, and a Branch shall grow out of his roots* (Isaiah 11:1). Isaiah''s Branch out of Jesse''s roots is Jeremiah''s Branch raised unto David — *I will raise unto David a righteous Branch* (Jeremiah 23:5). The same Davidic shoot: the rod from Jesse, the righteous Branch, the King who reigns.'),
    ('canon','jeremiah',23,5,'canon','isaiah',11,4,'free',
      E'*But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth* (Isaiah 11:4). The King who *shall execute judgment and justice in the earth* (Jeremiah 23:5) is the Branch who *with righteousness shall... judge the poor*. Righteousness is the very name and rule of the Branch — *and this is his name... Yahuah Tsidkenu (THE LORD OUR RIGHTEOUSNESS)* (Jeremiah 23:6).'),
    ('canon','jeremiah',23,5,'canon','isaiah',4,2,'free',
      E'*In that day shall the branch of Yahuah (LORD) be beautiful and glorious, and the fruit of the earth shall be excellent and comely for them that are escaped of Yashar''el (Israel)* (Isaiah 4:2). Isaiah calls him *the branch of Yahuah (LORD)* — the Branch that belongs to and bears the Name — just as Jeremiah''s righteous Branch bears the name *Yahuah Tsidkenu* (Jeremiah 23:5-6). The Branch is Yahuah''s own, beautiful and glorious for the escaped remnant.'),
    ('canon','jeremiah',23,6,'canon','1-corinthians',1,30,'free',
      E'*But of him are ye in HaMashiach Yahusha (Christ Jesus), who of Elohim (God) is made unto us wisdom, and righteousness, and sanctification, and redemption* (1 Corinthians 1:30). The Branch whose name is *Yahuah Tsidkenu (THE LORD OUR RIGHTEOUSNESS)* (Jeremiah 23:6) is the One *made unto us... righteousness*: the Name is borne out — he is OUR righteousness. What Jeremiah names, Paul confesses: the Messiah himself is the righteousness of his people.'),
    ('canon','jeremiah',23,6,'canon','2-corinthians',5,21,'free',
      E'*For he hath made him to be sin for us, who knew no sin; that we might be made the righteousness of Elohim (God) in him* (2 Corinthians 5:21). The name *Yahuah Tsidkenu (THE LORD OUR RIGHTEOUSNESS)* (Jeremiah 23:6) is the very exchange Paul names — *that we might be made the righteousness of Elohim (God) in him*. The Branch who BEARS the Name is the One in whom his people are made righteous; his name is their righteousness.'),
    ('canon','jeremiah',23,5,'canon','luke',1,32,'free',
      E'*He shall be great, and shall be called the Son of the Highest: and Yahuah Elohim (the Lord God) shall give unto him the throne of his father David* (Luke 1:32). The Branch *raise(d) unto David* who *shall reign* (Jeremiah 23:5) is the One given *the throne of his father David* — *And he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:33). The Davidic Branch-King is enthroned over the whole house of Jacob, both houses, for ever.'),

    -- THREAD 3 (★): Yahuah liveth, which brought them from the north country — the second exodus
    ('canon','jeremiah',23,8,'canon','jeremiah',16,15,'free',
      E'*But, Yahuah (LORD) liveth, that brought up the children of Yashar''el (Israel) from the land of the north, and from all the lands whither he had driven them: and I will bring them again into their land that I gave unto their fathers* (Jeremiah 16:15). Jeremiah says it twice — the new oath that eclipses the Egypt-oath: *Yahuah (LORD) liveth, which brought up... the seed of the house of Yashar''el (Israel) out of the north country* (Jeremiah 23:8). The second exodus, the regathering from the north, becomes the new confession of the people.'),
    ('canon','jeremiah',23,8,'canon','isaiah',43,19,'free',
      E'*Behold, I will do a new thing; now it shall spring forth; shall ye not know it? I will even make a way in the wilderness, and rivers in the desert* (Isaiah 43:19). The regathering that makes them *no more say, Yahuah (LORD) liveth, which brought up the children of Yashar''el (Israel) out of the land of Egypt* (Jeremiah 23:7) is Isaiah''s *new thing* that outshines *the former things* (Isa 43:18). The second exodus from the north is the new work of Yahuah, greater than the first.'),
    ('canon','jeremiah',23,8,'canon','ezekiel',37,21,'free',
      E'*Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land* (Ezekiel 37:21). The promise *Yahuah (LORD) liveth, which brought up... the seed of the house of Yashar''el (Israel) out of the north country, and from all countries whither I had driven them; and they shall dwell in their own land* (Jeremiah 23:8) is Ezekiel''s gathering of the children from the heathen into their own land. The same two-house ingathering — the scattered house brought home.'),

    -- THREAD 4 (★★): they speak a vision of their own heart — I have not sent these prophets
    ('canon','jeremiah',23,16,'canon','ezekiel',13,3,'free',
      E'*Thus saith Adonai Yahuah (the Lord GOD); Woe unto the foolish prophets, that follow their own spirit, and have seen nothing!* (Ezekiel 13:3). Ezekiel''s woe is Jeremiah''s charge: the prophets who *speak a vision of their own heart, and not out of the mouth of Yahuah (LORD)* (Jeremiah 23:16) are those who *follow their own spirit, and have seen nothing*. Self-sourced prophecy — the heart''s own vision passed off as Yahuah''s word — is condemned in both.'),
    ('canon','jeremiah',23,21,'canon','ezekiel',13,6,'free',
      E'*They have seen vanity and lying divination, saying, Yahuah (LORD) saith: and Yahuah (LORD) hath not sent them: and they have made others to hope that they would confirm the word* (Ezekiel 13:6). Jeremiah''s *I have not sent these prophets, yet they ran: I have not spoken to them, yet they prophesied* (Jeremiah 23:21) is Ezekiel''s *Yahuah (LORD) hath not sent them*. The mark of the false prophet is the unsent errand — running and speaking what Yahuah never gave.'),
    ('canon','jeremiah',23,21,'canon','deuteronomy',18,20,'free',
      E'*But the prophet, which shall presume to speak a word in my name, which I have not commanded him to speak, or that shall speak in the name of other gods, even that prophet shall die* (Deuteronomy 18:20). The Torah set the test long before: the prophet who runs unsent — *I have not sent these prophets, yet they ran* (Jeremiah 23:21) — and presumes *to speak a word in my name, which I have not commanded* is the prophet the Torah condemns to death. Jeremiah measures the prophets of his day by this word.'),
    ('canon','jeremiah',23,16,'canon','matthew',7,15,'free',
      E'*Beware of false prophets, which come to you in sheep''s clothing, but inwardly they are ravening wolves* (Matthew 7:15). The warning *Hearken not unto the words of the prophets that prophesy unto you: they make you vain* (Jeremiah 23:16) is the Messiah''s warning — *Beware of false prophets... ravening wolves*. The prophets who speak their own heart''s vision, smooth and flattering, are the wolves in the flock.'),
    ('canon','jeremiah',23,25,'canon','2-peter',2,1,'free',
      E'*But there were false prophets also among the people, even as there shall be false teachers among you, who privily shall bring in damnable heresies, even denying Yahuah (Lord) that bought them* (2 Peter 2:1). The dreamers who *prophesy lies in my name, saying, I have dreamed, I have dreamed* (Jeremiah 23:25) are Peter''s *false prophets... among the people* — the lying dream still creeps in as *false teachers... damnable heresies*. The unsent voice runs in every age, and the test is unchanged.'),

    -- THREAD 5 (★★): is not my word like as a fire? and like a hammer that breaketh the rock
    ('canon','jeremiah',23,29,'canon','hebrews',4,12,'free',
      E'*For the word of Elohim (God) is quick, and powerful, and sharper than any twoedged sword, piercing even to the dividing asunder of soul and spirit... and is a discerner of the thoughts and intents of the heart* (Hebrews 4:12). Jeremiah''s *Is not my word like as a fire?... and like a hammer that breaketh the rock in pieces?* (Jeremiah 23:29) is the same living word Hebrews names — *quick, and powerful, and sharper than any twoedged sword*. The word that is fire and hammer is the word that pierces and discerns the heart, against which the chaff of false dreams cannot stand.'),
    ('canon','jeremiah',23,28,'canon','luke',3,17,'free',
      E'*Whose fan is in his hand, and he will throughly purge his floor, and will gather the wheat into his garner; but the chaff he will burn with fire unquenchable* (Luke 3:17). Jeremiah''s *What is the chaff to the wheat? saith Yahuah (LORD)* (Jeremiah 23:28) is answered at the threshing-floor of the Messiah — the wheat gathered, *the chaff he will burn with fire unquenchable*. The false dreams are the chaff; the faithful word is the wheat, and the two are finally parted.'),
    ('canon','jeremiah',23,29,'canon','isaiah',55,11,'free',
      E'*So shall my word be that goeth forth out of my mouth: it shall not return unto me void, but it shall accomplish that which I please, and it shall prosper in the thing whereto I sent it* (Isaiah 55:11). The word that is *like as a fire... and like a hammer that breaketh the rock in pieces* (Jeremiah 23:29) is the word that *shall not return unto me void*. Yahuah''s true word does its work — fire, hammer, accomplishing — where the prophets'' own dreams do nothing.'),
    ('canon','jeremiah',23,28,'canon','psalms',12,6,'free',
      E'*The words of Yahuah (LORD) are pure words: as silver tried in a furnace of earth, purified seven times* (Psalm 12:6). Against the chaff of false dreams, *he that hath my word, let him speak my word faithfully* (Jeremiah 23:28) — for *the words of Yahuah (LORD) are pure words*, refined silver. The pure word faithfully spoken is set apart from the prophet''s own corrupt invention.'),

    -- THREAD 6 (★): Am I a Elohim at hand, and not a Elohim afar off? — omnipresence
    ('canon','jeremiah',23,24,'canon','psalms',139,7,'free',
      E'*Whither shall I go from thy spirit? or whither shall I flee from thy presence?* (Psalm 139:7). Jeremiah''s *Can any hide himself in secret places that I shall not see him?... Do not I fill heaven and earth?* (Jeremiah 23:24) is the Psalm''s wonder — there is no fleeing from Yahuah''s presence: *If I ascend up into heaven, thou art there* (Ps 139:8). The lying prophet''s secret heart is open before the Elohim (God) who fills heaven and earth.'),
    ('canon','jeremiah',23,24,'canon','1-kings',8,27,'free',
      E'*But will Elohim (God) indeed dwell on the earth? behold, the heaven and heaven of heavens cannot contain thee; how much less this house that I have builded?* (1 Kings 8:27). Solomon confesses what Jeremiah declares — *Do not I fill heaven and earth? saith Yahuah (LORD)* (Jeremiah 23:24): the Elohim (God) whom *the heaven of heavens cannot contain* is the Elohim near and afar off, present everywhere, hid from by none.'),
    ('canon','jeremiah',23,23,'canon','acts',17,27,'free',
      E'*That they should seek Yahuah (Lord), if haply they might feel after him, and find him, though he be not far from every one of us* (Acts 17:27). Jeremiah''s *Am I a Elohim (God) at hand, saith Yahuah (LORD), and not a Elohim (God) afar off?* (Jeremiah 23:23) is Paul''s preaching — Yahuah *be not far from every one of us; For in him we live, and move, and have our being* (Acts 17:27-28). The Elohim near and afar off is the One in whom all things live; none can escape his presence.'),
    ('canon','jeremiah',23,23,'canon','acts',17,28,'free',
      E'*For in him we live, and move, and have our being; as certain also of your own poets have said, For we are also his offspring* (Acts 17:28). The Elohim (God) *at hand... and... afar off* who *fill(s) heaven and earth* (Jeremiah 23:23-24) is the One *in (whom) we live, and move, and have our being*. There is no secret place outside him; his nearness is the ground of all existence.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s309_jer23_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s309_jer23_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-23-woe-unto-the-pastors-that-scatter-the-flock-regathered',
       E'Woe unto the pastors that scatter the sheep of my pasture — the remnant regathered',
       E'The chapter opens on the false shepherds and the scattered flock: *Woe be unto the pastors that destroy and scatter the sheep of my pasture! saith Yahuah (LORD)* (23:1); *Ye have scattered my flock, and driven them away, and have not visited them: behold, I will visit upon you the evil of your doings* (23:2). Then Yahuah takes the flock into his own hand: *And I will gather the remnant of my flock out of all countries whither I have driven them, and will bring them again to their folds; and they shall be fruitful and increase. And I will set up shepherds over them which shall feed them: and they shall fear no more, nor be dismayed* (23:3-4). This is the twin of Ezekiel 34 — *Woe be to the shepherds of Yashar''el (Israel) that do feed themselves! should not the shepherds feed the flocks?* (Ezekiel 34:2); *my flock was scattered upon all the face of the earth, and none did search or seek after them* (34:6); and the same answer, *Behold, I, even I, will both search my sheep, and seek them out* (34:11), *and will bring them to their own land* (34:13). The Formed Son speaks it of himself: *I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11) — and he gathers the scattered into one: *other sheep I have, which are not of this fold: them also I must bring... and there shall be one fold, and one shepherd* (John 10:16), the two-house flock made one. Matthew sees the shepherdless multitude — *they fainted, and were scattered abroad, as sheep having no shepherd* (Matthew 9:36) — and Zechariah the worthless one: *Woe to the idol shepherd that leaveth the flock!* (Zechariah 11:17). The pastors who scatter are judged; the Shepherd of Yashar''el (Israel) gathers his remnant home.',
       sv.verse_id, ev.verse_id, 'free', 34550
  FROM _s309_jer23_lookup sv, _s309_jer23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=23 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-23-a-righteous-branch-whose-name-is-yahuah-tsidkenu',
       E'I will raise unto David a righteous Branch — and his name is Yahuah Tsidkenu (THE LORD OUR RIGHTEOUSNESS)',
       E'Here is the keystone of the chapter — the Davidic Branch-King who bears the Name: *Behold, the days come, saith Yahuah (LORD), that I will raise unto David a righteous Branch, and a King shall reign and prosper, and shall execute judgment and justice in the earth. In his days Yahudah (Judah) shall be saved, and Yashar''el (Israel) shall dwell safely: and this is his name whereby he shall be called, Yahuah Tsidkenu (THE LORD OUR RIGHTEOUSNESS)* (23:5-6). Mark the two-house frame — BOTH houses saved, *Yahudah (Judah)* AND *Yashar''el (Israel)* — and mark the Name: the Branch is called *Yahuah Tsidkenu*, Yahuah our Righteousness. This is the Formed Son, Yahuah who has a Father, the visible Branch drawn from the Source, who bears the Name and is himself our righteousness. Zechariah names the same Branch twice: *behold, I will bring forth my servant the BRANCH* (Zechariah 3:8); *Behold the man whose name is The BRANCH; and he shall grow up out of his place, and he shall build the temple of Yahuah (LORD)... and he shall bear the glory, and shall sit and rule upon his throne; and he shall be a priest upon his throne* (Zechariah 6:12-13). Isaiah sees the Branch from Jesse''s root, judging in righteousness: *a Branch shall grow out of his roots... with righteousness shall he judge the poor* (Isaiah 11:1,4), *the branch of Yahuah (LORD) be beautiful and glorious* (Isaiah 4:2). And the Name borne is confessed in the New Testament: the Messiah *of Elohim (God) is made unto us wisdom, and righteousness* (1 Corinthians 1:30); *he hath made him to be sin for us, who knew no sin; that we might be made the righteousness of Elohim (God) in him* (2 Corinthians 5:21); and he is given *the throne of his father David... and he shall reign over the house of Jacob for ever* (Luke 1:32-33). YAHUAH TSIDKENU — the Branch is the Name, and the Name is the righteousness of his two-house people.',
       sv.verse_id, ev.verse_id, 'free', 34553
  FROM _s309_jer23_lookup sv, _s309_jer23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=23 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-23-yahuah-liveth-that-brought-them-from-the-north-country',
       E'Yahuah liveth, which brought up the seed of Yashar''el out of the north country — the second exodus',
       E'The Branch-King''s days bring a regathering so great it becomes the new confession of the people, eclipsing the first exodus: *Therefore, behold, the days come, saith Yahuah (LORD), that they shall no more say, Yahuah (LORD) liveth, which brought up the children of Yashar''el (Israel) out of the land of Egypt; But, Yahuah (LORD) liveth, which brought up and which led the seed of the house of Yashar''el (Israel) out of the north country, and from all countries whither I had driven them; and they shall dwell in their own land* (23:7-8). The greater ingathering — out of the north — outshines the deliverance from Egypt. Jeremiah says it again word for word: *Yahuah (LORD) liveth, that brought up the children of Yashar''el (Israel) from the land of the north... and I will bring them again into their land that I gave unto their fathers* (Jeremiah 16:15). Isaiah names it the new thing that dwarfs the old: *Remember ye not the former things, neither consider the things of old. Behold, I will do a new thing; now it shall spring forth* (Isaiah 43:18-19). And Ezekiel sees the same gathering: *I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land* (Ezekiel 37:21). The second exodus is the ingathering of the two-house people, the scattered seed of the house of Yashar''el (Israel) brought home from the north.',
       sv.verse_id, ev.verse_id, 'free', 34556
  FROM _s309_jer23_lookup sv, _s309_jer23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=23 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-23-they-speak-a-vision-of-their-own-heart-i-sent-them-not',
       E'They speak a vision of their own heart — I have not sent these prophets, yet they ran',
       E'Against the false shepherds stand the false prophets, and Yahuah lays bare their unsent errand: *Thus saith Yahuah Tseva''ot (LORD of hosts), Hearken not unto the words of the prophets that prophesy unto you: they make you vain: they speak a vision of their own heart, and not out of the mouth of Yahuah (LORD)* (23:16); *I have not sent these prophets, yet they ran: I have not spoken to them, yet they prophesied* (23:21); *I have heard what the prophets said, that prophesy lies in my name, saying, I have dreamed, I have dreamed* (23:25). The mark of the lying prophet is the self-sourced word — the heart''s own vision and the night''s own dream passed off as Yahuah''s. The lateral twin is Ezekiel 13: *Woe unto the foolish prophets, that follow their own spirit, and have seen nothing!* (Ezekiel 13:3); *Yahuah (LORD) hath not sent them* (13:6). The Torah set the test long before: *the prophet, which shall presume to speak a word in my name, which I have not commanded him to speak... even that prophet shall die* (Deuteronomy 18:20). And the Messiah warns of the same in his own day: *Beware of false prophets, which come to you in sheep''s clothing, but inwardly they are ravening wolves* (Matthew 7:15); and Peter: *there shall be false teachers among you, who privily shall bring in damnable heresies* (2 Peter 2:1). Yahuah''s verdict on the stolen word runs to the end of the chapter — *I am against the prophets... that steal my words every one from his neighbour* (23:30), who pervert *the burden of Yahuah (LORD)* until he must *utterly forget* them (23:36,39). The unsent voice profits the people nothing; the test is the true word.',
       sv.verse_id, ev.verse_id, 'free', 34559
  FROM _s309_jer23_lookup sv, _s309_jer23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=23 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-23-is-not-my-word-like-as-a-fire-and-like-a-hammer',
       E'Is not my word like as a fire? and like a hammer that breaketh the rock in pieces?',
       E'Set against the chaff of false dreams is the power and purity of Yahuah''s true word: *The prophet that hath a dream, let him tell a dream; and he that hath my word, let him speak my word faithfully. What is the chaff to the wheat? saith Yahuah (LORD). Is not my word like as a fire? saith Yahuah (LORD); and like a hammer that breaketh the rock in pieces?* (23:28-29). The dreams are chaff; the true word is wheat — fire and hammer, burning and breaking, where the prophets'' own inventions do nothing. Hebrews names the same living word: *the word of Elohim (God) is quick, and powerful, and sharper than any twoedged sword, piercing even to the dividing asunder of soul and spirit... and is a discerner of the thoughts and intents of the heart* (Hebrews 4:12). John the Baptist parts the wheat from the chaff: *Whose fan is in his hand, and he will throughly purge his floor, and will gather the wheat into his garner; but the chaff he will burn with fire unquenchable* (Luke 3:17). Isaiah swears the word never fails: *So shall my word be that goeth forth out of my mouth: it shall not return unto me void, but it shall accomplish that which I please* (Isaiah 55:11). And the Psalm names its purity: *The words of Yahuah (LORD) are pure words: as silver tried in a furnace of earth, purified seven times* (Psalm 12:6). The faithful word — fire, hammer, refined silver — exposes and outlasts every dream the unsent prophet tells.',
       sv.verse_id, ev.verse_id, 'free', 34562
  FROM _s309_jer23_lookup sv, _s309_jer23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=28
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=23 AND ev.verse_number=29
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-23-am-i-a-elohim-at-hand-and-not-a-elohim-afar-off',
       E'Am I a Elohim at hand, and not a Elohim afar off? Do not I fill heaven and earth?',
       E'In the midst of the false-prophet oracle, Yahuah declares his omnipresence — no secret heart and no secret place is hid from him: *Am I a Elohim (God) at hand, saith Yahuah (LORD), and not a Elohim (God) afar off? Can any hide himself in secret places that I shall not see him? saith Yahuah (LORD). Do not I fill heaven and earth? saith Yahuah (LORD)?* (23:23-24). The lying prophet who dreams in his own heart imagines Yahuah does not see; but the Elohim (God) who fills heaven and earth sees the secret place. The Psalm sings the same wonder: *Whither shall I go from thy spirit? or whither shall I flee from thy presence? If I ascend up into heaven, thou art there: if I make my bed in hell, behold, thou art there* (Psalm 139:7-8). Solomon prays it at the temple: *behold, the heaven and heaven of heavens cannot contain thee; how much less this house that I have builded?* (1 Kings 8:27). And Paul preaches it at Athens: Yahuah *be not far from every one of us: For in him we live, and move, and have our being* (Acts 17:27-28). The Elohim near and afar off fills all — there is no hiding from him, and no false word escapes his ear.',
       sv.verse_id, ev.verse_id, 'free', 34565
  FROM _s309_jer23_lookup sv, _s309_jer23_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=23 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Woe be to the shepherds of Yashar''el (Israel) that do feed themselves!* (Ezekiel 34:2) — Ezekiel''s woe is Jeremiah''s woe (23:1); the self-feeding shepherds judged in both.'
  FROM cross_reference_threads t
  JOIN _s309_jer23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=1
  JOIN _s309_jer23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-23-woe-unto-the-pastors-that-scatter-the-flock-regathered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *my flock was scattered... and none did search or seek after them* (Ezekiel 34:6) — the scattering charged in Jeremiah 23:2; the flock driven away, none seeking.'
  FROM cross_reference_threads t
  JOIN _s309_jer23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=2
  JOIN _s309_jer23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-23-woe-unto-the-pastors-that-scatter-the-flock-regathered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *I, even I, will both search my sheep, and seek them out* (Ezekiel 34:11) — when the shepherds fail, Yahuah gathers his own remnant (Jeremiah 23:3).'
  FROM cross_reference_threads t
  JOIN _s309_jer23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=3
  JOIN _s309_jer23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-23-woe-unto-the-pastors-that-scatter-the-flock-regathered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *gather them from the countries, and will bring them to their own land* (Ezekiel 34:13) — Ezekiel''s gathering is Jeremiah''s *out of all countries... again to their folds* (23:3).'
  FROM cross_reference_threads t
  JOIN _s309_jer23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=3
  JOIN _s309_jer23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-23-woe-unto-the-pastors-that-scatter-the-flock-regathered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *I am the good shepherd: the good shepherd giveth his life for the sheep* (John 10:11) — the Formed Son is the answer to Jeremiah''s woe (23:1); the true Shepherd against the scattering pastors.'
  FROM cross_reference_threads t
  JOIN _s309_jer23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=1
  JOIN _s309_jer23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-23-woe-unto-the-pastors-that-scatter-the-flock-regathered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★ *other sheep I have, which are not of this fold... one fold, and one shepherd* (John 10:16) — the shepherds set up (Jeremiah 23:4) end in the one Shepherd gathering both houses into one flock.'
  FROM cross_reference_threads t
  JOIN _s309_jer23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=4
  JOIN _s309_jer23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-23-woe-unto-the-pastors-that-scatter-the-flock-regathered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *scattered abroad, as sheep having no shepherd* (Matthew 9:36) — the shepherdless flock of Jeremiah 23:1 stands before the Formed Son, moved with compassion.'
  FROM cross_reference_threads t
  JOIN _s309_jer23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=1
  JOIN _s309_jer23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=9 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-23-woe-unto-the-pastors-that-scatter-the-flock-regathered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *Woe to the idol shepherd that leaveth the flock!* (Zechariah 11:17) — the worthless shepherd cursed; the same woe as Jeremiah 23:1, the false shepherd judged.'
  FROM cross_reference_threads t
  JOIN _s309_jer23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=1
  JOIN _s309_jer23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=11 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-23-woe-unto-the-pastors-that-scatter-the-flock-regathered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *behold, I will bring forth my servant the BRANCH* (Zechariah 3:8) — the righteous Branch raised unto David (23:5) is Yahuah''s own Servant the BRANCH.'
  FROM cross_reference_threads t
  JOIN _s309_jer23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=5
  JOIN _s309_jer23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=3 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-23-a-righteous-branch-whose-name-is-yahuah-tsidkenu'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *the man whose name is The BRANCH... he shall build the temple of Yahuah (LORD)* (Zechariah 6:12) — the Branch-King who reigns (23:5) is the temple-builder grown up out of his place.'
  FROM cross_reference_threads t
  JOIN _s309_jer23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=5
  JOIN _s309_jer23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=6 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-23-a-righteous-branch-whose-name-is-yahuah-tsidkenu'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *he shall bear the glory, and shall sit and rule upon his throne; and he shall be a priest upon his throne* (Zechariah 6:13) — the King who reigns and prospers (23:5) is the enthroned Branch, King and priest.'
  FROM cross_reference_threads t
  JOIN _s309_jer23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=5
  JOIN _s309_jer23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=6 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-23-a-righteous-branch-whose-name-is-yahuah-tsidkenu'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *a Branch shall grow out of his roots* (Isaiah 11:1) — Isaiah''s Branch out of Jesse is Jeremiah''s righteous Branch raised unto David (23:5).'
  FROM cross_reference_threads t
  JOIN _s309_jer23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=5
  JOIN _s309_jer23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-23-a-righteous-branch-whose-name-is-yahuah-tsidkenu'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *with righteousness shall he judge the poor* (Isaiah 11:4) — the King who executes judgment and justice (23:5) judges in righteousness; the Branch''s rule is his Name.'
  FROM cross_reference_threads t
  JOIN _s309_jer23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=5
  JOIN _s309_jer23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-23-a-righteous-branch-whose-name-is-yahuah-tsidkenu'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *the branch of Yahuah (LORD) be beautiful and glorious* (Isaiah 4:2) — Isaiah names him the Branch of Yahuah, Yahuah''s own; as Jeremiah''s Branch bears the Name Yahuah Tsidkenu (23:6).'
  FROM cross_reference_threads t
  JOIN _s309_jer23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=5
  JOIN _s309_jer23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=4 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-23-a-righteous-branch-whose-name-is-yahuah-tsidkenu'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★★ *of Elohim (God) is made unto us... righteousness* (1 Corinthians 1:30) — the Name Yahuah Tsidkenu (23:6) borne out: the Messiah is made OUR righteousness.'
  FROM cross_reference_threads t
  JOIN _s309_jer23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=6
  JOIN _s309_jer23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=1 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-23-a-righteous-branch-whose-name-is-yahuah-tsidkenu'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★★ *that we might be made the righteousness of Elohim (God) in him* (2 Corinthians 5:21) — Yahuah Tsidkenu (23:6): his people are made righteous IN the Branch who bears the Name.'
  FROM cross_reference_threads t
  JOIN _s309_jer23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=6
  JOIN _s309_jer23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=5 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-23-a-righteous-branch-whose-name-is-yahuah-tsidkenu'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'★ *Yahuah Elohim (the Lord God) shall give unto him the throne of his father David* (Luke 1:32) — the Branch raised unto David who reigns (23:5) is given the Davidic throne, reigning over Jacob for ever (Luke 1:33).'
  FROM cross_reference_threads t
  JOIN _s309_jer23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=5
  JOIN _s309_jer23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-23-a-righteous-branch-whose-name-is-yahuah-tsidkenu'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Yahuah (LORD) liveth, that brought up the children of Yashar''el (Israel) from the land of the north* (Jeremiah 16:15) — the same saying; the second-exodus oath out of the north.'
  FROM cross_reference_threads t
  JOIN _s309_jer23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=8
  JOIN _s309_jer23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=16 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-23-yahuah-liveth-that-brought-them-from-the-north-country'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Behold, I will do a new thing* (Isaiah 43:19) — the regathering that eclipses the Egypt-exodus (23:7) is Isaiah''s new thing, greater than the former.'
  FROM cross_reference_threads t
  JOIN _s309_jer23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=8
  JOIN _s309_jer23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-23-yahuah-liveth-that-brought-them-from-the-north-country'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *I will take the children of Yashar''el (Israel) from among the heathen... and bring them into their own land* (Ezekiel 37:21) — the same ingathering of the scattered house, out of the nations home.'
  FROM cross_reference_threads t
  JOIN _s309_jer23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=8
  JOIN _s309_jer23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-23-yahuah-liveth-that-brought-them-from-the-north-country'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Woe unto the foolish prophets, that follow their own spirit, and have seen nothing!* (Ezekiel 13:3) — the lateral twin of *a vision of their own heart* (23:16); self-sourced prophecy condemned.'
  FROM cross_reference_threads t
  JOIN _s309_jer23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=16
  JOIN _s309_jer23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=13 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-23-they-speak-a-vision-of-their-own-heart-i-sent-them-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Yahuah (LORD) hath not sent them* (Ezekiel 13:6) — the mark of the false prophet, the unsent errand; Jeremiah''s *I have not sent these prophets, yet they ran* (23:21).'
  FROM cross_reference_threads t
  JOIN _s309_jer23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=21
  JOIN _s309_jer23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=13 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-23-they-speak-a-vision-of-their-own-heart-i-sent-them-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *the prophet, which shall presume to speak a word in my name, which I have not commanded him... even that prophet shall die* (Deuteronomy 18:20) — the Torah test for the unsent prophet of 23:21.'
  FROM cross_reference_threads t
  JOIN _s309_jer23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=21
  JOIN _s309_jer23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=18 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-23-they-speak-a-vision-of-their-own-heart-i-sent-them-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *Beware of false prophets... inwardly they are ravening wolves* (Matthew 7:15) — the Messiah''s warning; the prophets who make you vain (23:16) are the wolves in sheep''s clothing.'
  FROM cross_reference_threads t
  JOIN _s309_jer23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=16
  JOIN _s309_jer23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-23-they-speak-a-vision-of-their-own-heart-i-sent-them-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *there shall be false teachers among you, who privily shall bring in damnable heresies* (2 Peter 2:1) — the lying dreamers of 23:25 run in every age as false teachers.'
  FROM cross_reference_threads t
  JOIN _s309_jer23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=25
  JOIN _s309_jer23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=2 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-23-they-speak-a-vision-of-their-own-heart-i-sent-them-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *the word of Elohim (God) is quick, and powerful, and sharper than any twoedged sword* (Hebrews 4:12) — the word like fire and hammer (23:29) is the living word that pierces and discerns the heart.'
  FROM cross_reference_threads t
  JOIN _s309_jer23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=29
  JOIN _s309_jer23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=4 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-23-is-not-my-word-like-as-a-fire-and-like-a-hammer'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *the chaff he will burn with fire unquenchable* (Luke 3:17) — Jeremiah''s *What is the chaff to the wheat?* (23:28) answered at the Messiah''s threshing-floor; wheat and chaff parted.'
  FROM cross_reference_threads t
  JOIN _s309_jer23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=28
  JOIN _s309_jer23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=3 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-23-is-not-my-word-like-as-a-fire-and-like-a-hammer'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *my word... shall not return unto me void, but it shall accomplish that which I please* (Isaiah 55:11) — the fire-and-hammer word (23:29) does its work, where false dreams do nothing.'
  FROM cross_reference_threads t
  JOIN _s309_jer23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=29
  JOIN _s309_jer23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-23-is-not-my-word-like-as-a-fire-and-like-a-hammer'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *The words of Yahuah (LORD) are pure words: as silver tried in a furnace... purified seven times* (Psalm 12:6) — *speak my word faithfully* (23:28); the pure word set apart from the prophet''s own invention.'
  FROM cross_reference_threads t
  JOIN _s309_jer23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=28
  JOIN _s309_jer23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=12 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-23-is-not-my-word-like-as-a-fire-and-like-a-hammer'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Whither shall I go from thy spirit? or whither shall I flee from thy presence?* (Psalm 139:7) — Jeremiah''s no-hiding (23:24); there is no fleeing from Yahuah''s presence.'
  FROM cross_reference_threads t
  JOIN _s309_jer23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=24
  JOIN _s309_jer23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=139 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-23-am-i-a-elohim-at-hand-and-not-a-elohim-afar-off'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *the heaven and heaven of heavens cannot contain thee* (1 Kings 8:27) — Solomon confesses what Jeremiah declares: the Elohim (God) who fills heaven and earth (23:24).'
  FROM cross_reference_threads t
  JOIN _s309_jer23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=24
  JOIN _s309_jer23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=8 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-23-am-i-a-elohim-at-hand-and-not-a-elohim-afar-off'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *he be not far from every one of us* (Acts 17:27) — Paul preaches the Elohim near and afar off (23:23), in whom all things live.'
  FROM cross_reference_threads t
  JOIN _s309_jer23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=23
  JOIN _s309_jer23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=17 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-23-am-i-a-elohim-at-hand-and-not-a-elohim-afar-off'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *For in him we live, and move, and have our being* (Acts 17:28) — the omnipresent Elohim (23:23-24) is the ground of all existence; no secret place outside him.'
  FROM cross_reference_threads t
  JOIN _s309_jer23_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=23 AND sv.verse_number=23
  JOIN _s309_jer23_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=17 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-23-am-i-a-elohim-at-hand-and-not-a-elohim-afar-off'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jeremiah_31.sql (Jeremiah 31) -----
-- Chapter: Jeremiah 31 — ★★★ THE KEYSTONE of the book: the NEW COVENANT. *I will put my law in their
-- inward parts, and write it in their hearts* — the SAME Torah internalized, made with BOTH houses
-- (the house of Yashar''el AND the house of Yahudah), sins forgiven and remembered no more. Around it:
-- the everlasting love that gathers Ephraim home (Ephraim my firstborn, my dear son); He that scattered
-- Yashar''el will gather him as a shepherd doth his flock (the two-house regathering, the watered garden,
-- sorrow no more); Rahel weeping in Ramah for her children (answered forward at Bethlehem); the hope after
-- the weeping (thy children shall come again to their own border); and the new thing Yahuah created —
-- a woman shall compass a man. This chapter IS the new-covenant doctrine: the Torah written on the heart,
-- NEVER the Torah abolished — the opposite of antinomianism.
-- Tag: jer31   Temp view: _s309_jer31_lookup
-- Sort band: base 34750, step 3 -> 34750, 34753, 34756, 34759, 34762, 34765 (6 threads)
-- Source of EVERY row: 'canon','jeremiah',31,v
--
-- Jeremiah 31 coverage:
--   ★★ v.1-3 (I will be the Elohim of all the families of Yashar''el; found grace in the wilderness;
--          I have loved thee with an everlasting love; with lovingkindness have I drawn thee)
--        NT:     ★★ Romans 11:28-29 (beloved for the fathers'' sakes... the gifts and calling of Elohim
--                are without repentance) — THREAD 2
--        Extras: none warranted
--        Tanakh: ★★ Hosea 11:1 (when Yashar''el was a child, then I loved him), ★★ Hosea 11:8 (how shall
--                I give thee up, Ephraim?) — THREAD 2
--   v.4-8 (build thee again, O virgin of Yashar''el; vines on the mountains of Samaria; watchmen on mount
--          Ephraim; bring them from the north country; the remnant of Yashar''el; a great company)
--        NT:     none warranted distinct (the regathering held in THREAD 3; Ephraim/firstborn in THREAD 2)
--        Extras: none warranted
--        Tanakh: held in prose — the northern remnant (Ephraim/Samaria) gathered; bound to THREAD 2 / 3
--   ★★ v.9 (with weeping... I will lead them... for I am a father to Yashar''el, and Ephraim is my firstborn)
--        NT:     held in THREAD 2 (the Father-love of Ephraim)
--        Extras: none warranted
--        Tanakh: ★★ Hosea 11:1 (called my son out of Egypt) — THREAD 2
--   ★★ v.10-14 (He that scattered Yashar''el will gather him, and keep him, as a shepherd doth his flock;
--          come and sing in the height of Zion; their soul as a watered garden; not sorrow any more at all)
--        NT:     ★★ John 11:52 (gather together in one the children of Elohim that were scattered abroad),
--                ★ Revelation 7:17 (the Lamb... shall feed them, and... wipe away all tears) — THREAD 3
--        Extras: none warranted
--        Tanakh: ★★ Ezekiel 34:12 (so will I seek out my sheep, and will deliver them — lateral), ★ Isaiah
--                40:11 (he shall feed his flock like a shepherd) — THREAD 3
--   ★★ v.15 (A voice was heard in Ramah, lamentation, and bitter weeping; Rahel weeping for her children)
--        NT:     ★★★ Matthew 2:18 (In Rama was there a voice heard... Rachel weeping for her children),
--                ★ Matthew 2:17 (Then was fulfilled that which was spoken by Jeremy the prophet) — THREAD 4
--        Extras: none warranted
--        Tanakh: none separate (the weeping; the hope that answers it is v.16-17, THREAD 5)
--   ★ v.16-17 (Refrain thy voice from weeping... thy work shall be rewarded... there is hope in thine end...
--          thy children shall come again to their own border)
--        NT:     ★ Hebrews 11:1 (faith... the evidence of things not seen), ★ Romans 8:24-25 (we are saved
--                by hope) — THREAD 5
--        Extras: none warranted
--        Tanakh: ★ Psalm 126:5-6 (they that sow in tears shall reap in joy... come again with rejoicing) — THREAD 5
--   v.18-21 (Ephraim bemoaning himself; turn thou me, and I shall be turned; is Ephraim my dear son?...
--          I will surely have mercy upon him; turn again, O virgin of Yashar''el)
--        NT:     ★ Luke 15:20 (the father saw him... and ran, and fell on his neck — the prodigal) — THREAD 2
--        Extras: none warranted
--        Tanakh: ★★ Hosea 11:8 (mine heart is turned within me — the Father''s mercy on Ephraim) — THREAD 2
--   ★ v.22 (How long wilt thou go about, O thou backsliding daughter? Yahuah hath created a new thing in
--          the earth, A woman shall compass a man)
--        NT:     ★ Galatians 4:4 (Elohim sent forth his Son, made of a woman) — THREAD 6 (framed modestly)
--        Extras: none warranted
--        Tanakh: ★ Isaiah 43:19 (Behold, I will do a new thing; now it shall spring forth) — THREAD 6
--   v.23-26 (the cities of Yahudah; bring again their captivity; Yahuah bless thee, O habitation of justice;
--          I have satiated the weary soul; my sleep was sweet) — the restored land of Yahudah
--        NT:     none warranted     Extras: none warranted
--        Tanakh: held in prose — the southern house (Yahudah) restored alongside the northern (THREAD 3)
--   v.27-30 (sow the house of Yashar''el and the house of Yahudah with the seed of man; watch over them to
--          build and to plant; every one shall die for his own iniquity)
--        NT:     none warranted distinct (the individual-responsibility word answered fully at Ezekiel 18;
--                held there, not forced here)
--        Extras: none warranted
--        Tanakh: held in prose — the both-houses rebuilding leads into the new-covenant oracle of v.31-34
--   ★★★ v.31-34 (Behold, the days come... I will make a new covenant with the house of Yashar''el and with
--          the house of Yahudah... I will put my law in their inward parts, and write it in their hearts;
--          and will be their Elohim, and they shall be my people... they shall all know me... I will forgive
--          their iniquity, and I will remember their sin no more)
--        NT:     ★★★ Hebrews 8:8 (I will make a new covenant with the house of Yashar''el and with the house
--                of Yahudah — the fullest NT quotation), ★★★ Hebrews 8:10 (I will put my laws into their mind,
--                and write them in their hearts), ★★ Hebrews 8:12 (their sins... will I remember no more),
--                ★★ Hebrews 10:16 (I will put my laws into their hearts, and in their minds will I write them),
--                ★★ Hebrews 10:17 (their sins and iniquities will I remember no more), ★★ 2 Corinthians 3:3
--                (written... in fleshy tables of the heart), ★ Romans 11:27 (this is my covenant unto them,
--                when I shall take away their sins) — THREAD 1
--        Extras: none warranted (clean canon-NT weave; the new covenant is the library''s spine, no extra forced)
--        Tanakh: ★★ Ezekiel 36:26 (a new heart also will I give you), ★★ Ezekiel 36:27 (I will put my spirit
--                within you, and cause you to walk in my statutes — the twin promise) — THREAD 1
--   v.35-37 (the ordinances of sun, moon, stars; if those ordinances depart... then the seed of Yashar''el
--          also shall cease from being a nation — the irrevocable election)
--        NT:     none warranted distinct (the irrevocable calling answered by Romans 11:29 in THREAD 2)
--        Extras: none warranted
--        Tanakh: held in prose — the seed of Yashar''el shall not cease before Yahuah for ever (sealing the
--                two-house regathering of THREAD 3 and the everlasting love of THREAD 2)
--   v.38-40 (the city shall be built to Yahuah... it shall not be plucked up, nor thrown down any more for
--          ever — the holy city restored) — the rebuilt, never-uprooted city
--        NT:     none warranted (the New Jerusalem fullness held to Revelation 21; not forced here)
--        Extras: none warranted     Tanakh: none separate (the consummated restoration; woven in prose)
--
-- Threads (slug — target libraries):
--   1. jeremiah-31-a-new-covenant-the-torah-written-on-the-heart — NT (Hebrews 8, Hebrews 10, 2 Corinthians 3, Romans 11) + Tanakh (Ezekiel 36) [free]
--      (★★★ THE central thread: the SAME Torah written on the heart, BOTH houses, sins remembered no more — the opposite of antinomianism)
--   2. jeremiah-31-i-have-loved-thee-with-an-everlasting-love-ephraim-my-firstborn — NT (Romans 11, Luke 15) + Tanakh (Hosea 11) [free]
--      (★★ the everlasting love for the scattered northern house — Ephraim my firstborn, my dear son — and the mercy that gathers him home)
--   3. jeremiah-31-he-that-scattered-yasharel-will-gather-him — NT (John 11, Revelation 7) + Tanakh (Ezekiel 34, Isaiah 40) [free]
--      (★★ the two-house regathering — the Scatterer become the Gatherer, the shepherd''s flock, the watered garden, sorrow no more)
--   4. jeremiah-31-a-voice-in-ramah-rachel-weeping-for-her-children — NT (Matthew 2) [free]
--      (★★ Rahel weeping in Ramah — fulfilled forward at Bethlehem, the weeping that the hope of v.16-17 answers)
--   5. jeremiah-31-refrain-thy-voice-from-weeping-hope-in-thine-end — NT (Hebrews 11, Romans 8) + Tanakh (Psalm 126) [free]
--      (★ the hope after the weeping — thy children shall come again to their own border; they that sow in tears shall reap in joy)
--   6. jeremiah-31-a-woman-shall-compass-a-man-a-new-thing-created — NT (Galatians 4) + Tanakh (Isaiah 43) [free]
--      (★ the new thing Yahuah created in the earth — framed modestly, Come-and-See, woven to the new-creation motif)
--
-- Framing notes:
--   ★★★ THE NEW COVENANT (THREAD 1, the keystone): *Behold, the days come, saith Yahuah (LORD), that I will
--      make a new covenant with the house of Yashar''el (Israel), and with the house of Yahudah (Judah)*
--      (31:31) — made with BOTH houses, the two-house people. *I will put my law in their inward parts, and
--      write it in their hearts; and will be their Elohim (God), and they shall be my people* (31:33). It is
--      not a DIFFERENT law nor an ABOLISHED law — it is the SAME Torah, taken off the tables of stone and
--      written on the heart. *They shall all know me, from the least of them unto the greatest of them...
--      for I will forgive their iniquity, and I will remember their sin no more* (31:34). Hebrews quotes it
--      at fullest length — *I will make a new covenant with the house of Yashar''el (Israel) and with the
--      house of Yahudah (Judah)* (Heb 8:8), *I will put my laws into their mind, and write them in their
--      hearts* (Heb 8:10), *their sins and their iniquities will I remember no more* (Heb 8:12), and again
--      *I will put my laws into their hearts, and in their minds will I write them* (Heb 10:16-17). Paul
--      names the writing-medium: *written not with ink, but with the Spirit of the living Elohim (God); not
--      in tables of stone, but in fleshy tables of the heart* (2 Cor 3:3); and the sin-removal: *this is my
--      covenant unto them, when I shall take away their sins* (Rom 11:27). The twin promise is Ezekiel 36:
--      *A new heart also will I give you... I will put my spirit within you, and cause you to walk in my
--      statutes* (Ezek 36:26-27) — the Spirit and the Torah inseparable, the heart enabled to KEEP it. The
--      new covenant is the Torah internalized, not replaced; the anti-antinomian keystone of the framework.
--   ★★ THE EVERLASTING LOVE / EPHRAIM MY FIRSTBORN (THREAD 2): *Yea, I have loved thee with an everlasting
--      love: therefore with lovingkindness have I drawn thee* (31:3); *for I am a father to Yashar''el
--      (Israel), and Ephraim is my firstborn* (31:9); *Is Ephraim my dear son? is he a pleasant child?...
--      I will surely have mercy upon him* (31:20). The love is for the SCATTERED northern house, Ephraim the
--      firstborn — divorced and exiled, yet still the dear son. Hosea sings the same Father-love: *When
--      Yashar''el (Israel) was a child, then I loved him, and called my son out of Egypt* (Hos 11:1), *How
--      shall I give thee up, Ephraim?... mine heart is turned within me* (Hos 11:8). Paul: *they are beloved
--      for the fathers'' sakes. For the gifts and calling of Elohim (God) are without repentance* (Rom
--      11:28-29) — the election irrevocable. And the prodigal-father runs to the returning son: *when he was
--      yet a great way off, his father saw him, and had compassion, and ran, and fell on his neck* (Luke
--      15:20) — Ephraim bemoaning himself, turned and brought home (31:18-19).
--   ★★ THE SCATTERER BECOME THE GATHERER (THREAD 3): *He that scattered Yashar''el (Israel) will gather him,
--      and keep him, as a shepherd doth his flock* (31:10); *they shall come and sing in the height of Zion...
--      and their soul shall be as a watered garden; and they shall not sorrow any more at all* (31:12). The
--      two-house regathering. Caiaphas prophesied it — *gather together in one the children of Elohim (God)
--      that were scattered abroad* (John 11:52). Ezekiel''s shepherd: *so will I seek out my sheep, and will
--      deliver them out of all places where they have been scattered* (Ezek 34:12). Isaiah''s: *He shall feed
--      his flock like a shepherd* (Isa 40:11). And the Lamb at the end: *the Lamb... shall feed them, and
--      shall lead them unto living fountains of waters; and Elohim (God) shall wipe away all tears from their
--      eyes* (Rev 7:17) — the watered garden, sorrow no more, consummated.
--   ★★ RAHEL WEEPING (THREAD 4): *A voice was heard in Ramah, lamentation, and bitter weeping; Rahel
--      weeping for her children refused to be comforted for her children, because they were not* (31:15).
--      Matthew quotes it of Herod''s slaughter: *Then was fulfilled that which was spoken by Jeremy the
--      prophet, saying, In Rama was there a voice heard, lamentation, and weeping, and great mourning, Rachel
--      weeping for her children, and would not be comforted, because they are not* (Matt 2:17-18). The mother
--      of Yashar''el weeps over the exiled and slain children — yet the very next breath is HOPE: *thy work
--      shall be rewarded... and they shall come again from the land of the enemy* (31:16). Weeping answered
--      by return.
--   ★ THE HOPE AFTER THE WEEPING (THREAD 5): *Refrain thy voice from weeping, and thine eyes from tears: for
--      thy work shall be rewarded... and there is hope in thine end, saith Yahuah (LORD), that thy children
--      shall come again to their own border* (31:16-17). The return from exile, the hope that answers Rahel''s
--      tears. *Now faith is the substance of things hoped for, the evidence of things not seen* (Heb 11:1);
--      *we are saved by hope... then do we with patience wait for it* (Rom 8:24-25); and the harvest-of-tears:
--      *They that sow in tears shall reap in joy. He that goeth forth and weepeth, bearing precious seed,
--      shall doubtless come again with rejoicing, bringing his sheaves with him* (Ps 126:5-6).
--   ★ THE NEW THING (THREAD 6, framed modestly): *for Yahuah (LORD) hath created a new thing in the earth,
--      A woman shall compass a man* (31:22) — a debated verse; held lightly, Come-and-See. It joins the
--      new-creation motif: *Behold, I will do a new thing; now it shall spring forth* (Isa 43:19); and the
--      fulness-of-time when *Elohim (God) sent forth his Son, made of a woman, made under the law* (Gal 4:4).
--      No overclaim — the new thing Yahuah creates, the turning-again of the backsliding daughter.
--   VERSES WITH NO SEPARATE ADD: v.4-8 (the rebuilding of the virgin of Yashar''el / the northern remnant —
--      woven into THREADs 2/3), v.23-26 (the restored cities of Yahudah — the southern house, woven into
--      THREAD 3 prose), v.27-30 (the both-houses sowing and the individual-responsibility word — held to
--      Ezekiel 18), v.35-37 (the irrevocable election by the ordinances of heaven — answered by Rom 11:29 in
--      THREAD 2, woven in prose), v.38-40 (the rebuilt never-uprooted city — New Jerusalem fullness held to
--      Revelation 21). All blocks recorded above; every meaningful section carries or is bound to a thread.

CREATE TEMP VIEW _s309_jer31_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★★): a new covenant — the Torah written on the heart, both houses, sins remembered no more
    ('canon','jeremiah',31,31,'canon','hebrews',8,8,'free',
      E'*For finding fault with them, he saith, Behold, the days come, saith Yahuah (Lord), when I will make a new covenant with the house of Yashar''el (Israel) and with the house of Yahudah (Judah)* (Hebrews 8:8). Hebrews quotes Jeremiah at fullest length: the promise *I will make a new covenant with the house of Yashar''el (Israel), and with the house of Yahudah (Judah)* (Jeremiah 31:31) is made with BOTH houses, the two-house people — never one house only, never a new people replacing them.'),
    ('canon','jeremiah',31,33,'canon','hebrews',8,10,'free',
      E'*For this is the covenant that I will make with the house of Yashar''el (Israel) after those days, saith Yahuah (Lord); I will put my laws into their mind, and write them in their hearts: and I will be to them a Elohim (God), and they shall be to me a people* (Hebrews 8:10). This is Jeremiah''s heart-covenant word for word — *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). It is not a different law nor an abolished one: the SAME Torah, taken off the tables of stone and written on the heart.'),
    ('canon','jeremiah',31,34,'canon','hebrews',8,12,'free',
      E'*For I will be merciful to their unrighteousness, and their sins and their iniquities will I remember no more* (Hebrews 8:12). Hebrews seals the new covenant with Jeremiah''s own pledge of forgiveness — *I will forgive their iniquity, and I will remember their sin no more* (Jeremiah 31:34). The covenant written on the heart is a covenant of cleansed conscience: the sin not merely covered but remembered no more.'),
    ('canon','jeremiah',31,33,'canon','hebrews',10,16,'free',
      E'*This is the covenant that I will make with them after those days, saith Yahuah (Lord), I will put my laws into their hearts, and in their minds will I write them* (Hebrews 10:16). Hebrews quotes Jeremiah a second time, the Ruach HaKodesh (Holy Spirit) himself witnessing it — *I will put my law in their inward parts, and write it in their hearts* (Jeremiah 31:33). The Torah on the heart and in the mind: the law internalized by the Spirit, the very opposite of the law set aside.'),
    ('canon','jeremiah',31,34,'canon','hebrews',10,17,'free',
      E'*And their sins and iniquities will I remember no more* (Hebrews 10:17). The new covenant''s pledge — *I will forgive their iniquity, and I will remember their sin no more* (Jeremiah 31:34) — is the ground of the boldness *to enter into the holiest by the blood of Yahusha (Jesus)* (Heb 10:19). Where sin is remembered no more, *there is no more offering for sin* (Heb 10:18); the forgiveness Jeremiah promised is finished.'),
    ('canon','jeremiah',31,33,'canon','2-corinthians',3,3,'free',
      E'*Forasmuch as ye are manifestly declared to be the epistle of Messiah (Christ) ministered by us, written not with ink, but with the Spirit of the living Elohim (God); not in tables of stone, but in fleshy tables of the heart* (2 Corinthians 3:3). Paul names the writing-medium of Jeremiah''s covenant: the Torah *written... in their hearts* (Jeremiah 31:33) is written by the Spirit *in fleshy tables of the heart*, not on stone. The new covenant is the same instruction, inscribed on the heart by the Spirit of the living Elohim.'),
    ('canon','jeremiah',31,34,'canon','romans',11,27,'free',
      E'*For this is my covenant unto them, when I shall take away their sins* (Romans 11:27). Paul names the new covenant by its sin-removing promise — *I will forgive their iniquity, and I will remember their sin no more* (Jeremiah 31:34): *this is my covenant unto them, when I shall take away their sins*. The covenant cut with Yashar''el (Israel) is the taking-away of their sins, and so *all Yashar''el (Israel) shall be saved* (Rom 11:26).'),
    ('canon','jeremiah',31,33,'canon','ezekiel',36,26,'free',
      E'*A new heart also will I give you, and a new spirit will I put within you: and I will take away the stony heart out of your flesh, and I will give you an heart of flesh* (Ezekiel 36:26). The Torah written *in their hearts* (Jeremiah 31:33) requires a new heart to receive it — and Ezekiel promises exactly that: the stony heart taken away, a heart of flesh given. The two prophets speak one new-covenant promise: a heart remade to hold the law within.'),
    ('canon','jeremiah',31,33,'canon','ezekiel',36,27,'free',
      E'*And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). The twin of Jeremiah''s new-covenant word — *I will put my law in their inward parts, and write it in their hearts* (Jeremiah 31:33) — names its purpose: the Spirit put within MAKES the people *walk in my statutes* and *keep my judgments*. The new covenant is the Torah enabled, not abolished; the Spirit and the law are inseparable.'),

    -- THREAD 2 (★★): I have loved thee with an everlasting love — Ephraim my firstborn, my dear son
    ('canon','jeremiah',31,3,'canon','hosea',11,1,'free',
      E'*When Yashar''el (Israel) was a child, then I loved him, and called my son out of Egypt* (Hosea 11:1). Hosea sings the same everlasting love Jeremiah names — *Yea, I have loved thee with an everlasting love: therefore with lovingkindness have I drawn thee* (Jeremiah 31:3). The love that drew Yashar''el out of Egypt as a child is the love that draws the scattered northern house home; it does not fail with the exile.'),
    ('canon','jeremiah',31,9,'canon','hosea',11,1,'free',
      E'*When Yashar''el (Israel) was a child, then I loved him, and called my son out of Egypt* (Hosea 11:1). Jeremiah names the Fatherhood Hosea sang — *I am a father to Yashar''el (Israel), and Ephraim is my firstborn* (Jeremiah 31:9). The firstborn son called out of Egypt is the scattered northern house, and the Father''s claim on him does not lapse: Ephraim is still the firstborn.'),
    ('canon','jeremiah',31,20,'canon','hosea',11,8,'free',
      E'*How shall I give thee up, Ephraim? how shall I deliver thee, Yashar''el (Israel)?... mine heart is turned within me, my repentings are kindled together* (Hosea 11:8). Hosea voices the very mercy Jeremiah names — *Is Ephraim my dear son? is he a pleasant child?... therefore my bowels are troubled for him; I will surely have mercy upon him* (Jeremiah 31:20). The Father cannot give Ephraim up: his heart is turned, his mercy kindled toward the exiled firstborn.'),
    ('canon','jeremiah',31,3,'canon','romans',11,28,'free',
      E'*As concerning the gospel, they are enemies for your sakes: but as touching the election, they are beloved for the fathers'' sakes* (Romans 11:28). Paul grounds the everlasting love Jeremiah named — *I have loved thee with an everlasting love* (Jeremiah 31:3) — in the election: *beloved for the fathers'' sakes*. The love is not revoked by Yashar''el''s (Israel''s) unbelief; it rests on the covenant with the fathers.'),
    ('canon','jeremiah',31,3,'canon','romans',11,29,'free',
      E'*For the gifts and calling of Elohim (God) are without repentance* (Romans 11:29). The *everlasting love* with which Yahuah drew Yashar''el (Israel) (Jeremiah 31:3) is the calling Paul calls irrevocable — *without repentance*, never taken back. Yahuah does not unsay his love nor cancel his calling; the everlasting love is everlasting indeed.'),
    ('canon','jeremiah',31,20,'canon','luke',15,20,'free',
      E'*And he arose, and came to his father. But when he was yet a great way off, his father saw him, and had compassion, and ran, and fell on his neck, and kissed him* (Luke 15:20). The prodigal-father is the Father of Ephraim — *I do earnestly remember him still: therefore my bowels are troubled for him; I will surely have mercy upon him* (Jeremiah 31:20). As Ephraim *bemoaning himself* turns home (31:18-19), the Father runs to meet the returning son with compassion. The mercy on the firstborn is the running embrace of the prodigal''s father.'),

    -- THREAD 3 (★★): He that scattered Yashar''el will gather him — the Scatterer become the Gatherer
    ('canon','jeremiah',31,10,'canon','john',11,52,'free',
      E'*And not for that nation only, but that also he should gather together in one the children of Elohim (God) that were scattered abroad* (John 11:52). Caiaphas prophesied the very ingathering Jeremiah promised — *He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* (Jeremiah 31:10): the Messiah dies to *gather together in one the children of Elohim (God) that were scattered abroad*. The Scatterer become the Gatherer gathers his scattered children into one.'),
    ('canon','jeremiah',31,10,'canon','ezekiel',34,12,'free',
      E'*As a shepherd seeketh out his flock in the day that he is among his sheep that are scattered; so will I seek out my sheep, and will deliver them out of all places where they have been scattered in the cloudy and dark day* (Ezekiel 34:12). Ezekiel''s shepherd does what Jeremiah''s promises — *He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* (Jeremiah 31:10). Yahuah himself, the true Shepherd, seeks out the scattered flock and delivers them from every place of their scattering.'),
    ('canon','jeremiah',31,10,'canon','isaiah',40,11,'free',
      E'*He shall feed his flock like a shepherd: he shall gather the lambs with his arm, and carry them in his bosom, and shall gently lead those that are with young* (Isaiah 40:11). Isaiah''s Shepherd gathers as Jeremiah''s does — *will gather him, and keep him, as a shepherd doth his flock* (Jeremiah 31:10). The same gentle Shepherd-King gathers the lambs and leads them home; the regathering of Yashar''el (Israel) is the shepherd carrying his flock in his bosom.'),
    ('canon','jeremiah',31,12,'canon','revelation',7,17,'free',
      E'*For the Lamb which is in the midst of the throne shall feed them, and shall lead them unto living fountains of waters: and Elohim (God) shall wipe away all tears from their eyes* (Revelation 7:17). Jeremiah''s promise — *their soul shall be as a watered garden; and they shall not sorrow any more at all* (Jeremiah 31:12) — reaches its end in the Lamb who feeds the gathered tribes and leads them to living waters, where *Elohim (God) shall wipe away all tears*. The watered garden and the sorrow-no-more are consummated before the throne.'),

    -- THREAD 4 (★★): a voice in Ramah — Rahel weeping for her children
    ('canon','jeremiah',31,15,'canon','matthew',2,18,'free',
      E'*In Rama was there a voice heard, lamentation, and weeping, and great mourning, Rachel weeping for her children, and would not be comforted, because they are not* (Matthew 2:18). Matthew quotes Jeremiah word for word over Herod''s slaughter of the innocents — *A voice was heard in Ramah, lamentation, and bitter weeping; Rahel weeping for her children refused to be comforted for her children, because they were not* (Jeremiah 31:15). The mother of Yashar''el (Israel) weeps over the slain and exiled children; the weeping at Bethlehem is the same lamentation.'),
    ('canon','jeremiah',31,15,'canon','matthew',2,17,'free',
      E'*Then was fulfilled that which was spoken by Jeremy the prophet, saying* (Matthew 2:17). Matthew names Jeremiah as the prophet whose Rahel-oracle — *A voice was heard in Ramah, lamentation, and bitter weeping; Rahel weeping for her children* (Jeremiah 31:15) — is fulfilled in the mothers of Bethlehem. The weeping prophesied at the exile is heard again at the birth of the Messiah; yet the oracle does not end in tears (Jeremiah 31:16-17).'),

    -- THREAD 5 (★): refrain thy voice from weeping — hope in thine end, thy children come again
    ('canon','jeremiah',31,17,'canon','hebrews',11,1,'free',
      E'*Now faith is the substance of things hoped for, the evidence of things not seen* (Hebrews 11:1). The hope Jeremiah holds out — *And there is hope in thine end, saith Yahuah (LORD), that thy children shall come again to their own border* (Jeremiah 31:17) — is the very thing faith makes substantial: the unseen return of the children, grasped now as certain. Hope in thine end is faith''s evidence of things not yet seen.'),
    ('canon','jeremiah',31,16,'canon','romans',8,24,'free',
      E'*For we are saved by hope: but hope that is seen is not hope: for what a man seeth, why doth he yet hope for?* (Romans 8:24). The comfort *Refrain thy voice from weeping... for thy work shall be rewarded... and they shall come again from the land of the enemy* (Jeremiah 31:16) is salvation by hope: the reward and the return not yet seen, awaited with patience. *If we hope for that we see not, then do we with patience wait for it* (Rom 8:25).'),
    ('canon','jeremiah',31,16,'canon','psalms',126,5,'free',
      E'*They that sow in tears shall reap in joy* (Psalm 126:5). The psalm sings Jeremiah''s very turn from weeping to reward — *Refrain thy voice from weeping... for thy work shall be rewarded* (Jeremiah 31:16): the tears sown become the harvest of joy. *He that goeth forth and weepeth, bearing precious seed, shall doubtless come again with rejoicing, bringing his sheaves with him* (Psalm 126:6) — the weeping ones come again, as Jeremiah''s children come again to their border.'),

    -- THREAD 6 (★): a woman shall compass a man — a new thing created in the earth (framed modestly)
    ('canon','jeremiah',31,22,'canon','isaiah',43,19,'free',
      E'*Behold, I will do a new thing; now it shall spring forth; shall ye not know it? I will even make a way in the wilderness, and rivers in the desert* (Isaiah 43:19). Jeremiah''s word — *for Yahuah (LORD) hath created a new thing in the earth, A woman shall compass a man* (Jeremiah 31:22) — joins Isaiah''s new-thing motif: Yahuah creates what has not been, a way where there was none. The turning-again of the backsliding daughter is itself the new thing springing forth.'),
    ('canon','jeremiah',31,22,'canon','galatians',4,4,'free',
      E'*But when the fulness of the time was come, Elohim (God) sent forth his Son, made of a woman, made under the law* (Galatians 4:4). Jeremiah''s much-debated *new thing in the earth, A woman shall compass a man* (Jeremiah 31:22) has long been read toward the One *made of a woman, made under the law* — held here modestly, Come-and-See: the new thing Yahuah creates, the Son brought forth by a woman, born under the Torah, not above it.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s309_jer31_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s309_jer31_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-31-a-new-covenant-the-torah-written-on-the-heart',
       E'A new covenant with both houses — I will write my law in their hearts',
       E'Here is the keystone of the book, and of the whole framework: *Behold, the days come, saith Yahuah (LORD), that I will make a new covenant with the house of Yashar''el (Israel), and with the house of Yahudah (Judah)* (31:31). Mark first that it is made with BOTH houses — the two-house people, not one house only, and never a new people grafted in to replace them. *Not according to the covenant that I made with their fathers in the day that I took them by the hand to bring them out of the land of Egypt; which my covenant they brake* (31:32) — what failed was not the Torah but the people''s keeping of it. So the remedy is not a different law but the same law set in a new place: *But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (31:33). The Torah is taken off the tables of stone and written on the heart — internalized, NOT abolished. And the covenant carries full forgiveness: *they shall all know me, from the least of them unto the greatest of them, saith Yahuah (LORD): for I will forgive their iniquity, and I will remember their sin no more* (31:34). Hebrews quotes this oracle at fullest length, twice. First: *Behold, the days come... when I will make a new covenant with the house of Yashar''el (Israel) and with the house of Yahudah (Judah)* (Hebrews 8:8), *I will put my laws into their mind, and write them in their hearts: and I will be to them a Elohim (God), and they shall be to me a people* (Hebrews 8:10), *their sins and their iniquities will I remember no more* (Hebrews 8:12). Then again, the Ruach HaKodesh (Holy Spirit) himself witnessing: *I will put my laws into their hearts, and in their minds will I write them; And their sins and iniquities will I remember no more* (Hebrews 10:16-17). Paul names the writing-medium — the Spirit, not ink: *written not with ink, but with the Spirit of the living Elohim (God); not in tables of stone, but in fleshy tables of the heart* (2 Corinthians 3:3) — and the sin-removal: *this is my covenant unto them, when I shall take away their sins* (Romans 11:27). And Ezekiel speaks the twin promise that makes it possible — the heart remade and the Spirit given to KEEP the law: *A new heart also will I give you, and a new spirit will I put within you... and I will give you an heart of flesh* (Ezekiel 36:26); *And I will put my spirit within you, and cause you to walk in my statutes, and ye shall keep my judgments, and do them* (Ezekiel 36:27). The new covenant is the Torah written on the heart by the Spirit — the same instruction, now loved and kept from within. It is the exact opposite of antinomianism: not the law set aside, but the law set in the inward parts.',
       sv.verse_id, ev.verse_id, 'free', 34750
  FROM _s309_jer31_lookup sv, _s309_jer31_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=31 AND sv.verse_number=31
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=31 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-31-i-have-loved-thee-with-an-everlasting-love-ephraim-my-firstborn',
       E'I have loved thee with an everlasting love — Ephraim my firstborn, my dear son',
       E'The chapter opens on a love that the exile cannot end: *At the same time, saith Yahuah (LORD), will I be the Elohim (God) of all the families of Yashar''el (Israel), and they shall be my people* (31:1); *Yahuah (LORD) hath appeared of old unto me, saying, Yea, I have loved thee with an everlasting love: therefore with lovingkindness have I drawn thee* (31:3). And the love has a particular object — the scattered NORTHERN house, the firstborn: *for I am a father to Yashar''el (Israel), and Ephraim is my firstborn* (31:9). Even after the divorce and the exile, Ephraim is still the dear son: *Is Ephraim my dear son? is he a pleasant child? for since I spake against him, I do earnestly remember him still: therefore my bowels are troubled for him; I will surely have mercy upon him, saith Yahuah (LORD)* (31:20) — and Ephraim answers, bemoaning himself: *turn thou me, and I shall be turned; for thou art Yahuah Elohai (the LORD my God)* (31:18). Hosea sang this same Father-love: *When Yashar''el (Israel) was a child, then I loved him, and called my son out of Egypt* (Hosea 11:1), and could not give the firstborn up — *How shall I give thee up, Ephraim?... mine heart is turned within me, my repentings are kindled together* (Hosea 11:8). Paul grounds the love in the irrevocable election: *as touching the election, they are beloved for the fathers'' sakes. For the gifts and calling of Elohim (God) are without repentance* (Romans 11:28-29) — the everlasting love is never unsaid. And the Messiah draws the picture whole: as Ephraim turns home, the Father runs to meet him — *when he was yet a great way off, his father saw him, and had compassion, and ran, and fell on his neck, and kissed him* (Luke 15:20). The everlasting love is the love that gathers Ephraim home.',
       sv.verse_id, ev.verse_id, 'free', 34753
  FROM _s309_jer31_lookup sv, _s309_jer31_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=31 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=31 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-31-he-that-scattered-yasharel-will-gather-him',
       E'He that scattered Yashar''el will gather him — the watered garden, sorrow no more',
       E'The exile is not the last word; the One who scattered is the One who gathers: *Behold, I will bring them from the north country, and gather them from the coasts of the earth... a great company shall return thither* (31:8). The proclamation rings to the nations: *Hear the word of Yahuah (LORD), O ye nations, and declare it in the isles afar off, and say, He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* (31:10). This is the two-house regathering — the scattered people sought out and brought home as a flock. And the joy of the restored is overflowing: *Therefore they shall come and sing in the height of Zion... and their soul shall be as a watered garden; and they shall not sorrow any more at all* (31:12), *for I will turn their mourning into joy, and will comfort them, and make them rejoice from their sorrow* (31:13). Caiaphas prophesied the ingathering without knowing it: the Messiah should *gather together in one the children of Elohim (God) that were scattered abroad* (John 11:52). Ezekiel''s Shepherd does the seeking: *so will I seek out my sheep, and will deliver them out of all places where they have been scattered in the cloudy and dark day* (Ezekiel 34:12). Isaiah''s gathers the lambs: *He shall feed his flock like a shepherd: he shall gather the lambs with his arm, and carry them in his bosom* (Isaiah 40:11). And at the end the Lamb consummates the watered garden and the sorrow-no-more: *the Lamb which is in the midst of the throne shall feed them, and shall lead them unto living fountains of waters; and Elohim (God) shall wipe away all tears from their eyes* (Revelation 7:17). The Scatterer is the Gatherer, and the gathered flock shall not sorrow any more at all.',
       sv.verse_id, ev.verse_id, 'free', 34756
  FROM _s309_jer31_lookup sv, _s309_jer31_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=31 AND sv.verse_number=10
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=31 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-31-a-voice-in-ramah-rachel-weeping-for-her-children',
       E'A voice in Ramah — Rahel weeping for her children, refused to be comforted',
       E'In the midst of the regathering comes the cry of the mother of Yashar''el (Israel): *Thus saith Yahuah (LORD); A voice was heard in Ramah, lamentation, and bitter weeping; Rahel weeping for her children refused to be comforted for her children, because they were not* (31:15). Rahel — the matriarch buried near Bethlehem — weeps over the children carried into exile, *because they were not*. Matthew hears the same voice at Bethlehem, when Herod slaughters the innocents: *Then was fulfilled that which was spoken by Jeremy the prophet, saying, In Rama was there a voice heard, lamentation, and weeping, and great mourning, Rachel weeping for her children, and would not be comforted, because they are not* (Matthew 2:17-18). The weeping prophesied at the exile is heard again at the coming of the Messiah — the same lamentation, the mother''s grief over her lost children. Yet the oracle does not end in tears: in the very next breath Yahuah answers the weeping with hope — *Refrain thy voice from weeping... and they shall come again from the land of the enemy. And there is hope in thine end... that thy children shall come again to their own border* (31:16-17). The weeping in Ramah is answered by the return; the bitter cry is not the last word over the children of Yashar''el.',
       sv.verse_id, ev.verse_id, 'free', 34759
  FROM _s309_jer31_lookup sv, _s309_jer31_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=31 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=31 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-31-refrain-thy-voice-from-weeping-hope-in-thine-end',
       E'Refrain thy voice from weeping — there is hope in thine end',
       E'The answer to Rahel''s weeping is a promise of reward and return: *Thus saith Yahuah (LORD); Refrain thy voice from weeping, and thine eyes from tears: for thy work shall be rewarded, saith Yahuah (LORD); and they shall come again from the land of the enemy. And there is hope in thine end, saith Yahuah (LORD), that thy children shall come again to their own border* (31:16-17). The tears are not wasted; the labour shall be rewarded, the exiled children shall come home. This is the very shape of faith: *Now faith is the substance of things hoped for, the evidence of things not seen* (Hebrews 11:1) — the unseen return grasped now as certain. It is salvation by hope: *For we are saved by hope... But if we hope for that we see not, then do we with patience wait for it* (Romans 8:24-25). And the psalm sings the same turn from sowing-in-tears to reaping-in-joy: *They that sow in tears shall reap in joy. He that goeth forth and weepeth, bearing precious seed, shall doubtless come again with rejoicing, bringing his sheaves with him* (Psalm 126:5-6). The weeping ones come again with rejoicing — there is hope in thine end.',
       sv.verse_id, ev.verse_id, 'free', 34762
  FROM _s309_jer31_lookup sv, _s309_jer31_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=31 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=31 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-31-a-woman-shall-compass-a-man-a-new-thing-created',
       E'Yahuah hath created a new thing in the earth — a woman shall compass a man',
       E'To the wavering, backsliding house Yahuah holds out a wonder: *How long wilt thou go about, O thou backsliding daughter? for Yahuah (LORD) hath created a new thing in the earth, A woman shall compass a man* (31:22). This is a much-debated verse, and it is held here lightly — Come-and-See, not overclaimed. What is plain is that Yahuah CREATES a new thing in the earth, something not seen before; the turning-again of the backsliding daughter is itself the new thing springing forth. It joins Isaiah''s new-thing motif: *Behold, I will do a new thing; now it shall spring forth; shall ye not know it? I will even make a way in the wilderness, and rivers in the desert* (Isaiah 43:19). And the phrase has long been read toward the fulness of time, when *Elohim (God) sent forth his Son, made of a woman, made under the law* (Galatians 4:4) — the Son brought forth by a woman, born under the Torah, not above it. The new thing Yahuah creates is the turning of his people and the springing-forth of his salvation; whatever more the verse holds, let the reader watch and see.',
       sv.verse_id, ev.verse_id, 'free', 34765
  FROM _s309_jer31_lookup sv, _s309_jer31_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=31 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=31 AND ev.verse_number=22
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *I will make a new covenant with the house of Yashar''el (Israel) and with the house of Yahudah (Judah)* (Hebrews 8:8) — Hebrews quotes Jeremiah 31:31 at fullest length; the new covenant is made with BOTH houses.'
  FROM cross_reference_threads t
  JOIN _s309_jer31_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=31 AND sv.verse_number=31
  JOIN _s309_jer31_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=8 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-31-a-new-covenant-the-torah-written-on-the-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *I will put my laws into their mind, and write them in their hearts* (Hebrews 8:10) — Jeremiah 31:33 word for word; the SAME Torah taken off the tables of stone onto the heart.'
  FROM cross_reference_threads t
  JOIN _s309_jer31_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=31 AND sv.verse_number=33
  JOIN _s309_jer31_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=8 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-31-a-new-covenant-the-torah-written-on-the-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *their sins and their iniquities will I remember no more* (Hebrews 8:12) — seals the covenant with Jeremiah 31:34''s forgiveness; sin remembered no more.'
  FROM cross_reference_threads t
  JOIN _s309_jer31_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=31 AND sv.verse_number=34
  JOIN _s309_jer31_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=8 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-31-a-new-covenant-the-torah-written-on-the-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *I will put my laws into their hearts, and in their minds will I write them* (Hebrews 10:16) — Hebrews quotes Jeremiah 31:33 a second time, the Ruach HaKodesh (Holy Spirit) witnessing; the law internalized.'
  FROM cross_reference_threads t
  JOIN _s309_jer31_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=31 AND sv.verse_number=33
  JOIN _s309_jer31_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-31-a-new-covenant-the-torah-written-on-the-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *And their sins and iniquities will I remember no more* (Hebrews 10:17) — Jeremiah 31:34''s forgiveness is the ground of boldness to enter the holiest; no more offering for sin.'
  FROM cross_reference_threads t
  JOIN _s309_jer31_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=31 AND sv.verse_number=34
  JOIN _s309_jer31_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=10 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-31-a-new-covenant-the-torah-written-on-the-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★ *written not with ink, but with the Spirit of the living Elohim (God)... in fleshy tables of the heart* (2 Corinthians 3:3) — Paul names the writing-medium of Jeremiah 31:33; the Spirit writes the Torah on the heart.'
  FROM cross_reference_threads t
  JOIN _s309_jer31_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=31 AND sv.verse_number=33
  JOIN _s309_jer31_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=3 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-31-a-new-covenant-the-torah-written-on-the-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *this is my covenant unto them, when I shall take away their sins* (Romans 11:27) — Paul names the new covenant by Jeremiah 31:34''s sin-removal; so all Yashar''el (Israel) shall be saved.'
  FROM cross_reference_threads t
  JOIN _s309_jer31_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=31 AND sv.verse_number=34
  JOIN _s309_jer31_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-31-a-new-covenant-the-torah-written-on-the-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★★ *A new heart also will I give you... I will give you an heart of flesh* (Ezekiel 36:26) — the Torah written in the heart (Jeremiah 31:33) needs a new heart to hold it; the stony heart taken away.'
  FROM cross_reference_threads t
  JOIN _s309_jer31_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=31 AND sv.verse_number=33
  JOIN _s309_jer31_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-31-a-new-covenant-the-torah-written-on-the-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'★★ *I will put my spirit within you, and cause you to walk in my statutes* (Ezekiel 36:27) — the twin promise: the new covenant is the Torah ENABLED, the Spirit and the law inseparable, not abolished.'
  FROM cross_reference_threads t
  JOIN _s309_jer31_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=31 AND sv.verse_number=33
  JOIN _s309_jer31_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-31-a-new-covenant-the-torah-written-on-the-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *When Yashar''el (Israel) was a child, then I loved him, and called my son out of Egypt* (Hosea 11:1) — Hosea sings the everlasting love of Jeremiah 31:3; the love that drew the child draws the scattered house home.'
  FROM cross_reference_threads t
  JOIN _s309_jer31_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=31 AND sv.verse_number=3
  JOIN _s309_jer31_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-31-i-have-loved-thee-with-an-everlasting-love-ephraim-my-firstborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *called my son out of Egypt* (Hosea 11:1) — the firstborn son of Jeremiah 31:9 (*Ephraim is my firstborn*) is the scattered northern house; the Father''s claim does not lapse.'
  FROM cross_reference_threads t
  JOIN _s309_jer31_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=31 AND sv.verse_number=9
  JOIN _s309_jer31_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-31-i-have-loved-thee-with-an-everlasting-love-ephraim-my-firstborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *How shall I give thee up, Ephraim?... mine heart is turned within me* (Hosea 11:8) — Hosea voices the mercy of Jeremiah 31:20; the Father cannot give the exiled firstborn up.'
  FROM cross_reference_threads t
  JOIN _s309_jer31_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=31 AND sv.verse_number=20
  JOIN _s309_jer31_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=11 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-31-i-have-loved-thee-with-an-everlasting-love-ephraim-my-firstborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *as touching the election, they are beloved for the fathers'' sakes* (Romans 11:28) — Paul grounds the everlasting love of Jeremiah 31:3 in the election; never revoked by unbelief.'
  FROM cross_reference_threads t
  JOIN _s309_jer31_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=31 AND sv.verse_number=3
  JOIN _s309_jer31_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-31-i-have-loved-thee-with-an-everlasting-love-ephraim-my-firstborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *the gifts and calling of Elohim (God) are without repentance* (Romans 11:29) — the *everlasting love* of Jeremiah 31:3 is the irrevocable calling; never taken back.'
  FROM cross_reference_threads t
  JOIN _s309_jer31_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=31 AND sv.verse_number=3
  JOIN _s309_jer31_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-31-i-have-loved-thee-with-an-everlasting-love-ephraim-my-firstborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *his father saw him, and had compassion, and ran, and fell on his neck* (Luke 15:20) — as Ephraim turns home (Jeremiah 31:18-20), the Father runs to meet the returning son; mercy on the firstborn.'
  FROM cross_reference_threads t
  JOIN _s309_jer31_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=31 AND sv.verse_number=20
  JOIN _s309_jer31_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=15 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-31-i-have-loved-thee-with-an-everlasting-love-ephraim-my-firstborn'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *gather together in one the children of Elohim (God) that were scattered abroad* (John 11:52) — Caiaphas prophesies the ingathering of Jeremiah 31:10; the Scatterer become the Gatherer.'
  FROM cross_reference_threads t
  JOIN _s309_jer31_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=31 AND sv.verse_number=10
  JOIN _s309_jer31_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=11 AND tv.verse_number=52
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-31-he-that-scattered-yasharel-will-gather-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *so will I seek out my sheep, and will deliver them out of all places where they have been scattered* (Ezekiel 34:12) — Ezekiel''s Shepherd does what Jeremiah 31:10 promises; the scattered flock sought and delivered.'
  FROM cross_reference_threads t
  JOIN _s309_jer31_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=31 AND sv.verse_number=10
  JOIN _s309_jer31_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-31-he-that-scattered-yasharel-will-gather-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *He shall feed his flock like a shepherd: he shall gather the lambs with his arm* (Isaiah 40:11) — Isaiah''s Shepherd gathers as Jeremiah 31:10 promises; the lambs carried in his bosom.'
  FROM cross_reference_threads t
  JOIN _s309_jer31_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=31 AND sv.verse_number=10
  JOIN _s309_jer31_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-31-he-that-scattered-yasharel-will-gather-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *the Lamb... shall feed them, and shall lead them unto living fountains of waters; and Elohim (God) shall wipe away all tears* (Revelation 7:17) — the watered garden / sorrow-no-more of Jeremiah 31:12 consummated before the throne.'
  FROM cross_reference_threads t
  JOIN _s309_jer31_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=31 AND sv.verse_number=12
  JOIN _s309_jer31_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=7 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-31-he-that-scattered-yasharel-will-gather-him'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *In Rama was there a voice heard... Rachel weeping for her children, and would not be comforted, because they are not* (Matthew 2:18) — Matthew quotes Jeremiah 31:15 word for word over Herod''s slaughter of the innocents.'
  FROM cross_reference_threads t
  JOIN _s309_jer31_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=31 AND sv.verse_number=15
  JOIN _s309_jer31_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-31-a-voice-in-ramah-rachel-weeping-for-her-children'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Then was fulfilled that which was spoken by Jeremy the prophet* (Matthew 2:17) — Matthew names Jeremiah as the prophet of the Rahel-oracle (Jeremiah 31:15); the weeping heard again at the Messiah''s coming.'
  FROM cross_reference_threads t
  JOIN _s309_jer31_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=31 AND sv.verse_number=15
  JOIN _s309_jer31_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=2 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-31-a-voice-in-ramah-rachel-weeping-for-her-children'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Now faith is the substance of things hoped for, the evidence of things not seen* (Hebrews 11:1) — the *hope in thine end* of Jeremiah 31:17 is what faith makes substantial; the unseen return grasped as certain.'
  FROM cross_reference_threads t
  JOIN _s309_jer31_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=31 AND sv.verse_number=17
  JOIN _s309_jer31_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-31-refrain-thy-voice-from-weeping-hope-in-thine-end'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *For we are saved by hope* (Romans 8:24) — the reward and return of Jeremiah 31:16, not yet seen, awaited with patience; salvation by hope.'
  FROM cross_reference_threads t
  JOIN _s309_jer31_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=31 AND sv.verse_number=16
  JOIN _s309_jer31_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=8 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-31-refrain-thy-voice-from-weeping-hope-in-thine-end'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *They that sow in tears shall reap in joy... shall doubtless come again with rejoicing* (Psalm 126:5-6) — the psalm sings Jeremiah 31:16''s turn from weeping to reward; the weeping ones come again.'
  FROM cross_reference_threads t
  JOIN _s309_jer31_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=31 AND sv.verse_number=16
  JOIN _s309_jer31_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=126 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-31-refrain-thy-voice-from-weeping-hope-in-thine-end'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Behold, I will do a new thing; now it shall spring forth* (Isaiah 43:19) — Jeremiah 31:22''s *new thing in the earth* joins Isaiah''s new-thing motif; Yahuah creates what was not.'
  FROM cross_reference_threads t
  JOIN _s309_jer31_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=31 AND sv.verse_number=22
  JOIN _s309_jer31_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=43 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-31-a-woman-shall-compass-a-man-a-new-thing-created'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Elohim (God) sent forth his Son, made of a woman, made under the law* (Galatians 4:4) — Jeremiah 31:22''s *a woman shall compass a man* long read toward the Son made of a woman, born under the Torah; held modestly.'
  FROM cross_reference_threads t
  JOIN _s309_jer31_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=31 AND sv.verse_number=22
  JOIN _s309_jer31_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=4 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-31-a-woman-shall-compass-a-man-a-new-thing-created'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jeremiah_2.sql (Jeremiah 2) -----
-- Chapter: Jeremiah 2 — THE COVENANT LAWSUIT opens: Yashar''el (Israel) the bride who left her first
-- love. *I remember thee, the kindness of thy youth, the love of thine espousals, when thou wentest
-- after me in the wilderness* (2:2) — the wilderness honeymoon. *My people have committed two evils;
-- they have forsaken me the fountain of living waters, and hewed them out cisterns, broken cisterns,
-- that can hold no water* (2:13) — the living Fountain abandoned for cracked cisterns, idolatry''s
-- bankruptcy. *I had planted thee a noble vine, wholly a right seed: how then art thou turned into the
-- degenerate plant of a strange vine* (2:21) — the chosen vine gone wild; the bride who *forgot me days
-- without number* (2:32). This is covenant-marriage lawsuit AGAINST SIN, never ethnic indictment: the
-- harsh language is the wronged husband''s grief over a people who left the love of their espousals.
-- Tag: jer02   Temp view: _s309_jer02_lookup
-- Sort band: base 34025, step 3 -> threads at 34025, 34028, 34031 (3 threads)
-- Source of EVERY row: 'canon','jeremiah',2,v
--
-- Jeremiah 2 coverage:
--   v.1 (the word of Yahuah came to me) — preface, woven in prose
--        NT: none warranted   Extras: none warranted   Tanakh: none separate
--   ★ v.2-3 (I remember thee, the kindness of thy youth, the love of thine espousals... thou wentest after
--          me in the wilderness; Yashar''el was holiness unto Yahuah, the firstfruits of his increase)
--        NT:     ★★ Revelation 2:4 (thou hast left thy first love) — THREAD 1
--        Extras: none warranted (clean canon-NT-Tanakh weave; no extra forced)
--        Tanakh: ★★ Hosea 2:14-15 (I will allure her... into the wilderness... as in the days of her youth),
--                ★ Deuteronomy 8:2 (Yahuah led thee these forty years in the wilderness), ★ Exodus 19:5-6
--                (a peculiar treasure... a kingdom of priests, and an holy nation) — THREAD 1
--   v.4-8 (house of Jacob; what iniquity have your fathers found in me; the priests, they that handle the
--          law, the pastors, the prophets prophesied by Baal) — the covenant-lawsuit charge
--        NT:     none warranted (the lawsuit-against-sin; the Fountain-charge crystallizes at v.13, THREAD 2)
--        Extras: none warranted
--        Tanakh: held in prose — the leaders who handle the Torah yet knew Yahuah not (bound to THREAD 2)
--   v.9-10 (I will yet plead with you; pass over the isles of Chittim) — the plea/lawsuit form
--        NT: none   Extras: none   Tanakh: none separate (the plea framing v.11-13)
--   ★★ v.11-13 (Hath a nation changed their gods, which are yet no gods?... my people have committed two
--          evils; they have forsaken me the fountain of living waters, and hewed them out cisterns, broken
--          cisterns, that can hold no water)
--        NT:     ★★★ John 4:10 (the gift of Elohim... he would have given thee living water), ★★★ John 4:14
--                (a well of water springing up into everlasting life), ★★ John 7:37-38 (if any man thirst...
--                out of his belly shall flow rivers of living water) — THREAD 2
--        Extras: none warranted (clean canon-NT weave; the living-water motif is canon-NT spine)
--        Tanakh: ★★ Jeremiah 17:13 (they have forsaken Yahuah, the fountain of living waters — lateral, same
--                prophet), ★ Psalm 36:9 (with thee is the fountain of life) — THREAD 2
--   v.14-19 (Is Yashar''el a servant?... thou hast forsaken Yahuah Elohayka; thy backslidings shall reprove
--          thee; the way of Egypt, the waters of Sihor; the way of Assyria) — the fruit of forsaking
--        NT:     none warranted (the consequence of v.13''s forsaking; woven in THREAD 2 prose)
--        Extras: none warranted
--        Tanakh: held in prose — *thou hast forsaken Yahuah Elohayka (the LORD thy God)* (2:17,19) is the
--                two-evils charge of v.13 unfolded; bound to THREAD 2
--   ★ v.20-22 (of old time I have broken thy yoke... thou wanderest, playing the harlot; I had planted thee
--          a noble vine, wholly a right seed: how then art thou turned into the degenerate plant of a strange
--          vine?... though thou wash thee with nitre... thine iniquity is marked before me)
--        NT:     none warranted distinct (the vineyard-judgment held to Isaiah 5; the harlotry-charge is the
--                bride-lawsuit of THREAD 1/3)
--        Extras: none warranted
--        Tanakh: ★★ Isaiah 5:1-4 (a vineyard... it brought forth wild grapes), ★ Psalm 80:8-9 (a vine out
--                of Egypt... it filled the land — lateral), ★ Hosea 10:1 (Yashar''el is an empty vine) — THREAD 3
--   v.23-28 (I have not gone after Baalim; a wild ass... I have loved strangers; the house of Yashar''el
--          ashamed; saying to a stock, Thou art my father; according to the number of thy cities are thy
--          gods, O Yahudah) — the idolatry catalogued (BOTH houses named)
--        NT:     none warranted   Extras: none warranted
--        Tanakh: held in prose — the harlotry/idolatry charge; *the house of Yashar''el (Israel)* (2:26) and
--                *O Yahudah (Judah)* (2:28) — both houses indicted, bound to THREAD 3
--   v.29-31 (ye all have transgressed; in vain have I smitten your children; Have I been a wilderness unto
--          Yashar''el?) — the lawsuit pressed
--        NT: none   Extras: none   Tanakh: none separate (the plea continues; framed in prose)
--   ★ v.32 (Can a maid forget her ornaments, or a bride her attire? yet my people have forgotten me days
--          without number)
--        NT:     none warranted distinct (the forgetting-bride is the heart of the bride-lawsuit; THREAD 3)
--        Extras: none warranted
--        Tanakh: bound to THREAD 3 (the bride who forgot her husband — the inversion of v.2''s remembered love)
--   v.33-37 (why trimmest thou thy way to seek love?... in thy skirts is found the blood of the poor
--          innocents; thou shalt be ashamed of Egypt, as thou wast ashamed of Assyria; Yahuah hath rejected
--          thy confidences) — the verdict, the failed foreign alliances
--        NT:     none warranted   Extras: none warranted
--        Tanakh: held in prose — the trusting-in-Egypt/Assyria (the broken cisterns of v.13 in political
--                form); the verdict closing the lawsuit; bound to THREADs 2/3
--
-- Threads (slug — target libraries):
--   1. jeremiah-2-the-love-of-thine-espousals-israel-the-bride-in-the-wilderness — NT (Revelation 2) +
--      Tanakh (Hosea 2, Deuteronomy 8, Exodus 19) [free]
--      (★ the bride''s first love in the wilderness honeymoon; Yashar''el holiness unto Yahuah, the firstfruits)
--   2. jeremiah-2-the-fountain-of-living-waters-forsaken-for-broken-cisterns — NT (John 4, John 7) +
--      Tanakh (Jeremiah 17, Psalm 36) [free]
--      (★★ the two evils: the living Fountain abandoned for cracked cisterns; the living water Yahusha gives)
--   3. jeremiah-2-the-noble-vine-turned-degenerate-the-bride-who-forgot — Tanakh (Isaiah 5, Psalm 80,
--      Hosea 10) [free]
--      (★ the noble vine gone wild; the bride who forgot her husband days without number)
--
-- Framing notes:
--   ★ THE LOVE OF THINE ESPOUSALS (THREAD 1): *I remember thee, the kindness of thy youth, the love of
--      thine espousals, when thou wentest after me in the wilderness, in a land that was not sown* (2:2) —
--      the covenant is a MARRIAGE, and Yahuah remembers the honeymoon: the bride who followed her husband
--      out into the wilderness, when *Yashar''el (Israel) was holiness unto Yahuah (LORD), and the firstfruits
--      of his increase* (2:3). Hosea sings the very restoration of that first love: *I will allure her, and
--      bring her into the wilderness... and she shall sing there, as in the days of her youth* (Hos 2:14-15).
--      Deuteronomy names the wilderness leading: *thou shalt remember all the way which Yahuah Elohayka
--      (the LORD thy God) led thee these forty years in the wilderness* (Deut 8:2). Exodus names what the
--      bride was made: *a peculiar treasure unto me above all people... a kingdom of priests, and an holy
--      nation* (Exod 19:5-6) — the holiness of 2:3. And the Spirit''s word to Ephesus is the same grief:
--      *thou hast left thy first love* (Rev 2:4) — the espousal-love forsaken. Covenant-marriage lawsuit
--      against SIN, never ethnic indictment: the wronged Husband grieving a bride who left her first love.
--   ★★ THE FOUNTAIN FORSAKEN FOR BROKEN CISTERNS (THREAD 2): *My people have committed two evils; they
--      have forsaken me the fountain of living waters, and hewed them out cisterns, broken cisterns, that
--      can hold no water* (2:13) — the heart of the lawsuit. The first evil: abandoning the living Fountain
--      (Yahuah himself). The second: digging cracked cisterns (the no-gods, *which are yet no gods*, 2:11)
--      that hold no water. The same prophet says it again: *they have forsaken Yahuah (LORD), the fountain
--      of living waters* (Jer 17:13). The psalm names the Fountain: *with thee is the fountain of life: in
--      thy light shall we see light* (Ps 36:9). And the FORMED Son weaves it forward at Jacob''s well:
--      *If thou knewest the gift of Elohim (God), and who it is that saith to thee, Give me to drink; thou
--      wouldest have asked of him, and he would have given thee living water* (John 4:10), *the water that
--      I shall give him shall be in him a well of water springing up into everlasting life* (John 4:14); and
--      at the feast: *If any man thirst, let him come unto me, and drink. He that believeth on me... out of
--      his belly shall flow rivers of living water* (John 7:37-38). The living Fountain forsaken in Jeremiah
--      is the living water offered in Yahusha — the cracked cistern can never hold what the Fountain freely
--      gives.
--   ★ THE NOBLE VINE TURNED DEGENERATE (THREAD 3): *Yet I had planted thee a noble vine, wholly a right
--      seed: how then art thou turned into the degenerate plant of a strange vine unto me?* (2:21) — the
--      chosen vine gone wild. Isaiah sings the same vineyard: *he planted it with the choicest vine... and
--      he looked that it should bring forth grapes, and it brought forth wild grapes* (Isa 5:2,4), *for the
--      vineyard of Yahuah Tseva''ot (LORD of hosts) is the house of Yashar''el (Israel)* (Isa 5:7). The psalm
--      laments the vine out of Egypt: *Thou hast brought a vine out of Egypt... and didst cause it to take
--      deep root, and it filled the land* (Ps 80:8-9). Hosea names the emptiness: *Yashar''el (Israel) is an
--      empty vine, he bringeth forth fruit unto himself* (Hos 10:1). And the chapter closes the bride-figure:
--      *Can a maid forget her ornaments, or a bride her attire? yet my people have forgotten me days without
--      number* (2:32) — the bride who forgot her Husband, the inversion of the remembered espousal-love of
--      v.2. The noble vine and the forgetting bride are one indictment: a people planted holy, turned wild.
--   VERSES WITH NO SEPARATE ADD: v.1 (the word-came preface), v.4-8 (the lawsuit charge against the leaders
--      who handle the Torah yet knew Yahuah not — woven into THREAD 2 prose), v.9-10 (the plea form), v.14-19
--      (the fruit of forsaking, the way of Egypt/Assyria — the broken cisterns of v.13 unfolded, THREAD 2),
--      v.23-28 (the idolatry catalogued, BOTH houses named — bound to THREAD 3), v.29-31 (the plea pressed),
--      v.33-37 (the verdict, the failed foreign alliances — bound to THREADs 2/3). All blocks recorded above;
--      every meaningful section carries or is bound to a thread.

CREATE TEMP VIEW _s309_jer02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): the love of thine espousals — Yashar'el the bride in the wilderness
    ('canon','jeremiah',2,2,'canon','revelation',2,4,'free',
      E'*Nevertheless I have somewhat against thee, because thou hast left thy first love* (Revelation 2:4). The Spirit''s grief over Ephesus is the very grief of the covenant Husband — *I remember thee, the kindness of thy youth, the love of thine espousals, when thou wentest after me in the wilderness* (Jeremiah 2:2). The espousal-love of the bride''s youth, forsaken, is the first love left; in both, the One who loved first remembers, and calls his people back to the first works of that love.'),
    ('canon','jeremiah',2,2,'canon','hosea',2,14,'free',
      E'*Therefore, behold, I will allure her, and bring her into the wilderness, and speak comfortably unto her* (Hosea 2:14). Hosea promises to restore the very honeymoon Jeremiah remembers — *the love of thine espousals, when thou wentest after me in the wilderness* (Jeremiah 2:2). The wilderness where the bride once followed her Husband becomes the place he woos her again, speaking comfortably to win back the love of her youth.'),
    ('canon','jeremiah',2,2,'canon','hosea',2,15,'free',
      E'*And she shall sing there, as in the days of her youth, and as in the day when she came up out of the land of Egypt* (Hosea 2:15). The kindness of the bride''s youth that Yahuah remembers — *the kindness of thy youth, the love of thine espousals* (Jeremiah 2:2) — is the very singing Hosea promises to renew: *as in the days of her youth*. The wilderness honeymoon forsaken is the wilderness honeymoon restored.'),
    ('canon','jeremiah',2,2,'canon','deuteronomy',8,2,'free',
      E'*And thou shalt remember all the way which Yahuah Elohayka (the LORD thy God) led thee these forty years in the wilderness, to humble thee, and to prove thee, to know what was in thine heart, whether thou wouldest keep his commandments, or no* (Deuteronomy 8:2). Jeremiah''s *when thou wentest after me in the wilderness, in a land that was not sown* (Jeremiah 2:2) recalls this same leading — the bride following her Husband through the wilderness. The remembering Moses commands is the kindness of the youth Yahuah himself remembers.'),
    ('canon','jeremiah',2,3,'canon','exodus',19,5,'free',
      E'*Now therefore, if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people: for all the earth is mine* (Exodus 19:5). What Jeremiah calls the bride — *Yashar''el (Israel) was holiness unto Yahuah (LORD), and the firstfruits of his increase* (Jeremiah 2:3) — Exodus makes the marriage-covenant: a peculiar treasure, set apart and holy unto Yahuah above all people. The firstfruits-holiness of Jeremiah 2:3 is the peculiar-treasure calling of Sinai.'),
    ('canon','jeremiah',2,3,'canon','exodus',19,6,'free',
      E'*And ye shall be unto me a kingdom of priests, and an holy nation. These are the words which thou shalt speak unto the children of Yashar''el (Israel)* (Exodus 19:6). *Yashar''el (Israel) was holiness unto Yahuah (LORD), and the firstfruits of his increase* (Jeremiah 2:3) names what Sinai made the bride: a holy nation, a kingdom of priests, set apart unto her Husband. The holiness Jeremiah grieves the loss of is the holy-nation calling spoken at the mount.'),

    -- THREAD 2 (★★): the two evils — the fountain of living waters forsaken for broken cisterns
    ('canon','jeremiah',2,13,'canon','john',4,10,'free',
      E'*Yahusha (Jesus) answered and said unto her, If thou knewest the gift of Elohim (God), and who it is that saith to thee, Give me to drink; thou wouldest have asked of him, and he would have given thee living water* (John 4:10). At Jacob''s well the FORMED Son offers the very thing Jeremiah''s people forsook — *they have forsaken me the fountain of living waters* (Jeremiah 2:13). The living water abandoned in the lawsuit is the gift of Elohim freely held out; the Fountain himself stands at the well, asking the bride to drink.'),
    ('canon','jeremiah',2,13,'canon','john',4,14,'free',
      E'*But whosoever drinketh of the water that I shall give him shall never thirst; but the water that I shall give him shall be in him a well of water springing up into everlasting life* (John 4:14). Jeremiah''s broken cisterns *that can hold no water* (Jeremiah 2:13) are answered by the well that never runs dry — *a well of water springing up into everlasting life*. The cracked cistern leaks and leaves the soul thirsting; the living water Yahusha gives wells up within, forever.'),
    ('canon','jeremiah',2,13,'canon','john',7,37,'free',
      E'*In the last day, that great day of the feast, Yahusha (Jesus) stood and cried, saying, If any man thirst, let him come unto me, and drink* (John 7:37). To a people who *hewed them out cisterns, broken cisterns, that can hold no water* (Jeremiah 2:13), the Fountain cries the invitation: *if any man thirst, let him come unto me*. The two evils of forsaking the Fountain and digging dry cisterns are undone by coming to the One who is the living water.'),
    ('canon','jeremiah',2,13,'canon','john',7,38,'free',
      E'*He that believeth on me, as the scripture hath said, out of his belly shall flow rivers of living water* (John 7:38). Where Jeremiah''s cisterns held *no water* (Jeremiah 2:13), the One who is the Fountain makes the believer himself a spring — *out of his belly shall flow rivers of living water*. The forsaken fountain of living waters becomes, in those who come to him, an overflowing river.'),
    ('canon','jeremiah',2,13,'canon','jeremiah',17,13,'free',
      E'*O Yahuah (LORD), the hope of Yashar''el (Israel), all that forsake thee shall be ashamed, and they that depart from me shall be written in the earth, because they have forsaken Yahuah (LORD), the fountain of living waters* (Jeremiah 17:13). The same prophet names the same evil twice: to forsake Yahuah is to forsake *the fountain of living waters* (Jeremiah 2:13). The Fountain abandoned is the hope of Yashar''el departed from; those who leave the living waters for cracked cisterns are written in the dust.'),
    ('canon','jeremiah',2,13,'canon','psalms',36,9,'free',
      E'*For with thee is the fountain of life: in thy light shall we see light* (Psalm 36:9). The psalm names the very Fountain Jeremiah''s people forsook — *the fountain of living waters* (Jeremiah 2:13). With Yahuah is the fountain of life; to forsake him for broken cisterns is to leave the source of life itself for vessels that hold no water.'),

    -- THREAD 3 (★): the noble vine turned degenerate — the bride who forgot her husband
    ('canon','jeremiah',2,21,'canon','isaiah',5,2,'free',
      E'*And he fenced it, and gathered out the stones thereof, and planted it with the choicest vine, and built a tower in the midst of it, and also made a winepress therein: and he looked that it should bring forth grapes, and it brought forth wild grapes* (Isaiah 5:2). Isaiah''s vineyard-song is Jeremiah''s charge in another key — *I had planted thee a noble vine, wholly a right seed: how then art thou turned into the degenerate plant of a strange vine unto me?* (Jeremiah 2:21). The choicest vine planted by the Husbandman brought forth wild grapes; the noble vine turned degenerate.'),
    ('canon','jeremiah',2,21,'canon','isaiah',5,4,'free',
      E'*What could have been done more to my vineyard, that I have not done in it? wherefore, when I looked that it should bring forth grapes, brought it forth wild grapes?* (Isaiah 5:4). The grieved Husbandman of Isaiah asks what Jeremiah''s lawsuit asks — *how then art thou turned into the degenerate plant of a strange vine unto me?* (Jeremiah 2:21). Nothing was lacking in the planting; the noble vine, given every care, turned wild of its own backsliding.'),
    ('canon','jeremiah',2,21,'canon','psalms',80,8,'free',
      E'*Thou hast brought a vine out of Egypt: thou hast cast out the heathen, and planted it* (Psalm 80:8). The psalm remembers the planting Jeremiah names — *I had planted thee a noble vine, wholly a right seed* (Jeremiah 2:21). The vine brought out of Egypt and planted in the land is the noble vine of the covenant; its breaking-down is the degeneration Jeremiah grieves.'),
    ('canon','jeremiah',2,21,'canon','psalms',80,9,'free',
      E'*Thou preparedst room before it, and didst cause it to take deep root, and it filled the land* (Psalm 80:9). The deep-rooted vine that *filled the land* is the *noble vine, wholly a right seed* (Jeremiah 2:21) Yahuah planted. The psalm''s lament that its hedges are broken down (Ps 80:12) is the same turning Jeremiah names — the planted vine gone strange.'),
    ('canon','jeremiah',2,32,'canon','hosea',10,1,'free',
      E'*Yashar''el (Israel) is an empty vine, he bringeth forth fruit unto himself: according to the multitude of his fruit he hath increased the altars* (Hosea 10:1). Hosea names the emptiness behind the forgetting — *yet my people have forgotten me days without number* (Jeremiah 2:32). The vine that bears fruit *unto himself*, not unto his Husband, is the bride who forgot her attire; the noble vine made empty by its own backsliding.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s309_jer02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s309_jer02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-2-the-love-of-thine-espousals-israel-the-bride-in-the-wilderness',
       E'The love of thine espousals — Yashar''el the bride in the wilderness',
       E'The covenant lawsuit opens not with a list of charges but with a memory of love, for the covenant is a MARRIAGE: *Thus saith Yahuah (LORD); I remember thee, the kindness of thy youth, the love of thine espousals, when thou wentest after me in the wilderness, in a land that was not sown* (2:2). Yahuah remembers the honeymoon — the bride who followed her Husband out into the trackless wilderness, when she was wholly his: *Yashar''el (Israel) was holiness unto Yahuah (LORD), and the firstfruits of his increase* (2:3). That holiness is the calling spoken at Sinai: *if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people... And ye shall be unto me a kingdom of priests, and an holy nation* (Exodus 19:5-6). The wilderness leading is the very thing Moses bids her remember: *thou shalt remember all the way which Yahuah Elohayka (the LORD thy God) led thee these forty years in the wilderness... to know what was in thine heart, whether thou wouldest keep his commandments, or no* (Deuteronomy 8:2). And Hosea promises to win that first love back: *Therefore, behold, I will allure her, and bring her into the wilderness, and speak comfortably unto her... and she shall sing there, as in the days of her youth, and as in the day when she came up out of the land of Egypt* (Hosea 2:14-15). The wilderness where the bride first loved becomes the place her Husband woos her again. And the Spirit speaks the same grief to Ephesus: *Nevertheless I have somewhat against thee, because thou hast left thy first love* (Revelation 2:4) — *Remember therefore from whence thou art fallen, and repent, and do the first works* (Rev 2:5). This is covenant-marriage lawsuit against SIN, never an indictment of a people: the wronged Husband grieving a bride who left the love of her espousals, and calling her home to the first works of that love.',
       sv.verse_id, ev.verse_id, 'free', 34025
  FROM _s309_jer02_lookup sv, _s309_jer02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=2 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=2 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-2-the-fountain-of-living-waters-forsaken-for-broken-cisterns',
       E'The fountain of living waters forsaken for broken cisterns',
       E'Here is the heart of the lawsuit, the charge that names the whole tragedy: *For my people have committed two evils; they have forsaken me the fountain of living waters, and hewed them out cisterns, broken cisterns, that can hold no water* (2:13). Two evils, not one. The first: abandoning the living Fountain — Yahuah himself, the source of life. The second: digging cracked cisterns in his place — the no-gods, *which are yet no gods* (2:11), idols that hold no water and quench no thirst. The folly is staggering: *Hath a nation changed their gods, which are yet no gods? but my people have changed their glory for that which doth not profit* (2:11). The same prophet repeats the charge in his own prayer: *they have forsaken Yahuah (LORD), the fountain of living waters* (Jeremiah 17:13). The psalm names what was forsaken: *For with thee is the fountain of life: in thy light shall we see light* (Psalm 36:9). And the FORMED Son weaves it forward — wearied at Jacob''s well, he becomes the Fountain offering himself to a Samaritan bride: *If thou knewest the gift of Elohim (God), and who it is that saith to thee, Give me to drink; thou wouldest have asked of him, and he would have given thee living water* (John 4:10), *the water that I shall give him shall be in him a well of water springing up into everlasting life* (John 4:14). And on the great day of the feast he cries the invitation aloud: *If any man thirst, let him come unto me, and drink. He that believeth on me, as the scripture hath said, out of his belly shall flow rivers of living water* (John 7:37-38). The living Fountain forsaken in Jeremiah is the living water freely offered in Yahusha (Jesus); the cracked cistern can never hold what the Fountain forever gives. The thirsty bride need only come back to the Fountain she left.',
       sv.verse_id, ev.verse_id, 'free', 34028
  FROM _s309_jer02_lookup sv, _s309_jer02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=2 AND sv.verse_number=11
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=2 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-2-the-noble-vine-turned-degenerate-the-bride-who-forgot',
       E'I had planted thee a noble vine — the degenerate plant, the bride who forgot',
       E'Yahuah turns to a second figure for the same betrayal — the vineyard: *Yet I had planted thee a noble vine, wholly a right seed: how then art thou turned into the degenerate plant of a strange vine unto me?* (2:21). The Husbandman planted the choicest stock, *wholly a right seed*, and looked for noble grapes; he found a wild and strange vine. The stain runs deep: *For though thou wash thee with nitre, and take thee much soap, yet thine iniquity is marked before me* (2:22). Isaiah sings the same vineyard-song: *he planted it with the choicest vine... and he looked that it should bring forth grapes, and it brought forth wild grapes* (Isaiah 5:2); *What could have been done more to my vineyard, that I have not done in it?* (Isaiah 5:4) — *for the vineyard of Yahuah Tseva''ot (LORD of hosts) is the house of Yashar''el (Israel)* (Isa 5:7). The psalm remembers the planting and laments the breaking-down: *Thou hast brought a vine out of Egypt... and didst cause it to take deep root, and it filled the land* (Psalm 80:8-9). And Hosea names the emptiness: *Yashar''el (Israel) is an empty vine, he bringeth forth fruit unto himself* (Hosea 10:1) — fruit for himself, not for his Husband. The chapter closes the bride-figure where it opened: *Can a maid forget her ornaments, or a bride her attire? yet my people have forgotten me days without number* (2:32). No bride forgets her wedding-attire — yet this bride forgot her Husband himself, days beyond counting. The noble vine gone wild and the bride who forgot are one indictment: a people planted holy, a right seed, turned strange — and yet the One who planted them is the One who can yet make them sing as in the days of their youth.',
       sv.verse_id, ev.verse_id, 'free', 34031
  FROM _s309_jer02_lookup sv, _s309_jer02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=2 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=2 AND ev.verse_number=32
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *thou hast left thy first love* (Revelation 2:4) — the Spirit''s grief over Ephesus is the covenant Husband''s grief over the *love of thine espousals* (Jeremiah 2:2) forsaken.'
  FROM cross_reference_threads t
  JOIN _s309_jer02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s309_jer02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=2 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-2-the-love-of-thine-espousals-israel-the-bride-in-the-wilderness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *I will allure her, and bring her into the wilderness, and speak comfortably unto her* (Hosea 2:14) — Yahuah woos the bride back to the wilderness honeymoon of Jeremiah 2:2.'
  FROM cross_reference_threads t
  JOIN _s309_jer02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s309_jer02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-2-the-love-of-thine-espousals-israel-the-bride-in-the-wilderness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *she shall sing there, as in the days of her youth... when she came up out of the land of Egypt* (Hosea 2:15) — the kindness of the youth Yahuah remembers (Jeremiah 2:2), renewed.'
  FROM cross_reference_threads t
  JOIN _s309_jer02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s309_jer02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-2-the-love-of-thine-espousals-israel-the-bride-in-the-wilderness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Yahuah Elohayka (the LORD thy God) led thee these forty years in the wilderness* (Deuteronomy 8:2) — the wilderness leading the bride followed in Jeremiah 2:2.'
  FROM cross_reference_threads t
  JOIN _s309_jer02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=2 AND sv.verse_number=2
  JOIN _s309_jer02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=8 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-2-the-love-of-thine-espousals-israel-the-bride-in-the-wilderness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *a peculiar treasure unto me above all people... for all the earth is mine* (Exodus 19:5) — the holiness of the bride (Jeremiah 2:3) is the peculiar-treasure calling of Sinai.'
  FROM cross_reference_threads t
  JOIN _s309_jer02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=2 AND sv.verse_number=3
  JOIN _s309_jer02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-2-the-love-of-thine-espousals-israel-the-bride-in-the-wilderness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *a kingdom of priests, and an holy nation* (Exodus 19:6) — what *Yashar''el (Israel) was holiness unto Yahuah (LORD)* (Jeremiah 2:3) names: the holy-nation calling spoken at the mount.'
  FROM cross_reference_threads t
  JOIN _s309_jer02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=2 AND sv.verse_number=3
  JOIN _s309_jer02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-2-the-love-of-thine-espousals-israel-the-bride-in-the-wilderness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *he would have given thee living water* (John 4:10) — at Jacob''s well the Formed Son offers the very Fountain Jeremiah 2:13''s people forsook; the gift of Elohim held out to the bride.'
  FROM cross_reference_threads t
  JOIN _s309_jer02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=2 AND sv.verse_number=13
  JOIN _s309_jer02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=4 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-2-the-fountain-of-living-waters-forsaken-for-broken-cisterns'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *a well of water springing up into everlasting life* (John 4:14) — the broken cisterns *that can hold no water* (Jeremiah 2:13) answered by the well that never runs dry.'
  FROM cross_reference_threads t
  JOIN _s309_jer02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=2 AND sv.verse_number=13
  JOIN _s309_jer02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=4 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-2-the-fountain-of-living-waters-forsaken-for-broken-cisterns'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *If any man thirst, let him come unto me, and drink* (John 7:37) — the Fountain''s invitation to those who dug dry cisterns (Jeremiah 2:13).'
  FROM cross_reference_threads t
  JOIN _s309_jer02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=2 AND sv.verse_number=13
  JOIN _s309_jer02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=7 AND tv.verse_number=37
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-2-the-fountain-of-living-waters-forsaken-for-broken-cisterns'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *out of his belly shall flow rivers of living water* (John 7:38) — where Jeremiah 2:13''s cisterns held no water, the believer becomes an overflowing spring.'
  FROM cross_reference_threads t
  JOIN _s309_jer02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=2 AND sv.verse_number=13
  JOIN _s309_jer02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=7 AND tv.verse_number=38
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-2-the-fountain-of-living-waters-forsaken-for-broken-cisterns'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *they have forsaken Yahuah (LORD), the fountain of living waters* (Jeremiah 17:13) — the same prophet names the same evil twice; the Fountain abandoned (Jeremiah 2:13).'
  FROM cross_reference_threads t
  JOIN _s309_jer02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=2 AND sv.verse_number=13
  JOIN _s309_jer02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=17 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-2-the-fountain-of-living-waters-forsaken-for-broken-cisterns'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *with thee is the fountain of life: in thy light shall we see light* (Psalm 36:9) — the psalm names the Fountain Jeremiah 2:13''s people left for cracked cisterns.'
  FROM cross_reference_threads t
  JOIN _s309_jer02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=2 AND sv.verse_number=13
  JOIN _s309_jer02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=36 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-2-the-fountain-of-living-waters-forsaken-for-broken-cisterns'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *he planted it with the choicest vine... and it brought forth wild grapes* (Isaiah 5:2) — Isaiah''s vineyard-song is the *noble vine... turned into the degenerate plant* (Jeremiah 2:21) in another key.'
  FROM cross_reference_threads t
  JOIN _s309_jer02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=2 AND sv.verse_number=21
  JOIN _s309_jer02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-2-the-noble-vine-turned-degenerate-the-bride-who-forgot'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *What could have been done more to my vineyard?* (Isaiah 5:4) — the grieved Husbandman asks what Jeremiah 2:21 asks: nothing was lacking, yet the vine turned wild.'
  FROM cross_reference_threads t
  JOIN _s309_jer02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=2 AND sv.verse_number=21
  JOIN _s309_jer02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=5 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-2-the-noble-vine-turned-degenerate-the-bride-who-forgot'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Thou hast brought a vine out of Egypt... and planted it* (Psalm 80:8) — the vine out of Egypt is the *noble vine, wholly a right seed* (Jeremiah 2:21) Yahuah planted.'
  FROM cross_reference_threads t
  JOIN _s309_jer02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=2 AND sv.verse_number=21
  JOIN _s309_jer02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=80 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-2-the-noble-vine-turned-degenerate-the-bride-who-forgot'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *didst cause it to take deep root, and it filled the land* (Psalm 80:9) — the deep-rooted vine of the covenant is the noble vine of Jeremiah 2:21, its hedges later broken.'
  FROM cross_reference_threads t
  JOIN _s309_jer02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=2 AND sv.verse_number=21
  JOIN _s309_jer02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=80 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-2-the-noble-vine-turned-degenerate-the-bride-who-forgot'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *Yashar''el (Israel) is an empty vine, he bringeth forth fruit unto himself* (Hosea 10:1) — the emptiness behind the bride who *forgotten me days without number* (Jeremiah 2:32); fruit borne unto self, not unto the Husband.'
  FROM cross_reference_threads t
  JOIN _s309_jer02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=2 AND sv.verse_number=32
  JOIN _s309_jer02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=10 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-2-the-noble-vine-turned-degenerate-the-bride-who-forgot'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jeremiah_3.sql (Jeremiah 3) -----
-- Chapter: Jeremiah 3 — ★★ THE TWO-HOUSE DIAGNOSIS AND THE CALL TO RETURN. The northern house,
-- backsliding Yashar''el (Israel), is gone up upon every high mountain and there played the harlot;
-- for all her adulteries Yahuah put her away and gave her a bill of divorce — the divorced north,
-- Hosea''s Lo-Ammi. Her treacherous sister Yahudah (Judah) saw it and feared not, and turned not with
-- her whole heart but feignedly. Yet the word toward the NORTH is mercy: *Return, thou backsliding
-- Yashar''el... for I am merciful... I am married unto you; and I will take you one of a city, and
-- two of a family, and I will bring you to Zion* — the divorced wife mercifully regathered. He
-- promises pastors according to his own heart; a day when the ark is not missed and Jerusalem is
-- the throne of Yahuah, the nations gathered to it; and the two houses walking TOGETHER out of the
-- north (3:18, the Ezekiel-37 frame). The chapter closes on the penitent confession — *Return, ye
-- backsliding children, and I will heal your backslidings... truly in Yahuah Eloheinu (the LORD our
-- God) is the salvation of Yashar''el (Israel).*
-- Tag: jer03   Temp view: _s309_jer03_lookup
-- Sort band: base 34050, step 3 -> threads at 34050, 34053, 34056, 34059, 34062 (5 threads)
-- Source of EVERY row: 'canon','jeremiah',3,v
--
-- Jeremiah 3 coverage:
--   v.1-5 (If a man put away his wife... shall he return unto her again?... thou hast played the
--          harlot with many lovers; yet return again to me; Wilt thou not... cry unto me, My father?)
--        NT:     none warranted distinct (the put-away wife / the harlot-yet-called-back; the divorce
--                doctrine carried by THREAD 1, the return-call by THREAD 2)
--        Extras: none warranted
--        Tanakh: the divorce-of-the-wife motif bound to Isaiah 50:1 in THREAD 1 prose; held there
--   ★★★ v.6-11 (backsliding Yashar''el is gone up upon every high mountain... played the harlot; Turn
--          thou unto me, but she returned not; her treacherous sister Yahudah saw it; I had put her
--          away, and given her a bill of divorce; yet treacherous Yahudah feared not... backsliding
--          Yashar''el hath justified herself more than treacherous Yahudah)
--        NT:     none warranted (the two-house diagnosis is rooted Tanakh-and-Hosea; no extra forced)
--        Extras: none warranted
--        Tanakh: ★★★ Hosea 1:6 (Lo-ruhamah: I will no more have mercy upon the house of Yashar''el),
--                ★★★ Hosea 1:9 (Lo-ammi: ye are not my people), ★★ Hosea 2:2 (she is not my wife,
--                neither am I her husband), ★★ Ezekiel 23:4 (Aholah and Aholibah, the two sisters —
--                Samaria and Jerusalem), ★★ Isaiah 50:1 (where is the bill of your mother''s
--                divorcement?), ★★ 2 Kings 17:18 (Yahuah removed Yashar''el out of his sight) — THREAD 1
--   ★★★ v.12-14 (Return, thou backsliding Yashar''el... I am merciful... I will not keep anger for
--          ever; Turn, O backsliding children... for I am married unto you: and I will take you one
--          of a city, and two of a family, and I will bring you to Zion)
--        NT:     ★★ Romans 11:26 (all Yashar''el shall be saved... out of Sion the Deliverer),
--                ★ Romans 11:27 (this is my covenant... when I shall take away their sins) — THREAD 2
--        Extras: none warranted
--        Tanakh: ★★★ Hosea 2:19 (I will betroth thee unto me for ever), ★★★ Hosea 2:23 (I will say to
--                them which were not my people, Thou art my people), ★★ Hosea 3:1 (love a woman...
--                yet an adulteress), ★★ Hosea 3:5 (afterward shall the children of Yashar''el return),
--                ★★ Ezekiel 37:21 (I will take the children of Yashar''el from among the heathen),
--                ★★ Ezekiel 37:22 (I will make them one nation) — THREAD 2
--   ★★ v.15 (And I will give you pastors according to mine heart, which shall feed you with knowledge
--          and understanding)
--        NT:     ★ John 21:17 (Feed my sheep), ★ Acts 20:28 (feed the church of Elohim),
--                ★ Ephesians 4:11 (he gave some, pastors and teachers) — THREAD 3
--        Extras: none warranted
--        Tanakh: ★★ Ezekiel 34:23 (one shepherd, my servant David — lateral), ★ Jeremiah 23:4 (I will
--                set up shepherds over them — lateral) — THREAD 3
--   ★ v.16-17 (they shall say no more, The ark of the covenant of Yahuah; neither shall they remember
--          it; At that time they shall call Jerusalem the throne of Yahuah; and all the nations shall
--          be gathered unto it, to the name of Yahuah)
--        NT:     ★ Revelation 21:3 (the tabernacle of Elohim is with men), ★ Revelation 21:24 (the
--                nations of them which are saved shall walk in the light of it), ★ John 4:23 (the true
--                worshippers shall worship the Father in spirit and in truth) — THREAD 4
--        Extras: none warranted
--        Tanakh: ★ Isaiah 2:3 (out of Zion shall go forth the law... all nations shall flow unto it),
--                ★ Zechariah 8:22 (many people and strong nations shall come to seek Yahuah) — THREAD 4
--   v.18 (the house of Yahudah shall walk with the house of Yashar''el... out of the land of the north)
--        NT:     none warranted distinct (the two houses made one; the Ezekiel-37 frame held in THREAD 2)
--        Extras: none warranted
--        Tanakh: held in prose — *they shall come together out of the land of the north* binds to the
--                regathering of THREAD 2 (Ezekiel 37:21-22); woven there
--   v.19-21 (How shall I put thee among the children... Thou shalt call me, My father; as a wife
--          treacherously departeth... so have ye dealt treacherously, O house of Yashar''el; a voice...
--          weeping of the children of Yashar''el, for they have perverted their way)
--        NT:     none warranted     Extras: none warranted
--        Tanakh: held in prose — the treacherous-wife charge restates v.6-11 (THREAD 1); the weeping
--                on the high places turns to the penitent return of v.22-25 (THREAD 5)
--   ★ v.22-25 (Return, ye backsliding children, and I will heal your backslidings; Behold, we come
--          unto thee; truly in vain is salvation hoped for from the hills... truly in Yahuah Eloheinu
--          is the salvation of Yashar''el; we have sinned against Yahuah Eloheinu)
--        NT:     none warranted (the penitent confession is Hosea-rooted; no NT forced)
--        Extras: none warranted
--        Tanakh: ★★ Hosea 14:1 (O Yashar''el, return unto Yahuah Elohayka), ★★ Hosea 14:4 (I will heal
--                their backsliding), ★ Hosea 6:1 (come, and let us return unto Yahuah) — THREAD 5
--
-- Threads (slug — target libraries):
--   1. jeremiah-3-backsliding-yasharel-divorced-and-treacherous-yahudah — Tanakh (Hosea 1, Hosea 2, Ezekiel 23, Isaiah 50, 2 Kings 17) [free]
--      (★★★ THE two-house diagnosis: the northern house divorced — the bill of divorce, Lo-Ammi — and the southern house treacherous)
--   2. jeremiah-3-return-thou-backsliding-yasharel-i-will-bring-you-to-zion — NT (Romans 11) + Tanakh (Hosea 2, Hosea 3, Ezekiel 37) [free]
--      (★★★ the call to the divorced north to RETURN — mercy over the divorce, married still, one of a city and two of a family, brought to Zion, the two-house regathering)
--   3. jeremiah-3-pastors-according-to-mine-heart — NT (John 21, Acts 20, Ephesians 4) + Tanakh (Ezekiel 34, Jeremiah 23) [free]
--      (★★ the true shepherds promised — pastors according to Yahuah''s heart, the one Shepherd, the flock fed)
--   4. jeremiah-3-jerusalem-the-throne-of-yahuah-the-nations-gathered — NT (Revelation 21, John 4) + Tanakh (Isaiah 2, Zechariah 8) [free]
--      (★ the ark not missed — Yahuah himself present; Jerusalem the throne, all the nations gathered, the true worship)
--   5. jeremiah-3-return-ye-backsliding-children-i-will-heal-your-backslidings — Tanakh (Hosea 14, Hosea 6) [free]
--      (★ the penitent return and confession — I will heal your backslidings; in Yahuah is the salvation of Yashar''el)
--
-- Framing notes:
--   ★★★ THE TWO-HOUSE DIAGNOSIS (THREAD 1): *Hast thou seen that which backsliding Yashar''el (Israel)
--      hath done? she is gone up upon every high mountain... and there hath played the harlot... And I
--      saw, when for all the causes whereby backsliding Yashar''el (Israel) committed adultery I had put
--      her away, and given her a bill of divorce; yet her treacherous sister Yahudah (Judah) feared not*
--      (3:6,8). This is the heart of the two-house frame: the NORTHERN house (Yashar''el/Ephraim) was
--      divorced and scattered through Assyria, and the SOUTHERN house (Yahudah) saw it and feared not.
--      Hosea names the divorce by the children''s names: *Call her name Lo-ruhamah: for I will no more
--      have mercy upon the house of Yashar''el (Israel)* (Hos 1:6), *Call his name Lo-ammi: for ye are
--      not my people* (Hos 1:9), *she is not my wife, neither am I her husband* (Hos 2:2). Ezekiel draws
--      the two sisters: *Samaria is Aholah, and Jerusalem Aholibah* (Ezek 23:4). Isaiah asks after the
--      very document: *Where is the bill of your mother''s divorcement, whom I have put away?* (Isa 50:1).
--      And Kings records the putting-away: *Therefore Yahuah (LORD) was very angry with Yashar''el
--      (Israel), and removed them out of his sight: there was none left but the tribe of Yahudah (Judah)
--      only* (2 Kgs 17:18). The divorced north, the treacherous south — both gone a-whoring, but ONE
--      people still claimed.
--   ★★★ RETURN, THOU BACKSLIDING YASHAR''EL — I WILL BRING YOU TO ZION (THREAD 2): the divorce is not
--      the end. *Go and proclaim these words toward the north, and say, Return, thou backsliding
--      Yashar''el (Israel)... for I am merciful... and I will not keep anger for ever* (3:12); *Turn, O
--      backsliding children... for I am married unto you: and I will take you one of a city, and two of
--      a family, and I will bring you to Zion* (3:14). The divorced wife is wooed back — *I am married
--      unto you* — and regathered ONE of a city, TWO of a family, to Zion. Hosea sings the re-betrothal:
--      *I will betroth thee unto me for ever* (Hos 2:19), *I will say to them which were not my people,
--      Thou art my people* (Hos 2:23) — Lo-Ammi made Ammi. *Go yet, love a woman... yet an adulteress*
--      (Hos 3:1), *afterward shall the children of Yashar''el (Israel) return* (Hos 3:5). Ezekiel makes
--      it the regathering of the scattered: *I will take the children of Yashar''el (Israel) from among
--      the heathen... and bring them into their own land* (Ezek 37:21), *and I will make them one nation*
--      (Ezek 37:22) — the very *one of a city, and two of a family* gathered to Zion, the two houses
--      walking together out of the north (Jer 3:18). Paul seals it: *all Yashar''el (Israel) shall be
--      saved: as it is written, There shall come out of Sion the Deliverer* (Rom 11:26), *when I shall
--      take away their sins* (Rom 11:27). The divorce reversed by mercy, the scattered house brought home.
--   ★★ PASTORS ACCORDING TO MINE HEART (THREAD 3): *And I will give you pastors according to mine heart,
--      which shall feed you with knowledge and understanding* (3:15) — true shepherds, against the false
--      ones the prophets rebuke. Jeremiah himself promises it again: *I will set up shepherds over them
--      which shall feed them* (Jer 23:4). Ezekiel names the One Shepherd: *I will set up one shepherd
--      over them, and he shall feed them, even my servant David* (Ezek 34:23). The risen Messiah commits
--      the flock to Peter: *Feed my sheep* (John 21:17); Paul charges the elders: *feed the church of
--      Elohim (God), which he hath purchased with his own blood* (Acts 20:28); and the Head gives the
--      gift: *he gave some... pastors and teachers* (Eph 4:11). The shepherds after Yahuah''s own heart.
--   ★ JERUSALEM THE THRONE — THE NATIONS GATHERED (THREAD 4): *they shall say no more, The ark of the
--      covenant of Yahuah (LORD)... neither shall they remember it... At that time they shall call
--      Jerusalem the throne of Yahuah (LORD); and all the nations shall be gathered unto it* (3:16-17).
--      The ark is not missed because Yahuah himself is present and enthroned. Isaiah: *out of Zion shall
--      go forth the law... and all nations shall flow unto it* (Isa 2:3, with 2:2). Zechariah: *many
--      people and strong nations shall come to seek Yahuah Tseva''ot (LORD of hosts) in Jerusalem*
--      (Zech 8:22). The end answers it: *the tabernacle of Elohim (God) is with men, and he will dwell
--      with them* (Rev 21:3), *and the nations of them which are saved shall walk in the light of it*
--      (Rev 21:24); and the Messiah lifts worship past place to spirit: *the true worshippers shall
--      worship the Father in spirit and in truth* (John 4:23). The throne, not the ark; the nations
--      gathered to the Name.
--   ★ RETURN, YE BACKSLIDING CHILDREN — I WILL HEAL YOUR BACKSLIDINGS (THREAD 5): *Return, ye backsliding
--      children, and I will heal your backslidings. Behold, we come unto thee; for thou art Yahuah
--      Eloheinu (the LORD our God)* (3:22), *truly in Yahuah Eloheinu (the LORD our God) is the salvation
--      of Yashar''el (Israel)* (3:23). The penitent answer — they come, confessing. Hosea voices the same
--      return-and-healing: *O Yashar''el (Israel), return unto Yahuah Elohayka (the LORD thy God)* (Hos
--      14:1), *I will heal their backsliding, I will love them freely* (Hos 14:4), *Come, and let us
--      return unto Yahuah (LORD): for he hath torn, and he will heal us* (Hos 6:1). The backsliding healed
--      by the Healer, salvation found in Yahuah alone, not in the hills.
--   VERSES WITH NO SEPARATE ADD: v.1-5 (the put-away wife / the harlot-yet-called-back — the divorce
--      doctrine carried by THREAD 1 via Isaiah 50:1, the return-call by THREAD 2), v.18 (the two houses
--      walking together out of the north — bound to the Ezekiel-37 regathering of THREAD 2), v.19-21 (the
--      treacherous-wife charge restating v.6-11, the weeping that turns to the penitent return of v.22).
--      All blocks recorded; every meaningful section carries or is bound to a thread.

CREATE TEMP VIEW _s309_jer03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★★): backsliding Yashar'el divorced, treacherous Yahudah — the two-house diagnosis
    ('canon','jeremiah',3,8,'canon','hosea',1,6,'free',
      E'*And she conceived again, and bare a daughter. And Elohim (God) said unto him, Call her name Lo-ruhamah: for I will no more have mercy upon the house of Yashar''el (Israel); but I will utterly take them away* (Hosea 1:6). Hosea names the divorce of the northern house by his daughter''s name — Lo-ruhamah, "no mercy" — which is the very *bill of divorce* Yahuah gave backsliding Yashar''el: *I had put her away, and given her a bill of divorce* (Jeremiah 3:8). The northern house, divorced and unpitied.'),
    ('canon','jeremiah',3,8,'canon','hosea',1,9,'free',
      E'*Then said Elohim (God), Call his name Lo-ammi: for ye are not my people, and I will not be your Elohim (God)* (Hosea 1:9). The bill of divorce given to backsliding Yashar''el (Jeremiah 3:8) is spoken by Hosea as Lo-ammi — "not my people." The northern house is put away, divorced and disowned; yet the same Yahuah who names her Lo-ammi will undo it (Hosea 2:23), as Jeremiah''s *Return, thou backsliding Yashar''el (Israel)* (3:12) undoes the divorce.'),
    ('canon','jeremiah',3,8,'canon','hosea',2,2,'free',
      E'*Plead with your mother, plead: for she is not my wife, neither am I her husband: let her therefore put away her whoredoms out of her sight, and her adulteries from between her breasts* (Hosea 2:2). Hosea draws the same marriage-and-divorce picture Jeremiah does — the wife *put away* for her adulteries (Jeremiah 3:8): *she is not my wife, neither am I her husband*. The harlotry of the northern house is the breach of a marriage, and the divorce its consequence — yet the husband still pleads.'),
    ('canon','jeremiah',3,6,'canon','ezekiel',23,4,'free',
      E'*And the names of them were Aholah the elder, and Aholibah her sister... Thus were their names; Samaria is Aholah, and Jerusalem Aholibah* (Ezekiel 23:4). Ezekiel draws as two harlot sisters exactly what Jeremiah names — *backsliding Yashar''el (Israel)... hath played the harlot* and *her treacherous sister Yahudah (Judah)* (Jeremiah 3:6-8): Samaria (the northern house) and Jerusalem (the southern house), the two sisters who both went a-whoring. The two-house frame, drawn as the two unfaithful sisters.'),
    ('canon','jeremiah',3,8,'canon','isaiah',50,1,'free',
      E'*Thus saith Yahuah (LORD), Where is the bill of your mother''s divorcement, whom I have put away?... Behold, for your iniquities have ye sold yourselves, and for your transgressions is your mother put away* (Isaiah 50:1). Isaiah asks after the very document Jeremiah names — *I had put her away, and given her a bill of divorce* (Jeremiah 3:8): the mother *put away* for her own iniquities. The divorce is real, and it is the people''s sin that caused it; yet Yahuah''s hand is *not shortened... that it cannot redeem* (Isa 50:2).'),
    ('canon','jeremiah',3,8,'canon','2-kings',17,18,'free',
      E'*Therefore Yahuah (LORD) was very angry with Yashar''el (Israel), and removed them out of his sight: there was none left but the tribe of Yahudah (Judah) only* (2 Kings 17:18). Kings records the divorce Jeremiah names — *I had put her away, and given her a bill of divorce* (Jeremiah 3:8): the northern house *removed out of his sight*, carried into Assyria, *there was none left but the tribe of Yahudah (Judah) only*. The bill of divorce was the Assyrian exile of the ten tribes.'),

    -- THREAD 2 (★★★): Return, thou backsliding Yashar'el — I am married unto you — I will bring you to Zion
    ('canon','jeremiah',3,14,'canon','hosea',2,19,'free',
      E'*And I will betroth thee unto me for ever; yea, I will betroth thee unto me in righteousness, and in judgment, and in lovingkindness, and in mercies* (Hosea 2:19). The divorced wife is re-married: as Jeremiah says *for I am married unto you... and I will bring you to Zion* (Jeremiah 3:14), Hosea promises the everlasting betrothal — *I will betroth thee unto me for ever*. The divorce reversed; the put-away wife wooed back into an unbreakable covenant.'),
    ('canon','jeremiah',3,14,'canon','hosea',2,23,'free',
      E'*And I will sow her unto me in the earth; and I will have mercy upon her that had not obtained mercy; and I will say to them which were not my people, Thou art my people; and they shall say, Thou art my Elohim (God)* (Hosea 2:23). The Lo-Ammi divorce of the northern house is undone exactly as Jeremiah''s *Return, thou backsliding Yashar''el (Israel)... for I am merciful* (Jeremiah 3:12) undoes it: *I will say to them which were not my people, Thou art my people*. Not-my-people made my-people; the divorced wife reclaimed.'),
    ('canon','jeremiah',3,14,'canon','hosea',3,1,'free',
      E'*Then said Yahuah (LORD) unto me, Go yet, love a woman beloved of her friend, yet an adulteress, according to the love of Yahuah (LORD) toward the children of Yashar''el (Israel), who look to other gods* (Hosea 3:1). Hosea is told to love again the adulterous wife — the very love behind Jeremiah''s *Turn, O backsliding children... for I am married unto you* (Jeremiah 3:14). Though she played the harlot, the husband loves her still and buys her back; the picture of Yahuah''s mercy toward the divorced northern house.'),
    ('canon','jeremiah',3,14,'canon','hosea',3,5,'free',
      E'*Afterward shall the children of Yashar''el (Israel) return, and seek Yahuah (LORD) their Elohim (God), and David their king; and shall fear Yahuah (LORD) and his goodness in the latter days* (Hosea 3:5). Hosea names the return Jeremiah commands — *Return, thou backsliding Yashar''el (Israel)* (Jeremiah 3:12): in the latter days *the children of Yashar''el (Israel) return, and seek Yahuah (LORD)... and David their king*. The backsliding house turns home, regathered under the one King.'),
    ('canon','jeremiah',3,14,'canon','ezekiel',37,21,'free',
      E'*Thus saith Adonai Yahuah (the Lord GOD); Behold, I will take the children of Yashar''el (Israel) from among the heathen, whither they be gone, and will gather them on every side, and bring them into their own land* (Ezekiel 37:21). Jeremiah''s *I will take you one of a city, and two of a family, and I will bring you to Zion* (Jeremiah 3:14) is Ezekiel''s regathering: the scattered children taken from among the heathen and brought home. The divorced, scattered house gathered on every side to its own land.'),
    ('canon','jeremiah',3,14,'canon','ezekiel',37,22,'free',
      E'*And I will make them one nation in the land upon the mountains of Yashar''el (Israel); and one king shall be king to them all: and they shall be no more two nations, neither shall they be divided into two kingdoms any more at all* (Ezekiel 37:22). The two houses Jeremiah sees walking together — *the house of Yahudah (Judah) shall walk with the house of Yashar''el (Israel)... out of the land of the north* (Jeremiah 3:18) — are Ezekiel''s one nation: *no more two nations*. The regathering to Zion (3:14) is the two sticks made one.'),
    ('canon','jeremiah',3,12,'canon','romans',11,26,'free',
      E'*And so all Yashar''el (Israel) shall be saved: as it is written, There shall come out of Sion the Deliverer, and shall turn away ungodliness from Jacob* (Romans 11:26). Paul names the end of Jeremiah''s northward call — *Return, thou backsliding Yashar''el (Israel)... for I am merciful* (Jeremiah 3:12): the divorced, scattered house is not cast off for ever but saved, *out of Sion the Deliverer*. The mercy that calls the backsliding north home is the mercy that saves all Yashar''el.'),
    ('canon','jeremiah',3,14,'canon','romans',11,27,'free',
      E'*For this is my covenant unto them, when I shall take away their sins* (Romans 11:27). The covenant that brings the divorced wife back — *for I am married unto you: and... I will bring you to Zion* (Jeremiah 3:14) — is, in Paul, the covenant of sin-removal: *when I shall take away their sins*. The marriage restored to the backsliding house is grounded in the taking-away of the very adulteries that broke it.'),

    -- THREAD 3 (★★): pastors according to mine heart — the true shepherds
    ('canon','jeremiah',3,15,'canon','ezekiel',34,23,'free',
      E'*And I will set up one shepherd over them, and he shall feed them, even my servant David; he shall feed them, and he shall be their shepherd* (Ezekiel 34:23). The pastors Jeremiah promises — *I will give you pastors according to mine heart, which shall feed you with knowledge and understanding* (Jeremiah 3:15) — are gathered under Ezekiel''s one Shepherd: *one shepherd... even my servant David*. The shepherds after Yahuah''s heart serve the one Davidic Shepherd-King.'),
    ('canon','jeremiah',3,15,'canon','jeremiah',23,4,'free',
      E'*And I will set up shepherds over them which shall feed them: and they shall fear no more, nor be dismayed, neither shall they be lacking, saith Yahuah (LORD)* (Jeremiah 23:4). Jeremiah repeats his own promise of *pastors according to mine heart, which shall feed you* (Jeremiah 3:15): true shepherds *set up... which shall feed them*, against the false shepherds who scattered the flock (Jer 23:1-2). The pastors after Yahuah''s heart feed and keep, so the flock fears no more.'),
    ('canon','jeremiah',3,15,'canon','john',21,17,'free',
      E'*He saith unto him the third time, Simon, son of Jonas, lovest thou me?... Yahusha (Jesus) saith unto him, Feed my sheep* (John 21:17). The risen Messiah makes Peter a pastor according to Yahuah''s own heart — *I will give you pastors according to mine heart, which shall feed you* (Jeremiah 3:15): *Feed my sheep*. The shepherd-charge of the prophet is handed on, the flock fed by those the Shepherd appoints.'),
    ('canon','jeremiah',3,15,'canon','acts',20,28,'free',
      E'*Take heed therefore unto yourselves, and to all the flock, over the which the Ruach HaKodesh (Holy Spirit) hath made you overseers, to feed the church of Elohim (God), which he hath purchased with his own blood* (Acts 20:28). Paul charges the elders as the pastors Jeremiah promised — *pastors according to mine heart, which shall feed you with knowledge and understanding* (Jeremiah 3:15): *to feed the church of Elohim (God)*. The Spirit sets them over the flock to feed it, shepherds after the heart of Yahuah.'),
    ('canon','jeremiah',3,15,'canon','ephesians',4,11,'free',
      E'*And he gave some, apostles; and some, prophets; and some, evangelists; and some, pastors and teachers* (Ephesians 4:11). The risen Head gives the very gift Jeremiah promised — *I will give you pastors according to mine heart, which shall feed you with knowledge and understanding* (Jeremiah 3:15): *he gave some... pastors and teachers*. The pastors after Yahuah''s heart are the Messiah''s gift to feed and build his people in knowledge.'),

    -- THREAD 4 (★): Jerusalem the throne of Yahuah — the nations gathered, the ark not missed
    ('canon','jeremiah',3,16,'canon','revelation',21,3,'free',
      E'*And I heard a great voice out of heaven saying, Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God)* (Revelation 21:3). Jeremiah''s word that the ark shall be missed no more — *they shall say no more, The ark of the covenant of Yahuah (LORD)... neither shall they remember it* (Jeremiah 3:16) — reaches its end when Yahuah himself dwells with men: *the tabernacle of Elohim (God) is with men*. The ark is not missed because the Presence itself has come.'),
    ('canon','jeremiah',3,17,'canon','revelation',21,24,'free',
      E'*And the nations of them which are saved shall walk in the light of it: and the kings of the earth do bring their glory and honour into it* (Revelation 21:24). Jeremiah''s promise — *they shall call Jerusalem the throne of Yahuah (LORD); and all the nations shall be gathered unto it* (Jeremiah 3:17) — is fulfilled in the city where *the nations of them which are saved shall walk in the light of it*. The nations gathered to the throne of Yahuah, to the Name, to Jerusalem.'),
    ('canon','jeremiah',3,17,'canon','isaiah',2,3,'free',
      E'*And many people shall go and say, Come ye, and let us go up to the mountain of Yahuah (LORD)... for out of Zion shall go forth the law, and the word of Yahuah (LORD) from Jerusalem* (Isaiah 2:3). Isaiah sees the same ingathering of the nations Jeremiah names — *all the nations shall be gathered unto it, to the name of Yahuah (LORD), to Jerusalem* (Jeremiah 3:17): *out of Zion shall go forth the law*, the peoples streaming up to be taught. The throne of Yahuah at Jerusalem draws all nations.'),
    ('canon','jeremiah',3,17,'canon','zechariah',8,22,'free',
      E'*Yea, many people and strong nations shall come to seek Yahuah Tseva''ot (LORD of hosts) in Jerusalem, and to pray before Yahuah (LORD)* (Zechariah 8:22). Zechariah echoes Jeremiah''s gathering of the nations — *all the nations shall be gathered unto it, to the name of Yahuah (LORD)* (Jeremiah 3:17): *many people and strong nations shall come to seek Yahuah Tseva''ot (LORD of hosts) in Jerusalem*. The nations gathered to the throne, to seek and pray before Yahuah.'),
    ('canon','jeremiah',3,17,'canon','john',4,23,'free',
      E'*But the hour cometh, and now is, when the true worshippers shall worship the Father in spirit and in truth: for the Father seeketh such to worship him* (John 4:23). Jeremiah lifts worship past the ark to the throne itself — *they shall call Jerusalem the throne of Yahuah (LORD)... neither shall they walk any more after the imagination of their evil heart* (Jeremiah 3:17) — and the Messiah lifts it past the place to the Spirit: *the true worshippers shall worship the Father in spirit and in truth*. The throne, not the relic; the heart, not the place.'),

    -- THREAD 5 (★): Return, ye backsliding children — I will heal your backslidings
    ('canon','jeremiah',3,22,'canon','hosea',14,1,'free',
      E'*O Yashar''el (Israel), return unto Yahuah Elohayka (the LORD thy God); for thou hast fallen by thine iniquity* (Hosea 14:1). Hosea sounds the same call Jeremiah does — *Return, ye backsliding children, and I will heal your backslidings* (Jeremiah 3:22): *O Yashar''el (Israel), return unto Yahuah Elohayka (the LORD thy God)*. The fallen, backsliding house is summoned home to the One it forsook.'),
    ('canon','jeremiah',3,22,'canon','hosea',14,4,'free',
      E'*I will heal their backsliding, I will love them freely: for mine anger is turned away from him* (Hosea 14:4). Hosea speaks Jeremiah''s very promise — *Return, ye backsliding children, and I will heal your backslidings* (Jeremiah 3:22): *I will heal their backsliding, I will love them freely*. The same Yahuah who calls the backsliders home heals the backsliding itself, freely, his anger turned away.'),
    ('canon','jeremiah',3,22,'canon','hosea',6,1,'free',
      E'*Come, and let us return unto Yahuah (LORD): for he hath torn, and he will heal us; he hath smitten, and he will bind us up* (Hosea 6:1). The penitent answer Jeremiah records — *Behold, we come unto thee; for thou art Yahuah Eloheinu (the LORD our God)* (Jeremiah 3:22) — is Hosea''s very confession: *Come, and let us return unto Yahuah (LORD)... he will heal us*. The torn and smitten house returns to the only One who can bind it up.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s309_jer03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s309_jer03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-3-backsliding-yasharel-divorced-and-treacherous-yahudah',
       E'Backsliding Yashar''el divorced, treacherous Yahudah — the two sisters',
       E'Here is the two-house diagnosis laid bare. *Yahuah (LORD) said also unto me in the days of Josiah the king, Hast thou seen that which backsliding Yashar''el (Israel) hath done? she is gone up upon every high mountain and under every green tree, and there hath played the harlot* (3:6). The northern house — Yashar''el, Ephraim, the ten tribes — went a-whoring after other gods, and would not return: *And I said after she had done all these things, Turn thou unto me. But she returned not. And her treacherous sister Yahudah (Judah) saw it* (3:7). So the divorce was given: *And I saw, when for all the causes whereby backsliding Yashar''el (Israel) committed adultery I had put her away, and given her a bill of divorce; yet her treacherous sister Yahudah (Judah) feared not, but went and played the harlot also* (3:8). The southern house saw the divorce of the north and feared not — *Yahudah (Judah) hath not turned unto me with her whole heart, but feignedly* (3:10) — so that *the backsliding Yashar''el (Israel) hath justified herself more than treacherous Yahudah (Judah)* (3:11). Hosea names the divorce by the children''s names: *Call her name Lo-ruhamah: for I will no more have mercy upon the house of Yashar''el (Israel)* (Hosea 1:6), *Call his name Lo-ammi: for ye are not my people* (Hosea 1:9), *she is not my wife, neither am I her husband* (Hosea 2:2). Ezekiel draws the two sisters whole: *Samaria is Aholah, and Jerusalem Aholibah* (Ezekiel 23:4) — the northern and southern houses, both unfaithful. Isaiah asks after the document itself: *Where is the bill of your mother''s divorcement, whom I have put away?... for your transgressions is your mother put away* (Isaiah 50:1). And Kings records the divorce as history: *Therefore Yahuah (LORD) was very angry with Yashar''el (Israel), and removed them out of his sight: there was none left but the tribe of Yahudah (Judah) only* (2 Kings 17:18) — the bill of divorce was the Assyrian exile of the ten tribes. The divorced north, the treacherous south: this is the wound the rest of the chapter sets out to heal.',
       sv.verse_id, ev.verse_id, 'free', 34050
  FROM _s309_jer03_lookup sv, _s309_jer03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=3 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=3 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-3-return-thou-backsliding-yasharel-i-will-bring-you-to-zion',
       E'Return, thou backsliding Yashar''el — I am married unto you, I will bring you to Zion',
       E'The divorce is not the last word. The very prophet who announced the bill of divorce is now sent to call the divorced wife home — and northward, to the scattered ten tribes: *Go and proclaim these words toward the north, and say, Return, thou backsliding Yashar''el (Israel), saith Yahuah (LORD); and I will not cause mine anger to fall upon you: for I am merciful, saith Yahuah (LORD), and I will not keep anger for ever* (3:12). Mercy over the divorce. *Only acknowledge thine iniquity* (3:13) — and then the astonishing word to the put-away wife: *Turn, O backsliding children, saith Yahuah (LORD); for I am married unto you: and I will take you one of a city, and two of a family, and I will bring you to Zion* (3:14). *I am married unto you* — the divorce reversed by the husband''s own mercy; and the regathering is remnant-by-remnant, one of a city and two of a family, brought home to Zion. Hosea sings the re-betrothal: *I will betroth thee unto me for ever* (Hosea 2:19), and the undoing of Lo-Ammi: *I will say to them which were not my people, Thou art my people* (Hosea 2:23). The husband is told to love the adulteress again — *Go yet, love a woman... yet an adulteress* (Hosea 3:1) — for *afterward shall the children of Yashar''el (Israel) return, and seek Yahuah (LORD) their Elohim (God), and David their king* (Hosea 3:5). Ezekiel makes it the great regathering: *I will take the children of Yashar''el (Israel) from among the heathen... and bring them into their own land* (Ezekiel 37:21), *and I will make them one nation... they shall be no more two nations* (Ezekiel 37:22) — which is exactly Jeremiah''s next breath: *the house of Yahudah (Judah) shall walk with the house of Yashar''el (Israel)... out of the land of the north* (3:18). And Paul seals the whole: *all Yashar''el (Israel) shall be saved: as it is written, There shall come out of Sion the Deliverer* (Romans 11:26), *For this is my covenant unto them, when I shall take away their sins* (Romans 11:27). The divorced wife wooed back, the scattered house regathered, the two houses made one and brought to Zion.',
       sv.verse_id, ev.verse_id, 'free', 34053
  FROM _s309_jer03_lookup sv, _s309_jer03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=3 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=3 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-3-pastors-according-to-mine-heart',
       E'I will give you pastors according to mine heart',
       E'To the regathered house Yahuah promises true shepherds, against the false ones who scattered it: *And I will give you pastors according to mine heart, which shall feed you with knowledge and understanding* (3:15). The promise stands over the whole prophetic vision of the flock. Jeremiah himself repeats it: *I will set up shepherds over them which shall feed them: and they shall fear no more, nor be dismayed* (Jeremiah 23:4). Ezekiel gathers all the shepherds under the One: *I will set up one shepherd over them, and he shall feed them, even my servant David; he shall feed them, and he shall be their shepherd* (Ezekiel 34:23). And the risen Messiah hands the charge on: to Peter — *Yahusha (Jesus) saith unto him, Feed my sheep* (John 21:17); to the elders, through Paul — *feed the church of Elohim (God), which he hath purchased with his own blood* (Acts 20:28); and to the whole body, as the Head''s own gift — *he gave some... pastors and teachers* (Ephesians 4:11). The pastors after Yahuah''s own heart feed the flock with knowledge and understanding, under the one Shepherd, David''s greater Son.',
       sv.verse_id, ev.verse_id, 'free', 34056
  FROM _s309_jer03_lookup sv, _s309_jer03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=3 AND sv.verse_number=15
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=3 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-3-jerusalem-the-throne-of-yahuah-the-nations-gathered',
       E'Jerusalem the throne of Yahuah — and all the nations gathered unto it',
       E'In the restored day, the ark itself is not missed, because the One it pointed to is present and enthroned: *they shall say no more, The ark of the covenant of Yahuah (LORD): neither shall it come to mind: neither shall they remember it; neither shall they visit it; neither shall that be done any more* (3:16). The relic gives way to the Presence: *At that time they shall call Jerusalem the throne of Yahuah (LORD); and all the nations shall be gathered unto it, to the name of Yahuah (LORD), to Jerusalem: neither shall they walk any more after the imagination of their evil heart* (3:17). Isaiah sees the same nations streaming up: *Come ye, and let us go up to the mountain of Yahuah (LORD)... for out of Zion shall go forth the law, and the word of Yahuah (LORD) from Jerusalem* (Isaiah 2:3). Zechariah too: *many people and strong nations shall come to seek Yahuah Tseva''ot (LORD of hosts) in Jerusalem* (Zechariah 8:22). The Messiah lifts worship past the place to the Spirit: *the true worshippers shall worship the Father in spirit and in truth: for the Father seeketh such to worship him* (John 4:23). And the end answers it whole: *the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people* (Revelation 21:3), *and the nations of them which are saved shall walk in the light of it* (Revelation 21:24). The ark not missed, the throne of Yahuah at Jerusalem, the nations gathered to the Name.',
       sv.verse_id, ev.verse_id, 'free', 34059
  FROM _s309_jer03_lookup sv, _s309_jer03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=3 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=3 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-3-return-ye-backsliding-children-i-will-heal-your-backslidings',
       E'Return, ye backsliding children — and I will heal your backslidings',
       E'The chapter closes on the call and the penitent answer. *Return, ye backsliding children, and I will heal your backslidings. Behold, we come unto thee; for thou art Yahuah Eloheinu (the LORD our God)* (3:22) — the summons and the response in one breath: they come, confessing. And the confession turns from the high places to Yahuah alone: *Truly in vain is salvation hoped for from the hills, and from the multitude of mountains: truly in Yahuah Eloheinu (the LORD our God) is the salvation of Yashar''el (Israel)* (3:23). They own the shame: *we have sinned against Yahuah Eloheinu (the LORD our God), we and our fathers, from our youth even unto this day* (3:25). Hosea voices the same return-and-healing word for word: *O Yashar''el (Israel), return unto Yahuah Elohayka (the LORD thy God); for thou hast fallen by thine iniquity* (Hosea 14:1), and the answering promise — *I will heal their backsliding, I will love them freely: for mine anger is turned away from him* (Hosea 14:4). And the penitent come, as Hosea taught them to: *Come, and let us return unto Yahuah (LORD): for he hath torn, and he will heal us; he hath smitten, and he will bind us up* (Hosea 6:1). The backsliding house turns home, and the One who tore them heals the very backsliding — salvation found in Yahuah, never in the hills.',
       sv.verse_id, ev.verse_id, 'free', 34062
  FROM _s309_jer03_lookup sv, _s309_jer03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=3 AND sv.verse_number=22
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=3 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *Call her name Lo-ruhamah: for I will no more have mercy upon the house of Yashar''el (Israel)* (Hosea 1:6) — the divorce of the northern house named "no mercy"; Jeremiah''s bill of divorce (3:8).'
  FROM cross_reference_threads t
  JOIN _s309_jer03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=3 AND sv.verse_number=8
  JOIN _s309_jer03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-3-backsliding-yasharel-divorced-and-treacherous-yahudah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *Call his name Lo-ammi: for ye are not my people* (Hosea 1:9) — the bill of divorce spoken as Lo-ammi; the northern house put away and disowned (Jeremiah 3:8).'
  FROM cross_reference_threads t
  JOIN _s309_jer03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=3 AND sv.verse_number=8
  JOIN _s309_jer03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=1 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-3-backsliding-yasharel-divorced-and-treacherous-yahudah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *she is not my wife, neither am I her husband* (Hosea 2:2) — the harlotry as a broken marriage; the wife put away (Jeremiah 3:8).'
  FROM cross_reference_threads t
  JOIN _s309_jer03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=3 AND sv.verse_number=8
  JOIN _s309_jer03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-3-backsliding-yasharel-divorced-and-treacherous-yahudah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *Samaria is Aholah, and Jerusalem Aholibah* (Ezekiel 23:4) — the two harlot sisters = the two houses, Jeremiah''s backsliding Yashar''el and treacherous Yahudah (3:6-8).'
  FROM cross_reference_threads t
  JOIN _s309_jer03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=3 AND sv.verse_number=6
  JOIN _s309_jer03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=23 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-3-backsliding-yasharel-divorced-and-treacherous-yahudah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *Where is the bill of your mother''s divorcement, whom I have put away?* (Isaiah 50:1) — Isaiah names the very document of Jeremiah 3:8; the mother put away for her own transgressions.'
  FROM cross_reference_threads t
  JOIN _s309_jer03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=3 AND sv.verse_number=8
  JOIN _s309_jer03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=50 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-3-backsliding-yasharel-divorced-and-treacherous-yahudah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★ *removed them out of his sight: there was none left but the tribe of Yahudah (Judah) only* (2 Kings 17:18) — the bill of divorce as history: the Assyrian exile of the ten northern tribes (Jeremiah 3:8).'
  FROM cross_reference_threads t
  JOIN _s309_jer03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=3 AND sv.verse_number=8
  JOIN _s309_jer03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=17 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-3-backsliding-yasharel-divorced-and-treacherous-yahudah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *I will betroth thee unto me for ever* (Hosea 2:19) — the divorced wife re-married; Jeremiah''s *I am married unto you* (3:14), the divorce reversed.'
  FROM cross_reference_threads t
  JOIN _s309_jer03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=3 AND sv.verse_number=14
  JOIN _s309_jer03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-3-return-thou-backsliding-yasharel-i-will-bring-you-to-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *I will say to them which were not my people, Thou art my people* (Hosea 2:23) — Lo-Ammi made Ammi; the divorce undone, as *Return, thou backsliding Yashar''el* (Jeremiah 3:12).'
  FROM cross_reference_threads t
  JOIN _s309_jer03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=3 AND sv.verse_number=14
  JOIN _s309_jer03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=2 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-3-return-thou-backsliding-yasharel-i-will-bring-you-to-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *Go yet, love a woman... yet an adulteress* (Hosea 3:1) — the husband told to love the adulterous wife again; the mercy behind *I am married unto you* (Jeremiah 3:14).'
  FROM cross_reference_threads t
  JOIN _s309_jer03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=3 AND sv.verse_number=14
  JOIN _s309_jer03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=3 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-3-return-thou-backsliding-yasharel-i-will-bring-you-to-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *afterward shall the children of Yashar''el (Israel) return... and David their king* (Hosea 3:5) — the backsliding house turns home in the latter days; Jeremiah''s *Return* (3:12) answered.'
  FROM cross_reference_threads t
  JOIN _s309_jer03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=3 AND sv.verse_number=14
  JOIN _s309_jer03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=3 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-3-return-thou-backsliding-yasharel-i-will-bring-you-to-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *I will take the children of Yashar''el (Israel) from among the heathen... and bring them into their own land* (Ezekiel 37:21) — the regathering of *one of a city, and two of a family* to Zion (Jeremiah 3:14).'
  FROM cross_reference_threads t
  JOIN _s309_jer03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=3 AND sv.verse_number=14
  JOIN _s309_jer03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-3-return-thou-backsliding-yasharel-i-will-bring-you-to-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★ *I will make them one nation... they shall be no more two nations* (Ezekiel 37:22) — the two houses made one; Jeremiah''s Yahudah walking with Yashar''el out of the north (3:18).'
  FROM cross_reference_threads t
  JOIN _s309_jer03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=3 AND sv.verse_number=14
  JOIN _s309_jer03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-3-return-thou-backsliding-yasharel-i-will-bring-you-to-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★★ *all Yashar''el (Israel) shall be saved: as it is written, There shall come out of Sion the Deliverer* (Romans 11:26) — the divorced, scattered house not cast off; the mercy of Jeremiah 3:12 fulfilled.'
  FROM cross_reference_threads t
  JOIN _s309_jer03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=3 AND sv.verse_number=12
  JOIN _s309_jer03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-3-return-thou-backsliding-yasharel-i-will-bring-you-to-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *this is my covenant unto them, when I shall take away their sins* (Romans 11:27) — the restored marriage grounded in the taking-away of the adulteries that broke it (Jeremiah 3:14).'
  FROM cross_reference_threads t
  JOIN _s309_jer03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=3 AND sv.verse_number=14
  JOIN _s309_jer03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-3-return-thou-backsliding-yasharel-i-will-bring-you-to-zion'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *I will set up one shepherd over them... even my servant David* (Ezekiel 34:23) — the pastors of Jeremiah 3:15 gathered under the one Davidic Shepherd.'
  FROM cross_reference_threads t
  JOIN _s309_jer03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=3 AND sv.verse_number=15
  JOIN _s309_jer03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-3-pastors-according-to-mine-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *I will set up shepherds over them which shall feed them* (Jeremiah 23:4) — Jeremiah repeats his own promise of pastors after Yahuah''s heart (3:15), against the false shepherds.'
  FROM cross_reference_threads t
  JOIN _s309_jer03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=3 AND sv.verse_number=15
  JOIN _s309_jer03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-3-pastors-according-to-mine-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Yahusha (Jesus) saith unto him, Feed my sheep* (John 21:17) — the risen Messiah makes Peter a pastor after Yahuah''s heart (Jeremiah 3:15); the flock fed.'
  FROM cross_reference_threads t
  JOIN _s309_jer03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=3 AND sv.verse_number=15
  JOIN _s309_jer03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=21 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-3-pastors-according-to-mine-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *feed the church of Elohim (God), which he hath purchased with his own blood* (Acts 20:28) — Paul charges the elders as the pastors Jeremiah promised (3:15); the Spirit sets them over the flock.'
  FROM cross_reference_threads t
  JOIN _s309_jer03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=3 AND sv.verse_number=15
  JOIN _s309_jer03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=20 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-3-pastors-according-to-mine-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *he gave some... pastors and teachers* (Ephesians 4:11) — the pastors after Yahuah''s heart (Jeremiah 3:15) are the risen Head''s gift to feed and build his people.'
  FROM cross_reference_threads t
  JOIN _s309_jer03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=3 AND sv.verse_number=15
  JOIN _s309_jer03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=4 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-3-pastors-according-to-mine-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *the tabernacle of Elohim (God) is with men, and he will dwell with them* (Revelation 21:3) — the ark not missed because the Presence has come; Jeremiah 3:16.'
  FROM cross_reference_threads t
  JOIN _s309_jer03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=3 AND sv.verse_number=16
  JOIN _s309_jer03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-3-jerusalem-the-throne-of-yahuah-the-nations-gathered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *the nations of them which are saved shall walk in the light of it* (Revelation 21:24) — the nations gathered to the throne of Yahuah at Jerusalem (Jeremiah 3:17).'
  FROM cross_reference_threads t
  JOIN _s309_jer03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s309_jer03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-3-jerusalem-the-throne-of-yahuah-the-nations-gathered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *out of Zion shall go forth the law... all nations shall flow unto it* (Isaiah 2:3) — the nations streaming up to Jerusalem the throne of Yahuah (Jeremiah 3:17).'
  FROM cross_reference_threads t
  JOIN _s309_jer03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s309_jer03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=2 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-3-jerusalem-the-throne-of-yahuah-the-nations-gathered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *many people and strong nations shall come to seek Yahuah Tseva''ot (LORD of hosts) in Jerusalem* (Zechariah 8:22) — the nations gathered to seek the throne of Yahuah (Jeremiah 3:17).'
  FROM cross_reference_threads t
  JOIN _s309_jer03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s309_jer03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=8 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-3-jerusalem-the-throne-of-yahuah-the-nations-gathered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *the true worshippers shall worship the Father in spirit and in truth* (John 4:23) — the Messiah lifts worship past place to the Spirit; the throne, not the relic (Jeremiah 3:16-17).'
  FROM cross_reference_threads t
  JOIN _s309_jer03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s309_jer03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=4 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-3-jerusalem-the-throne-of-yahuah-the-nations-gathered'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *O Yashar''el (Israel), return unto Yahuah Elohayka (the LORD thy God)* (Hosea 14:1) — Hosea sounds Jeremiah''s call: *Return, ye backsliding children* (3:22).'
  FROM cross_reference_threads t
  JOIN _s309_jer03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=3 AND sv.verse_number=22
  JOIN _s309_jer03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=14 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-3-return-ye-backsliding-children-i-will-heal-your-backslidings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *I will heal their backsliding, I will love them freely* (Hosea 14:4) — Hosea speaks Jeremiah''s promise word for word: *I will heal your backslidings* (3:22).'
  FROM cross_reference_threads t
  JOIN _s309_jer03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=3 AND sv.verse_number=22
  JOIN _s309_jer03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=14 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-3-return-ye-backsliding-children-i-will-heal-your-backslidings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Come, and let us return unto Yahuah (LORD)... he will heal us* (Hosea 6:1) — the penitent answer of Jeremiah 3:22 (*Behold, we come unto thee*) in Hosea''s own words.'
  FROM cross_reference_threads t
  JOIN _s309_jer03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=3 AND sv.verse_number=22
  JOIN _s309_jer03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=6 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-3-return-ye-backsliding-children-i-will-heal-your-backslidings'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jeremiah_4.sql (Jeremiah 4) -----
-- Chapter: Jeremiah 4 — the call to RETURN and to CIRCUMCISE THE HEART (break up your fallow ground;
-- circumcise yourselves to Yahuah, take away the foreskins of your heart); the destruction from the north
-- (the lion from his thicket, the destroyer of the Gentiles); the call to WASH THE HEART from wickedness,
-- the judgment self-procured (thy way and thy doings have procured these things); and the DE-CREATION
-- vision (I beheld the earth, and, lo, it was without form, and void — the world unmade back to Genesis 1:2
-- chaos). A keystone chapter for the inward Torah: circumcision of the heart the Torah always demanded,
-- NEVER its abolition.
-- Tag: jer04   Temp view: _s309_jer04_lookup
-- Sort band: base 34075, step 3 -> threads at 34075, 34078, 34081 (3 threads)
-- Source of EVERY row: 'canon','jeremiah',4,v
--
-- Jeremiah 4 coverage:
--   v.1-2 (If thou wilt return, O Yashar'el (Israel)... return unto me; the nations shall bless themselves
--          in him) — the call to return; the Abrahamic blessing-of-the-nations note
--        NT:     none warranted distinct (the return is the gateway to the heart-circumcision of v.3-4;
--                woven into THREAD 1 prose)
--        Extras: none warranted
--        Tanakh: held in prose — the nations blessing themselves echoes Genesis 22:18, but the verse's
--                weight here is the RETURN that THREAD 1 carries; not forced separately
--   ★★ v.3-4 (Break up your fallow ground, and sow not among thorns. Circumcise yourselves to Yahuah (LORD),
--          and take away the foreskins of your heart, ye men of Yahudah (Judah) and inhabitants of Jerusalem)
--        NT:     ★★ Romans 2:29 (circumcision is that of the heart, in the spirit), ★ Romans 2:28 (not that
--                circumcision which is outward in the flesh), ★ Matthew 13:7 (some fell among thorns), ★ Matthew
--                13:22 (the care of this world... choke the word) — THREAD 1
--        Extras: none warranted
--        Tanakh: ★★ Deuteronomy 10:16 (circumcise therefore the foreskin of your heart), ★★ Deuteronomy 30:6
--                (Yahuah will circumcise thine heart, to love Yahuah), ★ Hosea 10:12 (break up your fallow
--                ground: for it is time to seek Yahuah) — THREAD 1
--   v.5-13 (Blow ye the trumpet; the lion is come up from his thicket; the destroyer of the Gentiles; he
--          shall come up as clouds) — the alarm and the invader from the north
--        NT:     none warranted (the historical Babylonian judgment; woven in prose)
--        Extras: none warranted     Tanakh: none separate (the trumpet/destroyer; preface to v.14)
--   ★ v.14,18 (O Jerusalem, wash thine heart from wickedness, that thou mayest be saved... Thy way and thy
--          doings have procured these things unto thee; this is thy wickedness)
--        NT:     ★ James 4:8 (Cleanse your hands... and purify your hearts), ★ Galatians 6:7 (whatsoever a
--                man soweth, that shall he also reap) — THREAD 2
--        Extras: none warranted
--        Tanakh: ★ Isaiah 1:16 (Wash you, make you clean), ★ Psalm 51:10 (Create in me a clean heart) — THREAD 2
--   v.15-17 (a voice from Dan... mount Ephraim; watchers come from a far country; keepers of a field) — the
--          besieging watchers; the rebellion named
--        NT:     none warranted     Extras: none warranted
--        Tanakh: held in prose — the besiegers (v.17 because she hath been rebellious) lead into the
--                self-procured judgment of v.18 (THREAD 2)
--   v.19-22 (My bowels, my bowels! I am pained at my very heart... my people is foolish, they have not known
--          me; wise to do evil, but to do good they have no knowledge) — the prophet's anguish; the people's folly
--        NT:     none warranted distinct (the prophet's grief; woven in prose; the no-knowledge folly echoes
--                Romans 1, but not forced here)
--        Extras: none warranted     Tanakh: none separate (the lament that opens onto the de-creation vision)
--   ★★ v.23-26 (I beheld the earth, and, lo, it was without form, and void; and the heavens, and they had no
--          light... I beheld, and, lo, there was no man... the fruitful place was a wilderness)
--        NT:     ★ 2 Peter 3:10 (the heavens shall pass away with a great noise), ★ 2 Peter 3:12 (the heavens
--                being on fire shall be dissolved) — THREAD 3
--        Extras: none warranted
--        Tanakh: ★★★ Genesis 1:2 (the earth was without form, and void; and darkness was upon the face of the
--                deep), ★★ Isaiah 24:1 (Yahuah maketh the earth empty), ★ Isaiah 24:19 (the earth is utterly
--                broken down), ★ Zephaniah 1:2 (I will utterly consume all things from off the land), ★ Zephaniah
--                1:3 (I will cut off man from off the land) — THREAD 3
--   v.27-31 (The whole land shall be desolate; yet will I not make a full end... the daughter of Zion... woe
--          is me now) — the desolation tempered by the remnant-mercy (not a full end); the travailing daughter
--        NT:     none warranted     Extras: none warranted
--        Tanakh: held in prose — *yet will I not make a full end* (v.27) is the remnant-mercy that bounds the
--                de-creation of THREAD 3; the un-creation is judgment, not annihilation
--
-- Threads (slug — target libraries):
--   1. jeremiah-4-circumcise-the-foreskins-of-your-heart — NT (Romans 2, Matthew 13) + Tanakh (Deuteronomy 10,
--      Deuteronomy 30, Hosea 10) [free]
--      (★★ the heart-circumcision the Torah always demanded — inward, not merely outward; the Torah on the
--      heart, NOT its abolition; break up the fallow ground, sow not among thorns)
--   2. jeremiah-4-wash-thine-heart-from-wickedness — NT (James 4, Galatians 6) + Tanakh (Isaiah 1, Psalm 51) [free]
--      (★ the call to cleanse the heart that thou mayest be saved; the judgment self-procured — thy doings
--      have procured these things; whatsoever a man soweth, that shall he also reap)
--   3. jeremiah-4-i-beheld-the-earth-without-form-and-void — NT (2 Peter 3) + Tanakh (Genesis 1, Isaiah 24,
--      Zephaniah 1) [free]
--      (★★ the de-creation vision — the covenant-judgment unmaking the world back to Genesis 1:2 chaos; the
--      earth without form and void, no light, no man, the fruitful place a wilderness)
--
-- Framing notes:
--   ★★ THE CIRCUMCISION OF THE HEART (THREAD 1): *Break up your fallow ground, and sow not among thorns.
--      Circumcise yourselves to Yahuah (LORD), and take away the foreskins of your heart, ye men of Yahudah
--      (Judah) and inhabitants of Jerusalem* (4:3-4). This is NOT a new demand and NOT the abolition of the
--      sign — it is what the Torah always required INWARDLY. Moses commanded it twice: *Circumcise therefore
--      the foreskin of your heart, and be no more stiffnecked* (Deut 10:16), and promised Yahuah himself would
--      do it: *Yahuah Elohayka (the LORD thy God) will circumcise thine heart, and the heart of thy seed, to
--      love Yahuah Elohayka (the LORD thy God) with all thine heart* (Deut 30:6). Paul reads it exactly so:
--      *he is a Yahudi (Jew), which is one inwardly; and circumcision is that of the heart, in the spirit, and
--      not in the letter* (Rom 2:29) — the inward reality the outward sign always pointed to, never a repeal of
--      the covenant. Hosea sounds the same plowing-call: *break up your fallow ground: for it is time to seek
--      Yahuah (LORD)* (Hos 10:12). And the sowing-among-thorns warns of the choked seed: *some fell among
--      thorns; and the thorns sprung up, and choked them* (Matt 13:7), *the care of this world, and the
--      deceitfulness of riches, choke the word* (Matt 13:22). The Torah inward — the heart circumcised, the
--      ground broken up — is the framework's anti-antinomian core, not its undoing.
--   ★ WASH THINE HEART — THE JUDGMENT SELF-PROCURED (THREAD 2): *O Jerusalem, wash thine heart from
--      wickedness, that thou mayest be saved* (4:14); *Thy way and thy doings have procured these things unto
--      thee; this is thy wickedness* (4:18). The cleansing of the heart is the same call Isaiah gives — *Wash
--      you, make you clean; put away the evil of your doings* (Isa 1:16) — and David prays — *Create in me a
--      clean heart, O Elohim (God)* (Ps 51:10). James echoes it forward: *Cleanse your hands, ye sinners; and
--      purify your hearts, ye double minded* (Jas 4:8). And the judgment is not arbitrary but reaped: *thy way
--      and thy doings have procured these things* (4:18) — *Be not deceived; Elohim (God) is not mocked: for
--      whatsoever a man soweth, that shall he also reap* (Gal 6:7). The covenant-lawsuit names sin within the
--      covenant; the door of return stands open — that thou mayest be saved.
--   ★★ THE DE-CREATION VISION (THREAD 3): *I beheld the earth, and, lo, it was without form, and void; and the
--      heavens, and they had no light. I beheld the mountains, and, lo, they trembled... I beheld, and, lo,
--      there was no man... the fruitful place was a wilderness* (4:23-26). The judgment unmakes the world: the
--      very words of creation's first chaos are pulled back over the land — *And the earth was without form, and
--      void; and darkness was upon the face of the deep* (Gen 1:2). The covenant-judgment is an UN-creation, a
--      reversal of the six days. Isaiah's earth-emptying is the same: *Behold, Yahuah (LORD) maketh the earth
--      empty, and maketh it waste* (Isa 24:1), *The earth is utterly broken down* (Isa 24:19). Zephaniah's
--      consuming too: *I will utterly consume all things from off the land* (Zeph 1:2), *I will cut off man from
--      off the land* (Zeph 1:3). And the final un-making is the dissolution of the day of Yahuah: *the heavens
--      shall pass away with a great noise* (2 Pet 3:10), *the heavens being on fire shall be dissolved* (2 Pet
--      3:12). Yet mark the bound: *yet will I not make a full end* (4:27) — the un-creation is judgment, not
--      annihilation; the remnant-mercy stands.
--   VERSES WITH NO SEPARATE ADD: v.1-2 (the call to return; the nations blessing themselves — the return is
--      the gateway carried into THREAD 1), v.5-13 (the trumpet-alarm and the lion/destroyer from the north —
--      the historical Babylonian invasion, woven in prose), v.15-17 (the besieging watchers and the rebellion
--      named — leads into the self-procured judgment of THREAD 2), v.19-22 (the prophet's anguish and the
--      people's folly — the lament that opens onto the de-creation vision), v.27-31 (the desolation tempered by
--      *I will not make a full end*; the travailing daughter of Zion — the remnant-mercy that bounds THREAD 3).
--      All blocks recorded; every meaningful section carries or is bound to a thread.

CREATE TEMP VIEW _s309_jer04_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): circumcise the foreskins of your heart — the inward Torah, not its abolition
    ('canon','jeremiah',4,4,'canon','deuteronomy',10,16,'free',
      E'*Circumcise therefore the foreskin of your heart, and be no more stiffnecked* (Deuteronomy 10:16). Jeremiah''s command — *Circumcise yourselves to Yahuah (LORD), and take away the foreskins of your heart* (Jeremiah 4:4) — is no new thing: it is Moses'' own word, the heart-circumcision the Torah always demanded alongside the sign in the flesh. The outward circumcision was ever meant to be matched by the inward; the prophet calls Yahudah (Judah) back to what the Torah required from the first.'),
    ('canon','jeremiah',4,4,'canon','deuteronomy',30,6,'free',
      E'*And Yahuah Elohayka (the LORD thy God) will circumcise thine heart, and the heart of thy seed, to love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, that thou mayest live* (Deuteronomy 30:6). What Jeremiah commands — *take away the foreskins of your heart* (Jeremiah 4:4) — Moses promises Yahuah himself will perform: the circumcised heart that loves and obeys. The inward Torah is the covenant''s own goal, the heart made able to love Yahuah and live; never the law set aside.'),
    ('canon','jeremiah',4,4,'canon','romans',2,29,'free',
      E'*But he is a Yahudi (Jew), which is one inwardly; and circumcision is that of the heart, in the spirit, and not in the letter; whose praise is not of men, but of Elohim (God)* (Romans 2:29). Paul reads the prophets exactly: the *circumcision of the heart* Jeremiah commands (Jeremiah 4:4) is the true circumcision, *in the spirit, and not in the letter*. This is not the abolition of the Torah but its inward fulfilment — the sign in the flesh was always pointing to the sign in the heart.'),
    ('canon','jeremiah',4,4,'canon','romans',2,28,'free',
      E'*For he is not a Yahudi (Jew), which is one outwardly; neither is that circumcision, which is outward in the flesh* (Romans 2:28). Jeremiah''s rebuke — that an outwardly-circumcised Yahudah (Judah) still bears uncircumcised hearts (Jeremiah 4:4) — is Paul''s very point: the flesh-sign without the heart-sign profits nothing. The Torah''s demand was always for both; the foreskin of the heart taken away is what makes the outward true.'),
    ('canon','jeremiah',4,3,'canon','hosea',10,12,'free',
      E'*Sow to yourselves in righteousness, reap in mercy; break up your fallow ground: for it is time to seek Yahuah (LORD), till he come and rain righteousness upon you* (Hosea 10:12). Hosea sounds the same plowing-call Jeremiah gives — *Break up your fallow ground, and sow not among thorns* (Jeremiah 4:3). The hard, untilled heart must be broken open before the seed of righteousness can take; both prophets summon the people to break up the ground and seek Yahuah while there is time.'),
    ('canon','jeremiah',4,3,'canon','matthew',13,7,'free',
      E'*And some fell among thorns; and the thorns sprung up, and choked them* (Matthew 13:7). Jeremiah''s warning — *sow not among thorns* (Jeremiah 4:3) — is the parable of the sower in seed: the word sown into a thorny, unbroken heart is choked before it can bear. The fallow ground must be broken up and cleared, or the good seed comes to nothing.'),
    ('canon','jeremiah',4,3,'canon','matthew',13,22,'free',
      E'*He also that received seed among the thorns is he that heareth the word; and the care of this world, and the deceitfulness of riches, choke the word, and he becometh unfruitful* (Matthew 13:22). The Messiah names the thorns Jeremiah warned of — *sow not among thorns* (Jeremiah 4:3): the cares and riches of the world that strangle the word in an unbroken heart. The remedy is the broken-up ground, the circumcised heart, that the word may take root and bear.'),

    -- THREAD 2 (★): wash thine heart from wickedness — the judgment self-procured
    ('canon','jeremiah',4,14,'canon','isaiah',1,16,'free',
      E'*Wash you, make you clean; put away the evil of your doings from before mine eyes; cease to do evil* (Isaiah 1:16). Jeremiah''s call — *O Jerusalem, wash thine heart from wickedness, that thou mayest be saved* (Jeremiah 4:14) — is Isaiah''s same summons to a defiled people: wash, put away the evil doings, cease. The cleansing demanded is of the heart and the deeds together; the door of salvation stands open to the one who will be made clean.'),
    ('canon','jeremiah',4,14,'canon','psalms',51,10,'free',
      E'*Create in me a clean heart, O Elohim (God); and renew a right spirit within me* (Psalm 51:10). What Jeremiah commands Jerusalem — *wash thine heart from wickedness* (Jeremiah 4:14) — David prays as the only true remedy: a clean heart that Elohim (God) must create. The washing of the heart is no mere outward reform; it is the new, clean heart the contrite sinner asks of Yahuah.'),
    ('canon','jeremiah',4,14,'canon','james',4,8,'free',
      E'*Draw nigh to Elohim (God), and he will draw nigh to you. Cleanse your hands, ye sinners; and purify your hearts, ye double minded* (James 4:8). James echoes Jeremiah''s call forward — *wash thine heart from wickedness, that thou mayest be saved* (Jeremiah 4:14): the double-minded must purify the heart, not the hands alone. The inward cleansing Jeremiah demanded is the same the apostle presses on those who would draw near to Elohim.'),
    ('canon','jeremiah',4,18,'canon','galatians',6,7,'free',
      E'*Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap* (Galatians 6:7). Jeremiah names the judgment self-procured — *Thy way and thy doings have procured these things unto thee; this is thy wickedness* (Jeremiah 4:18). The harvest of ruin is reaped from the seed of the people''s own doings; Paul states the principle plainly: Elohim (God) is not mocked, and a people reaps what it sows.'),

    -- THREAD 3 (★★): I beheld the earth, and, lo, it was without form, and void — the de-creation vision
    ('canon','jeremiah',4,23,'canon','genesis',1,2,'free',
      E'*And the earth was without form, and void; and darkness was upon the face of the deep. And the Spirit of Elohim (God) moved upon the face of the waters* (Genesis 1:2). Jeremiah''s vision pulls the very words of the first chaos back over the land — *I beheld the earth, and, lo, it was without form, and void; and the heavens, and they had no light* (Jeremiah 4:23). The covenant-judgment is an UN-creation: the world unmade back to the formless void and the lightless deep, the six days reversed.'),
    ('canon','jeremiah',4,23,'canon','isaiah',24,1,'free',
      E'*Behold, Yahuah (LORD) maketh the earth empty, and maketh it waste, and turneth it upside down, and scattereth abroad the inhabitants thereof* (Isaiah 24:1). Isaiah sees the same emptying Jeremiah beholds — *I beheld, and, lo, there was no man... the fruitful place was a wilderness* (Jeremiah 4:25-26). The earth made empty and waste, the inhabitants scattered: the judgment turns the ordered world back to desolation.'),
    ('canon','jeremiah',4,23,'canon','isaiah',24,19,'free',
      E'*The earth is utterly broken down, the earth is clean dissolved, the earth is moved exceedingly* (Isaiah 24:19). The trembling mountains and quaking hills of Jeremiah''s vision — *I beheld the mountains, and, lo, they trembled, and all the hills moved lightly* (Jeremiah 4:24) — are Isaiah''s earth utterly broken down and dissolved. The very foundations shake; the un-creation reaches the frame of the world itself.'),
    ('canon','jeremiah',4,25,'canon','zephaniah',1,2,'free',
      E'*I will utterly consume all things from off the land, saith Yahuah (LORD)* (Zephaniah 1:2). Jeremiah''s no-man, no-bird desolation — *I beheld, and, lo, there was no man, and all the birds of the heavens were fled* (Jeremiah 4:25) — is Zephaniah''s utter consuming of all things from off the land. The judgment sweeps the land bare of life, man and creature alike.'),
    ('canon','jeremiah',4,25,'canon','zephaniah',1,3,'free',
      E'*I will consume man and beast; I will consume the fowls of the heaven, and the fishes of the sea, and the stumblingblocks with the wicked; and I will cut off man from off the land, saith Yahuah (LORD)* (Zephaniah 1:3). Zephaniah names the very emptying Jeremiah saw — *there was no man, and all the birds of the heavens were fled* (Jeremiah 4:25): man, beast, and fowl consumed, the land cut off. The de-creation undoes the fifth and sixth days, the birds and the man.'),
    ('canon','jeremiah',4,23,'canon','2-peter',3,10,'free',
      E'*But the day of Yahuah (Lord) will come as a thief in the night; in the which the heavens shall pass away with a great noise, and the elements shall melt with fervent heat, the earth also and the works that are therein shall be burned up* (2 Peter 3:10). Jeremiah''s lightless heavens and unmade earth — *the heavens, and they had no light* (Jeremiah 4:23) — reach their final form in the day of Yahuah, when the heavens pass away. The covenant un-creation in Jeremiah foreshadows the last dissolution of heaven and earth.'),
    ('canon','jeremiah',4,23,'canon','2-peter',3,12,'free',
      E'*Looking for and hasting unto the coming of the day of Elohim (God), wherein the heavens being on fire shall be dissolved, and the elements shall melt with fervent heat?* (2 Peter 3:12). The dissolving of the world Jeremiah beholds in vision — *without form, and void; and the heavens, and they had no light* (Jeremiah 4:23) — is consummated when *the heavens being on fire shall be dissolved*. The local un-creation of the land prefigures the cosmic one; yet for the faithful it issues in *new heavens and a new earth* (2 Peter 3:13).')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s309_jer04_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s309_jer04_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-4-circumcise-the-foreskins-of-your-heart',
       E'Circumcise yourselves to Yahuah — take away the foreskins of your heart',
       E'The chapter opens with the door of return held open: *If thou wilt return, O Yashar''el (Israel), saith Yahuah (LORD), return unto me: and if thou wilt put away thine abominations out of my sight, then shalt thou not remove* (4:1). Then comes the command that names what real return is: *For thus saith Yahuah (LORD) to the men of Yahudah (Judah) and Jerusalem, Break up your fallow ground, and sow not among thorns. Circumcise yourselves to Yahuah (LORD), and take away the foreskins of your heart, ye men of Yahudah (Judah) and inhabitants of Jerusalem: lest my fury come forth like fire* (4:3-4). Mark well: this is NOT a new demand, and it is NOT the abolition of the sign in the flesh. It is exactly what the Torah always required INWARDLY. Moses commanded it: *Circumcise therefore the foreskin of your heart, and be no more stiffnecked* (Deuteronomy 10:16); and Moses promised Yahuah himself would do it: *Yahuah Elohayka (the LORD thy God) will circumcise thine heart, and the heart of thy seed, to love Yahuah Elohayka (the LORD thy God) with all thine heart, and with all thy soul, that thou mayest live* (Deuteronomy 30:6). The outward circumcision was ever meant to be matched by the inward — a heart laid bare and yielded, not a stiff neck. Paul reads the prophets precisely so: *he is not a Yahudi (Jew), which is one outwardly; neither is that circumcision, which is outward in the flesh: But he is a Yahudi (Jew), which is one inwardly; and circumcision is that of the heart, in the spirit, and not in the letter* (Romans 2:28-29). This is the inward fulfilment of the Torah, never its undoing. Hosea sounds the very plowing-call: *break up your fallow ground: for it is time to seek Yahuah (LORD), till he come and rain righteousness upon you* (Hosea 10:12) — the hard, untilled heart broken open before the seed can take. And the sowing-among-thorns is the Messiah''s warning in seed: *some fell among thorns; and the thorns sprung up, and choked them* (Matthew 13:7), for *the care of this world, and the deceitfulness of riches, choke the word, and he becometh unfruitful* (Matthew 13:22). The fallow ground broken up, the foreskin of the heart taken away, the thorns cleared — this is the Torah inward, the framework''s anti-antinomian core, the law loved and kept from the heart, not the law set aside.',
       sv.verse_id, ev.verse_id, 'free', 34075
  FROM _s309_jer04_lookup sv, _s309_jer04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=4 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=4 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-4-wash-thine-heart-from-wickedness',
       E'O Jerusalem, wash thine heart from wickedness — thy doings have procured these things',
       E'The same inward demand returns as a cleansing-call in the face of the coming destruction: *O Jerusalem, wash thine heart from wickedness, that thou mayest be saved. How long shall thy vain thoughts lodge within thee?* (4:14). The heart is the thing to be washed — not the hands only, not the outward show — and salvation is held out to the one who will be made clean. This is the summons Isaiah gave a defiled people: *Wash you, make you clean; put away the evil of your doings from before mine eyes; cease to do evil* (Isaiah 1:16); and the prayer David prayed when no outward reform would do: *Create in me a clean heart, O Elohim (God); and renew a right spirit within me* (Psalm 51:10). James presses the same cleansing forward on the double-minded: *Draw nigh to Elohim (God), and he will draw nigh to you. Cleanse your hands, ye sinners; and purify your hearts, ye double minded* (James 4:8). And the judgment that comes is not arbitrary but reaped: *Thy way and thy doings have procured these things unto thee; this is thy wickedness, because it is bitter, because it reacheth unto thine heart* (4:18). The ruin is the harvest of the people''s own seed — *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap* (Galatians 6:7). This is covenant-lawsuit, conduct named within the covenant, never ethnic accusation; and even here the door stands open — *wash thine heart... that thou mayest be saved*.',
       sv.verse_id, ev.verse_id, 'free', 34078
  FROM _s309_jer04_lookup sv, _s309_jer04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=4 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=4 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-4-i-beheld-the-earth-without-form-and-void',
       E'I beheld the earth, and, lo, it was without form, and void — the judgment as un-creation',
       E'Then the prophet is given a vision that pulls the world back to its beginning-chaos: *I beheld the earth, and, lo, it was without form, and void; and the heavens, and they had no light. I beheld the mountains, and, lo, they trembled, and all the hills moved lightly. I beheld, and, lo, there was no man, and all the birds of the heavens were fled. I beheld, and, lo, the fruitful place was a wilderness, and all the cities thereof were broken down at the presence of Yahuah (LORD), and by his fierce anger* (4:23-26). These are the very words of the first day''s chaos: *And the earth was without form, and void; and darkness was upon the face of the deep* (Genesis 1:2). The covenant-judgment is an UN-creation — the six days run backward: the light withdrawn, the dry land made waste, the birds fled, the man gone. Isaiah saw the same emptying: *Behold, Yahuah (LORD) maketh the earth empty, and maketh it waste, and turneth it upside down* (Isaiah 24:1), *The earth is utterly broken down, the earth is clean dissolved, the earth is moved exceedingly* (Isaiah 24:19). Zephaniah the same consuming: *I will utterly consume all things from off the land, saith Yahuah (LORD)* (Zephaniah 1:2), *I will consume man and beast; I will consume the fowls of the heaven... and I will cut off man from off the land* (Zephaniah 1:3). And the final un-making is the day of Yahuah at the end: *the heavens shall pass away with a great noise, and the elements shall melt with fervent heat* (2 Peter 3:10), *the heavens being on fire shall be dissolved* (2 Peter 3:12). Yet mark the bound Yahuah sets even here: *For thus hath Yahuah (LORD) said, The whole land shall be desolate; yet will I not make a full end* (4:27). The un-creation is judgment, not annihilation; the remnant-mercy stands, and beyond the dissolving the faithful look for *new heavens and a new earth, wherein dwelleth righteousness* (2 Peter 3:13).',
       sv.verse_id, ev.verse_id, 'free', 34081
  FROM _s309_jer04_lookup sv, _s309_jer04_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=4 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=4 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *Circumcise therefore the foreskin of your heart, and be no more stiffnecked* (Deuteronomy 10:16) — Moses'' own command; the heart-circumcision the Torah always demanded, not a new thing.'
  FROM cross_reference_threads t
  JOIN _s309_jer04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=4 AND sv.verse_number=4
  JOIN _s309_jer04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=10 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-4-circumcise-the-foreskins-of-your-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Yahuah will circumcise thine heart... to love Yahuah... that thou mayest live* (Deuteronomy 30:6) — Moses promises Yahuah himself will perform the heart-circumcision Jeremiah commands; the covenant''s own goal.'
  FROM cross_reference_threads t
  JOIN _s309_jer04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=4 AND sv.verse_number=4
  JOIN _s309_jer04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-4-circumcise-the-foreskins-of-your-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *circumcision is that of the heart, in the spirit, and not in the letter* (Romans 2:29) — Paul reads Jeremiah 4:4 exactly: the true circumcision is inward, the Torah''s fulfilment, not its abolition.'
  FROM cross_reference_threads t
  JOIN _s309_jer04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=4 AND sv.verse_number=4
  JOIN _s309_jer04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-4-circumcise-the-foreskins-of-your-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *neither is that circumcision, which is outward in the flesh* (Romans 2:28) — the flesh-sign without the heart-sign profits nothing; the Torah always demanded both.'
  FROM cross_reference_threads t
  JOIN _s309_jer04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=4 AND sv.verse_number=4
  JOIN _s309_jer04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=2 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-4-circumcise-the-foreskins-of-your-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *break up your fallow ground: for it is time to seek Yahuah (LORD)* (Hosea 10:12) — Hosea''s same plowing-call; the hard heart broken open before the seed of righteousness can take.'
  FROM cross_reference_threads t
  JOIN _s309_jer04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=4 AND sv.verse_number=3
  JOIN _s309_jer04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=10 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-4-circumcise-the-foreskins-of-your-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *some fell among thorns; and the thorns sprung up, and choked them* (Matthew 13:7) — Jeremiah''s *sow not among thorns* (4:3) in seed; the word choked in an unbroken heart.'
  FROM cross_reference_threads t
  JOIN _s309_jer04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=4 AND sv.verse_number=3
  JOIN _s309_jer04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-4-circumcise-the-foreskins-of-your-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *the care of this world, and the deceitfulness of riches, choke the word* (Matthew 13:22) — the thorns named: the cares that strangle the word where the fallow ground is not broken up.'
  FROM cross_reference_threads t
  JOIN _s309_jer04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=4 AND sv.verse_number=3
  JOIN _s309_jer04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-4-circumcise-the-foreskins-of-your-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Wash you, make you clean; put away the evil of your doings* (Isaiah 1:16) — Isaiah''s same summons to a defiled people; the cleansing of heart and deeds together.'
  FROM cross_reference_threads t
  JOIN _s309_jer04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=4 AND sv.verse_number=14
  JOIN _s309_jer04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-4-wash-thine-heart-from-wickedness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Create in me a clean heart, O Elohim (God)* (Psalm 51:10) — the washing of the heart Jeremiah commands is the new heart only Elohim can create; David''s contrite prayer.'
  FROM cross_reference_threads t
  JOIN _s309_jer04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=4 AND sv.verse_number=14
  JOIN _s309_jer04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=51 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-4-wash-thine-heart-from-wickedness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Cleanse your hands, ye sinners; and purify your hearts, ye double minded* (James 4:8) — James echoes Jeremiah 4:14 forward; the inward cleansing pressed on those who draw near to Elohim.'
  FROM cross_reference_threads t
  JOIN _s309_jer04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=4 AND sv.verse_number=14
  JOIN _s309_jer04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=4 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-4-wash-thine-heart-from-wickedness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *whatsoever a man soweth, that shall he also reap* (Galatians 6:7) — the judgment self-procured: *thy doings have procured these things* (4:18); the ruin reaped from the people''s own seed.'
  FROM cross_reference_threads t
  JOIN _s309_jer04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=4 AND sv.verse_number=18
  JOIN _s309_jer04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-4-wash-thine-heart-from-wickedness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *And the earth was without form, and void; and darkness was upon the face of the deep* (Genesis 1:2) — Jeremiah 4:23 pulls the first-day chaos back over the land; the judgment as un-creation, the six days reversed.'
  FROM cross_reference_threads t
  JOIN _s309_jer04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=4 AND sv.verse_number=23
  JOIN _s309_jer04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-4-i-beheld-the-earth-without-form-and-void'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Yahuah (LORD) maketh the earth empty, and maketh it waste* (Isaiah 24:1) — Isaiah''s same emptying: the fruitful place a wilderness, the inhabitants scattered.'
  FROM cross_reference_threads t
  JOIN _s309_jer04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=4 AND sv.verse_number=23
  JOIN _s309_jer04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-4-i-beheld-the-earth-without-form-and-void'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *The earth is utterly broken down, the earth is clean dissolved* (Isaiah 24:19) — the trembling mountains and quaking hills of Jeremiah 4:24; the very frame of the world shaken.'
  FROM cross_reference_threads t
  JOIN _s309_jer04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=4 AND sv.verse_number=23
  JOIN _s309_jer04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-4-i-beheld-the-earth-without-form-and-void'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *I will utterly consume all things from off the land* (Zephaniah 1:2) — Jeremiah''s no-man, no-bird desolation (4:25); the land swept bare of life.'
  FROM cross_reference_threads t
  JOIN _s309_jer04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=4 AND sv.verse_number=25
  JOIN _s309_jer04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=1 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-4-i-beheld-the-earth-without-form-and-void'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *I will consume man and beast... the fowls of the heaven... and I will cut off man from off the land* (Zephaniah 1:3) — the de-creation undoes the fifth and sixth days, the birds and the man (Jeremiah 4:25).'
  FROM cross_reference_threads t
  JOIN _s309_jer04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=4 AND sv.verse_number=25
  JOIN _s309_jer04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=1 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-4-i-beheld-the-earth-without-form-and-void'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *the heavens shall pass away with a great noise, and the elements shall melt with fervent heat* (2 Peter 3:10) — Jeremiah''s lightless, unmade heavens (4:23) reach their final form in the day of Yahuah.'
  FROM cross_reference_threads t
  JOIN _s309_jer04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=4 AND sv.verse_number=23
  JOIN _s309_jer04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-4-i-beheld-the-earth-without-form-and-void'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *the heavens being on fire shall be dissolved* (2 Peter 3:12) — the local un-creation of the land prefigures the cosmic one; beyond it, *new heavens and a new earth* (2 Peter 3:13).'
  FROM cross_reference_threads t
  JOIN _s309_jer04_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=4 AND sv.verse_number=23
  JOIN _s309_jer04_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-4-i-beheld-the-earth-without-form-and-void'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jeremiah_5.sql (Jeremiah 5) -----
-- Chapter: Jeremiah 5 — the COVENANT LAWSUIT of the city. *Run ye to and fro through the streets of
-- Jerusalem... if ye can find a man... that seeketh the truth; and I will pardon it* — the search for one
-- righteous man, none found high or low (the poor know not the way, the great men have broken the yoke).
-- Then the senseless people: *which have eyes, and see not; which have ears, and hear not* — a revolting and
-- rebellious heart, that will not fear Yahuah who set the sand to bound the sea. And the climax: *A wonderful
-- and horrible thing is committed in the land; The prophets prophesy falsely, and the priests bear rule by
-- their means; and my people love to have it so* — the false prophets, the complicit priests, and a people
-- in love with the lie. (Note: the two-house phrase v.11 — *the house of Yashar''el (Israel) and the house
-- of Yahudah (Judah)* — woven in prose; the lawsuit is against BOTH houses.)
-- Tag: jer05   Temp view: _s309_jer05_lookup   Session: s309
-- Sort band: base 34100, step 3 -> threads at 34100, 34103, 34106 (3 threads)
-- Source of EVERY row: 'canon','jeremiah',5,v
--
-- Jeremiah 5 coverage:
--   ★ v.1-5 (Run ye to and fro through the streets of Jerusalem... if ye can find a man, if there be any
--          that executeth judgment, that seeketh the truth; and I will pardon it... I will get me unto the
--          great men... but these have altogether broken the yoke, and burst the bonds)
--        NT:     ★ Romans 3:10-12 (There is none righteous, no, not one... none that doeth good) — THREAD 1
--        Extras: none warranted
--        Tanakh: ★ Genesis 18:23-32 (if there be fifty righteous... peradventure ten — Sodom), ★ Psalm
--                14:2-3 (Yahuah looked down... there is none that doeth good), ★ Ezekiel 22:30 (I sought
--                for a man... but I found none — lateral) — THREAD 1
--   v.6-10 (a lion out of the forest shall slay them; their backslidings are increased; thy children have
--          forsaken me; go ye up upon her walls, and destroy; but make not a full end)
--        NT:     none warranted     Extras: none warranted
--        Tanakh: none separate (the judgment-by-beasts and the adultery of the people; woven in prose, the
--                covenant-lawsuit verdict on the unrighteous city of THREAD 1)
--   v.11-13 (the house of Yashar''el and the house of Yahudah have dealt very treacherously; they have
--          belied Yahuah... the prophets shall become wind, and the word is not in them)
--        NT:     none warranted distinct (the false-prophet word held to the climax v.30-31, THREAD 3)
--        Extras: none warranted
--        Tanakh: held in prose — the two-house treachery (both houses) and the windy prophets prefacing
--                THREAD 3 (the prophets prophesy falsely)
--   v.14-19 (I will make my words in thy mouth fire... I will bring a nation upon you from far... yet I
--          will not make a full end with you... so shall ye serve strangers in a land that is not yours)
--        NT:     none warranted     Extras: none warranted
--        Tanakh: none separate (the Babylonian invasion-judgment; the covenant-curse of serving strangers;
--                woven in prose as the verdict of the lawsuit)
--   ★ v.20-24 (Hear now this, O foolish people, and without understanding; which have eyes, and see not;
--          which have ears, and hear not: Fear ye not me? saith Yahuah... but this people hath a revolting
--          and a rebellious heart... that giveth rain, both the former and the latter)
--        NT:     ★★ Matthew 13:14-15 (By hearing ye shall hear, and shall not understand — the Messiah
--                quotes Esaias), ★ Mark 8:18 (Having eyes, see ye not? and having ears, hear ye not?),
--                ★ Romans 11:8 (the spirit of slumber, eyes that they should not see) — THREAD 2
--        Extras: none warranted
--        Tanakh: ★★ Isaiah 6:9-10 (Hear ye indeed, but understand not; see ye indeed, but perceive not),
--                ★ Deuteronomy 29:4 (Yahuah hath not given you an heart to perceive, and eyes to see) — THREAD 2
--   v.25-29 (your iniquities have turned away these things; among my people are found wicked men... they
--          judge not the cause of the fatherless... shall I not visit for these things?)
--        NT:     none warranted     Extras: none warranted
--        Tanakh: none separate (the corruption of all ranks — the snare-setters, the fat and the rich who
--                do not judge the fatherless; the social-injustice indictment, woven in prose, leading to
--                the climax of v.30-31)
--   ★★ v.30-31 (A wonderful and horrible thing is committed in the land; The prophets prophesy falsely,
--          and the priests bear rule by their means; and my people love to have it so: and what will ye
--          do in the end thereof?)
--        NT:     ★★ 2 Timothy 4:3-4 (they will not endure sound doctrine... turn away their ears from the
--                truth), ★★ 2 Thessalonians 2:10-12 (they received not the love of the truth... Elohim
--                shall send them strong delusion) — THREAD 3
--        Extras: none warranted
--        Tanakh: ★ Jeremiah 23:21 (I have not sent these prophets, yet they ran — lateral), ★★ Isaiah
--                30:10 (Prophesy not unto us right things, speak unto us smooth things) — THREAD 3
--
-- Threads (slug — target libraries):
--   1. jeremiah-5-run-through-the-streets-and-seek-if-there-be-any-that-seeketh-the-truth — NT (Romans 3) + Tanakh (Genesis 18, Psalm 14, Ezekiel 22) [free]
--      (★ the search for one righteous man in the city — none found, high or low; none righteous, no, not one)
--   2. jeremiah-5-which-have-eyes-and-see-not-a-revolting-and-rebellious-heart — NT (Matthew 13, Mark 8, Romans 11) + Tanakh (Isaiah 6, Deuteronomy 29) [free]
--      (★ the senseless people who neither see nor hear nor fear — the blind, unfearing, rebellious heart)
--   3. jeremiah-5-the-prophets-prophesy-falsely-and-my-people-love-to-have-it-so — NT (2 Timothy 4, 2 Thessalonians 2) + Tanakh (Jeremiah 23, Isaiah 30) [free]
--      (★★ the false prophets and complicit priests, and a people who LOVE the lie — what will ye do in the end thereof?)
--
-- Framing notes:
--   ★ THE SEARCH FOR ONE JUST MAN (THREAD 1): *Run ye to and fro through the streets of Jerusalem, and see
--      now, and know, and seek in the broad places thereof, if ye can find a man, if there be any that
--      executeth judgment, that seeketh the truth; and I will pardon it* (5:1). The whole city is searched —
--      and none is found, neither low nor high: *Therefore I said, Surely these are poor; they are foolish:
--      for they know not the way of Yahuah (LORD)... I will get me unto the great men... but these have
--      altogether broken the yoke, and burst the bonds* (5:4-5). This is the very plea of Abraham over Sodom —
--      *Peradventure there be fifty righteous within the city... Peradventure ten shall be found there* (Gen
--      18:24,32) — but where Sodom might have ten, Jerusalem has not one. Paul gathers the verdict: *There is
--      none righteous, no, not one... there is none that doeth good, no, not one* (Rom 3:10,12), itself
--      quoting the psalm — *Yahuah (LORD) looked down from heaven upon the children of men, to see if there
--      were any that did understand, and seek Elohim (God). They are all gone aside... there is none that
--      doeth good, no, not one* (Ps 14:2-3). And Ezekiel runs the same search for one intercessor and comes
--      up empty: *I sought for a man among them, that should make up the hedge, and stand in the gap before
--      me for the land... but I found none* (Ezek 22:30). None righteous in the city; the One who could pardon
--      finds none to pardon for.
--   ★ THE BLIND, UNFEARING HEART (THREAD 2): *Hear now this, O foolish people, and without understanding;
--      which have eyes, and see not; which have ears, and hear not: Fear ye not me? saith Yahuah (LORD)...
--      But this people hath a revolting and a rebellious heart; they are revolted and gone* (5:21,23). The
--      senseless people neither see nor hear nor fear the One who *placed the sand for the bound of the sea
--      by a perpetual decree* (5:22). This is Isaiah''s commission word — *Hear ye indeed, but understand not;
--      and see ye indeed, but perceive not* (Isa 6:9) — and the Torah''s diagnosis — *Yahuah (LORD) hath not
--      given you an heart to perceive, and eyes to see, and ears to hear, unto this day* (Deut 29:4). The
--      Messiah quotes Isaiah of the same dull crowd — *By hearing ye shall hear, and shall not understand;
--      and seeing ye shall see, and shall not perceive* (Matt 13:14) — and rebukes his own with Jeremiah''s
--      very figure: *Having eyes, see ye not? and having ears, hear ye not?* (Mark 8:18). Paul names the
--      hardening: *the spirit of slumber, eyes that they should not see, and ears that they should not hear*
--      (Rom 11:8). The blind, unfearing, rebellious heart that will not tremble at Yahuah''s presence.
--   ★★ A PEOPLE IN LOVE WITH THE LIE (THREAD 3): *A wonderful and horrible thing is committed in the land;
--      The prophets prophesy falsely, and the priests bear rule by their means; and my people love to have it
--      so: and what will ye do in the end thereof?* (5:30-31). The corruption runs through every rank — false
--      prophets, complicit priests — and, worst, a people who LOVE to have it so. Jeremiah elsewhere names the
--      unsent prophets: *I have not sent these prophets, yet they ran: I have not spoken to them, yet they
--      prophesied* (Jer 23:21). Isaiah names the appetite for flattery: *Prophesy not unto us right things,
--      speak unto us smooth things, prophesy deceits* (Isa 30:10). Paul tells the end of it: *the time will
--      come when they will not endure sound doctrine; but after their own lusts shall they heap to themselves
--      teachers, having itching ears; And they shall turn away their ears from the truth* (2 Tim 4:3-4); and
--      the final judgment on the love of the lie — *because they received not the love of the truth... Elohim
--      (God) shall send them strong delusion, that they should believe a lie* (2 Thess 2:10-11). A people in
--      love with falsehood; what WILL they do in the end thereof?
--   VERSES WITH NO SEPARATE ADD: v.6-10 (the judgment-by-beasts, the adultery, destroy-but-make-not-a-full-end
--      — the lawsuit verdict on the unrighteous city, woven in THREAD 1 prose), v.11-13 (the two-house
--      treachery and the windy prophets — held to THREAD 3, the prophets prophesy falsely), v.14-19 (the
--      Babylonian invasion from far, the curse of serving strangers — covenant-curse verdict, woven in prose),
--      v.25-29 (the corruption of all ranks, the snare-setters, the fatherless unjudged — the social-injustice
--      indictment leading into the climax of v.30-31). All blocks recorded; every meaningful section carries
--      or is bound to a thread.

CREATE TEMP VIEW _s309_jer05_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): the search for one righteous man in the city — none found, high or low
    ('canon','jeremiah',5,1,'canon','romans',3,10,'free',
      E'*As it is written, There is none righteous, no, not one* (Romans 3:10). Paul gathers the verdict of Jeremiah''s search — *if ye can find a man... that seeketh the truth; and I will pardon it* (Jeremiah 5:1): the city is combed, and none is found. *There is none righteous, no, not one* is the answer to *if ye can find a man*; the streets of Jerusalem yield not one just man.'),
    ('canon','jeremiah',5,1,'canon','romans',3,12,'free',
      E'*They are all gone out of the way, they are together become unprofitable; there is none that doeth good, no, not one* (Romans 3:12). Jeremiah is sent to seek one that *executeth judgment, that seeketh the truth* (Jeremiah 5:1), and finds none — Paul says why: *they are all gone out of the way... there is none that doeth good, no, not one*. The pardon waits on one righteous man, and there is not one.'),
    ('canon','jeremiah',5,1,'canon','genesis',18,32,'free',
      E'*And he said, Oh let not Yahuah (Lord) be angry, and I will speak yet but this once: Peradventure ten shall be found there. And he said, I will not destroy it for ten''s sake* (Genesis 18:32). Abraham bargained Yahuah (Lord) down to ten righteous to spare Sodom; Jeremiah is sent to find but ONE to pardon Jerusalem — *if ye can find a man... and I will pardon it* (Jeremiah 5:1). Where Sodom might have had ten, the holy city cannot yield one.'),
    ('canon','jeremiah',5,1,'canon','genesis',18,23,'free',
      E'*And Abraham drew near, and said, Wilt thou also destroy the righteous with the wicked?* (Genesis 18:23). The search of Jeremiah 5:1 — *if ye can find a man, if there be any that executeth judgment... and I will pardon it* — is the question Abraham pressed over Sodom: will the righteous be swept away with the wicked? Yahuah will pardon the whole city for the sake of the righteous found in it; the tragedy is that, in Jerusalem, none is found.'),
    ('canon','jeremiah',5,1,'canon','psalms',14,3,'free',
      E'*They are all gone aside, they are all together become filthy: there is none that doeth good, no, not one* (Psalm 14:3). The psalm is the verdict Jeremiah''s street-search confirms — *if ye can find a man... that seeketh the truth* (Jeremiah 5:1): *Yahuah (LORD) looked down from heaven... to see if there were any that did understand, and seek Elohim (God)* (Ps 14:2), and found them all gone aside. None righteous, none that doeth good, no, not one.'),
    ('canon','jeremiah',5,5,'canon','ezekiel',22,30,'free',
      E'*And I sought for a man among them, that should make up the hedge, and stand in the gap before me for the land, that I should not destroy it: but I found none* (Ezekiel 22:30). Ezekiel runs the same search Jeremiah runs and comes up as empty: Jeremiah goes even to *the great men* (Jeremiah 5:5) and finds them all with the yoke broken; Ezekiel seeks one to *stand in the gap* and finds none. Neither low nor great, neither prophet nor priest — *but I found none*.'),

    -- THREAD 2 (★): which have eyes, and see not — a revolting and rebellious heart
    ('canon','jeremiah',5,21,'canon','isaiah',6,9,'free',
      E'*And he said, Go, and tell this people, Hear ye indeed, but understand not; and see ye indeed, but perceive not* (Isaiah 6:9). Isaiah''s commission names the very dullness Jeremiah confronts — *O foolish people, and without understanding; which have eyes, and see not; which have ears, and hear not* (Jeremiah 5:21). The people have eyes and ears, yet neither perceive nor understand: the seeing that does not see, the hearing that does not hear.'),
    ('canon','jeremiah',5,21,'canon','deuteronomy',29,4,'free',
      E'*Yet Yahuah (LORD) hath not given you an heart to perceive, and eyes to see, and ears to hear, unto this day* (Deuteronomy 29:4). The Torah''s own diagnosis stands behind Jeremiah''s rebuke — *which have eyes, and see not; which have ears, and hear not* (Jeremiah 5:21): a people with eyes and ears but no heart to perceive. The faculties are there; the understanding is withheld from the rebellious heart.'),
    ('canon','jeremiah',5,21,'canon','matthew',13,14,'free',
      E'*And in them is fulfilled the prophecy of Esaias, which saith, By hearing ye shall hear, and shall not understand; and seeing ye shall see, and shall not perceive* (Matthew 13:14). The Messiah quotes Isaiah of the same dull crowd Jeremiah faced — *which have eyes, and see not; which have ears, and hear not* (Jeremiah 5:21): *For this people''s heart is waxed gross, and their ears are dull of hearing* (Matt 13:15). The blind, unhearing heart is the same in every generation that will not return.'),
    ('canon','jeremiah',5,21,'canon','mark',8,18,'free',
      E'*Having eyes, see ye not? and having ears, hear ye not? and do ye not remember?* (Mark 8:18). The Messiah rebukes his own disciples with Jeremiah''s very figure — *which have eyes, and see not; which have ears, and hear not* (Jeremiah 5:21). The reproach of the unperceiving eye and the unhearing ear reaches even the household of faith: see, and see not; hear, and hear not.'),
    ('canon','jeremiah',5,23,'canon','romans',11,8,'free',
      E'*Elohim (God) hath given them the spirit of slumber, eyes that they should not see, and ears that they should not hear; unto this day* (Romans 11:8). Paul names the hardening Jeremiah describes — *this people hath a revolting and a rebellious heart; they are revolted and gone* (Jeremiah 5:23): the spirit of slumber, eyes that see not, ears that hear not. The rebellious heart and the slumbering eyes are one judgment, *unto this day*.'),

    -- THREAD 3 (★★): the prophets prophesy falsely, the priests bear rule, and my people love to have it so
    ('canon','jeremiah',5,31,'canon','2-timothy',4,3,'free',
      E'*For the time will come when they will not endure sound doctrine; but after their own lusts shall they heap to themselves teachers, having itching ears* (2 Timothy 4:3). Paul foretells the end of Jeremiah''s indictment — *The prophets prophesy falsely... and my people love to have it so* (Jeremiah 5:31): a people who will not endure sound doctrine, but heap up teachers to scratch their itching ears. The false prophets are wanted; the people love to have it so.'),
    ('canon','jeremiah',5,31,'canon','2-timothy',4,4,'free',
      E'*And they shall turn away their ears from the truth, and shall be turned unto fables* (2 Timothy 4:4). The love of the lie Jeremiah names — *my people love to have it so* (Jeremiah 5:31) — is the turning of the ear from truth to fable: they will not hear the right word, so they are turned unto fables. *What will ye do in the end thereof?* (Jeremiah 5:31) is answered by the turning-away itself.'),
    ('canon','jeremiah',5,31,'canon','isaiah',30,10,'free',
      E'*Which say to the seers, See not; and to the prophets, Prophesy not unto us right things, speak unto us smooth things, prophesy deceits* (Isaiah 30:10). Isaiah names the appetite behind Jeremiah''s charge — *The prophets prophesy falsely... and my people love to have it so* (Jeremiah 5:31): the people demand the smooth word and the flattering deceit. The false prophet prophesies falsely because the people love to have it so.'),
    ('canon','jeremiah',5,31,'canon','jeremiah',23,21,'free',
      E'*I have not sent these prophets, yet they ran: I have not spoken to them, yet they prophesied* (Jeremiah 23:21). Jeremiah elsewhere unmasks the very prophets of this chapter — *The prophets prophesy falsely* (Jeremiah 5:31): unsent, yet running; unspoken to, yet prophesying. The word is not in them (Jeremiah 5:13); they prophesy out of their own hearts, and the people love to have it so.'),
    ('canon','jeremiah',5,31,'canon','2-thessalonians',2,10,'free',
      E'*And with all deceivableness of unrighteousness in them that perish; because they received not the love of the truth, that they might be saved* (2 Thessalonians 2:10). Paul names the root of Jeremiah''s horror — *my people love to have it so* (Jeremiah 5:31): they *received not the love of the truth*. The people who love the lie do not love the truth; and the love of the lie is itself the ground of their perishing.'),
    ('canon','jeremiah',5,31,'canon','2-thessalonians',2,11,'free',
      E'*And for this cause Elohim (God) shall send them strong delusion, that they should believe a lie* (2 Thessalonians 2:11). The end Jeremiah asks after — *what will ye do in the end thereof?* (Jeremiah 5:31) — Paul declares: to those who love the lie, *Elohim (God) shall send them strong delusion, that they should believe a lie*. The people who loved the false prophet are given over to believe the falsehood they loved.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s309_jer05_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s309_jer05_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-5-run-through-the-streets-and-seek-if-there-be-any-that-seeketh-the-truth',
       E'Run ye through the streets of Jerusalem — if ye can find a man that seeketh the truth',
       E'The chapter opens on a search and a promise of pardon hung upon it: *Run ye to and fro through the streets of Jerusalem, and see now, and know, and seek in the broad places thereof, if ye can find a man, if there be any that executeth judgment, that seeketh the truth; and I will pardon it* (5:1). One just man would save the city. So the search runs through every rank. First the lowly: *Therefore I said, Surely these are poor; they are foolish: for they know not the way of Yahuah (LORD), nor the judgment of their Elohim (God)* (5:4). Then the great: *I will get me unto the great men, and will speak unto them; for they have known the way of Yahuah (LORD)... but these have altogether broken the yoke, and burst the bonds* (5:5). High and low alike — none found. This is the very plea Abraham pressed over Sodom: *Wilt thou also destroy the righteous with the wicked? Peradventure there be fifty righteous within the city* (Genesis 18:23-24), down to the last appeal — *Peradventure ten shall be found there. And he said, I will not destroy it for ten''s sake* (Genesis 18:32). Sodom might have had ten; Jerusalem cannot yield one. Paul gathers the verdict whole: *There is none righteous, no, not one... They are all gone out of the way, they are together become unprofitable; there is none that doeth good, no, not one* (Romans 3:10,12) — himself quoting the psalm: *Yahuah (LORD) looked down from heaven upon the children of men, to see if there were any that did understand, and seek Elohim (God). They are all gone aside... there is none that doeth good, no, not one* (Psalm 14:2-3). And Ezekiel runs the same search for one intercessor and finds the same emptiness: *I sought for a man among them, that should make up the hedge, and stand in the gap before me for the land, that I should not destroy it: but I found none* (Ezekiel 22:30). The One who would pardon for the sake of one righteous man searches the whole city, and finds none.',
       sv.verse_id, ev.verse_id, 'free', 34100
  FROM _s309_jer05_lookup sv, _s309_jer05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=5 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=5 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-5-which-have-eyes-and-see-not-a-revolting-and-rebellious-heart',
       E'Which have eyes, and see not — a revolting and rebellious heart',
       E'The lawsuit turns to the senseless people, blind and deaf to the One they will not fear: *Hear now this, O foolish people, and without understanding; which have eyes, and see not; which have ears, and hear not: Fear ye not me? saith Yahuah (LORD): will ye not tremble at my presence, which have placed the sand for the bound of the sea by a perpetual decree* (5:21-22). The Maker who fences the sea cannot make them tremble. And the heart is the trouble: *But this people hath a revolting and a rebellious heart; they are revolted and gone* (5:23). This is the commission word given to Isaiah — *Hear ye indeed, but understand not; and see ye indeed, but perceive not* (Isaiah 6:9) — and the Torah''s own diagnosis of the wilderness generation: *Yet Yahuah (LORD) hath not given you an heart to perceive, and eyes to see, and ears to hear, unto this day* (Deuteronomy 29:4). The Messiah takes up the same figure: he quotes Isaiah of the unbelieving crowd — *By hearing ye shall hear, and shall not understand; and seeing ye shall see, and shall not perceive: For this people''s heart is waxed gross* (Matthew 13:14-15) — and rebukes even his own disciples with it: *Having eyes, see ye not? and having ears, hear ye not? and do ye not remember?* (Mark 8:18). Paul seals it: *Elohim (God) hath given them the spirit of slumber, eyes that they should not see, and ears that they should not hear; unto this day* (Romans 11:8). The eyes and ears are whole; it is the revolting, unfearing heart that will not see, will not hear, will not tremble.',
       sv.verse_id, ev.verse_id, 'free', 34103
  FROM _s309_jer05_lookup sv, _s309_jer05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=5 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=5 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-5-the-prophets-prophesy-falsely-and-my-people-love-to-have-it-so',
       E'The prophets prophesy falsely — and my people love to have it so',
       E'The chapter ends on a horror that runs through every rank and is loved by the people: *A wonderful and horrible thing is committed in the land; The prophets prophesy falsely, and the priests bear rule by their means; and my people love to have it so: and what will ye do in the end thereof?* (5:30-31). The prophets speak lies, the priests rule on the strength of those lies, and — the deepest wound — *my people love to have it so*. The corruption is wanted. Jeremiah elsewhere unmasks these very prophets: *I have not sent these prophets, yet they ran: I have not spoken to them, yet they prophesied* (Jeremiah 23:21) — unsent, unspoken-to, yet prophesying out of their own hearts, for *the word is not in them* (5:13). Isaiah names the appetite that breeds them: a people that say *to the prophets, Prophesy not unto us right things, speak unto us smooth things, prophesy deceits* (Isaiah 30:10). The smooth lie is demanded, so the smooth lie is supplied. Paul traces the same disease to its end: *the time will come when they will not endure sound doctrine; but after their own lusts shall they heap to themselves teachers, having itching ears; And they shall turn away their ears from the truth, and shall be turned unto fables* (2 Timothy 4:3-4). And the final answer to *what will ye do in the end thereof?* is the judgment on the love of the lie: *because they received not the love of the truth, that they might be saved... for this cause Elohim (God) shall send them strong delusion, that they should believe a lie* (2 Thessalonians 2:10-11). Those who loved the false prophet are given over to believe the very falsehood they loved. The lie is not merely tolerated — it is loved; and that love is the snare.',
       sv.verse_id, ev.verse_id, 'free', 34106
  FROM _s309_jer05_lookup sv, _s309_jer05_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=5 AND sv.verse_number=30
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=5 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *There is none righteous, no, not one* (Romans 3:10) — Paul gathers the verdict of Jeremiah 5:1''s search; the city is combed and not one just man is found.'
  FROM cross_reference_threads t
  JOIN _s309_jer05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=5 AND sv.verse_number=1
  JOIN _s309_jer05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=3 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-5-run-through-the-streets-and-seek-if-there-be-any-that-seeketh-the-truth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *there is none that doeth good, no, not one* (Romans 3:12) — none seeks the truth Jeremiah 5:1 sends to find; all gone out of the way.'
  FROM cross_reference_threads t
  JOIN _s309_jer05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=5 AND sv.verse_number=1
  JOIN _s309_jer05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=3 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-5-run-through-the-streets-and-seek-if-there-be-any-that-seeketh-the-truth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Peradventure ten shall be found there... I will not destroy it for ten''s sake* (Genesis 18:32) — Sodom might have had ten righteous; Jeremiah 5:1 seeks but ONE for Jerusalem, and finds none.'
  FROM cross_reference_threads t
  JOIN _s309_jer05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=5 AND sv.verse_number=1
  JOIN _s309_jer05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-5-run-through-the-streets-and-seek-if-there-be-any-that-seeketh-the-truth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Wilt thou also destroy the righteous with the wicked?* (Genesis 18:23) — Abraham''s plea over Sodom: Yahuah pardons the city for the righteous found in it; the tragedy of Jeremiah 5:1 is that none is found.'
  FROM cross_reference_threads t
  JOIN _s309_jer05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=5 AND sv.verse_number=1
  JOIN _s309_jer05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=18 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-5-run-through-the-streets-and-seek-if-there-be-any-that-seeketh-the-truth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *there is none that doeth good, no, not one* (Psalm 14:3) — Yahuah looked down from heaven for one that sought him (Ps 14:2); the psalm is the verdict Jeremiah 5:1''s street-search confirms.'
  FROM cross_reference_threads t
  JOIN _s309_jer05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=5 AND sv.verse_number=1
  JOIN _s309_jer05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=14 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-5-run-through-the-streets-and-seek-if-there-be-any-that-seeketh-the-truth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *I sought for a man... that should... stand in the gap before me for the land... but I found none* (Ezekiel 22:30) — lateral: even the great men of Jeremiah 5:5 have broken the yoke; Ezekiel seeks one intercessor and finds none.'
  FROM cross_reference_threads t
  JOIN _s309_jer05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=5 AND sv.verse_number=5
  JOIN _s309_jer05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=22 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-5-run-through-the-streets-and-seek-if-there-be-any-that-seeketh-the-truth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Hear ye indeed, but understand not; and see ye indeed, but perceive not* (Isaiah 6:9) — Isaiah''s commission word names the very dullness of Jeremiah 5:21; eyes that see not, ears that hear not.'
  FROM cross_reference_threads t
  JOIN _s309_jer05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=5 AND sv.verse_number=21
  JOIN _s309_jer05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-5-which-have-eyes-and-see-not-a-revolting-and-rebellious-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Yahuah (LORD) hath not given you an heart to perceive, and eyes to see, and ears to hear* (Deuteronomy 29:4) — the Torah''s diagnosis behind Jeremiah 5:21: faculties present, understanding withheld from the rebellious heart.'
  FROM cross_reference_threads t
  JOIN _s309_jer05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=5 AND sv.verse_number=21
  JOIN _s309_jer05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=29 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-5-which-have-eyes-and-see-not-a-revolting-and-rebellious-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *By hearing ye shall hear, and shall not understand; and seeing ye shall see, and shall not perceive* (Matthew 13:14) — the Messiah quotes Esaias of the same dull crowd Jeremiah 5:21 faced; the heart waxed gross.'
  FROM cross_reference_threads t
  JOIN _s309_jer05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=5 AND sv.verse_number=21
  JOIN _s309_jer05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=13 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-5-which-have-eyes-and-see-not-a-revolting-and-rebellious-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Having eyes, see ye not? and having ears, hear ye not?* (Mark 8:18) — the Messiah rebukes even his own with Jeremiah 5:21''s figure; the reproach reaches the household of faith.'
  FROM cross_reference_threads t
  JOIN _s309_jer05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=5 AND sv.verse_number=21
  JOIN _s309_jer05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=8 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-5-which-have-eyes-and-see-not-a-revolting-and-rebellious-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *the spirit of slumber, eyes that they should not see, and ears that they should not hear* (Romans 11:8) — Paul names the hardening of Jeremiah 5:23''s revolting heart; one judgment, unto this day.'
  FROM cross_reference_threads t
  JOIN _s309_jer05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=5 AND sv.verse_number=23
  JOIN _s309_jer05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-5-which-have-eyes-and-see-not-a-revolting-and-rebellious-heart'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *they will not endure sound doctrine... heap to themselves teachers, having itching ears* (2 Timothy 4:3) — Paul foretells the end of Jeremiah 5:31''s love of the lie; the false prophet is wanted.'
  FROM cross_reference_threads t
  JOIN _s309_jer05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=5 AND sv.verse_number=31
  JOIN _s309_jer05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=4 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-5-the-prophets-prophesy-falsely-and-my-people-love-to-have-it-so'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *they shall turn away their ears from the truth, and shall be turned unto fables* (2 Timothy 4:4) — the love of the lie (Jeremiah 5:31) turns the ear from truth to fable.'
  FROM cross_reference_threads t
  JOIN _s309_jer05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=5 AND sv.verse_number=31
  JOIN _s309_jer05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-timothy' AND tv.chapter_number=4 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-5-the-prophets-prophesy-falsely-and-my-people-love-to-have-it-so'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *Prophesy not unto us right things, speak unto us smooth things, prophesy deceits* (Isaiah 30:10) — Isaiah names the appetite behind Jeremiah 5:31; the smooth lie is demanded, so it is supplied.'
  FROM cross_reference_threads t
  JOIN _s309_jer05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=5 AND sv.verse_number=31
  JOIN _s309_jer05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=30 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-5-the-prophets-prophesy-falsely-and-my-people-love-to-have-it-so'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *I have not sent these prophets, yet they ran... yet they prophesied* (Jeremiah 23:21) — lateral: Jeremiah elsewhere unmasks the false prophets of 5:31; unsent, the word not in them (5:13).'
  FROM cross_reference_threads t
  JOIN _s309_jer05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=5 AND sv.verse_number=31
  JOIN _s309_jer05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-5-the-prophets-prophesy-falsely-and-my-people-love-to-have-it-so'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *because they received not the love of the truth, that they might be saved* (2 Thessalonians 2:10) — the root of Jeremiah 5:31''s horror: those who LOVE the lie do not love the truth.'
  FROM cross_reference_threads t
  JOIN _s309_jer05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=5 AND sv.verse_number=31
  JOIN _s309_jer05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-5-the-prophets-prophesy-falsely-and-my-people-love-to-have-it-so'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★ *Elohim (God) shall send them strong delusion, that they should believe a lie* (2 Thessalonians 2:11) — the answer to Jeremiah 5:31''s *what will ye do in the end thereof?*: given over to believe the falsehood they loved.'
  FROM cross_reference_threads t
  JOIN _s309_jer05_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=5 AND sv.verse_number=31
  JOIN _s309_jer05_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-5-the-prophets-prophesy-falsely-and-my-people-love-to-have-it-so'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_jeremiah_6.sql (Jeremiah 6) -----
-- Chapter: Jeremiah 6 — the SIEGE FROM THE NORTH and the covenant-lawsuit against Jerusalem. The Babylonian
-- foe drawn up at noon and by night; the city wholly oppression; the uncircumcised ear that cannot hearken;
-- and at the heart of it three framework-bearing words: ★★★ v.16 STAND YE IN THE WAYS... ASK FOR THE OLD
-- PATHS, WHERE IS THE GOOD WAY, AND WALK THEREIN, AND YE SHALL FIND REST FOR YOUR SOULS — the ancient Torah
-- way that gives rest, refused; ★★ vv.13-15 the false healers crying PEACE, PEACE, WHEN THERE IS NO PEACE;
-- ★ vv.19-20,30 the Torah REJECTED and the sacrifices UNACCEPTABLE — incense from Sheba unwanted, REPROBATE
-- SILVER, because Yahuah hath rejected them. The old/good way = the Torah, never abolished; the rest is in
-- walking it.
-- Tag: jer06   Temp view: _s309_jer06_lookup
-- Sort band: base 34125, step 3 -> threads at 34125, 34128, 34131 (3 threads)
-- Source of EVERY row: 'canon','jeremiah',6,v
--
-- Jeremiah 6 coverage:
--   v.1-8 (children of Benjamin flee out of Jerusalem; evil out of the north; prepare ye war against her,
--          arise and go up at noon; the city wholly oppression; be thou instructed, O Jerusalem)
--        NT:     none warranted (the imminent northern siege; woven in prose — the judgment v.16/v.19 answers)
--        Extras: none warranted
--        Tanakh: held in prose (the foe from the north = the Babylonian invader; the siege-frame of the chapter)
--   v.9-12 (throughly glean the remnant of Yashar'el as a vine; their ear is uncircumcised; the word of Yahuah
--          is unto them a reproach; the fury of Yahuah poured out)
--        NT:     none warranted (the uncircumcised ear / word-as-reproach; bound to the rejected-word THREAD 3
--                in prose — they have no delight in it answers v.19 they rejected it)
--        Extras: none warranted
--        Tanakh: held in prose — the uncircumcised, undelighting ear is the same refusal of v.16-17 and v.19
--   ★★ v.13-15 (from the least to the greatest every one given to covetousness; from the prophet to the priest
--          every one dealeth falsely; they have healed the hurt of the daughter of my people slightly, saying,
--          PEACE, PEACE; when there is no peace; were they ashamed? nay, they could not blush)
--        NT:     ★★ 1 Thessalonians 5:3 (when they shall say, Peace and safety; then sudden destruction cometh
--                upon them) — THREAD 2
--        Extras: none warranted
--        Tanakh: ★★ Ezekiel 13:10 (they have seduced my people, saying, Peace; and there was no peace —
--                lateral, the daubed wall), ★★ Ezekiel 13:16 (which see visions of peace for her, and there is
--                no peace), ★★ Jeremiah 8:11 (healed the hurt of the daughter of my people slightly, saying,
--                Peace, peace; when there is no peace — the SAME oracle repeated), ★ Micah 3:5 (the prophets
--                that make my people err... and cry, Peace) — THREAD 2
--   ★★★ v.16 (Stand ye in the ways, and see, and ask for the old paths, where is the good way, and walk
--          therein, and ye shall find rest for your souls. But they said, We will not walk therein)
--        NT:     ★★★ Matthew 11:29 (Take my yoke upon you... and ye shall find rest unto your souls — the
--                Messiah echoes Jeremiah's rest for your souls), ★★ Matthew 11:28 (Come unto me, all ye that
--                labour and are heavy laden, and I will give you rest) — THREAD 1
--        Extras: none warranted (clean canon weave; the old paths = the Torah, no extra forced)
--        Tanakh: ★★ Deuteronomy 32:7 (Remember the days of old, consider the years of many generations),
--                ★★ Isaiah 30:21 (thine ears shall hear a word behind thee, saying, This is the way, walk ye
--                in it), ★ Psalm 1:1-2 (walketh not in the counsel of the ungodly... his delight is in the law
--                of Yahuah) — THREAD 1
--   v.17 (Also I set watchmen over you, saying, Hearken to the sound of the trumpet. But they said, We will
--          not hearken) — the refused watchmen
--        NT:     none warranted     Extras: none warranted
--        Tanakh: held in prose (the second refusal, twin to We will not walk therein of v.16; bound to THREAD 1)
--   v.18-19 (hear, ye nations; behold, I will bring evil upon this people... because they have not hearkened
--          unto my words, nor to my law, but rejected it)
--        NT:     none warranted (the rejected-Torah verdict; held in canon-Tanakh THREAD 3)
--        Extras: none warranted
--        Tanakh: ★★ Proverbs 28:9 (he that turneth away his ear from hearing the law, even his prayer shall be
--                abomination) — THREAD 3
--   ★ v.20 (To what purpose cometh there to me incense from Sheba, and the sweet cane from a far country? your
--          burnt offerings are not acceptable, nor your sacrifices sweet unto me)
--        NT:     none warranted (the unacceptable-worship word answered fully within the Tanakh)
--        Extras: none warranted
--        Tanakh: ★★ 1 Samuel 15:22 (to obey is better than sacrifice, and to hearken than the fat of rams),
--                ★★ Isaiah 1:11 (To what purpose is the multitude of your sacrifices unto me?), ★ Jeremiah
--                7:21-22 (Put your burnt offerings unto your sacrifices... I spake not unto your fathers...
--                concerning burnt offerings, but Obey my voice) — THREAD 3
--   v.21-26 (I will lay stumblingblocks before this people; a people cometh from the north country; cruel,
--          have no mercy; gird thee with sackcloth, O daughter of my people; the spoiler shall suddenly come)
--        NT:     none warranted (the renewed siege-announcement; woven in prose, frames the rejected word)
--        Extras: none warranted
--        Tanakh: held in prose (the cruel northern people = the Babylonian executioner of the verdict)
--   ★ v.27-30 (I have set thee for a tower and a fortress... that thou mayest know and try their way; they are
--          brass and iron, all corrupters; the founder melteth in vain, the wicked are not plucked away;
--          REPROBATE SILVER shall men call them, because Yahuah hath rejected them)
--        NT:     none warranted (the assayer's verdict — refined dross that will not purify; held in Tanakh)
--        Extras: none warranted
--        Tanakh: ★ Isaiah 1:22 (Thy silver is become dross — lateral, the same assay-image) — THREAD 3;
--                ★ Isaiah 1:25 (purely purge away thy dross) noted in THREAD 3 prose
--
-- Threads (slug — target libraries):
--   1. jeremiah-6-ask-for-the-old-paths-the-good-way-rest-for-your-souls — NT (Matthew 11) + Tanakh (Deuteronomy 32, Isaiah 30, Psalm 1) [free]
--      (★★★ THE old paths = the ancient Torah way that gives rest, refused — answered forward by the Messiah's
--       yoke that gives rest unto the soul; the rest is in walking the way, not in leaving it)
--   2. jeremiah-6-peace-peace-when-there-is-no-peace-the-slight-healing — NT (1 Thessalonians 5) + Tanakh (Ezekiel 13, Jeremiah 8, Micah 3) [free]
--      (★★ the false healers who cry peace where there is none — the slight healing, the daubed wall, the
--       sudden destruction that overtakes the cry of Peace and safety)
--   3. jeremiah-6-they-have-rejected-my-law-the-reprobate-silver — Tanakh (Proverbs 28, 1 Samuel 15, Isaiah 1, Jeremiah 7) [free]
--      (★ the Torah rejected and the sacrifices unacceptable — ritual without obedience; the prayer turned
--       abomination; to obey better than sacrifice; the reprobate silver Yahuah hath rejected)
--
-- Framing notes:
--   ★★★ THE OLD PATHS (THREAD 1): *Thus saith Yahuah (LORD), Stand ye in the ways, and see, and ask for the
--      old paths, where is the good way, and walk therein, and ye shall find rest for your souls. But they
--      said, We will not walk therein* (6:16). The OLD PATHS / the GOOD WAY are the ancient Torah way — the
--      instruction given to the fathers, the road that gives rest to the soul. It is not an outworn path to be
--      abandoned; it is the very thing to ask for, find, and WALK IN. The rest is IN the walking. The Messiah
--      takes up Jeremiah's exact words: *Come unto me, all ye that labour and are heavy laden, and I will give
--      you rest. Take my yoke upon you, and learn of me... and ye shall find rest unto your souls* (Matt
--      11:28-29) — *rest unto your souls* answers *rest for your souls*; his yoke is not the abolition of the
--      old path but the good way walked in him. Moses: *Remember the days of old, consider the years of many
--      generations* (Deut 32:7). Isaiah: *thine ears shall hear a word behind thee, saying, This is the way,
--      walk ye in it* (Isa 30:21). The psalm sets the two ways: *Blessed is the man that walketh not in the
--      counsel of the ungodly... But his delight is in the law of Yahuah (LORD)* (Ps 1:1-2). The old/good way
--      is the Torah, never abolished — refused here, *We will not walk therein*, and refused again at the
--      watchmen, *We will not hearken* (6:17).
--   ★★ PEACE, PEACE (THREAD 2): *from the prophet even unto the priest every one dealeth falsely. They have
--      healed also the hurt of the daughter of my people slightly, saying, Peace, peace; when there is no
--      peace* (6:13-14). The false healers cry peace over a wound they will not truly bind. Ezekiel names the
--      same seduction and the daubed wall: *they have seduced my people, saying, Peace; and there was no
--      peace; and one built up a wall, and, lo, others daubed it with untempered morter* (Ezek 13:10), *which
--      see visions of peace for her, and there is no peace* (Ezek 13:16). Jeremiah himself repeats the oracle
--      word for word two chapters on: *they have healed the hurt of the daughter of my people slightly,
--      saying, Peace, peace; when there is no peace* (Jer 8:11). Micah: *the prophets that make my people
--      err... and cry, Peace* (Micah 3:5). And Paul carries the false cry to the end: *when they shall say,
--      Peace and safety; then sudden destruction cometh upon them... and they shall not escape* (1 Thess 5:3).
--      The slight healing, the false peace, the sudden ruin.
--   ★ THE REJECTED LAW / REPROBATE SILVER (THREAD 3): *I will bring evil upon this people, even the fruit of
--      their thoughts, because they have not hearkened unto my words, nor to my law, but rejected it. To what
--      purpose cometh there to me incense from Sheba... your burnt offerings are not acceptable, nor your
--      sacrifices sweet unto me* (6:19-20). The Torah rejected, the sacrifices made worthless — ritual without
--      obedience is no worship at all. Proverbs: *He that turneth away his ear from hearing the law, even his
--      prayer shall be abomination* (Prov 28:9). Samuel to Saul: *to obey is better than sacrifice, and to
--      hearken than the fat of rams* (1 Sam 15:22). Isaiah: *To what purpose is the multitude of your
--      sacrifices unto me?* (Isa 1:11). Jeremiah at the temple gate: *Put your burnt offerings unto your
--      sacrifices, and eat flesh. For I spake not unto your fathers... concerning burnt offerings or
--      sacrifices: But this thing commanded I them, saying, Obey my voice* (Jer 7:21-23). And the assayer's
--      verdict: *Reprobate silver shall men call them, because Yahuah (LORD) hath rejected them* (6:30) — the
--      refining fails, the dross will not purge; *Thy silver is become dross* (Isa 1:22). The rejected word and
--      the worthless worship are one thing: they would not obey, so the sacrifice is rejected with them.
--   VERSES WITH NO SEPARATE ADD: v.1-8 (the foe from the north, the siege at noon and by night — the historical
--      judgment the chapter announces; woven in prose), v.9-12 (the uncircumcised ear, the word-as-reproach —
--      the same refusal as v.16/v.19, bound to THREADs 1 and 3 in prose), v.17 (the refused watchmen — twin to
--      We will not walk therein, THREAD 1 prose), v.21-26 (the renewed siege-announcement, the cruel northern
--      people — the executioner of the verdict, woven in prose), v.27-29 (the founder's failed refining — the
--      assay-image that culminates in the reprobate-silver verdict of v.30, THREAD 3). Every meaningful block
--      recorded; each is carried by or bound to a thread.

CREATE TEMP VIEW _s309_jer06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★★): ask for the old paths, the good way, and ye shall find rest for your souls
    ('canon','jeremiah',6,16,'canon','matthew',11,29,'free',
      E'*Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls* (Matthew 11:29). The Messiah takes up Jeremiah''s exact promise — *ask for the old paths, where is the good way, and walk therein, and ye shall find rest for your souls* (Jeremiah 6:16): his *rest unto your souls* is the very rest of the old paths. The yoke he gives is not the abolition of the ancient way but the good way walked in him; the rest is found, as Jeremiah said, in walking therein.'),
    ('canon','jeremiah',6,16,'canon','matthew',11,28,'free',
      E'*Come unto me, all ye that labour and are heavy laden, and I will give you rest* (Matthew 11:28). To the heavy-laden the Messiah offers the rest Jeremiah held out and the people refused — *and ye shall find rest for your souls. But they said, We will not walk therein* (Jeremiah 6:16). The rest the old paths promised, refused by that generation, is given to all who come; *for my yoke is easy, and my burden is light* (Matthew 11:30).'),
    ('canon','jeremiah',6,16,'canon','deuteronomy',32,7,'free',
      E'*Remember the days of old, consider the years of many generations: ask thy father, and he will shew thee; thy elders, and they will tell thee* (Deuteronomy 32:7). Moses commands exactly what Jeremiah commands — to look back to the ancient way and ask after it: *ask for the old paths, where is the good way* (Jeremiah 6:16). The old paths are not lost; they are remembered, asked for, and handed down from the fathers — the Torah way the generation of Jeremiah would not walk.'),
    ('canon','jeremiah',6,16,'canon','isaiah',30,21,'free',
      E'*And thine ears shall hear a word behind thee, saying, This is the way, walk ye in it, when ye turn to the right hand, and when ye turn to the left* (Isaiah 30:21). Isaiah names the very good way Jeremiah bids the people ask for — *where is the good way, and walk therein* (Jeremiah 6:16). There is one way to walk, marked out and spoken; the prophets do not invent a new path but point back to the old, good road of the Torah.'),
    ('canon','jeremiah',6,16,'canon','psalms',1,1,'free',
      E'*Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful. But his delight is in the law of Yahuah (LORD)* (Psalm 1:1-2). The psalm sets the two ways before the man who would *stand... in the ways, and see* (Jeremiah 6:16): the way of sinners that perishes, and the good way whose blessing is the *delight... in the law of Yahuah (LORD)*. The old/good way Jeremiah commends is the way of the man whose delight is the Torah.'),

    -- THREAD 2 (★★): Peace, peace; when there is no peace — the false healers, the slight healing
    ('canon','jeremiah',6,14,'canon','ezekiel',13,10,'free',
      E'*Because, even because they have seduced my people, saying, Peace; and there was no peace; and one built up a wall, and, lo, others daubed it with untempered morter* (Ezekiel 13:10). Ezekiel names the same false cry Jeremiah exposes — *saying, Peace, peace; when there is no peace* (Jeremiah 6:14): the prophets seduce the people with a word of peace and daub a doomed wall to hide its cracks. The slight healing of Jeremiah is Ezekiel''s untempered morter — a covering that cannot hold.'),
    ('canon','jeremiah',6,14,'canon','ezekiel',13,16,'free',
      E'*To wit, the prophets of Yashar''el (Israel) which prophesy concerning Jerusalem, and which see visions of peace for her, and there is no peace, saith Adonai Yahuah (the Lord GOD)* (Ezekiel 13:16). The false prophets *see visions of peace for her, and there is no peace* — Jeremiah''s very verdict, *Peace, peace; when there is no peace* (Jeremiah 6:14). The vision of peace over a city under judgment is a lie that leaves the wound unhealed.'),
    ('canon','jeremiah',6,14,'canon','jeremiah',8,11,'free',
      E'*For they have healed the hurt of the daughter of my people slightly, saying, Peace, peace; when there is no peace* (Jeremiah 8:11). Jeremiah repeats the oracle word for word two chapters on: the same *healed... the hurt of the daughter of my people slightly, saying, Peace, peace; when there is no peace* (Jeremiah 6:14). The doubled word is the doubled charge — the false healers persist, and the slight healing is named again over the unrepentant people.'),
    ('canon','jeremiah',6,14,'canon','micah',3,5,'free',
      E'*Thus saith Yahuah (LORD) concerning the prophets that make my people err, that bite with their teeth, and cry, Peace; and he that putteth not into their mouths, they even prepare war against him* (Micah 3:5). Micah indicts the same hireling prophets Jeremiah exposes — those who *cry, Peace* to whoever feeds them, *saying, Peace, peace; when there is no peace* (Jeremiah 6:14). The peace they preach is for hire, not from Yahuah; it makes the people err.'),
    ('canon','jeremiah',6,14,'canon','1-thessalonians',5,3,'free',
      E'*For when they shall say, Peace and safety; then sudden destruction cometh upon them, as travail upon a woman with child; and they shall not escape* (1 Thessalonians 5:3). Paul carries the false cry to the day of Yahuah: the very word *Peace, peace; when there is no peace* (Jeremiah 6:14) becomes *Peace and safety*, and the sudden destruction overtakes those who trusted it. The slight healing ends in the ruin it could not prevent; *they shall not escape*.'),

    -- THREAD 3 (★): they have rejected my law; your sacrifices not acceptable; reprobate silver
    ('canon','jeremiah',6,19,'canon','proverbs',28,9,'free',
      E'*He that turneth away his ear from hearing the law, even his prayer shall be abomination* (Proverbs 28:9). Proverbs names the principle of Jeremiah''s verdict — *because they have not hearkened unto my words, nor to my law, but rejected it* (Jeremiah 6:19): the ear turned from the Torah makes even worship abominable. So the incense and burnt offerings of the next verse are rejected with the law they would not hear.'),
    ('canon','jeremiah',6,20,'canon','1-samuel',15,22,'free',
      E'*And Samuel said, Hath Yahuah (LORD) as great delight in burnt offerings and sacrifices, as in obeying the voice of Yahuah (LORD)? Behold, to obey is better than sacrifice, and to hearken than the fat of rams* (1 Samuel 15:22). Samuel teaches what Jeremiah enacts — *your burnt offerings are not acceptable, nor your sacrifices sweet unto me* (Jeremiah 6:20): where there is no obedience, the sacrifice is rejected. *To obey is better than sacrifice*; the incense from Sheba cannot buy back the rejected word.'),
    ('canon','jeremiah',6,20,'canon','isaiah',1,11,'free',
      E'*To what purpose is the multitude of your sacrifices unto me? saith Yahuah (LORD): I am full of the burnt offerings of rams, and the fat of fed beasts; and I delight not in the blood of bullocks, or of lambs, or of he goats* (Isaiah 1:11). Isaiah asks Jeremiah''s very question — *To what purpose cometh there to me incense from Sheba... your burnt offerings are not acceptable* (Jeremiah 6:20). The sacrifices of a disobedient people are no pleasure to Yahuah; the ritual without the obedient walk is rejected.'),
    ('canon','jeremiah',6,20,'canon','jeremiah',7,21,'free',
      E'*Thus saith Yahuah Tseva''ot (LORD of hosts), the Elohim (God) of Yashar''el (Israel); Put your burnt offerings unto your sacrifices, and eat flesh. For I spake not unto your fathers... concerning burnt offerings or sacrifices: But this thing commanded I them, saying, Obey my voice* (Jeremiah 7:21-23). At the temple gate Jeremiah says plainly what 6:20 implies — the burnt offerings are nothing without the obedience Yahuah first required: *Obey my voice, and I will be your Elohim (God)*. Worship that refuses the voice is the *burnt offerings... not acceptable* of this chapter.'),
    ('canon','jeremiah',6,30,'canon','isaiah',1,22,'free',
      E'*Thy silver is become dross, thy wine mixed with water* (Isaiah 1:22). Isaiah names the same assay-verdict as Jeremiah''s — *Reprobate silver shall men call them, because Yahuah (LORD) hath rejected them* (Jeremiah 6:30): the people, tried in the fire, come out as worthless dross, not refined silver. Yet Isaiah holds out the purging Jeremiah''s founder could not accomplish — *I will... purely purge away thy dross* (Isaiah 1:25) — by Yahuah''s own hand.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s309_jer06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s309_jer06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-6-ask-for-the-old-paths-the-good-way-rest-for-your-souls',
       E'Ask for the old paths, where is the good way — and ye shall find rest for your souls',
       E'At the heart of the lawsuit comes the great summons: *Thus saith Yahuah (LORD), Stand ye in the ways, and see, and ask for the old paths, where is the good way, and walk therein, and ye shall find rest for your souls. But they said, We will not walk therein* (6:16). The OLD PATHS and the GOOD WAY are the ancient Torah way — the instruction given to the fathers, the road that gives rest to the soul. Mark that it is not an outworn path to be left behind: it is the very thing to STAND and ask for, to FIND, and to WALK IN. The rest is IN the walking. And mark the refusal — *But they said, We will not walk therein* — repeated at once when the watchmen sound the trumpet: *But they said, We will not hearken* (6:17). The Messiah takes up Jeremiah''s words exactly: *Come unto me, all ye that labour and are heavy laden, and I will give you rest. Take my yoke upon you, and learn of me; for I am meek and lowly in heart: and ye shall find rest unto your souls* (Matthew 11:28-29). His *rest unto your souls* is the very rest of the old paths — *rest for your souls* — and his yoke is not the abolition of the ancient way but the good way walked in him: *for my yoke is easy, and my burden is light* (Matthew 11:30). Moses commands the same backward look: *Remember the days of old, consider the years of many generations: ask thy father, and he will shew thee* (Deuteronomy 32:7). Isaiah names the one road: *thine ears shall hear a word behind thee, saying, This is the way, walk ye in it* (Isaiah 30:21). And the psalm sets the two ways before the man who would stand in them: *Blessed is the man that walketh not in the counsel of the ungodly... But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night* (Psalm 1:1-2). The old/good way is the Torah, never abolished — and the rest is found, as Jeremiah said, in walking therein.',
       sv.verse_id, ev.verse_id, 'free', 34125
  FROM _s309_jer06_lookup sv, _s309_jer06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=6 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=6 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-6-peace-peace-when-there-is-no-peace-the-slight-healing',
       E'Peace, peace; when there is no peace — the false healers, the slight healing',
       E'The corruption runs top to bottom — *from the least of them even unto the greatest of them every one is given to covetousness; and from the prophet even unto the priest every one dealeth falsely* (6:13) — and it shows most plainly in the false healers: *They have healed also the hurt of the daughter of my people slightly, saying, Peace, peace; when there is no peace* (6:14). They cry peace over a wound they will not truly bind, and they cannot even blush for it (6:15). Ezekiel names the same seduction and the doomed, daubed wall: *they have seduced my people, saying, Peace; and there was no peace; and one built up a wall, and, lo, others daubed it with untempered morter* (Ezekiel 13:10); *which see visions of peace for her, and there is no peace, saith Adonai Yahuah (the Lord GOD)* (Ezekiel 13:16). Jeremiah himself repeats the oracle word for word two chapters on: *they have healed the hurt of the daughter of my people slightly, saying, Peace, peace; when there is no peace* (Jeremiah 8:11) — the doubled word, the doubled charge. Micah indicts the hireling prophets who cry peace for pay: *the prophets that make my people err, that bite with their teeth, and cry, Peace* (Micah 3:5). And Paul carries the false cry to the end of the age: *For when they shall say, Peace and safety; then sudden destruction cometh upon them, as travail upon a woman with child; and they shall not escape* (1 Thessalonians 5:3). The slight healing, the daubed wall, the vision of peace — all end in the ruin they could not prevent. The wound the false prophets covered over is healed only when the people return to the old paths they refused.',
       sv.verse_id, ev.verse_id, 'free', 34128
  FROM _s309_jer06_lookup sv, _s309_jer06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=6 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=6 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'jeremiah-6-they-have-rejected-my-law-the-reprobate-silver',
       E'They have rejected my law — your sacrifices not acceptable, the reprobate silver',
       E'The verdict names the root sin: *Behold, I will bring evil upon this people, even the fruit of their thoughts, because they have not hearkened unto my words, nor to my law, but rejected it* (6:19). And because the Torah is rejected, the worship is rejected with it: *To what purpose cometh there to me incense from Sheba, and the sweet cane from a far country? your burnt offerings are not acceptable, nor your sacrifices sweet unto me* (6:20). Ritual without obedience is no worship at all. Proverbs states the principle plainly: *He that turneth away his ear from hearing the law, even his prayer shall be abomination* (Proverbs 28:9) — the ear turned from the Torah turns even prayer into abomination. Samuel taught it to Saul over the spared spoil of Amalek: *Hath Yahuah (LORD) as great delight in burnt offerings and sacrifices, as in obeying the voice of Yahuah (LORD)? Behold, to obey is better than sacrifice, and to hearken than the fat of rams* (1 Samuel 15:22). Isaiah asks Jeremiah''s very question of a disobedient people: *To what purpose is the multitude of your sacrifices unto me?... I delight not in the blood of bullocks, or of lambs, or of he goats* (Isaiah 1:11). And Jeremiah himself, standing in the temple gate, says it without veil: *Put your burnt offerings unto your sacrifices, and eat flesh. For I spake not unto your fathers... concerning burnt offerings or sacrifices: But this thing commanded I them, saying, Obey my voice, and I will be your Elohim (God)* (Jeremiah 7:21-23). The whole assay ends in the founder''s failed refining and the assayer''s verdict: *The bellows are burned, the lead is consumed of the fire; the founder melteth in vain: for the wicked are not plucked away. Reprobate silver shall men call them, because Yahuah (LORD) hath rejected them* (6:29-30). Isaiah names the same dross: *Thy silver is become dross, thy wine mixed with water* (Isaiah 1:22) — yet holds out the purging Jeremiah''s furnace could not give: *I will... purely purge away thy dross* (Isaiah 1:25). The rejected word and the worthless worship are one: where the law is refused, the sacrifice is reprobate silver.',
       sv.verse_id, ev.verse_id, 'free', 34131
  FROM _s309_jer06_lookup sv, _s309_jer06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=6 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='jeremiah' AND ev.chapter_number=6 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *Take my yoke upon you, and learn of me... and ye shall find rest unto your souls* (Matthew 11:29) — the Messiah echoes Jeremiah 6:16''s *rest for your souls*; the rest is the old, good way walked in him.'
  FROM cross_reference_threads t
  JOIN _s309_jer06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=6 AND sv.verse_number=16
  JOIN _s309_jer06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=11 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-6-ask-for-the-old-paths-the-good-way-rest-for-your-souls'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *Come unto me, all ye that labour and are heavy laden, and I will give you rest* (Matthew 11:28) — the rest the old paths promised, refused by that generation, given now to all who come.'
  FROM cross_reference_threads t
  JOIN _s309_jer06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=6 AND sv.verse_number=16
  JOIN _s309_jer06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=11 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-6-ask-for-the-old-paths-the-good-way-rest-for-your-souls'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *Remember the days of old, consider the years of many generations: ask thy father, and he will shew thee* (Deuteronomy 32:7) — Moses bids the same backward look Jeremiah 6:16 commands; the old paths are remembered, not abandoned.'
  FROM cross_reference_threads t
  JOIN _s309_jer06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=6 AND sv.verse_number=16
  JOIN _s309_jer06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-6-ask-for-the-old-paths-the-good-way-rest-for-your-souls'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★★ *thine ears shall hear a word behind thee, saying, This is the way, walk ye in it* (Isaiah 30:21) — Isaiah names the one good way Jeremiah 6:16 bids the people ask for; the prophets point back to the old road.'
  FROM cross_reference_threads t
  JOIN _s309_jer06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=6 AND sv.verse_number=16
  JOIN _s309_jer06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=30 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-6-ask-for-the-old-paths-the-good-way-rest-for-your-souls'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night* (Psalm 1:1-2) — the good way Jeremiah 6:16 commends is the way of the man whose delight is the Torah.'
  FROM cross_reference_threads t
  JOIN _s309_jer06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=6 AND sv.verse_number=16
  JOIN _s309_jer06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-6-ask-for-the-old-paths-the-good-way-rest-for-your-souls'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *they have seduced my people, saying, Peace; and there was no peace... daubed it with untempered morter* (Ezekiel 13:10) — the slight healing of Jeremiah 6:14 is Ezekiel''s daubed wall, a covering that cannot hold.'
  FROM cross_reference_threads t
  JOIN _s309_jer06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=6 AND sv.verse_number=14
  JOIN _s309_jer06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=13 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-6-peace-peace-when-there-is-no-peace-the-slight-healing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *which see visions of peace for her, and there is no peace* (Ezekiel 13:16) — the prophets'' vision of peace over a doomed city is Jeremiah 6:14''s very lie.'
  FROM cross_reference_threads t
  JOIN _s309_jer06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=6 AND sv.verse_number=14
  JOIN _s309_jer06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=13 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-6-peace-peace-when-there-is-no-peace-the-slight-healing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *they have healed the hurt of the daughter of my people slightly, saying, Peace, peace; when there is no peace* (Jeremiah 8:11) — the SAME oracle repeated word for word; the doubled charge.'
  FROM cross_reference_threads t
  JOIN _s309_jer06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=6 AND sv.verse_number=14
  JOIN _s309_jer06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=8 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-6-peace-peace-when-there-is-no-peace-the-slight-healing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *the prophets that make my people err... and cry, Peace* (Micah 3:5) — the hireling prophets who cry peace for pay, the same false cry as Jeremiah 6:14.'
  FROM cross_reference_threads t
  JOIN _s309_jer06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=6 AND sv.verse_number=14
  JOIN _s309_jer06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=3 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-6-peace-peace-when-there-is-no-peace-the-slight-healing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *when they shall say, Peace and safety; then sudden destruction cometh upon them... and they shall not escape* (1 Thessalonians 5:3) — the false cry of Jeremiah 6:14 carried to the day of Yahuah; the slight healing ends in ruin.'
  FROM cross_reference_threads t
  JOIN _s309_jer06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=6 AND sv.verse_number=14
  JOIN _s309_jer06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=5 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-6-peace-peace-when-there-is-no-peace-the-slight-healing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *He that turneth away his ear from hearing the law, even his prayer shall be abomination* (Proverbs 28:9) — the ear turned from the Torah (Jeremiah 6:19) makes even worship abominable; so the sacrifices are rejected with the law.'
  FROM cross_reference_threads t
  JOIN _s309_jer06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=6 AND sv.verse_number=19
  JOIN _s309_jer06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=28 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-6-they-have-rejected-my-law-the-reprobate-silver'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *to obey is better than sacrifice, and to hearken than the fat of rams* (1 Samuel 15:22) — Samuel''s word to Saul: where there is no obedience, the sacrifice is rejected, as in Jeremiah 6:20.'
  FROM cross_reference_threads t
  JOIN _s309_jer06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=6 AND sv.verse_number=20
  JOIN _s309_jer06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-samuel' AND tv.chapter_number=15 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-6-they-have-rejected-my-law-the-reprobate-silver'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *To what purpose is the multitude of your sacrifices unto me?* (Isaiah 1:11) — Isaiah asks Jeremiah 6:20''s very question; the sacrifices of a disobedient people are no pleasure to Yahuah.'
  FROM cross_reference_threads t
  JOIN _s309_jer06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=6 AND sv.verse_number=20
  JOIN _s309_jer06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-6-they-have-rejected-my-law-the-reprobate-silver'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *I spake not unto your fathers... concerning burnt offerings... But... Obey my voice* (Jeremiah 7:21-22) — Jeremiah at the temple gate says plainly what 6:20 implies: worship without obedience is unacceptable.'
  FROM cross_reference_threads t
  JOIN _s309_jer06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=6 AND sv.verse_number=20
  JOIN _s309_jer06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=7 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-6-they-have-rejected-my-law-the-reprobate-silver'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *Thy silver is become dross, thy wine mixed with water* (Isaiah 1:22) — the same assay-verdict as the *reprobate silver* of Jeremiah 6:30; yet Isaiah holds out the purging Yahuah himself gives (Isaiah 1:25).'
  FROM cross_reference_threads t
  JOIN _s309_jer06_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='jeremiah' AND sv.chapter_number=6 AND sv.verse_number=30
  JOIN _s309_jer06_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='jeremiah-6-they-have-rejected-my-law-the-reprobate-silver'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session309 — Jeremiah cross-references complete.'
