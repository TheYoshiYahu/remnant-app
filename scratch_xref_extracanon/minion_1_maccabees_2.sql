-- ----- fragment: minion_1maccabees_02.sql (session253 1-maccabees 2) -----
-- Source anchor: apocrypha/1-maccabees ch2. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1mac2 (view _session253_1mac2_lookup). Sort band base 61525, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1mac2_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-maccabees-2-sanctuary-profaned
  ('apocrypha', '1-maccabees', 2, 12, 'apocrypha', '1-maccabees', 1, 54, 'extras', E'1 Maccabees 1:54 — *Now the fifteenth day of the month Casleu, in the hundred forty and fifth year, they set up the abomination of desolation upon the altar, and builded idol altars throughout the cities of Juda on every side;* This is the very profaning Mattathias mourns when he cries that the sanctuary is laid waste in 1 Maccabees 2:12.'),
  ('apocrypha', '1-maccabees', 2, 12, 'canon', 'daniel', 11, 31, 'free', E'Daniel 11:31 — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* Daniel foretold the polluting of the holy place that 1 Maccabees 2:12 sees come to pass under Antiochus.'),
  ('apocrypha', '1-maccabees', 2, 12, 'canon', 'matthew', 24, 15, 'free', E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The Messiah names the same desolating abomination as still to come, the antichrist pattern Mattathias already grieves in 1 Maccabees 2:12.'),
  -- thread: 1-maccabees-2-zeal-of-phinehas
  ('apocrypha', '1-maccabees', 2, 26, 'canon', 'numbers', 25, 7, 'free', E'Numbers 25:7 — *And when Phinehas, the son of Eleazar, the son of Aaron the priest, saw it, he rose up from among the congregation, and took a javelin in his hand;* This is the deed 1 Maccabees 2:26 names as the very pattern of Mattathias'' zeal upon the altar.'),
  ('apocrypha', '1-maccabees', 2, 26, 'canon', 'numbers', 25, 13, 'free', E'Numbers 25:13 — *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel).* The everlasting priesthood granted for Phinehas'' zeal is the covenant Mattathias the priest is acting in when he is inflamed with zeal in 1 Maccabees 2:26.'),
  ('apocrypha', '1-maccabees', 2, 24, 'canon', 'psalms', 106, 30, 'free', E'Psalm 106:30 — *Then stood up Phinehas, and executed judgment: and so the plague was stayed.* As Phinehas rose and executed judgment to stay the plague, so Mattathias rises and slays the apostate at the altar in 1 Maccabees 2:24.'),
  ('apocrypha', '1-maccabees', 2, 24, 'canon', 'psalms', 106, 31, 'free', E'Psalm 106:31 — *And that was counted unto him for righteousness unto all generations for evermore.* The zeal counted to Phinehas as everlasting righteousness is the same righteousness reckoned to Mattathias when he shows his anger according to judgment in 1 Maccabees 2:24.'),
  -- thread: 1-maccabees-2-die-rather-than-profane-sabbath
  ('apocrypha', '1-maccabees', 2, 37, 'apocrypha', '1-maccabees', 1, 63, 'extras', E'1 Maccabees 1:63 — *Wherefore they chose rather to die, that they might not be defiled with meats, and that they might not profane the holy covenant: so then they died.* The same choosing-to-die-rather-than-defile-the-covenant is the resolve of those who say let us die in our innocency in 1 Maccabees 2:37.'),
  ('apocrypha', '1-maccabees', 2, 38, 'canon', 'hebrews', 11, 37, 'free', E'Hebrews 11:37 — *They were stoned, they were sawn asunder, were tempted, were slain with the sword: they wandered about in sheepskins and goatskins; being destitute, afflicted, tormented;* These slain saints of the faith-cloud are the very kind slaughtered with their wives and children on the sabbath in 1 Maccabees 2:38.'),
  ('apocrypha', '1-maccabees', 2, 38, 'canon', 'hebrews', 11, 38, 'free', E'Hebrews 11:38 — *(Of whom the world was not worthy:) they wandered in deserts, and in mountains, and in dens and caves of the earth.* The faithful who wandered in deserts and caves are those who went down into the wilderness and were slain there in 1 Maccabees 2:38.'),
  -- thread: 1-maccabees-2-give-your-lives-for-the-covenant
  ('apocrypha', '1-maccabees', 2, 62, 'canon', 'matthew', 10, 28, 'free', E'Matthew 10:28 — *And fear not them which kill the body, but are not able to kill the soul: but rather fear him which is able to destroy both soul and body in hell.* The Messiah''s call not to fear the killer of the body is the very counsel Mattathias gives when he says fear not the words of a sinful man in 1 Maccabees 2:62.'),
  ('apocrypha', '1-maccabees', 2, 50, 'apocrypha', '2-maccabees', 7, 9, 'extras', E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* To give your lives for the covenant in 1 Maccabees 2:50 is to die for his laws in the hope that the King of the world will raise you up.'),
  ('apocrypha', '1-maccabees', 2, 63, 'canon', 'psalms', 37, 36, 'free', E'Psalm 37:36 — *Yet he passed away, and, lo, he was not: yea, I sought him, but he could not be found.* The wicked who passes away and cannot be found is the very fate Mattathias pronounces over the tyrant who today is lifted up and tomorrow shall not be found in 1 Maccabees 2:63.'),
  -- thread: 1-maccabees-2-rollcall-of-the-faithful
  ('apocrypha', '1-maccabees', 2, 52, 'canon', 'genesis', 15, 6, 'free', E'Genesis 15:6 — *And he believed in Yahuah (LORD); and he counted it to him for righteousness.* This is the reckoning Mattathias recalls when he asks whether Abraham was not found faithful and it was imputed to him for righteousness in 1 Maccabees 2:52.'),
  ('apocrypha', '1-maccabees', 2, 52, 'canon', 'hebrews', 11, 17, 'free', E'Hebrews 11:17 — *By faith Abraham, when he was tried, offered up Isaac: and he that had received the promises offered up his only begotten son,* The trying of Abraham that Hebrews names is the temptation in which 1 Maccabees 2:52 says he was found faithful.'),
  ('apocrypha', '1-maccabees', 2, 57, 'canon', 'hebrews', 11, 33, 'free', E'Hebrews 11:33 — *Who through faith subdued kingdoms, wrought righteousness, obtained promises, stopped the mouths of lions,* David and the faithful who subdued kingdoms through faith are the same fathers Mattathias rehearses, of whom David possessed the throne of an everlasting kingdom in 1 Maccabees 2:57.'),
  -- thread: 1-maccabees-2-elijah-three-children-daniel
  ('apocrypha', '1-maccabees', 2, 58, 'canon', 'james', 5, 17, 'free', E'James 5:17 — *Elias was a man subject to like passions as we are, and he prayed earnestly that it might not rain: and it rained not on the earth by the space of three years and six months.* The zealous and fervent Elias whom Mattathias names in 1 Maccabees 2:58 is the same prophet James holds up as an example of fervent prayer.'),
  ('apocrypha', '1-maccabees', 2, 59, 'canon', 'daniel', 3, 17, 'free', E'Daniel 3:17 — *If it be so, our Elohim (God) whom we serve is able to deliver us from the burning fiery furnace, and he will deliver us out of thine hand, O king.* The confidence of the three is the believing by which 1 Maccabees 2:59 says Ananias, Azarias, and Misael were saved out of the flame.'),
  ('apocrypha', '1-maccabees', 2, 60, 'canon', 'daniel', 6, 22, 'free', E'Daniel 6:22 — *My Elohim (God) hath sent his angel, and hath shut the lions'' mouths, that they have not hurt me: forasmuch as before him innocency was found in me; and also before thee, O king, have I done no hurt.* The shutting of the lions'' mouths for the innocency found in Daniel is exactly the deliverance 1 Maccabees 2:60 recalls.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1mac2_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1mac2_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-2-sanctuary-profaned',
       E'The sanctuary profaned — the abomination on the altar',
       E'Mattathias takes up the lament over a desecrated house: *And, behold, our sanctuary, even our beauty and our glory, is laid waste, and the Gentiles have profaned it.* (1 Maccabees 2:12). The same defilement is named a chapter before, when Antiochus'' men *set up the abomination of desolation upon the altar* (1 Maccabees 1:54) — and that abomination is no new thing under the sun. Daniel had foreseen it: *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* (Daniel 11:31). And the Messiah Himself points to it still standing ahead: *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* (Matthew 24:15). The kingdom of man profaning the holy place is the one antichrist pattern, from Antiochus to the end — the SYSTEM the faithful are called to refuse.',
       sv.verse_id, ev.verse_id, 'extras', 61525
  FROM _session253_1mac2_lookup sv, _session253_1mac2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=2 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-2-zeal-of-phinehas',
       E'Inflamed with zeal — as Phinehas did',
       E'When an apostate steps forward to sacrifice on the heathen altar, Mattathias does not flinch: *Which thing when Mattathias saw, he was inflamed with zeal, and his reins trembled, neither could he forbear to shew his anger according to judgment: wherefore he ran, and slew him upon the altar.* (1 Maccabees 2:24), and the text names the pattern outright — *Thus dealt he zealously for the law of Yahuah (God) like as Phinees did to Zambri the son of Salom.* (1 Maccabees 2:26). The original act is in the Torah: *And when Phinehas, the son of Eleazar, the son of Aaron the priest, saw it, he rose up from among the congregation, and took a javelin in his hand;* (Numbers 25:7), and Yahuah seals it with a covenant — *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel).* (Numbers 25:13). The Psalm preserves it as righteousness for ever: *Then stood up Phinehas, and executed judgment: and so the plague was stayed. And that was counted unto him for righteousness unto all generations for evermore.* (Psalm 106:30-31). It ain''t new — Mattathias'' zeal is Phinehas'' zeal, the same covenant jealousy for a holy people.',
       sv.verse_id, ev.verse_id, 'extras', 61528
  FROM _session253_1mac2_lookup sv, _session253_1mac2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=24
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=2 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-2-die-rather-than-profane-sabbath',
       E'Let us die in our innocency — covenant kept unto death',
       E'Hunted into the wilderness and attacked on the sabbath, the faithful will not lift a hand to defile the day: *But they said, We will not come forth, neither will we do the king''s commandment, to profane the sabbath day.* (1 Maccabees 2:34); *But said, Let us die all in our innocency: heaven and earth will testify for us, that you put us to death wrongfully.* (1 Maccabees 2:37). This is Torah-faithfulness unto death, never law-as-curse — the same resolve named the chapter before, when the people *chose rather to die, that they might not be defiled with meats, and that they might not profane the holy covenant: so then they died.* (1 Maccabees 1:63). And it is the cloud Hebrews gathers: *They were stoned, they were sawn asunder, were tempted, were slain with the sword: they wandered about in sheepskins and goatskins; being destitute, afflicted, tormented;* (Hebrews 11:37) — *(Of whom the world was not worthy:) they wandered in deserts, and in mountains, and in dens and caves of the earth.* (Hebrews 11:38). The Maccabean martyrs in the secret places of the wilderness are written into that very roll.',
       sv.verse_id, ev.verse_id, 'extras', 61531
  FROM _session253_1mac2_lookup sv, _session253_1mac2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=34
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=2 AND ev.verse_number=38
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-2-give-your-lives-for-the-covenant',
       E'Be zealous for the law — give your lives for the covenant',
       E'Mattathias'' dying charge holds the whole framework in a line: *Now therefore, my sons, be you zealous for the law, and give your lives for the covenant of your fathers.* (1 Maccabees 2:50) — and he refuses fear of the tyrant: *Fear not then the words of a sinful man: for his glory shall be dung and worms.* (1 Maccabees 2:62); *To day he shall be lifted up and to morrow he shall not be found, because he is returned into his dust, and his thought is come to nothing.* (1 Maccabees 2:63). The Torah stands; the kingdom of man passes. The Messiah''s own word seals the charge: *And fear not them which kill the body, but are not able to kill the soul: but rather fear him which is able to destroy both soul and body in hell.* (Matthew 10:28). And the better hope behind dying for the covenant is the resurrection his brethren confess — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* (2 Maccabees 7:9).',
       sv.verse_id, ev.verse_id, 'extras', 61534
  FROM _session253_1mac2_lookup sv, _session253_1mac2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=50
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=2 AND ev.verse_number=63
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-2-rollcall-of-the-faithful',
       E'Call to remembrance the fathers — the same cloud of witnesses',
       E'Mattathias rehearses the fathers who were faithful in trial: *Call to remembrance what acts our fathers did in their time; so shall you receive great honour and an everlasting name.* (1 Maccabees 2:51) — *Was not Abraham found faithful in temptation, and it was imputed to him for righteousness?* (1 Maccabees 2:52). It is the very roll Hebrews unrolls. Abraham reckoned righteous: *And he believed in Yahuah (LORD); and he counted it to him for righteousness.* (Genesis 15:6), tried at the altar — *By faith Abraham, when he was tried, offered up Isaac: and he that had received the promises offered up his only begotten son,* (Hebrews 11:17). David and the prophets: *Who through faith subdued kingdoms, wrought righteousness, obtained promises, stopped the mouths of lions,* (Hebrews 11:33). It ain''t new — the deathbed roll-call of 1 Maccabees and the faith-chapter of Hebrews are the same cloud of witnesses, the same covenant people kept.',
       sv.verse_id, ev.verse_id, 'extras', 61537
  FROM _session253_1mac2_lookup sv, _session253_1mac2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=51
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=2 AND ev.verse_number=57
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-2-elijah-three-children-daniel',
       E'Elijah, the three children, Daniel — delivered by trust',
       E'The roll-call presses on to those delivered through fire and lions: *Elias for being zealous and fervent for the law was taken up into heaven.* (1 Maccabees 2:58) — *Ananias, Azarias, and Misael, by believing were saved out of the flame.* (1 Maccabees 2:59) — *Daniel for his innocency was delivered from the mouth of lions.* (1 Maccabees 2:60), and the lesson sealed: *And thus consider you throughout all ages, that none that put their trust in him shall be overcome.* (1 Maccabees 2:61). The accounts stand in the canon. Elijah''s fervent zeal: *Elias was a man subject to like passions as we are, and he prayed earnestly that it might not rain: and it rained not on the earth by the space of three years and six months.* (James 5:17). The three saved out of the flame: *If it be so, our Elohim (God) whom we serve is able to deliver us from the burning fiery furnace, and he will deliver us out of thine hand, O king.* (Daniel 3:17). Daniel and the lions: *My Elohim (God) hath sent his angel, and hath shut the lions'' mouths, that they have not hurt me: forasmuch as before him innocency was found in me; and also before thee, O king, have I done no hurt.* (Daniel 6:22). None that trust are overcome — the same faithful witness, it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 61540
  FROM _session253_1mac2_lookup sv, _session253_1mac2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=58
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=2 AND ev.verse_number=61
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-maccabees-2-sanctuary-profaned
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Maccabees 1:54 — *Now the fifteenth day of the month Casleu, in the hundred forty and fifth year, they set up the abomination of desolation upon the altar, and builded idol altars throughout the cities of Juda on every side;* This is the very profaning Mattathias mourns when he cries that the sanctuary is laid waste in 1 Maccabees 2:12.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-sanctuary-profaned'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=1 AND tv.verse_number=54
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 11:31 — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* Daniel foretold the polluting of the holy place that 1 Maccabees 2:12 sees come to pass under Antiochus.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-sanctuary-profaned'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The Messiah names the same desolating abomination as still to come, the antichrist pattern Mattathias already grieves in 1 Maccabees 2:12.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-sanctuary-profaned'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-2-zeal-of-phinehas
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 25:7 — *And when Phinehas, the son of Eleazar, the son of Aaron the priest, saw it, he rose up from among the congregation, and took a javelin in his hand;* This is the deed 1 Maccabees 2:26 names as the very pattern of Mattathias'' zeal upon the altar.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-zeal-of-phinehas'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Numbers 25:13 — *And he shall have it, and his seed after him, even the covenant of an everlasting priesthood; because he was zealous for his Elohim (God), and made an atonement for the children of Yashar''el (Israel).* The everlasting priesthood granted for Phinehas'' zeal is the covenant Mattathias the priest is acting in when he is inflamed with zeal in 1 Maccabees 2:26.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-zeal-of-phinehas'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=25 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 106:30 — *Then stood up Phinehas, and executed judgment: and so the plague was stayed.* As Phinehas rose and executed judgment to stay the plague, so Mattathias rises and slays the apostate at the altar in 1 Maccabees 2:24.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-zeal-of-phinehas'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 106:31 — *And that was counted unto him for righteousness unto all generations for evermore.* The zeal counted to Phinehas as everlasting righteousness is the same righteousness reckoned to Mattathias when he shows his anger according to judgment in 1 Maccabees 2:24.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-zeal-of-phinehas'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=106 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-2-die-rather-than-profane-sabbath
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'1 Maccabees 1:63 — *Wherefore they chose rather to die, that they might not be defiled with meats, and that they might not profane the holy covenant: so then they died.* The same choosing-to-die-rather-than-defile-the-covenant is the resolve of those who say let us die in our innocency in 1 Maccabees 2:37.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-die-rather-than-profane-sabbath'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=37
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=1 AND tv.verse_number=63
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:37 — *They were stoned, they were sawn asunder, were tempted, were slain with the sword: they wandered about in sheepskins and goatskins; being destitute, afflicted, tormented;* These slain saints of the faith-cloud are the very kind slaughtered with their wives and children on the sabbath in 1 Maccabees 2:38.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-die-rather-than-profane-sabbath'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:38 — *(Of whom the world was not worthy:) they wandered in deserts, and in mountains, and in dens and caves of the earth.* The faithful who wandered in deserts and caves are those who went down into the wilderness and were slain there in 1 Maccabees 2:38.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-die-rather-than-profane-sabbath'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=38
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-2-give-your-lives-for-the-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Matthew 10:28 — *And fear not them which kill the body, but are not able to kill the soul: but rather fear him which is able to destroy both soul and body in hell.* The Messiah''s call not to fear the killer of the body is the very counsel Mattathias gives when he says fear not the words of a sinful man in 1 Maccabees 2:62.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-give-your-lives-for-the-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=62
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=10 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* To give your lives for the covenant in 1 Maccabees 2:50 is to die for his laws in the hope that the King of the world will raise you up.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-give-your-lives-for-the-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=50
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 37:36 — *Yet he passed away, and, lo, he was not: yea, I sought him, but he could not be found.* The wicked who passes away and cannot be found is the very fate Mattathias pronounces over the tyrant who today is lifted up and tomorrow shall not be found in 1 Maccabees 2:63.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-give-your-lives-for-the-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=63
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=37 AND tv.verse_number=36
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-2-rollcall-of-the-faithful
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 15:6 — *And he believed in Yahuah (LORD); and he counted it to him for righteousness.* This is the reckoning Mattathias recalls when he asks whether Abraham was not found faithful and it was imputed to him for righteousness in 1 Maccabees 2:52.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-rollcall-of-the-faithful'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=15 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Hebrews 11:17 — *By faith Abraham, when he was tried, offered up Isaac: and he that had received the promises offered up his only begotten son,* The trying of Abraham that Hebrews names is the temptation in which 1 Maccabees 2:52 says he was found faithful.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-rollcall-of-the-faithful'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 11:33 — *Who through faith subdued kingdoms, wrought righteousness, obtained promises, stopped the mouths of lions,* David and the faithful who subdued kingdoms through faith are the same fathers Mattathias rehearses, of whom David possessed the throne of an everlasting kingdom in 1 Maccabees 2:57.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-rollcall-of-the-faithful'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=57
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=33
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-2-elijah-three-children-daniel
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'James 5:17 — *Elias was a man subject to like passions as we are, and he prayed earnestly that it might not rain: and it rained not on the earth by the space of three years and six months.* The zealous and fervent Elias whom Mattathias names in 1 Maccabees 2:58 is the same prophet James holds up as an example of fervent prayer.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-elijah-three-children-daniel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=58
   AND tv.edition_slug='canon' AND tv.book_slug='james' AND tv.chapter_number=5 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 3:17 — *If it be so, our Elohim (God) whom we serve is able to deliver us from the burning fiery furnace, and he will deliver us out of thine hand, O king.* The confidence of the three is the believing by which 1 Maccabees 2:59 says Ananias, Azarias, and Misael were saved out of the flame.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-elijah-three-children-daniel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=59
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 6:22 — *My Elohim (God) hath sent his angel, and hath shut the lions'' mouths, that they have not hurt me: forasmuch as before him innocency was found in me; and also before thee, O king, have I done no hurt.* The shutting of the lions'' mouths for the innocency found in Daniel is exactly the deliverance 1 Maccabees 2:60 recalls.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac2_lookup sv, _session253_1mac2_lookup tv
 WHERE t.slug='1-maccabees-2-elijah-three-children-daniel'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=2 AND sv.verse_number=60
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=6 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

