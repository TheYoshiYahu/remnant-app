-- =====================================================================
-- Session 435b — NT and extra-canonical cross-references brought into the settled order of the end
-- (1 Thessalonians 4:16 and 4:17 two events; the last trump at the end; Revelation re-map, locked 2026-10-02)
-- =====================================================================
-- Updates the stored notes, thread titles/summaries and member notes written by
-- session110 (Matthew), session143 (Matthew 13 extras), session155 (Matthew 22 extras),
-- session216 (John NT-to-NT threads), session222 (Hebrews), session228 (1 Corinthians),
-- session234 (2 Thessalonians) and session403 (Ascension of Isaiah), which predate the
-- settled order. Revelation and 1 Thessalonians 4 were corrected in session434 and are
-- not touched here. The source migrations were corrected in place to the same text,
-- so a fresh rebuild matches prod.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session435b_nt_extras_order_of_end_xref_corrections.sql
-- =====================================================================

\echo 'session435b — NT and extra-canonical order-of-end corrections starting...'
BEGIN;

CREATE TEMP VIEW _s435b_lu AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');


-- ===== corrections to session228 (session228_1corinthians_cross_references.sql) =====

UPDATE cross_references x SET note = E'*And it shall come to pass in that day, that the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem.* (Isaiah 27:13). *The great trumpet shall be blown,* and the perishing and the outcast are gathered home to worship Yahuah (LORD). That is the trumpet of the gathering at his coming, when the scattered seed is brought home for the reign. Paul''s *last trump* sounds at the other end: *at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible, and we shall be changed* (1 Corinthians 15:52) — the last of the trumpets, after the reign and the little season, when the dead are raised to the judgment. Two soundings with the reign between them: the great trumpet gathers the outcasts home, and the last trump raises the dead.'
  FROM _s435b_lu sv, _s435b_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=27 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_references x SET note = E'*For Yahusha (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first:* (1 Thessalonians 4:16). *With the trump of Elohim (God)... the dead in Messiah (Christ) shall rise first* — the trumpet at his coming, while the wrath falls, when the righteous seed rise first out of Sheol. Set it beside *at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible* (1 Corinthians 15:52). The trump of Elohim (God) sounds at his coming; the last trump is the seventh trumpet at the end, after the reign and the little season, when the dead are raised incorruptible and the living are changed. Two soundings, two risings, the reign between them — each in its own season.'
  FROM _s435b_lu sv, _s435b_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_reference_thread_members m SET member_note = E'Isaiah 27:13 — *the great trumpet shall be blown, and they shall come which were ready to perish... and shall worship Yahuah (LORD) in the holy mount at Jerusalem* the trumpet of the gathering at his coming; Paul''s *last trump* sounds at the end, after the reign (1 Corinthians 15:52).'
  FROM cross_reference_threads t, cross_references x, _s435b_lu sv, _s435b_lu tv
 WHERE t.slug='1-corinthians-15-the-last-trump-we-shall-all-be-changed-isaiah-27-1-thessalonians-4' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=27 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_reference_thread_members m SET member_note = E'1 Thessalonians 4:16 — *with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* the trumpet at his coming, the righteous seed raised first; the *last trump* is another sounding, at the end, after the reign (1 Corinthians 15:52).'
  FROM cross_reference_threads t, cross_references x, _s435b_lu sv, _s435b_lu tv
 WHERE t.slug='1-corinthians-15-the-last-trump-we-shall-all-be-changed-isaiah-27-1-thessalonians-4' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='1-corinthians' AND sv.chapter_number=15 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_reference_threads SET title = E'The last trump — we shall all be changed (Isaiah 27, 1 Thessalonians 4, Revelation 11)', summary_md = E'*Behold, I shew you a mystery; We shall not all sleep, but we shall all be changed, In a moment, in the twinkling of an eye, at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible, and we shall be changed* (1 Corinthians 15:51-52). Paul calls it the *last* trump, and the word sets it at the close of a sequence. Isaiah heard an earlier trumpet: *in that day... the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem* (Isaiah 27:13) — the trumpet that gathers the scattered, perishing seed home at his coming. Paul wrote of that coming to the Thessalonians: *Yahusha (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16) — the trump of Elohim (God), sounding while the wrath falls, when the righteous seed rise first out of Sheol for the reign. And John heard the last of the trumpets: *the seventh angel sounded; and there were great voices in heaven, saying, The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ)* (Revelation 11:15), when *the time of the dead, that they should be judged* is come (Revelation 11:18). That seventh trumpet is Paul''s last trump: after the reign and the little season, the dead raised incorruptible and the living changed, the corruptible putting on incorruption. The great trumpet of the gathering and the trump of Elohim (God) sound at his coming; the last trump sounds at the end — two soundings, the reign between them.'
 WHERE slug='1-corinthians-15-the-last-trump-we-shall-all-be-changed-isaiah-27-1-thessalonians-4';

