-- =====================================================================
-- Session 137 — Matt 7 + Matt 8 extras-tier cross-references (paired)
-- =====================================================================
-- Adds Matt 7's and Matt 8's extras-tier rows + threads to the cross-
-- reference corpus. Continues the S131 (Matt 1-2), S132 (Matt 3), S133
-- (Matt 4), S134 (Matt 5), and S135 (Matt 6) extras-tier coverage onto
-- the close of the Sermon on the Mount and the inaugural post-Sermon
-- healing ministry. Single combined migration across the scripture-
-- level library — precedent: S131 combined Matt 1+2.
--
-- Matt 7 reading-target: the chapter closes the Sermon on the Mount.
-- Seven Hebrew-library threads track the chapter's framework moves at
-- the restoration-not-innovation register — the just-judgment with
-- let-go-anger heart-prerequisite (Sirach 27-28), the pearls-before-
-- swine wisdom-not-for-fools architecture (Sirach 22), the ask-seek-
-- knock with the wisdom-stream's seekers-find-wisdom architecture
-- (Wisdom of Solomon 6), the load-bearing Golden Rule restoration in
-- Tobit 4:15, the Two-Ways teaching from 1 Enoch 94, the by-their-
-- fruits diagnostic in Sirach 27, and the wise-and-foolish builders
-- on the heart-stablished foundation of Sirach 22.
--
-- Matt 8 reading-target: the post-Sermon healing ministry — Torah-
-- affirming first-miracle (leper to priest per Lev 14, canon-anchored),
-- centurion's faith with east-and-west scattered-seed gathering, evening
-- healings under the Isaiah 53:4 Messianic-credential, the Son of Adam
-- self-naming at v.20, the storm-stilling, and the Gergesene/Gadarene
-- exorcism in the eastern-tribal-inheritance. Five Hebrew-library
-- threads cover the framework-load-bearing moves: the gather-all-the-
-- tribes-of-Jacob architecture (Sirach 36, 1 Enoch 90), the righteous-
-- one-suffering as the Hebrew-library backdrop to Isaiah 53:4 (Wisdom
-- of Solomon 2), the load-bearing named-title Son of Adam parallel
-- (1 Enoch 46, Red Line #12 named-title-with-no-kaph-comparative
-- carve-out — distinct from Daniel 7:13 / Rev 1:13 / Rev 14:14 cases
-- where the kaph IS preserved), the Father's providence over the sea
-- (Wisdom of Solomon 14), and the spirits-from-the-giants demon-
-- origin / partial-restraint architecture (1 Enoch 15-16 + Jubilees 10).
--
-- Editions used at S137: 1 Enoch (`enoch`), Apocrypha KJV 1611
-- (`apocrypha` — Tobit, Wisdom of Solomon, Ecclesiasticus / Sirach),
-- Jubilees (`jubilees`). The full view filter retains every scripture-
-- level extras edition seeded for V1 for forward compatibility (Jasher,
-- Apocrypha Charles vol 1, Pseudepigrapha Charles vol 2, Adam-Eve
-- Conflict, Apocalypse of Abraham, Sonnini Acts 29, Ascension of
-- Isaiah) — these are not targeted in S137 because the Matt 7-8
-- readings do not surface a framework-bearing connection from those
-- editions at the rigour the migration requires. Historical-witness
-- editions (Josephus, M.R. James's apocryphal NT, Lightfoot's
-- Apostolic Fathers) remain deferred from V1 cross-refs per the
-- historical-witness one-way rule.
--
-- Brief scope notes: the Hillel-and-Tobit Golden-Rule precedence at
-- Matt 7:12 is the load-bearing anchor of T1 — the rule predates the
-- Sermon by centuries; the Christian-supersessionism reading that
-- treats the rule as a Yahusha-invented ethical simplification of an
-- alleged Tanakh complexity collapses against Tobit 4:15. The 1 Enoch
-- 46:1-3 named-title parallel at Matt 8:20 is the load-bearing anchor
-- of T10 — the figure named *that Son of Adam* / *the Son of Adam who
-- hath righteousness* in the Enochic throne-room vision is the same
-- figure Yahusha (Jesus) names himself as in the gospel; the framework
-- carefully distinguishes this from the kaph-comparative cases at
-- Daniel 7:13 / Revelation 1:13 / Revelation 14:14 where the canon
-- preserves the *like the Son of Adam* construction. Red Line #12
-- governs the rendering.
--
-- Twelve new PROPOSED threads at extras-tier:
--   1.  `the-golden-rule-as-restoration-in-tobit`                       (sort 224)
--   2.  `judge-not-and-let-go-anger-in-sirach`                          (sort 225)
--   3.  `pearls-before-swine-and-wisdom-not-for-fools-in-sirach`        (sort 226)
--   4.  `ask-seek-knock-and-wisdom-found-by-seekers-in-wisdom`          (sort 227)
--   5.  `the-two-ways-of-enoch-and-the-narrow-gate`                     (sort 228)
--   6.  `by-their-fruits-and-the-utterance-of-the-heart-in-sirach`      (sort 229)
--   7.  `wise-and-foolish-builders-and-the-heart-stablished-in-sirach`  (sort 230)
--   8.  `gather-all-the-tribes-of-jacob-in-sirach-and-enoch`            (sort 231)
--   9.  `the-righteous-one-suffering-in-wisdom-and-the-servant-credential` (sort 232)
--   10. `the-named-son-of-adam-in-enoch`                                (sort 233)
--   11. `the-fathers-providence-over-the-sea-in-wisdom`                 (sort 234)
--   12. `spirits-from-the-giants-and-demons-partially-restrained`       (sort 235)
--
-- 31 new cross_references rows, all at tier_required='extras'. Every
-- member-note passes the 12 Red Lines and the 12-point editorial
-- checklist.
--
-- Idempotent: ON CONFLICT DO NOTHING on every INSERT.
-- =====================================================================

\echo 'Session 137 — Matt 7 + Matt 8 extras-tier cross-references migration starting...'
BEGIN;

-- Verse-lookup temp view. Same edition filter as S131-S135 — every
-- scripture-level extras edition seeded for V1, plus canon.
CREATE TEMP VIEW _s137_verse_lookup AS
SELECT
    e.slug AS edition_slug,
    b.slug AS book_slug,
    c.chapter_number,
    v.verse_number,
    v.id AS verse_id
  FROM verses v
  JOIN chapters c ON v.chapter_id = c.id
  JOIN books    b ON c.book_id    = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN (
       'canon',
       'enoch',
       'jubilees',
       'jasher',
       'apocrypha',
       'apocrypha-charles-vol1',
       'pseudepigrapha',
       'adam-eve-conflict',
       'apocalypse-of-abraham',
       'ascension-isaiah'
   );

