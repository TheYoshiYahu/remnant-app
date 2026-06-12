-- ----- fragment: minion_1maccabees_06.sql (session253 1-maccabees 6) -----
-- Source anchor: apocrypha/1-maccabees ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1mac6 (view _session253_1mac6_lookup). Sort band base 61625, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1mac6_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-maccabees-6-fall-of-the-proud-king
  ('apocrypha', '1-maccabees', 6, 8, 'canon', 'isaiah', 14, 11, 'free', E'Isaiah 14:11 — *Thy pomp is brought down to the grave, and the noise of thy viols: the worm is spread under thee, and the worms cover thee.* The taunt over the fallen king of Babylon is the dirge for Antiochus, who laid him down upon his bed and fell sick for grief in 1 Maccabees 6:8.'),
  ('apocrypha', '1-maccabees', 6, 13, 'canon', 'isaiah', 14, 13, 'free', E'Isaiah 14:13 — *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation, in the sides of the north.* The pride that exalted itself above Elohim is exactly what Antiochus now confesses brought his troubles upon him in 1 Maccabees 6:13.'),
  ('apocrypha', '1-maccabees', 6, 13, 'canon', 'proverbs', 16, 18, 'free', E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* The proverb states the law that Antiochus learns on his deathbed as he perishes through great grief in a strange land in 1 Maccabees 6:13.'),
  ('apocrypha', '1-maccabees', 6, 12, 'canon', 'daniel', 11, 36, 'free', E'Daniel 11:36 — *And the king shall do according to his will; and he shall exalt himself, and magnify himself above every god, and shall speak marvellous things against the Elohim (God) of gods, and shall prosper till the indignation be accomplished: for that that is determined shall be done.* Daniel foresaw this very king whose blasphemies against the sanctuary Antiochus now remembers with dread in 1 Maccabees 6:12.'),
  ('apocrypha', '1-maccabees', 6, 9, 'apocrypha', '2-maccabees', 9, 5, 'extras', E'2 Maccabees 9:5 — *But Yahuah (God) Almighty, Yahuah (God) of Yashar''el (Israel), struck him with an incurable and invisible plague: or as soon as he had spoken these words, a pain of the bowels that was remediless came upon him, and sore torments of the inner parts.* The sister book names the heaven-sent stroke behind the grief that wasted Antiochus many days until he made account that he should die in 1 Maccabees 6:9.'),
  -- thread: 1-maccabees-6-the-abomination-pulled-down
  ('apocrypha', '1-maccabees', 6, 7, 'canon', 'daniel', 11, 37, 'free', E'Daniel 11:37 — *Neither shall he regard the Elohim (God) of his fathers, nor the desire of women, nor regard any god: for he shall magnify himself above all.* This is the very king who set up the abomination upon the altar that Yahudah''s people have now pulled down in 1 Maccabees 6:7.'),
  ('apocrypha', '1-maccabees', 6, 13, 'canon', 'daniel', 11, 45, 'free', E'Daniel 11:45 — *And he shall plant the tabernacles of his palace between the seas in the glorious holy mountain; yet he shall come to his end, and none shall help him.* The decreed end of the abomination-builder is precisely the lonely death in a strange land that Antiochus foresees for himself in 1 Maccabees 6:13.'),
  ('apocrypha', '1-maccabees', 6, 12, 'canon', 'psalms', 73, 18, 'free', E'Psalm 73:18 — *Surely thou didst set them in slippery places: thou castedst them down into destruction.* The psalmist''s vision of the end of the proud is fulfilled as Antiochus remembers the evils he did at Jerusalem and watches them come back upon his own head in 1 Maccabees 6:12.'),
  -- thread: 1-maccabees-6-sabbath-of-the-land
  ('apocrypha', '1-maccabees', 6, 53, 'canon', 'leviticus', 25, 4, 'free', E'Leviticus 25:4 — *But in the seventh year shall be a sabbath of rest unto the land, a sabbath for Yahuah (LORD): thou shalt neither sow thy field, nor prune thy vineyard.* The very commandment the defenders kept is why it was the seventh year and their store was spent in 1 Maccabees 6:53.'),
  ('apocrypha', '1-maccabees', 6, 49, 'canon', 'leviticus', 25, 20, 'free', E'Leviticus 25:20 — *And if ye shall say, What shall we eat the seventh year? behold, we shall not sow, nor gather in our increase.* The anxious question Yahuah anticipates is the exact plight of Bethsura, with no victuals to endure the siege because it was a year of rest to the land in 1 Maccabees 6:49.'),
  ('apocrypha', '1-maccabees', 6, 49, 'canon', 'leviticus', 25, 21, 'free', E'Leviticus 25:21 — *Then I will command my blessing upon you in the sixth year, and it shall bring forth fruit for three years.* The promise attached to the land-sabbath is the trust the faithful were exercising even as the famine pressed them in 1 Maccabees 6:49.'),
  ('apocrypha', '1-maccabees', 6, 54, 'canon', 'exodus', 23, 11, 'free', E'Exodus 23:11 — *But the seventh year thou shalt let it rest and lie still; that the poor of thy people may eat: and what they leave the beasts of the field shall eat. In like manner thou shalt deal with thy vineyard, and with thy oliveyard.* The Torah''s repeated sabbath-of-the-land is the law the few left in the sanctuary honoured though the famine scattered them in 1 Maccabees 6:54.'),
  -- thread: 1-maccabees-6-eleazar-better-resurrection
  ('apocrypha', '1-maccabees', 6, 44, 'canon', 'hebrews', 11, 35, 'free', E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection.* The faith chapter points back to the Maccabean martyrs, naming the better resurrection that crowns the perpetual name Eleazar sought when he gave his life for his people in 1 Maccabees 6:44.'),
  ('apocrypha', '1-maccabees', 6, 46, 'apocrypha', '2-maccabees', 7, 9, 'extras', E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The sister book voices the hope that makes sense of Eleazar''s death under the elephant for his people''s deliverance in 1 Maccabees 6:46.'),
  ('apocrypha', '1-maccabees', 6, 44, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The resurrection of the dust is the perpetual name Eleazar truly secured when he put himself in jeopardy to deliver his people in 1 Maccabees 6:44.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1mac6_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1mac6_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-6-fall-of-the-proud-king',
       E'The proud king brought down — Antiochus dies of grief',
       E'The blasphemer who exalted himself against Yahuah''s sanctuary is broken on his bed: *Now when the king heard these words, he was astonished and sore moved: whereupon he laid him down upon his bed, and fell sick for grief, because it had not befallen him as he looked for* (1 Maccabees 6:8), and *I perceive therefore that for this cause these troubles are come upon me, and, behold, I perish through great grief in a strange land* (1 Maccabees 6:13). This is the ancient pattern of the kingdom-of-man that lifts its throne above Elohim and is cast down. Isaiah sang it over Babylon''s king: *Thy pomp is brought down to the grave, and the noise of thy viols: the worm is spread under thee, and the worms cover thee* (Isaiah 14:11), the same one who said *I will ascend into heaven, I will exalt my throne above the stars of Elohim (God)* (Isaiah 14:13). The proverb names the law of it plainly — *Pride goeth before destruction, and an haughty spirit before a fall* (Proverbs 16:18). Daniel had already seen this very king in the spirit, the one who *shall exalt himself, and magnify himself above every god, and shall speak marvellous things against the Elohim (God) of gods* (Daniel 11:36); and the sister book records the same hand of judgment falling — *But Yahuah (God) Almighty, Yahuah (God) of Yashar''el (Israel), struck him with an incurable and invisible plague* (2 Maccabees 9:5). The antichrist system always ends here.',
       sv.verse_id, ev.verse_id, 'extras', 61625
  FROM _session253_1mac6_lookup sv, _session253_1mac6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=6 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-6-the-abomination-pulled-down',
       E'The abomination torn down — the man-system undone',
       E'The good news that breaks the tyrant is that the defilement is gone: *Also that they had pulled down the abomination, which he had set up upon the altar in Jerusalem, and that they had compassed about the sanctuary with high walls, as before* (1 Maccabees 6:7), and the king himself confesses, *But now I remember the evils that I did at Jerusalem, and that I took all the vessels of gold and silver that were in it, and sent to destroy the inhabitants of Judea without a cause* (1 Maccabees 6:12). This is the abomination of desolation, the kingdom-of-man enthroned in Yahuah''s holy place. Daniel named the man who builds it — *Neither shall he regard the Elohim (God) of his fathers, nor the desire of women, nor regard any god: for he shall magnify himself above all* (Daniel 11:37) — and named his end: *yet he shall come to his end, and none shall help him* (Daniel 11:45). The psalmist had seen the whole arc from the sanctuary: *Surely thou didst set them in slippery places: thou castedst them down into destruction* (Psalm 73:18). The covenant people do not negotiate with the abomination; they pull it down.',
       sv.verse_id, ev.verse_id, 'extras', 61628
  FROM _session253_1mac6_lookup sv, _session253_1mac6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=6 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-6-sabbath-of-the-land',
       E'The sabbath-year famine — keeping Torah unto hunger',
       E'The faithful in the sanctuary starve rather than break the land-sabbath: *Yet at the last, their vessels being without victuals, (for that it was the seventh year, and they in Judea that were delivered from the Gentiles, had eaten up the residue of the store;)* (1 Maccabees 6:53), so that *the famine did so prevail against them, that they were fain to disperse themselves, every man to his own place* (1 Maccabees 6:54). Even besieged, they kept the commandment — *But in the seventh year shall be a sabbath of rest unto the land, a sabbath for Yahuah (LORD): thou shalt neither sow thy field, nor prune thy vineyard* (Leviticus 25:4), and *the seventh year thou shalt let it rest and lie still; that the poor of thy people may eat* (Exodus 23:11). This is never law-as-curse; it is covenant faithfulness leaning on a promise. Yahuah Himself answered the anxious question they were living out — *And if ye shall say, What shall we eat the seventh year? behold, we shall not sow, nor gather in our increase* (Leviticus 25:20) — with *Then I will command my blessing upon you in the sixth year, and it shall bring forth fruit for three years* (Leviticus 25:21). The remnant keeps Torah and trusts the Provider.',
       sv.verse_id, ev.verse_id, 'extras', 61631
  FROM _session253_1mac6_lookup sv, _session253_1mac6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=49
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=6 AND ev.verse_number=54
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-6-eleazar-better-resurrection',
       E'Eleazar lays down his life — the better resurrection',
       E'One man spends his life for his people and a name that outlasts death: *Eleazar also, surnamed Savaran, perceiving that one of the beasts, armed with royal harness, was higher than all the rest, and supposing that the king was upon him* (1 Maccabees 6:43), *put himself in jeopardy, to the end he might deliver his people, and get him a perpetual name* (1 Maccabees 6:44), and *he crept under the elephant, and thrust him under, and slew him: whereupon the elephant fell down upon him, and there he died* (1 Maccabees 6:46). The hope underwriting such a death is resurrection. The sister book gives the words of the martyred brother — *You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life* (2 Maccabees 7:9). Daniel had promised it — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt* (Daniel 12:2) — and Hebrews points straight back to these very Maccabean sufferers — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection* (Hebrews 11:35). The perpetual name Eleazar sought is kept in the resurrection of the just.',
       sv.verse_id, ev.verse_id, 'extras', 61634
  FROM _session253_1mac6_lookup sv, _session253_1mac6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=43
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=6 AND ev.verse_number=46
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-maccabees-6-fall-of-the-proud-king
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 14:11 — *Thy pomp is brought down to the grave, and the noise of thy viols: the worm is spread under thee, and the worms cover thee.* The taunt over the fallen king of Babylon is the dirge for Antiochus, who laid him down upon his bed and fell sick for grief in 1 Maccabees 6:8.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac6_lookup sv, _session253_1mac6_lookup tv
 WHERE t.slug='1-maccabees-6-fall-of-the-proud-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 14:13 — *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation, in the sides of the north.* The pride that exalted itself above Elohim is exactly what Antiochus now confesses brought his troubles upon him in 1 Maccabees 6:13.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac6_lookup sv, _session253_1mac6_lookup tv
 WHERE t.slug='1-maccabees-6-fall-of-the-proud-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 16:18 — *Pride goeth before destruction, and an haughty spirit before a fall.* The proverb states the law that Antiochus learns on his deathbed as he perishes through great grief in a strange land in 1 Maccabees 6:13.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac6_lookup sv, _session253_1mac6_lookup tv
 WHERE t.slug='1-maccabees-6-fall-of-the-proud-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=16 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 11:36 — *And the king shall do according to his will; and he shall exalt himself, and magnify himself above every god, and shall speak marvellous things against the Elohim (God) of gods, and shall prosper till the indignation be accomplished: for that that is determined shall be done.* Daniel foresaw this very king whose blasphemies against the sanctuary Antiochus now remembers with dread in 1 Maccabees 6:12.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac6_lookup sv, _session253_1mac6_lookup tv
 WHERE t.slug='1-maccabees-6-fall-of-the-proud-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 5, E'2 Maccabees 9:5 — *But Yahuah (God) Almighty, Yahuah (God) of Yashar''el (Israel), struck him with an incurable and invisible plague: or as soon as he had spoken these words, a pain of the bowels that was remediless came upon him, and sore torments of the inner parts.* The sister book names the heaven-sent stroke behind the grief that wasted Antiochus many days until he made account that he should die in 1 Maccabees 6:9.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac6_lookup sv, _session253_1mac6_lookup tv
 WHERE t.slug='1-maccabees-6-fall-of-the-proud-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=9
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=9 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-6-the-abomination-pulled-down
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 11:37 — *Neither shall he regard the Elohim (God) of his fathers, nor the desire of women, nor regard any god: for he shall magnify himself above all.* This is the very king who set up the abomination upon the altar that Yahudah''s people have now pulled down in 1 Maccabees 6:7.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac6_lookup sv, _session253_1mac6_lookup tv
 WHERE t.slug='1-maccabees-6-the-abomination-pulled-down'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 11:45 — *And he shall plant the tabernacles of his palace between the seas in the glorious holy mountain; yet he shall come to his end, and none shall help him.* The decreed end of the abomination-builder is precisely the lonely death in a strange land that Antiochus foresees for himself in 1 Maccabees 6:13.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac6_lookup sv, _session253_1mac6_lookup tv
 WHERE t.slug='1-maccabees-6-the-abomination-pulled-down'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 73:18 — *Surely thou didst set them in slippery places: thou castedst them down into destruction.* The psalmist''s vision of the end of the proud is fulfilled as Antiochus remembers the evils he did at Jerusalem and watches them come back upon his own head in 1 Maccabees 6:12.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac6_lookup sv, _session253_1mac6_lookup tv
 WHERE t.slug='1-maccabees-6-the-abomination-pulled-down'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=73 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-6-sabbath-of-the-land
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 25:4 — *But in the seventh year shall be a sabbath of rest unto the land, a sabbath for Yahuah (LORD): thou shalt neither sow thy field, nor prune thy vineyard.* The very commandment the defenders kept is why it was the seventh year and their store was spent in 1 Maccabees 6:53.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac6_lookup sv, _session253_1mac6_lookup tv
 WHERE t.slug='1-maccabees-6-sabbath-of-the-land'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=53
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=25 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 25:20 — *And if ye shall say, What shall we eat the seventh year? behold, we shall not sow, nor gather in our increase.* The anxious question Yahuah anticipates is the exact plight of Bethsura, with no victuals to endure the siege because it was a year of rest to the land in 1 Maccabees 6:49.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac6_lookup sv, _session253_1mac6_lookup tv
 WHERE t.slug='1-maccabees-6-sabbath-of-the-land'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=25 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 25:21 — *Then I will command my blessing upon you in the sixth year, and it shall bring forth fruit for three years.* The promise attached to the land-sabbath is the trust the faithful were exercising even as the famine pressed them in 1 Maccabees 6:49.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac6_lookup sv, _session253_1mac6_lookup tv
 WHERE t.slug='1-maccabees-6-sabbath-of-the-land'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=49
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=25 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Exodus 23:11 — *But the seventh year thou shalt let it rest and lie still; that the poor of thy people may eat: and what they leave the beasts of the field shall eat. In like manner thou shalt deal with thy vineyard, and with thy oliveyard.* The Torah''s repeated sabbath-of-the-land is the law the few left in the sanctuary honoured though the famine scattered them in 1 Maccabees 6:54.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac6_lookup sv, _session253_1mac6_lookup tv
 WHERE t.slug='1-maccabees-6-sabbath-of-the-land'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=54
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=23 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-6-eleazar-better-resurrection
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection.* The faith chapter points back to the Maccabean martyrs, naming the better resurrection that crowns the perpetual name Eleazar sought when he gave his life for his people in 1 Maccabees 6:44.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac6_lookup sv, _session253_1mac6_lookup tv
 WHERE t.slug='1-maccabees-6-eleazar-better-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The sister book voices the hope that makes sense of Eleazar''s death under the elephant for his people''s deliverance in 1 Maccabees 6:46.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac6_lookup sv, _session253_1mac6_lookup tv
 WHERE t.slug='1-maccabees-6-eleazar-better-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=46
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The resurrection of the dust is the perpetual name Eleazar truly secured when he put himself in jeopardy to deliver his people in 1 Maccabees 6:44.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac6_lookup sv, _session253_1mac6_lookup tv
 WHERE t.slug='1-maccabees-6-eleazar-better-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=6 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

