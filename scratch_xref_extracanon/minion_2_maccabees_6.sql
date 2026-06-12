-- ----- fragment: minion_2maccabees_06.sql (session253 2-maccabees 6) -----
-- Source anchor: apocrypha/2-maccabees ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 2mac6 (view _session253_2mac6_lookup). Sort band base 62125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_2mac6_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 2-maccabees-6-abomination-of-desolation
  ('apocrypha', '2-maccabees', 6, 2, 'canon', 'daniel', 11, 31, 'free', E'Daniel 11:31 — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* Daniel foresaw exactly this polluting of the sanctuary that Antiochus now works in 2 Maccabees 6:2.'),
  ('apocrypha', '2-maccabees', 6, 5, 'canon', 'matthew', 24, 15, 'free', E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The Messiah lifts the desolation of the altar in 2 Maccabees 6:5 into the sign of the end, the same abomination set up again.'),
  -- thread: 2-maccabees-6-sabbath-feasts-circumcision
  ('apocrypha', '2-maccabees', 6, 6, 'canon', 'john', 10, 22, 'free', E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* The Sabbath and feasts forbidden in 2 Maccabees 6:6 are the very appointed times the Messiah walks in — keeping even the dedication won by these martyrs'' faithfulness.'),
  -- thread: 2-maccabees-6-chastening-not-destruction
  ('apocrypha', '2-maccabees', 6, 12, 'canon', 'hebrews', 12, 6, 'free', E'Hebrews 12:6 — *For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth.* The punishments judged in 2 Maccabees 6:12 to be chastening and not destruction are exactly the scourging Hebrews names as the mark of a received son.'),
  ('apocrypha', '2-maccabees', 6, 12, 'canon', 'proverbs', 3, 11, 'free', E'Proverbs 3:11 — *My son, despise not the chastening of Yahuah (LORD); neither be weary of his correction:* The plea of 2 Maccabees 6:12 not to be discouraged is Proverbs'' charge not to despise the Father''s correction.'),
  ('apocrypha', '2-maccabees', 6, 16, 'canon', 'proverbs', 3, 12, 'free', E'Proverbs 3:12 — *For whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth.* The mercy never withdrawn in 2 Maccabees 6:16 is the fatherly delight behind every correction in Proverbs.'),
  ('apocrypha', '2-maccabees', 6, 16, 'canon', 'hebrews', 12, 11, 'free', E'Hebrews 12:11 — *Now no chastening for the present seemeth to be joyous, but grievous: nevertheless afterward it yieldeth the peaceable fruit of righteousness unto them which are exercised thereby.* The adversity that never forsakes the people (2 Maccabees 6:16) bears, as Hebrews says, the peaceable fruit of righteousness.'),
  -- thread: 2-maccabees-6-eleazar-swines-flesh
  ('apocrypha', '2-maccabees', 6, 19, 'canon', 'leviticus', 11, 7, 'free', E'Leviticus 11:7 — *And the swine, though he divide the hoof, and be clovenfooted, yet he cheweth not the cud; he is unclean to you.* The flesh Eleazar spits forth in 2 Maccabees 6:19 is the swine the Torah itself names unclean.'),
  ('apocrypha', '2-maccabees', 6, 20, 'canon', 'leviticus', 11, 8, 'free', E'Leviticus 11:8 — *Of their flesh shall ye not eat, and their carcase shall ye not touch; they are unclean to you.* Eleazar''s resolve in 2 Maccabees 6:20 to taste no unlawful thing for love of life is obedience to this very command.'),
  ('apocrypha', '2-maccabees', 6, 23, 'canon', 'daniel', 1, 8, 'free', E'Daniel 1:8 — *But Daniel purposed in his heart that he would not defile himself with the portion of the king''s meat, nor with the wine which he drank: therefore he requested of the prince of the eunuchs that he might not defile himself.* Eleazar, choosing the grave by the holy law (2 Maccabees 6:23), stands with Daniel who purposed in his heart not to defile himself at the king''s table.'),
  -- thread: 2-maccabees-6-notable-example-better-resurrection
  ('apocrypha', '2-maccabees', 6, 30, 'canon', 'hebrews', 11, 35, 'free', E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection:* Eleazar, beaten yet content in soul (2 Maccabees 6:30), is among the tortured who refuse deliverance for a better resurrection.'),
  ('apocrypha', '2-maccabees', 6, 28, 'canon', 'daniel', 12, 2, 'free', E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The notable example of dying for the holy laws (2 Maccabees 6:28) rests on Daniel''s promise that the sleepers awake to everlasting life.'),
  ('apocrypha', '2-maccabees', 6, 30, 'apocrypha', '2-maccabees', 7, 9, 'extras', E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The content soul of Eleazar (2 Maccabees 6:30) speaks plainly in his successors: the King of the world raises up those who die for His laws.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_2mac6_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_2mac6_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-6-abomination-of-desolation',
       E'The temple defiled — the abomination set up',
       E'The temple is seized and renamed to the god of the kingdom-of-man: *And to pollute also the temple in Jerusalem, and to call it the temple of Jupiter Olympius; and that in Garizim, of Jupiter the Defender of strangers, as they did desire that dwelt in the place.* (2 Maccabees 6:2). *The altar also was filled with profane things, which the law forbiddeth.* (2 Maccabees 6:5). This is the very desolation Daniel saw set against the holy covenant — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* (Daniel 11:31) — and the Messiah Himself points His people to it as the sign still to come: *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* (Matthew 24:15). Antiochus is the type; the antichrist system that dismantles Yahuah''s order is the antitype.',
       sv.verse_id, ev.verse_id, 'extras', 62125
  FROM _session253_2mac6_lookup sv, _session253_2mac6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=6 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-6-sabbath-feasts-circumcision',
       E'Sabbath, feasts, and circumcision punished by death',
       E'The covenant marks themselves are outlawed — Torah forbidden on pain of death: *Neither was it lawful for a man to keep sabbath days or ancient fasts, or to profess himself at all to be a Yahudi (Jew).* (2 Maccabees 6:6). The mothers who kept circumcision are martyred: *For there were two women brought, who had circumcised their children; whom when they had openly led round about the city, the babes hanging at their breasts, they cast them down headlong from the wall.* (2 Maccabees 6:10). And the Sabbath-keepers are burned: *And others, that had run together into caves near by, to keep the sabbath day secretly, being discovered by Philip, were all burnt together, because they made a conscience to help themselves for the honour of the most sacred day.* (2 Maccabees 6:11). The very things the kingdom-of-man forbids are the very things the Messiah keeps — at Jerusalem He honours even the Maccabean rededication: *And it was at Jerusalem the feast of the dedication, and it was winter.* (John 10:22). The covenant the dragon hates is the covenant kept.',
       sv.verse_id, ev.verse_id, 'extras', 62128
  FROM _session253_2mac6_lookup sv, _session253_2mac6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=6
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=6 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-6-chastening-not-destruction',
       E'Chastening, not destruction — the Father''s mercy',
       E'The writer reads the calamity not as wrath unto ruin but as a Father''s discipline: *Now I beseech those that read this book, that they be not discouraged for these calamities, but that they judge those punishments not to be for destruction, but for a chastening of our nation.* (2 Maccabees 6:12). *And therefore he never withdraweth his mercy from us: and though he punish with adversity, yet does he never forsake his people.* (2 Maccabees 6:16). This is Proverbs read aloud over Israel: *My son, despise not the chastening of Yahuah (LORD); neither be weary of his correction: For whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth.* (Proverbs 3:11-12) — and Hebrews carries the same word to the covenant people: *For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth.* (Hebrews 12:6); *Now no chastening for the present seemeth to be joyous, but grievous: nevertheless afterward it yieldeth the peaceable fruit of righteousness unto them which are exercised thereby.* (Hebrews 12:11). The seed is corrected, never cast off.',
       sv.verse_id, ev.verse_id, 'extras', 62131
  FROM _session253_2mac6_lookup sv, _session253_2mac6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=6 AND ev.verse_number=16
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-6-eleazar-swines-flesh',
       E'Eleazar — death rather than swine''s flesh',
       E'The aged scribe Eleazar is forced to the unclean thing and refuses: *But he, choosing rather to die gloriously, than to live stained with such an abomination, spit it forth, and came of his own accord to the torment,* (2 Maccabees 6:19). He will not even feign it: *As it behoved them to come, that are resolute to stand out against such things, as are not lawful for love of life to be tasted.* (2 Maccabees 6:20). The swine is unclean by the Torah''s own word: *And the swine, though he divide the hoof, and be clovenfooted, yet he cheweth not the cud; he is unclean to you.* (Leviticus 11:7); *Of their flesh shall ye not eat, and their carcase shall ye not touch; they are unclean to you.* (Leviticus 11:8). Eleazar stands in the line of Daniel at the king''s table: *But Daniel purposed in his heart that he would not defile himself with the portion of the king''s meat, nor with the wine which he drank: therefore he requested of the prince of the eunuchs that he might not defile himself.* (Daniel 1:8). Torah-faithfulness unto death — never law as curse, but the holy law loved more than life.',
       sv.verse_id, ev.verse_id, 'extras', 62134
  FROM _session253_2mac6_lookup sv, _session253_2mac6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=18
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=6 AND ev.verse_number=23
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '2-maccabees-6-notable-example-better-resurrection',
       E'A notable example — the better resurrection',
       E'Eleazar dies to teach the young to die well: *And leave a notable example to such as be young to die willingly and courageously for the honourable and holy laws. And when he had said these words, immediately he went to the torment:* (2 Maccabees 6:28). He suffers in body but is content in soul, fearing Yahuah: *But when he was ready to die with stripes, he groaned, and said, It is manifest to Yahuah (God), that has the holy knowledge, that whereas I might have been delivered from death, I now endure sore pains in body by being beaten: but in soul am well content to suffer these things, because I fear him.* (2 Maccabees 6:30). This is the very faith Hebrews names in its roll of witnesses: *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection:* (Hebrews 11:35) — and the seven brothers of the next chapter speak its ground aloud: *You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* (2 Maccabees 7:9). The hope that lets a man refuse deliverance is the resurrection itself: *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* (Daniel 12:2).',
       sv.verse_id, ev.verse_id, 'extras', 62137
  FROM _session253_2mac6_lookup sv, _session253_2mac6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=28
   AND ev.edition_slug='apocrypha' AND ev.book_slug='2-maccabees' AND ev.chapter_number=6 AND ev.verse_number=31
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 2-maccabees-6-abomination-of-desolation
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 11:31 — *And arms shall stand on his part, and they shall pollute the sanctuary of strength, and shall take away the daily sacrifice, and they shall place the abomination that maketh desolate.* Daniel foresaw exactly this polluting of the sanctuary that Antiochus now works in 2 Maccabees 6:2.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac6_lookup sv, _session253_2mac6_lookup tv
 WHERE t.slug='2-maccabees-6-abomination-of-desolation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 24:15 — *When ye therefore shall see the abomination of desolation, spoken of by Daniel the prophet, stand in the holy place, (whoso readeth, let him understand:)* The Messiah lifts the desolation of the altar in 2 Maccabees 6:5 into the sign of the end, the same abomination set up again.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac6_lookup sv, _session253_2mac6_lookup tv
 WHERE t.slug='2-maccabees-6-abomination-of-desolation'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=24 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-6-sabbath-feasts-circumcision
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 10:22 — *And it was at Jerusalem the feast of the dedication, and it was winter.* The Sabbath and feasts forbidden in 2 Maccabees 6:6 are the very appointed times the Messiah walks in — keeping even the dedication won by these martyrs'' faithfulness.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac6_lookup sv, _session253_2mac6_lookup tv
 WHERE t.slug='2-maccabees-6-sabbath-feasts-circumcision'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=10 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-6-chastening-not-destruction
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 12:6 — *For whom Yahuah (Lord) loveth he chasteneth, and scourgeth every son whom he receiveth.* The punishments judged in 2 Maccabees 6:12 to be chastening and not destruction are exactly the scourging Hebrews names as the mark of a received son.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac6_lookup sv, _session253_2mac6_lookup tv
 WHERE t.slug='2-maccabees-6-chastening-not-destruction'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Proverbs 3:11 — *My son, despise not the chastening of Yahuah (LORD); neither be weary of his correction:* The plea of 2 Maccabees 6:12 not to be discouraged is Proverbs'' charge not to despise the Father''s correction.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac6_lookup sv, _session253_2mac6_lookup tv
 WHERE t.slug='2-maccabees-6-chastening-not-destruction'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 3:12 — *For whom Yahuah (LORD) loveth he correcteth; even as a father the son in whom he delighteth.* The mercy never withdrawn in 2 Maccabees 6:16 is the fatherly delight behind every correction in Proverbs.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac6_lookup sv, _session253_2mac6_lookup tv
 WHERE t.slug='2-maccabees-6-chastening-not-destruction'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=3 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 12:11 — *Now no chastening for the present seemeth to be joyous, but grievous: nevertheless afterward it yieldeth the peaceable fruit of righteousness unto them which are exercised thereby.* The adversity that never forsakes the people (2 Maccabees 6:16) bears, as Hebrews says, the peaceable fruit of righteousness.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac6_lookup sv, _session253_2mac6_lookup tv
 WHERE t.slug='2-maccabees-6-chastening-not-destruction'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=12 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-6-eleazar-swines-flesh
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 11:7 — *And the swine, though he divide the hoof, and be clovenfooted, yet he cheweth not the cud; he is unclean to you.* The flesh Eleazar spits forth in 2 Maccabees 6:19 is the swine the Torah itself names unclean.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac6_lookup sv, _session253_2mac6_lookup tv
 WHERE t.slug='2-maccabees-6-eleazar-swines-flesh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 11:8 — *Of their flesh shall ye not eat, and their carcase shall ye not touch; they are unclean to you.* Eleazar''s resolve in 2 Maccabees 6:20 to taste no unlawful thing for love of life is obedience to this very command.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac6_lookup sv, _session253_2mac6_lookup tv
 WHERE t.slug='2-maccabees-6-eleazar-swines-flesh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=11 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 1:8 — *But Daniel purposed in his heart that he would not defile himself with the portion of the king''s meat, nor with the wine which he drank: therefore he requested of the prince of the eunuchs that he might not defile himself.* Eleazar, choosing the grave by the holy law (2 Maccabees 6:23), stands with Daniel who purposed in his heart not to defile himself at the king''s table.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac6_lookup sv, _session253_2mac6_lookup tv
 WHERE t.slug='2-maccabees-6-eleazar-swines-flesh'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=1 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 2-maccabees-6-notable-example-better-resurrection
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Hebrews 11:35 — *Women received their dead raised to life again: and others were tortured, not accepting deliverance; that they might obtain a better resurrection:* Eleazar, beaten yet content in soul (2 Maccabees 6:30), is among the tortured who refuse deliverance for a better resurrection.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac6_lookup sv, _session253_2mac6_lookup tv
 WHERE t.slug='2-maccabees-6-notable-example-better-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=11 AND tv.verse_number=35
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 12:2 — *And many of them that sleep in the dust of the earth shall awake, some to everlasting life, and some to shame and everlasting contempt.* The notable example of dying for the holy laws (2 Maccabees 6:28) rests on Daniel''s promise that the sleepers awake to everlasting life.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac6_lookup sv, _session253_2mac6_lookup tv
 WHERE t.slug='2-maccabees-6-notable-example-better-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=12 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Maccabees 7:9 — *And when he was at the last gasp, he said, You like a fury takest us out of this present life, but the King of the world shall raise us up, who have died for his laws, to everlasting life.* The content soul of Eleazar (2 Maccabees 6:30) speaks plainly in his successors: the King of the world raises up those who die for His laws.'
  FROM cross_reference_threads t, cross_references x, _session253_2mac6_lookup sv, _session253_2mac6_lookup tv
 WHERE t.slug='2-maccabees-6-notable-example-better-resurrection'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='2-maccabees' AND sv.chapter_number=6 AND sv.verse_number=30
   AND tv.edition_slug='apocrypha' AND tv.book_slug='2-maccabees' AND tv.chapter_number=7 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

