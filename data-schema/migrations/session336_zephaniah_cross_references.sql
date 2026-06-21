-- =====================================================================
-- Session 336 — Zephaniah FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session336_zephaniah_cross_references.sql
-- =====================================================================

\echo 'session336 — Zephaniah cross-references starting...'
BEGIN;

-- ----- fragment: minion_zephaniah_1.sql (Zephaniah 1) -----
-- Chapter: Zephaniah 1 — THE GREAT DAY OF YAHUAH, a day of wrath; the silence before the Judge;
-- against idolatry and complacency. The word of Yahuah came to Zephaniah in the days of Josiah
-- (1:1). The chapter opens with an un-creation reversal: *I will utterly consume all things from
-- off the land... man and beast... fowls of the heaven, and the fishes of the sea... and I will cut
-- off man from off the land* (1:2-3) — the Genesis 1 creation order run backward, the flood-judgment
-- renewed. The stretched hand falls on Judah's syncretism — the Baal-remnant, the priests of the
-- idols, the host-of-heaven worshippers who swear by Yahuah AND by Malcham (1:4-6). Then the silence:
-- *Hold thy peace at the presence of Adonai Yahuah... for Yahuah hath prepared a sacrifice, he hath
-- bid his guests* (1:7) — the day as a slaughter where the people are the offering. The complacent
-- who say *Yahuah will not do good, neither will he do evil* are searched out with candles and cursed
-- with covenant-futility (1:12-13). The keystone: *The great day of Yahuah is near... a day of wrath,
-- a day of trouble and distress... a day of darkness and gloominess... a day of the trumpet and alarm*
-- (1:14-16) — THE classic day-of-Yahuah text. And neither silver nor gold can ransom in that day (1:18).
-- Tag: zep01   Temp view: _s336_zep01_lookup
-- Sort band: base 45600, step 3 -> threads at 45600, 45603, 45606, 45609, 45612, 45615 (6 threads)
-- Source of EVERY row: 'canon','zephaniah',1,v
--
-- Zephaniah 1 coverage:
--   ★ v.2-3 (I will utterly consume all things from off the land... man and beast... fowls... fishes...
--          and I will cut off man from off the land)
--        NT:     none warranted distinct (the de-creation forward-weave is carried in the day-of-wrath
--                threads 2/4; no single NT verse better than the Tanakh un-creation parallels)
--        Extras: none warranted distinct (judgment-history witnesses carried in threads 3/4)
--        Tanakh: ★ Genesis 1:26-28 (the creation order man→fowl→fish reversed), Genesis 6:7 (the
--                flood-judgment: I will destroy man... beast... creeping thing... fowls), Hosea 4:3
--                (the land mourn... beasts... fowls... fishes taken away), Jeremiah 4:23 (without form,
--                and void — the de-creation) — THREAD 1
--   v.4-6 (cut off the remnant of Baal... the Chemarims with the priests... worship the host of heaven...
--          swear by Yahuah, and... by Malcham... turned back from Yahuah)
--        NT:     none warranted (the syncretism judged is a Torah/covenant matter, weighed best in Tanakh)
--        Extras: none warranted
--        Tanakh: ★ Exodus 20:3 (Thou shalt have no other gods before me — the first word broken),
--                2 Kings 23:5 (Josiah's own purge: the idolatrous priests... host of heaven) — THREAD 6
--   ★★ v.7 (Hold thy peace at the presence of Adonai Yahuah: for the day of Yahuah is at hand: for
--          Yahuah hath prepared a sacrifice, he hath bid his guests)
--        NT:     ★★ Revelation 19:17-18 (the supper of the great Elohim — eat the flesh of kings...
--                mighty men) — THREAD 2 (the day-as-sacrifice consummated)
--        Extras: none warranted distinct (clean witness deferred to thread 3's Sirach)
--        Tanakh: ★ Habakkuk 2:20 (let all the earth keep silence before him), Zechariah 2:13 (Be
--                silent, O all flesh, before Yahuah), Isaiah 34:6 (Yahuah hath a sacrifice in Bozrah),
--                Jeremiah 46:10 (a day of vengeance... Yahuah hath a sacrifice) — THREAD 2
--   v.8-11 (punish the princes... clothed with strange apparel... fill their masters' houses with
--          violence and deceit... the noise of a cry from the fish gate)
--        NT:     none warranted (specific Jerusalem-judgment detail; woven into thread 2/4 prose)
--        Extras: none warranted
--        Tanakh: held in prose (the day-of-sacrifice detail, preface to threads 2 and 4)
--   ★ v.12-13 (I will search Jerusalem with candles, and punish the men that are settled on their lees:
--          that say in their heart, Yahuah will not do good, neither will he do evil... they shall build
--          houses, but not inhabit them; and they shall plant vineyards, but not drink the wine thereof)
--        NT:     ★ Luke 12:19-20 (the rich fool: take thine ease... Thou fool, this night thy soul shall
--                be required of thee) — THREAD 3
--        Extras: ★ Sirach 5:7-8 (suddenly shall the wrath of Yahuah come forth... goods unjustly gotten...
--                shall not profit you in the day of calamity), Sirach 11:19 (I have found rest... knoweth
--                not what time shall come... must leave those things to others, and die) — THREAD 3
--        Tanakh: ★ Psalm 10:4 (the wicked... Elohim is not in all his thoughts), Psalm 94:7 (Yahuah shall
--                not see), Deuteronomy 28:30 (build an house... not dwell therein... plant a vineyard...
--                not gather), Amos 5:11 (built houses... not dwell... planted vineyards... not drink) — THREAD 3
--   ★★★ v.14-16 (The great day of Yahuah is near... a day of wrath, a day of trouble and distress,
--          a day of wasteness and desolation, a day of darkness and gloominess, a day of clouds and
--          thick darkness, a day of the trumpet and alarm against the fenced cities)
--        NT:     ★★★ 1 Thessalonians 5:2 (the day of Yahuah so cometh as a thief in the night),
--                Matthew 24:29-31 (the sun darkened... the trumpet... gather his elect),
--                Revelation 6:17 (the great day of his wrath is come; and who shall be able to stand?) — THREAD 4
--        Extras: none warranted distinct (the day-of-wrath extras witness is in thread 3's Sirach)
--        Tanakh: ★★ Joel 2:1-2 (Blow the trumpet... the day of Yahuah... a day of darkness and of
--                gloominess) near-identical wording, Joel 2:11 (the day of Yahuah is great and very
--                terrible), Amos 5:18-20 (the day of Yahuah is darkness, and not light), Isaiah 13:6
--                (the day of Yahuah is at hand), Isaiah 13:9 (the day of Yahuah cometh, cruel both with
--                wrath and fierce anger) — THREAD 4
--   v.17 (distress upon men... walk like blind men, because they have sinned against Yahuah... their
--          blood... poured out as dust)
--        NT:     none warranted (woven into thread 4 prose as the consequence of the day of wrath)
--        Extras: none warranted
--        Tanakh: held in prose with thread 4
--   ★ v.18 (Neither their silver nor their gold shall be able to deliver them in the day of the LORD'S
--          wrath... he shall make even a speedy riddance of all them that dwell in the land)
--        NT:     ★ 1 Peter 1:18 (ye were not redeemed with corruptible things, as silver and gold) — THREAD 5
--        Extras: none warranted distinct
--        Tanakh: ★ Proverbs 11:4 (Riches profit not in the day of wrath), Ezekiel 7:19 (their silver and
--                their gold shall not be able to deliver them in the day of the wrath of Yahuah), Psalm
--                49:6-7 (They that trust in their wealth... None... can... redeem his brother) — THREAD 5
--
-- Threads (slug — target libraries):
--   1. zephaniah-1-i-will-utterly-consume-all-things-the-uncreation — Tanakh (Gen 1, Gen 6, Hosea 4, Jer 4) [free]
--      (★ the de-creation reversal: the creation order run backward, the flood-judgment renewed)
--   2. zephaniah-1-hold-thy-peace-the-day-of-yahuahs-sacrifice — NT (Revelation 19) + Tanakh (Hab 2, Zech 2, Isa 34, Jer 46) [free]
--      (★★ the silence before the Judge; the day as a sacrifice where the people are the offering)
--   3. zephaniah-1-the-men-settled-on-their-lees-the-complacent — NT (Luke 12) + Extras (Sirach 5, Sirach 11) + Tanakh (Ps 10, Ps 94, Deut 28, Amos 5) [extras]
--      (★ the practical-atheist complacency; the build-but-not-inhabit covenant-futility curse)
--   4. zephaniah-1-the-great-day-of-yahuah-a-day-of-wrath — NT (1 Thess 5, Matthew 24, Revelation 6) + Tanakh (Joel 2, Amos 5, Isa 13) [free]
--      (★★★ THE classic day-of-Yahuah text; the trumpet, the darkness, the wrath)
--   5. zephaniah-1-neither-silver-nor-gold-shall-deliver — NT (1 Peter 1) + Tanakh (Prov 11, Ezek 7, Ps 49) [free]
--      (★ riches cannot ransom in the day of wrath)
--   6. zephaniah-1-the-remnant-of-baal-and-them-that-swear-by-malcham — Tanakh (Exodus 20, 2 Kings 23) [free]
--      (the syncretism judged; the first word broken; Josiah's own purge)
--
-- Framing notes:
--   ★ THE UN-CREATION (THREAD 1): *I will utterly consume all things from off the land, saith Yahuah*
--      (1:2); *I will consume man and beast; I will consume the fowls of the heaven, and the fishes of
--      the sea... and I will cut off man from off the land* (1:3). This is the Genesis 1 creation order
--      — man, beast, fowl, fish — run deliberately BACKWARD: judgment as de-creation. The categories are
--      the dominion of *Genesis 1:26-28* (man... fish of the sea... fowl of the air), now swept away; it
--      renews the flood-word *I will destroy man whom I have created from the face of the earth; both
--      man, and beast, and the creeping thing, and the fowls of the air* (Genesis 6:7). Hosea sang the
--      same un-making — *the land mourn... with the beasts of the field, and with the fowls of heaven;
--      yea, the fishes of the sea also shall be taken away* (Hosea 4:3) — and Jeremiah saw the earth
--      returned to its first state: *I beheld the earth, and, lo, it was without form, and void*
--      (Jeremiah 4:23). The Creator un-creates what covenant-breaking has defiled.
--   ★★ HOLD THY PEACE / THE DAY OF SACRIFICE (THREAD 2): *Hold thy peace at the presence of Adonai
--      Yahuah (the Lord GOD): for the day of Yahuah is at hand: for Yahuah hath prepared a sacrifice,
--      he hath bid his guests* (1:7). The silence is the creature's before the enthroned Judge — *let
--      all the earth keep silence before him* (Habakkuk 2:20), *Be silent, O all flesh, before Yahuah*
--      (Zechariah 2:13). And the "sacrifice" is the day's slaughter where the guilty are the offering:
--      *Yahuah hath a sacrifice in Bozrah, and a great slaughter* (Isaiah 34:6); *a day of vengeance...
--      Yahuah hath a sacrifice in the north country* (Jeremiah 46:10). Revelation brings it to its head
--      — *Come and gather yourselves together unto the supper of the great Elohim (God); That ye may eat
--      the flesh of kings... and the flesh of mighty men* (Revelation 19:17-18) — the bidden guests, the
--      slain made the feast of the day of Yahuah.
--   ★ THE COMPLACENT (THREAD 3): *I will punish the men that are settled on their lees: that say in their
--      heart, Yahuah will not do good, neither will he do evil* (1:12) — the practical atheism that
--      denies Yahuah acts, the very lie of *Elohim is not in all his thoughts* (Psalm 10:4) and *Yahuah
--      shall not see* (Psalm 94:7). The verdict is the covenant-futility curse: *they shall build houses,
--      but not inhabit them; and they shall plant vineyards, but not drink the wine thereof* (1:13) —
--      Deuteronomy 28:30 and Amos 5:11 word for word. Yahusha tells the same man's story: *Soul, thou
--      hast much goods laid up for many years; take thine ease* — *Thou fool, this night thy soul shall
--      be required of thee* (Luke 12:19-20). And the restored witness rebukes the same security: *suddenly
--      shall the wrath of Yahuah (God) come forth... goods unjustly gotten... shall not profit you in the
--      day of calamity* (Sirach 5:7-8); *I have found rest, and now will eat continually of my goods; and
--      yet he knoweth not what time shall come upon him, and that he must leave those things to others,
--      and die* (Sirach 11:19) — the rich-fool pattern named centuries before the parable.
--   ★★★ THE GREAT DAY OF YAHUAH (THREAD 4): *The great day of Yahuah is near, it is near, and hasteth
--      greatly... That day is a day of wrath, a day of trouble and distress, a day of wasteness and
--      desolation, a day of darkness and gloominess, a day of clouds and thick darkness, A day of the
--      trumpet and alarm against the fenced cities* (1:14-16) — THE day-of-Yahuah text. Joel's words are
--      almost identical — *the day of Yahuah cometh, for it is nigh at hand; A day of darkness and of
--      gloominess, a day of clouds and of thick darkness* (Joel 2:1-2) — and the trumpet sounds the alarm
--      (Joel 2:1; *the day of Yahuah is great and very terrible; and who can abide it?* Joel 2:11). Amos
--      strips the false hope: *the day of Yahuah is darkness, and not light* (Amos 5:18-20). Isaiah: *the
--      day of Yahuah cometh, cruel both with wrath and fierce anger* (Isaiah 13:9). And the prophets'
--      day breaks open into the gospel's: *the day of Yahuah so cometh as a thief in the night* (1
--      Thessalonians 5:2); *the sun be darkened... and he shall send his angels with a great sound of a
--      trumpet, and they shall gather together his elect* (Matthew 24:29-31) — the trumpet of Zephaniah,
--      the gathering of the two-house elect; *the great day of his wrath is come; and who shall be able
--      to stand?* (Revelation 6:17). One day, one trumpet, one wrath, across the whole library.
--   ★ SILVER NOR GOLD (THREAD 5): *Neither their silver nor their gold shall be able to deliver them in
--      the day of the LORD'S wrath* (1:18). Riches cannot ransom: *Riches profit not in the day of wrath*
--      (Proverbs 11:4); *their silver and their gold shall not be able to deliver them in the day of the
--      wrath of Yahuah* (Ezekiel 7:19, near-verbatim); *None of them can by any means redeem his brother,
--      nor give to Elohim a ransom for him* (Psalm 49:7). The deliverance that wealth cannot buy is the
--      one the Messiah gives: *ye were not redeemed with corruptible things, as silver and gold... but
--      with the precious blood of Messiah* (1 Peter 1:18-19) — what gold cannot do, the blood does.
--   THE SYNCRETISM JUDGED (THREAD 6): *I will cut off the remnant of Baal from this place, and the name
--      of the Chemarims with the priests; And them that worship the host of heaven upon the housetops;
--      and them that worship and that swear by Yahuah, and that swear by Malcham* (1:4-5). The first word
--      is broken — *Thou shalt have no other gods before me* (Exodus 20:3) — and the divided heart that
--      swears by Yahuah AND by Malcham is the very thing Josiah, in whose days Zephaniah prophesied,
--      tore down: *he put down the idolatrous priests... them also that burned incense unto Baal, to the
--      sun, and to the moon... and to all the host of heaven* (2 Kings 23:5). The covenant tolerates no
--      mixture.
--   VERSES WITH NO SEPARATE ADD: v.1 (the superscription — Zephaniah in the days of Josiah; the historical
--      frame carried in thread 6's 2 Kings 23 link), v.8-11 (the princes, strange apparel, the fish gate
--      — the day-of-sacrifice detail, woven into thread 2/4 prose), v.17 (distress... walk like blind men
--      — the consequence of the day of wrath, woven into thread 4). All recorded, none silently skipped.

CREATE TEMP VIEW _s336_zep01_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★): I will utterly consume all things — the un-creation reversal
    ('canon','zephaniah',1,3,'canon','genesis',1,26,'free',
      E'*And Elohim (God) said, Let us make man in our image, after our likeness: and let them have dominion over the fish of the sea, and over the fowl of the air, and over the cattle, and over all the earth* (Genesis 1:26). Zephaniah''s consuming runs this very order backward: *I will consume man and beast; I will consume the fowls of the heaven, and the fishes of the sea... and I will cut off man from off the land* (Zephaniah 1:3). The dominion man was given over fish, fowl, and beast is swept away with him — judgment as de-creation, the sixth-day order un-made.'),
    ('canon','zephaniah',1,3,'canon','genesis',6,7,'free',
      E'*And Yahuah (LORD) said, I will destroy man whom I have created from the face of the earth; both man, and beast, and the creeping thing, and the fowls of the air; for it repenteth me that I have made them* (Genesis 6:7). The flood-word is renewed in Zephaniah: *I will consume man and beast; I will consume the fowls of the heaven... and I will cut off man from off the land* (Zephaniah 1:3). The same categories, the same Creator who blots out what corruption has defiled — the day of Yahuah as a second deluge.'),
    ('canon','zephaniah',1,3,'canon','hosea',4,3,'free',
      E'*Therefore shall the land mourn, and every one that dwelleth therein shall languish, with the beasts of the field, and with the fowls of heaven; yea, the fishes of the sea also shall be taken away* (Hosea 4:3). Hosea sings the same un-making that Zephaniah pronounces — *the fowls of the heaven, and the fishes of the sea* taken away (Zephaniah 1:3). When the covenant is broken, the whole created order — beast, fowl, fish — is unwound with the people.'),
    ('canon','zephaniah',1,2,'canon','jeremiah',4,23,'free',
      E'*I beheld the earth, and, lo, it was without form, and void; and the heavens, and they had no light* (Jeremiah 4:23). Jeremiah sees the earth returned to its first chaos — *without form, and void* — the Genesis 1:2 state before the Word spoke. It is the same de-creation Zephaniah announces: *I will utterly consume all things from off the land, saith Yahuah* (Zephaniah 1:2). Judgment unmakes the world back to formlessness.'),

    -- THREAD 2 (★★): Hold thy peace — the day of Yahuah''s sacrifice
    ('canon','zephaniah',1,7,'canon','habakkuk',2,20,'free',
      E'*But Yahuah (LORD) is in his holy temple: let all the earth keep silence before him* (Habakkuk 2:20). The same hush Zephaniah commands — *Hold thy peace at the presence of Adonai Yahuah (the Lord GOD): for the day of Yahuah is at hand* (Zephaniah 1:7) — is the creature''s silence before the enthroned Judge. When Yahuah rises to judge, all the earth keeps silence.'),
    ('canon','zephaniah',1,7,'canon','zechariah',2,13,'free',
      E'*Be silent, O all flesh, before Yahuah (LORD): for he is raised up out of his holy habitation* (Zechariah 2:13). Zechariah commands the very silence Zephaniah does — *Hold thy peace at the presence of Adonai Yahuah* (Zephaniah 1:7) — for Yahuah is rising up to act. All flesh falls silent when the Judge comes out of his holy place.'),
    ('canon','zephaniah',1,7,'canon','isaiah',34,6,'free',
      E'*The sword of Yahuah (LORD) is filled with blood... for Yahuah (LORD) hath a sacrifice in Bozrah, and a great slaughter in the land of Idumea* (Isaiah 34:6). Isaiah names the day''s "sacrifice" exactly as Zephaniah does: *Yahuah hath prepared a sacrifice, he hath bid his guests* (Zephaniah 1:7). The offering is not on the altar but in the field — the guilty themselves are the slaughter of the day of Yahuah.'),
    ('canon','zephaniah',1,7,'canon','jeremiah',46,10,'free',
      E'*For this is the day of Adonai Yahuah (the Lord GOD) of hosts, a day of vengeance... for Adonai Yahuah (the Lord GOD) of hosts hath a sacrifice in the north country by the river Euphrates* (Jeremiah 46:10). Jeremiah, like Zephaniah, calls the day of Yahuah a sacrifice — *Yahuah hath prepared a sacrifice, he hath bid his guests* (Zephaniah 1:7). The day of vengeance is a slaughter Yahuah himself prepares, the nations the offering.'),
    ('canon','zephaniah',1,7,'canon','revelation',19,17,'free',
      E'*And I saw an angel standing in the sun; and he cried with a loud voice, saying to all the fowls that fly in the midst of heaven, Come and gather yourselves together unto the supper of the great Elohim (God)* (Revelation 19:17). The bidden guests of Zephaniah''s day-sacrifice — *he hath prepared a sacrifice, he hath bid his guests* (Zephaniah 1:7) — are summoned to the table at the end: the supper of the great Elohim, where the slain of the day of Yahuah are the feast.'),
    ('canon','zephaniah',1,7,'canon','revelation',19,18,'free',
      E'*That ye may eat the flesh of kings, and the flesh of captains, and the flesh of mighty men... and the flesh of all men, both free and bond, both small and great* (Revelation 19:18). The "sacrifice" Yahuah prepares (Zephaniah 1:7) reaches its consummation here: the kings and the mighty — the very princes Zephaniah says will be punished (1:8) — become the supper of the day of wrath. The guests are bidden to the slaughter.'),

    -- THREAD 3 (★): The men settled on their lees — the complacent
    ('canon','zephaniah',1,12,'canon','psalms',10,4,'free',
      E'*The wicked, through the pride of his countenance, will not seek after Elohim (God): Elohim (God) is not in all his thoughts* (Psalm 10:4). This is the lees-settled heart Zephaniah condemns — *that say in their heart, Yahuah will not do good, neither will he do evil* (Zephaniah 1:12). The practical atheist does not deny Yahuah exists; he denies Yahuah acts. Elohim is simply not in his thoughts.'),
    ('canon','zephaniah',1,12,'canon','psalms',94,7,'free',
      E'*Yet they say, Yahuah (LORD) shall not see, neither shall the Elohim (God) of Jacob regard it* (Psalm 94:7). The same denial Zephaniah names — *Yahuah will not do good, neither will he do evil* (Zephaniah 1:12) — is the security that says Yahuah does not see. So Zephaniah''s answer is that Yahuah will *search Jerusalem with candles* (1:12): the One they say is blind hunts them out with a lamp.'),
    ('canon','zephaniah',1,13,'canon','deuteronomy',28,30,'free',
      E'*Thou shalt build an house, and thou shalt not dwell therein: thou shalt plant a vineyard, and shalt not gather the grapes thereof* (Deuteronomy 28:30). Zephaniah pronounces the Deuteronomy 28 covenant-futility curse word for word: *they shall also build houses, but not inhabit them; and they shall plant vineyards, but not drink the wine thereof* (Zephaniah 1:13). The curse is never the Torah — it is the Deuteronomy 28 exile-judgment for breaking the covenant, now falling on the complacent.'),
    ('canon','zephaniah',1,13,'canon','amos',5,11,'free',
      E'*ye have built houses of hewn stone, but ye shall not dwell in them; ye have planted pleasant vineyards, but ye shall not drink wine of them* (Amos 5:11). Amos pronounces the identical futility-curse Zephaniah does — *build houses, but not inhabit them... plant vineyards, but not drink the wine thereof* (Zephaniah 1:13). The labor of the secure is forfeit; what they store up in their ease is taken in the day of Yahuah.'),
    ('canon','zephaniah',1,12,'canon','luke',12,19,'free',
      E'*And I will say to my soul, Soul, thou hast much goods laid up for many years; take thine ease, eat, drink, and be merry* (Luke 12:19). The rich fool is Zephaniah''s man settled on his lees — *that say in their heart, Yahuah will not do good, neither will he do evil* (Zephaniah 1:12). He plans on years and reckons Yahuah out of his thoughts; his goods are his confidence.'),
    ('canon','zephaniah',1,13,'canon','luke',12,20,'free',
      E'*But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* (Luke 12:20). The verdict on the rich fool is Zephaniah''s verdict on the complacent: their stored-up goods become forfeit — *their goods shall become a booty, and their houses a desolation* (Zephaniah 1:13). What they trusted to keep them is taken in a night.'),
    ('canon','zephaniah',1,12,'apocrypha','ecclesiasticus',5,7,'extras',
      E'*Make no tarrying to turn to Yahuah (God), and put not off from day to day: for suddenly shall the wrath of Yahuah (God) come forth, and in your security you shall be destroyed, and perish in the day of vengeance* (Sirach 5:7). The restored witness rebukes the exact security Zephaniah names — the men settled on their lees who say *Yahuah will not do good* (Zephaniah 1:12). The wrath comes suddenly upon those at ease; the day of vengeance overtakes the secure.'),
    ('canon','zephaniah',1,13,'apocrypha','ecclesiasticus',11,19,'extras',
      E'*Whereas he says, I have found rest, and now will eat continually of my goods; and yet he knoweth not what time shall come upon him, and that he must leave those things to others, and die* (Sirach 11:19). Centuries before the parable of the rich fool, the wisdom-witness draws the same man Zephaniah judges: he hoards his goods in false rest, not knowing they shall *become a booty* (Zephaniah 1:13) and be left to others. The complacent man and his lost goods.'),

    -- THREAD 4 (★★★): The great day of Yahuah — a day of wrath
    ('canon','zephaniah',1,15,'canon','joel',2,2,'free',
      E'*A day of darkness and of gloominess, a day of clouds and of thick darkness, as the morning spread upon the mountains* (Joel 2:2). Joel''s words are almost identical to Zephaniah''s — *a day of darkness and gloominess, a day of clouds and thick darkness* (Zephaniah 1:15). Two prophets describe the same day of Yahuah in the same breath: darkness, gloom, thick cloud. One day, one verdict.'),
    ('canon','zephaniah',1,14,'canon','joel',2,1,'free',
      E'*Blow ye the trumpet in Zion, and sound an alarm in my holy mountain... for the day of Yahuah (LORD) cometh, for it is nigh at hand* (Joel 2:1). Joel sounds the same trumpet-alarm Zephaniah does for the same nearness: *The great day of Yahuah is near, it is near, and hasteth greatly* (Zephaniah 1:14), *A day of the trumpet and alarm* (1:16). The trumpet warns a land that the day is at the door.'),
    ('canon','zephaniah',1,14,'canon','joel',2,11,'free',
      E'*And Yahuah (LORD) shall utter his voice before his army... for the day of Yahuah (LORD) is great and very terrible; and who can abide it?* (Joel 2:11). Joel''s *great and very terrible* day is Zephaniah''s *great day of Yahuah* that *hasteth greatly* (Zephaniah 1:14). The question Joel asks — *who can abide it?* — is the question the whole chapter forces.'),
    ('canon','zephaniah',1,15,'canon','amos',5,18,'free',
      E'*Woe unto you that desire the day of Yahuah (LORD)!... the day of Yahuah (LORD) is darkness, and not light* (Amos 5:18). Amos strips away every false hope that the day will favor the presumptuous — it is *darkness, and not light*, exactly Zephaniah''s *day of darkness and gloominess* (Zephaniah 1:15). For the complacent who thought Yahuah would not act, the day is unrelieved darkness.'),
    ('canon','zephaniah',1,14,'canon','isaiah',13,9,'free',
      E'*Behold, the day of Yahuah (LORD) cometh, cruel both with wrath and fierce anger, to lay the land desolate* (Isaiah 13:9). Isaiah names the day of Yahuah as Zephaniah does — near, hastening, *a day of wrath* and *wasteness and desolation* (Zephaniah 1:14-15). The same day of wrath that lays the land desolate is announced by both prophets.'),
    ('canon','zephaniah',1,14,'canon','1-thessalonians',5,2,'free',
      E'*For yourselves know perfectly that the day of Yahuah (Lord) so cometh as a thief in the night* (1 Thessalonians 5:2). The prophets'' day of Yahuah breaks into the gospel''s with the same name and the same suddenness Zephaniah gives — *near... and hasteth greatly* (Zephaniah 1:14). It comes upon the secure as a thief; the men settled on their lees (1:12) are exactly those it surprises.'),
    ('canon','zephaniah',1,16,'canon','matthew',24,31,'free',
      E'*And he shall send his angels with a great sound of a trumpet, and they shall gather together his elect from the four winds, from one end of heaven to the other* (Matthew 24:31). Zephaniah''s *day of the trumpet and alarm* (Zephaniah 1:16) sounds again at the end — but the same trumpet that warns of wrath gathers the two-house elect from the four winds. The trumpet of judgment is also the trumpet of the ingathering.'),
    ('canon','zephaniah',1,15,'canon','matthew',24,29,'free',
      E'*Immediately after the tribulation of those days shall the sun be darkened, and the moon shall not give her light, and the stars shall fall from heaven* (Matthew 24:29). The darkness of Zephaniah''s day — *a day of darkness and gloominess, a day of clouds and thick darkness* (Zephaniah 1:15) — is the cosmic darkening Yahusha foretells. The sun and moon fail on the great day of Yahuah.'),
    ('canon','zephaniah',1,15,'canon','revelation',6,17,'free',
      E'*For the great day of his wrath is come; and who shall be able to stand?* (Revelation 6:17). Revelation names it *the great day of his wrath* — Zephaniah''s *great day of Yahuah... a day of wrath* (Zephaniah 1:14-15). The question that ends the chapter''s terror — *who shall be able to stand?* — is the cry of the kings and mighty men of the earth before the throne.'),

    -- THREAD 5 (★): Neither silver nor gold shall deliver
    ('canon','zephaniah',1,18,'canon','proverbs',11,4,'free',
      E'*Riches profit not in the day of wrath: but righteousness delivereth from death* (Proverbs 11:4). The wisdom-word is Zephaniah''s exact verdict: *Neither their silver nor their gold shall be able to deliver them in the day of the LORD''S wrath* (Zephaniah 1:18). Wealth buys no deliverance when wrath comes; only righteousness delivers.'),
    ('canon','zephaniah',1,18,'canon','ezekiel',7,19,'free',
      E'*They shall cast their silver in the streets, and their gold shall be removed: their silver and their gold shall not be able to deliver them in the day of the wrath of Yahuah (LORD)* (Ezekiel 7:19). Ezekiel says it almost verbatim with Zephaniah: *Neither their silver nor their gold shall be able to deliver them in the day of the LORD''S wrath* (Zephaniah 1:18). The hoarded metal is flung into the streets, useless, in the day of wrath.'),
    ('canon','zephaniah',1,18,'canon','psalms',49,7,'free',
      E'*None of them can by any means redeem his brother, nor give to Elohim (God) a ransom for him* (Psalm 49:7). The psalm of those who *trust in their wealth* (49:6) declares what Zephaniah declares: no silver or gold can ransom a soul — *Neither their silver nor their gold shall be able to deliver them* (Zephaniah 1:18). The price of the soul is beyond all riches.'),
    ('canon','zephaniah',1,18,'canon','1-peter',1,18,'free',
      E'*Forasmuch as ye know that ye were not redeemed with corruptible things, as silver and gold, from your vain conversation received by tradition from your fathers* (1 Peter 1:18). What gold and silver cannot do — *Neither their silver nor their gold shall be able to deliver them in the day of the LORD''S wrath* (Zephaniah 1:18) — the blood of the Messiah does. The deliverance riches could never buy is given by *the precious blood of Messiah* (1 Peter 1:19).'),

    -- THREAD 6: The remnant of Baal and them that swear by Malcham
    ('canon','zephaniah',1,5,'canon','exodus',20,3,'free',
      E'*Thou shalt have no other gods before me* (Exodus 20:3). The first word is what the men of Jerusalem break: *them that worship and that swear by Yahuah (LORD), and that swear by Malcham* (Zephaniah 1:5). The divided heart that names Yahuah and Malcham in one breath has set another god before him; the covenant tolerates no mixture.'),
    ('canon','zephaniah',1,4,'canon','2-kings',23,5,'free',
      E'*And he put down the idolatrous priests... them also that burned incense unto Baal, to the sun, and to the moon, and to the planets, and to all the host of heaven* (2 Kings 23:5). Zephaniah prophesied in the days of Josiah, the very king who tore down what the prophet condemns — *the remnant of Baal... the Chemarims with the priests; And them that worship the host of heaven upon the housetops* (Zephaniah 1:4-5). The word of the prophet and the purge of the king answer one another.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s336_zep01_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s336_zep01_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zephaniah-1-i-will-utterly-consume-all-things-the-uncreation',
       E'I will utterly consume all things — the day of Yahuah as de-creation',
       E'The chapter opens with a sweeping un-making: *I will utterly consume all things from off the land, saith Yahuah (LORD)* (Zephaniah 1:2); *I will consume man and beast; I will consume the fowls of the heaven, and the fishes of the sea, and the stumblingblocks with the wicked; and I will cut off man from off the land, saith Yahuah (LORD)* (1:3). The categories are the creation order of the sixth day run deliberately BACKWARD — man, beast, fowl, fish — the dominion granted in *Let us make man in our image... and let them have dominion over the fish of the sea, and over the fowl of the air* (Genesis 1:26) now swept away with the man who holds it. It renews the flood-word: *I will destroy man whom I have created from the face of the earth; both man, and beast, and the creeping thing, and the fowls of the air* (Genesis 6:7) — the day of Yahuah as a second deluge. Hosea sang the same un-creation — *the land mourn... with the beasts of the field, and with the fowls of heaven; yea, the fishes of the sea also shall be taken away* (Hosea 4:3) — and Jeremiah saw the earth returned to its first state: *I beheld the earth, and, lo, it was without form, and void* (Jeremiah 4:23), the Genesis 1:2 chaos before the Word spoke. The Creator un-creates what covenant-breaking has defiled, back to formlessness.',
       sv.verse_id, ev.verse_id, 'free', 45600
  FROM _s336_zep01_lookup sv, _s336_zep01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='zephaniah' AND ev.chapter_number=1 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zephaniah-1-hold-thy-peace-the-day-of-yahuahs-sacrifice',
       E'Hold thy peace — the day of Yahuah''s sacrifice, the bidden guests',
       E'*Hold thy peace at the presence of Adonai Yahuah (the Lord GOD): for the day of Yahuah (LORD) is at hand: for Yahuah (LORD) hath prepared a sacrifice, he hath bid his guests* (Zephaniah 1:7). Two things meet in this verse. First, the silence — the creature''s hush before the enthroned Judge rising to act: *But Yahuah (LORD) is in his holy temple: let all the earth keep silence before him* (Habakkuk 2:20); *Be silent, O all flesh, before Yahuah (LORD): for he is raised up out of his holy habitation* (Zechariah 2:13). Second, the "sacrifice" — the day''s slaughter where the guilty themselves are the offering and Yahuah has invited the guests to the feast. The prophets name this same day-sacrifice: *Yahuah (LORD) hath a sacrifice in Bozrah, and a great slaughter in the land of Idumea* (Isaiah 34:6); *this is the day of Adonai Yahuah (the Lord GOD) of hosts, a day of vengeance... Adonai Yahuah (the Lord GOD) of hosts hath a sacrifice in the north country by the river Euphrates* (Jeremiah 46:10). And Revelation brings the bidden guests to the table at the end of the age: *Come and gather yourselves together unto the supper of the great Elohim (God); That ye may eat the flesh of kings, and the flesh of captains, and the flesh of mighty men* (Revelation 19:17-18) — the very princes Zephaniah says will be punished (1:8) become the supper of the day of Yahuah. Hold thy peace: the Judge has prepared the sacrifice.',
       sv.verse_id, ev.verse_id, 'free', 45603
  FROM _s336_zep01_lookup sv, _s336_zep01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='zephaniah' AND ev.chapter_number=1 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zephaniah-1-the-men-settled-on-their-lees-the-complacent',
       E'The men settled on their lees — the complacency that says Yahuah will not act',
       E'*I will search Jerusalem with candles, and punish the men that are settled on their lees: that say in their heart, Yahuah (LORD) will not do good, neither will he do evil* (Zephaniah 1:12). This is the practical atheist — not one who denies Yahuah exists, but one who denies Yahuah acts. It is the lie of the psalms: *the wicked, through the pride of his countenance, will not seek after Elohim (God): Elohim (God) is not in all his thoughts* (Psalm 10:4); *Yet they say, Yahuah (LORD) shall not see, neither shall the Elohim (God) of Jacob regard it* (Psalm 94:7). So Yahuah''s answer is to hunt them out — the One they say is blind searches Jerusalem *with candles*. And the verdict is the covenant-futility curse, word for word from Torah: *Therefore their goods shall become a booty, and their houses a desolation: they shall also build houses, but not inhabit them; and they shall plant vineyards, but not drink the wine thereof* (1:13) — *Thou shalt build an house, and thou shalt not dwell therein: thou shalt plant a vineyard, and shalt not gather the grapes thereof* (Deuteronomy 28:30); *ye have built houses of hewn stone, but ye shall not dwell in them* (Amos 5:11). Yahusha tells the same man''s story: *Soul, thou hast much goods laid up for many years; take thine ease, eat, drink, and be merry* — *Thou fool, this night thy soul shall be required of thee* (Luke 12:19-20). And the restored wisdom-witness rebukes the identical security: *suddenly shall the wrath of Yahuah (God) come forth, and in your security you shall be destroyed, and perish in the day of vengeance* (Sirach 5:7); *I have found rest, and now will eat continually of my goods; and yet he knoweth not what time shall come upon him, and that he must leave those things to others, and die* (Sirach 11:19). The complacent man and his forfeit goods, judged across the whole library.',
       sv.verse_id, ev.verse_id, 'extras', 45606
  FROM _s336_zep01_lookup sv, _s336_zep01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='zephaniah' AND ev.chapter_number=1 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zephaniah-1-the-great-day-of-yahuah-a-day-of-wrath',
       E'The great day of Yahuah — a day of wrath, darkness, and the trumpet',
       E'This is THE classic day-of-Yahuah text: *The great day of Yahuah (LORD) is near, it is near, and hasteth greatly, even the voice of the day of Yahuah (LORD): the mighty man shall cry there bitterly. That day is a day of wrath, a day of trouble and distress, a day of wasteness and desolation, a day of darkness and gloominess, a day of clouds and thick darkness, A day of the trumpet and alarm against the fenced cities, and against the high towers* (Zephaniah 1:14-16). Joel describes the same day in nearly the same words: *Blow ye the trumpet in Zion, and sound an alarm in my holy mountain... for the day of Yahuah (LORD) cometh, for it is nigh at hand; A day of darkness and of gloominess, a day of clouds and of thick darkness* (Joel 2:1-2), *for the day of Yahuah (LORD) is great and very terrible; and who can abide it?* (Joel 2:11). Amos strips away the false hope: *the day of Yahuah (LORD) is darkness, and not light* (Amos 5:18). Isaiah: *the day of Yahuah (LORD) cometh, cruel both with wrath and fierce anger* (Isaiah 13:9). And the prophets'' day breaks open into the gospel''s, named and dated by the same marks. The suddenness: *the day of Yahuah (Lord) so cometh as a thief in the night* (1 Thessalonians 5:2) — surprising exactly the men settled on their lees. The darkness: *the sun be darkened, and the moon shall not give her light, and the stars shall fall from heaven* (Matthew 24:29). The trumpet — Zephaniah''s *trumpet and alarm* — now also gathers the two-house elect: *he shall send his angels with a great sound of a trumpet, and they shall gather together his elect from the four winds* (Matthew 24:31). And the wrath: *the great day of his wrath is come; and who shall be able to stand?* (Revelation 6:17). One day, one trumpet, one wrath — from Zephaniah to the Revelation.',
       sv.verse_id, ev.verse_id, 'free', 45609
  FROM _s336_zep01_lookup sv, _s336_zep01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='zephaniah' AND ev.chapter_number=1 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zephaniah-1-neither-silver-nor-gold-shall-deliver',
       E'Neither silver nor gold shall deliver — riches cannot ransom in the day of wrath',
       E'*Neither their silver nor their gold shall be able to deliver them in the day of the LORD''S wrath; but the whole land shall be devoured by the fire of his jealousy* (Zephaniah 1:18). The hoarded wealth the complacent trusted in (1:13) is worthless when the day of wrath comes. The wisdom-word says it plainly: *Riches profit not in the day of wrath: but righteousness delivereth from death* (Proverbs 11:4). Ezekiel says it almost verbatim with Zephaniah: *They shall cast their silver in the streets, and their gold shall be removed: their silver and their gold shall not be able to deliver them in the day of the wrath of Yahuah (LORD)* (Ezekiel 7:19). The psalm of those who *trust in their wealth* declares the price of a soul beyond all riches: *None of them can by any means redeem his brother, nor give to Elohim (God) a ransom for him* (Psalm 49:7). And the gospel names what gold could never buy: *ye were not redeemed with corruptible things, as silver and gold... But with the precious blood of Messiah* (1 Peter 1:18-19). The deliverance that no metal can purchase is given by the blood of the Lamb.',
       sv.verse_id, ev.verse_id, 'free', 45612
  FROM _s336_zep01_lookup sv, _s336_zep01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='zephaniah' AND ev.chapter_number=1 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zephaniah-1-the-remnant-of-baal-and-them-that-swear-by-malcham',
       E'The remnant of Baal and them that swear by Malcham — the divided heart judged',
       E'*I will also stretch out mine hand upon Yahudah (Judah), and upon all the inhabitants of Jerusalem; and I will cut off the remnant of Baal from this place, and the name of the Chemarims with the priests; And them that worship the host of heaven upon the housetops; and them that worship and that swear by Yahuah (LORD), and that swear by Malcham* (Zephaniah 1:4-5). The sin is not open apostasy but mixture — the divided heart that swears by Yahuah AND by Malcham in one breath. That breaks the very first word: *Thou shalt have no other gods before me* (Exodus 20:3). The covenant tolerates no blending of the Name with another. And the historical answer stands in the same era: Zephaniah prophesied in the days of Josiah, the king who tore down exactly what the prophet condemns — *he put down the idolatrous priests... them also that burned incense unto Baal, to the sun, and to the moon, and to the planets, and to all the host of heaven* (2 Kings 23:5). The word of the prophet and the purge of the king answer one another; the host-of-heaven on the housetops and the priests of the idols are cut off.',
       sv.verse_id, ev.verse_id, 'free', 45615
  FROM _s336_zep01_lookup sv, _s336_zep01_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='zephaniah' AND ev.chapter_number=1 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Let us make man in our image... and let them have dominion over the fish of the sea, and over the fowl of the air* (Genesis 1:26) — the creation order man→fowl→fish that Zephaniah 1:3 runs backward in judgment.'
  FROM cross_reference_threads t
  JOIN _s336_zep01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s336_zep01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=1 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-1-i-will-utterly-consume-all-things-the-uncreation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*I will destroy man... both man, and beast, and the creeping thing, and the fowls of the air* (Genesis 6:7) — the flood-judgment renewed in Zephaniah 1:3; the day of Yahuah as a second deluge.'
  FROM cross_reference_threads t
  JOIN _s336_zep01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s336_zep01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=6 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-1-i-will-utterly-consume-all-things-the-uncreation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the land mourn... with the beasts of the field, and with the fowls of heaven; yea, the fishes of the sea also shall be taken away* (Hosea 4:3) — the same un-making of beast, fowl, and fish that Zephaniah 1:3 pronounces.'
  FROM cross_reference_threads t
  JOIN _s336_zep01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=3
  JOIN _s336_zep01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=4 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-1-i-will-utterly-consume-all-things-the-uncreation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*I beheld the earth, and, lo, it was without form, and void* (Jeremiah 4:23) — the earth returned to its Genesis 1:2 chaos; the de-creation Zephaniah 1:2 announces.'
  FROM cross_reference_threads t
  JOIN _s336_zep01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=2
  JOIN _s336_zep01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=4 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-1-i-will-utterly-consume-all-things-the-uncreation'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Yahuah (LORD) is in his holy temple: let all the earth keep silence before him* (Habakkuk 2:20) — the hush Zephaniah 1:7 commands before the enthroned Judge.'
  FROM cross_reference_threads t
  JOIN _s336_zep01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s336_zep01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-1-hold-thy-peace-the-day-of-yahuahs-sacrifice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Be silent, O all flesh, before Yahuah (LORD): for he is raised up out of his holy habitation* (Zechariah 2:13) — all flesh silent as the Judge rises; the *Hold thy peace* of Zephaniah 1:7.'
  FROM cross_reference_threads t
  JOIN _s336_zep01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s336_zep01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=2 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-1-hold-thy-peace-the-day-of-yahuahs-sacrifice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Yahuah (LORD) hath a sacrifice in Bozrah, and a great slaughter* (Isaiah 34:6) — the day''s sacrifice where the guilty are the offering; the *sacrifice* Yahuah prepares in Zephaniah 1:7.'
  FROM cross_reference_threads t
  JOIN _s336_zep01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s336_zep01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=34 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-1-hold-thy-peace-the-day-of-yahuahs-sacrifice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the day of Adonai Yahuah (the Lord GOD) of hosts, a day of vengeance... hath a sacrifice in the north country* (Jeremiah 46:10) — the day of Yahuah as a sacrifice he prepares; Zephaniah 1:7.'
  FROM cross_reference_threads t
  JOIN _s336_zep01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s336_zep01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=46 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-1-hold-thy-peace-the-day-of-yahuahs-sacrifice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *Come and gather yourselves together unto the supper of the great Elohim (God)* (Revelation 19:17) — the bidden guests of Zephaniah 1:7 summoned to the day''s table.'
  FROM cross_reference_threads t
  JOIN _s336_zep01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s336_zep01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-1-hold-thy-peace-the-day-of-yahuahs-sacrifice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*That ye may eat the flesh of kings... and the flesh of mighty men* (Revelation 19:18) — the princes Zephaniah 1:8 says are punished become the supper; the sacrifice consummated.'
  FROM cross_reference_threads t
  JOIN _s336_zep01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=7
  JOIN _s336_zep01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-1-hold-thy-peace-the-day-of-yahuahs-sacrifice'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *the wicked... will not seek after Elohim (God): Elohim (God) is not in all his thoughts* (Psalm 10:4) — the practical-atheist heart of the men settled on their lees (Zephaniah 1:12).'
  FROM cross_reference_threads t
  JOIN _s336_zep01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=12
  JOIN _s336_zep01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=10 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-1-the-men-settled-on-their-lees-the-complacent'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*they say, Yahuah (LORD) shall not see, neither shall the Elohim (God) of Jacob regard it* (Psalm 94:7) — the denial that Yahuah acts; so he searches Jerusalem with candles (Zephaniah 1:12).'
  FROM cross_reference_threads t
  JOIN _s336_zep01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=12
  JOIN _s336_zep01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=94 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-1-the-men-settled-on-their-lees-the-complacent'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Thou shalt build an house, and thou shalt not dwell therein: thou shalt plant a vineyard, and shalt not gather the grapes* (Deuteronomy 28:30) — the covenant-futility curse Zephaniah 1:13 pronounces word for word; the curse is the exile-judgment, never the Torah.'
  FROM cross_reference_threads t
  JOIN _s336_zep01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=13
  JOIN _s336_zep01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=28 AND tv.verse_number=30
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-1-the-men-settled-on-their-lees-the-complacent'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*ye have built houses of hewn stone, but ye shall not dwell in them; ye have planted pleasant vineyards, but ye shall not drink wine of them* (Amos 5:11) — the same futility-curse as Zephaniah 1:13.'
  FROM cross_reference_threads t
  JOIN _s336_zep01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=13
  JOIN _s336_zep01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-1-the-men-settled-on-their-lees-the-complacent'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *Soul, thou hast much goods laid up for many years; take thine ease* (Luke 12:19) — the rich fool is Zephaniah''s man settled on his lees, reckoning Yahuah out of his thoughts (1:12).'
  FROM cross_reference_threads t
  JOIN _s336_zep01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=12
  JOIN _s336_zep01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-1-the-men-settled-on-their-lees-the-complacent'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*Thou fool, this night thy soul shall be required of thee: then whose shall those things be* (Luke 12:20) — the goods become forfeit, *a booty* (Zephaniah 1:13), taken in a night.'
  FROM cross_reference_threads t
  JOIN _s336_zep01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=13
  JOIN _s336_zep01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=20
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-1-the-men-settled-on-their-lees-the-complacent'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*suddenly shall the wrath of Yahuah (God) come forth... goods unjustly gotten... shall not profit you in the day of calamity* (Sirach 5:7-8) — the restored witness rebukes the same security as Zephaniah 1:12.'
  FROM cross_reference_threads t
  JOIN _s336_zep01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=12
  JOIN _s336_zep01_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=5 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-1-the-men-settled-on-their-lees-the-complacent'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'*I have found rest, and now will eat continually of my goods... must leave those things to others, and die* (Sirach 11:19) — the rich-fool pattern named in the wisdom-witness; the forfeit goods of Zephaniah 1:13.'
  FROM cross_reference_threads t
  JOIN _s336_zep01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=13
  JOIN _s336_zep01_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=11 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-1-the-men-settled-on-their-lees-the-complacent'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *A day of darkness and of gloominess, a day of clouds and of thick darkness* (Joel 2:2) — near-identical wording to Zephaniah 1:15; one day of Yahuah, two prophets.'
  FROM cross_reference_threads t
  JOIN _s336_zep01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=15
  JOIN _s336_zep01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-1-the-great-day-of-yahuah-a-day-of-wrath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Blow ye the trumpet in Zion, and sound an alarm... for the day of Yahuah (LORD) cometh, for it is nigh at hand* (Joel 2:1) — the same trumpet-alarm and nearness of Zephaniah 1:14,16.'
  FROM cross_reference_threads t
  JOIN _s336_zep01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=14
  JOIN _s336_zep01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-1-the-great-day-of-yahuah-a-day-of-wrath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*the day of Yahuah (LORD) is great and very terrible; and who can abide it?* (Joel 2:11) — Joel''s great and terrible day is Zephaniah''s great day that hasteth greatly (1:14).'
  FROM cross_reference_threads t
  JOIN _s336_zep01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=14
  JOIN _s336_zep01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-1-the-great-day-of-yahuah-a-day-of-wrath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*the day of Yahuah (LORD) is darkness, and not light* (Amos 5:18) — Amos strips the false hope; Zephaniah''s day of darkness and gloominess (1:15) for the presumptuous.'
  FROM cross_reference_threads t
  JOIN _s336_zep01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=15
  JOIN _s336_zep01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-1-the-great-day-of-yahuah-a-day-of-wrath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*the day of Yahuah (LORD) cometh, cruel both with wrath and fierce anger, to lay the land desolate* (Isaiah 13:9) — the day of wrath and desolation of Zephaniah 1:14-15.'
  FROM cross_reference_threads t
  JOIN _s336_zep01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=14
  JOIN _s336_zep01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=13 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-1-the-great-day-of-yahuah-a-day-of-wrath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★★★ *the day of Yahuah (Lord) so cometh as a thief in the night* (1 Thessalonians 5:2) — the prophets'' day in the gospel; it surprises the men settled on their lees (Zephaniah 1:12,14).'
  FROM cross_reference_threads t
  JOIN _s336_zep01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=14
  JOIN _s336_zep01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=5 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-1-the-great-day-of-yahuah-a-day-of-wrath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'*the sun be darkened, and the moon shall not give her light, and the stars shall fall from heaven* (Matthew 24:29) — the darkness of Zephaniah 1:15 as cosmic darkening.'
  FROM cross_reference_threads t
  JOIN _s336_zep01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=15
  JOIN _s336_zep01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=29
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-1-the-great-day-of-yahuah-a-day-of-wrath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★★ *he shall send his angels with a great sound of a trumpet, and they shall gather together his elect from the four winds* (Matthew 24:31) — Zephaniah''s trumpet (1:16) also gathers the two-house elect.'
  FROM cross_reference_threads t
  JOIN _s336_zep01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=16
  JOIN _s336_zep01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=31
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-1-the-great-day-of-yahuah-a-day-of-wrath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'★★ *the great day of his wrath is come; and who shall be able to stand?* (Revelation 6:17) — the great day of wrath of Zephaniah 1:14-15; the cry before the throne.'
  FROM cross_reference_threads t
  JOIN _s336_zep01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=15
  JOIN _s336_zep01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=6 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-1-the-great-day-of-yahuah-a-day-of-wrath'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Riches profit not in the day of wrath: but righteousness delivereth from death* (Proverbs 11:4) — Zephaniah 1:18 exactly: silver and gold cannot deliver in the day of wrath.'
  FROM cross_reference_threads t
  JOIN _s336_zep01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=18
  JOIN _s336_zep01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-1-neither-silver-nor-gold-shall-deliver'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*their silver and their gold shall not be able to deliver them in the day of the wrath of Yahuah (LORD)* (Ezekiel 7:19) — almost verbatim with Zephaniah 1:18; the metal flung in the streets, useless.'
  FROM cross_reference_threads t
  JOIN _s336_zep01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=18
  JOIN _s336_zep01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=7 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-1-neither-silver-nor-gold-shall-deliver'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*None of them can by any means redeem his brother, nor give to Elohim (God) a ransom for him* (Psalm 49:7) — the price of a soul beyond all riches; Zephaniah 1:18.'
  FROM cross_reference_threads t
  JOIN _s336_zep01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=18
  JOIN _s336_zep01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=49 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-1-neither-silver-nor-gold-shall-deliver'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*ye were not redeemed with corruptible things, as silver and gold* (1 Peter 1:18) — what gold cannot do, the precious blood of Messiah does (1:19); the answer to Zephaniah 1:18.'
  FROM cross_reference_threads t
  JOIN _s336_zep01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=18
  JOIN _s336_zep01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-1-neither-silver-nor-gold-shall-deliver'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'*Thou shalt have no other gods before me* (Exodus 20:3) — the first word broken by those who swear by Yahuah AND by Malcham (Zephaniah 1:5).'
  FROM cross_reference_threads t
  JOIN _s336_zep01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=5
  JOIN _s336_zep01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-1-the-remnant-of-baal-and-them-that-swear-by-malcham'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*he put down the idolatrous priests... them also that burned incense unto Baal, to the sun, and to the moon... and to all the host of heaven* (2 Kings 23:5) — Josiah''s purge answers the very sins Zephaniah 1:4-5 condemns in his own reign.'
  FROM cross_reference_threads t
  JOIN _s336_zep01_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=1 AND sv.verse_number=4
  JOIN _s336_zep01_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=23 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-1-the-remnant-of-baal-and-them-that-swear-by-malcham'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_zephaniah_2.sql (Zephaniah 2) -----
-- Chapter: Zephaniah 2 — SEEK YAHUAH, SEEK RIGHTEOUSNESS, SEEK MEEKNESS — and the judgments on the
-- nations. *Seek ye Yahuah (LORD), all ye meek of the earth, which have wrought his judgment; seek
-- righteousness, seek meekness: it may be ye shall be hid in the day of the LORD'S anger* (2:3) — the
-- keystone call to the humble remnant: the meek who inherit (Psalm 37:11 / Matthew 5:5), the seekers
-- (Amos 5:6 / Isaiah 55:6), the hidden and sheltered (Psalm 27:5 / 91:1), they who *have wrought his
-- judgment* = the doers of the Torah. Then the seacoast for the remnant of the house of Yahudah (2:4-7,
-- Romans 11:5 the two-house remnant); Moab and Ammon judged for reproaching Yahuah's people, until
-- *men shall worship him, every one from his place, even all the isles of the heathen* (2:8-11, the
-- universal worship — John 4:21-23 / Revelation 15:4 / Malachi 1:11); and proud Nineveh, *I am, and
-- there is none beside me* (2:15), the self-deifying boast that usurps Yahuah's own *I am... none else
-- beside me* (Isaiah 45:5-6 / 47:8-10), brought to desolation (Revelation 18:7 / Nahum 3).
-- Tag: zep02   Temp view: _s336_zep02_lookup
-- Sort band: base 45620, step 3 -> threads at 45620, 45623, 45626, 45629 (4 threads)
-- Source of EVERY row: 'canon','zephaniah',2,v
--
-- Zephaniah 2 coverage:
--   ★★★ v.1-3 (Gather yourselves together... Seek ye Yahuah (LORD), all ye meek of the earth, which
--          have wrought his judgment; seek righteousness, seek meekness: it may be ye shall be hid in
--          the day of the LORD'S anger)
--        NT:     ★★★ Matthew 5:5 (Blessed are the meek: for they shall inherit the earth) — THREAD 1
--        Extras: ★ Ecclesiasticus 2:17 (humble their souls in his sight) + 2:16 (filled with the law) — THREAD 1
--        Tanakh: ★★ Psalm 37:11 (the meek shall inherit the earth), ★ Amos 5:6 (Seek Yahuah, and ye
--                shall live), ★ Isaiah 55:6 (Seek ye Yahuah while he may be found), Isaiah 55:7
--                (let the wicked forsake his way... return unto Yahuah), ★ Psalm 27:5 (in the time of
--                trouble he shall hide me in his pavilion), ★ Psalm 91:1 (the secret place of El Elyon) — THREAD 1
--   ★ v.4-7 (For Gaza shall be forsaken... the coast shall be for the remnant of the house of Yahudah
--          (Judah)... for Yahuah their Elohim shall visit them, and turn away their captivity)
--        NT:     ★ Romans 11:5 (a remnant according to the election of grace) — THREAD 2
--        Extras: none warranted (the remnant-restoration is carried canon-forward)
--        Tanakh: woven in prose (turn-away-captivity = the two-house ingathering); no separate add forced
--   ★★ v.8-11 (I have heard the reproach of Moab... they have reproached my people, and magnified
--          themselves... Yahuah (LORD) will be terrible unto them: for he will famish all the gods of
--          the earth; and men shall worship him, every one from his place, even all the isles of the heathen)
--        NT:     ★★ John 4:21 (neither in this mountain, nor yet at Jerusalem, worship the Father),
--                ★★ John 4:23 (the true worshippers shall worship the Father in spirit and in truth),
--                ★★ Revelation 15:4 (all nations shall come and worship before thee) — THREAD 3
--        Extras: none warranted (the worship-from-every-place is the canon's own forward weave)
--        Tanakh: ★ Malachi 1:11 (in every place incense shall be offered unto my name... among the
--                heathen), ★ Isaiah 2:18 (the idols he shall utterly abolish) — THREAD 3
--   v.12 (Ye Ethiopians also, ye shall be slain by my sword)
--        NT/Extras/Tanakh: none warranted distinct — the sword against the nations is woven into the
--        judgment of THREAD 3 (the famished gods / the proud nations bowed); recorded, not silently skipped
--   ★★ v.13-15 (And he will stretch out his hand against the north, and destroy Assyria; and will make
--          Nineveh a desolation... This is the rejoicing city that dwelt carelessly, that said in her
--          heart, I am, and there is none beside me: how is she become a desolation)
--        NT:     ★★ Revelation 18:7 (she saith in her heart, I sit a queen... and shall see no sorrow) — THREAD 4
--        Extras: ★ Ecclesiasticus 10:14 (Yahuah has cast down the thrones of proud princes, and set up
--                the meek in their stead) — THREAD 4 (ties back to the meek of THREAD 1)
--        Tanakh: ★★ Isaiah 47:8 (thou that dwellest carelessly, that sayest... I am, and none else
--                beside me), ★★ Isaiah 47:10 (thou hast said in thine heart, I am, and none else beside
--                me), ★★ Isaiah 45:5 (I am Yahuah, and there is none else), ★ Isaiah 45:6 (there is none
--                beside me. I am Yahuah, and there is none else), ★ Nahum 3:7 (Nineveh is laid waste) — THREAD 4
--
-- Threads (slug — target libraries):
--   1. zephaniah-2-seek-yahuah-seek-righteousness-seek-meekness — NT (Matthew 5) + Extras (Ecclesiasticus 2)
--      + Tanakh (Psalm 37, Amos 5, Isaiah 55, Psalm 27, Psalm 91) [extras]
--      (★★★ THE KEYSTONE — the humble remnant who seek Yahuah and righteousness, the meek who inherit,
--       hidden in the day of wrath; "wrought his judgment" = the doers of the Torah)
--   2. zephaniah-2-the-coast-for-the-remnant-of-the-house-of-yahudah — NT (Romans 11) [free]
--      (★ the seacoast for the remnant of Yahudah, captivity turned away = the two-house remnant restored)
--   3. zephaniah-2-men-shall-worship-him-every-one-from-his-place — NT (John 4, Revelation 15)
--      + Tanakh (Malachi 1, Isaiah 2) [free]
--      (★★ the famished idols and the universal worship of Yahuah from every place, all the isles of the heathen)
--   4. zephaniah-2-i-am-and-there-is-none-beside-me-the-careless-city — NT (Revelation 18)
--      + Extras (Ecclesiasticus 10) + Tanakh (Isaiah 47, Isaiah 45, Nahum 3) [extras]
--      (★★ proud Nineveh's self-deifying boast "I am, and none beside me" — usurping Yahuah's own
--       I-AM-and-none-else — brought to desolation; the meek set up in the proud's stead)
--
-- Framing notes:
--   ★★★ THE KEYSTONE (THREAD 1): *Seek ye Yahuah (LORD), all ye meek of the earth, which have wrought
--      his judgment; seek righteousness, seek meekness: it may be ye shall be hid in the day of the
--      LORD'S anger* (2:3). The meek who seek are the ones who inherit — *the meek shall inherit the
--      earth* (Psalm 37:11), *Blessed are the meek: for they shall inherit the earth* (Matthew 5:5).
--      "Which have wrought his judgment" is the doer of the Torah, not the hearer only — the same humble
--      remnant the restored witness names: *They that fear Yahuah (God) will prepare their hearts, and
--      humble their souls in his sight* (Ecclesiasticus 2:17), who *shall be filled with the law*
--      (2:16). The seeking is Amos's and Isaiah's call (Amos 5:6 / Isaiah 55:6); the hiding is the
--      psalmist's shelter (Psalm 27:5 / 91:1). NOT meekness-as-weakness, NOT righteousness-apart-from-
--      Torah — the meek who DO his judgment are hid in the day of wrath.
--   ★ THE REMNANT-COAST (THREAD 2): *And the coast shall be for the remnant of the house of Yahudah
--      (Judah)... for Yahuah (LORD) their Elohim (God) shall visit them, and turn away their captivity*
--      (2:7). The Philistine seacoast becomes the remnant's inheritance; the captivity turned away is
--      the ingathering — *even so then at this present time also there is a remnant according to the
--      election of grace* (Romans 11:5). Two-house restoration, never replacement: Yahuah visits HIS
--      people and turns their captivity.
--   ★★ WORSHIP FROM EVERY PLACE (THREAD 3): Moab and Ammon reproached *my people* and magnified
--      themselves (2:8-10); the verdict turns to the whole earth: *Yahuah (LORD) will be terrible unto
--      them: for he will famish all the gods of the earth; and men shall worship him, every one from
--      his place, even all the isles of the heathen* (2:11). The idols starved to nothing (*the idols
--      he shall utterly abolish*, Isaiah 2:18); worship no longer bound to one mountain — *in every
--      place incense shall be offered unto my name... among the heathen* (Malachi 1:11), *the hour
--      cometh, when ye shall neither in this mountain, nor yet at Jerusalem, worship the Father*
--      (John 4:21), *the true worshippers shall worship the Father in spirit and in truth* (John 4:23),
--      *all nations shall come and worship before thee* (Revelation 15:4). The famished gods give way
--      to the worship of Yahuah from every place.
--   ★★ I AM, AND NONE BESIDE ME (THREAD 4): *This is the rejoicing city that dwelt carelessly, that
--      said in her heart, I am, and there is none beside me: how is she become a desolation* (2:15).
--      Nineveh's boast steals Yahuah's own self-declaration — *I am Yahuah (LORD), and there is none
--      else* (Isaiah 45:5-6); *I am Elohim (God), and there is none else* (Isaiah 46:9 — woven in
--      prose). Babylon makes the same blasphemy: *that dwellest carelessly, that sayest... I am, and
--      none else beside me* (Isaiah 47:8,10), and Revelation's harlot-city: *I sit a queen... and shall
--      see no sorrow* (Revelation 18:7). The careless city's false security ends in desolation — *Nineveh
--      is laid waste* (Nahum 3:7) — and the restored witness names the reversal: *Yahuah (God) has cast
--      down the thrones of proud princes, and set up the meek in their stead* (Ecclesiasticus 10:14),
--      binding the proud-city judgment back to the meek of THREAD 1.
--   EXTRAS: Ecclesiasticus 2:16-17 (the humble who fear Yahuah, filled with the law — THREAD 1) and
--      Ecclesiasticus 10:14 (the proud cast down, the meek set up — THREAD 4) are clean witnesses,
--      parses verified. No extras forced on the remnant-coast or the worship-from-every-place.
--   VERSES WITH NO SEPARATE ADD: v.4-6 (Gaza/Ashkelon/Ashdod/Ekron — the judgment-preface that THREAD 2's
--      remnant inherits), v.8-10 (the reproach of Moab/Ammon — preface to the worship-verdict of v.11,
--      THREAD 3), v.12 (the Ethiopians slain — the sword against the nations, woven into THREAD 3),
--      v.13-14 (the desolation of Assyria/Nineveh — the judgment THREAD 4's boast brings down). All
--      recorded, none silently skipped.

CREATE TEMP VIEW _s336_zep02_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★★): Seek Yahuah, seek righteousness, seek meekness — the meek who inherit, hidden in the day of wrath
    ('canon','zephaniah',2,3,'canon','matthew',5,5,'free',
      E'*Blessed are the meek: for they shall inherit the earth* (Matthew 5:5). The call *Seek ye Yahuah (LORD), all ye meek of the earth... seek righteousness, seek meekness* (Zephaniah 2:3) is the very blessing Yahusha (Jesus) pronounces from the mount: the meek are not the weak but the blessed inheritors. The humble remnant who seek Yahuah and his righteousness are the ones who *shall inherit the earth*.'),
    ('canon','zephaniah',2,3,'canon','psalms',37,11,'free',
      E'*But the meek shall inherit the earth; and shall delight themselves in the abundance of peace* (Psalm 37:11). Zephaniah''s *all ye meek of the earth* (2:3) are the psalmist''s meek — the same inheritance, the same peace. The day of Yahuah''s anger consumes the proud, but *the meek shall inherit the earth* and rest in the abundance of peace.'),
    ('canon','zephaniah',2,3,'canon','amos',5,6,'free',
      E'*Seek Yahuah (LORD), and ye shall live; lest he break out like fire in the house of Joseph, and devour it, and there be none to quench it* (Amos 5:6). The command *Seek ye Yahuah (LORD)* (Zephaniah 2:3) is Amos''s own urgent call: to seek Yahuah is to live, and the alternative is the fire of his anger unquenched. Seeking Yahuah is the hiding-place from the day of wrath.'),
    ('canon','zephaniah',2,3,'canon','isaiah',55,6,'free',
      E'*Seek ye Yahuah (LORD) while he may be found, call ye upon him while he is near* (Isaiah 55:6). The *Seek ye Yahuah (LORD)* of Zephaniah 2:3 — *it may be ye shall be hid in the day of the LORD''S anger* — is Isaiah''s window of mercy: seek him *while he may be found*, before the decree brings forth (Zephaniah 2:2). The seeking is urgent because the day of anger is near.'),
    ('canon','zephaniah',2,3,'canon','isaiah',55,7,'free',
      E'*Let the wicked forsake his way, and the unrighteous man his thoughts: and let him return unto Yahuah (LORD), and he will have mercy upon him; and to our Elohim (God), for he will abundantly pardon* (Isaiah 55:7). To *seek righteousness, seek meekness* (Zephaniah 2:3) is to forsake the wicked way and return — and the return finds mercy: *he will abundantly pardon*. The meek who seek righteousness are pardoned in the very day others are consumed.'),
    ('canon','zephaniah',2,3,'canon','psalms',27,5,'free',
      E'*For in the time of trouble he shall hide me in his pavilion: in the secret of his tabernacle shall he hide me; he shall set me up upon a rock* (Psalm 27:5). The promise *it may be ye shall be hid in the day of the LORD''S anger* (Zephaniah 2:3) is the psalmist''s shelter: in the time of trouble Yahuah *shall hide me in his pavilion*. The meek who seek him are hidden in the secret of his tabernacle when the day of wrath breaks.'),
    ('canon','zephaniah',2,3,'canon','psalms',91,1,'free',
      E'*He that dwelleth in the secret place of the El Elyon (most High) shall abide under the shadow of the Almighty* (Psalm 91:1). To *be hid in the day of the LORD''S anger* (Zephaniah 2:3) is to dwell in *the secret place of the El Elyon (most High)*, abiding under his shadow. The hiding-place for the meek remnant is Yahuah himself, the shadow of the Almighty.'),
    ('canon','zephaniah',2,3,'apocrypha','ecclesiasticus',2,17,'extras',
      E'*They that fear Yahuah (God) will prepare their hearts, and humble their souls in his sight* (Ecclesiasticus 2:17). The *meek of the earth, which have wrought his judgment* (Zephaniah 2:3) are those who *humble their souls in his sight* — the restored witness names the same posture: hearts prepared, souls humbled before Yahuah. The meekness Zephaniah commands is this self-humbling fear of Yahuah.'),
    ('canon','zephaniah',2,3,'apocrypha','ecclesiasticus',2,16,'extras',
      E'*They that fear Yahuah (God) will seek that which is well, pleasing to him; and they that love him shall be filled with the law* (Ecclesiasticus 2:16). The remnant *which have wrought his judgment* (Zephaniah 2:3) are *filled with the law* — to seek righteousness and meekness is to be filled with the Torah, not freed from it. The doers of his judgment are the ones who love him and are filled with his law.'),

    -- THREAD 2 (★): The coast for the remnant of the house of Yahudah — the two-house remnant restored
    ('canon','zephaniah',2,7,'canon','romans',11,5,'free',
      E'*Even so then at this present time also there is a remnant according to the election of grace* (Romans 11:5). *The coast shall be for the remnant of the house of Yahudah (Judah)... Yahuah (LORD) their Elohim (God) shall visit them, and turn away their captivity* (Zephaniah 2:7) — the seacoast given to the remnant, the captivity turned away, is the same remnant Paul confirms still stands: *a remnant according to the election of grace*. Yahuah visits HIS people and gathers them; never a casting-off, always a remnant preserved.'),

    -- THREAD 3 (★★): Men shall worship him, every one from his place — the famished gods, the universal worship
    ('canon','zephaniah',2,11,'canon','john',4,21,'free',
      E'*Yahusha (Jesus) saith unto her, Woman, believe me, the hour cometh, when ye shall neither in this mountain, nor yet at Jerusalem, worship the Father* (John 4:21). Zephaniah''s word *men shall worship him, every one from his place, even all the isles of the heathen* (2:11) is the very hour Yahusha announces: worship loosed from one mountain, offered *every one from his place*. The Father is worshipped from every place across the earth.'),
    ('canon','zephaniah',2,11,'canon','john',4,23,'free',
      E'*But the hour cometh, and now is, when the true worshippers shall worship the Father in spirit and in truth: for the Father seeketh such to worship him* (John 4:23). When *men shall worship him, every one from his place* (Zephaniah 2:11), it is the true worshippers worshipping *the Father in spirit and in truth* — the universal worship Zephaniah foresaw, gathered from all the isles of the heathen. The Father himself seeks such worshippers from every place.'),
    ('canon','zephaniah',2,11,'canon','revelation',15,4,'free',
      E'*Who shall not fear thee, O Yahuah (Lord), and glorify thy name?... for all nations shall come and worship before thee; for thy judgments are made manifest* (Revelation 15:4). The famished gods give way and *men shall worship him, every one from his place, even all the isles of the heathen* (Zephaniah 2:11) — fulfilled when *all nations shall come and worship before thee*. The judgment on the idols becomes the worship of Yahuah by every nation.'),
    ('canon','zephaniah',2,11,'canon','malachi',1,11,'free',
      E'*For from the rising of the sun even unto the going down of the same my name shall be great among the Gentiles; and in every place incense shall be offered unto my name, and a pure offering: for my name shall be great among the heathen, saith Yahuah Tseva''ot (LORD of hosts)* (Malachi 1:11). *Men shall worship him, every one from his place, even all the isles of the heathen* (Zephaniah 2:11) is Malachi''s same vision: *in every place incense shall be offered unto my name... among the heathen*. The worship of Yahuah rises from every place under the sun.'),
    ('canon','zephaniah',2,11,'canon','isaiah',2,18,'free',
      E'*And the idols he shall utterly abolish* (Isaiah 2:18). When *he will famish all the gods of the earth* (Zephaniah 2:11), it is Isaiah''s utter abolishing of the idols — the gods starved to nothing so that Yahuah alone is worshipped. The famished gods and the abolished idols are one judgment, clearing the earth for the worship of Yahuah from every place.'),

    -- THREAD 4 (★★): I am, and there is none beside me — the careless city's boast, brought to desolation
    ('canon','zephaniah',2,15,'canon','isaiah',47,8,'free',
      E'*Therefore hear now this, thou that art given to pleasures, that dwellest carelessly, that sayest in thine heart, I am, and none else beside me; I shall not sit as a widow, neither shall I know the loss of children* (Isaiah 47:8). Nineveh''s boast *that dwelt carelessly, that said in her heart, I am, and there is none beside me* (Zephaniah 2:15) is Babylon''s identical blasphemy — *that dwellest carelessly, that sayest... I am, and none else beside me*. The same careless self-deification, the same false security, the same coming desolation.'),
    ('canon','zephaniah',2,15,'canon','isaiah',47,10,'free',
      E'*For thou hast trusted in thy wickedness: thou hast said, None seeth me... and thou hast said in thine heart, I am, and none else beside me* (Isaiah 47:10). The rejoicing city *said in her heart, I am, and there is none beside me* (Zephaniah 2:15) speaks Babylon''s very words — *I am, and none else beside me*. To say it in the heart is to usurp Yahuah''s own self-declaration; the boast that no one sees is answered by desolation.'),
    ('canon','zephaniah',2,15,'canon','isaiah',45,5,'free',
      E'*I am Yahuah (LORD), and there is none else, there is no Elohim (God) beside me: I girded thee, though thou hast not known me* (Isaiah 45:5). Nineveh''s *I am, and there is none beside me* (Zephaniah 2:15) is the theft of Yahuah''s own words — *I am Yahuah (LORD), and there is none else*. The proud city seizes the self-declaration that belongs to Yahuah alone, and for that pride is made a desolation.'),
    ('canon','zephaniah',2,15,'canon','isaiah',45,6,'free',
      E'*That they may know from the rising of the sun, and from the west, that there is none beside me. I am Yahuah (LORD), and there is none else* (Isaiah 45:6). *There is none beside me* belongs to Yahuah, who alone is — yet the careless city said in her heart, *I am, and there is none beside me* (Zephaniah 2:15). The blasphemy is precise: she claims the very being and singularity that is Yahuah''s alone (*I am Yahuah (LORD), and there is none else*).'),
    ('canon','zephaniah',2,15,'canon','revelation',18,7,'free',
      E'*How much she hath glorified herself, and lived deliciously, so much torment and sorrow give her: for she saith in her heart, I sit a queen, and am no widow, and shall see no sorrow* (Revelation 18:7). The *rejoicing city that dwelt carelessly* (Zephaniah 2:15) — *how is she become a desolation* — is Revelation''s self-glorifying city: *she saith in her heart, I sit a queen... and shall see no sorrow*. The careless boast of the proud city, secure against all sorrow, ends in sudden desolation.'),
    ('canon','zephaniah',2,15,'canon','nahum',3,7,'free',
      E'*And it shall come to pass, that all they that look upon thee shall flee from thee, and say, Nineveh is laid waste: who will bemoan her? whence shall I seek comforters for thee?* (Nahum 3:7). Zephaniah''s *how is she become a desolation... every one that passeth by her shall hiss, and wag his hand* (2:15) is Nahum''s same word over the same city: *Nineveh is laid waste*, none to bemoan her. The rejoicing city''s boast is answered by the hiss of every passer-by.'),
    ('canon','zephaniah',2,15,'apocrypha','ecclesiasticus',10,14,'extras',
      E'*Yahuah (God) has cast down the thrones of proud princes, and set up the meek in their stead* (Ecclesiasticus 10:14). The proud city that said *I am, and there is none beside me* (Zephaniah 2:15) is cast down — and in her stead the meek are set up, the very *meek of the earth* called to seek Yahuah in 2:3. The judgment on the careless city and the inheritance of the meek are one work: Yahuah throws down the proud and raises the lowly.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s336_zep02_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s336_zep02_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zephaniah-2-seek-yahuah-seek-righteousness-seek-meekness',
       E'Seek Yahuah, seek righteousness, seek meekness — ye meek of the earth, hid in the day of his anger',
       E'Before the decree comes forth, Zephaniah calls the humble remnant to seek: *Gather yourselves together, yea, gather together, O nation not desired... Seek ye Yahuah (LORD), all ye meek of the earth, which have wrought his judgment; seek righteousness, seek meekness: it may be ye shall be hid in the day of the LORD''S anger* (Zephaniah 2:1-3). This is the keystone of the chapter — and the meek who seek are the ones who inherit. Yahusha (Jesus) pronounces it from the mount: *Blessed are the meek: for they shall inherit the earth* (Matthew 5:5), the very blessing the psalmist sang: *But the meek shall inherit the earth; and shall delight themselves in the abundance of peace* (Psalm 37:11). To seek is to live: *Seek Yahuah (LORD), and ye shall live* (Amos 5:6); and the window is now: *Seek ye Yahuah (LORD) while he may be found, call ye upon him while he is near* (Isaiah 55:6), *let him return unto Yahuah (LORD), and he will have mercy upon him... for he will abundantly pardon* (Isaiah 55:7). The hiding-place in the day of wrath is Yahuah himself: *in the time of trouble he shall hide me in his pavilion: in the secret of his tabernacle shall he hide me* (Psalm 27:5); *He that dwelleth in the secret place of the El Elyon (most High) shall abide under the shadow of the Almighty* (Psalm 91:1). And mark *which have wrought his judgment* — these meek are the DOERS of the Torah, not the hearers only; the restored witness names them: *They that fear Yahuah (God) will prepare their hearts, and humble their souls in his sight* (Ecclesiasticus 2:17), *they that love him shall be filled with the law* (Ecclesiasticus 2:16). Meekness is not weakness and righteousness is not apart from the Torah — the meek who do his judgment are hid in the day of his anger.',
       sv.verse_id, ev.verse_id, 'extras', 45620
  FROM _s336_zep02_lookup sv, _s336_zep02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='zephaniah' AND ev.chapter_number=2 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zephaniah-2-the-coast-for-the-remnant-of-the-house-of-yahudah',
       E'The coast for the remnant of the house of Yahudah — captivity turned away, the remnant restored',
       E'The judgment on Philistia clears the seacoast for Yahuah''s people: *For Gaza shall be forsaken, and Ashkelon a desolation... and Ekron shall be rooted up* (Zephaniah 2:4); *And the coast shall be for the remnant of the house of Yahudah (Judah); they shall feed thereupon: in the houses of Ashkelon shall they lie down in the evening: for Yahuah (LORD) their Elohim (God) shall visit them, and turn away their captivity* (2:7). The land of the enemy becomes the remnant''s inheritance, and the captivity is turned away — Yahuah visits HIS people and gathers them home. This is the remnant Paul confirms still stands: *Even so then at this present time also there is a remnant according to the election of grace* (Romans 11:5). Never a casting-off of the people — *Hath Elohim (God) cast away his people? Elohim (God) forbid* (Romans 11:1) — always a remnant preserved and restored. The seacoast for the remnant of Yahudah is the pledge that Yahuah turns away the captivity of those who are his.',
       sv.verse_id, ev.verse_id, 'free', 45623
  FROM _s336_zep02_lookup sv, _s336_zep02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=2 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='zephaniah' AND ev.chapter_number=2 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zephaniah-2-men-shall-worship-him-every-one-from-his-place',
       E'He will famish all the gods of the earth — men shall worship him, every one from his place',
       E'Moab and Ammon reproached *my people* and magnified themselves against the border (Zephaniah 2:8-10), and the verdict widens from those two nations to the whole earth: *Yahuah (LORD) will be terrible unto them: for he will famish all the gods of the earth; and men shall worship him, every one from his place, even all the isles of the heathen* (2:11). The idols are starved to nothing — *the idols he shall utterly abolish* (Isaiah 2:18) — and the worship of Yahuah rises from every place: *in every place incense shall be offered unto my name, and a pure offering: for my name shall be great among the heathen* (Malachi 1:11). This is the hour Yahusha (Jesus) announces to the woman at the well: *the hour cometh, when ye shall neither in this mountain, nor yet at Jerusalem, worship the Father* (John 4:21); *the true worshippers shall worship the Father in spirit and in truth: for the Father seeketh such to worship him* (John 4:23). And it is consummated in the song of the redeemed: *all nations shall come and worship before thee; for thy judgments are made manifest* (Revelation 15:4). The famished gods give way; from every place, from all the isles of the heathen, men worship Yahuah alone.',
       sv.verse_id, ev.verse_id, 'free', 45626
  FROM _s336_zep02_lookup sv, _s336_zep02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=2 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='zephaniah' AND ev.chapter_number=2 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zephaniah-2-i-am-and-there-is-none-beside-me-the-careless-city',
       E'I am, and there is none beside me — the careless city''s boast, brought to desolation',
       E'Yahuah stretches his hand against the north: *and destroy Assyria; and will make Nineveh a desolation, and dry like a wilderness* (Zephaniah 2:13). The proud capital is laid waste, and her sin is named: *This is the rejoicing city that dwelt carelessly, that said in her heart, I am, and there is none beside me: how is she become a desolation, a place for beasts to lie down in! every one that passeth by her shall hiss, and wag his hand* (2:15). Her boast steals Yahuah''s own self-declaration — for *I am Yahuah (LORD), and there is none else, there is no Elohim (God) beside me* (Isaiah 45:5); *there is none beside me. I am Yahuah (LORD), and there is none else* (Isaiah 45:6). To say *I am, and there is none beside me* in the heart of a city is to usurp the very being and singularity that belong to Yahuah alone. Babylon spoke the identical blasphemy: *thou that... dwellest carelessly, that sayest in thine heart, I am, and none else beside me* (Isaiah 47:8), *thou hast said in thine heart, I am, and none else beside me* (47:10); and Revelation''s harlot-city: *she saith in her heart, I sit a queen, and am no widow, and shall see no sorrow* (Revelation 18:7). The careless security ends in ruin — *Nineveh is laid waste: who will bemoan her?* (Nahum 3:7). And the reversal is the meek of this very chapter: *Yahuah (God) has cast down the thrones of proud princes, and set up the meek in their stead* (Ecclesiasticus 10:14). The proud city that said *I am* is made a desolation; the meek who sought Yahuah inherit the earth.',
       sv.verse_id, ev.verse_id, 'extras', 45629
  FROM _s336_zep02_lookup sv, _s336_zep02_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=2 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='zephaniah' AND ev.chapter_number=2 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *Blessed are the meek: for they shall inherit the earth* (Matthew 5:5) — Yahusha pronounces the very blessing of the *meek of the earth* called to seek Yahuah (Zephaniah 2:3).'
  FROM cross_reference_threads t
  JOIN _s336_zep02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=2 AND sv.verse_number=3
  JOIN _s336_zep02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-2-seek-yahuah-seek-righteousness-seek-meekness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *the meek shall inherit the earth; and shall delight themselves in the abundance of peace* (Psalm 37:11) — the inheritance of the meek Zephaniah calls to seek (2:3).'
  FROM cross_reference_threads t
  JOIN _s336_zep02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=2 AND sv.verse_number=3
  JOIN _s336_zep02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-2-seek-yahuah-seek-righteousness-seek-meekness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Seek Yahuah (LORD), and ye shall live* (Amos 5:6) — to seek Yahuah (Zephaniah 2:3) is to live, the alternative being the unquenched fire of his anger.'
  FROM cross_reference_threads t
  JOIN _s336_zep02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=2 AND sv.verse_number=3
  JOIN _s336_zep02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-2-seek-yahuah-seek-righteousness-seek-meekness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Seek ye Yahuah (LORD) while he may be found, call ye upon him while he is near* (Isaiah 55:6) — the urgent window for the seeking of Zephaniah 2:3, before the decree brings forth.'
  FROM cross_reference_threads t
  JOIN _s336_zep02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=2 AND sv.verse_number=3
  JOIN _s336_zep02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-2-seek-yahuah-seek-righteousness-seek-meekness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*let him return unto Yahuah (LORD)... for he will abundantly pardon* (Isaiah 55:7) — to *seek righteousness, seek meekness* (Zephaniah 2:3) is to forsake the wicked way and return to mercy.'
  FROM cross_reference_threads t
  JOIN _s336_zep02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=2 AND sv.verse_number=3
  JOIN _s336_zep02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=55 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-2-seek-yahuah-seek-righteousness-seek-meekness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *in the time of trouble he shall hide me in his pavilion: in the secret of his tabernacle shall he hide me* (Psalm 27:5) — the hiding-place of *it may be ye shall be hid in the day of the LORD''S anger* (Zephaniah 2:3).'
  FROM cross_reference_threads t
  JOIN _s336_zep02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=2 AND sv.verse_number=3
  JOIN _s336_zep02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=27 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-2-seek-yahuah-seek-righteousness-seek-meekness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *He that dwelleth in the secret place of the El Elyon (most High) shall abide under the shadow of the Almighty* (Psalm 91:1) — to be hid in the day of anger (Zephaniah 2:3) is to dwell in Yahuah''s secret place.'
  FROM cross_reference_threads t
  JOIN _s336_zep02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=2 AND sv.verse_number=3
  JOIN _s336_zep02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=91 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-2-seek-yahuah-seek-righteousness-seek-meekness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *They that fear Yahuah (God) will prepare their hearts, and humble their souls in his sight* (Ecclesiasticus 2:17) — the restored witness names the meekness of *seek meekness* (Zephaniah 2:3): souls humbled before Yahuah.'
  FROM cross_reference_threads t
  JOIN _s336_zep02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=2 AND sv.verse_number=3
  JOIN _s336_zep02_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=2 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-2-seek-yahuah-seek-righteousness-seek-meekness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 9, E'★ *they that love him shall be filled with the law* (Ecclesiasticus 2:16) — the remnant *which have wrought his judgment* (Zephaniah 2:3) are the doers filled with the Torah, not freed from it.'
  FROM cross_reference_threads t
  JOIN _s336_zep02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=2 AND sv.verse_number=3
  JOIN _s336_zep02_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=2 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-2-seek-yahuah-seek-righteousness-seek-meekness'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *even so then at this present time also there is a remnant according to the election of grace* (Romans 11:5) — the remnant of *the coast shall be for the remnant of the house of Yahudah* (Zephaniah 2:7), captivity turned away, never a cast-off people.'
  FROM cross_reference_threads t
  JOIN _s336_zep02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=2 AND sv.verse_number=7
  JOIN _s336_zep02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-2-the-coast-for-the-remnant-of-the-house-of-yahudah'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *the hour cometh, when ye shall neither in this mountain, nor yet at Jerusalem, worship the Father* (John 4:21) — Yahusha announces the *every one from his place* worship of Zephaniah 2:11.'
  FROM cross_reference_threads t
  JOIN _s336_zep02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s336_zep02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=4 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-2-men-shall-worship-him-every-one-from-his-place'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *the true worshippers shall worship the Father in spirit and in truth* (John 4:23) — when *men shall worship him, every one from his place* (Zephaniah 2:11), it is the true worshippers from every place.'
  FROM cross_reference_threads t
  JOIN _s336_zep02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s336_zep02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=4 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-2-men-shall-worship-him-every-one-from-his-place'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *all nations shall come and worship before thee; for thy judgments are made manifest* (Revelation 15:4) — the consummation of *all the isles of the heathen* worshipping Yahuah (Zephaniah 2:11).'
  FROM cross_reference_threads t
  JOIN _s336_zep02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s336_zep02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=15 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-2-men-shall-worship-him-every-one-from-his-place'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *in every place incense shall be offered unto my name... my name shall be great among the heathen* (Malachi 1:11) — Malachi''s same vision of worship from every place (Zephaniah 2:11).'
  FROM cross_reference_threads t
  JOIN _s336_zep02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s336_zep02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=1 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-2-men-shall-worship-him-every-one-from-his-place'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *And the idols he shall utterly abolish* (Isaiah 2:18) — the famishing of *all the gods of the earth* (Zephaniah 2:11) is Isaiah''s utter abolishing of the idols.'
  FROM cross_reference_threads t
  JOIN _s336_zep02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=2 AND sv.verse_number=11
  JOIN _s336_zep02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=2 AND tv.verse_number=18
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-2-men-shall-worship-him-every-one-from-his-place'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *that dwellest carelessly, that sayest in thine heart, I am, and none else beside me* (Isaiah 47:8) — Babylon''s identical boast to Nineveh''s *I am, and there is none beside me* (Zephaniah 2:15).'
  FROM cross_reference_threads t
  JOIN _s336_zep02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=2 AND sv.verse_number=15
  JOIN _s336_zep02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=47 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-2-i-am-and-there-is-none-beside-me-the-careless-city'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★ *thou hast said in thine heart, I am, and none else beside me* (Isaiah 47:10) — the careless city''s heart-boast (Zephaniah 2:15) is Babylon''s word for word.'
  FROM cross_reference_threads t
  JOIN _s336_zep02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=2 AND sv.verse_number=15
  JOIN _s336_zep02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=47 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-2-i-am-and-there-is-none-beside-me-the-careless-city'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *I am Yahuah (LORD), and there is none else, there is no Elohim (God) beside me* (Isaiah 45:5) — the self-declaration the proud city stole (Zephaniah 2:15) belongs to Yahuah alone.'
  FROM cross_reference_threads t
  JOIN _s336_zep02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=2 AND sv.verse_number=15
  JOIN _s336_zep02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-2-i-am-and-there-is-none-beside-me-the-careless-city'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *there is none beside me. I am Yahuah (LORD), and there is none else* (Isaiah 45:6) — the precise blasphemy: Nineveh claims the being and singularity that is Yahuah''s alone (Zephaniah 2:15).'
  FROM cross_reference_threads t
  JOIN _s336_zep02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=2 AND sv.verse_number=15
  JOIN _s336_zep02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-2-i-am-and-there-is-none-beside-me-the-careless-city'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *she saith in her heart, I sit a queen, and am no widow, and shall see no sorrow* (Revelation 18:7) — the careless city''s false security (Zephaniah 2:15) is Revelation''s self-glorifying harlot-city.'
  FROM cross_reference_threads t
  JOIN _s336_zep02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=2 AND sv.verse_number=15
  JOIN _s336_zep02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=18 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-2-i-am-and-there-is-none-beside-me-the-careless-city'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *Nineveh is laid waste: who will bemoan her?* (Nahum 3:7) — Nahum''s word over the same city: *how is she become a desolation* (Zephaniah 2:15), none to bemoan her.'
  FROM cross_reference_threads t
  JOIN _s336_zep02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=2 AND sv.verse_number=15
  JOIN _s336_zep02_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='nahum' AND tv.chapter_number=3 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-2-i-am-and-there-is-none-beside-me-the-careless-city'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *Yahuah (God) has cast down the thrones of proud princes, and set up the meek in their stead* (Ecclesiasticus 10:14) — the proud city''s desolation (Zephaniah 2:15) is the meek''s inheritance, binding back to the meek of 2:3.'
  FROM cross_reference_threads t
  JOIN _s336_zep02_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=2 AND sv.verse_number=15
  JOIN _s336_zep02_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=10 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-2-i-am-and-there-is-none-beside-me-the-careless-city'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_zephaniah_3.sql (Zephaniah 3) -----
-- Chapter: Zephaniah 3 — THE BOOK'S CLOSE: the corrupt city judged, then the great turning to
-- restoration. The just Yahuah in the midst who FAILETH NOT (3:5); ★★★ I will turn to the people a
-- PURE LANGUAGE, that they may all call upon the NAME of Yahuah with one consent (3:9 — Babel
-- reversed, Pentecost foreshadowed); the meek poor remnant who trust the Name and have NO GUILE in
-- their mouth (3:12-13); ★★★ the King of Yashar'el, EVEN YAHUAH, in the midst — who rejoices over his
-- people WITH SINGING (3:14-17 — the Formed-Son King who has a Father); and the closing two-house
-- gathering of the driven-out, made a name and a praise (3:19-20). The book turns from wrath to the
-- joy of the redeemed.
-- Tag: zep03   Temp view: _s336_zep03_lookup
-- Sort band: base 45640, step 3 -> threads at 45640, 45643, 45646, 45649, 45652, 45655, 45658 (7 threads)
-- Source of EVERY row: 'canon','zephaniah',3,v
--
-- Zephaniah 3 coverage:
--   v.1-3 (Woe to her that is filthy... her princes... roaring lions; her judges... evening wolves)
--        NT:     none warranted (the lawsuit-indictment is preface; the Torah-violence of v.4 carries it)
--        Extras: none warranted
--        Tanakh: woven into THREAD 1 prose; the corrupt-shepherd indictment held with v.4
--   v.4 (her priests have polluted the sanctuary, they have done violence to the law)
--        NT:     none warranted distinct (Torah-affirmed-and-violated weave is OT covenant-lawsuit)
--        Extras: none warranted
--        Tanakh: ★ Ezekiel 22:26 (Her priests have violated my law... put no difference between the
--                holy and profane) — THREAD 1 (Torah affirmed; the corrupt do violence to it)
--   ★ v.5 (The just Yahuah is in the midst thereof; he will not do iniquity: every morning doth he
--          bring his judgment to light, he faileth not)
--        NT:     none warranted distinct (the righteous-faithful Yahuah is sung across the Tanakh)
--        Extras: none warranted
--        Tanakh: ★ Deuteronomy 32:4 (a Elohim of truth and without iniquity, just and right is he),
--                ★ Lamentations 3:22-23 (his compassions fail not... new every morning), Psalm 92:15
--                (Yahuah is upright... no unrighteousness in him) — THREAD 2
--   ★★★ v.9 (then will I turn to the people a pure language, that they may all call upon the name of
--          Yahuah, to serve him with one consent) + v.10 (suppliants beyond Ethiopia bring offering)
--        NT:     ★★★ Acts 2:4 (filled with the Ruach HaKodesh, began to speak with other tongues),
--                ★★ Acts 2:11 (we do hear them speak in our tongues the wonderful works of Elohim),
--                ★★ Romans 10:13 (whosoever shall call upon the name of Yahuah shall be saved) — THREAD 3
--        Extras: ★ Tobit 13:11 (Many nations shall come from far to the name of Yahuah with gifts),
--                ★ Tobit 14:6 (all nations shall turn, and fear Yahuah truly) — THREAD 3
--        Tanakh: ★★★ Genesis 11:9 (Yahuah did there confound the language of all the earth) — Babel,
--                the thing reversed; ★ Joel 2:32 (whosoever shall call on the name of Yahuah shall be
--                delivered); Isaiah 6:5 (a man of unclean lips... a people of unclean lips) — THREAD 3
--   ★★ v.11-13 (an afflicted and poor people, and they shall trust in the name of Yahuah. The remnant
--          of Yashar'el shall not do iniquity... neither shall a deceitful tongue be found in their mouth)
--        NT:     ★★ Revelation 14:5 (in their mouth was found no guile), ★ John 1:47 (an Israelite
--                indeed, in whom is no guile), 1 Peter 2:22 (neither was guile found in his mouth),
--                ★ Romans 11:5 (a remnant according to the election of grace) — THREAD 4
--        Extras: none warranted
--        Tanakh: ★ Micah 4:4 (none shall make them afraid), Ezekiel 34:28 (dwell safely, none shall
--                make them afraid) — THREAD 4 (the fed, unafraid remnant)
--   ★★★ v.14-15 (Sing, O daughter of Zion... the king of Yashar'el, even Yahuah, is in the midst of
--          thee: thou shalt not see evil any more)
--        NT:     ★★★ Matthew 21:5 (Behold, thy King cometh unto thee, meek), ★★ Revelation 21:3 (the
--                tabernacle of Elohim is with men... he will dwell with them) — THREAD 5
--        Extras: none warranted (the King-in-the-midst is the canon's own joy)
--        Tanakh: ★★★ Zechariah 9:9 (thy King cometh unto thee: he is just, and having salvation) — THREAD 5
--   ★★★ v.16-17 (Yahuah thy Elohim in the midst of thee is mighty; he will save, he will rejoice over
--          thee with joy... he will joy over thee with singing)
--        NT:     ★ Luke 15:7 (joy shall be in heaven over one sinner that repenteth), Luke 15:24 (this
--                my son was dead, and is alive again... and they began to be merry) — THREAD 6
--        Extras: none warranted
--        Tanakh: ★★ Isaiah 62:5 (as the bridegroom rejoiceth over the bride, so shall thy Elohim
--                rejoice over thee), ★ Isaiah 65:19 (I will rejoice in Jerusalem, and joy in my
--                people) — THREAD 6
--   v.18 (I will gather them that are sorrowful for the solemn assembly) — woven into THREAD 7 prose
--   ★★ v.19-20 (I will save her that halteth, and gather her that was driven out... I will make you a
--          name and a praise among all people... when I turn back your captivity)
--        NT:     ★ Romans 11:25-26 (blindness in part... until the fulness of the Gentiles be come in...
--                so all Yashar'el shall be saved) — THREAD 7
--        Extras: ★ Baruch 5:5 (behold your children gathered from the west to the east), ★ Baruch 5:9
--                (Yahuah shall lead Yashar'el with joy in the light of his glory) — THREAD 7
--        Tanakh: ★★ Micah 4:6-7 (I will assemble her that halteth... gather her that is driven out),
--                ★ Ezekiel 34:16 (bring again that which was driven away), ★ Deuteronomy 30:3-4
--                (gather thee from all the nations), ★ Isaiah 11:11-12 (assemble the outcasts of
--                Yashar'el... the dispersed of Yahudah) — THREAD 7
--
-- Threads (slug — target libraries):
--   1. zephaniah-3-her-priests-have-done-violence-to-the-law — Tanakh (Ezekiel 22) [free]
--      (the Torah AFFIRMED, violated by the corrupt priests; never the Torah at fault)
--   2. zephaniah-3-the-just-yahuah-in-the-midst-he-faileth-not — Tanakh (Deuteronomy 32, Lamentations 3, Psalm 92) [free]
--      (★ the righteous Yahuah present, never failing; new every morning)
--   3. zephaniah-3-a-pure-language-all-call-upon-the-name-with-one-consent — NT (Acts 2, Romans 10) + Tanakh (Genesis 11, Joel 2, Isaiah 6) + Extras (Tobit) [extras]
--      (★★★ THE KEYSTONE: the pure lip restored, Babel reversed → Pentecost, all call on the one Name)
--   4. zephaniah-3-the-remnant-no-guile-in-their-mouth — NT (Revelation 14, John 1, 1 Peter 2, Romans 11) + Tanakh (Micah 4, Ezekiel 34) [free]
--      (★★ the meek, truthful, unafraid remnant who trust the Name — no guile in their mouth)
--   5. zephaniah-3-the-king-of-yasharel-even-yahuah-in-the-midst — NT (Matthew 21, Revelation 21) + Tanakh (Zechariah 9) [free]
--      (★★★ the King — Yahuah Himself — in the midst; the Formed-Son King who has a Father)
--   6. zephaniah-3-he-will-rejoice-over-thee-with-singing — NT (Luke 15) + Tanakh (Isaiah 62, Isaiah 65) [free]
--      (★★★ Yahuah singing over his redeemed with joy; the bridegroom's joy, the joy over the found)
--   7. zephaniah-3-i-will-gather-her-that-was-driven-out — NT (Romans 11) + Tanakh (Micah 4, Ezekiel 34, Deuteronomy 30, Isaiah 11) + Extras (Baruch 5) [extras]
--      (★★ the closing two-house regathering of the driven-out; a name and a praise; NOT replacement)
--
-- Framing notes:
--   TORAH AFFIRMED (THREAD 1): *her priests have polluted the sanctuary, they have done violence to
--      the law* (3:4). The corruption is named as VIOLENCE done TO the Torah — the Torah is the
--      standard, the priests the offenders; never the Law at fault. Ezekiel's twin indictment: *Her
--      priests have violated my law, and have profaned mine holy things: they have put no difference
--      between the holy and profane* (Ezekiel 22:26). Covenant-lawsuit against corrupt shepherds,
--      conduct-within-the-covenant — victims, not enemies.
--   ★★★ THE PURE LANGUAGE / THE ONE NAME (THREAD 3, fullest treatment): *For then will I turn to the
--      people a pure language, that they may all call upon the name of Yahuah (LORD), to serve him
--      with one consent* (3:9). This is the deliberate reversal of Babel — *Yahuah (LORD) did there
--      confound the language of all the earth* (Genesis 11:9) — the scattered tongues gathered back
--      into one pure speech that calls on the one NAME. It begins at Pentecost: *they were all filled
--      with the Ruach HaKodesh (Holy Spirit), and began to speak with other tongues* (Acts 2:4), every
--      man hearing *in our tongues the wonderful works of Elohim (God)* (Acts 2:11) — Babel's
--      confusion undone, every tongue brought to the one Name. And the door is the Name: *whosoever
--      shall call on the name of Yahuah (LORD) shall be delivered* (Joel 2:32), *whosoever shall call
--      upon the name of Yahuah (Lord) shall be saved* (Romans 10:13). Isaiah's unclean-lips cleansing
--      (Isaiah 6:5) is the same purifying of the lip. The restored witness sees the nations streaming
--      to the Name: *Many nations shall come from far to the name of Yahuah (God) with gifts* (Tobit
--      13:11); *all nations shall turn, and fear Yahuah (God) truly* (Tobit 14:6).
--   ★★★ THE KING — EVEN YAHUAH — IN THE MIDST (THREAD 5, fullest treatment): *the king of Yashar'el
--      (Israel), even Yahuah (LORD), is in the midst of thee* (3:15). The King who comes is Yahuah
--      Himself — and Zechariah names how he comes: *behold, thy King cometh unto thee: he is just, and
--      having salvation; lowly, and riding upon an ass* (Zechariah 9:9), fulfilled at the gate:
--      *Behold, thy King cometh unto thee, meek* (Matthew 21:5). This is the Formed Son — the King who
--      is Yahuah and HAS a Father, the visible One drawn from the Formless; NOT co-equal trinitarian
--      persons, NOT a modalist collapse. The midst-dwelling consummates in *the tabernacle of Elohim
--      (God) is with men, and he will dwell with them* (Revelation 21:3).
--   ★★★ YAHUAH REJOICING WITH SINGING (THREAD 6): *Yahuah Elohayka (The LORD thy God) in the midst of
--      thee is mighty; he will save, he will rejoice over thee with joy; he will rest in his love, he
--      will joy over thee with singing* (3:17). Yahuah Himself the joy: *as the bridegroom rejoiceth
--      over the bride, so shall thy Elohim (God) rejoice over thee* (Isaiah 62:5); *I will rejoice in
--      Jerusalem, and joy in my people* (Isaiah 65:19). The same joy fills heaven over the found:
--      *joy shall be in heaven over one sinner that repenteth* (Luke 15:7), *this my son was dead, and
--      is alive again... and they began to be merry* (Luke 15:24).
--   ★★ NO GUILE / THE REMNANT (THREAD 4): *The remnant of Yashar'el (Israel) shall not do iniquity,
--      nor speak lies; neither shall a deceitful tongue be found in their mouth* (3:13). The redeemed
--      bear the Lamb's own mark: *in their mouth was found no guile* (Revelation 14:5) — as he is, so
--      they are (*neither was guile found in his mouth*, 1 Peter 2:22; *an Israelite indeed, in whom
--      is no guile*, John 1:47). The remnant stands by grace (*a remnant according to the election of
--      grace*, Romans 11:5), fed and unafraid (Micah 4:4; Ezekiel 34:28).
--   ★★ THE GATHERING HOME (THREAD 7, two-house): *I will save her that halteth, and gather her that
--      was driven out... I will make you a name and a praise among all people of the earth, when I
--      turn back your captivity* (3:19-20). This is the two-house ingathering, the scattered north and
--      the dispersed south — *assemble the outcasts of Yashar'el (Israel), and gather together the
--      dispersed of Yahudah (Judah)* (Isaiah 11:12); *I will assemble her that halteth... gather her
--      that is driven out* (Micah 4:6); *gather thee from all the nations* (Deuteronomy 30:3). NOT
--      replacement: *so all Yashar'el (Israel) shall be saved* (Romans 11:26). The restored witness
--      sings the homecoming: *behold your children gathered from the west to the east* (Baruch 5:5).
--   EXTRAS: Tobit 13:11 / 14:6 (nations to the Name) and Baruch 5:5 / 5:9 (the gathering home) — clean
--      witnesses, parses verified.
--   VERSES WITH NO SEPARATE ADD: v.1-3 (the lawsuit-indictment — preface to the Torah-violence of v.4,
--      THREAD 1), v.6-8 (the cut-off nations / wait-for-the-day-of-gathering — the hinge into the
--      restoration, woven into prose), v.10 (suppliants bring offering — bound with v.9 in THREAD 3),
--      v.11 (the haughty taken away — preface to the meek remnant, THREAD 4), v.16 (Fear thou not —
--      bound with v.17 in THREAD 6), v.18 (gather them that are sorrowful — bound with v.19-20 in
--      THREAD 7). All recorded, none silently skipped.

CREATE TEMP VIEW _s336_zep03_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1: violence to the Torah (Torah affirmed, violated by corrupt priests)
    ('canon','zephaniah',3,4,'canon','ezekiel',22,26,'free',
      E'*Her priests have violated my law, and have profaned mine holy things: they have put no difference between the holy and profane, neither have they shewed difference between the unclean and the clean, and have hid their eyes from my sabbaths, and I am profaned among them* (Ezekiel 22:26). Zephaniah''s charge that *her priests have polluted the sanctuary, they have done violence to the law* (Zephaniah 3:4) is Ezekiel''s charge word for word: the Torah is the standard, and the priests are the offenders who do *violence* to it. Never the Law at fault — covenant-lawsuit against corrupt shepherds, the Torah affirmed by the very indictment of those who profane it.'),

    -- THREAD 2: the just Yahuah in the midst, he faileth not
    ('canon','zephaniah',3,5,'canon','deuteronomy',32,4,'free',
      E'*He is the Rock, his work is perfect: for all his ways are judgment: a Elohim (God) of truth and without iniquity, just and right is he* (Deuteronomy 32:4). The *just Yahuah (LORD)* who *is in the midst thereof; he will not do iniquity* (Zephaniah 3:5) is the Rock of the Song of Moses — *a Elohim (God) of truth and without iniquity, just and right is he*. The same righteousness that *will not do iniquity* stands in the midst of his people, never failing.'),
    ('canon','zephaniah',3,5,'canon','lamentations',3,22,'free',
      E'*It is of the LORD''S mercies that we are not consumed, because his compassions fail not* (Lamentations 3:22). Zephaniah''s *every morning doth he bring his judgment to light, he faileth not* (Zephaniah 3:5) is the very hope of Lamentations: *his compassions fail not*. The One in the midst does not fail — his mercy holds even through the judgment.'),
    ('canon','zephaniah',3,5,'canon','lamentations',3,23,'free',
      E'*They are new every morning: great is thy faithfulness* (Lamentations 3:23). The judgment Yahuah brings to light *every morning* (Zephaniah 3:5) is matched by the mercy that is *new every morning*: the faithful One who *faileth not* renews his compassion with each dawn. *Great is thy faithfulness.*'),
    ('canon','zephaniah',3,5,'canon','psalms',92,15,'free',
      E'*To shew that Yahuah (LORD) is upright: he is my rock, and there is no unrighteousness in him* (Psalm 92:15). The *just Yahuah (LORD)* who *will not do iniquity* (Zephaniah 3:5) is the upright Rock the Psalm proclaims — *there is no unrighteousness in him*. The righteous One in the midst does no wrong; the unjust, by contrast, *knoweth no shame*.'),

    -- THREAD 3 (★★★): a pure language, all call on the Name — Babel reversed, Pentecost
    ('canon','zephaniah',3,9,'canon','genesis',11,9,'free',
      E'*Therefore is the name of it called Babel; because Yahuah (LORD) did there confound the language of all the earth: and from thence did Yahuah (LORD) scatter them abroad upon the face of all the earth* (Genesis 11:9). Zephaniah''s *I will turn to the people a pure language, that they may all call upon the name of Yahuah (LORD), to serve him with one consent* (Zephaniah 3:9) is the deliberate undoing of Babel: the tongues Yahuah *confound*ed and the people he *scatter*ed are gathered back into one pure speech that calls on the one Name. What was broken at Babel is healed in the pure language.'),
    ('canon','zephaniah',3,9,'canon','acts',2,4,'free',
      E'*And they were all filled with the Ruach HaKodesh (Holy Spirit), and began to speak with other tongues, as the Spirit gave them utterance* (Acts 2:4). The *pure language* by which *they may all call upon the name of Yahuah (LORD)* (Zephaniah 3:9) begins at Pentecost, where the Spirit gives the tongues that reverse Babel — the scattered speech drawn back to the one Name by the Ruach HaKodesh.'),
    ('canon','zephaniah',3,9,'canon','acts',2,11,'free',
      E'*Cretes and Arabians, we do hear them speak in our tongues the wonderful works of Elohim (God)* (Acts 2:11). Every nation hearing the wonders of Elohim *in our tongues* is the *pure language* promised — *that they may all call upon the name of Yahuah (LORD), to serve him with one consent* (Zephaniah 3:9). Babel''s confusion is undone: not one speech imposed, but every tongue brought to call on the one Name with one consent.'),
    ('canon','zephaniah',3,9,'canon','joel',2,32,'free',
      E'*And it shall come to pass, that whosoever shall call on the name of Yahuah (LORD) shall be delivered: for in mount Zion and in Jerusalem shall be deliverance, as Yahuah (LORD) hath said, and in the remnant whom Yahuah (LORD) shall call* (Joel 2:32). The pure lip is given so that *they may all call upon the name of Yahuah (LORD)* (Zephaniah 3:9) — and the calling is the door of deliverance: *whosoever shall call on the name of Yahuah (LORD) shall be delivered*. The one Name, called upon with one consent, saves.'),
    ('canon','zephaniah',3,9,'canon','romans',10,13,'free',
      E'*For whosoever shall call upon the name of Yahuah (Lord) shall be saved* (Romans 10:13). The promise that all *call upon the name of Yahuah (LORD)* (Zephaniah 3:9) is the gospel''s own door: *whosoever shall call upon the name of Yahuah (Lord) shall be saved*. The pure language restores the lips that call the one Name — and that calling is salvation.'),
    ('canon','zephaniah',3,9,'canon','isaiah',6,5,'free',
      E'*Then said I, Woe is me! for I am undone; because I am a man of unclean lips, and I dwell in the midst of a people of unclean lips: for mine eyes have seen the King, Yahuah Tseva''ot (LORD of hosts)* (Isaiah 6:5). The *pure language* Yahuah turns to the people (Zephaniah 3:9) is the cleansing of the *unclean lips* Isaiah confessed: the defiled lip purged so that the mouth may call rightly on the Name. The same purifying of speech, that all may serve with one consent.'),
    ('canon','zephaniah',3,9,'apocrypha','tobit',13,11,'extras',
      E'*Many nations shall come from far to the name of Yahuah (God) with gifts in their hands, even gifts to the King of heaven; all generations shall praise you with great joy* (Tobit 13:11). The restored witness sees the very thing Zephaniah promised — that all peoples *call upon the name of Yahuah (LORD)* (Zephaniah 3:9): *many nations shall come from far to the name of Yahuah (God)*. The nations streaming to the one Name with praise.'),
    ('canon','zephaniah',3,9,'apocrypha','tobit',14,6,'extras',
      E'*And all nations shall turn, and fear Yahuah (God) truly, and shall bury their idols* (Tobit 14:6). The pure language given so that *they may all call upon the name of Yahuah (LORD), to serve him with one consent* (Zephaniah 3:9) is the turning of all nations: *all nations shall turn, and fear Yahuah (God) truly*, their idols buried. The one Name served with one consent.'),

    -- THREAD 4 (★★): the meek remnant, no guile in their mouth
    ('canon','zephaniah',3,13,'canon','revelation',14,5,'free',
      E'*And in their mouth was found no guile: for they are without fault before the throne of Elohim (God)* (Revelation 14:5). Zephaniah''s remnant — *neither shall a deceitful tongue be found in their mouth* (Zephaniah 3:13) — is the redeemed who bear the Lamb''s own mark: *in their mouth was found no guile*. The truthful remnant that *shall not do iniquity, nor speak lies* stands faultless before the throne.'),
    ('canon','zephaniah',3,13,'canon','john',1,47,'free',
      E'*Yahusha (Jesus) saw Nathanael coming to him, and saith of him, Behold an Israelite indeed, in whom is no guile!* (John 1:47). The remnant in whom *neither shall a deceitful tongue be found* (Zephaniah 3:13) is the *Israelite indeed, in whom is no guile* — the true Yashar''el (Israel) marked by the guileless mouth Yahusha himself names and commends.'),
    ('canon','zephaniah',3,13,'canon','1-peter',2,22,'free',
      E'*Who did no sin, neither was guile found in his mouth* (1 Peter 2:22). The remnant whose mouth holds no *deceitful tongue* (Zephaniah 3:13) bears the very mark of the Messiah: *neither was guile found in his mouth*. As he is, so are they — the guileless people conformed to the guileless King.'),
    ('canon','zephaniah',3,12,'canon','romans',11,5,'free',
      E'*Even so then at this present time also there is a remnant according to the election of grace* (Romans 11:5). The *afflicted and poor people* Yahuah leaves *in the midst of thee* who *shall trust in the name of Yahuah (LORD)* (Zephaniah 3:12) is the remnant Paul confirms still stands: *a remnant according to the election of grace*. The meek who trust the Name are the preserved remnant — never a cast-off people.'),
    ('canon','zephaniah',3,13,'canon','micah',4,4,'free',
      E'*But they shall sit every man under his vine and under his fig tree; and none shall make them afraid: for the mouth of Yahuah Tseva''ot (LORD of hosts) hath spoken it* (Micah 4:4). The remnant that *shall feed and lie down, and none shall make them afraid* (Zephaniah 3:13) is Micah''s same secure people: *every man under his vine and under his fig tree; and none shall make them afraid*. The fed, unafraid remnant — Yahuah''s own word over them.'),
    ('canon','zephaniah',3,13,'canon','ezekiel',34,28,'free',
      E'*And they shall no more be a prey to the heathen, neither shall the beast of the land devour them; but they shall dwell safely, and none shall make them afraid* (Ezekiel 34:28). Zephaniah''s remnant *shall feed and lie down, and none shall make them afraid* (Zephaniah 3:13) — exactly Ezekiel''s flock under the true Shepherd: *they shall dwell safely, and none shall make them afraid*. The gathered remnant fed and secure.'),

    -- THREAD 5 (★★★): the King of Yashar'el, even Yahuah, in the midst
    ('canon','zephaniah',3,15,'canon','zechariah',9,9,'free',
      E'*Rejoice greatly, O daughter of Zion; shout, O daughter of Jerusalem: behold, thy King cometh unto thee: he is just, and having salvation; lowly, and riding upon an ass, and upon a colt the foal of an ass* (Zechariah 9:9). Zephaniah''s *Sing, O daughter of Zion... the king of Yashar''el (Israel), even Yahuah (LORD), is in the midst of thee* (Zephaniah 3:14-15) is Zechariah''s same daughter-of-Zion summons: *behold, thy King cometh unto thee*. The King is Yahuah Himself — and he comes *just, and having salvation; lowly*.'),
    ('canon','zephaniah',3,15,'canon','matthew',21,5,'free',
      E'*Tell ye the daughter of Sion, Behold, thy King cometh unto thee, meek, and sitting upon an ass, and a colt the foal of an ass* (Matthew 21:5). The *king of Yashar''el (Israel), even Yahuah (LORD)* in the midst (Zephaniah 3:15) comes to the gate: *Behold, thy King cometh unto thee, meek*. This is the Formed Son — the King who is Yahuah and HAS a Father, the visible One drawn from the Formless; not co-equal persons, not a modalist collapse, but the King come to his rejoicing people.'),
    ('canon','zephaniah',3,15,'canon','revelation',21,3,'free',
      E'*And I heard a great voice out of heaven saying, Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God)* (Revelation 21:3). The promise that *Yahuah (LORD)... is in the midst of thee* (Zephaniah 3:15) consummates in the New Jerusalem: *the tabernacle of Elohim (God) is with men, and he will dwell with them*. The King in the midst dwells forever with his people.'),

    -- THREAD 6 (★★★): Yahuah rejoicing over his people with singing
    ('canon','zephaniah',3,17,'canon','isaiah',62,5,'free',
      E'*For as a young man marrieth a virgin, so shall thy sons marry thee: and as the bridegroom rejoiceth over the bride, so shall thy Elohim (God) rejoice over thee* (Isaiah 62:5). Zephaniah''s *he will rejoice over thee with joy... he will joy over thee with singing* (Zephaniah 3:17) is Isaiah''s bridegroom-joy: *as the bridegroom rejoiceth over the bride, so shall thy Elohim (God) rejoice over thee*. Yahuah Himself is the One who rejoices — over his own redeemed people.'),
    ('canon','zephaniah',3,17,'canon','isaiah',65,19,'free',
      E'*And I will rejoice in Jerusalem, and joy in my people: and the voice of weeping shall be no more heard in her, nor the voice of crying* (Isaiah 65:19). The promise *he will rejoice over thee with joy... he will joy over thee with singing* (Zephaniah 3:17) is Isaiah''s same divine gladness: *I will rejoice in Jerusalem, and joy in my people*. Where Yahuah rejoices over his people, weeping is heard no more — *thou shalt not see evil any more* (Zephaniah 3:15).'),
    ('canon','zephaniah',3,17,'canon','luke',15,7,'free',
      E'*I say unto you, that likewise joy shall be in heaven over one sinner that repenteth, more than over ninety and nine just persons, which need no repentance* (Luke 15:7). The joy of the One who *will rejoice over thee with joy... will joy over thee with singing* (Zephaniah 3:17) is the heaven-filling joy over the found: *joy shall be in heaven over one sinner that repenteth*. The Father''s singing joy over the restored.'),
    ('canon','zephaniah',3,17,'canon','luke',15,24,'free',
      E'*For this my son was dead, and is alive again; he was lost, and is found. And they began to be merry* (Luke 15:24). The singing joy of Yahuah over his people (Zephaniah 3:17) is the father''s joy over the returned son: *this my son was dead, and is alive again; he was lost, and is found*. The mirth over the homecoming is the very joy Zephaniah promises — Yahuah rejoicing over the gathered.'),

    -- THREAD 7 (★★): the gathering home, two-house
    ('canon','zephaniah',3,19,'canon','micah',4,6,'free',
      E'*In that day, saith Yahuah (LORD), will I assemble her that halteth, and I will gather her that is driven out, and her that I have afflicted* (Micah 4:6). Zephaniah''s closing promise — *I will save her that halteth, and gather her that was driven out* (Zephaniah 3:19) — is Micah''s same regathering word for word: *I will assemble her that halteth, and I will gather her that is driven out*. The lame and the driven-out gathered home.'),
    ('canon','zephaniah',3,19,'canon','micah',4,7,'free',
      E'*And I will make her that halted a remnant, and her that was cast far off a strong nation: and Yahuah (LORD) shall reign over them in mount Zion from henceforth, even for ever* (Micah 4:7). The *her that halteth* whom Yahuah saves (Zephaniah 3:19) becomes Micah''s *remnant... a strong nation*: the gathered lame made the kingdom over which *Yahuah (LORD) shall reign... for ever*. The regathering ends in the everlasting reign.'),
    ('canon','zephaniah',3,19,'canon','ezekiel',34,16,'free',
      E'*I will seek that which was lost, and bring again that which was driven away, and will bind up that which was broken, and will strengthen that which was sick: but I will destroy the fat and the strong; I will feed them with judgment* (Ezekiel 34:16). Yahuah''s pledge to *save her that halteth, and gather her that was driven out* (Zephaniah 3:19) is the true Shepherd''s own work: *bring again that which was driven away... bind up that which was broken*. The driven-out flock sought and gathered by Yahuah Himself.'),
    ('canon','zephaniah',3,20,'canon','deuteronomy',30,3,'free',
      E'*That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee* (Deuteronomy 30:3). Zephaniah''s *when I turn back your captivity before your eyes* (Zephaniah 3:20) is the Torah''s own restoration promise: *Yahuah Elohayka (the LORD thy God) will turn thy captivity... and will return and gather thee from all the nations*. The captivity turned, the scattered gathered — the covenant''s own pledge.'),
    ('canon','zephaniah',3,20,'canon','isaiah',11,12,'free',
      E'*And he shall set up an ensign for the nations, and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth* (Isaiah 11:12). The promise *I will make you a name and a praise among all people of the earth, when I turn back your captivity* (Zephaniah 3:20) is the two-house ingathering: *the outcasts of Yashar''el (Israel)* and *the dispersed of Yahudah (Judah)* assembled from the four corners. Both houses gathered home — never replacement.'),
    ('canon','zephaniah',3,20,'canon','romans',11,25,'free',
      E'*For I would not, brethren, that ye should be ignorant of this mystery, lest ye should be wise in your own conceits; that blindness in part is happened to Yashar''el (Israel), until the fulness of the Gentiles be come in* (Romans 11:25). The turning-back of *your captivity* (Zephaniah 3:20) is the mystery Paul guards: the blindness is *in part*, with an end, *and so all Yashar''el (Israel) shall be saved* (Romans 11:26). The gathering home is the restoration of the scattered house of Yashar''el — not a people cast off, but a captivity turned.'),
    ('canon','zephaniah',3,20,'apocrypha','baruch-with-the-letter-of-jeremiah',5,5,'extras',
      E'*Arise, O Jerusalem, and stand on high, and look about toward the east, and behold your children gathered from the west to the east by the word of the Holy One, rejoicing in the remembrance of Yahuah (God)* (Baruch 5:5). The restored witness sings Zephaniah''s homecoming — *I will... gather you... when I turn back your captivity* (Zephaniah 3:20): *behold your children gathered from the west to the east... rejoicing in the remembrance of Yahuah (God)*. The driven-out children brought home.'),
    ('canon','zephaniah',3,20,'apocrypha','baruch-with-the-letter-of-jeremiah',5,9,'extras',
      E'*For Yahuah (God) shall lead Yashar''el (Israel) with joy in the light of his glory with the mercy and righteousness that comes from him* (Baruch 5:9). The captivity turned and the gathered made *a name and a praise* (Zephaniah 3:20) is the joyful procession home: *Yahuah (God) shall lead Yashar''el (Israel) with joy in the light of his glory*. The gathering home is led by Yahuah Himself, in mercy and righteousness.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s336_zep03_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s336_zep03_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- THREAD 1
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zephaniah-3-her-priests-have-done-violence-to-the-law',
       E'Her priests have done violence to the law — the Torah affirmed, the corrupt condemned',
       E'The book''s close opens with a covenant-lawsuit against the corrupt city: *Woe to her that is filthy and polluted, to the oppressing city! She obeyed not the voice; she received not correction; she trusted not in Yahuah (LORD); she drew not near to her Elohim (God). Her princes within her are roaring lions; her judges are evening wolves... Her prophets are light and treacherous persons: her priests have polluted the sanctuary, they have done violence to the law* (Zephaniah 3:1-4). The charge is named precisely: the corruption is *violence* done TO the Torah — the Torah is the standard, the priests are the offenders. Ezekiel''s twin indictment is the same: *Her priests have violated my law, and have profaned mine holy things: they have put no difference between the holy and profane, neither have they shewed difference between the unclean and the clean, and have hid their eyes from my sabbaths, and I am profaned among them* (Ezekiel 22:26). Never the Law at fault — the Torah is affirmed by the very lawsuit that condemns those who profane it. Covenant-lawsuit against corrupt shepherds, conduct-within-the-covenant; victims, not enemies.',
       sv.verse_id, ev.verse_id, 'free', 45640
  FROM _s336_zep03_lookup sv, _s336_zep03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='zephaniah' AND ev.chapter_number=3 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zephaniah-3-the-just-yahuah-in-the-midst-he-faileth-not',
       E'The just Yahuah is in the midst — he faileth not',
       E'Against the corrupt princes, judges, prophets, and priests stands the One who never fails: *The just Yahuah (LORD) is in the midst thereof; he will not do iniquity: every morning doth he bring his judgment to light, he faileth not; but the unjust knoweth no shame* (Zephaniah 3:5). He is the Rock of the Song of Moses: *He is the Rock, his work is perfect: for all his ways are judgment: a Elohim (God) of truth and without iniquity, just and right is he* (Deuteronomy 32:4); the upright One the Psalm proclaims: *To shew that Yahuah (LORD) is upright: he is my rock, and there is no unrighteousness in him* (Psalm 92:15). And his faithfulness is renewed with every dawn, just as Zephaniah says his judgment comes *every morning*: *It is of the LORD''S mercies that we are not consumed, because his compassions fail not. They are new every morning: great is thy faithfulness* (Lamentations 3:22-23). The just Yahuah in the midst does no iniquity, and *he faileth not* — his mercy holding even through the judgment.',
       sv.verse_id, ev.verse_id, 'free', 45643
  FROM _s336_zep03_lookup sv, _s336_zep03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='zephaniah' AND ev.chapter_number=3 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zephaniah-3-a-pure-language-all-call-upon-the-name-with-one-consent',
       E'A pure language — that all call upon the name of Yahuah with one consent (Babel reversed)',
       E'The hinge of the whole chapter is the great turning: *For then will I turn to the people a pure language, that they may all call upon the name of Yahuah (LORD), to serve him with one consent. From beyond the rivers of Ethiopia my suppliants, even the daughter of my dispersed, shall bring mine offering* (Zephaniah 3:9-10). This is the deliberate reversal of Babel — *Therefore is the name of it called Babel; because Yahuah (LORD) did there confound the language of all the earth: and from thence did Yahuah (LORD) scatter them abroad upon the face of all the earth* (Genesis 11:9). The tongues Yahuah confounded and the people he scattered are gathered back into one pure speech that calls on the one Name. It begins at Pentecost: *they were all filled with the Ruach HaKodesh (Holy Spirit), and began to speak with other tongues, as the Spirit gave them utterance* (Acts 2:4), every nation hearing *in our tongues the wonderful works of Elohim (God)* (Acts 2:11) — not one speech imposed, but every tongue brought to the one Name with one consent. And the calling on the Name is the very door of salvation: *whosoever shall call on the name of Yahuah (LORD) shall be delivered* (Joel 2:32), *whosoever shall call upon the name of Yahuah (Lord) shall be saved* (Romans 10:13). The cleansing of the lip is Isaiah''s too — *I am a man of unclean lips, and I dwell in the midst of a people of unclean lips* (Isaiah 6:5) — the defiled mouth purged to call rightly on the Name. And the restored witness sees the nations streaming in: *Many nations shall come from far to the name of Yahuah (God) with gifts in their hands* (Tobit 13:11); *all nations shall turn, and fear Yahuah (God) truly, and shall bury their idols* (Tobit 14:6). The one Name, the one pure language, served with one consent.',
       sv.verse_id, ev.verse_id, 'extras', 45646
  FROM _s336_zep03_lookup sv, _s336_zep03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='zephaniah' AND ev.chapter_number=3 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zephaniah-3-the-remnant-no-guile-in-their-mouth',
       E'The remnant of Yashar''el — no deceitful tongue in their mouth',
       E'Yahuah leaves a meek and truthful people: *I will also leave in the midst of thee an afflicted and poor people, and they shall trust in the name of Yahuah (LORD). The remnant of Yashar''el (Israel) shall not do iniquity, nor speak lies; neither shall a deceitful tongue be found in their mouth: for they shall feed and lie down, and none shall make them afraid* (Zephaniah 3:12-13). The afflicted poor who *trust in the name of Yahuah (LORD)* are the remnant Paul confirms still stands: *Even so then at this present time also there is a remnant according to the election of grace* (Romans 11:5) — never a cast-off people. And the guileless mouth is the Lamb''s own mark on the redeemed: *in their mouth was found no guile: for they are without fault before the throne of Elohim (God)* (Revelation 14:5) — as the Messiah himself, *Who did no sin, neither was guile found in his mouth* (1 Peter 2:22), so the *Israelite indeed, in whom is no guile* (John 1:47). The remnant that *shall feed and lie down, and none shall make them afraid* is the secure flock of Micah — *they shall sit every man under his vine and under his fig tree; and none shall make them afraid* (Micah 4:4) — and of Ezekiel''s true Shepherd: *they shall dwell safely, and none shall make them afraid* (Ezekiel 34:28). The meek, truthful, unafraid remnant who trust the Name.',
       sv.verse_id, ev.verse_id, 'free', 45649
  FROM _s336_zep03_lookup sv, _s336_zep03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='zephaniah' AND ev.chapter_number=3 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zephaniah-3-the-king-of-yasharel-even-yahuah-in-the-midst',
       E'The King of Yashar''el, even Yahuah, is in the midst of thee',
       E'The summons to joy is grounded in the King who comes: *Sing, O daughter of Zion; shout, O Yashar''el (Israel); be glad and rejoice with all the heart, O daughter of Jerusalem. Yahuah (LORD) hath taken away thy judgments, he hath cast out thine enemy: the king of Yashar''el (Israel), even Yahuah (LORD), is in the midst of thee: thou shalt not see evil any more* (Zephaniah 3:14-15). The King is Yahuah Himself — and Zechariah names how he comes: *Rejoice greatly, O daughter of Zion; shout, O daughter of Jerusalem: behold, thy King cometh unto thee: he is just, and having salvation; lowly, and riding upon an ass, and upon a colt the foal of an ass* (Zechariah 9:9), fulfilled at the gate: *Tell ye the daughter of Sion, Behold, thy King cometh unto thee, meek, and sitting upon an ass* (Matthew 21:5). This is the Formed Son — the King who is Yahuah and HAS a Father, the visible One drawn from the Formless Source; not co-equal trinitarian persons, not a modalist collapse, but the King come to dwell in the midst of his rejoicing people. And the midst-dwelling consummates forever: *Behold, the tabernacle of Elohim (God) is with men, and he will dwell with them, and they shall be his people, and Elohim (God) himself shall be with them, and be their Elohim (God)* (Revelation 21:3). The King in the midst — they shall not see evil any more.',
       sv.verse_id, ev.verse_id, 'free', 45652
  FROM _s336_zep03_lookup sv, _s336_zep03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='zephaniah' AND ev.chapter_number=3 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- THREAD 6 (★★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zephaniah-3-he-will-rejoice-over-thee-with-singing',
       E'He will joy over thee with singing — Yahuah rejoicing over his redeemed',
       E'The book''s climactic word is the joy of Yahuah Himself over his people: *In that day it shall be said to Jerusalem, Fear thou not: and to Zion, Let not thine hands be slack. Yahuah Elohayka (The LORD thy God) in the midst of thee is mighty; he will save, he will rejoice over thee with joy; he will rest in his love, he will joy over thee with singing* (Zephaniah 3:16-17). Yahuah is the One who rejoices — as the bridegroom over the bride: *as a young man marrieth a virgin, so shall thy sons marry thee: and as the bridegroom rejoiceth over the bride, so shall thy Elohim (God) rejoice over thee* (Isaiah 62:5); *And I will rejoice in Jerusalem, and joy in my people: and the voice of weeping shall be no more heard in her* (Isaiah 65:19). Where Yahuah rejoices, weeping is heard no more — *thou shalt not see evil any more* (3:15). And the same singing joy fills heaven over the found: *joy shall be in heaven over one sinner that repenteth* (Luke 15:7); *this my son was dead, and is alive again; he was lost, and is found. And they began to be merry* (Luke 15:24). The mighty Saviour in the midst sings over his gathered, restored people.',
       sv.verse_id, ev.verse_id, 'free', 45655
  FROM _s336_zep03_lookup sv, _s336_zep03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='zephaniah' AND ev.chapter_number=3 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- THREAD 7 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'zephaniah-3-i-will-gather-her-that-was-driven-out',
       E'I will gather her that was driven out — the closing two-house homecoming',
       E'The book ends with the gathering home: *I will gather them that are sorrowful for the solemn assembly, who are of thee, to whom the reproach of it was a burden. Behold, at that time I will undo all that afflict thee: and I will save her that halteth, and gather her that was driven out; and I will get them praise and fame in every land where they have been put to shame... At that time will I bring you again, even in the time that I gather you: for I will make you a name and a praise among all people of the earth, when I turn back your captivity before your eyes, saith Yahuah (LORD)* (Zephaniah 3:18-20). This is the two-house ingathering — the scattered north and the dispersed south brought home. Micah speaks it word for word: *In that day, saith Yahuah (LORD), will I assemble her that halteth, and I will gather her that is driven out... And I will make her that halted a remnant, and her that was cast far off a strong nation: and Yahuah (LORD) shall reign over them in mount Zion... for ever* (Micah 4:6-7). It is the true Shepherd''s work — *I will... bring again that which was driven away, and will bind up that which was broken* (Ezekiel 34:16) — and the Torah''s own restoration pledge: *Yahuah Elohayka (the LORD thy God) will turn thy captivity... and will return and gather thee from all the nations* (Deuteronomy 30:3). Isaiah names both houses: *assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth* (Isaiah 11:12). And it is NOT replacement — *so all Yashar''el (Israel) shall be saved* (Romans 11:26); the blindness is *in part* with an end (Romans 11:25). The restored witness sings the homecoming: *behold your children gathered from the west to the east by the word of the Holy One, rejoicing in the remembrance of Yahuah (God)* (Baruch 5:5); *Yahuah (God) shall lead Yashar''el (Israel) with joy in the light of his glory* (Baruch 5:9). The driven-out gathered, the captivity turned, the scattered house made a name and a praise.',
       sv.verse_id, ev.verse_id, 'extras', 45658
  FROM _s336_zep03_lookup sv, _s336_zep03_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=18
   AND ev.edition_slug='canon' AND ev.book_slug='zephaniah' AND ev.chapter_number=3 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

-- THREAD 1 members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Her priests have violated my law, and have profaned mine holy things... put no difference between the holy and profane* (Ezekiel 22:26) — Zephaniah''s *done violence to the law* (3:4) word for word; the Torah affirmed, the corrupt priests condemned.'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=4
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=22 AND tv.verse_number=26
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-her-priests-have-done-violence-to-the-law'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *a Elohim (God) of truth and without iniquity, just and right is he* (Deuteronomy 32:4) — the *just Yahuah* who *will not do iniquity* (3:5) is the Rock of the Song of Moses.'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-the-just-yahuah-in-the-midst-he-faileth-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *his compassions fail not* (Lamentations 3:22) — Zephaniah''s *he faileth not* (3:5); the One in the midst does not fail.'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=3 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-the-just-yahuah-in-the-midst-he-faileth-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *They are new every morning: great is thy faithfulness* (Lamentations 3:23) — the judgment Yahuah brings *every morning* (3:5) matched by the mercy new every morning.'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=3 AND tv.verse_number=23
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-the-just-yahuah-in-the-midst-he-faileth-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*Yahuah (LORD) is upright: he is my rock, and there is no unrighteousness in him* (Psalm 92:15) — the just Yahuah in the midst who *will not do iniquity* (3:5).'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=5
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=92 AND tv.verse_number=15
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-the-just-yahuah-in-the-midst-he-faileth-not'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *Yahuah (LORD) did there confound the language of all the earth... did Yahuah (LORD) scatter them abroad* (Genesis 11:9) — Babel, the very thing the *pure language* (3:9) reverses.'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=9
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=11 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-a-pure-language-all-call-upon-the-name-with-one-consent'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *filled with the Ruach HaKodesh (Holy Spirit), and began to speak with other tongues* (Acts 2:4) — the pure language begins at Pentecost, Babel undone by the Spirit.'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=9
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-a-pure-language-all-call-upon-the-name-with-one-consent'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *we do hear them speak in our tongues the wonderful works of Elohim (God)* (Acts 2:11) — every tongue brought to the one Name *with one consent* (3:9).'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=9
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=2 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-a-pure-language-all-call-upon-the-name-with-one-consent'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *whosoever shall call on the name of Yahuah (LORD) shall be delivered* (Joel 2:32) — the calling on the Name (3:9) is the door of deliverance.'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=9
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=32
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-a-pure-language-all-call-upon-the-name-with-one-consent'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *whosoever shall call upon the name of Yahuah (Lord) shall be saved* (Romans 10:13) — the gospel''s door; the one Name called with one consent (3:9) is salvation.'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=9
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=10 AND tv.verse_number=13
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-a-pure-language-all-call-upon-the-name-with-one-consent'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*I am a man of unclean lips... a people of unclean lips* (Isaiah 6:5) — the *pure language* (3:9) is the cleansing of the lip to call rightly on the Name.'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=9
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-a-pure-language-all-call-upon-the-name-with-one-consent'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *Many nations shall come from far to the name of Yahuah (God) with gifts* (Tobit 13:11) — the nations streaming to the one Name (3:9), the restored witness.'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=9
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=13 AND tv.verse_number=11
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-a-pure-language-all-call-upon-the-name-with-one-consent'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *all nations shall turn, and fear Yahuah (God) truly, and shall bury their idols* (Tobit 14:6) — all nations serving the one Name *with one consent* (3:9).'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=9
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=14 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-a-pure-language-all-call-upon-the-name-with-one-consent'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *in their mouth was found no guile: for they are without fault before the throne of Elohim (God)* (Revelation 14:5) — the remnant''s *no deceitful tongue* (3:13) is the Lamb''s mark on the redeemed.'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=13
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=14 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-the-remnant-no-guile-in-their-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Behold an Israelite indeed, in whom is no guile!* (John 1:47) — the true Yashar''el marked by the guileless mouth of 3:13, named by Yahusha himself.'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=13
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=47
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-the-remnant-no-guile-in-their-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Who did no sin, neither was guile found in his mouth* (1 Peter 2:22) — as the Messiah, so the guileless remnant (3:13); the people conformed to the King.'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=13
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=22
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-the-remnant-no-guile-in-their-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *a remnant according to the election of grace* (Romans 11:5) — the *afflicted and poor people* who *trust in the name of Yahuah* (3:12) is the preserved remnant, never cast off.'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=12
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-the-remnant-no-guile-in-their-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *every man under his vine and under his fig tree; and none shall make them afraid* (Micah 4:4) — Zephaniah''s remnant *shall feed and lie down, and none shall make them afraid* (3:13).'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=13
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=4 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-the-remnant-no-guile-in-their-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'*they shall dwell safely, and none shall make them afraid* (Ezekiel 34:28) — the fed, secure flock under the true Shepherd, matching the unafraid remnant of 3:13.'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=13
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=28
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-the-remnant-no-guile-in-their-mouth'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *behold, thy King cometh unto thee: he is just, and having salvation; lowly, and riding upon an ass* (Zechariah 9:9) — the *king of Yashar''el, even Yahuah* (3:15); Zechariah names how he comes.'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=15
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=9 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-the-king-of-yasharel-even-yahuah-in-the-midst'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *Behold, thy King cometh unto thee, meek, and sitting upon an ass* (Matthew 21:5) — the King-in-the-midst (3:15) is the Formed Son, who is Yahuah and HAS a Father; not co-equal persons.'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=15
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=21 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-the-king-of-yasharel-even-yahuah-in-the-midst'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★★ *the tabernacle of Elohim (God) is with men, and he will dwell with them* (Revelation 21:3) — the King *in the midst* (3:15) consummates in the New Jerusalem, dwelling forever.'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=15
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-the-king-of-yasharel-even-yahuah-in-the-midst'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 6 members (★★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *as the bridegroom rejoiceth over the bride, so shall thy Elohim (God) rejoice over thee* (Isaiah 62:5) — Yahuah''s *rejoice over thee with joy... joy over thee with singing* (3:17); the bridegroom''s joy.'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=62 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-he-will-rejoice-over-thee-with-singing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *I will rejoice in Jerusalem, and joy in my people: and the voice of weeping shall be no more heard* (Isaiah 65:19) — Yahuah''s gladness over his people (3:17); weeping heard no more, *thou shalt not see evil any more* (3:15).'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=65 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-he-will-rejoice-over-thee-with-singing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *joy shall be in heaven over one sinner that repenteth* (Luke 15:7) — the singing joy of Yahuah (3:17) is the heaven-filling joy over the found.'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=15 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-he-will-rejoice-over-thee-with-singing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'*this my son was dead, and is alive again; he was lost, and is found. And they began to be merry* (Luke 15:24) — the father''s joy over the returned son mirrors Yahuah rejoicing over his gathered (3:17).'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=17
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=15 AND tv.verse_number=24
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-he-will-rejoice-over-thee-with-singing'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 7 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★ *I will assemble her that halteth, and I will gather her that is driven out* (Micah 4:6) — Zephaniah''s *save her that halteth, and gather her that was driven out* (3:19) word for word.'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=19
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=4 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-i-will-gather-her-that-was-driven-out'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *make her that halted a remnant, and her that was cast far off a strong nation: and Yahuah (LORD) shall reign... for ever* (Micah 4:7) — the gathered lame (3:19) made the everlasting kingdom.'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=19
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='micah' AND tv.chapter_number=4 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-i-will-gather-her-that-was-driven-out'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *bring again that which was driven away, and will bind up that which was broken* (Ezekiel 34:16) — the true Shepherd''s work matching *gather her that was driven out* (3:19).'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=19
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=16
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-i-will-gather-her-that-was-driven-out'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *will turn thy captivity... and gather thee from all the nations, whither... hath scattered thee* (Deuteronomy 30:3) — the Torah''s own pledge behind *I turn back your captivity* (3:20).'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=20
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-i-will-gather-her-that-was-driven-out'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★★ *assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah)* (Isaiah 11:12) — the two-house ingathering behind *I gather you* (3:20).'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=20
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=12
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-i-will-gather-her-that-was-driven-out'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 6, E'★ *blindness in part is happened to Yashar''el (Israel), until the fulness of the Gentiles be come in* (Romans 11:25) — the turning-back of the captivity (3:20) is restoration, NOT replacement; *so all Yashar''el shall be saved* (11:26).'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=20
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=25
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-i-will-gather-her-that-was-driven-out'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 7, E'★ *behold your children gathered from the west to the east by the word of the Holy One* (Baruch 5:5) — the restored witness sings the homecoming of 3:20.'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=20
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=5 AND tv.verse_number=5
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-i-will-gather-her-that-was-driven-out'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 8, E'★ *Yahuah (God) shall lead Yashar''el (Israel) with joy in the light of his glory* (Baruch 5:9) — the gathering home (3:20) led by Yahuah Himself, in mercy and righteousness.'
  FROM cross_reference_threads t
  JOIN _s336_zep03_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='zephaniah' AND sv.chapter_number=3 AND sv.verse_number=20
  JOIN _s336_zep03_lookup tv ON tv.edition_slug='apocrypha' AND tv.book_slug='baruch-with-the-letter-of-jeremiah' AND tv.chapter_number=5 AND tv.verse_number=9
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='zephaniah-3-i-will-gather-her-that-was-driven-out'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session336 — Zephaniah cross-references complete.'
