-- ----- fragment: minion_psalms_85.sql (Psalm 85) -----
-- Chapter: Psalm 85 — KORAHITE PSALM OF RESTORATION (13 verses). It opens on the captivity already
-- brought back and the sin already covered — *Yahuah (LORD), thou hast been favourable unto thy land:
-- thou hast brought back the captivity of Jacob. Thou hast forgiven the iniquity of thy people, thou
-- hast covered all their sin* (vv.1-3) — the two-house regathering and forgiveness (Deut 30:3 / Jer
-- 31:10 / Ps 32:1 / Rom 11:1 guard). It turns to the prayer for revival — *Turn us, O Elohim (God) of
-- our salvation... Wilt thou not revive us again: that thy people may rejoice in thee?* (vv.4-7), the
-- Ps 80 turn-us-again refrain (Hab 3:2 revive-thy-work / Lam 5:21 turn-us-and-we-shall-be-turned). It
-- hears the answer — *he will speak peace unto his people, and to his saints: but let them not turn
-- again to folly* (v.8): peace that does NOT license a return to sin (Isa 57:19 / John 14:27). Then THE
-- KEYSTONE — *Mercy and truth are met together; righteousness and peace have kissed each other. Truth
-- shall spring out of the earth; and righteousness shall look down from heaven* (vv.9-11): the four
-- attributes converge in the coming salvation, full of grace and truth in the Formed Son (John 1:14,17
-- / Ps 89:14 / Isa 45:8 / Isa 32:17). It closes on the land restored and the walk — *Yahuah (LORD)
-- shall give that which is good; and our land shall yield her increase. Righteousness shall go before
-- him; and shall set us in the way of his steps* (vv.12-13): the covenant blessing of the land (Lev
-- 26:4 / Ps 67:6 / James 1:17) + walking in His steps (1 Pet 2:21 / Isa 35:8).
-- Tag: ps085   Temp view: _s302_ps085_lookup   Sort band: 24100 (+3)
--
-- Psalm 85 coverage:
--   v.1-3  NT:     Romans 11:1 (two-house guard, not cast off)
--          Extras: weighed Baruch (restoration/return) + Tobit 13 — none a cleaner witness than the
--                  Tanakh turn-thy-captivity verses; none warranted
--          Tanakh: Deuteronomy 30:3 (turn thy captivity), Jeremiah 31:10 (he that scattered will
--                  gather), Psalm 32:1 (blessed whose sin covered)
--   v.4-7  NT:     none warranted (the revival-prayer answered within the Tanakh refrain)
--          Extras: none warranted
--          Tanakh: Psalm 80:3 / 80:7 / 80:19 (turn-us-again refrain), Habakkuk 3:2 (revive thy work),
--                  Lamentations 5:21 (turn us and we shall be turned)
--   v.8    NT:     John 14:27 (my peace I give)
--          Extras: none warranted
--          Tanakh: Isaiah 57:19 (peace, peace to him far off and near)
--   v.9-11 NT:     John 1:14 (full of grace and truth), John 1:17 (grace and truth came by Yahusha)
--          Extras: none warranted (Wisdom-of-Solomon weighed; no clean attribute-convergence witness)
--          Tanakh: Psalm 89:14 (mercy and truth go before thy face), Isaiah 45:8 (let the earth bring
--                  forth salvation/righteousness), Isaiah 32:17 (work of righteousness shall be peace)
--   v.12-13 NT:    James 1:17 (every good gift from above), 1 Peter 2:21 (follow his steps)
--          Extras: none warranted
--          Tanakh: Leviticus 26:4 (the land shall yield her increase), Psalm 67:6 (earth yield her
--                  increase), Isaiah 35:8 (the way of holiness)
--
-- THREADS (all 'free' — every member is canon Tanakh or NT):
--   1 psalm-85-thou-hast-brought-back-the-captivity-of-jacob        free  Tanakh+NT
--   2 psalm-85-turn-us-o-elohim-of-our-salvation-revive-us-again    free  Tanakh
--   3 psalm-85-he-will-speak-peace-unto-his-people                  free  Tanakh+NT
--   4 psalm-85-mercy-and-truth-are-met-together  (★★★ KEYSTONE)     free  Tanakh+NT
--   5 psalm-85-our-land-shall-yield-her-increase-his-steps          free  Tanakh+NT

