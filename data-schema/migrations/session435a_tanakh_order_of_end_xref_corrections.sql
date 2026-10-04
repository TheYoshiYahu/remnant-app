-- =====================================================================
-- Session 435a — Tanakh cross-references brought into the settled order of the end
-- (1 Thessalonians 4 two events; the last trump the seventh trumpet at the end)
-- =====================================================================
-- Updates the stored notes, thread titles/summaries and member notes written by
-- session303 (Isaiah 25-27), session307 (Joel 2), session310 (Deuteronomy 30),
-- session311 (Leviticus 23), session312 (Numbers 10, 29), session333 (Micah 4),
-- session336 (Zephaniah 1) and session338 (Zechariah 13-14), which predate the
-- settled order. The trump of Elohim at his coming (1 Thessalonians 4:16), the great
-- trumpet of the gathering, and the last trump (1 Corinthians 15:52, the seventh
-- trumpet at the end) are no longer fused into one ingathering. The source
-- migrations were corrected in place to the same text, so a fresh rebuild matches prod.
-- Daniel cards are deliberately untouched.
-- Apply:  python3 api/apply_migration.py data-schema/migrations/session435a_tanakh_order_of_end_xref_corrections.sql
-- =====================================================================

\echo 'session435a — Tanakh order-of-end corrections starting...'
BEGIN;

CREATE TEMP VIEW _s435a_lu AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ===== cross-reference notes =====

