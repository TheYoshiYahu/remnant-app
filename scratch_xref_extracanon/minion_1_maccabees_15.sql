-- ----- fragment: minion_1maccabees_15.sql (session253 1-maccabees 15) -----
-- Source anchor: apocrypha/1-maccabees ch15. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1mac15 (view _session253_1mac15_lookup). Sort band base 61850, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1mac15_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-maccabees-15-flatteries-of-the-king
  ('apocrypha', '1-maccabees', 15, 9, 'canon', 'daniel', 11, 21, 'free', E'Daniel 11:21 — *And in his estate shall stand up a vile person, to whom they shall not give the honour of the kingdom: but he shall come in peaceably, and obtain the kingdom by flatteries.* The Seleucid honours of 1 Maccabees 15:9 are flatteries of the king-of-man, who gains by smooth words what he cannot hold by right.'),
  ('apocrypha', '1-maccabees', 15, 9, 'canon', 'isaiah', 49, 23, 'free', E'Isaiah 49:23 — *And kings shall be thy nursing fathers, and their queens thy nursing mothers: they shall bow down to thee with their face toward the earth, and lick up the dust of thy feet; and thou shalt know that I am Yahuah (LORD): for they shall not be ashamed that wait for me.* The honour Antiochus dangles in 1 Maccabees 15:9 is a counterfeit of the true exaltation Yahuah gives the people who wait for Him.'),
  -- thread: 1-maccabees-15-nations-acknowledge-the-gathered
  ('apocrypha', '1-maccabees', 15, 19, 'canon', 'isaiah', 49, 22, 'free', E'Isaiah 49:22 — *Thus saith Adonai Yahuah (the Lord GOD), Behold, I will lift up mine hand to the Gentiles, and set up my standard to the people: and they shall bring thy sons in their arms, and thy daughters shall be carried upon their shoulders.* The Roman decree of 1 Maccabees 15:19 protecting the Jews among the nations foreshadows the day Yahuah moves the Gentiles to carry His scattered people home.'),
  ('apocrypha', '1-maccabees', 15, 23, 'canon', 'isaiah', 60, 3, 'free', E'Isaiah 60:3 — *And the Gentiles shall come to thy light, and kings to the brightness of thy rising.* The catalogue of nations addressed on Israel''s behalf in 1 Maccabees 15:23 anticipates the Gentiles and their kings drawn toward the light of the regathered people.'),
  ('apocrypha', '1-maccabees', 15, 17, 'canon', 'zechariah', 8, 22, 'free', E'Zechariah 8:22 — *Yea, many people and strong nations shall come to seek Yahuah Tseva''ot (LORD of hosts) in Jerusalem, and to pray before Yahuah (LORD).* The ambassadors of the high priest renewing league with the nations in 1 Maccabees 15:17 prefigure the strong nations turning toward Jerusalem and her God.'),
  -- thread: 1-maccabees-15-inheritance-of-the-fathers
  ('apocrypha', '1-maccabees', 15, 33, 'canon', 'leviticus', 25, 23, 'free', E'Leviticus 25:23 — *The land shall not be sold for ever: for the land is mine; for ye are strangers and sojourners with me.* Simon''s plea in 1 Maccabees 15:33 that they hold only the inheritance of their fathers rests on Yahuah''s claim that the land is His gift to Israel, not man''s to barter.'),
  ('apocrypha', '1-maccabees', 15, 34, 'apocrypha', '1-maccabees', 14, 8, 'extras', E'1 Maccabees 14:8 — *Then did they till their ground in peace, and the earth gave her increase, and the trees of the field their fruit.* When the inheritance of the fathers is held in faithfulness as Simon insists in 1 Maccabees 15:34, the covenant land yields its increase in peace.'),
  -- thread: 1-maccabees-15-the-king-breaks-the-covenant
  ('apocrypha', '1-maccabees', 15, 27, 'canon', 'daniel', 9, 26, 'free', E'Daniel 9:26 — *And after threescore and two weeks shall Messiah be cut off, but not for himself: and the people of the prince that shall come shall destroy the city and the sanctuary; and the end thereof shall be with a flood, and unto the end of the war desolations are determined.* Antiochus breaking all his covenants in 1 Maccabees 15:27 is the same treachery of the prince-to-come, whose word lasts only as long as it serves him.'),
  ('apocrypha', '1-maccabees', 15, 27, 'apocrypha', '1-maccabees', 8, 23, 'extras', E'1 Maccabees 8:23 — *Good success be to the Romans, and to the people of the Yahudim (Jews), by sea and by land for ever: the sword also and enemy be far from them,* Against Antiochus, who in 1 Maccabees 15:27 brake every covenant, stands the league Israel sought as a word meant to stand for ever.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1mac15_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1mac15_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-15-flatteries-of-the-king',
       E'The king who comes in by flatteries',
       E'Antiochus VII, pressing his claim, courts Simon with a sheaf of honours: *Now therefore I confirm to you all the oblations which the kings before me granted you, and whatsoever gifts besides they granted.* (1 Maccabees 15:5), promising *we will honour you, and your nation, and your temple, with great honour, so that your honour shall be known throughout the world.* (1 Maccabees 15:9). It is the kingdom-of-man''s old craft — not the sword first but the smooth word, the same way Daniel foresaw the vile one rising: *And in his estate shall stand up a vile person, to whom they shall not give the honour of the kingdom: but he shall come in peaceably, and obtain the kingdom by flatteries.* (Daniel 11:21). Yet the true honour of the nations bowing to the covenant people is no Seleucid grant; it is Yahuah''s promise: *And kings shall be thy nursing fathers, and their queens thy nursing mothers: they shall bow down to thee with their face toward the earth, and lick up the dust of thy feet; and thou shalt know that I am Yahuah (LORD): for they shall not be ashamed that wait for me.* (Isaiah 49:23). The system of man flatters to seize; the kingdom of Elohim exalts those who wait for Him.',
       sv.verse_id, ev.verse_id, 'extras', 61850
  FROM _session253_1mac15_lookup sv, _session253_1mac15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=15 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=15 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-15-nations-acknowledge-the-gathered',
       E'The nations write to spare the regathered people',
       E'Rome''s consul sends letters to every king and country on behalf of the Jews: *We thought it good therefore to write to the kings and countries, that they should do them no harm, nor fight against them, their cities, or countries, nor yet aid their enemies against them.* (1 Maccabees 15:19), and the roll of nations is read out — *And to all the countries and to Sampsames, and the Lacedemonians, and to Delus, and Myndus, and Sicyon, and Caria, and Samos, and Pamphylia, and Lycia, and Halicarnassus, and Rhodus, and Aradus, and Cos, and Side, and Aradus, and Gortyna, and Cnidus, and Cyprus, and Cyrene.* (1 Maccabees 15:23) — the dispersed of Israel acknowledged across the isles of the sea. This is the prophets'' picture of the ingathering, when the Gentiles themselves carry the covenant people home: *Thus saith Adonai Yahuah (the Lord GOD), Behold, I will lift up mine hand to the Gentiles, and set up my standard to the people: and they shall bring thy sons in their arms, and thy daughters shall be carried upon their shoulders.* (Isaiah 49:22). Isaiah saw the kings drawn to her light — *And the Gentiles shall come to thy light, and kings to the brightness of thy rising.* (Isaiah 60:3) — and Zechariah the strong nations seeking Yahuah in Jerusalem: *Yea, many people and strong nations shall come to seek Yahuah Tseva''ot (LORD of hosts) in Jerusalem, and to pray before Yahuah (LORD).* (Zechariah 8:22). The nations bending toward the gathered remnant is the covenant kept — not a people replaced, but Israel honoured among the kingdoms.',
       sv.verse_id, ev.verse_id, 'extras', 61853
  FROM _session253_1mac15_lookup sv, _session253_1mac15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=15 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=15 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-15-inheritance-of-the-fathers',
       E'We hold the inheritance of our fathers',
       E'When Athenobius demands Joppa and Gazera back, Simon answers from the covenant: *We have neither taken other men''s land, nor holden that which appertaineth to others, but the inheritance of our fathers, which our enemies had wrongfully in possession a certain time.* (1 Maccabees 15:33), and presses it home — *Wherefore we, having opportunity, hold the inheritance of our fathers.* (1 Maccabees 15:34). The land is no spoil of conquest but the grant of Yahuah, who alone owns it and gave it to Israel''s fathers: *The land shall not be sold for ever: for the land is mine; for ye are strangers and sojourners with me.* (Leviticus 25:23). And when the inheritance is held in faithfulness, the land itself answers, as it did under Simon: *Then did they till their ground in peace, and the earth gave her increase, and the trees of the field their fruit.* (1 Maccabees 14:8). Simon claims no empire of man; he keeps the portion the covenant assigned.',
       sv.verse_id, ev.verse_id, 'extras', 61856
  FROM _session253_1mac15_lookup sv, _session253_1mac15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=15 AND sv.verse_number=33
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=15 AND ev.verse_number=34
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-maccabees-15-the-king-breaks-the-covenant',
       E'He brake all the covenants he had made',
       E'Once Tryphon is cornered, Antiochus no longer needs Simon, and his fair words turn: *Nevertheless he would not receive them, but brake all the covenants which he had made with him afore, and became strange to him.* (1 Maccabees 15:27). This is the signature of the kingdom-of-man — the league made only to be broken when the advantage shifts, as Daniel foresaw of the prince to come: *And after threescore and two weeks shall Messiah be cut off, but not for himself: and the people of the prince that shall come shall destroy the city and the sanctuary; and the end thereof shall be with a flood, and unto the end of the war desolations are determined.* (Daniel 9:26). Set against the faithless Antiochus stands the league Israel sought with steadfastness, recorded as a perpetual word: *Good success be to the Romans, and to the people of the Yahudim (Jews), by sea and by land for ever: the sword also and enemy be far from them,* (1 Maccabees 8:23). The system of man swears and forswears; the covenant of Yahuah endures, and His people keep faith though kings do not.',
       sv.verse_id, ev.verse_id, 'extras', 61859
  FROM _session253_1mac15_lookup sv, _session253_1mac15_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=15 AND sv.verse_number=27
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-maccabees' AND ev.chapter_number=15 AND ev.verse_number=27
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-maccabees-15-flatteries-of-the-king
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 11:21 — *And in his estate shall stand up a vile person, to whom they shall not give the honour of the kingdom: but he shall come in peaceably, and obtain the kingdom by flatteries.* The Seleucid honours of 1 Maccabees 15:9 are flatteries of the king-of-man, who gains by smooth words what he cannot hold by right.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac15_lookup sv, _session253_1mac15_lookup tv
 WHERE t.slug='1-maccabees-15-flatteries-of-the-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=15 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=11 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 49:23 — *And kings shall be thy nursing fathers, and their queens thy nursing mothers: they shall bow down to thee with their face toward the earth, and lick up the dust of thy feet; and thou shalt know that I am Yahuah (LORD): for they shall not be ashamed that wait for me.* The honour Antiochus dangles in 1 Maccabees 15:9 is a counterfeit of the true exaltation Yahuah gives the people who wait for Him.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac15_lookup sv, _session253_1mac15_lookup tv
 WHERE t.slug='1-maccabees-15-flatteries-of-the-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=15 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-15-nations-acknowledge-the-gathered
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 49:22 — *Thus saith Adonai Yahuah (the Lord GOD), Behold, I will lift up mine hand to the Gentiles, and set up my standard to the people: and they shall bring thy sons in their arms, and thy daughters shall be carried upon their shoulders.* The Roman decree of 1 Maccabees 15:19 protecting the Jews among the nations foreshadows the day Yahuah moves the Gentiles to carry His scattered people home.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac15_lookup sv, _session253_1mac15_lookup tv
 WHERE t.slug='1-maccabees-15-nations-acknowledge-the-gathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=15 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=49 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 60:3 — *And the Gentiles shall come to thy light, and kings to the brightness of thy rising.* The catalogue of nations addressed on Israel''s behalf in 1 Maccabees 15:23 anticipates the Gentiles and their kings drawn toward the light of the regathered people.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac15_lookup sv, _session253_1mac15_lookup tv
 WHERE t.slug='1-maccabees-15-nations-acknowledge-the-gathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=15 AND sv.verse_number=23
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=60 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 8:22 — *Yea, many people and strong nations shall come to seek Yahuah Tseva''ot (LORD of hosts) in Jerusalem, and to pray before Yahuah (LORD).* The ambassadors of the high priest renewing league with the nations in 1 Maccabees 15:17 prefigure the strong nations turning toward Jerusalem and her God.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac15_lookup sv, _session253_1mac15_lookup tv
 WHERE t.slug='1-maccabees-15-nations-acknowledge-the-gathered'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=15 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=8 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-15-inheritance-of-the-fathers
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Leviticus 25:23 — *The land shall not be sold for ever: for the land is mine; for ye are strangers and sojourners with me.* Simon''s plea in 1 Maccabees 15:33 that they hold only the inheritance of their fathers rests on Yahuah''s claim that the land is His gift to Israel, not man''s to barter.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac15_lookup sv, _session253_1mac15_lookup tv
 WHERE t.slug='1-maccabees-15-inheritance-of-the-fathers'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=15 AND sv.verse_number=33
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=25 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Maccabees 14:8 — *Then did they till their ground in peace, and the earth gave her increase, and the trees of the field their fruit.* When the inheritance of the fathers is held in faithfulness as Simon insists in 1 Maccabees 15:34, the covenant land yields its increase in peace.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac15_lookup sv, _session253_1mac15_lookup tv
 WHERE t.slug='1-maccabees-15-inheritance-of-the-fathers'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=15 AND sv.verse_number=34
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=14 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-maccabees-15-the-king-breaks-the-covenant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Daniel 9:26 — *And after threescore and two weeks shall Messiah be cut off, but not for himself: and the people of the prince that shall come shall destroy the city and the sanctuary; and the end thereof shall be with a flood, and unto the end of the war desolations are determined.* Antiochus breaking all his covenants in 1 Maccabees 15:27 is the same treachery of the prince-to-come, whose word lasts only as long as it serves him.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac15_lookup sv, _session253_1mac15_lookup tv
 WHERE t.slug='1-maccabees-15-the-king-breaks-the-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=15 AND sv.verse_number=27
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'1 Maccabees 8:23 — *Good success be to the Romans, and to the people of the Yahudim (Jews), by sea and by land for ever: the sword also and enemy be far from them,* Against Antiochus, who in 1 Maccabees 15:27 brake every covenant, stands the league Israel sought as a word meant to stand for ever.'
  FROM cross_reference_threads t, cross_references x, _session253_1mac15_lookup sv, _session253_1mac15_lookup tv
 WHERE t.slug='1-maccabees-15-the-king-breaks-the-covenant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-maccabees' AND sv.chapter_number=15 AND sv.verse_number=27
   AND tv.edition_slug='apocrypha' AND tv.book_slug='1-maccabees' AND tv.chapter_number=8 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

