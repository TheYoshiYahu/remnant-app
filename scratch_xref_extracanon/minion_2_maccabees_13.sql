-- ----- fragment: minion_2maccabees_13.sql (session253 2-maccabees 13) -----
-- Source anchor: apocrypha/2-maccabees ch13. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2mac13 (view _session253_2mac13_lookup). Sort band base 62300, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2mac13_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-maccabees-13-king-of-kings
  ('apocrypha', '2-maccabees', 13, 4, 'canon', 'daniel', 2, 37, 'free', E'Daniel 2:37 — *Thou, O king, art a king of kings: for the Elohim (God) of heaven hath given thee a kingdom, power, and strength, and glory.* As Daniel told Babylon, so 2 Maccabees 13:4 confesses: the empire''s crown is loaned by the Elohim of heaven, who bends even Antiochus'' mind to His purpose.'),
  ('apocrypha', '2-maccabees', 13, 4, 'canon', '1-timothy', 6, 15, 'free', E'1 Timothy 6:15 — *Which in his times he shall shew, who is the blessed and only Potentate, the King of kings, and Lord of lords;* The very title the apostle gives to the One above every throne is the title 2 Maccabees 13:4 sets over Antiochus, who is moved like a piece on a board he cannot see.'),
  -- thread: 2-maccabees-13-ashes-recompense
  ('apocrypha', '2-maccabees', 13, 7, 'canon', 'galatians', 6, 7, 'free', E'Galatians 6:7 — *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap.* Menelaus sinning about the holy altar and dying in its ashes (2 Maccabees 13:7-8) is the sowing-and-reaping law made visible.'),
  ('apocrypha', '2-maccabees', 13, 8, 'canon', 'proverbs', 11, 21, 'free', E'Proverbs 11:21 — *Though hand join in hand, the wicked shall not be unpunished: but the seed of the righteous shall be delivered.* Though Menelaus joined hands with Antiochus, he was not unpunished; 2 Maccabees 13:8 says he received his death in ashes — most justly.'),
  ('apocrypha', '2-maccabees', 13, 7, 'canon', 'jeremiah', 22, 19, 'free', E'Jeremiah 22:19 — *He shall be buried with the burial of an ass, drawn and cast forth beyond the gates of Jerusalem.* The covenant-betrayer denied an honourable grave in Jeremiah is the same recompense 2 Maccabees 13:7 records over Menelaus, who died not having so much as burial in the earth.'),
  -- thread: 2-maccabees-13-weeping-fasting-battle
  ('apocrypha', '2-maccabees', 13, 12, 'canon', '2-chronicles', 20, 12, 'free', E'2 Chronicles 20:12 — *O our Elohim (God), wilt thou not judge them? for we have no might against this great company that cometh against us; neither know we what to do: but our eyes are upon thee.* Jehoshaphat''s helpless turning of his eyes to Yahuah is exactly the weeping, fasting, three-days-prostrate posture of Judas'' people in 2 Maccabees 13:12.'),
  ('apocrypha', '2-maccabees', 13, 14, 'canon', '2-chronicles', 20, 15, 'free', E'2 Chronicles 20:15 — *And he said, Hearken ye, all Yahudah (Judah), and ye inhabitants of Jerusalem, and thou king Jehoshaphat, Thus saith Yahuah (LORD) unto you, Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God’s).* When Judas commits all to the Creator of the world in 2 Maccabees 13:14, he stands in the truth Jehoshaphat heard: the battle belongs to Elohim.'),
  ('apocrypha', '2-maccabees', 13, 12, 'canon', 'joel', 2, 12, 'free', E'Joel 2:12 — *Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning:* The prophet''s summons to return with fasting and weeping is enacted to the letter by Judas'' people in 2 Maccabees 13:12.'),
  ('apocrypha', '2-maccabees', 13, 12, 'apocrypha', '1-maccabees', 4, 30, 'extras', E'1 Maccabees 4:30 — *And when he saw that mighty army, he prayed and said, Blessed art you, O Saviour of Yashar''el (Israel), who did quell the violence of the mighty man by the hand of your servant David, and gavest the host of strangers into the hands of Jonathan the son of Saul, and his armourbearer;* The sister-book shows the same Maccabean rule — prayer before the mighty army — that frames the fasting of 2 Maccabees 13:12.'),
  -- thread: 2-maccabees-13-night-victory
  ('apocrypha', '2-maccabees', 13, 15, 'canon', 'psalms', 20, 7, 'free', E'Psalm 20:7 — *Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God).* Against Antiochus'' three hundred hooked chariots, Judas'' watchword Victory is of Yahuah in 2 Maccabees 13:15 is this very psalm made flesh.'),
  ('apocrypha', '2-maccabees', 13, 15, 'canon', 'judges', 7, 7, 'free', E'Judges 7:7 — *And Yahuah (LORD) said unto Gideon, By the three hundred men that lapped will I save you, and deliver the Midianites into thine hand: and let all the other people go every man unto his place.* The choice young men striking the king''s camp by night in 2 Maccabees 13:15 are Gideon''s whittled three hundred, that the victory might plainly be of Yahuah.'),
  ('apocrypha', '2-maccabees', 13, 17, 'canon', 'judges', 7, 20, 'free', E'Judges 7:20 — *And the three companies blew the trumpets, and brake the pitchers, and held the lamps in their left hands, and the trumpets in their right hands to blow withal: and they cried, The sword of Yahuah (LORD), and of Gideon.* Gideon''s night-rout, finished as the protection of Yahuah did help him, is the pattern of Judas'' dawn victory in 2 Maccabees 13:17.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2mac13_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2mac13_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-13-king-of-kings',
       E'The King of kings turns the heart of kings',
       E'When the apostate Menelaus marched alongside the invading Antiochus, hoping to be made governor, the historian unmasks the true Sovereign over the whole affair: *But the King of kings moved Antiochus’ mind against this wicked wretch, and Lysias informed the king that this man was the cause of all mischief, so that the king commanded to bring him to Berea, and to put him to death, as the manner is in that place.* (2 Maccabees 13:4). The pagan emperor is no autonomous power; even Babylon''s crown is a delegated thing — *Thou, O king, art a king of kings: for the Elohim (God) of heaven hath given thee a kingdom, power, and strength, and glory.* (Daniel 2:37) — and Yahuah turns the heart of the man-kingdom wherever He wills. The same title rises in the apostles'' confession of the One above every throne — *Which in his times he shall shew, who is the blessed and only Potentate, the King of kings, and Lord of lords;* (1 Timothy 6:15) — so that Antiochus the abomination, like Menelaus, is only an instrument in a hand he cannot see.',
       sv.verse_id, ev.verse_id, 'extras', 62300
  FROM _session253_2mac13_lookup sv, _session253_2mac13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=13 AND sv.verse_number=4
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=13 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-13-ashes-recompense',
       E'Menelaus dies in ashes, unburied — the just recompense',
       E'The traitor-priest who defiled the altar is repaid in kind, dying in the tower of ashes and denied a grave: *Such a death it happened that wicked man to die, not having so much as burial in the earth; and that most justly:* (2 Maccabees 13:7); *For inasmuch as he had committed many sins about the altar, whose fire and ashes were holy, he received his death in ashes.* (2 Maccabees 13:8). This is not law-as-curse but the covenant''s own scale: a man reaps what he sows — *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap.* (Galatians 6:7) — and *Though hand join in hand, the wicked shall not be unpunished: but the seed of the righteous shall be delivered.* (Proverbs 11:21). The denial of burial echoes the prophet''s word over another covenant-betrayer, Jehoiakim — *He shall be buried with the burial of an ass, drawn and cast forth beyond the gates of Jerusalem.* (Jeremiah 22:19) — the apostate''s end answered by the very holiness he profaned.',
       sv.verse_id, ev.verse_id, 'extras', 62303
  FROM _session253_2mac13_lookup sv, _session253_2mac13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=13 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=13 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-13-weeping-fasting-battle',
       E'Weeping and fasting: the battle is Yahuah''s',
       E'Before a sword is drawn, Judas turns the people to their true defence — supplication, fasting, and the casting of all upon the Creator: *So when they had all done this together, and besought the merciful Yahuah (God) with weeping and fasting, and lying flat upon the ground three days long, Judas, having exhorted them, commanded they should be in a readiness.* (2 Maccabees 13:12); *So when he had committed all to the Creator of the world, and exhorted his soldiers to fight manfully, even to death, for the laws, the temple, the city, the country, and the commonwealth, he camped by Modin:* (2 Maccabees 13:14). This is Jehoshaphat''s posture when an overwhelming host came up — *O our Elohim (God), wilt thou not judge them? for we have no might against this great company that cometh against us; neither know we what to do: but our eyes are upon thee.* (2 Chronicles 20:12) — and the word that answered him answers Judas: *Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God’s).* (2 Chronicles 20:15). It is the very prophet''s call to turn back with fasting — *Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning:* (Joel 2:12) — and the brother-Maccabee before him prayed the same in the face of a mighty army: *And when he saw that mighty army, he prayed and said, Blessed art you, O Saviour of Yashar''el (Israel), who did quell the violence of the mighty man by the hand of your servant David, and gavest the host of strangers into the hands of Jonathan the son of Saul, and his armourbearer;* (1 Maccabees 4:30).',
       sv.verse_id, ev.verse_id, 'extras', 62306
  FROM _session253_2mac13_lookup sv, _session253_2mac13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=13 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=13 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-13-night-victory',
       E'Victory is of Yahuah — the night-strike like Gideon',
       E'With the watchword on their lips, Judas'' chosen men fall upon the camp by night and break it in the dawn, for the deliverance was never theirs to manufacture: *And having given the watchword to them that were about him, Victory is of Yahuah (God); with the most valiant and choice young men he went in into the king’s tent by night, and slew in the camp about four thousand men, and the chiefest of the elephants, with all that were upon him.* (2 Maccabees 13:15); *This was done in the break of the day, because the protection of Yahuah (God) did help him.* (2 Maccabees 13:17). It is Gideon''s three hundred all over again, the night-strike on a numberless host so that no flesh could boast — *And Yahuah (LORD) said unto Gideon, By the three hundred men that lapped will I save you, and deliver the Midianites into thine hand: and let all the other people go every man unto his place.* (Judges 7:7); *And the three companies blew the trumpets, and brake the pitchers, and held the lamps in their left hands, and the trumpets in their right hands to blow withal: and they cried, The sword of Yahuah (LORD), and of Gideon.* (Judges 7:20). And the watchword itself is the psalm of the trusting remnant: *Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God).* (Psalm 20:7) — against Antiochus'' chariots armed with hooks, the name of Yahuah.',
       sv.verse_id, ev.verse_id, 'extras', 62309
  FROM _session253_2mac13_lookup sv, _session253_2mac13_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=13 AND sv.verse_number=15
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=13 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-maccabees-13-king-of-kings
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 2:37 — *Thou, O king, art a king of kings: for the Elohim (God) of heaven hath given thee a kingdom, power, and strength, and glory.* As Daniel told Babylon, so 2 Maccabees 13:4 confesses: the empire''s crown is loaned by the Elohim of heaven, who bends even Antiochus'' mind to His purpose.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac13_lookup sv, _session253_2mac13_lookup tv
 WHERE t.slug='2-maccabees-13-king-of-kings'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Timothy 6:15 — *Which in his times he shall shew, who is the blessed and only Potentate, the King of kings, and Lord of lords;* The very title the apostle gives to the One above every throne is the title 2 Maccabees 13:4 sets over Antiochus, who is moved like a piece on a board he cannot see.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac13_lookup sv, _session253_2mac13_lookup tv
 WHERE t.slug='2-maccabees-13-king-of-kings'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=13 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='1-timothy' AND tv.chapter_number=6 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-13-ashes-recompense
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Galatians 6:7 — *Be not deceived; Elohim (God) is not mocked: for whatsoever a man soweth, that shall he also reap.* Menelaus sinning about the holy altar and dying in its ashes (2 Maccabees 13:7-8) is the sowing-and-reaping law made visible.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac13_lookup sv, _session253_2mac13_lookup tv
 WHERE t.slug='2-maccabees-13-ashes-recompense'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=13 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='galatians' AND tv.chapter_number=6 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 11:21 — *Though hand join in hand, the wicked shall not be unpunished: but the seed of the righteous shall be delivered.* Though Menelaus joined hands with Antiochus, he was not unpunished; 2 Maccabees 13:8 says he received his death in ashes — most justly.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac13_lookup sv, _session253_2mac13_lookup tv
 WHERE t.slug='2-maccabees-13-ashes-recompense'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=13 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=11 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 22:19 — *He shall be buried with the burial of an ass, drawn and cast forth beyond the gates of Jerusalem.* The covenant-betrayer denied an honourable grave in Jeremiah is the same recompense 2 Maccabees 13:7 records over Menelaus, who died not having so much as burial in the earth.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac13_lookup sv, _session253_2mac13_lookup tv
 WHERE t.slug='2-maccabees-13-ashes-recompense'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=13 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=22 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-13-weeping-fasting-battle
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Chronicles 20:12 — *O our Elohim (God), wilt thou not judge them? for we have no might against this great company that cometh against us; neither know we what to do: but our eyes are upon thee.* Jehoshaphat''s helpless turning of his eyes to Yahuah is exactly the weeping, fasting, three-days-prostrate posture of Judas'' people in 2 Maccabees 13:12.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac13_lookup sv, _session253_2mac13_lookup tv
 WHERE t.slug='2-maccabees-13-weeping-fasting-battle'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=13 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Chronicles 20:15 — *And he said, Hearken ye, all Yahudah (Judah), and ye inhabitants of Jerusalem, and thou king Jehoshaphat, Thus saith Yahuah (LORD) unto you, Be not afraid nor dismayed by reason of this great multitude; for the battle is not yours, but Elohim''s (God’s).* When Judas commits all to the Creator of the world in 2 Maccabees 13:14, he stands in the truth Jehoshaphat heard: the battle belongs to Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac13_lookup sv, _session253_2mac13_lookup tv
 WHERE t.slug='2-maccabees-13-weeping-fasting-battle'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=13 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Joel 2:12 — *Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning:* The prophet''s summons to return with fasting and weeping is enacted to the letter by Judas'' people in 2 Maccabees 13:12.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac13_lookup sv, _session253_2mac13_lookup tv
 WHERE t.slug='2-maccabees-13-weeping-fasting-battle'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=13 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Maccabees 4:30 — *And when he saw that mighty army, he prayed and said, Blessed art you, O Saviour of Yashar''el (Israel), who did quell the violence of the mighty man by the hand of your servant David, and gavest the host of strangers into the hands of Jonathan the son of Saul, and his armourbearer;* The sister-book shows the same Maccabean rule — prayer before the mighty army — that frames the fasting of 2 Maccabees 13:12.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac13_lookup sv, _session253_2mac13_lookup tv
 WHERE t.slug='2-maccabees-13-weeping-fasting-battle'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=13 AND sv.verse_number=12
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=4 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-13-night-victory
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 20:7 — *Some trust in chariots, and some in horses: but we will remember the name of Yahuah Eloheinu (the LORD our God).* Against Antiochus'' three hundred hooked chariots, Judas'' watchword Victory is of Yahuah in 2 Maccabees 13:15 is this very psalm made flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac13_lookup sv, _session253_2mac13_lookup tv
 WHERE t.slug='2-maccabees-13-night-victory'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=13 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=20 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Judges 7:7 — *And Yahuah (LORD) said unto Gideon, By the three hundred men that lapped will I save you, and deliver the Midianites into thine hand: and let all the other people go every man unto his place.* The choice young men striking the king''s camp by night in 2 Maccabees 13:15 are Gideon''s whittled three hundred, that the victory might plainly be of Yahuah.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac13_lookup sv, _session253_2mac13_lookup tv
 WHERE t.slug='2-maccabees-13-night-victory'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=13 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=7 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Judges 7:20 — *And the three companies blew the trumpets, and brake the pitchers, and held the lamps in their left hands, and the trumpets in their right hands to blow withal: and they cried, The sword of Yahuah (LORD), and of Gideon.* Gideon''s night-rout, finished as the protection of Yahuah did help him, is the pattern of Judas'' dawn victory in 2 Maccabees 13:17.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac13_lookup sv, _session253_2mac13_lookup tv
 WHERE t.slug='2-maccabees-13-night-victory'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=13 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='judges' AND tv.chapter_number=7 AND tv.verse_number=20
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

