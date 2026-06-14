-- ----- fragment: minion_2thessalonians_02.sql (S234 2 Thessalonians 2) -----
-- =====================================================================
-- S234 minion — 2 THESSALONIANS 2 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 2 THESSALONIANS 2 (17 verses) — ★★ HIGHEST watchpoint / BLESSING (the man of sin).
-- Tag: t202 (temp view _s234_t202_lookup).
-- Sort band: floor 8225, step 3 (8225, 8228, 8231, 8234, 8237 used; under 8250).
-- Source is ALWAYS the canon 2 Thessalonians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (2 Thess 2 = the falling away and the man of sin). The man of sin = the antichrist =
-- Daniel's little horn / the self-deifying tyrant already drawn in the Tanakh. The deceiver is the
-- COUNTERFEIT, not the covenant people; the *falling away* and *the temple* are NOT Israel cast off.
-- Build the man-of-sin thread on Daniel 11:36 + 7:25 + 8:25 + Isaiah 14:13-14 + Ezekiel 28:2 (the king
-- who exalts himself above every god, the self-deifying man who says he is Elohim), with NT twins
-- Matthew 24:15 (the abomination) and Revelation 13 (the beast who blasphemes). His consuming *with the
-- spirit of his mouth* (2:8) is Isaiah 11:4 (*with the breath of his lips shall he slay the wicked*) —
-- the Formed Son slays the Wicked by his word. *Our gathering together unto him* (2:1) is the SAME
-- ingathering as 1 Thess 4 / Isaiah 27:13 / 1 Cor 15:52 — the one great trump-gathering, NOT severed
-- from Israel's regathering. *Chosen from the beginning to salvation* (2:13) is the election of
-- Deuteronomy 7 carried into Ephesians 1:4. Christology: the Father chose and called (2:13-14); the Son
-- the Formed who consumes the Wicked at his coming. No replacement theology; the antichrist is the
-- self-exalting counterfeit, Israel is never replaced.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   our gathering together unto him; the day of Messiah
--           Tanakh: Isaiah 27:13 (the great trumpet shall be blown, and they shall come which were
--                   ready to perish... and shall worship Yahuah)
--           Extras: none warranted (carried at 2:8 / the day-tokens at 2:7,11)
--           NT: 1 Corinthians 15:52 (at the last trump... the dead shall be raised) — the one
--               ingathering, the same trump as 1 Thess 4
--   v.3-4   the man of sin revealed, who exalts himself above all called Elohim, sits in the temple
--           Tanakh: Daniel 11:36 (the king... shall exalt himself, and magnify himself above every
--                   god, and shall speak marvellous things), Daniel 7:25 (he shall speak great words
--                   against the most High, and wear out the saints), Daniel 8:25 (he shall magnify
--                   himself in his heart... stand up against the Prince of princes), Isaiah 14:13-14
--                   (I will exalt my throne... I will be like the most High), Ezekiel 28:2 (thou hast
--                   said, I am a Elohim... yet thou art a man)
--           Extras: none warranted (the self-deifying figure is fully drawn in the canon Tanakh)
--           NT: Matthew 24:15 (the abomination of desolation... stand in the holy place), Revelation
--               13:5-6 (a mouth speaking great things and blasphemies... blaspheme his name, and his
--               tabernacle)
--   v.5-7   ye know what withholdeth; the mystery of iniquity doth already work
--           Tanakh: none warranted   NT: none warranted
--           Extras: 2 Esdras 5:6 (even he shall rule, whom they look not for that dwell upon the earth)
--                   — the deceiving rule revealed in the day of tokens / lawlessness multiplied
--   v.8     that Wicked... whom Yahuah shall consume with the spirit of his mouth
--           Tanakh: Isaiah 11:4 (with the breath of his lips shall he slay the wicked)
--           Extras: none warranted   NT: none warranted
--   v.9-12  the working of Satan, lying wonders, strong delusion, believe a lie
--           Tanakh: none warranted (carried in the mystery-of-iniquity thread)
--           Extras: weighed (2 Esdras 5 lawlessness) — folded into the mystery thread; none added here
--           NT: none warranted
--   v.13-14 chosen from the beginning to salvation, called by the gospel
--           Tanakh: Deuteronomy 7:6-7 (Yahuah thy Elohim hath chosen thee to be a special people)
--           Extras: none warranted   NT: Ephesians 1:4 (chosen us in him before the foundation of
--                   the world)
--   v.15-17 hold the traditions taught; comfort your hearts, stablish you in every good word and work
--           Tanakh: none warranted   Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   8225 2-thessalonians-2-the-man-of-sin-who-exalts-himself-above-all-elohim-daniel-11-isaiah-14-ezekiel-28  (Tanakh + NT)  [★★ BLESSING]
--   8228 2-thessalonians-2-whom-yahuah-shall-consume-with-the-spirit-of-his-mouth-isaiah-11  (Tanakh)
--   8231 2-thessalonians-2-our-gathering-together-unto-him-at-the-last-trump-isaiah-27  (Tanakh + NT)
--   8234 2-thessalonians-2-chosen-from-the-beginning-to-salvation-deuteronomy-7-ephesians-1  (Tanakh + NT)
--   8237 2-thessalonians-2-the-mystery-of-iniquity-already-at-work-2-esdras-5  (Extras)
-- =====================================================================

