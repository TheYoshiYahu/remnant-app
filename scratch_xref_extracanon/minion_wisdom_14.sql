-- ----- fragment: minion_thewisdomofsolomon_14.sql (session253 the-wisdom-of-solomon 14) -----
-- Source anchor: apocrypha/the-wisdom-of-solomon ch14. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: wis14 (view _session253_wis14_lookup). Sort band base 58325, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_wis14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: wisdom-of-solomon-14-devising-of-idols-spiritual-fornication
  ('apocrypha', 'the-wisdom-of-solomon', 14, 12, 'canon', 'exodus', 20, 4, 'free', E'Exodus 20:4 — *Thou shalt not make unto thee any graven image, or any likeness of any thing that is in heaven above, or that is in the earth beneath, or that is in the water under the earth:* the second commandment is the law Solomon traces idolatry''s whole corruption back to in Wisdom of Solomon 14:12.'),
  ('apocrypha', 'the-wisdom-of-solomon', 14, 12, 'canon', 'ezekiel', 23, 37, 'free', E'Ezekiel 23:37 — *That they have committed adultery, and blood is in their hands, and with their idols have they committed adultery, and have also caused their sons to pass through the fire, unto them to devour them.* Ezekiel names idolatry the very ''spiritual fornication'' Wisdom of Solomon 14:12 calls its beginning, joined as here to child-sacrifice.'),
  ('apocrypha', 'the-wisdom-of-solomon', 14, 12, 'canon', 'exodus', 20, 3, 'free', E'Exodus 20:3 — *Thou shalt have no other gods before me.* The first word of the covenant is the standard against which Wisdom of Solomon 14:12 measures the devising of idols as fornication.'),
  -- thread: wisdom-of-solomon-14-origin-of-idols-dead-child-king
  ('apocrypha', 'the-wisdom-of-solomon', 14, 15, 'canon', 'jeremiah', 10, 5, 'free', E'Jeremiah 10:5 — *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good.* The dead image honoured as a god in Wisdom of Solomon 14:15 is Jeremiah''s breathless idol that can neither speak nor walk.'),
  ('apocrypha', 'the-wisdom-of-solomon', 14, 16, 'canon', 'jeremiah', 10, 14, 'free', E'Jeremiah 10:14 — *Every man is brutish in his knowledge: every founder is confounded by the graven image: for his molten image is falsehood, and there is no breath in them.* The artisan''s image worshipped by kings'' command in Wisdom of Solomon 14:16 is Jeremiah''s molten falsehood with no breath in it.'),
  ('apocrypha', 'the-wisdom-of-solomon', 14, 16, 'canon', 'daniel', 3, 18, 'free', E'Daniel 3:18 — *But if not, be it known unto thee, O king, that we will not serve thy gods, nor worship the golden image which thou hast set up.* When ''graven images were worshipped by the commandments of kings'' (Wisdom of Solomon 14:16), Daniel''s three refuse the king''s golden image at the cost of the furnace.'),
  ('apocrypha', 'the-wisdom-of-solomon', 14, 17, 'canon', 'habakkuk', 2, 19, 'free', E'Habakkuk 2:19 — *Woe unto him that saith to the wood, Awake; to the dumb stone, Arise, it shall teach! Behold, it is laid over with gold and silver, and there is no breath at all in the midst of it.* The flattering image of the absent king in Wisdom of Solomon 14:17 is Habakkuk''s gilded wood and stone with no breath at all.'),
  -- thread: wisdom-of-solomon-14-artificer-allured-multitude-craftsman
  ('apocrypha', 'the-wisdom-of-solomon', 14, 18, 'canon', 'isaiah', 44, 13, 'free', E'Isaiah 44:13 — *The carpenter stretcheth out his rule; he marketh it out with a line; he fitteth it with planes, and he marketh it out with the compass, and maketh it after the figure of a man, according to the beauty of a man; that it may remain in the house.* Isaiah''s craftsman shaping a beautiful man-figure is the very ''singular diligence of the artificer'' that sets forward superstition in Wisdom of Solomon 14:18.'),
  ('apocrypha', 'the-wisdom-of-solomon', 14, 20, 'canon', 'isaiah', 44, 17, 'free', E'Isaiah 44:17 — *And the residue thereof he maketh a god, even his graven image: he falleth down unto it, and worshippeth it, and prayeth unto it, and saith, Deliver me; for thou art my god.* The multitude ''allured by the grace of the work'' who take the image for a god (Wisdom of Solomon 14:20) is Isaiah''s man bowing to the leftover block and calling it his god.'),
  ('apocrypha', 'the-wisdom-of-solomon', 14, 20, 'canon', 'acts', 19, 25, 'free', E'Acts 19:25 — *Whom he called together with the workmen of like occupation, and said, Sirs, ye know that by this craft we have our wealth.* Demetrius the silversmith rallies the craftsmen of beautiful images, the same artificer''s allure that makes the ignorant multitude idolaters in Wisdom of Solomon 14:20.'),
  -- thread: wisdom-of-solomon-14-romans-1-knowledge-of-god-reprobate-mind
  ('apocrypha', 'the-wisdom-of-solomon', 14, 22, 'canon', 'romans', 1, 28, 'free', E'Romans 1:28 — *And even as they did not like to retain God in their knowledge, God gave them over to a reprobate mind, to do those things which are not convenient;* Paul''s reprobate mind is exactly the company who ''erred in the knowledge of Yahuah (God)'' in Wisdom of Solomon 14:22 — Romans 1 is quoting this idolatry polemic.'),
  ('apocrypha', 'the-wisdom-of-solomon', 14, 25, 'canon', 'romans', 1, 29, 'free', E'Romans 1:29 — *Being filled with all unrighteousness, fornication, wickedness, covetousness, maliciousness; full of envy, murder, debate, deceit, malignity; whisperers,* Paul''s vice-list of murder, deceit and unrighteousness is the same ''blood, manslaughter, theft... perjury'' that reigns after idolatry in Wisdom of Solomon 14:25.'),
  ('apocrypha', 'the-wisdom-of-solomon', 14, 24, 'canon', 'romans', 1, 24, 'free', E'Romans 1:24 — *Wherefore God also gave them up to uncleanness through the lusts of their own hearts, to dishonour their own bodies between themselves:* The defiled lives and marriages of Wisdom of Solomon 14:24 are the uncleanness God gives idolaters up to in Romans 1:24.'),
  ('apocrypha', 'the-wisdom-of-solomon', 14, 26, 'canon', 'romans', 1, 26, 'free', E'Romans 1:26 — *For this cause God gave them up unto vile affections: for even their women did change the natural use into that which is against nature:* The ''changing of kind... disorder in marriages... shameless uncleanness'' of Wisdom of Solomon 14:26 is precisely the vile affections against nature in Romans 1:26.'),
  ('apocrypha', 'the-wisdom-of-solomon', 14, 27, 'apocrypha', 'the-wisdom-of-solomon', 13, 1, 'extras', E'Wisdom of Solomon 13:1 — *Surely vain are all men by nature, who are ignorant of God, and could not out of the good things that are seen know him that is: neither by considering the works did they acknowledge the workmaster;* the thesis that idolatry is ''the beginning, the cause, and the end, of all evil'' (Wisdom of Solomon 14:27) completes the polemic begun in 13:1, the Creator unknown though seen — the very pairing Romans 1:20 and 1:25 draw on.'),
  -- thread: wisdom-of-solomon-14-idols-no-life-false-swearing-vengeance
  ('apocrypha', 'the-wisdom-of-solomon', 14, 29, 'canon', 'psalms', 115, 8, 'free', E'Psalms 115:8 — *They that make them are like unto them; so is every one that trusteth in them.* The lifeless idols in which men trust in Wisdom of Solomon 14:29 are the Psalmist''s dumb images that make their trusters like themselves.'),
  ('apocrypha', 'the-wisdom-of-solomon', 14, 30, 'canon', 'exodus', 20, 7, 'free', E'Exodus 20:7 — *Thou shalt not take the name of the LORD thy God in vain; for the LORD will not hold him guiltless that taketh his name in vain.* The false swearing ''in deceit, despising holiness'' punished in Wisdom of Solomon 14:30 breaks the third commandment, which will not hold the swearer guiltless.'),
  ('apocrypha', 'the-wisdom-of-solomon', 14, 31, 'canon', 'deuteronomy', 32, 35, 'free', E'Deuteronomy 32:35 — *To me belongeth vengeance, and recompence; their foot shall slide in due time: for the day of their calamity is at hand, and the things that shall come upon them make haste.* The ''just vengeance of sinners'' that always punishes the ungodly in Wisdom of Solomon 14:31 is the vengeance God reserves to Himself in the Song of Moses.'),
  ('apocrypha', 'the-wisdom-of-solomon', 14, 31, 'canon', 'romans', 12, 19, 'free', E'Romans 12:19 — *Dearly beloved, avenge not yourselves, but rather give place unto wrath: for it is written, Vengeance is mine; I will repay, saith the Lord.* Paul claims the same ''just vengeance'' that Wisdom of Solomon 14:31 assigns to God against the ungodly, forbidding the believer to take it up himself.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_wis14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_wis14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-14-devising-of-idols-spiritual-fornication',
       E'The devising of idols — the beginning of spiritual fornication',
       E'Solomon names the root: *For the devising of idols was the beginning of spiritual fornication, and the invention of them the corruption of life.* (Wisdom of Solomon 14:12). They are not of the beginning and will not endure — *For neither were they from the beginning, neither shall they be for ever.* (Wisdom of Solomon 14:13). The whole Tanakh sounds the same charge that idolatry is harlotry against the covenant: *And they shall know that I am the LORD, that I have brought this evil upon them. Then I saw, and behold a likeness as the appearance of fire... whoredom and her idols.* The first commandment forbade it — *Thou shalt have no other gods before me.* (Exodus 20:3) — *Thou shalt not make unto thee any graven image* (Exodus 20:4) — and Israel''s apostasy is named adultery — *they have committed adultery, and blood is in their hands, and with their idols have they committed adultery* (Ezekiel 23:37). Paul carries the indictment forward to the reprobate mind: idolatry exchanges the truth of God for a lie. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 58325
  FROM _session253_wis14_lookup sv, _session253_wis14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=14 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-14-origin-of-idols-dead-child-king',
       E'The origin of idols — the grieving father and the king''s image',
       E'Wisdom gives the genealogy of the idol: grief and flattery, not revelation. *For a father afflicted with untimely mourning, when he has made an image of his child soon taken away, now honoured him as a god, which was then a dead man, and delivered to those that were under him ceremonies and sacrifices.* (Wisdom of Solomon 14:15). *Thus in process of time an ungodly custom grown strong was kept as a law, and graven images were worshipped by the commandments of kings.* (Wisdom of Solomon 14:16). The prophets had already exposed the manufacture: the idol is shaped wood that cannot speak or move — *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good.* (Jeremiah 10:5) — and the workman who makes it is shamed — *Every man is brutish in his knowledge: every founder is confounded by the graven image: for his molten image is falsehood, and there is no breath in them.* (Jeremiah 10:14). Habakkuk mocks the same dumb thing — *Woe unto him that saith to the wood, Awake; to the dumb stone, Arise, it shall teach! Behold, it is laid over with gold and silver, and there is no breath at all in the midst of it.* (Habakkuk 2:19). Daniel''s three would not bow to Nebuchadnezzar''s golden image kept ''as a law'' by a king''s command — *we will not serve thy gods, nor worship the golden image which thou hast set up.* (Daniel 3:18).',
       sv.verse_id, ev.verse_id, 'extras', 58328
  FROM _session253_wis14_lookup sv, _session253_wis14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=14 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-14-artificer-allured-multitude-craftsman',
       E'The artificer''s skill — beauty that allures the multitude to a god',
       E'The idol''s power is aesthetic seduction: the craftsman''s skill makes the lie beautiful. *Also the singular diligence of the artificer did help to set forward the ignorant to more superstition.* (Wisdom of Solomon 14:18). *And so the multitude, allured by the grace of the work, took him now for a god, which a little before was but honoured.* (Wisdom of Solomon 14:20). Isaiah dissects the same workshop — the smith and carpenter labour over a block, burn half for warmth and bow to the rest — *The carpenter stretcheth out his rule; he marketh it out with a line; he fitteth it with planes, and he marketh it out with the compass, and maketh it after the figure of a man, according to the beauty of a man; that it may remain in the house.* (Isaiah 44:13) — *And the residue thereof he maketh a god, even his graven image: he falleth down unto it, and worshippeth it, and prayeth unto it, and saith, Deliver me; for thou art my god.* (Isaiah 44:17). In the New Testament the Ephesian silversmiths riot precisely because the craft of beautiful images is their livelihood — *Sirs, ye know that by this craft we have our wealth.* (Acts 19:25). The grace of the work, not the truth of God, allures the crowd.',
       sv.verse_id, ev.verse_id, 'extras', 58331
  FROM _session253_wis14_lookup sv, _session253_wis14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=14 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-14-romans-1-knowledge-of-god-reprobate-mind',
       E'Idolatry the headwaters — Romans 1 quotes this catalogue',
       E'Here Wisdom of Solomon supplies the very vice-list and verdict Paul fires into Romans 1. *Moreover this was not enough for them, that they erred in the knowledge of Yahuah (God); but whereas they lived in the great war of ignorance, those so great plagues called they peace.* (Wisdom of Solomon 14:22). The collapse follows the idol: *So that there reigned in all men without exception blood, manslaughter, theft, and dissimulation, corruption, unfaithfulness, tumults, perjury,* (Wisdom of Solomon 14:25) and *Disquieting of good men, forgetfulness of good turns, defiling of souls, changing of kind, disorder in marriages, adultery, and shameless uncleanness.* (Wisdom of Solomon 14:26). And the thesis: *For the worshipping of idols not to be named is the beginning, the cause, and the end, of all evil.* (Wisdom of Solomon 14:27). Paul echoes it almost line for line — God gives the idolaters over: *Wherefore God also gave them up to uncleanness through the lusts of their own hearts, to dishonour their own bodies between themselves:* (Romans 1:24) — *For this cause God gave them up unto vile affections* (Romans 1:26) — *And even as they did not like to retain God in their knowledge, God gave them over to a reprobate mind, to do those things which are not convenient;* (Romans 1:28) — *Being filled with all unrighteousness, fornication, wickedness, covetousness, maliciousness; full of envy, murder, debate, deceit, malignity; whisperers,* (Romans 1:29). Paul''s catalogue is Wisdom''s catalogue; idolatry is the headwaters of all evil. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 58334
  FROM _session253_wis14_lookup sv, _session253_wis14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=22
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=14 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'wisdom-of-solomon-14-idols-no-life-false-swearing-vengeance',
       E'Idols that have no life — false oaths and the just vengeance',
       E'The chapter closes on the impotence of the idol and the certainty of judgment. *For insomuch as their trust is in idols, which have no life; though they swear falsely, yet they look not to be hurt.* (Wisdom of Solomon 14:29). Yet the verdict stands: *both because they thought not well of Yahuah (God), giving heed to idols, and also unjustly swore in deceit, despising holiness* (Wisdom of Solomon 14:30), *For it is not the power of them by whom they swear: but it is the just vengeance of sinners, that punishes always the offence of the ungodly.* (Wisdom of Solomon 14:31). The Psalmist already declared the idols lifeless and their makers like them — *They have mouths, but they speak not: eyes have they, but they see not; ... They that make them are like unto them; so is every one that trusteth in them.* (Psalm 115:5,8). The law forbade the false oath that despises holiness — *Thou shalt not take the name of the LORD thy God in vain; for the LORD will not hold him guiltless that taketh his name in vain.* (Exodus 20:7). And the ''just vengeance'' belongs to God alone — *To me belongeth vengeance, and recompence; their foot shall slide in due time:* (Deuteronomy 32:35), which Paul claims for the same Judge — *for it is written, Vengeance is mine; I will repay, saith the Lord.* (Romans 12:19).',
       sv.verse_id, ev.verse_id, 'extras', 58337
  FROM _session253_wis14_lookup sv, _session253_wis14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=29
   AND ev.edition_slug='apocrypha' AND ev.book_slug='the-wisdom-of-solomon' AND ev.chapter_number=14 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: wisdom-of-solomon-14-devising-of-idols-spiritual-fornication
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 20:4 — *Thou shalt not make unto thee any graven image, or any likeness of any thing that is in heaven above, or that is in the earth beneath, or that is in the water under the earth:* the second commandment is the law Solomon traces idolatry''s whole corruption back to in Wisdom of Solomon 14:12.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-devising-of-idols-spiritual-fornication'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 23:37 — *That they have committed adultery, and blood is in their hands, and with their idols have they committed adultery, and have also caused their sons to pass through the fire, unto them to devour them.* Ezekiel names idolatry the very ''spiritual fornication'' Wisdom of Solomon 14:12 calls its beginning, joined as here to child-sacrifice.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-devising-of-idols-spiritual-fornication'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=23 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 20:3 — *Thou shalt have no other gods before me.* The first word of the covenant is the standard against which Wisdom of Solomon 14:12 measures the devising of idols as fornication.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-devising-of-idols-spiritual-fornication'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-14-origin-of-idols-dead-child-king
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 10:5 — *They are upright as the palm tree, but speak not: they must needs be borne, because they cannot go. Be not afraid of them; for they cannot do evil, neither also is it in them to do good.* The dead image honoured as a god in Wisdom of Solomon 14:15 is Jeremiah''s breathless idol that can neither speak nor walk.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-origin-of-idols-dead-child-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 10:14 — *Every man is brutish in his knowledge: every founder is confounded by the graven image: for his molten image is falsehood, and there is no breath in them.* The artisan''s image worshipped by kings'' command in Wisdom of Solomon 14:16 is Jeremiah''s molten falsehood with no breath in it.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-origin-of-idols-dead-child-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=10 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 3:18 — *But if not, be it known unto thee, O king, that we will not serve thy gods, nor worship the golden image which thou hast set up.* When ''graven images were worshipped by the commandments of kings'' (Wisdom of Solomon 14:16), Daniel''s three refuse the king''s golden image at the cost of the furnace.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-origin-of-idols-dead-child-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Habakkuk 2:19 — *Woe unto him that saith to the wood, Awake; to the dumb stone, Arise, it shall teach! Behold, it is laid over with gold and silver, and there is no breath at all in the midst of it.* The flattering image of the absent king in Wisdom of Solomon 14:17 is Habakkuk''s gilded wood and stone with no breath at all.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-origin-of-idols-dead-child-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='habakkuk' AND tv.chapter_number=2 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-14-artificer-allured-multitude-craftsman
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 44:13 — *The carpenter stretcheth out his rule; he marketh it out with a line; he fitteth it with planes, and he marketh it out with the compass, and maketh it after the figure of a man, according to the beauty of a man; that it may remain in the house.* Isaiah''s craftsman shaping a beautiful man-figure is the very ''singular diligence of the artificer'' that sets forward superstition in Wisdom of Solomon 14:18.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-artificer-allured-multitude-craftsman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 44:17 — *And the residue thereof he maketh a god, even his graven image: he falleth down unto it, and worshippeth it, and prayeth unto it, and saith, Deliver me; for thou art my god.* The multitude ''allured by the grace of the work'' who take the image for a god (Wisdom of Solomon 14:20) is Isaiah''s man bowing to the leftover block and calling it his god.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-artificer-allured-multitude-craftsman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 19:25 — *Whom he called together with the workmen of like occupation, and said, Sirs, ye know that by this craft we have our wealth.* Demetrius the silversmith rallies the craftsmen of beautiful images, the same artificer''s allure that makes the ignorant multitude idolaters in Wisdom of Solomon 14:20.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-artificer-allured-multitude-craftsman'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=19 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-14-romans-1-knowledge-of-god-reprobate-mind
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Romans 1:28 — *And even as they did not like to retain God in their knowledge, God gave them over to a reprobate mind, to do those things which are not convenient;* Paul''s reprobate mind is exactly the company who ''erred in the knowledge of Yahuah (God)'' in Wisdom of Solomon 14:22 — Romans 1 is quoting this idolatry polemic.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-romans-1-knowledge-of-god-reprobate-mind'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Romans 1:29 — *Being filled with all unrighteousness, fornication, wickedness, covetousness, maliciousness; full of envy, murder, debate, deceit, malignity; whisperers,* Paul''s vice-list of murder, deceit and unrighteousness is the same ''blood, manslaughter, theft... perjury'' that reigns after idolatry in Wisdom of Solomon 14:25.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-romans-1-knowledge-of-god-reprobate-mind'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Romans 1:24 — *Wherefore God also gave them up to uncleanness through the lusts of their own hearts, to dishonour their own bodies between themselves:* The defiled lives and marriages of Wisdom of Solomon 14:24 are the uncleanness God gives idolaters up to in Romans 1:24.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-romans-1-knowledge-of-god-reprobate-mind'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 1:26 — *For this cause God gave them up unto vile affections: for even their women did change the natural use into that which is against nature:* The ''changing of kind... disorder in marriages... shameless uncleanness'' of Wisdom of Solomon 14:26 is precisely the vile affections against nature in Romans 1:26.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-romans-1-knowledge-of-god-reprobate-mind'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=1 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Wisdom of Solomon 13:1 — *Surely vain are all men by nature, who are ignorant of God, and could not out of the good things that are seen know him that is: neither by considering the works did they acknowledge the workmaster;* the thesis that idolatry is ''the beginning, the cause, and the end, of all evil'' (Wisdom of Solomon 14:27) completes the polemic begun in 13:1, the Creator unknown though seen — the very pairing Romans 1:20 and 1:25 draw on.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-romans-1-knowledge-of-god-reprobate-mind'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=27
   AND tv.edition_slug='apocrypha' AND tv.book_slug='the-wisdom-of-solomon' AND tv.chapter_number=13 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: wisdom-of-solomon-14-idols-no-life-false-swearing-vengeance
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalms 115:8 — *They that make them are like unto them; so is every one that trusteth in them.* The lifeless idols in which men trust in Wisdom of Solomon 14:29 are the Psalmist''s dumb images that make their trusters like themselves.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-idols-no-life-false-swearing-vengeance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=115 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 20:7 — *Thou shalt not take the name of the LORD thy God in vain; for the LORD will not hold him guiltless that taketh his name in vain.* The false swearing ''in deceit, despising holiness'' punished in Wisdom of Solomon 14:30 breaks the third commandment, which will not hold the swearer guiltless.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-idols-no-life-false-swearing-vengeance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=20 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 32:35 — *To me belongeth vengeance, and recompence; their foot shall slide in due time: for the day of their calamity is at hand, and the things that shall come upon them make haste.* The ''just vengeance of sinners'' that always punishes the ungodly in Wisdom of Solomon 14:31 is the vengeance God reserves to Himself in the Song of Moses.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-idols-no-life-false-swearing-vengeance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=32 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Romans 12:19 — *Dearly beloved, avenge not yourselves, but rather give place unto wrath: for it is written, Vengeance is mine; I will repay, saith the Lord.* Paul claims the same ''just vengeance'' that Wisdom of Solomon 14:31 assigns to God against the ungodly, forbidding the believer to take it up himself.'
  FROM cross_reference_threads t, cross_references x, _session253_wis14_lookup sv, _session253_wis14_lookup tv
 WHERE t.slug='wisdom-of-solomon-14-idols-no-life-false-swearing-vengeance'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='the-wisdom-of-solomon' AND sv.chapter_number=14 AND sv.verse_number=31
   AND tv.edition_slug='canon' AND tv.book_slug='romans' AND tv.chapter_number=12 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