-- ---------------------------------------------------------------------
-- Insert 31 extras-tier cross_references rows.
-- ---------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, note) AS (VALUES

  -- Thread 1: the-golden-rule-as-restoration-in-tobit
  ('canon', 'matthew', 7, 12, 'apocrypha', 'tobit', 4, 15,
   '*Do that to no man which thou hatest: drink not wine to make thee drunken: neither let drunkenness go with thee in thy journey.* Tobit 4:15 carries the Golden Rule in the Hebrew library, articulated in negative form by the angel Raphael''s closing instruction to Tobias — centuries before the Sermon on the Mount. Matt 7:12 walks the same teaching in positive form (*all things whatsoever ye would that men should do to you, do ye even so to them*) and binds it to the Sermon''s whole architecture by *for this is the law and the prophets.* The Christian-supersessionism reading that treats Yahusha (Jesus) as the innovator of a brand-new ethic replacing an allegedly *complicated* Tanakh collapses against Tobit 4:15. The teaching was already in the Hebrew library; the King restores it as the heart-substance of the Torah and the prophets.'),

  -- Thread 2: judge-not-and-let-go-anger-in-sirach
  ('canon', 'matthew', 7, 1, 'apocrypha', 'ecclesiasticus', 27, 30,
   '*Malice and wrath, even these are abominations; and the sinful man shall have them both.* Sirach (Ecclesiasticus) 27:30 names the heart-condition that the just-judgment architecture of Matt 7:1-2 requires to be cleared first. The wisdom-stream identifies malice and wrath as abominations the sinful man carries; the kingdom-citizens judge-not-that-ye-be-not-judged teaching presupposes the same diagnostic — the carrier of malice cannot judge the brother rightly, because the *with what judgment ye judge* standard rebounds on the carrier.'),
  ('canon', 'matthew', 7, 2, 'apocrypha', 'ecclesiasticus', 28, 1,
   '*He that revengeth shall find vengeance from Yahuah (God), and he will surely keep his sins in remembrance.* Sirach (Ecclesiasticus) 28:1 names the measure-for-measure architecture explicitly in the Hebrew library — the revenger receives vengeance from the Most High, and the Father remembers his sins. Matt 7:2''s *with what measure ye mete, it shall be measured to you again* walks the same wisdom-stream architecture at the kingdom-citizens level: the standard the disciple applies to others is the standard the Father applies to the disciple.'),
  ('canon', 'matthew', 7, 5, 'apocrypha', 'ecclesiasticus', 28, 5,
   '*If he that is but flesh nourish hatred, who will intreat for pardon of his sins?* Sirach (Ecclesiasticus) 28:5 names the beam-out-first prerequisite for the brother-mote-removal at Matt 7:5. The hatred-nourishing disciple cannot ask the Father''s pardon for his own sins — and so cannot rightly help the brother with his. The wisdom-stream had already named the heart-clearing prerequisite the gospel formalizes; Matt 7:5 walks the same architecture into the just-judgment grammar.'),

  -- Thread 3: pearls-before-swine-and-wisdom-not-for-fools-in-sirach
  ('canon', 'matthew', 7, 6, 'apocrypha', 'ecclesiasticus', 22, 7,
   '*Whoso teaches a fool is as one that glueth a potsherd together, and as he that waketh one from a sound sleep.* Sirach (Ecclesiasticus) 22:7 names the wisdom-not-for-fools architecture the gospel''s pearls-before-swine teaching walks. The wisdom-stream identifies the futility of teaching the one who cannot receive — the potsherd cannot be glued, the sleeper cannot be roused. Matt 7:6 binds the same architecture as a kingdom-citizens discrimination-of-audience commandment.'),
  ('canon', 'matthew', 7, 6, 'apocrypha', 'ecclesiasticus', 22, 8,
   '*He that telleth a tale to a fool speaks to one in a slumber: when he has told his tale, he will say, What is the matter?* Sirach 22:8 names the don''t-cast-words-on-the-unreceptive architecture in the wisdom-stream''s register. Matt 7:6''s *give not that which is holy unto the dogs, neither cast ye your pearls before swine* walks the same teaching at the holy-vs-dogs / pearls-vs-swine intensification. The Hebrew library had been naming the discernment of audience for centuries; the gospel locks it as a kingdom-citizens commandment.'),

  -- Thread 4: ask-seek-knock-and-wisdom-found-by-seekers-in-wisdom
  ('canon', 'matthew', 7, 7, 'apocrypha', 'the-wisdom-of-solomon', 6, 12,
   '*Wisdom is glorious, and never fadeth away: yes, she is easily seen of them that love her, and found of such as seek her.* Wisdom of Solomon 6:12 names the seekers-find-wisdom architecture explicitly — wisdom is found of such as seek her. Matt 7:7''s *seek, and ye shall find* walks the same wisdom-stream teaching at the kingdom-citizens prayer-confidence level. The Father gives the good gift (Luke 11:13 names the Ruach HaKodesh as the central good-thing) to those who ask, seek, and knock; the wisdom-stream had been naming the same seekers-find principle in the Hebrew library long before.'),
  ('canon', 'matthew', 7, 7, 'apocrypha', 'the-wisdom-of-solomon', 6, 13,
   '*She preventeth them that desire her, in making herself first known to them.* Wisdom 6:13 intensifies the architecture: wisdom RUNS TO meet those who desire her. Matt 7:7''s threefold *ask / seek / knock* with the threefold *given / find / opened* walks the same Father-RUNS-TO-meet architecture at the kingdom-citizens level — the disciple does not have to climb to the Father; the Father covenants to respond to the asker, finder, knocker.'),
  ('canon', 'matthew', 7, 8, 'apocrypha', 'the-wisdom-of-solomon', 6, 16,
   '*For she goes about seeking such as are worthy of her, sheweth herself favourably to them in the ways, and meeteth them in every thought.* Wisdom 6:16 names wisdom''s active pursuit of the seeker — she goes about seeking them, shews herself favourably, meets them in every thought. Matt 7:8''s *for every one that asketh receiveth; and he that seeketh findeth* walks the same architecture: the seeking is reciprocated by the Father''s standing pursuit of the citizen.'),

  -- Thread 5: the-two-ways-of-enoch-and-the-narrow-gate
  ('canon', 'matthew', 7, 13, 'enoch', '1-enoch', 94, 1,
   '*And now I say unto you, my sons, love righteousness and walk therein; For the paths of righteousness are worthy of acceptance, But the paths of unrighteousness shall suddenly be destroyed and vanish.* 1 Enoch 94:1 names the Two-Ways architecture explicitly in the Hebrew library''s apocalyptic register — paths of righteousness vs paths of unrighteousness, the second leading to destruction. Matt 7:13''s wide gate / broad way leading to destruction walks the same architecture; the patriarch Enoch was already teaching the two-ways covenant-decision before the Mosaic Torah''s own formulation at Deuteronomy 30.'),
  ('canon', 'matthew', 7, 14, 'enoch', '1-enoch', 94, 2,
   '*And to certain men of a generation shall the paths of violence and death be revealed, And they shall hold themselves aloof from the paths of righteousness, And they shall not find mercy.* 1 Enoch 94:2 names the few-who-find architecture inversely — the few of a generation see the paths of death and hold themselves aloof from the paths of righteousness. Matt 7:14''s *few there be that find it* walks the same remnant-architecture in positive direction: the few who find the narrow way, while the many enter the wide. The Hebrew library''s wisdom-stream had been naming the asymmetric Two-Ways outcome long before the Sermon.'),

  -- Thread 6: by-their-fruits-and-the-utterance-of-the-heart-in-sirach
  ('canon', 'matthew', 7, 16, 'apocrypha', 'ecclesiasticus', 27, 6,
   '*The fruit declareth if the tree have been dressed; so is the utterance of a conceit in the heart of man.* Sirach (Ecclesiasticus) 27:6 names the fruit-as-utterance-of-the-heart architecture in the Hebrew library''s wisdom-stream — the fruit declares the tree''s condition, and the utterance of the heart declares the man. Matt 7:16-20''s *by their fruits ye shall know them* walks the same architecture at the false-prophet diagnostic level. The wisdom-stream had been teaching the fruit-test for centuries; the gospel binds it as the kingdom-citizens recognition-of-teachers commandment.'),
  ('canon', 'matthew', 7, 20, 'apocrypha', 'ecclesiasticus', 27, 7,
   '*Praise no man before you hear him speak; for this is the trial of men.* Sirach 27:7 names the trial-of-the-man-is-in-his-speaking architecture — the man is tested in what comes out of him. Matt 7:20''s *by their fruits ye shall know them* walks the same diagnostic at the leadership-identification level: the false prophet''s teaching is the fruit by which he is known, and the teaching that voids the Torah identifies the wolf-in-sheep''s-clothing regardless of his supernatural-credential.'),

  -- Thread 7: wise-and-foolish-builders-and-the-heart-stablished-in-sirach
  ('canon', 'matthew', 7, 24, 'apocrypha', 'ecclesiasticus', 22, 16,
   '*As timber girt and bound together in a building cannot be loosed with shaking: so the heart that is stablished by advised counsel shall fear at no time.* Sirach (Ecclesiasticus) 22:16 names the heart-stablished-by-counsel-cannot-be-shaken architecture — the wisdom-stream''s direct parallel to the gospel''s rock-foundation-of-the-wise-builder teaching. Matt 7:24-25''s house-upon-the-rock that does not fall when the rain and floods come walks the same architecture: the hearer-and-doer''s heart-foundation is stablished by the counsel of the King''s sayings, and the building does not fall.'),
  ('canon', 'matthew', 7, 24, 'apocrypha', 'ecclesiasticus', 22, 17,
   '*A heart settled upon a thought of understanding is as a fair plaistering on the wall of a gallery.* Sirach 22:17 names the heart-settled-on-understanding architecture — the foundation of the wise. Matt 7:24''s wise-man-who-heareth-AND-doeth walks the same Hebrew library architecture: the kingdom-citizens hearer-and-doer settles his heart on the King''s sayings (the heart-Torah of the Sermon) and the resulting building stands.'),
  ('canon', 'matthew', 7, 25, 'apocrypha', 'ecclesiasticus', 22, 18,
   '*Pales set on an high place will never stand against the wind: so a fearful heart in the imagination of a fool cannot stand against any fear.* Sirach 22:18 names the inverse: the fool''s heart cannot stand against the wind. Matt 7:25 contrasts the same architecture by inversion at v.27 — the foolish man''s house on the sand falls when the rain descended and the floods came and the winds blew. The Hebrew library named the wind-against-the-foolish architecture; the gospel locks the diagnostic at the hearer-without-the-doing level.'),

  -- Thread 8: gather-all-the-tribes-of-jacob-in-sirach-and-enoch
  ('canon', 'matthew', 8, 11, 'apocrypha', 'ecclesiasticus', 36, 11,
   '*Gather all the tribes of Jacob together, and inherit you them, as from the beginning.* Sirach (Ecclesiasticus) 36:11 names the gathering-of-all-the-tribes architecture explicitly as the wisdom-stream''s prayer-petition to the Most High. Matt 8:11''s *many shall come from the east and west, and shall sit down with Avraham (Abraham), and Yitschaq (Isaac), and Ya''aqov (Jacob), in the kingdom of heaven* walks the gathering-of-the-scattered-seed architecture the Hebrew library had been praying for; the *many from east and west* are the scattered seed of all twelve tribes returning to inherit, NOT the Christian-replacement-of-the-Jews construct.'),
  ('canon', 'matthew', 8, 11, 'apocrypha', 'ecclesiasticus', 36, 12,
   '*O Yahuah (God), have mercy upon the people that is called by your name, and upon Yashar''el (Israel), whom you have named your firstborn.* Sirach 36:12 names the firstborn-people architecture — Yashar''el (Israel) as the people named the Most High''s firstborn. The Hebrew library''s prayer for the gathering rests on the covenant-firstborn standing; Matt 8:11 walks the same architecture at the King''s own naming of the gathering-of-the-patriarchs'' seed.'),
  ('canon', 'matthew', 8, 11, 'enoch', '1-enoch', 90, 18,
   '*And I saw till all the beasts and the birds and the wild animals were gathered, and they all feared the Lord of the sheep, and they began to praise Him.* 1 Enoch 90:18 (within the Animal Apocalypse) names the gathering-at-the-end of all the dispersed back to the Lord of the sheep. The framework reads the Animal Apocalypse''s symbolic shepherding architecture in the gathering-register: the sheep gathered, the beasts and birds gathered, all returned to the Lord. Matt 8:11''s *many from east and west* walks the same Hebrew library gathering-architecture at the King''s own articulation. The vision Enoch saw is what the King is inaugurating.'),

  -- Thread 9: the-righteous-one-suffering-in-wisdom-and-the-servant-credential
  ('canon', 'matthew', 8, 17, 'apocrypha', 'the-wisdom-of-solomon', 2, 12,
   '*Therefore let us lie in wait for the righteous; because he is not for our turn, and he is clean contrary to our doings: he upbraideth us with our offending the law, and objecteth to our infamy the transgressings of our education.* Wisdom of Solomon 2:12 names the righteous-one-as-rebuke-to-the-lawless architecture — the righteous man is hated by the lawless because his existence reproves their Torah-violations. The Hebrew library''s wisdom-stream had been naming the righteous-sufferer architecture as the Isaiah 53 Suffering-Servant prophecy''s wider Hebrew-library backdrop. Matthew''s application of Isaiah 53:4 to the healing-ministry at Matt 8:17 walks the same architecture: the bearer-of-our-infirmities is the righteous-sufferer the wisdom-stream had named.'),
  ('canon', 'matthew', 8, 17, 'apocrypha', 'the-wisdom-of-solomon', 2, 18,
   '*For if the just man be the son of Yahuah (God), he will help him, and deliver him from the hand of his enemies.* Wisdom 2:18 names the just-man-as-son-of-Yahuah architecture in the wisdom-stream''s register — the lawless testing the just man by attempting his destruction, predicated on whether the Father will deliver his Son. Matt 8:17''s Suffering-Servant credential walks the same architecture: the Servant is the just-man who is the Son of Yahuah (God), and the bearing-of-infirmities is operative across his Messianic ministry, not at the cross alone.'),
  ('canon', 'matthew', 8, 17, 'apocrypha', 'the-wisdom-of-solomon', 2, 20,
   '*Let us condemn him with a shameful death: for by his own saying he shall be respected.* Wisdom 2:20 names the lawless plotting the shameful death of the just-man — the Hebrew library''s explicit precursor to the Isaiah 53 Suffering-Servant''s bearing of the despite of the lawless. The healing ministry at Matt 8:16-17 walks the same architecture in its early register: the Servant who will bear the shameful death is currently bearing the infirmities of the people in the towns of Galilee. The Hebrew library''s righteous-sufferer architecture is operative across the whole Messianic mission, not collapsed into a single moment.'),

  -- Thread 10: the-named-son-of-adam-in-enoch
  ('canon', 'matthew', 8, 20, 'enoch', '1-enoch', 46, 1,
   '*And there I saw One who had a head of days, and His head was white like wool, and with Him was another being whose countenance had the appearance of a man, and his face was full of graciousness, like one of the holy angels.* 1 Enoch 46:1 names the throne-room vision in the Hebrew library''s apocalyptic register — the Head of Days and another being with the appearance of a man beside Him. This is the opening of the named-title Messianic-figure passage (1 Enoch 46:1-3) the framework reads as the load-bearing Hebrew-library parallel for Matt 8:20''s *the Son of Adam.* The figure is named as the Christ in heavenly vision before the incarnation.'),
  ('canon', 'matthew', 8, 20, 'enoch', '1-enoch', 46, 2,
   '*And I asked the angel who went with me, who showed me all the hidden things, concerning that Son of Adam, who he was, and whence he was, (and) why he went with the Head of Days?* 1 Enoch 46:2 names the figure directly — *that Son of Adam.* This is title-naming, not kaph-comparative description (distinct from Daniel 7:13''s *kbar enash* / Revelation 1:13 / Revelation 14:14 where the comparative is preserved as *like the Son of Adam*). Matt 8:20 walks the same named-title architecture: Yahusha (Jesus) names himself as *the Son of Adam* with the lineage-weight and the Messianic-title both intact. Red Line #12 governs the rendering — *Son of Adam* capitalized as the title.'),
  ('canon', 'matthew', 8, 20, 'enoch', '1-enoch', 46, 3,
   '*And he answered and said unto me: This is the Son of Adam who hath righteousness, with whom dwelleth righteousness, and who revealeth all the treasures of that which is hidden, because Yahuah (God) of Spirits hath chosen him, and whose lot hath the pre-eminence before Yahuah (God) of Spirits in uprightness for ever.* 1 Enoch 46:3 locks the identification of the figure: *the Son of Adam who hath righteousness ... whose lot hath the pre-eminence before Yahuah (God) of Spirits in uprightness for ever.* This is the Christ — chosen, pre-eminent, the revealer of hidden treasures. The Hebrew library''s named-title parallel for Matt 8:20''s self-designation is locked in this verse. The figure Enoch saw in heavenly vision is the figure Yahusha (Jesus) names himself as in the gospel.'),

  -- Thread 11: the-fathers-providence-over-the-sea-in-wisdom
  ('canon', 'matthew', 8, 26, 'apocrypha', 'the-wisdom-of-solomon', 14, 3,
   '*But your providence, O Father, governeth it: for you have made a way in the sea, and a safe path in the waves.* Wisdom of Solomon 14:3 names the Father''s-providence-governeth-the-sea architecture — the Father has made a way in the sea and a safe path in the waves. Matt 8:26''s King-who-rebukes-the-winds-and-the-sea walks the same architecture in flesh-presence: the Voice that the wisdom-stream named as governing the sea now sleeps in a fishing-boat and then wakes to exercise the governance the wisdom-stream had named.'),
  ('canon', 'matthew', 8, 26, 'apocrypha', 'the-wisdom-of-solomon', 14, 4,
   '*Shewing that you can save from all danger: yes, though a man went to sea without art.* Wisdom 14:4 names the Father''s save-from-all-danger architecture at the sea — even the inexperienced sailor is saved by the Father''s governing providence. Matt 8:25''s *Lord, save us: we perish* walks the same architecture: the disciples in the storm cry to the same Father whose providence the wisdom-stream had named as the sea''s governor; the salvation they receive is the same governance''s direct demonstration.'),

  -- Thread 12: spirits-from-the-giants-and-demons-partially-restrained
  ('canon', 'matthew', 8, 28, 'enoch', '1-enoch', 15, 9,
   '*And the spirits of the giants afflict, oppress, destroy, attack, do battle, and work destruction on the earth, and cause trouble: they take no food, but nevertheless hunger and thirst, and cause offences.* 1 Enoch 15:9 names the spirits-from-the-giants demon-origin architecture in the Hebrew library''s apocalyptic register. The demons of the Matt 8:28 narrative are the spirits that proceeded from the slain bodies of the giants — the offspring of the watchers'' Genesis-6 rebellion. The Hebrew library had been carrying the demon-origin diagnostic for centuries; the gospel''s exorcism-ministry walks the same architecture at the King''s casting-out.'),
  ('canon', 'matthew', 8, 29, 'enoch', '1-enoch', 16, 1,
   '*And from the beginning thus have I been shown concerning you, and written concerning you.* 1 Enoch 16:1 (with the wider 1 Enoch 15-16 architecture) names the appointed-judgment-time the demons themselves know is coming. The Hebrew library had named the eschatological-timeline for the rebellious-spirit-beings: their dominion is temporary; a day of judgment is appointed. Matt 8:29''s *art thou come hither to torment us before the time?* walks the same architecture at the King''s arrival: the demons recognize the King and recognize the appointed time, and they fear premature judgment.'),
  ('canon', 'matthew', 8, 28, 'jubilees', 'jubilees', 10, 1,
   '*And in the third week of this jubilee the unclean demons began to lead astray the children of the sons of Noah; and to make to err and destroy them.* Jubilees 10:1 names the post-flood demon-administration architecture — the unclean demons begin their work on Noah''s seed. The Hebrew library''s book of Jubilees carries the same spirits-from-the-giants identification 1 Enoch 15-16 names. Matt 8:28''s two-possessed-with-devils in the Gergesene territory walks the same architecture: the demons operating in the eastern-tribal-inheritance are the same spirits the Hebrew library had named in their post-flood demon-administration register.'),
  ('canon', 'matthew', 8, 29, 'jubilees', 'jubilees', 10, 8,
   '*And the chief of the spirits, Mastêmâ, came and said: "Yahuah (God), Creator, let some of them remain before me, and let them hearken to my voice, and do all that I shall say to them; for if some of them are not left to me, I shall not be able to execute the power of my will on the sons of men..."* Jubilees 10:8 names the Mastema-partial-restraint architecture: the demons are partially restrained by the Father, with a tenth part left to operate before Satan on the earth until the appointed time. Matt 8:29''s *art thou come hither to torment us before the time?* walks the same architecture: the demons know the partial-restraint they currently operate under, and they fear the King''s arrival as premature consummation of the judgment Jubilees 10 had named as appointed.')

)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, 'extras'::content_tier
  FROM input i
  JOIN _s137_verse_lookup sv ON sv.edition_slug = i.src_edition
                            AND sv.book_slug    = i.src_slug
                            AND sv.chapter_number = i.src_ch
                            AND sv.verse_number  = i.src_v
  JOIN _s137_verse_lookup tv ON tv.edition_slug = i.tgt_edition
                            AND tv.book_slug    = i.tgt_slug
                            AND tv.chapter_number = i.tgt_ch
                            AND tv.verse_number  = i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ---------------------------------------------------------------------
