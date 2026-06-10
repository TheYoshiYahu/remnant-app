-- ----- fragment: minion_romans_15.sql (S219 Romans 15) -----
-- =====================================================================
-- S219 minion — ROMANS 15 FULL-LIBRARY cross-references
-- =====================================================================
-- Chapter: ROMANS 15.  Tag: r15 (temp view _s219_r15_lookup).  Sort band: 6350, step 3 (under 6375).
-- Source is ALWAYS the canon Romans verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- GOVERNING FRAME (Red Lines #7/#11): the watchpoint of this chapter is the four-quote chain of
-- 15:9-12 — the nations rejoicing *with his people* (Deuteronomy 32:43), gathered ALONGSIDE
-- Yashar'el under the Davidic root (Isaiah 11:10), never a new people displacing Israel. 15:8 is
-- the hinge: *Messiah (Christ) was a minister of the circumcision for the truth of Elohim (God),
-- to confirm the promises made unto the fathers* — the whole mission CONFIRMS, does not cancel,
-- the covenant to the patriarchs. The "Gentiles" Paul gathers are the scattered seed and the
-- nations brought to the rebuilt Zion (Tobit 13-14), the ingathering that GLORIFIES Elohim WITH
-- his people. 15:4 — the Tanakh is the church's scripture, still teaching. 15:3=Psalm 69:9 (the
-- reproaches); 15:21=Isaiah 52:15 (the suffering servant's sprinkling of nations); 15:16 the
-- priestly offering up of the gathered.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every verse-block):
--   v.1-2   the strong bear the weak / please the neighbour  Tanakh: none warranted  Extras: none warranted  NT: none warranted (carried into 15:3 thread)
--   v.3     the reproaches fell on me                         Tanakh: Psalm 69:9  Extras: none warranted  NT: John 15:25 (they hated me without a cause)
--   v.4     written aforetime for our learning                Tanakh: Psalm 19:7-8 (the law converting the soul)  Extras: none warranted  NT: none added (the scriptures-still-teaching carried in prose)
--   v.5-7   one mind, one mouth, receive one another          Tanakh: none added (carried at 15:9-12 glorify-together)  Extras: none warranted  NT: none warranted (epistolary exhortation)
--   v.8     minister of the circumcision, confirm the promises Tanakh: none added (the promises themselves are the fathers' covenant)  Extras: none warranted  NT: Matthew 15:24 (lost sheep of the house of Yashar'el), Romans 9:24 (called, not of the Yahudim only)
--   v.9-12  the fourfold chain — nations rejoice WITH his people  Tanakh: Psalm 18:49, Deuteronomy 32:43, Psalm 117:1, Isaiah 11:10  Extras: Tobit 13:11, Tobit 13:13  NT: none added (the chain is the witness)
--   v.12    a root of Jesse who shall reign                    Tanakh: Isaiah 11:1, Isaiah 11:10  Extras: none warranted  NT: Revelation 5:5, Revelation 22:16 (the Root of David)
--   v.13    the Elohim of hope                                 Tanakh: none warranted  Extras: none warranted  NT: none warranted (benediction)
--   v.14-15 persuaded of you / written boldly                  Tanakh: none warranted  Extras: none warranted  NT: none warranted (epistolary)
--   v.16    the offering up of the Gentiles, the priestly ingathering  Tanakh: none added (the ingathering carried by Tobit)  Extras: Tobit 14:5, Tobit 14:6  NT: none added
--   v.17-20 Paul's mission to Illyricum                        Tanakh: none added (Isaiah 52:15 at 15:21)  Extras: none warranted  NT: none warranted
--   v.21    they that have not heard shall understand          Tanakh: Isaiah 52:15  Extras: none warranted  NT: none warranted
--   v.22-33 travel plans, the collection for Jerusalem         Tanakh: none warranted  Extras: none warranted  NT: none warranted (epistolary close; 15:27 carried in the priestly-ingathering thread)
--
-- THREADS (slug -> target libraries):
--   6350 romans-15-the-reproaches-that-reproached-thee-fell-on-me-psalm-69            (Tanakh + NT)
--   6353 romans-15-whatsoever-was-written-aforetime-was-written-for-our-learning      (Tanakh)
--   6356 romans-15-a-minister-of-the-circumcision-to-confirm-the-promises-to-the-fathers (NT)
--   6359 romans-15-rejoice-ye-nations-with-his-people-the-fourfold-chain              (Tanakh + Extras)
--   6362 romans-15-a-root-of-jesse-who-shall-rise-to-reign-the-davidic-root           (Tanakh + NT)
--   6365 romans-15-they-that-have-not-heard-shall-understand-isaiah-52                (Tanakh)
--   6368 romans-15-the-offering-up-of-the-gentiles-the-priestly-ingathering           (Tanakh + Extras)
-- =====================================================================

