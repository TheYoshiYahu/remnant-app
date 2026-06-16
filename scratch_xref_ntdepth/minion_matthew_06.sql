-- ----- fragment: minion_matthew_06.sql (S260 Matthew depth) -----
-- ============================================================================
-- Matthew 6 — full-library cross-reference threads (NT DEPTH pass)
-- alms/prayer/fasting in secret + the Lord's Prayer + treasures / single eye /
-- seek first the kingdom. 7 threads. sort_order band 11150 step +3.
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 3a. Temp view
-- ----------------------------------------------------------------------------
CREATE TEMP VIEW _mt06_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1',
   'pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

-- ----------------------------------------------------------------------------
-- 3b. The cross_references rows
-- ----------------------------------------------------------------------------
WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES

  -- (a) 6:1-4 alms in secret -------------------------------------------------
  ('canon','matthew',6,1,'canon','deuteronomy',15,11,'free', E'*For the poor shall never cease out of the land: therefore I command thee, saying, Thou shalt open thine hand wide unto thy brother, to thy poor, and to thy needy, in thy land.* (Deuteronomy 15:11) — alms is not optional charity but a standing command of the Torah; Yahusha (JESUS) only guards its motive.'),
  ('canon','matthew',6,1,'canon','proverbs',19,17,'free', E'*He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again.* (Proverbs 19:17) — the secret gift is a loan to Yahuah Himself, and the Father who *seeth in secret* repays.'),
  ('canon','matthew',6,1,'canon','psalms',112,9,'free', E'*He hath dispersed, he hath given to the poor; his righteousness endureth for ever; his horn shall be exalted with honour.* (Psalm 112:9) — the righteous scatter abroad and their reward is lasting, not the fleeting glory of men.'),
  ('canon','matthew',6,1,'apocrypha','tobit',4,7,'extras', E'*Give alms of your substance; and when you give alms, let not your eye be envious, neither turn your face from any poor, and the face of Yahuah (God) shall not be turned away from you.* (Tobit 4:7) — old Yashar''el (Israel) taught its sons this very secret-handed giving.'),
  ('canon','matthew',6,1,'apocrypha','tobit',12,8,'extras', E'*Prayer is good with fasting and alms and righteousness. A little with righteousness is better than much with unrighteousness. It is better to give alms than to lay up gold:* (Tobit 12:8) — the three pillars of Matthew 6 — prayer, fasting, alms — stand together in the older witness.'),
  ('canon','matthew',6,1,'apocrypha','ecclesiasticus',17,22,'extras', E'*The alms of a man is as a signet with him, and he will keep the good deeds of man as the apple of the eye, and give repentance to his sons and daughters.* (Sirach 17:22) — the alms done in secret is sealed and kept by the Father as the apple of His eye.'),

  -- (b) 6:5-8 prayer in secret -----------------------------------------------
  ('canon','matthew',6,5,'canon','isaiah',26,20,'free', E'*Come, my people, enter thou into thy chambers, and shut thy doors about thee: hide thyself as it were for a little moment, until the indignation be overpast.* (Isaiah 26:20) — *enter into thy closet, and when thou hast shut thy door, pray to thy Father which is in secret* (Matthew 6:6) is Isaiah''s very pattern: shut the door, seek Yahuah within.'),
  ('canon','matthew',6,5,'canon','ecclesiastes',5,2,'free', E'*Be not rash with thy mouth, and let not thine heart be hasty to utter any thing before Elohim (God): for Elohim (God) is in heaven, and thou upon earth: therefore let thy words be few.* (Ecclesiastes 5:2) — *use not vain repetitions* (Matthew 6:7) is the wisdom of the preacher: few words before the Father who already *knoweth what things ye have need of, before ye ask him.*'),

  -- (c) ★★ 6:9-13 the Lord's Prayer ------------------------------------------
  ('canon','matthew',6,9,'canon','isaiah',63,16,'free', E'*Doubtless thou art our father, though Abraham be ignorant of us, and Yashar''el (Israel) acknowledge us not: thou, O Yahuah (LORD), art our father, our redeemer; thy name is from everlasting.* (Isaiah 63:16) — when the Formed Son teaches *Our Father which art in heaven*, He points the children straight to Yahuah, the Father and Redeemer of old.'),
  ('canon','matthew',6,9,'canon','isaiah',64,8,'free', E'*But now, O Yahuah (LORD), thou art our father; we are the clay, and thou our potter; and we all are the work of thy hand.* (Isaiah 64:8) — the Father addressed in the prayer is the Potter, the Source; the Son who teaches us to pray is Himself the work of the Father''s hand.'),
  ('canon','matthew',6,9,'canon','ezekiel',36,23,'free', E'*And I will sanctify my great name, which was profaned among the heathen... and the heathen shall know that I am Yahuah (LORD)... when I shall be sanctified in you before their eyes.* (Ezekiel 36:23) — *Hallowed be thy name* is the prayer that Yahuah''s own great Name be sanctified in His people; the Name hallowed is the Name **Yahuah**.'),
  ('canon','matthew',6,9,'canon','leviticus',22,32,'free', E'*Neither shall ye profane my holy name; but I will be hallowed among the children of Yashar''el (Israel): I am Yahuah (LORD) which hallow you.* (Leviticus 22:32) — *Hallowed be thy name* roots in the Torah''s own charge to hallow the Name of Yahuah and never profane it.'),
  ('canon','matthew',6,9,'canon','psalms',103,19,'free', E'*Yahuah (LORD) hath prepared his throne in the heavens; and his kingdom ruleth over all.* (Psalm 103:19) — *Thy kingdom come... Thy will be done in earth, as it is in heaven*: the heavenly throne and the angels that *do his commandments* are the pattern earth is to follow.'),
  ('canon','matthew',6,9,'canon','psalms',145,11,'free', E'*They shall speak of the glory of thy kingdom, and talk of thy power... Thy kingdom is an everlasting kingdom, and thy dominion endureth throughout all generations.* (Psalm 145:11,13) — *Thine is the kingdom, and the power, and the glory, for ever* is drawn straight from this psalm of the everlasting kingdom.'),
  ('canon','matthew',6,9,'canon','proverbs',30,8,'free', E'*Remove far from me vanity and lies: give me neither poverty nor riches; feed me with food convenient for me.* (Proverbs 30:8) — *Give us this day our daily bread* is Agur''s prayer for *food convenient* — enough for the day, no more.'),
  ('canon','matthew',6,9,'canon','luke',11,2,'free', E'*When ye pray, say, Our Father which art in heaven, Hallowed be thy name. Thy kingdom come. Thy will be done, as in heaven, so in earth. Give us day by day our daily bread.* (Luke 11:2-3) — the same prayer, the same Father, given again to the disciples.'),

  -- (d) 6:14-15 forgive trespasses -------------------------------------------
  ('canon','matthew',6,14,'apocrypha','ecclesiasticus',28,2,'extras', E'*Forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven when you prayest.* (Sirach 28:2) — the very law of the prayer — *forgive us our debts, as we forgive our debtors* — was already taught in Yashar''el (Israel): release your neighbour and you are released.'),
  ('canon','matthew',6,14,'apocrypha','ecclesiasticus',28,4,'extras', E'*He sheweth no mercy to a man, which is like himself: and does he ask forgiveness of his own sins?* (Sirach 28:4) — the unforgiving man who *forgive not men their trespasses* has no ground to plead his own pardon.'),
  ('canon','matthew',6,14,'canon','mark',11,25,'free', E'*And when ye stand praying, forgive, if ye have ought against any: that your Father also which is in heaven may forgive you your trespasses.* (Mark 11:25) — the same word, joined again to prayer: forgiveness received flows through forgiveness given.'),

  -- (e) 6:16-18 fasting ------------------------------------------------------
  ('canon','matthew',6,16,'canon','isaiah',58,5,'free', E'*Is it such a fast that I have chosen? a day for a man to afflict his soul? is it to bow down his head as a bulrush, and to spread sackcloth and ashes under him? wilt thou call this a fast?* (Isaiah 58:5) — the *sad countenance* and *disfigured faces* of the hypocrites are exactly the show-fast Yahuah refuses.'),
  ('canon','matthew',6,16,'canon','isaiah',58,6,'free', E'*Is not this the fast that I have chosen? to loose the bands of wickedness, to undo the heavy burdens, and to let the oppressed go free, and that ye break every yoke?* (Isaiah 58:6) — the fast Yahuah honours is hidden mercy, not a performance *to appear unto men to fast.*'),
  ('canon','matthew',6,16,'canon','joel',2,12,'free', E'*Turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning: And rend your heart, and not your garments.* (Joel 2:12-13) — *rend your heart, and not your garments* is the whole counsel of Matthew 6:16-18: fasting is between you and the Father who *seeth in secret.*'),

  -- (f) 6:19-24 treasures / single eye / mammon ------------------------------
  ('canon','matthew',6,19,'canon','proverbs',23,4,'free', E'*Labour not to be rich: cease from thine own wisdom. Wilt thou set thine eyes upon that which is not? for riches certainly make themselves wings; they fly away as an eagle toward heaven.* (Proverbs 23:4-5) — earthly treasure that *moth and rust doth corrupt* takes wings; do not bind your heart to it.'),
  ('canon','matthew',6,19,'canon','ecclesiastes',5,10,'free', E'*He that loveth silver shall not be satisfied with silver; nor he that loveth abundance with increase: this is also vanity.* (Ecclesiastes 5:10) — the man who serves mammon is never filled; *ye cannot serve Elohim (God) and mammon.*'),
  ('canon','matthew',6,19,'canon','malachi',3,10,'free', E'*Bring ye all the tithes into the storehouse... and prove me now herewith, saith Yahuah Tseva''ot (LORD of hosts), if I will not open you the windows of heaven, and pour you out a blessing.* (Malachi 3:10) — treasure *laid up in heaven* by open-handed trust returns blessing that earth cannot hold.'),
  ('canon','matthew',6,19,'apocrypha','ecclesiasticus',29,11,'extras', E'*Lay up your treasure according to the commandments of the Most High, and it shall bring you more profit than gold. Shut up alms in your storehouses: and it shall deliver you from all affliction.* (Sirach 29:11-12) — *lay up for yourselves treasures in heaven* is the very counsel of Sirach: alms is treasure stored where it cannot corrupt.'),

  -- (g) 6:25-34 take no thought / lilies / seek first ------------------------
  ('canon','matthew',6,25,'canon','psalms',37,25,'free', E'*I have been young, and now am old; yet have I not seen the righteous forsaken, nor his seed begging bread.* (Psalm 37:25) — *Take no thought for your life*: the Father who has never forsaken the righteous feeds the fowls and clothes the grass.'),
  ('canon','matthew',6,25,'canon','psalms',55,22,'free', E'*Cast thy burden upon Yahuah (LORD), and he shall sustain thee: he shall never suffer the righteous to be moved.* (Psalm 55:22) — the cure for anxious thought is to cast the burden upon the Father who sustains.'),
  ('canon','matthew',6,25,'canon','psalms',104,14,'free', E'*He causeth the grass to grow for the cattle, and herb for the service of man; that he may bring forth food out of the earth... and bread which strengtheneth man''s heart.* (Psalm 104:14-15) — the same Father who feeds the cattle and brings forth bread *feedeth* the fowls and clothes the lilies.'),
  ('canon','matthew',6,25,'canon','proverbs',6,8,'free', E'*Provideth her meat in the summer, and gathereth her food in the harvest.* (Proverbs 6:8) — even the ant works within Yahuah''s provision; *take no thought* is not idleness but trust, the heart freed from anxious care.'),
  ('canon','matthew',6,25,'canon','luke',12,22,'free', E'*Take no thought for your life, what ye shall eat... Consider the ravens: for they neither sow nor reap... and Elohim (God) feedeth them... But rather seek ye the kingdom of Elohim (God); and all these things shall be added unto you.* (Luke 12:22,24,31) — the same teaching, *seek ye first the kingdom*, and the Father adds the rest.')

)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _mt06_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _mt06_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3c. The threads
-- ----------------------------------------------------------------------------