-- Insert 12 new extras-tier threads.
-- ---------------------------------------------------------------------

-- Thread 1 (sort 224): the-golden-rule-as-restoration-in-tobit
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'the-golden-rule-as-restoration-in-tobit',
       'The Golden Rule as restoration — Tobit 4:15 and the Sermon''s close',
       'Matt 7:12''s *all things whatsoever ye would that men should do to you, do ye even so to them: for this is the law and the prophets* — read against the Hebrew library''s explicit prior articulation. Tobit 4:15 carries the Golden Rule in negative form centuries before the Sermon on the Mount: *do that to no man which thou hatest.* The angel Raphael''s closing instruction to Tobias names the same teaching the King restores in positive form at v.12; the Pharisaic-tradition''s most-prominent rabbi Hillel taught the same negative form a generation before Yahusha (Jesus). The teaching is in the Hebrew library, in the wisdom-stream, and in the rabbinic tradition at its best. Yahusha (Jesus) restores it as the heart-substance of the Torah and the prophets, not as a brand-new ethic replacing the *complicated* Torah. The Christian-supersessionism reading that treats the Golden Rule as a gospel-invented simplification of the Tanakh collapses against Tobit 4:15.',
       sv.verse_id, ev.verse_id, 'extras', 224
  FROM _s137_verse_lookup sv, _s137_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 7 AND sv.verse_number = 12
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 7 AND ev.verse_number = 12
ON CONFLICT (slug) DO NOTHING;