UPDATE cross_references x SET note = E'*So when this corruptible shall have put on incorruption, and this mortal shall have put on immortality, then shall be brought to pass the saying that is written, Death is swallowed up in victory* (1 Corinthians 15:54). Paul takes Isaiah''s word onto his lips at the climax of the resurrection — *He will swallow up death in victory* (Isaiah 25:8) — and dates it: *at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible* (15:52). The last trump is the seventh trumpet at the end, after the reign (Revelation 11:15-18): the death Isaiah saw swallowed is undone at the great resurrection, when *death and hell were cast into the lake of fire* (Revelation 20:14).'
  FROM _s435a_lu sv, _s435a_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=25 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=54
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_references x SET note = E'*In a moment, in the twinkling of an eye, at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible, and we shall be changed* (1 Corinthians 15:52). *Thy dead men shall live... Awake and sing, ye that dwell in dust* (Isaiah 26:19) is the rising of the righteous seed at his coming, while the indignation falls (Isaiah 26:20-21) — the first resurrection. Paul''s last trump is the last of all, the seventh trumpet at the end (Revelation 11:15-18), when *the dead shall be raised incorruptible* at the great resurrection. Isaiah''s *the earth shall cast out the dead* reaches to both risings, with the reign between them.'
  FROM _s435a_lu sv, _s435a_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=26 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_references x SET note = E'*So when this corruptible shall have put on incorruption, and this mortal shall have put on immortality, then shall be brought to pass the saying that is written, Death is swallowed up in victory* (1 Corinthians 15:54). The resurrection of *Thy dead men shall live* (Isaiah 26:19) runs on to the swallowing-up of death at the last trump — *Death is swallowed up in victory* — the very word of Isaiah''s own next-door promise, *He will swallow up death in victory* (Isaiah 25:8). The dust that casts out its dead is death itself undone.'
  FROM _s435a_lu sv, _s435a_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=26 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=54
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_references x SET note = E'*For Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16). *Thy dead men shall live, together with my dead body shall they arise* (Isaiah 26:19) is the rising Paul comforts with — *the dead in Messiah (Christ) shall rise first*. The shout and the trump call the righteous sleepers from the dust at his coming, while *Yahuah (LORD) cometh out of his place to punish the inhabitants of the earth for their iniquity* (Isaiah 26:21) — the first resurrection, of the righteous seed only, not of those of whom Isaiah says *they are deceased, they shall not rise* (Isaiah 26:14).'
  FROM _s435a_lu sv, _s435a_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=26 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_references x SET note = E'*He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces* (Isaiah 25:8). *Thy dead men shall live, together with my dead body shall they arise* (Isaiah 26:19) is the same hope Isaiah sang one chapter before — *He will swallow up death in victory*. The rising of the dead and the swallowing-up of death are one hope in two steps: *thy dead men* rise at his coming, and death itself is swallowed at the last trump, at the end (1 Corinthians 15:54).'
  FROM _s435a_lu sv, _s435a_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=26 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=25 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_references x SET note = E'*Marvel not at this: for the hour is coming, in the which all that are in the graves shall hear his voice, And shall come forth* (John 5:28-29). *Thy dead men shall live... the earth shall cast out the dead* (Isaiah 26:19) is raised by the voice the Formed Son names — *all that are in the graves shall hear his voice, And shall come forth*. The voice that raises the dust-dwellers is the voice of the Son who *hath life in himself* and HAS a Father (John 5:26); the resurrection is bodily. Isaiah''s *thy dead men* rise first, at his coming; the hour when *all that are in the graves* come forth, *they that have done good, unto the resurrection of life; and they that have done evil, unto the resurrection of damnation* (John 5:29), is the great resurrection at the end.'
  FROM _s435a_lu sv, _s435a_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=26 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_references x SET note = E'*And he shall send his angels with a great sound of a trumpet, and they shall gather together his elect from the four winds, from one end of heaven to the other* (Matthew 24:31). The *great trumpet* that gathers the scattered to *worship Yahuah (LORD) in the holy mount at Jerusalem* (27:13) is the same trumpet of the Son of Adam''s coming — *a great sound of a trumpet... gather together his elect from the four winds*. The great trumpet gathers the living home, out of every land where they were scattered.'
  FROM _s435a_lu sv, _s435a_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=27 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_references x SET note = E'*In a moment, in the twinkling of an eye, at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible, and we shall be changed* (1 Corinthians 15:52). The *great trumpet* of Isaiah 27:13 brings home *they... which were ready to perish* — the living gathered before the reign. Paul''s *last trump* is the last of all, the seventh trumpet at the end (Revelation 11:15-18): *the trumpet shall sound, and the dead shall be raised*. The ingathering of the scattered and the great resurrection are two soundings, with the reign between them.'
  FROM _s435a_lu sv, _s435a_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=27 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_references x SET note = E'*For Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16). *The trump of Elohim (God)* sounds at his coming, while the wrath falls, and *the dead in Messiah (Christ) shall rise first* — the first resurrection. Then *the great trumpet* of Isaiah 27:13 gathers the living outcasts home, *one by one* (Isaiah 27:12). The graves are opened first, then the living are gathered — no secret rapture severed from Yashar''el (Israel).'
  FROM _s435a_lu sv, _s435a_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=27 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_references x SET note = E'*In a moment, in the twinkling of an eye, at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible, and we shall be changed* (1 Corinthians 15:52). *Blow ye the trumpet in Zion, and sound an alarm* (Joel 2:1) — Joel''s shofar warns of the day of Yahuah. Paul''s last trump is the last of all the trumpets, the seventh at the end (Revelation 11:15-18), when the dead are raised at the great resurrection. The alarm and the last trump are not one sounding: the gathering, the reign and the little season lie between them.'
  FROM _s435a_lu sv, _s435a_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_references x SET note = E'*For Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16). The trumpet Joel sounds in Zion — *Blow ye the trumpet in Zion, and sound an alarm in my holy mountain* (Joel 2:1) — is the trump of Elohim at the day of Yahuah, when the One descends while the wrath falls and the dead in Messiah rise first — the first resurrection, and the remnant *saved out of it* (Jeremiah 30:7), not severed from Yashar''el.'
  FROM _s435a_lu sv, _s435a_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_references x SET note = E'*For Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16). The *memorial of blowing of trumpets* (Leviticus 23:24) reaches forward to *the trump of Elohim* at which the dead rise — the Feast of Trumpets reaching to his coming and the first resurrection, before the living are gathered.'
  FROM _s435a_lu sv, _s435a_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=23 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_references x SET note = E'*In a moment, in the twinkling of an eye, at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible, and we shall be changed* (1 Corinthians 15:52). *At the last trump* the dead are raised — the last of the trumpets, the seventh at the end (Revelation 11:15-18). The appointed *blowing of trumpets* of Leviticus 23:24 is the memorial of every trumpet Yahuah sounds, down to the last, the trumpet that wakes the sleeping at the great resurrection.'
  FROM _s435a_lu sv, _s435a_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=23 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_references x SET note = E'*In a moment, in the twinkling of an eye, at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible, and we shall be changed* (1 Corinthians 15:52). The trumpet that *ye shall be remembered before Yahuah Elohaychem (the LORD your God), and ye shall be saved from your enemies* (Numbers 10:9) reaches to the LAST trump — the seventh trumpet at the end (Revelation 11:15-18), when Yahuah remembers His people and saves them from the last enemy, death: *The last enemy that shall be destroyed is death* (1 Corinthians 15:26).'
  FROM _s435a_lu sv, _s435a_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=10 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_references x SET note = E'*For Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16). The trumpet of remembrance and deliverance — *ye shall be remembered before Yahuah Elohaychem (the LORD your God), and ye shall be saved from your enemies* (Numbers 10:9) — is filled by the trump of Elohim at the descent of the Formed Son, sounded while the wrath falls, when the dead in Messiah rise first and the remnant is *saved out of it* (Jeremiah 30:7).'
  FROM _s435a_lu sv, _s435a_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=10 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_references x SET note = E'*For Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first.* (1 Thessalonians 4:16). The shadow of *a day of blowing the trumpets* (Numbers 29:1) reaches forward to the trump of Elohim — his coming, when the dead in Messiah rise first; the scattered are gathered after.'
  FROM _s435a_lu sv, _s435a_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=29 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_references x SET note = E'*In a moment, in the twinkling of an eye, at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible, and we shall be changed.* (1 Corinthians 15:52). The Feast of Trumpets — *a day of blowing the trumpets unto you* (Numbers 29:1) — prefigures the last trump, the seventh trumpet at the end (Revelation 11:15-18), the appointed sound at which the great resurrection is accomplished.'
  FROM _s435a_lu sv, _s435a_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=29 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_references x SET note = E'*And the seventh angel sounded; and there were great voices in heaven, saying, The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15). The everlasting reign of Micah 4:7 — *Yahuah (LORD) shall reign over them in mount Zion... even for ever* — begins in Zion when the remnant is gathered, and runs on to the last trump, where heaven proclaims it: the kingdoms of the world become Yahuah''s and his Messiah''s, *and he shall reign for ever and ever*. The first dominion, the kingdom, come to the daughter of Zion (Micah 4:8).'
  FROM _s435a_lu sv, _s435a_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=11 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_references x SET note = E'*And the seventh angel sounded; and there were great voices in heaven, saying, The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15). *And Yahuah (LORD) shall be king over all the earth* (14:9) begins in that day, when his feet stand on the mount of Olives and the nations left alive go up *to worship the King* (14:16); the seventh trumpet proclaims it for ever at the end: the kingdoms of the world become his, and *he shall reign for ever and ever*. The universal kingship Zechariah foretold, proclaimed in heaven.'
  FROM _s435a_lu sv, _s435a_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=11 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_references x SET note = E'*Even so then at this present time also there is a remnant according to the election of grace* (Romans 11:5). *The third shall be left therein* (Zechariah 13:8), refined and reclaimed as *my people* (13:9), is the remnant Paul confirms still stands — *a remnant according to the election of grace*. The two parts cut off are the tares burned in the land; the third is the preserved remnant.'
  FROM _s435a_lu sv, _s435a_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=13 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=11 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_references x SET note = E'*To the end he may stablish your hearts unblameable in holiness before Elohim (God), even our Father, at the coming of our Lord Yahusha HaMashiach (Lord Jesus Christ) with all his saints* (1 Thessalonians 3:13). *Yahuah Elohai (the LORD my God) shall come, and all the saints with thee* (14:5) — the coming *with all his saints*: the saints are the seed of promise, the righteous raised and the scattered gathered to him at the day of Yahuah, not souls coming down from heaven.'
  FROM _s435a_lu sv, _s435a_lu tv
 WHERE sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

