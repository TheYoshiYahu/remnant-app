-- ----- fragment: minion_judith_06.sql (session253 judith 6) -----
-- Source anchor: apocrypha/judith ch6. Targets span Tanakh + NT (canon) + extra-canonical.
-- Tag: jdt6 (view _session253_jdt6_lookup). Sort band base 60125, step 3. Idempotent ON CONFLICT.

CREATE TEMP VIEW _session253_jdt6_lookup AS
SELECT e.slug AS edition_slug, b.slug AS book_slug, c.chapter_number, v.verse_number, v.id AS verse_id
  FROM verses v JOIN chapters c ON v.chapter_id = c.id JOIN books b ON c.book_id = b.id
  JOIN editions e ON b.edition_id = e.id
 WHERE e.slug IN ('canon','enoch','jubilees','jasher','apocrypha','apocrypha-charles-vol1','pseudepigrapha','adam-eve-conflict','apocalypse-of-abraham','ascension-isaiah','sonnini-acts-29','josephus','lightfoot-apostolic-fathers','mrjames-apocryphal-nt');

WITH input(src_edition, src_slug, src_ch, src_v,
           tgt_edition, tgt_slug, tgt_ch, tgt_v, tier, note) AS (VALUES
  -- thread: judith-6-who-is-yahuah-but-the-king
  ('apocrypha', 'judith', 6, 2, 'canon', 'ezekiel', 28, 2, 'free', E'Ezekiel 28:2 — *Son of Adam, say unto the prince of Tyrus, Thus saith Adonai Yahuah (the Lord GOD); Because thine heart is lifted up, and thou hast said, I am a Elohim (God), I sit in the seat of Elohim (God), in the midst of the seas; yet thou art a man, and not Elohim (God), though thou set thine heart as the heart of Elohim (God):* Holofernes'' boast that Nabuchodonosor alone is Yahuah is the prince of Tyrus'' lifted-up heart wearing an Assyrian crown.'),
  ('apocrypha', 'judith', 6, 2, 'canon', 'isaiah', 14, 13, 'free', E'Isaiah 14:13 — *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation, in the sides of the north:* the question "who is Yahuah but Nabuchodonosor?" is the morning-star''s secret ambition spoken aloud before the nations.'),
  ('apocrypha', 'judith', 6, 4, 'canon', '2-thessalonians', 2, 4, 'free', E'2 Thessalonians 2:4 — *Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God).* "Lord of all the earth" whose words shall not be in vain is the same man-of-sin pattern that runs to its last revealing.'),
  -- thread: judith-6-the-witness-cast-out
  ('apocrypha', 'judith', 6, 5, 'canon', 'jeremiah', 26, 11, 'free', E'Jeremiah 26:11 — *Then spake the priests and the prophets unto the princes and to all the people, saying, This man is worthy to die; for he hath prophesied against this city, as ye have heard with your ears.* Achior, doomed for prophesying against the camp of Assur, stands where Yirmeyahu stood when the powers judged the true witness worthy to die.'),
  ('apocrypha', 'judith', 6, 5, 'canon', 'jeremiah', 26, 15, 'free', E'Jeremiah 26:15 — *But know ye for certain, that if ye put me to death, ye shall surely bring innocent blood upon yourselves, and upon this city, and upon the inhabitants thereof: for of a truth Yahuah (LORD) hath sent me unto you to speak all these words in your ears.* The witness Holofernes condemns carries innocent blood; the tyrant who silences him answers for it as surely as Yahudah''s princes would.'),
  ('apocrypha', 'judith', 6, 13, 'canon', 'matthew', 5, 10, 'free', E'Matthew 5:10 — *Blessed are they which are persecuted for righteousness'' sake: for theirs is the kingdom of heaven.* Achior bound and cast down at the foot of the hill for telling the truth is the persecuted-for-righteousness the kingdom of heaven calls blessed.'),
  ('apocrypha', 'judith', 6, 5, 'canon', 'psalms', 34, 19, 'free', E'Psalm 34:19 — *Many are the afflictions of the righteous: but Yahuah (LORD) delivereth him out of them all.* The sentence of death on the righteous witness is real, but it is not the last word — the deliverance of the afflicted righteous is.'),
  -- thread: judith-6-the-remnant-receives-the-witness
  ('apocrypha', 'judith', 6, 18, 'canon', '2-kings', 19, 15, 'free', E'2 Kings 19:15 — *And Hezekiah prayed before Yahuah (LORD), and said, O Yahuah Elohim (LORD God) of Yashar''el (Israel), which dwellest between the cherubims, thou art the Elohim (God), even thou alone, of all the kingdoms of the earth; thou hast made heaven and earth.* Bethulia''s people falling down before Yahuah against the king who claimed to be Yahuah is Hizqiyahu answering Assyria''s blasphemy with "thou alone."'),
  ('apocrypha', 'judith', 6, 19, 'canon', 'psalms', 9, 9, 'free', E'Psalm 9:9 — *Yahuah (LORD) also will be a refuge for the oppressed, a refuge in times of trouble.* The prayer pitying "the low estate of our nation" appeals to the One who is by nature the refuge of the oppressed in their hour of trouble.'),
  ('apocrypha', 'judith', 6, 20, 'canon', 'matthew', 5, 11, 'free', E'Matthew 5:11 — *Blessed are ye, when men shall revile you, and persecute you, and shall say all manner of evil against you falsely, for my sake.* The reviled witness, comforted and greatly praised by the people who received him, is shown to be among the blessed and not the cursed.'),
  -- thread: judith-6-the-weak-confound-the-mighty
  ('apocrypha', 'judith', 6, 3, 'canon', 'exodus', 15, 1, 'free', E'Exodus 15:1 — *Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD), and spake, saying, I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea.* Holofernes trusts the power of his horses against a nation "that came out of Egypt" — the very nation whose song is that Yahuah threw horse and rider into the sea.'),
  ('apocrypha', 'judith', 6, 4, 'canon', 'luke', 1, 51, 'free', E'Luke 1:51 — *He hath shewed strength with his arm; he hath scattered the proud in the imagination of their hearts.* The boast "none of my words shall be in vain" is exactly the imagination of the proud that Yahuah''s arm scatters — and Miryam''s song is daughter to Judith''s own.'),
  ('apocrypha', 'judith', 6, 3, 'canon', 'daniel', 3, 17, 'free', E'Daniel 3:17 — *If it be so, our Elohim (God) whom we serve is able to deliver us from the burning fiery furnace, and he will deliver us out of thine hand, O king.* Against the same Nebuchadnezzar who asks "who is Yahuah but the king?", the three Hebrews give the remnant''s answer — our Elohim is able to deliver us out of thine hand.')
)
INSERT INTO cross_references (source_verse_id, target_verse_id, source, note, tier_required)
SELECT sv.verse_id, tv.verse_id, 'manual', i.note, i.tier::content_tier
  FROM input i
  JOIN _session253_jdt6_lookup sv ON sv.edition_slug=i.src_edition AND sv.book_slug=i.src_slug AND sv.chapter_number=i.src_ch AND sv.verse_number=i.src_v
  JOIN _session253_jdt6_lookup tv ON tv.edition_slug=i.tgt_edition AND tv.book_slug=i.tgt_slug AND tv.chapter_number=i.tgt_ch AND tv.verse_number=i.tgt_v
 WHERE sv.verse_id <> tv.verse_id