-- ===== corrections to session234 (session234_2thessalonians_cross_references.sql) =====

UPDATE cross_references x SET note = E'*And it shall come to pass in that day, that the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem.* (Isaiah 27:13). When Paul writes *by the coming of our Lord Yahusha HaMashiach (Lord Jesus Christ), and by our gathering together unto him* (2 Thessalonians 2:1), he names the same ingathering Isaiah saw — *the great trumpet shall be blown, and they shall come which were ready to perish... the outcasts.* The gathering is the regathering of the scattered to worship Yahuah (LORD) in the holy mount; the day cannot be severed from Israel''s ingathering. This is the trump-gathering at his coming, not a secret rapture detached from the regathered people.'
  FROM _s435b_lu sv, _s435b_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=27 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_references x SET note = E'*In a moment, in the twinkling of an eye, at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible, and we shall be changed.* (1 Corinthians 15:52). Paul ties *our gathering together unto him* (2 Thessalonians 2:1) to *the coming of our Lord Yahusha HaMashiach (Lord Jesus Christ)* — the gathering of the scattered at his return, the great trumpet of Isaiah 27:13. The last trump is another sounding: the seventh trumpet at the end, after the reign and the little season, when *the trumpet shall sound, and the dead shall be raised.* The trumpet at his coming and the last trump are two soundings with the reign between them. The day of the man of sin and the day of the gathering belong together; the saints are not snatched away in secret but gathered at the coming of the King, and raised incorruptible at the last trump.'
  FROM _s435b_lu sv, _s435b_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_references x SET note = E'*And the Most High shall appear upon the seat of judgment, and misery shall pass away, and the long suffering shall have an end:* (2 Esdras 7:33). Esdras was shown the seat of judgment at the very end — after the Messiah''s reign, after the seven days of silence, after the earth restores those that are asleep in her (2 Esdras 7:28-32). Paul names the coming that opens that road: *When he shall come to be glorified in his saints, and to be admired in all them that believe... in that day* (2 Thessalonians 1:10). At his coming the troubled are given rest and he is glorified in his saints; at the seat of judgment, after the reign, misery passes away and the long suffering has its end. One King, at the two edges of the reign.'
  FROM _s435b_lu sv, _s435b_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=7 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_references x SET note = E'*And there was given unto him a mouth speaking great things and blasphemies; and power was given unto him to continue forty and two months.* (Revelation 13:5). The beast out of the sea is given *a mouth speaking great things and blasphemies* — the same blaspheming mouth as the man of sin who *opposeth and exalteth himself above all that is called Elohim (God)* (2 Thessalonians 2:4). And as the man of sin is permitted only *in his time* (2 Thessalonians 2:6), the beast out of the sea is given *forty and two months* — a fixed and bounded season, counted in Revelation''s own measure. The self-exalting blasphemer is held to a limit he did not set.'
  FROM _s435b_lu sv, _s435b_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_references x SET note = E'*And he opened his mouth in blasphemy against Elohim (God), to blaspheme his name, and his tabernacle, and them that dwell in heaven.* (Revelation 13:6). The beast out of the sea *opened his mouth in blasphemy against Elohim (God), to blaspheme his name, and his tabernacle* — the very sacrilege of the man of sin who seats himself *in the temple of Elohim (God), shewing himself that he is Elohim (God)* (2 Thessalonians 2:4). To blaspheme the name and the tabernacle is to usurp the place of Elohim (God); the beast out of the sea and the son of perdition both make war on the dwelling of the Most High, and both are revealed only to be destroyed by the One who truly reigns.'
  FROM _s435b_lu sv, _s435b_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_reference_thread_members m SET member_note = E'1 Corinthians 15:52 — *at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible* the last trump at the end, after the reign — set beside *our gathering together unto him* at his coming (2 Thessalonians 2:1), not the same sounding.'
  FROM cross_reference_threads t, cross_references x, _s435b_lu sv, _s435b_lu tv
 WHERE t.slug='2-thessalonians-2-our-gathering-together-unto-him-at-the-last-trump-isaiah-27' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_reference_thread_members m SET member_note = E'2 Esdras 7:33 — *the Most High shall appear upon the seat of judgment, and misery shall pass away, and the long suffering shall have an end* the seat of judgment at the end, after the reign; the coming that opens the road is the day he comes *to be glorified in his saints... in that day* (2 Thessalonians 1:10).'
  FROM cross_reference_threads t, cross_references x, _s435b_lu sv, _s435b_lu tv
 WHERE t.slug='2-thessalonians-1-the-day-the-most-high-appears-upon-the-seat-of-judgment-2-esdras-7-1-enoch-100' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=1 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=7 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_reference_thread_members m SET member_note = E'Revelation 13:5 — *a mouth speaking great things and blasphemies; and power was given unto him to continue forty and two months* the beast out of the sea, its blaspheming mouth held to its forty and two months; the man of sin permitted only *in his time* (2 Thessalonians 2:6) — each held to a bounded limit.'
  FROM cross_reference_threads t, cross_references x, _s435b_lu sv, _s435b_lu tv
 WHERE t.slug='2-thessalonians-2-the-man-of-sin-who-exalts-himself-above-all-elohim-daniel-11-isaiah-14-ezekiel-28' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_reference_thread_members m SET member_note = E'Revelation 13:6 — *he opened his mouth in blasphemy against Elohim (God), to blaspheme his name, and his tabernacle* the sacrilege of the beast out of the sea; the man of sin who seats himself *in the temple of Elohim (God), shewing himself that he is Elohim (God)* (2 Thessalonians 2:4) — both usurp the dwelling of the Most High.'
  FROM cross_reference_threads t, cross_references x, _s435b_lu sv, _s435b_lu tv
 WHERE t.slug='2-thessalonians-2-the-man-of-sin-who-exalts-himself-above-all-elohim-daniel-11-isaiah-14-ezekiel-28' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='2-thessalonians' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_reference_threads SET title = E'Our gathering together unto him at his coming — and the last trump at the end (Isaiah 27; 1 Corinthians 15)', summary_md = E'Paul opens the chapter on the great hope: *Now we beseech you, brethren, by the coming of our Lord Yahusha HaMashiach (Lord Jesus Christ), and by our gathering together unto him* (2 Thessalonians 2:1). This *gathering together* is the ingathering the prophets foretold, tied to his coming. Isaiah saw it: *in that day... the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem* (Isaiah 27:13) — the regathering of the scattered at the great trumpet. To the Corinthians Paul names another trumpet: *at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible, and we shall be changed* (1 Corinthians 15:52). That last trump is the seventh trumpet at the end, after the reign and the little season. The great trumpet of the gathering and the trump of Elohim (God) at his coming (1 Thessalonians 4:16) sound as the reign begins; the last trump sounds at its close — two soundings, the reign between them. The day of the man of sin and the day of the gathering belong together; this is no secret rapture severed from Israel''s regathering, but the gathering of the whole olive tree at the coming of the King.'
 WHERE slug='2-thessalonians-2-our-gathering-together-unto-him-at-the-last-trump-isaiah-27';