-- ===== thread titles and summaries =====

UPDATE cross_reference_threads SET title = E'He will swallow up death in victory — the resurrection and the abolition of death', summary_md = E'On the mountain Isaiah declares the word the whole library reaches for: *He will swallow up death in victory; and Adonai Yahuah (the Lord GOD) will wipe away tears from off all faces; and the rebuke of his people shall he take away from off all the earth: for Yahuah (LORD) hath spoken it* (Isaiah 25:8). Paul takes the verse onto his lips at the climax of the resurrection chapter: *So when this corruptible shall have put on incorruption, and this mortal shall have put on immortality, then shall be brought to pass the saying that is written, Death is swallowed up in victory* (1 Corinthians 15:54), *O death, where is thy sting? O grave, where is thy victory?* (15:55) — and he dates it: *In a moment, in the twinkling of an eye, at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible* (15:52). The last trump is the seventh trumpet at the end, after the reign (Revelation 11:15-18): this is the great resurrection, when death itself is undone — never a secret rapture at the beginning. John sees it consummated in the new creation: *And Elohim (God) shall wipe away all tears from their eyes; and there shall be no more death, neither sorrow, nor crying, neither shall there be any more pain* (Revelation 21:4); and the Lamb *shall lead them unto living fountains of waters: and Elohim (God) shall wipe away all tears from their eyes* (Revelation 7:17). Hosea sang the same defeat of the grave: *I will ransom them from the power of the grave; I will redeem them from death: O death, I will be thy plagues; O grave, I will be thy destruction* (Hosea 13:14) — the verse Paul welds to Isaiah 25:8. And Isaiah''s own next breath names the means: *Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust* (Isaiah 26:19). The restored witness holds the same hope through death: *the souls of the righteous are in the hand of Yahuah (God), and there shall no torment touch them... For though they be punished in the sight of men, yet is their hope full of immortality* (Wisdom of Solomon 3:1, 3:4). One hope across the whole library — death swallowed up, the dead raised, every tear wiped away.'
 WHERE slug='isaiah-25-he-will-swallow-up-death-in-victory';