ON CONFLICT (source_verse_id, target_verse_id, source) DO NOTHING;

-- ----- threads -----
INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-6-who-is-yahuah-but-the-king',
       E'Who is Yahuah but the king? — the tyrant who makes himself Elohim',
       E'Holofernes flings the kingdom-of-man''s whole blasphemy in a single line: *And who are you, Achior, and the hirelings of Ephraim, that you have prophesied against us as to day, and have said, that we should not make war with the people of Yashar''el (Israel), because their Elohim (God) will defend them? and who is Yahuah (God) but Nabuchodonosor?* (Judith 6:2). The man on the throne does not merely defy the Most High; he proposes to *replace* Him — *says king Nabuchodonosor, lord of all the earth: for he said, None of my words shall be in vain* (Judith 6:4). It Ain''t New. This is the oldest sin in the seat of power. The prince of Tyrus wore it first: *Son of Adam, say unto the prince of Tyrus, Thus saith Adonai Yahuah (the Lord GOD); Because thine heart is lifted up, and thou hast said, I am a Elohim (God)... yet thou art a man, and not Elohim (God)* (Ezekiel 28:2). The morning-star said it in his heart: *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God)... I will be like the El Elyon (most High)* (Isaiah 14:13). And Sha''ul shows the pattern run to its end in the last man of sin: *Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God)* (2 Thessalonians 2:4). Nebuchadnezzar is not an exception in Judith; he is the SYSTEM — the empire that demands to be worshipped as deity. The dismantling is of the throne, not merely the man.',
       sv.verse_id, ev.verse_id, 'extras', 60125
  FROM _session253_jdt6_lookup sv, _session253_jdt6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=2
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=6 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-6-the-witness-cast-out',
       E'The true witness threatened — Achior cast out for his testimony',
       E'Achior told the council the truth — that Yahuah defends His people — and for it Holofernes condemns him to share Yashar''el''s destruction: *And you, Achior, an hireling of Ammon, which have spoken these words in the day of your iniquity, shall see my face no more from this day, until I take vengeance of this nation that came out of Egypt* (Judith 6:5). The truth-teller is bound and cast down at the foot of the hill (Judith 6:13). It Ain''t New: the despised witness who speaks Yahuah''s word against the powers is always threatened with death. Yirmeyahu stood in the very same place: *Then spake the priests and the prophets unto the princes and to all the people, saying, This man is worthy to die; for he hath prophesied against this city, as ye have heard with your ears* (Jeremiah 26:11). And the prophet answered as Achior''s testimony answers — placing himself wholly in their hands while warning that innocent blood is no light thing: *As for me, behold, I am in your hand: do with me as seemeth good and meet unto you* (Jeremiah 26:14); *But know ye for certain, that if ye put me to death, ye shall surely bring innocent blood upon yourselves* (Jeremiah 26:15). The Master sealed the line on the mount: *Blessed are they which are persecuted for righteousness'' sake: for theirs is the kingdom of heaven* (Matthew 5:10). The afflicted witness is not abandoned: *Many are the afflictions of the righteous: but Yahuah (LORD) delivereth him out of them all* (Psalm 34:19).',
       sv.verse_id, ev.verse_id, 'extras', 60128
  FROM _session253_jdt6_lookup sv, _session253_jdt6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=5
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=6 AND ev.verse_number=13
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-6-the-remnant-receives-the-witness',
       E'The remnant receives the despised truth-teller',
       E'What the empire casts out, the faithful remnant takes up. The Israelites come down, loose the bound man, and bring him in: *But the Israelites descended from their city, and came to him, and loosed him, and brought him to Bethulia, and presented him to the governors of the city* (Judith 6:14). And hearing his report of the tyrant''s pride, they do the one thing Holofernes forbade — they fall down and worship the true Yahuah, not the king who claimed His name: *Then the people fell down and worshipped Yahuah (God), and cried to Yahuah (God). saying* (Judith 6:18); *O Yahuah (God) of heaven, behold their pride, and pity the low estate of our nation, and look upon the face of those that are sanctified to you this day* (Judith 6:19). It Ain''t New. This is Hizqiyahu spreading Sennacherib''s blasphemous letter before the throne: *And Hezekiah prayed before Yahuah (LORD), and said, O Yahuah Elohim (LORD God) of Yashar''el (Israel), which dwellest between the cherubims, thou art the Elohim (God), even thou alone, of all the kingdoms of the earth; thou hast made heaven and earth* (2 Kings 19:15) — answering the empire''s "who is Yahuah but the king?" with "thou alone." The cry of the low estate is the cry He has always heard: *Yahuah (LORD) also will be a refuge for the oppressed, a refuge in times of trouble* (Psalm 9:9). And the receiving of the cast-out witness, comforted and praised by the people he came to (Judith 6:20), is the welcome the remnant always gives those persecuted for the word: *Blessed are ye, when men shall revile you, and persecute you, and shall say all manner of evil against you falsely, for my sake* (Matthew 5:11).',
       sv.verse_id, ev.verse_id, 'extras', 60131
  FROM _session253_jdt6_lookup sv, _session253_jdt6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=14
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=6 AND ev.verse_number=21
ON CONFLICT (slug) DO NOTHING;

