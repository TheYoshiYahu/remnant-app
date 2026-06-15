-- ----- fragment: minion_psalms_82.sql (Psalm 82) -----
-- Chapter: Psalm 82 — ASAPH''S DIVINE-COUNCIL JUDGMENT PSALM (8 verses), a KEYSTONE. Elohim stands in
-- the congregation of the mighty and judges among the "gods" (v.1) — the appointed judges and rulers of
-- Yashar''el (Israel) who bear delegated authority and the very word of Elohim. The charge is the Torah''s
-- charge of just judgment: *defend the poor and fatherless... deliver the needy* (vv.2-4). The judges have
-- failed — *they know not, neither will they understand; they walk on in darkness* (v.5) — and so the
-- verdict falls upon them: *I have said, Ye are gods... But ye shall die like men (Adam)* (vv.6-7). The
-- Formed Son takes up v.6 BY NAME in John 10:34-36 to defend His Sonship from "your law" = the Tanakh
-- BINDING — He distinguishes the delegated "gods" (unto whom the word of Elohim came) from Himself, the
-- One whom the Father sanctified and sent. Frame carefully: these elohim are HUMAN judges wielding
-- Yahuah''s judgment, NOT co-equal deities and NOT the watchers — sons of Adam, mortal, to be judged.
-- The psalm ends on the cry for the appointed day: *Arise, O Elohim, judge the earth: for thou shalt
-- inherit all nations* (v.8) — the ingathering of the nations WITH Yashar''el under the true Judge.
-- Tag: ps082   Temp view: _s302_ps082_lookup   sort_order band: 24025 step +3
--
-- Psalm 82 coverage:
--   ★★ v.1 (Elohim standeth in the congregation of the mighty; he judgeth among the gods)
--        NT:     none warranted (the council/elohim is held to THREAD 4 with John 10:34-36 on vv.6-7)
--        Extras: ★ Wisdom of Solomon 6:3-4 (power is given you of God... ministers of his kingdom, you
--                have not judged aright, nor kept the law) — THREAD 1
--        Tanakh: ★ Exodus 21:6 / Exodus 22:9 (the judges = ha-elohim), Deuteronomy 1:17 (the judgment is
--                Elohim''s), Psalm 58:1 (do ye judge uprightly, O ye sons of men) — THREAD 1
--   ★★ vv.2-4 (How long will ye judge unjustly... Defend the poor and fatherless... Deliver the needy)
--        NT:     ★ James 1:27 (pure religion: to visit the fatherless and widows in their affliction) — THREAD 2
--        Extras: none warranted (the council-judgment extras fit is spent at Wisdom 6 in THREAD 1)
--        Tanakh: ★★ Leviticus 19:15 (in righteousness shalt thou judge), Deuteronomy 24:17 (pervert not the
--                judgment of the fatherless), Isaiah 1:17 (judge the fatherless, plead for the widow),
--                Proverbs 31:9 (judge righteously, plead the cause of the poor and needy) — THREAD 2
--   ★ v.5 (They know not, neither will they understand; they walk on in darkness: all the foundations of
--          the earth are out of course)
--        NT:     ★ John 1:5 (the light shineth in darkness; and the darkness comprehended it not) — THREAD 3
--        Extras: none warranted
--        Tanakh: ★ Proverbs 4:19 (the way of the wicked is as darkness), Psalm 11:3 (if the foundations be
--                destroyed), Isaiah 24:5 (transgressed the laws... broken the everlasting covenant) — THREAD 3
--   ★★★ vv.6-7 (I have said, Ye are gods... But ye shall die like men, and fall like one of the princes)
--        NT:     ★★★ John 10:34 (Is it not written in your law, I said, Ye are gods?), John 10:35 (unto whom
--                the word of Elohim came; and the scripture cannot be broken), John 10:36 (whom the Father
--                hath sanctified, and sent) — THE KEYSTONE — THREAD 4
--        Extras: none warranted (the elohim here are HUMAN judges, NOT the watchers; no clean 1 Enoch fit)
--        Tanakh: ★ Psalm 49:12 (man being in honour abideth not), Genesis 3:19 (dust thou art, and unto
--                dust shalt thou return) — son-of-Adam mortality — THREAD 4
--   ★ v.8 (Arise, O Elohim, judge the earth: for thou shalt inherit all nations)
--        NT:     ★ Revelation 11:15 (the kingdoms of this world are become the kingdoms of our Lord, and
--                of his Messiah), Acts 17:31 (he hath appointed a day, in the which he will judge the
--                world in righteousness by that man whom he hath ordained) — THREAD 5
--        Extras: none warranted
--        Tanakh: ★ Psalm 2:8 (Ask of me, and I shall give thee the heathen for thine inheritance), Isaiah
--                11:4 (with righteousness shall he judge the poor) — THREAD 5
--
-- Threads (5): all five canon-Tanakh source-anchored in Psalm 82.
--   1. psalm-82-elohim-judgeth-among-the-gods-the-divine-council  [Tanakh + extras(Wisdom)]  — tier extras
--   2. psalm-82-defend-the-poor-and-fatherless-do-justice  [Tanakh + NT]  — tier free
--   3. psalm-82-they-walk-on-in-darkness-the-foundations-out-of-course  [Tanakh + NT]  — tier free
--   4. psalm-82-ye-are-gods-but-ye-shall-die-like-men  [Tanakh + NT, KEYSTONE John 10:34-36]  — tier free
--   5. psalm-82-arise-o-elohim-judge-the-earth-inherit-all-nations  [Tanakh + NT]  — tier free