UPDATE cross_reference_threads SET title = E'Thy dead men shall live — the resurrection of the dust, the first and the great', summary_md = E'After the travail that brought forth only wind (26:17-18), the prophet breaks into the resurrection keystone of the whole canon: *Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead* (Isaiah 26:19). Daniel speaks the LATERAL twin: *many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2). The Formed Son owns the voice that raises them, and names the last hour, when all the graves give up their dead: *the hour is coming, in the which all that are in the graves shall hear his voice, And shall come forth; they that have done good, unto the resurrection of life* (John 5:28-29) — the voice of the Son who *hath life in himself*, who has a Father. It is bodily, and it comes in its order. Isaiah sets the rising in the indignation: *Come, my people, enter thou into thy chambers... until the indignation be overpast. For, behold, Yahuah (LORD) cometh out of his place to punish the inhabitants of the earth for their iniquity* (Isaiah 26:20-21) — and Paul comforts with it: *the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16), the first resurrection, of the righteous seed only; of the others Isaiah says *they are deceased, they shall not rise* (Isaiah 26:14). The reign follows, and at the end the last trump, the seventh: *the trumpet shall sound, and the dead shall be raised incorruptible* (1 Corinthians 15:52), and then *Death is swallowed up in victory* (1 Corinthians 15:54) — the very promise Isaiah sang one chapter before, *He will swallow up death in victory* (Isaiah 25:8). And the first rising is the TWO-HOUSE resurrection — *Behold, O my people, I will open your graves, and cause you to come up out of your graves, and bring you into the land of Yashar''el (Israel)* (Ezekiel 37:12), the dry bones of *the whole house of Yashar''el (Israel)* raised and the two sticks made one. The restored witnesses sing the same rising: *the earth also shall give back that which has been entrusted to it, And Sheol also shall give back that which it has received* (1 Enoch 51:1); and the martyred brother answers the tyrant, *the King of the world shall raise us up, who have died for his laws, to everlasting life* (2 Maccabees 7:9). Two resurrections, bodily — the first at his coming, the great one at the end — the one hope the whole library carries, never a secret rapture.'
 WHERE slug='isaiah-26-thy-dead-men-shall-live';

UPDATE cross_reference_threads SET title = E'The great trumpet shall be blown — gathered one by one, both houses home', summary_md = E'The chapter ends with the homecoming: *And it shall come to pass in that day, that Yahuah (LORD) shall beat off from the channel of the river unto the stream of Egypt, and ye shall be gathered one by one, O ye children of Yashar''el (Israel). And it shall come to pass in that day, that the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem* (Isaiah 27:12-13). The great trumpet is the two-house ingathering — the scattered of BOTH houses, from Assyria (where the divorced north was exiled) and from Egypt, gathered home one by one. It is the very gathering Isaiah named earlier: *and shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth* (Isaiah 11:12). The whole library carries the trumpets forward in their order. First *with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16) — his coming and the first resurrection. Then the great trumpet of the gathering: *And he shall send his angels with a great sound of a trumpet, and they shall gather together his elect from the four winds, from one end of heaven to the other* (Matthew 24:31). And last of all, after the reign, the seventh trumpet: *In a moment, in the twinkling of an eye, at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible, and we shall be changed* (1 Corinthians 15:52). And the appointed time itself is their shadow: *a memorial of blowing of trumpets, an holy convocation* (Leviticus 23:24). The graves opened first, then the living gathered, and the last trump at the end — not a secret rapture severed from Yashar''el, not a people replaced, but the outcasts of both houses brought home to worship in the holy mount.'
 WHERE slug='isaiah-27-the-great-trumpet-gathered-one-by-one';

UPDATE cross_reference_threads SET title = E'Blow the trumpet in Zion — the alarm for the day of Yahuah, and the last trump', summary_md = E'The chapter opens with the shofar and closes the call with it again: *Blow ye the trumpet in Zion, and sound an alarm in my holy mountain: let all the inhabitants of the land tremble: for the day of Yahuah (LORD) cometh, for it is nigh at hand* (Joel 2:1), and *Blow the trumpet in Zion, sanctify a fast, call a solemn assembly* (Joel 2:15). This is the appointed-times architecture — the trumpet and the solemn assembly — sounded because *the day of Yahuah (LORD) is great and very terrible; and who can abide it?* (Joel 2:11). The Torah ordained that very alarm for the day of battle: *if ye go to war in your land against the enemy that oppresseth you, then ye shall blow an alarm with the trumpets; and ye shall be remembered before Yahuah Elohaychem (the LORD your God), and ye shall be saved from your enemies* (Numbers 10:9). Zephaniah names the same day in the same terms — *A day of the trumpet and alarm against the fenced cities* (Zephaniah 1:16), *a day of darkness and gloominess, a day of clouds and thick darkness* (Zephaniah 1:15; Joel 2:2). And the trumpet of Zion runs forward in its order. At the day of Yahuah he comes, while the wrath falls: *Yahuah (Lord) himself shall descend from heaven with a shout... and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16) — the first resurrection. The last trump sounds last of all, the seventh trumpet at the end, after the reign: *at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible* (1 Corinthians 15:52). The alarm of the day of Yahuah and the last trump are not one sounding — yet every trumpet sounds over the one people, never severed from Yashar''el.'
 WHERE slug='joel-2-blow-the-trumpet-in-zion-the-day-of-yahuah';

