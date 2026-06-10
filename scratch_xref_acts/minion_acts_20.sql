-- ----- fragment: minion_acts_20.sql (S217 Acts 20) -----
-- =====================================================================
-- S217 minion — ACTS 20 FULL-LIBRARY cross-references
-- =====================================================================
-- Anchor chapter: ACTS 20.  Tag: a20 (temp view _s217_a20_lookup).  Sort band: 5750-5765.
-- Source is ALWAYS the canon Acts 20 verse; targets span Tanakh + extra-canonical + NT.
-- Tiers per-row: canon target = 'free'; extra-canonical target = 'extras'.
--
-- WATCHPOINTS (Red Lines #6/#7/#10/#11, Christology, son-of-Adam, shepherd architecture):
--  * Eutychus raised (20:9-12): Paul falls on the dead young man and embraces him — *his life
--    is in him* — the same posture as Elijah stretching on the widow's son (1 Kings 17:21) and
--    Elisha on the Shunammite's son (2 Kings 4:34-35). The Formed-one's power to raise running
--    through his servants; a sign within the breaking-of-bread on the first day, not a new cultus.
--  * Watchman cleared (20:26-27): *I am pure from the blood of all men, for I have not shunned
--    to declare all the counsel of Elohim (God)* — the watchman of Ezekiel 33 who blew the
--    trumpet and so delivered his own soul; the blood-guilt requirement of Ezekiel 33:6,8 lifted
--    because the warning was given. Acts 18:6 is the same clearing in Paul's own mouth.
--  * Feed the flock (20:28): *feed the church of Elohim (God) which he hath purchased with his
--    own blood* — the true shepherd over the scattered flock (Ezekiel 34, Isaiah 40:11), the
--    charge the risen Master gave Peter (John 21:15-16) and Peter passed to the elders (1 Peter
--    5:2). The flock is the gathered seed; the overseers feed, they do not devour. The blood that
--    purchased is the Formed-one's own — Yahusha is Yahuah who came in the flesh.
--  * Grievous wolves (20:29-30): the false shepherds of Ezekiel 34:5 and Jeremiah 23:1 who
--    scattered the flock, and the ravening wolves in sheep's clothing the Master warned of
--    (Matthew 7:15). System-level — the shepherds who feed themselves — never an ethnic charge.
--  * Coveted no man's silver (20:33-34): *these hands have ministered unto my necessities* — the
--    shepherd not for filthy lucre; the Levite whose portion is Yahuah himself (Numbers 18:20),
--    the gospel preached without charge (1 Corinthians 9:18). NOT a freedom-from-Torah grace;
--    *the word of his grace* (20:32) builds up and gives the inheritance among the sanctified —
--    grace as the means of return and of the inheritance, never sola-fide truncation (Red Line #10).
--  * More blessed to give (20:35): the liberal soul made fat (Proverbs 11:25), the open hand of
--    Deuteronomy 15:10 — the Torah's own generosity, which the Lord Yahusha (Lord Jesus) names.
--
-- PER-CHAPTER LIBRARY-COVERAGE CHECKLIST (all three weighed for every block):
--  ACTS 20:
--   v.1-6   Macedonia/Greece/Troas travel  Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative/itinerary)
--   v.7     break bread, first day          Tanakh: none added (the sign at v.9-12 carries the block)  Extras: none warranted  NT: Acts 2:42 weighed (breaking of bread/doctrine) — narrative-echo, framework weight thin, not added
--   v.9-12  Eutychus falls, raised          Tanakh: 1 Kings 17:21, 2 Kings 4:34, 2 Kings 4:35  Extras: none warranted  NT: none warranted (the prophetic raisings carry it)
--   v.13-16 Assos/Miletus/haste to Pentecost Tanakh: none warranted  Extras: none warranted  NT: none warranted (itinerary; Shavuot carried in Acts 2 threads)
--   v.17-21 kept back nothing profitable    Tanakh: none warranted  Extras: none warranted  NT: none added (Acts 18:6/26:22 weighed; the clearing carried in the watchman thread)
--   v.22-25 bound in the spirit / no more   Tanakh: none warranted  Extras: none warranted  NT: none warranted (the gospel of the grace of Elohim carried at v.32)
--   v.26-27 pure from the blood of all men  Tanakh: Ezekiel 33:6, Ezekiel 33:8  Extras: none warranted  NT: Acts 18:6 (Acts<->Acts)
--   v.28    feed the flock, purchased blood Tanakh: Ezekiel 34:4, Isaiah 40:11  Extras: none warranted  NT: John 21:15, John 21:16, 1 Peter 5:2
--   v.29-31 grievous wolves enter in        Tanakh: Ezekiel 34:5, Jeremiah 23:1  Extras: none warranted  NT: Matthew 7:15
--   v.32    word of his grace / inheritance Tanakh: none added (Levite-inheritance carried in the silver thread)  Extras: none warranted  NT: none added (grace-as-means carried in prose, not a standalone target)
--   v.33-34 coveted no man's silver         Tanakh: Numbers 18:20  Extras: none warranted  NT: 1 Corinthians 9:18
--   v.35    more blessed to give            Tanakh: Proverbs 11:25, Deuteronomy 15:10  Extras: none warranted  NT: none added (the Master's saying is the Acts source itself)
--   v.36-38 kneeled, wept, accompanied      Tanakh: none warranted  Extras: none warranted  NT: none warranted (narrative farewell)
--
-- THREADS (slug -> target libraries):
--   5750 acts-20-his-life-is-in-him-the-young-man-raised-as-elijah-and-elisha-raised (Tanakh)
--   5753 acts-20-i-am-pure-from-the-blood-of-all-men-the-watchman-cleared           (Tanakh + NT, Acts<->Acts)
--   5756 acts-20-feed-the-flock-of-god-the-true-shepherd-over-the-scattered          (Tanakh + NT)
--   5759 acts-20-grievous-wolves-shall-enter-in-the-false-shepherds-that-scatter     (Tanakh + NT)
--   5762 acts-20-i-have-coveted-no-mans-silver-the-shepherd-not-for-filthy-lucre     (Tanakh + NT)
--   5765 acts-20-it-is-more-blessed-to-give-than-to-receive-the-liberal-soul         (Tanakh)
-- =====================================================================

CREATE TEMP VIEW _s217_a20_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: acts-20-his-life-is-in-him-the-young-man-raised-as-elijah-and-elisha-raised
  ('canon', 'acts', 20, 10, 'canon', '1-kings', 17, 21, 'free', E'*And he stretched himself upon the child three times, and cried unto Yahuah (LORD), and said, O Yahuah (LORD) my Elohim (God), I pray thee, let this child''s soul come into him again.* (1 Kings 17:21). When the young man Eutychus falls from the third loft and is taken up dead, *Paul went down, and fell on him, and embracing him said, Trouble not yourselves; for his life is in him* (Acts 20:10). It is Elijah''s very posture over the widow''s son — the prophet stretching himself upon the dead child and crying for the soul to return. The power that raised through Elijah raises through Paul, and the young man is brought alive.'),
  ('canon', 'acts', 20, 10, 'canon', '2-kings', 4, 34, 'free', E'*And he went up, and lay upon the child, and put his mouth upon his mouth, and his eyes upon his eyes, and his hands upon his hands: and he stretched himself upon the child; and the flesh of the child waxed warm.* (2 Kings 4:34). Paul *fell on him, and embracing him* (Acts 20:10) — the same close embrace Elisha laid upon the Shunammite''s dead son, body upon body, until the warmth of life returned. The prophets of old and the apostle now move in the one power of the Formed, who is the resurrection and the life.'),
  ('canon', 'acts', 20, 12, 'canon', '2-kings', 4, 35, 'free', E'*Then he returned, and walked in the house to and fro; and went up, and stretched himself upon him: and the child sneezed seven times, and the child opened his eyes.* (2 Kings 4:35). *And they brought the young man alive, and were not a little comforted* (Acts 20:12). As the Shunammite''s son opened his eyes and was given back to his mother, so the young man fallen from the loft is brought alive to the gathered assembly — the sign of life sealing the first-day breaking of bread.'),
  -- thread: acts-20-i-am-pure-from-the-blood-of-all-men-the-watchman-cleared
  ('canon', 'acts', 20, 26, 'canon', 'ezekiel', 33, 6, 'free', E'*But if the watchman see the sword come, and blow not the trumpet, and the people be not warned; if the sword come, and take any person from among them, he is taken away in his iniquity; but his blood will I require at the watchman''s hand.* (Ezekiel 33:6). Paul declares to the elders, *I take you to record this day, that I am pure from the blood of all men* (Acts 20:26). This is the watchman''s clearing: the trumpet was blown, the warning given, and so the blood is not required at his hand. The watchman who speaks delivers his own soul.'),
  ('canon', 'acts', 20, 27, 'canon', 'ezekiel', 33, 8, 'free', E'*When I say unto the wicked, O wicked man, thou shalt surely die; if thou dost not speak to warn the wicked from his way, that wicked man shall die in his iniquity; but his blood will I require at thine hand.* (Ezekiel 33:8). Paul gives the ground of his being pure from all blood: *For I have not shunned to declare unto you all the counsel of Elohim (God)* (Acts 20:27). The watchman of Ezekiel is charged to speak and warn; the one who does not shun to declare the whole counsel has met the charge and is clean of the blood Ezekiel''s watchman would otherwise bear.'),
  ('canon', 'acts', 20, 26, 'canon', 'acts', 18, 6, 'free', E'*And when they opposed themselves, and blasphemed, he shook his raiment, and said unto them, Your blood be upon your own heads; I am clean: from henceforth I will go unto the Gentiles.* (Acts 18:6). The same watchman''s clearing sounds twice in Paul''s mouth: at Corinth, *I am clean;* and now to the Ephesian elders, *I am pure from the blood of all men* (Acts 20:26). The trumpet was blown to the house of Yahudah (Judah) and to the scattered among the nations alike; where the warning is given and refused, the blood returns upon the hearers'' own heads, and the watchman is delivered.'),
  -- thread: acts-20-feed-the-flock-of-god-the-true-shepherd-over-the-scattered
  ('canon', 'acts', 20, 28, 'canon', 'ezekiel', 34, 4, 'free', E'*The diseased have ye not strengthened, neither have ye healed that which was sick, neither have ye bound up that which was broken, neither have ye brought again that which was driven away, neither have ye sought that which was lost; but with force and with cruelty have ye ruled them.* (Ezekiel 34:4). Paul charges the elders, *Take heed therefore unto yourselves, and to all the flock, over the which the Ruach HaKodesh (Holy Spirit) hath made you overseers, to feed the church of Elohim (God)* (Acts 20:28). Ezekiel arraigned the shepherds who would not strengthen, heal, or seek the lost; the overseers Paul appoints are charged to be the opposite — to feed the flock, to seek what was driven away, the scattered seed of the house of Yashar''el (Israel).'),
  ('canon', 'acts', 20, 28, 'canon', 'isaiah', 40, 11, 'free', E'*He shall feed his flock like a shepherd: he shall gather the lambs with his arm, and carry them in his bosom, and shall gently lead those that are with young.* (Isaiah 40:11). The overseers are made to *feed the church of Elohim (God), which he hath purchased with his own blood* (Acts 20:28). The pattern of all true feeding is the Shepherd of Isaiah who gathers the lambs in his arm and carries them in his bosom — the Formed-one who feeds his flock gently, whose own blood purchased them, the One the elders are to under-shepherd.'),
  ('canon', 'acts', 20, 28, 'canon', 'john', 21, 15, 'free', E'*So when they had dined, Yahusha (Jesus) saith to Simon Peter, Simon, son of Jonas, lovest thou me more than these? He saith unto him, Yea, Yahuah (Lord); thou knowest that I love thee. He saith unto him, Feed my lambs.* (John 21:15). The charge to *feed the church of Elohim (God)* (Acts 20:28) is the charge the risen Master first laid on Peter by the sea — *Feed my lambs.* The flock is the Master''s own, purchased with his own blood; the shepherds feed what is his, not what is theirs.'),
  ('canon', 'acts', 20, 28, 'canon', 'john', 21, 16, 'free', E'*He saith to him again the second time, Simon, son of Jonas, lovest thou me? He saith unto him, Yea, Yahuah (Lord); thou knowest that I love thee. He saith unto him, Feed my sheep.* (John 21:16). *Feed my sheep* the Master said to Peter; *feed the church of Elohim (God)* Paul now says to the elders (Acts 20:28). The one command passes from the Master to Peter to the overseers of every flock — to feed, never to devour, the sheep that are his by the price of his own blood.'),
  ('canon', 'acts', 20, 28, 'canon', '1-peter', 5, 2, 'free', E'*Feed the flock of Elohim (God) which is among you, taking the oversight thereof, not by constraint, but willingly; not for filthy lucre, but of a ready mind;* (1 Peter 5:2). Peter, who received *Feed my sheep* from the Master, writes the same charge to the elders that Paul gives at Miletus: *feed the church of Elohim (God)* (Acts 20:28). The oversight is willing, not for filthy lucre — the true shepherd over the gathered flock, set against the hireling who feeds himself.'),
  -- thread: acts-20-grievous-wolves-shall-enter-in-the-false-shepherds-that-scatter
  ('canon', 'acts', 20, 29, 'canon', 'ezekiel', 34, 5, 'free', E'*And they were scattered, because there is no shepherd: and they became meat to all the beasts of the field, when they were scattered.* (Ezekiel 34:5). Paul warns, *after my departing shall grievous wolves enter in among you, not sparing the flock* (Acts 20:29). It is the very danger Ezekiel named — the flock without a true shepherd becomes meat to the beasts of the field, scattered. The grievous wolves are the false shepherds and the beasts in one; the warning is the watchman''s, that the gathered not be torn and scattered again.'),
  ('canon', 'acts', 20, 30, 'canon', 'jeremiah', 23, 1, 'free', E'*Woe be unto the pastors that destroy and scatter the sheep of my pasture! saith Yahuah (LORD).* (Jeremiah 23:1). *Also of your own selves shall men arise, speaking perverse things, to draw away disciples after them* (Acts 20:30). Jeremiah pronounced woe on the pastors who scatter the sheep of Yahuah''s (LORD''s) pasture; Paul foresees the same rising from within — shepherds who draw the flock after themselves rather than after the Master, the destroyers Jeremiah cried woe upon.'),
  ('canon', 'acts', 20, 29, 'canon', 'matthew', 7, 15, 'free', E'*Beware of false prophets, which come to you in sheep''s clothing, but inwardly they are ravening wolves.* (Matthew 7:15). *Grievous wolves enter in among you, not sparing the flock* (Acts 20:29) — the Master had warned of exactly these, the wolves in sheep''s clothing whose inward nature is to ravage. Paul tells the elders to watch, for the wolves come disguised among the sheep, and the shepherd''s charge is to know them and guard the flock.'),
  -- thread: acts-20-i-have-coveted-no-mans-silver-the-shepherd-not-for-filthy-lucre
  ('canon', 'acts', 20, 33, 'canon', 'numbers', 18, 20, 'free', E'*And Yahuah (LORD) spake unto Aaron, Thou shalt have no inheritance in their land, neither shalt thou have any part among them: I am thy part and thine inheritance among the children of Yashar''el (Israel).* (Numbers 18:20). *I have coveted no man''s silver, or gold, or apparel* (Acts 20:33), Paul says, for *these hands have ministered unto my necessities* (Acts 20:34). It is the Levite''s portion: the one who serves the house takes no inheritance of silver and gold among the people, because Yahuah (LORD) himself is his part. The true shepherd''s reward is not lucre but the One he serves.'),
  ('canon', 'acts', 20, 34, 'canon', '1-corinthians', 9, 18, 'free', E'*What is my reward then? Verily that, when I preach the gospel, I may make the gospel of Messiah (Christ) without charge, that I abuse not my power in the gospel.* (1 Corinthians 9:18). *These hands have ministered unto my necessities, and to them that were with me* (Acts 20:34). Paul names elsewhere what his laboring hands declare here: the gospel preached without charge, no silver coveted, no power abused — the shepherd who will not make merchandise of the flock, set against the wolves who do not spare it.'),
  -- thread: acts-20-it-is-more-blessed-to-give-than-to-receive-the-liberal-soul
  ('canon', 'acts', 20, 35, 'canon', 'proverbs', 11, 25, 'free', E'*The liberal soul shall be made fat: and he that watereth shall be watered also himself.* (Proverbs 11:25). Paul closes with the Master''s own saying: *I have shewed you all things, how that so labouring ye ought to support the weak, and to remember the words of the Lord Yahusha (Lord Jesus), how he said, It is more blessed to give than to receive* (Acts 20:35). The proverb already taught it — the open, liberal soul is itself made fat, and the one who waters is watered. The Lord Yahusha (Lord Jesus) names the Torah''s own wisdom: the blessing falls on the giving hand.'),
  ('canon', 'acts', 20, 35, 'canon', 'deuteronomy', 15, 10, 'free', E'*Thou shalt surely give him, and thine heart shall not be grieved when thou givest unto him: because that for this thing Yahuah Elohayka (the LORD thy God) shall bless thee in all thy works, and in all that thou puttest thine hand unto.* (Deuteronomy 15:10). *It is more blessed to give than to receive* (Acts 20:35). The Master''s word is no new thing but the Torah''s own: Moses commanded the open hand to the poor brother and bound the blessing of Yahuah Elohayka (the LORD thy God) to the giving. To give is to be blessed in all the works of the hand — the very thing the Lord Yahusha (Lord Jesus) declares.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _s217_a20_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _s217_a20_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-20-his-life-is-in-him-the-young-man-raised-as-elijah-and-elisha-raised',
       E'His life is in him — the young man raised as Elijah and Elisha raised',
       E'On the first day of the week the disciples gather at Troas to break bread, and Paul preaches until midnight. A young man named Eutychus, *being fallen into a deep sleep … fell down from the third loft, and was taken up dead* (Acts 20:9). Then *Paul went down, and fell on him, and embracing him said, Trouble not yourselves; for his life is in him* (Acts 20:10). The posture is the prophets'' own. Elijah, over the widow''s dead son, *stretched himself upon the child three times, and cried unto Yahuah (LORD) … let this child''s soul come into him again* (1 Kings 17:21). Elisha, over the Shunammite''s dead son, *went up, and lay upon the child, and put his mouth upon his mouth … and the flesh of the child waxed warm* (2 Kings 4:34), until *the child sneezed seven times, and the child opened his eyes* (2 Kings 4:35). The same power that raised through Elijah and Elisha raises through the apostle: *they brought the young man alive, and were not a little comforted* (Acts 20:12). The sign of life seals the breaking of bread — the Formed-one, who is the resurrection, moving through his servants as he moved through the prophets of old.',
       sv.verse_id, ev.verse_id, 'free', 5750
  FROM _s217_a20_lookup sv, _s217_a20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=9
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=20 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-20-i-am-pure-from-the-blood-of-all-men-the-watchman-cleared',
       E'I am pure from the blood of all men — the watchman cleared',
       E'Paul takes the Ephesian elders to record: *I am pure from the blood of all men. For I have not shunned to declare unto you all the counsel of Elohim (God)* (Acts 20:26-27). This is the watchman''s clearing, spoken in the very terms Yahuah (LORD) gave Ezekiel. The watchman is set over the house of Yashar''el (Israel) to blow the trumpet; *if the watchman see the sword come, and blow not the trumpet … his blood will I require at the watchman''s hand* (Ezekiel 33:6), and *if thou dost not speak to warn the wicked from his way, that wicked man shall die in his iniquity; but his blood will I require at thine hand* (Ezekiel 33:8). The one who warns delivers his own soul; the one who stays silent bears the blood. Paul has blown the trumpet — declared the whole counsel, shunned nothing — and so he is clean. He had said it once before, at Corinth: *Your blood be upon your own heads; I am clean* (Acts 18:6). The warning was given to the house of Yahudah (Judah) and to the scattered among the nations alike; where it is refused, the blood returns upon the hearers'' own heads, and the watchman is delivered.',
       sv.verse_id, ev.verse_id, 'free', 5753
  FROM _s217_a20_lookup sv, _s217_a20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=26
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=20 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-20-feed-the-flock-of-god-the-true-shepherd-over-the-scattered',
       E'Feed the flock of Elohim (God) — the true shepherd over the scattered',
       E'*Take heed therefore unto yourselves, and to all the flock, over the which the Ruach HaKodesh (Holy Spirit) hath made you overseers, to feed the church of Elohim (God), which he hath purchased with his own blood* (Acts 20:28). The charge stands against the long arraignment of the false shepherds. Ezekiel indicted those who *have ye not strengthened … neither have ye brought again that which was driven away, neither have ye sought that which was lost* (Ezekiel 34:4); the overseers Paul appoints are to be their opposite, to seek the driven-away and feed the lost — the scattered seed of the house of Yashar''el (Israel). The pattern of all true feeding is the Shepherd himself: *He shall feed his flock like a shepherd: he shall gather the lambs with his arm, and carry them in his bosom* (Isaiah 40:11). And the charge is the one the risen Master first laid on Peter by the sea — *Feed my lambs* (John 21:15), *Feed my sheep* (John 21:16) — which Peter then passed to the elders: *Feed the flock of Elohim (God) which is among you … not for filthy lucre, but of a ready mind* (1 Peter 5:2). The flock is the Master''s own, *purchased with his own blood* — the Formed-one who is Yahuah come in the flesh — and the shepherds feed what is his, never devour it.',
       sv.verse_id, ev.verse_id, 'free', 5756
  FROM _s217_a20_lookup sv, _s217_a20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=28
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=20 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-20-grievous-wolves-shall-enter-in-the-false-shepherds-that-scatter',
       E'Grievous wolves shall enter in — the false shepherds that scatter',
       E'*For I know this, that after my departing shall grievous wolves enter in among you, not sparing the flock. Also of your own selves shall men arise, speaking perverse things, to draw away disciples after them* (Acts 20:29-30). Paul names the danger the prophets named. Ezekiel saw the flock left without a true shepherd: *they were scattered, because there is no shepherd: and they became meat to all the beasts of the field, when they were scattered* (Ezekiel 34:5). Jeremiah cried woe upon them: *Woe be unto the pastors that destroy and scatter the sheep of my pasture! saith Yahuah (LORD)* (Jeremiah 23:1). And the Master had warned of the very disguise the wolves wear: *Beware of false prophets, which come to you in sheep''s clothing, but inwardly they are ravening wolves* (Matthew 7:15). The threat is not the flock''s ethnicity but the shepherds'' heart — those who feed themselves, who draw the sheep after themselves rather than after the Master, who scatter what was gathered. The watchman''s charge is to know them and guard the flock, that the gathered seed not be torn and scattered again.',
       sv.verse_id, ev.verse_id, 'free', 5759
  FROM _s217_a20_lookup sv, _s217_a20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=29
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=20 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-20-i-have-coveted-no-mans-silver-the-shepherd-not-for-filthy-lucre',
       E'I have coveted no man''s silver — the shepherd not for filthy lucre',
       E'*I have coveted no man''s silver, or gold, or apparel. Yea, ye yourselves know, that these hands have ministered unto my necessities, and to them that were with me* (Acts 20:33-34). The shepherd who feeds the flock takes nothing of it for lucre — and the ground of it is the Levite''s portion. Yahuah (LORD) said to Aaron, *Thou shalt have no inheritance in their land, neither shalt thou have any part among them: I am thy part and thine inheritance among the children of Yashar''el (Israel)* (Numbers 18:20). The one who serves the house has no silver-and-gold inheritance among the people, because Yahuah (LORD) himself is his part. So Paul, who could have claimed support, labored with his own hands: *when I preach the gospel, I may make the gospel of Messiah (Christ) without charge, that I abuse not my power in the gospel* (1 Corinthians 9:18). This is the seam where the grace Paul commends is rightly read — *I commend you to Elohim (God), and to the word of his grace, which is able to build you up, and to give you an inheritance among all them which are sanctified* (Acts 20:32). The grace is the means of the building-up and of the inheritance among the sanctified — never a release from the commandments, and never a cloak for the wolves who do not spare the flock. The true shepherd''s reward is not lucre but the One he serves.',
       sv.verse_id, ev.verse_id, 'free', 5762
  FROM _s217_a20_lookup sv, _s217_a20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=32
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=20 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'acts-20-it-is-more-blessed-to-give-than-to-receive-the-liberal-soul',
       E'It is more blessed to give than to receive — the liberal soul',
       E'Paul closes the charge with the Master''s own word: *I have shewed you all things, how that so labouring ye ought to support the weak, and to remember the words of the Lord Yahusha (Lord Jesus), how he said, It is more blessed to give than to receive* (Acts 20:35). The saying is no new thing — it is the Torah''s own wisdom and the proverb''s. *The liberal soul shall be made fat: and he that watereth shall be watered also himself* (Proverbs 11:25): the open hand is itself the hand that is filled. And Moses bound the blessing to the giving long before: *Thou shalt surely give him, and thine heart shall not be grieved when thou givest unto him: because that for this thing Yahuah Elohayka (the LORD thy God) shall bless thee in all thy works, and in all that thou puttest thine hand unto* (Deuteronomy 15:10). The Lord Yahusha (Lord Jesus) speaks the heart of the commandment: the blessing falls on the giving hand, not the grasping one. The shepherd who coveted no man''s silver lives the very word he leaves them — to labor, to support the weak, and to find that it is more blessed to give.',
       sv.verse_id, ev.verse_id, 'free', 5765
  FROM _s217_a20_lookup sv, _s217_a20_lookup ev
 WHERE sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=35
   AND ev.edition_slug='canon' AND ev.book_slug='acts' AND ev.chapter_number=20 AND ev.verse_number=35
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: acts-20-his-life-is-in-him-the-young-man-raised-as-elijah-and-elisha-raised
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Kings 17:21 — *he stretched himself upon the child three times … let this child''s soul come into him again* Elijah''s posture over the widow''s son, the same as Paul falling on Eutychus (Acts 20:10).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-his-life-is-in-him-the-young-man-raised-as-elijah-and-elisha-raised'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='1-kings' AND tv.chapter_number=17 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kings 4:34 — *he … lay upon the child … and the flesh of the child waxed warm* Elisha''s close embrace over the Shunammite''s son, mirrored in Paul embracing Eutychus (Acts 20:10).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-his-life-is-in-him-the-young-man-raised-as-elijah-and-elisha-raised'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=4 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Kings 4:35 — *the child sneezed seven times, and the child opened his eyes* the Shunammite''s son given back alive, as the young man is brought alive (Acts 20:12).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-his-life-is-in-him-the-young-man-raised-as-elijah-and-elisha-raised'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=4 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-20-i-am-pure-from-the-blood-of-all-men-the-watchman-cleared
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 33:6 — *if the watchman … blow not the trumpet … his blood will I require at the watchman''s hand* the blood-guilt Paul is cleared of by warning (Acts 20:26).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-i-am-pure-from-the-blood-of-all-men-the-watchman-cleared'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=33 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezekiel 33:8 — *if thou dost not speak to warn the wicked … his blood will I require at thine hand* the watchman delivered by declaring the whole counsel (Acts 20:27).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-i-am-pure-from-the-blood-of-all-men-the-watchman-cleared'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=33 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Acts 18:6 — *Your blood be upon your own heads; I am clean* the same watchman''s clearing in Paul''s mouth at Corinth (Acts 20:26).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-i-am-pure-from-the-blood-of-all-men-the-watchman-cleared'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='acts' AND tv.chapter_number=18 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-20-feed-the-flock-of-god-the-true-shepherd-over-the-scattered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 34:4 — *neither have ye brought again that which was driven away, neither have ye sought that which was lost* the false shepherds the overseers must be the opposite of (Acts 20:28).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-feed-the-flock-of-god-the-true-shepherd-over-the-scattered'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 40:11 — *He shall feed his flock like a shepherd: he shall gather the lambs with his arm* the Shepherd whose feeding the overseers under-shepherd (Acts 20:28).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-feed-the-flock-of-god-the-true-shepherd-over-the-scattered'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=40 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 21:15 — *Feed my lambs* the charge the risen Master first laid on Peter, now given to the elders (Acts 20:28).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-feed-the-flock-of-god-the-true-shepherd-over-the-scattered'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=21 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'John 21:16 — *Feed my sheep* the Master''s command passing to the overseers of the flock (Acts 20:28).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-feed-the-flock-of-god-the-true-shepherd-over-the-scattered'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=21 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'1 Peter 5:2 — *Feed the flock of Elohim (God) … not for filthy lucre, but of a ready mind* Peter passing the Master''s charge to the elders, as Paul does (Acts 20:28).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-feed-the-flock-of-god-the-true-shepherd-over-the-scattered'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='1-peter' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-20-grievous-wolves-shall-enter-in-the-false-shepherds-that-scatter
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 34:5 — *they were scattered, because there is no shepherd: and they became meat to all the beasts of the field* the flock torn when the wolves enter (Acts 20:29).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-grievous-wolves-shall-enter-in-the-false-shepherds-that-scatter'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=34 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 23:1 — *Woe be unto the pastors that destroy and scatter the sheep of my pasture* the men arising from within who draw disciples after them (Acts 20:30).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-grievous-wolves-shall-enter-in-the-false-shepherds-that-scatter'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=23 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 7:15 — *false prophets, which come to you in sheep''s clothing, but inwardly they are ravening wolves* the disguise of the grievous wolves Paul warns of (Acts 20:29).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-grievous-wolves-shall-enter-in-the-false-shepherds-that-scatter'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=29
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=7 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-20-i-have-coveted-no-mans-silver-the-shepherd-not-for-filthy-lucre
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 18:20 — *I am thy part and thine inheritance among the children of Yashar''el (Israel)* the Levite''s portion; the shepherd who covets no silver because Yahuah is his part (Acts 20:33).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-i-have-coveted-no-mans-silver-the-shepherd-not-for-filthy-lucre'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=18 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Corinthians 9:18 — *I may make the gospel of Messiah (Christ) without charge* the laboring hands that abuse no power, ministering to his own necessities (Acts 20:34).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-i-have-coveted-no-mans-silver-the-shepherd-not-for-filthy-lucre'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=34
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=9 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: acts-20-it-is-more-blessed-to-give-than-to-receive-the-liberal-soul
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 11:25 — *The liberal soul shall be made fat: and he that watereth shall be watered also himself* the proverb behind the Master''s saying that giving is blessed (Acts 20:35).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-it-is-more-blessed-to-give-than-to-receive-the-liberal-soul'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=25
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 15:10 — *Thou shalt surely give him … Yahuah Elohayka (the LORD thy God) shall bless thee in all thy works* the Torah''s open hand the Master''s word expresses (Acts 20:35).'
  FROM cross_reference_threads t, cross_references x, _s217_a20_lookup sv, _s217_a20_lookup tv
 WHERE t.slug='acts-20-it-is-more-blessed-to-give-than-to-receive-the-liberal-soul'
   AND sv.edition_slug='canon' AND sv.book_slug='acts' AND sv.chapter_number=20 AND sv.verse_number=35
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=15 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;