-- (a) 6:1-4 alms in secret
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-6-alms-in-secret-the-father-which-seeth-in-secret-deuteronomy-15-tobit-4',
       E'Alms in secret — thy Father which seeth in secret (Deuteronomy 15; Proverbs 19; Tobit; Sirach)',
       E'*Take heed that ye do not your alms before men, to be seen of them... That thine alms may be in secret: and thy Father which seeth in secret himself shall reward thee openly* (Matthew 6:1,4). Yahusha (JESUS) is not inventing charity; He is guarding the heart of a standing Torah command. *For the poor shall never cease out of the land: therefore I command thee, saying, Thou shalt open thine hand wide unto thy brother, to thy poor, and to thy needy, in thy land* (Deuteronomy 15:11). The open hand is commanded — only the trumpet is forbidden. And the gift handed quietly is no loss: *He that hath pity upon the poor lendeth unto Yahuah (LORD); and that which he hath given will he pay him again* (Proverbs 19:17). *He hath dispersed, he hath given to the poor; his righteousness endureth for ever* (Psalm 112:9). Old Yashar''el (Israel) already taught its sons this secret-handed giving: *Give alms of your substance; and when you give alms, let not your eye be envious... and the face of Yahuah (God) shall not be turned away from you* (Tobit 4:7); *It is better to give alms than to lay up gold* (Tobit 12:8); *The alms of a man is as a signet with him, and he will keep the good deeds of man as the apple of the eye* (Sirach 17:22). The reward of the hypocrite is the glance of men; the reward of the hidden giver is the eye of the Father.',
       sv.verse_id, ev.verse_id, 'extras', 11150
  FROM _mt06_lookup sv, _mt06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=6 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- (b) 6:5-8 prayer in secret
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-6-prayer-in-secret-enter-into-thy-closet-isaiah-26-ecclesiastes-5',
       E'Prayer in secret — enter into thy closet, shut thy door (Isaiah 26; Ecclesiastes 5)',
       E'*But thou, when thou prayest, enter into thy closet, and when thou hast shut thy door, pray to thy Father which is in secret; and thy Father which seeth in secret shall reward thee openly* (Matthew 6:6). This is no new commandment but Isaiah''s very pattern: *Come, my people, enter thou into thy chambers, and shut thy doors about thee: hide thyself as it were for a little moment, until the indignation be overpast* (Isaiah 26:20). Shut the door, seek Yahuah within. And against the heathen who *think that they shall be heard for their much speaking* (Matthew 6:7), the preacher had already said: *Be not rash with thy mouth, and let not thine heart be hasty to utter any thing before Elohim (God): for Elohim (God) is in heaven, and thou upon earth: therefore let thy words be few* (Ecclesiastes 5:2). Few words, and those in secret — for *your Father knoweth what things ye have need of, before ye ask him* (Matthew 6:8). Prayer is not performance to be seen; it is a son speaking to his Father behind a shut door.',
       sv.verse_id, ev.verse_id, 'free', 11153
  FROM _mt06_lookup sv, _mt06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=5
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=6 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