INSERT INTO cross_reference_threads (slug, title, summary_md, anchor_verse_id_start, anchor_verse_id_end, tier_required, sort_order)
SELECT 'judith-6-the-weak-confound-the-mighty',
       E'The horse and his rider — the mighty confounded by election',
       E'Holofernes'' confidence rests wholly on cavalry and numbers: *For with them we will tread them under foot, and their mountains shall be drunken with their blood... for they shall utterly perish* (Judith 6:4); *they are not able to sustain the power of our horses* (Judith 6:3). The whole drama of Judith answers this boast — that Yahuah delivers Yashar''el not by horses but by His own arm and election, often through the weak. It Ain''t New. The song at the sea already buried the horse: *Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD), and spake, saying, I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea* (Exodus 15:1). The proud are scattered not by stronger armies but by His arm: *He hath shewed strength with his arm; he hath scattered the proud in the imagination of their hearts* (Luke 1:51) — Miryam''s Magnificat, which itself echoes Judith''s own song. And when the same Nebuchadnezzar threatened the furnace, three Hebrews gave the only answer the tyrant-as-god ever earns: *If it be so, our Elohim (God) whom we serve is able to deliver us from the burning fiery furnace, and he will deliver us out of thine hand, O king* (Daniel 3:17). The power of the horses is real and it is nothing.',
       sv.verse_id, ev.verse_id, 'extras', 60134
  FROM _session253_jdt6_lookup sv, _session253_jdt6_lookup ev
 WHERE sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=3
   AND ev.edition_slug='apocrypha' AND ev.book_slug='judith' AND ev.chapter_number=6 AND ev.verse_number=4