-- Thread 2 (sort 225): judge-not-and-let-go-anger-in-sirach
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judge-not-and-let-go-anger-in-sirach',
       'Judge not and let go anger — Sirach 27-28 and the just-judgment architecture',
       'Matt 7:1-5''s just-judgment teaching — *with what judgment ye judge, ye shall be judged: and with what measure ye mete, it shall be measured to you again* — reads against the Hebrew library''s wisdom-stream architecture of the heart-prerequisite for the just judgment. Sirach (Ecclesiasticus) 27:30 names the malice-and-wrath-are-abominations diagnostic: the heart carrying malice cannot judge the brother rightly. Sirach 28:1 names the measure-for-measure architecture explicitly: *he that revengeth shall find vengeance from Yahuah (God).* Sirach 28:5 names the beam-out-first prerequisite: *if he that is but flesh nourish hatred, who will intreat for pardon of his sins?* The wisdom-stream had been naming the heart-clearing prerequisite for the just-judgment for centuries; the Sermon walks the same architecture into the kingdom-citizens grammar at vv.1-5.',
       sv.verse_id, ev.verse_id, 'extras', 225
  FROM _s137_verse_lookup sv, _s137_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 7 AND sv.verse_number = 1
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 7 AND ev.verse_number = 5
ON CONFLICT (slug) DO NOTHING;

-- Thread 3 (sort 226): pearls-before-swine-and-wisdom-not-for-fools-in-sirach
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'pearls-before-swine-and-wisdom-not-for-fools-in-sirach',
       'Pearls before swine and the wisdom not for fools — Sirach 22:7-8',
       'Matt 7:6''s *give not that which is holy unto the dogs, neither cast ye your pearls before swine* walks an architecture the Hebrew library''s wisdom-stream had named at the futility-of-teaching-the-fool level. Sirach (Ecclesiasticus) 22:7 names the don''t-teach-the-fool diagnostic: *whoso teaches a fool is as one that glueth a potsherd together, and as he that waketh one from a sound sleep.* Sirach 22:8 carries the same architecture: *he that telleth a tale to a fool speaks to one in a slumber.* The wisdom-stream identifies the discernment-of-audience as a wisdom-practice; the gospel binds it as a kingdom-citizens commandment with the holy-vs-dogs and pearls-vs-swine intensification. The discernment is intensified, not abolished — directly the framework reading at vv.1-6.',
       sv.verse_id, ev.verse_id, 'extras', 226
  FROM _s137_verse_lookup sv, _s137_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 7 AND sv.verse_number = 6
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 7 AND ev.verse_number = 6
ON CONFLICT (slug) DO NOTHING;

-- Thread 4 (sort 227): ask-seek-knock-and-wisdom-found-by-seekers-in-wisdom
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ask-seek-knock-and-wisdom-found-by-seekers-in-wisdom',
       'Ask, seek, knock — and wisdom found by those who seek (Wisdom of Solomon 6)',
       'Matt 7:7-11''s ask-seek-knock prayer-confidence walks an architecture the Hebrew library''s wisdom-stream had named at the seekers-find-wisdom level. Wisdom of Solomon 6:12 names the architecture directly: *wisdom is glorious, and never fadeth away: yes, she is easily seen of them that love her, and found of such as seek her.* Wisdom 6:13 intensifies: *she preventeth them that desire her, in making herself first known to them.* Wisdom 6:16 carries the Father-RUNS-TO-meet architecture: *she goes about seeking such as are worthy of her, sheweth herself favourably to them in the ways, and meeteth them in every thought.* The wisdom-stream names the Father''s active reciprocation of the seeking; the gospel walks the same architecture at the kingdom-citizens prayer-grammar level, with Luke 11:13 specifying that *the good gift* the Father gives most centrally is the Ruach HaKodesh (Holy Spirit). The wisdom-stream had been naming the architecture; the King articulates it as kingdom-citizens prayer-pattern.',
       sv.verse_id, ev.verse_id, 'extras', 227
  FROM _s137_verse_lookup sv, _s137_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 7 AND sv.verse_number = 7
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 7 AND ev.verse_number = 11
ON CONFLICT (slug) DO NOTHING;