-- (c) ★★ 6:9-13 the Lord's Prayer
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-6-the-lords-prayer-our-father-hallowed-be-thy-name-isaiah-63-ezekiel-36',
       E'The Lord''s Prayer — Our Father, hallowed be thy name (Isaiah 63-64; Ezekiel 36; Leviticus 22; Psalm 103, 145)',
       E'*After this manner therefore pray ye: Our Father which art in heaven, Hallowed be thy name. Thy kingdom come. Thy will be done in earth, as it is in heaven. Give us this day our daily bread* (Matthew 6:9-11). The Formed Son does not teach the disciples to pray to Himself — He teaches them to address **the Father**, the Source. *Doubtless thou art our father, though Abraham be ignorant of us, and Yashar''el (Israel) acknowledge us not: thou, O Yahuah (LORD), art our father, our redeemer; thy name is from everlasting* (Isaiah 63:16). *But now, O Yahuah (LORD), thou art our father; we are the clay, and thou our potter* (Isaiah 64:8) — the Father is the Potter; the Son who teaches us to pray is Himself the work of His hand. **Hallowed be thy name**: the Name to be hallowed is the Name **Yahuah**. *And I will sanctify my great name, which was profaned among the heathen... and the heathen shall know that I am Yahuah (LORD)... when I shall be sanctified in you before their eyes* (Ezekiel 36:23); *Neither shall ye profane my holy name; but I will be hallowed among the children of Yashar''el (Israel): I am Yahuah (LORD) which hallow you* (Leviticus 22:32). **Thy kingdom come, thy will be done**: *Yahuah (LORD) hath prepared his throne in the heavens; and his kingdom ruleth over all* (Psalm 103:19) — and the angels that *do his commandments* are the pattern earth is to follow. *Thy kingdom is an everlasting kingdom, and thy dominion endureth throughout all generations* (Psalm 145:13), from which the closing doxology is drawn: *For thine is the kingdom, and the power, and the glory, for ever.* **Daily bread**: *give me neither poverty nor riches; feed me with food convenient for me* (Proverbs 30:8) — enough for the day. And the same prayer was given again: *When ye pray, say, Our Father which art in heaven, Hallowed be thy name. Thy kingdom come* (Luke 11:2). One Father, one Name, one kingdom — and the Son who reveals the invisible Father by teaching us to call upon Him.',
       sv.verse_id, ev.verse_id, 'free', 11156
  FROM _mt06_lookup sv, _mt06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=6 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- (d) 6:14-15 forgive trespasses
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-6-forgive-men-their-trespasses-as-we-forgive-sirach-28-mark-11',
       E'Forgive men their trespasses — as we forgive our debtors (Sirach 28; Mark 11)',
       E'*For if ye forgive men their trespasses, your heavenly Father will also forgive you: But if ye forgive not men their trespasses, neither will your Father forgive your trespasses* (Matthew 6:14-15). This unfolds the petition *forgive us our debts, as we forgive our debtors* — and it was no new law. Yashar''el (Israel) had long been taught: *Forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven when you prayest* (Sirach 28:2). And the unforgiving man is left without a plea: *He sheweth no mercy to a man, which is like himself: and does he ask forgiveness of his own sins?* (Sirach 28:4). The Master joins the same word to prayer once more: *And when ye stand praying, forgive, if ye have ought against any: that your Father also which is in heaven may forgive you your trespasses* (Mark 11:25). Forgiveness received and forgiveness given are one stream — to dam the one is to dam the other.',
       sv.verse_id, ev.verse_id, 'extras', 11159
  FROM _mt06_lookup sv, _mt06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=14
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=6 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- (e) 6:16-18 fasting
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-6-fasting-not-as-the-hypocrites-the-fast-yahuah-chooses-isaiah-58-joel-2',
       E'Fasting — not as the hypocrites, the fast Yahuah chooses (Isaiah 58; Joel 2)',
       E'*Moreover when ye fast, be not, as the hypocrites, of a sad countenance: for they disfigure their faces, that they may appear unto men to fast... But thou, when thou fastest, anoint thine head, and wash thy face; That thou appear not unto men to fast, but unto thy Father which is in secret* (Matthew 6:16-18). The disfigured face is exactly the show-fast Yahuah long ago refused: *Is it such a fast that I have chosen? a day for a man to afflict his soul? is it to bow down his head as a bulrush, and to spread sackcloth and ashes under him? wilt thou call this a fast?* (Isaiah 58:5). The fast Yahuah honours is hidden mercy: *Is not this the fast that I have chosen? to loose the bands of wickedness, to undo the heavy burdens, and to let the oppressed go free, and that ye break every yoke?* (Isaiah 58:6). And Joel names the whole secret of it: *Turn ye even to me with all your heart, and with fasting, and with weeping... And rend your heart, and not your garments, and turn unto Yahuah Elohaychem (the LORD your God)* (Joel 2:12-13). Rend the heart, not the garment — fasting is between a man and the Father who *seeth in secret.*',
       sv.verse_id, ev.verse_id, 'free', 11162
  FROM _mt06_lookup sv, _mt06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=16
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=6 AND ev.verse_number=18
ON CONFLICT (slug) DO NOTHING;

