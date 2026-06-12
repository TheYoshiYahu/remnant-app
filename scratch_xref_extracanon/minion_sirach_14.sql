-- ----- fragment: minion_ecclesiasticus_14.sql (session253 ecclesiasticus 14) -----
-- Source anchor: apocrypha/ecclesiasticus ch14. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: sir14 (view _session253_sir14_lookup). Sort band base 58625, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_sir14_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: ecclesiasticus-14-blessed-the-guarded-mouth
  ('apocrypha', 'ecclesiasticus', 14, 1, 'canon', 'proverbs', 13, 3, 'free', E'Proverbs 13:3 — *He that keepeth his mouth keepeth his life: but he that openeth wide his lips shall have destruction.* The same wisdom Ben Sira blesses in Sirach 14:1, the guarded mouth that does not slip into the multitude of sins.'),
  ('apocrypha', 'ecclesiasticus', 14, 1, 'canon', 'james', 3, 2, 'free', E'James 3:2 — *For in many things we offend all. If any man offend not in word, the same is a perfect man, and able also to bridle the whole body.* James, Sirach''s nearest NT kin, makes the un-slipped tongue of Sirach 14:1 the mark of the perfect man.'),
  ('apocrypha', 'ecclesiasticus', 14, 2, 'canon', 'psalms', 1, 1, 'free', E'Psalm 1:1 — *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful.* The Psalter''s opening beatitude on the man of clear conscience answers Ben Sira''s blessing in Sirach 14:2.'),
  -- thread: ecclesiasticus-14-the-covetous-eye-riches-in-vain
  ('apocrypha', 'ecclesiasticus', 14, 3, 'canon', 'ecclesiastes', 5, 10, 'free', E'Ecclesiastes 5:10 — *He that loveth silver shall not be satisfied with silver; nor he that loveth abundance with increase: this is also vanity.* Qoheleth names the same unsatisfied covetous eye Ben Sira condemns in Sirach 14:3,9.'),
  ('apocrypha', 'ecclesiasticus', 14, 4, 'canon', 'luke', 12, 19, 'free', E'Luke 12:19 — *And I will say to my soul, Soul, thou hast much goods laid up for many years; take thine ease, eat, drink, and be merry.* The rich fool gathers for others to spend, exactly the self-defrauding hoarder of Sirach 14:4.'),
  ('apocrypha', 'ecclesiasticus', 14, 4, 'canon', 'luke', 12, 20, 'free', E'Luke 12:20 — *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* The wealth gathered by defrauding the soul (Sirach 14:4) passes to another the very night the hoarder dies.'),
  ('apocrypha', 'ecclesiasticus', 14, 9, 'canon', 'psalms', 49, 6, 'free', E'Psalm 49:6 — *They that trust in their wealth, and boast themselves in the multitude of their riches;* the never-satisfied covetous eye of Sirach 14:9 is the soul that trusts in wealth that cannot redeem it.'),
  ('apocrypha', 'ecclesiasticus', 14, 4, 'canon', 'proverbs', 11, 24, 'free', E'Proverbs 11:24 — *There is that scattereth, and yet increaseth; and there is that withholdeth more than is meet, but it tendeth to poverty.* The generous opposite of the niggard who gathers only for others in Sirach 14:4.'),
  -- thread: ecclesiasticus-14-use-thy-good-things-no-dainties-in-the-grave
  ('apocrypha', 'ecclesiasticus', 14, 16, 'canon', 'ecclesiastes', 5, 15, 'free', E'Ecclesiastes 5:15 — *As he came forth of his mother''s womb, naked shall he return to go as he came, and shall take nothing of his labour, which he may carry away in his hand.* Because nothing follows into the grave, Sirach 14:16 urges giving and sanctifying the soul now.'),
  ('apocrypha', 'ecclesiasticus', 14, 16, 'canon', '1-timothy', 6, 7, 'free', E'1 Timothy 6:7 — *For we brought nothing into this world, and it is certain we can carry nothing out.* Paul states the very ground of Sirach 14:16 — there is no seeking of dainties in the grave.'),
  ('apocrypha', 'ecclesiasticus', 14, 11, 'canon', 'job', 1, 21, 'free', E'Job 1:21 — *And said, Naked came I out of my mother''s womb, and naked shall I return thither: Yahuah (LORD) gave, and Yahuah (LORD) hath taken away; blessed be the name of Yahuah (LORD).* Job''s surrender frames the do-good-to-thyself-and-give-Yahuah-his-due of Sirach 14:11.'),
  ('apocrypha', 'ecclesiasticus', 14, 13, 'canon', 'proverbs', 11, 25, 'free', E'Proverbs 11:25 — *The liberal soul shall be made fat: and he that watereth shall be watered also himself.* The blessing on the outstretched hand of Sirach 14:13.'),
  ('apocrypha', 'ecclesiasticus', 14, 13, 'canon', 'matthew', 6, 20, 'free', E'Matthew 6:20 — *But lay up for yourselves treasures in heaven, where neither moth nor rust doth corrupt, and where thieves do not break through nor steal:* the Sermon turns Sirach 14:13''s almsgiving-before-death into treasure stored past the grave.'),
  -- thread: ecclesiasticus-14-all-flesh-waxeth-old-as-a-garment
  ('apocrypha', 'ecclesiasticus', 14, 17, 'canon', 'genesis', 3, 19, 'free', E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* This is the covenant from the beginning Ben Sira cites in Sirach 14:17 — you shall die the death.'),
  ('apocrypha', 'ecclesiasticus', 14, 18, 'canon', 'isaiah', 40, 6, 'free', E'Isaiah 40:6 — *The voice said, Cry. And he said, What shall I cry? All flesh is grass, and all the goodliness thereof is as the flower of the field:* the prophet''s fading-flower of flesh matches the falling leaves of Sirach 14:18.'),
  ('apocrypha', 'ecclesiasticus', 14, 18, 'canon', '1-peter', 1, 24, 'free', E'1 Peter 1:24 — *For all flesh is as grass, and all the glory of man as the flower of grass. The grass withereth, and the flower thereof falleth away:* Peter echoes the same generation-of-flesh that comes to an end in Sirach 14:18.'),
  ('apocrypha', 'ecclesiasticus', 14, 17, 'canon', 'james', 1, 10, 'free', E'James 1:10 — *But the rich, in that he is made low: because as the flower of the grass he shall pass away.* Sirach''s nearest NT kin turns the waxing-old of all flesh (Sirach 14:17) on the rich man who hoards.'),
  -- thread: ecclesiasticus-14-blessed-who-meditates-in-wisdom
  ('apocrypha', 'ecclesiasticus', 14, 20, 'canon', 'psalms', 1, 2, 'free', E'Psalm 1:2 — *But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night.* The blessed meditation in wisdom of Sirach 14:20 is the Torah-delight of the Psalter''s blessed man.'),
  ('apocrypha', 'ecclesiasticus', 14, 23, 'canon', 'proverbs', 8, 34, 'free', E'Proverbs 8:34 — *Blessed is the man that heareth me, watching daily at my gates, waiting at the posts of my doors.* Wisdom''s own beatitude on the watcher at her doors mirrors Sirach 14:23, who hearkens at her doors.'),
  ('apocrypha', 'ecclesiasticus', 14, 26, 'canon', 'proverbs', 3, 18, 'free', E'Proverbs 3:18 — *She is a tree of life to them that lay hold upon her: and happy is every one that retaineth her.* The branches under which the seeker lodges in Sirach 14:26 are the tree of life that is Wisdom.'),
  ('apocrypha', 'ecclesiasticus', 14, 27, 'apocrypha', 'ecclesiasticus', 24, 19, 'extras', E'Ecclesiasticus 24:19 — *Come to me, all you that be desirous of me, and fill yourselves with my fruits.* Ben Sira''s own personified Wisdom completes Sirach 14:27 — the man covered in her glory is welcomed to her fruits.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_sir14_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_sir14_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-14-blessed-the-guarded-mouth',
       E'Blessed the man who has not slipped with his mouth',
       E'Ben Sira opens the chapter with a beatitude on the disciplined tongue and the clear conscience: *Blessed is the man that has not slipped with his mouth, and is not pricked with the multitude of sins* (Ecclesiasticus 14:1), *Blessed is he whose conscience has not condemned him, and who is not fallen from his hope in Yahuah (God)* (Ecclesiasticus 14:2). This is the wisdom tradition''s own "It ain''t new": Solomon had already taught *He that keepeth his mouth keepeth his life: but he that openeth wide his lips shall have destruction* (Proverbs 13:3), and the Psalter''s first beatitude crowns the man who shuns the scornful and delights in Torah — *Blessed is the man that walketh not in the counsel of the ungodly* (Psalm 1:1). James, the closest NT sibling to Sirach, carries the same measure of the tongue into the gospel: *For in many things we offend all. If any man offend not in word, the same is a perfect man, and able also to bridle the whole body* (James 3:2).',
       sv.verse_id, ev.verse_id, 'extras', 58625
  FROM _session253_sir14_lookup sv, _session253_sir14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=14 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-14-the-covetous-eye-riches-in-vain',
       E'The envious eye and the niggard who hoards in vain',
       E'Ben Sira pronounces a withering judgment on the miser: *Riches are not comely for a niggard: and what should an envious man do with money?* (Ecclesiasticus 14:3), *He that gathers by defrauding his own soul gathers for others, that shall spend his goods riotously* (Ecclesiasticus 14:4), *A covetous man''s eye is not satisfied with his portion; and the iniquity of the wicked drieth up his soul* (Ecclesiasticus 14:9). Solomon had seen the same vanity: *He that loveth silver shall not be satisfied with silver* (Ecclesiastes 5:10), *riches kept for the owners thereof to their hurt* (Ecclesiastes 5:13). The Psalmist marks *They that trust in their wealth, and boast themselves in the multitude of their riches* (Psalm 49:6). And Yahusha''s parable of the rich fool gives the hoarder''s end — he gathers for others who spend it: *Soul, thou hast much goods laid up for many years; take thine ease, eat, drink, and be merry* (Luke 12:19), to which Elohim answers *Thou fool, this night thy soul shall be required of thee* (Luke 12:20). Against this stands the open hand — *There is that scattereth, and yet increaseth; and there is that withholdeth more than is meet, but it tendeth to poverty* (Proverbs 11:24).',
       sv.verse_id, ev.verse_id, 'extras', 58628
  FROM _session253_sir14_lookup sv, _session253_sir14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=14 AND ev.verse_number=10
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-14-use-thy-good-things-no-dainties-in-the-grave',
       E'Use thy good things, for in the grave is no seeking of dainties',
       E'Against the hoarder Ben Sira sets the open and generous hand, mindful of death: *My son, according to your ability do good to thyself, and give Yahuah (God) his due offering* (Ecclesiasticus 14:11), *Do good to your friend before you die, and according to your ability stretch out your hand and give to him* (Ecclesiasticus 14:13), *Give, and take, and sanctify your soul; for there is no seeking of dainties in the grave* (Ecclesiasticus 14:16). The naked-came, naked-goes truth that drives this generosity is the wisdom of Job and Qoheleth: *Naked came I out of my mother''s womb, and naked shall I return thither: Yahuah (LORD) gave, and Yahuah (LORD) hath taken away; blessed be the name of Yahuah (LORD)* (Job 1:21), *naked shall he return to go as he came, and shall take nothing of his labour* (Ecclesiastes 5:15), which Paul presses on Timothy — *For we brought nothing into this world, and it is certain we can carry nothing out* (1 Timothy 6:7). And the Sermon''s command to transfer wealth past the grave answers Sirach''s plea to spend it now in mercy: *Lay not up for yourselves treasures upon earth, where moth and rust doth corrupt... But lay up for yourselves treasures in heaven* (Matthew 6:19-20).',
       sv.verse_id, ev.verse_id, 'extras', 58631
  FROM _session253_sir14_lookup sv, _session253_sir14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=14 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-14-all-flesh-waxeth-old-as-a-garment',
       E'All flesh waxeth old as a garment — the covenant from the beginning',
       E'Ben Sira grounds the urgency of mercy in mortality, citing the Edenic sentence as a standing covenant: *All flesh waxeth old as a garment: for the covenant from the beginning is, You shall die the death* (Ecclesiasticus 14:17), and the image of fading leaves — *As of the green leaves on a thick tree, some fall, and some grow; so is the generation of flesh and blood, one comes to an end, and another is born* (Ecclesiasticus 14:18). The covenant from the beginning is Genesis: *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return* (Genesis 3:19). The grass-and-flower figure is the prophets'' and apostles'' shared refrain — *All flesh is grass, and all the goodliness thereof is as the flower of the field* (Isaiah 40:6), *For all flesh is as grass, and all the glory of man as the flower of grass. The grass withereth, and the flower thereof falleth away* (1 Peter 1:24). James, Sirach''s NT sibling, aims it straight at the rich man: *But the rich, in that he is made low: because as the flower of the grass he shall pass away* (James 1:10).',
       sv.verse_id, ev.verse_id, 'extras', 58634
  FROM _session253_sir14_lookup sv, _session253_sir14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=17
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=14 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'ecclesiasticus-14-blessed-who-meditates-in-wisdom',
       E'Blessed the man that meditates in wisdom and dwells under her branches',
       E'The chapter closes with a beatitude on the seeker of wisdom, drawn in the figure of a hunter who camps at her gates and at last dwells beneath her: *Blessed is the man that does meditate good things in wisdom, and that reasoneth of holy things by his understanding* (Ecclesiasticus 14:20), *He that does lodge near her house shall also fasten a pin in her walls* (Ecclesiasticus 14:24), *He shall set his children under her shelter, and shall lodge under her branches* (Ecclesiasticus 14:26). The Psalter''s blessed man meditates the same way — *But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night* (Psalm 1:2). Solomon''s personified Wisdom blesses the watcher at her doors — *Blessed is the man that heareth me, watching daily at my gates, waiting at the posts of my doors* (Proverbs 8:34) — and calls her a tree of life: *She is a tree of life to them that lay hold upon her: and happy is every one that retaineth her* (Proverbs 3:18). Ben Sira himself, later in his own book, will have this same Wisdom invite the seeker home — *Come to me, all you that be desirous of me, and fill yourselves with my fruits* (Ecclesiasticus 24:19) — the dwelling-under-her-branches of Sirach 14 fulfilled at her table.',
       sv.verse_id, ev.verse_id, 'extras', 58637
  FROM _session253_sir14_lookup sv, _session253_sir14_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=20
   AND ev.edition_slug='apocrypha' AND ev.book_slug='ecclesiasticus' AND ev.chapter_number=14 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: ecclesiasticus-14-blessed-the-guarded-mouth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 13:3 — *He that keepeth his mouth keepeth his life: but he that openeth wide his lips shall have destruction.* The same wisdom Ben Sira blesses in Sirach 14:1, the guarded mouth that does not slip into the multitude of sins.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-blessed-the-guarded-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=13 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'James 3:2 — *For in many things we offend all. If any man offend not in word, the same is a perfect man, and able also to bridle the whole body.* James, Sirach''s nearest NT kin, makes the un-slipped tongue of Sirach 14:1 the mark of the perfect man.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-blessed-the-guarded-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=3 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 1:1 — *Blessed is the man that walketh not in the counsel of the ungodly, nor standeth in the way of sinners, nor sitteth in the seat of the scornful.* The Psalter''s opening beatitude on the man of clear conscience answers Ben Sira''s blessing in Sirach 14:2.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-blessed-the-guarded-mouth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-14-the-covetous-eye-riches-in-vain
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiastes 5:10 — *He that loveth silver shall not be satisfied with silver; nor he that loveth abundance with increase: this is also vanity.* Qoheleth names the same unsatisfied covetous eye Ben Sira condemns in Sirach 14:3,9.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-the-covetous-eye-riches-in-vain'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=5 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 12:19 — *And I will say to my soul, Soul, thou hast much goods laid up for many years; take thine ease, eat, drink, and be merry.* The rich fool gathers for others to spend, exactly the self-defrauding hoarder of Sirach 14:4.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-the-covetous-eye-riches-in-vain'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Luke 12:20 — *But Elohim (God) said unto him, Thou fool, this night thy soul shall be required of thee: then whose shall those things be, which thou hast provided?* The wealth gathered by defrauding the soul (Sirach 14:4) passes to another the very night the hoarder dies.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-the-covetous-eye-riches-in-vain'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 49:6 — *They that trust in their wealth, and boast themselves in the multitude of their riches;* the never-satisfied covetous eye of Sirach 14:9 is the soul that trusts in wealth that cannot redeem it.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-the-covetous-eye-riches-in-vain'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=49 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Proverbs 11:24 — *There is that scattereth, and yet increaseth; and there is that withholdeth more than is meet, but it tendeth to poverty.* The generous opposite of the niggard who gathers only for others in Sirach 14:4.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-the-covetous-eye-riches-in-vain'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-14-use-thy-good-things-no-dainties-in-the-grave
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ecclesiastes 5:15 — *As he came forth of his mother''s womb, naked shall he return to go as he came, and shall take nothing of his labour, which he may carry away in his hand.* Because nothing follows into the grave, Sirach 14:16 urges giving and sanctifying the soul now.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-use-thy-good-things-no-dainties-in-the-grave'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=5 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Timothy 6:7 — *For we brought nothing into this world, and it is certain we can carry nothing out.* Paul states the very ground of Sirach 14:16 — there is no seeking of dainties in the grave.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-use-thy-good-things-no-dainties-in-the-grave'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Job 1:21 — *And said, Naked came I out of my mother''s womb, and naked shall I return thither: Yahuah (LORD) gave, and Yahuah (LORD) hath taken away; blessed be the name of Yahuah (LORD).* Job''s surrender frames the do-good-to-thyself-and-give-Yahuah-his-due of Sirach 14:11.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-use-thy-good-things-no-dainties-in-the-grave'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='job' AND tv.chapter_number=1 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 11:25 — *The liberal soul shall be made fat: and he that watereth shall be watered also himself.* The blessing on the outstretched hand of Sirach 14:13.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-use-thy-good-things-no-dainties-in-the-grave'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Matthew 6:20 — *But lay up for yourselves treasures in heaven, where neither moth nor rust doth corrupt, and where thieves do not break through nor steal:* the Sermon turns Sirach 14:13''s almsgiving-before-death into treasure stored past the grave.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-use-thy-good-things-no-dainties-in-the-grave'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=6 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-14-all-flesh-waxeth-old-as-a-garment
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 3:19 — *In the sweat of thy face shalt thou eat bread, till thou return unto the ground; for out of it wast thou taken: for dust thou art, and unto dust shalt thou return.* This is the covenant from the beginning Ben Sira cites in Sirach 14:17 — you shall die the death.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-all-flesh-waxeth-old-as-a-garment'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=3 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 40:6 — *The voice said, Cry. And he said, What shall I cry? All flesh is grass, and all the goodliness thereof is as the flower of the field:* the prophet''s fading-flower of flesh matches the falling leaves of Sirach 14:18.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-all-flesh-waxeth-old-as-a-garment'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Peter 1:24 — *For all flesh is as grass, and all the glory of man as the flower of grass. The grass withereth, and the flower thereof falleth away:* Peter echoes the same generation-of-flesh that comes to an end in Sirach 14:18.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-all-flesh-waxeth-old-as-a-garment'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=1 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'James 1:10 — *But the rich, in that he is made low: because as the flower of the grass he shall pass away.* Sirach''s nearest NT kin turns the waxing-old of all flesh (Sirach 14:17) on the rich man who hoards.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-all-flesh-waxeth-old-as-a-garment'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=1 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: ecclesiasticus-14-blessed-who-meditates-in-wisdom
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 1:2 — *But his delight is in the law of Yahuah (LORD); and in his law doth he meditate day and night.* The blessed meditation in wisdom of Sirach 14:20 is the Torah-delight of the Psalter''s blessed man.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-blessed-who-meditates-in-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 8:34 — *Blessed is the man that heareth me, watching daily at my gates, waiting at the posts of my doors.* Wisdom''s own beatitude on the watcher at her doors mirrors Sirach 14:23, who hearkens at her doors.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-blessed-who-meditates-in-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 3:18 — *She is a tree of life to them that lay hold upon her: and happy is every one that retaineth her.* The branches under which the seeker lodges in Sirach 14:26 are the tree of life that is Wisdom.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-blessed-who-meditates-in-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ecclesiasticus 24:19 — *Come to me, all you that be desirous of me, and fill yourselves with my fruits.* Ben Sira''s own personified Wisdom completes Sirach 14:27 — the man covered in her glory is welcomed to her fruits.'
  FROM cross_reference_threads t, cross_references x, _session253_sir14_lookup sv, _session253_sir14_lookup tv
 WHERE t.slug='ecclesiasticus-14-blessed-who-meditates-in-wisdom'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='ecclesiasticus' AND sv.chapter_number=14 AND sv.verse_number=27
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=24 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