CREATE TEMP VIEW _s234_t202_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-thessalonians-2-the-man-of-sin-who-exalts-himself-above-all-elohim-daniel-11-isaiah-14-ezekiel-28  [★★ BLESSING]
  ('canon', '2-thessalonians', 2, 4, 'canon', 'daniel', 11, 36, 'free', E'*And the king shall do according to his will; and he shall exalt himself, and magnify himself above every god, and shall speak marvellous things against the Elohim (God) of gods, and shall prosper till the indignation be accomplished: for that that is determined shall be done.* (Daniel 11:36). The man of sin is no new figure; Daniel drew him long before. The king who *shall exalt himself, and magnify himself above every god* is the one *who opposeth and exalteth himself above all that is called Elohim (God)* (2 Thessalonians 2:4); the one who *speak marvellous things against the Elohim (God) of gods* is the one *shewing himself that he is Elohim (God).* This is the antichrist drawn in the Tanakh — Daniel''s self-deifying tyrant — not Israel cast off; the deceiver is the counterfeit, and he prospers only *till the indignation be accomplished,* his end already determined.'),
  ('canon', '2-thessalonians', 2, 4, 'canon', 'daniel', 7, 25, 'free', E'*And he shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High), and think to change times and laws: and they shall be given into his hand until a time and times and the dividing of time.* (Daniel 7:25). Daniel''s little horn *shall speak great words against the El Elyon (most High)* and set himself against the saints — the very posture of the man of sin who *exalteth himself above all that is called Elohim (God)... so that he as Elohim (God) sitteth in the temple of Elohim (God)* (2 Thessalonians 2:4). The horn is given the saints only for an appointed season, *a time and times and the dividing of time*; just so Paul''s man of sin is permitted only *in his time* (2 Thessalonians 2:6) before he is consumed. The blasphemer is the counterfeit who wears out the holy people, not the holy people themselves.'),
  ('canon', '2-thessalonians', 2, 4, 'canon', 'daniel', 8, 25, 'free', E'*And through his policy also he shall cause craft to prosper in his hand; and he shall magnify himself in his heart, and by peace shall destroy many: he shall also stand up against the Prince of princes; but he shall be broken without hand.* (Daniel 8:25). Daniel''s self-magnifying king *shall magnify himself in his heart* and *stand up against the Prince of princes* — the same lifting-up as the man of sin who *exalteth himself above all that is called Elohim (God)* (2 Thessalonians 2:4). And mark his end: *he shall be broken without hand* — broken by no mortal power, even as the Wicked is consumed *with the spirit of his mouth* and destroyed *with the brightness of his coming* (2 Thessalonians 2:8). The tyrant who stands against the Prince of princes is shattered by the Prince himself.'),
  ('canon', '2-thessalonians', 2, 4, 'canon', 'isaiah', 14, 13, 'free', E'*For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation, in the sides of the north:* (Isaiah 14:13). The boast of the fallen one is the boast of the man of sin: *I will exalt my throne above the stars of Elohim (God)* is the self-exaltation of him who *exalteth himself above all that is called Elohim (God)* and *as Elohim (God) sitteth in the temple of Elohim (God)* (2 Thessalonians 2:4). The man of sin enthrones himself in the seat of the Most High, the ancient lie that one cut down to the ground would *be like the El Elyon (most High)* (Isaiah 14:14) — the counterfeit god, never the covenant people.'),
  ('canon', '2-thessalonians', 2, 4, 'canon', 'isaiah', 14, 14, 'free', E'*I will ascend above the heights of the clouds; I will be like the El Elyon (most High).* (Isaiah 14:14). Here is the root blasphemy: *I will be like the El Elyon (most High).* The man of sin is its full flower — he *exalteth himself above all that is called Elohim (God), or that is worshipped... shewing himself that he is Elohim (God)* (2 Thessalonians 2:4). To be *like the most High,* to be worshipped as Elohim (God) — this is the lie spoken in the heart of the fallen one and acted out by the son of perdition. He is the counterfeit who claims the throne of the Most High, and is broken for it.'),
  ('canon', '2-thessalonians', 2, 4, 'canon', 'ezekiel', 28, 2, 'free', E'*Son of Adam, say unto the prince of Tyrus, Thus saith Adonai Yahuah (the Lord GOD); Because thine heart is lifted up, and thou hast said, I am a Elohim (God), I sit in the seat of Elohim (God), in the midst of the seas; yet thou art a man, and not Elohim (God), though thou set thine heart as the heart of Elohim (God):* (Ezekiel 28:2). The prince of Tyrus said *I am a Elohim (God), I sit in the seat of Elohim (God)* — and Yahuah (LORD) answers, *yet thou art a man, and not Elohim (God).* This is the exact unmasking of the man of sin: he *sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God)* (2 Thessalonians 2:4), yet Paul names him *that man of sin... the son of perdition* (2 Thessalonians 2:3) — a man, not Elohim (God). The self-deifying claim is the heart lifted up; the truth is he is a man, and will be consumed.'),
  ('canon', '2-thessalonians', 2, 4, 'canon', 'matthew', 24, 15, 'free', E'*When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* (Matthew 24:15). Yahusha (Jesus) pointed to *the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place* — the defiling thing set up where it ought not to be. Paul names the same: the man of sin who *as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God)* (2 Thessalonians 2:4). The abomination standing in the holy place and the son of perdition seated in the temple are one prophecy; both are Daniel''s figure, the counterfeit in the sanctuary, not the holy people cast off.'),
  ('canon', '2-thessalonians', 2, 4, 'canon', 'revelation', 13, 5, 'free', E'*And there was given unto him a mouth speaking great things and blasphemies; and power was given unto him to continue forty and two months.* (Revelation 13:5). The beast is given *a mouth speaking great things and blasphemies* — Daniel''s *great words against the most High* (Daniel 7:25) become flesh in the beast, and the same mouth in the man of sin who *opposeth and exalteth himself above all that is called Elohim (God)* (2 Thessalonians 2:4). And as the man of sin is permitted only *in his time* (2 Thessalonians 2:6), the beast is given *forty and two months* — a fixed and bounded season. The self-exalting blasphemer of Paul, of Daniel, and of John is one figure under one limit.'),
  ('canon', '2-thessalonians', 2, 4, 'canon', 'revelation', 13, 6, 'free', E'*And he opened his mouth in blasphemy against Elohim (God), to blaspheme his name, and his tabernacle, and them that dwell in heaven.* (Revelation 13:6). The beast *opened his mouth in blasphemy against Elohim (God), to blaspheme his name, and his tabernacle* — the very sacrilege of the man of sin who seats himself *in the temple of Elohim (God), shewing himself that he is Elohim (God)* (2 Thessalonians 2:4). To blaspheme the name and the tabernacle is to usurp the place of Elohim (God); the beast and the son of perdition both make war on the dwelling of the Most High, and both are revealed only to be destroyed by the One who truly reigns.'),
  -- thread: 2-thessalonians-2-whom-yahuah-shall-consume-with-the-spirit-of-his-mouth-isaiah-11
  ('canon', '2-thessalonians', 2, 8, 'canon', 'isaiah', 11, 4, 'free', E'*But with righteousness shall he judge the poor, and reprove with equity for the meek of the earth: and he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* (Isaiah 11:4). The Branch from the stem of Jesse *shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked.* This is the weapon Paul names against the man of sin: *that Wicked... whom Yahuah (Lord) shall consume with the spirit of his mouth, and shall destroy with the brightness of his coming* (2 Thessalonians 2:8). The Formed Son slays the Wicked by no army and no hand, but by the breath of his lips, the word of his mouth; the self-deifying tyrant who exalted himself above all is undone by a single utterance of the true King.'),
  -- thread: 2-thessalonians-2-our-gathering-together-unto-him-at-the-last-trump-isaiah-27
  ('canon', '2-thessalonians', 2, 1, 'canon', 'isaiah', 27, 13, 'free', E'*And it shall come to pass in that day, that the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem.* (Isaiah 27:13). When Paul writes *by the coming of our Lord Yahusha HaMashiach (Lord Jesus Christ), and by our gathering together unto him* (2 Thessalonians 2:1), he names the same ingathering Isaiah saw — *the great trumpet shall be blown, and they shall come which were ready to perish... the outcasts.* The gathering is the regathering of the scattered to worship Yahuah (LORD) in the holy mount; the day cannot be severed from Israel''s ingathering. This is the one great trump-gathering, not a secret rapture detached from the regathered people.'),
  ('canon', '2-thessalonians', 2, 1, 'canon', '1-corinthians', 15, 52, 'free', E'*In a moment, in the twinkling of an eye, at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible, and we shall be changed.* (1 Corinthians 15:52). Paul''s *our gathering together unto him* (2 Thessalonians 2:1) is the same event he names *at the last trump: for the trumpet shall sound, and the dead shall be raised.* The trump of Isaiah 27:13, the last trump of this verse, and the trump of Elohim (God) at the descent in 1 Thessalonians 4:16 are one sounding — the single resurrection-ingathering of the gathered house and the grafted-in. The day of the man of sin and the day of the gathering belong together; the saints are not snatched away in secret but raised and assembled at the trumpet of the King.'),
  -- thread: 2-thessalonians-2-chosen-from-the-beginning-to-salvation-deuteronomy-7-ephesians-1
  ('canon', '2-thessalonians', 2, 13, 'canon', 'deuteronomy', 7, 6, 'free', E'*For thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth.* (Deuteronomy 7:6). The election Paul gives thanks for — *Elohim (God) hath from the beginning chosen you to salvation through sanctification of the Spirit* (2 Thessalonians 2:13) — is the ancient choosing of Yahuah (LORD): *Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself.* The same electing love that set Yahuah (LORD)''s love upon Yashar''el (Israel) gathers the called-out at Thessalonica; not a new election replacing the old, but the one choosing extended to the grafted-in, *a special people unto himself.*'),
  ('canon', '2-thessalonians', 2, 13, 'canon', 'ephesians', 1, 4, 'free', E'*According as he hath chosen us in him before the foundation of the world, that we should be holy and without blame before him in love:* (Ephesians 1:4). Paul says the same to the Thessalonians as to the Ephesians: *Elohim (God) hath from the beginning chosen you to salvation* (2 Thessalonians 2:13) is *he hath chosen us in him before the foundation of the world.* The choosing is the Father''s, from the beginning, before the world was; and it is *to salvation through sanctification of the Spirit* — chosen *that we should be holy.* The Father elects and calls (2 Thessalonians 2:13-14); the Son is the One *unto* whose glory they are called, the Formed in whom the choosing is made.'),
  -- thread: 2-thessalonians-2-the-mystery-of-iniquity-already-at-work-2-esdras-5
  ('canon', '2-thessalonians', 2, 7, 'apocrypha', '2-esdras', 5, 6, 'extras', E'*And even he shall rule, whom they look not for that dwell upon the earth, and the fowls shall take their flight away together:* (2 Esdras 5:6). The restored library foresaw a deceiving rule rising in the days of lawlessness — *even he shall rule, whom they look not for that dwell upon the earth* — set among the tokens when *unrighteousness and incontinency be multiplied upon earth* (2 Esdras 5:10). Paul says of his own day, *the mystery of iniquity doth already work: only he who now letteth will let, until he be taken out of the way* (2 Thessalonians 2:7), and then *that Wicked* is revealed. The unlooked-for ruler of Esdras and the man of sin held back for his time are the same shadow — the lawless one whose rising is the sign of the day, who is then consumed.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s234_t202_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s234_t202_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-thessalonians-2-the-man-of-sin-who-exalts-himself-above-all-elohim-daniel-11-isaiah-14-ezekiel-28',
       E'The man of sin who exalts himself above all that is called Elohim (Daniel 11, 7, 8; Isaiah 14; Ezekiel 28)',
       E'Paul warns the assembly not to be shaken, *for that day shall not come, except there come a falling away first, and that man of sin be revealed, the son of perdition; Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God)* (2 Thessalonians 2:3-4). This man of sin is no new figure — he is the antichrist already drawn in the Tanakh, Daniel''s self-deifying tyrant. *And the king shall do according to his will; and he shall exalt himself, and magnify himself above every god, and shall speak marvellous things against the Elohim (God) of gods* (Daniel 11:36); the little horn *shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High)* (Daniel 7:25); the king of fierce countenance *shall magnify himself in his heart... he shall also stand up against the Prince of princes; but he shall be broken without hand* (Daniel 8:25). Behind them all is the ancient boast of the one cut down: *I will exalt my throne above the stars of Elohim (God)... I will be like the El Elyon (most High)* (Isaiah 14:13-14), and the prince of Tyrus who *said, I am a Elohim (God), I sit in the seat of Elohim (God)* — to whom Yahuah (LORD) answers *yet thou art a man, and not Elohim (God)* (Ezekiel 28:2). That answer is the whole truth of the matter: Paul calls him *the son of perdition,* a man, not Elohim (God) — the self-deifying claim unmasked. Yahusha (Jesus) named the same defiling thing: *the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place* (Matthew 24:15); and John saw the beast given *a mouth speaking great things and blasphemies* who *opened his mouth in blasphemy against Elohim (God), to blaspheme his name, and his tabernacle* (Revelation 13:5-6). One figure runs through the whole library — the counterfeit who usurps the seat of the Most High. GUARD this with care: the man of sin = the antichrist = Daniel''s little horn, the self-deifying tyrant. The *falling away* and *the temple* are NOT Israel cast off; the deceiver is the counterfeit, never the covenant people. And he is bounded — revealed only *in his time* (2 Thessalonians 2:6), prospering only *till the indignation be accomplished* (Daniel 11:36), broken *without hand* (Daniel 8:25), then consumed *with the spirit of his mouth* by the true King (2 Thessalonians 2:8).',
       sv.verse_id, ev.verse_id, 'free', 8225
  FROM _s234_t202_lookup sv, _s234_t202_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='2-thessalonians' AND ev.chapter_number=2 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-thessalonians-2-whom-yahuah-shall-consume-with-the-spirit-of-his-mouth-isaiah-11',
       E'Whom Yahuah shall consume with the spirit of his mouth (Isaiah 11)',
       E'When the man of sin is at last revealed, his undoing needs no army: *And then shall that Wicked be revealed, whom Yahuah (Lord) shall consume with the spirit of his mouth, and shall destroy with the brightness of his coming* (2 Thessalonians 2:8). This is the weapon Isaiah set in the hand of the Branch from the stem of Jesse: *he shall smite the earth with the rod of his mouth, and with the breath of his lips shall he slay the wicked* (Isaiah 11:4). The self-exalting tyrant who magnified himself above every god is slain by the breath of the lips of the true King — a single word. Daniel said the same: the king who stands up against the Prince of princes *shall be broken without hand* (Daniel 8:25). The Formed Son, anointed with the Spirit of Yahuah (LORD), does not wrestle the counterfeit but speaks, and the lawless one is consumed; the brightness of his coming is the end of the deceiver.',
       sv.verse_id, ev.verse_id, 'free', 8228
  FROM _s234_t202_lookup sv, _s234_t202_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='2-thessalonians' AND ev.chapter_number=2 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-thessalonians-2-our-gathering-together-unto-him-at-the-last-trump-isaiah-27',
       E'Our gathering together unto him at the last trump (Isaiah 27; 1 Corinthians 15)',
       E'Paul opens the chapter on the great hope: *Now we beseech you, brethren, by the coming of our Lord Yahusha HaMashiach (Lord Jesus Christ), and by our gathering together unto him* (2 Thessalonians 2:1). This *gathering together* is the same ingathering the prophets foretold and Paul names elsewhere. Isaiah saw it: *in that day... the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem* (Isaiah 27:13) — the regathering of the scattered at the great trumpet. And to the Corinthians Paul names the trump again: *at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible, and we shall be changed* (1 Corinthians 15:52). The trump of Isaiah, the last trump of 1 Corinthians, and the trump of Elohim (God) at the descent in 1 Thessalonians 4:16 are one sounding — the single resurrection-ingathering of the gathered house of Yashar''el (Israel) and the grafted-in, assembled to meet the returning King. The day of the man of sin and the day of the gathering belong together; this is no secret rapture severed from Israel''s regathering, but the one great trump-gathering of the whole olive tree.',
       sv.verse_id, ev.verse_id, 'free', 8231
  FROM _s234_t202_lookup sv, _s234_t202_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='2-thessalonians' AND ev.chapter_number=2 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-thessalonians-2-chosen-from-the-beginning-to-salvation-deuteronomy-7-ephesians-1',
       E'Chosen from the beginning to salvation (Deuteronomy 7; Ephesians 1)',
       E'Against the perishing who *received not the love of the truth,* Paul turns to thanksgiving: *But we are bound to give thanks alway to Elohim (God) for you, brethren beloved of Yahuah (Lord), because Elohim (God) hath from the beginning chosen you to salvation through sanctification of the Spirit and belief of the truth* (2 Thessalonians 2:13). This electing from the beginning is the ancient choosing of Yahuah (LORD): *thou art an holy people unto Yahuah Elohayka (the LORD thy God): Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself, above all people that are upon the face of the earth* (Deuteronomy 7:6). The same love that set Yahuah (LORD)''s choosing upon Yashar''el (Israel) — not for their number but for his own love — is the love that gathers the called-out at Thessalonica. Paul says it again to the Ephesians: *he hath chosen us in him before the foundation of the world, that we should be holy and without blame before him* (Ephesians 1:4). The choosing is the Father''s, from before the world, *to salvation through sanctification of the Spirit*; and they are *called... by our gospel, to the obtaining of the glory of our Lord Yahusha HaMashiach (Lord Jesus Christ)* (2 Thessalonians 2:14). The Father elects and calls; the Son is the Formed unto whose glory they are gathered. This is not a new election replacing the old, but the one choosing extended to the grafted-in.',
       sv.verse_id, ev.verse_id, 'free', 8234
  FROM _s234_t202_lookup sv, _s234_t202_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='2-thessalonians' AND ev.chapter_number=2 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-thessalonians-2-the-mystery-of-iniquity-already-at-work-2-esdras-5',
       E'The mystery of iniquity already at work (2 Esdras 5)',
       E'Paul tells the assembly that the lawless one is, for now, held back: *And now ye know what withholdeth that he might be revealed in his time. For the mystery of iniquity doth already work: only he who now letteth will let, until he be taken out of the way* (2 Thessalonians 2:6-7). The restored library held a like expectation — a deceiving rule rising in the days of mounting lawlessness, the sign of the latter tokens. Esdras was shown: *even he shall rule, whom they look not for that dwell upon the earth* (2 Esdras 5:6), in the days when *unrighteousness and incontinency be multiplied upon earth* (2 Esdras 5:10) and *the way of truth shall be hidden.* The unlooked-for ruler of Esdras and the man of sin held for his time are one shadow: the lawless one whose unveiling is the mark of the day. Yet the working of iniquity is a *mystery* under restraint, permitted only its season — for *that Wicked* once revealed is consumed *with the spirit of his mouth* (2 Thessalonians 2:8). The deceiver rises only to be unmasked and undone.',
       sv.verse_id, ev.verse_id, 'extras', 8237
  FROM _s234_t202_lookup sv, _s234_t202_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=7
   AND ev.edition_slug='canon' AND ev.book_slug='2-thessalonians' AND ev.chapter_number=2 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-thessalonians-2-the-man-of-sin-who-exalts-himself-above-all-elohim-daniel-11-isaiah-14-ezekiel-28
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 11:36 — *the king... shall exalt himself, and magnify himself above every god, and shall speak marvellous things against the Elohim (God) of gods* the self-deifying tyrant Daniel drew; the man of sin who *exalteth himself above all that is called Elohim (God)* (2 Thessalonians 2:4), prospering only till the indignation is accomplished.'
  FROM cross_reference_threads t, cross_references x, _s234_t202_lookup sv, _s234_t202_lookup tv
 WHERE t.slug='2-thessalonians-2-the-man-of-sin-who-exalts-himself-above-all-elohim-daniel-11-isaiah-14-ezekiel-28'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 7:25 — *he shall speak great words against the El Elyon (most High), and shall wear out the saints* the little horn given a bounded season (*a time and times and the dividing of time*); the man of sin permitted only *in his time* (2 Thessalonians 2:6), the counterfeit who wears out the saints, not the saints cast off.'
  FROM cross_reference_threads t, cross_references x, _s234_t202_lookup sv, _s234_t202_lookup tv
 WHERE t.slug='2-thessalonians-2-the-man-of-sin-who-exalts-himself-above-all-elohim-daniel-11-isaiah-14-ezekiel-28'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=7 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 8:25 — *he shall magnify himself in his heart... stand up against the Prince of princes; but he shall be broken without hand* the same self-magnifying king; broken by no mortal power, as the Wicked is consumed *with the spirit of his mouth* (2 Thessalonians 2:8).'
  FROM cross_reference_threads t, cross_references x, _s234_t202_lookup sv, _s234_t202_lookup tv
 WHERE t.slug='2-thessalonians-2-the-man-of-sin-who-exalts-himself-above-all-elohim-daniel-11-isaiah-14-ezekiel-28'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=8 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 14:13 — *I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation* the boast of the fallen one; the man of sin who *as Elohim (God) sitteth in the temple of Elohim (God)* (2 Thessalonians 2:4), enthroning himself in the seat of the Most High.'
  FROM cross_reference_threads t, cross_references x, _s234_t202_lookup sv, _s234_t202_lookup tv
 WHERE t.slug='2-thessalonians-2-the-man-of-sin-who-exalts-himself-above-all-elohim-daniel-11-isaiah-14-ezekiel-28'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 14:14 — *I will ascend above the heights of the clouds; I will be like the El Elyon (most High)* the root blasphemy, full-flowered in him who *shewing himself that he is Elohim (God)* (2 Thessalonians 2:4) — the counterfeit god, never the covenant people.'
  FROM cross_reference_threads t, cross_references x, _s234_t202_lookup sv, _s234_t202_lookup tv
 WHERE t.slug='2-thessalonians-2-the-man-of-sin-who-exalts-himself-above-all-elohim-daniel-11-isaiah-14-ezekiel-28'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Ezekiel 28:2 — *thou hast said, I am a Elohim (God), I sit in the seat of Elohim (God)... yet thou art a man, and not Elohim (God)* the exact unmasking of the man of sin who *sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God)* (2 Thessalonians 2:4) — yet Paul names him *the son of perdition,* a man, not Elohim (God).'
  FROM cross_reference_threads t, cross_references x, _s234_t202_lookup sv, _s234_t202_lookup tv
 WHERE t.slug='2-thessalonians-2-the-man-of-sin-who-exalts-himself-above-all-elohim-daniel-11-isaiah-14-ezekiel-28'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=28 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Matthew 24:15 — *the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place* Yahusha (Jesus) naming the same defiling thing; the man of sin who *as Elohim (God) sitteth in the temple of Elohim (God)* (2 Thessalonians 2:4) — the counterfeit in the sanctuary, not the holy people cast off.'
  FROM cross_reference_threads t, cross_references x, _s234_t202_lookup sv, _s234_t202_lookup tv
 WHERE t.slug='2-thessalonians-2-the-man-of-sin-who-exalts-himself-above-all-elohim-daniel-11-isaiah-14-ezekiel-28'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Revelation 13:5 — *a mouth speaking great things and blasphemies; and power was given unto him to continue forty and two months* Daniel''s great words become the beast''s mouth; the man of sin permitted only *in his time* (2 Thessalonians 2:6), one figure under one bounded limit.'
  FROM cross_reference_threads t, cross_references x, _s234_t202_lookup sv, _s234_t202_lookup tv
 WHERE t.slug='2-thessalonians-2-the-man-of-sin-who-exalts-himself-above-all-elohim-daniel-11-isaiah-14-ezekiel-28'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 9, E'Revelation 13:6 — *he opened his mouth in blasphemy against Elohim (God), to blaspheme his name, and his tabernacle* the beast''s sacrilege; the man of sin who seats himself *in the temple of Elohim (God), shewing himself that he is Elohim (God)* (2 Thessalonians 2:4) — both usurp the dwelling of the Most High.'
  FROM cross_reference_threads t, cross_references x, _s234_t202_lookup sv, _s234_t202_lookup tv
 WHERE t.slug='2-thessalonians-2-the-man-of-sin-who-exalts-himself-above-all-elohim-daniel-11-isaiah-14-ezekiel-28'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-thessalonians-2-whom-yahuah-shall-consume-with-the-spirit-of-his-mouth-isaiah-11
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 11:4 — *with the breath of his lips shall he slay the wicked* the weapon of the Branch from the stem of Jesse; *that Wicked... whom Yahuah (Lord) shall consume with the spirit of his mouth* (2 Thessalonians 2:8) — the Formed Son slays the lawless one by a single utterance.'
  FROM cross_reference_threads t, cross_references x, _s234_t202_lookup sv, _s234_t202_lookup tv
 WHERE t.slug='2-thessalonians-2-whom-yahuah-shall-consume-with-the-spirit-of-his-mouth-isaiah-11'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-thessalonians-2-our-gathering-together-unto-him-at-the-last-trump-isaiah-27
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 27:13 — *the great trumpet shall be blown, and they shall come which were ready to perish... and shall worship Yahuah (LORD) in the holy mount at Jerusalem* the regathering of the scattered; *our gathering together unto him* (2 Thessalonians 2:1) is the same ingathering, not severed from Israel''s regathering.'
  FROM cross_reference_threads t, cross_references x, _s234_t202_lookup sv, _s234_t202_lookup tv
 WHERE t.slug='2-thessalonians-2-our-gathering-together-unto-him-at-the-last-trump-isaiah-27'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=27 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 15:52 — *at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible* the same trump as Isaiah 27 and the descent of 1 Thessalonians 4:16; *our gathering together unto him* (2 Thessalonians 2:1) is the one resurrection-ingathering, no secret rapture.'
  FROM cross_reference_threads t, cross_references x, _s234_t202_lookup sv, _s234_t202_lookup tv
 WHERE t.slug='2-thessalonians-2-our-gathering-together-unto-him-at-the-last-trump-isaiah-27'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-thessalonians-2-chosen-from-the-beginning-to-salvation-deuteronomy-7-ephesians-1
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 7:6 — *Yahuah Elohayka (the LORD thy God) hath chosen thee to be a special people unto himself* the ancient choosing of Yahuah (LORD); *Elohim (God) hath from the beginning chosen you to salvation* (2 Thessalonians 2:13), the one election extended to the grafted-in.'
  FROM cross_reference_threads t, cross_references x, _s234_t202_lookup sv, _s234_t202_lookup tv
 WHERE t.slug='2-thessalonians-2-chosen-from-the-beginning-to-salvation-deuteronomy-7-ephesians-1'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ephesians 1:4 — *he hath chosen us in him before the foundation of the world, that we should be holy* the Father''s choosing before the world; *from the beginning chosen you to salvation through sanctification of the Spirit* (2 Thessalonians 2:13), called unto the glory of the Formed Son.'
  FROM cross_reference_threads t, cross_references x, _s234_t202_lookup sv, _s234_t202_lookup tv
 WHERE t.slug='2-thessalonians-2-chosen-from-the-beginning-to-salvation-deuteronomy-7-ephesians-1'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=1 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-thessalonians-2-the-mystery-of-iniquity-already-at-work-2-esdras-5
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Esdras 5:6 — *even he shall rule, whom they look not for that dwell upon the earth* the deceiving rule rising in the days of multiplied lawlessness; *the mystery of iniquity doth already work* (2 Thessalonians 2:7), the lawless one held for his time, then consumed.'
  FROM cross_reference_threads t, cross_references x, _s234_t202_lookup sv, _s234_t202_lookup tv
 WHERE t.slug='2-thessalonians-2-the-mystery-of-iniquity-already-at-work-2-esdras-5'
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=7
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=5 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
