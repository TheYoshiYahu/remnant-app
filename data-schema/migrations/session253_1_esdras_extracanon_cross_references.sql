-- =====================================================================
-- Session 253 — 1 Esdras FULL-LIBRARY cross-references
-- =====================================================================
-- Per-chapter-range full-library minions (Tanakh + extra-canonical + NT woven
-- per passage). Edition-aware schema; Come-and-See; sacred names restored;
-- son-of-man -> Son of Adam (kaph preserved). Idempotent: ON CONFLICT DO NOTHING.
-- Apply:  python3 api/apply_migration.py ../data-schema/migrations/session253_1_esdras_extracanon_cross_references.sql
-- =====================================================================

\echo 'session253 — 1 Esdras cross-references starting...'
BEGIN;

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

-- ----- fragment: minion_1esdras_02.sql (session253 1-esdras 2) -----
-- Source anchor: apocrypha/1-esdras ch2. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1esd2 (view _session253_1esd2_lookup). Sort band base 62525, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1esd2_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-esdras-2-cyrus-decree
  ('apocrypha', '1-esdras', 2, 1, 'canon', 'ezra', 1, 1, 'free', E'Ezra 1:1 — *Now in the first year of Cyrus king of Persia, that the word of Yahuah (LORD) by the mouth of Jeremiah might be fulfilled, Yahuah (LORD) stirred up the spirit of Cyrus king of Persia, that he made a proclamation throughout all his kingdom, and put it also in writing, saying,* The Ezra original from which 1 Esdras 2:1 is drawn, naming the same first year, the same word by Jeremiah, the same stirred spirit.'),
  ('apocrypha', '1-esdras', 2, 4, 'canon', 'ezra', 1, 2, 'free', E'Ezra 1:2 — *Thus saith Cyrus king of Persia, Yahuah Elohim (The LORD God) of heaven hath given me all the kingdoms of the earth; and he hath charged me to build him an house at Jerusalem, which is in Yahudah (Judah).* Cyrus''s own decree to build the house at Jerusalem, the charge 1 Esdras 2:4 puts in the king''s mouth.'),
  ('apocrypha', '1-esdras', 2, 5, 'canon', 'ezra', 1, 3, 'free', E'Ezra 1:3 — *Who is there among you of all his people? his Elohim (God) be with him, and let him go up to Jerusalem, which is in Yahudah (Judah), and build the house of Yahuah Elohim (the LORD God) of Yashar''el (Israel), (he is the Elohim (God),) which is in Jerusalem.* The summons to go up and build, matching 1 Esdras 2:5 phrase for phrase down to Elohim being with him.'),
  -- thread: 1-esdras-2-cyrus-shepherd-anointed
  ('apocrypha', '1-esdras', 2, 3, 'canon', 'isaiah', 44, 28, 'free', E'Isaiah 44:28 — *That saith of Cyrus, He is my shepherd, and shall perform all my pleasure: even saying to Jerusalem, Thou shalt be built; and to the temple, Thy foundation shall be laid.* Isaiah names Cyrus and his commission to rebuild Jerusalem and the temple, the very thing the king proclaims in 1 Esdras 2:3-4.'),
  ('apocrypha', '1-esdras', 2, 4, 'canon', 'isaiah', 45, 1, 'free', E'Isaiah 45:1 — *Thus saith Yahuah (LORD) to his anointed, to Cyrus, whose right hand I have holden, to subdue nations before him; and I will loose the loins of kings, to open before him the two leaved gates; and the gates shall not be shut;* Yahuah calls Cyrus His anointed and holds his right hand, the unseen hand commissioning the builder of 1 Esdras 2:4.'),
  ('apocrypha', '1-esdras', 2, 4, 'canon', 'isaiah', 45, 13, 'free', E'Isaiah 45:13 — *I have raised him up in righteousness, and I will direct all his ways: he shall build my city, and he shall let go my captives, not for price nor reward, saith Yahuah Tseva''ot (LORD of hosts).* Yahuah raises Cyrus to build His city and free the captives without price, the freed exiles and rebuilt house of 1 Esdras 2:4.'),
  -- thread: 1-esdras-2-seventy-years
  ('apocrypha', '1-esdras', 2, 1, 'canon', 'jeremiah', 29, 10, 'free', E'Jeremiah 29:10 — *For thus saith Yahuah (LORD), That after seventy years be accomplished at Babylon I will visit you, and perform my good word toward you, in causing you to return to this place.* The seventy-year word by Jeremy that 1 Esdras 2:1 says is now being accomplished in the first year of Cyrus.'),
  ('apocrypha', '1-esdras', 2, 1, 'canon', 'jeremiah', 29, 14, 'free', E'Jeremiah 29:14 — *And I will be found of you, saith Yahuah (LORD): and I will turn away your captivity, and I will gather you from all the nations, and from all the places whither I have driven you, saith Yahuah (LORD); and I will bring you again into the place whence I caused you to be carried away captive.* The same prophetic word promises the full regathering, of which the Cyrus return in 1 Esdras 2:1 is the firstfruits.'),
  -- thread: 1-esdras-2-holy-vessels
  ('apocrypha', '1-esdras', 2, 10, 'canon', 'ezra', 1, 7, 'free', E'Ezra 1:7 — *Also Cyrus the king brought forth the vessels of the house of Yahuah (LORD), which Nebuchadnezzar had brought forth out of Jerusalem, and had put them in the house of his gods;* The same bringing-forth of the holy vessels Nebuchadnezzar had set among idols, matching 1 Esdras 2:10.'),
  ('apocrypha', '1-esdras', 2, 15, 'canon', 'ezra', 1, 11, 'free', E'Ezra 1:11 — *All the vessels of gold and of silver were five thousand and four hundred. All these did Sheshbazzar bring up with them of the captivity that were brought up from Babylon unto Jerusalem.* Sheshbazzar (Sanabassar) bringing the vessels with the captives from Babylon to Jerusalem, the return of 1 Esdras 2:15.'),
  -- thread: 1-esdras-2-adversaries-letter
  ('apocrypha', '1-esdras', 2, 16, 'canon', 'ezra', 4, 7, 'free', E'Ezra 4:7 — *And in the days of Artaxerxes wrote Bishlam, Mithredath, Tabeel, and the rest of their companions, unto Artaxerxes king of Persia; and the writing of the letter was written in the Syrian tongue, and interpreted in the Syrian tongue.* The same letter under Artaxerxes by Mithredath and Tabeel and their companions that 1 Esdras 2:16 records against the builders.'),
  ('apocrypha', '1-esdras', 2, 18, 'canon', 'ezra', 4, 12, 'free', E'Ezra 4:12 — *Be it known unto the king, that the Yahudim (Jews) which came up from thee to us are come unto Jerusalem, building the rebellious and the bad city, and have set up the walls thereof, and joined the foundations.* The identical accusation that the returned Jews are rebuilding the rebellious city and its walls, as in 1 Esdras 2:18.'),
  ('apocrypha', '1-esdras', 2, 19, 'canon', 'ezra', 4, 13, 'free', E'Ezra 4:13 — *Be it known now unto the king, that, if this city be builded, and the walls set up again, then will they not pay toll, tribute, and custom, and so thou shalt endamage the revenue of the kings.* The same tribute-and-revenue scare 1 Esdras 2:19 uses to turn the king against the work.'),
  -- thread: 1-esdras-2-work-ceased
  ('apocrypha', '1-esdras', 2, 28, 'canon', 'ezra', 4, 21, 'free', E'Ezra 4:21 — *Give ye now commandment to cause these men to cease, and that this city be not builded, until another commandment shall be given from me.* The royal command to make the builders cease, the order 1 Esdras 2:28 records the king giving to hinder the work.'),
  ('apocrypha', '1-esdras', 2, 30, 'canon', 'ezra', 4, 23, 'free', E'Ezra 4:23 — *Now when the copy of king Artaxerxes'' letter was read before Rehum, and Shimshai the scribe, and their companions, they went up in haste to Jerusalem unto the Yahudim (Jews), and made them to cease by force and power.* The haste to Jerusalem to force the builders to stop, the same scene 1 Esdras 2:30 describes with horsemen and a multitude.'),
  ('apocrypha', '1-esdras', 2, 30, 'canon', 'ezra', 4, 24, 'free', E'Ezra 4:24 — *Then ceased the work of the house of Elohim (God) which is at Jerusalem. So it ceased unto the second year of the reign of Darius king of Persia.* The work ceasing until the second year of Darius, the exact endpoint 1 Esdras 2:30 names.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1esd2_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1esd2_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-2-cyrus-decree',
       E'Cyrus proclaims the house of Yahuah rebuilt',
       E'1 Esdras opens the return with the Persian decree: *In the first year of Cyrus king of the Persians, that the word of Yahuah (God) might be accomplished, that he had promised by the mouth of Jeremy; Yahuah (God) raised up the spirit of Cyrus the king of the Persians, and he made proclamation through all his kingdom, and also by writing* (1 Esdras 2:1-2). This is Ezra''s own account retold word for word: *Now in the first year of Cyrus king of Persia, that the word of Yahuah (LORD) by the mouth of Jeremiah might be fulfilled, Yahuah (LORD) stirred up the spirit of Cyrus king of Persia, that he made a proclamation throughout all his kingdom, and put it also in writing, saying,* (Ezra 1:1). The charge Cyrus speaks — *And commanded me to build him an house at Jerusalem in Jewry* (1 Esdras 2:4) — answers exactly to *Thus saith Cyrus king of Persia... he hath charged me to build him an house at Jerusalem, which is in Yahudah (Judah)* (Ezra 2:2). It ain''t new: the same hand that moved the heart of a pagan king to restore His house is the witness of both books.',
       sv.verse_id, ev.verse_id, 'extras', 62525
  FROM _session253_1esd2_lookup sv, _session253_1esd2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=2 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-2-cyrus-shepherd-anointed',
       E'Cyrus my shepherd, my anointed',
       E'Behind the decree of 1 Esdras 2 stands a prophecy that named Cyrus by name a hundred and fifty years before he was born: *Saying, Thus says Cyrus king of the Persians; Yahuah (God) of Yashar''el (Israel), the most high Yahuah (God), has made me king of the whole world, And commanded me to build him an house at Jerusalem in Jewry* (1 Esdras 2:3-4). Isaiah had already spoken Yahuah''s word over this very king: *That saith of Cyrus, He is my shepherd, and shall perform all my pleasure: even saying to Jerusalem, Thou shalt be built; and to the temple, Thy foundation shall be laid* (Isaiah 44:28). And He calls the Persian His messiah-figure — *Thus saith Yahuah (LORD) to his anointed, to Cyrus, whose right hand I have holden, to subdue nations before him* (Isaiah 45:1) — and declares the purpose: *I have raised him up in righteousness... he shall build my city, and he shall let go my captives, not for price nor reward* (Isaiah 45:13). The decree of 1 Esdras 2 is the day that word came to pass.',
       sv.verse_id, ev.verse_id, 'extras', 62528
  FROM _session253_1esd2_lookup sv, _session253_1esd2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=2 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-2-seventy-years',
       E'The word by Jeremy — after seventy years',
       E'1 Esdras grounds the whole return on a prophet''s word: *In the first year of Cyrus king of the Persians, that the word of Yahuah (God) might be accomplished, that he had promised by the mouth of Jeremy* (1 Esdras 2:1). That promised word is the seventy-year decree: *For thus saith Yahuah (LORD), That after seventy years be accomplished at Babylon I will visit you, and perform my good word toward you, in causing you to return to this place* (Jeremiah 29:10). The gathering Yahuah swore went further than the city — *And I will be found of you, saith Yahuah (LORD): and I will turn away your captivity, and I will gather you from all the nations, and from all the places whither I have driven you... and I will bring you again into the place whence I caused you to be carried away captive* (Jeremiah 29:14). Cyrus''s decree in 1 Esdras 2 is the opening of that ingathering, the down-payment on the regathering of the houses Yahuah will never finally cast away.',
       sv.verse_id, ev.verse_id, 'extras', 62531
  FROM _session253_1esd2_lookup sv, _session253_1esd2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=2 AND ev.verse_number=1
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-2-holy-vessels',
       E'The holy vessels carried back from Babylon',
       E'1 Esdras records the restoring of the plundered temple gold: *King Cyrus also brought forth the holy vessels, which Nabuchodonosor had carried away from Jerusalem, and had set up in his temple of idols* (1 Esdras 2:10), and they were *brought back by Sanabassar, together with them of the captivity, from Babylon to Jerusalem* (1 Esdras 2:15). Ezra tells the same restoration: *Also Cyrus the king brought forth the vessels of the house of Yahuah (LORD), which Nebuchadnezzar had brought forth out of Jerusalem, and had put them in the house of his gods;* (Ezra 1:7), and *All the vessels of gold and of silver were five thousand and four hundred. All these did Sheshbazzar bring up with them of the captivity that were brought up from Babylon unto Jerusalem* (Ezra 1:11). The holy things Babylon set among its idols do not stay in exile; Yahuah brings every sanctified vessel home — the pledge that what is His is never finally lost to Babylon.',
       sv.verse_id, ev.verse_id, 'extras', 62534
  FROM _session253_1esd2_lookup sv, _session253_1esd2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=2 AND ev.verse_number=15
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-2-adversaries-letter',
       E'The adversaries write to stop the work',
       E'The work begun under Cyrus is opposed under a later king: *But in the time of Artexerxes king of the Persians Belemus, and Mithridates, and Tabellius, and Rathumus... wrote to him against them that dwelt in Judea and Jerusalem* (1 Esdras 2:16), charging that *the Yahudim (Jews) that are up from you to us, being come into Jerusalem, that rebellious and wicked city, do build the marketplaces, and repair the walls of it and do lay the foundation of the temple* (1 Esdras 2:18). Ezra preserves this very letter: *And in the days of Artaxerxes wrote Bishlam, Mithredath, Tabeel, and the rest of their companions, unto Artaxerxes king of Persia* (Ezra 4:7), with the same accusation — *that the Yahudim (Jews) which came up from thee to us are come unto Jerusalem, building the rebellious and the bad city, and have set up the walls thereof, and joined the foundations* (Ezra 4:12). The slander that the city will *refuse to give tribute, but also rebel against kings* (1 Esdras 2:19) is Ezra''s *then will they not pay toll, tribute, and custom... so thou shalt endamage the revenue of the kings* (Ezra 4:13). The kingdom-of-man system always moves to halt the building of Yahuah''s house.',
       sv.verse_id, ev.verse_id, 'extras', 62537
  FROM _session253_1esd2_lookup sv, _session253_1esd2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=16
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=2 AND ev.verse_number=19
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-2-work-ceased',
       E'The king commands, and the building ceases',
       E'Artaxerxes answers the slander and the work stops: *Now therefore I have commanded to hinder those men from building the city, and heed to be taken that there be no more done in it* (1 Esdras 2:28), and so *Rathumus, and Semellius the scribe, and the rest... removing in haste toward Jerusalem with a troop of horsemen and a multitude of people in battle array, began to hinder the builders; and the building of the temple in Jerusalem ceased until the second year of the reign of Darius king of the Persians* (1 Esdras 2:30). Ezra''s account is identical: *Give ye now commandment to cause these men to cease, and that this city be not builded, until another commandment shall be given from me* (Ezra 4:21), and then *they went up in haste to Jerusalem unto the Yahudim (Jews), and made them to cease by force and power* (Ezra 4:23), so that *Then ceased the work of the house of Elohim (God) which is at Jerusalem. So it ceased unto the second year of the reign of Darius king of Persia* (Ezra 4:24). Man''s decree can halt the house for a season; it cannot annul the word Yahuah promised by the mouth of Jeremy.',
       sv.verse_id, ev.verse_id, 'extras', 62540
  FROM _session253_1esd2_lookup sv, _session253_1esd2_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=28
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=2 AND ev.verse_number=30
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-esdras-2-cyrus-decree
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 1:1 — *Now in the first year of Cyrus king of Persia, that the word of Yahuah (LORD) by the mouth of Jeremiah might be fulfilled, Yahuah (LORD) stirred up the spirit of Cyrus king of Persia, that he made a proclamation throughout all his kingdom, and put it also in writing, saying,* The Ezra original from which 1 Esdras 2:1 is drawn, naming the same first year, the same word by Jeremiah, the same stirred spirit.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd2_lookup sv, _session253_1esd2_lookup tv
 WHERE t.slug='1-esdras-2-cyrus-decree'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 1:2 — *Thus saith Cyrus king of Persia, Yahuah Elohim (The LORD God) of heaven hath given me all the kingdoms of the earth; and he hath charged me to build him an house at Jerusalem, which is in Yahudah (Judah).* Cyrus''s own decree to build the house at Jerusalem, the charge 1 Esdras 2:4 puts in the king''s mouth.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd2_lookup sv, _session253_1esd2_lookup tv
 WHERE t.slug='1-esdras-2-cyrus-decree'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezra 1:3 — *Who is there among you of all his people? his Elohim (God) be with him, and let him go up to Jerusalem, which is in Yahudah (Judah), and build the house of Yahuah Elohim (the LORD God) of Yashar''el (Israel), (he is the Elohim (God),) which is in Jerusalem.* The summons to go up and build, matching 1 Esdras 2:5 phrase for phrase down to Elohim being with him.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd2_lookup sv, _session253_1esd2_lookup tv
 WHERE t.slug='1-esdras-2-cyrus-decree'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=1 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-2-cyrus-shepherd-anointed
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Isaiah 44:28 — *That saith of Cyrus, He is my shepherd, and shall perform all my pleasure: even saying to Jerusalem, Thou shalt be built; and to the temple, Thy foundation shall be laid.* Isaiah names Cyrus and his commission to rebuild Jerusalem and the temple, the very thing the king proclaims in 1 Esdras 2:3-4.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd2_lookup sv, _session253_1esd2_lookup tv
 WHERE t.slug='1-esdras-2-cyrus-shepherd-anointed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 45:1 — *Thus saith Yahuah (LORD) to his anointed, to Cyrus, whose right hand I have holden, to subdue nations before him; and I will loose the loins of kings, to open before him the two leaved gates; and the gates shall not be shut;* Yahuah calls Cyrus His anointed and holds his right hand, the unseen hand commissioning the builder of 1 Esdras 2:4.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd2_lookup sv, _session253_1esd2_lookup tv
 WHERE t.slug='1-esdras-2-cyrus-shepherd-anointed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 45:13 — *I have raised him up in righteousness, and I will direct all his ways: he shall build my city, and he shall let go my captives, not for price nor reward, saith Yahuah Tseva''ot (LORD of hosts).* Yahuah raises Cyrus to build His city and free the captives without price, the freed exiles and rebuilt house of 1 Esdras 2:4.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd2_lookup sv, _session253_1esd2_lookup tv
 WHERE t.slug='1-esdras-2-cyrus-shepherd-anointed'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-2-seventy-years
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 29:10 — *For thus saith Yahuah (LORD), That after seventy years be accomplished at Babylon I will visit you, and perform my good word toward you, in causing you to return to this place.* The seventy-year word by Jeremy that 1 Esdras 2:1 says is now being accomplished in the first year of Cyrus.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd2_lookup sv, _session253_1esd2_lookup tv
 WHERE t.slug='1-esdras-2-seventy-years'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=29 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 29:14 — *And I will be found of you, saith Yahuah (LORD): and I will turn away your captivity, and I will gather you from all the nations, and from all the places whither I have driven you, saith Yahuah (LORD); and I will bring you again into the place whence I caused you to be carried away captive.* The same prophetic word promises the full regathering, of which the Cyrus return in 1 Esdras 2:1 is the firstfruits.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd2_lookup sv, _session253_1esd2_lookup tv
 WHERE t.slug='1-esdras-2-seventy-years'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=29 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-2-holy-vessels
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 1:7 — *Also Cyrus the king brought forth the vessels of the house of Yahuah (LORD), which Nebuchadnezzar had brought forth out of Jerusalem, and had put them in the house of his gods;* The same bringing-forth of the holy vessels Nebuchadnezzar had set among idols, matching 1 Esdras 2:10.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd2_lookup sv, _session253_1esd2_lookup tv
 WHERE t.slug='1-esdras-2-holy-vessels'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 1:11 — *All the vessels of gold and of silver were five thousand and four hundred. All these did Sheshbazzar bring up with them of the captivity that were brought up from Babylon unto Jerusalem.* Sheshbazzar (Sanabassar) bringing the vessels with the captives from Babylon to Jerusalem, the return of 1 Esdras 2:15.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd2_lookup sv, _session253_1esd2_lookup tv
 WHERE t.slug='1-esdras-2-holy-vessels'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-2-adversaries-letter
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 4:7 — *And in the days of Artaxerxes wrote Bishlam, Mithredath, Tabeel, and the rest of their companions, unto Artaxerxes king of Persia; and the writing of the letter was written in the Syrian tongue, and interpreted in the Syrian tongue.* The same letter under Artaxerxes by Mithredath and Tabeel and their companions that 1 Esdras 2:16 records against the builders.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd2_lookup sv, _session253_1esd2_lookup tv
 WHERE t.slug='1-esdras-2-adversaries-letter'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=16
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=4 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 4:12 — *Be it known unto the king, that the Yahudim (Jews) which came up from thee to us are come unto Jerusalem, building the rebellious and the bad city, and have set up the walls thereof, and joined the foundations.* The identical accusation that the returned Jews are rebuilding the rebellious city and its walls, as in 1 Esdras 2:18.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd2_lookup sv, _session253_1esd2_lookup tv
 WHERE t.slug='1-esdras-2-adversaries-letter'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=4 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezra 4:13 — *Be it known now unto the king, that, if this city be builded, and the walls set up again, then will they not pay toll, tribute, and custom, and so thou shalt endamage the revenue of the kings.* The same tribute-and-revenue scare 1 Esdras 2:19 uses to turn the king against the work.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd2_lookup sv, _session253_1esd2_lookup tv
 WHERE t.slug='1-esdras-2-adversaries-letter'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=4 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-2-work-ceased
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 4:21 — *Give ye now commandment to cause these men to cease, and that this city be not builded, until another commandment shall be given from me.* The royal command to make the builders cease, the order 1 Esdras 2:28 records the king giving to hinder the work.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd2_lookup sv, _session253_1esd2_lookup tv
 WHERE t.slug='1-esdras-2-work-ceased'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=4 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 4:23 — *Now when the copy of king Artaxerxes'' letter was read before Rehum, and Shimshai the scribe, and their companions, they went up in haste to Jerusalem unto the Yahudim (Jews), and made them to cease by force and power.* The haste to Jerusalem to force the builders to stop, the same scene 1 Esdras 2:30 describes with horsemen and a multitude.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd2_lookup sv, _session253_1esd2_lookup tv
 WHERE t.slug='1-esdras-2-work-ceased'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=4 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezra 4:24 — *Then ceased the work of the house of Elohim (God) which is at Jerusalem. So it ceased unto the second year of the reign of Darius king of Persia.* The work ceasing until the second year of Darius, the exact endpoint 1 Esdras 2:30 names.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd2_lookup sv, _session253_1esd2_lookup tv
 WHERE t.slug='1-esdras-2-work-ceased'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=2 AND sv.verse_number=30
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=4 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1esdras_03.sql (session253 1-esdras 3) -----
-- Source anchor: apocrypha/1-esdras ch3. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1esd3 (view _session253_1esd3_lookup). Sort band base 62550, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1esd3_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-esdras-3-wine-is-the-strongest
  ('apocrypha', '1-esdras', 3, 10, 'canon', 'proverbs', 20, 1, 'free', E'Proverbs 20:1 — *Wine is a mocker, strong drink is raging: and whosoever is deceived thereby is not wise.* Where the guardsman crowns wine the strongest in 1 Esdras 3:10, the proverb names it a mocker that proves a man unwise.'),
  ('apocrypha', '1-esdras', 3, 18, 'canon', 'isaiah', 28, 7, 'free', E'Isaiah 28:7 — *But they also have erred through wine, and through strong drink are out of the way; the priest and the prophet have erred through strong drink, they are swallowed up of wine, they are out of the way through strong drink; they err in vision, they stumble in judgment.* The guardsman''s boast that wine *causeth all men to err* (1 Esdras 3:18) is Isaiah''s indictment, where even priest and prophet are made to err.'),
  ('apocrypha', '1-esdras', 3, 18, 'canon', 'hosea', 4, 11, 'free', E'Hosea 4:11 — *Whoredom and wine and new wine take away the heart.* What the guardsman calls strength in 1 Esdras 3:18, Hosea calls a robbery of the very heart it overcomes.'),
  ('apocrypha', '1-esdras', 3, 22, 'canon', 'ephesians', 5, 18, 'free', E'Ephesians 5:18 — *And be not drunk with wine, wherein is excess; but be filled with the Spirit.* Against the wine that makes men forget their love and *draw out swords* (1 Esdras 3:22), Paul sets the Spirit as the true filling and strength.'),
  -- thread: 1-esdras-3-the-king-is-strongest
  ('apocrypha', '1-esdras', 3, 11, 'canon', 'proverbs', 21, 1, 'free', E'Proverbs 21:1 — *The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will.* The second guardsman''s verdict that *The king is strongest* (1 Esdras 3:11) meets the truth that the king''s own heart is turned by a higher Hand.'),
  ('apocrypha', '1-esdras', 3, 11, 'canon', 'ecclesiastes', 8, 4, 'free', E'Ecclesiastes 8:4 — *Where the word of a king is, there is power: and who may say unto him, What doest thou?* Qoheleth grants the guardsman his point — the king''s word is power — even as 1 Esdras 3:11 names the king strongest.'),
  ('apocrypha', '1-esdras', 3, 11, 'canon', 'daniel', 2, 21, 'free', E'Daniel 2:21 — *And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise, and knowledge to them that know understanding.* The king is strongest only as far as Elohim permits, for He removes and sets up kings — answering 1 Esdras 3:11.'),
  ('apocrypha', '1-esdras', 3, 11, 'canon', 'proverbs', 31, 5, 'free', E'Proverbs 31:5 — *Lest they drink, and forget the law, and pervert the judgment of any of the afflicted.* Even the strongest king stands under Torah, warned not to drink lest he forget the law — binding the king-thread back to the wine-thread of 1 Esdras 3:11.'),
  -- thread: 1-esdras-3-truth-bears-the-victory
  ('apocrypha', '1-esdras', 3, 15, 'canon', 'proverbs', 8, 15, 'free', E'Proverbs 8:15 — *By me kings reign, and princes decree justice.* As Darius takes the *royal seat of judgment* in 1 Esdras 3:15, it is Wisdom by whom kings reign and rightly judge.'),
  ('apocrypha', '1-esdras', 3, 12, 'canon', 'john', 18, 37, 'free', E'John 18:37 — *Pilate therefore said unto him, Art thou a king then? Yahusha (Jesus) answered, Thou sayest that I am a king. To this end was I born, and for this cause came I into the world, that I should bear witness unto the truth. Every one that is of the truth heareth my voice.* The guardsman''s claim that *Truth bears away the victory* (1 Esdras 3:12) is fulfilled in the King who is born to bear witness to the truth before an earthly judgment seat.'),
  ('apocrypha', '1-esdras', 3, 12, 'canon', 'john', 14, 6, 'free', E'John 14:6 — *Yahusha (Jesus) saith unto him, I am the way, the truth, and the life: no man cometh unto the Father, but by me.* The Truth that bears the victory in 1 Esdras 3:12 is named at last not as a maxim but as a Person.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1esd3_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1esd3_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-3-wine-is-the-strongest',
       E'Wine is the strongest — the first guardsman',
       E'The three young men of Darius''s guard stake their contest, and the first writes for wine: *The first wrote, Wine is the strongest.* (1 Esdras 3:10) He unfolds it — *O you men, how exceeding strong is wine! it causeth all men to err that drink it* (1 Esdras 3:18) — *And when they are in their cups, they forget their love both to friends and brothers, and a little after draw out swords* (1 Esdras 3:22). It ain''t new: the wise men of Yashar''el had already weighed the cup and found it a deceiver, not a ruler. *Wine is a mocker, strong drink is raging: and whosoever is deceived thereby is not wise* (Proverbs 20:1); *But they also have erred through wine, and through strong drink are out of the way; the priest and the prophet have erred through strong drink, they are swallowed up of wine, they are out of the way through strong drink; they err in vision, they stumble in judgment* (Isaiah 28:7); *Whoredom and wine and new wine take away the heart* (Hosea 4:11). What the guardsman praises as strength, the Scripture exposes as a thief of the heart — and the apostle answers it: *And be not drunk with wine, wherein is excess; but be filled with the Spirit* (Ephesians 5:18).',
       sv.verse_id, ev.verse_id, 'extras', 62550
  FROM _session253_1esd3_lookup sv, _session253_1esd3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=3 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=3 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-3-the-king-is-strongest',
       E'The king is strongest — and the King''s heart in Yahuah''s hand',
       E'The second guardsman writes for the throne: *The second wrote, The king is strongest.* (1 Esdras 3:11) The crown does seem the strongest thing on earth — *Where the word of a king is, there is power: and who may say unto him, What doest thou?* (Ecclesiastes 8:4). But the Tanakh sets a hand above the king''s hand: *The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will* (Proverbs 21:1); *By me kings reign, and princes decree justice* (Proverbs 8:15); *And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise, and knowledge to them that know understanding* (Daniel 2:21). And even a king is bound under Torah, not above it: *It is not for kings, O Lemuel, it is not for kings to drink wine; nor for princes strong drink: Lest they drink, and forget the law, and pervert the judgment of any of the afflicted* (Proverbs 31:4-5). The king is strong — but the King''s strength is loaned from a stronger Hand.',
       sv.verse_id, ev.verse_id, 'extras', 62553
  FROM _session253_1esd3_lookup sv, _session253_1esd3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=3 AND sv.verse_number=11
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=3 AND ev.verse_number=11
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-3-truth-bears-the-victory',
       E'But above all things, Truth bears away the victory',
       E'The third guardsman''s sentence reaches past wine and king alike: *The third wrote, Women are strongest: but above all things Truth bears away the victory.* (1 Esdras 3:12) The contest will be decided not in the king''s bedchamber but at his seat of judgment — *And sat him down in the royal seat of judgment; and the writings were read before them* (1 Esdras 3:15). It ain''t new: Wisdom, not might, seats and judges kings — *By me kings reign, and princes decree justice* (Proverbs 8:15). And the wager that Truth bears the final victory finds its fullness where the true King stands judged before an earthly throne and answers for the truth itself: *Pilate therefore said unto him, Art thou a king then? Yahusha (Jesus) answered, Thou sayest that I am a king. To this end was I born, and for this cause came I into the world, that I should bear witness unto the truth. Every one that is of the truth heareth my voice* (John 18:37); *Yahusha (Jesus) saith unto him, I am the way, the truth, and the life: no man cometh unto the Father, but by me* (John 14:6). The guardsman''s contest for the truth opens here; its victory is a Person.',
       sv.verse_id, ev.verse_id, 'extras', 62556
  FROM _session253_1esd3_lookup sv, _session253_1esd3_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=3 AND sv.verse_number=12
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=3 AND ev.verse_number=17
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-esdras-3-wine-is-the-strongest
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 20:1 — *Wine is a mocker, strong drink is raging: and whosoever is deceived thereby is not wise.* Where the guardsman crowns wine the strongest in 1 Esdras 3:10, the proverb names it a mocker that proves a man unwise.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd3_lookup sv, _session253_1esd3_lookup tv
 WHERE t.slug='1-esdras-3-wine-is-the-strongest'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=3 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=20 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 28:7 — *But they also have erred through wine, and through strong drink are out of the way; the priest and the prophet have erred through strong drink, they are swallowed up of wine, they are out of the way through strong drink; they err in vision, they stumble in judgment.* The guardsman''s boast that wine *causeth all men to err* (1 Esdras 3:18) is Isaiah''s indictment, where even priest and prophet are made to err.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd3_lookup sv, _session253_1esd3_lookup tv
 WHERE t.slug='1-esdras-3-wine-is-the-strongest'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=28 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Hosea 4:11 — *Whoredom and wine and new wine take away the heart.* What the guardsman calls strength in 1 Esdras 3:18, Hosea calls a robbery of the very heart it overcomes.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd3_lookup sv, _session253_1esd3_lookup tv
 WHERE t.slug='1-esdras-3-wine-is-the-strongest'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=3 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='hosea' AND tv.chapter_number=4 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Ephesians 5:18 — *And be not drunk with wine, wherein is excess; but be filled with the Spirit.* Against the wine that makes men forget their love and *draw out swords* (1 Esdras 3:22), Paul sets the Spirit as the true filling and strength.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd3_lookup sv, _session253_1esd3_lookup tv
 WHERE t.slug='1-esdras-3-wine-is-the-strongest'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=3 AND sv.verse_number=22
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-3-the-king-is-strongest
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 21:1 — *The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will.* The second guardsman''s verdict that *The king is strongest* (1 Esdras 3:11) meets the truth that the king''s own heart is turned by a higher Hand.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd3_lookup sv, _session253_1esd3_lookup tv
 WHERE t.slug='1-esdras-3-the-king-is-strongest'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ecclesiastes 8:4 — *Where the word of a king is, there is power: and who may say unto him, What doest thou?* Qoheleth grants the guardsman his point — the king''s word is power — even as 1 Esdras 3:11 names the king strongest.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd3_lookup sv, _session253_1esd3_lookup tv
 WHERE t.slug='1-esdras-3-the-king-is-strongest'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='ecclesiastes' AND tv.chapter_number=8 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 2:21 — *And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise, and knowledge to them that know understanding.* The king is strongest only as far as Elohim permits, for He removes and sets up kings — answering 1 Esdras 3:11.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd3_lookup sv, _session253_1esd3_lookup tv
 WHERE t.slug='1-esdras-3-the-king-is-strongest'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Proverbs 31:5 — *Lest they drink, and forget the law, and pervert the judgment of any of the afflicted.* Even the strongest king stands under Torah, warned not to drink lest he forget the law — binding the king-thread back to the wine-thread of 1 Esdras 3:11.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd3_lookup sv, _session253_1esd3_lookup tv
 WHERE t.slug='1-esdras-3-the-king-is-strongest'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=3 AND sv.verse_number=11
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=31 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-3-truth-bears-the-victory
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 8:15 — *By me kings reign, and princes decree justice.* As Darius takes the *royal seat of judgment* in 1 Esdras 3:15, it is Wisdom by whom kings reign and rightly judge.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd3_lookup sv, _session253_1esd3_lookup tv
 WHERE t.slug='1-esdras-3-truth-bears-the-victory'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=3 AND sv.verse_number=15
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=8 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 18:37 — *Pilate therefore said unto him, Art thou a king then? Yahusha (Jesus) answered, Thou sayest that I am a king. To this end was I born, and for this cause came I into the world, that I should bear witness unto the truth. Every one that is of the truth heareth my voice.* The guardsman''s claim that *Truth bears away the victory* (1 Esdras 3:12) is fulfilled in the King who is born to bear witness to the truth before an earthly judgment seat.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd3_lookup sv, _session253_1esd3_lookup tv
 WHERE t.slug='1-esdras-3-truth-bears-the-victory'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=18 AND tv.verse_number=37
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'John 14:6 — *Yahusha (Jesus) saith unto him, I am the way, the truth, and the life: no man cometh unto the Father, but by me.* The Truth that bears the victory in 1 Esdras 3:12 is named at last not as a maxim but as a Person.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd3_lookup sv, _session253_1esd3_lookup tv
 WHERE t.slug='1-esdras-3-truth-bears-the-victory'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=3 AND sv.verse_number=12
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1esdras_04.sql (session253 1-esdras 4) -----
-- Source anchor: apocrypha/1-esdras ch4. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1esd4 (view _session253_1esd4_lookup). Sort band base 62575, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1esd4_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-esdras-4-great-is-truth
  ('apocrypha', '1-esdras', 4, 38, 'canon', 'john', 14, 6, 'free', E'John 14:6 — *Yahusha (Jesus) saith unto him, I am the way, the truth, and the life: no man cometh unto the Father, but by me.* The Truth that lives and conquereth for evermore is not an abstraction but a Person, in whom 1 Esdras 4:38''s enduring Truth stands incarnate.'),
  ('apocrypha', '1-esdras', 4, 41, 'canon', 'john', 17, 17, 'free', E'John 17:17 — *Sanctify them through thy truth: thy word is truth.* The Truth the people exalt as mighty above all things in 1 Esdras 4:41 is identified by Yahusha as the very word of the Father.'),
  ('apocrypha', '1-esdras', 4, 38, 'canon', 'psalms', 117, 2, 'free', E'Psalm 117:2 — *For his merciful kindness is great toward us: and the truth of Yahuah (LORD) endureth for ever. Praise ye Yahuah (LORD).* What Zerubbabel declares of Truth that endureth and conquereth for evermore in 1 Esdras 4:38, the psalm already anchors in Yahuah whose truth endureth for ever.'),
  ('apocrypha', '1-esdras', 4, 40, 'canon', 'psalms', 119, 160, 'free', E'Psalm 119:160 — *Thy word is true from the beginning: and every one of thy righteous judgments endureth for ever.* Where 1 Esdras 4:40 names Truth the majesty of all ages with no unrighteousness in her judgment, the psalm ties that ageless, righteous-judging Truth to Yahuah''s word true from the beginning.'),
  -- thread: 1-esdras-4-blessed-elohim-of-truth
  ('apocrypha', '1-esdras', 4, 40, 'canon', 'psalms', 100, 5, 'free', E'Psalm 100:5 — *For Yahuah (LORD) is good; his mercy is everlasting; and his truth endureth to all generations.* The Elohim of truth blessed in 1 Esdras 4:40 is the LORD whose truth endureth to all generations, the majesty of all ages.'),
  ('apocrypha', '1-esdras', 4, 39, 'canon', 'john', 17, 17, 'free', E'John 17:17 — *Sanctify them through thy truth: thy word is truth.* The Truth with whom is no accepting of persons in 1 Esdras 4:39 is the Father''s own word, by which his people are set apart.'),
  ('apocrypha', '1-esdras', 4, 40, 'canon', 'psalms', 119, 160, 'free', E'Psalm 119:160 — *Thy word is true from the beginning: and every one of thy righteous judgments endureth for ever.* The righteous, unfailing judgment of Truth in 1 Esdras 4:40 is the very character of Yahuah''s word, true from the beginning and enduring for ever.'),
  -- thread: 1-esdras-4-king-heart-in-the-hand
  ('apocrypha', '1-esdras', 4, 3, 'canon', 'proverbs', 21, 1, 'free', E'Proverbs 21:1 — *The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will.* The king of 1 Esdras 4:3, lord of all and obeyed in everything, is himself only a river Yahuah turns where he wills.'),
  ('apocrypha', '1-esdras', 4, 8, 'canon', 'daniel', 2, 21, 'free', E'Daniel 2:21 — *And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise, and knowledge to them that know understanding.* The king who commands to build or make desolate in 1 Esdras 4:8 is removed and set up by Yahuah, who alone gives the wisdom Zerubbabel is about to display.'),
  -- thread: 1-esdras-4-leaves-father-cleaves-wife
  ('apocrypha', '1-esdras', 4, 20, 'canon', 'genesis', 2, 24, 'free', E'Genesis 2:24 — *Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh.* The leaving-and-cleaving the guardsman cites in 1 Esdras 4:20 is the Eden ordinance, the man cleaving to his wife as one flesh.'),
  ('apocrypha', '1-esdras', 4, 20, 'canon', 'matthew', 19, 5, 'free', E'Matthew 19:5 — *And said, For this cause shall a man leave father and mother, and shall cleave to his wife: and they twain shall be one flesh?* Yahusha quotes the same leaving-and-cleaving that 1 Esdras 4:20 observes, sealing it as the joining no man may sunder.'),
  ('apocrypha', '1-esdras', 4, 25, 'canon', 'ephesians', 5, 31, 'free', E'Ephesians 5:31 — *For this cause shall a man leave his father and mother, and shall be joined unto his wife, and they two shall be one flesh.* The love of wife above father and mother in 1 Esdras 4:25 is read by Paul as the great mystery of the one flesh, figuring Messiah and his bride.'),
  -- thread: 1-esdras-4-rebuild-jerusalem-vessels
  ('apocrypha', '1-esdras', 4, 44, 'canon', 'ezra', 1, 7, 'free', E'Ezra 1:7 — *Also Cyrus the king brought forth the vessels of the house of Yahuah (LORD), which Nebuchadnezzar had brought forth out of Jerusalem, and had put them in the house of his gods.* The vessels Cyrus set apart that Zerubbabel asks returned in 1 Esdras 4:44 are the same Ezra records Cyrus bringing forth for the captivity.'),
  ('apocrypha', '1-esdras', 4, 57, 'canon', 'ezra', 1, 11, 'free', E'Ezra 1:11 — *All the vessels of gold and of silver were five thousand and four hundred. All these did Sheshbazzar bring up with them of the captivity that were brought up from Babylon unto Jerusalem.* The sending away of all the Babylon vessels in 1 Esdras 4:57 is tallied in Ezra as the gold and silver carried up to Jerusalem.'),
  ('apocrypha', '1-esdras', 4, 43, 'canon', 'isaiah', 44, 28, 'free', E'Isaiah 44:28 — *That saith of Cyrus, He is my shepherd, and shall perform all my pleasure: even saying to Jerusalem, Thou shalt be built; and to the temple, Thy foundation shall be laid.* The vow to build Jerusalem that Zerubbabel invokes in 1 Esdras 4:43 was decreed by Yahuah, who named Cyrus his shepherd to rebuild the city.'),
  ('apocrypha', '1-esdras', 4, 45, 'canon', 'isaiah', 45, 13, 'free', E'Isaiah 45:13 — *I have raised him up in righteousness, and I will direct all his ways: he shall build my city, and he shall let go my captives, not for price nor reward, saith Yahuah Tseva''ot (LORD of hosts).* The rebuilding of the temple Zerubbabel requires in 1 Esdras 4:45 fulfills Yahuah''s word that his raised-up king would build the city and free the captives, not for price nor reward.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1esd4_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1esd4_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-4-great-is-truth',
       E'Great is the Truth, and stronger than all things',
       E'Zerubbabel, the third of the king''s guard, sets Truth above wine, the king, and women: *As for the truth, it endureth, and is always strong; it lives and conquereth for evermore* (1 Esdras 4:38), and *she is the strength, kingdom, power, and majesty, of all ages. Blessed be Yahuah (God) of truth* (1 Esdras 4:40), so that all the people shout *Great is Truth, and mighty above all things* (1 Esdras 4:41). It ain''t new: this is the LORD himself made flesh, *Yahusha (Jesus) saith unto him, I am the way, the truth, and the life: no man cometh unto the Father, but by me* (John 14:6); and the truth that conquers is his word, *Sanctify them through thy truth: thy word is truth* (John 17:17). What Zerubbabel saw endure for ever the psalmist had already sung, *For his merciful kindness is great toward us: and the truth of Yahuah (LORD) endureth for ever. Praise ye Yahuah (LORD)* (Psalm 117:2).',
       sv.verse_id, ev.verse_id, 'extras', 62575
  FROM _session253_1esd4_lookup sv, _session253_1esd4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=38
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=4 AND ev.verse_number=41
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-4-blessed-elohim-of-truth',
       E'Blessed be the Elohim of truth',
       E'Zerubbabel''s oration closes in worship: *Neither in her judgment is any unrighteousness; and she is the strength, kingdom, power, and majesty, of all ages. Blessed be Yahuah (God) of truth* (1 Esdras 4:40). The God of truth whose mercy endures is the same the psalmist praises, *For Yahuah (LORD) is good; his mercy is everlasting; and his truth endureth to all generations* (Psalm 100:5); and his word stands true from first to last, *Thy word is true from the beginning: and every one of thy righteous judgments endureth for ever* (Psalm 119:160). It ain''t new: the covenant God of truth Zerubbabel blesses is the One whose word is truth (John 17:17).',
       sv.verse_id, ev.verse_id, 'extras', 62578
  FROM _session253_1esd4_lookup sv, _session253_1esd4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=39
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=4 AND ev.verse_number=40
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-4-king-heart-in-the-hand',
       E'The king is mighty, yet his heart is in Yahuah''s hand',
       E'The second guardsman exalts the king: *But yet the king is more mighty: for he is lord of all these things, and has dominion over them; and whatsoever he commands them they do* (1 Esdras 4:3), and *if he command to build, they build... if he command to plant, they plant* (1 Esdras 4:8-9). Yet Zerubbabel will overturn this, for above every king stands Truth — and Scripture sets that king himself under Yahuah''s hand, *The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will* (Proverbs 21:1). It is Yahuah who *changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise* (Daniel 2:21) — the very wisdom by which the next speaker prevails.',
       sv.verse_id, ev.verse_id, 'extras', 62581
  FROM _session253_1esd4_lookup sv, _session253_1esd4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=4 AND ev.verse_number=12
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-4-leaves-father-cleaves-wife',
       E'A man leaveth his father and cleaveth to his wife',
       E'Pleading the strength of women, the third speaker says, *A man leaveth his own father that brought him up, and his own country, and cleaveth to his wife* (1 Esdras 4:20), and *Wherefore a man loves his wife better than father or mother* (1 Esdras 4:25). It ain''t new: this is the creation ordinance, *Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh* (Genesis 2:24), which Yahusha takes up as the unbreakable joining, *And said, For this cause shall a man leave father and mother, and shall cleave to his wife: and they twain shall be one flesh?* (Matthew 19:5). Paul reads the one flesh as the mystery of Messiah and the assembly, *For this cause shall a man leave his father and mother, and shall be joined unto his wife, and they two shall be one flesh* (Ephesians 5:31).',
       sv.verse_id, ev.verse_id, 'extras', 62584
  FROM _session253_1esd4_lookup sv, _session253_1esd4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=20
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=4 AND ev.verse_number=25
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-4-rebuild-jerusalem-vessels',
       E'Remember thy vow to build Jerusalem and restore the vessels',
       E'Found wisest, Zerubbabel claims as his reward not riches but the restoration: *Remember your vow, which you have vowed to build Jerusalem, in the day when you camest to your kingdom* (1 Esdras 4:43), *And to send away all the vessels that were taken away out of Jerusalem, which Cyrus set apart* (1 Esdras 4:44), and *He sent away also all the vessels from Babylon, that Cyrus had set apart... and sent to Jerusalem* (1 Esdras 4:57). This is the very decree of Ezra, *Also Cyrus the king brought forth the vessels of the house of Yahuah (LORD), which Nebuchadnezzar had brought forth out of Jerusalem, and had put them in the house of his gods* (Ezra 1:7), numbered out for the return, *All the vessels of gold and of silver were five thousand and four hundred. All these did Sheshbazzar bring up with them of the captivity that were brought up from Babylon unto Jerusalem* (Ezra 1:11). It ain''t new: Yahuah had named Cyrus long before, *That saith of Cyrus, He is my shepherd, and shall perform all my pleasure: even saying to Jerusalem, Thou shalt be built; and to the temple, Thy foundation shall be laid* (Isaiah 44:28) — the city rebuilt not for price nor reward but by the LORD''s own hand.',
       sv.verse_id, ev.verse_id, 'extras', 62587
  FROM _session253_1esd4_lookup sv, _session253_1esd4_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=43
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=4 AND ev.verse_number=63
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-esdras-4-great-is-truth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'John 14:6 — *Yahusha (Jesus) saith unto him, I am the way, the truth, and the life: no man cometh unto the Father, but by me.* The Truth that lives and conquereth for evermore is not an abstraction but a Person, in whom 1 Esdras 4:38''s enduring Truth stands incarnate.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd4_lookup sv, _session253_1esd4_lookup tv
 WHERE t.slug='1-esdras-4-great-is-truth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=14 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 17:17 — *Sanctify them through thy truth: thy word is truth.* The Truth the people exalt as mighty above all things in 1 Esdras 4:41 is identified by Yahusha as the very word of the Father.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd4_lookup sv, _session253_1esd4_lookup tv
 WHERE t.slug='1-esdras-4-great-is-truth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=17 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 117:2 — *For his merciful kindness is great toward us: and the truth of Yahuah (LORD) endureth for ever. Praise ye Yahuah (LORD).* What Zerubbabel declares of Truth that endureth and conquereth for evermore in 1 Esdras 4:38, the psalm already anchors in Yahuah whose truth endureth for ever.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd4_lookup sv, _session253_1esd4_lookup tv
 WHERE t.slug='1-esdras-4-great-is-truth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=117 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 119:160 — *Thy word is true from the beginning: and every one of thy righteous judgments endureth for ever.* Where 1 Esdras 4:40 names Truth the majesty of all ages with no unrighteousness in her judgment, the psalm ties that ageless, righteous-judging Truth to Yahuah''s word true from the beginning.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd4_lookup sv, _session253_1esd4_lookup tv
 WHERE t.slug='1-esdras-4-great-is-truth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=160
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-4-blessed-elohim-of-truth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Psalm 100:5 — *For Yahuah (LORD) is good; his mercy is everlasting; and his truth endureth to all generations.* The Elohim of truth blessed in 1 Esdras 4:40 is the LORD whose truth endureth to all generations, the majesty of all ages.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd4_lookup sv, _session253_1esd4_lookup tv
 WHERE t.slug='1-esdras-4-blessed-elohim-of-truth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=100 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'John 17:17 — *Sanctify them through thy truth: thy word is truth.* The Truth with whom is no accepting of persons in 1 Esdras 4:39 is the Father''s own word, by which his people are set apart.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd4_lookup sv, _session253_1esd4_lookup tv
 WHERE t.slug='1-esdras-4-blessed-elohim-of-truth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=39
   AND tv.edition_slug='canon' AND tv.book_slug='john' AND tv.chapter_number=17 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Psalm 119:160 — *Thy word is true from the beginning: and every one of thy righteous judgments endureth for ever.* The righteous, unfailing judgment of Truth in 1 Esdras 4:40 is the very character of Yahuah''s word, true from the beginning and enduring for ever.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd4_lookup sv, _session253_1esd4_lookup tv
 WHERE t.slug='1-esdras-4-blessed-elohim-of-truth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=119 AND tv.verse_number=160
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-4-king-heart-in-the-hand
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Proverbs 21:1 — *The king''s heart is in the hand of Yahuah (LORD), as the rivers of water: he turneth it whithersoever he will.* The king of 1 Esdras 4:3, lord of all and obeyed in everything, is himself only a river Yahuah turns where he wills.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd4_lookup sv, _session253_1esd4_lookup tv
 WHERE t.slug='1-esdras-4-king-heart-in-the-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Daniel 2:21 — *And he changeth the times and the seasons: he removeth kings, and setteth up kings: he giveth wisdom unto the wise, and knowledge to them that know understanding.* The king who commands to build or make desolate in 1 Esdras 4:8 is removed and set up by Yahuah, who alone gives the wisdom Zerubbabel is about to display.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd4_lookup sv, _session253_1esd4_lookup tv
 WHERE t.slug='1-esdras-4-king-heart-in-the-hand'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=2 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-4-leaves-father-cleaves-wife
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Genesis 2:24 — *Therefore shall a man leave his father and his mother, and shall cleave unto his wife: and they shall be one flesh.* The leaving-and-cleaving the guardsman cites in 1 Esdras 4:20 is the Eden ordinance, the man cleaving to his wife as one flesh.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd4_lookup sv, _session253_1esd4_lookup tv
 WHERE t.slug='1-esdras-4-leaves-father-cleaves-wife'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='genesis' AND tv.chapter_number=2 AND tv.verse_number=24
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Matthew 19:5 — *And said, For this cause shall a man leave father and mother, and shall cleave to his wife: and they twain shall be one flesh?* Yahusha quotes the same leaving-and-cleaving that 1 Esdras 4:20 observes, sealing it as the joining no man may sunder.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd4_lookup sv, _session253_1esd4_lookup tv
 WHERE t.slug='1-esdras-4-leaves-father-cleaves-wife'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=19 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ephesians 5:31 — *For this cause shall a man leave his father and mother, and shall be joined unto his wife, and they two shall be one flesh.* The love of wife above father and mother in 1 Esdras 4:25 is read by Paul as the great mystery of the one flesh, figuring Messiah and his bride.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd4_lookup sv, _session253_1esd4_lookup tv
 WHERE t.slug='1-esdras-4-leaves-father-cleaves-wife'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='ephesians' AND tv.chapter_number=5 AND tv.verse_number=31
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-4-rebuild-jerusalem-vessels
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 1:7 — *Also Cyrus the king brought forth the vessels of the house of Yahuah (LORD), which Nebuchadnezzar had brought forth out of Jerusalem, and had put them in the house of his gods.* The vessels Cyrus set apart that Zerubbabel asks returned in 1 Esdras 4:44 are the same Ezra records Cyrus bringing forth for the captivity.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd4_lookup sv, _session253_1esd4_lookup tv
 WHERE t.slug='1-esdras-4-rebuild-jerusalem-vessels'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=44
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=1 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 1:11 — *All the vessels of gold and of silver were five thousand and four hundred. All these did Sheshbazzar bring up with them of the captivity that were brought up from Babylon unto Jerusalem.* The sending away of all the Babylon vessels in 1 Esdras 4:57 is tallied in Ezra as the gold and silver carried up to Jerusalem.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd4_lookup sv, _session253_1esd4_lookup tv
 WHERE t.slug='1-esdras-4-rebuild-jerusalem-vessels'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=57
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=1 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Isaiah 44:28 — *That saith of Cyrus, He is my shepherd, and shall perform all my pleasure: even saying to Jerusalem, Thou shalt be built; and to the temple, Thy foundation shall be laid.* The vow to build Jerusalem that Zerubbabel invokes in 1 Esdras 4:43 was decreed by Yahuah, who named Cyrus his shepherd to rebuild the city.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd4_lookup sv, _session253_1esd4_lookup tv
 WHERE t.slug='1-esdras-4-rebuild-jerusalem-vessels'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=43
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 45:13 — *I have raised him up in righteousness, and I will direct all his ways: he shall build my city, and he shall let go my captives, not for price nor reward, saith Yahuah Tseva''ot (LORD of hosts).* The rebuilding of the temple Zerubbabel requires in 1 Esdras 4:45 fulfills Yahuah''s word that his raised-up king would build the city and free the captives, not for price nor reward.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd4_lookup sv, _session253_1esd4_lookup tv
 WHERE t.slug='1-esdras-4-rebuild-jerusalem-vessels'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=4 AND sv.verse_number=45
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=45 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1esdras_05.sql (session253 1-esdras 5) -----
-- Source anchor: apocrypha/1-esdras ch5. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1esd5 (view _session253_1esd5_lookup). Sort band base 62600, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1esd5_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-esdras-5-they-came-up-from-the-captivity
  ('apocrypha', '1-esdras', 5, 7, 'canon', 'ezra', 2, 1, 'free', E'Ezra 2:1 — *Now these are the children of the province that went up out of the captivity, of those which had been carried away, whom Nebuchadnezzar the king of Babylon had carried away unto Babylon, and came again unto Jerusalem and Yahudah (Judah), every one unto his city;* the canon''s word-for-word twin of 1 Esdras 5:7, the same return out of Babylon.'),
  ('apocrypha', '1-esdras', 5, 8, 'canon', 'ezra', 2, 2, 'free', E'Ezra 2:2 — *Which came with Zerubbabel: Jeshua, Nehemiah, Seraiah, Reelaiah, Mordecai, Bilshan, Mispar, Bigvai, Rehum, Baanah. The number of the men of the people of Yashar''el (Israel):* the same leaders Zorobabel and Jesus (Jeshua) who guide the people home in 1 Esdras 5:8.'),
  ('apocrypha', '1-esdras', 5, 46, 'canon', 'ezra', 2, 70, 'free', E'Ezra 2:70 — *So the priests, and the Levites, and some of the people, and the singers, and the porters, and the Nethinims, dwelt in their cities, and all Yashar''el (Israel) in their cities.* the identical resettlement that closes the roster in 1 Esdras 5:46, the remnant home again in their villages.'),
  -- thread: 1-esdras-5-high-priest-with-doctrine-and-truth
  ('apocrypha', '1-esdras', 5, 40, 'canon', 'ezra', 2, 63, 'free', E'Ezra 2:63 — *And the Tirshatha said unto them, that they should not eat of the most holy things, till there stood up a priest with Urim and with Thummim.* the canon''s exact parallel to 1 Esdras 5:40, the unproven priests barred until the true priest of decision arises.'),
  ('apocrypha', '1-esdras', 5, 40, 'canon', 'exodus', 28, 30, 'free', E'Exodus 28:30 — *And thou shalt put in the breastplate of judgment the Urim and the Thummim; and they shall be upon Aaron''s heart, when he goeth in before Yahuah (LORD): and Aaron shall bear the judgment of the children of Yashar''el (Israel) upon his heart before Yahuah (LORD) continually.* the Urim and Thummim are the doctrine-and-truth oracle 1 Esdras 5:40 says the high priest must wear.'),
  ('apocrypha', '1-esdras', 5, 40, 'canon', 'malachi', 2, 7, 'free', E'Malachi 2:7 — *For the priest''s lips should keep knowledge, and they should seek the law at his mouth: for he is the messenger of Yahuah Tseva''ot (LORD of hosts).* the priest clothed with doctrine of 1 Esdras 5:40 is the one whose lips keep the Torah.'),
  ('apocrypha', '1-esdras', 5, 40, 'canon', 'hebrews', 7, 26, 'free', E'Hebrews 7:26 — *For such an high priest became us, who is holy, harmless, undefiled, separate from sinners, and made higher than the heavens;* the high priest of doctrine and truth 1 Esdras 5:40 awaits is fulfilled in the spotless High Priest above the heavens.'),
  -- thread: 1-esdras-5-altar-set-up-feast-of-tabernacles
  ('apocrypha', '1-esdras', 5, 48, 'canon', 'ezra', 3, 2, 'free', E'Ezra 3:2 — *Then stood up Jeshua the son of Jozadak, and his brethren the priests, and Zerubbabel the son of Shealtiel, and his brethren, and builded the altar of the Elohim (God) of Yashar''el (Israel), to offer burnt offerings thereon, as it is written in the law of Moses the man of Elohim (God).* the canon''s word-for-word match to 1 Esdras 5:48, Jesus (Jeshua) and Zorobabel raising the altar by the law of Moses.'),
  ('apocrypha', '1-esdras', 5, 51, 'canon', 'ezra', 3, 4, 'free', E'Ezra 3:4 — *They kept also the feast of tabernacles, as it is written, and offered the daily burnt offerings by number, according to the custom, as the duty of every day required;* the same feast of tabernacles 1 Esdras 5:51 says they held as commanded in the law.'),
  ('apocrypha', '1-esdras', 5, 51, 'canon', 'leviticus', 23, 34, 'free', E'Leviticus 23:34 — *Speak unto the children of Yashar''el (Israel), saying, The fifteenth day of this seventh month shall be the feast of tabernacles for seven days unto Yahuah (LORD).* the very statute of Sukkot the returnees keep in 1 Esdras 5:51, the moed written in Moses'' book.'),
  -- thread: 1-esdras-5-foundation-trumpets-weeping-and-joy
  ('apocrypha', '1-esdras', 5, 62, 'canon', 'ezra', 3, 11, 'free', E'Ezra 3:11 — *And they sang together by course in praising and giving thanks unto Yahuah (LORD); because he is good, for his mercy endureth for ever toward Yashar''el (Israel). And all the people shouted with a great shout, when they praised Yahuah (LORD), because the foundation of the house of Yahuah (LORD) was laid.* the same thanksgiving and great shout at the foundation that 1 Esdras 5:62 records for the rearing of the house.'),
  ('apocrypha', '1-esdras', 5, 65, 'canon', 'ezra', 3, 13, 'free', E'Ezra 3:13 — *So that the people could not discern the noise of the shout of joy from the noise of the weeping of the people: for the people shouted with a loud shout, and the noise was heard afar off.* the canon''s exact twin of 1 Esdras 5:65, the weeping and the shout indistinguishable and heard afar.'),
  ('apocrypha', '1-esdras', 5, 63, 'canon', 'haggai', 2, 3, 'free', E'Haggai 2:3 — *Who is left among you that saw this house in her first glory? and how do ye see it now? is it not in your eyes in comparison of it as nothing?* this is the grief of the ancients who had seen the former house and wept in 1 Esdras 5:63.'),
  ('apocrypha', '1-esdras', 5, 63, 'canon', 'psalms', 126, 5, 'free', E'Psalm 126:5 — *They that sow in tears shall reap in joy.* the song of the restored captivity answers the weeping of the old men in 1 Esdras 5:63 with the harvest of joy.'),
  -- thread: 1-esdras-5-we-ourselves-alone-will-build
  ('apocrypha', '1-esdras', 5, 71, 'canon', 'ezra', 4, 3, 'free', E'Ezra 4:3 — *But Zerubbabel, and Jeshua, and the rest of the chief of the fathers of Yashar''el (Israel), said unto them, Ye have nothing to do with us to build an house unto our Elohim (God); but we ourselves together will build unto Yahuah Elohim (the LORD God) of Yashar''el (Israel), as king Cyrus the king of Persia hath commanded us.* the canon''s word-for-word twin of 1 Esdras 5:71, the remnant refusing a mingled temple.'),
  ('apocrypha', '1-esdras', 5, 73, 'canon', 'ezra', 4, 4, 'free', E'Ezra 4:4 — *Then the people of the land weakened the hands of the people of Yahudah (Judah), and troubled them in building,* the same adversarial hindrance that stalled the work by secret plots in 1 Esdras 5:73.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1esd5_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1esd5_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-5-they-came-up-from-the-captivity',
       E'They that came up from the captivity',
       E'1 Esdras carries the same register as the canon''s Ezra. *And these are they of Jewry that came up from the captivity, where they dwelt as strangers, whom Nabuchodonosor the king of Babylon had carried away to Babylon* (1 Esdras 5:7), *who came with Zorobabel, with Jesus, Nehemias, and Zacharias* (1 Esdras 5:8). It ain''t new — it is the Greek voice of the very return Ezra records: *Now these are the children of the province that went up out of the captivity, of those which had been carried away, whom Nebuchadnezzar the king of Babylon had carried away unto Babylon, and came again unto Jerusalem and Yahudah* (Ezra 2:1), *Which came with Zerubbabel: Jeshua, Nehemiah, Seraiah, Reelaiah, Mordecai* (Ezra 2:2). The whole congregation is the same forty-and-two thousand the remnant numbered, *all Israel in their cities* (Ezra 2:70). The seed Yahuah promised never to cast away (Romans 11) walks home by name and by tribe; election precedes the rebuilding.',
       sv.verse_id, ev.verse_id, 'extras', 62600
  FROM _session253_1esd5_lookup sv, _session253_1esd5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=5 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=5 AND ev.verse_number=8
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-5-high-priest-with-doctrine-and-truth',
       E'Till there arose an high priest with doctrine and truth',
       E'The doubtful priests who could not prove their stock were held back from the holy things *till there arose up an high priest clothed with doctrine and truth* (1 Esdras 5:40). Ezra says the same in its own words: the Tirshatha ruled *that they should not eat of the most holy things, till there stood up a priest with Urim and with Thummim* (Ezra 2:63) — the very stones of decision Yahuah set on Aaron''s heart: *And thou shalt put in the breastplate of judgment the Urim and the Thummim; and they shall be upon Aaron''s heart, when he goeth in before Yahuah (LORD)* (Exodus 28:30). The priest is meant to carry knowledge, *For the priest''s lips should keep knowledge, and they should seek the law at his mouth* (Malachi 2:7). The text reaches past Zerubbabel''s day to the High Priest who needs no register, *who is holy, harmless, undefiled, separate from sinners, and made higher than the heavens* (Hebrews 7:26) — doctrine and truth made flesh, Torah upheld, never undone.',
       sv.verse_id, ev.verse_id, 'extras', 62603
  FROM _session253_1esd5_lookup sv, _session253_1esd5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=5 AND sv.verse_number=39
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=5 AND ev.verse_number=40
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-5-altar-set-up-feast-of-tabernacles',
       E'The altar set up and the feast of tabernacles kept',
       E'Before a single stone of the house was laid, they raised the altar and kept the appointed time. *Then stood up Jesus the son of Josedec, and his brothers the priests and Zorobabel the son of Salathiel... and made ready the altar of Yahuah (God) of Yashar''el (Israel)* (1 Esdras 5:48), *To offer burnt sacrifices upon it, according as it is expressly commanded in the book of Moses the man of Yahuah (God)* (1 Esdras 5:49), and *Also they held the feast of tabernacles, as it is commanded in the law* (1 Esdras 5:51). Ezra tells it the same: *Then stood up Jeshua the son of Jozadak, and his brethren the priests, and Zerubbabel the son of Shealtiel... and builded the altar of the Elohim (God) of Yashar''el (Israel), to offer burnt offerings thereon, as it is written in the law of Moses the man of Elohim (God)* (Ezra 3:2), *They kept also the feast of tabernacles, as it is written* (Ezra 3:4). And the feast itself stands written in Moses, *The fifteenth day of this seventh month shall be the feast of tabernacles for seven days unto Yahuah (LORD)* (Leviticus 23:34). Torah stands: the returned remnant''s first act is obedience to the moedim, by the book, never law as a curse.',
       sv.verse_id, ev.verse_id, 'extras', 62606
  FROM _session253_1esd5_lookup sv, _session253_1esd5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=5 AND sv.verse_number=48
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=5 AND ev.verse_number=51
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-5-foundation-trumpets-weeping-and-joy',
       E'The trumpets and the weeping mingled with the shout of joy',
       E'When the foundation was laid, the old who remembered the first house wept while the rest shouted, and the two sounds became one. *Also of the priests and Levites, and of the chief of their families, the ancients who had seen the former house came to the building of this with weeping and great crying* (1 Esdras 5:63), *Insomuch that the trumpets might not be heard for the weeping of the people: yet the multitude sounded marvellously, so that it was heard afar off* (1 Esdras 5:65). Ezra records the same scene: *And they sang together by course in praising and giving thanks unto Yahuah (LORD); because he is good, for his mercy endureth for ever toward Yashar''el (Israel)... because the foundation of the house of Yahuah (LORD) was laid* (Ezra 3:11), and *So that the people could not discern the noise of the shout of joy from the noise of the weeping of the people... and the noise was heard afar off* (Ezra 3:13). Haggai names the ache: *Who is left among you that saw this house in her first glory? and how do ye see it now?* (Haggai 2:3). And the psalm of the return turns the tears to harvest: *They that sow in tears shall reap in joy* (Psalm 126:5). The lesser house is the same covenant promise, awaiting the glory of the latter house greater than the former.',
       sv.verse_id, ev.verse_id, 'extras', 62609
  FROM _session253_1esd5_lookup sv, _session253_1esd5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=5 AND sv.verse_number=62
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=5 AND ev.verse_number=65
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-5-we-ourselves-alone-will-build',
       E'We ourselves alone will build unto Yahuah',
       E'When the people of the land offered to build alongside them, the remnant refused a mingled house. *So they went to Zorobabel and Jesus, and to the chief of the families, and said to them, We will build together with you* (1 Esdras 5:68), but the answer held the line: *We ourselves alone will build to Yahuah (God) of Yashar''el (Israel), according as Cyrus the king of the Persians has commanded us* (1 Esdras 5:71). Ezra gives the same refusal: *But Zerubbabel, and Jeshua, and the rest of the chief of the fathers of Yashar''el (Israel), said unto them, Ye have nothing to do with us to build an house unto our Elohim (God); but we ourselves together will build unto Yahuah Elohim (the LORD God) of Yashar''el (Israel), as king Cyrus the king of Persia hath commanded us* (Ezra 4:3). And the cost was real: *Then the people of the land weakened the hands of the people of Yahudah (Judah), and troubled them in building* (Ezra 4:4) — the very secret plots and commotions that hindered the work in 1 Esdras 5:73. The covenant house is not built by syncretism; the seed keeps the pattern undiluted.',
       sv.verse_id, ev.verse_id, 'extras', 62612
  FROM _session253_1esd5_lookup sv, _session253_1esd5_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=5 AND sv.verse_number=70
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=5 AND ev.verse_number=73
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-esdras-5-they-came-up-from-the-captivity
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 2:1 — *Now these are the children of the province that went up out of the captivity, of those which had been carried away, whom Nebuchadnezzar the king of Babylon had carried away unto Babylon, and came again unto Jerusalem and Yahudah (Judah), every one unto his city;* the canon''s word-for-word twin of 1 Esdras 5:7, the same return out of Babylon.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd5_lookup sv, _session253_1esd5_lookup tv
 WHERE t.slug='1-esdras-5-they-came-up-from-the-captivity'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=5 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=2 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 2:2 — *Which came with Zerubbabel: Jeshua, Nehemiah, Seraiah, Reelaiah, Mordecai, Bilshan, Mispar, Bigvai, Rehum, Baanah. The number of the men of the people of Yashar''el (Israel):* the same leaders Zorobabel and Jesus (Jeshua) who guide the people home in 1 Esdras 5:8.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd5_lookup sv, _session253_1esd5_lookup tv
 WHERE t.slug='1-esdras-5-they-came-up-from-the-captivity'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=5 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=2 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezra 2:70 — *So the priests, and the Levites, and some of the people, and the singers, and the porters, and the Nethinims, dwelt in their cities, and all Yashar''el (Israel) in their cities.* the identical resettlement that closes the roster in 1 Esdras 5:46, the remnant home again in their villages.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd5_lookup sv, _session253_1esd5_lookup tv
 WHERE t.slug='1-esdras-5-they-came-up-from-the-captivity'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=5 AND sv.verse_number=46
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=2 AND tv.verse_number=70
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-5-high-priest-with-doctrine-and-truth
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 2:63 — *And the Tirshatha said unto them, that they should not eat of the most holy things, till there stood up a priest with Urim and with Thummim.* the canon''s exact parallel to 1 Esdras 5:40, the unproven priests barred until the true priest of decision arises.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd5_lookup sv, _session253_1esd5_lookup tv
 WHERE t.slug='1-esdras-5-high-priest-with-doctrine-and-truth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=5 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=2 AND tv.verse_number=63
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 28:30 — *And thou shalt put in the breastplate of judgment the Urim and the Thummim; and they shall be upon Aaron''s heart, when he goeth in before Yahuah (LORD): and Aaron shall bear the judgment of the children of Yashar''el (Israel) upon his heart before Yahuah (LORD) continually.* the Urim and Thummim are the doctrine-and-truth oracle 1 Esdras 5:40 says the high priest must wear.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd5_lookup sv, _session253_1esd5_lookup tv
 WHERE t.slug='1-esdras-5-high-priest-with-doctrine-and-truth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=5 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=28 AND tv.verse_number=30
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Malachi 2:7 — *For the priest''s lips should keep knowledge, and they should seek the law at his mouth: for he is the messenger of Yahuah Tseva''ot (LORD of hosts).* the priest clothed with doctrine of 1 Esdras 5:40 is the one whose lips keep the Torah.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd5_lookup sv, _session253_1esd5_lookup tv
 WHERE t.slug='1-esdras-5-high-priest-with-doctrine-and-truth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=5 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='malachi' AND tv.chapter_number=2 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Hebrews 7:26 — *For such an high priest became us, who is holy, harmless, undefiled, separate from sinners, and made higher than the heavens;* the high priest of doctrine and truth 1 Esdras 5:40 awaits is fulfilled in the spotless High Priest above the heavens.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd5_lookup sv, _session253_1esd5_lookup tv
 WHERE t.slug='1-esdras-5-high-priest-with-doctrine-and-truth'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=5 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='hebrews' AND tv.chapter_number=7 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-5-altar-set-up-feast-of-tabernacles
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 3:2 — *Then stood up Jeshua the son of Jozadak, and his brethren the priests, and Zerubbabel the son of Shealtiel, and his brethren, and builded the altar of the Elohim (God) of Yashar''el (Israel), to offer burnt offerings thereon, as it is written in the law of Moses the man of Elohim (God).* the canon''s word-for-word match to 1 Esdras 5:48, Jesus (Jeshua) and Zorobabel raising the altar by the law of Moses.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd5_lookup sv, _session253_1esd5_lookup tv
 WHERE t.slug='1-esdras-5-altar-set-up-feast-of-tabernacles'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=5 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=3 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 3:4 — *They kept also the feast of tabernacles, as it is written, and offered the daily burnt offerings by number, according to the custom, as the duty of every day required;* the same feast of tabernacles 1 Esdras 5:51 says they held as commanded in the law.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd5_lookup sv, _session253_1esd5_lookup tv
 WHERE t.slug='1-esdras-5-altar-set-up-feast-of-tabernacles'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=5 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=3 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 23:34 — *Speak unto the children of Yashar''el (Israel), saying, The fifteenth day of this seventh month shall be the feast of tabernacles for seven days unto Yahuah (LORD).* the very statute of Sukkot the returnees keep in 1 Esdras 5:51, the moed written in Moses'' book.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd5_lookup sv, _session253_1esd5_lookup tv
 WHERE t.slug='1-esdras-5-altar-set-up-feast-of-tabernacles'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=5 AND sv.verse_number=51
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=23 AND tv.verse_number=34
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-5-foundation-trumpets-weeping-and-joy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 3:11 — *And they sang together by course in praising and giving thanks unto Yahuah (LORD); because he is good, for his mercy endureth for ever toward Yashar''el (Israel). And all the people shouted with a great shout, when they praised Yahuah (LORD), because the foundation of the house of Yahuah (LORD) was laid.* the same thanksgiving and great shout at the foundation that 1 Esdras 5:62 records for the rearing of the house.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd5_lookup sv, _session253_1esd5_lookup tv
 WHERE t.slug='1-esdras-5-foundation-trumpets-weeping-and-joy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=5 AND sv.verse_number=62
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=3 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 3:13 — *So that the people could not discern the noise of the shout of joy from the noise of the weeping of the people: for the people shouted with a loud shout, and the noise was heard afar off.* the canon''s exact twin of 1 Esdras 5:65, the weeping and the shout indistinguishable and heard afar.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd5_lookup sv, _session253_1esd5_lookup tv
 WHERE t.slug='1-esdras-5-foundation-trumpets-weeping-and-joy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=5 AND sv.verse_number=65
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=3 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Haggai 2:3 — *Who is left among you that saw this house in her first glory? and how do ye see it now? is it not in your eyes in comparison of it as nothing?* this is the grief of the ancients who had seen the former house and wept in 1 Esdras 5:63.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd5_lookup sv, _session253_1esd5_lookup tv
 WHERE t.slug='1-esdras-5-foundation-trumpets-weeping-and-joy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=5 AND sv.verse_number=63
   AND tv.edition_slug='canon' AND tv.book_slug='haggai' AND tv.chapter_number=2 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 126:5 — *They that sow in tears shall reap in joy.* the song of the restored captivity answers the weeping of the old men in 1 Esdras 5:63 with the harvest of joy.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd5_lookup sv, _session253_1esd5_lookup tv
 WHERE t.slug='1-esdras-5-foundation-trumpets-weeping-and-joy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=5 AND sv.verse_number=63
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=126 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-5-we-ourselves-alone-will-build
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 4:3 — *But Zerubbabel, and Jeshua, and the rest of the chief of the fathers of Yashar''el (Israel), said unto them, Ye have nothing to do with us to build an house unto our Elohim (God); but we ourselves together will build unto Yahuah Elohim (the LORD God) of Yashar''el (Israel), as king Cyrus the king of Persia hath commanded us.* the canon''s word-for-word twin of 1 Esdras 5:71, the remnant refusing a mingled temple.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd5_lookup sv, _session253_1esd5_lookup tv
 WHERE t.slug='1-esdras-5-we-ourselves-alone-will-build'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=5 AND sv.verse_number=71
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=4 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 4:4 — *Then the people of the land weakened the hands of the people of Yahudah (Judah), and troubled them in building,* the same adversarial hindrance that stalled the work by secret plots in 1 Esdras 5:73.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd5_lookup sv, _session253_1esd5_lookup tv
 WHERE t.slug='1-esdras-5-we-ourselves-alone-will-build'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=5 AND sv.verse_number=73
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=4 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1esdras_06.sql (session253 1-esdras 6) -----
-- Source anchor: apocrypha/1-esdras ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1esd6 (view _session253_1esd6_lookup). Sort band base 62625, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1esd6_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-esdras-6-haggai-zechariah-prophesied
  ('apocrypha', '1-esdras', 6, 1, 'canon', 'ezra', 5, 1, 'free', E'Ezra 5:1 — *Then the prophets, Haggai the prophet, and Zechariah the son of Iddo, prophesied unto the Yahudim (Jews) that were in Yahudah (Judah) and Jerusalem in the name of the Elohim (God) of Yashar''el (Israel), even unto them.* The canon names the very prophets 1 Esdras 6:1 calls Aggeus and Zacharias the son of Addo, prophesying in that same second year of Darius.'),
  ('apocrypha', '1-esdras', 6, 2, 'canon', 'ezra', 5, 2, 'free', E'Ezra 5:2 — *Then rose up Zerubbabel the son of Shealtiel, and Jeshua the son of Jozadak, and began to build the house of Elohim (God) which is at Jerusalem: and with them were the prophets of Elohim (God) helping them.* The same pair of builders, Zorobabel and Jesus/Yeshua son of Josedec, begin the house with the prophets helping, exactly as 1 Esdras 6:2 records.'),
  ('apocrypha', '1-esdras', 6, 2, 'canon', 'haggai', 1, 1, 'free', E'Haggai 1:1 — *In the second year of Darius the king, in the sixth month, in the first day of the month, came the word of Yahuah (LORD) by Haggai the prophet unto Zerubbabel the son of Shealtiel, governor of Yahudah (Judah), and to Joshua the son of Josedech, the high priest, saying,* The prophetic word that 1 Esdras 6:2 says raised up Zorobabel and Jesus son of Josedec is the word of Yahuah by Haggai, addressed to those same two men.'),
  -- thread: 1-esdras-6-servants-of-the-maker
  ('apocrypha', '1-esdras', 6, 13, 'canon', 'ezra', 5, 11, 'free', E'Ezra 5:11 — *And thus they returned us answer, saying, We are the servants of the Elohim (God) of heaven and earth, and build the house that was builded these many years ago, which a great king of Yashar''el (Israel) builded and set up.* The identical confession of the elders, the servants of the Maker of heaven and earth, that 1 Esdras 6:13 records.'),
  ('apocrypha', '1-esdras', 6, 14, 'canon', 'ezra', 5, 11, 'free', E'Ezra 5:11 — *And thus they returned us answer, saying, We are the servants of the Elohim (God) of heaven and earth, and build the house that was builded these many years ago, which a great king of Yashar''el (Israel) builded and set up.* The same verse that adds the house was builded long ago by a great king of Yashar''el, as 1 Esdras 6:14 says it was builded many years ago by a king of Yashar''el great and strong.'),
  -- thread: 1-esdras-6-cyrus-decree-found-in-the-rolls
  ('apocrypha', '1-esdras', 6, 21, 'canon', 'ezra', 6, 1, 'free', E'Ezra 6:1 — *Then Darius the king made a decree, and search was made in the house of the rolls, where the treasures were laid up in Babylon.* The canon''s record of the very search among the records of Cyrus that 1 Esdras 6:21 calls for.'),
  ('apocrypha', '1-esdras', 6, 24, 'canon', 'ezra', 6, 3, 'free', E'Ezra 6:3 — *In the first year of Cyrus the king the same Cyrus the king made a decree concerning the house of Elohim (God) at Jerusalem, Let the house be builded, the place where they offered sacrifices, and let the foundations thereof be strongly laid; the height thereof threescore cubits, and the breadth thereof threescore cubits;* The same Cyrus-decree, with the same threescore-cubit dimensions, that 1 Esdras 6:24-25 records being found in the roll.'),
  ('apocrypha', '1-esdras', 6, 17, 'canon', 'ezra', 1, 2, 'free', E'Ezra 1:2 — *Thus saith Cyrus king of Persia, Yahuah Elohim (The LORD God) of heaven hath given me all the kingdoms of the earth; and he hath charged me to build him an house at Jerusalem, which is in Yahudah (Judah).* The original proclamation of Cyrus to build the house, which 1 Esdras 6:17 says he wrote in his first year over Babylon.'),
  ('apocrypha', '1-esdras', 6, 24, 'canon', 'isaiah', 44, 28, 'free', E'Isaiah 44:28 — *That saith of Cyrus, He is my shepherd, and shall perform all my pleasure: even saying to Jerusalem, Thou shalt be built; and to the temple, Thy foundation shall be laid.* Yahuah named Cyrus and his temple-decree by prophecy long before; the decree found in 1 Esdras 6:24 is the foretold word performed.'),
  -- thread: 1-esdras-6-the-work-finished-through-the-prophets
  ('apocrypha', '1-esdras', 6, 28, 'canon', 'ezra', 6, 14, 'free', E'Ezra 6:14 — *And the elders of the Yahudim (Jews) builded, and they prospered through the prophesying of Haggai the prophet and Zechariah the son of Iddo. And they builded, and finished it, according to the commandment of the Elohim (God) of Yashar''el (Israel), and according to the commandment of Cyrus, and Darius, and Artaxerxes king of Persia.* The finishing that Darius commands in 1 Esdras 6:28 comes, the canon says, through the prophesying of Haggai and Zechariah by the commandment of Elohim and the kings.'),
  ('apocrypha', '1-esdras', 6, 28, 'canon', 'zechariah', 4, 9, 'free', E'Zechariah 4:9 — *The hands of Zerubbabel have laid the foundation of this house; his hands shall also finish it; and thou shalt know that Yahuah Tseva''ot (LORD of hosts) hath sent me unto you.* The very promise that the house would be built up whole again and finished, which Darius decrees in 1 Esdras 6:28, was spoken to Zorobabel by the prophet.'),
  ('apocrypha', '1-esdras', 6, 28, 'canon', 'zechariah', 4, 6, 'free', E'Zechariah 4:6 — *Then he answered and spake unto me, saying, This is the word of Yahuah (LORD) unto Zerubbabel, saying, Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts).* The deeper cause of the prospering work that Darius funds in 1 Esdras 6:28 — the house is finished by Yahuah''s Spirit, not by imperial might or power.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1esd6_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1esd6_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-6-haggai-zechariah-prophesied',
       E'The prophets Aggeus and Zacharias stir up the building',
       E'*Now in the second year of the reign of Darius Aggeus and Zacharias the son of Addo, the prophets, prophesied to the Yahudim (Jews) in Jewry and Jerusalem in the name of Yahuah (God) of Yashar''el (Israel), which was upon them.* (1 Esdras 6:1) Then *stood up Zorobabel the son of Salatiel, and Jesus the son of Josedec, and began to build the house of Yahuah (God) at Jerusalem, the prophets of Yahuah (God) being with them, and helping them.* (1 Esdras 6:2) It ain''t new — this is the canon''s own record, almost word for word: *Then the prophets, Haggai the prophet, and Zechariah the son of Iddo, prophesied unto the Yahudim (Jews) that were in Yahudah (Judah) and Jerusalem in the name of the Elohim (God) of Yashar''el (Israel), even unto them.* (Ezra 5:1) And the work rose with them: *Then rose up Zerubbabel the son of Shealtiel, and Jeshua the son of Jozadak, and began to build the house of Elohim (God) which is at Jerusalem: and with them were the prophets of Elohim (God) helping them.* (Ezra 5:2) The word that moved them came through Haggai in that same second year of Darius: *In the second year of Darius the king, in the sixth month, in the first day of the month, came the word of Yahuah (LORD) by Haggai the prophet unto Zerubbabel the son of Shealtiel, governor of Yahudah (Judah), and to Joshua the son of Josedech, the high priest, saying,* (Haggai 1:1) — the same Zorobabel, the same Jesus/Joshua son of Josedec (here Yeshua ben Josedech, the high priest, NOT the Messiah), stirred up to build by the prophetic word.',
       sv.verse_id, ev.verse_id, 'extras', 62625
  FROM _session253_1esd6_lookup sv, _session253_1esd6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=6 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=6 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-6-servants-of-the-maker',
       E'We are the servants of Him who made heaven and earth',
       E'When the governors demand by whose authority the house is built, the elders answer with a confession of the Creator: *So they gave us this answer, We are the servants of Yahuah (God) which made heaven and earth.* (1 Esdras 6:13) The canon preserves the same reply almost letter for letter: *And thus they returned us answer, saying, We are the servants of the Elohim (God) of heaven and earth, and build the house that was builded these many years ago, which a great king of Yashar''el (Israel) builded and set up.* (Ezra 5:11) The builders do not plead a king''s permit first; they confess the Maker — for the house being raised belongs to *Yahuah (God) which made heaven and earth*, the same word with which the Scriptures open (Genesis 1:1). The covenant identity precedes the imperial paperwork: they are servants of the Creator before they are subjects of Darius.',
       sv.verse_id, ev.verse_id, 'extras', 62628
  FROM _session253_1esd6_lookup sv, _session253_1esd6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=6 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=6 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-6-cyrus-decree-found-in-the-rolls',
       E'Darius searches the rolls and finds Cyrus'' decree',
       E'Darius is asked to let the matter be tested against the imperial archives: *Now therefore, if it seem good to the king, let search be made among the records of king Cyrus:* (1 Esdras 6:21) The canon frames the search the same way: *Then Darius the king made a decree, and search was made in the house of the rolls, where the treasures were laid up in Babylon.* (Ezra 6:1) And the decree is found — *In the first year of the reign of Cyrus king Cyrus commanded that the house of Yahuah (God) at Jerusalem should be built again, where they do sacrifice with continual fire:* (1 Esdras 6:24); so the canon: *In the first year of Cyrus the king the same Cyrus the king made a decree concerning the house of Elohim (God) at Jerusalem, Let the house be builded, the place where they offered sacrifices, and let the foundations thereof be strongly laid; the height thereof threescore cubits, and the breadth thereof threescore cubits;* (Ezra 6:3) None of this is new: Cyrus'' decree itself fulfils what Yahuah had spoken long before through Isaiah — *That saith of Cyrus, He is my shepherd, and shall perform all my pleasure: even saying to Jerusalem, Thou shalt be built; and to the temple, Thy foundation shall be laid.* (Isaiah 44:28) The pagan king''s roll is the prophesied instrument of the house''s restoration.',
       sv.verse_id, ev.verse_id, 'extras', 62631
  FROM _session253_1esd6_lookup sv, _session253_1esd6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=6 AND sv.verse_number=21
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=6 AND ev.verse_number=24
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-6-the-work-finished-through-the-prophets',
       E'The work prospers and is finished through Haggai and Zechariah',
       E'Darius confirms and funds the work: *I have commanded also to have it built up whole again; and that they look diligently to help those that be of the captivity of the Yahudim (Jews), till the house of Yahuah (God) be finished:* (1 Esdras 6:28) The canon tells how that finishing actually came — not by might of empire but by the prophetic word: *And the elders of the Yahudim (Jews) builded, and they prospered through the prophesying of Haggai the prophet and Zechariah the son of Iddo. And they builded, and finished it, according to the commandment of the Elohim (God) of Yashar''el (Israel), and according to the commandment of Cyrus, and Darius, and Artaxerxes king of Persia.* (Ezra 6:14) And the promise that the same hands which laid the foundation would finish it was spoken to Zerubbabel by Zechariah: *The hands of Zerubbabel have laid the foundation of this house; his hands shall also finish it; and thou shalt know that Yahuah Tseva''ot (LORD of hosts) hath sent me unto you.* (Zechariah 4:9) — for the house is built *Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts).* (Zechariah 4:6) The king''s diligence in 1 Esdras 6:28 is real, but the unseen engine is the Spirit through the prophets.',
       sv.verse_id, ev.verse_id, 'extras', 62634
  FROM _session253_1esd6_lookup sv, _session253_1esd6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=6 AND sv.verse_number=28
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=6 AND ev.verse_number=28
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-esdras-6-haggai-zechariah-prophesied
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 5:1 — *Then the prophets, Haggai the prophet, and Zechariah the son of Iddo, prophesied unto the Yahudim (Jews) that were in Yahudah (Judah) and Jerusalem in the name of the Elohim (God) of Yashar''el (Israel), even unto them.* The canon names the very prophets 1 Esdras 6:1 calls Aggeus and Zacharias the son of Addo, prophesying in that same second year of Darius.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd6_lookup sv, _session253_1esd6_lookup tv
 WHERE t.slug='1-esdras-6-haggai-zechariah-prophesied'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=6 AND sv.verse_number=1
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=5 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 5:2 — *Then rose up Zerubbabel the son of Shealtiel, and Jeshua the son of Jozadak, and began to build the house of Elohim (God) which is at Jerusalem: and with them were the prophets of Elohim (God) helping them.* The same pair of builders, Zorobabel and Jesus/Yeshua son of Josedec, begin the house with the prophets helping, exactly as 1 Esdras 6:2 records.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd6_lookup sv, _session253_1esd6_lookup tv
 WHERE t.slug='1-esdras-6-haggai-zechariah-prophesied'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=5 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Haggai 1:1 — *In the second year of Darius the king, in the sixth month, in the first day of the month, came the word of Yahuah (LORD) by Haggai the prophet unto Zerubbabel the son of Shealtiel, governor of Yahudah (Judah), and to Joshua the son of Josedech, the high priest, saying,* The prophetic word that 1 Esdras 6:2 says raised up Zorobabel and Jesus son of Josedec is the word of Yahuah by Haggai, addressed to those same two men.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd6_lookup sv, _session253_1esd6_lookup tv
 WHERE t.slug='1-esdras-6-haggai-zechariah-prophesied'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='haggai' AND tv.chapter_number=1 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-6-servants-of-the-maker
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 5:11 — *And thus they returned us answer, saying, We are the servants of the Elohim (God) of heaven and earth, and build the house that was builded these many years ago, which a great king of Yashar''el (Israel) builded and set up.* The identical confession of the elders, the servants of the Maker of heaven and earth, that 1 Esdras 6:13 records.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd6_lookup sv, _session253_1esd6_lookup tv
 WHERE t.slug='1-esdras-6-servants-of-the-maker'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=6 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=5 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 5:11 — *And thus they returned us answer, saying, We are the servants of the Elohim (God) of heaven and earth, and build the house that was builded these many years ago, which a great king of Yashar''el (Israel) builded and set up.* The same verse that adds the house was builded long ago by a great king of Yashar''el, as 1 Esdras 6:14 says it was builded many years ago by a king of Yashar''el great and strong.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd6_lookup sv, _session253_1esd6_lookup tv
 WHERE t.slug='1-esdras-6-servants-of-the-maker'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=6 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=5 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-6-cyrus-decree-found-in-the-rolls
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 6:1 — *Then Darius the king made a decree, and search was made in the house of the rolls, where the treasures were laid up in Babylon.* The canon''s record of the very search among the records of Cyrus that 1 Esdras 6:21 calls for.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd6_lookup sv, _session253_1esd6_lookup tv
 WHERE t.slug='1-esdras-6-cyrus-decree-found-in-the-rolls'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=6 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=6 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 6:3 — *In the first year of Cyrus the king the same Cyrus the king made a decree concerning the house of Elohim (God) at Jerusalem, Let the house be builded, the place where they offered sacrifices, and let the foundations thereof be strongly laid; the height thereof threescore cubits, and the breadth thereof threescore cubits;* The same Cyrus-decree, with the same threescore-cubit dimensions, that 1 Esdras 6:24-25 records being found in the roll.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd6_lookup sv, _session253_1esd6_lookup tv
 WHERE t.slug='1-esdras-6-cyrus-decree-found-in-the-rolls'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=6 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=6 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezra 1:2 — *Thus saith Cyrus king of Persia, Yahuah Elohim (The LORD God) of heaven hath given me all the kingdoms of the earth; and he hath charged me to build him an house at Jerusalem, which is in Yahudah (Judah).* The original proclamation of Cyrus to build the house, which 1 Esdras 6:17 says he wrote in his first year over Babylon.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd6_lookup sv, _session253_1esd6_lookup tv
 WHERE t.slug='1-esdras-6-cyrus-decree-found-in-the-rolls'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=6 AND sv.verse_number=17
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=1 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 44:28 — *That saith of Cyrus, He is my shepherd, and shall perform all my pleasure: even saying to Jerusalem, Thou shalt be built; and to the temple, Thy foundation shall be laid.* Yahuah named Cyrus and his temple-decree by prophecy long before; the decree found in 1 Esdras 6:24 is the foretold word performed.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd6_lookup sv, _session253_1esd6_lookup tv
 WHERE t.slug='1-esdras-6-cyrus-decree-found-in-the-rolls'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=6 AND sv.verse_number=24
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=44 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-6-the-work-finished-through-the-prophets
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 6:14 — *And the elders of the Yahudim (Jews) builded, and they prospered through the prophesying of Haggai the prophet and Zechariah the son of Iddo. And they builded, and finished it, according to the commandment of the Elohim (God) of Yashar''el (Israel), and according to the commandment of Cyrus, and Darius, and Artaxerxes king of Persia.* The finishing that Darius commands in 1 Esdras 6:28 comes, the canon says, through the prophesying of Haggai and Zechariah by the commandment of Elohim and the kings.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd6_lookup sv, _session253_1esd6_lookup tv
 WHERE t.slug='1-esdras-6-the-work-finished-through-the-prophets'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=6 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=6 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Zechariah 4:9 — *The hands of Zerubbabel have laid the foundation of this house; his hands shall also finish it; and thou shalt know that Yahuah Tseva''ot (LORD of hosts) hath sent me unto you.* The very promise that the house would be built up whole again and finished, which Darius decrees in 1 Esdras 6:28, was spoken to Zorobabel by the prophet.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd6_lookup sv, _session253_1esd6_lookup tv
 WHERE t.slug='1-esdras-6-the-work-finished-through-the-prophets'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=6 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Zechariah 4:6 — *Then he answered and spake unto me, saying, This is the word of Yahuah (LORD) unto Zerubbabel, saying, Not by might, nor by power, but by my spirit, saith Yahuah Tseva''ot (LORD of hosts).* The deeper cause of the prospering work that Darius funds in 1 Esdras 6:28 — the house is finished by Yahuah''s Spirit, not by imperial might or power.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd6_lookup sv, _session253_1esd6_lookup tv
 WHERE t.slug='1-esdras-6-the-work-finished-through-the-prophets'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=6 AND sv.verse_number=28
   AND tv.edition_slug='canon' AND tv.book_slug='zechariah' AND tv.chapter_number=4 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1esdras_07.sql (session253 1-esdras 7) -----
-- Source anchor: apocrypha/1-esdras ch7. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1esd7 (view _session253_1esd7_lookup). Sort band base 62650, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1esd7_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-esdras-7-house-finished
  ('apocrypha', '1-esdras', 7, 3, 'canon', 'ezra', 6, 14, 'free', E'Ezra 6:14 — *And the elders of the Yahudim (Jews) builded, and they prospered through the prophesying of Haggai the prophet and Zechariah the son of Iddo. And they builded, and finished it, according to the commandment of the Elohim (God) of Yashar''el (Israel), and according to the commandment of Cyrus, and Darius, and Artaxerxes king of Persia.* The same Haggai and Zechariah prophesying, the same kings named, the same commandment of Elohim that 1 Esdras 7:3-4 records word for word.'),
  ('apocrypha', '1-esdras', 7, 5, 'canon', 'ezra', 6, 15, 'free', E'Ezra 6:15 — *And this house was finished on the third day of the month Adar, which was in the sixth year of the reign of Darius the king.* The month Adar and the sixth year of Darius fix the completion exactly as 1 Esdras 7:5 dates it.'),
  ('apocrypha', '1-esdras', 7, 4, 'canon', '2-chronicles', 7, 1, 'free', E'2 Chronicles 7:1 — *Now when Solomon had made an end of praying, the fire came down from heaven, and consumed the burnt offering and the sacrifices; and the glory of Yahuah (LORD) filled the house.* The first house Solomon finished and the second house the exiles finish are one work of one Elohim, as 1 Esdras 7:4 declares it built by His commandment.'),
  -- thread: 1-esdras-7-dedication-offerings
  ('apocrypha', '1-esdras', 7, 7, 'canon', 'ezra', 6, 17, 'free', E'Ezra 6:17 — *And offered at the dedication of this house of Elohim (God) an hundred bullocks, two hundred rams, four hundred lambs; and for a sin offering for all Yashar''el (Israel), twelve he goats, according to the number of the tribes of Yashar''el (Israel).* The identical tally, and the twelve goats for the whole twelve-tribe house, matching 1 Esdras 7:7-8 exactly.'),
  ('apocrypha', '1-esdras', 7, 9, 'canon', 'ezra', 6, 18, 'free', E'Ezra 6:18 — *And they set the priests in their divisions, and the Levites in their courses, for the service of Elohim (God), which is at Jerusalem; as it is written in the book of Moses.* The priests and Levites arrayed by the book of Moses are the same ranks 1 Esdras 7:9 sets in their vestments at every gate.'),
  ('apocrypha', '1-esdras', 7, 7, 'canon', '2-chronicles', 7, 5, 'free', E'2 Chronicles 7:5 — *And king Solomon offered a sacrifice of twenty and two thousand oxen, and an hundred and twenty thousand sheep: so the king and all the people dedicated the house of Elohim (God).* Solomon''s first dedication-sacrifice is the pattern the smaller returning remnant follows in 1 Esdras 7:7, the house dedicated with blood.'),
  -- thread: 1-esdras-7-passover-kept
  ('apocrypha', '1-esdras', 7, 10, 'canon', 'ezra', 6, 19, 'free', E'Ezra 6:19 — *And the children of the captivity kept the passover upon the fourteenth day of the first month.* The very fourteenth day of the first month 1 Esdras 7:10 names, the returned captivity keeping the Passover.'),
  ('apocrypha', '1-esdras', 7, 10, 'canon', 'exodus', 12, 18, 'free', E'Exodus 12:18 — *In the first month, on the fourteenth day of the month at even, ye shall eat unleavened bread, until the one and twentieth day of the month at even.* The Sinai ordinance fixes the fourteenth-day Passover the exiles keep in 1 Esdras 7:10 — the feast did not change in captivity.'),
  ('apocrypha', '1-esdras', 7, 14, 'canon', 'ezra', 6, 22, 'free', E'Ezra 6:22 — *And kept the feast of unleavened bread seven days with joy: for Yahuah (LORD) had made them joyful, and turned the heart of the king of Assyria unto them, to strengthen their hands in the work of the house of Elohim (God), the Elohim (God) of Yashar''el (Israel).* The seven-day feast kept with joy, and the turned heart of the Assyrian king strengthening their hands, is 1 Esdras 7:14-15 told in Ezra''s own words.'),
  ('apocrypha', '1-esdras', 7, 14, 'canon', '1-corinthians', 5, 7, 'free', E'1 Corinthians 5:7 — *Purge out therefore the old leaven, that ye may be a new lump, as ye are unleavened. For even Messiah (Christ) our passover is sacrificed for us:* The seven-day unleavened feast the exiles keep before Yahuah in 1 Esdras 7:14 finds its substance in Yahusha, our Passover.'),
  -- thread: 1-esdras-7-separated-holy
  ('apocrypha', '1-esdras', 7, 13, 'canon', 'ezra', 6, 21, 'free', E'Ezra 6:21 — *And the children of Yashar''el (Israel), which were come again out of captivity, and all such as had separated themselves unto them from the filthiness of the heathen of the land, to seek Yahuah Elohim (the LORD God) of Yashar''el (Israel), did eat.* The separated remnant that seeks Yahuah and eats the Passover is 1 Esdras 7:13 in Ezra''s own line.'),
  ('apocrypha', '1-esdras', 7, 13, 'canon', 'leviticus', 20, 26, 'free', E'Leviticus 20:26 — *And ye shall be holy unto me: for I Yahuah (LORD) am holy, and have severed you from other people, that ye should be mine.* The severing from the peoples that Yahuah commands is the very separation from the abominations of the land the exiles enact in 1 Esdras 7:13.'),
  ('apocrypha', '1-esdras', 7, 13, 'canon', 'leviticus', 20, 7, 'free', E'Leviticus 20:7 — *Sanctify yourselves therefore, and be ye holy: for I am Yahuah Elohaychem (the LORD your God).* The command to sanctify and separate stands behind the returned captivity who separated themselves and sought Yahuah in 1 Esdras 7:13.'),
  ('apocrypha', '1-esdras', 7, 13, 'canon', '2-corinthians', 6, 17, 'free', E'2 Corinthians 6:17 — *Wherefore come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you,* The apostolic call to come out and be separate from the unclean is the same covenant separation the exiles keep in 1 Esdras 7:13.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1esd7_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1esd7_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-7-house-finished',
       E'The holy house finished, the prophets prophesying',
       E'The returned exiles bring the temple to completion under the prophets'' word: *And so the holy works prospered, when Aggeus and Zacharias the prophets prophesied. And they finished these things by the commandment of Yahuah (God) of Yashar''el (Israel)... And thus was the holy house finished in the three and twentieth day of the month Adar, in the sixth year of Darius king of the Persians* (1 Esd 7:3-5). This is the very record of Ezra: *And the elders of the Yahudim (Jews) builded, and they prospered through the prophesying of Haggai the prophet and Zechariah the son of Iddo. And they builded, and finished it, according to the commandment of the Elohim (God) of Yashar''el (Israel)* (Ezra 6:14). And the date stands witness: *And this house was finished on the third day of the month Adar, which was in the sixth year of the reign of Darius the king* (Ezra 6:15) — the same Adar, the same sixth year of Darius. It ain''t new: the word that built the first house through Solomon builds the second, *Now when Solomon had made an end of praying, the fire came down from heaven... and the glory of Yahuah (LORD) filled the house* (2 Chron 7:1).',
       sv.verse_id, ev.verse_id, 'extras', 62650
  FROM _session253_1esd7_lookup sv, _session253_1esd7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=7 AND ev.verse_number=5
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-7-dedication-offerings',
       E'The dedication: bullocks, rams, lambs, and twelve goats for all Israel',
       E'The house is dedicated with sacrifice for every tribe: *And to the dedication of the temple of Yahuah (God) they offered an hundred bullocks two hundred rams, four hundred lambs; And twelve goats for the sin of all Yashar''el (Israel), according to the number of the chief of the tribes of Yashar''el (Israel)* (1 Esd 7:7-8). Ezra counts the same herd: *And offered at the dedication of this house of Elohim (God) an hundred bullocks, two hundred rams, four hundred lambs; and for a sin offering for all Yashar''el (Israel), twelve he goats, according to the number of the tribes of Yashar''el (Israel)* (Ezra 6:17) — twelve goats, for the returned exiles never forget the twelve tribes, the whole house, not Judah only. And the priests stand by the book of Moses as Solomon''s dedication stood, *And king Solomon offered a sacrifice of twenty and two thousand oxen, and an hundred and twenty thousand sheep: so the king and all the people dedicated the house of Elohim (God)* (2 Chron 7:5).',
       sv.verse_id, ev.verse_id, 'extras', 62653
  FROM _session253_1esd7_lookup sv, _session253_1esd7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=7
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=7 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-7-passover-kept',
       E'The Passover and unleavened bread kept by the returned captivity',
       E'The exiles keep the appointed feast in its season: *And the children of Yashar''el (Israel) that were of the captivity held the passover the fourteenth day of the first month... And they kept the feast of unleavened bread seven days, making merry before Yahuah (God)* (1 Esd 7:10,14). This is Ezra''s record verbatim: *And the children of the captivity kept the passover upon the fourteenth day of the first month* (Ezra 6:19), and *kept the feast of unleavened bread seven days with joy* (Ezra 6:22). And it ain''t new — it is the standing ordinance of Sinai: *In the first month, on the fourteenth day of the month at even, ye shall eat unleavened bread* (Exo 12:18), *ye shall keep it a feast by an ordinance for ever* (Exo 12:14). The feast the redeemed keep is the redeemed Yahusha keeps: *For even Messiah (Christ) our passover is sacrificed for us* (1 Cor 5:7) — *Therefore let us keep the feast* (1 Cor 5:8).',
       sv.verse_id, ev.verse_id, 'extras', 62656
  FROM _session253_1esd7_lookup sv, _session253_1esd7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=10
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=7 AND ev.verse_number=14
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-7-separated-holy',
       E'Separated from the heathen filthiness to seek Yahuah',
       E'Only those who came out of the world''s abominations eat the Passover: *And the children of Yashar''el (Israel) that came out of the captivity did eat, even all they that had separated themselves from the abominations of the people of the land, and sought Yahuah (God)* (1 Esd 7:13). Ezra records the same separation: *And the children of Yashar''el (Israel), which were come again out of captivity, and all such as had separated themselves unto them from the filthiness of the heathen of the land, to seek Yahuah Elohim (the LORD God) of Yashar''el (Israel), did eat* (Ezra 6:21). And it ain''t new — this is the holiness Yahuah severed His people unto from the beginning: *And ye shall be holy unto me: for I Yahuah (LORD) am holy, and have severed you from other people, that ye should be mine* (Lev 20:26); *Sanctify yourselves therefore, and be ye holy* (Lev 20:7). The call to the separated table runs straight into the gospel: *Wherefore come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you* (2 Cor 6:17).',
       sv.verse_id, ev.verse_id, 'extras', 62659
  FROM _session253_1esd7_lookup sv, _session253_1esd7_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=13
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=7 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-esdras-7-house-finished
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 6:14 — *And the elders of the Yahudim (Jews) builded, and they prospered through the prophesying of Haggai the prophet and Zechariah the son of Iddo. And they builded, and finished it, according to the commandment of the Elohim (God) of Yashar''el (Israel), and according to the commandment of Cyrus, and Darius, and Artaxerxes king of Persia.* The same Haggai and Zechariah prophesying, the same kings named, the same commandment of Elohim that 1 Esdras 7:3-4 records word for word.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd7_lookup sv, _session253_1esd7_lookup tv
 WHERE t.slug='1-esdras-7-house-finished'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=6 AND tv.verse_number=14
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 6:15 — *And this house was finished on the third day of the month Adar, which was in the sixth year of the reign of Darius the king.* The month Adar and the sixth year of Darius fix the completion exactly as 1 Esdras 7:5 dates it.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd7_lookup sv, _session253_1esd7_lookup tv
 WHERE t.slug='1-esdras-7-house-finished'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=6 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Chronicles 7:1 — *Now when Solomon had made an end of praying, the fire came down from heaven, and consumed the burnt offering and the sacrifices; and the glory of Yahuah (LORD) filled the house.* The first house Solomon finished and the second house the exiles finish are one work of one Elohim, as 1 Esdras 7:4 declares it built by His commandment.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd7_lookup sv, _session253_1esd7_lookup tv
 WHERE t.slug='1-esdras-7-house-finished'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=7 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-7-dedication-offerings
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 6:17 — *And offered at the dedication of this house of Elohim (God) an hundred bullocks, two hundred rams, four hundred lambs; and for a sin offering for all Yashar''el (Israel), twelve he goats, according to the number of the tribes of Yashar''el (Israel).* The identical tally, and the twelve goats for the whole twelve-tribe house, matching 1 Esdras 7:7-8 exactly.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd7_lookup sv, _session253_1esd7_lookup tv
 WHERE t.slug='1-esdras-7-dedication-offerings'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 6:18 — *And they set the priests in their divisions, and the Levites in their courses, for the service of Elohim (God), which is at Jerusalem; as it is written in the book of Moses.* The priests and Levites arrayed by the book of Moses are the same ranks 1 Esdras 7:9 sets in their vestments at every gate.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd7_lookup sv, _session253_1esd7_lookup tv
 WHERE t.slug='1-esdras-7-dedication-offerings'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=6 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Chronicles 7:5 — *And king Solomon offered a sacrifice of twenty and two thousand oxen, and an hundred and twenty thousand sheep: so the king and all the people dedicated the house of Elohim (God).* Solomon''s first dedication-sacrifice is the pattern the smaller returning remnant follows in 1 Esdras 7:7, the house dedicated with blood.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd7_lookup sv, _session253_1esd7_lookup tv
 WHERE t.slug='1-esdras-7-dedication-offerings'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='2-chronicles' AND tv.chapter_number=7 AND tv.verse_number=5
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-7-passover-kept
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 6:19 — *And the children of the captivity kept the passover upon the fourteenth day of the first month.* The very fourteenth day of the first month 1 Esdras 7:10 names, the returned captivity keeping the Passover.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd7_lookup sv, _session253_1esd7_lookup tv
 WHERE t.slug='1-esdras-7-passover-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=6 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Exodus 12:18 — *In the first month, on the fourteenth day of the month at even, ye shall eat unleavened bread, until the one and twentieth day of the month at even.* The Sinai ordinance fixes the fourteenth-day Passover the exiles keep in 1 Esdras 7:10 — the feast did not change in captivity.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd7_lookup sv, _session253_1esd7_lookup tv
 WHERE t.slug='1-esdras-7-passover-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=12 AND tv.verse_number=18
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezra 6:22 — *And kept the feast of unleavened bread seven days with joy: for Yahuah (LORD) had made them joyful, and turned the heart of the king of Assyria unto them, to strengthen their hands in the work of the house of Elohim (God), the Elohim (God) of Yashar''el (Israel).* The seven-day feast kept with joy, and the turned heart of the Assyrian king strengthening their hands, is 1 Esdras 7:14-15 told in Ezra''s own words.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd7_lookup sv, _session253_1esd7_lookup tv
 WHERE t.slug='1-esdras-7-passover-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=6 AND tv.verse_number=22
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'1 Corinthians 5:7 — *Purge out therefore the old leaven, that ye may be a new lump, as ye are unleavened. For even Messiah (Christ) our passover is sacrificed for us:* The seven-day unleavened feast the exiles keep before Yahuah in 1 Esdras 7:14 finds its substance in Yahusha, our Passover.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd7_lookup sv, _session253_1esd7_lookup tv
 WHERE t.slug='1-esdras-7-passover-kept'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=14
   AND tv.edition_slug='canon' AND tv.book_slug='1-corinthians' AND tv.chapter_number=5 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-7-separated-holy
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 6:21 — *And the children of Yashar''el (Israel), which were come again out of captivity, and all such as had separated themselves unto them from the filthiness of the heathen of the land, to seek Yahuah Elohim (the LORD God) of Yashar''el (Israel), did eat.* The separated remnant that seeks Yahuah and eats the Passover is 1 Esdras 7:13 in Ezra''s own line.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd7_lookup sv, _session253_1esd7_lookup tv
 WHERE t.slug='1-esdras-7-separated-holy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=6 AND tv.verse_number=21
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Leviticus 20:26 — *And ye shall be holy unto me: for I Yahuah (LORD) am holy, and have severed you from other people, that ye should be mine.* The severing from the peoples that Yahuah commands is the very separation from the abominations of the land the exiles enact in 1 Esdras 7:13.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd7_lookup sv, _session253_1esd7_lookup tv
 WHERE t.slug='1-esdras-7-separated-holy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=20 AND tv.verse_number=26
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Leviticus 20:7 — *Sanctify yourselves therefore, and be ye holy: for I am Yahuah Elohaychem (the LORD your God).* The command to sanctify and separate stands behind the returned captivity who separated themselves and sought Yahuah in 1 Esdras 7:13.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd7_lookup sv, _session253_1esd7_lookup tv
 WHERE t.slug='1-esdras-7-separated-holy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='leviticus' AND tv.chapter_number=20 AND tv.verse_number=7
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'2 Corinthians 6:17 — *Wherefore come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you,* The apostolic call to come out and be separate from the unclean is the same covenant separation the exiles keep in 1 Esdras 7:13.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd7_lookup sv, _session253_1esd7_lookup tv
 WHERE t.slug='1-esdras-7-separated-holy'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=7 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1esdras_08.sql (session253 1-esdras 8) -----
-- Source anchor: apocrypha/1-esdras ch8. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1esd8 (view _session253_1esd8_lookup). Sort band base 62675, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1esd8_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-esdras-8-ready-scribe
  ('apocrypha', '1-esdras', 8, 3, 'canon', 'ezra', 7, 6, 'free', E'Ezra 7:6 — *This Ezra went up from Babylon; and he was a ready scribe in the law of Moses, which Yahuah Elohim (the LORD God) of Yashar''el (Israel) had given: and the king granted him all his request, according to the hand of Yahuah Elohav (the LORD his God) upon him.* The canon names the same ready scribe going up from Babylon with the law of Moses that 1 Esdras 8:3 retells.'),
  ('apocrypha', '1-esdras', 8, 7, 'canon', 'ezra', 7, 10, 'free', E'Ezra 7:10 — *For Ezra had prepared his heart to seek the law of Yahuah (LORD), and to do it, and to teach in Yashar''el (Israel) statutes and judgments.* The seek-do-teach heart of Ezra 7:10 is exactly the man who omitted nothing of the law in 1 Esdras 8:7.'),
  -- thread: 1-esdras-8-kings-letter
  ('apocrypha', '1-esdras', 8, 10, 'canon', 'ezra', 7, 13, 'free', E'Ezra 7:13 — *I make a decree, that all they of the people of Yashar''el (Israel), and of his priests and Levites, in my realm, which are minded of their own freewill to go up to Jerusalem, go with thee.* The canon''s freewill decree to go up to Jerusalem is the same commission 1 Esdras 8:10 records.'),
  ('apocrypha', '1-esdras', 8, 13, 'canon', 'ezra', 7, 15, 'free', E'Ezra 7:15 — *And to carry the silver and gold, which the king and his counsellors have freely offered unto the Elohim (God) of Yashar''el (Israel), whose habitation is in Jerusalem.* The freely-offered silver and gold borne to Jerusalem in Ezra 7:15 is the vowed gold and silver of 1 Esdras 8:13.'),
  ('apocrypha', '1-esdras', 8, 21, 'canon', 'ezra', 7, 23, 'free', E'Ezra 7:23 — *Whatsoever is commanded by the Elohim (God) of heaven, let it be diligently done for the house of the Elohim (God) of heaven: for why should there be wrath against the realm of the king and his sons?* The canon''s same dread of wrath upon the king and his sons matches 1 Esdras 8:21 word for word.'),
  -- thread: 1-esdras-8-blessed-be-Yahuah
  ('apocrypha', '1-esdras', 8, 25, 'canon', 'ezra', 7, 27, 'free', E'Ezra 7:27 — *Blessed be Yahuah Elohim (the LORD God) of our fathers, which hath put such a thing as this in the king''s heart, to beautify the house of Yahuah (LORD) which is in Jerusalem.* The canon''s blessing for the heart moved to glorify the house is the same doxology as 1 Esdras 8:25.'),
  ('apocrypha', '1-esdras', 8, 26, 'canon', 'ezra', 7, 28, 'free', E'Ezra 7:28 — *And hath extended mercy unto me before the king, and his counsellors, and before all the king''s mighty princes. And I was strengthened as the hand of Yahuah Elohai (the LORD my God) was upon me, and I gathered together out of Yashar''el (Israel) chief men to go up with me.* The mercy shown before king and counsellors in Ezra 7:28 is the very favour 1 Esdras 8:26 records.'),
  ('apocrypha', '1-esdras', 8, 25, 'canon', 'proverbs', 21, 1, 'free', E'Proverbs 21:1 — *The king''s heart is in the hand of Yahuah, as the rivers of water: he turneth it whithersoever he will.* Proverbs gives the principle behind 1 Esdras 8:25 — Yahuah put the matter into the heart of Artaxerxes.'),
  -- thread: 1-esdras-8-strange-marriages
  ('apocrypha', '1-esdras', 8, 69, 'canon', 'ezra', 9, 1, 'free', E'Ezra 9:1 — *Now when these things were done, the princes came to me, saying, The people of Yashar''el (Israel), and the priests, and the Levites, have not separated themselves from the people of the lands, doing according to their abominations, even of the Canaanites, the Hittites, the Perizzites, the Jebusites, the Ammonites, the Moabites, the Egyptians, and the Amorites.* The canon''s report of the unseparated people is the same news brought to Ezra in 1 Esdras 8:69.'),
  ('apocrypha', '1-esdras', 8, 70, 'canon', 'ezra', 9, 2, 'free', E'Ezra 9:2 — *For they have taken of their daughters for themselves, and for their sons: so that the holy seed have mingled themselves with the people of those lands: yea, the hand of the princes and rulers hath been chief in this trespass.* The mingled holy seed of Ezra 9:2 is the same trespass named in 1 Esdras 8:70.'),
  ('apocrypha', '1-esdras', 8, 70, 'canon', 'deuteronomy', 7, 3, 'free', E'Deuteronomy 7:3 — *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son.* The Torah command broken in 1 Esdras 8:70 is the marriage prohibition Moses gave in Deuteronomy 7:3.'),
  ('apocrypha', '1-esdras', 8, 70, 'canon', 'isaiah', 6, 13, 'free', E'Isaiah 6:13 — *But yet in it shall be a tenth, and it shall return, and shall be eaten: as a teil tree, and as an oak, whose substance is in them, when they cast their leaves: so the holy seed shall be the substance thereof.* Isaiah''s holy seed that remains as the substance is the very seed 1 Esdras 8:70 mourns as mingled.'),
  -- thread: 1-esdras-8-confession-remnant
  ('apocrypha', '1-esdras', 8, 75, 'canon', 'ezra', 9, 6, 'free', E'Ezra 9:6 — *And said, O my Elohim (God), I am ashamed and blush to lift up my face to thee, my Elohim (God): for our iniquities are increased over our head, and our trespass is grown up unto the heavens.* The canon''s iniquities risen over the head and grown to heaven are the very words of 1 Esdras 8:75.'),
  ('apocrypha', '1-esdras', 8, 78, 'canon', 'ezra', 9, 8, 'free', E'Ezra 9:8 — *And now for a little space grace hath been shewed from Yahuah Eloheinu (the LORD our God), to leave us a remnant to escape, and to give us a nail in his holy place, that our Elohim (God) may lighten our eyes, and give us a little reviving in our bondage.* The remnant left in the holy place in Ezra 9:8 is the root and name 1 Esdras 8:78 confesses.'),
  ('apocrypha', '1-esdras', 8, 89, 'canon', 'ezra', 9, 15, 'free', E'Ezra 9:15 — *O Yahuah Elohim (LORD God) of Yashar''el (Israel), thou art righteous: for we remain yet escaped, as it is this day: behold, we are before thee in our trespasses: for we cannot stand before thee because of this.* The canon''s "thou art righteous, we remain yet escaped" is exactly the root-left-this-day confession of 1 Esdras 8:89.'),
  ('apocrypha', '1-esdras', 8, 74, 'canon', 'daniel', 9, 4, 'free', E'Daniel 9:4 — *And I prayed unto Yahuah Elohai (the LORD my God), and made my confession, and said, O Yahuah (Lord), the great and dreadful Elohim (God), keeping the covenant and mercy to them that love him, and to them that keep his commandments.* Daniel''s confessing prayer that pleads the covenant kept is the sibling of Ezra''s confession opened in 1 Esdras 8:74.'),
  -- thread: 1-esdras-8-oath-put-away
  ('apocrypha', '1-esdras', 8, 91, 'canon', 'ezra', 10, 1, 'free', E'Ezra 10:1 — *Now when Ezra had prayed, and when he had confessed, weeping and casting himself down before the house of Elohim (God), there assembled unto him out of Yashar''el (Israel) a very great congregation of men and women and children: for the people wept very sore.* The canon''s weeping congregation gathered before the house is the same multitude 1 Esdras 8:91 describes.'),
  ('apocrypha', '1-esdras', 8, 93, 'canon', 'ezra', 10, 3, 'free', E'Ezra 10:3 — *Now therefore let us make a covenant with our Elohim (God) to put away all the wives, and such as are born of them, according to the counsel of my lord, and of those that tremble at the commandment of our Elohim (God); and let it be done according to the law.* The covenant to put away the wives according to the law is the very oath Jechonias proposes in 1 Esdras 8:93.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1esd8_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1esd8_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-8-ready-scribe',
       E'The scribe with the law in his hand',
       E'1 Esdras opens with the scribe who carries the Torah back to Jerusalem: *This Esdras went up from Babylon, as a scribe, being very ready in the law of Moses, that was given by Yahuah (God) of Yashar''el (Israel)* (1 Esdras 8:3), and *For Esdras had very great skill, so that he omitted nothing of the law and commandments of Yahuah (God), but taught all Yashar''el (Israel) the ordinances and judgments* (1 Esdras 8:7). It ain''t new — this is the very Ezra of the canon, word for word: *This Ezra went up from Babylon; and he was a ready scribe in the law of Moses, which Yahuah Elohim (the LORD God) of Yashar''el (Israel) had given* (Ezra 7:6), the man who *had prepared his heart to seek the law of Yahuah (LORD), and to do it, and to teach in Yashar''el (Israel) statutes and judgments* (Ezra 7:10). Torah carried home, sought, done, and taught — the threefold pattern stands.',
       sv.verse_id, ev.verse_id, 'extras', 62675
  FROM _session253_1esd8_lookup sv, _session253_1esd8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=8 AND ev.verse_number=7
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-8-kings-letter',
       E'The king''s freewill decree for the house',
       E'The Persian decree is reproduced almost line for line. 1 Esdras gives *King Artexerxes to Esdras the priest and reader of the law of Yahuah (God) sends greeting* (1 Esdras 8:9), authorizing all who *are willing and desirous* to go up (8:10), the silver and gold *which I and my friends have vowed* carried to Jerusalem (8:13), and the warning *Let all things be performed after the law of Yahuah (God) diligently to the most high Yahuah (God), that wrath come not upon the kingdom of the king and his sons* (1 Esdras 8:21). The canon''s letter is the same hand: *I make a decree, that all they of the people of Yashar''el (Israel)... which are minded of their own freewill to go up to Jerusalem, go with thee* (Ezra 7:13), the *freewill offered* silver and gold (Ezra 7:15), and *why should there be wrath against the realm of the king and his sons?* (Ezra 7:23). A pagan king''s edict serving the house of Yahuah — election working even through Persia.',
       sv.verse_id, ev.verse_id, 'extras', 62678
  FROM _session253_1esd8_lookup sv, _session253_1esd8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=9
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=8 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-8-blessed-be-Yahuah',
       E'Blessed be Yahuah who moved the king''s heart',
       E'Ezra''s doxology breaks out at the decree: *Then said Esdras the scribe, Blessed be the only Yahuah (God) of my fathers, who has put these things into the heart of the king, to glorify his house that is in Jerusalem* (1 Esdras 8:25), *And has honoured me in the sight of the king, and his counsellors, and all his friends and nobles* (8:26). The canon''s blessing is identical: *Blessed be Yahuah Elohim (the LORD God) of our fathers, which hath put such a thing as this in the king''s heart, to beautify the house of Yahuah (LORD) which is in Jerusalem* (Ezra 7:27), *And hath extended mercy unto me before the king, and his counsellors, and before all the king''s mighty princes* (Ezra 7:28). The King of kings turns the heart of an earthly king — *The king''s heart is in the hand of Yahuah, as the rivers of water: he turneth it whithersoever he will* (Proverbs 21:1).',
       sv.verse_id, ev.verse_id, 'extras', 62681
  FROM _session253_1esd8_lookup sv, _session253_1esd8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=25
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=8 AND ev.verse_number=26
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-8-strange-marriages',
       E'The holy seed mingled with the strangers',
       E'The crisis is reported to Ezra: *The nation of Yashar''el (Israel), the princes, the priests and Levites, have not put away from them the strange people of the land* (1 Esdras 8:69), and *the holy seed is mixed with the strange people of the land* (1 Esdras 8:70). The canon reports it in the same words: *The people of Yashar''el (Israel), and the priests, and the Levites, have not separated themselves from the people of the lands* (Ezra 9:1), *so that the holy seed have mingled themselves with the people of those lands* (Ezra 9:2). The Torah command stands behind both — *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son* (Deuteronomy 7:3) — and Isaiah names the very phrase, *so the holy seed shall be the substance thereof* (Isaiah 6:13). The covenant seed kept distinct, never dissolved into the nations.',
       sv.verse_id, ev.verse_id, 'extras', 62684
  FROM _session253_1esd8_lookup sv, _session253_1esd8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=69
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=8 AND ev.verse_number=70
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-8-confession-remnant',
       E'Ezra''s confession and the root left',
       E'Ezra prays the great penitential confession: *I said, O Yahuah (God), I am confounded and ashamed before your face* (1 Esdras 8:74), *For our sins are multiplied above our heads, and our ignorances have reached up to heaven* (8:75), yet *there should be left us a root and a name in the place of your sanctuary* (8:78), closing *O Yahuah (God) of Yashar''el (Israel), you are true: for we are left a root this day* (1 Esdras 8:89). The canon''s Ezra prays the same: *O my Elohim (God), I am ashamed and blush to lift up my face to thee... for our iniquities are increased over our head* (Ezra 9:6), pleading the *remnant to escape* (Ezra 9:8) and confessing *thou art righteous: for we remain yet escaped, as it is this day* (Ezra 9:15). Daniel''s parallel confession stands beside it: *O Yahuah (Lord), the great and dreadful Elohim (God), keeping the covenant and mercy* (Daniel 9:4). Election precedes confession — the root is left because Yahuah is true, not because the people earned it; the remnant of the covenant is never cast away.',
       sv.verse_id, ev.verse_id, 'extras', 62687
  FROM _session253_1esd8_lookup sv, _session253_1esd8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=74
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=8 AND ev.verse_number=89
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-8-oath-put-away',
       E'The covenant and the great congregation',
       E'The people answer the prayer with an oath: *And as Esdras in his prayer made his confession, weeping, and lying flat upon the ground before the temple, there gathered to him from Jerusalem a very great multitude of men and women and children: for there was great weeping among the multitude* (1 Esdras 8:91), and Jechonias cries *Let us make an oath to Yahuah (God), that we will put away all our wives, which we have taken of the heathen, with their children* (1 Esdras 8:93). The canon is the same scene: *Now when Ezra had prayed, and when he had confessed, weeping and casting himself down before the house of Elohim (God), there assembled unto him out of Yashar''el (Israel) a very great congregation* (Ezra 10:1), and Shechaniah answers *let us make a covenant with our Elohim (God) to put away all the wives... and let it be done according to the law* (Ezra 10:3). Repentance gathers the congregation; the covenant is renewed by obeying the law of Yahuah — Torah stands, never set aside.',
       sv.verse_id, ev.verse_id, 'extras', 62690
  FROM _session253_1esd8_lookup sv, _session253_1esd8_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=91
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=8 AND ev.verse_number=93
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-esdras-8-ready-scribe
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 7:6 — *This Ezra went up from Babylon; and he was a ready scribe in the law of Moses, which Yahuah Elohim (the LORD God) of Yashar''el (Israel) had given: and the king granted him all his request, according to the hand of Yahuah Elohav (the LORD his God) upon him.* The canon names the same ready scribe going up from Babylon with the law of Moses that 1 Esdras 8:3 retells.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-ready-scribe'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=7 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 7:10 — *For Ezra had prepared his heart to seek the law of Yahuah (LORD), and to do it, and to teach in Yashar''el (Israel) statutes and judgments.* The seek-do-teach heart of Ezra 7:10 is exactly the man who omitted nothing of the law in 1 Esdras 8:7.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-ready-scribe'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=7
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=7 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-8-kings-letter
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 7:13 — *I make a decree, that all they of the people of Yashar''el (Israel), and of his priests and Levites, in my realm, which are minded of their own freewill to go up to Jerusalem, go with thee.* The canon''s freewill decree to go up to Jerusalem is the same commission 1 Esdras 8:10 records.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-kings-letter'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=10
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=7 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 7:15 — *And to carry the silver and gold, which the king and his counsellors have freely offered unto the Elohim (God) of Yashar''el (Israel), whose habitation is in Jerusalem.* The freely-offered silver and gold borne to Jerusalem in Ezra 7:15 is the vowed gold and silver of 1 Esdras 8:13.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-kings-letter'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=7 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezra 7:23 — *Whatsoever is commanded by the Elohim (God) of heaven, let it be diligently done for the house of the Elohim (God) of heaven: for why should there be wrath against the realm of the king and his sons?* The canon''s same dread of wrath upon the king and his sons matches 1 Esdras 8:21 word for word.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-kings-letter'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=21
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=7 AND tv.verse_number=23
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-8-blessed-be-Yahuah
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 7:27 — *Blessed be Yahuah Elohim (the LORD God) of our fathers, which hath put such a thing as this in the king''s heart, to beautify the house of Yahuah (LORD) which is in Jerusalem.* The canon''s blessing for the heart moved to glorify the house is the same doxology as 1 Esdras 8:25.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-blessed-be-Yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=7 AND tv.verse_number=27
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 7:28 — *And hath extended mercy unto me before the king, and his counsellors, and before all the king''s mighty princes. And I was strengthened as the hand of Yahuah Elohai (the LORD my God) was upon me, and I gathered together out of Yashar''el (Israel) chief men to go up with me.* The mercy shown before king and counsellors in Ezra 7:28 is the very favour 1 Esdras 8:26 records.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-blessed-be-Yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=26
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=7 AND tv.verse_number=28
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Proverbs 21:1 — *The king''s heart is in the hand of Yahuah, as the rivers of water: he turneth it whithersoever he will.* Proverbs gives the principle behind 1 Esdras 8:25 — Yahuah put the matter into the heart of Artaxerxes.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-blessed-be-Yahuah'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=25
   AND tv.edition_slug='canon' AND tv.book_slug='proverbs' AND tv.chapter_number=21 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-8-strange-marriages
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 9:1 — *Now when these things were done, the princes came to me, saying, The people of Yashar''el (Israel), and the priests, and the Levites, have not separated themselves from the people of the lands, doing according to their abominations, even of the Canaanites, the Hittites, the Perizzites, the Jebusites, the Ammonites, the Moabites, the Egyptians, and the Amorites.* The canon''s report of the unseparated people is the same news brought to Ezra in 1 Esdras 8:69.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-strange-marriages'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=69
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=9 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 9:2 — *For they have taken of their daughters for themselves, and for their sons: so that the holy seed have mingled themselves with the people of those lands: yea, the hand of the princes and rulers hath been chief in this trespass.* The mingled holy seed of Ezra 9:2 is the same trespass named in 1 Esdras 8:70.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-strange-marriages'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=70
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=9 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 7:3 — *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son.* The Torah command broken in 1 Esdras 8:70 is the marriage prohibition Moses gave in Deuteronomy 7:3.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-strange-marriages'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=70
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Isaiah 6:13 — *But yet in it shall be a tenth, and it shall return, and shall be eaten: as a teil tree, and as an oak, whose substance is in them, when they cast their leaves: so the holy seed shall be the substance thereof.* Isaiah''s holy seed that remains as the substance is the very seed 1 Esdras 8:70 mourns as mingled.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-strange-marriages'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=70
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=6 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-8-confession-remnant
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 9:6 — *And said, O my Elohim (God), I am ashamed and blush to lift up my face to thee, my Elohim (God): for our iniquities are increased over our head, and our trespass is grown up unto the heavens.* The canon''s iniquities risen over the head and grown to heaven are the very words of 1 Esdras 8:75.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-confession-remnant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=75
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=9 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 9:8 — *And now for a little space grace hath been shewed from Yahuah Eloheinu (the LORD our God), to leave us a remnant to escape, and to give us a nail in his holy place, that our Elohim (God) may lighten our eyes, and give us a little reviving in our bondage.* The remnant left in the holy place in Ezra 9:8 is the root and name 1 Esdras 8:78 confesses.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-confession-remnant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=78
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=9 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Ezra 9:15 — *O Yahuah Elohim (LORD God) of Yashar''el (Israel), thou art righteous: for we remain yet escaped, as it is this day: behold, we are before thee in our trespasses: for we cannot stand before thee because of this.* The canon''s "thou art righteous, we remain yet escaped" is exactly the root-left-this-day confession of 1 Esdras 8:89.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-confession-remnant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=89
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=9 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Daniel 9:4 — *And I prayed unto Yahuah Elohai (the LORD my God), and made my confession, and said, O Yahuah (Lord), the great and dreadful Elohim (God), keeping the covenant and mercy to them that love him, and to them that keep his commandments.* Daniel''s confessing prayer that pleads the covenant kept is the sibling of Ezra''s confession opened in 1 Esdras 8:74.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-confession-remnant'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=74
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=9 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-8-oath-put-away
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 10:1 — *Now when Ezra had prayed, and when he had confessed, weeping and casting himself down before the house of Elohim (God), there assembled unto him out of Yashar''el (Israel) a very great congregation of men and women and children: for the people wept very sore.* The canon''s weeping congregation gathered before the house is the same multitude 1 Esdras 8:91 describes.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-oath-put-away'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=91
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=10 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 10:3 — *Now therefore let us make a covenant with our Elohim (God) to put away all the wives, and such as are born of them, according to the counsel of my lord, and of those that tremble at the commandment of our Elohim (God); and let it be done according to the law.* The covenant to put away the wives according to the law is the very oath Jechonias proposes in 1 Esdras 8:93.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd8_lookup sv, _session253_1esd8_lookup tv
 WHERE t.slug='1-esdras-8-oath-put-away'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=8 AND sv.verse_number=93
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=10 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- ----- fragment: minion_1esdras_09.sql (session253 1-esdras 9) -----
-- Source anchor: apocrypha/1-esdras ch9. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: 1esd9 (view _session253_1esd9_lookup). Sort band base 62700, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_1esd9_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: 1-esdras-9-strange-wives-ezra-ten
  ('apocrypha', '1-esdras', 9, 5, 'canon', 'ezra', 10, 9, 'free', E'Ezra 10:9 — *Then all the men of Yahudah (Judah) and Benjamin gathered themselves together unto Jerusalem within three days. It was the ninth month, on the twentieth day of the month; and all the people sat in the street of the house of Elohim (God), trembling because of this matter, and for the great rain.* The very tribes, the very twentieth day of the ninth month, the very rain of 1 Esdras 9:5 stand recorded in the canon.'),
  ('apocrypha', '1-esdras', 9, 4, 'canon', 'ezra', 10, 8, 'free', E'Ezra 10:8 — *And that whosoever would not come within three days, according to the counsel of the princes and the elders, all his substance should be forfeited, and himself separated from the congregation of those that had been carried away.* The forfeit of goods and casting-out for any who failed to gather is the same decree Esdras proclaims in 1 Esdras 9:4.'),
  -- thread: 1-esdras-9-confess-and-separate
  ('apocrypha', '1-esdras', 9, 8, 'canon', 'ezra', 10, 11, 'free', E'Ezra 10:11 — *Now therefore make confession unto Yahuah Elohim (the LORD God) of your fathers, and do his pleasure: and separate yourselves from the people of the land, and from the strange wives.* Esdras'' threefold charge to confess, do His will, and separate in 1 Esdras 9:8-9 is Ezra''s charge verbatim in covenant force.'),
  ('apocrypha', '1-esdras', 9, 9, 'canon', 'deuteronomy', 7, 3, 'free', E'Deuteronomy 7:3 — *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son.* The separation from strange women Esdras commands in 1 Esdras 9:9 is obedience to the marriage boundary Moses set in the Torah.'),
  ('apocrypha', '1-esdras', 9, 9, 'canon', '2-corinthians', 6, 17, 'free', E'2 Corinthians 6:17 — *Wherefore come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you,* The same set-apart calling Esdras presses in 1 Esdras 9:9 sounds again to the renewed assembly — come out and be separate.'),
  -- thread: 1-esdras-9-mourning-iniquity
  ('apocrypha', '1-esdras', 9, 2, 'canon', 'ezra', 10, 6, 'free', E'Ezra 10:6 — *Then Ezra rose up from before the house of Elohim (God), and went into the chamber of Johanan the son of Eliashib: and when he came thither, he did eat no bread, nor drink water: for he mourned because of the transgression of them that had been carried away.* The chamber of Johanan, the fast from bread and water, the mourning over the captivity''s sin in 1 Esdras 9:1-2 are recorded the same in the canon.'),
  ('apocrypha', '1-esdras', 9, 2, 'canon', 'ezra', 9, 4, 'free', E'Ezra 9:4 — *Then were assembled unto me every one that trembled at the words of the Elohim (God) of Yashar''el (Israel), because of the transgression of those that had been carried away; and I sat astonied until the evening sacrifice.* Esdras'' mourning over the great iniquities in 1 Esdras 9:2 gathers, as Ezra''s did, all who tremble at the word of Elohim.'),
  -- thread: 1-esdras-9-reading-the-law
  ('apocrypha', '1-esdras', 9, 41, 'canon', 'nehemiah', 8, 3, 'free', E'Nehemiah 8:3 — *And he read therein before the street that was before the water gate from the morning until midday, before the men and the women, and those that could understand; and the ears of all the people were attentive unto the book of the law.* The reading from morning to midday before men and women, the multitude giving heed, in 1 Esdras 9:41 is Nehemiah''s broad-place reading exactly.'),
  ('apocrypha', '1-esdras', 9, 38, 'canon', 'nehemiah', 8, 1, 'free', E'Nehemiah 8:1 — *And all the people gathered themselves together as one man into the street that was before the water gate; and they spake unto Ezra the scribe to bring the book of the law of Moses, which Yahuah (LORD) had commanded to Yashar''el (Israel).* The whole multitude gathering with one accord and calling for the Law in 1 Esdras 9:38-39 is the same assembly at the water gate.'),
  ('apocrypha', '1-esdras', 9, 40, 'canon', 'deuteronomy', 31, 12, 'free', E'Deuteronomy 31:12 — *Gather the people together, men, and women, and children, and thy stranger that is within thy gates, that they may hear, and that they may learn, and fear Yahuah Elohaychem (the LORD your God), and observe to do all the words of this law:* Esdras reading the Law to the whole multitude from man to woman in 1 Esdras 9:40 fulfills Moses'' command to gather all Israel to hear the law read aloud.'),
  ('apocrypha', '1-esdras', 9, 48, 'canon', 'luke', 24, 45, 'free', E'Luke 24:45 — *Then opened he their understanding, that they might understand the scriptures,* The Levites making the people understand the law in 1 Esdras 9:48 foreshadow the risen Messiah opening the understanding of His own to the Scriptures.'),
  -- thread: 1-esdras-9-joy-is-your-strength
  ('apocrypha', '1-esdras', 9, 52, 'canon', 'nehemiah', 8, 10, 'free', E'Nehemiah 8:10 — *Then he said unto them, Go your way, eat the fat, and drink the sweet, and send portions unto them for whom nothing is prepared: for this day is holy unto our Lord: neither be ye sorry; for the joy of Yahuah (LORD) is your strength.* Esdras'' charge to eat the fat, drink the sweet, send portions, and be not sorrowful in 1 Esdras 9:51-52 is Nehemiah''s word — and its ground is that the joy of Yahuah is the people''s strength.'),
  ('apocrypha', '1-esdras', 9, 50, 'canon', 'nehemiah', 8, 9, 'free', E'Nehemiah 8:9 — *And Nehemiah, which is the Tirshatha, and Ezra the priest the scribe, and the Levites that taught the people, said unto all the people, This day is holy unto Yahuah Elohaychem (the LORD your God); mourn not, nor weep. For all the people wept, when they heard the words of the law.* The holy day, the weeping at the hearing of the law, and the call to mourn not in 1 Esdras 9:50 are the same scene Nehemiah records.'),
  ('apocrypha', '1-esdras', 9, 55, 'canon', 'nehemiah', 8, 12, 'free', E'Nehemiah 8:12 — *And all the people went their way to eat, and to drink, and to send portions, and to make great mirth, because they had understood the words that were declared unto them.* The multitude going to feast because they understood the words in which they were instructed in 1 Esdras 9:55 closes the scene exactly as Nehemiah does — understanding turned to gladness.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_1esd9_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_1esd9_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-9-strange-wives-ezra-ten',
       E'The congregation in the rain — Ezra''s own record',
       E'Esdras'' account of the gathered remnant is Ezra 10 told over again, word for word in substance: *And in three days were all they of the tribe of Yahudah (Judah) and Benjamin gathered together at Jerusalem the twentieth day of the ninth month. And all the multitude sat trembling in the broad court of the temple because of the present foul weather* (1 Esdras 9:5-6). The Hebrew canon records the same hour: *Then all the men of Yahudah (Judah) and Benjamin gathered themselves together unto Jerusalem within three days. It was the ninth month, on the twentieth day of the month; and all the people sat in the street of the house of Elohim (God), trembling because of this matter, and for the great rain* (Ezra 10:9). It ain''t new — 1 Esdras is the same testimony, the same returned remnant trembling in the rain before the rebuilt house.',
       sv.verse_id, ev.verse_id, 'extras', 62700
  FROM _session253_1esd9_lookup sv, _session253_1esd9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=9 AND ev.verse_number=6
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-9-confess-and-separate',
       E'Confess, do His will, and be separate from the strange women',
       E'Esdras stands and charges the people: *And now by confessing give glory to Yahuah (God) of our fathers, And do his will, and separate yourselves from the heathen of the land, and from the strange women* (1 Esdras 9:8-9). This is Ezra''s own commandment: *Now therefore make confession unto Yahuah Elohim (the LORD God) of your fathers, and do his pleasure: and separate yourselves from the people of the land, and from the strange wives* (Ezra 10:11). The Torah had set the boundary from the beginning — *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son* (Deuteronomy 7:3), *For they will turn away thy son from following me, that they may serve other gods* (Deuteronomy 7:4). The same call carries into the renewed covenant — *Wherefore come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you* (2 Corinthians 6:17). One unbroken summons to a set-apart seed.',
       sv.verse_id, ev.verse_id, 'extras', 62703
  FROM _session253_1esd9_lookup sv, _session253_1esd9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=8
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=9 AND ev.verse_number=9
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-9-mourning-iniquity',
       E'Esdras fasting and mourning for the iniquity of the multitude',
       E'Before the assembly, Esdras goes apart and grieves: *And remained there, and did eat no meat nor drink water, mourning for the great iniquities of the multitude* (1 Esdras 9:2). Ezra records the identical fast: *Then Ezra rose up from before the house of Elohim (God), and went into the chamber of Johanan the son of Eliashib: and when he came thither, he did eat no bread, nor drink water: for he mourned because of the transgression of them that had been carried away* (Ezra 10:6). The mourning gathers others who fear the word — *Then were assembled unto me every one that trembled at the words of the Elohim (God) of Yashar''el (Israel), because of the transgression of those that had been carried away* (Ezra 9:4). The priest''s grief over the people''s sin is the burden of every true intercessor.',
       sv.verse_id, ev.verse_id, 'extras', 62706
  FROM _session253_1esd9_lookup sv, _session253_1esd9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=1
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=9 AND ev.verse_number=2
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-9-reading-the-law',
       E'★ Esdras reads the Law on the broad place — Nehemiah 8',
       E'The great scene: the whole multitude gathers and Esdras the priest and reader brings out the Law. *And the whole multitude came together with one accord into the broad place of the holy porch toward the east... And he read in the broad court before the holy porch from morning to midday, before both men and women; and the multitude gave heed to the law* (1 Esdras 9:38, 41). This is Nehemiah 8 told again: *And all the people gathered themselves together as one man into the street that was before the water gate; and they spake unto Ezra the scribe to bring the book of the law of Moses, which Yahuah (LORD) had commanded to Yashar''el (Israel)* (Nehemiah 8:1); *And he read therein before the street that was before the water gate from the morning until midday, before the men and the women, and those that could understand; and the ears of all the people were attentive unto the book of the law* (Nehemiah 8:3). Moses himself had appointed this public reading: *thou shalt read this law before all Yashar''el (Israel) in their hearing. Gather the people together, men, and women, and children... that they may hear, and that they may learn, and fear Yahuah Elohaychem (the LORD your God)* (Deuteronomy 31:11-12). And the Levites who *taught the law of Yahuah (God), making them withal to understand it* (1 Esdras 9:48) prefigure the One who *opened... their understanding, that they might understand the scriptures* (Luke 24:45). The Law read aloud to all the people, the seed brought back to the Word — it ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 62709
  FROM _session253_1esd9_lookup sv, _session253_1esd9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=38
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=9 AND ev.verse_number=48
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT '1-esdras-9-joy-is-your-strength',
       E'★ This day is holy — mourn not, the joy of Yahuah is your strength',
       E'When the people weep at the hearing of the Law, they are turned from sorrow to feast: *This day is holy to Yahuah (God); (for they all wept when they heard the law:) Go then, and eat the fat, and drink the sweet, and send part to them that have nothing; For this day is holy to Yahuah (God): and be not sorrowful; for Yahuah (God) will bring you to honour* (1 Esdras 9:50-52). This is the very word of Nehemiah 8: *This day is holy unto Yahuah Elohaychem (the LORD your God); mourn not, nor weep. For all the people wept, when they heard the words of the law* (Nehemiah 8:9); *Go your way, eat the fat, and drink the sweet, and send portions unto them for whom nothing is prepared: for this day is holy unto our Lord: neither be ye sorry; for the joy of Yahuah (LORD) is your strength* (Nehemiah 8:10). And the people went, *because they understood the words in which they were instructed* (1 Esdras 9:55) — as Nehemiah records, *because they had understood the words that were declared unto them* (Nehemiah 8:12). The Word brings conviction and then joy; the holy day is kept with feasting and portions for the poor. It ain''t new.',
       sv.verse_id, ev.verse_id, 'extras', 62712
  FROM _session253_1esd9_lookup sv, _session253_1esd9_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=50
   AND ev.edition_slug='apocrypha' AND ev.book_slug='1-esdras' AND ev.chapter_number=9 AND ev.verse_number=55
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: 1-esdras-9-strange-wives-ezra-ten
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 10:9 — *Then all the men of Yahudah (Judah) and Benjamin gathered themselves together unto Jerusalem within three days. It was the ninth month, on the twentieth day of the month; and all the people sat in the street of the house of Elohim (God), trembling because of this matter, and for the great rain.* The very tribes, the very twentieth day of the ninth month, the very rain of 1 Esdras 9:5 stand recorded in the canon.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd9_lookup sv, _session253_1esd9_lookup tv
 WHERE t.slug='1-esdras-9-strange-wives-ezra-ten'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=10 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 10:8 — *And that whosoever would not come within three days, according to the counsel of the princes and the elders, all his substance should be forfeited, and himself separated from the congregation of those that had been carried away.* The forfeit of goods and casting-out for any who failed to gather is the same decree Esdras proclaims in 1 Esdras 9:4.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd9_lookup sv, _session253_1esd9_lookup tv
 WHERE t.slug='1-esdras-9-strange-wives-ezra-ten'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=10 AND tv.verse_number=8
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-9-confess-and-separate
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 10:11 — *Now therefore make confession unto Yahuah Elohim (the LORD God) of your fathers, and do his pleasure: and separate yourselves from the people of the land, and from the strange wives.* Esdras'' threefold charge to confess, do His will, and separate in 1 Esdras 9:8-9 is Ezra''s charge verbatim in covenant force.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd9_lookup sv, _session253_1esd9_lookup tv
 WHERE t.slug='1-esdras-9-confess-and-separate'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=8
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=10 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Deuteronomy 7:3 — *Neither shalt thou make marriages with them; thy daughter thou shalt not give unto his son, nor his daughter shalt thou take unto thy son.* The separation from strange women Esdras commands in 1 Esdras 9:9 is obedience to the marriage boundary Moses set in the Torah.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd9_lookup sv, _session253_1esd9_lookup tv
 WHERE t.slug='1-esdras-9-confess-and-separate'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=7 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Corinthians 6:17 — *Wherefore come out from among them, and be ye separate, saith Yahuah (Lord), and touch not the unclean thing; and I will receive you,* The same set-apart calling Esdras presses in 1 Esdras 9:9 sounds again to the renewed assembly — come out and be separate.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd9_lookup sv, _session253_1esd9_lookup tv
 WHERE t.slug='1-esdras-9-confess-and-separate'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=9
   AND tv.edition_slug='canon' AND tv.book_slug='2-corinthians' AND tv.chapter_number=6 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-9-mourning-iniquity
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezra 10:6 — *Then Ezra rose up from before the house of Elohim (God), and went into the chamber of Johanan the son of Eliashib: and when he came thither, he did eat no bread, nor drink water: for he mourned because of the transgression of them that had been carried away.* The chamber of Johanan, the fast from bread and water, the mourning over the captivity''s sin in 1 Esdras 9:1-2 are recorded the same in the canon.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd9_lookup sv, _session253_1esd9_lookup tv
 WHERE t.slug='1-esdras-9-mourning-iniquity'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=10 AND tv.verse_number=6
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Ezra 9:4 — *Then were assembled unto me every one that trembled at the words of the Elohim (God) of Yashar''el (Israel), because of the transgression of those that had been carried away; and I sat astonied until the evening sacrifice.* Esdras'' mourning over the great iniquities in 1 Esdras 9:2 gathers, as Ezra''s did, all who tremble at the word of Elohim.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd9_lookup sv, _session253_1esd9_lookup tv
 WHERE t.slug='1-esdras-9-mourning-iniquity'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezra' AND tv.chapter_number=9 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-9-reading-the-law
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Nehemiah 8:3 — *And he read therein before the street that was before the water gate from the morning until midday, before the men and the women, and those that could understand; and the ears of all the people were attentive unto the book of the law.* The reading from morning to midday before men and women, the multitude giving heed, in 1 Esdras 9:41 is Nehemiah''s broad-place reading exactly.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd9_lookup sv, _session253_1esd9_lookup tv
 WHERE t.slug='1-esdras-9-reading-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=41
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=8 AND tv.verse_number=3
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Nehemiah 8:1 — *And all the people gathered themselves together as one man into the street that was before the water gate; and they spake unto Ezra the scribe to bring the book of the law of Moses, which Yahuah (LORD) had commanded to Yashar''el (Israel).* The whole multitude gathering with one accord and calling for the Law in 1 Esdras 9:38-39 is the same assembly at the water gate.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd9_lookup sv, _session253_1esd9_lookup tv
 WHERE t.slug='1-esdras-9-reading-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=38
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=8 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Deuteronomy 31:12 — *Gather the people together, men, and women, and children, and thy stranger that is within thy gates, that they may hear, and that they may learn, and fear Yahuah Elohaychem (the LORD your God), and observe to do all the words of this law:* Esdras reading the Law to the whole multitude from man to woman in 1 Esdras 9:40 fulfills Moses'' command to gather all Israel to hear the law read aloud.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd9_lookup sv, _session253_1esd9_lookup tv
 WHERE t.slug='1-esdras-9-reading-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=40
   AND tv.edition_slug='canon' AND tv.book_slug='deuteronomy' AND tv.chapter_number=31 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Luke 24:45 — *Then opened he their understanding, that they might understand the scriptures,* The Levites making the people understand the law in 1 Esdras 9:48 foreshadow the risen Messiah opening the understanding of His own to the Scriptures.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd9_lookup sv, _session253_1esd9_lookup tv
 WHERE t.slug='1-esdras-9-reading-the-law'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=48
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=24 AND tv.verse_number=45
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: 1-esdras-9-joy-is-your-strength
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Nehemiah 8:10 — *Then he said unto them, Go your way, eat the fat, and drink the sweet, and send portions unto them for whom nothing is prepared: for this day is holy unto our Lord: neither be ye sorry; for the joy of Yahuah (LORD) is your strength.* Esdras'' charge to eat the fat, drink the sweet, send portions, and be not sorrowful in 1 Esdras 9:51-52 is Nehemiah''s word — and its ground is that the joy of Yahuah is the people''s strength.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd9_lookup sv, _session253_1esd9_lookup tv
 WHERE t.slug='1-esdras-9-joy-is-your-strength'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=52
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=8 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Nehemiah 8:9 — *And Nehemiah, which is the Tirshatha, and Ezra the priest the scribe, and the Levites that taught the people, said unto all the people, This day is holy unto Yahuah Elohaychem (the LORD your God); mourn not, nor weep. For all the people wept, when they heard the words of the law.* The holy day, the weeping at the hearing of the law, and the call to mourn not in 1 Esdras 9:50 are the same scene Nehemiah records.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd9_lookup sv, _session253_1esd9_lookup tv
 WHERE t.slug='1-esdras-9-joy-is-your-strength'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=50
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=8 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Nehemiah 8:12 — *And all the people went their way to eat, and to drink, and to send portions, and to make great mirth, because they had understood the words that were declared unto them.* The multitude going to feast because they understood the words in which they were instructed in 1 Esdras 9:55 closes the scene exactly as Nehemiah does — understanding turned to gladness.'
  FROM cross_reference_threads t, cross_references x, _session253_1esd9_lookup sv, _session253_1esd9_lookup tv
 WHERE t.slug='1-esdras-9-joy-is-your-strength'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='1-esdras' AND sv.chapter_number=9 AND sv.verse_number=55
   AND tv.edition_slug='canon' AND tv.book_slug='nehemiah' AND tv.chapter_number=8 AND tv.verse_number=12
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;


COMMIT;
\echo 'session253 — 1 Esdras cross-references complete.'