-- Thread 5 (sort 228): the-two-ways-of-enoch-and-the-narrow-gate
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'the-two-ways-of-enoch-and-the-narrow-gate',
       'The Two Ways of Enoch and the narrow gate',
       'Matt 7:13-14''s narrow-gate / wide-gate teaching reads against the Hebrew library''s Two-Ways architecture the Tanakh had been carrying from Mosheh (Moses) at Sinai (Deut 30:15-19) through the Psalter (Psalm 1) and the prophets (Jeremiah 21:8) and into the apocalyptic-stream. 1 Enoch 94:1 names the architecture explicitly in the patriarch Enoch''s wisdom-testimony: *love righteousness and walk therein; for the paths of righteousness are worthy of acceptance, but the paths of unrighteousness shall suddenly be destroyed and vanish.* 1 Enoch 94:2 carries the asymmetric outcome: *to certain men of a generation shall the paths of violence and death be revealed, and they shall hold themselves aloof from the paths of righteousness, and they shall not find mercy.* The wisdom-stream had been naming the asymmetric Two-Ways outcome for centuries before the Sermon. Matt 7:13-14 walks the same architecture at the kingdom-citizens level — wide gate to destruction with many entering, narrow gate to life with few finding — and binds it to the King''s naming of the kingdom-entry-criterion at vv.21-23 and the two-builders'' summary at vv.24-27. The teaching was already in the library; the King restores it.',
       sv.verse_id, ev.verse_id, 'extras', 228
  FROM _s137_verse_lookup sv, _s137_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 7 AND sv.verse_number = 13
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 7 AND ev.verse_number = 14
ON CONFLICT (slug) DO NOTHING;

-- Thread 6 (sort 229): by-their-fruits-and-the-utterance-of-the-heart-in-sirach
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'by-their-fruits-and-the-utterance-of-the-heart-in-sirach',
       'By their fruits — Sirach 27:6-7 and the false-prophet diagnostic',
       'Matt 7:15-20''s false-prophet diagnostic — *by their fruits ye shall know them* — walks an architecture the Hebrew library''s wisdom-stream had named explicitly at the fruit-as-utterance-of-the-heart level. Sirach (Ecclesiasticus) 27:6 names the architecture directly: *the fruit declareth if the tree have been dressed; so is the utterance of a conceit in the heart of man.* Sirach 27:7 names the testing-by-speaking diagnostic: *praise no man before you hear him speak; for this is the trial of men.* The wisdom-stream had been teaching the fruit-test for centuries — the fruit declares the tree, the utterance declares the heart. Matt 7:15-20 binds the same architecture as the kingdom-citizens recognition-of-teachers commandment at the leadership-level, with the Torah-fidelity test of Deuteronomy 13:1-3 as the canon-anchor: the wolf-in-sheep''s-clothing is identified by what his teaching produces (Torah-keeping community = good fruit; Torah-voiding community = bad fruit) regardless of his supernatural-credential. The Hebrew library named the diagnostic; the gospel locks it as the kingdom-citizens master-filter for teachers.',
       sv.verse_id, ev.verse_id, 'extras', 229
  FROM _s137_verse_lookup sv, _s137_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 7 AND sv.verse_number = 15
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 7 AND ev.verse_number = 20
ON CONFLICT (slug) DO NOTHING;

-- Thread 7 (sort 230): wise-and-foolish-builders-and-the-heart-stablished-in-sirach
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wise-and-foolish-builders-and-the-heart-stablished-in-sirach',
       'Wise and foolish builders — Sirach 22:16-18 and the heart stablished',
       'Matt 7:24-27''s wise-and-foolish-builders parable walks an architecture the Hebrew library''s wisdom-stream had named at the heart-stablished-by-counsel level. Sirach (Ecclesiasticus) 22:16 names the direct parallel to the rock-foundation of the wise: *as timber girt and bound together in a building cannot be loosed with shaking: so the heart that is stablished by advised counsel shall fear at no time.* Sirach 22:17 names the heart-settled-on-understanding architecture: *a heart settled upon a thought of understanding is as a fair plaistering on the wall of a gallery.* Sirach 22:18 names the inverse — the foolish heart: *pales set on an high place will never stand against the wind: so a fearful heart in the imagination of a fool cannot stand against any fear.* The wisdom-stream had been naming the foundation-architecture and its inverse for centuries; Matt 7:24-27 walks the same architecture at the kingdom-citizens hearer-and-doer level. The wise hearer-and-doer''s heart is stablished by the King''s sayings; the foolish hearer-without-the-doing''s heart cannot stand against the wind. The doing IS the foundation-establishing act, and the wisdom-stream had named the architecture before.',
       sv.verse_id, ev.verse_id, 'extras', 230
  FROM _s137_verse_lookup sv, _s137_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 7 AND sv.verse_number = 24
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 7 AND ev.verse_number = 27
ON CONFLICT (slug) DO NOTHING;

-- Thread 8 (sort 231): gather-all-the-tribes-of-jacob-in-sirach-and-enoch
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'gather-all-the-tribes-of-jacob-in-sirach-and-enoch',
       'Gather all the tribes of Jacob — Sirach 36 and 1 Enoch 90 and the east-and-west gathering',
       'Matt 8:11''s *many shall come from the east and west, and shall sit down with Avraham (Abraham), and Yitschaq (Isaac), and Ya''aqov (Jacob), in the kingdom of heaven* walks the Tanakh-prophetic-gathering of the scattered seed coming home — anchored canonically at Isaiah 43:5-6, Isaiah 49:12, Psalm 107:2-3, Zechariah 8:7-8 (carried in the long-form). The Hebrew library''s extras-tier witness carries the same architecture in the wisdom-stream and the apocalyptic-stream. Sirach (Ecclesiasticus) 36:11 names the prayer directly: *gather all the tribes of Jacob together, and inherit you them, as from the beginning.* Sirach 36:12 names the firstborn-people standing on which the gathering rests: *Yahuah (God), have mercy upon the people that is called by your name, and upon Yashar''el (Israel), whom you have named your firstborn.* 1 Enoch 90:18 (Animal Apocalypse) names the gathering-at-the-end: *all the beasts and the birds and the wild animals were gathered, and they all feared the Lord of the sheep, and they began to praise Him.* The vision Enoch saw is what the King is inaugurating at Matt 8:11. The *many from east and west* are the scattered seed coming home — NOT the Christian-replacement-of-the-Jews construct. The framework''s posture toward Yahudah (Judah) is unwavering; the *children of the kingdom cast out into outer darkness* at v.12 is the post-harvest sifting of the covenant-claimants-by-lineage-alone, per Ezekiel 20:34-38.',
       sv.verse_id, ev.verse_id, 'extras', 231
  FROM _s137_verse_lookup sv, _s137_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 8 AND sv.verse_number = 11
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 8 AND ev.verse_number = 12
ON CONFLICT (slug) DO NOTHING;

-- Thread 9 (sort 232): the-righteous-one-suffering-in-wisdom-and-the-servant-credential
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'the-righteous-one-suffering-in-wisdom-and-the-servant-credential',
       'The righteous one suffering — Wisdom of Solomon 2 and the Suffering-Servant credential',
       'Matt 8:16-17''s evening healings are sealed with the Isaiah 53:4 quotation — *himself took our infirmities, and bare our sicknesses* — the Suffering-Servant''s bearing operative across the Messianic ministry, not collapsed into the cross alone. The Hebrew library''s wider righteous-one-suffering architecture is named explicitly in Wisdom of Solomon 2. Wisdom 2:12 names the just-man-as-rebuke-to-the-lawless register: *let us lie in wait for the righteous; because he is not for our turn, and he is clean contrary to our doings: he upbraideth us with our offending the law.* Wisdom 2:18 names the just-man-as-son-of-Yahuah architecture: *if the just man be the son of Yahuah (God), he will help him, and deliver him from the hand of his enemies.* Wisdom 2:20 names the shameful-death plot: *let us condemn him with a shameful death.* The wisdom-stream had been naming the righteous-sufferer architecture as the broader Hebrew-library backdrop to Isaiah 53''s Suffering-Servant; Matt 8:17 walks the same architecture in its early healing-ministry register. The Servant who will bear the shameful death is currently bearing the infirmities of the people; the bearing is operative across the whole Messianic mission.',
       sv.verse_id, ev.verse_id, 'extras', 232
  FROM _s137_verse_lookup sv, _s137_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 8 AND sv.verse_number = 17
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 8 AND ev.verse_number = 17
ON CONFLICT (slug) DO NOTHING;