UPDATE cross_reference_threads SET title = E'The day of his appearing and the seat of judgment at the end (2 Esdras 7, 1 Enoch 100)', summary_md = E'The Hebrew library beheld the day Paul proclaims and the end it opens onto — rest for the righteous, the burning flame for the godless. Paul names the coming: *When he shall come to be glorified in his saints, and to be admired in all them that believe... in that day* (2 Thessalonians 1:10) — the troubled given rest, the persecutor repaid. For the persecutor that day burns: *Woe to you, ye sinners... In blazing flames burning worse than fire shall ye burn* (1 Enoch 100:9), the requital for *the deeds of your hands.* This is the *everlasting destruction* of *them that know not Elohim (God), and that obey not the gospel* (2 Thessalonians 1:8-9). Esdras was shown the far end of the road: *the Most High shall appear upon the seat of judgment, and misery shall pass away, and the long suffering shall have an end* (2 Esdras 7:33) — after the Messiah''s reign, after the seven days of silence, after the earth restores those that are asleep in her (2 Esdras 7:28-32). The coming begins it and the seat of judgment ends it, with the reign between: the fire that overtakes the wicked at his appearing, and misery passing away for ever when the dead are judged.'
 WHERE slug='2-thessalonians-1-the-day-the-most-high-appears-upon-the-seat-of-judgment-2-esdras-7-1-enoch-100';

