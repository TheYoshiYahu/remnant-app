-- ----- fragment: minion_1thessalonians_04.sql (S233 1 Thessalonians 4) -----
-- =====================================================================
-- S233 minion — 1 THESSALONIANS 4 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: 1 THESSALONIANS 4 (18 verses) — ★★ HIGH watchpoint / BLESSING:
--   sanctification (4:3-7), taught-of-Elohim to love (4:9), and THE RESURRECTION
--   AND THE GATHERING at the trump of Elohim (4:13-18).
-- Tag: t104 (temp view _s233_t104_lookup).
-- Sort band: floor 8125, step 3 (8125, 8128, 8131, 8134 used; under 8150).
-- Source is ALWAYS the canon 1 Thessalonians verse; targets span Tanakh + extra-canonical + NT, woven.
-- Tiers per-row: canon target (Tanakh + NT) = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME: 1 Thess 4 is the apostle's great early eschatology. The will of Elohim is
-- sanctification — the holiness code of Leviticus 18-20 re-spoken, not abolished; brotherly love is
-- the Torah written on the heart (Jeremiah 31:33). And the resurrection of 4:13-18 is THE ONE GREAT
-- RESURRECTION-INGATHERING at the last trump: the dead in Messiah raised, the living caught up
-- together with them to meet the returning King — the same event as Isaiah 27:13 (the great trumpet,
-- the outcasts regathered), Daniel 12:2 / Ezekiel 37:12-14 / Isaiah 26:19 (the graves opened, the
-- two-house people raised), 1 Corinthians 15:51-52 (the last trump), and Matthew 24:31 (the trumpet
-- gathers the elect). The *caught up together... to meet Yahuah in the air* is the gathered
-- commonwealth of Yashar'el (Israel) + the grafted-in meeting the King — NOT a secret pre-trib
-- rapture severed from Israel, NOT a separate program for a church that replaced Israel.
--
-- 1 Thessalonians 4 coverage:
--   v.3-7  sanctification / abstain from fornication / holiness not uncleanness
--          Tanakh: Leviticus 18:30 (keep mine ordinance, defile not yourselves), Leviticus 19:2
--                  (Ye shall be holy: for I Yahuah am holy), Leviticus 20:26 (be holy... severed you
--                  from other people)
--          Extras: none warranted   NT: none warranted (the holiness-code root carries it)
--   v.9    taught of Elohim to love one another
--          Tanakh: Jeremiah 31:33 (I will put my law in their inward parts, and write it in their hearts)
--          Extras: none warranted   NT: none warranted (the law-on-the-heart root carries it)
--   v.13-18 ★★ the dead in Messiah rise first / caught up to meet Yahuah / the trump of Elohim
--          Tanakh: Isaiah 27:13 (the great trumpet shall be blown... the outcasts... shall worship
--                  Yahuah), Daniel 12:2 (many that sleep in the dust shall awake), Ezekiel 37:12
--                  (I will open your graves... bring you into the land), Ezekiel 37:14 (put my spirit
--                  in you, and ye shall live), Isaiah 26:19 (Thy dead men shall live... Awake and sing,
--                  ye that dwell in dust)
--          Extras: 2 Esdras 7:32 (the earth shall restore those that are asleep in her), 1 Enoch 51:1
--                  (Sheol shall give back that which it has received... the Elect One shall arise)
--          NT: 1 Corinthians 15:51-52 (at the last trump... the dead shall be raised), Matthew 24:31
--              (a great sound of a trumpet... gather together his elect from the four winds)
--   v.1-2,8,10-12 walk to please Elohim / commandments given / work with your own hands
--          Tanakh: none warranted (general exhortation; the sanctification root is carried at v.3-7)
--          Extras: none warranted   NT: none warranted
--
-- THREADS (slug -> target libraries):
--   1-thessalonians-4-sanctification-abstain-from-fornication-the-holiness-code-leviticus-18-20  (Tanakh; free)
--   1-thessalonians-4-taught-of-elohim-to-love-the-law-written-on-the-heart-jeremiah-31          (Tanakh; free)
--   1-thessalonians-4-the-dead-in-messiah-rise-the-trump-of-gathering-isaiah-27-daniel-12         (Tanakh + NT; free)
--   1-thessalonians-4-the-earth-gives-back-her-dead-the-day-of-resurrection-2-esdras-7-1-enoch-51 (extras; extras)