ON CONFLICT (slug) DO NOTHING;

-- ----- thread_members -----
-- members: judith-6-who-is-yahuah-but-the-king
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Ezekiel 28:2 — *Son of Adam, say unto the prince of Tyrus, Thus saith Adonai Yahuah (the Lord GOD); Because thine heart is lifted up, and thou hast said, I am a Elohim (God), I sit in the seat of Elohim (God), in the midst of the seas; yet thou art a man, and not Elohim (God), though thou set thine heart as the heart of Elohim (God):* Holofernes'' boast that Nabuchodonosor alone is Yahuah is the prince of Tyrus'' lifted-up heart wearing an Assyrian crown.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt6_lookup sv, _session253_jdt6_lookup tv
 WHERE t.slug='judith-6-who-is-yahuah-but-the-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='ezekiel' AND tv.chapter_number=28 AND tv.verse_number=2
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Isaiah 14:13 — *For thou hast said in thine heart, I will ascend into heaven, I will exalt my throne above the stars of Elohim (God): I will sit also upon the mount of the congregation, in the sides of the north:* the question "who is Yahuah but Nabuchodonosor?" is the morning-star''s secret ambition spoken aloud before the nations.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt6_lookup sv, _session253_jdt6_lookup tv
 WHERE t.slug='judith-6-who-is-yahuah-but-the-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=2
   AND tv.edition_slug='canon' AND tv.book_slug='isaiah' AND tv.chapter_number=14 AND tv.verse_number=13
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'2 Thessalonians 2:4 — *Who opposeth and exalteth himself above all that is called Elohim (God), or that is worshipped; so that he as Elohim (God) sitteth in the temple of Elohim (God), shewing himself that he is Elohim (God).* "Lord of all the earth" whose words shall not be in vain is the same man-of-sin pattern that runs to its last revealing.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt6_lookup sv, _session253_jdt6_lookup tv
 WHERE t.slug='judith-6-who-is-yahuah-but-the-king'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='2-thessalonians' AND tv.chapter_number=2 AND tv.verse_number=4
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-6-the-witness-cast-out
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Jeremiah 26:11 — *Then spake the priests and the prophets unto the princes and to all the people, saying, This man is worthy to die; for he hath prophesied against this city, as ye have heard with your ears.* Achior, doomed for prophesying against the camp of Assur, stands where Yirmeyahu stood when the powers judged the true witness worthy to die.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt6_lookup sv, _session253_jdt6_lookup tv
 WHERE t.slug='judith-6-the-witness-cast-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=26 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Jeremiah 26:15 — *But know ye for certain, that if ye put me to death, ye shall surely bring innocent blood upon yourselves, and upon this city, and upon the inhabitants thereof: for of a truth Yahuah (LORD) hath sent me unto you to speak all these words in your ears.* The witness Holofernes condemns carries innocent blood; the tyrant who silences him answers for it as surely as Yahudah''s princes would.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt6_lookup sv, _session253_jdt6_lookup tv
 WHERE t.slug='judith-6-the-witness-cast-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='jeremiah' AND tv.chapter_number=26 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 5:10 — *Blessed are they which are persecuted for righteousness'' sake: for theirs is the kingdom of heaven.* Achior bound and cast down at the foot of the hill for telling the truth is the persecuted-for-righteousness the kingdom of heaven calls blessed.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt6_lookup sv, _session253_jdt6_lookup tv
 WHERE t.slug='judith-6-the-witness-cast-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=13
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=10
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 4, E'Psalm 34:19 — *Many are the afflictions of the righteous: but Yahuah (LORD) delivereth him out of them all.* The sentence of death on the righteous witness is real, but it is not the last word — the deliverance of the afflicted righteous is.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt6_lookup sv, _session253_jdt6_lookup tv
 WHERE t.slug='judith-6-the-witness-cast-out'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=5
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=34 AND tv.verse_number=19
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-6-the-remnant-receives-the-witness
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'2 Kings 19:15 — *And Hezekiah prayed before Yahuah (LORD), and said, O Yahuah Elohim (LORD God) of Yashar''el (Israel), which dwellest between the cherubims, thou art the Elohim (God), even thou alone, of all the kingdoms of the earth; thou hast made heaven and earth.* Bethulia''s people falling down before Yahuah against the king who claimed to be Yahuah is Hizqiyahu answering Assyria''s blasphemy with "thou alone."'
  FROM cross_reference_threads t, cross_references x, _session253_jdt6_lookup sv, _session253_jdt6_lookup tv
 WHERE t.slug='judith-6-the-remnant-receives-the-witness'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=18
   AND tv.edition_slug='canon' AND tv.book_slug='2-kings' AND tv.chapter_number=19 AND tv.verse_number=15
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Psalm 9:9 — *Yahuah (LORD) also will be a refuge for the oppressed, a refuge in times of trouble.* The prayer pitying "the low estate of our nation" appeals to the One who is by nature the refuge of the oppressed in their hour of trouble.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt6_lookup sv, _session253_jdt6_lookup tv
 WHERE t.slug='judith-6-the-remnant-receives-the-witness'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=19
   AND tv.edition_slug='canon' AND tv.book_slug='psalms' AND tv.chapter_number=9 AND tv.verse_number=9
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Matthew 5:11 — *Blessed are ye, when men shall revile you, and persecute you, and shall say all manner of evil against you falsely, for my sake.* The reviled witness, comforted and greatly praised by the people who received him, is shown to be among the blessed and not the cursed.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt6_lookup sv, _session253_jdt6_lookup tv
 WHERE t.slug='judith-6-the-remnant-receives-the-witness'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=20
   AND tv.edition_slug='canon' AND tv.book_slug='matthew' AND tv.chapter_number=5 AND tv.verse_number=11
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