UPDATE cross_reference_threads SET title = E'The man of sin who exalts himself above all that is called Elohim (Daniel 11, 7, 8; Isaiah 14; Ezekiel 28)', summary_md = E'Paul warns the assembly not to be shaken, *for that day shall not come, except there come a falling away first, and that man of sin be revealed, the son of perdition; Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God)* (2 Thessalonians 2:3-4). This man of sin is no new figure — he is the antichrist already drawn in the Tanakh, Daniel''s self-deifying tyrant. *And the king shall do according to his will; and he shall exalt himself, and magnify himself above every god, and shall speak marvellous things against the Elohim (God) of gods* (Daniel 11:36); the little horn *shall speak great words against the El Elyon (most High), and shall wear out the saints of the El Elyon (most High)* (Daniel 7:25); the king of fierce countenance *shall magnify himself in his heart... he shall also stand up against the Prince of princes; but he shall be broken without hand* (Daniel 8:25). Behind them all is the ancient boast of the one cut down: *I will exalt my throne above the stars of Elohim (God)... I will be like the El Elyon (most High)* (Isaiah 14:13-14), and the prince of Tyrus who *said, I am a Elohim (God), I sit in the seat of Elohim (God)* — to whom Yahuah (LORD) answers *yet thou art a man, and not Elohim (God)* (Ezekiel 28:2). That answer is the whole truth of the matter: Paul calls him *the son of perdition,* a man, not Elohim (God) — the self-deifying claim unmasked. Yahusha (Jesus) named the same defiling thing: *the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place* (Matthew 24:15); and John saw the beast out of the sea given *a mouth speaking great things and blasphemies* who *opened his mouth in blasphemy against Elohim (God), to blaspheme his name, and his tabernacle* (Revelation 13:5-6). One pattern runs through the whole library — the counterfeit who usurps the seat of the Most High. GUARD this with care: the man of sin = the antichrist = Daniel''s little horn, the self-deifying tyrant. The *falling away* and *the temple* are NOT Israel cast off; the deceiver is the counterfeit, never the covenant people. And he is bounded — revealed only *in his time* (2 Thessalonians 2:6), prospering only *till the indignation be accomplished* (Daniel 11:36), broken *without hand* (Daniel 8:25), then consumed *with the spirit of his mouth* by the true King (2 Thessalonians 2:8).'
 WHERE slug='2-thessalonians-2-the-man-of-sin-who-exalts-himself-above-all-elohim-daniel-11-isaiah-14-ezekiel-28';

-- ===== corrections to session216 (session216_john_nt_to_nt_xref_threads.sql) =====

UPDATE cross_reference_thread_members m SET member_note = E'1 Corinthians 15:22 — *For as in Adam all die, even so in Messiah (Christ) shall all be made alive.* The two outcomes of John 5:29 (life and damnation) are the same two outcomes as dying in Adam and being made alive in Messiah (Christ); the Son of Adam who judges (John 5:27) is also the last Adam who makes alive.'
  FROM cross_reference_threads t, cross_references x, _s435b_lu sv, _s435b_lu tv
 WHERE t.slug='john-5-the-dead-shall-hear-the-voice-of-the-son-and-rise-in-1-thessalonians-4-and-1-corinthians-15' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='john' AND sv.chapter_number=5 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_reference_threads SET title = E'The dead shall hear the voice of the Son and rise — 1 Thessalonians 4 and 1 Corinthians 15', summary_md = E'John 5:21-29 hands the entire resurrection to the Son of Adam. The Father raiseth the dead and quickeneth them; *even so the Son quickeneth whom he will* (v.21). The Father commiteth all judgment to the Son (v.22). Then come two resurrection declarations that stand as the NT''s clearest resurrection architecture: *Verily, verily, I say unto you, The hour is coming, and now is, when the dead shall hear the voice of the Son of Elohim (God): and they that hear shall live* (v.25); and *Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice, And shall come forth; they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation* (vv.28-29). The authority to execute this judgment is given *because he is the Son of Adam* (v.27) — the Adamic-seed identification as the ground of the resurrection-power.\n\nPaul names two risings, each in its own season. In 1 Thessalonians 4:16 he names the descending shout and the trump that calls the dead in Messiah (Christ) up first: *For Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first.* The *voice of the Son of Elohim (God)* that John 5:25 names becomes the *shout* and the *voice of the archangel* and the *trump of Elohim (God)* that Paul names — the dead in Messiah (Christ) called up first at his coming, by the voice of the one the Father gave the power to quicken: *they that hear shall live.*\n\nIn 1 Corinthians 15 Paul names the whole order: *But now is Messiah (Christ) risen from the dead, and become the firstfruits of them that slept* (v.20) — the Son who quickens whom he will (John 5:21) is the firstfruits of all the dead who shall follow. *For as in Adam all die, even so in Messiah (Christ) shall all be made alive* (v.22) — the two outcomes of John 5:29 (resurrection of life / resurrection of damnation) are the same two outcomes as dying in Adam and being made alive in Messiah (Christ). And at the last: *In a moment, in the twinkling of an eye, at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible* (v.52) — the hour of John 5:28, when *all that are in the graves shall hear his voice,* named in Paul''s register as the last trump at the end, after the reign and the little season, when the dead are judged. The trump of Elohim (God) at his coming and the last trump at the end are two soundings with the reign between them.'
 WHERE slug='john-5-the-dead-shall-hear-the-voice-of-the-son-and-rise-in-1-thessalonians-4-and-1-corinthians-15';