UPDATE cross_reference_threads SET title = E'Deuteronomy 30 — I will gather thee from all the nations: the return from exile', summary_md = E'This is the deliberate covenant ANSWER to the Deut 28 scattering. *And it shall come to pass, when all these things are come upon thee, the blessing and the curse ... and thou shalt call them to mind among all the nations, whither Yahuah Elohayka (the LORD thy God) hath driven thee, And shalt return unto Yahuah Elohayka ... That then Yahuah Elohayka (the LORD thy God) will turn thy captivity, and have compassion upon thee, and will return and gather thee from all the nations, whither Yahuah Elohayka (the LORD thy God) hath scattered thee* (Deuteronomy 30:1-3). The same hand that drove the people out gathers them home — *If any of thine be driven out unto the outmost parts of heaven, from thence will Yahuah ... gather thee, and from thence will he fetch thee* (Deuteronomy 30:4). The prophets carry the identical word: *He that scattered Yashar''el (Israel) will gather him, and keep him, as a shepherd doth his flock* (Jeremiah 31:10); and they name the TWO houses within the one ingathering — *shall assemble the outcasts of Yashar''el (Israel), and gather together the dispersed of Yahudah (Judah) from the four corners of the earth* (Isaiah 11:12). Nehemiah prays it back almost verbatim (Nehemiah 1:9); Ezekiel sets it as the frame of the new heart (Ezekiel 36:24). Forward it reaches the great trumpet of the gathering — *they shall gather together his elect from the four winds* (Matthew 24:31) — the cross''s purpose to *gather together in one the children of Elohim (God) that were scattered abroad* (John 11:52), and Paul''s seal *And so all Yashar''el (Israel) shall be saved* (Romans 11:26). The restored library witnesses with one voice: *I shall gather them from amongst all the nations* (Jubilees 1:15) and *I will bring them again into the land which I promised with an oath to their fathers* (Baruch 2:34). Not replacement, not a new people grafted in by confession — the same scattered covenant seed fetched home.'
 WHERE slug='deuteronomy-30-i-will-gather-thee-from-all-the-nations';

UPDATE cross_reference_threads SET title = E'The Feast of Trumpets — the trump at his coming, the ingathering, and the last trump', summary_md = E'*In the seventh month, in the first day of the month, shall ye have a sabbath, a memorial of blowing of trumpets, an holy convocation* (Leviticus 23:24). The feast is set again in the Torah — *a day of blowing the trumpets unto you* (Numbers 29:1) — and becomes the prophet''s summons: *blow ye the trumpet in Zion, and sound an alarm in my holy mountain... for the day of Yahuah (LORD) cometh* (Joel 2:1). It reaches forward to the trumpets of the end, in their order: at his coming, *Yahuah (Lord) himself shall descend from heaven with a shout... and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16); then the gathering, *he shall send his angels with a great sound of a trumpet, and they shall gather together his elect from the four winds* (Matthew 24:31); and after the reign, the seventh trumpet, *at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible* (1 Corinthians 15:52). The Day of Trumpets foretells them all — the dead in Messiah raised at his coming, the scattered two-house people regathered at the sound of the trumpet, and the great resurrection at the last.'
 WHERE slug='leviticus-23-the-feast-of-trumpets-the-last-trump-and-the-ingathering';

