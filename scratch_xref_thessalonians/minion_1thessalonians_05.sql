-- ----- fragment: minion_1thessalonians_05.sql (S233 1 Thessalonians 5) -----
-- =====================================================================
-- S233 minion — 1 THESSALONIANS 5 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 THESSALONIANS 5 (28 verses) — ★ HIGH watchpoint / BLESSING (the day of Yahuah).
-- Tag: t105 (temp view _s233_t105_lookup).
-- Sort band: floor 8150, step 3 (8150, 8153, 8156, 8159 used; under 8175).
-- Source is ALWAYS the canon 1-thessalonians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: the day of Yahuah, the children of light, and the armour of righteousness belong to
-- the one olive tree — the regathered house of Yashar'el (Israel) and the grafted-in nations who turned
-- from idols to the living Elohim (God). The day of Yahuah is no new apostolic invention but the prophets'
-- own day of darkness (Joel/Amos/Zephaniah/Malachi); it comes as a thief on the night-children, but the
-- children of light are not overtaken. No replacement theology, no law-vs-grace antithesis: *I am Yahuah
-- which sanctify you* (Leviticus 20:8) is the same Elohim (God) of peace who sanctifies the assembly
-- wholly. Christology — the Formed: salvation is *by our Lord Yahusha HaMashiach (Lord Jesus Christ)*
-- (5:9), the Son the Father appointed, who died for us; the coming (5:23) is his parousia. Names quoted
-- EXACTLY as dump_canon returns: the day-of-Yahuah texts render *Yahuah (LORD)* / *Yahuah (Lord)*; the
-- titular references render *Lord* (*over you in Yahuah (Lord)*, *our Lord Yahusha HaMashiach*).
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-3   the day of Yahuah cometh as a thief in the night; sudden destruction
--           Tanakh: Joel 2:1 (blow the trumpet... the day of Yahuah cometh), Joel 2:2 (a day of
--                   darkness), Joel 2:31 (sun darkened... the great and terrible day), Amos 5:18 +
--                   5:20 (the day of Yahuah is darkness, and not light), Zephaniah 1:14 + 1:15 (the
--                   great day of Yahuah... a day of wrath), Malachi 4:1 (the day cometh, that shall
--                   burn as an oven)
--           Extras: none warranted (this edition's 1 Enoch 108 lacks a clean day-of-darkness witness;
--                   the prophets carry the full weight)
--           NT: Matthew 24:43 (the thief in the watch), 2 Peter 3:10 (the day of Yahuah will come as
--               a thief in the night), Revelation 16:15 (Behold, I come as a thief)
--   v.4-5   ye are not in darkness; children of light, and children of the day
--           Tanakh: Isaiah 60:1 (Arise, shine; for thy light is come), Isaiah 60:2 (darkness shall
--                   cover the earth... but Yahuah shall arise upon thee)
--           Extras: 1 Enoch 58:3 (the righteous in the light of the sun... the darkness is past),
--                   1 Enoch 58:6 (the light established for ever... the darkness destroyed)
--           NT: none warranted (the light root is the Tanakh witness; carried in prose)
--   v.6-7   let us not sleep, but watch and be sober (night vs day)
--           Tanakh / Extras / NT: none warranted as a separate thread — folded into the day-of-Yahuah
--                   and children-of-light weaves (the thief overtakes the sleeping night-children)
--   v.8     the breastplate of faith and love; for an helmet, the hope of salvation
--           Tanakh: Isaiah 59:17 (he put on righteousness as a breastplate, and an helmet of salvation)
--           Extras: Wisdom of Solomon 5:18 (He shall put on righteousness as a breastplate, and true
--                   judgment instead of an helmet)
--           NT: Ephesians 6:14 (the breastplate of righteousness), Ephesians 6:16 (the shield of
--               faith), Ephesians 6:17 (the helmet of salvation)
--   v.9-15  not appointed to wrath but to salvation; comfort; esteem the labourers; follow the good
--           Tanakh / Extras / NT: none warranted (pastoral exhortation; the wrath/salvation antithesis
--                   is carried in the day-of-Yahuah thread)
--   v.16-22 rejoice / pray / give thanks / quench not the Spirit / prove all things
--           Tanakh / Extras / NT: none warranted — a string of brief imperatives with no single
--                   load-bearing parallel; verbal echoes (Ps 34:1 etc.) lack framework weight, so per
--                   the curated standard no thread is forced here
--   v.23    the very Elohim of peace sanctify you wholly; whole spirit and soul and body preserved
--           Tanakh: Leviticus 20:8 (I am Yahuah which sanctify you), Psalm 121:7 (Yahuah shall preserve
--                   thy soul), Numbers 6:24 + 6:26 (Yahuah bless thee, and keep thee... give thee peace)
--           Extras: none warranted   NT: none warranted (the sanctify/preserve root is the Tanakh)
--   v.24-28 faithful is he that calleth; greet the brethren; grace be with you
--           Tanakh / Extras / NT: none warranted (epistolary close)
--
-- THREADS (slug -> target libraries):
--   8150 1-thessalonians-5-the-day-of-yahuah-as-a-thief-in-the-night-joel-2-amos-5  (Tanakh + NT)  [★ BLESSING]
--   8153 1-thessalonians-5-children-of-light-and-of-the-day-isaiah-60-1-enoch-58    (Tanakh + Extras)
--   8156 1-thessalonians-5-the-breastplate-of-faith-and-the-helmet-of-salvation-isaiah-59-ephesians-6  (Tanakh + Extras + NT)
--   8159 1-thessalonians-5-the-elohim-of-peace-sanctify-and-preserve-you-wholly-leviticus-20-psalm-121  (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s233_t105_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-thessalonians-5-the-day-of-yahuah-as-a-thief-in-the-night-joel-2-amos-5  [★ BLESSING]
  ('canon', '1-thessalonians', 5, 2, 'canon', 'joel', 2, 1, 'free', E'*Blow ye the trumpet in Zion, and sound an alarm in my holy mountain: let all the inhabitants of the land tremble: for the day of Yahuah (LORD) cometh, for it is nigh at hand;* (Joel 2:1). Paul speaks no new thing when he writes that *the day of Yahuah (Lord) so cometh as a thief in the night* (1 Thessalonians 5:2). The day is the prophets'' own day — Joel sounds the alarm in Zion because *the day of Yahuah (LORD) cometh,* nigh at hand. The apostle takes the prophetic day of Yahuah and presses its nearness on the assembly: it comes, and the night-children do not see it draw near.'),
  ('canon', '1-thessalonians', 5, 2, 'canon', 'joel', 2, 31, 'free', E'*The sun shall be turned into darkness, and the moon into blood, before the great and the terrible day of Yahuah (LORD) come.* (Joel 2:31). The day of Yahuah comes wrapped in darkness — *the sun... turned into darkness, and the moon into blood.* So Paul writes of *the day of Yahuah (Lord)* coming *as a thief in the night* (1 Thessalonians 5:2): it is a night-day, a day of sudden overtaking, the great and terrible day the prophets named long before the apostle wrote.'),
  ('canon', '1-thessalonians', 5, 4, 'canon', 'joel', 2, 2, 'free', E'*A day of darkness and of gloominess, a day of clouds and of thick darkness, as the morning spread upon the mountains: a great people and a strong; there hath not been ever the like, neither shall be any more after it, even to the years of many generations.* (Joel 2:2). The day of Yahuah is *a day of darkness and of gloominess.* This is why Paul can say *But ye, brethren, are not in darkness, that that day should overtake you as a thief* (1 Thessalonians 5:4): the day is darkness to the night-children, but those who are of the light are not swallowed in it. The darkness of Joel''s day is the very thing the children of the day are delivered from.'),
  ('canon', '1-thessalonians', 5, 2, 'canon', 'amos', 5, 18, 'free', E'*Woe unto you that desire the day of Yahuah (LORD)! to what end is it for you? the day of Yahuah (LORD) is darkness, and not light.* (Amos 5:18). Amos warns those who long carelessly for the day: *the day of Yahuah (LORD) is darkness, and not light.* Paul builds the same contrast — *the day of Yahuah (Lord) so cometh as a thief in the night* (1 Thessalonians 5:2) — and then divides the assembly from that darkness: those who *are all the children of light, and the children of the day* (1 Thessalonians 5:5) are not the ones for whom the day is darkness. The apostle takes Amos''s word and shows for whom the day is light and for whom it is night.'),
  ('canon', '1-thessalonians', 5, 4, 'canon', 'amos', 5, 20, 'free', E'*Shall not the day of Yahuah (LORD) be darkness, and not light? even very dark, and no brightness in it?* (Amos 5:20). Amos presses it again: the day of Yahuah is *very dark, and no brightness in it.* Paul answers across the centuries — *ye, brethren, are not in darkness, that that day should overtake you as a thief* (1 Thessalonians 5:4). The day that is unrelieved darkness to the sinner does not overtake the children of the day as a thief, for they are awake and clothed with light.'),
  ('canon', '1-thessalonians', 5, 2, 'canon', 'zephaniah', 1, 14, 'free', E'*The great day of Yahuah (LORD) is near, it is near, and hasteth greatly, even the voice of the day of Yahuah (LORD): the mighty man shall cry there bitterly.* (Zephaniah 1:14). Zephaniah cries that *the great day of Yahuah (LORD) is near... and hasteth greatly.* Paul says the same of *the day of Yahuah (Lord)* coming *as a thief in the night* (1 Thessalonians 5:2): its nearness and its suddenness are the prophet''s own, the day that hastes upon the careless before they cry *Peace and safety* (1 Thessalonians 5:3).'),
  ('canon', '1-thessalonians', 5, 3, 'canon', 'zephaniah', 1, 15, 'free', E'*That day is a day of wrath, a day of trouble and distress, a day of wasteness and desolation, a day of darkness and gloominess, a day of clouds and thick darkness,* (Zephaniah 1:15). The day of Yahuah is *a day of wrath... a day of darkness and gloominess.* Paul describes its onset upon the secure: *when they shall say, Peace and safety; then sudden destruction cometh upon them, as travail upon a woman with child; and they shall not escape* (1 Thessalonians 5:3). The wrath and the desolation Zephaniah names break out as the sudden travail the apostle warns of — the day from which the night-dwellers cannot flee.'),
  ('canon', '1-thessalonians', 5, 3, 'canon', 'malachi', 4, 1, 'free', E'*For, behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble: and the day that cometh shall burn them up, saith Yahuah Tseva''ot (LORD of hosts), that it shall leave them neither root nor branch.* (Malachi 4:1). Malachi closes the prophets with the day that *shall burn as an oven,* consuming the proud and the wicked as stubble. This is the *sudden destruction* that *cometh upon them* who say *Peace and safety* (1 Thessalonians 5:3); the day that leaves the wicked neither root nor branch is the day Paul says shall not escape those who sleep in the night.'),
  ('canon', '1-thessalonians', 5, 2, 'canon', 'matthew', 24, 43, 'free', E'*But know this, that if the goodman of the house had known in what watch the thief would come, he would have watched, and would not have suffered his house to be broken up.* (Matthew 24:43). Yahusha (Jesus) gave the very figure Paul uses: the day comes like *the thief* in an unknown watch, so the householder must watch. Paul echoes the Master''s parable — *the day of Yahuah (Lord) so cometh as a thief in the night* (1 Thessalonians 5:2) — and draws the same charge: *let us watch and be sober* (1 Thessalonians 5:6). The thief-in-the-night of the Olivet teaching is the day of Yahuah of the prophets, one and the same warning.'),
  ('canon', '1-thessalonians', 5, 2, 'canon', '2-peter', 3, 10, 'free', E'*But the day of Yahuah (Lord) will come as a thief in the night; in the which the heavens shall pass away with a great noise, and the elements shall melt with fervent heat, the earth also and the works that are therein shall be burned up.* (2 Peter 3:10). Peter speaks the same word as Paul, almost letter for letter: *the day of Yahuah (Lord) will come as a thief in the night.* Two apostles, one testimony — *the day of Yahuah (Lord) so cometh as a thief in the night* (1 Thessalonians 5:2). And Peter unfolds what that day burns: the heavens pass, the elements melt, as Malachi''s oven burns the stubble. The apostolic day of Yahuah is the prophets'' day of fire and darkness.'),
  ('canon', '1-thessalonians', 5, 4, 'canon', 'revelation', 16, 15, 'free', E'*Behold, I come as a thief. Blessed is he that watcheth, and keepeth his garments, lest he walk naked, and they see his shame.* (Revelation 16:15). The returning Yahusha (Jesus) takes the figure to himself: *Behold, I come as a thief.* The blessing falls on the one who *watcheth, and keepeth his garments* — the very wakefulness Paul commends, for *ye, brethren, are not in darkness, that that day should overtake you as a thief* (1 Thessalonians 5:4). The thief-coming of the day of Yahuah does not surprise the watching, garment-clad children of the day, who *let us watch and be sober* (1 Thessalonians 5:6).'),
  -- thread: 1-thessalonians-5-children-of-light-and-of-the-day-isaiah-60-1-enoch-58
  ('canon', '1-thessalonians', 5, 5, 'canon', 'isaiah', 60, 1, 'free', E'*Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee.* (Isaiah 60:1). Isaiah calls the gathered to rise into the risen light of Yahuah (LORD): *Arise, shine; for thy light is come.* Paul declares it accomplished in the assembly — *Ye are all the children of light, and the children of the day: we are not of the night, nor of darkness* (1 Thessalonians 5:5). The light come upon Zion is the light the children of the day now walk in; they are of the day because the glory of Yahuah (LORD) has risen upon them.'),
  ('canon', '1-thessalonians', 5, 5, 'canon', 'isaiah', 60, 2, 'free', E'*For, behold, the darkness shall cover the earth, and gross darkness the people: but Yahuah (LORD) shall arise upon thee, and his glory shall be seen upon thee.* (Isaiah 60:2). Isaiah sets the two peoples side by side: *darkness shall cover the earth, and gross darkness the people: but Yahuah (LORD) shall arise upon thee.* This is precisely Paul''s division — the children *of the night, nor of darkness* against those who *are all the children of light, and the children of the day* (1 Thessalonians 5:5). While gross darkness covers the earth, Yahuah (LORD) arises upon his own; the children of light are those upon whom his glory is seen.'),
  ('canon', '1-thessalonians', 5, 5, 'enoch', '1-enoch', 58, 3, 'extras', E'*And the righteous shall be in the light of the sun, And the elect in the light of eternal life: The days of their life shall be unending, And the days of the holy and elect shall be without number.* (1 Enoch 58:3). The Hebrew library sees the same destiny of the righteous: they *shall be in the light of the sun,* the elect *in the light of eternal life.* This is the lot of those Paul names *the children of light, and the children of the day... not of the night, nor of darkness* (1 Thessalonians 5:5) — the elect whose portion is light without end, set apart from the night that overtakes the sleeping.'),
  ('canon', '1-thessalonians', 5, 5, 'enoch', '1-enoch', 58, 6, 'extras', E'*And there shall be no limit to the light Which shall never cease; For the darkness shall be destroyed, And the light established for ever and ever before Yahuah (God) of Spirits.* (1 Enoch 58:6). The library promises a light that *shall never cease* while *the darkness shall be destroyed.* Paul stands the assembly on the day-side of that final division: *we are not of the night, nor of darkness* (1 Thessalonians 5:5). The light established for ever is the children of the day''s inheritance; the destroyed darkness is the night from which they have been delivered.'),
  -- thread: 1-thessalonians-5-the-breastplate-of-faith-and-the-helmet-of-salvation-isaiah-59-ephesians-6
  ('canon', '1-thessalonians', 5, 8, 'canon', 'isaiah', 59, 17, 'free', E'*For he put on righteousness as a breastplate, and an helmet of salvation upon his head; and he put on the garments of vengeance for clothing, and was clad with zeal as a cloke.* (Isaiah 59:17). Isaiah shows Yahuah (LORD) himself armed for deliverance — *he put on righteousness as a breastplate, and an helmet of salvation upon his head.* Paul puts that same armour on the children of the day: *putting on the breastplate of faith and love; and for an helmet, the hope of salvation* (1 Thessalonians 5:8). The breastplate and the helmet of salvation that Yahuah (LORD) wears to save are given to his people to wear as they watch for the day; what is the Deliverer''s own armour becomes the soldier''s.'),
  ('canon', '1-thessalonians', 5, 8, 'apocrypha', 'the-wisdom-of-solomon', 5, 18, 'extras', E'*He shall put on righteousness as a breastplate, and true judgment instead of an helmet.* (Wisdom of Solomon 5:18). The Hebrew library re-speaks Isaiah''s armour-of-Yahuah: *He shall put on righteousness as a breastplate, and true judgment instead of an helmet,* taking holiness for a shield and wrath for a sword to fight against the unwise. Paul hands the same panoply to the watchman: *putting on the breastplate of faith and love; and for an helmet, the hope of salvation* (1 Thessalonians 5:8). The breastplate and helmet the righteous Deliverer wears in the wisdom-tradition are the armour the children of the day put on to stand in the night.'),
  ('canon', '1-thessalonians', 5, 8, 'canon', 'ephesians', 6, 14, 'free', E'*Stand therefore, having your loins girt about with truth, and having on the breastplate of righteousness;* (Ephesians 6:14). To another assembly Paul names the same armour: *the breastplate of righteousness.* Here he writes *putting on the breastplate of faith and love* (1 Thessalonians 5:8) — the one Isaiah-rooted breastplate, named for the graces that fasten it. The apostle clothes both bodies of the called-out in the armour of Yahuah (LORD) of Isaiah 59, the breastplate that guards the heart of the watching soldier.'),
  ('canon', '1-thessalonians', 5, 8, 'canon', 'ephesians', 6, 16, 'free', E'*Above all, taking the shield of faith, wherewith ye shall be able to quench all the fiery darts of the wicked.* (Ephesians 6:16). In the fuller armour Paul gives faith its own piece — *the shield of faith.* In Thessalonica he weaves faith into the breastplate itself: *putting on the breastplate of faith and love* (1 Thessalonians 5:8). One apostle, one armoury drawn from Isaiah 59: faith girds and guards the child of the day against the darts of the night.'),
  ('canon', '1-thessalonians', 5, 8, 'canon', 'ephesians', 6, 17, 'free', E'*And take the helmet of salvation, and the sword of the Spirit, which is the word of Elohim (God):* (Ephesians 6:17). Paul names *the helmet of salvation* — the very helmet of Isaiah 59:17 — and to the Thessalonians he gives the same crown of the head: *for an helmet, the hope of salvation* (1 Thessalonians 5:8). The helmet that Yahuah (LORD) wore to deliver, that the apostle commands the Ephesian assembly to take, is the hope of salvation that guards the mind of the watching children of the day.'),
  -- thread: 1-thessalonians-5-the-elohim-of-peace-sanctify-and-preserve-you-wholly-leviticus-20-psalm-121
  ('canon', '1-thessalonians', 5, 23, 'canon', 'leviticus', 20, 8, 'free', E'*And ye shall keep my statutes, and do them: I am Yahuah (LORD) which sanctify you.* (Leviticus 20:8). The sanctifying is Yahuah''s (LORD''s) own work, declared in the holiness code: *I am Yahuah (LORD) which sanctify you.* Paul prays it for the assembly — *the very Elohim (God) of peace sanctify you wholly* (1 Thessalonians 5:23). The Elohim (God) who set apart Yashar''el (Israel) by his statutes is the same Elohim (God) who sanctifies the gathered wholly; this is no new sanctification severed from the Torah, but the one Yahuah (LORD) who sanctifies completing his work in his people.'),
  ('canon', '1-thessalonians', 5, 23, 'canon', 'psalms', 121, 7, 'free', E'*Yahuah (LORD) shall preserve thee from all evil: he shall preserve thy soul.* (Psalm 121:7). The psalm of ascents trusts that *Yahuah (LORD)... shall preserve thy soul.* Paul prays exactly this preservation upon the whole person: *your whole spirit and soul and body be preserved blameless unto the coming of our Lord Yahusha HaMashiach (Lord Jesus Christ)* (1 Thessalonians 5:23). The keeper of Yashar''el (Israel) who preserves the soul is the One who will preserve the assembly entire and blameless until the day they watch for.'),
  ('canon', '1-thessalonians', 5, 23, 'canon', 'numbers', 6, 26, 'free', E'*Yahuah (LORD) lift up his countenance upon thee, and give thee peace.* (Numbers 6:26). The priestly blessing ends in peace — *Yahuah (LORD)... give thee peace.* Paul names that same Yahuah (LORD) *the very Elohim (God) of peace* who sanctifies and preserves the assembly (1 Thessalonians 5:23). The Elohim (God) of peace who blesses and keeps Yashar''el (Israel) in the Aaronic benediction is the One Paul invokes to keep the whole spirit and soul and body blameless unto the coming.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s233_t105_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s233_t105_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-thessalonians-5-the-day-of-yahuah-as-a-thief-in-the-night-joel-2-amos-5',
       E'The day of Yahuah cometh as a thief in the night (Joel 2, Amos 5)',
       E'*For yourselves know perfectly that the day of Yahuah (Lord) so cometh as a thief in the night* (1 Thessalonians 5:2). Paul invents no new doctrine here; he presses on the assembly the prophets'' own day of Yahuah. Joel sounds the alarm — *Blow ye the trumpet in Zion... for the day of Yahuah (LORD) cometh, for it is nigh at hand* (Joel 2:1) — and names its character, *A day of darkness and of gloominess, a day of clouds and of thick darkness* (Joel 2:2), *The sun shall be turned into darkness, and the moon into blood, before the great and the terrible day of Yahuah (LORD) come* (Joel 2:31). Amos sets the same word against false security: *Woe unto you that desire the day of Yahuah (LORD)!... the day of Yahuah (LORD) is darkness, and not light* (Amos 5:18), *Shall not the day of Yahuah (LORD) be darkness, and not light? even very dark, and no brightness in it?* (Amos 5:20). Zephaniah cries its nearness and its wrath — *The great day of Yahuah (LORD) is near... and hasteth greatly* (Zephaniah 1:14), *That day is a day of wrath, a day of trouble and distress... a day of darkness and gloominess* (Zephaniah 1:15) — and Malachi seals the prophets with its fire: *behold, the day cometh, that shall burn as an oven; and all the proud, yea, and all that do wickedly, shall be stubble* (Malachi 4:1). This is the day Paul says comes upon the careless *when they shall say, Peace and safety; then sudden destruction cometh upon them, as travail upon a woman with child; and they shall not escape* (1 Thessalonians 5:3). Yahusha (Jesus) himself gave the thief-figure — *if the goodman of the house had known in what watch the thief would come, he would have watched* (Matthew 24:43) — and Peter speaks Paul''s very words: *the day of Yahuah (Lord) will come as a thief in the night; in the which the heavens shall pass away with a great noise, and the elements shall melt with fervent heat* (2 Peter 3:10), and the returning King declares *Behold, I come as a thief. Blessed is he that watcheth, and keepeth his garments* (Revelation 16:15). The day of darkness overtakes the night-children as a thief; but Paul adds the deliverance — *ye, brethren, are not in darkness, that that day should overtake you as a thief* (1 Thessalonians 5:4) — and the charge, *Therefore let us not sleep, as do others; but let us watch and be sober* (1 Thessalonians 5:6). The prophets'' day of Yahuah and the apostolic thief in the night are one and the same warning, sounded from Zion to Thessalonica.',
       sv.verse_id, ev.verse_id, 'free', 8150
  FROM _s233_t105_lookup sv, _s233_t105_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=2
   AND ev.edition_slug='canon' AND ev.book_slug='1-thessalonians' AND ev.chapter_number=5 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-thessalonians-5-children-of-light-and-of-the-day-isaiah-60-1-enoch-58',
       E'Ye are all the children of light, and the children of the day (Isaiah 60, 1 Enoch 58)',
       E'*Ye are all the children of light, and the children of the day: we are not of the night, nor of darkness* (1 Thessalonians 5:5). Against the day of darkness that overtakes the sleeping, Paul sets the assembly on the day-side of the great division — and that division is Isaiah''s. *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee* (Isaiah 60:1); and the contrast: *For, behold, the darkness shall cover the earth, and gross darkness the people: but Yahuah (LORD) shall arise upon thee, and his glory shall be seen upon thee* (Isaiah 60:2). While gross darkness covers the peoples, Yahuah (LORD) rises upon his own — and those upon whom his glory is seen are the children of light, the children of the day. The Hebrew library holds the same hope: the righteous *shall be in the light of the sun, And the elect in the light of eternal life* (1 Enoch 58:3), for in the end *there shall be no limit to the light Which shall never cease; For the darkness shall be destroyed, And the light established for ever and ever before Yahuah (God) of Spirits* (1 Enoch 58:6). The portion of the elect is unceasing light; the night is destroyed. So Paul reasons from the assembly''s identity to its conduct: *Therefore let us not sleep, as do others; but let us watch and be sober* (1 Thessalonians 5:6), *For they that sleep sleep in the night; and they that be drunken are drunken in the night* (1 Thessalonians 5:7). Sleep and drunkenness belong to the night; watchfulness and sobriety to the day. Because the glory of Yahuah (LORD) has risen upon them, the children of the day are not overtaken by the day of darkness.',
       sv.verse_id, ev.verse_id, 'extras', 8153
  FROM _s233_t105_lookup sv, _s233_t105_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='1-thessalonians' AND ev.chapter_number=5 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-thessalonians-5-the-breastplate-of-faith-and-the-helmet-of-salvation-isaiah-59-ephesians-6',
       E'The breastplate of faith and the helmet of the hope of salvation (Isaiah 59, Ephesians 6)',
       E'*But let us, who are of the day, be sober, putting on the breastplate of faith and love; and for an helmet, the hope of salvation* (1 Thessalonians 5:8). The armour Paul hands the watching child of the day is the armour Yahuah (LORD) himself wears to deliver. Isaiah saw it on the Deliverer: *For he put on righteousness as a breastplate, and an helmet of salvation upon his head; and he put on the garments of vengeance for clothing, and was clad with zeal as a cloke* (Isaiah 59:17). The breastplate and the helmet of salvation are Yahuah''s (LORD''s) own; the apostle gives them to his people to wear in the night. The wisdom-tradition re-speaks the same panoply: *He shall put on righteousness as a breastplate, and true judgment instead of an helmet* (Wisdom of Solomon 5:18), taking holiness for a shield. And to the assembly at Ephesus Paul lays out the whole armour from the same Isaiah root — *having on the breastplate of righteousness* (Ephesians 6:14), *taking the shield of faith, wherewith ye shall be able to quench all the fiery darts of the wicked* (Ephesians 6:16), *And take the helmet of salvation, and the sword of the Spirit, which is the word of Elohim (God)* (Ephesians 6:17). One Deliverer''s armour, one apostolic armoury: the breastplate that guards the heart and the helmet that guards the mind, fastened in Thessalonica with faith and love and the hope of salvation. The child of the day is sober because he is armed, clothed in the very righteousness and salvation that Yahuah (LORD) put on to save.',
       sv.verse_id, ev.verse_id, 'extras', 8156
  FROM _s233_t105_lookup sv, _s233_t105_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='1-thessalonians' AND ev.chapter_number=5 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-thessalonians-5-the-elohim-of-peace-sanctify-and-preserve-you-wholly-leviticus-20-psalm-121',
       E'The Elohim of peace sanctify you wholly and preserve you blameless (Leviticus 20, Psalm 121)',
       E'*And the very Elohim (God) of peace sanctify you wholly; and I pray Elohim (God) your whole spirit and soul and body be preserved blameless unto the coming of our Lord Yahusha HaMashiach (Lord Jesus Christ)* (1 Thessalonians 5:23). Paul''s closing prayer rests on the Tanakh''s own Elohim (God), the one Yahuah (LORD) who sanctifies and who keeps. The sanctifying is his work, declared in the holiness code: *And ye shall keep my statutes, and do them: I am Yahuah (LORD) which sanctify you* (Leviticus 20:8) — no new sanctification cut off from the Torah, but the same Yahuah (LORD) who set apart Yashar''el (Israel) now setting apart the gathered assembly wholly. The preserving is his too: *Yahuah (LORD) shall preserve thee from all evil: he shall preserve thy soul* (Psalm 121:7), the keeper of Yashar''el (Israel) who guards the whole person. And the title Paul gives him — *the very Elohim (God) of peace* — is the priestly benediction''s own: *Yahuah (LORD) lift up his countenance upon thee, and give thee peace* (Numbers 6:26). The Elohim (God) who blesses, keeps, and gives peace to Yashar''el (Israel) is the One the apostle invokes to keep spirit and soul and body blameless until the coming. *Faithful is he that calleth you, who also will do it* (1 Thessalonians 5:24): the One who sanctifies is the One who will preserve, and he does not fail.',
       sv.verse_id, ev.verse_id, 'free', 8159
  FROM _s233_t105_lookup sv, _s233_t105_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=23
   AND ev.edition_slug='canon' AND ev.book_slug='1-thessalonians' AND ev.chapter_number=5 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-thessalonians-5-the-day-of-yahuah-as-a-thief-in-the-night-joel-2-amos-5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 2:1 — *Blow ye the trumpet in Zion... for the day of Yahuah (LORD) cometh, for it is nigh at hand* the prophets'' day of Yahuah Paul presses on the assembly; *the day of Yahuah (Lord) so cometh as a thief in the night* (1 Thessalonians 5:2).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-day-of-yahuah-as-a-thief-in-the-night-joel-2-amos-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joel 2:31 — *The sun shall be turned into darkness, and the moon into blood, before the great and the terrible day of Yahuah (LORD) come* the night-day of sudden overtaking; *as a thief in the night* (1 Thessalonians 5:2).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-day-of-yahuah-as-a-thief-in-the-night-joel-2-amos-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joel 2:2 — *A day of darkness and of gloominess, a day of clouds and of thick darkness* the day''s character; *ye, brethren, are not in darkness, that that day should overtake you as a thief* (1 Thessalonians 5:4).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-day-of-yahuah-as-a-thief-in-the-night-joel-2-amos-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Amos 5:18 — *the day of Yahuah (LORD) is darkness, and not light* woe on those who carelessly desire it; the day Paul says comes as a thief (1 Thessalonians 5:2).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-day-of-yahuah-as-a-thief-in-the-night-joel-2-amos-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Amos 5:20 — *Shall not the day of Yahuah (LORD) be darkness, and not light? even very dark, and no brightness in it?* the day from which the children of the day are not overtaken (1 Thessalonians 5:4).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-day-of-yahuah-as-a-thief-in-the-night-joel-2-amos-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='amos' AND tv.chapter_number=5 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Zephaniah 1:14 — *The great day of Yahuah (LORD) is near, it is near, and hasteth greatly* its nearness and suddenness; the day that comes as a thief (1 Thessalonians 5:2).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-day-of-yahuah-as-a-thief-in-the-night-joel-2-amos-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=1 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Zephaniah 1:15 — *That day is a day of wrath, a day of trouble and distress... a day of darkness and gloominess* the wrath that breaks as sudden travail; *sudden destruction cometh upon them... they shall not escape* (1 Thessalonians 5:3).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-day-of-yahuah-as-a-thief-in-the-night-joel-2-amos-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='zephaniah' AND tv.chapter_number=1 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Malachi 4:1 — *behold, the day cometh, that shall burn as an oven; and all the proud... shall be stubble* the consuming day; the sudden destruction upon those who say Peace and safety (1 Thessalonians 5:3).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-day-of-yahuah-as-a-thief-in-the-night-joel-2-amos-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=4 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Matthew 24:43 — *if the goodman of the house had known in what watch the thief would come, he would have watched* Yahusha (Jesus)''s own thief-figure; *the day of Yahuah (Lord) so cometh as a thief in the night* (1 Thessalonians 5:2).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-day-of-yahuah-as-a-thief-in-the-night-joel-2-amos-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 10, E'2 Peter 3:10 — *the day of Yahuah (Lord) will come as a thief in the night; in the which the heavens shall pass away* Peter''s testimony almost word for word with Paul (1 Thessalonians 5:2); the day burns as Malachi''s oven.'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-day-of-yahuah-as-a-thief-in-the-night-joel-2-amos-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-peter' AND tv.chapter_number=3 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 11, E'Revelation 16:15 — *Behold, I come as a thief. Blessed is he that watcheth, and keepeth his garments* the returning King takes the figure; the watching child of the day is not overtaken (1 Thessalonians 5:4).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-day-of-yahuah-as-a-thief-in-the-night-joel-2-amos-5'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=16 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-thessalonians-5-children-of-light-and-of-the-day-isaiah-60-1-enoch-58
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 60:1 — *Arise, shine; for thy light is come, and the glory of Yahuah (LORD) is risen upon thee* the risen light Paul declares accomplished; *ye are all the children of light, and the children of the day* (1 Thessalonians 5:5).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-children-of-light-and-of-the-day-isaiah-60-1-enoch-58'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 60:2 — *the darkness shall cover the earth... but Yahuah (LORD) shall arise upon thee, and his glory shall be seen upon thee* the two peoples divided; the children of light against those of the night (1 Thessalonians 5:5).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-children-of-light-and-of-the-day-isaiah-60-1-enoch-58'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Enoch 58:3 — *the righteous shall be in the light of the sun, And the elect in the light of eternal life* the elect''s portion of light; the children of the day, not of the night nor of darkness (1 Thessalonians 5:5).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-children-of-light-and-of-the-day-isaiah-60-1-enoch-58'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=58 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Enoch 58:6 — *there shall be no limit to the light Which shall never cease; For the darkness shall be destroyed* the unceasing light, the destroyed night; the day-side division Paul sets the assembly on (1 Thessalonians 5:5).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-children-of-light-and-of-the-day-isaiah-60-1-enoch-58'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=5
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=58 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-thessalonians-5-the-breastplate-of-faith-and-the-helmet-of-salvation-isaiah-59-ephesians-6
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 59:17 — *he put on righteousness as a breastplate, and an helmet of salvation upon his head* the Deliverer''s own armour, given to the watchman; *the breastplate of faith and love; and for an helmet, the hope of salvation* (1 Thessalonians 5:8).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-breastplate-of-faith-and-the-helmet-of-salvation-isaiah-59-ephesians-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=59 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Wisdom of Solomon 5:18 — *He shall put on righteousness as a breastplate, and true judgment instead of an helmet* the wisdom-tradition''s armour-of-the-righteous; the same breastplate and helmet the children of the day put on (1 Thessalonians 5:8).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-breastplate-of-faith-and-the-helmet-of-salvation-isaiah-59-ephesians-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=5 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 6:14 — *having on the breastplate of righteousness* the same Isaiah-rooted breastplate; in Thessalonica named for its graces, *the breastplate of faith and love* (1 Thessalonians 5:8).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-breastplate-of-faith-and-the-helmet-of-salvation-isaiah-59-ephesians-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ephesians 6:16 — *taking the shield of faith, wherewith ye shall be able to quench all the fiery darts of the wicked* faith its own piece there; woven into the breastplate here (1 Thessalonians 5:8).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-breastplate-of-faith-and-the-helmet-of-salvation-isaiah-59-ephesians-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Ephesians 6:17 — *take the helmet of salvation, and the sword of the Spirit, which is the word of Elohim (God)* the same helmet of Isaiah 59:17; the hope of salvation that guards the mind (1 Thessalonians 5:8).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-breastplate-of-faith-and-the-helmet-of-salvation-isaiah-59-ephesians-6'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-thessalonians-5-the-elohim-of-peace-sanctify-and-preserve-you-wholly-leviticus-20-psalm-121
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 20:8 — *ye shall keep my statutes, and do them: I am Yahuah (LORD) which sanctify you* the sanctifying is Yahuah''s (LORD''s) own work; *the very Elohim (God) of peace sanctify you wholly* (1 Thessalonians 5:23).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-elohim-of-peace-sanctify-and-preserve-you-wholly-leviticus-20-psalm-121'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=20 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 121:7 — *Yahuah (LORD) shall preserve thee from all evil: he shall preserve thy soul* the keeper of Yashar''el (Israel); *your whole spirit and soul and body be preserved blameless* (1 Thessalonians 5:23).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-elohim-of-peace-sanctify-and-preserve-you-wholly-leviticus-20-psalm-121'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=121 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Numbers 6:26 — *Yahuah (LORD) lift up his countenance upon thee, and give thee peace* the priestly benediction''s peace; *the very Elohim (God) of peace* who keeps the assembly blameless (1 Thessalonians 5:23).'
  FROM cross_reference_threads t, cross_references x, _s233_t105_lookup sv, _s233_t105_lookup tv
 WHERE t.slug='1-thessalonians-5-the-elohim-of-peace-sanctify-and-preserve-you-wholly-leviticus-20-psalm-121'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=5 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=6 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