-- (f) 6:19-24 treasures / single eye / mammon
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-6-treasures-in-heaven-ye-cannot-serve-god-and-mammon-proverbs-23-sirach-29',
       E'Treasures in heaven — ye cannot serve Elohim and mammon (Proverbs 23; Ecclesiastes 5; Malachi 3; Sirach 29)',
       E'*Lay not up for yourselves treasures upon earth, where moth and rust doth corrupt... But lay up for yourselves treasures in heaven... For where your treasure is, there will your heart be also* (Matthew 6:19-21). The wise had long warned that earthly hoard takes wings: *Labour not to be rich: cease from thine own wisdom. Wilt thou set thine eyes upon that which is not? for riches certainly make themselves wings; they fly away as an eagle toward heaven* (Proverbs 23:4-5). And it never satisfies: *He that loveth silver shall not be satisfied with silver; nor he that loveth abundance with increase: this is also vanity* (Ecclesiastes 5:10) — which is why *No man can serve two masters... Ye cannot serve Elohim (God) and mammon* (Matthew 6:24). The treasure that endures is laid up by open-handed trust: *Bring ye all the tithes into the storehouse... and prove me now herewith, saith Yahuah Tseva''ot (LORD of hosts), if I will not open you the windows of heaven, and pour you out a blessing, that there shall not be room enough to receive it* (Malachi 3:10). Yashar''el (Israel) knew this treasury well: *Lay up your treasure according to the commandments of the Most High, and it shall bring you more profit than gold. Shut up alms in your storehouses: and it shall deliver you from all affliction* (Sirach 29:11-12). Alms given is treasure stored where no moth corrupts and no thief breaks through.',
       sv.verse_id, ev.verse_id, 'extras', 11165
  FROM _mt06_lookup sv, _mt06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=19
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=6 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