UPDATE cross_reference_threads SET title = E'The Two Silver Trumpets — that gather, warn, and mark the appointed times', summary_md = E'Yahuah commands two trumpets of beaten silver — *Make thee two trumpets of silver; of a whole piece shalt thou make them: that thou mayest use them for the calling of the assembly, and for the journeying of the camps* (Numbers 10:2). They have three offices: the assembly-blast that gathers the congregation — *when the congregation is to be gathered together, ye shall blow, but ye shall not sound an alarm* (Numbers 10:7); the alarm that moves the camps — *when ye blow an alarm, then the camps that lie on the east parts shall go forward* (Numbers 10:5); and the alarm-for-war that brings remembrance and deliverance — *if ye go to war in your land against the enemy that oppresseth you, then ye shall blow an alarm with the trumpets; and ye shall be remembered before Yahuah Elohaychem (the LORD your God), and ye shall be saved from your enemies* (Numbers 10:9). And they sound over the appointed times — *also in the day of your gladness, and in your solemn days, and in the beginnings of your months, ye shall blow with the trumpets... that they may be to you for a memorial before your Elohim (God)* (Numbers 10:10). This is the trumpet of Yahuah, and it rings through the whole library. Paul demands a certain sound — *for if the trumpet give an uncertain sound, who shall prepare himself to the battle?* (1 Corinthians 14:8) — and names the trumpets of the end: *with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16) at his coming, and the last trump, the seventh at the end, after the reign: *in a moment, in the twinkling of an eye, at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible* (1 Corinthians 15:52). Messiah sends His angels *with a great sound of a trumpet, and they shall gather together his elect from the four winds* (Matthew 24:31), and the seven angels stand *and to them were given seven trumpets* (Revelation 8:2). It is the same trumpet that keeps the calendar — *a memorial of blowing of trumpets, an holy convocation* (Leviticus 23:24) — and that Joel sounds as the day of Yahuah: *blow ye the trumpet in Zion, and sound an alarm in my holy mountain* (Joel 2:1); *blow the trumpet in Zion, sanctify a fast, call a solemn assembly* (Joel 2:15). The trumpet that once gathered the camps gathers the scattered house home before the reign.'
 WHERE slug='numbers-10-the-two-silver-trumpets-that-gather-warn-and-mark-the-appointed-times';

UPDATE cross_reference_threads SET title = E'The day of blowing the trumpets — the trump at his coming, the ingathering, and the last trump', summary_md = E'The seventh month opens with the trumpet. *In the seventh month, on the first day of the month, ye shall have an holy convocation; ye shall do no servile work: it is a day of blowing the trumpets unto you* (Numbers 29:1), and the offerings follow — *one young bullock, one ram, and seven lambs... and one kid of the goats for a sin offering, to make an atonement for you* (Numbers 29:2,5). Leviticus names it the same: *a memorial of blowing of trumpets, an holy convocation* (Leviticus 23:24), and the psalmist sings it as covenant law — *Blow up the trumpet in the new moon, in the time appointed, on our solemn feast day. For this was a statute for Yashar''el (Israel), and a law of the Elohim (God) of Jacob* (Psalm 81:3-4). This is no defunct custom; it is Yahuah''s calendar, and the trumpet is the appointed sound of regathering. It reaches forward, in order: *Yahuah (Lord) himself shall descend from heaven with a shout... and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16) at his coming; *he shall send his angels with a great sound of a trumpet, and they shall gather together his elect from the four winds* (Matthew 24:31) at the gathering; and *at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible* (1 Corinthians 15:52) — the seventh trumpet at the end, after the reign. The Feast of Trumpets is the shadow whose body is all of them — the dead in Messiah raised at his coming, the scattered houses of Yashar''el gathered, and the great resurrection at the last blast.'
 WHERE slug='numbers-29-the-day-of-blowing-the-trumpets-the-last-trump-and-the-ingathering';

UPDATE cross_reference_threads SET title = E'The great day of Yahuah — a day of wrath, darkness, and the trumpet', summary_md = E'This is THE classic day-of-Yahuah text: *The great day of Yahuah (LORD) is near, it is near, and hasteth greatly, even the voice of the day of Yahuah (LORD): the mighty man shall cry there bitterly. That day is a day of wrath, a day of trouble and distress, a day of wasteness and desolation, a day of darkness and gloominess, a day of clouds and thick darkness, A day of the trumpet and alarm against the fenced cities, and against the high towers* (Zephaniah 1:14-16). Joel describes the same day in nearly the same words: *Blow ye the trumpet in Zion, and sound an alarm in my holy mountain... for the day of Yahuah (LORD) cometh, for it is nigh at hand; A day of darkness and of gloominess, a day of clouds and of thick darkness* (Joel 2:1-2), *for the day of Yahuah (LORD) is great and very terrible; and who can abide it?* (Joel 2:11). Amos strips away the false hope: *the day of Yahuah (LORD) is darkness, and not light* (Amos 5:18). Isaiah: *the day of Yahuah (LORD) cometh, cruel both with wrath and fierce anger* (Isaiah 13:9). And the prophets'' day breaks open into the gospel''s, named and dated by the same marks. The suddenness: *the day of Yahuah (Lord) so cometh as a thief in the night* (1 Thessalonians 5:2) — surprising exactly the men settled on their lees. The darkness: *the sun be darkened, and the moon shall not give her light, and the stars shall fall from heaven* (Matthew 24:29). The trumpet — Zephaniah''s *trumpet and alarm* — now also gathers the two-house elect: *he shall send his angels with a great sound of a trumpet, and they shall gather together his elect from the four winds* (Matthew 24:31). And the wrath: *the great day of his wrath is come; and who shall be able to stand?* (Revelation 6:17). One day of wrath, its trumpet of alarm, and after it the trumpet of the gathering — from Zephaniah to the Revelation.'
 WHERE slug='zephaniah-1-the-great-day-of-yahuah-a-day-of-wrath';