-- ===== corrections to session110 (session110_matthew_cross_references.sql) =====

UPDATE cross_references x SET note = E'*But I would not have you to be ignorant, brethren, concerning them which are asleep, that ye sorrow not, even as others which have no hope.* (1 Thessalonians 4:13). Paul''s comfort concerning them which are asleep — not the same event as the Olivet gathering. The great trumpet of Matthew 24:31 gathers the scattered elect from the four winds at his return; the catching-up of 1 Thessalonians 4:17 comes after the reign and the little season.'
  FROM _s435b_lu sv, _s435b_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=24 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_references x SET note = E'*Behold, I shew you a mystery; We shall not all sleep, but we shall all be changed,* (1 Corinthians 15:51). The great sound of a trumpet that gathers the elect from the four winds sounds at his return; the change Paul names comes *at the last trump* (1 Corinthians 15:52), the seventh trumpet at the end, after the reign. Two trumpets of the one King, at the two edges of the reign.'
  FROM _s435b_lu sv, _s435b_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=24 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=51
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_references x SET note = E'*And the nations of them which are saved shall walk in the light of it: and the kings of the earth do bring their glory and honour into it.* (Revelation 21:24). The glory brought into the New Jerusalem belongs to the new heaven and the new earth, after the reign and the judgment of the dead — not to the reign itself.'
  FROM _s435b_lu sv, _s435b_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=25 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_reference_thread_members m SET member_note = E'*And the nations of them which are saved shall walk in the light of it: and the kings of the earth do bring their glory and honour into it.* (Revelation 21:24). The glory brought into the New Jerusalem belongs to the new heaven and the new earth, after the reign and the judgment of the dead — not to the reign itself.'
  FROM cross_reference_threads t, cross_references x, _s435b_lu sv, _s435b_lu tv
 WHERE t.slug='sheep-and-goats-judgment-of-the-nations-at-the-throne-of-his-glory' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=25 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=21 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_references x SET note = E'*And it shall come to pass, that every thing that liveth, which moveth, whithersoever the rivers shall come, shall live: and there shall be a very great multitude of fish, because these waters shall come thither: for they shall be healed; and every thing shall live whither the river cometh.* (Ezekiel 47:9). The great multitude of fish in the healed waters of the reign. The net of the parable is drawn and sorted first — *so shall it be at the end of the world: the angels shall come forth, and sever the wicked from among the just* (Matthew 13:49) — and the reign follows the severing.'
  FROM _s435b_lu sv, _s435b_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=47 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_reference_thread_members m SET member_note = E'*Their fish shall be according to their kinds, as the fish of the great sea, exceeding many* — the fish of the healed waters in the reign; the net of the parable is sorted first, at the end of the age, and the reign follows the severing.'
  FROM cross_reference_threads t, cross_references x, _s435b_lu sv, _s435b_lu tv
 WHERE t.slug='dragnet-recapitulating-the-post-harvest-sifting' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=47
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=47 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

-- ===== corrections to session143 (session143_matt_13_extras_cross_references.sql) =====

UPDATE cross_references x SET note = E'*And the Most High shall appear upon the seat of judgment, and misery shall pass away, and the long suffering shall have an end: But judgment only shall remain, truth shall stand, and faith shall wax strong: And the work shall follow, and the reward shall be shewed, and the good deeds shall be of force, and wicked deeds shall bear no rule.* 2 Esdras (4 Ezra) 7:33-35 shows the last end of the road: the Most High upon the seat of judgment after the Messiah''s reign, after the seven days of silence and the earth restoring those that are asleep in her (2 Esdras 7:28-32). Matt 13:49''s *so shall it be at the end of the world: the angels shall come forth, and sever the wicked from among the just* is the severing at his coming, before the reign — the wicked taken out first, the just kept. Both are the one King''s judgment, at the two edges of the reign: the severing at the end of the age, and the seat of judgment when the dead are judged.'
  FROM _s435b_lu sv, _s435b_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=49
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=7 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_reference_thread_members m SET member_note = E'2 Esdras (4 Ezra) 7:33 — *the Most High shall appear upon the seat of judgment ... judgment only shall remain, truth shall stand, and faith shall wax strong.* The seat of judgment at the last end, after the reign; the angels severing the wicked from among the just at Matt 13:49 is the severing at the end of the age, before the reign.'
  FROM cross_reference_threads t, cross_references x, _s435b_lu sv, _s435b_lu tv
 WHERE t.slug='wheat-from-chaff-and-righteous-from-wicked-at-the-day-of-separation-in-2-esdras-and-1-enoch-and-wisdom' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=13 AND sv.verse_number=49
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=7 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