-- members: judith-6-the-weak-confound-the-mighty
INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 1, E'Exodus 15:1 — *Then sang Moses and the children of Yashar''el (Israel) this song unto Yahuah (LORD), and spake, saying, I will sing unto Yahuah (LORD), for he hath triumphed gloriously: the horse and his rider hath he thrown into the sea.* Holofernes trusts the power of his horses against a nation "that came out of Egypt" — the very nation whose song is that Yahuah threw horse and rider into the sea.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt6_lookup sv, _session253_jdt6_lookup tv
 WHERE t.slug='judith-6-the-weak-confound-the-mighty'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='exodus' AND tv.chapter_number=15 AND tv.verse_number=1
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 2, E'Luke 1:51 — *He hath shewed strength with his arm; he hath scattered the proud in the imagination of their hearts.* The boast "none of my words shall be in vain" is exactly the imagination of the proud that Yahuah''s arm scatters — and Miryam''s song is daughter to Judith''s own.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt6_lookup sv, _session253_jdt6_lookup tv
 WHERE t.slug='judith-6-the-weak-confound-the-mighty'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=4
   AND tv.edition_slug='canon' AND tv.book_slug='luke' AND tv.chapter_number=1 AND tv.verse_number=51
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

INSERT INTO cross_reference_thread_members (thread_id, cross_reference_id, sort_order, member_note)
SELECT t.id, x.id, 3, E'Daniel 3:17 — *If it be so, our Elohim (God) whom we serve is able to deliver us from the burning fiery furnace, and he will deliver us out of thine hand, O king.* Against the same Nebuchadnezzar who asks "who is Yahuah but the king?", the three Hebrews give the remnant''s answer — our Elohim is able to deliver us out of thine hand.'
  FROM cross_reference_threads t, cross_references x, _session253_jdt6_lookup sv, _session253_jdt6_lookup tv
 WHERE t.slug='judith-6-the-weak-confound-the-mighty'
   AND sv.edition_slug='apocrypha' AND sv.book_slug='judith' AND sv.chapter_number=6 AND sv.verse_number=3
   AND tv.edition_slug='canon' AND tv.book_slug='daniel' AND tv.chapter_number=3 AND tv.verse_number=17
   AND x.source_verse_id=sv.verse_id AND x.target_verse_id=tv.verse_id AND x.source='manual'
ON CONFLICT (thread_id, cross_reference_id) DO NOTHING;

