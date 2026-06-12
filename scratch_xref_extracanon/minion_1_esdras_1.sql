-- ----- fragment: minion_1esdras_01.sql (session253 1-esdras 1) -----
-- Source anchor: apocrypha/1-esdras ch1. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1esd1 (view _session253_1esd1_lookup). Sort band base 62500, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1esd1_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-esdras-1-josiahs-passover
  ('apocrypha', '1-esdras', 1, 1, 'canon', '2-chronicles', 35, 1, 'free', E'2 Chronicles 35:1 — *Moreover Josiah kept a passover unto Yahuah (LORD) in Jerusalem: and they killed the passover on the fourteenth day of the first month.* The Chronicler''s verse is the very source 1 Esdras 1:1 retells, fourteenth-day and all.'),
  ('apocrypha', '1-esdras', 1, 1, 'canon', '2-kings', 23, 21, 'free', E'2 Kings 23:21 — *And the king commanded all the people, saying, Keep the passover unto Yahuah Elohaychem (the LORD your God), as it is written in the book of this covenant.* Kings shows the royal command that 1 Esdras 1:1 carries out, keeping the feast as the covenant was written.'),
  ('apocrypha', '1-esdras', 1, 1, 'canon', 'exodus', 12, 6, 'free', E'Exodus 12:6 — *And ye shall keep it up until the fourteenth day of the same month: and the whole assembly of the congregation of Yashar''el (Israel) shall kill it in the evening.* The Torah ordinance fixes the fourteenth day that Josiah keeps in 1 Esdras 1:1.'),
  ('apocrypha', '1-esdras', 1, 2, 'canon', '2-chronicles', 35, 2, 'free', E'2 Chronicles 35:2 — *And he set the priests in their charges, and encouraged them to the service of the house of Yahuah (LORD),* The priests set in their courses in 1 Esdras 1:2 is the Chronicler''s same ordering of the temple service.'),
  -- thread: 1-esdras-1-ark-and-courses
  ('apocrypha', '1-esdras', 1, 3, 'canon', '2-chronicles', 35, 3, 'free', E'2 Chronicles 35:3 — *And said unto the Levites that taught all Yashar''el (Israel), which were holy unto Yahuah (LORD), Put the holy ark in the house which Solomon the son of David king of Yashar''el (Israel) did build; it shall not be a burden upon your shoulders: serve now Yahuah Elohaychem (the LORD your God), and his people Yashar''el (Israel),* The Chronicler''s charge to house the ark is the very speech 1 Esdras 1:3 retells.'),
  ('apocrypha', '1-esdras', 1, 6, 'canon', '2-chronicles', 35, 6, 'free', E'2 Chronicles 35:6 — *So kill the passover, and sanctify yourselves, and prepare your brethren, that they may do according to the word of Yahuah (LORD) by the hand of Moses.* The command kept by Moses'' word in 1 Esdras 1:6 is the Chronicler''s own grounding of the feast in Torah.'),
  ('apocrypha', '1-esdras', 1, 6, 'canon', 'exodus', 12, 24, 'free', E'Exodus 12:24 — *And ye shall observe this thing for an ordinance to thee and to thy sons for ever.* The Passover that 1 Esdras 1:6 keeps by the commandment given to Moses is the everlasting ordinance Exodus fixed for the generations.'),
  -- thread: 1-esdras-1-no-such-passover
  ('apocrypha', '1-esdras', 1, 19, 'canon', '2-chronicles', 35, 17, 'free', E'2 Chronicles 35:17 — *And the children of Yashar''el (Israel) that were present kept the passover at that time, and the feast of unleavened bread seven days.* The seven-day keeping in 1 Esdras 1:19 is the Chronicler''s same record of Israel present at the feast.'),
  ('apocrypha', '1-esdras', 1, 20, 'canon', '2-chronicles', 35, 18, 'free', E'2 Chronicles 35:18 — *And there was no passover like to that kept in Yashar''el (Israel) from the days of Samuel the prophet; neither did all the kings of Yashar''el (Israel) keep such a passover as Josiah kept, and the priests, and the Levites, and all Yahudah (Judah) and Yashar''el (Israel) that were present, and the inhabitants of Jerusalem.* The Samuel-measure of 1 Esdras 1:20 is the Chronicler''s own superlative for Josiah''s feast.'),
  ('apocrypha', '1-esdras', 1, 19, 'canon', 'exodus', 12, 15, 'free', E'Exodus 12:15 — *Seven days shall ye eat unleavened bread; even the first day ye shall put away leaven out of your houses: for whosoever eateth leavened bread from the first day until the seventh day, that soul shall be cut off from Yashar''el (Israel).* The seven days of sweet bread in 1 Esdras 1:19 keep the Torah''s own count for the feast of unleavened bread.'),
  -- thread: 1-esdras-1-josiah-megiddo-and-fall
  ('apocrypha', '1-esdras', 1, 28, 'canon', '2-chronicles', 35, 22, 'free', E'2 Chronicles 35:22 — *Nevertheless Josiah would not turn his face from him, but disguised himself, that he might fight with him, and hearkened not unto the words of Necho from the mouth of Elohim (God), and came to fight in the valley of Megiddo.* The Chronicler''s Megiddo verse is the very fall 1 Esdras 1:28 records, Josiah deaf to the word.'),
  ('apocrypha', '1-esdras', 1, 28, 'canon', '2-kings', 23, 29, 'free', E'2 Kings 23:29 — *In his days Pharaoh-nechoh king of Egypt went up against the king of Assyria to the river Euphrates: and king Josiah went against him; and he slew him at Megiddo, when he had seen him.* Kings names the same Megiddo where Josiah is struck down in 1 Esdras 1:28-29.'),
  ('apocrypha', '1-esdras', 1, 51, 'canon', '2-chronicles', 36, 16, 'free', E'2 Chronicles 36:16 — *But they mocked the messengers of Elohim (God), and despised his words, and misused his prophets, until the wrath of Yahuah (LORD) arose against his people, till there was no remedy.* The prophets made a sport of in 1 Esdras 1:51 is the Chronicler''s same mocking that brought the wrath without remedy.'),
  ('apocrypha', '1-esdras', 1, 50, 'canon', '2-chronicles', 36, 15, 'free', E'2 Chronicles 36:15 — *And Yahuah Elohim (the LORD God) of their fathers sent to them by his messengers, rising up betimes, and sending; because he had compassion on his people, and on his dwelling place:* The messenger sent to call them back in 1 Esdras 1:50 is the Chronicler''s same compassion warning before the end.'),
  -- thread: 1-esdras-1-temple-burned-sabbaths-fulfilled
  ('apocrypha', '1-esdras', 1, 55, 'canon', '2-chronicles', 36, 19, 'free', E'2 Chronicles 36:19 — *And they burnt the house of Elohim (God), and brake down the wall of Jerusalem, and burnt all the palaces thereof with fire, and destroyed all the goodly vessels thereof.* The burning of the house and breaking of the walls in 1 Esdras 1:55 is the Chronicler''s same record of Jerusalem''s fall.'),
  ('apocrypha', '1-esdras', 1, 58, 'canon', '2-chronicles', 36, 21, 'free', E'2 Chronicles 36:21 — *To fulfil the word of Yahuah (LORD) by the mouth of Jeremiah, until the land had enjoyed her sabbaths: for as long as she lay desolate she kept sabbath, to fulfil threescore and ten years.* The sabbaths and seventy years of 1 Esdras 1:58 are the Chronicler''s same close, the land resting by Jeremiah''s word.'),
  ('apocrypha', '1-esdras', 1, 57, 'canon', 'jeremiah', 25, 11, 'free', E'Jeremiah 25:11 — *And this whole land shall be a desolation, and an astonishment; and these nations shall serve the king of Babylon seventy years.* Jeremiah''s seventy-year word is the very prophecy 1 Esdras 1:57 says the captivity fulfilled.'),
  ('apocrypha', '1-esdras', 1, 58, 'canon', 'leviticus', 26, 34, 'free', E'Leviticus 26:34 — *Then shall the land enjoy her sabbaths, as long as it lieth desolate, and ye be in your enemies'' land; even then shall the land rest, and enjoy her sabbaths.* The land enjoying her sabbaths in 1 Esdras 1:58 reaches back to the Torah''s covenant warning that the desolate land would keep the rest the people withheld.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1esd1_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1esd1_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-1-josiahs-passover',
       E'Josiah holds the Passover — the courses set, the lamb slain the fourteenth day',
       E'First Esdras opens where Chronicles opens its last great festival: *And Josias held the feast of the passover in Jerusalem to his Elohim (God), and offered the passover the fourteenth day of the first month;* (1 Esdras 1:1), with *the priests according to their daily courses, being arrayed in long garments, in the temple of Yahuah (God).* (1 Esdras 1:2). It is the Chronicler''s own account retold — *Moreover Josiah kept a passover unto Yahuah (LORD) in Jerusalem: and they killed the passover on the fourteenth day of the first month.* (2 Chronicles 35:1) — and the king''s charge in Kings, *And the king commanded all the people, saying, Keep the passover unto Yahuah Elohaychem (the LORD your God), as it is written in the book of this covenant.* (2 Kings 23:21). And the fourteenth-day reckoning is no innovation: it is the Torah ordinance kept, *And ye shall keep it up until the fourteenth day of the same month: and the whole assembly of the congregation of Yashar''el (Israel) shall kill it in the evening.* (Exodus 12:6). It ain''t new — Josiah does only what Moses was given.',
       sv.verse_id, ev.verse_id, 'extras', 62500
  FROM _session253_1esd1_lookup sv, _session253_1esd1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=1 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=1 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-1-ark-and-courses',
       E'Serve now Yahuah — the ark housed, the Levites in their charge',
       E'Josiah speaks to the Levites: *that they should hallow themselves to Yahuah (God), to set the holy ark of Yahuah (God) in the house that king Solomon the son of David had built:* (1 Esdras 1:3), *You shall no more bear the ark upon your shoulders: now therefore serve Yahuah (God), your Elohim (God), and minister to his people Yashar''el (Israel)* (1 Esdras 1:4). It is the Chronicler''s charge word for word in substance — *Put the holy ark in the house which Solomon the son of David king of Yashar''el (Israel) did build; it shall not be a burden upon your shoulders: serve now Yahuah Elohaychem (the LORD your God), and his people Yashar''el (Israel),* (2 Chronicles 35:3) — and the keeping done *according to the word of Yahuah (LORD) by the hand of Moses.* (2 Chronicles 35:6). Election and ordinance precede the feast: the courses David set, the law Moses gave, the ark Solomon housed — the same covenant witness, unbroken.',
       sv.verse_id, ev.verse_id, 'extras', 62503
  FROM _session253_1esd1_lookup sv, _session253_1esd1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=1 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=1 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-1-no-such-passover',
       E'Such a passover not kept since Samuel — the unleavened bread seven days',
       E'The keeping is total — *So the children of Yashar''el (Israel) which were present held the passover at that time, and the feast of sweet bread seven days.* (1 Esdras 1:19) — and superlative: *And such a passover was not kept in Yashar''el (Israel) since the time of the prophet Samuel.* (1 Esdras 1:20). The Chronicler measures it the same way: *And there was no passover like to that kept in Yashar''el (Israel) from the days of Samuel the prophet* (2 Chronicles 35:18), and the seven-day feast of unleavened bread is the Torah''s own command — *Seven days shall ye eat unleavened bread; even the first day ye shall put away leaven out of your houses* (Exodus 12:15). It ain''t new: the greatest feast in centuries is simply the oldest ordinance kept whole.',
       sv.verse_id, ev.verse_id, 'extras', 62506
  FROM _session253_1esd1_lookup sv, _session253_1esd1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=1 AND sv.verse_number=19
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=1 AND ev.verse_number=20
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-1-josiah-megiddo-and-fall',
       E'Josiah falls at Megiddo, the messengers mocked, the wrath with no remedy',
       E'Josiah will not turn from Pharaoh: *Howbeit Josias did not turn back his chariot from him, but undertook to fight with him, not regarding the words of the prophet Jeremy spoken by the mouth of Yahuah (God):* (1 Esdras 1:28), and at Megiddo he is brought home to die — and after him the kings do evil till the wrath rises. *But they had his messengers in derision; and, look, when Yahuah (God) spoke to them, they made a sport of his prophets:* (1 Esdras 1:51). The Chronicler tells it the same: Josiah *hearkened not unto the words of Necho from the mouth of Elohim (God), and came to fight in the valley of Megiddo* (2 Chronicles 35:22); and the generation''s end is sealed, *But they mocked the messengers of Elohim (God), and despised his words, and misused his prophets, until the wrath of Yahuah (LORD) arose against his people, till there was no remedy.* (2 Chronicles 36:16). The good king kept the feast; the sons who mocked the prophets forfeited the land.',
       sv.verse_id, ev.verse_id, 'extras', 62509
  FROM _session253_1esd1_lookup sv, _session253_1esd1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=1 AND sv.verse_number=28
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=1 AND ev.verse_number=51
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-1-temple-burned-sabbaths-fulfilled',
       E'The house burnt, the captivity to Babylon, till the land enjoyed her sabbaths',
       E'The end comes as the prophets warned: *As for the house of Yahuah (God), they burnt it, and brake down the walls of Jerusalem, and set fire upon her towers:* (1 Esdras 1:55), the people carried to Babylon *to fulfil the word of Yahuah (God) spoken by the mouth of Jeremy:* (1 Esdras 1:57), *Until the land had enjoyed her sabbaths, the whole time of her desolation shall she rest, until the full term of seventy years.* (1 Esdras 1:58). The Chronicler ends his book on the same word — *To fulfil the word of Yahuah (LORD) by the mouth of Jeremiah, until the land had enjoyed her sabbaths: for as long as she lay desolate she kept sabbath, to fulfil threescore and ten years.* (2 Chronicles 36:21) — and that word is Jeremiah''s own seventy years, *And this whole land shall be a desolation, and an astonishment; and these nations shall serve the king of Babylon seventy years.* (Jeremiah 25:11). And the reckoning reaches back to the Torah''s covenant warning, *Then shall the land enjoy her sabbaths, as long as it lieth desolate, and ye be in your enemies'' land; even then shall the land rest, and enjoy her sabbaths.* (Leviticus 26:34). The land keeps the rest the people would not — Torah stands, even in exile.',
       sv.verse_id, ev.verse_id, 'extras', 62512
  FROM _session253_1esd1_lookup sv, _session253_1esd1_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=1 AND sv.verse_number=55
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=1 AND ev.verse_number=58
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-esdras-1-josiahs-passover
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Chronicles 35:1 — *Moreover Josiah kept a passover unto Yahuah (LORD) in Jerusalem: and they killed the passover on the fourteenth day of the first month.* The Chronicler''s verse is the very source 1 Esdras 1:1 retells, fourteenth-day and all.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd1_lookup sv, _session253_1esd1_lookup tv
 WHERE t.slug='1-esdras-1-josiahs-passover'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=35 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kings 23:21 — *And the king commanded all the people, saying, Keep the passover unto Yahuah Elohaychem (the LORD your God), as it is written in the book of this covenant.* Kings shows the royal command that 1 Esdras 1:1 carries out, keeping the feast as the covenant was written.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd1_lookup sv, _session253_1esd1_lookup tv
 WHERE t.slug='1-esdras-1-josiahs-passover'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=23 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 12:6 — *And ye shall keep it up until the fourteenth day of the same month: and the whole assembly of the congregation of Yashar''el (Israel) shall kill it in the evening.* The Torah ordinance fixes the fourteenth day that Josiah keeps in 1 Esdras 1:1.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd1_lookup sv, _session253_1esd1_lookup tv
 WHERE t.slug='1-esdras-1-josiahs-passover'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=1 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Chronicles 35:2 — *And he set the priests in their charges, and encouraged them to the service of the house of Yahuah (LORD),* The priests set in their courses in 1 Esdras 1:2 is the Chronicler''s same ordering of the temple service.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd1_lookup sv, _session253_1esd1_lookup tv
 WHERE t.slug='1-esdras-1-josiahs-passover'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=1 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=35 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-1-ark-and-courses
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Chronicles 35:3 — *And said unto the Levites that taught all Yashar''el (Israel), which were holy unto Yahuah (LORD), Put the holy ark in the house which Solomon the son of David king of Yashar''el (Israel) did build; it shall not be a burden upon your shoulders: serve now Yahuah Elohaychem (the LORD your God), and his people Yashar''el (Israel),* The Chronicler''s charge to house the ark is the very speech 1 Esdras 1:3 retells.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd1_lookup sv, _session253_1esd1_lookup tv
 WHERE t.slug='1-esdras-1-ark-and-courses'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=1 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=35 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Chronicles 35:6 — *So kill the passover, and sanctify yourselves, and prepare your brethren, that they may do according to the word of Yahuah (LORD) by the hand of Moses.* The command kept by Moses'' word in 1 Esdras 1:6 is the Chronicler''s own grounding of the feast in Torah.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd1_lookup sv, _session253_1esd1_lookup tv
 WHERE t.slug='1-esdras-1-ark-and-courses'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=35 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 12:24 — *And ye shall observe this thing for an ordinance to thee and to thy sons for ever.* The Passover that 1 Esdras 1:6 keeps by the commandment given to Moses is the everlasting ordinance Exodus fixed for the generations.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd1_lookup sv, _session253_1esd1_lookup tv
 WHERE t.slug='1-esdras-1-ark-and-courses'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=1 AND sv.verse_number=6
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-1-no-such-passover
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Chronicles 35:17 — *And the children of Yashar''el (Israel) that were present kept the passover at that time, and the feast of unleavened bread seven days.* The seven-day keeping in 1 Esdras 1:19 is the Chronicler''s same record of Israel present at the feast.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd1_lookup sv, _session253_1esd1_lookup tv
 WHERE t.slug='1-esdras-1-no-such-passover'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=1 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=35 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Chronicles 35:18 — *And there was no passover like to that kept in Yashar''el (Israel) from the days of Samuel the prophet; neither did all the kings of Yashar''el (Israel) keep such a passover as Josiah kept, and the priests, and the Levites, and all Yahudah (Judah) and Yashar''el (Israel) that were present, and the inhabitants of Jerusalem.* The Samuel-measure of 1 Esdras 1:20 is the Chronicler''s own superlative for Josiah''s feast.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd1_lookup sv, _session253_1esd1_lookup tv
 WHERE t.slug='1-esdras-1-no-such-passover'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=1 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=35 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Exodus 12:15 — *Seven days shall ye eat unleavened bread; even the first day ye shall put away leaven out of your houses: for whosoever eateth leavened bread from the first day until the seventh day, that soul shall be cut off from Yashar''el (Israel).* The seven days of sweet bread in 1 Esdras 1:19 keep the Torah''s own count for the feast of unleavened bread.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd1_lookup sv, _session253_1esd1_lookup tv
 WHERE t.slug='1-esdras-1-no-such-passover'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=1 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-1-josiah-megiddo-and-fall
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Chronicles 35:22 — *Nevertheless Josiah would not turn his face from him, but disguised himself, that he might fight with him, and hearkened not unto the words of Necho from the mouth of Elohim (God), and came to fight in the valley of Megiddo.* The Chronicler''s Megiddo verse is the very fall 1 Esdras 1:28 records, Josiah deaf to the word.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd1_lookup sv, _session253_1esd1_lookup tv
 WHERE t.slug='1-esdras-1-josiah-megiddo-and-fall'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=1 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=35 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Kings 23:29 — *In his days Pharaoh-nechoh king of Egypt went up against the king of Assyria to the river Euphrates: and king Josiah went against him; and he slew him at Megiddo, when he had seen him.* Kings names the same Megiddo where Josiah is struck down in 1 Esdras 1:28-29.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd1_lookup sv, _session253_1esd1_lookup tv
 WHERE t.slug='1-esdras-1-josiah-megiddo-and-fall'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=1 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=23 AND tv.verse_number=29
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Chronicles 36:16 — *But they mocked the messengers of Elohim (God), and despised his words, and misused his prophets, until the wrath of Yahuah (LORD) arose against his people, till there was no remedy.* The prophets made a sport of in 1 Esdras 1:51 is the Chronicler''s same mocking that brought the wrath without remedy.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd1_lookup sv, _session253_1esd1_lookup tv
 WHERE t.slug='1-esdras-1-josiah-megiddo-and-fall'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=1 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=36 AND tv.verse_number=16
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Chronicles 36:15 — *And Yahuah Elohim (the LORD God) of their fathers sent to them by his messengers, rising up betimes, and sending; because he had compassion on his people, and on his dwelling place:* The messenger sent to call them back in 1 Esdras 1:50 is the Chronicler''s same compassion warning before the end.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd1_lookup sv, _session253_1esd1_lookup tv
 WHERE t.slug='1-esdras-1-josiah-megiddo-and-fall'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=1 AND sv.verse_number=50
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=36 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-1-temple-burned-sabbaths-fulfilled
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Chronicles 36:19 — *And they burnt the house of Elohim (God), and brake down the wall of Jerusalem, and burnt all the palaces thereof with fire, and destroyed all the goodly vessels thereof.* The burning of the house and breaking of the walls in 1 Esdras 1:55 is the Chronicler''s same record of Jerusalem''s fall.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd1_lookup sv, _session253_1esd1_lookup tv
 WHERE t.slug='1-esdras-1-temple-burned-sabbaths-fulfilled'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=1 AND sv.verse_number=55
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=36 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'2 Chronicles 36:21 — *To fulfil the word of Yahuah (LORD) by the mouth of Jeremiah, until the land had enjoyed her sabbaths: for as long as she lay desolate she kept sabbath, to fulfil threescore and ten years.* The sabbaths and seventy years of 1 Esdras 1:58 are the Chronicler''s same close, the land resting by Jeremiah''s word.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd1_lookup sv, _session253_1esd1_lookup tv
 WHERE t.slug='1-esdras-1-temple-burned-sabbaths-fulfilled'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=1 AND sv.verse_number=58
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=36 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Jeremiah 25:11 — *And this whole land shall be a desolation, and an astonishment; and these nations shall serve the king of Babylon seventy years.* Jeremiah''s seventy-year word is the very prophecy 1 Esdras 1:57 says the captivity fulfilled.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd1_lookup sv, _session253_1esd1_lookup tv
 WHERE t.slug='1-esdras-1-temple-burned-sabbaths-fulfilled'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=1 AND sv.verse_number=57
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=25 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Leviticus 26:34 — *Then shall the land enjoy her sabbaths, as long as it lieth desolate, and ye be in your enemies'' land; even then shall the land rest, and enjoy her sabbaths.* The land enjoying her sabbaths in 1 Esdras 1:58 reaches back to the Torah''s covenant warning that the desolate land would keep the rest the people withheld.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd1_lookup sv, _session253_1esd1_lookup tv
 WHERE t.slug='1-esdras-1-temple-burned-sabbaths-fulfilled'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=1 AND sv.verse_number=58
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=26 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