UPDATE cross_reference_threads SET title = E'Yahuah shall reign over them in mount Zion — the lame gathered as a remnant, the kingdom restored', summary_md = E'The latter-day reign begins with a regathering of the broken: *In that day, saith Yahuah (LORD), will I assemble her that halteth, and I will gather her that is driven out, and her that I have afflicted; And I will make her that halted a remnant, and her that was cast far off a strong nation: and Yahuah (LORD) shall reign over them in mount Zion from henceforth, even for ever* (Micah 4:6-7). This is the two-house regathering — the lame, the driven-out, the afflicted, the cast-far-off made a remnant and a strong nation. Zephaniah speaks the same word: *I will save her that halteth, and gather her that was driven out; and I will get them praise and fame in every land where they have been put to shame* (Zephaniah 3:19); and the Shepherd of Ezekiel seeks the scattered flock: *I will seek that which was lost, and bring again that which was driven away, and will bind up that which was broken* (Ezekiel 34:16). The everlasting reign in Zion is the kingdom of the Davidic King: *he shall reign over the house of Jacob for ever; and of his kingdom there shall be no end* (Luke 1:33), the reign that begins in Zion when the remnant is gathered and is proclaimed for ever at the last trump — *The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15). And to the daughter of Zion the dominion returns: *unto thee shall it come, even the first dominion; the kingdom shall come to the daughter of Jerusalem* (Micah 4:8).'
 WHERE slug='micah-4-yahuah-shall-reign-over-them-in-mount-zion';

UPDATE cross_reference_threads SET title = E'And all the saints with thee — he cometh with ten thousands of his holy ones', summary_md = E'The day of Yahuah is a coming with the holy ones: *and Yahuah Elohai (the LORD my God) shall come, and all the saints with thee* (Zechariah 14:5). This is one witness across the whole library. Paul names the coming *with all his saints*: *To the end he may stablish your hearts unblameable in holiness before Elohim (God), even our Father, at the coming of our Lord Yahusha HaMashiach (Lord Jesus Christ) with all his saints* (1 Thessalonians 3:13). And Jude quotes the restored book of Enoch by name: *And Enoch also, the seventh from Adam, prophesied of these, saying, Behold, Yahuah (Lord) cometh with ten thousands of his saints* (Jude 1:14) — which is the very line of 1 Enoch: *And behold! He cometh with ten thousands of His set-apart ones To execute judgement upon all, And to destroy all the ungodly* (1 Enoch 1:9). Zechariah''s *all the saints with thee*, Paul''s *all his saints*, Jude''s *ten thousands of his saints*, and Enoch''s *ten thousands of His set-apart ones* are one and the same coming — the Formed Son at the day of Yahuah, for the judgement upon all flesh. And the saints with him are the seed of promise, the twelve tribes without the tares — the righteous raised out of Sheol and the scattered gathered to him — not souls descending from heaven.'
 WHERE slug='zechariah-14-and-all-the-saints-with-thee';

-- ===== thread member notes =====