CREATE TEMP VIEW _s233_t104_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id=c.id JOIN books b ON c.book_id=b.id
  JOIN editions e ON b.edition_id=e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ----- cross_references -----
WITH input(src_edition,src_slug,src_ch,src_v,tgt_edition,tgt_slug,tgt_ch,tgt_v,tier,note) AS (VALUES
  -- thread: 1-thessalonians-4-sanctification-abstain-from-fornication-the-holiness-code-leviticus-18-20
  ('canon','1-thessalonians',4,3,'canon','leviticus',19,2,'free', E'*Speak unto all the congregation of the children of Yashar''el (Israel), and say unto them, Ye shall be holy: for I Yahuah Elohaychem (the LORD your God) am holy.* (Leviticus 19:2). The whole holiness code opens with this charge, and Paul speaks it again to Thessalonica: *this is the will of Elohim (God), even your sanctification, that ye should abstain from fornication* (1 Thessalonians 4:3). *Be ye holy, for I am holy* is the ground of the will of Elohim (God) — sanctification is not a new demand but the standing word of Yahuah (LORD) to his congregation, the Torah of holiness carried into the assembly of the called-out.'),
  ('canon','1-thessalonians',4,3,'canon','leviticus',18,30,'free', E'*Therefore shall ye keep mine ordinance, that ye commit not any one of these abominable customs, which were committed before you, and that ye defile not yourselves therein: I am Yahuah Elohaychem (the LORD your God).* (Leviticus 18:30). The Leviticus holiness code closes its catalogue of forbidden unions with this guard against the *abominable customs* of the nations. Paul re-speaks it: *abstain from fornication... not in the lust of concupiscence, even as the Gentiles which know not Elohim (God)* (1 Thessalonians 4:3,5). The defilement Yahuah (LORD) forbade his people, the apostle forbids the gathered seed; *that ye defile not yourselves* is the very ordinance that sets Israel apart from the doings of the land.'),
  ('canon','1-thessalonians',4,7,'canon','leviticus',20,26,'free', E'*And ye shall be holy unto me: for I Yahuah (LORD) am holy, and have severed you from other people, that ye should be mine.* (Leviticus 20:26). Yahuah (LORD) severed his people *from other people* unto holiness, *that ye should be mine.* Paul names the same calling: *For Elohim (God) hath not called us unto uncleanness, but unto holiness* (1 Thessalonians 4:7). The severing-unto-holiness of Leviticus is the calling of the assembly; *not unto uncleanness, but unto holiness* is the holiness code spoken to the called-out, who are Yahuah''s (LORD''s) own, separated from the uncleanness of the nations that know not Elohim (God).'),
  -- thread: 1-thessalonians-4-taught-of-elohim-to-love-the-law-written-on-the-heart-jeremiah-31
  ('canon','1-thessalonians',4,9,'canon','jeremiah',31,33,'free', E'*But this shall be the covenant that I will make with the house of Yashar''el (Israel); After those days, saith Yahuah (LORD), I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people.* (Jeremiah 31:33). Yahuah (LORD) promised a covenant with the house of Yashar''el (Israel) in which his law would be *written in their hearts.* Paul says it is come: *as touching brotherly love ye need not that I write unto you: for ye yourselves are taught of Elohim (God) to love one another* (1 Thessalonians 4:9). To be *taught of Elohim (God)* is to have the law written on the heart — not the law abolished but the same Torah of love put within, the new covenant of Jeremiah inscribed in the gathered people so that they need no outward writing to know to love.'),
  -- thread: 1-thessalonians-4-the-dead-in-messiah-rise-the-trump-of-gathering-isaiah-27-daniel-12
  ('canon','1-thessalonians',4,16,'canon','isaiah',27,13,'free', E'*And it shall come to pass in that day, that the great trumpet shall be blown, and they shall come which were ready to perish in the land of Assyria, and the outcasts in the land of Egypt, and shall worship Yahuah (LORD) in the holy mount at Jerusalem.* (Isaiah 27:13). The trump of the gathering is Isaiah''s: *the great trumpet shall be blown,* and the scattered outcasts of Yashar''el (Israel) *shall come* to worship Yahuah (LORD). This is the trumpet behind *Yahuah (Lord) himself shall descend from heaven with a shout... and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16). The great trumpet that regathers the ready-to-perish is the trump of Elohim (God) that raises the dead in Messiah (Christ) — one and the same ingathering of the scattered people, not a secret summons severed from Yashar''el (Israel) but the regathering Isaiah foretold.'),
  ('canon','1-thessalonians',4,16,'canon','daniel',12,2,'free', E'*And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2). Daniel saw the resurrection: *many of them that sleep in the dust of the earth shall awake.* Paul writes of *them which are asleep* and says *the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:13,16). The sleepers in the dust who awake in Daniel are the dead in Messiah (Christ) who rise at the trump — the same awakening from the dust, the resurrection of the Tanakh now named as the rising of those asleep in Yahusha (Jesus), that they sorrow not as others which have no hope.'),
  ('canon','1-thessalonians',4,16,'canon','ezekiel',37,12,'free', E'*Therefore prophesy and say unto them, Thus saith Adonai Yahuah (the Lord GOD); Behold, O my people, I will open your graves, and cause you to come up out of your graves, and bring you into the land of Yashar''el (Israel).* (Ezekiel 37:12). To the whole house of Yashar''el (Israel), the dried bones, Yahuah (LORD) promised: *I will open your graves, and cause you to come up out of your graves.* This is the resurrection-and-gathering Paul declares: *the dead in Messiah (Christ) shall rise first: Then we which are alive and remain shall be caught up together with them* (1 Thessalonians 4:16-17). The opened graves of the two-house people, brought up and gathered into the land, are the dead in Messiah (Christ) raised and caught up together — the one resurrection of the regathered house, not a rapture detached from Yashar''el (Israel) but its very fulfilment.'),
  ('canon','1-thessalonians',4,17,'canon','ezekiel',37,14,'free', E'*And shall put my spirit in you, and ye shall live, and I shall place you in your own land: then shall ye know that I Yahuah (LORD) have spoken it, and performed it, saith Yahuah (LORD).* (Ezekiel 37:14). Yahuah (LORD) seals the vision of the opened graves: *I will put my spirit in you, and ye shall live, and I shall place you in your own land.* Paul says the raised and the living *shall be caught up together with them in the clouds, to meet Yahuah (Lord) in the air: and so shall we ever be with Yahuah (Lord)* (1 Thessalonians 4:17). The Spirit-given life and the placing of the people with Yahuah (LORD) is the *ever be with Yahuah (Lord)* of the gathering — the regathered house brought to dwell with their Elohim (God), the promise Ezekiel sealed performed at the trump.'),
  ('canon','1-thessalonians',4,16,'canon','isaiah',26,19,'free', E'*Thy dead men shall live, together with my dead body shall they arise. Awake and sing, ye that dwell in dust: for thy dew is as the dew of herbs, and the earth shall cast out the dead.* (Isaiah 26:19). Isaiah''s song of resurrection: *Thy dead men shall live... Awake and sing, ye that dwell in dust... the earth shall cast out the dead.* This is the rising Paul proclaims — *the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16). The dwellers in dust who awake and sing, the earth giving back her dead, are the dead in Messiah (Christ) raised at the descending of Yahuah (Lord); the comfort Isaiah sang to the mourners is the comfort Paul gives, *Wherefore comfort one another with these words* (1 Thessalonians 4:18).'),
  ('canon','1-thessalonians',4,16,'canon','1-corinthians',15,52,'free', E'*In a moment, in the twinkling of an eye, at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible, and we shall be changed.* (1 Corinthians 15:52). Paul names the same trumpet to the Corinthians: *at the last trump... the dead shall be raised incorruptible, and we shall be changed.* It is the exact twin of *the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16). The last trump that raises the dead incorruptible is the trump of Elohim (God) that raises the dead in Messiah (Christ) — one trumpet, one resurrection, the single great ingathering at the end, not two separate events but the one last-trump rising of the asleep.'),
  ('canon','1-thessalonians',4,17,'canon','matthew',24,31,'free', E'*And he shall send his angels with a great sound of a trumpet, and they shall gather together his elect from the four winds, from one end of heaven to the other.* (Matthew 24:31). Yahusha (Jesus) foretold the gathering at the trumpet: *a great sound of a trumpet, and they shall gather together his elect from the four winds.* This is the gathering Paul describes: *we which are alive and remain shall be caught up together with them in the clouds, to meet Yahuah (Lord) in the air* (1 Thessalonians 4:17). The trumpet that gathers the elect from the four winds is the trump of Elohim (God) that catches up the living together with the raised — the one ingathering of the scattered people to meet the returning King, the Olivet word and the apostolic word naming one event.'),
  -- thread: 1-thessalonians-4-the-earth-gives-back-her-dead-the-day-of-resurrection-2-esdras-7-1-enoch-51
  ('canon','1-thessalonians',4,16,'apocrypha','2-esdras',7,32,'extras', E'*And the earth shall restore those that are asleep in her, and so shall the dust those that dwell in silence, and the secret places shall deliver those souls that were committed to them.* (2 Esdras 7:32). The restored library held the same hope of resurrection: *the earth shall restore those that are asleep in her... and the secret places shall deliver those souls.* This is the rising Paul declares — *them which are asleep... the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:13,16). The earth restoring the asleep and the dust giving up those who dwell in silence is the dead in Messiah (Christ) raised at the trump; the Hebrew witness names the one day the earth gives back her dead before the seat of judgment.'),
  ('canon','1-thessalonians',4,16,'enoch','1-enoch',51,1,'extras', E'*And in those days shall the earth also give back that which has been entrusted to it, And Sheol also shall give back that which it has received, And hell shall give back that which it owes. For in those days the Elect One shall arise,* (1 Enoch 51:1). The library beholds the day of resurrection: *the earth shall give back that which has been entrusted to it, And Sheol also shall give back that which it has received,* and *the Elect One shall arise.* This is the day Paul names — *Yahuah (Lord) himself shall descend from heaven with a shout... and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16). Sheol giving back what it received at the arising of the Elect One is the dead in Messiah (Christ) raised at the descending of the King; the one ingathering when the earth and the grave surrender the asleep, that the chosen should be saved.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s233_t104_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s233_t104_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-thessalonians-4-sanctification-abstain-from-fornication-the-holiness-code-leviticus-18-20',
       E'The will of Elohim, your sanctification: the holiness code (Leviticus 18-20)',
       E'Paul names the will of Elohim (God) plainly: *this is the will of Elohim (God), even your sanctification, that ye should abstain from fornication... not in the lust of concupiscence, even as the Gentiles which know not Elohim (God)... For Elohim (God) hath not called us unto uncleanness, but unto holiness* (1 Thessalonians 4:3,5,7). This is the holiness code of Leviticus carried into the assembly, not a new ethic invented for the nations. The ground of it is Yahuah''s (LORD''s) own charge: *Ye shall be holy: for I Yahuah Elohaychem (the LORD your God) am holy* (Leviticus 19:2). The forbidden uncleanness is the *abominable customs* against which Leviticus guards — *that ye defile not yourselves therein: I am Yahuah Elohaychem (the LORD your God)* (Leviticus 18:30) — the doings of the land that know not Elohim (God). And the calling unto holiness is the severing of the people unto Yahuah (LORD): *ye shall be holy unto me: for I Yahuah (LORD) am holy, and have severed you from other people, that ye should be mine* (Leviticus 20:26). The sanctification the apostle commands is the Torah of holiness spoken to the called-out — to be holy because Yahuah (LORD) is holy, severed from uncleanness, the same standard given at Sinai now written upon the gathered seed.',
       sv.verse_id, ev.verse_id, 'free', 8125
  FROM _s233_t104_lookup sv, _s233_t104_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=3
   AND ev.edition_slug='canon' AND ev.book_slug='1-thessalonians' AND ev.chapter_number=4 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-thessalonians-4-taught-of-elohim-to-love-the-law-written-on-the-heart-jeremiah-31',
       E'Taught of Elohim to love one another: the law written on the heart (Jeremiah 31)',
       E'*As touching brotherly love ye need not that I write unto you: for ye yourselves are taught of Elohim (God) to love one another* (1 Thessalonians 4:9). To be *taught of Elohim (God)* — needing no outward writing — is the very promise of the new covenant Yahuah (LORD) made with the house of Yashar''el (Israel): *I will put my law in their inward parts, and write it in their hearts; and will be their Elohim (God), and they shall be my people* (Jeremiah 31:33). The law of love is not abolished and replaced; it is the same Torah put within, inscribed on the heart so that the gathered people know to love one another without an outward command. The apostle does not set love against the law but names the law fulfilled in the heart — the new covenant of Jeremiah come, the people who are taught of Elohim (God) because his Torah is written in their inward parts.',
       sv.verse_id, ev.verse_id, 'free', 8128
  FROM _s233_t104_lookup sv, _s233_t104_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='1-thessalonians' AND ev.chapter_number=4 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-thessalonians-4-the-dead-in-messiah-rise-the-trump-of-gathering-isaiah-27-daniel-12',
       E'The dead in Messiah rise first: the trump of the gathering (Isaiah 27, Daniel 12, Ezekiel 37)',
       E'This is the apostle''s great word of the resurrection and the gathering: *I would not have you to be ignorant, brethren, concerning them which are asleep, that ye sorrow not, even as others which have no hope... Yahuah (Lord) himself shall descend from heaven with a shout, with the voice of the archangel, and with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first: Then we which are alive and remain shall be caught up together with them in the clouds, to meet Yahuah (Lord) in the air: and so shall we ever be with Yahuah (Lord)* (1 Thessalonians 4:13,16-17). Read it through the whole library, for it is the ONE great resurrection-ingathering at the last trump — not a secret, pre-tribulation rapture severed from Yashar''el (Israel), and not a separate program for a church that replaced Israel. The *trump of Elohim (God)* is the trumpet of Isaiah: *the great trumpet shall be blown, and they shall come which were ready to perish... and the outcasts... and shall worship Yahuah (LORD) in the holy mount at Jerusalem* (Isaiah 27:13) — the regathering of the scattered outcasts of Yashar''el (Israel). The rising of *the dead in Messiah (Christ)* is the resurrection of the Tanakh: *many of them that sleep in the dust of the earth shall awake* (Daniel 12:2); *Thy dead men shall live... Awake and sing, ye that dwell in dust... and the earth shall cast out the dead* (Isaiah 26:19); and the opened graves of the whole house of Yashar''el (Israel) — *I will open your graves, and cause you to come up out of your graves, and bring you into the land of Yashar''el (Israel)* (Ezekiel 37:12), *I will put my spirit in you, and ye shall live, and I shall place you in your own land* (Ezekiel 37:14). The *caught up together... to meet Yahuah (Lord) in the air* is that opened-grave people brought up and placed with their Elohim (God) — *so shall we ever be with Yahuah (Lord).* And the New Testament names the same trumpet and the same gathering: *at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible, and we shall be changed* (1 Corinthians 15:52), and *a great sound of a trumpet, and they shall gather together his elect from the four winds, from one end of heaven to the other* (Matthew 24:31). One trumpet, one resurrection, one ingathering: the gathered commonwealth of Yashar''el (Israel) and the grafted-in of the nations, the raised dead and the living changed, caught up together to meet the returning King. *Wherefore comfort one another with these words* (1 Thessalonians 4:18).',
       sv.verse_id, ev.verse_id, 'free', 8131
  FROM _s233_t104_lookup sv, _s233_t104_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='1-thessalonians' AND ev.chapter_number=4 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-thessalonians-4-the-earth-gives-back-her-dead-the-day-of-resurrection-2-esdras-7-1-enoch-51',
       E'The earth gives back her dead: the day of resurrection in the Hebrew library (2 Esdras 7, 1 Enoch 51)',
       E'The hope Paul preached — *the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16) — the restored library held before him, beholding the one day the earth and the grave surrender the asleep. The seer of Esdras saw it: *the earth shall restore those that are asleep in her, and so shall the dust those that dwell in silence, and the secret places shall deliver those souls that were committed to them* (2 Esdras 7:32). And Enoch beheld the same: *in those days shall the earth also give back that which has been entrusted to it, And Sheol also shall give back that which it has received, And hell shall give back that which it owes. For in those days the Elect One shall arise* (1 Enoch 51:1). The earth restoring the asleep, Sheol giving back what it received at the arising of the Elect One — this is *Yahuah (Lord) himself shall descend from heaven... and the dead in Messiah (Christ) shall rise first.* The Hebrew witness frames it rightly: this is the one great day of resurrection-ingathering, when the chosen are saved and the earth gives up her dead at the appearing of the King — not a secret snatching severed from the people, but the one day the asleep are raised and gathered to their Elohim (God).',
       sv.verse_id, ev.verse_id, 'extras', 8134
  FROM _s233_t104_lookup sv, _s233_t104_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=13
   AND ev.edition_slug='canon' AND ev.book_slug='1-thessalonians' AND ev.chapter_number=4 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-thessalonians-4-sanctification-abstain-from-fornication-the-holiness-code-leviticus-18-20
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 19:2 — *Ye shall be holy: for I Yahuah Elohaychem (the LORD your God) am holy* the ground of sanctification; *this is the will of Elohim (God), even your sanctification* (1 Thessalonians 4:3).'
  FROM cross_reference_threads t, cross_references x, _s233_t104_lookup sv, _s233_t104_lookup tv
 WHERE t.slug='1-thessalonians-4-sanctification-abstain-from-fornication-the-holiness-code-leviticus-18-20'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=19 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 18:30 — *that ye defile not yourselves therein: I am Yahuah Elohaychem (the LORD your God)* the guard against the abominable customs of the nations; *abstain from fornication... even as the Gentiles which know not Elohim (God)* (1 Thessalonians 4:3,5).'
  FROM cross_reference_threads t, cross_references x, _s233_t104_lookup sv, _s233_t104_lookup tv
 WHERE t.slug='1-thessalonians-4-sanctification-abstain-from-fornication-the-holiness-code-leviticus-18-20'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=18 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 20:26 — *ye shall be holy unto me... and have severed you from other people, that ye should be mine* the severing unto holiness; *Elohim (God) hath not called us unto uncleanness, but unto holiness* (1 Thessalonians 4:7).'
  FROM cross_reference_threads t, cross_references x, _s233_t104_lookup sv, _s233_t104_lookup tv
 WHERE t.slug='1-thessalonians-4-sanctification-abstain-from-fornication-the-holiness-code-leviticus-18-20'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=20 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-thessalonians-4-taught-of-elohim-to-love-the-law-written-on-the-heart-jeremiah-31
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 31:33 — *I will put my law in their inward parts, and write it in their hearts* the new covenant Torah within; *ye yourselves are taught of Elohim (God) to love one another* (1 Thessalonians 4:9).'
  FROM cross_reference_threads t, cross_references x, _s233_t104_lookup sv, _s233_t104_lookup tv
 WHERE t.slug='1-thessalonians-4-taught-of-elohim-to-love-the-law-written-on-the-heart-jeremiah-31'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=31 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-thessalonians-4-the-dead-in-messiah-rise-the-trump-of-gathering-isaiah-27-daniel-12
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 27:13 — *the great trumpet shall be blown, and they shall come which were ready to perish... and the outcasts... and shall worship Yahuah (LORD)* the trump that regathers the scattered; *with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16).'
  FROM cross_reference_threads t, cross_references x, _s233_t104_lookup sv, _s233_t104_lookup tv
 WHERE t.slug='1-thessalonians-4-the-dead-in-messiah-rise-the-trump-of-gathering-isaiah-27-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=27 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:2 — *many of them that sleep in the dust of the earth shall awake* the resurrection of the Tanakh; *them which are asleep... the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:13,16).'
  FROM cross_reference_threads t, cross_references x, _s233_t104_lookup sv, _s233_t104_lookup tv
 WHERE t.slug='1-thessalonians-4-the-dead-in-messiah-rise-the-trump-of-gathering-isaiah-27-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 37:12 — *I will open your graves, and cause you to come up out of your graves, and bring you into the land of Yashar''el (Israel)* the two-house people raised; *the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16).'
  FROM cross_reference_threads t, cross_references x, _s233_t104_lookup sv, _s233_t104_lookup tv
 WHERE t.slug='1-thessalonians-4-the-dead-in-messiah-rise-the-trump-of-gathering-isaiah-27-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ezekiel 37:14 — *I will put my spirit in you, and ye shall live, and I shall place you in your own land* the people brought to dwell with Yahuah (LORD); *and so shall we ever be with Yahuah (Lord)* (1 Thessalonians 4:17).'
  FROM cross_reference_threads t, cross_references x, _s233_t104_lookup sv, _s233_t104_lookup tv
 WHERE t.slug='1-thessalonians-4-the-dead-in-messiah-rise-the-trump-of-gathering-isaiah-27-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=37 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Isaiah 26:19 — *Thy dead men shall live... Awake and sing, ye that dwell in dust... and the earth shall cast out the dead* the song of resurrection; *the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16).'
  FROM cross_reference_threads t, cross_references x, _s233_t104_lookup sv, _s233_t104_lookup tv
 WHERE t.slug='1-thessalonians-4-the-dead-in-messiah-rise-the-trump-of-gathering-isaiah-27-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'1 Corinthians 15:52 — *at the last trump: for the trumpet shall sound, and the dead shall be raised incorruptible* the exact resurrection-trump twin; *with the trump of Elohim (God): and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16).'
  FROM cross_reference_threads t, cross_references x, _s233_t104_lookup sv, _s233_t104_lookup tv
 WHERE t.slug='1-thessalonians-4-the-dead-in-messiah-rise-the-trump-of-gathering-isaiah-27-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=15 AND tv.verse_number=52
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Matthew 24:31 — *a great sound of a trumpet, and they shall gather together his elect from the four winds* the Olivet trumpet-gathering; *caught up together with them in the clouds, to meet Yahuah (Lord) in the air* (1 Thessalonians 4:17).'
  FROM cross_reference_threads t, cross_references x, _s233_t104_lookup sv, _s233_t104_lookup tv
 WHERE t.slug='1-thessalonians-4-the-dead-in-messiah-rise-the-trump-of-gathering-isaiah-27-daniel-12'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-thessalonians-4-the-earth-gives-back-her-dead-the-day-of-resurrection-2-esdras-7-1-enoch-51
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Esdras 7:32 — *the earth shall restore those that are asleep in her... and the secret places shall deliver those souls* the day the earth gives back her dead; *the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16).'
  FROM cross_reference_threads t, cross_references x, _s233_t104_lookup sv, _s233_t104_lookup tv
 WHERE t.slug='1-thessalonians-4-the-earth-gives-back-her-dead-the-day-of-resurrection-2-esdras-7-1-enoch-51'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-esdras' AND tv.chapter_number=7 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Enoch 51:1 — *the earth shall give back that which has been entrusted to it, And Sheol also shall give back that which it has received... the Elect One shall arise* the grave surrenders the asleep at the arising of the Elect One; *Yahuah (Lord) himself shall descend from heaven... and the dead in Messiah (Christ) shall rise first* (1 Thessalonians 4:16).'
  FROM cross_reference_threads t, cross_references x, _s233_t104_lookup sv, _s233_t104_lookup tv
 WHERE t.slug='1-thessalonians-4-the-earth-gives-back-her-dead-the-day-of-resurrection-2-esdras-7-1-enoch-51'
   AND sv.edition_slug='canon' AND sv.book_slug='1-thessalonians' AND sv.chapter_number=4 AND sv.verse_number=16
   AND tv.edition_slug='enoch' AND tv.book_slug='1-enoch' AND tv.chapter_number=51 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
