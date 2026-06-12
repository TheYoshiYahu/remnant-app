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