-- (g) 6:25-34 take no thought / lilies / seek first
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'matthew-6-take-no-thought-seek-first-the-kingdom-psalm-37-psalm-55-luke-12',
       E'Take no thought — consider the lilies, seek first the kingdom (Psalm 37, 55, 104; Proverbs 6; Luke 12)',
       E'*Therefore I say unto you, Take no thought for your life... Behold the fowls of the air: for they sow not, neither do they reap... yet your heavenly Father feedeth them... Consider the lilies of the field, how they grow... But seek ye first the kingdom of Elohim (God), and his righteousness; and all these things shall be added unto you* (Matthew 6:25-26,28,33). The ground of this trust is the Father''s unbroken faithfulness: *I have been young, and now am old; yet have I not seen the righteous forsaken, nor his seed begging bread* (Psalm 37:25). So the cure for anxious thought is to hand the weight over: *Cast thy burden upon Yahuah (LORD), and he shall sustain thee: he shall never suffer the righteous to be moved* (Psalm 55:22). The same Father who feeds the fowls brings forth bread from the earth: *He causeth the grass to grow for the cattle, and herb for the service of man; that he may bring forth food out of the earth... and bread which strengtheneth man''s heart* (Psalm 104:14-15). *Take no thought* is not idleness — even the ant *provideth her meat in the summer, and gathereth her food in the harvest* (Proverbs 6:8) — but trust, the heart freed from care to seek the kingdom first. And the Master taught it twice: *Take no thought for your life... Consider the ravens: for they neither sow nor reap... and Elohim (God) feedeth them... But rather seek ye the kingdom of Elohim (God); and all these things shall be added unto you* (Luke 12:22,24,31).',
       sv.verse_id, ev.verse_id, 'free', 11168
  FROM _mt06_lookup sv, _mt06_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=25
   AND ev.edition_slug='canon' AND ev.book_slug='matthew' AND ev.chapter_number=6 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3d. The thread_members