CREATE TEMP VIEW _s302_ps085_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM (VALUES
    -- THREAD 1 (★★): Thou hast brought back the captivity of Jacob — covered all their sin
    ('canon','psalms',85,1,'canon','deuteronomy',30,3,'free',
      E'*That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee* (Deuteronomy 30:3). *Thou hast brought back the captivity of Jacob* (Psalm 85:1): the psalm sings as accomplished the very thing Moses promised — the turning of the captivity, the gathering of the scattered two-house people from all the nations. The restoration is not a new mercy but the covenant word kept.'),
    ('canon','psalms',85,1,'canon','jeremiah',31,10,'free',
      E'*Hear the word of Yahuah (LORD), O ye nations, and declare it in the isles afar off, and say, He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* (Jeremiah 31:10). *Thou hast brought back the captivity of Jacob* (Psalm 85:1): the One who scattered Yashar''el is the One who gathers — the bringing-back of Jacob is the Shepherd gathering His flock from the isles afar off, the regathering of the houses divided.'),
    ('canon','psalms',85,2,'canon','psalms',32,1,'free',
      E'*Blessed is he whose transgression is forgiven, whose sin is covered* (Psalm 32:1). *Thou hast forgiven the iniquity of thy people, thou hast covered all their sin* (Psalm 85:2): the same covering — the iniquity of the people forgiven, the sin covered over; the blessedness of the one whose sin is covered is the blessedness of the whole restored people.'),
    ('canon','psalms',85,1,'canon','romans',11,1,'free',
      E'*I say then, Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham, of the tribe of Benjamin* (Romans 11:1). *Thou hast brought back the captivity of Jacob* (Psalm 85:1): the bringing-back is the guard against replacement — Yahuah has NOT cast away His people; the captivity of Jacob is turned, not abandoned, the natural branches gathered home.'),

    -- THREAD 2 (★): Turn us, O Elohim of our salvation — wilt thou not revive us again
    ('canon','psalms',85,4,'canon','psalms',80,3,'free',
      E'*Turn us again, O Elohim (God), and cause thy face to shine; and we shall be saved* (Psalm 80:3). *Turn us, O Elohim (God) of our salvation, and cause thine anger toward us to cease* (Psalm 85:4): the same cry of the same gathered people — turn us, the turning is Yahuah''s work in us before it is ours toward Him; the refrain of the sister-psalm of the scattered tribes.'),
    ('canon','psalms',85,4,'canon','psalms',80,7,'free',
      E'*Turn us again, O Elohim (God) of hosts, and cause thy face to shine; and we shall be saved* (Psalm 80:7). *Turn us, O Elohim (God) of our salvation* (Psalm 85:4): the threefold refrain of Psalm 80 — Ephraim, Benjamin, Manasseh praying to be turned and saved — answered in the turning of the captivity that Psalm 85 already sings.'),
    ('canon','psalms',85,4,'canon','psalms',80,19,'free',
      E'*Turn us again, O Yahuah Elohim (LORD God) of hosts, cause thy face to shine; and we shall be saved* (Psalm 80:19). *Turn us, O Elohim (God) of our salvation* (Psalm 85:4): the last and fullest cry of the turn-us refrain, the Name made full — the restoration of the face shining is the salvation prayed for and the salvation granted.'),
    ('canon','psalms',85,6,'canon','habakkuk',3,2,'free',
      E'*O Yahuah (LORD), I have heard thy speech, and was afraid: O Yahuah (LORD), revive thy work in the midst of the years, in the midst of the years make known; in wrath remember mercy* (Habakkuk 3:2). *Wilt thou not revive us again: that thy people may rejoice in thee?* (Psalm 85:6): the same plea — revive the work, in wrath remember mercy; the reviving is Yahuah''s own doing in the midst of the years of exile.'),
    ('canon','psalms',85,4,'canon','lamentations',5,21,'free',
      E'*Turn thou us unto thee, O Yahuah (LORD), and we shall be turned; renew our days as of old* (Lamentations 5:21). *Turn us, O Elohim (God) of our salvation* (Psalm 85:4): the same grammar of grace — turn us and we SHALL be turned; the turning is given before it is performed, the days renewed as of old, the restoration of the captivity sung over the ashes of Zion.'),

    -- THREAD 3 (★): He will speak peace unto his people — but let them not turn again to folly
    ('canon','psalms',85,8,'canon','isaiah',57,19,'free',
      E'*I create the fruit of the lips; Peace, peace to him that is far off, and to him that is near, saith Yahuah (LORD); and I will heal him* (Isaiah 57:19). *He will speak peace unto his people, and to his saints* (Psalm 85:8): the peace Yahuah speaks is the peace He creates — peace to the far off (the scattered house) and the near (the house at home), the two made one, the healing of the people who turn not again to folly.'),
    ('canon','psalms',85,8,'canon','john',14,27,'free',
      E'*Peace I leave with you, my peace I give unto you: not as the world giveth, give I unto you. Let not your heart be troubled, neither let it be afraid* (John 14:27). *He will speak peace unto his people, and to his saints: but let them not turn again to folly* (Psalm 85:8): the peace Yahuah speaks is the peace the Formed Son gives — not the world''s peace, but His own; and it is no license to fold back into sin — *let them not turn again to folly* — the peace that keeps the people in the way.'),

    -- THREAD 4 (★★★ KEYSTONE): Mercy and truth are met together — truth shall spring out of the earth
    ('canon','psalms',85,10,'canon','john',1,14,'free',
      E'*And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth* (John 1:14). *Mercy and truth are met together; righteousness and peace have kissed each other* (Psalm 85:10): the attributes that meet meet in a Person — the Word made flesh, full of grace and truth, the glory dwelling in the land that the psalm longs for (v.9, *that glory may dwell in our land*); mercy and truth are met together in the Formed Son.'),
    ('canon','psalms',85,11,'canon','john',1,17,'free',
      E'*For the law was given by Moses, but grace and truth came by Yahusha HaMashiach (Jesus Christ)* (John 1:17). *Truth shall spring out of the earth; and righteousness shall look down from heaven* (Psalm 85:11): the truth that springs out of the earth is the grace and truth that CAME — not against the law given by Moses but as its living fulness; truth arising from below, righteousness looking down from above, met in the One who came.'),
    ('canon','psalms',85,10,'canon','psalms',89,14,'free',
      E'*Justice and judgment are the habitation of thy throne: mercy and truth shall go before thy face* (Psalm 89:14). *Mercy and truth are met together; righteousness and peace have kissed each other* (Psalm 85:10): the same four attributes ordered round the throne — mercy and truth go before His face, justice and judgment the habitation of His throne; what stands before Yahuah''s throne comes down and meets in the salvation nigh them that fear Him.'),
    ('canon','psalms',85,11,'canon','isaiah',45,8,'free',
      E'*Drop down, ye heavens, from above, and let the skies pour down righteousness: let the earth open, and let them bring forth salvation, and let righteousness spring up together; I Yahuah (LORD) have created it* (Isaiah 45:8). *Truth shall spring out of the earth; and righteousness shall look down from heaven* (Psalm 85:11): the very picture — the earth opening to bring forth salvation and truth, the heavens raining down righteousness; the salvation nigh them that fear Him springs up from below and looks down from above.'),
    ('canon','psalms',85,10,'canon','isaiah',32,17,'free',
      E'*And the work of righteousness shall be peace; and the effect of righteousness quietness and assurance for ever* (Isaiah 32:17). *Righteousness and peace have kissed each other* (Psalm 85:10): the kiss of righteousness and peace is the work of righteousness — where righteousness is done, peace is its fruit; the two are not at odds but embrace, quietness and assurance for ever.'),

    -- THREAD 5 (★): Our land shall yield her increase — set us in the way of his steps
    ('canon','psalms',85,12,'canon','leviticus',26,4,'free',
      E'*Then I will give you rain in due season, and the land shall yield her increase, and the trees of the field shall yield their fruit* (Leviticus 26:4). *Yahuah (LORD) shall give that which is good; and our land shall yield her increase* (Psalm 85:12): the covenant blessing of Leviticus 26 — walk in the statutes and the land yields her increase; the restored land yielding is the Torah-blessing returning to the regathered people.'),
    ('canon','psalms',85,12,'canon','psalms',67,6,'free',
      E'*Then shall the earth yield her increase; and Elohim (God), even our own Elohim (God), shall bless us* (Psalm 67:6). *And our land shall yield her increase* (Psalm 85:12): the same blessing-fruit — the earth yielding her increase is the sign of Elohim blessing His own, the goodness given when His face shines upon His people.'),
    ('canon','psalms',85,12,'canon','james',1,17,'free',
      E'*Every good gift and every perfect gift is from above, and cometh down from the Father of lights, with whom is no variableness, neither shadow of turning* (James 1:17). *Yahuah (LORD) shall give that which is good* (Psalm 85:12): the good that Yahuah gives is the good gift from above — every good and perfect gift cometh down from the Father; the increase of the land is His giving, not the land''s own strength.'),
    ('canon','psalms',85,13,'canon','1-peter',2,21,'free',
      E'*For even hereunto were ye called: because Messiah (Christ) also suffered for us, leaving us an example, that ye should follow his steps* (1 Peter 2:21). *Righteousness shall go before him; and shall set us in the way of his steps* (Psalm 85:13): righteousness going before Him makes the path, and the people are set in the way of His steps — the walking-after that Peter names, following the steps of the Messiah in the way of righteousness.'),
    ('canon','psalms',85,13,'canon','isaiah',35,8,'free',
      E'*And an highway shall be there, and a way, and it shall be called The way of holiness; the unclean shall not pass over it; but it shall be for those: the wayfaring men, though fools, shall not err therein* (Isaiah 35:8). *Righteousness shall go before him; and shall set us in the way of his steps* (Psalm 85:13): the way righteousness prepares is The way of holiness — the highway through the wilderness on which the redeemed walk, set in the steps righteousness has gone before to make.')
  ) AS i(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note)
  JOIN _s302_ps085_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s302_ps085_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ===== THREADS =====