UPDATE cross_reference_thread_members m SET member_note = E'★★★ *all that are in the graves shall hear his voice, And shall come forth* (John 5:28-29) — the Formed Son''s voice raises the dust-dwellers of Isaiah 26:19; *thy dead men* first at his coming, all the graves at the great resurrection.'
  FROM cross_reference_threads t, cross_references x, _s435a_lu sv, _s435a_lu tv
 WHERE t.slug='isaiah-26-thy-dead-men-shall-live' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=26 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=5 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_reference_thread_members m SET member_note = E'★★ *at the last trump... the dead shall be raised incorruptible* (1 Corinthians 15:52) — the last trump, the seventh at the end: the dust giving up its dead at the great resurrection, after the first rising of Isaiah 26:19.'
  FROM cross_reference_threads t, cross_references x, _s435a_lu sv, _s435a_lu tv
 WHERE t.slug='isaiah-26-thy-dead-men-shall-live' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=26 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_reference_thread_members m SET member_note = E'★★ *the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16) — the rising of *Thy dead men shall live* (Isaiah 26:19) at his coming, the first resurrection of the righteous seed.'
  FROM cross_reference_threads t, cross_references x, _s435a_lu sv, _s435a_lu tv
 WHERE t.slug='isaiah-26-thy-dead-men-shall-live' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=26 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_reference_thread_members m SET member_note = E'★ *He will swallow up death in victory* (Isaiah 25:8) — Isaiah''s own next-door promise; the rising of the dead at his coming and the swallowing-up of death at the last trump (1 Corinthians 15:54) are one hope in two steps.'
  FROM cross_reference_threads t, cross_references x, _s435a_lu sv, _s435a_lu tv
 WHERE t.slug='isaiah-26-thy-dead-men-shall-live' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=26 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=25 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_reference_thread_members m SET member_note = E'★★ *a great sound of a trumpet... gather together his elect from the four winds* (Matthew 24:31) — the great trumpet of Isaiah 27:13 carried forward to the Son of Adam''s gathering of the living.'
  FROM cross_reference_threads t, cross_references x, _s435a_lu sv, _s435a_lu tv
 WHERE t.slug='isaiah-27-the-great-trumpet-gathered-one-by-one' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=27 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_reference_thread_members m SET member_note = E'★ *at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible* (1 Corinthians 15:52) — not the great trumpet of 27:13: the last trump is the seventh at the end, after the reign; the gathering and the great resurrection are two soundings.'
  FROM cross_reference_threads t, cross_references x, _s435a_lu sv, _s435a_lu tv
 WHERE t.slug='isaiah-27-the-great-trumpet-gathered-one-by-one' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=27 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_reference_thread_members m SET member_note = E'★ *with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16) — the trump of Elohim sounds at his coming and the dead rise first; then the great trumpet (27:13) gathers the living, not a severed secret rapture.'
  FROM cross_reference_threads t, cross_references x, _s435a_lu sv, _s435a_lu tv
 WHERE t.slug='isaiah-27-the-great-trumpet-gathered-one-by-one' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='isaiah' AND sv.chapter_number=27 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_reference_thread_members m SET member_note = E'★ *at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible* (1 Corinthians 15:52) — the last trump is the seventh at the end, after the reign; Joel''s alarm (Joel 2:1) sounds for the day of Yahuah before it.'
  FROM cross_reference_threads t, cross_references x, _s435a_lu sv, _s435a_lu tv
 WHERE t.slug='joel-2-blow-the-trumpet-in-zion-the-day-of-yahuah' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_reference_thread_members m SET member_note = E'★ *with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16) — the shofar of Joel 2:1 is the trump at the day of Yahuah, his coming and the first resurrection; the gathering follows.'
  FROM cross_reference_threads t, cross_references x, _s435a_lu sv, _s435a_lu tv
 WHERE t.slug='joel-2-blow-the-trumpet-in-zion-the-day-of-yahuah' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='joel' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_reference_thread_members m SET member_note = E'1 Thessalonians 4:16 — *the trump of Elohim (God): and the dead in Messiah shall rise first* — the Day of Trumpets reaching to his coming and the first resurrection.'
  FROM cross_reference_threads t, cross_references x, _s435a_lu sv, _s435a_lu tv
 WHERE t.slug='leviticus-23-the-feast-of-trumpets-the-last-trump-and-the-ingathering' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='leviticus' AND sv.chapter_number=23 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_reference_thread_members m SET member_note = E'*the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16) — the trumpet-feast reaching forward to his coming and the first resurrection.'
  FROM cross_reference_threads t, cross_references x, _s435a_lu sv, _s435a_lu tv
 WHERE t.slug='numbers-29-the-day-of-blowing-the-trumpets-the-last-trump-and-the-ingathering' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='numbers' AND sv.chapter_number=29 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=4 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_reference_thread_members m SET member_note = E'★★ *The kingdoms of this world are become the kingdoms of our Lord, and of his Messiah (Christ); and he shall reign for ever and ever* (Revelation 11:15) — the everlasting reign of Micah 4:7, begun in Zion and proclaimed for ever at the last trump; the first dominion restored to the daughter of Zion (4:8).'
  FROM cross_reference_threads t, cross_references x, _s435a_lu sv, _s435a_lu tv
 WHERE t.slug='micah-4-yahuah-shall-reign-over-them-in-mount-zion' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='micah' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=11 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_reference_thread_members m SET member_note = E'★★★ *The kingdoms of this world are become the kingdoms of our Lord... and he shall reign for ever and ever* (Revelation 11:15) — the kingship of *Yahuah (LORD) shall be king over all the earth* (14:9), begun in that day and proclaimed for ever at the end.'
  FROM cross_reference_threads t, cross_references x, _s435a_lu sv, _s435a_lu tv
 WHERE t.slug='zechariah-14-yahuah-shall-be-king-over-all-the-earth-his-name-one' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=11 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';

UPDATE cross_reference_thread_members m SET member_note = E'★ *the coming of our Lord Yahusha HaMashiach (Lord Jesus Christ) with all his saints* (1 Thessalonians 3:13) — the coming *with all the saints* of Zechariah 14:5, the seed of promise raised and gathered to him.'
  FROM cross_reference_threads t, cross_references x, _s435a_lu sv, _s435a_lu tv
 WHERE t.slug='zechariah-14-and-all-the-saints-with-thee' AND m.thread_id=t.id AND m.cross_reference_id=x.id
   AND sv.edition_slug='canon' AND sv.book_slug='zechariah' AND sv.chapter_number=14 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='1-thessalonians' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual';
COMMIT;
\echo 'session435a — Tanakh order-of-end corrections complete.'