-- ----------------------------------------------------------------------------

-- (a) 6:1-4 alms in secret members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Deuteronomy 15:11 — *Thou shalt open thine hand wide unto thy brother, to thy poor, and to thy needy* — alms is a standing Torah command.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-alms-in-secret-the-father-which-seeth-in-secret-deuteronomy-15-tobit-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 19:17 — *He that hath pity upon the poor lendeth unto Yahuah (LORD)* — the secret gift is a loan the Father repays.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-alms-in-secret-the-father-which-seeth-in-secret-deuteronomy-15-tobit-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=19 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 112:9 — *He hath dispersed, he hath given to the poor; his righteousness endureth for ever* — lasting reward, not fleeting glory.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-alms-in-secret-the-father-which-seeth-in-secret-deuteronomy-15-tobit-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=112 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Tobit 4:7 — *Give alms of your substance... and the face of Yahuah (God) shall not be turned away from you* — old Yashar''el (Israel) taught secret-handed giving.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-alms-in-secret-the-father-which-seeth-in-secret-deuteronomy-15-tobit-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Tobit 12:8 — *Prayer is good with fasting and alms and righteousness* — the three pillars of Matthew 6 stand together in the older witness.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-alms-in-secret-the-father-which-seeth-in-secret-deuteronomy-15-tobit-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='tobit' AND tv.chapter_number=12 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Sirach 17:22 — *The alms of a man is as a signet with him... as the apple of the eye* — the secret alms is sealed and kept by the Father.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-alms-in-secret-the-father-which-seeth-in-secret-deuteronomy-15-tobit-4'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=17 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (b) 6:5-8 prayer in secret members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 26:20 — *enter thou into thy chambers, and shut thy doors about thee* — the very pattern of the shut closet.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-prayer-in-secret-enter-into-thy-closet-isaiah-26-ecclesiastes-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=26 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiastes 5:2 — *Elohim (God) is in heaven, and thou upon earth: therefore let thy words be few* — against the heathen''s much speaking.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-prayer-in-secret-enter-into-thy-closet-isaiah-26-ecclesiastes-5'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (c) 6:9-13 Lord's Prayer members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 63:16 — *thou, O Yahuah (LORD), art our father, our redeemer; thy name is from everlasting* — the Father the Son points us to.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-the-lords-prayer-our-father-hallowed-be-thy-name-isaiah-63-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=63 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 64:8 — *thou art our father; we are the clay, and thou our potter* — the Father is the Source; the Son is the work of His hand.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-the-lords-prayer-our-father-hallowed-be-thy-name-isaiah-63-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=64 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezekiel 36:23 — *I will sanctify my great name... I am Yahuah (LORD)* — Hallowed be thy name: the Name hallowed is Yahuah.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-the-lords-prayer-our-father-hallowed-be-thy-name-isaiah-63-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=36 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 22:32 — *Neither shall ye profane my holy name; but I will be hallowed... I am Yahuah (LORD)* — the Torah''s charge to hallow the Name.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-the-lords-prayer-our-father-hallowed-be-thy-name-isaiah-63-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=22 AND tv.verse_number=32
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Psalm 103:19 — *Yahuah (LORD) hath prepared his throne in the heavens; and his kingdom ruleth over all* — Thy kingdom come, thy will be done.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-the-lords-prayer-our-father-hallowed-be-thy-name-isaiah-63-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=103 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 6, E'Psalm 145:11,13 — *Thy kingdom is an everlasting kingdom* — the source of the closing doxology, thine is the kingdom and the power and the glory.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-the-lords-prayer-our-father-hallowed-be-thy-name-isaiah-63-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=145 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 7, E'Proverbs 30:8 — *give me neither poverty nor riches; feed me with food convenient for me* — Give us this day our daily bread.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-the-lords-prayer-our-father-hallowed-be-thy-name-isaiah-63-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=30 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 8, E'Luke 11:2-3 — *When ye pray, say, Our Father which art in heaven, Hallowed be thy name* — the same prayer given again.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-the-lords-prayer-our-father-hallowed-be-thy-name-isaiah-63-ezekiel-36'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=11 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (d) 6:14-15 forgive members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Sirach 28:2 — *Forgive your neighbour the hurt that he has done to you, so shall your sins also be forgiven* — the law of the prayer, taught of old.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-forgive-men-their-trespasses-as-we-forgive-sirach-28-mark-11'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=28 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Sirach 28:4 — *He sheweth no mercy to a man, which is like himself: and does he ask forgiveness of his own sins?* — the unforgiving have no plea.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-forgive-men-their-trespasses-as-we-forgive-sirach-28-mark-11'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=28 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Mark 11:25 — *when ye stand praying, forgive... that your Father also which is in heaven may forgive you* — the same word joined to prayer.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-forgive-men-their-trespasses-as-we-forgive-sirach-28-mark-11'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='mark' AND tv.chapter_number=11 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (e) 6:16-18 fasting members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 58:5 — *is it to bow down his head as a bulrush... wilt thou call this a fast?* — the show-fast Yahuah refuses.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-fasting-not-as-the-hypocrites-the-fast-yahuah-chooses-isaiah-58-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 58:6 — *Is not this the fast that I have chosen? to loose the bands of wickedness... let the oppressed go free* — the fast Yahuah honours is hidden mercy.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-fasting-not-as-the-hypocrites-the-fast-yahuah-chooses-isaiah-58-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=58 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joel 2:12 — *turn ye even to me with all your heart, and with fasting... And rend your heart, and not your garments* — fasting between a man and the Father in secret.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-fasting-not-as-the-hypocrites-the-fast-yahuah-chooses-isaiah-58-joel-2'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (f) 6:19-24 treasures members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 23:4-5 — *riches certainly make themselves wings; they fly away as an eagle* — earthly hoard that moth and rust corrupt.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-treasures-in-heaven-ye-cannot-serve-god-and-mammon-proverbs-23-sirach-29'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=23 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiastes 5:10 — *He that loveth silver shall not be satisfied with silver* — mammon never fills; ye cannot serve Elohim (God) and mammon.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-treasures-in-heaven-ye-cannot-serve-god-and-mammon-proverbs-23-sirach-29'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=5 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 3:10 — *prove me now herewith... if I will not open you the windows of heaven, and pour you out a blessing* — treasure laid up by open-handed trust.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-treasures-in-heaven-ye-cannot-serve-god-and-mammon-proverbs-23-sirach-29'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=3 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Sirach 29:11-12 — *Lay up your treasure according to the commandments of the Most High... Shut up alms in your storehouses* — alms is treasure stored where it cannot corrupt.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-treasures-in-heaven-ye-cannot-serve-god-and-mammon-proverbs-23-sirach-29'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=19
   AND tv.edition_slug='apocrypha' AND tv.book_slug='ecclesiasticus' AND tv.chapter_number=29 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- (g) 6:25-34 take no thought members
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 37:25 — *yet have I not seen the righteous forsaken, nor his seed begging bread* — the ground of the trust that takes no thought.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-take-no-thought-seek-first-the-kingdom-psalm-37-psalm-55-luke-12'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 55:22 — *Cast thy burden upon Yahuah (LORD), and he shall sustain thee* — the cure for anxious thought.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-take-no-thought-seek-first-the-kingdom-psalm-37-psalm-55-luke-12'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=55 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 104:14-15 — *He causeth the grass to grow... and bread which strengtheneth man''s heart* — the Father who feeds the fowls brings forth bread.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-take-no-thought-seek-first-the-kingdom-psalm-37-psalm-55-luke-12'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=104 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 6:8 — *Provideth her meat in the summer, and gathereth her food in the harvest* — take no thought is trust, not idleness.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-take-no-thought-seek-first-the-kingdom-psalm-37-psalm-55-luke-12'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=6 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'Luke 12:22,24,31 — *Take no thought for your life... Consider the ravens... seek ye the kingdom of Elohim (God); and all these things shall be added* — the same teaching given again.'
  FROM cross_reference_threads t, cross_references x, _mt06_lookup sv, _mt06_lookup tv
 WHERE t.slug='matthew-6-take-no-thought-seek-first-the-kingdom-psalm-37-psalm-55-luke-12'
   AND sv.edition_slug='canon' AND sv.book_slug='matthew' AND sv.chapter_number=6 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=12 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
