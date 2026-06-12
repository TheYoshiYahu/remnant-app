-- ----- fragment: minion_judith_04.sql (session253 judith 4) -----
-- Source anchor: apocrypha/judith ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: jdt4 (view _session253_jdt4_lookup). Sort band base 60075, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_jdt4_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: judith-4-newly-returned-sanctuary
  ('apocrypha', 'judith', 4, 3, 'canon', 'ezra', 6, 16, 'free', E'Ezra 6:16 — *And the children of Yashar''el (Israel), the priests, and the Levites, and the rest of the children of the captivity, kept the dedication of this house of Elohim (God) with joy,* the same return-and-rededication that Judith 4:3 names as ''sanctified after the profanation.'''),
  ('apocrypha', 'judith', 4, 1, 'apocrypha', '1-maccabees', 1, 54, 'extras', E'1 Maccabees 1:54 — *Now the fifteenth day of the month Casleu, in the hundred forty and fifth year, they set up the abomination of desolation upon the altar, and builded idol altars throughout the cities of Juda on every side;* the recurring profanation that Holofernes'' threat in Judith 4:1 prefigures.'),
  ('apocrypha', 'judith', 4, 2, 'apocrypha', '1-maccabees', 1, 63, 'extras', E'1 Maccabees 1:63 — *Wherefore they chose rather to die, that they might not be defiled with meats, and that they might not profane the holy covenant: so then they died.* the Torah-faithfulness unto death behind Judith 4:2''s fear ''for Jerusalem, and for the temple.'''),
  -- thread: judith-4-keep-the-passes
  ('apocrypha', 'judith', 4, 7, 'canon', 'daniel', 11, 30, 'free', E'Daniel 11:30 — *For the ships of Chittim shall come against him: therefore he shall be grieved, and return, and have indignation against the holy covenant: so shall he do; he shall even return, and have intelligence with them that forsake the holy covenant.* the same tyrant-against-the-covenant pattern Judith 4:7 braces for at the passes into Judea.'),
  ('apocrypha', 'judith', 4, 5, 'canon', 'exodus', 19, 5, 'free', E'Exodus 19:5 — *Now therefore, if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people: for all the earth is mine:* the election that makes the fortified remnant of Judith 4:5 Yahuah''s own to defend.'),
  -- thread: judith-4-cried-to-yahuah-fasting
  ('apocrypha', 'judith', 4, 9, 'canon', 'joel', 2, 12, 'free', E'Joel 2:12 — *Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning:* the prophetic call that Judith 4:9 enacts as every man cries to Yahuah and humbles his soul.'),
  ('apocrypha', 'judith', 4, 9, 'canon', '2-chronicles', 20, 3, 'free', E'2 Chronicles 20:3 — *And Jehoshaphat feared, and set himself to seek Yahuah (LORD), and proclaimed a fast throughout all Yahudah (Judah).* the identical response to an overwhelming invader that Judith 4:9 records of all Israel.'),
  ('apocrypha', 'judith', 4, 11, 'canon', 'jonah', 3, 5, 'free', E'Jonah 3:5 — *So the people of Nineveh believed Elohim (God), and proclaimed a fast, and put on sackcloth, from the greatest of them even to the least of them.* the same fast-and-sackcloth from greatest to least that Judith 4:11 spreads before the temple.'),
  -- thread: judith-4-give-not-thine-heritage
  ('apocrypha', 'judith', 4, 12, 'canon', 'joel', 2, 17, 'free', E'Joel 2:17 — *Let the priests, the ministers of Yahuah (LORD), weep between the porch and the altar, and let them say, Spare thy people, O Yahuah (LORD), and give not thine heritage to reproach, that the heathen should rule over them: wherefore should they say among the people, Where is their Elohim (God)?* nearly the word-for-word plea Judith 4:12 raises that Yahuah not give His inheritance to reproach and the nations'' rejoicing.'),
  ('apocrypha', 'judith', 4, 12, 'canon', 'exodus', 2, 24, 'free', E'Exodus 2:24 — *And Elohim (God) heard their groaning, and Elohim (God) remembered his covenant with Abraham, with Isaac, and with Jacob.* the covenant-memory ground on which Judith 4:12 dares to plead for children, wives, cities, and sanctuary.'),
  -- thread: judith-4-yahuah-heard-fasted
  ('apocrypha', 'judith', 4, 13, 'canon', '2-chronicles', 20, 17, 'free', E'2 Chronicles 20:17 — *Ye shall not need to fight in this battle: set yourselves, stand ye still, and see the salvation of Yahuah (LORD) with you, O Yahudah (Judah) and Jerusalem: fear not, nor be dismayed; to morrow go out against them: for Yahuah (LORD) will be with you.* the assurance that follows the fast in Judith 4:13 — the deliverance is Yahuah''s, not the wall''s.'),
  ('apocrypha', 'judith', 4, 13, 'canon', 'jonah', 3, 10, 'free', E'Jonah 3:10 — *And Elohim (God) saw their works, that they turned from their evil way; and Elohim (God) repented of the evil, that he had said that he would do unto them; and he did it not.* the same Yahuah who sees and answers a humbled people, as He hears Judith 4:13.'),
  ('apocrypha', 'judith', 4, 13, 'canon', 'psalms', 102, 13, 'free', E'Psalm 102:13 — *Thou shalt arise, and have mercy upon Zion: for the time to favour her, yea, the set time, is come.* the appointed mercy on Zion that Judith 4:13''s heard prayer sets in motion.'),
  -- thread: judith-4-priests-daily-offering-sackcloth
  ('apocrypha', 'judith', 4, 14, 'canon', 'numbers', 28, 3, 'free', E'Numbers 28:3 — *And thou shalt say unto them, This is the offering made by fire which ye shall offer unto Yahuah (LORD); two lambs of the first year without spot day by day, for a continual burnt offering.* the Torah''s continual burnt offering that the priests keep even amid the sackcloth of Judith 4:14 — the law stands.'),
  ('apocrypha', 'judith', 4, 14, 'canon', 'joel', 1, 13, 'free', E'Joel 1:13 — *Gird yourselves, and lament, ye priests: howl, ye ministers of the altar: come, lie all night in sackcloth, ye ministers of my Elohim (God): for the meat offering and the drink offering is withholden from the house of your Elohim (God).* the prophetic summons to the very mourning ministry Judith 4:14 shows, loins girt with sackcloth at the altar.'),
  ('apocrypha', 'judith', 4, 14, 'canon', 'hebrews', 5, 1, 'free', E'Hebrews 5:1 — *For every high priest taken from among men is ordained for men in things pertaining to Elohim (God), that he may offer both gifts and sacrifices for sins:* the office Joacim fills in Judith 4:14, gifts and free offerings before Yahuah, foreshadowing the true Intercessor.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_jdt4_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_jdt4_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-4-newly-returned-sanctuary',
       E'Newly returned from captivity, the sanctuary sanctified after the profanation',
       E'Judith opens its crisis in the long shadow of exile and rededication: *For they were newly returned from the captivity, and all the people of Judea were lately gathered together: and the vessels, and the altar, and the house, were sanctified after the profanation.* (Judith 4:3) The remnant has just come home and re-hallowed the house — and now a kingdom-of-man tyrant threatens to profane it again. This is the very joy Ezra records of the second house: *And the children of Yashar''el (Israel), the priests, and the Levites, and the rest of the children of the captivity, kept the dedication of this house of Elohim (God) with joy* (Ezra 6:16). The same enemy returns in every age — Antiochus *set up the abomination of desolation upon the altar* and the faithful *chose rather to die, that they might not be defiled with meats, and that they might not profane the holy covenant* (1 Maccabees 1:54; 1 Maccabees 1:63). Judith 4 is the standing pattern: the altar restored, the System rising again to defile it, and a covenant people who will not bow.',
       sv.verse_id, ev.verse_id, 'extras', 60075
  FROM _session253_jdt4_lookup sv, _session253_jdt4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=4 AND ev.verse_number=3
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-4-keep-the-passes',
       E'Possessing the high mountains, keeping the passes against the tyrant',
       E'Before they pray, the people act in faith — fortifying the narrow ways: *And possessed themselves beforehand of all the tops of the high mountains, and fortified the villages that were in them, and laid up victuals for the provision of war: for their fields were of late reaped.* (Judith 4:5) Holofernes, captain of Nebuchadnezzar, is the kingdom-of-man system marching against the elect, and the strait pass is where the weak will confound the mighty. The Maccabean profile names the same enemy and the same defiance of the holy covenant: *For the ships of Chittim shall come against him: therefore he shall be grieved, and return, and have indignation against the holy covenant* (Daniel 11:30). The hope is never in the wall but in the One who chose this people — the deliverance will be Yahuah''s, by election, through a hand none expected.',
       sv.verse_id, ev.verse_id, 'extras', 60078
  FROM _session253_jdt4_lookup sv, _session253_jdt4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=4 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-4-cried-to-yahuah-fasting',
       E'Every man of Israel cried to Yahuah with fasting and sackcloth',
       E'The heart of the chapter is a national turning: *Then every man of Yashar''el (Israel) cried to Yahuah (God) with great fervency, and with great vehemency did they humble their souls:* (Judith 4:9) This is the prophet''s own summons answered in the act — *Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning* (Joel 2:12). When Jehoshaphat faced the same overwhelming multitude, *Jehoshaphat feared, and set himself to seek Yahuah (LORD), and proclaimed a fast throughout all Yahudah (Judah)* (2 Chronicles 20:3). Even Nineveh knew the posture: *So the people of Nineveh believed Elohim (God), and proclaimed a fast, and put on sackcloth, from the greatest of them even to the least of them* (Jonah 3:5). The covenant people in the day of trouble do not first reach for the sword — they reach for the One who alone can save.',
       sv.verse_id, ev.verse_id, 'extras', 60081
  FROM _session253_jdt4_lookup sv, _session253_jdt4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=4 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-4-give-not-thine-heritage',
       E'Cried with one consent: give not thy heritage to reproach',
       E'Their cry has the exact shape of the priestly intercession Joel commands: *And cried to Yahuah (God) of Yashar''el (Israel) all with one consent earnestly, that he would not give their children for a prey, and their wives for a spoil, and the cities of their inheritance to destruction, and the sanctuary to profanation and reproach, and for the nations to rejoice at.* (Judith 4:12) Joel sets the very words in the mouths of the ministers: *Let the priests, the ministers of Yahuah (LORD), weep between the porch and the altar, and let them say, Spare thy people, O Yahuah (LORD), and give not thine heritage to reproach, that the heathen should rule over them* (Joel 2:17). The plea rests on Yahuah''s covenant memory, the same that broke Egypt''s grip: *And Elohim (God) heard their groaning, and Elohim (God) remembered his covenant with Abraham, with Isaac, and with Jacob* (Exodus 2:24). They ask not to be spared for their strength but for His name''s sake — that the nations not rejoice over His inheritance.',
       sv.verse_id, ev.verse_id, 'extras', 60084
  FROM _session253_jdt4_lookup sv, _session253_jdt4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=4 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-4-yahuah-heard-fasted',
       E'So Yahuah heard their prayers and looked upon their afflictions',
       E'The narrator answers the cry before the deliverer ever appears: *So Yahuah (God) heard their prayers, and looked upon their afflictions: for the people fasted many days in all Judea and Jerusalem before the sanctuary of Yahuah (God) Almighty.* (Judith 4:13) Jehoshaphat''s fast met the same verdict — *Ye shall not need to fight in this battle: set yourselves, stand ye still, and see the salvation of Yahuah (LORD) with you* (2 Chronicles 20:17). Nineveh''s fast met it too: *And Elohim (God) saw their works, that they turned from their evil way; and Elohim (God) repented of the evil, that he had said that he would do unto them; and he did it not* (Jonah 3:10). And the set time for Zion is always Yahuah''s to give: *Thou shalt arise, and have mercy upon Zion: for the time to favour her, yea, the set time, is come* (Psalm 102:13). The victory is decided in the hearing, not the army; the weak who cry are confounding the mighty already.',
       sv.verse_id, ev.verse_id, 'extras', 60087
  FROM _session253_jdt4_lookup sv, _session253_jdt4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=4 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-4-priests-daily-offering-sackcloth',
       E'The priests, loins girt with sackcloth, offered the daily burnt offering',
       E'The high priest leads the whole house in lamenting intercession while the Torah''s continual offering goes up: *And Joacim the high priest, and all the priests that stood before Yahuah (God), and they which ministered to Yahuah (God), had their loins girt with sackcloth, and offered the daily burnt offerings, with the vows and free gifts of the people* (Judith 4:14). The daily offering is the standing Torah ordinance kept even in crisis: *And thou shalt say unto them, This is the offering made by fire which ye shall offer unto Yahuah (LORD); two lambs of the first year without spot day by day, for a continual burnt offering* (Numbers 28:3). Joel had summoned exactly these ministers to mourn: *Gird yourselves, and lament, ye priests: howl, ye ministers of the altar: come, lie all night in sackcloth, ye ministers of my Elohim (God)* (Joel 1:13). And every such high priest stands as a type of the true Intercessor: *For every high priest taken from among men is ordained for men in things pertaining to Elohim (God), that he may offer both gifts and sacrifices for sins* (Hebrews 5:1). The cry closes pleading not for the strong but for the whole house — that Yahuah look upon all the house of Israel graciously (Judith 4:15).',
       sv.verse_id, ev.verse_id, 'extras', 60090
  FROM _session253_jdt4_lookup sv, _session253_jdt4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=4 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: judith-4-newly-returned-sanctuary
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 6:16 — *And the children of Yashar''el (Israel), the priests, and the Levites, and the rest of the children of the captivity, kept the dedication of this house of Elohim (God) with joy,* the same return-and-rededication that Judith 4:3 names as ''sanctified after the profanation.'''
  FROM cross_reference_threads t, cross_references x, _session253_jdt4_lookup sv, _session253_jdt4_lookup tv
 WHERE t.slug='judith-4-newly-returned-sanctuary'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=6 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Maccabees 1:54 — *Now the fifteenth day of the month Casleu, in the hundred forty and fifth year, they set up the abomination of desolation upon the altar, and builded idol altars throughout the cities of Juda on every side;* the recurring profanation that Holofernes'' threat in Judith 4:1 prefigures.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt4_lookup sv, _session253_jdt4_lookup tv
 WHERE t.slug='judith-4-newly-returned-sanctuary'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=1
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=1 AND tv.verse_number=54
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'1 Maccabees 1:63 — *Wherefore they chose rather to die, that they might not be defiled with meats, and that they might not profane the holy covenant: so then they died.* the Torah-faithfulness unto death behind Judith 4:2''s fear ''for Jerusalem, and for the temple.'''
  FROM cross_reference_threads t, cross_references x, _session253_jdt4_lookup sv, _session253_jdt4_lookup tv
 WHERE t.slug='judith-4-newly-returned-sanctuary'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=2
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=1 AND tv.verse_number=63
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-4-keep-the-passes
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 11:30 — *For the ships of Chittim shall come against him: therefore he shall be grieved, and return, and have indignation against the holy covenant: so shall he do; he shall even return, and have intelligence with them that forsake the holy covenant.* the same tyrant-against-the-covenant pattern Judith 4:7 braces for at the passes into Judea.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt4_lookup sv, _session253_jdt4_lookup tv
 WHERE t.slug='judith-4-keep-the-passes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 19:5 — *Now therefore, if ye will obey my voice indeed, and keep my covenant, then ye shall be a peculiar treasure unto me above all people: for all the earth is mine:* the election that makes the fortified remnant of Judith 4:5 Yahuah''s own to defend.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt4_lookup sv, _session253_jdt4_lookup tv
 WHERE t.slug='judith-4-keep-the-passes'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=19 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-4-cried-to-yahuah-fasting
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 2:12 — *Therefore also now, saith Yahuah (LORD), turn ye even to me with all your heart, and with fasting, and with weeping, and with mourning:* the prophetic call that Judith 4:9 enacts as every man cries to Yahuah and humbles his soul.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt4_lookup sv, _session253_jdt4_lookup tv
 WHERE t.slug='judith-4-cried-to-yahuah-fasting'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Chronicles 20:3 — *And Jehoshaphat feared, and set himself to seek Yahuah (LORD), and proclaimed a fast throughout all Yahudah (Judah).* the identical response to an overwhelming invader that Judith 4:9 records of all Israel.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt4_lookup sv, _session253_jdt4_lookup tv
 WHERE t.slug='judith-4-cried-to-yahuah-fasting'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jonah 3:5 — *So the people of Nineveh believed Elohim (God), and proclaimed a fast, and put on sackcloth, from the greatest of them even to the least of them.* the same fast-and-sackcloth from greatest to least that Judith 4:11 spreads before the temple.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt4_lookup sv, _session253_jdt4_lookup tv
 WHERE t.slug='judith-4-cried-to-yahuah-fasting'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=3 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-4-give-not-thine-heritage
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Joel 2:17 — *Let the priests, the ministers of Yahuah (LORD), weep between the porch and the altar, and let them say, Spare thy people, O Yahuah (LORD), and give not thine heritage to reproach, that the heathen should rule over them: wherefore should they say among the people, Where is their Elohim (God)?* nearly the word-for-word plea Judith 4:12 raises that Yahuah not give His inheritance to reproach and the nations'' rejoicing.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt4_lookup sv, _session253_jdt4_lookup tv
 WHERE t.slug='judith-4-give-not-thine-heritage'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=2 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 2:24 — *And Elohim (God) heard their groaning, and Elohim (God) remembered his covenant with Abraham, with Isaac, and with Jacob.* the covenant-memory ground on which Judith 4:12 dares to plead for children, wives, cities, and sanctuary.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt4_lookup sv, _session253_jdt4_lookup tv
 WHERE t.slug='judith-4-give-not-thine-heritage'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-4-yahuah-heard-fasted
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Chronicles 20:17 — *Ye shall not need to fight in this battle: set yourselves, stand ye still, and see the salvation of Yahuah (LORD) with you, O Yahudah (Judah) and Jerusalem: fear not, nor be dismayed; to morrow go out against them: for Yahuah (LORD) will be with you.* the assurance that follows the fast in Judith 4:13 — the deliverance is Yahuah''s, not the wall''s.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt4_lookup sv, _session253_jdt4_lookup tv
 WHERE t.slug='judith-4-yahuah-heard-fasted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=20 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jonah 3:10 — *And Elohim (God) saw their works, that they turned from their evil way; and Elohim (God) repented of the evil, that he had said that he would do unto them; and he did it not.* the same Yahuah who sees and answers a humbled people, as He hears Judith 4:13.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt4_lookup sv, _session253_jdt4_lookup tv
 WHERE t.slug='judith-4-yahuah-heard-fasted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='jonah' AND tv.chapter_number=3 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 102:13 — *Thou shalt arise, and have mercy upon Zion: for the time to favour her, yea, the set time, is come.* the appointed mercy on Zion that Judith 4:13''s heard prayer sets in motion.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt4_lookup sv, _session253_jdt4_lookup tv
 WHERE t.slug='judith-4-yahuah-heard-fasted'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=102 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-4-priests-daily-offering-sackcloth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Numbers 28:3 — *And thou shalt say unto them, This is the offering made by fire which ye shall offer unto Yahuah (LORD); two lambs of the first year without spot day by day, for a continual burnt offering.* the Torah''s continual burnt offering that the priests keep even amid the sackcloth of Judith 4:14 — the law stands.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt4_lookup sv, _session253_jdt4_lookup tv
 WHERE t.slug='judith-4-priests-daily-offering-sackcloth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='numbers' AND tv.chapter_number=28 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Joel 1:13 — *Gird yourselves, and lament, ye priests: howl, ye ministers of the altar: come, lie all night in sackcloth, ye ministers of my Elohim (God): for the meat offering and the drink offering is withholden from the house of your Elohim (God).* the prophetic summons to the very mourning ministry Judith 4:14 shows, loins girt with sackcloth at the altar.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt4_lookup sv, _session253_jdt4_lookup tv
 WHERE t.slug='judith-4-priests-daily-offering-sackcloth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='joel' AND tv.chapter_number=1 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hebrews 5:1 — *For every high priest taken from among men is ordained for men in things pertaining to Elohim (God), that he may offer both gifts and sacrifices for sins:* the office Joacim fills in Judith 4:14, gifts and free offerings before Yahuah, foreshadowing the true Intercessor.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt4_lookup sv, _session253_jdt4_lookup tv
 WHERE t.slug='judith-4-priests-daily-offering-sackcloth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=4 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

