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


COMMIT;
\echo 'session309 — Jeremiah cross-references complete.'