-- THREAD 1 (★★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-85-thou-hast-brought-back-the-captivity-of-jacob',
       E'Thou hast brought back the captivity of Jacob — covered all their sin',
       E'The psalm opens on the restoration sung as accomplished: *Yahuah (LORD), thou hast been favourable unto thy land: thou hast brought back the captivity of Jacob. Thou hast forgiven the iniquity of thy people, thou hast covered all their sin* (Psalm 85:1-2). This is the two-house regathering and the forgiveness that goes with it. Moses had promised the turning: *Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations* (Deuteronomy 30:3). Jeremiah named the Gatherer: *He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* (Jeremiah 31:10) — the One who scattered is the One who brings back. The covered sin is the blessedness of the whole people: *Blessed is he whose transgression is forgiven, whose sin is covered* (Psalm 32:1). And the bringing-back is the standing guard against replacement: *Hath Elohim (God) cast away his people? Elohim (God) forbid... For I also am an Israelite, of the seed of Abraham* (Romans 11:1) — the captivity of Jacob is turned, the natural branches gathered home, never cast off.',
       sv.verse_id, ev.verse_id, 'free', 24100
  FROM _s302_ps085_lookup sv, _s302_ps085_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=85 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=85 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

-- THREAD 2 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-85-turn-us-o-elohim-of-our-salvation-revive-us-again',
       E'Turn us, O Elohim of our salvation — wilt thou not revive us again',
       E'From the restoration sung, the psalm turns to the prayer that it be made full: *Turn us, O Elohim (God) of our salvation, and cause thine anger toward us to cease. Wilt thou be angry with us for ever?... Wilt thou not revive us again: that thy people may rejoice in thee? Shew us thy mercy, O Yahuah (LORD), and grant us thy salvation* (Psalm 85:4-7). This is the turn-us-again refrain of the sister-psalm of the scattered tribes, prayed three times: *Turn us again, O Elohim (God), and cause thy face to shine; and we shall be saved* (Psalm 80:3); *Turn us again, O Elohim (God) of hosts* (Psalm 80:7); *Turn us again, O Yahuah Elohim (LORD God) of hosts, cause thy face to shine; and we shall be saved* (Psalm 80:19). It is the prophet''s plea for revival: *O Yahuah (LORD), revive thy work in the midst of the years... in wrath remember mercy* (Habakkuk 3:2). And it is the grammar of grace from the ashes of Zion: *Turn thou us unto thee, O Yahuah (LORD), and we shall be turned; renew our days as of old* (Lamentations 5:21) — the turning given before it is performed, the reviving Yahuah''s own work in His people.',
       sv.verse_id, ev.verse_id, 'free', 24103
  FROM _s302_ps085_lookup sv, _s302_ps085_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=85 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=85 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- THREAD 3 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-85-he-will-speak-peace-unto-his-people',
       E'He will speak peace unto his people — but let them not turn again to folly',
       E'The psalmist waits for the answer and hears it: *I will hear what Elohim (God) Yahuah (LORD) will speak: for he will speak peace unto his people, and to his saints: but let them not turn again to folly* (Psalm 85:8). The peace Yahuah speaks is the peace He creates for the gathered houses, far and near: *I create the fruit of the lips; Peace, peace to him that is far off, and to him that is near, saith Yahuah (LORD); and I will heal him* (Isaiah 57:19) — the far house and the near house healed in one peace. And it is the very peace the Formed Son gives: *Peace I leave with you, my peace I give unto you: not as the world giveth, give I unto you* (John 14:27). But this peace is no license to fold back into sin — *let them not turn again to folly* — the peace that keeps the people in the way, Torah-walking affirmed, not a peace that permits the return to the very rebellion the captivity punished.',
       sv.verse_id, ev.verse_id, 'free', 24106
  FROM _s302_ps085_lookup sv, _s302_ps085_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=85 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=85 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- THREAD 4 (★★★ KEYSTONE)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-85-mercy-and-truth-are-met-together',
       E'Mercy and truth are met together — truth shall spring out of the earth',
       E'The keystone: *Surely his salvation is nigh them that fear him; that glory may dwell in our land. Mercy and truth are met together; righteousness and peace have kissed each other. Truth shall spring out of the earth; and righteousness shall look down from heaven* (Psalm 85:9-11). The four attributes — mercy, truth, righteousness, peace — converge in the coming salvation, and they converge in a Person. The glory the psalm longs to see dwell in the land comes to dwell: *And the Word was made flesh, and dwelt among us, (and we beheld his glory, the glory as of the only begotten of the Father,) full of grace and truth* (John 1:14) — mercy and truth met together in the Formed Son. The truth that springs out of the earth is the grace and truth that CAME: *the law was given by Moses, but grace and truth came by Yahusha HaMashiach (Jesus Christ)* (John 1:17) — not against the Torah given by Moses but its living fulness, truth arising from below as righteousness looks down from above. These are the attributes that stand round Yahuah''s throne: *mercy and truth shall go before thy face* (Psalm 89:14). The picture is Isaiah''s own: *let the earth open, and let them bring forth salvation, and let righteousness spring up together; I Yahuah (LORD) have created it* (Isaiah 45:8). And the kiss of righteousness and peace is no accident but the fruit of righteousness done: *the work of righteousness shall be peace* (Isaiah 32:17). Come and see — truth springing out of the earth is the salvation arising, the glory come to dwell in the land.',
       sv.verse_id, ev.verse_id, 'free', 24109
  FROM _s302_ps085_lookup sv, _s302_ps085_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=85 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=85 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

-- THREAD 5 (★)
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'psalm-85-our-land-shall-yield-her-increase-his-steps',
       E'Our land shall yield her increase — set us in the way of his steps',
       E'The psalm closes on the covenant blessing of the restored land and the walk that follows: *Yea, Yahuah (LORD) shall give that which is good; and our land shall yield her increase. Righteousness shall go before him; and shall set us in the way of his steps* (Psalm 85:12-13). The land yielding her increase is the Leviticus 26 blessing returning to the regathered people: *If ye walk in my statutes... then I will give you rain in due season, and the land shall yield her increase, and the trees of the field shall yield their fruit* (Leviticus 26:3-4). It is the blessing-fruit when His face shines on His own: *Then shall the earth yield her increase; and Elohim (God), even our own Elohim (God), shall bless us* (Psalm 67:6). The good Yahuah gives is the good gift from above: *Every good gift and every perfect gift is from above, and cometh down from the Father of lights* (James 1:17). And the way righteousness goes before to prepare is the way of His steps, walked after the Messiah: *Messiah (Christ) also suffered for us, leaving us an example, that ye should follow his steps* (1 Peter 2:21) — The way of holiness on which the redeemed walk: *an highway shall be there, and a way, and it shall be called The way of holiness... the wayfaring men, though fools, shall not err therein* (Isaiah 35:8).',
       sv.verse_id, ev.verse_id, 'free', 24112
  FROM _s302_ps085_lookup sv, _s302_ps085_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=85 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='psalms' AND ev.chapter_number=85 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ===== THREAD MEMBERS =====

-- THREAD 1 members (★★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Yahuah Elohayka (the LORD thy God) will turn thy captivity... and gather thee from all the nations* (Deuteronomy 30:3) — the turning of the captivity in 85:1 is Moses'' promise kept: the two-house people gathered from all the nations.'
  FROM cross_reference_threads t
  JOIN _s302_ps085_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=85 AND sv.verse_number=1
  JOIN _s302_ps085_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=30 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-85-thou-hast-brought-back-the-captivity-of-jacob'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* (Jeremiah 31:10) — the bringing-back of Jacob (85:1) is the Scatterer become the Gatherer: the flock gathered from the isles afar off.'
  FROM cross_reference_threads t
  JOIN _s302_ps085_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=85 AND sv.verse_number=1
  JOIN _s302_ps085_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=10
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-85-thou-hast-brought-back-the-captivity-of-jacob'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Blessed is he whose transgression is forgiven, whose sin is covered* (Psalm 32:1) — the covered sin of 85:2: the iniquity forgiven, all their sin covered over, the blessedness of the whole restored people.'
  FROM cross_reference_threads t
  JOIN _s302_ps085_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=85 AND sv.verse_number=2
  JOIN _s302_ps085_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=32 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-85-thou-hast-brought-back-the-captivity-of-jacob'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Hath Elohim (God) cast away his people? Elohim (God) forbid. For I also am an Israelite, of the seed of Abraham* (Romans 11:1) — the guard on 85:1: the captivity of Jacob is turned, not abandoned; the natural branches gathered home, never cast off.'
  FROM cross_reference_threads t
  JOIN _s302_ps085_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=85 AND sv.verse_number=1
  JOIN _s302_ps085_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=1
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-85-thou-hast-brought-back-the-captivity-of-jacob'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 2 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *Turn us again, O Elohim (God), and cause thy face to shine; and we shall be saved* (Psalm 80:3) — the turn-us refrain of the scattered tribes: the same cry as 85:4, the turning Yahuah''s work in us.'
  FROM cross_reference_threads t
  JOIN _s302_ps085_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=85 AND sv.verse_number=4
  JOIN _s302_ps085_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=80 AND tv.verse_number=3
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-85-turn-us-o-elohim-of-our-salvation-revive-us-again'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Turn us again, O Elohim (God) of hosts, and cause thy face to shine; and we shall be saved* (Psalm 80:7) — the second cry of the threefold refrain answered in the turning 85:1 already sings.'
  FROM cross_reference_threads t
  JOIN _s302_ps085_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=85 AND sv.verse_number=4
  JOIN _s302_ps085_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=80 AND tv.verse_number=7
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-85-turn-us-o-elohim-of-our-salvation-revive-us-again'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Turn us again, O Yahuah Elohim (LORD God) of hosts, cause thy face to shine; and we shall be saved* (Psalm 80:19) — the last and fullest cry of the refrain, the Name made full: the face shining is the salvation prayed for in 85:4.'
  FROM cross_reference_threads t
  JOIN _s302_ps085_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=85 AND sv.verse_number=4
  JOIN _s302_ps085_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=80 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-85-turn-us-o-elohim-of-our-salvation-revive-us-again'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *O Yahuah (LORD), revive thy work in the midst of the years... in wrath remember mercy* (Habakkuk 3:2) — the same plea as 85:6: revive the work, in wrath remember mercy; the reviving Yahuah''s own doing in the midst of exile.'
  FROM cross_reference_threads t
  JOIN _s302_ps085_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=85 AND sv.verse_number=6
  JOIN _s302_ps085_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=3 AND tv.verse_number=2
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-85-turn-us-o-elohim-of-our-salvation-revive-us-again'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *Turn thou us unto thee, O Yahuah (LORD), and we shall be turned; renew our days as of old* (Lamentations 5:21) — the grammar of grace behind 85:4: turn us and we SHALL be turned, the days renewed as of old.'
  FROM cross_reference_threads t
  JOIN _s302_ps085_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=85 AND sv.verse_number=4
  JOIN _s302_ps085_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='lamentations' AND tv.chapter_number=5 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-85-turn-us-o-elohim-of-our-salvation-revive-us-again'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 3 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *I create the fruit of the lips; Peace, peace to him that is far off, and to him that is near, saith Yahuah (LORD); and I will heal him* (Isaiah 57:19) — the peace 85:8 speaks: peace to the far house and the near, the two made one and healed.'
  FROM cross_reference_threads t
  JOIN _s302_ps085_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=85 AND sv.verse_number=8
  JOIN _s302_ps085_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=57 AND tv.verse_number=19
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-85-he-will-speak-peace-unto-his-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★ *Peace I leave with you, my peace I give unto you: not as the world giveth, give I unto you* (John 14:27) — the peace Yahuah speaks in 85:8 is the peace the Formed Son gives; and *let them not turn again to folly* — no license to fold back into sin.'
  FROM cross_reference_threads t
  JOIN _s302_ps085_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=85 AND sv.verse_number=8
  JOIN _s302_ps085_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=27
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-85-he-will-speak-peace-unto-his-people'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 4 members (★★★ KEYSTONE)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★★★ *And the Word was made flesh, and dwelt among us... full of grace and truth* (John 1:14) — mercy and truth met together (85:10) in a Person: the glory come to dwell in the land the psalm longs for (85:9).'
  FROM cross_reference_threads t
  JOIN _s302_ps085_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=85 AND sv.verse_number=10
  JOIN _s302_ps085_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-85-mercy-and-truth-are-met-together'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'★★★ *the law was given by Moses, but grace and truth came by Yahusha HaMashiach (Jesus Christ)* (John 1:17) — the truth springing out of the earth (85:11) is the grace and truth that CAME: not against the Torah but its living fulness.'
  FROM cross_reference_threads t
  JOIN _s302_ps085_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=85 AND sv.verse_number=11
  JOIN _s302_ps085_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=1 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-85-mercy-and-truth-are-met-together'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'★ *Justice and judgment are the habitation of thy throne: mercy and truth shall go before thy face* (Psalm 89:14) — the same four attributes round the throne: what goes before Yahuah''s face comes down and meets in the salvation of 85:10.'
  FROM cross_reference_threads t
  JOIN _s302_ps085_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=85 AND sv.verse_number=10
  JOIN _s302_ps085_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=89 AND tv.verse_number=14
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-85-mercy-and-truth-are-met-together'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *let the earth open, and let them bring forth salvation, and let righteousness spring up together; I Yahuah (LORD) have created it* (Isaiah 45:8) — the very picture of 85:11: the earth opening to bring forth salvation, the heavens raining righteousness.'
  FROM cross_reference_threads t
  JOIN _s302_ps085_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=85 AND sv.verse_number=11
  JOIN _s302_ps085_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-85-mercy-and-truth-are-met-together'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'★ *the work of righteousness shall be peace; and the effect of righteousness quietness and assurance for ever* (Isaiah 32:17) — the kiss of righteousness and peace (85:10) is no accident: where righteousness is done, peace is its fruit.'
  FROM cross_reference_threads t
  JOIN _s302_ps085_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=85 AND sv.verse_number=10
  JOIN _s302_ps085_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=32 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-85-mercy-and-truth-are-met-together'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- THREAD 5 members (★)
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 1, E'★ *I will give you rain in due season, and the land shall yield her increase, and the trees of the field shall yield their fruit* (Leviticus 26:4) — the land yielding in 85:12 is the Leviticus 26 covenant-blessing returning to the regathered people.'
  FROM cross_reference_threads t
  JOIN _s302_ps085_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=85 AND sv.verse_number=12
  JOIN _s302_ps085_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=4
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-85-our-land-shall-yield-her-increase-his-steps'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 2, E'*Then shall the earth yield her increase; and Elohim (God), even our own Elohim (God), shall bless us* (Psalm 67:6) — the same blessing-fruit as 85:12: the earth yielding her increase the sign of Elohim blessing His own.'
  FROM cross_reference_threads t
  JOIN _s302_ps085_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=85 AND sv.verse_number=12
  JOIN _s302_ps085_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=67 AND tv.verse_number=6
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-85-our-land-shall-yield-her-increase-his-steps'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 3, E'*Every good gift and every perfect gift is from above, and cometh down from the Father of lights* (James 1:17) — the good Yahuah gives in 85:12 is the good gift from above: the increase His giving, not the land''s own strength.'
  FROM cross_reference_threads t
  JOIN _s302_ps085_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=85 AND sv.verse_number=12
  JOIN _s302_ps085_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=17
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-85-our-land-shall-yield-her-increase-his-steps'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 4, E'★ *Messiah (Christ) also suffered for us, leaving us an example, that ye should follow his steps* (1 Peter 2:21) — the way of his steps (85:13) is the walking-after Peter names: following the steps of the Messiah in righteousness.'
  FROM cross_reference_threads t
  JOIN _s302_ps085_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=85 AND sv.verse_number=13
  JOIN _s302_ps085_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=2 AND tv.verse_number=21
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-85-our-land-shall-yield-her-increase-his-steps'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, cr.id, 5, E'*an highway shall be there, and a way, and it shall be called The way of holiness... the wayfaring men, though fools, shall not err therein* (Isaiah 35:8) — the way righteousness goes before to prepare (85:13) is The way of holiness on which the redeemed walk.'
  FROM cross_reference_threads t
  JOIN _s302_ps085_lookup sv ON sv.edition_slug='canon' AND sv.book_slug='psalms' AND sv.chapter_number=85 AND sv.verse_number=13
  JOIN _s302_ps085_lookup tv ON tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=35 AND tv.verse_number=8
  JOIN cross_references cr ON cr.source_verse_id=sv.verse_id AND cr.target_verse_id=tv.verse_id AND cr.source='manual'
 WHERE t.slug='psalm-85-our-land-shall-yield-her-increase-his-steps'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