CREATE TEMP VIEW _s302_ps082_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): Elohim judgeth among the gods — the divine council / appointed judges
    ('canon','psalms',82,1,'canon','exodus',22,9,'free',
      E'*For all manner of trespass, whether it be for ox, for ass, for sheep, for raiment, or for any manner of lost thing, which another challengeth to be his, the cause of both parties shall come before the judges; and whom the judges shall condemn, he shall pay double unto his neighbour* (Exodus 22:9). *Elohim (God) standeth in the congregation of the mighty; he judgeth among the gods* (Psalm 82:1): the "judges" of the Torah are ha-elohim — the appointed men before whom the cause is brought; the psalm names them "gods" because they wield the very judgment of Elohim, yet Elohim stands over them to judge.'),
    ('canon','psalms',82,1,'canon','exodus',21,6,'free',
      E'*Then his master shall bring him unto the judges; he shall also bring him to the door, or unto the door post; and his master shall bore his ear through with an aul; and he shall serve him for ever* (Exodus 21:6). *Elohim (God) standeth in the congregation of the mighty; he judgeth among the gods* (Psalm 82:1): the servant is brought "unto the judges" — ha-elohim — the appointed bench that bears Yahuah''s authority; the "gods" of the psalm are these covenant judges, men entrusted with the divine verdict.'),
    ('canon','psalms',82,1,'canon','deuteronomy',1,17,'free',
      E'*Ye shall not respect persons in judgment; but ye shall hear the small as well as the great; ye shall not be afraid of the face of man; for the judgment is Elohim''s (God''s): and the cause that is too hard for you, bring it unto me, and I will hear it* (Deuteronomy 1:17). *Elohim (God) standeth in the congregation of the mighty; he judgeth among the gods* (Psalm 82:1): the judges are "gods" only because *the judgment is Elohim''s* — the authority is delegated, the verdict belongs to Yahuah; therefore they may not respect persons, for He stands among them.'),
    ('canon','psalms',82,1,'canon','psalms',58,1,'free',
      E'*Do ye indeed speak righteousness, O congregation? do ye judge uprightly, O ye sons of men?* (Psalm 58:1). *Elohim (God) standeth in the congregation of the mighty; he judgeth among the gods* (Psalm 82:1): the same indictment of the bench — the mighty "congregation" called to judge uprightly are *sons of men*, sons of Adam; they bear the title only by delegation and are themselves under judgment.'),
    ('canon','psalms',82,1,'apocrypha','the-wisdom-of-solomon',6,3,'extras',
      E'*For power is given you of Yahuah (God), and sovereignty from the Highest, who shall try your works, and search out your counsels* (Wisdom of Solomon 6:3). *Elohim (God) standeth in the congregation of the mighty; he judgeth among the gods* (Psalm 82:1): the restored wisdom names exactly what the psalm means — the rulers'' power is GIVEN of Yahuah and from El Elyon (the Highest); the authority is borrowed, and the Most High will try the works of those He set in high places.'),
    ('canon','psalms',82,2,'apocrypha','the-wisdom-of-solomon',6,4,'extras',
      E'*Because, being ministers of his kingdom, you have not judged aright, nor kept the law, nor walked after the counsel of Yahuah (God)* (Wisdom of Solomon 6:4). *How long will ye judge unjustly, and accept the persons of the wicked?* (Psalm 82:2): the same charge against the same office — ministers of His kingdom who have not judged aright nor kept the law; the unjust judgment of the psalm is the failure to keep the Torah''s charge, and judgment will fall on them for it.'),

    -- THREAD 2 (★★): Defend the poor and fatherless — do justice to the afflicted and needy
    ('canon','psalms',82,3,'canon','leviticus',19,15,'free',
      E'*Ye shall do no unrighteousness in judgment: thou shalt not respect the person of the poor, nor honour the person of the mighty: but in righteousness shalt thou judge thy neighbour* (Leviticus 19:15). *Defend the poor and fatherless: do justice to the afflicted and needy* (Psalm 82:3): the charge to the judges is the Torah''s own — no unrighteousness in judgment, no respecting of persons; the just defence of the poor is the standard the "gods" were given and broke.'),
    ('canon','psalms',82,3,'canon','deuteronomy',24,17,'free',
      E'*Thou shalt not pervert the judgment of the stranger, nor of the fatherless; nor take a widow''s raiment to pledge* (Deuteronomy 24:17). *Defend the poor and fatherless: do justice to the afflicted and needy* (Psalm 82:3): the Torah forbids the very perverting of judgment the psalm rebukes — the fatherless and the stranger are the test of a righteous bench; to pervert their cause is to fail the charge of Elohim.'),
    ('canon','psalms',82,3,'canon','isaiah',1,17,'free',
      E'*Learn to do well; seek judgment, relieve the oppressed, judge the fatherless, plead for the widow* (Isaiah 1:17). *Defend the poor and fatherless: do justice to the afflicted and needy* (Psalm 82:3): the prophet sounds the same charge — seek judgment, judge the fatherless, plead for the widow; the failed "gods" of the psalm are summoned back to the one standard of covenant justice.'),
    ('canon','psalms',82,4,'canon','proverbs',31,9,'free',
      E'*Open thy mouth, judge righteously, and plead the cause of the poor and needy* (Proverbs 31:9). *Deliver the poor and needy: rid them out of the hand of the wicked* (Psalm 82:4): the king''s charge in Proverbs is the judge''s charge in the psalm — to plead the cause of the poor and needy, to deliver them out of the hand of the wicked; righteous judgment is measured by the lowest it lifts.'),
    ('canon','psalms',82,3,'canon','james',1,27,'free',
      E'*Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction, and to keep himself unspotted from the world* (James 1:27). *Defend the poor and fatherless: do justice to the afflicted and needy* (Psalm 82:3): James names the same heart of the Torah — to visit the fatherless and widows in their affliction; the religion Elohim counts pure is the very justice the psalm requires of the judges, the unbroken thread from the bench of Yashar''el (Israel) to the apostolic charge.'),

    -- THREAD 3 (★): They walk on in darkness — all the foundations of the earth are out of course
    ('canon','psalms',82,5,'canon','proverbs',4,19,'free',
      E'*The way of the wicked is as darkness: they know not at what they stumble* (Proverbs 4:19). *They know not, neither will they understand; they walk on in darkness: all the foundations of the earth are out of course* (Psalm 82:5): the unjust judges walk the way of the wicked — *they know not at what they stumble* — a blindness that is not innocence but the darkness of those who refuse to understand.'),
    ('canon','psalms',82,5,'canon','psalms',11,3,'free',
      E'*If the foundations be destroyed, what can the righteous do?* (Psalm 11:3). *All the foundations of the earth are out of course* (Psalm 82:5): when the appointed judges pervert justice, the foundations themselves are shaken — the order Yahuah set in the earth is thrown out of course, and the righteous are left at the mercy of a corrupted bench.'),
    ('canon','psalms',82,5,'canon','isaiah',24,5,'free',
      E'*The earth also is defiled under the inhabitants thereof; because they have transgressed the laws, changed the ordinance, broken the everlasting covenant* (Isaiah 24:5). *They know not, neither will they understand; they walk on in darkness: all the foundations of the earth are out of course* (Psalm 82:5): the foundations go out of course when the laws are transgressed and the everlasting covenant broken; the darkness of the judges is the same Torah-breaking that defiles the whole earth.'),
    ('canon','psalms',82,5,'canon','john',1,5,'free',
      E'*And the light shineth in darkness; and the darkness comprehended it not* (John 1:5). *They know not, neither will they understand; they walk on in darkness* (Psalm 82:5): the darkness that *comprehended it not* is the same blindness the psalm names — those who will not understand though the light shines; the Formed Word came as the light, and the walkers-in-darkness did not lay hold of Him.'),

    -- THREAD 4 (★★★): I have said, Ye are gods — but ye shall die like men — JOHN 10:34-36 KEYSTONE
    ('canon','psalms',82,6,'canon','john',10,34,'free',
      E'*Yahusha (Jesus) answered them, Is it not written in your law, I said, Ye are gods?* (John 10:34). *I have said, Ye are gods; and all of you are children of the El Elyon (most High)* (Psalm 82:6): the Formed Son quotes this verse BY NAME — He calls the Tanakh *your law* = SCRIPTURE BINDING, and reasons from it. If the appointed judges of Yashar''el (Israel), to whom the word of Elohim came, could be called "gods" by delegated authority, the charge of blasphemy against the One the Father sent cannot stand.'),
    ('canon','psalms',82,6,'canon','john',10,35,'free',
      E'*If he called them gods, unto whom the word of Elohim (God) came, and the scripture cannot be broken* (John 10:35). *I have said, Ye are gods; and all of you are children of the El Elyon (most High)* (Psalm 82:6): the One the psalm calls "gods" are defined exactly — *they unto whom the word of Elohim came* — the judges entrusted with His verdict, not co-equal deities and not the watchers; and the Messiah seals the Tanakh''s authority: *the scripture cannot be broken*.'),
    ('canon','psalms',82,6,'canon','john',10,36,'free',
      E'*Say ye of him, whom the Father hath sanctified, and sent into the world, Thou blasphemest; because I said, I am the Son of Elohim (God)?* (John 10:36). *I have said, Ye are gods; and all of you are children of the El Elyon (most High)* (Psalm 82:6): the Formed Son sets Himself APART from the delegated "gods" — they bear the word that came TO them, but He is the One *whom the Father hath sanctified, and sent into the world*; the title borne by mortal judges by delegation is His by sending from the Father.'),
    ('canon','psalms',82,7,'canon','psalms',49,12,'free',
      E'*Nevertheless man being in honour abideth not: he is like the beasts that perish* (Psalm 49:12). *But ye shall die like men, and fall like one of the princes* (Psalm 82:7): the "gods" are sons of Adam — *man being in honour abideth not* — they hold the highest office yet die like men and fall like the princes; the title never made them immortal, and the verdict of the Most High falls on them as on all flesh.'),
    ('canon','psalms',82,7,'canon','genesis',3,19,'free',
      E'*In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return* (Genesis 3:19). *But ye shall die like men, and fall like one of the princes* (Psalm 82:7): the sentence on Adam is the sentence on the "gods" — *dust thou art, and unto dust shalt thou return*; whatever delegated honour they bore, they are sons of Adam under the same mortality, and so the elohim of the psalm are no co-equal deities but men appointed and judged.'),

    -- THREAD 5 (★): Arise, O Elohim, judge the earth — for thou shalt inherit all nations
    ('canon','psalms',82,8,'canon','psalms',2,8,'free',
      E'*Ask of me, and I shall give thee the heathen for thine inheritance, and the uttermost parts of the earth for thy possession* (Psalm 2:8). *Arise, O Elohim (God), judge the earth: for thou shalt inherit all nations* (Psalm 82:8): the cry for the appointed Judge to inherit all nations is the Father''s grant to the Son — the heathen for His inheritance, the ends of the earth for His possession; the failed judges are set aside for the true King who shall judge and inherit.'),
    ('canon','psalms',82,8,'canon','isaiah',11,4,'free',
      E'*But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked* (Isaiah 11:4). *Arise, O Elohim (God), judge the earth* (Psalm 82:8): where the appointed "gods" judged unjustly and would not defend the poor, the Branch judges the poor with righteousness and reproves with equity for the meek — the just judgment the bench failed to give, come in the One who rises to judge the earth.'),
    ('canon','psalms',82,8,'canon','acts',17,31,'free',
      E'*Because he hath appointed a day, in the which he will judge the world in righteousness by that man whom he hath ordained; whereof he hath given assurance unto all men, in that he hath raised him from the dead* (Acts 17:31). *Arise, O Elohim (God), judge the earth: for thou shalt inherit all nations* (Psalm 82:8): the cry is answered in the appointed day — Yahuah will judge the world in righteousness *by that man whom he hath ordained*, the Formed Son raised from the dead; the judgment of the earth and the inheritance of the nations meet in Him.'),
    ('canon','psalms',82,8,'canon','revelation',11,15,'free',
      E'*And the seventh angel sounded; and there were great voices in heaven, saying, The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15). *Arise, O Elohim (God), judge the earth: for thou shalt inherit all nations* (Psalm 82:8): the inheriting of all nations is consummated when the kingdoms of this world become the kingdom of our Lord and His Messiah — the nations gathered WITH Yashar''el (Israel) under the one reign, the prayer of the psalm made the song of heaven.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps082_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps082_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-82-elohim-judgeth-among-the-gods-the-divine-council',
       E'Elohim judgeth among the gods — the divine council of appointed judges',
       E'The psalm opens in the council of judgment: *Elohim (God) standeth in the congregation of the mighty; he judgeth among the gods* (Psalm 82:1). The "gods" are not rival deities and not the fallen watchers — they are the appointed judges and rulers of Yashar''el (Israel), the men the Torah calls ha-elohim because they wield Yahuah''s own verdict: *the cause of both parties shall come before the judges; and whom the judges shall condemn* (Exodus 22:9); *his master shall bring him unto the judges* (Exodus 21:6). Their title is wholly delegated: *the judgment is Elohim''s (God''s)* (Deuteronomy 1:17) — and so they may not respect persons, for He stands among them. The psalter sounds the same summons: *do ye judge uprightly, O ye sons of men?* (Psalm 58:1) — *sons of men*, sons of Adam, gods only by appointment. The restored wisdom says it plainly: *power is given you of Yahuah (God), and sovereignty from the Highest, who shall try your works* (Wisdom of Solomon 6:3); *being ministers of his kingdom, you have not judged aright, nor kept the law* (Wisdom of Solomon 6:4). The authority is borrowed, the law is the standard, and the Most High will try the bench He set up.',
       sv.verse_id, ev.verse_id, 'extras', 24025
  FROM _s302_ps082_lookup sv, _s302_ps082_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=82 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=82 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-82-defend-the-poor-and-fatherless-do-justice',
       E'Defend the poor and fatherless — the Torah''s charge of just judgment',
       E'The charge to the failed "gods" is the Torah''s own charge: *How long will ye judge unjustly, and accept the persons of the wicked?... Defend the poor and fatherless: do justice to the afflicted and needy. Deliver the poor and needy: rid them out of the hand of the wicked* (Psalm 82:2-4). This is the standard given at Sinai and pressed by every prophet: *Ye shall do no unrighteousness in judgment: thou shalt not respect the person of the poor, nor honour the person of the mighty* (Leviticus 19:15); *Thou shalt not pervert the judgment of the stranger, nor of the fatherless* (Deuteronomy 24:17); *seek judgment, relieve the oppressed, judge the fatherless, plead for the widow* (Isaiah 1:17); *Open thy mouth, judge righteously, and plead the cause of the poor and needy* (Proverbs 31:9). And the apostolic charge keeps the same thread unbroken: *Pure religion and undefiled before Elohim (God) and the Father is this, To visit the fatherless and widows in their affliction* (James 1:27). The religion Elohim counts pure is the very justice the psalm requires — measured by the lowest it lifts, the fatherless and the widow.',
       sv.verse_id, ev.verse_id, 'free', 24028
  FROM _s302_ps082_lookup sv, _s302_ps082_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=82 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=82 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-82-they-walk-on-in-darkness-the-foundations-out-of-course',
       E'They walk on in darkness — the foundations of the earth out of course',
       E'The verdict on the bench names the root of the failure: *They know not, neither will they understand; they walk on in darkness: all the foundations of the earth are out of course* (Psalm 82:5). This is no innocent blindness but the chosen darkness of the wicked: *The way of the wicked is as darkness: they know not at what they stumble* (Proverbs 4:19). When the appointed judges pervert justice the very order of creation is shaken: *If the foundations be destroyed, what can the righteous do?* (Psalm 11:3); and the foundations go out of course precisely where the covenant is broken: *the earth also is defiled under the inhabitants thereof; because they have transgressed the laws, changed the ordinance, broken the everlasting covenant* (Isaiah 24:5). The Formed Word came as the light into this very dark: *the light shineth in darkness; and the darkness comprehended it not* (John 1:5) — the same will-not-understand the psalm indicts.',
       sv.verse_id, ev.verse_id, 'free', 24031
  FROM _s302_ps082_lookup sv, _s302_ps082_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=82 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=82 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★★) — KEYSTONE
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-82-ye-are-gods-but-ye-shall-die-like-men',
       E'I have said, Ye are gods — but ye shall die like men (the Formed Son''s defence)',
       E'Here is the keystone: *I have said, Ye are gods; and all of you are children of the El Elyon (most High). But ye shall die like men, and fall like one of the princes* (Psalm 82:6-7). The Formed Son takes up this verse BY NAME to defend His Sonship: *Is it not written in your law, I said, Ye are gods?* (John 10:34) — He calls the Tanakh *your law*, SCRIPTURE BINDING, and reasons from it. He defines exactly who the "gods" are: *If he called them gods, unto whom the word of Elohim (God) came, and the scripture cannot be broken* (John 10:35) — the appointed judges of Yashar''el (Israel) entrusted with His word, called "gods" by delegation, NOT co-equal deities and NOT the watchers. And He sets Himself apart from them: *Say ye of him, whom the Father hath sanctified, and sent into the world, Thou blasphemest; because I said, I am the Son of Elohim (God)?* (John 10:36) — they bear the word that came TO them; He is the One the Father SENT. The "gods" remain sons of Adam, mortal: *man being in honour abideth not: he is like the beasts that perish* (Psalm 49:12); *dust thou art, and unto dust shalt thou return* (Genesis 3:19). They *shall die like men* and fall like the princes — delegated authority that the Most High will judge. This is not polytheism and not apotheosis; it is borrowed covenant-office under sentence.',
       sv.verse_id, ev.verse_id, 'free', 24034
  FROM _s302_ps082_lookup sv, _s302_ps082_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=82 AND sv.verse_number=6
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=82 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-82-arise-o-elohim-judge-the-earth-inherit-all-nations',
       E'Arise, O Elohim, judge the earth — for thou shalt inherit all nations',
       E'The psalm ends on the cry for the appointed day: *Arise, O Elohim (God), judge the earth: for thou shalt inherit all nations* (Psalm 82:8). Where the delegated "gods" judged unjustly and would not defend the poor, the prayer turns to the true Judge who will rise and inherit the nations — the Father''s grant to the Son: *Ask of me, and I shall give thee the heathen for thine inheritance, and the uttermost parts of the earth for thy possession* (Psalm 2:8). The just judgment the bench failed to give comes in the Branch: *with righteousness shall he judge the poor, and reprove with equity for the meek of the earth* (Isaiah 11:4). The appointed day is named in the apostolic witness: *he hath appointed a day, in the which he will judge the world in righteousness by that man whom he hath ordained... in that he hath raised him from the dead* (Acts 17:31). And the inheriting of all nations is consummated when *the kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15) — the nations gathered WITH Yashar''el (Israel) under the one reign, the cry of the psalm made the song of heaven.',
       sv.verse_id, ev.verse_id, 'free', 24037
  FROM _s302_ps082_lookup sv, _s302_ps082_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=82 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=82 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *whom the judges shall condemn, he shall pay double unto his neighbour* (Exodus 22:9) — the Torah''s "judges" are ha-elohim: the "gods" of 82:1 are these appointed men.'
  FROM cross_reference_threads t
  JOIN _s302_ps082_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=82 AND sv.verse_number=1
  JOIN _s302_ps082_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=22 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-82-elohim-judgeth-among-the-gods-the-divine-council'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*his master shall bring him unto the judges* (Exodus 21:6) — ha-elohim again, the appointed bench bearing Yahuah''s authority in 82:1.'
  FROM cross_reference_threads t
  JOIN _s302_ps082_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=82 AND sv.verse_number=1
  JOIN _s302_ps082_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=21 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-82-elohim-judgeth-among-the-gods-the-divine-council'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *the judgment is Elohim''s (God''s)* (Deuteronomy 1:17) — the judges are "gods" only by delegation; the verdict belongs to Yahuah who stands among them (82:1).'
  FROM cross_reference_threads t
  JOIN _s302_ps082_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=82 AND sv.verse_number=1
  JOIN _s302_ps082_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=1 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-82-elohim-judgeth-among-the-gods-the-divine-council'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*do ye judge uprightly, O ye sons of men?* (Psalm 58:1) — the bench is "sons of Adam," gods only by appointment, themselves under judgment (82:1).'
  FROM cross_reference_threads t
  JOIN _s302_ps082_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=82 AND sv.verse_number=1
  JOIN _s302_ps082_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=58 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-82-elohim-judgeth-among-the-gods-the-divine-council'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *power is given you of Yahuah (God), and sovereignty from the Highest, who shall try your works* (Wisdom of Solomon 6:3) — the rulers'' authority is borrowed from El Elyon, who tries them (82:1).'
  FROM cross_reference_threads t
  JOIN _s302_ps082_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=82 AND sv.verse_number=1
  JOIN _s302_ps082_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=6 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-82-elohim-judgeth-among-the-gods-the-divine-council'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*ministers of his kingdom, you have not judged aright, nor kept the law* (Wisdom of Solomon 6:4) — the unjust judgment of 82:2 is the failure to keep the Torah''s charge.'
  FROM cross_reference_threads t
  JOIN _s302_ps082_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=82 AND sv.verse_number=2
  JOIN _s302_ps082_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=6 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-82-elohim-judgeth-among-the-gods-the-divine-council'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *thou shalt not respect the person of the poor, nor honour the person of the mighty: but in righteousness shalt thou judge* (Leviticus 19:15) — the Torah''s standard the "gods" of 82:3 broke.'
  FROM cross_reference_threads t
  JOIN _s302_ps082_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=82 AND sv.verse_number=3
  JOIN _s302_ps082_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-82-defend-the-poor-and-fatherless-do-justice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Thou shalt not pervert the judgment of the stranger, nor of the fatherless* (Deuteronomy 24:17) — the very perverting of judgment 82:3 rebukes.'
  FROM cross_reference_threads t
  JOIN _s302_ps082_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=82 AND sv.verse_number=3
  JOIN _s302_ps082_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=24 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-82-defend-the-poor-and-fatherless-do-justice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*seek judgment, relieve the oppressed, judge the fatherless, plead for the widow* (Isaiah 1:17) — the prophet''s charge is the psalm''s charge (82:3).'
  FROM cross_reference_threads t
  JOIN _s302_ps082_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=82 AND sv.verse_number=3
  JOIN _s302_ps082_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=1 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-82-defend-the-poor-and-fatherless-do-justice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Open thy mouth, judge righteously, and plead the cause of the poor and needy* (Proverbs 31:9) — the king''s charge is the judge''s charge of 82:4.'
  FROM cross_reference_threads t
  JOIN _s302_ps082_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=82 AND sv.verse_number=4
  JOIN _s302_ps082_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=31 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-82-defend-the-poor-and-fatherless-do-justice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *Pure religion... is this, To visit the fatherless and widows in their affliction* (James 1:27) — the apostolic charge keeps the psalm''s thread unbroken (82:3).'
  FROM cross_reference_threads t
  JOIN _s302_ps082_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=82 AND sv.verse_number=3
  JOIN _s302_ps082_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-82-defend-the-poor-and-fatherless-do-justice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*The way of the wicked is as darkness: they know not at what they stumble* (Proverbs 4:19) — the chosen darkness of the judges who will not understand (82:5).'
  FROM cross_reference_threads t
  JOIN _s302_ps082_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=82 AND sv.verse_number=5
  JOIN _s302_ps082_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=4 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-82-they-walk-on-in-darkness-the-foundations-out-of-course'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*If the foundations be destroyed, what can the righteous do?* (Psalm 11:3) — when the bench is corrupt the foundations themselves are shaken (82:5).'
  FROM cross_reference_threads t
  JOIN _s302_ps082_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=82 AND sv.verse_number=5
  JOIN _s302_ps082_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=11 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-82-they-walk-on-in-darkness-the-foundations-out-of-course'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *they have transgressed the laws, changed the ordinance, broken the everlasting covenant* (Isaiah 24:5) — the foundations go out of course where Torah is broken (82:5).'
  FROM cross_reference_threads t
  JOIN _s302_ps082_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=82 AND sv.verse_number=5
  JOIN _s302_ps082_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=24 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-82-they-walk-on-in-darkness-the-foundations-out-of-course'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *the light shineth in darkness; and the darkness comprehended it not* (John 1:5) — the Formed Word came as the light into the same will-not-understand (82:5).'
  FROM cross_reference_threads t
  JOIN _s302_ps082_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=82 AND sv.verse_number=5
  JOIN _s302_ps082_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-82-they-walk-on-in-darkness-the-foundations-out-of-course'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★★) — KEYSTONE
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *Is it not written in your law, I said, Ye are gods?* (John 10:34) — the Formed Son quotes 82:6 BY NAME, calling the Tanakh "your law" = scripture binding.'
  FROM cross_reference_threads t
  JOIN _s302_ps082_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=82 AND sv.verse_number=6
  JOIN _s302_ps082_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=34
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-82-ye-are-gods-but-ye-shall-die-like-men'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *unto whom the word of Elohim (God) came, and the scripture cannot be broken* (John 10:35) — the "gods" are the judges entrusted with His word; the Tanakh stands unbreakable (82:6).'
  FROM cross_reference_threads t
  JOIN _s302_ps082_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=82 AND sv.verse_number=6
  JOIN _s302_ps082_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=35
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-82-ye-are-gods-but-ye-shall-die-like-men'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★★ *whom the Father hath sanctified, and sent into the world... I am the Son of Elohim (God)* (John 10:36) — the Formed Son set APART from the delegated "gods": they bear the word, He is the One the Father SENT (82:6).'
  FROM cross_reference_threads t
  JOIN _s302_ps082_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=82 AND sv.verse_number=6
  JOIN _s302_ps082_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=36
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-82-ye-are-gods-but-ye-shall-die-like-men'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *man being in honour abideth not: he is like the beasts that perish* (Psalm 49:12) — the "gods" are sons of Adam; the highest office never made them immortal (82:7).'
  FROM cross_reference_threads t
  JOIN _s302_ps082_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=82 AND sv.verse_number=7
  JOIN _s302_ps082_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=49 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-82-ye-are-gods-but-ye-shall-die-like-men'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*dust thou art, and unto dust shalt thou return* (Genesis 3:19) — the sentence on Adam is the sentence on the "gods": no co-equal deities but mortal men (82:7).'
  FROM cross_reference_threads t
  JOIN _s302_ps082_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=82 AND sv.verse_number=7
  JOIN _s302_ps082_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-82-ye-are-gods-but-ye-shall-die-like-men'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Ask of me, and I shall give thee the heathen for thine inheritance* (Psalm 2:8) — the Father''s grant to the Son: the inheriting of all nations in 82:8.'
  FROM cross_reference_threads t
  JOIN _s302_ps082_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=82 AND sv.verse_number=8
  JOIN _s302_ps082_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=2 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-82-arise-o-elohim-judge-the-earth-inherit-all-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *with righteousness shall he judge the poor, and reprove with equity for the meek* (Isaiah 11:4) — the just judgment the failed bench owed, come in the Branch (82:8).'
  FROM cross_reference_threads t
  JOIN _s302_ps082_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=82 AND sv.verse_number=8
  JOIN _s302_ps082_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-82-arise-o-elohim-judge-the-earth-inherit-all-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *he hath appointed a day, in the which he will judge the world in righteousness by that man whom he hath ordained* (Acts 17:31) — the appointed day answers the cry of 82:8.'
  FROM cross_reference_threads t
  JOIN _s302_ps082_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=82 AND sv.verse_number=8
  JOIN _s302_ps082_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=17 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-82-arise-o-elohim-judge-the-earth-inherit-all-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *the kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ)* (Revelation 11:15) — the inheriting of all nations consummated, the nations gathered WITH Yashar''el (82:8).'
  FROM cross_reference_threads t
  JOIN _s302_ps082_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=82 AND sv.verse_number=8
  JOIN _s302_ps082_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=11 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-82-arise-o-elohim-judge-the-earth-inherit-all-nations'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