-- Thread 10 (sort 233): the-named-son-of-adam-in-enoch
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'the-named-son-of-adam-in-enoch',
       'The named Son of Adam — 1 Enoch 46 and Matthew 8:20',
       'Matt 8:20''s *the Son of Adam hath not where to lay his head* is named-title Messianic usage — Yahusha (Jesus) names himself as THE seed-of-Adam-line-of-promise. Red Line #12 governs: the title is capitalized (*Son of Adam*); the kaph-comparative is NOT present at v.20 (distinct from Daniel 7:13 / Revelation 1:13 / Revelation 14:14 where the canon preserves the *like the Son of Adam* construction). 1 Enoch 46:1-3 is the load-bearing Hebrew-library named-title parallel. The Enochic throne-room vision names the figure twice: *that Son of Adam* (v.2) and *the Son of Adam who hath righteousness* (v.3). The figure is identified by role — chosen by Yahuah (God) of Spirits, given the pre-eminence in uprightness for ever, the revealer of all hidden treasures, located beside the Head of Days. This is the Christ in heavenly vision before the incarnation. The figure named at 1 Enoch 46 is the figure named at Matt 8:20. The Hebrew library carries the named-title; the gospel restores it in the King''s own self-naming. The Christian commentary that flattens *son of man* to a generic *mortal human* title and then lets it carry weight only by Daniel 7:13''s apparent transcendence-language loses both the lineage-weight that *son of Adam* carries and the named-title parallel that 1 Enoch 46 secures.',
       sv.verse_id, ev.verse_id, 'extras', 233
  FROM _s137_verse_lookup sv, _s137_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 8 AND sv.verse_number = 20
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 8 AND ev.verse_number = 20
ON CONFLICT (slug) DO NOTHING;

-- Thread 11 (sort 234): the-fathers-providence-over-the-sea-in-wisdom
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'the-fathers-providence-over-the-sea-in-wisdom',
       'The Father''s providence over the sea — Wisdom of Solomon 14 and the storm stilled',
       'Matt 8:23-27''s stilling of the storm — *what manner of man is this, that even the winds and the sea obey him?* — walks the Tanakh-pattern of Yahuah''s (God''s) authority over creation (Psalm 89:8-9, Psalm 107:23-29, Job 38:8-11 — carried in the long-form). The Hebrew library''s extras-tier witness names the architecture explicitly in the wisdom-stream. Wisdom of Solomon 14:3 names the Father''s-providence-governeth-the-sea register directly: *but your providence, O Father, governeth it: for you have made a way in the sea, and a safe path in the waves.* Wisdom 14:4 names the save-from-all-danger architecture: *shewing that you can save from all danger: yes, though a man went to sea without art.* The wisdom-stream had been naming the Father''s providential governance over the sea as a kingdom-citizens trust-anchor; Matt 8:23-27 walks the same architecture in flesh-presence — the King who is the Formed (the Son drawn from the Formless) sleeps in the boat and then exercises the governance the wisdom-stream had named, and the disciples'' cry *Lord, save us: we perish* is answered by the same Father''s providence the wisdom-stream had taught them to trust.',
       sv.verse_id, ev.verse_id, 'extras', 234
  FROM _s137_verse_lookup sv, _s137_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 8 AND sv.verse_number = 23
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 8 AND ev.verse_number = 27
ON CONFLICT (slug) DO NOTHING;

-- Thread 12 (sort 235): spirits-from-the-giants-and-demons-partially-restrained
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'spirits-from-the-giants-and-demons-partially-restrained',
       'Spirits from the giants and the demons partially restrained — 1 Enoch 15-16 and Jubilees 10',
       'Matt 8:28-29''s Gergesene/Gadarene exorcism — *what have we to do with thee, Yahusha (Jesus), thou Son of Elohim (God)? art thou come hither to torment us before the time?* — walks the Hebrew library''s demon-origin and partial-restraint architecture. 1 Enoch 15:9 names the spirits-from-the-giants demon-origin: *the spirits of the giants afflict, oppress, destroy, attack, do battle, and work destruction on the earth, and cause trouble.* 1 Enoch 16:1 (with the wider 15-16 architecture) names the appointed-judgment-time the demons themselves know. Jubilees 10:1 names the post-flood demon-administration: *the unclean demons began to lead astray the children of the sons of Noah; and to make to err and destroy them.* Jubilees 10:8 names the Mastema-partial-restraint architecture: *the chief of the spirits, Mastêmâ, came and said: Yahuah (God), Creator, let some of them remain before me ... for if some of them are not left to me, I shall not be able to execute the power of my will on the sons of men.* A tenth part of the demons is left subject before Satan on the earth until the appointed time (Jubilees 10:11). The Hebrew library had named the demon-origin and the partial-restraint and the appointed eschatological-judgment for the rebellious-spirit-beings; the Matt 8:28-29 demoniacs recognize the King precisely because they know the architecture the Hebrew library had named. The *before the time* fear at v.29 is the demons'' acknowledgment of the appointed-judgment-timeline Jubilees 10 and 1 Enoch 15-16 had named.',
       sv.verse_id, ev.verse_id, 'extras', 235
  FROM _s137_verse_lookup sv, _s137_verse_lookup ev
 WHERE sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 8 AND sv.verse_number = 28
   AND ev.edition_slug = 'canon' AND ev.book_slug = 'matthew' AND ev.chapter_number = 8 AND ev.verse_number = 29
ON CONFLICT (slug) DO NOTHING;

-- ---------------------------------------------------------------------
-- Link cross_references to their threads.
-- ---------------------------------------------------------------------