CREATE TEMP VIEW _s219_r15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: romans-15-the-reproaches-that-reproached-thee-fell-on-me-psalm-69
  ('canon', 'romans', 15, 3, 'canon', 'psalms', 69, 9, 'free', E'*For the zeal of thine house hath eaten me up; and the reproaches of them that reproached thee are fallen upon me.* (Psalm 69:9). *For even Messiah (Christ) pleased not himself; but, as it is written, The reproaches of them that reproached thee fell on me* (Romans 15:3). Paul grounds the call to bear the weak not in a new ethic but in the psalm: the Anointed took upon himself the reproaches aimed at the Father. The strong bear the infirmities of the weak because Messiah, consumed with zeal for the Father''s house, bore the reviling that was the Father''s — he *pleased not himself.* The pattern of self-giving is written aforetime in David''s own cry.'),
  ('canon', 'romans', 15, 3, 'canon', 'john', 15, 25, 'free', E'*But this cometh to pass, that the word might be fulfilled that is written in their law, They hated me without a cause.* (John 15:25). The reproaches Paul cites — *the reproaches of them that reproached thee fell on me* (Romans 15:3) — are the same reproaches the Master named as fulfilled in him: the hatred *without a cause,* written in their law, falling on the one who pleased not himself. What the psalmist foresaw, the Son lived; the reviling owed to the Father landed on the Formed who came in flesh, and he bore it for the sake of the weak he came to gather.'),
  -- thread: romans-15-whatsoever-was-written-aforetime-was-written-for-our-learning
  ('canon', 'romans', 15, 4, 'canon', 'psalms', 19, 7, 'free', E'*The law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple.* (Psalm 19:7). *For whatsoever things were written aforetime were written for our learning, that we through patience and comfort of the scriptures might have hope* (Romans 15:4). The scriptures Paul means are the Tanakh — and the psalmist already named their work: the law of Yahuah is perfect, *converting the soul,* the testimony *making wise the simple.* What was written aforetime is not superseded teaching but the living instruction that converts and gives hope still; the church''s scripture is the very law and prophets that formed Yashar''el (Israel).'),
  ('canon', 'romans', 15, 4, 'canon', 'psalms', 19, 8, 'free', E'*The statutes of Yahuah (LORD) are right, rejoicing the heart: the commandment of Yahuah (LORD) is pure, enlightening the eyes.* (Psalm 19:8). Paul says the things *written aforetime were written for our learning* (Romans 15:4) — and the psalm shows what that learning is: the statutes of Yahuah *rejoicing the heart,* the commandment *enlightening the eyes.* The comfort of the scriptures by which we have hope is not a hope set against the commandments but a hope born of them; the same word that rejoices the heart sustains the patience Paul commends.'),
  -- thread: romans-15-a-minister-of-the-circumcision-to-confirm-the-promises-to-the-fathers
  ('canon', 'romans', 15, 8, 'canon', 'matthew', 15, 24, 'free', E'*But he answered and said, I am not sent but unto the lost sheep of the house of Yashar''el (Israel).* (Matthew 15:24). *Now I say that Yahusha HaMashiach (Jesus Christ) was a minister of the circumcision for the truth of Elohim (God), to confirm the promises made unto the fathers* (Romans 15:8). Paul names what the Master named: his mission was to the circumcision, the lost sheep of the house of Yashar''el — to confirm, not cancel, the covenant promised to Avraham (Abraham), Yitschaq (Isaac), and Ya''aqov (Jacob). The Anointed came as a minister of the circumcision precisely to make good the word spoken to the fathers, gathering the scattered seed home.'),
  ('canon', 'romans', 15, 8, 'canon', 'romans', 9, 24, 'free', E'*Even us, whom he hath called, not of the Yahudim (Jews) only, but also of the Gentiles?* (Romans 9:24). The ministry to *confirm the promises made unto the fathers* (Romans 15:8) reaches *not of the Yahudim (Jews) only, but also of the Gentiles* — the two houses, the remnant of Yahudah (Judah) and the scattered seed living among the nations. The calling of the Gentiles is not the admission of a new people over the fathers'' promises but the confirming of those very promises, as the next words declare: *I will call them my people, which were not my people* (Romans 9:25) — the Lo-Ammi made Ammi, the divorced house gathered.'),
  -- thread: romans-15-rejoice-ye-nations-with-his-people-the-fourfold-chain
  ('canon', 'romans', 15, 9, 'canon', 'psalms', 18, 49, 'free', E'*Therefore will I give thanks unto thee, O Yahuah (LORD), among the heathen, and sing praises unto thy name.* (Psalm 18:49). *And that the Gentiles might glorify Elohim (God) for his mercy; as it is written, For this cause I will confess to thee among the Gentiles, and sing unto thy name* (Romans 15:9). Paul opens his chain with David''s song: the king gives thanks *among the heathen* and sings to the name. The confession is sung out among the nations not because the nations replace Yashar''el (Israel) but because the praise of Yahuah goes forth from his anointed into all the earth — the mercy that gathers reaching the scattered where they dwell.'),
  ('canon', 'romans', 15, 10, 'canon', 'deuteronomy', 32, 43, 'free', E'*Rejoice, O ye nations, with his people: for he will avenge the blood of his servants, and will render vengeance to his adversaries, and will be merciful unto his land, and to his people.* (Deuteronomy 32:43). *And again he saith, Rejoice, ye Gentiles, with his people* (Romans 15:10). The hinge of the whole chain: the nations rejoice *with his people* — alongside Yashar''el (Israel), the two together, never the one displacing the other. Moses'' song closes with the nations gathered beside the covenant people while Yahuah is merciful *unto his land, and to his people.* The Gentiles glorifying Elohim is the ingathering that joins them to his people, not a new people standing in Israel''s place.'),
  ('canon', 'romans', 15, 11, 'canon', 'psalms', 117, 1, 'free', E'*O praise Yahuah (LORD), all ye nations: praise him, all ye people.* (Psalm 117:1). *And again, Praise Yahuah (Lord), all ye Gentiles; and laud him, all ye people* (Romans 15:11). The shortest psalm calls the nations and the people together to one praise — *all ye nations* and *all ye people* in a single summons. The reason follows in the psalm itself: *his merciful kindness is great toward us, and the truth of Yahuah (LORD) endureth for ever* (Psalm 117:2). The nations are called to praise the Elohim of Yashar''el (Israel) for the mercy and truth kept toward his covenant people — joined to that praise, not substituted for its object.'),
  ('canon', 'romans', 15, 12, 'canon', 'isaiah', 11, 10, 'free', E'*And in that day there shall be a root of Jesse, which shall stand for an ensign of the people; to it shall the Gentiles seek: and his rest shall be glorious.* (Isaiah 11:10). *And again, Esaias saith, There shall be a root of Jesse, and he that shall rise to reign over the Gentiles; in him shall the Gentiles trust* (Romans 15:12). Paul seals the chain with the Davidic root: the ensign raised for the people, to whom the nations seek. The same chapter promises Yahuah *shall set his hand again the second time to recover the remnant of his people* and *gather together the dispersed of Yashar''el (Israel)* (Isaiah 11:11-12) — so the root of Jesse over whom the nations trust is the King under whom the dispersed are gathered and the nations come, both together to his glorious rest.'),
  ('canon', 'romans', 15, 9, 'apocrypha', 'tobit', 13, 11, 'extras', E'*Many nations shall come from far to the name of Yahuah (God) with gifts in their hands, even gifts to the King of heaven; all generations shall praise you with great joy.* (Tobit 13:11). The Gentiles glorifying Elohim *for his mercy* (Romans 15:9) is the very scene Tobit foresaw over the rebuilt Zion: *many nations* coming *from far to the name of Yahuah,* all generations praising. The nations come to the name — to the Elohim of Yashar''el (Israel) at his restored city — bringing gifts to the King of heaven; the praise of the nations is gathered TO Zion, not set up apart from her.'),
  ('canon', 'romans', 15, 10, 'apocrypha', 'tobit', 13, 13, 'extras', E'*Rejoice and be glad for the children of the just: for they shall be gathered together, and shall bless Yahuah (God) of the just.* (Tobit 13:13). *Rejoice, ye Gentiles, with his people* (Romans 15:10) sounds the same note Tobit struck: rejoice *for the children of the just, for they shall be gathered together.* The rejoicing of the nations is bound to the gathering of the scattered children — the dispersed seed assembled to bless Yahuah. The joy of the nations and the ingathering of his people are one event, the homecoming the prophets and the library alike foresaw.'),
  -- thread: romans-15-a-root-of-jesse-who-shall-rise-to-reign-the-davidic-root
  ('canon', 'romans', 15, 12, 'canon', 'isaiah', 11, 1, 'free', E'*And there shall come forth a rod out of the stem of Jesse, and a Branch shall grow out of his roots:* (Isaiah 11:1). *There shall be a root of Jesse, and he that shall rise to reign over the Gentiles; in him shall the Gentiles trust* (Romans 15:12). The root Paul names springs from the stem of Jesse — the Branch of David, the Formed come in flesh as the seed of David, upon whom *the Spirit of Yahuah (LORD) shall rest* (Isaiah 11:2). The King who rises to reign is no new dynasty grafted over the covenant but the very rod from Jesse''s stem, the Davidic heir the prophet saw, in whom the gathered place their trust.'),
  ('canon', 'romans', 15, 12, 'canon', 'revelation', 5, 5, 'free', E'*And one of the elders saith unto me, Weep not: behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book, and to loose the seven seals thereof.* (Revelation 5:5). The *root of Jesse* who rises *to reign over the Gentiles* (Romans 15:12) is the same one John sees enthroned: *the Lion of the tribe of Juda, the Root of David,* who alone prevailed. The Davidic root over whom the nations trust is the slain Lamb who has overcome — the reign Paul announces is the reign of the Root of David at the throne, the King under whom the gathered are sealed.'),
  ('canon', 'romans', 15, 12, 'canon', 'revelation', 22, 16, 'free', E'*I Yahusha (Jesus) have sent mine angel to testify unto you these things in the churches. I am the root and the offspring of David, and the bright and morning star.* (Revelation 22:16). Paul''s *root of Jesse* (Romans 15:12) names himself at the close of the canon: *I am the root and the offspring of David.* He is both the root from which David sprang — the Formed who is before David — and the offspring who came in flesh as David''s seed. The King in whom the Gentiles trust is Yahusha (Jesus) himself, the morning star over the gathering, root and offspring at once.'),
  -- thread: romans-15-they-that-have-not-heard-shall-understand-isaiah-52
  ('canon', 'romans', 15, 21, 'canon', 'isaiah', 52, 15, 'free', E'*So shall he sprinkle many nations; the kings shall shut their mouths at him: for that which had not been told them shall they see; and that which they had not heard shall they consider.* (Isaiah 52:15). *But as it is written, To whom he was not spoken of, they shall see: and they that have not heard shall understand* (Romans 15:21). Paul''s reach to where Messiah (Christ) was not yet named is the suffering servant''s own work: he *shall sprinkle many nations,* and those to whom it was not told *shall see.* The marred servant of Isaiah 52-53, exalted after his suffering, draws the unhearing nations to understand — the gospel going to the scattered and the nations alike is the servant''s sprinkling come to pass.'),
  -- thread: romans-15-the-offering-up-of-the-gentiles-the-priestly-ingathering
  ('canon', 'romans', 15, 16, 'apocrypha', 'tobit', 14, 5, 'extras', E'*And that again Yahuah (God) will have mercy on them, and bring them again into the land, where they shall build a temple, but not like to the first, until the time of that age be fulfilled; and afterward they shall return from all places of their captivity, and build up Jerusalem gloriously, and the house of Yahuah (God) shall be built in it for ever with a glorious building, as the prophets have spoken thereof.* (Tobit 14:5). Paul is *the minister of Yahusha HaMashiach (Jesus Christ) to the Gentiles … that the offering up of the Gentiles might be acceptable, being sanctified by the Ruach HaKodesh (Holy Spirit)* (Romans 15:16). Tobit names the frame: Yahuah brings his own *again into the land,* the captives *return from all places of their captivity,* and Jerusalem is built gloriously. Paul''s priestly offering up of the gathered is that ingathering — the scattered returning from the nations, presented holy, the prophets'' word made good.'),
  ('canon', 'romans', 15, 27, 'apocrypha', 'tobit', 14, 6, 'extras', E'*And all nations shall turn, and fear Yahuah (God) truly, and shall bury their idols.* (Tobit 14:6). The Gentiles who *have been made partakers of their spiritual things* and owe a debt *to minister unto them in carnal things* (Romans 15:27) are the nations Tobit saw turning: *all nations shall turn, and fear Yahuah truly, and shall bury their idols.* The collection Paul carries to the poor saints at Jerusalem is the turning made tangible — those gathered from the nations rendering their substance back to the covenant people from whom the spiritual riches came, the idols buried and the debt of love paid.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s219_r15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s219_r15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-15-the-reproaches-that-reproached-thee-fell-on-me-psalm-69',
       E'The reproaches of them that reproached thee fell on me — Psalm 69',
       E'Paul roots the strong bearing the weak not in a new ethic but in the psalm of the suffering righteous one: *We then that are strong ought to bear the infirmities of the weak, and not to please ourselves* (Romans 15:1), *for even Messiah (Christ) pleased not himself; but, as it is written, The reproaches of them that reproached thee fell on me* (Romans 15:3). The line is David''s cry: *for the zeal of thine house hath eaten me up; and the reproaches of them that reproached thee are fallen upon me* (Psalm 69:9). The Anointed, consumed with zeal for the Father''s house, took upon himself the reviling aimed at the Father — he pleased not himself, but bore what was owed to another. And the Master named that same psalm fulfilled in his own rejection: *that the word might be fulfilled that is written in their law, They hated me without a cause* (John 15:25). What David foresaw, the Formed who came in flesh lived; the reproach owed to the Father landed on the Son, and he bore it for the weak he came to gather.',
       sv.verse_id, ev.verse_id, 'free', 6350
  FROM _s219_r15_lookup sv, _s219_r15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=15 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=15 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-15-whatsoever-was-written-aforetime-was-written-for-our-learning',
       E'Whatsoever was written aforetime was written for our learning',
       E'*For whatsoever things were written aforetime were written for our learning, that we through patience and comfort of the scriptures might have hope* (Romans 15:4). The scriptures Paul means are the Tanakh — the law and the prophets — and he declares them not superseded teaching but the living instruction by which the assembly has patience and hope still. The psalmist already named their work: *the law of Yahuah (LORD) is perfect, converting the soul: the testimony of Yahuah (LORD) is sure, making wise the simple* (Psalm 19:7), *the statutes of Yahuah (LORD) are right, rejoicing the heart: the commandment of Yahuah (LORD) is pure, enlightening the eyes* (Psalm 19:8). The comfort of the scriptures that breeds hope is not a hope set against the commandments but a hope born of them — the same word that converts the soul and rejoices the heart sustains the endurance Paul commends. What was written aforetime is the church''s own scripture, still teaching, still converting, still the ground of hope.',
       sv.verse_id, ev.verse_id, 'free', 6353
  FROM _s219_r15_lookup sv, _s219_r15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=15 AND sv.verse_number=4
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=15 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-15-a-minister-of-the-circumcision-to-confirm-the-promises-to-the-fathers',
       E'A minister of the circumcision to confirm the promises made unto the fathers',
       E'The hinge of the chapter, and a governing word for the whole mission: *Now I say that Yahusha HaMashiach (Jesus Christ) was a minister of the circumcision for the truth of Elohim (God), to confirm the promises made unto the fathers* (Romans 15:8). The Anointed came not to cancel the covenant but to CONFIRM it — to make good the word spoken to Avraham (Abraham), Yitschaq (Isaac), and Ya''aqov (Jacob). The Master named his own commission the same way: *I am not sent but unto the lost sheep of the house of Yashar''el (Israel)* (Matthew 15:24) — a minister of the circumcision, gathering the scattered seed. And the reach of that confirming covenant runs to the two houses: *us, whom he hath called, not of the Yahudim (Jews) only, but also of the Gentiles* (Romans 9:24) — the remnant of Yahudah (Judah) and the dispersed living among the nations, the Lo-Ammi made Ammi, *I will call them my people, which were not my people* (Romans 9:25). The calling of the Gentiles is not a new people raised over the fathers'' promises; it is the very confirming of those promises, the divorced house gathered home.',
       sv.verse_id, ev.verse_id, 'free', 6356
  FROM _s219_r15_lookup sv, _s219_r15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=15 AND sv.verse_number=8
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=15 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-15-rejoice-ye-nations-with-his-people-the-fourfold-chain',
       E'Rejoice, ye nations, with his people — the fourfold chain',
       E'Paul binds four Tanakh witnesses into one cord to show the end of his ministry: *that the Gentiles might glorify Elohim (God) for his mercy* (Romans 15:9). And the chain names HOW — not the nations displacing Yashar''el (Israel), but the nations gathered ALONGSIDE his people. First David''s song: *For this cause I will confess to thee among the Gentiles, and sing unto thy name* (Romans 15:9), echoing *I will give thanks unto thee, O Yahuah (LORD), among the heathen, and sing praises unto thy name* (Psalm 18:49) — the praise of Yahuah going forth from his anointed into all the earth. Then the hinge, Moses'' song: *Rejoice, ye Gentiles, with his people* (Romans 15:10) — *Rejoice, O ye nations, with his people: for he will avenge the blood of his servants … and will be merciful unto his land, and to his people* (Deuteronomy 32:43). The nations rejoice WITH his people, the two together, while Yahuah keeps mercy unto his land and his people. Then the shortest psalm: *Praise Yahuah (Lord), all ye Gentiles; and laud him, all ye people* (Romans 15:11) — *O praise Yahuah (LORD), all ye nations: praise him, all ye people* (Psalm 117:1) — nations and people summoned to one praise for the mercy and truth kept toward the covenant. And the seal, Isaiah: *There shall be a root of Jesse … in him shall the Gentiles trust* (Romans 15:12) — the Davidic King under whom *the dispersed of Yashar''el (Israel)* are gathered the second time (Isaiah 11:11-12) and the nations come. The restored library sings the same: *many nations shall come from far to the name of Yahuah (God) … all generations shall praise you with great joy* (Tobit 13:11), and the reason is the homecoming — *rejoice and be glad for the children of the just: for they shall be gathered together, and shall bless Yahuah (God) of the just* (Tobit 13:13). The joy of the nations and the ingathering of his people are one event: the nations glorifying Elohim WITH his people, never in her place.',
       sv.verse_id, ev.verse_id, 'extras', 6359
  FROM _s219_r15_lookup sv, _s219_r15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=15 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=15 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-15-a-root-of-jesse-who-shall-rise-to-reign-the-davidic-root',
       E'A root of Jesse who shall rise to reign — the Davidic root',
       E'*And again, Esaias saith, There shall be a root of Jesse, and he that shall rise to reign over the Gentiles; in him shall the Gentiles trust* (Romans 15:12). The King in whom the gathered place their trust is the Davidic root the prophet saw: *there shall come forth a rod out of the stem of Jesse, and a Branch shall grow out of his roots* (Isaiah 11:1), upon whom *the Spirit of Yahuah (LORD) shall rest* (Isaiah 11:2) — no new dynasty grafted over the covenant, but the very rod from Jesse''s stem, the Formed come in flesh as David''s seed. John sees that root enthroned: *behold, the Lion of the tribe of Juda, the Root of David, hath prevailed to open the book* (Revelation 5:5) — the slain Lamb who alone overcame. And at the close of the canon the King names himself: *I am the root and the offspring of David, and the bright and morning star* (Revelation 22:16) — both the root from which David sprang, the One who is before David, and the offspring who came in flesh as David''s seed. The reign over the nations Paul announces is the reign of Yahusha (Jesus), the Root of David, the morning star over the gathering — root and offspring at once.',
       sv.verse_id, ev.verse_id, 'free', 6362
  FROM _s219_r15_lookup sv, _s219_r15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=15 AND sv.verse_number=12
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=15 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-15-they-that-have-not-heard-shall-understand-isaiah-52',
       E'They that have not heard shall understand — Isaiah 52',
       E'Paul describes his drive to preach where Messiah (Christ) was not yet named — *not where Messiah (Christ) was named, lest I should build upon another man''s foundation* (Romans 15:20) — and grounds it in the suffering servant: *as it is written, To whom he was not spoken of, they shall see: and they that have not heard shall understand* (Romans 15:21). The line is Isaiah''s own: *so shall he sprinkle many nations; the kings shall shut their mouths at him: for that which had not been told them shall they see; and that which they had not heard shall they consider* (Isaiah 52:15). This is the servant whose *visage was so marred more than any man* (Isaiah 52:14), exalted after his suffering, who draws the unhearing nations to see and understand. The gospel reaching the scattered and the nations where it was never told is the servant''s sprinkling come to pass — the marred and exalted One of Isaiah 52-53 gathering those who had not heard.',
       sv.verse_id, ev.verse_id, 'free', 6365
  FROM _s219_r15_lookup sv, _s219_r15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=15 AND sv.verse_number=21
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=15 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'romans-15-the-offering-up-of-the-gentiles-the-priestly-ingathering',
       E'The offering up of the Gentiles — the priestly ingathering',
       E'Paul casts his apostleship in priestly terms: *that I should be the minister of Yahusha HaMashiach (Jesus Christ) to the Gentiles, ministering the gospel of Elohim (God), that the offering up of the Gentiles might be acceptable, being sanctified by the Ruach HaKodesh (Holy Spirit)* (Romans 15:16). The gathered are an offering presented holy — and the restored library names the frame as the ingathering the prophets foretold: *Yahuah (God) will have mercy on them, and bring them again into the land … afterward they shall return from all places of their captivity, and build up Jerusalem gloriously* (Tobit 14:5). The scattered returning from the nations, Jerusalem rebuilt, the house of Yahuah established — that is the harvest Paul offers up. And the nations turn with them: *all nations shall turn, and fear Yahuah (God) truly, and shall bury their idols* (Tobit 14:6). So the collection Paul carries makes the turning tangible: *if the Gentiles have been made partakers of their spiritual things, their duty is also to minister unto them in carnal things* (Romans 15:27) — those gathered from the nations rendering their substance back to the poor saints at Jerusalem, the covenant people from whom the spiritual riches came. The idols buried, the debt of love paid, the offering acceptable.',
       sv.verse_id, ev.verse_id, 'extras', 6368
  FROM _s219_r15_lookup sv, _s219_r15_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=15 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='romans' AND ev.chapter_number=15 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: romans-15-the-reproaches-that-reproached-thee-fell-on-me-psalm-69
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 69:9 — *the reproaches of them that reproached thee are fallen upon me* the Anointed, consumed with zeal for the Father''s house, bore the reviling owed to the Father; he pleased not himself (Romans 15:3).'
  FROM cross_reference_threads t, cross_references x, _s219_r15_lookup sv, _s219_r15_lookup tv
 WHERE t.slug='romans-15-the-reproaches-that-reproached-thee-fell-on-me-psalm-69'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=69 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 15:25 — *they hated me without a cause* the same Psalm 69 fulfilled in the Master''s rejection; the reproach owed to the Father landed on the Son (Romans 15:3).'
  FROM cross_reference_threads t, cross_references x, _s219_r15_lookup sv, _s219_r15_lookup tv
 WHERE t.slug='romans-15-the-reproaches-that-reproached-thee-fell-on-me-psalm-69'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=15 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=15 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-15-whatsoever-was-written-aforetime-was-written-for-our-learning
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 19:7 — *the law of Yahuah (LORD) is perfect, converting the soul* what was written aforetime is the living instruction that converts and gives hope still (Romans 15:4).'
  FROM cross_reference_threads t, cross_references x, _s219_r15_lookup sv, _s219_r15_lookup tv
 WHERE t.slug='romans-15-whatsoever-was-written-aforetime-was-written-for-our-learning'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=15 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 19:8 — *the statutes of Yahuah (LORD) are right, rejoicing the heart* the comfort that breeds hope is born of the commandments, not set against them (Romans 15:4).'
  FROM cross_reference_threads t, cross_references x, _s219_r15_lookup sv, _s219_r15_lookup tv
 WHERE t.slug='romans-15-whatsoever-was-written-aforetime-was-written-for-our-learning'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=15 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=19 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-15-a-minister-of-the-circumcision-to-confirm-the-promises-to-the-fathers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 15:24 — *I am not sent but unto the lost sheep of the house of Yashar''el (Israel)* the Master''s own commission: a minister of the circumcision, gathering the scattered seed (Romans 15:8).'
  FROM cross_reference_threads t, cross_references x, _s219_r15_lookup sv, _s219_r15_lookup tv
 WHERE t.slug='romans-15-a-minister-of-the-circumcision-to-confirm-the-promises-to-the-fathers'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=15 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=15 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 9:24 — *called, not of the Yahudim (Jews) only, but also of the Gentiles* the two houses, the remnant of Yahudah and the dispersed; the confirming reaches both, not a new people over the promises (Romans 15:8).'
  FROM cross_reference_threads t, cross_references x, _s219_r15_lookup sv, _s219_r15_lookup tv
 WHERE t.slug='romans-15-a-minister-of-the-circumcision-to-confirm-the-promises-to-the-fathers'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=15 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=9 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-15-rejoice-ye-nations-with-his-people-the-fourfold-chain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 18:49 — *I will give thanks unto thee, O Yahuah (LORD), among the heathen, and sing praises unto thy name* the king''s praise going forth among the nations, the mercy that gathers reaching the scattered (Romans 15:9).'
  FROM cross_reference_threads t, cross_references x, _s219_r15_lookup sv, _s219_r15_lookup tv
 WHERE t.slug='romans-15-rejoice-ye-nations-with-his-people-the-fourfold-chain'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=15 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=18 AND tv.verse_number=49
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 32:43 — *Rejoice, O ye nations, with his people* the hinge: the nations gathered ALONGSIDE Yashar''el (Israel), the two together, never the one displacing the other (Romans 15:10).'
  FROM cross_reference_threads t, cross_references x, _s219_r15_lookup sv, _s219_r15_lookup tv
 WHERE t.slug='romans-15-rejoice-ye-nations-with-his-people-the-fourfold-chain'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=15 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=43
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 117:1 — *O praise Yahuah (LORD), all ye nations: praise him, all ye people* nations and people summoned to one praise for the mercy and truth kept toward the covenant (Romans 15:11).'
  FROM cross_reference_threads t, cross_references x, _s219_r15_lookup sv, _s219_r15_lookup tv
 WHERE t.slug='romans-15-rejoice-ye-nations-with-his-people-the-fourfold-chain'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=15 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=117 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 11:10 — *a root of Jesse … to it shall the Gentiles seek* the Davidic King under whom the dispersed of Yashar''el (Israel) are gathered the second time and the nations come (Romans 15:12).'
  FROM cross_reference_threads t, cross_references x, _s219_r15_lookup sv, _s219_r15_lookup tv
 WHERE t.slug='romans-15-rejoice-ye-nations-with-his-people-the-fourfold-chain'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=15 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Tobit 13:11 — *many nations shall come from far to the name of Yahuah (God) … all generations shall praise you with great joy* the nations gathered TO Zion at the restored city, not set up apart from her (Romans 15:9).'
  FROM cross_reference_threads t, cross_references x, _s219_r15_lookup sv, _s219_r15_lookup tv
 WHERE t.slug='romans-15-rejoice-ye-nations-with-his-people-the-fourfold-chain'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=15 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=13 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Tobit 13:13 — *rejoice and be glad for the children of the just: for they shall be gathered together* the joy of the nations bound to the ingathering of the scattered children; one event (Romans 15:10).'
  FROM cross_reference_threads t, cross_references x, _s219_r15_lookup sv, _s219_r15_lookup tv
 WHERE t.slug='romans-15-rejoice-ye-nations-with-his-people-the-fourfold-chain'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=15 AND sv.verse_number=10
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=13 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-15-a-root-of-jesse-who-shall-rise-to-reign-the-davidic-root
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 11:1 — *there shall come forth a rod out of the stem of Jesse, and a Branch shall grow out of his roots* the rod from Jesse''s stem, the Formed come in flesh as David''s seed, no new dynasty over the covenant (Romans 15:12).'
  FROM cross_reference_threads t, cross_references x, _s219_r15_lookup sv, _s219_r15_lookup tv
 WHERE t.slug='romans-15-a-root-of-jesse-who-shall-rise-to-reign-the-davidic-root'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=15 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=11 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Revelation 5:5 — *the Lion of the tribe of Juda, the Root of David, hath prevailed* the Davidic root enthroned, the slain Lamb who alone overcame, the reign Paul announces (Romans 15:12).'
  FROM cross_reference_threads t, cross_references x, _s219_r15_lookup sv, _s219_r15_lookup tv
 WHERE t.slug='romans-15-a-root-of-jesse-who-shall-rise-to-reign-the-davidic-root'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=15 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=5 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Revelation 22:16 — *I am the root and the offspring of David, and the bright and morning star* the King names himself: root from which David sprang and offspring come in flesh, Yahusha (Jesus) himself (Romans 15:12).'
  FROM cross_reference_threads t, cross_references x, _s219_r15_lookup sv, _s219_r15_lookup tv
 WHERE t.slug='romans-15-a-root-of-jesse-who-shall-rise-to-reign-the-davidic-root'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=15 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='revelation' AND tv.chapter_number=22 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-15-they-that-have-not-heard-shall-understand-isaiah-52
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 52:15 — *so shall he sprinkle many nations … that which they had not heard shall they consider* the suffering servant drawing the unhearing nations to see; the gospel to the scattered is the servant''s sprinkling (Romans 15:21).'
  FROM cross_reference_threads t, cross_references x, _s219_r15_lookup sv, _s219_r15_lookup tv
 WHERE t.slug='romans-15-they-that-have-not-heard-shall-understand-isaiah-52'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=15 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=52 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: romans-15-the-offering-up-of-the-gentiles-the-priestly-ingathering
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Tobit 14:5 — *bring them again into the land … afterward they shall return from all places of their captivity, and build up Jerusalem gloriously* the ingathering Paul offers up: the scattered returning, Jerusalem rebuilt (Romans 15:16).'
  FROM cross_reference_threads t, cross_references x, _s219_r15_lookup sv, _s219_r15_lookup tv
 WHERE t.slug='romans-15-the-offering-up-of-the-gentiles-the-priestly-ingathering'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=15 AND sv.verse_number=16
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=14 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Tobit 14:6 — *all nations shall turn, and fear Yahuah (God) truly, and shall bury their idols* the turning made tangible in the collection: those gathered from the nations rendering back to the saints at Jerusalem (Romans 15:27).'
  FROM cross_reference_threads t, cross_references x, _s219_r15_lookup sv, _s219_r15_lookup tv
 WHERE t.slug='romans-15-the-offering-up-of-the-gentiles-the-priestly-ingathering'
   AND sv.edition_slug='canon' AND sv.book_slug='romans' AND sv.chapter_number=15 AND sv.verse_number=27
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=14 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