-- ===== corrections to session155 (session155_matt_22_extras_cross_references.sql) =====

UPDATE cross_references x SET note = E'*And the earth shall restore those that are asleep in her, and so shall the dust those that dwell in silence, and the secret places shall deliver those souls that were committed to them.* 2 Esdras 7:32 carries forward the resurrection of the asleep that Daniel named at Daniel 12:2 (*many of them that sleep in the dust of the earth shall awake*). It stands beside Matt 22:31''s *but as touching the resurrection of the dead, have ye not read that which was spoken unto you by Elohim (God)* — the King reads to the Sadducees what the library already held: the earth, the dust and the secret places giving back the asleep. In Esdras this restoring comes after the Messiah''s reign and the seven days of silence (2 Esdras 7:28-31) — the great resurrection, when the dead are judged — while the righteous seed are raised first, at his coming (Revelation 20:4-6). The dead sleep awaiting the resurrection; they are not carried off at death as disembodied souls.'
  FROM _s435b_lu sv, _s435b_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=22 AND sv.verse_number=31
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=7 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

-- ===== corrections to session222 (session222_hebrews_cross_references.sql) =====

UPDATE cross_reference_threads SET title = E'Tortured, Not Accepting Deliverance, That They Might Obtain a Better Resurrection — the Mother and Seven Sons (2 Maccabees 7)', summary_md = E'The cloud darkens into the witnesses who were not delivered, and the restored library names them where the canon only summarizes: *and others were tortured, not accepting deliverance; that they might obtain a better resurrection* (Hebrews 11:35). These are the mother and her seven sons, who would die rather than transgress the law. The second declares, *the King of the world shall raise us up, who have died for his laws, to everlasting life* (2 Maccabees 7:9); the third stretches out his hands to be cut off — *from him I hope to receive them again* (2 Maccabees 7:11); the fourth sets the faithful raised up again against the persecutor with no resurrection to life, *to look for hope from Yahuah (God) to be raised up again by him: as for you, you shall have no resurrection to life* (2 Maccabees 7:14). The mother reasons from creation to resurrection: *the Creator of the world, who formed the generation of man... will also of his own mercy give you breath and life again* (2 Maccabees 7:23), and sends her youngest to die — *take your death that I may receive you again in mercy with your brothers* (2 Maccabees 7:29). They refused the deliverance that would have cost them the law, and looked for the better resurrection past the grave. These are they *of whom the world was not worthy* (Hebrews 11:38), who *received not the promise* in their lifetime because *Elohim (God) having provided some better thing for us, that they without us should not be made perfect* (Hebrews 11:40) — the faithful of every age waiting together for the better resurrection, the first resurrection of the righteous seed.'
 WHERE slug='hebrews-11-tortured-for-a-better-resurrection-the-mother-and-seven-sons-2-maccabees';

-- ===== corrections to session403 (session403_ascension_isaiah_extracanon_cross_references.sql) =====