-- Thread 1: the-golden-rule-as-restoration-in-tobit
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Tobit 4:15 — *do that to no man which thou hatest.* The Hebrew library''s explicit Golden Rule in negative form, centuries before the Sermon; Matt 7:12 restores the same teaching in positive form as the heart-substance of *the law and the prophets.*'
  FROM cross_reference_threads t, cross_references x,
       _s137_verse_lookup sv, _s137_verse_lookup tv
 WHERE t.slug = 'the-golden-rule-as-restoration-in-tobit'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 7 AND sv.verse_number = 12
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'tobit' AND tv.chapter_number = 4 AND tv.verse_number = 15
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 2: judge-not-and-let-go-anger-in-sirach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Sirach 27:30 — *malice and wrath, even these are abominations.* The heart-condition Matt 7:1-2''s just-judgment teaching presupposes be cleared first; the wisdom-stream names the diagnostic.'
  FROM cross_reference_threads t, cross_references x,
       _s137_verse_lookup sv, _s137_verse_lookup tv
 WHERE t.slug = 'judge-not-and-let-go-anger-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 7 AND sv.verse_number = 1
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 27 AND tv.verse_number = 30
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Sirach 28:1 — *he that revengeth shall find vengeance from Yahuah (God).* The Hebrew library''s explicit measure-for-measure architecture; Matt 7:2''s *with what measure ye mete* walks the same.'
  FROM cross_reference_threads t, cross_references x,
       _s137_verse_lookup sv, _s137_verse_lookup tv
 WHERE t.slug = 'judge-not-and-let-go-anger-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 7 AND sv.verse_number = 2
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 28 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'Sirach 28:5 — *if he that is but flesh nourish hatred, who will intreat for pardon of his sins?* The beam-out-first prerequisite at the heart-level; Matt 7:5''s self-examination-before-brother-correction walks the same.'
  FROM cross_reference_threads t, cross_references x,
       _s137_verse_lookup sv, _s137_verse_lookup tv
 WHERE t.slug = 'judge-not-and-let-go-anger-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 7 AND sv.verse_number = 5
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 28 AND tv.verse_number = 5
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 3: pearls-before-swine-and-wisdom-not-for-fools-in-sirach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Sirach 22:7 — *whoso teaches a fool is as one that glueth a potsherd together, and as he that waketh one from a sound sleep.* The futility-of-teaching-the-fool architecture; Matt 7:6''s pearls-before-swine walks the same intensified into discrimination-of-audience commandment.'
  FROM cross_reference_threads t, cross_references x,
       _s137_verse_lookup sv, _s137_verse_lookup tv
 WHERE t.slug = 'pearls-before-swine-and-wisdom-not-for-fools-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 7 AND sv.verse_number = 6
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 22 AND tv.verse_number = 7
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Sirach 22:8 — *he that telleth a tale to a fool speaks to one in a slumber.* The Hebrew library''s don''t-cast-words-on-the-unreceptive teaching; Matt 7:6 walks the same architecture as kingdom-citizens discrimination.'
  FROM cross_reference_threads t, cross_references x,
       _s137_verse_lookup sv, _s137_verse_lookup tv
 WHERE t.slug = 'pearls-before-swine-and-wisdom-not-for-fools-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 7 AND sv.verse_number = 6
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 22 AND tv.verse_number = 8
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 4: ask-seek-knock-and-wisdom-found-by-seekers-in-wisdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Wisdom of Solomon 6:12 — *wisdom is glorious ... easily seen of them that love her, and found of such as seek her.* The Hebrew library''s direct seekers-find architecture; Matt 7:7''s *seek, and ye shall find* walks the same.'
  FROM cross_reference_threads t, cross_references x,
       _s137_verse_lookup sv, _s137_verse_lookup tv
 WHERE t.slug = 'ask-seek-knock-and-wisdom-found-by-seekers-in-wisdom'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 7 AND sv.verse_number = 7
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 6 AND tv.verse_number = 12
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Wisdom 6:13 — *she preventeth them that desire her, in making herself first known to them.* The Father-runs-to-meet architecture; Matt 7:7''s threefold ask/seek/knock walks the same reciprocation.'
  FROM cross_reference_threads t, cross_references x,
       _s137_verse_lookup sv, _s137_verse_lookup tv
 WHERE t.slug = 'ask-seek-knock-and-wisdom-found-by-seekers-in-wisdom'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 7 AND sv.verse_number = 7
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 6 AND tv.verse_number = 13
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'Wisdom 6:16 — *she goes about seeking such as are worthy of her, sheweth herself favourably to them in the ways, and meeteth them in every thought.* The Father''s active pursuit of the seeker; Matt 7:8''s *every one that asketh receiveth* walks the same.'
  FROM cross_reference_threads t, cross_references x,
       _s137_verse_lookup sv, _s137_verse_lookup tv
 WHERE t.slug = 'ask-seek-knock-and-wisdom-found-by-seekers-in-wisdom'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 7 AND sv.verse_number = 8
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 6 AND tv.verse_number = 16
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 5: the-two-ways-of-enoch-and-the-narrow-gate
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, '1 Enoch 94:1 — *paths of righteousness ... paths of unrighteousness shall suddenly be destroyed.* The Two-Ways teaching in the patriarch''s wisdom-testimony; Matt 7:13''s wide gate to destruction walks the same.'
  FROM cross_reference_threads t, cross_references x,
       _s137_verse_lookup sv, _s137_verse_lookup tv
 WHERE t.slug = 'the-two-ways-of-enoch-and-the-narrow-gate'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 7 AND sv.verse_number = 13
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 94 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, '1 Enoch 94:2 — *certain men of a generation ... shall not find mercy.* The Hebrew library''s asymmetric few-walk-aright architecture; Matt 7:14''s *few there be that find it* walks the same.'
  FROM cross_reference_threads t, cross_references x,
       _s137_verse_lookup sv, _s137_verse_lookup tv
 WHERE t.slug = 'the-two-ways-of-enoch-and-the-narrow-gate'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 7 AND sv.verse_number = 14
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 94 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 6: by-their-fruits-and-the-utterance-of-the-heart-in-sirach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Sirach 27:6 — *the fruit declareth if the tree have been dressed; so is the utterance of a conceit in the heart of man.* The Hebrew library''s direct fruit-as-utterance-of-the-heart architecture; Matt 7:16''s *by their fruits ye shall know them* walks the same.'
  FROM cross_reference_threads t, cross_references x,
       _s137_verse_lookup sv, _s137_verse_lookup tv
 WHERE t.slug = 'by-their-fruits-and-the-utterance-of-the-heart-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 7 AND sv.verse_number = 16
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 27 AND tv.verse_number = 6
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Sirach 27:7 — *praise no man before you hear him speak; for this is the trial of men.* The Hebrew library''s testing-by-speaking diagnostic; Matt 7:20''s *by their fruits ye shall know them* walks the same at the leadership-level.'
  FROM cross_reference_threads t, cross_references x,
       _s137_verse_lookup sv, _s137_verse_lookup tv
 WHERE t.slug = 'by-their-fruits-and-the-utterance-of-the-heart-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 7 AND sv.verse_number = 20
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 27 AND tv.verse_number = 7
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 7: wise-and-foolish-builders-and-the-heart-stablished-in-sirach
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Sirach 22:16 — *timber girt and bound together in a building cannot be loosed with shaking: so the heart that is stablished by advised counsel shall fear at no time.* The wisdom-stream''s direct foundation-architecture parallel to Matt 7:24-25''s rock-foundation house that does not fall.'
  FROM cross_reference_threads t, cross_references x,
       _s137_verse_lookup sv, _s137_verse_lookup tv
 WHERE t.slug = 'wise-and-foolish-builders-and-the-heart-stablished-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 7 AND sv.verse_number = 24
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 22 AND tv.verse_number = 16
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Sirach 22:17 — *a heart settled upon a thought of understanding is as a fair plaistering on the wall of a gallery.* The settled-heart architecture; Matt 7:24''s hearer-and-doer settles his heart on the King''s sayings.'
  FROM cross_reference_threads t, cross_references x,
       _s137_verse_lookup sv, _s137_verse_lookup tv
 WHERE t.slug = 'wise-and-foolish-builders-and-the-heart-stablished-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 7 AND sv.verse_number = 24
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 22 AND tv.verse_number = 17
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'Sirach 22:18 — *pales set on an high place will never stand against the wind: so a fearful heart in the imagination of a fool cannot stand against any fear.* The inverse architecture; Matt 7:25 (against v.27''s foolish-house fall) walks the same wind-against-the-foolish.'
  FROM cross_reference_threads t, cross_references x,
       _s137_verse_lookup sv, _s137_verse_lookup tv
 WHERE t.slug = 'wise-and-foolish-builders-and-the-heart-stablished-in-sirach'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 7 AND sv.verse_number = 25
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 22 AND tv.verse_number = 18
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 8: gather-all-the-tribes-of-jacob-in-sirach-and-enoch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Sirach 36:11 — *gather all the tribes of Jacob together, and inherit you them, as from the beginning.* The Hebrew library''s explicit gathering-of-all-tribes prayer-petition; Matt 8:11''s *many from east and west* walks the same scattered-seed-coming-home architecture.'
  FROM cross_reference_threads t, cross_references x,
       _s137_verse_lookup sv, _s137_verse_lookup tv
 WHERE t.slug = 'gather-all-the-tribes-of-jacob-in-sirach-and-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 8 AND sv.verse_number = 11
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 36 AND tv.verse_number = 11
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Sirach 36:12 — *Yashar''el (Israel), whom you have named your firstborn.* The covenant-firstborn standing on which the gathering rests; Matt 8:11''s framework-reading preserves the firstborn-people standing while naming the scattered-seed return.'
  FROM cross_reference_threads t, cross_references x,
       _s137_verse_lookup sv, _s137_verse_lookup tv
 WHERE t.slug = 'gather-all-the-tribes-of-jacob-in-sirach-and-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 8 AND sv.verse_number = 11
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'ecclesiasticus' AND tv.chapter_number = 36 AND tv.verse_number = 12
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, '1 Enoch 90:18 — *all the beasts and the birds and the wild animals were gathered, and they all feared the Lord of the sheep, and they began to praise Him.* The Animal Apocalypse''s gathering-at-the-end vision; Matt 8:11 walks the King''s inauguration of the gathering Enoch saw.'
  FROM cross_reference_threads t, cross_references x,
       _s137_verse_lookup sv, _s137_verse_lookup tv
 WHERE t.slug = 'gather-all-the-tribes-of-jacob-in-sirach-and-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 8 AND sv.verse_number = 11
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 90 AND tv.verse_number = 18
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 9: the-righteous-one-suffering-in-wisdom-and-the-servant-credential
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Wisdom of Solomon 2:12 — *let us lie in wait for the righteous ... he upbraideth us with our offending the law.* The Hebrew library''s just-man-as-rebuke-to-the-lawless register; the wider backdrop to Matt 8:17''s Isaiah 53:4 Servant-credential.'
  FROM cross_reference_threads t, cross_references x,
       _s137_verse_lookup sv, _s137_verse_lookup tv
 WHERE t.slug = 'the-righteous-one-suffering-in-wisdom-and-the-servant-credential'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 8 AND sv.verse_number = 17
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 2 AND tv.verse_number = 12
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Wisdom 2:18 — *if the just man be the son of Yahuah (God), he will help him, and deliver him from the hand of his enemies.* The just-man-as-son-of-Yahuah architecture; Matt 8:17''s Servant who bears the people''s infirmities walks the same.'
  FROM cross_reference_threads t, cross_references x,
       _s137_verse_lookup sv, _s137_verse_lookup tv
 WHERE t.slug = 'the-righteous-one-suffering-in-wisdom-and-the-servant-credential'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 8 AND sv.verse_number = 17
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 2 AND tv.verse_number = 18
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'Wisdom 2:20 — *let us condemn him with a shameful death.* The lawless plot against the just-man; the wider Hebrew-library backdrop to Matt 8:17''s Servant-credential operative across the Messianic ministry.'
  FROM cross_reference_threads t, cross_references x,
       _s137_verse_lookup sv, _s137_verse_lookup tv
 WHERE t.slug = 'the-righteous-one-suffering-in-wisdom-and-the-servant-credential'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 8 AND sv.verse_number = 17
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 2 AND tv.verse_number = 20
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 10: the-named-son-of-adam-in-enoch
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, '1 Enoch 46:1 — *I saw One who had a head of days ... and with Him was another being whose countenance had the appearance of a man.* The throne-room vision''s opening; the Head of Days with the Christ-figure beside Him before the incarnation.'
  FROM cross_reference_threads t, cross_references x,
       _s137_verse_lookup sv, _s137_verse_lookup tv
 WHERE t.slug = 'the-named-son-of-adam-in-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 8 AND sv.verse_number = 20
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 46 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, '1 Enoch 46:2 — *concerning that Son of Adam, who he was, and whence he was.* The figure named directly. Title-naming, NOT kaph-comparative (distinct from Dan 7:13 / Rev 1:13 / Rev 14:14); Matt 8:20''s *the Son of Adam* walks the same named-title architecture. Red Line #12.'
  FROM cross_reference_threads t, cross_references x,
       _s137_verse_lookup sv, _s137_verse_lookup tv
 WHERE t.slug = 'the-named-son-of-adam-in-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 8 AND sv.verse_number = 20
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 46 AND tv.verse_number = 2
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, '1 Enoch 46:3 — *the Son of Adam who hath righteousness ... whose lot hath the pre-eminence before Yahuah (God) of Spirits in uprightness for ever.* The Christ identified by role — chosen, pre-eminent, revealer of hidden treasures; Matt 8:20 walks the same identification at the King''s own self-naming.'
  FROM cross_reference_threads t, cross_references x,
       _s137_verse_lookup sv, _s137_verse_lookup tv
 WHERE t.slug = 'the-named-son-of-adam-in-enoch'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 8 AND sv.verse_number = 20
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 46 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 11: the-fathers-providence-over-the-sea-in-wisdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, 'Wisdom of Solomon 14:3 — *your providence, O Father, governeth it: for you have made a way in the sea, and a safe path in the waves.* The Father''s direct sea-governance architecture; Matt 8:26''s rebuke-of-the-winds walks the same in flesh-presence.'
  FROM cross_reference_threads t, cross_references x,
       _s137_verse_lookup sv, _s137_verse_lookup tv
 WHERE t.slug = 'the-fathers-providence-over-the-sea-in-wisdom'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 8 AND sv.verse_number = 26
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 14 AND tv.verse_number = 3
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, 'Wisdom 14:4 — *shewing that you can save from all danger.* The save-from-all-danger architecture; Matt 8:25''s *Lord, save us: we perish* walks the same trust-grammar.'
  FROM cross_reference_threads t, cross_references x,
       _s137_verse_lookup sv, _s137_verse_lookup tv
 WHERE t.slug = 'the-fathers-providence-over-the-sea-in-wisdom'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 8 AND sv.verse_number = 26
   AND tv.edition_slug = 'apocrypha' AND tv.book_slug = 'the-wisdom-of-solomon' AND tv.chapter_number = 14 AND tv.verse_number = 4
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- Thread 12: spirits-from-the-giants-and-demons-partially-restrained
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, '1 Enoch 15:9 — *the spirits of the giants afflict, oppress, destroy, attack, do battle, and work destruction on the earth.* The spirits-from-the-giants demon-origin architecture; Matt 8:28''s demoniacs walk the same.'
  FROM cross_reference_threads t, cross_references x,
       _s137_verse_lookup sv, _s137_verse_lookup tv
 WHERE t.slug = 'spirits-from-the-giants-and-demons-partially-restrained'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 8 AND sv.verse_number = 28
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 15 AND tv.verse_number = 9
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, '1 Enoch 16:1 (with the wider 15-16 architecture) — the appointed-judgment-time named for the rebellious-spirit-beings; Matt 8:29''s *before the time?* fear walks the same eschatological-timeline acknowledgment.'
  FROM cross_reference_threads t, cross_references x,
       _s137_verse_lookup sv, _s137_verse_lookup tv
 WHERE t.slug = 'spirits-from-the-giants-and-demons-partially-restrained'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 8 AND sv.verse_number = 29
   AND tv.edition_slug = 'enoch' AND tv.book_slug = '1-enoch' AND tv.chapter_number = 16 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, 'Jubilees 10:1 — *the unclean demons began to lead astray the children of the sons of Noah.* The post-flood demon-administration; Matt 8:28''s Gergesene demoniacs walk the same architecture in the gospel''s era.'
  FROM cross_reference_threads t, cross_references x,
       _s137_verse_lookup sv, _s137_verse_lookup tv
 WHERE t.slug = 'spirits-from-the-giants-and-demons-partially-restrained'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 8 AND sv.verse_number = 28
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 10 AND tv.verse_number = 1
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, 'Jubilees 10:8 — *let some of them remain before me ... I shall not be able to execute the power of my will on the sons of men.* The Mastema partial-restraint architecture; Matt 8:29''s *before the time?* fear walks the demons'' acknowledgment of the appointed-timeline.'
  FROM cross_reference_threads t, cross_references x,
       _s137_verse_lookup sv, _s137_verse_lookup tv
 WHERE t.slug = 'spirits-from-the-giants-and-demons-partially-restrained'
   AND sv.edition_slug = 'canon' AND sv.book_slug = 'matthew' AND sv.chapter_number = 8 AND sv.verse_number = 29
   AND tv.edition_slug = 'jubilees' AND tv.book_slug = 'jubilees' AND tv.chapter_number = 10 AND tv.verse_number = 8
   AND x.source_verse_id = sv.verse_id AND x.target_verse_id = tv.verse_id AND x.source = 'manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ---------------------------------------------------------------------
-- Diagnostics.
-- ---------------------------------------------------------------------
\echo 'Session 137 — verification counts:'

SELECT 'cross_references rows added (extras-tier, Matt 7-8 source verses):' AS metric,
       count(*) AS value
  FROM cross_references x
  JOIN _s137_verse_lookup sv ON sv.verse_id = x.source_verse_id
 WHERE sv.edition_slug = 'canon'
   AND sv.book_slug = 'matthew'
   AND sv.chapter_number IN (7, 8)
   AND x.tier_required = 'extras'
   AND x.source = 'manual';

SELECT 'cross_reference_threads rows added (sort 224-235):' AS metric,
       count(*) AS value
  FROM cross_reference_threads
 WHERE sort_order BETWEEN 224 AND 235
   AND tier_required = 'extras';

SELECT 'cross_reference_thread_members rows added (threads sort 224-235):' AS metric,
       count(*) AS value
  FROM cross_reference_thread_members m
  JOIN cross_reference_threads t ON t.id = m.thread_id
 WHERE t.sort_order BETWEEN 224 AND 235;

DROP VIEW _s137_verse_lookup;

COMMIT;

\echo 'Session 137 — Matt 7 + Matt 8 extras-tier cross-references migration complete.'