UPDATE cross_references x SET note = E'1 Thessalonians 4:16 — *For Yahusha (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first:* Isaiah''s text says the saints *will descend and be present in the world* with Yahuah (Lord). A word of caution belongs here. No other scripture has anyone coming down from the sky with him at his coming: Paul has the Lord descend, and the dead in Messiah (Christ) rise first — up out of the grave, not down from heaven. A descent of the saints from heaven cannot stand beside that; it reads like a line carried in from church teaching. The Ethiopic itself has *descend* (yəwarrədu), so if it is an insertion it is older than the Ethiopic, and an earlier Greek or Hebrew text is still awaited. Read another way, the line may fit what the rest of scripture shows. The heights are in the north: *I will sit also upon the mount of the congregation, in the sides of the north* (Isaiah 14:13); *Beautiful for situation, the joy of the whole earth, is mount Zion, on the sides of the north, the city of the great King* (Psalm 48:2); and Enoch sets *the garden of righteousness* in the north (1 Enoch 77:3). The gathered seed comes with him out of the north into the land: *In those days the house of Yahudah (Judah) shall walk with the house of Yashar''el (Israel), and they shall come together out of the land of the north to the land that I have given for an inheritance unto your fathers* (Jeremiah 3:18); *Behold, I will bring them from the north country* (Jeremiah 31:8). A coming down from the heights of the north into the land may be what the line remembers — a possible reading, not a settled one. *Brought up... out of the north country* (Jeremiah 23:8) does not contradict it, for in scripture one goes up to the land from any quarter: *And Abram went up out of Egypt... into the south* (Genesis 13:1); *And Joseph also went up from Galilee... into Judæa* (Luke 2:4).'
  FROM _s435b_lu sv, _s435b_lu tv
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_reference_thread_members m SET member_note = E'1 Thessalonians 4:16 — *Yahusha (Lord) himself shall descend from heaven... and the dead in Messiah (Christ) shall rise first* — no other scripture has anyone coming down from the sky with him, so Isaiah''s *descend* (already in the Ethiopic) reads as an early insertion; or, read with the heights in the north (Psalm 48:2; Isaiah 14:13), as the gathered seed coming with him out of the north into the land (Jeremiah 3:18) — a possible reading, not a settled one.'
  FROM cross_reference_threads t, cross_references x, _s435b_lu sv, _s435b_lu tv
 WHERE t.slug='ascension-isaiah-4-saints-descend-garments' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_references x SET note = E'Revelation 13:5 — *And there was given unto him a mouth speaking great things and blasphemies; and power was given unto him to continue forty and two months.* The beast out of the sea is given a fixed span, counted in months; Isaiah gives Beliar a measured sway of three years and seven months and twenty-seven days in Ascension of Isaiah 4:12. Each book keeps its own count: both seasons are bounded, and neither is turned into the other.'
  FROM _s435b_lu sv, _s435b_lu tv
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_reference_thread_members m SET member_note = E'Revelation 13:5 — *And there was given unto him a mouth speaking great things and blasphemies; and power was given unto him to continue forty and two months.* The beast out of the sea is given a fixed span, counted in months; Isaiah gives Beliar a measured sway of three years and seven months and twenty-seven days in Ascension of Isaiah 4:12. Each book keeps its own count: both seasons are bounded, and neither is turned into the other.'
  FROM cross_reference_threads t, cross_references x, _s435b_lu sv, _s435b_lu tv
 WHERE t.slug='ascension-isaiah-4-saints-flee-desert' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_references x SET note = E'Revelation 19:20 — *And the beast was taken, and with him the false prophet that wrought miracles before him, with which he deceived them that had received the mark of the beast, and them that worshipped his image. These both were cast alive into a lake of fire burning with brimstone.* John''s casting of the beast out of the sea and the false prophet into the fiery lake, before the reign, answers the Lord dragging Beliar into Gehenna in Ascension of Isaiah 4:14.'
  FROM _s435b_lu sv, _s435b_lu tv
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_reference_thread_members m SET member_note = E'Revelation 19:20 — *And the beast was taken, and with him the false prophet that wrought miracles before him, with which he deceived them that had received the mark of the beast, and them that worshipped his image. These both were cast alive into a lake of fire burning with brimstone.* John''s casting of the beast out of the sea and the false prophet into the fiery lake, before the reign, answers the Lord dragging Beliar into Gehenna in Ascension of Isaiah 4:14.'
  FROM cross_reference_threads t, cross_references x, _s435b_lu sv, _s435b_lu tv
 WHERE t.slug='ascension-isaiah-4-Lord-comes-beliar-gehenna' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=19 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_references x SET note = E'Revelation 13:4 — *And they worshipped the dragon which gave power unto the beast: and they worshipped the beast, saying, Who is like unto the beast? who is able to make war with him?* John''s whole-world worship of the beast out of the sea is the universal belief Isaiah foresees in Ascension of Isaiah 4:7.'
  FROM _s435b_lu sv, _s435b_lu tv
 WHERE sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_reference_thread_members m SET member_note = E'Revelation 13:4 — *And they worshipped the dragon which gave power unto the beast: and they worshipped the beast, saying, Who is like unto the beast? who is able to make war with him?* John''s whole-world worship of the beast out of the sea is the universal belief Isaiah foresees in Ascension of Isaiah 4:7.'
  FROM cross_reference_threads t, cross_references x, _s435b_lu sv, _s435b_lu tv
 WHERE t.slug='ascension-isaiah-4-i-am-god' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='ascension-isaiah' AND sv.book_slug='ascension-isaiah' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=13 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_reference_threads SET title = E'The saints in their garments — Ascension of Isaiah 4 set beside 1 Thessalonians 4', summary_md = E'*But the saints will come with Yahuah (Lord) with their garments which are (now) stored up on high in the seventh heaven: with Yahuah (Lord) they will come, whose spirits are clothed, they will descend and be present in the world, and He will strengthen those, who have been found in the body, together with the saints, in the garments of the saints, and Yahuah (Lord) will minister to those who have kept watch in this world.* (Ascension of Isaiah 4:16); and *afterwards they will turn themselves upward in their garments, and their body will be left in the world* (4:17). Paul sets down the order plainly: *For Yahusha (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16). The dead rise up out of the grave at his coming. No other scripture has anyone coming down from the sky with him, so Isaiah''s *descend* needs a careful word: as a descent from heaven it cannot stand, and it reads like a line carried in from church teaching — older than the Ethiopic, which itself has *descend*, so an earlier Greek or Hebrew text is still awaited. Read with the heights in the north — *mount Zion, on the sides of the north, the city of the great King* (Psalm 48:2) — it may instead remember the gathered seed coming with him out of the north into the land: *they shall come together out of the land of the north to the land that I have given for an inheritance unto your fathers* (Jeremiah 3:18). That is offered as a possible reading, not a settled one. Isaiah''s *afterwards* keeps the distance Paul keeps: after the reign and the little season, *we which are alive and remain shall be caught up together with them in the clouds, to meet Yahusha (Lord) in the air* (1 Thessalonians 4:17) — the going up in the garments of the upper world, the body left behind (Ascension of Isaiah 4:17; 9:9). The garments of white are *the righteousness of saints* (Revelation 19:8).'
 WHERE slug='ascension-isaiah-4-saints-descend-garments';

UPDATE cross_reference_threads SET title = E'The faithful few flee desert to desert, awaiting the Beloved', summary_md = E'Of the believers in the crucified one — *Yahusha (Jesus) Yahuah (Lord) Messiah (Christ)* — *few in those days will be left as His servants, while they flee from desert to desert, awaiting the coming of the Beloved* (Ascension of Isaiah 4:13), under his reign of *three years and seven months and twenty-seven days* (4:12). This is the persecuted, fleeing remnant Yahusha foretold: *Then let them which be in Judaea flee into the mountains* (Matthew 24:16), and *except those days should be shortened, there should no flesh be saved: but for the elect''s sake those days shall be shortened* (Matthew 24:22). The beast out of the sea is given *power... to continue forty and two months* (Revelation 13:5) — a hemmed-in season too, counted in its own measure.'
 WHERE slug='ascension-isaiah-4-saints-flee-desert';

UPDATE cross_reference_threads SET title = E'The Lord comes with His armies and drags Beliar into Gehenna', summary_md = E'*Yahuah (Lord) will come with His angels and with the armies of the holy ones from the seventh heaven with the glory of the seventh heaven, and He will drag Beliar into Gehenna and also his armies* (Ascension of Isaiah 4:14). At his coming the lawless one is destroyed: *the armies which were in heaven followed him upon white horses* (Revelation 19:14), and the beast out of the sea and the false prophet *were cast alive into a lake of fire burning with brimstone* (Revelation 19:20). Paul: *that Wicked... whom Yahuah (Lord) shall consume with the spirit of his mouth, and shall destroy with the brightness of his coming* (2 Thessalonians 2:8). Enoch the seventh from Adam said the same — *Behold, Yahuah (Lord) cometh with ten thousands of his saints* (Jude 14). The saints who come with him are the seed of promise, gathered and coming with him into the land — *Yahuah Elohai (the LORD my God) shall come, and all the saints with thee* (Zechariah 14:5) — not souls come down from heaven; no other scripture has anyone coming down from the sky with him. It ain''t new.'
 WHERE slug='ascension-isaiah-4-Lord-comes-beliar-gehenna';

UPDATE cross_reference_threads SET title = E'He says ''I am God'' — the false christ exalted in the temple', summary_md = E'The lawless one *will do and speak like the Beloved and he will say: "I am Elohim (God) and before me there has been none"* (Ascension of Isaiah 4:6), and *all the people in the world will believe in him* (4:7), serving him: *"This is Elohim (God) and beside him there is no other"* (4:8). This is the self-deifying blasphemy Paul names exactly: he *exalteth himself above all that is called Elohim (God)... so that he as Elohim (God) sitteth in the temple of Elohim (God)* (2 Thessalonians 2:4). The whole earth wonders and *worshipped the beast* (Revelation 13:4) — the beast out of the sea —, and false christs *shew great signs and wonders; insomuch that, if it were possible, they shall deceive the very elect* (Matthew 24:24). The counterfeit aping of the Beloved is no new thing under the sun.'
 WHERE slug='ascension-isaiah-4-i-am-god';

COMMIT;
\echo 'session435b — NT and extra-canonical order-of-end corrections complete.'
